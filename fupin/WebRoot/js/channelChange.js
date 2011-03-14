/*图层变幻*/
	function setTab(name,cursel,n,obj){
		obj.t=setTimeout(function(){
			for(i=1;i<=n;i++){
				var menu=document.getElementById(name+i);
				var con=document.getElementById("con_"+name+"_"+i);
				menu.className=i==cursel?"button02 cn":"button01 cn";
				con.style.display=i==cursel?"block":"none";
			}
		},0)
		//当鼠标在规定时间内移开时，停止切换
		obj.onmouseout=function(){clearTimeout(this.t)}
	}
	
/*ͼ����01*/
	function setTab1(name,cursel,n,obj){
		obj.t=setTimeout(function(){
			for(i=12;i<=n;i++){
				var menu=document.getElementById(name+i);
				var con=document.getElementById("con_"+name+"_"+i);
				menu.className=i==cursel?"table1 title02 cn box_width80":"table1 title01 cn8 box_width80";
				con.style.display=i==cursel?"block":"none";
			}
		},0)
		//������ڹ涨ʱ�����ƿ�ʱ��ֹͣ�л�
		obj.onmouseout=function(){clearTimeout(this.t)}
	}

/*ͼ����02*/
	function setTab2(name,cursel,n,obj){
		obj.t=setTimeout(function(){
			for(i=16;i<=n;i++){
				var menu=document.getElementById(name+i);
				var con=document.getElementById("con_"+name+"_"+i);
				menu.className=i==cursel?"table1 title02 cn box_width75":"table1 title01 cn8 box_width75";
				con.style.display=i==cursel?"block":"none";
			}
		},0)
		//������ڹ涨ʱ�����ƿ�ʱ��ֹͣ�л�
		obj.onmouseout=function(){clearTimeout(this.t)}
	}

/*ͼ����03*/
	function setTab3(name,cursel,n,obj){
		obj.t=setTimeout(function(){
			for(i=19;i<=n;i++){
				var menu=document.getElementById(name+i);
				var con=document.getElementById("con_"+name+"_"+i);
				var more=document.getElementById("more_"+name+"_"+i);
				menu.className=i==cursel?"tc_bg01 text_center cn float_left":"tc_bg text_center cn12 float_left";
				con.style.display=i==cursel?"block":"none";
				more.style.display=i==cursel?"block":"none";
			}
		},0)
		//������ڹ涨ʱ�����ƿ�ʱ��ֹͣ�л�
		obj.onmouseout=function(){clearTimeout(this.t)}
	}

/*ͼ����04*/
	function setTab4(name,cursel,n,obj){
		obj.t=setTimeout(function(){
			for(i=21;i<=n;i++){
				var menu=document.getElementById(name+i);
				var con=document.getElementById("con_"+name+"_"+i);
				var more=document.getElementById("more_"+name+"_"+i);
				menu.className=i==cursel?"tc_bg01 text_center cn float_left":"tc_bg text_center cn12 float_left";
				con.style.display=i==cursel?"block":"none";
				more.style.display=i==cursel?"block":"none";
			}
		},0)
		//������ڹ涨ʱ�����ƿ�ʱ��ֹͣ�л�
		obj.onmouseout=function(){clearTimeout(this.t)}
	}

/*ͼ����05*/
	function setTab5(name,cursel,n,obj){
		obj.t=setTimeout(function(){
			for(i=23;i<=n;i++){
				var menu=document.getElementById(name+i);
				var con=document.getElementById("con_"+name+"_"+i);
				var more=document.getElementById("more_"+name+"_"+i);
				menu.className=i==cursel?"tc_bg01 text_center cn float_left":"tc_bg text_center cn12 float_left";
				con.style.display=i==cursel?"block":"none";
				more.style.display=i==cursel?"block":"none";
			}
		},0)
		//������ڹ涨ʱ�����ƿ�ʱ��ֹͣ�л�
		obj.onmouseout=function(){clearTimeout(this.t)}
	}

/*ͼ����06*/
	function setTab6(name,cursel,n,obj){
		obj.t=setTimeout(function(){
			for(i=25;i<=n;i++){
				var menu=document.getElementById(name+i);
				var con=document.getElementById("con_"+name+"_"+i);
				menu.className=i==cursel?"tc_bg02 text_center float_left":"tc_bg03 text_center float_left";
				con.style.display=i==cursel?"block":"none";
			}
		},0)
		//������ڹ涨ʱ�����ƿ�ʱ��ֹͣ�л�
		obj.onmouseout=function(){clearTimeout(this.t)}
	}
	function setTab7(name,cursel,n,obj){
	//alert($("#beginCityId"));
	$(".sug").css("display","none");
		obj.t=setTimeout(function(){
			for(i=1;i<=n;i++){
				var menu=document.getElementById(name+i);
				
				var con=document.getElementById("con_"+name+"_"+i);
				menu.className=i==cursel?"tc_bg02 text_center float_left button02":"tc_bg02 text_center float_left button01";
				con.style.display=i==cursel?"block":"none";
			}
		},0)
		//������ڹ涨ʱ�����ƿ�ʱ��ֹͣ�л�
		obj.onmouseup=function(){clearTimeout(this.t)}
	}	
	function setTab8(name,cursel,n,obj){
		obj.t=setTimeout(function(){
			for(i=1;i<=n;i++){
				var menu=document.getElementById(name+i);
				alert
				var con=document.getElementById("con_"+name+"_"+i);
				menu.className=i==cursel?"tc_bg02 text_center float_left button02":"tc_bg02 text_center float_left button01";
				con.style.display=i==cursel?"block":"none";
			}
		},0)
		//������ڹ涨ʱ�����ƿ�ʱ��ֹͣ�л�
		obj.onmouseout=function(){clearTimeout(this.t)}
	}		
function    winOpen(Url,width,height,id)   
   {   

   ow    =    width;   
   oh    =    height;   
   var    xposition=0;     
   var    yposition=0;   
   if    ((parseInt(navigator.appVersion)    >=    4    ))   
       {   
           xposition    =    (screen.width    -    width)    /    2;   
           yposition    =    (screen.height    -    height-25)    /    2;   
       }   
       window.open(Url,id,"width    ="+ow+",height="+oh+",scrollbars= no,resizable=no,left="+xposition+",top="+yposition    );
   
   }

   function getData(type,code)
   {   
   		if(typeof(code)=='undefined'||code=='') 
   		{
   		  return;
   		}
		$.ajax({
   				type: "POST",
   			dataType:'json',
   			url: "servlet/AjaxData?type="+type+"&code="+code,
   			success: function(msg){
   			  	var json= eval(msg); 
   				GenerationPK(type,json);
			}
 		});
   }	

		  function getData3(type,code)
		   {   
		   		if(typeof(code)=='undefined'||code=='') 
		   		{
		   		  return;
		   		}
				$.ajax({
		   				type: "POST",
		   			dataType:'json',
		   			url: "servlet/AjaxData?type="+type+"&code="+code,
		   			success: function(msg){
		   			  	var json= eval(msg); 
		   				GenerationPK3(type,json);
					}
		 		});
	//var json=[{code:'123',name:'name1'},{code:'345',name:'name2'}];
	//GenerationPK(type,json);
   }
		  
		  function getData4(type,code)
		   {   
		   		if(typeof(code)=='undefined'||code=='') 
		   		{
		   		  return;
		   		}
				$.ajax({
		   				type: "POST",
		   			dataType:'json',
		   			url: "../servlet/AjaxData?type="+type+"&code="+code,
		   			success: function(msg){
		   			  	var json= eval(msg); 
		   				GenerationPK(type,json);
					}
		 		});
		   }	
   function GenerationPK(type,json)
   {
	$("#"+type).children('option').remove();  
	
	switch(type)
	{
		case 'shi':$("#"+type).append("<option value=''>:::::::::请选择地市:::::::::</option>");break;
		case 'xian':$("#"+type).append("<option value=''>:::::::::请选择区县:::::::::</option>");break;
		case 'zhen':$("#"+type).append("<option value=''>:::::::::请选择乡镇:::::::::</option>");break;
		case 'cun':$("#"+type).append("<option value=''>::::::::请选择贫困村::::::::</option>");break;
	}
	
	for(index=0;index<json.length;++index)
	{
		$("#"+type).append("<option value='"+json[index].code+"'>"+json[index].name+"</option>");
	}
  }
   
   function GenerationPK3(type,json)
   {
	$("#"+type).children('option').remove();  
	
	switch(type)
	{
		case 'shi':$("#"+type).append("<option value=''>:::请选择地市:::</option>");break;
		case 'xian':$("#"+type).append("<option value=''>:::请选择区县:::</option>");break;
		case 'zhen':$("#"+type).append("<option value=''>:::请选择乡镇:::</option>");break;
		case 'cun':$("#"+type).append("<option value=''>:::请选择贫困村:::</option>");break;
	}
	
	for(index=0;index<json.length;++index)
	{
		$("#"+type).append("<option value='"+json[index].code+"'>"+json[index].name+"</option>");
	}
  }
   
  function changeBegin(type,value)
  {
  	var option="<option value=''>--------</option>";
  	switch(type){
  	//case 'xian':option="<option value=''>::::::::请选择乡镇::::::::</option>";break;
  //	case 'zhen':option="<option value=''>::::::::请选择贫困村::::::::</option>";break;
  	
  	}
  	switch(type)
  	{
  	  case 'xian':
  	     $("#xian").children('option').remove();
  	     option="<option value=''>:::::::::请选择区县:::::::::</option>";
  	     $("#xian").append(option);
  	     $("#zhen").children('option').remove();
  	     option="<option value=''>:::::::::请选择乡镇:::::::::</option>";
  	     $("#zhen").append(option);
  	     $("#cun").children('option').remove();
  	     option="<option value=''>::::::::请选择贫困村::::::::</option>";
  	     $("#cun").append(option);
  	     getData(type,value);
  	    break;
  	 case 'zhen':

  	     $("#zhen").children('option').remove();
  	     option="<option value=''>:::::::::请选择乡镇:::::::::</option>";
  	     $("#zhen").append(option);
  	     $("#cun").children('option').remove();
  	     option="<option value=''>::::::::请选择贫困村::::::::</option>";
  	     $("#cun").append(option);
  	     getData(type,value);
  	    break;
  	 case 'cun':
  	     $("#cun").children('option').remove();
  	     option="<option value=''>::::::::请选择贫困村::::::::</option>";
  	     $("#cun").append(option);
  	     getData(type,value);
  	    break;  	    
  	}
  }
  
  function changeBegin4(type,value)
  {
  	var option="<option value=''>--------</option>";
  	switch(type){
  	//case 'xian':option="<option value=''>::::::::请选择乡镇::::::::</option>";break;
  //	case 'zhen':option="<option value=''>::::::::请选择贫困村::::::::</option>";break;
  	
  	}
  	switch(type)
  	{
  	  case 'xian':
  	     $("#xian").children('option').remove();
  	     option="<option value=''>:::::::::请选择区县:::::::::</option>";
  	     $("#xian").append(option);
  	     $("#zhen").children('option').remove();
  	     option="<option value=''>:::::::::请选择乡镇:::::::::</option>";
  	     $("#zhen").append(option);
  	     $("#cun").children('option').remove();
  	     option="<option value=''>::::::::请选择贫困村::::::::</option>";
  	     $("#cun").append(option);
  	     getData4(type,value);
  	    break;
  	 case 'zhen':

  	     $("#zhen").children('option').remove();
  	     option="<option value=''>:::::::::请选择乡镇:::::::::</option>";
  	     $("#zhen").append(option);
  	     $("#cun").children('option').remove();
  	     option="<option value=''>::::::::请选择贫困村::::::::</option>";
  	     $("#cun").append(option);
  	     getData4(type,value);
  	    break;
  	 case 'cun':
  	     $("#cun").children('option').remove();
  	     option="<option value=''>::::::::请选择贫困村::::::::</option>";
  	     $("#cun").append(option);
  	     getData4(type,value);
  	    break;  	    
  	}
  }
  
  function changeBegin3(type,value)
  {
  	var option="<option value=''>--------</option>";

  	switch(type)
  	{
  	  case 'xian':
  	     $("#xian").children('option').remove();
  	     option="<option value=''>:::请选择区县:::</option>";
  	     $("#xian").append(option);
  	     $("#zhen").children('option').remove();
  	     option="<option value=''>:::请选择乡镇:::</option>";
  	     $("#zhen").append(option);
  	     $("#cun").children('option').remove();
  	     option="<option value=''>:::请选择贫困村:::</option>";
  	     $("#cun").append(option);
  	     getData3(type,value);
  	    break;
  	 case 'zhen':

  	     $("#zhen").children('option').remove();
  	     option="<option value=''>:::请选择乡镇:::</option>";
  	     $("#zhen").append(option);
  	     $("#cun").children('option').remove();
  	     option="<option value=''>:::请选择贫困村:::</option>";
  	     $("#cun").append(option);
  	     getData3(type,value);
  	    break;
  	 case 'cun':
  	     $("#cun").children('option').remove();
  	     option="<option value=''>:::请选择贫困村:::</option>";
  	     $("#cun").append(option);
  	     getData3(type,value);
  	    break;  	    
  	}
  }
  
  function changeBegin2(type,value)
  {
  	var option="<option value=''>---------</option>";
  	switch(type)
  	{
  	  case 'xian2':
  	     $("#xian2").children('option').remove();
  	     $("#xian2").append(option);
  	     $("#zhen2").children('option').remove();
  	     $("#zhen2").append(option);
  	     $("#cun2").children('option').remove();
  	     $("#cun2").append(option);
  	     getData(type,value);
  	    break;
  	 case 'zhen2':

  	     $("#zhen2").children('option').remove();
  	     $("#zhen2").append(option);
  	     $("#cun2").children('option').remove();
  	     $("#cun2").append(option);
  	     getData(type,value);
  	    break;
  	 case 'cun2':
  	     $("#cun2").children('option').remove();
  	     $("#cun2").append(option);
  	     getData(type,value);
  	    break;  	    
  	}
  }  