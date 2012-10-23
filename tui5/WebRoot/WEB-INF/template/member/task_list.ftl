<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset==gbk" />
	<title>������ - ��Ա���� - �ҷ����������б�</title>	
	<link href="/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/css/mian.css" rel="stylesheet" type="text/css" />
	<link href="/css/member.css" rel="stylesheet" type="text/css" />
	<script src="/js/jquery.js" type="text/javascript"></script>
	<script src="/js/member.js" type="text/javascript"></script>
</head>
<body>
	<#include "/WEB-INF/template/include/head.ftl">
	<!-- ����������� -->
	<div id="mian">		
		<#include "/WEB-INF/template/include/member_nav.ftl">
		<!-- �������� -->
		<div class="body_content">
			<#include "/WEB-INF/template/include/member_left.ftl">
			<div class="list_body">
			    <div class="list_box">
			       <div class="list_box_title">
				   		<ul><li>�ҵ�����<#if status?exists>
				   			(<#if status==1>�ȴ�����������</#if>
				   			<#if status==2>���ڵ�����</#if>
				   			<#if status==5>����������</#if>
				   			<#if status==10>�����е�����</#if>)
				   		</#if></li></ul>
				   </div>
				   <div class="list_box_content">
					   <table class="task_tble" border="0" cellspacing="1">
						   <tr>
						   		<th>���</th>
						   		<th>����</th>
						   		<th>���</th>
						   		<th>����ʱ��</th>
						   		<th>��ʼʱ��</th>
						   		<th>����ʱ��</th>
						   		<th>״̬</th>
						   </tr>
						   <#list pageBean.resultList as t>
						   <tr>
						   		<td>${t.id}</td>
						   		<td>${t.title?html}</td>
						   		<td>��${t.money}</td>
						   		<td>${t.publishDate?string('yyyy-MM-dd')}</td>
						   		<td>${(t.startDate?string('yyyy-MM-dd'))?default('')}</td>
						   		<td>${(t.endDate?string('yyyy-MM-dd'))?default('')}</td>
						   		<td>${t.statusTxt}
						   		<#if t.status==1><a href="/member_publish.do?task.id=${t.id}">��ʽ����</a></#if>
						   		<#if t.status gt 1 && t.gjCount gt 0><a href="/gaojian_${t.id}.html">������(${t.gjCount})</a></#if>
						   		</td>
						   </tr>
						   </#list>
					   </table>
<div class="pager">
	��<strong>${pageBean.totalRow}</strong>����¼&nbsp;&nbsp;
	ÿҳ${pageBean.rowPerPage}�� &nbsp;&nbsp;
	��${pageBean.pageIndex}ҳ/��${pageBean.maxPage}ҳ&nbsp;&nbsp;
	<#if !pageBean.isFirstPage>
		<a href="javascript:gotoPage(1);">[��ҳ]</a>
	<#else>
		[��ҳ]
	</#if>
	<#if !pageBean.isFirstPage>
		<a href="javascript:gotoPage(${pageBean.prePageIndex });">[ǰһҳ]</a>
	<#else>
		[ǰһҳ]
	</#if>
	<#if !pageBean.isLastPage>
		<a href="javascript:gotoPage(${pageBean.nextPageIndex });">[��һҳ]</a>
	<#else>
		[��һҳ]
	</#if>
	<#if !pageBean.isLastPage>
		<a href="javascript:gotoPage(${pageBean.maxPage });">[βҳ]</a>
	<#else>
		[βҳ]
	</#if>	
</div>
			       </div>
			   </div>
			</div>
		</div>
		<!-- ����������� -->
		<#include "/WEB-INF/template/include/foot.ftl">
	</div>
</body>
</html>