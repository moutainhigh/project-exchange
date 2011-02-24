<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>${appTitle}</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link href="${appPath}html/css/style.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="${appPath}html/css/jquery.datepick.css" />
		<script src="${appPath}html/script/jquery.js"></script>
		<script src="${appPath}html/script/common.js"></script>
		<script type="text/javascript" src="${appPath}html/script/jquery.datepick.js"></script>
		<script type="text/javascript" src="${appPath}html/script/jquery.datepick-zh-CN.js"></script>
		<script type="text/javascript">
			$(function(){
				
			});
		</script>
	</head>
	<body>
		<form action="${appPath}data_saveRate.htm" method="get">
			<input type="hidden" name="rate.id" value="${rate.id}" />
			<div class="page_title">
				饲料管理系统 > 单据管理 > 新建单据
			</div>
			<jsp:include page="../../msg.jsp"></jsp:include>
			<br />
			发料计划
			<span class="red_star">(此项为农场负责人填写)</span>：
			<table class="query_form_table">
				<tr>
					<th>
						单据编号
					</th>
					<td>
						<span class="red_star">(单据编号提交以后产生)</span>
					</td>
					<th>
						当前单据状态
					</th>
					<td>
						拟制中
					</td>
				</tr>
				<tr>
					<th>
						养殖户姓名
					</th>
					<td>
						<input value="黄颂和" />
						<span class="red_star">*(务必准确)</span>
					</td>
					<th>
						农场
					</th>
					<td>
						<select>
							<option>
								请选择...
							</option>
							<option selected>
								海北
							</option>
							<option>
								金港
							</option>
							<option>
								三仓
							</option>
							<option>
								仓东
							</option>
						</select>
						<span class="red_star">*</span>
					</td>
				</tr>
				<tr>
					<th>
						饲料厂商
					</th>
					<td>
						<select>
							<option>
								请选择...
							</option>
							<option selected>
								正大
							</option>
							<option>
								通威
							</option>
							<option>
								海辰
							</option>
							<option>
								南山
							</option>
							<option>
								天邦
							</option>
						</select>
						<span class="red_star">*</span>
					</td>
					<th>
						型号
					</th>
					<td>
						<input value="2732" />
						<span class="red_star">*</span>
					</td>
				</tr>
				<tr>
					<th>
						规格
					</th>
					<td>
						<input value="2.0" />
						<span class="red_star">*</span>
					</td>
					<th>
						吨数
					</th>
					<td>
						<input value="10" />
						<span class="red_star">*(吨)</span>
					</td>
				</tr>
				<tr>
					<th>
						申请备注
					</th>
					<td>
						<input value="饲料厂送料申请0.16吨" size="30" />
					</td>
					<th>
						计划到料日期
					</th>
					<td>
						<input value="2011-1-11" style="width: 20%" />
					</td>
				</tr>

			</table>
			<br />
			<span style="display: true;"> 代理配置<span class="red_star">(此项为饲料经理填写)</span>：
				<table class="query_form_table" id="table1">
					<tr>

						<th>
							供货饲料厂
						</th>
						<td>
							<select>
								<option>
									请选择...
								</option>
								<option selected>
									连云港正大
								</option>
								<option>
									盐城天邦
								</option>
								<option>
									南通天邦
								</option>
								<option>
									南通南山
								</option>
							</select>
							<span class="red_star">*</span>
						</td>

						<th>
							是否同意
						</th>
						<td>
							<input type="radio" name="result" value="0">
							通过
							</input>
							<input type="radio" name="result" value="1">
							驳回
							</input>
						</td>
					</tr>

					<tr>


						<th>
							饲料经理意见
						</th>
						<td colspan=3>
							<input value="同意发料，请正大速办！" name="T6" size="100" />
							<span class="red_star">*</span>
						</td>

					</tr>
				</table> <br /> 发料配置<span class="red_star">(此项农场负责人不可见)</span>：
				<table class="query_form_table" id="table1">
					<tr>

						<th>
							开票价格
						</th>
						<td>
							<input value="3430" name="T1" size="20" />
							<span class="red_star">*</span>
						</td>

						<th>
							代理费单价
						</th>
						<td>
							<input value="250" name="T5" size="20" />
							<span class="red_star">*</span>
						</td>
					</tr>
					<tr>

						<th>
							运输人
						</th>
						<td>
							<input value="姚定广" name="T6" size="20" />
							<span class="red_star">*</span>
						</td>
						<th>
							票号
						</th>
						<td>
							<input value="00000123" name="T6" size="20" />
							<span class="red_star">*</span>
						</td>

					</tr>
					<tr>


						<th>
							备注
						</th>
						<td colspan=3>
							<input value="同意，已督促发料，预计两日内到达" name="T6" size="100" />
							<span class="red_star">*</span>
						</td>

					</tr>
				</table> 审批记录：
				<table class="data_list_table">
					<tr>
						<th>
							编号
						</th>
						<th>
							操作人
						</th>
						<th>
							操作时间
						</th>
						<th>
							操作结果
						</th>
					</tr>
					<tr>
						<td class="list_data_text">
							1
						</td>
						<td class="list_data_text">
							沈晨
						</td>
						<td class="list_data_text">
							2010-10-10
						</td>
						<td class="list_data_text">
							同意发料，请饲料厂速度处理。
						</td>
					</tr>
				</table> <br>
				<div class="button_bar">
					<button class="common_button" onclick="back();">
						返回
					</button>
					<button class="common_button" onclick="save('dict.html');">
						提交
					</button>
					<button class="common_button" onclick="save('dict.html');">
						保存为草稿
					</button>
				</div>
		</form>
	</body>
</html>
