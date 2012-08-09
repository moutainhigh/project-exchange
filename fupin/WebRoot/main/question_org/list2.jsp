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
		
		function query(){
			var f = document.forms[0];
			f.action = "${appPath}questionOrg_list2.action";
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
		<form method="get" action="${appPath}question_list2.action" name="searchForm">
			<input type="hidden" name="year" value="${param.year}"/>
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
				<tbody>
					<tr>
						<td>
							您当前所处页面：调查表资料维护 >> ${param.year}调查表（二）
						</td>
						<td align="right">
							户名模糊查询：<input type="text" name="familyName" value="${param.familyName }" style="width:100px;"/>
							&nbsp;
							<input type="button" class="button" value="查询" onclick="query();"> 
							<input type="button" class="button" value="上传调查表" onclick="winOpen('${appPath}main/question_org/upload2.jsp?year=${year}',500,300);"/>
						</td>
					</tr>
				</tbody>
			</table>
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr align="center">
						<td width="" class="tables_headercell">
							村名
						</td>
						<td width="" class="tables_headercell">
							户名
						</td>
						<td width="" class="tables_headercell">
							填表人
						</td>
						<td width="" class="tables_headercell">
							填表日期
						</td>
						<td width="" class="tables_headercell">
							操作
						</td>
					</tr>
					<c:forEach items="${pageBean.resultList}" var="f">
						<tr>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp;${f.cun.zhen.area.name}${f.cun.zhen.name}${f.cun.name}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 								
								${f.name}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 
								${f.q2.writer }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; <fmt:formatDate value="${f.q2.date}" pattern="yyyy-MM-dd"/>
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp;
								<a href="javascript:void(0);" onclick="winOpen('${appPath}questionOrg_edit2.action?q2.family.id=${f.id}&year=${param.year }',800,600);">编辑/查看</a>
								<c:if test="${f.q2.status == 1}">
								<a href="${appPath}questionOrg_unlock2.action?id=${f.q2.id }&year=${param.year }">申请修改</a>
								</c:if>
								<c:if test="${f.q2.status == 2}">&nbsp;(申请解锁中)</c:if>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td height="25" align="right" class="tables_contentcell" colspan="3">
							<span style="color:red;font-weight: bold;">${pageBean.total }</span>
						</td>
						<td height="25" align="right" class="tables_contentcell" colspan="5">
							<jsp:include page="../../pager.jsp"></jsp:include>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>