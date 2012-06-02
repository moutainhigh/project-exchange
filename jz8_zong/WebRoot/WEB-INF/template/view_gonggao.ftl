<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${g.gaoTitle}_兼职吧</title>
		<meta name="keywords" content='' />
		<meta name="description" content=''/>
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
	<div class="current jz_dq_xg"><a href="#">兼职吧</a> > 骗子公告 > ${g.gaoTitle} </div>
	
	<div class="zj_con">
		<div class="zj_con_l jz_pz_tab">
			<h3>${g.gaoTitle}<span>浏览：<strong> ${g.gaoClick} </strong> 次&nbsp;&nbsp;&nbsp;发布时间：${g.gaoDate?string('yyyy-mm-dd')}</span></h3>
			
			
			<table>
				<tr>
					<td class="jz_pz_tb1"><span>骗子公司：</span>${g.gaoCompany}<#if g.gaoIpaddr??>（IP：${g.gaoIpaddr}）</#if></td>
					<td class="jz_pz_tb2"><span>网站：</span>${g.gaoUrl}</td>
        </tr>
				
				<tr>
					<td class="jz_pz_tb1"><span>骗子QQ：</span>${g.gaoQq}</td>
					<td class="jz_pz_tb2"><span>邮箱：</span>${g.gaoEmail}</td>
        </tr>
				
				<tr>
					<td class="jz_pz_tb1"><span>电话：</span>${g.gaoPhone}</td>
					<td class="jz_pz_tb2"><span>手机：</span>${g.gaoMobile}</td>
        </tr>
			</table>
		  <p class="jz_pz_lx"><strong>骗子类型简介：</strong>${g.gaoTitle}</p>
			
			<h2 class="zj_con_jc jz_bj">详细描叙：</h2>
			<div class="con_p_con">
			<p class="con_sjj">
				${g.gaoContent}
			</p>
			<p class="con_sjj_ts"><span>友情提示：</span>以上信息有网友发布提交，并不代表本站看法，兼职吧本着为大家服务，打击骗子为最终目的，如有侵权言论请即时联系本站核实删除。</p>
			</div>
			
				<ul class="jz_con_xh">
					<li class="zj_con_jc">更多骗子信息：</li>
					<#list moreList as mg>
					<li><span>${mg.gaoDate?string('yyyy-mm-dd')}</span><a href="/gonggao/${mg.gaoNo}.html">${mg.gaoTitle}</a></li>
					</#list>
				</ul>		
		</div>
		<div class="zj_con_r zj_con_gr">
			<p class="zj_con_img"><img src="/img/nr_s1.jpg" /></p>
		</div>
		<div class="clear"></div>
	</div>
<#include "/WEB-INF/template/foot.ftl"/>
