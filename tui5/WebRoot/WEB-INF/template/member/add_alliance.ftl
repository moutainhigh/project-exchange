<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset==gbk" />
	<title>������ - ��Ա���� - ����ƿ�������վ</title>	
	<link href="/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/css/mian.css" rel="stylesheet" type="text/css" />
	<link href="/css/member.css" rel="stylesheet" type="text/css" />
	<script src="/js/jquery.js" type="text/javascript"></script>
	<script src="/js/member.js" type="text/javascript"></script>
	<script type="text/javascript">
		function checkregform(){
			var siteName = $('#siteName').val();
			if(!siteName || siteName=='' ||siteName.length>50){
				alert('��������վ���ƣ����Ȳ�����50����');
				return false;
			}
			var siteURL = $('#siteURL').val();
			if(!siteURL || siteURL=='' ||siteURL.length>50){
				alert('��������վ��ַ�����Ȳ�����50���֣�����http://��ͷ');
				return false;
			}
			return true;
		}
		$(function(){
			var siteURL = $('#siteURL').val();
			if(siteURL==null ||��siteURL == ''){
				$('#siteURL').val('http://');
			}
		});
	</script>
	<#include "/WEB-INF/template/include/msg.ftl">
</head>
<body>
	<#include "/WEB-INF/template/include/head.ftl">
	<!-- ����������� -->
	<div id="mian">		
		<#include "/WEB-INF/template/include/member_nav.ftl">
		<!-- �������� -->
		<div class="body_content">
			<#include "/WEB-INF/template/include/member_left.ftl">
			<div class="list_body">
			    <div class="list_box">
			       <div class="list_box_title">
				   		<ul><li>����ƿ�������վ</li></ul>
				   </div>
				   <div class="list_box_content">
				   <form onsubmit="return checkregform()" action="/member_addAlliance.do" method="post">
				   		<table width="100%" cellspacing="0" cellpadding="0" border="0" style="font-size:14px;">
				<tbody>
				<tr>
				  <td width="20%" height="35" align="right">��վ���ƣ�</td>
				  <td width="80%" colspan="2"><input type="text" alt="��վ���Ʋ���Ϊ�ա�" size="40" id="siteName" class="text1" name="a.siteName" value="${(a.siteName)?default('')}"> <span style="color:#999; ">�磺������</span></td>
				</tr>
				<tr>
				  <td width="20%" height="35" align="right">��ַ��</td>
				  <td colspan="2"><input type="text" alt="��ַ����Ϊ�ա�" size="40" id="siteURL" class="text1" name="a.siteURL" value="${(a.siteURL)?default('')}"> <span style="color:#999; ">�磺http://www.sina.com.cn</span></td>
				</tr>
				<tr>
				  <td height="50" align="right">&nbsp;</td>
				  <td height="30" colspan="2"><input type="submit" value=" �������" name="Submit"><input type="hidden" value="save" id="act" name="act"></td>
				</tr>
			  </tbody></table>
			  </form>
			       </div>
			   </div>
			</div>
		</div>
		<!-- ����������� -->
		<#include "/WEB-INF/template/include/foot.ftl">
	</div>
</body>
</html>