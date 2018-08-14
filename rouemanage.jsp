<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
<form id="form1" name="form1" method="post" action="route.jsp">
  <table width="719" height="155" border="1" align="center" cellpadding="3">
    <tr>
        <td colspan="4"><h1>Route Manage</h1></td>
      </tr>
      <tr>
        <td width="169"><div align="center"><strong> From</strong></div></td>
        <td width="94"><div align="center">To</div></td>
        <td width="225">&nbsp;</td>
        <td width="211">&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td><div align="center"><a href="routeupdate.jsp">Edit</a></div></td>
        <td><div align="center"><a href="#">Delete</a></div></td>
      </tr>
    </table>
  <p align="center">
    <input type="submit" name="button" id="button" value="Add" />
  </p>
  
</form>
</body>
</html>