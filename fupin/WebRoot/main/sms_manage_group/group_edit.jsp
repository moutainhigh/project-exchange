<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>编辑通讯组信息</title>
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script>
			<jsp:include page="../../msg.jsp"></jsp:include>
			<c:if test="${empty group.id}">
			$(function(){
				$.getJSON("${appPath}ajax/getAllGroupOfUser?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#groupId').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++)
						$('#groupId').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['showTreeName']+'</option>');
					}
				});
			});
			
			</c:if>
			
			
		</script>
	</head>
	<body>
		<form method="get" onsubmit="return Validator.Validate(this);" action="${appPath}group_saveGroup.action" name="">
			<input type="hidden" value="${group.id}" name="group.id" id="">
			<table height="100%" width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<c:if test="${empty group.id}">
					
					<tr>
						<td height="30" align="right" class="tables_leftcell">
						上级组
						</td>
						<td class="tables_contentcell">
							<select id="groupId" name="groupId" ></select>
							&nbsp;&nbsp;
						
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					</c:if>
					<c:if test="${not empty group.id}">
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							上级组
						</td>
						<td class="tables_contentcell">
						<c:if test="${not empty group.parentGroup}">
							${group.parentGroup.groupName }
						</c:if>
						<c:if test="${ empty group.parentGroup}">
							无
						</c:if>
						</td>
					</tr>
					</c:if>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							组名称
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" msg="组名称不能为空！" datatype="Require" size="20" value="${ group.groupName}" id="username" name="group.groupName">
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td align="center" class="tables_contentcell" colspan="4">
							<input type="submit" value="确认" class="button" name="确认">
							<input type="button" onclick="self.close();" class="button" value="取消" name="取消">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>