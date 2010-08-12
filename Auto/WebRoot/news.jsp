<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK" />
    <c:choose>
    	<c:when test="${not empty news.seoTitle}">
    		<c:set value="${news.seoTitle}" var="t"></c:set>
    	</c:when>
    	<c:otherwise>
    		<c:set value="${appTitle}" var="t"></c:set>
    	</c:otherwise>
    </c:choose>
    <c:choose>
    	<c:when test="${not empty news.seoDesc}">
    		<c:set value="${news.seoDesc}" var="d"></c:set>
    	</c:when>
    	<c:otherwise>
    		<c:set value="${appDesc}" var="d"></c:set>
    	</c:otherwise>
    </c:choose>
    <title>${t}</title>
    <meta name="description" content="${d}" />
    <meta name="keywords"  content="${appKeywords}" />
    <link href="${appPath}/Themes/basic.css" type="text/css" rel="stylesheet" />
    <link href="${appPath}/Themes/pagestyle.css" type="text/css" rel="stylesheet" />
    <script src="${appPath}/js/jquery.js"></script>
    <script src="${appPath}/js/common.js"></script>
</head>
<body>

    <jsp:include page="top.jsp" flush="false"></jsp:include>
    
    <!---- begin���Ŀ�� ---->
<div class="wrapper mauto pad_5">
      <div class="search_area">
        <div class="fl ft14 w550 hide">�żҿ������� <a href="#">��ҳ</a> &gt; <a href="#">${news.category.name}</a> &gt; <a href="#">${news.title}</a></div>
<div class="fr w350 pad_l10 bls_gray">
            <div class="fl blue">վ������</div>
                        <div class="fl mar_l5">
                          <select name="select" id="select">
                            <option>���������</option>
                          </select>
                        </div>
            <div class="fl mar_l5">
              <input type="text" class="gray input03" value="--������ؼ���--" />
            </div>
                        <div class="fl">
                          <input class="hledat" type="image" src="${appPath}/Themes/images/search-button.gif" name="input" value="Search" alt="Search" />
        </div></div>
      <div class="clear"></div>
      </div>
      
      <div class="mar_t6">
        <div class="fl w724 hide"><div class="pad_20 Main-Article bg04">
          <div class="hd bbd_gray">
            <h1> ${news.title } </h1>
            <div class="titBar mauto">
              <div class="info"> ${news.publishDate } <span class="infoCol"><span class="where"><a target="_blank" href="#">${news.author}</a></span></span></div>
            </div>
          </div>
          <div class="mar_t10">
				${news.content}
			</div>
          </div>
          <div class="section_purchase mar_t6">
            <div class="ptitle">
              <div class="icon">�����Ϣ�Ƽ�</div>
            </div>
            <div class="pad_20">
              <ul class="dotli01">
              	<c:forEach items="${other5RecommendNewsList}" var="n"></c:forEach>
                <li><a href="news.htm?news.id=${n.id}" target="_blank">${n.title}</a><span class="ft10 gray mar_l10">${n.pubishDateTxt }</span></li>
              </ul>
            </div>
          </div>
        </div>
        
        <div class="fl w240 hide recommend mar_l6 bg04">
          <jsp:include page="tab.jsp" flush="false"></jsp:include>
          <div class="section_purchase mar_t6">
            <div class="ptitle"> <span class="more"><a href="#">����</a> &gt;&gt;</span>
              <div class="icon">���¶�̬</div>
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
