<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${city.simpleName}兼职网-${city.simpleName}大学生兼职网 -兼职吧</title>
		<meta name="keywords" content="${city.simpleName}兼职网">
		<meta name="description" content="${city.simpleName}兼职网每天更新大量的${city.simpleName}兼职招聘信息;您可以免费浏览${city.simpleName}大学生兼职,家教,传单派发,模特礼仪,网上兼职等信息;还可以在${city.simpleName}大学生兼职网免费发布信息。">
		<link rel="Bookmark" href="http://www.jianzhi8.com/comcity/favicon.ico" />
		<link rel="shortcut icon" href="http://www.jianzhi8.com/comcity/favicon.ico" type="image/x-icon" />
		<link href="${base}css/reset.css" rel="stylesheet" type="text/css" />
		<script src="${base}js/jquery-1.7.1.min.js"></script>
		<script>
			$(function(){
				$('.nav_botttom a').eq(0).addClass('now_a');
			});
		</script>
	</head>

<body>
	<#include "/head.ftl"/>
	<!--当前位置区域-->
	<div class="current">兼职吧&nbsp;&gt;&nbsp;<a href="/">${city.simpleName}兼职</a></div>
	<div class="con">
		<div class="con_left">
			<div class="con_left_subnav">
				<ul>
					<li><a href="/jianzhi/K01"><span>${city.simpleName}大学生兼职</span></a></li>
					<li><a href="/jianzhi/K02"><span>商品促销</span></a></li>
					<li><a href="/jianzhi/K03"><span>兼职打字员</span></a></li>
					<li><a href="/jianzhi/K04"><span>问卷/派发/调查</span></a></li>
					<li><a href="/jianzhi/K05">兼职会计</a></li>
					<li><a href="/jianzhi/K06">业务/代理</a></li>
					<li><a href="/jianzhi/K07">IT行业</a></li>
					<li><a href="/jianzhi/K08">兼职翻译</a></li>
					<li><a href="/jianzhi/K11">前台/客服/咨询</a></li>
					<li><a href="/jianzhi/K09">广告/设计/排版</a></li>
					<li><a href="/jianzhi/K13">家政/保姆</a></li>
					<li><a href="/jianzhi/K12">店员/柜台</a></li>
					<li><a href="/jianzhi/K14"><span>兼职家教</span></a></li>
					<li><a href="/jianzhi/K15">文秘/助理</a></li>
					<li><a href="/jianzhi/K16"><span>歌手/模特/演员</span></a></li>
					<li><a href="/jianzhi/K17">导游/司仪</a></li>
					<li><a href="/jianzhi/K18">教练/司机</a></li>
					<li><a href="/jianzhi/K19">医疗/美容/护理</a></li>
					<li><a href="/jianzhi/K21">建筑/装潢</a></li>
					<li><a href="/jianzhi/K22">婚礼/庆典</a></li>
					<li><a href="/jianzhi/K23">编辑/记者</a></li>
					<li><a href="/jianzhi/K24"><span>${city.simpleName}KTV兼职</span></a></li>
					<li><a href="/jianzhi/K17">实习/学徒</a></li>
					<li><a href="/jianzhi/K26"><span>钟点工/保洁</span></a></li>
				</ul>
			</div>
			<div class="clear"></div>
			<div class="con_left_btm">
				<div class="con_left_l">
					<div class="con_left_cn le1">
						<ul>
							<#if jzList?size gt 24>
							<#list jzList[0..24] as j>
							<li>[<a href="/jianzhi/${j.typeId}" target="_blank"><span>${j.typeName}</span></a>]<a title="${j.title}" href="/a${j.ctNo}.html" target="_blank"><#if (j.title+j.typeName)?length lt 20>${j.title}<#else>${j.title[0..(18-j.typeName.length())]}</#if></a>    <strong>${j.regdate?string("MM-dd")}</strong> </li>
							</#list>
							<#else>
							<#list jzList as j>
							<li>[<a href="/jianzhi/${j.typeId}" target="_blank"><span>${j.typeName}</span></a>]<a title="${j.title}" href="/a${j.ctNo}.html" target="_blank"><#if (j.title+j.typeName)?length lt 20>${j.title}<#else>${j.title[0..(18-j.typeName.length())]}</#if></a>    <strong>${j.regdate?string("MM-dd")}</strong> </li>
							</#list>
							</#if>
						</ul>
					</div>
					<div class="con_left_cn le2">
						<ul>
							<#if jzList?size gt 25>
							<#list jzList[25..] as j>
							<li>[<a href="/jianzhi/${j.typeId}" target="_blank"><span>${j.typeName}</span></a>]<a title="${j.title}" href="/a${j.ctNo}.html" target="_blank"><#if (j.title+j.typeName)?length lt 20>${j.title}<#else>${j.title[0..(18-j.typeName.length())]}</#if></a>    <strong>${j.regdate?string("MM-dd")}</strong> </li>
							</#list>
							</#if>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="con_right">
			<div class="con_right_con tg">
				<h3>热点招聘信息</h3>
				<ul>
					<#list hotList as j>
					<li<#if j.ding> class="ding"</#if>><a title="${j.title}" href="/a${j.ctNo}.html" target="_blank"><#if j.title?length lt 19>${j.title}<#else>${j.title[0..18]}</#if></a></li>
					</#list>
				</ul>
			</div>
			
			<div class="con_right_con zp">
				<h3>${city.simpleName}求职信息</h3>
				<ul>
					<#list qiuzhiList as j>
					<li><a title="${j.title}" href="/a${j.ctNo}.html" target="_blank"><#if j.title?length lt 19>${j.title}<#else>${j.title[0..18]}</#if></a></li>
					</#list>
				</ul>
			</div>
			
			<div class="con_right_con xx">
				<h3>${city.simpleName}最新简历</h3>
				<ul>
					<#list rencaiList as u>
					<li><a title="${u.userName}" href="/b${u.userNo}.html" target="_blank">${u.userName}的简历</a></li>
					</#list>
				</ul>
			</div>
		</div>
	</div>

<div class="clear"></div>
<div class="friendly_link">
	<div class="friendly_link_sc">
	<p><span>热门搜索：</span>
	<#list keysList as key>
	<a href="/s/s${(key+'兼职')?url}">${key}</a>
	</#list>
	</p>
	</div>
	<div class="friedly_link_jc">
	<p><span>热点城市：</span>
	<A href="http://bj.jianzhi8.com">北京兼职</A>
	<A href="http://suzhou.jianzhi8.com">苏州</A>
	<A href="http://sh.jianzhi8.com">上海兼职</A>
	<A href="http://fz.jianzhi8.com">福州</A>
	<A href="http://tj.jianzhi8.com">天津兼职</A>
	<A href="http://xa.jianzhi8.com">西安</A>
	<A href="http://cq.jianzhi8.com">重庆兼职</A>
	<A href="http://gz.jianzhi8.com">广州兼职</A>
	<A href="http://cs.jianzhi8.com">长沙</A>
	<A href="http://sz.jianzhi8.com">深圳兼职</A>
	<A href="http://nc.jianzhi8.com">南昌</A>
	<A href="http://cd.jianzhi8.com">成都兼职</A>
	<A href="http://heb.jianzhi8.com">哈尔滨</A>
	<A href="http://hz.jianzhi8.com">杭州兼职</A>
	<A href="http://zz.jianzhi8.com">郑州</A>
	<A href="http://nj.jianzhi8.com">南京兼职</A>
	<A href="http://dl.jianzhi8.com">大连</A>
	<A href="http://www.jianzhi8.com/index.html">更多...</A>
	</p>
	</div>
	<#if brotherCityList?exists>
	<div class="friedly_link_jc">
	<p><span>周边城市：</span>
	<#list brotherCityList as c>
	<A href="http://${c.cityId}.jianzhi8.com" target="_blank">${c.simpleName}兼职</A>
	</#list>
	</p>
	</div>
	</#if>
	<div class="friedly_link_link">
	<span>友情链接：</span>
	<#list linkList as link><a href="${link.linkHttp}" target="_blank">${link.linkName}</a></#list>
	<A href="http://www.jianzhi8.com/">兼职工作</A>
	<A href="http://www.jianzhi8.com/keyword-%E6%9A%91%E5%81%87" target='_blank'>暑假兼职</A>
	<A href="http://www.jianzhi8.com/keyword-%E5%91%A8%E6%9C%AB" target='_blank'>周末兼职</A>
	<A href="http://www.jianzhi8.com/">网上兼职</A>
	<A href="http://www.jianzhi8.com/keyword-%E5%8D%81%E4%B8%80" target='_blank'>十一兼职</A>
	</p>
	</div>
</div>
<#include "/foot.ftl"/>
