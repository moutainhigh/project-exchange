//验证数据库中是否注册过用户ID
<!-->
function CheckUserID(){
var userid=document.regForm.username.value;
var flag=checkUserName(userid);
    if (!flag)
    {
        document.regForm.username.focus();
        return (false);
    }
    else
    window.open("checkUserID.jsp?userid="+userid,"NewWindow","width=200,height=20,status=no,scrollbars=no,resizable=no,menubar=no,toolbar=no,location=no");
}
//-->

<!-->
function checkUserName(userName){

   if (userName==" ")
    {
        alert("\n用户代码不能为空！\n\n（3-12个字,中间不能含有空格）！");
        return (false);
    }
    if (userName.length <3 )
    {
        alert("\n用户代码不能小于3位");
//        form.userid.focus();
        return (false);
    }
    if (strangecode(userName)==false || userName.indexOf(" ") != -1)
    {
        alert("\n用户代码不能含有特殊字符或者空格！");
//        form.userid.focus();
        return (false);
    }
    return(true);
  }
 //-->

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

//验证电话号码
function mobile(phone)
{
    var phoneNum = "1234567890";
    var temp;
    if (phone.length < 11)
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
//验证特殊字符
function strangecode(code)
{   var strangCode = "~`!@#$%^&*-+=|\'/？,，。<>";
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
//电子邮件
 // Writen by stiven0 ,2006-03-08
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
 // Writen by stiven0 ,2006-03-09
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
function f_check_ZhOrNumOrLett(obj){    //判断用户名是否是汉字、字母、数字或下划线组成
    var regu = "^[0-9a-zA-Z\u4e00-\u9fa5\_]+$";
    var re = new RegExp(regu);
    if (re.test( obj.value )) {
      return true;
    }
    alert("请输入汉字、字母、数字或下划线");
    return false;
}
function f_check_ZhOrNumOrLett2(obj){    //判断用户名是否是汉字、字母、数字组成
    var regu = "^[0-9a-zA-Z\u4e00-\u9fa5]+$";
    var re = new RegExp(regu);
    if (re.test( obj.value )) {
      return true;
    }
    return false;
}
//验证
function check(form)
{
    //验证用户代码
    if (form.username.value=="")
    {
       alert("\n用户名不能为空！\n\n3-12个字（中文、数字、字母或下划线）");
        form.username.focus();
        return (false);
    }

    if ( form.username.value.length < 3 )
    {
        alert("\n用户名不能小于3位！");
        form.username.focus();
        return (false);

    }

   if (f_check_ZhOrNumOrLett(form.username)==false)
    {
        alert("\n用户名不能含有特殊字符或者空格！");
        form.username.focus();
        return (false);
    }

    //验证口令
    if (form.password1.value=="")
    {
        alert("\n密码设置不能为空！\n\n（4-12个英文字母或数字，中间不能含有空格）！");
        form.password1.focus();
        return (false);
    }

    if ( form.password1.value.length < 4 )
    {
        alert("\n用户密码不能小于4位！");
        form.password1.focus();
        return (false);

    }

    if(!/^\w{4,12}$/.test(form.password1.value))
    {
        alert("\n密码不能含有特殊字符或者空格！");
        form.password1.focus();
        return (false);
    }

    if (form.password1.value == form.username.value)
    {
        alert("\n为了您的信息安全，用户代码和密码不能相同！\n\n请您重新填写密码！");
        form.password1.value="";
        form.password2.value="";
        form.password1.focus();
        return (false);
    }

    //验证确认口令
    if (form.password2.value=="")
    {
        alert("\n密码确认不能为空！\n\n（4-12个英文字母或数字，中间不能含有空格）！");
        form.password2.focus();
        return (false);
    }

    //验证确认口令
    if (form.password1.value != form.password2.value)
    {
        alert("\n两次输入的密码不一样！\n\n请重新填写！");
        form.password1.value="";
        form.password2.value="";
        form.password1.focus();
        return (false);
    }
    //验证真实姓名
   /* if (form.cp_name.value == "")
    {
        alert("个人姓名/单位名称不能为空！");
        form.cp_name.focus();
        return (false);
    }

    if (form.cp_name.value.length < 2)
    {
        alert("个人姓名/单位名称字数太少，请准确填写！");
        form.cp_name.focus();
        return (false);
    }

    if (strangecode(form.cp_name.value)==false)
    {
        alert("个人姓名/单位名称不能含有特殊字符！");
        form.cp_name.focus();
        return (false);
    }
*/
    //验证联系人
    if (form.con_name.value == "")
    {
        alert("联系人不能为空！");
        form.con_name.focus();
        return (false);
    }

    if (f_check_ZhOrNumOrLett2(form.con_name)==false)
    {
        alert("联系人不能含有特殊字符！");
        form.con_name.focus();
        return (false);
    }

    //验证联系电话
  if(form.phone.value !=""){
    if (phone(form.phone.value) == false)
    {
        alert("电话号码输入不正确，必须为数字、括号()、减号 -，长度不能小于7位！");
        form.phone.focus();
        return (false);
    }
   }

   if(form.mobile.value !=""){
     if (f_check_mobile(form.mobile) == false)
    {
       alert("请输入有效手机号码！");
        form.mobile.focus();
        return (false);
    }
   }
        //验证电话号码/手机不能同时为空
    if (form.phone.value == "" && form.mobile.value == "")
    {
         alert("联系电话、手机号码不能同时为空！");
         form.phone.focus();
         return false;
    }
   //验证联系地址
   /* if (form.address.value=="")
    {
        alert("详细地址不能为空！");
        form.address.focus();
        return (false);
    }
    if (form.address.value.length < 6)
    {
        alert("详细地址字数太少，不能少于6个字符,请准确填写！");
        form.address.focus();
        return (false);
    }

    if (strangecode(form.address.value) == false)
    {
        alert("详细地址不能含有特殊字符！");
        form.address.focus();
        return (false);
    }

	 //验证单位所在地点
    if (form.n_address1.value == "")
    {
        alert("所在省市不能为空！");
        form.n_address1.focus();
        return (false);
    }

    if (form.n_address2.value == "")
    {
        alert("所在地区不能为空！");
        form.n_address2.focus();
        return (false);
    }
*/
    //验证电子信箱
    if (form.email.value=="")
    {
        alert("email地址不能为空！");
        form.email.focus();
        return (false);
    }
   if (!isemail(form.email.value) )
   {
      return false
    }

    //验证电话号码/传呼/电子邮件不能同时为空
    if (form.phone.value == "" && form.mobile.value == "")
    {
         alert("联系电话||手机号码不能同时为空！");
         form.phone.focus();
         return false;
    }

    //验证验证码
    if (form.yzcode.value=="")
    {
        alert("验证码不能为空！");
        form.yzcode.focus();
        return (false);
    }
    form.Submit.value="提交中...";
    form.Submit.disabled = true;
    return true;
}

