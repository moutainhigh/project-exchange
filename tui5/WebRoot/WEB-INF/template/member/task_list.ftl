<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset==gbk" />
	<title>推我网 - 会员中心</title>	
	<link href="/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/css/mian.css" rel="stylesheet" type="text/css" />
	<link href="/css/member.css" rel="stylesheet" type="text/css" />
	<script src="/js/jquery.js" type="text/javascript"></script>
	<script src="/js/member.js" type="text/javascript"></script>
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
					   <table class="task_tble" border="0" cellspacing="1">
						   <tr>
						   		<th>编号</th>
						   		<th>名称</th>
						   		<th>时间</th>
						   		<th>操作</th>
						   </tr>
						   <tr>
						   		<td>1</td>
						   		<td>2</td>
						   		<td>333</td>
						   		<td>中文</td>
						   </tr>
						   <tr>
						   		<td>2</td>
						   		<td>2</td>
						   		<td>333</td>
						   		<td>中文</td>
						   </tr>
					   </table>
			       </div>
			   </div>
			</div>
		</div>
		<!-- 内容区域结束 -->
		<#include "/WEB-INF/template/include/foot.ftl">
	</div>
</body>
</html>