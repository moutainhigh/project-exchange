<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${g.gaoTitle}_��ְ��</title>
		<meta name="keywords" content='' />
		<meta name="description" content=''/>
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
	<div class="current jz_dq_xg"><a href="#">��ְ��</a> > ƭ�ӹ��� > ${g.gaoTitle} </div>
	
	<div class="zj_con">
		<div class="zj_con_l jz_pz_tab">
			<h3>${g.gaoTitle}<span>�����<strong> ${g.gaoClick} </strong> ��&nbsp;&nbsp;&nbsp;����ʱ�䣺${g.gaoDate?string('yyyy-mm-dd')}</span></h3>
			
			
			<table>
				<tr>
					<td class="jz_pz_tb1"><span>ƭ�ӹ�˾��</span>${g.gaoCompany}<#if g.gaoIpaddr??>��IP��${g.gaoIpaddr}��</#if></td>
					<td class="jz_pz_tb2"><span>��վ��</span>${g.gaoUrl}</td>
        </tr>
				
				<tr>
					<td class="jz_pz_tb1"><span>ƭ��QQ��</span>${g.gaoQq}</td>
					<td class="jz_pz_tb2"><span>���䣺</span>${g.gaoEmail}</td>
        </tr>
				
				<tr>
					<td class="jz_pz_tb1"><span>�绰��</span>${g.gaoPhone}</td>
					<td class="jz_pz_tb2"><span>�ֻ���</span>${g.gaoMobile}</td>
        </tr>
			</table>
		  <p class="jz_pz_lx"><strong>ƭ�����ͼ�飺</strong>${g.gaoTitle}</p>
			
			<h2 class="zj_con_jc jz_bj">��ϸ����</h2>
			<div class="con_p_con">
			<p class="con_sjj">
				${g.gaoContent}
			</p>
			<p class="con_sjj_ts"><span>������ʾ��</span>������Ϣ�����ѷ����ύ����������վ��������ְ�ɱ���Ϊ��ҷ��񣬴��ƭ��Ϊ����Ŀ�ģ�������Ȩ�����뼴ʱ��ϵ��վ��ʵɾ����</p>
			</div>
			
				<ul class="jz_con_xh">
					<li class="zj_con_jc">����ƭ����Ϣ��</li>
					<#list moreList as mg>
					<li><span>${mg.gaoDate?string('yyyy-mm-dd')}</span><a href="/gonggao/${mg.gaoNo}.html">${mg.gaoTitle}</a></li>
					</#list>
				</ul>		
		</div>
		<div class="zj_con_r zj_con_gr">
			<p class="zj_con_img"><img src="/img/nr_s1.jpg" /></p>
		</div>
		<div class="clear"></div>
	</div>
<#include "/WEB-INF/template/foot.ftl"/>
