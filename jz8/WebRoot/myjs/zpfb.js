 function setCity(oj2,cc,v){
	var m=-1;
	for (i=1;i<=35;i++){
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

  function textCounter1(maxChars)
{     var vlen=Math.floor(getLength5(document.all.contact.value));
	document.all.InputCount1.innerHTML = maxChars -vlen ;
}

function setPro(oj2,cc){
  if(cc.length>0&&cc!='null')
  oj2.options[cc].selected=true;
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

  function  getLength(stringIn)
{
var   strLength=0;
strLength=stringIn.length;
return   strLength;
}

  function textCounter(maxChars)
{     var vlen=Math.floor(getLength5(document.all.content.value));
	document.all.InputCount.innerHTML = maxChars -vlen ;
}
  function textCounter2(maxChars)
{     var vlen=Math.floor(getLength5(document.all.contact.value));
	document.all.InputCount2.innerHTML = maxChars -vlen ;
}

// ���õ���������������������
function clear2(o){
l=o.length;

for (i = 0; i< l; i++){
	o.options[0]=null;
}
}


function set_fb_pro(oj,k){
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

function set_fb_city2(obj){
  if(!obj){
        document.getElementById("city").style.display="none";
         document.getElementById("fb_city2").style.display="inline";
    	 document.getElementById("fb_city2").innerHTML ="��ѡ������ʡ�У�";
         return false;
         }
      else {
        document.getElementById("city").style.display="inline";
         document.getElementById("fb_city2").style.display="inline";
    	 document.getElementById("fb_city2").innerHTML ="��ѡ����ϸ������";
         return false;
        }
        return true;
  }


function set_jobnum_tr(obj){
   if (obj.value=="0"){
    document.getElementById("jobNum_tr").style.display="inline";
   }
   else {
   document.getElementById("jobNum_tr").style.display="none";
   }
  }


  function clear_zhushi2(k,obj1,obj2){
        if(obj1.value!=""){
//         obj2.style.display="none";
             obj2.innerHTML ="";
         }
         else{
//         obj2.style.display="inline";
         obj2.innerHTML ="��ѡ����ϸ������";
           }
//         var jj=k.options[k.selectedIndex].text;
//        jj=jj+"  >  "+obj1.options[obj1.selectedIndex].text;
//       document.getElementById("diqu").innerHTML=jj;
  }
//-------------------------------------------

//�������ͣ�������������������
  function clear_zhushi(k,obj1,obj2){
        if(obj1.value!=""){
         obj2.style.display="none";
             obj2.innerHTML ="";
         }
         else{
           obj2.style.display="inline";
             obj2.innerHTML ="��ѡ��������࣡";
           }
//        var jj=k.options[k.selectedIndex].text;
//        jj=jj+"  >  "+obj1.options[obj1.selectedIndex].text;
//       document.getElementById("leimu").innerHTML=jj;
  }

function clear(o){
l=o.length;

for (i = 0; i< l; i++){
	o.options[0]=null;
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
      // oj.add(new Option(sclass[m][i],sclass[m][i]));
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
function zpCheckForm(form){

  //  return true;
   //��֤��Ϣ����
     if (!form.ct_class[0].checked&&!form.ct_class[1].checked)
      {
          alert("��ѡ��������");
          form.ct_class[0].focus();
          return (false);
      }
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
//     if (form.rtype2.value=="")
//    {
//        alert("\n��ѡ��������࣡");
//        form.rtype2.focus();
//        return (false);
//    }

	 //��֤���ڵص�
  if (form.city.value=="")
    {
        alert("��ѡ����������");
        form.province.focus();
        return (false);
    }

  if (form.digree.value=="")
    {
        alert("��ѡ��ѧ��Ҫ��");
        form.digree.focus();
        return (false);
    }

  if (form.selSex.value=="")
    {
        alert("��ѡ���Ա�Ҫ��");
        form.selSex.focus();
        return (false);
    }

   Trim_char(form.salary);
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

    if (getLength(form.salary.value) >15  )
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

        Trim_char(form.content);
    if (form.content.value=="")
    {
        alert("ְλ˵������Ϊ�գ�");
        form.content.value="";
        form.content.focus();
        return (false);
    }
    if (strangecode2(form.content.value)==false)
    {
        alert("\nְλ˵�����ܺ��������ַ� < >");
        form.content.focus();
        return (false);
    }
    if (getLength(form.content.value) < 10  || getLength(form.content.value) > 500)
    {
        alert("ְλ˵������ʮ���ַ�,С�ڵ���500�ַ���");
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
    if (form.limitdate.value=="")
    {
        alert("ְλ��Ϣ��Ч�ڲ���Ϊ�գ�");
        form.limitdate.focus();
        return (false);
    }
     document.all.submit2.value="�ύ��...";
     document.all.submit2.disabled = true;
    return true;
}

