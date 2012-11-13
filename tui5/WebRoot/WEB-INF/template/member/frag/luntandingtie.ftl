					    <h3>请输入您要顶贴的链接</h3>
					    <p>
							<INPUT id="taskURL" class="text1" name="task.url" value="${(task.url)?default('')}" size=70>
							<br/><span class="orange">建议雇主：您的帖子最好是发布在影响力非常大的论坛，还有您的帖子最好要有争议性。</span>
					    </p>
					    <#include "/WEB-INF/template/member/frag/common/title.ftl">
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
					   	<p>
					   	我需要<input type="text" size="10" class="text1" name="task.gaojianMount" id="task_gaojian_mount" value="${(task.gaojianMount)?default('')}">份稿件，每份
					   	<input type="text" size="10" class="text1" name="task.gaojianPrice" id="task_gaojian_price" readonly="readonly" value="${(task.gaojianPrice)?default('')}">元
					   	</p>
					   	<p class="ft12">您悬赏越高，参与推手将越多，推广任务完成的质量也将越好。</p>
					    </div>
					    <#include "/WEB-INF/template/member/frag/common/days2.ftl">
					    
<script>
$(function(){
	//单价和稿费的计算
	$('#task_money').blur(function(){
		var money = $(this).val();
		if(money == '' || !Validator.Currency.test(money)){
			$(this).val('');
			return false;
		}
		var price = $('#task_gaojian_price').val();
		var mount = $('#task_gaojian_mount').val();
		if(mount != '' && Validator.Integer.test(mount)){			
			var price = parseFloat(money) / parseInt(mount);
			$('#task_gaojian_price').val(price);
		}else if(price != '' && parseFloat(price) != 0){
			var mount = parseInt(parseFloat(money) / parseFloat(price));
			$('#task_gaojian_mount').val(mount);
		}
	});
	$('#task_gaojian_mount').blur(function(){
		var mount = $(this).val();
		if(mount == '' || !Validator.Integer.test(mount)){
			$(this).val('');
			return false;
		}
		var price = $('#task_gaojian_price').val();
		var money = $('#task_money').val();
		if(money != '' && Validator.Currency.test(money)){			
			var price = parseFloat(money) / parseInt(mount);
			$('#task_gaojian_price').val(price);
		}else if(price != '' && parseFloat(price) != 0){
			var money = parseFloat(parseInt(mount) * parseFloat(price));
			$('#task_money').val(money);
		}
	});
});
</script>