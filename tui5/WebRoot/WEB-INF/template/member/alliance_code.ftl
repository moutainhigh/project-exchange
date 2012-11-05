<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset==gbk" />
	<title>推我网 - 会员中心 - 推客联盟获取代码</title>	
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
				   		<ul><li>推客联盟 - 获取推广代码</li></ul>
				   </div>
				   <div class="list_box_content">
				   <table width="100%" cellspacing="0" cellpadding="0" border="0" style="font-size:14px;">
                    <tbody><tr>
                      <td height="50" colspan="2"><span class="red"><strong>文字代码</strong></span>&nbsp;&nbsp;<span style="color:#999">适合所有网站、博客、空间、论坛</span></td>
                    </tr>
                    
                    <tr>
                      <td width="11%" valign="top" align="right" rowspan="2">样式一：</td>
                      <td width="89%" valign="top" height="25"><input type="text" size="60" value="&lt;a href='http://www.tui5.com/?allianceUserId=${userObj.userId}' target='_blank'&gt;要推广，找推我网&lt;/a&gt;" id="url2" name="url2">
                        <input type="button" onclick="clip('url2');" value="复制连接" name="Submit22"></td>
                    </tr>
                    <tr>
                      <td height="25"><a style="color:#145597; font-size:12px;" target="_blank" href="http://www.tui5.com/?allianceUserId=${userObj.userId}">网络推广，找推我网</a></td>
                    </tr>
                    
                    <!--
                    <tr>
                      <td height="50" colspan="2"><span class="red"><strong>图片代码</strong></span>&nbsp;&nbsp;<span style="color:#999">适合个人网站、个人空间、个人博客</span></td>
                    </tr>                    
                    <tr>
                      <td align="left" colspan="2"><table width="100%" cellspacing="0" cellpadding="0" border="0" style="border-bottom:1px dashed #CCC;">
                        <tbody><tr>
                          <td width="11%" valign="top" height="60" align="right" rowspan="2">样式一：</td>
                          <td valign="top"><input type="text" size="45" value="&lt;a href='http://www.sandaha.com/?workName=throne212' target='_blank'&gt;&lt;img src='http://www.sandaha.com/images/logo1.gif' width='88' height='31' border='0' /&gt;&lt;/a&gt;" id="url3" name="url3"> <input type="button" onclick="clip('url3');" value="复制连接" name="Submit222"> <span style="color:#999">尺寸：88*31</span></td>
                        </tr>
                        <tr>
                          <td valign="top"><img width="88" height="31" border="0" src="http://www.sandaha.com/images/logo1.gif"></td>
                        </tr>
                        <tr>
                          <td valign="top" height="10" align="right" colspan="2">&nbsp;</td>
                        </tr>
                        
                      </tbody></table>
                        <table width="100%" cellspacing="0" cellpadding="0" border="0" style="margin:15px 0 0 0;border-bottom:1px dashed #CCC;">
                          <tbody><tr>
                            <td width="11%" valign="top" height="60" align="right" rowspan="2">样式二：</td>
                            <td><input type="text" size="45" value="&lt;a href='http://www.sandaha.com/?workName=throne212' target='_blank'&gt;&lt;img src='http://www.sandaha.com/images/logo2.gif' width='125' height='125' border='0' /&gt;&lt;/a&gt;" id="url4" name="url4"> <input type="button" onclick="clip('url4');" value="复制连接" name="Submit2222"> <span style="color:#999">尺寸：125*125</span></td>
                          </tr>
                          <tr>
                            <td><img width="125" height="125" border="0" src="http://www.sandaha.com/images/logo2.gif"></td>
                          </tr>
                        </tbody></table>
                        <table width="100%" cellspacing="0" cellpadding="0" border="0" style="margin:15px 0 0 0;border-bottom:1px dashed #CCC;">
                          <tbody><tr>
                            <td width="11%" valign="top" height="60" align="right" rowspan="2">样式三：</td>
                            <td valign="top"><input type="text" size="45" value="&lt;a href='http://www.sandaha.com/?workName=throne212' target='_blank'&gt;&lt;img src='http://www.sandaha.com/images/logo3.gif' width='120' height='240' border='0' /&gt;&lt;/a&gt;" id="url5" name="url5"> <input type="button" onclick="clip('url5');" value="复制连接" name="Submit22222"> <span style="color:#999">尺寸：120*240</span></td>
                          </tr>
                          <tr>
                            <td valign="top"><img width="120" height="240" border="0" src="http://www.sandaha.com/images/logo3.gif"></td>
                          </tr>
                        </tbody></table>
                        <table width="100%" cellspacing="0" cellpadding="0" border="0" style="margin:15px 0 0 0;">
                          <tbody><tr>
                            <td width="11%" valign="top" height="60" align="right" rowspan="2">样式四：</td>
                            <td valign="top"><input type="text" size="45" value="&lt;a href='http://www.sandaha.com/?workName=throne212' target='_blank'&gt;&lt;img src='http://www.sandaha.com/images/logo4.gif' width='468' height='60' border='0' /&gt;&lt;/a&gt;" id="url6" name="url6">
                            <input type="button" onclick="clip('url6');" value="复制连接" name="Submit2222222">
                            <span style="color:#999">尺寸：468*60</span></td>
                          </tr>
                          <tr>
                            <td valign="top"><img width="468" height="60" border="0" src="http://www.sandaha.com/images/logo4.gif"></td>
                          </tr>
                          <tr>
                            <td valign="top" height="10" align="right" colspan="2">&nbsp;</td>
                          </tr>-->
                        </tbody></table></td>
                    </tr>
                  </tbody></table>
			       </div>
			   </div>
			</div>
		</div>
		<!-- 内容区域结束 -->
		<#include "/WEB-INF/template/include/foot.ftl">
	</div>
</body>
</html>