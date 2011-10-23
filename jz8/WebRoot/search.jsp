<%@page contentType="text/html; charset=GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="GBK">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<meta http-equiv="Content-Language" content="gb2312" />
		<title>${city.simpleName}${key}兼职-兼职吧</title>
		<meta name="keywords" content='${city.simpleName}${key}兼职' />
		<meta name="description" content='${city.simpleName}兼职网为您提供大量${city.simpleName}${key}兼职信息,您可以免费查询兼职${key}、${key}工作岗位等信息,同时您还可以免费发布${city.simpleName}${key}兼职信息。' />
		<STYLE type=text/css>
@import url(http://www.jianzhi8.com/comcity/mycss/scss5.css );
</STYLE>
		<script type="text/javascript" src="http://www.jianzhi8.com/comcity/jz8_js/Tooltips.js"></script>
		<link rel="Bookmark" href="http://www.jianzhi8.com/comcity/favicon.ico" />
		<link rel="shortcut icon" href="http://www.jianzhi8.com/comcity/favicon.ico" type="image/x-icon" />
		<script language="JavaScript" src="/js/jquery.js"></script>
		<script type="text/javascript">  
		String.prototype.replaceAll = function(reallyDo, replaceWith, ignoreCase) {  
			if (!RegExp.prototype.isPrototypeOf(reallyDo)) {  
		        return this.replace(new RegExp(reallyDo, (ignoreCase ? "gi": "g")), replaceWith);  
		    } else {  
		        return this.replace(reallyDo, replaceWith);  
		    }  
		}  
		</script>  
		<script src="http://www.google.com/jsapi" type="text/javascript"></script>
		<script type="text/javascript" charset="utf-8">
	google.load('ads.search', '2');
	var pageOptions = {
		'pubId' : 'pub-5637832140118238',
		'query' : '${key}招聘',
		'hl' : 'zh-CN',
		'titleBold' : false,
		'rolloverLinkUnderline' : true,
		'rolloverLinkColor' : '#D50000',
		'rolloverAdBackgroundColor' : '#F7F7F7',
		//'colorAdSeparator' : '#e8e8e8',
		//'colorBackground' : '#f5f5f5', 
		'channel' : '2901871596'
	}
		$(function(){
			var key = '${key}';
			if(key != ''){
				$(".listInfo td").each(function(){
					var html = $(this).html();
					if(html.indexOf(key) > -1){
						html = html.replaceAll(key,"<font color='red'>"+key+"</font>");
						$(this).html(html);
					}
				});
			}
		});
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
										src="http://www.jianzhi8.com/comcity/jz8_images/logo.gif"
										width=160 border=0> </A>
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
											<IFRAME
												src="http://www.jianzhi8.com/comcity/jianzhi_ichangecity.htm"
												frameBorder=0 width=380 scrolling=no height=225></IFRAME>
										</DIV> </A>
								</div>
							</td>
							<td align="center" valign="bottom" height="30">
								<iframe src="http://my.jianzhi8.com/include_top.html"
									height="30" width="100%" scrolling="no" frameborder="0"></iframe>
							</td>
							<td width="160" rowspan="3" align="left" valign="bottom">
								<A href="http://my.jianzhi8.com/fb.do"> <IMG
										src="http://www.jianzhi8.com/comcity/myimages/p1.gif"
										border="0" alt="">
								</A>
							</td>
						</tr>
						<tr>
							<TD height="40" valign='bottom'>
								<div>
									<ul class="TabBarLevel1" id="TabPage1">
										<LI>
											<A href="/"><SPAN><b>${city.simpleName}首页</b>
											</SPAN>
											</A>
										</LI>
										<LI>
											<A href="/jianzhi/"><SPAN>兼职工作</SPAN>
											</A>
										</LI>
										<LI>
											<A href="/job/"><SPAN>全职工作</SPAN>
											</A>
										</LI>
										<LI>
											<A href="/jianzhi/c0">个人简历</A>
										</LI>
										<LI>
											<A href="http://soho.jianzhi8.com" target="_blank"><SPAN>网上兼职</SPAN>
											</A>
										</LI>
									</ul>
								</div>
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
					<A href="/jianzhi/">${city.simpleName}兼职工作</A>&nbsp;>&nbsp; ${city.simpleName}${key}兼职
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
					<!--DIV id=category>
      </DIV-->
				</DIV>
				<div class="search_listing">
					<div class="list_bg">
						<form name="zpfbForm2" method="post" action="/search.do"
							onsubmit="return Check_Search(this);" target="_blank"
							style="margin: 0px;">
							站内关键词搜索:
							<input type="text" name="key" size="40" maxlength="20"
								class="search_jing"
								onFocus='this.style.color="#000000";if( "例如：促销 或 打字" == this.value) this.value=""'
								value="${key}"
								style="FONT-SIZE: 12px; color: #CCCCCC; vertical-align: bottom;" />
							<input type="submit" name="submitLogin" value=" 站内搜索 "
								id="btnLogin" />
						</form>
						热门词:
						<a href='/s/${city.simpleName}暑期工'>暑期工</a>&nbsp;
						<a href="http://bj.jianzhi8.com" target="_blank">北京兼职</a>
						<a href="http://sh.jianzhi8.com" target="_blank">上海兼职</a>
						<c:forEach items="${words}" var="w">
						<a href='/s/${city.simpleName}${w}兼职'>${w}</a>&nbsp;
						</c:forEach>
					</div>
				</div>

				<DIV id=main_search>
					<DIV class="pdt2 cl">
						<UL class=listTab id=listMainTab>
							<LI <c:if test="${empty kind}">Class='ltOn'</c:if>>
								<A href="/s/${key}">${key}兼职信息</A>
							</LI>
							<LI <c:if test="${kind=='1'}">Class='ltOn'</c:if>>
								<A href="/sk1/${key}">招聘</A>
							</LI>
							<LI <c:if test="${kind=='0'}">Class='ltOn'</c:if>>
								<A href="/sk0/${key}">求职</A>
							</LI>


						</UL>
						<A class=butListp href="http://my.jianzhi8.com/fb.do"
							target=_blank>发布我的${key}信息</A>
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
		'colorText' : '#000000',
		'colorDomainLink' : '#000000',
		'fontSizeTitle' : '14px',
		'fontSizeDescription' : '13px',
		'fontSizeDomainLink' : '13px'
	}
	new google.ads.search.Ads(pageOptions, options1);
</script>

					<DIV class=listInfo>
						<table width="100%" id="listTbl" cellpadding="0" cellspacing="2"
							border="0">
							<!--tr ><td style="BORDER-bottom: #cccccc solid 1px ;"  height="1" colspan="2"></td></tr-->

							<c:forEach items="${bean.resultList}" var="c">
							<tr>
								<td width='650'>
									&nbsp;
									<a href='/a${c.ctNo}.html' target='_blank'>${c.title }</a>&nbsp;&nbsp;
									<c:if test="${c.ding}"><font class='validate' title='信息置顶'>顶</font></c:if>
									<c:if test="${c.isYz=='1'}"><font class='validate' title='营业执照已验证'>验</font></c:if>
									<c:if test="${c.isYz=='1' && not empty c.userFile && c.userFile!='face.gif'}"><font title="有照片" class="validate">图</font></c:if>
									&nbsp;(<a class='titlerblue greyLink ' href='/jianzhi/${c.typeId }'>${c.types }</a>)
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
		'colorDomainLink' : '#000000',
		'colorText' : '#000000',
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
								<a href="/sk${kind}/${key}-1">首页</a>
								<a href="/sk${kind}/${key}-${bean.prePageIndex}" class="pre">上页</a>
							</c:if>
							${bean.pagerSearch }
							<c:if test="${!bean.isLastPage}">
							<A href='/sk${kind}/${key}-${bean.maxPage}' class='o'>${bean.maxPage}</A>&nbsp;&nbsp;
							</c:if>
							<c:if test="${!bean.isLastPage}">
								<a href="/sk${kind}/${key}-${bean.nextPageIndex}" class="nxt">下页</a>
							</c:if>
							<a href="#" name="top" title='返回顶端'><img
									src="/myimages/d_top.gif" align="bottom" border=0 alt="返回顶端">
							</a>
						</div>
						<div style='float: left'>
						</div>
					</div>
					<DIV class=clear></DIV>


					<DIV class=clear></DIV>
					<!--Post Info-->
				</DIV>
				<!-- main end -->
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


				<DIV id=category>
					<UL class=transverse>
						<b>${province.cityName}其他城市:</b>
						<li>
							<A href="http://www.jianzhi8.com/keyword-${key}" target="_blank">${key}兼职</A>
						</li>
						<c:forEach items="${cityList }" var="c">
						<LI>
							<A
								href="http://${c.cityId }.jianzhi8.com/sk${kind}/${c.simpleName}${key}兼职"
								id="${c.cityCode }">${c.simpleName}${key}兼职</A>
						</LI>
						</c:forEach>
					</UL>
				</DIV>
				<script language="javascript" type="">
document.getElementById("${city.cityCode}").style.color="red";
</script>


				<DIV style="margin-top: 1px;">
					<P
						style="text-align: left; PADDING-LEFT: 5px; padding-top: 10px; padding-bottom: 10px; color: #990000">
						${city.simpleName}兼职吧提醒您:
						网上信息有风险,本站所有${city.simpleName}java兼职信息均由网友自由发布，请仔细审核，兼职吧招聘网不承担由于内容的合法性及真实性所引起的一切争议和法律责任！
					</P>
				</DIV>
			</DIV>
			<!-- content end -->
			<script language="javascript" type="">
  
</script>

			<div id="footer">
				<DIV class=c>

				</DIV>
				<DIV class="copyright mw" id=copyright>
					<li>
						<a href="http://www.jianzhi8.com/about.html" target="_blank">关于我们</a>
						|
						<A href="http://www.jianzhi8.com">兼职</A>吧 |
						<A href="http://www.jianzhi8.com/" target="_blank">网上兼职</A> |
						<A href="/"><font color='#000000'>${city.simpleName}兼职招聘网</font>
						</A>

					</li>
				</DIV>
			</div>
			<!--footer end-->
		</div>
		<script language="javascript"
			src="http://www.jianzhi8.com/js/tongji.js"></script>
		<span style="display: none"> <script language="javascript"
				src="http://count42.51yes.com/click.aspx?id=421273759&logo=12"
				charset="gb2312"></script> </span>
		<div id="sl">
			<a href="#" _fcksavedurl="#"></a>
		</div>
		<!-- wrapper end -->
	</BODY>
</HTML>
