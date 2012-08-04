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
		function statReport(){
			$(".tables_table").hide();
			$(".tables_search").after('<h2 style="margin: 30px auto; width:50%; padding: 10px;">统计需要一些时间，请勿进行其他操作，正在加载中。。。</h2>');
			document.forms[0].action = '${appPath}report_stat.action';
			document.forms[0].submit();
		}
		function statExportReport(){
			document.forms[0].action = '${appPath}report_statExport.action';
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
			},100);
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
		<form method="get" action="${appPath}report_stat.action" name="searchForm">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
				<tbody>
					<tr>
						<td>
							您当前所处页面：“双到”工作统计表
						</td>
						<td align="right">
						<input type="button" class="button" value="统计" onclick="statReport();">
						<input type="button" class="button" value="导出统计报表" onclick="statExportReport();">
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
						<td height="28" width="" class="tables_headercell" rowspan="2">
							分类
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							区（县）
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							贫困户户数（户）
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							贫困户人数（人）
						</td>
						<td width="" class="tables_headercell" colspan="4">
							有劳动力
						</td>
						<td width="" class="tables_headercell" colspan="4">
							无劳动力
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							危房户
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							贫困户去世、失踪等情况(户) 
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							预计本年脱贫户数(户) 
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							预计本年脱贫人数(人) 
						</td>
					</tr>
					<tr align="center">
						<td class="tables_headercell">
							低保对象(户) 
						</td>
						<td class="tables_headercell"">
							低保对象(人) 
						</td>
						<td class="tables_headercell"">
							低收入困难家庭(户) 
						</td>
						<td class="tables_headercell"">
							低收入困难家庭(人) 
						</td>
						<td class="tables_headercell">
							低保对象(户) 
						</td>
						<td class="tables_headercell"">
							低保对象(人) 
						</td>
						<td class="tables_headercell"">
							低收入困难家庭(户) 
						</td>
						<td class="tables_headercell"">
							低收入困难家庭(人) 
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
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[15] }
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br/>
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table data_table">
				<tbody>
					<tr align="center">
						<td height="28" width="" class="tables_headercell" rowspan="2">
							分类
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							区（县）
						</td>
						<td width="" class="tables_headercell" colspan="2">
							到村到户 
						</td>
						<td width="" class="tables_headercell" colspan="2">
							农业生产 
						</td>
						<td width="" class="tables_headercell" colspan="2">
							劳动力转移 
						</td>
						<td width="" class="tables_headercell" colspan="2">
							培训 
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							完成危房改造(户)
						</td>
						<td width="" class="tables_headercell" colspan="2">
							保障 
						</td>
						<td width="" class="tables_headercell" colspan="3">
							助学  
						</td>
					</tr>
					<tr align="center">
						<td class="tables_headercell">
							帮扶单位领导(人次) 
						</td>
						<td class="tables_headercell"">
							帮扶单位干部　职工(人次) 
						</td>
						<td class="tables_headercell"">
							种植(户)
						</td>
						<td class="tables_headercell"">
							养殖(户) 
						</td>
						<td class="tables_headercell">
							务工(人) 
						</td>
						<td class="tables_headercell"">
							创业(人) 
						</td>
						<td class="tables_headercell"">
							农业科技培训(人次)
						</td>
						<td class="tables_headercell"">
							就业技能培训(人次)
						</td>
						<td class="tables_headercell"">
							参加农村合作医疗(人)
						</td>
						<td class="tables_headercell"">
							参加农村养老保险(人) 
						</td>
						<td class="tables_headercell"">
							义务教育阶段(人) 
						</td>
						<td class="tables_headercell"">
							高中、职高、技校、中专等(人) 
						</td>
						<td class="tables_headercell"">
							大专、本科以上(人)
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
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[28] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[29] }
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br/>
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table data_table">
				<tbody>
					<tr align="center">
						<td height="28" width="" class="tables_headercell" rowspan="2">
							分类
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							区（县）
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							产业发展带动农户(户) 
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							上年村级集体经济收入(元) 
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							预计今年村级集体经济收入(元)
						</td>
						<td width="" class="tables_headercell" colspan="3">
							"两委"班子 
						</td>
						<td width="" class="tables_headercell" colspan="4">
							文化活动 
						</td>
						<td width="" class="tables_headercell" colspan="6">
							村集体项目   
						</td>
					</tr>
					<tr align="center">
						<td class="tables_headercell">
							组织活动(次)
						</td>
						<td class="tables_headercell"">
							扶贫工作会议(次) 
						</td>
						<td class="tables_headercell"">
							发展新党员(人) 
						</td>
						<td class="tables_headercell"">
							文娱体育(次)
						</td>
						<td class="tables_headercell">
							送医送药(次)
						</td>
						<td class="tables_headercell"">
							科技下乡(次) 
						</td>
						<td class="tables_headercell"">
							其他(次) 
						</td>
						<td class="tables_headercell"">
							工业开发项目(个)
						</td>
						<td class="tables_headercell"">
							商贸旅游项目(个) 
						</td>
						<td class="tables_headercell"">
							农业开发项目(个) 
						</td>
						<td class="tables_headercell"">
							手工加工项目(个) 
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
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br/>
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table data_table">
				<tbody>
					<tr align="center">
						<td height="28" width="" class="tables_headercell" rowspan="2">
							分类
						</td>
						<td width="" class="tables_headercell" rowspan="2">
							区（县）
						</td>
						<td width="" class="tables_headercell" colspan="2">
							村集体项目 
						</td>
						<td width="" class="tables_headercell" colspan="4">
							基础建设 
						</td>
						<td width="" class="tables_headercell" colspan="3">
							农田建设 
						</td>
						<td width="" class="tables_headercell" colspan="6">
							建设或改造村公共文化卫生设施
						</td>
					</tr>
					<tr align="center">
						<td class="tables_headercell"">
							招商引资项目(个) 
						</td>
						<td class="tables_headercell"">
							企业捐建项目(个) 
						</td>
						<td class="tables_headercell"">
							硬底化村道(公里) 
						</td>
						<td class="tables_headercell"">
							安装路灯村道(公里)
						</td>
						<td class="tables_headercell">
							二次改水工程(个) 
						</td>
						<td class="tables_headercell"">
							生活污水处理设施(个) 
						</td>
						<td class="tables_headercell"">
							农田水利设施(个) 
						</td>
						<td class="tables_headercell"">
							受益农田(鱼塘)面积(亩)
						</td>
						<td class="tables_headercell"">
							标准农田(鱼塘)(亩) 
						</td>
						<td class="tables_headercell"">
							村委会(个) 
						</td>
						<td class="tables_headercell"">
							文化室(个) 
						</td>
						<td class="tables_headercell"">
							卫生站(个) 
						</td>
						<td class="tables_headercell"">
							环卫设施(个) 
						</td>
						<td class="tables_headercell"">
							体育设施(个) 
						</td>
						<td class="tables_headercell"">
							其他(个) 
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
								&nbsp; ${f[44] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[45] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[46] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[47] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[48] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[49] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[50] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[51] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[52] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[53] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[54] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[55] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[55] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[56] }
							</td>
							<td align="center" class="tables_contentcell">
								&nbsp; ${f[57] }
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</body>
</html>