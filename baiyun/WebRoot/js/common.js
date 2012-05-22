function reload(){
	window.location.reload();
}
function help(msg){
	alert('欢迎使用'+msg);
}

function to(url){
	self.location.href=url;
}
function back(){
	history.go(-1);
}
function save(url){
	
}
function add(url){
	alert('新建成功！');
	to(url);
}
function del(msg){
	if (window.confirm("确认删除"+msg+"？")){
		reload();
	}
}
function setCurTime(oid){
	var now=new Date();
	var year=now.getYear();
	var month=now.getMonth();
	var day=now.getDate();
	var hours=now.getHours();
	var minutes=now.getMinutes();
	var seconds=now.getSeconds();
	var timeString = year+"-"+month+"-"+day+" "+hours+":"+minutes+":"+seconds;
	var oCtl = document.getElementById(oid);
	oCtl.value = timeString;
}


function gotoPage(pageIndex,url){
	if(!pageIndex || pageIndex==''){
		alert('Please enter page index!');
		return false;
	}
	if(!url){
		url = self.location.href;
	}
	if(url.indexOf("?") > 0){
		if(url.indexOf("pageIndex=") > 0){
			url = url.replace(/pageIndex=\d*/g,'');
			//alert(url);
			url = url.replace(/&{2,}/g,'&');
		}
		url += '&';
	}else{
		url += '?';
	}
	url += "pageIndex=" + pageIndex;
	url = url.replace("#","");
	//alert(url);
	self.location.href = url;
}

function help(key){
	//alert('key=[' + key + ']');
	if(key.indexOf('：') > 0){
		var key = key.split('：')[1];
		key = key.replace(/\s/ig,'');
		if(key == null || key == '')
			return false;
		//alert('key=[' + key + ']');
		key = key.replace(/\s/ig,'').replace(/>/ig,'');
		//alert('key=' + key);
		$.ajax({
		   type: "GET",
		   url: "help/" + encodeURI(key) + ".txt",
		   data: "",
		   success: function(msg){
		     alert( "===帮助信息===\n" + msg );
		   }
		}); 
	}
}

//让消息框慢慢消退
$(function(){
	$('#reqMsg').fadeOut(5000); 
	//添加导出Excel功能
	//alert(checkAll);
	try{
		if($("td:contains('您当前所处页面')").length > 0){
			var btn = $("input[type='button']:last").not("#lightBox input[type='button']");
			if(btn == null || btn.length == 0)
				btn = $("input[type='submit']:last");
			var str = '<input type="button" class="button" value="帮助" onclick="help(\'' + $("td:contains('您当前所处页面')").text().replace(/\"/ig,'').replace(/\s/ig,'').replace(/”/ig,'').replace(/“/ig,'') + '\')">';
			//alert(str);
			//alert(btn.length);
			btn.after(str);
		}
		if(checkAll){
			$("input[type='button']:last").after('<input type="button" class="button" value="Excel" onclick="exportExcel()">');
		}
	}catch(e){}
});

function exportExcel(tableid){
	//alert('herer');
	if(tableid){
		myMethod(tableid);
	} else{
		$('table:last').attr('id','excel_table');
		myMethod('excel_table');
	}
}

function myMethod(tableid){
	var curTbl = document.getElementById(tableid);
	try{ 
     var oXL = new ActiveXObject("Excel.Application");
    }catch(e){
    	alert('你本机的安全设置不允许使用Excel导出\n请设置安全策略\n修改"本地Intranet"内"对没有标记为安全的ActiveX控件进行初始化和脚本运行"这一项');
    	return false;
    } 
     //创建AX对象excel 
     var oWB = oXL.Workbooks.Add(); 
     //获取workbook对象 
     var oSheet = oWB.ActiveSheet; 
     //激活当前sheet 
     var Lenr = curTbl.rows.length; 
     //取得表格行数 
     for (i = 0; i < Lenr-1; i++) 
     { 
         var Lenc = curTbl.rows(i).cells.length; 
         Lenc--;
         //取得每行的列数 
         for (j = 0; j < Lenc; j++) 
         { 
         	var lie = j+1;
         	if(lie == Lenc)
         		break;
            oSheet.Cells(i + 1, j + 1).value = curTbl.rows(i).cells(j+1).innerText; 
            //赋值 
         } 
     } 
     oXL.Visible = true; 
     //设置excel可见属性 
}

//Excel文件导出功能函数
function method1(tableid) {//整个表格拷贝到EXCEL中 
     var curTbl = document.getElementById(tableid); 
     var oXL = new ActiveXObject("Excel.Application"); 
     //创建AX对象excel 
     var oWB = oXL.Workbooks.Add(); 
     //获取workbook对象 
         var oSheet = oWB.ActiveSheet; 
     //激活当前sheet 
     var sel = document.body.createTextRange(); 
     sel.moveToElementText(curTbl); 
     //把表格中的内容移到TextRange中 
     sel.select(); 
     //全选TextRange中内容 
     sel.execCommand("Copy"); 
     //复制TextRange中内容  
     oSheet.Paste(); 
     //粘贴到活动的EXCEL中       
     oXL.Visible = true; 
     //设置excel可见属性 
 } 
 function method2(tableid) //读取表格中每个单元到EXCEL中 
 { 
     var curTbl = document.getElementById(tableid); 
     var oXL = new ActiveXObject("Excel.Application"); 
     //创建AX对象excel 
     var oWB = oXL.Workbooks.Add(); 
     //获取workbook对象 
     var oSheet = oWB.ActiveSheet; 
     //激活当前sheet 
     var Lenr = curTbl.rows.length; 
     //取得表格行数 
     for (i = 0; i < Lenr; i++) 
     { 
         var Lenc = curTbl.rows(i).cells.length; 
         //取得每行的列数 
         for (j = 0; j < Lenc; j++) 
         { 
             oSheet.Cells(i + 1, j + 1).value = curTbl.rows(i).cells(j).innerText; 
             //赋值 
         } 
     } 
     oXL.Visible = true; 
     //设置excel可见属性 
 } 
 function getXlsFromTbl(inTblId, inWindow) { 
     try { 
         var allStr = ""; 
         var curStr = ""; 
         //alert("getXlsFromTbl"); 
         if (inTblId != null && inTblId != "" && inTblId != "null") { 
             curStr = getTblData(inTblId, inWindow); 
         } 
         if (curStr != null) { 
             allStr += curStr; 
        } 
        else { 
            alert("你要导出的表不存在！"); 
            return; 
        } 
        var fileName = getExcelFileName(); 
        doFileExport(fileName, allStr); 
    } 
    catch(e) { 
        alert("导出发生异常:" + e.name + "->" + e.description + "!"); 
    } 
} 
function getTblData(inTbl, inWindow) { 
    var rows = 0; 
    //alert("getTblData is " + inWindow); 
    var tblDocument = document; 
    if (!!inWindow && inWindow != "") { 
        if (!document.all(inWindow)) { 
            return null; 
        } 
        else { 
            tblDocument = eval(inWindow).document; 
        } 
    } 
    var curTbl = tblDocument.getElementById(inTbl); 
    var outStr = ""; 
    if (curTbl != null) { 
       for (var j = 0; j < curTbl.rows.length; j++) { 
            //alert("j is " + j); 
            for (var i = 0; i < curTbl.rows[j].cells.length; i++) { 
                //alert("i is " + i); 
                if (i == 0 && rows > 0) { 
                    outStr += " \t"; 
                    rows -= 1; 
                } 
                outStr += curTbl.rows[j].cells[i].innerText + "\t"; 
                if (curTbl.rows[j].cells[i].colSpan > 1) { 
                    for (var k = 0; k < curTbl.rows[j].cells[i].colSpan - 1; k++) { 
                        outStr += " \t"; 
                    } 
                } 
                if (i == 0) { 
                    if (rows == 0 && curTbl.rows[j].cells[i].rowSpan > 1) { 
                        rows = curTbl.rows[j].cells[i].rowSpan - 1; 
                    } 
                } 
            } 
            outStr += "\r\n"; 
        } 
    } 
    else { 
        outStr = null; 
        alert(inTbl + "不存在!"); 
    } 
    return outStr; 
} 
function getExcelFileName() { 
    var d = new Date(); 
    var curYear = d.getYear(); 
    var curMonth = "" + (d.getMonth() + 1); 
    var curDate = "" + d.getDate(); 
    var curHour = "" + d.getHours(); 
    var curMinute = "" + d.getMinutes(); 
    var curSecond = "" + d.getSeconds(); 
    if (curMonth.length == 1) { 
        curMonth = "0" + curMonth; 
    } 
    if (curDate.length == 1) { 
        curDate = "0" + curDate; 
    } 
    if (curHour.length == 1) { 
        curHour = "0" + curHour; 
    } 
    if (curMinute.length == 1) { 
        curMinute = "0" + curMinute; 
    } 
    if (curSecond.length == 1) { 
        curSecond = "0" + curSecond; 
    } 
    var fileName = "leo_zhang" + "_" + curYear + curMonth + curDate + "_" 
            + curHour + curMinute + curSecond + ".csv"; 
    //alert(fileName); 
    return fileName; 
} 
function doFileExport(inName, inStr) { 
    var xlsWin = null; 
    if (!!document.all("glbHideFrm")) { 
        xlsWin = glbHideFrm; 
    } 
    else { 
        var width = 6; 
        var height = 4; 
        var openPara = "left=" + (window.screen.width / 2 - width / 2) 
                + ",top=" + (window.screen.height / 2 - height / 2) 
                + ",scrollbars=no,width=" + width + ",height=" + height; 
        xlsWin = window.open("", "_blank", openPara); 
    } 
    xlsWin.document.write(inStr); 
    xlsWin.document.close(); 
    xlsWin.document.execCommand('Saveas', true, inName); 
    xlsWin.close(); 
} 


//cover
function cover(id)
{
     //$("select").each(function(){this.style.visibility="hidden";})
     //选择所有的select并设置为隐藏
      $("#coverLayer").fadeTo("fast",0.5,function(){$("#coverLayer").css("display","block");})
                     .width(Math.max(document.documentElement.scrollWidth, document.documentElement.clientWidth))
                     .height(Math.max(document.documentElement.scrollHeight, document.documentElement.clientHeight));
     //显示覆盖层 并设置其高和宽
    $("#"+id).show();
    //显示LightBox层
    $('select').hide();
}
function discover(id)
{
     //$("select").each(function(){this.style.visibility="visible";})
     $("#coverLayer").fadeOut("normal",function(){$("#coverLayer").css("display","none");})
     $("#"+id).fadeOut("normal",function(){$("#lightBox").css("display","none");})
     $('select').show();
}
function showInstr(id){
	$('#currId').val(id);
	cover('lightBox');
}
function updateReason(){
	var r = $('#updateReason').val();
	if(r==null || r==''){
		alert('修改申请原因不能为空');
	}else{
		$('#update_form').submit();
	}
}