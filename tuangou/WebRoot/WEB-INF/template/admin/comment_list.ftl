<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
	<title>${appTitle!"团购导航程序"}</title>
	<link href="${base}/admin/css/basic.css" type="text/css" rel="stylesheet" />
	<link href="${base}/admin/css/layout.css" type="text/css" rel="stylesheet" />
	<script src="${base}/js/jquery.js"></script>
	<script src="${base}/admin/js/admin.js"></script>
	<script src="${base}/js/common.js"></script>
	<script type="text/javascript">
		var msg = '${msg?default("")}';
		if(msg != ''){
			alert(msg);
		}
		function checkAll(obj){
			if($(obj).attr('checked')){
				$('input[type="checkbox"]').attr('checked',true);
			}else{
				$('input[type="checkbox"]').attr('checked',false);
			}
		}
		function deleteInfo(){
			if(confirm('您确定删除吗？') && $('input:checked').length>0){
				document.forms[0].action = '${base}/admin/deleteNews';
				document.forms[0].submit();
			}
		}
	</script>
</head>
	<body>
		<div class="header">
			<h2>网购导航网站后台管理</h2>
			<img src="${base}/admin/images/b2.jpg"/>
			<div class="clear"></div>
		</div>
		<div class="wrapper">
			<#include "left.ftl">
			<div class="right">
				<form enctype="multipart/form-data" method="post" action="${base}/admin/deleteSites">
				<table cellspacing="0" cellpadding="0" border="0" class="list-table">
					<thead>
						<tr><th class="lt-th" colspan="8"><strong>新闻信息管理</strong></th></tr>
					</thead>
					<tbody>
						<tr class="lt-title">
							<th class="first">&nbsp;</th>
							<th width="190">用户名</th>
							<th width="191">团购信息</th>
							<th width="90">评论内容</th>
							<th width="140">时间</th>
						
							<th width="80" class="last">操作</th>
						</tr>
						<#list pageBean.resultList as c>
						<tr>
							<td class="lt-td first">
							<input type="checkbox" value="${c.id}" name="site_ids" class="site_ids">
							</td>
							<td class="lt-td tl">${c.userName!""}</td>
							<#if c.team??>
								<a  href="${base}/page.htm?team.id=${c.team.id}" title="${c.team.shortTitle!""}" target="_blank" >
							 </a>
							 <#else>
							<td class="lt-td">${c.team.shortTitle!""}</td>
							</#if>
							<td class="lt-td">${c.team.shortTitle!""}</td>
							<td class="lt-td">${c.shortContent!""}</td>
							<td class="lt-td">${c.lastModifyDate!""}</td>
						
							<td class="lt-td last">
								<a href="${base}/admin/replyComment?news.id=${c.id}">
									<img height="14" border="0" width="14" alt="修改" src="${base}/admin/images/edit.jpg">
								</a>&nbsp;&nbsp;
								<a alt="删除" onclick="return confirm('是否真的删除吗?')" href="#">
									<img alt="删除" height="11" border="0" width="11" src="${base}/admin/images/del.jpg">
								</a>
							</td>
						</tr>	
						</#list>
					</tbody>
					<tfoot>
						<tr>
							<td class="pages" colspan="8">
								<input type="checkbox" onclick="checkAll(this);">全选/反选&nbsp;&nbsp;
								<span style="display:block;float:left;font-weight: bold;">
									<a href="javascript:deleteInfo();">删除</a>|
									<a href="javascript:location.reload();">刷新</a>
								</span>
								<span style="display:block;float:right;">
									<font color="blue">${pageBean.pageIndex }</font>/${pageBean.maxPage }&nbsp;
									每页${pageBean.rowPerPage }条&nbsp;
									共${pageBean.totalRow }条&nbsp;
									<#if !pageBean.isFirstPage><a href="javascript:gotoPage(1,'${base}/admin/commentList.htm');">[首页]</a><#else>[首页]</#if>
									<#if !pageBean.isFirstPage><a href="javascript:gotoPage(${pageBean.prePageIndex },'${base}/admin/commentList.htm');">[前一页]</a><#else>[前一页]</#if>
									<#if !pageBean.isLastPage><a href="javascript:gotoPage(${pageBean.nextPageIndex },'${base}/admin/commentList.htm');">[后一页]</a><#else>[后一页]</#if>
									<#if !pageBean.isLastPage><a href="javascript:gotoPage(${pageBean.maxPage },'${base}/admin/commentList.htm');">[尾页]</a><#else>[尾页]</#if>
								</span>
							</td>
						</tr>
					</tfoot>
				</table>
				</form>
			</div>
			<div class="clear"></div>
		</div>
	</body>
</html>