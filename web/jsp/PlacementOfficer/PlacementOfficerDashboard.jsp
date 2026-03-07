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

        <h3>Applications</h3>
        <a href="#">View Applications</a>

        <hr>

        <h3>Profile</h3>
        <a href="#">My Profile</a>

        <hr>

        <a href="${pageContext.request.contextPath}/LogoutServlet">Logout</a>

    </body>
</html>