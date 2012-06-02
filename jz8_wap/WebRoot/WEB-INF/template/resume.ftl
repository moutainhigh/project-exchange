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
        <span>兼职吧</span>&nbsp;>&nbsp;<span>${city.simpleName}简历中心</span>&nbsp;>&nbsp;<span>个人简历</span>
    </div>
    <div class="new-con"><strong>${user.userName}个人简历</strong></div>
    <div class="content_model">
        <p style="text-align:center;"><img 
					onerror="{this.src='/img/xp_r2_c4.jpg';}"
					src="http://my.jianzhi8.com/personimages/${user.userFileName}"
					style="BORDER: #555 1px solid; width:100px; height:100px;" alt="${typeName}个人简历"
					onload="javascript:DrawImage(this,'100','100');" border="0"
					name="faceImage"/></p>
        <p>
            姓名: <span>${user.userName}</span>
        </p>
        <p>
            年龄: <span>${user.userAge}</span>
        </p>
        <p>
            性别: <span>${user.userSex}</span>
        </p>
        <p>
            学历: <span>${user.userDigree}</span>
        </p>
        <p>
            专业: <span>${user.userHangye}</span>
        </p>
        <p>
            学校: <span>${user.userCompanyName}</span>
        </p>
        <p>
            QQ: <span><#if user.userQq?exists && user.userQq!=''><a target=blank href=tencent://message/?uin=${user.userQq }&Menu=yes><img border='0' SRC=http://wpa.qq.com/pa?p=1:${user.userQq }:4 alt='点击这里给我发消息'>${user.userQq }</a></#if></span>
        </p>
        <p>
            联系电话: <span>
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
            现居地址: <span>${user.userCityName}</span>
        </p>
        <p>
            更新时间: <span>${user.userUpdate?string('yyyy-MM-dd')}</span>
        </p>
    </div>
    <div class="content_model">
        <h2>
            <b>求职意向</b></h2>
        <ul>
            <li><span>求职类型: </span>${ctClass}</li>
        </ul>
        <ul>
            <li><span>期望职位: </span>
            <#list typeList as t><a href="/rc${typemap_py[t.typeCode]}/rcc0/" style="margin-right:5px;" target="_blank">${t.typeName}</a></#list>
			<#list jobTypeList as t><a href="/rc${jobtypemap_py[t.typeCode]}/rcc1/" style="margin-right:5px;" target="_blank">${t.typeName}</a></#list>
            </li>
        </ul>
    </div>
    <div class="content_model">
        <h2>
            <b>自我评价</b></h2>
        <div>
            <p>${user.userPingjia}</p>
        </div>
    </div>
    <div class="content_model">
        <h2>
            <b>工作经验</b></h2>
        <div>
            <p>
            ${user.userBrief}
            </p>
        </div>
    </div>
    <div class="content_model">
        <ul><li style="background-color: #EEE;"><b>相关简历</b></li></ul>
        <#list moreList as m>
		<ul><li><span>${m.userUpdate?string('MM-dd')}</span>${m.userCityName}<a href="/${city.cityId}/resume/${m.userNo}.html">${m.userTypeName}${m.userClass} ${m.userName}的个人简历</a></li></ul>
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
