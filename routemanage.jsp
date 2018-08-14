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
  <div align="center">
    <p>&nbsp;</p>
    <table width="600" height="108" border="1" align="center" cellpadding="1" cellspacing="2">
      <tr>
        <td width="169" height="64"><div align="center"><strong>From</strong></div></td>
        <td width="94"><div align="center"><strong>To</strong></div></td>
        <td width="225">&nbsp;</td>
        <td width="92">&nbsp;</td>
      </tr>
      <%
    dbcon db=new dbcon();
    Connection con=db.getcon();
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from route_tb");
    while(rs.next())
    {
        %>
      
      <tr>
        <td height="36"><%=rs.getString(2)%></td>
        <td><%=rs.getString(3)%></td>
        <td><div align="center"><a href="routeupdate.jsp?rid=<%= rs.getString(1)%>">Edit</a></div></td>
        <td><div align="center"><a href="?rid=<%= rs.getString(1)%>">Delete</a></div></td>
      </tr>
      <%
    }
    %>
    </table>
    <p>
      <input type="submit" name="button" id="button" value="Add" />
    </p>
  </div>
</form>
</body>
    <jsp:include page="footer.jsp"/>
</html>
  <%
           if(request.getParameter("rid") != null)
           {
               String id = request.getParameter("rid");
               st.executeUpdate("delete from route_tb where rid='"+id+"'");
               response.sendRedirect("routemanage.jsp");
           }
           
            if(request.getParameter("button") != null)
           {
              
               response.sendRedirect("route.jsp");
           }
  
  %>
    