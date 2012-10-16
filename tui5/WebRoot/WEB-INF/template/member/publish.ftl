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
	<script type="text/javascript">
	</script>
	<#include "/WEB-INF/template/member/msg.ftl">
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
			    	<div class="publish_box_title">
				   		<ul><li>��������</li></ul>
				   </div>
				   <div class="publish_box_content">
				   		<form action="/member_publish.do" method="post">
					    <h3>����������һ������</h3>
					    <p class="class1">
							<#list topTypeList as topType>
							<input type="radio" value="${topType.pinyin}" onclick="showChildTypes(this.value);" name="toptypepinyin" <#if toptypepinyin==topType.pinyin>checked="checked"</#if>>${topType.name}&nbsp;&nbsp;
							</#list>
							<script>
								function showChildTypes(typepinyin){
									$('.class2').hide();
									$('.' + typepinyin).show();
								}
								$(function(){
									var ttpinyin = '${toptypepinyin}';
									var tpinyin = '${typepinyin}';
									if(ttpinyin != ''){
										$('.class1 input[value="'+ttpinyin+'"]').attr('checked',true);
										showChildTypes(ttpinyin);
									}else{
										$('.class1 input:eq(0)').attr('checked',true);
										showChildTypes($('.class1 input:eq(0)').val());
									}
									if(tpinyin != ''){
										$('.class2 input[value="'+tpinyin+'"]').attr('checked',true);
									}
								});
							</script>
					    </p>
					    <h3>��ѡ���ƹ㷽ʽ${toptypepinyin}_${typepinyin}</h3>
					    <#list topTypeList as topType>
					    <p class="class2 ${topType.pinyin} none"><#list typeMap[topType.pinyin] as t>
						<span><input name="typepinyin" onclick="javascript:self.location.href='/member_publish.do?typepinyin=${t.pinyin}';" value="${t.pinyin}" type="radio" <#if typepinyin==t.pinyin>checked="checked"</#if>>${t.name}</span>
						</#list></p>
						</#list>
						<#if typepinyin?exists>
						
						<#include "/WEB-INF/template/member/frag/${typepinyin}.ftl">
						<p>
					   	����ʱ��:7��<input type="hidden" name="task.days" value="7" id="task_days"/>
					   	<br/><span class="orange">��ע���������δ�������㹻�ϸ�������������������Σ�ÿ��7�졣</span>
					    </p>
					    <p>
					   	�Ƿ񹫲�:<input type="radio" checked="checked" value="1" name="isGongBu">ֱ�ӿۿ��������
					   	&nbsp;&nbsp;<input type="radio" value="0" name="isGongBu">����֪ͨ
					   	<br/><span class="orange">ѡ��"��ֱ�ӿۿ������"�����������㹻��������£��ɿͷ���Աֱ�Ӳ����������ߣ�����֪ͨ������</span>
					    </p>
					    <p>
					   	�Ƿ�������������:<input type="radio" value="1" name="task.nospider">��
					   	&nbsp;&nbsp;<input type="radio" value="0" checked="checked" name="task.nospider">��
					   	<br/><span class="orange">�������ѣ�������������ץȡ��Ҫ����֧����10Ԫ�����������ݲ��漰���ε��������أ����Բ����Ρ�</span>
					    </p>
						<p class="ctr">
					   	<input type="checkbox" checked="checked" name="know_xieyi" id="know_xieyi"/><a href="javascript:void(0)" onclick="$('#xieyi').toggle();">�����Ķ����������񷢲���Э����涨</a>
					    </p>
					    <p class="ctr"><input type="button" class="button" value="�ύ����" id="submit_task"></p>
					    <script>
					    	$('#submit_task').click(function(){
					    		if(confirm('ȷ��������Ҫ��������')){
						    		$(this).val('�ύ��...');
						    		$(this).attr('disabled',true);
						    		$('form:eq(0)').submit();
					    		}
					    	});
					    </script>
					    </#if>
					    </form>
			       </div>
			   </div>
			   <#include "/WEB-INF/template/member/frag/xieyi.ftl">
			</div>
		</div>
		<!-- ����������� -->
		<#include "/WEB-INF/template/include/foot.ftl">
	</div>
</body>
</html>