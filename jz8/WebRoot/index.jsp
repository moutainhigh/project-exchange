<%@ page language="java" pageEncoding="GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="GBK" oncontextmenu="return false">
	<head>
		<title>${city.simpleName}��ְ��-${city.simpleName}��ѧ����ְ�� -��ְ��</title>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<meta http-equiv="Content-Language" content="GBK" />
		<meta name="keywords" content="${city.simpleName}��ְ��">
		<meta name="description" content="${city.simpleName}��ְ��ÿ����´�����${city.simpleName}��ְ��Ƹ��Ϣ;������������${city.simpleName}��ѧ����ְ,�ҽ�,�����ɷ�,ģ������,���ϼ�ְ����Ϣ;��������${city.simpleName}��ѧ����ְ����ѷ�����Ϣ��">
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
				<span><A href="http://www.jianzhi8.com/">��ְ</A>�� <A
					href="http://www.jianzhi8.com/zph/" target=_blank>��Ƹ��</A>�� <A
					href="http://www.jianzhi8.com/tuandui/" target=_blank>��ѧ����ְ�Ŷ�</A>��
					<A href="http://www.jianzhi8.com/gonggaolan.jsp" target=_blank>ƭ�ӹ�����</A>��
					<A href="http://www.jianzhi8.com/classinfo/" target=_blank>������Ϣ</A>��
					<a href="http://weibo.com/jianzhi8com" target="_blank"
					rel="nofollow">��ְ������΢��</a>�� <a href="http://t.qq.com/jianzhibacom"
					target="_blank" rel="nofollow">��ְ����Ѷ΢��</a> </span>
				<EM> <A href="http://www.jianzhi8.com/index.html">��վ����</A>�� <a
					name="StranLink">���w����</a>�� <a
					onclick="window.external.AddFavorite(location.href,document.title);"
					href="#">�����ղ�</a>�� </EM>
			</DIV>
			<DIV id=header>
				<table width="100%" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<TR>
						<td width="180" rowspan="2" align="center">
							<A href="/"> <IMG height=60 alt='${city.simpleName}��ְ��'
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
									href="http://www.jianzhi8.com/index.html">[�л�����]
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
							վ������:
							<input type="text" name="key" size="50" maxlength="20"
								class="search_jing"
								onFocus='this.style.color="#000000";if( "���磺���� �� ����" == this.value) this.value=""'
								value="���磺���� �� ����"
								style="FONT-SIZE: 12px; color: #CCCCCC; vertical-align: bottom;" />
							<input type="submit" name="submitLogin" value=" �� �� "
								id="btnLogin" />
							<a
								href='http://${city.cityId}.jianzhi8.com/s/%E6%89%93%E5%AD%97%E5%85%BC%E8%81%8C'>����</a>
							<a
								href='http://${city.cityId}.jianzhi8.com/s/%E4%BF%83%E9%94%80%E5%91%98%E5%85%BC%E8%81%8C'>����Ա</a>
							<a
								href='http://${city.cityId}.jianzhi8.com/s/%E5%AE%B6%E6%95%99%E5%85%BC%E8%81%8C'>�ҽ�</a>
							<a
								href='http://${city.cityId}.jianzhi8.com/s/%E6%A8%A1%E7%89%B9%E5%85%BC%E8%81%8C'>ģ��</a>
							<a
								href='http://${city.cityId}.jianzhi8.com/s/%E5%91%A8%E6%9C%AB%E5%85%BC%E8%81%8C'>��ĩ</a>
							<a
								href='http://${city.cityId}.jianzhi8.com/s/ktv%E5%85%BC%E8%81%8C'>ktv</a>
							<a
								href='http://${city.cityId}.jianzhi8.com/s/%E9%85%92%E5%90%A7%E5%85%BC%E8%81%8C'>�ư�</a>
							<a
								href='http://${city.cityId}.jianzhi8.com/s/%E4%BA%94%E4%B8%80%E5%85%BC%E8%81%8C'>��һ</a>
							<a
								href='http://${city.cityId}.jianzhi8.com/s/%E6%9A%91%E5%81%87%E5%85%BC%E8%81%8C'>���</a>
							<a
								href='http://${city.cityId}.jianzhi8.com/s/%E6%9A%91%E5%81%87%E5%B7%A5%E5%85%BC%E8%81%8C'>��ٹ�</a>
							<a
								href='http://${city.cityId}.jianzhi8.com/s/%E6%9A%91%E5%81%87%E5%AE%9E%E4%B9%A0'>���ʵϰ</a>
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
								target=_blank>��ѧ����ְ�Ŷ�QQȺ</A>&nbsp;&nbsp;&nbsp; <a
								href="http://${city.cityId}.jianzhi8.com/job/" target='_blank'>${city.simpleName}��Ƹ</a>&nbsp;&nbsp;&nbsp;
								<a href="http://${city.cityId}.jianzhi8.com/shixi/" target='_blank'>${city.simpleName}ʵϰ</a>
							</SPAN> ${city.simpleName}��ְ���&nbsp;&nbsp;
						</H2>
						<DIV class=c>
							<UL class=ul4>
								<LI>
									<A id=K01 href="http://${city.cityId}.jianzhi8.com/jianzhi/K01"><font
										color='#ff6600'>${city.simpleName}��ѧ����ְ</font>
									</A>
								<LI>
									<A id=K02 href="http://${city.cityId}.jianzhi8.com/jianzhi/K02"><font
										color='#ff6600'>��Ʒ����</font>
									</A>
								<LI>
									<A id=K03 href="http://${city.cityId}.jianzhi8.com/jianzhi/K03"><font
										color='#ff6600'>��ְ����Ա</font>
									</A>
								<LI>
									<A id=K04 href="http://${city.cityId}.jianzhi8.com/jianzhi/K04"><font
										color='#ff6600'>�ʾ�/�ɷ�/����</font>
									</A>
								<LI>
									<A id=K05 href="http://${city.cityId}.jianzhi8.com/jianzhi/K05">��ְ���</A>
								<LI>
									<A id=K06 href="http://${city.cityId}.jianzhi8.com/jianzhi/K06">ҵ��/����</A>
								<LI>
									<A id=K07 href="http://${city.cityId}.jianzhi8.com/jianzhi/K07">IT��ҵ</A>
								<LI>
									<A id=K08 href="http://${city.cityId}.jianzhi8.com/jianzhi/K08">��ְ����</A>
								<LI>
									<A id=K11 href="http://${city.cityId}.jianzhi8.com/jianzhi/K11">ǰ̨/�ͷ�/��ѯ</A>
								<LI>
									<A id=K09 href="http://${city.cityId}.jianzhi8.com/jianzhi/K09">���/���/�Ű�</A>
								<LI>
									<A id=K13 href="http://${city.cityId}.jianzhi8.com/jianzhi/K13">����/��ķ</A>
								<LI>
									<A id=K12 href="http://${city.cityId}.jianzhi8.com/jianzhi/K12">��Ա/��̨</A>
								<LI>
									<A id=K14 href="http://${city.cityId}.jianzhi8.com/jianzhi/K14"><font
										color='#ff6600'>��ְ�ҽ�</font>
									</A>
								<LI>
									<A id=K15 href="http://${city.cityId}.jianzhi8.com/jianzhi/K15">����/����</A>
								<LI>
									<A id=K16 href="http://${city.cityId}.jianzhi8.com/jianzhi/K16"><font
										color='#ff6600'>����/ģ��/��Ա</font>
									</A>
								<LI>
									<A id=K17 href="http://${city.cityId}.jianzhi8.com/jianzhi/K17">����/˾��</A>
								<LI>
									<A id=K18 href="http://${city.cityId}.jianzhi8.com/jianzhi/K18">����/˾��</A>
								<LI>
									<A id=K19 href="http://${city.cityId}.jianzhi8.com/jianzhi/K19">ҽ��/����/����</A>
								<LI>
									<A id=K21 href="http://${city.cityId}.jianzhi8.com/jianzhi/K21">����/װ��</A>
								<LI>
									<A id=K22 href="http://${city.cityId}.jianzhi8.com/jianzhi/K22">����/���</A>
								<LI>
									<A id=K23 href="http://${city.cityId}.jianzhi8.com/jianzhi/K23">�༭/����</A>
								<LI>
									<A id=K24 href="http://${city.cityId}.jianzhi8.com/jianzhi/K24"><font
										color='#ff6600'>${city.simpleName}KTV��ְ</font>
									</A>
								<LI>
									<A id=K25 href="http://${city.cityId}.jianzhi8.com/shixi/">ʵϰ/ѧͽ</A>
								<LI>
									<A id=K26 href="http://${city.cityId}.jianzhi8.com/jianzhi/K26"><font
										color='#ff6600'>�ӵ㹤/����</font>
									</A>
							</UL>
						</DIV>

						<H2>
							<SPAN> <A id=K27 href="http://${city.cityId}.jianzhi8.com/jianzhi/K27">������ְ��Ϣ</A>&nbsp;
							</SPAN> ${city.simpleName}���ż�ְ��Ƹ��Ϣ
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
									<font title='�����${c.ctLooknum }��' style='color: #9D9D9D'>(<i>${c.ctLooknum }</i>)</font>
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
										rel="nofollow">����&gt;&gt;</a>
									</SPAN><a href="http://${city.cityId}.jianzhi8.com/jianzhi/">����${city.simpleName}��ְ��Ƹ��Ϣ</a>
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
										rel="nofollow">����&gt;&gt;</a>
									</SPAN><a href="http://${city.cityId}.jianzhi8.com/rencai/">���¸��˼�����Ϣ</a>
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
								����������:
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E5%8F%91%E5%8D%95%E5%91%98%E5%85%BC%E8%81%8C'>����Ա</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E7%BF%BB%E8%AF%91%E5%85%BC%E8%81%8C'>����</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E4%BF%83%E9%94%80%E5%91%98%E5%85%BC%E8%81%8C'>����Ա</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E5%B1%95%E4%BC%9A%E5%85%BC%E8%81%8C'>չ��</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E7%A4%BC%E4%BB%AA%E5%85%BC%E8%81%8C'>����</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E8%B7%AF%E6%BC%94%E5%85%BC%E8%81%8C'>·��</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E9%BA%A6%E5%BD%93%E5%8A%B3%E5%85%BC%E8%81%8C'>����</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E8%82%AF%E5%BE%B7%E5%9F%BA%E5%85%BC%E8%81%8C'>�ϵ»�</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E5%8F%91%E5%B8%96%E5%91%98%E5%85%BC%E8%81%8C'>����Ա</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E6%99%9A%E4%B8%8A%E5%85%BC%E8%81%8C'>����</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E5%9B%BD%E5%BA%86%E5%85%BC%E8%81%8C'>����</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E6%A0%A1%E5%9B%AD%E4%BB%A3%E7%90%86%E5%85%BC%E8%81%8C'>У԰����</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E8%B5%84%E6%96%99%E5%BD%95%E5%85%A5%E5%85%BC%E8%81%8C'>����¼��</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E6%9A%91%E5%81%87%E5%85%BC%E8%81%8C'>���</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E5%8D%81%E4%B8%80%E5%85%BC%E8%81%8C'>ʮһ</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E5%BD%95%E5%85%A5%E5%85%BC%E8%81%8C'>¼��</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E9%AB%98%E8%96%AA%E5%85%BC%E8%81%8C'>��н</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E5%91%A8%E8%96%AA%E5%85%BC%E8%81%8C'>��н</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E6%97%A0%E7%BB%8F%E9%AA%8C%E5%85%BC%E8%81%8C'>�޾���</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E4%BC%A0%E5%8D%95%E5%85%BC%E8%81%8C'>����</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E8%B0%83%E6%9F%A5%E5%85%BC%E8%81%8C'>����</a>
								</li>
								<li>
									<a
										href='http://${city.cityId}.jianzhi8.com/s/%E5%91%A8%E6%9C%AB%E5%85%BC%E8%81%8C'>��ĩ��ְ</a>
								</li>
							</ul>
						</DIV>
						<c:if test="${not empty cityList }">
						<DIV class="hotCity greyLink">
							��ʡ��������:
							<c:forEach items="${cityList}" var="c">
							<LI>
								<A href="http://${c.cityId}.jianzhi8.com/" id="${c.cityCode }">${c.simpleName}</A>
							</LI>
							</c:forEach>
						</DIV>
						</c:if>
						<DIV class="hotCity greyLink">
							�ȵ����:
							<li>
								<A href="http://bj.jianzhi8.com">������ְ</A>
							</li>
							<li>
								<A href="http://suzhou.jianzhi8.com">����</A>
							</li>
							<li>
								<A href="http://sh.jianzhi8.com">�Ϻ���ְ</A>
							</li>
							<li>
								<A href="http://fz.jianzhi8.com">����</A>
							</li>
							<li>
								<A href="http://tj.jianzhi8.com">����ְ</A>
							</li>
							<li>
								<A href="http://xa.jianzhi8.com">����</A>
							</li>
							<li>
								<A href="http://cq.jianzhi8.com">�����ְ</A>
							</li>
							<li>
								<A href="http://gz.jianzhi8.com">���ݼ�ְ</A>
							</li>
							<li>
								<A href="http://cs.jianzhi8.com">��ɳ</A>
							</li>
							<li>
								<A href="http://sz.jianzhi8.com">���ڼ�ְ</A>
							</li>
							<li>
								<A href="http://nc.jianzhi8.com">�ϲ�</A>
							</li>
							<li>
								<A href="http://cd.jianzhi8.com">�ɶ���ְ</A>
							</li>
							<li>
								<A href="http://heb.jianzhi8.com">������</A>
							</li>
							<li>
								<A href="http://hz.jianzhi8.com">���ݼ�ְ</A>
							</li>
							<li>
								<A href="http://zz.jianzhi8.com">֣��</A>
							</li>
							<li>
								<A href="http://nj.jianzhi8.com">�Ͼ���ְ</A>
							</li>
							<li>
								<A href="http://dl.jianzhi8.com">����</A>
							</li>
							<li>
								<A href="http://www.jianzhi8.com/index.html">����...</A>
							</li>
						</DIV>
					</DIV>

					<DIV class="friend greyLink">
						��������:
						<c:forEach items="${linkList }" var="l">
						<a href="${l.linkHttp }" target="_blank">${l.linkName }</a>
						</c:forEach>
						
						<A href="http://www.jianzhi8.com/">��ְ����</A>
						<A href="http://www.jianzhi8.com/keyword-%E6%9A%91%E5%81%87" target='_blank'>��ټ�ְ</A>
						<A href="http://www.jianzhi8.com/keyword-%E5%91%A8%E6%9C%AB" target='_blank'>��ĩ��ְ</A>
						<A href="http://www.jianzhi8.com/">���ϼ�ְ</A>
						<A href="http://www.jianzhi8.com/keyword-%E5%8D%81%E4%B8%80" target='_blank'>ʮһ��ְ</A>
						<DIV class="copyright mw" id=copyright>
							<li>
								<a href="http://www.jianzhi8.com/lianxi.html" target="_blank"
									rel="nofollow">��ϵ����</a> |
								<a href="http://www.jianzhi8.com/ad.html" target="_blank"
									rel="nofollow">���ҵ��</a> |
								<a href="http://www.jianzhi8.com/zhiding.html" target="_blank"
									rel="nofollow">��Ϣ�ö�</a> |
								<a href="http://www.jianzhi8.com/liuyan.jsp" rel="nofollow"
									target="_blank">վ������</a>
							</li>
							<li>
								Copyright &copy; 2007-2011
								<span style="color: #000; TEXT-DECORATION: none">${city.simpleName}��ְ��
									(jianzhi8.com)</span> ��Ȩ���� &nbsp;&nbsp;
							</li>
							<li style="color: #990000">
								��վ����
								<a href="http://www.jianzhi8.com/"><font color='#990000'>��ְ��Ƹ��Ϣ</font>
								</a>�����������ɷ���������ϸ��ˣ�${city.simpleName}��ְ�ɲ��е��κ��������ݵĺϷ��Լ���ʵ���������һ������ͷ������Σ�
							</li>
							<li style="color: #990000">
								<a href="http://www.miibeian.gov.cn/" target="_blank"
									rel="nofollow">ICP֤����07038868��</a>
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


