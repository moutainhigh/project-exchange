//��֤���ݿ����Ƿ�ע����û�ID
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
        alert("\n�û����벻��Ϊ�գ�\n\n��3-12����,�м䲻�ܺ��пո񣩣�");
        return (false);
    }
    if (userName.length <3 )
    {
        alert("\n�û����벻��С��3λ");
//        form.userid.focus();
        return (false);
    }
    if (strangecode(userName)==false || userName.indexOf(" ") != -1)
    {
        alert("\n�û����벻�ܺ��������ַ����߿ո�");
//        form.userid.focus();
        return (false);
    }
    return(true);
  }
 //-->

//ʹ��onKeydown='onlyNum();'���ε�����������
function onlyNum()
{
  var keys=event.keyCode;
  if (!((keys>=48&&keys<=57)||(keys>=96&&keys<=105)
  ||(keys==8)||(keys==46)||(keys==37)||(keys==39)||(keys==13)||(keys==229)||(keys==189)||(keys==109)
  ))
  event.returnValue=false;
  }

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

//��֤�绰����
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
//��֤�����ַ�
function strangecode(code)
{   var strangCode = "~`!@#$%^&*-+=|\'/��,����<>";
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
//��֤�ֻ�����
/*
Ҫ��һ���ƶ��绰����Ϊ11��12λ�����Ϊ12λ,��ô��һλΪ0
����11λ�ƶ��绰����ĵ�һλ�͵ڶ�λΪ"13"
����12λ�ƶ��绰����ĵڶ�λ�͵���λΪ"13"
��;����������ֻ������Ƿ���ȷ
���룺
s���ַ���
���أ�
���ͨ����֤����true,���򷵻�false
*/
function f_check_mobile(obj){
    var regu =/(^[1][3,5][0-9]{9}$)|(^0[1][3,5][0-9]{9}$)/;
    var re = new RegExp(regu);
    if (re.test( obj.value )) {
     // alert("ok");
      return true;
    }
    //alert(obj+"��������ȷ���ֻ�����");
    return false;
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
function f_check_ZhOrNumOrLett(obj){    //�ж��û����Ƿ��Ǻ��֡���ĸ�����ֻ��»������
    var regu = "^[0-9a-zA-Z\u4e00-\u9fa5\_]+$";
    var re = new RegExp(regu);
    if (re.test( obj.value )) {
      return true;
    }
    alert("�����뺺�֡���ĸ�����ֻ��»���");
    return false;
}
function f_check_ZhOrNumOrLett2(obj){    //�ж��û����Ƿ��Ǻ��֡���ĸ���������
    var regu = "^[0-9a-zA-Z\u4e00-\u9fa5]+$";
    var re = new RegExp(regu);
    if (re.test( obj.value )) {
      return true;
    }
    return false;
}
//��֤
function check(form)
{
    //��֤�û�����
    if (form.username.value=="")
    {
       alert("\n�û�������Ϊ�գ�\n\n3-12���֣����ġ����֡���ĸ���»��ߣ�");
        form.username.focus();
        return (false);
    }

    if ( form.username.value.length < 3 )
    {
        alert("\n�û�������С��3λ��");
        form.username.focus();
        return (false);

    }

   if (f_check_ZhOrNumOrLett(form.username)==false)
    {
        alert("\n�û������ܺ��������ַ����߿ո�");
        form.username.focus();
        return (false);
    }

    //��֤����
    if (form.password1.value=="")
    {
        alert("\n�������ò���Ϊ�գ�\n\n��4-12��Ӣ����ĸ�����֣��м䲻�ܺ��пո񣩣�");
        form.password1.focus();
        return (false);
    }

    if ( form.password1.value.length < 4 )
    {
        alert("\n�û����벻��С��4λ��");
        form.password1.focus();
        return (false);

    }

    if(!/^\w{4,12}$/.test(form.password1.value))
    {
        alert("\n���벻�ܺ��������ַ����߿ո�");
        form.password1.focus();
        return (false);
    }

    if (form.password1.value == form.username.value)
    {
        alert("\nΪ��������Ϣ��ȫ���û���������벻����ͬ��\n\n����������д���룡");
        form.password1.value="";
        form.password2.value="";
        form.password1.focus();
        return (false);
    }

    //��֤ȷ�Ͽ���
    if (form.password2.value=="")
    {
        alert("\n����ȷ�ϲ���Ϊ�գ�\n\n��4-12��Ӣ����ĸ�����֣��м䲻�ܺ��пո񣩣�");
        form.password2.focus();
        return (false);
    }

    //��֤ȷ�Ͽ���
    if (form.password1.value != form.password2.value)
    {
        alert("\n������������벻һ����\n\n��������д��");
        form.password1.value="";
        form.password2.value="";
        form.password1.focus();
        return (false);
    }
    //��֤��ʵ����
   /* if (form.cp_name.value == "")
    {
        alert("��������/��λ���Ʋ���Ϊ�գ�");
        form.cp_name.focus();
        return (false);
    }

    if (form.cp_name.value.length < 2)
    {
        alert("��������/��λ��������̫�٣���׼ȷ��д��");
        form.cp_name.focus();
        return (false);
    }

    if (strangecode(form.cp_name.value)==false)
    {
        alert("��������/��λ���Ʋ��ܺ��������ַ���");
        form.cp_name.focus();
        return (false);
    }
*/
    //��֤��ϵ��
    if (form.con_name.value == "")
    {
        alert("��ϵ�˲���Ϊ�գ�");
        form.con_name.focus();
        return (false);
    }

    if (f_check_ZhOrNumOrLett2(form.con_name)==false)
    {
        alert("��ϵ�˲��ܺ��������ַ���");
        form.con_name.focus();
        return (false);
    }

    //��֤��ϵ�绰
  if(form.phone.value !=""){
    if (phone(form.phone.value) == false)
    {
        alert("�绰�������벻��ȷ������Ϊ���֡�����()������ -�����Ȳ���С��7λ��");
        form.phone.focus();
        return (false);
    }
   }

   if(form.mobile.value !=""){
     if (f_check_mobile(form.mobile) == false)
    {
       alert("��������Ч�ֻ����룡");
        form.mobile.focus();
        return (false);
    }
   }
        //��֤�绰����/�ֻ�����ͬʱΪ��
    if (form.phone.value == "" && form.mobile.value == "")
    {
         alert("��ϵ�绰���ֻ����벻��ͬʱΪ�գ�");
         form.phone.focus();
         return false;
    }
   //��֤��ϵ��ַ
   /* if (form.address.value=="")
    {
        alert("��ϸ��ַ����Ϊ�գ�");
        form.address.focus();
        return (false);
    }
    if (form.address.value.length < 6)
    {
        alert("��ϸ��ַ����̫�٣���������6���ַ�,��׼ȷ��д��");
        form.address.focus();
        return (false);
    }

    if (strangecode(form.address.value) == false)
    {
        alert("��ϸ��ַ���ܺ��������ַ���");
        form.address.focus();
        return (false);
    }

	 //��֤��λ���ڵص�
    if (form.n_address1.value == "")
    {
        alert("����ʡ�в���Ϊ�գ�");
        form.n_address1.focus();
        return (false);
    }

    if (form.n_address2.value == "")
    {
        alert("���ڵ�������Ϊ�գ�");
        form.n_address2.focus();
        return (false);
    }
*/
    //��֤��������
    if (form.email.value=="")
    {
        alert("email��ַ����Ϊ�գ�");
        form.email.focus();
        return (false);
    }
   if (!isemail(form.email.value) )
   {
      return false
    }

    //��֤�绰����/����/�����ʼ�����ͬʱΪ��
    if (form.phone.value == "" && form.mobile.value == "")
    {
         alert("��ϵ�绰||�ֻ����벻��ͬʱΪ�գ�");
         form.phone.focus();
         return false;
    }

    //��֤��֤��
    if (form.yzcode.value=="")
    {
        alert("��֤�벻��Ϊ�գ�");
        form.yzcode.focus();
        return (false);
    }
    form.Submit.value="�ύ��...";
    form.Submit.disabled = true;
    return true;
}

