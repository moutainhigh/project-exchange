<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
	<title>推我网 - ${t.title}</title>	
	<link href="/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/css/mian.css" rel="stylesheet" type="text/css" />
	<link href="/css/task.css" rel="stylesheet" type="text/css" />
	<script src="/js/jquery.js" type="text/javascript"></script>
	<script type="text/javascript">
		function timeToString(leftTime){
			if(leftTime < 0)
				return '';
			var m = leftTime / 1000;
			var sb = '';
			//天
			if(m / 60 / 60 / 24 > 0){
				sb += parseInt(m / 60 / 60 / 24) + "天";
			}
			m = m % (60 * 60 * 24);
			//时
			if(m / 60 / 60 > 0){
				sb += parseInt(m / 60 / 60) + "时";
			}
			m = m % (60 * 60);
			//分
			if(m / 60 > 0){
				sb += parseInt(m / 60) + "分";
			}
			m = m % 60;
			//秒
			sb += parseInt(m)+ "秒";
			return sb;
		}
		function shenhe(id,s){
			$.getJSON("/ajax_checkGaojian.do?gjId="+id+"&status="+s, function(json){				
				if(json.msg=="Y"){
					alert('审核成功');
					self.location.reload();
				}else{
					alert(json.msg);
				}
			});	
		}
	</script>
</head>
<body>
	<#include "/WEB-INF/template/include/head.ftl">
	<div id="mian">		
		<#include "/WEB-INF/template/include/nav.ftl">
		<!-- 内容区域 -->
		<div class="zj_con clearfix">
			<div class="task_info clearfix">
				<div class="taskTxt clearfix">
					<div class="left-l">
						<ul>
							<li>任务标题：<h2>${t.title}</h2></li>
							<li>任务编号：[${t.id}]</li>
							<li>悬赏金额：<span class="red fontBold font_14">￥${t.money} 元</span></li>
							<li>所属分类：<span class="gray">${t.type.parent.name} -&gt; ${t.type.name}</span></li>
							<li>中标模式：<span class="orange">计件任务模式</span></li>
							
							<li>中标所得：<span class="gray">任务发布者需要 <span class="orange">${t.gaojianMount}</span> 个稿件，每个<span class="orange">${gaojianPrice}</span>元<br>&#12288;&#12288;&#12288;&#12288;&#12288;已选定<span class="orange">${gjSucc}</span>个合格，<span class="orange">${gjFail}</span>个不合格，<span class="orange">${gjAll-gjSucc-gjFail}</span>个未审核<br>&#12288;&#12288;&#12288;&#12288;&#12288;目前还需要<span class="orange">${t.gaojianMount-gjSucc}</span>个稿件</span></li>
							<li>当前状态：<span class="green"><span class="green">${t.statusTxt}</span></span> ( <span class="orange">${gjUser}</span>人参与 <span class="orange">${gjAll}</span>个稿件 )</li>
						</ul>
					</div>
					<div class="left-r">
						<ul class="status">
							<li><span class="pic1">&#12288;</span>任务${t.statusTxt}</li>
						</ul>
						<div style="clear:both;"></div>
						<ul>
							<li>开始时间：${t.startDate?string('yyyy-MM-dd HH:mm:dd')}</li>
							<li>结束时间：${(t.endDate?string('yyyy-MM-dd HH:mm:dd'))?default('')}</li>
							<li>剩余时间：<span id="ResidualTime"><font color="green">&nbsp;</font></span>
							<script type="text/javascript">
								var endTime = '${(t.endDate.time)?default('')}';
								$(function(){
									if(endTime != ''){
										setInterval(function(){
											$('#ResidualTime font').html(timeToString(parseInt(endTime) - new Date().getTime()));
										},1000);
									}
								});
							</script> 
							</li>
						</ul>
						<#if t.status == 10>
						<ul>
							<li class="li-2"><a target="_blank" class="a4" href="/member_submitGaojian.do?task.id=${t.id}">我要投稿</a></li>
						</ul>
						</#if>
					</div>
					<div class="left-b">
						<div style="color:#F60;">尊敬的推手，请您看清楚并理解了雇主的要求后再做此任务，这样雇主才会给合格。<br>尊敬的雇主，请您认真、及时的审核推手给您完成的稿件，这是保证您推广效果的重要一环。</div>
						<ul class="pic"></ul>
						<ul>
							<li><span class="green fontBold">推我网提醒您：</span><span class="gray">推我网已收到该项目发布者的悬赏金，能确保该项目悬赏金的<span class="orange">80%</span>付与中标者！</span></li>
							<li><span class="green fontBold">版权声明：</span><span class="gray">稿件如果被客户选中，在完成赏金支付后，该作品的全部知识产权自动转移给客户；如果没有被选中，可自行处理。</span></li>
						</ul>
					</div>
				</div>
				<div class="member">
					<div class="EmployersTitle">
						<ul>
							<li>雇主信息</li>
						</ul>
					</div>
					<div class="EmployersInfo">
						<ul>
							<li>用户：${t.publisher.userName}</li>
							<li>加入时间：${t.publisher.userRegdate?string('yyyy年MM月dd日')}</li>
							<li><a href="javascript:;"><img width="81" height="22" border="0" align="absmiddle" src="/img/msg.jpg"></a></li>
						</ul>
				  </div>
				</div>
			</div>
			<div class="taskContent">
				<div class="wordContent">
					<div class="title2">
						<ul class="btn">
							<li><a href="/task_${t.id}.html">任务描述</a></li>
							<li class="focus"><a href="/gaojian_${t.id}.html">审核稿件</a></li>
						</ul>
						<!--<ul>
								<li class="sbtn"><a href="Works_62718_w.html">未审稿件(69)</a></li>
								<li class="sbtn"><a href="Works_62718_q.html">未采纳稿件(0)</a></li>
								<li class="sbtn"><a href="Works_62718_h.html">合格稿件(0)</a></li>
								<li class="sbtn2"><a href="Works_62718_a.html">所有稿件(69)</a></li>
						</ul>-->
					  <ul class="bg"></ul>
					  	<#list pageBean.resultList as g>
						<div class="txt2">
							<ul class="gaojian">
								<li><span class="gj">稿件编号：</span><span class="bh">${g.id}</span>号</li>
							</ul>
							<ul id="ulLeft_14" class="info">
								<li class="img"><img width="48" width="48" src="/img/member/nopic.jpg"></li>
								<li>${g.user.userName}<br>
								当前积分：${g.user.userScore}</li>
								<li style="padding:0 0 10px 10px;"><a href="javascript:;"><img border="0" align="absmiddle" src="/img/mail.jpg">发送站内信息</a></li>
							</ul>
							<ul id="ulRight_14" class="content" style="min-height: 151px;">
								<li class="t">
								<#if g.status == 0>
								<span style="float:right; padding:0 10px 0 0;"><a href="javascript:;" onclick="shenhe(${g.id},1)">审核通过</a>&nbsp;&nbsp;
								<a href="javascript:;" onclick="shenhe(${g.id},2)">审核不通过</a></span>
								</#if>
								<img width="16" height="16" align="absmiddle" src="/img/time.gif">&nbsp;时间:${g.submitDate?string('yyyy-MM-dd HH:mm:ss')}&#12288;&#12288;<img width="35" height="19" border="0" align="absmiddle" style="display:none;" id="beixuanIMG_5824459" src="/img/beixuan.jpg"></li>
								<#if g.status==1>
								<span style="background-image:url(/img/hege.gif); background-repeat:no-repeat;" class="draftState"></span>
								</#if>
								<#if g.status==2>
								<span style="background-image:url(/img/buhege.gif); background-repeat:no-repeat;" class="draftState"></span>
								</#if>
								<#if (userObj==null && g.hide==1) || (userObj!=null && g.task.publisher.id!=userObj.id && g.hide==1)>
								<li id="con_14" class="c"><span style="font-size:15px; color:#305B8F;">此稿件已设为隐藏稿件，只能由雇主和稿件作者可见。中标后自动公开。</span></li>
								<#else>
								<li id="con_14" class="c">
								${g.content}
								<#if g.attachment?exists><img src="/upload/gaojian/${g.attachment}"/></#if>
								</li>
								</#if>
							</ul>
						</div>
					    </#list>
					   <div style="text-align:center;">
							 共有记录：<font color="#FF3300">${pageBean.totalRow}</font>&nbsp;条&nbsp;当前：<font color="#FF3300">${pageBean.pageIndex}</font>/${pageBean.maxPage}&nbsp;页
						    <#if pageBean.isFirstPage>
						    <font color="#999999">&nbsp;首页&nbsp;&nbsp;上一页&nbsp;</font>
						    </#if>
						    <#if pageBean.pageIndex gt 1>
						    <a href="/gaojian_${g.task.id}.html?pageIndex=1">首页</a>&nbsp;
						    <a href="/gaojian_${g.task.id}.html?pageIndex=${pageBean.pageIndex-1}">上一页</a>&nbsp;
						    </#if>
						    <#if !pageBean.isLastPage>
						    <a href="/gaojian_${g.task.id}.html?pageIndex=${pageBean.pageIndex+1}">下一页</a>&nbsp;
						    <a href="/gaojian_${g.task.id}.html?pageIndex=${pageBean.maxPage}">尾页</a>&nbsp;
						    </#if>
						    <#if pageBean.isLastPage>
						    <font color="#999999">&nbsp;下一页&nbsp;&nbsp;尾页&nbsp;</font>
						    </#if>
					   </div>
					</div>
			  </div>
			</div>
		</div>
		<!-- 内容区域结束 -->
		<#include "/WEB-INF/template/include/foot.ftl">
	</div>
</body>
</html>