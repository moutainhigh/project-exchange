<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>扶贫信息管理系统 - 登录</title>
		<link href="${appPath}login/style.css" rel="stylesheet" type="text/css" />
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
	function formKeyPress(event){
		if(event.keyCode == 13){
			submitForm();
		}else{
			return false;
		}
	}
	function submitForm(){
		var username = document.forms[0].username.value;
		var pwd = document.forms[0].password.value;
		//var rand = document.forms[0].rand.value;
		//if(username=='' || pwd=='' || rand==''){
		if(username=='' || pwd==''){
			alert('请输入用户名和密码');
			return false;
		}
		document.forms[0].submit();
	}
</script>
	</head>
	<body style="background: #fff7e5"
		onload="breakout_of_frame();document.forms[0].username.focus()">
		<div id="login">
			<div style="float: left; vertical-align: middle; text-align: center; width: 384px; line-height: 40px; margin-top: 50px;">
			<h1 style="color: white; font-weight: 600;font-size:30px;">欢迎使用<br/><br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;扶贫信息管理系统</h1>
			</div>
			<div id="login_warp">
				<h3>
					Please login...
				</h3>
				<form action="${appPath}login.action" id="loginForm" method="post">
					<div class="type_words">
						<label for="username">
							Username:
						</label>
						<div class="username">
							<input id="username" type="text" name="username" />
						</div>
					</div>
					<div class="type_words">
						<label for="password">
							Password:
						</label>
						<div class="password">
							<input id="password" type="password" name="password" onkeypress="formKeyPress(event);"/>
						</div>
					</div>
					<div class="login_btn">
						<img src="${appPath}login/images/login_btn.gif" onclick="submitForm();" style="cursor: pointer;"/>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>
