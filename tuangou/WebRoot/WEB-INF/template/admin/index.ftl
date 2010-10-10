<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
	<title>${appTitle!"团购导航程序"}</title>
	<link href="css/basic.css" type="text/css" rel="stylesheet" />
	<link href="css/layout.css" type="text/css" rel="stylesheet" />
</head>
	<body>
		<div class="header">
			<h2>网购导航网站后台管理</h2>
			<img src="images/b2.jpg"/>
			<div class="clear"></div>
		</div>
		<div class="wrapper">
			<div class="left">
				<div class="top">
					<div class="w">
						<table>
						<tbody><tr>
						<td>
						欢迎您 系统管理员，throne212
						</td>
						</tr>
						</tbody></table>
					</div>
					<div class="b">
						<a target="_blank" href="index.php" class="fl">网站首页</a>
						<a onclick="confirm('确定要退出管理中心吗?')" target="_parent" href="index.php?c=account&amp;m=logout" class="fr">安全退出</a>
					</div>
				</div>
				<dl>
					<dt><strong>团拍信息</strong></dt>
					<dd><a target="mainFrame" href="index.php?d=admin&amp;c=team&amp;m=add">发布团拍活动</a></dd>
					<dd><a target="mainFrame" href="index.php?d=admin&amp;c=team&amp;m=check">团拍活动审核</a></dd>
					<dd><a target="mainFrame" href="index.php?d=admin&amp;c=team">团拍活动管理</a></dd>
					<dd><a target="mainFrame" href="index.php?d=admin&amp;c=site&amp;m=add">添加团拍网站</a></dd>
					<dd><a target="mainFrame" href="index.php?d=admin&amp;c=site&amp;m=check">团拍网站审核</a></dd>
					<dd><a target="mainFrame" href="index.php?d=admin&amp;c=site">团拍网站管理</a></dd>
					<dd><a target="mainFrame" href="index.php?d=admin&amp;c=feedteam">采集团拍活动</a></dd>
				</dl>
				<dl>
					<dt><strong>系统管理</strong></dt>
					<dd><a target="mainFrame" href="index.php?d=admin&amp;c=feedback">意见反馈管理</a></dd>
					<!--<dd><a href="index.php?d=admin&c=city" target="mainFrame">城市管理</a></dd>-->
					<dd><a target="mainFrame" href="index.php?d=admin&amp;c=user">会员管理</a></dd>
					<dd><a target="mainFrame" href="index.php?d=admin&amp;c=option">网站设置</a></dd>
					<dd><a target="mainFrame" href="index.php?d=admin&amp;c=option&amp;m=about">公司信息</a></dd>
					<dd><a target="mainFrame" href="index.php?d=member&amp;m=account">帐号设置</a></dd>
				</dl>
			</div>
			<div class="right">
				
			</div>
			<div class="clear"></div>
		</div>
	</body>
</html>