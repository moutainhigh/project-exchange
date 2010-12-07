<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<#include "head.ftl">
		<script>
			var base = '${base}';
		</script>
		<script src="${base}/js/reg.js"></script>
	</head>
	<body>

		<#include "top.ftl">
		
		<#include "nav.ftl">	

		<!-- begin正文框架 -->
		<form action="${base}/reg_action" method="post">
		<div class="wrapper">
			<div class="part02 mar_t6">
				<div class="">
					<#include "msg.ftl">
					<div class="section ">
						<div class="ptitle">
							用户注册
						</div>						
						<div class=" pad_10 grid">
							<div class="reg">
								<ul>
									<li>
										<span>登&nbsp;录&nbsp;名：</span>
										<span><input type="text" value="" style="width: 200px;" onblur="check_loginid(this);" name="user.loginName" id="login_id"/></span>
										<span class="reg_bg_two">4-16个字符（包括4、16）或2-8个汉字</span>
									</li>
									<li>
										<span>密&nbsp;&nbsp;&nbsp;&nbsp;码：</span>
										<span><input type="password" style="width: 200px;" onblur="check_pwd(this);" name="user.password" id="password"/></span>
										<span class="reg_bg_two">密码须为6位或6以上的字母/数字/下划线</span>
									</li>
									<li>
										<span>密码确认：</span>
										<span><input type="password" style="width: 200px;" onblur="check_repwd(this);" id="repassword"/></span>
										<span class="reg_bg_two">&nbsp;</span>
									</li>
									<li>
										<span>电子邮箱：</span>
										<span><input type="text" value="" style="width: 200px;" onblur="check_email(this);" name="user.email" id="email"/></span>
										<span class="reg_bg_two">忘记密码时，可凭安全邮箱索取密码</span>
									</li>
									<li>
										<span>联系电话：</span>
										<span><input type="text" id="tel" name="user.tel" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" onkeyup="value=value.replace(/[^\d]/g,'')"/>
										<span class="reg_bg_two">常用的联系电话，最好是手机号码</span>
									</li>
									<li>
										<span>QQ&nbsp;号&nbsp;码：</span>
										<span><input type="text" id="qq" name="user.qq" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" onkeyup="value=value.replace(/[^\d]/g,'')"/></span>
										<span class="reg_bg_two">常用的QQ号码，能较长时间在线为佳</span>
									</li>
									<li>
										<span>验&nbsp;证&nbsp;码：</span>
										<span><input type="text" style="margin-bottom: 5px; height: 15px;width: 200px;" onblur="check_rand(this);" name="rand" id="rand" class="auth"  onkeypress="formKeyPress(event);"/></span>
										<span class="reg_bg_two"><a href="#" onclick="document.getElementById('verifyframe').src='${base}/rand?n='+Math.random();">看不清？点击图片换一个</a></span>
									</li>
									<li class="pad_l50">
										<img alt="验证码" style="padding: 4px 0pt 0pt;" onclick="this.src='${base}/rand?n='+Math.random();" src="${base}/rand" name="verifyframe"
												id="verifyframe"/>
									</li>
									<li class="pad_l120">
										<span><input type="button" class="button02" value="注 册" name="send" onclick="chkForm();"/></span>
									</li>
								</ul>
							</div>
							<div class="clear"></div>
						</div>

					</div>
				</div>
			</div>
		</div>
		</form>
		<!-- end正文框架 -->

		<#include "foot.ftl">
	</body>
</html>
