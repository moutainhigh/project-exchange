<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${t.tuanduiTitle}_兼职吧</title>
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
	<div class="current jz_dq_xg"><a href="#">兼职吧</a> > 兼职团队 > ${t.tuanduiTitle} </div>
	
	<div class="jz_pz_con">
		<div class="jz_pz_left jz_qiuzhi_con_zw">
			<div class="jz_left_ne_top">
			<h2>${t.tuanduiTitle}</h2>
			<p class="jz_ne_ly"><span>来源：兼职吧</span><span>发布时间：${t.tuanduiDate?string('yyyy-MM-dd')}</span> <span>	<SCRIPT language=JavaScript src="/js/fontsize.js" type=text/javascript></SCRIPT></span>  <span>IP：${t.tuanduiIpaddr} </span></p>
			<p class="jz_pz_lx">兼职团队所在城市：${city.cityName}</p>
			<p id="zoom">
			${t.tuanduiContent}
			</p>
			<br />
			<p class="jz_pz_lx">兼职团队联系方式：${t.tuanduiContact}</p>
			</div>
			<div class="jz_left_ne_bom">
				<h3>更多相关兼职团队</h3>
				<ul>
					<#list moreList as mt>
					<li><a href="/tuandui/${mt.tuanduiNo}.html" target="_blank">${mt.tuanduiTitle}</a>${mt.tuanduiDate?string('yyyy-MM-dd')}</li>
					</#list>
				</ul>
			</div>
		</div>
		<div class="jz_pz_right">
			<div class="add_erji">
            	<h1>城市招聘会</h1>
          	    <h3>
                	<a href="/tuandui/bj/">北京</a>
                    <a href="/tuandui/sh/">上海</a>
                    <a href="/tuandui/cq/">重庆</a>
                    <a href="/tuandui/tj/">天津</a>
                </h3>
                <ul>
                	<#list fillProCityList as p>
                	<li class="hover_lia">
                    	<p><b>${p.cityName}</b>><#list p.childs[0..1] as c><a href="/tuandui/${c.cityId}/">${c.simpleName}</a></#list></p>
                        <div>
                        	<ul>
                        		<#list p.childs[2..] as c>
                            	<li><a href="/tuandui/${c.cityId}/">${c.simpleName}</a></li>
                            	</#list>
                            </ul>
                        </div>
                    </li>
                    </#list>
                    <script type="text/javascript">
                    	$('.hover_lia').mouseover(function(){
						    $(this).addClass('hover_now');	
						})
						
						$('.hover_lia').mouseout(function(){
						    $(this).removeClass('hover_now');							   
						})
                    </script>
                </ul>
            </div>
		</div>
		<div class="clear"></div>
	</div>
<#include "/WEB-INF/template/foot.ftl"/>
