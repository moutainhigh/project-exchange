<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml"><head><!-- by Arde -->
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>回复咨询信息</title>
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script language="javascript">
			<jsp:include page="../../msg.jsp"></jsp:include>
			$(function(){
				var year = '${chengxiao.year}';
				if(year != ''){
					$('#year').val(year);
				}
			});
		</script>
</head><body>

<form onsubmit="return Validator.Validate(this)" method="get" action="${appPath}zixun_reply.action" name="dataForm">
			<input type="hidden" value="${zixun.id}" name="zixun.id" id="">
			<c:if test="${not empty zixun.id}">
			<input type="hidden" value="${zixun.title}" name="zixun.title" id="">
			</c:if>
<table height="100%" width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
	<tbody>	<tr>
		<td height="30" align="right" class="tables_leftcell">
		标题
		</td>
		<td class="tables_contentcell">
		<input type="text" style="height: 22px;"  size="20" value="${zixun.title}" id="xm" name="zixun.title" disabled="disabled"/>
		<font size="4" color="#cc0033">*</font>
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">
		姓名
		</td>
		<td class="tables_contentcell">
		<input type="text" style="height: 22px;"  size="20" value="${zixun.name }" id="nl" name="zixun.name" disabled="disabled"/>
		</td>
		
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">
		咨询内容
		</td>
		<td class="tables_contentcell">
		<textarea name="zixun.content" rows="6" cols="20">${zixun.content}</textarea>
		</td>
	</tr>
	<tr>
		<td height="30" align="right" class="tables_leftcell">
		回复内容
		</td>
		<td class="tables_contentcell">
		<textarea id="reply" name="zixun.reply" rows="6" cols="50" msg="回复内容不能为空！" datatype="Require">${zixun.reply}</textarea>
		<font size="4" color="#cc0033">*</font>
		</td>
	</tr>   
	<tr>
	<td height="30" align="center" class="tables_contentcell" colspan="2">
	<input type="submit" value="确认" class="button" name="确认">
	<input type="button" onclick="self.close();" class="button" value="取消" name="取消">
	</td>
	</tr>  
</tbody></table>
</form>
</body></html>