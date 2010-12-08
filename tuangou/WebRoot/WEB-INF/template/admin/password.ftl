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
				<form enctype="multipart/form-data" method="post" action="${base}/admin/password">
				<input type="hidden" name="site.id" value="<#if site??>${site.id!''}</#if>"/>
				<table cellspacing="0" cellpadding="0" border="0" class="modify-table">
					<thead>
						<tr><th class="mt-th" colspan="2"><strong>密码修改</strong></th></tr>
					</thead>
					<tbody>
						 <tr>
						   <td class="mt-td-l first" align="right" width="17%">原始密码：</td>
						   <td class="mt-td-r first" class="manager-t"><input type="password" id="oldpassword" name="oldpassword"> 
						   </td>
						 </tr>
						 <tr>
						    <td class="mt-td-l first" align="right" width="17%">输入新密码：</td>
						    <td class="mt-td-r first"><input type="password" id="newpassword" name="newpassword">
							</td>
						</tr>
						 <tr>
						    <td class="mt-td-l first" align="right">再次输入新密码：</td>
						    <td class="mt-td-r first"><input type="password" id="renewpassword" name="renewpassword"></td>
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