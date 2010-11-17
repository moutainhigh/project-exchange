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
			var msg = '${msg}';
			if(msg != ''){
				alert(msg);
			}
			$(function(){
			});
			function rangeGen(){
				if($('#startId').val()=='' || $('#endId').val()==''){
					alert('请填入起止编号');
					return false;
				}			
				if(confirm('您确认需要生成吗?')){
					document.forms[0].submit();
				}
			}
		</script>
    </head>
    <body>
   		<input type="hidden" name="method" value="newUser"/>
        <form action="${appPath}/admin/generateHtml" method="get">
        <div id="wrapper">			
			<table width="100%" border="1" align="center" cellpadding="0" bordercolor="#0099CC" cellspacing="1" style="border-collapse: collapse;border:#c8c8e7 1px solid; border-top:0; margin-top:5px;">
			  <tr>
			    <td height="26" colspan="2" align="left" background="${appPath}/admin/images/msg_bg.jpg" style="padding-left:20px;">
				<strong>一键生成所有的信息HTML</strong> 
				</td>
			  </tr>
			  <tr>
			    <td height="25" align="center" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">
			    <input type="button" value="一键生成所有的信息HTML" onclick="if(confirm('您确认要生成HTML吗？')){self.location.href='${appPath}/admin/generateHtml';}"/>
			    </td>
			  </tr>
			</table>
			<br/><br/>
			<table width="100%" border="1" align="center" cellpadding="0" bordercolor="#0099CC" cellspacing="1" style="border-collapse: collapse;border:#c8c8e7 1px solid; border-top:0; margin-top:5px;">
			  <tr>
			    <td height="26" colspan="1" align="left" background="${appPath}/admin/images/msg_bg.jpg" style="padding-left:20px;">
				<strong>分编号段生成HTML</strong> 
				</td>
			  </tr>
			  <tr>
			    <td align="center" bgcolor="#FFFFFF" style="border-bottom:#cccccc 1px dashed;">&nbsp;
			    <input type="text" name="startId" id="startId"/>
			    <input type="text" name="endId" id="endId"/>
			    <br/>
			    <input type="button" value="生成编号范围的信息HTML" onclick="rangeGen();"/>
			    </td>
			  </tr>
			</table>
        </div>
        </form>
    </body>
</html>
