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
					alert(json);
  					if(json){
  						
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
					<table cellspacing="0" cellpadding="0" border="0" width="730" class="list-name">
						<tbody>
							<tr>
								<td width="150" style="font-size: 14px; color: rgb(255, 255, 255);">
									我发布的信息
								</td>
								<td bgcolor="#ffffff" width="570" style="font-size: 12px; color: rgb(51, 51, 51); font-weight: normal; text-align: left; border-top: medium none; padding-left: 10px;">
									* 如要修改已发布信息，则需删除原始信息，重新发布！
								</td>
							</tr>
						</tbody>
					</table>
					<form style="margin: 0pt;" method="post" id="form1" name="form1" action="${base}/user/deleteInfo">
						<table cellspacing="0" cellpadding="0" border="0" width="730" id="info_table">
							<tbody>
								<tr>
									<td bgcolor="#eeeeee" align="center" width="5%" style="border-top: 1px solid rgb(0, 94, 188);">
										&nbsp;
									</td>
									<td bgcolor="#eeeeee" width="33%" style="border-top: 1px solid rgb(0, 94, 188); font-weight: bold;">
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
									<td bgcolor="#eeeeee" width="12%" style="border-top: 1px solid rgb(0, 94, 188); font-weight: bold;">
										日期
									</td>
									<td bgcolor="#eeeeee" width="10%" style="border-top: 1px solid rgb(0, 94, 188); font-weight: bold;">
										操作
									</td>
								</tr>
								<#list pageBean.resultList as info>
								<tr>
									<td>
										<input type="checkbox" name="infoIds" value="${info.id}"/>
									</td>
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
									<td>
										<a href="${base}/user/delete">删除</a>
										&nbsp;
										<#if info.isTop?? && info.isTop>
										<span style="color:#289147;">已置顶</span>
										<#else>										
										<a href="javascript:topInfo(${info.id});" style="font-weight:600;color:#803267;">置顶</a>
										</#if>
									</td>
								</tr>
								</#list>
								<tr>
									<td>
										<input type="checkbox" onclick="checkAll(this);">
									</td>
									<td align="right" valign="middle" style="" colspan="5">
										<span style="display:block;float:left;font-weight: bold;">
											<a href="javascript:deleteInfo();">删除</a>|
											<a href="javascript:location.href='${base}/user/infoList.htm'">刷新</a>
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

