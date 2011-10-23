// JavaScript Document
marqueesHeight=document.all.sco_heigt.value;  //高
stopscroll=false;
with(marquees){
  style.width=141; //宽
  style.height=marqueesHeight;
  style.scrollamount=1
  style.overflowX="visible";
  style.overflowY="hidden";
  noWrap=false;
  onmouseover=new Function("stopscroll=true");
  onmouseout=new Function("stopscroll=false");
}
document.write('<div id="templayer" style="position:absolute;z-index:1;visibility:hidden"></div>');

preTop=0; currentTop=0;

function init(){
  templayer.innerHTML="";
  while(templayer.offsetHeight<marqueesHeight){
    templayer.innerHTML+=marquees.innerHTML;
  }
  marquees.innerHTML=templayer.innerHTML+templayer.innerHTML;
  setInterval("scrollUp()",100); //20为速度，越大越慢
}
document.body.onload=init;

function scrollUp(){
  if(stopscroll==true) return;
  preTop=marquees.scrollTop
  marquees.scrollTop+=1;
  if(preTop==marquees.scrollTop){
    marquees.scrollTop=templayer.offsetHeight-marqueesHeight;
    marquees.scrollTop+=1;
  }
}
