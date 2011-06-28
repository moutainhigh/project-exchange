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
			<c:if test="${empty contact.id}">
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
		<form method="get" onsubmit="return Validator.Validate(this);" action="${appPath}contact_saveContact.action" name="">
			<input type="hidden" value="${contact.id}" name="contact.id" id="contactId">
			<table height="100%" width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<c:if test="${empty contact.id}">
					
					<tr>
						<td height="30" align="right" class="tables_leftcell">
						所属组
						</td>
						<td class="tables_contentcell">
							<select id="groupId" name="contact.group.id" msg="所属组不能为空！" datatype="Require"></select>
							&nbsp;&nbsp;
						
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					</c:if>
					<c:if test="${not empty contact.id}">
					<input type="hidden" value="${contact.group.id}" name="contact.group.id" id="contactGroupId">
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							所属组
						</td>
						<td class="tables_contentcell">
						<c:if test="${not empty contact.group}">
							${contact.group.groupName }
						</c:if>
						<c:if test="${ empty contact.group}">
							无
						</c:if>
						</td>
					</tr>
					</c:if>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							单位名称
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" msg="单位名称不能为空！" datatype="Require" size="20" value="${ contact.orgName}" id="orgName" name="contact.orgName">
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					
					
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							联系人姓名
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" msg="联系人姓名不能为空！" datatype="Require" size="20" value="${ contact.contactName}" id="contactName" name="contact.contactName">
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							职务
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" msg="职务名称不能为空！" datatype="Require" size="20" value="${ contact.duty}" id="duty" name="contact.duty">
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							手机号码
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" msg="手机号码不能为空,且需符合号码规则" datatype="Mobile" size="20" value="${ contact.telNo}" id="telNo" name="contact.telNo">
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