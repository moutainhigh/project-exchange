<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${bean.title}_兼职吧${bean.pages}</title>
		<meta name="keywords" content='${bean.keywords}' />
		<meta name="description" content="${bean.description}${bean.pages}" />		<link rel="Bookmark" href="/favicon.ico" />
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
                <li><A href="/rencai/" class="now_a">个人求职</A></li>
                <li><A href="/resume/">简历中心</A></li>
                <li><A href="/qiuzhizhidao/">求职指导</A></li>
                <li><A href="/biyezhidao/">毕业指导</A></li>
                <li style="background:none;"><A href="/zph/">招聘会</A></li>
            </ul>
        </div>
    </div>
	<!--当前位置区域-->

	<div class="current jz_dq_xg"><a href="http://www.jianzhi8.com/">兼职吧</a> 
	&gt; <a href="http://www.jianzhi8.com/rencai/">人才简历</a> 
	<#if currClass?? && currClass=='c0'>
	&gt; <a href="/rcc0/">找兼职工作</a> 
	<#if currParentTypeId?? && queryTypeCode.length() gt 3> &gt; <a href="/rc${currParentTypeId}/rcc0/">${currParentTypeName}兼职</a></#if>
	<#if currTypeId??> &gt; <a href="/rc${currTypeId}/rcc0/">${currTypeName}兼职</a></#if>
	<#if currJobDate??> &gt; <a href="/${currJobDate}/rcc0/">${currJobDateName}兼职</a></#if>
	</#if>
	<#if currClass?? && currClass=='c1'>
	&gt; <a href="/rcc1/">找工作</a>
	<#if currParentJobTypeId?? && queryJobTypeCode.length() gt 3> &gt; <a href="/rc${currParentJobTypeId}/rcc1/">${currParentJobTypeName}兼职</a></#if>
	<#if currJobTypeId?? > &gt; <a href="/rc${currJobTypeId}/rcc1/">${currJobTypeName}招聘</a></#if>
	</#if>
	</div>
	
	
	<div class="con_top">
		<div class="con_top_top">
		<p class="jz_zw filter_type">列表：
			<a href="/rencai/" style="color:black;font-weight:600;">全部</a>
			<a href="/rcc0/" <#if currClass=="c0" >class="curr_sel"</#if>>兼职</a>
			<a href="/rcc1/" <#if currClass=="c1" >class="curr_sel"</#if>>全职</a>
		</p>		
			<#if currClass?? && currClass=='c0'>
			<p class="jz_zw filter_type">
			职位：
			<a href="/<#if queryTypeCode?? && (queryTypeCode.length() gt 3||currTypeCode='k27')>${currParentTypeId}/rcc0/<#else>rencai/</#if>" style="color:black;font-weight:600;">全部</a>
			<#list fillTypeList as t>
			<a href="/rc${t.typeId}/rc${currJobDate}c0/" <#if currTypeId?? && currTypeId==t.typeId>class="curr_sel"</#if>>${t.typeName}</a>
			</#list>
			</p>
			<p class="jz_zw filter_type">
			时间：
			<a href="/<#if queryTypeCode?? >${currTypeId}/<#else>rcc0/</#if>" style="color:black;font-weight:600;">全部</a>
			<#list jobdatemap.keySet() as k>
			<a href="/<#if currTypeId?? >rc${currTypeId}/</#if>rcd${k}<#if currUnitype?? >${currUnitype}</#if>c0/" <#if currJobDate?? && queryJobDate==k>class="curr_sel"</#if>>${jobdatemap.get(k)}</a>
			</#list>
	</#if>
	<#if currClass?? && currClass=='c1'>
			<p class="jz_zw filter_type">
			职位：
			<a href="/<#if queryJobTypeCode?? && (queryJobTypeCode.length() gt 3||currJobTypeCode='q27')>rc${currParentJobTypeId}/rcc1/<#else>rcc1/</#if>" style="color:black;font-weight:600;">全部</a>
			<#list fillJobTypeList as t>
			<a href="/rc${t.typeId}/rcc1/" <#if currJobTypeId?? && currJobTypeId==t.typeId>class="curr_sel"</#if>>${t.typeName}</a>
			</#list>
			</p>
	</#if>	
	<#if currClass??>
	<p class="jz_zw filter_city">
        			<span>热点城市：</span>
        <A href="http://bj.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/"  onclick="SetCookies('bj')" target="_blank" >北京</A>
        <A href="http://sh.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('sh')" target="_blank" >上海</A>
        <A href="http://tj.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('tj')" target="_blank" >天津</A>
        <A href="http://cq.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('cq')" target="_blank" >重庆</A>
        <A href="http://gz.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('gz')" target="_blank" >广州</A>
        <A href="http://sz.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('sz')" target="_blank" >深圳</A>
        <A href="http://dg.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('dg')" target="_blank" >东莞</A>
        <A href="http://st.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('st')" target="_blank" >汕头</A>
        <A href="http://zhongshan.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('zhongshan')" target="_blank" >中山</A>
        <A href="http://foshan.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('foshan')" target="_blank" >佛山</A>
        <A href="http://zh.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('zh')" target="_blank" >珠海</A>
        <A href="http://cd.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('cd')" target="_blank" >成都</A>
        <A href="http://hz.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('hz')" target="_blank" >杭州</A>
        <A href="http://nb.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('nb')" target="_blank" >宁波</A>
        <A href="http://gy.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('gy')" target="_blank" >贵阳</A>
        <A href="http://sy.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('sy')" target="_blank" >沈阳</A>
        <A href="http://heb.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('heb')" target="_blank" >哈尔滨</A>
        <A href="http://sjz.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('sjz')" target="_blank" >石家庄</A>
        <A href="http://tangshan.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('tangshan')" target="_blank" >唐山</A>
        <A href="http://baoding.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('baoding')" target="_blank" >保定</A>
        <A href="http://dl.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('dl')" target="_blank" >大连</A>
        <A href="http://nj.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('nj')" target="_blank" >南京</A>
        <A href="http://suzhou.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('suzhou')" target="_blank" >苏州</A>
        <A href="http://wx.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('wx')" target="_blank" >无锡</A>
        <A href="http://lyg.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('lyg')" target="_blank" >连云港</A>
        <A href="http://fz.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('fz')" target="_blank" >福州</A>
        <A href="http://xm.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('xm')" target="_blank" >厦门</A>
        <A href="http://zz.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('zz')" target="_blank" >郑州</A>
        <A href="http://ly.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('ly')" target="_blank" >洛阳</A>
        <A href="http://cc.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('cc')" target="_blank" >长春</A>
        <A href="http://jn.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('jn')" target="_blank" >济南</A>
        <A href="http://qd.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('qd')" target="_blank" >青岛</A>
        <A href="http://weihai.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('weihai')" target="_blank" >威海</A>
        <A href="http://yantai.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('yantai')" target="_blank" >烟台</A>
        <A href="http://hf.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('hf')" target="_blank" >合肥</A>
        <A href="http://nn.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('nn')" target="_blank" >南宁</A>
        <A href="http://guilin.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('guilin')" target="_blank" >桂林</A>
        <A href="http://haikou.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('haikou')" target="_blank" >海口</A>
        <A href="http://ty.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('ty')" target="_blank" >太原</A>
        <A href="http://yc.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('yc')" target="_blank" >银川</A>
        <A href="http://lz.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('lz')" target="_blank" >兰州</A>
        <A href="http://xa.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('xa')" target="_blank" >西安</A>
        <A href="http://xn.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('xn')" target="_blank" >西宁</A>
        <A href="http://wh.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('wh')" target="_blank" >武汉</A>
        <A href="http://cs.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('cs')" target="_blank" >长沙</A>
        <A href="http://nc.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('nc')" target="_blank" >南昌</A>
        <A href="http://jiujiang.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('jiujiang')" target="_blank" >九江</A>
        <A href="http://km.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('km')" target="_blank" >昆明</A>
        <A href="http://lasa.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('lasa')" target="_blank" >拉萨</A>
        <A href="/index.html" target="_blank" >更多...</A>
        			</p>	
       	</#if>			
		</div>
	</div>
<div class="nr_bq_top nr_bq_top_y">
	<h2>
    	<div class="clearfix"> 
    	<a href="/<#if currTypeId??>rc${currTypeId}/<#else>rencai/</#if>" <#if currClass==null>class="now_aa" </#if>id="tag1" style="color:#444;">全部</a>
        <a href="/<#if currTypeId?? >rc${currTypeId}/</#if>rcc0/" <#if currClass=='c0'>class="now_aa" </#if>id="tag2" style="color:#444;">兼职求职</a>
        <a href="/<#if currJobTypeId?? >rc${currJobTypeId}/</#if>rcc1/" <#if currClass=='c1'>class="now_aa" </#if>id="tag3" style="color:#444;">全职求职</a>
        </div>
        <p><span>年龄</span> <strong>性别</strong>时间</p>
    </h2>
    <table id="listTbl">
    	<tbody>
        	<tr>
            	<td id='afs_list_top' class="td_top"></td>
            </tr>
            <SCRIPT language=JavaScript	src="http://css.jianzhi8.com/fenzhan/ads/${currTypeId}ding.js" type=text/javascript></SCRIPT>                   
            <#list bean.resultList as c>
            <tr class="info">
            	<td class="td_search" ><a href="http://${c.cityId}.jianzhi8.com/a${c.ctNo}.html" target="_blank">${c.title}</a>
            	<#if c.ding><img src="http://css.jianzhi8.com/fenzhan/img/ding2.gif" /></#if><#if c.isYz=='1'><span class=tu>图</span></#if><#if areaId =='' ><a  target="_blank" href="http://${c.cityId}.jianzhi8.com/rc${c.cityCode}/<#if c.typeCode!='' >rc${c.typeCode}/</#if>rcc${c.ctClass}/" class="titlehui"><span>${c.area!''}</span></a></#if>
            	 <br>${c.sex}<#if  c.age =='保密'||c.age =='' ><#else> ${c.age}岁</#if>：${c.ctContent}(${c.date?string('MM-dd')})
            </tr>
            </#list>
            <tr>
            	<td  class="td_top_left" id='afs_list_bot'></td>
            </tr>
        </tbody>
    </table>
    
    <h3 class="clearfix">
    <p id="page">
	<#if currClass??>
		<#if !bean.isFirstPage>
<a href="<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" class="n">首页</a>
<a href="<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/<#if bean.prePageIndex !=1 >p${bean.prePageIndex}/</#if>" class="n">&lt;上页</a>
		</#if>
	<#if currTypeId?? || currJobTypeId>
		${bean.getPaper('/rc'+ currTypeId +currJobTypeId+ '/rc'+currJobDate+ currClass +'/',2,'')}
	<#else>
	${bean.getPaper('/rc'+currJobDate+ currClass +'/',2,'')}
	</#if>

		<#if bean.isnext>		
<a href="<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/p${bean.pageIndex+1}/" class="n">下页&gt;</a>
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
	<p>没有找到合适的简历，那<a href="http://my.jianzhi8.com/fb.do" target="_blank">发布招聘职位</a>吧！</p>

</div>
<script>var channel_id="8219879658",minTop="3",minBot="2",afsword='${currTypeName}简历  求职信息   人才'</script>
	<script src="http://www.google.cn/jsapi" type="text/javascript"></script>
	<script type="text/javascript" charset="utf-8">google.load('ads.search', '2');</script>
	<script src="http://css.jianzhi8.com/fenzhan/ggads/afs2.js" type="text/javascript"></script>
<#include "/WEB-INF/template/foot.ftl"/>