<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${city.simpleName}��ְ���� -��ְ��</title>
		<meta name="keywords" content='${city.simpleName}��ְ����' />
		<meta name="description" content="��ְ�����Ϊ���ṩ${city.simpleName}�����ļ�ְ������Ϣ,ÿ����´���${city.simpleName}��ְ������λ,��ĩ��ְ��,��������Ѳ���������ȫ��${city.simpleName}��ְ�����˲���Ϣ��" />
		<link rel="Bookmark" href="http://www.jianzhi8.com/comcity/favicon.ico" />
		<link rel="shortcut icon" href="http://www.jianzhi8.com/comcity/favicon.ico" type="image/x-icon" />
		<link href="${base}css/reset.css" rel="stylesheet" type="text/css" />
		<script src="${base}js/jquery-1.7.1.min.js"></script>
		<#include "/WEB-INF/template/js_nav.ftl"/>
		<#include "/WEB-INF/template/js_search_key.ftl"/>
	</head>

<body>
	<#include "/WEB-INF/template/head.ftl"/>
	<!--��ǰλ������-->
	<div class="current">
		<a href="http://www.jianzhi8.com/">��ְ��</a> &gt; 
		<a href="/">${city.simpleName}��ְ</a> &gt;
		<a href="/resume/${Parameters["typeId"]}">${city.simpleName}${typemap[typeId]}<#if queryTypeId?exists && queryTypeId.length()==5>${typemap[queryTypeId]}</#if>��������</a>
		<#if areaId?? && areaId!=''>
		 &gt;  <a href="/resume/${Parameters["typeId"]}a${areaId}">${areaName}<#if queryTypeId?exists && queryTypeId.length()==5>${typemap[queryTypeId]}</#if>����</a>
		</#if>
	</div>
	<div class="con_top">
		<div class="con_top_top">
			<p>ְλ��
			<a href="/resume/${Parameters["areaId"]}${Parameters["key"]}" style="color:black;font-weight:600;">ȫ��</a>
			<#list childTypeList as t>
			<a href="/resume/${t.typeCode}${Parameters["areaId"]}${Parameters["key"]}" <#if queryTypeId?? && queryTypeId==t.typeCode>class="curr_sel"</#if>>${t.typeName}</a>
			</#list>
			</p>
			<p id="areaP">����
			<a href="/resume/${Parameters["typeId"]}${Parameters["key"]}" style="color:black;font-weight:600;">ȫ��</a>
			<#list subCityList as c>
			<a href="/resume/${Parameters["typeId"]}a${c.cityCode}${Parameters["key"]}" <#if areaId?? && areaId==c.cityCode>class="curr_sel"</#if>>${c.simpleName}</a>
			</#list>
			</p>
		</div>
		<div class="con_top_bom">
			<form action="/s/" method="get">
				<input type="text" id="loc_key" name="loc_key" class="con_bk" value="������ְλ����" onblur="if(this.value==''){this.value='������ְλ����'}" onfocus="if(this.value=='������ְλ����'){this.value=''}"/><input type="button" class="con_ss" id="" name=" " value="����" onclick="doLocSearch('����');"/>
				<span>���ţ�
				<#list words as w>
				<a href="/resume/s${(w+'��ְ')?url}">${w}</a>
				</#list>
				</span>
			</form>
		</div>
	</div>

<div class="nr_bq_bg">
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
			<td class="tb_p"><p>
			<a href="#">�Ż���</a><a href="#">������</a> | <a href="#">51Faili.com</a><span class="te_nr"><a href="#">�����׼�����������վ</a><a href="#">�·��ֽ�200��</a><a href="#">������������</a><a href="#">�����ﷵ�ֽ�ߴ�50%</a></span><strong class="te_nn"><a href="#">����������</a></strong></p>
			</td>
		</tr>
		<tr>
			<td class="tb_p">
			<a href="#">��������</a><a href="#">��ҳ��ƹ�˾</a><a href="#">www.72en.com</a><span class="te_nr"><a href="#">רҵ�ṩ��ҳ��ƹ�˾�ȷ��񶥼����վ������ƣ��۸��Żݣ�</a></span>
			</td>
		</tr>
		</table>
		<table width="951" cellpadding="0" cellspacing="0">
		<#list bean.resultList as r>
		<tr align="left";>
			<td width="143" class="tb_p"><a href="/b${r.userNo}.html" target="_blank">${r.userName}</a></td>
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
		<td class="tb_p"><p>
			<a href="#">�Ż���</a><a href="#">������</a> | <a href="#">51Faili.com</a><span class="te_nr"><a href="#">�����׼�����������վ</a><a href="#">�·��ֽ�200��</a><a href="#">������������</a><a href="#">�����ﷵ�ֽ�ߴ�50%</a></span><strong class="te_nn"><a href="#">����������</a></strong></p>
			</td>
		</tr>
		<tr>
			<td class="tb_p">
			<a href="#">��������</a><a href="#">��ҳ��ƹ�˾</a><a href="#">www.72en.com</a><span class="te_nr"><a href="#">רҵ�ṩ��ҳ��ƹ�˾�ȷ��񶥼����վ������ƣ��۸��Żݣ�</a></span>
			</td>
		</tr>
		
		</table>

		<div class="con_fy">
		������<font color="red"> ${bean.totalRow }</font> ���� ��${bean.pageIndex }/${bean.maxPage } ҳ�� &nbsp;
		<#if !bean.isFirstPage>
			<a href="/resume/${Parameters["typeId"]}${Parameters["areaId"]}p1${Parameters["key"]}">��ҳ</a>
			<a href="/resume/${Parameters["typeId"]}${Parameters["areaId"]}p${bean.prePageIndex}${Parameters["key"]}">��ҳ</a>
		</#if>
		${bean.getPaper('/resume/' + Parameters["typeId"] + Parameters["areaId"],Parameters["key"])}
		<#if !bean.isLastPage>
			<a href="/resume/${Parameters["typeId"]}${Parameters["areaId"]}p${bean.maxPage}${Parameters["key"]}">${bean.maxPage}</a>
			<a href="/resume/${Parameters["typeId"]}${Parameters["areaId"]}p${bean.nextPageIndex}${Parameters["key"]}">��ҳ</a>
		</#if>
		</div>
<div class="clear"></div>
</div>
<div class="tb_bom">
	<p>��û�м������ǿ�<a href="http://my.jianzhi8.com" target="_blank">�Ǽ�һ�ݼ���</a>�ɣ�</p>
</div>
<div class="friendly_link">
	<div class="type_list">
	<p><span>${city.simpleName}����������</span>
	<#list typeList as t>
	<a href="/resume/${t.typeCode}">${city.simpleName}${typemap[t.typeCode]}����</a>
	</#list>
	</p>
	</div>
	<div class="brother_city_list">
	<p><span>�ܱ�${typemap[queryTypeId]}������</span>
	<#list brotherCityList as c>
	<a href="http://${c.cityId}.jianzhi8.com/resume/">${c.simpleName}����</a>
	</#list>
	</p>
	</div>
</div>
	<#include "/WEB-INF/template/foot.ftl"/>
