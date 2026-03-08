<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Officer Profile</title>
    </head>
    <body>


        <h2>My Profile</h2>

        <c:if test="${not empty message}">
            <p style="color:${messageType == 'success' ? 'green' : 'red'};">
                ${message}
            </p>
        </c:if>

        <form action="${pageContext.request.contextPath}/PlacementOfficerServlet" method="post">

            <input type="hidden" name="officerId" value="${officer.officerId}">

            Name:<br>
            <input type="text" name="name" value="${officer.name}" required>
            <br><br>

            Email:<br>
            <input type="email" name="email" value="${officer.email}" required>
            <br><br>

            Phone:<br>
            <input type="text" name="phone" value="${officer.phone}" required>
            <br><br>

            <button type="submit">Update Profile</button>

        </form>

        <br>

        <a href="${pageContext.request.contextPath}/jsp/PlacementOfficer/PlacementOfficerDashboard.jsp">
            Back to Dashboard
        </a>
    </body>
</html>