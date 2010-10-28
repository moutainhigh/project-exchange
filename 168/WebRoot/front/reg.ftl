<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<#include "/front/head.ftl"/>
		<link href="${base}/front/Themes/reg.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${base}/front/js/reg.js"></script>
	</head>

	<body>
		<#include "/front/top.ftl">
		<div class="all">
			<div id="content_s">
				<div id="register_step">
					<img alt="填写信息" src="Themes/images/input_info_on.jpg?ver=431">
					<img alt="注册成功" src="Themes/images/register_success_huise.jpg?ver=431">
				</div>
				<#include "/front/msg.ftl">
				<form method="post" name="register_submit" action="${base}/reg_action.htm" id="register_submit">
					<div style="padding-left: 85px; padding-right: 0pt;">
						<table height="122" cellspacing="0" cellpadding="0" border="0" width="90%">
							<tbody>
								<tr>
									<td class="reg_bg_one" colspan="4">
										<label>
											登录名:
										</label>
										&nbsp;
										<input type="text" value="" style="width: 200px;" onblur="check_loginid(this);" name="user.loginName" id="login_id">
									</td>
									<td width="336" id="loginidinfo" class="reg_bg_two">
										4-16个字符（包括4、16）或2-8个汉字
									</td>
								</tr>
								<tr>
									<td class="reg_bg_one" colspan="4">
										<label>
											密码:
										</label>
										&nbsp;
										<input type="password" style="width: 200px;" onblur="check_pwd(this);" name="user.password" id="password">
									</td>
									<td id="pwdinfo" class="reg_bg_two">
										密码须为6位或6以上的字母/数字/下划线
									</td>
								</tr>
								<tr>
									<td class="reg_bg_one" colspan="4">
										<label>
											重输密码:
										</label>
										&nbsp;
										<input type="password" style="width: 200px;" onblur="check_repwd(this);" id="repassword">
									</td>
									<td id="repwdinfo" class="reg_bg_two">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td class="reg_bg_one" colspan="4">
										<label>
											电子邮箱:
										</label>
										&nbsp;
										<input type="text" value="" style="width: 200px;" onblur="check_email(this);" name="user.email" id="email">
									</td>
									<td id="emailinfo" class="reg_bg_two">
										忘记密码时，可凭安全邮箱索取密码
									</td>
								</tr>
								<tr>
									<td class="reg_bg_one" colspan="4">
										<div id="sel_geo">
											<label>
												所在地区:
											</label>
											&nbsp;
											<select name="topArea" id="topArea"></select>
											<select name="user.area.id" id="city"></select>
										</div>
									</td>
									<td id="geoinfo" class="reg_bg_two">
										您登录以后，首页将会指向此处，可以只选择省份或直辖市
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
							<input type="button" class="reg" value="注 册" name="send" onclick="chkForm();">
							<span>&nbsp;&nbsp;表示您同意<a target="_blank" href="#">一路发网络服务使用协议</a>
							</span>
						</div>
					</div>
				</form>
			</div>
		</div>
		<#include "/front/foot.ftl">
	</body>
</html>

