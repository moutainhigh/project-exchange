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
		<script>
			//hide area list
			$(function(){
				if($('.filter_city a').length > 16){
					$('.filter_city a').slice(16).hide();
					$('.filter_city').append('<a href="javascript:void(0);" onclick="$(\'.filter_city a\').show();$(this).hide()">����..</a>');
				}
				if($('.filter_type a').length > 10){
					$('.filter_type a').slice(10).hide();
					$('.filter_type').append('<a href="javascript:void(0);" onclick="$(\'.filter_type a\').show();$(this).hide()">����..</a>');
				}
			});
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
                <li><A href="/rencai/" class="now_a">������ְ</A></li>
                <li><A href="/resume/">��������</A></li>
                <li><A href="/qiuzhizhidao/">��ְָ��</A></li>
                <li><A href="/biyezhidao/">��ҵָ��</A></li>
                <li style="background:none;"><A href="/zph/">��Ƹ��</A></li>
            </ul>
        </div>
    </div>
	<!--��ǰλ������-->
	<div class="current jz_dq_xg"><a href="#">��ְ��</a> > ������ְ </div>
	
	<div class="con_top">
		<div class="con_top_top">
        			<p class="gs_wx "><strong>��ʾ��</strong> ���� ���� ���û����ã� �����Ƽ������� <a href="#">���ݼ�ְ��Ƹ</a> Ƶ��</p>
        			<p class="jz_zw filter_city">
        			<span>ȫ�����У�</span>
        			<a href="/<#if currParentCityId?? || currTypeId??><#if currParentCityId??>rc${currParentCityId}/</#if><#if currTypeId??>rc${currTypeId}/</#if><#else>rencai/</#if>" style="color:black;font-weight:600;">${currParentCityName}</a>
					<#list fillCityList as c>
					<a href="/rc${c.cityId}/<#if currTypeId??>rc${currTypeId}/</#if>" <#if currCityId?? && currCityId==c.cityId>class="curr_sel"</#if>>${c.simpleName}</a>
					</#list>
        			</p>

			<p class="jz_zw filter_type">
			<span>ְλ���</span>
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
    	<a href="/<#if currCityId?? || currTypeId??><#if currCityId??>rc${currCityId}/</#if><#if currTypeId??>rc${currTypeId}/</#if><#else>rencai/</#if>" <#if currClass==null>class="now_aa" </#if>id="tag1" style="color:#444;">ȫ��</a>
        <a href="/<#if currCityId?? >rc${currCityId}/</#if><#if currTypeId?? >rc${currTypeId}/</#if>c0/" <#if currClass=='c0'>class="now_aa" </#if>id="tag2" style="color:#444;">��ְ��ְ</a>
        <a href="/<#if currCityId?? >rc${currCityId}/</#if><#if currTypeId?? >rc${currTypeId}/</#if>c1/" <#if currClass=='c1'>class="now_aa" </#if>id="tag3" style="color:#444;">ȫְ��ְ</a>
        </div>
        <p><span>����</span> <strong>�Ա�</strong>ʱ��</p>
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
<a href="/<#if currCityId?? >rc${currCityId}/</#if><#if currTypeId?? >rc${currTypeId}/</#if><#if currClass?? >rc${currClass}/</#if>" class="n">��ҳ</a>
<a href="/<#if currCityId?? >rc${currCityId}/</#if><#if currTypeId?? >rc${currTypeId}/</#if><#if currClass?? >${currClass}</#if>p${bean.prePageIndex}/" class="n">&lt;��ҳ</a>
		</#if>
${bean.getPaper('/'+currCityId+'/'+ currTypeId + '/'+ currClass +'',2,'rc')}
		<#if bean.isnext>		
<a href="/<#if currCityId?? >rc${currCityId}/</#if><#if currTypeId?? >rc${currTypeId}/</#if><#if currClass?? >${currClass}</#if>p${bean.pageIndex+1}/" class="n">��ҳ&gt;</a>
		</#if>
	<#else>		
		<#if !bean.isFirstPage>
<a href="/rencai/" class="n">��ҳ</a>
<a href="/rencai/<#if bean.prePageIndex!='1'>p${bean.prePageIndex}/</#if>" class="n">&lt;��ҳ</a>
		</#if>
${bean.getPaper('/rencai/',2)}
		<#if bean.isnext>
<a href="/rencai/p${bean.pageIndex+1}/" class="n">��ҳ&gt;</a>
		</#if>	
	</#if>	
		</p>
    </h3>
</div>
<div class="tb_bom">
	<p>û���ҵ����ʵĹ�������<a href="#">������ְ��Ϣ</a>�ɣ�</p>

</div>
<#include "/WEB-INF/template/foot.ftl"/>