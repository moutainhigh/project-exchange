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
						<div class=" pad_10">
							<div class="c1_1 deal-share-links" style="float: none; overflow: hidden;">
								<span style="float: left; margin-right: 10px;">分享这个团购到：</span>
								<a class="qq" href="#">QQ/MSN</a>
								<a class="kaixin" href="#" target="_blank">开心</a>
								<a class="renren" target="_blank" href="#">人 人</a>
								<a class="douban" href="#" target="_blank">豆瓣</a>
								<a class="sina" href="#" target="_blank">新浪微博</a>
							</div>
							<div class="c1_2">
								<span>今日团购：</span>
								<strong><a href="${site.url}">【${team.siteName}】</a> </strong>
								<h3 class=" bdb_gray">
									<a href="${team.url}" rel="nofollow" target="_blank">${team.summary}</a>
								</h3>
							</div>
							<div class="c1_3">
								<div class="c1_3_left">
									<div class="deal_image">
										<a class="deal_out_link" href="${team.url}" rel="nofollow" target="_blank"> <img src="upload/${team.image}" title="${team.summary}" alt="${team.summary}" width="360" height="240"/>
										</a>
									</div>
									<ul>
										<li class="ding_li">
											<a class="list_ding" title="顶您喜爱的团购" onclick="deal_ajax_ding('/deal_ratings/promote/25950', '#ding-25950')" id="ding-25950" href="#">顶<font>1</font>次</a>
										</li>
										<li class="concern_li">
											<a class="concerned_deal" title="收藏此团购" value="/concern/add_concern/25950" href="#"> 收藏<font>0</font>次 </a>
										</li>
										<li class="buy_li">
											<a class="purchased_deal" title="我已参与此团购" href="#" value="/concern/add_buy/25950"> 买了<font>0</font>次 </a>
										</li>
									</ul>
									<div class="fl" style="margin: 10px 0pt;">
										
										<#if site??>
										该团购活动由都买网组织，参与此团购将会与
										<a href="${site.url}" title="${team.siteName}" target="_blank">${team.siteName}</a>产生直接买卖关系。
									  	<#else>
									  	</#if>
									</div>
								</div>
								<div class="c1_3_right deal_block">
									<div class="deal_infos">
										<div class="deal_infos_1 fc">
											<div class="deal_time">
												<div class="time">
													剩余时间:
													<span class="time_div timeleft" alt="1286467200000"><em><#if team.leftDay??>${team.leftDay} <#else>0</#if></em>天<em><#if team.leftHour??>${team.leftHour}<#else>0</#if></em>小 时<em><#if team.leftMin??>${team.leftMin}<#else>0</#if></em>分<em><#if team.leftSec??>${team.leftSec}<#else>0</#if></em>秒</span>
												</div>
											</div>
											${team.cityName}
										</div>
										<div class="deal_infos_2 fc">
											<div class="fl">
												<span>现价：<strong>${team.teamPrice}</strong>元</span>
												<span>原价：${team.marketPrice}元</span>
												<span>折扣：${team.discount}折</span>
											</div>
											<div class="fr" style="margin-right: 30px; text-align: center;">
												<a href="${team.url}" rel="nofollow" target="_blank" class="buy"></a>
												<span>节省：${team.savedMoney}元</span>
											</div>
										</div>
										<div>
											已售出：${team.nowNumber}个
										</div>
										<div style="height: 23px;">
											<a style="float: right; margin-right: 13px;" href="#" rel="nofollow" title="举报不良信息、网页出错或其它问题" target="_blank">我要举报</a> 有效期：截止至${team.endTime?string("yyyy-MM-dd HH:mm:ss")}
											}
										</div>
									</div>
									<div class="deal_ts">
										<span class="fl"> 更多<a href="#" title="北京团购网站大全" target="_blank">北京团购网站大全</a>信息 </span>
										<div id="tips_box" onmouseover="time_show_deal_tips();" onmouseout="time_hide_deal_tips();">
											友情提示
											<img class="help_img" alt="团购友情提示" style="margin-bottom: -2px;" src="${base}/Themes/images/32.gif"/>
											<div id="tips_content" style="display: none;" onmouseover="show_deal_tips();" onmouseout="time_hide_deal_tips();">
												<p>
													目前国内的团购网站良莠不齐，为了避免上当受骗，团800提醒您注意：
												</p>

												<ul>

													<li>
														1. 确保您去的团购网站是您了解和信任的，请查看它过往的团购记录和商家合作情况。
													</li>

													<li>
														2. 可以通过网络搜索等方式查看网友们对此团购网站以及合作商家活动的口碑评价。
													</li>

													<li>
														3. 确认交易流程中不要随意泄漏您的账号、密码，保留好您的支付及消费凭证。
													</li>

													<li>
														4. 如果您在消费后能回到团800这里留下您对本次团购的经历评价，会帮助其他许多和您一样的网友！
													</li>
												</ul>
												<br/>
												<p>
													注： 作为中立客观的团购导航网站，团800无法监控团购网站中的不实宣传，也没有行政处罚的权利，但我们希望可以网聚消费者的力量让大家 团的放心，用的开心！
												</p>
											</div>
										</div>
										<div class="clear"></div>
									</div>
									<div class="tuan_wai">
										<div class="tuan_wai_left">

											<a href="http://www.tuan800.com/out/jump-to/487" rel="nofollow" target="_blank" class="image"> <img src="${base}/Themes/images/ad02.jpg" alt="都买网"/>
											</a>
										</div>
										<div class="tuan_wai_right">
											<span class="red">此团购信息来源于<#if site??>${site.name}</span>

											<dl>

												<dt>
													电话：
												</dt>
												<dd>
													${site.tel}
												</dd>


												<dt>
													QQ：
												</dt>
												<dd>
													${site.qq}
												</dd>


												<dt>
													联系人：
												</dt>
												<dd>
													${site.contact}
												</dd>


												<dt>
													邮箱：
												</dt>
												<dd>
													service@doumaii.com
												</dd>
											</dl>

											查看
											<a href="${site.url}" title="${site.name}" target="_blank">${site.name}</a> 的所有团购信息
											<#else>
											对不起，没有关于此团购网的信息
											</#if>
										</div>
										<div class="clear"></div>
									</div>
								</div>
								<div class="clear"></div>
							</div>

							<div class="c1_4">
								<div class="c1_4_bottom">
									<h4>
										团购用户须知
									</h4>
									<p>
										今天假日海鲜城清蒸大闸蟹一斤（7-8只，母：1.3-1.5两，公：1.5两。公母各占一半），8元预订、消费时支付 18元
										<br/>
											凭都买网优惠券可在今天假日海鲜城密云店、六里桥店、门头沟店、全聚德西三旗店四店通用。 
										<br/>
											都买网优惠券有效期截 止：2010-12-23。 
									</p>
								</div>
							</div>
							<div class="clear"></div>
							<div class="clear"></div>
						</div>

					</div>
					<div class="section mar_t6">
						<div class="ptitle">
							团购活动评论
						</div>
						<div class=" pad_20">
							<ul class="commentlist">
								<table width="100%" border="0" cellspacing="0" class="wp100" style="border-collapse: collapse;">
									<tbody>
										<tr>
											<td>
												<li>
													<div class="commentmain">
														<div class="commentuser">
															<div class="user50">
																<a href="#" title=""><img style="width: 50px; height: 50px;" src="" width="50" height="50" /> </a>
															</div>
															<div class=" margin_t10 fl" style="background: none repeat scroll 0% 0% transparent;"></div>
														</div>
														<div class="commenttitle">
															<div class="fl">
																<a href="#" title=""><span style="" class="fcred fb">用户名</span> </a>
															</div>
															<div class="fr ft10 fcgray">
																2010/4/20 22:24:23
															</div>
														</div>
														<div class="comment mar_t5">
															我的八百邻卡要是去到其他城市可以用吗
														</div>
													</div>
													<div class="gmreply ">
														<div class="clearfix mar_b5">
															<div class="fl green">
																八百邻管理员回复：
															</div>
														</div>
														<div>
															您好，八百邻在成都，绵阳均通用。
														</div>
													</div>
												</li>
											</td>
										</tr>
										<tr>
											<td>
												<li>
													<div class="commentmain">
														<div class="commentuser">
															<div class="user50">
																<a href="#" title=""><img style="width: 50px; height: 50px;" src="" width="50" height="50" /> </a>
															</div>
															<div class=" margin_t10 fl" style="background: none repeat scroll 0% 0% transparent;"></div>
														</div>
														<div class="commenttitle">
															<div class="fl">
																<a href="#" title=""><span style="" class="fcred fb">用户名</span> </a>
															</div>
															<div class="fr ft10 fcgray">
																2010/4/20 22:24:23
															</div>
														</div>
														<div class="comment mar_t5">
															我的八百邻卡要是去到其他城市可以用吗
														</div>
													</div>
													<div class="gmreply ">
														<div class="clearfix mar_b5">
															<div class="fl green">
																八百邻管理员回复：
															</div>
														</div>
														<div>
															您好，八百邻在成都，绵阳均通用。
														</div>
													</div>
												</li>
											</td>
										</tr>
										<tr>
											<td>
												<li>
													<div class="commentmain">
														<div class="commentuser">
															<div class="user50">
																<a href="#" title=""><img style="width: 50px; height: 50px;" src="" width="50" height="50" /> </a>
															</div>
															<div class=" margin_t10 fl" style="background: none repeat scroll 0% 0% transparent;"></div>
														</div>
														<div class="commenttitle">
															<div class="fl">
																<a href="#" title=""><span style="" class="fcred fb">用户名</span> </a>
															</div>
															<div class="fr ft10 fcgray">
																2010/4/20 22:24:23
															</div>
														</div>
														<div class="comment mar_t5">
															我的八百邻卡要是去到其他城市可以用吗
														</div>
													</div>
													<div class="gmreply ">
														<div class="clearfix mar_b5">
															<div class="fl green">
																八百邻管理员回复：
															</div>
														</div>
														<div>
															您好，八百邻在成都，绵阳均通用。
														</div>
													</div>
												</li>
											</td>
										</tr>
									</tbody>
								</table>
							</ul>
							<div class="clear"></div>
							<div class="pages" style="margin: 10px 10px 10px 400px">
								<span class="nextprev">第一页</span>
								<span class="nextprev">上一页</span>
								<span class="current"> 1</span>
								<a href="#" title="Go to page 2">2</a>
								<a href="#" title="Go to page 3">3</a><a href="#" title="Go to page 4">4</a>
								<a href="#" class="nextprev" title="Go to Next Page"> 下一页</a><a href="#" class="nextprev" title="Go to Next Page">最后一页</a>
								<div class="clear"></div>
							</div>
							<div class="commentbox bd3top">
								<div class="mar_l10 mar_b5 clearfix">
									<div class="red" style="margin-top: 3px;">
										欢迎畅所欲言，您的支持是我们不断进步的动力！
									</div>
								</div>
								<div class="mar_l10 mar_b5">
									你的用户名：
									<input name="input" type="text" />
								</div>
								<div class="mar_l10 mar_b5">
									<textarea name="txtBCCommentDetail" rows="4" class="h80 w542"></textarea>
								</div>
								<div style="" class="mar_l10 mar_b10 red">
									您还可以添加400个中文字或800个字母或标点
								</div>
								<div class="mar_l10 mar_b5 tright">
									<input name="ImageButton1" value="发表评论" class=" button03" type="submit" />
								</div>
							</div>
							<div class="clear">
							</div>
						</div>
					</div>
					<div class="section mar_t6">
						<div class="ptitle">
							团历史类似团购
						</div>
						<table class="deal_history" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td>
										2010年9月27日
									</td>
									<td class="title">
										【
										<a class="from" target="_blank" href="http://www.tuan800.com/tuangou/matuan9" title="麻团团购">麻团团购</a>】
										<a href="#" target="_blank"> 好吃不发胖的泰国进口美食！！泰国SAMUI苏梅香酥烤椰... </a>
									</td>
									<td class="price current">
										￥4.9
									</td>
									<td class="price original">
										￥19
									</td>
									<td>
										2.6折
									</td>
								</tr>
								<tr>
									<td>
										2010年9月27日
									</td>
									<td class="title">
										【
										<a class="from" target="_blank" href="http://www.tuan800.com/tuangou/24quan" title="24券">24券</a>】
										<a href="#" target="_blank"> 世界顶级冰淇淋品牌莫凡彼movenpick冰淇淋套餐，... </a>
									</td>
									<td class="price current">
										￥20
									</td>
									<td class="price original">
										￥70
									</td>
									<td>
										2.9折
									</td>
								</tr>
								<tr>
									<td>
										2010年9月27日
									</td>
									<td class="title">
										【
										<a class="from" target="_blank" href="http://www.tuan800.com/tuangou/wancoo" title="万酷团">万酷团</a>】
										<a href="#" target="_blank"> 价88元，原价298元花开日式料理双人套餐【烤三文鱼头... </a>
									</td>
									<td class="price current">
										￥88
									</td>
									<td class="price original">
										￥298
									</td>
									<td>
										3折
									</td>
								</tr>
								<tr>
									<td>
										2010年9月27日
									</td>
									<td class="title">
										【
										<a class="from" target="_blank" href="http://www.tuan800.com/tuangou/nuomi" title="糯米网">糯米团</a>】
										<a href="#" target="_blank"> 22年西北美食老品牌!仅69元享西贝莜面村原价155元... </a>
									</td>
									<td class="price current">
										￥69
									</td>
									<td class="price original">
										￥155
									</td>
									<td>
										4.5折
									</td>
								</tr>
								<tr>
									<td>
										2010年9月27日
									</td>
									<td class="title">
										【
										<a class="from" target="_blank" href="http://www.tuan800.com/tuangou/shenghuobang" title="生活帮">生活帮</a>】
										<a href="#" target="_blank"> 辣上瘾餐厅超足份量精品双人套餐（麻辣香锅秘制锅底+两荤... </a>
									</td>
									<td class="price current">
										￥39
									</td>
									<td class="price original">
										￥105
									</td>
									<td>
										3.7折
									</td>
								</tr>
							</tbody>
						</table>
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
