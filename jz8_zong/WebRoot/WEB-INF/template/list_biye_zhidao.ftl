<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>��ҵ����_��ְ��</title>
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
	<!--��������-->
	<div class="nav">
    	<div class="nav_top clearfix">
        	<a href="#" class="logo_a"><img src="/img/home_r2_c2_s1.jpg" /></a>
            <ul>
            	<li><b>ȫ��</b></li>
                <li>
                	   <SCRIPT language="JavaScript" src="http://css.jianzhi8.com/fenzhan/js/city.js" type="text/javascript"></SCRIPT>
                </li>
            </ul>
             <div class="serch_div">
            	
            </div>
          <p><input type="button" value="��ѷ�����Ϣ" class="gs_mff" /><input type="button" value="д����"  class="gs_xjl"/></p>
            
        </div>
        <div class="nav_botttom clearfix">
        	<ul class="clearfix">
            	<li><A href="/">��ҳ</A></li>
                <li><A href="/jianzhi/">��ְ��Ƹ</A></li>
                <li><A href="/job/">ȫְ��Ƹ</A></li> 
                <li><A href="/rencai/">������ְ</A></li>
                <li><A href="/resume/">��������</A></li>
                <li><A href="/qiuzhizhidao/">��ְָ��</A></li>
                <li><A href="/biyezhidao/" class="now_a">��ҵָ��</A></li>
                <li style="background:none;"><A href="/zph/">��Ƹ��</A></li>
            </ul>
        </div>
    </div>
	<!--��ǰλ������-->
	<div class="current jz_dq_xg"><a href="http://www.jianzhi8.com/">��ְ��</a> > <a href="http://www.jianzhi8.com/biyezhidao/">��ҵָ��</a> > 
	<a href="http://www.jianzhi8.com/${currQitaKey}/">${currQitaName}</a>
	</div>
	<div class="jz_pz_con">
	<div class="jz_qiuzhi_zn">
		<div class="jz_zj_zd">
			<h3>${currQitaName}<span><a href="/${currQitaKey}/">����>></a></span></h3>
			<ul>
				<#list bean.resultList as q>
				<li><a href="/${currQitaKey}/${q.qitaNo}.html" target="_blank">${q.qitaTitle}</a><span>${q.qitaUpdate?string('yyyy-MM-dd')}</span></li>
				</#list>
			</ul>
			<div class="con_fy">
				<#if !bean.isFirstPage>
					<a href="/${currQitaKey}/<#if currQitaTypeCode??>${currQitaTypeCode}/</#if>p${bean.prePageIndex}/" class="fy_d">��ҳ</a>
				</#if>
				${bean.getQitaPaper('/' + currQitaKey + '/' + currQitaTypeCode + '/')}
				<#if !bean.isLastPage>
					<a href="/${currQitaKey}/<#if currQitaTypeCode??>${currQitaTypeCode}/</#if>p${bean.pageIndex+1}/" class="fy_d">��ҳ</a>
				</#if>
			</div>
			<div class="clear"></div>
		</div>
		</div>
		<div class="jz_pz_right">
		<div class="js_erji">
  	
    <div id="basic-accordian" >
      <div id="test-header" class="accordion_headings header_highlight" ><span>��ҵ����</span></div>
      <div id="test-content">
        <div class="accordion_child">
        	<ul>
        		<li><a href="/lunwen/">��ҵ����</a></li>
            	<li><a href="/lunwen/lunwenzhidao/">����ָ��</a></li>
                <li><a href="/lunwen/jingjixue/">����ѧ</a></li>
                <li><a href="/lunwen/guanlixue/">����ѧ</a></li>
                <li><a href="/lunwen/faxue/">��ѧ</a></li>
                <li><a href="/lunwen/lixue/">��ѧ</a></li>
                <li><a href="/lunwen/yiyao/">ҽҩ</a></li>
                <li><a href="/lunwen/gongxue/">��ѧ</a></li>
                <li><a href="/lunwen/jisuanji/">�����</a></li>
                <li><a href="/lunwen/jiaoyu/">����</a></li>
                <li><a href="/lunwen/yishu/">����</a></li>
                <li><a href="/lunwen/zhexue/">��ѧ</a></li>
                <li><a href="/lunwen/wenhua/">�Ļ�</a></li>
                <li><a href="/lunwen/zhengzhi/">����</a></li>
                <li><a href="/lunwen/shehui/">���</a></li>
                <li><a href="/lunwen/yingwen/">Ӣ������</a></li>
                <li><a href="/lunwen/yingyongwen/">Ӧ����</a></li>
            </ul>
        </div>
      </div>
      <div id="test1-header" class="accordion_headings" ><span>ʵϰ����</span></div>
      <div id="test1-content">
        <div class="accordion_child">
        	<ul>
            	<li><a href="/shixibaogao/">ʵϰ����</a></li>
            </ul>
        </div>
      </div>
      <div id="test2-header" class="accordion_headings" ><span>��������</span></div>
      <div id="test2-content">
        <div class="accordion_child">
        	<ul>
            	<li><a href="/edu/">��������</a></li>
            	<li><a href="/edu/siji/">�ļ�����</a></li>
            	<li><a href="/edu/liuji/">��������</a></li>
            	<li><a href="/edu/sijifuxi/">��������ϰ����</a></li>
            	<li><a href="/edu/zikaochengkao/">�Կ��ɿ�����</a></li>
            	<li><a href="/edu/gongwuyuanzhenti/">����Ա��������</a></li>
            	<li><a href="/edu/gongwuyuanziliao/">����Ա���Ը�ϰ����</a></li>
            	<li><a href="/edu/kaoshizhenti/">�߿�����</a></li>
            	<li><a href="/edu/kaoyanziliao/">��������</a></li>
            	<li><a href="/edu/yingyuzhenti/">Ӣ������</a></li>
            	<li><a href="/edu/jisuanjiyiji/">�����һ��</a></li>
            	<li><a href="/edu/jisuanjierji/">���������</a></li>
            	<li><a href="/edu/jisuanjisanji/">���������</a></li>
            	<li><a href="/edu/kuaijikaoshi/">��ƿ���</a></li>
            </ul>
        </div>
      </div>
    </div>
    
  </div>
		
		</div>
		<div class="clear"></div>
	</div>
<#include "/WEB-INF/template/foot.ftl"/>
