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
                <li><A href="/biyezhidao/">��ҵָ��</A></li>
                <li style="background:none;"><A href="/zph/">��Ƹ��</A></li>
            </ul>
        </div>
    </div>
	<!--��ǰλ������-->
	<div class="current jz_dq_xg"> <a href="#">��ְ��</a> > <a href="#">��ְָ��</a> > <a href="#">����ģ��</a> > <a href="#">���ļ���ģ��</a> > ����</div>
	
	<div class="jz_pz_con">
		<div class="jz_pz_left jz_qiuzhi_con_zw">
			<div class="jz_left_ne_top">
			<h2>${q.qitaTitle}</h2>
			<p class="jz_ne_ly"><span>��Դ����ְ��</span><span>����ʱ�䣺${q.qitaUpdate?string('yyyy-MM-dd')}</span><span>�����${q.qitaClick} ��</span></p>
			<p>
			${q.qitaContent}
			</p>
			<br />
			�����ɼ�ְ��<a href="/">��www.jianzhi8.com��</a>����,ת����ע��������<br />
			ԭ����ַ��<a href="/${q.key}/${q.qitaNo}.html">http://www.jianzhi8.com/${q.key}/${q.qitaNo}.html</a></p>
			<div class="jz_sx_pianz">
				<#if preQita??>
					��һƪ��<a href="/${preQita.key}/${preQita.qitaNo}.html">${preQita.qitaTitle}</a>
				</#if>
				<#if postQita??>
					<span>��һƪ��<a href="/${postQita.key}/${postQita.qitaNo}.html">${postQita.qitaTitle}</a></span>
				</#if>
			</div>
			</div>
			<div class="jz_left_ne_bom">
				<h3>�����������</h3>
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
      <div id="test-header" class="accordion_headings header_highlight" ><span>����ģ��</span></div>
      <div id="test-content">
        <div class="accordion_child">
        	<ul>
        		<li><a href="/jianli/A/">����ģ��</a></li>
            	<li><a href="/jianli/A01/">Ӣ�ļ���ģ��</a></li>
                <li><a href="/jianli/A02/">���ļ���ģ��</a></li>
                <li><a href="/jianli/A03/">���˼�������</a></li>
                <li><a href="/jianli/A04/">���˼�������</a></li>
                <li><a href="/jianli/A05/">��������</a></li>
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
            	<li><a href="/zhidao/B/">����ģ��</a></li>
            	<li><a href="/zhidao/B01/">��ҵ��̬</a></li>
            	<li><a href="/zhidao/B02/">��ְ����</a></li>
            	<li><a href="/zhidao/B03/">��ְ����</a></li>
            	<li><a href="/zhidao/B04/">���;���</a></li>
            </ul>
        </div>
      </div>
    </div>
    
  </div>
		
		</div>
		<div class="clear"></div>
	</div>
<#include "/WEB-INF/template/foot.ftl"/>