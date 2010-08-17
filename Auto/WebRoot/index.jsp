<%@ page language="java" import="java.util.*" pageEncoding="GBK"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
		window.top['imageNews'] = '${top4ImageNews}';
    </script>
</head>
<body>

    <jsp:include page="top.jsp" flush="false"></jsp:include>
    
    <!---- begin正文框架 ---->
<div class="wrapper mauto pad_5">
      <div class="search_area">
        <div class="fl ft14 w550 hide">最新动态：<a  title="${n.simpleContent}" target="_blank" href="news/${newsBiz.lastedRecommendNews.no}.html">${newsBiz.lastedRecommendNews.title}</a></div>
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
      
           <div class="fl w350 hide recommend mar_l20" margin-left: 10px; width: 360px;>
             <div class="first">
             	<c:set var="focusNews" value="${newsBiz.focusNews}"></c:set>
               <h1><img class="mar_r10" src="Themes/images/label_recommend.jpg" alt="今日热点" width="86" height="18" style="float:left;"/><br/>
               <a href="news/${focusNews.no}.html" target="_blank" style="font-family:宋体;">
               ${focusNews.title }</a>
               </h1>
               <p class="gray">${focusNews.simpleContent}...<a href="news/${focusNews.no}.html"
                                    target="_blank">&gt;&gt;查看详细</a></p>
             </div>
             <div class="third">
               <ul class="dotli01">
                 <c:forEach items="${newsBiz.top7News}" var="n">
                 <li><a href="news/${n.no}.html" target="_blank" title="${n.simpleContent}"><!--[${n.category.name}]-->${n.title }</a><span class="ft10 gray mar_l10">${n.publishDateTxt}</span></li>
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
            <a href="specialList.htm" target="_blank">张家口车市动态</a> | 
            <a href="jjXinde.htm" target="_blank">购车心得</a> | 
            <a href="${appPath}/cepingNews.htm" target="_blank">专业测评</a> | 
            <a href="${appPath}/beijingNews.htm" target="_blank">北京降价</a> | 
            <a href="${appPath}/baoxianNews.htm" target="_blank">汽车保险</a></div>            
            <div class="fl w348 mar_t6">
              <div class="section_purchase">
                <div class="ptitle">
                  <span class="more"><a href="other.htm?news.orderNum=9" target="_blank">更多</a> >></span>
                  <div class="icon">北京降价-经济车型</div>
                  
                </div>
                <div class="pad_10">
                  <div class="index_tips">
                    <div class="pic"> 
                    	<c:set var="bjNews" value="${newsBiz.beijingRecommendNews}"></c:set>
                    	<a href="news/${bjNews.no}.html" target="_blank">                     		
                    		<img src="${appPath}/image?image=${bjNews.image}&w=136&h=86"  alt="" />
                    		<span class="blue fb">${bjNews.title }</span></a><br />
                          <span class="gray">${bjNews.simpleContent }…</span><a href="news/${bjNews.no}.html"
                                    target="_blank" class="blue">&gt;&gt;查看详细</a></div>
                    <ul class="dotli01">
                    	<c:forEach items="${newsBiz.top12BeijingNews}" var="n">
                      <li><a href="news/${n.no}.html" target="_blank" title="${n.simpleContent}">${n.title }</a><span class="ft10 gray mar_l10">${n.publishDateTxt }</span></li>
                      	</c:forEach>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="fl w350 hide recommend mar_l10 mar_t6 bls_gray pad_l10">
              <div class="section_purchase">
                <div class="ptitle"> <span class="more"><a href="jjXinde.htm" target="_blank">更多</a> &gt;&gt;</span>
                    <div class="icon">网友购车感受-经济车型</div>
                </div>
                <div class="pad_10">
                  <div class="index_tips">
                    <div class="pic"> 
                    		<c:set var="jjNews" value="${newsBiz.jjXindeRecommendNews}"></c:set>
                    		<a href="news/${jjNews.no}.html" target="_blank">                     		
                    		<img src="${appPath}/image?image=${jjNews.image}&w=136&h=86"  alt="" />
                    		<span class="blue fb">${jjNews.title }</span></a><br />
                          <span class="gray">${jjNews.simpleContent }…</span><a href="news/${jjNews.no}.html"
                                    target="_blank" class="blue">&gt;&gt;查看详细</a></div>
                    <ul class="dotli01" style="height: 102px;">
                    	<c:forEach items="${newsBiz.top6jjXindeNews}" var="n">
	                    <li><a href="news/${n.no}.html" target="_blank" title="${n.simpleContent}">${n.title }</a><span class="ft10 gray mar_l10">${n.publishDateTxt }</span></li>
	                    </c:forEach>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="section_purchase mar_t6">
                <div class="ptitle"> <span class="more"><a href="zjXinde.htm" target="_blank">更多</a> &gt;&gt;</span>
                    <div class="icon">网友购车感受-中级车型</div>
                </div>
                <div class="pad_10">
                  <ul class="dotli01">
                  	<c:forEach items="${newsBiz.top5zjXindeNews}" var="n">
                    <li><a href="news/${n.no}.html" target="_blank" title="${n.simpleContent}">${n.title }</a><span class="ft10 gray mar_l10">${n.publishDateTxt }</span></li>
                    </c:forEach>
                  </ul>
                </div>
              </div>
            </div>
            
            <div class="fl w240 hide mar_t6 mar_l10 bg04 bls_gray">
              <jsp:include page="baoxian_top3.jsp"></jsp:include>
              <div class="section_purchase mar_t6">
                <div class="ptitle"> <span class="more"><a href="other.htm?news.orderNum=5" class="red" target="_blank">更多</a> &gt;&gt;</span>
                    <div class="icon red">保险知识</div>
                </div>
                <div class="pad_10">
                  <ul class="dotli01">
                  <c:forEach items="${newsBiz.top5BaoxianNews}" var="n">
                    <li><a href="news/${n.no}.html" target="_blank" title="${n.simpleContent}">${n.title }</a></li>
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
              <c:forEach items="${newsBiz.top10Sale}" var="sale">
              <li>
                <div class="w125 fl"> <a href="sale.htm?sale.id=${sale.id}" target="_blank"> 
                <img src="${appPath}/image?image=${sale.image}&w=68&h=51" class="b_gray" /></a></div>
                <div class="fl w100 hide pad_l10">
                  <p> <a style="font-size:12px;white-space:normal;" href="sale.htm?sale.id=${sale.id}" target="_blank">${sale.fullName }</a></p>
                  <p>${sale.tel }</p>
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
    	<a href="${appPath}/baoyangNews.htm" target="_blank">维修保养</a> | 
    	<a href="${appPath}/chengbenNews.htm" target="_blank">养车费用</a> | 
    	<a href="${appPath}/zhuangshiNews.htm" target="_blank">汽车装饰</a></div>
        <div class="fl w348 mar_t6">
          <div class="section_purchase">
            <div class="ptitle"> <span class="more"><a href="other.htm?news.orderNum=6" target="_blank">更多</a> &gt;&gt;</span>
              <div class="icon">维修保养</div>
            </div>
            <div class="pad_10">
              <div class="index_tips">
<div class="pic"> 
<c:set var="byNews" value="${newsBiz.baoyangRecommendNews}"></c:set>
<a href="news/${byNews.no}.html" target="_blank"> 
<img src="${appPath}/image?image=${byNews.image}&w=136&h=86"  alt="" />
<span class="blue fb">${byNews.title}</span></a><br />
    <span class="gray">${byNews.simpleContent}…</span><a href="news/${byNews.no}.html"
                                    target="_blank" class="blue">&gt;&gt;查看详细</a></div>
<ul class="dotli01">
				<c:forEach items="${newsBiz.top7BaoYangNews}" var="n">
                  <li><a href="news/${n.no}.html" target="_blank" title="${n.simpleContent}">${n.title}</a><span class="ft10 gray mar_l10">${n.publishDateTxt}</span></li>
                  </c:forEach>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="fl w350 hide recommend mar_l10 mar_t6 bls_gray pad_l10">
          <div class="section_purchase">
            <div class="ptitle"> <span class="more"><a href="other.htm?news.orderNum=7" target="_blank">更多</a> &gt;&gt;</span>
              <div class="icon">养车费用</div>
            </div>
            <div class="pad_10">
              <div class="index_tips">
<div class="pic"> <c:set var="cbNews" value="${newsBiz.chengbenRecommendNews}"></c:set>
<a href="news/${cbNews.no}.html" target="_blank">
<img src="${appPath}/image?image=${cbNews.image}&w=136&h=86"  alt="" />
<span class="blue fb">${cbNews.title}</span></a><br />
    <span class="gray">${cbNews.simpleContent}…</span><a href="news/${cbNews.no}.html"
                                    target="_blank" class="blue">&gt;&gt;查看详细</a></div>
<ul class="dotli01">
					<c:forEach items="${newsBiz.top7ChengBenNews}" var="n">
                  <li><a href="news/${n.no}.html" target="_blank" title="${n.simpleContent}">${n.title}</a><span class="ft10 gray mar_l10">${n.publishDateTxt}</span></li>
                  </c:forEach>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="fl w240 hide mar_t6 mar_l10 bg04 bls_gray">
          <jsp:include page="zhuangshi_top3.jsp" flush="false"></jsp:include>
          <div class="section_purchase mar_t6">
            <div class="ptitle"> <span class="more"><a href="other.htm?news.orderNum=8" class="red" target="_blank">更多</a> &gt;&gt;</span>
              <div class="icon red">汽车装饰指南</div>
            </div>
            <div class="pad_10">
              <ul class="dotli01">
              <c:forEach items="${newsBiz.top3ZhuangShiNews}" var="n">
                <li><a href="news/${n.no}.html" target="_blank">${n.title }</a></li>
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
