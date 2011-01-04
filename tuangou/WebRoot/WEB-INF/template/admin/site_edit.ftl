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
				<form enctype="multipart/form-data" method="post" action="${base}/admin/saveSite">
				<input type="hidden" name="site.id" value="<#if site??>${site.id!''}</#if>"/>
				<table cellspacing="0" cellpadding="0" border="0" class="modify-table">
					<thead>
						<tr><th class="mt-th" colspan="2"><strong>团购网站编辑</strong></th></tr>
					</thead>
					<tbody>
						<tr>
							<td class="mt-td-l first">网站名称：</td>
							<td class="mt-td-r first">
								<input type="text" value="" maxlength="60" size="60" class="text" name="site.name" id="siteName">
								<label><input type="radio" checked="" value="false" name="site.hasLink">未交换链接</label>
								<label><input type="radio" value="true" name="site.hasLink">已交换链接</label>
							</td>
						</tr>
						<tr>
							<td class="mt-td-l">网站类别：</td>
							<td class="mt-td-r">
								<select id="cate_id" name="site.siteType.id">
									<option value=""></option>
									<#list comList as c>
									<option value="${c.id}">${c.name}</option>
									</#list>
								</select></td>
						</tr>
						<tr>
							<td class="mt-td-l">URL：</td>
							<td class="mt-td-r">
								<input type="text" value="" class="text" name="site.url" id="url">
							</td>
						</tr>
						<tr>
							<td class="mt-td-l">城市：</td>
							<td class="mt-td-r">
								<input type="text" value="" size="10" class="text" name="site.city" id="city"><label><input type="checkbox" value="true" name="" onClick="isAll();">全国有效</label>
							</td>
						</tr>
						<tr>
							<td class="mt-td-l">联系电话：</td>
							<td class="mt-td-r">
								<input type="text" value="" size="10" class="text" name="site.tel" id="tel">
							</td>
						</tr>
						<tr>
							<td class="mt-td-l">QQ：</td>
							<td class="mt-td-r">
								<input type="text" value="" size="10" class="text" name="site.qq" id="qq">
							</td>
						</tr>
						<tr>
							<td class="mt-td-l">联系人：</td>
							<td class="mt-td-r">
								<input type="text" value="" size="10" class="text" name="site.contact" id="contact">
							</td>
						</tr>
						<tr>
							<td class="mt-td-l">排序：</td>
							<td class="mt-td-r">
								<input type="text" value="" size="10" class="text" name="site.listOrder" id="listOrder">
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
				</form>
			</div>
			<div class="clear"></div>
		</div>
	</body>
</html>