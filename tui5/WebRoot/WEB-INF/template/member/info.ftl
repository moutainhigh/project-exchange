<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset==gbk" />
	<title>������ - ��Ա����</title>	
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
	<!-- ����������� -->
	<div id="mian">		
		<#include "/WEB-INF/template/include/member_nav.ftl">
		<!-- �������� -->
		<div class="body_content">
			<#include "/WEB-INF/template/include/member_left.ftl">
			<div class="list_body">
			    <div class="list_box">
			       <div class="list_box_title">
				   		<ul><li>�ҵ�����</li></ul>
				   </div>
				   <div class="list_box_content">
				   		<form action="/member_saveInfo.do" method="post">
					   <table class="task_tble" border="0" cellspacing="1">
						   <tr>
						   		<td>�û���</td>
						   		<td>${userObj.userId}</td>
						   </tr>
						   <tr>
						   		<td>����</td>
						   		<td><input type="input" name="userName" value="${userObj.userName}"/></td>
						   </tr>
						   <tr>
						   		<td>�Ա�</td>
						   		<td><input type="radio" name="userSex" value="��" <#if userObj.userSex=='��'>checked="checked"</#if>/>��&nbsp;&nbsp;&nbsp;&nbsp;
						   		<input type="radio" name="userSex" value="Ů" <#if userObj.userSex=='Ů'>checked="checked"</#if>/>Ů
						   		</td>
						   </tr>
						   <tr>
						   		<td>�ֻ�����</td>
						   		<td><input type="input" name="userMobile" value="${userObj.userMobile}"/></td>
						   </tr>
						   <tr>
						   		<td>QQ</td>
						   		<td><input type="input" name="userQq" value="${userObj.userQq}"/></td>
						   </tr>
					   </table>
					   <p class="ctr_btn"><input type="button" class="button" value="����" name="button" onclick="submitForm();"></p>
					   </form>
			       </div>
			   </div>
			</div>
		</div>
		<!-- ����������� -->
		<#include "/WEB-INF/template/include/foot.ftl">
	</div>
</body>
</html>