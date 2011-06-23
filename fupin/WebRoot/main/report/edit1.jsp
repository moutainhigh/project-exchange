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
		function chooseType(type){
			if('year' == type){
				$('#time').attr('disabled',true);
			}else if('season' == type){
				$('#time').attr('disabled',false);
				var str = '';
				for(var i=1;i<=4;i++){
					str += '<option value="'+i+'">第'+i+'季度</option>';
				}
				$('#time').html(str);
			}else if('month' == type){
				$('#time').attr('disabled',false);
				var str = '';
				for(var i=1;i<=12;i++){
					str += '<option value="'+i+'">第'+i+'月</option>';
				}
				$('#time').html(str);
			}
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
	</head>
	<body>
		<form method="get" action="${appPath}report_saveReport1.action" name="searchForm">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
				<tbody>
					<tr>
						<td>
							您当前所处页面：报表维护&gt;&gt;工作统计表
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
							<select name="year" id="year">
								<option value=""></option>
								<option value="2011">2011</option>
								<option value="2012">2012</option>
							</select>
						</td>
						<td width="" class="tables_headercell">
							类型：
							<select name="type" id="reportType" onchange="chooseType(this.value);">
								<option value=""></option>
								<option value="year">年度报表</option>
								<option value="season">季度报表</option>
								<option value="month">月度报表</option>
							</select>
						</td>
						<td width="" class="tables_headercell">
							时间：
							<select name="time" id="time">
								<option value=""></option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="tables_contentcell" colspan="3" align="center">
							<table id="data_table" cellspacing="0" cellpadding="0" border="0" class="tables_table" style="margin: 5px 10px;width:85%;" align="center">
								<tr>
									<td align="center" class="tables_headercell" colspan="4">帮扶到户</td>
								</tr>
								<tr>
									<td class="tables_contentcell" colspan="3">
									帮扶单位
									</td>
									<td class="tables_contentcell" width="50%">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" colspan="3">
									贫困村
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" rowspan="12">
									1.贫困户基本情况
									</td>
									<td class="tables_contentcell" colspan="2">
									贫困户户数(户)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" colspan="2">
									贫困户人数(人)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" rowspan="4">
									有劳动能力
									</td>
									<td class="tables_contentcell">
									低保对象(户)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									低保对象(人)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									低收入困难家庭(户)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									低收入困难家庭(人)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" rowspan="4">
									无劳动能力
									</td>
									<td class="tables_contentcell">
									低保对象(户)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									低保对象(人)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									低收入困难家庭(户)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									低收入困难家庭(人)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" colspan="2">
									危房户(户)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" colspan="2">
									贫困户去世、失踪等情况(户)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" rowspan="2">
									预计脱贫
									</td>
									<td class="tables_contentcell" colspan="2">
									预计本年脱贫户数(户)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" colspan="2">
									预计本年脱贫人数(人)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" rowspan="15">
									2.贫困户帮扶措施落实情况
									</td>
									<td class="tables_contentcell" rowspan="2">
									到村到户
									</td>
									<td class="tables_contentcell">
									帮扶单位领导(人次)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									帮扶单位干部　职工(人次)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" rowspan="2">
									农业生产
									</td>
									<td class="tables_contentcell">
									种植(户)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									养殖(户)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" rowspan="2">
									劳动力转移
									</td>
									<td class="tables_contentcell">
									务工(人)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									创业(人)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" rowspan="2">
									培训
									</td>
									<td class="tables_contentcell">
									农业科技培训(人次)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									就业技能培训(人次)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" colspan="2">
									完成危房改造(户)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" rowspan="2">
									保障
									</td>
									<td class="tables_contentcell">
									参加农村合作医疗(人)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									参加农村养老保险(人)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" rowspan="3">
									助学
									</td>
									<td class="tables_contentcell">
									义务教育阶段(人)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									高中、职高、技校、中专等(人)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									大专、本科以上(人)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" colspan="2">
									产业发展带动农户(户)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td align="center" class="tables_headercell" colspan="4">帮扶到村</td>
								</tr>
								<tr>
									<td class="tables_contentcell" colspan="3">
									上年村级集体经济收入(元)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" colspan="3">
									预计今年村级集体经济收入(元)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" rowspan="26">
									3.贫困村帮扶措施落实情况
									</td>
									<td class="tables_contentcell" rowspan="3">
									"两委"班子
									</td>
									<td class="tables_contentcell">
									组织活动(次)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									扶贫工作会议(次)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									发展新党员(人)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" rowspan="4">
									文化活动
									</td>
									<td class="tables_contentcell">
									文娱体育(次)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									送医送药(次)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									科技下乡(次)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									其他(次)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" rowspan="6">
									村集体项目
									</td>
									<td class="tables_contentcell">
									工业开发项目(个)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									商贸旅游项目(个)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									农业开发项目(个)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									手工加工项目(个)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									招商引资项目(个)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									企业捐建项目(个)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" rowspan="4">
									基础建设
									</td>
									<td class="tables_contentcell">
									硬底化村道(公里)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									安装路灯村道(公里)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									二次改水工程(个)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									生活污水处理设施(个)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" rowspan="3">
									农田建设
									</td>
									<td class="tables_contentcell">
									农田水利设施(个)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									受益农田(鱼塘)面积(亩)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									标准农田(鱼塘)(亩)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" rowspan="6">
									建设或改造村公共文化卫生设施
									</td>
									<td class="tables_contentcell">
									村委会(个)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									文化室(个)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									卫生站(个)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									环卫设施(个)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									体育设施(个)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									其他(个)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
							</table>							
						</td>
					</tr>
					<tr>
						<td align="center" class="tables_contentcell" colspan="3">
						<input type="submit" value="保存" class="button" name="保存">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>