package dao;

import db.DBConnection;
import model.Company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.*;

public class CompanyDAO {

    public boolean insertCompany(Company company) {

        boolean rowInserted = false;

        String sql = "INSERT INTO companies (company_name, location, hr_name, hr_email, hr_phone) VALUES (?, ?, ?, ?, ?)";

        try (
                Connection conn = DBConnection.getConnection(); 
                PreparedStatement stmt = conn.prepareStatement(sql)
            ) {

            stmt.setString(1, company.getCompanyName());
            stmt.setString(2, company.getLocation());
            stmt.setString(3, company.getHrName());
            stmt.setString(4, company.getHrEmail());
            stmt.setString(5, company.getHrPhone());

            rowInserted = stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rowInserted;
    }

    public List<Company> getAllCompanies() {

        List<Company> companyList = new ArrayList<>();

        String sql = "SELECT * FROM companies";

        try (Connection conn = DBConnection.getConnection(); 
                PreparedStatement stmt = conn.prepareStatement(sql); 
                ResultSet rs = stmt.executeQuery()
            ) {

            while (rs.next()) {

                Company company = new Company();

                company.setCompanyId(rs.getInt("company_id"));
                company.setCompanyName(rs.getString("company_name"));
                company.setLocation(rs.getString("location"));
                company.setHrName(rs.getString("hr_name"));
                company.setHrEmail(rs.getString("hr_email"));
                company.setHrPhone(rs.getString("hr_phone"));

                companyList.add(company);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return companyList;
    }
}
