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
				<form enctype="multipart/form-data" method="post" action="${base}/admin/saveNews">
				<input type="hidden" name="news.id" value="<#if news??>${news.id!''}</#if>"/>
				<table cellspacing="0" cellpadding="0" border="0" class="modify-table">
					<thead>
						<tr><th class="mt-th" colspan="2"><strong>评论信息回复</strong></th></tr>
					</thead>
					<tbody>
						<tr>
							<td class="mt-td-l first">用户名：</td>
							<td class="mt-td-r first">
								<input type="text" value="<#if news??>${news.title!''}</#if>" maxlength="60" size="60" class="text" name="news.title" id="newsTitle">
								
							</td>
						</tr>
						<tr>
							<td class="mt-td-l">团购信息标题：</td>
							<td class="mt-td-r">
								<input type="text" value="" class="text" name="news.url" id="newsUrl" value="<#if news??>${news.url!''}</#if>">
							</td>
						</tr>
				
						
					
						<tr>
							<td class="mt-td-l">评论内容：</td>
							<td class="mt-td-r">
								<textarea rows="10" name="news.content" cols="80" value="<#if news??>${news.content!''}</#if>"></textarea>
							</td>
						</tr>
						<tr>
							<td class="mt-td-l">回复内容：</td>
							<td class="mt-td-r">
								<textarea rows="10" name="news.content" cols="80" value="<#if news??>${news.content!''}</#if>"></textarea>
							</td>
						</tr>
						<tr>
							<td class="mt-td-l">&nbsp;</td>
							<td class="mt-td-r">
								<input type="hidden" value="add" name="action">
								<input type="submit" value="提 交" id="news-submit" class="formbutton">
							</td>
						</tr>
					</tbody>
				</table>
				</form>
			</div>
			<div class="clear"></div>
		</div>
	</body>
</html>