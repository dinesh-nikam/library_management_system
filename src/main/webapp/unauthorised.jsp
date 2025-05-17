<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Unauthorized Access</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            text-align: center;
            padding: 40px;
            background: white;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.1);
            border-radius: 10px;
        }

        img {
            width: 200px;
            margin-bottom: 20px;
        }

        h1 {
            color: #dc3545;
            margin-bottom: 10px;
        }

        p {
            font-size: 18px;
            color: #555;
        }

        a.button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        a.button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <img src="https://cdn-icons-png.flaticon.com/512/564/564619.png" alt="Unauthorized">
        <h1>Access Denied</h1>
        <p>You are not authorized to view this page.</p>
        <a href="login.jsp" class="button">Back to Login</a>
    </div>
</body>
</html>
