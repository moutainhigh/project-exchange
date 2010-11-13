<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<#include "/front/head.ftl"/>
		<link href="${base}/front/Themes/publish.css" rel="stylesheet" type="text/css" />
	</head>

	<body>
		<#include "/front/top.ftl">
		<div class="all">
			<#include "/front/pos.ftl">
			<!--1：城市选择-->
			<div id="step">
				<ul>
					<li class="step-active">
						1 选择城市
					</li>
					<li class="step-pre">
						<span>2</span> 一分类选择
					</li>
					<li class="step-pre">
						<span>3</span> 二分类选择
					</li>
					<li class="step-pre">
						<span>4</span>地区选择
					</li>
					<li class="step-pre">
						<span>5</span>信息填写
					</li>
					<div class="cleardiv"></div>
				</ul>
			</div>
			<!--1：城市选择-->

			<div class="cleardiv"></div>

			<!--城市选择-->
			<div class="left">
				<div id="select-city">
					<dl>
						<dt style="font-weight: normal; color: rgb(153, 153, 153);">
							以下选择您要进入的城市,按照省份排序!其他城市陆续开通...
						</dt>
						<dd>
							<div class="zm-name">
								热门
							</div>
							<div class="zm-content">
								<#list hotCities as c>
								<a title="${c['name']}分类信息" href="${base}/user/publish/city/${c['entityId']}">${c['name']}</a> 
								</#list>
							</div>
							<div style="clear: both;"></div>
						</dd>
						<#list areaMap?keys as a>
						<dd>
							<div class="zm-name">
								${a}
							</div>
							<div class="zm-content">
								<#list areaMap[a] as c>
								<a title="${c.name}分类信息" href="${base}/user/publish/city/${c.id}.htm">${c.name}</a>
								</#list>
							</div>
							<div style="clear: both;"></div>
						</dd>
						</#list>
					</dl>
				</div>
			</div>
			<!--/城市选择-->
		</div>
		<#include "/front/foot.ftl">
	</body>
</html>

