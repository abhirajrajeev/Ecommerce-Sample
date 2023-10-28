<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="css/signup-style.css">
<body>
<div id="container">
		<div class="signup">
			<form action="forgotAction.jsp" method="post">
				<input type="email" name="email" placeholder="Enter email" required>
				<input type="text" name="mobileNumber" placeholder="enter mobile number" required>
				<select name="securityquestion">
					<option value="What is your first car?">What is your first car</option>
					<option value="what is the name of your first pet?">what is the name of your first pet?</option>
					<option value="what is the name of your town?">what is the name of your town?</option>
					<option value="who is your first crush?">who is your first crush?</option>
				</select> 
				<input type="text" name="answer" placeholder="Enter answer" required>
				<input type="password" name="newpassword" placeholder="Enter your new password" required>
				<input type="submit" value="save">
			</form>
			<h2><a href="login.jsp">Login</a></h2>
		</div>
		 <div class='whyforgotPassword'>
   <%
   String msg=request.getParameter("msg");
   if("done".equals(msg))
   {
   %>
<h1>Password Changed Successfully!</h1>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<h1>Some thing Went Wrong! Try Again !</h1>
<%} %>
    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
	</div>
</body>
</html>