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
<div id="top">
		<div class="top_con">
		<div class="top_l">�Ҽ�ְ���ϼ�ְ�ɣ�</div>
		<div class="top_r"><a href="#">ע��</a> | <a href="#">��¼</a><span><a href="#">���������Ϣ</a><a href="#">�����ƹ�</a><a href="#">����</a></span></div>
		</div>
</div>
<div id="mian">
<!--LOGo����-->
	<div class="logo_uar">
		<div class="logo"></div>
		<div class="city"></div>
		<div class="sch"></div>
		<div class="issue"></div>
	</div>
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
            	<li><A href="#">������ҳ</A></li>
                <li><A href="#" class="now_a">��ְ��Ƹ</A></li>
                <li><A href="#">ȫְ��Ƹ</A></li> 
                <li><A href="#">������ְ</A></li>
                <li><A href="#">��������</A></li>
                <li><A href="#">��ְָ��</A></li>
                <li><A href="#">��ҵָ��</A></li>
                 <li style="background:none;"><A href="#">��Ƹ��</A></li>
            </ul>
        </div>
    </div>
	<!--��ǰλ������-->
	<div class="current jz_dq_xg"><a href="#">��ְ��</a> > ��ְ��Ƹ </div>
	
	<div class="con_top">
		<div class="con_top_top">
        			<p class="gs_wx "><strong>��ʾ��</strong> ���� ���� ���û����ã� �����Ƽ������� <a href="#">���ݼ�ְ��Ƹ</a> Ƶ��</p>
        			<p class="jz_zw filter_city">
        			<span>ȫ�����У�</span>
        			<a href="/<#if currTypeId??>${currTypeId}/<#else>jianzhi/</#if>" style="color:black;font-weight:600;">${currCityName}</a>
					<#list fillCityList as c>
					<a href="/${c.cityId}/<#if currTypeId??>${currTypeId}/</#if>" <#if currCityId?? && currCityId==c.cityId>class="curr_sel"</#if>>${c.simpleName}</a>
					</#list>
        			</p>

			<p class="jz_zw filter_type">
			<span>ְλ���</span>
			<a href="/<#if currCityId?? || currTypeId??><#if currCityId??>${currCityId}/</#if><#if currTypeId?? && currTypeId.length() gt 3>currParentTypeId/</#if><#else>jianzhi/</#if>" style="color:black;font-weight:600;">ȫ��</a>
			<#list fillTypeList as t>
			<a href="/<#if currCityId?? >${currCityId}/</#if>${t.typeId}/" <#if currTypeId?? && currTypeId==t.typeId>class="curr_sel"</#if>>${t.typeName}</a>
			</#list>
			</p>

		</div>
		
	</div>

<div class="nr_bq_top nr_bq_top_y">
<script language="javascript">
document.write('<style type="text/css">#con2,#con3,#con4{display:none;}</style>');
function showTag(index){
	for( var i=1; i<=4; i++){
		if(index == i){
			document.getElementById("con" + i).style.display = "block";
			document.getElementById("tag" + i).className = "now_aa";
		}
		else{
			document.getElementById("con" + i).style.display = "none";
			document.getElementById("tag" + i).className = "";
		}
	}
}
</script>

	<h2>
    	<div class="clearfix"> 
    	<a href="/<#if currCityId?? >${currCityId}/</#if><#if currTypeCode?? >${currTypeCode}/</#if>" <#if currUnitype==null>class="now_aa" </#if>id="tag1" style="color:#444;">ȫ��</a>
        <a href="/<#if currCityId?? >${currCityId}/</#if><#if currTypeCode?? >${currTypeCode}/</#if>t1/" <#if currUnitype=='t1'>class="now_aa" </#if>id="tag2" style="color:#444;">��˾ֱ��</a>
        <a href="/<#if currCityId?? >${currCityId}/</#if><#if currTypeCode?? >${currTypeCode}/</#if>t2/" <#if currUnitype=='t2'>class="now_aa" </#if>id="tag3" style="color:#444;">ְ����Ƹ</a>
        <a href="/<#if currCityId?? >${currCityId}/</#if><#if currTypeCode?? >${currTypeCode}/</#if>t3/" <#if currUnitype=='t3'>class="now_aa" </#if>id="tag4" style="color:#444;">��֤��ҵ</a>
        </div>
        <p><span>��˾</span> <strong> н��</strong>ʱ��</p>
    </h2>
    <table id="con1">
    	<tbody>
        	<tr>
            	<td colspan="4" id='afs_list_top' class="td_top"></td>
            </tr>
            <SCRIPT language=JavaScript	src="http://css.jianzhi8.com/fenzhan/ads/${typeId}ding.js" type=text/javascript></SCRIPT>                   
            <#list bean.resultList as c>
             <tr class="info">
            	<td class="td_1">
            	<#if c.cityId=='3500'>
            	<a href="http://www.jianzhi8.com/a${c.ctNo}.html" target="_blank">${c.title}</a>
            	<#else>
            	<a href="/a${c.ctNo}.html" target="_blank">${c.title}</a>
            	</#if>
            	<#if c.ding><b><img src="http://css.jianzhi8.com/fenzhan/img/lb_r6_c4.jpg" /></b></#if>
            	<#if areaId=='' &&c.cityName!=''><span><a href="/${c.cityCode}/<#if typeCode!='' >${typeCode}/</#if>" class="titlehui">${c.cityName}</a></span></#if>
            	</td>
                <td class="td_2"><#if c.userId=='admin'||c.companyName==''>δ��д<#else><a href="http://www.jianzhi8.com/user/${c.userId?url}" target="_blank"><#if c.companyName?length lt 19>${c.companyName}<#else>${c.companyName[0..18]}</#if></a><#if c.isYz=='1'><span><img src="http://css.jianzhi8.com/fenzhan/img/lb_r7_c7.jpg" /></span></#if></#if>
                </td>
                <td class="td_3"><#if (c.salary)?length lt 10>${c.salary}<#else>${c.salary[0..8]}</#if></td>
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
<a href="/<#if currCityId?? >${currCityId}/</#if><#if currTypeId?? >${currTypeId}/</#if><#if currUnitype?? >${currUnitype}/</#if>" class="n">��ҳ</a>
<a href="/<#if currCityId?? >${currCityId}/</#if><#if currTypeId?? >${currTypeId}/</#if><#if currUnitype?? >${currUnitype}</#if>p${bean.prePageIndex}/" class="n">&lt;��ҳ</a>
		</#if>
${bean.getPaper('/'+currCityId+'/'+ currTypeId + '/'+ currUnitype +'',2)}
		<#if bean.isnext>		
<a href="/<#if currCityId?? >${currCityId}/</#if><#if currTypeId?? >${currTypeId}/</#if><#if currUnitype?? >${currUnitype}</#if>p${bean.pageIndex+1}/" class="n">��ҳ&gt;</a>
		</#if>
	<#else>		
		<#if !bean.isFirstPage>
<a href="/jianzhi/" class="n">��ҳ</a>
<a href="/jianzhi/<#if bean.prePageIndex!='1'>p${bean.prePageIndex}/</#if>" class="n">&lt;��ҳ</a>
		</#if>
${bean.getPaper('/jianzhi/',2)}
		<#if bean.isnext>
<a href="/jianzhi/p${bean.pageIndex+1}/" class="n">��ҳ&gt;</a>
		</#if>	
	</#if>	
		</p>
    </h3>
</div>
<div class="tb_bom">
	<p>û���ҵ����ʵĹ�������<a href="#">������ְ��Ϣ</a>�ɣ�</p>

</div>
<div class="copyright">
	<ul>
		<li><a href="#">��ϵ����</a> | <a href="#">���ҵ��</a> | <a href="#">��Ϣ�ö�</a> | <a href="#">վ������</a> | <a href="#">���¼�ְ</a> | <a href="#">���¼���</a> | <a href="#">��������</a></li>
		<li>Copyright  2007-2011 <a href="#">���ݼ�ְ�� (jianzhi8.com)</a> ��Ȩ����</li>
		<li>ICP֤����07038868��</li>
	</ul>
</div>
</div>
</body>
</html>
