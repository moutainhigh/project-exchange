<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${city.simpleName}兼职工作在线招聘 -兼职吧</title>
		<meta name="keywords" content='${city.simpleName}兼职工作' />
		<meta name="description" content="兼职吧免费为您提供${city.simpleName}地区的兼职工作在线招聘信息,每天更新大量${city.simpleName}兼职工作岗位,周末兼职等,您可以免费查阅最新最全的${city.simpleName}兼职工作在线招聘人才信息。" />
		<link rel="Bookmark" href="http://www.jianzhi8.com/comcity/favicon.ico" />
		<link rel="shortcut icon" href="http://www.jianzhi8.com/comcity/favicon.ico" type="image/x-icon" />
		<link href="${base}css/reset.css" rel="stylesheet" type="text/css" />
		<script src="${base}js/jquery-1.7.1.min.js"></script>
		<#include "/WEB-INF/template/js_nav.ftl"/>
	</head>

<body>
	<#include "/WEB-INF/template/head.ftl"/>
	<!--当前位置区域-->
	<div class="current">
		<a href="http://www.jianzhi8.com/">兼职吧</a> &gt; 
		<a href="/">${city.simpleName}兼职</a> &gt;
		<a href="/yanzheng/">${city.simpleName}验证专栏</a>
	</div>
	

<div class="nr_bq_top nr_bq_top_y">
	<h2>&nbsp;</h2>
    <table id="con1">
    	<tbody>
        	<tr>
            	<td colspan="3" class="td_top_left"><A href="#">优惠网 返利网 | 51FanLi.com</A></td>
                <td class="td_4"><A href="#">赞助商链接</A></td>
            </tr>
            <tr>
            	<td colspan="4" class="td_top"><a href="#">网韵网络 网页设计公司 www.72en.com</a>专业提供网页设计公司等服务顶尖的网站制作设计,价格优惠!</td>
            </tr>
            <#list bean.resultList as c>
            <tr>
            	<td class="td_1"><a href="/a${c.ctNo}.html" target="_blank">${c.title}</a><span>${c.area!''}</span><#if c.ding><b><img src="${base}img/lb_r6_c4.jpg" /></b></#if></td>
                <td class="td_2"><a href="/a${c.ctNo}.html" target="_blank">${c.companyName}</a><#if c.isYz=='1'><span><img src="${base}img/lb_r7_c7.jpg" /></span></#if></td>
                <td class="td_3">${c.salary}</td>
                <td class="td_4">${c.date?string('MM-dd')}</td>
            </tr>
            </#list>
            <tr>
            	<td colspan="3" class="td_top_left"><A href="#">优惠网 返利网 | 51FanLi.com</A></td>
                <td class="td_4"><A href="#">赞助商链接</A></td>
            </tr>
            <tr>
            	<td colspan="4" class="td_top"><a href="#">网韵网络 网页设计公司 www.72en.com</a>专业提供网页设计公司等服务顶尖的网站制作设计,价格优惠!</td>
            </tr>
        </tbody>
    </table>
    <h3 class="clearfix">
                   『最新<font color="red"> ${bean.totalRow }</font> 条』 『${bean.pageIndex }/${bean.maxPage } 页』 &nbsp;
		<#if !bean.isFirstPage>
			<a href="/yanzheng/p1${Parameters["key"]}">首页</a>
			<a href="/yanzheng/p${bean.prePageIndex}${Parameters["key"]}">上页</a>
		</#if>
		${bean.getPaper('/yanzheng/',Parameters["key"])}
		<#if !bean.isLastPage>
			<a href="/yanzheng/p${bean.maxPage}${Parameters["key"]}">${bean.maxPage}</a>
			<a href="/yanzheng/p${bean.nextPageIndex}${Parameters["key"]}">下页</a>
		</#if>
    </h3>
</div>
	<#include "/WEB-INF/template/foot.ftl"/>
