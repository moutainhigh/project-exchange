<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${city.simpleName}${c.ctTitle }</title>
		<meta name="keywords" content='${city.simpleName}${c.ctTitle }' />
		<meta name="description" content='${city.simpleName}${c.ctTitle }������Ϣ,�����ṩ${user.userCompanyName}������${city.simpleName}���µ�${c.ctTitle }������Ѷ,������Щ��˾����Ƹ${c.ctTitle }��${city.simpleName}${c.ctClass}${c.ctTypeName }���¼${city.simpleName}��ְ�ɲ鿴��'/>
		<link rel="Bookmark" href="http://www.jianzhi8.com/comcity/favicon.ico" />
		<link rel="shortcut icon" href="http://www.jianzhi8.com/comcity/favicon.ico" type="image/x-icon" />
		<link href="${base}css/reset.css" rel="stylesheet" type="text/css" />
		<script src="${base}js/jquery-1.7.1.min.js"></script>
	</head>

<body>
	<#include "/WEB-INF/template/head.ftl"/>
	<!--��ǰλ������-->
	<div class="current con_wlnr">
		<a href="http://www.jianzhi8.com/">��ְ��</a> &gt; 
		<a href="/">${city.simpleName}��ְ</a> &gt;
		<#if c.ctClass=='0'>
		<a href="/jianzhi/${c.ctTypeId}">${city.simpleName}��ְ<#if c.ctTypeId?exists>${typemap[c.ctTypeId]}</#if>����</a>
		<#elseif  c.ctClass=='1'>
		<a href="/job/${c.ctTypeId}">${city.simpleName}��Ƹ<#if c.ctTypeId?exists>${jobtypemap[c.ctTypeId]}</#if>����</a>
		</#if>
		<#if area?exists>
		&gt;  
			<#if c.ctClass=='0'>
			<a href="/jianzhi/${c.ctTypeId}a${area.cityCode}">${area.simpleName}��ְ<#if c.ctTypeId?exists>${typemap[c.ctTypeId]}</#if>����</a>
			<#elseif  c.ctClass=='1'>
			<a href="/job/${c.ctTypeId}a${area.cityCode}">${area.simpleName}��Ƹ<#if c.ctTypeId?exists>${jobtypemap[c.ctTypeId]}</#if>����</a>
			</#if>
		</#if>
	</div>
	
	<div class="zj_con">
		<div class="zj_con_l">
			<h3>${c.ctTitle}<span>����ʱ�䣺${c.ctUpdate?string('yyyy-MM-dd')}&nbsp;&nbsp;&nbsp;�����${c.ctLooknum}��</span></h3>
			
			<p class="zj_con_rz">��˾���ƣ�<a href="#">${user.userCompanyName}</a><#if user.userIsyz=='1'><span><a href="/yanzheng/"><img src="img/com_r2_c2.jpg" /></a></span></#if></p>
			<p class="zj_con_sp"><span>ְλ���</span><a href="/<#if c.ctClass=='0'>jianzhi<#elseif  c.ctClass=='1'>job</#if>/${c.ctTypeId}" target="_blank">${c.ctTypeName}</a>&nbsp;&nbsp; <span> ��˾���ʣ�</span><#if user.userKind=='1'>��ҵ<#else>����</#if>&nbsp;&nbsp;<span> �������ʣ�</span><#if c.ctClass=='0'>��ְ<#else>ȫְ</#if></p>
			<p class="zj_con_jc jz_bj con_zpx">ְλ��Ϣ��</p>
			<ul class="con_ul con_ubj">
				<li><span>н��ˮƽ��</span>${c.ctSalary}</li>
				<li><span>��Ƹ������</span><#if c.ctJobnum!='0'>${c.ctJobnum}��<#else>����</#if></li>
				<li><span>�Ա�Ҫ��</span>${c.ctSelsex}</li>
				<li><span>����ʱ�䣺</span><#if c.ctJobdate?exists>${jobdatemap[c.ctJobdate]}</#if></li>
				<li><span>�����ص㣺</span>${city.name}</li>
			</ul>
			
			<p class="zj_con_jc">ְλ������</p>
			<ul class="con_bh con_ul con_ubj">
				<p>${c.ctContent}</p
			</ul>
			<p class="zj_con_jc jz_bj">��˾���ܣ�</p>
			<p class="con_dl">${user.userBrief}</p>
			
			<p class="zj_con_jc jz_bj">��ϵ��ʽ��</p>
			<#if c.ctContract?exists>
			<ul class="con_ds con_ul con_ubj">
				<li>${c.ctContract}</li>
			</ul>
			<#else>
			<ul class="con_ds con_ul con_ubj">
				<#if user.userMobile?exists && user.userMobile!=''><li>��ϵ�绰��<img src="/code!c?type=mobile&j=Y&no=${c.ctNo}" /></li></#if>
				<li>��ϵ�ˣ�${user.userName}</li>
				<#if user.userQq?exists && user.userQq!=''><li>QQ��<img src="/code!c?type=qq&j=Y&no=${c.ctNo}" /></li></#if>
				<#if user.userEmail?exists && user.userEmail!=''><li>Email��<img src="/code!c?type=email&j=Y&no=${c.ctNo}" /></li></#if>
			</ul>
			</#if>
			
			<ul class="con_xh">
				<li class="zj_con_jc">��ؼ�ְ��Ϣ��</li>
				<#list moreList as m>
				<li><span>${m.ctUpdate?string('MM-dd')}</span><a href="/jianzhi/<#if m.ctCityId?exists>a${m.ctCityId}</#if>">${m.ctCityName}</a><a href="/a${m.ctNo}.html">${m.ctTitle}</a></li>
				</#list>
			</ul>
			
			<p class="con_ckz">�������Բ鿴�ù�˾<a href="#">����ְλ</a>������<a href="#">������ְ��Ϣ</a>��</p>
				
		</div>
		<div class="zj_con_r">
			<h3>��ְ����������</h3>
			<p> 
����${city.simpleName}��Ƹ��ְ��ѧ����������Ѻ����Ϣ�����û����з���������ʵ�ԡ�׼ȷ�ԺͺϷ�������Ϣ�����˸��� ${city.simpleName}��ְ�����е��������������Ƶ���Ƹ��ְ��ѧ����������Ѻ�������ݵĺϷ��Լ���ʵ���������һ������ͷ������Ρ�</p>
			<p class="zj_con_img"><img src="img/nr_s1.jpg" /></p>
		</div>
		<div class="clear"></div>
	</div>

	<p class="tb_jz">
	<span>�ܱ߼�ְ������</span>
	<#list subCityList as city>
	<a href="/resume/a${city.cityCode}">${city.simpleName}����</a>
	</#list>
	</p>
<#include "/WEB-INF/template/foot.ftl"/>
