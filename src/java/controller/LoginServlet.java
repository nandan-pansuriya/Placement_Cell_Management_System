package controller;

import dao.UserDAO;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Read form data
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 2. Call DAO
        UserDAO userDAO = new UserDAO();
        User user = userDAO.validateUser(username, password);

        // 3. Check result
        if (user != null) {
            // Create session
            HttpSession session = request.getSession();
            session.setAttribute("loggedUser", user);

            // Redirect based on role
            if ("STUDENT".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect("jsp/student/studentDashboard.jsp");
            } else if ("OFFICER".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect("jsp/officer/officerDashboard.jsp");
            } else {
                // Unknown role
                response.sendRedirect("jsp/auth/login.jsp?error=role");
            }

        } else {
            // Invalid login
            response.sendRedirect("jsp/auth/login.jsp?error=invalid");
        }
    }
}