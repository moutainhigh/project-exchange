<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
	<title>${appTitle!"团购导航程序"}</title>
	<link href="${base}/admin/css/basic.css" type="text/css" rel="stylesheet" />
	<link href="${base}/admin/css/layout.css" type="text/css" rel="stylesheet" />
	<script src="${base}/js/jquery.js"></script>
	<script src="${base}/admin/js/admin.js"></script>
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
				<#include "../msg.ftl">
				<form enctype="multipart/form-data" method="post" action="${base}/admin/addAdvert">
				<input type="hidden" name="site.id" value="<#if advert??>${advert.id!''}</#if>"/>
				<table cellspacing="0" cellpadding="0" border="0" class="modify-table">
					<thead>
						<tr><th class="mt-th" colspan="2"><strong>添加新的广告</strong></th></tr>
					</thead>
					<tbody>
						<tr>
							<td class="mt-td-l first">广告标题：</td>
							<td class="mt-td-r first">
								<input type="text" value="" maxlength="60" size="60" class="text" name="advert.title" id="advertTitle">
							</td>
						</tr>
						
							<tr>
							<td class="mt-td-l">广告语：</td>
							<td class="mt-td-r">
								<input type="text" value="" maxlength="60" size="60" class="text" name="advert.words" id="advertWords">
							</td>
						</tr>
						
						<tr>
							<td class="mt-td-l">广告链接：</td>
							<td class="mt-td-r">
								<input type="text" value="" maxlength="60" size="60" class="text" name="advert.url" id="advertUrl">
							</td>
						</tr>
						
						<tr>
							<td class="mt-td-l">图片：</td>
							<td class="mt-td-r">
								<div style="height:200px;width:300px;"><iframe src="${base}/upload/upload.jsp" width="100%" height="100%" frameborder="0"></iframe></div>
								<br/>图片最佳尺寸360px*360px</td>
						</tr>
						
						<tr>
							<td class="mt-td-l">编号：</td>
							<td class="mt-td-r">
								<input type="text" value="" class="text" name="advert.orderNum" id="orderNum">
							</td>
						</tr>
						
						<tr>
							<td class="mt-td-l">&nbsp;</td>
							<td class="mt-td-r">
								<input type="hidden" value="add" name="action">
								<input type="submit" value="提 交" id="team-submit" class="formbutton">
							</td>
						</tr>
					</tbody>
				</table>
				<table cellspacing="0" cellpadding="0" border="0" class="list-table">
					<thead>
						<tr><th class="lt-th" colspan="8"><strong>已有广告</strong></th></tr>
					</thead>
					<tbody>
						<tr class="lt-title">
							<th width="30">排序编号</th>
							<th width="100">标题</th>
							<th width="100">广告语</th>
							<th width="100">链接</th>
							<th width="100">图片名</th>
							
							<th width="80" class="last">操作</th>
						</tr>
						<#if advertList??>
						<#list advertList as a>
						<tr>
							<td class="lt-td">${a.orderNum!''}</td>
							<td class="lt-td tl">${a.title!''}</td>
								<td class="lt-td tl">${a.words!''}</td>
							<td class="lt-td">${a.url!''}</td>
							<td class="lt-td">${a.img!''}</td>
							<td class="lt-td last">
								<a alt="删除" onclick="return confirm('是否真的删除吗?')" href="${base}/admin/deleteAdvert?advert.id=${a.id}">
									<img alt="删除" height="11" border="0" width="11" src="${base}/admin/images/del.jpg">
								</a>
							</td>
						</tr>	
						</#list>
						</#if>
					</tbody>
				</table>
				</form>
			</div>
			<div class="clear"></div>
		</div>
	</body>
</html>