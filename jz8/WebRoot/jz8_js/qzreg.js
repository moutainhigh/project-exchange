function UpdateCheckCode(Img)
{
	var timenow = new Date().getTime();
	url="./code/yz_image.jsp";
	url = url + "?time=" + timenow;
	Img.src=url;
}




//��֤���ݿ����Ƿ�ע����û�ID
<!-->
function CheckUserID(obj){
//  var userid=document.qzregForm.username.value;
var userid=obj.value;
    if (!checkUserName(obj))
    {
        obj.focus();
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
  function textCounter1(maxChars)
{     var vlen=Math.floor(getLength5(document.all.contact.value));
	document.all.InputCount1.innerHTML = maxChars -vlen ;
}
  function textCounter3(maxChars)
{     var vlen=Math.floor(getLength5(document.all.content.value));
	document.all.InputCount3.innerHTML = maxChars -vlen ;
}
  function textCounter5(maxChars)
{     var vlen=Math.floor(getLength5(document.all.brief.value));
	document.all.InputCount5.innerHTML = maxChars -vlen ;
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
        alert("\n�û�������Ϊ�գ�\n\n3-12���֣����ġ����֡���ĸ���»��ߣ�");
        return (false);
    }
    if (userName.value.length <3 )
    {
        alert("\n�û�������С��3λ");
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

//������ϵ�ˣ�������������������������
  function clear_zhushi4(obj1,obj2){
    Trim_char(obj1);
        if(obj1.value!=""){
         obj2.style.display="none";
             obj2.innerHTML ="";
         }
         else{
           obj2.style.display="inline";
             obj2.innerHTML ="����д��ϵ�ˣ�";
           }
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
{   var strangCode = "<>";
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
strLength=stringIn.length;
return   strLength;
}



// JavaScript Document//ȥ���ִ���ߵĿո�
function lTrim(str)
{
	if (str.charAt(0) == " ")
	{
	//����ִ���ߵ�һ���ַ�Ϊ�ո�

	str = str.slice(1);//���ո���ִ���ȥ��
	//��һ��Ҳ�ɸĳ� str = str.substring(1, str.length);
	str = lTrim(str); //�ݹ����
	}
	return str;
}

//ȥ���ִ��ұߵĿո�
function rTrim(str)
{
	var iLength;

	iLength = str.length;
	if (str.charAt(iLength - 1) == " ")
	{
		//����ִ��ұߵ�һ���ַ�Ϊ�ո�
		str = str.slice(0, iLength - 1);//���ո���ִ���ȥ��
		//��һ��Ҳ�ɸĳ� str = str.substring(0, iLength - 1);
		str = rTrim(str); //�ݹ����
	}
	return str;
}

//ȥ���ִ����ߵĿո�
function trim(str)
{
	return lTrim(rTrim(str));
}

function Trim_char(obj)
{
  var str=trim(obj.value)
  obj.value=str;
  }
function Trim_char2(obj)
{
  var str=trim(obj.value)
  obj.value=str;
//  document.all.lianxiren.value=str;
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
//document.getElementById("dwjj").innerHTML="<font color='#FF0000'>* </font>��λ��飺<br>10-500��&nbsp;&nbsp;&nbsp;";
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
//document.getElementById("dwjj").innerHTML="<font color='#FF0000'>* </font>��λ��飺<br>10-500��&nbsp;&nbsp;&nbsp;";
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
    if ( document.all.password2.value!=""&&obj.value != document.all.password2.value)
    {
      document.getElementById("pw2").style.display="none";
       document.getElementById("pw22").style.display="inline";
       document.getElementById("pw22").innerHTML ="������������벻һ������������д��";
        obj.value="";
        document.all.password2.value="";
        return (false);
    }
     document.getElementById("pw1").style.display="none";
      document.getElementById("pw12").style.display="inline";
//    document.getElementById("pw12").innerHTML ="<img src='../images/good2.gif'>&nbsp;<font color='#4DA531'>��д��ȷ</font>";
  document.getElementById("pw12").innerHTML ="";
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
       document.getElementById("pw22").innerHTML ="";
//       document.getElementById("pw22").innerHTML ="<img src='../images/good2.gif'>&nbsp;<font color='#4DA531'>��д��ȷ</font>";
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
        document.getElementById("con1").innerHTML ="��ʵ��������Ϊ�գ�";
        return (false);
    }

    if (f_check_ZhOrNumOrLett2(obj)==false)
    {
        document.getElementById("con1").style.display="inline";
        document.getElementById("con1").innerHTML ="��ʵ�������ܺ��������ַ���";
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
         document.getElementById("email2").innerHTML ="";
//         document.getElementById("email2").innerHTML ="<img src='../images/good2.gif'>&nbsp;<font color='#4DA531'>��д��ȷ</font>";

         if(document.qzregForm.contact.value.length==25){
         document.qzregForm.contact.value=document.qzregForm.contact.value+obj.value;}
          textCounter1(100);
         return true;
}
function setType1(oj2,cc){
  for(i=1;i<=8;i++){
  if(cc==fclass[i]){
  oj2.options[i].selected=true;
  }
}
}

function setType2(oj,cc,v){
//       alert(cc+v);
	var m=-1;
	for (i=1;i<=8;i++){
		if (fclass[i]==v){
			m=i;
			}
	}
	clear2(oj);
        var temp;
	if (m!=-1){
	 	for (i=1;i<sclass[m].length;i++){
                      temp=v+tclass[m][i];
//                      alert(temp+""+cc);
                      if(cc==temp){
//                        alert(temp+""+cc);
		 	oj.add(new Option(sclass[m][i],temp));
                        oj.options[i-1].selected=true;
                         }
                      else{
                      oj.add(new Option(sclass[m][i],temp));
                      }
		}

	}
}


function set_fb_type(oj,k){
  var v=k.value;
	var m=-1;
	for (i=1;i<=36;i++){
		if (fclass[i]==v){
			m=i;
			}
	}
	clear(oj);
	if (m!=-1){
      for (i=1;i<sclass[m].length;i++){
		 	oj.add(new Option(sclass[m][i],(v+tclass[m][i])));
		}
      }
}

function set_fb_rtype22(obj){
  if(!obj){
         document.getElementById("rtype2").style.display="none";
         document.getElementById("fb_rtype22").style.display="inline";
    	 document.getElementById("fb_rtype22").innerHTML ="��ѡ����Ϣ���࣡";
         return false;
         }
      else {
         document.getElementById("rtype2").style.display="inline";
         document.getElementById("fb_rtype22").style.display="inline";
    	 document.getElementById("fb_rtype22").innerHTML ="��ѡ��������࣡";
         return false;
        }
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
     if (getLength(obj.value)!=4)
    {
          document.getElementById("yzcode2").style.display="inline";
    	 document.getElementById("yzcode2").innerHTML ="��֤��λ�����ԣ�";
        obj.focus();
        return (false);
    }
    document.getElementById("yzcode2").style.display="none";
      return true
}

//��֤
function check(form)
{
//return true;
    //��֤�û�����
    if (form.username.value=="")
    {
        alert("\n�û�������Ϊ�գ�\n\n3-12���֣����ġ����֡���ĸ���»��ߣ�");
        form.username.focus();
        return (false);
    }

    if ( form.username.value.length < 3&&form.username.value.length > 12 )
    {
        alert("\n�û�������Ϊ 3-12 ���֣�");
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
        form.password1.value="";
        form.password2.value="";
        form.password1.focus();
        return (false);
    }

    //��֤ȷ�Ͽ���
    if (form.password2.value=="")
    {
        alert("\n����ȷ�ϲ���Ϊ�գ�\n\n��4-12���ַ�����");
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


        if (form.lianxiren.value=="")
    {
        alert("��ϵ�˲���Ϊ�գ�");
        form.lianxiren.focus();
        return (false);
    }
   if (strangecode(form.lianxiren.value)==false)
    {
        alert("\n��ϵ���в��ܺ��������ַ� < >");
        form.lianxiren.focus();
        return (false);
    }
    if (form.contact.value.length ==25)
    {
        alert("����д������ϵ��ʽ��");
        form.contact.focus();
        return (false);
    }
        if (form.contact.value.length <5)
    {
        alert("����д������ϵ��ʽ��");
        form.contact.focus();
        return (false);
    }
   if (strangecode(form.contact.value)==false)
    {
        alert("\n��ϵ��ʽ�в��ܺ��������ַ� < >");
        form.contact.focus();
        return (false);
    }
    if(getLength5(form.contact.value)>100)
    {
    alert("��ϵ��ʽ�ַ������ܳ���100�����޸ĺ����ԣ�")
    return false;
    }

   if(countInstances(form.contact.value)>0){
    alert("��Ϣ���ϵͳ���������ܱ�Ǹ���������ύ�������к���ϵͳ������Ĺؼ��ʻ�������IP�ܵ��˷������ƣ����β�����Ч��ϵͳ�Ѽ�¼����IP�����ύ���������ݡ���ע�⣬��Ҫ�ύ�κ�Υ�����ҹ涨�����ݣ�");
    form.contact.focus();
      return (false);
    }
   if (strangecode(form.brief.value)==false)
    {
        alert("\n���˼����в��ܺ��������ַ� < >");
        form.brief.focus();
        return (false);
    }
    if(getLength5(form.brief.value)>500)
    {
    alert("���˼����ַ������ܳ���500�����޸ĺ����ԣ�")
    return false;
    }
   if(countInstances(form.brief.value)>0){
    alert("��Ϣ���ϵͳ���������ܱ�Ǹ���������ύ�������к���ϵͳ������Ĺؼ��ʻ�������IP�ܵ��˷������ƣ����β�����Ч��ϵͳ�Ѽ�¼����IP�����ύ���������ݡ���ע�⣬��Ҫ�ύ�κ�Υ�����ҹ涨�����ݣ�");
    form.brief.focus();
      return (false);
    }
          if (!form.ct_class[0].checked&&!form.ct_class[1].checked)
      {
          alert("��ѡ��������");
          form.ct_class[0].focus();
          return (false);
      }
    if (form.rtype11.value==""&&form.rtype21.value==""&&form.rtype31.value==""&&form.rtype41.value=="")
    {

        alert("\n������ѡ��һ����������");
        form.rtype11.focus();
        return (false);
    }


      Trim_char(form.salary);
     if(form.salary.value==""){
   	 alert("\n����д����нˮ��");
        form.slary.focus();
        return (false);
   	}

	 //��֤��λ���ڵص�
    if (form.n_address1.value == "")
    {
        alert("����������ѡ��");
        form.n_address1.focus();
        return (false);
    }

    if (form.n_address2.value == "")
    {
        alert("����������ѡ��");
        form.n_address2.focus();
        return (false);
    }


    //��֤����

     Trim_char(form.title);
    if (form.title.value=="")
    {
        alert("��ְ���ⲻ��Ϊ�գ�");
        form.title.value="";
        form.title.focus();
        return (false);
    }
       if (strangecode(form.title.value)==false)
    {
        alert("\n��ְ���ⲻ�ܺ��������ַ� < >");
        form.title.focus();
        return (false);
    }

      if(countInstances(form.title.value)>0){
    alert("��Ϣ���ϵͳ���������ܱ�Ǹ���������ύ�������к���ϵͳ������Ĺؼ��ʻ�������IP�ܵ��˷������ƣ����β�����Ч��ϵͳ�Ѽ�¼����IP�����ύ���������ݡ���ע�⣬��Ҫ�ύ�κ�Υ�����ҹ涨�����ݣ�");
    form.title.focus();
      return (false);
    }

    //��֤��ϸ��Ϣ

      Trim_char(form.content);
    if (form.content.value=="")
    {
        alert("��ְ���ݲ���Ϊ�գ�");
        form.content.value="";
        form.content.focus();
        return (false);
    }
    if (strangecode(form.content.value)==false)
    {
        alert("\n��ְ�����в��ܺ��������ַ� < >");
        form.content.focus();
        return (false);
    }
    if (getLength(form.content.value) < 10  || getLength(form.content.value) > 500)
    {
        alert(getLength(form.content.value)+"��ְ����˵������ʮ���ַ�,С�ڵ���500�ַ���");
        form.content.focus();
        return (false);
    }

      if(countInstances(form.content.value)>0){
    alert("��Ϣ���ϵͳ���������ܱ�Ǹ���������ύ�������к���ϵͳ������Ĺؼ��ʻ�������IP�ܵ��˷������ƣ����β�����Ч��ϵͳ�Ѽ�¼����IP�����ύ���������ݡ���ע�⣬��Ҫ�ύ�κ�Υ�����ҹ涨�����ݣ�");
    form.content.focus();
      return (false);
    }
    //��֤��֤��
    if (form.yzcode.value=="")
    {
        alert("����д��֤�룡");
        form.yzcode.focus();
        return (false);
    }
    if (getLength(form.yzcode.value)!=4)
    {
        alert("��֤��λ�����ԣ�");
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
