<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<#include "/front/head.ftl"/>
		<link href="${base}/front/Themes/usercenter.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${base}/front/js/usercenter.js"></script>
	</head>

	<body>
		<#include "/front/top.ftl">
		<div class="all">
			<#include "/front/pos.ftl">
			<div class="all-k">
				<!--left-->
				<#include "/front/usercenter/left.ftl"/>
				<!--/left-->
				<!--right-->
				<div class="manager-r">
					<div>
						<span><a target="_blank" href="http://www.88ke.com/select/">+ 免费发布信息</a>
						</span> 欢迎
						<font id="loginname">${userObj.email!userObj.loginName}</font>的光临:
					</div>
					<#include "/front/msg.ftl">
					<table cellspacing="0" cellpadding="0" border="0" width="730" class="list-name" id="finance">
						<tbody>
							<tr>
								<td width="150" style="font-size: 14px; color: rgb(255, 255, 255);">
									充值订单
								</td>
								<td bgcolor="#ffffff" width="570" style="font-size: 12px; color: rgb(51, 51, 51); font-weight: normal; text-align: left; border-top: medium none; padding-left: 10px;">
									&nbsp;
								</td>
							</tr>
						</tbody>
					</table>
					<FORM name=formbill action="${base}/chinabank/Send.jsp" method=post>
						<TABLE cellSpacing=0 cellPadding=0 width=760 align=center bgColor=#666666 border=0>
						    <TBODY>
						      <TR> 
						        <TD bgColor=#ffffff> <TABLE cellSpacing=0 cellPadding=2 width=750 bgColor=#666666 border=0>
						            <TBODY>
						              <TR> 
						                <TD width="480" bgColor=#ffffff><B>付款方式：</B>
						                  <table width="760" cellpadding="4" cellspacing="1" align="center" bordercolor="#000000" >
						                    <TBODY>
						                      <TR>
						                        <TD align=right height=24>充值说明：</TD>
						                        <TD valign="top"><input name="remark1" type=text id="remark1" value="信息发布网充值">
						                          &nbsp;&nbsp; <font color="#FF0000">//</font>选填项，总长不超过150个字符</TD>
						                      </TR>
						                      <TR>
						                        <TD align=right height=24>订单总金额（元）：</TD>
						                        <TD height=24><input name="v_amount" type=text value="5.00"  onkeyup="if(isNaN(value))execCommand('undo')">
						                          &nbsp;&nbsp; <font color="#FF0000">*</font>必填项，譬如：<font color="#FF0000">0.01</font>，最低充值金额为5元</TD>
						                      </TR>
						                      <TR>
						                        <TD align=right height=23>邮件：</TD>
						                        <TD height=23><input name="v_orderemail" type="text" id="v_orderemail" value="${userObj.email}">
						                          &nbsp;&nbsp; <font color="#FF0000">//</font>选填项，总长不超过100个字符</TD>
						                      </TR>
						                      <TR> 
						                        <TD align=right height=24>&nbsp;</TD>
						                        <TD valign="top"><input type="submit" name="Submit" value=" 开始支付 "></TD>
						                      </TR>
						                  </TABLE>
						                </TD>
						              </TR>
									  <tr>
									    <td bgColor=#ffffff height=50 ><br>说明: 订单号项如果填写我们将按照您提交的订单号为准，如果此项为空，我们将按照网银在线的标准格式 年月日-号商户号-号小时分钟秒 来自动生成订单号。</td>
									  </tr>
						            </TBODY>
						          </TABLE>
						        </TD>
						      </TR>
						  </TBODY>
						</TABLE>
					</FORM>
				</div>
				<!--/right-->
				<div class="clear"></div>
			</div>
		</div>
		<#include "/front/foot.ftl">
	</body>
</html>

