<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${city.simpleName}${key}��ְ-��ְ��</title>
		<meta name="keywords" content='${city.simpleName}${key}��ְ' />
		<meta name="description" content='${city.simpleName}��ְ��Ϊ���ṩ����${city.simpleName}${key}��ְ��Ϣ,��������Ѳ�ѯ��ְ${key}��${key}������λ����Ϣ,ͬʱ����������ѷ���${city.simpleName}${key}��ְ��Ϣ��' />
		<link rel="Bookmark" href="http://www.jianzhi8.com/comcity/favicon.ico" />
		<link rel="shortcut icon" href="http://www.jianzhi8.com/comcity/favicon.ico" type="image/x-icon" />
		<link href="${base}css/reset.css" rel="stylesheet" type="text/css" />
		<script src="${base}js/jquery-1.7.1.min.js"></script>
		<#include "/WEB-INF/template/js_nav.ftl"/>
		<#include "/WEB-INF/template/js_search_key.ftl"/>
	</head>

<body>
	<#include "/WEB-INF/template/head.ftl"/>
	<!--��ǰλ������-->
	<div class="current">
		<a href="http://www.jianzhi8.com/">��ְ��</a> &gt; 
		<a href="/">${city.simpleName}��ְ</a> &gt;
		<a href="/jianzhi/">${city.simpleName}��ְ����</a> &gt;  
		<a href="/s/${key}">${key}��ְ����</a>
	</div>
<div class="nr_bq_top nr_bq_top_y">
	<h2>
    </h2>
    <table id="con1">
    	<tbody>
        	<tr>
            	<td colspan="3" class="td_top_left"><A href="#">�Ż��� ������ | 51FanLi.com</A></td>
                <td class="td_4"><A href="#">����������</A></td>
            </tr>
            <tr>
            	<td colspan="4" class="td_top"><a href="#">�������� ��ҳ��ƹ�˾ www.72en.com</a>רҵ�ṩ��ҳ��ƹ�˾�ȷ��񶥼����վ�������,�۸��Ż�!</td>
            </tr>
            <#list bean.resultList as c>
            <tr>
            	<td class="td_1"><a href="/a${c.ctNo}.html" target="_blank">${c.title}</a><#if c.ding><b><img src="${base}img/lb_r6_c4.jpg" /></b></#if><#if c.isYz=='1'><span><img src="${base}img/lb_r7_c7.jpg" /></span></#if></td>
                <td class="td_2"><a href="/jianzhi/${c.typeId}">${c.typeName}</a></td>
                <td class="td_3"><#if c.ctClass=='0'>��ְ<#elseif c.ctClass=='1'>ȫְ</#if></td>
                <td class="td_4">${c.date?string('MM-dd')}</td>
            </tr>
            </#list>
            <tr>
            	<td colspan="3" class="td_top_left"><A href="#">�Ż��� ������ | 51FanLi.com</A></td>
                <td class="td_4"><A href="#">����������</A></td>
            </tr>
            <tr>
            	<td colspan="4" class="td_top"><a href="#">�������� ��ҳ��ƹ�˾ www.72en.com</a>רҵ�ṩ��ҳ��ƹ�˾�ȷ��񶥼����վ�������,�۸��Ż�!</td>
            </tr>
        </tbody>
    </table>
    <h3 class="clearfix">
                   ������<font color="red"> ${bean.totalRow }</font> ���� ��${bean.pageIndex }/${bean.maxPage } ҳ�� &nbsp;
		<#if !bean.isFirstPage>
			<a href="/s/p1${Parameters["key"]}">��ҳ</a>
			<a href="/s/p${bean.prePageIndex}${Parameters["key"]}">��ҳ</a>
		</#if>
		${bean.getSearchPaper(Parameters["key"])}
		<#if !bean.isLastPage>
			<a href="/s/p${bean.maxPage}${Parameters["key"]}">${bean.maxPage}</a>
			<a href="/s/p${bean.nextPageIndex}${Parameters["key"]}">��ҳ</a>
		</#if>
    </h3>
</div>
	<#include "/WEB-INF/template/foot.ftl"/>
