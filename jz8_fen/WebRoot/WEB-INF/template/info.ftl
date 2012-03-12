<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${city.simpleName}${c.ctTitle }</title>
		<meta name="keywords" content='${city.simpleName}${c.ctTitle }' />
		<meta name="description" content='${city.simpleName}${c.ctTitle }工作信息,我们提供${user.userCompanyName}发布的${city.simpleName}最新的${c.ctTitle }工作资讯,还有哪些公司在招聘${c.ctTitle }和${city.simpleName}${c.ctClass}${c.ctTypeName }请登录${city.simpleName}兼职吧查看。'/>
		<link rel="Bookmark" href="http://www.jianzhi8.com/comcity/favicon.ico" />
		<link rel="shortcut icon" href="http://www.jianzhi8.com/comcity/favicon.ico" type="image/x-icon" />
		<link href="${base}css/reset.css" rel="stylesheet" type="text/css" />
		<script src="${base}js/jquery-1.7.1.min.js"></script>
	</head>

<body>
	<#include "/WEB-INF/template/head.ftl"/>
	<!--当前位置区域-->
	<div class="current con_wlnr">
		<a href="http://www.jianzhi8.com/">兼职吧</a> &gt; 
		<a href="/">${city.simpleName}兼职</a> &gt;
		<#if c.ctClass=='0'>
		<a href="/jianzhi/${c.ctTypeId}">${city.simpleName}兼职<#if c.ctTypeId?exists>${typemap[c.ctTypeId]}</#if>工作</a>
		<#elseif  c.ctClass=='1'>
		<a href="/job/${c.ctTypeId}">${city.simpleName}招聘<#if c.ctTypeId?exists>${jobtypemap[c.ctTypeId]}</#if>工作</a>
		</#if>
		<#if area?exists>
		&gt;  
			<#if c.ctClass=='0'>
			<a href="/jianzhi/${c.ctTypeId}a${area.cityCode}">${area.simpleName}兼职<#if c.ctTypeId?exists>${typemap[c.ctTypeId]}</#if>工作</a>
			<#elseif  c.ctClass=='1'>
			<a href="/job/${c.ctTypeId}a${area.cityCode}">${area.simpleName}招聘<#if c.ctTypeId?exists>${jobtypemap[c.ctTypeId]}</#if>工作</a>
			</#if>
		</#if>
	</div>
	
	<div class="zj_con">
		<div class="zj_con_l">
			<h3>${c.ctTitle}<span>发布时间：${c.ctUpdate?string('yyyy-MM-dd')}&nbsp;&nbsp;&nbsp;浏览：${c.ctLooknum}次</span></h3>
			
			<p class="zj_con_rz">公司名称：<a href="#">${user.userCompanyName}</a><#if user.userIsyz=='1'><span><a href="/yanzheng/"><img src="img/com_r2_c2.jpg" /></a></span></#if></p>
			<p class="zj_con_sp"><span>职位类别：</span><a href="/<#if c.ctClass=='0'>jianzhi<#elseif  c.ctClass=='1'>job</#if>/${c.ctTypeId}" target="_blank">${c.ctTypeName}</a>&nbsp;&nbsp; <span> 公司性质：</span><#if user.userKind=='1'>企业<#else>个人</#if>&nbsp;&nbsp;<span> 工作性质：</span><#if c.ctClass=='0'>兼职<#else>全职</#if></p>
			<p class="zj_con_jc jz_bj con_zpx">职位信息：</p>
			<ul class="con_ul con_ubj">
				<li><span>薪资水平：</span>${c.ctSalary}</li>
				<li><span>招聘人数：</span><#if c.ctJobnum!='0'>${c.ctJobnum}人<#else>若干</#if></li>
				<li><span>性别要求：</span>${c.ctSelsex}</li>
				<li><span>工作时间：</span><#if c.ctJobdate?exists>${jobdatemap[c.ctJobdate]}</#if></li>
				<li><span>工作地点：</span>${city.name}</li>
			</ul>
			
			<p class="zj_con_jc">职位描述：</p>
			<ul class="con_bh con_ul con_ubj">
				<p>${c.ctContent}</p
			</ul>
			<p class="zj_con_jc jz_bj">公司介绍：</p>
			<p class="con_dl">${user.userBrief}</p>
			
			<p class="zj_con_jc jz_bj">联系方式：</p>
			<#if c.ctContract?exists>
			<ul class="con_ds con_ul con_ubj">
				<li>${c.ctContract}</li>
			</ul>
			<#else>
			<ul class="con_ds con_ul con_ubj">
				<#if user.userMobile?exists && user.userMobile!=''><li>联系电话：<img src="/code!c?type=mobile&j=Y&no=${c.ctNo}" /></li></#if>
				<li>联系人：${user.userName}</li>
				<#if user.userQq?exists && user.userQq!=''><li>QQ：<img src="/code!c?type=qq&j=Y&no=${c.ctNo}" /></li></#if>
				<#if user.userEmail?exists && user.userEmail!=''><li>Email：<img src="/code!c?type=email&j=Y&no=${c.ctNo}" /></li></#if>
			</ul>
			</#if>
			
			<ul class="con_xh">
				<li class="zj_con_jc">相关兼职信息：</li>
				<#list moreList as m>
				<li><span>${m.ctUpdate?string('MM-dd')}</span><a href="/jianzhi/<#if m.ctCityId?exists>a${m.ctCityId}</#if>">${m.ctCityName}</a><a href="/a${m.ctNo}.html">${m.ctTitle}</a></li>
				</#list>
			</ul>
			
			<p class="con_ckz">您还可以查看该公司<a href="#">其它职位</a>，或者<a href="#">发布求职信息</a>！</p>
				
		</div>
		<div class="zj_con_r">
			<h3>兼职吧免责声明</h3>
			<p> 
所有${city.simpleName}招聘兼职大学生服务生免押金信息均由用户自行发布，其真实性、准确性和合法性由信息发布人负责， ${city.simpleName}兼职网不承担由于香格里拉大酒店招聘兼职大学生服务生免押金其内容的合法性及真实性所引起的一切争议和法律责任。</p>
			<p class="zj_con_img"><img src="img/nr_s1.jpg" /></p>
		</div>
		<div class="clear"></div>
	</div>

	<p class="tb_jz">
	<span>周边兼职简历：</span>
	<#list subCityList as city>
	<a href="/resume/a${city.cityCode}">${city.simpleName}简历</a>
	</#list>
	</p>
<#include "/WEB-INF/template/foot.ftl"/>
