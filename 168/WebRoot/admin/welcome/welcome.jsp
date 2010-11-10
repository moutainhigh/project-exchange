<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>模板网页</title>
        <link href="${appPath}/admin/css/common.css" rel="stylesheet" type="text/css" />
		<style>
		</style>
		<script src="${appPath}/js/jquery.js"></script>
		<script>
			$(function(){
				$.getJSON("${appPath}/ajax/getUserCount", function(json){
					//alert("JSON Data: " + json.users[3].name);
					//alert(json['userSum']);
					$('#user_sum').html(json['userSum']);
				}); 
			});
		</script>
    </head>
    <body>
        <div id="wrapper">
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="border:#c8c8e7 1px solid; border-top:0; margin-top:5px;">
			  <tr>
			    <td height="26" colspan="2" align="left" background="../images/msg_bg.jpg">
				&nbsp;&nbsp;<img src="${appPath}/admin/images/ico1.gif" border="0" align="absmiddle" /> <strong>系统信息</strong> </td>
			  </tr>
			  <tr>
			    <td width="18%" height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">系统版本：</td>
			    <td width="82%" align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;${appTitle} V1.0dv</td>
			  </tr>
			  <tr style="background-color:#F7F8FA">
			    <td height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">系统启用日期：</td>
			    <td align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">&nbsp;2010年10月13日</td>
			  </tr>
			  <tr>
			    <td height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">系统用户数量：</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;<span id="user_sum"></span></td>
			  </tr>
			  <tr>
			    <td height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">运行状况：</td>
			    <td align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">&nbsp;良好</td>
			  </tr>
			  <tr>
			    
			  </tr>
			</table>
        </div>
    </body>
</html>
