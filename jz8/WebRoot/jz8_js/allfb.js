function del_click(){
if(confirm('ɾ����Ϣ��ɾ���������ԣ�ȷ��Ҫ����ɾ������Ϣ��'))
{
    document.allfbForm.action ="./allfbM.do?method=del";
    document.allfbForm.submit();
}
else return false;

}


function onlyNum()
{
  var keys=event.keyCode;
  if (!((keys>=48&&keys<=57)||(keys>=96&&keys<=105)
  ||(keys==8)||(keys==46)||(keys==37)||(keys==39)||(keys==13)||(keys==229)||(keys==189)||(keys==109)
  ))
  event.returnValue=false;
  }
function UpdateCheckCode(Img)
{
	var timenow = new Date().getTime();
	url="/code/yz_image.jsp";
	url = url + "?time=" + timenow;
	Img.src=url;
}



      function  getLength5(stringIn)
  {
    var   strLength=0;
        strLength=stringIn.length;
      return   strLength;
  }
    function textCounter(maxChars)
  {     var vlen=getLength5(document.all.content.value);
          document.all.InputCount.innerHTML = maxChars -vlen ;
  }

    function textCounter1(maxChars)
  {     var vlen=getLength5(document.all.contact.value);
          document.all.InputCount1.innerHTML = maxChars -vlen ;
  }

  <!-->



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

 //��֤�ַ�<>
  function strangecode2(code)
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
/*
    function rdbtnState(obj){
    if(obj.value=="0")
    {
    document.getElementById("qzwork2").innerHTML="���ҽ��ܣ�";
    document.getElementById("dwmc").style.display="none";
    document.getElementById("qzwork2").style.display="inline";
    document.getElementById("qzdiqu").style.display="inline";
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
*/

  function rdbtnState2(obj){
 // alert(obj);
  if(obj=="1")
  {
  document.getElementById("qzwork2").style.display="none";
  document.getElementById("qzdiqu").style.display="none";

  document.getElementById("zpxz").style.display="inline";
  document.getElementById("zwlx").style.display="inline";
  document.getElementById("zpdiqu").style.display="inline";
  document.getElementById("sex2").style.display="inline";
  document.getElementById("jobnum2").style.display="inline";
  document.getElementById("digree2").innerHTML="ѧ��Ҫ��";
  document.getElementById("daiyu2").innerHTML="н�������";
  document.getElementById("title2").innerHTML="ְλ���ƣ�";
  document.getElementById("jianjie2").innerHTML="ְλ����Ҫ��";

  }
  else {
  document.getElementById("qzwork2").style.display="inline";
  document.getElementById("qzdiqu").style.display="inline";

  document.getElementById("zpxz").style.display="none";
  document.getElementById("zwlx").style.display="none";
  document.getElementById("zpdiqu").style.display="none";
  document.getElementById("digree2").innerHTML="����ѧ����";
  document.getElementById("sex2").style.display="none";
  document.getElementById("jobnum2").style.display="none";
  document.getElementById("daiyu2").innerHTML="����Ҫ��";
  document.getElementById("title2").innerHTML="��ְ���⣺";
  document.getElementById("jianjie2").innerHTML="��ְ���ݼ�<br>���˼�飺";
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
      document.getElementById("pw12").innerHTML ="<img src='../jz8_images/good2.gif'>&nbsp;<font color='#4DA531'>��д��ȷ</font>";
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
           document.getElementById("email2").innerHTML ="<img src='../jz8_images/good2.gif'>&nbsp;<font color='#4DA531'>��д��ȷ</font>";
        //   alert(document.allfbForm.contact.value.length);
           if(document.allfbForm.contact.value.length==31){
           document.allfbForm.contact.value=document.allfbForm.contact.value+obj.value;}
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
     var patrn=/^[0-9]{1,4}$/;
      if (!patrn.exec(obj.value)) {
           document.getElementById("yzcode2").style.display="inline";
           document.getElementById("yzcode2").innerHTML ="��֤�����(������ǰ����֤��)��";
          return false
      }
      document.getElementById("yzcode2").style.display="none";
        return true
  }

  //��֤
  function allfbCheck(form)
  {
  

            if (!form.kind[0].checked&&!form.kind[1].checked)
      {
          alert("��ѡ�������");
          form.kind[0].focus();
          return (false);
      }
      if (!form.ct_class[0].checked&&!form.ct_class[1].checked)
      {
          alert("��ѡ��������");
          form.ct_class[0].focus();
          return (false);
      }
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


      if(getLength5(form.contact.value)>200)
      {
      alert("��ϵ��ʽ�ַ������ܳ���200�����޸ĺ����ԣ�")
      return false;
      }
        if(countInstances(form.contact.value)>0){
    alert("��Ϣ���ϵͳ���������ܱ�Ǹ���������ύ�������к���ϵͳ������Ĺؼ��ʻ�������IP�ܵ��˷������ƣ����β�����Ч��ϵͳ�Ѽ�¼����IP�����ύ���������ݡ���ע�⣬��Ҫ�ύ�κ�Υ�����ҹ涨�����ݣ�");
    form.contact.focus();
      return (false);
    }
      if(form.kind[0].checked){
     if (form.rtype11.value==""&&form.rtype21.value==""&&form.rtype31.value==""&&form.rtype41.value=="")
    {

        alert("\n������ѡ��һ����������");
        form.rtype11.focus();
        return (false);
    }



	 //��֤���ڵص�
  if (form.qzpro.value=="")
    {
        alert("��ѡ����������");
        form.qzpro.focus();
        return (false);
    }

    var salary=form.salary.value.Trim();
     form.salary.value=salary;
     if(form.salary.value==""){
   	 alert("\n����д����нˮ��");
        form.slary.focus();
        return (false);
   	}

    //��֤����
     var title=form.title.value.Trim();
     form.title.value=title;
    if (form.title.value=="")
    {
        alert("��ְ���ⲻ��Ϊ�գ�");
        form.title.value="";
        form.title.focus();
        return (false);
    }
       if (strangecode2(form.title.value)==false)
    {
        alert("\n���ⲻ�ܺ��������ַ� < >");
        form.title.focus();
        return (false);
    }
        if(countInstances(form.title.value)>0){
    alert("��Ϣ���ϵͳ���������ܱ�Ǹ���������ύ�������к���ϵͳ������Ĺؼ��ʻ�������IP�ܵ��˷������ƣ����β�����Ч��ϵͳ�Ѽ�¼����IP�����ύ���������ݡ���ע�⣬��Ҫ�ύ�κ�Υ�����ҹ涨�����ݣ�");
    form.title.focus();
      return (false);
    }
    //��֤��ϸ��Ϣ
     var content=form.content.value.Trim();
     form.content.value=content;
    if (form.content.value=="")
    {
        alert("��ְ���ݼ����˼�鲻��Ϊ�գ�");
        form.content.value="";
        form.content.focus();
        return (false);
    }
    if (strangecode2(form.content.value)==false)
    {
        alert("\n��ְ���ݼ����˼�鲻�ܺ��������ַ� < >");
        form.content.focus();
        return (false);
    }
    if (getLength5(form.content.value) < 10  || getLength5(form.content.value) > 500)
    {
        alert("��ְ���ݼ����˼�����ʮ���ַ�,С�ڵ���500�ַ���");
        form.content.focus();
        return (false);
    }
        if(countInstances(form.content.value)>0){
    alert("��Ϣ���ϵͳ���������ܱ�Ǹ���������ύ�������к���ϵͳ������Ĺؼ��ʻ�������IP�ܵ��˷������ƣ����β�����Ч��ϵͳ�Ѽ�¼����IP�����ύ���������ݡ���ע�⣬��Ҫ�ύ�κ�Υ�����ҹ涨�����ݣ�");
    form.content.focus();
      return (false);
    }
     }
      else{
     if(form.unitType[0].checked==false && form.unitType[1].checked==false&& form.unitType[2].checked==false){
   	 alert("\n��ѡ����Ƹ���ʣ�");
        form.kind[0].focus();
        return (false);
   	}


    if (form.rtype1.value=="")
    {
        alert("\n��ѡ��ְλ���");
        form.rtype1.focus();
        return (false);
    }

	 //��֤���ڵص�
  if (form.zpcity.value=="")
    {
        alert("��ѡ����������");
        form.zppro.focus();
        return (false);
    }

  if (form.digree.value=="")
    {
        alert("��ѡ��ѧ��Ҫ��");
        form.digree.focus();
        return (false);
    }

  if (form.sex.value=="")
    {
        alert("��ѡ���Ա�Ҫ��");
        form.sex.focus();
        return (false);
    }

    var salary=form.salary.value.Trim();
     form.salary.value=salary;
     if(form.salary.value==""){
   	 alert("\n����дн�ʴ�����");
        form.slary.focus();
        return (false);
   	}
   if (strangecode2(form.salary.value)==false)
    {
        alert("\nн�ʴ����в��ܺ��������ַ� < >");
        form.salary.focus();
        return (false);
    }

    if (getLength5(form.salary.value) >15  )
    {
        alert("н�ʴ���С�ڵ���15�ַ���");
        form.salary.focus();
              return (false);
    }


     if (form.jobnum.value=="")
    {
        alert("����д��Ƹ������");
        form.selSex.focus();
        return (false);
    }

    //��֤����

     Trim_char(form.title);

    if (form.title.value=="")
    {
        alert("ְλ���Ʋ���Ϊ�գ�");
        form.title.value="";
        form.title.focus();
        return (false);
    }
       if (strangecode2(form.title.value)==false)
    {
        alert("\nְλ���ƺ��������ַ� < >");
        form.title.focus();
        return (false);
    }
    if(countInstances(form.title.value)>0){
    alert("��Ϣ���ϵͳ���������ܱ�Ǹ���������ύ�������к���ϵͳ������Ĺؼ��ʻ�������IP�ܵ��˷������ƣ����β�����Ч��ϵͳ�Ѽ�¼����IP�����ύ���������ݡ���ע�⣬��Ҫ�ύ�κ�Υ�����ҹ涨�����ݣ�");
    form.title.focus();
      return (false);
    }
    //��֤��ϸ��Ϣ
     var content=form.content.value.Trim();
     form.content.value=content;
    if (form.content.value=="")
    {
        alert("ְλ����Ҫ����Ϊ�գ�");
        form.content.value="";
        form.content.focus();
        return (false);
    }
    if (strangecode2(form.content.value)==false)
    {
        alert("\nְλ����Ҫ���ܺ��������ַ� < >");
        form.content.focus();
        return (false);
    }
    if (getLength5(form.content.value) < 10  || getLength5(form.content.value) > 500)
    {
        alert("ְλ����Ҫ�����ʮ���ַ�,С�ڵ���500�ַ���");
        form.content.focus();
        return (false);
    }
    if(countInstances(form.content.value)>0){
    alert("��Ϣ���ϵͳ���������ܱ�Ǹ���������ύ�������к���ϵͳ������Ĺؼ��ʻ�������IP�ܵ��˷������ƣ����β�����Ч��ϵͳ�Ѽ�¼����IP�����ύ���������ݡ���ע�⣬��Ҫ�ύ�κ�Υ�����ҹ涨�����ݣ�");
    form.content.focus();
      return (false);
    }

      }

  // alert(getLength5(form.content.value));

  if (form.contact.value.length ==31)
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
    if (strangecode2(form.contact.value)==false)
    {
        alert("\n��ϵ��ʽ���ܺ��������ַ� < >");
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
        if (form.limitdate.value=="")
    {
        alert("ְλ��Ϣ��Ч�ڲ���Ϊ�գ�");
        form.limitdate.focus();
        return (false);
    }
      //��֤��֤��
      if (form.yzcode.value=="")
      {
          alert("����д��֤�룡");
          form.yzcode.focus();
          return (false);
      }

 // alert(getLength5(form.content.value)+"  "+getLength5(form.contact.value));

     form.submit2.value="�ύ��...";
      form.submit2.disabled = true;
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

function clear2(o){
l=o.length;

for (i = 0; i< l; i++){
	o.options[0]=null;
}
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



function setCity_allzpfb(oj2,cc,pp){
        if(cc.length>0)
       oj2.disabled=false;
	var m=-1;
	for (i=1;i<=36;i++){
  		if (province[i]==pp){
     			m=i;
     		}
	}
	clear(oj2);
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



function setPro_allzpfb(oj2,cc){
  if(cc.length>0&&cc!='null')
oj2.options[cc].selected=true;
}


function setCity_allqzfb(oj2,cc,pp){
        if(cc.length>0)
       oj2.disabled=false;
	var m=-1;
	for (i=1;i<=36;i++){
  		if (province[i]==pp){
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



function setPro_allqzfb(oj2,cc){
  if(cc.length>0&&cc!='null')
oj2.options[cc].selected=true;
}


//�û���Ƹ����
function set_zpfb_pro(oj,k){
	var v=k.value;
      var m=-1;
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
  }
}
// ��ְ����
function set_qzfb_pro(oj,k){
	var v=k.value;
      var m=-1;
    for (i=1;i<=36;i++){
        if (province[i]==v){
	 m=i;
	}
   }
  clear2(oj);
  if (m!=-1){
     for (i=1;i<citys[m].length;i++){
      oj.add(new Option(name1[m][i],citys[m][i]));
     }
  }
}


// ��������
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




//����ҳ��ʱ,�Զ�������������
function setTypeall1(oj2,cc){
  for(i=1;i<=8;i++){
  if(cc==fclass[i]){
  oj2.options[i].selected=true;
  }
}
}

function setTypeall2(oj,cc,v){
//       alert(cc+v);
	var m=-1;
	for (i=1;i<=8;i++){
		if (fclass[i]==v){
			m=i;
			}
	}
	clear(oj);
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
