<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Sucessfull</title>
<link rel="icon" type="image/x-icon" href="images/flipkartLogo.png">
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: yellow;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            text-align: center;
        }
        .button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 0 10px;
            text-decoration: none;
            font-size: 16px;
        }
        .button:hover {
            background-color: #0056b3;
        }
        /* Updated Animation */
        @keyframes bounce {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-20px);
            }
        }
        .bounce-effect {
            animation: bounce 1s infinite;
        }
    </style>
    
    
</head>
<body>
    <div class="container">
       <h1 class="bounce-effect">Successfully placed your order</h1>
        <a href="http://localhost:6060/" class="button">Back to Flipkart</a>
        <a href="/flipkartLogin" class="button">Back to Order</a>
    </div>
</body>
<body>
<body style="background-color: yellow;">


</body>
</html>