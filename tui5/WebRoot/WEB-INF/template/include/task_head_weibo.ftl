			<div class="task_info clearfix">
				<div class="taskTxt clearfix">
					<div class="left-l">
						<ul>
							<li>任务标题：<h2>${t.title}</h2></li>
							<li>任务编号：[${t.id}]</li>
							<li>悬赏金额：<span class="red fontBold font_14">￥${t.money} 元</span></li>
							<li>推广平台：<span class="gray"><#if t.wbType==1>新浪微博</#if><#if t.wbType==2>腾讯微博</#if></span></li>
							<li>发送频率：<span class="orange">${t.wbSendTxt}</span></li>
							<li>任务热度：<span class="orange">${gjUser}</span>人参与, 共投稿<span class="orange">${gjAll}</span>个稿件,已合格稿件<span class="orange">${(t.passGaojian)?default(0)}</span>个</li>
							<li>赏金已分配：${(t.passMoney)?default(0)}元</li>
							<div class="d_cont3">
								<ul class="d3_tit">赏金分配</ul>
								<ul class="d3_cont">
									<li>5-50 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;粉丝 <span>0.1</span> 元</li>
									<li>51-100 &nbsp;&nbsp;&nbsp;&nbsp;粉丝 <span>0.1</span> 元</li>
									<li style="border:0;">101-200 &nbsp;&nbsp;&nbsp;粉丝 <span>0.2</span> 元</li>
									<li>201-500 &nbsp;&nbsp;&nbsp;粉丝 <span>0.3</span> 元</li>
									<li>501-1000 &nbsp;&nbsp;粉丝 <span>0.5</span> 元</li>
									<li style="border:0;">1001-1500 &nbsp;粉丝 <span>0.8</span> 元</li>
									<li>1501-2000 &nbsp;粉丝 <span>1</span> 元</li>
									<li>2001-2500 &nbsp;粉丝 <span>1.5</span> 元</li>
									<li style="border:0;">2501-3000 &nbsp;粉丝 <span>1.8</span> 元</li>
									<li>3001-3500 &nbsp;粉丝 <span>2</span> 元</li>
									<li>3500以上 &nbsp;&nbsp;粉丝 <span>2.5</span> 元</li>
								</ul>
							</div>
							</li>
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
							<li><span class="green fontBold">请您注意：</span><span class="gray">如果您的粉丝/听众数量过多，在任务剩余金额过低时，可能无法获取相应赏金，请谨慎参与。 </span></li>
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
							<li>用户：${t.publisher.userId}</li>
							<li>加入时间：${t.publisher.userRegdate?string('yyyy年MM月dd日')}</li>
							<li><a href="javascript:;"><img width="81" height="22" border="0" align="absmiddle" src="/img/msg.jpg"></a></li>
						</ul>
				  </div>
				</div>
			</div>