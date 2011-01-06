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
					<table cellspacing="0" cellpadding="0" border="0" width="730" class="list-name">
						<tbody>
							<tr>
								<td width="150" style="font-size: 14px; color: rgb(255, 255, 255);">
									我的财务信息
								</td>
								<td bgcolor="#ffffff" width="570" style="font-size: 12px; color: rgb(51, 51, 51); font-weight: normal; text-align: left; border-top: medium none; padding-left: 10px;">
									* 如要发现账务信息有误，请及时与我们的客服取得联系！
								</td>
							</tr>
						</tbody>
					</table>
					<table cellspacing="0" cellpadding="0" border="0" width="330" style="margin-top: 30px;">
						  <tbody><tr>
						    <td align="right" width="30%">帐户总额：</td>
						    <td class="manager-t"><span class="money">${user.balance!'0'}</span>元&nbsp;&nbsp;&nbsp;&nbsp;<a href="${base}/user/financeForm.htm">充值</a></td>
						   </tr>
						  <tr>
						    <td align="right" width="30%">可用余额：</td>
						    <td><span class="money">${user.balance!'0'}</span>元</td>
							</tr>
						  </tbody>
					</table>
					<table cellspacing="0" cellpadding="0" border="0" width="730" class="list-name">
						<tbody>
							<tr>
								<td width="150" style="font-size: 14px; color: rgb(255, 255, 255);">
									财务明细
								</td>
								<td bgcolor="#ffffff" width="570" style="font-size: 12px; color: rgb(51, 51, 51); font-weight: normal; text-align: left; border-top: medium none; padding-left: 10px;">
									* 如要发现账务信息有误，请及时与我们的客服取得联系！
								</td>
							</tr>
						</tbody>
					</table>
					<form style="margin: 0pt;" method="post" id="form1" name="form1" action="${base}/user/deleteInfo">
						<table cellspacing="0" cellpadding="0" border="0" width="730" id="finance">
							<tbody>
								<tr>
									<td bgcolor="#eeeeee" align="center" width="5%" style="border-top: 1px solid rgb(0, 94, 188);">
										&nbsp;
									</td>
									<td bgcolor="#eeeeee" width="38%" style="border-top: 1px solid rgb(0, 94, 188); font-weight: bold;">
										流水号
									</td>
									<td bgcolor="#eeeeee" width="15%" style="border-top: 1px solid rgb(0, 94, 188); font-weight: bold;">
										时间
									</td>
									<td bgcolor="#eeeeee" width="15%" style="border-top: 1px solid rgb(0, 94, 188); font-weight: bold;">
										金额
									</td>
								</tr>
								<#list pageBean.resultList as f>
								<tr>
									<td>
										<input type="checkbox" name="infoIds" value="${f.id}"/>
									</td>
									<td>
										${f.orderNo}
									</td>
									<td>
										${f.date}
									</td>
									<td>
										${f.money}
									</td>
								</tr>
								</#list>
								<tr>
									<td>
										&nbsp;
									</td>
									<td align="right" valign="middle" style="" colspan="5">
										<span style="display:block;float:left;font-weight: bold;">
											<a href="javascript:location.href='${base}/user/finance.htm'">刷新</a>
										</span>
										<span style="display:block;float:right;">
											<font color="blue">${pageBean.pageIndex }</font>/${pageBean.maxPage }&nbsp;
											每页${pageBean.rowPerPage }条&nbsp;
											共${pageBean.totalRow }条&nbsp;
											<#if !pageBean.isFirstPage><a href="javascript:gotoPage(1);">[首页]</a><#else>[首页]</#if>
											<#if !pageBean.isFirstPage><a href="javascript:gotoPage(${pageBean.prePageIndex });">[前一页]</a><#else>[前一页]</#if>
											<#if !pageBean.isLastPage><a href="javascript:gotoPage(${pageBean.nextPageIndex });">[后一页]</a><#else>[后一页]</#if>
											<#if !pageBean.isLastPage><a href="javascript:gotoPage(${pageBean.maxPage });">[尾页]</a><#else>[尾页]</#if>
										</span>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<!--/right-->
				<div class="clear"></div>
			</div>
		</div>
		<#include "/front/foot.ftl">
	</body>
</html>

