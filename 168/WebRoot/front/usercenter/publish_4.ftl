<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<#include "/front/head.ftl"/>
		<link href="${base}/front/Themes/publish.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src=""></script>
	</head>

	<body>
		<#include "/front/top.ftl">
		<div class="all">
			<div id="postion">
				您的位置：
				<a title="88客网" href="/">88客网</a> &gt;&gt; 选择城市页面
			</div>
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
					<li class="step-pre">
						<span>2</span> 
						<#if pub_list[1]??>
						<a href="${base}/user/publish/city/${pub_list[0][0]}.htm">${pub_list[1][1]}</a>
						<#else>
						一分类选择
						</#if>
					</li>
					<li class="step-pre">
						<span>3</span> 
						<#if pub_list[2]??>
						<a href="${base}/user/publish/cate1/${pub_list[1][0]}.htm">${pub_list[2][1]}</a>
						<#else>
						二分类选择
						</#if>
					</li>
					<li class="step-active">
						4 地区选择
					</li>
					<li class="step-pre">
						<span>5</span>信息填写
					</li>
					<div class="cleardiv"></div>
				</ul>
			</div>
			<!--1：城市选择-->

			<div class="cleardiv"></div>

			<!--二级类别选择-->
			<div class="left">
				<div id="select-city">
				    <dl>
				    <dt>请选择你所在地区(<a href="${base}/user/publish/area.htm">跳过</a>)： </dt>
				    <dd>
				    <#list areaList as a>
				    <a rel="nofollow" href="${base}/user/publish/area/${a.id}.htm">${a.name}</a><br>
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

