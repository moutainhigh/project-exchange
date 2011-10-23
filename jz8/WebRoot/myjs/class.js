function UpdateCheckCode(Img)
{
	var timenow = new Date().getTime();
	url="/code/yz_image.jsp";
	url = url + "?time=" + timenow;
	Img.src=url;
}
//验证特殊字符
function strangecode(code)
{   var strangCode = "<>";
    var temp;
    for (var i = 0; i<code.length; i++ )
    {
        temp = code.substring(i,i+1);
        if (strangCode.indexOf(temp) !=-1)
        {
            return (false);
        }
    }
}

function replaceInput(obj,event){
     	//alert(event.keyCode);
	if(event.keyCode!=37 && event.keyCode!=39&&event.keyCode!=8 && event.keyCode!=46)
        {
	obj.value=obj.value.replace(/[^\u4E00-\u9FA50-9a-zA-Z\_]/g,'');
        obj.value=obj.value.toLowerCase();}
}


//字符长度
function  getLength(stringIn)
{
        var   strLength=0;
        strLength=stringIn.length;
//        for(var   i=0;i<stringIn.length;i++)
//        {
//                if(stringIn.charCodeAt(i)>255)
//                {
//                        strLength+=2;
//                }
//                else
//                {
//                        strLength+=1;
//                }
//
//        }
        return   strLength;
}


// JavaScript Document//去掉字串左边的空格
function lTrim(str)
{
	if (str.charAt(0) == " ")
	{
	//如果字串左边第一个字符为空格

	str = str.slice(1);//将空格从字串中去掉
	//这一句也可改成 str = str.substring(1, str.length);
	str = lTrim(str); //递归调用
	}
	return str;
}

//去掉字串右边的空格
function rTrim(str)
{
	var iLength;

	iLength = str.length;
	if (str.charAt(iLength - 1) == " ")
	{
		//如果字串右边第一个字符为空格
		str = str.slice(0, iLength - 1);//将空格从字串中去掉
		//这一句也可改成 str = str.substring(0, iLength - 1);
		str = rTrim(str); //递归调用
	}
	return str;
}

//去掉字串两边的空格
function trim(str)
{
	return lTrim(rTrim(str));
}

function Trim_char(obj)
{
  var str=trim(obj.value)
  obj.value=str;
  }
  
  




function clear(o){
l=o.length;
for (i = 0; i< l; i++){
	o.options[1]=null;
}
}


function sdistrict(oj,v){
     // alert(v);
	var m=-1;
	for (i=1;i<=34;i++){
		if (fclass[i]==v){
			m=i;
			}
	}

	clear(oj);
	if (m!=-1){
                  for (i=1;i<sclass[m].length;i++){
		 	oj.add(new Option(sclass[m][i],(v+tclass[m][i])));
                        // oj.add(new Option(sclass[m][i],sclass[m][i]));
		}
	}
}


//地区数组
var citys;
var province;
var name1;
province=new Array(36);
citys=new Array(36);
name1=new Array(36);


citys[1]=new Array(1);
citys[2]=new Array(1);
citys[3]=new Array(1);
citys[4]=new Array(1);
citys[5]=new Array(21);
citys[6]=new Array(9);
citys[7]=new Array(11);
citys[8]=new Array(13);
citys[9]=new Array(17);
citys[10]=new Array(14);
citys[11]=new Array(11);
citys[12]=new Array(21);
citys[13]=new Array(10);
citys[14]=new Array(17);
citys[15]=new Array(18);
citys[16]=new Array(11);
citys[17]=new Array(11);
citys[18]=new Array(12);
citys[19]=new Array(9);
citys[20]=new Array(13);
citys[21]=new Array(17);
citys[22]=new Array(14);
citys[23]=new Array(14);
citys[24]=new Array(19);
citys[25]=new Array(16);
citys[26]=new Array(9);
citys[27]=new Array(7);
citys[28]=new Array(14);
citys[29]=new Array(4);
citys[30]=new Array(8);
citys[31]=new Array(13);
citys[32]=new Array(1);
citys[33]=new Array(1);
citys[34]=new Array(1);
citys[35]=new Array(1);

name1[1]=new Array(1);
name1[2]=new Array(1);
name1[3]=new Array(1);
name1[4]=new Array(1);
name1[5]=new Array(21);
name1[6]=new Array(9);
name1[7]=new Array(11);
name1[8]=new Array(13);
name1[9]=new Array(17);
name1[10]=new Array(14);
name1[11]=new Array(11);
name1[12]=new Array(21);
name1[13]=new Array(10);
name1[14]=new Array(17);
name1[15]=new Array(18);
name1[16]=new Array(11);
name1[17]=new Array(11);
name1[18]=new Array(12);
name1[19]=new Array(9);
name1[20]=new Array(13);
name1[21]=new Array(17);
name1[22]=new Array(14);
name1[23]=new Array(14);
name1[24]=new Array(19);
name1[25]=new Array(16);
name1[26]=new Array(9);
name1[27]=new Array(7);
name1[28]=new Array(14);
name1[29]=new Array(4);
name1[30]=new Array(8);
name1[31]=new Array(13);
name1[32]=new Array(1);
name1[33]=new Array(1);
name1[34]=new Array(1);
name1[35]=new Array(1);

province[1]="01";
province[2]="02";
province[3]="03";
province[4]="04";
province[5]="05";
province[6]="06";
province[7]="07";
province[8]="08";
province[9]="09";
province[10]="10";
province[11]="11";
province[12]="12";
province[13]="13";
province[14]="14";
province[15]="15";
province[16]="16";
province[17]="17";
province[18]="18";
province[19]="19";
province[20]="20";
province[21]="21";
province[22]="22";
province[23]="23";
province[24]="24";
province[25]="25";
province[26]="26";
province[27]="27";
province[28]="28";
province[29]="29";
province[30]="30";
province[31]="31";
province[32]="32";
province[33]="33";
province[34]="34";
province[35]="35";


citys[1][1]="0100";
citys[2][1]="0200";
citys[3][1]="0300";
citys[4][1]="0400";
citys[5][1]="0501";
citys[5][2]="0502";
citys[5][3]="0503";
citys[5][4]="0504";
citys[5][5]="0505";
citys[5][6]="0506";
citys[5][7]="0507";
citys[5][8]="0508";
citys[5][9]="0509";
citys[5][10]="0510";
citys[5][11]="0511";
citys[5][12]="0512";
citys[5][13]="0513";
citys[5][14]="0514";
citys[5][15]="0515";
citys[5][16]="0516";
citys[5][17]="0517";
citys[5][18]="0518";
citys[5][19]="0519";
citys[5][20]="0520";
citys[5][21]="0521";
citys[6][1]="0601";
citys[6][2]="0602";
citys[6][3]="0603";
citys[6][4]="0604";
citys[6][5]="0605";
citys[6][6]="0606";
citys[6][7]="0607";
citys[6][8]="0608";
citys[6][9]="0609";
citys[7][1]="0701";
citys[7][2]="0702";
citys[7][3]="0703";
citys[7][4]="0704";
citys[7][5]="0705";
citys[7][6]="0706";
citys[7][7]="0707";
citys[7][8]="0708";
citys[7][9]="0709";
citys[7][10]="0710";
citys[7][11]="0711";
citys[8][1]="0801";
citys[8][2]="0802";
citys[8][3]="0803";
citys[8][4]="0804";
citys[8][5]="0805";
citys[8][6]="0806";
citys[8][7]="0807";
citys[8][8]="0808";
citys[8][9]="0809";
citys[8][10]="0810";
citys[8][11]="0811";
citys[8][12]="0812";
citys[8][13]="0813";
citys[9][1]="0901";
citys[9][2]="0902";
citys[9][3]="0903";
citys[9][4]="0904";
citys[9][5]="0905";
citys[9][6]="0906";
citys[9][7]="0907";
citys[9][8]="0908";
citys[9][9]="0909";
citys[9][10]="0910";
citys[9][11]="0911";
citys[9][12]="0912";
citys[9][13]="0913";
citys[9][14]="0914";
citys[9][15]="0915";
citys[9][16]="0916";
citys[9][17]="0917";
citys[10][1]="1001";
citys[10][2]="1002";
citys[10][3]="1003";
citys[10][4]="1004";
citys[10][5]="1005";
citys[10][6]="1006";
citys[10][7]="1007";
citys[10][8]="1008";
citys[10][9]="1009";
citys[10][10]="1010";
citys[10][11]="1011";
citys[10][12]="1012";
citys[10][13]="1013";
citys[10][14]="1014";
citys[11][1]="1101";
citys[11][2]="1102";
citys[11][3]="1103";
citys[11][4]="1104";
citys[11][5]="1105";
citys[11][6]="1106";
citys[11][7]="1107";
citys[11][8]="1108";
citys[11][9]="1109";
citys[11][10]="1110";
citys[11][11]="1111";
citys[12][1]="1201";
citys[12][2]="1202";
citys[12][3]="1203";
citys[12][4]="1204";
citys[12][5]="1205";
citys[12][6]="1206";
citys[12][7]="1207";
citys[12][8]="1208";
citys[12][9]="1209";
citys[12][10]="1210";
citys[12][11]="1211";
citys[12][12]="1212";
citys[12][13]="1213";
citys[12][14]="1214";
citys[12][15]="1215";
citys[12][16]="1216";
citys[12][17]="1217";
citys[12][18]="1218";
citys[12][19]="1219";
citys[12][20]="1220";
citys[12][21]="1221";
citys[13][1]="1301";
citys[13][2]="1302";
citys[13][3]="1303";
citys[13][4]="1304";
citys[13][5]="1305";
citys[13][6]="1306";
citys[13][7]="1307";
citys[13][8]="1308";
citys[13][9]="1309";
citys[13][10]="1310";
citys[14][1]="1401";
citys[14][2]="1402";
citys[14][3]="1403";
citys[14][4]="1404";
citys[14][5]="1405";
citys[14][6]="1406";
citys[14][7]="1407";
citys[14][8]="1408";
citys[14][9]="1409";
citys[14][10]="1410";
citys[14][11]="1411";
citys[14][12]="1412";
citys[14][13]="1413";
citys[14][14]="1414";
citys[14][15]="1415";
citys[14][16]="1416";
citys[14][17]="1417";
citys[15][1]="1501";
citys[15][2]="1502";
citys[15][3]="1503";
citys[15][4]="1504";
citys[15][5]="1505";
citys[15][6]="1506";
citys[15][7]="1507";
citys[15][8]="1508";
citys[15][9]="1509";
citys[15][10]="1510";
citys[15][11]="1511";
citys[15][12]="1512";
citys[15][13]="1513";
citys[15][14]="1514";
citys[15][15]="1515";
citys[15][16]="1516";
citys[15][17]="1517";
citys[15][18]="1518";
citys[16][1]="1601";
citys[16][2]="1602";
citys[16][3]="1603";
citys[16][4]="1604";
citys[16][5]="1605";
citys[16][6]="1606";
citys[16][7]="1607";
citys[16][8]="1608";
citys[16][9]="1609";
citys[16][10]="1610";
citys[16][11]="1611";
citys[17][1]="1701";
citys[17][2]="1702";
citys[17][3]="1703";
citys[17][4]="1704";
citys[17][5]="1705";
citys[17][6]="1706";
citys[17][7]="1707";
citys[17][8]="1708";
citys[17][9]="1709";
citys[17][10]="1710";
citys[17][11]="1711";
citys[18][1]="1801";
citys[18][2]="1802";
citys[18][3]="1803";
citys[18][4]="1804";
citys[18][5]="1805";
citys[18][6]="1806";
citys[18][7]="1807";
citys[18][8]="1808";
citys[18][9]="1809";
citys[18][10]="1810";
citys[18][11]="1811";
citys[18][12]="1812";
citys[19][1]="1901";
citys[19][2]="1902";
citys[19][3]="1903";
citys[19][4]="1904";
citys[19][5]="1905";
citys[19][6]="1906";
citys[19][7]="1907";
citys[19][8]="1908";
citys[19][9]="1909";
citys[20][1]="2001";
citys[20][2]="2002";
citys[20][3]="2003";
citys[20][4]="2004";
citys[20][5]="2005";
citys[20][6]="2006";
citys[20][7]="2007";
citys[20][8]="2008";
citys[20][9]="2009";
citys[20][10]="2010";
citys[20][11]="2011";
citys[20][12]="2012";
citys[20][13]="2013";
citys[21][1]="2101";
citys[21][2]="2102";
citys[21][3]="2103";
citys[21][4]="2104";
citys[21][5]="2105";
citys[21][6]="2106";
citys[21][7]="2107";
citys[21][8]="2108";
citys[21][9]="2109";
citys[21][10]="2110";
citys[21][11]="2111";
citys[21][12]="2112";
citys[21][13]="2113";
citys[21][14]="2114";
citys[21][15]="2115";
citys[21][16]="2116";
citys[21][17]="2117";
citys[22][1]="2201";
citys[22][2]="2202";
citys[22][3]="2203";
citys[22][4]="2204";
citys[22][5]="2205";
citys[22][6]="2206";
citys[22][7]="2207";
citys[22][8]="2208";
citys[22][9]="2209";
citys[22][10]="2210";
citys[22][11]="2211";
citys[22][12]="2212";
citys[22][13]="2213";
citys[22][14]="2214";
citys[23][1]="2301";
citys[23][2]="2302";
citys[23][3]="2303";
citys[23][4]="2304";
citys[23][5]="2305";
citys[23][6]="2306";
citys[23][7]="2307";
citys[23][8]="2308";
citys[23][9]="2309";
citys[23][10]="2310";
citys[23][11]="2311";
citys[23][12]="2312";
citys[23][13]="2313";
citys[23][14]="2314";
citys[24][1]="2401";
citys[24][2]="2402";
citys[24][3]="2403";
citys[24][4]="2404";
citys[24][5]="2405";
citys[24][6]="2406";
citys[24][7]="2407";
citys[24][8]="2408";
citys[24][9]="2409";
citys[24][10]="2410";
citys[24][11]="2411";
citys[24][12]="2412";
citys[24][13]="2413";
citys[24][14]="2414";
citys[24][15]="2415";
citys[24][16]="2416";
citys[24][17]="2417";
citys[24][18]="2418";
citys[24][19]="2419";
citys[25][1]="2501";
citys[25][2]="2502";
citys[25][3]="2503";
citys[25][4]="2504";
citys[25][5]="2505";
citys[25][6]="2506";
citys[25][7]="2507";
citys[25][8]="2508";
citys[25][9]="2509";
citys[25][10]="2510";
citys[25][11]="2511";
citys[25][12]="2512";
citys[25][13]="2513";
citys[25][14]="2514";
citys[25][15]="2515";
citys[25][16]="2516";
citys[26][1]="2601";
citys[26][2]="2602";
citys[26][3]="2603";
citys[26][4]="2604";
citys[26][5]="2605";
citys[26][6]="2606";
citys[26][7]="2607";
citys[26][8]="2608";
citys[26][9]="2609";
citys[27][1]="2701";
citys[27][2]="2702";
citys[27][3]="2703";
citys[27][4]="2704";
citys[27][5]="2705";
citys[27][6]="2706";
citys[27][7]="2707";
citys[28][1]="2801";
citys[28][2]="2802";
citys[28][3]="2803";
citys[28][4]="2804";
citys[28][5]="2805";
citys[28][6]="2806";
citys[28][7]="2807";
citys[28][8]="2808";
citys[28][9]="2809";
citys[28][10]="2810";
citys[28][11]="2811";
citys[28][12]="2812";
citys[28][13]="2813";
citys[28][14]="2814";
citys[29][1]="2901";
citys[29][2]="2902";
citys[29][3]="2903";
citys[29][4]="2904";
citys[30][1]="3001";
citys[30][2]="3002";
citys[30][3]="3003";
citys[30][4]="3004";
citys[30][5]="3005";
citys[30][6]="3006";
citys[30][7]="3007";
citys[30][8]="3008";
citys[31][1]="3101";
citys[31][2]="3102";
citys[31][3]="3103";
citys[31][4]="3104";
citys[31][5]="3105";
citys[31][6]="3106";
citys[31][7]="3107";
citys[31][8]="3108";
citys[31][9]="3109";
citys[31][10]="3110";
citys[31][11]="3111";
citys[31][12]="3112";
citys[31][13]="3113";
citys[32][1]="3200";
citys[33][1]="3300";
citys[34][1]="3400";
citys[35][1]="3500";


name1[1][1]="北京市";

name1[2][1]="上海市";

name1[3][1]="天津市";

name1[4][1]="重庆市";

name1[5][1]="广州市";
name1[5][2]="深圳市";
name1[5][3]="珠海市";
name1[5][4]="汕头市";
name1[5][5]="韶关市";
name1[5][6]="河源市";
name1[5][7]="梅州市";
name1[5][8]="惠州市";
name1[5][9]="汕尾市";
name1[5][10]="东莞市";
name1[5][11]="中山市";
name1[5][12]="江门市";
name1[5][13]="佛山市";
name1[5][14]="阳江市";
name1[5][15]="湛江市";
name1[5][16]="茂名市";
name1[5][17]="肇庆市";
name1[5][18]="清远市";
name1[5][19]="潮州市";
name1[5][20]="揭阳市";
name1[5][21]="云浮市";
name1[6][1]="福州市";
name1[6][2]="厦门市";
name1[6][3]="三明市";
name1[6][4]="莆田市";
name1[6][5]="泉州市";
name1[6][6]="漳州市";
name1[6][7]="南平市";
name1[6][8]="龙岩市";
name1[6][9]="宁德市";
name1[7][1]="杭州市";
name1[7][2]="宁波市";
name1[7][3]="温州市";
name1[7][4]="嘉兴市";
name1[7][5]="湖州市";
name1[7][6]="绍兴市";
name1[7][7]="金华市";
name1[7][8]="衢州市";
name1[7][9]="舟山市";
name1[7][10]="台州市";
name1[7][11]="丽水市";
name1[8][1]="南京市";
name1[8][2]="徐州市";
name1[8][3]="连云港市";
name1[8][4]="淮安市";
name1[8][5]="宿迁市";
name1[8][6]="盐城市";
name1[8][7]="扬州市";
name1[8][8]="泰州市";
name1[8][9]="南通市";
name1[8][10]="镇江市";
name1[8][11]="常州市";
name1[8][12]="无锡市";
name1[8][13]="苏州市";
name1[9][1]="济南市";
name1[9][2]="青岛市";
name1[9][3]="淄博市";
name1[9][4]="枣庄市";
name1[9][5]="东营市";
name1[9][6]="潍坊市";
name1[9][7]="烟台市";
name1[9][8]="威海市";
name1[9][9]="济宁市";
name1[9][10]="泰安市";
name1[9][11]="日照市";
name1[9][12]="莱芜市";
name1[9][13]="德州市";
name1[9][14]="临沂市";
name1[9][15]="聊城市";
name1[9][16]="滨州市";
name1[9][17]="菏泽市";
name1[10][1]="沈阳市";
name1[10][2]="大连市";
name1[10][3]="鞍山市";
name1[10][4]="抚顺市";
name1[10][5]="本溪市";
name1[10][6]="丹东市";
name1[10][7]="锦州市";
name1[10][8]="葫芦岛市";
name1[10][9]="营口市";
name1[10][10]="盘锦市";
name1[10][11]="阜新市";
name1[10][12]="辽阳市";
name1[10][13]="铁岭市";
name1[10][14]="朝阳市";
name1[11][1]="南昌市";
name1[11][2]="景德镇市";
name1[11][3]="萍乡市";
name1[11][4]="新余市";
name1[11][5]="九江市";
name1[11][6]="鹰潭市";
name1[11][7]="赣州市";
name1[11][8]="吉安市";
name1[11][9]="宜春市";
name1[11][10]="抚州市";
name1[11][11]="上饶市";
name1[12][1]="成都市";
name1[12][2]="自贡市";
name1[12][3]="攀枝花市";
name1[12][4]="泸州市";
name1[12][5]="德阳市";
name1[12][6]="绵阳市";
name1[12][7]="广元市";
name1[12][8]="遂宁市";
name1[12][9]="内江市";
name1[12][10]="乐山市";
name1[12][11]="南充市";
name1[12][12]="宜宾市";
name1[12][13]="广安市";
name1[12][14]="达州市";
name1[12][15]="巴中市";
name1[12][16]="雅安市";
name1[12][17]="眉山市";
name1[12][18]="资阳市";
name1[12][19]="阿坝州";
name1[12][20]="甘孜州";
name1[12][21]="凉山州";
name1[13][1]="西安市";
name1[13][2]="铜川市";
name1[13][3]="宝鸡市";
name1[13][4]="咸阳市";
name1[13][5]="渭南市";
name1[13][6]="延安市";
name1[13][7]="汉中市";
name1[13][8]="榆林市";
name1[13][9]="安康市";
name1[13][10]="商洛地区";
name1[14][1]="武汉市";
name1[14][2]="黄石市";
name1[14][3]="襄樊市";
name1[14][4]="十堰市";
name1[14][5]="荆州市";
name1[14][6]="宜昌市";
name1[14][7]="荆门市";
name1[14][8]="鄂州市";
name1[14][9]="孝感市";
name1[14][10]="黄冈市";
name1[14][11]="咸宁市";
name1[14][12]="随州市";
name1[14][13]="仙桃市";
name1[14][14]="天门市";
name1[14][15]="潜江市";
name1[14][16]="神农架";
name1[14][17]="恩施州";
name1[15][1]="郑州市";
name1[15][2]="开封市";
name1[15][3]="洛阳市";
name1[15][4]="平顶山市";
name1[15][5]="焦作市";
name1[15][6]="鹤壁市";
name1[15][7]="新乡市";
name1[15][8]="安阳市";
name1[15][9]="濮阳市";
name1[15][10]="许昌市";
name1[15][11]="漯河市";
name1[15][12]="三门峡市";
name1[15][13]="南阳市";
name1[15][14]="商丘市";
name1[15][15]="信阳市";
name1[15][16]="周口市";
name1[15][17]="驻马店市";
name1[15][18]="济源市";
name1[16][1]="石家庄市";
name1[16][2]="唐山市";
name1[16][3]="秦皇岛市";
name1[16][4]="邯郸市";
name1[16][5]="邢台市";
name1[16][6]="保定市";
name1[16][7]="张家口市";
name1[16][8]="承德市";
name1[16][9]="沧州市";
name1[16][10]="廊坊市";
name1[16][11]="衡水市";
name1[17][1]="太原市";
name1[17][2]="大同市";
name1[17][3]="阳泉市";
name1[17][4]="长治市";
name1[17][5]="晋城市";
name1[17][6]="朔州市";
name1[17][7]="晋中市";
name1[17][8]="忻州市";
name1[17][9]="临汾市";
name1[17][10]="运城市";
name1[17][11]="吕梁地区";
name1[18][1]="呼和浩特";
name1[18][2]="包头市";
name1[18][3]="乌海市";
name1[18][4]="赤峰市";
name1[18][5]="通辽市";
name1[18][6]="鄂尔多斯";
name1[18][7]="乌兰察布";
name1[18][8]="锡林郭勒";
name1[18][9]="呼伦贝尔";
name1[18][10]="巴彦淖尔";
name1[18][11]="阿拉善盟";
name1[18][12]="兴安盟";
name1[19][1]="长春市";
name1[19][2]="吉林市";
name1[19][3]="四平市";
name1[19][4]="辽源市";
name1[19][5]="通化市";
name1[19][6]="白山市";
name1[19][7]="松原市";
name1[19][8]="白城市";
name1[19][9]="延边州";
name1[20][1]="哈尔滨市";
name1[20][2]="齐齐哈尔";
name1[20][3]="鹤岗市";
name1[20][4]="双鸭山市";
name1[20][5]="鸡西市";
name1[20][6]="大庆市";
name1[20][7]="伊春市";
name1[20][8]="牡丹江市";
name1[20][9]="佳木斯市";
name1[20][10]="七台河市";
name1[20][11]="黑河市";
name1[20][12]="绥化市";
name1[20][13]="大兴安岭";
name1[21][1]="合肥市";
name1[21][2]="芜湖市";
name1[21][3]="蚌埠市";
name1[21][4]="淮南市";
name1[21][5]="马鞍山市";
name1[21][6]="淮北市";
name1[21][7]="铜陵市";
name1[21][8]="安庆市";
name1[21][9]="黄山市";
name1[21][10]="滁州市";
name1[21][11]="阜阳市";
name1[21][12]="宿州市";
name1[21][13]="巢湖市";
name1[21][14]="六安市";
name1[21][15]="亳州市";
name1[21][16]="宣城市";
name1[21][17]="池州市";
name1[22][1]="长沙市";
name1[22][2]="株州市";
name1[22][3]="湘潭市";
name1[22][4]="衡阳市";
name1[22][5]="邵阳市";
name1[22][6]="岳阳市";
name1[22][7]="常德市";
name1[22][8]="张家界市";
name1[22][9]="益阳市";
name1[22][10]="郴州市";
name1[22][11]="永州市";
name1[22][12]="怀化市";
name1[22][13]="娄底市";
name1[22][14]="湘西州";
name1[23][1]="南宁市";
name1[23][2]="柳州市";
name1[23][3]="桂林市";
name1[23][4]="梧州市";
name1[23][5]="北海市";
name1[23][6]="防城港市";
name1[23][7]="钦州市";
name1[23][8]="贵港市";
name1[23][9]="玉林市";
name1[23][10]="崇左";
name1[23][11]="柳州";
name1[23][12]="贺州";
name1[23][13]="百色";
name1[23][14]="河池";
name1[24][1]="海口";
name1[24][2]="三亚市";
name1[24][3]="五指山市";
name1[24][4]="琼海市";
name1[24][5]="儋州市";
name1[24][6]="琼山市";
name1[24][7]="文昌市";
name1[24][8]="万宁市";
name1[24][9]="东方市";
name1[24][10]="澄迈县";
name1[24][11]="定安县";
name1[24][12]="屯昌县";
name1[24][13]="临高县";
name1[24][14]="白沙县";
name1[24][15]="昌江县";
name1[24][16]="乐东县";
name1[24][17]="陵水县";
name1[24][18]="保亭县";
name1[24][19]="琼中县";
name1[25][1]="昆明市";
name1[25][2]="曲靖市";
name1[25][3]="玉溪市";
name1[25][4]="保山市";
name1[25][5]="昭通市";
name1[25][6]="思茅地区";
name1[25][7]="临沧地区";
name1[25][8]="丽江地区";
name1[25][9]="文山州";
name1[25][10]="红河州";
name1[25][11]="西双版纳";
name1[25][12]="楚雄州";
name1[25][13]="大理州";
name1[25][14]="德宏州";
name1[25][15]="怒江州";
name1[25][16]="迪庆州";
name1[26][1]="贵阳市";
name1[26][2]="六盘水市";
name1[26][3]="遵义市";
name1[26][4]="安顺市";
name1[26][5]="铜仁地区";
name1[26][6]="毕节地区";
name1[26][7]="黔西南州";
name1[26][8]="黔东南州";
name1[26][9]="黔南州";
name1[27][1]="拉萨市";
name1[27][2]="那曲地区";
name1[27][3]="昌都地区";
name1[27][4]="山南地区";
name1[27][5]="日喀则";
name1[27][6]="阿里地区";
name1[27][7]="林芝地区";
name1[28][1]="兰州市";
name1[28][2]="金昌市";
name1[28][3]="白银市";
name1[28][4]="天水市";
name1[28][5]="嘉峪关市";
name1[28][6]="武威市";
name1[28][7]="定西地区";
name1[28][8]="平凉地区";
name1[28][9]="庆阳地区";
name1[28][10]="陇南地区";
name1[28][11]="张掖地区";
name1[28][12]="酒泉地区";
name1[28][13]="甘南州";
name1[28][14]="临夏州";
name1[29][1]="银川市";
name1[29][2]="石嘴山市";
name1[29][3]="吴忠市";
name1[29][4]="固原市";
name1[30][1]="西宁市";
name1[30][2]="海东地区";
name1[30][3]="海北州";
name1[30][4]="黄南州";
name1[30][5]="海南州";
name1[30][6]="果洛州";
name1[30][7]="玉树州";
name1[30][8]="海西州";
name1[31][1]="乌鲁木齐";
name1[31][2]="克拉玛依";
name1[31][3]="石河子市";
name1[31][4]="吐鲁番";
name1[31][5]="哈密地区";
name1[31][6]="和田地区";
name1[31][7]="阿克苏";
name1[31][8]="喀什地区";
name1[31][9]="克孜勒苏";
name1[31][10]="巴音郭楞";
name1[31][11]="昌吉州";
name1[31][12]="博尔塔拉";
name1[31][13]="伊犁州";
name1[32][1]="香港";
name1[33][1]="澳门";
name1[34][1]="台湾";
name1[35][1]="各地";


function clear2(o){
l=o.length;
for (i = 0; i< l; i++){
	o.options[1]=null;
}
}
function sdistrict2(oj,v){

var m=-1;
    for (i=1;i<=34;i++){
        if (province[i]==v){
	 m=i;
	}
   }
  clear2(oj);
  if (m!=-1){
     for (i=1;i<citys[m].length;i++){
      oj.add(new Option(name1[m][i],citys[m][i]));
     }
  }
}

function qz_clear(o){
l=o.length;

for (i = 0; i< l; i++){
	o.options[0]=null;
}
}
// 求职发布
function set_qzfb_pro(oj,k){
	var v=k.value;
      var m=-1;
    for (i=1;i<=36;i++){
        if (province[i]==v){
	 m=i;
	}
   }
  qz_clear(oj);
  if (m!=-1){
     for (i=1;i<citys[m].length;i++){
      oj.add(new Option(name1[m][i],citys[m][i]));
     }
  }
}