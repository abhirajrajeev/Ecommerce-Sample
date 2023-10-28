<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.demo.database.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%
String email=session.getAttribute("email").toString();
String address=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
String cntry=request.getParameter("cntry");
String mobilenumber=request.getParameter("mobilenumber");
String paymentmethod=request.getParameter("paymentmethod");
String transactionid="";
transactionid=request.getParameter("paymentmethod");
String status="bill";

try{
		Connection con=ConnectionProvider.getcon();
		PreparedStatement ps=con.prepareStatement("update cart set address=?,city=?,state=?,country=?,mobilenumber=? where email=?");
		ps.setString(1, address);
		ps.setString(2, city);
		ps.setString(3, state);
		ps.setString(4, cntry);
		ps.setString(5, mobilenumber);
		ps.setString(6, email);
		ps.executeUpdate();
		
		PreparedStatement ps1=con.prepareStatement("update bucket set address=?,city=?,state=?,country=?,mobilenumber=?,orderdate=now(),deliverydate=DATE_ADD(orderdate,INTERVAL 7 DAY),paymentmethod=?,transaction_id=?,status=? where email=? and address is NULL");
		ps1.setString(1, address);
		ps1.setString(2, city);
		ps1.setString(3, state);
		ps1.setString(4, cntry);
		ps1.setString(5, mobilenumber);
		ps1.setString(6, paymentmethod);
		ps1.setString(7, transactionid);
		ps1.setString(8, status);
		ps1.setString(9, email);
		ps1.executeUpdate();
		response.sendRedirect("bill.jsp");
}
catch(Exception e)
{
	out.println(e);
	}
 

%>