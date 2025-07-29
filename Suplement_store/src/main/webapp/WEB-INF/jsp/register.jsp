<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Register</title>
    <style>
       
        * {
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #71b7e6, #9b59b6);
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 15px;
        }
        .container {
            background: #fff;
            border-radius: 12px;
            padding: 40px 30px;
            width: 350px;
            max-width: 100%;
            box-shadow: 0 15px 40px rgba(0,0,0,0.2);
            transition: transform 0.3s ease;
        }
        .container:hover {
            transform: translateY(-5px);
        }
        h2 {
            margin-bottom: 30px;
            text-align: center;
            color: #333;
            font-weight: 700;
            letter-spacing: 1px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        input[type="text"],
        input[type="password"],
        select {
            padding: 14px 18px;
            margin-bottom: 20px;
            border: 2px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            transition: border-color 0.2s ease;
        }
        input[type="text"]:focus,
        input[type="password"]:focus,
        select:focus {
            outline: none;
            border-color: #9b59b6;
            box-shadow: 0 0 8px rgba(155, 89, 182, 0.3);
        }
        input[type="submit"] {
            background: #9b59b6;
            border: none;
            color: white;
            padding: 15px 0;
            font-size: 18px;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            letter-spacing: 1px;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background: #7e3aa8;
        }
        .error {
            color: #e74c3c;
            text-align: center;
            margin-bottom: 15px;
            font-weight: bold;
        }
        .login-link {
            text-align: center;
            margin-top: 10px;
            font-size: 14px;
        }
        .login-link a {
            color: #9b59b6;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }
        .login-link a:hover {
            color: #7e3aa8;
            text-decoration: underline;
        }
        @media (max-width: 400px) {
            .container {
                padding: 30px 20px;
                width: 100%;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Register</h2>
    <form action="/register" method="post">
        <input type="text" name="username" placeholder="Username" required />
        <input type="password" name="password" placeholder="Password" required />
        <input type="password" name="confirmPassword" placeholder="Confirm Password" required />
        <select name="role" required>
            <option value="CUSTOMER">Customer</option>
            <option value="ADMIN">Admin</option>
        </select>
        <input type="submit" value="Register" />
    </form>

    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>

    <div class="login-link">
        <p>Already have an account? <a href="/login">Login here</a></p>
    </div>
</div>
</body>
</html>
