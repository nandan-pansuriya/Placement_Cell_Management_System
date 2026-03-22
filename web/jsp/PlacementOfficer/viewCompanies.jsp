<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Company Directory</title>
    <style>
        :root {
            --bg-color: #f8fafc;
            --accent-indigo: #4f46e5;
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
            background-image: radial-gradient(at 100% 100%, rgba(79, 70, 229, 0.03) 0px, transparent 50%);
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

        /* Modern Table Directory Style */
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
            padding: 18px 16px;
            border-bottom: 1px solid var(--table-border);
            font-size: 0.95rem;
            color: var(--text-main);
        }

        tr:last-child td { border-bottom: none; }

        tr:hover td {
            background-color: rgba(79, 70, 229, 0.02);
        }

        /* Branding Tags */
        .company-name {
            font-weight: 700;
            color: var(--accent-indigo);
            font-size: 1rem;
        }

        .id-badge {
            color: var(--text-muted);
            font-family: monospace;
            font-size: 0.85rem;
        }

        .contact-info {
            font-size: 0.9rem;
            color: var(--text-muted);
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

        .back-link:hover { color: var(--accent-indigo); transform: translateX(-5px); }

        @media (max-width: 768px) {
            .container { padding: 20px; overflow-x: auto; }
            th, td { padding: 12px; font-size: 0.85rem; }
        }
    </style>
</head>
<body>

    <div class="container">
        <header>
            <h2>Company Directory</h2>
            <a href="${pageContext.request.contextPath}/jsp/PlacementOfficer/PlacementOfficerDashboard.jsp" class="back-link">
                &larr; Return to Dashboard
            </a>
        </header>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Organization</th>
                    <th>Location</th>
                    <th>HR Representative</th>
                    <th>Email Address</th>
                    <th>Phone</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="company" items="${companyList}">
                    <tr>
                        <td class="id-badge">${company.companyId}</td>
                        <td class="company-name">${company.companyName}</td>
                        <td>${company.location}</td>
                        <td>${company.hrName}</td>
                        <td class="contact-info">${company.hrEmail}</td>
                        <td class="contact-info">${company.hrPhone}</td>
                    </tr>
                </c:forEach>
                
                <c:if test="${empty companyList}">
                    <tr>
                        <td colspan="6" style="text-align: center; color: var(--text-muted); padding: 60px;">
                            No registered companies found in the database.
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>

</body>
</html>