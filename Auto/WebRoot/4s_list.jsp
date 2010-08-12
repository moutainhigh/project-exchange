<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK" />
    <title>${appTitle}</title>
    <meta name="description" content="${appDesc}" />
    <meta name="keywords"  content="${appKeywords}" />
    <link href="Themes/basic.css" type="text/css" rel="stylesheet" />
    <link href="Themes/pagestyle.css" type="text/css" rel="stylesheet" />
    <script src="js/jquery.js"></script>
    <script src="js/common.js"></script>
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
    </script>
</head>
<body>

    <jsp:include page="top.jsp" flush="false"></jsp:include>
    
    <!---- begin正文框架 ---->
<div class="wrapper mauto pad_5">
      <div class="search_area">
        <div class="fl ft14 w550 hide">张家口汽车网 <a href="#">首页</a> &gt; <a href="#">张家口4S店大全</a> &gt;</div>
<div class="fr w350 pad_l10 bls_gray">
            <div class="fl blue">站内搜索</div>
                        <div class="fl mar_l5">
                          <select name="select" id="select">
                            <option>请输入分类</option>
                          </select>
                        </div>
            <div class="fl mar_l5">
              <input type="text" class="gray input03" value="--请输入关键字--" />
            </div>
                        <div class="fl">
                          <input class="hledat" type="image" src="Themes/images/search-button.gif" name="input" value="Search" alt="Search" />
        </div></div>
      <div class="clear"></div>
      </div>
      
      <div class="mar_t6">
        <div class="fl w724 hide bg04">
          <div class="">
            <div class="security_title">张家口4S店大全</div>
            <div class="pad_10">
              <div class="shop_other02">
                <ul>
                  <c:forEach items="${salePageBean.resultList}" var="sale">
                  <li>
                    <div class="w125 fl"> <a href="sale.htm?sale.id=${sale.id}" target="_blank"> 
                    <img src="${appPath}/image?image=${sale.image}&w=120&h=90" class="b_gray" /></a></div>
                    <div class="fl w200 hide pad_l10">
                      <p> <a href="#" target="_blank">${sale.fullName}</a></p>
                      <p class="mar_t5">${sale.tel}</p>
                      <p>${sale.address}</p>
                    </div>
                    <div class="clear"> </div>
                  </li>
                  </c:forEach>
                </ul>
                
                <div class="clear"></div>
                <div class="pad_10">
                  <div class="pages">
                  	<c:choose>
						<c:when test="${!salePageBean.isFirstPage}">
							<a href="javascript:gotoPage(1);" class="nextprev">第一页</a>
							<a href="javascript:gotoPage(${salePageBean.prePageIndex });" class="nextprev">上一页</a>
						</c:when>
						<c:otherwise>
							<span class="nextprev">第一页</span>
							<span class="nextprev">上一页</span> 
						</c:otherwise>
					</c:choose>
					<span class="current">
                  		${salePageBean.pageIndex }/${salePageBean.maxPage }
                  	</span> 
					<c:choose>
						<c:when test="${!salePageBean.isLastPage}">
							<a href="javascript:gotoPage(${salePageBean.nextPageIndex });" class="nextprev">下一页</a>
							<a href="javascript:gotoPage(${salePageBean.maxPage });" class="nextprev">最后一页</a>
						</c:when>
						<c:otherwise>
							<span class="nextprev">下一页</span>
							<span class="nextprev">最后一页</span>
						</c:otherwise>
					</c:choose>
                    <div class="clear"></div>
                  </div>
                </div>
              </div>
            </div>
            <div class="clear"></div>
          </div>
        </div>
        
        <div class="fl w240 hide recommend mar_l6 bg04">
          <jsp:include page="tab.jsp" flush="false"></jsp:include>
          <div class="section_purchase mar_t6">
            <div class="ptitle"> <span class="more"><a href="#">更多</a> &gt;&gt;</span>
              <div class="icon">张家口4S店推荐</div>
            </div>
            <div class="pad_10">
              <ul class="dotli01">
                <li><a href="#" target="_blank">新手金牌会员问题总结帖</a></li>
                <li><a href="#" target="_blank">客户选取中标，金牌失效后问题！</a></li>
                <li><a href="#" target="_blank">【子中策划团队】金牌会员故事</a></li>
              </ul>
            </div>
          </div>
          <div class="section_purchase mar_t6">
            <div class="ptitle"> <span class="more"><a href="#">更多</a> &gt;&gt;</span>
              <div class="icon">网友购车真实感受</div>
            </div>
            <div class="pad_10">
              <ul class="dotli01">
                <li><a href="#" target="_blank">新手金牌会员问题总结帖</a></li>
                <li><a href="#" target="_blank">客户选取中标，金牌失效后问题！</a></li>
                <li><a href="#" target="_blank">【子中策划团队】金牌会员故事</a></li>
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
