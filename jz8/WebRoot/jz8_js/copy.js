
function copyCode(){
	 var clipBoardContent="";
      clipBoardContent+=this.location.href;
    window.clipboardData.setData("Text",clipBoardContent);

	alert("复制成功，您可以直接粘贴（Ctrl+V）到QQ或MSN上推荐给好友。");}
document.write("<br><textarea  onfocus=this.select() style='width:45%;overflow-y:visible;' ondblclick=copyCode() rows=1>");
document.write(self.location+"</textarea>");
document.write("&nbsp;<input type='button' name='Submit' onClick='copyCode()' value='复制网址，传给QQ/MSN上的好友'><br>");