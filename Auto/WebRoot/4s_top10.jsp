<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<div class="section_purchase mar_t6">
            <div class="ptitle"> <span class="more"><a href="sale4s.htm" target="_blank">更多</a> &gt;&gt;</span>
              <div class="icon">张家口4S店推荐</div>
            </div>
            <div class="pad_10">
              <ul class="dotli01">
              	<c:forEach items="${newsBiz.top10Sale}" var="s">
                <li><a href="${appPath}/sale.htm?sale.id=${s.id}" target="_blank">${s.fullName}</a></li>
                </c:forEach>
              </ul>
            </div>
          </div>