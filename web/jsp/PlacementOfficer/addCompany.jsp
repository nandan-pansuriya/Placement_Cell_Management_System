<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Add Company</title>
    </head>
    <body>

        <h2>Add Company</h2>

    <c:if test="${not empty message}">
        <p style="color:${messageType == 'success' ? 'green' : 'red'};">
            ${message}
        </p>
    </c:if>

    <form action="${pageContext.request.contextPath}/CompanyServlet" method="post">

        <label>Company Name:</label><br>
        <input type="text" name="companyName" required><br><br>

        <label>Location:</label><br>
        <input type="text" name="location" required><br><br>

        <label>HR Name:</label><br>
        <input type="text" name="hrName" required><br><br>

        <label>HR Email:</label><br>
        <input type="email" name="hrEmail" required><br><br>

        <label>HR Phone:</label><br>
        <input type="text" name="hrPhone" required><br><br>

        <button type="reset">Clear</button>
        <button type="submit">Add Company</button>

    </form>

    <br>

    <a href="${pageContext.request.contextPath}/jsp/PlacementOfficer/PlacementOfficerDashboard.jsp">
        Back to Dashboard
    </a>

</body>
</html>