<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
			<div class="section04">
                <div class="ptitle">汽车装饰
                </div>
            <div class=" pad_t10 pad_l5">
              <div class="cardlist">
              	<c:forEach items="${newsBiz.top3Zhuangshi}" var="z">
                <dl>
                  <dt><a href="zhuangshi.htm?zhuangshi.id=${z.id}" target="_blank"><img src="image?image=${z.image}&w=94&h=69" alt="" /></a></dt>
                  <dd><b><a href="zhuangshi.htm?zhuangshi.id=${z.id}" class="blue" target="_blank">${z.name}</a></b>
                      <p>热线电话:${z.tel }</p>
                    <p>[<a href="zhuangshi.htm?zhuangshi.id=${z.id}" class="blue" target="_blank">详细</a>]</p>
                  </dd>
                </dl>
                </c:forEach>
                <div class="clear"></div>
              </div>
            </div>
          </div>