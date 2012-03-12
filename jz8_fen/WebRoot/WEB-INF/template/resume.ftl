<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${city.simpleName}${user.userName }个人简历</title>
		<meta name="keywords" content='${city.simpleName}${user.userName }' />
		<meta name="description" content='${city.simpleName}${user.userName }工作信息,我们提供${user.userCompanyName}发布的${city.simpleName}最新的${user.userName }工作资讯,还有哪些公司在招聘${user.userName }和${city.simpleName}${user.userClass}${user.userTypeName }请登录${city.simpleName}兼职吧查看。'/>
		<link rel="Bookmark" href="http://www.jianzhi8.com/comcity/favicon.ico" />
		<link rel="shortcut icon" href="http://www.jianzhi8.com/comcity/favicon.ico" type="image/x-icon" />
		<link href="${base}css/reset.css" rel="stylesheet" type="text/css" />
		<script src="${base}js/jquery-1.7.1.min.js"></script>
		<script src="${base}js/image.js"></script>
		<script></script>
	</head>

<body>
	<#include "/WEB-INF/template/head.ftl"/>
	<!--当前位置区域-->
	<div class="current con_wlnr">
		<a href="http://www.jianzhi8.com/">兼职吧</a> &gt; 
		<a href="/">${city.simpleName}兼职</a> &gt;
		<a href="/resume/${user.userTypeId}">${city.simpleName}<#if user.userTypeId?exists>${typemap[user.userTypeId]}</#if>简历</a>
		<#if area?exists>
		&gt;  <a href="/resume/${user.userTypeId}a${area.cityCode}">${area.simpleName}<#if user.userTypeId?exists>${typemap[user.userTypeId]}</#if>简历</a>
		</#if>
	</div>
	
	<div class="zj_con">
		<div class="zj_con_l">
			<h3>${user.userName}个人简历<span>发布时间：${user.userUpdate?string('yyyy-MM-dd')}&nbsp;&nbsp;&nbsp;浏览：${user.userLooknum!1}次</span></h3>
			<div class="con_gr_jl">
	<table>
			<tr>
				<td style="width:300px;"><span>姓&nbsp;&nbsp;&nbsp;&nbsp;名：</span><a href="#">${user.userName}</a></td>
				<td style="width:300px;"><span>性&nbsp;&nbsp;&nbsp;&nbsp;别：</span>${user.userSex}</td>
				<td style="" rowspan="6" align="center">
				<img 
					onerror="{this.src='http://my.jianzhi8.com/personimages/face.gif';}"
					src="img/xp_r2_c4.jpg"
					style="BORDER: #555 1px solid;" alt="${user.userName }"
					onload="javascript:DrawImage(this,'130','130');" border="0"
					name="faceImage"/>
				</td>
			</tr>
			<tr>
				<td><span>年&nbsp;&nbsp;&nbsp;&nbsp;龄：</span>${user.userAge}</td>
				<td><span>学&nbsp;&nbsp;&nbsp;&nbsp;历：</span>${user.userDigree}</td>
				</tr>
			<tr>
				<td><span>学&nbsp;&nbsp;&nbsp;&nbsp;校：</span>${user.userCompanyName}</td>
				<td><span>专&nbsp;&nbsp;&nbsp;&nbsp;业：</span>${user.userHangye}</td>
				</tr>
			<tr>
				<td><span>联系电话：</span><#if user.userMobile?exists && user.userMobile!=''><img src="/code!u?type=mobile&no=${user.userNo}" /></#if></td>
				<td><span>联&nbsp;系 QQ：</span><#if user.userQq?exists && user.userQq!=''><img src="/code!u?type=qq&no=${user.userNo}" /></#if></td>
				</tr>
			<tr>
				<td colspan="2"><span>现居地址：</span>${user.userCityName}</td>
				</tr>
</table>

			</div>
		
			<h2 class="zj_con_jc jz_bj con_zpx">求职意向：</h2>
			<ul class="con_ul con_ubj">
				<li><span>求职类型：</span>${user.userClass}</li>
				<li><span>期望职位：</span><#list typeList as t><a href="/resume/${t.typeCode}" style="margin-right:20px;">${t.typeName}</a></#list></li>
			</ul>
			
			<h2 class="zj_con_jc jz_bj">自我评价：</h2>
			<div class="con_p_con">
			<p class="con_sjj">${user.userPingjia}</p>
			</div>
			<h2 class="zj_con_jc jz_bj">工作经验：</h2>
			<ul class="con_ds con_ul con_ubj">
				<li>${user.userBrief}</li>
			</ul>
			
			
				<ul class="con_xh">
					<li class="zj_con_jc">相关个人简历：</li>
					<#list moreList as m>
					<li><span>${m.userUpdate?string('MM-dd')}</span><a href="/resume/<#if m.userCityId?exists>a${m.userCityId}</#if>">${m.userCityName}</a><a href="/b${m.userNo}.html">${m.userTypeName}${m.userClass} ${m.userName}的个人简历</a></li>
					</#list>
				</ul>
				
				<p class="con_ckz">您还可以查看该公司<a href="#">其他求职简历</a>，或者<a href="#">发布招聘信息</a>！</p>
				
		</div>
		<div class="zj_con_r zj_con_gr">
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
