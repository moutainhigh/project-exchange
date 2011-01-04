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
				<form enctype="multipart/form-data" method="post" action="${base}/admin/addCity">
				<input type="hidden" name="site.id" value="<#if site??>${site.id!''}</#if>"/>
				<table cellspacing="0" cellpadding="0" border="0" class="modify-table">
					<thead>
						<tr><th class="mt-th" colspan="2"><strong>添加新的城市</strong></th></tr>
					</thead>
					<tbody>
						<tr>
							<td class="mt-td-l first">城市名称：</td>
							<td class="mt-td-r first">
								<input type="text" value="" maxlength="60" size="60" class="text" name="city.name" id="cityName">
							</td>
						</tr>
						<tr>
							<td class="mt-td-l">拼音：</td>
							<td class="mt-td-r">
								<input type="text" value="" maxlength="60" size="60" class="text" name="city.pinyin" id="pinyin">
							</td>
						</tr>
						<tr>
							<td class="mt-td-l">编号：</td>
							<td class="mt-td-r">
								<input type="text" value="" class="text" name="city.orderNum" id="orderNum">
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
						<tr><th class="lt-th" colspan="8"><strong>已有城市数据</strong></th></tr>
					</thead>
					<tbody>
						<tr class="lt-title">
							<th width="120">排序编号</th>
							<th width="90">名称</th>
							<th width="191">拼音</th>
							<th width="80" class="last">操作</th>
						</tr>
						<#list cityList as c>
						<tr>
							<td class="lt-td">${c.orderNum}</td>
							<td class="lt-td tl">${c.name}</td>
							<td class="lt-td">${c.pinyin}</td>
							<td class="lt-td last">
								<a alt="删除" onclick="return confirm('是否真的删除吗?')" href="#">
									<img alt="删除" height="11" border="0" width="11" src="${base}/admin/images/del.jpg">
								</a>
							</td>
						</tr>	
						</#list>
					</tbody>
				</table>
				</form>
			</div>
			<div class="clear"></div>
		</div>
	</body>
</html>