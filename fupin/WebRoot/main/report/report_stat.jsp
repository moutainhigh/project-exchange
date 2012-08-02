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
		function statReport(){
			document.forms[0].action = '${appPath}report_stat.action';
			document.forms[0].submit();
		}
		function statExportReport(){
			document.forms[0].action = '${appPath}report_statExport.action';
			document.forms[0].submit();
		}
		$(function(){
			var now = new Date();
			var maxYear = now.getYear()<1970?now.getYear() + 1900:now.getYear();
			for(var i=2011;i<=maxYear;i++){
				$("#year").append('<option value="'+ i +'">'+ i +'</option>');
				$("#year2").append('<option value="'+ i +'">'+ i +'</option>');
			}
			
			//修改月份的限制
			changeMonth();
			changeMonth2();
		});
		function changeMonth(){
			var now = new Date();
			var m = now.getMonth()+1;
			var y = now.getYear()<1970?now.getYear() + 1900:now.getYear();
			if($("#year").val() < y)
				m = 12 + 1;
			$('#month').html('');
			for(var i=1;i<m;i++){
				$('#month').append("<option value=\""+i+"\">"+i+"</option>");
			}
			setTimeout(function(){
				if(m > 1){
					$('#month').val(m-1);
				}
			},100);
		}
		function changeMonth2(){
			var now = new Date();
			var m = now.getMonth()+1;
			var y = now.getYear()<1970?now.getYear() + 1900:now.getYear();
			if($("#year2").val() < y)
				m = 12 + 1;
			$('#month2').html('');
			for(var i=1;i<m;i++){
				$('#month2').append("<option value=\""+i+"\">"+i+"</option>");
			}
			setTimeout(function(){
				if(m > 1){
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
		<form method="get" action="${appPath}report_stat.action" name="searchForm">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
				<tbody>
					<tr>
						<td>
							您当前所处页面：“双到”工作统计表
						</td>
						<td align="right">
						<input type="button" class="button" value="统计" onclick="statReport();">
						<input type="button" class="button" value="导出统计报表" onclick="statExportReport();">
						</td>
						<td width="5px"></td>
					</tr>
				</tbody>
			</table>
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr>
						<td height="25" align="center" class="tables_contentcell">
							统计的年度月份
						</td>
						<td height="25" align="center" class="tables_contentcell">
							<select name="reportParam.year" id="year" onchange="changeMonth();" style="width: 60px;"></select>
							年
							<select name="reportParam.month" id="month">
								
							</select>
							月
							&nbsp;
							至
							&nbsp;
							<select name="reportParam.year2" id="year2" onchange="changeMonth2();" style="width: 60px;"></select>
							年
							<select name="reportParam.month2" id="month2">
								
							</select>
							月&nbsp;(若起至月份相同则表示一个月的时间)
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>