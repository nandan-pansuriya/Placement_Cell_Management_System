package dao;

import db.DBConnection;
import model.Student;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StudentDAO {

    public boolean insertStudent(Student student) {

        boolean status = false;

        String sql = "INSERT INTO students (user_id, enrollment_no, name, email, phone, branch, cgpa, passing_year) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (
                Connection con = DBConnection.getConnection(); 
                PreparedStatement ps = con.prepareStatement(sql)) 
        {

            ps.setInt(1, student.getUserId());
            ps.setString(2, student.getEnrollmentNo());
            ps.setString(3, student.getName());
            ps.setString(4, student.getEmail());
            ps.setString(5, student.getPhone());
            ps.setString(6, student.getBranch());
            ps.setDouble(7, student.getCgpa());
            ps.setInt(8, student.getPassingYear());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return status;
    }

    public Student getStudentByUserId(int userId) {

        Student student = null;

        String sql = "SELECT * FROM students WHERE user_id = ?";

        try (
                Connection conn = DBConnection.getConnection(); 
                PreparedStatement stmt = conn.prepareStatement(sql)) 
        {

            stmt.setInt(1, userId);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {

                student = new Student();

                student.setStudentId(rs.getInt("student_id"));
                student.setUserId(rs.getInt("user_id"));
                student.setEnrollmentNo(rs.getString("enrollment_no"));
                student.setName(rs.getString("name"));
                student.setEmail(rs.getString("email"));
                student.setPhone(rs.getString("phone"));
                student.setBranch(rs.getString("branch"));
                student.setCgpa(rs.getDouble("cgpa"));
                student.setPassingYear(rs.getInt("passing_year"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return student;
    }

    public boolean updateStudent(Student student) {

        boolean updated = false;

        String sql = "UPDATE students SET name=?, email=?, phone=?, branch=?, cgpa=?, passing_year=? WHERE student_id=?";

        try (
                Connection conn = DBConnection.getConnection(); 
                PreparedStatement stmt = conn.prepareStatement(sql)) 
        {

            stmt.setString(1, student.getName());
            stmt.setString(2, student.getEmail());
            stmt.setString(3, student.getPhone());
            stmt.setString(4, student.getBranch());
            stmt.setDouble(5, student.getCgpa());
            stmt.setInt(6, student.getPassingYear());
            stmt.setInt(7, student.getStudentId());

            updated = stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return updated;
    }

    public int getStudentIdByUserId(int userId) {

        int studentId = 0;

        String sql = "SELECT student_id FROM students WHERE user_id = ?";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                studentId = rs.getInt("student_id");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return studentId;
    }
}
