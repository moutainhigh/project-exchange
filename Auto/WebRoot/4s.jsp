<%@ page language="java" import="java.util.*" pageEncoding="GBK"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK" />
    <c:choose>
    	<c:when test="${not empty sale.seoTitle}">    		<c:set value="${sale.seoTitle}" var="t"></c:set>    	</c:when>    	<c:otherwise>    		<c:set value="${appTitle}" var="t"></c:set>    	</c:otherwise>    </c:choose>    <c:choose>    	<c:when test="${not empty sale.seoDesc}">    		<c:set value="${sale.seoDesc}" var="d"></c:set>    	</c:when>    	<c:otherwise>    		<c:set value="${appDesc}" var="d"></c:set>    	</c:otherwise>    </c:choose>
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
        <div class="fl mar_l100"><a href="#" style="color:#ffffff;">�� ҳ</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
        <img src="${appPath}/image?image=${sale.image}&w=340&230" alt="${sale.fullName }" width="340" height="230" />
      </div>
      </div>
    </div>
      
      
           <div class="fl w350 mar_l20">
               <div class="yahei fb ft16 pad_b10"> <a href="#">��˾����</a></div>
               <p class="">
               	${sale.description }
               </p>
             </div>
           <jsp:include page="tab.jsp" flush="false"></jsp:include>
        
        <div class="clear"></div>
      </div>
      
      <div class="part02 mar_t6">
        <div class="security_title"><strong>${sale.fullName} ��Ʒ�б�</strong></div>
        <div class="fl w200 mar_t6 bg04">
              <div class="section_purchase">
                <div class="ptitle">
                  <div class="icon">ȫ����Ʒ�б�</div>
                  
                </div>
                <div class="treeNav pad_10">
                <!-- begin �� -->
                <!-- class="treeNavopen"������״̬��class="treeNavclose"�����ر�״̬ -->
                <c:forEach items="${brandList}" var="p">
                	<ul style="background: none;">
	                    <div class="treeNavopen"><a href="sale.htm?sale.id=${sale.id}&brand.id=${p.id}" <c:if test="${p.id==brand.id}">style="text-decoration:underline;"</c:if>>${p.name}</a></div>
	                    <c:forEach items="${p.childBrands}" var="c">
	                    <ul>
	                        <div class="treeNavclose"><a href="sale.htm?sale.id=${sale.id}&brand.id=${c.id}" <c:if test="${c.id==brand.id}">style="text-decoration:underline;"</c:if>>${c.name}</a></div>
	                    </ul>
	                    </c:forEach>
	                </ul>
                </c:forEach>                
                <!-- end �� -->
            </div>
              </div>
        </div>
        <div class="fl w750 hide mar_l10 mar_t6">
          <table width="100%" align="center" cellpadding="1" cellspacing="1" class="tblist01">
            <tbody>
              <tr class="title2">
                <td width="8%" class="fb g_t_c">���ͣ���Ʒ��ͼƬ</td>
                <td width="16%" class="fb g_t_c">�����ͺ�</td>
                <td width="12%" class="fb g_t_c">�����̱���</td>
                <td width="8%" class="fb g_t_c">����ʱ��</td>
              </tr>
              <c:forEach items="${carPageBean.resultList}" var="c" varStatus="status">
              <tr class="list" onmouseover="this.className='list3';" onmouseout="this.className='list';">
                <td class="g_t_c"><a href="car.htm?car.id=${c.id}&sale.id=${sale.id}" target="_blank">
                	<img src="${appPath}/image?image=${c.image}&w=70&h=52" class="b_gray" /></a>
                </td>
                <td class="g_t_c"><a href="car.htm?car.id=${c.id}&sale.id=${sale.id}" target="_blank">${c.fullName}</a></td>
                <td class="g_t_c yellow_ef">��${c.price}</td>
                <td class="g_t_c gray">${c.priceDateTxt }</td>
              </tr>
              </c:forEach>
              <tr>
                <td class="g_t_c" colspan="4">
                	<c:choose>
						<c:when test="${!carPageBean.isFirstPage}">
							<a href="javascript:gotoPage(1);" class="nextprev">��һҳ</a>
							<a href="javascript:gotoPage(${carPageBean.prePageIndex });" class="nextprev">��һҳ</a>
						</c:when>
						<c:otherwise>
							<span class="nextprev">��һҳ</span>
							<span class="nextprev">��һҳ</span> 
						</c:otherwise>
					</c:choose>
					<span class="current">
                  		${carPageBean.pageIndex }/${carPageBean.maxPage }
                  	</span> 
					<c:choose>
						<c:when test="${!carPageBean.isLastPage}">
							<a href="javascript:gotoPage(${carPageBean.nextPageIndex });" class="nextprev">��һҳ</a>
							<a href="javascript:gotoPage(${carPageBean.maxPage });" class="nextprev">���һҳ</a>
						</c:when>
						<c:otherwise>
							<span class="nextprev">��һҳ</span>
							<span class="nextprev">���һҳ</span>
						</c:otherwise>
					</c:choose>
                </td>
              </tr>
            </tbody>            
          </table>
        </div>
            <div class="clear"></div>
  </div>


      <div class="clear"></div>
</div>
<!-- end���Ŀ�� -->
 
<jsp:include page="bottom.jsp"></jsp:include>

</body>
</html>