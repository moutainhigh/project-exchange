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
	<div class="current jz_dq_xg"><a href="http://www.jianzhi8.com/">��ְ��</a> > <a href="http://www.jianzhi8.com/tuandui/">��ְ�Ŷ�</a> 
	<#if currCityName??> &gt; <a href="http://www.jianzhi8.com/tuandui/${currCityId}/">${currCityName}��ְ�Ŷ�</a></#if>
	</div>
	
	<div class="jz_pz_con">
		<div class="jz_pz_left">
			<h3>���¼�ְ�Ŷ�</h3>
			<ul>
				<#list bean.resultList as t>
				<li><a href="/tuandui/${t.tuanduiNo}.html">${t.tuanduiTitle}</a>&nbsp;<span>${t.tuanduiDate?string('yyyy-MM-dd')}</span></li>
				</#list>
			</ul>
			
			<div class="con_fy">
				<#if !bean.isFirstPage>
					<a href="/tuandui/<#if currCityId??>${currCityId}/</#if>p${bean.prePageIndex}/" class="fy_d">��ҳ</a>
				</#if>
				${bean.getQitaPaper('/tuandui/' + currCityId + '/')}
				<#if !bean.isLastPage>
					<a href="/tuandui/<#if currCityId??>${currCityId}/</#if>p${bean.pageIndex+1}/" class="fy_d">��ҳ</a>
				</#if>
			</div>
<div class="clear"></div>
		</div>
		<div class="jz_pz_right">
			<div class="add_erji">
            	<h1>���м�ְ�Ŷ�</h1>
          	    <h3>
                	<a href="/tuandui/bj/">����</a>
                    <a href="/tuandui/sh/">�Ϻ�</a>
                    <a href="/tuandui/cq/">����</a>
                    <a href="/tuandui/tj/">���</a>
                </h3>
                <ul>
                	<#list fillProCityList as p>
                	<li class="hover_lia">
                    	<p><b>${p.cityName}</b>><#list p.childs[0..1] as c><a href="/tuandui/${c.cityId}/">${c.simpleName}</a></#list></p>
                        <div>
                        	<ul>
                        		<#list p.childs[2..] as c>
                            	<li><a href="/tuandui/${c.cityId}/">${c.simpleName}</a></li>
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