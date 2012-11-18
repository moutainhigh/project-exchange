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
			<#include "/WEB-INF/template/include/task_head_weibo.ftl">
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
								<#if (t.url)?exists><li class="mtitle">Ŀ���ַ</li>
								<li>
								<a target="_blank" href="${t.url}">${t.url}</a>
								</li></#if>
								<li class="mtitle">�ƹ�Ҫ��</li>
								<li>
								${t.content}
								</li>
								<#if (t.shenhe)?exists><li class="mtitle">��˱�׼</li>
								<li>
								${t.shenhe}
								</li></#if>
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