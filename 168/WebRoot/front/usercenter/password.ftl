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
			<div id="postion">
				您的位置：
				<a title="88客网" href="/">88客网</a> &gt;&gt; 用户管理中心
			</div>
			<div class="all-k">
				<!--left-->
				<#include "/front/usercenter/left.ftl"/>
				<!--/left-->
				<!--right-->
				<div class="manager-r">
					<div>
						<span><a target="_blank" href="http://www.88ke.com/select/">+ 免费发布信息</a>
						</span> 欢迎
						<font id="loginname">yanglei123qwe@163.com</font>的光临:
					</div>
					<#include "/front/msg.ftl">
					<form action="${base}/user/changePwd.htm" method="post">
					<table cellspacing="0" cellpadding="0" border="0" width="730" style="margin-top: 30px;">
					  	<form style="margin: 0pt;" method="post" action="http://www.88ke.com/manaferpwd/"></form> 
						  <tbody><tr>
						    <td align="right" width="17%">原始密码：</td>
						    <td class="manager-t"><input type="password" id="oldpassword" name="oldpassword"> 
						    </td>
						   </tr>
						  <tr>
						    <td align="right" width="17%">输入新密码：</td>
						    <td><input type="password" id="newpassword" name="newpassword">
							
							</td>
							</tr>
						  <tr>
						    <td align="right">再次输入新密码：</td>
						    <td><input type="password" id="renewpassword" name="renewpassword"></td>
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

