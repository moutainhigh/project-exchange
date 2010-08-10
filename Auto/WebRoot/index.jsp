<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK" />
    <title>${appTitle}</title>
    <meta name="description" content="${appDesc}" />
    <meta name="keywords"  content="${appKeywords}" />
    <link href="Themes/basic.css" type="text/css" rel="stylesheet" />
    <link href="Themes/pagestyle.css" type="text/css" rel="stylesheet" />
    <script src="${appPath}/js/jquery.js"></script>
    <script src="${appPath}/js/common.js"></script>
    <script>
    	if(document.all){
			newsExchange = 	function(tabLi,otherLi,tabId,hideId){
								if($(tabLi).attr('class') == 'current'){
									return false;
								}
								$(tabLi).addClass('current');
								$('#'+otherLi).removeClass('current');
								$('#'+hideId).hide();
								$('#'+tabId).show();
							}
		}
		window.top['imageNews'] = '${top4ImageNews}';
    </script>
</head>
<body>

    <jsp:include page="top.jsp" flush="false"></jsp:include>
    
    <!---- begin正文框架 ---->
<div class="wrapper mauto pad_5">
      <div class="search_area">
        <div class="fl ft14 w550 hide">最新动态：<a target="_blank" href="news.htm?news.id=${newsBiz.lastedRecommendNews.id}">${newsBiz.lastedRecommendNews.title}</a></div>
          <jsp:include page="sou.jsp" flush="false"></jsp:include>
      <div class="clear"></div>
      </div>
      
      <div class="part01 mar_t6">
           <div class="fl w348 hide">
      <div class="">
      <div class="pic-imgnews">
      	<iframe width="370px" height="240px" frameborder="0" src="ad.jsp"></iframe>
      </div>
      </div>
    </div> 
      
           <div class="fl w350 hide recommend mar_l20">
             <div class="first">
             	<c:set var="focusNews" value="${newsBiz.focusNews}"></c:set>
               <h1> <a href="#" target="_blank"><img class="mar_r10" src="Themes/images/label_recommend.jpg" alt="今日热点" width="86" height="18" />${focusNews.title }</a></h1>
               <p class="gray">${focusNews.simpleContent}...<a href="news.htm?news.id=${focusNews.id }"
                                    target="_blank">&gt;&gt;查看详细</a></p>
             </div>
             <div class="third">
               <ul class="dotli01">
                 <c:forEach items="${newsBiz.top7News}" var="n">
                 <li><a href="news.htm?news.id=${n.id}" target="_blank">[${n.category.name}]${n.title }</a><span class="ft10 gray mar_l10">${n.publishDateTxt}</span></li>
                 </c:forEach>
               </ul>
               <div class="clear"> </div>
             </div>
        </div>
        
        <jsp:include page="tab.jsp" flush="false"></jsp:include>
        
        <div class="clear"></div>
      </div>
      
      <div class="part02 mar_t6">
            <div class="purchase-title">
            <a href="specialList.htm">张家口车市动态</a> | 
            <a href="jjXinde.htm">购车心得</a> | 
            <a href="other.htm?news.orderNum=4">专业测评</a> | 
            <a href="other.htm?news.orderNum=9">北京降价</a> | 
            <a href="other.htm?news.orderNum=5">汽车保险</a></div>            
            <div class="fl w348 mar_t6">
              <div class="section_purchase">
                <div class="ptitle">
                  <span class="more"><a href="#">更多</a> >></span>
                  <div class="icon">北京降价-经济车型</div>
                  
                </div>
                <div class="pad_10">
                  <div class="index_tips">
                    <div class="pic"> 
                    	<a href="#" target="_blank"> 
                    		<c:set var="bjNews" value="${newsBiz.beijingRecommendNews}"></c:set>
                    		<img src="${appPath}/image?image=${bjNews.image}&w=136&h=86"  alt="" />
                    		<span class="blue fb">${bjNews.title }</span></a><br />
                          <span class="gray">${bjNews.simpleContent }…</span><a href="news.htm>news.id=${bjNews.id}"
                                    target="_blank" class="blue">&gt;&gt;查看详细</a></div>
                    <ul class="dotli01">
                    	<c:forEach items="${newsBiz.top12BeijingNews}" var="n">
                      <li><a href="news.htm?news.id=${n.id}" target="_blank">${n.title }</a><span class="ft10 gray mar_l10">${n.publishDateTxt }</span></li>
                      	</c:forEach>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="fl w350 hide recommend mar_l10 mar_t6 bls_gray pad_l10">
              <div class="section_purchase">
                <div class="ptitle"> <span class="more"><a href="jjXinde.htm">更多</a> &gt;&gt;</span>
                    <div class="icon">网友购车感受-经济车型</div>
                </div>
                <div class="pad_10">
                  <div class="index_tips">
                    <div class="pic"> <a href="#" target="_blank"> 
                    		<c:set var="jjNews" value="${newsBiz.jjXindeRecommendNews}"></c:set>
                    		<img src="${appPath}/image?image=${jjNews.image}&w=136&h=86"  alt="" />
                    		<span class="blue fb">${jjNews.title }</span></a><br />
                          <span class="gray">${jjNews.simpleContent }…</span><a href="news.htm>news.id=${jjNews.id}"
                                    target="_blank" class="blue">&gt;&gt;查看详细</a></div>
                    <ul class="dotli01" style="height: 102px;">
                    	<c:forEach items="${newsBiz.top6jjXindeNews}" var="n">
	                    <li><a href="news.htm?news.id=${n.id}" target="_blank">${n.title }</a><span class="ft10 gray mar_l10">${n.publishDateTxt }</span></li>
	                    </c:forEach>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="section_purchase mar_t6">
                <div class="ptitle"> <span class="more"><a href="zjXinde.htm">更多</a> &gt;&gt;</span>
                    <div class="icon">网友购车感受-中级车型</div>
                </div>
                <div class="pad_10">
                  <ul class="dotli01">
                  	<c:forEach items="${newsBiz.top5zjXindeNews}" var="n">
                    <li><a href="news.htm?news.id=${n.id}" target="_blank">${n.title }</a><span class="ft10 gray mar_l10">${n.publishDateTxt }</span></li>
                    </c:forEach>
                  </ul>
                </div>
              </div>
            </div>
            
            <div class="fl w240 hide mar_t6 mar_l10 bg04 bls_gray">
              <div class="section04">
                <div class="ptitle">汽车保险
                </div>
                <div class=" pad_t10 pad_l5">
                  <div class="cardlist">
                    <dl>
                      <dt><a href="#"><img src="Themes/images/pic-card02.jpg" width="81" height="60" alt="" /></a></dt>
                      <dd><b><a href="#" class="blue">张家口汽车保险推荐1</a></b>
                          <p>热线电话0313-8888888</p>
                          <p>[<a href="#" class="blue">详细</a>]</p>
                      </dd>
                    </dl>
                    <dl>
                      <dt><a href="#"><img src="Themes/images/pic-card02.jpg" width="81" height="60" alt="" /></a></dt>
                      <dd><b><a href="#" class="blue">张家口汽车保险推荐1</a></b>
                          <p>热线电话0313-8888888</p>
                        <p>[<a href="#" class="blue">详细</a>]</p>
                      </dd>
                    </dl>
                    <dl>
                      <dt><a href="#"><img src="Themes/images/pic-card02.jpg" width="81" height="60" alt="" /></a></dt>
                      <dd><b><a href="#" class="blue">张家口汽车保险推荐1</a></b>
                          <p>热线电话0313-8888888</p>
                        <p>[<a href="#" class="blue">详细</a>]</p>
                      </dd>
                    </dl>
                    <div class="clear"></div>
                  </div>
                </div>
              </div>
              <div class="section_purchase mar_t6">
                <div class="ptitle"> <span class="more"><a href="#" class="red">更多</a> &gt;&gt;</span>
                    <div class="icon red">保险知识</div>
                </div>
                <div class="pad_10">
                  <ul class="dotli01">
                  <c:forEach items="${newsBiz.top5BaoxianNews}" var="n">
                    <li><a href="news.htm?news.id=${n.id}" target="_blank">${n.title }</a></li>
                    </c:forEach>
                  </ul>
                </div>
              </div>
            </div>
            <div class="clear"></div>
  </div>


      <div class="part03 mar_t6">
        <div class="fix-title">
        	<a href="sale4s.htm">张家口汽车4S店</a> | 
        	<a href="specialList.htm">张家口车市新闻</a> | 
        	<a href="#">注册加盟</a></div>
        <div class="pad_5">
          <div class="shop_other">
            <ul>
              <c:forEach items="${userBiz.top10Sales}" var="sale">
              <li>
                <div class="w125 fl"> <a href="sale.htm?sale.id=${sale.id}" target="_blank"> 
                <img src="${appPath}/image?image=${sale.image}&w=68&h=51" class="b_gray" /></a></div>
                <div class="fl w100 hide pad_l10">
                  <p> <a href="sale.htm?sale.id=${sale.id}" target="_blank">${sale.fullName }</a></p>
                  <p class="mar_t5">${sale.tel }</p>
                </div>
                <div class="clear"> </div>
              </li>
              </c:forEach>
            </ul>
            <div class="clear"></div>
          </div>
        </div>
        <div class="clear"></div>
      </div>
  <div class="part04 mar_t6">
    <div class="beauty-title">
    	<a href="other.htm?news.orderNum=6">维修保养</a> | 
    	<a href="other.htm?news.orderNum=7">养车费用</a> | 
    	<a href="other.htm?news.orderNum=8">汽车装饰</a></div>
        <div class="fl w348 mar_t6">
          <div class="section_purchase">
            <div class="ptitle"> <span class="more"><a href="other.htm?news.orderNum=6">更多</a> &gt;&gt;</span>
              <div class="icon">维修保养</div>
            </div>
            <div class="pad_10">
              <div class="index_tips">
<div class="pic"> 
<c:set var="byNews" value="${newsBiz.baoyangRecommendNews}"></c:set>
<a href="news.htm?news.id=${byNews.id}" target="_blank"> 
<img src="${appPath}/image?image=${byNews.image}&w=136&h=86"  alt="" />
<span class="blue fb">${byNews.title}</span></a><br />
    <span class="gray">${byNews.simpleContent}…</span><a href="news.htm?news.id=${byNews.id}"
                                    target="_blank" class="blue">&gt;&gt;查看详细</a></div>
<ul class="dotli01">
				<c:forEach items="${newsBiz.top7BaoYangNews}" var="n">
                  <li><a href="news.htm?news.id=${n.id}" target="_blank">${n.title}</a><span class="ft10 gray mar_l10">${n.publishDateTxt}</span></li>
                  </c:forEach>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="fl w350 hide recommend mar_l10 mar_t6 bls_gray pad_l10">
          <div class="section_purchase">
            <div class="ptitle"> <span class="more"><a href="other.htm?news.orderNum=7">更多</a> &gt;&gt;</span>
              <div class="icon">养车费用</div>
            </div>
            <div class="pad_10">
              <div class="index_tips">
<div class="pic"> <c:set var="cbNews" value="${newsBiz.chengbenRecommendNews}"></c:set>
<a href="news.htm?news.id=${cbNews.id}" target="_blank">
<img src="${appPath}/image?image=${cbNews.image}&w=136&h=86"  alt="" />
<span class="blue fb">${cbNews.title}</span></a><br />
    <span class="gray">${cbNews.simpleContent}…</span><a href="news.htm?news.id=${cbNews.id}"
                                    target="_blank" class="blue">&gt;&gt;查看详细</a></div>
<ul class="dotli01">
					<c:forEach items="${newsBiz.top7ChengBenNews}" var="n">
                  <li><a href="news.htm?news.id=${n.id}" target="_blank">${n.title}</a><span class="ft10 gray mar_l10">${n.publishDateTxt}</span></li>
                  </c:forEach>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="fl w240 hide mar_t6 mar_l10 bg04">
          <div class="section04">
                <div class="ptitle">汽车装饰
                </div>
            <div class=" pad_t10 pad_l5">
              <div class="cardlist">
                <dl>
                  <dt><a href="#"><img src="Themes/images/pic-card03.jpg" width="94" height="69" alt="" /></a></dt>
                  <dd><b><a href="#" class="blue">张家口汽车保险推荐1</a></b>
                      <p>热线电话0313-8888888</p>
                    <p>[<a href="#" class="blue">详细</a>]</p>
                  </dd>
                </dl>
                <dl>
                  <dt><a href="#"><img src="Themes/images/pic-card03.jpg" width="94" height="69" alt="" /></a></dt>
                  <dd><b><a href="#" class="blue">张家口汽车保险推荐1</a></b>
                      <p>热线电话0313-8888888</p>
                    <p>[<a href="#" class="blue">详细</a>]</p>
                  </dd>
                </dl>
                <div class="clear"></div>
              </div>
            </div>
          </div>
          <div class="section_purchase mar_t6">
            <div class="ptitle"> <span class="more"><a href="other.htm?news.orderNum=8" class="red">更多</a> &gt;&gt;</span>
              <div class="icon red">汽车装饰指南</div>
            </div>
            <div class="pad_10">
              <ul class="dotli01">
              <c:forEach items="${newsBiz.top3ZhuangShiNews}" var="n">
                <li><a href="news.htm?news.id=${n.id}" target="_blank">${n.title }</a></li>
                </c:forEach>
              </ul>
            </div>
          </div>
        </div>
        <div class="clear"></div>
  </div>
  <div class="clear"></div>
</div>
<!-- end正文框架 -->
 
<jsp:include page="bottom.jsp"></jsp:include>

</body>
</html>
