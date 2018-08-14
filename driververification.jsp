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
  <p>&nbsp;</p>
  <table width="503" height="148" border="1" align="center" cellpadding="0">
    <tr>
      <td width="46" height="54"><strong>Name</strong></td>
      <td width="63"><strong>Address</strong></td>
      <td width="75"><strong>Adhar No</strong></td>
      <td width="174"><strong>Image</strong></td>
      <td width="85"><strong>Vehicle No</strong></td>
      <td width="92"><strong>RC Book</strong></td>
      <td width="55"><strong>Phone No</strong></td>
      <td width="51">&nbsp;</td>
      <td width="74">&nbsp;</td>
    </tr>
    <tr>
        <%
    ResultSet rs=st.executeQuery("select driver_tb.* from login_tb,driver_tb where login_tb.lid=driver_tb.lid  and login_tb.usertype='pending'");
     while(rs.next())
    {
        %>
      <td height="86"><%=rs.getString(2)+" " +rs.getString(3)%></td>
      <td><%=rs.getString("house_name")+" "+rs.getString("place")+" "+rs.getString("district")+" "+rs.getString("pincode")%></td>
     
      <td><%=rs.getString("adharno")%></td>
      <td><img name="" src="images/<%=rs.getString("image")%>" width="151" height="84" alt="" /></td>
      <td><%=rs.getString("vehicle_no")%></td>
      <td><img name="" src="images/<%=rs.getString("Rc")%>" width="86" height="66" alt="" /></td>
      <td><%=rs.getString("phone_no")%></td>
      <td><a href="?id=<%=rs.getString("lid")%>">Accept</a></td>
      <td><a href="?rid=<%=rs.getString("lid")%>">Reject</a></td>
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
      //String route_from=request.getParameter("textfield");
     st.executeUpdate("update login_tb set usertype='driver' where lid='"+ids+"'");
     response.sendRedirect("driververification.jsp");
  }
  %>
   <%
  if(request.getParameter("rid")!=null)
  {
      String rid=request.getParameter("rid");
      st.executeUpdate("delete from driver_tb where lid='"+rid+"'");
       st.executeUpdate("delete from login_tb where lid='"+rid+"'");
      response.sendRedirect("driververification.jsp");
  }
  %>