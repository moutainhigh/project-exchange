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

var http_request = false;
function send_request(url) {//��ʼ����ָ������������������ĺ���
	http_request = false;
	//��ʼ��ʼ��XMLHttpRequest ����
	if(window.XMLHttpRequest) {            //Mozilla �����
		http_request = new XMLHttpRequest();
		if (http_request.overrideMimeType) { //����MiME ���
			http_request.overrideMimeType("text/xml");
		}
	}else if (window.ActiveXObject) {     // IE �����
		try {
			http_request = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				http_request = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {
			}
		}
	}
	if (!http_request) { // �쳣����������ʵ��ʧ��
		window.alert("���ܴ���XMLHttpRequest ����ʵ��.");
		return false;
	}
	http_request.onreadystatechange = processRequest;
	http_request.open("GET", url, true);// ȷ����������ķ�ʽ��URL �Լ��Ƿ�ͬ��ִ���¶δ���
	http_request.send(null);
}


function processRequest_jubao() {							// ��������Ϣ�ĺ���
	if (http_request.readyState == 4) { 	// �ж϶���״̬
		if (http_request.status == 200) {   // ��Ϣ�Ѿ��ɹ����أ���ʼ������Ϣ
			var msg=http_request.responseText;
                        //alert(msg);
                         document.getElementById("jbbutt").value="�����ύ...";
                          if(msg.indexOf("222")>=0) msg="��ѡ��ٱ����ͣ�";
                        else if(msg.indexOf("333")>=0) msg="�ٱ����ݲ���Ϊ�գ�";
                        else if(msg.indexOf("444")>=0){
                        msg="��Ǹ���ٱ��������ѳ�����������20��/�죬�������پٱ��ˡ�";
                        document.getElementById("butt").disabled=true;
                          }
                        else if(msg.indexOf("555")>=0){
                        msg="������ٱ�����Ϣ�Ĵ����ѳ�����������2��/�죬�벻Ҫ�ظ��ٱ���";
                        document.getElementById("butt").disabled=true;
                          }
                        else if(msg.indexOf("666")>=0) {msg="��Ϣ�ٱ��ɹ�������";
                        document.getElementById("jbbutt").value="�ύ�ɹ���";
                        document.getElementById("jbbutt").disabled=true;
                        document.getElementById("popup").style.visibility="hidden";
                       // document.getElementById("popup").style.visibility="none";
                        alert("��Ϣ�ٱ��ɹ�����л���Լ�ְ�ɵ�֧�֣�����һ���ᾡ�촦��ģ�");
                        }
                        else if(msg.indexOf("777")>=0) msg="��Ϣ�ٱ�ʧ�ܣ���ˢ�º����ԣ�";
			document.getElementById("jbmsg").style.display="inline";
			document.getElementById("jbmsg").innerHTML =msg;

			//form1.check.disabled=false;
		} else { //ҳ�治����
			alert("�������쳣�������ԣ�");
		}
	}
}
function send_request_jubao(url) {//��ʼ����ָ������������������ĺ���
	http_request = false;
	//��ʼ��ʼ��XMLHttpRequest ����
	if(window.XMLHttpRequest) {            //Mozilla �����
		http_request = new XMLHttpRequest();
		if (http_request.overrideMimeType) { //����MiME ���
			http_request.overrideMimeType("text/xml");
		}
	}else if (window.ActiveXObject) {     // IE �����
		try {
			http_request = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				http_request = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {
			}
		}
	}
	if (!http_request) { // �쳣����������ʵ��ʧ��
		window.alert("���ܴ���XMLHttpRequest ����ʵ��.");
		return false;
	}
	http_request.onreadystatechange = processRequest_jubao;
	http_request.open("GET", url, true);// ȷ����������ķ�ʽ��URL �Լ��Ƿ�ͬ��ִ���¶δ���
	http_request.send(null);
}

function jubao(form){
       Trim_char(form.jbcontent);
     if (form.jbcontent.value.length<2)
           {
           document.getElementById("jbmsg").style.display="inline";
           document.getElementById("jbmsg").innerHTML ="����д�ٱ�ԭ���Ա����Ǹ��õĴ���";
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
        form.jbbutt.value="�ύ��...";
        send_request_jubao('/jubao.jsp?jbcontent='+form.jbcontent.value+'&ctno='+form.ctno.value+'&jbckeck='+check);
        }


function processRequest() {							// ��������Ϣ�ĺ���
	if (http_request.readyState == 4) { 	// �ж϶���״̬
		if (http_request.status == 200) {   // ��Ϣ�Ѿ��ɹ����أ���ʼ������Ϣ
			var msg=http_request.responseText;
                        //alert(msg);
                         document.getElementById("butt").value="�����ύ...";
                        if(msg.indexOf("000")>=0) msg="��֤�����";  //str1.indexOf(str2);
                        else if(msg.indexOf("111")>=0) msg="��������Ϊ�գ�";
                        else if(msg.indexOf("222")>=0) msg="����ʧ�ܣ�";
                        else if(msg.indexOf("333")>=0) msg="���ݲ���Ϊ�գ�";
                        else if(msg.indexOf("444")>=0){
                        msg="��Ǹ�������������ѳ�����������20��/�죬���������ύ�����ˡ�";
                        document.getElementById("butt").disabled=true;
                          }
                        else if(msg.indexOf("555")>=0){
                        msg="�������������Ϣ���Դ����ѳ�����������2��/�죬�벻Ҫ�ظ����ԡ�";
                        document.getElementById("butt").disabled=true;
                          }
                        else if(msg.indexOf("666")>=0) {msg="��Ϣ���Գɹ�������";
                        document.getElementById("butt").value="�ύ�ɹ���";
                        document.getElementById("butt").disabled=true;
                        }
                        else if(msg.indexOf("777")>=0) msg="��Ϣ����ʧ�ܣ���ˢ�º����ԣ�";
			document.getElementById("undiv").style.display="inline";
			document.getElementById("undiv").innerHTML =msg;

			//form1.check.disabled=false;
		} else { //ҳ�治����
			alert("�������쳣�������ԣ�");
		}
	}
}


// �����ղ�
function processRequest_favo() {							// ��������Ϣ�ĺ���
	if (http_request.readyState == 4) { 	// �ж϶���״̬
		if (http_request.status == 200) {   // ��Ϣ�Ѿ��ɹ����أ���ʼ������Ϣ
			var msg=http_request.responseText;
                        //alert(msg);
                         //document.getElementById("jbbutt").value="�����ύ...";
                          if(msg.indexOf("111")>=0) alert("������ˣ�������Ϣ�����Լ���ѽ�������ղذɣ�");
                         else if(msg.indexOf("222")>=0) alert("���½�����ղظ���Ϣ��");
                        else if(msg.indexOf("333")>=0) alert("�����ղس��������ԣ�");
                        else if(msg.indexOf("444")>=0){
                        alert("��Ǹ�������ղص���Ϣ�ѳ�����������30��/�죬�����ټ����ɡ�");
                          }
                        else if(msg.indexOf("555")>=0){
                        alert("������Ϣ���Ѿ��ղع��ˣ���鿴�����ղؼС�");
                          }
                        else if(msg.indexOf("666")>=0) {
                        alert("�ɹ������ղؼУ��Ժ���Խ���������ģ��ҵ��ղؼ��в鿴��");
                        }
                        else if(msg.indexOf("777")>=0) alert("�����ղس��������ԣ�");
//			document.getElementById("jbmsg").style.display="inline";
//			document.getElementById("jbmsg").innerHTML =msg;
			//form1.check.disabled=false;
		} else { //ҳ�治����
			alert("�������쳣�������ԣ�");
		}
	}
}
function send_request_favo(url) {//��ʼ����ָ������������������ĺ���
	http_request = false;
	//��ʼ��ʼ��XMLHttpRequest ����
	if(window.XMLHttpRequest) {            //Mozilla �����
		http_request = new XMLHttpRequest();
		if (http_request.overrideMimeType) { //����MiME ���
			http_request.overrideMimeType("text/xml");
		}
	}else if (window.ActiveXObject) {     // IE �����
		try {
			http_request = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				http_request = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {
			}
		}
	}
	if (!http_request) { // �쳣����������ʵ��ʧ��
		window.alert("���ܴ���XMLHttpRequest ����ʵ��.");
		return false;
	}
	http_request.onreadystatechange = processRequest_favo;
	http_request.open("GET", url, true);// ȷ����������ķ�ʽ��URL �Լ��Ƿ�ͬ��ִ���¶δ���
	http_request.send(null);
}

function favo(form){
      var check;
//      if(form.fuser1.value==""||form.fuser1.value=="null")
//      {
//      alert("���½�����ղظ�����Ϣ��");
//      return false;
//      }
       if(form.fuser1.value==form.fuser2.value){
      alert("^_^ ������ˣ�������Ϣ�����Լ���ѽ�������ղذɣ�");
      return false;
      }

        send_request_favo('/favorite.jsp?userid2='+form.fuser2.value+'&ctno='+form.ctno.value);
}

//�ղؽ���

function check_view(form)
{
   Trim_char(form.txtname);
         if (form.txtname.value=="")
           {
       form.txtname.value="�ο�";
      }
     if(countInstances(form.txtname.value)>0){
      alert("��Ϣ���ϵͳ���������ܱ�Ǹ���������ύ�������к���ϵͳ������Ĺؼ��ʻ�������IP�ܵ��˷������ƣ����β�����Ч��ϵͳ�Ѽ�¼����IP�����ύ���������ݡ���ע�⣬��Ҫ�ύ�κ�Υ�����ҹ涨�����ݣ�");
      form.txtname.focus();
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
        form.butt.value="�ύ��...";
       // document.getElementById("undiv1").innerHTML ="";
      //  document.getElementById("undiv2").innerHTML ="���ڼ�����Ե�...";
        send_request('/tijiaoliuyan.jsp?yzcode='+form.yzcode.value+'&txtname='+form.txtname.value+'&txtcontent='+form.txtcontent.value+'&ctno='+form.ct_no.value);
//        return true;
        }




  function textCounter(maxChars)
{
    var vlen=Math.floor(getLength(document.all.txtcontent.value));
	document.all.InputCount.innerHTML = maxChars -vlen ;
}

// �л�Tab
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

//�ַ�����
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
