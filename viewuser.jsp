<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  if(session.getAttribute("lid")==null)
      response.sendRedirect("LoginTemp/login1.jsp");

  %>
<%@page import="ayeauto.dbcon"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>
<jsp:include page="header.jsp"/>
<body>
<form id="form1" name="form1" method="post" action="">
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <table width="588" height="172" border="1" align="center" cellpadding="0">
    <tr>
      <td width="149" height="71"><strong>Name</strong></td>
      <td width="241"><strong>Phone No</strong></td>
      <td width="182"><strong>Email</strong></td>
      <td width="182"><strong>Imei No</strong></td>
    </tr>
       <%
    dbcon db=new dbcon();
    Connection con=db.getcon();
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from customer_tb");
    while(rs.next())
    {
        %>
    <tr>
      <td><%=rs.getString("fname")+" "+rs.getString("lname")%></td>
      <td><%=rs.getString("phone_no")%></td>
      <td><%=rs.getString("email")%></td>
      <td><%=rs.getString("imei")%></td>
    </tr>
      <%
    }
    %>
  </table>
</form>
</body>
  <jsp:include page="footer.jsp"/>
</html>