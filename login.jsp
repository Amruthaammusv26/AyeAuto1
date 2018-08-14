
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="ayeauto.dbcon"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>

</head>
<%
    dbcon db=new dbcon();
    Connection con=db.getcon();
    Statement st=con.createStatement();
    if(request.getParameter("button")!=null)
{
     String uname=request.getParameter("textfield");
     String pass=request.getParameter("textfield2");
  ResultSet rs=   st.executeQuery("select * from login_tb where username='"+uname+"' and password='"+pass+"' and usertype='admin'");
  if(rs.next())
  {
    session.setAttribute("lid", rs.getString(1));
  response.sendRedirect("header.jsp");
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
   
<form id="form1" name="form1" method="post" action="">
  <p>&nbsp;</p>
  <table width="681" height="162" align="center" cellpadding="0">
    <tr>
      <td colspan="2" bgcolor="#FFFFFF"> <h1>Login here</h1></td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF">  <h4>Username</h4></td>
      <td><label for="textfield2"></label>
      <input type="text" name="textfield" id="textfield2"  title="Atleast 4 characters" required pattern="[A-Z a-z0-9]{4,25}" /></td>
    </tr>
    <tr>
      <td><h4>Password</h4></td>
      <td><label for="textfield3"></label>
          <input type="password" name="textfield2" id="textfield3" title="Atleast 4 characters" required pattern="[A-Z a-z0-9]{4,25}"/></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="button" id="button" value="login" /></td>
    </tr>
  </table>
  
</form> 
  
</body>
 
</html>
