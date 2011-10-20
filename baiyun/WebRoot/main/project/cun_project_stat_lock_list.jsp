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
		function unlockInfo(){
			if($('input:checked').length>0 && confirm('您确定解锁吗？')){
				document.forms[0].action = '${appPath}pro_unlockProCunStat.action';
				document.forms[0].submit();
			}
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
		<form method="get" action="${appPath}pro_proCunStatLockList.action" name="searchForm">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
				<tbody>
					<tr>
						<td>
							您当前所处页面：报表解锁
						</td>
						<td align="right">
						<input type="button" class="button" value="解锁" onclick="unlockInfo();">
						</td>
						<td width="5px"></td>
					</tr>
				</tbody>
			</table>
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr align="center">
						<td height="28" width="" class="tables_headercell">
							<input type="checkbox" onclick="checkAll(this);">
						</td>
						<td width="" class="tables_headercell">
							编号
						</td>
						<td width="" class="tables_headercell">
							帮扶单位
						</td>
						<td width="" class="tables_headercell">
							村名
						</td>
						<td width="" class="tables_headercell">
							项目名称
						</td>
						<td width="" class="tables_headercell">
							年份
						</td>
						<td width="" class="tables_headercell">
							月份
						</td>
					</tr>
					<c:forEach items="${proCunStatList}" var="f">
						<tr>
							<td height="25" align="center" class="tables_contentcell">
								<input type="checkbox" value="${f.id}" name="ids">
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.id}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.project.org.orgName}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.project.cun.name }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.project.name }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.year }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.month }
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</body>
</html>