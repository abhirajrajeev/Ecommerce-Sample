
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.demo.database.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String category=request.getParameter("category");
String price=request.getParameter("price");
String active=request.getParameter("active");


try{
	Connection con=ConnectionProvider.getcon();
	PreparedStatement pt=con.prepareStatement("insert into product value(?,?,?,?,?)");
	pt.setString(1,id);
	pt.setString(2,name);
	pt.setString(3,category);
	pt.setString(4,price);
	pt.setString(5,active);
	pt.executeUpdate();
	response.sendRedirect("addnewproduct.jsp?msg=done");
	
}
catch(Exception e)
{
	response.sendRedirect("addnewproduct.jsp?msg=wrong");
}
%>