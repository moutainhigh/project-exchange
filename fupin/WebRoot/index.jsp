<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广东省【规划到户●责任到人】扶贫信息管理系统——扶贫单位后台管理</title>
</head><frameset rows="90,*" cols="*" frameborder="no" border="0" framespacing="0" id="main_head">
  <frame src="main/page_top.htm" name="topFrame" noresize="noresize" scrolling="no"> 
  <frameset rows="*" cols="210,5,*" framespacing="0" frameborder="0" border="0" id="left_right">
    <frame src="main/page_left.htm" name="leftFrame" noresize="noresize" scrolling="no">
    <frame src="main/page_mid.htm" name="middenFrame" noresize="noresize" scrolling="no">
	<frameset rows="24,*" cols="*" framespacing="0" frameborder="no" border="0" id="msg_up_down">
	  <frame name="locationFrame" src="main/page_menu.htm" frameborder="0" noresize="noresize" scrolling="no">
	  <frame name="mainFrame" src="main/main.htm" noresize="noresize">
	  <frame name="downFrame" src="main/a.htm" noresize="noresize" scrolling="no">
	</frameset>
  </frameset>
</frameset>
<noframes><body>
</body></noframes>
</html>