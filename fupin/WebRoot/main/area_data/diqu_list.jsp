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
		function deleteInfo(){
			if(confirm('您确定删除吗？') && $('input:checked').length>0){
				document.forms[0].action = '${appPath}diqu_deleteDiqu.action';
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
		<form method="get" action="${appPath}diqu_diquList.action" name="searchForm">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
				<tbody>
					<tr>
						<td>
							您当前所处页面：基础数据维护 >> 市级帐号管理
						</td>
						<td align="right">
							<label>地区类型: </label>
							<select name="type" size="1">
								<option value=""></option>
								<option value="Shi" <c:if test="${param.type=='Shi'}">selected="selected"</c:if>>市</option>
								<option value="Area" <c:if test="${param.type=='Area'}">selected="selected"</c:if>>区县</option>
								<option value="Zhen" <c:if test="${param.type=='Zhen'}">selected="selected"</c:if>>镇</option>
								<option value="Cun" <c:if test="${param.type=='Cun'}">selected="selected"</c:if>>村</option>
							</select>
						
							<label>地区名称（模糊查询）: </label>
							<input name="queryKey" value="${param.queryKey}" type="text"/>
						
							<input type="submit" class="button" value="查询"> 
							<input type="button" onclick="winOpen('${appPath}main/area_data/diqu_edit.jsp',450,180);" class="button" value="新增">
							<input type="button" onclick="deleteInfo();" class="button" value="删除">
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
						<td width="" class="tables_headercell">
							名称
						</td>
						<td width="" class="tables_headercell">
							类型
						</td>
						<td width="" class="tables_headercell">
							所属市
						</td>
						<td width="" class="tables_headercell">
							所属区县
						</td>
						<td width="" class="tables_headercell">
							所属镇
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
								&nbsp; ${f.name}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.type}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 
								<c:if test="${f.type=='村'}">${f.zhen.area.shi.name}</c:if>
								<c:if test="${f.type=='镇'}">${f.area.shi.name}</c:if>
								<c:if test="${f.type=='区县'}">${f.shi.name}</c:if>
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 
								<c:if test="${f.type=='村'}">${f.zhen.area.name}</c:if>
								<c:if test="${f.type=='镇'}">${f.area.name}</c:if>
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 
								<c:if test="${f.type=='村'}">${f.zhen.name}</c:if>
							</td>
							<td height="25" align="center" class="tables_contentcell">
								<a href="#" onclick="winOpen('${appPath}diqu_saveDiqu.action?diqu.id=${f.id}',450,220);">修改</a>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td height="25" align="right" class="tables_contentcell" colspan="7">
							<jsp:include page="../../pager.jsp"></jsp:include>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>