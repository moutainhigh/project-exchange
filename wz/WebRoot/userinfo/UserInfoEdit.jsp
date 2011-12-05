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
    	var leftMenuItemLoc = "${appPath}/userinfo/UserInfoEdit.jsp";
        var email_Flag=false;
	    var nickName_Flag=false;
	
		function verifyIsNull(info_div, str) {
			var flag = false;
			if (str == "") {
				info_div.style.color = "red";
				info_div.innerHTML = "对不起，内容不能为空。"
				flag = true;
			}
			return flag;
		}
	
		function verifyEmail() {
			var strEmail = document.getElementById("email").value;
			var email_info = document.getElementById("emli");
			if (verifyIsNull(email_info, strEmail)) {
				email_Flag = false;
				return email_Flag;
			}
			var reg = new RegExp('^[a-zA-Z0-9]+@[a-zA-Z0-9]+.[a-z][a-z.]{2,8}$');
			email_Flag = reg.test(strEmail);
			if (email_Flag) {
				email_info.style.color = "green";
				email_info.innerHTML = "邮箱可用";
				return email_Flag;
			} else {
				email_info.style.color = "red";
				email_info.innerHTML = "邮箱格式不正确";
				return email_Flag;
			}
		}
	
		function verifyNickName() {
			var strNickName = document.getElementById("nickName").value;
			var nickName_info = document.getElementById("nickli");
			if (verifyIsNull(nickName_info, strNickName)) {
				nickName_Flag = false;
				return nickName_Flag;
			} else {
				nickName_info.style.color = "green";
				nickName_info.innerHTML = "昵称可用";
				return true;
			}
		}
		
		function verifyQQ() {
			var strQQ = document.getElementById("qq").value;
			if(strQQ=='' || strQQ.trim()=='')
				return;
			var qq_info = document.getElementById("qqli");
			var reg = new RegExp('^[0-9]{2,12}$');
			var qq_Flag = reg.test(strQQ);
			if (qq_Flag) {
				qq_info.style.color = "green";
				qq_info.innerHTML = "QQ可用";
				return qq_Flag;
			} else {
				qq_info.style.color = "red";
				qq_info.innerHTML = "QQ格式不正确";
				return qq_Flag;
			}
		}
		
		function verifyTel() {
			var strTel = document.getElementById("tel").value;
			if(strTel=='' || strTel.trim()=='')
				return;
			var tel_info = document.getElementById("teli");
			var reg = new RegExp('^[0-9]{7,15}$');
			var qq_Flag = reg.test(strTel);
			if (qq_Flag) {
				tel_info.style.color = "green";
				tel_info.innerHTML = "电话可用";
				return qq_Flag;
			} else {
				tel_info.style.color = "red";
				tel_info.innerHTML = "电话格式不正确";
				return qq_Flag;
			}
		}
	
		function submitForm() {
			var f = document.forms[0];
			var nickName = f.nickName.value;
			var email = f.email.value;
			if (nickName == '' || email == '' || !verifyNickName() || !verifyEmail()) {
				alert("请填入完整正确的信息");
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
            			<div class="icon">修改账号资料</div>
          			</div>
          			<div class="pad_10" style="padding-top: 7px;">
						<form action="${appPath}/userinfo/changeUserInfo" method="post">
							<div class="regInfos border_l1 w670">
								<div class="regblock"></div>
								<div class="regblock">
									<div class="reginfo">
										<label class="label">
											<span class="msg">* </span>登录名:
										</label>
										<input class="textbox" type="text" name="loginName"
											disabled="true" value="${sessionScope.userObj.userId}" />

									</div>

								</div>
								<div class="regblock">
									<div class="reginfo">
										<label class="label">
											<span class="msg">* </span>昵 称:
										</label>
										<input class="textbox" type="text" name="nickName"
											id="nickName" onblur="verifyNickName();" value="${userObj.userName }"/>

									</div>
									<div class="form-tip loading">
										<p id="nickli"></p>
									</div>
								</div>
								<div class="regblock">
									<div class="reginfo">
										<label class="label">
											<span class="msg">* </span>E-mail:
										</label>
										<input class="textbox" type="text" name="email" id="email"
											onblur="verifyEmail();" value="${userObj.userEmail }"/>
									</div>
									<div class="form-tip loading">
										<p id="emli"></p>
									</div>
								</div>
								
								<div class="regblock">
									<div class="reginfo">
										<label class="label">
											<span class="msg">&nbsp;</span>QQ:
										</label>
										<input class="textbox" type="text" name="qq" id="qq" value="${userObj.userQq }" onblur="verifyQQ();"/>
									</div>
									<div class="form-tip loading">
										<p id="qqli"></p>
									</div>
								</div>
								
								<div class="regblock">
									<div class="reginfo">
										<label class="label">
											<span class="msg">&nbsp;</span>联系电话:
										</label>
										<input class="textbox" type="text" name="tel" id="tel" value="${userObj.userPhone }" onblur="verifyTel();"/>
									</div>
									<div class="form-tip loading">
										<p id="teli"></p>
									</div>
								</div>

								<div class="regSubmit">
									<input type="button" name="button1" class="btnReg" value="保存" onclick="submitForm();" />
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
