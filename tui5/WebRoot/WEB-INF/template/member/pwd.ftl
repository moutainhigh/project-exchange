<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset==gbk" />
	<title>������ - �޸�����</title>	
	<link href="/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/css/mian.css" rel="stylesheet" type="text/css" />
	<link href="/css/member.css" rel="stylesheet" type="text/css" />
	<script src="/js/jquery.js" type="text/javascript"></script>
	<script src="/js/member.js" type="text/javascript"></script>
	<script type="text/javascript">
		function submitForm(){
			var password = $('#pwd').val().replace(/\s*/, "");
			if (password == "") {//����Ϊ��	
				alert('���벻��Ϊ��');
				return false;
			} else if(!/^.{6,16}$/.test(password)) {//6-16�ַ�
				alert('����Ϊ6-16�ַ�');
				return false;
			} else if(/^(.)\1*$/.test(password) || password=='123456' || password=='12345678') {//���ڼ�
				alert('���벻�ܹ��ڼ�');
				return false;
			} else{
				var password2 = $('#pwd2').val().replace(/\s*/, "");
				if(password2 != password){
					alert('�������벻һ��');
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
				   		<form action="/member_pwd.do" method="post">
					   <table class="task_tble" border="0" cellspacing="1">
						   <tr>
						   		<td>�û���</td>
						   		<td>${userObj.userId}</td>
						   </tr>
						   <tr>
						   		<td>������</td>
						   		<td><input type="password" name="oldpwd" value=""/></td>
						   </tr>
						   <tr>
						   		<td>������</td>
						   		<td><input type="password" name="pwd" value="" id="pwd"/></td>
						   </tr>
						   <tr>
						   		<td>ȷ��������</td>
						   		<td><input type="password" name="pwd2" value="" id="pwd2"/></td>
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