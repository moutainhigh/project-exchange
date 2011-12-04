<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK" />
    <title>${appTitle}</title>
    <link href="${appPath}/Themes/basic.css" type="text/css" rel="stylesheet" />
    <link href="${appPath}/Register/Themes/layout.css" type="text/css" rel="stylesheet" />
    <script src="${appPath}/js/jquery-1.4.2.min.js"></script>
    <script>
	    function reg() {
			var username = $('#username').val();
			var password = $('#password').val();
			var repassword = $('#repassword').val();
			var nick = $('#nick').val();
			var rand = $('#rand').val();
			var kind = $('#userKind').val();
			if (username == '' || password == '' || rand == '' || nick == '') {
				alert('�������˺š��ǳơ����롢���䣬�Լ���֤��!');
				return;
			}
			if(kind==null || kind == ''){
				alert('��ѡ�������û�����!');
				return;
			}
			if(password != repassword){
				alert('�����������벻һ��!');
				return;
			}
			if($("input:checked").length == 0){
				alert('��ͬ�����Э��!');
				return;
			}
			$('form').submit();
		}
		function formKeyPress(event){
			if(event.keyCode == 13){
				reg();
			}else{
				return false;
			}
		}
    </script>
</head>
<body>
	<jsp:include page="../common/head.jsp"></jsp:include>
    <!---- begin���Ŀ�� ---->
	<div class="wrapper mauto">
	  <div class="section" style="border-width: 3px;">
	    <div class="ptitle">
	      <div class="icon">�û�ע��</div>
	    </div>
	    <div class="regist pad_30">
			<div class="fl w322 hide pad_r10 bsr_gray">
			  <p class="yahei ft18 blue fb bdb_gray mar_t3 pad_b10"> ע���ְ����׬���ģ�����ʲô��</p>
			  <p class="dot1 mar_t10 ft14 fb yellow_ef yahei">��Ҫ����</p>
			  <p class="mar_t3 pad_l10">���͵ĳɱ��������ѡ��</p>
			  <p class="dot1 mar_t10 ft14 fb yellow_ef yahei">��Ҫ׬Ǯ</p>
			  <p class="mar_t3 pad_l10">�������֣��б����������</p>
			  <p class="mar_t20"> <img src="Themes/images/register_ad.jpg" width="320" height="124" /></p>
			</div>
			<form action="${appPath}/reg" method="post">
			<div class="regInfos border_l1">
				<jsp:include page="../msg.jsp"></jsp:include>
				<div class="regblock">
		          <div class="reginfo">
		            <label class="label"><span class="msg">* </span>�û�����:</label>
		            &nbsp;&nbsp;&nbsp;&nbsp;
		            <select name="user.userKind" id="userKind">
		            	<option value="0">��������</option>
		            	<option value="1">�����̼�</option>
		            </select>
		          </div>
		          <div class="form-tip loading">
		            <p>�û����͡�</p>
		          </div>
		        </div>
		        <div class="regblock">
		          <div class="reginfo">
		            <label class="label"><span class="msg">* </span>��¼��:</label>
		            <input class="textbox" type="text" name="user.userId" id="username" value="${param['user.userId'] }"/>
		          </div>
		          <div class="form-tip loading">
		            <p>����ϵͳ��¼��(3-12����:����Ӣ����ĸ�����ֻ��»���)��</p>
		          </div>
		        </div>
		        <div class="regblock">
		          <div class="reginfo">
		            <label class="label"><span class="msg">* </span>�ǳ�:</label>
		            <input class="textbox" type="text" name="user.userName" id="nick" value="${param['user.userName'] }"/>
		          </div>
		          <div class="form-tip loading">
		            <p>�û��ڱ���������</p>
		          </div>
		        </div>
		        <div class="regblock">
		          <div class="reginfo">
		            <label class="label"><span class="msg">* </span>E-mail:</label>
		            <input class="textbox" type="text" name="user.userEmail" id="email" value="${param['user.userEmail'] }"/>
		          </div>
		          <div class="form-tip loading">
		            <p>����ȡ�����룬�������⹫����</p>
		          </div>
		        </div>
		        <div class="regblock">
		          <div class="reginfo">
		            <label class="label"><span class="msg">* </span>����:</label>
		            <input class="textbox" type="password" name="user.userPassword" id="password"/>
		          </div>
		          <div class="form-tip loading">
		            <p>����6���ַ�</p>
		          </div>
		        </div>
		        <div class="regblock">
		          <div class="reginfo">
		            <label class="label"><span class="msg">* </span>ȷ������:</label>
		            <input class="textbox"  type="password" id="repassword"/>
		          </div>
		          <div class="form-tip loading">
		            <p>����6���ַ�</p>
		          </div>
		        </div>
		        <div class="regblock">
		          <div class="reginfo">
		            <label class="label"><span class="msg">* </span>��֤��:</label>
		            <input id="rand" onfocus="$('#yanzheng').show();" style="width:60px;height: 20px;" type="text" name="rand" onkeypress="formKeyPress(event);"/>
		            <img src="${appPath}/rand.servlet" alt="��֤��" id="yanzheng" height="20" style="display:inline;"/>
		          </div>
		        </div>       
		        <div class="regSubmit">
		          <input type="button" class="btnReg" value="ע��" onclick="reg();"/>
		          <br/>
		          <label>
		          <input type="checkbox" checked="checked"/>
		            &nbsp;�����Ķ���ͬ��</label>
		          <span><a href="javascript:void(0);">��ְ����׬���ķ���Э��</a></span> 
		        </div>
		    </div>
			</form>
	      <div class="clear"></div>
	      <br />
	    </div>
	  </div>
	  <div class="clear"></div>
	</div>
	<!-- end���Ŀ�� -->
	   
	<jsp:include page="../common/foot.jsp"></jsp:include>

</body>
</html>
