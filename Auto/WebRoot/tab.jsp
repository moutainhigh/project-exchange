<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>        
        <div class="fl w240 hide">
          <div class="section03 mar_t6">
            <div class="ptitle">
              <ul class="tlboxtitle fl">
                <li id="speical_li" class="current" onmouseover="newsExchange(this,'news_li','tab_special','tab_news');" style="font-weight:bold;">
                <a href="specialList.htm" title="�Ƽ��Ż�" target="_blank">�����Ż�</a></li>
                <li id="news_li" onmouseover="newsExchange(this,'speical_li','tab_news','tab_special');" style="font-weight:bold;">
                <a href="newsList.htm" title="��������" target="_blank">��������</a></li>
              </ul>
            </div>
            <div class=" pad_t5 pad_l10 pad_b10" id="tab_special">
            	<ul class="dotli01">
            	 <c:forEach items="${newsBiz.top9Special}" var="n">
                 <li><a href="${appPath}/news/${n.no}.html" target="_blank" title="${n.simpleContent}">[�Ż�]${n.title}</a></li>
                 </c:forEach>
               </ul>
              <div class="clear"></div>
            </div>
            <div class=" pad_t5 pad_l10 pad_b10" id="tab_news" style="display: none;">
            	<ul class="dotli01">
            	 <c:forEach items="${newsBiz.top9News}" var="n">
                 <li><a href="${appPath}/news/${n.no}.html" target="_blank" title="${n.simpleContent}">[����]${n.title}</a></li>
                 </c:forEach>
               </ul>
              <div class="clear"></div>
            </div>
          </div>
        </div>
        