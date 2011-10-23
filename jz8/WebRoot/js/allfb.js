function del_click(){
if(confirm('删除信息将删除其下留言，确定要永久删除该信息吗？'))
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

 //验证字符<>
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
/*
    function rdbtnState(obj){
    if(obj.value=="0")
    {
    document.getElementById("qzwork2").innerHTML="自我介绍：";
    document.getElementById("dwmc").style.display="none";
    document.getElementById("qzwork2").style.display="inline";
    document.getElementById("qzdiqu").style.display="inline";
    //document.getElementById("dwjj").style.display="none";
    document.getElementById("dwdz").style.display="none";
    }
    else {
    document.getElementById("dwmc").style.display="inline";
    document.getElementById("dwjj").innerHTML="单位简介：";
    //document.getElementById("dwjj").innerHTML="<font color='#FF0000'>* </font>单位简介：<br>10-500字&nbsp;&nbsp;&nbsp;";
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
  document.getElementById("digree2").innerHTML="学历要求：";
  document.getElementById("daiyu2").innerHTML="薪金待遇：";
  document.getElementById("title2").innerHTML="职位名称：";
  document.getElementById("jianjie2").innerHTML="职位具体要求：";

  }
  else {
  document.getElementById("qzwork2").style.display="inline";
  document.getElementById("qzdiqu").style.display="inline";

  document.getElementById("zpxz").style.display="none";
  document.getElementById("zwlx").style.display="none";
  document.getElementById("zpdiqu").style.display="none";
  document.getElementById("digree2").innerHTML="个人学历：";
  document.getElementById("sex2").style.display="none";
  document.getElementById("jobnum2").style.display="none";
  document.getElementById("daiyu2").innerHTML="待遇要求：";
  document.getElementById("title2").innerHTML="求职标题：";
  document.getElementById("jianjie2").innerHTML="求职内容及<br>个人简介：";
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
      if ( document.all.password2.value!=""&&obj.value != document.all.password2.value)
      {
        document.getElementById("pw2").style.display="none";
         document.getElementById("pw22").style.display="inline";
         document.getElementById("pw22").innerHTML ="两次输入的密码不一样，请重新填写！";
          obj.value="";
          document.all.password2.value="";
          return (false);
      }
       document.getElementById("pw1").style.display="none";
        document.getElementById("pw12").style.display="inline";
      document.getElementById("pw12").innerHTML ="<img src='../jz8_images/good2.gif'>&nbsp;<font color='#4DA531'>填写正确</font>";
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
           document.getElementById("email2").innerHTML ="<img src='../jz8_images/good2.gif'>&nbsp;<font color='#4DA531'>填写正确</font>";
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
          document.getElementById("yzcode2").innerHTML ="验证码不能为空！";
          return false;
      }
     var patrn=/^[0-9]{1,4}$/;
      if (!patrn.exec(obj.value)) {
           document.getElementById("yzcode2").style.display="inline";
           document.getElementById("yzcode2").innerHTML ="验证码错误(请输入前面验证码)。";
          return false
      }
      document.getElementById("yzcode2").style.display="none";
        return true
  }

  //验证
  function allfbCheck(form)
  {
  

            if (!form.kind[0].checked&&!form.kind[1].checked)
      {
          alert("请选择工作类别");
          form.kind[0].focus();
          return (false);
      }
      if (!form.ct_class[0].checked&&!form.ct_class[1].checked)
      {
          alert("请选择工作性质");
          form.ct_class[0].focus();
          return (false);
      }
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


      if(getLength5(form.contact.value)>200)
      {
      alert("联系方式字符数不能超过200，请修改后重试！")
      return false;
      }
        if(countInstances(form.contact.value)>0){
    alert("信息监控系统提醒您：很抱歉，由于您提交的内容中含有系统不允许的关键词或者您的IP受到了访问限制，本次操作无效，系统已记录您的IP及您提交的所有数据。请注意，不要提交任何违反国家规定的内容！");
    form.contact.focus();
      return (false);
    }
      if(form.kind[0].checked){
     if (form.rtype11.value==""&&form.rtype21.value==""&&form.rtype31.value==""&&form.rtype41.value=="")
    {

        alert("\n请至少选择一个工作意向！");
        form.rtype11.focus();
        return (false);
    }



	 //验证所在地点
  if (form.qzpro.value=="")
    {
        alert("请选择工作地区！");
        form.qzpro.focus();
        return (false);
    }

    var salary=form.salary.value.Trim();
     form.salary.value=salary;
     if(form.salary.value==""){
   	 alert("\n请填写期望薪水！");
        form.slary.focus();
        return (false);
   	}

    //验证标题
     var title=form.title.value.Trim();
     form.title.value=title;
    if (form.title.value=="")
    {
        alert("求职标题不能为空！");
        form.title.value="";
        form.title.focus();
        return (false);
    }
       if (strangecode2(form.title.value)==false)
    {
        alert("\n标题不能含有特殊字符 < >");
        form.title.focus();
        return (false);
    }
        if(countInstances(form.title.value)>0){
    alert("信息监控系统提醒您：很抱歉，由于您提交的内容中含有系统不允许的关键词或者您的IP受到了访问限制，本次操作无效，系统已记录您的IP及您提交的所有数据。请注意，不要提交任何违反国家规定的内容！");
    form.title.focus();
      return (false);
    }
    //验证详细信息
     var content=form.content.value.Trim();
     form.content.value=content;
    if (form.content.value=="")
    {
        alert("兼职内容及个人简介不能为空！");
        form.content.value="";
        form.content.focus();
        return (false);
    }
    if (strangecode2(form.content.value)==false)
    {
        alert("\n兼职内容及个人简介不能含有特殊字符 < >");
        form.content.focus();
        return (false);
    }
    if (getLength5(form.content.value) < 10  || getLength5(form.content.value) > 500)
    {
        alert("兼职内容及个人简介大于十个字符,小于等于500字符！");
        form.content.focus();
        return (false);
    }
        if(countInstances(form.content.value)>0){
    alert("信息监控系统提醒您：很抱歉，由于您提交的内容中含有系统不允许的关键词或者您的IP受到了访问限制，本次操作无效，系统已记录您的IP及您提交的所有数据。请注意，不要提交任何违反国家规定的内容！");
    form.content.focus();
      return (false);
    }
     }
      else{
     if(form.unitType[0].checked==false && form.unitType[1].checked==false&& form.unitType[2].checked==false){
   	 alert("\n请选择招聘性质！");
        form.kind[0].focus();
        return (false);
   	}


    if (form.rtype1.value=="")
    {
        alert("\n请选择职位类别！");
        form.rtype1.focus();
        return (false);
    }

	 //验证所在地点
  if (form.zpcity.value=="")
    {
        alert("请选择工作地区！");
        form.zppro.focus();
        return (false);
    }

  if (form.digree.value=="")
    {
        alert("请选择学历要求！");
        form.digree.focus();
        return (false);
    }

  if (form.sex.value=="")
    {
        alert("请选择性别要求！");
        form.sex.focus();
        return (false);
    }

    var salary=form.salary.value.Trim();
     form.salary.value=salary;
     if(form.salary.value==""){
   	 alert("\n请填写薪资待遇！");
        form.slary.focus();
        return (false);
   	}
   if (strangecode2(form.salary.value)==false)
    {
        alert("\n薪资待遇中不能含有特殊字符 < >");
        form.salary.focus();
        return (false);
    }

    if (getLength5(form.salary.value) >15  )
    {
        alert("薪资待遇小于等于15字符！");
        form.salary.focus();
              return (false);
    }


     if (form.jobnum.value=="")
    {
        alert("请填写招聘人数！");
        form.selSex.focus();
        return (false);
    }

    //验证标题

     Trim_char(form.title);

    if (form.title.value=="")
    {
        alert("职位名称不能为空！");
        form.title.value="";
        form.title.focus();
        return (false);
    }
       if (strangecode2(form.title.value)==false)
    {
        alert("\n职位名称含有特殊字符 < >");
        form.title.focus();
        return (false);
    }
    if(countInstances(form.title.value)>0){
    alert("信息监控系统提醒您：很抱歉，由于您提交的内容中含有系统不允许的关键词或者您的IP受到了访问限制，本次操作无效，系统已记录您的IP及您提交的所有数据。请注意，不要提交任何违反国家规定的内容！");
    form.title.focus();
      return (false);
    }
    //验证详细信息
     var content=form.content.value.Trim();
     form.content.value=content;
    if (form.content.value=="")
    {
        alert("职位具体要求不能为空！");
        form.content.value="";
        form.content.focus();
        return (false);
    }
    if (strangecode2(form.content.value)==false)
    {
        alert("\n职位具体要求不能含有特殊字符 < >");
        form.content.focus();
        return (false);
    }
    if (getLength5(form.content.value) < 10  || getLength5(form.content.value) > 500)
    {
        alert("职位具体要求大于十个字符,小于等于500字符！");
        form.content.focus();
        return (false);
    }
    if(countInstances(form.content.value)>0){
    alert("信息监控系统提醒您：很抱歉，由于您提交的内容中含有系统不允许的关键词或者您的IP受到了访问限制，本次操作无效，系统已记录您的IP及您提交的所有数据。请注意，不要提交任何违反国家规定的内容！");
    form.content.focus();
      return (false);
    }

      }

  // alert(getLength5(form.content.value));

  if (form.contact.value.length ==31)
    {
        alert("请填写您的联系方式！");
        form.contact.focus();
        return (false);
    }
      if (form.contact.value.length <5)
    {
        alert("请填写您的联系方式！");
        form.contact.focus();
        return (false);
    }
    if (strangecode2(form.contact.value)==false)
    {
        alert("\n联系方式不能含有特殊字符 < >");
        form.contact.focus();
        return (false);
    }
    if(getLength5(form.contact.value)>100)
    {
    alert("联系方式字符数不能超过100，请修改后重试！")
    return false;
    }

    if(countInstances(form.contact.value)>0){
    alert("信息监控系统提醒您：很抱歉，由于您提交的内容中含有系统不允许的关键词或者您的IP受到了访问限制，本次操作无效，系统已记录您的IP及您提交的所有数据。请注意，不要提交任何违反国家规定的内容！");
    form.contact.focus();
      return (false);
    }
        if (form.limitdate.value=="")
    {
        alert("职位信息有效期不能为空！");
        form.limitdate.focus();
        return (false);
    }
      //验证验证码
      if (form.yzcode.value=="")
      {
          alert("请填写验证码！");
          form.yzcode.focus();
          return (false);
      }

 // alert(getLength5(form.content.value)+"  "+getLength5(form.contact.value));

     form.submit2.value="提交中...";
      form.submit2.disabled = true;
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


//用户招聘发布
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
// 求职发布
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


// 设置类型
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




//返回页面时,自动加载类型设置
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
