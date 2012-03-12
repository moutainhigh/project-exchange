<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${city.simpleName}${user.userName }���˼���</title>
		<meta name="keywords" content='${city.simpleName}${user.userName }' />
		<meta name="description" content='${city.simpleName}${user.userName }������Ϣ,�����ṩ${user.userCompanyName}������${city.simpleName}���µ�${user.userName }������Ѷ,������Щ��˾����Ƹ${user.userName }��${city.simpleName}${user.userClass}${user.userTypeName }���¼${city.simpleName}��ְ�ɲ鿴��'/>
		<link rel="Bookmark" href="http://www.jianzhi8.com/comcity/favicon.ico" />
		<link rel="shortcut icon" href="http://www.jianzhi8.com/comcity/favicon.ico" type="image/x-icon" />
		<link href="${base}css/reset.css" rel="stylesheet" type="text/css" />
		<script src="${base}js/jquery-1.7.1.min.js"></script>
		<script src="${base}js/image.js"></script>
		<script></script>
	</head>

<body>
	<#include "/WEB-INF/template/head.ftl"/>
	<!--��ǰλ������-->
	<div class="current con_wlnr">
		<a href="http://www.jianzhi8.com/">��ְ��</a> &gt; 
		<a href="/">${city.simpleName}��ְ</a> &gt;
		<a href="/resume/${user.userTypeId}">${city.simpleName}<#if user.userTypeId?exists>${typemap[user.userTypeId]}</#if>����</a>
		<#if area?exists>
		&gt;  <a href="/resume/${user.userTypeId}a${area.cityCode}">${area.simpleName}<#if user.userTypeId?exists>${typemap[user.userTypeId]}</#if>����</a>
		</#if>
	</div>
	
	<div class="zj_con">
		<div class="zj_con_l">
			<h3>${user.userName}���˼���<span>����ʱ�䣺${user.userUpdate?string('yyyy-MM-dd')}&nbsp;&nbsp;&nbsp;�����${user.userLooknum!1}��</span></h3>
			<div class="con_gr_jl">
	<table>
			<tr>
				<td style="width:300px;"><span>��&nbsp;&nbsp;&nbsp;&nbsp;����</span><a href="#">${user.userName}</a></td>
				<td style="width:300px;"><span>��&nbsp;&nbsp;&nbsp;&nbsp;��</span>${user.userSex}</td>
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
				<td><span>��&nbsp;&nbsp;&nbsp;&nbsp;�䣺</span>${user.userAge}</td>
				<td><span>ѧ&nbsp;&nbsp;&nbsp;&nbsp;����</span>${user.userDigree}</td>
				</tr>
			<tr>
				<td><span>ѧ&nbsp;&nbsp;&nbsp;&nbsp;У��</span>${user.userCompanyName}</td>
				<td><span>ר&nbsp;&nbsp;&nbsp;&nbsp;ҵ��</span>${user.userHangye}</td>
				</tr>
			<tr>
				<td><span>��ϵ�绰��</span><#if user.userMobile?exists && user.userMobile!=''><img src="/code!u?type=mobile&no=${user.userNo}" /></#if></td>
				<td><span>��&nbsp;ϵ QQ��</span><#if user.userQq?exists && user.userQq!=''><img src="/code!u?type=qq&no=${user.userNo}" /></#if></td>
				</tr>
			<tr>
				<td colspan="2"><span>�־ӵ�ַ��</span>${user.userCityName}</td>
				</tr>
</table>

			</div>
		
			<h2 class="zj_con_jc jz_bj con_zpx">��ְ����</h2>
			<ul class="con_ul con_ubj">
				<li><span>��ְ���ͣ�</span>${user.userClass}</li>
				<li><span>����ְλ��</span><#list typeList as t><a href="/resume/${t.typeCode}" style="margin-right:20px;">${t.typeName}</a></#list></li>
			</ul>
			
			<h2 class="zj_con_jc jz_bj">�������ۣ�</h2>
			<div class="con_p_con">
			<p class="con_sjj">${user.userPingjia}</p>
			</div>
			<h2 class="zj_con_jc jz_bj">�������飺</h2>
			<ul class="con_ds con_ul con_ubj">
				<li>${user.userBrief}</li>
			</ul>
			
			
				<ul class="con_xh">
					<li class="zj_con_jc">��ظ��˼�����</li>
					<#list moreList as m>
					<li><span>${m.userUpdate?string('MM-dd')}</span><a href="/resume/<#if m.userCityId?exists>a${m.userCityId}</#if>">${m.userCityName}</a><a href="/b${m.userNo}.html">${m.userTypeName}${m.userClass} ${m.userName}�ĸ��˼���</a></li>
					</#list>
				</ul>
				
				<p class="con_ckz">�������Բ鿴�ù�˾<a href="#">������ְ����</a>������<a href="#">������Ƹ��Ϣ</a>��</p>
				
		</div>
		<div class="zj_con_r zj_con_gr">
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
