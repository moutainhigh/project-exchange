<%@ page language="java" import="java.util.*" pageEncoding="GBK"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
    
    <!---- begin���Ŀ�� ---->
<div class="wrapper mauto pad_5">
      <div class="search_area">
        <div class="fl ft14 w550 hide">�żҿ������� <a href="${appPath}/index.htm">��ҳ</a> &gt; <a href="#">�żҿ�4S���ȫ</a> &gt;</div>
<jsp:include page="sou.jsp" flush="false"></jsp:include>
      <div class="clear"></div>
      </div>
      
      <div class="mar_t6">
        <div class="fl w724 hide bg04">
          <div class="">
            <div class="security_title">�żҿ�4S���ȫ</div>
            <div class="pad_10">
              <div class="shop_other02">
                <ul>
                  <c:forEach items="${salePageBean.resultList}" var="sale">
                  <li>
                    <div class="w125 fl"> <a href="sale.htm?sale.id=${sale.id}" target="_blank"> 
                    <img src="${appPath}/image?image=${sale.image}&w=120&h=90" class="b_gray" width="120" height="90"/></a></div>
                    <div class="fl w200 hide pad_l10">
                      <p> <a href="sale.htm?sale.id=${sale.id}" target="_blank">${sale.fullName}</a></p>
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
							<a href="javascript:gotoPage(1);" class="nextprev">��һҳ</a>
							<a href="javascript:gotoPage(${salePageBean.prePageIndex });" class="nextprev">��һҳ</a>
						</c:when>
						<c:otherwise>
							<span class="nextprev">��һҳ</span>
							<span class="nextprev">��һҳ</span> 
						</c:otherwise>
					</c:choose>
					<span class="current">
                  		${salePageBean.pageIndex }/${salePageBean.maxPage }
                  	</span> 
					<c:choose>
						<c:when test="${!salePageBean.isLastPage}">
							<a href="javascript:gotoPage(${salePageBean.nextPageIndex });" class="nextprev">��һҳ</a>
							<a href="javascript:gotoPage(${salePageBean.maxPage });" class="nextprev">���һҳ</a>
						</c:when>
						<c:otherwise>
							<span class="nextprev">��һҳ</span>
							<span class="nextprev">���һҳ</span>
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
          <jsp:include page="4s_top10.jsp" flush="false"></jsp:include>
          <jsp:include page="xinde_top10.jsp" flush="false"></jsp:include>
        </div>
        
        <div class="clear"></div>
      </div>
      
      <div class="clear"></div>
</div> 
<!-- end���Ŀ�� -->
 
<jsp:include page="bottom.jsp"></jsp:include>

</body>
</html>
