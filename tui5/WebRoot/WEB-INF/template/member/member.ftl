<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset==gbk" />
	<title>推我网 - 会员中心</title>	
	<link href="/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/css/mian.css" rel="stylesheet" type="text/css" />
	<link href="/css/member.css" rel="stylesheet" type="text/css" />
	<script src="/js/jquery.js" type="text/javascript"></script>
	<script src="/js/member.js" type="text/javascript"></script>
</head>
<body>
	<#include "/WEB-INF/template/include/head.ftl">
	<div id="mian">		
		<#include "/WEB-INF/template/include/member_nav.ftl">
		<!-- 内容区域 -->
		<div class="body_content">
			<#include "/WEB-INF/template/include/member_left.ftl">
			<div class="center_body">
			    <div class="m-box-1">
				    <div class="box-1">
					    <ul>
						    <li>我的信息</li>
						</ul>
					</div>
					<div class="box-2">
					
					    <div class="box-2-content">
						    <ul>
							    <li class="pic"><img width="120" height="120" border="0" src="/img/member/nopic.jpg"></li>
								<li class="l1">
								<p>用户：<span class="redTxt font14">throne212</span></p>
								<p>上次登录时间：${(userObj.userLastdate)?string('yyyy-MM-dd HH:mm:ss')}</p>
								<p>当前账户余额：<span class="redTxt font14 fontBold">${userObj.userAccount}元</span></p>
								<p>当前积分：<span class="redTxt font14 fontBold">${userObj.userScore}</span></p>
								<p><a target="_blank" title="我要充值" href="javascript:;"><img border="0" align="absmiddle" src="/img/member/cz_btn.gif"></a></p>
							  </li>
							</ul>
							<ul>
								<li>&#12288;<a title="我要发布任务" class="font14 fontBold" style="color:#C30;" href="/member_publish.do"><u>要推广，我要发布任务</u></a>&#12288;
								我已发布的任务（<span class="redTxt">${taskMount}</span>）个
								</li>
								<li>&#12288;<a title="我要交稿" class="font14 fontBold" style="color:#C30;" href="/member_myTaskList.do"><u>我要交稿</u></a>&#12288;
								我交稿（<span class="redTxt">${gaojianMount}</span>）份
								</li>
							</ul>
					    </div>
					</div>
					<div class="box-3"></div>
				</div>
				
				<div style="height:10px;"></div>
				<div class="m-box-1">
				    <div class="box-1">
					    <ul>
						    <li><span><a href="/member_taskList.do">更多&gt;&gt;</a></span>我的任务</li>
						</ul>
					</div>
					<div class="box-2">
					    <div class="box-3-content">
						    <ul>
						    <#list myTasks as t>	
							<li><a href="/task_${t.id}.html" target="_blank">[${t.id}]${t.title}</a>&nbsp;&nbsp;￥${t.money}&nbsp;&nbsp;${t.publishDate?string('yyyy-MM-dd')}</li>
							</#list>
							</ul>
					    </div>
					</div>
					<div class="box-3"></div>
				</div>
				
				<div style="height:10px;"></div>
				<div class="m-box-1">
				    <div class="box-1">
					    <ul>
						    <li><span><a href="/member_myGaojianList.do">更多&gt;&gt;</a></span>我的稿件</li>
						</ul>
					</div>
					<div class="box-2">
					    <div class="box-3-content">
						    <ul>
							<#list myGaojians as g>	
							<li><a href="/gaojian_${g.task.id}.html" target="_blank">${g.task.title}</a>&nbsp;&nbsp;${g.statusTxt}&nbsp;&nbsp;${g.submitDate?string('yyyy-MM-dd')}&nbsp;&nbsp;<a href="/member_submitGaojian.do?task.id=${g.task.id}">继续投稿</a></li>
							</#list>
							</ul>
					    </div>
					</div>
					<div class="box-3"></div>
				</div>
			</div>
			<div class="right_body">
 
  				<div class="right-box">
  
		        <div class="right-1">
		          <ul>
		            <li><span><a target="_blank" href="javascript:;">更多问题&gt;&gt;</a></span>常见问题</li>
		          </ul>
		        </div>
		        <div class="right-2">
		          <ul>
		            <li><img width="8" height="7" src="/img/member/arrow5.jpg">&nbsp;<a class="a1" href="javascript:;">什么是雇主</a></li>
		            <li><img width="8" height="7" src="/img/member/arrow5.jpg">&nbsp;<a class="a1" href="javascript:;">发布任务流程</a></li>
		            <li><img width="8" height="7" src="/img/member/arrow5.jpg">&nbsp;<a class="a1" href="javascript:;">为什么要全额预付任务赏金？</a></li>
		            <li><img width="8" height="7" src="/img/member/arrow5.jpg">&nbsp;<a class="a1" href="javascript:;">如何查看已发布任务进展情况？</a></li>
		            <li><img width="8" height="7" src="/img/member/arrow5.jpg">&nbsp;<a class="a1" href="javascript:;">已发布进行中的任务可以修改任务要求吗？</a></li>
		            <li><img width="8" height="7" src="/img/member/arrow5.jpg">&nbsp;<a class="a1" href="javascript:;">选稿评标有期限吗？</a></li>
		            <li><img width="8" height="7" src="/img/member/arrow5.jpg">&nbsp;<a class="a1" href="javascript:;">有了满意的结果怎样选定中标？</a></li>
		            <li><img width="8" height="7" src="/img/member/arrow5.jpg">&nbsp;<a class="a1" href="javascript:;">什么是超期任务？超期任务怎么处理？</a></li>
		            <li><img width="8" height="7" src="/img/member/arrow5.jpg">&nbsp;<a class="a1" href="javascript:;">我想加价，具体怎么操作呢？</a></li>
		          </ul>
		        </div>
    				<div class="right-3"></div>
					<div style="width:254px;padding-top:10px; overflow:hidden;"><a target="_blank" href="http://t.qq.com/sandahanet"><img border="0" alt="推我网腾讯官方微博，关注我们，随时掌握最新动态。" src="/img/member/txweibo.jpg"></a></div>
  					<div style="width:254px;padding-top:10px; overflow:hidden;"><a target="_blank" href="http://weibo.com/sandahanet"><img border="0" alt="推我网新浪官方微博，关注我们，随时掌握最新动态。" src="/img/member/xlweibo.jpg"></a></div>
  				</div>
			</div>
		</div>
		<!-- 内容区域结束 -->
		<#include "/WEB-INF/template/include/foot.ftl">
	</div>
</body>
</html>