<%@page contentType="text/html; charset=GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="GBK">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<meta http-equiv="Content-Language" content="gb2312" />
		<title>${city.simpleName}${key}��ְ-��ְ��</title>
		<meta name="keywords" content='${city.simpleName}${key}��ְ' />
		<meta name="description" content='${city.simpleName}��ְ��Ϊ���ṩ����${city.simpleName}${key}��ְ��Ϣ,��������Ѳ�ѯ��ְ${key}��${key}������λ����Ϣ,ͬʱ����������ѷ���${city.simpleName}${key}��ְ��Ϣ��' />
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
		'query' : '${key}��Ƹ',
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
								<A href="/"> <IMG height=60 alt='${city.simpleName}��ְ��'
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
										href="http://www.jianzhi8.com/index.html">[�л�����]
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
											<A href="/"><SPAN><b>${city.simpleName}��ҳ</b>
											</SPAN>
											</A>
										</LI>
										<LI>
											<A href="/jianzhi/"><SPAN>��ְ����</SPAN>
											</A>
										</LI>
										<LI>
											<A href="/job/"><SPAN>ȫְ����</SPAN>
											</A>
										</LI>
										<LI>
											<A href="/jianzhi/c0">���˼���</A>
										</LI>
										<LI>
											<A href="http://soho.jianzhi8.com" target="_blank"><SPAN>���ϼ�ְ</SPAN>
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
					<A href="http://www.jianzhi8.com/">��ְ��</A>&nbsp;>&nbsp;
					<A href="http://www.jianzhi8.com/jianzhi/">��ְ����</A>&nbsp;>&nbsp;
					<A href="/">${city.simpleName}��ְ��</A>&nbsp;>&nbsp;
					<A href="/jianzhi/">${city.simpleName}��ְ����</A>&nbsp;>&nbsp; ${city.simpleName}${key}��ְ
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
							վ�ڹؼ�������:
							<input type="text" name="key" size="40" maxlength="20"
								class="search_jing"
								onFocus='this.style.color="#000000";if( "���磺���� �� ����" == this.value) this.value=""'
								value="${key}"
								style="FONT-SIZE: 12px; color: #CCCCCC; vertical-align: bottom;" />
							<input type="submit" name="submitLogin" value=" վ������ "
								id="btnLogin" />
						</form>
						���Ŵ�:
						<a href='/s/${city.simpleName}���ڹ�'>���ڹ�</a>&nbsp;
						<a href="http://bj.jianzhi8.com" target="_blank">������ְ</a>
						<a href="http://sh.jianzhi8.com" target="_blank">�Ϻ���ְ</a>
						<c:forEach items="${words}" var="w">
						<a href='/s/${city.simpleName}${w}��ְ'>${w}</a>&nbsp;
						</c:forEach>
					</div>
				</div>

				<DIV id=main_search>
					<DIV class="pdt2 cl">
						<UL class=listTab id=listMainTab>
							<LI <c:if test="${empty kind}">Class='ltOn'</c:if>>
								<A href="/s/${key}">${key}��ְ��Ϣ</A>
							</LI>
							<LI <c:if test="${kind=='1'}">Class='ltOn'</c:if>>
								<A href="/sk1/${key}">��Ƹ</A>
							</LI>
							<LI <c:if test="${kind=='0'}">Class='ltOn'</c:if>>
								<A href="/sk0/${key}">��ְ</A>
							</LI>


						</UL>
						<A class=butListp href="http://my.jianzhi8.com/fb.do"
							target=_blank>�����ҵ�${key}��Ϣ</A>
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
									<c:if test="${c.ding}"><font class='validate' title='��Ϣ�ö�'>��</font></c:if>
									<c:if test="${c.isYz=='1'}"><font class='validate' title='Ӫҵִ������֤'>��</font></c:if>
									<c:if test="${c.isYz=='1' && not empty c.userFile && c.userFile!='face.gif'}"><font title="����Ƭ" class="validate">ͼ</font></c:if>
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
							������
							<font color="red"> ${bean.totalRow }</font> ���� ��${bean.pageIndex }/${bean.maxPage } ҳ�� &nbsp;
							<c:if test="${!bean.isFirstPage}">
								<a href="/sk${kind}/${key}-1">��ҳ</a>
								<a href="/sk${kind}/${key}-${bean.prePageIndex}" class="pre">��ҳ</a>
							</c:if>
							${bean.pagerSearch }
							<c:if test="${!bean.isLastPage}">
							<A href='/sk${kind}/${key}-${bean.maxPage}' class='o'>${bean.maxPage}</A>&nbsp;&nbsp;
							</c:if>
							<c:if test="${!bean.isLastPage}">
								<a href="/sk${kind}/${key}-${bean.nextPageIndex}" class="nxt">��ҳ</a>
							</c:if>
							<a href="#" name="top" title='���ض���'><img
									src="/myimages/d_top.gif" align="bottom" border=0 alt="���ض���">
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
						<b>${province.cityName}��������:</b>
						<li>
							<A href="http://www.jianzhi8.com/keyword-${key}" target="_blank">${key}��ְ</A>
						</li>
						<c:forEach items="${cityList }" var="c">
						<LI>
							<A
								href="http://${c.cityId }.jianzhi8.com/sk${kind}/${c.simpleName}${key}��ְ"
								id="${c.cityCode }">${c.simpleName}${key}��ְ</A>
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
						${city.simpleName}��ְ��������:
						������Ϣ�з���,��վ����${city.simpleName}java��ְ��Ϣ�����������ɷ���������ϸ��ˣ���ְ����Ƹ�����е��������ݵĺϷ��Լ���ʵ���������һ������ͷ������Σ�
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
						<a href="http://www.jianzhi8.com/about.html" target="_blank">��������</a>
						|
						<A href="http://www.jianzhi8.com">��ְ</A>�� |
						<A href="http://www.jianzhi8.com/" target="_blank">���ϼ�ְ</A> |
						<A href="/"><font color='#000000'>${city.simpleName}��ְ��Ƹ��</font>
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
