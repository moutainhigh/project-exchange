<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>������ - ��������</title>	
	<link href="/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/css/mian.css" rel="stylesheet" type="text/css" />
	<link href="/css/member.css" rel="stylesheet" type="text/css" />
	<link href="/css/publish.css" rel="stylesheet" type="text/css" />
	<script src="/js/jquery.js" type="text/javascript"></script>
	<script src="/js/member.js" type="text/javascript"></script>
</head>
<body>
	<!-- �������� -->
	<div id="top">
			<div class="top_con">
			<div class="top_l">�Ҽ�ְ������������</div>
			<div class="top_r"><a href="/reg.html">ע��</a> | <a href="/login.html">��¼</a><span><a href="#">�����ƹ�����</a><a href="#">����</a></span></div>
			</div>
	</div>
	<!-- ����������� -->
	<div id="mian">		
		<!-- ͷ������ -->
		<div class="nav">
			<!--LOGo����-->
			<div class="nav_top clearfix">
				<a href="#" class="logo_a"><img src="img/logo.gif"/></a>
				<a href="#" class="index_a">���ͼwidth:695px; height:70px; </a>            
			</div>
			<!--LOGo�������-->
			<!--��������-->
			<div class="nav_member clearfix">
				<ul>
					<li><a href="/">��վ��ҳ</a></li>
					<li><a href="/member!index.do">�ҵ������</a></li>
					<li class="focus"><a href="/member!publish.do">��������</a></li>
					<li><a href="/member/score.html">���ֹ���</a></li>
					<li><a href="/member/finance.html">�������</a></li>
				</ul>
			</div>
			<div class="top_line"></div>
			<!--�����������-->
		</div>
		<!-- ͷ��������� -->
		<!-- �������� -->
		<div class="body_content">
			<div class="left_body">
				<div class="item">
				    <div class="item-title">
					    <ul>
						    <li>���񷢲�ָ��</li>
					    </ul>
					</div>
					<div class="item-repeat">
					    <h3>ѡ������һ������</h3>
					    <p>�ƹ㡢�İ����б���������ѡ��һ</p>
					    <h3>ѡ�������������</h3>
					    <p>�������࣬�����˾����������𣬲�ͬ�������������˲�ͬ��������Ϣ��д��Ŀ</p>
					    <h3>��д������</h3>
					    <p>������ǰ������ÿһ���д����������������ֿ��Ը��õ��˽��������</p>
					</div>
				</div>
			</div>
			<div class="publish_body">
			    <div class="publish_box">
				   <div class="publish_box_content">
					   <h3>����������һ������</h3>
					   <p id="class1">
							<input type="radio" checked="" value="2" onclick="" name="bclass">
							�ƹ�&nbsp;&nbsp;
							<input type="radio" value="3" onclick="" name="bclass">
							�İ�д��&nbsp;&nbsp;
							<input type="radio" value="4" onclick="" name="bclass">
							�б�����
					   </p>
					   <h3>��ѡ���ƹ㷽ʽ</h3>
					   <p id="class2">
					<span><input name="sclass" id="task_sclass_4" onclick="javascript:location='http://www.sandaha.com/luntan/addTask.asp';" value="4" type="radio">��̳����</span>
					<span><input name="sclass" id="task_sclass_23" onclick="javascript:location='http://www.sandaha.com/dingtie/addTask.asp';" value="23" type="radio">��̳����</span>
					<span><input name="sclass" id="task_sclass_24" onclick="javascript:location='http://www.sandaha.com/weibo/addTask.asp';" value="24" type="radio">΢���ƹ�</span>
					<span><input name="sclass" id="task_sclass_6" onclick="javascript:location='http://www.sandaha.com/qq/addTask.asp';" value="6" type="radio">QQȺ�ƹ�</span>
					<span><input name="sclass" id="task_sclass_9" onclick="javascript:location='http://www.sandaha.com/wenda/addTask.asp';" value="9" type="radio">�ʴ��ƹ�</span>
					<span><input name="sclass" id="task_sclass_45" onclick="javascript:location='http://www.sandaha.com/newsTask/newsTask_Add.asp';" value="45" type="radio">���Ÿ巢��</span>
					<span><input name="sclass" id="task_sclass_7" onclick="javascript:location='http://www.sandaha.com/add_mail/Email_Add.asp';" value="7" type="radio">�ʼ�����</span>
					<span><input name="sclass" id="task_sclass_10" onclick="javascript:location='http://www.sandaha.com/b2b/addTask.asp';" value="10" type="radio">B2B��ҵ��Ʒ����</span>
					<span><input name="sclass" id="task_sclass_5" onclick="javascript:location='http://www.sandaha.com/boke/addTask.asp';" value="5" type="radio">�����ƹ�</span>
					<span><input name="sclass" id="task_sclass_30" onclick="javascript:location='http://www.sandaha.com/baidu/addTask.asp';" value="30" type="radio">�ٶ�ƽ̨�ƹ�</span>
					<span><input name="sclass" id="task_sclass_27" onclick="javascript:location='http://www.sandaha.com/fenlei/addTask.asp';" value="27" type="radio">������վ����</span>
					<span><input name="sclass" id="task_sclass_12" onclick="javascript:location='http://www.sandaha.com/task/addTask.asp?bclass=2&amp;sclass=12';" value="12" type="radio">��������</span>
					   </p>
					   <h3>����д�������</h3>
					   <p id="task_title">
							<input type="text" onblur="javascript:hide_tips('title');hide_color('txtTitle');" 
							onfocus="javascript:show_tips('title');show_color('txtTitle');" size="60" id="txtTitle" class="text1" name="txtTitle">
							<br/><span class="orange">��Ҫ��ʲô����25�����Ļ�50��Ӣ�����ڣ���</span>
					   </p>
					   <h3>�ƹ�Ҫ��</h3>
					   <p>
					   	<textarea onblur="javascript:hide_color('txtYaoQiu');" onfocus="javascript:show_color('txtYaoQiu');" size="60" id="txtYaoQiu" class="txtArea4" 
					   	type="text" name="txtYaoQiu"></textarea>
					   </p>
					   <h3>��˱�׼</h3>
					   <p>
					   	<textarea onblur="javascript:hide_tips('biaozhun');hide_color('txtBiaoZhun');" onfocus="javascript:show_tips('biaozhun');show_color('txtBiaoZhun');" size="60" id="txtBiaoZhun" class="txtArea2" type="text" name="txtBiaoZhun" 
					   	style="border-color: rgb(211, 228, 254);"></textarea>
					   	<br/><span class="orange">�������Ҫ�󾡿��ܵ�д����� �Ա������Ǹ���Ч���Ϊ��������</span>
					   </p>
					   <h3>�ϴ�����</h3>
					   <p>
					   	<a class="addfujian" onclick="javascript:add_file();" href="javascript:;">�����Ӹ���</a>
					   	<br/><span class="orange">�����ϴ�5����������������������󲻳���2M��</span>
					   </p>
					   <h3>��ϵ��ʽ</h3>
					   <p>
					   	QQ:<input type="text" onblur="javascript:hide_tips('title');hide_color('txtTitle');" 
							onfocus="javascript:show_tips('title');show_color('txtTitle');" size="20" id="txtTitle" class="text1" name="txtTitle">
						&nbsp;&nbsp;&nbsp;&nbsp;
						�ֻ�����:<input type="text" onblur="javascript:hide_tips('title');hide_color('txtTitle');" 
							onfocus="javascript:show_tips('title');show_color('txtTitle');" size="20" id="txtTitle" class="text1" name="txtTitle">
					   	<br/><span class="orange">����Ҫ�����ڽ����������ѣ�����ʵ��д��</span>
					   </p>
					   <div class="money_info">
					   	<h3>�������Ͷ���Ǯ�أ�</h3>
					   	<p class="ft12">������Խ�ߣ��������ֽ�Խ�࣬�ƹ�������ɵ�����Ҳ��Խ�á�</p>
					   	<p><input type="text" size="20" class="text1" name="txtTitle">Ԫ</p>
					   </div>
			       </div>
			   </div>
			</div>
		</div>
		<!-- ����������� -->
		<!-- �ײ����� -->
		<div class="copyright">
			<ul>
				<li><a href="#">��ϵ����</a> | <a href="#">���ҵ��</a> | <a href="#">��Ϣ�ö�</a> | <a href="#">վ������</a> | <a href="#">���¼�ְ</a> | <a href="#">���¼���</a> | <a href="#">��������</a></li>
				<li>Copyright &copy; 2009-2012 <a href="#">������ (tui5.com)</a> ��Ȩ����</li>
				<li>ICP֤����07038868��</li>
			</ul>
		</div>
		<!-- �ײ�������� -->
	</div>
</body>
</html>