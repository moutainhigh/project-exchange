<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<#include "/front/head.ftl"/>
		<link href="${base}/front/Themes/list.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<#include "/front/top.ftl">
		<div class="wrapper">
			<#include "/front/desc.ftl">
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

