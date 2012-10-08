<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>推我网 - 发布任务</title>	
	<link href="/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/css/mian.css" rel="stylesheet" type="text/css" />
	<link href="/css/member.css" rel="stylesheet" type="text/css" />
	<link href="/css/publish.css" rel="stylesheet" type="text/css" />
	<script src="/js/jquery.js" type="text/javascript"></script>
	<script src="/js/member.js" type="text/javascript"></script>
</head>
<body>
	<!-- 顶部区域 -->
	<div id="top">
			<div class="top_con">
			<div class="top_l">找兼职，上推我网！</div>
			<div class="top_r"><a href="/reg.html">注册</a> | <a href="/login.html">登录</a><span><a href="#">发布推广任务</a><a href="#">帮助</a></span></div>
			</div>
	</div>
	<!-- 顶部区域结束 -->
	<div id="mian">		
		<!-- 头部区域 -->
		<div class="nav">
			<!--LOGo区域-->
			<div class="nav_top clearfix">
				<a href="#" class="logo_a"><img src="img/logo.gif"/></a>
				<a href="#" class="index_a">广告图width:695px; height:70px; </a>            
			</div>
			<!--LOGo区域结束-->
			<!--导航区域-->
			<div class="nav_member clearfix">
				<ul>
					<li><a href="/">网站首页</a></li>
					<li><a href="/member!index.do">我的三打哈</a></li>
					<li class="focus"><a href="/member!publish.do">发布任务</a></li>
					<li><a href="/member/score.html">积分管理</a></li>
					<li><a href="/member/finance.html">财务管理</a></li>
				</ul>
			</div>
			<div class="top_line"></div>
			<!--导航区域结束-->
		</div>
		<!-- 头部区域结束 -->
		<!-- 内容区域 -->
		<div class="body_content">
			<div class="left_body">
				<div class="item">
				    <div class="item-title">
					    <ul>
						    <li>任务发布指南</li>
					    </ul>
					</div>
					<div class="item-repeat">
					    <h3>选择任务一级分类</h3>
					    <p>推广、文案、招标任务，请任选其一</p>
					    <h3>选择任务二级分类</h3>
					    <p>二级分类，包含了具体的任务类别，不同的任务类别包含了不同的任务信息填写项目</p>
					    <h3>填写任务项</h3>
					    <p>您最好是把任务的每一项都填写清楚，这样可以推手可以更好的了解你的任务</p>
					</div>
				</div>
			</div>
			<div class="publish_body">
			    <div class="publish_box">
				   <div class="publish_box_content">
					   <h3>任务所属的一级分类</h3>
					   <p id="class1">
							<input type="radio" checked="" value="2" onclick="" name="bclass">
							推广&nbsp;&nbsp;
							<input type="radio" value="3" onclick="" name="bclass">
							文案写作&nbsp;&nbsp;
							<input type="radio" value="4" onclick="" name="bclass">
							招标任务
					   </p>
					   <h3>请选择推广方式</h3>
					   <p id="class2">
					<span><input name="sclass" id="task_sclass_4" onclick="javascript:location='http://www.sandaha.com/luntan/addTask.asp';" value="4" type="radio">论坛发帖</span>
					<span><input name="sclass" id="task_sclass_23" onclick="javascript:location='http://www.sandaha.com/dingtie/addTask.asp';" value="23" type="radio">论坛顶贴</span>
					<span><input name="sclass" id="task_sclass_24" onclick="javascript:location='http://www.sandaha.com/weibo/addTask.asp';" value="24" type="radio">微博推广</span>
					<span><input name="sclass" id="task_sclass_6" onclick="javascript:location='http://www.sandaha.com/qq/addTask.asp';" value="6" type="radio">QQ群推广</span>
					<span><input name="sclass" id="task_sclass_9" onclick="javascript:location='http://www.sandaha.com/wenda/addTask.asp';" value="9" type="radio">问答推广</span>
					<span><input name="sclass" id="task_sclass_45" onclick="javascript:location='http://www.sandaha.com/newsTask/newsTask_Add.asp';" value="45" type="radio">新闻稿发布</span>
					<span><input name="sclass" id="task_sclass_7" onclick="javascript:location='http://www.sandaha.com/add_mail/Email_Add.asp';" value="7" type="radio">邮件代发</span>
					<span><input name="sclass" id="task_sclass_10" onclick="javascript:location='http://www.sandaha.com/b2b/addTask.asp';" value="10" type="radio">B2B企业产品发布</span>
					<span><input name="sclass" id="task_sclass_5" onclick="javascript:location='http://www.sandaha.com/boke/addTask.asp';" value="5" type="radio">博客推广</span>
					<span><input name="sclass" id="task_sclass_30" onclick="javascript:location='http://www.sandaha.com/baidu/addTask.asp';" value="30" type="radio">百度平台推广</span>
					<span><input name="sclass" id="task_sclass_27" onclick="javascript:location='http://www.sandaha.com/fenlei/addTask.asp';" value="27" type="radio">分类网站发帖</span>
					<span><input name="sclass" id="task_sclass_12" onclick="javascript:location='http://www.sandaha.com/task/addTask.asp?bclass=2&amp;sclass=12';" value="12" type="radio">友情链接</span>
					   </p>
					   <h3>请填写任务标题</h3>
					   <p id="task_title">
							<input type="text" onblur="javascript:hide_tips('title');hide_color('txtTitle');" 
							onfocus="javascript:show_tips('title');show_color('txtTitle');" size="60" id="txtTitle" class="text1" name="txtTitle">
							<br/><span class="orange">您要做什么任务（25个中文或50个英文以内）。</span>
					   </p>
					   <h3>推广要求</h3>
					   <p>
					   	<textarea onblur="javascript:hide_color('txtYaoQiu');" onfocus="javascript:show_color('txtYaoQiu');" size="60" id="txtYaoQiu" class="txtArea4" 
					   	type="text" name="txtYaoQiu"></textarea>
					   </p>
					   <h3>审核标准</h3>
					   <p>
					   	<textarea onblur="javascript:hide_tips('biaozhun');hide_color('txtBiaoZhun');" onfocus="javascript:show_tips('biaozhun');show_color('txtBiaoZhun');" size="60" id="txtBiaoZhun" class="txtArea2" type="text" name="txtBiaoZhun" 
					   	style="border-color: rgb(211, 228, 254);"></textarea>
					   	<br/><span class="orange">请把您的要求尽可能的写清楚， 以便推手们更有效益的为您工作。</span>
					   </p>
					   <h3>上传附件</h3>
					   <p>
					   	<a class="addfujian" onclick="javascript:add_file();" href="javascript:;">点击添加附件</a>
					   	<br/><span class="orange">最多可上传5个附件，单个附件容量最大不超过2M。</span>
					   </p>
					   <h3>联系方式</h3>
					   <p>
					   	QQ:<input type="text" onblur="javascript:hide_tips('title');hide_color('txtTitle');" 
							onfocus="javascript:show_tips('title');show_color('txtTitle');" size="20" id="txtTitle" class="text1" name="txtTitle">
						&nbsp;&nbsp;&nbsp;&nbsp;
						手机号码:<input type="text" onblur="javascript:hide_tips('title');hide_color('txtTitle');" 
							onfocus="javascript:show_tips('title');show_color('txtTitle');" size="20" id="txtTitle" class="text1" name="txtTitle">
					   	<br/><span class="orange">很重要，用于接收任务提醒，请如实填写。</span>
					   </p>
					   <div class="money_info">
					   	<h3>你想悬赏多少钱呢？</h3>
					   	<p class="ft12">您悬赏越高，参与推手将越多，推广任务完成的质量也将越好。</p>
					   	<p><input type="text" size="20" class="text1" name="txtTitle">元</p>
					   </div>
			       </div>
			   </div>
			</div>
		</div>
		<!-- 内容区域结束 -->
		<!-- 底部区域 -->
		<div class="copyright">
			<ul>
				<li><a href="#">联系我们</a> | <a href="#">广告业务</a> | <a href="#">信息置顶</a> | <a href="#">站内留言</a> | <a href="#">最新兼职</a> | <a href="#">最新简历</a> | <a href="#">免责声明</a></li>
				<li>Copyright &copy; 2009-2012 <a href="#">推我网 (tui5.com)</a> 版权所有</li>
				<li>ICP证：京07038868号</li>
			</ul>
		</div>
		<!-- 底部区域结束 -->
	</div>
</body>
</html>