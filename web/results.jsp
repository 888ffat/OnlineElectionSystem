<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Election Results</title>

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
    margin-top: 40px;
    text-align: center;
}

h2 {
    color: #305fbf;
    margin-bottom: 20px;
    font-size: 22px;
}

h3 {
    color: #305fbf;
    margin-top: 25px;
    margin-bottom: 15px;
    font-size: 18px;
}

ul {
    list-style-type: none;
    padding: 0;
}

ul li {
    background: #f5f7fa;
    margin: 8px 0;
    padding: 12px 15px;
    border-radius: 8px;
    font-size: 16px;
    color: #333;
    box-shadow: 0 1px 4px rgba(0,0,0,0.08);
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
    <h2>Live Election Results</h2>

    <h3>Results:</h3>

    <ul>
        <%
            ResultSet rs = (ResultSet) request.getAttribute("results");

            if (rs != null) {
                boolean hasData = false;
                while (rs.next()) {
                    hasData = true;
        %>
            <li>
                <strong><%= rs.getString("name") %></strong>
                : <%= rs.getInt("total") %> votes
            </li>
        <%
                }
                if (!hasData) {
        %>
            <li>No votes recorded yet.</li>
        <%
                }
            } else {
        %>
            <li>Results unavailable.</li>
        <%
            }
        %>
    </ul>

    <a href="homepage.jsp" class="back-btn">Back to Home</a>
</div>

</body>
</html>
