<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${city.simpleName}${c.ctTitle }</title>
		<meta name="keywords" content='${city.simpleName}${c.ctTitle }' />
		<meta name="description" content='${city.simpleName}${c.ctTitle }工作信息,我们提供${user.userCompanyName}发布的${city.simpleName}最新的${c.ctTitle }工作资讯,还有哪些公司在招聘${c.ctTitle }和${city.simpleName}${c.ctClass}${c.ctTypeName }请登录${city.simpleName}兼职吧查看。'/>
		<link rel="Bookmark" href="http://www.jianzhi8.com/comcity/favicon.ico" />
		<link rel="shortcut icon" href="http://www.jianzhi8.com/comcity/favicon.ico" type="image/x-icon" />
		<link href="http://css.jianzhi8.com/fenzhan/css/reset.css" rel="stylesheet" type="text/css" />
		<script src="http://css.jianzhi8.com/fenzhan/js/jquery-1.7.1.min.js"></script>
		<script src="http://css.jianzhi8.com/fenzhan/js/top.js"></script>
		<script>
			var jobtimes = '${c.ctJobtime}';
			$(function(){
				if(jobtimes != ''){
					var arr = jobtimes.split('-');
					for(var i = 0 ; i < arr.length; i++){
						$('td.t' + arr[i]).html('<img src="/img/g_r2_c2.jpg" />');					
					}
				}
			});
		</script>
	</head>
<body>
	<#include "/WEB-INF/template/top.ftl"/>
	<!--导航区域-->
	<div class="nav">
    	<div class="nav_top clearfix">
        	<a href="#" class="logo_a"><img src="/img/home_r2_c2_s1.jpg" /></a>
            <ul>
            	<li><b>全国</b></li>
                <li>
                	   <SCRIPT language="JavaScript" src="http://css.jianzhi8.com/fenzhan/js/city.js" type="text/javascript"></SCRIPT>
                </li>
            </ul>
             <div class="serch_div">
            	<A href="#" class="agg_a" onmousemove="document.getElementById('a_hover_ul').style.display='block'"onmouseout="document.getElementById('a_hover_ul').style.display='none'">网页设计</A><input type="text" class="sr_btn" /><input type="button" value="" />
                <ul id="a_hover_ul" style="display:none;" onmousemove="document.getElementById('a_hover_ul').style.display='block'" onmouseout="document.getElementById('a_hover_ul').style.display='none'">
                    <li><a href="#">网页设计</a></li>
                    <li><a href="#">网页设计</a></li>
                    <li><a href="#">网页设计</a></li>
                </ul>
            </div>
          <p><input type="button" value="免费发布信息" class="gs_mff" /><input type="button" value="写简历"  class="gs_xjl"/></p>
            
        </div>
        <div class="nav_botttom clearfix">
        	<ul class="clearfix">
            	<li><A href="/">首页</A></li>
                <li><A href="/jianzhi/">兼职招聘</A></li>
                <li><A href="/job/">全职招聘</A></li> 
                <li><A href="/rencai/">个人求职</A></li>
                <li><A href="/resume/">简历中心</A></li>
                <li><A href="/qiuzhizhidao/">求职指导</A></li>
                <li><A href="/biyezhidao/">毕业指导</A></li>
                <li style="background:none;"><A href="/zph/">招聘会</A></li>
            </ul>
        </div>
    </div>
	<!--当前位置区域-->
	<div class="current con_wlnr">
		<span>
		浏览：<font color="red">${c.ctLooknum}</font> 次
		</span>
		<a href="http://www.jianzhi8.com/">兼职吧</a> &gt; 
		<a href="/">${city.simpleName}兼职</a> &gt;
		<#if c.ctClass=='0'>	
			<a href="/rc${typemap[c.ctTypeId]['typeId']}/rcc0/">${city.simpleName}找<#if c.ctTypeId?exists>${typemap[c.ctTypeId]['typeName']}</#if>工作</a>
		<#else>
			<a href="/rc${jobtypemap[c.ctTypeId]}/rcc1/">${city.simpleName}找<#if c.ctTypeId?exists>${jobtypemap[c.ctTypeId]['typeName']}</#if>工作</a>
		</#if>
	</div>
	<div class="zj_con">
		<div class="zj_con_l">
			<h3>${c.ctTitle}</h3>
			<p><span>求职位：</span><#list typeList as t><a href="/rc${t.typeId}/rcc0/" style="margin-right:5px;" target="_blank">${t.typeName}</a></#list><#list jobTypeList as t><a href="/rc${t.typeId}/rcc1/" style="margin-right:5px;" target="_blank">${t.typeName}</a></#list>
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
			<div class="clear"></div>
			<h2 class="zj_con_jc jz_bj">求职信息：</h2>
			<div class="con_p_con">
			<p class="con_sjj">
			${c.ctContent}
			<br>联系我时请一定说明是在兼职吧上看到的此信息，谢谢！
			</p>
			</div>
			<h2 class="zj_con_jc jz_bj">自我评价：</h2>
			<div class="con_p_con">
			<p class="con_sjj">
			<#if user.userPingjia?exists>${user.userPingjia}<#else>这个家伙很懒，啥也没留下~\(^o^)/~</#if>
			</p>
			</div>
           <div class="clear"></div>
			<h2 class="zj_con_jc jz_bj">联系方式：</h2>
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
					<li class="zj_con_jc">相关个人求职信息：</li>
					<#list moreList as m>
					<li><span>${m.ctUpdate?string('MM-dd')}</span><#if m.ctCityId?exists && m.ctCityId.length()==6><a href="/rc${m.ctCityId}/">${m.ctCityName}</a><#else><a href="/">${m.ctCityName}</a></#if><a href="/a${m.ctNo}.html">${m.ctTitle}</a></li>
					</#list>
				</ul>
				
		</div>
		<div class="zj_con_r zj_con_gr">
			<p class="zj_con_img"><SCRIPT language=JavaScript
					src="http://css.jianzhi8.com/fenzhan/ggads/160_600.js"
					type=text/javascript></SCRIPT></p>
		</div>
		<div class="clear"></div>
	</div>

	<div class="brother_city_list">
	<p class="tb_jz">
	<span>周边${typeName}求职信息：</span>
	<#if c.ctClass=='0'>
	<#list subCityList as city>
	<a href="/rc${city.cityId}/rc${typemap_py[c.ctTypeId]}/rcc0/">${city.simpleName}找${typeName}工作</a>
	</#list>
	<#list brotherCityList as city>
	<a href="http://${city.cityId}.jianzhi8.com/rc${c.ctTypeId}/rcc0/">${city.simpleName}找${typeName}工作</a>
	</#list>
	<#else>
	
	<#list subCityList as city>
	<a href="/rc${city.cityId}/rc${jobtypemap_py[c.ctTypeId]}/rcc1/">${city.simpleName}找${typeName}工作</a>
	</#list>
		<#list brotherCityList as city>
	<a href="http://${city.cityId}.jianzhi8.com/rc${c.ctTypeId}/rcc1/">${city.simpleName}找${typeName}工作</a>
	</#list>
	</#if>
	</p>
	</div>
	<SCRIPT language=JavaScript	src="http://css.jianzhi8.com/js/copy.js" type=text/javascript></SCRIPT>
	<span style="display: none"> 
 <IFRAME src="http://soho.jianzhi8.com/infoclick.jsp?pno=${c.ctNo}"frameBorder=0 width=0 scrolling=no height=0></IFRAME>
 </span>
<#include "/WEB-INF/template/foot.ftl"/>
