<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:if test="${not empty requestScope.reqMsg}">
    <div style="text-align:center; height:30px; font-size:12px;color:red;" id="reqMsg">
		<div style="margin:2px auto;border:1px solid #FF0000; background-color:#FFCE00; line-height:30px;height:30px; width:400px;">
			${requestScope.reqMsg}
		</div>
	</div>
	<script>
		function fadeMsg(){
			$('#reqMsg').slideUp('normal');
		}
		$(function(){
			window.setTimeout('fadeMsg()',3000);
		});
	</script>
	</c:if>
