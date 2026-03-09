<%-- 
    Document   : profile
    Created on : 9 Mar 2026, 1:22:07 am
    Author     : Nandan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Student Profile</h2>

        <c:if test="${not empty message}">
            <p style="color:${messageType == 'success' ? 'green' : 'red'};">
                ${message}
            </p>
        </c:if>

        <form action="${pageContext.request.contextPath}/StudentServlet" method="post">

            <input type="hidden" name="studentId" value="${student.studentId}">

            Enrollment No:<br>
            <input type="text" name="enrollmentNo" value="${student.enrollmentNo}" required>
            <br><br>

            Name:<br>
            <input type="text" name="name" value="${student.name}" required>
            <br><br>

            Email:<br>
            <input type="email" name="email" value="${student.email}" required>
            <br><br>

            Phone:<br>
            <input type="text" name="phone" value="${student.phone}" required>
            <br><br>

            Branch:<br>
            <input type="text" name="branch" value="${student.branch}">
            <br><br>

            CGPA:<br>
            <input type="number" step="0.01" name="cgpa" value="${student.cgpa}">
            <br><br>

            Passing Year:<br>
            <input type="number" name="passingYear" value="${student.passingYear}">
            <br><br>

            <button type="submit">Update Profile</button>

        </form>

        <br>

        <a href="${pageContext.request.contextPath}/jsp/Student/studentDashboard.jsp">
            Back to Dashboard
        </a>
    </body>
</html>
