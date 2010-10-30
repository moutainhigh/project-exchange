<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="shortcut icon" href="/favicon2.ico" />
		<link href="${base}/front/Themes/basic.css" rel="stylesheet" type="text/css" />
		<link href="${base}/front/Themes/common.css" rel="stylesheet" type="text/css" />
		<title>${appTitle}</title>
		<meta name="description" content="${appDesc}">
		<meta name="keywords" content="${appKeywords}" />
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
					<a href="#">设为首页</a>
					<a href="#">添加收藏</a>
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
							<li><span>位置：</span> <a href="#">四川</a> &gt;&gt; <a href="#">成都</a></li>
							<li><span>类别：</span> <a href="#">四川</a></li>
							<li><span>联系方式：</span> <span>13912345678</span></li>
							<li><span>类型：</span> 全职</li>
							<li><span>性质：</span> 其它</li>
							<li class="lastLi"><a href="#">删除</a> | <a href="#">刷新</a> | <a href="#">我要举报</a> | <a href="#">信息失效</a> | <a href="#">推荐给好友</a></li>
						</ul>
						<div class="ad">广告</div>
						<div class="clear"></div>
					</div>
					<p class="c-content">
						${info.content}
					    <hr/>    
					     非诚勿扰，联系我时请说明是在【88客网】看到的，谢谢！<br>
					     您还可以查看最新<a title="成都招聘销售业务|业务销售招聘网" href="/chengdu/xiaoshouyewu/">销售/业务 </a>   <a title="成都招聘销售|销售招聘网" href="/chengdu/zhaopinxiaoshouyuan/">销售员</a>   <a title="成都招聘业务员|业务员招聘网" href="/chengdu/zhaopinyewuyuan/">业务员</a>   <a title="成都招聘市场策划|市场策划招聘网" href="/chengdu/zhaopinshichangcehua/">市场策划</a>          信息。
					    <br>
					    <font style="color: rgb(255, 102, 0);">88客网提示您：凡是涉及到个人利益、隐私等信息均应谨慎对待</font>
   					</p>
   					<h3>“松下随身听RQ-SX46”相关信息：</h3>
   					<p class="c-list-l">      
						<a title="小朋友的数码相机,小朋友的节日礼品" class="c-list-title" href="/beijing/shumachanpin/a2662973.html"> 小朋友的数码相机,小朋友的节日礼品</a><br>
						<span>迪士尼公司最新推出的经典卡通形象数码相机,首批分为有米奇,公主,汽车总动员,玩具总动员四个系列.相机...[
						<a title="北京丰台二手数码相机|北京丰台数码相机二手网" class="c-list-cate" href="/fengtai/ershouxiangji/">丰台数码相机</a>
						]</span>
						<a title="富士1800或1770" class="c-list-title" href="/huhuohaote/shumachanpin/a2662577.html"> 富士1800或1770</a><br>
						<span>富士1800或1770要求完好无损,配件齐全....[
						<a title="呼和浩特和林格尔二手数码相机|呼和浩特和林格尔数码相机二手网" class="c-list-cate" href="/huolingeer/ershouxiangji/">和林格尔数码相机</a>
						]</span>
						<a title="宏祥科技求购二手广播级摄像机 求购索尼专业摄像机 " class="c-list-title" href="/beijing/shumachanpin/a2662782.html"> 宏祥科技求购二手广播级摄像机 求购索尼专业摄像机 </a><br>
						<span>北京宏祥电话:1500 1131 101 QQ号码:5659647** ...[
						<a title="北京海淀二手数码摄像机|北京海淀数码摄像机二手网" class="c-list-cate" href="/haidian/ershoushexiangji/">海淀数码摄像机</a>
						]</span>
						网友正在关注：<a title="南京 ARM开发板" href="http://www.88ke.com/najingshi/shumachanpin/a2111650.html">南京 ARM开发板</a> <a title="万州二手单反相机" href="http://www.88ke.com/chongqing/shumachanpin/a2109804.html">万州二手单反相机</a> <a title="宁波数码二手网" href="http://www.88ke.com/ningbo/shumachanpin/">宁波数码二手网</a> <a title="大连二手数码相机" href="http://www.88ke.com/dalian/shumachanpin/a2091009.html">大连二手数码相机</a> <a title="深圳华强北平板电脑" href="http://www.88ke.com/shenzhen/shumachanpin/a2075533.html">深圳华强北平板电脑</a> <a title="深圳华强北数码批发" href="http://www.88ke.com/shenzhen/shumachanpin/a2049438.html">深圳华强北数码批发</a> <a title="r40 加 串口" href="http://www.88ke.com/shenzhen/shumachanpin/a1627681.html">r40 加 串口</a> <a title="反转片 龙岗" href="http://www.88ke.com/shenzhen/shumachanpin/a1632993.html">反转片 龙岗</a> <a title="深圳宝安二手数码相机" href="http://www.88ke.com/baoan/ershouxiangji/">深圳宝安二手数码相机</a> <a title="VAIO VGN-NR110E配置" href="http://www.88ke.com/shenzhen/shumachanpin/a1878681.html">VAIO VGN-NR110E配置</a>  
					</p>
				</div>
			</div>
			<div id="right" class="right">
				<div id="hot-cate">
					<div class="hot-cate-n">
						更多城市销售/业务信息
					</div>
					<ul>
						<li>
							·
							<a target="_blank" title="北京招聘销售业务|业务销售招聘网" href="/beijing/xiaoshouyewu/">北京销售/业务</a>
						</li>

						<li>
							·
							<a target="_blank" title="上海招聘销售业务|业务销售招聘网" href="/shanghai/xiaoshouyewu/">上海销售/业务</a>
						</li>

						<li>
							·
							<a target="_blank" title="广州招聘销售业务|业务销售招聘网" href="/guangzhou/xiaoshouyewu/">广州销售/业务</a>
						</li>

						<li>
							·
							<a target="_blank" title="深圳招聘销售业务|业务销售招聘网" href="/shenzhen/xiaoshouyewu/">深圳销售/业务</a>
						</li>


						<li>
							·
							<a title="青岛月薪6000元" href="http://www.88ke.com/qingdao/xiaoshouyewu/a2012751.html">青岛月薪6000元</a>
						</li>
						<li>
							·
							<a title="深圳南山销售招聘 信息" href="http://www.88ke.com/nashan/zhaopindianhuaxiaoshou/">深圳南山销售招聘 </a>
						</li>
						<li>
							·
							<a title="通州业务员招聘" href="http://www.88ke.com/tongzhou/zhaopinyewuyuan/">通州业务员招聘</a>
						</li>
						<li>
							·
							<a title="天津最新电话销售招聘信息" href="http://www.88ke.com/tianjin/zhaopindianhuaxiaoshou/">天津最新电话销售招</a>
						</li>
						<li>
							·
							<a title="深圳正拓新能源发展有限公司" href="http://www.88ke.com/shenzhen/xiaoshouyewu/a39587.html">深圳正拓新能源发展</a>
						</li>
						<li>
							·
							<a title="重庆业务员" href="http://www.88ke.com/chongqing/zhaopinyewuyuan/">重庆业务员</a>
						</li>
						<li>
							·
							<a title="苏州月薪3000-5000" href="http://www.88ke.com/suzhoushi/xiaoshouyewu/a1553997.html">苏州月薪3000-</a>
						</li>
						<li>
							·
							<a title="青岛市南区货代招聘" href="http://www.88ke.com/qingdao/xiaoshouyewu/a2165590.html">青岛市南区货代招聘</a>
						</li>
						<li>
							·
							<a title="萧山业务员招聘" href="http://www.88ke.com/xiaoshan/zhaopinyewuyuan/">萧山业务员招聘</a>
						</li>
						<li>
							·
							<a title="苏州外贸业务员招聘" href="http://www.88ke.com/zhaopin/suzhouwaimaoywyzp/">苏州外贸业务员招聘</a>
						</li>
						<div class="clear"></div>
					</ul>
				</div>
				<p id="cus" class="c-list-t">
					成都销售业务招聘求职频道为您提供最新的成都招聘销售业务|成都业务销售招聘网信息,88客网成都销售业务招聘求职频道每天免费为您提供数百条的真实有效的成都销售业务招聘求职信息,希望您能给我们一些宝贵的建议。最新成都成都销售业务招聘求职信息：1:房产经纪人学历:高中月薪:600-5000元每月2:成都立睿电子有限公司渠道销售精英3:建筑用胶学历:高中/中专以上
				</p>
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

