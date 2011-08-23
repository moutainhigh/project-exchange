<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
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
		$(function(){
			var str = '';
			for(var i=1;i<=12;i++){
				str += '<option value="'+i+'">第'+i+'月</option>';
			}
			$('#time').html(str);
			if(time != ''){
				setTimeout(function(){ 
				  //$('#time').val(time);
				},1);
			}
		});
		</script>
		<style>
.tables_search {
	margin: 0px 0px 2px 0px;
	height: 40px;
	background-color: #418FD0;
}
</style>
	</head>
	<body>
		<form method="get" action="${appPath}manager_managerMappingList.action" name="searchForm">
			<input type="hidden" name="del" id="del" value="">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
				<tbody>
					<tr>
						<td>
							您当前所处页面：项目管理  >> 村项目进度报表
						</td>
						<td align="right">
							&nbsp;
						</td>
						<td width="5px"></td>
					</tr>
				</tbody>
			</table>
			<c:if test="${userObj.isDiv=='Y'}">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr align="center">
						<td width="" class="tables_headercell">
							年度：
							<select name="r.year" id="year">
								<option value=""></option>
								<option value="2011">2011</option>
							</select>
						</td>
						<td width="" class="tables_headercell">
							时间：
							<select name="r.time" id="time">
								<option value=""></option>
							</select>
						</td>
						<td width="" class="tables_headercell">
							上/下半月：
							<input type="radio" checked="checked" name="type" value="1"/>
							<input type="radio" name="type" value="2"/>
						</td>
						<td width="" class="tables_headercell">
							<input type="button" value="按条件查询" class="button" name="查询" onclick="query();">
							<input type="button" value="保存" class="button" name="保存" onclick="saveReport();">
							<input type="button" value="暂存" class="button" name="暂存" onclick="tmpSaveReport();">
							<input type="button" value="请求解锁" class="button" name="请求解锁" onclick="unlockReport();">
							<input type="button" value="Excel导出" class="button" name="Excel导出" onclick="excel();">
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" rowspan="2">
							帮扶对象
						</td>
						<td width="" class="tables_contentcell">
							所属镇
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; 
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell">
							村名
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; 
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							项目名称
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; 
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							项目完成情况
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; 
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							存在问题及拟解决措施
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; 
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							总投资额（万元）
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; 
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							帮扶资金到位情况（万元）
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; 
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							帮扶单位
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; 
						</td>
					</tr>
				</tbody>
			</table>
			</c:if>
		</form>
	</body>
</html>