//��֤���ݿ����Ƿ�ע����û�ID
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
        document.getElementById("undiv2").innerHTML ="���ڼ�����Ե�...";
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
        alert("\n�û����벻��Ϊ�գ�\n\n3-12���֣����ġ����֡���ĸ���»��ߣ�");
        return (false);
    }
    if (userName.value.length <3 )
    {
        alert("\n�û����벻��С��3λ");
        return (false);
    }
    if (f_check_ZhOrNumOrLett(userName)==false)
    {
        return (false);
    }
    return(true);
  }
 //-->
function f_check_ZhOrNumOrLett(obj){    //�ж��û����Ƿ��Ǻ��֡���ĸ�����ֻ��»������
    var regu = "^[0-9a-zA-Z\u4e00-\u9fa5\_]+$";
    var re = new RegExp(regu);
    if (re.test( obj.value )) {
      return true;
    }
    alert("�����뺺�֡���ĸ�����ֻ��»���");
    return false;
}


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


//��֤�����ַ�
function strangecode(code)
{   var strangCode = "~`!@#$%^&*+=|\'/��,����<>";
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

//---------����1��֤����ʼ
function setPW1(obj){
        document.getElementById("pw12").style.display="none";
        document.getElementById("pw1").style.display="inline";
  }

function rdbtnState(obj){
if(obj.value=="0")
{
document.getElementById("dwjj").innerHTML="���ҽ��ܣ�";
document.getElementById("dwmc").style.display="none";
document.getElementById("digree23").style.display="inline";
document.getElementById("sex2").style.display="inline";
//document.getElementById("dwjj").style.display="none";
document.getElementById("dwdz").style.display="none";
}
else {
document.getElementById("dwmc").style.display="inline";
document.getElementById("dwjj").innerHTML="��λ��飺";
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
document.getElementById("dwjj").innerHTML="��λ��飺";
document.getElementById("digree23").style.display="none";
document.getElementById("sex2").style.display="none";
//document.getElementById("dwjj").style.display="inline";
document.getElementById("dwdz").style.display="inline";
}
else {
document.getElementById("dwjj").innerHTML="���ҽ��ܣ�";
document.getElementById("dwmc").style.display="none";
document.getElementById("digree23").style.display="inline";
document.getElementById("sex2").style.display="inline";
//document.getElementById("dwjj").style.display="none";
document.getElementById("dwdz").style.display="none";
}
}

function checkPW1(obj){
      //��֤����
      var password=obj.value;
    if (password=="")
    {
        document.getElementById("pw12").style.display="inline";
        document.getElementById("pw1").style.display="none";
        document.getElementById("pw12").innerHTML ="�������ò���Ϊ�գ�";
        return (false);
    }

    if ( password.length < 4 )
    {
      document.getElementById("pw12").style.display="inline";
        document.getElementById("pw1").style.display="none";
        document.getElementById("pw12").innerHTML ="�û����벻��С��4λ��";
        return (false);
    }

    if (password.value == document.all.username.value)
    {
        document.getElementById("pw12").style.display="inline";
        document.getElementById("pw1").style.display="none";
        document.getElementById("pw12").innerHTML ="Ϊ��������Ϣ��ȫ���û���������벻����ͬ������������д���룡";
        return (false);
    }

     document.getElementById("pw1").style.display="none";
      document.getElementById("pw12").style.display="inline";
  //  document.getElementById("pw12").innerHTML ="<img src='../images/good2.gif'>&nbsp;<font color='#4DA531'>��д��ȷ</font>";
  }
//---------����1��֤������


//---------����2��֤����ʼ
function setPW2(obj){
        document.getElementById("pw22").style.display="none";
        document.getElementById("pw2").style.display="inline";
  }

function checkPW2(obj){
    //��֤ȷ�Ͽ���
    if (obj.value=="")
    {
       document.getElementById("pw2").style.display="none";
       document.getElementById("pw22").style.display="inline";
       document.getElementById("pw22").innerHTML ="����ȷ�ϲ���Ϊ�գ�";
        return (false);
    }

    //��֤ȷ�Ͽ���
    if (obj.value != document.all.password1.value)
    {
      document.getElementById("pw2").style.display="none";
       document.getElementById("pw22").style.display="inline";
       document.getElementById("pw22").innerHTML ="������������벻һ������������д��";
        obj.value="";
        document.all.password1.value="";
        setPW1(document.all.password1)
        return (false);
    }
       document.getElementById("pw2").style.display="none";
       document.getElementById("pw22").style.display="inline";
       document.getElementById("pw22").innerHTML ="<img src='../jz8_images/good2.gif'>&nbsp;<font color='#4DA531'>��д��ȷ</font>";
  }

function f_check_ZhOrNumOrLett2(obj){    //�ж��û����Ƿ��Ǻ��֡���ĸ���������
    var regu = "^[0-9a-zA-Z\u4e00-\u9fa5]+$";
    var re = new RegExp(regu);
    if (re.test( obj.value )) {
      return true;
    }
    return false;
}

  function check_con(obj){
        //��֤��ϵ��
         Trim_char(obj);
    if (obj.value == "")
    {
        document.getElementById("con1").style.display="inline";
        document.getElementById("con1").innerHTML ="��ϵ�˲���Ϊ�գ�";
        return (false);
    }

    if (f_check_ZhOrNumOrLett2(obj)==false)
    {
        document.getElementById("con1").style.display="inline";
        document.getElementById("con1").innerHTML ="��ϵ�˲��ܺ��������ַ���";
        return (false);
    }
    document.getElementById("con1").style.display="inline";
    document.getElementById("con1").innerHTML ="<img src='../jz8_images/good2.gif'>&nbsp;<font color='#4DA531'>��д��ȷ</font>";
    }


  function set_phone1(){
        document.getElementById("phone12").style.display="none";
        document.getElementById("phone11").style.display="inline";
    }
function check_phone1(obj){
      //��֤��ϵ�绰
         Trim_char(obj);
           var msg="";
  if(obj.value !=""){
    if (phone(obj.value) == false)
    {
        document.getElementById("phone11").style.display="none";
    	document.getElementById("phone12").style.display="inline";
    	document.getElementById("phone12").innerHTML ="�绰�������벻��ȷ������Ϊ���֡�����()������ -�����Ȳ���С��7λ��";
        return (false);
    }
    msg="<img src='../jz8_images/good2.gif'>&nbsp;<font color='#4DA531'>��д��ȷ</font>";
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
      //��֤��ϵ�绰
        Trim_char(obj);
        var msg="";
   if(obj.value !=""){
    if (f_check_mobile(obj) == false)
    {
        document.getElementById("mobile11").style.display="none";
    	document.getElementById("mobile12").style.display="inline";
    	document.getElementById("mobile12").innerHTML ="��������Ч�ֻ����룡";
        return (false);
    }
    msg="<img src='../jz8_images/good2.gif'>&nbsp;<font color='#4DA531'>��д��ȷ</font>";
    document.getElementById("mobile11").style.display="none";
   }
        //��֤�绰����/�ֻ�����ͬʱΪ��
    if (document.all.phone.value == "" && obj.value == "")
    {
         document.getElementById("mobile11").style.display="none";
    	 document.getElementById("mobile12").style.display="inline";
    	 document.getElementById("mobile12").innerHTML ="�绰���롢�ֻ����벻��ͬʱΪ�գ�";
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
  	document.getElementById("email2").innerHTML ="�����ʼ�����Ϊ�գ�";
  	return false;
    }

		obj.value = obj.value.toLowerCase()
		 var regu = "^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*))@([a-zA-Z0-9-]+[.])+([a-zA-Z]{2}|net|NET|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT|name|NAME)$";
		 var re = new RegExp(regu);
         if (obj.value.search(re) == -1) {
         document.getElementById("email2").style.display="inline";
    	 document.getElementById("email2").innerHTML ="�����ʼ���ʽ��д����ȷ��";
         return false;
         }
         document.getElementById("email2").style.display="inline";
       //  document.getElementById("email2").innerHTML ="<img src='../images/good2.gif'>&nbsp;<font color='#4DA531'>��д��ȷ</font>";

         if(document.regForm.contact.value.length==24){
         document.regForm.contact.value=document.regForm.contact.value+obj.value;}
         return true;
}


function check_yzcode(obj)
{
  Trim_char(obj);
  if(obj.value.length<1){
  	document.getElementById("yzcode2").style.display="inline";
  	document.getElementById("yzcode2").innerHTML ="��֤�벻��Ϊ�գ�";
  	return false;
    }
//   var patrn=/^[0-9]{1,4}$/;
//    if (!patrn.exec(obj.value)) {
//         document.getElementById("yzcode2").style.display="inline";
//    	 document.getElementById("yzcode2").innerHTML ="��֤�����(������ǰ����֤��)��";
//        return false
//    }
    document.getElementById("yzcode2").style.display="none";
      return true
}

//��֤
function check_myreg(form)
{
//return true;
    //��֤�û�����
 //��֤��������
    if (form.email.value=="")
    {
        alert("email��ַ����Ϊ�գ�");
        form.email.focus();
        return (false);
    }
   if (!isemail(form.email.value) )
   {
        alert("email��ַ��ʽ����");
        form.email.focus();
      return false
    }

    //��֤����
    if (form.password1.value=="")
    {
        alert("\n�������ò���Ϊ�գ�\n\n��4-12���ַ�����");
        form.password1.focus();
        return (false);
    }

    if ( form.password1.value.length < 4 )
    {
        alert("\n�û����벻��С��4λ��");
        form.password1.focus();
        return (false);

    }

    if (form.password1.value == form.username.value)
    {
        alert("\nΪ��������Ϣ��ȫ���û���������벻����ͬ��\n\n����������д���룡");
        form.password1.focus();
        return (false);
    }
     Trim_char(form.lianxiren);
        if (form.lianxiren.value=="")
    {
        alert("��ϵ�˲���Ϊ�գ�");
        form.lianxiren.focus();
        return (false);
    }
	 //��֤��λ���ڵص�
//    if (form.n_address1.value == "")
//    {
//        alert("����ʡ�в���Ϊ�գ�");
//        form.n_address1.focus();
//        return (false);
//    }
//
//    if (form.n_address2.value == "")
//    {
//        alert("���ڵ�������Ϊ�գ�");
//        form.n_address2.focus();
//        return (false);
//    }
   Trim_char(form.contact);
    if(getLength5(form.contact.value)<5)
    {
    alert("��ϵ��ʽ����Ϊ��,����д��")
    return false;
    }

    if(getLength5(form.contact.value)>100)
    {
    alert("��ϵ��ʽ�ַ������ܳ���100�����޸ĺ����ԣ�")
    return false;
    }

    if(form.kind.value=="1"){
//       if(form.unitName.value==""){
//       alert("��λ���Ʋ���Ϊ�գ�");
//        form.unitName.focus();
//        return (false);
//      }
       Trim_char(form.contact);
//    if(getLength5(form.unitIntro.value)<10){
//       alert("��λ���̫���򵥣�����ϸ��д���Դﵽ���õ�Ч����");
//        form.unitIntro.focus();
//        return (false);
//      }
          if(getLength5(form.unitIntro.value)>500)
       {
       alert("��λ����ַ������ܳ���500�����޸ĺ����ԣ�");
       form.unitIntro.focus();
       return false;
      }

    }

    //��֤��֤��
    if (form.yzcode.value=="")
    {
        alert("����д��֤�룡");
        form.yzcode.focus();
        return (false);
    }
        if (form.yzcode.value.length<4)
    {
        alert("��֤����д����");
        form.yzcode.focus();
        return (false);
    }
    form.Submit.value="�ύ��...";
   form.Submit.disabled = true;
    return true;
}


function check_pro(obj){
  if(obj.value==""){
         document.getElementById("address32").style.display="inline";
    	// document.getElementById("address32").innerHTML ="��ѡ������ʡ�У�";
         return false;
         }
      else {
         document.getElementById("address32").style.display="inline";
    	// document.getElementById("address32").innerHTML ="��ѡ�����ڵ�����";
         return false;
        }
        return true;
  }

function check_city(obj){
  if(obj.value==""){
         document.getElementById("address32").style.display="inline";
    	// document.getElementById("address32").innerHTML ="��ѡ�����ڵ�����";
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
