<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK" />
    <title>${appTitle}</title>
    <meta name="description" content="${appDesc}" />
    <meta name="keywords"  content="${appKeywords}" />
    <link href="Themes/basic.css" type="text/css" rel="stylesheet" />
    <link href="Themes/pagestyle.css" type="text/css" rel="stylesheet" />
    <script src="js/jquery.js"></script>
    <script src="js/common.js"></script>
</head>
<body>

    <jsp:include page="top.jsp" flush="false"></jsp:include>
    
    <!---- begin���Ŀ�� ---->
<div class="wrapper mauto pad_5">
      <div class="search_area">
        <div class="fl ft14 w550 hide">���¶�̬������ף���żҿ���������ͨ����<span class="red">���ñ��ض�̬�е�����һ����Ϣ</span>��</div>
          <div class="fr w350 pad_l10 bls_gray">
            <div class="fl blue">վ������</div>
                        <div class="fl mar_l5">
                          <select name="select" id="select">
                            <option>���������</option>
                          </select>
                        </div>
            <div class="fl mar_l5">
              <input type="text" class="gray input03" value="--������ؼ���--" />
            </div>
                        <div class="fl">
                          <input class="hledat" type="image" src="Themes/images/search-button.gif" name="input" value="Search" alt="Search" />
        </div></div>
      <div class="clear"></div>
      </div>
      
      <div class="part01 mar_t6">
           <div class="fl w348 hide">
      <div class="b_3gray">
      <div class="pic-imgnews">
        <img src="Themes/images/ad.jpg" alt="�л����" width="340" height="230" />
        <div class="txt">���հ�ȫ�������ձ�������ʻ��ѵ</div>
      <ul>
                <li class="current">1</li>
                <li>2</li>
                <li>3</li>
                <li>4</li>
                <li>5</li>
          </ul></div>
      </div>
    </div>
      
      
           <div class="fl w350 hide recommend mar_l20">
             <div class="first">
               <h1> <a href="#" target="_blank"><img class="mar_r10" src="Themes/images/label_recommend.jpg" alt="�����ȵ�" width="86" height="18" />�żҿڸ���4S�꿪ҵ����</a></h1>
               <p class="gray">�żҿڸ���4S�żҿڸ���4S�żҿڸ���4S�żҿڸ���4S�żҿڸ���4S�żҿڸ���4S�żҿڸ���4S ...<a href="http://www.babailin.com"
                                    target="_blank">&gt;&gt;�鿴��ϸ</a></p>
             </div>
             <div class="third">
               <ul class="dotli01">
                 <li><a href="#" target="_blank">[����]�°����μǾ��������ԭ�����鿿���飿</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                 <li><a href="#" target="_blank">[����]�°����μǾ�������ԭ���ԭ����</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                 <li><a href="#" target="_blank">[����]�°����μǾ����ֳ�ԭԭ�����ԭ����</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                 <li><a href="#" target="_blank">[����]�°����μǾ�������ԭ���ԭ����</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                 <li><a href="#" target="_blank">[����]�°����μǾ��������ԭ��ԭ��ԭ����</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                 <li><a href="#" target="_blank">[����]�°����μǾ�������ֳ�ԭ��ԭ��ԭԭ����</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                 <li><a href="#" target="_blank">[����]�°����μǾ�������ԭ��ԭ���ԭ����</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
               </ul>
               <div class="clear"> </div>
             </div>
        </div>
        
        <div class="fl w240 hide recommend mar_l10">
          <div class="section mar_t6">
            <div class="ptitle02">
              <ul class="tlboxtitle fl">
                <li class="current"> <a href="#" title="�Ƽ�����">�����Ż�</a></li>
                <li>��������<a href="#" title="��������"></a></li>
              </ul>
              </div>
            <div class=" pad_t5 pad_l10 pad_b10">
            <ul class="dotli01">
                 <li><a href="#" target="_blank">[����]�żҿ�����������</a></li>
                 <li><a href="#" target="_blank">[����]�żҿ�����������</a></li>
                 <li><a href="#" target="_blank">[����]�żҿ�����������</a></li>
                 <li><a href="#" target="_blank">[����]�żҿ�����������</a></li>
                 <li><a href="#" target="_blank">[����]�żҿ�����������</a></li>
                 <li><a href="#" target="_blank">[����]�żҿ�����������</a></li>
                 <li><a href="#" target="_blank">[����]�żҿ�����������</a></li>
                 <li><a href="#" target="_blank">[����]�żҿ�����������</a></li>
                 <li><a href="#" target="_blank">[����]�żҿ�����������</a></li>
               </ul>
              <div class="clear"></div>
            </div>
          </div>
        </div>
        
        <div class="clear"></div>
      </div>
      
      <div class="part02 mar_t6">
            <div class="purchase-title"><a href="#">�żҿڳ��ж�̬</a> | <a href="#">�����ĵ�</a> | <a href="#">רҵ����</a> | <a href="#">��������</a> | <a href="#">��������</a></div>
            
            <div class="fl w348 mar_t6">
              <div class="section_purchase">
                <div class="ptitle">
                  <span class="more"><a href="#">����</a> >></span>
                  <div class="icon">��������-���ó���</div>
                  
                </div>
                <div class="pad_10">
                  <div class="index_tips">
                    <div class="pic"> <a href="#" target="_blank"> <img src="Themes/images/pic-car.jpg"  width="136" height="86" alt="" /><strong>ͨ�����õĹ�ͨ</strong></a><br />
                          <span class="gray">����������������֮����ȫ���Żݱ���������������֮����ȫ���Ż�1000Ԫ��</span><a href="http://www.babailin.com"
                                    target="_blank">&gt;&gt;�鿴��ϸ</a></div>
                    <ul class="dotli01">
                      <li><a href="#" target="_blank">���ֽ��ƻ�Ա�����ܽ���</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                      <li><a href="#" target="_blank">�ͻ�ѡȡ�б꣬����ʧЧ�����⣡</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                      <li><a href="#" target="_blank">�����в߻��Ŷӡ����ƻ�Ա����</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                      <li><a href="#" target="_blank">�����߳�ֵ�İ�ȫ��ʶ��</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                      <li><a href="#" target="_blank">�����ƻ�Ա����Щ���˽��˶��٣�</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="section_purchase mar_t6">
                <div class="ptitle">
                  <span class="more"><a href="#">����</a> >></span>
                  <div class="icon">10�����ϳ��ͽ���</div>
                  
                </div>
                <div class="pad_10">
                    <ul class="dotli01">
                      <li><a href="#" target="_blank">���ֽ��ƻ�Ա�����ܽ���</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                      <li><a href="#" target="_blank">�ͻ�ѡȡ�б꣬����ʧЧ�����⣡</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                      <li><a href="#" target="_blank">�����в߻��Ŷӡ����ƻ�Ա����</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                      <li><a href="#" target="_blank">�����߳�ֵ�İ�ȫ��ʶ��</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                      <li><a href="#" target="_blank">�����ƻ�Ա����Щ���˽��˶��٣�</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                    </ul>
                </div>
              </div>
            </div>
            
            <div class="fl w350 hide recommend mar_l10 mar_t6 bls_gray pad_l10">
              <div class="section_purchase">
                <div class="ptitle"> <span class="more"><a href="#">����</a> &gt;&gt;</span>
                    <div class="icon">���ѹ�������-���ó���</div>
                </div>
                <div class="pad_10">
                  <div class="index_tips">
                    <div class="pic"> <a href="#" target="_blank"> <img src="Themes/images/pic-car.jpg"  width="136" height="86" alt="" /><strong>ͨ�����õĹ�ͨ</strong></a><br />
                        <span class="gray">����������������֮����ȫ���Żݱ���������������֮����ȫ���Ż�1000Ԫ��</span><a href="http://www.babailin.com"
                                    target="_blank">&gt;&gt;�鿴��ϸ</a></div>
                    <ul class="dotli01">
                      <li><a href="#" target="_blank">���ֽ��ƻ�Ա�����ܽ���</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                      <li><a href="#" target="_blank">�ͻ�ѡȡ�б꣬����ʧЧ�����⣡</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                      <li><a href="#" target="_blank">�����в߻��Ŷӡ����ƻ�Ա����</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                      <li><a href="#" target="_blank">�����߳�ֵ�İ�ȫ��ʶ��</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                      <li><a href="#" target="_blank">�����ƻ�Ա����Щ���˽��˶��٣�</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="section_purchase mar_t6">
                <div class="ptitle"> <span class="more"><a href="#">����</a> &gt;&gt;</span>
                    <div class="icon">���ѹ�������-�м�����</div>
                </div>
                <div class="pad_10">
                  <ul class="dotli01">
                    <li><a href="#" target="_blank">���ֽ��ƻ�Ա�����ܽ���</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                    <li><a href="#" target="_blank">�ͻ�ѡȡ�б꣬����ʧЧ�����⣡</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                    <li><a href="#" target="_blank">�����в߻��Ŷӡ����ƻ�Ա����</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                    <li><a href="#" target="_blank">�����߳�ֵ�İ�ȫ��ʶ��</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                    <li><a href="#" target="_blank">�����ƻ�Ա����Щ���˽��˶��٣�</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                  </ul>
                </div>
              </div>
            </div>
            
            <div class="fl w240 hide mar_t6 mar_l10 bg04">
              <div class="section_purchase">
                <div class="ptitle"> <span class="more"><a href="#">����</a> &gt;&gt;</span>
                    <div class="icon">��������</div>
                </div>
                <div class=" pad_t10 pad_l5">
                  <div class="cardlist">
                    <dl>
                      <dt><a href="#"><img src="Themes/images/pic-card02.jpg" width="81" height="60" alt="" /></a></dt>
                      <dd><b><a href="#">�żҿ����������Ƽ�1</a></b>
                          <p>���ߵ绰0313-8888888</p>
                          <p>[<a href="#">��ϸ</a>]</p>
                      </dd>
                    </dl>
                    <dl>
                      <dt><a href="#"><img src="Themes/images/pic-card02.jpg" width="81" height="60" alt="" /></a></dt>
                      <dd><b><a href="#">�żҿ����������Ƽ�1</a></b>
                          <p>���ߵ绰0313-8888888</p>
                        <p>[<a href="#">��ϸ</a>]</p>
                      </dd>
                    </dl>
                    <dl>
                      <dt><a href="#"><img src="Themes/images/pic-card02.jpg" width="81" height="60" alt="" /></a></dt>
                      <dd><b><a href="#">�żҿ����������Ƽ�1</a></b>
                          <p>���ߵ绰0313-8888888</p>
                        <p>[<a href="#">��ϸ</a>]</p>
                      </dd>
                    </dl>
                    <div class="clear"></div>
                  </div>
                </div>
              </div>
              <div class="section_purchase mar_t6">
                <div class="ptitle"> <span class="more"><a href="#">����</a> &gt;&gt;</span>
                    <div class="icon">����֪ʶ</div>
                </div>
                <div class="pad_10">
                  <ul class="dotli01">
                    <li><a href="#" target="_blank">���ֽ��ƻ�Ա�����ܽ���</a></li>
                    <li><a href="#" target="_blank">�ͻ�ѡȡ�б꣬����ʧЧ�����⣡</a></li>
                    <li><a href="#" target="_blank">�����в߻��Ŷӡ����ƻ�Ա����</a></li>
                    <li><a href="#" target="_blank">�����߳�ֵ�İ�ȫ��ʶ��</a></li>
                    <li><a href="#" target="_blank">�����ƻ�Ա����Щ���˽��˶��٣�</a></li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="clear"></div>
  </div>


      <div class="part03 mar_t6">
        <div class="fix-title"><a href="#">�żҿ�����4S��</a> | <a href="#">�żҿڳ�������</a> | <a href="#">ע�����</a></div>
        <div class="pad_5">
          <div class="shop_other">
            <ul>
              <li>
                <div class="w125 fl"> <a href="#" target="_blank"> <img src="Themes/images/pic-card04.jpg" width="78" height="57" class="b_gray" /></a></div>
                <div class="fl w160 hide pad_l10">
                  <p> <a href="#" target="_blank">�żҿ�����4S��</a></p>
                  <p class="mar_t5">0313-8882222</p>
                </div>
                <div class="clear"> </div>
              </li>
              </ul>
            <ul>
              <li>
                <div class="w125 fl"> <a href="#" target="_blank"> <img src="Themes/images/pic-card04.jpg" width="78" height="57" class="b_gray" /></a></div>
                <div class="fl w160 hide pad_l10">
                  <p> <a href="#" target="_blank">�żҿ�����4S��</a></p>
                  <p class="mar_t5">0313-8882222</p>
                </div>
                <div class="clear"> </div>
              </li>
            </ul>
            <ul>
              <li>
                <div class="w125 fl"> <a href="#" target="_blank"> <img src="Themes/images/pic-card04.jpg" width="78" height="57" class="b_gray" /></a></div>
                <div class="fl w160 hide pad_l10">
                  <p> <a href="#" target="_blank">�żҿ�����4S��</a></p>
                  <p class="mar_t5">0313-8882222</p>
                </div>
                <div class="clear"> </div>
              </li>
              <li>
                <div class="w125 fl"> <a href="#" target="_blank"> <img src="Themes/images/pic-card04.jpg" width="78" height="57" class="b_gray" /></a></div>
                <div class="fl w160 hide pad_l10">
                  <p> <a href="#" target="_blank">�żҿ�����4S��</a></p>
                  <p class="mar_t5">0313-8882222</p>
                </div>
                <div class="clear"> </div>
              </li>
              <li>
                <div class="w125 fl"> <a href="#" target="_blank"> <img src="Themes/images/pic-card04.jpg" width="78" height="57" class="b_gray" /></a></div>
                <div class="fl w160 hide pad_l10">
                  <p> <a href="#" target="_blank">�żҿ�����4S��</a></p>
                  <p class="mar_t5">0313-8882222</p>
                </div>
                <div class="clear"> </div>
              </li>
              <li>
                <div class="w125 fl"> <a href="#" target="_blank"> <img src="Themes/images/pic-card04.jpg" width="78" height="57" class="b_gray" /></a></div>
                <div class="fl w160 hide pad_l10">
                  <p> <a href="#" target="_blank">�żҿ�����4S��</a></p>
                  <p class="mar_t5">0313-8882222</p>
                </div>
                <div class="clear"> </div>
              </li>
              <li>
                <div class="w125 fl"> <a href="#" target="_blank"> <img src="Themes/images/pic-card04.jpg" width="78" height="57" class="b_gray" /></a></div>
                <div class="fl w160 hide pad_l10">
                  <p> <a href="#" target="_blank">�żҿ�����4S��</a></p>
                  <p class="mar_t5">0313-8882222</p>
                </div>
                <div class="clear"> </div>
              </li>
              <li>
                <div class="w125 fl"> <a href="#" target="_blank"> <img src="Themes/images/pic-card04.jpg" width="78" height="57" class="b_gray" /></a></div>
                <div class="fl w160 hide pad_l10">
                  <p> <a href="#" target="_blank">�żҿ�����4S��</a></p>
                  <p class="mar_t5">0313-8882222</p>
                </div>
                <div class="clear"> </div>
              </li>
              <li>
                <div class="w125 fl"> <a href="#" target="_blank"> <img src="Themes/images/pic-card04.jpg" width="78" height="57" class="b_gray" /></a></div>
                <div class="fl w160 hide pad_l10">
                  <p> <a href="#" target="_blank">�żҿ�����4S��</a></p>
                  <p class="mar_t5">0313-8882222</p>
                </div>
                <div class="clear"> </div>
              </li><li>
                <div class="w125 fl"> <a href="#" target="_blank"> <img src="Themes/images/pic-card04.jpg" width="78" height="57" class="b_gray" /></a></div>
                <div class="fl w160 hide pad_l10">
                  <p> <a href="#" target="_blank">�żҿ�����4S��</a></p>
                  <p class="mar_t5">0313-8882222</p>
                </div>
                <div class="clear"> </div>
              </li>
            </ul>
            <div class="clear"></div>
          </div>
        </div>
        <div class="clear"></div>
      </div>
  <div class="part04 mar_t6">
    <div class="beauty-title"><a href="#">ά�ޱ���</a> | <a href="#">��������</a> | <a href="#">����װ��</a></div>
        <div class="fl w348 mar_t6">
          <div class="section_purchase">
            <div class="ptitle"> <span class="more"><a href="#">����</a> &gt;&gt;</span>
              <div class="icon">ά�ޱ���</div>
            </div>
            <div class="pad_10">
              <div class="index_tips">
                <div class="pic"> <a href="#" target="_blank"> <img src="Themes/images/pic-car.jpg"  width="136" height="86" alt="" /><strong>ͨ�����õĹ�ͨ</strong></a><br />
                    <span class="gray">����������������֮����ȫ���Żݱ���������������֮����ȫ���Ż�1000Ԫ��</span><a href="http://www.babailin.com"
                                    target="_blank">&gt;&gt;�鿴��ϸ</a></div>
                <ul class="dotli01">
                  <li><a href="#" target="_blank">���ֽ��ƻ�Ա�����ܽ���</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                  <li><a href="#" target="_blank">�ͻ�ѡȡ�б꣬����ʧЧ�����⣡</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                  <li><a href="#" target="_blank">�����в߻��Ŷӡ����ƻ�Ա����</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                  <li><a href="#" target="_blank">�����߳�ֵ�İ�ȫ��ʶ��</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                  <li><a href="#" target="_blank">�����ƻ�Ա����Щ���˽��˶��٣�</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                  <li><a href="#" target="_blank">�����в߻��Ŷӡ����ƻ�Ա����</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                  <li><a href="#" target="_blank">�����߳�ֵ�İ�ȫ��ʶ��</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="fl w350 hide recommend mar_l10 mar_t6 bls_gray pad_l10">
          <div class="section_purchase">
            <div class="ptitle"> <span class="more"><a href="#">����</a> &gt;&gt;</span>
              <div class="icon">��������</div>
            </div>
            <div class="pad_10">
              <div class="index_tips">
                <div class="pic"> <a href="#" target="_blank"> <img src="Themes/images/pic-car.jpg"  width="136" height="86" alt="" /><strong>ͨ�����õĹ�ͨ</strong></a><br />
                    <span class="gray">����������������֮����ȫ���Żݱ���������������֮����ȫ���Ż�1000Ԫ��</span><a href="http://www.babailin.com"
                                    target="_blank">&gt;&gt;�鿴��ϸ</a></div>
                <ul class="dotli01">
                  <li><a href="#" target="_blank">���ֽ��ƻ�Ա�����ܽ���</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                  <li><a href="#" target="_blank">�ͻ�ѡȡ�б꣬����ʧЧ�����⣡</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                  <li><a href="#" target="_blank">�����в߻��Ŷӡ����ƻ�Ա����</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                  <li><a href="#" target="_blank">�����߳�ֵ�İ�ȫ��ʶ��</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                  <li><a href="#" target="_blank">�����ƻ�Ա����Щ���˽��˶��٣�</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                  <li><a href="#" target="_blank">�����в߻��Ŷӡ����ƻ�Ա����</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                  <li><a href="#" target="_blank">�����߳�ֵ�İ�ȫ��ʶ��</a><span class="ft10 gray mar_l10">2010-08-08</span></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="fl w240 hide mar_t6 mar_l10 bg04">
          <div class="section_purchase">
            <div class="ptitle"> <span class="more"><a href="#">����</a> &gt;&gt;</span>
              <div class="icon">����װ��</div>
            </div>
            <div class=" pad_t10 pad_l5">
              <div class="cardlist">
                <dl>
                  <dt><a href="#"><img src="Themes/images/pic-card03.jpg" width="94" height="69" alt="" /></a></dt>
                  <dd><b><a href="#">�żҿ����������Ƽ�1</a></b>
                      <p>���ߵ绰0313-8888888</p>
                    <p>[<a href="#">��ϸ</a>]</p>
                  </dd>
                </dl>
                <dl>
                  <dt><a href="#"><img src="Themes/images/pic-card03.jpg" width="94" height="69" alt="" /></a></dt>
                  <dd><b><a href="#">�żҿ����������Ƽ�1</a></b>
                      <p>���ߵ绰0313-8888888</p>
                    <p>[<a href="#">��ϸ</a>]</p>
                  </dd>
                </dl>
                <div class="clear"></div>
              </div>
            </div>
          </div>
          <div class="section_purchase mar_t6">
            <div class="ptitle"> <span class="more"><a href="#">����</a> &gt;&gt;</span>
              <div class="icon">����װ��ָ��</div>
            </div>
            <div class="pad_10">
              <ul class="dotli01">
                <li><a href="#" target="_blank">���ֽ��ƻ�Ա�����ܽ���</a></li>
                <li><a href="#" target="_blank">�ͻ�ѡȡ�б꣬����ʧЧ�����⣡</a></li>
                <li><a href="#" target="_blank">�����в߻��Ŷӡ����ƻ�Ա����</a></li>
              </ul>
            </div>
          </div>
        </div>
        <div class="clear"></div>
  </div>
  <div class="clear"></div>
</div>
<!-- end���Ŀ�� -->
 
<jsp:include page="bottom.jsp"></jsp:include>

</body>
</html>
