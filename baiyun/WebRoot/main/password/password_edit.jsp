<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>密码修改</title>
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script>
			<jsp:include page="../../msg.jsp"></jsp:include>
			function submitForm(){
				var oldpassword = $('#oldpassword').val();
				var newpassword = $('#newpassword').val();
				var renewpassword = $('#renewpassword').val();
				if(oldpassword=='' || newpassword=='' || renewpassword==''){
					alert('请输入每一项密码');
				}else if(newpassword!=renewpassword){
					alert('两次新密码输入不一致');
				}else{
					$('form:first').submit();
				}
			}
		</script>
	</head>
	<body>
		<form method="post" action="${appPath}user_changePwd.action" name="">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							帐号登录名
						</td>
						<td class="tables_contentcell">
							<input type="text" style="height: 22px;" size="20" value="${userObj.loginName }" id="username" disabled="disabled">
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							旧密码
						</td>
						<td class="tables_contentcell">
							<input type="password" style="height: 22px;" size="20" value="" id="oldpassword" name="oldpassword">
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							新密码
						</td>
						<td class="tables_contentcell">
							<input type="password" style="height: 22px;" size="20" value="" id="newpassword" name="newpassword">
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" class="tables_leftcell">
							确认密码
						</td>
						<td class="tables_contentcell">
							<input type="password" style="height: 22px;" size="20" value="" id="renewpassword" name="renewpassword">
							<font size="4" color="#cc0033">*</font>
						</td>
					</tr>
					<tr>
						<td align="center" class="tables_contentcell" colspan="4">
							<input type="button" value="确认" class="button" name="确认" onclick="submitForm();">
							<input type="button" onclick="self.close();" class="button" value="取消" name="取消">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>