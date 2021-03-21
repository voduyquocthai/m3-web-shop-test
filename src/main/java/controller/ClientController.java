package controller;

import model.*;
import service.*;
import service.impl.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ClientController", urlPatterns = "/user")
public class ClientController extends HttpServlet {
    CartService cartService = new CartServiceImpl();
    CartItemService cartItemService = new CartItemServiceImpl();
    CategoryService categoryService = new CategoryServiceImpl();
    ProductService productService = new ProductServiceImpl();
    UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("ac");
        if(action == null ){
            action = "";
        }
        switch (action){
            case "addItem":
                addProductIntoCart(request, response);
                break;
            case "cartView":
                viewListItem(request, response);
                break;
            case "removeItem":
                deleteItem(request, response);
                break;
            case "login":
                showLoginForm(request, response);
                break;
            case "register":
                response.sendRedirect("login");
                break;
            case "logout":
                logout(request, response);
                break;
            case "my_account":
                viewInfo(request, response);
                break;
            case "order":
                addCart(request, response);
                break;
            case "product_detail":
                viewInfoProduct(request, response);
                break;
            case "list_product":
                showAllProductClient(request, response);
                break;
            case "search_product_by_cate":
                searchProductByCate(request, response);
                break;
            case "search_product_by_name":
                searchProductByName(request, response);
                break;
            default:
                showHomePage(request, response);
                break;
        }

    }
    private void showLoginForm(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("View/Client/View/SignIn.jsp");
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        response.sendRedirect("user?ac=home");
    }

    private void searchProductByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("search");
        List<Product> productList = productService.searchByName(keyword);
        request.setAttribute("productList", productList);
        request.getRequestDispatcher("").forward(request, response);
    }

    private void searchProductByCate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int cate_id = Integer.parseInt(request.getParameter("cate_id"));
        List<Product> productList = productService.searchByCategory(cate_id);
        request.setAttribute("productListCate", productList);
        request.getRequestDispatcher("").forward(request, response);
    }

    private void showAllProductClient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.getAll();
        request.setAttribute("productList", productList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("");
        dispatcher.forward(request, response);
    }

    private void viewInfoProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Product product = productService.get(Integer.parseInt(id));
        List<Category> categories = categoryService.getAll();
        request.setAttribute("categories", categories);
        request.setAttribute("product", product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("");
        dispatcher.forward(request, response);
    }

    private void addCart(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        User user = userService.get(username);
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        Cart cart = new Cart();
        cart.setUser(user);
        cart.setBuyDate(date);
        cartService.insert(cart);
    }

    private void viewInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        User user = userService.get(id);
        request.setAttribute("user", user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("");
        dispatcher.forward(request, response);
    }

    private void deleteItem(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String pId = request.getParameter("pId");
        HttpSession httpSession = request.getSession();
        Object obj = httpSession.getAttribute("cart");
        if(obj != null){
            Map<Integer, CartItem> map = (Map<Integer, CartItem>) obj;
            map.remove(Integer.parseInt(pId));
            httpSession.setAttribute("cart", map);
        }
        response.sendRedirect("/user?ac=cartView");
    }

    private void viewListItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/View/Client/View/ListCart.jsp");
        dispatcher.forward(request, response);
    }

    private void addProductIntoCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String pId = request.getParameter("pId");
        int quantity = 1;
        Product product = productService.get(Integer.parseInt(pId));
        CartItem cartItem = new CartItem();
        cartItem.setProduct(product);
        cartItem.setUnitPrice(product.getPrice());
        cartItem.setQuantity(quantity);
        HttpSession httpSession = request.getSession();
        Object obj = httpSession.getAttribute("cart");
        if(obj == null){
            Map<Integer, CartItem> map = new HashMap<>();
            map.put(cartItem.getProduct().getId(), cartItem);
            httpSession.setAttribute("cart", map);
        } else {
            Map<Integer, CartItem> map = extracted(obj);
            CartItem existedCartItem = map.get(Integer.parseInt(pId));
            if (existedCartItem == null){
                map.put(cartItem.getProduct().getId(), cartItem);
            } else {
                existedCartItem.setQuantity(existedCartItem.getQuantity() + quantity);
            }
            httpSession.setAttribute("cart", map);
        }
        response.sendRedirect("/user?ac=cartView");
    }
    @SuppressWarnings("unchecked")
    private Map<Integer, CartItem> extracted(Object obj) {
        return (Map<Integer, CartItem>) obj;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("ac");
        switch (action) {
            case "login":
                login(request, response);
                break;
            case "my_account":
                editAccount(request, response);
                break;
            case "register":
                addNew(request, response);
                break;
            case "home":
                showHomePage(request, response);
                break;
            default:
                showHomePage(request, response);
                break;
        }
    }

    private void addNew(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String message;
        if (userService.checkExistEmail(email)) {
            message = "Email already exist!";
            request.setAttribute("message", message);
            request.getRequestDispatcher("/View/Client/View/SignIn.jsp").forward(request, response);
        }
        if (userService.checkExistUsername(username)) {
            message = "Username already exist!";
            request.setAttribute("message", message);
            request.getRequestDispatcher("/View/Client/View/SignIn.jsp").forward(request, response);
        }

        boolean isSuccess = userService.register(email, password, username);

        if (isSuccess) {
            User user = userService.get(username);
            message = "Successful Registration!";
            request.setAttribute("message", message);
            request.getRequestDispatcher("/View/Client/View/SignIn.jsp").forward(request , response);
        } else {
            message = "System error!";
            request.setAttribute("message", message);
            request.getRequestDispatcher("/View/Client/View/SignIn.jsp").forward(request, response);
        }
    }

    private void editAccount(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = new User();
        int id = Integer.parseInt(request.getParameter("id"));
        user.setId(id);
        user.setUsername(request.getParameter("username"));
        user.setPassword(request.getParameter("password"));
        user.setEmail(request.getParameter("email"));
        user.setRoleId(Integer.parseInt(request.getParameter("role_id")));
        user.setAvatar(request.getParameter("avatar"));
        userService.edit(user);
        response.sendRedirect("");
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String pass = request.getParameter("password");
        String message;
        if (username == null || pass == null) {
            message = "Username and password can't be empty!";
            request.setAttribute("message", message);
            request.getRequestDispatcher("/View/Client/View/SignIn.jsp").forward(request, response);
        }

        User user = userService.login(username, pass);
        if (user != null) {
            HttpSession session = request.getSession(true);
            session.setAttribute("user", user);
            response.sendRedirect("/waiting");
        } else {
            message = "Username or password isn't correct";
            request.setAttribute("message", message);
            request.getRequestDispatcher("/View/Client/View/SignIn.jsp").forward(request, response);
        }
    }

    private void showHomePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = productService.getAll();
        request.setAttribute("products", products);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("View/Client/View/Index.jsp");
        requestDispatcher.forward(request, response);
    }

}
