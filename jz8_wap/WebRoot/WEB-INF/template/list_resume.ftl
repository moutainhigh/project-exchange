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
    <script type="text/javascript">
	</script>
</head>
<body>
    <#include "/WEB-INF/template/head.ftl"/>
    <div class="search">
        <span>首页</span>&nbsp;>&nbsp;<span>${city.cityName}简历中心</span>
    </div>
    <div class="new-con">
        <a href="/${city.cityId}/resume/"><strong>所有简历</strong></a></div>
    <div class="nav">
        <div class="nav-list">
        	<#list bean.resultList as r>
            <p>
                <a href="/${city.cityId}/resume/${r.userNo}.html">${r.userName}</a>&nbsp;&nbsp;
				<span>${r.typeName}</span>
				<span>${r.userClass}</span>
				<span>${r.sex}</span>
				<span>${r.age}</span>
				<span>${r.shenfen}</span>
				<span>${r.date?string('MM-dd')}</span>
            </p>
            </#list>
            <p>
		<#if !bean.isFirstPage>
			<a href="/${city.cityId}/resume/">首页</a>
			<a href="/${city.cityId}/resume/p${bean.prePageIndex}/">上页</a>
		</#if>${bean.getPaper('/'+city.cityId+'/resume/')}
		<#if !bean.isLastPage>
			<a href="/${city.cityId}/resume/p${bean.pageIndex+1}/">下页</a>
		</#if>
            </p>
        </div>
    </div>
    <div class="new-in-wp">
        <div class="nw-wp-bg">
            <div class="nw-title">
                找兼职，上兼职8更容易!</div>
        </div>
    </div>
    <div class="new-con">
        <p>
            <a href="#"><strong>*</strong>广告位,推介位。</a></p>
        <p>
    </div>
<#include "/WEB-INF/template/foot.ftl"/>
