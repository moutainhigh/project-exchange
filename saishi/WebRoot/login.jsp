<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>${appTitle}</title>
		<link rel="stylesheet" type="text/css" href="${appPath}html/css/basic.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="${appPath}html/css/Layout.css" media="screen" />
		<script type="text/javascript" src="${appPath}html/script/jquery.js"></script>
		<script src="${appPath}html/script/common.js"></script>
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
		<form action="${appPath}login.action" method="post">
			<div id="main_container2" class="mar_t50">
				<div class="header">
					<div id="logo">
						<span>&nbsp;</span>
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
									<p class="mar_b5">
									<c:if test="${not empty msg}">
									<div style="background:none;text-align:center; height:30px; font-size:12px;color:red;margin:10px auto;border:0;padding:1px;" id="reqMsg">
										<div style="margin:2px auto;border:1px solid #FF0000; background-color:#FFCE00; line-height:30px;height:30px; width:200px;">
											${msg}
										</div>
									</div>
									</c:if >
									</p>
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
						技术支持：Throne
					</p>
				</div>
			</div>
		</form>
	</body>
</html>
