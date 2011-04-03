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
<title>图片上传管理</title>
<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
<script>
			<jsp:include page="../../msg.jsp"></jsp:include>
			$(function(){
				var year = '${pic.year}';
				if(year != ''){
					$('#year').val(year);
				}
			});
</script>
<style type="text/css">
.fileButton {
	BORDER-RIGHT: #98bbd7 1px solid;
	BORDER-TOP: #98bbd7 1px solid;
	BACKGROUND: #eff6fb;
	BORDER-LEFT: #98bbd7 1px solid;
	BORDER-BOTTOM: #98bbd7 1px solid;
	width:280px;
}
</style>
</head><body class="tables_leftcell">

<form onsubmit="return Validator.Validate(this)" method="post" enctype="multipart/form-data" action="${appPath}family_bf_saveOrUpdatePicFamily.action" name="upload">
<input type="hidden" value="16483" name="village_id">
<table height="100%" width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
<tbody><tr><td height="30" align="right" class="tables_headercell">
	<input type="submit" value="确认" class="ewButton" name="确认" >
	<input type="button" onclick="self.close();" class="ewButton" value="关闭" name="关闭">
</td></tr>
<tr>
	<td height="30" class="tables_headercell" style="height:100%;">
		图片类型
		<select class="ewButton" name="pic.type">
		<option value="帮扶前" <c:if test="${pic.type=='帮扶前'}">selected="selected"</c:if>>帮扶前</option>
		<option value="帮扶后" <c:if test="${pic.type=='帮扶后'}">selected="selected"</c:if>>帮扶后</option>
		</select>
		年度
		<select class="ewButton" name="pic.year" id="year">
			<%
			int year = new GregorianCalendar().get(GregorianCalendar.YEAR);
			for(int i=year;i<year+2;i++){
			%>
			<option value="<%=i%>"><%=i%></option>
			<%	
			}
			%>
		
		<option value="2">2年</option>
		</select><br><br>
		<iframe src="${appPath}upload/upload.jsp" width="100%" height="100%" frameborder="0"></iframe>
		<font color="#cc0033" style="font-weight: normal;">*请选择格式为JPG且大小不超过1.5MB的图片</font>
	</td>
</tr>
<tr>
	<td height="120" class="tables_contentcell">图片注解(最多50字)<font color="#cc0033">*</font><br>
	<textarea msg="图片注释不能为空" datatype="Require" name="pic.remark" rows="4" cols="45">${pic.remark}</textarea>
	</td>
</tr>
</tbody></table>
</form>
</body></html>