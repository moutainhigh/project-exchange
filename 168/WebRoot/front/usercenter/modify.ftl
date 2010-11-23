<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<#include "/front/head.ftl"/>
		<link href="${base}/front/Themes/usercenter.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${base}/front/js/usercenter.js"></script>
	</head>

	<body>
		<#include "/front/top.ftl">
		<div class="all">
			<#include "/front/pos.ftl">
			<div class="all-k">
				<!--left-->
				<#include "/front/usercenter/left.ftl"/>
				<!--/left-->
				<!--right-->
				<div class="manager-r">
					<div>
						<span><a target="_blank" href="http://www.88ke.com/select/">+ 免费发布信息</a>
						</span> 欢迎
						<font id="loginname">${userObj.email!userObj.loginName}</font>的光临:
					</div>
					<#include "/front/msg.ftl">
					<form action="${base}/user/modify.htm" method="post">
					<table cellspacing="0" cellpadding="0" border="0" width="730" style="margin-top: 30px;">
						  <tbody><tr>
						    <td align="right" width="17%">电话：</td>
						    <td class="manager-t"><input type="text" id="tel" name="contact.tel" value="<#if userObj.contact??>${userObj.contact.tel!''}</#if>" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" onkeyup="value=value.replace(/[^\d]/g,'')"> 
						    </td>
						   </tr>
						  <tr>
						    <td align="right" width="17%">QQ：</td>
						    <td><input type="text" id="qq" name="contact.qq" value="<#if userObj.contact??>${userObj.contact.qq!''}</#if>" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" onkeyup="value=value.replace(/[^\d]/g,'')">
							
							</td>
							</tr>
						  <tr>
						    <td align="right">&nbsp;</td>
						    <td><input type="submit" value="提交" id="button" name="button"></td>
						  </tr>
						  </tbody>
					</table>
					</form>
				</div>
				<!--/right-->
				<div class="clear"></div>
			</div>
		</div>
		<#include "/front/foot.ftl">
	</body>
</html>

