
//��֤����
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

//��֤�绰����
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

//��֤�����ַ�
function strangecode(code)
{   var strangCode = "~`!@#$%^&*_+=|\'/��,����<>";
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

//�����ʼ�
 // Writen by stiven0 ,2006-03-08
function isemail (s)
{
         if (s.length > 40)
        {
                window.alert("�����ʼ����Ȳ��ܳ���40λ!");
                return false;
        }
		s = s.toLowerCase()
		 var regu = "^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*))@([a-zA-Z0-9-]+[.])+([a-zA-Z]{2}|net|NET|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT|name|NAME)$";
		 var re = new RegExp(regu);
         if (s.search(re) != -1) {
               return true;
         } else {
               window.alert ("���ĵ����ʼ���ʽ��д����ȷ��");
               return false;
         }
}
//�ַ�����
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

//��֤
function check(form)
{
    //��֤��Ϣ����
    if (form.rtype1.value=="")
    {
        alert("\n��Ϣ���಻��Ϊ�գ�");
        form.rtype1.focus();
        return (false);
    }
     if (form.rtype2.value=="")
    {
        alert("\n��Ϣ���಻��Ϊ�գ�");
        form.rtype2.focus();
        return (false);
    }


	 //��֤���ڵص�
    if (form.province.value == "")
    {
        alert("��Ϣ����ʡ�в���Ϊ�գ�");
        form.province.focus();
        return (false);
    }

    if (form.city.value == "")
    {
        alert("��Ϣ���ڵ�������Ϊ�գ�");
        form.city.focus();
        return (false);
    }

    //��֤����
    if (form.title.value=="")
    {
        alert("���ⲻ��Ϊ�գ�");
        form.title.focus();
        return (false);
    }


    //��֤��ϸ��Ϣ
    if (form.content.value=="")
    {
        alert("��ϸ��Ϣ����Ϊ�գ�");
        form.content.focus();
        return (false);
    }
 if (getLength(form.content.value) < 30  || getLength(form.content.value) > 1601)
    {
        alert("��ϸ��ϢӦ����ʮ�����,С�ڵ��ڰ˰��֣�");
        form.content.focus();
        return (false);
    }
}
//page


