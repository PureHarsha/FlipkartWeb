<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flipkart</title>
<link rel="icon" type="image/x-icon" href="images/flipkartLogo.png">
<style>
/* Center the h1 and button */
body {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
	background-image: url('/images/flipkartgroceryimage.jpg');
	/* Add your background image path here */
	background-size: cover; /* Cover the entire background */
	background-position: center; /* Center the background image */
}

h1 {
	text-align: center;
	margin-bottom: 20px; /* Add margin to the bottom of the h1 */
	animation: scaleIn 1s ease-in-out;
	font-size: 3rem;
	font-family: Arial, sans-serif;
}

@
keyframes scaleIn {from 


{ transform:scale(0); /* Start with no scale */
	
}

to {
	transform: scale(1); /* End with full scale */
}

}
button {
	background-color: red;
	color: white;
	border: 1px solid black;
	padding: 10px 20px;
	cursor: pointer;
	animation: pulse 0.5s infinite alternate;
}

button:hover {
	background-color: black; /* Change background color on hover */
}

@
keyframes pulse {from { transform:scale(1);
	
}

to {
	transform: scale(1.1);
}
}
</style>
</head>
<body>
	<h1>Welcome to Flipkart</h1>
	<button onclick="openInNewTab('flipkartLogin')" type="button">Go
		to Flipkart Login page</button>
	<br>
	<button onclick="openTestPage()" type="button">Go to Test Page</button>
	<br>

	<script>
    function openInNewTab(url) {
        var win = window.open(url, '_blank');
        win.focus();
    }
    
    function openTestPage() {
        window.location.href = '/test';
    }
    
    <%-- This is a JSP comment --%>

</script>
</body>
</html>
