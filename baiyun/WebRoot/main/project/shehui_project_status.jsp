<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="${appPath}css/jquery.datepick.css" />
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script type="text/javascript" src="${appPath}js/jquery.datepick.js"></script>
		<script type="text/javascript" src="${appPath}js/jquery.datepick-zh-CN.js"></script>
		<script language="javascript">
<jsp:include page="../../msg.jsp"></jsp:include>
		function checkAll(obj){
			if($(obj).attr('checked')){
				$('input[type="checkbox"]').attr('checked',true);
			}else{
				$('input[type="checkbox"]').attr('checked',false);
			}
		}
		var year = '${shStat.year}';
		var time = '${shStat.month}';
		var half = '${shStat.half}';
		
		var maxYear = '${maxYear}';
		var now = new Date();
		var currYear = now.getYear()<1970?now.getYear() + 1900:now.getYear();
		maxYear = maxYear==''?currYear:parseInt(maxYear);
		
		var maxMonth = '${maxMonth}';
		maxMonth = maxMonth==''?12:parseInt(maxMonth);
		
		$(function(){
			$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
			
			for(var i=2011;i<=maxYear;i++){
				$("#year").append('<option value="'+ i +'">'+ i +'</option>');
			}
			if(year != ''){
				setTimeout(function(){ 
				  $('#year').val(year);
				  chooseYear(year);
				},1);
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
			f.action = "${appPath}pro_shStat.action";
			f.submit();
		}
		function save(){
			var rate = $('#rate').val();
			if(rate != ''){
				if(!/^\d+$/.test(rate) || parseInt(rate)>100 || parseInt(rate)<0){
					alert('总体进度只能是数字，0-100之间');
					return;
				}
			}
			var f = document.forms[0];
			f.action = "${appPath}pro_saveProShStat.action";
			f.submit();
		}
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
		<form method="get" action="${appPath}pro_saveProShStat.action" name="searchForm">
			<input type="hidden" name="shStat.id" value="${shStat.id}">
			<input type="hidden" name="shStat.project.id" value="${shStat.project.id}">
			<c:if test="${userObj.isDiv=='Y'}">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr align="center">
						<td width="" class="tables_headercell">
							年度：
							<select name="shStat.year" id="year">
								<option value=""></option>
							</select>
						</td>
						<td width="" class="tables_headercell">
							时间：
							<select name="shStat.month" id="time" style="width: 80px;">
								<option value=""></option>
							</select>
						</td>
						<td width="" class="tables_headercell">
							<input type="button" value="按条件查询" class="button" name="查询" onclick="query();">
							<input type="button" value="保存" class="button" name="保存" onclick="save();">
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							捐赠企业名称
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; ${shStat.project.org.orgName }
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							企业负责人
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; ${shStat.project.fuzeren }
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							职务
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; ${shStat.project.zhiwu }
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							区工商联职务
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; ${shStat.project.gongshangZhiwu }
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							项目落实人
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; ${shStat.project.luoshi }
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							捐赠金额（万元）
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp;  ${shStat.project.money }
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							捐赠项目名称
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; ${shStat.project.name }
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							受捐赠单位负责人
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; ${shStat.project.shouFuzeren}
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							职务
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; ${shStat.project.shouZhiwu }
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							项目内容
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; ${shStat.project.content }
						</td>
					</tr>
					
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="1" rowspan="3">
							项目用地性质
						</td>
						<td width="" class="tables_contentcell" colspan="1" rowspan="1">
							现状
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; ${shStat.project.yongdi1 }
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="1" rowspan="1">
							用地现状
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; ${shStat.project.yongdi2 }
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="1" rowspan="1">
							规划性质
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; ${shStat.project.yongdi3 }
						</td>
					</tr>
					
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							项目进度
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; <input value="${shStat.complete }" name="shStat.complete"/>
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							存在问题
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; <input value="${shStat.problem }" name="shStat.problem"/>
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							预计完成时间
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; <input value="${shStat.money }" name="shStat.money" class="datetime"/>
						</td>
					</tr>
					<tr align="center">
						<td width="" class="tables_contentcell" colspan="2">
							总体进度(%)
						</td>
						<td height="25" align="center" class="tables_contentcell" colspan="2">
							&nbsp; 
							<input value="${shStat.rate }" name="shStat.rate" id="rate" type="text"/>%
						</td>
					</tr>
				</tbody>
			</table>
			</c:if>
		</form>
	</body>
</html>