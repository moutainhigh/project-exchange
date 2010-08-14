$(function(){
	$('input').css('border','1px solid #3A6EA5');
	$('input').focus(function(){
		$(this).css('border','1px solid #9D2703');
	});
	$('input').blur(function(){
		$(this).css('border','1px solid #3A6EA5');
	});
	$('textarea').css('border','1px solid #3A6EA5');
	$('textarea').focus(function(){
		$(this).css('border','1px solid #9D2703');
	});
	$('textarea').blur(function(){
		$(this).css('border','1px solid #3A6EA5');
	});
	
	
});

function formKeyPress(event){
	if(event.keyCode == 13){
		submitForm();
	}else{
		return false;
	}
}
function submitForm(){
	var username = document.forms['loginForm'].username.value;
	var pwd = document.forms['loginForm'].password.value;
	var rand = document.forms['loginForm'].rand.value;
	if(username=='' || pwd=='' || rand==''){
		alert('用户名、密码、验证码均为必填选项，请检查');
		return false;
	}
	document.forms[0].submit();
}

function gotoPage(pageIndex,url){
	if(!url){
		url = self.location.href;
	}
	if(url.indexOf("?") > 0){
		if(url.indexOf("page=") > 0){
			url = url.replace(/page=\d*/g,'');
			//alert(url);
			url = url.replace(/&{2,}/g,'&');
		}
		url += '&';
	}else{
		url += '?';
	}
	url += "page=" + pageIndex;
	self.location.href = url;
}

function checkAll(){
	
}

