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
                <li><A href="/rencai/">������ְ</A></li>
                <li><A href="/resume/" class="now_a">��������</A></li>
                <li><A href="/qiuzhizhidao/">��ְָ��</A></li>
                <li><A href="/biyezhidao/">��ҵָ��</A></li>
                <li style="background:none;"><A href="/zph/">��Ƹ��</A></li>
            </ul>
        </div>
    </div>
	<!--��ǰλ������-->
	<div class="current jz_dq_xg"><a href="http://www.jianzhi8.com/">��ְ��</a> > �������� </div>
<div class="nr_bq_bg">
	<table width="951" cellpadding="0" cellspacing="0" class="tb1">
		<tr align="left">
			<td width="143" class="tb_p">����</td>
			<td width="200">����ְλ</td>
			<td width="80">��ְ����</td>
			<td width="94">�Ա�</td>
			<td width="93">����</td>
			<td width="139">��ס��ַ</td>
			<td width="113">�˲�����</td>
			<td width="73">ʱ��</td>
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
			<#if r.userfilename !='face.gif' && r.userfilename!=''><span class=tu>ͼ</span></#if>
			</td>
			<td width="200">${r.typeName}</td>
			<td width="80"><#if r.userClass=="0">��ְ<#else>ȫְ</#if></td>
			<td width="94">${r.sex}</td>
			<td width="93"><#if r.age==""||r.age="����">����<#else>${r.age}��</#if></td>
			<td width="136"><#if r.cityName=="">δ��д <#else>${r.cityName} </#if></td>
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
			<a href="/resume/" class="n">��ҳ</a>
			<a href="/resume/p${bean.prePageIndex}/" class="n">��ҳ</a>
		</#if>${bean.getPaper('/resume/')}
		<#if !bean.isLastPage>
			<a href="/resume/p${bean.pageIndex+1}/" class="n">��ҳ</a>
		</#if>
		</p>
    </h3>
</div>
<div class="tb_bom">
	<p>��û�м������ǿ�<a href="#">�Ǽ�һ�ݼ���</a>�ɣ�</p>
</div>
<script>var channel_id="8219879658",minTop="3",minBot="2",afsword='${currTypeName}���˼���   �˲���Ƹ'</script>
	<script src="http://www.google.cn/jsapi" type="text/javascript"></script>
	<script type="text/javascript" charset="utf-8">google.load('ads.search', '2');</script>
	<script src="http://css.jianzhi8.com/fenzhan/ggads/afs2.js" type="text/javascript"></script>
<#include "/WEB-INF/template/foot.ftl"/>
