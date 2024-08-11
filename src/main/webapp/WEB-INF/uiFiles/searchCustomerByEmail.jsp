<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Customer By Email</title>
</head>
<body>
    <h1>Search Customer By Email</h1>
    <form action="/searchCustomerByEmail" method="get">
        <label for="email">Enter Email:</label>
        <input type="text" id="email" name="email" required>
        <button type="submit">Search</button>
    </form>

    <div id="customerList">
        <!-- Customer list will be displayed here -->
    </div>
    
    <script>
        // Handle form submission
        document.querySelector('form').addEventListener('submit', async (event) => {
            event.preventDefault();
            const email = document.getElementById('email').value;
            const response = await fetch(`/searchCustomerByEmail?email=${email}`);
            const customers = await response.json();
            displayCustomers(customers);
        });

        // Function to display customers
        function displayCustomers(customers) {
            const customerListDiv = document.getElementById('customerList');
            customerListDiv.innerHTML = ''; // Clear previous results
            if (customers.length === 0) {
                customerListDiv.innerHTML = '<p>No customers found.</p>';
            } else {
                const ul = document.createElement('ul');
                customers.forEach(customer => {
                    const li = document.createElement('li');
                    li.textContent = `Customer ID: ${customer.CUSTOMER_ID}, Name: ${customer.CUSTOMER_NAME}, Email: ${customer.EMAIL}`;
                    ul.appendChild(li);
                });
                customerListDiv.appendChild(ul);
            }
        }
    </script>
</body>
</html>
