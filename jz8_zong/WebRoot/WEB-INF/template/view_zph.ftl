<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${z.zphTitle}_��ְ��</title>
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
                <li style="background:none;"><A href="/zph/" class="now_a">��Ƹ��</A></li>
            </ul>
        </div>
    </div>
	<!--��ǰλ������-->
	<div class="current jz_dq_xg"><a href="#">��ְ��</a> > ��Ƹ�� </div>
	
	<div class="jz_pz_con">
		<div class="jz_pz_left jz_qiuzhi_con_zw">
			<div class="jz_left_ne_top">
			<h2>${z.zphTitle}</h2>
			<p class="jz_ne_ly"><span>��Դ����ְ��</span><span>����ʱ�䣺${z.zphUpdate?string('yyyy-MM-dd')}</span> <span>	<SCRIPT language=JavaScript src="/js/fontsize.js" type=text/javascript></SCRIPT></span>  <span>�����${z.zphClick} ��</span></p>
			
			<p id="zoom">
			${z.zphContent}
			</p>
			<br />
			�����ɼ�ְ��<a href="http://www.jianzhi8.com/"><font color="#000000" >��www.jianzhi8.com��</font></a>����,ת����ע��������<br />
			ԭ����ַ��<a href="/zph/${z.zphNo}.html"><font color="#000000" >http://www.jianzhi8.com/zph/${z.zphNo}.html</font></a></p>
			<div class="jz_sx_pianz">
				<#if preZph??>
					��һƪ��<a href="/zph/${preZph.zphNo}.html">${preZph.zphTitle}</a>
				</#if>
				<#if postZph??>
					��һƪ��<a href="/zph/${postZph.zphNo}.html">${postZph.zphTitle}</a>
				</#if>
			</div>
			</div>
			<div class="jz_left_ne_bom">
				<h3>�����������</h3>
					<ul>
						<#list moreList as mz>
						<li><a href="/zph/${mz.zphNo}.html" target="_blank">${mz.zphTitle}</a>${mz.zphUpdate?string('yyyy-MM-dd')}</li>
						</#list>
					</ul>
			</div>
		</div>
		<div class="jz_pz_right">
			<div class="add_erji">
            	<h1>������Ƹ��</h1>
          	    <h3>
                	<a href="/zph/bj/">����</a>
                    <a href="/zph/sh/">�Ϻ�</a>
                    <a href="/zph/cq/">����</a>
                    <a href="/zph/tj/">���</a>
                </h3>
                <ul>
                	<#list fillProCityList as p>
                	<li class="hover_lia">
                    	<p><b>${p.cityName}</b>><#list p.childs[0..1] as c><a href="/zph/${c.cityId}/">${c.simpleName}</a></#list></p>
                        <div>
                        	<ul>
                        		<#list p.childs[2..] as c>
                            	<li><a href="/zph/${c.cityId}/">${c.simpleName}</a></li>
                            	</#list>
                            </ul>
                        </div>
                    </li>
                    </#list>
                    <script type="text/javascript">
                    	$('.hover_lia').mouseover(function(){
						    $(this).addClass('hover_now');	
						})
						
						$('.hover_lia').mouseout(function(){
						    $(this).removeClass('hover_now');							   
						})
                    </script>
                </ul>
            </div>
		</div>
		<div class="clear"></div>
	</div>
<#include "/WEB-INF/template/foot.ftl"/>