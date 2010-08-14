<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
			   <div class="section04">
                <div class="ptitle">汽车保险</div>
                <div class=" pad_t10 pad_l5">
                  <div class="cardlist">
                  	<c:forEach items="${newsBiz.top3Baoxian}" var="b">
                    <dl>
                      <dt><a href="baoxian.htm?baoxian.id=${b.id}" target="_blank"><img src="image?image=${b.image}&w=94&h=69" alt="" /></a></dt>
                      <dd><b><a href="baoxian.htm?baoxian.id=${b.id}" target="_blank" class="blue">${b.name}</a></b>
                          <p>热线电话:${b.tel }</p>
                          <p>[<a href="baoxian.htm?baoxian.id=${b.id}" target="_blank" class="blue">详细</a>]</p>
                      </dd>
                    </dl>
                    </c:forEach>
                    <div class="clear"></div>
                  </div>
                </div>
              </div>