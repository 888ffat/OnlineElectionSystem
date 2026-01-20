<%-- 
    Document   : vote_history
    Created on : Jan 14, 2026, 1:21:48?PM
    Author     : alyshaazfairul
--%>

<%@ page import="java.sql.*, com.mvc.util.DBConnection, com.mvc.model.User" %>
<%
    // ? Session & role check
    User user = (User) session.getAttribute("user");
    if (user == null || !"voter".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Voting History</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: "Segoe UI", Arial, sans-serif;
        background: #eef2f7;
        display: flex;
        flex-direction: column;
        align-items: center;
        min-height: 100vh;
    }

    .header-banner {
        width: 100%;
        background: linear-gradient(to right, #305fbf, #4a80ff);
        color: white;
        padding: 20px 0;
        text-align: center;
        font-size: 26px;
        font-weight: bold;
        letter-spacing: 1px;
        box-shadow: 0 3px 8px rgba(0,0,0,0.15);
    }

    .container {
        background: white;
        padding: 25px 20px;
        border-radius: 12px;
        box-shadow: 0 4px 16px rgba(0,0,0,0.15);
        max-width: 700px;
        width: 90%;
        margin-top: 30px;
        text-align: center;
    }

    h2 {
        color: #305fbf;
        margin-bottom: 25px;
        font-size: 22px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    th, td {
        padding: 12px 10px;
        border: 1px solid #ccc;
        text-align: left;
    }

    th {
        background: #305fbf;
        color: white;
        font-weight: bold;
    }

    tr:nth-child(even) {
        background: #f5f7fa;
    }

    tr:hover {
        background: #e0ebff;
    }

    .back-btn {
        display: inline-block;
        margin-top: 20px;
        padding: 12px 22px;
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

<div class="header-banner">Online Student Election System</div>

<div class="container">
    <h2>Your Voting History</h2>

    <table>
        <tr>
            <th>Election</th>
            <th>Voted For</th>
            <th>Date</th>
        </tr>

        <%
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            boolean hasData = false;

            try {
                con = DBConnection.getConnection();
                ps = con.prepareStatement(
                    "SELECT e.title AS election_title, c.name AS candidate_name, v.vote_time " +
                    "FROM votes v " +
                    "JOIN candidates c ON v.candidate_id = c.candidate_id " +
                    "JOIN elections e ON c.election_id = e.election_id " +
                    "WHERE v.user_id = ? " +
                    "ORDER BY v.vote_time DESC"
                );
                ps.setInt(1, user.getUserId());
                rs = ps.executeQuery();

                while (rs.next()) {
                    hasData = true;
        %>
            <tr>
                <td><%= rs.getString("election_title") %></td>
                <td><%= rs.getString("candidate_name") %></td>
                <td><%= rs.getTimestamp("vote_time") %></td>
            </tr>
        <%
                }

                if (!hasData) {
        %>
            <tr>
                <td colspan="3" style="text-align:center;color:#777;">
                    No voting history found.
                </td>
            </tr>
        <%
                }
            } catch (Exception e) {
        %>
            <tr>
                <td colspan="3" style="color:red;text-align:center;">
                    <%= e.getMessage() %>
                </td>
            </tr>
        <%
            } finally {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            }
        %>

    </table>

    <a href="voter_dashboard.jsp" class="back-btn">Back to Dashboard</a>
</div>

</body>
</html>
