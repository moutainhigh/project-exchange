<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset==gbk" />
	<title>推我网 - 发布任务</title>	
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
		<!-- 内容区域 -->
		<div class="body_content">
			<#include "/WEB-INF/template/include/member_left.ftl">
			<div class="publish_body">
			    <div class="publish_box">
			    	<div class="publish_box_title">
				   		<ul><li>发布任务</li></ul>
				   </div>
				   <div class="publish_box_content">
					    <h3>任务所属的一级分类</h3>
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
					    <h3>请选择推广方式${toptypepinyin}_${typepinyin}</h3>
					    <#list topTypeList as topType>
					    <p class="class2 ${topType.pinyin} none"><#list typeMap[topType.pinyin] as t>
						<span><input name="typepinyin" onclick="javascript:self.location.href='/member_publish.do?typepinyin=${t.pinyin}';" value="${t.pinyin}" type="radio" <#if typepinyin==t.pinyin>checked="checked"</#if>>${t.name}</span>
						</#list></p>
						</#list>
						<#if typepinyin?exists><#include "/WEB-INF/template/member/frag/${typepinyin}.ftl">
						<p class="ctr">
					   	<input type="checkbox" checked="checked" name="know_xieyi" id="know_xieyi"/><a href="javascript:void(0)" onclick="$('#xieyi').toggle();">我已阅读并接受任务发布的协议与规定</a>
					    </p>
					    <p class="ctr"><input type="submit" class="button" value="提交任务" name="submit"></p>
					    </#if>
			       </div>
			   </div>
			   <#include "/WEB-INF/template/member/frag/xieyi.ftl">
			</div>
		</div>
		<!-- 内容区域结束 -->
		<#include "/WEB-INF/template/include/foot.ftl">
	</div>
</body>
</html>