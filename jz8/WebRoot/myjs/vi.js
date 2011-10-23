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

var http_request = false;
function send_request(url) {//初始化、指定处理函数、发送请求的函数
	http_request = false;
	//开始初始化XMLHttpRequest 对象
	if(window.XMLHttpRequest) {            //Mozilla 浏览器
		http_request = new XMLHttpRequest();
		if (http_request.overrideMimeType) { //设置MiME 类别
			http_request.overrideMimeType("text/xml");
		}
	}else if (window.ActiveXObject) {     // IE 浏览器
		try {
			http_request = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				http_request = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {
			}
		}
	}
	if (!http_request) { // 异常，创建对象实例失败
		window.alert("不能创建XMLHttpRequest 对象实例.");
		return false;
	}
	http_request.onreadystatechange = processRequest;
	http_request.open("GET", url, true);// 确定发送请求的方式和URL 以及是否同步执行下段代码
	http_request.send(null);
}


function processRequest_jubao() {							// 处理返回信息的函数
	if (http_request.readyState == 4) { 	// 判断对象状态
		if (http_request.status == 200) {   // 信息已经成功返回，开始处理信息
			var msg=http_request.responseText;
                        //alert(msg);
                         document.getElementById("jbbutt").value="继续提交...";
                          if(msg.indexOf("222")>=0) msg="请选择举报类型！";
                        else if(msg.indexOf("333")>=0) msg="举报内容不能为空！";
                        else if(msg.indexOf("444")>=0){
                        msg="抱歉您举报的留言已超过限制数：20条/天，不可以再举报了。";
                        document.getElementById("butt").disabled=true;
                          }
                        else if(msg.indexOf("555")>=0){
                        msg="您今天举报该信息的次数已超过限制数：2条/天，请不要重复举报。";
                        document.getElementById("butt").disabled=true;
                          }
                        else if(msg.indexOf("666")>=0) {msg="信息举报成功发布！";
                        document.getElementById("jbbutt").value="提交成功！";
                        document.getElementById("jbbutt").disabled=true;
                        document.getElementById("popup").style.visibility="hidden";
                       // document.getElementById("popup").style.visibility="none";
                        alert("信息举报成功！感谢您对兼职吧的支持，我们一定会尽快处理的！");
                        }
                        else if(msg.indexOf("777")>=0) msg="信息举报失败！请刷新后重试！";
			document.getElementById("jbmsg").style.display="inline";
			document.getElementById("jbmsg").innerHTML =msg;

			//form1.check.disabled=false;
		} else { //页面不正常
			alert("请求有异常，请重试！");
		}
	}
}
function send_request_jubao(url) {//初始化、指定处理函数、发送请求的函数
	http_request = false;
	//开始初始化XMLHttpRequest 对象
	if(window.XMLHttpRequest) {            //Mozilla 浏览器
		http_request = new XMLHttpRequest();
		if (http_request.overrideMimeType) { //设置MiME 类别
			http_request.overrideMimeType("text/xml");
		}
	}else if (window.ActiveXObject) {     // IE 浏览器
		try {
			http_request = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				http_request = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {
			}
		}
	}
	if (!http_request) { // 异常，创建对象实例失败
		window.alert("不能创建XMLHttpRequest 对象实例.");
		return false;
	}
	http_request.onreadystatechange = processRequest_jubao;
	http_request.open("GET", url, true);// 确定发送请求的方式和URL 以及是否同步执行下段代码
	http_request.send(null);
}

function jubao(form){
       Trim_char(form.jbcontent);
     if (form.jbcontent.value.length<2)
           {
           document.getElementById("jbmsg").style.display="inline";
           document.getElementById("jbmsg").innerHTML ="请填写举报原因，以便我们更好的处理。";
           form.jbcontent.focus();
           return false;
	}
      else if(form.jbcontent.value.length>200){
      form.jbcontent.value=form.jbcontent.value.substring(0,200);
      }
      var check;
      for(var i=0;i<form.jbcheck.length;i++)
        if (form.jbcheck[i].checked)
          {
          check=form.jbcheck[i].value;
          }
        form.jbbutt.value="提交中...";
        send_request_jubao('/jubao.jsp?jbcontent='+form.jbcontent.value+'&ctno='+form.ctno.value+'&jbckeck='+check);
        }


function processRequest() {							// 处理返回信息的函数
	if (http_request.readyState == 4) { 	// 判断对象状态
		if (http_request.status == 200) {   // 信息已经成功返回，开始处理信息
			var msg=http_request.responseText;
                        //alert(msg);
                         document.getElementById("butt").value="继续提交...";
                        if(msg.indexOf("000")>=0) msg="验证码错误！";  //str1.indexOf(str2);
                        else if(msg.indexOf("111")>=0) msg="姓名不能为空！";
                        else if(msg.indexOf("222")>=0) msg="操作失败！";
                        else if(msg.indexOf("333")>=0) msg="内容不能为空！";
                        else if(msg.indexOf("444")>=0){
                        msg="抱歉您发布的留言已超过限制数：20条/天，不可以再提交留言了。";
                        document.getElementById("butt").disabled=true;
                          }
                        else if(msg.indexOf("555")>=0){
                        msg="您今天给该条信息留言次数已超过限制数：2条/天，请不要重复留言。";
                        document.getElementById("butt").disabled=true;
                          }
                        else if(msg.indexOf("666")>=0) {msg="信息留言成功发布！";
                        document.getElementById("butt").value="提交成功！";
                        document.getElementById("butt").disabled=true;
                        }
                        else if(msg.indexOf("777")>=0) msg="信息留言失败！请刷新后重试！";
			document.getElementById("undiv").style.display="inline";
			document.getElementById("undiv").innerHTML =msg;

			//form1.check.disabled=false;
		} else { //页面不正常
			alert("请求有异常，请重试！");
		}
	}
}


// 加入收藏
function processRequest_favo() {							// 处理返回信息的函数
	if (http_request.readyState == 4) { 	// 判断对象状态
		if (http_request.status == 200) {   // 信息已经成功返回，开始处理信息
			var msg=http_request.responseText;
                        //alert(msg);
                         //document.getElementById("jbbutt").value="继续提交...";
                          if(msg.indexOf("111")>=0) alert("看清楚了，该条信息是你自己的呀，不用收藏吧！");
                         else if(msg.indexOf("222")>=0) alert("请登陆后再收藏该信息！");
                        else if(msg.indexOf("333")>=0) alert("加入收藏出错请重试！");
                        else if(msg.indexOf("444")>=0){
                        alert("抱歉您今天收藏的信息已超过限制数：30条/天，明天再继续吧。");
                          }
                        else if(msg.indexOf("555")>=0){
                        alert("该条信息你已经收藏过了，请查看您的收藏夹。");
                          }
                        else if(msg.indexOf("666")>=0) {
                        alert("成功加入收藏夹！稍后可以进入个人中心：我的收藏夹中查看。");
                        }
                        else if(msg.indexOf("777")>=0) alert("加入收藏出错请重试！");
//			document.getElementById("jbmsg").style.display="inline";
//			document.getElementById("jbmsg").innerHTML =msg;
			//form1.check.disabled=false;
		} else { //页面不正常
			alert("请求有异常，请重试！");
		}
	}
}
function send_request_favo(url) {//初始化、指定处理函数、发送请求的函数
	http_request = false;
	//开始初始化XMLHttpRequest 对象
	if(window.XMLHttpRequest) {            //Mozilla 浏览器
		http_request = new XMLHttpRequest();
		if (http_request.overrideMimeType) { //设置MiME 类别
			http_request.overrideMimeType("text/xml");
		}
	}else if (window.ActiveXObject) {     // IE 浏览器
		try {
			http_request = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				http_request = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {
			}
		}
	}
	if (!http_request) { // 异常，创建对象实例失败
		window.alert("不能创建XMLHttpRequest 对象实例.");
		return false;
	}
	http_request.onreadystatechange = processRequest_favo;
	http_request.open("GET", url, true);// 确定发送请求的方式和URL 以及是否同步执行下段代码
	http_request.send(null);
}

function favo(form){
      var check;
//      if(form.fuser1.value==""||form.fuser1.value=="null")
//      {
//      alert("请登陆后再收藏该条信息！");
//      return false;
//      }
       if(form.fuser1.value==form.fuser2.value){
      alert("^_^ 看清楚了，该条信息是你自己的呀，不用收藏吧！");
      return false;
      }

        send_request_favo('/favorite.jsp?userid2='+form.fuser2.value+'&ctno='+form.ctno.value);
}

//收藏结束

function check_view(form)
{
   Trim_char(form.txtname);
         if (form.txtname.value=="")
           {
       form.txtname.value="游客";
      }
     if(countInstances(form.txtname.value)>0){
      alert("信息监控系统提醒您：很抱歉，由于您提交的内容中含有系统不允许的关键词或者您的IP受到了访问限制，本次操作无效，系统已记录您的IP及您提交的所有数据。请注意，不要提交任何违反国家规定的内容！");
      form.txtname.focus();
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
        form.butt.value="提交中...";
       // document.getElementById("undiv1").innerHTML ="";
      //  document.getElementById("undiv2").innerHTML ="正在检测请稍等...";
        send_request('/tijiaoliuyan.jsp?yzcode='+form.yzcode.value+'&txtname='+form.txtname.value+'&txtcontent='+form.txtcontent.value+'&ctno='+form.ct_no.value);
//        return true;
        }




  function textCounter(maxChars)
{
    var vlen=Math.floor(getLength(document.all.txtcontent.value));
	document.all.InputCount.innerHTML = maxChars -vlen ;
}

// 切换Tab
function jobHide() {

    var div1 = document.getElementById("jobinfo");
    var div2 = document.getElementById("companyinfo");
    var div3=document.getElementById("companyinfo_tab");
    var div4=document.getElementById("jobinfo_tab");
    div1.className = "jobInfo";
    div2.className = "bc-hd";
    div3.className="";
    div4.className="ui-tabs-selected";
}

function jobShow() {

   var div1 = document.getElementById("jobinfo");
    var div2 = document.getElementById("companyinfo");
    var div3=document.getElementById("companyinfo_tab");
    var div4=document.getElementById("jobinfo_tab");

    div1.className = "bc-hd";
    div2.className = "job";
    div3.className="ui-tabs-selected";
    div4.className="";
}

//字符长度
function  getLength(stringIn)
{
        var   strLength=0;
        strLength=stringIn.length;
        return   strLength;
}

//--------------------------------
 var popup_dragging = false;
var popup_target;
var popup_mouseX;
var popup_mouseY;
var popup_mouseposX;
var popup_mouseposY;
var popup_oldfunction;
function popup_display(x)
{
var win = window.open();
for (var i in x) win.document.write(i+' = '+x[i]+'<br>');
}
// ----- popup_mousedown -------------------------------------------------------
function popup_mousedown(e)
{
var ie = navigator.appName == "Microsoft Internet Explorer";
if ( ie && window.event.button != 1) return;
if (!ie && e.button != 0) return;
popup_dragging = true;
popup_target = this['target'];
popup_mouseX = ie ? window.event.clientX : e.clientX;
popup_mouseY = ie ? window.event.clientY : e.clientY;
if (ie)
popup_oldfunction = document.onselectstart;
else popup_oldfunction = document.onmousedown;
if (ie)
document.onselectstart = new Function("return false;");
else document.onmousedown = new Function("return false;");
}
// ----- popup_mousemove -------------------------------------------------------
function popup_mousemove(e)
{
if (!popup_dragging) return;
var ie = navigator.appName == "Microsoft Internet Explorer";
var element = document.getElementById(popup_target);
var mouseX = ie ? window.event.clientX : e.clientX;
var mouseY = ie ? window.event.clientY : e.clientY;
element.style.left = (element.offsetLeft+mouseX-popup_mouseX)+'px';
element.style.top = (element.offsetTop +mouseY-popup_mouseY)+'px';
popup_mouseX = ie ? window.event.clientX : e.clientX;
popup_mouseY = ie ? window.event.clientY : e.clientY;
}
// ----- popup_mouseup ---------------------------------------------------------
function popup_mouseup(e)
{
if (!popup_dragging) return;
popup_dragging = false;
var ie = navigator.appName == "Microsoft Internet Explorer";
var element = document.getElementById(popup_target);
if (ie)
document.onselectstart = popup_oldfunction;
else document.onmousedown = popup_oldfunction;
}
// ----- popup_exit ------------------------------------------------------------
function popup_exit(e)
{
var ie = navigator.appName == "Microsoft Internet Explorer";
var element = document.getElementById(popup_target);
popup_mouseup(e);
element.style.visibility = 'hidden';
element.style.display = 'none';
}
// ----- popup_show ------------------------------------------------------------
function popup_show()
{
element = document.getElementById('popup');
drag_element = document.getElementById('popup_drag');
exit_element = document.getElementById('popup_exit');
element.style.position = "absolute";
element.style.visibility = "visible";
element.style.display = "block";
element.style.left = (document.documentElement.scrollLeft+popup_mouseposX-10)+'px';
element.style.top = (document.documentElement.scrollTop +popup_mouseposY-10)+'px';
drag_element['target'] = 'popup';
drag_element.onmousedown = popup_mousedown;
exit_element.onclick = popup_exit;
}
// ----- popup_mousepos --------------------------------------------------------
function popup_mousepos(e)
{
var ie = navigator.appName == "Microsoft Internet Explorer";
popup_mouseposX = ie ? window.event.clientX : e.clientX;
popup_mouseposY = ie ? window.event.clientY : e.clientY;
}
// ----- Attach Events ---------------------------------------------------------
if (navigator.appName == "Microsoft Internet Explorer")
document.attachEvent('onmousedown', popup_mousepos);
else document.addEventListener('mousedown', popup_mousepos, false);
if (navigator.appName == "Microsoft Internet Explorer")
document.attachEvent('onmousemove', popup_mousemove);
else document.addEventListener('mousemove', popup_mousemove, false);
if (navigator.appName == "Microsoft Internet Explorer")
document.attachEvent('onmouseup', popup_mouseup);
else document.addEventListener('mouseup', popup_mouseup, false);






		var $ = function(o){return document.getElementById(o);}
		window.onload = function(){
			window.onscroll = function(){
				var scrollTop = document.documentElement.scrollTop;
				if(scrollTop){
					$("sl").style.display = 'block';
					$("sl").style.top = (scrollTop + document.documentElement.clientHeight - 80) + "px";
				}else{
					$("sl").style.display = 'none';
				}
			}
		}
