<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset==gbk" />
	<title>推我网 - 登录</title>	
	<link href="css/reset.css" rel="stylesheet" type="text/css" />
	<link href="css/mian.css" rel="stylesheet" type="text/css" />
	<link href="css/login.css" rel="stylesheet" type="text/css" />
	<script src="js/jquery.js" type="text/javascript"></script>
	<script src="js/login.js" type="text/javascript"></script>
</head>
<body>
	<!-- 顶部区域 -->
	<div id="top">
			<div class="top_con">
			<div class="top_l">找兼职，上推我网！</div>
			<div class="top_r"><a href="/reg.html">注册</a> | <a href="/login.html">登录</a><span><a href="#">发布推广任务</a><a href="#">帮助</a></span></div>
			</div>
	</div>
	<!-- 顶部区域结束 -->
	<div id="mian">		
		<!-- 头部区域 -->
		<div class="nav">
			<!--LOGo区域-->
			<div class="nav_top clearfix">
				<a href="#" class="logo_a"><img src="img/logo.gif"/></a>
				<a href="#" class="index_a">广告图width:695px; height:70px; </a>            
			</div>
			<!--LOGo区域结束-->
			<!--导航区域-->
			<div class="nav_botttom clearfix">
				<ul class="clearfix">
					<li><A href="#" class="now_a">首页</A></li>
					<li><A href="#">微博营销</A></li>
					<li><A href="#">网络推广</A></li> 
					<li><A href="#">文案写作</A></li>
					<li><A href="#">推广人才</A></li>
					<li><A href="#">推广学院</A></li>
					<li><A href="#">交流论坛</A></li>
				</ul>
			</div>
			<!--导航区域结束-->
		</div>
		<!-- 头部区域结束 -->
		<!-- 内容区域 -->
		<div class="content">
			<h2 class="reg_title">用户登录</h2>
			<div class="mc-main">
				<div class="registerdock-wrap">
					<div class="registerdock">
						<div class="registerdock-inner">
							<form id="regForm" method="post" action="register.asp">
								<input type="hidden" value="add" name="act">
								<input type="hidden" id="dos" value="" name="dos">
								<div class="formcaption">
									登录进入用户中心，管理自己的任务和财务
								</div>
								<div class="formgroup registerform">
									<div class="formrow">
										<h3 class="label"><label for="username">用户名</label></h3>
										<div class="form-enter">
											<input type="text" maxlength="16" tabindex="2" value="" id="username" name="username" class="text">
											<span id="err_username">&nbsp;</span><a href="/reg.html">还没有帐号，马上注册&gt;&gt;</a>
										</div>
									</div>
									<div class="formrow">
										<h3 class="label"><label for="password">密码</label></h3>
										<div class="form-enter">
											<input type="password" tabindex="3" id="password" value="" name="password" class="text">
											<span id="checkpassword">&nbsp;</span>
										</div>
									</div>									
									<div class="formrow">
										<h3 class="label"><label for="rand">验证码</label></h3>
										<div style="position:relative;" class="form-enter">
											<input type="text" tabindex="5" value="" id="rand" name="rand" class="text">
											&nbsp;<img src="/rand.servlet" alt="验证码" id="yanzheng"/>
											<span id="err_rand">&nbsp;</span>
										</div>
										<div class="form-note">请准确填写图形验证码.</div>
									</div> 
									<div class="formrow formrow-action">
										<span class="btn-wrap"><span class="btn"><input type="submit" id="max_unnamedsubmit_7" tabindex="8" class="button" value="登录" name="register"></span></span>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div style="padding-left:30px" class="loginlink-wrap">
					<div class="loginlink">
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
							<li><b>作为雇主：</b><br>&#12288;&#12288;省钱省力完成您的悬赏项目(任务)，数百万的威客为您服务！ 无须担心没人能完成您的项目(任务) 本站有设计类、策划类、各行业专业人才、并长期活跃在网站上。 <a target="_blank" class="blue" href="http://www.680.com/item_add.html">&gt;&gt;立即发布项目</a></li><li><b>作为威客：</b><br>&#12288;&#12288;坐在家里即可赚取项目悬赏金，大量悬赏项目等您完成。 无须担心诚信问题，本站预收全额佣金，项目完成即时发放。本站与联合信任版权自助保护中心合作，原创作品有保障！ <a target="_blank" class="blue" href="http://www.680.com/task/">&gt;&gt;开始赚钱</a></li></ul>
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<!-- 内容区域结束 -->
		<!-- 底部区域 -->
		<div class="copyright">
			<ul>
				<li><a href="#">联系我们</a> | <a href="#">广告业务</a> | <a href="#">信息置顶</a> | <a href="#">站内留言</a> | <a href="#">最新兼职</a> | <a href="#">最新简历</a> | <a href="#">免责声明</a></li>
				<li>Copyright &copy; 2009-2012 <a href="#">推我网 (tui5.com)</a> 版权所有</li>
				<li>ICP证：京07038868号</li>
			</ul>
		</div>
		<!-- 底部区域结束 -->
	</div>
</body>
</html>