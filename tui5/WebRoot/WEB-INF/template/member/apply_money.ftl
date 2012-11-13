<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset==gbk" />
	<title>推我网 - 我要提现</title>	
	<link href="/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/css/mian.css" rel="stylesheet" type="text/css" />
	<link href="/css/member.css" rel="stylesheet" type="text/css" />
	<script src="/js/jquery.js" type="text/javascript"></script>
	<script src="/js/member.js" type="text/javascript"></script>
	<script type="text/javascript">
		function submitForm(){
			var money = $('#money').val();
			if(!Validator.Currency.test(money)){
				alert('金额格式不正确');
				return false;
			}
			money = parseFloat(money);
			if(money < 30){
				alert('金额不能少于30元');
				return false;
			}
			var m = ${userObj.userAccount};
			if(money > m){
				alert('提现金额已经超过你的余额');
				return false;
			}
			$('form').submit();
		}
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
				   		<ul><li>我要提现</li></ul>
				   </div>
				   <div class="list_box_content">
					   <table class="task_tble" border="0" cellspacing="1">
				   <form action="/member_applyMoney.do" method="post">
						   <tr>
						   		<td>提现说明：</td>
						   		<td>提现金额不能低于30元.你当前的余额为：${userObj.userAccount?string.currency}</td>
						   </tr>
						   <tr>
						   		<td>提现金额</td>
						   		<td>￥<input type="text" name="money" id="money" value="${request.getParameter('money')}"/></td>
						   </tr>
					   </table>
					   <p class="ctr_btn"><input type="button" class="button" value="申请提现" name="button" onclick="submitForm();"></p>
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