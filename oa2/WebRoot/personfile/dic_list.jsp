<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>����ҽ��ע��</title>
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
			function saveForm(){
				document.forms[0].submit();
			}
			$(function(){
			});
		</script>
	</head>
	<body>
		<form name="messageForm" method="get" action="${appPath}/file.do">
			<input type="hidden" name="method" value="listPersonFile"/>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td height="18" align=center>
			        <font class=caption>���µ��������ֵ�</font>
			      </td>
			    </tr>
			</table>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr class="list_td_title">					
					<td align="center">
						���
					</td>
					<td align="center">
						�ֵ�����
					</td>
					<td align="center">
						����
					</td>
				</tr>
				<c:forEach items="${dicMap}" var="d" varStatus="status">
				<tr class="list_td_context">
					<td>
						${status.count}
					</td>
					<td>
						${d.value}
					</td>
					<td>
						<a href="${appPath}/file.do?method=dicEdit&dicName=${d.key}">����ά��</a>
					</td>
				</tr>
				</c:forEach>
			</table>
		</form>
	</body>
</html>
