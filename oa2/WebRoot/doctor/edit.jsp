<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>新增医生注册</title>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<link rel="stylesheet" type="text/css" href="${appPath}/css/styles.css">
		<link rel="stylesheet" type="text/css" href="${appPath}/css/jquery.datepick.css" />
		<script type="text/javascript" src="${appPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${appPath}/js/jquery.datepick.js"></script>
		<script type="text/javascript" src="${appPath}/js/jquery.datepick-zh-CN.js"></script>
		<script type="text/javascript">
			var msg = '${requestScope.msg}';
			if(msg != ''){
				alert(msg);
				self.location.href = '${appPath}/doctor.do?method=listDoctor';
			}
			var mymsg = '${requestScope.mymsg}';
			if(mymsg != ''){
				alert(mymsg);
			}
			var docId = '${doc.id}';
			function saveForm(){
				if(docId!=''){
					document.forms[0].action = '${appPath}/doctor.do?method=updateDoctor';
				}
				document.forms[0].submit();
			}
			var dropArr =  {Nation:'${doc.nation.id}',
							XueLi:'${doc.xueli.id}',
							Zige:'${doc.zige.id}',
							Grade:'${doc.grade.id}',
							Zhen:'${doc.areaZhen.id}',
							Cun:'${doc.areaCun.id}',
							BodyGrade:'${doc.bodyGrade.id}'};
			$(function(){
				//初始化列表数据
				$('select').each(function(){		
					if($(this).attr('id')){
						var dropdownType = $(this).attr('id');
						var thisSelect = this;
						$(this).html('<option value=""></option>');
						$.getJSON("${appPath}/ajax?time="+new Date().getTime(), {dropdownType:dropdownType}, function(json){
							if(json && json.length){
								for(var i=0;i<json.length;i++){
									var str = '<option value="'+json[i]['id']+'">'+json[i]['name']+'</option>';
									$(thisSelect).append(str);
								}
								//alert($(thisSelect).html());
								try{
									$(thisSelect).val(dropArr[dropdownType]);
								}catch(e){}								
								return false;
							}
						}); 	
					}	
				}); 	
				//初始化日期输入数据
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
			});
			function cover(id){
			     //$("select").each(function(){this.style.visibility="hidden";})
			     //选择所有的select并设置为隐藏
			      $("#coverLayer").fadeTo("fast",0.5,function(){$("#coverLayer").css("display","block");})
			                     .width(Math.max(document.documentElement.scrollWidth, document.documentElement.clientWidth))
			                     .height(Math.max(document.documentElement.scrollHeight, document.documentElement.clientHeight));
			     //显示覆盖层 并设置其高和宽
			    $("#"+id).show();
			    //显示LightBox层
			    $('select').hide();
			}
			function discover(id){
			     //$("select").each(function(){this.style.visibility="visible";})
			     $("#coverLayer").fadeOut("normal",function(){$("#coverLayer").css("display","none");})
			     $("#"+id).fadeOut("normal",function(){$("#lightBox").css("display","none");})
			     $('select').show();
			}
			function showInstr(){
				cover('lightBox');
			}	
			function showInstr2(){
				cover('lightBox2');
			}		
			function addWorkExpr(){
				var str = '';
				str += $('#work_sDate').val()+"-";
				str += $('#work_eDate').val()+" ";
				str += $('#work_org').val()+" ";
				str += $('#work_zhiwu').val()+" ";
				str += $('#work_zhengming').val()+" ";
				$('#workExpr').append(str+'\r\n');
				discover('lightBox');
			}
			function addChufaExpr(){
				var str = '';
				str += $('#chufa_sDate').val()+"-";
				str += $('#chufa_eDate').val()+" ";
				str += $('#chufa_org').val()+" ";
				str += $('#chufa_zhiwu').val()+" ";
				str += $('#chufa_zhengming').val()+" ";
				$('#chufaExpr').append(str+'\r\n');
				discover('lightBox2');
			}
			//打开window居中
			function    winOpen(Url,width,height,id)   
   			{   
   
   				ow    =    width;   
   				oh    =    height;   
   				var    xposition=0;     
   				var    yposition=0;   
   				if    ((parseInt(navigator.appVersion)    >=    4    ))   
       			{   
           			xposition    =    (screen.width    -    width)    /    2;   
           			yposition    =    (screen.height    -    height-25)    /    2;   
       			}   
       			window.open(Url,id,"width    ="+ow+",height="+oh+",scrollbars= yes,modal=yes,resizable=no,left="+xposition+",top="+yposition    );   
   			}
		</script>
	</head>
	<body>
		<div id="coverLayer" style="display: none; background: #000000; position: absolute;"></div>
		<div id="lightBox"
			style="display: none; width: 300px; height:auto; position: absolute; background: #ffffff; left: 35%; top: 50%; margin-left: -150px; margin-top: -100px; border: #00FFFF double 4px;">
			<a id="discover" href="#" onclick="discover('lightBox');" style="float:right;color:gray;">关闭</a>
			<div class="shuoming">
			  <p><strong>工作经历</strong></p>
			  <hr/>
			  <p>
			  	截止日期：<input type="text" name="work_sDate" id="work_sDate" class="datetime" style="width: 80px;"/>-
			  	<input type="text" name="work_eDate" id="work_eDate" class="datetime" style="width: 80px;"/>
			  	<br/>
			  	单位名称：<input type="text" name="work_org" id="work_org" style="width: 170px;"/>
			  	<br/>
			  	技术职务：<input type="text" name="work_zhiwu" id="work_zhiwu" style="width: 170px;"/>
			  	<br/>
			  	&nbsp;&nbsp;证明人：<input type="text" name="work_zhengming" id="work_zhengming" style="width: 170px;"/>
			  </p>
			</div>
			<p style="text-align: center; margin: 10px auto;">
				<input type="button" value=" 确定 " onclick="addWorkExpr();" />
				<input type="button" value=" 放弃 " onclick="discover('lightBox');" />
			</p>
		</div>
		<div id="lightBox2"
			style="display: none; width: 300px; height:auto; position: absolute; background: #ffffff; left: 35%; top: 50%; margin-left: -150px; margin-top: -100px; border: #00FFFF double 4px;">
			<a id="discover" href="#" onclick="discover('lightBox2');" style="float:right;color:gray;">关闭</a>
			<div class="shuoming">
			  <p><strong>处罚处分</strong></p>
			  <hr/>
			  <p>
			  	处罚日期：<input type="text" name="chufa_sDate" id="chufa_sDate" class="datetime" style="width: 80px;"/>-
			  	<input type="text" name="chufa_eDate" id="chufa_eDate" class="datetime" style="width: 80px;"/>
			  	<br/>
			  	所处单位：<input type="text" name="chufa_org" id="chufa_org" style="width: 170px;"/>
			  	<br/>
			  	处罚理由：<input type="text" name="chufa_zhiwu" id="chufa_zhiwu" style="width: 170px;"/>
			  	<br/>
			  	&nbsp;&nbsp;证明人：<input type="text" name="chufa_zhengming" id="chufa_zhengming" style="width: 170px;"/>
			  </p>
			</div>
			<p style="text-align: center; margin: 10px auto;">
				<input type="button" value=" 确定 " onclick="addChufaExpr();" />
				<input type="button" value=" 放弃 " onclick="discover('lightBox2');" />
			</p>
		</div>
		<form name="messageForm" method="post" action="${appPath}/doctor.do">
			<input type="hidden" name="method" value="addDoctor"/>
			<input type="hidden" name="doc.id" value="${doc.id}"/>
			<input type="hidden" name="doc.status" value="${doc.status}"/>
			<input type="hidden" name="doc.unregReason" value="${doc.unregReason}"/>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td height="18" align=center>
			        <font class=caption>编辑医生注册信息</font>
			      </td>
			    </tr>
			</table>
			<div style="height: 25px;"></div>
			<table width="95%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr class="list_td_title">					
					<td align="center" colspan="5">
						&nbsp;
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						姓&nbsp;&nbsp;&nbsp;&nbsp;名：<input type="text" name="doc.name" value="${doc.name}" id="docName" style="width:200px;"/>
					</td>
					<td>
						性&nbsp;&nbsp;&nbsp;&nbsp;别：
						<select name="doc.gender">
							<option value=""></option>
							<option value="true" <c:if test="${doc.gender==true}">selected="selected"</c:if>>男</option>
							<option value="false" <c:if test="${doc.gender==false}">selected="selected"</c:if>>女</option>
						</select>
					</td>
					<td>
						出生日期：<input type="text" name="doc.birthday" value="<fmt:formatDate value = "${doc.birthday}" pattern = "yyyy-MM-dd"/>" id="birthday" style="width:100px;" class="datetime"/>
					</td>
					<td>
						民&nbsp;&nbsp;&nbsp;&nbsp;族：
						<select name="doc.nation.id" id="Nation">
							<option value="">未知</option>
							<option value="1">汉族</option>
							<option value="2">满族</option>
						</select>
					</td>
					<td rowspan="4" style="width: 150px;">
						<!--照&nbsp;&nbsp;&nbsp;&nbsp;片-->
				    	<c:choose>
				    		<c:when test="${empty doc.id || empty doc.image}">
				    		<iframe src="${appPath}/upload.jsp" width="100%" height="100%" frameborder="0"></iframe>
				    		</c:when>
				    		<c:otherwise>
				    		<img src="${appPath}/photo/${doc.image}" style="display: block;margin:0 auto; height: 135px; width: 135px;"/>
				    		</c:otherwise>
				    	</c:choose>
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						身份证号：<input type="text" name="doc.idNo" value="${doc.idNo}" id="idNo" style="width:200px;"/>
					</td>
					<td colspan="2">
						家庭住址：<input type="text" name="doc.address" value="${doc.address}" id="address" style="width:300px;"/>
					</td>
					<td>
						邮&nbsp;&nbsp;&nbsp;&nbsp;编：<input type="text" name="doc.post" value="${doc.post}" id="post" style="width:200px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						学&nbsp;&nbsp;&nbsp;&nbsp;历：
						<select name="doc.xueli.id" id="XueLi">
							<option value="">未知</option>
							<option value="1">本科</option>
							<option value="2">小学</option>
						</select>
					</td>
					<td colspan="2">
						所在院系：<input type="text" name="doc.xueyuan" value="${doc.xueyuan}" id="xueyuan" style="width:300px;"/>
					</td>
					<td>
						专&nbsp;&nbsp;&nbsp;&nbsp;业：<input type="text" name="doc.major" value="${doc.major}" id="major" style="width:200px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						任职资格：
						<select name="doc.zige.id" id="Zige">
							<option value="">未知</option>
							<option value="1">高级</option>
							<option value="2">中级</option>
						</select>
					</td>
					<td colspan="2">
						注册编号：<input type="text" name="doc.zigeNo" value="${doc.zigeNo}" id="zigeNo" style="width:300px;"/>
					</td>
					<td>
						级&nbsp;&nbsp;&nbsp;&nbsp;别：
						<select name="doc.grade.id" id="Grade">
							<option value="">未知</option>
							<option value="1">高级</option>
							<option value="2">中级</option>
						</select>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="3">
						机构名称：<input type="text" name="doc.org" value="${doc.org}" id="org" style="width:400px;"/>
					</td>
					<td colspan="2">
						机构编号：<input type="text" name="doc.orgNo" value="${doc.orgNo}" id="orgNo" style="width:200px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="3">
						机构地址：<input type="text" name="doc.orgAddress" value="${doc.orgAddress}" id="orgAddress" style="width:400px;"/>
					</td>
					<td colspan="2">
						邮政编码：<input type="text" name="doc.orgPost" value="${doc.orgPost}" id="orgPost" style="width:200px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="1">
						行政区划：
						<select name="doc.areaZhen.id" id="Zhen">
							<option value="">未知</option>
							<option value="1">幸福</option>
						</select>镇&nbsp;
						<select name="doc.areaCun.id" id="Cun">
							<option value="">未知</option>
							<option value="1">幸福</option>
						</select>村
					</td>
					<td colspan="2">
						职业助师资格时间：<input type="text" name="doc.zhushiDate" value="<fmt:formatDate value = "${doc.zhushiDate}" pattern = "yyyy-MM-dd"/>" id="zhushiDate" style="width:200px;" class="datetime"/>
					</td>
					<td colspan="2">
						职业医师资格时间：<input type="text" name="doc.yishiDate" value="<fmt:formatDate value = "${doc.yishiDate}" pattern = "yyyy-MM-dd"/>" id="yishiDate" style="width:200px;" class="datetime"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="2">
						职业类别：
						<input type="text" name="doc.zhiyeGrade" value="${doc.zhiyeGrade}" id="zhiyeGrade" style="width:200px;"/>
					</td>
					<td colspan="3">
						职业科目：<input type="text" name="doc.zhiyeKemu" value="${doc.zhiyeKemu}" id="zhiyeKemu" style="width:400px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="5">
						处罚处分：
						<!-- <input type="text" name="doc.chufa" value="${doc.chufa}" id="chufa" style="width:600px;"/> -->
						<textarea name="doc.chufa" id="chufaExpr" style="width:600px; height: 50px;" readonly="readonly">${doc.chufa }</textarea>
						<a href="javascript:showInstr2();" style="color:gray;">(增加处罚处分)</a>
						<a href="javascript:void(0);" onclick="$('#chufaExpr').html('');" style="color:gray;">(清空处罚处分)</a>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="5">
						业务考核：
						<input type="text" name="doc.yewuKaohe" value="${doc.yewuKaohe}" id="yewuKaohe" style="width:600px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="5">
						其它问题：
						<input type="text" name="doc.other" value="${doc.other}" id="other" style="width:600px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="5">
						工作经历：
						<!--<input type="text" name="doc.workExpr" value="${doc.workExpr}" id="workExpr" style="width:600px;"/>-->
						<textarea name="doc.workExpr" id="workExpr" style="width:600px; height: 50px;" readonly="readonly">${doc.workExpr}</textarea>
						<a href="javascript:showInstr();" style="color:gray;">(增加工作经历)</a>
						<a href="javascript:void(0);" onclick="$('#workExpr').html('');" style="color:gray;">(清空工作经历)</a>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="5">
						审批意见：
						<input type="text" name="doc.shenpiComment" value="${doc.shenpiComment}" id="shenpiComment" style="width:600px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="1">
						身体状况：
						<select name="doc.bodyGrade.id"  id="BodyGrade">
							<option value="">未知</option>
							<option value="1">好</option>
						</select>
					</td>
					<td colspan="1">
						申请时间：
						<input type="text" name="doc.applyDate" value="<fmt:formatDate value = "${doc.applyDate}" pattern = "yyyy-MM-dd"/>" id="applyDate" style="width:100px;" class="datetime"/>
					</td>
					<td colspan="1">
						批准时间：
						<input type="text" name="doc.okDate" value="<fmt:formatDate value = "${doc.okDate}" pattern = "yyyy-MM-dd"/>" id="okDate" style="width:100px;" class="datetime"/>
					</td>
					<td colspan="2">
						批准机构：
						<input type="text" name="doc.shenpiOrg" value="${doc.shenpiOrg}" id="shenpiOrg" style="width:300px;"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="5" style="vertical-align: top;">
						备&nbsp;&nbsp;&nbsp;&nbsp;注：
						<textarea style="width: 600px;height: 50px;" name="doc.comments" id="comments">${doc.comments}</textarea>
					</td>
				</tr>
			</table>
			<c:if test="${not empty doc}">
			<hr/>
			<table width="95%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr class="list_td_title">					
					<td align="center" colspan="3">
						&nbsp;变更注册记录
					</td>
					<td align="center" width="10%">
						&nbsp;<a href="javascript:void(0);" onclick="winOpen('${appPath}/doctor.do?method=editRecord&rec_type=change&id=${doc.id}',300,300);">添加记录</a>
					</td>
				</tr>
				<tr class="list_td_title">
					<td>打印序号</td>
					<td>日期</td>
					<td>地点变更</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${crList }" var="r" varStatus="status">
				<tr class="list_td_context">
					<td>${r.pOrder }</td>
					<td>&nbsp;<fmt:formatDate value = "${r.date}" pattern = "yyyy-MM-dd"/></td>
					<td>&nbsp;${r.content }</td>
					<td>
						<a href="javascript:void(0);" onclick="winOpen('${appPath}/doctor.do?method=editRecord&rec_type=change&rec_id=${r.id}&id=${doc.id}',300,300);">编辑</a>
						<a href="javascript:void(0);" onclick="if(confirm('本操作不可恢复，确认删除吗？')){self.location.href='${appPath}/doctor.do?method=deleteRecord&rec_id=${r.id}&id=${doc.id}';}">删除</a>
					</td>
				</tr>
				</c:forEach>
			</table>
			<hr/>
			<table width="95%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr class="list_td_title">					
					<td align="center" colspan="3">
						&nbsp;培训记录
					</td>
					<td align="center" width="10%">
						&nbsp;<a href="javascript:void(0);" onclick="winOpen('${appPath}/doctor.do?method=editRecord&rec_type=training&id=${doc.id}',300,300);">添加记录</a>
					</td>
				</tr>
				<tr class="list_td_title">
					<td>打印序号</td>
					<td>日期</td>
					<td>培训内容</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${tnList }" var="r" varStatus="status">
				<tr class="list_td_context">
					<td>${r.pOrder }</td>
					<td>&nbsp;<fmt:formatDate value = "${r.date}" pattern = "yyyy-MM-dd"/></td>
					<td>&nbsp;${r.content }</td>
					<td>
						<a href="javascript:void(0);" onclick="winOpen('${appPath}/doctor.do?method=editRecord&rec_type=training&rec_id=${r.id}&id=${doc.id}',300,300);">编辑</a>
						<a href="javascript:void(0);" onclick="if(confirm('本操作不可恢复，确认删除吗？')){self.location.href='${appPath}/doctor.do?method=deleteRecord&rec_id=${r.id}&id=${doc.id}';}">删除</a>
					</td>
				</tr>
				</c:forEach>
			</table>
			<hr/>
			<table width="95%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr class="list_td_title">					
					<td align="center" colspan="3">
						&nbsp;考核记录
					</td>
					<td align="center" width="10%">
						&nbsp;<a href="javascript:void(0);" onclick="winOpen('${appPath}/doctor.do?method=editRecord&rec_type=kaohe&id=${doc.id}',300,300);">添加记录</a>
					</td>
				</tr>
				<tr class="list_td_title">
					<td>打印序号</td>
					<td>日期</td>
					<td>考核情况</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${khList }" var="r" varStatus="status">
				<tr class="list_td_context">
					<td>${r.pOrder }</td>
					<td>&nbsp;<fmt:formatDate value = "${r.date}" pattern = "yyyy-MM-dd"/></td>
					<td>&nbsp;${r.content }</td>
					<td>
						<a href="javascript:void(0);" onclick="winOpen('${appPath}/doctor.do?method=editRecord&rec_type=kaohe&rec_id=${r.id}&id=${doc.id}',300,300);">编辑</a>
						<a href="javascript:void(0);" onclick="if(confirm('本操作不可恢复，确认删除吗？')){self.location.href='${appPath}/doctor.do?method=deleteRecord&rec_id=${r.id}&id=${doc.id}';}">删除</a>
					</td>
				</tr>
				</c:forEach>
			</table>
			</c:if>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr>
					<td align="center">
						<input type="button" name="" value="保 存" onclick="saveForm();">
						<input type="button" name="" value="放 弃" onclick="self.location.href='${appPath}/doctor.do?method=listDoctor'">
						<c:if test="${not empty doc.id}">
						&nbsp;<a href="${appPath}/doctor.do?method=getDoctorInfo&id=${doc.id}" target="_blank">打印</a>
						</c:if>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

