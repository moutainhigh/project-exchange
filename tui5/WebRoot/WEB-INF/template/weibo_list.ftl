<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
	<title>������ - ΢���������</title>	
	<link href="/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/css/mian.css" rel="stylesheet" type="text/css" />
	<link href="/css/weibo.css" rel="stylesheet" type="text/css" />
	<script src="/js/jquery.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function(){
			$('.nav_botttom a:eq(2)').addClass('now_a');
		});
	</script>
</head>
<body>
	<#include "/WEB-INF/template/include/head.ftl">
	<div id="mian">		
		<#include "/WEB-INF/template/include/nav.ftl">
		<!-- �������� -->
		<div class="task_title">
			<ul>
				<li<#if !request.getParameter('wbType')?exists> class="focus"</#if>><a href="/weibo/">��������</a></li>
				<li<#if request.getParameter('wbType')==1> class="focus"</#if>><a href="/weibo/?wbType=1">��������</a></li>
				<li<#if request.getParameter('wbType')==2> class="focus"</#if>><a href="/weibo/?wbType=2">��Ѷ����</a></li>
				<li class="sort"><img src="/img/arrow2.gif"> <a href="/weibo/?sort=money">������������</a></li>
				<li class="sort"><a href="/tasklist.html" title="�����������"><font color="#FF0000"><u>���������������</u></font></a></li>
			</ul>
		</div>
		<div class="list_top">
			<ul>
				<li class="tit_li1">������</li>
				<li class="tit_li2">�������</li>
				<li class="tit_li3">���ͽ��</li>
				<li class="tit_li4">�ѷ��Ž��</li>
				<li class="tit_li5">�ϸ񽻸�����</li>
				<li class="tit_li6">����ʱ��</li>
			</ul>
		</div>
		<div class="task_list">
			<#list pageBean.resultList as t>
			<ul class="ul_list" onmouseout="this.className='ul_list';$(this).find('.plusTask').hide()" onmouseover="this.className='ul_over';$(this).find('.plusTask').show()">
				<li class="list_li1">${t.id}</li>
			    <li class="list_li2"><a href="/weibo_${t.id}.html">${t.title}</a>&nbsp;&nbsp;<span class="plusTask none"><a target="_blank" href="/member_publish.do">������������</a></span></li>
				<li class="list_li3">${t.money?string.currency}</li>
				<li class="list_li4">&nbsp;��${t.passMoney}</li>
				<li class="list_li5">&nbsp;${t.passGaojian}</li>
				<li class="list_li6">${t.leftHour}</li>
			</ul>
			</#list>
			<ul class="ul_list">
				<li class="pager">
					<#if pageBean.pageIndex gt 1><a href="/weibo/">��ҳ</a></#if>
					<#if !pageBean.isFirstPage && pageBean.pageIndex gt 1><a href="/weibo/p${pageBean.pageIndex-1}">��һҳ</a></#if>
					<#if !pageBean.isLastPage><a href="/weibo/p${pageBean.pageIndex+1}">��һҳ</a></#if>
				</li>
			</ul>
		</div>
		<!-- ����������� -->
		<#include "/WEB-INF/template/include/foot.ftl">
	</div>
</body>
</html>