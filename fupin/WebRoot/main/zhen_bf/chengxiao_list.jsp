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
				document.forms[0].action = '${appPath}zhen_bf_deleteChengxiaoZhen.action';
				document.forms[0].submit();
			}
		}
</script>
</head><body>

<form method="get" action="${appPath}zhen_bf_chengxiaoZhenList.action" name="searchForm">

<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
	<tbody><tr>
	<td>您当前所处页面：镇帮扶维护&gt;&gt;帮扶成效 </td>
	<td align="right">

	

	<label>成效状态: </label>
	<select name="chengxiao.status" size="1">
		<option value="">--------------</option>
		<option value="未提交">未提交</option>
		<option value="审核中">审核中</option>
		<option value="审核通过">审核通过</option>
		<option value="审核不通过">审核不通过</option>
	</select>

		<input type="submit" class="button" value="查询"> 
		<input type="button" onclick="winOpen('${appPath}zhen_bf_editZhenChengxiao.action',600,390);" class="button" value="新增">
		<input type="button" onclick="deleteInfo();" class="button" value="删除">
	</td>
	<td width="5px" align="right"></td>
	</tr>
</tbody></table>
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
	
	<tbody><tr align="center">
		<td height="28" width="6%" class="tables_headercell">
		<input type="checkbox" onclick="checkAll(this);">
		<td width="20%" class="tables_headercell">编号</td>
		<td width="20%" class="tables_headercell">时间</td>
		<td class="tables_headercell">贫困镇名</td>
		<td width="20%" class="tables_headercell">审核状态</td>
		<td width="5%" class="tables_headercell">查看</td>
		<td width="10%" class="tables_headercell">修改</td>
	</tr>
	<c:forEach items="${pageBean.resultList}" var="f">
		<tr>
		<td height="25" align="center" class="tables_contentcell">
		<input type="checkbox" value="${f.id}" name="chengxiaoZhen_ids" class="chengxiaoZhen_ids">
		<input type="hidden" value="2" name="sftj3981" id="sftj3981">
		</td>
		<td height="25" align="center" class="tables_contentcell">
			${f.id }
		</td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;
			${f.year }
		</td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;
			${f.zhen.name }
		</td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;
			<c:if test="${f.status=='未提交'}">
			<a href="#" onclick="winOpen('${appPath}zhen_bf_confirmChengxiao.action?chengxiao.id=${f.id}',600,390);">确认后提交</a>
			</c:if>
			<c:if test="${f.status!='未提交'}">
			${f.status }
			</c:if>
		</td>
		<td height="25" align="center" class="tables_contentcell">
		<a onclick="winOpen('${appPath}zhen_bf_viewChengxiaoZhen.action?chengxiao.id=${f.id}',600,390);" href="#">查看</a>
		</td><td height="25" align="center" class="tables_contentcell">
		<c:if test="${f.status=='未提交'}">
		<a href="#" onclick="winOpen('${appPath}zhen_bf_editZhenChengxiao?chengxiao.id=${f.id}',600,390);">修改</a>
		 </c:if>
		 <c:if test="${f.status!='未提交'}">
		不能修改
		</c:if>
		</td>
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
