<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${bean.title}_��ְ��${bean.pages}</title>
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
            	<a id="search_type" href="#" class="agg_a" onmousemove="document.getElementById('a_hover_ul').style.display='block'"onmouseout="document.getElementById('a_hover_ul').style.display='none'">�ۺ�</a>
            	<input type="text" class="sr_btn" id="s_key" name="s_key" value=""/><input type="button" value="" onclick="doSearch();"/>
                <ul id="a_hover_ul" style="display:none;" onmousemove="document.getElementById('a_hover_ul').style.display='block'" onmouseout="document.getElementById('a_hover_ul').style.display='none'">
                	<li><a href="#">�ۺ�</a></li>
                    <li><a href="#">��ְ</a></li>
                    <li><a href="#">ȫְ</a></li>
                    <li><a href="#">��ְ</a></li>
                    <li><a href="#">����</a></li>
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

	<div class="current jz_dq_xg"><a href="http://www.jianzhi8.com/">��ְ��</a> 
	&gt; <a href="http://www.jianzhi8.com/rencai/">�˲ż���</a> 
	<#if currClass?? && currClass=='c0'>
	&gt; <a href="/rcc0/">�Ҽ�ְ����</a> 
	<#if currParentTypeId?? && queryTypeCode.length() gt 3> &gt; <a href="/rc${currParentTypeId}/rcc0/">${currParentTypeName}��ְ</a></#if>
	<#if currTypeId??> &gt; <a href="/rc${currTypeId}/rcc0/">${currTypeName}��ְ</a></#if>
	<#if currJobDate??> &gt; <a href="/${currJobDate}/rcc0/">${currJobDateName}��ְ</a></#if>
	</#if>
	<#if currClass?? && currClass=='c1'>
	&gt; <a href="/rcc1/">�ҹ���</a>
	<#if currParentJobTypeId?? && queryJobTypeCode.length() gt 3> &gt; <a href="/rc${currParentJobTypeId}/rcc1/">${currParentJobTypeName}��ְ</a></#if>
	<#if currJobTypeId?? > &gt; <a href="/rc${currJobTypeId}/rcc1/">${currJobTypeName}��Ƹ</a></#if>
	</#if>
	</div>
	
	
	<div class="con_top">
		<div class="con_top_top">
		<p class="jz_zw filter_type">�б�
			<a href="/rencai/" style="color:black;font-weight:600;">ȫ��</a>
			<a href="/rcc0/" <#if currClass=="c0" >class="curr_sel"</#if>>��ְ</a>
			<a href="/rcc1/" <#if currClass=="c1" >class="curr_sel"</#if>>ȫְ</a>
		</p>		
			<#if currClass?? && currClass=='c0'>
			<p class="jz_zw filter_type">
			ְλ��
			<a href="/<#if queryTypeCode?? && (queryTypeCode.length() gt 3||currTypeCode='k27')>${currParentTypeId}/rcc0/<#else>rencai/</#if>" style="color:black;font-weight:600;">ȫ��</a>
			<#list fillTypeList as t>
			<a href="/rc${t.typeId}/rc${currJobDate}c0/" <#if currTypeId?? && currTypeId==t.typeId>class="curr_sel"</#if>>${t.typeName}</a>
			</#list>
			</p>
			<p class="jz_zw filter_type">
			ʱ�䣺
			<a href="/<#if queryTypeCode?? >${currTypeId}/<#else>rcc0/</#if>" style="color:black;font-weight:600;">ȫ��</a>
			<#list jobdatemap.keySet() as k>
			<a href="/<#if currTypeId?? >rc${currTypeId}/</#if>rcd${k}<#if currUnitype?? >${currUnitype}</#if>c0/" <#if currJobDate?? && queryJobDate==k>class="curr_sel"</#if>>${jobdatemap.get(k)}</a>
			</#list>
	</#if>
	<#if currClass?? && currClass=='c1'>
			<p class="jz_zw filter_type">
			ְλ��
			<a href="/<#if queryJobTypeCode?? && (queryJobTypeCode.length() gt 3||currJobTypeCode='q27')>rc${currParentJobTypeId}/rcc1/<#else>rcc1/</#if>" style="color:black;font-weight:600;">ȫ��</a>
			<#list fillJobTypeList as t>
			<a href="/rc${t.typeId}/rcc1/" <#if currJobTypeId?? && currJobTypeId==t.typeId>class="curr_sel"</#if>>${t.typeName}</a>
			</#list>
			</p>
	</#if>	
	<#if currClass??>
	<p class="jz_zw filter_city">
        			<span>�ȵ���У�</span>
        <A href="http://bj.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/"  onclick="SetCookies('bj')" target="_blank" >����</A>
        <A href="http://sh.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('sh')" target="_blank" >�Ϻ�</A>
        <A href="http://tj.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('tj')" target="_blank" >���</A>
        <A href="http://cq.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('cq')" target="_blank" >����</A>
        <A href="http://gz.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('gz')" target="_blank" >����</A>
        <A href="http://sz.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('sz')" target="_blank" >����</A>
        <A href="http://dg.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('dg')" target="_blank" >��ݸ</A>
        <A href="http://st.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('st')" target="_blank" >��ͷ</A>
        <A href="http://zhongshan.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('zhongshan')" target="_blank" >��ɽ</A>
        <A href="http://foshan.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('foshan')" target="_blank" >��ɽ</A>
        <A href="http://zh.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('zh')" target="_blank" >�麣</A>
        <A href="http://cd.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('cd')" target="_blank" >�ɶ�</A>
        <A href="http://hz.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('hz')" target="_blank" >����</A>
        <A href="http://nb.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('nb')" target="_blank" >����</A>
        <A href="http://gy.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('gy')" target="_blank" >����</A>
        <A href="http://sy.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('sy')" target="_blank" >����</A>
        <A href="http://heb.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('heb')" target="_blank" >������</A>
        <A href="http://sjz.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('sjz')" target="_blank" >ʯ��ׯ</A>
        <A href="http://tangshan.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('tangshan')" target="_blank" >��ɽ</A>
        <A href="http://baoding.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('baoding')" target="_blank" >����</A>
        <A href="http://dl.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('dl')" target="_blank" >����</A>
        <A href="http://nj.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('nj')" target="_blank" >�Ͼ�</A>
        <A href="http://suzhou.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('suzhou')" target="_blank" >����</A>
        <A href="http://wx.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('wx')" target="_blank" >����</A>
        <A href="http://lyg.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('lyg')" target="_blank" >���Ƹ�</A>
        <A href="http://fz.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('fz')" target="_blank" >����</A>
        <A href="http://xm.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('xm')" target="_blank" >����</A>
        <A href="http://zz.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('zz')" target="_blank" >֣��</A>
        <A href="http://ly.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('ly')" target="_blank" >����</A>
        <A href="http://cc.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('cc')" target="_blank" >����</A>
        <A href="http://jn.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('jn')" target="_blank" >����</A>
        <A href="http://qd.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('qd')" target="_blank" >�ൺ</A>
        <A href="http://weihai.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('weihai')" target="_blank" >����</A>
        <A href="http://yantai.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('yantai')" target="_blank" >��̨</A>
        <A href="http://hf.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('hf')" target="_blank" >�Ϸ�</A>
        <A href="http://nn.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('nn')" target="_blank" >����</A>
        <A href="http://guilin.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('guilin')" target="_blank" >����</A>
        <A href="http://haikou.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('haikou')" target="_blank" >����</A>
        <A href="http://ty.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('ty')" target="_blank" >̫ԭ</A>
        <A href="http://yc.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('yc')" target="_blank" >����</A>
        <A href="http://lz.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('lz')" target="_blank" >����</A>
        <A href="http://xa.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('xa')" target="_blank" >����</A>
        <A href="http://xn.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('xn')" target="_blank" >����</A>
        <A href="http://wh.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('wh')" target="_blank" >�人</A>
        <A href="http://cs.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('cs')" target="_blank" >��ɳ</A>
        <A href="http://nc.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('nc')" target="_blank" >�ϲ�</A>
        <A href="http://jiujiang.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('jiujiang')" target="_blank" >�Ž�</A>
        <A href="http://km.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('km')" target="_blank" >����</A>
        <A href="http://lasa.jianzhi8.com<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" onclick="SetCookies('lasa')" target="_blank" >����</A>
        <A href="/index.html" target="_blank" >����...</A>
        			</p>	
       	</#if>			
		</div>
	</div>
<div class="nr_bq_top nr_bq_top_y">
	<h2>
    	<div class="clearfix"> 
    	<a href="/<#if currTypeId??>rc${currTypeId}/<#else>rencai/</#if>" <#if currClass==null>class="now_aa" </#if>id="tag1" style="color:#444;">ȫ��</a>
        <a href="/<#if currTypeId?? >rc${currTypeId}/</#if>rcc0/" <#if currClass=='c0'>class="now_aa" </#if>id="tag2" style="color:#444;">��ְ��ְ</a>
        <a href="/<#if currJobTypeId?? >rc${currJobTypeId}/</#if>rcc1/" <#if currClass=='c1'>class="now_aa" </#if>id="tag3" style="color:#444;">ȫְ��ְ</a>
        </div>
        <p><span>����</span> <strong>�Ա�</strong>ʱ��</p>
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
            	<#if c.ding><img src="http://css.jianzhi8.com/fenzhan/img/ding2.gif" /></#if><#if c.isYz=='1'><span class=tu>ͼ</span></#if><#if areaId =='' ><a  target="_blank" href="http://${c.cityId}.jianzhi8.com/rc${c.cityCode}/<#if c.typeCode!='' >rc${c.typeCode}/</#if>rcc${c.ctClass}/" class="titlehui"><span>${c.area!''}</span></a></#if>
            	 <br>${c.sex}<#if  c.age =='����'||c.age =='' ><#else> ${c.age}��</#if>��${c.ctContent}(${c.date?string('MM-dd')})
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
<a href="<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/" class="n">��ҳ</a>
<a href="<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/<#if bean.prePageIndex !=1 >p${bean.prePageIndex}/</#if>" class="n">&lt;��ҳ</a>
		</#if>
	<#if currTypeId?? || currJobTypeId>
		${bean.getPaper('/rc'+ currTypeId +currJobTypeId+ '/rc'+currJobDate+ currClass +'/',2,'')}
	<#else>
	${bean.getPaper('/rc'+currJobDate+ currClass +'/',2,'')}
	</#if>

		<#if bean.isnext>		
<a href="<#if currTypeId??||currJobTypeId >/rc${currTypeId}${currJobTypeId}</#if>/rc<#if currJobDate?? >${currJobDate}</#if>${currClass}/p${bean.pageIndex+1}/" class="n">��ҳ&gt;</a>
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
	<p>û���ҵ����ʵļ�������<a href="http://my.jianzhi8.com/fb.do" target="_blank">������Ƹְλ</a>�ɣ�</p>

</div>
<script>var channel_id="8219879658",minTop="3",minBot="2",afsword='${currTypeName}����  ��ְ��Ϣ   �˲�'</script>
	<script src="http://www.google.cn/jsapi" type="text/javascript"></script>
	<script type="text/javascript" charset="utf-8">google.load('ads.search', '2');</script>
	<script src="http://css.jianzhi8.com/fenzhan/ggads/afs2.js" type="text/javascript"></script>
<#include "/WEB-INF/template/foot.ftl"/>