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
		function shenhe(id,s,c){
			$.getJSON("/ajax_checkGaojian.do?gjId="+id+"&status="+s+"&priceClass="+(c?c:""), function(json){				
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
			<#include "/WEB-INF/template/include/task_head.ftl">
			<div class="taskContent">
				<div class="wordContent">
					<div class="title2">
						<ul class="btn">
							<li><a href="/task_${t.id}.html">��������</a></li>
							<li class="focus"><a href="/gaojian_${t.id}.html">��˸��</a></li>
						</ul>
					  	<ul class="bg"></ul>
					  	<#if pageBean.resultList.size()==0><li style="padding:30px 10px;">�����ύ���...</li></#if>
					  	<#list pageBean.resultList as g>
						<div class="txt2">
							<ul class="gaojian">
								<li><span class="gj">�����ţ�</span><span class="bh">${g.id}</span>��</li>
							</ul>
							<ul id="ulLeft_14" class="info">
								<li class="img"><img width="48" width="48" src="/img/member/nopic.jpg"></li>
								<li>${g.user.userId}<br>
								��ǰ���֣�${g.user.userScore}</li>
								<li style="padding:0 0 10px 10px;"><a href="javascript:;"><img border="0" align="absmiddle" src="/img/mail.jpg">����վ����Ϣ</a></li>
							</ul>
							<ul id="ulRight_14" class="content" style="min-height: 151px;">
								<li class="t">
								<#if g.status == 0 && t.publisher.userNo==userObj.userNo>
								<#if t.priceClass==2 || t.priceClass==1>
								<span style="float:right; padding:0 10px 0 0;"><a href="javascript:;" onclick="shenhe(${g.id},1)">���ͨ��</a>&nbsp;&nbsp;
								<a href="javascript:;" onclick="shenhe(${g.id},2)">��˲�ͨ��</a></span>
								</#if>
								<#if t.priceClass==3>
								<span style="float:right; padding:0 10px 0 0;">
								<#if t.people1 gt 0 && t.rate1 gt 0><a href="javascript:;" onclick="shenhe(${g.id},1,1)">���ͨ��һ�Ƚ�</a>&nbsp;&nbsp;</#if>
								<#if t.people2 gt 0 && t.rate2 gt 0><a href="javascript:;" onclick="shenhe(${g.id},1,2)">���ͨ�����Ƚ�</a>&nbsp;&nbsp;</#if>
								<#if t.people3 gt 0 && t.rate3 gt 0><a href="javascript:;" onclick="shenhe(${g.id},1,3)">���ͨ�����Ƚ�</a>&nbsp;&nbsp;</#if>
								<a href="javascript:;" onclick="shenhe(${g.id},2)">��˲�ͨ��</a>
								</span>
								</#if>
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
								<#if g.attachment?exists && g.attachment!=''><img src="/upload/gaojian/${g.attachment}"/></#if>
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