<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset==gbk" />
	<title>������ - �ύ���</title>	
	<link href="/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/css/mian.css" rel="stylesheet" type="text/css" />
	<link href="/css/member.css" rel="stylesheet" type="text/css" />
	<script src="/js/jquery.js" type="text/javascript"></script>
	<script src="/js/member.js" type="text/javascript"></script>
	<script src="/ckeditor/ckeditor.js" type="text/javascript"></script>
	<script type="text/javascript">
		function submitForm(){
			
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
				   		<ul><li>�ύ���</li></ul>
				   </div>
				   <div class="list_box_content">
				   		<p>${msg}����<a href="/member_submitGaojian.do?task.id=${task.id}">����</a>�ٴ��ύ�����</p>
			       </div>
			   </div>
			</div>
		</div>
		<!-- ����������� -->
		<#include "/WEB-INF/template/include/foot.ftl">
	</div>
</body>
</html>