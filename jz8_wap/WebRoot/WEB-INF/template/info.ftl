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
        <span>首页</span>&nbsp;>&nbsp;<span>${city.simpleName}工作</span>&nbsp;>&nbsp;<span>${typeName}</span>
    </div>
    <div class="content_model">
        <h2>
            ${c.ctTitle}
        </h2>
        <p>
            公司名称: <#if user.userId=='admin'||user.userCompanyName==''||user.userCompanyName==' '>未填写<#else><a href="http://www.jianzhi8.com/user/${user.userId?url}" target="_blank">${user.userCompanyName}</a><#if user.userIsyz=='1'><span><img src="img/com_r2_c2.jpg" alt="该单位营业执照已作验证"/></span></#if></#if>
        </p>
        <#if c.ctClass=='0'>
		<p>职位类别:<a href="/${city.cityId}/${typemap[c.ctTypeId]['typeId']}/">${typeName}${ctClass}</a></p>
		<p><span> 工作性质：</span>兼职</p>
		</#if>
		<#if c.ctClass=='1'>
		<p>职位类别:<a href="/${city.cityId}/zp${jobtypemap[c.ctTypeId]['typeId']}/">${typeName}${ctClass}</a></p>
		<p><span> 工作性质：</span>全职</p>
		</#if>
		
    </div>
    <div class="content_model">
        <h2>
            <b>职位信息:</b></h2>
        <ul>
            <li>薪资水平:<span>${c.ctSalary}</span></li>
        </ul>
        <ul>
            <li>招聘人数:<span><#if c.ctJobnum!='0'>${c.ctJobnum}人<#else>若干</#if></span></li>
        </ul>
        <ul>
            <li>性别要求:<span>${c.ctSelsex}</span></li>
        </ul>
        <ul>
            <li>工作地点:<span>${city.name}</span></li>
        </ul>
        <#if c.ctClass=='0'>
		<ul><li><span>工作时段：</span><#if c.ctJobdate?exists>${jobdatemap[c.ctJobdate]}</#if></li></ul>
		</#if>
    </div>
    <div class="content_model">
        <h2>
            <b>职位描述</b></h2>
        <div>
            <p>
               ${c.ctContent}
               <br/>
                联系我时请一定说明是在兼职吧上看到的此信息，谢谢！
            <p>
        </div>
    </div>
    <div class="content_model">
        <h2><b>公司介绍</b></h2>
        <div>
            <p>
                ${user.userBrief}
            </p>
        </div>
    </div>
    <div class="content_model">
        <h2>
            <b>联系试</b></h2>
        <span style="color: Red; font-size: small">（警示：所有要您交纳保证金、稿费、押金等费用的招聘工作100%为虚假信息，谨防上当受骗。）</span>
        <div>
            <p>
                联系人： <span>${c.ctUserName}</span>
            </p>
            <p>
                电话： <span><img id='Image1' name='Image1' align='absmiddle' src='/code/phone.jsp?tel=${c.ctPhone }'/></span></p>
            <p>
                手机： <span><img id='Image1' name='Image1' align='absmiddle' src='/code/phone.jsp?tel=${c.ctMobile }'/></span>
            </p>
            <p>
                QQ：<span><a target=blank href=tencent://message/?uin=${c.ctQq }&Menu=yes><img border='0' SRC=http://wpa.qq.com/pa?p=1:${c.ctQq }:4 alt='点击这里给我发消息'>${c.ctQq }</a></span>
            </p>
            <p>
                Email：<span><img id='Image1' name='Image1' align='absmiddle' src='/code/email.jsp?mail=${c.ctEmail }'/></span>
            </p>
            虚假信息简单判别方法：看手机号或用户ip是否本地发布；如都是外地发布，那么需要警惕了。
        </div>
    </div>
    <div class="content_model">
        <ul><li style="background-color: #EEE;"><b>相关兼职信息：</b></li></ul>
        <#list moreList as m>
		<ul><li><span>${m.ctUpdate?string('MM-dd')}</span>&nbsp;${m.ctCityName}&nbsp;<a href="/${city.cityId}/a${m.ctNo}.html">${m.ctTitle}</a></li></ul>
		</#list>
        
    </div>
    <div>
        <p style="padding: 5px 0px;">
           您还可以查看该公司<#if user.userId=='admin'||user.userCompanyName==''><a href=#><#else><a href="http://www.jianzhi8.com/user/${user.userId?url}" target="_blank"></#if>其它职位</a>，或者<a href="http://my.jianzhi8.com/fb.do" target="_blank">发布求职信息</a>！
        </p>
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
