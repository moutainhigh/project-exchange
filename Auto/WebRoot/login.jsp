<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty sessionScope.userName || isAdmin}">
                  �û�����<input name="username" type="text" class="gray mar_l10 input02" />&nbsp;&nbsp;
                  ����:<input name="password" type="password" class="gray mar_l5 input02" />&nbsp;&nbsp;
                  ��֤�룺<input id="verification_code" onfocus="$('#yanzheng').show();" style="width:30px;" type="text" name="rand" onkeypress="formKeyPress(event);" class="gray mar_l5 input02"/>
                  <img src="${appPath}/rand" alt="��֤��" id="yanzheng" height="17" style="display:inline;"/>
                  <input class="mar_l5 btn-log" type="submit" value="�� ¼" /><input class="mar_l10 btn-reg" type="submit" value="ע�����û�" />
</c:if>
<c:if test="${not empty sessionScope.userName && !isAdmin}">��ӭ����${sessionScope.userName }��<a href="${appPath}/LogoutAction.htm" style="color: white;">ע��</a></c:if>
                  