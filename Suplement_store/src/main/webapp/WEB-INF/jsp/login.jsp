<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Login</title>
    <style>
        * {
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #67a2fb, #3850a3);
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 15px;
        }
        .login-container {
            background: #fff;
            border-radius: 12px;
            padding: 40px 30px;
            width: 350px;
            max-width: 100%;
            box-shadow: 0 15px 40px rgba(0,0,0,0.2);
            transition: transform 0.3s ease;
        }
        .login-container:hover {
            transform: translateY(-5px);
        }
        h2 {
            margin-bottom: 30px;
            text-align: center;
            color: #333;
            font-weight: 700;
            letter-spacing: 1px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #4a4a4a;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 14px 18px;
            margin-bottom: 25px;
            border: 2px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            transition: border-color 0.2s ease;
        }
        input[type="text"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #3850a3;
            box-shadow: 0 0 8px rgba(56, 80, 163, 0.3);
        }
        input[type="submit"] {
            width: 100%;
            background: #3850a3;
            border: none;
            color: white;
            padding: 15px 0;
            font-size: 18px;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            letter-spacing: 1px;
            transition: background-color 0.3s ease;
            margin-bottom: 10px;
        }
        input[type="submit"]:hover {
            background: #2a3b6c;
        }
        .error {
            color: #e74c3c;
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
        }
        .register-link {
            text-align: center;
            font-size: 14px;
        }
        .register-link a {
            color: #3850a3;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }
        .register-link a:hover {
            color: #2a3b6c;
            text-decoration: underline;
        }
        @media (max-width: 400px) {
            .login-container {
                padding: 30px 20px;
                width: 100%;
            }
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2>Login</h2>

    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>

    <form action="/login" method="post">
        <label>Username</label>
        <input type="text" name="username" required />

        <label>Password</label>
        <input type="password" name="password" required />

        <input type="submit" value="Login" />
    </form>

    <div class="register-link">
        <p>Don't have an account? <a href="/register">Register here</a></p>
    </div>
</div>
</body>
</html>
