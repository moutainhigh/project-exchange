package com.throne212.jianzhi8.common;

public class WordToSpell {
    // ���������λ��ת������
    static final int GB_SP_DIFF = 160;
    // ��Ź���һ�����ֲ�ͬ��������ʼ��λ��
    static final int[] secPosvalueList = {
                                         1601, 1637, 1833, 2078, 2274, 2302,
                                         2433, 2594, 2787, 3106, 3212, 3472,
                                         3635, 3722, 3730, 3858, 4027,
                                         4086, 4390, 4558, 4684, 4925, 5249,
                                         5600}; // ��Ź���һ�����ֲ�ͬ��������ʼ��λ���Ӧ����
    static final char[] firstLetter = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
                                      'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q',
                                      'r', 's', 't', 'w', 'x', 'y', 'z'}; // ��ȡһ���ַ�����ƴ����
    public static String getFirstLetter(String oriStr) throws Exception {
        String str = oriStr.toLowerCase();
        StringBuffer buffer = new StringBuffer();
        char ch;
        char[] temp;
        for (int i = 0; i < str.length(); i++) { // ���δ���str��ÿ���ַ�
            ch = str.charAt(i);
            temp = new char[] {ch};
            //�˴�Ҫע����ǣ���Ϊ���ϴ󲿷���ֱ��ʹ��getBytes���������ݵ�ǰƽ̨�ַ���ȡ�õ��ֽڣ�
            //�ܶ�win7ϵͳ����Unicode���ַ�������˻�ȡ�������ֽڵ�byte�������Ͳ���ת���ɹ���
            //����ط����Ǽ��ϱ�űȽϺá�
            byte[] uniCode = new String(temp).getBytes("gb2312");
            if (uniCode[0] < 128 && uniCode[0] > 0) { // �Ǻ���
                buffer.append(temp);
            } else {
                buffer.append(convert(uniCode));
            }
        }
        return buffer.toString();
    } /**     * ��ȡһ�����ֵ�ƴ������ĸ�� GB�������ֽڷֱ��ȥ160��ת����10��������ϾͿ��Եõ���λ��     * ���纺�֡��㡱��GB����0xC4/0xE3���ֱ��ȥ0xA0��160������0x24/0x43     * 0x24ת��10���ƾ���36��0x43��67����ô������λ�����3667���ڶ��ձ��ж���Ϊ��n��     */

    static char convert(byte[] bytes) {
        char result = '-';
        int secPosvalue = 0;
        int i;
        for (i = 0; i < bytes.length; i++) {
            bytes[i] -= GB_SP_DIFF;
        }
        secPosvalue = bytes[0] * 100 + bytes[1];
        for (i = 0; i < 23; i++) {
            if (secPosvalue >= secPosvalueList[i] &&
                secPosvalue < secPosvalueList[i + 1]) {
                result = firstLetter[i];
                break;
            }
        }
        return result;
    }

    public static void main(String[] args) throws Exception {
        //System.out.println(getFirstLetter("I   love   u"));
        System.out.println(getFirstLetter("�ޱ���"));
        System.out.println(getFirstLetter("I   love   �����찲��"));
    }
}