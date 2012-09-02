<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<meta name=ProgId content=Excel.Sheet>
		<meta name=Generator content="Microsoft Excel 11">
		<link rel=File-List href="党组织和党员情况明细表_20111080107.files/filelist.xml">
		<link rel=Edit-Time-Data href="党组织和党员情况明细表_20111080107.files/editdata.mso">
		<link rel=OLE-Object-Data href="党组织和党员情况明细表_20111080107.files/oledata.mso">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script language="javascript">
		var msg = '${msg}';
		if(msg != ''){
			alert(msg);
		}
		var year = '${r.year}';
		var time = '${r.time}';
		var lock = '${r.lock}';
		var maxYear = '${maxYear}';
		var maxMonth = '${maxMonth}';
		var now = new Date();
		var currYear = now.getYear()<1970?now.getYear() + 1900:now.getYear();
		maxYear = maxYear==''?currYear:parseInt(maxYear);
		maxMonth = maxMonth==''?12:parseInt(maxMonth);
		$(function(){
			for(var i=2011;i<=maxYear;i++){
				$("#year").append('<option value="'+ i +'">'+ i +'</option>');
			}
			if(year != ''){
				setTimeout(function(){ 
				    $('#year').val(year);
				},1);
			}		
			chooseType();
			//加锁，禁止修改
			if(lock == '1' || lock == '2' || type=='year'){
				$('input[type="text"]').attr("readonly",true);
			}	
			//自动地区数据灰化
			$('.auto_readonly').css('background','#EBEBE4');
		});
		function chooseType(){
			//2011年，去掉月度报表的第1 2 3 4 5月，改为第3-5月。5月份之后的月份正常显示。
			$('#time').attr('disabled',false);
			var str = '';
			var ms = maxMonth;
			if(currYear > $('#year').val())
				ms = 12;
			for(var i=1;i<=ms;i++){
				if($('#year').val()==2011 || year == '2011'){
					if(i<=4)
						continue;
					if(i==5){
						str += '<option value="'+i+'">第3-5月</option>';
					}else{
						str += '<option value="'+i+'">第'+i+'月</option>';
					}
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
			f.action = '${appPath}dang_report_viewReport.action';
			f.submit();
		}
		function tmpSaveReport(){
			//自动提取不得为空
			var autoPass = true;
			$('input[readonly=true]').each(function(){
				if($(this).val()==null || $(this).val()==''){
					autoPass = false;
					//alert(autoPass);
				}
			});
			//alert(autoPass);
			if(!autoPass){
				alert('灰色输入框为系统自动提取贫困村资料维护中相应数据，不允许为空，请在贫困村资料维护页面中补充完整!');
				return false;
			}
			var f = document.forms[0];
			f.action = '${appPath}dang_report_tmpSaveReport.action';
			f.submit();
		}
		function saveReport(){
			//所有项目都不得为空
			var emptyPass = true;
			$('input[type="text"]').each(function(){
				if($(this).val()==null || $(this).val()==''){
					emptyPass = false;
				}
			});
			if(!emptyPass){
				alert('填报项目必须全部填写，如无则填0');
				return false;
			}
			//自动提取不得为空
			var autoPass = true;
			$('input[readonly=true]').each(function(){
				if($(this).val()==null || $(this).val()==''){
					autoPass = false;
					//alert(autoPass);
				}
			});
			if(!autoPass){
				alert('灰色输入框为系统自动提取贫困村资料维护中相应数据，不允许为空，请在贫困村资料维护页面中补充完整!');
				return false;
			}
			//数字正则检查
			var pass = true;
			$('input[type="text"]').each(function(){
				if($(this).val()!='' && $(this).val()!=null && !/^\d+(\.\d+)?$/.test($(this).val())){
					pass = false;
					//alert($(this).attr('name'));
				}
			});
			if(!pass){
				alert('所有项目都必须是数字');
				return false;
			}
			if(confirm('报表提交后不允许修改，是否提交')){
				var f = document.forms[0];
				f.action = '${appPath}dang_report_saveReport.action';
				f.submit();
			}
		}
		function unlockReport(){
			if(confirm('确定需要解锁吗？')){
				var f = document.forms[0];
				f.action = '${appPath}dang_report_requstUnlock.action';
				f.submit();
			}
		}
		function excel(){
			var f = document.forms[0];
				f.action = '${appPath}dang_report_excelReport.action';
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
<style type="text/css">

.tip{
    position:relative;
    color:#00c;
    text-decoration:none;    
    padding:5px;
    z-index:0;
}
.tip:hover{
    background:none;
    text-decoration:none;
    color:#000;
    z-index:1;
}
.tip span {
    display: none;
    text-decoration:none;
}
.tip:hover span{
    display:block;
    position:absolute;top:20px;left:10px;
    border-bottom:0px solid #eee;
    text-decoration:none;
    border-right:0px solid #eee;
    width:300px;
}
.tip:hover span p {
    
    text-align:left;
    text-decoration:none;
    padding:5px;   
    border:1px solid #ccc;
    background:#cff;
}
#data_table td{
	text-align: center;
}
</style>
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.98in .75in .98in .75in;
	mso-header-margin:.51in;
	mso-footer-margin:.51in;
	mso-horizontal-page-align:center;
	mso-vertical-page-align:center;}
tr
	{mso-height-source:auto;
	mso-ruby-visibility:none;}
col
	{mso-width-source:auto;
	mso-ruby-visibility:none;}
br
	{mso-data-placement:same-cell;}
.style0
	{mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	white-space:nowrap;
	mso-rotate:0;
	mso-background-source:auto;
	mso-pattern:auto;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	border:none;
	mso-protection:locked visible;
	mso-style-name:常规;
	mso-style-id:0;}
td
	{mso-style-parent:style0;
	padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border:none;
	mso-background-source:auto;
	mso-pattern:auto;
	mso-protection:locked visible;
	white-space:nowrap;
	mso-rotate:0;}
.xl24
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	border:.5pt solid windowtext;}
.xl25
	{mso-style-parent:style0;
	text-align:center;
	border:.5pt solid windowtext;}
.xl26
	{mso-style-parent:style0;
	text-align:left;
	border:.5pt solid windowtext;}
.xl27
	{mso-style-parent:style0;
	border:.5pt solid windowtext;}
.xl28
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	text-align:center;
	border:.5pt solid windowtext;}
.xl29
	{mso-style-parent:style0;
	font-weight:700;
	text-align:right;
	border:.5pt solid windowtext;}
.xl30
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	border:.5pt solid windowtext;}
.xl31
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	border:.5pt solid windowtext;}
ruby
	{ruby-align:left;}
rt
	{color:windowtext;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-char-type:none;
	display:none;}
-->
</style>
	</head>
	<body>
		<form method="get" action="${appPath}report_saveReport1.action" name="searchForm">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
				<tbody>
					<tr>
						<td>
							您当前所处页面：党建报表维护&gt;&gt;党建报表填报
						</td>
						<td align="right">&nbsp;
						</td>
						<td width="5px">&nbsp;</td>
					</tr>
				</tbody>
			</table>
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr align="center">
						<td width="" class="tables_headercell">
							年度：
							<select name="r.year" id="year" onchange="chooseType();" style="width: 60px;">
								<option value=""></option>
							</select>
						</td>
						<td width="" class="tables_headercell">
							月份：
							<select name="r.time" id="time">
								<option value=""></option>
							</select>
						</td>
						<td width="" class="tables_headercell">
							<input type="button" value="按条件查询" class="button" name="查询" onclick="query();">
							<c:if test="${empty r.lock || r.lock==0 || r.lock==3}">
							<input type="button" value="保存" class="button" name="保存" onclick="saveReport();">
							<c:if test="${showZanCun}"><input type="button" value="暂存" class="button" name="暂存" onclick="tmpSaveReport();"></c:if>
							</c:if>
							<c:if test="${not empty r.lock && r.lock==1}">
							<input type="button" value="请求解锁" class="button" name="请求解锁" onclick="unlockReport();">
							</c:if>
							<input type="button" value="Excel导出" class="button" name="Excel导出" onclick="excel();">
						</td>
					</tr>
					<tr>
						<td class="tables_contentcell" colspan="4" align="center">
							
<table x:str border=1 cellpadding=0 cellspacing=0 width=737 style='border-collapse:
 collapse;table-layout:fixed;width:554pt'>
 <col width=72 span=2 style='width:54pt'>
 <col width=194 style='mso-width-source:userset;mso-width-alt:6208;width:146pt'>
 <col width=262 style='mso-width-source:userset;mso-width-alt:8384;width:197pt'>
 <col width=137 style='mso-width-source:userset;mso-width-alt:4384;width:103pt'>
 <tr height=30 style='height:22.5pt'>
  <td height=30 class=xl27 width=72 style='height:22.5pt;width:54pt'>　</td>
  <td colspan=4 class=xl28 width=665 style='border-left:none;width:500pt'>五华县华阳镇红洞村党组织和党员情况明细表</td>
 </tr>
 <!-- 
 <tr height=25 style='height:18.75pt'>
  <td colspan=3 height=25 class=xl29 style='height:18.75pt'><span
  style='mso-spacerun:yes'>&nbsp;</span>扶贫“双到”台账编码：</td>
  <td class=xl30 style='border-top:none;border-left:none'>20111080107</td>
  <td class=xl30 style='border-top:none;border-left:none'>　</td>
 </tr> -->
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl24 style='height:16.5pt;border-top:none'>序号</td>
  <td colspan=3 class=xl24 style='border-left:none'>项<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>目</td>
  <td class=xl24 style='border-top:none;border-left:none'>数量</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl25 style='height:16.5pt;border-top:none'>一</td>
  <td colspan=4 class=xl24 style='border-left:none'>村组织情况</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl25 style='height:16.5pt;border-top:none' x:num="1">1</td>
  <td colspan=3 class=xl25 style='border-left:none'>支部数（个）</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item1" value="${r.item1}" /></td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl25 style='height:16.5pt;border-top:none' x:num="2">2</td>
  <td colspan=3 class=xl25 style='border-left:none'>党小组（个）</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item2" value="${r.item2}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl25 style='height:16.5pt;border-top:none' x:num="3">3</td>
  <td colspan=3 class=xl25 style='border-left:none'>本村党组织支委（不含挂扶干部任职）人数（人）</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item3" value="${r.item3}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td rowspan=4 height=88 class=xl25 style='height:66.0pt;border-top:none'
  x:num="4">4</td>
  <td colspan=2 rowspan=4 class=xl25>其中：年龄分布（人）</td>
  <td class=xl26 style='border-top:none;border-left:none'>35岁以下</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item4" value="${r.item4}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl26 style='height:16.5pt;border-top:none;border-left:
  none'>36-45岁</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item5" value="${r.item5}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl26 style='height:16.5pt;border-top:none;border-left:
  none'>45-59岁</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item6" value="${r.item6}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl26 style='height:16.5pt;border-top:none;border-left:
  none'>60岁以上</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item7" value="${r.item7}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td rowspan=3 height=66 class=xl25 style='height:49.5pt;border-top:none'
  x:num="5">5</td>
  <td colspan=2 rowspan=3 class=xl25>其中：文化程度分布（人）</td>
  <td class=xl26 style='border-top:none;border-left:none'>初中及以下</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item8" value="${r.item8}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl26 style='height:16.5pt;border-top:none;border-left:
  none'>高中</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item9" value="${r.item9}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl26 style='height:16.5pt;border-top:none;border-left:
  none'>大专及以上</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item10" value="${r.item10}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl25 style='height:16.5pt;border-top:none' x:num="6">6</td>
  <td colspan=3 class=xl25 style='border-left:none'>其中：女干部（人）</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item11" value="${r.item11}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl25 style='height:16.5pt;border-top:none' x:num="7">7</td>
  <td colspan=3 class=xl25 style='border-left:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>其中：交叉任村委（人）</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item12" value="${r.item12}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl25 style='height:16.5pt;border-top:none' x:num="8">8</td>
  <td colspan=3 class=xl25 style='border-left:none'>其中：联系带动10户以上的农户致富能手（人）</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item13" value="${r.item13}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl25 style='height:16.5pt;border-top:none' x:num="9">9</td>
  <td colspan=3 class=xl25 style='border-left:none'>2011年村干部人均工资待遇（万元/年）</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item14" value="${r.item14}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl24 style='height:16.5pt;border-top:none'>二</td>
  <td colspan=4 class=xl24 style='border-left:none'>党员情况</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl25 style='height:16.5pt;border-top:none' x:num="10">10</td>
  <td colspan=3 class=xl25 style='border-left:none'>全村人口（人）</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item15" value="${r.item15}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl25 style='height:16.5pt;border-top:none' x:num="11">11</td>
  <td colspan=3 class=xl25 style='border-left:none'>全村党员（不含挂扶干部）人数（人）</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item16" value="${r.item16}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl25 style='height:16.5pt;border-top:none' x:num="12">12</td>
  <td colspan=3 class=xl25 style='border-left:none'>其中：女党员（人）</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item17" value="${r.item17}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td rowspan=4 height=88 class=xl25 style='height:66.0pt;border-top:none'
  x:num="13">13</td>
  <td colspan=2 rowspan=4 class=xl25>其中：年龄分布（人）</td>
  <td class=xl26 style='border-top:none;border-left:none'>35岁以下</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item18" value="${r.item18}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl26 style='height:16.5pt;border-top:none;border-left:
  none'>36-45岁</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item19" value="${r.item19}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl26 style='height:16.5pt;border-top:none;border-left:
  none'>45-59岁</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item20" value="${r.item20}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl26 style='height:16.5pt;border-top:none;border-left:
  none'>60岁以上</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item21" value="${r.item21}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td rowspan=3 height=66 class=xl25 style='height:49.5pt;border-top:none'
  x:num="14">14</td>
  <td colspan=2 rowspan=3 class=xl25>其中：文化程度分布（人）</td>
  <td class=xl26 style='border-top:none;border-left:none'>初中及以下</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item22" value="${r.item22}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl26 style='height:16.5pt;border-top:none;border-left:
  none'>高中</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item23" value="${r.item23}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl26 style='height:16.5pt;border-top:none;border-left:
  none'>大专及以上</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item24" value="${r.item24}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl25 style='height:16.5pt;border-top:none' x:num="15">15</td>
  <td colspan=3 class=xl25 style='border-left:none'>其中：2009年6月份以来新党员（人）</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item25" value="${r.item25}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl25 style='height:16.5pt;border-top:none' x:num="16">16</td>
  <td colspan=3 class=xl25 style='border-left:none'>其中：外出就业党员（人）</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item26" value="${r.item26}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl25 style='height:16.5pt;border-top:none' x:num="17">17</td>
  <td colspan=3 class=xl25 style='border-left:none'>全村党员联系带动本村农户脱贫致富户数(户)</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item27" value="${r.item27}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl25 style='height:16.5pt;border-top:none'>三</td>
  <td colspan=4 class=xl24 style='border-left:none'>挂扶干部参与党组织情况</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl25 style='height:16.5pt;border-top:none' x:num="18">18</td>
  <td colspan=3 class=xl25 style='border-left:none'>挂扶干部担任党组织支委（人）</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item28" value="${r.item28}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td rowspan=4 height=88 class=xl25 style='height:66.0pt;border-top:none'
  x:num="19">19</td>
  <td colspan=2 rowspan=4 class=xl25>其中：年龄分布（人）</td>
  <td class=xl26 style='border-top:none;border-left:none'>35岁以下</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item29" value="${r.item29}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl26 style='height:16.5pt;border-top:none;border-left:
  none'>36-45岁</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item30" value="${r.item30}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl26 style='height:16.5pt;border-top:none;border-left:
  none'>45-59岁</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item31" value="${r.item31}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl26 style='height:16.5pt;border-top:none;border-left:
  none'>60岁以上</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item32" value="${r.item32}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td rowspan=3 height=66 class=xl25 style='height:49.5pt;border-top:none'
  x:num="20">20</td>
  <td colspan=2 rowspan=3 class=xl25>其中：文化程度分布（人）</td>
  <td class=xl26 style='border-top:none;border-left:none'>初中及以下</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item33" value="${r.item33}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl26 style='height:16.5pt;border-top:none;border-left:
  none'>高中</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item34" value="${r.item34}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl26 style='height:16.5pt;border-top:none;border-left:
  none'>大专及以上</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item35" value="${r.item35}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl25 style='height:16.5pt;border-top:none' x:num="21">21</td>
  <td colspan=3 class=xl25 style='border-left:none'>其中：女干部（人）</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item36" value="${r.item36}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl25 style='height:16.5pt;border-top:none' x:num="22">22</td>
  <td colspan=3 class=xl25 style='border-left:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>其中：交叉任村委（人）</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item37" value="${r.item37}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl24 style='height:16.5pt;border-top:none'>四</td>
  <td colspan=4 class=xl24 style='border-left:none'>党支部活动情况</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl25 style='height:16.5pt;border-top:none' x:num="23">23</td>
  <td colspan=3 class=xl25 style='border-left:none'>2009年6月份以来建立完善村制度数（项）</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item38" value="${r.item38}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td rowspan=5 height=110 class=xl25 style='height:82.5pt;border-top:none'
  x:num="24">24</td>
  <td colspan=3 class=xl25 style='border-left:none'>2009年6月份以来组织党员组织活动次数（次）</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item39" value="${r.item39}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=2 rowspan=4 height=88 class=xl25 style='height:66.0pt'>其中：活动类别</td>
  <td class=xl27 style='border-top:none;border-left:none'>支部大会（次）</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item40" value="${r.item40}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl27 style='height:16.5pt;border-top:none;border-left:
  none'>党小组会议（次）</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item41" value="${r.item41}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl27 style='height:16.5pt;border-top:none;border-left:
  none'>民主生活会（次）</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item42" value="${r.item42}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl27 style='height:16.5pt;border-top:none;border-left:
  none'>学习讨论活动（次）</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item43" value="${r.item43}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl25 style='height:16.5pt;border-top:none' x:num="25">25</td>
  <td colspan=3 class=xl25 style='border-left:none'>2009年6月份以来申请入党人数（人）</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item44" value="${r.item44}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl25 style='height:16.5pt;border-top:none' x:num="26">26</td>
  <td colspan=3 class=xl25 style='border-left:none'>2009年6月份以来全村党建活动专项经费（万元）</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item45" value="${r.item45}" />　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl25 style='height:16.5pt;border-top:none' x:num="27">27</td>
  <td colspan=3 class=xl25 style='border-left:none'>2009年6月份以来党组织活动场所建设投入（万元）</td>
  <td class=xl24 style='border-top:none;border-left:none'><input type="text" name="r.item46" value="${r.item46}" />　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td colspan=5 height=19 class=xl31 style='height:14.25pt'>
  	统计截至<input type="text" name="r.date" value="<fmt:formatDate value="${r.date}" pattern="yyyy-MM-dd"/>"/>(格式：2012-02-25)
  	填报人：<input type="text" name="r.item47" value="${r.item47}" />
  	联系电话：<input type="text" name="r.item48" value="${r.item48}" /></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=72 style='width:54pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=194 style='width:146pt'></td>
  <td width=262 style='width:197pt'></td>
  <td width=137 style='width:103pt'></td>
 </tr>
 <![endif]>
</table>							
														
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>