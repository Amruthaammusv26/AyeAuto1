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
    if(request.getParameter("button")!=null)
{
     String route=request.getParameter("select");
     String vehicle=request.getParameter("select2");
     st.executeUpdate("insert into driveralloc_tb values(null,'"+vehicle+"','"+route+"')");
}
        %>
<jsp:include page="header.jsp"/>
<body>
<form id="form1" name="form1" method="post" action="">
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <table width="307" height="181" border="0" align="center" cellpadding="0">
    <tr>
      <td width="96">&nbsp;</td>
      <td width="205"><label for="select3"></label></td>
    </tr>
    <tr>
      <td>Route</td>
      <td><label for="textfield"></label>
        <label for="select"></label>
        <select name="select" id="select">
            <%
             ResultSet rs=st.executeQuery("select * from route_tb");
    while(rs.next())
    {
            %>
            <option value="<%=rs.getString("rid")%>"><%=rs.getString("route_from")+" "+rs.getString("route_to")%></option>
   
        <% }%></select></td>
    </tr>
    <tr>
      <td>Vehicle No</td>
      <td><label for="select2"></label>
        <select name="select2" id="select2">
           <%
             ResultSet rs1=st.executeQuery("select * from driver_tb");
    while(rs1.next())
    {
      
   %>
   <option value="<%=rs1.getString("drid")%>"><%=rs1.getString("vehicle_no")%></option>
   
        <% }%>
      </select></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="button" id="button" value="Submit" /></td>
    </tr>
  </table>
</form>
</body>
       <jsp:include page="footer.jsp"/>
</html>
