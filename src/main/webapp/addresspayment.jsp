
<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.demo.database.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@include file="header.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>
<script>
if(window.history.forward(1)!=null)
	window.history.forward(1);
</script>
</head>
<body>
<br>
<table>
<thead>
<%
int total=0;
int sno=0;
try{
	Connection con=ConnectionProvider.getcon();
	Statement st=con.createStatement();
	ResultSet rs1=st.executeQuery("select sum(total) from bucket where email='"+email+"' and address is NULL");
	while(rs1.next()){
		total=rs1.getInt(1);
	}


%>

          <tr>
          <th scope="col"><a href="mycart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"><%out.println(total); %></i> </th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
          </tr>
        </thead>
        <tbody>
           <tbody>
      <%
      ResultSet rs=st.executeQuery("select * from product inner join bucket on product.id=bucket.product_id and bucket.email='"+email+"' and bucket.address is NULL");
     while(rs.next()){
    	  
    
      %>
          <tr>
            <%sno=sno+1; %>
           <td><%out.println(sno); %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i> ><%=rs.getString(4) %></td>
            <td> <%=rs.getString(8) %></td>
            <td><i class="fa fa-inr"><%=rs.getString(10)%></i> </td>
            </tr>
         <%}
     	ResultSet rs2=st.executeQuery("select * from cart where email='"+email+"'");
     	while(rs2.next())
     	{
     %>
        </tbody>
      </table>
      
<hr style="width: 100%">
<form action="addresspaymentaction.jsp" method="post">
 <div class="left-div">
 <h3>Enter Address</h3>
<input class="input-style" type="text" name="address" value="<%=rs2.getString(7)%>" placeholder="enter address" required>
 </div>

<div class="right-div">
<h3>Enter city</h3>
<input class="input-style" type="text" name="city" value="<%=rs2.getString(8)%>" placeholder="enter city" required>
</div> 

<div class="left-div">
<h3>Enter State</h3>
<input class="input-style" type="text" name="state" value="<%=rs2.getString(9)%>" placeholder="enter state" required>
</div>

<div class="right-div">
<h3>Enter country</h3>
<input class="input-style" type="text" name="cntry" value="<%=rs2.getString(10)%>" placeholder="enter country" required>
</div>
<h3 style="color: red">*If there is no address its mean that you did not set you address!</h3>
<h3 style="color: red">*This address will also updated to your profile</h3>
<hr style="width: 100%">
<div class="left-div">
<h3>Select way of Payment</h3>
 <select class="input-style" name="paymentmethod">
 <option value="Cash on Delivery(COD)">Cash on Delivery(COD)</option>
 <option value="Online Banking">Online Banking)</option>
 </select>
</div>

<div class="right-div">
<h3>Pay online on this btechdays@pay.com</h3>
<input class="input-style" type="text" name="transactionid"  placeholder="enter transaction id">
<h3 style="color: red">*If you select online Payment then enter you transaction ID here otherwise leave this blank</h3>
</div>
<hr style="width: 100%">

<div class="left-div">
<h3>Mobile Number</h3>
<input class="input-style" type="text" name="mobilenumber"  placeholder="enter mobilenumber" required>
<h3 style="color: red">*This mobile number will also updated to your profile</h3>
</div>
<div class="right-div">
<h3 style="color: red">*If you enter wrong transaction id then your order will we can cancel!</h3>
<button class="button" type="submit">Proceed to generate bill & save<i class='far fa-arrow-alt-circle-right'></i></button>
<h3 style="color: red">*Fill form correctly</h3>
</div>
</form>

<%
     	}     
}
catch(Exception e)
{
	out.println(e);
}
%>

      <br>
      <br>
      <br>

</body>
</html>