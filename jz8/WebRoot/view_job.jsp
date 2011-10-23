<%@page contentType="text/html; charset=GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="GBK">
	<head>
		<title>${city.simpleName}${c.ctTitle }</title>
		<meta name="keywords" content='${city.simpleName}${c.ctTitle }' />
		<meta name="description" content='${city.simpleName}${c.ctTitle }工作信息,我们提供${user.userCompanyName}发布的${city.simpleName}最新的${c.ctTitle }工作资讯,还有哪些公司在招聘${c.ctTitle }和${city.simpleName}${ctClass}${t.id.typeName }请登录${city.simpleName}兼职吧查看。'>

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
								<A href="/" name=top> <IMG alt='${city.simpleName}兼职网'
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
										href="http://www.jianzhi8.com/index.html">[切换城市]
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

				<span title="浏览总次数">&nbsp;&nbsp; &nbsp; &nbsp; 已浏览&nbsp;<font
					color="red">${c.ctLooknum }</font>&nbsp;次</span>
				<img alt=""	src="http://www.jianzhi8.com/comcity/myimages/ico_arrow.gif" />
				&nbsp;
				<A href="http://www.jianzhi8.com/">兼职网</A>&nbsp;>&nbsp;
				<A href="http://www.jianzhi8.com/jianzhi/">兼职工作</A>&nbsp;>&nbsp;
				<a href="/">${city.simpleName}大学生兼职网</a>&nbsp;>&nbsp;
				<a href="/${cateName}/">${city.simpleName}兼职工作</a>&nbsp;>&nbsp;
				<a href="/${cateName}/${t.id.typeCode }">${city.simpleName}${ctClass }${t.id.typeName }</a> &nbsp;
			</div>
			<div class=v_content>
				<DIV id=v_main>
					<DIV class="jobName">
						<H1 class=jobName-h1 title="${c.ctTitle}">
							${kind }-${c.ctTitle}<c:if test="${c.ctIsyz=='1'}"><font color="red">[营业执照已验证]</font></c:if>
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
									href="javascript:void(0);" rel=nofollow><STRONG>投递简历</STRONG>
								</A>
							</LI>
							<LI>
								<SPAN class=one></SPAN><A onclick="javascript:favo2();"
									href="javascript:void(0);" rel=nofollow><STRONG>加入收藏夹</STRONG>
								</A>
							</LI>
						</UL>
						<UL class=tabcnt>
							<LI id=jobinfo_tab class=ui-tabs-selected onclick=jobHide();>
								<A href="javascript:void(0);">职位信息</A>
							</LI>
							<c:if test="${c.ctUserId!='admin' && not empty user.userBrief}">
							<LI id=companyinfo_tab onclick=jobShow();>
								<A href="javascript:void(0);">公司介绍</A>
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
										职位类别
									</TD>
									<TD colSpan=3>
										${t.id.typeName }
									</TD>
								</TR>
								<TR>
									<TD class=center>
										工作地点
									</TD>

									<TD>
										${c.ctCityName}
									</TD>
									<TD class=center>
										职位性质
									</TD>
									<TD>
										${kind }
									</TD>
								</TR>
								<TR>
									<TD class=center>
										工资待遇
									</TD>
									<TD>
										${c.ctSalary }
									</TD>

									<TD class=center>
										学历要求
									</TD>
									<TD>
										${c.ctDigree }
									</TD>
								</TR>
								<TR>
									<TD class=center>
										招聘人数
									</TD>
									<TD>
										${c.ctJobnum==0?'若干':c.ctJobnum }人
									</TD>
									<TD class=center>
										更新时间
									</TD>

									<TD>
										${c.updateTimeTxt }
									</TD>
								</TR>
							</TABLE>
						</DIV>
						<DIV class="jobdisc box">
							<H2 class=modAA-h2>
								职位描述
								<SPAN class=modAA-h2-companyName></SPAN>
							</H2>
							<P class=jobdisc-cnt
								style="LINE-HEIGHT: 1.5; word-wrap: break-word; word-break: break-all;">
								${c.ctContent }
								<BR>
								联系我时请一定说明是在兼职吧上看到的此信息，谢谢！

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
									企业名称
								</TD>

								<TD>

									<a href="http://www.jianzhi8.com/user/${user.userId }"
										target="_blank">${user.userCompanyName}</a>

								</TD>
							</TR>
							<TR>
								<TD class=nowrap>
									地址
								</TD>
								<TD>
									${user.userAddress }
								</TD>
							</TR>
						</TABLE>
						<DIV class="compmess">
							<H2>
								公司简介
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
							联系方式
							<font
								style="color: #a20000; FONT-WEIGHT: normal; font-size: 14px;">（警示：所有要您交纳保证金、稿费、押金等费用的招聘工作100%为虚假信息，谨防上当受骗。）</font>
						</H2>
						<div style="line-height: 20px;">
							<div style="float: left; PADDING-RIGHT: 20px;">
								<UL style="line-height: 20px;">
									<LI>
										<c:choose>
										<c:when test="${empty c.ctContact }">
										<P style="padding-left: 8px; LINE-HEIGHT: 1.5; word-wrap: break-word; word-break: break-all;">
											<c:if test="${not empty user.userName }">
											联系人：${user.userName }
											<br>
											</c:if>
											<c:if test="${not empty user.userPhone }">
											电话：<img id='Image1' name='Image1' align='absmiddle' src='/code/email.jsp?mail=${user.userPhone }'/>
											<br>
											</c:if>
											<c:if test="${not empty user.userMobile }">
											手机：<img id='Image1' name='Image1' align='absmiddle' src='/code/email.jsp?mail=${user.userMobile }'/>
											<br>
											</c:if>
											<c:if test="${not empty user.userQq }">
											QQ：
											<a target=blank href=tencent://message/?uin=${user.userQq }&Menu=yes><img border='0' SRC=http://wpa.qq.com/pa?p=1:${user.userQq }:4 alt='点击这里给我发消息'>${user.userQq }</a>
											<br>
											</c:if>
											<c:if test="${not empty user.userEmail }">
											Email：<img id='Image1' name='Image1' align='absmiddle' src='/code/email.jsp?mail=${user.userEmail }'/>
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
							虚假信息简单判别方法：看手机号或用户ip是否本地发布；如都是外地发布，那么需要警惕了。
							<br>


							<script src="http://whois.pconline.com.cn/ip.js"></script>
							该用户的ip：
							<a href="javascript:labelIp('showIpInfo','${user.userIpaddr }');"
								title="点击显示">${user.userIpaddr }</a> 点击左侧IP显示所属地：
							<span id="showIpInfo" style="color: #FF0000"></span>

							<form name="formLocating"
								action="http://www.ip138.com:8080/search.asp" method="post"
								target="_blank">

								<input type="text" name="mobile"
									style="FONT-SIZE: 12px; color: #555555; vertical-align: bottom;"
									value="请输入手机号码" onblur="Trim_char(this);"
									onFocus="this.style.color='#000000';if( '请输入手机号码' == this.value) this.value=''" />
								<input type="hidden" name="action" value="mobile">
								<input type="submit" value="查询号码归属地" />
							</form>
						</div>
						<DIV class=clear></DIV>
						<div class='new_listing'>
							<div class="list_bg">
								<b>"${city.simpleName}${c.ctTitle }"
									这条信息您还不满意？请查看更多有关<a href="/jianzhi/${t.id.typeCode }">${city.simpleName}${ctClass}${t.id.typeName }</a>方面信息...
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
								<b>更多有关${city.simpleName}${c.ctTitle }信息...</b>
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
								<b>热门城市${t.id.typeName }工作</b>
							</div>
							<UL>
								<li>
									<A href="http://bj.jianzhi8.com">北京兼职</A>
								</li>
								<LI>
									<A href="/${ctClassLink}/K01" id="K01">${city.simpleName}大学生兼职</A>
								<LI>
									<A href="/${ctClassLink}/K02" id="K02">商品促销</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K03" id="K03">${city.simpleName}兼职打字员</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K04" id="K04">问卷/派发/调查</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K05" id="K05">${city.simpleName}兼职会计</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K06" id="K06">业务/代理</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K07" id="K07">IT兼职</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K08" id="K08">兼职翻译</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K09" id="K09">广告/设计/排版</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K11" id="K11">客服/咨询</A>
								</LI>
								<li>
									<A href="http://sh.jianzhi8.com">上海兼职</A>
								</li>
								<LI>
									<A href="/${ctClassLink}/K12" id="K12">店员/柜台</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K14" id="K14">${city.simpleName}兼职家教</A>
								</LI>

								<LI>
									<A href="/${ctClassLink}/K15" id="K15">文秘/助理</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K13" id="K13">家政/保姆</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K16" id="K16">歌手/模特/演员</A>
								</LI>
								<li>
									<A href="http://sz.jianzhi8.com">深圳兼职</A>
								</li>
								<LI>
									<A href="/${ctClassLink}/K17" id="K17">导游/司仪</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K18" id="K18">教练/司机</A>
								</LI>

								<LI>
									<A href="/${ctClassLink}/K19" id="K19">医疗/美容/护理</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K21" id="K21">建筑/装潢</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K22" id="K22">婚礼/庆典</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K23" id="K23">编辑/记者</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K24" id="K24">${city.simpleName}KTV/酒吧</A>
								</LI>
								<LI>
									<A href="/shixi/" id="K25">${city.simpleName}实习</A>
								</LI>

								<LI>
									<A href="/${ctClassLink}/K26" id="K26">钟点工/保洁</A>
								</LI>
								<LI>
									<A href="/${ctClassLink}/K27" id="K27">${city.simpleName}兼职</A>
								</LI>
								<li>
									<A href="http://gz.jianzhi8.com">广州兼职</A>
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
						兼职吧免责声明
					</h3>
					<ul class="vinfo3">
						所有"${city.simpleName}${c.ctTitle }"信息由用户自行发布，其真实性、准确性和合法性由信息发布人负责，
						<A href="/"><font color='#000000'>${city.simpleName}兼职网</font>
						</A>不承担由于${city.simpleName}${c.ctTitle }其内容的合法性及真实性所引起的一切争议和法律责任。
					</ul>

				</DIV>
			</DIV>

		</DIV>
		<!-- content end -->

		<div class=clear></div>

		<center>
			<div id="myfoot" style="width: 950px; margin-top: 30px;">
				<a href="http://www.jianzhi8.com/about.html"><font
					color='#000000'>关于我们</font>
				</a>
				<A href="http://www.jianzhi8.com/"><font color='#000000'>网上兼职</font>
				</A>
				<A href="http://www.jianzhi8.com"><font color='#000000'>兼职</font>
				</A>吧
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
