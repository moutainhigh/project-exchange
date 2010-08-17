<%@ page language="java" import="java.util.*" pageEncoding="GBK"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK" />
    <c:choose>
    	<c:when test="${not empty sale.seoTitle}">
    		<c:set value="${sale.seoTitle}" var="t"></c:set>
    	</c:when>
    	<c:otherwise>
    		<c:set value="${appTitle}" var="t"></c:set>
    	</c:otherwise>
    </c:choose>
    <c:choose>
    	<c:when test="${not empty sale.seoDesc}">
    		<c:set value="${sale.seoDesc}" var="d"></c:set>
    	</c:when>
    	<c:otherwise>
    		<c:set value="${appDesc}" var="d"></c:set>
    	</c:otherwise>
    </c:choose>
    <title>${t}</title>
    <meta name="description" content="${d}" />
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

    <!-- beginͷ����������� -->
<div class="header-top hide">
  <div class="mauto w980 bg03 h23">
    <div class="fl mar_r20 mar_l20 white"><a href="index.htm" class="white">�żҿ�������</a> >> <a href="sale4s.htm" class="white">�żҿ�������Ƶ��</a></div>
                <div class="fr mar_r25 mar_l20"><img src="Themes/images/ico-homepage.gif" alt="" /><a href="index.htm" class="white mar_l10">������վ��ҳ</a></div>
    <div class="fr mar_r5 white"><a href="javascript:void(0);" class="yellow" title="���뾭����">���뾭����</a></div>
  </div>
                <div class="clear"></div>
</div>
            
    <!-- endͷ����������� -->         

     <!-- beginͷ����� -->
     <div class="header">
       <div class="">
         <div class="w250 fl"><a href="index.htm"><img src="Themes/images/logo.jpg" alt="��վ��־" /></a><div class="w240 bg02 g_t_c pad_5">�żҿ���Ѷ�� ���·�վ www.zjk169.net</div></div>
         
         <div class="fr banner"><p class="mar_t30 mar_l40 fb yahei ft20">${sale.fullName }</p> 
<p class="mar_t10 mar_l40">�������ߣ�${sale.tel } ��ַ��${sale.address }</p>  
</div> 
         <div class="clear"></div> 
       </div>
       
       <div class="clear"></div>
     </div>
     <!-- endͷ����� -->
    
    <!---- begin���Ŀ�� ---->
    
<div class="wrapper mauto pad_5">
  <div class="mainNav02">
        <div class="fl mar_l100"><a href="sale.htm?sale.id=${sale.id}" target="_blank" style="color:#ffffff;">�� ҳ</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="carList.htm?sale.id=${sale.id}" style="color:#ffffff;">�����б�</a></div>
        <div class="fr mar_l10 white">
                <form action="LoginAction.htm" method="post">  
                <jsp:include page="login.jsp" flush="false"></jsp:include>
         </form>
         </div>
        <div class="clear"></div>
  </div>
<div class="part01 mar_t6">
           <div class="fl w348 hide">
      <div class="b_3gray">
      <div class="pic-imgnews">
        <img src="${appPath}/image?image=${car.image}&w=340&230" alt="${car.fullName }" width="340" height="230" />
      </div>
      </div>
    </div>     
      
           <div class="fl w350 mar_l20">
               <ul style="font-size: 16px;font-weight: 600; margin-top: 50px;">
               		<li style="margin: 2px 0 20px 2px;">�������ƣ� ${car.fullName }</li>
               		<li style="margin: 2px 0 20px 2px;">���ͱ��ۣ� <span  class="yellow_ef">��${car.price }</span></li>
               		<li style="margin: 2px 0 20px 2px;">����ʱ�䣺${car.priceDateTxt }</li>
               </ul>
             </div>
           <jsp:include page="tab.jsp" flush="false"></jsp:include>
        
        <div class="clear"></div>
      </div>
      
      <div class="part02 mar_t6">
        <div class="security_title"><strong>${sale.fullName} ���Ͳ���</strong></div>
        <div class="fl hide mar_l10 mar_t6">
          	${car.detail}
        </div>
            <div class="clear"></div>
  </div>


      <div class="clear"></div>
</div>
<!-- end���Ŀ�� -->
 
<jsp:include page="bottom.jsp"></jsp:include>

</body>
</html>
