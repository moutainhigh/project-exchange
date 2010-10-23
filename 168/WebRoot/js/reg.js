/*注册页面functions*/

//提示信息通用
function alertInfo(index,txt,color){
	if(!color){
		color = 'red';
	}
	$('.reg_bg_two').eq(index).css({'color':color});
	$('.reg_bg_two').eq(index).html(txt);
}

//表单提交
function chkForm(){
	
	document.forms[0].sbumit();
}
//检查登录名唯一性
function check_loginid(){
	var login_id = $('#login_id').val();
	if(login_id == null || ''==login_id){
		alertInfo(0,'必须填入用户名，4-16个字符（包括4、16）或2-8个汉字');
		return false;
	}
	if(login_id.length<2 || login_id.length>16){
		alertInfo(0,'用户名长度错误，4-16个字符（包括4、16）或2-8个汉字');
		return false;
	}
	$.getJSON("ajax_checkLoginName.action",{loginName:login_id}, function(rst){
  		if('succ'==rst){
  			alertInfo(0,'格式正确','green');	
  		}else{
  			alertInfo(0,'用户名已经被使用，请更换一个');
  		}
	}); 		
}

//检查邮箱唯一性
function check_email(){
	var email = $('#email').val();
	if(email == null || ''==email){
		alertInfo(0,'必须填入用户名，4-16个字符（包括4、16）或2-8个汉字');
		return false;
	}
	if(email.length<2 || email.length>16){
		alertInfo(0,'用户名长度错误，4-16个字符（包括4、16）或2-8个汉字');
		return false;
	}
	$.getJSON("ajax_checkLoginName.action",{email:email}, function(rst){
  		if('succ'==rst){
  			alertInfo(0,'格式正确','green');	
  		}else{
  			alertInfo(0,'用户名已经被使用，请更换一个');
  		}
	}); 		
}