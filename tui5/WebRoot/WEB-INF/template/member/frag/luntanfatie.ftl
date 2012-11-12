					    <h3>请选择发帖单价</h3>
					    <p>
							<input type="radio" value="0" name="danjia">自定义&nbsp;&nbsp;
							<input type="radio" value="0.25" name="danjia">0.25元（不限论坛广泛发帖）&nbsp;&nbsp;
							<input type="radio" value="1" name="danjia">1元（限定论坛精准发帖）&nbsp;&nbsp;
							<input type="radio" value="3" name="danjia">3元（增加外链及推广关键词）&nbsp;&nbsp;
							<input type="radio" value="10" name="danjia">10元写帖发帖（推手原创帖子并发布）&nbsp;&nbsp;
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
					    <h3>上传附件</h3>
					    <p>
					    <ul class="file-list" id="fujianList"></ul>
					   	<iframe frameborder="0" height="30" width="330" id="iframe" scrolling="no" src="/upload/task_upload.jsp"></iframe>
				   		<input type="hidden" name="task.attachment1" id="attachment"/>
					   	<br/><span class="orange">最多可上传5个附件，单个附件容量最大不超过2M。</span>
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
					    
<script>
var preInfoArr = [];
preInfoArr[preInfoArr.length] = ['','','',''];
preInfoArr[preInfoArr.length] = ['1、不限论坛，只要没被删就算合格。必须人工发帖，不注册也能查看。\n2、将雇主提供的帖子（见附件）发布到互联网上的各大论坛。\n3、发帖时要保持帖子内容完整、整齐；如果帖子中含有网址或图片，注意保留。\n4、发一个论坛算一稿，一稿0.25元。\n5、推手不限制发帖的数目。','推手提供发帖网址\n24小时后三打哈系统自动审核，雇主不审。\n系统审核软件已设置自动屏蔽重复交稿。'];
preInfoArr[preInfoArr.length] = ['1、将雇主提供的帖子（见附件）发布到互联网上(   )类型的论坛。\n2、帖子的标题需要推手重新自拟，标题要与帖子内容有关，标题中包含关键字：XXX、XXX、XXX。\n3、发帖时要保持帖子内容完整、整齐；如果帖子中含有网址或图片，注意保留。\n4、必须人工发帖，不注册也能查看，被删帖子无效。\n5、发一个论坛算一稿，一稿1元。','推手提供发帖网址\n雇主亲自人工审核，请推手严格按要求做任务。'];
preInfoArr[preInfoArr.length] = ['1、写一篇或者摘抄一篇关于XXXXXX（关键词）的文章，文章可以在网上搜索但不能整篇文章完全复制，必须修改一下标题及首段、中段及尾段内容，文章里面必须有“XXXXXX”这个关键词.\n2、以 “XXXXXX”为关键词在论坛上发布这篇文章，关键词要带上超链接，链接地址是http://www.xxxxxx.com\n3、 发高质量论坛不要发垃圾论坛，每个论坛只能发一次。\n4、考虑到帖子可能被删的因素，一篇文章需发三个论坛，至少一个未被删就算合格。\n5、必须人工发帖，不注册也能查看。','雇主亲自人工审核，请推手严格按要求做任务。\n伪原创一篇帖子（需加上关键词链接）并发到三个论坛，至少一个未被删，就算合格。'];
preInfoArr[preInfoArr.length] = ['（1）推手先上雇主的网站，了解雇主的产品及业务，网址：（        ）\n（2）推手围绕雇主提供的关键词：（      ）产品，整理成一篇帖子，可以在网络上搜索相关资料作为补充。帖子中至少有一个超链接，超链接关键词：（      ），超链接网址：（        ）。帖子结尾必须留下：本文作者：XXX公司，网址。\n（3）帖子字数300字以上，内容通俗易懂。帖子标题吸引网民眼球，最好含有关键词。\n（4）写完帖子后，将它发布到天涯、猫扑、凯迪、西陆、新浪、搜狐、网易、腾讯、凤凰、西祠胡同、百度贴吧、豆瓣的相关版块。考虑到帖子可能被论坛删除的因素，推手需选择其中的至少三个论坛发布帖子，至少有一个论坛不被删才算合格。','雇主亲自人工审核，请推手严格按要求做任务。\n原创一篇帖子并发到三个论坛，至少一个未被删，就算合格。'];
function selectDanjia(dom, index){
	if($(dom).attr('checked')){
		$('#task_content').val(preInfoArr[index][0]);
		$('#task_shenhe').val(preInfoArr[index][1]);
		$('#task_gaojian_price').val($(dom).val());
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