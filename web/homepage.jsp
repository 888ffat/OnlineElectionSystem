<%@ page import="java.sql.*, com.mvc.util.DBConnection" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Ongoing Student Elections</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: "Segoe UI", Arial, sans-serif;
        background: #eef2f7;
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
        max-width: 700px;
        margin: 40px auto;
        text-align: center;
    }

    h2 {
        color: #305fbf;
        margin-bottom: 25px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 25px;
    }

    th, td {
        padding: 12px;
        border: 1px solid #ccc;
        text-align: center;
    }

    th {
        background: #305fbf;
        color: white;
        font-weight: bold;
    }

    tr:nth-child(even) {
        background: #f5f7fa;
    }

    a {
        text-decoration: none;
        font-weight: bold;
        color: #305fbf;
    }

    a:hover {
        text-decoration: underline;
    }

    .home-btn {
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

    .home-btn:hover {
        background: #b7322e;
}
</style>
</head>

<body>

<div class="header-banner">Online Student Election System</div>

<div class="container">
    <h2>Ongoing Student Elections</h2>

    <table>
        <tr>
            <th>Election</th>
            <th>Vote</th>
            <th>Results</th>
        </tr>

        <%
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM elections WHERE status='active' AND NOW() BETWEEN start_date AND end_date";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while(rs.next()){
        %>
        <tr>
            <td><%= rs.getString("title") %></td>
            <td>
                <a href="login.jsp">Vote</a>
            </td>
            <td>
                <a href="ResultServlet?eid=<%= rs.getInt("election_id") %>">
                    View Results
                </a>
            </td>
        </tr>
        <% } %>
    </table>

    
    <a href="voter_dashboard.jsp" class="home-btn">Back</a>
</div>

</body>
</html>
