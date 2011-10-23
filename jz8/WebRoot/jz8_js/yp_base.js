// JavaScript Document
function $(objname){return document.getElementById(objname);}

function setfocus()
{
	var a = $('sj_ul').getElementsByTagName('li');
	for(i=0;i<a.length;i++)
	{
		a[i].onmouseover = function() 
		{
			switch(this.className)
			{
				case '':this.className = 'focus';break;
				case 'z': this.className = 'z focus';break;
				
				case 'selected' : this.className = 'selected focus';break;
				case 'selected z' : this.className = 'selected focus z';break;
				
				case 'img' : this.className = 'img focus'; break;
				case 'img z' : this.className = 'img focus z'; break;
				
				case 'hq' :this.className = 'hqfocus' ;break;
				case 'hq z' :this.className = 'hqfocus z' ;break;
				
				case 'hq' :this.className = 'hqfocus' ;break;
				case 'hq z' :this.className = 'hqfocus z' ;break;
				
				case 'hqnone' :this.className = 'hqnone_focus' ;break;
				case 'hqnone z' :this.className = 'hqnone_focus z' ;break;
				
				case 'none' :this.className = 'none_focus' ;break;
				case 'none z' :this.className = 'none_focus z' ;break;
				
			}
		}	
		a[i].onmouseout = function()
		{
			switch(this.className)
			{
				case 'focus' : this.className ='';break;
				case 'z focus': this.className = 'z';break;
				
				case 'selected focus' : this.className ='selected';break;
				case 'selected focus z' : this.className ='selected z';break;
				
				case 'img focus' :this.className ='img'; break;
				case 'img focus z' :this.className ='img z'; break;
				
				case 'hqfocus' :this.className = 'hq' ;break;
				case 'hqfocus z' :this.className = 'hq z' ;break;
				
				case 'none_focus' :this.className ='none';break;
				case 'none_focus z' :this.className ='none z';break;
				
				case 'hqnone_focus' :this.className = 'hqnone' ;break;
				case 'hqnone_focus z' :this.className = 'hqnone z' ;break;
			}
		}	
	}	
	
	
		var a = $('sj_ul2').getElementsByTagName('li');
	for(i=0;i<a.length;i++)
	{
		a[i].onmouseover = function() 
		{
			switch(this.className)
			{
				case '':this.className = 'focus';break;
				case 'z': this.className = 'z focus';break;
				
				case 'selected' : this.className = 'selected focus';break;
				case 'selected z' : this.className = 'selected focus z';break;
				
				case 'img' : this.className = 'img focus'; break;
				case 'img z' : this.className = 'img focus z'; break;
				
				case 'hq' :this.className = 'hqfocus' ;break;
				case 'hq z' :this.className = 'hqfocus z' ;break;
				
				case 'hq' :this.className = 'hqfocus' ;break;
				case 'hq z' :this.className = 'hqfocus z' ;break;
				
				case 'hqnone' :this.className = 'hqnone_focus' ;break;
				case 'hqnone z' :this.className = 'hqnone_focus z' ;break;
				
				case 'none' :this.className = 'none_focus' ;break;
				case 'none z' :this.className = 'none_focus z' ;break;
				
			}
		}	
		a[i].onmouseout = function()
		{
			switch(this.className)
			{
				case 'focus' : this.className ='';break;
				case 'z focus': this.className = 'z';break;
				
				case 'selected focus' : this.className ='selected';break;
				case 'selected focus z' : this.className ='selected z';break;
				
				case 'img focus' :this.className ='img'; break;
				case 'img focus z' :this.className ='img z'; break;
				
				case 'hqfocus' :this.className = 'hq' ;break;
				case 'hqfocus z' :this.className = 'hq z' ;break;
				
				case 'none_focus' :this.className ='none';break;
				case 'none_focus z' :this.className ='none z';break;
				
				case 'hqnone_focus' :this.className = 'hqnone' ;break;
				case 'hqnone_focus z' :this.className = 'hqnone z' ;break;
			}
		}	
	}	
	
	setimgwidth();
	
}
function setimgwidth()
{
	var objul = document.getElementById("imglistul");
	if(objul !=null)
	{
		var img = objul.getElementsByTagName("img");
		for(i=0;i<img.length;i++)
		{
			if(img[i].width>160) img[i].width = 160;	
			if(img[i].height>100) img[i].height = 100;	
		}
	}
	
	
}
function killErrors() {return true;}
//window.onerror = killErrors;
window.onload = setfocus();