<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${bean.title}_��ְ��${bean.pages}</title>
		<meta name="keywords" content='${bean.keywords}' />
		<meta name="description" content="${bean.description}${bean.pages}" />
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
                <li><A href="/biyezhidao/">��ҵָ��</A></li>
                <li style="background:none;"><A href="/zph/">��Ƹ��</A></li>
            </ul>
        </div>
    </div>
	<!--��ǰλ������-->
	<div class="current jz_dq_xg"><a href="http://www.jianzhi8.com/">��ְ��</a> > <a href="http://www.jianzhi8.com/gonggao/">ƭ�ӹ�����</a> 
	</div>
	
	<div class="jz_pz_con">
		<div class="jz_pz_left">
			<h3>����ƭ�ӹ���</h3>
			<ul>
				<#list bean.resultList as g>
				<li><a href="/gonggao/${g.gaoNo}.html">${g.gaoTitle}</a><span>${g.gaoDate?string('yyyy-MM-dd')}</span></li>
				</#list>
			</ul>
			
			<div class="con_fy">
				<#if !bean.isFirstPage>
					<a href="/gonggao/p${bean.prePageIndex}/" class="fy_d">��ҳ</a>
				</#if>
				${bean.getQitaPaper('/gonggao/')}
				<#if !bean.isLastPage>
					<a href="/gonggao/p${bean.pageIndex+1}/" class="fy_d">��ҳ</a>
				</#if>
			</div>
<div class="clear"></div>
		</div>
		<div class="jz_pz_right">
			<a href="#"><h2>��Ҫ�ٱ�ƭ��</h2></a>
			<div class="jz_pzcon_right">
				<h3>��ְ��������ʾ</h3>
				<ul>
				<li>��ְ��ƭ����վ��ְ��ƭ����վ��ְ��ƭ����վ��ְ��ƭ����վ��ְ��ƭ����վ��ְ��ƭ����վ��ְ��ƭ����վ��ְ��ƭ����վ</li>
				<li>���棺�Ը������ɽ����ȡ���õľ�Ϊƭ����Ϊ��</li>
				<li>QQ��298938998</li>
				<li>Email��web#djshjdh.com</li>
				<li>����#��Ϊ@���ɣ�</li>
				<li>��ְ��ƭ���ܽ᣺</li>
				<li>1�����ֽ��Ϊ��ΰ��ƭȡ��װ��</li>
				<li>2�����ֽ��Ϊ��ΰ��ƭȡ��װ��</li>
				<li>3�����ֽ��Ϊ��ΰ��ƭȡ��װƭȡ��װ�ѷ�װ�ѷ�</li>
				<li>4�����ֽ��Ϊ��ΰ��ƭȡ��װ��ƭȡ��װ��</li>
				<li>5�����ֽ��Ϊ��ΰ��ƭȡ��װ��</li>
				</ul>
			</div>
		</div>
		<div class="clear"></div>
	</div>
<#include "/WEB-INF/template/foot.ftl"/>