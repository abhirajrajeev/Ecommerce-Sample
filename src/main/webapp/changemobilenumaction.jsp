<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.demo.database.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%
String email=session.getAttribute("email").toString();
String mobilenumber=request.getParameter("mobilenumber");
String password=request.getParameter("password");

int check=0;

try{
	Connection con=ConnectionProvider.getcon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from cart where email='"+email+"' and password='"+password+"'");
	while(rs.next())
	{
		check=1;
		st.executeUpdate("update cart set mobilenumber='"+mobilenumber+"' where email='"+email+"' ");
		response.sendRedirect("changemobilenum.jsp?msg=done");
	}
	if(check==0)
		response.sendRedirect("changemobilenum.jsp?msg=wrong");

	
}
catch(Exception e)
{
	out.println(e);
}
%>
