					    <h3>请选择推广方法</h3>
					    <p>
							<input type="radio" value="1" name="danjia">店铺收藏分享&nbsp;&nbsp;
							<input type="radio" value="2" name="danjia">聚划算团&nbsp;&nbsp;
							<input type="radio" value="3" name="danjia">淘宝社区顶贴&nbsp;&nbsp;
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
					    <#include "/WEB-INF/template/member/frag/common/attachment.ftl">
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
var preInfoArr = [];
preInfoArr[preInfoArr.length] = ['“收藏店铺 + 收藏3个宝贝 + 分享店铺 为一稿，1元一稿,分享不得删除。\n1、必须要用1心以上有过交易记录的淘宝账号进行收藏和分享，提交稿件时需提交淘宝ID和截图。\n截图内容：店铺收藏截图、宝贝收藏截图、分享店铺截图，截图必须含有自己ID才能合格。\n2、分享理由：重点写关于宝贝质量、性价比、服务之类的内容。\n（评论需在10字以上，重复填写，复制，没有评论的视为不合格。不能乱写，重点写关于宝贝质量、性价比、服务之类的内容）\n3、请注意收藏时不要点“仅自己可见”，收藏后不能删除收藏，稿件不合格！\n4、收藏过我的店铺的就不要重复收藏了喔，本任务会定期多次发布，谢谢大家的合作。\n5、网店地址：http://xxxxxxx','提交（1）淘宝ID:XXX（2）宝贝、店铺收藏证明截图（必须清晰）'];
preInfoArr[preInfoArr.length] = ['1、登陆淘宝账号（要求：信用等级5星并且该账号三个月内参加过聚划算！）\n2、打开投票页面：\n3、点击，我想团。(如果有多个账号，可以多投！)\n4、将成功投票截图贴，要看到淘宝账号和投票成功，审核过后，付佣金！\n5、投票成功算一稿，每稿1元。\n淘宝店网址：xxx\n','提供投票成功的截图'];
preInfoArr[preInfoArr.length] = ['1、每个ID最多顶5贴，同一个ID不能连续顶贴，每贴相隔必须5分钟以上，可换ID顶。 \n2、回复的话要求迎合主题，20字以上。要发表对本帖内容的看法，要加油，呐喊，助威！\n3、5贴为一稿，一稿1元\n4、顶贴链接(   )','留下ID和 顶贴楼层和截图，举例：张三  9楼 +截图'];
function selectDanjia(dom, index){
	if($(dom).attr('checked')){
		$('#task_content').val(preInfoArr[index][0]);
		$('#task_shenhe').val(preInfoArr[index][1]);
		danjia = dom.value;
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
	$('#task_money').blur(function(){
		var money = $(this).val();
		if(money == '' || !Validator.Currency.test(money)){
			$(this).val('');
			return false;
		}
		var price = $('#task_gaojian_price').val();
		var mount = $('#task_gaojian_mount').val();
		if(danjia == '0' && mount != '' && Validator.Integer.test(mount)){			
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
		if(danjia == '0' && money != '' && Validator.Currency.test(money)){			
			var price = parseFloat(money) / parseInt(mount);
			$('#task_gaojian_price').val(price);
		}else if(price != '' && parseFloat(price) != 0){
			var money = parseFloat(parseInt(mount) * parseFloat(price));
			$('#task_money').val(money);
		}
	});
});
</script>