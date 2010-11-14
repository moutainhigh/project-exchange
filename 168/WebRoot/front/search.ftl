<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<#include "/front/head.ftl"/>
		<link href="${base}/front/Themes/list.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<#include "/front/top.ftl">
		<div class="wrapper">
			<div class="desc">
				一路发信息发布网是最具活力的、信息质量最高的中文分类信息网站，每天访问量上百万次。列表网可以帮助人们以最简单的方式发现和发布本地有价值的广告信息，诸如
				<strong>交友</strong>、
				<strong>租房</strong>、
				<strong>二手房</strong>、
				<strong>二手车</strong>、
				<strong>二手物品</strong>、
				<strong>宠物</strong>、
				<strong>招聘</strong>、
				<strong>生活服务</strong>及
				<strong>商务服务</strong>信息等等。列表网无需注册免费发布，让信息的沟通更加便捷。 下面请选择你所在的城市：
			</div>
			<div class="left">
				<#include "/front/pos.ftl">
				<!--l_content-->
				<div id="c-list">
					<p class="c-list-l">
						<#list pageBean.resultList as info>
						<a class="c-list-title" target="_blank" title="${info.title}" href="${base}/info/all/${info.cate.pinyin}/${info.id}"> ${info.title}</a><font>${info.publishDate?string('yyyy-MM-dd')}</font>
						<br>
						<span>概要:<#if info.content?length<=100>${info.content}<#else>${info.content?substring(0,100)}...</#if></span>
						</#list>
					<div class="clear"></div>
					</p>
					<!--分页-->
					<#if pageBean.totalRow &lt; 0>
					<div id="next-page">
						<div class="next-l">
							每页${pageBean.rowPerPage }条 共${pageBean.totalRow }条 当前第${pageBean.pageIndex }/${pageBean.maxPage }页
							<#if !pageBean.isFirstPage>
							<a href="javascript:gotoPage(1);">[首页]</a>
							<a href="javascript:gotoPage(${pageBean.prePageIndex });">[前一页]</a>
							</#if>
							<#if !pageBean.isLastPage>
							<a href="javascript:gotoPage(${pageBean.nextPageIndex });">[后一页]</a>
							<a href="javascript:gotoPage(${pageBean.maxPage });">[尾页]</a>
							</#if>
						</div>
					</div>
					</#if>
				</div>
			</div>
			<div id="right" class="right" style="border-left:1px solid gray;min-height:300px;margin-left:5px;width:250px;">
				<div id="hot-cate">
					<div style="padding-left:10px;">
						<#if keywords??>
						<a href="http://www.google.com.hk/search?hl=zh-CN&source=hp&q=${keywords}&aq=f&aqi=&aql=&oq=&gs_rfai=">在google里搜索<span>${keywords}</span></a>
						</#if>
					</div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<#include "/front/foot.ftl">
	</body>
</html>

