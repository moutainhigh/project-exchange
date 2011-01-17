<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<#include "head.ftl">
	</head>
	<body>
		<#escape x as (x)!""> 
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
											<a class="new_plshc_a1" title="对此团购发表评论" href="${base}/page.htm?team.id=${t.id}" target="_blank">(${t.commentTimes!'0'})</a>
										</div>
										<div class="new_ms_imgbox">
										<#if t.image??>
											<a class="image_link" target="_blank" href="${base}/page.htm?team.id=${t.id}"> <img src="upload/${t.image}" title="${t.siteName!""}团购网:${t.title!""}" alt="${t.siteName!""}团购网:${t.title!""}" class="normal_image" width="218" height="139" /> </a>
										<#else>
											<a class="image_link" target="_blank" href="${base}/page.htm?team.id=${t.id}"> <img src="Themes/images/02.jpg" title="${t.siteName!""}团购网:${t.title!""}" alt="${t.siteName!""}团购网:${t.title!""}" class="normal_image" width="218" height="139" /> </a>
										
										</#if>
										</div>
										<div class="new_ms_bt">
											<a class="from" target="_blank" href="#" title="${t.siteName!""}">${t.siteName!""}</a>
											<a class="title" target="_blank" href="${t.url}" title="[团购]${t.title!""}">${t.shortTitle!""}</a>
										</div>
										<div class="new_ms_jq">
											<span>团购价：<strong>${t.teamPrice!""}元</strong> </span>
											<span>折扣：<em>${t.discount!""}折</em> </span>
											<span>原价：${t.marketPrice!""}元</span>
											<span>已售：${t.nowNumber!""}个</span>
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
									
									<span class="nextprev">第${pageBean.pageIndex!"" }</font>/${pageBean.maxPage!"" }页</span>
									<span class="nextprev">每页${pageBean.rowPerPage!"" }条&nbsp;</span>
									<span class="nextprev">共${pageBean.totalRow!"" }条&nbsp;</span>
									
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

				<#include "rightbar.ftl">
				<div class="clear"></div>
			</div>
		</div>
		<!-- end正文框架 -->

		<#include "foot.ftl">
		</#escape> 
	</body>
</html>
