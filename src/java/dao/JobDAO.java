package dao;

import db.DBConnection;
import model.Job;

import java.sql.*;
import java.util.*;

public class JobDAO {

    public boolean insertJob(Job job) {

        boolean rowInserted = false;

        String sql = "INSERT INTO jobs (company_id, job_title, job_description, salary, eligibility_cgpa, last_date) VALUES (?, ?, ?, ?, ?, ?)";

        try (
                Connection conn = DBConnection.getConnection(); 
                PreparedStatement stmt = conn.prepareStatement(sql)
                )
        {

            stmt.setInt(1, job.getCompanyId());
            stmt.setString(2, job.getJobTitle());
            stmt.setString(3, job.getJobDescription());
            stmt.setDouble(4, job.getSalary());
            stmt.setDouble(5, job.getEligibilityCgpa());
            stmt.setDate(6, job.getLastDate());

            rowInserted = stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rowInserted;
    }

    public List<Job> getAllJobs() {

        List<Job> jobList = new ArrayList<>();

        String sql = "SELECT j.*, c.company_name FROM jobs j "
                + "JOIN companies c ON j.company_id = c.company_id";

        try (
                Connection conn = DBConnection.getConnection(); 
                PreparedStatement stmt = conn.prepareStatement(sql); 
                ResultSet rs = stmt.executeQuery()
            ) 
        {

            while (rs.next()) {

                Job job = new Job();

                job.setJobId(rs.getInt("job_id"));
                job.setCompanyId(rs.getInt("company_id"));
                job.setJobTitle(rs.getString("job_title"));
                job.setJobDescription(rs.getString("job_description"));
                job.setSalary(rs.getDouble("salary"));
                job.setEligibilityCgpa(rs.getDouble("eligibility_cgpa"));
                job.setLastDate(rs.getDate("last_date"));

                jobList.add(job);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return jobList;
    }
}
