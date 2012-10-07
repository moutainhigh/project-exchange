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
		var paramY = '${reportParam.year}';
		var paramM = '${reportParam.month}';
		var paramY2 = '${reportParam.year2}';
		var paramM2 = '${reportParam.month2}';
		function statReport(){
			$(".tables_table").hide();
			$("h2").hide();
			$(".tables_search").after('<h2 style="margin: 30px auto; width:50%; padding: 10px;">统计需要一些时间，请勿进行其他操作，正在加载中。。。</h2>');
			document.forms[0].action = '${appPath}dang_report_stat.action';
			document.forms[0].submit();
		}
		function statExportReport(){
			document.forms[0].action = '${appPath}dang_report_statExport.action';
			document.forms[0].submit();
		}
		$(function(){
			var now = new Date();
			var maxYear = now.getYear()<1970?now.getYear() + 1900:now.getYear();
			for(var i=2011;i<=maxYear;i++){
				$("#year").append('<option value="'+ i +'">'+ i +'</option>');
				$("#year2").append('<option value="'+ i +'">'+ i +'</option>');
			}
			
			//修改月份的限制
			changeMonth();
			changeMonth2();
			
		});
		function changeMonth(){
			var now = new Date();
			var m = now.getMonth()+1;
			var y = now.getYear()<1970?now.getYear() + 1900:now.getYear();
			if($("#year").val() < y)
				m = 12 + 1;
			$('#month').html('');
			for(var i=1;i<m;i++){
				$('#month').append("<option value=\""+i+"\">"+i+"</option>");
			}
			setTimeout(function(){
				if(m > 1){
					$('#month').val(m-1);
				}
			},1);
			if(paramY != '' && paramM != ''){
				setTimeout(function(){
					$("#year").val(paramY);
					$("#month").val(paramM);
				},100);
			}
		}
		function changeMonth2(){
			var now = new Date();
			var m = now.getMonth()+1;
			var y = now.getYear()<1970?now.getYear() + 1900:now.getYear();
			if($("#year2").val() < y)
				m = 12 + 1;
			$('#month2').html('');
			for(var i=1;i<m;i++){
				$('#month2').append("<option value=\""+i+"\">"+i+"</option>");
			}
			setTimeout(function(){
				if(m > 1){
					$('#month2').val(m-1);
				}
			},100);
			if(paramY2 != '' && paramM2 != ''){
				setTimeout(function(){
					$("#year2").val(paramY2);
					$("#month2").val(paramM2);
				},100);
			}
		}
		</script>
		<style>
.tables_search {
	margin: 0px 0px 2px 0px;
	height: 40px;
	background-color: #418FD0;
}
h2{margin:5px auto; width: 50%; text-align:center;}
</style>
	</head>
	<body>
		<form method="get" action="${appPath}report_stat.action" name="searchForm">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
				<tbody>
					<tr>
						<td>
							您当前所处页面：党建工作统计表
						</td>
						<td align="right">
						<input type="button" class="button" value="统计" onclick="statReport();">
						</td>
						<td width="5px"></td>
					</tr>
				</tbody>
			</table>
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr>
						<td height="25" align="center" class="tables_contentcell">
							统计的年度月份
						</td>
						<td height="25" align="center" class="tables_contentcell">
							<select name="reportParam.year" id="year" onchange="changeMonth();" style="width: 60px;"></select>
							年
							<select name="reportParam.month" id="month">
								
							</select>
							月
							&nbsp;
							至
							&nbsp;
							<select name="reportParam.year2" id="year2" onchange="changeMonth2();" style="width: 60px;"></select>
							年
							<select name="reportParam.month2" id="month2">
								
							</select>
							月&nbsp;(若起至月份相同则表示一个月的时间)
						</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table data_table">
				<tbody>
					<tr align="center">
						<td width="" class="tables_headercell" rowspan="3">
							区（县）
						</td>
						<td width="" class="tables_headercell" colspan="14">
							村组织情况
						</td>
					</tr>
					<tr align="center">
						<td class="tables_headercell" rowspan="2">
							支部数（个）
						</td>
						<td class="tables_headercell" rowspan="2">
							党小组（个）
						</td>
						<td class="tables_headercell" rowspan="2">
							本村党组织支委（不含挂扶干部任职）人数（人）
						</td>
						<td class="tables_headercell" colspan="4">
							其中：年龄分布（人）
						</td>
						<td class="tables_headercell" colspan="3">
							其中：文化程度分布（人）
						</td>
						<td class="tables_headercell" rowspan="2">
							其中：女干部（人）
						</td>
						<td class="tables_headercell" rowspan="2">
							其中：交叉任村委（人）
						</td>
						<td class="tables_headercell" rowspan="2">
							其中：联系带动10户以上的农户致富能手（人）
						</td>
						<td class="tables_headercell" rowspan="2">
							2011年村干部人均工资待遇（万元/年）
						</td>
					</tr>
					<tr align="center">
						<td class="tables_headercell">
							35岁以下
						</td>
						<td class="tables_headercell">
							36-45岁
						</td>
						<td class="tables_headercell">
							45-59岁
						</td>
						<td class="tables_headercell">
							60岁以上
						</td>
						<td class="tables_headercell">
							初中及以下
						</td>
						<td class="tables_headercell">
							高中
						</td>
						<td class="tables_headercell">
							大专及以上
						</td>
					</tr>
					<c:forEach items="${statList}" var="f">
						<tr>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[0] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[1] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[2] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[3] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[4] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[5] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[6] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[7] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[8] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[9] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[10] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[11] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[12] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[13] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[14] }
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br/>
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table data_table">
				<tbody>
					<tr align="center">
						<td width="" class="tables_headercell" rowspan="3">
							区（县）
						</td>
						<td width="" class="tables_headercell" colspan="13">
							党员情况
						</td>
					</tr>
					<tr align="center">
						<td class="tables_headercell" rowspan="2">
							全村人口（人）
						</td>
						<td class="tables_headercell" rowspan="2">
							全村党员（不含挂扶干部）人数（人）
						</td>
						<td class="tables_headercell" rowspan="2">
							其中：女党员（人）
						</td>
						<td class="tables_headercell" colspan="4">
							其中：年龄分布（人）
						</td>
						<td class="tables_headercell" colspan="3">
							其中：文化程度分布（人）
						</td>
						<td class="tables_headercell" rowspan="2">
							其中：2009年6月份以来新党员（人）
						</td>
						<td class="tables_headercell" rowspan="2">
							其中：外出就业党员（人）
						</td>
						<td class="tables_headercell" rowspan="2">
							全村党员联系带动本村农户脱贫致富户数(户)
						</td>
					</tr>
					<tr align="center">
						<td class="tables_headercell">
							35岁以下
						</td>
						<td class="tables_headercell">
							36-45岁
						</td>
						<td class="tables_headercell">
							45-59岁
						</td>
						<td class="tables_headercell">
							60岁以上
						</td>
						<td class="tables_headercell">
							初中及以下
						</td>
						<td class="tables_headercell">
							高中
						</td>
						<td class="tables_headercell">
							大专及以上
						</td>
					</tr>
					<c:forEach items="${statList}" var="f">
						<tr>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[0] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[15] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[16] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[17] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[18] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[19] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[20] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[21] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[22] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[23] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[24] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[25] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[26] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[27] }
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br/>
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table data_table">
				<tbody>
					<tr align="center">
						<td width="" class="tables_headercell" rowspan="3">
							区（县）
						</td>
						<td width="" class="tables_headercell" colspan="10">
							挂扶干部参与党组织情况
						</td>
						<td width="" class="tables_headercell" colspan="9">
							党支部活动情况
						</td>
					</tr>
					<tr align="center">
						<td class="tables_headercell" rowspan="2">
							挂扶干部担任党组织支委（人）
						</td>
						<td class="tables_headercell" colspan="4">
							其中：年龄分布（人）
						</td>
						<td class="tables_headercell" colspan="3">
							其中：文化程度分布（人）
						</td>
						<td class="tables_headercell" rowspan="2">
							其中：女干部（人）
						</td>
						<td class="tables_headercell" rowspan="2">
							其中：交叉任村委（人）
						</td>
						<td class="tables_headercell" rowspan="2">
							2009年6月份以来建立完善村制度数（项）
						</td>
						<td class="tables_headercell" rowspan="2">
							2009年6月份以来组织党员组织活动次数（次）
						</td>
						<td class="tables_headercell" colspan="4">
							其中：年龄分布（人）
						</td>
						<td class="tables_headercell" rowspan="2">
							2009年6月份以来申请入党人数（人）
						</td>
						<td class="tables_headercell" rowspan="2">
							2009年6月份以来全村党建活动专项经费（万元）
						</td>
						<td class="tables_headercell" rowspan="2">
							2009年6月份以来党组织活动场所建设投入（万元）
						</td>
					</tr>
					<tr align="center">
						<td class="tables_headercell">
							35岁以下
						</td>
						<td class="tables_headercell">
							36-45岁
						</td>
						<td class="tables_headercell">
							45-59岁
						</td>
						<td class="tables_headercell">
							60岁以上
						</td>
						<td class="tables_headercell">
							初中及以下
						</td>
						<td class="tables_headercell">
							高中
						</td>
						<td class="tables_headercell">
							大专及以上
						</td>
						<td class="tables_headercell">
							支部大会（次）
						</td>
						<td class="tables_headercell">
							党小组会议（次）
						</td>
						<td class="tables_headercell">
							民主生活会（次）
						</td>
						<td class="tables_headercell">
							学习讨论活动（次）
						</td>
					</tr>
					<c:forEach items="${statList}" var="f">
						<tr>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[0] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[28] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[29] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[30] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[31] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[32] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[33] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[34] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[35] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[36] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[37] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[38] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[39] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[40] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[41] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[42] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[43] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[44] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[45] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[46] }
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</body>
</html>