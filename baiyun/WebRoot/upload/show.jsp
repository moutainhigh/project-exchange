<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看图片</title>
</head>
<body>

<div style="width:450;text-align:center;">
	<a href="${appPath}upload/${pic.path}" target="_blank"><img src="${appPath}upload/${pic.path}" width="300" height="300"/></a>
	<br/>(点击查看大图)
	<hr>

</div>
<center><font color="black">照片注解：<br/>${pic.remark }</font></center>
 
</body>
</html>