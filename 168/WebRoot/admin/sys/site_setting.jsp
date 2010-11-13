<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>模板网页</title>
        <link href="${appPath}/admin/css/common.css" rel="stylesheet" type="text/css" />
        <script src="${appPath}/admin/js/common.js"></script>
        <script type="text/javascript" src="${appPath}/js/jquery.js"></script>
		<script type='text/javascript' src='${appPath}/js/jquery.bgiframe.min.js'></script>
		<script type='text/javascript' src='${appPath}/js/jquery.autocomplete.js'></script>
		<link rel="stylesheet" type="text/css" href="${appPath}/js/jquery.autocomplete.css" />
		<script type="text/javascript">
			$(function(){
			});
			function saveForm(){
				if($('#title').val()==''){
					alert('请至少填入网站标题');
					return false;
				}			
				document.forms[0].submit();			
			}
		</script>
    </head>
    <body>
   		<input type="hidden" name="method" value="newUser"/>
        <form action="${appPath }/admin/siteSetting" method="post">
        <input name="cityId" id="cityId" type="hidden"/>
        <div id="wrapper">			
			<table width="100%" border="1" align="center" cellpadding="0" bordercolor="#0099CC" cellspacing="1" style="border-collapse: collapse;border:#c8c8e7 1px solid; border-top:0; margin-top:5px;">
			  <tr>
			    <td height="26" colspan="2" align="left" background="${appPath}/admin/images/msg_bg.jpg" style="padding-left:20px;">
				<strong>网站配置</strong> 
				</td>
			  </tr>
			  <tr>
			    <td height="26" colspan="" style="text-align: center;">
				&nbsp;
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				<input name="title" id="title" value="${appTitle}" style="width: 90%"/>
				</td>
			  </tr>
			  <tr>
			    <td height="26" colspan="" style="text-align: center;">
				&nbsp;
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				<input name="keywords" id="keywords" value="${appKeywords}" style="width: 90%"/>
				</td>
			  </tr>
			  <tr>
			    <td height="26" colspan="" style="text-align: center;">
				&nbsp;
				</td>
				<td height="26" colspan="" style="padding-left: 30px;">
				<input name="desc" id="desc" value="${appDesc}" style="width: 90%"/>
				</td>
			  </tr>
			  <tr>
				<td height="26" colspan="2" style="text-align: center;">
				<input type="button" onclick="saveForm();" value=" 保存 "/>
				</td>
			  </tr>
			</table>
        </div>
        </form>
    </body>
</html>
