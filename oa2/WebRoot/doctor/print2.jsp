<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<title>医生注册证书打印</title>
		<script type="text/javascript" src="${appPath}/js/jquery.js"></script>
		<style type="text/css">
<!--
body{background:url('${appPath}/doctor/back2.jpg') left top no-repeat;font-size:24px;font-weight:600;text-align: center;}
.style5 {
	color: #FFDDBB;
	font-size: 36px;
	font-family: "方正舒体";
}

.style6 {
	font-size: 14px;
	color: #FFFFFF;
}

.style7 {
	font-family: "华文行楷";
	font-size: 18px;
}

.style8 {
	color: #FFFFFF
}

.style9 {
	font-size: 30px
}

.style11 {
	color: #CCFFFF;
	font-size: 18px;
}
.Layer span{
	margin: 0 75px;
}
#Layer10 span{
	margin: 0 60px;
}
-->
</style>
		<script language="JavaScript" type="text/JavaScript"> 
<!-- 
function MM_reloadPage(init) { //reloads the window if Nav4 resized 
if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) { 
document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }} 
else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload(); 
} 
MM_reloadPage(true); 

function MM_findObj(n, d) { //v4.01 
var p,i,x; if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) { 
d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);} 
if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n]; 
for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document); 
if(!x && d.getElementById) x=d.getElementById(n); return x; 
} 

function MM_dragLayer(objName,x,hL,hT,hW,hH,toFront,dropBack,cU,cD,cL,cR,targL,targT,tol,dropJS,et,dragJS) { //v4.01 
//Copyright 1998 Macromedia, Inc. All rights reserved. 
var i,j,aLayer,retVal,curDrag=null,curLeft,curTop,IE=document.all,NS4=document.layers; 
var NS6=(!IE&&document.getElementById), NS=(NS4||NS6); if (!IE && !NS) return false; 
retVal = true; if(IE && event) event.returnValue = true; 
if (MM_dragLayer.arguments.length > 1) { 
curDrag = MM_findObj(objName); if (!curDrag) return false; 
if (!document.allLayers) { document.allLayers = new Array(); 
with (document) if (NS4) { for (i=0; i<layers.length; i++) allLayers[i]=layers[i]; 
for (i=0; i<allLayers.length; i++) if (allLayers[i].document && allLayers[i].document.layers) 
with (allLayers[i].document) for (j=0; j<layers.length; j++) allLayers[allLayers.length]=layers[j]; 
} else { 
if (NS6) { var spns = getElementsByTagName("span"); var all = getElementsByTagName("div"); 
for (i=0;i<spns.length;i++) if (spns[i].style&&spns[i].style.position) allLayers[allLayers.length]=spns[i];} 
for (i=0;i<all.length;i++) if (all[i].style&&all[i].style.position) allLayers[allLayers.length]=all[i]; 
} } 
curDrag.MM_dragOk=true; curDrag.MM_targL=targL; curDrag.MM_targT=targT; 
curDrag.MM_tol=Math.pow(tol,2); curDrag.MM_hLeft=hL; curDrag.MM_hTop=hT; 
curDrag.MM_hWidth=hW; curDrag.MM_hHeight=hH; curDrag.MM_toFront=toFront; 
curDrag.MM_dropBack=dropBack; curDrag.MM_dropJS=dropJS; 
curDrag.MM_everyTime=et; curDrag.MM_dragJS=dragJS; 
curDrag.MM_oldZ = (NS4)?curDrag.zIndex:curDrag.style.zIndex; 
curLeft= (NS4)?curDrag.left:(NS6)?parseInt(curDrag.style.left):curDrag.style.pixelLeft; 
if (String(curLeft)=="NaN") curLeft=0; curDrag.MM_startL = curLeft; 
curTop = (NS4)?curDrag.top:(NS6)?parseInt(curDrag.style.top):curDrag.style.pixelTop; 
if (String(curTop)=="NaN") curTop=0; curDrag.MM_startT = curTop; 
curDrag.MM_bL=(cL<0)?null:curLeft-cL; curDrag.MM_bT=(cU<0)?null:curTop-cU; 
curDrag.MM_bR=(cR<0)?null:curLeft+cR; curDrag.MM_bB=(cD<0)?null:curTop+cD; 
curDrag.MM_LEFTRIGHT=0; curDrag.MM_UPDOWN=0; curDrag.MM_SNAPPED=false; //use in your JS! 
document.onmousedown = MM_dragLayer; document.onmouseup = MM_dragLayer; 
if (NS) document.captureEvents(Event.MOUSEDOWN|Event.MOUSEUP); 
} else { 
var theEvent = ((NS)?objName.type:event.type); 
if (theEvent == 'mousedown') { 
var mouseX = (NS)?objName.pageX : event.clientX + document.body.scrollLeft; 
var mouseY = (NS)?objName.pageY : event.clientY + document.body.scrollTop; 
var maxDragZ=null; document.MM_maxZ = 0; 
for (i=0; i<document.allLayers.length; i++) { aLayer = document.allLayers[i]; 
var aLayerZ = (NS4)?aLayer.zIndex:parseInt(aLayer.style.zIndex); 
if (aLayerZ > document.MM_maxZ) document.MM_maxZ = aLayerZ; 
var isVisible = (((NS4)?aLayer.visibility:aLayer.style.visibility).indexOf('hid') == -1); 
if (aLayer.MM_dragOk != null && isVisible) with (aLayer) { 
var parentL=0; var parentT=0; 
if (NS6) { parentLayer = aLayer.parentNode; 
while (parentLayer != null && parentLayer.style.position) { 
parentL += parseInt(parentLayer.offsetLeft); parentT += parseInt(parentLayer.offsetTop); 
parentLayer = parentLayer.parentNode; 
} } else if (IE) { parentLayer = aLayer.parentElement; 
while (parentLayer != null && parentLayer.style.position) { 
parentL += parentLayer.offsetLeft; parentT += parentLayer.offsetTop; 
parentLayer = parentLayer.parentElement; } } 
var tmpX=mouseX-(((NS4)?pageX:((NS6)?parseInt(style.left):style.pixelLeft)+parentL)+MM_hLeft); 
var tmpY=mouseY-(((NS4)?pageY:((NS6)?parseInt(style.top):style.pixelTop) +parentT)+MM_hTop); 
if (String(tmpX)=="NaN") tmpX=0; if (String(tmpY)=="NaN") tmpY=0; 
var tmpW = MM_hWidth; if (tmpW <= 0) tmpW += ((NS4)?clip.width :offsetWidth); 
var tmpH = MM_hHeight; if (tmpH <= 0) tmpH += ((NS4)?clip.height:offsetHeight); 
if ((0 <= tmpX && tmpX < tmpW && 0 <= tmpY && tmpY < tmpH) && (maxDragZ == null 
|| maxDragZ <= aLayerZ)) { curDrag = aLayer; maxDragZ = aLayerZ; } } } 
if (curDrag) { 
document.onmousemove = MM_dragLayer; if (NS4) document.captureEvents(Event.MOUSEMOVE); 
curLeft = (NS4)?curDrag.left:(NS6)?parseInt(curDrag.style.left):curDrag.style.pixelLeft; 
curTop = (NS4)?curDrag.top:(NS6)?parseInt(curDrag.style.top):curDrag.style.pixelTop; 
if (String(curLeft)=="NaN") curLeft=0; if (String(curTop)=="NaN") curTop=0; 
MM_oldX = mouseX - curLeft; MM_oldY = mouseY - curTop; 
document.MM_curDrag = curDrag; curDrag.MM_SNAPPED=false; 
if(curDrag.MM_toFront) { 
eval('curDrag.'+((NS4)?'':'style.')+'zIndex=document.MM_maxZ+1'); 
if (!curDrag.MM_dropBack) document.MM_maxZ++; } 
retVal = false; if(!NS4&&!NS6) event.returnValue = false; 
} } else if (theEvent == 'mousemove') { 
if (document.MM_curDrag) with (document.MM_curDrag) { 
var mouseX = (NS)?objName.pageX : event.clientX + document.body.scrollLeft; 
var mouseY = (NS)?objName.pageY : event.clientY + document.body.scrollTop; 
newLeft = mouseX-MM_oldX; newTop = mouseY-MM_oldY; 
if (MM_bL!=null) newLeft = Math.max(newLeft,MM_bL); 
if (MM_bR!=null) newLeft = Math.min(newLeft,MM_bR); 
if (MM_bT!=null) newTop = Math.max(newTop ,MM_bT); 
if (MM_bB!=null) newTop = Math.min(newTop ,MM_bB); 
MM_LEFTRIGHT = newLeft-MM_startL; MM_UPDOWN = newTop-MM_startT; 
if (NS4) {left = newLeft; top = newTop;} 
else if (NS6){style.left = newLeft; style.top = newTop;} 
else {style.pixelLeft = newLeft; style.pixelTop = newTop;} 
if (MM_dragJS) eval(MM_dragJS); 
retVal = false; if(!NS) event.returnValue = false; 
} } else if (theEvent == 'mouseup') { 
document.onmousemove = null; 
if (NS) document.releaseEvents(Event.MOUSEMOVE); 
if (NS) document.captureEvents(Event.MOUSEDOWN); //for mac NS 
if (document.MM_curDrag) with (document.MM_curDrag) { 
if (typeof MM_targL =='number' && typeof MM_targT == 'number' && 
(Math.pow(MM_targL-((NS4)?left:(NS6)?parseInt(style.left):style.pixelLeft),2)+ 
Math.pow(MM_targT-((NS4)?top:(NS6)?parseInt(style.top):style.pixelTop),2))<=MM_tol) { 
if (NS4) {left = MM_targL; top = MM_targT;} 
else if (NS6) {style.left = MM_targL; style.top = MM_targT;} 
else {style.pixelLeft = MM_targL; style.pixelTop = MM_targT;} 
MM_SNAPPED = true; MM_LEFTRIGHT = MM_startL-MM_targL; MM_UPDOWN = MM_startT-MM_targT; } 
if (MM_everyTime || MM_SNAPPED) eval(MM_dropJS); 
if(MM_dropBack) {if (NS4) zIndex = MM_oldZ; else style.zIndex = MM_oldZ;} 
retVal = false; if(!NS) event.returnValue = false; } 
document.MM_curDrag = null; 
} 
if (NS) document.routeEvent(objName); 
} return retVal; 
} 


function init(){
	//MM_dragLayer('Layer1','',0,0,0,0,true,false,-1,-1,-1,-1,100,190,20,'',false,'');
	//MM_dragLayer('Layer2','',0,0,0,0,true,false,-1,-1,-1,-1,100,190,20,'',false,'');
	for(var i=1;i<=10;i++){
		if(document.getElementById('Layer'+i)){
			MM_dragLayer('Layer'+i,'',0,0,0,0,true,false,-1,-1,-1,-1,100,190,20,'',false,'');
		}
	}
}

$(function(){
	$.getJSON("${appPath}/doctor/json/json${op}.txt", function(json){
		//alert("JSON Data: " + json.users[3].name);
		//alert(json.length);
		for(var i=1;i<=10;i++){
			$('#Layer'+i).css({'left':json[i-1][0]+'px','top':json[i-1][1]+'px'});
			//alert('we');
		}
	}); 
});

function savePos(){
	var str = '[';
	$('.Layer').each(function(index){
		var left = $(this).offset().left;
		var top = $(this).offset().top;
		str += '['+left+','+top+'],';
	});
	str += ']';
	//alert(str);
	$.getJSON("${appPath}/doctor.do?method=savePos&json2="+str, function(json){
		alert('保留成功');
	});
}
//-->
</script>
<!--media=print   这个属性可以在打印时有效-->
<style   media=print>
.Noprint{display:none;}
</style> 
	</head>

	<body leftmargin="0" topmargin="0"
		onLoad="init()">
		<OBJECT     id=WebBrowser     classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2     height=0     width=0   VIEWASTEXT>
    </OBJECT>
    <div style="z-index:1;width:1488px;height:1067px;">
    
    </div>
		<div id="Layer1" class="Layer" style="position: absolute; width: 600px; height: 50px; z-index: 2; left: 488px; top: 212px;">
			<fmt:formatDate value = "${cr.date}" pattern = "yyyy-MM-dd"/>
		</div>
		<div id="Layer2" class="Layer" style="position: absolute; width: 600px; height: 50px; z-index: 3; left: 430px; top: 182px;">
			${cr.content }
		</div>
		<div id="Layer3" class="Layer" style="position: absolute; width: 600px; height: 50px; z-index: 4; left: 430px; top: 182px;">
			<fmt:formatDate value = "${tr.date}" pattern = "yyyy-MM-dd"/>
		</div>
		<div id="Layer4" class="Layer" style="position: absolute; width: 600px; height: 50px; z-index: 4; left: 430px; top: 182px;">
			${tr.content }
		</div>
	</body>
</html>

