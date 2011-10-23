 var duping;

duping=new Array(10);

duping[1]="情人"; 
duping[2]="贷款"; 
duping[3]="四六级答案"; 
duping[4]="代孕";
duping[5]="捐卵";
duping[6]="伴游";
duping[7]="公主";
duping[8]="包养"; 
duping[9]="代考";
duping[10]="陪聊";
duping[11]="法轮功";  
duping[12]="大纪元";    
duping[13]="真善忍";   
duping[14]="肉棍"; 
duping[15]="淫靡"; 
duping[16]="淫水"; 
duping[17]="迷药"; 
duping[18]="迷昏药"; 
duping[19]="窃听器";   
duping[20]="买卖枪支"; 
duping[21]="退党"; 
duping[22]="三唑仑"; 
duping[23]="麻醉药"; 
duping[24]="麻醉乙醚"; 
duping[25]="短信群发器"; 
duping[26]="色情服务"; 
duping[27]="出售枪支"; 
duping[28]="迷药"; 
duping[29]="摇头丸";  
duping[30]="西藏天葬";  
duping[31]="投毒杀人";  
duping[32]="出售假币"; 
duping[33]="监听王"; 
duping[34]="昏药"; 
duping[35]="侦探设备";   
duping[36]="麻醉钢枪"; 
duping[37]="升达毕业证"; 
duping[38]="佳静安定片";
duping[39]="蒙汗药粉"; 
duping[40]="古方迷香"; 
duping[41]="强效失意药";  
duping[42]="迷奸药";  
duping[43]="透视眼镜";  
duping[44]="远程偷拍"; 
duping[45]="自制手枪"; 
duping[46]="激情小电影"; 
duping[47]="黄色小电影";  
duping[48]="色情小电影";  
duping[49]="高校群体事件";  
duping[50]="催情药"; 
duping[51]="拍肩神药"; 
duping[52]="春药";   
duping[53]="窃听器材";   
duping[54]="身份证生成器";  
duping[55]="枪决现场";   
duping[56]="出售手枪";   
duping[57]="麻醉枪"; 
duping[58]="办理证件";   
duping[59]="办理文凭";  
duping[60]="枪支弹药";  
duping[61]="血腥图片"; 
duping[62]="反政府"; 
duping[63]="成人片"; 
duping[64]="成人电影"; 
duping[65]="换妻"; 
duping[66]="三级片"; 



   function countInstances(mainStr)
    {
        var count = 0;
        var offset = 0;
        var  leng=duping.length;
        for (i=1;i<=leng;i++){
        	offset = mainStr.toLowerCase().indexOf(duping[i],0);
					if(offset != -1)
            {
                count++;
                break;
            }
		}     
        return count;
    }