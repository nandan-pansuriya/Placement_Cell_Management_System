package model;

import java.io.Serializable;
import java.sql.Date;

public class Job implements Serializable {

    private int jobId;
    private int companyId;
    private String jobTitle;
    private String jobDescription;
    private double salary;
    private double eligibilityCgpa;
    private Date lastDate;

    public Job() {
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public String getJobDescription() {
        return jobDescription;
    }

    public void setJobDescription(String jobDescription) {
        this.jobDescription = jobDescription;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public double getEligibilityCgpa() {
        return eligibilityCgpa;
    }

    public void setEligibilityCgpa(double eligibilityCgpa) {
        this.eligibilityCgpa = eligibilityCgpa;
    }

    public Date getLastDate() {
        return lastDate;
    }

    public void setLastDate(Date lastDate) {
        this.lastDate = lastDate;
    }
}