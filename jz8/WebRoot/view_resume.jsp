<%@page contentType="text/html; charset=GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="GBK">
	<head>
		<title>${city.simpleName}${c.ctTitle }</title>
		<meta name="keywords" content='${city.simpleName}${c.ctTitle }' />
		<meta name="description" content='${city.simpleName}${c.ctTitle }工作信息,我们提供${city.simpleName}最新最全的${c.ctTitle }人才简历资讯信息,还有哪些人才在找${c.ctTitle }工作和求职${city.simpleName}${ctClass}${t.id.typeName }请登录${city.simpleName}兼职吧查看。'>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK">
		<link href="http://www.jianzhi8.com/comcity/mycss/resumeview.css" rel="stylesheet" type="text/css">
		<LINK href="http://www.jianzhi8.com/comcity/mycss/common.css" type=text/css rel=stylesheet>
		<script language="JavaScript" src="http://www.jianzhi8.com/comcity/js/shadu.js" type=""></script>
		<script language="JavaScript" src="http://www.jianzhi8.com/comcity/myjs/vi.js" type=""></script>
		<script language="JavaScript" src="http://my.jianzhi8.com/myjs/image.js" type=""></script>
		<script language="JavaScript" src="http://www.jianzhi8.com/comcity/myjs/searchjobcommon.js" type=""></script>
		<script language="JavaScript" src="/js/jquery.js"></script>
		<link href="http://www.jianzhi8.com/comcity/favicon.ico" type="image/x-icon" rel="shortcut icon" />
		<link href="http://www.jianzhi8.com/comcity/favicon.ico" type="image/x-icon" rel="bookmark" />
		<script language="JavaScript">
			var jobtimes = '${c.ctJobtime}';
			$(function(){
				if(jobtimes != ''){
					var arr = jobtimes.split('-');
					for(var i = 0 ; i < arr.length; i++){
						$(':checkbox[value="'+arr[i]+'"]').attr("checked",true);					
					}
				}
			});
		</script>
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
				<img alt=""
					src="http://www.jianzhi8.com/comcity/myimages/ico_arrow.gif" />
				&nbsp;
				<A href="http://www.jianzhi8.com/">兼职网</A>&nbsp;>&nbsp;
				<A href="http://www.jianzhi8.com/jianzhi/">兼职工作</A>&nbsp;>&nbsp;
				<a href="/">${city.simpleName}大学生兼职网</a>&nbsp;>&nbsp;
				<a href="/${cateName}/">${city.simpleName}${ctClass }工作</a>&nbsp;>&nbsp;
				<a href="/${cateName}/${t.id.typeCode}">${city.simpleName}${ctClass }${t.id.typeName}</a> &nbsp;
			</div>
			<!--名字+登录时间-->
			<div class="area aline">
				<ul>
					<li class="topn">
						<h2>
							${c.ctTitle }
						</h2>
					</li>
				</ul>
			</div>

			<!--内容一-->
			<div class="area aline">
				<!--col1-->
				<div class="col1">
					<div class="jianlijiben">
						<ul>
							<li class="jiben5">
								<span>求职意向</span>
							</li>
							<li class="jiben1">
								<script language="javascript">
	function favo() {
		var mindx = document.all.pno.value;
		window.open('http://my.jianzhi8.com/post_ctop.jsp?pno=' + mindx,
				'NewWindow');
	}
</script>

								<input name="pno" value="1196687" type="hidden">
								&nbsp;
								<input type="button" onclick="javascript:favo();" name=""
									value="加入我的收藏夹" />
							</li>
							<li class="jiben0">
								<span>工作意向：</span>&nbsp;${typeNames}
							</li>
							<li class="jiben2">
								<span>性别：</span>&nbsp;${c.ctSelsex }
							</li>
							<li class="jiben2">
								<span>学历：</span>&nbsp;${c.ctDigree }
							</li>

							<li class="jiben2">
								<span>工作性质：</span>&nbsp;${ctClass }
							</li>
							<li class="jiben2">
								<span>工作地点：</span>&nbsp;${c.ctCityName}
							</li>
							<li class="jiben2">
								<span>期望薪水：</span>&nbsp;${c.ctSalary }
							</li>
							<li class="jiben2">
								<span>更新日期：</span>&nbsp;${c.updateTimeTxt }
							</li>
							<li class="jiben5">
								<span>个人简介</span>
							</li>

							<li class="jiben0"
								style="word-break: break-all; LINE-HEIGHT: 20px; FONT-SIZE: 12px;">
								${c.ctTitle }，${c.ctContent }
								<BR>
								联系我时请一定说明是在兼职吧上看到的此信息，谢谢！
							</li>
						</ul>
					</div>

				</div>
				<!--col1 end-->
				<!--col2-->
				<!--右侧照片-->
				<div class="col2">
					<table align="center" width="100%">
						<tr>
							<td align="center">
								<a href="http://my.jianzhi8.com/personimages/" target="_blank">
									<IMG
										onerror="{this.src='http://my.jianzhi8.com/personimages/face.gif';}"
										src="http://my.jianzhi8.com/personimages/${user.userFileName }"
										style="BORDER: #555 1px solid;" alt="${c.ctTitle }"
										onload="javascript:DrawImage(this,'250','250');" border="0"
										name="faceImage" />
								</a>
							</td>
						</tr>
					</table>
				</div>
				<!--col2end-->
				<!--内容二-->
				<div class="area ">
					<div class="jianlijiben2">
						<ul>
							<li class="jiben5">
								<span>工作时间</span>
							</li>

							<li class="jiben20" style="line-height: 24px;">
								<table cellpadding="0" cellspacing="0" width="100%" border="1"
									bordercolor="#e4e4e4">
									<TR bgColor=#D3EAF1>
										<TD width="20%" height=20>
											<DIV align=center>
												每周可兼职工作时间表
											</DIV>
										</TD>
										<TD width="11%" align=center height=20>
											星期一
										</TD>
										<TD width="11%" align=center height=20>
											星期二
										</TD>

										<TD width="12%" align=center height=20>
											星期三
										</TD>
										<TD width="12%" align=center height=20>
											星期四
										</TD>
										<TD width="12%" align=center height=20>
											星期五
										</TD>
										<TD width="12%" align=center height=20>
											星期六
										</TD>
										<TD width="13%" align=center height=20>
											星期日
										</TD>
									</TR>

									<TR>

										<TD width="20%" bgColor=#ffffff height=20>
											<DIV align=center>
												上午
											</DIV>
										</TD>
										<TD width="11%" align=center bgColor=#ffffff height=20>
											<INPUT type=checkbox onclick="return false;" value=01
												name=jobtimes>
										</TD>
										<TD width="11%" align=center bgColor=#ffffff height=20>
											<INPUT type=checkbox onclick="return false;" value=02
												name=jobtimes>
										</TD>

										<TD width="12%" align=center bgColor=#ffffff height=20>
											<INPUT type=checkbox onclick="return false;" value=03
												name=jobtimes>
										</TD>
										<TD width="12%" align=center bgColor=#ffffff height=20>
											<INPUT type=checkbox onclick="return false;" value=04
												name=jobtimes>
										</TD>
										<TD width="12%" align=center bgColor=#ffffff height=20>
											<INPUT type=checkbox onclick="return false;" value=05
												name=jobtimes>
										</TD>

										<TD width="12%" align=center bgColor=#ffffff height=20>
											<INPUT type=checkbox onclick="return false;" value=06
												name=jobtimes>
										</TD>
										<TD width="13%" align=center bgColor=#ffffff height=20>
											<INPUT type=checkbox onclick="return false;" value=07
												name=jobtimes>
										</TD>
									</TR>
									<TR>
										<TD width="20%" bgColor=#ffffff height=20>

											<DIV align=center>
												下午
											</DIV>
										</TD>
										<TD width="11%" align=center bgColor=#ffffff height=20>
											<INPUT type=checkbox value=08 onclick="return false;"
												name=jobtimes>
										</TD>
										<TD width="11%" align=center bgColor=#ffffff height=20>
											<INPUT type=checkbox value=09 onclick="return false;"
												name=jobtimes>
										</TD>
										<TD width="12%" align=center bgColor=#ffffff height=20>
											<INPUT type=checkbox value=10 onclick="return false;"
												name=jobtimes>
										</TD>

										<TD width="12%" align=center bgColor=#ffffff height=20>
											<INPUT type=checkbox value=11 onclick="return false;"
												name=jobtimes>
										</TD>
										<TD width="12%" align=center bgColor=#ffffff height=20>
											<INPUT type=checkbox value=12 onclick="return false;"
												name=jobtimes>
										</TD>
										<TD width="12%" align=center bgColor=#ffffff height=20>
											<INPUT type=checkbox value=13 onclick="return false;" 
												name=jobtimes>
										</TD>
										<TD width="13%" align=center bgColor=#ffffff height=20>

											<INPUT type=checkbox value=14 onclick="return false;"
												name=jobtimes>
										</TD>
									</TR>
									<TR>
										<TD width="20%" bgColor=#ffffff height=2>
											<DIV align=center>
												晚上
											</DIV>
										</TD>
										<TD width="11%" align=center bgColor=#ffffff height=2>
											<INPUT type=checkbox value=15 onclick="return false;"
												name=jobtimes>
										</TD>

										<TD width="11%" align=center bgColor=#ffffff height=2>
											<INPUT type=checkbox value=16 onclick="return false;"
												name=jobtimes>
										</TD>
										<TD width="12%" align=center bgColor=#ffffff height=2>
											<INPUT type=checkbox value=17 onclick="return false;"
												name=jobtimes>
										</TD>
										<TD width="12%" align=center bgColor=#ffffff height=2>
											<INPUT type=checkbox value=18 onclick="return false;"
												name=jobtimes>
										</TD>
										<TD width="12%" align=center bgColor=#ffffff height=2>

											<INPUT type=checkbox value=19 onclick="return false;"
												name=jobtimes>
										</TD>
										<TD width="12%" align=center bgColor=#ffffff height=2>
											<INPUT type=checkbox value=20 onclick="return false;"
												name=jobtimes>
										</TD>
										<TD width="13%" align=center bgColor=#ffffff height=2>
											<INPUT type=checkbox value=21 onclick="return false;"
												name=jobtimes>
										</TD>
									</TR>
								</table>

							</li>
							<li class="jiben5">
								<span>联系方式</span>
							</li>
						</ul>
					</div>
				</div>
				<!--内容三联系方式-->
				<div class="area">
					<div class="jianlijiben3">

						<ul>
							<li class="jiben0">
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
								<div>
									<SCRIPT language=JavaScript
										src="http://www.jianzhi8.com/comcity/jz8_js/jiathis.js"
										type=text/javascript></SCRIPT>
								</div>
							</li>

						</ul>

					</div>
				</div>

				<!--底图-->
			</div>
			<br>
			<DIV class=otherresume>
				<H2>
					最新${city.simpleName}${ctClass}求职信息:
				</H2>
				<c:forEach items="${moreList }" var="m">
				<LI>
					<A href='/a${m.ctNo}.html' title='${m.ctTitle }'>${m.ctTitle }</A>
					&nbsp;&nbsp;
					<font color='#9D9D9D'>${m.updateTimeTxt }</font>
				</LI>
				</c:forEach>
			</div>
			<br>
			<DIV class=otherresume>
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
					<A href="/shixi/" id="K24">${city.simpleName}实习</A>
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

			</div>




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

