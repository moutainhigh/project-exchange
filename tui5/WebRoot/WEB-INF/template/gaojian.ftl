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
		function shenhe(id,s){
			$.getJSON("/ajax_checkGaojian.do?gjId="+id+"&status="+s, function(json){				
				if(json.msg=="Y"){
					alert('��˳ɹ�');
					self.location.reload();
				}else{
					alert(json.msg);
				}
			});	
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
							
							<li>�б����ã�<span class="gray">���񷢲�����Ҫ <span class="orange">${t.gaojianMount}</span> �������ÿ��<span class="orange">${gaojianPrice}</span>Ԫ<br>&#12288;&#12288;&#12288;&#12288;&#12288;��ѡ��<span class="orange">${gjSucc}</span>���ϸ�<span class="orange">${gjFail}</span>�����ϸ�<span class="orange">${gjAll-gjSucc-gjFail}</span>��δ���<br>&#12288;&#12288;&#12288;&#12288;&#12288;Ŀǰ����Ҫ<span class="orange">${t.gaojianMount-gjSucc}</span>�����</span></li>
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
							<li>�û���${t.publisher.userName}</li>
							<li>����ʱ�䣺${t.publisher.userRegdate?string('yyyy��MM��dd��')}</li>
							<li><a href="javascript:;"><img width="81" height="22" border="0" align="absmiddle" src="/img/msg.jpg"></a></li>
						</ul>
				  </div>
				</div>
			</div>
			<div class="taskContent">
				<div class="wordContent">
					<div class="title2">
						<ul class="btn">
							<li><a href="/task_${t.id}.html">��������</a></li>
							<li class="focus"><a href="/gaojian_${t.id}.html">��˸��</a></li>
						</ul>
						<!--<ul>
								<li class="sbtn"><a href="Works_62718_w.html">δ����(69)</a></li>
								<li class="sbtn"><a href="Works_62718_q.html">δ���ɸ��(0)</a></li>
								<li class="sbtn"><a href="Works_62718_h.html">�ϸ���(0)</a></li>
								<li class="sbtn2"><a href="Works_62718_a.html">���и��(69)</a></li>
						</ul>-->
					  <ul class="bg"></ul>
					  	<#list pageBean.resultList as g>
						<div class="txt2">
							<ul class="gaojian">
								<li><span class="gj">�����ţ�</span><span class="bh">${g.id}</span>��</li>
							</ul>
							<ul id="ulLeft_14" class="info">
								<li class="img"><img width="48" width="48" src="/img/member/nopic.jpg"></li>
								<li>${g.user.userName}<br>
								��ǰ���֣�${g.user.userScore}</li>
								<li style="padding:0 0 10px 10px;"><a href="javascript:;"><img border="0" align="absmiddle" src="/img/mail.jpg">����վ����Ϣ</a></li>
							</ul>
							<ul id="ulRight_14" class="content" style="min-height: 151px;">
								<li class="t">
								<#if g.status == 0>
								<span style="float:right; padding:0 10px 0 0;"><a href="javascript:;" onclick="shenhe(${g.id},1)">���ͨ��</a>&nbsp;&nbsp;
								<a href="javascript:;" onclick="shenhe(${g.id},2)">��˲�ͨ��</a></span>
								</#if>
								<img width="16" height="16" align="absmiddle" src="/img/time.gif">&nbsp;ʱ��:${g.submitDate?string('yyyy-MM-dd HH:mm:ss')}&#12288;&#12288;<img width="35" height="19" border="0" align="absmiddle" style="display:none;" id="beixuanIMG_5824459" src="/img/beixuan.jpg"></li>
								<#if g.status==1>
								<span style="background-image:url(/img/hege.gif); background-repeat:no-repeat;" class="draftState"></span>
								</#if>
								<#if g.status==2>
								<span style="background-image:url(/img/buhege.gif); background-repeat:no-repeat;" class="draftState"></span>
								</#if>
								<#if (userObj==null && g.hide==1) || (userObj!=null && g.task.publisher.id!=userObj.id && g.hide==1)>
								<li id="con_14" class="c"><span style="font-size:15px; color:#305B8F;">�˸������Ϊ���ظ����ֻ���ɹ����͸�����߿ɼ����б���Զ�������</span></li>
								<#else>
								<li id="con_14" class="c">
								${g.content}
								<#if g.attachment?exists><img src="/upload/gaojian/${g.attachment}"/></#if>
								</li>
								</#if>
							</ul>
						</div>
					    </#list>
					   <div style="text-align:center;">
							 ���м�¼��<font color="#FF3300">${pageBean.totalRow}</font>&nbsp;��&nbsp;��ǰ��<font color="#FF3300">${pageBean.pageIndex}</font>/${pageBean.maxPage}&nbsp;ҳ
						    <#if pageBean.isFirstPage>
						    <font color="#999999">&nbsp;��ҳ&nbsp;&nbsp;��һҳ&nbsp;</font>
						    </#if>
						    <#if pageBean.pageIndex gt 1>
						    <a href="/gaojian_${g.task.id}.html?pageIndex=1">��ҳ</a>&nbsp;
						    <a href="/gaojian_${g.task.id}.html?pageIndex=${pageBean.pageIndex-1}">��һҳ</a>&nbsp;
						    </#if>
						    <#if !pageBean.isLastPage>
						    <a href="/gaojian_${g.task.id}.html?pageIndex=${pageBean.pageIndex+1}">��һҳ</a>&nbsp;
						    <a href="/gaojian_${g.task.id}.html?pageIndex=${pageBean.maxPage}">βҳ</a>&nbsp;
						    </#if>
						    <#if pageBean.isLastPage>
						    <font color="#999999">&nbsp;��һҳ&nbsp;&nbsp;βҳ&nbsp;</font>
						    </#if>
					   </div>
					</div>
			  </div>
			</div>
		</div>
		<!-- ����������� -->
		<#include "/WEB-INF/template/include/foot.ftl">
	</div>
</body>
</html>