<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<#include "/front/head.ftl"/>
		<link href="${base}/front/Themes/list.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<#include "/front/top.ftl">
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
				<#include "/front/pos.ftl">
				<!--l_content-->
				<div id="c-list">
					<h1>
						<#if currCity??>${currCity.name}<#else>全国</#if>${cate.name?default('')}
					</h1>
					<p class="c-list-t">
						以下是 <b><#if currCity??>${currCity.name}<#else>全国</#if>${cate.name?default('')}</b> 信息，如果您没有找到您要的信息，您可以尝试翻页查找。
					</p>
					<div id="top">
						<a style="color: rgb(255, 0, 0);" class="top-list-title" target="_blank" title="用户公告" href="/beijing/jiazhengfuwu/a2366498.html"> <img border="0" src="Themes/images/top.jpg" />用户公告</a>
						<br>
						<span> 1.88客中所有带有"官方"图案的信息都是我们为您提... ( <a title="北京宣武家政服务|北京宣武家政公司" style="font-size: 12px; color: rgb(153, 153, 153); text-decoration: none;" href="/xuanwu/jiazhengfuwu/"> 宣武家政</a> )<font>2010-10-12
								14:17:22</font> </span>

						<a style="color: rgb(255, 0, 0);" class="top-list-title" target="_blank" title="我想找份仓管工作" href="/chengdu/wuliu/a2584581.html"><img border="0" src="Themes/images/top.jpg" />我想找份仓管工作</a>
						<br>
						<span> 我很喜欢这份工作,请给我这次学习机会.谢谢.我手机号是15984310420.如果看到我请跟我联系. ( <a title="成都双流招聘仓库管理员|成都双流仓库管理招聘网" style="font-size: 12px; color: rgb(153, 153, 153); text-decoration: none;"
							href="/shuangliu/zhaopincangguan/"> 双流仓库管理员</a> )<font>2010-10-10 15:19:12</font> </span>
					</div>

					<p class="c-list-l">
						<#list pageBean.resultList as info>
						<a class="c-list-title" target="_blank" title="${info.title}" href="${base}/info/page/${info.id}.htm"> ${info.title}</a><font>${info.publishDate?string('yyyy-MM-dd')}</font>
						<br>
						<span>概要:<#if info.content?length<=100>${info.content}<#else>${info.content?substring(0,100)}...</#if></span>
						</#list>
					<div class="clear"></div>
					</p>
					<!--tags-->
					<div id="tags">
						<!--地区-->
						<ul class="tags-diqu">
							<li class="tags-n">
								地区：
							</li>
							<li class="tags-t">
								<a title="招聘销售业务|业务销售招聘网" href="/quanguo/xiaoshouyewu/">全国</a>
								<span class="tags-t-span">全市</span>
								<a title="成都锦江招聘销售业务|成都锦江业务销售招聘网" href="/jinjiang/xiaoshouyewu/">锦江</a>
								<a title="成都青羊招聘销售业务|成都青羊业务销售招聘网" href="/chengduqingyang/xiaoshouyewu/">青羊</a>
								<a title="成都崇州招聘销售业务|成都崇州业务销售招聘网" href="/chongzhou/xiaoshouyewu/">崇州</a>
							</li>
						</ul>
						<div class="clear"></div>
						<!--地区-->
						<!--物品分类-->
						<ul class="tags-fenlei">
							<li class="tags-n">
								职务类别：
							</li>
							<li class="tags-t">
								<span class="tags-t-span"> 全部</span>
								<a title="成都招聘促销员|成都促销员招聘网" href="/chengdu/zhaopincuxiaoyuan/">促销员</a>
								<a title="成都招聘市场策划|成都市场策划招聘网" href="/chengdu/zhaopinshichangcehua/">市场策划</a>
							</li>
						</ul>
						<div class="clear"></div>
						<!--/物品分类-->
						<!--关键字-->
						<form onsubmit="searchSubmit();" style="margin: 0pt;" name="se" method="post" action="/chengdu/xiaoshouyewu/">
							<ul class="tags-keywords">
								<li style="line-height: 22px;" class="tags-n">
									关键字：
								</li>
								<li class="tags-t">
									<input type="text" class="input-search" value="" id="keyword" name="keyword">
									<input type="submit" value="搜索" name="s">
								</li>
							</ul>
							<div class="clear"></div>

						</form>
					</div>
					<!--tags-->
					<!--分页-->
					<div id="next-page">
						<div class="next-l">
							共90条 当前第1/10页
							<a href="/chengdu/xiaoshouyewu/">首页</a> 1
							<a href="/chengdu/xiaoshouyewu/2/">2</a>
							<a href="/chengdu/xiaoshouyewu/3/">3</a>
							<a href="/chengdu/xiaoshouyewu/4/">4</a>
						</div>
						<div class="next-r">
							<a href="/chengdu/xiaoshouyewu/2/"><img height="25" width="60" border="0" alt="下一页" src="http://88ke.hnfsi.com/88ke_imgs/next-page.jpg"> </a>
						</div>
					</div>
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
		<#include "/front/foot.ftl">
	</body>
</html>

