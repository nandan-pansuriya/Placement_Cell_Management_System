<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Jobs</title>
    <style>
        :root {
            --bg-color: #f8fafc;
            --accent-blue: #2563eb;
            --card-bg: #ffffff;
            --text-main: #0f172a;
            --text-muted: #64748b;
            --table-border: #e2e8f0;
            --success-green: #10b981;
            --error-red: #ef4444;
            --shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.05);
        }

        * { box-sizing: border-box; transition: all 0.2s ease; }

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

        .container {
            width: 100%;
            max-width: 1000px;
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
            margin-bottom: 30px;
        }

        h2 {
            margin: 0;
            font-size: 1.8rem;
            font-weight: 800;
            letter-spacing: -0.5px;
        }

        /* Sleek Notifications */
        .alert {
            padding: 12px 20px;
            border-radius: 12px;
            margin-bottom: 25px;
            font-size: 0.9rem;
            font-weight: 600;
            border: 1px solid transparent;
            text-align: center;
        }
        .alert-success { background: #ecfdf5; color: var(--success-green); border-color: #d1fae5; }
        .alert-error { background: #fef2f2; color: var(--error-red); border-color: #fee2e2; }

        /* Modern Table */
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 8px; /* Gives a "card" look to rows */
            margin-bottom: 30px;
        }

        th {
            text-align: left;
            padding: 15px;
            color: var(--text-muted);
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            border-bottom: 2px solid var(--table-border);
        }

        td {
            padding: 18px 15px;
            background: white;
            border-bottom: 1px solid #f1f5f9;
            font-size: 0.95rem;
        }

        tr:hover td {
            background-color: #f8fafc;
        }

        /* Apply Button */
        .btn-apply {
            background-color: var(--accent-blue);
            color: white;
            border: none;
            padding: 8px 20px;
            border-radius: 8px;
            font-weight: 700;
            font-size: 0.85rem;
            cursor: pointer;
            text-transform: uppercase;
        }

        .btn-apply:hover {
            background-color: #1d4ed8;
            transform: scale(1.05);
            box-shadow: 0 4px 12px rgba(37, 99, 235, 0.2);
        }

        .salary-tag {
            font-weight: 700;
            color: var(--text-main);
        }

        .date-tag {
            color: #f59e0b; /* Amber color for deadlines */
            font-weight: 600;
        }

        .back-link {
            text-decoration: none;
            color: var(--text-muted);
            font-weight: 600;
            font-size: 0.9rem;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }

        .back-link:hover { color: var(--accent-blue); }
    </style>
</head>
<body>

    <div class="container">
        <header>
            <h2>Available Jobs</h2>
            <a href="${pageContext.request.contextPath}/jsp/Student/studentDashboard.jsp" class="back-link">
                &larr; Dashboard
            </a>
        </header>

        <c:if test="${not empty message}">
            <div class="alert ${messageType == 'success' ? 'alert-success' : 'alert-error'}">
                ${message}
            </div>
        </c:if>

        <table>
            <thead>
                <tr>
                    <th>Job Title</th>
                    <th>Company</th>
                    <th>Salary</th>
                    <th>Min CGPA</th>
                    <th>Deadline</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="job" items="${jobList}">
                    <tr>
                        <td style="font-weight: 700;">${job.jobTitle}</td>
                        <td>${job.companyName}</td>
                        <td class="salary-tag">${job.salary}</td>
                        <td>
                            <span style="background: #f1f5f9; padding: 2px 8px; border-radius: 4px;">
                                ${job.eligibilityCgpa}+
                            </span>
                        </td>
                        <td class="date-tag">${job.lastDate}</td>
                        <td>
                            <form action="${pageContext.request.contextPath}/StudentServlet" method="get" style="margin:0;">
                                <input type="hidden" name="action" value="apply">
                                <input type="hidden" name="jobId" value="${job.jobId}">
                                <button type="submit" class="btn-apply">Apply</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                
                <c:if test="${empty jobList}">
                    <tr>
                        <td colspan="6" style="text-align: center; color: var(--text-muted); padding: 50px;">
                            No active job opportunities at the moment.
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>

</body>
</html>