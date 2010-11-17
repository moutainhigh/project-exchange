<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<#include "/front/head.ftl"/>
		<link href="${base}/front/Themes/index.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<#include "/front/top.ftl">
		<div class="wrapper">
			<#include "/front/desc.ftl">
			<div class="left">
				<!--类目-->
				<div class="category">
					<#list allCates as t>
					<div class="column">
						<h3>
							${t.name}
						</h3>
						<#list t.childs as c>
						<a class="cate-one" title="${c.name}" target="_blank" href="${base}/info/<#if currCity??>${currCity.pinyin}<#else>all</#if>/${c.pinyin}">${c.name}</a>
						<br>
						</#list>
					</div>
					</#list>
					<!--/for-->
					<div class="clear"></div>
				</div>
				<!--/类目-->
				<div class="hot">
					<h2>
						热门分类信息
					</h2>
					<ul>
						<#list infoBiz.top10RecommendInfo as info>
						<li>
							<a target="_blank" class="hot-li-a" title="${info.title}" href="${base}/info/all/${info.cate.pinyin}/${info.id}">${info.title}</a>
							<br>
							<span class="hot-one"><#if info.content?length<=100>${info.content}<#else>${info.content?substring(0,100)}...</#if></span>
							<span class="hot-two"> ${info.publishDate?string('yyyy-MM-dd')}</span>
						</li>
						</#list>
					</ul>
				</div>
			</div>
			<div class="right">
				<div id="city">
					<p class="city-enter">
						<span><a title="上海分类信息" href="${base}/info/shanghaixiaqu">上海</a>
						</span>
						<span><a title="北京分类信息" href="${base}/info/beijingxiaqu">北京</a>
						</span>
						<span><a title="广州分类信息" href="${base}/info/guangzhoushi">广州</a>
						</span>
						<span><a title="深圳分类信息" href="${base}/info/shenzhenshi">深圳</a>
						</span>
						<span><a title="天津分类信息" href="${base}/info/tianjinxiaqu">天津</a>
						</span>
						<br>
						<span><a title="长沙分类信息" href="${base}/info/changshashi">长沙</a>
						</span>
						<span><a title="济南分类信息" href="${base}/info/jinanshi">济南</a>
						</span>
						<span><a title="苏州分类信息" href="${base}/info/suzhoushi">苏州</a>
						</span>
						<span><a title="杭州分类信息" href="${base}/info/hangzhoushi">杭州</a>
						</span>
						<span><a title="成都分类信息" href="${base}/info/chengdushi">成都</a>
						</span>
					</p>
					<p class="city-other">
						<a href="city.htm">» 查看更多城市，请点这里！</a>
					</p>
				</div>
				<!--/city-->
				<div id="gg">
					<a target="_blank" href="/caozuo/"><img height="99" width="270" border="0" alt="分类信息发帖" src="http://88ke.hnfsi.com/88ke_imgs/left_gg.jpg">
					</a>
				</div>
				<!--new-->
				<div id="new">
					<h2>
						最新分类信息
					</h2>
					<ul>
						<#list infoBiz.top10NewestInfo as info>						
						<li>
							·
							<a style="color: rgb(0, 94, 188);" target="_blank" href="/info/all//">[${info.area.parent.name}${info.cate.name}]</a>
							<a target="_blank" title="${info.title}" href="${base}/info/all/${info.cate.pinyin}/${info.id}"><#if info.title?length<=20>${info.title}<#else>${info.title?substring(0,20)}...</#if></a>
						</li>
						</#list>
					</ul>
				</div>
				<!--/new-->
				<!--story-->
				<div id="story">
					<dl>
						<dt>
							成功故事
						</dt>
						<dd>
							<a target="_blank" href="/gushi/"><img height="76" width="80" border="0" alt="分类信息成功故事" src="http://88ke.hnfsi.com/88ke_imgs/stroy_img.jpg">
							</a> 我是一名老司机,开了几十年的车,前两天跑完车回来没事就上网闲逛,看看那些我们用的着的信息，因为工作的关系我还是会关注一些关于司机这方面的信息,...
							<a title="成功故事" class="gl_3" target="_blank" href="/gushi/">【详情】</a>
						</dd>
					</dl>
				</div>
				<!--/story-->
				<!--hotcate-->
				<div id="hot-cate">
					<h2>
						热门类目
					</h2>
					<ul>
					<!--
						<li>
							<a target="_blank" title="上海宠物寄养" href="#">上海宠物寄养</a>
						</li>
					-->
					</ul>
				</div>
				<!--hot cate-->
			</div>
			<div class="clear"></div>
		</div>
		<div class="foot_info w1000 center_container">
			友情链接:&nbsp;
			<#list links as l>
			<a target="_blank" href="${l.url}">${l.name}</a>&nbsp;&nbsp;
			</#list>
		</div>
		<#include "/front/foot.ftl">
	</body>
</html>

