<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset==gbk" />
	<title>推我网 - 会员充值</title>	
	<link href="/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/css/mian.css" rel="stylesheet" type="text/css" />
	<link href="/css/member.css" rel="stylesheet" type="text/css" />
	<script src="/js/jquery.js" type="text/javascript"></script>
	<script src="/js/member.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function(){
			setTimeout(function(){
				document.forms[0].submit();
				$('#prompt').html('充值请求已提交，请到支付页面完成支付即可');
			},1000);
		});
	</script>
	<#include "/WEB-INF/template/include/msg.ftl">
</head>
<body>
	<#include "/WEB-INF/template/include/head.ftl">
	<!-- 顶部区域结束 -->
	<div id="mian">		
		<#include "/WEB-INF/template/include/member_nav.ftl">
		<!-- 内容区域 -->
		<div class="body_content">
			<#include "/WEB-INF/template/include/member_left.ftl">
			<div class="list_body">
			    <div class="list_box">
			       <div class="list_box_title">
				   		<ul><li>会员充值</li></ul>
				   </div>
				   <div class="list_box_content">
				   		<form name="yeepay" action='${nodeAuthorizationURL}' method='POST' target="_blank">
				   		<input type='hidden' name='p0_Cmd'   value='${p0_Cmd}'>
						<input type='hidden' name='p1_MerId' value='${p1_MerId}'>
						<input type='hidden' name='p2_Order' value='${p2_Order}'>
						<input type='hidden' name='p3_Amt'   value='${p3_Amt}'>
						<input type='hidden' name='p4_Cur'   value='${p4_Cur}'>
						<input type='hidden' name='p5_Pid'   value='${p5_Pid}'>
						<input type='hidden' name='p6_Pcat'  value='${p6_Pcat}'>
						<input type='hidden' name='p7_Pdesc' value='${p7_Pdesc}'>
						<input type='hidden' name='p8_Url'   value='${p8_Url}'>
						<input type='hidden' name='p9_SAF'   value='${p9_SAF}'>
						<input type='hidden' name='pa_MP'    value='${pa_MP}'>
						<input type='hidden' name='pd_FrpId' value='${pd_FrpId}'>
						<input type="hidden" name="pr_NeedResponse"  value="${pr_NeedResponse}">
						<input type='hidden' name='hmac'     value='${hmac}'>
						<table class="task_tble" border="0" cellspacing="1">
						   <tr>
						   		<td id="prompt">充值正在准备中。。。</td>
						   </tr>
						  </table>
					   </form>
			       </div>
			   </div>
			</div>
		</div>
		<!-- 内容区域结束 -->
		<#include "/WEB-INF/template/include/foot.ftl">
	</div>
</body>
</html>