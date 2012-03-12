<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${city.simpleName}个人求职简历 -兼职吧</title>
		<meta name="keywords" content='${city.simpleName}个人求职简历' />
		<meta name="description" content="兼职吧免费为您提供${city.simpleName}地区的个人求职简历信息,每天更新大量${city.simpleName}个人求职简历资讯信息,兼职人才简历和全职人才简历等,您可以免费查阅最新最全的${city.simpleName}个人求职简历信息。" />
		<link rel="Bookmark" href="http://www.jianzhi8.com/comcity/favicon.ico" />
		<link rel="shortcut icon" href="http://www.jianzhi8.com/comcity/favicon.ico" type="image/x-icon" />
		<link href="${base}css/reset.css" rel="stylesheet" type="text/css" />
		<script src="${base}js/jquery-1.7.1.min.js"></script>
		<#include "/WEB-INF/template/js_nav.ftl"/>
		<#include "/WEB-INF/template/js_search_key.ftl"/>
	</head>

<body>
	<#include "/WEB-INF/template/head.ftl"/>
	<!--当前位置区域-->
	<div class="current">
		<a href="http://www.jianzhi8.com/">兼职吧</a> &gt; 
		<a href="/">${city.simpleName}兼职</a> &gt;		
		<a href="/rencai/${Parameters["typeId"]}">${city.simpleName}个人求职${typemap[typeId]}<#if queryTypeId?exists && queryTypeId.length()==5>${typemap[queryTypeId]}</#if></a>
		<#if areaId?? && areaId!=''>
		 &gt;  <a href="/rencai/${Parameters["typeId"]}a${areaId}">${areaName}个人求职<#if queryTypeId?exists && queryTypeId.length()==5>${typemap[queryTypeId]}</#if></a>
		</#if>
		
	</div>
	
	<div class="con_top">
		<div class="con_top_top">
			<p>职位：
			<a href="/rencai/${Parameters["areaId"]}${Parameters["jobdate"]}${Parameters["key"]}" style="color:black;font-weight:600;">全部</a>
			<#list childTypeList as t>
			<a href="/rencai/${t.typeCode}${Parameters["areaId"]}${Parameters["jobdate"]}${Parameters["key"]}" <#if queryTypeId?? && queryTypeId==t.typeCode>class="curr_sel"</#if>>${t.typeName}</a>
			</#list>
			</p>
			<p id="areaP">区域：
			<a href="/rencai/${Parameters["typeId"]}${Parameters["jobdate"]}${Parameters["key"]}" style="color:black;font-weight:600;">全部</a>
			<#list subCityList as c>
			<a href="/rencai/${Parameters["typeId"]}a${c.cityCode}${Parameters["jobdate"]}${Parameters["key"]}" <#if areaId?? && areaId==c.cityCode>class="curr_sel"</#if>>${c.simpleName}</a>
			</#list>
			</p>
			<#if Parameters["ctClass"]!='c1'>
			<p>时间：
			<a href="/rencai/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["key"]}" style="color:black;font-weight:600;">全部</a>
			<#list jobdatemap.keySet() as k>
			<a href="/rencai/${Parameters["typeId"]}${Parameters["areaId"]}d${k}${Parameters["key"]}" <#if jobdate?? && jobdate==k>class="curr_sel"</#if>>${jobdatemap.get(k)}</a>
			</#list>
			</p>
			</#if>
		</div>
		<div class="con_top_bom">
			<form action="/s/" method="get">
				<input type="text" id="loc_key" name="loc_key" class="con_bk" value="请输入职位名称" onblur="if(this.value==''){this.value='请输入职位名称'}" onfocus="if(this.value=='请输入职位名称'){this.value=''}"/><input type="button" class="con_ss" id="" name=" " value="搜索" onclick="doLocSearch('求职');"/>
				<span>热门：
				<#list words as w>
				<a href="/rencai/s${(w+'兼职')?url}">${w}</a>
				</#list>
				</span>
			</form>
		</div>
	</div>

<div class="nr_bq_top nr_bq_top_y">
	<h2>
    	<div class="clearfix"> 
    	<a href="/rencai/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["jobdate"]}${Parameters["key"]}" <#if Parameters["ctClass"]==''>class="now_aa" </#if>id="tag1" style="color:#444;">全部</a>
        <a href="/rencai/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["jobdate"]}c0${Parameters["key"]}" <#if Parameters["ctClass"]=='c0'>class="now_aa" </#if>id="tag2" style="color:#444;">兼职求职</a>
        <a href="/rencai/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["jobdate"]}c1${Parameters["key"]}" <#if Parameters["ctClass"]=='c1'>class="now_aa" </#if>id="tag3" style="color:#444;">全职求职</a>
        </div>
        <p><a href="http://my.jianzhi8.com/fb.do" target="_blank">发布求职信息，工作来找你。</a></p>
    </h2>
    <table id="con1">
    	<tbody>
        	<tr>
            	<td colspan="3" class="td_top_left"><A href="#">优惠网 返利网 | 51FanLi.com</A>国内首家网购返利网站 月返现金200万 返还网返利网 购物返现金高达50%  </td>
                <td class="td_4"><A href="#">赞助商链接</A></td>
            </tr>
            <tr>
            	<td colspan="4" class="td_top"><a href="#">网韵网络 网页设计公司 www.72en.com</a>专业提供网页设计公司等服务顶尖的网站制作设计,价格优惠!</td>
            </tr>
            <#list bean.resultList as c>
            <tr>
            	<td class="td_1"><a href="/a${c.ctNo}.html" target="_blank">${c.title}</a><span>${c.area!''}</span></td>
                <td class="td_2">${c.age}</td>
                <td class="td_3">${c.sex}</td>
                <td class="td_4">${c.date?string('MM-dd')}</td>
            </tr>
            </#list>
            <tr>
            	<td colspan="3" class="td_top_left"><A href="#">优惠网 返利网 | 51FanLi.com</A>国内首家网购返利网站 月返现金200万 返还网返利网 购物返现金高达50%  </td>
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
			<a href="/rencai/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["jobdate"]}${Parameters["ctClass"]}p1">首页</a>
			<a href="/rencai/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["jobdate"]}${Parameters["ctClass"]}p${bean.prePageIndex}">上页</a>
		</#if>
		${bean.getPaper('/rencai/' + Parameters["typeId"] + Parameters["areaId"] + Parameters["jobdate"] + Parameters["ctClass"], Parameters["key"])}
		<#if !bean.isLastPage>
			<a href="/rencai/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["jobdate"]}${Parameters["ctClass"]}p${bean.maxPage}">${bean.maxPage}</a>
			<a href="/rencai/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["jobdate"]}${Parameters["ctClass"]}p${bean.nextPageIndex}">下页</a>
		</#if>
    </h3>
</div>
<div class="friendly_link">
	<div class="type_list">
	<p><span>${city.simpleName}其他求职：</span>
	<#list typeList as t>
	<a href="/rencai/${t.typeCode}">${city.simpleName}${typemap[t.typeCode]}求职</a>
	</#list>
	</p>
	</div>
	<div class="brother_city_list">
	<p><span>周边${typemap[queryTypeId]}求职：</span>
	<#list brotherCityList as c>
	<a href="http://${c.cityId}.jianzhi8.com/rencai/">${c.simpleName}求职</a>
	</#list>
	</p>
	</div>
</div>
	<#include "/WEB-INF/template/foot.ftl"/>
