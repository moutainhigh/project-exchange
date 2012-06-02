<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta name="viewport" content="width=device-width; initial-scale=1.0; minimum-scale=1.0; maximum-scale=2.0" />
    <meta name="MobileOptimized" content="240" />
    <meta name="format-detection" content="telephone=no" />
    <title>兼职8--${city.simpleName}站--</title>
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <script src="/js/jquery-1.4.3.min.js" type="text/javascript"></script>
    <script>
    	function search(){
    		var key = $("#keyword").val();
    		if(key && key != ''){
    			self.location.href = '/${city.cityId}/s/' + encodeURI(key) + '/';
    		}
    	}
    </script>
</head>
<body>
    <div id="wapper">
        <div class="header">
            <div class="header-nav">
                ${city.simpleName}[<a name="top" href="/default.do">切换城市</a>] <a href="#">职业指导</a> <a href="#">骗子公告栏</a>
            </div>
            <div class="header-content">
                <a href="/">
                    <img width="147px" height="50px" src="/images/LOGO.png" alt="回首页 wap.jianzhi8.cn" /></a>
                <a href="">轻松赚钱~~</a>
            </div>
        </div>
    </div>
    <div class="new-con">
        <a href=""><strong>*</strong>你找兼职了吗?</a></div>
    	<div class="search">
        <form method="get" action="/s/">
	        <input type="hidden" name="searchBackUrl" value="%2Fcd" />
	        <input name="keyword" id="keyword" class="ip-text-bg" size="6" value="兼职" onfocus="this.value=''"/>
	        <input type="hidden" name="from" value="shouye_search" />
	        <input type="button" value="搜 索" class="ip-btn-bg" onclick="search();"/>
        </form>
    </div>
    <div style="padding: 3px; padding-left: 5px; padding-bottom: 5px; border-bottom: 1px solid #ECECEC;">
        <p style="padding-bottom: 5px; padding-top: 5px;">
            	热搜:<a href="/${city.cityId}/s/产品包装/">产品包装</a> <a href="/${city.cityId}/s/物流/">物流</a> <a href="#">保健养生</a> <a href="#">软文写手</a>
            <a href="#">十字绣</a> <a href="#">软文写手</a> <a href="#">十字绣</a>
        </p>
    </div>
    <div class="nav_botttom clearfix">
    	<ul class="clearfix">
        	<li style="width:35px;"><A href="/${city.cityId}/" class="now_a">首页</A></li>
            <li><A href="/${city.cityId}/jianzhi/">兼职招聘</A></li>
            <li><A href="/${city.cityId}/job/">全职招聘</A></li> 
            <li><A href="/${city.cityId}/rencai/">个人求职</A></li>
            <li><A href="/${city.cityId}/resume/">简历中心</A></li>
        </ul>
    </div>
    <div class="nav">
        <div class="nav-list">
            <p>
            	<strong>兼职分类:</strong>
            	<#list indexTypeList as t>
                <a href="/${city.cityId}/${t.typeId}/" style="">${t.typeName}</a> <em>|</em> 
                </#list>
            </p>
        </div>
    </div>
    <div class="new-in-wp">
        <div class="nw-wp-bg">
            <div class="nw-title">
                ${city.cityName}促销员兼职</div>
            <div class="nav-list">
            	<#list indexK02List as c>
                <p><span>[<#if c.type??>${c.type.typeName}</#if>]</span> <a href="/${city.cityId}/a${c.ctNo}.html">${c.ctTitle}</a></p>
                </#list>
            </div>
        </div>
    </div>
    <div class="new-in-wp">
        <div class="nw-wp-bg">
            <div class="nw-title">
               ${city.cityName}学生兼职</div>
            <div class="nav-list">
            	<#list indexK01List as c>
                <p><span>[<#if c.type??>${c.type.typeName}</#if>]</span> <a href="/${city.cityId}/a${c.ctNo}.html">${c.ctTitle}</a></p>
                </#list>
            </div>
        </div>
    </div>
    <div class="new-con">
        <a href="#"><strong>*</strong>广告位</a></div>
    <div class="new-in-wp">
        <div class="nw-wp-bg">
            <div class="nw-title">
                最新发布信息</div>
            <div class="nav-list">
                <#list indexLastList as c>
                <p><span>[<#if c.type??>${c.type.typeName}</#if>]</span> <a href="/${city.cityId}/a${c.ctNo}.html">${c.ctTitle}</a></p>
                </#list>
            </div>
        </div>
    </div>
<#include "/WEB-INF/template/foot.ftl"/>
