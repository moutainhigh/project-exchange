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
		<a href="/resume/${Parameters["typeId"]}">${city.simpleName}${typemap[typeId]}<#if queryTypeId?exists && queryTypeId.length()==5>${typemap[queryTypeId]}</#if>简历中心</a>
		<#if areaId?? && areaId!=''>
		 &gt;  <a href="/resume/${Parameters["typeId"]}a${areaId}">${areaName}<#if queryTypeId?exists && queryTypeId.length()==5>${typemap[queryTypeId]}</#if>简历</a>
		</#if>
	</div>
	<div class="con_top">
		<div class="con_top_top">
			<p>职位：
			<a href="/resume/${Parameters["areaId"]}${Parameters["key"]}" style="color:black;font-weight:600;">全部</a>
			<#list childTypeList as t>
			<a href="/resume/${t.typeCode}${Parameters["areaId"]}${Parameters["key"]}" <#if queryTypeId?? && queryTypeId==t.typeCode>class="curr_sel"</#if>>${t.typeName}</a>
			</#list>
			</p>
			<p id="areaP">区域：
			<a href="/resume/${Parameters["typeId"]}${Parameters["key"]}" style="color:black;font-weight:600;">全部</a>
			<#list subCityList as c>
			<a href="/resume/${Parameters["typeId"]}a${c.cityCode}${Parameters["key"]}" <#if areaId?? && areaId==c.cityCode>class="curr_sel"</#if>>${c.simpleName}</a>
			</#list>
			</p>
		</div>
		<div class="con_top_bom">
			<form action="/s/" method="get">
				<input type="text" id="loc_key" name="loc_key" class="con_bk" value="请输入职位名称" onblur="if(this.value==''){this.value='请输入职位名称'}" onfocus="if(this.value=='请输入职位名称'){this.value=''}"/><input type="button" class="con_ss" id="" name=" " value="搜索" onclick="doLocSearch('简历');"/>
				<span>热门：
				<#list words as w>
				<a href="/resume/s${(w+'兼职')?url}">${w}</a>
				</#list>
				</span>
			</form>
		</div>
	</div>

<div class="nr_bq_bg">
	<table width="951" cellpadding="0" cellspacing="0" class="tb1">
		<tr align="left">
			<td width="146" class="tb_p">姓名</td>
			<td width="146">期望职位</td>
			<td width="146">求职类型</td>
			<td width="99">性别</td>
			<td width="87">年龄</td>
			<td width="139">现住地址</td>
			<td width="113">人才类型</td>
			<td width="73">时间</td>
		</tr>
		</table>
		<table width="951" cellpadding="0" cellspacing="0">
		<tr>
			<td class="tb_p"><p>
			<a href="#">优惠网</a><a href="#">返利网</a> | <a href="#">51Faili.com</a><span class="te_nr"><a href="#">国内首家网购返利网站</a><a href="#">月返现金200万</a><a href="#">返还网返利网</a><a href="#">国购物返现金高达50%</a></span><strong class="te_nn"><a href="#">赞助商链接</a></strong></p>
			</td>
		</tr>
		<tr>
			<td class="tb_p">
			<a href="#">网韵网络</a><a href="#">网页设计公司</a><a href="#">www.72en.com</a><span class="te_nr"><a href="#">专业提供网页设计公司等服务顶尖的网站制作设计，价格优惠！</a></span>
			</td>
		</tr>
		</table>
		<table width="951" cellpadding="0" cellspacing="0">
		<#list bean.resultList as r>
		<tr align="left";>
			<td width="143" class="tb_p"><a href="/b${r.userNo}.html" target="_blank">${r.userName}</a></td>
			<td width="152">${r.typeName}</td>
			<td width="149">${r.userClass}</td>
			<td width="94">${r.sex}</td>
			<td width="93">${r.age}</td>
			<td width="136">${r.area}</td>
			<td width="106">${r.shenfen}</td>
			<td width="76">${r.date?string('MM-dd')}</td>
		</tr>
		</#list>
	</table>
	<table width="951" cellpadding="0" cellspacing="0">
		<tr>
		<td class="tb_p"><p>
			<a href="#">优惠网</a><a href="#">返利网</a> | <a href="#">51Faili.com</a><span class="te_nr"><a href="#">国内首家网购返利网站</a><a href="#">月返现金200万</a><a href="#">返还网返利网</a><a href="#">国购物返现金高达50%</a></span><strong class="te_nn"><a href="#">赞助商链接</a></strong></p>
			</td>
		</tr>
		<tr>
			<td class="tb_p">
			<a href="#">网韵网络</a><a href="#">网页设计公司</a><a href="#">www.72en.com</a><span class="te_nr"><a href="#">专业提供网页设计公司等服务顶尖的网站制作设计，价格优惠！</a></span>
			</td>
		</tr>
		
		</table>

		<div class="con_fy">
		『最新<font color="red"> ${bean.totalRow }</font> 条』 『${bean.pageIndex }/${bean.maxPage } 页』 &nbsp;
		<#if !bean.isFirstPage>
			<a href="/resume/${Parameters["typeId"]}${Parameters["areaId"]}p1${Parameters["key"]}">首页</a>
			<a href="/resume/${Parameters["typeId"]}${Parameters["areaId"]}p${bean.prePageIndex}${Parameters["key"]}">上页</a>
		</#if>
		${bean.getPaper('/resume/' + Parameters["typeId"] + Parameters["areaId"],Parameters["key"])}
		<#if !bean.isLastPage>
			<a href="/resume/${Parameters["typeId"]}${Parameters["areaId"]}p${bean.maxPage}${Parameters["key"]}">${bean.maxPage}</a>
			<a href="/resume/${Parameters["typeId"]}${Parameters["areaId"]}p${bean.nextPageIndex}${Parameters["key"]}">下页</a>
		</#if>
		</div>
<div class="clear"></div>
</div>
<div class="tb_bom">
	<p>还没有简历？那快<a href="http://my.jianzhi8.com" target="_blank">登记一份简历</a>吧！</p>
</div>
<div class="friendly_link">
	<div class="type_list">
	<p><span>${city.simpleName}其他简历：</span>
	<#list typeList as t>
	<a href="/resume/${t.typeCode}">${city.simpleName}${typemap[t.typeCode]}简历</a>
	</#list>
	</p>
	</div>
	<div class="brother_city_list">
	<p><span>周边${typemap[queryTypeId]}简历：</span>
	<#list brotherCityList as c>
	<a href="http://${c.cityId}.jianzhi8.com/resume/">${c.simpleName}简历</a>
	</#list>
	</p>
	</div>
</div>
	<#include "/WEB-INF/template/foot.ftl"/>
