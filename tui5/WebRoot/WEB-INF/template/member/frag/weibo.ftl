						<h3>选择推广平台</h3>
					    <p>
						    <ul>
								<li style="font-weight:normal;line-height:31px;">
									<img src="/img/xlico.jpg" width="31" height="31" align="absmiddle">
									<input type="radio" value="1" name="task.wbType" id="ra_1"> <label for="ra_1">新浪微博</label>
					　　				<img src="/img/txico.jpg" width="31" height="31" align="absmiddle">
									<input type="radio" value="2" name="task.wbType" id="ra_2"> <label for="ra_2">腾讯微博</label>
								</li>
								<li><span class="orange">分类准确， 方便相应分类的高手来完成。</span></li>
							</ul>
					    </p>
					    <h3>选择发送规则</h3>
					    <p>
						    <select name="task.wbSend" id="weibo_send">
							  	<option value="0" <#if (task.wbSend)?exists && task.wbSend==0>selected="selected"</#if>>一个微博只能发一条</option>
							  	<option value="6" <#if (task.wbSend)?exists && task.wbSend==6>selected="selected"</#if>>一个微博6小时可以发一条</option>
							  	<option value="12" <#if (task.wbSend)?exists && task.wbSend==12>selected="selected"</#if>>一个微博12小时可以发一条</option>
							  	<option value="24" <#if (task.wbSend)?exists && task.wbSend==24>selected="selected"</#if>>一个微博24小时可以发一条</option>
							</select>
							<br/><span class="orange">设置一个微博只能发一条或者一个微博可以发多条。</span>
					    </p>
					    <#include "/WEB-INF/template/member/frag/common/title.ftl">
					    <h3 class="">请输入转发地址</h3>
					    <p class="">
							<input id="taskURL" class="text1" name="task.url" value="${(task.url)?default('')}" size=70><font color="#FF0000">*</font>
							<br/><span class="orange">例如：http://weibo.com/u/2962437063。</span>
					    </p>
					    <h3>推广要求</h3>
					    <p>
					   	<textarea size="60" id="task_content" class="txtArea4"type="text" name="task.content">${(task.content)?default('')}</textarea>
					   	<br/><span class="orange">请把您的要求尽可能的写清楚， 以便推手们更有效益的为您工作。（500个中文或1000个英文以内）</span>
					    </p>
					    <h3>审核标准</h3>
					    <p>
					   	<textarea size="60" id="task_shenhe" class="txtArea2" type="text" name="task.shenhe">${(task.shenhe)?default('')}</textarea>
					   	<br/><span class="orange">请把您的审核要求尽可能的写清楚， 以便推手们更有效益的为您工作。</span>
					    </p>
					    <#include "/WEB-INF/template/member/frag/common/contact.ftl">
					    <div class="money_info">
					   	<h3>你想悬赏多少钱呢？</h3>
					   	<p class="ft12">您悬赏越高，参与推手将越多，推广任务完成的质量也将越好。</p>
					   	<p><input type="text" size="20" class="text1" name="task.money" id="task_money" value="${(task.money)?default('')}">元</p>
					   	<ul>
							<li class="liTitle">赏金设定　<span style="color:#646464;font-size:12px;font-weight:normal;">粉丝数量越多的博主赏金应该越多，请分别指定赏金</span>　</li>
							<li class="dj_text">
								5-50 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;粉丝 <input name="task.fs1" type="text" class="text2 dj_input" id="xj1" value="${(task.fs1)?default(0.1)}"> 元　　
								51-100&nbsp;&nbsp; &nbsp;&nbsp;粉丝 <input name="task.fs2" type="text" class="text2 dj_input" id="xj2" value="${(task.fs2)?default(0.2)}"> 元　　
								101-200 &nbsp;&nbsp;&nbsp;粉丝 <input name="task.fs3" type="text" class="text2 dj_input" id="xj3" value="${(task.fs3)?default(0.3)}"> 元
							</li>
							<li class="dj_text">
								201-500&nbsp;&nbsp;&nbsp;&nbsp;粉丝 <input name="task.fs4" type="text" class="text2 dj_input" id="xj4" value="${(task.fs4)?default(0.5)}"> 元　　
								501-1000 &nbsp;&nbsp;粉丝 <input name="task.fs5" type="text" class="text2 dj_input" id="xj5" value="${(task.fs5)?default(0.7)}"> 元　　
								1001-1500&nbsp; 粉丝 <input name="task.fs6" type="text" class="text2 dj_input" id="xj6" value="${(task.fs6)?default(1)}"> 元
							</li>
							<li class="dj_text">
								1501-2000&nbsp; 粉丝 <input name="task.fs7" type="text" class="text2 dj_input" id="xj7" value="${(task.fs7)?default(1.2)}"> 元　　
								2001-2500 &nbsp;粉丝 <input name="task.fs8" type="text" class="text2 dj_input" id="xj8" value="${(task.fs8)?default(1.4)}"> 元　　
								2501-3000 &nbsp;粉丝 <input name="task.fs9" type="text" class="text2 dj_input" id="xj9" value="${(task.fs9)?default(1.6)}"> 元
							</li>
							<li class="dj_text">
								3001-3500 &nbsp;粉丝 <input name="task.fs10" type="text" class="text2 dj_input" id="xj10" value="${(task.fs10)?default(1.8)}"> 元　　
								3500-5000 &nbsp;粉丝 <input name="task.fs11" type="text" class="text2 dj_input" id="xj11" value="${(task.fs11)?default(2)}"> 元
								5000以上 &nbsp;&nbsp;粉丝 <input name="task.fs12" type="text" class="text2 dj_input" id="xj12" value="${(task.fs12)?default(3)}"> 元
							</li>
						</ul>
					    </div>
					    <#include "/WEB-INF/template/member/frag/common/days2.ftl">
					    
<script>
var preInfoArr = [];
preInfoArr[preInfoArr.length] = ['(1).推手需要注册有微博。\n(2).将雇主微博加为“收听”(“关注”)\n(3).将雇主微博里的内容转发到推手自己的微博，转发的微博内容不得删除，人工审核，删除者视为无效；\n(4).推手转发微博的同时，要求至少要@( 5 )个好友，无@好友者视为无效。\n(5).对雇主微博内容进行发言点评，无点评者视为无效；\n(6).转发+点评+加收听(加关注)到自己的微博即为一个稿件。\n以下是要转发的雇主微博地址：(              )','转发、点评、加关注后截图交稿，并附上自己的微博地址，人工审稿。'];
function selectDanjia(index){
	$('#task_content').val(preInfoArr[index][0]);
	$('#task_shenhe').val(preInfoArr[index][1]);
}
$(function(){
	//设置选择发帖单价
	selectDanjia(0);
});
</script>