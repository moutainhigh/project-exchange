<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${u.userCompanyName}_��ְ��</title>
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
	<div class="current jz_dq_xg"><a href="/">��ְ��</a> > ${u.userCompanyName}</div>
	
	<div class="zj_con">
		<div class="zj_con_l">
			<h3>${u.userCompanyName}<img src="/img/gs_r2_c2.jpg" /><span>
			<a href="#" class="gs_tt"><img src="/img/gsy_r2_c6.jpg" />Ͷ�ݼ���</a><a href="#"><img src="/img/gsy_r3_c4.jpg" />�����ղ�</a>
			</span>
			</h3>
			<table>
				<tr>
					<td height="38">��&nbsp;&nbsp;ģ��</td>
					<td>��˾��ҵ��</td>
				</tr>
				
				<tr>
					<td>��&nbsp;&nbsp;ַ��${u.userAddress}</td>
					<td></td>
				</tr>
			</table>
			
			<h2 class="zj_con_jc jz_bj">��˾���ܣ�</h2>
			<div class="con_p_con">
			<p class="con_sjj">
			${u.userBrief}
			</p>
			</div>

			<h2 class="zj_con_jc jz_bj">��ϵ��ʽ��<span>����ʾ������Ҫ�����ɱ�֤�𡢸�ѡ�Ѻ��ȷ��õ���Ƹ����100%Ϊ�����Ϣ�������ϵ���ƭ����</span></h2>
			<ul class="con_ds con_ul con_ubj">
				<li>${u.userContact}</li>
                <li><form><input type="text" id="" name="" class="gs_con" /><input type="button" id=" "  name="" class="gs_btn" value="��ѯ���������" /></form></li>
                <li class="gs_wx"><strong>��ܰ��ʾ��</strong>������ͨ���ֻ���������ز�ѯ���ֱ���ϵ���Ƿ񱾵��û�</li>
			</ul>
			
			<ul class="con_xh">
				<li class="zj_con_jc">�ù�˾�����ļ�ְ/��Ƹ��Ϣ��</li>
				<#list bean.resultList as c>
				<li><span>${c.ctUpdate?string('yyyy-MM-dd')}</span><#if c.ctClass=='1'>��Ƹ<#else>��ְ</#if><a href="/a${c.ctNo}.html">${c.ctTitle}</a></li>
				</#list>
			</ul>
			<div class="con_fy">
				<#if !bean.isFirstPage>
					<a href="/user/${u.userId}/p${bean.prePageIndex}/" class="fy_d">��ҳ</a>
				</#if>
				${bean.getUserPaper('/user/' + u.userId + '/')}
				<#if !bean.isLastPage>
					<a href="/user/${u.userId}/p${bean.pageIndex+1}/" class="fy_d">��ҳ</a>
				</#if>
			</div>
			<div class="clear"></div>
			
         	<h2 class="zj_con_jc jz_bj">���๫˾�Ƽ���</h2> 
            <table width="705" height="118">
            	<#list moreUserList as mu>
            	<tr>
                	<td><a href="http://www.jianzhi8.com/user/${u.userId}">${mu.userCompanyName}</a></td>
                </tr>
                </#list>
       		</table>
		</div>
		<div class="zj_con_r zj_con_gr">
			<p class="zj_con_img"><img src="/img/nr_s1.jpg" /></p>
		</div>
		<div class="clear"></div>
	</div>
<#include "/WEB-INF/template/foot.ftl"/>
