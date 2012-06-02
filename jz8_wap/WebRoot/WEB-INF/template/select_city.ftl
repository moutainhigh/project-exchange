<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta name="viewport" content="width=device-width; initial-scale=1.0; minimum-scale=1.0; maximum-scale=2.0" />
    <meta name="MobileOptimized" content="240" />
    <meta name="format-detection" content="telephone=no" />
    <title>��ְ8--�ƶ�վ--</title>
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div id="wapper">
        <div class="header">
            <div class="header-nav">
                <#if currCity?exists>${currCity.simpleName}</#if>[<a name="top" href="/default.do">�л�����</a>] <a href="#">ְҵָ��</a> <a href="#">ƭ�ӹ�����</a>
            </div>
            <div class="header-content">
                <a href="/">
                    <img width="147px" height="50px" src="/images/LOGO.png" alt="����ҳ wap.jianzhi8.cn" /></a>
                <a href="">����׬Ǯ~~</a>
            </div>
        </div>
    </div>
    <div class="new-con">
        <a href=""><strong>*</strong>���Ҽ�ְ����?</a></div>
    </div>
    <div class="nav">
        <div class="nav-list">
            <p>
            	<#if childCityList??>
            	<#list childCityList as c>
                <a href="/${c.cityId}/">${c.simpleName}</a><em>|</em>
                </#list>
                <a href="/">����</a>
                <#else>
                <#list hotCityList as c>
                <a href="/${c.cityId}/">${c.simpleName}</a><em>|</em>
                </#list>
                </#if>
            </p>
        </div>
    </div>
    <div class="new-in-wp">
        <div class="nw-wp-bg">
            <div class="nw-title">��ʡ�ݲ�ѯ</div>
            <div class="nav-list">
                <p>
	            	<#list provinceList as c>
	                <a href="/default.do?parentCityCode=${c.cityCode}">${c.simpleName}</a><em>|</em>
	                </#list> 
	            </p>
            </div>
        </div>
    </div>
    
<#include "/WEB-INF/template/foot.ftl"/>
