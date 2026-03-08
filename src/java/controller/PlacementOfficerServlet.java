/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.PlacementOfficerDAO;
import model.User;
import model.PlacementOfficer;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/PlacementOfficerServlet")
public class PlacementOfficerServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("profile".equals(action)) {

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("loggedUser");

            PlacementOfficerDAO dao = new PlacementOfficerDAO();
            PlacementOfficer officer = dao.getOfficerByUserId(user.getUserId());

            request.setAttribute("officer", officer);

            request.getRequestDispatcher("/jsp/PlacementOfficer/profile.jsp")
                   .forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int officerId = Integer.parseInt(request.getParameter("officerId"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        PlacementOfficer officer = new PlacementOfficer();
        officer.setOfficerId(officerId);
        officer.setName(name);
        officer.setEmail(email);
        officer.setPhone(phone);

        PlacementOfficerDAO dao = new PlacementOfficerDAO();

        boolean result = dao.updateOfficer(officer);

        if (result) {
            request.setAttribute("message", "Profile updated successfully!");
            request.setAttribute("messageType", "success");
        } else {
            request.setAttribute("message", "Update failed.");
            request.setAttribute("messageType", "error");
        }

        request.setAttribute("officer", officer);

        request.getRequestDispatcher("/jsp/PlacementOfficer/profile.jsp")
               .forward(request, response);
    }
}