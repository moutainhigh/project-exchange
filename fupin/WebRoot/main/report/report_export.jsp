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
		<form method="get" action="${appPath}report_unlock.action" name="searchForm">
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
							206
						</td>
						<td height="25" align="center" class="tables_contentcell">
							<input type="radio" name="reportParam.is206" value="206" checked="checked"/>是
							&nbsp;&nbsp;&nbsp;
							<input type="radio" name="reportParam.is206" value="not206"/>否
						</td>
					</tr>
					<tr>
						<td height="25" align="center" class="tables_contentcell">
							地区
						</td>
						<td height="25" align="center" class="tables_contentcell">
							<select name="reportParam.diqu">
								<option value="conghua">从化</option>
								<option value="zengcheng">增城</option>
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