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
  <table width="337" border="0" align="center" cellpadding="0">
    <tr>
      <th scope="col">Date</th>
      <th scope="col"><label for="textfield"></label>
      <input type="date" name="textfield" id="textfield" /></th>
      <th scope="col"><input type="submit" name="button" id="button" value="Search" /></th>
    </tr>
  </table>
   <%  
 if(request.getParameter("button")!=null)
{
     String date=request.getParameter("textfield");
     
     ResultSet rs=st.executeQuery("select reqbook_tb.*,customer_tb.fname,customer_tb.lname from reqbook_tb,customer_tb where customer_tb.imei=reqbook_tb.imei and(reqbook_tb.date='"+date+"' and reqbook_tb.status='accept')");
     while(rs.next())
    {
        %>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <table width="445" border="1" align="center" cellpadding="0">
    <tr>
      <th scope="col">User Name</th>
      <th scope="col">Time</th>
      <th scope="col">Source</th>
      <th scope="col">Destination</th>
    </tr>

    <tr>
      <td><%=rs.getString("fname")+" "+rs.getString("lname")%></td>
      <td><%=rs.getString("time")%></td>
      <td><%=rs.getString("source")%></td>
      <td><%=rs.getString("destination")%></td>
    </tr>
    
    <%
    }
     %>
  </table>
     <%}
 %>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</form>
</body>
  <jsp:include page="footer.jsp"/>
</html>