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
							您当前所处页面：项目管理  >> 村项目管理
						</td>
						<td align="right">
							<input type="button" onclick="winOpen('${appPath}main/project/cun_project_edit.jsp',450,400);" class="button" value="新增">
							<input type="button" class="button" value="删除"/>
							<input type="button" class="button" value="修改"/>
							<!--  <input type="button" class="button" value="导出excel"/>--> 
						</td>
						<td width="5px"></td>
					</tr>
				</tbody>
			</table>
			<c:if test="${userObj.isDiv=='Y'}">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr align="center">
						<td height="28" width="" class="tables_headercell" rowspan="2">
							<input type="checkbox" onclick="checkAll(this);">
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							序号
						</td>
						<td width="" class="tables_headercell" colspan="2">
							对口帮扶单位
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							项目名称
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							建设规模及内容
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							完成时限
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							帮扶资金（万元）
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							帮扶单位
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							挂村区领导
						</td>
						<td width="" class="tables_headercell" colspan="2">
							挂村区领导联络员
						</td>
					</tr>
					<tr>
						<td width="" class="tables_headercell">
							所属镇
						</td>
						<td width="" class="tables_headercell">
							村名
						</td>
						<td width="" class="tables_headercell">
							姓名
						</td>
						<td width="" class="tables_headercell">
							电话
						</td>
					</tr>
						<tr>
							<td height="25" align="center" class="tables_contentcell">
								<input type="checkbox" value="${f.id}" name="ids">
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 
							</td>
						</tr>
					<tr>
						<td height="25" align="right" class="tables_contentcell" colspan="12">
							<jsp:include page="../../pager.jsp"></jsp:include>
						</td>
					</tr>
				</tbody>
			</table>
			</c:if>
		</form>
	</body>
</html>