<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset==gbk" />
	<title>推我网 - 修改密码</title>	
	<link href="/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/css/mian.css" rel="stylesheet" type="text/css" />
	<link href="/css/member.css" rel="stylesheet" type="text/css" />
	<script src="/js/jquery.js" type="text/javascript"></script>
	<script src="/js/member.js" type="text/javascript"></script>
	<script type="text/javascript">
		function submitForm(){
			var password = $('#pwd').val().replace(/\s*/, "");
			if (password == "") {//不能为空	
				alert('密码不能为空');
				return false;
			} else if(!/^.{6,16}$/.test(password)) {//6-16字符
				alert('密码为6-16字符');
				return false;
			} else if(/^(.)\1*$/.test(password) || password=='123456' || password=='12345678') {//过于简单
				alert('密码不能过于简单');
				return false;
			} else{
				var password2 = $('#pwd2').val().replace(/\s*/, "");
				if(password2 != password){
					alert('两次密码不一致');
					return false;
				}else{
					$('form').submit();
				}
			}			
		}
	</script>
	<#include "/WEB-INF/template/include/msg.ftl">
</head>
<body>
	<#include "/WEB-INF/template/include/head.ftl">
	<!-- 顶部区域结束 -->
	<div id="mian">		
		<#include "/WEB-INF/template/include/member_nav.ftl">
		<!-- 内容区域 -->
		<div class="body_content">
			<#include "/WEB-INF/template/include/member_left.ftl">
			<div class="list_body">
			    <div class="list_box">
			       <div class="list_box_title">
				   		<ul><li>我的任务</li></ul>
				   </div>
				   <div class="list_box_content">
				   		<form action="/member_pwd.do" method="post">
					   <table class="task_tble" border="0" cellspacing="1">
						   <tr>
						   		<td>用户名</td>
						   		<td>${userObj.userId}</td>
						   </tr>
						   <tr>
						   		<td>老密码</td>
						   		<td><input type="password" name="oldpwd" value=""/></td>
						   </tr>
						   <tr>
						   		<td>新密码</td>
						   		<td><input type="password" name="pwd" value="" id="pwd"/></td>
						   </tr>
						   <tr>
						   		<td>确认新密码</td>
						   		<td><input type="password" name="pwd2" value="" id="pwd2"/></td>
						   </tr>
					   </table>
					   <p class="ctr_btn"><input type="button" class="button" value="保存" name="button" onclick="submitForm();"></p>
					   </form>
			       </div>
			   </div>
			</div>
		</div>
		<!-- 内容区域结束 -->
		<#include "/WEB-INF/template/include/foot.ftl">
	</div>
</body>
</html>