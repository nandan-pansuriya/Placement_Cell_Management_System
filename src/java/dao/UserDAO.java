package dao;

import db.DBConnection;
import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    // Method to validate user login
    public User validateUser(String username, String password) {

        User user = null;

        String sql = "SELECT user_id, username, role FROM users WHERE username = ? AND password = ?";

        try (
                Connection con = DBConnection.getConnection(); 
                PreparedStatement ps = con.prepareStatement(sql)
            ) 
        {
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setRole(rs.getString("role"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user; // null if login fails
    }
}
