<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>编辑干部资料</title>
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script>
			<jsp:include page="../../msg.jsp"></jsp:include>
			$(function(){
			});
		</script>
	</head>
	<body>
		<form method="get" onsubmit="return Validator.Validate(this);" action="${appPath}mes_sendMessage.action" name="">
			<input type="hidden" value="${message.id}" name="message.id" id="">
			
			<table height="100%" cellspacing="0" cellpadding="0" border="0" width="100%" class="tables_table">
	<tbody><tr>
		<td height="30" align="right" class="tables_leftcell">
		标题
		</td>
		<td class="tables_contentcell">
		<input id="title" type="text" name="message.title" value="${message.title }" size="50" msg="标题不能为空！" datatype="Require" />
<font size="4" color="#cc0033">*</font>
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">
		收信人
		</td>
		<td class="tables_contentcell">
		<input id="title" type="text" name="message.recieverString" value="${message.title }" size="50" msg="标题不能为空！" datatype="Require" />
		<font size="2" color="#cc0033">*(收信人之间用+号隔开)</font>
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">
		内容
		</td>
		<td class="tables_contentcell">
		<textarea id="content" name="message.content" value="${message.content }" rows="6" cols="50" msg="内容不能为空！" datatype="Require">${message.content}</textarea>
		<font size="4" color="#cc0033">*</font>
		</td>
	</tr>
	<tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">
		附件
		</td>
		<td class="tables_contentcell" height="200">
		<font color="#cc0033" style="font-weight: normal;">请选择不超过5M的附件</font>
		<iframe src="${appPath}uploadAttach/upload.jsp" width="100%" height="100%" frameborder="0"></iframe>
		
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
	</body>
</html>