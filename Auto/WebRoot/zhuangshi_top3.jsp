<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
			<div class="section04">
                <div class="ptitle">����װ��
                </div>
            <div class=" pad_t10 pad_l5">
              <div class="cardlist">
              	<c:forEach items="${newsBiz.top3Zhuangshi}" var="z">
                <dl>
                  <dt><a href="zhuangshi.htm?zhuangshi.id=${z.id}" target="_blank"><img src="image?image=${z.image}&w=94&h=69" alt="" /></a></dt>
                  <dd><b><a href="zhuangshi.htm?zhuangshi.id=${z.id}" class="blue" target="_blank">${z.name}</a></b>
                      <p>���ߵ绰:${z.tel }</p>
                    <p>[<a href="zhuangshi.htm?zhuangshi.id=${z.id}" class="blue" target="_blank">��ϸ</a>]</p>
                  </dd>
                </dl>
                </c:forEach>
                <div class="clear"></div>
              </div>
            </div>
          </div>