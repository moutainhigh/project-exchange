<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<#include "/front/head.ftl"/>
		<link href="${base}/front/Themes/page.css" rel="stylesheet" type="text/css" />
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
				<div class="content">
					<h2>${info.title}</h2>
					<div class="info_time">
						<span>更新日期: ${info.publishDate?string('yyyy-MM-dd')}</span>
						<span>信息编号: ${info.id}</span>
					</div>
					<div class="info">
						<ul>
							<li><span>位置：</span> <a href="#">${info.area.parent.name}</a> &gt;&gt; <a href="#">${info.area.name}</a></li>
							<li><span>类别：</span> <a href="#">${info.cate.parent.name}</a> &gt;&gt; <a href="#">${info.cate.name}</a></li>
							<li><span>联系Email：</span> <span>${info.email}</span></li>
							<li><span>联系电话：</span> <span>${info.tel}</span></li>
							<li><span>联系QQ：</span> <span>${info.qq}</span></li>
							<li class="lastLi"><a href="#">刷新</a> | <a href="#">我要举报</a> | <a href="#">推荐给好友</a></li>
						</ul>
						<div class="ad">
							<#if info.image??>
								<img src="${base}/upload/${info.image}" width="250px" height="160px;"/>
							<#else>
								广告
							</#if>
						</div>
						<div class="clear"></div>
					</div>
					<p class="c-content">
						${info.content}
					    <hr/>    <br/>
					     非诚勿扰，联系我时请说明是在【${appTitle}】看到的，谢谢！<br/>
					    <br>
					    <font style="color: rgb(255, 102, 0);">一路发信息发布网提示您：凡是涉及到个人利益、隐私等信息均应谨慎对待</font>
   					</p>
   					<br/>
   					<h3>“${info.title}”相关信息：</h3>
   					<p class="c-list-l">      
   						<#list relateInfos as info>
						<a title="${info.title}" target="_blank" class="c-list-title" href="${base}/info/all/${info.cate.pinyin}/${info.id}">${info.title}</a><br>
						<span><#if info.content?length<=100>${info.content}<#else>${info.content?substring(0,100)}...</#if></span>
						</#list>
					</p>
				</div>
			</div>
			<div id="right" class="right">
				<div id="hot-cate">
					<div class="hot-cate-n">
						更多城市${info.cate.name}信息
					</div>
					<ul>
						<#list hotCities as c>
						<li>
							<a target="_blank" title="${c.name}${info.cate.name}" href="${base}/info/${c.pinyin}/${info.cate.parent.pinyin}">${c.name}${info.cate.name}</a>
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

