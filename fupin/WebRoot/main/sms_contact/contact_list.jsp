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
		
		
			$(function(){
				$.getJSON("${appPath}ajax/getAllGroupOfUser?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#groupId').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++)
						$('#groupId').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['showTreeName']+'</option>');
					}
				});
			});
			
			
		
		
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
				document.forms[0].action = '${appPath}contact_deleteContact.action';
				document.forms[0].submit();
			}
		}
		</script>
	</head>
	<body>
		<form method="get" action="${appPath}contact_queryContact.action" name="searchForm">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
				<tbody>
					<tr>
						 <td width="43%" align="left">
							您当前所处页面：通讯录维护 
						 </td>
						
					</tr>
					<tr>
						 <td align="left"  colspan="2">
					 	    <label>模糊查询: </label>
							<label>所属组: </label>
							<select id="groupId" name="contact.group.id" ></select>
							
							<label>单位: </label>
							<input name="contact.orgName" value="${contact.orgName}" type="text"/>
							<label>姓名: </label>
							<input name="contact.contactName" value="${contact.contactName}" type="text"/>
							<label>职务: </label>
							<input name="contact.duty" value="${contact.duty}" type="text"/>
							<input type="submit" class="button" value="查询"> 
							<input type="button" onclick="winOpen('${appPath}main/sms_contact/contact_edit.jsp',450,220);" class="button" value="新增">
							<input type="button" onclick="deleteInfo();" class="button" value="删除">
						 </td>
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
							单位名称
						</td>
						<td width="" class="tables_headercell">
							所属组
						</td>
							<td width="" class="tables_headercell">
							职务
						</td>
							<td width="" class="tables_headercell">
							姓名
						</td>
						
						<td width="" class="tables_headercell">
							手机号码
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
								&nbsp; ${f.orgName}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.group.groupName}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.duty}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.contactName}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.telNo}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								<a href="#" onclick="winOpen('${appPath}contact_saveContact.action?contact.id=${f.id}',450,220);">修改</a>
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