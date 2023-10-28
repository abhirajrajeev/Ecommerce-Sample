
<%@page import="com.demo.database.ConnectionProvider"%>
<%@page import="java.sql.*"%>	
<%
String email=request.getParameter("email");
String mobileNumber=request.getParameter("mobileNumber");  	
String securityquestion=request.getParameter("securityquestion");
String answer=request.getParameter("answer");
String newpassword=request.getParameter("newpassword");

int check=0;

try{
	Connection con=ConnectionProvider.getcon();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from cart where email='"+email+"' and mobileNumber='"+mobileNumber+"' and securityquestion='"+securityquestion+"' and answer='"+answer+"'");
	while(rs.next())
	{
		check=1;
		stmt.executeUpdate("update cart set password='"+newpassword+"' where email='"+email+"'"); 
		response.sendRedirect("forgot.jsp?msg=done");
	}
	
	if(check==0)
	{
		response.sendRedirect("forgot.js?msg=invalid");
		
	}
	
}

catch (Exception e)
{
	out.print(e);
	}
%>