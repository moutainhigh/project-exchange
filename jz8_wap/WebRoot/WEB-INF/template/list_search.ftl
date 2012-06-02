<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta name="viewport" content="width=device-width; initial-scale=1.0; minimum-scale=1.0; maximum-scale=2.0" />
    <meta name="MobileOptimized" content="240" />
    <meta name="format-detection" content="telephone=no" />
    <title>��ְ8--${city.simpleName}վ--</title>
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <script src="/js/jquery-1.4.3.min.js" type="text/javascript"></script>
    <script type="text/javascript">
	</script>
</head>
<body>
    <#include "/WEB-INF/template/head.ftl"/>
    <div class="search">
        <span>��ҳ</span>&nbsp;>&nbsp;<span>${currCityName}��ְ</span>&nbsp;>&nbsp;<span>�������</span>
    </div>
    <div class="nav">
        <div class="nav-list">
        	<#list bean.resultList as c>
            <p>
                <a href="/${city.cityId}/a${c.ctNo}.html">${c.title}</a> 
                <br/>
                <#if c.userId=='admin'||c.companyName==''>δ��д<#else><#if c.companyName?length lt 19>${c.companyName}<#else>${c.companyName[0..18]}</#if><#if c.isYz=='1'><span><img src="http://css.jianzhi8.com/fenzhan/img/lb_r7_c7.jpg" /></span></#if></#if>
                <span><#if (c.salary)?length lt 10>${c.salary}<#else>${c.salary[0..8]}</#if></span>
                <span>${c.date?string('MM-dd')}</span>
            </p>
            </#list>
            <p>
		<#if !bean.isFirstPage>
<a href="/${city.cityId}/s/${paramKey}/" class="n">��ҳ</a>
<a href="/${city.cityId}/s/${paramKey}/<#if bean.prePageIndex!='1'>p${bean.prePageIndex}/</#if>" class="n">&lt;��ҳ</a>
		</#if>
${bean.getPaper('/' + city.cityId + '/s/' + paramKey + '/',2)}
		<#if bean.isnext>
<a href="/${city.cityId}/s/${paramKey}/p${bean.pageIndex+1}/" class="n">��ҳ&gt;</a>
		</#if>	
            </p>
        </div>
    </div>
    <div class="new-in-wp">
        <div class="nw-wp-bg">
            <div class="nw-title">
                �Ҽ�ְ���ϼ�ְ8������!</div>
        </div>
    </div>
    <div class="new-con">
        <p>
            <a href="#"><strong>*</strong>���λ,�ƽ�λ��</a></p>
        <p>
    </div>
<#include "/WEB-INF/template/foot.ftl"/>
