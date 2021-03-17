package controller;

import model.User;
import service.*;
import service.impl.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

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
        switch (action){
            case "home":
                showHomePage(request, response);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void showHomePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("View/Client/View/Index.jsp");
    }

}
