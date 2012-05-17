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
                <li><A href="/qiuzhizhidao/" class="now_a">求职指导</A></li>
                <li><A href="/biyezhidao/">毕业指导</A></li>
                <li style="background:none;"><A href="/zph/">招聘会</A></li>
            </ul>
        </div>
    </div>
	<!--当前位置区域-->
	<div class="current jz_dq_xg"><a href="#">兼职吧</a> > 毕业指导 > ${currQitaName}  </div>
	
	<div class="jz_pz_con">
	<div class="jz_qiuzhi_zn">
		<div class="jz_zj_zd">
			<h3>${currQitaName}<span><a href="/${currQitaKey}/">更多>></a></span></h3>
			<ul>
				<#list bean.resultList as q>
				<li><a href="/${currQitaKey}/${q.qitaNo}.html" target="_blank">${q.qitaTitle}</a><span>${q.qitaUpdate?string('yyyy-MM-dd')}</span></li>
				</#list>
			</ul>
			<div class="con_fy">
				<#if !bean.isFirstPage>
					<a href="/${currQitaKey}/<#if currQitaTypeCode??>${currQitaTypeCode}/</#if>p${bean.prePageIndex}/" class="fy_d">上页</a>
				</#if>
				${bean.getQitaPaper('/' + currQitaKey + '/' + currQitaTypeCode + '/')}
				<#if !bean.isLastPage>
					<a href="/${currQitaKey}/<#if currQitaTypeCode??>${currQitaTypeCode}/</#if>p${bean.pageIndex+1}/" class="fy_d">下页</a>
				</#if>
			</div>
			<div class="clear"></div>
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