<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.demo.database.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%
String email=session.getAttribute("email").toString();
String oldpassword=request.getParameter("oldpassword");
String newpassword=request.getParameter("newpassword");
String  confirmpassword=request.getParameter("confirmpassword");

if(!confirmpassword.equals(newpassword))
	response.sendRedirect("changepassword.jsp?msg=notmatch");
else{
	int check=0;
	try{
		Connection con=ConnectionProvider.getcon();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from cart where email='"+email+"' and password='"+oldpassword+"'");
		while(rs.next())
		{
			check=1;
			st.executeUpdate("update cart set password='"+newpassword+"' where email='"+email+"'");
			response.sendRedirect("changepassword.jsp?msg=done");
		}
		if(check==0)
			response.sendRedirect("changepassword.jsp?msg=wrong");
	}
	catch(Exception e)
	{
		out.println(e);
	}
}
%>