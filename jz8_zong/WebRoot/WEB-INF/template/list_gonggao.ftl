<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${bean.title}_兼职吧${bean.pages}</title>
		<meta name="keywords" content='${bean.keywords}' />
		<meta name="description" content="${bean.description}${bean.pages}" />
		<link rel="Bookmark" href="/favicon.ico" />
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
		<link href="/css/reset.css" rel="stylesheet" type="text/css" />
		<link href="/css/main.css" rel="stylesheet" type="text/css" />
		<script src="/js/jquery-1.4.3.min.js" type="text/javascript"></script>
		<script>
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
	<div class="current jz_dq_xg"><a href="http://www.jianzhi8.com/">兼职吧</a> > <a href="http://www.jianzhi8.com/gonggao/">骗子公告栏</a> 
	</div>
	
	<div class="jz_pz_con">
		<div class="jz_pz_left">
			<h3>最新骗子公告</h3>
			<ul>
				<#list bean.resultList as g>
				<li><a href="/gonggao/${g.gaoNo}.html">${g.gaoTitle}</a><span>${g.gaoDate?string('yyyy-MM-dd')}</span></li>
				</#list>
			</ul>
			
			<div class="con_fy">
				<#if !bean.isFirstPage>
					<a href="/gonggao/p${bean.prePageIndex}/" class="fy_d">上页</a>
				</#if>
				${bean.getQitaPaper('/gonggao/')}
				<#if !bean.isLastPage>
					<a href="/gonggao/p${bean.pageIndex+1}/" class="fy_d">下页</a>
				</#if>
			</div>
<div class="clear"></div>
		</div>
		<div class="jz_pz_right">
			<a href="#"><h2>我要举报骗子</h2></a>
			<div class="jz_pzcon_right">
				<h3>兼职吧友情提示</h3>
				<ul>
				<li>兼职类骗子网站兼职类骗子网站兼职类骗子网站兼职类骗子网站兼职类骗子网站兼职类骗子网站兼职类骗子网站兼职类骗子网站</li>
				<li>公告：以各种理由借口收取费用的均为骗子行为！</li>
				<li>QQ：298938998</li>
				<li>Email：web#djshjdh.com</li>
				<li>（将#改为@即可）</li>
				<li>兼职累骗子总结：</li>
				<li>1、各种借口为李伟，骗取服装费</li>
				<li>2、各种借口为李伟，骗取服装费</li>
				<li>3、各种借口为李伟，骗取服装骗取服装费费装费费</li>
				<li>4、各种借口为李伟，骗取服装费骗取服装费</li>
				<li>5、各种借口为李伟，骗取服装费</li>
				</ul>
			</div>
		</div>
		<div class="clear"></div>
	</div>
<#include "/WEB-INF/template/foot.ftl"/>