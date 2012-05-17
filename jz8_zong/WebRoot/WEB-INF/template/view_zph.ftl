<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${areaName}${unitypename}${jobdatename}${typeName}兼职|${areaName}${jobdatename}兼职${typeName}招聘信息_兼职吧</title>
		<meta name="keywords" content='${areaName}${unitypename}${jobdatename}${typeName}兼职, ${areaName}${unitypename}${jobdatename}兼职${typeName}招聘' />
		<meta name="description" content="兼职吧${areaName}${unitypename}${jobdatename}${typeName}兼职栏目,每天免费为${areaName}${jobdatename}找${typeName}兼职工作的求职者提供大量最新最全的${areaName}${unitypename}${jobdatename}兼职${typeName}招聘信息。" />
		<link rel="Bookmark" href="/favicon.ico" />
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
		<link href="/css/reset.css" rel="stylesheet" type="text/css" />
		<link href="/css/mian.css" rel="stylesheet" type="text/css" />
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
                <li style="background:none;"><A href="/zph/" class="now_a">招聘会</A></li>
            </ul>
        </div>
    </div>
	<!--当前位置区域-->
	<div class="current jz_dq_xg"><a href="#">兼职吧</a> > 招聘会 </div>
	
	<div class="jz_pz_con">
		<div class="jz_pz_left jz_qiuzhi_con_zw">
			<div class="jz_left_ne_top">
			<h2>${z.zphTitle}</h2>
			<p class="jz_ne_ly"><span>来源：兼职吧</span><span>发布时间：${z.zphUpdate?string('yyyy-MM-dd')}</span><span>浏览：${z.zphClick} 次</span></p>
			<p>
			${z.zphContent}
			</p>
			<br />
			文章由兼职吧<a href="/">（www.jianzhi8.com）</a>发布,转载请注明出处！<br />
			原文网址：<a href="/zph/${z.zphNo}.html">http://www.jianzhi8.com/zph/${z.zphNo}.html</a></p>
			<div class="jz_sx_pianz">
				<#if preZph??>
					上一篇：<a href="/zph/${preZph.zphNo}.html">${preZph.zphTitle}</a>
				</#if>
				<#if postZph??>
					<span>下一篇：<a href="/zph/${postZph.zphNo}.html">${postZph.zphTitle}</a></span>
				</#if>
			</div>
			</div>
			<div class="jz_left_ne_bom">
				<h3>更多相关内容</h3>
					<ul>
						<#list moreList as mz>
						<li><a href="/zph/${mz.zphNo}.html" target="_blank">${mz.zphTitle}</a>${mz.zphUpdate?string('yyyy-MM-dd')}</li>
						</#list>
					</ul>
			</div>
		</div>
		<div class="jz_pz_right">
			<div class="add_erji">
            	<h1>城市招聘会</h1>
          	    <h3>
                	<a href="/zph/bj/">北京</a>
                    <a href="/zph/sh/">上海</a>
                    <a href="/zph/cq/">重庆</a>
                    <a href="/zph/tj/">天津</a>
                </h3>
                <ul>
                	<#list fillProCityList as p>
                	<li class="hover_lia">
                    	<p><b>${p.cityName}</b>><#list p.childs[0..1] as c><a href="/zph/${c.cityId}/">${c.simpleName}</a></#list></p>
                        <div>
                        	<ul>
                        		<#list p.childs[2..] as c>
                            	<li><a href="/zph/${c.cityId}/">${c.simpleName}</a></li>
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
