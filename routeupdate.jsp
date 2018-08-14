<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  if(session.getAttribute("lid")==null)
      response.sendRedirect("LoginTemp/login1.jsp");

  %>
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
    String id=request.getParameter("rid");
 if(request.getParameter("button")!=null)
  {
     String route_from=request.getParameter("textfield");
     String route_to=request.getParameter("textfield2");
     st.executeUpdate("update route_tb set route_from='"+route_from+"',route_to='"+route_to+"'  where rid='"+id+"'");
     response.sendRedirect("routemanage.jsp");
  }
   ResultSet rs=st.executeQuery("select * from route_tb where rid='"+id+"'");
     if(rs.next())
     {
     %>
 <jsp:include page="header.jsp"/>
<body>
<form id="form1" name="form1" method="post" action="">
 <p>&nbsp;</p>
 <p>&nbsp;</p>
 <p>&nbsp;</p>
 <table width="489" height="205" align="center" cellpadding="0">
    <tr>
      <td width="51">&nbsp;</td>
      <td width="337">&nbsp;</td>
    </tr>
    <tr>
      <td><strong>From</strong></td>
      <td><label for="textfield"></label>
      <input type="text" name="textfield" id="textfield" value="<%= rs.getString(2)%>" /></td>
    </tr>
    <tr>
      <td><strong>To</strong></td>
      <td><label for="textfield2"></label>
      <input type="text" name="textfield2" id="textfield2" value="<%= rs.getString(3)%>"/></td>
    </tr>
      <%
   }
      %>
    
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="button" id="button" value="update" /></td>
    </tr>
  </table>
</form>
</body
<jsp:include page="footer.jsp"/>
</html>
