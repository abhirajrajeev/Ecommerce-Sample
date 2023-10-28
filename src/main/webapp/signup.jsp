<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/signup-style.css">
</head>
<body>
<div id='container'>
	<div class='signup'>
			<form action="signupAction.jsp" method="post">
					<input type="text" name="name" placeholder="Enter Name" required>
					<input type="email" name="email" placeholder="Enter Email" required>
					<input type="number" name="mobilenumber" placeholder="Enter Enter Mobilenumber" required>
					<select name="securityquestion">
					<option value="What is your first car?">What is your first car</option>
					<option value="what is the name of your first pet?">what is the name of your first pet?</option>
					<option value="what is the name of your town?">what is the name of your town?</option>
					<option value="who is your first crush?">who is your first crush?</option>
					</select>
					<input type="text" name="answer" placeholder="Enter answer" required>
					<input type="password" name="password" placeholder="Enter your password" required>
					<input type="submit" value="Signup">
			</form>
			<h2><a href="login.jsp">Login</a></h2>
			
	</div>
	<div class="whysign">
	<% 
		String msg= request.getParameter("msg");
		if("valid".equals(msg))
		{%>
			<h1>Successfully registered</h1>
		<%} %>
		<%if("invalid".equals(msg))
		{%>
			<h1>Sonething went wrong</h1>
			<h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
		<%} %>
		 
		
		
			
	
	</div>
</div>

</body>
</html>