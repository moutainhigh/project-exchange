<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset==gbk" />
	<title>������ - ��������</title>	
	<link href="/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/css/mian.css" rel="stylesheet" type="text/css" />
	<link href="/css/member.css" rel="stylesheet" type="text/css" />
	<link href="/css/publish.css" rel="stylesheet" type="text/css" />
	<script src="/js/jquery.js" type="text/javascript"></script>
	<script src="/js/member.js" type="text/javascript"></script>
</head>
<body>
	<#include "/WEB-INF/template/include/head.ftl">
	<div id="mian">		
		<#include "/WEB-INF/template/include/member_nav.ftl">
		<!-- �������� -->
		<div class="body_content">
			<#include "/WEB-INF/template/include/member_left.ftl">
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
					    <p>
					   	����ʱ��:7��
					   	<br/><span class="orange">��ע���������δ�������㹻�ϸ�������������������Σ�ÿ��7�졣</span>
					    </p>
					    <p>
					   	�Ƿ񹫲�:<input type="radio" checked="checked" value="1" id="isGongBu1" name="isGongBu">ֱ�ӿۿ��������
					   	&nbsp;&nbsp;<input type="radio" value="2" id="isGongBu1" name="isGongBu">����֪ͨ
					   	<br/><span class="orange">ѡ��"��ֱ�ӿۿ������"�����������㹻��������£��ɿͷ���Աֱ�Ӳ����������ߣ�����֪ͨ������</span>
					    </p>
					    <p>
					   	�Ƿ�������������:<input type="radio" value="1" id="isGongBu1" name="isGongBu">��
					   	&nbsp;&nbsp;<input type="radio" value="2" checked="checked" id="isGongBu1" name="isGongBu">��
					   	<br/><span class="orange">�������ѣ�������������ץȡ��Ҫ����֧����10Ԫ�����������ݲ��漰���ε��������أ����Բ����Ρ�</span>
					    </p>
					    <p class="ctr">
					   	<input type="checkbox" checked="checked" name="know_xieyi" id="know_xieyi"/><a href="javascript:void(0)" onclick="$('#xieyi').toggle();">�����Ķ����������񷢲���Э����涨</a>
					    </p>
					    <p class="ctr"><input type="submit" class="button" value="�ύ����" name="submit"></p>
			       </div>
			   </div>
			   <div id="xieyi">
			   		<h2>�����������񷢲�Э��</h2>
					<p><font face="Verdana">������һֱ���Ź�������ƽ����������ʵ�����ŵ�ԭ�������ڴ����й���߳��ŵ������ƹ�������ƽ̨����������������ǰ��ϸ�Ķ����񷢲����� </font></p>
					<p><font face="Verdana">1���������ɶ��ۣ�����ȷ������ʱ�䣬���ɷ�������Ҫ������ȷ���б����ֺ��б귽���� </font></p>
					<p><font face="Verdana">2������100%Ԥ�������ͽ������ּ������ĳ���ͳ��š� </font></p>
					<p><font face="Verdana">3�������ͽ����ԭ������һ����������վ��ȡ20%�����ѣ��б����ֻ���ͽ��80%�� </font></p>
					<p><font face="Verdana">4���Ƽ�������δ��ɣ�������Ҫ���������������ⷢ������������ֻ��ȡ�ϸ����ѵķ��á� </font></p>
					<p><font face="Verdana">5���İ��������ն���ѡ������һ����Ʒ�б�,����һ�����ֻ���ͽ� </font></p>
					<p><font face="Verdana">6���İ����������δ������������Ʒ��ϵͳ������2������������������⡣</font></p>
					<p><font face="Verdana">7�������Լ�������֯���κ��˾��������κ���ʽ�μ��Լ�������������һ����������Ϊ����ί��������������վ����ѡ�塣 </font></p>
					<p><font face="Verdana">8����������ʱ�䶼Ϊ7�졣�ƹ������İ�������������30Ԫ�𣬽����Ƿ�300Ԫ�����б�������100Ԫ����ҡ��ƹ�����δ�����Ҫ���ڣ������Ƚ�δ��˵ĸ�������ϣ����ܼ������ڣ���������ʱ��Ҳ��Ϊ7�죬����������⡣</font></p>
					<p><font face="Verdana">9����׬�ࡢע�������񷢲����Ҳ��30Ԫ������𷢣�һ���������۳������ܽ���20%��������ѡ���ÿ�������ƽ�����۲��ܵ���2Ԫ����ҡ� ��������̫�࣬������δ��ˣ�����������ȫȨ��˴���</font></p>
					<p><font face="Verdana">10�������е�����Ӽ۲��õ���30Ԫ����ң�����������⡣</font></p>
					<p><font face="Verdana"><font face="Verdana">11���İ�����������ʱ�䵽�ں󣨰�������ʱ�䣩�����������û����˸������������Ȩ��Ϊѡ�塣</font></font></p>
					<p><font face="Verdana"><font face="Verdana">12����������Խ���Դ�ļ�ҪЮ��������������ȡ�����б��ʸ�ͬʱ��������ӳ���Ӧ��ʱ�����������Ʒ��</font></font></p>
					<p><font face="Verdana"><font face="Verdana">13��<font face="Verdana"><font face="Verdana">�Ƽ�</font>���񷢲�</font>�󣬹����輰ʱ��壬<font face="Verdana">����3��ĸ������������Ȩ��Ϊѡ�塣</font>ϵͳѡ��󲻹������<font face="Verdana">����֪ͨ��</font>ϵͳ���Զ�����2�Ρ�2�����ں�������δ��ɵģ�ϵͳ���Զ���ֹ���񣬲��������������������˻���������һ�ε�����<font face="Verdana">����������ڣ�Ҳ���ټ����������񣬹�������ѡ���˿�ʼ��������⣩�������˿�ʱ�����������������˿�ǰͨ��ʵ����֤��������֤����Ҫ�۳��˿�����20%��������ѣ������������������������£�����������ϵ�ٽ��к�ʵ�����˿��</font></font></font></p>
					<p><font face="Verdana"><font face="Verdana">14�����������֣�Ӧ�ϸ���ÿ������ġ�����Ҫ��������������ִ�С���������������������Ҫ�󡱷�Χ��Ҫ��������Ȩ�ܾ�������Ҳ�����Դ�Ϊ���ɾܾ�ѡ���б귽�����˿ </font></font></p>
					<p><font face="Verdana"><font face="Verdana">15�������������������ʱ�������û���κν��壬��վ��������ڡ� <br>16���������б�󱻾ٱ����ӳ�Ϯ����Ʒ�����������ʵ��������ȡ���б��ʸ����س�Ϯ�ߣ���ֱ�ӷ����˺š� </font></font></p>
					<p><font face="Verdana"><font face="Verdana">17������������Ϊͬ�Ȿ����<br></font></font></p> 
				</div>
			</div>
		</div>
		<!-- ����������� -->
		<#include "/WEB-INF/template/include/foot.ftl">
	</div>
</body>
</html>