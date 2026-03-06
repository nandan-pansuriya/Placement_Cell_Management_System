<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title>View Companies</title>
    </head>
    <body>

        <h2>Company List</h2>

        <table border="1" cellpadding="10">

            <tr>
                <th>ID</th>
                <th>Company Name</th>
                <th>Location</th>
                <th>HR Name</th>
                <th>HR Email</th>
                <th>HR Phone</th>
            </tr>

            <c:forEach var="company" items="${companyList}">
                <tr>
                    <td>${company.companyId}</td>
                    <td>${company.companyName}</td>
                    <td>${company.location}</td>
                    <td>${company.hrName}</td>
                    <td>${company.hrEmail}</td>
                    <td>${company.hrPhone}</td>
                </tr>
            </c:forEach>

        </table>

        <br>

        <a href="${pageContext.request.contextPath}/jsp/PlacementOfficer/PlacementOfficerDashboard.jsp">
            Back to Dashboard
        </a>

    </body>
</html>