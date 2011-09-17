<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>



		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>广东扶贫信息网</title> 
	</head>
	<frameset id="left_right" border="0" frameborder="no" framespacing="0" cols="226,5,*" rows="*">
		<frame scrolling="yes" title="leftFrame" id="leftFrame" noresize="noresize" name="leftFrame" frameborder="0" src="${appPath}front_showTreeAndShiInfo.action?time=<%=System.currentTimeMillis()%>"></frame>
		<frame scrolling="no" title="midFrame" id="leftFrame" noresize="noresize" name="midFrame" frameborder="0" src="mid.html"></frame>
		<%
			String shiId = request.getParameter("shiId");
			String areaId = request.getParameter("areaId");
			String zhenId = request.getParameter("zhenId");
			String cunId = request.getParameter("cunId");
			if(shiId!=null&&!"".equals(shiId)){
		%>
		<frame title="detailFrame" id="detailFrame" name="detailFrame" src="${appPath}front_queryDiqu.action?shiId=${param.shiId}&areaId=${param.areaId}&zhenId=${param.zhenId}&cunId=${param.cunId}"></frame>
		<%
			}else{
		%>
		<frame title="detailFrame" id="detailFrame" name="detailFrame" src="/admin/front_shiStat.action?shiId=6"></frame>
		<%
			}
		%>
	</frameset>
	<noframes>
		<body>
		</body>
	</noframes>
</html>