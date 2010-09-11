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
		<form action="fetch_generate.htm" method="post">
		<h1>生成配置文件</h1>
		<table border="1" width="100%">
			<tr>
				<td>标识名</td>
				<td><input name="mappingClass.name"/></td>
				<td>站点地址</td>
				<td><input name="mappingClass.url"/></td>
			</tr>
			<tr>
				<td>字符编码</td>
				<td><input name="mappingClass.encode"/></td>
				<td>数据库表</td>
				<td><input name="mappingClass.table"/></td>
			</tr>
			<tr>
				<td colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<th>数据库列</th>
				<th>数据类型</th>
				<th>解析方式</th>
				<th width="50%">解析参数</th>
			</tr>
			<c:forEach items="${maps}" var="map" varStatus="status">
			<tr>
				<td><input name="mappingClass.propertyList[${status.count-1}].name" value="${map.key}"/></td>
				<td><input name="mappingClass.propertyList[${status.count-1}].type" value="${map.value}"/></td>
				<td><input name="mappingClass.propertyList[${status.count-1}].value.type"/></td>
				<td>
					解析器类型：<input name="mappingClass.propertyList[${status.count-1}].value.parser.type"/>
					<br/>
					匹配正则：<input name="mappingClass.propertyList[${status.count-1}].value.parser.pattern"/>
					<br/>
					排除正则:<input name="mappingClass.propertyList[${status.count-1}].value.parser.exclude"/>
				</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="4">
					<input type="submit" value="提交"/>
				</td>
			</tr>
		</table>
		</form>
	</body>
</html>
