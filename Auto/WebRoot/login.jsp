<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty sessionScope.userName || isAdmin}">
                  用户名：<input name="username" type="text" class="gray mar_l10 input02" />&nbsp;&nbsp;
                  密码:<input name="password" type="password" class="gray mar_l5 input02" />&nbsp;&nbsp;
                  验证码：<input id="verification_code" onfocus="$('#yanzheng').show();" style="width:30px;" type="text" name="rand" onkeypress="formKeyPress(event);" class="gray mar_l5 input02"/>
                  <img src="${appPath}/rand" alt="验证码" id="yanzheng" height="17" style="display:inline;"/>
                  <input class="mar_l5 btn-log" type="submit" value="登 录" /><input class="mar_l10 btn-reg" type="submit" value="注册新用户" />
</c:if>
<c:if test="${not empty sessionScope.userName && !isAdmin}">欢迎您，${sessionScope.userName }，<a href="${appPath}/LogoutAction.htm" style="color: white;">注销</a></c:if>
                  