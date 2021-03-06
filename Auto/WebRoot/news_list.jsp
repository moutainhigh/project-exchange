<%@ page language="java" import="java.util.*" pageEncoding="GBK"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK" />
    <c:choose>    	<c:when test="${not empty cate.seoTitle}">    		<c:set value="${cate.seoTitle}" var="t"></c:set>    	</c:when>    	<c:otherwise>    		<c:set value="${appTitle}" var="t"></c:set>    	</c:otherwise>    </c:choose>    <c:choose>    	<c:when test="${not empty cate.seoDesc}">    		<c:set value="${cate.seoDesc}" var="d"></c:set>    	</c:when>    	<c:otherwise>    		<c:set value="${appDesc}" var="d"></c:set>    	</c:otherwise>    </c:choose>
    <title>${t}</title>
    <meta name="description" content="${d}" />
    <meta name="keywords"  content="${appKeywords}" />
    <link href="Themes/basic.css" type="text/css" rel="stylesheet" />
    <link href="Themes/pagestyle.css" type="text/css" rel="stylesheet" />
    <script src="js/jquery.js"></script>
    <script src="js/common.js"></script>
</head>
<body>

    <jsp:include page="top.jsp" flush="false"></jsp:include>
    
    <!---- begin正文框架 ---->
<div class="wrapper mauto pad_5">
      <div class="search_area">
        <div class="fl ft14 w550 hide">张家口汽车网 <a href="${appPath}/index.htm">首页</a> &gt; <a href="#">新闻频道</a> &gt;</div>
<jsp:include page="sou.jsp" flush="false"></jsp:include>
      <div class="clear"></div>
      </div>
      
      <div class="mar_t6">
        <div class="fl w724 hide bg04">
          <div class="pad_20">
            <div class="yahei fb ft16 pad_b10">新闻列表</div>
            <div class="sighrTab">
              <ul>
                <li class=""><a href="specialList.htm">本地优惠信息</a></li>
                <li class="current">本地汽车新闻</li>
              </ul>
            </div>
            <div class="listView mar_t10">
              <ul>
              	<c:forEach items="${newsPageBean.resultList}" var="s">
                <li style="margin-bottom: 20px;">
                  <span class="gray fr">浏览${s.click}</span>
                  <span class="gray fr" style="margin-right: 60px;color:#168862;">${s.publishDate}</span>
                  <a href="news/${s.no}.html" target="_blank">${s.title}</a>
                  <div class="clearBlock"> &nbsp;</div>
                </li>
                </c:forEach>
              </ul>
              <div class="clear"></div>
              <div class="pad_10">
                <div class="pages"> 
                	<c:choose>
						<c:when test="${!newsPageBean.isFirstPage}">
							<a href="javascript:gotoPage(1);" class="nextprev">第一页</a>
							<a href="javascript:gotoPage(${newsPageBean.prePageIndex });" class="nextprev">上一页</a>
						</c:when>
						<c:otherwise>
							<span class="nextprev">第一页</span>
							<span class="nextprev">上一页</span> 
						</c:otherwise>
					</c:choose>
					<span class="current">
                  		${newsPageBean.pageIndex }/${newsPageBean.maxPage }
                  	</span> 
					<c:choose>
						<c:when test="${!newsPageBean.isLastPage}">
							<a href="javascript:gotoPage(${newsPageBean.nextPageIndex });" class="nextprev">下一页</a>
							<a href="javascript:gotoPage(${newsPageBean.maxPage });" class="nextprev">最后一页</a>
						</c:when>
						<c:otherwise>
							<span class="nextprev">下一页</span>
							<span class="nextprev">最后一页</span>
						</c:otherwise>
					</c:choose>                
                    <div class="clear"></div>
                </div>
              </div>
              <div class="clear"></div>
            </div>
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
<!-- end正文框架 -->
 
<jsp:include page="bottom.jsp"></jsp:include>

</body>
</html>
