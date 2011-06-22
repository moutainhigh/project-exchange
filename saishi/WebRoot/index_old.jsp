<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>系统界面</title>
    <link href="Themes/basic.css" type="text/css" rel="stylesheet" />
    <link href="Themes/Layout.css" type="text/css" rel="stylesheet" />
    <script src="html/script/jquery.js"></script>
    <script>
    function hideWin(){
        document.getElementById("HideInf").click();
    }
    function openMusic(){
        document.getElementById("HideInf_music").click();
    }
    $(function () {
        $('#tab li').mouseover(function () {
            $(this).addClass('current');
            var theLi = this;
            $('#tab li').each(function (index) {
                if (theLi != this){
                    $(this).removeClass('current');
                    $('.tab_div ul').eq(index).hide();
                }else{
                	$('.tab_div ul').eq(index).show();
                }
            });
        });
        $('.tab_div ul').hide();
        $('.tab_div ul').eq(0).show();
    });
    </script>
</head>
<body oncontextmenu="return false" onselectstart="return false">
<div class="w600 h430">
  <input type="hidden" id="HideInf"/>
  <input type="hidden" id="HideInf_music"/>
  <div class="">    
    <div class="label02">
      <ul class="tlboxtitle02">
        <li class="current"> <a href="#" title="找商家">主页</a></li>
        <li> <a href="#" title="音乐" onclick="openMusic();"><!--音乐--></a></li>
      </ul>
      <div class="mar_l75 mar_t5 fl"><input style="width: 150px;" name="search2" type="text" class="gray fl mar_l10 inputxt01" />
        <input class="button04 fl mar_l10" type="submit" value="搜 索" /></div>
      <div class="clear"></div>
    </div>
    <div class="pad_10 bg02 h400" style="padding-bottom:2px;">
      <div class="w147 fl">
            <div class="news">
	            <img src="${c.picImage }" width="145" height="131" />
	            <p><a href="${c.picNewsUrl }">${c.picNews }</a></p>
            </div>
            <div class="section03 mar_t6">
              <div class="ptitle">推荐视频</div>
              <div class="">
              	<img src="${c.videoImage }" width="145" height="195" />
                <p class="g_t_c"><a href="${c.videoNewsUrl }">${c.videoNews } &gt;&gt;</a></p>
             </div>
        	</div>
      </div>
              <div class="w230 fl mar_l20 mar_r15">
                <div class="artticle-news" style="height: 175px;">
                  <ul class="dotli">
                    <!--  <li><a href="http://www.wwe110.com" target="_blank">Frankie Edgar.Gray Maynard</a></li>
                    <li><a href="#">Georges St-Pierre.Jake Shields</a></li>
                    <li><a href="#">ROH《Southern.Hostility》[英文]</a></li>
                    <li><a href="#">ROH PPV《DrivenⅡ》[英文]</a></li>
                    <li><a href="#">《世界末日》PPV Armageddon [中文]</a></li>
                    <li><a href="#">Frankie Edgar.Gray Maynard</a></li>
                    <li><a href="#">Georges St-Pierre.Jake Shields</a></li>
                    <li><a href="#">《世界末日》PPV Armageddon [中文]</a></li>-->
                    <c:forEach items="${newsList}" var="n">
                    <li><a href="${n.url }" target="_blank">${n.title }</a></li>
                    </c:forEach>
                  </ul>
                  <div class="clear"></div>
                </div>
                <div class="label mar_t6" style="width:99%;">
                  <ul class="tlboxtitle" id="tab">
                    <li class="current"> <a href="#" title="">文章</a></li>
                    <li> <a href="#" title="">日志</a></li>
                    <li> <a href="#" title="">帖子</a></li>
                    <li> <a href="#" title="">知识堂</a></li>
                  </ul>
                  <div class="clear"></div>
                </div>
                <div class="tab_div mar_t10">
                  <ul class="dotli">
                  	<c:forEach items="${dataBiz.top10News2}" var="n">
                  	<li><a href="${n.url }" target="_blank">${n.title }</a></li>
                  	</c:forEach>
                  </ul>
                  <ul class="dotli">
                  	<c:forEach items="${dataBiz.top10News3}" var="n">
                  	<li><a href="${n.url }" target="_blank">${n.title }</a></li>
                  	</c:forEach>
                  </ul>
                  <ul class="dotli">
                  	<c:forEach items="${dataBiz.top10News4}" var="n">
                  	<li><a href="${n.url }" target="_blank">${n.title }</a></li>
                  	</c:forEach>
                  </ul>
                  <ul class="dotli">
                  	<c:forEach items="${dataBiz.top10News5}" var="n">
                  	<li><a href="${n.url }" target="_blank">${n.title }</a></li>
                  	</c:forEach>
                  </ul>
                </div>
                    <div class="clear"></div>
      </div>
      <div class="w160 fl">
            <div class="news">
            	<a href="${c.adUrl}" target="_blank"><img src="${c.adImage }" width="158" height="250" /></a>
            </div>
            <div class="section03 mar_t6">
              <div class="ptitle">最近5条提醒</div>
              <div class="pad_10" style="padding-bottom:5px;height:100px">
                <ul class="dotli">
                  <!--  <li><a href="#">Frankie Edgar.Gray</a></li>
                  <li><a href="#">Georges St-Pierre</a></li>
                  <li><a href="#">Southern.Hostility</a></li>
                  <li><a href="#">PPV《DrivenⅡ》</a></li>
                  <li><a href="#">《世界末日》PPV</a></li>-->
                  <c:forEach items="${tixingList}" var="t">
                  <li><a href="${t.game.url }" target="_blank">${t.game.title }</a></li>
                  </c:forEach>
                </ul>
              </div>
        </div>
      </div>   
    </div>
  </div>
</div>
</body>
</html>
