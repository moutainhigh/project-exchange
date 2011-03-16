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
				document.forms[0].action = '${appPath}recheck_delete.action';
				document.forms[0].submit();
			}
		}
</script>
</head><body>

<form method="get" action="${appPath}recheck_list.action" name="searchForm">

<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
	<tbody><tr>
	<td>您当前所处页面：重审申请 </td>
	<td>&nbsp;</td>
	<td align="right">

	<label>申请类型: </label>
	<select name="moduleType">
		<option value="0" >请选择</option>
		<option value="村措施" <c:if test="${param.moduleType=='村措施'}">selected</c:if>>村年度措施</option>
		<option value="村成效" <c:if test="${param.moduleType=='村年度成效'}">selected</c:if>>村年度成效</option>
		<option value="村图片" <c:if test="${param.moduleType=='村图片'}">selected</c:if>>村图片</option>
		<option value="0">－－－－－－</option>
		<option value="户贫困原因" <c:if test="${param.moduleType=='户贫困原因'}">selected</c:if>>户贫困原因</option>
		<option value="户帮扶措施" <c:if test="${param.moduleType=='户帮扶措施'}">selected</c:if>>户帮扶措施</option>
		<option value="户扶持内容" <c:if test="${param.moduleType=='户扶持内容'}">selected</c:if>>户扶持内容</option>
		<option value="户帮扶成效" <c:if test="${param.moduleType=='户帮扶成效'}">selected</c:if>>户帮扶成效</option>
		<option value="户图片" <c:if test="${param.moduleType=='户图片'}">selected</c:if>>户图片</option>
	</select>


	<label>申请状态: </label>
	<select name="state">
		<option value="" >请选择</option>
		<option value="待审核" <c:if test="${param.state=='待审核'}">selected</c:if>>待审核</option>
		<option value="批准重审" <c:if test="${param.state=='批准重审'}">selected</c:if>>批准重审</option>
		<option value="不批准重审" <c:if test="${param.state=='不批准重审'}">selected</c:if>>不批准重审</option>
	</select>


		<input type="submit" class="button" value="查询"> 
		<input type="button" onclick="winOpen('${appPath}main/recheck/edit.jsp',600,390);" class="button" value="新增">
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
			<td class="tables_headercell">重审模块</td>
			<td class="tables_headercell">记录编号</td>
            <td class="tables_headercell">申请原因</td>
			<td class="tables_headercell">状态</td>

	</tr>
		<c:forEach items="${pageBean.resultList}" var="f">
		<tr>
			<td height="25" align="center" class="tables_contentcell">
			<input type="checkbox" value="${f.id}" name="ids" class="ids">
			</td>
			<td height="25" align="center" class="tables_contentcell">${f.id }</td>
			<td height="25" align="center" class="tables_contentcell">${f.module }</td>	
			<td height="25" align="center" class="tables_contentcell">${f.recordId }</td>
			<td height="25" align="center" class="tables_contentcell">&nbsp;${f.reason }</td>
			<td height="25" align="center" class="tables_contentcell">${f.state }</td>
		</tr>
		</c:forEach>
	<tr>
		<td height="25" align="right" class="tables_contentcell" colspan="8">
		<jsp:include page="../../pager.jsp"></jsp:include>
		</td>
	</tr>
</tbody></table>
</form>
</body></html>
