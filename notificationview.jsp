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
<form id="form1" name="form1" method="post" action="notification.jsp">
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <table width="673" border="1" align="center" cellpadding="0">
    <tr>
      <td>Notification</td>
      <td>Date</td>
      <td>&nbsp;</td>
    </tr>
       <%
    dbcon db=new dbcon();
    Connection con=db.getcon();
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from notification_tb");
    while(rs.next())
    {
        %>
    <tr>
      <td><%=rs.getString(2)%></td>
      <td><a href="notupdate.jsp?nid=<%= rs.getString(1)%>">Edit</a></td>
      <td><a href="?nid=<%= rs.getString(1)%>">Delete</a></td>
    </tr>
        <%
     }
           %>
  </table>
  <p align="center">
    <input type="submit" name="button" id="button" value="Add" />
  </p>
  <p>&nbsp;</p>
</form>
<p align="center">&nbsp;</p>
</body>
  <jsp:include page="footer.jsp"/>
</html>
  <%
           if(request.getParameter("nid") != null)
           {
               String id = request.getParameter("nid");
               st.executeUpdate("delete from notification_tb where nid='"+id+"'");
               response.sendRedirect("notificationview.jsp");
           }
            if(request.getParameter("button") != null)
           {
              
               response.sendRedirect("notification.jsp");
           }
  
  %>