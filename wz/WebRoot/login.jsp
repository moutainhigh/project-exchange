<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK" />
    <title>${appTitle}</title>
    <link href="${appPath}/Themes/basic.css" type="text/css" rel="stylesheet" />
    <link href="${appPath}/Register/Themes/layout.css" type="text/css" rel="stylesheet" />
    <script src="${appPath}/js/jquery-1.4.2.min.js"></script>
    <script>
	    function login() {
			var username = $('#username').val();
			var password = $('#password').val();
			var rand = $('#rand').val();
			if (username == '' || password == '' || rand == '') {
				alert('请输入账号和密码，以及验证码!');
				return;
			}
			$('form').submit();
		}
		function formKeyPress(event){
			if(event.keyCode == 13){
				login();
			}else{
				return false;
			}
		}
    </script>
</head>
<body>
	<jsp:include page="common/head.jsp"></jsp:include>
    <!---- begin正文框架 ---->
	<div class="wrapper mauto">
	  <div class="section" style="border-width: 3px;">
	    <div class="ptitle">
	      <div class="icon">用户登录</div>
	    </div>
	    <div class="regist pad_30">
			<div class="fl w322 hide pad_r10 bsr_gray">
			  <p class="yahei ft18 blue fb bdb_gray mar_t3 pad_b10"> 登录兼职吧网赚中心，能做什么？</p>
			  <p class="dot1 mar_t10 ft14 fb yellow_ef yahei">我要悬赏</p>
			  <p class="mar_t3 pad_l10">更低的成本，更多的选择；</p>
			  <p class="dot1 mar_t10 ft14 fb yellow_ef yahei">我要赚钱</p>
			  <p class="mar_t3 pad_l10">能力变现，有本事你就来！</p>
			  <p class="mar_t20"> <img src="${appPath}/Themes/images/register_ad.jpg" width="320" height="124" /></p>
			</div>
			<form action="${appPath}/login" method="post">
			<div class="regInfos border_l1">
				<jsp:include page="msg.jsp"></jsp:include>
		        <div class="regblock">
		          <div class="reginfo">
		            <label class="label"><span class="msg">* </span>登录名:</label>
		            <input class="textbox" type="text" name="username" id="username"/>
		          </div>
		        </div>
		        <div class="regblock">
		          <div class="reginfo">
		            <label class="label"><span class="msg">* </span>密码:</label>
		            <input class="textbox" type="password" name="password" id="password"/>
		            <a href="javascript:void(0);">忘记密码？</a>
		          </div>
		        </div>        
		        <div class="regblock">
		          <div class="reginfo">
		            <label class="label"><span class="msg">* </span>验证码:</label>
		            <input id="rand" onfocus="$('#yanzheng').show();" style="width:60px;height: 20px;" type="text" name="rand" onkeypress="formKeyPress(event);"/>
		            <img src="${appPath}/rand.servlet" alt="验证码" id="yanzheng" height="20" style="display:inline;"/>
		          </div>
		        </div>       
		        <div class="regSubmit">
		          <input type="button" class="btnReg" value="登录" onclick="login();"/>&nbsp;还没有账号？点<a href="${appPath}/Register/reg.jsp">这里注册</a>
		          <br/>
		        </div>
		    </div>
			</form>
	      <div class="clear"></div>
	      <br />
	    </div>
	  </div>
	  <div class="clear"></div>
	</div>
	<!-- end正文框架 -->
	<jsp:include page="common/foot.jsp"></jsp:include>
</body>
</html>
