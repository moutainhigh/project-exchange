
function copyCode(){
	 var clipBoardContent="";
      clipBoardContent+=this.location.href;
    window.clipboardData.setData("Text","我在兼职吧找到一条好的兼职信息，您也看看吧！"+clipBoardContent);

	alert("复制成功，您可以直接粘贴（Ctrl+V）到QQ或MSN上推荐给好友。");}

document.write("&nbsp;&nbsp;本信息网址:"+self.location);
document.write("&nbsp;&nbsp;&nbsp;<input type='button' style='vertical-align:middle;' name='Submit' onClick='copyCode()' value='<<<< 复制此网址，传给好友'>");