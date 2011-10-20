<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GBK" />
        <title></title>
		<script src="js/jquery.js"></script>
        <style type="text/css">    
	        html {
	            height: 100%;
	            overflow: hidden;
	            font: 12px/1.5 Tahoma,Helvetica,Arial,"宋体",sans-serif;
	        }
        </style>
    </head>
<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="${appPath}BaoSongAttatchUploadAction.action" enctype="multipart/form-data" >
  <table width="100%" border="0" cellspacing="0" cellpadding="5" align="center" bordercolordark="#CCCCCC" bordercolorlight="#000000">
    <tr>
    	<td colspan="2">文件：${param['fileName']}</td>
    </tr>
    <tr>
    	<td colspan="2">点<a href="${appPath}main/baosong/upload/upload.jsp">这里</a>,上传新附件</td>
    </tr>
	</table>
</form>
</body>
</html>


