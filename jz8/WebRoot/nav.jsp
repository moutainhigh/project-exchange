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
										<A href="http://${city.cityId}.jianzhi8.com/"><SPAN>${city.simpleName}首页</SPAN>
										</A>
									</LI>
									<LI>
										<A href="http://${city.cityId}.jianzhi8.com/jianzhi/"><SPAN>兼职工作</SPAN>
										</A>
									</LI>
									<LI>
										<A href="http://${city.cityId}.jianzhi8.com/job/"><SPAN>全职工作</SPAN>
										</A>
									</LI>
									<LI>
										<A href="http://${city.cityId}.jianzhi8.com/renzheng/"><SPAN>认证频道</SPAN>
										</A>
									</LI>
									<LI>
										<A href="http://${city.cityId}.jianzhi8.com/rencai/">个人简历</A>
									</LI>
								</ul>
							</div>
