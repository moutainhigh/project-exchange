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
<jsp:include page="../../msg.jsp"></jsp:include>
		function checkAll(obj){
			if($(obj).attr('checked')){
				$('input[type="checkbox"]').attr('checked',true);
			}else{
				$('input[type="checkbox"]').attr('checked',false);
			}
		}
		var lock = '${cunStat.lock}';
		var year = '${cunStat.year}';
		var time = '${cunStat.month}';
		var half = '${cunStat.half}';
		var maxYear = '${maxYear}';
		var now = new Date();
		var currYear = now.getYear()<1970?now.getYear() + 1900:now.getYear();
		maxYear = maxYear==''?currYear:parseInt(maxYear);
		
		var maxMonth = '${maxMonth}';
		maxMonth = maxMonth==''?12:parseInt(maxMonth);
		
		$(function(){			
			for(var i=2011;i<=maxYear;i++){
				$("#year").append('<option value="'+ i +'">'+ i +'</option>');
			}
			if(year != ''){
				setTimeout(function(){ 
				  $('#year').val(year);
				  chooseYear(year);
				},1);
			}
			if(half != ''){
				setTimeout(function(){
					var i = parseInt(half);
					$('input[name="cunStat.half"]').eq(i-1).attr("checked",true);
				}, 1);
			}
			
			//加锁，禁止修改
			if(lock == '1' || lock == '2'){
				//alert('wewewe');
				$('input[type="text"]').not('.cun_remark').attr("readonly",true);
				$('textarea').attr("readonly",true);
			}	
		});
		function chooseYear(year){
			$('#time').attr('disabled',false);
			var str = '';
			var ms = maxMonth;
			if(currYear > $('#year').val())
				ms = 12;
			for(var i=1;i<=ms;i++){
				if($('#year').val()==2011 || year == '2011'){
					if(i<=7)
						continue;
					str += '<option value="'+i+'">第'+i+'月</option>';
				}else{
					str += '<option value="'+i+'">第'+i+'月</option>';
				}
			}
			$('#time').html(str);
			if(time != ''){
				setTimeout(function(){ 
				  $('#time').val(time);
				},1);
			}
		}
		function query(){
			var f = document.forms[0];
			f.action = "${appPath}pro_cunStat.action";
			f.submit();
		}
		function tmpSave(){
			var f = document.forms[0];
			f.action = "${appPath}pro_tmpSaveProCunStat.action";
			f.submit();
		}
		function save(){
			if(confirm('报表提交后不允许修改，是否提交')){
				var f = document.forms[0];
				f.action = "${appPath}pro_saveProCunStat.action";
				f.submit();
			}
		}
		function unlockReport(){
			if(confirm('确定需要解锁吗？')){
				var f = document.forms[0];
				f.action = '${appPath}pro_requstUnlockProCunStat.action';
				f.submit();
			}
		}
		function shenhe(){
			var f = document.forms[0];
			$('#statId').val('${cunStat.id}');
			f.action = '${appPath}pro_shenheProCunStat.action';
			f.submit();
		}
		function tuihui(){
			var f = document.forms[0];
			$('#statId').val('${cunStat.id}');
			f.action = '${appPath}pro_tuihuiProCunStat.action';
			f.submit();
		}
		</script>
		<style>
.tables_search {
	margin: 0px 0px 2px 0px;
	height: 40px;
	background-color: #418FD0;
}
	textarea {	width:90%;}
</style>
	</head>
	<body>
		<form method="get" action="${appPath}pro_saveProCunStat.action" name="searchForm">
			<input type="hidden" name="cunStat.id" value="${cunStat.id}" id="statId">
			<input type="hidden" name="cunStat.project.id" value="${cunStat.project.id}">
			<input type="hidden" name="cunStat.cunRemark" value="${cunStat.cunRemark}">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr align="center">
						<td width="" class="tables_headercell" colspan="1">
							年度：
							<select name="cunStat.year" id="year" onchange="chooseYear(this.value);">
								<option value=""></option>
							</select>
						</td>
						<td width="" class="tables_headercell">
							时间：
							<select name="cunStat.month" id="time" style="width: 80px;">
								<option value=""></option>
							</select>
						</td>
						<!-- 
						<td width="" class="tables_headercell">
							上/下半月：
							<input type="radio" name="cunStat.half" value="1"/>
							<input type="radio" name="cunStat.half" value="2"/>
						</td>
						-->
						<td width="" class="tables_headercell">
							<input type="button" value="按条件查询" class="button" name="查询" onclick="query();">
							<c:if test="${userObj.roleType=='帮扶单位管理员'}">
								<c:if test="${empty cunStat.lock || cunStat.lock==0 || cunStat.lock==3}">
								<input type="button" value="保存" class="button" name="保存" onclick="save();">
								<input type="button" value="暂存" class="button" name="暂存" onclick="tmpSave();">
								</c:if>
								<c:if test="${not empty cunStat.lock && cunStat.lock==1}">
								<input type="button" value="请求解锁" class="button" name="请求解锁" onclick="unlockReport();">
								</c:if>
							</c:if>
							<c:if test="${userObj.roleType=='村级管理员'}">
								<input type="button" value="审核通过" class="button" name="审核通过" onclick="shenhe();">
								<input type="button" value="退回修改" class="button" name="退回修改" onclick="tuihui();">
							</c:if>
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" rowspan="2">
							帮扶对象
						</td>
						<td width="" class="tables_contentcell">
							所属镇
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; ${cunStat.project.org.cun.zhen.name }
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell">
							村名
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; ${cunStat.project.org.cun.name }
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							项目名称
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; ${cunStat.project.name }
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							总投资额（万元）
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp;  ${cunStat.project.money }
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							建设规模及内容
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp;  ${cunStat.project.content }
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							帮扶资金到位情况（万元）
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; <input value="${cunStat.money }" name="cunStat.money" type="text"/>
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							项目进展情况
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; 
							<textarea rows="5" name="cunStat.complete">${cunStat.complete }</textarea>
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							存在问题
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp;
							<textarea rows="5" name="cunStat.problem">${cunStat.problem }</textarea>
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							下一步推进措施
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; 
							<textarea rows="5" name="cunStat.content">${cunStat.content }</textarea>
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							村委会审核意见
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; 
							<input class="cun_remark" type="text" name="cunRemark" value="${cunStat.cunRemark}" readonly="readonly"/>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>