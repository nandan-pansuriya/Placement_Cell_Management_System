<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Profile</title>
    <style>
        :root {
            --bg-color: #f8fafc;
            --accent-blue: #2563eb;
            --card-bg: #ffffff;
            --text-main: #0f172a;
            --text-muted: #64748b;
            --input-border: #e2e8f0;
            --success-green: #10b981;
            --error-red: #ef4444;
            --shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.05);
        }

        * { box-sizing: border-box; transition: all 0.2s ease-in-out; }

        body {
            margin: 0;
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            background-color: var(--bg-color);
            background-image: radial-gradient(at 100% 100%, rgba(37, 99, 235, 0.05) 0px, transparent 50%);
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 50px 20px;
            color: var(--text-main);
        }

        .profile-card {
            width: 100%;
            max-width: 550px;
            background: var(--card-bg);
            border-radius: 24px;
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
            margin-bottom: 30px;
            font-size: 0.9rem;
        }

        /* Message Styling */
        .msg {
            padding: 12px;
            border-radius: 12px;
            text-align: center;
            font-size: 0.9rem;
            font-weight: 600;
            margin-bottom: 25px;
            border: 1px solid transparent;
        }
        .msg-success { background: #ecfdf5; color: var(--success-green); border-color: #d1fae5; }
        .msg-error { background: #fef2f2; color: var(--error-red); border-color: #fee2e2; }

        /* Form Layout */
        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .form-group { margin-bottom: 15px; }
        .full-width { grid-column: span 2; }

        label {
            display: block;
            font-size: 0.8rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
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
            border-color: var(--accent-blue);
            box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1);
        }

        input:read-only {
            background: #f1f5f9;
            cursor: not-allowed;
            color: var(--text-muted);
        }

        button {
            width: 100%;
            padding: 15px;
            background-color: var(--accent-blue);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 1.05rem;
            font-weight: 600;
            cursor: pointer;
            margin-top: 20px;
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
            font-weight: 500;
        }

        .back-link:hover { color: var(--accent-blue); }
    </style>
</head>
<body>

    <div class="profile-card">
        <h2>Student Profile</h2>
        <p class="subtitle">Update your academic and contact information</p>

        <c:if test="${not empty message}">
            <div class="msg ${messageType == 'success' ? 'msg-success' : 'msg-error'}">
                ${message}
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/StudentServlet" method="post">
            <input type="hidden" name="studentId" value="${student.studentId}">

            <div class="form-grid">
                <div class="form-group full-width">
                    <label>Enrollment No</label>
                    <input type="text" name="enrollmentNo" value="${student.enrollmentNo}" required>
                </div>

                <div class="form-group full-width">
                    <label>Full Name</label>
                    <input type="text" name="name" value="${student.name}" required>
                </div>

                <div class="form-group">
                    <label>Email Address</label>
                    <input type="email" name="email" value="${student.email}" required>
                </div>

                <div class="form-group">
                    <label>Phone Number</label>
                    <input type="text" name="phone" value="${student.phone}" required>
                </div>

                <div class="form-group">
                    <label>Branch</label>
                    <input type="text" name="branch" value="${student.branch}">
                </div>

                <div class="form-group">
                    <label>Current CGPA</label>
                    <input type="number" step="0.01" name="cgpa" value="${student.cgpa}">
                </div>

                <div class="form-group full-width">
                    <label>Passing Year</label>
                    <input type="number" name="passingYear" value="${student.passingYear}">
                </div>
            </div>

            <button type="submit">Update Account Details</button>
        </form>

        <a href="${pageContext.request.contextPath}/jsp/Student/studentDashboard.jsp" class="back-link">
            Back to Dashboard
        </a>
    </div>

</body>
</html>