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
   
 if(request.getParameter("button2")!=null)
{
     String notification=request.getParameter("textarea");
     st.executeUpdate("insert into notification_tb values(null,'"+notification+"')");
}
%>
<jsp:include page="header.jsp"/>
<body>
<form id="form1" name="form1" method="post" action="">
  <p>&nbsp;</p>
  <p align="center">&nbsp;</p>
  <table width="579" border="0" align="center" cellpadding="0">
    <tr>
      <td>Notification</td>
      <td><label for="textfield"></label>
        <label for="textarea"></label>
      <textarea name="textarea"     id="textarea" cols="45" rows="5"   ></textarea></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><p>&nbsp;
        </p>
        <p>
          <input type="submit" name="button2" id="button2" value="Submit" />
      </p></td>
    </tr>
  </table>
  <p align="center">&nbsp;</p>
  <p align="center">&nbsp;</p>
</form>
</body>
<jsp:include page="footer.jsp"/>
</html>