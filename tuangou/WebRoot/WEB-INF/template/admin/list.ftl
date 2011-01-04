<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
	<title>${appTitle!"团购导航程序"}</title>
	<link href="${base}/admin/css/basic.css" type="text/css" rel="stylesheet" />
	<link href="${base}/admin/css/layout.css" type="text/css" rel="stylesheet" />
	<script src="${base}/js/jquery.js"></script>
	<script src="${base}/admin/js/admin.js"></script>
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
						<tr><th class="lt-th" colspan="8"><strong>团拍活动管理</strong></th></tr>
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
							<th class="first">
							</th>
							<th width="">团拍标题及分类</th>
							<th width="">网站</th>
							<th width="">市场价(¥)</th>
							<th width="">团拍价(¥)</th>
							<th width="">发布时间</th>
							<th width="">到期时间</th>
							<th width="" class="last">操作</th>
						</tr>
						<#list pageBean.resultList as t>
						<tr>
							<td class="lt-td first">
							<input type="checkbox" value="73" name="team_ids" class="team_ids">
							</td>
							<td class="lt-td tl">
							[${t.cate.name}]<a target="_blank" href="#">${t.title}</a>
							</td>
							<td class="lt-td">${t.siteName!""}</td>
							<td class="lt-td">¥${t.marketPrice!""}</td>
							<td class="lt-td">¥${t.teamPrice!""}</td>
							<td class="lt-td">${t.createTime?string("yyyy-MM-dd HH-mm-ss")}</td>
							<td class="lt-td">${t.endTime?string("yyyy-MM-dd HH-mm-ss")}</td>
							<td class="lt-td last"><!--
								<a href="index.php?d=admin&amp;c=team&amp;m=edit&amp;id=73">
									<img height="14" border="0" width="14" alt="修改" src="templates/waituan/images/edit.jpg">
								</a>&nbsp;&nbsp;-->
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