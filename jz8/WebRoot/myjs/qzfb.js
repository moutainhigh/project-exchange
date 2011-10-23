  function textCounter1(maxChars)
{     var vlen=Math.floor(getLength5(document.all.contact.value));
	document.all.InputCount1.innerHTML = maxChars -vlen ;
}


  function  getLength5(stringIn)
{
        var   strLength=0;
        strLength=stringIn.length;
//       for(var   i=0;i<stringIn.length;i++)
//        {
//                if(stringIn.charCodeAt(i)>255)
//                {
//                        strLength+=2;
//                }
//                else
//                {
//                        strLength+=1;
//                }
//
//        }
        return   strLength;
}
  function textCounter(maxChars)
{     var vlen=getLength5(document.all.content.value);
	document.all.InputCount.innerHTML = maxChars -vlen ;
}
  function textCounter2(maxChars)
{     var vlen=getLength5(document.all.contact.value);
	document.all.InputCount2.innerHTML = maxChars -vlen ;
}

// 设置地区－－－－－－－－－
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


//点击选择地区时使用
function set_fb_pro(oj,k){
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
//-------------------------------------------

//在点击类型选择时使用
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
//--------------------------------



//设置类型－－－－－－－－－－
//返回页面时,自动加载地区设置

 function setCity(oj2,cc,v){
	var m=-1;
	for (i=1;i<=34;i++){
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

//------------------------------------------


//返回页面时,自动加载类型设置
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

//---------------------------------------------

//设置标题－－－－－－－－－－－－－
  function clear_zhushi3(obj1,obj2){
    Trim_char(obj1);
        if(obj1.value!=""){
         obj2.style.display="none";
             obj2.innerHTML ="";
         }
         else{
           obj2.style.display="inline";
             obj2.innerHTML ="标题不能为空。";
           }
  }

//设置联系人－－－－－－－－－－－－－
  function clear_zhushi4(obj1,obj2){
    Trim_char(obj1);
        if(obj1.value!=""){
         obj2.style.display="none";
             obj2.innerHTML ="";
         }
         else{
           obj2.style.display="inline";
             obj2.innerHTML ="请填写联系人！";
           }
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
/*用来比较用户选择的分类类型不能选择相同项，无相同则返回true;
*/
function comp_type(r1,r2,r3,r4)
{
 if(r1==r2&&r1!="") return false;
 else if(r1==r3&&r1!="") return false;
 else if(r1==r4&&r1!="") return false;
 else if(r2==r3&&r2!="") return false;
 else if(r3==r4&&r3!="") return false;
 else return true
}

function qzCheckForm(form){
   //验证信息分类
// return true;

     if (!form.ct_class[0].checked&&!form.ct_class[1].checked)
      {
          alert("请选择工作性质");
          form.ct_class[0].focus();
          return (false);
      }
    if (form.rtype11.value==""&&form.rtype21.value==""&&form.rtype31.value==""&&form.rtype41.value=="")
    {

        alert("\n请至少选择一个工作意向！");
        form.rtype11.focus();
        return (false);
    }
   if(!comp_type(form.rtype11.value,form.rtype21.value,form.rtype31.value,form.rtype41.value))
   {
           alert("\n不能选择相同工作意向！");
        form.rtype11.focus();
        return (false);
  }
        Trim_char(form.salary);
     if(form.salary.value==""){
   	 alert("\n请填写期望薪水！");
        form.slary.focus();
        return (false);
   	}


	 //验证所在地点
  if (form.city1.value=="")
    {
        alert("请选择工作地区！");
        form.pro1.focus();
        return (false);
    }



    //验证标题

        Trim_char(form.title);
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

       Trim_char(form.content);
    if (form.content.value=="")
    {
        alert("个人描述不能为空！");
        form.content.value="";
        form.content.focus();
        return (false);
    }
    if (strangecode2(form.content.value)==false)
    {
        alert("\n个人描述不能含有特殊字符 < >");
        form.content.focus();
        return (false);
    }
    if (getLength(form.content.value) < 10  || getLength(form.content.value) > 500)
    {
        alert("个人描述大于十个字符,小于等于500字符！");
        form.content.focus();
        return (false);
    }

      if(countInstances(form.content.value)>0){
    alert("信息监控系统提醒您：很抱歉，由于您提交的内容中含有系统不允许的关键词或者您的IP受到了访问限制，本次操作无效，系统已记录您的IP及您提交的所有数据。请注意，不要提交任何违反国家规定的内容！");
    form.content.focus();
      return (false);
    }
    if (strangecode2(form.contact.value)==false)
    {
        alert("\n联系方式中不能含有特殊字符 < >");
        form.contact.focus();
        return (false);
    }

    if (getLength(form.contact.value) < 5  || getLength(form.contact.value) > 100)
    {
        alert("别忘记填写联系方式了！\n\n字数大于5个字符,小于等于100字符！");
        form.contact.focus();
        return (false);
    }

      if(countInstances(form.contact.value)>0){
    alert("信息监控系统提醒您：很抱歉，由于您提交的内容中含有系统不允许的关键词或者您的IP受到了访问限制，本次操作无效，系统已记录您的IP及您提交的所有数据。请注意，不要提交任何违反国家规定的内容！");
    form.contact.focus();
      return (false);
    }
     document.all.submit2.value="提交中...";
     document.all.submit2.disabled = true;
    return true;
}
