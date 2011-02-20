<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>${appTitle}</title>
		<link rel="stylesheet" type="text/css" href="${appPath}html/css/basic.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="${appPath}html/css/Layout.css" media="screen" />
		<script type="text/javascript" src="${appPath}html/script/jquery.js"></script>
		<script type="text/javascript">
			function login(){
				var pwd = $('#password').attr('value');
				var user = $('#username').attr('value');
				if(user=='' || pwd==''){
					alert('请填入用户名和密码，然后再登录');
					return false;
				}else{
					document.forms[0].submit();
				}
			}
		</script>
		<script type="text/javascript">
			function breakout_of_frame()
			{
			  // see http://www.thesitewizard.com/archive/framebreak.shtml
			  // for an explanation of this script and how to use it on your
			  // own website
			  if (top.location != location) {
			    top.location.href = document.location.href ;
			  }
			}
		</script>
	</head>

	<body class="bg01" style="text-align: center;" onload="breakout_of_frame();">
		<form action="${appPath}login.htm" method="post">
			<div id="main_container2" class="mar_t50">
				<div class="header">
					<div id="logo">
						<span><img src="html/css/images/logo.jpg" alt="" title="" width="296" height="47" border="0" /> </span>
					</div>
				</div>
				<div id="middle_box">
					<div class="middle_box_content">
						<div class="login_frame">
							<div class="clearfix mar_b5 mar_t10">
								<div class="bdbottom pad_b10">
									<p class="mar_b10">
										<span>用户名：</span>
										<input name="username" id="username" tabindex="1" class="logininput4" type="text" />
									</p>
									<p class="mar_b10">
										<span>密&nbsp;&nbsp;码：</span>
										<input name="password" id="password" tabindex="2" class="logininput4" type="password" />
									</p>
									<!--  <p class="mar_b5">
									<span>验证码：</span>
									<input name="" tabindex="2" class="logininput3" type="text"/>
								</p>-->
								</div>
								<div class="clear"></div>
							</div>
							<div class="mar_b5 mar_t5  pad_l50">
								<input onClick="login();" class="button04" value="" title="登录" type="button">
							</div>
							<div class="clear"></div>
						</div>
					</div>
				</div>
				<div class="footer">
					<p>
						技术支持：饲料经营系统
					</p>
					<p class="mar_t5" style="font-family: Arial, Helvetica, sans-serif;">
						Copyright&nbsp;&copy;&nbsp;Fodder Corporation.2011
					</p>
				</div>
			</div>
		</form>
	</body>
</html>
