<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<#include "/front/head.ftl"/>
		<link href="${base}/front/Themes/list.css" rel="stylesheet" type="text/css" />
		<script>
			function showMoreArea(){
				$('#moreAreaLink').hide();
				$('#area div:first').css({'height':'60px','border':'1px solid black','background':'#F7FBFF'});
				$('#area ul').eq(0).css({'width':'auto'});
				$('#area ul').eq(0).append('<li><a style="color:red" href="javascript:closeArea();">关闭</a></li>');
			}
			function closeArea(){
				$('#moreAreaLink').show();
				$('#area div:first').css({'height':'23px','border':'0'});
				$('#area ul').eq(0).css({'width':'400px'});
				$('#area ul:first li:last').remove();
			}
		</script>
	</head>
	<body>
		<#include "/front/top.ftl">
		<div class="wrapper">
			<#include "/front/desc.ftl">
			<div class="left">
				<#include "/front/pos.ftl">
				<!--l_content-->
				<div id="c-list">
					<!--tags-->
					<div id="tags">
						<!--关键字-->
						<div class="tags-keywords">
							<li style="line-height: 22px;" class="tags-n">
								关键字：
							</li>
							<li class="tags-t">
								<input type="text" class="input-search" value="" id="keyword" name="keyword">
								<input type="button" value="搜索" name="s" onClick="$('#keywords').val($('#keyword').val());search('${base}');">
							</li>
						</div>
						<!--地区-->
						<div id="area" style="width:650px;height:25px;float:left;margin-bottom:10px;">
							<div style="height:23px;overflow:hidden;padding:10px 0 0 5px;position:absolute;z-index:200;">
								<div style="width:600px;">
									<ul style="float:left;position:absolute;width:400px;">
										<li style="line-height: 22px;text-align:left;" class="tags-n">选择地区：</li>
										<li><a title="" href="${base}/info/all/${catePinyin}">全国</a></li>
										<#if currCity??>
										<li><a title="" href="${base}/info/${currCity.pinyin}/${catePinyin}">全市</a></li>
										</#if>
										<#list areaInCity as area>
										<li><a title="" href="${base}/info/${area.pinyin}/${catePinyin}">${area.name}</a></li>
										</#list>
									</ul>
									<ul id="moreAreaLink" style="float:left;height:23px;line-height:23px;padding-left:5px;position:absolute;left:380px;width:30px;">
										<li><a href="javascript:showMoreArea();">更多</a></li>
									</ul>
								</div>
							</div>
						</div>
						<!--地区-->
						<div class="clear"></div>
					</div>
					<!--tags-->
					<h1>
						<#if currCity??>${currCity.name}<#else>全国</#if>${cate.name?default('')}
					</h1>
					<p class="c-list-t">
						以下是 <b><#if currCity??>${currCity.name}<#else>全国</#if>${cate.name?default('')}</b> 信息，如果您没有找到您要的信息，您可以尝试翻页查找。
					</p>
					<div id="top">
						<#list topInfoList as info>
						<a style="color: rgb(255, 0, 0);" class="top-list-title" target="_blank" title="${info.title}" href="${base}/info/${cityPinyin}/${catePinyin}/${info.id}.htm"> <img border="0" src="${base}/front/Themes/images/top.jpg" />${info.title}</a>
						<br>
						<span><#if info.content?length<=100>${info.content}<#else>${info.content?substring(0,100)}...</#if><font>${info.publishDate?string('yyyy-MM-dd hh-mm-ss')}</font> </span>
						</#list>
					</div>

					<p class="c-list-l">
						<#list pageBean.resultList as info>
						<a class="c-list-title" target="_blank" title="${info.title}" href="${base}/info/${cityPinyin}/${catePinyin}/${info.id}.htm"> ${info.title}</a><font>${info.publishDate?string('yyyy-MM-dd')}</font>
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
				<div id="hot-cate">
					<div class="hot-cate-n">
						广告预留
					</div>
					<ul>
						广告。。。
					</ul>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<#include "/front/foot.ftl">
	</body>
</html>

