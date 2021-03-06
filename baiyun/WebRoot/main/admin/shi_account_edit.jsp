<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>编辑市级扶贫办帐号</title>
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script>
			<jsp:include page="../../msg.jsp"></jsp:include>
			var currShi = '${shiWorkOrg.shi.id}';
			$(function(){
				$.getJSON("${appPath}ajax/getAllShi?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#shi').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++)
							$('#shi').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>');
						if(currShi != '')
							setTimeout(function(){
								$('#shi').val(currShi);
							},1);
							
					}
				});
			});
		</script>
	</head>
	<body>
		<form method="get" onsubmit="return Validator.Validate(this);" action="${appPath}admin_saveOrUpdateShiWorkOrg.action" name="">
			<input type="hidden" value="${shiWorkOrg.id}" name="shiWorkOrg.id" id="">
			<c:if test="${not empty shiWorkOrg.id}">
			<input type="hidden" value="${shiWorkOrg.loginName}" name="shiWorkOrg.loginName" id="">
			</c:if>
			<table height="100%" width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
						所属市
						</td>
						<td class="tables_contentcell">
							<select id="shi" name="shiWorkOrg.shi.id" size="1" msg="必须选择一个市！" datatype="Require"></select>
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							帐号登录名
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" msg="用户名不能为空！" datatype="Require" size="20" value="${ shiWorkOrg.loginName}" id="username" name="shiWorkOrg.loginName" <c:if test="${not empty shiWorkOrg.id}"> disabled="disabled"</c:if>>
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							密码
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" msg="密码不能为空！" datatype="Require" size="20" value="${shiWorkOrg.password}" id="password" name="shiWorkOrg.password">
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							说明：
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" require="false" size="20" value="${shiWorkOrg.remark }" id="bz" name="shiWorkOrg.remark">
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