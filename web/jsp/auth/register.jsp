<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Registration</title>

        <script>
            function toggleFields() {
                let role = document.querySelector('input[name="role"]:checked').value;

                let studentFields = document.getElementById("studentFields");

                if (role === "STUDENT") {
                    studentFields.style.display = "block";
                } else {
                    studentFields.style.display = "none";
                }
            }

            function validatePassword() {
                let pass = document.getElementById("password").value;
                let confirm = document.getElementById("confirmPassword").value;

                if (pass !== confirm) {
                    alert("Passwords do not match");
                    return false;
                }
                return true;
            }
        </script>

    </head>

    <body>

        <h2>User Registration</h2>

        <form action="${pageContext.request.contextPath}/register"
              method="post"
              onsubmit="return validatePassword()">

            <h3>Login Details</h3>

            Username:<br>
            <input type="text" name="username" required><br><br>

            Password:<br>
            <input type="password" name="password" id="password" required><br><br>

            Confirm Password:<br>
            <input type="password" id="confirmPassword" required><br><br>

            <h3>Select Role</h3>
            <input type="radio" name="role" value="STUDENT" onclick="toggleFields()" required>
            Student
            <input type="radio" name="role" value="OFFICER" onclick="toggleFields()">
            Placement Officer

            <br><br>

            <h3>Basic Details</h3>

            Name:<br>
            <input type="text" name="name" required><br><br>

            Email:<br>
            <input type="email" name="email" required><br><br>

            Phone:<br>
            <input type="text" name="phone"><br><br>


            <!-- STUDENT FIELDS -->

            <div id="studentFields" style="display:none">

                <h3>Student Details</h3>

                Enrollment No:<br>
                <input type="text" name="enrollmentNo"><br><br>

                Branch:<br>
                <select name="branch">
                    <option value="">Select Branch</option>
                    <option value="IT">Information Technology</option>
                    <option value="CE">Computer Engineering</option>
                    <option value="ME">Mechanical Engineering</option>
                    <option value="EE">Electrical Engineering</option>
                    <option value="EC">Electronics & Communication</option>
                    <option value="CH">Chemical Engineering</option>
                </select>
                <br><br>

                CGPA:<br>
                <input type="number" step="0.01" name="cgpa"><br><br>

                Passing Year:<br>
                <input type="number" name="passingYear"><br><br>

            </div>

            <button type="submit">Register</button>

        </form>

        <br>

        <a href="login.jsp">Back to Login</a>

    </body>
</html>