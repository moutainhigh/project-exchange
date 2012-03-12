<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${city.simpleName}��Ƹ��</title>
		<meta name="keywords" content="${city.simpleName}��Ƹ��" />
		<meta name="description" content="${city.simpleName}��Ƹ���Ǽ�ְ�����Ϊ���ṩ${city.simpleName}������ȫְ�˲���Ϣ��վ��,������ѿ��ٵķ���${city.simpleName}��Ƹְλ�������ְ������Ѱ�����${city.simpleName}��Ƹ��Ϣ��" />
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
		<a href="/job/${Parameters["typeId"]}">${city.simpleName}��Ƹ${jobtypemap[typeId]}<#if queryTypeId?exists && queryTypeId.length()==5>${jobtypemap[queryTypeId]}</#if></a>
		<#if areaId?? && areaId!=''>
		 &gt;  <a href="/job/${Parameters["typeId"]}a${areaId}">${areaName}<#if queryTypeId?exists && queryTypeId.length()==5>${jobtypemap[queryTypeId]}</#if></a>
		</#if>
	</div>
	
	<div class="con_top">
		<div class="con_top_top">
			<p>ְλ��
			<a href="/job/${Parameters["areaId"]}${Parameters["key"]}" style="color:black;font-weight:600;">ȫ��</a>
			<#list childTypeList as t>
			<a href="/job/${t.typeCode}${Parameters["areaId"]}${Parameters["key"]}" <#if queryTypeId?? && queryTypeId==t.typeCode>class="curr_sel"</#if>>${t.typeName}</a>
			</#list>
			</p>
			<p id="areaP">����
			<a href="/job/${Parameters["typeId"]}${Parameters["key"]}" style="color:black;font-weight:600;">ȫ��</a>
			<#list subCityList as c>
			<a href="/job/${Parameters["typeId"]}a${c.cityCode}${Parameters["key"]}" <#if areaId?? && areaId==c.cityCode>class="curr_sel"</#if>>${c.simpleName}</a>
			</#list>
			</p>
		</div>
		<div class="con_top_bom">
			<form action="/s/" method="get">
				<input type="text" id="loc_key" name="loc_key" class="con_bk" value="������ְλ����" onblur="if(this.value==''){this.value='������ְλ����'}" onfocus="if(this.value=='������ְλ����'){this.value=''}"/><input type="button" class="con_ss" id="" name=" " value="����" onclick="doLocSearch('ȫְ');"/>
				<span>���ţ�
				<#list words as w>
				<a href="/job/s${(w+'��ְ')?url}">${w}</a>
				</#list>
				</span>
			</form>
		</div>
	</div>

<div class="nr_bq_top nr_bq_top_y">
	<h2>
    	<div class="clearfix"> 
    	<a href="/job/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["key"]}" <#if Parameters["unitype"]==''>class="now_aa" </#if>id="tag1" style="color:#444;">ȫ��</a>
        <a href="/job/${Parameters["typeId"]}${Parameters["areaId"]}t1${Parameters["key"]}" <#if Parameters["unitype"]=='t1'>class="now_aa" </#if>id="tag2" style="color:#444;">��˾ֱ��</a>
        <a href="/job/${Parameters["typeId"]}${Parameters["areaId"]}t2${Parameters["key"]}" <#if Parameters["unitype"]=='t2'>class="now_aa" </#if>id="tag3" style="color:#444;">ְ����Ƹ</a>
        <a href="/job/${Parameters["typeId"]}${Parameters["areaId"]}t3${Parameters["key"]}" <#if Parameters["unitype"]=='t3'>class="now_aa" </#if>id="tag4" style="color:#444;">��֤��ҵ</a>
        </div>
        <p><input type="button" value="������Ƹ" class="diyi_btn" onclick="self.location.href='http://my.jianzhi8.com/fb.do'"/><input type="button" value="�ǼǼ���" onclick="self.location.href='http://my.jianzhi8.com/fb.do'"/></p>
    </h2>
    <table id="con1">
    	<tbody>
        	<tr>
            	<td colspan="3" class="td_top_left"><A href="#">�Ż��� ������ | 51FanLi.com</A></td>
                <td class="td_4"><A href="#">����������</A></td>
            </tr>
            <tr>
            	<td colspan="4" class="td_top"><a href="#">�������� ��ҳ��ƹ�˾ www.72en.com</a>רҵ�ṩ��ҳ��ƹ�˾�ȷ��񶥼����վ�������,�۸��Ż�!</td>
            </tr>
            <#list bean.resultList as c>
            <tr>
            	<td class="td_1"><a href="/a${c.ctNo}.html" target="_blank">${c.title}</a><span>${c.area!''}</span><#if c.ding><b><img src="${base}img/lb_r6_c4.jpg" /></b></#if></td>
                <td class="td_2"><a href="/a${c.ctNo}.html" target="_blank">${c.companyName}</a><#if c.isYz=='1'><span><img src="${base}img/lb_r7_c7.jpg" /></span></#if></td>
                <td class="td_3">${c.salary}</td>
                <td class="td_4">${c.date?string('MM-dd')}</td>
            </tr>
            </#list>
            <tr>
            	<td colspan="3" class="td_top_left"><A href="#">�Ż��� ������ | 51FanLi.com</A></td>
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
			<a href="/job/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["unitype"]}p1${Parameters["key"]}">��ҳ</a>
			<a href="/job/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["unitype"]}p${bean.prePageIndex}${Parameters["key"]}">��ҳ</a>
		</#if>
		${bean.getPaper('/job/' + Parameters["typeId"] + Parameters["areaId"] + Parameters["unitype"],Parameters["key"])}
		<#if !bean.isLastPage>
			<a href="/job/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["unitype"]}p${bean.maxPage}${Parameters["key"]}">${bean.maxPage}</a>
			<a href="/job/${Parameters["typeId"]}${Parameters["areaId"]}${Parameters["unitype"]}p${bean.nextPageIndex}${Parameters["key"]}">��ҳ</a>
		</#if>
    </h3>
</div>
<div class="friendly_link">
	<div class="type_list">
	<p><span>${city.simpleName}������Ƹ��</span>
	<#list typeList as t>
	<a href="/job/${t.typeCode}">${city.simpleName}${jobtypemap[t.typeCode]}��Ƹ</a>
	</#list>
	</p>
	</div>
	<div class="brother_city_list">
	<p><span>�ܱ�${typemap[queryTypeId]}��Ƹ��</span>
	<#list brotherCityList as c>
	<a href="http://${c.cityId}.jianzhi8.com/job/">${c.simpleName}��Ƹ</a>
	</#list>
	</p>
	</div>
</div>
	<#include "/WEB-INF/template/foot.ftl"/>
