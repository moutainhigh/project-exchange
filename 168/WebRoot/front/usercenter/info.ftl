<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<#include "/front/head.ftl"/>
		<link href="${base}/front/Themes/usercenter.css" rel="stylesheet" type="text/css" />
		<!--<script type="text/javascript" src="${base}/front/js/reg.js"></script>-->
	</head>

	<body>
		<#include "/front/top.ftl">
		<div class="all">

			<div id="postion">
				您的位置：
				<a title="88客网" href="/">88客网</a> &gt;&gt; 用户管理中心
			</div>

			<div class="all-k">
				<!--left-->
				<div class="manager-l">
					<ul>
						<li>
							<a href="http://www.88ke.com/manager/">管理中心</a>
						</li>
					</ul>
					<ul>
						<li class="manager-hover">
							我发布的信息
						</li>
					</ul>
					<ul>
						<li>
							<a href="http://www.88ke.com/info_password/">修改密码</a>
						</li>
					</ul>
					<ul>
						<li>
							<a href="/logout/">安全退出</a>
						</li>
					</ul>

				</div>
				<!--/left-->
				<!--right-->
				<div class="manager-r">
					<div>
						<span><a target="_blank" href="http://www.88ke.com/select/">+ 免费发布信息</a>
						</span> 欢迎
						<font id="loginname">${userObj.email!userObj.loginName}</font>的光临:
					</div>

					<table cellspacing="0" cellpadding="0" border="0" width="730" class="list-name">
						<tbody>
							<tr>
								<td width="150" style="font-size: 14px; color: rgb(255, 255, 255);">
									我发布的信息
								</td>
								<td bgcolor="#ffffff" width="570" style="font-size: 12px; color: rgb(51, 51, 51); font-weight: normal; text-align: left; border-top: medium none; padding-left: 10px;">
									* 如要修改已发布信息，则需删除原始信息，重新发布！
								</td>
							</tr>
						</tbody>
					</table>

					<form style="margin: 0pt;" method="post" id="form1" name="form1" action="">
						<table cellspacing="0" cellpadding="0" border="0" width="730">
							<tbody>
								<tr>
									<td bgcolor="#eeeeee" align="center" width="5%" style="border-top: 1px solid rgb(0, 94, 188);">
										&nbsp;
									</td>
									<td bgcolor="#eeeeee" width="51%" style="border-top: 1px solid rgb(0, 94, 188); font-weight: bold;">
										信息标题
									</td>
									<td bgcolor="#eeeeee" width="10%" style="border-top: 1px solid rgb(0, 94, 188); font-weight: bold;">
										通过状态
									</td>
									<td bgcolor="#eeeeee" width="10%" style="border-top: 1px solid rgb(0, 94, 188); font-weight: bold;">
										状态
									</td>
									<td bgcolor="#eeeeee" width="14%" style="border-top: 1px solid rgb(0, 94, 188); font-weight: bold;">
										日期
									</td>
									<td bgcolor="#eeeeee" width="10%" style="border-top: 1px solid rgb(0, 94, 188); font-weight: bold;">
										操作
									</td>
								</tr>

								<tr>
									<td align="center" width="5%">
										<input type="checkbox" onclick="selectEA()">
									</td>
									<td valign="middle">
										反选
										<a href="javascript:formDel();">删除</a>|
										<a href="javascript:formRefsh();">刷新</a>
									</td>

									<td align="right" valign="middle" style="font-weight: bold;" colspan="4">
										当前第1页

										<a href="">首页</a>
										<a href="">下一页</a>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<!--/right-->
				<div class="clear"></div>
			</div>
		</div>
		<#include "/front/foot.ftl">
	</body>
</html>

