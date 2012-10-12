<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset==gbk" />
	<title>推我网 - 发布任务</title>	
	<link href="/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/css/mian.css" rel="stylesheet" type="text/css" />
	<link href="/css/member.css" rel="stylesheet" type="text/css" />
	<link href="/css/publish.css" rel="stylesheet" type="text/css" />
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
					    <p>
					   	征集时间:7天
					   	<br/><span class="orange">备注：如果到期未征集到足够合格稿件，任务可以延期两次，每次7天。</span>
					    </p>
					    <p>
					   	是否公布:<input type="radio" checked="checked" value="1" id="isGongBu1" name="isGongBu">直接扣款，立即发布
					   	&nbsp;&nbsp;<input type="radio" value="2" id="isGongBu1" name="isGongBu">等我通知
					   	<br/><span class="orange">选择"可直接扣款公布任务"，是在您有足够余额的情况下，由客服人员直接操作任务上线，不需通知雇主。</span>
					    </p>
					    <p>
					   	是否屏蔽搜索引擎:<input type="radio" value="1" id="isGongBu1" name="isGongBu">是
					   	&nbsp;&nbsp;<input type="radio" value="2" checked="checked" id="isGongBu1" name="isGongBu">否
					   	<br/><span class="orange">友情提醒：屏蔽搜索引擎抓取需要额外支付￥10元。若您的内容不涉及政治等敏感因素，可以不屏蔽。</span>
					    </p>
					    <p class="ctr">
					   	<input type="checkbox" checked="checked" name="know_xieyi" id="know_xieyi"/><a href="javascript:void(0)" onclick="$('#xieyi').toggle();">我已阅读并接受任务发布的协议与规定</a>
					    </p>
					    <p class="ctr"><input type="submit" class="button" value="提交任务" name="submit"></p>
			       </div>
			   </div>
			   <div id="xieyi">
			   		<h2>推我网，任务发布协议</h2>
					<p><font face="Verdana">推我网一直本着公开、公平、公正、诚实、守信的原则，致力于打造中国最具诚信的网络推广服务外包平台。请在您发布任务前仔细阅读任务发布规则： </font></p>
					<p><font face="Verdana">1、雇主自由定价，自由确定悬赏时间，自由发布任务要求，自主确定中标推手和中标方案。 </font></p>
					<p><font face="Verdana">2、雇主100%预付任务赏金，让推手坚信您的诚意和诚信。 </font></p>
					<p><font face="Verdana">3、任务赏金分配原则：任务一经发布，网站收取20%发布费，中标推手获得赏金的80%。 </font></p>
					<p><font face="Verdana">4、计件任务如未完成，雇主需要结束本次任务，另外发布任务，推我网只扣取合格稿件费的费用。 </font></p>
					<p><font face="Verdana">5、文案任务最终都会选定至少一个作品中标,至少一个推手获得赏金。 </font></p>
					<p><font face="Verdana">6、文案任务雇主若未征集到满意作品，系统将延期2次征集，特殊情况除外。</font></p>
					<p><font face="Verdana">7、雇主自己所在组织的任何人均不能以任何形式参加自己所发布的任务，一经发现则视为雇主委托推我网按照网站规则选稿。 </font></p>
					<p><font face="Verdana">8、任务悬赏时间都为7天。推广任务及文案发布任务金额是30元起，建议是发300元任务。招标任务是100元人民币。推广任务未完成需要延期，必须先将未审核的稿件审核完毕，才能继续延期，而且延期时间也都为7天，特殊情况除外。</font></p>
					<p><font face="Verdana">9、网赚类、注册类任务发布金额也是30元人民币起发，一旦发布将扣除任务总金额的20%技术服务费。且每个稿件的平均单价不能低于2元人民币。 如任务稿件太多，雇主仍未审核，将由推我网全权审核处理。</font></p>
					<p><font face="Verdana">10、进行中的任务加价不得低于30元人民币，特殊任务除外。</font></p>
					<p><font face="Verdana"><font face="Verdana">11、文案任务在征集时间到期后（包括延期时间），如果雇主还没有审核稿件，推我网有权代为选稿。</font></font></p>
					<p><font face="Verdana"><font face="Verdana">12、如果推手以交接源文件要挟雇主，推我网将取消其中标资格，同时任务将免费延长相应的时间继续征集作品。</font></font></p>
					<p><font face="Verdana"><font face="Verdana">13、<font face="Verdana"><font face="Verdana">计件</font>任务发布</font>后，雇主需及时审稿，<font face="Verdana">超过3天的稿件，推我网有权代为选稿。</font>系统选稿后不够稿件，<font face="Verdana">无需通知，</font>系统将自动延期2次。2次延期后任务仍未完成的，系统将自动终止任务，并将余额返还到推我网雇主账户，用作下一次的任务。<font face="Verdana">如果不再延期，也不再继续发布任务，雇主可以选择退款（邮件代发除外），另外退款时，雇主必须在提现退款前通过实名认证和银行认证，需要扣除退款余额的20%技术服务费，并在三个月内无异议的情况下，雇主主动联系再进行核实提现退款处理。</font></font></font></p>
					<p><font face="Verdana"><font face="Verdana">14、雇主与推手，应严格按照每个任务的“任务要求”所描述的内容执行。如果雇主提出超出“任务要求”范围的要求，推手有权拒绝，雇主也不得以此为理由拒绝选出中标方案或退款。 </font></font></p>
					<p><font face="Verdana"><font face="Verdana">15、如果您的任务在征集时间结束后，没有任何交稿，网站将免费延期。 <br>16、推手在中标后被举报涉嫌抄袭的作品，经过调查核实，推我网取消中标资格。严重抄袭者，将直接封其账号。 </font></font></p>
					<p><font face="Verdana"><font face="Verdana">17、发布任务即视为同意本规则。<br></font></font></p> 
				</div>
			</div>
		</div>
		<!-- 内容区域结束 -->
		<#include "/WEB-INF/template/include/foot.ftl">
	</div>
</body>
</html>