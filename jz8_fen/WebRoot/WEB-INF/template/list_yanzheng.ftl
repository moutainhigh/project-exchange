<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${city.simpleName}��ְ����������Ƹ -��ְ��</title>
		<meta name="keywords" content='${city.simpleName}��ְ����' />
		<meta name="description" content="��ְ�����Ϊ���ṩ${city.simpleName}�����ļ�ְ����������Ƹ��Ϣ,ÿ����´���${city.simpleName}��ְ������λ,��ĩ��ְ��,��������Ѳ���������ȫ��${city.simpleName}��ְ����������Ƹ�˲���Ϣ��" />
		<link rel="Bookmark" href="http://www.jianzhi8.com/comcity/favicon.ico" />
		<link rel="shortcut icon" href="http://www.jianzhi8.com/comcity/favicon.ico" type="image/x-icon" />
		<link href="${base}css/reset.css" rel="stylesheet" type="text/css" />
		<script src="${base}js/jquery-1.7.1.min.js"></script>
		<#include "/WEB-INF/template/js_nav.ftl"/>
	</head>

<body>
	<#include "/WEB-INF/template/head.ftl"/>
	<!--��ǰλ������-->
	<div class="current">
		<a href="http://www.jianzhi8.com/">��ְ��</a> &gt; 
		<a href="/">${city.simpleName}��ְ</a> &gt;
		<a href="/yanzheng/">${city.simpleName}��֤ר��</a>
	</div>
	

<div class="nr_bq_top nr_bq_top_y">
	<h2>&nbsp;</h2>
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
            	<td class="td_1"><a href="/a${c.ctNo}.html" target="_blank">${c.title}</a><span>${c.area!''}</span><#if c.ding><b><img src="${base}img/lb_r6_c4.jpg" /></b></#if></td>
                <td class="td_2"><a href="/a${c.ctNo}.html" target="_blank">${c.companyName}</a><#if c.isYz=='1'><span><img src="${base}img/lb_r7_c7.jpg" /></span></#if></td>
                <td class="td_3">${c.salary}</td>
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
			<a href="/yanzheng/p1${Parameters["key"]}">��ҳ</a>
			<a href="/yanzheng/p${bean.prePageIndex}${Parameters["key"]}">��ҳ</a>
		</#if>
		${bean.getPaper('/yanzheng/',Parameters["key"])}
		<#if !bean.isLastPage>
			<a href="/yanzheng/p${bean.maxPage}${Parameters["key"]}">${bean.maxPage}</a>
			<a href="/yanzheng/p${bean.nextPageIndex}${Parameters["key"]}">��ҳ</a>
		</#if>
    </h3>
</div>
	<#include "/WEB-INF/template/foot.ftl"/>
