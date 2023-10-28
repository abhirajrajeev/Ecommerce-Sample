<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.demo.database.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%
String email=session.getAttribute("email").toString();
String subject=request.getParameter("subject");
String body=request.getParameter("body");

try{
	Connection con=ConnectionProvider.getcon();
	PreparedStatement ps=con.prepareStatement("insert into message(email,subject,body)values(?,?,?)");
	ps.setString(1, email);
	ps.setString(2, subject);
	ps.setString(3, body);
	ps.executeUpdate();
	response.sendRedirect("messageus.jsp?msg=valid");
	
}
catch(Exception e)
{
	out.println(e);
	response.sendRedirect("messageus.jsp?msg=invalid");
}
%>