<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>新增医生注册</title>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<link rel="stylesheet" type="text/css" href="${appPath}/css/styles.css">
		<link rel="stylesheet" type="text/css" href="${appPath}/css/jquery.datepick.css" />
		<script type="text/javascript" src="${appPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${appPath}/js/jquery.datepick.js"></script>
		<script type="text/javascript" src="${appPath}/js/jquery.datepick-zh-CN.js"></script>
		<script type="text/javascript">
			var msg = '${requestScope.msg}';
			if(msg != ''){
				alert(msg);
			}
			$(function(){
			});
		</script>
		<style>
		</style>
	</head>
	<body>
		<form name="messageForm" method="post" action="${appPath}/report.do" onsubmit="return(checkYear());">
			<input type="hidden" name="method" value="addYear"/>
			<div style="height: 25px;"></div>
			<table width="90%" border="1" cellspacing="1" cellpadding="0" class=table align="center">
				<tr style="font-size: 14px; font-weight: 600;">					
					<td align="center">
						序号
					</td>
					<td align="center">
						已有年份
					</td>
					<td align="center">
						查看
					</td>
				</tr>
				<c:forEach items="${years}" var="y" varStatus="status">
				<tr style="font-size: 12px;">					
					<td align="center">
						${status.count }
					</td>
					<td align="center">
						${y.value }
					</td>
					<td align="center">
						<a href="${appPath}/report.do?method=listOrg&year=${y.value}&dateType=${param.dateType}&orgTypeId=${param.orgTypeId}">查看</a>
					</td>
				</tr>
				</c:forEach>
			</table>
		</form>
	</body>
</html>
