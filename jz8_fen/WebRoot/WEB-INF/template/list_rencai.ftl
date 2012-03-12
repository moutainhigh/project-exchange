<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${city.simpleName}������ְ���� -��ְ��</title>
		<meta name="keywords" content='${city.simpleName}������ְ����' />
		<meta name="description" content="��ְ�����Ϊ���ṩ${city.simpleName}�����ĸ�����ְ������Ϣ,ÿ����´���${city.simpleName}������ְ������Ѷ��Ϣ,��ְ�˲ż�����ȫְ�˲ż�����,��������Ѳ���������ȫ��${city.simpleName}������ְ������Ϣ��" />
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
		<a href="/rencai/${Parameters["typeId"]}">${city.simpleName}������ְ${typemap[typeId]}<#if queryTypeId?exists && queryTypeId.length()==5>${typemap[queryTypeId]}</#if></a>
		<#if areaId?? && areaId!=''>
		 &gt;  <a href="/rencai/${Parameters["typeId"]}a${areaId}">${areaName}������ְ<#if queryTypeId?exists && queryTypeId.length()==5>${typemap[queryTypeId]}</#if></a>
		</#if>
		
	</div>
	
	<div class="con_top">
		<div class="con_top_top">
			<p>ְλ��
			<a href="/rencai/${Parameters["areaId"]}${Parameters["jobdate"]}${Parameters["key"]}" style="color:black;font-weight:600;">ȫ��</a>
			<#list childTypeList as t>
			<a href="/rencai/${t.typeCode}${Parameters["areaId"]}${Parameters["jobdate"]}${Parameters["key"]}" <#if queryTypeId?? && queryTypeId==t.typeCode>class="curr_sel"</#if>>${t.typeName}</a>
			</#list>
			</p>
			<p id="areaP">����
			<a href="/rencai/${Parameters["typeId"]}${Parameters["jobdate"]}${Parameters["key"]}" style="color:black;font-weight:600;">ȫ��</a>
			<#list subCityList as c>
			<a href="/rencai/${Parameters["typeId"]}a${c.cityCode}${Parameters["jobdate"]}${Parameters["key"]}" <#if areaId?? && areaId==c.cityCode>class="curr_sel"</#if>>${c.simpleName}</a>
			</#list>
			</p>
			<#if Parameters["ctClass"]!='c1'>
			<p>ʱ�䣺
			<a href="/rencai/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["key"]}" style="color:black;font-weight:600;">ȫ��</a>
			<#list jobdatemap.keySet() as k>
			<a href="/rencai/${Parameters["typeId"]}${Parameters["areaId"]}d${k}${Parameters["key"]}" <#if jobdate?? && jobdate==k>class="curr_sel"</#if>>${jobdatemap.get(k)}</a>
			</#list>
			</p>
			</#if>
		</div>
		<div class="con_top_bom">
			<form action="/s/" method="get">
				<input type="text" id="loc_key" name="loc_key" class="con_bk" value="������ְλ����" onblur="if(this.value==''){this.value='������ְλ����'}" onfocus="if(this.value=='������ְλ����'){this.value=''}"/><input type="button" class="con_ss" id="" name=" " value="����" onclick="doLocSearch('��ְ');"/>
				<span>���ţ�
				<#list words as w>
				<a href="/rencai/s${(w+'��ְ')?url}">${w}</a>
				</#list>
				</span>
			</form>
		</div>
	</div>

<div class="nr_bq_top nr_bq_top_y">
	<h2>
    	<div class="clearfix"> 
    	<a href="/rencai/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["jobdate"]}${Parameters["key"]}" <#if Parameters["ctClass"]==''>class="now_aa" </#if>id="tag1" style="color:#444;">ȫ��</a>
        <a href="/rencai/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["jobdate"]}c0${Parameters["key"]}" <#if Parameters["ctClass"]=='c0'>class="now_aa" </#if>id="tag2" style="color:#444;">��ְ��ְ</a>
        <a href="/rencai/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["jobdate"]}c1${Parameters["key"]}" <#if Parameters["ctClass"]=='c1'>class="now_aa" </#if>id="tag3" style="color:#444;">ȫְ��ְ</a>
        </div>
        <p><a href="http://my.jianzhi8.com/fb.do" target="_blank">������ְ��Ϣ�����������㡣</a></p>
    </h2>
    <table id="con1">
    	<tbody>
        	<tr>
            	<td colspan="3" class="td_top_left"><A href="#">�Ż��� ������ | 51FanLi.com</A>�����׼�����������վ �·��ֽ�200�� ������������ ���ﷵ�ֽ�ߴ�50%  </td>
                <td class="td_4"><A href="#">����������</A></td>
            </tr>
            <tr>
            	<td colspan="4" class="td_top"><a href="#">�������� ��ҳ��ƹ�˾ www.72en.com</a>רҵ�ṩ��ҳ��ƹ�˾�ȷ��񶥼����վ�������,�۸��Ż�!</td>
            </tr>
            <#list bean.resultList as c>
            <tr>
            	<td class="td_1"><a href="/a${c.ctNo}.html" target="_blank">${c.title}</a><span>${c.area!''}</span></td>
                <td class="td_2">${c.age}</td>
                <td class="td_3">${c.sex}</td>
                <td class="td_4">${c.date?string('MM-dd')}</td>
            </tr>
            </#list>
            <tr>
            	<td colspan="3" class="td_top_left"><A href="#">�Ż��� ������ | 51FanLi.com</A>�����׼�����������վ �·��ֽ�200�� ������������ ���ﷵ�ֽ�ߴ�50%  </td>
                <td class="td_4"><A href="#">����������</A></td>
            </tr>
            <tr>
            	<td colspan="4" class="td_top"><a href="#">�������� ��ҳ��ƹ�˾ www.72en.com</a>רҵ�ṩ��ҳ��ƹ�˾�ȷ��񶥼����վ�������,�۸��Ż�!</td>
            </tr>
        </tbody>
    </table>
    <h3 class="clearfix">
                   ������<font color="red"> ${bean.totalRow }</font> ���� ��${bean.pageIndex }/${bean.maxPage } ҳ�� &nbsp;
		<#if !bean.isFirstPage>
			<a href="/rencai/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["jobdate"]}${Parameters["ctClass"]}p1">��ҳ</a>
			<a href="/rencai/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["jobdate"]}${Parameters["ctClass"]}p${bean.prePageIndex}">��ҳ</a>
		</#if>
		${bean.getPaper('/rencai/' + Parameters["typeId"] + Parameters["areaId"] + Parameters["jobdate"] + Parameters["ctClass"], Parameters["key"])}
		<#if !bean.isLastPage>
			<a href="/rencai/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["jobdate"]}${Parameters["ctClass"]}p${bean.maxPage}">${bean.maxPage}</a>
			<a href="/rencai/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["jobdate"]}${Parameters["ctClass"]}p${bean.nextPageIndex}">��ҳ</a>
		</#if>
    </h3>
</div>
<div class="friendly_link">
	<div class="type_list">
	<p><span>${city.simpleName}������ְ��</span>
	<#list typeList as t>
	<a href="/rencai/${t.typeCode}">${city.simpleName}${typemap[t.typeCode]}��ְ</a>
	</#list>
	</p>
	</div>
	<div class="brother_city_list">
	<p><span>�ܱ�${typemap[queryTypeId]}��ְ��</span>
	<#list brotherCityList as c>
	<a href="http://${c.cityId}.jianzhi8.com/rencai/">${c.simpleName}��ְ</a>
	</#list>
	</p>
	</div>
</div>
	<#include "/WEB-INF/template/foot.ftl"/>
