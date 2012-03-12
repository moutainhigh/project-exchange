<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${city.simpleName}兼职工作 -兼职吧</title>
		<meta name="keywords" content='${city.simpleName}兼职工作' />
		<meta name="description" content="兼职吧免费为您提供${city.simpleName}地区的兼职工作信息,每天更新大量${city.simpleName}兼职工作岗位,周末兼职等,您可以免费查阅最新最全的${city.simpleName}兼职工作人才信息。" />
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
		<a href="/jianzhi/${Parameters["typeId"]}">${city.simpleName}兼职${typemap[typeId]}<#if queryTypeId?exists && queryTypeId.length()==5>${typemap[queryTypeId]}</#if>工作</a>
		<#if areaId?? && areaId!=''>
		 &gt;  <a href="/jianzhi/${Parameters["typeId"]}a${areaId}">${areaName}<#if queryTypeId?exists && queryTypeId.length()==5>${typemap[queryTypeId]}</#if></a>
		</#if>
	</div>
	
	<div class="con_top">
		<div class="con_top_top">
			<p>职位：
			<a href="/jianzhi/${Parameters["areaId"]}${Parameters["jobdate"]}${Parameters["key"]}" style="color:black;font-weight:600;">全部</a>
			<#list childTypeList as t>
			<a href="/jianzhi/${t.typeCode}${Parameters["areaId"]}${Parameters["jobdate"]}${Parameters["key"]}" <#if queryTypeId?? && queryTypeId==t.typeCode>class="curr_sel"</#if>>${t.typeName}</a>
			</#list>
			</p>
			<p id="areaP">区域：
			<a href="/jianzhi/${Parameters["typeId"]}${Parameters["jobdate"]}${Parameters["key"]}" style="color:black;font-weight:600;">全部</a>
			<#list subCityList as c>
			<a href="/jianzhi/${Parameters["typeId"]}a${c.cityCode}${Parameters["jobdate"]}${Parameters["key"]}" <#if areaId?? && areaId==c.cityCode>class="curr_sel"</#if>>${c.simpleName}</a>
			</#list>
			</p>
			<p>时间：
			<a href="/jianzhi/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["key"]}" style="color:black;font-weight:600;">全部</a>
			<#list jobdatemap.keySet() as k>
			<a href="/jianzhi/${Parameters["typeId"]}${Parameters["areaId"]}d${k}${Parameters["key"]}" <#if jobdate?? && jobdate==k>class="curr_sel"</#if>>${jobdatemap.get(k)}</a>
			</#list>
			</p>
		</div>
		<div class="con_top_bom">
			<form action="/s/" method="get">
				<input type="text" id="loc_key" name="loc_key" class="con_bk" value="请输入职位名称" onblur="if(this.value==''){this.value='请输入职位名称'}" onfocus="if(this.value=='请输入职位名称'){this.value=''}"/><input type="button" class="con_ss" id="" name=" " value="搜索" onclick="doLocSearch('兼职');"/>
				<span>热门：
				<#list words as w>
				<a href="/jianzhi/s${(w+'兼职')?url}">${w}</a>
				</#list>
				</span>
			</form>
		</div>
	</div>

<div class="nr_bq_top nr_bq_top_y">
	<h2>
    	<div class="clearfix"> 
    	<a href="/jianzhi/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["jobdate"]}${Parameters["key"]}" <#if Parameters["unitype"]==''>class="now_aa" </#if>id="tag1" style="color:#444;">全部</a>
        <a href="/jianzhi/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["jobdate"]}t1${Parameters["key"]}" <#if Parameters["unitype"]=='t1'>class="now_aa" </#if>id="tag2" style="color:#444;">公司直招</a>
        <a href="/jianzhi/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["jobdate"]}t2${Parameters["key"]}" <#if Parameters["unitype"]=='t2'>class="now_aa" </#if>id="tag3" style="color:#444;">职介招聘</a>
        <a href="/jianzhi/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["jobdate"]}t3${Parameters["key"]}" <#if Parameters["unitype"]=='t3'>class="now_aa" </#if>id="tag4" style="color:#444;">认证企业</a>
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
            	<td class="td_1"><a href="/a${c.ctNo}.html" target="_blank">${c.title}</a><#if Parameters["areaId"]=='' && c.area?exists && c.area!=''><span><a href="/jianzhi/a${c.cityCode}">${c.area}</a></span></#if><#if c.ding><b><img src="${base}img/lb_r6_c4.jpg" /></b></#if></td>
                <td class="td_2"><a href="http://www.jianzhi8.com/user/${c.userId?url}" target="_blank">${c.companyName}</a><#if c.isYz=='1'><span><img src="${base}img/lb_r7_c7.jpg" /></span></#if></td>
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
			<a href="/jianzhi/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["jobdate"]}${Parameters["unitype"]}p1${Parameters["key"]}">首页</a>
			<a href="/jianzhi/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["jobdate"]}${Parameters["unitype"]}p${bean.prePageIndex}${Parameters["key"]}">上页</a>
		</#if>
		${bean.getPaper('/jianzhi/' + Parameters["typeId"] + Parameters["areaId"] + Parameters["jobdate"] + Parameters["unitype"], Parameters["key"])}
		<#if !bean.isLastPage>
			<a href="/jianzhi/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["jobdate"]}${Parameters["unitype"]}p${bean.maxPage}${Parameters["key"]}">${bean.maxPage}</a>
			<a href="/jianzhi/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["jobdate"]}${Parameters["unitype"]}p${bean.nextPageIndex}${Parameters["key"]}">下页</a>
		</#if>
    </h3>
</div>
<div class="friendly_link">
	<div class="type_list">
	<p><span>${city.simpleName}其他兼职：</span>
	<#list typeList as t>
	<a href="/jianzhi/${t.typeCode}">${city.simpleName}${typemap[t.typeCode]}兼职</a>
	</#list>
	</p>
	</div>
	<div class="brother_city_list">
	<p><span>周边${typemap[queryTypeId]}兼职：</span>
	<#list brotherCityList as c>
	<a href="http://${c.cityId}.jianzhi8.com/jianzhi/">${c.simpleName}兼职</a>
	</#list>
	</p>
	</div>
</div>
	<#include "/WEB-INF/template/foot.ftl"/>
