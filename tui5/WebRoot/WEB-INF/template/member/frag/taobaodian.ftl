					    <h3>��ѡ���ƹ㷽��</h3>
					    <p>
							<input type="radio" value="1" name="danjia">�����ղط���&nbsp;&nbsp;
							<input type="radio" value="2" name="danjia">�ۻ�����&nbsp;&nbsp;
							<input type="radio" value="3" name="danjia">�Ա���������&nbsp;&nbsp;
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
					    <#include "/WEB-INF/template/member/frag/common/attachment.ftl">
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
					    <#include "/WEB-INF/template/member/frag/common/days2.ftl">
					    
<script>
var preInfoArr = [];
preInfoArr[preInfoArr.length] = ['���ղص��� + �ղ�3������ + ������� Ϊһ�壬1Ԫһ��,������ɾ����\n1������Ҫ��1�������й����׼�¼���Ա��˺Ž����ղغͷ����ύ���ʱ���ύ�Ա�ID�ͽ�ͼ��\n��ͼ���ݣ������ղؽ�ͼ�������ղؽ�ͼ��������̽�ͼ����ͼ���뺬���Լ�ID���ܺϸ�\n2���������ɣ��ص�д���ڱ����������Լ۱ȡ�����֮������ݡ�\n����������10�����ϣ��ظ���д�����ƣ�û�����۵���Ϊ���ϸ񡣲�����д���ص�д���ڱ����������Լ۱ȡ�����֮������ݣ�\n3����ע���ղ�ʱ��Ҫ�㡰���Լ��ɼ������ղغ���ɾ���ղأ�������ϸ�\n4���ղع��ҵĵ��̵ľͲ�Ҫ�ظ��ղ���ร�������ᶨ�ڶ�η�����лл��ҵĺ�����\n5�������ַ��http://xxxxxxx','�ύ��1���Ա�ID:XXX��2�������������ղ�֤����ͼ������������'];
preInfoArr[preInfoArr.length] = ['1����½�Ա��˺ţ�Ҫ�����õȼ�5�ǲ��Ҹ��˺��������ڲμӹ��ۻ��㣡��\n2����ͶƱҳ�棺\n3������������š�(����ж���˺ţ����Զ�Ͷ��)\n4�����ɹ�ͶƱ��ͼ����Ҫ�����Ա��˺ź�ͶƱ�ɹ�����˹��󣬸�Ӷ��\n5��ͶƱ�ɹ���һ�壬ÿ��1Ԫ��\n�Ա�����ַ��xxx\n','�ṩͶƱ�ɹ��Ľ�ͼ'];
preInfoArr[preInfoArr.length] = ['1��ÿ��ID��ඥ5����ͬһ��ID��������������ÿ���������5�������ϣ��ɻ�ID���� \n2���ظ��Ļ�Ҫ��ӭ�����⣬20�����ϡ�Ҫ����Ա������ݵĿ�����Ҫ���ͣ��ź���������\n3��5��Ϊһ�壬һ��1Ԫ\n4����������(   )','����ID�� ����¥��ͽ�ͼ������������  9¥ +��ͼ'];
function selectDanjia(dom, index){
	if($(dom).attr('checked')){
		$('#task_content').val(preInfoArr[index][0]);
		$('#task_shenhe').val(preInfoArr[index][1]);
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