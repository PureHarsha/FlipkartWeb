<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>All customer details</title>
    <link rel="icon" type="image/x-icon" href="images/flipkartLogo.png">
    <style>
        table {
            margin: 0 auto;
            width: 90%;
            max-width: 1200px;
            background-color: rgba(255, 255, 255, 0.8);
            border-collapse: collapse;
        }
        body {
            background-image: url('/images/flipkartgroceryimage.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            font-family: Arial, sans-serif;
        }
        th, td {
            text-align: center;
            padding: 8px;
        }
        th {
            background-color: #3CB3E7; /* Background color for the first row */
            color: white; /* Text color for the first row */
        }
        .delete-button, .update-button, .print-button, .download-button {
            background-color: #4CAF50; /* Green background */
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease; /* Smooth transition */
        }
        .delete-button:hover, .update-button:hover, .print-button:hover, .download-button:hover {
            background-color: #FF0F00; /* Darker green background on hover */
        }
        .delete-button:active, .update-button:active, .print-button:active, .download-button:active {
            background-color: #00FF00; /* Light green background on click */
            animation: clickAnimation 0.3s ease; /* Apply click animation */
        }
        
        @keyframes clickAnimation {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.1);
            }
            100% {
                transform: scale(1);
            }
        }
        
    @keyframes zoomIn {
        from {
            transform: scale(0); /* Start with scale 0 (invisible) */
        }
        to {
            transform: scale(1); /* End with scale 1 (original size) */
        }
    }

    /* Apply the animation to the table */
    table {
        animation: zoomIn 1s ease forwards;
    }
        
    </style>
</head>
<body>
    <table border="1">
        <thead>
            <tr>
                <th>Customer ID</th>
                <th>Customer Name</th>
                <th>Email</th>
                <th>Product Name</th>
                <th>Product Ordered For</th>
                <th>Update</th>
                <th>Delete</th>
                <th>Print</th>
                <th>Download</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${allCustomers}" var="customer">
                <tr>
                    <td>${customer.CUSTOMER_ID}</td>
                    <td>${customer.CUSTOMER_NAME}</td>
                    <td>${customer.EMAIL}</td>
                    <td>${customer.PRODUCT_NAME}</td>
                    <td>${customer.PRODUCT_ORDERED_FOR}</td>
                    <td>
                        <form action="/updateCustomer" method="post">
                            <input type="hidden" name="customerId" value="${customer.CUSTOMER_ID}">
                            <input type="text" name="customerName" value="${customer.CUSTOMER_NAME}">
                            <input type="text" name="email" value="${customer.EMAIL}">
                            <input type="text" name="productName" value="${customer.PRODUCT_NAME}">
                            <input type="text" name="productOrderedFor" value="${customer.PRODUCT_ORDERED_FOR}">
                            <button type="submit" class="update-button">Update</button>
                        </form>
                    </td>
                    <td>
                        <form action="/deleteCustomer" method="post">
                            <input type="hidden" name="customerId" value="${customer.CUSTOMER_ID}">
                            <button type="submit" class="delete-button">Delete</button>
                        </form>
                    </td>
                    <td>
                        <button onclick="window.print()" class="print-button">Print</button>
                    </td>
                    <td>
                        <form action="/downloadCustomerData" method="get">
                            <button type="submit" class="download-button">Download</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="/flipkartLogin" class="back-button">Go Back</a>
</body>
</html>
