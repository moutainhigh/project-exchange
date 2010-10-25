<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>一路发|分类信息-免费发布信息</title>
		<meta name="description" content="交友征婚，家政，招聘求职，房屋出租，跳蚤市场，二手车等生活分类信息尽在列表网。欢迎免费发布查询生活分类信息。">
		<meta name="keywords" content="分类信息 生活信息 分类广告 一路发" />
		<link rel="shortcut icon" href="http://s1.liebiao.org/favicon2.ico" />
		<link href="Themes/basic.css" rel="stylesheet" type="text/css" />
		<link href="Themes/reg.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/reg.js"></script>
	</head>

	<body>
		<div class="top">
			<div class="top_line">
				<h3>
					欢迎光临一路发信息发布网
				</h3>
				<div class="reg_login">
					<a href="#">用户注册</a>
					<a href="#">用户登录</a>
					<a href="#">设为首页</a>
					<a href="#">添加收藏</a>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="header">
			<div class="logo">
				<img src="Themes/images/logo.jpg" alt="logo" />
			</div>
			<div class="search">
				<div class="search_input">
					<select>
						<option>
							==请选择分类==
						</option>
						<option>
							人才
						</option>
						<option>
							二手房
						</option>
					</select>
					<input type="text" name="key" class="search_key" />
					<input type="button" value="搜索" class="search_btn" />
				</div>
				<div class="hot">
					热门搜索：
					<a href="#">二手自行车</a>
					<a href="#">显示器</a>
					<a href="#">内存条</a>
					<a href="#">兼职</a>
				</div>
			</div>
			<div class="publish">
				<a href="#"><img src="Themes/images/btn_publish.gif" /> </a>
			</div>
		</div>
		<div class="all">
			<div id="content_s">
				<div id="register_step">
					<img alt="填写信息" src="Themes/images/input_info_on.jpg?ver=431">
					<img alt="注册成功" src="Themes/images/register_success_huise.jpg?ver=431">
				</div>
				<c:if test="${not empty msg}">
				<div style="text-align:center; height:30px; font-size:12px;color:red;margin:10px auto;" id="reqMsg">
					<div style="margin:2px auto;border:1px solid #FF0000; background-color:#FFCE00; line-height:30px;height:30px; width:400px;">
						${msg}
					</div>
				</div>
				</c:if>
				<form method="post" name="register_submit" action="reg.htm" id="register_submit">
					<div style="padding-left: 85px; padding-right: 0pt;">
						<table height="122" cellspacing="0" cellpadding="0" border="0" width="90%">
							<tbody>
								<tr>
									<td class="reg_bg_one" colspan="4">
										<label>
											登录名:
										</label>
										&nbsp;
										<input type="text" value="" style="width: 200px;" onblur="check_loginid(this);" name="user.loginName" id="login_id">
									</td>
									<td width="336" id="loginidinfo" class="reg_bg_two">
										4-16个字符（包括4、16）或2-8个汉字
									</td>
								</tr>
								<tr>
									<td class="reg_bg_one" colspan="4">
										<label>
											密码:
										</label>
										&nbsp;
										<input type="password" style="width: 200px;" onblur="check_pwd(this);" name="user.password" id="password">
									</td>
									<td id="pwdinfo" class="reg_bg_two">
										密码须为6位或6以上的字母/数字/下划线
									</td>
								</tr>
								<tr>
									<td class="reg_bg_one" colspan="4">
										<label>
											重输密码:
										</label>
										&nbsp;
										<input type="password" style="width: 200px;" onblur="check_repwd(this);" id="repassword">
									</td>
									<td id="repwdinfo" class="reg_bg_two">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td class="reg_bg_one" colspan="4">
										<label>
											电子邮箱:
										</label>
										&nbsp;
										<input type="text" value="" style="width: 200px;" onblur="check_email(this);" name="user.email" id="email">
									</td>
									<td id="emailinfo" class="reg_bg_two">
										忘记密码时，可凭安全邮箱索取密码
									</td>
								</tr>
								<tr>
									<td class="reg_bg_one" colspan="4">
										<div id="sel_geo">
											<label>
												所在地区:
											</label>
											&nbsp;
											<select name="topArea" id="topArea"></select>
											<select name="user.area.id" id="city"></select>
										</div>
									</td>
									<td id="geoinfo" class="reg_bg_two">
										您登录以后，首页将会指向此处，可以只选择省份或直辖市
									</td>
								</tr>
								<tr>
									<td style="padding: 0pt; margin: 0pt;" class="reg_bg_one" colspan="4">
										<div style="float: left; margin: 3px 5px 3px 0; padding: 10px 0pt 0pt;">
											<label>
												验证码:
											</label>
											&nbsp;
											<input type="text" style="margin-bottom: 5px; height: 15px;" onblur="check_rand(this);" name="rand" id="rand" class="auth">
										</div>
										<div style="float:left;margin:8px 10px">
											<img alt="验证码" style="padding: 4px 0pt 0pt;" onclick="this.src='rand?n='+Math.random();" src="rand" name="verifyframe"
												id="verifyframe">
										</div>
										<div style="padding-left: 100px;" class="hui">
											看不清？点击图片换一个
										</div>
									</td>
									<td id="authinfo" class="reg_bg_two">
										此步骤有助于防止恶意自动注册行为的发生。
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div id="submit">
						<div>
							<input type="button" class="reg" value="注 册" name="send" onclick="chkForm();">
							<span>&nbsp;&nbsp;表示您同意<a target="_blank" href="#">一路发网络服务使用协议</a>
							</span>
						</div>
					</div>
				</form>

			</div>
		</div>
		<div class="foot w1000 center_container clear">
			<a href="http://www.liebiao.com/about/termsofuse.html" rel="nofollow">服务协议</a> |
			<a href="http://www.liebiao.com/about/privacy.html" rel="nofollow">隐私保护</a> |
			<a href="http://www.liebiao.com/about/factsheet.html" rel="nofollow">关于列表网</a> |
			<a href="http://www.liebiao.com/about/help/" rel="nofollow">使用帮助</a> |
			<a href="http://www.liebiao.com/about/contactus.html" rel="nofollow">联系我们</a> |
			<a title="把列表网加入收藏夹" href="http://www.liebiao.com/" onclick="window.external.addFavorite('http://www.liebiao.com/','列表网');return false">收藏本站</a>
			<br>
			&copy; 2007-2010 列表网
			<a target="_blank" href="http://s2.liebiao.org/image/icp.jpg" rel="nofollow">京ICP证100421号</a> 京ICP备09031142号
			<a href="http://www.hd315.gov.cn/beian/view.asp?bianhao=010202010082000002" rel="nofollow"><img src="http://s2.liebiao.org/image/gs.gif"> </a>
			<br>
			朝阳区公安分局网络备案编号:1101051169
			<a href="http://www.liebiao.com/about/help/scam.html" rel="nofollow">谨防手机诈骗和网络诈骗</a>
		</div>
	</body>
</html>


