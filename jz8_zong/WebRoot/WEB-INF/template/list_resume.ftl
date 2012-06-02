<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${bean.title}_兼职吧${bean.pages}</title>
		<meta name="keywords" content='${bean.keywords}' />
		<meta name="description" content="${bean.description}${bean.pages}" />
		<link rel="Bookmark" href="/favicon.ico" />
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
		<link href="/css/reset.css" rel="stylesheet" type="text/css" />
		<link href="/css/main.css" rel="stylesheet" type="text/css" />
		<script src="/js/jquery-1.4.3.min.js" type="text/javascript"></script>
		<script src="/js/top.js" type="text/javascript"></script>
	</head>
<body>
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
            	<a id="search_type" href="#" class="agg_a" onmousemove="document.getElementById('a_hover_ul').style.display='block'"onmouseout="document.getElementById('a_hover_ul').style.display='none'">综合</a>
            	<input type="text" class="sr_btn" id="s_key" name="s_key" value=""/><input type="button" value="" onclick="doSearch();"/>
                <ul id="a_hover_ul" style="display:none;" onmousemove="document.getElementById('a_hover_ul').style.display='block'" onmouseout="document.getElementById('a_hover_ul').style.display='none'">
                	<li><a href="#">综合</a></li>
                    <li><a href="#">兼职</a></li>
                    <li><a href="#">全职</a></li>
                    <li><a href="#">求职</a></li>
                    <li><a href="#">简历</a></li>
                </ul>
            </div>
          <p><input type="button" value="免费发布信息" class="gs_mff" /><input type="button" value="写简历"  class="gs_xjl"/></p>
            
        </div>
        <div class="nav_botttom clearfix">
        	<ul class="clearfix">
            	<li><A href="/">首页</A></li>
                <li><A href="/jianzhi/">兼职招聘</A></li>
                <li><A href="/job/">全职招聘</A></li> 
                <li><A href="/rencai/">个人求职</A></li>
                <li><A href="/resume/" class="now_a">简历中心</A></li>
                <li><A href="/qiuzhizhidao/">求职指导</A></li>
                <li><A href="/biyezhidao/">毕业指导</A></li>
                <li style="background:none;"><A href="/zph/">招聘会</A></li>
            </ul>
        </div>
    </div>
	<!--当前位置区域-->
	<div class="current jz_dq_xg"><a href="http://www.jianzhi8.com/">兼职吧</a> > 简历中心 </div>
<div class="nr_bq_bg">
	<table width="951" cellpadding="0" cellspacing="0" class="tb1">
		<tr align="left">
			<td width="143" class="tb_p">姓名</td>
			<td width="200">期望职位</td>
			<td width="80">求职类型</td>
			<td width="94">性别</td>
			<td width="93">年龄</td>
			<td width="139">现住地址</td>
			<td width="113">人才类型</td>
			<td width="73">时间</td>
		</tr>
		</table>
		<table width="951" cellpadding="0" cellspacing="0">
		<tr>
		<td  id='afs_list_top' class="td_top">
      </td>
		</tr>
		</table>
		<table width="951" cellpadding="0" cellspacing="0" id="listTbl">
		<#list bean.resultList as r>
		<tr align="left" class="info">
			<td width="143" class="tb_p">
			<a href="http://${r.cityId}.jianzhi8.com/resume/${r.userNo}.html" target="_blank">${r.userName}</a>
			<#if r.userfilename !='face.gif' && r.userfilename!=''><span class=tu>图</span></#if>
			</td>
			<td width="200">${r.typeName}</td>
			<td width="80"><#if r.userClass=="0">兼职<#else>全职</#if></td>
			<td width="94">${r.sex}</td>
			<td width="93"><#if r.age==""||r.age="保密">保密<#else>${r.age}岁</#if></td>
			<td width="136"><#if r.cityName=="">未填写 <#else>${r.cityName} </#if></td>
			<td width="106">${r.shenfen}</td>
			<td width="76">${r.date?string('MM-dd')}</td>
		</tr>
		</#list>
	</table>
	<table width="951" cellpadding="0" cellspacing="0">
		<tr>
		<td  class="td_top_left" id='afs_list_bot'></td>
		</tr>
	</table>
    
  <h3 class="clearfix" >
    <p id="page">
		<#if !bean.isFirstPage>
			<a href="/resume/" class="n">首页</a>
			<a href="/resume/p${bean.prePageIndex}/" class="n">上页</a>
		</#if>${bean.getPaper('/resume/')}
		<#if !bean.isLastPage>
			<a href="/resume/p${bean.pageIndex+1}/" class="n">下页</a>
		</#if>
		</p>
    </h3>
</div>
<div class="tb_bom">
	<p>还没有简历？那快<a href="#">登记一份简历</a>吧！</p>
</div>
<script>var channel_id="8219879658",minTop="3",minBot="2",afsword='${currTypeName}个人简历   人才招聘'</script>
	<script src="http://www.google.cn/jsapi" type="text/javascript"></script>
	<script type="text/javascript" charset="utf-8">google.load('ads.search', '2');</script>
	<script src="http://css.jianzhi8.com/fenzhan/ggads/afs2.js" type="text/javascript"></script>
<#include "/WEB-INF/template/foot.ftl"/>
