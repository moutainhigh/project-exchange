<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.throne212.fupin.domain.User"%>
<%
	if(session.getAttribute("userObj") == null){
		request.getRequestDispatcher("/login.jsp").forward(request,response);
	}
%>

<%
	if(session.getAttribute("url") != null&&!"".equals(session.getAttribute("url"))){
		//request.getRequestDispatcher((String)session.getAttribute("url")).forward(request,response);
		response.sendRedirect((String)session.getAttribute("url"));
		session.setAttribute("url",null);
		return;
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<!-- Design by 4wenzi Date:2004-07-04 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>管理首页</title>
<link rel="stylesheet" href="main_data/manage.css"/>
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
	margin:0;
	padding:0;
}
-->
</style>
<link href="${appPath}css2.css" rel="stylesheet" type="text/css" />
</head><body>
<br/>
<br/>
<br/>
<br/>
<hr/>
<div style="margin: 10px auto; width: 700px; line-height: 25px;">
<h2 style="text-align: center;">温馨提示</h2>
一、填写2011年12月报表必须填写预计脱贫户数、预计脱贫人数、预计村集体收入、两年规划资金。完成填写后，可自动生成2011年年度报表。 <br/>
二、检查2011年3月到12月的月度报表。（季度报表和年度报表均有月度报表生成） <br/>
（1）注意计量单位，如户、人、元、公里等。 <br/>
（2）如发现报表中贫困户户数、人数（包括有劳动能力、无劳动能力等项）与贫困户列表情况不一致的，请联系市扶贫办。 <br/>
（3）务必确认报表已按“保存”。如果某月报表未按“保存”，则该月数据无法计入2011年度报表。 <br/>
三、报表填报操作流程 <br/>
（1）报表填上数字后可按“暂存”，将数字暂时保存在你的账号（电脑）上，方便你随时更改。 <br/>
（2）确定所填数字无误后，请记得按“保存”，这样数据才能上报到系统后台汇总，该月数据才不会流失。 <br/>
（3）保存后如需修改数据，请按“申请解锁”，后台管理人员会退回给你修改。修改后，请记得按“保存”。<br/>
</div>

<hr/>


</body></html>