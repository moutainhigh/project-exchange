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
    <!---- begin���Ŀ�� ---->
	<div class="wrapper mauto">
  		<div class="section" style="border-width: 3px;">
    		<div class="ptitle">
      			<div class="icon">�û�����<span style="color:red;">${reqMsg}</span></div>
    		</div>
	  		<jsp:include page="../common/UserLeft.jsp"></jsp:include>
			<div class="regInfos border_l1" style="width: 750px;">
				<jsp:include page="../msg.jsp"></jsp:include>
				<div id="banner1" class="banner">
            	</div>
   				<div class="fl hide pad_5 bsr_gray section mar_t6 fl " style="width: 700px;">
          			<div class="ptitle02">
            			<div class="icon">�û�������Ϣ</div>
          			</div>
          			<div class="pad_10" style="padding-top: 7px;">
			            <ul class="dotli03 projects_list ft16">
			              <li>���ã�<strong>${sessionScope.userObj.userName}</strong>����ӭ���٣�</li>
			              <li>��Ա����:&nbsp;<strong></strong></li>
			              <li>E-mail:&nbsp;<strong></strong></li>
			               <li>�˻����:&nbsp;<strong></strong>Ԫ</li>
			            </ul>
            			<div class="clear"></div>
          			</div>
           			<br/>
        		</div>
	    	</div>
	  		<div class="clear"></div>
		</div>
	</div>
	<!-- end���Ŀ�� -->
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>

