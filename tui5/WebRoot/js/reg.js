//reg.html js
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
	$("#confirmpassword").blur(function(){
		var password = $(this).val().replace(/\s*/, "");
		var pwd = $("#password").val().replace(/\s*/, "");
		if (password == "") {//不能为空
			$("#checkpassword2").html('<span class="form-tip tip-error">确认密码不能为空<br></span>');
			$(this).addClass("err");	
			return;
		} else if(password != pwd) {
			$("#checkpassword2").html('<span class="form-tip tip-error">两次输入的密码不一致<br></span>');
			$(this).addClass("err");	
			return;
		}else{
			$("#checkpassword2").html('<span class="form-tip tip-success">输入正确！<br></span>');
			$(this).removeClass("err");
		};
	});
	$("#email").blur(function(){
		var e_nameStr = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/.test($(this).val());		
		if (!e_nameStr) {
			$("#err_email").html('<span class="form-tip tip-error">电子邮件地址格式错误<br></span>');
			$(this).addClass("err");	
			return;
		};
		$("#err_email").html('<span class="form-tip tip-alert">查询中...<br></span>');
		$.getJSON("/ajax_checkEmail.do?email="+$(this).val(), function(json){				
			if(json.msg=="Y"){
				$("#err_email").html('<span class="form-tip tip-success">可以注册<br></span>');
				$(this).removeClass("err");
			}else{
				$("#err_email").html('<span class="form-tip tip-error">'+json.msg+'<br></span>');
				$(this).addClass("err");	
				return;
			};
		});	
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
				if($("#confirmpassword").blur()){
					if($("#email").blur()){
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
		qt_tx=$.dialog({title:'使用QQ登陆tui5.com',width:600,height:470,max:false,min:false,padding:0,content:'url:http://www.680.com/loginToqq.aspx?tourl=user'});
	});
	$("#logsina").click(function(){
		qt_tx=$.dialog({title:'使用微博帐号登陆tui5.com',width:600,height:470,max:false,min:false,padding:0,content:'url:http://www.680.com/loginTosina.aspx?tourl=user'});
	});
	$(".loginlink-desp").Scroll({ line:1, speed:500, timer:3000 });
});
(function($){
	$.fn.extend({
        Scroll:function(opt,callback){
                //参数初始化
                if(!opt) var opt={};
                var _this=this.eq(0).find("ul:first");
                var        lineH=_this.find("li:first").height(), //获取行高
                        line=opt.line?parseInt(opt.line,10):parseInt(this.height()/lineH,10), //每次滚动的行数，默认为一屏，即父容器高度
                        speed=opt.speed?parseInt(opt.speed,10):500, //卷动速度，数值越大，速度越慢（毫秒）
                        timer=opt.timer?parseInt(opt.timer,10):3000; //滚动的时间间隔（毫秒）
                if(line==0) line=1;
                var upHeight=0-line*lineH;
                //滚动函数
                scrollUp=function(){
                        _this.animate({
                                marginTop:upHeight
                        },speed,function(){
                                for(i=1;i<=line;i++){
                                        _this.find("li:first").appendTo(_this);
                                }
                                _this.css({marginTop:0});
                        });
                }
                //鼠标事件绑定
                _this.hover(function(){
                        clearInterval(timerID);
                },function(){
                        timerID=setInterval("scrollUp()",timer);
                }).mouseout();
        }        
	})
})(jQuery);