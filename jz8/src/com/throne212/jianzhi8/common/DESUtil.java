package com.throne212.jianzhi8.common;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec; /** * @author 【轰隆隆】 * */
import java.security.Key;
import java.security.SecureRandom;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;


public class DESUtil {
    static Key key;
  /** * AES加密算法 */
  public DESUtil() {
  }
  /**  * 加密  * @param content 需要加密的内容  * @param keyWord  加密密钥  * @return byte[]  加密后的字节数组 */

  public static byte[] encrypt(String content, String keyWord) {
    try {
      KeyGenerator kgen = KeyGenerator.getInstance("AES");
      SecureRandom secureRandom = SecureRandom.getInstance("SHA1PRNG");
      secureRandom.setSeed(keyWord.getBytes());
      kgen.init(128, secureRandom);
      SecretKey secretKey = kgen.generateKey();
      byte[] enCodeFormat = secretKey.getEncoded();
      SecretKeySpec key = new SecretKeySpec(enCodeFormat, "AES");
      Cipher cipher = Cipher.getInstance("AES"); // 创建密码器
      byte[] byteContent = content.getBytes("utf-8");
      cipher.init(Cipher.ENCRYPT_MODE, key); // 初始化
      byte[] result = cipher.doFinal(byteContent);
      return result; // 加密
    }
    catch (NoSuchAlgorithmException e) {
      e.printStackTrace();
    }
    catch (NoSuchPaddingException e) {
      e.printStackTrace();
    }
    catch (InvalidKeyException e) {
      e.printStackTrace();
    }
    catch (UnsupportedEncodingException e) {
      e.printStackTrace();
    }
    catch (IllegalBlockSizeException e) {
      e.printStackTrace();
    }
    catch (BadPaddingException e) {
      e.printStackTrace();
    }
    return null;
  }

  /** * @param content 需要加密的内容 * @param password 加密密钥 * @return String  加密后的字符串 */

  public static String encrypttoStr(String content, String password) {
    return parseByte2HexStr(encrypt(content, password));
  }

  /**解密  * @param content  待解密内容  * @param keyWord 解密密钥  * @return  byte[] */

  public static byte[] decrypt(byte[] content, String keyWord) {
    try {
      KeyGenerator kgen = KeyGenerator.getInstance("AES");
      SecureRandom secureRandom = SecureRandom.getInstance("SHA1PRNG");
      secureRandom.setSeed(keyWord.getBytes());
      kgen.init(128, secureRandom);
      SecretKey secretKey = kgen.generateKey();
      byte[] enCodeFormat = secretKey.getEncoded();
      SecretKeySpec key = new SecretKeySpec(enCodeFormat, "AES");
      Cipher cipher = Cipher.getInstance("AES"); // 创建密码器
      cipher.init(Cipher.DECRYPT_MODE, key); // 初始化
      byte[] result = cipher.doFinal(content);
      return result; // 加密
    }
    catch (NoSuchAlgorithmException e) {
      e.printStackTrace();
    }
    catch (NoSuchPaddingException e) {
      e.printStackTrace();
    }
    catch (InvalidKeyException e) {
      e.printStackTrace();
    }
    catch (IllegalBlockSizeException e) {
      e.printStackTrace();
    }
    catch (BadPaddingException e) {
      e.printStackTrace();
    }
    return null;
  }

  /** * @param content 待解密内容(字符串) * @param keyWord 解密密钥 * @return byte[] */

  public static byte[] decrypt(String content, String keyWord) {
    try {
      return decrypt(parseHexStr2Byte(content), keyWord);
    }
    catch (Exception ex) {
      return null;
    }
  }

  /**将二进制转换成16进制  * @param buf  * @return  String */

  public static String parseByte2HexStr(byte buf[]) {
    StringBuffer sb = new StringBuffer();
    for (int i = 0; i < buf.length; i++) {
      String hex = Integer.toHexString(buf[i] & 0xFF);
      if (hex.length() == 1) {
        hex = '0' + hex;
      }
      sb.append(hex.toUpperCase());
    }
    return sb.toString();
  }

  public static String parseByte2HexStr2(byte buf[]) {
StringBuffer sb = new StringBuffer();
for (int i = 0; i < buf.length; i++) {
String hex = Integer.toHexString(buf[i] & 0xFF);
if (hex.length() == 1) {
hex = '0' + hex;
}
sb.append(hex.toUpperCase());
}
return sb.toString();
  }



  /**将16进制转换为二进制  * @param hexStr  * @return  byte[] */

  public static byte[] parseHexStr2Byte(String hexStr) {
    if (hexStr.length() < 1) {
      return null;
    }
    byte[] result = new byte[hexStr.length() / 2];
    for (int i = 0; i < hexStr.length() / 2; i++) {
      int high = Integer.parseInt(hexStr.substring(i * 2, i * 2 + 1), 16);
      int low = Integer.parseInt(hexStr.substring(i * 2 + 1, i * 2 + 2), 16);
      result[i] = (byte) (high * 16 + low);
    }
    return result;
  }



  /**----------------------------------------------------------------------------------------------
   * 根据参数生成KEY
   *
   * @param strKey
   */
  public static void getKey(String strKey) {
   try {
    KeyGenerator _generator = KeyGenerator.getInstance("DES");
    _generator.init(new SecureRandom(strKey.getBytes()));
    key = _generator.generateKey();
    _generator = null;
   } catch (Exception e) {
    e.printStackTrace();
   }
  }

  /**
   * 加密String明文输入,String密文输出
   *
   * @param strMing
   * @return
   */
  public static String getEncString(String strMing) {
   byte[] byteMi = null;
   byte[] byteMing = null;
   String strMi = "";
   try {
    return byte2hex(getEncCode(strMing.getBytes()));

    // byteMing = strMing.getBytes("UTF8");
    // byteMi = this.getEncCode(byteMing);
    // strMi = new String( byteMi,"UTF8");
   } catch (Exception e) {
    e.printStackTrace();
   } finally {
    byteMing = null;
    byteMi = null;
   }
   return strMi;
  }

  /**
   * 解密 以String密文输入,String明文输出
   *
   * @param strMi
   * @return
   */
  public static String getDesString(String strMi) {
   byte[] byteMing = null;
   byte[] byteMi = null;
   String strMing = "";
   try {
    return new String(getDesCode(hex2byte(strMi.getBytes())));

    // byteMing = this.getDesCode(byteMi);
    // strMing = new String(byteMing,"UTF8");
   } catch (Exception e) {
    e.printStackTrace();
   } finally {
    byteMing = null;
    byteMi = null;
   }
   return strMing;
  }

  /**
   * 加密以byte[]明文输入,byte[]密文输出
   *
   * @param byteS
   * @return
   */
  private static byte[] getEncCode(byte[] byteS) {
   byte[] byteFina = null;
   Cipher cipher;
   try {
    cipher = Cipher.getInstance("DES");
    cipher.init(Cipher.ENCRYPT_MODE, key);
    byteFina = cipher.doFinal(byteS);
   } catch (Exception e) {
    e.printStackTrace();
   } finally {
    cipher = null;
   }
   return byteFina;
  }

  /**
   * 解密以byte[]密文输入,以byte[]明文输出
   *
   * @param byteD
   * @return
   */
  private static byte[] getDesCode(byte[] byteD) {
   Cipher cipher;
   byte[] byteFina = null;
   try {
    cipher = Cipher.getInstance("DES");
    cipher.init(Cipher.DECRYPT_MODE, key);
    byteFina = cipher.doFinal(byteD);
   } catch (Exception e) {
    e.printStackTrace();
   } finally {
    cipher = null;
   }
   return byteFina;
  }

  /**
   * 二行制转字符串
   *
   * @param b
   * @return
   */
  public static String byte2hex(byte[] b) { // 一个字节的数，
   // 转成16进制字符串
   String hs = "";
   String stmp = "";
   for (int n = 0; n < b.length; n++) {
    // 整数转成十六进制表示
    stmp = (java.lang.Integer.toHexString(b[n] & 0XFF));
    if (stmp.length() == 1)
     hs = hs + "0" + stmp;
    else
     hs = hs + stmp;
   }
   return hs.toUpperCase(); // 转成大写
  }

  public static byte[] hex2byte(byte[] b) {
   if ((b.length % 2) != 0){
    throw new IllegalArgumentException("长度不是偶数");
  }
   byte[] b2 = new byte[b.length / 2];
    for (int n = 0; n < b.length; n += 2) {
      String item = new String(b, n, 2);
      // 两位一组，表示一个字节,把这样表示的16进制字符串，还原成一个进制字节
      b2[n / 2] = (byte) Integer.parseInt(item, 16);
    }
   return b2;
  }

//  public static void main(String[] args) {
//   DESUtil des = new DESUtil();// 实例化一个对像
//   getKey("aadd");// 生成密匙
//
//   String strEnc = des.getEncString("樊振华48@ffs.com546");// 加密字符串,返回String的密文
//   System.out.println(strEnc);
//
//   String strDes = des.getDesString("454645");// 把String 类型的密文解密
//   System.out.println(strDes);
//  }
//
//}
  public static void main(String[] args) { //0D1495C414BD08A7A5B9D39CD182F62F

//    String content = "13601342990";
//    String Key = "my.jianzhi8.com.eagle.phone"; //加密
//    System.out.println("加密前：" + content);
//    String encryptResult = encrypttoStr(content, Key);
//    System.out.println("加密后：" + encryptResult); //解密
//    byte[] decryptResult = decrypt(encryptResult, Key);
//    System.out.println("解密后：" + new String(decryptResult));

    String  content = "13692525221sbw8@s12165626+25+653161ina.com";
    String password = "my.jianzhi8.com.eagle.phone";
  //加密
    System.out.println("加密前：" + content+"  "+content.length());

    byte[] encryptResult = encrypt(content, password);
    String encryptResultStr = parseByte2HexStr(encryptResult)+"";
    System.out.println("加密后：" + encryptResultStr+"  "+encryptResultStr.length());
  //解密

    if(encryptResultStr!=null&&(encryptResultStr.length()==32||encryptResultStr.length()==64)){
      byte[] decryptFrom = parseHexStr2Byte(encryptResultStr);
      byte[] decryptResult = decrypt(decryptFrom, password);
      System.out.println("解密后：" + new String(decryptResult));
    }
  }
}
