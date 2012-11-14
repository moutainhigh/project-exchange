					    <h3>请选择软文价格</h3>
					    <p>
							<input type="radio" value="0" name="danjia">自定义&nbsp;&nbsp;
							<input type="radio" value="50" name="danjia">100元两篇&nbsp;&nbsp;
							<input type="radio" value="100" name="danjia">100元一篇&nbsp;&nbsp;
							<input type="radio" value="200" name="danjia">200元一篇&nbsp;&nbsp;
							<input type="radio" value="300" name="danjia">300元一篇&nbsp;&nbsp;
					    </p>
					    <#include "/WEB-INF/template/member/frag/common/title.ftl">
					    <#include "/WEB-INF/template/member/frag/common/price_class_2.ftl">
					    <h3>任务要求</h3>
					    <p>
					   	<textarea size="60" id="task_content" class="txtArea4"type="text" name="task.content">${(task.content)?default('')}</textarea>
					   	<br/><span class="orange">请把您的要求尽可能的写清楚， 以便推手们更有效益的为您工作。（500个中文或1000个英文以内）</span>
					    </p>
					    <#include "/WEB-INF/template/member/frag/common/attachment.ftl">
					    <#include "/WEB-INF/template/member/frag/common/contact.ftl">
					    <div class="money_info">
					   	<h3>你想悬赏多少钱呢？</h3>
					   	<p class="ft12">您悬赏越高，参与推手将越多，推广任务完成的质量也将越好。</p>
					   	<p><input type="text" size="20" class="text1" name="task.money" id="task_money" value="${(task.money)?default('')}">元</p>
					   	<h3>选择中标模式</h3>
					   	<p>
					   		<input type="radio" name="task_priceclass" value="1" onclick="selectType(0)">
						    <label for="radio1">单人中标</label>　
						    <input type="radio" name="task_priceclass" value="2" onclick="selectType(1)">
						    <label for="radio2">多人中标</label>
					   	</p>
					   	<script>
					   	function selectType(t){
					   		if(t==0){
					   			$('#price_class').hide();
					   			$('input[name="task.priceClass"]').val(2);
					   			$('input[name="task_priceclass"]:eq(0)').attr('checked',true);
					   		}else if(t==1){
					   			$('#price_class').show();
					   			$('input[name="task.priceClass"]').val(3);
					   			$('input[name="task_priceclass"]:eq(1)').attr('checked',true);
					   		}
					   	}
					   	var rate1 = '${(task.rate1)?default("")}';
					   	var rate2 = '${(task.rate2)?default("")}';
					   	var rate3 = '${(task.rate3)?default("")}';
					   	$(function(){
					   		if(rate1 != '')
					   			setTimeout(function(){$('#rate1').val(rate1)},1);
					   		if(rate2 != '')
					   			setTimeout(function(){$('#rate2').val(rate2)},1);
					   		if(rate3 != '')
					   			setTimeout(function(){$('#rate3').val(rate3)},1);
					   		if($('#people1').val() == '')
					   			$('#people1').val(1);
					   		if($('#people2').val() == '')
					   			$('#people2').val(1);
					   		if($('#people3').val() == '')
					   			$('#people3').val(1);
					   		if(!$('input[name="task_priceclass"]:eq(0)').attr('checked') 
					   			&& !$('input[name="task_priceclass"]:eq(1)').attr('checked')){
					   			$('input[name="task_priceclass"]:eq(0)').attr('checked',true);
					   			$('input[name="task.priceClass"]').val(2);
					   		}else if($('input[name="task_priceclass"]:eq(1)').attr('checked')){
					   			selectType(1);
					   		}
					   	});
					   	</script>
					   	<p id="price_class" class="none">
					   		(不设某等奖,请输入0人)<br/>一等奖
							  <input name="task.people1" id="people1" type="text" class="text2" size="3" value="${(task.people1)?default('')}"/>
						    人，平分奖金的
						    <select name="task.rate1" id="rate1" style="font-weight:bold; color:#666;">
						      <option value="100">100%</option>
						      <option value="90">90%</option>
						      <option value="80">80%</option>
						      <option value="70" selected="selected">70%</option>
						      <option value="60">60%</option>
						      <option value="50">50%</option>
						      <option value="40">40%</option>
						      <option value="30">30%</option>
						      <option value="20">20%</option>
						      <option value="10">10%</option>
						      <option value="0">0%</option>
						      </select>
							  <span id="selFirstTxt"></span><br/>
							  二等奖
							  <input name="task.people2" id="people2" type="text" class="text2" size="3" value="${(task.people2)?default('')}"/>
						    人，平分奖金的
						    <select name="task.rate2" id="rate2" style="font-weight:bold; color:#666;">
						      <option value="100">100%</option>
						      <option value="90">90%</option>
						      <option value="80">80%</option>
						      <option value="70">70%</option>
						      <option value="60">60%</option>
						      <option value="50">50%</option>
						      <option value="40">40%</option>
						      <option value="30">30%</option>
						      <option value="20" selected="selected">20%</option>
						      <option value="10">10%</option>
						      <option value="0">0%</option>
						      </select>
							  <span id="selSecondTxt"></span><br/>
							  三等奖
							  <input name="task.people3" id="people3" type="text" class="text2" size="3" value="${(task.people3)?default('')}"/>
						    人，平分奖金的
						    <select name="task.rate3" id="rate3" style="font-weight:bold; color:#666;">
						      <option value="100">100%</option>
						      <option value="90">90%</option>
						      <option value="80">80%</option>
						      <option value="70">70%</option>
						      <option value="60">60%</option>
						      <option value="50">50%</option>
						      <option value="40">40%</option>
						      <option value="30">30%</option>
						      <option value="20">20%</option>
						      <option value="10" selected="selected">10%</option>
						      <option value="0">0%</option>
						      </select>
							  <span id="selThirdTxt"></span>							  
					   	</p>
					    </div>
					    <#include "/WEB-INF/template/member/frag/common/days7.ftl">
					    
<script>
var preInfoArr = [];
preInfoArr[preInfoArr.length] = ['','','',''];
preInfoArr[preInfoArr.length] = ['1、要求原创写作，内容和标题原创，不能抄袭。\n2、先了解我的产品和网站：www.xxx.com\n3、自拟标题，要有诱惑力，能吸引网民点击。\n4、字数300-500字，内容语言简练，内涵丰富，朗朗上口，易于记忆和传播。\n5、软文适合在论坛、博客、微博、门户网站等发布。',''];
preInfoArr[preInfoArr.length] = ['1、要求原创写作，内容和标题原创，不能抄袭。\n2、先了解我的产品和网站：www.xxx.com\n3、自拟题材，要有特色高质量的题材，标题要新颖，吸引足够的人气。\n4、软文内容要体现产品信息，不含明显的广告味；并且要有吸引力，可读性，可以以故事、体验，专业性等表现手法，或者以体会、心得来描写。\n5、字数500字以上，内容语言简练，内涵丰富，朗朗上口，易于记忆和传播。\n6、软文适合在论坛、博客、微博、门户网站等发布。',''];
preInfoArr[preInfoArr.length] = ['1、要求原创写作，内容和标题原创，不能抄袭。\n2、先了解我的产品和网站：www.xxx.com\n3、软文题材切合当前的时事热点、网络热门事件，不能有明显的广告特征，以便于软文的推广与传播。\n4、软文内容要融入产品信息，图文并茂；并且要有吸引力，可读性；以记者体验、新闻报道、专业性报道等表现手法写作。\n5、字数500-800字，围绕我的产品和网站展开写作，文笔通俗易懂，让人印象深刻，能让消费者看了能产生使用的欲望。\n6、软文适合在新闻门户网站、论坛、博客、微博等发布。'];
preInfoArr[preInfoArr.length] = ['1、要求原创写作，内容和标题原创，不能抄袭。\n2、先了解我的产品和网站：www.xxx.com\n3、有新颖吸引眼球的标题，让人一看就有点击查看的冲动；\n4、字数在500-800字为佳，软文导向性强，能让消费者看了能产生购买的欲望。\n5、软文题材切合当前的时事热点、网络热门事件；图文并茂，可读性强；要显得自然、富有趣味，无广告味，以利于软文的推广与传播。\n6、软文内容要融入我的产品信息，以记者体验、新闻报道、专业性报道等表现手法写作；内容要能引起点击和共鸣，能吸引网友参与讨论。\n7、软文适合在新闻门户网站、论坛、博客、微博等发布。'];
function selectDanjia(dom, index){
	if($(dom).attr('checked')){
		$('#task_content').val(preInfoArr[index][0]);
		danjia = dom.value;
		try{danjia = parseInt(danjia);}catch(e){}
		if(danjia>=100){
			$('#task_money').val(danjia);
			selectType(0);
		}else if(danjia==50){
			$('#task_money').val(danjia*2);
			selectType(1);
			setTimeout(function(){$('#rate1').val('100');},1);
			setTimeout(function(){$('#rate2').val('0');},1);
			setTimeout(function(){$('#rate3').val('0');},1);
			$('#people1').val(2);
			$('#people2').val(0);
			$('#people3').val(0);
		}else{
			$('#task_money').val('');
			selectType(0);
		}
	}
}
var danjia = '${(req.getParameter("danjia"))?default("")}';
$(function(){
	//设置选择发帖单价
	$('input[name="danjia"]').each(function(index){
		$(this).click(function(){
			selectDanjia(this,index);
		});
		if($(this).val() == danjia)
			selectDanjia(this,index);
	});
	//单价和稿费的计算
	
});
</script>