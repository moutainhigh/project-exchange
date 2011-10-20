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
		<script>
        </script>
    </head>
<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="${appPath}BaoSongAttachUploadAction.action" enctype="multipart/form-data" >
  <table width="360" border="0" cellspacing="0" cellpadding="5" align="center" bordercolordark="#CCCCCC" bordercolorlight="#000000">
    <tr align="center" valign="middle"> 
      <td height="33" align="left" id="upid" colspan="2">请附件文件: 
        <input type="file" name="myfile" size="30" class="tx1" msg="请选择图片" datatype="Require" class="fileButton" value="" />
        <span style="color: gray;font-size: 12px;">(可以上传的附件类型包括.doc、.xls、.jpg、.rar,大小不能超过5Mb)</span>
      </td>
    </tr>
    <tr align="center" valign="middle"> 
      <td height="20" colspan="2">
      <input type="submit" value="上传"/>
      </td>
    </tr>
	</table>
</form>
</body>
</html>


