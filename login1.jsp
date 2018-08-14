<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="ayeauto.dbcon"%>
<!--Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html lang="en">
<head>
<title>Classic Login Form Responsive Widget Template :: w3layouts</title>
<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Classic Login Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Meta tag Keywords -->

<!-- css files -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" /> <!-- Style-CSS --> 
<link rel="stylesheet" href="css/font-awesome.css"> <!-- Font-Awesome-Icons-CSS -->
<!-- //css files -->

<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->

<!-- online-fonts -->
<link href="//fonts.googleapis.com/css?family=Oleo+Script:400,700&amp;subset=latin-ext" rel="stylesheet">
<!-- //online-fonts -->
</head>
<%
    dbcon db=new dbcon();
    Connection con=db.getcon();
    Statement st=con.createStatement();
    if(request.getParameter("button")!=null)
{
     String uname=request.getParameter("Name");
     String pass=request.getParameter("Password");
  ResultSet rs=   st.executeQuery("select * from login_tb where username='"+uname+"' and password='"+pass+"' and usertype='admin'");
  if(rs.next())
  {
    session.setAttribute("lid", rs.getString(1));
  response.sendRedirect("web/header.jsp");
  }
  else
  {
     %>
    
      <script>
       alert("invalid username and password");
      </script>
     <%
  }
 
}  
  %>
   
<body>
<script src="js/jquery.vide.min.js"></script>
	<!-- main -->
	<div data-vide-bg="video/Ipad">
		<div class="center-container">
			<!--header-->
			<div class="header-w3l">
				<h1>Aye </h1>
			</div>
			<!--//header-->
			<div class="main-content-agile">
				<div class="sub-main-w3">	
					<div class="wthree-pro">
						<h2>Login Here</h2>
					</div>
					<form action="#" method="post">
						<input placeholder="Username or E-mail" name="Name" class="user" type="email" required>
						<span class="icon1"><i class="fa fa-user" aria-hidden="true"></i></span><br><br>
						<input  placeholder="Password" name="Password" class="pass" type="password" required>
						<span class="icon2"><i class="fa fa-unlock" aria-hidden="true"></i></span><br>
						<div class="sub-w3l">
							<h6><a href="#">Forgot Password?</a></h6>
							<div class="right-w3l">
								<input type="submit" name="button" value="Login">
							</div>
						</div>
					</form>
				</div>
			</div>
			<!--//main-->

			<!--footer-->
			<div class="footer">
				<p>&copy; 2017 Classic Login Form. All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
			</div>
			<!--//footer-->
		</div>
	</div>

</body>
</html>