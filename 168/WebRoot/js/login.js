/*登录页面functions*/



//提示信息通用
function alertInfo(index,txt,color){
	if(!color){
		color = 'red';
	}
	$('.reg_bg_two').eq(index).css({'color':color});
	$('.reg_bg_two').eq(index).html(txt);
}

//检查登录名唯一性
function check_loginid(){
	var login_id = $('#login_id').val();
	if(login_id == null || ''==login_id){
		alertInfo(0,'必须填入用户名，4-16个字符（包括4、16）或2-8个汉字');
		return false;
	}
	return true;
}
//检查密码1
function check_pwd(){
	var pwd = $('#password').val();
	if(pwd == null || ''==pwd){
		alertInfo(1,'必须输入密码，密码须为6位或6以上的字母/数字/下划线');
		return false;
	}
	if(pwd.length<6 || pwd.length>30){
		alertInfo(1,'密码须为6位或6以上的字母/数字/下划线，不能超过30位');
		return false;
	}
  	return true;
}
//检查验证码
function check_rand(){
	var rand = $('#rand').val();
	if(rand == null || ''==rand){
		alertInfo(2,'必须填入验证码');
		return false;
	}
	return true;
}

//表单提交
function chkForm(){
	if(check_loginid() && check_pwd() && check_rand()){
		document.forms[0].submit();
	}
	return false;	
}