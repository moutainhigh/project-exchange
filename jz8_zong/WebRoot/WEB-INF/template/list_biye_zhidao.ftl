<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>毕业论文_兼职吧</title>
		<meta name="keywords" content='' />
		<meta name="description" content="" />
		<link rel="Bookmark" href="/favicon.ico" />
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
		<link href="/css/reset.css" rel="stylesheet" type="text/css" />
		<link href="/css/main.css" rel="stylesheet" type="text/css" />
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
	<div class="current jz_dq_xg"><a href="http://www.jianzhi8.com/">兼职吧</a> > <a href="http://www.jianzhi8.com/biyezhidao/">毕业指导</a> > 
	<a href="http://www.jianzhi8.com/${currQitaKey}/">${currQitaName}</a>
	</div>
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
      <div id="test-header" class="accordion_headings header_highlight" ><span>毕业论文</span></div>
      <div id="test-content">
        <div class="accordion_child">
        	<ul>
        		<li><a href="/lunwen/">毕业论文</a></li>
            	<li><a href="/lunwen/lunwenzhidao/">论文指导</a></li>
                <li><a href="/lunwen/jingjixue/">经济学</a></li>
                <li><a href="/lunwen/guanlixue/">管理学</a></li>
                <li><a href="/lunwen/faxue/">法学</a></li>
                <li><a href="/lunwen/lixue/">理学</a></li>
                <li><a href="/lunwen/yiyao/">医药</a></li>
                <li><a href="/lunwen/gongxue/">工学</a></li>
                <li><a href="/lunwen/jisuanji/">计算机</a></li>
                <li><a href="/lunwen/jiaoyu/">教育</a></li>
                <li><a href="/lunwen/yishu/">艺术</a></li>
                <li><a href="/lunwen/zhexue/">哲学</a></li>
                <li><a href="/lunwen/wenhua/">文化</a></li>
                <li><a href="/lunwen/zhengzhi/">政治</a></li>
                <li><a href="/lunwen/shehui/">社会</a></li>
                <li><a href="/lunwen/yingwen/">英语论文</a></li>
                <li><a href="/lunwen/yingyongwen/">应用文</a></li>
            </ul>
        </div>
      </div>
      <div id="test1-header" class="accordion_headings" ><span>实习报告</span></div>
      <div id="test1-content">
        <div class="accordion_child">
        	<ul>
            	<li><a href="/shixibaogao/">实习报告</a></li>
            </ul>
        </div>
      </div>
      <div id="test2-header" class="accordion_headings" ><span>考试真题</span></div>
      <div id="test2-content">
        <div class="accordion_child">
        	<ul>
            	<li><a href="/edu/">考试真题</a></li>
            	<li><a href="/edu/siji/">四级真题</a></li>
            	<li><a href="/edu/liuji/">六级真题</a></li>
            	<li><a href="/edu/sijifuxi/">四六级复习资料</a></li>
            	<li><a href="/edu/zikaochengkao/">自考成考真题</a></li>
            	<li><a href="/edu/gongwuyuanzhenti/">公务员考试真题</a></li>
            	<li><a href="/edu/gongwuyuanziliao/">公务员考试复习资料</a></li>
            	<li><a href="/edu/kaoshizhenti/">高考真题</a></li>
            	<li><a href="/edu/kaoyanziliao/">考研资料</a></li>
            	<li><a href="/edu/yingyuzhenti/">英语真题</a></li>
            	<li><a href="/edu/jisuanjiyiji/">计算机一级</a></li>
            	<li><a href="/edu/jisuanjierji/">计算机二级</a></li>
            	<li><a href="/edu/jisuanjisanji/">计算机三级</a></li>
            	<li><a href="/edu/kuaijikaoshi/">会计考试</a></li>
            </ul>
        </div>
      </div>
    </div>
    
  </div>
		
		</div>
		<div class="clear"></div>
	</div>
<#include "/WEB-INF/template/foot.ftl"/>
