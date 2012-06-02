<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${city.simpleName}${user.userName }个人简历</title>
		<meta name="keywords" content='' />
		<meta name="description" content='${user.userName}毕业于:${user.userCompanyName},学历:${user.userDigree},专业:${user.userHangye}年龄:${user.userAge},性别:${user.userSex},现需要找${typeName}类${ctClass}工作,现住地址:${user.userCityName}。'/>
		<link rel="Bookmark" href="/favicon.ico" />
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
		<link href="/css/reset.css" rel="stylesheet" type="text/css" />
		<link href="/css/main.css" rel="stylesheet" type="text/css" />
		<script src="/js/jquery-1.4.3.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="/js/accordian.pack.js"></script>
		<script src="http://css.jianzhi8.com/fenzhan/js/image.js"></script>
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
		<a href="http://www.jianzhi8.com/">兼职吧</a> &gt; 
		<a href="/">${city.simpleName}兼职</a> &gt;
		<a href="/resume/">${city.simpleName}个人简历</a>
	</div>
	
	<div class="zj_con">
		<div class="zj_con_l">
			<h3>${user.userName}个人简历<span>发布时间：${user.userUpdate?string('yyyy-MM-dd')}</span></h3>
			<div class="con_gr_jl">
	<table border='0' style="width:700px;">
			<tr>
				<td style="width:350px;"><span>姓&nbsp;&nbsp;&nbsp;&nbsp;名：</span>${user.userName}</td>
				<td style="width:250px;"><span>性&nbsp;&nbsp;&nbsp;&nbsp;别：</span>${user.userSex}</td>
				<td style="" rowspan="6" align="center" style="width:250px;">
				<a href="http://my.jianzhi8.com/personimages/${user.userFileName}" target="_blank">
				<img 
					onerror="{this.src='/img/xp_r2_c4.jpg';}"
					src="http://my.jianzhi8.com/personimages/${user.userFileName}"
					style="BORDER: #555 1px solid;" alt="${typeName}个人简历"
					onload="javascript:DrawImage(this,'200','200');" border="0"
					name="faceImage"/>	
					</a>
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
				<td><span>联系电话：</span>
					<#if user.userPhone?exists && user.userPhone!=''>	
					<img id='Image1' name='Image1' align='absmiddle' src='/code/phone.jsp?tel=${user.userPhone }'/>
					<#else>
					<#if user.userMobile?exists && user.userMobile!='' >
					<img id='Image1' name='Image1' align='absmiddle' src='/code/phone.jsp?tel=${user.userMobile }'/>
					</#if>
				   </#if>
				</td>
				<td><span>联&nbsp;系 QQ：</span>
				<#if user.userQq?exists && user.userQq!=''><a target=blank href=tencent://message/?uin=${user.userQq }&Menu=yes><img border='0' SRC=http://wpa.qq.com/pa?p=1:${user.userQq }:4 alt='点击这里给我发消息'>${user.userQq }</a></#if></td>
				</tr>
			<tr>
				<td colspan="2"><span>现居地址：</span>${user.userCityName}</td>
				</tr>
		</table>

			</div>
		
			<h2 class="zj_con_jc jz_bj con_zpx">求职意向：</h2>
			<ul class="con_ul con_ubj">
				<li><span>求职类型：</span>${ctClass}</li>
				<li><span>期望职位：</span>
			<#list typeList as t><a href="/rc${typemap_py[t.typeCode]}/rcc0/" style="margin-right:5px;" target="_blank">${t.typeName}</a></#list>
			<#list jobTypeList as t><a href="/rc${jobtypemap_py[t.typeCode]}/rcc1/" style="margin-right:5px;" target="_blank">${t.typeName}</a></#list>
				</li>
			</ul>
			<h2 class="zj_con_jc jz_bj">自我评价：</h2>
			<div class="con_p_con">
			<p class="con_sjj">${user.userPingjia}</p>
			</div>
			<h2 class="zj_con_jc jz_bj">工作经验：</h2>
			<div class="con_p_con">
				<p class="con_sjj">${user.userBrief}</p>
			</div>			
				<ul class="con_xh">
					<li class="zj_con_jc">相关个人简历：</li>
					<#list moreList as m>
					<li><span>${m.userUpdate?string('MM-dd')}</span>${m.userCityName}<a href="/b${m.userNo}.html">${m.userTypeName}${m.userClass} ${m.userName}的个人简历</a></li>
					</#list>
				</ul>
				<p class="con_ckz">您还可以查看该地区<a href="/resume/">其他求职简历</a>，或者<a href="http://my.jianzhi8.com/fb.do">发布招聘信息</a>！</p>
		</div>
		<div class="zj_con_r zj_con_gr">
			<p class="zj_con_img"><SCRIPT language=JavaScript
					src="http://css.jianzhi8.com/fenzhan/ggads/160_600.js"
					type=text/javascript></SCRIPT></p>
		</div>
		
	</div>
<div class="clear"></div>
	<div class="brother_city_list">
	<p class="tb_jz">
	<span>周边${ctClass}简历：</span>
	<#list subCityList as city>
	<a href="/rc${city.cityId}/rcc0/">${city.simpleName}找工作</a>
	</#list>
	<#list brotherCityList as city>
	<a href="http://${city.cityId}.jianzhi8.com/resume/">${city.simpleName}个人简历</a>
	</#list>	
	</p>
	</div>
	<SCRIPT language=JavaScript	src="http://css.jianzhi8.com/js/copy.js" type=text/javascript></SCRIPT>
<#include "/WEB-INF/template/foot.ftl"/>