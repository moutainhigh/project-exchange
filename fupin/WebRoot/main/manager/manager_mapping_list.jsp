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
		<form method="get" action="${appPath}manager_managerMappingList.action" name="searchForm">
			<input type="hidden" name="del" id="del" value="">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
				<tbody>
					<tr>
						<td>
							您当前所处页面：帮扶单位管理 >> 单位的村帮扶指定
						</td>
						<td align="right">
							<label>村名称: </label>
							<input name="queryKey" value="${param.queryKey}" type="text"/>
							<input type="submit" class="button" value="查询"> 
						</td>
						<td width="5px"></td>
					</tr>
				</tbody>
			</table>
			<c:if test="${userObj.isDiv!='Y'}">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr align="center">
						<td height="28" width="" class="tables_headercell">
							<input type="checkbox" onclick="checkAll(this);">
						</td>
						<td width="" class="tables_headercell">
							镇名称
						</td>
						<td width="" class="tables_headercell">
							村名称
						</td>
						<td width="" class="tables_headercell">
							帮扶单位
						</td>
						<td width="" class="tables_headercell">
							操作
						</td>
					</tr>
					<c:forEach items="${pageBean.resultList}" var="f">
						<tr>
							<td height="25" align="center" class="tables_contentcell">
								<input type="checkbox" value="${f.id}" name="ids">
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.zhen.name}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.name}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 
								${f.org.orgName}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								<a href="#" onclick="winOpen('${appPath}manager_viewMapping.action?cun.id=${f.id}',450,120);">新增/修改帮扶单位</a>
								<c:if test="${not empty f.org}">
								<br/><a href="${appPath}manager_cancelMapping.action?cun.id=${f.id}">取消帮扶</a>
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
			</c:if>
			<c:if test="${userObj.isDiv=='Y'}">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr align="center">
						<td height="28" width="" class="tables_headercell" rowspan="3">
							序号
						</td>
						<td width="" class="tables_headercell" colspan="4" rowspan="2">
							对口帮扶对象
						</td>
						<td width="" class="tables_headercell" colspan="6">
							帮扶责任单位驻村干部及联系人
						</td>
					</tr>
					<tr align="center">
						<td height="28" width="" class="tables_headercell" colspan="4">
							驻村干部
						</td>
						<td width="" class="tables_headercell" colspan="2">
							分管领导（联系人）
						</td>
					</tr>
					<tr align="center">
						<td class="tables_headercell">
							驻所属镇
						</td>
						<td class="tables_headercell">
							村名
						</td>
						<td class="tables_headercell">
							村负责人
						</td>
						<td class="tables_headercell">
							联系电话（手机）
						</td>
						<td class="tables_headercell">
							工作单位
						</td>
						<td class="tables_headercell">
							姓名
						</td>
						<td class="tables_headercell">
							联系电话（手机）
						</td>
						<td class="tables_headercell">
							驻村起始时间
						</td>
						<td class="tables_headercell">
							姓名
						</td>
						<td class="tables_headercell">
							联系电话（手机）
						</td>
					</tr>
					<c:forEach items="${pageBean.resultList}" var="f">
					<tr>
						<td height="25" align="center" class="tables_contentcell">
							${f.id}
						</td>
						<td height="25" align="center" class="tables_contentcell">
							&nbsp; ${f.zhen.name}
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp; ${f.name}
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp; 
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp; 
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp; ${f.org.orgName }
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp; ${f.org.contactName }
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp; ${f.org.contactMobile }
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp; 
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp; 
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp; 
						</td>
					</tr>
					</c:forEach>
					<tr>
						<td height="25" align="right" class="tables_contentcell" colspan="15">
							<jsp:include page="../../pager.jsp"></jsp:include>
						</td>
					</tr>
				</tbody>
			</table>
			</c:if>
		</form>
	</body>
</html>