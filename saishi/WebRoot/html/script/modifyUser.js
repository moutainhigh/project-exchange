function verifyEmail(){
	var strEmail = document.getElementById("email").value;
	
	if(strEmail!=''){
	var reg = new RegExp('^[a-zA-Z0-9]+@[a-zA-Z0-9]+.[a-z][a-z.]{2,8}$');
	var email_Flag=reg.test(strEmail);
	
	if(email_Flag){

	return email_Flag;
	
	}else{

	alert("邮箱格式不正确");
	return email_Flag;
	
	}
	
	}
	
	return true;

	}
	
	
	
function verifyTel(){

 var strTel=document.getElementById("tel").value; 

   if(strTel!=''){
   var reg1 = new RegExp('^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$');
   var reg2 = new RegExp('^[0-9]{11}$');
   var flag1=reg1.test(strTel);
   var flag2=reg2.test(strTel);
	if(flag1||flag2){
	var tel_Flag=true;
	}else{
	 tel_Flag=false;
	}
   if(tel_Flag){
	return tel_Flag;
	
	}else{

	alert("请填入正确的电话号码");
	return tel_Flag;
	
	}

   }
   
    return true;
}

	function verifyAge(){
       var age=document.getElementById("age").value; 
     
   if(age!=''){
   var reg = new RegExp('^\\d*$');
	var age_Flag=reg.test(age);
   if(age_Flag){
	
	return age_Flag;
	
	}else{
	
	alert("请填入合法数字");
	return age_Flag;
	
	}

   }
   
   return true;
   
   
    

}



	function verifyPost(){
       var post=document.getElementById("post").value; 
     
   if(post!=''){
   var reg = new RegExp('^\\d{6}$');
	var post_Flag=reg.test(post);
   if(post_Flag){
	
	return post_Flag;
	
	}else{
	
	alert("请填入合法邮编");
	return post_Flag;
	
	}

   }
   
   return true;
   
   
    

}



function modifyUser(){
	var f = document.forms[0];
	    var email=f.email.value;
	    var tel = f.tel.value;
	    var age=f.age.value;
	    var address=f.address.value;
	    var post=f.post.value;
	    /*var emailF=verifyEmail();
	    var telF=verifyTel();
	    var ageF=verifyAge();
	    var postF=verifyPost();*/
	    
	    if(verifyEmail()&&verifyTel()&&verifyAge()&&verifyPost()){
	    	f.submit();
	    }else{
	    	return false;
	    }
	    
	  
		
	
}