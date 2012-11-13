<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
	<title>������ - ${t.title}</title>	
	<link href="/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/css/mian.css" rel="stylesheet" type="text/css" />
	<link href="/css/task.css" rel="stylesheet" type="text/css" />
	<script src="/js/jquery.js" type="text/javascript"></script>
	<script type="text/javascript">
		function timeToString(leftTime){
			if(leftTime < 0)
				return '';
			var m = leftTime / 1000;
			var sb = '';
			//��
			if(m / 60 / 60 / 24 > 0){
				sb += parseInt(m / 60 / 60 / 24) + "��";
			}
			m = m % (60 * 60 * 24);
			//ʱ
			if(m / 60 / 60 > 0){
				sb += parseInt(m / 60 / 60) + "ʱ";
			}
			m = m % (60 * 60);
			//��
			if(m / 60 > 0){
				sb += parseInt(m / 60) + "��";
			}
			m = m % 60;
			//��
			sb += parseInt(m)+ "��";
			return sb;
		}
	</script>
</head>
<body>
	<#include "/WEB-INF/template/include/head.ftl">
	<div id="mian">		
		<#include "/WEB-INF/template/include/nav.ftl">
		<!-- �������� -->
		<div class="zj_con clearfix">
			<div class="task_info clearfix">
				<div class="taskTxt clearfix">
					<div class="left-l">
						<ul>
							<li>������⣺<h2>${t.title}</h2></li>
							<li>�����ţ�[${t.id}]</li>
							<li>���ͽ�<span class="red fontBold font_14">��${t.money} Ԫ</span></li>
							<li>�������ࣺ<span class="gray">${t.type.parent.name} -&gt; ${t.type.name}</span></li>
							<li>�б�ģʽ��<span class="orange">�Ƽ�����ģʽ</span></li>
							
							<li>�б����ã�<span class="gray">���񷢲�����Ҫ <span class="orange">${t.gaojianMount}</span> �������ÿ��<span class="orange">${t.gaojianPrice}</span>Ԫ<br>&#12288;&#12288;&#12288;&#12288;&#12288;��ѡ��<span class="orange">${gjSucc}</span>���ϸ�<span class="orange">${gjFail}</span>�����ϸ�<span class="orange">${gjAll-gjSucc-gjFail}</span>��δ���<br>&#12288;&#12288;&#12288;&#12288;&#12288;Ŀǰ����Ҫ<span class="orange">${t.gaojianMount-gjSucc}</span>�����</span></li>
							<li>��ǰ״̬��<span class="green"><span class="green">${t.statusTxt}</span></span> ( <span class="orange">${gjUser}</span>�˲��� <span class="orange">${gjAll}</span>����� )</li>
						</ul>
					</div>
					<div class="left-r">
						<ul class="status">
							<li><span class="pic1">&#12288;</span>����${t.statusTxt}</li>
						</ul>
						<div style="clear:both;"></div>
						<ul>
							<li>��ʼʱ�䣺${t.startDate?string('yyyy-MM-dd HH:mm:dd')}</li>
							<li>����ʱ�䣺${(t.endDate?string('yyyy-MM-dd HH:mm:dd'))?default('')}</li>
							<li>ʣ��ʱ�䣺<span id="ResidualTime"><font color="green">&nbsp;</font></span>
							<script type="text/javascript">
								var endTime = '${(t.endDate.time)?default('')}';
								$(function(){
									if(endTime != ''){
										setInterval(function(){
											$('#ResidualTime font').html(timeToString(parseInt(endTime) - new Date().getTime()));
										},1000);
									}
								});
							</script> 
							</li>
						</ul>
						<#if t.status == 10>
						<ul>
							<li class="li-2"><a target="_blank" class="a4" href="/member_submitGaojian.do?task.id=${t.id}">��ҪͶ��</a></li>
						</ul>
						</#if>
					</div>
					<div class="left-b">
						<div style="color:#F60;">�𾴵����֣����������������˹�����Ҫ����������������������Ż���ϸ�<br>�𾴵Ĺ������������桢��ʱ��������ָ�����ɵĸ�������Ǳ�֤���ƹ�Ч������Ҫһ����</div>
						<ul class="pic"></ul>
						<ul>
							<li><span class="green fontBold">��������������</span><span class="gray">���������յ�����Ŀ�����ߵ����ͽ���ȷ������Ŀ���ͽ��<span class="orange">80%</span>�����б��ߣ�</span></li>
							<li><span class="green fontBold">��Ȩ������</span><span class="gray">���������ͻ�ѡ�У�������ͽ�֧���󣬸���Ʒ��ȫ��֪ʶ��Ȩ�Զ�ת�Ƹ��ͻ������û�б�ѡ�У������д���</span></li>
						</ul>
					</div>
				</div>
				<div class="member">
					<div class="EmployersTitle">
						<ul>
							<li>������Ϣ</li>
						</ul>
					</div>
					<div class="EmployersInfo">
						<ul>
							<li>�û���${t.publisher.userId}</li>
							<li>����ʱ�䣺${t.publisher.userRegdate?string('yyyy��MM��dd��')}</li>
							<li><a href="javascript:;"><img width="81" height="22" border="0" align="absmiddle" src="/img/msg.jpg"></a></li>
						</ul>
				  </div>
				</div>
			</div>
			<div class="taskContent">
				<div class="taskContent-left">
					<div class="title">
						<ul class="btn">
							<li class="focus"><a href="/task_${t.id}.html">��������</a></li>
							<li><a href="gaojian_${t.id}.html">�鿴���</a></li>
						</ul>
						<ul class="bg"></ul>
						<div class="txt">
							<ul>
								
								<li class="mtitle">�ƹ�Ҫ��</li>
								<li>
								${t.content}
								</li>
								<li class="mtitle">��˱�׼</li>
								<li>
								${t.shenhe}
								</li>
								<li class="fujian">��������</li>
								<li>
									<div class="fujian_list">
										<ul>
											<#if t.attachment1?exists>
											<li class="fields"><a target="_blank" href="/upload/task/${t.attachment1}">${t.attachment1}</a></li>
											</#if>
											<#if t.attachment2?exists>
											<li class="fields"><a target="_blank" href="/upload/task/${t.attachment2}">${t.attachment2}</a></li>
											</#if>
											<#if t.attachment3?exists>
											<li class="fields"><a target="_blank" href="/upload/task/${t.attachment3}">${t.attachment3}</a></li>
											</#if>
											<#if t.attachment4?exists>
											<li class="fields"><a target="_blank" href="/upload/task/${t.attachment4}">${t.attachment4}</a></li>
											</#if>
											<#if t.attachment5?exists>
											<li class="fields"><a target="_blank" href="/upload/task/${t.attachment5}">${t.attachment5}</a></li>
											</#if>
										</ul>
									</div>
								</li>
							</ul>
					  </div>
					</div>
					
				</div>
				<div class="taskContent-right">
					<div class="right-1 top">
						<ul>
							<li>�����ܸ���Ȥ������</li>
						</ul>
					</div>
					<div class="right-2">
						<div class="right-2-box">
							<ul>
								<#list relateTasks as t>
								<li style="height:20px;"><span class="orange">��${t.money}Ԫ</span> <a rel="nofollow" title="${t.title}" href="/task_${t.id}.html">${t.title}</a></li>
								</#list>
							</ul>
					  </div>
					</div>
					<div class="right-3"></div>
				</div>
			</div>
		</div>
		<!-- ����������� -->
		<#include "/WEB-INF/template/include/foot.ftl">
	</div>
</body>
</html>