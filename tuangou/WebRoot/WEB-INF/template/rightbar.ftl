
<!-- right 广告  评论信息 -->

<div class="fr w254 nowrap">
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
								<li id="saituanba" class="current" onmouseover="showTargetInfo(this)">
									晒团吧
								</li>
								<li id="zhuanrang" onmouseover="showTargetInfo(this)">
									<a href="#" title="推荐任务" class="white">转让求购</a>
								</li>
							</ul>
						</div>
						<div id="saituandiv" class=" pad_10">
							<#if newsList??>
							<ul class="dotli01">
							<#list newsList as n>
								<li>
									<a href="${n.url!''}">${n.title!''}</a>
								</li>
							
								</#list>
							</ul>
								</#if>
							<div class="clear"></div>
						</div>
						<div id="zhuanrangdiv" class=" pad_10" style="display:none;">
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
								<li class="current" id="clickrank" onmouseover="showTargetInfoForSaleAndClick(this)">
									点击排行榜
								</li>
								<li id="salerank" onmouseover="showTargetInfoForSaleAndClick(this)">
									<a href="#" title="推荐任务" class="white">销售排行榜</a>
								</li>
							</ul>
						</div>
						<div class=" pad_10" id="clickrankdiv">
						<#if fiveMostClickList??>
							<ul class="top_deal_ads">
                       <#list fiveMostClickList as f>
								<li class="no_border">
									<div class="count">
									${f.clickTimes!''}
									</div>
									<div class="info">
										<a class="from" target="_blank" href="${f.url!'http://'}" title="${f.siteName!''}">【${f.siteName!''}】</a>
										<a title="${f.title!''}" class="text" href="${f.url!'http://'}" target="_blank"> ${f.shortTitle!''}</a>
									</div>
								</li>
							</#list>
							</ul>
							</#if>
							<div class="clear"></div>
						</div>
						
						<div id="salerankdiv" class=" pad_10" style="display:none;" >
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
								<li id="teamcomment" class="current" onmouseover="showTargetInfoForComment(this)">
									最新团购评论
								</li>
								<li id="sitecomment" onmouseover="showTargetInfoForComment(this)">
									<a href="#" title="推荐任务" class="white">最新网站评论</a>
								</li>
							</ul>
						</div>
						<div id="teamcommentdiv" class=" pad_10">
							<div class="togolist">
							<#if threeNewCommentsList??>
							<#list threeNewCommentsList as c>
								<dl>
									<dt>
									<#if c.team.image??>
									<a href="${c.team.url}"><img src="upload/${c.team.image}" width="220" height="137" alt="" /> </a>
									<#else>
										<a href="${c.team.url}"><img src="Themes/images/01.jpg" width="220" height="137" alt="" /> </a>
										</#if>
									</dt>
									<dd>
										<b><a href="${c.team.url}" class="blue">${c.team.shortTitle!''}</a> </b>
										<p>
											${c.content!''}
										</p>
									</dd>
								</dl>
								</#list>
								</#if>
								<div class="clear"></div>
							</div>
							<div class="clear"></div>
						</div>
						<div id="sitecommentdiv" class=" pad_10" style="display:none;">
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
						<#if cities??>
							<ul>
								
								<#list cities as c>					
								<li class="${c.pinyin!''}"><a href="${base}/selectCity.htm?city.id=${c.id}">${c['name']}</a></li>
								</#list>
							</ul>
							</#if>
							<div class="clear"></div>
						</div>
					</div>
				</div>
			