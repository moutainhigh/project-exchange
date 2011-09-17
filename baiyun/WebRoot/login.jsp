<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>广州市扶贫信息网 - 后台登录</title>
		<link href="${appPath}css.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${appPath}js/jquery.js"></script>
		<script type="text/javascript">
	function getCookie(name)//取cookies函数        
	{
    	var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
     	if(arr != null) return unescape(arr[2]); return null;
	}
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
	var msg = '${msg}';
	if(msg != ''){
		alert(msg);
	}
	$(function(){
		//alert();
		var username = getCookie("username");
		if(username){
			$('#username').val(username);
		}
		//更换图标
		var url  = window.location.href;
		if(url.indexOf('baiyun') > -1){
			$('#login_title').attr('background','${appPath}images/ht_01_baiyun.gif');
			$('#version_txt').html('版权所有：白云区扶贫办公室');
		}
	});
</script>
	</head>

	<body onload="breakout_of_frame();">
		<form action="${appPath}login.action" id="loginForm" method="post">
			<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td height="158" background="${appPath}images/ht_01.gif" id="login_title">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td height="274" background="${appPath}images/ht_02.gif">
						<table width="1000" height="274" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="598">
									&nbsp;
								</td>
								<td width="324" valign="top">
									<table width="324" border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td height="65" colspan="2">
												&nbsp;
											</td>
										</tr>
										<tr>
											<td width="116" height="34">
												&nbsp;
											</td>
											<td width="208">
												<input id="username" type="text" name="username" />
											</td>
										</tr>
										<tr>
											<td height="36">
												&nbsp;
											</td>
											<td height="36">
												<input id="password" type="password" name="password" onkeypress="formKeyPress(event);" />
											</td>
										</tr>
										<tr>
											<td height="34">
												&nbsp;
											</td>
											<td height="34">
												<input name="rand" type="text" class="kuang" size="5" />
												<img src="${appPath}rand.servlet" alt="验证码" id="yanzheng" />
											</td>
										</tr>
										<tr>
											<td height="23" colspan="2" align="center">
												<input type="radio" name="remember" value="true" />
												记住用户名 忘记密码
											</td>
										</tr>
										<tr>
											<td height="37" colspan="2" valign="top">
												<table width="168" border="0" align="center" cellpadding="0" cellspacing="0">
													<tr>
														<td width="55" height="30">
															&nbsp;
														</td>
														<td width="57" valign="bottom">
															<img src="${appPath}images/ht_login.gif" width="46" height="22" onclick="submitForm();" />
														</td>
														<td width="56" align="left" valign="bottom">
															<img src="${appPath}images/ht_cz.gif" width="48" height="22" onclick="document.forms[0].reset();" />
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
								<td width="78">
									&nbsp;
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="148" align="right" valign="top" background="images/ht_03.gif">
						<table width="832" border="0" align="center" cellpadding="0" cellspacing="0">
							<tr>
								<td width="832" height="3">&nbsp;</td>
							</tr>
							<tr>
								<td height="31" align="right" id="version_txt">
									版权所有：广州市扶贫办公室
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

