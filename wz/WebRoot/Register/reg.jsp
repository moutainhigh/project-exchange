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
	    function reg() {
			var username = $('#username').val();
			var password = $('#password').val();
			var repassword = $('#repassword').val();
			var nick = $('#nick').val();
			var rand = $('#rand').val();
			var kind = $('#userKind').val();
			if (username == '' || password == '' || rand == '' || nick == '') {
				alert('请输入账号、昵称、密码、邮箱，以及验证码!');
				return;
			}
			if(kind==null || kind == ''){
				alert('请选择您的用户类型!');
				return;
			}
			if(password != repassword){
				alert('两次密码输入不一致!');
				return;
			}
			if($("input:checked").length == 0){
				alert('请同意服务协议!');
				return;
			}
			$('form').submit();
		}
		function formKeyPress(event){
			if(event.keyCode == 13){
				reg();
			}else{
				return false;
			}
		}
    </script>
</head>
<body>
	<jsp:include page="../common/head.jsp"></jsp:include>
    <!---- begin正文框架 ---->
	<div class="wrapper mauto">
	  <div class="section" style="border-width: 3px;">
	    <div class="ptitle">
	      <div class="icon">用户注册</div>
	    </div>
	    <div class="regist pad_30">
			<div class="fl w322 hide pad_r10 bsr_gray">
			  <p class="yahei ft18 blue fb bdb_gray mar_t3 pad_b10"> 注册兼职吧网赚中心，能做什么？</p>
			  <p class="dot1 mar_t10 ft14 fb yellow_ef yahei">我要悬赏</p>
			  <p class="mar_t3 pad_l10">更低的成本，更多的选择；</p>
			  <p class="dot1 mar_t10 ft14 fb yellow_ef yahei">我要赚钱</p>
			  <p class="mar_t3 pad_l10">能力变现，有本事你就来！</p>
			  <p class="mar_t20"> <img src="Themes/images/register_ad.jpg" width="320" height="124" /></p>
			</div>
			<form action="${appPath}/reg" method="post">
			<div class="regInfos border_l1">
				<jsp:include page="../msg.jsp"></jsp:include>
				<div class="regblock">
		          <div class="reginfo">
		            <label class="label"><span class="msg">* </span>用户类型:</label>
		            &nbsp;&nbsp;&nbsp;&nbsp;
		            <select name="user.userKind" id="userKind">
		            	<option value="0">我是威客</option>
		            	<option value="1">我是商家</option>
		            </select>
		          </div>
		          <div class="form-tip loading">
		            <p>用户类型。</p>
		          </div>
		        </div>
		        <div class="regblock">
		          <div class="reginfo">
		            <label class="label"><span class="msg">* </span>登录名:</label>
		            <input class="textbox" type="text" name="user.userId" id="username" value="${param['user.userId'] }"/>
		          </div>
		          <div class="form-tip loading">
		            <p>用于系统登录，(3-12个字:包括英文字母、数字或下划线)。</p>
		          </div>
		        </div>
		        <div class="regblock">
		          <div class="reginfo">
		            <label class="label"><span class="msg">* </span>昵称:</label>
		            <input class="textbox" type="text" name="user.userName" id="nick" value="${param['user.userName'] }"/>
		          </div>
		          <div class="form-tip loading">
		            <p>用户在本网的名称</p>
		          </div>
		        </div>
		        <div class="regblock">
		          <div class="reginfo">
		            <label class="label"><span class="msg">* </span>E-mail:</label>
		            <input class="textbox" type="text" name="user.userEmail" id="email" value="${param['user.userEmail'] }"/>
		          </div>
		          <div class="form-tip loading">
		            <p>用来取回密码，绝不对外公开。</p>
		          </div>
		        </div>
		        <div class="regblock">
		          <div class="reginfo">
		            <label class="label"><span class="msg">* </span>密码:</label>
		            <input class="textbox" type="password" name="user.userPassword" id="password"/>
		          </div>
		          <div class="form-tip loading">
		            <p>最少6个字符</p>
		          </div>
		        </div>
		        <div class="regblock">
		          <div class="reginfo">
		            <label class="label"><span class="msg">* </span>确认密码:</label>
		            <input class="textbox"  type="password" id="repassword"/>
		          </div>
		          <div class="form-tip loading">
		            <p>最少6个字符</p>
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
		          <input type="button" class="btnReg" value="注册" onclick="reg();"/>
		          <br/>
		          <label>
		          <input type="checkbox" checked="checked"/>
		            &nbsp;我已阅读并同意</label>
		          <span><a href="javascript:void(0);">兼职吧网赚中心服务协议</a></span> 
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
	   
	<jsp:include page="../common/foot.jsp"></jsp:include>

</body>
</html>
