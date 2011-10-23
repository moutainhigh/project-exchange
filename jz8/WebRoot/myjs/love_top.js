    addContent  = '';
    addContent += '<div id="F" style="border: 0 solid blue;position: absolute;top:0px;left:0px;right:0px;width:100%">';
    addContent += '  <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="100%" height="30" id="F" align="">';
    addContent += '  <param name=movie value="../images/top.swf">';
    addContent += '  <param name=quality value=high>';
    addContent += '  <param name=wmode value=transparent>';
    addContent += '  <param name=bgcolor value=#ffffff>';
    addContent += '  <embed src="../images/top.swf" quality=high wmode=transparent bgcolor=#ffffff  width="100%" height="20" name="F" align="" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"></embed>';
    addContent += '</object>';
    addContent += '</div>';
    function openAlime() {
        document.write(addContent);
    }
    openAlime();