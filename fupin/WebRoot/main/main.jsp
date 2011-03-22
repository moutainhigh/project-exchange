<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.throne212.fupin.domain.User"%>
<%
	if(session.getAttribute("userObj") == null){
		request.getRequestDispatcher("/login.jsp").forward(request,response);
	}
%>

<%
	if(session.getAttribute("url") != null&&!"".equals(session.getAttribute("url"))){
		//request.getRequestDispatcher((String)session.getAttribute("url")).forward(request,response);
		response.sendRedirect((String)session.getAttribute("url"));
		return;
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<!-- Design by 4wenzi Date:2004-07-04 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>管理首页</title>
<link rel="stylesheet" href="main_data/manage.css"/>
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
	margin:0;
	padding:0;
}
-->
</style>
<link href="${appPath}css2.css" rel="stylesheet" type="text/css" />
</head><body>
<br/>
<br/>
<br/>
<br/>
<center><span style="font-size: 16px;">欢迎光临后台管理系统,请点击左边菜单开始管理工作</span></center>
<hr/>


</body></html>