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
  <table width="568" height="218" border="1" align="center" cellpadding="0">
    <tr>
      <td width="48" height="40"><strong>Name</strong></td>
      <td width="64"><strong>Phone No</strong></td>
      <td width="68"><strong>Address</strong></td>
      <td width="154"><strong>Photo</strong></td>
      <td width="74"><strong>Vehicle No</strong></td>
      <td width="132">&nbsp;</td>
    </tr>
         <%
    dbcon db=new dbcon();
    Connection con=db.getcon();
    Statement st=con.createStatement();
      ResultSet rs=st.executeQuery("select driver_tb.*,login_tb.usertype from login_tb,driver_tb where login_tb.lid=driver_tb.lid and login_tb.usertype='driver'  ");
    while(rs.next())
    {
        %>
    <tr>
      <td height="170"><strong><%=rs.getString("fname")+" "+rs.getString("lname")%></strong></td>
      <td><strong><%=rs.getString("phone_no")%></strong></td>
      <td><strong><%=rs.getString("house_name")+","+rs.getString("place")+","+rs.getString("district")%></strong></td>
      <td><strong><img name="" src="images/<%=rs.getString("image")%>" width="113" height="54" alt="" /></strong></td>
      <td><%=rs.getString("vehicle_no")%></td>
      
      <td><% if(rs.getString("usertype").equals("driver")){ %><p><a href="?id=<%=rs.getString("lid")%>">Block</a></p><% } else if(rs.getString("usertype").equals("block")) {%>
      <p><a href="?rid=<%=rs.getString("lid")%>">Unblock</a></p>
      <% }%></td>
    </tr>
      <%
    }
    %>
  </table>
  <p>&nbsp;</p>
</form>
</body>
  <jsp:include page="footer.jsp"/>
</html>
    <%
  if(request.getParameter("id")!=null)
  {
      String ids=request.getParameter("id");
 
     st.executeUpdate("update login_tb set usertype='block' where lid='"+ids+"'");
     response.sendRedirect("driverdetail.jsp");
  }
  %>
    <%
  if(request.getParameter("rid")!=null)
  {
      String rid=request.getParameter("rid");
      st.executeUpdate("update login_tb set usertype='driver' where lid='"+rid+"'");
      response.sendRedirect("driverdetail.jsp");
  }
  %>