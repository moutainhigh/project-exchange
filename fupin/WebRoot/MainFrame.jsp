<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>



		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>广东扶贫信息网</title> 
	</head>
	<frameset id="left_right" border="0" frameborder="no" framespacing="0" cols="226,5,*" rows="*">
		<frame scrolling="yes" title="leftFrame" id="leftFrame" noresize="noresize" name="leftFrame" frameborder="0" src="${appPath}front_showTreeAndShiInfo.action"></frame>
		<frame scrolling="no" title="midFrame" id="leftFrame" noresize="noresize" name="midFrame" frameborder="0" src="mid.html"></frame>

		<frame title="detailFrame" id="detailFrame" name="detailFrame" src="session.jsp?t=hs&amp;id=&amp;detail="></frame>
	</frameset>
	<noframes>
		<body>
		</body>
	</noframes>
</html>