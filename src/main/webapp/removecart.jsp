<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.demo.database.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%
String email=session.getAttribute("email").toString();
String product_id=request.getParameter("id");
try{
	Connection con=ConnectionProvider.getcon();
	 Statement st=con.createStatement();
	 st.executeUpdate("delete from bucket where email='"+email+"' and product_id='"+product_id+"' and address is NULL");
	 response.sendRedirect("mycart.jsp?msg=removed");
	
}
catch(Exception e){
	out.println(e);
}
%>
