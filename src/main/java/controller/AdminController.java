package controller;

import model.CartItem;
import model.Category;
import model.Product;
import model.User;
import service.CartItemService;
import service.CategoryService;
import service.ProductService;
import service.UserService;
import service.impl.CartItemServiceImpl;
import service.impl.CategoryServiceImpl;
import service.impl.ProductServiceImpl;
import service.impl.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminController", urlPatterns = "/admin")
public class AdminController extends HttpServlet {
    CategoryService categoryService = new CategoryServiceImpl();
    CartItemService cartItemService = new CartItemServiceImpl();
    ProductService productService = new ProductServiceImpl();
    UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("ac");
        if(action == null){
            action = "";
        }
        switch (action) {
            case "add_cate":
                showFormAddCate(request, response);
                break;
            case "delete_cate":
                deleteCategory(request, response);
                break;
            case "edit_cate":
                showFormEditCate(request, response);
                break;
            case "list_cate":
                showAllCategory(request, response);
                break;
            case "order_delete":
                deleteOrder(request, response);
                break;
            case "order_list":
                showAllOrderList(request, response);
                break;
            case "add_product":
                showFormAddProduct(request, response);
                break;
            case "delete_product":
                deleteProduct(request, response);
                break;
            case "edit_product":
                showFormEditProduct(request, response);
                break;
            case "list_product":
                showAllProductList(request,response);
                break;
            case "add_user":
                showFormAddUser(request,response);
                break;
            case "delete_user":
                deleteUser(request,response);
                break;
            case "edit_user":
                showFormEditUser(request,response);
                break;
            case "list_user":
                showAllUser(request,response);
                break;
            default:
                showDashboard(request, response);
                break;
        }
    }

    private void showAllUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList = userService.getAll();
        request.setAttribute("userList",userList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("View/Admin/View/ListUser.jsp");
        dispatcher.forward(request,response);
    }

    private void showFormEditUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.get(id);
        request.setAttribute("user",user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("View/Admin/View/EditUser.jsp");
        dispatcher.forward(request,response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        userService.delete(Integer.parseInt(request.getParameter("id")));
        response.sendRedirect("/admin?ac=list_user");
    }

    private void showFormAddUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("View/Admin/View/AddUser.jsp");
    }

    private void showAllProductList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = productService.getAll();
        request.setAttribute("products", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("");
        dispatcher.forward(request,response);
    }

    private void showFormEditProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Product product = productService.get(Integer.parseInt(request.getParameter("id")));
        List<Category> categories = categoryService.getAll();
        request.setAttribute("categories", categories);
        request.setAttribute("product", product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("");
        dispatcher.forward(request, response);
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        productService.delete(Integer.parseInt(request.getParameter("id")));
        response.sendRedirect(request.getContextPath() + "");
    }

    private void showFormAddProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> categories = categoryService.getAll();
        request.setAttribute("categories", categories);
        RequestDispatcher dispatcher = request.getRequestDispatcher("");
        dispatcher.forward(request, response);
    }

    private void showAllOrderList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CartItem> cartItemList = cartItemService.getAll();
        request.setAttribute("cartItemList", cartItemList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("");
        dispatcher.forward(request, response);
    }

    private void deleteOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        cartItemService.delete(id);
        response.sendRedirect(request.getContextPath() + "");
    }

    private void showDashboard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("View/Admin/View/Index.jsp");
        dispatcher.forward(request, response);
    }

    private void showAllCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> categoryList = categoryService.getAll();
        request.setAttribute("categoryList", categoryList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("");
        dispatcher.forward(request, response);
    }

    private void showFormEditCate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Category category = categoryService.get(id);
        request.setAttribute("category", category);
        RequestDispatcher dispatcher = request.getRequestDispatcher("");
        dispatcher.forward(request, response);
    }

    private void deleteCategory(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        categoryService.delete(id);
        response.sendRedirect("");
    }

    private void showFormAddCate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("ac");
        if(action == null){
            action = "";
        }
        switch (action) {
            case "add_cate":
                addCategory(request, response);
                break;
            case "edit_cate":
                editCategory(request, response);
                break;
            case "add_product":
                addProduct(request, response);
                break;
            case "edit_product":
                editProduct(request, response);
                break;
            case "add_user":
                addUser(request,response);
                break;
            case "edit_user":
                editUser(request,response);
                break;
            default:
                showDashboard(request, response);
                break;
        }
    }

    private void editUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id")) ;
        User user = userService.get(id);
        user.setUsername(request.getParameter("username"));
        user.setEmail(request.getParameter("email"));
        user.setPassword(request.getParameter("password"));
        String role = request.getParameter("role_id");
        if(role.equals("Admin")){
            user.setRoleId(1);
        } else if (role.equals("User")){
            user.setRoleId(0);
        }
        user.setAvatar("/View/Img/"+ request.getParameter("avatar"));
        userService.edit(user);
        response.sendRedirect("/admin?ac=list_user");
    }

    private void addUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = new User();
        user.setUsername(request.getParameter("username"));
        user.setEmail(request.getParameter("email"));
        user.setPassword(request.getParameter("password"));
        String role = request.getParameter("role_id");
        if(role.equals("Admin")){
            user.setRoleId(1);
        } else if (role.equals("User")){
            user.setRoleId(0);
        }
        user.setAvatar("/View/Img/"+ request.getParameter("avatar"));
        userService.insert(user);
        response.sendRedirect("/admin?ac=list_user");
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Product product = new Product();
        product.setId(Integer.parseInt(request.getParameter("id_product")));
        product.setName(request.getParameter("name_product"));
        product.setPrice(Float.parseFloat(request.getParameter("price_product")));
        product.setDes(request.getParameter("des"));
        product.setImage(request.getParameter("image"));
        product.setCategory(categoryService.get(Integer.parseInt(request.getParameter("id_cate"))));
        productService.edit(product);
        response.sendRedirect(request.getContextPath() + "");
    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Product product = new Product();
        product.setName(request.getParameter("name_product"));
        product.setPrice(Float.parseFloat(request.getParameter("price_product")));
        product.setCategory(categoryService.get(Integer.parseInt(request.getParameter("id_cate"))));
        product.setDes(request.getParameter("des_product"));
        product.setImage(request.getParameter("image"));
        productService.insert(product);
        response.sendRedirect("");
    }

    private void editCategory(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Category category = new Category();
        category.setId(Integer.parseInt(request.getParameter("id")));
        category.setName(request.getParameter("name"));
        categoryService.edit(category);
        response.sendRedirect("");
    }

    private void addCategory(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name_cate");
        Category category = new Category();
        category.setName(name);
        categoryService.insert(category);
        response.sendRedirect("");
    }

}
