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
</head>
<body>

    <jsp:include page="top.jsp" flush="false"></jsp:include>
    
    <!---- begin���Ŀ�� ---->
<div class="wrapper mauto pad_5">
      <div class="search_area">
        <div class="fl ft14 w550 hide">�żҿ������� <a href="#">��ҳ</a> &gt; <a href="#">����Ƶ��</a> &gt;</div>
<jsp:include page="sou.jsp" flush="false"></jsp:include>
      <div class="clear"></div>
      </div>
      
      <div class="mar_t6">
        <div class="fl w724 hide bg04">
          <div class="pad_20">
            <div class="yahei fb ft16 pad_b10">�����б�</div>
            <div class="listView mar_t10">
              <ul>
              	<c:forEach items="${newsPageBean.resultList}" var="s">
                <li>
                  <div class="green">${s.publishDate}</div>
                  <span class="gray fr">���${s.click}</span>
                  <a href="news.htm?news.id=${s.id}">${s.title}</a>
                  <div class="clearBlock"> &nbsp;</div>
                </li>
                </c:forEach>
              </ul>
              <div class="clear"></div>
              <div class="pad_10">
                <div class="pages"> 
                	<c:choose>
						<c:when test="${!newsPageBean.isFirstPage}">
							<a href="javascript:gotoPage(1);" class="nextprev">��һҳ</a>
							<a href="javascript:gotoPage(${newsPageBean.prePageIndex });" class="nextprev">��һҳ</a>
						</c:when>
						<c:otherwise>
							<span class="nextprev">��һҳ</span>
							<span class="nextprev">��һҳ</span> 
						</c:otherwise>
					</c:choose>
					<span class="current">
                  		${newsPageBean.pageIndex }/${newsPageBean.maxPage }
                  	</span> 
					<c:choose>
						<c:when test="${!newsPageBean.isLastPage}">
							<a href="javascript:gotoPage(${newsPageBean.nextPageIndex });" class="nextprev">��һҳ</a>
							<a href="javascript:gotoPage(${newsPageBean.maxPage });" class="nextprev">���һҳ</a>
						</c:when>
						<c:otherwise>
							<span class="nextprev">��һҳ</span>
							<span class="nextprev">���һҳ</span>
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
          <div class="section_purchase mar_t6">
            <div class="ptitle"> <span class="more"><a href="#">����</a> &gt;&gt;</span>
              <div class="icon">�żҿ�4S���Ƽ�</div>
            </div>
            <div class="pad_10">
              <ul class="dotli01">
                <li><a href="#" target="_blank">���ֽ��ƻ�Ա�����ܽ���</a></li>
                <li><a href="#" target="_blank">�ͻ�ѡȡ�б꣬����ʧЧ�����⣡</a></li>
                <li><a href="#" target="_blank">�����в߻��Ŷӡ����ƻ�Ա����</a></li>
              </ul>
            </div>
          </div>
          <div class="section_purchase mar_t6">
            <div class="ptitle"> <span class="more"><a href="#">����</a> &gt;&gt;</span>
              <div class="icon">���ѹ�����ʵ����</div>
            </div>
            <div class="pad_10">
              <ul class="dotli01">
                <li><a href="#" target="_blank">���ֽ��ƻ�Ա�����ܽ���</a></li>
                <li><a href="#" target="_blank">�ͻ�ѡȡ�б꣬����ʧЧ�����⣡</a></li>
                <li><a href="#" target="_blank">�����в߻��Ŷӡ����ƻ�Ա����</a></li>
              </ul>
            </div>
          </div>
        </div>
        
        <div class="clear"></div>
      </div>
      
      <div class="clear"></div>
</div> 
<!-- end���Ŀ�� -->
 
<jsp:include page="bottom.jsp"></jsp:include>

</body>
</html>
