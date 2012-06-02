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
        <span>��ְ��</span>&nbsp;>&nbsp;<span>${city.simpleName}��������</span>&nbsp;>&nbsp;<span>���˼���</span>
    </div>
    <div class="new-con"><strong>${user.userName}���˼���</strong></div>
    <div class="content_model">
        <p style="text-align:center;"><img 
					onerror="{this.src='/img/xp_r2_c4.jpg';}"
					src="http://my.jianzhi8.com/personimages/${user.userFileName}"
					style="BORDER: #555 1px solid; width:100px; height:100px;" alt="${typeName}���˼���"
					onload="javascript:DrawImage(this,'100','100');" border="0"
					name="faceImage"/></p>
        <p>
            ����: <span>${user.userName}</span>
        </p>
        <p>
            ����: <span>${user.userAge}</span>
        </p>
        <p>
            �Ա�: <span>${user.userSex}</span>
        </p>
        <p>
            ѧ��: <span>${user.userDigree}</span>
        </p>
        <p>
            רҵ: <span>${user.userHangye}</span>
        </p>
        <p>
            ѧУ: <span>${user.userCompanyName}</span>
        </p>
        <p>
            QQ: <span><#if user.userQq?exists && user.userQq!=''><a target=blank href=tencent://message/?uin=${user.userQq }&Menu=yes><img border='0' SRC=http://wpa.qq.com/pa?p=1:${user.userQq }:4 alt='���������ҷ���Ϣ'>${user.userQq }</a></#if></span>
        </p>
        <p>
            ��ϵ�绰: <span>
            <#if user.userPhone?exists && user.userPhone!=''>	
			<img id='Image1' name='Image1' align='absmiddle' src='/code/phone.jsp?tel=${user.userPhone }'/>
			<#else>
			<#if user.userMobile?exists && user.userMobile!='' >
			<img id='Image1' name='Image1' align='absmiddle' src='/code/phone.jsp?tel=${user.userMobile }'/>
			</#if>
		   </#if>
            </span>
        </p>
        <p>
            �־ӵ�ַ: <span>${user.userCityName}</span>
        </p>
        <p>
            ����ʱ��: <span>${user.userUpdate?string('yyyy-MM-dd')}</span>
        </p>
    </div>
    <div class="content_model">
        <h2>
            <b>��ְ����</b></h2>
        <ul>
            <li><span>��ְ����: </span>${ctClass}</li>
        </ul>
        <ul>
            <li><span>����ְλ: </span>
            <#list typeList as t><a href="/rc${typemap_py[t.typeCode]}/rcc0/" style="margin-right:5px;" target="_blank">${t.typeName}</a></#list>
			<#list jobTypeList as t><a href="/rc${jobtypemap_py[t.typeCode]}/rcc1/" style="margin-right:5px;" target="_blank">${t.typeName}</a></#list>
            </li>
        </ul>
    </div>
    <div class="content_model">
        <h2>
            <b>��������</b></h2>
        <div>
            <p>${user.userPingjia}</p>
        </div>
    </div>
    <div class="content_model">
        <h2>
            <b>��������</b></h2>
        <div>
            <p>
            ${user.userBrief}
            </p>
        </div>
    </div>
    <div class="content_model">
        <ul><li style="background-color: #EEE;"><b>��ؼ���</b></li></ul>
        <#list moreList as m>
		<ul><li><span>${m.userUpdate?string('MM-dd')}</span>${m.userCityName}<a href="/${city.cityId}/resume/${m.userNo}.html">${m.userTypeName}${m.userClass} ${m.userName}�ĸ��˼���</a></li></ul>
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
