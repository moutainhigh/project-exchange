<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset==gbk" />
	<title>������ - ��������</title>	
	<link href="/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/css/mian.css" rel="stylesheet" type="text/css" />
	<link href="/css/member.css" rel="stylesheet" type="text/css" />
	<link href="/css/publish.css" rel="stylesheet" type="text/css" />
	<script src="/js/jquery.js" type="text/javascript"></script>
	<script src="/js/member.js" type="text/javascript"></script>
	<script type="text/javascript">
	</script>
	<#include "/WEB-INF/template/member/msg.ftl">
</head>
<body>
	<#include "/WEB-INF/template/include/head.ftl">
	<div id="mian">		
		<#include "/WEB-INF/template/include/member_nav.ftl">
		<!-- �������� -->
		<div class="body_content">
			<#include "/WEB-INF/template/include/member_left.ftl">
			<div class="publish_body">
			    <div class="publish_box">
			    	<div class="publish_box_title">
				   		<ul><li>��������</li></ul>
				   </div>
				   <div class="publish_box_content">
				   	<p class="ctr">��������ɹ���<a href="/member_publish.do">��������</a>�����߽���<a href="/member_taskList.do">���Ѿ������������б�</a></p>
			       </div>
			   </div>
			   <#include "/WEB-INF/template/member/frag/xieyi.ftl">
			</div>
		</div>
		<!-- ����������� -->
		<#include "/WEB-INF/template/include/foot.ftl">
	</div>
</body>
</html>