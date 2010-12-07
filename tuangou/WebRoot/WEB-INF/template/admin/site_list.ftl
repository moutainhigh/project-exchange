<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
	<title>${appTitle!"团购导航程序"}</title>
	<link href="${base}/admin/css/basic.css" type="text/css" rel="stylesheet" />
	<link href="${base}/admin/css/layout.css" type="text/css" rel="stylesheet" />
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
				<form enctype="multipart/form-data" method="post" action="${base}/admin/publish">
				<table cellspacing="0" cellpadding="0" border="0" class="list-table">
					<thead>
						<tr><th class="lt-th" colspan="8"><strong>团拍网站管理</strong></th></tr>
					</thead>
					<tbody>
						<!--<tr>
							<td colspan="7" class="lt-td first tl">
							<form method="post" action="index.php?d=admin&amp;c=team">
							标题：<input type="text" value="" name="title" id="title">
							网站：<input type="text" value="" name="site_name" id="site_name">
							<input type="submit" value="查询">
							</form>
							</td>
						</tr>-->
						<tr class="lt-title">
							<th class="first">&nbsp;</th>
							<th width="90">网站</th>
							<th width="191">网址</th>
							<th width="120">类型</th>
							<th width="140">联系人</th>
							<th width="120">QQ</th>
							<th width="80" class="last">操作</th>
						</tr>
						<#list pageBean.resultList as t>
						<tr>
							<td class="lt-td first">
							<input type="checkbox" value="73" name="site_ids" class="site_ids">
							</td>
							<td class="lt-td tl">${t.name}</td>
							<td class="lt-td">${t.url}</td>
							<td class="lt-td">${t.siteType.name}</td>
							<td class="lt-td">${t.contact}</td>
							<td class="lt-td">${t.qq}</td>
							<td class="lt-td last">
								<a href="#">
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
									<#if !pageBean.isFirstPage><a href="javascript:gotoPage(1);">[首页]</a><#else>[首页]</#if>
									<#if !pageBean.isFirstPage><a href="javascript:gotoPage(${pageBean.prePageIndex });">[前一页]</a><#else>[前一页]</#if>
									<#if !pageBean.isLastPage><a href="javascript:gotoPage(${pageBean.nextPageIndex });">[后一页]</a><#else>[后一页]</#if>
									<#if !pageBean.isLastPage><a href="javascript:gotoPage(${pageBean.maxPage });">[尾页]</a><#else>[尾页]</#if>
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