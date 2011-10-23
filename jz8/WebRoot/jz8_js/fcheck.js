
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

//验证特殊字符
function strangecode(code)
{   var strangCode = "~`!@#$%^&*_+=|\'/？,，。<>";
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
//        strLength=stringIn.length;
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

//验证
function check(form)
{
    //验证信息分类
    if (form.rtype1.value=="")
    {
        alert("\n信息分类不能为空！");
        form.rtype1.focus();
        return (false);
    }
     if (form.rtype2.value=="")
    {
        alert("\n信息分类不能为空！");
        form.rtype2.focus();
        return (false);
    }


	 //验证所在地点
    if (form.province.value == "")
    {
        alert("信息所在省市不能为空！");
        form.province.focus();
        return (false);
    }

    if (form.city.value == "")
    {
        alert("信息所在地区不能为空！");
        form.city.focus();
        return (false);
    }

    //验证标题
    if (form.title.value=="")
    {
        alert("标题不能为空！");
        form.title.focus();
        return (false);
    }


    //验证详细信息
    if (form.content.value=="")
    {
        alert("详细信息不能为空！");
        form.content.focus();
        return (false);
    }
 if (getLength(form.content.value) < 30  || getLength(form.content.value) > 1601)
    {
        alert("详细信息应大于十五个字,小于等于八百字！");
        form.content.focus();
        return (false);
    }
}
//page


