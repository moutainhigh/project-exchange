			<div class="task_info clearfix">
				<div class="taskTxt clearfix">
					<div class="left-l">
						<ul>
							<li>任务标题：<h2>${t.title}</h2></li>
							<li>任务编号：[${t.id}]</li>
							<li>悬赏金额：<span class="red fontBold font_14">￥${t.money} 元</span></li>
							<li>所属分类：<span class="gray">${t.type.parent.name} -&gt; ${t.type.name}</span></li>
							<li>中标模式：<span class="orange">${t.priceClassTxt}</span></li>
							<#if t.priceClass==1>
							<li>中标所得：<span class="gray">任务发布者需要 <span class="orange">${t.gaojianMount}</span> 个稿件，每个<span class="orange">${t.gaojianPrice}</span>元<br>&#12288;&#12288;&#12288;&#12288;&#12288;已选定<span class="orange">${gjSucc}</span>个合格，<span class="orange">${gjFail}</span>个不合格，<span class="orange">${gjAll-gjSucc-gjFail}</span>个未审核<br>&#12288;&#12288;&#12288;&#12288;&#12288;目前还需要<span class="orange">${t.gaojianMount-gjSucc}</span>个稿件</span></li>
							</#if>
							<#if t.priceClass==2>
							<li>单人中标所得全部奖金：${(t.money)?string.currency}
							</#if>
							<#if t.priceClass==3>
							<li>中标所得：
							<#if t.people1 gt 0 && t.rate1 gt 0><span class="gray">一等奖 ${t.people1} 人，平分奖金的 ${t.rate1?string.percent}</span></#if>
							<#if t.people2 gt 0 && t.rate2 gt 0><li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="gray">二等奖 ${t.people2} 人，平分奖金的 ${t.rate2?string.percent}</span></li></#if>
							<#if t.people3 gt 0 && t.rate3 gt 0><li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="gray">三等奖 ${t.people3} 人，平分奖金的 ${t.rate3?string.percent}</span></li></#if>
							</#if>
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
							<li>用户：${t.publisher.userId}</li>
							<li>加入时间：${t.publisher.userRegdate?string('yyyy年MM月dd日')}</li>
							<li><a href="javascript:;"><img width="81" height="22" border="0" align="absmiddle" src="/img/msg.jpg"></a></li>
						</ul>
				  </div>
				</div>
			</div>
