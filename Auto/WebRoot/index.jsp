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
    
    <!---- begin正文框架 ---->
<div class="wrapper mauto pad_5">
      <div class="search_area">
        <div class="fl ft14 w550 hide">最新动态：<a target="_blank" href="news.htm?news.id=${lastCommendNews.id}">${lastCommendNews.title}</a></div>
          <div class="fr w350 pad_l10 bls_gray">
          <form action="search.htm" name="searchForm" id="searchForm" method="get">
            <div class="fl mar_l5">
                          <select name="searchType" id="searchType">
                            <option value="1">资讯动态</option>
                            <option value="2">4S店信息</option>
                          </select>
                        </div>
                        
            <div class="fl mar_l5">
              <input name="key" type="text" class="gray input03" value="--请输入关键字--" onfocus="if(this.value=='--请输入关键字--') this.value=''" onblur="if(this.value=='') this.value='--请输入关键字--'"/>
            </div>
                        <div class="fl">
                         <input class="mar_l5 button07" type="submit" value="搜 索" />
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
               <h1> <a href="#" target="_blank"><img class="mar_r10" src="Themes/images/label_recommend.jpg" alt="今日热点" width="86" height="18" />张家口福特4S店开业！！</a></h1>
               <p class="gray">张家口福特4S张家口福特4S张家口福特4S张家口福特4S张家口福特4S张家口福特4S张家口福特4S ...<a href="http://www.babailin.com"
                                    target="_blank">&gt;&gt;查看详细</a></p>
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
                <a href="#" title="推荐任务">本地优惠</a></li>
                <li id="news_li" onmouseover="newsExchange(this,'speical_li','tab_news','tab_special');" style="font-weight:bold;">
                <a href="#" title="最新任务">本地新闻</a></li>
              </ul>
            </div>
            <div class=" pad_t5 pad_l10 pad_b10" id="tab_special">
            	<ul class="dotli01">
            	 <c:forEach items="${newsBiz.top9Special}" var="n">
                 <li><a href="news.htm?news.id=${n.id}" target="_blank">[优惠]${n.title}</a></li>
                 </c:forEach>
               </ul>
              <div class="clear"></div>
            </div>
            <div class=" pad_t5 pad_l10 pad_b10" id="tab_news" style="display: none;">
            	<ul class="dotli01">
            	 <c:forEach items="${newsBiz.top9News}" var="n">
                 <li><a href="news.htm?news.id=${n.id}" target="_blank">[新闻]${n.title}</a></li>
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
                    <div class="pic"> <a href="#" target="_blank"> <img src="Themes/images/pic-car.jpg"  width="136" height="86" alt="" /><span class="blue fb">通过良好的沟通</span></a><br />
                          <span class="gray">北京瑞虎在新年来临之季，全线优惠北京瑞虎在新年来临之季，全线优惠1000元…</span><a href="#"
                                    target="_blank" class="blue">&gt;&gt;查看详细</a></div>
                    <ul class="dotli01">
                      <li><a href="#" target="_blank">新手金牌会员问题总结帖</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                      <li><a href="#" target="_blank">客户选取中标，金牌失效后问题！</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                      <li><a href="#" target="_blank">【子中策划团队】金牌会员故事</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                      <li><a href="#" target="_blank">如何提高充值的安全意识！</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                      <li><a href="#" target="_blank">【金牌会员】这些你了解了多少？</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="section_purchase mar_t6">
                <div class="ptitle">
                  <span class="more"><a href="#">更多</a> >></span>
                  <div class="icon">10万以上车型降价</div>
                  
                </div>
                <div class="pad_10">
                    <ul class="dotli01">
	                  <li><a href="#" target="_blank">新手金牌会员问题总结帖</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                      <li><a href="#" target="_blank">客户选取中标，金牌失效后问题！</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                      <li><a href="#" target="_blank">【子中策划团队】金牌会员故事</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                      <li><a href="#" target="_blank">如何提高充值的安全意识！</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                      <li><a href="#" target="_blank">【金牌会员】这些你了解了多少？</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                    </ul>
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
                    <div class="pic"> <a href="#" target="_blank"> <img src="Themes/images/pic-car.jpg"  width="136" height="86" alt="" /><span class="blue fb">通过良好的沟通</span></a><br />
                        <span class="gray">北京瑞虎在新年来临之季，全线优惠北京瑞虎在新年来临之季，全线优惠1000元…</span><a href="#"
                                    target="_blank" class="blue">&gt;&gt;查看详细</a></div>
                    <ul class="dotli01" style="height: 102px;">
                    	<c:forEach items="${newsBiz.top6jjXindeNews}" var="n">
	                    <li><a href="news.htm?news.id=${n.id}" target="_blank">${n.title }</a><span class="ft10 gray mar_l10">${n.publishDate }</span></li>
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
                    <li><a href="news.htm?news.id=${n.id}" target="_blank">${n.title }</a><span class="ft10 gray mar_l10">${n.publishDate }</span></li>
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
<div class="pic"> <a href="#" target="_blank"> <img src="Themes/images/pic-car.jpg"  width="136" height="86" alt="" /><span class="blue fb">通过良好的沟通</span></a><br />
    <span class="gray">北京瑞虎在新年来临之季，全线优惠北京瑞虎在新年来临之季，全线优惠1000元…</span><a href="#"
                                    target="_blank" class="blue">&gt;&gt;查看详细</a></div>
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
            <div class="ptitle"> <span class="more"><a href="other.htm?news.orderNum=7">更多</a> &gt;&gt;</span>
              <div class="icon">养车费用</div>
            </div>
            <div class="pad_10">
              <div class="index_tips">
<div class="pic"> <a href="#" target="_blank"> <img src="Themes/images/pic-car.jpg"  width="136" height="86" alt="" /><span class="blue fb">通过良好的沟通</span></a><br />
    <span class="gray">北京瑞虎在新年来临之季，全线优惠北京瑞虎在新年来临之季，全线优惠1000元…</span><a href="#"
                                    target="_blank" class="blue">&gt;&gt;查看详细</a></div>
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
