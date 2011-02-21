function modifyMailSetting(){
	var f = document.forms[0];
	var username = f.username.value;
	var password = f.password.value;
	var smtp = f.smtp.value;
	if(username == ''||password==''||smtp==''){
		alert("请填入邮箱的登录名、密码和SMTP地址");
		return false;
	}else{
		f.submit();
	}
}