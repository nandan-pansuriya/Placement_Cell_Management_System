package dao;

import db.DBConnection;
import model.PlacementOfficer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PlacementOfficerDAO {

    public boolean insertOfficer(PlacementOfficer officer) {

        boolean status = false;

        String sql = "INSERT INTO placement_officers (user_id, name, email, phone) VALUES (?, ?, ?, ?)";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

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
}