<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<#include "/front/head.ftl"/>
		<link href="${base}/front/Themes/reg.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${base}/front/js/login.js"></script>
	</head>

	<body>
		<#include "/front/top.ftl">
		<div class="all">
			<div id="content_s">
				<div id="register_step">
					<img alt="用户登录" src="Themes/images/log_banner.gif">
				</div>
				<#include "/front/msg.ftl">
				<form method="post" name="register_submit" action="login_action.htm" id="register_submit">
					<div style="padding-left: 85px; padding-right: 0pt;">
						<table height="122" cellspacing="0" cellpadding="0" border="0" width="90%">
							<tbody>
								<tr>
									<td class="reg_bg_one" colspan="4">
										<label>
											登录名:
										</label>
										&nbsp;
										<input type="text" value="" style="width: 200px;" onblur="check_loginid(this);" name="username" id="login_id">
									</td>
									<td width="336" id="loginidinfo" class="reg_bg_two">
										<a href="reg.html">注册新账号</a>
									</td>
								</tr>
								<tr>
									<td class="reg_bg_one" colspan="4">
										<label>
											密码:
										</label>
										&nbsp;
										<input type="password" style="width: 200px;" onblur="check_pwd(this);" name="password" id="password">
									</td>
									<td id="pwdinfo" class="reg_bg_two">
										<a href="#">忘记密码？</a>
									</td>
								</tr>
								<tr>
									<td style="padding: 0pt; margin: 0pt;" class="reg_bg_one" colspan="4">
										<div style="float: left; margin: 3px 5px 3px 0; padding: 10px 0pt 0pt;">
											<label>
												验证码:
											</label>
											&nbsp;
											<input type="text" style="margin-bottom: 5px; height: 15px;" onblur="check_rand(this);" name="rand" id="rand" class="auth">
										</div>
										<div style="float:left;margin:8px 10px">
											<img alt="验证码" style="padding: 4px 0pt 0pt;" onclick="this.src='rand?n='+Math.random();" src="rand" name="verifyframe"
												id="verifyframe">
										</div>
										<div style="padding-left: 100px;" class="hui">
											看不清？点击图片换一个
										</div>
									</td>
									<td id="authinfo" class="reg_bg_two">
										此步骤有助于防止恶意自动注册行为的发生。
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div id="submit">
						<div>
							<input type="button" class="reg" value="登 录" name="send" onclick="chkForm();">
						</div>
					</div>
				</form>
			</div>
		</div>
		<#include "/front/foot.ftl">
	</body>
</html>

