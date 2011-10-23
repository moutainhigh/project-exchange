<%@ page language="java" pageEncoding="GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="GBK" oncontextmenu="return false">
	<head>
		<title>${city.simpleName}兼职网-${city.simpleName}大学生兼职网 -兼职吧</title>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<meta http-equiv="Content-Language" content="GBK" />
		<meta name="keywords" content="${city.simpleName}兼职网">
		<meta name="description" content="${city.simpleName}兼职网每天更新大量的${city.simpleName}兼职招聘信息;您可以免费浏览${city.simpleName}大学生兼职,家教,传单派发,模特礼仪,网上兼职等信息;还可以在${city.simpleName}大学生兼职网免费发布信息。">
		<link rel="Bookmark" href="http://www.jianzhi8.com/comcity/favicon.ico" />
		<link rel="shortcut icon" href="http://www.jianzhi8.com/comcity/favicon.ico" type="image/x-icon" />
		<link href="http://www.jianzhi8.com/comcity/jz8_css/css.css" rel="stylesheet" type="text/css" />
		<link href="http://www.jianzhi8.com/comcity/jz8_css/index_base.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="/jz8_js/showcity.js" type="text/javascript"></script>
		<script language="JavaScript" src="/js/jquery.js"></script>
		<script language="JavaScript">
			$(function(){
				$(".ccontlist").css('height','140px');
			});
		</script>
	</head>
	<body>
		<DIV id=wrapper>
			<DIV id=top_miniNav>
				<span><A href="http://www.jianzhi8.com/">兼职</A>· <A
					href="http://www.jianzhi8.com/zph/" target=_blank>招聘会</A>· <A
					href="http://www.jianzhi8.com/tuandui/" target=_blank>大学生兼职团队</A>·
					<A href="http://www.jianzhi8.com/gonggaolan.jsp" target=_blank>骗子公告栏</A>·
					<A href="http://www.jianzhi8.com/classinfo/" target=_blank>分类信息</A>·
					<a href="http://weibo.com/jianzhi8com" target="_blank"
					rel="nofollow">兼职吧新浪微博</a>· <a href="http://t.qq.com/jianzhibacom"
					target="_blank" rel="nofollow">兼职吧腾讯微博</a> </span>
				<EM> <A href="http://www.jianzhi8.com/index.html">本站导航</A>· <a
					name="StranLink">繁體中文</a>· <a
					onclick="window.external.AddFavorite(location.href,document.title);"
					href="#">加入收藏</a>· </EM>
			</DIV>
			<DIV id=header>
				<table width="100%" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<TR>
						<td width="180" rowspan="2" align="center">
							<A href="/"> <IMG height=60 alt='${city.simpleName}兼职网'
									src="/jz8_images/logo.gif" width=160 border=0> </A>
						</TD>
						<td width="150" align="center" rowspan="2" class="grey_font">
							<div class="CurrentPro">
								<strong><font color='#ff6600'>${city.simpleName}</font>
								</strong>
							</div>
							<div>
								<A id="link_city_change"
									onmouseover="document.getElementById('all_city').className='sc'"
									onmouseout="document.getElementById('all_city').className='hc'"
									href="http://www.jianzhi8.com/index.html">[切换城市]
									<DIV class="hc" id="all_city">
										<IFRAME src="http://www.jianzhi8.com/ichangecity.htm"
											frameBorder="0" width="380" scrolling="no" height="225"></IFRAME>
									</DIV> </A>
							</div>
						</td>
						<td align="center" valign="bottom" height="30">
							<iframe src="http://my.jianzhi8.com/include_top.html" height="30"
								width="100%" scrolling="no" frameborder="0"></iframe>

						</td>
						<td width="160" rowspan="3" align="center">
							<br>
							<A href="http://my.jianzhi8.com/fb.do"> <IMG
									src="http://www.jianzhi8.com/comcity/myimages/p1.gif"
									border="0" alt="">
							</A>
						</td>
					</tr>
					<tr>
						<TD height="40" valign='bottom'>
<jsp:include page="nav.jsp"></jsp:include>
						</TD>
					</TR>
				</TABLE>
			</DIV>
			<DIV id=search2>
				<DIV id=searchBox2>
					<ul class="content_search">
						<form name="zpfbForm2" method="post" action="/search.do"
							onsubmit="return Check_Search(this);" target="_blank"
							style="margin: 0px;">
							站内搜索:
							<input type="text" name="key" size="50" maxlength="20"
								class="search_jing"
								onFocus='this.style.color="#000000";if( "例如：促销 或 打字" == this.value) this.value=""'
								value="例如：促销 或 打字"
								style="FONT-SIZE: 12px; color: #CCCCCC; vertical-align: bottom;" />
							<input type="submit" name="submitLogin" value=" 搜 索 "
								id="btnLogin" />
							<a
								href='http://${city.cityId}.jianzhi8.com/s/%E6%89%93%E5%AD%97%E5%85%BC%E8%81%8C'>打字</a>
							<a
								href='http://${city.cityId}.jianzhi8.com/s/%E4%BF%83%E9%94%80%E5%91%98%E5%85%BC%E8%81%8C'>促销员</a>
							<a
								href='http://${city.cityId}.jianzhi8.com/s/%E5%AE%B6%E6%95%99%E5%85%BC%E8%81%8C'>家教</a>
							<a
								href='http://${city.cityId}.jianzhi8.com/s/%E6%A8%A1%E7%89%B9%E5%85%BC%E8%81%8C'>模特</a>
							<a
								href='http://${city.cityId}.jianzhi8.com/s/%E5%91%A8%E6%9C%AB%E5%85%BC%E8%81%8C'>周末</a>
							<a
								href='http://${city.cityId}.jianzhi8.com/s/ktv%E5%85%BC%E8%81%8C'>ktv</a>
							<a
								href='http://${city.cityId}.jianzhi8.com/s/%E9%85%92%E5%90%A7%E5%85%BC%E8%81%8C'>酒吧</a>
							<a
								href='http://${city.cityId}.jianzhi8.com/s/%E4%BA%94%E4%B8%80%E5%85%BC%E8%81%8C'>五一</a>
							<a
								href='http://${city.cityId}.jianzhi8.com/s/%E6%9A%91%E5%81%87%E5%85%BC%E8%81%8C'>暑假</a>
							<a
								href='http://${city.cityId}.jianzhi8.com/s/%E6%9A%91%E5%81%87%E5%B7%A5%E5%85%BC%E8%81%8C'>暑假工</a>
							<a
								href='http://${city.cityId}.jianzhi8.com/s/%E6%9A%91%E5%81%87%E5%AE%9E%E4%B9%A0'>暑假实习</a>
						</form>
					</ul>
					<ul class="content2_search">
					</ul>
				</DIV>
			</DIV>
			<!-- content end -->
			<DIV id=content>
				<DIV class=c_border>
					<DIV id=cc_left>
						<H2>
							<SPAN><A href="http://www.jianzhi8.com/tuandui/"
								target=_blank>大学生兼职团队QQ群</A>&nbsp;&nbsp;&nbsp; <a
								href="http://${city.cityId}.jianzhi8.com/job/" target='_blank'>${city.simpleName}招聘</a>&nbsp;&nbsp;&nbsp;
								<a href="http://${city.cityId}.jianzhi8.com/shixi/" target='_blank'>${city.simpleName}实习</a>
							</SPAN> ${city.simpleName}兼职类别&nbsp;&nbsp;
						</H2>
						<DIV class=c>
							<UL class=ul4>
								<LI>
									<A id=K01 href="http://${city.cityId}.jianzhi8.com/jianzhi/K01"><font
										color='#ff6600'>${city.simpleName}大学生兼职</font>
									</A>
								<LI>
									<A id=K02 href="http://${city.cityId}.jianzhi8.com/jianzhi/K02"><font
										color='#ff6600'>商品促销</font>
									</A>
								<LI>
									<A id=K03 href="http://${city.cityId}.jianzhi8.com/jianzhi/K03"><font
										color='#ff6600'>兼职打字员</font>
									</A>
								<LI>
									<A id=K04 href="http://${city.cityId}.jianzhi8.com/jianzhi/K04"><font
										color='#ff6600'>问卷/派发/调查</font>
									</A>
								<LI>
									<A id=K05 href="http://${city.cityId}.jianzhi8.com/jianzhi/K05">兼职会计</A>
								<LI>
									<A id=K06 href="http://${city.cityId}.jianzhi8.com/jianzhi/K06">业务/代理</A>
								<LI>
									<A id=K07 href="http://${city.cityId}.jianzhi8.com/jianzhi/K07">IT行业</A>
								<LI>
									<A id=K08 href="http://${city.cityId}.jianzhi8.com/jianzhi/K08">兼职翻译</A>
								<LI>
									<A id=K11 href="http://${city.cityId}.jianzhi8.com/jianzhi/K11">前台/客服/咨询</A>
								<LI>
									<A id=K09 href="http://${city.cityId}.jianzhi8.com/jianzhi/K09">广告/设计/排版</A>
								<LI>
									<A id=K13 href="http://${city.cityId}.jianzhi8.com/jianzhi/K13">家政/保姆</A>
								<LI>
									<A id=K12 href="http://${city.cityId}.jianzhi8.com/jianzhi/K12">店员/柜台</A>
								<LI>
									<A id=K14 href="http://${city.cityId}.jianzhi8.com/jianzhi/K14"><font
										color='#ff6600'>兼职家教</font>
									</A>
								<LI>
									<A id=K15 href="http://${city.cityId}.jianzhi8.com/jianzhi/K15">文秘/助理</A>
								<LI>
									<A id=K16 href="http://${city.cityId}.jianzhi8.com/jianzhi/K16"><font
										color='#ff6600'>歌手/模特/演员</font>
									</A>
								<LI>
									<A id=K17 href="http://${city.cityId}.jianzhi8.com/jianzhi/K17">导游/司仪</A>
								<LI>
									<A id=K18 href="http://${city.cityId}.jianzhi8.com/jianzhi/K18">教练/司机</A>
								<LI>
									<A id=K19 href="http://${city.cityId}.jianzhi8.com/jianzhi/K19">医疗/美容/护理</A>
								<LI>
									<A id=K21 href="http://${city.cityId}.jianzhi8.com/jianzhi/K21">建筑/装潢</A>
								<LI>
									<A id=K22 href="http://${city.cityId}.jianzhi8.com/jianzhi/K22">婚礼/庆典</A>
								<LI>
									<A id=K23 href="http://${city.cityId}.jianzhi8.com/jianzhi/K23">编辑/记者</A>
								<LI>
									<A id=K24 href="http://${city.cityId}.jianzhi8.com/jianzhi/K24"><font
										color='#ff6600'>${city.simpleName}KTV兼职</font>
									</A>
								<LI>
									<A id=K25 href="http://${city.cityId}.jianzhi8.com/shixi/">实习/学徒</A>
								<LI>
									<A id=K26 href="http://${city.cityId}.jianzhi8.com/jianzhi/K26"><font
										color='#ff6600'>钟点工/保洁</font>
									</A>
							</UL>
						</DIV>

						<H2>
							<SPAN> <A id=K27 href="http://${city.cityId}.jianzhi8.com/jianzhi/K27">其它兼职信息</A>&nbsp;
							</SPAN> ${city.simpleName}热门兼职招聘信息
						</H2>
						<c:forEach items="${items }" var="item">
						<DIV class=ccontlist>
							<H4>
								<A href="http://${city.cityId}.jianzhi8.com/jianzhi/${item[1].id.typeCode}">${city.simpleName}${item[1].id.typeName}</A>
							</H4>
							<UL class=ulls>
								<c:forEach items="${item[0]}" var="c">
								<LI<c:if test="${c.ding}"> class='ding'</c:if>>
									<SPAN>${c.updateTimeTxt2 }</SPAN>
									<A title="${c.ctTitle }" href="http://${city.cityId}.jianzhi8.com/a${c.ctNo }.html"
										target=_blank>${c.ctTitle }</A>
									<font title='已浏览${c.ctLooknum }次' style='color: #9D9D9D'>(<i>${c.ctLooknum }</i>)</font>
								</LI>
								</c:forEach>
							</UL>
							<UL></UL>
							<DIV class=c></DIV>
						</DIV>
						</c:forEach>
						<DIV class=c></DIV>
					</DIV>
					<DIV id=cc_right>
						<DIV class="cr_broder">
							<DIV class=c_r_inside>
								<H3>
									<SPAN><a href="http://${city.cityId}.jianzhi8.com/jianzhi/"
										rel="nofollow">更多&gt;&gt;</a>
									</SPAN><a href="http://${city.cityId}.jianzhi8.com/jianzhi/">最新${city.simpleName}兼职招聘信息</a>
								</H3>
								<UL class="ul">
									<c:forEach items="${latestList}" var="c">
									<LI<c:if test="${c.ding}"> class='ding'</c:if>>
										<A title="${c.ctTitle}"
											href="http://${city.cityId}.jianzhi8.com/a${c.ctNo}.html" target=_blank>${c.ctTitle}</A>
									</LI>
									</c:forEach>
								</UL>
							</DIV>
						</DIV>
						<DIV class="cr_broder" style="margin-top: 5px;">
							<DIV class=c_r_inside>
								<H3>
									<SPAN><a href="http://${city.cityId}.jianzhi8.com/rencai/"
										rel="nofollow">更多&gt;&gt;</a>
									</SPAN><a href="http://${city.cityId}.jianzhi8.com/rencai/">最新个人简历信息</a>
								</H3>
								<UL class="ul">
									<c:forEach items="${latestRencaiList}" var="c">
									<LI<c:if test="${c.ding}"> class='ding'</c:if>>
										<A title="${c.ctTitle}"
											href="http://${city.cityId}.jianzhi8.com/a${c.ctNo}.html" target=_blank>${c.ctTitle}</A>
									</LI>
									</c:forEach>
								</UL>
							</DIV>
						</DIV>
					</DIV>
					<DIV class=c></DIV>
				</DIV>
				<div id="footer">
					<DIV class=c>
						<DIV id=category>
							<UL class=kewords>
								热门搜索词:
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E5%8F%91%E5%8D%95%E5%91%98%E5%85%BC%E8%81%8C'>发单员</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E7%BF%BB%E8%AF%91%E5%85%BC%E8%81%8C'>翻译</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E4%BF%83%E9%94%80%E5%91%98%E5%85%BC%E8%81%8C'>促销员</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E5%B1%95%E4%BC%9A%E5%85%BC%E8%81%8C'>展会</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E7%A4%BC%E4%BB%AA%E5%85%BC%E8%81%8C'>礼仪</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E8%B7%AF%E6%BC%94%E5%85%BC%E8%81%8C'>路演</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E9%BA%A6%E5%BD%93%E5%8A%B3%E5%85%BC%E8%81%8C'>麦当劳</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E8%82%AF%E5%BE%B7%E5%9F%BA%E5%85%BC%E8%81%8C'>肯德基</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E5%8F%91%E5%B8%96%E5%91%98%E5%85%BC%E8%81%8C'>发帖员</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E6%99%9A%E4%B8%8A%E5%85%BC%E8%81%8C'>晚上</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E5%9B%BD%E5%BA%86%E5%85%BC%E8%81%8C'>国庆</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E6%A0%A1%E5%9B%AD%E4%BB%A3%E7%90%86%E5%85%BC%E8%81%8C'>校园代理</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E8%B5%84%E6%96%99%E5%BD%95%E5%85%A5%E5%85%BC%E8%81%8C'>资料录入</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E6%9A%91%E5%81%87%E5%85%BC%E8%81%8C'>暑假</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E5%8D%81%E4%B8%80%E5%85%BC%E8%81%8C'>十一</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E5%BD%95%E5%85%A5%E5%85%BC%E8%81%8C'>录入</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E9%AB%98%E8%96%AA%E5%85%BC%E8%81%8C'>高薪</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E5%91%A8%E8%96%AA%E5%85%BC%E8%81%8C'>周薪</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E6%97%A0%E7%BB%8F%E9%AA%8C%E5%85%BC%E8%81%8C'>无经验</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E4%BC%A0%E5%8D%95%E5%85%BC%E8%81%8C'>传单</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E8%B0%83%E6%9F%A5%E5%85%BC%E8%81%8C'>调查</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E5%91%A8%E6%9C%AB%E5%85%BC%E8%81%8C'>周末兼职</a>
								</li>
							</ul>
						</DIV>
						<c:if test="${not empty cityList }">
						<DIV class="hotCity greyLink">
							本省其他城市:
							<c:forEach items="${cityList}" var="c">
							<LI>
								<A href="http://${c.cityId}.jianzhi8.com/" id="${c.cityCode }">${c.simpleName}</A>
							</LI>
							</c:forEach>
						</DIV>
						</c:if>
						<DIV class="hotCity greyLink">
							热点城市:
							<li>
								<A href="http://bj.jianzhi8.com">北京兼职</A>
							</li>
							<li>
								<A href="http://suzhou.jianzhi8.com">苏州</A>
							</li>
							<li>
								<A href="http://sh.jianzhi8.com">上海兼职</A>
							</li>
							<li>
								<A href="http://fz.jianzhi8.com">福州</A>
							</li>
							<li>
								<A href="http://tj.jianzhi8.com">天津兼职</A>
							</li>
							<li>
								<A href="http://xa.jianzhi8.com">西安</A>
							</li>
							<li>
								<A href="http://cq.jianzhi8.com">重庆兼职</A>
							</li>
							<li>
								<A href="http://gz.jianzhi8.com">广州兼职</A>
							</li>
							<li>
								<A href="http://cs.jianzhi8.com">长沙</A>
							</li>
							<li>
								<A href="http://sz.jianzhi8.com">深圳兼职</A>
							</li>
							<li>
								<A href="http://nc.jianzhi8.com">南昌</A>
							</li>
							<li>
								<A href="http://cd.jianzhi8.com">成都兼职</A>
							</li>
							<li>
								<A href="http://heb.jianzhi8.com">哈尔滨</A>
							</li>
							<li>
								<A href="http://hz.jianzhi8.com">杭州兼职</A>
							</li>
							<li>
								<A href="http://zz.jianzhi8.com">郑州</A>
							</li>
							<li>
								<A href="http://nj.jianzhi8.com">南京兼职</A>
							</li>
							<li>
								<A href="http://dl.jianzhi8.com">大连</A>
							</li>
							<li>
								<A href="http://www.jianzhi8.com/index.html">更多...</A>
							</li>
						</DIV>
					</DIV>

					<DIV class="friend greyLink">
						友情链接:
						<c:forEach items="${linkList }" var="l">
						<a href="${l.linkHttp }" target="_blank">${l.linkName }</a>
						</c:forEach>
						
						<A href="http://www.jianzhi8.com/">兼职工作</A>
						<A href="http://www.jianzhi8.com/keyword-%E6%9A%91%E5%81%87" target='_blank'>暑假兼职</A>
						<A href="http://www.jianzhi8.com/keyword-%E5%91%A8%E6%9C%AB" target='_blank'>周末兼职</A>
						<A href="http://www.jianzhi8.com/">网上兼职</A>
						<A href="http://www.jianzhi8.com/keyword-%E5%8D%81%E4%B8%80" target='_blank'>十一兼职</A>
						<DIV class="copyright mw" id=copyright>
							<li>
								<a href="http://www.jianzhi8.com/lianxi.html" target="_blank"
									rel="nofollow">联系我们</a> |
								<a href="http://www.jianzhi8.com/ad.html" target="_blank"
									rel="nofollow">广告业务</a> |
								<a href="http://www.jianzhi8.com/zhiding.html" target="_blank"
									rel="nofollow">信息置顶</a> |
								<a href="http://www.jianzhi8.com/liuyan.jsp" rel="nofollow"
									target="_blank">站内留言</a>
							</li>
							<li>
								Copyright &copy; 2007-2011
								<span style="color: #000; TEXT-DECORATION: none">${city.simpleName}兼职网
									(jianzhi8.com)</span> 版权所有 &nbsp;&nbsp;
							</li>
							<li style="color: #990000">
								本站所有
								<a href="http://www.jianzhi8.com/"><font color='#990000'>兼职招聘信息</font>
								</a>均由网友自由发布，请仔细审核，${city.simpleName}兼职吧不承担任何由于内容的合法性及真实性所引起的一切争议和法律责任！
							</li>
							<li style="color: #990000">
								<a href="http://www.miibeian.gov.cn/" target="_blank"
									rel="nofollow">ICP证：京07038868号</a>
							</li>
						</div>
						<!--footer end-->
					</div>

					<!-- wrapper end -->
					<span style="display: none"> <script language="javascript"
							src="http://www.jianzhi8.com/js/tongji.js"></script> <script
							language="javascript"
							src="http://count42.51yes.com/click.aspx?id=421273759&logo=12"
							charset="gb2312"></script> </span>
	</BODY>
</HTML>


