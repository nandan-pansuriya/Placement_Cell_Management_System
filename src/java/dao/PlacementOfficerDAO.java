package dao;

import db.DBConnection;
import model.PlacementOfficer;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PlacementOfficerDAO {

    public boolean insertOfficer(PlacementOfficer officer) {

        boolean status = false;

        String sql = "INSERT INTO placement_officers (user_id, name, email, phone) VALUES (?, ?, ?, ?)";

        try (
                Connection con = DBConnection.getConnection(); 
                PreparedStatement ps = con.prepareStatement(sql)) 
        {

            ps.setInt(1, officer.getUserId());
            ps.setString(2, officer.getName());
            ps.setString(3, officer.getEmail());
            ps.setString(4, officer.getPhone());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return status;
    }

    public boolean updateOfficer(PlacementOfficer officer) {

        boolean updated = false;

        String sql = "UPDATE placement_officers SET name=?, email=?, phone=? WHERE officer_id=?";

        try (
                Connection conn = DBConnection.getConnection(); 
                PreparedStatement stmt = conn.prepareStatement(sql)) 
        {

            stmt.setString(1, officer.getName());
            stmt.setString(2, officer.getEmail());
            stmt.setString(3, officer.getPhone());
            stmt.setInt(4, officer.getOfficerId());

            updated = stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return updated;
    }

    public PlacementOfficer getOfficerByUserId(int userId) {

        PlacementOfficer officer = null;

        String sql = "SELECT * FROM placement_officers WHERE user_id = ?";

        try (
                Connection conn = DBConnection.getConnection(); 
                PreparedStatement stmt = conn.prepareStatement(sql)) 
        {

            stmt.setInt(1, userId);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {

                officer = new PlacementOfficer();

                officer.setOfficerId(rs.getInt("officer_id"));
                officer.setUserId(rs.getInt("user_id"));
                officer.setName(rs.getString("name"));
                officer.setEmail(rs.getString("email"));
                officer.setPhone(rs.getString("phone"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return officer;
    }
}
