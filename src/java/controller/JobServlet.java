package controller;

import dao.JobDAO;
import dao.CompanyDAO;
import model.Job;
import model.Company;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Date;

@WebServlet("/JobServlet")
public class JobServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Get form data
        int companyId = Integer.parseInt(request.getParameter("companyId"));
        String jobTitle = request.getParameter("jobTitle");
        String jobDescription = request.getParameter("jobDescription");
        double salary = Double.parseDouble(request.getParameter("salary"));
        double eligibilityCgpa = Double.parseDouble(request.getParameter("eligibilityCgpa"));
        Date lastDate = Date.valueOf(request.getParameter("lastDate"));

        // 2. Create Job object
        Job job = new Job();
        job.setCompanyId(companyId);
        job.setJobTitle(jobTitle);
        job.setJobDescription(jobDescription);
        job.setSalary(salary);
        job.setEligibilityCgpa(eligibilityCgpa);
        job.setLastDate(lastDate);

        // 3. Call DAO
        JobDAO jobDAO = new JobDAO();
        boolean result = jobDAO.insertJob(job);

        // 4.  Send message back to JSP
        if (result) {
            request.setAttribute("message", "Job posted successfully!");
            request.setAttribute("messageType", "success");
        } else {
            request.setAttribute("message", "Failed to post job.");
            request.setAttribute("messageType", "error");
        }

        request.getRequestDispatcher("/jsp/PlacementOfficer/addJob.jsp")
                .forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("addForm".equals(action)) {

            CompanyDAO companyDAO = new CompanyDAO();
            List<Company> companyList = companyDAO.getAllCompanies();

            request.setAttribute("companyList", companyList);

            request.getRequestDispatcher("/jsp/PlacementOfficer/addJob.jsp")
                    .forward(request, response);

        } else if ("list".equals(action)) {

            JobDAO jobDAO = new JobDAO();
            List<Job> jobList = jobDAO.getAllJobs();

            request.setAttribute("jobList", jobList);

            request.getRequestDispatcher("/jsp/PlacementOfficer/viewJobs.jsp")
                    .forward(request, response);
        }
    }
}
