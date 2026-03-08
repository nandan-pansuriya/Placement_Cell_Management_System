<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>View Application</title>
    </head>
    <body>

        <h2>Student Applications</h2>

        <table border="1">

            <tr>
                <th>ID</th>
                <th>Student</th>
                <th>Job</th>
                <th>Company</th>
                <th>Date</th>
                <th>Status</th>
                <th>Action</th>
            </tr>

            <c:forEach var="app" items="${applications}">

                <tr>
                    <td>${app.applicationId}</td>
                    <td>${app.studentName}</td>
                    <td>${app.jobTitle}</td>
                    <td>${app.companyName}</td>
                    <td>${app.applicationDate}</td>
                    <td>${app.status}</td>
                    <td>

                        <form action="${pageContext.request.contextPath}/ApplicationServlet" method="get" style="display:inline;">
                            <input type="hidden" name="action" value="updateStatus">
                            <input type="hidden" name="id" value="${app.applicationId}">
                            <input type="hidden" name="status" value="SELECTED">

                            <button type="submit">Select</button>
                        </form>

                        <form action="${pageContext.request.contextPath}/ApplicationServlet" method="get" style="display:inline;">
                            <input type="hidden" name="action" value="updateStatus">
                            <input type="hidden" name="id" value="${app.applicationId}">
                            <input type="hidden" name="status" value="REJECTED">

                            <button type="submit">Reject</button>
                        </form>

                    </td>
                </tr>

            </c:forEach>

        </table>

        <br>

        <a href="${pageContext.request.contextPath}/jsp/PlacementOfficer/PlacementOfficerDashboard.jsp">
            Back to Dashboard
        </a>
    </body>
</html>