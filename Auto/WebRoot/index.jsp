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
		function newsExchange(tabLi,otherLi,tabId,hideId){
			if($(tabLi).attr('class') == 'current'){
				return false;
			}
			$(tabLi).addClass('current');
			$('#'+otherLi).removeClass('current');
			$('#'+hideId).hide();
			$('#'+tabId).show();
		}
    </script>
</head>
<body>

    <jsp:include page="top.jsp" flush="false"></jsp:include>
    
    <!---- begin���Ŀ�� ---->
<div class="wrapper mauto pad_5">
      <div class="search_area">
        <div class="fl ft14 w550 hide">���¶�̬��<a target="_blank" href="news.htm?news.id=${lastCommendNews.id}">${lastCommendNews.title}</a></div>
          <div class="fr w350 pad_l10 bls_gray">
          <form action="search.htm" name="searchForm" id="searchForm" method="get">
            <div class="fl mar_l5">
                          <select name="searchType" id="searchType">
                            <option value="1">��Ѷ��̬</option>
                            <option value="2">4S����Ϣ</option>
                          </select>
                        </div>
                        
            <div class="fl mar_l5">
              <input name="key" type="text" class="gray input03" value="--������ؼ���--" onfocus="if(this.value=='--������ؼ���--') this.value=''" onblur="if(this.value=='') this.value='--������ؼ���--'"/>
            </div>
                        <div class="fl">
                         <input class="mar_l5 button07" type="submit" value="�� ��" />
        </div></form>
        
        </div>
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
               <h1> <a href="#" target="_blank"><img class="mar_r10" src="Themes/images/label_recommend.jpg" alt="�����ȵ�" width="86" height="18" />�żҿڸ���4S�꿪ҵ����</a></h1>
               <p class="gray">�żҿڸ���4S�żҿڸ���4S�żҿڸ���4S�żҿڸ���4S�żҿڸ���4S�żҿڸ���4S�żҿڸ���4S ...<a href="http://www.babailin.com"
                                    target="_blank">&gt;&gt;�鿴��ϸ</a></p>
             </div>
             <div class="third">
               <ul class="dotli01">
                 <c:forEach items="${newsBiz.top7News}" var="n">
                 <li><a href="news.htm?news.id=${n.id}" target="_blank">[${n.category.name}]${n.title }</a><span class="ft10 gray mar_l10">${n.publishDate}</span></li>
                 </c:forEach>
               </ul>
               <div class="clear"> </div>
             </div>
        </div>
        
        <div class="fl w240 hide mar_l10">
          <div class="section03 mar_t6">
            <div class="ptitle">
              <ul class="tlboxtitle fl">
                <li id="speical_li" class="current" onmouseover="newsExchange(this,'news_li','tab_special','tab_news');" style="font-weight:bold;">
                <a href="#" title="�Ƽ�����">�����Ż�</a></li>
                <li id="news_li" onmouseover="newsExchange(this,'speical_li','tab_news','tab_special');" style="font-weight:bold;">
                <a href="#" title="��������">��������</a></li>
              </ul>
            </div>
            <div class=" pad_t5 pad_l10 pad_b10" id="tab_special">
            	<ul class="dotli01">
            	 <c:forEach items="${newsBiz.top9Special}" var="n">
                 <li><a href="news.htm?news.id=${n.id}" target="_blank">[�Ż�]${n.title}</a></li>
                 </c:forEach>
               </ul>
              <div class="clear"></div>
            </div>
            <div class=" pad_t5 pad_l10 pad_b10" id="tab_news" style="display: none;">
            	<ul class="dotli01">
            	 <c:forEach items="${newsBiz.top9News}" var="n">
                 <li><a href="news.htm?news.id=${n.id}" target="_blank">[����]${n.title}</a></li>
                 </c:forEach>
               </ul>
              <div class="clear"></div>
            </div>
          </div>
        </div>
        
        <div class="clear"></div>
      </div>
      
      <div class="part02 mar_t6">
            <div class="purchase-title">
            <a href="specialList.htm">�żҿڳ��ж�̬</a> | 
            <a href="jjXinde.htm">�����ĵ�</a> | 
            <a href="other.htm?news.orderNum=4">רҵ����</a> | 
            <a href="other.htm?news.orderNum=9">��������</a> | 
            <a href="other.htm?news.orderNum=5">��������</a></div>            
            <div class="fl w348 mar_t6">
              <div class="section_purchase">
                <div class="ptitle">
                  <span class="more"><a href="#">����</a> >></span>
                  <div class="icon">��������-���ó���</div>
                  
                </div>
                <div class="pad_10">
                  <div class="index_tips">
                    <div class="pic"> <a href="#" target="_blank"> <img src="Themes/images/pic-car.jpg"  width="136" height="86" alt="" /><span class="blue fb">ͨ�����õĹ�ͨ</span></a><br />
                          <span class="gray">����������������֮����ȫ���Żݱ���������������֮����ȫ���Ż�1000Ԫ��</span><a href="#"
                                    target="_blank" class="blue">&gt;&gt;�鿴��ϸ</a></div>
                    <ul class="dotli01">
                      <li><a href="#" target="_blank">���ֽ��ƻ�Ա�����ܽ���</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                      <li><a href="#" target="_blank">�ͻ�ѡȡ�б꣬����ʧЧ�����⣡</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                      <li><a href="#" target="_blank">�����в߻��Ŷӡ����ƻ�Ա����</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                      <li><a href="#" target="_blank">�����߳�ֵ�İ�ȫ��ʶ��</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                      <li><a href="#" target="_blank">�����ƻ�Ա����Щ���˽��˶��٣�</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="section_purchase mar_t6">
                <div class="ptitle">
                  <span class="more"><a href="#">����</a> >></span>
                  <div class="icon">10�����ϳ��ͽ���</div>
                  
                </div>
                <div class="pad_10">
                    <ul class="dotli01">
	                  <li><a href="#" target="_blank">���ֽ��ƻ�Ա�����ܽ���</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                      <li><a href="#" target="_blank">�ͻ�ѡȡ�б꣬����ʧЧ�����⣡</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                      <li><a href="#" target="_blank">�����в߻��Ŷӡ����ƻ�Ա����</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                      <li><a href="#" target="_blank">�����߳�ֵ�İ�ȫ��ʶ��</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                      <li><a href="#" target="_blank">�����ƻ�Ա����Щ���˽��˶��٣�</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                    </ul>
                </div>
              </div>
            </div>
            
            <div class="fl w350 hide recommend mar_l10 mar_t6 bls_gray pad_l10">
              <div class="section_purchase">
                <div class="ptitle"> <span class="more"><a href="jjXinde.htm">����</a> &gt;&gt;</span>
                    <div class="icon">���ѹ�������-���ó���</div>
                </div>
                <div class="pad_10">
                  <div class="index_tips">
                    <div class="pic"> <a href="#" target="_blank"> <img src="Themes/images/pic-car.jpg"  width="136" height="86" alt="" /><span class="blue fb">ͨ�����õĹ�ͨ</span></a><br />
                        <span class="gray">����������������֮����ȫ���Żݱ���������������֮����ȫ���Ż�1000Ԫ��</span><a href="#"
                                    target="_blank" class="blue">&gt;&gt;�鿴��ϸ</a></div>
                    <ul class="dotli01" style="height: 102px;">
                    	<c:forEach items="${newsBiz.top6jjXindeNews}" var="n">
	                    <li><a href="news.htm?news.id=${n.id}" target="_blank">${n.title }</a><span class="ft10 gray mar_l10">${n.publishDate }</span></li>
	                    </c:forEach>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="section_purchase mar_t6">
                <div class="ptitle"> <span class="more"><a href="zjXinde.htm">����</a> &gt;&gt;</span>
                    <div class="icon">���ѹ�������-�м�����</div>
                </div>
                <div class="pad_10">
                  <ul class="dotli01">
                  	<c:forEach items="${newsBiz.top5zjXindeNews}" var="n">
                    <li><a href="news.htm?news.id=${n.id}" target="_blank">${n.title }</a><span class="ft10 gray mar_l10">${n.publishDate }</span></li>
                    </c:forEach>
                  </ul>
                </div>
              </div>
            </div>
            
            <div class="fl w240 hide mar_t6 mar_l10 bg04 bls_gray">
              <div class="section04">
                <div class="ptitle">��������
                </div>
                <div class=" pad_t10 pad_l5">
                  <div class="cardlist">
                    <dl>
                      <dt><a href="#"><img src="Themes/images/pic-card02.jpg" width="81" height="60" alt="" /></a></dt>
                      <dd><b><a href="#" class="blue">�żҿ����������Ƽ�1</a></b>
                          <p>���ߵ绰0313-8888888</p>
                          <p>[<a href="#" class="blue">��ϸ</a>]</p>
                      </dd>
                    </dl>
                    <dl>
                      <dt><a href="#"><img src="Themes/images/pic-card02.jpg" width="81" height="60" alt="" /></a></dt>
                      <dd><b><a href="#" class="blue">�żҿ����������Ƽ�1</a></b>
                          <p>���ߵ绰0313-8888888</p>
                        <p>[<a href="#" class="blue">��ϸ</a>]</p>
                      </dd>
                    </dl>
                    <dl>
                      <dt><a href="#"><img src="Themes/images/pic-card02.jpg" width="81" height="60" alt="" /></a></dt>
                      <dd><b><a href="#" class="blue">�żҿ����������Ƽ�1</a></b>
                          <p>���ߵ绰0313-8888888</p>
                        <p>[<a href="#" class="blue">��ϸ</a>]</p>
                      </dd>
                    </dl>
                    <div class="clear"></div>
                  </div>
                </div>
              </div>
              <div class="section_purchase mar_t6">
                <div class="ptitle"> <span class="more"><a href="#" class="red">����</a> &gt;&gt;</span>
                    <div class="icon red">����֪ʶ</div>
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
        	<a href="sale4s.htm">�żҿ�����4S��</a> | 
        	<a href="specialList.htm">�żҿڳ�������</a> | 
        	<a href="#">ע�����</a></div>
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
    	<a href="other.htm?news.orderNum=6">ά�ޱ���</a> | 
    	<a href="other.htm?news.orderNum=7">��������</a> | 
    	<a href="other.htm?news.orderNum=8">����װ��</a></div>
        <div class="fl w348 mar_t6">
          <div class="section_purchase">
            <div class="ptitle"> <span class="more"><a href="other.htm?news.orderNum=6">����</a> &gt;&gt;</span>
              <div class="icon">ά�ޱ���</div>
            </div>
            <div class="pad_10">
              <div class="index_tips">
<div class="pic"> <a href="#" target="_blank"> <img src="Themes/images/pic-car.jpg"  width="136" height="86" alt="" /><span class="blue fb">ͨ�����õĹ�ͨ</span></a><br />
    <span class="gray">����������������֮����ȫ���Żݱ���������������֮����ȫ���Ż�1000Ԫ��</span><a href="#"
                                    target="_blank" class="blue">&gt;&gt;�鿴��ϸ</a></div>
<ul class="dotli01">
				<c:forEach items="${newsBiz.top7BaoYangNews}" var="n">
                  <li><a href="news.htm?news.id=${n.id}" target="_blank">${n.title}</a><span class="ft10 gray mar_l10">${n.publishDate}</span></li>
                  </c:forEach>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="fl w350 hide recommend mar_l10 mar_t6 bls_gray pad_l10">
          <div class="section_purchase">
            <div class="ptitle"> <span class="more"><a href="other.htm?news.orderNum=7">����</a> &gt;&gt;</span>
              <div class="icon">��������</div>
            </div>
            <div class="pad_10">
              <div class="index_tips">
<div class="pic"> <a href="#" target="_blank"> <img src="Themes/images/pic-car.jpg"  width="136" height="86" alt="" /><span class="blue fb">ͨ�����õĹ�ͨ</span></a><br />
    <span class="gray">����������������֮����ȫ���Żݱ���������������֮����ȫ���Ż�1000Ԫ��</span><a href="#"
                                    target="_blank" class="blue">&gt;&gt;�鿴��ϸ</a></div>
<ul class="dotli01">
					<c:forEach items="${newsBiz.top7ChengBenNews}" var="n">
                  <li><a href="news.htm?news.id=${n.id}" target="_blank">${n.title}</a><span class="ft10 gray mar_l10">${n.publishDate}</span></li>
                  </c:forEach>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="fl w240 hide mar_t6 mar_l10 bg04">
          <div class="section04">
                <div class="ptitle">����װ��
                </div>
            <div class=" pad_t10 pad_l5">
              <div class="cardlist">
                <dl>
                  <dt><a href="#"><img src="Themes/images/pic-card03.jpg" width="94" height="69" alt="" /></a></dt>
                  <dd><b><a href="#" class="blue">�żҿ����������Ƽ�1</a></b>
                      <p>���ߵ绰0313-8888888</p>
                    <p>[<a href="#" class="blue">��ϸ</a>]</p>
                  </dd>
                </dl>
                <dl>
                  <dt><a href="#"><img src="Themes/images/pic-card03.jpg" width="94" height="69" alt="" /></a></dt>
                  <dd><b><a href="#" class="blue">�żҿ����������Ƽ�1</a></b>
                      <p>���ߵ绰0313-8888888</p>
                    <p>[<a href="#" class="blue">��ϸ</a>]</p>
                  </dd>
                </dl>
                <div class="clear"></div>
              </div>
            </div>
          </div>
          <div class="section_purchase mar_t6">
            <div class="ptitle"> <span class="more"><a href="other.htm?news.orderNum=8" class="red">����</a> &gt;&gt;</span>
              <div class="icon red">����װ��ָ��</div>
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
<!-- end���Ŀ�� -->
 
<jsp:include page="bottom.jsp"></jsp:include>

</body>
</html>
