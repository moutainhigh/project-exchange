<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset==gbk" />
	<title>������ - �ҵĲ�����ϸ</title>	
	<link href="/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/css/mian.css" rel="stylesheet" type="text/css" />
	<link href="/css/member.css" rel="stylesheet" type="text/css" />
	<script src="/js/jquery.js" type="text/javascript"></script>
	<script src="/js/member.js" type="text/javascript"></script>
	<script type="text/javascript">
	
	</script>
	<#include "/WEB-INF/template/include/msg.ftl">
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
				   		<ul><li>�ҵĲ�����ϸ<#if request.getParameter("type")==1> - ��ֵ��¼</#if><#if request.getParameter("type")==0> - ���ּ�¼</#if></li></ul>
				   </div>
				   <div class="list_box_content">
				   		<table class="task_tble" border="0" cellspacing="1">
						   <tr>
						   		<th>ʱ��</th>
						   		<th>����/����</th>
						   		<th>���</th>
						   		<th>��ע</th>
						   </tr>
						   <#list pageBean.resultList as s>
						   <tr>
						   		<td>${s.time?string('yyyy-MM-dd HH:mm:ss')}</td>
						   		<td>
						   		<#if s.type==1>����</#if>
						   		<#if s.type==0>����</#if>
						   		</td>
						   		<td>${s.money?string.currency}</td>
						   		<td>
						   			${s.content}
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