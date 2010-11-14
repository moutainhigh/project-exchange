<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="shortcut icon" href="/favicon2.ico" />
		<link href="${base}/front/Themes/basic.css" rel="stylesheet" type="text/css" />
		<link href="${base}/front/Themes/common.css" rel="stylesheet" type="text/css" />
		<title>${info.title}</title>
		<script src="${base}/js/jquery.js"></script>
		<script src="${base}/front/js/common.js"></script>
		
		<link href="${base}/front/Themes/page.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div class="top">
			<div class="top_line">
				<h3>
					欢迎光临一路发信息发布网
				</h3>
				<div class="reg_login">
					<a href="${base}/index.htm">网站首页</a>
					<#if userObj??>
					<a href="${base}/user/infoList.htm">会员中心(${userObj.loginName})</a>
					<a href="${base}/logout_action.htm">退出登录</a>
					<#else>
					<a href="${base}/reg.htm">用户注册</a>
					<a href="${base}/login.htm">用户登录</a>
					</#if>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="header">
			<div class="logo">
				<a href="${base}/index.htm"><img src="${base}/front/Themes/images/logo.jpg" alt="logo" /></a>
			</div>
			<div id="changecity" class="banner-city">
				<span><#if currCity??>${currCity.name}<#else>全国</#if></span><br>
				<a title="选择城市" href="${base}/city.htm">[选择城市]</a>
			</div>
			<div class="search">
				<div class="search_input">
					<select id="catePinyin" name="catePinyin">
						<option value="">
							==不限分类==
						</option>
						<#list allCates as c>
						<option value="${c.pinyin}">${c.name}</option>
						</#list>
					</select>
					<input type="text" name="key" class="search_key" name="keywords" id="keywords" value="${keywords?default('')}"/>
					<input type="button" value="搜索" class="search_btn" onClick="search('${base}')"/>
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
				<a href="${base}/user/publish/index.htm"><img src="${base}/front/Themes/images/btn_publish.gif" /> </a>
			</div>
		</div>
		<div class="wrapper">
			<div class="desc">
				一路发信息发布网是最具活力的、信息质量最高的中文分类信息网站，每天访问量上百万次。列表网可以帮助人们以最简单的方式发现和发布本地有价值的广告信息，诸如
				<strong>交友</strong>、
				<strong>租房</strong>、
				<strong>二手房</strong>、
				<strong>二手车</strong>、
				<strong>二手物品</strong>、
				<strong>宠物</strong>、
				<strong>招聘</strong>、
				<strong>生活服务</strong>及
				<strong>商务服务</strong>信息等等。列表网无需注册免费发布，让信息的沟通更加便捷。 下面请选择你所在的城市：
			</div>
			<div class="left">
				<div id="postion">
					您的位置：
					<a title="${appTitle}" href="${base}/index.htm">一路发信息发布网</a> &gt;&gt; <span id="pos2"></span>
				</div>
				<!--l_content-->
				<div class="content">
					<h2>${info.title}</h2>
					<div class="info_time">
						<span>更新日期: ${info.publishDate?string('yyyy-MM-dd')}</span>
						<span>信息编号: ${info.id}</span>
					</div>
					<div class="info">
						<ul>
							<li><span>位置：</span> <a href="#">${info.area.parent.name}</a> &gt;&gt; <a href="#">${info.area.name}</a></li>
							<li><span>类别：</span> <a href="#">${info.cate.parent.name}</a> &gt;&gt; <a href="#">${info.cate.name}</a></li>
							<li><span>联系Email：</span> <span>${info.email}</span></li>
							<li><span>联系电话：</span> <span>${info.tel}</span></li>
							<li><span>联系QQ：</span> <span>${info.qq}</span></li>
							<li class="lastLi"><a href="#">刷新</a> | <a href="#">我要举报</a> | <a href="#">推荐给好友</a></li>
						</ul>
						<div class="ad">
							<#if info.image??>
								<img src="${base}/upload/${info.image}" width="250px" height="160px;"/>
							<#else>
								广告
							</#if>
						</div>
						<div class="clear"></div>
					</div>
					<p class="c-content">
						${info.content}
					    <hr/>    <br/>
					     非诚勿扰，联系我时请说明是在【${appTitle}】看到的，谢谢！<br/>
					    <br>
					    <font style="color: rgb(255, 102, 0);">一路发信息发布网提示您：凡是涉及到个人利益、隐私等信息均应谨慎对待</font>
   					</p>
   					<br/>
   					<h3>“${info.title}”相关信息：</h3>
   					<p class="c-list-l">      
   						<#list relateInfos as info>
						<a title="${info.title}" target="_blank" class="c-list-title" href="${base}/info/all/${info.cate.pinyin}/${info.id}">${info.title}</a><br>
						<span><#if info.content?length<=100>${info.content}<#else>${info.content?substring(0,100)}...</#if></span>
						</#list>
					</p>
				</div>
			</div>
			<div id="right" class="right">
				<div id="hot-cate">
					<div class="hot-cate-n">
						更多城市${info.cate.name}信息
					</div>
					<ul>
						<#list hotCities as c>
						<li>
							<a target="_blank" title="${c.name}${info.cate.name}" href="${base}/info/${c.pinyin}/${info.cate.parent.pinyin}">${c.name}${info.cate.name}</a>
						</li>
						</#list>
						<div class="clear"></div>
					</ul>
				</div>
			</div>
			<div class="clear"></div>
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
			<a href="http://www.hd315.gov.cn/beian/view.asp?bianhao=010202010082000002" rel="nofollow"><img src=""> </a>
			<br>
			朝阳区公安分局网络备案编号:1101051169
			<a href="http://www.liebiao.com/about/help/scam.html" rel="nofollow">谨防手机诈骗和网络诈骗</a>
		</div>
	</body>
</html>

