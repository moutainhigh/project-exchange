<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
	<title>推我网 - 任务大厅</title>	
	<link href="css/reset.css" rel="stylesheet" type="text/css" />
	<link href="css/mian.css" rel="stylesheet" type="text/css" />
	<link href="css/task_list.css" rel="stylesheet" type="text/css" />
	<script src="js/jquery.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function(){
			$('.nav_botttom a:eq(1)').addClass('now_a');
		});
	</script>
</head>
<body>
	<#include "/WEB-INF/template/include/head.ftl">
	<div id="mian">		
		<#include "/WEB-INF/template/include/nav.ftl">
		<!-- 内容区域 -->
		<div class="zw_leibie zw_leibie1">
	    	<h2 class="clearfix">
	        	<span>任务类别</span>
	        </h2>
	        <h3>网络推广</h3>
	        <p>
	        	<a href="javascript:void(0);">论坛发帖</a>
	        	<a href="javascript:void(0);">论坛发帖</a>
	        	<a href="javascript:void(0);">论坛发帖</a>
	        	<a href="javascript:void(0);">论坛发帖</a>
	        	<a href="javascript:void(0);">论坛发帖</a>
	        	<a href="javascript:void(0);">论坛发帖</a>
	        </p>
	        <h3>文案写作</h3>
	        <p>
	        	<a href="javascript:void(0);">软文写作</a>
	        	<a href="javascript:void(0);">软文写作</a>
	        	<a href="javascript:void(0);">软文写作</a>
	        	<a href="javascript:void(0);">软文写作</a>
	        </p>
	    </div>
	    
	    <div class="zw_leibie2 zw_leibie_zhiwei">
	    	<h2 class="clearfix">
	        	<span>任务列表</span>
	            <a href="#" class="now_Aaa">最新任务</a>
	            <a href="#">500元以上的任务</a>
	            <a href="#">500元以下的任务</a>
	            <a href="#">结束任务</a>
	            <a href="#">按金额排序</a>
	            <a href="#">按发布日期排序</a>
	        </h2>
	        <div class="task_list">
				<ul class="title2">
				  <li class="li1">编号ID</li>
				  <li class="li2">任务标题</li>
				  <li class="li5">金额</li>
				  <li class="li4">需要稿件</li>
				  <li class="li8">已合格稿件</li>
				  <li class="li3">未审稿件</li>
				  <li class="li6">结束时间</li>
				  <li class="line2"></li>
				</ul>
				<ul class="ul_list" onmouseout="hideTask(61914);this.className='ul_list';" onmouseover="showTask(61914);this.className='ul_over';">
					<li class="li1">61914</li>
				    <li class="li2"><span class="plusTask" style="display: none;" id="plusTask_61914"><a target="_blank" href="http://www.sandaha.com/task/task_plus.asp?TaskID=61914"></a></span><a title="百度知道只回答不提问" target="_blank" href="http://www.sandaha.com/task/Detail_61914.html">百度知道只回答不提问</a>&#12288;</li>
					<li class="li5">￥500</li>
					<li class="li4">500</li>
					<li class="li8">0</li>
					<li class="li8">505</li>
					<li class="li6">6天19小时</li>
				</ul>
				<ul class="ul_list" onmouseout="hideTask(61906);this.className='ul_list';" onmouseover="showTask(61906);this.className='ul_over';">
					<li class="li1">61906</li>
				    <li class="li2"><span class="plusTask" style="display: none;" id="plusTask_61906"><a target="_blank" href="http://www.sandaha.com/task/task_plus.asp?TaskID=61906"></a></span><a title="在百度，发布50问，50答，问答都含关键词" target="_blank" href="http://www.sandaha.com/task/Detail_61906.html">在百度，发布50问，50答，问答都含关键词</a>&#12288;</li>
					<li class="li5">￥500</li>
					<li class="li4">200</li>
					<li class="li8">0</li>
					<li class="li8">0</li>
					<li class="li6">4天18小时</li>
				</ul>
			</div>
	        
	    </div>
		<!-- 内容区域结束 -->
		<#include "/WEB-INF/template/include/foot.ftl">
	</div>
</body>
</html>