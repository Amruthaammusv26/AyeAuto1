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
    
     
  %>    
  <jsp:include page="header.jsp"/>
<body>
<form id="form1" name="form1" method="post" action="">
  <p>&nbsp;</p>
  <table width="801" height="89" border="0" align="center" cellpadding="0">
    <tr>
      <td width="249">&nbsp;</td>
      <td width="248">&nbsp;</td>
      <td width="296">&nbsp;</td>
    </tr>
    <tr>
      <td>Vehicle No:
        <label for="select2"></label>
        <select name="select2" id="select2">
              <%
             ResultSet rs=st.executeQuery("select * from driver_tb");
    while(rs.next())
    {
            %>
            <option><%=rs.getString("vehicle_no")%></option>
   
        <% }%>
        </select>        <label for="textfield"></label></td>
      <td>Route:
        <label for="textfield2"></label>
        <label for="select"></label>
        <select name="select" id="select">
            <%
             ResultSet rs1=st.executeQuery("select * from route_tb");
    while(rs1.next())
    {
            %>
             <option value="<%=rs1.getString("rid")%>"><%=rs1.getString("route_from")+" "+rs1.getString("route_to")%></option>
   
        <% }%>
        </select></td>
      <td><input type="submit" name="button" id="button" value="Search" /></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <%  
 if(request.getParameter("button")!=null)
{
     String vehicle=request.getParameter("select2");
     String route=request.getParameter("select");
      ResultSet rs2=st.executeQuery("select driver_tb.*,login_tb.usertype from login_tb,driver_tb,driveralloc_tb,route_tb where login_tb.lid=driver_tb.lid and driver_tb.drid=driveralloc_tb.drid and driveralloc_tb.rid=route_tb.rid and(driver_tb.vehicle_no='"+vehicle+"' OR driveralloc_tb.rid='"+route+"' )and login_tb.usertype='driver'");
   
        %>
  <table width="806" border="1" align="center" cellpadding="0">
    <tr>
      <td width="196">Name</td>
      <td width="264">Address</td>
      <td width="274">Images</td>
    </tr>
      <%
         while(rs2.next())
    {
      %>
    <tr>
      <td height="112"><%=rs2.getString("fname")+""+rs2.getString("lname")%></td>
      <td><%=rs2.getString("house_name")+""+rs2.getString("place")+""+rs2.getString("district")%></td>
      <td><img name="" src="images/<%=rs2.getString("image")%>" width="171" height="81" alt="" /></td>
    </tr>
      <%
    }
     %>

  </table>
       <%
}
 %>
  <p>&nbsp;</p>
</form>
</body>
  <jsp:include page="footer.jsp"/>
</html>
