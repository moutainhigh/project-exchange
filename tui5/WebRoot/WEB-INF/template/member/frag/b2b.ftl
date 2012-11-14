					    <#include "/WEB-INF/template/member/frag/common/title.ftl">
					    <#include "/WEB-INF/template/member/frag/common/price_class_1.ftl">
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
var defaultContent = '1、将雇主的企业与产品信息，发布到（   ）行业的B2B平台。\n';
defaultContent += '2、推手注册B2B商贸平台，建立企业商铺，将“企业基本信息”发布上去，公司简介、联系方式等要尽量详细完整。\n';
defaultContent += '3、把雇主的（  ）条“产品信息”发布上去，注意保留信息中的图片、联系方式与网址等，不能修改产品信息的标题和内容。\n';
defaultContent += '4、雇主提供的资料已包括：企业基本信息（简介、联系人及方式、公司网站、营业执照、公司资质证书及荣誉证书等）、产品信息（详细的产品技术文字资料和产品图片等）。\n';
defaultContent += '5、推手发布一个B2B平台，发布（  ）条产品信息为一稿，一稿（  ）元。\n';
defaultContent += '6、统一使用账号：（雇主提供）注册，如果账号提示已注册，推手换一个B2B平台；密码：（推手自己设定，交稿时提交）。\n';
defaultContent += '7、发布的信息不登陆也能浏览，发布的企业信息和产品信息完整，即为合格。';
var defaultShenhe = '提交：1、企业B2B商铺主页网址链接；2、用户名、密码\n审核：雇主7天后亲自审稿，请广大推手放心完成任务；如雇主不审稿，10天后由三打哈系统审核。';
$(function(){
	//默认内容
	if($('#task_content').val() == ''){
		$('#task_content').val(defaultContent);
	}
	if($('#task_shenhe').val() == ''){
		$('#task_shenhe').val(defaultShenhe);
	}
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