<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<#include "/front/head.ftl"/>
		<link href="${base}/front/Themes/city.css" rel="stylesheet" type="text/css" />
	</head>

	<body>
		<#include "/front/top.ftl">
		<div class="wrapper">
			<#include "/front/desc.ftl">
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

