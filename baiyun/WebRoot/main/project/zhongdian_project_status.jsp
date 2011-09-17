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
		var year = '${zdStat.year}';
		var time = '${zdStat.month}';
		var half = '${zdStat.half}';
		$(function(){
			var str = '';
			for(var i=1;i<=12;i++){
				str += '<option value="'+i+'">第'+i+'月</option>';
			}
			$('#time').html(str);
			
			if(year != ''){
				setTimeout(function(){ 
				  $('#year').val(year);
				},1);
			}
			if(time != ''){
				setTimeout(function(){ 
				  $('#time').val(time);
				},1);
			}
			if(half != ''){
				setTimeout(function(){
					var i = parseInt(half);
					$('input[name="zdStat.half"]').eq(i-1).attr("checked",true);
				}, 1);
			}
		});
		function query(){
			var f = document.forms[0];
			f.action = "${appPath}pro_zdStat.action";
			f.submit();
		}
		function save(){
			var f = document.forms[0];
			f.action = "${appPath}pro_saveProZdStat.action";
			f.submit();
		}
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
		<form method="get" action="${appPath}pro_saveProZdStat.action" name="searchForm">
			<input type="hidden" name="zdStat.id" value="${zdStat.id}">
			<input type="hidden" name="zdStat.project.id" value="${zdStat.project.id}">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
				<tbody>
					<tr>
						<td>
							您当前所处页面：项目管理  >> 重点帮扶钟落潭镇项目进度报表
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
							<select name="zdStat.year" id="year">
								<option value=""></option>
								<option value="2011">2011</option>
							</select>
						</td>
						<td width="" class="tables_headercell">
							时间：
							<select name="zdStat.month" id="time">
								<option value=""></option>
							</select>
						</td>
						<td width="" class="tables_headercell">
							上/下半月：
							<input type="radio" name="zdStat.half" value="1"/>
							<input type="radio" name="zdStat.half" value="2"/>
						</td>
						<td width="" class="tables_headercell">
							<input type="button" value="按条件查询" class="button" name="查询" onclick="query();">
							<input type="button" value="保存" class="button" name="保存" onclick="save();">
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							项目名称
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; ${zdStat.project.name }
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							项目完成情况
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; <input value="${zdStat.complete }" name="zdStat.complete"/>
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							存在问题及拟解决措施
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; <input value="${zdStat.problem }" name="zdStat.problem"/>
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							总投资额（万元）
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp;  ${zdStat.project.money }
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							帮扶资金到位情况（万元）
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; <input value="${zdStat.money }" name="zdStat.money"/>
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							帮扶单位
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; ${zdStat.project.org.orgName }
						</td>
					</tr>
				</tbody>
			</table>
			</c:if>
		</form>
	</body>
</html>