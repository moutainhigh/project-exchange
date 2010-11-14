<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<#include "/front/head.ftl"/>
		<link href="${base}/front/Themes/city.css" rel="stylesheet" type="text/css" />
	</head>

	<body>
		<#include "/front/top.ftl">
		<div class="wrapper">
			<div class="desc">
			一路发信息发布网是最具活力的、信息质量最高的中文分类信息网站，每天访问量上百万次。列表网可以帮助人们以最简单的方式发现和发布本地有价值的广告信息，诸如<strong>交友</strong>、<strong>租房</strong>、<strong>二手房</strong>、<strong>二手车</strong>、<strong>二手物品</strong>、<strong>宠物</strong>、<strong>招聘</strong>、<strong>生活服务</strong>及<strong>商务服务</strong>信息等等。列表网无需注册免费发布，让信息的沟通更加便捷。	下面请选择你所在的城市：
			</div>
			<div class="indextop" style="font-size:14px;">
				<span>
					热门城市:
					<#list hotCities as c>
					<a href="${base}/info/${c['pinyin']}">${c['name']}</a> 
					</#list>
				</span>
			</div>
			<table width="100%" cellspacing="0" cellpadding="0" border="0" align="center">
			<tbody>
				<#list allCities?keys as p>
				<tr class="ctp">
					<td class="ctp">${p}</td>
					<td class="ct">
						<#list allCities[p] as c>
						<a href="${base}/info/${c[2]}">${c[1]}</a> 
						</#list>						
					</td>
				</tr>
				</#list>
			</tbody>
			</table>
			<div class="clear"></div>
		</div>
		<#include "/front/foot.ftl">
	</body>
</html>

