<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset==gbk" />
	<title>推我网 - 会员资料</title>	
	<link href="/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/css/mian.css" rel="stylesheet" type="text/css" />
	<link href="/css/member.css" rel="stylesheet" type="text/css" />
	<script src="/js/jquery.js" type="text/javascript"></script>
	<script src="/js/member.js" type="text/javascript"></script>
	<script type="text/javascript">
		function submitForm(){
			$('form').submit();
		}
	</script>
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
				   		<form action="/member_saveInfo.do" method="post">
					   <table class="task_tble" border="0" cellspacing="1">
						   <tr>
						   		<td>用户名</td>
						   		<td>${userObj.userId}</td>
						   </tr>
						   <tr>
						   		<td>姓名</td>
						   		<td><input type="input" name="userName" value="${userObj.userName}"/></td>
						   </tr>
						   <tr>
						   		<td>性别</td>
						   		<td><input type="radio" name="userSex" value="男" <#if userObj.userSex=='男'>checked="checked"</#if>/>男&nbsp;&nbsp;&nbsp;&nbsp;
						   		<input type="radio" name="userSex" value="女" <#if userObj.userSex=='女'>checked="checked"</#if>/>女
						   		</td>
						   </tr>
						   <tr>
						   		<td>手机号码</td>
						   		<td><input type="input" name="userMobile" value="${userObj.userMobile}"/></td>
						   </tr>
						   <tr>
						   		<td>QQ</td>
						   		<td><input type="input" name="userQq" value="${userObj.userQq}"/></td>
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