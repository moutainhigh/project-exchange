<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script language="javascript">
		var msg = '${msg}';
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
		function unlockInfo(){
			if($('input:checked').length>0 && confirm('您确定解锁吗？')){
				document.forms[0].action = '${appPath}dang_report_unlock.action';
				document.forms[0].submit();
			}
		}
		function query(){
			document.forms[0].action = '${appPath}people_summary.action';
			document.forms[0].submit();
		}
		$(function(){
			$.getJSON("${appPath}ajax/getAllShi?time="+new Date().getTime(), {}, function(json){
				if(json && json['list'] && json['list'].length){
					$('#shiId').html('');
					for(var i=0;i<json['list'].length;i++)
						$('#shiId').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>');
					selectShi($('#shiId').val());
				}
			});
		});
		var paramAreaId = '${param.areaId}';
		function selectShi(val){
			if(val){
				$.getJSON("${appPath}ajax/getAllArea?time="+new Date().getTime(), {'parentId':val}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#areaId').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++)
							$('#areaId').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>');
						if(paramAreaId!=''){
							setTimeout(function(){
								$('#areaId').val(paramAreaId);
								selectArea(paramAreaId);
							},1);
						}
					}
				});
			}
		}
		var paramZhenId = '${param.zhenId}';
		function selectArea(val){
			if(val){
				$.getJSON("${appPath}ajax/getAllZhen?time="+new Date().getTime(), {'parentId':val}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#zhenId').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++)
							$('#zhenId').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>');
						if(paramZhenId!=''){
							setTimeout(function(){
								$('#zhenId').val(paramZhenId);
								selectZhen(paramZhenId);
							},1);
						}
					}
				});
			}
		}
		var paramCunId = '${param.cunId}';
		function selectZhen(val){
			if(val){
				$.getJSON("${appPath}ajax/getAllCun?time="+new Date().getTime(), {'parentId':val}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#cunId2').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++)
							$('#cunId2').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>');
						if(paramCunId!=''){
							setTimeout(function(){
								$('#cunId2').val(paramCunId);
							},1);
						}
					}
				});
			}
		}
		</script>
		<style>
.tables_search {
	margin: 0px 0px 2px 0px;
	height: 40px;
	background-color: #418FD0;
}
.content{background-color: rgb(239, 247, 255);margin:2px auto;width:90%;border:1px solid rgb(65, 143, 208);text-align: center;}
</style>
	</head>
	<body>
		<form method="get" action="${appPath}people_summary.action" name="searchForm">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
				<tbody>
					<tr>
						<td>
							您当前所处页面：民意调查表统计
						</td>
						<td align="right">
						
							<span class="STYLE1">市：</span>
				                   <select id="shiId" name="shiId" onchange="selectShi(this.value);">
									<option value="">-----------</option>
								 </select>
							<span class="STYLE1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;区/县：</span>
							<select id="areaId" name="areaId" onchange="selectArea(this.value);">
										<option value="">----------</option>
									  </select>
				 			<span class="STYLE1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;镇：</span>
				 			<select id="zhenId" name="zhenId" onchange="selectZhen(this.value);">
										<option value="">----------</option>
									 </select>
							<span class="STYLE1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;村：</span>
							<select id="cunId2" name="cunId">
									<option value="">-----------</option>
									</select>
						
						<select name="year">
							<c:forEach var="s" items="${settingList }">
							<option value="${s.year }" <c:if test="${year==s.year}">selected="selected"</c:if>>${s.year }</option>
							</c:forEach>
						</select>年度
						<input type="button" class="button" value="查询" onclick="query();">
						</td>
						<td width="5px"></td>
					</tr>
				</tbody>
			</table>
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr align="center">
						<td height="28" width="" class="tables_headercell">
							序号
						</td>
						<td width="" class="tables_headercell">
							贫困村名称
						</td>
						<td width="" class="tables_headercell">
							填报单位
						</td>
						<td width="" class="tables_headercell">
							年度
						</td>				
						<td width="" class="tables_headercell">
							已提交份数
						</td>
						<td width="" class="tables_headercell">
							还差份数
						</td>
					</tr>
					<c:forEach items="${pageBean.resultList}" var="f" varStatus="status">
						<tr>
							<td height="25" align="center" class="tables_contentcell">
								${status.count }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.cun.name}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.org.orgName }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.year }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.submit }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; <font <c:if test="${ps.mount>f.submit}">color="red"</c:if>>${f.nosubmit }</font>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td height="25" align="right" class="tables_contentcell" colspan="7">
							<jsp:include page="../../pager.jsp"></jsp:include>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>