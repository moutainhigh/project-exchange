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

function set_char(obj)
{
  obj.value="";
  }
function get_char(obj)
{
  if(obj.value=="")

  obj.value="�ο�";

  }

function UpdateCheckCode(Img)
{
	var timenow = new Date().getTime();
	url="/code/yz_image.jsp";
	url = url + "?time=" + timenow;
	Img.src=url;
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


function check_view(form)
{
   Trim_char(form.commentaryTitle);
         if (form.commentaryTitle.value=="")
           {
           window.alert("����д������⣬лл��");
           form.commentaryTitle.focus();
           return false;
      }
     if(countInstances(form.commentaryTitle.value)>0){
      alert("��Ϣ���ϵͳ���������ܱ�Ǹ���������ύ�������к���ϵͳ������Ĺؼ��ʻ�������IP�ܵ��˷������ƣ����β�����Ч��ϵͳ�Ѽ�¼����IP�����ύ���������ݡ���ע�⣬��Ҫ�ύ�κ�Υ�����ҹ涨�����ݣ�");
      form.commentaryTitle.focus();
        return (false);
      }
      Trim_char(form.txtcontent);
	if (form.txtcontent.value=="")
	{
        window.alert("����д�������ݣ�лл��");
		   form.txtcontent.focus();
		   return false;
	}
      if (getLength(form.txtcontent.value) > 100)
       {
        alert("������������ӦС��100�ַ���");
		   form.txtcontent.focus();
		   return false;
       }
     if(countInstances(form.txtcontent.value)>0){
              alert("��Ϣ���ϵͳ���������ܱ�Ǹ���������ύ�������к���ϵͳ������Ĺؼ��ʻ�������IP�ܵ��˷������ƣ����β�����Ч��ϵͳ�Ѽ�¼����IP�����ύ���������ݡ���ע�⣬��Ҫ�ύ�κ�Υ�����ҹ涨�����ݣ�");
              form.txtcontent.focus();
                return (false);
     }
       Trim_char(form.yzcode);
     if (form.yzcode.value.length!=4)
           {
           window.alert("����д��֤�룬лл��");
           //form.yzcode.value="";
           form.yzcode.focus();
           return false;
	}

        return true;
        }

  function textCounter(maxChars)
{
    var vlen=Math.floor(getLength(document.all.txtcontent.value));
	document.all.InputCount.innerHTML = maxChars -vlen ;
}


//�ַ�����
function  getLength(stringIn)
{
        var   strLength=0;
        strLength=stringIn.length;
        return   strLength;
}
