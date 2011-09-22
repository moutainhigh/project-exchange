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
		data = eval('('+data+')');
		$(function(){
			$('#test').datagrid({
				title:'工作落实情况统计表',
				//width:'90%',
				//height:350,
				nowrap: false,
				striped: true,
				collapsible:true,
				//url:'${appPath}js/datagrid_data.json',
				remoteSort: false,
				columns:[[
			        {field:'zhen',title:'镇',width:100,align:'center'},
			        {field:'cun',title:'村',width:100,align:'center'},
			        {field:'org',title:'单位',width:300,align:'center'},
			        {field:'ok7',title:'7月',width:50,align:'center'},
			        {field:'ok8',title:'8月',width:50,align:'center'},
			        {field:'ok9',title:'9月',width:50,align:'center'},
			        {field:'ok10',title:'10月',width:50,align:'center'},
			        {field:'ok11',title:'11月',width:50,align:'center'},
			        {field:'ok12',title:'12月',width:50,align:'center'}
				]],
				//pagination:true,
				rownumbers:true,
				pageSize:10
			});
			//var p = $('#test').datagrid('getPager');
			$('#test').datagrid('loadData',data);
			//$('#test').datagrid('reload');
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
						您当前所处页面：工作落实情况统计表
					</td>
					<td align="right">
					&nbsp;
					</td>
					<td width="5px"></td>
				</tr>
			</tbody>
		</table>
		<table id="test"></table>
	</body>
</html>