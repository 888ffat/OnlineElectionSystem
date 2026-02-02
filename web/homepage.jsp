<%@ page import="java.sql.*, com.mvc.util.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Active Elections</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: "Segoe UI", Arial, sans-serif;
        background: #eef2f7;
    }

    /* ===== Layout ===== */
    .layout {
        display: flex;
        min-height: 100vh;
    }

    /* ===== Sidebar (MATCHED) ===== */
    .sidebar {
        width: 230px;
        background: #1f3c88;
        color: white;
        padding-top: 10px;   /* SAME */
        box-shadow: 2px 0 8px rgba(0,0,0,0.15);
    }

    .sidebar h2 {
        text-align: center;
        margin-bottom: 30px;
        font-size: 20px;
        letter-spacing: 1px;
    }

    .sidebar a {
        display: block;
        padding: 14px 25px;
        color: white;
        text-decoration: none;
        font-size: 16px;
        transition: 0.3s;
    }

    .sidebar a:hover,
    .sidebar a.active {
        background: #4a80ff;
    }

    /* ===== Main Content ===== */
    .main-content {
        flex: 1;
        background: #eef2f7;
    }

    .header-banner {
        background: linear-gradient(to right, #305fbf, #4a80ff);
        color: white;
        padding: 20px;
        text-align: center;
        font-size: 26px;
        font-weight: bold;
        letter-spacing: 1px;
        box-shadow: 0 3px 8px rgba(0,0,0,0.15);
    }

    .container {
        max-width: 900px;
        margin: 40px auto;
        padding: 0 20px;
    }

    .page-title {
        background: #ffffff;
        color: #305fbf;
        padding: 18px 20px;
        font-size: 22px;
        font-weight: bold;
        border-radius: 10px;
        text-align: center;
        box-shadow: 0 3px 6px rgba(0,0,0,0.1);
    }

    .elections {
        margin-top: 25px;
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
        gap: 20px;
    }

    .card {
        background: white;
        padding: 20px;
        border-radius: 12px;
        box-shadow: 0 3px 10px rgba(0,0,0,0.10);
        transition: 0.25s ease;
        text-align: center;
        text-decoration: none;
        color: inherit;
    }

    .card:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 16px rgba(0,0,0,0.15);
    }

    .card h3 {
        margin: 0 0 10px;
        font-size: 20px;
        color: #305fbf;
    }

    .card p {
        margin: 0;
        color: #555;
        font-size: 14px;
        line-height: 1.4;
    }

    .back-btn {
        display: block;
        width: 180px;
        text-align: center;
        margin: 40px auto 0;
        padding: 12px;
        background: #d9534f;
        color: white;
        border-radius: 6px;
        text-decoration: none;
        font-size: 16px;
        transition: 0.3s;
    }

    .back-btn:hover {
        background: #b7322e;
    }
</style>
</head>

<body>

<div class="layout">

    <!-- ===== Sidebar ===== -->
    <div class="sidebar">
        <h2>Menu</h2>
        <a href="voter_dashboard.jsp">Home</a>
        <a href="active_elections.jsp" class="active">Active Elections</a>
        <a href="vote_history.jsp">Vote History</a>
    </div>

    <!-- ===== Main Content ===== -->
    <div class="main-content">

        <div class="header-banner">Online Student Election System</div>

        <div class="container">

            <div class="page-title">Active Elections</div>

            <div class="elections">

                <%
                    Connection con = null;
                    Statement st = null;
                    ResultSet rs = null;

                    try {
                        con = DBConnection.getConnection();
                        st = con.createStatement();
                        rs = st.executeQuery(
                            "SELECT election_id, title, description FROM elections WHERE status='active'"
                        );

                        boolean hasData = false;

                        while (rs.next()) {
                            hasData = true;
                %>
                    <a href="vote.jsp?eid=<%= rs.getInt("election_id") %>" class="card">
                        <h3><%= rs.getString("title") %></h3>
                        <p>
                            <%= rs.getString("description") != null 
                                ? rs.getString("description") 
                                : "Click to cast your vote in this election." %>
                        </p>
                    </a>
                <%
                        }

                        if (!hasData) {
                %>
                    <div class="card">
                        <h3>No Active Elections</h3>
                        <p>Please check back later.</p>
                    </div>
                <%
                        }
                    } catch (Exception e) {
                %>
                    <div class="card">
                        <h3>Error</h3>
                        <p><%= e.getMessage() %></p>
                    </div>
                <%
                    } finally {
                        if (rs != null) rs.close();
                        if (st != null) st.close();
                        if (con != null) con.close();
                    }
                %>

            </div>

            <a href="voter_dashboard.jsp" class="back-btn">Back to Dashboard</a>

        </div>

    </div>
</div>

</body>
</html>
