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
		if (password == "") {//����Ϊ��
			$("#checkpassword").html('<span class="form-tip tip-error">���벻��Ϊ��<br></span>');
			$(this).addClass("err");	
			return;
		} else if(!/^.{6,16}$/.test(password)) {//6-16�ַ�
			$("#checkpassword").html('<span class="form-tip tip-error">���볤�Ȳ���6-16λ�ַ�֮��<br></span>');
			$(this).addClass("err");	
			return;
		} else if(/^(.)\1*$/.test(password) || password=='123456' || password=='12345678') {//���ڼ�
			$("#checkpassword").html('<span class="form-tip tip-error">���벻�ܹ��ڼ�<br></span>');
			$(this).addClass("err");	
			return;
		} else if($(this).val().toLowerCase().indexOf($("#username").val().toLowerCase())>0) {
			$("#checkpassword").html('<span class="form-tip tip-error">���벻�ܺ��û���̫���<br></span>');
			$(this).addClass('err');	
			return;
		}else{
			$("#checkpassword").html('<span class="form-tip tip-success">������ȷ<br></span>');
			$(this).removeClass("err");
		};
	});
	$("#rand").blur(function(){
		var e_nameStr = /\d{4}/.test($(this).val());		
		if (!e_nameStr) {
			$("#err_rand").html('<span class="form-tip tip-error">��֤���ʽ����<br></span>');
			$(this).addClass("err");	
			return;
		};
	});
	$("#regForm").submit(function(){
		var t = art.dialog({title:"���û�ע��",lock:true});
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
	//��֤�˺�	
	var keyName = new Array('vikecn','admin','administrator','root','user','test','ϵͳ��Ϣ','�ͷ�','�ٷ�','ϵͳ','�ͻ�','����','�н�','������Ա','����','ʱ��Ƹ�','����','�����й�');	
	var len = o.val().length;	
	if(len==0){
		$("#err_username").html('<span class="form-tip tip-error">����д�û���<br></span>');
		o.addClass("err");
		return;
	};
	if (len < 2 ) {
		$("#err_username").html('<span class="form-tip tip-error">�û���������Ҫ2���ַ�<br></span>');
		o.addClass("err");	
		return;
	};
	if (len > 16) {
		$("#err_username").html('<span class="form-tip tip-error">�û������ܳ���16���ַ�<br></span>');
		o.addClass("err");	
		return;
	};
	if (!/^[\u4e00-\u9fa5\w]*$/.test(o.val())) {//�����ַ�
		$("#err_username").html('<span class="form-tip tip-error">�û����в��ܰ���#$% $#^%�������ַ�<br></span>');
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
				$("#err_username").html('<span class="form-tip tip-error">�û����а����������ַ�,�޷�ע��<br></span>');
				o.addClass("err");			
				return;
			}
		}
	};
	$("#err_username").html('<span class="form-tip tip-alert">��ѯ��...<br></span>');
	$.getJSON("/ajax_checkUserName.do?username="+escape(o.val()), function(json){
		if(json.msg=="Y"){
			$("#err_username").html('<span class="form-tip tip-success">����ע��<br></span>');
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
		alert('��ʱ������');
	});
	$("#logsina").click(function(){
		alert('��ʱ������');
	});
	$(".loginlink-desp").scroll({ line:1, speed:500, timer:3000 });
});