<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'index.jsp' starting page</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	</head>

	<body>
		
		<h1>抓取数据</h1>
		<ul>
			<c:forEach items="${maps}" var="map">
			<form action="fetch_fetch.htm" method="post"><input name="mappingClass.name" value="${map.key}" type="hidden"/>
			<li>${map.value}&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="开始抓取"/></li>
			</form>
			</c:forEach>
		</ul>
		
	</body>
</html>
