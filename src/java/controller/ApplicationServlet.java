/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ApplicationDAO;
import model.Application;
import java.util.List;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ApplicationServlet")
public class ApplicationServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("list".equals(action)) {

            ApplicationDAO dao = new ApplicationDAO();
            List<Application> list = dao.getAllApplications();

            request.setAttribute("applications", list);

            request.getRequestDispatcher("/jsp/PlacementOfficer/viewApplications.jsp")
                    .forward(request, response);
        } 
        else if ("updateStatus".equals(action)) {

            int applicationId = Integer.parseInt(request.getParameter("id"));
            String status = request.getParameter("status");

            ApplicationDAO dao = new ApplicationDAO();
            dao.updateStatus(applicationId, status);

            response.sendRedirect("ApplicationServlet?action=list");
        }
    }
}
