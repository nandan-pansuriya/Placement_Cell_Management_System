<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>

<h2>Login</h2>

<!-- Show error message if login fails -->
<%
    String error = request.getParameter("error");
    if ("invalid".equals(error)) {
%>
        <p style="color:red;">Invalid username or password</p>
<%
    } else if ("role".equals(error)) {
%>
        <p style="color:red;">Invalid user role</p>
<%
    }
%>

<form action="<%= request.getContextPath() %>/login" method="post">

    <label>Username:</label><br>
    <input type="text" name="username" required><br><br>

    <label>Password:</label><br>
    <input type="password" name="password" required><br><br>

    <button type="submit">Login</button>

</form>

<br>

<p>
    Don’t have an account?
    <a href="register.jsp">Sign Up</a>
</p>

</body>
</html>