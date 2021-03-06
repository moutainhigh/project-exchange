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
						全市医疗卫生单位部分医疗业务总表
					</td>
				</tr>
				<tr style="font-size: 12px;">					
					<td align="center">
<c:choose>
	<c:when test="${empty msg}">
		<input type="button" value="生成报表" onclick="self.location.href='${appPath}/report.do?method=genSummary&dateType=${param.dateType}&year=${param.year}&month=${param.month}&season=${param.season}'"/>
		<input type="button" value="重新生成" onclick="self.location.href='${appPath}/report.do?method=genSummary&dateType=${param.dateType}&year=${param.year}&month=${param.month}&season=${param.season}'"/>
	</c:when>
	<c:otherwise>
		<span style="color:gray;">暂时无法生成汇总表，请上传该时期的报表文件</span>
	</c:otherwise>
</c:choose>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
