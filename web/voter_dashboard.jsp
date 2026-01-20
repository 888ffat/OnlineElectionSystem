<%@ page import="com.mvc.model.User" %>
<%
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
<title>Voter Dashboard</title>

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

.welcome {
    margin-top: 25px;
    font-size: 20px;
    color: #305fbf;
    font-weight: bold;
}

.container {
    max-width: 900px;
    width: 90%;
    margin-top: 30px;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
    gap: 20px;
}

.card {
    background: white;
    padding: 22px;
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
    margin-bottom: 10px;
    color: #305fbf;
    font-size: 20px;
}

.card p {
    color: #555;
    font-size: 14px;
    line-height: 1.4;
}

.success {
    margin-top: 15px;
    color: green;
    font-weight: bold;
}

.logout-btn {
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

.logout-btn:hover {
    background: #b7322e;
}
</style>
</head>

<body>

<div class="header-banner">Online Student Election System</div>

<div class="welcome">
    Welcome, <%= user.getFullName() %>
</div>

<% if (request.getParameter("msg") != null) { %>
    <div class="success">Vote submitted successfully!</div>
<% } %>

<div class="container">
    <a href="active_elections.jsp" class="card">
        <h3>Active Elections</h3>
        <p>View and participate in ongoing elections on campus.</p>
    </a>

    <a href="homepage.jsp" class="card">
        <h3>Election Results</h3>
        <p>View active and past election outcomes.</p>
    </a>

    <a href="vote_history.jsp" class="card">
        <h3>Voting History</h3>
        <p>Check all your previous votes and election activity.</p>
    </a>
</div>

<a href="LogoutServlet" class="logout-btn">Logout</a>

</body>
</html>
