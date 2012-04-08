<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${city.simpleName}招聘网</title>
		<meta name="keywords" content="${city.simpleName}招聘网" />
		<meta name="description" content="${city.simpleName}招聘网是兼职吧免费为您提供${city.simpleName}地区的全职人才信息网站，,您可免费快速的发布${city.simpleName}招聘职位，浏览求职简历，寻求各种${city.simpleName}招聘信息！" />
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
		<a href="/job/${Parameters["typeId"]}">${city.simpleName}招聘${jobtypemap[typeId]}<#if queryTypeId?exists && queryTypeId.length()==5>${jobtypemap[queryTypeId]}</#if></a>
		<#if areaId?? && areaId!=''>
		 &gt;  <a href="/job/${Parameters["typeId"]}a${areaId}">${areaName}<#if queryTypeId?exists && queryTypeId.length()==5>${jobtypemap[queryTypeId]}</#if></a>
		</#if>
	</div>
	
	<div class="con_top">
		<div class="con_top_top">
			<p>职位：
			<a href="/job/${Parameters["areaId"]}${Parameters["key"]}" style="color:black;font-weight:600;">全部</a>
			<#list childTypeList as t>
			<a href="/job/${t.typeCode}${Parameters["areaId"]}${Parameters["key"]}" <#if queryTypeId?? && queryTypeId==t.typeCode>class="curr_sel"</#if>>${t.typeName}</a>
			</#list>
			</p>
			<p id="areaP">区域：
			<a href="/job/${Parameters["typeId"]}${Parameters["key"]}" style="color:black;font-weight:600;">全部</a>
			<#list subCityList as c>
			<a href="/job/${Parameters["typeId"]}a${c.cityCode}${Parameters["key"]}" <#if areaId?? && areaId==c.cityCode>class="curr_sel"</#if>>${c.simpleName}</a>
			</#list>
			</p>
		</div>
		<div class="con_top_bom">
			<form action="/s/" method="get">
				<input type="text" id="loc_key" name="loc_key" class="con_bk" value="请输入职位名称" onblur="if(this.value==''){this.value='请输入职位名称'}" onfocus="if(this.value=='请输入职位名称'){this.value=''}"/><input type="button" class="con_ss" id="" name=" " value="搜索" onclick="doLocSearch('全职');"/>
				<span>热门：
				<#list words as w>
				<a href="/job/s${(w+'兼职')?url}">${w}</a>
				</#list>
				</span>
			</form>
		</div>
	</div>

<div class="nr_bq_top nr_bq_top_y">
	<h2>
    	<div class="clearfix"> 
    	<a href="/job/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["key"]}" <#if Parameters["unitype"]==''>class="now_aa" </#if>id="tag1" style="color:#444;">全部</a>
        <a href="/job/${Parameters["typeId"]}${Parameters["areaId"]}t1${Parameters["key"]}" <#if Parameters["unitype"]=='t1'>class="now_aa" </#if>id="tag2" style="color:#444;">公司直招</a>
        <a href="/job/${Parameters["typeId"]}${Parameters["areaId"]}t2${Parameters["key"]}" <#if Parameters["unitype"]=='t2'>class="now_aa" </#if>id="tag3" style="color:#444;">职介招聘</a>
        <a href="/job/${Parameters["typeId"]}${Parameters["areaId"]}t3${Parameters["key"]}" <#if Parameters["unitype"]=='t3'>class="now_aa" </#if>id="tag4" style="color:#444;">认证企业</a>
        </div>
        <p><input type="button" value="发布招聘" class="diyi_btn" onclick="self.location.href='http://my.jianzhi8.com/fb.do'"/><input type="button" value="登记简历" onclick="self.location.href='http://my.jianzhi8.com/fb.do'"/></p>
    </h2>
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
			<a href="/job/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["unitype"]}p1${Parameters["key"]}">首页</a>
			<a href="/job/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["unitype"]}p${bean.prePageIndex}${Parameters["key"]}">上页</a>
		</#if>
		${bean.getPaper('/job/' + Parameters["typeId"] + Parameters["areaId"] + Parameters["unitype"],Parameters["key"])}
		<#if !bean.isLastPage>
			<a href="/job/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["unitype"]}p${bean.maxPage}${Parameters["key"]}">${bean.maxPage}</a>
			<a href="/job/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["unitype"]}p${bean.nextPageIndex}${Parameters["key"]}">下页</a>
		</#if>
    </h3>
</div>
<div class="friendly_link">
	<div class="type_list">
	<p><span>${city.simpleName}其他招聘：</span>
	<#list typeList as t>
	<a href="/job/${t.typeCode}">${city.simpleName}${jobtypemap[t.typeCode]}招聘</a>
	</#list>
	</p>
	</div>
	<div class="brother_city_list">
	<p><span>周边${typemap[queryTypeId]}招聘：</span>
	<#list brotherCityList as c>
	<a href="http://${c.cityId}.jianzhi8.com/job/">${c.simpleName}招聘</a>
	</#list>
	</p>
	</div>
</div>
	<#include "/WEB-INF/template/foot.ftl"/>
