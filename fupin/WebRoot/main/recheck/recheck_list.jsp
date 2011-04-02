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
<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
<script language="javascript">
var msg = '${msg}';
		if(msg != ''){
			alert(msg);
		}
		function checkAll(obj){
			if($(obj).attr('checked')){
				$('input[type="checkbox"]').attr('checked',true);
			}else{
				$('input[type="checkbox"]').attr('checked',false);
			}
		}
		function deleteInfo(){
			if(confirm('您确定删除吗？') && $('input:checked').length>0){
				document.forms[0].action = '${appPath}recheck_deleteRecheck.action';
				document.forms[0].submit();
			}
		}
</script>
</head><body>

<form method="get" action="${appPath}recheck_listRecheck.action" name="searchForm" onsubmit="return Validator.Validate(this)">

<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
	<tbody><tr>
	<td>您当前所处页面：修改申请 </td>
	<td>&nbsp;</td>
	<td align="right">

	<label>记录编号: </label>
	<input type="text" name="recordId" value="${param.recordId}" dataType="Number" msg="修改记录编号必须为数字"/>


		<input type="submit" class="button" value="查询"> 
		<input type="button" onclick="deleteInfo();" class="button" value="删除">
	</td>
	<td width="5px" align="right"></td>
	</tr>
</tbody></table>
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
	
	<tbody><tr align="center">
		<td height="28" width="6%" class="tables_headercell">
		<input type="checkbox" onclick="checkAll(this);">
		<td width="10%" class="tables_headercell">编号</td>
			<td class="tables_headercell">修改模块</td>
			<td class="tables_headercell">记录编号</td>
            <td class="tables_headercell">申请原因</td>
			<td class="tables_headercell">状态</td>
			<td class="tables_headercell">提交者账号</td>
			<td class="tables_headercell">操作</td>

	</tr>
		<c:forEach items="${pageBean.resultList}" var="f">
		<tr>
			<td height="25" align="center" class="tables_contentcell">
			<input type="checkbox" value="${f.id}" name="ids" class="ids">
			</td>
			<td height="25" align="center" class="tables_contentcell">&nbsp;${f.id }</td>
			<td height="25" align="center" class="tables_contentcell">&nbsp;${f.module }</td>	
			<td height="25" align="center" class="tables_contentcell">&nbsp;${f.recordId }</td>
			<td height="25" align="center" class="tables_contentcell">&nbsp;${f.reason }</td>
			<td height="25" align="center" class="tables_contentcell">&nbsp;${f.state }</td>
			<td height="25" align="center" class="tables_contentcell">&nbsp;${f.org.loginName }</td>
			<td height="25" align="center" class="tables_contentcell">
				&nbsp;
				<c:if test="${f.state=='待审核'}">
				<a href="${appPath}recheck_passRecheck.action?recheck.id=${f.id}">批准重审</a>
				<a href="${appPath}recheck_unpassRecheck.action?recheck.id=${f.id}">不批准重审</a>
				</c:if>
				
			</td>
		</tr>
		</c:forEach>
	<tr>
		<td height="25" align="right" class="tables_contentcell" colspan="10">
		<jsp:include page="../../pager.jsp"></jsp:include>
		</td>
	</tr>
</tbody></table>
</form>
</body></html>
