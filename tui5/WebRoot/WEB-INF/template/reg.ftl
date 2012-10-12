<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
	<title>������ - ע��</title>	
	<link href="css/reset.css" rel="stylesheet" type="text/css" />
	<link href="css/mian.css" rel="stylesheet" type="text/css" />
	<link href="css/register.css" rel="stylesheet" type="text/css" />
	<script src="js/jquery.js" type="text/javascript"></script>
	<script src="js/reg.js" type="text/javascript"></script>
</head>
<body>
	<#include "/WEB-INF/template/include/head.ftl"> 
	<div id="mian">		
		<#include "/WEB-INF/template/include/nav.ftl"> 
		<!-- �������� -->
		<div class="content">
			<h2 class="reg_title">���û�ע��</h2>
			<div class="mc-main">
				<div class="registerdock-wrap">
					<div class="registerdock">
						<div class="registerdock-inner">
							<form id="regForm" method="post" action="${base}/reg.html">
								<input type="hidden" value="add" name="act">
								<input type="hidden" id="dos" value="" name="dos">
								<div class="formcaption">
									ע����ɺ�, ���ʺŽ���Ϊ���ڱ�վ��ͨ���ʺ�, ���������ܱ�վ�ṩ�ĸ��ַ���.
								</div>
								<div class="formgroup registerform">
									<div class="formrow">
										<h3 class="label"><label for="username">�û���</label></h3>
										<div class="form-enter">
											<input type="text" maxlength="16" tabindex="2" value="" id="username" name="username" class="text">
											<span id="err_username">&nbsp;</span>
										</div>
										<div class="form-note">�û�����2��16λ�������ַ���Ӣ����ĸ���������</div>
									</div>
									<div class="formrow">
										<h3 class="label"><label for="password">����</label></h3>
										<div class="form-enter">
											<input type="password" tabindex="3" id="password" value="" name="password" class="text">
											<span id="checkpassword">&nbsp;</span>
										</div>
									</div>
									<div class="formrow">
										<h3 class="label"><label for="confirmpassword">ȷ������</label></h3>
										<div class="form-enter">
											<input type="password" tabindex="4" id="confirmpassword" value="" name="password2" class="text">
											<span id="checkpassword2">&nbsp;</span>
										</div>
									</div>
									<div class="formrow">
										<h3 class="label"><label for="email">Email</label></h3>
										<div style="position:relative;" class="form-enter">
											<input type="text" tabindex="5" value="" id="email" name="email" class="text">
											<span id="err_email">&nbsp;</span>
										</div>
										<div class="form-note">��׼ȷ��д��������. ���������������ʹ���ʼ�֪ͨ����ʱ, �ᷢ���ʼ���������.</div>
									</div>       
									<div class="formrow">
										<h3 class="label"><label for="rand">��֤��</label></h3>
										<div style="position:relative;" class="form-enter">
											<input type="text" tabindex="5" value="" id="rand" name="rand" class="text">
											&nbsp;<img src="/rand.servlet?" alt="��֤��" id="yanzheng"/>
											<span id="err_rand">&nbsp;</span>
										</div>
										<div class="form-note">��׼ȷ��дͼ����֤��.<a href="javascript:void(0)" onclick="document.getElementById('yanzheng').src += Math.random();return false;">�����壬���ˢ����֤��</a></div>
									</div> 
									<div class="formrow formrow-action">
										<span class="btn-wrap"><span class="btn"><input type="button" id="regbtn" tabindex="8" class="button" value="ע�����û�" name="register"></span></span>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div style="padding-left:30px" class="loginlink-wrap">
					<div class="loginlink">
						<div class="loginlink-inner">
							<div class="loginlink-text">
								<h3>�����ʺ�?</h3>
							</div>
							<div class="login-link">
								<a title="��Ա��¼" style="color:#FFF" class="button" href="/login.html">��¼�ʺ�</a>
							</div>
						</div>
						<div class="loginlink-text">
							<h3>ʹ�ú�����վ��¼</h3>
							<ul>
							  <li><a title="��֧�����˺ŵ�¼" href="#"><img alt="��֧�����˺ŵ�¼" src="img/alipay_fl_m.png"></a></li>
							  <li><a id="logqq" title="����ѶQQ�˺ŵ�¼" href="javascript:void(0);"><img alt="����ѶQQ�˺ŵ�¼" src="img/Connect_logo_3.png"></a></li>
							  <li><a id="logsina" title="������΢�����˺ŵ�¼" href="javascript:void(0);"><img alt="������΢�����˺ŵ�¼" src="img/240.png"></a></li>
							  <div class="clear"></div>
							</ul>
						</div>
						<div style="clear:both"></div>
						<div class="loginlink-desp">
							<ul style="margin-top: 0px;">
							<li><b>��Ϊ������</b><br>&#12288;&#12288;ʡǮʡ���������������Ŀ(����)�������������Ϊ������ ���뵣��û�������������Ŀ(����) ��վ������ࡢ�߻��ࡢ����ҵרҵ�˲š������ڻ�Ծ����վ�ϡ�</li><li><b>��Ϊ���ͣ�</b><br>&#12288;&#12288;���ڼ��Ｔ��׬ȡ��Ŀ���ͽ𣬴���������Ŀ������ɡ� ���뵣�ĳ������⣬��վԤ��ȫ��Ӷ����Ŀ��ɼ�ʱ���š���վ���������ΰ�Ȩ�����������ĺ�����ԭ����Ʒ�б��ϣ� </li></ul>
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<!-- ����������� -->
		<#include "/WEB-INF/template/include/foot.ftl"> 
	</div>
</body>
</html>