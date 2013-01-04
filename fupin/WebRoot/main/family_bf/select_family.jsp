<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml"><head>

<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>选择贫困户</title>
<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${appPath}css/jquery.autocomplete.css" />
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script src="${appPath}js/jquery.autocomplete2.js"></script>
<script language="javascript">
<jsp:include page="../../msg.jsp"></jsp:include>

function selectIt(fId,fName){
	window.opener.selectOneFamily(fId,fName);
	self.close();
}
 
 
</script>
<style>
		textarea{width:99%;width:80%;}
		</style>
</head><body onload="">
  <form method="get" action="${appPath}family_bf_selectFamily.action">
<input name="familyName" value="${param.familyName}" id="familyName" type="text"/>
<input name="search" value="搜索" type="submit"/>
<br/></form>
<ul>
	<c:forEach items="${familyList}" var="f">
	<li style="cursor: pointer;"><a title="点击选择" href="javascript:;" onclick="selectIt(${f.id},'${f.name }')">${f.name }</a></li>
	</c:forEach>
</ul>

</body></html>