<%@page contentType="text/html; charset=GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="GBK">
	<head>
		<title>${city.simpleName}${c.ctTitle }</title>
		<meta name="keywords" content='${city.simpleName}${c.ctTitle }' />
		<meta name="description" content='${city.simpleName}${c.ctTitle }������Ϣ,�����ṩ${user.userCompanyName}������${city.simpleName}���µ�${c.ctTitle }������Ѷ,������Щ��˾����Ƹ${c.ctTitle }��${city.simpleName}${ctClass}${t.id.typeName }���¼${city.simpleName}��ְ�ɲ鿴��'>

		<meta http-equiv="Content-Type" content="text/html; charset=GBK">
		<link href="http://www.jianzhi8.com/comcity/mycss/jobview.css" rel="stylesheet" type="text/css">
		<LINK href="http://www.jianzhi8.com/comcity/mycss/common.css" type=text/css rel=stylesheet>
		<script language="JavaScript" src="http://www.jianzhi8.com/comcity/js/shadu.js" type=""></script>
		<script language="JavaScript" src="http://www.jianzhi8.com/comcity/myjs/vi.js" type=""></script>
		<script language="JavaScript" src="http://my.jianzhi8.com/myjs/image.js" type=""></script>
		<script language="JavaScript" src="http://www.jianzhi8.com/comcity/myjs/searchjobcommon.js" type=""></script>
		<script language="JavaScript" src="/js/jquery.js"></script>
		<link href="http://www.jianzhi8.com/comcity/favicon.ico" type="image/x-icon" rel="shortcut icon" />
		<link href="http://www.jianzhi8.com/comcity/favicon.ico" type="image/x-icon" rel="bookmark" />
	</head>
	<body>
		<div class="vlayout">
			<DIV
				style="WIDTH: 100%; TEXT-ALIGN: center; margin-left: auto; margin-right: auto;">
				<TABLE style="WIDTH: 100%;" border="0">
					<TBODY>
						<TR>
							<TD style="WIDTH: 160" align=left rowSpan=2 width="150px;">
								<A href="/" name=top> <IMG alt='${city.simpleName}��ְ��'
										src="http://www.jianzhi8.com/comcity/jz8_images/logo.gif"
										width="160" height="60">
								</A>
							</TD>
							<td rowSpan=2 align=center>
								<div class='CurrentPro grey_font'>
									<b>${city.simpleName}</b>
								</div>
								<div>
									<A id=link_city_change
										onmouseover="document.getElementById('all_city').className='sc'"
										onmouseout="document.getElementById('all_city').className='hc'"
										href="http://www.jianzhi8.com/index.html">[�л�����]
										<DIV class=hc id=all_city>
											<IFRAME src="http://www.jianzhi8.com/ichangecity.htm"
												frameBorder=0 width=380 scrolling=no height=225></IFRAME>
										</DIV> </A>
								</div>
							</td>
							<TD align="center" valign="top" height="0">

								<!--iframe src="http://my.jianzhi8.com/include_top.jsp" height="30" width="100%" scrolling="no" frameborder="0"></iframe-->
							</TD>
						</TR>
						<TR>
							<TD style="WIDTH: 57%" align=right height="30">
								<table width="100%" border="0">
									<tr>
										<td>
											<SCRIPT language=JavaScript
												src="http://www.jianzhi8.com/comcity/jz8_ad_js/vgoogle.js"
												type=text/javascript></SCRIPT>
										</td>

										<td align="center">
											<A href="http://my.jianzhi8.com/fb.do"><IMG
													src="http://www.jianzhi8.com/comcity/myimages/p1.gif"
													border="0" alt="">
											</A> &nbsp;
										</td>
								</table>
							</TD>
						</TR>
					</TBODY>
				</TABLE>
			</DIV>

			<div class="topdiv" style="width: 950px;">

				<span title="����ܴ���">&nbsp;&nbsp; &nbsp; &nbsp; �����&nbsp;<font
					color="red">${c.ctLooknum }</font>&nbsp;��</span>
				<img alt=""	src="http://www.jianzhi8.com/comcity/myimages/ico_arrow.gif" />
				&nbsp;
				<A href="http://www.jianzhi8.com/">��ְ��</A>&nbsp;>&nbsp;
				<A href="http://www.jianzhi8.com/jianzhi/">��ְ����</A>&nbsp;>&nbsp;
				<a href="/">${city.simpleName}��ѧ����ְ��</a>&nbsp;>&nbsp;
				<a href="/${cateName}/">${city.simpleName}��ְ����</a>&nbsp;>&nbsp;
				<a href="/${cateName}/${t.id.typeCode }">${city.simpleName}${ctClass }${t.id.typeName }</a> &nbsp;
			</div>
			<div class=v_content>
				<DIV id=v_main>
					<DIV class="jobName">
						<H1 class=jobName-h1 title="${c.ctTitle}">
							${kind }-${c.ctTitle}<c:if test="${c.ctIsyz=='1'}"><font color="red">[Ӫҵִ������֤]</font></c:if>
							<input name="pno" value="1079641" type="hidden">
							<input name="user_id" value="2295819070" type="hidden">
						</H1>
					</DIV>
					<script language="javascript">
	function favo2() {
		var mindx = document.all.pno.value;
		window.open('http://my.jianzhi8.com/post_ptoc.jsp?pno=' + mindx,
				'NewWindow');
	}
	function post2() {
		var mindx = document.all.pno.value;
		var mindx2 = document.all.user_id.value;
		window.open('http://my.jianzhi8.com/ptoc.jsp?pno=' + mindx + '&uid='
				+ mindx2, 'NewWindow');
	}
</script>


					<DIV class=tabbox>
						<UL class=compoper>
							<LI>
								<SPAN class=three></SPAN><A onclick="javascript:post2();"
									href="javascript:void(0);" rel=nofollow><STRONG>Ͷ�ݼ���</STRONG>
								</A>
							</LI>
							<LI>
								<SPAN class=one></SPAN><A onclick="javascript:favo2();"
									href="javascript:void(0);" rel=nofollow><STRONG>�����ղؼ�</STRONG>
								</A>
							</LI>
						</UL>
						<UL class=tabcnt>
							<LI id=jobinfo_tab class=ui-tabs-selected onclick=jobHide();>
								<A href="javascript:void(0);">ְλ��Ϣ</A>
							</LI>
							<c:if test="${c.ctUserId!='admin' && not empty user.userBrief}">
							<LI id=companyinfo_tab onclick=jobShow();>
								<A href="javascript:void(0);">��˾����</A>
							</LI>
							</c:if>
						</UL>
					</DIV>
					<DIV id=jobinfo>
						<DIV class="jobInfo box clearfix">
							<TABLE class=jobInfo-table>
								<COLGROUP>
									<COL class=graycol>
									<COL>
									<COL class=graycol>

									<COL>
								</COLGROUP>
								<TR>
									<TD class=center>
										ְλ���
									</TD>
									<TD colSpan=3>
										${t.id.typeName }
									</TD>
								</TR>
								<TR>
									<TD class=center>
										�����ص�
									</TD>

									<TD>
										${c.ctCityName}
									</TD>
									<TD class=center>
										ְλ����
									</TD>
									<TD>
										${kind }
									</TD>
								</TR>
								<TR>
									<TD class=center>
										���ʴ���
									</TD>
									<TD>
										${c.ctSalary }
									</TD>

									<TD class=center>
										ѧ��Ҫ��
									</TD>
									<TD>
										${c.ctDigree }
									</TD>
								</TR>
								<TR>
									<TD class=center>
										��Ƹ����
									</TD>
									<TD>
										${c.ctJobnum==0?'����':c.ctJobnum }��
									</TD>
									<TD class=center>
										����ʱ��
									</TD>

									<TD>
										${c.updateTimeTxt }
									</TD>
								</TR>
							</TABLE>
						</DIV>
						<DIV class="jobdisc box">
							<H2 class=modAA-h2>
								ְλ����
								<SPAN class=modAA-h2-companyName></SPAN>
							</H2>
							<P class=jobdisc-cnt
								style="LINE-HEIGHT: 1.5; word-wrap: break-word; word-break: break-all;">
								${c.ctContent }
								<BR>
								��ϵ��ʱ��һ��˵�����ڼ�ְ���Ͽ����Ĵ���Ϣ��лл��

							</P>
						</DIV>
					</DIV>
					<c:if test="${c.ctUserId!='admin' }">
					<DIV id=companyinfo class="bc-hd">
						<TABLE id=companyInfoTable class="job" border=1>
							<COLGROUP>
								<COL class=graycol>
								<COL>
							</COLGROUP>
							<TR>
								<TD class=nowrap>
									��ҵ����
								</TD>

								<TD>

									<a href="http://www.jianzhi8.com/user/${user.userId }"
										target="_blank">${user.userCompanyName}</a>

								</TD>
							</TR>
							<TR>
								<TD class=nowrap>
									��ַ
								</TD>
								<TD>
									${user.userAddress }
								</TD>
							</TR>
						</TABLE>
						<DIV class="compmess">
							<H2>
								��˾���
							</H2>
							<P
								style="LINE-HEIGHT: 1.5; word-wrap: break-word; word-break: break-all;">
								${user.userBrief }
							</P>
							<DIV class=clear></DIV>
						</DIV>
					</DIV>
					</c:if>
					<DIV class="compcon box">
						<H2 class=modAA-h2>
							��ϵ��ʽ
							<font
								style="color: #a20000; FONT-WEIGHT: normal; font-size: 14px;">����ʾ������Ҫ�����ɱ�֤�𡢸�ѡ�Ѻ��ȷ��õ���Ƹ����100%Ϊ�����Ϣ�������ϵ���ƭ����</font>
						</H2>
						<div style="line-height: 20px;">
							<div style="float: left; PADDING-RIGHT: 20px;">
								<UL style="line-height: 20px;">
									<LI>
										<c:choose>
										<c:when test="${empty c.ctContact }">
										<P style="padding-left: 8px; LINE-HEIGHT: 1.5; word-wrap: break-word; word-break: break-all;">
											<c:if test="${not empty user.userName }">
											��ϵ�ˣ�${user.userName }
											<br>
											</c:if>
											<c:if test="${not empty user.userPhone }">
											�绰��<img id='Image1' name='Image1' align='absmiddle' src='/code/email.jsp?mail=${user.userPhone }'/>
											<br>
											</c:if>
											<c:if test="${not empty user.userMobile }">
											�ֻ���<img id='Image1' name='Image1' align='absmiddle' src='/code/email.jsp?mail=${user.userMobile }'/>
											<br>
											</c:if>
											<c:if test="${not empty user.userQq }">
											QQ��
											<a target=blank href=tencent://message/?uin=${user.userQq }&Menu=yes><img border='0' SRC=http://wpa.qq.com/pa?p=1:${user.userQq }:4 alt='���������ҷ���Ϣ'>${user.userQq }</a>
											<br>
											</c:if>
											<c:if test="${not empty user.userEmail }">
											Email��<img id='Image1' name='Image1' align='absmiddle' src='/code/email.jsp?mail=${user.userEmail }'/>
											<br>
											</c:if>
										</P>
										</c:when>
										<c:otherwise>
										<P style="padding-left: 8px; LINE-HEIGHT: 1.5; word-wrap: break-word; word-break: break-all;">
										${c.ctContact }
										</P>
										</c:otherwise>
										</c:choose>
									</LI>
								</UL>
							</div>
							<div style="float: right; width: 280px; COLOR: #777777">
								<SCRIPT language=JavaScript
									src="http://www.jianzhi8.com/comcity/jz8_js/jiathis.js"
									type=text/javascript></SCRIPT>
							</div>

						</div>
						<DIV class=clear></DIV>
						<div class="gray6 jobdisc-share"
							style="MARGIN-BOTTOM: 15px; MARGIN-TOP: 0px; MARGIN-LEFT: 8px">
							�����Ϣ���б𷽷������ֻ��Ż��û�ip�Ƿ񱾵ط������綼����ط�������ô��Ҫ�����ˡ�
							<br>


							<script src="http://whois.pconline.com.cn/ip.js"></script>
							���û���ip��
							<a href="javascript:labelIp('showIpInfo','${user.userIpaddr }');"
								title="�����ʾ">${user.userIpaddr }</a> ������IP��ʾ�����أ�
							<span id="showIpInfo" style="color: #FF0000"></span>

							<form name="formLocating"
								action="http://www.ip138.com:8080/search.asp" method="post"
								target="_blank">

								<input type="text" name="mobile"
									style="FONT-SIZE: 12px; color: #555555; vertical-align: bottom;"
									value="�������ֻ�����" onblur="Trim_char(this);"
									onFocus="this.style.color='#000000';if( '�������ֻ�����' == this.value) this.value=''" />
								<input type="hidden" name="action" value="mobile">
								<input type="submit" value="��ѯ���������" />
							</form>
						</div>
						<DIV class=clear></DIV>
						<div class='new_listing'>
							<div class="list_bg">
								<b>"${city.simpleName}${c.ctTitle }"
									������Ϣ���������⣿��鿴�����й�<a href="/jianzhi/${t.id.typeCode }">${city.simpleName}${ctClass}${t.id.typeName }</a>������Ϣ...
								</b>
							</div>

							<div>
								<div style="float: left; PADDING-RIGHT: 20px;">
									<SCRIPT language=JavaScript
										src="http://www.jianzhi8.com/comcity/jz8_ad_js/360_280.js"
										type=text/javascript></SCRIPT>
								</div>
								<div style="float: left;">
									<SCRIPT language=JavaScript
										src="http://www.jianzhi8.com/comcity/jz8_ad_js/360_280.js"
										type=text/javascript></SCRIPT>
								</div>
							</div>

						</div>
						<div class='new_listing'>
							<div class="list_bg">
								<b>�����й�${city.simpleName}${c.ctTitle }��Ϣ...</b>
							</div>
							<UL>
								<c:forEach items="${moreList }" var="m">
								<LI>
									<A href='/a${m.ctNo }.html' class='ad_title'
										title='${m.ctTitle }'>${m.ctTitle }</A>
									&nbsp;&nbsp;
									<font color='#9D9D9D'>${m.updateTimeTxt }</font>
								</LI>
								</c:forEach>
							</UL>
						</div>

						<div class="seo_footer_listing2">
							<div class="list_bg">
								<b>���ų���${t.id.typeName }����</b>
							</div>
							<UL>
								<li>
									<A href="http://bj.jianzhi8.com">������ְ</A>
								</li>
								<LI>
									<A href="/${ctClassLink}/K01" id="K01">${city.simpleName}��ѧ����ְ</A>
								<LI>
									<A href="/${ctClassLink}/K02" id="K02">��Ʒ����</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K03" id="K03">${city.simpleName}��ְ����Ա</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K04" id="K04">�ʾ�/�ɷ�/����</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K05" id="K05">${city.simpleName}��ְ���</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K06" id="K06">ҵ��/����</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K07" id="K07">IT��ְ</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K08" id="K08">��ְ����</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K09" id="K09">���/���/�Ű�</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K11" id="K11">�ͷ�/��ѯ</A>
								</LI>
								<li>
									<A href="http://sh.jianzhi8.com">�Ϻ���ְ</A>
								</li>
								<LI>
									<A href="/${ctClassLink}/K12" id="K12">��Ա/��̨</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K14" id="K14">${city.simpleName}��ְ�ҽ�</A>
								</LI>

								<LI>
									<A href="/${ctClassLink}/K15" id="K15">����/����</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K13" id="K13">����/��ķ</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K16" id="K16">����/ģ��/��Ա</A>
								</LI>
								<li>
									<A href="http://sz.jianzhi8.com">���ڼ�ְ</A>
								</li>
								<LI>
									<A href="/${ctClassLink}/K17" id="K17">����/˾��</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K18" id="K18">����/˾��</A>
								</LI>

								<LI>
									<A href="/${ctClassLink}/K19" id="K19">ҽ��/����/����</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K21" id="K21">����/װ��</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K22" id="K22">����/���</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K23" id="K23">�༭/����</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K24" id="K24">${city.simpleName}KTV/�ư�</A>
								</LI>
								<LI>
									<A href="/shixi/" id="K25">${city.simpleName}ʵϰ</A>
								</LI>

								<LI>
									<A href="/${ctClassLink}/K26" id="K26">�ӵ㹤/����</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K27" id="K27">${city.simpleName}��ְ</A>
								</LI>
								<li>
									<A href="http://gz.jianzhi8.com">���ݼ�ְ</A>
								</li>
							</UL>
						</div>
					</div>

				</DIV>
			</DIV>

			<!-- main end -->
			<DIV id=v_sidebar>
				<SCRIPT language=JavaScript
					src="http://www.jianzhi8.com/comcity/jz8_ad_js/160_600img.js"
					type=text/javascript></SCRIPT>
				<DIV id=v_sidebarBox>
					<h3>
						��ְ����������
					</h3>
					<ul class="vinfo3">
						����"${city.simpleName}${c.ctTitle }"��Ϣ���û����з���������ʵ�ԡ�׼ȷ�ԺͺϷ�������Ϣ�����˸���
						<A href="/"><font color='#000000'>${city.simpleName}��ְ��</font>
						</A>���е�����${city.simpleName}${c.ctTitle }�����ݵĺϷ��Լ���ʵ���������һ������ͷ������Ρ�
					</ul>

				</DIV>
			</DIV>

		</DIV>
		<!-- content end -->

		<div class=clear></div>

		<center>
			<div id="myfoot" style="width: 950px; margin-top: 30px;">
				<a href="http://www.jianzhi8.com/about.html"><font
					color='#000000'>��������</font>
				</a>
				<A href="http://www.jianzhi8.com/"><font color='#000000'>���ϼ�ְ</font>
				</A>
				<A href="http://www.jianzhi8.com"><font color='#000000'>��ְ</font>
				</A>��
				</li>

			</div>
		</center>
		<SCRIPT language=JavaScript
			src="http://www.jianzhi8.com/comcity/js/copy.js" type=text/javascript></SCRIPT>
		<script language="javascript"
			src="http://www.jianzhi8.com/js/tongji.js"></script>
		<span style="display: none"> <script language="javascript"
				src="http://count42.51yes.com/click.aspx?id=421273759&logo=12"
				charset="gb2312"></script> </span>
		<div id="sl">
			<a href="#" _fcksavedurl="#"></a>
		</div>
		<script type="text/javascript"
			src="http://v1.jiathis.com/code/jia.js?uid=1504091" charset="utf-8"></script>

	</body>
</html>
