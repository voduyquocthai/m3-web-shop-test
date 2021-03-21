package controller;

import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "WaitingController", urlPatterns = "/waiting")
public class WaitingController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        request.setAttribute("username", user.getUsername());
        if(user.getRoleId()==1){
            response.sendRedirect("/admin");
        } else {
            response.sendRedirect("/user?ac=home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        request.setAttribute("username", user.getUsername());
        if(user.getRoleId()==1){
            request.getRequestDispatcher("/admin").forward(request, response);
        } else {
            request.getRequestDispatcher("/user?ac=home").forward(request, response);
        }

    }
}
