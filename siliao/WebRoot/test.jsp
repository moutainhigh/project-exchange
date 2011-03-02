<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	Date date = new Date();
	pageContext.setAttribute("date",date);
%>
<fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/>