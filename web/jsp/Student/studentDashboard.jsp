<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <style>
        :root {
            --bg-color: #f8fafc;
            --accent-blue: #2563eb;
            --card-bg: #ffffff;
            --text-main: #0f172a;
            --text-muted: #64748b;
            --shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.05);
            --card-hover: rgba(37, 99, 235, 0.04);
        }

        * { box-sizing: border-box; transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1); }

        body {
            margin: 0;
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            background-color: var(--bg-color);
            background-image: radial-gradient(at 0% 0%, rgba(37, 99, 235, 0.05) 0px, transparent 50%);
            color: var(--text-main);
            min-height: 100vh;
            padding: 40px 20px;
        }

        .dashboard-wrapper {
            max-width: 1000px;
            margin: 0 auto;
        }

        /* Modern Header */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 50px;
            padding-bottom: 25px;
            border-bottom: 2px solid #edf2f7;
        }

        .header h2 { margin: 0; font-size: 2rem; font-weight: 800; letter-spacing: -0.5px; }
        .welcome-text { color: var(--text-muted); font-size: 1rem; margin-top: 5px; }
        .welcome-text span { color: var(--accent-blue); font-weight: 700; }

        /* Grid for Action Cards */
        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }

        .action-card {
            background: var(--card-bg);
            padding: 35px;
            border-radius: 28px;
            border: 1px solid #edf2f7;
            text-decoration: none;
            color: inherit;
            display: flex;
            flex-direction: column;
            box-shadow: var(--shadow);
            position: relative;
        }

        .action-card:hover {
            transform: translateY(-10px);
            border-color: var(--accent-blue);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.08);
        }

        /* Custom Box Icon (IDE Friendly) */
        .icon-indicator {
            width: 45px;
            height: 6px;
            background: var(--accent-blue);
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .action-card h3 {
            margin: 0 0 12px 0;
            font-size: 1.4rem;
            font-weight: 700;
            color: var(--text-main);
        }

        .action-card p {
            margin: 0;
            color: var(--text-muted);
            font-size: 0.95rem;
            line-height: 1.6;
        }

        /* Action Arrow */
        .action-arrow {
            margin-top: 25px;
            font-weight: 700;
            font-size: 0.85rem;
            color: var(--accent-blue);
            text-transform: uppercase;
            letter-spacing: 1px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        /* Logout Button */
        .logout-btn {
            display: inline-flex;
            padding: 12px 24px;
            background: #fff;
            color: #ef4444;
            text-decoration: none;
            border-radius: 14px;
            font-weight: 700;
            font-size: 0.9rem;
            border: 1px solid #fee2e2;
            box-shadow: 0 4px 6px rgba(0,0,0,0.02);
        }

        .logout-btn:hover { background: #fee2e2; transform: translateY(-2px); }

        @media (max-width: 600px) {
            .header { flex-direction: column; align-items: center; text-align: center; gap: 20px; }
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
            <a href="${pageContext.request.contextPath}/StudentServlet?action=viewJobs" class="action-card">
                <div class="icon-indicator"></div>
                <h3>Job Opportunities</h3>
                <p>Browse through active recruitment drives and internship openings tailored for your profile.</p>
                <div class="action-arrow">Explore Jobs &rarr;</div>
            </a>

            <a href="${pageContext.request.contextPath}/StudentServlet?action=myApplications" class="action-card">
                <div class="icon-indicator" style="background: #10b981;"></div>
                <h3>My Applications</h3>
                <p>Check your current application status, interview feedbacks, and selection results.</p>
                <div class="action-arrow" style="color: #10b981;">View Status &rarr;</div>
            </a>

            <a href="${pageContext.request.contextPath}/StudentServlet?action=profile" class="action-card">
                <div class="icon-indicator" style="background: #8b5cf6;"></div>
                <h3>Personal Profile</h3>
                <p>Manage your academic records, update your CGPA, and keep your contact info synchronized.</p>
                <div class="action-arrow" style="color: #8b5cf6;">Update Profile &rarr;</div>
            </a>
        </div>
    </div>

</body>
</html>