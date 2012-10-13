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
