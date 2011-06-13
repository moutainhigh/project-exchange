<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.throne212.fupin.domain.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5" bgcolor="#013E7F"></td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#CCFBFF">
    <%
    	User user = (User)session.getAttribute("userObj");
    	if(user instanceof AreaWorkOrg){
    		AreaWorkOrg a = (AreaWorkOrg)user;
    		if("Y".equals(a.getIsDiv())){
    			out.print("白云区");
    		}else{
    			out.print("广州市");
    		}
    	}else{
    		out.print("广州市");
    	}
    %>
    扶贫开发办公室 版权所有</td>
  </tr>
</table>
</body>
</html>



