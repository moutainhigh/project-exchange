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
	</script>
</head>
<body>
    <#include "/WEB-INF/template/head.ftl"/>
    <div class="search">
		<a href="/">兼职吧</a> &gt; 
		<a href="/${city.cityId}/">${city.simpleName}兼职</a> &gt;
		<#if c.ctClass=='0'>	
			<a href="/${city.cityId}/rc${typemap[c.ctTypeId]['typeId']}/rcc0/">${city.simpleName}找<#if c.ctTypeId?exists>${typemap[c.ctTypeId]['typeName']}</#if>工作</a>
		<#else>
			<a href="/${city.cityId}/rc${jobtypemap[c.ctTypeId]}/rcc1/">${city.simpleName}找<#if c.ctTypeId?exists>${jobtypemap[c.ctTypeId]['typeName']}</#if>工作</a>
		</#if>
    </div>
    <div class="content_model">
        <h2>
            ${c.ctTitle}
        </h2>
        <p>
            求职位: <#list typeList as t><a href="/${city.cityId}/rc${t.typeId}/rcc0/" style="margin-right:5px;" target="_blank">${t.typeName}</a></#list><#list jobTypeList as t><a href="/${city.cityId}/rc${t.typeId}/rcc1/" style="margin-right:5px;" target="_blank">${t.typeName}</a></#list>
        </p>
        <ul class="con_ul2">
			<li><span>姓&nbsp;&nbsp;名：</span><#if user.userbrief?exists><a href="/resume/${user.userNo}.html">${user.userName}</a></#if>${user.userName}</li>
			<li><span>人才类型：</span><#if user.userShenfen?exists>${user.userShenfen}<#else>未填写</#if></li>
			<li><span>学&nbsp;&nbsp;历：</span><#if c.ctDigree?exists&&c.ctDigree!=' '>${c.ctDigree}<#else>未填写</#if></li>
			<li><span>年&nbsp;&nbsp;龄：</span><#if user.userAge?exists&&user.userAge!=''>${user.userAge}<#else>未填写</#if></li>
			<li><span>性&nbsp;&nbsp;&nbsp;&nbsp;别：</span><#if c.ctSelsex?exists&&c.ctSelsex!=' '>${c.ctSelsex}<#else>未填写</#if></li>
			<li><span>期望薪水：</span><#if c.ctSalary?exists>${c.ctSalary}<#else>未填写</#if></li>
			<li><span>工作性质：</span><#if c.ctClass=='0'>兼职<#else>全职</#if></li>
			<li><span>工作地点：</span>${city.cityName}</li>
			<li><span>发布时间：</span>${c.ctUpdate?string('yyyy-MM-dd')}</li>
		</ul>
    </div>
    <div class="content_model">
        <h2><b>求职信息：</b></h2>
        <div>
            <p>
               ${c.ctContent}
               <br/>
                联系我时请一定说明是在兼职吧上看到的此信息，谢谢！
            <p>
        </div>
        <h2 class="zj_con_jc jz_bj">自我评价：</h2>
		<div class="con_p_con">
		<p class="con_sjj">
		<#if user.userPingjia?exists>${user.userPingjia}<#else>这个家伙很懒，啥也没留下~\(^o^)/~</#if>
		</p>
		</div>
    </div>
    <div class="content_model">
        <h2><b>联系方式</b></h2>
        <ul class="con_ds con_ubj">	
			<#if c.ctContact?exists && c.ctContact!=''>
			<p>
			${c.ctContact}
			</p>
			<#else>
				<#if c.ctUserName?exists && c.ctUserName!=''>
				<li>
				联系人：${c.ctUserName}
				</li>
				</#if>
				<#if c.ctPhone?exists && c.ctPhone!=''>
				<li>
				电话：<img id='Image1' name='Image1' align='absmiddle' src='/code/phone.jsp?tel=${c.ctPhone }'/>
				</li>
				</#if>
				<#if c.ctMobile?exists && c.ctMobile!='' >
				<li>
				手机：<img id='Image1' name='Image1' align='absmiddle' src='/code/phone.jsp?tel=${c.ctMobile }'/>
				</li>
				</#if>
				<#if c.ctQq?exists && c.ctQq!='' >
				<li>
				QQ：
				<a target=blank href=tencent://message/?uin=${c.ctQq }&Menu=yes><img border='0' SRC=http://wpa.qq.com/pa?p=1:${c.ctQq }:4 alt='点击这里给我发消息'>${c.ctQq }</a>
				</li>
				</#if>
				<#if  c.ctEmail?exists && c.ctEmail!='' >
				<li>
				Email：<img id='Image1' name='Image1' align='absmiddle' src='/code/email.jsp?mail=${c.ctEmail }'/>
				</li>
				</#if>				
			</#if>
		</ul>
    </div>
    <div class="content_model">
        <ul><li style="background-color: #EEE;"><b>相关求职信息：</b></li></ul>
        <#list moreList as m>
		<ul><li><span>${m.ctUpdate?string('MM-dd')}</span>&nbsp;${m.ctCityName}&nbsp;<a href="/${city.cityId}/a${m.ctNo}.html">${m.ctTitle}</a></li></ul>
		</#list>
    </div>
    <div class="new-in-wp">
        <div class="nw-wp-bg">
            <div class="nw-title">找兼职，上兼职8更容易!</div>
        </div>
    </div>
    <div class="new-con">
        <p>
            <a href="#"><strong>*</strong>广告位,推介位。</a></p>
        <p>
    </div>
<#include "/WEB-INF/template/foot.ftl"/>
