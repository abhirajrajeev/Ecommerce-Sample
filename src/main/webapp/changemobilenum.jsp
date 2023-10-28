
<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.demo.database.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@include file="changedetailsheader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Your Mobile Number successfully changed!</h3>
<%}
if("wrong".equals(msg))
{%>
<h3 class="alert">Your Password is wrong!</h3>
<%} %>
<form action="changemobilenumaction.jsp" method="post">
 <h3>Enter Your New Mobile Number</h3>
 <input class="input-style" type="number" name="mobilenumber" placeholder="enter new mobile number" required>
 <hr>
<h3>Enter Password (For Security)</h3>
<input class="input-style" type="password" name="password" placeholder="enter password" required>
<hr>
 <button class="button" type="submit">Save<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>