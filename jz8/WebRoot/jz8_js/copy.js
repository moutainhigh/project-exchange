
function copyCode(){
	 var clipBoardContent="";
      clipBoardContent+=this.location.href;
    window.clipboardData.setData("Text",clipBoardContent);

	alert("���Ƴɹ���������ֱ��ճ����Ctrl+V����QQ��MSN���Ƽ������ѡ�");}
document.write("<br><textarea  onfocus=this.select() style='width:45%;overflow-y:visible;' ondblclick=copyCode() rows=1>");
document.write(self.location+"</textarea>");
document.write("&nbsp;<input type='button' name='Submit' onClick='copyCode()' value='������ַ������QQ/MSN�ϵĺ���'><br>");