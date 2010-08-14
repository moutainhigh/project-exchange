<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<div class="section_purchase mar_t6">
            <div class="ptitle"> <span class="more"><a href="jjXinde.htm" target="_blank">更多</a> &gt;&gt;</span>
              <div class="icon">网友购车真实感受</div>
            </div>
            <div class="pad_10">
              <ul class="dotli01">
                <c:forEach items="${newsBiz.top10Xinde}" var="s">
                <li><a href="news/${s.no}.html" target="_blank">${s.title}</a></li>
                </c:forEach>
              </ul>
            </div>
          </div>