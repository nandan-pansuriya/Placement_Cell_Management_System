<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Placement Officer Dashboard</title>
    </head>
    <body>

        <h2>Placement Officer Dashboard</h2>

        <p>Welcome, ${loggedUser.username}</p>

        <hr>

        <h3>Company Management</h3>
        <a href="addCompany.jsp">Add Company</a><br>
        <a href="${pageContext.request.contextPath}/CompanyServlet?action=list">View Companies</a>

        <hr>

        <h3>Job Management</h3>

        <a href="${pageContext.request.contextPath}/JobServlet?action=addForm">
            Post Job</a><br>
        <a href="${pageContext.request.contextPath}/JobServlet?action=list">
            View Jobs</a>

        <hr>

        <a href="${pageContext.request.contextPath}/ApplicationServlet?action=list">
            View Applications
        </a>

        <hr>

        <a href="${pageContext.request.contextPath}/PlacementOfficerServlet?action=profile">
            My Profile
        </a>

        <hr>

        <a href="${pageContext.request.contextPath}/logout">Logout</a>

    </body>
</html>