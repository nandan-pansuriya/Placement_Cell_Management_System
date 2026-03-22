<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post New Job</title>
    <style>
        :root {
            --bg-color: #f8fafc;
            --accent-sky: #0ea5e9;
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
            background-image: radial-gradient(at 100% 0%, rgba(14, 165, 233, 0.05) 0px, transparent 50%);
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 50px 20px;
            color: var(--text-main);
        }

        .form-card {
            width: 100%;
            max-width: 600px;
            background: var(--card-bg);
            border-radius: 24px;
            border: 1px solid #edf2f7;
            box-shadow: var(--shadow);
            padding: 40px;
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

        /* Message Alerts */
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

        /* Form Layout */
        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .form-group { margin-bottom: 20px; }
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

        input, select, textarea {
            width: 100%;
            padding: 12px 16px;
            border-radius: 12px;
            border: 1px solid var(--input-border);
            background: #fafafa;
            font-size: 1rem;
            outline: none;
            color: var(--text-main);
            font-family: inherit;
        }

        input:focus, select:focus, textarea:focus {
            background: white;
            border-color: var(--accent-sky);
            box-shadow: 0 0 0 4px rgba(14, 165, 233, 0.1);
        }

        textarea { resize: vertical; }

        /* Button Styling */
        .btn-group {
            display: grid;
            grid-template-columns: 2fr 1fr;
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

        .btn-submit {
            background: var(--accent-sky);
            color: white;
        }

        .btn-submit:hover {
            background: #0284c7;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(14, 165, 233, 0.2);
        }

        .btn-reset {
            background: #f1f5f9;
            color: var(--text-muted);
        }

        .btn-reset:hover { background: #e2e8f0; }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 25px;
            text-decoration: none;
            color: var(--text-muted);
            font-size: 0.9rem;
            font-weight: 500;
        }

        .back-link:hover { color: var(--accent-sky); }
    </style>
</head>
<body>

    <div class="form-card">
        <header>
            <h2>Post Job Opportunity</h2>
            <div class="subtitle">Publish a new recruitment drive for students</div>
        </header>

        <c:if test="${not empty message}">
            <div class="alert ${messageType == 'success' ? 'alert-success' : 'alert-error'}">
                ${message}
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/JobServlet" method="post">
            
            <div class="form-grid">
                <div class="form-group full-width">
                    <label>Select Partner Company</label>
                    <select name="companyId" required>
                        <option value="">-- Choose Company --</option>
                        <c:forEach var="company" items="${companyList}">
                            <option value="${company.companyId}">${company.companyName}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group full-width">
                    <label>Job Title / Position</label>
                    <input type="text" name="jobTitle" placeholder="e.g. Associate Software Engineer" required>
                </div>

                <div class="form-group full-width">
                    <label>Brief Job Description</label>
                    <textarea name="jobDescription" rows="4" placeholder="Detail the roles and responsibilities..." required></textarea>
                </div>

                <div class="form-group">
                    <label>Annual Salary (LPA)</label>
                    <input type="number" name="salary" step="0.01" placeholder="e.g. 6.50" required>
                </div>

                <div class="form-group">
                    <label>Eligibility (Min CGPA)</label>
                    <input type="number" name="eligibilityCgpa" step="0.01" placeholder="e.g. 7.5" required>
                </div>

                <div class="form-group full-width">
                    <label>Application Deadline</label>
                    <input type="date" name="lastDate" required>
                </div>
            </div>

            <div class="btn-group">
                <button type="submit" class="btn-submit">Publish Job Posting</button>
                <button type="reset" class="btn-reset">Clear</button>
            </div>
        </form>

        <a href="${pageContext.request.contextPath}/jsp/PlacementOfficer/PlacementOfficerDashboard.jsp" class="back-link">
            &larr; Back to Dashboard
        </a>
    </div>

</body>
</html>