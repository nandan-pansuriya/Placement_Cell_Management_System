
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Available Jobs</title>
    </head>
    <body>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <h2>Available Jobs</h2>

        <c:if test="${not empty message}">
            <p style="color:${messageType == 'success' ? 'green' : 'red'};">
                ${message}
            </p>
        </c:if>

        <table border="1">

            <tr>
                <th>Job Title</th>
                <th>Company</th>
                <th>Salary</th>
                <th>Eligibility CGPA</th>
                <th>Last Date</th>
                <th>Action</th>
            </tr>

            <c:forEach var="job" items="${jobList}">

                <tr>
                    <td>${job.jobTitle}</td>
                    <td>${job.companyName}</td>
                    <td>${job.salary}</td>
                    <td>${job.eligibilityCgpa}</td>
                    <td>${job.lastDate}</td>

                    <td>

                        <form action="${pageContext.request.contextPath}/StudentServlet" method="get">

                            <input type="hidden" name="action" value="apply">
                            <input type="hidden" name="jobId" value="${job.jobId}">

                            <button type="submit">Apply</button>

                        </form>

                    </td>

                </tr>

            </c:forEach>

        </table>

        <br>

        <a href="${pageContext.request.contextPath}/jsp/Student/studentDashboard.jsp">
            Back to Dashboard
        </a>
    </body>
</html>
