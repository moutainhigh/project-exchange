//验证数据库中是否注册过用户ID
<!-->
function CheckUserID(){
  var userid=document.regForm.username.value;
    if (!checkUserName(document.regForm.username))
    {
        document.regForm.username.focus();
        return (false);
    }
    else
    {
        document.getElementById("undiv1").innerHTML ="";
        document.getElementById("undiv2").innerHTML ="正在检测请稍等...";
        send_request('checkUserName.jsp?userid='+userid);

      }
    //window.open("checkUserID.jsp?userid="+userid,"NewWindow","width=200,height=20,status=no,scrollbars=no,resizable=no,menubar=no,toolbar=no,location=no");
}
//-->
  function textCounter(maxChars)
{     var vlen=Math.floor(getLength5(document.all.contact.value));
	document.all.InputCount.innerHTML = maxChars -vlen ;
}
  function textCounter2(maxChars)
{     var vlen=Math.floor(getLength5(document.all.unitIntro.value));
	document.all.InputCount3.innerHTML = maxChars -vlen ;
}
  function  getLength5(stringIn)
{
var   strLength=0;
strLength=stringIn.length;
return   strLength;
}
<!-->
function checkUserName(userName){
   Trim_char(userName);
   if (userName.value=="")
    {
        alert("\n用户代码不能为空，\n\n3-12个字（中文、数字、字母或下划线）");
        return (false);
    }
    if (userName.value.length <3 )
    {
        alert("\n用户代码不能小于3位");
        return (false);
    }
    if (f_check_ZhOrNumOrLett(userName)==false)
    {
        return (false);
    }
    return(true);
  }
 //-->
function f_check_ZhOrNumOrLett(obj){    //判断用户名是否是汉字、字母、数字或下划线组成
    var regu = "^[0-9a-zA-Z\u4e00-\u9fa5\_]+$";
    var re = new RegExp(regu);
    if (re.test( obj.value )) {
      return true;
    }
    alert("请输入汉字、字母、数字或下划线");
    return false;
}


//使用onKeydown='onlyNum();'屏蔽掉非数字输入
function onlyNum()
{
  var keys=event.keyCode;
  if (!((keys>=48&&keys<=57)||(keys>=96&&keys<=105)
  ||(keys==8)||(keys==46)||(keys==37)||(keys==39)||(keys==13)||(keys==229)||(keys==189)||(keys==109)
  ))
  event.returnValue=false;
  }

//验证数字
function postalcode(input)
{   var number = "1234567890";
    var temp;
    var j=0;
    for (var i = 0; i < input.length; i++ )
    {
        temp = input.substring(i,i+1);
        if (number.indexOf(temp) == -1)
        {
            return (false);
        }
    }
}

function replaceInput(obj,event){
     	//alert(event.keyCode);
	if(event.keyCode!=37 && event.keyCode!=39&&event.keyCode!=8 && event.keyCode!=46)
        {
	obj.value=obj.value.replace(/[^\u4E00-\u9FA50-9a-zA-Z\_]/g,'');
        obj.value=obj.value.toLowerCase();}
}

function replaceInput2(obj){
     	 obj.value=obj.value.toLowerCase();
}

//验证电话号码
function phone(phone)
{
    var phoneNum = "1234567890()-";
    var temp;
    if (phone.length < 7)
    {
         return (false);
    }
    for (var i = 0; i < phone.length; i++)
    {
        temp = phone.substring(i,i+1);
        if (phoneNum.indexOf(temp) == -1)
        {
            return (false);
        }
    }
}

//验证手机号码
/*
要求：一、移动电话号码为11或12位，如果为12位,那么第一位为0
二、11位移动电话号码的第一位和第二位为"13"
三、12位移动电话号码的第二位和第三位为"13"
用途：检查输入手机号码是否正确
输入：
s：字符串
返回：
如果通过验证返回true,否则返回false
*/
function f_check_mobile(obj){
    var regu =/(^[1][3,5][0-9]{9}$)|(^0[1][3,5][0-9]{9}$)/;
    var re = new RegExp(regu);
    if (re.test( obj.value )) {
     // alert("ok");
      return true;
    }
    //alert(obj+"请输入正确的手机号码");
    return false;
}


//验证特殊字符
function strangecode(code)
{   var strangCode = "~`!@#$%^&*+=|\'/？,，。<>";
    var temp;
    for (var i = 0; i<code.length; i++ )
    {
        temp = code.substring(i,i+1);
        if (strangCode.indexOf(temp) !=-1)
        {
            return (false);
        }
    }
}


//电子邮件
function isemail (s)
{
         if (s.length > 40)
        {
                window.alert("电子邮件长度不能超过40位!");
                return false;
        }
		s = s.toLowerCase()
		 var regu = "^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*))@([a-zA-Z0-9-]+[.])+([a-zA-Z]{2}|net|NET|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT|name|NAME)$";
		 var re = new RegExp(regu);
         if (s.search(re) != -1) {
               return true;
         } else {
               window.alert ("您的电子邮件格式填写不正确！");
               return false;
         }
}

//字符长度
function  getLength(stringIn)
{
        var   strLength=0;
        for(var   i=0;i<stringIn.length;i++)
        {
                if(stringIn.charCodeAt(i)>255)
                {
                        strLength+=2;
                }
                else
                {
                        strLength+=1;
                }

        }
        return   strLength;
}

function String.prototype.Trim() {return this.replace(/(^\s*)|(\s*$)/g,"");}
function String.prototype.Ltrim(){return this.replace(/(^\s*)/g, "");}
function String.prototype.Rtrim(){return this.replace(/(\s*$)/g, "");}

function Trim_char(obj)
{
  var str=obj.value.Trim();
  obj.value=str;
  }

function Trim_char2(obj)
{
  var str=obj.value.Trim();
  obj.value=str;
  document.all.lianxiren.value=str;
  }

//---------密码1验证－开始
function setPW1(obj){
        document.getElementById("pw12").style.display="none";
        document.getElementById("pw1").style.display="inline";
  }

function rdbtnState(obj){
if(obj.value=="0")
{
document.getElementById("dwjj").innerHTML="自我介绍：";
document.getElementById("dwmc").style.display="none";
document.getElementById("digree23").style.display="inline";
document.getElementById("sex2").style.display="inline";
//document.getElementById("dwjj").style.display="none";
document.getElementById("dwdz").style.display="none";
}
else {
document.getElementById("dwmc").style.display="inline";
document.getElementById("dwjj").innerHTML="单位简介：";
document.getElementById("digree23").style.display="none";
document.getElementById("sex2").style.display="none";
//document.getElementById("dwjj").style.display="inline";
document.getElementById("dwdz").style.display="inline";
}
}


function rdbtnState2(obj){
//alert(obj);
if(obj=="1")
{
document.getElementById("dwmc").style.display="inline";
document.getElementById("dwjj").innerHTML="单位简介：";
document.getElementById("digree23").style.display="none";
document.getElementById("sex2").style.display="none";
//document.getElementById("dwjj").style.display="inline";
document.getElementById("dwdz").style.display="inline";
}
else {
document.getElementById("dwjj").innerHTML="自我介绍：";
document.getElementById("dwmc").style.display="none";
document.getElementById("digree23").style.display="inline";
document.getElementById("sex2").style.display="inline";
//document.getElementById("dwjj").style.display="none";
document.getElementById("dwdz").style.display="none";
}
}

function checkPW1(obj){
      //验证口令
      var password=obj.value;
    if (password=="")
    {
        document.getElementById("pw12").style.display="inline";
        document.getElementById("pw1").style.display="none";
        document.getElementById("pw12").innerHTML ="密码设置不能为空！";
        return (false);
    }

    if ( password.length < 4 )
    {
      document.getElementById("pw12").style.display="inline";
        document.getElementById("pw1").style.display="none";
        document.getElementById("pw12").innerHTML ="用户密码不能小于4位！";
        return (false);
    }

    if (password.value == document.all.username.value)
    {
        document.getElementById("pw12").style.display="inline";
        document.getElementById("pw1").style.display="none";
        document.getElementById("pw12").innerHTML ="为了您的信息安全，用户代码和密码不能相同，请您重新填写密码！";
        return (false);
    }

     document.getElementById("pw1").style.display="none";
      document.getElementById("pw12").style.display="inline";
  //  document.getElementById("pw12").innerHTML ="<img src='../images/good2.gif'>&nbsp;<font color='#4DA531'>填写正确</font>";
  }
//---------密码1验证－结束


//---------密码2验证－开始
function setPW2(obj){
        document.getElementById("pw22").style.display="none";
        document.getElementById("pw2").style.display="inline";
  }

function checkPW2(obj){
    //验证确认口令
    if (obj.value=="")
    {
       document.getElementById("pw2").style.display="none";
       document.getElementById("pw22").style.display="inline";
       document.getElementById("pw22").innerHTML ="密码确认不能为空！";
        return (false);
    }

    //验证确认口令
    if (obj.value != document.all.password1.value)
    {
      document.getElementById("pw2").style.display="none";
       document.getElementById("pw22").style.display="inline";
       document.getElementById("pw22").innerHTML ="两次输入的密码不一样，请重新填写！";
        obj.value="";
        document.all.password1.value="";
        setPW1(document.all.password1)
        return (false);
    }
       document.getElementById("pw2").style.display="none";
       document.getElementById("pw22").style.display="inline";
       document.getElementById("pw22").innerHTML ="<img src='../jz8_images/good2.gif'>&nbsp;<font color='#4DA531'>填写正确</font>";
  }

function f_check_ZhOrNumOrLett2(obj){    //判断用户名是否是汉字、字母、数字组成
    var regu = "^[0-9a-zA-Z\u4e00-\u9fa5]+$";
    var re = new RegExp(regu);
    if (re.test( obj.value )) {
      return true;
    }
    return false;
}

  function check_con(obj){
        //验证联系人
         Trim_char(obj);
    if (obj.value == "")
    {
        document.getElementById("con1").style.display="inline";
        document.getElementById("con1").innerHTML ="联系人不能为空！";
        return (false);
    }

    if (f_check_ZhOrNumOrLett2(obj)==false)
    {
        document.getElementById("con1").style.display="inline";
        document.getElementById("con1").innerHTML ="联系人不能含有特殊字符！";
        return (false);
    }
    document.getElementById("con1").style.display="inline";
    document.getElementById("con1").innerHTML ="<img src='../jz8_images/good2.gif'>&nbsp;<font color='#4DA531'>填写正确</font>";
    }


  function set_phone1(){
        document.getElementById("phone12").style.display="none";
        document.getElementById("phone11").style.display="inline";
    }
function check_phone1(obj){
      //验证联系电话
         Trim_char(obj);
           var msg="";
  if(obj.value !=""){
    if (phone(obj.value) == false)
    {
        document.getElementById("phone11").style.display="none";
    	document.getElementById("phone12").style.display="inline";
    	document.getElementById("phone12").innerHTML ="电话号码输入不正确，必须为数字、括号()、减号 -，长度不能小于7位！";
        return (false);
    }
    msg="<img src='../jz8_images/good2.gif'>&nbsp;<font color='#4DA531'>填写正确</font>";
    document.getElementById("phone11").style.display="none";
   }
   else document.getElementById("phone11").style.display="inline";
    document.getElementById("phone12").style.display="inline";
    document.getElementById("phone12").innerHTML =msg
  }

  function set_phone2(){
        document.getElementById("mobile12").style.display="none";
        document.getElementById("mobile11").style.display="inline";
    }

function check_phone2(obj){
      //验证联系电话
        Trim_char(obj);
        var msg="";
   if(obj.value !=""){
    if (f_check_mobile(obj) == false)
    {
        document.getElementById("mobile11").style.display="none";
    	document.getElementById("mobile12").style.display="inline";
    	document.getElementById("mobile12").innerHTML ="请输入有效手机号码！";
        return (false);
    }
    msg="<img src='../jz8_images/good2.gif'>&nbsp;<font color='#4DA531'>填写正确</font>";
    document.getElementById("mobile11").style.display="none";
   }
        //验证电话号码/手机不能同时为空
    if (document.all.phone.value == "" && obj.value == "")
    {
         document.getElementById("mobile11").style.display="none";
    	 document.getElementById("mobile12").style.display="inline";
    	 document.getElementById("mobile12").innerHTML ="电话号码、手机号码不能同时为空！";
         return false;
    }
    else if(obj.value == "") document.getElementById("mobile11").style.display="inline";
    document.getElementById("mobile12").style.display="inline";
    document.getElementById("mobile12").innerHTML =msg
  }

function check_email(obj)
{
  Trim_char(obj);
  if(obj.value.length<1){
  	document.getElementById("email2").style.display="inline";
  	document.getElementById("email2").innerHTML ="电子邮件不能为空！";
  	return false;
    }

		obj.value = obj.value.toLowerCase()
		 var regu = "^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*))@([a-zA-Z0-9-]+[.])+([a-zA-Z]{2}|net|NET|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT|name|NAME)$";
		 var re = new RegExp(regu);
         if (obj.value.search(re) == -1) {
         document.getElementById("email2").style.display="inline";
    	 document.getElementById("email2").innerHTML ="电子邮件格式填写不正确！";
         return false;
         }
         document.getElementById("email2").style.display="inline";
       //  document.getElementById("email2").innerHTML ="<img src='../images/good2.gif'>&nbsp;<font color='#4DA531'>填写正确</font>";

         if(document.regForm.contact.value.length==24){
         document.regForm.contact.value=document.regForm.contact.value+obj.value;}
         return true;
}


function check_yzcode(obj)
{
  Trim_char(obj);
  if(obj.value.length<1){
  	document.getElementById("yzcode2").style.display="inline";
  	document.getElementById("yzcode2").innerHTML ="验证码不能为空！";
  	return false;
    }
//   var patrn=/^[0-9]{1,4}$/;
//    if (!patrn.exec(obj.value)) {
//         document.getElementById("yzcode2").style.display="inline";
//    	 document.getElementById("yzcode2").innerHTML ="验证码错误(请输入前面验证码)。";
//        return false
//    }
    document.getElementById("yzcode2").style.display="none";
      return true
}

//验证
function check_myreg(form)
{
//return true;
    //验证用户代码
 //验证电子信箱
    if (form.email.value=="")
    {
        alert("email地址不能为空！");
        form.email.focus();
        return (false);
    }
   if (!isemail(form.email.value) )
   {
        alert("email地址格式错误！");
        form.email.focus();
      return false
    }

    //验证口令
    if (form.password1.value=="")
    {
        alert("\n密码设置不能为空！\n\n（4-12个字符）！");
        form.password1.focus();
        return (false);
    }

    if ( form.password1.value.length < 4 )
    {
        alert("\n用户密码不能小于4位！");
        form.password1.focus();
        return (false);

    }

    if (form.password1.value == form.username.value)
    {
        alert("\n为了您的信息安全，用户代码和密码不能相同！\n\n请您重新填写密码！");
        form.password1.focus();
        return (false);
    }
     Trim_char(form.lianxiren);
        if (form.lianxiren.value=="")
    {
        alert("联系人不能为空！");
        form.lianxiren.focus();
        return (false);
    }
	 //验证单位所在地点
//    if (form.n_address1.value == "")
//    {
//        alert("所在省市不能为空！");
//        form.n_address1.focus();
//        return (false);
//    }
//
//    if (form.n_address2.value == "")
//    {
//        alert("所在地区不能为空！");
//        form.n_address2.focus();
//        return (false);
//    }
   Trim_char(form.contact);
    if(getLength5(form.contact.value)<5)
    {
    alert("联系方式不能为空,请填写！")
    return false;
    }

    if(getLength5(form.contact.value)>100)
    {
    alert("联系方式字符数不能超过100，请修改后重试！")
    return false;
    }

    if(form.kind.value=="1"){
//       if(form.unitName.value==""){
//       alert("单位名称不能为空！");
//        form.unitName.focus();
//        return (false);
//      }
       Trim_char(form.contact);
//    if(getLength5(form.unitIntro.value)<10){
//       alert("单位简介太过简单，请详细填写，以达到更好的效果！");
//        form.unitIntro.focus();
//        return (false);
//      }
          if(getLength5(form.unitIntro.value)>500)
       {
       alert("单位简介字符数不能超过500，请修改后重试！");
       form.unitIntro.focus();
       return false;
      }

    }

    //验证验证码
    if (form.yzcode.value=="")
    {
        alert("请填写验证码！");
        form.yzcode.focus();
        return (false);
    }
        if (form.yzcode.value.length<4)
    {
        alert("验证码填写有误！");
        form.yzcode.focus();
        return (false);
    }
    form.Submit.value="提交中...";
   form.Submit.disabled = true;
    return true;
}


function check_pro(obj){
  if(obj.value==""){
         document.getElementById("address32").style.display="inline";
    	// document.getElementById("address32").innerHTML ="请选择所在省市！";
         return false;
         }
      else {
         document.getElementById("address32").style.display="inline";
    	// document.getElementById("address32").innerHTML ="请选择所在地区！";
         return false;
        }
        return true;
  }

function check_city(obj){
  if(obj.value==""){
         document.getElementById("address32").style.display="inline";
    	// document.getElementById("address32").innerHTML ="请选择所在地区！";
         return false;
         }
         document.getElementById("address32").style.display="inline";
//         document.getElementById("address32").innerHTML ="<img src='../images/good.gif'>";
         return true;
  }


function clear(o){
l=o.length;
for (i = 0; i< l; i++){
	o.options[0]=null;
}
}

function sdistrict(oj,v){
     var  m=-1;
	for (i=1;i<=36;i++){
            if (province[i]==v){
            m=i;
            }
	}
      clear(oj);
	if (m!=-1){
	    for (i=1;i<citys[m].length;i++){
	    oj.add(new Option(name1[m][i],citys[m][i]));
            }
         oj.disabled=false;
	}
    else oj.disabled=true;
}

function CheckAll()
{
  for(var i=0;i<document.formp.check.length;i++){
    var e=document.formp.check[i];
    if (e.name != 'chkAll')
       e.checked = document.formp.chkAll.checked;
  }
}

function setCity(oj2,cc,v){
        if(cc.length>0)
       oj2.disabled=false;
	var m=-1;
	for (i=1;i<=36;i++){
  		if (province[i]==v){
     			m=i;
     		}
	}
	clear2(oj2);
	if (m!=-1){
		for (i=1;i<citys[m].length;i++){
		    if(cc==citys[m][i])
                   {
                      oj2.add(new Option(name1[m][i],citys[m][i]));
                      oj2.options[i-1].selected=true;
                   }
                   else{
                     oj2.add(new Option(name1[m][i],citys[m][i]));
                     }
		}
	}
}



function setPro(oj2,cc){
  if(cc.length>0&&cc!='null')
oj2.options[cc].selected=true;
}
