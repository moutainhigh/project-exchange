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
</style></head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  	<%
    	User user = (User)session.getAttribute("userObj");
    	if(user instanceof AreaWorkOrg || user instanceof Org){
    		if("Y".equals(user.getIsDiv())){
     %>
    <td width="757" background="images/a1_topbg.gif"><img src="images/a1_top01_baiyun.gif" width="757" height="96" /></td>
    <%
    		}else{
     %>
    <td width="757" background="images/a1_topbg.gif"><img src="images/a1_top01.gif" width="757" height="96" /></td>
    <%
    		}
    	}else{
    %>
    <td width="757" background="images/a1_topbg.gif"><img src="images/a1_top01.gif" width="757" height="96" /></td>
    <%
    	}
    %>
    
    <td background="images/a1_topbg.gif">&nbsp;</td>
    <td width="254" background="images/a1_topbg.gif"><img src="images/a1_top02.gif" width="254" height="96" border="0" usemap="#Map" /></td>
  </tr>
</table>

<map name="Map" id="Map"><area shape="rect" coords="83,69,172,90" href="#" /><area shape="rect" coords="184,67,248,92" href="${appPath}logout.action" /></map></body>
</html>

