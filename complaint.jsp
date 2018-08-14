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
 <%
    dbcon db=new dbcon();
    Connection con=db.getcon();
    Statement st=con.createStatement();
    
     
  %>   
  <jsp:include page="header.jsp"/>
<body>
<form id="form1" name="form1" method="post" action="">
  <p>&nbsp;</p>
  <table width="511" border="0" align="center" cellpadding="0">
    <tr>
      <td>Types:</td>
      <td><label for="select"></label>
        <select name="select" id="select">
          <option>select</option>
          <option>Driver</option>
          <option>Customer</option>
      </select></td>
      <td><input type="submit" name="button" id="button" value="Search" /></td>
    </tr>
  </table>
   <%  
 if(request.getParameter("button")!=null)
{
     String type=request.getParameter("select");
      ResultSet rs=null;
      if(type.equalsIgnoreCase("driver"))
      {
        rs= st.executeQuery("select complaint_tb.*,driver_tb.fname,driver_tb.lname from complaint_tb inner join driver_tb on complaint_tb.drid=driver_tb.drid where complaint_tb.reply='pending'");
     
      }
      else
      {
    rs= st.executeQuery("select complaint_tb.*,customer_tb.fname,customer_tb.lname from complaint_tb inner join customer_tb on complaint_tb.imei=customer_tb.imei where complaint_tb.reply='pending'");
      }
     while(rs.next())
    {
        %>
  <p>&nbsp;</p>
  <table width="503" border="1" align="center" cellpadding="0">
    <tr>
      <td>Complaints</td>
      <td>Username</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><%=rs.getString("complaint")%></td>
      <td><%=rs.getString("fname")+" "+rs.getString("lname")%></td>
      <td><a href="reply.jsp?id=<%=rs.getString("cid")%>">Reply</a></td>
    </tr>
  </table>
      <%
    }
     %>
     <%}
 %>
  <p>&nbsp;</p>
</form>
</body>
  <jsp:include page="footer.jsp"/>
</html>