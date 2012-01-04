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
		function exportReport(){
			document.forms[0].action = '${appPath}report_export.action';
			document.forms[0].submit();
		}
		$(function(){
			var now = new Date();
			var maxYear = now.getYear()<1970?now.getYear() + 1900:now.getYear();
			for(var i=2011;i<=maxYear;i++){
				$("#year").append('<option value="'+ i +'">'+ i +'</option>');
			}
			
			//修改月份的限制
			changeMonth();
			
			//zc or ch
			<c:if test="${userObj.roleType=='县级管理员' && (userObj.area.name == '增城市' || userObj.area.name == '从化市') && userObj.isWorkGroup=='Y'}">
			setTimeout(function(){
				$("#is206").html('<option value="206">北部贫困镇</option>');
			},1);
			</c:if>
			
			<c:if test="${userObj.roleType=='县级管理员' && (userObj.area.name == '增城市' || userObj.area.name == '从化市') && userObj.isWorkGroup!='Y'}">
			setTimeout(function(){
				$("#is206").html('<option value="not206">南部贫困镇</option>');
			},1);
			</c:if>
			
			<c:if test="${userObj.roleType=='县级管理员' && userObj.area.name != '增城市' && userObj.area.name != '从化市'}">
			$("#is206").attr("disabled",true);
			</c:if>
			
		});
		function changeMonth(){
			var now = new Date();
			var m = now.getMonth()+1;
			var y = now.getYear()<1970?now.getYear() + 1900:now.getYear();
			if($("#year").val() < y)
				m = 12 + 1;
			$('#month').html('');
			$('#month2').html('');
			for(var i=1;i<m;i++){
				$('#month').append("<option value=\""+i+"\">"+i+"</option>");
				$('#month2').append("<option value=\""+i+"\">"+i+"</option>");
			}
			setTimeout(function(){
				if(m > 1){
					$('#month').val(m-1);
					$('#month2').val(m-1);
				}
			},100);
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
		<form method="get" action="${appPath}report_export.action" name="searchForm">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
				<tbody>
					<tr>
						<td>
							您当前所处页面：报表导出
						</td>
						<td align="right">
						<input type="button" class="button" value="导出报表" onclick="exportReport();">
						</td>
						<td width="5px"></td>
					</tr>
				</tbody>
			</table>
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr align="center">
						<td width="" class="tables_headercell" colspan="2">
							报表导出选项
						</td>
					</tr>
					<tr>
						<td height="25" align="center" class="tables_contentcell">
							区、县级市
						</td>
						<td height="25" align="center" class="tables_contentcell">
							<c:if test="${userObj.roleType=='县级管理员'}">
							${userObj.area.name }
							</c:if>
							<c:if test="${userObj.roleType!='县级管理员'}">
							<select name="reportParam.areaName">
								<option value="从化市">从化市</option>
								<option value="增城市">增城市</option>
								<option value="南沙区">南沙区</option>
								<option value="萝岗区">萝岗区</option>
								<option value="白云区">白云区</option>
							</select>
							</c:if>
						</td>
					</tr>
					<tr>
						<td height="25" align="center" class="tables_contentcell">
							类型
						</td>
						<td height="25" align="center" class="tables_contentcell">
							<select name="reportParam.is206" id="is206">
								<option value="">全部</option>
								<option value="206">北部贫困镇</option>
								<option value="not206">南部贫困镇</option>
							</select>
						</td>
					</tr>
					<tr>
						<td height="25" align="center" class="tables_contentcell">
							年度
						</td>
						<td height="25" align="center" class="tables_contentcell">
							<select name="reportParam.year" id="year" onchange="changeMonth();" style="width: 60px;"></select>
						</td>
					</tr>
					<tr>
						<td height="25" align="center" class="tables_contentcell">
							月份
						</td>
						<td height="25" align="center" class="tables_contentcell">
							<select name="reportParam.month" id="month">
								
							</select>
							&nbsp;
							至
							&nbsp;
							<select name="reportParam.month2" id="month2">
								
							</select>
						</td>
					</tr>
					<tr>
						<td height="25" align="center" class="tables_contentcell">
							报表名称
						</td>
						<td height="25" align="center" class="tables_contentcell">
							<select name="reportParam.name">
								<option value="12">表一表二</option>
								<option value="3">表三</option>
							</select>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>