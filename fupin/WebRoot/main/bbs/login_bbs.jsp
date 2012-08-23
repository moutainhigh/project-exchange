<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	if(session.getAttribute("userObj") == null){
		request.getRequestDispatcher("/login.jsp").forward(request,response);
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script language="javascript">
			$(function(){
				$('#form2').submit();
				window.setTimeout(function(){
					$('#form1').submit();
				},500);
			});
		</script>
	</head>
	<body>
		<form id="form1" method="post" action="${BBS_Path}login.jspx" name="searchForm">
			<input type="hidden" name="captcha" value="" />
			<input type="hidden" name="cookieType" value="4" />
			<input type="hidden" name="password" value="123" />
			<input type="hidden" name="processUrl" value="${BBS_Path}?locale=zh_CN" />
			<input type="hidden" name="returnUrl" value="${BBS_Path}" />
			<input type="hidden" name="username" value="${userObj.loginName }" />
			<h2>论坛登录中。。。</h2>
		</form>
		<form id="form2" method="post" action="${BBS_Path}jeeadmin/jeebbs/user/o_save.do" target="myFrame">
			<input type="hidden" name="groupId" value="1" />
			<input type="hidden" name="password" value="123" />
			<input type="hidden" name="username" value="${userObj.loginName }" />
		</form>
		<iframe id="myFrame" name="myFrame" style="display:none;"></iframe>
	</body>
</html>