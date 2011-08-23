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
		<form method="get" action="${appPath}report_unlock.action" name="searchForm">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
				<tbody>
					<tr>
						<td>
							您当前所处页面：贫困户类型统计
						</td>
						<td align="right">
						&nbsp;
						</td>
						<td width="5px"></td>
					</tr>
				</tbody>
			</table>
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr align="center">
						<td width="" class="tables_headercell" rowspan="2">
							序号
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							村名
						</td>
						<td width="" class="tables_headercell" colspan="4">
							贫困户类型
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							合计
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							低保户
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							低收入困难家庭
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							有劳动能力
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							无劳动能力
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							有劳动能力所占比例
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_headercell">
							有劳动能力的低保户
						</td>
						<td width="" class="tables_headercell">
							无劳动能力的低保户
						</td>
						<td width="" class="tables_headercell">
							有劳动能力的低收入困难家庭
						</td>
						<td width="" class="tables_headercell">
							无劳动能力的低收入困难家庭
						</td>
					</tr>
					<c:forEach items="${pageBean.resultList}" var="f" varStatus="varStatus">
						<tr>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${varStatus.count}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.cunName}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.type1}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.type2}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.type3}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.type4}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.type1 + f.type2 + f.type3 + f.type4}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.type1 + f.type2}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.type3 + f.type4}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.type1 + f.type3}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.type2 + f.type4}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.rate}
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td height="25" align="right" class="tables_contentcell" colspan="12">
							<jsp:include page="../../pager.jsp"></jsp:include>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>