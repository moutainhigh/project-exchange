
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
  

 function isblankStr2(input)
{   var str = " ";
    var temp;
    var j=0;
    for (var i = 0; i < input.length; i++ )
    {
        temp = input.substring(i,i+1);
        if(str==temp)
        {
            j++;
        }
    }
    if (j>0)return(true);
    else return (false);
}


  	function noInput()
		{
                  var form=document.loginform;
                if (form.username.value=="")
                {
                          window.alert('�û�������Ϊ��');
                          form.username.focus();
                          return false;
                  }

                else if(form.password.value=="")
			           {
                          window.alert('���벻��Ϊ��');
                          form.password.focus();
                          return false;
                          }
              else if(form.yzcode.value=="")
              {
			                    window.alert('��֤���в���Ϊ��');
                          form.yzcode.focus();
                          return false;
                }
              else if (form.yzcode.value.length <4 )
               {
			                 window.alert('��֤��λ�����ԣ���������д��');
                          form.yzcode.focus();
                          return false;
                }
                   form.submitLogin.value="��¼��...";
                   form.submitLogin.disabled = true;
			             return true;
		}


function onlyNum()
{
  var keys=event.keyCode;
  if (!((keys>=48&&keys<=57)||(keys>=96&&keys<=105)
  ||(keys==8)||(keys==46)||(keys==37)||(keys==39)||(keys==13)||(keys==229)||(keys==189)||(keys==109)
  ))
  event.returnValue=false;
  }


function gourl(url){
window.location.href=url;
}

function UpdateCheckCode(Img)
{
	var timenow = new Date().getTime();
	url="/code/yz_image.jsp";
	url = url + "?time=" + timenow;
	Img.src=url;
}
