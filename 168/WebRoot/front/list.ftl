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
					<h1>
						<#if currCity??>${currCity.name}<#else>全国</#if>${cate.name?default('')}
					</h1>
					<p class="c-list-t">
						以下是 <b><#if currCity??>${currCity.name}<#else>全国</#if>${cate.name?default('')}</b> 信息，如果您没有找到您要的信息，您可以尝试翻页查找。
					</p>
					<div id="top">
						<a style="color: rgb(255, 0, 0);" class="top-list-title" target="_blank" title="用户公告" href="/beijing/jiazhengfuwu/a2366498.html"> <img border="0" src="Themes/images/top.jpg" />用户公告</a>
						<br>
						<span> 1.88客中所有带有"官方"图案的信息都是我们为您提... ( <a title="北京宣武家政服务|北京宣武家政公司" style="font-size: 12px; color: rgb(153, 153, 153); text-decoration: none;" href="/xuanwu/jiazhengfuwu/"> 宣武家政</a> )<font>2010-10-12
								14:17:22</font> </span>

						<a style="color: rgb(255, 0, 0);" class="top-list-title" target="_blank" title="我想找份仓管工作" href="/chengdu/wuliu/a2584581.html"><img border="0" src="Themes/images/top.jpg" />我想找份仓管工作</a>
						<br>
						<span> 我很喜欢这份工作,请给我这次学习机会.谢谢.我手机号是15984310420.如果看到我请跟我联系. ( <a title="成都双流招聘仓库管理员|成都双流仓库管理招聘网" style="font-size: 12px; color: rgb(153, 153, 153); text-decoration: none;"
							href="/shuangliu/zhaopincangguan/"> 双流仓库管理员</a> )<font>2010-10-10 15:19:12</font> </span>
					</div>

					<p class="c-list-l">
						<#list pageBean.resultList as info>
						<a class="c-list-title" target="_blank" title="${info.title}" href="${base}/info/${cityPinyin}/${catePinyin}/${info.id}"> ${info.title}</a><font>${info.publishDate?string('yyyy-MM-dd')}</font>
						<br>
						<span>概要:<#if info.content?length<=100>${info.content}<#else>${info.content?substring(0,100)}...</#if></span>
						</#list>
					<div class="clear"></div>
					</p>
					<!--tags-->
					<div id="tags">
						<#if currCity??>
						<!--地区-->
						<ul class="tags-diqu">
							<li class="tags-n">
								地区：
							</li>
							<li class="tags-t">
								<a title="" href="${base}/info/all/${catePinyin}">全国</a>
								<a title="" href="${base}/info/${currCity.pinyin}/${catePinyin}">全市</a>
								<#list areaInCity as area>
								<a title="" href="${base}/info/${area.pinyin}/${catePinyin}">${area.name}</a>
								</#list>
							</li>
						</ul>
						<div class="clear"></div>
						</#if>
						<!--地区-->
						<!--关键字-->
						<ul class="tags-keywords">
							<li style="line-height: 22px;" class="tags-n">
								关键字：
							</li>
							<li class="tags-t">
								<input type="text" class="input-search" value="" id="keyword" name="keyword">
								<input type="button" value="搜索" name="s" onClick="$('#keywords').val($('#keyword').val());search('${base}');">
							</li>
						</ul>
						<div class="clear"></div>
					</div>
					<!--tags-->
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
			<div id="right" class="right">
				<div id="hot-cate">
					<div class="hot-cate-n">
						更多城市${cate.name}信息
					</div>
					<ul>
						<#list hotCities as c>
						<li>
							<a target="_blank" title="${c.name}${cate.name}" href="${base}/info/${c.pinyin}/${cate.pinyin}">${c.name}${cate.name}</a>
						</li>
						</#list>
						<div class="clear"></div>
					</ul>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<#include "/front/foot.ftl">
	</body>
</html>

