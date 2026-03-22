<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Company</title>
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
            background-image: radial-gradient(at 0% 0%, rgba(79, 70, 229, 0.05) 0px, transparent 50%);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            padding: 40px 20px;
            color: var(--text-main);
        }

        .form-card {
            width: 100%;
            max-width: 500px;
            background: var(--card-bg);
            border-radius: 24px;
            border: 1px solid #edf2f7;
            box-shadow: var(--shadow);
            padding: 40px;
        }

        header {
            text-align: center;
            margin-bottom: 30px;
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

        /* Message Notifications */
        .alert {
            padding: 12px;
            border-radius: 12px;
            text-align: center;
            font-size: 0.9rem;
            font-weight: 600;
            margin-bottom: 25px;
            border: 1px solid transparent;
        }
        .alert-success { background: #ecfdf5; color: var(--success-green); border-color: #d1fae5; }
        .alert-error { background: #fef2f2; color: var(--error-red); border-color: #fee2e2; }

        /* Form Styling */
        .form-group {
            margin-bottom: 20px;
        }

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
            border-color: var(--accent-indigo);
            box-shadow: 0 0 0 4px rgba(79, 70, 229, 0.1);
        }

        /* Button Container */
        .btn-group {
            display: grid;
            grid-template-columns: 1fr 2fr;
            gap: 15px;
            margin-top: 30px;
        }

        button {
            padding: 14px;
            border-radius: 12px;
            font-size: 0.95rem;
            font-weight: 700;
            cursor: pointer;
            border: none;
        }

        .btn-reset {
            background: #f1f5f9;
            color: var(--text-muted);
        }

        .btn-reset:hover { background: #e2e8f0; }

        .btn-submit {
            background: var(--accent-indigo);
            color: white;
        }

        .btn-submit:hover {
            background: #4338ca;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(79, 70, 229, 0.2);
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

        .back-link:hover { color: var(--accent-indigo); }
    </style>
</head>
<body>

    <div class="form-card">
        <header>
            <h2>Add Company</h2>
            <div class="subtitle">Enter new corporate partner details</div>
        </header>

        <c:if test="${not empty message}">
            <div class="alert ${messageType == 'success' ? 'alert-success' : 'alert-error'}">
                ${message}
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/CompanyServlet" method="post">
            
            <div class="form-group">
                <label>Company Name</label>
                <input type="text" name="companyName" placeholder="e.g. Google India" required>
            </div>

            <div class="form-group">
                <label>Location</label>
                <input type="text" name="location" placeholder="e.g. Bangalore, KA" required>
            </div>

            <div class="form-group">
                <label>HR Representative Name</label>
                <input type="text" name="hrName" placeholder="Full name of contact" required>
            </div>

            <div class="form-group">
                <label>HR Email Address</label>
                <input type="email" name="hrEmail" placeholder="hr@company.com" required>
            </div>

            <div class="form-group">
                <label>HR Phone Number</label>
                <input type="text" name="hrPhone" placeholder="+91 ..." required>
            </div>

            <div class="btn-group">
                <button type="reset" class="btn-reset">Clear</button>
                <button type="submit" class="btn-submit">Add Company</button>
            </div>
        </form>

        <a href="${pageContext.request.contextPath}/jsp/PlacementOfficer/PlacementOfficerDashboard.jsp" class="back-link">
            &larr; Back to Dashboard
        </a>
    </div>

</body>
</html>