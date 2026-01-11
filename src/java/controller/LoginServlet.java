package controller;

import dao.UserDAO;
import model.User;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException {

        String matric = req.getParameter("matric");
        String password = req.getParameter("password");

        UserDAO dao = new UserDAO();
        User user = dao.login(matric, password);

        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);

            if (user.getRole().equals("admin"))
                res.sendRedirect("admin_dashboard.jsp");
            else
                res.sendRedirect("voter_dashboard.jsp");
        } else {
            res.sendRedirect("login.jsp?error=1");
        }
    }
}
