package controller;

import dao.CompanyDAO;
import model.Company;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/CompanyServlet")
public class CompanyServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Get form data
        String companyName = request.getParameter("companyName");
        String location = request.getParameter("location");
        String hrName = request.getParameter("hrName");
        String hrEmail = request.getParameter("hrEmail");
        String hrPhone = request.getParameter("hrPhone");

        // 2. Create Company object
        Company company = new Company();
        company.setCompanyName(companyName);
        company.setLocation(location);
        company.setHrName(hrName);
        company.setHrEmail(hrEmail);
        company.setHrPhone(hrPhone);

        // 3. Call DAO
        CompanyDAO companyDAO = new CompanyDAO();
        boolean result = companyDAO.insertCompany(company);

        if (result) {
            request.setAttribute("message", "Company added successfully!");
            request.setAttribute("messageType", "success");
        } else {
            request.setAttribute("message", "Failed to add company.");
            request.setAttribute("messageType", "error");
        }

        request.getRequestDispatcher("/jsp/PlacementOfficer/addCompany.jsp")
                .forward(request, response);

        request.getRequestDispatcher("/jsp/PlacementOfficer/addCompany.jsp")
                .forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("list".equals(action)) {

            CompanyDAO companyDAO = new CompanyDAO();

            List<Company> companyList = companyDAO.getAllCompanies();

            request.setAttribute("companyList", companyList);

            request.getRequestDispatcher("/jsp/PlacementOfficer/viewCompanies.jsp")
                    .forward(request, response);
        }
    }
}
