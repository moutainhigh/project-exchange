<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>��ְָ��_��ְ��</title>
		<meta name="keywords" content='' />
		<meta name="description" content="" />
		<link rel="Bookmark" href="/favicon.ico" />
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
		<link href="/css/reset.css" rel="stylesheet" type="text/css" />
		<link href="/css/main.css" rel="stylesheet" type="text/css" />
		<script src="/js/jquery-1.4.3.min.js" type="text/javascript"></script>
		<script src="/js/accordian.pack.js" type="text/javascript"></script>

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
                <li><A href="/qiuzhizhidao/" class="now_a">��ְָ��</A></li>
                <li><A href="/biyezhidao/">��ҵָ��</A></li>
                <li style="background:none;"><A href="/zph/">��Ƹ��</A></li>
            </ul>
        </div>
    </div>
	<!--��ǰλ������-->
	<div class="current jz_dq_xg"><a href="#">��ְ��</a> > ��ְָ�� </div>
	
	<div class="jz_pz_con">
	<div class="jz_qiuzhi_zn">
		<div class="jz_zj_zd">
			<h3>����ģ��<span><a href="/jianli/">����>></a></span></h3>
			<ul>
				<#list jianliList as q>
				<li><a href="/jianli/${q.qitaNo}.html" target="_blank">${q.qitaTitle}</a><span>${q.qitaUpdate?string('yyyy-MM-dd')}</span></li>
				</#list>
			</ul>
		</div>
		
		<div class="jz_zj_zd">
			<h3>���Լ���<span><a href="/jiqiao/">����>></a></span></h3>
			<ul>
				<#list mianshiList as q>
				<li><a href="/jiqiao/${q.qitaNo}.html" target="_blank">${q.qitaTitle}</a><span>${q.qitaUpdate?string('yyyy-MM-dd')}</span></li>
				</#list>
			</ul>
		</div>
		
		<div class="jz_zj_zd">
			<h3>ְҵָ��<span><a href="/zhidao/">����>></a></span></h3>
			<ul>
				<#list zhiyeList as q>
				<li><a href="/zhidao/${q.qitaNo}.html" target="_blank">${q.qitaTitle}</a><span>${q.qitaUpdate?string('yyyy-MM-dd')}</span></li>
				</#list>
			</ul>
			
		</div>
		</div>
		<div class="jz_pz_right">
		<div class="js_erji">
  	
    <div id="basic-accordian" >
      <div id="test-header" class="accordion_headings header_highlight" ><span>����ģ��</span></div>
      <div id="test-content">
        <div class="accordion_child">
        	<ul>
        		<li><a href="/jianli/">����ģ��</a></li>
            	<li><a href="/jianli/english/">Ӣ�ļ���ģ��</a></li>
                <li><a href="/jianli/chinese/">���ļ���ģ��</a></li>
                <li><a href="/jianli/fangwen/">���˼�������</a></li>
                <li><a href="/jianli/fengmian/">���˼�������</a></li>
                <li><a href="/jianli/jianlijiqiao/">��������</a></li>
            </ul>
        </div>
      </div>
      <div id="test1-header" class="accordion_headings" ><span>���Լ���</span></div>
      <div id="test1-content">
        <div class="accordion_child">
        	<ul>
            	<li><a href="/jiqiao/">���Լ���</a></li>
            </ul>
        </div>
      </div>
      <div id="test2-header" class="accordion_headings" ><span>ְҵָ��</span></div>
      <div id="test2-content">
        <div class="accordion_child">
        	<ul>
            	<li><a href="/zhidao/">ְҵָ��</a></li>
            	<li><a href="/zhidao/jiuyedongtai/">��ҵ��̬</a></li>
            	<li><a href="/zhidao/tiaocao/">��ְ����</a></li>
            	<li><a href="/zhidao/jianzhijingyan/">��ְ����</a></li>
            	<li><a href="/zhidao/wailaojingyan/">���;���</a></li>
            </ul>
        </div>
      </div>
    </div>
    
  </div>
		
		</div>
		<div class="clear"></div>
	</div>
<#include "/WEB-INF/template/foot.ftl"/>