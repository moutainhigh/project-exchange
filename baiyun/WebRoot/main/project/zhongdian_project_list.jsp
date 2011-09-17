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
				document.forms[0].action = '${appPath}pro_deleteZdProjects.action';
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
		<form method="get" action="${appPath}manager_managerMappingList.action" name="searchForm">
			<input type="hidden" name="del" id="del" value="">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
				<tbody>
					<tr>
						<td>
							您当前所处页面：项目管理  >> 重点帮扶钟落潭镇项目
						</td>
						<td align="right">
							<c:if test="${userObj.roleType!='帮扶单位管理员'}">
							<input type="button" onclick="winOpen('${appPath}pro_editZdPro.action',700,400);" class="button" value="新增">
							<input type="button" class="button" value="删除" onclick="deleteInfo();"/>
							</c:if>
							<!--  <input type="button" class="button" value="导出excel"/>--> 
						</td>
						<td width="5px"></td>
					</tr>
				</tbody>
			</table>
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr align="center">
						<td height="28" width="" class="tables_headercell" rowspan="2">
							<input type="checkbox" onclick="checkAll(this);">
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							序号
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							项目名称
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							建设规模及内容
						</td>
						<td width="" class="tables_headercell" rowspan="2" colspan="2">
							具体实施时间节点（立项、报建、实施等环节）
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							总投资（万元）
						</td>
						<td width="" class="tables_headercell" colspan="3">
							帮扶资金安排
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							帮扶单位
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							操作
						</td>
					</tr>
					<tr>
						<td width="" class="tables_headercell">
							数量（万元）
						</td>
						<td width="" class="tables_headercell">
							来源
						</td>
						<td width="" class="tables_headercell">
							数量（万元）
						</td>
					</tr>
					<c:forEach items="${pageBean.resultList}" var="f" varStatus="status">
						<tr>
							<td height="25" align="center" class="tables_contentcell" rowspan="4">
								<input type="checkbox" value="${f.id}" name="ids">
							</td>
							<td height="25" align="center" class="tables_contentcell" rowspan="4">
								${status.count}
							</td>
							<td height="25" align="center" class="tables_contentcell" rowspan="4">
								&nbsp; ${f.name }
							</td>
							<td height="25" align="center" class="tables_contentcell" rowspan="4">
								&nbsp; ${f.content }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								立项
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.lixiang }
							</td>
							<td height="25" align="center" class="tables_contentcell" rowspan="4">
								&nbsp; ${f.money }
							</td>
							<td height="25" align="center" class="tables_contentcell" rowspan="4">
								&nbsp; ${f.amount }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								市财政
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.moneyShi }
							</td>
							<td height="25" align="center" class="tables_contentcell" rowspan="4">
								&nbsp; ${f.org.orgName }
							</td>
							<td height="25" align="center" class="tables_contentcell" rowspan="4">
								&nbsp;
								<c:if test="${userObj.roleType!='帮扶单位管理员'}">
								<a href="#" onclick="winOpen('${appPath}pro_editZdPro.action?proZd.id=${f.id }',700,400);" >修改</a>
								</c:if>
							</td>
						</tr>
						<tr>
							<td height="25" align="center" class="tables_contentcell">
								报建
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.baojian }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								区财政
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.moneyQu }
							</td>
						</tr>
						<tr>
							<td height="25" align="center" class="tables_contentcell" rowspan="2">
								实施
							</td>
							<td height="25" align="center" class="tables_contentcell" rowspan="2">
								&nbsp; ${f.shishi }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								镇街财政
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.moneyZhen }
							</td>
						</tr>
						<tr>
							<td height="25" align="center" class="tables_contentcell">
								社会资金
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.moneyShehui }
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