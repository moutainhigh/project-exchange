<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	<style>
		body {
			text-align:center;
		}
	</style>
	<script type="text/javascript">
		var arr = [	'${org.name}',
					'${org.person}',
					'${org.address}',
					'${org.style}',
					'${org.item}',
					'${org.no}',
					'<fmt:formatDate value = "${org.validDateStart}" pattern = "yyyy年MM月dd日"/>',
					'<fmt:formatDate value = "${org.validDate}" pattern = "yyyy年MM月dd日"/>',
					'${org.fromOrg}',
					'${org.publishDate}'];
		
	</script>
  </head>
  
  <body>
    <applet id="hh" alt="Applet" width="1024" height="768" 
		code="print.PrintServiceApplet" 
		archive="print.jar"
		codebase="<%=basePath %>" mayscript>
		<param name="orgName" value="${org.name}">
		<param name="person" value="${org.person}">
		<param name="address" value="${org.address}">
		<param name="style" value="${org.style}">
		<param name="item" value="${org.item}">
		<param name="no" value="${org.no}">
		<param name="validDateStart" value="<fmt:formatDate value = "${org.validDateStart}" pattern = "yyyy  M  d "/>">
		<param name="validDate" value="<fmt:formatDate value = "${org.validDate}" pattern = "yyyy  M  d"/>">
		<param name="fromOrg" value="${org.fromOrg}">
		<param name="publishDate" value="<fmt:formatDate value = "${org.publishDate}" pattern = "yyyy  M  d "/>">
	</applet>
  </body>
</html>
