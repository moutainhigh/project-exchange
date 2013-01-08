<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="${appPath}js/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="${appPath}js/themes/icon.css">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script type="text/javascript" src="${appPath}js/jquery.easyui.min.js"></script>
		<script language="javascript">
		var msg = '${msg}';
		if(msg != ''){
			alert(msg);
		}
		var data = '${jsonObject}';
		if(data != ''){
			data = eval('('+data+')');
			$(function(){
				$('#test').datagrid({
					title:'考评调查表（一）填报情况',
					//width:'90%',
					//height:350,
					nowrap: false,
					striped: true,
					collapsible:true,
					//url:'${appPath}js/datagrid_data.json',
					remoteSort: false,
					columns:[[
						{field:'area',title:'区/县',width:100,align:'center'},
						{field:'zhen',title:'镇',width:100,align:'center'},
				        {field:'cun',title:'村',width:100,align:'center'},
				        {field:'org',title:'帮扶单位',width:200,align:'center'},
				        {field:'ok1',title:'填报状态',width:100,align:'center'}
					]],
					//pagination:true,
					rownumbers:true,
					pageSize:10
				});
				//var p = $('#test').datagrid('getPager');
				$('#test').datagrid('loadData',data);
				//$('#test').datagrid('reload');
				$('.datagrid-cell').each(function(){
					if($(this).html().indexOf('Y') > -1){
						var arr = $(this).html().split("-");
						var zhenId = arr[1];
						var year = arr[2];
						var time = arr[3];
						$(this).html('<a href="javascript:void();" onclick="javascript;" style="text-decoration:underline;">Y</a>'); 
						//$(this).html('<a href="javascript:void();" onclick="#" style="text-decoration:underline;">Y</a>');
					}
				});
			});
		}
		
		var year = '${year}';
		var maxYear = '${maxYear}';
		var now = new Date();
		var currYear = now.getYear()<1970?now.getYear() + 1900:now.getYear();
		maxYear = maxYear==''?currYear:parseInt(maxYear);
		$(function(){
			for(var i=2011;i<=maxYear;i++){
				$("#year").append('<option value="'+ i +'">'+ i +'</option>');
			}
			if(year != ''){
				setTimeout(function(){ 
				    $('#year').val(year);
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
		<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
			<tbody>
				<tr>
					<td>
						您当前所处页面：考评调查表（一）填报情况
					</td>
					<td align="right">
					&nbsp;
					<form action="${appPath}question_state1.action" method="get">
					年度：
							<select name="year" id="year" style="width: 60px;">
							</select>
					&nbsp;
					<input type="submit" value="统计" class="button"/>
					</form>
					</td>
					<td width="5px"></td>
				</tr>
			</tbody>
		</table>
		<table id="test"></table>
	</body>
</html>