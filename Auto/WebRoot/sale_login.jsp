<%@ page language="java" import="java.util.*" pageEncoding="GBK"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK" />
    <c:choose>    	<c:when test="${not empty news.seoTitle}">    		<c:set value="${news.seoTitle}" var="t"></c:set>    	</c:when>    	<c:otherwise>    		<c:set value="${appTitle}" var="t"></c:set>    	</c:otherwise>    </c:choose>    <c:choose>    	<c:when test="${not empty news.seoDesc}">    		<c:set value="${news.seoDesc}" var="d"></c:set>    	</c:when>    	<c:otherwise>    		<c:set value="${appDesc}" var="d"></c:set>    	</c:otherwise>    </c:choose>
    <title>${t}</title>
    <meta name="description" content="${d}" />
    <meta name="keywords"  content="${appKeywords}" />
    <link href="${appPath}/Themes/basic.css" type="text/css" rel="stylesheet" />
    <link href="${appPath}/Themes/pagestyle.css" type="text/css" rel="stylesheet" />
    <script src="${appPath}/js/jquery.js"></script>
    <script src="${appPath}/js/common.js"></script>
    <script type="text/javascript">
		function breakout_of_frame()
		{
		  // see http://www.thesitewizard.com/archive/framebreak.shtml
		  // for an explanation of this script and how to use it on your
		  // own website
		  if (top.location != location) {
		    top.location.href = document.location.href ;
		  }
		}
		function formKeyPress(event){
			if(event.keyCode == 13){
				submitForm();
			}else{
				return false;
			}
		}
		function submitForm(){
			var username = document.forms[0].username.value;
			var pwd = document.forms[0].password.value;
			//var rand = document.forms[0].rand.value;
			//if(username=='' || pwd=='' || rand==''){
			if(username=='' || pwd==''){
				alert('Please enter username and pwd');
				return false;
			}
			document.forms['loginForm'].submit();
		}
	</script>
</head>
<body onload="breakout_of_frame();document.forms['loginForm'].username.focus()" >

    <jsp:include page="top.jsp" flush="false"></jsp:include>
    
    <!---- begin正文框架 ---->
<div class="wrapper mauto pad_5">
      <div class="search_area">
        <div class="fl ft14 w550 hide">张家口汽车网 <a href="${appPath}/index.htm">首页</a> &gt; <a href="#">登录入口</a> &gt;</div>
		<jsp:include page="sou.jsp" flush="false"></jsp:include>
      <div class="clear"></div>
      </div>
      
      <div class="mar_t6">
          <div class="fl w724 hide">
          	<form action="LoginAction.htm" method="post" id="loginForm" name="loginForm">
	          <table style="margin: 50px auto;width: 98%; font-size: 14px; font-family: 宋体; border: 1px solid #F5F5F5;" align="center">
	          	<tr>
	          		<td style="text-align: right;" width="50%" height="30px;">用户名：</td>
	          		<td><input name="username" type="text" class="gray mar_l10 input02" /></td>
	          	</tr>
	          	<tr>
	          		<td style="text-align: right;" height="30px;">密码：</td>
	          		<td><input name="password" type="password" class="gray mar_l5 input02" /></td>
	          	</tr>
	          	<tr>
	          		<td style="text-align: right;" height="30px;">验证码：</td>
	          		<td><input id="verification_code" onfocus="$('#yanzheng').show();" style="width:30px;" type="text" name="rand" onkeypress="formKeyPress(event);" class="gray mar_l5 input02"/>
	          		<img src="${appPath}/rand" alt="验证码" id="yanzheng" height="17" style="display:inline;"/>
	          		</td>
	          	</tr>
	          	<tr>
	          		<td colspan="2" style="text-align: center;" height="30px;">
	          			<input class="mar_l5 btn-log" type="submit" value="登 录" style="height: 15px;" />
	          			<input class="mar_l10 btn-reg" type="submit" value="注册新用户" />
	          		</td>
	          	</tr>
	          </table>
	          </form>
          </div>
        
        <div class="fl w240 hide recommend mar_l6 bg04">
          <jsp:include page="tab.jsp" flush="false"></jsp:include>
          <jsp:include page="4s_top10.jsp" flush="false"></jsp:include>
          <jsp:include page="xinde_top10.jsp" flush="false"></jsp:include>
        </div>
        
        <div class="clear"></div>
      </div>
      
      <div class="clear"></div>
</div>
<!-- end正文框架 -->
 
<jsp:include page="bottom.jsp"></jsp:include>

</body>
</html>
