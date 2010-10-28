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
					<li class="step-pre">
						<span>1</span> 
						<#if pub_list[0]??>
						<a href="${base}/user/publish/index.htm">${pub_list[0][1]}</a>
						<#else>
						选择城市
						</#if>
					</li>
					<li class="step-active">
						2 一分类选择
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

			<!--一级类别选择-->
			<div class="left">
				<div id="select-city">
				    <dl>
				    <dt>请选择发布信息的类别： </dt>
				    <dd>
				    <#list cateList as c>
				    <a rel="nofollow" href="${base}/user/publish/cate1/${c.id}.htm">${c.name}</a><br>
				    </#list>    
				    </dd>   
				    </dl>
				</div>
			</div>
			<!--/一级类别选择-->
		</div>
		<#include "/front/foot.ftl">
	</body>
</html>

