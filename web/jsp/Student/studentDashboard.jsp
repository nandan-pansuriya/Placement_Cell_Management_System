<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Student Dashboard</title>
    </head>
    <body>

        <h2>Student Dashboard</h2>

        <p>Welcome, ${loggedUser.username}</p>

        <hr>

        <h3>Job Opportunities</h3>

        <a href="${pageContext.request.contextPath}/StudentServlet?action=viewJobs">
            View Available Jobs
        </a>

        <hr>

        <h3>Applications</h3>

        <a href="${pageContext.request.contextPath}/StudentServlet?action=myApplications">
            My Applications
        </a>

        <hr>

        <h3>Profile</h3>

        <a href="${pageContext.request.contextPath}/StudentServlet?action=profile">
            My Profile
        </a>

        <hr>

        <a href="${pageContext.request.contextPath}/logout">
            Logout
        </a>

    </body>
</html>