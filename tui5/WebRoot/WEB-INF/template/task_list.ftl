<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
	<title>������ - �������</title>	
	<link href="css/reset.css" rel="stylesheet" type="text/css" />
	<link href="css/mian.css" rel="stylesheet" type="text/css" />
	<link href="css/task_list.css" rel="stylesheet" type="text/css" />
	<script src="js/jquery.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function(){
			$('.nav_botttom a:eq(1)').addClass('now_a');
		});
	</script>
</head>
<body>
	<#include "/WEB-INF/template/include/head.ftl">
	<div id="mian">		
		<#include "/WEB-INF/template/include/nav.ftl">
		<!-- �������� -->
		<div class="zw_leibie zw_leibie1">
	    	<h2 class="clearfix">
	        	<span>�������</span>
	        </h2>
	        <h3>�����ƹ�</h3>
	        <p>
	        	<a href="javascript:void(0);">��̳����</a>
	        	<a href="javascript:void(0);">��̳����</a>
	        	<a href="javascript:void(0);">��̳����</a>
	        	<a href="javascript:void(0);">��̳����</a>
	        	<a href="javascript:void(0);">��̳����</a>
	        	<a href="javascript:void(0);">��̳����</a>
	        </p>
	        <h3>�İ�д��</h3>
	        <p>
	        	<a href="javascript:void(0);">����д��</a>
	        	<a href="javascript:void(0);">����д��</a>
	        	<a href="javascript:void(0);">����д��</a>
	        	<a href="javascript:void(0);">����д��</a>
	        </p>
	    </div>
	    
	    <div class="zw_leibie2 zw_leibie_zhiwei">
	    	<h2 class="clearfix">
	        	<span>�����б�</span>
	            <a href="#" class="now_Aaa">��������</a>
	            <a href="#">500Ԫ���ϵ�����</a>
	            <a href="#">500Ԫ���µ�����</a>
	            <a href="#">��������</a>
	            <a href="#">���������</a>
	            <a href="#">��������������</a>
	        </h2>
	        <div class="task_list">
				<ul class="title2">
				  <li class="li1">���ID</li>
				  <li class="li2">�������</li>
				  <li class="li5">���</li>
				  <li class="li4">��Ҫ���</li>
				  <li class="li8">�Ѻϸ���</li>
				  <li class="li3">δ����</li>
				  <li class="li6">����ʱ��</li>
				  <li class="line2"></li>
				</ul>
				<ul class="ul_list" onmouseout="hideTask(61914);this.className='ul_list';" onmouseover="showTask(61914);this.className='ul_over';">
					<li class="li1">61914</li>
				    <li class="li2"><span class="plusTask" style="display: none;" id="plusTask_61914"><a target="_blank" href="http://www.sandaha.com/task/task_plus.asp?TaskID=61914"></a></span><a title="�ٶ�֪��ֻ�ش�����" target="_blank" href="http://www.sandaha.com/task/Detail_61914.html">�ٶ�֪��ֻ�ش�����</a>&#12288;</li>
					<li class="li5">��500</li>
					<li class="li4">500</li>
					<li class="li8">0</li>
					<li class="li8">505</li>
					<li class="li6">6��19Сʱ</li>
				</ul>
				<ul class="ul_list" onmouseout="hideTask(61906);this.className='ul_list';" onmouseover="showTask(61906);this.className='ul_over';">
					<li class="li1">61906</li>
				    <li class="li2"><span class="plusTask" style="display: none;" id="plusTask_61906"><a target="_blank" href="http://www.sandaha.com/task/task_plus.asp?TaskID=61906"></a></span><a title="�ڰٶȣ�����50�ʣ�50���ʴ𶼺��ؼ���" target="_blank" href="http://www.sandaha.com/task/Detail_61906.html">�ڰٶȣ�����50�ʣ�50���ʴ𶼺��ؼ���</a>&#12288;</li>
					<li class="li5">��500</li>
					<li class="li4">200</li>
					<li class="li8">0</li>
					<li class="li8">0</li>
					<li class="li6">4��18Сʱ</li>
				</ul>
			</div>
	        
	    </div>
		<!-- ����������� -->
		<#include "/WEB-INF/template/include/foot.ftl">
	</div>
</body>
</html>