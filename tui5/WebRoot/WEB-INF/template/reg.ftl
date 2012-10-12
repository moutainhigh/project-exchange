<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
	<title>推我网 - 注册</title>	
	<link href="css/reset.css" rel="stylesheet" type="text/css" />
	<link href="css/mian.css" rel="stylesheet" type="text/css" />
	<link href="css/register.css" rel="stylesheet" type="text/css" />
	<script src="js/jquery.js" type="text/javascript"></script>
	<script src="js/reg.js" type="text/javascript"></script>
</head>
<body>
	<#include "/WEB-INF/template/include/head.ftl"> 
	<div id="mian">		
		<#include "/WEB-INF/template/include/nav.ftl"> 
		<!-- 内容区域 -->
		<div class="content">
			<h2 class="reg_title">新用户注册</h2>
			<div class="mc-main">
				<div class="registerdock-wrap">
					<div class="registerdock">
						<div class="registerdock-inner">
							<form id="regForm" method="post" action="${base}/reg.html">
								<input type="hidden" value="add" name="act">
								<input type="hidden" id="dos" value="" name="dos">
								<div class="formcaption">
									注册完成后, 该帐号将作为您在本站的通行帐号, 您可以享受本站提供的各种服务.
								</div>
								<div class="formgroup registerform">
									<div class="formrow">
										<h3 class="label"><label for="username">用户名</label></h3>
										<div class="form-enter">
											<input type="text" maxlength="16" tabindex="2" value="" id="username" name="username" class="text">
											<span id="err_username">&nbsp;</span>
										</div>
										<div class="form-note">用户名由2到16位的中文字符、英文字母、数字组成</div>
									</div>
									<div class="formrow">
										<h3 class="label"><label for="password">密码</label></h3>
										<div class="form-enter">
											<input type="password" tabindex="3" id="password" value="" name="password" class="text">
											<span id="checkpassword">&nbsp;</span>
										</div>
									</div>
									<div class="formrow">
										<h3 class="label"><label for="confirmpassword">确认密码</label></h3>
										<div class="form-enter">
											<input type="password" tabindex="4" id="confirmpassword" value="" name="password2" class="text">
											<span id="checkpassword2">&nbsp;</span>
										</div>
									</div>
									<div class="formrow">
										<h3 class="label"><label for="email">Email</label></h3>
										<div style="position:relative;" class="form-enter">
											<input type="text" tabindex="5" value="" id="email" name="email" class="text">
											<span id="err_email">&nbsp;</span>
										</div>
										<div class="form-note">请准确填写您的邮箱. 在忘记密码或者您使用邮件通知功能时, 会发送邮件到该邮箱.</div>
									</div>       
									<div class="formrow">
										<h3 class="label"><label for="rand">验证码</label></h3>
										<div style="position:relative;" class="form-enter">
											<input type="text" tabindex="5" value="" id="rand" name="rand" class="text">
											&nbsp;<img src="/rand.servlet?" alt="验证码" id="yanzheng"/>
											<span id="err_rand">&nbsp;</span>
										</div>
										<div class="form-note">请准确填写图形验证码.<a href="javascript:void(0)" onclick="document.getElementById('yanzheng').src += Math.random();return false;">看不清，点击刷新验证码</a></div>
									</div> 
									<div class="formrow formrow-action">
										<span class="btn-wrap"><span class="btn"><input type="button" id="regbtn" tabindex="8" class="button" value="注册新用户" name="register"></span></span>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div style="padding-left:30px" class="loginlink-wrap">
					<div class="loginlink">
						<div class="loginlink-inner">
							<div class="loginlink-text">
								<h3>已有帐号?</h3>
							</div>
							<div class="login-link">
								<a title="会员登录" style="color:#FFF" class="button" href="/login.html">登录帐号</a>
							</div>
						</div>
						<div class="loginlink-text">
							<h3>使用合作网站登录</h3>
							<ul>
							  <li><a title="用支付宝账号登录" href="#"><img alt="用支付宝账号登录" src="img/alipay_fl_m.png"></a></li>
							  <li><a id="logqq" title="用腾讯QQ账号登录" href="javascript:void(0);"><img alt="用腾讯QQ账号登录" src="img/Connect_logo_3.png"></a></li>
							  <li><a id="logsina" title="用新浪微博宝账号登录" href="javascript:void(0);"><img alt="用新浪微博宝账号登录" src="img/240.png"></a></li>
							  <div class="clear"></div>
							</ul>
						</div>
						<div style="clear:both"></div>
						<div class="loginlink-desp">
							<ul style="margin-top: 0px;">
							<li><b>作为雇主：</b><br>&#12288;&#12288;省钱省力完成您的悬赏项目(任务)，数百万的威客为您服务！ 无须担心没人能完成您的项目(任务) 本站有设计类、策划类、各行业专业人才、并长期活跃在网站上。</li><li><b>作为威客：</b><br>&#12288;&#12288;坐在家里即可赚取项目悬赏金，大量悬赏项目等您完成。 无须担心诚信问题，本站预收全额佣金，项目完成即时发放。本站与联合信任版权自助保护中心合作，原创作品有保障！ </li></ul>
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<!-- 内容区域结束 -->
		<#include "/WEB-INF/template/include/foot.ftl"> 
	</div>
</body>
</html>