<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Officer Profile</title>
    <style>
        :root {
            --bg-color: #f8fafc;
            --accent-indigo: #4f46e5;
            --card-bg: #ffffff;
            --text-main: #0f172a;
            --text-muted: #64748b;
            --input-border: #e2e8f0;
            --success-green: #10b981;
            --error-red: #ef4444;
            --shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.05);
        }

        * { box-sizing: border-box; transition: all 0.2s ease; }

        body {
            margin: 0;
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            background-color: var(--bg-color);
            background-image: radial-gradient(at 0% 100%, rgba(79, 70, 229, 0.05) 0px, transparent 50%);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            padding: 40px 20px;
            color: var(--text-main);
        }

        .profile-card {
            width: 100%;
            max-width: 450px;
            background: var(--card-bg);
            border-radius: 28px;
            border: 1px solid #edf2f7;
            box-shadow: var(--shadow);
            padding: 45px;
            position: relative;
        }

        /* Decorative top bar */
        .profile-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 5px;
            background: var(--accent-indigo);
            border-radius: 0 0 10px 10px;
        }

        header {
            text-align: center;
            margin-bottom: 35px;
        }

        h2 {
            margin: 0 0 8px 0;
            font-size: 1.8rem;
            font-weight: 800;
            letter-spacing: -0.5px;
        }

        .subtitle {
            color: var(--text-muted);
            font-size: 0.9rem;
        }

        /* Sleek Status Messages */
        .status-msg {
            padding: 12px;
            border-radius: 12px;
            text-align: center;
            font-size: 0.85rem;
            font-weight: 600;
            margin-bottom: 25px;
            border: 1px solid transparent;
        }
        .msg-success { background: #ecfdf5; color: var(--success-green); border-color: #d1fae5; }
        .msg-error { background: #fef2f2; color: var(--error-red); border-color: #fee2e2; }

        .form-group {
            margin-bottom: 22px;
        }

        label {
            display: block;
            font-size: 0.75rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 8px;
            color: var(--text-muted);
        }

        input {
            width: 100%;
            padding: 12px 16px;
            border-radius: 12px;
            border: 1px solid var(--input-border);
            background: #fafafa;
            font-size: 1rem;
            outline: none;
            color: var(--text-main);
        }

        input:focus {
            background: white;
            border-color: var(--accent-indigo);
            box-shadow: 0 0 0 4px rgba(79, 70, 229, 0.1);
        }

        button {
            width: 100%;
            padding: 15px;
            background-color: var(--accent-indigo);
            color: white;
            border: none;
            border-radius: 14px;
            font-size: 1rem;
            font-weight: 700;
            cursor: pointer;
            margin-top: 15px;
            box-shadow: 0 4px 12px rgba(79, 70, 229, 0.2);
        }

        button:hover {
            background-color: #4338ca;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(79, 70, 229, 0.25);
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 30px;
            text-decoration: none;
            color: var(--text-muted);
            font-size: 0.9rem;
            font-weight: 600;
        }

        .back-link:hover { color: var(--accent-indigo); }
    </style>
</head>
<body>

    <div class="profile-card">
        <header>
            <h2>Administrative Profile</h2>
            <div class="subtitle">Update your officer contact credentials</div>
        </header>

        <c:if test="${not empty message}">
            <div class="status-msg ${messageType == 'success' ? 'msg-success' : 'msg-error'}">
                ${message}
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/PlacementOfficerServlet" method="post">
            <input type="hidden" name="officerId" value="${officer.officerId}">

            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="name" value="${officer.name}" required>
            </div>

            <div class="form-group">
                <label>Email Address</label>
                <input type="email" name="email" value="${officer.email}" required>
            </div>

            <div class="form-group">
                <label>Contact Number</label>
                <input type="text" name="phone" value="${officer.phone}" required>
            </div>

            <button type="submit">Update Profile</button>
        </form>

        <a href="${pageContext.request.contextPath}/jsp/PlacementOfficer/PlacementOfficerDashboard.jsp" class="back-link">
            &larr; Return to Dashboard
        </a>
    </div>

</body>
</html>