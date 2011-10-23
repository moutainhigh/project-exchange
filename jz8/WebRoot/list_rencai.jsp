<%@page contentType="text/html; charset=GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="GBK">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<meta http-equiv="Content-Language" content="gb2312" />
		<title>${city.simpleName}个人求职简历 -兼职吧</title>
		<meta name="keywords" content='${city.simpleName}个人求职简历' />
		<meta name="description" content="兼职吧免费为您提供${city.simpleName}地区的个人求职简历信息,每天更新大量${city.simpleName}个人求职简历资讯信息,兼职人才简历和全职人才简历等,您可以免费查阅最新最全的${city.simpleName}个人求职简历信息。" />
		<STYLE type=text/css>
@import url(http://www.jianzhi8.com/comcity/mycss/scss5.css );
</STYLE>
		<script type="text/javascript" src="http://www.jianzhi8.com/comcity/jz8_js/Tooltips.js"></script>
		<link rel="Bookmark" href="/favicon.ico" />
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
		<script language="JavaScript" src="/js/jquery.js"></script>
		<script src="http://www.google.com/jsapi" type="text/javascript"></script>
		<script type="text/javascript" charset="utf-8">
	google.load('ads.search', '2');
	var pageOptions = {
		'pubId' : 'pub-5637832140118238',
		'query' : '${city.simpleName}人才',
		'hl' : 'zh-CN',
		'titleBold' : false,
		'rolloverLinkUnderline' : true,
		'rolloverLinkColor' : '#D50000',
		//'rolloverAdBackgroundColor' : '#F7F7F7',
		//'colorBackground' : '#f5f5f5', 
		//'colorAdSeparator' : '#e8e8e8',
		'channel' : '2901871596'
	}
</script>
	</head>
	<body>
		<DIV id=wrapper>
			<script language="JavaScript"
				src="http://www.jianzhi8.com/comcity/js/top.js"
				type="text/javascript"></script>
			<DIV id=header>
				<table width="100%" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<TBODY>
						<TR>
							<td width="200" rowspan="2" align="center">
								<A href="/"> <IMG height=60 alt='${city.simpleName}兼职网'
										src="/jz8_images/logo.gif" width=160 border=0> </A>
							</TD>
							<td width="150" align="center" rowspan="2" class="grey_font">
								<div class=CurrentPro>
									<b>${city.simpleName}</b>
								</div>
								<div>
									<A id=link_city_change
										onmouseover="document.getElementById('all_city').className='sc'"
										onmouseout="document.getElementById('all_city').className='hc'"
										href="http://www.jianzhi8.com/index.html">[切换城市]
										<DIV class=hc id=all_city>
											<IFRAME src="/jianzhi_ichangecity.htm" frameBorder=0
												width=380 scrolling=no height=225></IFRAME>
										</DIV> </A>
								</div>
							</td>
							<td align="center" valign="bottom" height="30">
								<iframe src="http://my.jianzhi8.com/include_top.jsp" height="30"
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
					</TBODY>
				</TABLE>
			</DIV>
			<!-- header end -->
			<DIV id=search2>
				<DIV id=searchBox2>
					<img align="bottom" alt=""
						src="http://www.jianzhi8.com/comcity/jz8_images/ico_arrow.gif" />
					<A href="http://www.jianzhi8.com/">兼职网</A>&nbsp;>&nbsp;
					<A href="http://www.jianzhi8.com/jianzhi/">兼职工作</A>&nbsp;>&nbsp;
					<A href="/">${city.simpleName}兼职网</A>&nbsp;>&nbsp; 
					<c:choose>
					<c:when test="${empty ctClass}">
						个人简历
					</c:when>
					<c:when test="${ctClass==0}">
						<A href="/rencai/">个人简历</A>&nbsp;>&nbsp; 
						兼职求职
					</c:when>
					<c:when test="${ctClass==1}">
						<A href="/rencai/">个人简历</A>&nbsp;>&nbsp; 
						人才招聘
					</c:when>
					</c:choose>
					<font color='#7f7f7f'>(${bean.totalRow })</font>
				</DIV>
				<div style='float: right;'>
					<SCRIPT language=JavaScript
						src="http://www.jianzhi8.com/comcity/ads/dz.js"
						type=text/javascript></SCRIPT>
				</div>
			</DIV>
			<!-- search end -->
			<DIV id=content>
				<DIV id=toRoot>
				</DIV>
				<DIV id=category>
					<UL class=transverse>
						<c:forEach items="${typeDAO.all}" var="t">
						<LI>
							<A href="/rencai/${t.id.typeCode}<c:if test="${ctClass=='0'}">c0</c:if><c:if test="${ctClass=='1'}">c1</c:if>" 
								id="${t.id.typeCode}" <c:if test="${typeId==t.id.typeCode}">style="color: rgb(255, 255, 255); background: none repeat scroll 0% 0% rgb(0, 64, 128);"</c:if>>${t.id.typeName}</A>
						</LI>
						</c:forEach>
					</UL>
				</DIV>
				<DIV id=main_search>
					<DIV class="pdt2 cl">
						<UL class=listTab id=listMainTab>
							<LI <c:if test="${empty ctClass }">Class='ltOn'</c:if>>
								<A href="/rencai/">全部人才</A>
							</LI>
							<LI <c:if test="${ctClass=='0' }">Class='ltOn'</c:if>>
								<A href="/rencai/c0">兼职人才</A>
							</LI>
							<LI <c:if test="${ctClass=='1' }">Class='ltOn'</c:if>>
								<A href="/rencai/c1">全职人才</A>
							</LI>
						</UL>
						<A class=butListp href="http://my.jianzhi8.com/fb.do"
							target=_blank>发布个人简历</A>

					</DIV>
					<DIV class=listTabMore></DIV>

					<div class=listInfo_ad style="margin-bottom: 0px;">
						<div id='adcontainer1' style='width: 680; margin-left: 4px;'></div>
					</div>
					<script>
	var options1 = {
		'container' : 'adcontainer1',
		'number' : 3,
		'width' : 'auto',
		'lines' : 2,
		'linkTarget' : '_blank',
		'fontFamily' : 'arial',
		'colorTitleLink' : '#0033cc',
		'colorText' : '#444444',
		'colorDomainLink' : '#444444',
		'fontSizeTitle' : '14px',
		'fontSizeDescription' : '13px',
		'fontSizeDomainLink' : '13px'
	}
	new google.ads.search.Ads(pageOptions, options1);
</script>
					<DIV class=listInfo>
						<table width="100%" id="listTbl" cellpadding="0" cellspacing="2"
							border="0">
							<!--tr ><td style="BORDER-bottom: #cccccc solid 1px ;"  height="2" colspan="2"></td></tr-->
							<SCRIPT language=JavaScript
								src='http://www.jianzhi8.com/comcity/ads/ding.js'
								type=text/javascript></SCRIPT>

							<c:forEach items="${bean.resultList}" var="c">
							<tr>
								<td width='650'>
									&nbsp;
									<a href='/a${c.ctNo}.html' target='_blank'>${c.title }</a>&nbsp;&nbsp;
									<c:if test="${c.ding}"><font class='validate' title='信息置顶'>顶</font></c:if>
									<c:if test="${c.isYz=='1' && not empty c.userFile && c.userFile!='face.gif'}"><font title="有照片" class="validate">图</font></c:if>
									&nbsp;(<a class='titlerblue greyLink ' href='/rencai/${c.typeId }'>${c.types }</a>)
									<br>
									&nbsp; ${c.simpleDes }...
								</td>
								<td align="right">
									${c.dateTxt }
								</td>
							</tr>
							<tr>
								<td style="BORDER-bottom: #cccccc dotted 1px;" height="2"
									colspan="2"></td>
							</tr>
							</c:forEach>

						</table>
					</DIV>
					<!--ads-->
					<div class=listInfo_ad
						style="BORDER-bottom: #cccccc dotted 1px; margin-bottom: 5px;">
						<div id='adcontainer2' style='width: 680; margin-left: 4px;'></div>
					</div>
					<script>
	var options2 = {
		'container' : 'adcontainer2',
		'number' : 4,
		'width' : 'auto',
		'lines' : 2,
		'linkTarget' : '_blank',
		'fontFamily' : 'arial',
		'colorTitleLink' : '#0033cc',
		'colorDomainLink' : '#555555',
		'colorText' : '#444444',
		'fontSizeTitle' : '14px',
		'fontSizeDescription' : '13px',
		'fontSizeDomainLink' : '13px'
	}
	new google.ads.search.Ads(pageOptions, options2);
</script>


					<DIV class=clear></DIV>

					<div class=p>
						<div style='float: right'>
							『最新
							<font color="red"> ${bean.totalRow }</font> 条』 『${bean.pageIndex }/${bean.maxPage } 页』 &nbsp;
							<c:if test="${!bean.isFirstPage}">
								<a href="/rencai/${typeId}c${ctClass}p1">首页</a>
								<a href="/rencai/${typeId}c${ctClass}p${bean.prePageIndex}" class="pre">上页</a>
							</c:if>
							${bean.pagerRencai }
							<c:if test="${!bean.isLastPage}">
							<A href='/rencai/${typeId}c${ctClass}p${bean.maxPage}' class='o'>${bean.maxPage}</A>&nbsp;&nbsp;
							</c:if>
							<c:if test="${!bean.isLastPage}">
								<a href="/rencai/${typeId}c${ctClass}p${bean.nextPageIndex}" class="nxt">下页</a>
							</c:if>
							<a href="#" name="top" title='返回顶端'><img
									src="/myimages/d_top.gif" align="bottom" border=0 alt="返回顶端">
							</a>
						</div>
						<div style='float: left'>
						</div>
					</div>

					<DIV class=clear></DIV>

					<!--Post Info-->
				</DIV>
				<!-- main end -->
				<!-- sidebar start -->
				<DIV id=sidebar_index>
					<DIV id=sidebarBox_index>
						<DIV class="cr_broder2">
							<DIV class=c_r_inside2>
								<SCRIPT language=JavaScript
									src="http://www.jianzhi8.com/comcity/jz8_ad_js/baidu-160-600.js"
									type=text/javascript></SCRIPT>
							</DIV>
						</DIV>
					</DIV>
				</DIV>
				<!-- sidebar end -->
				<DIV class=clear>
				</DIV>
				<div class="search_listing">
					<div class="list_bg">
						<form name="zpfbForm2" method="post" action="/search.do"
							onsubmit="return Check_Search(this);" target="_blank"
							style="margin: 0px;">
							站内关键词搜索:
							<input type="text" name="key" size="60" maxlength="20"
								class="search_jing"
								onFocus='this.style.color="#000000";if( "例如：促销 或 打字" == this.value) this.value=""'
								value="例如：促销 或 打字"
								style="FONT-SIZE: 12px; color: #CCCCCC; vertical-align: bottom;" />
							<input type="submit" name="submitLogin" value=" 搜 索 "
								id="btnLogin" />
						</form>
						热门词:
						<a
							href='/s/%E6%9A%91%E6%9C%9F%E5%B7%A5%E5%85%BC%E8%81%8C'>暑期工兼职</a>&nbsp;
						<a href="http://sh.jianzhi8.com" target="_blank">上海兼职</a>
						<a href="http://gz.jianzhi8.com" target="_blank">广州兼职</a>
						<a
							href='/s/%E5%AE%B6%E6%95%99%E5%85%BC%E8%81%8C'>${city.simpleName}兼职家教</a>&nbsp;

						<a
							href='/s/%E7%BF%BB%E8%AF%91%E5%85%BC%E8%81%8C'>${city.simpleName}兼职翻译</a>&nbsp;

						<a
							href='/s/%E4%BF%83%E9%94%80%E5%91%98%E5%85%BC%E8%81%8C'>促销员</a>&nbsp;

						<a
							href='/s/%E5%B1%95%E4%BC%9A%E5%85%BC%E8%81%8C'>展会</a>&nbsp;

						<a
							href='/s/%E7%A4%BC%E4%BB%AA%E5%85%BC%E8%81%8C'>礼仪</a>&nbsp;

						<a
							href='/s/%E8%B7%AF%E6%BC%94%E5%85%BC%E8%81%8C'>路演</a>&nbsp;

						<a
							href='/s/%E9%BA%A6%E5%BD%93%E5%8A%B3%E5%85%BC%E8%81%8C'>麦当劳</a>&nbsp;

						<a
							href='/s/%E8%82%AF%E5%BE%B7%E5%9F%BA%E5%85%BC%E8%81%8C'>肯德基</a>&nbsp;

						<a
							href='/s/%E6%89%93%E5%AD%97%E5%85%BC%E8%81%8C'>打字</a>&nbsp;

						<a
							href='/s/%E6%A0%A1%E5%AF%B9%E5%85%BC%E8%81%8C'>校对</a>&nbsp;

						<a
							href='/s/%E9%97%AE%E5%8D%B7%E5%85%BC%E8%81%8C'>问卷</a>&nbsp;

						<a
							href='/s/%E4%BC%A0%E5%8D%95%E5%85%BC%E8%81%8C'>传单</a>&nbsp;

						<a
							href='/s/%E6%9A%91%E5%81%87%E5%85%BC%E8%81%8C'>暑假</a>&nbsp;

						<a
							href='/s/%E6%A0%A1%E5%9B%AD%E4%BB%A3%E7%90%86%E5%85%BC%E8%81%8C'>校园代理</a>&nbsp;

						<a
							href='/s/%E8%8B%B1%E8%AF%AD%E5%85%BC%E8%81%8C'>英语</a>&nbsp;

						<a
							href='/s/%E6%A8%A1%E7%89%B9%E5%85%BC%E8%81%8C'>模特</a>&nbsp;

						<a
							href='/s/%E6%BC%94%E5%91%98%E5%85%BC%E8%81%8C'>演员</a>&nbsp;

						<a href='/s/ktv%E5%85%BC%E8%81%8C'>ktv</a>&nbsp;

						<a
							href='/s/%E9%85%92%E5%90%A7%E5%85%BC%E8%81%8C'>酒吧</a>&nbsp;

						<a
							href='/s/%E6%9C%8D%E5%8A%A1%E5%91%98%E5%85%BC%E8%81%8C'>服务员</a>&nbsp;

						<a
							href='/s/%E5%91%A8%E6%9C%AB%E5%85%BC%E8%81%8C'>周末</a>&nbsp;

						<a
							href='/s/%E8%8B%B1%E8%AF%AD%E5%AE%B6%E6%95%99%E5%85%BC%E8%81%8C'>英语家教</a>&nbsp;

					</div>
				</div>

				<c:if test="${not empty cityList}">
				<DIV id=category>
					<UL class=transverse>
						<b>${province.cityName}其他城市:</b>
						<c:forEach items="${cityList}" var="r">
						<LI>
							<A href="http://${r.cityId}.jianzhi8.com/rencai/" id="${r.cityCode}">${r.simpleName}</A>
						</LI>
						</c:forEach>
					</UL>
				</DIV>
				<script language="javascript" type="">
     document.getElementById("${city.cityCode}").style.color="#ffffff";
   document.getElementById("${city.cityCode}").style.background="#004080";

</script>
				</c:if>

				<DIV style="margin-top: 1px;">
					<P
						style="text-align: left; PADDING-LEFT: 5px; padding-top: 10px; padding-bottom: 10px; color: #990000">
						${city.simpleName}兼职吧提醒您:
						网上信息有风险,本站所有${city.simpleName}个人求职简历信息均由网友自由发布，请仔细审核，兼职吧招聘网不承担由于内容的合法性及真实性所引起的一切争议和法律责任！
					</P>
				</DIV>

			</div>
			<!-- content end -->
			<script language="javascript" type="">
  
</script>

			<div id="footer">
				<DIV class=c>

				</DIV>
				<DIV class="copyright mw" id=copyright>
					<li>

						<a href="http://www.jianzhi8.com/aboutus.jsp">关于我们</a>
						<A href="http://www.jianzhi8.com">兼职</A>吧
						<A href="/"><font color='#000000'>${city.simpleName}兼职招聘网</font>
						</A> 版权所有


					</li>
				</DIV>
			</div>
			<!--footer end-->
		</div>
		<script language="javascript"
			src="http://www.jianzhi8.com/js/tongji.js"></script>
		<span style="display: none"> <script
				src="http://s20.cnzz.com/stat.php?id=3307092&web_id=3307092"
				language="JavaScript"></script> </span>
		<div id="sl">
			<a href="#" _fcksavedurl="#"></a>
		</div>
		<!-- wrapper end -->
	</BODY>
</HTML>
