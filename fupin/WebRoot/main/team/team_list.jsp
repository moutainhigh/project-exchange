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
		<form method="get" action="${appPath}admin_zhenWorkOrgList.action" name="searchForm">
			<input type="hidden" name="del" id="del" value="">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
				<tbody>
					<tr>
						<td>
							您当前所处页面：基础数据维护 >> 工作组管理
						</td>
						<td align="right">
							<input type="button" onclick="winOpen('${appPath}main/team/team_edit.jsp',450,420);" class="button" value="新增">
						</td>
						<td width="5px"></td>
					</tr>
				</tbody>
			</table>
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr align="center">
						<td class="tables_headercell">
							帐号名
						</td>
						<td class="tables_headercell">
							所派区县
						</td>
						<td class="tables_headercell">
							指定帮扶的镇
						</td>
						<td class="tables_headercell">
							帮扶的村名
						</td>
						<td class="tables_headercell">
							操作
						</td>
					</tr>
					<c:forEach items="${teamList}" var="f">
						<tr>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.loginName}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.area.name}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.zhen.name}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.cunTxt}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								<a href="#" onclick="winOpen('${appPath}team_viewTeam.action?team.id=${f.id}',450,220);">修改帮扶</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</body>
</html>