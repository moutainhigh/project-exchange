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
function preview(isCheck)
{
	var fileext = document.upload.uploadFile.value.substring(document.upload.uploadFile.value.lastIndexOf("."),document.upload.uploadFile.value.length)
	
	fileext = fileext.toLowerCase()
	
	
	if (c(document.upload.uploadFile))
	{
		document.getElementById("preview").innerHTML="预览：&lt;br /&gt;&lt;center&gt;&lt;img src='"+document.upload.uploadFile.value+"' height=240 style='border:6px double #ccc'&gt;&lt;/center&gt;";
	}
	else
	{
		document.getElementById("span1").innerHTML="&lt;input type=\"file\" name=\"uploadFile\" onchange=\"preview();\" class=\"fileButton\" /&gt;";
		document.getElementById("preview").innerHTML="";
		document.upload.uploadFile.focus();
	}
}
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

<form onsubmit="return Validator.Validate(this)" method="post" enctype="multipart/form-data" action="addPicController.jsp?s=857E306980D99623A23F1A798FF934D77EA02F19FD443D35C54FE956C315372B" name="upload">
<input type="hidden" value="16483" name="village_id">
<table height="100%" width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
<tbody><tr><td height="30" align="right" class="tables_headercell">
	<input type="button" onclick="self.close();" class="ewButton" value="关闭" name="关闭">
</td></tr>
<tr>
	<td height="30" class="tables_headercell">
		图片类型
		<select class="ewButton" name="pic.type">
		<option value="1">帮扶前</option>
		<option value="2">帮扶后</option>
		</select>
		年度
		<select class="ewButton" name="pic.year">
		
			<option value="2011">2011</option>
		
			<option value="2010">2010</option>
		
			<option value="2009">2009</option>
		
		</select><br><br>
		<iframe src="${appPath}upload/upload.jsp" width="100%" height="100%" frameborder="0"></iframe>
		<font color="#cc0033" style="font-weight: normal;">*请选择格式为JPG且大小不超过1.5MB的图片</font>
	</td>
</tr>
<tr>
	<td height="300" class="tables_leftcell">&nbsp;
		<div id="preview"></div>
	</td>
</tr>
<tr>
	<td height="120" class="tables_contentcell">图片注解(最多50字)<font color="#cc0033">*</font><br>
	<textarea msg="图片注释不能为空" datatype="Require" name="pic.remark" rows="4" cols="45"></textarea>
	</td>
</tr>
</tbody></table>
</form>
</body></html>