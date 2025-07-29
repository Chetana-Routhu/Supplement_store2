<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Your Cart</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #71b7e6, #9b59b6);
            margin: 0;
            min-height: 100vh;
            padding: 0;
        }
        .cart-container {
            max-width: 900px;
            margin: 40px auto 0 auto;
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 8px 36px rgba(155, 89, 182, 0.18);
            padding: 32px 24px;
        }
        h2 {
            color: #7e3aa8;
            text-align: center;
            font-weight: 700;
            margin-bottom: 28px;
            letter-spacing: 1px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            border-radius: 10px;
            overflow: hidden;
        }
        th, td {
            padding: 16px 10px;
            text-align: center;
            font-size: 1rem;
        }
        th {
            background-color: #9b59b6;
            color: white;
            font-weight: 700;
            letter-spacing: 1px;
        }
        tr:nth-child(even) td {
            background: #f4f0fa;
        }
        tr:last-child td {
            border-bottom: none;
        }
        .delete-btn {
            background: #e74c3c;
            color: white;
            border: none;
            border-radius: 6px;
            padding: 8px 14px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.2s;
        }
        .delete-btn:hover {
            background: #c0392b;
        }
        .total-row {
            background: #f1e9fa;
        }
        .total-label {
            text-align: right;
            font-size: 1.1rem;
            font-weight: 700;
            color: #7e3aa8;
            padding: 16px 10px;
        }
        .total-value {
            color: #27ae60;
            font-size: 1.1rem;
            font-weight: 700;
            padding: 16px 10px;
        }
        .back {
            text-align: center;
            margin-top: 28px;
        }
        .back a {
            display: inline-block;
            text-decoration: none;
            color: #9b59b6;
            background: #f6eaff;
            font-weight: 600;
            border-radius: 8px;
            padding: 10px 20px;
            transition: background 0.2s;
        }
        .back a:hover {
            background: #e4d6fa;
        }
        @media (max-width: 700px) {
            .cart-container {
                padding: 18px 5px;
            }
            th, td {
                padding: 10px 4px;
                font-size: 0.96rem;
            }
        }
        @media (max-width: 480px) {
            .cart-container {
                padding: 10px 2px;
            }
            table, th, td {
                font-size: 0.9rem;
            }
            .back a {
                padding: 8px 8px;
            }
        }
    </style>
</head>
<body>
<div class="cart-container">
    <h2>Your Cart Items</h2>
    <table>
        <tr>
            <th>Product</th>
            <th>Description</th>
            <th>Price</th>
            <th>Qty</th>
            <th>Action</th>
        </tr>
        <c:forEach var="item" items="${cartItems}">
            <tr>
                <td>${item.product.name}</td>
                <td>${item.product.description}</td>
                <td> ${item.product.price}</td>
                <td>${item.quantity}</td>
                <td>
                    <form action="/delete-cartitem" method="post" onsubmit="return confirm('Remove this item?');">
                        <input type="hidden" name="id" value="${item.id}" />
                        <button type="submit" class="delete-btn">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>

    <table style="margin-top: 18px;">
        <tr class="total-row">
            <td colspan="4" class="total-label">Total:</td>
            <td class="total-value"> ${cartTotal}</td>
        </tr>
    </table>

    <div class="back">
        <a href="/dashboard"> Back to Dashboard</a>
    </div>
</div>
</body>
</html>
