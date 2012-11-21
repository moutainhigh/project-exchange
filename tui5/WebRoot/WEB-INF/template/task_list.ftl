<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
	<title>������ - �������</title>	
	<link href="/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/css/mian.css" rel="stylesheet" type="text/css" />
	<link href="/css/task_list.css" rel="stylesheet" type="text/css" />
	<script src="/js/jquery.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function(){
			$('.nav_botttom a:eq(1)').addClass('now_a');
		});
		var tpinyin = '${typepinyin}';
		function sort(s){
			if(tpinyin == '')
				self.location.href = '/tasklist.html?sort=' + s;
			else
				self.location.href = '/tasklist_'+tpinyin+'.html?sort=' + s;
		}
	</script>
</head>
<body>
	<#include "/WEB-INF/template/include/head.ftl">
	<div id="mian">		
		<#include "/WEB-INF/template/include/nav.ftl">
		<!-- �������� -->
		<div class="zw_leibie zw_leibie1">
	    	<h2 class="clearfix">
	        	<span>�������</span>
	        </h2>
	        <#list topTypeList as tt>
	        <h3>${tt.name}</h3>
	        <p>
	        	<#list tt.childs as t>
	        	<a href="/tasklist_${t.pinyin}.html" class="<#if typepinyin==t.pinyin>curr_type</#if>">${t.name}</a>
	        	</#list>
	        </p>
	        </#list>
	    </div>
	    
	    <div class="zw_leibie2 zw_leibie_zhiwei">
	    	<h2 class="clearfix">
	        	<span>�����б�</span>
	            <a href="javascript:sort('');"<#if !sort?exists> class="now_Aaa"</#if>>��������</a>
	            <a href="javascript:sort('money');"<#if sort == 'money'> class="now_Aaa"</#if>><img src="/img/arrow2.gif"/>���������</a>
	            <a href="javascript:sort('gaojianPrice');"<#if sort == 'gaojianPrice'> class="now_Aaa"</#if>><img src="/img/arrow2.gif"/>������������</a>
	            <a href="javascript:sort('gaojianMount');"<#if sort == 'gaojianMount'> class="now_Aaa"</#if>><img src="/img/arrow2.gif"/>�����������</a>
	            <a href="javascript:sort('endDate');"<#if sort == 'endDate'> class="now_Aaa"</#if>><img src="/img/arrow2.gif"/>��ʣ��ʱ������</a>
	        </h2>
	        <div class="task_list">
				<ul class="title2">
				  <li class="li1">���ID</li>
				  <li class="li2">�������</li>
				  <li class="li3">����۸�</li>
				  <li class="li5">���</li>
				  <li class="li4">��Ҫ���</li>
				  <li class="li8">�Ѻϸ���</li>
				  <li class="li6">����ʱ��</li>
				</ul>
				<#list pageBean.resultList as t>
				<ul class="ul_list" onmouseout="this.className='ul_list';$(this).find('.plusTask').hide()" onmouseover="this.className='ul_over';$(this).find('.plusTask').show()">
					<li class="li1">${t.id}</li>
				    <li class="li2"><a href="/task_${t.id}.html">${t.title}</a>&nbsp;&nbsp;<span class="plusTask none"><a target="_blank" href="/member_publish.do">������������</a></span></li>
				    <li class="li3"><#if (t.gaojianPrice)?exists>${t.gaojianPrice?string.currency}</#if></li>
					<li class="li5">${t.money?string.currency}</li>
					<li class="li4">${t.gaojianMount}</li>
					<li class="li8">${t.passGaojian}</li>
					<li class="li6">${t.leftHour}</li>
				</ul>
				</#list>
				<ul class="ul_list">
					<li class="pager">
						<#if pageBean.pageIndex gt 1><a href="/tasklist<#if typepinyin?exists>${'_'+typepinyin}</#if>.html">��ҳ</a></#if>
						<#if !pageBean.isFirstPage && pageBean.pageIndex gt 1><a href="/tasklist<#if typepinyin?exists>${'_'+typepinyin}</#if>.html?pageIndex=${pageBean.pageIndex-1}">��һҳ</a></#if>
						<#if !pageBean.isLastPage><a href="/tasklist<#if typepinyin?exists>${'_'+typepinyin}</#if>.html?pageIndex=${pageBean.pageIndex+1}">��һҳ</a></#if>
					</li>
				</ul>
			</div>
	    </div>
		<!-- ����������� -->
		<#include "/WEB-INF/template/include/foot.ftl">
	</div>
</body>
</html>