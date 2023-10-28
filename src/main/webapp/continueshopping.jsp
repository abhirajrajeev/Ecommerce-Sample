<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.demo.database.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<% 
String email=session.getAttribute("email").toString();
String status="processing";
try{
	Connection con=ConnectionProvider.getcon();
	PreparedStatement ps=con.prepareStatement("update bucket set status=? where email=? and status='bill'");
	ps.setString(1, status);
	ps.setString(2, email);
	ps.executeUpdate();
	response.sendRedirect("home.jsp");
	
}
catch(Exception e)
{
	out.println(e);	
}
%>