//login.html js
$(function(){
	//add class for text
	$(".text").focus(function(){
		$(this).addClass("act");
	}).blur(function(){
		$(this).removeClass("act");
	});
	//blurs
	$("#username").blur(function(){
		ckName($(this));
	});
	$("#password").blur(function(){
		var password = $(this).val().replace(/\s*/, "");
		if (password == "") {//不能为空
			$("#checkpassword").html('<span class="form-tip tip-error">密码不能为空<br></span>');
			$(this).addClass("err");	
			return;
		} else if(!/^.{6,16}$/.test(password)) {//6-16字符
			$("#checkpassword").html('<span class="form-tip tip-error">密码长度不在6-16位字符之间<br></span>');
			$(this).addClass("err");	
			return;
		} else if(/^(.)\1*$/.test(password) || password=='123456' || password=='12345678') {//过于简单
			$("#checkpassword").html('<span class="form-tip tip-error">密码不能过于简单<br></span>');
			$(this).addClass("err");	
			return;
		} else if($(this).val().toLowerCase().indexOf($("#username").val().toLowerCase())>0) {
			$("#checkpassword").html('<span class="form-tip tip-error">密码不能和用户名太相近<br></span>');
			$(this).addClass('err');	
			return;
		}else{
			$("#checkpassword").html('<span class="form-tip tip-success">输入正确<br></span>');
			$(this).removeClass("err");
		};
	});
	$("#rand").blur(function(){
		var e_nameStr = /\d{4}/.test($(this).val());		
		if (!e_nameStr) {
			$("#err_rand").html('<span class="form-tip tip-error">验证码格式错误<br></span>');
			$(this).addClass("err");	
			return;
		};
	});
	$("#regForm").submit(function(){
		var t = art.dialog({title:"新用户注册",lock:true});
		if($("#username").blur()){
			if($("#password").blur()){
				var uin   = $("#username").val();
				var pwd   = $("#password").val();
				var pwd2  = $("#confirmpassword").val();
				var email = $("#email").val();
				var rand   = $("#rand").val();
				$.getJSON("/ajax_addUser.do?username="+escape(uin)+"&password="+escape(pwd)+"&password2="+escape(pwd2)+"&email="+escape(email)+"&pid="+Math.random()+"&rand="+rand,function(data) {
					t.content(data.msg).lock().time(2);
					if(data.msg == "Y"){
						window.location.href = "regok.html";
					};
				})
			};
		};
		return false;
	});
});
function ckName(o){
	//验证账号	
	var keyName = new Array('vikecn','admin','administrator','root','user','test','系统消息','客服','官方','系统','客户','秘书','中奖','工作人员','管理','时间财富','财务','威客中国');	
	var len = o.val().length;	
	if(len==0){
		$("#err_username").html('<span class="form-tip tip-error">请填写用户名<br></span>');
		o.addClass("err");
		return;
	};
	if (len < 2 ) {
		$("#err_username").html('<span class="form-tip tip-error">用户名至少需要2个字符<br></span>');
		o.addClass("err");	
		return;
	};
	if (len > 16) {
		$("#err_username").html('<span class="form-tip tip-error">用户名不能超过16个字符<br></span>');
		o.addClass("err");	
		return;
	};
	if (!/^[\u4e00-\u9fa5\w]*$/.test(o.val())) {//特殊字符
		$("#err_username").html('<span class="form-tip tip-error">用户名中不能包含#$% $#^%等特殊字符<br></span>');
		o.addClass("err");		
		return;
	};
	
	var url = location.href;
	url = url.substring(url.lastIndexOf("=")+1,url.length);
	if(url=="vikecn"){
		$("#dos").val(url);	
	}else{
		for (var j=0;j<keyName.length;j++ )	{
			if(o.val().indexOf(keyName[j])!=-1) {
				$("#err_username").html('<span class="form-tip tip-error">用户名中包含被过滤字符,无法注册<br></span>');
				o.addClass("err");			
				return;
			}
		}
	};
	$("#err_username").html('<span class="form-tip tip-alert">查询中...<br></span>');
	$.getJSON("/ajax_checkUserName.do?username="+escape(o.val()), function(json){
		if(json.msg=="Y"){
			$("#err_username").html('<span class="form-tip tip-success">可以注册<br></span>');
			o.removeClass("err");
		}else{
			$("#err_username").html('<span class="form-tip tip-error">'+json.msg+'<br></span>');
			o.addClass("err");	
			return;
		};
	});	
};

//right
var qt_tx;
$(function(){
	$("#logqq").click(function(){
		alert('暂时不可用');
	});
	$("#logsina").click(function(){
		alert('暂时不可用');
	});
	$(".loginlink-desp").scroll({ line:1, speed:500, timer:3000 });
});