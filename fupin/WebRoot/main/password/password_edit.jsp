<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html xmlns="http://www.w3.org/1999/xhtml"><head>


<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>增加市级扶贫办帐号</title>
<link href="main_data/manage.css" rel="stylesheet">
<script src="../../js/jquery.js" language="javascript"></script>
<script src="../../js/sel_style.js" language="javascript"></script>
<script src="../../js/common.js" language="javascript"></script>
<script>

</script>

</head><body>
<jsp:include page="../../msg.jsp"></jsp:include>
<form  method="post" action="${appPath}user_changePwd.action" name="">

	<input type="hidden" value="${shiWorkOrg.id}" name="shiWorkOrg.id" id="">
	<table height="100%" width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
	<tbody>
	
	
	<tr>
		<td height="30" align="right" class="tables_leftcell">
		帐号登录名
		</td>
		<td class="tables_contentcell">
		<input type="text"  style="height: 22px;"   size="20" value="${userObj.loginName }" id="username" name="shiWorkOrg.loginName" disabled="disabled">
		<font size="4" color="#cc0033">*</font>
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">
		旧密码
		</td>
		<td class="tables_contentcell">
		<input type="text" style="height: 22px;"  size="20" value="" id="password" name="oldpassword">
		<font size="4" color="#cc0033">*</font>
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">
		新密码
		</td>
		<td class="tables_contentcell">
		<input type="text" style="height: 22px;"  size="20" value="" id="password" name="newpassword">
		<font size="4" color="#cc0033">*</font>
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">
		确认密码
		</td>
		<td class="tables_contentcell">
		<input type="text" style="height: 22px;"  size="20" value="" id="password" name="renewpassword">
		<font size="4" color="#cc0033">*</font>
		</td>
	</tr>
	
	<tr>
		<td align="center" class="tables_contentcell" colspan="4">
		<input type="submit" value="确认" class="button" name="确认">
		<input type="button" onclick="self.close();" class="button" value="取消" name="取消">
		</td>
	</tr>
	</tbody></table>
</form>
</body></html>