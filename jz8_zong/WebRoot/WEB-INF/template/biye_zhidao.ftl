<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${areaName}${unitypename}${jobdatename}${typeName}��ְ|${areaName}${jobdatename}��ְ${typeName}��Ƹ��Ϣ_��ְ��</title>
		<meta name="keywords" content='${areaName}${unitypename}${jobdatename}${typeName}��ְ, ${areaName}${unitypename}${jobdatename}��ְ${typeName}��Ƹ' />
		<meta name="description" content="��ְ��${areaName}${unitypename}${jobdatename}${typeName}��ְ��Ŀ,ÿ�����Ϊ${areaName}${jobdatename}��${typeName}��ְ��������ְ���ṩ����������ȫ��${areaName}${unitypename}${jobdatename}��ְ${typeName}��Ƹ��Ϣ��" />
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
            	<A href="#" class="agg_a" onmousemove="document.getElementById('a_hover_ul').style.display='block'"onmouseout="document.getElementById('a_hover_ul').style.display='none'">��ҳ���</A><input type="text" class="sr_btn" /><input type="button" value="" />
                <ul id="a_hover_ul" style="display:none;" onmousemove="document.getElementById('a_hover_ul').style.display='block'" onmouseout="document.getElementById('a_hover_ul').style.display='none'">
                    <li><a href="#">��ҳ���</a></li>
                    <li><a href="#">��ҳ���</a></li>
                    <li><a href="#">��ҳ���</a></li>
                </ul>
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
	<div class="current jz_dq_xg"><a href="#">��ְ��</a> > ��ְָ�� </div>
	
	<div class="jz_pz_con">
	<div class="jz_qiuzhi_zn">
		<div class="jz_zj_zd">
			<h3>��ҵ����<span><a href="/lunwen/">����>></a></span></h3>
			<ul>
				<#list lunwenList as q>
				<li><a href="/lunwen/${q.qitaNo}.html" target="_blank">${q.qitaTitle}</a><span>${q.qitaUpdate?string('yyyy-MM-dd')}</span></li>
				</#list>
			</ul>
		</div>
		
		<div class="jz_zj_zd">
			<h3>ʵϰ����<span><a href="/baogao/">����>></a></span></h3>
			<ul>
				<#list baogaoList as q>
				<li><a href="/baogao/${q.qitaNo}.html" target="_blank">${q.qitaTitle}</a><span>${q.qitaUpdate?string('yyyy-MM-dd')}</span></li>
				</#list>
			</ul>
		</div>
		
		<div class="jz_zj_zd">
			<h3>��������<span><a href="/edu/">����>></a></span></h3>
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
      <div id="test-header" class="accordion_headings header_highlight" ><span>��ҵ����</span></div>
      <div id="test-content">
        <div class="accordion_child">
        	<ul>
        		<li><a href="/lunwen/C/">��ҵ����</a></li>
            	<li><a href="/lunwen/C01/">����ָ��</a></li>
                <li><a href="/lunwen/C02/">����ѧ</a></li>
                <li><a href="/lunwen/C03/">����ѧ</a></li>
                <li><a href="/lunwen/C04/">��ѧ</a></li>
                <li><a href="/lunwen/C05/">��ѧ</a></li>
                <li><a href="/lunwen/C06/">ҽҩ</a></li>
                <li><a href="/lunwen/C07/">��ѧ</a></li>
                <li><a href="/lunwen/C08/">�����</a></li>
                <li><a href="/lunwen/C09/">����</a></li>
                <li><a href="/lunwen/C10/">����</a></li>
                <li><a href="/lunwen/C11/">��ѧ</a></li>
                <li><a href="/lunwen/C12/">�Ļ�</a></li>
                <li><a href="/lunwen/C13/">����</a></li>
                <li><a href="/lunwen/C14/">���</a></li>
                <li><a href="/lunwen/C15/">Ӣ������</a></li>
                <li><a href="/lunwen/C16/">Ӧ����</a></li>
            </ul>
        </div>
      </div>
      <div id="test1-header" class="accordion_headings" ><span>ʵϰ����</span></div>
      <div id="test1-content">
        <div class="accordion_child">
        	<ul>
            	<li><a href="/baogao/">ʵϰ����</a></li>
            </ul>
        </div>
      </div>
      <div id="test2-header" class="accordion_headings" ><span>��������</span></div>
      <div id="test2-content">
        <div class="accordion_child">
        	<ul>
            	<li><a href="/edu/F/">����ģ��</a></li>
            	<li><a href="/edu/F01/">�ļ�����</a></li>
            	<li><a href="/edu/F02/">��������</a></li>
            	<li><a href="/edu/F03/">��������ϰ����</a></li>
            	<li><a href="/edu/F04/">�Կ��ɿ�����</a></li>
            	<li><a href="/edu/F05/">����Ա��������</a></li>
            	<li><a href="/edu/F06/">����Ա���Ը�ϰ����</a></li>
            	<li><a href="/edu/F07/">�߿�����</a></li>
            	<li><a href="/edu/F08/">��������</a></li>
            	<li><a href="/edu/F09/">Ӣ������</a></li>
            	<li><a href="/edu/F10/">�����һ��</a></li>
            	<li><a href="/edu/F11/">���������</a></li>
            	<li><a href="/edu/F12/">���������</a></li>
            	<li><a href="/edu/F13/">��ƿ���</a></li>
            </ul>
        </div>
      </div>
    </div>
    
  </div>
		
		</div>
		<div class="clear"></div>
	</div>
<#include "/WEB-INF/template/foot.ftl"/>
