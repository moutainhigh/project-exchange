<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>编辑单位管理员帐号</title>
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script>
			<jsp:include page="../../msg.jsp"></jsp:include>
			var areaId = '${org.area.id}';
			var isDiv = '${userObj.isDiv}';
			<c:if test="${userObj.isDiv=='Y'}">
			if(isDiv == 'Y')
				areaId = '${userObj.area.id}';
			</c:if>
			$(function(){
				$.getJSON("${appPath}ajax/getAllArea?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#areaId').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++)
							$('#areaId').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>');
						if(areaId != ''){
							//解决ie6下的bug
							setTimeout(function(){ 
							    $("#areaId").val(areaId); 
							    if(isDiv == 'Y'){
							    	$("#areaId").attr('disabled',true);
							    }
							},1);
						}
					}
				});
			});
			
		</script>
	</head>
	<body>
		<form method="get" onsubmit="return Validator.Validate(this);" action="${appPath}manager_saveManager.action" name="">
			<input type="hidden" value="${org.id}" name="org.id" id="">
			<c:if test="${not empty org.id}">
			<input type="hidden" value="${org.loginName}" name="org.loginName" id="">
			</c:if>
			<c:if test="${userObj.isDiv=='Y'}">
			<input type="hidden" value="${userObj.area.id}" name="org.area.id" id="">
			</c:if>
			<table height="100%" width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							帐号登录名
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" msg="用户名不能为空！" datatype="Require" size="20" value="${ org.loginName}" id="username" name="org.loginName" <c:if test="${not empty org.id}"> disabled="disabled"</c:if>>
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							单位名称
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" msg="单位名称不能为空！" datatype="Require" size="20" value="${ org.orgName}" id="orgName" name="org.orgName">
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							密码
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" msg="密码不能为空！" datatype="Require" size="20" value="${org.password}" id="password" name="org.password">
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							若为直属单位，请选择直属区县：
						</td>
						<td class="tables_contentcell">
							<select id="areaId" name="org.area.id"></select>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							说明：
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" require="false" size="20" value="${org.remark }" id="bz" name="org.remark">
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