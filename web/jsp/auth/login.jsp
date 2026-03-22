<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        /* Light Futuristic Aesthetic */
        :root {
            --bg-color: #f8fafc;
            --accent-blue: #2563eb;
            --card-bg: rgba(255, 255, 255, 0.95);
            --text-main: #0f172a;
            --text-muted: #64748b;
            --error-bg: #fff1f2;
            --error-text: #e11d48;
            --input-border: #e2e8f0;
            --shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.05), 0 8px 10px -6px rgba(0, 0, 0, 0.05);
        }

        * {
            box-sizing: border-box;
            transition: all 0.2s ease-in-out;
        }

        body {
            margin: 0;
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            background-color: var(--bg-color);
            background-image: 
                radial-gradient(at 0% 0%, rgba(37, 99, 235, 0.05) 0px, transparent 50%),
                radial-gradient(at 100% 100%, rgba(37, 99, 235, 0.05) 0px, transparent 50%);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--text-main);
        }

        .login-container {
            width: 100%;
            max-width: 420px;
            padding: 2rem;
            background: var(--card-bg);
            border-radius: 24px;
            border: 1px solid rgba(255, 255, 255, 0.7);
            box-shadow: var(--shadow);
            backdrop-filter: blur(10px);
        }

        h2 {
            margin: 0 0 0.5rem 0;
            font-size: 1.75rem;
            font-weight: 800;
            letter-spacing: -0.025em;
            text-align: center;
        }

        .subtitle {
            color: var(--text-muted);
            font-size: 0.9rem;
            text-align: center;
            margin-bottom: 2rem;
        }

        .error-message {
            background-color: var(--error-bg);
            color: var(--error-text);
            padding: 0.75rem;
            border-radius: 12px;
            font-size: 0.85rem;
            font-weight: 500;
            margin-bottom: 1.5rem;
            border: 1px solid #ffe4e6;
            text-align: center;
        }

        .form-group {
            margin-bottom: 1.25rem;
        }

        label {
            display: block;
            font-size: 0.85rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: var(--text-main);
        }

        input[type="text"], 
        input[type="password"] {
            width: 100%;
            padding: 0.8rem 1rem;
            border-radius: 12px;
            border: 1px solid var(--input-border);
            background: white;
            font-size: 1rem;
            outline: none;
        }

        input:focus {
            border-color: var(--accent-blue);
            box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1);
        }

        button {
            width: 100%;
            padding: 0.9rem;
            background-color: var(--accent-blue);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            margin-top: 1rem;
        }

        button:hover {
            background-color: #1d4ed8;
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(37, 99, 235, 0.2);
        }

        .footer {
            margin-top: 2rem;
            text-align: center;
            font-size: 0.9rem;
            color: var(--text-muted);
        }

        .footer a {
            color: var(--accent-blue);
            text-decoration: none;
            font-weight: 600;
        }

        .footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <h2>System Login</h2>
        <p class="subtitle">Access your decentralized dashboard</p>

        <%
            String error = request.getParameter("error");
            if (error != null) {
        %>
            <div class="error-message">
                <%= "invalid".equals(error) ? "Incorrect credentials. Please try again." : "Access Denied: Invalid User Role" %>
            </div>
        <% } %>

        <form action="<%= request.getContextPath()%>/login" method="post">
            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" placeholder="Enter username" required>
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" placeholder="Enter password" required>
            </div>

            <button type="submit">Login</button>
        </form>

        <div class="footer">
            Don’t have an account? 
            <a href="register.jsp">Create Account</a>
        </div>
    </div>

</body>
</html>