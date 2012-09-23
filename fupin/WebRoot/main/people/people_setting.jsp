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
		function saveSettings(){
			var f = document.forms[0];
			var mounts = $('input[type="text"]');
			for(var i=0;i<mounts.length;i++){
				var val = mounts[i].value;
				if(val == '' || !/^\d+$/ig.test(val)){
					alert('请正确填写对应年度的份数');
					return false;
				}
			}
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
		<form method="get" action="${appPath}people_peopleSetting.action" name="searchForm">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
				<tbody>
					<tr>
						<td>
							您当前所处页面：民意调查表设置
						</td>
						<td align="right">
						<input type="button" class="button" value="保存" onclick="saveSettings();">
						</td>
						<td width="5px"></td>
					</tr>
				</tbody>
			</table>
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr align="center">
						<td width="" class="tables_headercell">
							年份
						</td>				
						<td width="" class="tables_headercell">
							单位填报的份数
						</td>
					</tr>
					<c:forEach items="${settingList }" var="s">
						<tr>
							<td height="25" align="center" class="tables_contentcell">
								${s.year}年
							</td>
							<td height="25" align="center" class="tables_contentcell">
								<input type="text" value="${s.mount}" name="mount_${s.year}">
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</body>
</html>