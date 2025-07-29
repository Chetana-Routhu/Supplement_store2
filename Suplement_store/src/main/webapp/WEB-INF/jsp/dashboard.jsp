<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
       
        * {
            box-sizing: border-box;
        }
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f0f2f5;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
       
        .navbar {
            background-color: #9b59b6;
            color: white;
            padding: 12px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 10px rgba(155, 89, 182, 0.2);
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1001;
        }
        .navbar .logo {
            font-size: 22px;
            font-weight: 700;
            letter-spacing: 1.5px;
        }
        .icons {
            display: flex;
            align-items: center;
            position: relative;
        }
        .icons i {
            font-size: 28px;
            margin-left: 25px;
            cursor: pointer;
            transition: color 0.3s ease;
            color: white;
        }
        .icons i:hover {
            color: #d6aef9;
        }
        #cartCount {
            background: #e74c3c;
            color: white;
            border-radius: 50%;
            font-size: 13px;
            padding: 3px 8px;
            position: absolute;
            top: -8px;
            right: -12px;
            font-weight: 700;
            user-select: none;
        }
        
        .profile-dropdown {
            display: none;
            position: absolute;
            right: 20px;
            top: 52px;
            background-color: white;
            border-radius: 8px;
            padding: 15px;
            width: 230px;
            box-shadow: 0 8px 18px rgba(0,0,0,0.15);
            color: #333;
            z-index: 1100;
        }
        .profile-dropdown p {
            margin: 8px 0;
            font-weight: 600;
        }
        .profile-dropdown button {
            width: 100%;
            background-color: #e74c3c;
            border: none;
            padding: 10px 0;
            border-radius: 6px;
            color: white;
            font-weight: 600;
            cursor: pointer;
            margin-top: 12px;
            transition: background-color 0.3s ease;
        }
        .profile-dropdown button:hover {
            background-color: #c0392b;
        }
        
        <c:if test="${sessionScope.role == 'ADMIN'}">
        .sidebar {
            position: fixed;
            top: 60px; /* Below the navbar */
            left: 0;
            width: 220px;
            height: calc(100vh - 60px);
            background-color: #8658aa;
            color: white;
            display: flex;
            flex-direction: column;
            box-shadow: 2px 0 16px rgba(55,10,70,0.1);
            padding-top: 30px;
            z-index: 1000;
        }
        .sidebar a {
            padding: 16px 20px;
            color: white;
            font-weight: 600;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 12px;
            transition: background-color 0.2s ease-in-out;
            border-left: 4px solid transparent;
        }
        .sidebar a:hover, .sidebar a.active {
            background-color: #a986d1;
            border-left: 4px solid white;
        }
        </c:if>
        
        .main-content {
            margin-top: 60px;
            padding: 25px 20px;
            flex-grow: 1;
            background: #f0f2f5;
        }
        <c:if test="${sessionScope.role == 'ADMIN'}">
        .main-content {
            margin-left: 220px;
        }
        </c:if>
       
        .products {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 25px;
            margin-bottom: 40px;
        }
        .product-card {
            background: white;
            border-radius: 14px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
            padding: 15px;
            display: flex;
            flex-direction: column;
            align-items: center;
            transition: all 0.3s ease;
            cursor: pointer;
        }
        .product-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 26px rgba(155, 89, 182, 0.3);
        }
        .product-card img {
            width: 100%;
            max-height: 140px;
            object-fit: contain;
            border-radius: 10px;
            background: #f8f8f8;
            margin-bottom: 15px;
        }
        .product-card h4 {
            margin: 0 0 8px 0;
            font-weight: 600;
            color: #333;
            text-align: center;
            font-size: 1.1rem;
        }
        .product-card p {
            color: #27ae60;
            font-weight: 700;
            margin: 2px 0 15px 0;
            font-size: 1rem;
        }
        .product-card button {
            background-color: #9b59b6;
            border: none;
            border-radius: 10px;
            padding: 12px 18px;
            color: white;
            font-weight: 700;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
        }
        .product-card button:hover {
            background-color: #7e3aa8;
        }
        
        .admin-product-management {
            max-width: 900px;
            background: white;
            padding: 30px 25px;
            border-radius: 14px;
            box-shadow: 0 8px 34px rgba(155, 89, 182, .15);
            margin-bottom: 40px;
        }
        .admin-product-management h2 {
            text-align: center;
            color: #9b59b6;
            margin-bottom: 25px;
        }
        .add-product-form {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            justify-content: center;
            margin-bottom: 25px;
        }
        .add-product-form input {
            flex: 1 1 150px;
            min-width: 150px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        .add-product-form button {
            padding: 10px 24px;
            background-color: #27ae60;
            border: none;
            border-radius: 6px;
            color: white;
            font-weight: 700;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .add-product-form button:hover {
            background-color: #219150;
        }
        .admin-product-table {
            width: 100%;
            border-collapse: collapse;
        }
        .admin-product-table th,
        .admin-product-table td {
            padding: 13px 10px;
            text-align: center;
            border-bottom: 1px solid #eee;
        }
        .admin-product-table th {
            background-color: #9b59b6;
            color: white;
            letter-spacing: 1px;
        }
        .delete-btn {
            background: #e74c3c;
            color: white;
            border: none;
            border-radius: 6px;
            padding: 7px 14px;
            font-weight: 600;
            cursor: pointer;
        }
        .delete-btn:hover {
            background: #c0392b;
        }
       
        .notification {
            position: fixed;
            top: 20px;
            right: 20px;
            background: #27ae60;
            color: white;
            padding: 14px 25px;
            border-radius: 12px;
            display: none;
            font-weight: 600;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            z-index: 1200;
        }
       
        @media (max-width: 800px) {
            .main-content {
                margin-left: 0 !important;
                padding: 15px 10px;
            }
            .sidebar {
                position: static;
                width: 100%;
                height: auto;
                flex-direction: row;
                padding: 10px 0;
                justify-content: space-around;
                box-shadow: none;
            }
            .sidebar a {
                padding: 10px 8px;
                font-size: 14px;
            }
            .products {
                grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
                gap: 18px;
            }
            .product-card img {
                max-height: 110px;
            }
            .add-product-form {
                flex-direction: column;
            }
            .add-product-form input, .add-product-form button {
                width: 100%;
                min-width: unset;
            }
        }
    </style>
</head>
<body>

    <div class="navbar">
        <div class="logo">Welcome, ${sessionScope.username}</div>
        <div class="icons">
            <i class="fa fa-user-circle" onclick="toggleProfile()"></i>

            <c:if test="${sessionScope.role == 'ADMIN'}">
                <a href="/users" title="View All Users" style="color: white; margin-left: 20px; font-size: 24px;">
                    <i class="fa fa-users"></i>
                </a>
            </c:if>

            <a href="/cartitems" style="position: relative; display: inline-block; margin-left: 20px;">
                <i class="fa fa-shopping-cart"></i>
                <span id="cartCount">0</span>
            </a>
        </div>
    </div>

    <c:if test="${sessionScope.role == 'ADMIN'}">
        <nav class="sidebar">
            <a href="/users" class="active"><i class="fa fa-users"></i> Manage Users</a>
            <a href="#product-management-section"><i class="fa fa-box"></i> Product Management</a>
            <a href="/dashboard"><i class="fa fa-th-large"></i> Products</a>
        </nav>
    </c:if>

    <main class="main-content">
        <div class="products">
            <c:forEach var="product" items="${products}">
                <div class="product-card">
                    <img src="${product.imageUrl}" alt="${product.name}" />
                    <h4>${product.name}</h4>
                    <p> ${product.price}</p>
                    <button type="button" onclick="addToCart(${product.id}, event)">Add to Cart</button>
                </div>
            </c:forEach>
        </div>

        <c:if test="${sessionScope.role == 'ADMIN'}">
            <section class="admin-product-management" id="product-management-section">
                <h2>Admin Product Management</h2>

                <form class="add-product-form" action="/add-product" method="post">
                    <input type="text" name="name" placeholder="Product Name" required />
                    <input type="text" name="description" placeholder="Description" required />
                    <input type="number" name="price" placeholder="Price" min="0" step="0.01" required />
                    <input type="text" name="imageUrl" placeholder="Image URL" />
                    <button type="submit">Add Product</button>
                </form>

                <table class="admin-product-table">
                    <tr>
                        <th>Name</th><th>Description</th><th>Price</th><th>Image</th><th>Action</th>
                    </tr>
                    <c:forEach var="product" items="${products}">
                        <tr>
                            <td>${product.name}</td>
                            <td>${product.description}</td>
                            <td> ${product.price}</td>
                            <td>
                                <c:if test="${not empty product.imageUrl}">
                                    <img src="${product.imageUrl}" alt="${product.name}" width="60" style="border-radius:6px;" />
                                </c:if>
                            </td>
                            <td>
                                <form action="/delete-product" method="post" onsubmit="return confirm('Delete this product?');">
                                    <input type="hidden" name="id" value="${product.id}" />
                                    <button type="submit" class="delete-btn">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </section>
        </c:if>
    </main>

    <div id="profileDropdown" class="profile-dropdown">
        <p><b>Username:</b> ${sessionScope.username}</p>
        <p><b>Role:</b> ${sessionScope.role}</p>
        <form action="/logout" method="get">
            <button type="submit">Logout</button>
        </form>
    </div>

    <div id="notification" class="notification"></div>

    <script>
        function toggleProfile() {
            const dropdown = document.getElementById("profileDropdown");
            dropdown.style.display = (dropdown.style.display === "block") ? "none" : "block";
        }

        function showNotification(message) {
            const notification = document.getElementById("notification");
            notification.innerText = message;
            notification.style.display = "block";
            setTimeout(() => { notification.style.display = "none"; }, 2500);
        }

        function addToCart(productId, event) {
            if (event) event.preventDefault();
            fetch('/add-to-cart', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: 'productId=' + productId
            })
            .then(response => response.text())
            .then(result => {
                if (result === "ADDED") {
                    showNotification("Product added to cart!");
                    increaseCartCount();
                } else if (result === "NOT_LOGGED_IN") {
                    showNotification("Please log in to add products.");
                } else {
                    showNotification("Something went wrong.");
                }
            })
            .catch(console.error);
        }

        function increaseCartCount() {
            const countElement = document.getElementById("cartCount");
            let count = parseInt(countElement.innerText) || 0;
            countElement.innerText = count + 1;
        }

        window.onclick = function(event) {
            if (!event.target.matches('.fa-user-circle')) {
                const dropdown = document.getElementById("profileDropdown");
                if (dropdown.style.display === "block") {
                    dropdown.style.display = "none";
                }
            }
        }
    </script>

</body>
</html>
