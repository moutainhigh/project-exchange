 var duping;

duping=new Array(10);

duping[1]="����"; 
duping[2]="����"; 
duping[3]="��������"; 
duping[4]="����";
duping[5]="����";
duping[6]="����";
duping[7]="����";
duping[8]="����"; 
duping[9]="����";
duping[10]="����";
duping[11]="���ֹ�";  
duping[12]="���Ԫ";    
duping[13]="������";   
duping[14]="���"; 
duping[15]="����"; 
duping[16]="��ˮ"; 
duping[17]="��ҩ"; 
duping[18]="�Ի�ҩ"; 
duping[19]="������";   
duping[20]="����ǹ֧"; 
duping[21]="�˵�"; 
duping[22]="������"; 
duping[23]="����ҩ"; 
duping[24]="��������"; 
duping[25]="����Ⱥ����"; 
duping[26]="ɫ�����"; 
duping[27]="����ǹ֧"; 
duping[28]="��ҩ"; 
duping[29]="ҡͷ��";  
duping[30]="��������";  
duping[31]="Ͷ��ɱ��";  
duping[32]="���ۼٱ�"; 
duping[33]="������"; 
duping[34]="��ҩ"; 
duping[35]="��̽�豸";   
duping[36]="�����ǹ"; 
duping[37]="�����ҵ֤"; 
duping[38]="�Ѿ�����Ƭ";
duping[39]="�ɺ�ҩ��"; 
duping[40]="�ŷ�����"; 
duping[41]="ǿЧʧ��ҩ";  
duping[42]="�Լ�ҩ";  
duping[43]="͸���۾�";  
duping[44]="Զ��͵��"; 
duping[45]="������ǹ"; 
duping[46]="����С��Ӱ"; 
duping[47]="��ɫС��Ӱ";  
duping[48]="ɫ��С��Ӱ";  
duping[49]="��УȺ���¼�";  
duping[50]="����ҩ"; 
duping[51]="�ļ���ҩ"; 
duping[52]="��ҩ";   
duping[53]="��������";   
duping[54]="���֤������";  
duping[55]="ǹ���ֳ�";   
duping[56]="������ǹ";   
duping[57]="����ǹ"; 
duping[58]="����֤��";   
duping[59]="������ƾ";  
duping[60]="ǹ֧��ҩ";  
duping[61]="Ѫ��ͼƬ"; 
duping[62]="������"; 
duping[63]="����Ƭ"; 
duping[64]="���˵�Ӱ"; 
duping[65]="����"; 
duping[66]="����Ƭ"; 



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