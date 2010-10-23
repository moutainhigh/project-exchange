/*注册页面functions*/


//初始化省市数据下拉
$(function(){
	$.getJSON("ajax_getTopArea.action",null, function(json){
  		if(json){
  			$('#topArea').html('<option value=""></option>');
  			for(var i=0;i<json.list.length;i++){
  				var str = '<option value="'+json.list[i]['id']+'">'+json.list[i]['name']+'</option>';
  				$('#topArea').append(str);
  			}
  			$('#topArea').change(function(){
  				if($('#topArea').val()){
	  				$.getJSON("ajax_getCities.action",{parentId:$('#topArea').val()}, function(json){
	  					if(json){
	  						$('#city').html('<option value=""></option>');
		  					for(var i=0;i<json.list.length;i++){
					  			var str = '<option value="'+json.list[i]['id']+'">'+json.list[i]['name']+'</option>';
					  			$('#city').append(str);
					  		}
				  		}
	  				});
  				}
  			});
  		}
	}); 	
});

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
  	alertInfo(1,'格式正确','green');	
  	return true;
}
//检查密码2
function check_repwd(){
	var pwd = $('#repassword').val();
	if(pwd == null || ''==pwd){
		alertInfo(2,'必须输入密码，密码须为6位或6以上的字母/数字/下划线');
		return false;
	}
	if(pwd.length<6 || pwd.length>30){
		alertInfo(2,'密码须为6位或6以上的字母/数字/下划线，不能超过30位');
		return false;
	}
	if(pwd!=$('#password').val()){
		alertInfo(2,'两次密码不一致，请检查');
		return false;
	}
  	alertInfo(2,'格式正确','green');	
  	return true;
}

//检查邮箱唯一性
function check_email(){
	var email = $('#email').val();
	if(email == null || ''==email){
		alertInfo(3,'必须填入用户名，4-16个字符（包括4、16）或2-8个汉字');
		return false;
	}
	var regm = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;//验证Mail的正则表达式,^[a-zA-Z0-9_-]:开头必须为字母,下划线,数字,
	if (!email.match(regm)){
		alertInfo(3,'请正确的输入邮箱地址');
		return false;
	}
	$.getJSON("ajax_checkEmail.action",{email:email}, function(rst){
  		if('succ'==rst){
  			alertInfo(3,'格式正确','green');	
  		}else{
  			alertInfo(3,'该邮箱已经被使用，请更换一个');
  		}
	}); 	
	return true;	
}
//检查验证码
function check_rand(){
	var rand = $('#rand').val();
	if(rand == null || ''==rand){
		alertInfo(5,'必须填入验证码');
		return false;
	}
	$.getJSON("ajax_checkRand.action",{rand:rand}, function(rst){
  		if('succ'==rst){
  			alertInfo(5,'格式正确','green');	
  		}else{
  			alertInfo(5,'验证码输入错误，请检查');
  		}
	}); 		
	return true;
}

//表单提交
function chkForm(){
	if(!$('#topArea').val()){
		alertInfo(4,'请至少选择省份或直辖市');	
		return false;
	}
	if(check_loginid() && check_pwd() && check_repwd && check_email() && check_rand()){
		document.forms[0].submit();
	}
	return false;	
}