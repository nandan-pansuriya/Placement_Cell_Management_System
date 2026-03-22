<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Applications</title>
    <style>
        :root {
            --bg-color: #f8fafc;
            --accent-blue: #2563eb;
            --card-bg: #ffffff;
            --text-main: #0f172a;
            --text-muted: #64748b;
            --table-border: #e2e8f0;
            --shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.05);
        }

        * { box-sizing: border-box; transition: all 0.2s ease-in-out; }

        body {
            margin: 0;
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            background-color: var(--bg-color);
            background-image: radial-gradient(at 0% 0%, rgba(37, 99, 235, 0.05) 0px, transparent 50%);
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 50px 20px;
            color: var(--text-main);
        }

        .container {
            width: 100%;
            max-width: 900px;
            background: var(--card-bg);
            border-radius: 20px;
            border: 1px solid #edf2f7;
            box-shadow: var(--shadow);
            padding: 40px;
        }

        h2 {
            margin: 0 0 30px 0;
            font-size: 1.8rem;
            font-weight: 800;
            text-align: left;
            position: relative;
            padding-bottom: 10px;
        }

        /* Subtle line under heading */
        h2::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: 0;
            width: 50px;
            height: 4px;
            background: var(--accent-blue);
            border-radius: 10px;
        }

        /* Modern Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
            background: white;
        }

        th {
            text-align: left;
            padding: 15px;
            background: #f1f5f9;
            color: var(--text-muted);
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            border-bottom: 2px solid var(--table-border);
        }

        td {
            padding: 15px;
            border-bottom: 1px solid var(--table-border);
            font-size: 0.95rem;
            color: var(--text-main);
        }

        tr:hover {
            background-color: #f8fafc;
        }

        /* Status Badge */
        .status-pill {
            display: inline-block;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
            background: #e0e7ff;
            color: var(--accent-blue);
            text-transform: capitalize;
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            text-decoration: none;
            color: var(--text-muted);
            font-weight: 600;
            font-size: 0.9rem;
        }

        .back-link:hover {
            color: var(--accent-blue);
            transform: translateX(-5px);
        }

        /* Responsive */
        @media (max-width: 600px) {
            .container { padding: 20px; }
            th, td { padding: 10px; font-size: 0.8rem; }
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>My Applications</h2>

        <table>
            <thead>
                <tr>
                    <th>Job Title</th>
                    <th>Company</th>
                    <th>Date Applied</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="app" items="${applications}">
                    <tr>
                        <td style="font-weight: 600;">${app.jobTitle}</td>
                        <td>${app.companyName}</td>
                        <td style="color: var(--text-muted);">${app.applicationDate}</td>
                        <td>
                            <span class="status-pill">${app.status}</span>
                        </td>
                    </tr>
                </c:forEach>
                
                <c:if test="${empty applications}">
                    <tr>
                        <td colspan="4" style="text-align: center; color: var(--text-muted); padding: 40px;">
                            No applications found.
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>

        <a href="${pageContext.request.contextPath}/jsp/Student/studentDashboard.jsp" class="back-link">
            ← Back to Dashboard
        </a>
    </div>

</body>
</html>