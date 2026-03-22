<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Officer Dashboard</title>
    <style>
        :root {
            --bg-color: #f8fafc;
            --accent-blue: #2563eb;
            --accent-green: #10b981;
            --accent-purple: #8b5cf6;
            --card-bg: #ffffff;
            --text-main: #0f172a;
            --text-muted: #64748b;
            --shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.05);
        }

        * { box-sizing: border-box; transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1); }

        body {
            margin: 0;
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            background-color: var(--bg-color);
            color: var(--text-main);
            min-height: 100vh;
            padding: 40px 20px;
        }

        .dashboard-wrapper {
            max-width: 1100px;
            margin: 0 auto;
        }

        /* Matches Student Header Exactly */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 50px;
        }

        .header h2 { 
            margin: 0; 
            font-size: 2.2rem; 
            font-weight: 800; 
            letter-spacing: -1px; 
        }

        .welcome-text { 
            color: var(--text-muted); 
            font-size: 1rem; 
            margin-top: 8px; 
        }

        .welcome-text span { 
            color: var(--accent-blue); 
            font-weight: 700; 
        }

        /* Logout Button - Matches Student Side */
        .logout-btn {
            padding: 10px 24px;
            background: #fff;
            color: #ef4444;
            text-decoration: none;
            border-radius: 12px;
            font-weight: 700;
            font-size: 0.9rem;
            border: 1px solid #fee2e2;
            box-shadow: 0 4px 6px rgba(0,0,0,0.02);
        }

        .logout-btn:hover { background: #fee2e2; transform: translateY(-2px); }

        /* Card Grid */
        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 30px;
        }

        .action-card {
            background: var(--card-bg);
            padding: 45px 35px;
            border-radius: 32px;
            border: 1px solid #f1f5f9;
            text-decoration: none;
            color: inherit;
            display: flex;
            flex-direction: column;
            box-shadow: var(--shadow);
            position: relative;
        }

        .action-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.1);
        }

        /* Top Color Bar - Matches Student Dashboard */
        .icon-indicator {
            width: 45px;
            height: 6px;
            background: var(--accent-blue);
            border-radius: 10px;
            margin-bottom: 25px;
        }

        .action-card h3 {
            margin: 0 0 15px 0;
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--text-main);
        }

        .action-card p {
            margin: 0 0 25px 0;
            color: var(--text-muted);
            font-size: 1rem;
            line-height: 1.6;
        }

        /* Sub-links inside cards */
        .sub-link-group {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .sub-link {
            text-decoration: none;
            font-weight: 700;
            font-size: 0.9rem;
            color: var(--accent-blue);
            text-transform: uppercase;
            letter-spacing: 0.5px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .sub-link:hover { opacity: 0.7; transform: translateX(5px); }

        @media (max-width: 600px) {
            .header { flex-direction: column; gap: 20px; }
            .card-grid { grid-template-columns: 1fr; }
        }
    </style>
</head>
<body>

    <div class="dashboard-wrapper">
        <header class="header">
            <div>
                <h2>Dashboard</h2>
                <div class="welcome-text">Authenticated as <span>${loggedUser.username}</span></div>
            </div>
            <a href="${pageContext.request.contextPath}/logout" class="logout-btn">
                Logout
            </a>
        </header>

        <div class="card-grid">
            <div class="action-card">
                <div class="icon-indicator"></div>
                <h3>Company Admin</h3>
                <p>Register new corporate partners and manage existing recruitment profiles.</p>
                <div class="sub-link-group">
                    <a href="addCompany.jsp" class="sub-link">Add New Company &rarr;</a>
                    <a href="${pageContext.request.contextPath}/CompanyServlet?action=list" class="sub-link">View All Company &rarr;</a>
                </div>
            </div>

            <div class="action-card">
                <div class="icon-indicator" style="background: var(--accent-green);"></div>
                <h3>Job Postings</h3>
                <p>Post new vacancies, update eligibility criteria, and monitor active job drives.</p>
                <div class="sub-link-group">
                    <a href="${pageContext.request.contextPath}/JobServlet?action=addForm" class="sub-link" style="color: var(--accent-green);">Post New Job &rarr;</a>
                    <a href="${pageContext.request.contextPath}/JobServlet?action=list" class="sub-link" style="color: var(--accent-green);">List All Jobs &rarr;</a>
                </div>
            </div>

            <div class="action-card">
                <div class="icon-indicator" style="background: var(--accent-purple);"></div>
                <h3>Officer Control</h3>
                <p>Review student applications and maintain your officer administrative profile.</p>
                <div class="sub-link-group">
                    <a href="${pageContext.request.contextPath}/ApplicationServlet?action=list" class="sub-link" style="color: var(--accent-purple);">Student Applications &rarr;</a>
                    <a href="${pageContext.request.contextPath}/PlacementOfficerServlet?action=profile" class="sub-link" style="color: var(--accent-purple);">MY Profile &rarr;</a>
                </div>
            </div>
        </div>
    </div>

</body>
</html>