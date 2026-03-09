
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Applications</title>
    </head>
    <body>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <h2>My Applications</h2>

        <table border="1">

            <tr>
                <th>Job Title</th>
                <th>Company</th>
                <th>Application Date</th>
                <th>Status</th>
            </tr>

            <c:forEach var="app" items="${applications}">

                <tr>
                    <td>${app.jobTitle}</td>
                    <td>${app.companyName}</td>
                    <td>${app.applicationDate}</td>
                    <td>${app.status}</td>
                </tr>

            </c:forEach>

        </table>

        <br>

        <a href="${pageContext.request.contextPath}/jsp/Student/studentDashboard.jsp">
            Back to Dashboard
        </a>
    </body>
</html>
