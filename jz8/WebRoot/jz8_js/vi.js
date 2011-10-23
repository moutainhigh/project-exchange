function lTrim(str)
{
	if (str.charAt(0) == " ")
	{
	//如果字串左边第一个字符为空格

	str = str.slice(1);//将空格从字串中去掉
	//这一句也可改成 str = str.substring(1, str.length);
	str = lTrim(str); //递归调用
	}
	return str;
}

//去掉字串右边的空格
function rTrim(str)
{
	var iLength;

	iLength = str.length;
	if (str.charAt(iLength - 1) == " ")
	{
		//如果字串右边第一个字符为空格
		str = str.slice(0, iLength - 1);//将空格从字串中去掉
		//这一句也可改成 str = str.substring(0, iLength - 1);
		str = rTrim(str); //递归调用
	}
	return str;
}

//去掉字串两边的空格
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

  obj.value="游客";

  }

function UpdateCheckCode(Img)
{
	var timenow = new Date().getTime();
	url="/code/yz_image.jsp";
	url = url + "?time=" + timenow;
	Img.src=url;
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


function check_view(form)
{
   Trim_char(form.commentaryTitle);
         if (form.commentaryTitle.value=="")
           {
           window.alert("请填写评语标题，谢谢！");
           form.commentaryTitle.focus();
           return false;
      }
     if(countInstances(form.commentaryTitle.value)>0){
      alert("信息监控系统提醒您：很抱歉，由于您提交的内容中含有系统不允许的关键词或者您的IP受到了访问限制，本次操作无效，系统已记录您的IP及您提交的所有数据。请注意，不要提交任何违反国家规定的内容！");
      form.commentaryTitle.focus();
        return (false);
      }
      Trim_char(form.txtcontent);
	if (form.txtcontent.value=="")
	{
        window.alert("请填写评语内容，谢谢！");
		   form.txtcontent.focus();
		   return false;
	}
      if (getLength(form.txtcontent.value) > 100)
       {
        alert("评语内容字数应小于100字符！");
		   form.txtcontent.focus();
		   return false;
       }
     if(countInstances(form.txtcontent.value)>0){
              alert("信息监控系统提醒您：很抱歉，由于您提交的内容中含有系统不允许的关键词或者您的IP受到了访问限制，本次操作无效，系统已记录您的IP及您提交的所有数据。请注意，不要提交任何违反国家规定的内容！");
              form.txtcontent.focus();
                return (false);
     }
       Trim_char(form.yzcode);
     if (form.yzcode.value.length!=4)
           {
           window.alert("请填写验证码，谢谢！");
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


//字符长度
function  getLength(stringIn)
{
        var   strLength=0;
        strLength=stringIn.length;
        return   strLength;
}
