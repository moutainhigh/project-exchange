//点击层外关闭层
function closeAllDiv(layer0,but0){

	obj = document.activeElement;
	flag = true;
	var i=0;
	while(obj != null && flag)
	{
		i++;
		if(obj.id == layer0 || obj.id == but0)
		{
			flag = false;
		}

		obj = obj.parentElement;
	}

	if(flag&i>0)
	{
		obj0 = document.getElementById(layer0);

		obj0.style.display = "none";
 	    showSelect(layer0);
	}

}


function showOrHid(objId){
	obj=document.getElementById(objId);
	if(obj==null) return;
	if(obj.style.display==""){
	  obj.style.display="none";
	}else{
	  obj.style.display=""
	}
}

function show(objId){
	obj=document.getElementById(objId);
	obj.style.display="";
}

function ridFromAry(str,ary){
	var strResult="";
    for(i=0;i<ary.length;i++){
	//alert("ary="+ary[i]+":str="+str);
	    if(ary[i]==str){
	       continue;
	    }else{
	       if(strResult==""){
		       strResult=ary[i];
		   }else{
		      strResult+=","+ary[i];
		   }
	   }
	}
    return strResult;
}

/** 判断变量值是否存在数组元素中
@param strAim 目标变量
@param arySource 要判断的数组
@return true变量存在于数组中，false变量不在数组中
*/
function inAry(strAim,arySource){
  for(h=0;h<arySource.length;h++){
    if(strAim==arySource[h]){
	  return true;
	  break;
	}
  }
  return false;
}

/** 判断变量值是否存在数组元素中
@param strAim 目标变量
@param arySource 要判断的数组
@return 变量存在于数组中的第一维的位置，－1变量不在数组中
*/
function inAryIndex(strAim,arySource){
  for(h=0;h<arySource.length;h++){
    if(strAim==arySource[h]){
	  return h;
	  break;
	}
  }
  return -1;
}

/** 判断变量值是否存在数组元素中
@param strAim 目标变量
@param arySource 要判断的数组为二维数组
@return 变量存在于数组中的第一维的位置，－1变量不在数组中
*/
function inAry2(strAim,arySource){
  for(h=0;h<arySource.length;h++){
    if(strAim==arySource[h][3]){
	  return h;
	  break;
	}
  }
  return -1;
}

function divClose(strDiv){
  var oDiv=document.getElementById(strDiv);
  var t   =document.getElementById("temp");
  if(t!=null) document.getElementById("temp").value=1;
  if(oDiv!=null) oDiv.style.display="none";
  showSelect(strDiv);
}

//将悬浮层的位置定位在屏幕中央
function setDivInCenter(divId){
	var objdiv=document.getElementById(divId);
    x = document.body.scrollLeft;
    y = document.body.scrollTop;

    //获取屏幕宽度
    availWidth = parseInt(window.document.body.offsetWidth);
    availHeight = parseInt(window.document.body.offsetHeight);

    tblWidth = parseInt(objdiv.style.width);
	tblheight = parseInt(objdiv.style.height);
          //alert(objdiv);
//    y = y + tblWidth / 3;
//    x = (availWidth - tblWidth);
    y = y + tblWidth/3;
 //   y = y + tblWidth/4;
    x = (availWidth - tblWidth)/2;

    objdiv.style.top = y;
    objdiv.style.left = x;

}

//
function revertCheck(oCheck){
  if(oCheck.checked==false){
	oCheck.checked=true;
  }else{
	oCheck.checked=false;
  }
}

function hiddenSelect(id){
	   var objDiv;
	   if(id){
		  objDiv = document.getElementById(id);
		  if(!objDiv.arrToggleTags) objDiv.arrToggleTags=new Array();
		  if(!objDiv.exCon) objDiv.exCon = '';

		  if(objDiv.arrToggleTags){
		     objDiv.arrToggleTags = fToggleTags(objDiv,objDiv.exCon,'select');
		     for(var i=0;objDiv.arrToggleTags[i];i++) {
				 objDiv.arrToggleTags[i].style.visibility = "hidden";
			 }
		  }
	   }
}

function showSelect(id){
	   var objDiv;
	   if(id){
		  objDiv = document.getElementById(id);
		  if(objDiv.arrToggleTags){
		     for(var i=0;objDiv.arrToggleTags[i];i++) objDiv.arrToggleTags[i].style.visibility = "visible";
		     objDiv.arrToggleTags.length=0;
		  }
	   }
}

function fToggleTags(objLayer,exConTagInBound,tagN){
    var exConStr = '';
	var arrToggleTags = new Array();
    if(exConTagInBound!='') exConStr=exConTagInBound;
    var arrTags = document.getElementsByTagName(tagN);
    for(var i=0;i<arrTags.length;i++)
 		if((exConStr!=''?eval('arrTags.item(i).'+exConStr):true) && fTagInBound(objLayer,arrTags.item(i))){
			if(document.arrExCon && document.arrExCon.length){
			   for(var j=0;document.arrExCon[j];j++) if(eval('arrTags.item(i).'+document.arrExCon[j])) arrToggleTags[arrToggleTags.length] = arrTags.item(i);}
			else arrToggleTags[arrToggleTags.length] = arrTags.item(i);
		}
	return arrToggleTags;
}
function fTagInBound(objLayer,aTag){
  with (objLayer){
  	var l = parseInt(style.left);
  	var t = parseInt(style.top);
  	var r = l+parseInt(offsetWidth);
  	var b = t+parseInt(offsetHeight);
	var ptLT = fGetXY(aTag);
	return !((ptLT.x>r)||(ptLT.x+aTag.offsetWidth<l)||(ptLT.y>b)||(ptLT.y+aTag.offsetHeight<t));
  }
}
function fGetXY(aTag){
  var oTmp = aTag;
  var pt = new Point(0,0);
  do {
  	pt.x += oTmp.offsetLeft;
  	pt.y += oTmp.offsetTop;
	if(!oTmp.offsetParent) return false; //for NS
  	oTmp = oTmp.offsetParent;
  } while(oTmp.tagName!="BODY");
  return pt;
}
function Point(iX, iY){
	this.x = iX;
	this.y = iY;
}
function searchOnFocus()//文本框获得焦点时
{
	var e = document.getElementById("searchText");
	if(e.defaultValue == e.value)
		e.value ="";
}

function searchOnBlur()//文本框失去焦点时
{
	var e = document.getElementById("searchText");
	if(e.value == "" || e.value.length<1)
		e.value ="输入职位名称或公司名称";
}
function timefuzhi(num,datetime)
{
//2012-5-28 给下拉框的赋值
	var nn = num;
	var dtime = datetime;
	document.getElementById("dtime").value = dtime;
	document.getElementById("datetime").value = nn;
}
            
