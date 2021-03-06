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
		<script type="text/javascript" src="${appPath}chart/swfobject.js"></script>
		<script language="javascript">
		var msg = '${msg}';
		if(msg != ''){
			alert(msg);
		}
		var maxYear = '${maxYear}';
		var now = new Date();
		var currYear = now.getYear()<1970?now.getYear() + 1900:now.getYear();
		maxYear = maxYear==''?currYear:parseInt(maxYear);
		var year = '${year}';
		var time = '${month}';
		$(function(){
			var str = '';
			for(var i=1;i<=12;i++){
				str += '<option value="'+i+'">第'+i+'月</option>';
			}
			$('#time').html(str);
			
			for(var i=2011;i<=maxYear;i++){
				$("#year").append('<option value="'+ i +'">'+ i +'</option>');
			}
			
			if(year != ''){
				setTimeout(function(){ 
				  $('#year').val(year);
				},1);
			}
			if(time != ''){
				setTimeout(function(){ 
				  $('#time').val(time);
				},1);
			}
		});
		function query(){
			var f = document.forms[0];
			f.action = "${appPath}report_projectCunStat.action";
			f.submit();
		}
		
		$(function(){
			selectArea(2);
		});
		var paramZhenId = '${param.zhenId}';
		function selectArea(val){
			if(!document.getElementById('zhenId')){
				var zhenId = '';
				<c:if test="${userObj.roleType=='镇级管理员'}">
				zhenId = '${userObj.zhen.id}';
				</c:if>
				selectZhen(zhenId);
			}else if(val){
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
		
		$(function(){
			var so = new SWFObject("${appPath}chart/${item.swf}", "ampie", "750", "${item.height}", "8", "#FFFFFF");
			so.addVariable("path", "${appPath}chart/");
			so.addVariable("chart_settings", encodeURIComponent("${item.setXml}"));
			so.addVariable("chart_data", encodeURIComponent('${item.dataXml}'));
			so.write("rate_chart");
		});	
		</script>
		<style>
.tables_search {
	margin: 0px 0px 2px 0px;
	height: 40px;
	background-color: #418FD0;
}
</style>
	</head>
	<body>
		<form method="get" action="${appPath}family_familyList.action" name="searchForm">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
				<tbody>
					<tr>
						<td>
							您当前所处页面：“对口帮扶低收入村”项目落实情况统计表
						</td>
						<td align="right">
							&nbsp;
						</td>
						<td width="5px"></td>
					</tr>
					
				</tbody>
			</table>
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr align="center">
						<td width="" class="tables_headercell" colspan="1">
							年度：
							<select name="year" id="year">
								<option value=""></option>
							</select>
						</td>
						<td width="" class="tables_headercell">
							时间：
							<select name="month" id="time">
								<option value=""></option>
							</select>
						</td>
						<td width="" class="tables_headercell">
						<c:if test="${userObj.roleType=='县级管理员'}">
							<span class="STYLE1">镇：</span>
			 			<select id="zhenId" name="zhenId" onchange="selectZhen(this.value);">
									<option value="">----------</option>
								 </select>
						<span class="STYLE1">&nbsp;村：</span>
						<select id="cunId2" name="cunId">
									<option value="">-----------</option>
									</select>
									</c:if>
									<br/>
									帮扶单位:
							<select name="orgId" id="orgId">
								<option value="">==不限==</option>
								<c:forEach items="${orgList }" var="o">
								<option value="${o.id }" <c:if test="${o.id==param['orgId']}">selected="selected"</c:if>>${o.orgName }</option>
								</c:forEach>
							</select>&nbsp;
							项目名称：
							<input type="text" style="width:100px;" name="proName" id="proName" value="${param.proName }"/>
							&nbsp;
							<input type="button" value="按条件查询" class="button" name="查询" onclick="query();">
							&nbsp;
							<input type="button" value="Excel导出" class="button" name="Excel导出" onclick="exportExcel('data_table');">
						</td>
					</tr>
				</tbody>
			</table>
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table" id="data_table">
				<tbody>
					<tr align="center">
						<td height="28" width="" class="tables_headercell">
							所属镇
						</td>
						<td width="" class="tables_headercell">
							村名
						</td>
						<td width="" class="tables_headercell">
							项目名称
						</td>
						<td width="" class="tables_headercell">
							总投资额（万元）
						</td>
						<td width="" class="tables_headercell">
							建设规模及内容
						</td>
						<td width="" class="tables_headercell">
							帮扶资金到位情况（万元）
						</td>
						<td width="" class="tables_headercell">
							项目进展情况
						</td>
						<td width="" class="tables_headercell">
							存在问题
						</td>
						<td width="" class="tables_headercell">
							下一步推进措施
						</td>
						<td width="" class="tables_headercell">
							村委会审核
						</td>
						<td width="" class="tables_headercell">
							总体进度
						</td>
						<td width="" class="tables_headercell">
							数据月份
						</td>
					</tr>
					<c:forEach items="${pageBean.resultList}" var="f">
						<tr <c:if test="${f.year!=year || f.month!=month }">style="background-color: PINK;"</c:if>>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.project.org.cun.zhen.name }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.project.org.cun.name }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.project.name }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.project.money }
							</td>
							<td height="25" align="left" class="tables_contentcell" style="padding-left: 5px;">
								&nbsp; ${f.project.content }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.money }
							</td>
							<td height="25" align="left" class="tables_contentcell" style="padding-left: 5px;">
								&nbsp; ${f.complete }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.problem }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.content }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.cunRemark }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; <c:if test="${not empty f.rate }">${f.rate }%</c:if>
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.year }-${f.month }
							</td>
						</tr>
					</c:forEach>
					<c:if test="${pageBean.isLastPage }">
						<tr>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 合计
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${pageBean.total[0] }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${pageBean.total[1] }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp;
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp;
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp;
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; 
							</td>
						</tr>
					</c:if>
					<c:if test="${not empty item }">
					<tr>
						<td colspan="12" align="center" class="tables_contentcell">
							<h2 style="margin-top: 50px;">项目完成进度表</h2>
							<div id="rate_chart">您需要升级您浏览器的Flash播放器!</div>
						</td>
					</tr>
					</c:if>
				</tbody>
			</table>
		</form>
	</body>
</html>