<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>摔迷小精灵 迷你首页</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<style>
/***v:20110616:14:51***/
*{margin:0; padding:0px}
html, body{font-family:"宋体",Arial;line-height:13px;background:#fff;color:#000; font-size:12px; text-align:center; /*overflow:hidden*/;background:white;}
img{border:0px}
.clear{clear:both; font-size:0px; line-height:0px}
#warps{width:560px; height:448px; margin:0 auto; overflow:hidden; background:#fff}
#maincot{width:560px; text-align:center;margin-top:4px;}
#AD{padding-right:3px; width:150px; text-align:center; float:right}
#AD #SosoZone .texte{width:102px; height:15px; border:1px solid #4BB0E7; margin-right:5px; padding-top:3px; padding-left:2px}
#SosoZone .buttons{border:0px; background:url(images/all2011.gif) no-repeat -207px -31px; width:39px; height:20px; cursor:pointer}
#bigad {width:150px;height:328px;/*filter:progid:DXImageTransform.Microsoft.Fade(duration=0.5,overlap=1.0);*/padding-top:3px;}
#bigad div{margin:0px auto 5px auto;}
#bigad p {margin:0px;padding:0px;padding-top:6px;padding-bottom:1px;}
#bigad a{color:#0066A6; font-size:12px; text-decoration:none; line-height:22px}
#bigad a:hover{text-decoration:underline; color:#f00}
#Artic{width:401px; float:left; text-align:left; margin-right:5px}
/*navnew*/
#menuwarp{width:401px; padding:0px; background:url(images/all2011.gif) no-repeat 0px 0px;}
#maincot #Artic #menuwarp #more{width:24px; height:24px; float:right;text-align:center; cursor:pointer;}
#more a{color:#0066A6; font-size:12px; text-decoration:none}
#more a:hover{}
#menu{width:355px; float:left;height:25px;overflow:hidden; margin-left:15px;}
.leftHigh {cursor:pointer;width:21px;float:left;height:23px;background:url(images/all2011.gif) no-repeat -21px -82px;text-align:center;margin-right:1px;}
.leftGray {cursor:pointer;width:21px;float:left;height:23px;background:url(images/all2011.gif) no-repeat -63px -82px;text-align:center;margin-right:1px;}
.leftNormal {cursor:pointer;width:21px;float:left;height:23px;background:url(images/all2011.gif) no-repeat left -82px;text-align:center;margin-right:1px;}
.leftHover {cursor:pointer;width:21px;float:left;height:23px;background:url(images/all2011.gif) no-repeat -21px -82px;text-align:center;margin-right:1px;}
.leftClick {cursor:pointer;width:21px;float:left;height:23px;background:url(images/all2011.gif) no-repeat -42px -82px;text-align:center;margin-right:1px;}
.rightHigh {cursor:pointer;width:24px;float:left;height:24px;background:url(images/all2011.gif) no-repeat -237px -82px;text-align:center;}
.rightGray {cursor:pointer;width:24px;float:right;height:24px;background:url(images/all2011.gif) no-repeat -108px -82px;text-align:center;}
.rightNormal {cursor:pointer;width:24px;float:right;height:24px;background:url(images/all2011.gif) no-repeat -384px -82px;text-align:center;}
.rightHover {cursor:pointer;width:24px;float:right;height:24px;background:url(images/all2011.gif) no-repeat -237px -82px;text-align:center;}
.rightClick {cursor:pointer;width:24px;float:right;height:24px;background:url(images/all2011.gif) no-repeat -157px -82px;text-align:center;}
#menu a.s{width:69px; height:19px; padding-top:6px; float:left; background:url(images/all2011.gif) no-repeat 0px -56px; text-align:center; color:#000; text-decoration:none; margin-left:2px; display:inline; cursor:hand}
#menu a.s:hover{display:inline; cursor:hand}
#menu a.nos{width:69px; height:19px; padding-top:6px; float:left; background:url(images/all2011.gif) no-repeat 0px -31px; text-align:center; color:#0066A6; text-decoration:none; margin-left:2px; display:inline; cursor:hand}
#menu a.nos:hover{display:inline; cursor:hand}
#menu a.mb {width:65px; height:25px; padding-top:6px; float:left;border:1px #FF0000 dashed; text-align:center; color:#0066A6; text-decoration:none; margin-left:2px; display:block; cursor:hand}
#menu a.mb:hover{display:block; cursor:hand}
#coenter{width:399px; height:390px; overflow:hidden; border:1px solid #ADF; border-top:0px; background:#fff; /*filter:progid:DXImageTransform.Microsoft.Fade(duration=0.5,overlap=1.0);*/ text-align:center;float:left}
 #leftsild{width:145px; float:left; display:inline; margin-left:7px; margin-top:8px; text-align:left}
 #leftsild #focus{width:145px}
 #focus span{width:143px; height:16px; margin:0px; display:block; border:1px solid #ECECEC; background:#F3F3F3; text-align:center; padding:0px; padding-top:5px}
#focus span a{color:#5F5F5F; text-decoration:none; font-size:12px}
#focus span a:hover{text-decoration:underline; color:#f00}
 #hot{width:143px; margin-top:6px}
 #hot dt{width:143px; height:16px; text-align:center; background:url(images/all2011.gif) repeat-x 0px -157px; padding-top:6px; color:#0066A6; margin-bottom:5px}
 #hot dl{border-left:1px solid #C9EFFF; border-right:1px solid #C9EFFF; border-bottom:1px solid #C9EFFF; width:143px; background:#F6FCFF; padding:0px; margin:0px; list-style:none; padding-bottom:6px}
 #hot dd{text-align:left; padding-left:4px; color:#0066A6; line-height:20px}
#rightsild{width:227px; float:right; display:inline; margin-right:11px; margin-top:8px}
#title{width:227px; height:48px; background:url(images/all2011.gif) no-repeat bottom; text-align:center; padding-top:4px; line-height:22px}
#title .redT{font-size:16px; color:#BD0A01; font-family:"黑体";text-decoration:none}
#title .redT:hover{text-decoration:underline; color:#f00}
 #title .gayaL{font-size:12px; color:#5F5F5F; text-decoration:none}
 #title .gayaL:hover{text-decoration:underline; color:#f00}
 #title2{width:227px; height:96px; background:url(images/all2011.gif) no-repeat bottom; text-align:left; line-height:22px; padding-top:6px}
#title3{width:227px; height:94px; background:url(images/all2011.gif) no-repeat bottom; text-align:left; line-height:22px; padding-top:7px}
#title4{margin-top:3px}
#hotblos span a, #book_focus a, #title_paipai_main_bottom a, #title4 a, #maincot #Artic #coenter #autotitle2 a, #title2 a, #title3 a{color:#333; text-decoration:none; font-size:12px}
#hotblos span a:hover, #book_focus a:hover, #autotitle2 a:hover, #title_paipai_main_bottom a:hover, #title4 a:hover, #title2 a:hover, #title3 a:hover{text-decoration:underline; color:#f00}
#title4{width:227px; height:47px; text-align:left; line-height:22px; padding-top:5px}
#focus2{width:145px; margin-top:5px}
#focus2 span{width:143px; height:16px; margin:0px; display:block; border:1px solid #ECECEC; background:#F3F3F3; text-align:center; padding:0px; padding-top:5px}
#focus2 span a{color:#5F5F5F; text-decoration:none; font-size:12px}
#focus2 span a:hover{text-decoration:underline; color:#f00}
#hotent{margin-top:3px; padding:0px; border:1px solid #DEDEDE}
#hotent img{margin:0px; padding:0px}
#maincot #Artic #coenter #autotitle2 a:hover{color:#f00; text-decoration:underline}
/*标签切换*/
.label {border-left: 1px solid #dadada;	border-top: 1px solid #dadada;	border-right: 1px solid #dadada;background: #f2f2f2 url(images/laber_bg.gif) repeat-x 0 bottom;	width:99%;}
.tlboxtitle {float: left;display: block;font-weight: normal;font-size: 12px;margin-top: 3px;margin-left: 3px;}
.tlboxtitle li {width: 55px;float: left;text-align: center;/*background: url(images/label.gif) no-repeat -96px 0;*/height: 20px;	padding-top: 0px;list-style: none;}
.tlboxtitle li a{color:#333;}
.tlboxtitle li.current{background: url(images/label_on.gif) no-repeat 0 0;}
.tlboxtitle li.current a,.tlboxtitle li.current a:visited{color:#BD0B01;font-weight: bold;}
#tab li.current a:hover{text-decoration:none;color:#BD0B01;}
/*提醒*/
#tixing{border:1px solid #AADDFF;}
#tixing_title{line-height:22px;height:22px;font-weight:600;padding:0 10px;overflow:hidden;background:#AADDFF;}
#tixing_content{padding-bottom:5px;height:112px;_height:100px;}
#tixing_content ul{text-align:left;overflow:hidden;}
#tixing_content ul li{line-height:22px; padding-left:10px;}

.absolute{position:absolute;}
</style>
<script src="http://code.jquery.com/jquery-1.6.1.min.js"></script>
<script>
	$(function () {
        $('#tab li').mouseover(function () {
            $(this).addClass('current');
            var theLi = this;
            $('#tab li').each(function (index) {
                if (theLi != this){
                    $(this).removeClass('current');
                    $('.tab_div').eq(index).hide();
                }else{
                	$('.tab_div').eq(index).show();
                }
            });
        });
        $('.tab_div').hide();
        $('.tab_div').eq(0).show();
    });
</script>
</head>
<body oncontextmenu="return false" onselectstart="return false">
	<div id="warps">
		<!--主要区-->
		<div id="maincot">
			<!--广告区-->
			<div id="AD">
				<div id="SosoZone">
					<div id="SosoZone">
						<form target="_blank" id="cse-search-box" action="http://www.google.cn/cse">
							<input type="hidden" value="010326495342921108956:oepi079gaf4" name="cx"/>
							<input type="hidden" value="gb2312" name="ie"/>
							<input type="text" id="sosokeys" onblur="if (this.value == '') {this.value = '在这里搜索...';}" onfocus="if (this.value == '在这里搜索...') {this.value = '';}" value="在这里搜索..." name="q" class="texte"><input type="submit" class="buttons" value="搜索"/>
						</form>
					</div>
				</div>
				<div id="bigad">
					<span id="ad1" style="display:block">
						<div class="l_qq_com" style="width: 150px; height: 240px; display: block; position: relative;" id="AllInOne_N_UpRight1" oid="1235091" display="banner">
							<img width="150" height="240" src="${c.adImage}"/>
							<a style="position:absolute;width:150px;height:240px;left:0px;top:0px;cursor:pointer;z-index:10;background-color:#fff;filter:alpha(opacity=0);opacity:0;" target="_blank" href="${c.adUrl}" class="absolute a_cover"></a>
						</div>
						<div id="tixing">
							<div id="tixing_title">最近5条提醒</div>
							<div id="tixing_content">
								<ul>					
									<c:forEach items="${tixingList}" var="t">
					                <li><a href="${t.game.url }" target="_blank">${t.game.title }</a></li>
					                </c:forEach>
								</ul>
							</div>
						</div>
					</span>
				</div>				
			</div>
			<!--主内容区-->
			<div id="Artic">
				<!--页签开始-->
				<div id="menuwarp">						
					<div id="menu">
						<a class="s" name="0" href="javascript:void();" id=""><span style="cursor:hand">主页</span></a>
						<a name="1" class="nos" href="javascript:void();" id=""><span style="cursor:hand">音乐</span></a>
					</div>
					<div class="clear"></div>
				</div>
				<!--页签结束-->
				<!--主体内容开始-->
				<div id="coenter">
				<!--页卡内容-->
					<div id="leftsild">
						<!--焦点图片新闻-->
						<div id="focus">
							<a target="_blank" href="${c.picNewsUrl }"><img src="${c.picImage}" height="145" border="0" width="145"></a>
							<span id="linkme"><a target="_blank" href="${c.picNewsUrl }">${c.picNews }</a></span>
						</div>
						<!--焦点视频新闻-->
						<div id="focus2">
							<a target="_blank" href="${c.videoNewsUrl }"><img height="175" border="0" width="145" src="${c.videoImage }"></a>
							<span><a target="_blank" href="${c.videoNewsUrl }">${c.videoNews }</a></span>
						</div>						
					</div>
					<!--右侧内容区-->
					<div id="rightsild">
						<!--头条区-->
						<div id="title">
							<a class="redT" target="_blank" href="#">头条新闻标题 如XXX大赛在即</a><br/>
							[<a class="gayaL" target="_blank" href="#">新闻简短文字说明。。</a>]
							[<a class="gayaL icon_wb" target="_blank" href="#">关注</a>]
							[<a class="gayaL" target="_blank" href="#">更多</a>]
						</div>
						<!--2条-->
						<div id="title2">
							·<a target="_blank" href="#">南方暴雨城市内涝</a> <a target="_blank" href="#">南昌投20亿不堪一击</a><br/>
							·<a target="_blank" href="#">赴台个人游实施细则公布 需交财力证明</a><br/>
							·<a target="_blank" href="#">中央党校课程设置首曝光 帮学员开微博</a><br/>
							·<a target="_blank" href="#">美国前驻华大使洪博培宣布参选总统</a><br/>
						</div>
						<!--3条-->
						<div id="title3">
							·<a target="_blank" href="#">浙江组织部长蔡奇专栏:官员如何织围脖</a><br/>
							·<a target="_blank" href="#">甘肃银行劫杀案嫌犯被抓 系38岁无业者</a><br/>
							·<a target="_blank" href="#">湖北一法院院长与女同事开房 称遭中伤</a><br/>
							·<a target="_blank" href="#">辞典：新中国土地私有权隐秘消失过程</a><br/>
						</div>
						<!--tab news-->
						<div id="title4">
							<div class="label">
								<ul id="tab" class="tlboxtitle">
									<li class="current"> <a title="" href="#">文章</a></li>
									<li class=""> <a title="" href="#">日志</a></li>
									<li class=""> <a title="" href="#">帖子</a></li>
									<li class=""> <a title="" href="#">知识堂</a></li>
								</ul>
								<div class="clear"></div>
							</div>
							<div class="tab_div">
								·<a target="_blank" href="#">深度</a> | <a target="_blank" href="#">鄱阳湖干旱中的水利与自然之争</a><br/>
								·<a target="_blank" href="#">乔志峰：别老盯官员“床上那点事”</a><br/> 
								·<a target="_blank" href="#">博客</a> |  <a target="_blank" href="#">开发商拿地谨慎地方政府急了</a><br/>
								·<a target="_blank" href="#">高娓娓：中国女人胃口吓坏美国男人</a>
							</div>
							<div class="tab_div">
								·<a target="_blank" href="#">2222222</a> | <a target="_blank" href="#">222</a>
							</div>
							<div class="tab_div">
								·<a target="_blank" href="#">333</a> | <a target="_blank" href="#">333</a>
							</div>
							<div class="tab_div">
								·<a target="_blank" href="#">444</a> | <a target="_blank" href="#">4444444444444</a>
							</div>
						</div>
					</div>
					<div class="clear"></div>
					<!--页卡内容结束-->
				</div>
				<!--主体内容结束-->
			</div>
			<div class="clear"></div>
		</div>
	</div>
</body>
</html>
