<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset==gbk" />
	<title>������ - ��Ա����</title>	
	<link href="/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/css/mian.css" rel="stylesheet" type="text/css" />
	<link href="/css/member.css" rel="stylesheet" type="text/css" />
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
			<div class="center_body">
			    <div class="m-box-1">
				    <div class="box-1">
					    <ul>
						    <li>�ҵ���Ϣ</li>
						</ul>
					</div>
					<div class="box-2">
					
					    <div class="box-2-content">
						    <ul>
							    <li class="pic"><img width="120" height="120" border="0" src="/img/member/nopic.jpg"></li>
								<li class="l1">
								<p>�û���<span class="redTxt font14">throne212</span></p>
								<p>�ϴε�¼ʱ�䣺${(userObj.userLastdate)?string('yyyy-MM-dd HH:mm:ss')}</p>
								<p>��ǰ�˻���<span class="redTxt font14 fontBold">${userObj.userAccount}Ԫ</span></p>
								<p>��ǰ���֣�<span class="redTxt font14 fontBold">${userObj.userScore}</span></p>
								<p><a target="_blank" title="��Ҫ��ֵ" href="javascript:;"><img border="0" align="absmiddle" src="/img/member/cz_btn.gif"></a></p>
							  </li>
							</ul>
							<ul>
								<li>&#12288;<a title="��Ҫ��������" class="font14 fontBold" style="color:#C30;" href="/member_publish.do"><u>Ҫ�ƹ㣬��Ҫ��������</u></a>&#12288;
								���ѷ���������<span class="redTxt">${taskMount}</span>����
								</li>
								<li>&#12288;<a title="��Ҫ����" class="font14 fontBold" style="color:#C30;" href="/member_myTaskList.do"><u>��Ҫ����</u></a>&#12288;
								�ҽ��壨<span class="redTxt">${gaojianMount}</span>����
								</li>
							</ul>
					    </div>
					</div>
					<div class="box-3"></div>
				</div>
				
				<div style="height:10px;"></div>
				<div class="m-box-1">
				    <div class="box-1">
					    <ul>
						    <li><span><a href="/member_taskList.do">����&gt;&gt;</a></span>�ҵ�����</li>
						</ul>
					</div>
					<div class="box-2">
					    <div class="box-3-content">
						    <ul>
						    <#list myTasks as t>	
							<li><a href="/task_${t.id}.html" target="_blank">[${t.id}]${t.title}</a>&nbsp;&nbsp;��${t.money}&nbsp;&nbsp;${t.publishDate?string('yyyy-MM-dd')}</li>
							</#list>
							</ul>
					    </div>
					</div>
					<div class="box-3"></div>
				</div>
				
				<div style="height:10px;"></div>
				<div class="m-box-1">
				    <div class="box-1">
					    <ul>
						    <li><span><a href="/member_myGaojianList.do">����&gt;&gt;</a></span>�ҵĸ��</li>
						</ul>
					</div>
					<div class="box-2">
					    <div class="box-3-content">
						    <ul>
							<#list myGaojians as g>	
							<li><a href="/gaojian_${g.task.id}.html" target="_blank">${g.task.title}</a>&nbsp;&nbsp;${g.statusTxt}&nbsp;&nbsp;${g.submitDate?string('yyyy-MM-dd')}&nbsp;&nbsp;<a href="/member_submitGaojian.do?task.id=${g.task.id}">����Ͷ��</a></li>
							</#list>
							</ul>
					    </div>
					</div>
					<div class="box-3"></div>
				</div>
			</div>
			<div class="right_body">
 
  				<div class="right-box">
  
		        <div class="right-1">
		          <ul>
		            <li><span><a target="_blank" href="javascript:;">��������&gt;&gt;</a></span>��������</li>
		          </ul>
		        </div>
		        <div class="right-2">
		          <ul>
		            <li><img width="8" height="7" src="/img/member/arrow5.jpg">&nbsp;<a class="a1" href="javascript:;">ʲô�ǹ���</a></li>
		            <li><img width="8" height="7" src="/img/member/arrow5.jpg">&nbsp;<a class="a1" href="javascript:;">������������</a></li>
		            <li><img width="8" height="7" src="/img/member/arrow5.jpg">&nbsp;<a class="a1" href="javascript:;">ΪʲôҪȫ��Ԥ�������ͽ�</a></li>
		            <li><img width="8" height="7" src="/img/member/arrow5.jpg">&nbsp;<a class="a1" href="javascript:;">��β鿴�ѷ��������չ�����</a></li>
		            <li><img width="8" height="7" src="/img/member/arrow5.jpg">&nbsp;<a class="a1" href="javascript:;">�ѷ��������е���������޸�����Ҫ����</a></li>
		            <li><img width="8" height="7" src="/img/member/arrow5.jpg">&nbsp;<a class="a1" href="javascript:;">ѡ��������������</a></li>
		            <li><img width="8" height="7" src="/img/member/arrow5.jpg">&nbsp;<a class="a1" href="javascript:;">��������Ľ������ѡ���бꣿ</a></li>
		            <li><img width="8" height="7" src="/img/member/arrow5.jpg">&nbsp;<a class="a1" href="javascript:;">ʲô�ǳ������񣿳���������ô����</a></li>
		            <li><img width="8" height="7" src="/img/member/arrow5.jpg">&nbsp;<a class="a1" href="javascript:;">����Ӽۣ�������ô�����أ�</a></li>
		          </ul>
		        </div>
    				<div class="right-3"></div>
					<div style="width:254px;padding-top:10px; overflow:hidden;"><a target="_blank" href="http://t.qq.com/sandahanet"><img border="0" alt="��������Ѷ�ٷ�΢������ע���ǣ���ʱ�������¶�̬��" src="/img/member/txweibo.jpg"></a></div>
  					<div style="width:254px;padding-top:10px; overflow:hidden;"><a target="_blank" href="http://weibo.com/sandahanet"><img border="0" alt="���������˹ٷ�΢������ע���ǣ���ʱ�������¶�̬��" src="/img/member/xlweibo.jpg"></a></div>
  				</div>
			</div>
		</div>
		<!-- ����������� -->
		<#include "/WEB-INF/template/include/foot.ftl">
	</div>
</body>
</html>