<%@page contentType="text/html; charset=GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="GBK">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<meta http-equiv="Content-Language" content="gb2312" />
		<title>${city.simpleName}������ְ���� -��ְ��</title>
		<meta name="keywords" content='${city.simpleName}������ְ����' />
		<meta name="description" content="��ְ�����Ϊ���ṩ${city.simpleName}�����ĸ�����ְ������Ϣ,ÿ����´���${city.simpleName}������ְ������Ѷ��Ϣ,��ְ�˲ż�����ȫְ�˲ż�����,��������Ѳ���������ȫ��${city.simpleName}������ְ������Ϣ��" />
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
		'query' : '${city.simpleName}�˲�',
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
								<A href="/"> <IMG height=60 alt='${city.simpleName}��ְ��'
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
										href="http://www.jianzhi8.com/index.html">[�л�����]
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
					<A href="http://www.jianzhi8.com/">��ְ��</A>&nbsp;>&nbsp;
					<A href="http://www.jianzhi8.com/jianzhi/">��ְ����</A>&nbsp;>&nbsp;
					<A href="/">${city.simpleName}��ְ��</A>&nbsp;>&nbsp; 
					<c:choose>
					<c:when test="${empty ctClass}">
						���˼���
					</c:when>
					<c:when test="${ctClass==0}">
						<A href="/rencai/">���˼���</A>&nbsp;>&nbsp; 
						��ְ��ְ
					</c:when>
					<c:when test="${ctClass==1}">
						<A href="/rencai/">���˼���</A>&nbsp;>&nbsp; 
						�˲���Ƹ
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
								<A href="/rencai/">ȫ���˲�</A>
							</LI>
							<LI <c:if test="${ctClass=='0' }">Class='ltOn'</c:if>>
								<A href="/rencai/c0">��ְ�˲�</A>
							</LI>
							<LI <c:if test="${ctClass=='1' }">Class='ltOn'</c:if>>
								<A href="/rencai/c1">ȫְ�˲�</A>
							</LI>
						</UL>
						<A class=butListp href="http://my.jianzhi8.com/fb.do"
							target=_blank>�������˼���</A>

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
									<c:if test="${c.ding}"><font class='validate' title='��Ϣ�ö�'>��</font></c:if>
									<c:if test="${c.isYz=='1' && not empty c.userFile && c.userFile!='face.gif'}"><font title="����Ƭ" class="validate">ͼ</font></c:if>
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
							������
							<font color="red"> ${bean.totalRow }</font> ���� ��${bean.pageIndex }/${bean.maxPage } ҳ�� &nbsp;
							<c:if test="${!bean.isFirstPage}">
								<a href="/rencai/${typeId}c${ctClass}p1">��ҳ</a>
								<a href="/rencai/${typeId}c${ctClass}p${bean.prePageIndex}" class="pre">��ҳ</a>
							</c:if>
							${bean.pagerRencai }
							<c:if test="${!bean.isLastPage}">
							<A href='/rencai/${typeId}c${ctClass}p${bean.maxPage}' class='o'>${bean.maxPage}</A>&nbsp;&nbsp;
							</c:if>
							<c:if test="${!bean.isLastPage}">
								<a href="/rencai/${typeId}c${ctClass}p${bean.nextPageIndex}" class="nxt">��ҳ</a>
							</c:if>
							<a href="#" name="top" title='���ض���'><img
									src="/myimages/d_top.gif" align="bottom" border=0 alt="���ض���">
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
							վ�ڹؼ�������:
							<input type="text" name="key" size="60" maxlength="20"
								class="search_jing"
								onFocus='this.style.color="#000000";if( "���磺���� �� ����" == this.value) this.value=""'
								value="���磺���� �� ����"
								style="FONT-SIZE: 12px; color: #CCCCCC; vertical-align: bottom;" />
							<input type="submit" name="submitLogin" value=" �� �� "
								id="btnLogin" />
						</form>
						���Ŵ�:
						<a
							href='/s/%E6%9A%91%E6%9C%9F%E5%B7%A5%E5%85%BC%E8%81%8C'>���ڹ���ְ</a>&nbsp;
						<a href="http://sh.jianzhi8.com" target="_blank">�Ϻ���ְ</a>
						<a href="http://gz.jianzhi8.com" target="_blank">���ݼ�ְ</a>
						<a
							href='/s/%E5%AE%B6%E6%95%99%E5%85%BC%E8%81%8C'>${city.simpleName}��ְ�ҽ�</a>&nbsp;

						<a
							href='/s/%E7%BF%BB%E8%AF%91%E5%85%BC%E8%81%8C'>${city.simpleName}��ְ����</a>&nbsp;

						<a
							href='/s/%E4%BF%83%E9%94%80%E5%91%98%E5%85%BC%E8%81%8C'>����Ա</a>&nbsp;

						<a
							href='/s/%E5%B1%95%E4%BC%9A%E5%85%BC%E8%81%8C'>չ��</a>&nbsp;

						<a
							href='/s/%E7%A4%BC%E4%BB%AA%E5%85%BC%E8%81%8C'>����</a>&nbsp;

						<a
							href='/s/%E8%B7%AF%E6%BC%94%E5%85%BC%E8%81%8C'>·��</a>&nbsp;

						<a
							href='/s/%E9%BA%A6%E5%BD%93%E5%8A%B3%E5%85%BC%E8%81%8C'>����</a>&nbsp;

						<a
							href='/s/%E8%82%AF%E5%BE%B7%E5%9F%BA%E5%85%BC%E8%81%8C'>�ϵ»�</a>&nbsp;

						<a
							href='/s/%E6%89%93%E5%AD%97%E5%85%BC%E8%81%8C'>����</a>&nbsp;

						<a
							href='/s/%E6%A0%A1%E5%AF%B9%E5%85%BC%E8%81%8C'>У��</a>&nbsp;

						<a
							href='/s/%E9%97%AE%E5%8D%B7%E5%85%BC%E8%81%8C'>�ʾ�</a>&nbsp;

						<a
							href='/s/%E4%BC%A0%E5%8D%95%E5%85%BC%E8%81%8C'>����</a>&nbsp;

						<a
							href='/s/%E6%9A%91%E5%81%87%E5%85%BC%E8%81%8C'>���</a>&nbsp;

						<a
							href='/s/%E6%A0%A1%E5%9B%AD%E4%BB%A3%E7%90%86%E5%85%BC%E8%81%8C'>У԰����</a>&nbsp;

						<a
							href='/s/%E8%8B%B1%E8%AF%AD%E5%85%BC%E8%81%8C'>Ӣ��</a>&nbsp;

						<a
							href='/s/%E6%A8%A1%E7%89%B9%E5%85%BC%E8%81%8C'>ģ��</a>&nbsp;

						<a
							href='/s/%E6%BC%94%E5%91%98%E5%85%BC%E8%81%8C'>��Ա</a>&nbsp;

						<a href='/s/ktv%E5%85%BC%E8%81%8C'>ktv</a>&nbsp;

						<a
							href='/s/%E9%85%92%E5%90%A7%E5%85%BC%E8%81%8C'>�ư�</a>&nbsp;

						<a
							href='/s/%E6%9C%8D%E5%8A%A1%E5%91%98%E5%85%BC%E8%81%8C'>����Ա</a>&nbsp;

						<a
							href='/s/%E5%91%A8%E6%9C%AB%E5%85%BC%E8%81%8C'>��ĩ</a>&nbsp;

						<a
							href='/s/%E8%8B%B1%E8%AF%AD%E5%AE%B6%E6%95%99%E5%85%BC%E8%81%8C'>Ӣ��ҽ�</a>&nbsp;

					</div>
				</div>

				<c:if test="${not empty cityList}">
				<DIV id=category>
					<UL class=transverse>
						<b>${province.cityName}��������:</b>
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
						${city.simpleName}��ְ��������:
						������Ϣ�з���,��վ����${city.simpleName}������ְ������Ϣ�����������ɷ���������ϸ��ˣ���ְ����Ƹ�����е��������ݵĺϷ��Լ���ʵ���������һ������ͷ������Σ�
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

						<a href="http://www.jianzhi8.com/aboutus.jsp">��������</a>
						<A href="http://www.jianzhi8.com">��ְ</A>��
						<A href="/"><font color='#000000'>${city.simpleName}��ְ��Ƹ��</font>
						</A> ��Ȩ����


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
