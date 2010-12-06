<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<#include "head.ftl">
		<script>
			var base = '${base}';
		</script>
		<script src="${base}/js/login.js"></script>
	</head>
	<body>

		<#include "top.ftl">
		
		<#include "nav.ftl">	

		<!-- begin正文框架 -->
		<form action="${base}/login_action" method="post">
		<div class="wrapper">
			<div class="part02 mar_t6">
				<div class="">
					<div class="section ">
						<div class="ptitle">
							用户登录
						</div>						
						<div class=" pad_10 grid">
							<div class="login">
								<ul>
									<li>
										<span>登录名：</span>
										<span><input type="text" value="" style="width: 200px;" onblur="check_loginid(this);" name="username" id="login_id"/></span>
										<span class="reg_bg_two"><a href="reg.html">注册新账号</a></span>
									</li>
									<li>
										<span>密&nbsp;&nbsp;码：</span>
										<span><input type="password" style="width: 200px;" onblur="check_pwd(this);" name="password" id="password"/></span>
										<span class="reg_bg_two"><a href="#">忘记密码</a></span>
									</li>
									<li>
										<span>验证码：</span>
										<span><input type="text" style="margin-bottom: 5px; height: 15px;width: 200px;" onblur="check_rand(this);" name="rand" id="rand" class="auth"  onkeypress="formKeyPress(event);"/></span>
										<span class="reg_bg_two"><a href="#" onclick="document.getElementById('verifyframe').src='${base}/rand?n='+Math.random();">看不清？点击图片换一个</a></span>
									</li>
									<li class="pad_l50">
										<img alt="验证码" style="padding: 4px 0pt 0pt;" onclick="this.src='${base}/rand?n='+Math.random();" src="${base}/rand" name="verifyframe"
												id="verifyframe"/>
									</li>
									<li class="pad_l120">
										<span><input type="button" class="button02" value="登 录" name="send" onclick="chkForm();"/></span>
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
