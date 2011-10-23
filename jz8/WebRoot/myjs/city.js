


function clear(o){
l=o.length;
for (i = 0; i< l; i++){
	o.options[1]=null;
}
}
function sdistrict(oj,v){
m=-1;
for (i=1;i<=36;i++){
			if (province[i]==v){
			m=i;
			}
}
clear(oj);
if (m!=-1){
for (i=1;i<citys[m].length;i++){
oj.add(new Option(name1[m][i],citys[m][i]));
}
}
}
function CheckAll()
{
  for(var i=0;i<document.formp.check.length;i++){
    var e=document.formp.check[i];
    if (e.name != 'chkAll')
       e.checked = document.formp.chkAll.checked;
  }
}
