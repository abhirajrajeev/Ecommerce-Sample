<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.demo.database.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String mobileNumber=request.getParameter("mobilenumber");
String securityquestion=request.getParameter("securityquestion");
String answer=request.getParameter("answer");
String password=request.getParameter("password");
String address="";
String city="";
String state="";
String country="";

try
{
	Connection con=ConnectionProvider.getcon();
	PreparedStatement stmt=con.prepareStatement("insert into cart values(?,?,?,?,?,?,?,?,?,?)");
	stmt.setString(1,name);
	stmt.setString(2,email);
	stmt.setString(3,mobileNumber);
	stmt.setString(4,securityquestion);
	stmt.setString(5,answer);
	stmt.setString(6,password);
	stmt.setString(7,address);
	stmt.setString(8,city);
	stmt.setString(9,state);
	stmt.setString(10,country);
	stmt.executeUpdate();
	response.sendRedirect("signup.jsp?msg=valid");
}
catch (Exception e){
	out.print(e);
	response.sendRedirect("signup.jsp?msg=invalid");
	
}
%>