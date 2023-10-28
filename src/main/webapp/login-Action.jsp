<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.demo.database.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>

<%
String email=request.getParameter("email");
String password=request.getParameter("password");
if("admin@gmailcom".equals(email)&&"admin".equals(password))
{
	session.setAttribute("email", email);
	response.sendRedirect("admin/adminhome.jsp");
}
else
{
	int z=0;
	try{
		Connection con=ConnectionProvider.getcon();
		Statement stmt=con.createStatement();
		ResultSet res=stmt.executeQuery("select * from cart where email='"+email+"' && password='"+password+"'");
		while(res.next())
		{
			z=1;
			session.setAttribute("email", email);
			response.sendRedirect("home.jsp");
		}
		if(z==0)
		
			response.sendRedirect("login.jsp?msg=notexist");
		
	}
	catch(Exception e){
		out.print(e);
		response.sendRedirect("login.jsp?msg=invalid");
	}
}
%>