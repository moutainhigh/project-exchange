<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${areaName}${unitypename}${jobdatename}${typeName}兼职|${areaName}${jobdatename}兼职${typeName}招聘信息_兼职吧</title>
		<meta name="keywords" content='${areaName}${unitypename}${jobdatename}${typeName}兼职, ${areaName}${unitypename}${jobdatename}兼职${typeName}招聘' />
		<meta name="description" content="兼职吧${areaName}${unitypename}${jobdatename}${typeName}兼职栏目,每天免费为${areaName}${jobdatename}找${typeName}兼职工作的求职者提供大量最新最全的${areaName}${unitypename}${jobdatename}兼职${typeName}招聘信息。" />
		<link rel="Bookmark" href="/favicon.ico" />
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
		<link href="/css/reset.css" rel="stylesheet" type="text/css" />
		<link href="/css/mian.css" rel="stylesheet" type="text/css" />
		<script src="/js/jquery-1.4.3.min.js" type="text/javascript"></script>
		<script>
			//hide area list
			$(function(){
				if($('.filter_city a').length > 16){
					$('.filter_city a').slice(16).hide();
					$('.filter_city').append('<a href="javascript:void(0);" onclick="$(\'.filter_city a\').show();$(this).hide()">更多..</a>');
				}
				if($('.filter_type a').length > 10){
					$('.filter_type a').slice(10).hide();
					$('.filter_type').append('<a href="javascript:void(0);" onclick="$(\'.filter_type a\').show();$(this).hide()">更多..</a>');
				}
			});
		</script>
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
            	<A href="#" class="agg_a" onmousemove="document.getElementById('a_hover_ul').style.display='block'"onmouseout="document.getElementById('a_hover_ul').style.display='none'">网页设计</A><input type="text" class="sr_btn" /><input type="button" value="" />
                <ul id="a_hover_ul" style="display:none;" onmousemove="document.getElementById('a_hover_ul').style.display='block'" onmouseout="document.getElementById('a_hover_ul').style.display='none'">
                    <li><a href="#">网页设计</a></li>
                    <li><a href="#">网页设计</a></li>
                    <li><a href="#">网页设计</a></li>
                </ul>
            </div>
          <p><input type="button" value="免费发布信息" class="gs_mff" /><input type="button" value="写简历"  class="gs_xjl"/></p>
            
        </div>
        <div class="nav_botttom clearfix">
        	<ul class="clearfix">
            	<li><A href="/">首页</A></li>
                <li><A href="/jianzhi/">兼职招聘</A></li>
                <li><A href="/job/">全职招聘</A></li> 
                <li><A href="/rencai/" class="now_a">个人求职</A></li>
                <li><A href="/resume/">简历中心</A></li>
                <li><A href="/qiuzhizhidao/">求职指导</A></li>
                <li><A href="/biyezhidao/">毕业指导</A></li>
                <li style="background:none;"><A href="/zph/">招聘会</A></li>
            </ul>
        </div>
    </div>
	<!--当前位置区域-->
	<div class="current jz_dq_xg"><a href="#">兼职吧</a> > 个人求职 </div>
	
	<div class="con_top">
		<div class="con_top_top">
        			<p class="gs_wx "><strong>提示：</strong> 来自 广州 的用户您好！ 我们推荐您进入 <a href="#">广州兼职招聘</a> 频道</p>
        			<p class="jz_zw filter_city">
        			<span>全部城市：</span>
        			<a href="/<#if currParentCityId?? || currTypeId??><#if currParentCityId??>rc${currParentCityId}/</#if><#if currTypeId??>rc${currTypeId}/</#if><#else>rencai/</#if>" style="color:black;font-weight:600;">${currParentCityName}</a>
					<#list fillCityList as c>
					<a href="/rc${c.cityId}/<#if currTypeId??>rc${currTypeId}/</#if>" <#if currCityId?? && currCityId==c.cityId>class="curr_sel"</#if>>${c.simpleName}</a>
					</#list>
        			</p>

			<p class="jz_zw filter_type">
			<span>职位类别：</span>
			<a href="/<#if currCityId?? || currTypeId??><#if currCityId??>rc${currCityId}/</#if><#if currTypeId?? && currTypeId.length() gt 3>rc${currParentTypeId}/</#if><#else>rencai/</#if>" style="color:black;font-weight:600;">${currParentTypeName}</a>
			<#list fillTypeList as t>
			<a href="/<#if currCityId?? >rc${currCityId}/</#if>rc${t.typeId}/" <#if currTypeId?? && currTypeId==t.typeId>class="curr_sel"</#if>>${t.typeName}</a>
			</#list>
			</p>

		</div>
		
	</div>

<div class="nr_bq_top nr_bq_top_y">
	<h2>
    	<div class="clearfix"> 
    	<a href="/<#if currCityId?? || currTypeId??><#if currCityId??>rc${currCityId}/</#if><#if currTypeId??>rc${currTypeId}/</#if><#else>rencai/</#if>" <#if currClass==null>class="now_aa" </#if>id="tag1" style="color:#444;">全部</a>
        <a href="/<#if currCityId?? >rc${currCityId}/</#if><#if currTypeId?? >rc${currTypeId}/</#if>c0/" <#if currClass=='c0'>class="now_aa" </#if>id="tag2" style="color:#444;">兼职求职</a>
        <a href="/<#if currCityId?? >rc${currCityId}/</#if><#if currTypeId?? >rc${currTypeId}/</#if>c1/" <#if currClass=='c1'>class="now_aa" </#if>id="tag3" style="color:#444;">全职求职</a>
        </div>
        <p><span>年龄</span> <strong>性别</strong>时间</p>
    </h2>
    <table id="con1">
    	<tbody>
        	<tr>
            	<td colspan="4" id='afs_list_top' class="td_top"></td>
            </tr>
            <SCRIPT language=JavaScript	src="http://css.jianzhi8.com/fenzhan/ads/${currTypeId}ding.js" type=text/javascript></SCRIPT>                   
            <#list bean.resultList as c>
            <tr class="info">
            	<td class="td_1"><a href="/a${c.ctNo}.html" target="_blank">${c.title}</a><span>${c.area!''}</span></td>
                <td class="td_2">${c.age}</td>
                <td class="td_3">${c.sex}</td>
                <td class="td_4">${c.date?string('MM-dd')}</td>
            </tr>
            </#list>
            <tr>
            	<td colspan="4" class="td_top_left" id='afs_list_bot'></td>
            </tr>
        </tbody>
    </table>
    
    <h3 class="clearfix">
    <p id="page">
	<#if currCityId??||currTypeId??||currUnitype??>
		<#if !bean.isFirstPage>
<a href="/<#if currCityId?? >rc${currCityId}/</#if><#if currTypeId?? >rc${currTypeId}/</#if><#if currClass?? >rc${currClass}/</#if>" class="n">首页</a>
<a href="/<#if currCityId?? >rc${currCityId}/</#if><#if currTypeId?? >rc${currTypeId}/</#if><#if currClass?? >${currClass}</#if>p${bean.prePageIndex}/" class="n">&lt;上页</a>
		</#if>
${bean.getPaper('/'+currCityId+'/'+ currTypeId + '/'+ currClass +'',2,'rc')}
		<#if bean.isnext>		
<a href="/<#if currCityId?? >rc${currCityId}/</#if><#if currTypeId?? >rc${currTypeId}/</#if><#if currClass?? >${currClass}</#if>p${bean.pageIndex+1}/" class="n">下页&gt;</a>
		</#if>
	<#else>		
		<#if !bean.isFirstPage>
<a href="/rencai/" class="n">首页</a>
<a href="/rencai/<#if bean.prePageIndex!='1'>p${bean.prePageIndex}/</#if>" class="n">&lt;上页</a>
		</#if>
${bean.getPaper('/rencai/',2)}
		<#if bean.isnext>
<a href="/rencai/p${bean.pageIndex+1}/" class="n">下页&gt;</a>
		</#if>	
	</#if>	
		</p>
    </h3>
</div>
<div class="tb_bom">
	<p>没有找到合适的工作，那<a href="#">发布求职信息</a>吧！</p>

</div>
<#include "/WEB-INF/template/foot.ftl"/>