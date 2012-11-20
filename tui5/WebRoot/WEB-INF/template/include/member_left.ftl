			<div class="left_body">
				<div class="item">
				    <div class="item-title">
					    <ul>
						    <li><img src="/img/member/arrow1.jpg"> 我是雇主
						    <span class="open_close" onclick="$('#guzhu').slideToggle('slow')">&nbsp;</span></li>
					    </ul>
					</div>
					<div class="item-repeat" id="guzhu">
					    <ul>
						    <li><img border="0" src="/img/member/tips.jpg"> <a href="/member_publish.do"><font color="#0033FF">我要发布任务</font></a></li>
							<li><img border="0" src="/img/member/tips.jpg"> <a href="/member_taskList.do">我发布的悬赏任务</a></li>
							<li>&#12288;<img border="0" src="/img/member/tips.jpg"> <a href="/member_taskList.do?status=1">已发布未付款</a></li>
							<li>&#12288;<img border="0" src="/img/member/tips.jpg"> <a href="/member_taskList.do?status=10">进行中的</a></li>
							<li>&#12288;<img border="0" src="/img/member/tips.jpg"> <a href="/member_taskList.do?status=2">已到期的</a></li>
							<li>&#12288;<img border="0" src="/img/member/tips.jpg"> <a href="/member_taskList.do?status=5">已结束的</a></li>
							<!--<li><img border="0" src="/img/member/tips.jpg"> <a href="http://www.sandaha.com/weibo/task_weibo.asp"><font color="#FF6600">我发布的红人微博任务</font></a></li>
							<li><img border="0" src="/img/member/tips.jpg"> <a href="http://www.sandaha.com/weibo/view_weibo.asp">查看红人微博主</a></li>-->
						</ul>
					</div>
					<div class="item-bottom"></div>
				</div>
				
				<div class="item">
				    <div class="item-title">
					    <ul>
						    <li><img src="/img/member/arrow1.jpg"> 我是推手
						    <span class="open_close" onclick="$('#tuishou').slideToggle('slow')">&nbsp;</span></li>
						</ul>
					</div>
					<div class="item-repeat" id="tuishou">
					    <ul>
						    <li><img border="0" src="/img/member/tips.jpg"> <a href="member_myTaskList.do">我参加的悬赏任务</a></li>
							<li><img border="0" src="/img/member/tips.jpg"> <a href="javascript:;">已交稿未结束的任务</a></li>
							<li><img border="0" src="/img/member/tips.jpg"> <a href="member_myGaojianList.do">稿件状态查询</a></li>
						</ul>
				    </div>
					<div class="item-bottom"></div>
				</div>
	
				<div class="item">
				    <div class="item-title">
					    <ul>
						    <li><img src="/img/member/arrow2.jpg"> 财务和积分管理
						    <span class="open_close" onclick="$('#myhabao').slideToggle('slow')">&nbsp;</span>
						    </li>
						</ul>
					</div>
					<div class="item-repeat" id="myhabao">
						<ul>
							<li><img border="0" src="/img/member/tips.jpg"> <a href="/member_finance.do"><font color="#0033FF">我的财务</font></a></li>
							<li>&#12288;<img border="0" src="/img/member/tips.jpg"> <a href="/member_financeList.do">财务总记录</a></li>
							<li>&#12288;<img border="0" src="/img/member/tips.jpg"> <a href="/member_financeList.do?type=1">充值记录</a></li>
							<li>&#12288;<img border="0" src="/img/member/tips.jpg"> <a href="/member_financeList.do?type=0">提现记录</a></li>
						    <li>&#12288;<img border="0" src="/img/member/tips.jpg"> <a href="/member_payIndex.do"><font color="EE0000">我要充值</font></a></li>
							<li>&#12288;<img border="0" src="/img/member/tips.jpg"> <a href="/member_applyMoney.do">我要提现</a></li>
							<li>&#12288;<img border="0" src="/img/member/tips.jpg"> <a href="/member_applyMoneyList.do">我的提现进度查询</a></li>
							<li><img border="0" src="/img/member/tips.jpg"> <a href="/member_myscore.do"><font color="#0033FF">我的积分</font></a></li>
							<li>&#12288;<img border="0" src="/img/member/tips.jpg"> <a href="/member_myscore.do">积分查询</a></li>
							<li>&#12288;<img border="0" src="/img/member/tips.jpg"> <a href="/member_myscoreList.do">积分记录</a></li>
						</ul>
						
						<div style="clear:both"></div>
				  </div>
					<div class="item-bottom"></div>
				</div>
				<div style="overflow:hidden" class="item">
				    <div class="item-title">
					    <ul>
						    <li><img src="/img/member/arrow3.jpg"> 推客联盟
						    <span class="open_close" onclick="$('#mytuike').slideToggle('slow')">&nbsp;</span>
						    </li>
						</ul>
					</div>
					<div style="overflow:hidden" class="item-repeat" id="mytuike">
					    <ul>
						    <li><img border="0" src="/img/member/tips.jpg"> <a href="/member_allianceList.do">我的推广网站</a></li>
						    <li><img border="0" src="/img/member/tips.jpg"> <a href="/member_addAlliance.do">添加推广网站</a></li>
						    <li><img border="0" src="/img/member/tips.jpg"> <a href="/member_allianceCode.do">获取推广代码</a></li>
						</ul>
				   </div>
					<div class="item-bottom"></div>
				</div>
				<div style="overflow:hidden" class="item">
				    <div class="item-title">
					    <ul>
						    <li><img src="/img/member/arrow3.jpg"> 信息管理
						    <span class="open_close" onclick="$('#myinfo').slideToggle('slow')">&nbsp;</span>
						    </li>
						</ul>
					</div>
					<div style="overflow:hidden" class="item-repeat" id="myinfo">
					    <ul>
						    <li><img border="0" src="/img/member/tips.jpg"> <a href="/member_info.do">修改资料</a></li>
						    <li><img border="0" src="/img/member/tips.jpg"> <a href="/member_pwd.do">修改密码</a></li>
						</ul>
				   </div>
					<div class="item-bottom"></div>
				</div>
				<script>
					$(function(){
						var currNav = '${currNav}';
						if(currNav == '4' || currNav == '3'){
							$('#guzhu').hide();
							$('#tuishou').hide();
						}else if(currNav == '5'){
							$('#guzhu').hide();
							$('#tuishou').hide();
							$('#myhabao').hide();
						}
					});
				</script>
			</div>