package controller;

import dao.ApplicationDAO;
import dao.JobDAO;
import dao.StudentDAO;
import model.Job;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;
import model.Application;
import model.Student;
import model.User;

@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("viewJobs".equals(action)) {

            JobDAO jobDAO = new JobDAO();
            List<Job> jobList = jobDAO.getAllJobs();

            request.setAttribute("jobList", jobList);

            request.getRequestDispatcher("/jsp/Student/studentJobs.jsp")
                    .forward(request, response);
        } else if ("apply".equals(action)) {

            int jobId = Integer.parseInt(request.getParameter("jobId"));

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("loggedUser");

            int userId = user.getUserId();

            StudentDAO studentDAO = new StudentDAO();
            int studentId = studentDAO.getStudentIdByUserId(userId);

            ApplicationDAO dao = new ApplicationDAO();

            boolean result = dao.applyJob(studentId, jobId);

            if (result) {
                request.setAttribute("message", "Application submitted successfully!");
                request.setAttribute("messageType", "success");
            } else {
                request.setAttribute("message", "Failed to apply for job.");
                request.setAttribute("messageType", "error");
            }

            JobDAO jobDAO = new JobDAO();
            List<Job> jobList = jobDAO.getAllJobs();

            request.setAttribute("jobList", jobList);

            request.getRequestDispatcher("/jsp/Student/studentJobs.jsp")
                    .forward(request, response);
        } else if ("myApplications".equals(action)) {

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("loggedUser");

            int userId = user.getUserId();

            StudentDAO studentDAO = new StudentDAO();
            int studentId = studentDAO.getStudentIdByUserId(userId);

            ApplicationDAO dao = new ApplicationDAO();
            List<Application> list = dao.getApplicationsByStudent(studentId);

            request.setAttribute("applications", list);

            request.getRequestDispatcher("/jsp/Student/myApplications.jsp")
                    .forward(request, response);
        } else if ("profile".equals(action)) {

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("loggedUser");

            int userId = user.getUserId();

            StudentDAO dao = new StudentDAO();
            Student student = dao.getStudentByUserId(userId);

            request.setAttribute("student", student);

            request.getRequestDispatcher("/jsp/Student/profile.jsp")
                    .forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int studentId = Integer.parseInt(request.getParameter("studentId"));

        Student student = new Student();

        student.setStudentId(studentId);
        student.setEnrollmentNo(request.getParameter("enrollmentNo"));
        student.setName(request.getParameter("name"));
        student.setEmail(request.getParameter("email"));
        student.setPhone(request.getParameter("phone"));
        student.setBranch(request.getParameter("branch"));
        student.setCgpa(Double.parseDouble(request.getParameter("cgpa")));
        student.setPassingYear(Integer.parseInt(request.getParameter("passingYear")));

        StudentDAO dao = new StudentDAO();

        boolean result = dao.updateStudent(student);

        if (result) {
            request.setAttribute("message", "Profile updated successfully!");
            request.setAttribute("messageType", "success");
        } else {
            request.setAttribute("message", "Profile update failed.");
            request.setAttribute("messageType", "error");
        }

        request.setAttribute("student", student);

        request.getRequestDispatcher("/jsp/Student/profile.jsp")
                .forward(request, response);
    }
}
