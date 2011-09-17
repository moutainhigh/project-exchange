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
		<form method="get" action="${appPath}zhen_bf_zhenBFList.action" name="searchForm">
			<input type="hidden" name="del" id="del" value="">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
				<tbody>
					<tr>
						<td>
							您当前所处页面：基础数据维护 >> 指定镇帮扶
						</td>
						<td align="right">
							<label>所属区县: </label>
							<select name="areaId" size="1">
								<option value=""></option>
								<c:forEach items="${zhenBFBiz.allArea}" var="f">
								<option value="${f.id}" <c:if test="${param.areaId==f.id}">selected="selected"</c:if>>${f.name}</option>
								</c:forEach>
							</select>
							<input type="submit" class="button" value="查询"> 
						</td>
						<td width="5px"></td>
					</tr>
				</tbody>
			</table>
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr align="center">
						<td height="28" width="6%" class="tables_headercell">
							<input type="checkbox" onclick="checkAll(this);">
						<td width="40%" class="tables_headercell">
							镇名称
						</td>
						<td width="20%" class="tables_headercell">
							帮扶单位
						</td>
						<td width="14%" class="tables_headercell">
							操作
						</td>
					</tr>
					<c:forEach items="${pageBean.resultList}" var="f">
						<tr>
							<td height="25" align="center" class="tables_contentcell">
								<input type="checkbox" value="${f.id}" name="ids">
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.name}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 
								<c:if test="${not empty f.shiWorkOrg}">${f.shiWorkOrg.orgName}(${f.shiWorkOrg.loginName})</c:if>
								<c:if test="${not empty f.areaWorkOrg}">${f.areaWorkOrg.orgName}(${f.areaWorkOrg.loginName})</c:if>
							</td>
							<td height="25" align="center" class="tables_contentcell">
								<a href="#" onclick="winOpen('${appPath}zhen_bf_viewZhenOrgMapping.action?zhen.id=${f.id}',450,120);">新增/修改帮扶单位</a>
								<c:if test="${not empty f.shiWorkOrg || not empty f.areaWorkOrg}">
								<br/><a href="${appPath}zhen_bf_cancelZhenOrgMapping.action?zhen.id=${f.id}">取消帮扶</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td height="25" align="right" class="tables_contentcell" colspan="5">
							<jsp:include page="../../pager.jsp"></jsp:include>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>