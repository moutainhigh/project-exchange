<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
	boolean ownCookie = false;
	Cookie[] cs = request.getCookies();
	if(cs != null){
		for(Cookie c : cs){
			System.out.println("cookie:" + c.getName());
			if("jz8_wap_city_id".equals(c.getName())){
				String cityId = c.getValue();
				response.sendRedirect("/" + cityId + "/");
				ownCookie = true;
			}
		}
	}
	if(!ownCookie){
%>
<jsp:forward page="/default.do"></jsp:forward>
<%
	}
%>