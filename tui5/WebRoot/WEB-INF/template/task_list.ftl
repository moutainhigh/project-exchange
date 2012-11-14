<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
	<title>推我网 - 任务大厅</title>	
	<link href="/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/css/mian.css" rel="stylesheet" type="text/css" />
	<link href="/css/task_list.css" rel="stylesheet" type="text/css" />
	<script src="/js/jquery.js" type="text/javascript"></script>
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
	        <#list topTypeList as tt>
	        <h3>${tt.name}</h3>
	        <p>
	        	<#list tt.childs as t>
	        	<a href="/tasklist_${t.pinyin}.html" class="<#if typepinyin==t.pinyin>curr_type</#if>">${t.name}</a>
	        	</#list>
	        </p>
	        </#list>
	    </div>
	    
	    <div class="zw_leibie2 zw_leibie_zhiwei">
	    	<h2 class="clearfix">
	        	<span>任务列表</span>
	            <a href="/tasklist.html" class="now_Aaa">最新任务</a>
	            <a href="javascript:;">500元以上的任务</a>
	            <a href="javascript:;">500元以下的任务</a>
	            <a href="javascript:;">结束任务</a>
	            <a href="javascript:;">按金额排序</a>
	            <a href="javascript:;">按发布日期排序</a>
	        </h2>
	        <div class="task_list">
				<ul class="title2">
				  <li class="li1">编号ID</li>
				  <li class="li2">任务标题</li>
				  <li class="li5">金额</li>
				  <li class="li4">需要稿件</li>
				  <li class="li8">已合格稿件</li>
				  <li class="li6">结束时间</li>
				  <li class="line2"></li>
				</ul>
				<#list pageBean.resultList as t>
				<ul class="ul_list" onmouseout="this.className='ul_list';$(this).find('.plusTask').hide()" onmouseover="this.className='ul_over';$(this).find('.plusTask').show()">
					<li class="li1">${t.id}</li>
				    <li class="li2"><a href="/task_${t.id}.html">${t.title}</a>&nbsp;&nbsp;<span class="plusTask none"><a target="_blank" href="/member_publish.do">发布类似任务</a></span></li>
					<li class="li5">${t.money?string.currency}</li>
					<li class="li4">${t.gaojianMount}</li>
					<li class="li8">${t.passGaojian}</li>
					<li class="li6">${t.leftHour}</li>
				</ul>
				</#list>
				<ul class="ul_list">
					<li class="pager">
						<#if pageBean.pageIndex gt 1><a href="/tasklist<#if typepinyin?exists>${'_'+typepinyin}</#if>.html">首页</a></#if>
						<#if !pageBean.isFirstPage && pageBean.pageIndex gt 1><a href="/tasklist<#if typepinyin?exists>${'_'+typepinyin}</#if>.html?pageIndex=${pageBean.pageIndex-1}">上一页</a></#if>
						<#if !pageBean.isLastPage><a href="/tasklist<#if typepinyin?exists>${'_'+typepinyin}</#if>.html?pageIndex=${pageBean.pageIndex+1}">下一页</a></#if>
					</li>
				</ul>
			</div>
	    </div>
		<!-- 内容区域结束 -->
		<#include "/WEB-INF/template/include/foot.ftl">
	</div>
</body>
</html>