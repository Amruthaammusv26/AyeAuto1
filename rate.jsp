<%@page import="ayeauto.dbcon"%>
<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  if(session.getAttribute("lid")==null)
      response.sendRedirect("LoginTemp/login1.jsp");

  %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
  <jsp:include page="header.jsp"/>
</head>
 <%
    dbcon db=new dbcon();
    Connection con=db.getcon();
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select distinct driver_tb.fname,driver_tb.lname,avg(rate_tb.rate) from driver_tb inner join rate_tb on driver_tb.lid=rate_tb.drid group by rate_tb.drid");
   
       %>
      
<body>
<form id="form1" name="form1" method="post" action="">
    <p>&nbsp;</p>
      <p>&nbsp;</p>
      <table width="200" border="1" align="center" cellpadding="0">
    <tr>
      <th scope="col">Driver Name</th>
      <th scope="col">Rate</th>
    </tr>
          <%
            while(rs.next())
           {
          %>
    <tr>
      <td><%=rs.getString("fname")+" "+rs.getString("lname")%></td>
      <td><%=rs.getString(3)%></td>
    </tr>
      <%}
    %>
  </table>
</form>
</body>
  <jsp:include page="footer.jsp"/>
</html>