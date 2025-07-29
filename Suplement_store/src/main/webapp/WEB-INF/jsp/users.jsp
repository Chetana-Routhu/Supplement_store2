<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9fafc;
            margin: 40px;
        }
        h1 {
            text-align: center;
            color: #4a3f81;
            margin-bottom: 30px;
            font-weight: 700;
        }
        table {
            width: 90%;
            margin: 0 auto 30px auto;
            border-collapse: collapse;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            background: white;
            border-radius: 10px;
            overflow: hidden;
        }
        th, td {
            padding: 15px 20px;
            text-align: left;
            border-bottom: 1px solid #eee;
            font-size: 1rem;
        }
        th {
            background-color: #7e57c2;
            color: white;
            font-weight: 700;
            letter-spacing: 1px;
        }
        tr:hover {
            background-color: #f2ebff;
        }
        tr:last-child td {
            border-bottom: none;
        }
        .btn-delete {
            background-color: #e74c3c;
            color: white;
            border: none;
            padding: 8px 14px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }
        .btn-delete:hover {
            background-color: #c0392b;
        }
        .back-button-container {
            text-align: center;
            margin: 30px 0;
        }
        .back-button {
            display: inline-block;
            background-color: #7e57c2;
            color: white;
            padding: 12px 24px;
            font-weight: 600;
            border-radius: 8px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
        .back-button:hover {
            background-color: #5d3b85;
        }

        @media (max-width: 600px) {
            body {
                margin: 10px;
            }
            table {
                width: 100%;
            }
            th, td {
                padding: 12px 10px;
                font-size: 0.9rem;
            }
            h1 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <h1>User Management</h1>

    <table>
        <thead>
            <tr>
                <th>User ID</th>
                <th>Username</th>
                <th>Role</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="user" items="${users}">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.username}</td>
                    <td>${user.role}</td>
                    <td>
                        <form action="/delete-user" method="post" onsubmit="return confirm('Delete this user?');">
                            <input type="hidden" name="id" value="${user.id}" />
                            <button type="submit" class="btn-delete">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div class="back-button-container">
        <a href="/dashboard" class="back-button" >Back to Dashboard</a>
    </div>
</body>
</html>
