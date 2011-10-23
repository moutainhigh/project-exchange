

function Check_Top(form){
  if((!checkEmpty(searchForm.rtype1.value))&&(!checkEmpty(searchForm.province.value)))
    {
        alert("地点省市、信息分类，二者必选其一！")
        return false;
    }
    }
function checkEmpty(value)
{
    if(value.length == 0)
    return false;
    var i = 0;
    while(i < value.length)
    {
        if(value.substring(i,i+1) != ' ')
        {
            return true;
        }
        i++;
    }
    return false;

}






//任务类型
var fclass;
var sort;
fclass=new Array(8);
sclass=new Array(8);
tclass=new Array(8);

sclass[1]=new Array(11);
sclass[2]=new Array(12);
sclass[3]=new Array(16);
sclass[4]=new Array(10);
sclass[5]=new Array(8);
sclass[6]=new Array(17);
sclass[7]=new Array(13);
sclass[8]=new Array(4);

tclass[1]=new Array(11);
tclass[2]=new Array(12);
tclass[3]=new Array(16);
tclass[4]=new Array(10);
tclass[5]=new Array(8);
tclass[6]=new Array(17);
tclass[7]=new Array(13);
tclass[8]=new Array(4);


fclass[1]="A";
fclass[2]="B";
fclass[3]="C";
fclass[4]="D";
fclass[5]="E";
fclass[6]="F";
fclass[7]="G";
fclass[8]="H";


    sclass[1][1] = "数据库";
    sclass[1][2] = "网站设计";
    sclass[1][3] = "平面设计";
    sclass[1][4] = "室内设计";
    sclass[1][5] = "网络维护";
    sclass[1][6] = "电脑调试";
    sclass[1][7] = "软件开发";
    sclass[1][8] = "三维动画";
    sclass[1][9] = "组装/维护";
    sclass[1][10] = "网上赚钱";
    sclass[1][11] = "其他IT类";

    sclass[2][1] = "文秘/助理";
    sclass[2][2] = "前台/领班";
    sclass[2][3] = "主管/库管";
    sclass[2][4] = "会计/出纳";
    sclass[2][5] = "业务/代理";
    sclass[2][6] = "维护/维修";
    sclass[2][7] = "产品/研发";
    sclass[2][8] = "编辑/校对";
    sclass[2][9] = "设计/策划";
    sclass[2][10] = "抄写/排版";
    sclass[2][11] = "打字/录入";
    sclass[2][12] = "其他商务服务";

    sclass[3][1] = "小学";
    sclass[3][2] = "初中";
    sclass[3][3] = "高中";
    sclass[3][4] = "高自考";
    sclass[3][5] = "成人高考";
    sclass[3][6] = "外语";
    sclass[3][7] = "数学";
    sclass[3][8] = "物理";
    sclass[3][9] = "化学";
    sclass[3][10] = "计算机";
    sclass[3][11] = "美术";
    sclass[3][12] = "音乐";
    sclass[3][13] = "舞蹈";
    sclass[3][14] = "书法";
    sclass[3][15] = "体育";
    sclass[3][16] = "其他家教";

    sclass[4][1] = "家务";
    sclass[4][2] = "保姆";
    sclass[4][3] = "钟点工";
    sclass[4][4] = "清洁";
    sclass[4][5] = "护理";
    sclass[4][6] = "厨师";
    sclass[4][7] = "维修";
    sclass[4][8] = "接送";
    sclass[4][9] = "搬运";
    sclass[4][10] = "其他家政";

    sclass[5][1] = "英语";
    sclass[5][2] = "日语";
    sclass[5][3] = "俄语";
    sclass[5][4] = "德语";
    sclass[5][5] = "法语";
    sclass[5][6] = "韩语";
    sclass[5][7] = "西班牙语";
    sclass[5][8] = "其他语言";

    sclass[6][1] = "礼仪";
    sclass[6][2] = "广告";
    sclass[6][3] = "模特";
    sclass[6][4] = "主持人";
    sclass[6][5] = "化妆师";
    sclass[6][6] = "DJ";
    sclass[6][7] = "演员";
    sclass[6][8] = "歌手";
    sclass[6][9] = "舞蹈";
    sclass[6][10] = "导游";
    sclass[6][11] = "购物";
    sclass[6][12] = "陪读";
    sclass[6][13] = "陪练";
    sclass[6][14] = "下棋";
    sclass[6][15] = "打球";
    sclass[6][16] = "旅游";
    sclass[6][17] = "其他文娱休闲";

    sclass[7][1] = "快递";
    sclass[7][2] = "保安";
    sclass[7][3] = "市场调查";
    sclass[7][4] = "促销/销售";
    sclass[7][5] = "发宣传品";
    sclass[7][6] = "钟点工";
    sclass[7][7] = "服务员";
    sclass[7][8] = "自由撰稿人";
    sclass[7][9] = "会场工作员";
    sclass[7][10] = "学徒/实习生";
    sclass[7][11] = "自愿者";
    sclass[7][12] = "SOHO一族";
    sclass[7][13] = "其他社会服务";

    sclass[8][1] = "假期兼职";
    sclass[8][2] = "双休兼职";
    sclass[8][3] = "晚上兼职";
    sclass[8][4] = "其他兼职";

    tclass[1][1] = "01";
    tclass[1][2] = "02";
    tclass[1][3] = "03";
    tclass[1][4] = "04";
    tclass[1][5] = "05";
    tclass[1][6] = "06";
    tclass[1][7] = "07";
    tclass[1][8] = "08";
    tclass[1][9] = "09";
    tclass[1][10] = "10";
    tclass[1][11] = "11";

    tclass[2][1] = "01";
    tclass[2][2] = "02";
    tclass[2][3] = "03";
    tclass[2][4] = "04";
    tclass[2][5] = "05";
    tclass[2][6] = "06";
    tclass[2][7] = "07";
    tclass[2][8] = "08";
    tclass[2][9] = "09";
    tclass[2][10] = "10";
    tclass[2][11] = "11";
    tclass[2][12] = "12";

    tclass[3][1] = "01";
    tclass[3][2] = "02";
    tclass[3][3] = "03";
    tclass[3][4] = "04";
    tclass[3][5] = "05";
    tclass[3][6] = "06";
    tclass[3][7] = "07";
    tclass[3][8] = "08";
    tclass[3][9] = "09";
    tclass[3][10] = "10";
    tclass[3][11] = "11";
    tclass[3][12] = "12";
    tclass[3][13] = "13";
    tclass[3][14] = "14";
    tclass[3][15] = "15";
    tclass[3][16] = "16";

    tclass[4][1] = "01";
    tclass[4][2] = "02";
    tclass[4][3] = "03";
    tclass[4][4] = "04";
    tclass[4][5] = "05";
    tclass[4][6] = "06";
    tclass[4][7] = "07";
    tclass[4][8] = "08";
    tclass[4][9] = "09";
    tclass[4][10] = "10";

    tclass[5][1] = "01";
    tclass[5][2] = "02";
    tclass[5][3] = "03";
    tclass[5][4] = "04";
    tclass[5][5] = "05";
    tclass[5][6] = "06";
    tclass[5][7] = "07";
    tclass[5][8] = "08";

    tclass[6][1] = "01";
    tclass[6][2] = "02";
    tclass[6][3] = "03";
    tclass[6][4] = "04";
    tclass[6][5] = "05";
    tclass[6][6] = "06";
    tclass[6][7] = "07";
    tclass[6][8] = "08";
    tclass[6][9] = "09";
    tclass[6][10] = "10";
    tclass[6][11] = "11";
    tclass[6][12] = "12";
    tclass[6][13] = "13";
    tclass[6][14] = "14";
    tclass[6][15] = "15";
    tclass[6][16] = "16";
    tclass[6][17] = "17";

    tclass[7][1] = "01";
    tclass[7][2] = "02";
    tclass[7][3] = "03";
    tclass[7][4] = "04";
    tclass[7][5] = "05";
    tclass[7][6] = "06";
    tclass[7][7] = "07";
    tclass[7][8] = "08";
    tclass[7][9] = "09";
    tclass[7][10] = "10";
    tclass[7][11] = "11";
    tclass[7][12] = "12";
    tclass[7][13] = "13";

    tclass[8][1] = "01";
    tclass[8][2] = "02";
    tclass[8][3] = "03";
    tclass[8][4] = "04";


function sdistrict3(oj,v){
//       alert(v);
	var m=-1;
	for (i=1;i<=8;i++){
		if (fclass[i]==v){
			m=i;
			}
	}
	clear2(oj);
	if (m!=-1){
	 	for (i=1;i<sclass[m].length;i++){
		 	oj.add(new Option(sclass[m][i],(v+tclass[m][i])));
                        // oj.add(new Option(sclass[m][i],sclass[m][i]));
		}

	}
}

function setType2(oj,cc,v){
//       alert(cc+v);
	var m=-1;
	for (i=1;i<=8;i++){
		if (fclass[i]==v){
			m=i;
			}
	}
	clear2(oj);
        var temp;
	if (m!=-1){
	 	for (i=1;i<sclass[m].length;i++){
                      temp=v+tclass[m][i];
//                      alert(temp+""+cc);
                      if(cc==temp){
//                        alert(temp+""+cc);
		 	oj.add(new Option(sclass[m][i],temp));
                        oj.options[i].selected=true;
                         }
                      else{
                      oj.add(new Option(sclass[m][i],temp));
                      }
		}

	}
}

function SecClass(ojtL,ojtR){
	var temp = -1;
	var curValueL = ojtL.value;
	for (i=1;i<=8;i++){
		if (fclass[i]==curValueL){
			temp=i;
		}
	}
	clear2(ojtR);
	if (temp!=-1){
	 	for (i=1;i<sclass[temp].length;i++){
		 	ojtR.add(new Option(sclass[temp][i],(curValueL+tclass[temp][i])));

		}
	}
}

//地区数组
var citys;
var province;
var name1;
province=new Array(35);
citys=new Array(35);
name1=new Array(35);


citys[1]=new Array(18);
citys[2]=new Array(19);
citys[3]=new Array(18);
citys[4]=new Array(40);
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
citys[32]=new Array(18);
citys[33]=new Array(1);
citys[34]=new Array(23);


name1[1]=new Array(18);
name1[2]=new Array(19);
name1[3]=new Array(18);
name1[4]=new Array(40);
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
name1[32]=new Array(18);
name1[33]=new Array(1);
name1[34]=new Array(23);


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




citys[1][1]="0101";
citys[1][2]="0102";
citys[1][3]="0103";
citys[1][4]="0104";
citys[1][5]="0105";
citys[1][6]="0106";
citys[1][7]="0107";
citys[1][8]="0108";
citys[1][9]="0109";
citys[1][10]="0110";
citys[1][11]="0111";
citys[1][12]="0112";
citys[1][13]="0113";
citys[1][14]="0114";
citys[1][15]="0115";
citys[1][16]="0116";
citys[1][17]="0117";
citys[1][18]="0118";
citys[2][1]="0201";
citys[2][2]="0202";
citys[2][3]="0203";
citys[2][4]="0204";
citys[2][5]="0205";
citys[2][6]="0206";
citys[2][7]="0207";
citys[2][8]="0208";
citys[2][9]="0209";
citys[2][10]="0210";
citys[2][11]="0211";
citys[2][12]="0212";
citys[2][13]="0213";
citys[2][14]="0214";
citys[2][15]="0215";
citys[2][16]="0216";
citys[2][17]="0217";
citys[2][18]="0218";
citys[2][19]="0219";
citys[3][1]="0301";
citys[3][2]="0302";
citys[3][3]="0303";
citys[3][4]="0304";
citys[3][5]="0305";
citys[3][6]="0306";
citys[3][7]="0307";
citys[3][8]="0308";
citys[3][9]="0309";
citys[3][10]="0310";
citys[3][11]="0311";
citys[3][12]="0312";
citys[3][13]="0313";
citys[3][14]="0314";
citys[3][15]="0315";
citys[3][16]="0316";
citys[3][17]="0317";
citys[3][18]="0318";
citys[4][1]="0401";
citys[4][2]="0402";
citys[4][3]="0403";
citys[4][4]="0404";
citys[4][5]="0405";
citys[4][6]="0406";
citys[4][7]="0407";
citys[4][8]="0408";
citys[4][9]="0409";
citys[4][10]="0410";
citys[4][11]="0411";
citys[4][12]="0412";
citys[4][13]="0413";
citys[4][14]="0414";
citys[4][15]="0415";
citys[4][16]="0416";
citys[4][17]="0417";
citys[4][18]="0418";
citys[4][19]="0419";
citys[4][20]="0420";
citys[4][21]="0421";
citys[4][22]="0422";
citys[4][23]="0423";
citys[4][24]="0424";
citys[4][25]="0425";
citys[4][26]="0426";
citys[4][27]="0427";
citys[4][28]="0428";
citys[4][29]="0429";
citys[4][30]="0430";
citys[4][31]="0431";
citys[4][32]="0432";
citys[4][33]="0433";
citys[4][34]="0434";
citys[4][35]="0435";
citys[4][36]="0436";
citys[4][37]="0437";
citys[4][38]="0438";
citys[4][39]="0439";
citys[4][40]="0440";
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
citys[18][12]="181812";
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
citys[32][1]="3201";
citys[32][2]="3202";
citys[32][3]="3203";
citys[32][4]="3204";
citys[32][5]="3205";
citys[32][6]="3206";
citys[32][7]="3207";
citys[32][8]="3208";
citys[32][9]="3209";
citys[32][10]="3210";
citys[32][11]="3211";
citys[32][12]="3212";
citys[32][13]="3213";
citys[32][14]="3214";
citys[32][15]="3215";
citys[32][16]="3216";
citys[32][17]="3217";
citys[32][18]="3218";
citys[33][1]="3301";
citys[34][1]="3401";
citys[34][2]="3402";
citys[34][3]="3403";
citys[34][4]="3404";
citys[34][5]="3405";
citys[34][6]="3406";
citys[34][7]="3407";
citys[34][8]="3408";
citys[34][9]="3409";
citys[34][10]="3410";
citys[34][11]="3411";
citys[34][12]="3412";
citys[34][13]="3413";
citys[34][14]="3414";
citys[34][15]="3415";
citys[34][16]="3416";
citys[34][17]="3417";
citys[34][18]="3418";
citys[34][19]="3419";
citys[34][20]="3420";
citys[34][21]="3421";
citys[34][22]="3422";
citys[34][23]="3423";



name1[1][1]="东城区";
name1[1][2]="西城区";
name1[1][3]="崇文区";
name1[1][4]="宣武区";
name1[1][5]="朝阳区";
name1[1][6]="海淀区";
name1[1][7]="丰台区";
name1[1][8]="石景山区";
name1[1][9]="门头沟区";
name1[1][10]="房山区";
name1[1][11]="通州区";
name1[1][12]="顺义区";
name1[1][13]="昌平区";
name1[1][14]="大兴区";
name1[1][15]="平谷县";
name1[1][16]="怀柔县";
name1[1][17]="密云县";
name1[1][18]="延庆县";
name1[2][1]="黄浦区";
name1[2][2]="卢湾区";
name1[2][3]="徐汇区";
name1[2][4]="长宁区";
name1[2][5]="静安区";
name1[2][6]="普陀区";
name1[2][7]="闸北区";
name1[2][8]="虹口区";
name1[2][9]="杨浦区";
name1[2][10]="宝山区";
name1[2][11]="闵行区";
name1[2][12]="嘉定区";
name1[2][13]="浦东新区";
name1[2][14]="松江区";
name1[2][15]="金山区";
name1[2][16]="青浦区";
name1[2][17]="南汇区";
name1[2][18]="奉贤区";
name1[2][19]="崇明县";
name1[3][1]="和平区";
name1[3][2]="河东区";
name1[3][3]="河西区";
name1[3][4]="南开区";
name1[3][5]="河北区";
name1[3][6]="红桥区";
name1[3][7]="塘沽区";
name1[3][8]="汉沽区";
name1[3][9]="大港区";
name1[3][10]="东丽区";
name1[3][11]="西青区";
name1[3][12]="北辰区";
name1[3][13]="津南区";
name1[3][14]="武清区";
name1[3][15]="宝坻区";
name1[3][16]="静海县";
name1[3][17]="宁河县";
name1[3][18]="蓟县";
name1[4][1]="渝中区";
name1[4][2]="大渡口区";
name1[4][3]="江北区";
name1[4][4]="沙坪坝区";
name1[4][5]="九龙坡区";
name1[4][6]="南岸区";
name1[4][7]="北碚区";
name1[4][8]="万盛区";
name1[4][9]="双桥区";
name1[4][10]="渝北区";
name1[4][11]="巴南区";
name1[4][12]="万州区";
name1[4][13]="涪陵区";
name1[4][14]="黔江区";
name1[4][15]="永川市";
name1[4][16]="合川市";
name1[4][17]="江津市";
name1[4][18]="南川市";
name1[4][19]="长寿县";
name1[4][20]="綦江县";
name1[4][21]="潼南县";
name1[4][22]="荣昌县";
name1[4][23]="璧山县";
name1[4][24]="大足县";
name1[4][25]="铜梁县";
name1[4][26]="梁平县";
name1[4][27]="城口县";
name1[4][28]="垫江县";
name1[4][29]="武隆县";
name1[4][30]="丰都县";
name1[4][31]="奉节县";
name1[4][32]="开县";
name1[4][33]="云阳县";
name1[4][34]="忠县";
name1[4][35]="巫溪县";
name1[4][36]="巫山县";
name1[4][37]="石柱县";
name1[4][38]="秀山县";
name1[4][39]="酉阳县";
name1[4][40]="彭水县";
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
name1[23][10]="南宁地区";
name1[23][11]="柳州地区";
name1[23][12]="贺州地区";
name1[23][13]="百色地区";
name1[23][14]="河池地区";
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
name1[32][1]="中西区";
name1[32][2]="东区";
name1[32][3]="九龙城区";
name1[32][4]="观塘区";
name1[32][5]="南区";
name1[32][6]="深水埗区";
name1[32][7]="湾仔区";
name1[32][8]="黄大仙区";
name1[32][9]="油尖旺区";
name1[32][10]="离岛区";
name1[32][11]="葵青区";
name1[32][12]="北区";
name1[32][13]="西贡区";
name1[32][14]="沙田区";
name1[32][15]="屯门区";
name1[32][16]="大埔区";
name1[32][17]="荃湾区";
name1[32][18]="元朗区";
name1[33][1]="澳门";
name1[34][1]="台北市";
name1[34][2]="高雄市";
name1[34][3]="基隆市";
name1[34][4]="台中市";
name1[34][5]="台南市";
name1[34][6]="新竹市";
name1[34][7]="嘉义市";
name1[34][8]="台北县";
name1[34][9]="宜兰县";
name1[34][10]="新竹县";
name1[34][11]="桃园县";
name1[34][12]="苗栗县";
name1[34][13]="台中县";
name1[34][14]="彰化县";
name1[34][15]="南投县";
name1[34][16]="嘉义县";
name1[34][17]="云林县";
name1[34][18]="台南县";
name1[34][19]="高雄县";
name1[34][20]="屏东县";
name1[34][21]="台东县";
name1[34][22]="花莲县";
name1[34][23]="澎湖县";


function clear2(o_top){
var l_top=o_top.length;
for (i = 0; i< l_top; i++){
	o_top.options[1]=null;
}
}
function sdistrict2(oj2,v){
	var m=-1;
	for (i=1;i<=34;i++){
  		if (province[i]==v){
     			m=i;
     		}
	}
	clear2(oj2);
	if (m!=-1){
		for (i=1;i<citys[m].length;i++){
		oj2.add(new Option(name1[m][i],citys[m][i]));
		}
	}
}

function setCity(oj2,cc,v){
	var m=-1;
	for (i=1;i<=34;i++){
  		if (province[i]==v){
     			m=i;
     		}
	}
	clear2(oj2);
	if (m!=-1){
		for (i=1;i<citys[m].length;i++){
		    if(cc==citys[m][i])
                   {
                      oj2.add(new Option(name1[m][i],citys[m][i]));
                      oj2.options[i].selected=true;
                   }
                   else{
                     oj2.add(new Option(name1[m][i],citys[m][i]));
                     }
		}
	}
}



function setPro(oj2,cc){
  if(cc.length>0&&cc!='null')
oj2.options[cc].selected=true;
}


function setType1(oj2,cc){
  for(i=1;i<=8;i++){
  if(cc==fclass[i]){
  oj2.options[i].selected=true;
  }
}
}

function setKind(oj2,cc){
for(i=1;i<3;i++){
  if(oj2.options[i].value==cc){
  oj2.options[i].selected=true;
  }
}
}


function SecCity(ojtL,ojtR){

	var m=-1;
	var v = ojtL.value;
	for (i=1;i<=8;i++){
				if (province[i]==v){
				m=i;
				}
	}
	clear2(ojtR);
	if (m!=-1){
	for (i=1;i<citys[m].length;i++){
	ojtR.add(new Option(name1[m][i],citys[m][i]));
	}
	}

}

