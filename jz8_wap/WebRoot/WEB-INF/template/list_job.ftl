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
    	//hide area list
		$(function(){
			if($('.filter_city a').length > 16){
				$('.filter_city a').slice(16).hide();
				$('.filter_city').append('<a href="javascript:void(0);" onclick="$(\'.filter_city a\').show();$(this).hide()">更多..</a>');
			}
			if($('.filter_type a').length > 8){
				$('.filter_type a').slice(8).hide();
				$('.filter_type').append('<a href="javascript:void(0);" onclick="$(\'.filter_type a\').show();$(this).hide()">更多..</a>');
			}
		});
	</script>
</head>
<body>
    <#include "/WEB-INF/template/head.ftl"/>
    <div class="search">
        <span>首页</span>&nbsp;>&nbsp;<span>${currCityName}招聘</span>&nbsp;>&nbsp;<span>${currJobTypeName}</span>
    </div>
    <div style="padding: 3px; padding-left: 5px; padding-bottom: 5px; border-bottom: 1px solid #ECECEC; border-top: 1px solid #ECECEC;">
        <p style="padding-bottom: 5px; padding-top: 5px;" class="filter_type">
            	职位: 
            <a href="/${city.cityId}/<#if currCityId?? || currJobTypeId??><#if currCityId??>zp${currCityId}/</#if><#if currJobTypeId?? && currJobTypeId.length() gt 3>zp${currParentJobTypeId}/</#if><#else>job/</#if>" style="color:black;font-weight:600;">全部</a>
			<#list fillJobTypeList as t>
			<a href="/${city.cityId}/<#if currCityId?? >zp${currCityId}/</#if>zp${t.typeId}/" <#if currJobTypeId?? && currJobTypeId==t.typeId>class="curr_sel"</#if>>${t.typeName}</a>
			</#list>
        </p>
        
        <p style="padding-bottom: 5px; padding-top: 5px;" class="filter_city">
            	区域: 
			<a href="/${city.cityId}/<#if currParentCityId?? || currJobTypeId??><#if currParentCityId??>zp${currParentCityId}/</#if><#if currJobTypeId??>zp${currJobTypeId}/</#if><#else>job/</#if>" style="color:black;font-weight:600;">全部</a>
			<#list fillCityList as c>
			<a href="/${city.cityId}/zp${c.cityId}/<#if currJobTypeId??>zp${currJobTypeId}/</#if>" <#if currCityId?? && currCityId==c.cityId>class="curr_sel"</#if>>${c.simpleName}</a>
			</#list>
        </p>
        
    </div>
    <div class="new-con">
        <a href="/${city.cityId}/job/"><strong>所有全职招聘</strong></a></div>
    <div class="nav">
        <div class="nav-list">
        	<#list bean.resultList as c>
            <p>
                <a href="/${city.cityId}/a${c.ctNo}.html">${c.title}</a> 
                <br/>
                <#if c.userId=='admin'||c.companyName==''>未填写<#else><#if c.companyName?length lt 19>${c.companyName}<#else>${c.companyName[0..18]}</#if><#if c.isYz=='1'><span><img src="http://css.jianzhi8.com/fenzhan/img/lb_r7_c7.jpg" /></span></#if></#if>
                <span><#if (c.salary)?length lt 10>${c.salary}<#else>${c.salary[0..8]}</#if></span> &nbsp;&nbsp;
                <span>${c.date?string('MM-dd')}</span>
            </p>
            </#list>
            <p>
	<#if currCityId??||currJobTypeId??||currUnitype??>
		<#if !bean.isFirstPage>
<a href="/${city.cityId}/<#if currCityId?? >zp${currCityId}/</#if><#if currJobTypeId?? >zp${currJobTypeId}/</#if><#if currUnitype?? >zp${currUnitype}/</#if>" class="n">首页</a>
<a href="/${city.cityId}/<#if currCityId?? >zp${currCityId}/</#if><#if currJobTypeId?? >zp${currJobTypeId}/</#if><#if currUnitype?? >${currUnitype}</#if>p${bean.prePageIndex}/" class="n">&lt;上页</a>
		</#if>
${bean.getPaper('/' + city.cityId + '/'+currCityId+'/'+ currJobTypeId + '/'+ currUnitype +'',2,'zp')}
		<#if bean.isnext>		
<a href="/${city.cityId}/<#if currCityId?? >zp${currCityId}/</#if><#if currJobTypeId?? >zp${currJobTypeId}/</#if><#if currUnitype?? >${currUnitype}</#if>p${bean.pageIndex+1}/" class="n">下页&gt;</a>
		</#if>
	<#else>		
		<#if !bean.isFirstPage>
<a href="/${city.cityId}/job/" class="n">首页</a>
<a href="/${city.cityId}/job/<#if bean.prePageIndex!='1'>p${bean.prePageIndex}/</#if>" class="n">&lt;上页</a>
		</#if>
${bean.getPaper('/job/',2)}
		<#if bean.isnext>
<a href="/${city.cityId}/job/p${bean.pageIndex+1}/" class="n">下页&gt;</a>
		</#if>	
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
