<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>${appTitle}</title>
    <link href="${appPath}/Themes/basic.css" type="text/css" rel="stylesheet" />
    <link href="${appPath}/Register/Themes/layout.css" type="text/css" rel="stylesheet" />
    		<script>
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
<%
  if(session.getAttribute("userObj")==null){
	  response.sendRedirect("../login.jsp");
  }
  %>
	<jsp:include page="../common/head.jsp"></jsp:include>
    
    <!---- begin正文框架 ---->
<div class="wrapper mauto">
  <div class="section" style="border-width: 3px;">
    <div class="ptitle">
      <div class="icon">用户中心<span align="center" style="color:red;">${reqMsg}</span></div>
    </div>
    <div class="regist pad_30">
<jsp:include page="../common/UserLeft.jsp"></jsp:include>
<form action="UserAction_changePwd.action" method="post">
 <div class="reginfo">
            <label class="label"><span class="msg">* </span><strong>修改密码</strong></label>
            
          </div>
<div class="regInfos border_l1 w670">
        <div class="regblock">

        </div>
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

        <div class="regblock">
          <div class="reginfo">
            <label class="label"><span class="msg">* </span>验证码:</label>
            <input id="verification_code" onfocus="$('#yanzheng').show();" style="width:60px;height: 20px;" type="text" name="rand" onkeypress="formKeyPress(event);"/>
            <img src="${appPath}/rand" alt="验证码" id="yanzheng" height="20" style="display:inline;"/>
          </div>
        </div>           
        <div class="regSubmit">
          <input type="button" name="button1" class="btnReg" value="修改"  onclick="submitForm();"/>       
      </div>
</form>
      <div class="clear"></div>
      <br />
    </div>
  </div>
  <div class="clear"></div>
</div>

<!-- end正文框架 -->
   
<jsp:include page="../common/foot.jsp"></jsp:include>

</body>
</html>
