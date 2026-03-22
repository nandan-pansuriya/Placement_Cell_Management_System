<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Jobs | Officer Portal</title>
    <style>
        :root {
            --bg-color: #f8fafc;
            --accent-sky: #0ea5e9;
            --card-bg: #ffffff;
            --text-main: #0f172a;
            --text-muted: #64748b;
            --table-border: #f1f5f9;
            --shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.05);
        }

        * { box-sizing: border-box; transition: all 0.2s ease; }

        body {
            margin: 0;
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            background-color: var(--bg-color);
            background-image: radial-gradient(at 0% 100%, rgba(14, 165, 233, 0.03) 0px, transparent 50%);
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 50px 20px;
            color: var(--text-main);
        }

        .container {
            width: 100%;
            max-width: 1200px;
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

        /* Modern Data Table */
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
            font-size: 0.9rem;
            color: var(--text-main);
            vertical-align: top;
        }

        tr:hover td {
            background-color: rgba(14, 165, 233, 0.02);
        }

        /* Styling for Specific Columns */
        .job-title { font-weight: 700; color: var(--accent-sky); }
        .company-name { font-weight: 600; color: var(--text-main); }
        .description-cell { 
            max-width: 300px; 
            color: var(--text-muted); 
            font-size: 0.85rem;
            line-height: 1.5;
        }
        .salary-badge { font-weight: 700; color: #059669; }
        .cgpa-pill {
            background: #f1f5f9;
            padding: 2px 8px;
            border-radius: 6px;
            font-weight: 600;
            font-size: 0.8rem;
        }

        .back-link {
            text-decoration: none;
            color: var(--text-muted);
            font-weight: 600;
            font-size: 0.9rem;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .back-link:hover { color: var(--accent-sky); transform: translateX(-5px); }

        @media (max-width: 900px) {
            .container { padding: 20px; overflow-x: auto; }
            .description-cell { min-width: 200px; }
        }
    </style>
</head>
<body>

    <div class="container">
        <header>
            <h2>Posted Job Openings</h2>
            <a href="${pageContext.request.contextPath}/jsp/PlacementOfficer/PlacementOfficerDashboard.jsp" class="back-link">
                &larr; Return to Dashboard
            </a>
        </header>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Organization</th>
                    <th>Job Position</th>
                    <th>Description</th>
                    <th>Salary (LPA)</th>
                    <th>Min CGPA</th>
                    <th>Deadline</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="job" items="${jobList}">
                    <tr>
                        <td style="color: var(--text-muted); font-family: monospace;">#${job.jobId}</td>
                        <td class="company-name">${job.companyName}</td>
                        <td class="job-title">${job.jobTitle}</td>
                        <td class="description-cell">${job.jobDescription}</td>
                        <td class="salary-badge">${job.salary}</td>
                        <td><span class="cgpa-pill">${job.eligibilityCgpa}+</span></td>
                        <td style="font-weight: 600; color: #d97706;">${job.lastDate}</td>
                    </tr>
                </c:forEach>
                
                <c:if test="${empty jobList}">
                    <tr>
                        <td colspan="7" style="text-align: center; color: var(--text-muted); padding: 60px;">
                            You haven't posted any job opportunities yet.
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>

</body>
</html>