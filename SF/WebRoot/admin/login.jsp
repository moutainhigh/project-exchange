<%@ page language="java" pageEncoding="UTF8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="pragma" content="no-cache" />  
<title>${app_title} >> 登录</title>
<link rel="shortcut icon" href="favicon.jpg" type="image/x-icon" />
<link href="../res/login/login.css" rel="stylesheet" type="text/css" />

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
		var rand = document.forms[0].rand.value;
		if(username=='' || pwd=='' || rand==''){
			alert('用户名、密码、验证码均为必填选项，请检查');
			return false;
		}
		document.forms[0].submit();
	}
</script>
</head>
<body style="background:#fff7e5" onload="breakout_of_frame();">
<div id="login">
	<h1 style="position: relative;left:54px;top:80px;color: white; font-size: 26pt;">${app_title }</h1>
	<h1 style="position: relative;left:52px;top:110px;color: white; font-size: 14pt;">52CQBL.com Management System</h1>
  <div id="login_warp" style="margin-top: -65px;">
    <h3>请登录</h3>
    <form action="LogonAction.do" id="loginForm" method="post">
      <div class="type_words">
        <label for="username">用户名:</label>
        <div class="username">
          <input id="username" type="text" name="username" />
        </div>
      </div>
      <div class="type_words">
        <label for="password">密码:</label>
        <div class="password">
          <input id="password" type="password" name="password" />
        </div>
      </div>
      <div class="type_words"> 
      <label for="verification_code">验证码:</label>
      <div class="login_pic"><img src="../rand" alt="验证码" id="yanzheng"/></div>
      <div class="verification_code">
        <input id="verification_code" type="text" name="rand" onkeypress="formKeyPress(event);"/>
        <input type="hidden" name="method" value="login"/>
      </div>
      <div class="login_btn">
        <img src="../res/login/images/login_btn.gif" onclick="submitForm();" />
      </div>
    </form>
  </div>
</div>
<center style="color:red;">
${sessionScope.login_msg }
<%
	session.removeAttribute("login_msg");
%>
</center>
</body>
</html>
