<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Register - Online Student Election Management System</title>

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
        padding: 16px 0;
        text-align: center;
        font-size: 22px;
        font-weight: bold;
        letter-spacing: 1px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.3);
    }

    .container { 
        width: 500px;
        background: rgba(255, 255, 255, 0.85);
        backdrop-filter: blur(6px);
        padding: 18px;
        border-radius: 14px;
        margin-top: 20px;
        box-shadow: 0 4px 25px rgba(0,0,0,0.3);
        animation: fadeIn 0.7s ease-in-out;
        max-height: calc(100vh - 120px);
        overflow-y: auto;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    h2 { 
        text-align: center; 
        color: #4b0082;
        margin-bottom: 10px;
        font-size: 22px;
    }

    label { 
        display: block; 
        margin-top: 8px;
        font-weight: bold;
        color: #3a0066;
        font-size: 14px;
    }

    input {
        width: 95%; 
        padding: 8px;
        margin-top: 4px;
        border-radius: 8px; 
        border: 1px solid #bbb; 
        font-size: 14px;
        transition: 0.3s;
    }

    input:focus {
        border-color: #6a0dad;
        box-shadow: 0 0 6px rgba(106, 13, 173, 0.5);
        outline: none;
    }

    button { 
        width: 100%; 
        padding: 10px;
        background: linear-gradient(90deg, #005bb5, #003f80);
        color: white; 
        border: none; 
        border-radius: 8px; 
        margin-top: 12px;
        cursor: pointer;
        font-size: 15px;
        font-weight: bold;
        letter-spacing: 1px;
        transition: 0.3s;
    }

    button:hover { 
        transform: scale(1.02);
        background: linear-gradient(90deg, #004a99, #003466);
        box-shadow: 0 4px 12px rgba(0,0,0,0.2);
    }

    .error {
        color: red;
        text-align: center;
        margin-top: 10px;
        font-weight: bold;
    }

    .footer { 
        text-align: center; 
        margin-top: 10px; 
        font-size: 14px;
    }

    a {
        color: #4b0082;
        font-weight: bold;
        text-decoration: none;
    }
</style>
</head>

<body>

<div class="banner">Online Election Management System</div>

<div class="container">
    <h2>Create Account</h2>

    <form method="post" action="RegisterServlet">

        <label>Full Name</label>
        <input type="text" name="fullname" placeholder="Enter full name" required>

        <label>Matric Number</label>
        <input type="text" name="matric" placeholder="e.g., 22A1234" required>

        <label>Email</label>
        <input type="email" name="email" placeholder="example@student.edu.my">

        <label>Password</label>
        <input type="password" name="password" placeholder="Enter password" required>

        <button type="submit">Register</button>

        <% if (request.getParameter("error") != null) { %>
            <div class="error">Registration failed. Please try again.</div>
        <% } %>

    </form>

    <div class="footer">
        Already have an account? <a href="login.jsp">Login</a>
    </div>
</div>

</body>
</html>
