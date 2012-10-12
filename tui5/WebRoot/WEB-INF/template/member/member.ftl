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
							    <li class="pic"><img width="120" height="120" border="0" src="../img/member/nopic.jpg"></li>
								<li class="l1">
								<p>用户：<span class="redTxt font14">throne212</span></p>
								<p>登录次数：<span class="redTxt">8</span>&nbsp;次</p>
								<p>上次登录时间：2012-10-8 11:13:07</p>
								
								<p>当前账户余额：<span class="redTxt font14 fontBold">0元</span>&#12288;<a target="_blank" title="我要充值" href="http://www.sandaha.com/member/onlinePay2.asp"><img border="0" align="absmiddle" src="../img/member/cz_btn.gif"></a></p>
								<p style="padding-top:5px;"><a title="我想要网络推广方案" href="http://www.sandaha.com/member/NeedProject.asp"><img border="0" onmouseout="this.src='../img/member/suoyao.gif'" onmouseover="this.src='../img/member/suoyao2.gif'" src="../img/member/suoyao.gif"></a>&nbsp;<a title="我的网络推广方案" href="http://www.sandaha.com/member/MyProject.asp"><img border="0" onmouseout="this.src='../img/member/fangan.jpg'" onmouseover="this.src='../img/member/fangan2.jpg'" src="../img/member/fangan.jpg"></a></p>
								
							  </li>
							</ul>
							<ul>
								<li>&#12288;<a title="我要发布任务" class="font14 fontBold" style="color:#C30;" href="../task/addTask.asp"><u>要推广，我要发布任务</u></a>&#12288;
								我已发布的任务（<span class="redTxt">0</span>）个&#12288;&#12288;客服：12344566
								</li>
							</ul>
							<!--< %if sdh_Type = 1 then%>
							<ul style="margin-top:5px;">
								<li>　我是新手，<a href="< %=sdhurl%>Task/AddFastTask_new.asp" target="_blank" style="font-size:12px;color:#C30;text-decoration:underline;"><strong>快速发布任务</strong></a></li>
							</ul>
							<ul style="margin-top:5px;">
								<li>　我很忙，<a href="../task/waibao.html" style="font-size:12px;color:#0066FF;text-decoration:underline;" target="_blank"><strong>将推广工作外包给三打哈</strong></a></li>
							</ul>
							< %end if%>-->
							
					    </div>
					</div>
					<div class="box-3"></div>
				</div>
				
				<div style="height:10px;"></div>
				<div class="m-box-1">
				    <div class="box-1">
					    <ul>
						    <li><span><a href="myTask.asp?Status=all">更多&gt;&gt;</a></span>我的任务</li>
						</ul>
					</div>
					<div class="box-2">
					    <div class="box-3-content">
						    <ul>
						<li target="_blank" addtask.asp'="" task="" www.sandaha.com="" http:="" style="color:#999999;&gt;您暂时还没发布任务!想推广,我要&lt;a href=">发布任务!</li>
							</ul>
					    </div>
					</div>
					<div class="box-3"></div>
				</div>
				
				<div style="margin-top:10px;" class="m-box-1">
				    <div style=" background:url(../img/member/m11.jpg) repeat-x;" class="box-1">
					    <ul>
						    <li><span><a href="http://www.sandaha.com/Member/Email_list.asp">更多&gt;&gt;</a></span>我的邮件代发任务</li>
						</ul>
					</div>
					<div class="box-2">
					    <div class="box-3-content">
							<ul>
					
							</ul>
						</div>
					</div>
				</div>
				<div class="box-3"></div>
				
				<div style="margin-top:10px;" class="m-box-1">
				    <div style=" background:url(../img/member/m11.jpg) repeat-x;" class="box-1">
					    <ul>
						    <li><span><a href="http://www.sandaha.com/Member/xinwengao_list.asp">更多&gt;&gt;</a></span>我的新闻稿任务</li>
						</ul>
					</div>
					<div class="box-2">
					    <div class="box-3-content">
							<ul>
					
							</ul>
						</div>
					</div>
				</div>
				<div class="box-3"></div>
				
				<div style="margin-top:10px;" class="m-box-1">
				    <div style=" background:url(../img/member/m11.jpg) repeat-x;" class="box-1">
					    <ul>
						    <li><span><a href="http://www.sandaha.com/weibo/task_weibo.asp">更多&gt;&gt;</a></span>我的红人微博任务</li>
						</ul>
					</div>
					<div class="box-2">
					    <div class="box-3-content">
						    <ul>
						<li target="_blank" addtask_hr.asp'="" weibo="" www.sandaha.com="" http:="" style="color:#999999;&gt;您暂时还没发布红人微博任务，想要红人微博转转发，点击&lt;a href=">发布红人微博任务!</li>
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
		            <li><span><a target="_blank" href="http://www.sandaha.com/help/help_g.html">更多问题&gt;&gt;</a></span>常见问题</li>
		          </ul>
		        </div>
		        <div class="right-2">
		          <ul>
				
		            <li><img width="8" height="7" src="../img/member/arrow5.jpg">&nbsp;<a class="a1" href="http://www.sandaha.com/help/help_g53_3.html">什么是雇主</a></li>
		            
		            <li><img width="8" height="7" src="../img/member/arrow5.jpg">&nbsp;<a class="a1" href="http://www.sandaha.com/help/help_g54_3.html">发布任务流程</a></li>
		            
		            <li><img width="8" height="7" src="../img/member/arrow5.jpg">&nbsp;<a class="a1" href="http://www.sandaha.com/help/help_g55_3.html">为什么要全额预付任务赏金？</a></li>
		            
		            <li><img width="8" height="7" src="../img/member/arrow5.jpg">&nbsp;<a class="a1" href="http://www.sandaha.com/help/help_g56_3.html">如何查看已发布任务进展情况？</a></li>
		            
		            <li><img width="8" height="7" src="../img/member/arrow5.jpg">&nbsp;<a class="a1" href="http://www.sandaha.com/help/help_g57_3.html">已发布进行中的任务可以修改任务要求吗？</a></li>
		            
		            <li><img width="8" height="7" src="../img/member/arrow5.jpg">&nbsp;<a class="a1" href="http://www.sandaha.com/help/help_g58_3.html">正在进行中的任务可以提前结束吗？</a></li>
		            
		            <li><img width="8" height="7" src="../img/member/arrow5.jpg">&nbsp;<a class="a1" href="http://www.sandaha.com/help/help_g59_3.html">选稿评标有期限吗？</a></li>
		            
		            <li><img width="8" height="7" src="../img/member/arrow5.jpg">&nbsp;<a class="a1" href="http://www.sandaha.com/help/help_g60_3.html">有了满意的结果怎样选定中标？</a></li>
		            
		            <li><img width="8" height="7" src="../img/member/arrow5.jpg">&nbsp;<a class="a1" href="http://www.sandaha.com/help/help_g61_3.html">什么是超期任务？超期任务怎么处理？</a></li>
		            
		            <li><img width="8" height="7" src="../img/member/arrow5.jpg">&nbsp;<a class="a1" href="http://www.sandaha.com/help/help_g62_3.html">我想加价，具体怎么操作呢？</a></li>
		            
		          </ul>
		        </div>
    				<div class="right-3"></div>
					<div style="width:254px;padding-top:10px; overflow:hidden;"><a target="_blank" href="http://t.qq.com/sandahanet"><img border="0" alt="三打哈腾讯官方微博，关注我们，随时掌握最新动态。" src="../img/member/txweibo.jpg"></a></div>
  					<div style="width:254px;padding-top:10px; overflow:hidden;"><a target="_blank" href="http://weibo.com/sandahanet"><img border="0" alt="三打哈新浪官方微博，关注我们，随时掌握最新动态。" src="../img/member/xlweibo.jpg"></a></div>
  				</div>
			</div>
		</div>
		<!-- 内容区域结束 -->
		<#include "/WEB-INF/template/include/foot.ftl">
	</div>
</body>
</html>