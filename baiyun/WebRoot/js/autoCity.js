var autoCity = null;
function initAutoCity(inputId){
	autoCity=new AutoCity();
	autoCity.init(inputId);

}
function gE(x){return document.getElementById(x);}
function gETop(x){var t=0;while(x){t+=x.offsetTop;x=x.offsetParent;}return t;}
function gEBottom(x){return (x.offsetHeight+gETop(x));}
function gELeft(x){var l=0;while(x){l+=x.offsetLeft;x=x.offsetParent;}return l;}
function gERight(x){return (x.offsetWidth+gELeft(x));}

function isUpDownKey(kc){
	if(kc==40 || kc==38 || kc == 33 || kc== 34){//down,up,pageup,pagedown,enter
		return true;
	}else{
		return false;
	}
}
function isCtrlKey(kc){
	if(kc==16 || kc==17 || kc == 18){//shift,ctrl,alt
		return true;
	}else{
		return false;
	}
}

var apdata = "";

function AutoCity() {
	var inputobj = null;
	var sugdiv = null;
	var focusBySelect = false;
	var currInputObj = null;
	var prevInputValue = null;
	var showarr = null;
	var showfocus = -1;
	var FOCity = null;
	var onDocumentClick = null;
}

AutoCity.prototype.init = function(inputId){

	if(this.sugdiv==null){
		this.sugdiv=document.createElement('DIV');
		this.sugdiv.style.display='none';	 
		this.sugdiv.className='sug';
		this.sugdiv.style.zIndex=999;
 		this.sugdiv.innerHTML='';
		this.sugdiv.onscroll=OnSugScroll;
		var bs=document.getElementsByTagName('BODY');
		bs[0].appendChild(this.sugdiv);
	}
	this.focusBySelect = false;
	//this.currInputHdn = hdnInputId;
	var obj = gE(inputId);
	obj.onkeydown = OnInputKeyDown;
	obj.onfocus = OnInputFocus;
	//obj.onblur = OnInputBlur;
}
function OnSugScroll(){
	if(autoCity.currInputObj==null){return;}
	autoCity.focusBySelect=true;
	autoCity.currInputObj.focus();
}
function OnDocClick(e){
	var x,y,t,b,l,r;
	var d;
	if(window.event){
		e=window.event;
		x=e.clientX+document.body.parentNode.scrollLeft;
		y=e.clientY+document.body.parentNode.scrollTop;
	}else{
		x=e.pageX;
		y=e.pageY;
	}
	d=autoCity.currInputObj;
	if(!d){document.onclick=autoCity.onDocumentClick;return;}
	t=gETop(d);
	l=gELeft(d);
	b=gEBottom(d);
	r=gERight(d);
	if(x>=l && x<r && y>=t && y<b){return;}
	d=autoCity.sugdiv;
	t=gETop(d);
	l=gELeft(d);
	b=gEBottom(d);
	r=gERight(d);
	if(x>=l && x<r && y>=t && y<b){return;}
	autoCity.select();
}
var global_focus_flag=false;

function OnInputFocus(){

	global_focus_flag = true;
	autoCity.currInputObj = this;
	
	autoCity.prevInputValue = null;

	if(autoCity.focusBySelect){
		autoCity.focusBySelect=false;
		return;
	}
	autoCity.focusBySelect=false;
	InputChecking();
}

function OnInputBlur(){
	return;
}
function InputChecking(){
	if(autoCity.currInputObj == null) {
		return;
	}
	var v=autoCity.currInputObj.value;
	if(autoCity.prevInputValue==null || autoCity.prevInputValue!=v){
		if(v != "") {
			autoCity.update(v);
		} else {
			autoCity.hide();
		}
	}
	setTimeout("InputChecking()", 10);
}
function OnInputKeyDown(e){
	if(autoCity.currInputObj==null){
		autoCity.currInputObj = this;
		autoCity.prevInputValue = null;
		InputChecking();
	}
	var bCtrlDown=0;
	if(!e && window.event){
		e=window.event;
	}
	if(window.event){
		bCtrlDown=e.ctrlKey;
	}else{
		bCtrlDown=(e.modifiers & Event.CONTROL_MASK) > 0;
	}
	if(bCtrlDown){
		return true;
	}
	var kc=e.keyCode;
	if(isCtrlKey(kc)){
		return true;
	}
	return (InputRealKeyDown(kc));
}
function InputRealKeyDown(kc) {
	global_focus_flag = false;
	if(isUpDownKey(kc)){
		if(kc==38){// up
			autoCity.move(1,0);
		}else if(kc==40){//down
			autoCity.move(1,1);
		}else if(kc==33){//pageup
			autoCity.move(0,0);
		}else if(kc==34){//pagedown
			autoCity.move(0,1);
		}
		return false;
	}else if(kc==13){//enter
		autoCity.select();
		//document.event.keyCode=9;   // 默认提交查询。
		
		//alert(event.keyCode);
		
		//document.getElementsByTagName("3").focus();
		
		return false;
	}else if(kc==9){//tab
		autoCity.select();
		return true;
	}else if(kc==27){//esc
		autoCity.hide();
		return true;
	}
	return true;
}
function OnSugClick(){
	autoCity.select();
}
AutoCity.prototype.select = function() {

	if(this.sugdiv.style.display=='none'){return false;}
	if(this.showfocus>=0 && this.showarr!=null && this.showfocus<this.showarr.length && this.currInputObj!=null){
		var i=this.showarr[this.showfocus];
		this.currInputObj.value=apdata[i][0];
		//gE(this.currInputHdn).value = apdata[i][0];
		this.focusBySelect=true;
		this.currInputObj.focus();
		if(window.event){
			var r=this.currInputObj.createTextRange();
			r.move("character", r.text.length);
			r.select();
			
			//document.getElementsByTagName("").focus();
			
		}else{
			var v=apdata[i][0].length;
			this.currInputObj.setSelectionRange(v, v);			
		}
	}
	
	if(this.currInputObj.name=="targetCity"){
		document.getElementById("submit1").focus();
	}
	if(this.currInputObj.name=="dwname"){
		document.getElementById("submit3").focus();
	}

	
	this.hide();
}
AutoCity.prototype.highlight = function(idx) {
	if(this.sugdiv.style.display=='none'){return false;}
	if(idx==this.showfocus){return true;}
	var i;
	var ls = this.sugdiv.getElementsByTagName('LI');
	if(this.showfocus>=0&&this.showfocus<ls.length){
		ls[this.showfocus].className='';
	}
	if(idx>=0&&this.showfocus<ls.length){
		ls[idx].className='hover';
	}
	this.showfocus=idx;
}
AutoCity.prototype.move = function(m,n){
	var a=this.showfocus;
	if(m==1&&n==0){
		a--;
	}else if(m==1&&n==1){
		a++;
	}else if(m==0&&n==0){
		a-=5;
	}else if(m==0&&n==1){
		a+=5;
	}
	if(a<0){
		a=0;
	}else if(a>=this.showarr.length){
		a=this.showarr.length-1;
	}
	var i,j,k;
	i=(this.sugdiv.scrollTop)/20;
	if(a<=i){
		this.sugdiv.scrollTop=a*20;
	}else if(a>=i+10){
		this.sugdiv.scrollTop=(a-9)*20;
	}
	//alert(a);
	this.highlight(a);
}
AutoCity.prototype.hide = function(v) {
	if(this.sugdiv.style.display!='none'){
		this.sugdiv.style.display='none';
		document.onclick=this.onDocumentClick;
	}
}
AutoCity.prototype.update = function(v) {

	this.prevInputValue = v;
	v=v.toLowerCase();
	this.showfocus = -1;
	if(this.showarr==null){
		this.showarr = new Array();
	}else{
		this.showarr.length = 0;
	}
	var i,j,s;

	if(this.currInputObj.name=="targetCity"){
		apdata=eval(cun);
	}
//	if(this.currInputObj.name=="dwname"){
//		apdata=eval(dan);
//	}
	if(v.length!=0){
		for(i=0;i<apdata.length;i++){
			for(j=0;j<apdata[i].length;j++){
			  if((v>='a' && v<='z')||(v>='A' && v<='Z')||(v>='0' && v<='9')){	
				if(apdata[i][j].toLowerCase().indexOf(v) == 0){
					this.showarr[this.showarr.length]=i;
					break;
				}
			  }else{
				if(apdata[i][j].toLowerCase().indexOf(v) != -1){
						this.showarr[this.showarr.length]=i;
						break;  
			  }
			}
		}
	}
	}
	if(this.showarr.length<=0||(this.showarr.length==1&&v==apdata[this.showarr[0]][0])){
		this.hide();
		return;
	}
	if(global_focus_flag){
		return;
	}
   
	this.sugdiv.style.top=gEBottom(this.currInputObj)+"px";
	this.sugdiv.style.left=gELeft(this.currInputObj)+"px";
	this.sugdiv.style.width=this.currInputObj.offsetWidth;

	s='<ul>';
	
	for(i=0;i<this.showarr.length;i++){
		s+='<li'+(i==0?' class="hover"':'')+' onmousemove="autoCity.highlight('+i+')" onclick="OnSugClick();">'+apdata[this.showarr[i]][0]+'('+apdata[this.showarr[i]][1]+')</li>';
	}
	s+='</ul>';

	this.sugdiv.innerHTML=s;

	this.showfocus=0;
	this.sugdiv.style.zIndex=999;
	this.sugdiv.scrollTop = 0;
	this.sugdiv.style.display='block';

	this.onDocumentClick=document.onclick;
	document.onclick=OnDocClick;
	
}