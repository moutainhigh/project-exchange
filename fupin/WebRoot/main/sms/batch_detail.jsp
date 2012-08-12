<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>批量短信 - 详细信息</title>
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script>
			<jsp:include page="../../msg.jsp"></jsp:include>
				
		</script>
		<style type="text/css">
		ul{margin:0px; padding: 2px; list-style: none;}
		li{margin:1px 3px; padding: 2px; list-style: none; display: block; float: left;}
		</style>
	</head>
	<body>
		<form method="get" onsubmit="return Validator.Validate(this);" action="${appPath}sms_sendSMS.action" name="">
			<table height="100%" cellspacing="0" cellpadding="0" border="0" width="100%" class="tables_table">
	<tbody>
	<tr>
		<td height="30" align="right" class="tables_leftcell">
		发送内容
		</td>
		<td class="tables_contentcell">
		${bs.content }
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">
		发送人
		</td>
		<td class="tables_contentcell">
		${bs.sender }
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">
		发送时间
		</td>
		<td class="tables_contentcell">
		<fmt:formatDate value="${bs.date}" pattern="yyyy-MM-dd hh:mm:ss"/>
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">
		接收号码
		</td>
		<td class="tables_contentcell">
			<ul>
			<c:forEach items="${ucList }" var="uc">
			<li>${uc.name}/${uc.mobile}</li>
			</c:forEach>
			<c:forEach items="${leaderList }" var="l">
			<li>${l.leaderName}/${l.tel}</li>
			</c:forEach>
			</ul>
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">
		合计发送条数
		</td>
		<td class="tables_contentcell">
		${bs.count }
		</td>
	</tr>
	<tr>
		<td align="center" class="tables_contentcell" colspan="4">
		<input type="button" onclick="self.close();" class="button" value="关闭" name="关闭">
		</td>
	</tr>
	</tbody></table>
		</form>
	</body>
</html>