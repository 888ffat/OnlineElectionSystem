<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Login - Online Student Election Management System</title>

<style>
    body { 
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background: linear-gradient(135deg, #3a7bd5, #00d2ff);
        height: 100vh;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .banner {
        width: 100%;
        background: linear-gradient(90deg, #004a99, #006bce);
        color: white;
        padding: 22px 0;
        text-align: center;
        font-size: 26px;
        font-weight: bold;
        letter-spacing: 1px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.3);
    }

    .container { 
        width: 380px; 
        background: rgba(255, 255, 255, 0.85);
        backdrop-filter: blur(6px);
        padding: 25px; 
        border-radius: 14px; 
        margin-top: 40px;
        box-shadow: 0 4px 25px rgba(0,0,0,0.3);
        animation: fadeIn 0.7s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    h2 { 
        text-align: center; 
        color: #4b0082;
        margin-bottom: 15px;
        font-size: 24px;
    }

    label { 
        display: block; 
        margin-top: 12px; 
        font-weight: bold;
        color: #3a0066;
    }

    input {
        width: 100%; 
        padding: 10px; 
        margin-top: 5px; 
        border-radius: 8px; 
        border: 1px solid #bbb; 
        font-size: 14px;
        transition: 0.3s;
    }

    input:focus {
        border-color: #6a0dad;
        box-shadow: 0 0 8px rgba(106, 13, 173, 0.5);
        outline: none;
    }

    button { 
        width: 100%; 
        padding: 12px; 
        background: linear-gradient(90deg, #005bb5, #003f80);
        color: white; 
        border: none; 
        border-radius: 8px; 
        margin-top: 18px; 
        cursor: pointer;
        font-size: 16px;
        font-weight: bold;
        letter-spacing: 1px;
        transition: 0.3s;
    }

    button:hover { 
        transform: scale(1.03);
        background: linear-gradient(90deg, #004a99, #003466);
        box-shadow: 0 4px 12px rgba(0,0,0,0.2);
    }

    .error {
        margin-top: 12px;
        color: red;
        text-align: center;
        font-weight: bold;
    }

    .footer {
        text-align: center;
        margin-top: 15px;
    }

    a {
        color: #4b0082;
        font-weight: bold;
        text-decoration: none;
    }

    a:hover {
        text-decoration: underline;
    }
</style>
</head>

<body>

<div class="banner">Online Election Management System</div>

<div class="container">
    <h2>Login Account</h2>

    <form method="post" action="LoginServlet">
        <label>Matric No</label>
        <input type="text" name="matric" placeholder="Enter matric number" required>

        <label>Password</label>
        <input type="password" name="password" placeholder="Enter password" required>

        <button type="submit">Login</button>

        <% if (request.getParameter("error") != null) { %>
            <div class="error">Invalid login</div>
        <% } %>
    </form>

    <div class="footer">
        Don't have an account? <a href="register.jsp">Register</a>
    </div>
</div>

</body>
</html>
