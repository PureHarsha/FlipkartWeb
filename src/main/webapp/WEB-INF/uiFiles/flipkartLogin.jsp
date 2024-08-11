<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="spri" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flipkart Login</title>
<link rel="icon" type="image/x-icon" href="images/flipkartLogo.png">
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: skyblue;
        margin: 0;
        padding: 0;
    }
form {
    width: 450px;
    margin: auto;
    background-color: white;
    padding: 30px;
    border-radius: 5px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    align-items: flex-start;
    animation: fade-in-scale 1s ease forwards; /* Apply the fade-in-scale animation */
}

@keyframes fade-in-scale {
    0% {
        opacity: 0;
        transform: scale(0.8);
    }
    100% {
        opacity: 1;
        transform: scale(1);
    }
}
    label {
        display: block;
        margin-bottom: 10px;
    }
    input[type="number"],
    input[type="text"],
    input[type="email"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    input[type="submit"] {
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #0056b3;
    }
    .logo {
        width: 250px; /* Adjust the width as needed */
        height: auto;
        display: block;
        margin: 0 auto;
    }
</style>
</head>
<body>
  
    <img src="/images/flipkart.png" alt="Flipkart Logo" class="logo">
    <form action="/submitFlipkartCustomer" method="post">
        <label for="customerId">Customer ID:</label>
        <input type="number" id="customerId" name="customerId" required>
        
        <label for="customerName">Customer Name:</label>
        <input type="text" id="customerName" name="customerName" required>
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        
        <label for="productName">Product Name:</label>
        <input type="text" id="productName" name="productName" required>
        
        <label for="productOrderedFor">Product Ordered For:</label>
        <input type="text" id="productOrderedFor" name="productOrderedFor" required>
        
        <input type="submit" value="Submit">
    </form>
</body>
</html>
