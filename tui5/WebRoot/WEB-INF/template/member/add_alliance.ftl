<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset==gbk" />
	<title>推我网 - 会员中心 - 添加推客联盟网站</title>	
	<link href="/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/css/mian.css" rel="stylesheet" type="text/css" />
	<link href="/css/member.css" rel="stylesheet" type="text/css" />
	<script src="/js/jquery.js" type="text/javascript"></script>
	<script src="/js/member.js" type="text/javascript"></script>
	<script type="text/javascript">
		function checkregform(){
			var siteName = $('#siteName').val();
			if(!siteName || siteName=='' ||siteName.length>50){
				alert('请输入网站名称，长度不超过50个字');
				return false;
			}
			var siteURL = $('#siteURL').val();
			if(!siteURL || siteURL=='' ||siteURL.length>50){
				alert('请输入网站地址，长度不超过50个字，请以http://开头');
				return false;
			}
			return true;
		}
		$(function(){
			var siteURL = $('#siteURL').val();
			if(siteURL==null ||　siteURL == ''){
				$('#siteURL').val('http://');
			}
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
				   		<ul><li>添加推客联盟网站</li></ul>
				   </div>
				   <div class="list_box_content">
				   <form onsubmit="return checkregform()" action="/member_addAlliance.do" method="post">
				   		<table width="100%" cellspacing="0" cellpadding="0" border="0" style="font-size:14px;">
				<tbody>
				<tr>
				  <td width="20%" height="35" align="right">网站名称：</td>
				  <td width="80%" colspan="2"><input type="text" alt="网站名称不能为空。" size="40" id="siteName" class="text1" name="a.siteName" value="${(a.siteName)?default('')}"> <span style="color:#999; ">如：新浪网</span></td>
				</tr>
				<tr>
				  <td width="20%" height="35" align="right">网址：</td>
				  <td colspan="2"><input type="text" alt="网址不能为空。" size="40" id="siteURL" class="text1" name="a.siteURL" value="${(a.siteURL)?default('')}"> <span style="color:#999; ">如：http://www.sina.com.cn</span></td>
				</tr>
				<tr>
				  <td height="50" align="right">&nbsp;</td>
				  <td height="30" colspan="2"><input type="submit" value=" 申请加入" name="Submit"><input type="hidden" value="save" id="act" name="act"></td>
				</tr>
			  </tbody></table>
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