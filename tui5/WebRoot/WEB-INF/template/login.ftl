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
	<script type="text/javascript">
		var returnurl = '${returnurl}';
		returnurl = returnurl!=''?returnurl:"member_index.do";
		function formKeyPress(event){
			if(event.keyCode == 13){
				$('#loginbtn').click();
			}else{
				return false;
			}
		}
	</script>
</head>
<body>
	<#include "/WEB-INF/template/include/head.ftl">
	<div id="mian">		
		<#include "/WEB-INF/template/include/nav.ftl">
		<!-- 内容区域 -->
		<div class="content">
			<h2 class="reg_title">用户登录</h2>
			<div class="mc-main">
				<div class="registerdock-wrap">
					<div class="registerdock">
						<div class="registerdock-inner">
							<form id="regForm" method="post" action="/login.html">
								<input type="hidden" value="add" name="act">
								<input type="hidden" id="dos" value="" name="dos">
								<div class="formcaption">
									登录进入用户中心，管理自己的任务和财务信息
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
											<input type="text" tabindex="5" value="" id="rand" name="rand" class="text" onkeypress="formKeyPress(event);">
											&nbsp;<img src="/rand.servlet?" alt="验证码" id="yanzheng"/>
											<span id="err_rand">&nbsp;</span>
										</div>
										<div class="form-note">请准确填写图形验证码.<a href="javascript:void(0)" onclick="document.getElementById('yanzheng').src += Math.random();return false;">看不清，点击刷新验证码</a></div>
									</div> 
									<div class="formrow formrow-action">
										<span class="btn-wrap"><span class="btn"><input type="button" id="loginbtn" tabindex="8" class="button" value="登录" name="register"></span></span>
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
		<#include "/WEB-INF/template/include/foot.ftl">
	</div>
</body>
</html>