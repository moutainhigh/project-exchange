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
<div id="top">
		<div class="top_con">
		<div class="top_l">找兼职，上兼职吧！</div>
		<div class="top_r"><a href="#">注册</a> | <a href="#">登录</a><span><a href="#">发布免费信息</a><a href="#">付费推广</a><a href="#">帮助</a></span></div>
		</div>
</div>
<div id="mian">
<!--LOGo区域-->
	<div class="logo_uar">
		<div class="logo"></div>
		<div class="city"></div>
		<div class="sch"></div>
		<div class="issue"></div>
	</div>
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
            	<li><A href="#">广州首页</A></li>
                <li><A href="#" class="now_a">兼职招聘</A></li>
                <li><A href="#">全职招聘</A></li> 
                <li><A href="#">个人求职</A></li>
                <li><A href="#">简历中心</A></li>
                <li><A href="#">求职指导</A></li>
                <li><A href="#">毕业指导</A></li>
                 <li style="background:none;"><A href="#">招聘会</A></li>
            </ul>
        </div>
    </div>
	<!--当前位置区域-->
	<div class="current jz_dq_xg"><a href="#">兼职吧</a> > 兼职招聘 </div>
	
	<div class="con_top">
		<div class="con_top_top">
        			<p class="gs_wx "><strong>提示：</strong> 来自 广州 的用户您好！ 我们推荐您进入 <a href="#">广州兼职招聘</a> 频道</p>
        			<p class="jz_zw filter_city">
        			<span>全部城市：</span>
        			<a href="/<#if currTypeId??>${currTypeId}/<#else>jianzhi/</#if>" style="color:black;font-weight:600;">${currCityName}</a>
					<#list fillCityList as c>
					<a href="/${c.cityId}/<#if currTypeId??>${currTypeId}/</#if>" <#if currCityId?? && currCityId==c.cityId>class="curr_sel"</#if>>${c.simpleName}</a>
					</#list>
        			</p>

			<p class="jz_zw filter_type">
			<span>职位类别：</span>
			<a href="/<#if currCityId?? || currTypeId??><#if currCityId??>${currCityId}/</#if><#if currTypeId?? && currTypeId.length() gt 3>currParentTypeId/</#if><#else>jianzhi/</#if>" style="color:black;font-weight:600;">全部</a>
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
    	<a href="/<#if currCityId?? >${currCityId}/</#if><#if currTypeCode?? >${currTypeCode}/</#if>" <#if currUnitype==null>class="now_aa" </#if>id="tag1" style="color:#444;">全部</a>
        <a href="/<#if currCityId?? >${currCityId}/</#if><#if currTypeCode?? >${currTypeCode}/</#if>t1/" <#if currUnitype=='t1'>class="now_aa" </#if>id="tag2" style="color:#444;">公司直招</a>
        <a href="/<#if currCityId?? >${currCityId}/</#if><#if currTypeCode?? >${currTypeCode}/</#if>t2/" <#if currUnitype=='t2'>class="now_aa" </#if>id="tag3" style="color:#444;">职介招聘</a>
        <a href="/<#if currCityId?? >${currCityId}/</#if><#if currTypeCode?? >${currTypeCode}/</#if>t3/" <#if currUnitype=='t3'>class="now_aa" </#if>id="tag4" style="color:#444;">认证企业</a>
        </div>
        <p><span>公司</span> <strong> 薪金</strong>时间</p>
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
                <td class="td_2"><#if c.userId=='admin'||c.companyName==''>未填写<#else><a href="http://www.jianzhi8.com/user/${c.userId?url}" target="_blank"><#if c.companyName?length lt 19>${c.companyName}<#else>${c.companyName[0..18]}</#if></a><#if c.isYz=='1'><span><img src="http://css.jianzhi8.com/fenzhan/img/lb_r7_c7.jpg" /></span></#if></#if>
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
<a href="/<#if currCityId?? >${currCityId}/</#if><#if currTypeId?? >${currTypeId}/</#if><#if currUnitype?? >${currUnitype}/</#if>" class="n">首页</a>
<a href="/<#if currCityId?? >${currCityId}/</#if><#if currTypeId?? >${currTypeId}/</#if><#if currUnitype?? >${currUnitype}</#if>p${bean.prePageIndex}/" class="n">&lt;上页</a>
		</#if>
${bean.getPaper('/'+currCityId+'/'+ currTypeId + '/'+ currUnitype +'',2)}
		<#if bean.isnext>		
<a href="/<#if currCityId?? >${currCityId}/</#if><#if currTypeId?? >${currTypeId}/</#if><#if currUnitype?? >${currUnitype}</#if>p${bean.pageIndex+1}/" class="n">下页&gt;</a>
		</#if>
	<#else>		
		<#if !bean.isFirstPage>
<a href="/jianzhi/" class="n">首页</a>
<a href="/jianzhi/<#if bean.prePageIndex!='1'>p${bean.prePageIndex}/</#if>" class="n">&lt;上页</a>
		</#if>
${bean.getPaper('/jianzhi/',2)}
		<#if bean.isnext>
<a href="/jianzhi/p${bean.pageIndex+1}/" class="n">下页&gt;</a>
		</#if>	
	</#if>	
		</p>
    </h3>
</div>
<div class="tb_bom">
	<p>没有找到合适的工作，那<a href="#">发布求职信息</a>吧！</p>

</div>
<div class="copyright">
	<ul>
		<li><a href="#">联系我们</a> | <a href="#">广告业务</a> | <a href="#">信息置顶</a> | <a href="#">站内留言</a> | <a href="#">最新兼职</a> | <a href="#">最新简历</a> | <a href="#">免责声明</a></li>
		<li>Copyright  2007-2011 <a href="#">广州兼职网 (jianzhi8.com)</a> 版权所有</li>
		<li>ICP证：京07038868号</li>
	</ul>
</div>
</div>
</body>
</html>
