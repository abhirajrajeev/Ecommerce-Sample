<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.demo.database.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%
String email=session.getAttribute("email").toString();
String securityquestion=request.getParameter("securityquestion");
String newanswer=request.getParameter("newanswer");
String password=request.getParameter("password");
int check=0;
try{
	Connection con=ConnectionProvider.getcon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from cart where email='"+email+"' and password='"+password+"'");
	while(rs.next())
	{
		check=1;
		st.executeUpdate("update cart set SecurityQuestion='"+securityquestion+"',answer='"+newanswer+"' where email+'"+email+"'");
		response.sendRedirect("changesecurityqstn.jsp?msg=done");
	}
	if(check==0)
		response.sendRedirect("changesecurityqstn.jsp?msg=wrong");
}
catch(Exception e)
{
	out.println(e);	
}
%> 