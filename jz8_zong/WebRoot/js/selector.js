//InstanceName:�������ƣ�maxNum��������ѡ��������sType��0����ѡ��1��λѡ��
function Selector(InstanceName,maxNum,sType,coun){
//��������
  this.instanceName=InstanceName;
//�������ı���
  this.oResultField=null;
//���ѡ��ĸ���
  this.maxNum=maxNum;

//ѡ�����ı���
  this.selectorName="����";
  if(sType==1) this.selectorName="��ҵ";
  if(sType==2) this.selectorName="רҵ";
  if(sType==3) this.selectorName="��˾����";
  if(sType==4) this.selectorName="��������";
  if(sType==5) this.selectorName="��λ";
  if(sType==6) this.selectorName="��������";

  this.rowHeight=25;//ѡ�������и�
  this.divWidth=500;//ѡ�����Ŀ��

  this.typeAry=new Array();//�������
  this.title1="";//��һ�����ݵı���
  this.typeAryLength=0;//������鳤��
	
  if(sType==0) {
  	this.typeAry=catelogsCity;
  	this.typeAryLength=catelogCountCity;
  	this.title1="����ʡ��ֱϽ��";
  }else if(sType==1){
  	this.divWidth=600;
  	this.typeAry=catelogs;
  	this.typeAryLength=catelogCount;
  	this.title1="������ҵ����";
  }else if(sType==2){
  	this.divWidth=600;
  	this.typeAry=majors;
  	this.typeAryLength=majorCount;
  	this.title1="����רҵ����";
  }else if(sType==3){
  	this.divWidth=600;
  	this.typeAry=attrs;
  	this.typeAryLength=attrCount;
  	this.title1="";
  }else if(sType==4){
  	this.divWidth=600;
  	this.typeAry=postdates;
  	this.typeAryLength=postdateCount;
  	this.title1="";
  }else if(sType==5){
  	this.divWidth=600;
  	this.typeAry=jobs;
  	this.typeAryLength=jobsCount;
  	this.title1="���ظ�λ����";
    }else if(sType==6){

	//���ļ�ְ��ȫְ�����¸�ֵ
	if(coun == 1)
	{	
		this.divWidth=600;
  		this.typeAry=biaoqians1;
  		this.typeAryLength=biaoqianCount1;
  		this.title1="������ҵ����";
	}else{
		
		this.divWidth=600;
  		this.typeAry=biaoqians;
  		this.typeAryLength=biaoqianCount;
  		this.title1="������ҵ����";
	}
  }
	
//����ѡ������div��id
  this.divId=InstanceName+"Div";
  this.frmId=InstanceName+"blockSelect";

	this.title2="";//�ڶ������ݵı���html
	this.title3="";//���������ݵı���html

	this.content1="";//��һ�����ݵ�html
	this.content2="";//�ڶ������ݵ�html
	this.content3="";//���������ݵ�html

	this.title2Id=InstanceName+"Title2";//���õڶ����ı���
	this.title3Id=InstanceName+"Title3";//���õ������ı���

//���ó���span��־��id
	this.span1Id=InstanceName+"Span1";//���õ�һ��������
	this.span2Id=InstanceName+"Span2";//���õڶ���������
	this.span3Id=InstanceName+"Span3";//���õ�����������
//����ÿһ��ʵ�����ݵ�table��id
	this.table1Id=InstanceName+"Table1";
	this.table2Id=InstanceName+"Table2";
	this.table3Id=InstanceName+"Table3";
//������ʾѡ������span��id
	this.spanResultId=InstanceName+"Result";
	this.resultTblId=InstanceName+"TblResult";
	this.outDivResultId=InstanceName+"Show";

//����İ�ť
    this.but=null;

//����
  this.returnFormatResult=returnFormatResult;//���ظ�ʽ�����Ľ��
  this.returnCheckStatus=returnCheckStatus;//���ݸ�ʽ�����Ľ�����ص�i�����͵�ѡ��״̬
  this.setContent=setContent;//���õ�ǰҪ��ʾ������
  this.setContent1=setContent1;//���õ�һ�����͵�����
  this.setContent2=setContent2;//���õڶ������͵�����
  this.setContent3=setContent3;//���õ��������͵�����
  this.setTitleHtml=setTitleHtml;//���õ�ǰ���ı���
  this.isFather=isFather;//�Ƿ����¼�
  this.filterSon=filterSon;//ѡ��ĳһ��ʱ���ӽ����ȥ���������������
  this.updateSonCheck=updateSonCheck;//��ѡ�и�����������ĸ�ѡ��
  this.addChoosed=addChoosed;//��ѡ������ͷ�������,�Ѿ��еĲ��ٷ��룬�����������ѡ�������
  this.updateResult=updateResult;//���½��
  this.showResult=showResult;//��ʾ�Ѿ�ѡ��Ľ��
  this.removeResult=removeResult;//�ӽ����ȡ��ĳһ����

  this.clickTitleName=clickTitleName;//����������������
  this.clickContentName=clickContentName;//����������������
  this.clickTitleBox=clickTitleBox;//������ݵı���ĸ�ѡ��
  this.clickContentBox=clickContentBox;//������ݵĸ�ѡ���ֲ���ֱ�ӵ��ã������ѡ��Ҳ����clickContentName��
  this.clickResult=clickResult;//�������е����

  this.getFirstResult=getFirstResult;//���ؽ���ĵ�һ��ֵ
  this.clearTitle2=clearTitle2;//����ڶ����ı���
  this.clearTitle3=clearTitle3;//����������ı���
  this.clearContent1=clearContent1;//�����һ��������
  this.clearContent2=clearContent2;//����ڶ���������
  this.clearContent3=clearContent3;	//���������������
  this.assembleAll=assembleAll;//��������ε�������װ����
  this.getSpace=getSpace;//���ñ��������ǰ�Ŀո�
  this.getPos=getPos;//�õ���Ӧ����id�������±�
  this.getFatherPos=getFatherPos;//�õ���ǰ������һ���������±꣬����0��ʾ��ǰΪ��һ��
  this.removeAllResult=removeAllResult;//������н��
  this.checkAllResult = checkAllResult;
  this.btnisShow = btnisShow;

  this.Init=selectorInit;//��ʼ���������͵�����
  this.initResult=initResult;//��ʼ�����
  this.showSelector=showSelector;//��ʾѡ����
  this.setFrmHeight=setFrmHeight;//���ÿ�ܸ߶�
	
}

//�������е����
function clickResult(pos){
	var objBox=document.getElementById(this.instanceName+pos);
	if(objBox!=null) objBox.checked=false;
	this.updateSonCheck(pos);
  this.removeResult(pos);
	this.showResult();
}

//������ݵı������ĸ�ѡ��
function clickTitleBox(pos,curBox){
	if(curBox.checked==true){
	  if(this.addChoosed(pos)){
		  this.updateSonCheck(pos,true);
	    this.showResult();
	  }
  }else{
  	  this.removeResult(pos);
		  this.updateSonCheck(pos,false);
	    this.showResult();
  }
}

//����������������
function clickTitleName(pos){
	var objBox=document.getElementById(this.instanceName+pos);
	if(objBox!=null&&objBox.disabled==true) {
		alert("���Ѿ�ѡ�����ϼ�"+this.selectorName+",����ȥ����ѡ��");
		return;
	}
	
	var curLevel=this.typeAry[pos][4];
  if(curLevel==1){//�������Ϊ��һ����
  	 if(this.title3!="")//������������ݵı��ⲻΪ�գ��������ʾ�����࣬��㶫
  	   this.clickContentName(pos);
  	 else{//������������ݵı���Ϊ�գ�����͵��ڵ����ѡ��
  	    if(objBox != null){
            objBox.checked=!objBox.checked;
            this.clickTitleBox(pos,objBox);
        }
  	 }
  }else{//������Ϊ�ڶ���������͵��ڵ����ѡ��
    objBox.checked=!objBox.checked;
    this.clickTitleBox(pos,objBox);
  }
}

//������ݵĸ�ѡ��(�ֲ���ֱ�ӵ��ã������ѡ��Ҳ����clickContentName)
function clickContentBox(pos,curBox){
    if(curBox.checked==true){
        if(this.addChoosed(pos)){
            this.showResult();
        }
    }else{
        this.removeResult(pos);
        this.showResult();
    }
}


function btnisShow(){

}

//��������������
//pos:���͵������±�
//clickType:0�����ѡ��1�������
function clickContentName(pos,clickType){
	
	var objBox=document.getElementById(this.instanceName+pos);
	if(objBox!=null&&objBox.disabled==true){
		alert("���Ѿ�ѡ�����ϼ�"+this.selectorName+",����ȥ����ѡ��");
		return;
	}
	if(clickType==0) objBox.checked=!objBox.checked;
  //eagle1 �޸� �����ֱϽ�в��������
  if(this.isFather(pos)){
  
	//if(this.isFather(pos)&&this.typeAry[pos][3]!="0100"&&this.typeAry[pos][3]!="003"&&this.typeAry[pos][3]!="005"){//���¼���չ���¼�,����������Ϊ����
  	var level=this.typeAry[pos][4];//Ҫ��ʾ�����ݵĸ����ļ��𣬼���ǰ����������ļ���
  	var isChecked=objBox.checked;
    this.setTitleHtml(pos,isChecked);

    if(level==1) {
   // alert(this.typeAry[pos][0]); eagle1
        this.setContent2(pos,isChecked);
    }
    else{
    	this.setContent3(pos,isChecked);
    }

    this.assembleAll();

	}else{//û���¼�������ڵ����ѡ��
	
		objBox.checked=!objBox.checked;
		this.clickContentBox(pos,objBox);
	}

    var tb2 = document.getElementById(this.table2Id);
    if(tb2 != null){
        document.getElementById('btnno').style.display = "";
    }else{
        document.getElementById('btnno').style.display = "none";
    }
}
/*
ȫѡ���е����� hidchk
*/
function checkAllResult(){
    var tb2 = document.getElementById(this.table2Id);
    if(tb2 != null){
        var resuleval = "";
        var inputs = tb2.getElementsByTagName('input');
        var inputsLen = inputs.length;

        for (var i = 0; i < inputsLen ; i++ )
        {
            if (inputs[i].type.toLowerCase() == 'checkbox')
            {
                if(document.getElementById('hidchk').value == "true"){
                    inputs[i].checked = false;
                }else{
                    inputs[i].checked = true;
                }
                //inputs[i].checked == true ? inputs[i].checked = false : inputs[i].checked = true;
                if(inputs[i].checked){
                    if(resuleval == ""){
                        resuleval = inputs[i].value;
                    }else{
                        resuleval=resuleval + "," + inputs[i].value;
                    }
                }
            }
        }
        this.updateResult(resuleval);
        this.showResult();
        if(document.getElementById('hidchk').value == "true"){
            document.getElementById('hidchk').value = "false";
        }else{
            document.getElementById('hidchk').value = "true";
        }
        if(this.oResultField.value != ""){
            document.getElementById('btnclose').disabled = false;
        }else{
            document.getElementById('btnclose').disabled = true;
        }
    }else{
        //alert("һ����û�С����ޡ����ܣ�");
    }
}
/** �ӽ����ȡ��ĳһ����
@param pos ȡ�������͵������±�
*/
function removeResult(pos){

	  var cityId=this.typeAry[pos][3];
         var chooseResult=this.oResultField.value;//�Ѿ�ѡ��Ľ��
	  var aryChooseResult=chooseResult.split(",");
        //  alert(aryChooseResult+" fd "+cityId);
	  chooseResult=ridFromAry(cityId,aryChooseResult);//ȥ��ȡ�������ͺ�Ľ��
	  this.updateResult(chooseResult);
}

function removeAllResult(){
    var chooseResult=this.oResultField.value;//�Ѿ�ѡ��Ľ��
   // alert(chooseResult);
    var aryChooseResult=chooseResult.split(",");
      if(objBox!=null) objBox.checked=false;
    for(var i = 0;i<aryChooseResult.length ; i++){
        var nid=aryChooseResult[i]-1;
        var objBox=document.getElementById(this.instanceName+i);
        if(objBox!=null) objBox.checked=false;
        else{
            var objBox=document.getElementById(this.instanceName+aryChooseResult[i]);  //ȡ����ѡ�����
            if(objBox!=null) objBox.checked=false;
        }
    }
    //alert(aryChooseResult);
         for(var i = 0;i<373 ; i++){  //��� ����ľ�ѡ��
        var objBox=document.getElementById(this.instanceName+i);
        if(objBox!=null) objBox.checked=false;
    }


    this.updateResult('');
    this.showResult();
}

//��ʾ�Ѿ�ѡ��Ľ��
function showResult(){

    var tb2 = document.getElementById(this.table2Id);
    if(tb2 != null){
        document.getElementById('btnno').style.display = "";
    }else{
        document.getElementById('btnno').style.display = "none";
    }
    if(this.oResultField.value != ""){
        document.getElementById('btnclose').disabled = false;
    }else{
        document.getElementById('btnclose').disabled = true;
    }
  var chooseResult=this.oResultField.value;
  var filterResult="";//ȥ�������ڵ�id��Ľ��
  var i=0;
  var itemHtml="";
  var itemHtmlBut="";//�ڰ�ť����ʾ�Ľ��
  if(chooseResult!=""){
    var aryChooseResult=chooseResult.split(",");
	  itemHtml="<table id=\""+this.resultTblId+"\" width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">";
	  var sitem="";
	  for(i=0;i<aryChooseResult.length; i++){
	       var isAdd=0;//�Ƿ��������뵽�����,1��
	       for (j=0;j<3;j++){
    			  h=inAry2(aryChooseResult[i],this.typeAry);
	          if(h!=-1){
				       if(filterResult==""){
 					        filterResult=aryChooseResult[i];
				       }else{
					        filterResult+=","+aryChooseResult[i];
				       }
	             sitem="<td height=\""+this.rowHeight+"\">&nbsp;&nbsp;<input type=\"checkbox\" name=\""+this.instanceName+this.typeAry[h][3]+"result\" id=\""+this.instanceName+this.typeAry[h][3]+"result\" checked onclick=\""+this.instanceName+".clickResult("+h+")\" value=\""+this.typeAry[h][3]+"\">&nbsp;<a style=\"cursor:hand\" onclick=\""+this.instanceName+".clickResult("+h+")\">"+this.typeAry[h][0]+"</a></td>";
		           itemHtml+=sitem;
		           isAdd=1;

				       if(itemHtmlBut==""){
					        itemHtmlBut=this.typeAry[h][0];
				       }else{
					        itemHtmlBut+=","+this.typeAry[h][0]
				       }
	          }else{
		           j--;
		        }
		        if(i==aryChooseResult.length-1) {
		           break;
		        }
		        if(j<2) i++;
	      }
	      if(isAdd==1) itemHtml="<tr>"+itemHtml+"</tr>";
	  }
	  itemHtml+="</table>";
  }

  this.oResultField.value=filterResult;

  if(filterResult=="") itemHtml="";
//if(itemHtmlBut!=""){
//�ڲ�����ʾѡ����
  objdiv=document.getElementById(this.spanResultId);
  objdiv.innerHTML=itemHtml;

  this.setFrmHeight();

//�ڲ�����ʾѡ����
	objdiv=document.getElementById(this.outDivResultId);
	if(objdiv!=null){
	  objdiv.innerHTML=itemHtml;
	}else if(this.but!=null){
	  if(itemHtmlBut==""){
	    if(this.but.type == "button")
	        itemHtmlBut="��ѡ��";
	   else
		  itemHtmlBut="";
	  }
	  this.but.value=itemHtmlBut;
	}
//}

}
/**���½��
@param strResult ���
@param curRecordFieldId ������������ı���id
*/
function updateResult(strResult){
  this.oResultField.value=strResult;
}

/**ѡ��ĳһ��ʱ���ӽ����ȥ���������������
@param pos ѡ������͵������±�
@ param aryChooseResult �������
@ return ���˺�Ľ������
*/
function filterSon(pos,aryChooseResult){
	   if(this.isFather(pos)==false) return aryChooseResult;
	   var i=0;
	   var sonPos=pos+1;//���࿪ʼ������λ��
	   var curLevel=this.typeAry[pos][4];//��ǰ�����Ĳ��
	   var parentId=this.typeAry[pos][2];

  	for(i=sonPos;i<this.typeAryLength;i++){
	     if((this.typeAry[i][2]!=parentId||this.typeAry[i][4]==curLevel)){//�����ǵ�ǰ���������ʱ����ѭ��
	        break;
	     }else{

		      if(curLevel==2){//�����ǰ�����ǵڶ�����������һ���ڶ�����������ѭ��
		         if(this.typeAry[i][4]==2) break;
		      }

		      aryIndex=inAryIndex(this.typeAry[i][3],aryChooseResult);
		      if(aryIndex!=-1){//������ڽ�������У�Ҫ����������еĸ�����Ϊ��
			       aryChooseResult[aryIndex]="";
		      }
	     }
	  }

	  return aryChooseResult;
}

/**��ѡ������ͷ�������,�Ѿ��еĲ��ٷ��룬�����������ѡ�������
@param pos ѡ������͵������±�
@param curBox ��ǰѡ��ĸ�ѡ��
*/
function addChoosed(pos){
	var booleanResult=false;//�Ƿ��гɹ��������ӵ������
  var chooseResult=this.oResultField.value;
  var cityId=this.typeAry[pos][3]
  if(chooseResult==""||chooseResult=="0"){
     chooseResult=cityId;
     booleanResult=true;
	   if(this.maxNum==1) {
	   	 divClose(this.divId);
	   }
  }else{
     var aryChooseResult=chooseResult.split(",");
     if(!inAry(cityId,aryChooseResult)) {//û���ظ�ѡ��
		    if(aryChooseResult.length<this.maxNum){
		       aryChooseResult=this.filterSon(pos,aryChooseResult);//�ӽ����ȥ���������������
		       chooseResult="";
		       for(i=0;i<aryChooseResult.length;i++){
			        if(aryChooseResult[i]!=""){
				         if(chooseResult==""){
				            chooseResult=aryChooseResult[i];
				         }else{
					          chooseResult+=","+aryChooseResult[i];
				         }
			        }
		       }

		       if(chooseResult==""){
				      chooseResult=cityId;
				      booleanResult=true;
		       }else{
				      chooseResult+=","+cityId;
				      booleanResult=true;
		       }

		    }else{
		    	 var objBox=document.getElementById(this.instanceName+pos);
		       alert("���ֻ��ѡ"+this.maxNum+"��");
		       objBox.checked=false;
		       booleanResult=false;
		       return booleanResult;
		    }
	   }else{//�Ѿ�ѡ�����
	      return true;
	   }
  }
  this.updateResult(chooseResult);//���½��
  return booleanResult;
}

//�Ƿ����¼�
//pos����ǰ���͵������±ꣻ
//return: true ���¼���false û���¼�
function isFather(pos){
	
	if(this.typeAry[pos][4]==3) return false;
	
	
	var nextPos=pos+1;
	
	     
	if(nextPos>=this.typeAryLength) return false; 
	 

	if(this.typeAry[pos][4]==(this.typeAry[nextPos][4]-1)) return true;
	return false;
}

//���ñ��������ǰ�Ŀո�
//level:���ݻ�������ļ���
function getSpace(level){
	var spaceStr="";
	for (i=1;i<level;i++){
	  spaceStr+="&nbsp";
	}
	return spaceStr;
}

//�������ิѡ���״̬
//isForbid:true���� false������
function updateSonCheck(pos,isForbid){
	if(!this.isFather(pos)) return;
	var level=this.typeAry[pos][4];
	var sonLevel=level+1;
	var parentId=this.typeAry[pos][2];
  for(i=pos+1;i<this.typeAryLength;i++){

  	if(level==2){//���������ǵڶ�������ѭ�������ǵ�����ʱ����ѭ��
  	  if(this.typeAry[i][4]!=3){
  	     break;
  	  }
  	}

  	if(this.typeAry[i][2]==parentId){
  		 if(this.typeAry[i][4]==sonLevel||this.typeAry[i][4]==sonLevel+1){
  	      var objBox=document.getElementById(this.instanceName+i);
  	      if(objBox!=null){
  	        objBox.disabled=isForbid;
  	        if(isForbid) objBox.checked=false;
  	      }
  	   }
    }
  }
}

//����������ݵı��⣬����Ϊ������ݵĸ����
//pos���������͵������±ꣻ
//isChecked:�Ƿ�ѡ��
function setTitleHtml(pos,isChecked){
	var strChecked="";
	if(isChecked){
	   	strChecked=" checked";
	}

	var level=this.typeAry[pos][4];
	var spaceStr=this.getSpace(level);
	var itemHtml="<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">";
	itemHtml+="<tr><td height=\""+this.rowHeight+"\">&nbsp;&nbsp;&nbsp;&nbsp;"+spaceStr+"<!--<input"+strChecked+" type=\"checkbox\" name=\""+this.instanceName+pos+"\" id=\""+this.instanceName+pos+"\" onclick=\""+this.instanceName+".clickTitleBox("+pos+",this);\" value=\""+this.typeAry[pos][3]+"\">--><b><a style=\"cursor:hand\" onclick=\"javascript:"+this.instanceName+".clickTitleName("+pos+");\">"+this.typeAry[pos][0]+"</b></a><!--<span class=\"hong\">(ѡ��˴��࣬��������������С��)</span>--></td></tr></table>";

  if(level==1){//����ǰ�Ƚ���Ӧ�ı������
    var objTitle2=document.getElementById(this.title2Id);
    objTitle2.innerHTML="";
  }
  else if(level==2){
    var objTitle3=document.getElementById(this.title3Id);
    objTitle3.innerHTML="";
  }

  if(level==1){
    this.title2=itemHtml;
    this.clearTitle3();
  }
  else
  	this.title3=itemHtml;
}

//�õ���Ӧ����id�������±�
function getPos(id){
  var curPos=0;
	for(i=0;i<this.typeAryLength; i++){
	   if(this.typeAry[i][3]==id){
		    curPos=i;
		    break;
	   }
	}
	return i;
}

//�õ���ǰ������һ���������±꣬����-1��ʾ��ǰΪ��һ��
//sonPos��ǰ���������±꣬
//level��ǰ���ļ���1��һ����2�ڶ�����3������
function getFatherPos(sonPos,level){
	   if(level==1) return -1;
	   var fatherLevel=level-1;
	   var fatherPos=0;
	   for(i=sonPos;i>0; i--){
	      if(this.typeAry[i][4]==fatherLevel){
		       fatherPos=i;
		       break;
	      }
	   }
	   return fatherPos;
}

  function clearTitle2(){
   this.title2="";
}

function clearTitle3(){
   this.title3="";
}
function clearContent1(){
   this.content1="";
}
function clearContent2(){
   this.content2="";
}
function clearContent3(){
   this.content3="";
}

//���ؽ���ĵ�һ��ֵ
function getFirstResult(){
  var result=this.oResultField.value;//��ѡ���
  if(result==null||result==""){
    return "";
  }else{
    var aryResult=result.split(",");
    return aryResult[0];
  }
}

//��������ε�������װ����,��������ʾ����Ĳ�
function assembleAll(){
    var objSpan1=document.getElementById(this.span1Id);
    objSpan1.innerHTML=this.content1;

    var objTitle2=document.getElementById(this.title2Id);
    if(objTitle2.innerHTML==""||this.title2=="") objTitle2.innerHTML=this.title2;

    var objSpan2=document.getElementById(this.span2Id);
    if(objSpan2.innerHTML==""||this.content2=="") objSpan2.innerHTML=this.content2;

    var objTitle3=document.getElementById(this.title3Id);
    if(objTitle3.innerHTML==""||this.title3=="") objTitle3.innerHTML=this.title3;

    var objSpan3=document.getElementById(this.span3Id);
    if(objSpan3.innerHTML==""||this.content3=="") objSpan3.innerHTML=this.content3;

    this.setFrmHeight();
    var objDiv=document.getElementById(this.divId);
    objDiv.style.display="";
    //document.getElementById("bbb").value=objDiv.innerHTML;
}

/**��ʾѡ����
@param oInstance ѡ��������
*/

function showSelector(objBut,resultField,obj){
	var coun;
	if(obj!=-1)
	{
		//���
		for(iIndex=0;iIndex <Object.length;iIndex++) 
		{ 
			if(Object[iIndex].checked==true) 
			{ 	
				coun = Object[iIndex].value;
			} 
		}
		//�ж�ѡ����Ǽ�ְ����ȫְ
		if(coun == 1)
		{	
			this.divWidth=600;
  			this.typeAry=biaoqians1;
  			this.typeAryLength=biaoqianCount1;
  			this.title1="���ع�������";
		}else{
			
			this.divWidth=600;
  			this.typeAry=biaoqians;
  			this.typeAryLength=biaoqianCount;
  			this.title1="���ع�������";
		}

	}
	

   this.but=objBut;
   this.oResultField=resultField;
   var firstResult=this.getFirstResult();
   if(firstResult==""||firstResult=="0"){
     this.setContent1();
     this.clearTitle2();
     this.clearTitle3();
     this.clearContent2();
     this.clearContent3();
     this.assembleAll();
   }else{
  
     var curPos=this.getPos(firstResult);
     var curLevel=this.typeAry[curPos][4];
     if(curLevel==1){//ѡ�е��ǵ�һ�����,��㶫
    	
       this.setContent1();
       this.clearTitle2();
       this.clearTitle3();
       this.clearContent2();
       this.clearContent3();
       this.assembleAll();
     }else if(curLevel==2){//ѡ�е��ǵڶ����������ɽ
     
       var fatherPos=this.getFatherPos(curPos,curLevel);
       this.setTitleHtml(fatherPos,false);
     	 this.setContent2(fatherPos,false);
       this.assembleAll();
     }else if(curLevel==3){//ѡ�е��ǵ����������С�
     
       var fatherPos=this.getFatherPos(curPos,curLevel);
       var fatherLevel=this.typeAry[fatherPos][4];
       var grandfatherPos=this.getFatherPos(fatherPos,fatherLevel);
       this.setTitleHtml(grandfatherPos,false);
       this.setTitleHtml(fatherPos,false);
     	 this.setContent3(fatherPos,false);
       this.assembleAll();
     }
     this.showResult();
   }

   setDivInCenter(this.divId);

   hiddenSelect(this.divId);
}

/*��ʾĬ�Ͻ��
oResultField:�����������������
objBut����ѡ�����İ�ť����
*/
function initResult(oResultField,objBut){
   this.oResultField=oResultField;
   this.but=objBut;
   this.showResult();
}

//���ظ�ʽ�����Ľ��
 function returnFormatResult(){
    var chooseResult=this.oResultField.value;//��ѡ���
    if(chooseResult!="") {
    	chooseResult=","+chooseResult+",";
    }
    return chooseResult;
 }

//���ݸ�ʽ�����Ľ�����ص�i�����͵�ѡ��״̬
 function returnCheckStatus(chooseResult,i){
 	  var isChecked="";
	  if(chooseResult=="") {
		   isChecked="";
	  }else{
			 if(chooseResult.indexOf(","+this.typeAry[i][3]+",")!=-1) {
			    isChecked="checked";
			 }else{
        	isChecked="";
			 }
	  }
	  return isChecked;
 	}

//���õ�һ�����͵�����
 function setContent1(){
    this.content1=this.setContent(-1,false);
 }

//���õڶ������͵�����,���������⣬���г��㶫�µ�������
//pos��ǰ�ڶ����ĸ����������±�
//isChecked:�����Ƿ�ѡ�У������ѡ������ȫ������
 function setContent2(pos,isChecked){
 	 var objSpan2=document.getElementById(this.span2Id);//��������ǰ�����֮ǰ������
 	 objSpan2.innerHTML="";
   this.content2=this.setContent(pos,isChecked);
   this.clearContent1();
   this.clearContent3();
 }
//���õ��������͵�����,���������⣬���г���ɽ�µ�������
//pos��ǰ�������ĸ����������±�
//isChecked:�����Ƿ�ѡ�У������ѡ������ȫ������
 function setContent3(pos,isChecked){
 	 var objSpan3=document.getElementById(this.span3Id); //��������ǰ�����֮ǰ������
 	 objSpan3.innerHTML="";
   this.content3=this.setContent(pos,isChecked);
   this.clearContent1();
   this.clearContent2();
 }

//���õ�ǰҪ��ʾ������,����������
//pos��ǰҪ��ʾ���ݵĸ����������±�,-1��ʾ�е�һ��
//isChecked:�����Ƿ�ѡ�У������ѡ������ȫ������
function setContent(pos,isChecked){
	  var strDisabled="";
	  if(isChecked) strDisabled=" disabled";
 	  var chooseResult=this.returnFormatResult();
 	  var level=1;
	  if(pos!=-1) level=this.typeAry[pos][4]+1;
    var spaceStr=this.getSpace(level);
	  var itemHtml="<table id=\""+this.instanceName+"table"+level+"\" width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">";
	  var sitem="";//ÿ�����͵�html
	  for(i=pos+1;i<this.typeAryLength;i++){
	     var isAdd=0;//�������ѭ���Ƿ������������ݣ�1��
	     for (j=0;j<3;j++){
	        if(pos==-1||this.typeAry[i][2]==this.typeAry[pos][2]){//�ж��Ƿ��е�һ��������Ԫ�غͱ������Ԫ���Ƿ���ͬһ����
		         if(this.typeAry[i][4]==level){//�Ƿ��ǵ�ǰҪ�еļ�

			          //���ѡ���ֵ������ѡ��������ѡ���Ϊѡ��
				        isChecked=this.returnCheckStatus(chooseResult,i);

	              sitem="<td height=\""+this.rowHeight+"\">"+spaceStr+"&nbsp;&nbsp;<input"+strDisabled+" type=\"checkbox\" id=\""+this.instanceName+i+"\" name=\""+this.instanceName+i+"\"  value=\""+this.typeAry[i][3]+"\" "+isChecked+" onclick=\""+this.instanceName+".clickContentName("+i+",0);\">&nbsp;<a style=\"cursor:hand\" onclick=\"javascript:"+this.instanceName+".clickContentName("+i+",1);\">"+this.typeAry[i][0]+"</a></td>";
		            itemHtml+=sitem;
				        isAdd=1;
			        }else{
                if(level==3){//����ǵ�����������ǰ����Ԫ�ز��ǵ�����ʱֱ������
		               i=this.typeAryLength;
		               break;
                }else{
                   j--;
                }
			        }
	       }else{//����Ԫ�غͱ������Ԫ�ز���ͬһ������ֱ������ѭ���������������ѭ������������������ѭ��
		        i=this.typeAryLength;
		        break;
		      }
		      if(i==this.typeAryLength-1) {//������������Ԫ�غ������ڲ�ѭ��
		         break;
		      }
		      if(j<2) i++;
	    }
	    if(isAdd==1)itemHtml="<tr>"+itemHtml+"</tr>";
	 }
	 itemHtml+="</table>";
	 return itemHtml;
}

//����selector�ĸ�����ε�������div��span�ȣ�
function selectorInit(){

  var objJobType=document.getElementById(this.divId);
  if(objJobType!=null){
    return;
  }
var divHtml="<DIV class=\"selector\" id=\""+this.divId+"\" style='width:"+this.divWidth+"px\;BACKGROUND-COLOR: #0071E1;DISPLAY:none; Z-INDEX:999;border:1px #40537D solid; POSITION:absolute; '>";
 divHtml+="<div class=\"windhd\">";
 divHtml+="<div class=\"wdkz\">";
 divHtml+="<table width=\"98%\"  border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">";
 divHtml+="<tr>";
 divHtml+="<td>&nbsp; <font color=\"#ffffff\">"+this.selectorName+"ѡ����(����ѡ<font color=red> "+this.maxNum+" </font>��)</font></td>";
 divHtml+="<td align=\"right\"><img onclick=\"divClose('"+this.divId+"');\" alt='�ر�'  src=\"/myimages/close01.jpg\" width=\"15\" height=\"15\" /> </td>";
 divHtml+="</tr>";
 divHtml+="</table>";
 divHtml+="</div>";
 divHtml+="</div>";
 divHtml+="<div class=\"window01\"><div class=\"bk01\">";
 divHtml+="<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"tbg\">";
 divHtml+="<tr>";
//�����кϲ�Ϊ����һ�� divHtml+="<td class=\"btbder\">&nbsp;&nbsp;&nbsp;<span class=\"fhgw\"><a href=\"javascript:"+this.instanceName+".setContent1();"+this.instanceName+".clearContent2();"+this.instanceName+".clearContent3();"+this.instanceName+".clearTitle2();"+this.instanceName+".clearTitle3();"+this.instanceName+".assembleAll();\"><b>"+this.title1+"</b></a></span>";
divHtml+="<td class=\"btbder\"><input type=\"hidden\" id=\"hidchk\" value=\"false\" />&nbsp;&nbsp;<input id=\"btnno\" class=\"btngrey4f\" type=\"button\" value=\""+this.title1+"\" / onclick=\"javascript:"+this.instanceName+".setContent1();"+this.instanceName+".clearContent2();"+this.instanceName+".clearContent3();"+this.instanceName+".clearTitle2();"+this.instanceName+".clearTitle3();"+this.instanceName+".assembleAll();\" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id=\"btnok\" onclick=\"divClose('"+this.divId+"');\" class=\"btngrey4f\" type=\"button\" value=\" ȷ  �� \" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id=\"btnclose\" class=\"btngrey4f\" onclick=\""+this.instanceName+".removeAllResult();\"  type=\"button\" value=\" �塡�� \" /></td>";



  divHtml+=" </tr>";
  divHtml+=" </table>";
  divHtml+="<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">";
  divHtml+="<tr>";
  divHtml+="<td>";
  divHtml+="<span id=\""+this.span1Id+"\"></span>";//��һ��������
  divHtml+="</td>";
  divHtml+="</tr>";
  divHtml+="</table>";
  divHtml+="<span id=\""+this.title2Id+"\"></span>";//�ڶ����ı���
  divHtml+="<span id=\""+this.span2Id+"\"></span>";//�ڶ���������
  divHtml+="<span id=\""+this.title3Id+"\"></span>";//�������ı���
  divHtml+="<span id=\""+this.span3Id+"\"></span>";//������������
  divHtml+="<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">";
  divHtml+="<tr><td class=\"dl\">&nbsp;&nbsp;&nbsp;���Ѿ�ѡ���"+this.selectorName+"��:<span style=\"color:red\">(�������ȡ��ѡ��)</span></td></tr>";
  divHtml+="<tr><td>";
  divHtml+="<span id=\""+this.spanResultId+"\"></span>";
  divHtml+="</td></tr></table>";
  //document.getElementById("showhtml").value=divHtml;
  document.write(divHtml);

}

//���ÿ�ܸ߶�
function setFrmHeight(){
	/*
	var totalRow=0;
	var totalheight=93;
	var objTable1=document.getElementById(this.table1Id);
	if(objTable1!=null){
		totalRow+=objTable1.rows.length;
	}
	var objTable2=document.getElementById(this.table2Id);
	if(objTable2!=null){
		totalRow+=objTable2.rows.length;
	}
	var objTable3=document.getElementById(this.table3Id);
	if(objTable3!=null){
		totalRow+=objTable3.rows.length;
	}
	oo=document.getElementById(this.resultTblId);
	if(oo!=null){
		totalRow+=oo.rows.length;
	}
  if(this.title2!="") totalRow++;
  if(this.title3!="") totalRow++;

	var ofrm=document.getElementById(this.frmId);
	totalheight+=totalRow*this.rowHeight;
	ofrm.style.height=totalheight+"px";
	*/
}
