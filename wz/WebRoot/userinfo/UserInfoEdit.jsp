<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>${appTitle}</title>
    <link href="${appPath}/Themes/basic.css" type="text/css" rel="stylesheet" />
    <link href="${appPath}/Register/Themes/layout.css" type="text/css" rel="stylesheet" />
    
    	 <script language="javascript">

         var email_Flag=false;
	     var nickName_Flag=false;
	function verifyIsNull(info_div,str){

	var flag= false;
	if(str == ""){
	info_div.style.color="red";
	info_div.innerHTML="对不起，内容不能为空。"
	
	flag=true;
	
	}
	return flag;
	
	}
	
	function verifyEmail(){
	var strEmail = document.getElementById("email").value;
	var email_info = document.getElementById("emli");
	if(verifyIsNull(email_info,strEmail)){
	 email_Flag= false;
	return email_Flag;
	}
	
	var reg = new RegExp('^[a-zA-Z0-9]+@[a-zA-Z0-9]+.[a-z][a-z.]{2,8}$');
	email_Flag=reg.test(strEmail);
	if(email_Flag){
	email_info.style.color = "green";
	email_info.innerHTML="邮箱可用";
	return email_Flag;
	
	}else{
	email_info.style.color = "red";
	email_info.innerHTML="邮箱格式不正确";
	return email_Flag;
	
	}
	
	
	
	}
	
	
function verifyNickName(){
   var strNickName=document.getElementById("nickName").value; 
   var nickName_info=document.getElementById("nickli");
   if(verifyIsNull(nickName_info,strNickName)){
     nickName_Flag=false;
	 return nickName_Flag;

   }else{
   nickName_info.style.color="green";
   nickName_info.innerHTML="昵称可用";
    return true;
   }

}


function submitForm(){
				var f = document.forms[0];
				var nickName = f.nickName.value;
				var email = f.email.value;
				var checkCode = f.rand.value;
				if(nickName == ''||email==''||checkCode==''||!verifyNickName()||!verifyEmail()){
					alert("请填入完整正确的信息");
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
    
<form action="UserAction_changeUserInfo.action" method="post">
 <div class="reginfo">
            <label class="label"><span class="msg">* </span><strong>修改资料</strong></label>
            
          </div>
<div class="regInfos border_l1 w670">
 <div class="regblock">

        </div>
              <div class="regblock">
          <div class="reginfo">
            <label class="label"><span class="msg">* </span>登录名:</label>
             <input class="textbox" type="text" name="loginName" disabled= "true" value="${sessionScope.userObj.loginName}"/>
         
          </div>
          
        </div>
        <div class="regblock">
          <div class="reginfo">
            <label class="label"><span class="msg">* </span>昵    称:</label>
            <input class="textbox" type="text" name="nickName" id="nickName" onblur="verifyNickName();" />
            
          </div>
          <div class="form-tip loading">
            <p id="nickli"></p>
          </div>
        </div>
        <div class="regblock">
          <div class="reginfo">
            <label class="label"><span class="msg">* </span>E-mail:</label>
            <input class="textbox" type="text" name="email" id="email" onblur="verifyEmail();"/>
          </div>
          <div class="form-tip loading">
            <p id="emli"></p>
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
