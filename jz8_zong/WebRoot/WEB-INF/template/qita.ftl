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
		<script type="text/javascript" src="/js/accordian.pack.js"></script>
		<script>
		</script>
	</head>
<body onload="new Accordian('basic-accordian',5,'header_highlight');">
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
	<div class="current jz_dq_xg"> <a href="#">兼职吧</a> > <a href="#">求职指南</a> > <a href="#">简历模板</a> > <a href="#">中文简历模板</a> > 正文</div>
	
	<div class="jz_pz_con">
		<div class="jz_pz_left jz_qiuzhi_con_zw">
			<div class="jz_left_ne_top">
			<h2>${q.qitaTitle}</h2>
			<p class="jz_ne_ly"><span>来源：兼职吧</span><span>发布时间：${q.qitaUpdate?string('yyyy-MM-dd')}</span><span>浏览：${q.qitaClick} 次</span></p>
			<p>
			${q.qitaContent}
			</p>
			<br />
			文章由兼职吧<a href="/">（www.jianzhi8.com）</a>发布,转载请注明出处！<br />
			原文网址：<a href="/${q.key}/${q.qitaNo}.html">http://www.jianzhi8.com/${q.key}/${q.qitaNo}.html</a></p>
			<div class="jz_sx_pianz">
				<#if preQita??>
					上一篇：<a href="/${preQita.key}/${preQita.qitaNo}.html">${preQita.qitaTitle}</a>
				</#if>
				<#if postQita??>
					<span>下一篇：<a href="/${postQita.key}/${postQita.qitaNo}.html">${postQita.qitaTitle}</a></span>
				</#if>
			</div>
			</div>
			<div class="jz_left_ne_bom">
				<h3>更多相关内容</h3>
					<ul>
						<#list moreList as mq>
						<li><a href="/${mq.key}/${mq.qitaNo}.html" target="_blank">${mq.qitaTitle}</a>${mq.qitaUpdate?string('yyyy-MM-dd')}</li>
						</#list>
					</ul>
			</div>
		</div>
		<div class="jz_pz_right">
		<div class="js_erji">
  	
    <div id="basic-accordian" >
      <div id="test-header" class="accordion_headings header_highlight" ><span>简历模板</span></div>
      <div id="test-content">
        <div class="accordion_child">
        	<ul>
        		<li><a href="/jianli/A/">简历模板</a></li>
            	<li><a href="/jianli/A01/">英文简历模板</a></li>
                <li><a href="/jianli/A02/">中文简历模板</a></li>
                <li><a href="/jianli/A03/">个人简历范文</a></li>
                <li><a href="/jianli/A04/">个人简历封面</a></li>
                <li><a href="/jianli/A05/">简历技巧</a></li>
            </ul>
        </div>
      </div>
      <div id="test1-header" class="accordion_headings" ><span>面试技巧</span></div>
      <div id="test1-content">
        <div class="accordion_child">
        	<ul>
            	<li><a href="/jiqiao/">面试技巧</a></li>
            </ul>
        </div>
      </div>
      <div id="test2-header" class="accordion_headings" ><span>职业指导</span></div>
      <div id="test2-content">
        <div class="accordion_child">
        	<ul>
            	<li><a href="/zhidao/B/">简历模板</a></li>
            	<li><a href="/zhidao/B01/">就业动态</a></li>
            	<li><a href="/zhidao/B02/">辞职跳槽</a></li>
            	<li><a href="/zhidao/B03/">兼职经验</a></li>
            	<li><a href="/zhidao/B04/">外劳经验</a></li>
            </ul>
        </div>
      </div>
    </div>
    
  </div>
		
		</div>
		<div class="clear"></div>
	</div>
<#include "/WEB-INF/template/foot.ftl"/>