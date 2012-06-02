<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta name="viewport" content="width=device-width; initial-scale=1.0; minimum-scale=1.0; maximum-scale=2.0" />
    <meta name="MobileOptimized" content="240" />
    <meta name="format-detection" content="telephone=no" />
    <title>��ְ8--${city.simpleName}վ--</title>
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <script src="/js/jquery-1.4.3.min.js" type="text/javascript"></script>
    <script type="text/javascript">
	</script>
</head>
<body>
    <#include "/WEB-INF/template/head.ftl"/>
    <div class="search">
		<a href="/">��ְ��</a> &gt; 
		<a href="/${city.cityId}/">${city.simpleName}��ְ</a> &gt;
		<#if c.ctClass=='0'>	
			<a href="/${city.cityId}/rc${typemap[c.ctTypeId]['typeId']}/rcc0/">${city.simpleName}��<#if c.ctTypeId?exists>${typemap[c.ctTypeId]['typeName']}</#if>����</a>
		<#else>
			<a href="/${city.cityId}/rc${jobtypemap[c.ctTypeId]}/rcc1/">${city.simpleName}��<#if c.ctTypeId?exists>${jobtypemap[c.ctTypeId]['typeName']}</#if>����</a>
		</#if>
    </div>
    <div class="content_model">
        <h2>
            ${c.ctTitle}
        </h2>
        <p>
            ��ְλ: <#list typeList as t><a href="/${city.cityId}/rc${t.typeId}/rcc0/" style="margin-right:5px;" target="_blank">${t.typeName}</a></#list><#list jobTypeList as t><a href="/${city.cityId}/rc${t.typeId}/rcc1/" style="margin-right:5px;" target="_blank">${t.typeName}</a></#list>
        </p>
        <ul class="con_ul2">
			<li><span>��&nbsp;&nbsp;����</span><#if user.userbrief?exists><a href="/resume/${user.userNo}.html">${user.userName}</a></#if>${user.userName}</li>
			<li><span>�˲����ͣ�</span><#if user.userShenfen?exists>${user.userShenfen}<#else>δ��д</#if></li>
			<li><span>ѧ&nbsp;&nbsp;����</span><#if c.ctDigree?exists&&c.ctDigree!=' '>${c.ctDigree}<#else>δ��д</#if></li>
			<li><span>��&nbsp;&nbsp;�䣺</span><#if user.userAge?exists&&user.userAge!=''>${user.userAge}<#else>δ��д</#if></li>
			<li><span>��&nbsp;&nbsp;&nbsp;&nbsp;��</span><#if c.ctSelsex?exists&&c.ctSelsex!=' '>${c.ctSelsex}<#else>δ��д</#if></li>
			<li><span>����нˮ��</span><#if c.ctSalary?exists>${c.ctSalary}<#else>δ��д</#if></li>
			<li><span>�������ʣ�</span><#if c.ctClass=='0'>��ְ<#else>ȫְ</#if></li>
			<li><span>�����ص㣺</span>${city.cityName}</li>
			<li><span>����ʱ�䣺</span>${c.ctUpdate?string('yyyy-MM-dd')}</li>
		</ul>
    </div>
    <div class="content_model">
        <h2><b>��ְ��Ϣ��</b></h2>
        <div>
            <p>
               ${c.ctContent}
               <br/>
                ��ϵ��ʱ��һ��˵�����ڼ�ְ���Ͽ����Ĵ���Ϣ��лл��
            <p>
        </div>
        <h2 class="zj_con_jc jz_bj">�������ۣ�</h2>
		<div class="con_p_con">
		<p class="con_sjj">
		<#if user.userPingjia?exists>${user.userPingjia}<#else>����һ������ɶҲû����~\(^o^)/~</#if>
		</p>
		</div>
    </div>
    <div class="content_model">
        <h2><b>��ϵ��ʽ</b></h2>
        <ul class="con_ds con_ubj">	
			<#if c.ctContact?exists && c.ctContact!=''>
			<p>
			${c.ctContact}
			</p>
			<#else>
				<#if c.ctUserName?exists && c.ctUserName!=''>
				<li>
				��ϵ�ˣ�${c.ctUserName}
				</li>
				</#if>
				<#if c.ctPhone?exists && c.ctPhone!=''>
				<li>
				�绰��<img id='Image1' name='Image1' align='absmiddle' src='/code/phone.jsp?tel=${c.ctPhone }'/>
				</li>
				</#if>
				<#if c.ctMobile?exists && c.ctMobile!='' >
				<li>
				�ֻ���<img id='Image1' name='Image1' align='absmiddle' src='/code/phone.jsp?tel=${c.ctMobile }'/>
				</li>
				</#if>
				<#if c.ctQq?exists && c.ctQq!='' >
				<li>
				QQ��
				<a target=blank href=tencent://message/?uin=${c.ctQq }&Menu=yes><img border='0' SRC=http://wpa.qq.com/pa?p=1:${c.ctQq }:4 alt='���������ҷ���Ϣ'>${c.ctQq }</a>
				</li>
				</#if>
				<#if  c.ctEmail?exists && c.ctEmail!='' >
				<li>
				Email��<img id='Image1' name='Image1' align='absmiddle' src='/code/email.jsp?mail=${c.ctEmail }'/>
				</li>
				</#if>				
			</#if>
		</ul>
    </div>
    <div class="content_model">
        <ul><li style="background-color: #EEE;"><b>�����ְ��Ϣ��</b></li></ul>
        <#list moreList as m>
		<ul><li><span>${m.ctUpdate?string('MM-dd')}</span>&nbsp;${m.ctCityName}&nbsp;<a href="/${city.cityId}/a${m.ctNo}.html">${m.ctTitle}</a></li></ul>
		</#list>
    </div>
    <div class="new-in-wp">
        <div class="nw-wp-bg">
            <div class="nw-title">�Ҽ�ְ���ϼ�ְ8������!</div>
        </div>
    </div>
    <div class="new-con">
        <p>
            <a href="#"><strong>*</strong>���λ,�ƽ�λ��</a></p>
        <p>
    </div>
<#include "/WEB-INF/template/foot.ftl"/>
