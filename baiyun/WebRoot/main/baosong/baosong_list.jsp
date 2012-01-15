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
				document.forms[0].action = '${appPath}baosong_deleteBaoSong.action';
				document.forms[0].submit();
			}
		}
		function queryBaoSong(){
			$('form').attr("action","${appPath}baosong_baoSongList.action");
			$('form').submit();
		}
		var status = "${param['status']}";
		$(function(){
			if(status != ''){
				setTimeout(function(){
					$("#baosongStatus").val(status);
				},1);
			}
		});
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
		<form method="get" action="${appPath}baosong_baoSongList.action" name="searchForm">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
				<tbody>
					<tr>
						<td>
							您当前所处页面：信息报送
						</td>
						<td align="right">
							<c:if test="${userObj.roleType=='镇级管理员' || userObj.roleType=='帮扶单位管理员' || userObj.roleType=='县级管理员'}">
							<select name="status" onchange="queryBaoSong();" id="baosongStatus">
								<option value="">全部</option>
								<option value="待办">待办</option>
								<option value="已办">已办</option>
							</select>
							<input type="button" onclick="winOpen('${appPath}main/baosong/baosong_edit.jsp',500,500);" class="button" value="新增">
							<input type="button" class="button" value="删除" onclick="deleteInfo();">
							</c:if>  
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
						</td>
						<td width="" class="tables_headercell">
							编号
						</td>
						<td width="" class="tables_headercell">
							报送单位
						</td>
						<td width="" class="tables_headercell">
							标题
						</td>
						<td width="" class="tables_headercell">
							报送时间
						</td>
						<td width="" class="tables_headercell">
							状态
							<c:if test="${(userObj.roleType=='超级管理员')}">
							(1,org待办; 2,org已办/area待办, 3,area已发送给sa的, 4,退回给发送单位的)
							</c:if>
						</td>
						<td width="" class="tables_headercell">
							操作
						</td>
					</tr>
					<c:forEach items="${pageBean.resultList}" var="f">
						<tr>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp;
								<c:if test="${f.status==1}">
								<input type="checkbox" value="${f.id}" name="ids">
								</c:if>&nbsp;
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.id}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.user.orgName}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.title }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 
								<fmt:formatDate value="${f.date}" pattern="yyyy-MM-dd"/>
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 
								<c:if test="${(userObj.roleType=='镇级管理员' || userObj.roleType=='帮扶单位管理员') && f.status==1}">待办</c:if>
								<c:if test="${(userObj.roleType=='镇级管理员' || userObj.roleType=='帮扶单位管理员') && f.status==2}">已办</c:if>
								<c:if test="${(userObj.roleType=='镇级管理员' || userObj.roleType=='帮扶单位管理员') && f.status==4}">待办</c:if>
								<c:if test="${(userObj.roleType=='县级管理员') && f.status==2}">待办</c:if>
								<c:if test="${(userObj.roleType=='县级管理员') && f.status==3}">已办</c:if>
								<c:if test="${(userObj.roleType=='超级管理员')}">
								${f.status }
								</c:if>
							</td>
							<td height="25" align="center" class="tables_contentcell">
								<a href="#" onclick="winOpen('${appPath}baosong_viewBaoSong.action?baoSong.id=${f.id}',750,650);">查看</a>
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