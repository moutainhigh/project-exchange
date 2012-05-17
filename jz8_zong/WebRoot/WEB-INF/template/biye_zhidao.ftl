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
                <li><A href="/biyezhidao/" class="now_a">毕业指导</A></li>
                <li style="background:none;"><A href="/zph/">招聘会</A></li>
            </ul>
        </div>
    </div>
	<!--当前位置区域-->
	<div class="current jz_dq_xg"><a href="#">兼职吧</a> > 求职指导 </div>
	
	<div class="jz_pz_con">
	<div class="jz_qiuzhi_zn">
		<div class="jz_zj_zd">
			<h3>毕业论文<span><a href="/lunwen/">更多>></a></span></h3>
			<ul>
				<#list lunwenList as q>
				<li><a href="/lunwen/${q.qitaNo}.html" target="_blank">${q.qitaTitle}</a><span>${q.qitaUpdate?string('yyyy-MM-dd')}</span></li>
				</#list>
			</ul>
		</div>
		
		<div class="jz_zj_zd">
			<h3>实习报告<span><a href="/baogao/">更多>></a></span></h3>
			<ul>
				<#list baogaoList as q>
				<li><a href="/baogao/${q.qitaNo}.html" target="_blank">${q.qitaTitle}</a><span>${q.qitaUpdate?string('yyyy-MM-dd')}</span></li>
				</#list>
			</ul>
		</div>
		
		<div class="jz_zj_zd">
			<h3>考试真题<span><a href="/edu/">更多>></a></span></h3>
			<ul>
				<#list eduList as q>
				<li><a href="/edu/${q.qitaNo}.html" target="_blank">${q.qitaTitle}</a><span>${q.qitaUpdate?string('yyyy-MM-dd')}</span></li>
				</#list>
			</ul>
			
		</div>
		</div>
		<div class="jz_pz_right">
		<div class="js_erji">
  	
    <div id="basic-accordian" >
      <div id="test-header" class="accordion_headings header_highlight" ><span>毕业论文</span></div>
      <div id="test-content">
        <div class="accordion_child">
        	<ul>
        		<li><a href="/lunwen/C/">毕业论文</a></li>
            	<li><a href="/lunwen/C01/">论文指导</a></li>
                <li><a href="/lunwen/C02/">经济学</a></li>
                <li><a href="/lunwen/C03/">管理学</a></li>
                <li><a href="/lunwen/C04/">法学</a></li>
                <li><a href="/lunwen/C05/">理学</a></li>
                <li><a href="/lunwen/C06/">医药</a></li>
                <li><a href="/lunwen/C07/">工学</a></li>
                <li><a href="/lunwen/C08/">计算机</a></li>
                <li><a href="/lunwen/C09/">教育</a></li>
                <li><a href="/lunwen/C10/">艺术</a></li>
                <li><a href="/lunwen/C11/">哲学</a></li>
                <li><a href="/lunwen/C12/">文化</a></li>
                <li><a href="/lunwen/C13/">政治</a></li>
                <li><a href="/lunwen/C14/">社会</a></li>
                <li><a href="/lunwen/C15/">英语论文</a></li>
                <li><a href="/lunwen/C16/">应用文</a></li>
            </ul>
        </div>
      </div>
      <div id="test1-header" class="accordion_headings" ><span>实习报告</span></div>
      <div id="test1-content">
        <div class="accordion_child">
        	<ul>
            	<li><a href="/baogao/">实习报告</a></li>
            </ul>
        </div>
      </div>
      <div id="test2-header" class="accordion_headings" ><span>考试真题</span></div>
      <div id="test2-content">
        <div class="accordion_child">
        	<ul>
            	<li><a href="/edu/F/">简历模板</a></li>
            	<li><a href="/edu/F01/">四级真题</a></li>
            	<li><a href="/edu/F02/">六级真题</a></li>
            	<li><a href="/edu/F03/">四六级复习资料</a></li>
            	<li><a href="/edu/F04/">自考成考真题</a></li>
            	<li><a href="/edu/F05/">公务员考试真题</a></li>
            	<li><a href="/edu/F06/">公务员考试复习资料</a></li>
            	<li><a href="/edu/F07/">高考真题</a></li>
            	<li><a href="/edu/F08/">考研资料</a></li>
            	<li><a href="/edu/F09/">英语真题</a></li>
            	<li><a href="/edu/F10/">计算机一级</a></li>
            	<li><a href="/edu/F11/">计算机二级</a></li>
            	<li><a href="/edu/F12/">计算机三级</a></li>
            	<li><a href="/edu/F13/">会计考试</a></li>
            </ul>
        </div>
      </div>
    </div>
    
  </div>
		
		</div>
		<div class="clear"></div>
	</div>
<#include "/WEB-INF/template/foot.ftl"/>
