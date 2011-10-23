var curVer = 22;
var curMemJsVer = 3;
var curOrg1JsVer = 3;
var curOrg2JsVer = 3;
// 获取对象的方法，可以根据传入单个ID来返回对象，
// 也可以传入多个ID来返回一个对象数组
// 例如：var obj = $("id1");
// var arrObj = $("id1", "id2", "id3");
// arrObj[0] = Obj1;
function $() {
    var elements = new Array();

    for (var i = 0; i < arguments.length; i++) {
        var element = arguments[i];
        if (typeof element == 'string')
            element = document.getElementById(element);

        if (arguments.length == 1)
            return element;

        elements.push(element);
    }

    return elements;
}


//去除空格
function Trim(str) {
  return str.replace(/(\s*$)|(^\s*)/g,"");
}
//去除字符串末尾的所有空格
function TrimEnd(str) {
	if( str != null && str.length > 0 ) {
		var strChar = "";
		while( str.length > 0 ) {
			strChar = str.substr( str.length-1,1 );
			if( strChar == " " && str.length > 0 ) {
				str = str.substr( 0,str.length-1 );
			}
			else
				break;	
		}
	}

  return str;
}
//去字符串前面的所有空格
function TrimStart(str) {
	if( str != null && str.length > 0 ) {
		var strChar = "";
		while( str.length > 0 ) {
			strChar = str.substr( 0,1 );
			if( strChar == " " && str.length > 0 ) {
				str = str.substr( 1,str.length-1 );
			}
			else
				break;	
		}
	}

  return str;
}


// 切换Tab
function switchTabForJobInfo(showTab,showDiv,hidTab, hidDiv) {
    var tab1 = $(showTab);
    var tab2 = $(hidTab);
    var div1 = $(showDiv);
    var div2 = $(hidDiv);
    
    tab1.className = "tab_on";
    tab2.className = "tab_off";
    div1.className = "info";
    div2.className = "info none";
    
}

function switchTabForOverdue(showTab,showDiv,hidTab, hidDiv) {
    var tab1 = $(showTab);
    var tab2 = $(hidTab);
    var div1 = $(showDiv);
    var div2 = $(hidDiv);
    
    tab1.className = "tab_on";
    tab2.className = "tab_off";
    if (showDiv == "noContent")
        div1.className = "infoblk2  norst";
    else
        div1.className = "info";

    div2.className = "info none";
    
}


//取地址栏参数
var request = {
    QueryString : function(val) { 
        var uri = window.location.search; 
        var re = new RegExp("" +val+ "=([^&?]*)", "ig"); 
        return ((uri.match(re))?(uri.match(re)[0].substr(val.length+1)):""); 
    }
} 


//考虑了全半角的SubString
function GetSubString(str,len)
{
    if(len == "undefined") return str;

    var newStr = new Array();
    var index =0;
    for(var i=0;i<=str.length-1;i++)
    {
        var _str = str.substring(i,i+1);
        var code = escape(str.charAt(i));
        if ((code.length >= 4) && (code < '%uFF60' || code > '%uFF9F'))
        {
            index = index + 2;
        }
        else
        {
            index = index + 1;
        }
        if(index <= len)
        {
            newStr.push(_str);
        }
        else
        {
            newStr.push("...");
            break;
        }
    }
    return newStr.join("");
}
