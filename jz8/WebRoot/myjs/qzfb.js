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

// ���õ���������������������
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


//���ѡ�����ʱʹ��
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

//�ڵ������ѡ��ʱʹ��
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



//�������ͣ�������������������
//����ҳ��ʱ,�Զ����ص�������

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


//����ҳ��ʱ,�Զ�������������
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

//���ñ��⣭������������������������
  function clear_zhushi3(obj1,obj2){
    Trim_char(obj1);
        if(obj1.value!=""){
         obj2.style.display="none";
             obj2.innerHTML ="";
         }
         else{
           obj2.style.display="inline";
             obj2.innerHTML ="���ⲻ��Ϊ�ա�";
           }
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
/*�����Ƚ��û�ѡ��ķ������Ͳ���ѡ����ͬ�����ͬ�򷵻�true;
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
   //��֤��Ϣ����
// return true;

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
   if(!comp_type(form.rtype11.value,form.rtype21.value,form.rtype31.value,form.rtype41.value))
   {
           alert("\n����ѡ����ͬ��������");
        form.rtype11.focus();
        return (false);
  }
        Trim_char(form.salary);
     if(form.salary.value==""){
   	 alert("\n����д����нˮ��");
        form.slary.focus();
        return (false);
   	}


	 //��֤���ڵص�
  if (form.city1.value=="")
    {
        alert("��ѡ����������");
        form.pro1.focus();
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

       Trim_char(form.content);
    if (form.content.value=="")
    {
        alert("������������Ϊ�գ�");
        form.content.value="";
        form.content.focus();
        return (false);
    }
    if (strangecode2(form.content.value)==false)
    {
        alert("\n�����������ܺ��������ַ� < >");
        form.content.focus();
        return (false);
    }
    if (getLength(form.content.value) < 10  || getLength(form.content.value) > 500)
    {
        alert("������������ʮ���ַ�,С�ڵ���500�ַ���");
        form.content.focus();
        return (false);
    }

      if(countInstances(form.content.value)>0){
    alert("��Ϣ���ϵͳ���������ܱ�Ǹ���������ύ�������к���ϵͳ������Ĺؼ��ʻ�������IP�ܵ��˷������ƣ����β�����Ч��ϵͳ�Ѽ�¼����IP�����ύ���������ݡ���ע�⣬��Ҫ�ύ�κ�Υ�����ҹ涨�����ݣ�");
    form.content.focus();
      return (false);
    }
    if (strangecode2(form.contact.value)==false)
    {
        alert("\n��ϵ��ʽ�в��ܺ��������ַ� < >");
        form.contact.focus();
        return (false);
    }

    if (getLength(form.contact.value) < 5  || getLength(form.contact.value) > 100)
    {
        alert("��������д��ϵ��ʽ�ˣ�\n\n��������5���ַ�,С�ڵ���100�ַ���");
        form.contact.focus();
        return (false);
    }

      if(countInstances(form.contact.value)>0){
    alert("��Ϣ���ϵͳ���������ܱ�Ǹ���������ύ�������к���ϵͳ������Ĺؼ��ʻ�������IP�ܵ��˷������ƣ����β�����Ч��ϵͳ�Ѽ�¼����IP�����ύ���������ݡ���ע�⣬��Ҫ�ύ�κ�Υ�����ҹ涨�����ݣ�");
    form.contact.focus();
      return (false);
    }
     document.all.submit2.value="�ύ��...";
     document.all.submit2.disabled = true;
    return true;
}
