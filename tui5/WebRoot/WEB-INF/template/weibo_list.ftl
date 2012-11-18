<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
	<title>推我网 - 微博任务大厅</title>	
	<link href="/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/css/mian.css" rel="stylesheet" type="text/css" />
	<link href="/css/weibo.css" rel="stylesheet" type="text/css" />
	<script src="/js/jquery.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function(){
			$('.nav_botttom a:eq(2)').addClass('now_a');
		});
	</script>
</head>
<body>
	<#include "/WEB-INF/template/include/head.ftl">
	<div id="mian">		
		<#include "/WEB-INF/template/include/nav.ftl">
		<!-- 内容区域 -->
		<div class="task_title">
			<ul>
				<li<#if !request.getParameter('wbType')?exists> class="focus"</#if>><a href="/weibo/">最新任务</a></li>
				<li<#if request.getParameter('wbType')==1> class="focus"</#if>><a href="/weibo/?wbType=1">新浪任务</a></li>
				<li<#if request.getParameter('wbType')==2> class="focus"</#if>><a href="/weibo/?wbType=2">腾讯任务</a></li>
				<li class="sort"><img src="/img/arrow2.gif"> <a href="/weibo/?sort=money">按任务金额排序</a></li>
				<li class="sort"><a href="/tasklist.html" title="悬赏任务大厅"><font color="#FF0000"><u>进入悬赏任务大厅</u></font></a></li>
			</ul>
		</div>
		<div class="list_top">
			<ul>
				<li class="tit_li1">任务编号</li>
				<li class="tit_li2">任务标题</li>
				<li class="tit_li3">悬赏金额</li>
				<li class="tit_li4">已发放金额</li>
				<li class="tit_li5">合格交稿数量</li>
				<li class="tit_li6">结束时间</li>
			</ul>
		</div>
		<div class="task_list">
			<#list pageBean.resultList as t>
			<ul class="ul_list" onmouseout="this.className='ul_list';$(this).find('.plusTask').hide()" onmouseover="this.className='ul_over';$(this).find('.plusTask').show()">
				<li class="list_li1">${t.id}</li>
			    <li class="list_li2"><a href="/weibo_${t.id}.html">${t.title}</a>&nbsp;&nbsp;<span class="plusTask none"><a target="_blank" href="/member_publish.do">发布类似任务</a></span></li>
				<li class="list_li3">${t.money?string.currency}</li>
				<li class="list_li4">&nbsp;￥${t.passMoney}</li>
				<li class="list_li5">&nbsp;${t.passGaojian}</li>
				<li class="list_li6">${t.leftHour}</li>
			</ul>
			</#list>
			<ul class="ul_list">
				<li class="pager">
					<#if pageBean.pageIndex gt 1><a href="/weibo/">首页</a></#if>
					<#if !pageBean.isFirstPage && pageBean.pageIndex gt 1><a href="/weibo/p${pageBean.pageIndex-1}">上一页</a></#if>
					<#if !pageBean.isLastPage><a href="/weibo/p${pageBean.pageIndex+1}">下一页</a></#if>
				</li>
			</ul>
		</div>
		<!-- 内容区域结束 -->
		<#include "/WEB-INF/template/include/foot.ftl">
	</div>
</body>
</html>