<%@ page language="java" pageEncoding="GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script>
var navIndex = '${navIndex}';
$(function(){
	try{
		$("#TabPage1 li").eq(parseInt(navIndex)).addClass("Selected").css("font-weight","600");
	}catch (e) {}
});
</script>
							<div>
								<ul class="TabBarLevel1" id="TabPage1">
									<LI>
										<A href="http://${city.cityId}.jianzhi8.com/"><SPAN>${city.simpleName}��ҳ</SPAN>
										</A>
									</LI>
									<LI>
										<A href="http://${city.cityId}.jianzhi8.com/jianzhi/"><SPAN>��ְ����</SPAN>
										</A>
									</LI>
									<LI>
										<A href="http://${city.cityId}.jianzhi8.com/job/"><SPAN>ȫְ����</SPAN>
										</A>
									</LI>
									<LI>
										<A href="http://${city.cityId}.jianzhi8.com/renzheng/"><SPAN>��֤Ƶ��</SPAN>
										</A>
									</LI>
									<LI>
										<A href="http://${city.cityId}.jianzhi8.com/rencai/">���˼���</A>
									</LI>
								</ul>
							</div>
