package dao;

import db.DBConnection;
import model.Application;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ApplicationDAO {

    // this will use PlacementOfficer
    public List<Application> getAllApplications() {

        List<Application> list = new ArrayList<>();

        String sql
                = "SELECT a.application_id, s.name AS student_name, "
                + "j.job_title, c.company_name, a.application_date, a.status "
                + "FROM applications a "
                + "JOIN students s ON a.student_id = s.student_id "
                + "JOIN jobs j ON a.job_id = j.job_id "
                + "JOIN companies c ON j.company_id = c.company_id";

        try (
                Connection conn = DBConnection.getConnection(); 
                PreparedStatement stmt = conn.prepareStatement(sql); 
                ResultSet rs = stmt.executeQuery()) 
        {

            while (rs.next()) {

                Application app = new Application();

                app.setApplicationId(rs.getInt("application_id"));
                app.setStudentName(rs.getString("student_name"));
                app.setJobTitle(rs.getString("job_title"));
                app.setCompanyName(rs.getString("company_name"));
                app.setApplicationDate(rs.getDate("application_date"));
                app.setStatus(rs.getString("status"));

                list.add(app);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean updateStatus(int applicationId, String status) {

        boolean updated = false;

        String sql = "UPDATE applications SET status=? WHERE application_id=?";

        try (
                Connection conn = DBConnection.getConnection(); 
                PreparedStatement stmt = conn.prepareStatement(sql)) 
        {

            stmt.setString(1, status);
            stmt.setInt(2, applicationId);

            updated = stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return updated;
    }

    public boolean applyJob(int studentId, int jobId) {

        boolean applied = false;

        String sql = "INSERT INTO applications (student_id, job_id, application_date, status) VALUES (?, ?, CURDATE(), 'APPLIED')";

        try (
                Connection conn = DBConnection.getConnection(); 
                PreparedStatement stmt = conn.prepareStatement(sql)) 
        {

            stmt.setInt(1, studentId);
            stmt.setInt(2, jobId);

            applied = stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return applied;
    }

    // this will use Student
    public List<Application> getApplicationsByStudent(int studentId) {

        List<Application> list = new ArrayList<>();

        String sql
                = "SELECT j.job_title, c.company_name, a.application_date, a.status "
                + "FROM applications a "
                + "JOIN jobs j ON a.job_id = j.job_id "
                + "JOIN companies c ON j.company_id = c.company_id "
                + "WHERE a.student_id = ?";

        try (
                Connection conn = DBConnection.getConnection(); 
                PreparedStatement stmt = conn.prepareStatement(sql)) 
        {

            stmt.setInt(1, studentId);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                Application app = new Application();

                app.setJobTitle(rs.getString("job_title"));
                app.setCompanyName(rs.getString("company_name"));
                app.setApplicationDate(rs.getDate("application_date"));
                app.setStatus(rs.getString("status"));

                list.add(app);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
