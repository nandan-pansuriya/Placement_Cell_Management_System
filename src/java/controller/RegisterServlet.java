package controller;

import dao.UserDAO;
import dao.StudentDAO;
import dao.PlacementOfficerDAO;

import model.Student;
import model.PlacementOfficer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // login details
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        // common details
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        UserDAO userDAO = new UserDAO();

        // insert into users table
        int userId = userDAO.insertUser(username, password, role);

        if (userId > 0) {

            if ("STUDENT".equalsIgnoreCase(role)) {

                String enrollmentNo = request.getParameter("enrollmentNo");
                String branch = request.getParameter("branch");
                double cgpa = Double.parseDouble(request.getParameter("cgpa"));
                int passingYear = Integer.parseInt(request.getParameter("passingYear"));

                Student student = new Student();
                student.setUserId(userId);
                student.setEnrollmentNo(enrollmentNo);
                student.setName(name);
                student.setEmail(email);
                student.setPhone(phone);
                student.setBranch(branch);
                student.setCgpa(cgpa);
                student.setPassingYear(passingYear);

                StudentDAO studentDAO = new StudentDAO();
                studentDAO.insertStudent(student);

            } else if ("OFFICER".equalsIgnoreCase(role)) {

                PlacementOfficer officer = new PlacementOfficer();
                officer.setUserId(userId);
                officer.setName(name);
                officer.setEmail(email);
                officer.setPhone(phone);

                PlacementOfficerDAO officerDAO = new PlacementOfficerDAO();
                officerDAO.insertOfficer(officer);
            }

            response.sendRedirect("jsp/auth/login.jsp?msg=registered");

        } else {
            response.sendRedirect("jsp/auth/register.jsp?error=true");
        }
    }
}