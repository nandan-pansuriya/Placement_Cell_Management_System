<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Add Job</title>
    </head>
    <body>

        <h2>Post New Job</h2>

        <c:if test="${not empty message}">
            <p style="color:${messageType == 'success' ? 'green' : 'red'};">
                ${message}
            </p>
        </c:if>

        <form action="${pageContext.request.contextPath}/JobServlet" method="post">

            <label>Company:</label><br>

            <select name="companyId" required>

                <option value="">-- Select Company --</option>

                <c:forEach var="company" items="${companyList}">
                    <option value="${company.companyId}">
                        ${company.companyName}
                    </option>
                </c:forEach>

            </select>
            <br><br>
            <br><br>

            <label>Job Title:</label><br>
            <input type="text" name="jobTitle" required>
            <br><br>

            <label>Job Description:</label><br>
            <textarea name="jobDescription" rows="4" cols="40" required></textarea>
            <br><br>

            <label>Salary:</label><br>
            <input type="number" name="salary" step="0.01" required>
            <br><br>

            <label>Eligibility CGPA:</label><br>
            <input type="number" name="eligibilityCgpa" step="0.01" required>
            <br><br>

            <label>Last Date:</label><br>
            <input type="date" name="lastDate" required>
            <br><br>

            <button type="submit">Post Job</button>
            <button type="reset">Clear</button>

        </form>

        <br>

        <a href="${pageContext.request.contextPath}/jsp/PlacementOfficer/PlacementOfficerDashboard.jsp">
            Back to Dashboard
        </a>

    </body>
</html>