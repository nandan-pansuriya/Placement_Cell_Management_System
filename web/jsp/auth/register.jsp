<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
    <style>
        :root {
            --bg-color: #f8fafc;
            --accent-blue: #2563eb;
            --card-bg: #ffffff;
            --text-main: #0f172a;
            --text-muted: #64748b;
            --input-border: #e2e8f0;
            --shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.05);
        }

        * { box-sizing: border-box; transition: all 0.2s ease-in-out; }

        body {
            margin: 0;
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            background-color: var(--bg-color);
            background-image: radial-gradient(at 100% 0%, rgba(37, 99, 235, 0.05) 0px, transparent 50%);
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 50px 20px;
            color: var(--text-main);
        }

        .reg-container {
            width: 100%;
            max-width: 500px;
            background: var(--card-bg);
            border-radius: 20px;
            border: 1px solid #edf2f7;
            box-shadow: var(--shadow);
            padding: 40px;
        }

        h2 {
            margin: 0 0 10px 0;
            font-size: 1.8rem;
            font-weight: 800;
            text-align: center;
        }

        .subtitle {
            text-align: center;
            color: var(--text-muted);
            margin-bottom: 35px;
            font-size: 0.9rem;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-size: 0.85rem;
            font-weight: 600;
            margin-bottom: 8px;
            color: var(--text-main);
        }

        input[type="text"], 
        input[type="password"], 
        input[type="email"], 
        input[type="number"], 
        select {
            width: 100%;
            padding: 12px 15px;
            border-radius: 10px;
            border: 1px solid var(--input-border);
            background: #fafafa;
            font-size: 1rem;
            outline: none;
        }

        input:focus, select:focus {
            background: white;
            border-color: var(--accent-blue);
            box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1);
        }

        /* Role Selection Styling */
        .role-box {
            display: flex;
            gap: 20px;
            margin-top: 5px;
            padding: 10px 0;
        }

        .role-option {
            display: flex;
            align-items: center;
            gap: 8px;
            cursor: pointer;
            font-size: 0.95rem;
        }

        button {
            width: 100%;
            padding: 15px;
            background-color: var(--accent-blue);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            margin-top: 25px;
        }

        button:hover {
            background-color: #1d4ed8;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(37, 99, 235, 0.2);
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 25px;
            text-decoration: none;
            color: var(--text-muted);
            font-size: 0.9rem;
        }

        .back-link:hover { color: var(--accent-blue); }

        /* Smooth reveal for Student Fields */
        #studentFields {
            border-top: 1px solid #eee;
            margin-top: 20px;
            padding-top: 20px;
        }
    </style>

    <script>
        function toggleFields() {
            let role = document.querySelector('input[name="role"]:checked').value;
            let studentFields = document.getElementById("studentFields");
            studentFields.style.display = (role === "STUDENT") ? "block" : "none";
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

    <div class="reg-container">
        <h2>User Registration</h2>
        <p class="subtitle">Complete the form to create your account</p>

        <form action="${pageContext.request.contextPath}/register" 
              method="post" 
              onsubmit="return validatePassword()">

            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" required>
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" id="password" required>
            </div>

            <div class="form-group">
                <label>Confirm Password</label>
                <input type="password" id="confirmPassword" required>
            </div>

            <div class="form-group">
                <label>Select Role</label>
                <div class="role-box">
                    <label class="role-option">
                        <input type="radio" name="role" value="STUDENT" onclick="toggleFields()" required> Student
                    </label>
                    <label class="role-option">
                        <input type="radio" name="role" value="OFFICER" onclick="toggleFields()"> Placement Officer
                    </label>
                </div>
            </div>

            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="name" required>
            </div>

            <div class="form-group">
                <label>Email Address</label>
                <input type="email" name="email" required>
            </div>

            <div class="form-group">
                <label>Phone Number</label>
                <input type="text" name="phone">
            </div>

            <div id="studentFields" style="display:none">
                <div class="form-group">
                    <label>Enrollment No</label>
                    <input type="text" name="enrollmentNo">
                </div>

                <div class="form-group">
                    <label>Branch</label>
                    <select name="branch">
                        <option value="">Select Branch</option>
                        <option value="IT">Information Technology</option>
                        <option value="CE">Computer Engineering</option>
                        <option value="ME">Mechanical Engineering</option>
                        <option value="EE">Electrical Engineering</option>
                        <option value="EC">Electronics & Communication</option>
                        <option value="CH">Chemical Engineering</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Current CGPA</label>
                    <input type="number" step="0.01" name="cgpa">
                </div>

                <div class="form-group">
                    <label>Passing Year</label>
                    <input type="number" name="passingYear">
                </div>
            </div>

            <button type="submit">Register Account</button>
        </form>

        <a href="login.jsp" class="back-link">Back to Login</a>
    </div>

</body>
</html>