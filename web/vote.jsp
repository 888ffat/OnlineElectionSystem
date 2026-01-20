<%@ page import="java.sql.*, com.mvc.util.DBConnection" %>
<%
    int eid = Integer.parseInt(request.getParameter("eid"));
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Vote</title>

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
        padding: 30px 25px;
        border-radius: 12px;
        box-shadow: 0 4px 16px rgba(0,0,0,0.15);
        max-width: 500px;
        width: 90%;
        text-align: center;
        margin-top: 40px; 
    }

    h2 {
        color: #305fbf;
        margin-bottom: 25px;
        font-size: 22px;
    }

    .candidate-option {
        display: block;
        margin: 12px 0;
        font-size: 16px;
        cursor: pointer;
        padding: 10px 12px;
        border-radius: 8px;
        border: 1px solid #ccc;
        transition: 0.3s;
        text-align: left;
    }

    .candidate-option:hover {
        background: #f0f4ff;
        border-color: #305fbf;
    }

    input[type="radio"] {
        margin-right: 10px;
        cursor: pointer;
    }

    button {
        margin-top: 20px;
        padding: 12px 22px;
        background: linear-gradient(90deg, #305fbf, #4a80ff);
        color: white;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        cursor: pointer;
        transition: 0.3s;
        width: 100%;
    }

    button:hover {
        background: linear-gradient(90deg, #234a99, #3766ff);
        transform: scale(1.03);
    }

    .back-btn {
        display: inline-block;
        margin-top: 25px;
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

    <h2>Select Your Candidate</h2>

    <form method="post" action="VoteServlet">
        <input type="hidden" name="eid" value="<%= eid %>">

        <%
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                con = DBConnection.getConnection();
                ps = con.prepareStatement(
                    "SELECT candidate_id, name FROM candidates WHERE election_id=?"
                );
                ps.setInt(1, eid);
                rs = ps.executeQuery();

                boolean hasCandidate = false;

                while (rs.next()) {
                    hasCandidate = true;
        %>
            <label class="candidate-option">
                <input type="radio" name="cid" value="<%= rs.getInt("candidate_id") %>" required>
                <%= rs.getString("name") %>
            </label>
        <%
                }

                if (!hasCandidate) {
        %>
            <p style="color:red;">No candidates available for this election.</p>
        <%
                }
            } catch (Exception e) {
        %>
            <p style="color:red;"><%= e.getMessage() %></p>
        <%
            } finally {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            }
        %>

        <button type="submit">Submit Vote</button>
    </form>

    <a href="active_elections.jsp" class="back-btn">Back to Elections</a>

</div>

</body>
</html>
