
function copyCode(){
	 var clipBoardContent="";
      clipBoardContent+=this.location.href;
    window.clipboardData.setData("Text","���ڼ�ְ���ҵ�һ���õļ�ְ��Ϣ����Ҳ�����ɣ�"+clipBoardContent);

	alert("���Ƴɹ���������ֱ��ճ����Ctrl+V����QQ��MSN���Ƽ������ѡ�");}

document.write("&nbsp;&nbsp;����Ϣ��ַ:"+self.location);
document.write("&nbsp;&nbsp;&nbsp;<input type='button' style='vertical-align:middle;' name='Submit' onClick='copyCode()' value='<<<< ���ƴ���ַ����������'>");