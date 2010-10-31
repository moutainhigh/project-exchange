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
    <form action="${appPath}/admin/changePwd.action" method="post">
   		<input type="hidden" name="method" value="chgPwd"/>
        <div id="wrapper">			
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="border:#c8c8e7 1px solid; border-top:0; margin-top:5px;">
			  <tr>
			    <td height="26" colspan="2" align="left" background="../images/msg_bg.jpg">
				&nbsp;&nbsp;<img src="${appPath}/admin/images/ico1.gif" border="0" align="absmiddle" /> <strong>修改密码</strong> </td>
			  </tr>
			  <tr>
			    <td width="50%" height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">旧密码：</td>
			    <td width="50%" align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;<input type="password" name="oldpassword" /></td>
			  </tr>
			  <tr style="background-color:#F7F8FA">
			    <td height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">新密码：</td>
			    <td align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">&nbsp;<input type="password" name="newpassword" /></td>
			  </tr>
			  <tr>
			    <td height="25" align="right" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">请再输入一次新密码：</td>
			    <td align="left" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;<input type="password" name="renewpassword" /></td>
			  </tr>
			  <tr>
			    <td colspan="2" height="25" align="center" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;"><input type="submit" name="button1" value=" 提 交 "/></td>
			  </tr>
			</table>
        </div>
        </form>
    </body>
</html>
