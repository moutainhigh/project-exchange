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
							<#include "anotherMsg.ftl">
							<div class="c1_2">
								<span>今日团购：</span>
								<strong><#if site??><a href="${site.url}">【${team.siteName!""}】</a> <#else>【${team.siteName!""}】</#if></strong>
								<h3 class=" bdb_gray">
									<a href="${team.url!"http://"}" rel="nofollow" target="_blank">${team.summary!""}</a>
								</h3>
							</div>
							<div class="c1_3">
								<div class="c1_3_left">
									<div class="deal_image">
									<#if team.image??>
										<a class="deal_out_link" href="${team.url!"http://"}" rel="nofollow" target="_blank"> <img src="upload/${team.image}" title="${team.summary!""}" alt="${team.summary!""}" width="360" height="240"/>
										</a>
										<#else>
										<a class="deal_out_link" href="${team.url!"http://"}" rel="nofollow" target="_blank"> <img src="Themes/images/02.jpg" title="${team.summary!""}" alt="${team.summary!""}" width="360" height="240"/>
										</a>
										</#if>
									</div>
									<ul>
										<li class="ding_li">
											<a class="list_ding" title="顶您喜爱的团购" onclick="deal_ajax_ding('/deal_ratings/promote/25950', '#ding-25950')" id="ding-25950" href="#">顶<font>1</font>次</a>
										</li>
										<li class="concern_li">
											<a class="concerned_deal" title="收藏此团购" value="/concern/add_concern/25950" href="${base}/commonAction_collect?team.id=${team.id}"> 收藏<font>${team.collectTimes!'0'}</font>次 </a>
										</li>
										<li class="buy_li">
											<a class="purchased_deal" title="我已参与此团购" href="${base}/commonAction_bought?team.id=${team.id}" value="/concern/add_buy/25950"> 买了<font>${team.buyTimes!'0'}</font>次 </a>
										</li>
									</ul>
									<div class="fl" style="margin: 10px 0pt;">
										
										<#if site??>
										该团购活动由都买网组织，参与此团购将会与
										<a href="${site.url!"http://"}" title="${team.siteName!""}" target="_blank">${team.siteName!""}</a>产生直接买卖关系。
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
											${team.cityName!""}
										</div>
										<div class="deal_infos_2 fc">
											<div class="fl">
												<span>现价：<strong>${team.teamPrice!""}</strong>元</span>
												<span>原价：${team.marketPrice!""}元</span>
												<span>折扣：${team.discount!""}折</span>
											</div>
											<div class="fr" style="margin-right: 30px; text-align: center;">
												<a href="${team.url!"http://"}" rel="nofollow" target="_blank" class="buy"></a>
												<span>节省：${team.savedMoney!""}元</span>
											</div>
										</div>
										<div>
											已售出：${team.nowNumber!""}个
										</div>
										<div style="height: 23px;">
											<a style="float: right; margin-right: 13px;" href="#" rel="nofollow" title="举报不良信息、网页出错或其它问题" target="_blank">我要举报</a> 有效期：截止至${team.endTime?string("yyyy-MM-dd HH:mm:ss")}
											
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
											<span class="red">此团购信息来源于<#if site??><#if site.name??>${site.name}<#else>暂无</#if></span>
											
											<dl>
												<#if site.tel??>
												<dt>
													电话：
												</dt>
											
												<dd>
													${site.tel}
												</dd>
												</#if>
												<#if site.qq??>
												<dt>
													QQ：
												</dt>
												<dd>
													${site.qq}
												</dd>
												</#if>
												<#if site.contact??>
												<dt>
													联系人：
												</dt>
												<dd>
													${site.contact}
												</dd>
												</#if>
																								
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
					<#include "msg.ftl">
					<div class="section mar_t6">
						<div class="ptitle">
							团购活动评论
						</div>
						<div class=" pad_20">
							<ul class="commentlist">
								<table width="100%" border="0" cellspacing="0" class="wp100" style="border-collapse: collapse;">
									<tbody>
									<#if commentsPageBean??>
										<#list commentsPageBean.resultList as c>
										<tr>
											<td>
												<li>
													<div class="commentmain">
														<div class="commentuser">
																<!--
															<div class="user50">
																<a href="#" title=""><img style="width: 50px; height: 50px;" src="" width="50" height="50" /> </a>
															</div> -->
															<div class=" margin_t10 fl" style="background: none repeat scroll 0% 0% transparent;"></div>
														</div>
														<div class="commenttitle">
															<div class="fl">
																<a href="#" title=""><span style="" class="fcred fb"><#if c.userName??>${c.userName} <#else> </#if></span> </a>
															</div>
															<div class="fr ft10 fcgray">
																<#if c.lastModifyDate??>${c.lastModifyDate?string('yyyy-MM-dd HH:mm:ss')} <#else> </#if>
															</div>
														</div>
														<div class="comment mar_t5">
														<#if c.content??>${c.content} <#else> </#if>
														</div>
													</div>
													<#if c.replyContent??>
													<div class="gmreply ">
														<div class="clearfix mar_b5">
															<div class="fl green">
																管理员回复：
															</div>
														</div>
														<div>
															${c.replyContent!""}
														</div>
													</div>
													</#if>
												</li>
											</td>
										</tr>
										</#list>
										<#else>
										</#if>
									</tbody>
								</table>
							</ul>
							<div class="clear"></div>
							<#if commentsPageBean??>
							<div class="pages" style="margin: 10px 10px 10px 400px display: -moz-inline-box; float: right;">
							 <span class="nextprev">第${commentsPageBean.pageIndex }</font>/${commentsPageBean.maxPage }页</span>
									<span class="nextprev">每页${commentsPageBean.rowPerPage }条&nbsp;</span>
									<span class="nextprev">共${commentsPageBean.totalRow }条&nbsp;</span>
									<span class="nextprev"><#if !commentsPageBean.isFirstPage><a href="javascript:gotoPage(1,'${base}/page.htm?team.id=${team.id}');">[首页]</a><#else>[首页]</#if></span>
									<span class="nextprev"><#if !commentsPageBean.isFirstPage><a href="javascript:gotoPage(${commentsPageBean.prePageIndex },'${base}/page.htm?team.id=${team.id}');">[前一页]</a><#else>[前一页]</#if></span>
									<span class="nextprev"><#if !commentsPageBean.isLastPage><a href="javascript:gotoPage(${commentsPageBean.nextPageIndex },'${base}/page.htm?team.id=${team.id}');">[后一页]</a><#else>[后一页]</#if></span>
									<span class="nextprev"><#if !commentsPageBean.isLastPage><a href="javascript:gotoPage(${commentsPageBean.maxPage },'${base}/page.htm?team.id=${team.id}');">[尾页]</a><#else>[尾页]</#if></span>
									
						
							</div>
						
							<#else>
							</#if>
							<form name="commentForm" action="${base}/comment_action" method="post">
							<div class="commentbox bd3top">
								<div class="mar_l10 mar_b5 clearfix">
									<div class="red" style="margin-top: 3px;">
										欢迎畅所欲言，您的支持是我们不断进步的动力！
									</div>
								</div>
								<div class="mar_l10 mar_b5">
									你的用户名：
									<#if userObj??>
									<input name="comment.userName" type="text" value="${userObj.loginName}" />
									<#else>
									<input name="comment.userName" type="text"  />
									</#if>
								</div>
								<div class="mar_l10 mar_b5">
									<textarea name="comment.content" rows="4" class="h80 w542"></textarea>
								</div>
								<div style="" class="mar_l10 mar_b10 red">
									您还可以添加400个中文字或800个字母或标点
								</div>
								<div class="mar_l10 mar_b5 tright">
								   <input name="team.id" type="hidden" value="${team.id}"  />
									<input name="ImageButton1" value="发表评论" class=" button03" type="submit" />
								</div>
							</div>
							</form>
							<div class="clear">
							</div>
						</div>
					</div>
					<div class="section mar_t6">
						<div class="ptitle">
							团历史类似团购
						</div>
						<table class="deal_history" border="0" cellpadding="0" cellspacing="0">
							<#if similarTeamsList??>
							<tbody>
							<#list similarTeamsList as st>
								<tr>
									<td>
										${st.createTime?string('yyyy-MM-dd')}
									</td>
									<td class="title">
										【
										<a class="from" target="_blank" href="${st.url!'http://'}" title="${st.siteName!''}">${st.siteName!''}</a>】
										<a href="${st.url!'http://'}" target="_blank"> ${st.secondShortTitle!''} </a>
									</td>
									<td class="price current">
										￥${st.teamPrice!''}
									</td>
									<td class="price original">
										￥${st.marketPrice!''}
									</td>
									<td>
										${st.discount!''}折
									</td>
								</tr>
								</#list>
							</tbody>
							</#if>
						</table>
					</div>
				</div>

				  <#include "rightbar.ftl">
				<div class="clear"></div>
			</div>
		</div>
		<!-- end正文框架 -->

		<#include "foot.ftl">
		
	</body>
</html>
