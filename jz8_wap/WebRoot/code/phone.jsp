<%@ page import="java.io.OutputStream" %>
<%@ page contentType="image/jpeg" import="java.awt.*,java.awt.image.*,java.util.*,javax.imageio.*,com.sun.image.codec.jpeg.JPEGCodec,com.sun.image.codec.jpeg.JPEGImageEncoder;"%>

<%!
Color getRandColor(int rc,int gc,int bc){//������Χ��������ɫ
       // Random random = new Random();
//       int r=fc,g=fc,b=bc;
//   int r=255,g=255,b=80;
//        if(fc>255) fc=255;
//        if(bc>255) bc=255;
//        int r=fc+random.nextInt(bc-fc);
//        int g=fc+random.nextInt(bc-fc);
//        int b=fc+random.nextInt(bc-fc);
        return new Color(rc,gc,bc);
        }
%>
<%
//����ҳ�治����
response.reset();
response.setContentType("image/jpeg");
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires", 0);
String tel=request.getParameter("tel");

if(tel!=null&&(tel.length()==32||tel.length()==64)) {
 byte[] decryptFrom = com.throne212.jianzhi8.common.DESUtil.parseHexStr2Byte(tel);
  byte[] decryptResult =com.throne212.jianzhi8.common.DESUtil.decrypt(decryptFrom, "my.jianzhi8.com.eagle.mobile");
  if(decryptResult!=null)
   tel=new String(decryptResult);

// ���ڴ��д���ͼ��
int width=150, height=20;
BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
OutputStream os=response.getOutputStream();

// ��ȡͼ��������
Graphics g = image.getGraphics();

//���������
Random random = new Random();

// �趨����ɫ
g.setColor(getRandColor(250,250,250));
g.fillRect(0, 0, width, height);

//�趨����
g.setFont(new Font("����",Font.PLAIN,16));

//���߿�
//g.setColor(new Color());
//g.drawRect(0,0,width-1,height-1);


// �������155�������ߣ�ʹͼ���е���֤�벻�ױ���������̽�⵽


// ȡ�����������֤��(4λ����)
//String rand = request.getParameter("rand");
//rand = rand.substring(0,rand.indexOf("."));

// char[]   seeds   =   {'0','1','2','3','4','5','6','7','8','9'};
//   'a','b','d','f','g','h','i','j','k','m','n','p','q','r','s','t','u','v','w','x','y','z'};
char[] seeds=tel.toCharArray();
String sRand="";
String rand="";
int count=4;
for (int i=0;i<seeds.length;i++){
//    String rand=String.valueOf(random.nextInt(10));
    rand= ""+seeds[i];
    sRand+=rand;
    // ����֤����ʾ��ͼ����
    g.setColor(new Color(0,0,0));//���ú�����������ɫ��ͬ����������Ϊ����̫�ӽ�������ֻ��ֱ������
     if(i!=0&&('@'==seeds[i-1])){
    count=11;
    } 
    g.drawString(rand,10*i+count,16);
}

// ����֤�����SESSION
//session.removeAttribute(Parameter.IMG_CODE);
//session.setAttribute(Parameter.IMG_CODE,sRand);

// ͼ����Ч
g.dispose();

// ���ͼ��ҳ��
JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(response.getOutputStream());
encoder.encode(image);
//ImageIO.write(image, "JPEG", response.getOutputStream());
os.flush();
os.close();
os=null;
response.flushBuffer();
out.clear();
out = pageContext.pushBody();
}
%>
