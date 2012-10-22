<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset==gbk" />
	<title>推我网 - 会员中心</title>	
	<link href="/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/css/mian.css" rel="stylesheet" type="text/css" />
	<link href="/css/member.css" rel="stylesheet" type="text/css" />
	<script src="/js/jquery.js" type="text/javascript"></script>
	<script src="/js/member.js" type="text/javascript"></script>
</head>
<body>
	<#include "/WEB-INF/template/include/head.ftl">
	<!-- 顶部区域结束 -->
	<div id="mian">		
		<#include "/WEB-INF/template/include/member_nav.ftl">
		<!-- 内容区域 -->
		<div class="body_content">
			<#include "/WEB-INF/template/include/member_left.ftl">
			<div class="list_body">
			    <div class="list_box">
			       <div class="list_box_title">
				   		<ul><li>我参与的任务</li></ul>
				   </div>
				   <div class="list_box_content">
					   <table class="task_tble" border="0" cellspacing="1">
						   <tr>
						   		<th>金额</th>
						   		<th>名称</th>
						   		<th>状态</th>
						   		<th>投稿</th>
						   </tr>
						   <#list pageBean.resultList as t>
						   <tr>
						   		<td>￥${t.money}</td>
						   		<td>[${t.id}]${t.title?html}</td>
						   		<td>${t.statusTxt}</td>
						   		<td>
						   			<a href="/task_${t.id}.html" target="_blank">查看</a>
						   			<a href="/member_submitGaojian.do?task.id=${t.id}">投稿</a>
						   		</td>
						   </tr>
						   </#list>
					   </table>
<div class="pager">
	共<strong>${pageBean.totalRow}</strong>条记录&nbsp;&nbsp;
	每页${pageBean.rowPerPage}条 &nbsp;&nbsp;
	第${pageBean.pageIndex}页/共${pageBean.maxPage}页&nbsp;&nbsp;
	<#if !pageBean.isFirstPage>
		<a href="javascript:gotoPage(1);">[首页]</a>
	<#else>
		[首页]
	</#if>
	<#if !pageBean.isFirstPage>
		<a href="javascript:gotoPage(${pageBean.prePageIndex });">[前一页]</a>
	<#else>
		[前一页]
	</#if>
	<#if !pageBean.isLastPage>
		<a href="javascript:gotoPage(${pageBean.nextPageIndex });">[后一页]</a>
	<#else>
		[后一页]
	</#if>
	<#if !pageBean.isLastPage>
		<a href="javascript:gotoPage(${pageBean.maxPage });">[尾页]</a>
	<#else>
		[尾页]
	</#if>	
</div>
			       </div>
			   </div>
			</div>
		</div>
		<!-- 内容区域结束 -->
		<#include "/WEB-INF/template/include/foot.ftl">
	</div>
</body>
</html>