<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title>View Jobs</title>
    </head>
    <body>

        <h2>Job List</h2>

        <table border="1" cellpadding="10">

            <tr>
                <th>Job ID</th>
                <th>Company</th>
                <th>Job Title</th>
                <th>Description</th>
                <th>Salary</th>
                <th>Eligibility CGPA</th>
                <th>Last Date</th>
            </tr>

            <c:forEach var="job" items="${jobList}">
                <tr>
                    <td>${job.jobId}</td>
                    <td>${job.companyName}</td>
                    <td>${job.jobTitle}</td>
                    <td>${job.jobDescription}</td>
                    <td>${job.salary}</td>
                    <td>${job.eligibilityCgpa}</td>
                    <td>${job.lastDate}</td>
                </tr>
            </c:forEach>

        </table>

        <br>

        <a href="${pageContext.request.contextPath}/jsp/PlacementOfficer/PlacementOfficerDashboard.jsp">
            Back to Dashboard
        </a>

    </body>
</html>