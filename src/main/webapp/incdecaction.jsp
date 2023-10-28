<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.demo.database.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%
String email=session.getAttribute("email").toString();
String id=request.getParameter("id");
String incdec=request.getParameter("quantity");
int price=0;
int total=0;
int quantity=0;
int final_total=0;
try{
	Connection con=ConnectionProvider.getcon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from bucket where email='"+email+"' and product_id='"+id+"' and address is NULL");
	while(rs.next())
	{
		price=rs.getInt(4);
		total=rs.getInt(5);
		quantity=rs.getInt(3);
		
	}
	if(quantity==1&&incdec.equals("dec"))
	{
		response.sendRedirect("mycart.jsp?msg=notpossible");
	}
	else if(quantity!=1 && incdec.equals("dec"))
	{
		total=total-price;
		quantity=quantity-1;
		st.executeUpdate("update bucket set total='"+total+"',quantity='"+quantity+"' where email='"+email+"' and product_id='"+id+"' and address is NULL");
		response.sendRedirect("mycart.jsp?msg=dec");
	}
	else{
		total=total+price;
		quantity=quantity+1;
		st.executeUpdate("update bucket set total='"+total+"',quantity='"+quantity+"' where email='"+email+"' and product_id='"+id+"' and address is NULL");
		response.sendRedirect("mycart.jsp?msg=inc");
	}
		
}
catch(Exception e){
	out.println(e);	
}

%>