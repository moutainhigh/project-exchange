<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>模板网页</title>
        <link href="${appPath}/admin/css/common.css" rel="stylesheet" type="text/css" />
		<style>

		</style>
		<script>
			var msg = '${msg}';
			if(msg != ''){
				alert(msg);
			}
		</script>
    </head>
    <body>
    <form action="${appPath}/admin/editInfo" method="post">
    	<input type="hidden" value="${infoId}" name="info.id"/>
        <div id="wrapper">			
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="border:#c8c8e7 1px solid; border-top:0; margin-top:5px;">
			  <tr>
			    <td height="26" colspan="2" align="left" background="${appPath}/admin/images/msg_bg.jpg">
				&nbsp;&nbsp;<img src="${appPath}/admin/images/ico1.gif" border="0" align="absmiddle" /> <strong>信息修改</strong> </td>
			  </tr>
			  <tr>
			    <td width="10%" height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">发布者：</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;
			    <a href="${appPath}/admin/userInfoList?user.id=${info.user.id}">${info.user.loginName}(点击查看该用户发布的所有信息)</a>
			    </td>
			  </tr>
			  <tr>
			    <td width="10%" height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">标题：</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;
			    <input type="text" name="info.title" value="${info.title}"/></td>
			  </tr>
			  <tr style="background-color:#F7F8FA">
			    <td height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">内容：</td>
			    <td align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">&nbsp;
			    <textarea rows="8" cols="65" id="content" name="info.content">${info.content}</textarea></td>
			  </tr>
			  <tr>
			    <td height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">电话号码：</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;
			    <input type="text" name="info.tel"  value="${info.tel }"/></td>
			  </tr>
			  <tr>
			    <td height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">QQ：</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;
			    <input type="text" name="info.qq"  value="${info.qq }"/></td>
			  </tr>
			  <tr>
			    <td height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">email：</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;
			    <input type="text" name="info.email" value="${info.email }"/></td>
			  </tr>
			  <tr>
			    <td colspan="2" height="25" align="center" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">
			    <input type="submit" name="button1" value=" 提 交 "/>
			    <input type="button" name="button2" value=" 返 回 " onclick="history.go(-1);"/>
			    </td>
			  </tr>
			</table>
        </div>
        </form>
    </body>
</html>
