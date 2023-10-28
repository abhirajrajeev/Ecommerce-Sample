<%@page import="java.sql.Statement"%>
<%@page import="com.demo.database.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%
String id=request.getParameter("id");
String email=request.getParameter("email");
String status="cancel";
try{
	Connection con=ConnectionProvider.getcon();
	Statement st=con.createStatement();
	st.executeUpdate("update bucket set status='"+status+"' where product_id='"+id+"' and email='"+email+"' and address is not NULL");
	response.sendRedirect("orderrecieved.jsp?msg=cancel");
}
catch(Exception e)
{
	out.println(e);	
	response.sendRedirect("orderrecieved.jsp?msg=wrong");

}
%>