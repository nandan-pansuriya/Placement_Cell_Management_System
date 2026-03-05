package dao;

import db.DBConnection;
import model.Student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StudentDAO {

    public boolean insertStudent(Student student) {

        boolean status = false;

        String sql = "INSERT INTO students (user_id, enrollment_no, name, email, phone, branch, cgpa, passing_year) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

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
}