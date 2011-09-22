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
		<form method="get" action="${appPath}family_bf_familyMappingList.action" name="searchForm">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
				<tbody>
					<tr>
						<td>
							您当前所处页面：户帮扶维护 >> 规划到户
						</td>
						<td align="right">
							<label>贫困户名（模糊查询）: </label>
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
							编号
						</td>
						<td width="" class="tables_headercell">
							贫困户名称
						</td>
						<td width="" class="tables_headercell">
							类型
						</td>
						<td width="" class="tables_headercell">
							性别
						</td>
						<td width="" class="tables_headercell">
							帮扶干部
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
								&nbsp; ${f.id}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 
								<a href="#" style="color:red" onclick="winOpen('${appPath}family_viewFamily.action?family.id=${f.id}',800,700);">${f.name}</a>
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 
								${f.type }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 
								${f.gender }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 
								${f.leaderNames }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								<a href="#" onclick="winOpen('${appPath}family_bf_editFamilyMapping.action?family.id=${f.id}',550,600);">修改帮扶方式</a>
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
			</c:if>
			<c:if test="${userObj.isDiv=='Y'}">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr align="center">
						<td height="28" width="" class="tables_headercell" rowspan="3">
							序号
						</td>
						<td width="" class="tables_headercell" colspan="6">
							结对帮扶对象
						</td>
						<td width="" class="tables_headercell" colspan="6">
							结对帮扶单位帮扶干部及联系人
						</td>
						<td width="" class="tables_headercell" rowspan="3">
							操作
						</td>
					</tr>
					<tr align="center">
						<td class="tables_headercell" colspan="2">
							对接村
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							户主姓名
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							家庭人数
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							劳动力人数
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							联系电话（手机）
						</td>
						<td width="" class="tables_headercell" colspan="4">
							结对帮扶干部
						</td>
						<td width="" class="tables_headercell" colspan="2">
							分管领导（联系人）
						</td>
					</tr>
					<tr align="center">
						<td class="tables_headercell">
							所属镇
						</td>
						<td width="" class="tables_headercell">
							村名
						</td>
						<td width="" class="tables_headercell">
							工作单位
						</td>
						<td width="" class="tables_headercell">
							姓名
						</td>
						<td width="" class="tables_headercell">
							联系电话（手机）
						</td>
						<td width="" class="tables_headercell">
							结对起始时间
						</td>
						<td width="" class="tables_headercell">
							姓名
						</td>
						<td width="" class="tables_headercell">
							分管领导（联系人）
						</td>
					</tr>
					<c:forEach items="${pageBean.resultList}" var="f">
					<tr>
						<td align="center" class="tables_contentcell">
							&nbsp;${f.id }
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;${f.cun.zhen.name }
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;${f.cun.name }
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;${f.name }
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;${f.personNum }
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;${f.segment4 }
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;${f.tel }
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;${f.cun.org.orgName }
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<c:if test="${not empty f.leaderList }">
							${f.leaderList[0].leaderName }
							</c:if>
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<c:if test="${not empty f.leaderList }">
							${f.leaderList[0].tel }
							</c:if>
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;${f.cun.org.segment1 }
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;${f.cun.org.segment2 }
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;${f.cun.org.segment3 }
						</td>
						<td align="center" class="tables_contentcell">
							&nbsp;
							<a href="#" onclick="winOpen('${appPath}family_bf_editFamilyMapping.action?family.id=${f.id}',550,600);">修改帮扶方式</a>
						</td>
					</tr>
					</c:forEach>
					<tr>
						<td height="25" align="right" class="tables_contentcell" colspan="14">
							<jsp:include page="../../pager.jsp"></jsp:include>
						</td>
					</tr>
				</tbody>
			</table>
			</c:if>
		</form>
	</body>
</html>