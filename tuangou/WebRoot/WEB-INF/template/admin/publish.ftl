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
				<form enctype="multipart/form-data" method="post" action="${base}/admin/publish">
				<table cellspacing="0" cellpadding="0" border="0" class="modify-table">
					<thead>
						<tr><th class="mt-th" colspan="2"><strong>发布团购活动</strong></th></tr>
					</thead>
					<tbody>
						<tr>
							<td class="mt-td-l first">标题：</td>
							<td class="mt-td-r first">
								<input type="text" value="" maxlength="60" size="60" class="text" name="team.title" id="title">
												<label><input type="radio" checked="" value="false" name="team.isTop">不推荐</label>
								<label><input type="radio" value="true" name="team.isTop">推荐</label>
											</td>
						</tr>
						<tr>
							<td class="mt-td-l">所属分类：</td>
							<td class="mt-td-r">
								<select id="cate_id" name="team.cate.id">
									<option value=""></option>
									<#list comList as c>
									<option value="${c.id}">${c.name}</option>
									</#list>
								</select></td>
						</tr>
						<tr>
							<td class="mt-td-l">网站名称：</td>
							<td class="mt-td-r">
								<input type="text" value="" class="text" name="team.siteName" id="site_name">
								&nbsp;如：团拍网
							</td>
						</tr>
						<tr>
							<td class="mt-td-l">城市：</td>
							<td class="mt-td-r">
								<input type="text" value="" size="10" class="text" name="team.cityName" id="city_name">
								&nbsp;如：全国、北京、福州等。
							</td>
						</tr>
						<tr>
							<td class="mt-td-l">URL：</td>
							<td class="mt-td-r">
								<input type="text" value="" size="60" class="text" name="team.url" id="url">
								&nbsp;如：http://www.tuanpai.com/
							</td>
						</tr>
						<tr>
							<td class="mt-td-l">图片：</td>
							<td class="mt-td-r">
								<div style="height:200px;width:300px;"><iframe src="${base}/upload/upload.jsp" width="100%" height="100%" frameborder="0"></iframe></div>
								<br/>图片最佳尺寸360px*360px
							</td>
						</tr>
						<tr>
							<td style="vertical-align: top; padding-top: 12px;" class="mt-td-l">摘要：</td>
							<td class="mt-td-r">
								<textarea rows="10" name="team.summary" cols="80"></textarea>
							</td>
						</tr>
						<tr>
							<td class="mt-td-l">当前人数：</td>
							<td class="mt-td-r">
								<input type="text" value="0" maxlength="10" size="10" class="text" id="now_number" name="team.nowNumber">&nbsp;须整数
							</td>
						</tr>
						<tr>
							<td class="mt-td-l">市场价：</td>
							<td class="mt-td-r">
								 <input type="text" value="" maxlength="10" size="10" class="text" id="market_price" name="team.marketPrice">&nbsp;元
							</td>
						</tr>
						<tr>
							<td class="mt-td-l">团拍价：</td>
							<td class="mt-td-r">
								<input type="text" value="" maxlength="10" size="10" class="text" id="team_price" name="team.teamPrice">&nbsp;元
							</td>
						</tr>
						<tr>
							<td class="mt-td-l">剩余天数：</td>
							<td class="mt-td-r">
								<input type="text" value="" maxlength="10" size="10" class="text" id="leftDay" name="team.leftDay">&nbsp;须整数
							</td>
						</tr>
						<tr>
							<td class="mt-td-l">剩余小时：</td>
							<td class="mt-td-r">
								<input type="text" value="" maxlength="10" size="10" class="text" id="leftHour" name="team.leftHour">&nbsp;须整数
							</td>
						</tr>
						<tr>
							<td class="mt-td-l">剩余分钟：</td>
							<td class="mt-td-r">
								<input type="text" value="1" maxlength="10" size="10" class="text" name="leftMin" id="team.leftMin">&nbsp;须整数
							</td>
						</tr>
						<tr>
							<td class="mt-td-l">剩余秒数：</td>
							<td class="mt-td-r">
								<input type="text" value="1" maxlength="10" size="10" class="text" name="leftSec" id="team.leftSec">&nbsp;须整数
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