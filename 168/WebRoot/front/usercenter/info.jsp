<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="shortcut icon" href="http://s1.liebiao.org/favicon2.ico" />
		<link href="../Themes/basic.css" rel="stylesheet" type="text/css" />
		<link href="../Themes/usercenter.css" rel="stylesheet" type="text/css" />
		<title>一路发|分类信息-免费发布信息</title>
		<meta name="description" content="交友征婚，家政，招聘求职，房屋出租，跳蚤市场，二手车等生活分类信息尽在列表网。欢迎免费发布查询生活分类信息。">
		<meta name="keywords" content="分类信息 生活信息 分类广告 一路发" />
	</head>

	<body>
		<div class="top">
			<div class="top_line">
				<h3>
					欢迎光临一路发信息发布网
				</h3>
				<div class="reg_login">
					<a href="#">用户注册</a>
					<a href="#">用户登录</a>
					<a href="#">设为首页</a>
					<a href="#">添加收藏</a>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="header">
			<div class="logo">
				<img src="../Themes/images/logo.jpg" alt="logo" />
			</div>
			<div class="search">
				<div class="search_input">
					<select>
						<option>
							==请选择分类==
						</option>
						<option>
							人才
						</option>
						<option>
							二手房
						</option>
					</select>
					<input type="text" name="key" class="search_key" />
					<input type="button" value="搜索" class="search_btn" />
				</div>
				<div class="hot">
					热门搜索：
					<a href="#">二手自行车</a>
					<a href="#">显示器</a>
					<a href="#">内存条</a>
					<a href="#">兼职</a>
				</div>
			</div>
			<div class="publish">
				<a href="#"><img src="../Themes/images/btn_publish.gif" /> </a>
			</div>
		</div>
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
						<font id="loginname">yanglei123qwe@163.com</font>的光临:
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
		<div class="foot w1000 center_container clear">
			<a href="http://www.liebiao.com/about/termsofuse.html" rel="nofollow">服务协议</a> |
			<a href="http://www.liebiao.com/about/privacy.html" rel="nofollow">隐私保护</a> |
			<a href="http://www.liebiao.com/about/factsheet.html" rel="nofollow">关于列表网</a> |
			<a href="http://www.liebiao.com/about/help/" rel="nofollow">使用帮助</a> |
			<a href="http://www.liebiao.com/about/contactus.html" rel="nofollow">联系我们</a> |
			<a title="把列表网加入收藏夹" href="http://www.liebiao.com/" onclick="window.external.addFavorite('http://www.liebiao.com/','列表网');return false">收藏本站</a>
			<br>
			&copy; 2007-2010 列表网
			<a target="_blank" href="http://s2.liebiao.org/image/icp.jpg" rel="nofollow">京ICP证100421号</a> 京ICP备09031142号
			<a href="http://www.hd315.gov.cn/beian/view.asp?bianhao=010202010082000002" rel="nofollow"><img src="http://s2.liebiao.org/image/gs.gif"> </a>
			<br>
			朝阳区公安分局网络备案编号:1101051169
			<a href="http://www.liebiao.com/about/help/scam.html" rel="nofollow">谨防手机诈骗和网络诈骗</a>
		</div>
	</body>
</html>
