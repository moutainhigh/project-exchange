					    <h3>��ѡ��������</h3>
					    <p>
							<input type="radio" value="0" name="danjia">�Զ���&nbsp;&nbsp;
							<input type="radio" value="0.25" name="danjia">0.25Ԫ��������̳�㷺������&nbsp;&nbsp;
							<input type="radio" value="1" name="danjia">1Ԫ���޶���̳��׼������&nbsp;&nbsp;
							<input type="radio" value="3" name="danjia">3Ԫ�������������ƹ�ؼ��ʣ�&nbsp;&nbsp;
							<input type="radio" value="10" name="danjia">10Ԫд������������ԭ�����Ӳ�������&nbsp;&nbsp;
					    </p>
					    <#include "/WEB-INF/template/member/frag/common/title.ftl">
					    <h3>�ƹ�Ҫ��</h3>
					    <p>
					   	<textarea size="60" id="task_content" class="txtArea4"type="text" name="task.content">${(task.content)?default('')}</textarea>
					   	<br/><span class="orange">�������Ҫ�󾡿��ܵ�д����� �Ա������Ǹ���Ч���Ϊ����������500�����Ļ�1000��Ӣ�����ڣ�</span>
					    </p>
					    <h3>��˱�׼</h3>
					    <p>
					   	<textarea size="60" id="task_shenhe" class="txtArea2" type="text" name="task.shenhe">${(task.shenhe)?default('')}</textarea>
					   	<br/><span class="orange">����������Ҫ�󾡿��ܵ�д����� �Ա������Ǹ���Ч���Ϊ��������</span>
					    </p>
					    <h3>�ϴ�����</h3>
					    <p>
					    <ul class="file-list" id="fujianList"></ul>
					   	<iframe frameborder="0" height="30" width="330" id="iframe" scrolling="no" src="/upload/task_upload.jsp"></iframe>
				   		<input type="hidden" name="task.attachment1" id="attachment"/>
					   	<br/><span class="orange">�����ϴ�5����������������������󲻳���2M��</span>
					    </p>
					    <#include "/WEB-INF/template/member/frag/common/contact.ftl">
					    <div class="money_info">
					   	<h3>�������Ͷ���Ǯ�أ�</h3>
					   	<p class="ft12">������Խ�ߣ��������ֽ�Խ�࣬�ƹ�������ɵ�����Ҳ��Խ�á�</p>
					   	<p><input type="text" size="20" class="text1" name="task.money" id="task_money" value="${(task.money)?default('')}">Ԫ</p>
					   	<p>
					   	����Ҫ<input type="text" size="10" class="text1" name="task.gaojianMount" id="task_gaojian_mount" value="${(task.gaojianMount)?default('')}">�ݸ����ÿ��
					   	<input type="text" size="10" class="text1" name="task.gaojianPrice" id="task_gaojian_price" readonly="readonly" value="${(task.gaojianPrice)?default('')}">Ԫ
					   	</p>
					   	<p class="ft12">������Խ�ߣ��������ֽ�Խ�࣬�ƹ�������ɵ�����Ҳ��Խ�á�</p>
					    </div>
					    
<script>
var preInfoArr = [];
preInfoArr[preInfoArr.length] = ['','','',''];
preInfoArr[preInfoArr.length] = ['1��������̳��ֻҪû��ɾ����ϸ񡣱����˹���������ע��Ҳ�ܲ鿴��\n2���������ṩ�����ӣ����������������������ϵĸ�����̳��\n3������ʱҪ���������������������룻��������к�����ַ��ͼƬ��ע�Ᵽ����\n4����һ����̳��һ�壬һ��0.25Ԫ��\n5�����ֲ����Ʒ�������Ŀ��','�����ṩ������ַ\n24Сʱ�������ϵͳ�Զ���ˣ���������\nϵͳ�������������Զ������ظ����塣'];
preInfoArr[preInfoArr.length] = ['1���������ṩ�����ӣ�����������������������(   )���͵���̳��\n2�����ӵı�����Ҫ�����������⣬����Ҫ�����������йأ������а����ؼ��֣�XXX��XXX��XXX��\n3������ʱҪ���������������������룻��������к�����ַ��ͼƬ��ע�Ᵽ����\n4�������˹���������ע��Ҳ�ܲ鿴����ɾ������Ч��\n5����һ����̳��һ�壬һ��1Ԫ��','�����ṩ������ַ\n���������˹���ˣ��������ϸ�Ҫ��������'];
preInfoArr[preInfoArr.length] = ['1��дһƪ����ժ��һƪ����XXXXXX���ؼ��ʣ������£����¿���������������������ƪ������ȫ���ƣ������޸�һ�±��⼰�׶Ρ��жμ�β�����ݣ�������������С�XXXXXX������ؼ���.\n2���� ��XXXXXX��Ϊ�ؼ�������̳�Ϸ�����ƪ���£��ؼ���Ҫ���ϳ����ӣ����ӵ�ַ��http://www.xxxxxx.com\n3�� ����������̳��Ҫ��������̳��ÿ����ֻ̳�ܷ�һ�Ρ�\n4�����ǵ����ӿ��ܱ�ɾ�����أ�һƪ�����跢������̳������һ��δ��ɾ����ϸ�\n5�������˹���������ע��Ҳ�ܲ鿴��','���������˹���ˣ��������ϸ�Ҫ��������\nαԭ��һƪ���ӣ�����Ϲؼ������ӣ�������������̳������һ��δ��ɾ������ϸ�'];
preInfoArr[preInfoArr.length] = ['��1���������Ϲ�������վ���˽�����Ĳ�Ʒ��ҵ����ַ����        ��\n��2������Χ�ƹ����ṩ�Ĺؼ��ʣ���      ����Ʒ�������һƪ���ӣ��������������������������Ϊ���䡣������������һ�������ӣ������ӹؼ��ʣ���      ������������ַ����        �������ӽ�β�������£��������ߣ�XXX��˾����ַ��\n��3����������300�����ϣ�����ͨ���׶������ӱ�����������������ú��йؼ��ʡ�\n��4��д�����Ӻ󣬽������������ġ�è�ˡ����ϡ���½�����ˡ��Ѻ������ס���Ѷ����ˡ�������ͬ���ٶ����ɡ��������ذ�顣���ǵ����ӿ��ܱ���̳ɾ�������أ�������ѡ�����е�����������̳�������ӣ�������һ����̳����ɾ����ϸ�','���������˹���ˣ��������ϸ�Ҫ��������\nԭ��һƪ���Ӳ�����������̳������һ��δ��ɾ������ϸ�'];
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
	//����ѡ��������
	$('input[name="danjia"]').each(function(index){
		$(this).click(function(){
			selectDanjia(this,index);
		});
		if($(this).val() == danjia)
			selectDanjia(this,index);
	});
	//���ۺ͸�ѵļ���
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