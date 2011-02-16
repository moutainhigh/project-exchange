<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<HTML>
	<HEAD>
		<TITLE>${appTitle} - 登录</TITLE>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">
		<style>
th {
	font-size: 12px;
	text-align: right;
	font-weight: normal;
}

td {
	font-size: 12px;
	text-align: left;
}

input {
	width: 100px;
	font-size: 12px;
	border: solid 1px lightblue;
}
</style>
	<script type="text/javascript">
		function login(){
			var f = document.forms[0];
			var username = f.username.value;
			var password = f.password.value;
			if(username=='' || password==''){
				alert('请输入用户名和密码');
				return false;
			}else{
				f.submit();
			}
		}
	</script>
	</HEAD>
	<BODY BGCOLOR=#FFFFFF LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0 style="text-align: center; padding-top: 20px;">
		<form action="${appPath}login.htm" method="post">
		<TABLE WIDTH=800 BORDER=0 CELLPADDING=0 CELLSPACING=0 align="center">
			<TR>
				<TD COLSPAN=7>
					<IMG SRC="${appPath}html/images/login/login_01.jpg" WIDTH=800 HEIGHT=71 ALT="">
				</TD>
				<TD>
					<IMG SRC="${appPath}html/images/login/spacer.gif" WIDTH=1 HEIGHT=71 ALT="">
				</TD>
			</TR>
			<TR>
				<TD COLSPAN=7>
					&nbsp;

				</TD>
				<TD>
					<IMG SRC="${appPath}html/images/login/spacer.gif" WIDTH=1 HEIGHT=66 ALT="">
				</TD>
			</TR>
			<TR>
				<TD COLSPAN=7>
					<IMG SRC="${appPath}html/images/login/login_03.jpg" WIDTH=800 HEIGHT=6 ALT="">
				</TD>
				<TD>
					<IMG SRC="${appPath}html/images/login/spacer.gif" WIDTH=1 HEIGHT=6 ALT="">
				</TD>
			</TR>
			<TR>
				<TD COLSPAN=3>
					&nbsp;
				</TD>
				<TD COLSPAN=3 ROWSPAN=2>
					<IMG SRC="${appPath}html/images/login/login_05.jpg" WIDTH=426 HEIGHT=83 ALT="">
				</TD>

				<TD ROWSPAN=3>
					&nbsp;
				</TD>
				<TD>
					<IMG SRC="${appPath}html/images/login/spacer.gif" WIDTH=1 HEIGHT=44 ALT="">
				</TD>
			</TR>
			<TR>

				<TD ROWSPAN=4>
					&nbsp;
				</TD>
				<TD COLSPAN=2>
					<IMG SRC="${appPath}html/images/login/login_08.jpg" WIDTH=94 HEIGHT=39 ALT="">
				</TD>
				<TD>
					<IMG SRC="${appPath}html/images/login/spacer.gif" WIDTH=1 HEIGHT=39 ALT="">
				</TD>
			</TR>
			<TR>
				<TD ROWSPAN=3>
					<IMG SRC="${appPath}html/images/login/login_09.jpg" WIDTH=15 HEIGHT=141 ALT="">
				</TD>
				<TD COLSPAN=2 ROWSPAN=2 background="${appPath}html/images/login/login_10.jpg">
					<table width="100%">
						<tr>
							<th>
								用户名
							</th>
							<td>
								<input size="10" maxlength="20" name="username"/>
							</td>
						</tr>
						<tr>
							<th>
								密码
							</th>
							<td>
								<input type="password" size="10" maxlength="20" name="password"/>
							</td>
						</tr>
						<tr>
							<td>
								&nbsp;
							</td>
							<td>
								<input name="rand" type="hidden" value=""/>
								<img onclick="login();" src="${appPath}html/images/login/login_button.jpg" width="73" height="25">
							</td>
						</tr>
					</table>
				</TD>
				<TD COLSPAN=2>
					<IMG SRC="${appPath}html/images/login/login_11.jpg" WIDTH=304 HEIGHT=86 ALT="">
				</TD>
				<TD>
					<IMG SRC="${appPath}html/images/login/spacer.gif" WIDTH=1 HEIGHT=86 ALT="">
				</TD>
			</TR>
			<TR>
				<TD ROWSPAN=2>
					<IMG SRC="${appPath}html/images/login/login_12.jpg" WIDTH=19 HEIGHT=55 ALT="">
				</TD>

				<TD COLSPAN=2 ROWSPAN=3>
					&nbsp;
				</TD>
				<TD>
					<IMG SRC="${appPath}html/images/login/spacer.gif" WIDTH=1 HEIGHT=28 ALT="">
				</TD>
			</TR>
			<TR>
				<TD COLSPAN=2>
					<IMG SRC="${appPath}html/images/login/login_14.jpg" WIDTH=201 HEIGHT=27 ALT="">
				</TD>
				<TD>
					<IMG SRC="${appPath}html/images/login/spacer.gif" WIDTH=1 HEIGHT=27 ALT="">
				</TD>
			</TR>
			<TR>
				<TD COLSPAN=6>
					<jsp:include page="msg.jsp"></jsp:include>
				</TD>
			</TR>
			<TR>

				<TD COLSPAN=7 background="${appPath}html/images/login/login_16.jpg" style="text-align: right; padding-right: 25px;">
					&copy;  2009 厚溥信息技术有限公司制
				</TD>
				<TD>
					<IMG SRC="${appPath}html/images/login/spacer.gif" WIDTH=1 HEIGHT=55 ALT="">
				</TD>
			</TR>
			<TR>
				<TD>
					<IMG SRC="${appPath}html/images/login/spacer.gif" WIDTH=150 HEIGHT=1 ALT="">
				</TD>
				<TD>
					<IMG SRC="${appPath}html/images/login/spacer.gif" WIDTH=15 HEIGHT=1 ALT="">
				</TD>
				<TD>
					<IMG SRC="${appPath}html/images/login/spacer.gif" WIDTH=79 HEIGHT=1 ALT="">
				</TD>
				<TD>
					<IMG SRC="${appPath}html/images/login/spacer.gif" WIDTH=122 HEIGHT=1 ALT="">
				</TD>
				<TD>
					<IMG SRC="${appPath}html/images/login/spacer.gif" WIDTH=19 HEIGHT=1 ALT="">
				</TD>
				<TD>
					<IMG SRC="${appPath}html/images/login/spacer.gif" WIDTH=285 HEIGHT=1 ALT="">
				</TD>
				<TD>
					<IMG SRC="${appPath}html/images/login/spacer.gif" WIDTH=130 HEIGHT=1 ALT="">
				</TD>
				<TD></TD>
			</TR>
		</TABLE>
		</form>
	</BODY>
</HTML>