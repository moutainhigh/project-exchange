<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml"><head>









<!-- by Arde -->

<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
<script src="${appPath}js/jquery.js" language="javascript"></script>
<script src="${appPath}js/sel_style.js" language="javascript"></script>
<script src="${appPath}js/validateForm.js" language="javascript"></script>
<script language="javascript">
	var msg = '${msg}';
	if(msg != '')
		alert(msg);
</script>

<style>
	.tables_leftcell {
		border-top: 1px solid #FFFFFF;
		border-left: 1px solid #FFFFFF;
		border-right: 1px solid #4D9EE3;
		border-bottom: 1px solid #4D9EE3;
		BACKGROUND-COLOR: #EFF6FF;
		padding: 0px;
		font-size: 12px;
		font-weight: bold;
		color: #000000;
	}
	.tables_search {
		margin: 0px 0px 2px 0px;
		height: 40px;
		background-color: #418FD0;
	}
</style>
</head><body>

	<form  method="get" action="${appPath}admin_edit.action" name="searchForm" onsubmit="return Validator.Validate(this);">
	<input type="hidden" name="org.id" value="${org.id}">
	<table cellspacing="0" cellpadding="0" border="0" width="100%" class="tables_search">
		<tbody><tr>
		<td>您当前所处页面：短信服务&gt;&gt;用户通讯信息维护</td>
		</tr>
	</tbody></table>
	<table cellspacing="0" cellpadding="0" border="0" width="100%" class="tables_table">
		<tbody><tr>
    	<td align="center" class="tables_contentcell" colspan="4">┏━━━单位通讯信息━━━┓</td>
		</tr>
		<tr>
		<td height="30" align="right" width="15%" class="tables_leftcell">短信联系手机</td>
    	<td width="35%" class="tables_contentcell">
		<input type="text" msg="手机号码不能为空,且需符合号码规则" datatype="Mobile" size="20" value="<c:if test="${userObj.isWorkGroup!='Y'}">${userObj.segment3 }</c:if><c:if test="${userObj.isWorkGroup=='Y'}">${userObj.segment4 }</c:if>" id="contactMobile" name="mobile">
    	</td>
		</tr>
		<tr>
    	<td align="center" class="tables_contentcell" colspan="4">
		<input type="submit" value="确认" class="button" name="确认">
		<input type="button" class="button" value="取消" name="取消">
		</td>
		</tr>
	</tbody></table>
	
	</form>
</body></html>
