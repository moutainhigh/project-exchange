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
	<div class="current jz_dq_xg"><a href="#">��ְ��</a> > �������� </div>
	
<div class="nr_bq_top nr_bq_top_y">
	<table width="951" cellpadding="0" cellspacing="0" class="tb1">
		<tr align="left">
			<td width="146" class="tb_p">����</td>
			<td width="146">����ְλ</td>
			<td width="146">��ְ����</td>
			<td width="99">�Ա�</td>
			<td width="87">����</td>
			<td width="139">��ס��ַ</td>
			<td width="113">�˲�����</td>
			<td width="73">ʱ��</td>
		</tr>
		</table>
		<table width="951" cellpadding="0" cellspacing="0">
		<tr>
		<td colspan="4" id='afs_list_top' class="td_top">
      </td>
		</tr>
		</table>
		<table width="951" cellpadding="0" cellspacing="0" id="listTbl">
		<#list bean.resultList as r>
		<tr align="left";>
			<td width="143" class="tb_p"><a href="/resume/${r.userNo}.html" target="_blank">${r.userName}</a></td>
			<td width="152">${r.typeName}</td>
			<td width="149">${r.userClass}</td>
			<td width="94">${r.sex}</td>
			<td width="93">${r.age}</td>
			<td width="136">${r.area}</td>
			<td width="106">${r.shenfen}</td>
			<td width="76">${r.date?string('MM-dd')}</td>
		</tr>
		</#list>
	</table>
	<table width="951" cellpadding="0" cellspacing="0">
		<tr>
		<td colspan="4" class="td_top_left" id='afs_list_bot'></td
		</tr>
	</table>
    
    <h3 class="clearfix">
     <p id="page">
		<#if !bean.isFirstPage>
			<a href="/resume/">��ҳ</a>
			<a href="/resume/p${bean.prePageIndex}/">��ҳ</a>
		</#if>${bean.getPaper('/resume/')}
		<#if !bean.isLastPage>
			<a href="/resume/p${bean.pageIndex+1}/">��ҳ</a>
		</#if>
		</p>
    </h3>
</div>
<div class="tb_bom">
	<p>��û�м������ǿ�<a href="#">�Ǽ�һ�ݼ���</a>�ɣ�</p>
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
