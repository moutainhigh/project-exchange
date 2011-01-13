<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<#include "head.ftl">
	</head>
	<body>

		<#include "top.ftl">
		
		<#include "nav.ftl">	

		<!-- begin正文框架 -->
		<div class="wrapper">
			<div class="part02 mar_t6">
				<div class="fl w730">
					<div class="section ">
						<div class="ptitle">
							团购网站大全
						</div>
						<div class="new_nav_2">
							<ul>
								<li>
									<a href="${base}/index.htm" class="on" title="所有团购">所有团购</a>
								</li>
								<li>
									<a href="#" title="只显示今天发布的团购"> <span>今天发布的团购</span> <img class="help_img" alt="只显示今天新发布的团购信息，不包括之前发布的但是目前仍然有效的团购" title="只显示今天新发布的团购信息，不包括之前发布的但是目前仍然有效的团购" src="${base}/Themes/images/small_help.gif" /> </a>
								</li>
								<li>
									<a href="http://www.tuan800.com/login" title="您可以在这里定制查看您关心的团购网站"> <span>个人定制的团购</span> <img class="help_img" alt="您可以在这里定制查看您关心的团购网站" src="${base}/Themes/images/small_help.gif" /> </a>
								</li>
							</ul>

							<div class="new_nav_n2">
								<a class="grid_button on" href="#" title="网格模式"><span></span>网格</a>
								<a class="row_button " href="#" title="单行模式"><span></span>单行</a>
							</div>


							<div class="new_nav_n1">
								<span>排序</span>
								<select name="" onchange="change_to_order_by_type(this);" class="order_by_type">
									<option selected="selected" value="hot_level">
										按流行度排序
									</option>
									<option value="price">
										按价格排序
									</option>
									<option value="discount">
										按折扣排序
									</option>
									<option value="publish_time">
										按发布时间排序
									</option>
								</select>
							</div>
						</div>
						<div class=" pad_10 grid">
							<div class="title02">
								<span class="fr">所有按关键字“<#if searchKeyword??>${searchKeyword}<#else>${Session.keyword}</#if>”搜索结果列表</span>搜索结果
							</div>
                           
							<ul class=" mar_5">
								<#list pageBean.resultList as t>
								<li>
									<div class="deal">
										<div class="new_time">
											今日开始，还有
											<span class="time_div timeleft" alt="1285689600000"><em><#if t.leftDay??>${t.leftDay} <#else>0</#if></em>天<em><#if t.leftHour??>${t.leftHour}<#else>0</#if></em>小 时<em><#if t.leftMin??>${t.leftMin}<#else>0</#if></em>分<em><#if t.leftSec??>${t.leftSec}<#else>0</#if></em>秒</span>
										</div>
										<div class="new_plshc">
											<a class="new_plshc_a2" href="javascript:void(0);">(19)</a>
											<a class="new_plshc_a1" title="对此团购发表评论" href="#" target="_blank">(55)</a>
										</div>
										<div class="new_ms_imgbox">
											<a class="image_link" target="_blank" href="${base}/page.htm?team.id=${t.id}"> <img src="upload/${t.image}" title="${t.siteName}团购网:${t.title}" alt="${t.siteName}团购网:${t.title}" class="normal_image" width="218" height="139" /> </a>
										</div>
										<div class="new_ms_bt">
											<a class="from" target="_blank" href="#" title="${t.siteName}">${t.siteName}</a>
											<a class="title" target="_blank" href="${t.url}" title="[团购]${t.title}">${t.shortTitle}</a>
										</div>
										<div class="new_ms_jq">
											<span>团购价：<strong>${t.teamPrice}元</strong> </span>
											<span>折扣：<em>${t.discount}折</em> </span>
											<span>原价：${t.marketPrice}元</span>
											<span>已售：${t.nowNumber}个</span>
										</div>
										<div class="new_ns_gm">
											<p>
												多个商圈
											</p>
											<a class="buy" href="${base}/page.htm?team.id=${t.id}" title="去购买" target="_blank" rel="nofollow" ></a>
										</div>
									</div>
								</li>
							 </#list>
							</ul>
                           
							<div class="clear"></div>
							<div class="pages" style="margin: 10px 10px 10px 400px">
							
							
							<div style="display:-moz-inline-box;float:right;">
									
									<span class="nextprev">第${pageBean.pageIndex }</font>/${pageBean.maxPage }页</span>
									<span class="nextprev">每页${pageBean.rowPerPage }条&nbsp;</span>
									<span class="nextprev">共${pageBean.totalRow }条&nbsp;</span>
									
							</div>
									<div style="display:-moz-inline-box;float:right;">
									<span class="nextprev"><#if !pageBean.isFirstPage><a href="javascript:gotoPage(1,'${base}/search.htm?searchKeyword=${searchKeyword}');">[首页]</a><#else>[首页]</#if></span>
									<span class="nextprev"><#if !pageBean.isFirstPage><a href="javascript:gotoPage(${pageBean.prePageIndex },'${base}/search.htm?searchKeyword=${searchKeyword}');">[前一页]</a><#else>[前一页]</#if></span>
									<span class="nextprev"><#if !pageBean.isLastPage><a href="javascript:gotoPage(${pageBean.nextPageIndex },'${base}/search.htm?searchKeyword=${searchKeyword}');">[后一页]</a><#else>[后一页]</#if></span>
									<span class="nextprev"><#if !pageBean.isLastPage><a href="javascript:gotoPage(${pageBean.maxPage },'${base}/search.htm?searchKeyword=${searchKeyword}');">[尾页]</a><#else>[尾页]</#if></span>
									</div>
						
								<div class="clear"></div>
							</div>
							<div class="clear"></div>
						</div>

					</div>
				</div>

				<div class="fr w254">

					<div class="pic-imgnews">
						<img src="${base}/Themes/images/banner.jpg" alt="切换广告" width="252" height="178" />
						<ul>
							<li class="current">
								1
							</li>
							<li>
								2
							</li>
							<li>
								3
							</li>
						</ul>
					</div>
					<div class="section mar_t6">
						<div class="ptitle">
							关注我们
						</div>
						<div class=" pad_10 concern_us">
							<ul>
								<li class="li_img1">
									<a target="_blank" href="http://m.tuan800.com/">m.tuan800.com</a>手机访问
								</li>
								<li class="li_img2">
									<a target="_blank" href="http://www.tuan800.com/blog">关注</a>官方博客
								</li>
								<li class="li_img3">
									<span>105702964</span>官方用户QQ群
								</li>
								<li class="li_img3">
									<span>78738282</span>商务合作QQ群
								</li>
								<li class="li_img6">
									<a href="mailto:ad@tuan800.com">ad@tuan800.com</a>商务联系
								</li>
								<li class="li_img4">
									<a target="_blank" href="http://t.sina.com.cn/tuan800">关注</a>团800微博
								</li>
								<li class="li_img5">
									<a href="javascript:void(0)" onclick="$('.collect_hidden').toggle();return false;">收藏</a>添加收藏团800
								</li>
							</ul>
							<div class="clear"></div>
						</div>
					</div>
					<div class="section03 mar_t6">
						<div class="ptitle">
							<ul class="tlboxtitle fl">
								<li class="current">
									晒团吧
								</li>
								<li>
									<a href="#" title="推荐任务" class="white">转让求购</a>
								</li>
							</ul>
						</div>
						<div class=" pad_10">
							<ul class="dotli01">
								<li>
									<a href="#">参与麦可思测评与研究项目</a>
								</li>
								<li>
									<a href="#">推荐麦可思测评与研究项目</a>
								</li>
								<li>
									<a href="#">用我们的研究报告与数据</a>
								</li>
								<li>
									<a href="#">推荐麦可思给您的朋友</a>
								</li>
								<li>
									<a href="#">参与2009届大学毕业生工作能力测评</a>
								</li>
								<li>
									<a href="#">推荐2009届大学毕业生参与工作能</a>
								</li>
							</ul>


							<div class="clear"></div>
						</div>
					</div>
					<div class="section03 mar_t6">
						<div class="ptitle">
							<ul class="tlboxtitle fl">
								<li class="current">
									销售排行榜
								</li>
								<li>
									<a href="#" title="推荐任务" class="white">点击排行榜</a>
								</li>
							</ul>
						</div>
						<div class=" pad_10">
							<ul class="top_deal_ads">

								<li class="no_border">
									<div class="count">
										28486
									</div>
									<div class="info">
										<a class="from" target="_blank" href="#" title="一起呀">【一起呀】</a>
										<a title="成龙影城第四波！15元超值亚洲最大影城观影白天场(电影票1张+果汁1杯)！所有影片不加钱均可看(含3D)！有效期至年底，&lt;
span&gt;十一黄金周至贺岁档所有大片一网打尽！&lt;/span&gt;数量有限，抓紧时间哦！" class="text" href="#" target="_blank"> 成龙影城第四波！15元超值亚洲最大影城观影白天场(电影票1张+果汁1杯)！所有影片不加钱均可看(含3D)！有效期至年底，<span>十一黄金周至 贺岁档所有大片一网打尽！</span>数量有限，抓紧时间哦！ </a>
									</div>
								</li>

								<li>
									<div class="count">
										10963
									</div>
									<div class="info">
										<a class="from" target="_blank" href="#" title="一起呀">【一起呀】</a>
										<a title="成龙影城第三波！13元超值亚洲最大影城观影白天场(电影票1张+果汁1杯)！所有影片不加钱均可看(含3D)！限量1万份，有效期至年
底，&lt;span&gt;十一黄金周至贺岁档所有大片一网打尽！&lt;/span&gt;" class="text" href="#" target="_blank"> （卖光）成龙影城第三波！13元超值亚洲最大影城观影白天场(电影票1张+果汁1杯)！所有影片不加钱均可看(含3D)！限量1万份，有效期至年底，<span>十 一黄金周至贺岁档所有大片一网打尽！</span> </a>
									</div>
								</li>

								<li>
									<div class="count">
										5520
									</div>
									<div class="info">
										<a class="from" target="_blank" href="#" title="搜狐爱家团">【搜狐爱家 团】</a>
										<a title="“福记”燕鲍2人套餐(木瓜鲜奶炖燕窝2位+鲍鱼捞香饭2位+老火例汤2位+白灼大海虾+劲爆金蒜牛柳粒+双椒大鱼头+清炒鸡毛菜+上海小
笼包+果汁2杯)。独具一格的美味珍馐，难得一见的顶级饕餮大餐！" class="text" href="#" target="_blank"> “福记”燕鲍2人套餐(木瓜鲜奶炖燕窝2位+鲍鱼捞香饭2位+老火例汤2位+白灼大海虾+劲爆金蒜牛柳粒+双椒大鱼头+清炒鸡毛菜+上海小笼包+果汁2 杯)。独具一格的美味珍馐，难得一见的顶级饕餮大餐！ </a>
									</div>
								</li>

								<li>
									<div class="count">
										4000
									</div>
									<div class="info">
										<a class="from" target="_blank" href="http://www.tuan800.com/tuangou/dazhongdianpingtuan" title="大众点评团">【大 众点评团】</a>
										<a title="黔道火锅套餐!" class="text" href="#" target="_blank"> 黔道火锅套餐! </a>
									</div>
								</li>

								<li>
									<div class="count">
										3289
									</div>
									<div class="info">
										<a class="from" target="_blank" href="http://www.tuan800.com/tuangou/miaohoo" title="秒货网">【秒货网】</a>
										<a title="麦当劳B套餐 ！I’m lovin’ 
it！全北京麦当劳通用，共享超值优惠！从小吃到大的麦当劳，最具人气的经典美味！绝对震撼价！（兑换券将在活动结束后统一发送）" class="text" href="#" target="_blank"> 麦当劳B套餐 ！I’m lovin’ it！全北京麦当劳通用，共享超值优惠！从小吃到大的麦当劳，最具人气的经典美味！绝对震撼价！（兑换券将在活动结束后统一发送） </a>
									</div>
								</li>
							</ul>
							<div class="clear"></div>
						</div>
					</div>
					<div class="section03 mar_t6">
						<div class="ptitle">
							<ul class="tlboxtitle fl">
								<li class="current">
									最新团购评论
								</li>
								<li>
									<a href="#" title="推荐任务" class="white">最新网站评论</a>
								</li>
							</ul>
						</div>
						<div class=" pad_10">
							<div class="togolist">
								<dl>
									<dt>
										<a href="#"><img src="${base}/Themes/images/01.jpg" width="220" height="137" alt="" /> </a>
									</dt>
									<dd>
										<b><a href="#" class="blue">琴岛火锅店套餐</a> </b>
										<p>
											热线电话0313-8888888，好吃得不得了
										</p>
									</dd>
								</dl>
								<dl>
									<dt>
										<a href="#"><img src="${base}/Themes/images/01.jpg" width="220" height="137" alt="" /> </a>
									</dt>
									<dd>
										<b><a href="#" class="blue">张家口汽车保险推荐1</a> </b>
										<p>
											热线电话0313-8888888，好吃得不得了
										</p>
									</dd>
								</dl>
								<dl>
									<dt>
										<a href="#"><img src="${base}/Themes/images/01.jpg" width="220" height="137" alt="" /> </a>
									</dt>
									<dd>
										<b><a href="#" class="blue">张家口汽车保险推荐1</a> </b>
										<p>
											热线电话0313-8888888，好吃得不得了
										</p>
									</dd>
								</dl>
								<div class="clear"></div>
							</div>
							<div class="clear"></div>
						</div>
					</div>
					<div class="section mar_t6">
						<div class="ptitle">
							其他城市网购大全
						</div>
						<div class=" pad_10 citylist">
							<ul>
								<li>
									<a href="#">上海</a>
								</li>
								<li>
									<a href="#">北京</a>
								</li>
								<li>
									<a href="#">深圳</a>
								</li>
								<li>
									<a href="#">内蒙古</a>
								</li>
							</ul>
							<div class="clear"></div>
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<!-- end正文框架 -->

		<#include "foot.ftl">
	</body>
</html>
