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
		<script>
			var jobtimes = '${c.ctJobtime}';
			$(function(){
				if(jobtimes != ''){
					var arr = jobtimes.split('-');
					for(var i = 0 ; i < arr.length; i++){
						$('td.t' + arr[i]).html('<img src="img/g_r2_c2.jpg" />');					
					}
				}
			});
		</script>
	</head>

<body>
	<#include "/WEB-INF/template/head.ftl"/>
	<!--当前位置区域-->
	<div class="current con_wlnr">
		<a href="http://www.jianzhi8.com/">兼职吧</a> &gt; 
		<a href="/">${city.simpleName}兼职</a> &gt;
		<a href="/rencai/${c.ctTypeId}">${city.simpleName}<#if c.ctTypeId?exists>${typemap[c.ctTypeId]}</#if>求职</a>
		<#if area?exists>
		&gt;  <a href="/rencai/${c.ctTypeId}a${area.cityCode}">${area.simpleName}<#if c.ctTypeId?exists>${typemap[c.ctTypeId]}</#if>求职</a>
		</#if>
	</div>
	
	<div class="zj_con">
		<div class="zj_con_l">
			<h3>${c.ctTitle}<span>发布时间：${c.ctUpdate?string('yyyy-MM-dd')}&nbsp;&nbsp;&nbsp;浏览：${c.ctLooknum}次</span></h3>
			
			<p><span>求职位：</span><#list typeList as t><a href="/rencai/${t.typeCode}" style="margin-right:20px;" target="_blank">${t.typeName}</a></#list></p>
			<table>
				<tr>
					<td width="228" height="38"><span>姓&nbsp;&nbsp;名：</span><a href="#">${user.userName}</a></td>
					<td width="228"><span>人才类型：</span>${user.userShenfen}</td>
					<td width="188"><span>学&nbsp;&nbsp;历：</span>${c.ctDigree}</td>
				</tr>
				
				<tr>
					<td height="38"><span>年&nbsp;&nbsp;龄：</span>${user.userAge}</td>
					<td><span>性&nbsp;&nbsp;&nbsp;&nbsp;别：</span>${c.ctSelsex}</td>
					<td><span>期望薪水：</span>${c.ctSalary}</td>
				</tr>
			</table>
		
			
			<h2 class="zj_con_jc jz_bj">求职信息：</h2>
			<div class="con_p_con">
			<p class="con_sjj">
			${c.ctContent}
			</p>
			</div>
			<h2 class="zj_con_jc jz_bj">自我评价：</h2>
			<div class="con_p_con">
			<p class="con_sjj">
			${user.userPingjia}
			</p>
			</div>
			<h2 class="zj_con_jc jz_bj">联系方式：</h2>
			<ul class="con_ds con_ul con_ubj">
				<#if c.ctMobile?exists && c.ctMobile!=''><li>联系手机：<img src="/code!c?type=mobile&no=${c.ctNo}" /></li></#if>
				<#if c.ctPhone?exists && c.ctPhone!=''><li>联系电话：<img src="/code!c?type=phone&no=${c.ctNo}" /></li></#if>
				<#if c.ctQq?exists && c.ctQq!=''><li>联 系QQ：<img src="/code!c?type=qq&no=${c.ctNo}" /></li></#if>
				<#if c.ctEmail?exists && c.ctEmail!=''><li>联 系Email：<img src="/code!c?type=email&no=${c.ctNo}" /></li></#if>
			</ul>
			<h2 class="zj_con_jc jz_bj">可工作时间：</h2>
			<div class="con_gzsj">
				<table width="537" height="139" cellpadding="0" cellspacing="0">
					<tr bgcolor="#F4F4F4">
						<td></td>
						<td>星期一</td>
						<td>星期二</td>
						<td>星期三</td>
						<td>星期四</td>
						<td>星期五</td>
						<td>星期六</td>
						<td>星期日</td>
					</tr>
					<tr>
						<td>上午</td>
						<td class="t01"></td>
						<td class="t02"></td>
						<td class="t03"></td>
						<td class="t04"></td>
						<td class="t05"></td>
						<td class="t06"></td>
						<td class="t07"></td>
					</tr>
					<tr>
						<td>下午</td>
						<td class="t08"></td>
						<td class="t09"></td>
						<td class="t10"></td>
						<td class="t11"></td>
						<td class="t12"></td>
						<td class="t13"></td>
						<td class="t14"></td>
					</tr>
					<tr>
						<td>晚上</td>
						<td class="t15"></td>
						<td class="t16"></td>
						<td class="t17"></td>
						<td class="t18"></td>
						<td class="t19"></td>
						<td class="t20"></td>
						<td class="t21"></td>
					</tr>
	
				</table>
			</div>
			
				<ul class="con_xh">
					<li class="zj_con_jc">相关个人简历：</li>
					<#list moreList as m>
					<li><span>${m.ctUpdate?string('MM-dd')}</span><a href="/rencai/<#if m.ctCityId?exists>a${m.ctCityId}</#if>">${m.ctCityName}</a><a href="/a${m.ctNo}.html">${m.ctTitle}</a></li>
					</#list>
				</ul>
				
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
