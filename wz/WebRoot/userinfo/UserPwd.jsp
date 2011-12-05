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
    	var leftMenuItemLoc = "${appPath}/userinfo/UserPwd.jsp";
    	function submitForm(){
			var f = document.forms[0];
			var oldPwd = f.oldPwd.value;
			var newPwd = f.newPwd.value;
			var newPwd2 = f.newPwd2.value;
			if(oldPwd == ''){
				alert("请输入原有密码");
				return false;
			}
			if(newPwd == ''){
				alert("请输入新密码");
				return false;
			}
			if(newPwd2 == ''){
				alert("请输入新确认密码");
				return false;
			}
			if(newPwd2 != newPwd){
				alert("两次新密码输入不一致");
				return false;
			}
			f.submit();
		}
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
				<div id="banner1" class="banner"></div>
				<jsp:include page="../msg.jsp"></jsp:include>
   				<div class="fl hide pad_5 bsr_gray section mar_t6 fl " style="width: 700px;">
          			<div class="ptitle02">
            			<div class="icon">修改密码</div>
          			</div>
          			<div class="pad_10" style="padding-top: 7px;">
			            <form action="${appPath}/userinfo/changePwd" method="post">
							<div class="regInfos border_l1 w670">
        						<div class="regblock"></div>
						        <div class="regblock">
						          <div class="reginfo">
						            <label class="label"><span class="msg">* </span>旧密码:</label>
						           <input class="textbox" type="password" name="oldPwd" />
						          </div>
						        </div>
						        <div class="regblock">
						          <div class="reginfo">
						            <label class="label"><span class="msg">* </span>新密码：</label>
						            <input class="textbox" type="password" name="newPwd" />
						          </div>
						        </div>
						        <div class="regblock">
						          <div class="reginfo">
						            <label class="label"><span class="msg">* </span>确认新密码：</label>
						            <input class="textbox" type="password" name="newPwd2" />
						          </div>
						        </div>
						        <div class="regSubmit">
						          <input type="button" name="button1" class="btnReg" value="修改"  onclick="submitForm();"/>       
						        </div>
						     </div>
						</form>
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

