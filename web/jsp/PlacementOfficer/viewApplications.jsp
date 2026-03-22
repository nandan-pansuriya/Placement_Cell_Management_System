<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Review Applications</title>
    <style>
        :root {
            --bg-color: #f8fafc;
            --accent-indigo: #4f46e5;
            --card-bg: #ffffff;
            --text-main: #0f172a;
            --text-muted: #64748b;
            --table-border: #f1f5f9;
            --btn-select: #10b981;
            --btn-reject: #f43f5e;
            --shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.05);
        }

        * { box-sizing: border-box; transition: all 0.2s ease; }

        body {
            margin: 0;
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            background-color: var(--bg-color);
            background-image: radial-gradient(at 0% 0%, rgba(79, 70, 229, 0.03) 0px, transparent 50%);
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 50px 20px;
            color: var(--text-main);
        }

        .container {
            width: 100%;
            max-width: 1100px;
            background: var(--card-bg);
            border-radius: 24px;
            border: 1px solid #edf2f7;
            box-shadow: var(--shadow);
            padding: 40px;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 35px;
            padding-bottom: 20px;
            border-bottom: 1px solid var(--table-border);
        }

        h2 {
            margin: 0;
            font-size: 1.8rem;
            font-weight: 800;
            letter-spacing: -0.5px;
        }

        /* Modern Table Design */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        th {
            text-align: left;
            padding: 16px;
            background: #f8fafc;
            color: var(--text-muted);
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            border-bottom: 2px solid var(--table-border);
        }

        td {
            padding: 16px;
            border-bottom: 1px solid var(--table-border);
            font-size: 0.95rem;
            color: var(--text-main);
        }

        tr:hover {
            background-color: rgba(79, 70, 229, 0.02);
        }

        /* Status Badge */
        .status-pill {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 8px;
            font-size: 0.8rem;
            font-weight: 700;
            background: #f1f5f9;
            color: var(--text-muted);
        }

        /* Action Buttons */
        .btn-action {
            padding: 8px 16px;
            border-radius: 8px;
            font-weight: 700;
            font-size: 0.8rem;
            cursor: pointer;
            border: none;
            margin-right: 5px;
            text-transform: uppercase;
        }

        .btn-select { background: #ecfdf5; color: var(--btn-select); border: 1px solid #d1fae5; }
        .btn-select:hover { background: var(--btn-select); color: white; }

        .btn-reject { background: #fff1f2; color: var(--btn-reject); border: 1px solid #ffe4e6; }
        .btn-reject:hover { background: var(--btn-reject); color: white; }

        .back-link {
            text-decoration: none;
            color: var(--text-muted);
            font-weight: 600;
            font-size: 0.9rem;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }

        .back-link:hover { color: var(--accent-indigo); }

        @media (max-width: 768px) {
            .container { padding: 20px; }
            th, td { padding: 10px; font-size: 0.8rem; }
        }
    </style>
</head>
<body>

    <div class="container">
        <header>
            <h2>Student Applications</h2>
            <a href="${pageContext.request.contextPath}/jsp/PlacementOfficer/PlacementOfficerDashboard.jsp" class="back-link">
                &larr; Dashboard
            </a>
        </header>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Student Name</th>
                    <th>Job Title</th>
                    <th>Company</th>
                    <th>Date</th>
                    <th>Current Status</th>
                    <th style="text-align: center;">Decision Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="app" items="${applications}">
                    <tr>
                        <td style="color: var(--text-muted);">#${app.applicationId}</td>
                        <td style="font-weight: 700;">${app.studentName}</td>
                        <td>${app.jobTitle}</td>
                        <td>${app.companyName}</td>
                        <td>${app.applicationDate}</td>
                        <td>
                            <span class="status-pill">${app.status}</span>
                        </td>
                        <td style="text-align: center;">
                            <form action="${pageContext.request.contextPath}/ApplicationServlet" method="get" style="display:inline;">
                                <input type="hidden" name="action" value="updateStatus">
                                <input type="hidden" name="id" value="${app.applicationId}">
                                <input type="hidden" name="status" value="SELECTED">
                                <button type="submit" class="btn-action btn-select">Select</button>
                            </form>

                            <form action="${pageContext.request.contextPath}/ApplicationServlet" method="get" style="display:inline;">
                                <input type="hidden" name="action" value="updateStatus">
                                <input type="hidden" name="id" value="${app.applicationId}">
                                <input type="hidden" name="status" value="REJECTED">
                                <button type="submit" class="btn-action btn-reject">Reject</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                
                <c:if test="${empty applications}">
                    <tr>
                        <td colspan="7" style="text-align: center; color: var(--text-muted); padding: 50px;">
                            No student applications available for review.
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>

</body>
</html>