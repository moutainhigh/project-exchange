var curVer = 22;
var curMemJsVer = 3;
var curOrg1JsVer = 3;
var curOrg2JsVer = 3;
// ��ȡ����ķ��������Ը��ݴ��뵥��ID�����ض���
// Ҳ���Դ�����ID������һ����������
// ���磺var obj = $("id1");
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


//ȥ���ո�
function Trim(str) {
  return str.replace(/(\s*$)|(^\s*)/g,"");
}
//ȥ���ַ���ĩβ�����пո�
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
//ȥ�ַ���ǰ������пո�
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


// �л�Tab
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


//ȡ��ַ������
var request = {
    QueryString : function(val) { 
        var uri = window.location.search; 
        var re = new RegExp("" +val+ "=([^&?]*)", "ig"); 
        return ((uri.match(re))?(uri.match(re)[0].substr(val.length+1)):""); 
    }
} 


//������ȫ��ǵ�SubString
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
