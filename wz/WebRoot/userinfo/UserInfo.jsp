<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK" />
    <title>${appTitle}</title>
    <link href="${appPath}/Themes/basic.css" type="text/css" rel="stylesheet" />
    <link href="${appPath}/Register/Themes/layout.css" type="text/css" rel="stylesheet" />
    <link href="${appPath}/css/sidebar.css" type="text/css" rel="stylesheet" />
    <script src="${appPath}/js/jquery-1.4.2.min.js"></script>
    <script src="${appPath}/js/userinfo.js"></script>
    <script>
    	var leftMenuItemLoc = "${appPath}/userinfo/index";
    </script>
</head>
<body>
	<jsp:include page="../common/head.jsp"></jsp:include>
    <!---- begin正文框架 ---->
	<div class="wrapper mauto">
  		<div class="section" style="border-width: 3px;">
    		<div class="ptitle">
      			<div class="icon">用户中心<span style="color:red;">${reqMsg}</span></div>
    		</div>
	  		<jsp:include page="../common/UserLeft.jsp"></jsp:include>
			<div class="regInfos border_l1" style="width: 750px;">
				<jsp:include page="../msg.jsp"></jsp:include>
				<div id="banner1" class="banner">
            	</div>
   				<div class="fl hide pad_5 bsr_gray section mar_t6 fl " style="width: 700px;">
          			<div class="ptitle02">
            			<div class="icon">用户基本信息</div>
          			</div>
          			<div class="pad_10" style="padding-top: 7px;">
			            <ul class="dotli03 projects_list ft16">
			              <li>您好，<strong>${sessionScope.userObj.userName}</strong>，欢迎光临！</li>
			              <li>会员级别:&nbsp;<strong></strong></li>
			              <li>E-mail:&nbsp;<strong></strong></li>
			               <li>账户余额:&nbsp;<strong></strong>元</li>
			            </ul>
            			<div class="clear"></div>
          			</div>
           			<br/>
        		</div>
	    	</div>
	  		<div class="clear"></div>
		</div>
	</div>
	<!-- end正文框架 -->
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>

