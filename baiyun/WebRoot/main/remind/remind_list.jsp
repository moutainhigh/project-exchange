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
		<form method="get" action="${appPath}org_leaderList.action" name="searchForm">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
				<tbody>
					<tr>
						<td>
							您当前所处页面：首页 >> 提醒
						</td>
						<td align="right">
							&nbsp;
						</td>
						<td width="5px"></td>
					</tr>
				</tbody>
			</table>
			<h2 style="background-color: yellow;">”结对帮扶低收入户”工作落实情况统计表 - 审核退回提醒</h2>
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr align="center">
						<td height="28" width="" class="tables_headercell">
							编号
						</td>
						<td width="" class="tables_headercell">
							年度
						</td>
						<td width="" class="tables_headercell">
							月份
						</td>
						<td width="" class="tables_headercell">
							状态
						</td>
						<td width="" class="tables_headercell">
							操作
						</td>
					</tr>
					<c:forEach items="${report1List}" var="f">
						<tr>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.id }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.year}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.time}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.cunRemark}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								<a href="${appPath}report_viewReport1.action?r.year=${f.year}&r.type=${f.type}&r.time=${f.time}">修改</a>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td height="25" align="right" class="tables_contentcell" colspan="6">
							<jsp:include page="../../pager.jsp"></jsp:include>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>