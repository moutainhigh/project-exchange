<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<#include "/front/head.ftl"/>
		<link href="${base}/front/Themes/usercenter.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${base}/front/js/usercenter.js"></script>
		<script type="text/javascript">
			var msg = '${msg?default("")}';
			if(msg != ''){
				alert(msg);
			}
			function checkAll(obj){
				if($(obj).attr('checked')){
					$('input[type="checkbox"]').attr('checked',true);
				}else{
					$('input[type="checkbox"]').attr('checked',false);
				}
			}
			function deleteInfo(){
				if(confirm('您确定删除吗？') && $('input:checked').length>0){
					document.forms[0].submit();
				}
			}
			function topInfo(infoId){
				$.getJSON("${base}/ajax/getTopPrice.action",{'infoId':infoId}, function(json){
					//alert(json);
  					if(json){
  						if(json['price'] < 0){
  							alert('此地区和此分类的信息置顶价格还没有设置，不能进行置顶操作');
  						}else{
  							if(confirm("您的该条信息置顶价格为：json['price']")){
  								
  							}
  						}
			  		}
  				});
			}
		</script>
	</head>

	<body>
		<#include "/front/top.ftl">
		<div class="all">
			<#include "/front/pos.ftl">
			<div class="all-k">
				<#include "/front/usercenter/left.ftl"/>
				<!--right-->
				<div class="manager-r">
					<div>
						<span><a target="_self" href="${base}/user/publish/index.htm">+ 免费发布信息</a>
						</span> 欢迎
						<font id="loginname">${userObj.email!userObj.loginName}</font>的光临:
					</div>
					<#include "/front/msg.ftl">
					<table cellspacing="0" cellpadding="0" border="0" width="730" class="list-name">
						<tbody>
							<tr>
								<td width="150" style="font-size: 14px; color: rgb(255, 255, 255);">
									信息置顶
								</td>
								<td bgcolor="#ffffff" width="570" style="font-size: 12px; color: rgb(51, 51, 51); font-weight: normal; text-align: left; border-top: medium none; padding-left: 10px;">
									* 信息置顶为有偿服务，请根据你的需要选择需要置顶的天数
								</td>
							</tr>
						</tbody>
					</table>
					<form style="margin: 0pt;" method="post" id="form1" name="form1" action="${base}/user/topInfo">
						<input type="hidden" name="info.id" value="${info.id}"/>
						<table cellspacing="0" cellpadding="0" border="0" width="730" id="info_table">
							<tbody>
								<tr>
									<td bgcolor="#eeeeee" width="" style="border-top: 1px solid rgb(0, 94, 188); font-weight: bold;">
										信息标题
									</td>
									<td bgcolor="#eeeeee" width="15%" style="border-top: 1px solid rgb(0, 94, 188); font-weight: bold;">
										信息分类
									</td>
									<td bgcolor="#eeeeee" width="15%" style="border-top: 1px solid rgb(0, 94, 188); font-weight: bold;">
										发布地区
									</td>
									<td bgcolor="#eeeeee" width="10%" style="border-top: 1px solid rgb(0, 94, 188); font-weight: bold;">
										状态
									</td>
									<td bgcolor="#eeeeee" width="15%" style="border-top: 1px solid rgb(0, 94, 188); font-weight: bold;">
										发布日期
									</td>
								</tr>
								<tr>
									<td>
										<a href="${base}/info/${info.area.parent.pinyin}/${info.cate.pinyin}/${info.id}.htm" target="_blank">${info.title}</a>
									</td>
									<td>
										${info.cate.name}
									</td>
									<td>
										<#if info.area?? && info.area.parent??>${info.area.parent.name}></#if>${info.area.name}
									</td>
									<td>
										<#if info.isChecked?? && info.isChecked==true>已通过审核<#else>等待审核</#if>
									</td>
									<td>
										${info.publishDate?string("yyyy-MM-dd")}
									</td>
								</tr>
								<tr>
									<td colspan="5" style="text-align:center;padding:5px;">
										<input type="text" name="topDays" value="1" size="5"/>
										<input type="submit" value=" 信息置顶 " style="width:150px;height:35px;"/>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
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
						    <td class="manager-t"><span class="money">${userObj.balance!'0'}</span>元&nbsp;&nbsp;&nbsp;&nbsp;<a href="${base}/user/financeForm.htm">充值</a></td>
						   </tr>
						  <tr>
						    <td align="right" width="30%">可用余额：</td>
						    <td><span class="money">${userObj.balance!'0'}</span>元</td>
							</tr>
						  </tbody>
					</table>
				</div>
				<!--/right-->
				<div class="clear"></div>
			</div>
		</div>
		<#include "/front/foot.ftl">
	</body>
</html>

