#該程式未解開Section, 採用最新樣板產出!
#該程式非freestyle程式!
{<section id="afap230.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0041(2014-12-16 22:05:08), PR版次:0041(2018-01-04 11:55:02)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000377
#+ Filename...: afap230
#+ Description: 固定資產自動攤提作業
#+ Creator....: 02291(2014-03-04 15:16:45)
#+ Modifier...: 02291 -SD/PR- 09773
 
{</section>}
 
{<section id="afap230.global" type="s" >}
#應用 p01 樣板自動產生(Version:20)
#add-point:填寫註解說明 name="global.memo" name="global.memo"
#150731-00004#1  2015/08/07  BY yangtt   錯誤信息匯總報錯，將舊的報錯方式(cl_errmdg)改成新的報錯方式
#150812-00010#3  2015/08/28  BY apo      本幣欄位取位位數應以本幣設定
#151203-00004#1  2015/12/03  BY yangttt  afa-00184报错,主要类型,部门编号没值就前移了,客户反映这样报错讯息不是特别明确,值调整为用加号隔开即：SN03 +  +1007B
#160329-00024#1  2016/04/13  BY 07673    当财产编号为工作量法的时候且是多部门分摊，应当不用去判断afai060是否有维护
#160318-00025#5  2016/04/14  BY 07675    將重複內容的錯誤訊息置換為公用錯誤訊息(r.v）
#160429-00002#1  2016/05/06  BY 02114    IF g_type = ‘2’ THEN  IF g_faaj[l_cnt].faaj005> 0 后面增加g_faaj[l_cnt].faaj011 MATCHES '[Yy]'这个条件（折毕再提的条件）
#160530-00036#1  2016/05/30  BY albireo  折畢再提公式調整
#160125-00005#7  2016/08/09  BY 01531    查詢時加上帳套人員權限條件過濾
#160426-00014#6  2016/08/12  BY 01531    增加依标签部门分摊的逻辑
#160426-00014#28 2016/08/22  BY 07900    QBE查询中：卡片编号、财产编号、附号，增加新开窗换用，新开窗在现在所用开窗的基础上增加关联haaj档，条件增加：faajld=当前输入的账套 AND faaj048(资产分类)=2:列账；
#160905-00007#1  2016-09-05  BY 08734    ent调整
#160426-00014#39 2016/09/18  BY 02114    faaf001不用限定当年年度，即取afai060取最近的一笔资料，如果是跨年，直接往前面一年查找即可。
#161024-00008#1  2016/10/24  By Hans     AFA組織類型與職能開窗清單調整。
#161104-00048#2  2016/11/22  By 01531    还原折旧后，更新资产状态改为更新faaj038.
#161104-00048#3  2016/11/22  By 01531    #161104-00048#2修改部分调整：faam026记录之前faaj038的资产状态
#161123-00011#2  2016/11/24  By 01531    還原或重新執行時, 檢核是否有異動資料時，排除作廢單據的資料。
#161111-00049#14 2016/11/25  By 07900    1.【卡片編號、財產編號、附號：基礎資料類查詢，增加USER據點權限與資產設備的【歸屬法人】，作交互限定可視範圍。
#                                        2.【主要類型】：採集團設置,因應誼山現況，增加依法人限定。
#                                        3.【次要類型】：採集團設置,因應誼山現況，增加參考主類型處理
#161215-00044#1   2016/12/15 by 02481    标准程式定义采用宣告模式,弃用.*写
#161214-00063#1   2016/12/15 By 01531    afai100 录入次类型不是必输,取消固资折旧与折旧还原 次类型的限定
#170207-00036#1   2017/02/07 By 02114    sql里还有*号的写法,但是数组已经改成宣告模式,导致faah表新增栏位后,FOREACH栏位对应不上
#170323-00047#1   2017/03/28 By 07900    faah015 資產狀態要跟主帳套faaj038 狀態相同
#170417-00045#1   2017/05/02 By 07900    当前月折旧时，检核上月是否有折旧
#170601-00058#1   2017/06/05 By 05795    搬客户家调整折旧尾差问题 （#20170602                    By 01727    调整折旧尾差问题.）
#170630-00014#1   2017/07/07 By 05795    【未折减值】=【预留残值】的卡片不参与折旧计提
#170802-00052#1   2017/08/03 By 08729     固资折旧作业会将未折减额折成负数，如果金额为11.11折旧2个月，则第一个月折旧5.56，第二个月折旧 5.56，会导致未折减额为负。
#170712-00043#1   2017/08/04 By 07900     变动比率分摊时，没有按人数分摊的逻辑，补上 
#170828-00020#1   2017/08/29 By 08729     计提8月份折旧，点执行没反应，azzi800中已经设置相应权限。
#170425-00037#7   2017/09/07 By wanghaoz  ooea_t整批调整成ooef_t
#170919-00013#1   2017/09/28 By 09505     170630-00014此单处理了针对【未折减值】=【预留残值】的卡片仍参与折旧计提的问题，
#                                         但是把折毕再提的sql也加上了这个条件，导致折毕再提的资料抓不出来
#170619-00054#1   2017/12/14 By 07900     afat509同一會計期, 可多次立折舊帳務
#171227-00035#1   2017/12/27 By 08525     检核当月是否已折旧的条件，需加上账套编码
#170619-00054#2   2017/12/28 By 07900     afat509同一會計期, 可多次立折舊帳務,afat509 里Y,不报错，不显示
#171227-00042#1   2018/01/04 By 09773     afap230/afap240执行完成后,未还原查询状态
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
#(ver:20) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:20) --- end ---
 
IMPORT os
IMPORT util
IMPORT FGL lib_cl_schedule
#add-point:增加匯入項目 name="global.import"
#20150825 --回追-- 去除變數空格，增加資料在afai050的搜索條件
#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
GLOBALS "../../cfg/top_schedule.inc"
GLOBALS
   DEFINE gwin_curr2  ui.Window
   DEFINE gfrm_curr2  ui.Form
   DEFINE gi_hiden_asign       LIKE type_t.num5
   DEFINE gi_hiden_exec        LIKE type_t.num5
   DEFINE gi_hiden_spec        LIKE type_t.num5
   DEFINE gi_hiden_exec_end    LIKE type_t.num5
   DEFINE g_chk_jobid          LIKE type_t.num5
END GLOBALS
 
PRIVATE TYPE type_parameter RECORD
   #add-point:自定背景執行須傳遞的參數(Module Variable) name="global.parameter"
               
   #end add-point
        wc               STRING
                     END RECORD
 
DEFINE g_sql             STRING        #組 sql 用
DEFINE g_forupd_sql      STRING        #SELECT ... FOR UPDATE  SQL
DEFINE g_error_show      LIKE type_t.num5
DEFINE g_jobid           STRING
DEFINE g_wc              STRING
 
PRIVATE TYPE type_master RECORD
       faamsite LIKE faam_t.faamsite, 
   faamsite_desc LIKE type_t.chr80, 
   glaald LIKE glaa_t.glaald, 
   glaald_desc LIKE type_t.chr80, 
   glaacomp LIKE glaa_t.glaacomp, 
   glaacomp_desc LIKE type_t.chr80, 
   glaa001 LIKE glaa_t.glaa001, 
   glaa001_desc LIKE type_t.chr80, 
   year LIKE type_t.chr500, 
   month LIKE type_t.chr500, 
   faah001 LIKE type_t.chr500, 
   faah007 LIKE type_t.chr500, 
   faah003 LIKE type_t.chr500, 
   faah005 LIKE type_t.chr500, 
   faah004 LIKE type_t.chr500, 
   faah008 LIKE type_t.chr500, 
   faah006 LIKE type_t.chr500, 
   faah042 LIKE type_t.chr500,
       wc               STRING
       END RECORD
 
#模組變數(Module Variables)
DEFINE g_master type_master
 
#add-point:自定義模組變數(Module Variable) name="global.variable"
#單頭 type 宣告
 TYPE type_g_glaa_m RECORD
   faamsite      LIKE faam_t.faamsite,
   faamsite_desc LIKE type_t.chr80,
   glaald LIKE glaa_t.glaald,
   glaald_desc LIKE type_t.chr80,
   glaacomp LIKE glaa_t.glaacomp,
   glaacomp_desc LIKE type_t.chr80,
   glaa001 LIKE glaa_t.glaa001,
   glaa001_desc LIKE type_t.chr80,
   year LIKE type_t.num5,
   month LIKE type_t.num5
END RECORD
DEFINE g_glaa_m     type_g_glaa_m
DEFINE g_glaa_m_t   type_g_glaa_m
     
#單身 type 宣告
 TYPE type_g_faah_d RECORD
   check LIKE type_t.chr1, 
   faah003 LIKE faah_t.faah003,
   faah004 LIKE faah_t.faah004,
   faah001 LIKE faah_t.faah001, #20141212 add by chening
   faah015 LIKE faah_t.faah015, #20141212 add by chening
   faah006 LIKE faah_t.faah006,
   faah006_desc LIKE type_t.chr80,
   faah007 LIKE faah_t.faah007,
   faah007_desc LIKE type_t.chr80,
   faah005 LIKE faah_t.faah005, 
   faah008 LIKE faah_t.faah008,
   faah008_desc LIKE type_t.chr80,
   faah042 LIKE faah_t.faah042,
   faaj005 LIKE faaj_t.faaj005,
   faaj016 LIKE faaj_t.faaj016,
   faaj017 LIKE faaj_t.faaj017,
   faaj018 LIKE faaj_t.faaj018,
   faaj021 LIKE faaj_t.faaj021
END RECORD

DEFINE g_faah1_d RECORD
   check LIKE type_t.chr1, 
   faah003 LIKE faah_t.faah003,
   faah004 LIKE faah_t.faah004,
   faah006 LIKE faah_t.faah006,
   faah006_desc LIKE type_t.chr80,
   faah007 LIKE faah_t.faah007,
   faah007_desc LIKE type_t.chr80,
   faah005 LIKE faah_t.faah005, 
   faah008 LIKE faah_t.faah008,
   faah008_desc LIKE type_t.chr80,
   faah042 LIKE faah_t.faah042,
   faaj005 LIKE faaj_t.faaj005,
   faaj017 LIKE faaj_t.faaj017,
   faaj018 LIKE faaj_t.faaj018,
   faaj019 LIKE faaj_t.faaj019,
   faaj021 LIKE faaj_t.faaj021
END RECORD
DEFINE g_faah_d              DYNAMIC ARRAY OF type_g_faah_d 
DEFINE g_wc2                 STRING
DEFINE g_cnt                 LIKE type_t.num10
DEFINE l_ac                  LIKE type_t.num5
DEFINE l_ac1                 LIKE type_t.num5
DEFINE g_rec_b               LIKE type_t.num5              #單身筆數
DEFINE g_rec_b1              LIKE type_t.num5              #單身筆數
DEFINE g_detail_b            LIKE type_t.num5
DEFINE g_ref_fields         DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields         DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_detail_idx         LIKE type_t.num5
DEFINE g_detail_idx1        LIKE type_t.num5
DEFINE g_current_page       LIKE type_t.num5              #目前所在頁數
#161215-00044#1---modify----begin-----------------
#DEFINE g_faam               RECORD LIKE faam_t.*
#DEFINE g_faam1              RECORD LIKE faam_t.*
#DEFINE g_faah               DYNAMIC ARRAY OF RECORD LIKE faah_t.*,
#       g_faaj               DYNAMIC ARRAY OF RECORD LIKE faaj_t.*,
#       g_faal               DYNAMIC ARRAY OF RECORD LIKE faal_t.*
#DEFINE g_faah1              RECORD LIKE faah_t.*,
#       g_faaj1              RECORD LIKE faaj_t.*
#DEFINE g_faag               RECORD LIKE faag_t.*
DEFINE g_faam RECORD  #固定資產折舊明細資料檔
       faament LIKE faam_t.faament, #企業編號
       faamsite LIKE faam_t.faamsite, #資產中心
       faamld LIKE faam_t.faamld, #帳套編碼
       faamcomp LIKE faam_t.faamcomp, #法人
       faam000 LIKE faam_t.faam000, #卡片編號
       faam001 LIKE faam_t.faam001, #財產編號
       faam002 LIKE faam_t.faam002, #附號
       faam003 LIKE faam_t.faam003, #折舊方式
       faam004 LIKE faam_t.faam004, #折舊年度
       faam005 LIKE faam_t.faam005, #折舊期別
       faam006 LIKE faam_t.faam006, #來源
       faam007 LIKE faam_t.faam007, #分攤方式
       faam008 LIKE faam_t.faam008, #分攤類別
       faam009 LIKE faam_t.faam009, #部門
       faam010 LIKE faam_t.faam010, #被分攤部門
       faam011 LIKE faam_t.faam011, #幣別
       faam012 LIKE faam_t.faam012, #匯率
       faam013 LIKE faam_t.faam013, #折舊金額
       faam014 LIKE faam_t.faam014, #成本
       faam015 LIKE faam_t.faam015, #累折
       faam016 LIKE faam_t.faam016, #本年累折
       faam017 LIKE faam_t.faam017, #分攤比率
       faam018 LIKE faam_t.faam018, #已提列減值準備
       faam019 LIKE faam_t.faam019, #年折舊額
       faam020 LIKE faam_t.faam020, #資產科目
       faam021 LIKE faam_t.faam021, #累折科目
       faam022 LIKE faam_t.faam022, #折舊科目
       faam023 LIKE faam_t.faam023, #減值準備科目
       faam024 LIKE faam_t.faam024, #傳票單號
       faam025 LIKE faam_t.faam025, #傳票單號項次
       faam026 LIKE faam_t.faam026, #資產狀態
       faam027 LIKE faam_t.faam027, #營運據點
       faam028 LIKE faam_t.faam028, #部門
       faam029 LIKE faam_t.faam029, #利潤/成本中心
       faam030 LIKE faam_t.faam030, #區域
       faam031 LIKE faam_t.faam031, #交易客商
       faam032 LIKE faam_t.faam032, #帳款客商
       faam033 LIKE faam_t.faam033, #客群
       faam034 LIKE faam_t.faam034, #人員
       faam035 LIKE faam_t.faam035, #專案編號
       faam036 LIKE faam_t.faam036, #WBS
       faam037 LIKE faam_t.faam037, #經營方式
       faam038 LIKE faam_t.faam038, #通路
       faam039 LIKE faam_t.faam039, #品牌
       faam040 LIKE faam_t.faam040, #自由核算項一
       faam041 LIKE faam_t.faam041, #自由核算項二
       faam042 LIKE faam_t.faam042, #自由核算項三
       faam043 LIKE faam_t.faam043, #自由核算項四
       faam044 LIKE faam_t.faam044, #自由核算項五
       faam045 LIKE faam_t.faam045, #自由核算項六
       faam046 LIKE faam_t.faam046, #自由核算項七
       faam047 LIKE faam_t.faam047, #自由核算項八
       faam048 LIKE faam_t.faam048, #自由核算項九
       faam049 LIKE faam_t.faam049, #自由核算項十
       faam050 LIKE faam_t.faam050, #摘要
       faam101 LIKE faam_t.faam101, #本位幣二幣別
       faam102 LIKE faam_t.faam102, #本位幣二匯率
       faam103 LIKE faam_t.faam103, #本位幣二成本
       faam104 LIKE faam_t.faam104, #本位幣二折舊金額
       faam105 LIKE faam_t.faam105, #本位幣二累折
       faam106 LIKE faam_t.faam106, #本位幣二本年累折
       faam107 LIKE faam_t.faam107, #本位幣二年折舊額
       faam108 LIKE faam_t.faam108, #本位幣二已提列減值準備
       faam151 LIKE faam_t.faam151, #本位幣三幣別
       faam152 LIKE faam_t.faam152, #本位幣三匯率
       faam153 LIKE faam_t.faam153, #本位幣三成本
       faam154 LIKE faam_t.faam154, #本位幣三折舊金額
       faam155 LIKE faam_t.faam155, #本位幣三累折
       faam156 LIKE faam_t.faam156, #本位幣三本年累折
       faam157 LIKE faam_t.faam157, #本位幣三年折舊額
       faam158 LIKE faam_t.faam158, #本位幣三已提列減值準備
       faamud001 LIKE faam_t.faamud001, #自定義欄位(文字)001
       faamud002 LIKE faam_t.faamud002, #自定義欄位(文字)002
       faamud003 LIKE faam_t.faamud003, #自定義欄位(文字)003
       faamud004 LIKE faam_t.faamud004, #自定義欄位(文字)004
       faamud005 LIKE faam_t.faamud005, #自定義欄位(文字)005
       faamud006 LIKE faam_t.faamud006, #自定義欄位(文字)006
       faamud007 LIKE faam_t.faamud007, #自定義欄位(文字)007
       faamud008 LIKE faam_t.faamud008, #自定義欄位(文字)008
       faamud009 LIKE faam_t.faamud009, #自定義欄位(文字)009
       faamud010 LIKE faam_t.faamud010, #自定義欄位(文字)010
       faamud011 LIKE faam_t.faamud011, #自定義欄位(數字)011
       faamud012 LIKE faam_t.faamud012, #自定義欄位(數字)012
       faamud013 LIKE faam_t.faamud013, #自定義欄位(數字)013
       faamud014 LIKE faam_t.faamud014, #自定義欄位(數字)014
       faamud015 LIKE faam_t.faamud015, #自定義欄位(數字)015
       faamud016 LIKE faam_t.faamud016, #自定義欄位(數字)016
       faamud017 LIKE faam_t.faamud017, #自定義欄位(數字)017
       faamud018 LIKE faam_t.faamud018, #自定義欄位(數字)018
       faamud019 LIKE faam_t.faamud019, #自定義欄位(數字)019
       faamud020 LIKE faam_t.faamud020, #自定義欄位(數字)020
       faamud021 LIKE faam_t.faamud021, #自定義欄位(日期時間)021
       faamud022 LIKE faam_t.faamud022, #自定義欄位(日期時間)022
       faamud023 LIKE faam_t.faamud023, #自定義欄位(日期時間)023
       faamud024 LIKE faam_t.faamud024, #自定義欄位(日期時間)024
       faamud025 LIKE faam_t.faamud025, #自定義欄位(日期時間)025
       faamud026 LIKE faam_t.faamud026, #自定義欄位(日期時間)026
       faamud027 LIKE faam_t.faamud027, #自定義欄位(日期時間)027
       faamud028 LIKE faam_t.faamud028, #自定義欄位(日期時間)028
       faamud029 LIKE faam_t.faamud029, #自定義欄位(日期時間)029
       faamud030 LIKE faam_t.faamud030  #自定義欄位(日期時間)030
       END RECORD
DEFINE g_faam1 RECORD  #固定資產折舊明細資料檔
       faament LIKE faam_t.faament, #企業編號
       faamsite LIKE faam_t.faamsite, #資產中心
       faamld LIKE faam_t.faamld, #帳套編碼
       faamcomp LIKE faam_t.faamcomp, #法人
       faam000 LIKE faam_t.faam000, #卡片編號
       faam001 LIKE faam_t.faam001, #財產編號
       faam002 LIKE faam_t.faam002, #附號
       faam003 LIKE faam_t.faam003, #折舊方式
       faam004 LIKE faam_t.faam004, #折舊年度
       faam005 LIKE faam_t.faam005, #折舊期別
       faam006 LIKE faam_t.faam006, #來源
       faam007 LIKE faam_t.faam007, #分攤方式
       faam008 LIKE faam_t.faam008, #分攤類別
       faam009 LIKE faam_t.faam009, #部門
       faam010 LIKE faam_t.faam010, #被分攤部門
       faam011 LIKE faam_t.faam011, #幣別
       faam012 LIKE faam_t.faam012, #匯率
       faam013 LIKE faam_t.faam013, #折舊金額
       faam014 LIKE faam_t.faam014, #成本
       faam015 LIKE faam_t.faam015, #累折
       faam016 LIKE faam_t.faam016, #本年累折
       faam017 LIKE faam_t.faam017, #分攤比率
       faam018 LIKE faam_t.faam018, #已提列減值準備
       faam019 LIKE faam_t.faam019, #年折舊額
       faam020 LIKE faam_t.faam020, #資產科目
       faam021 LIKE faam_t.faam021, #累折科目
       faam022 LIKE faam_t.faam022, #折舊科目
       faam023 LIKE faam_t.faam023, #減值準備科目
       faam024 LIKE faam_t.faam024, #傳票單號
       faam025 LIKE faam_t.faam025, #傳票單號項次
       faam026 LIKE faam_t.faam026, #資產狀態
       faam027 LIKE faam_t.faam027, #營運據點
       faam028 LIKE faam_t.faam028, #部門
       faam029 LIKE faam_t.faam029, #利潤/成本中心
       faam030 LIKE faam_t.faam030, #區域
       faam031 LIKE faam_t.faam031, #交易客商
       faam032 LIKE faam_t.faam032, #帳款客商
       faam033 LIKE faam_t.faam033, #客群
       faam034 LIKE faam_t.faam034, #人員
       faam035 LIKE faam_t.faam035, #專案編號
       faam036 LIKE faam_t.faam036, #WBS
       faam037 LIKE faam_t.faam037, #經營方式
       faam038 LIKE faam_t.faam038, #通路
       faam039 LIKE faam_t.faam039, #品牌
       faam040 LIKE faam_t.faam040, #自由核算項一
       faam041 LIKE faam_t.faam041, #自由核算項二
       faam042 LIKE faam_t.faam042, #自由核算項三
       faam043 LIKE faam_t.faam043, #自由核算項四
       faam044 LIKE faam_t.faam044, #自由核算項五
       faam045 LIKE faam_t.faam045, #自由核算項六
       faam046 LIKE faam_t.faam046, #自由核算項七
       faam047 LIKE faam_t.faam047, #自由核算項八
       faam048 LIKE faam_t.faam048, #自由核算項九
       faam049 LIKE faam_t.faam049, #自由核算項十
       faam050 LIKE faam_t.faam050, #摘要
       faam101 LIKE faam_t.faam101, #本位幣二幣別
       faam102 LIKE faam_t.faam102, #本位幣二匯率
       faam103 LIKE faam_t.faam103, #本位幣二成本
       faam104 LIKE faam_t.faam104, #本位幣二折舊金額
       faam105 LIKE faam_t.faam105, #本位幣二累折
       faam106 LIKE faam_t.faam106, #本位幣二本年累折
       faam107 LIKE faam_t.faam107, #本位幣二年折舊額
       faam108 LIKE faam_t.faam108, #本位幣二已提列減值準備
       faam151 LIKE faam_t.faam151, #本位幣三幣別
       faam152 LIKE faam_t.faam152, #本位幣三匯率
       faam153 LIKE faam_t.faam153, #本位幣三成本
       faam154 LIKE faam_t.faam154, #本位幣三折舊金額
       faam155 LIKE faam_t.faam155, #本位幣三累折
       faam156 LIKE faam_t.faam156, #本位幣三本年累折
       faam157 LIKE faam_t.faam157, #本位幣三年折舊額
       faam158 LIKE faam_t.faam158, #本位幣三已提列減值準備
       faamud001 LIKE faam_t.faamud001, #自定義欄位(文字)001
       faamud002 LIKE faam_t.faamud002, #自定義欄位(文字)002
       faamud003 LIKE faam_t.faamud003, #自定義欄位(文字)003
       faamud004 LIKE faam_t.faamud004, #自定義欄位(文字)004
       faamud005 LIKE faam_t.faamud005, #自定義欄位(文字)005
       faamud006 LIKE faam_t.faamud006, #自定義欄位(文字)006
       faamud007 LIKE faam_t.faamud007, #自定義欄位(文字)007
       faamud008 LIKE faam_t.faamud008, #自定義欄位(文字)008
       faamud009 LIKE faam_t.faamud009, #自定義欄位(文字)009
       faamud010 LIKE faam_t.faamud010, #自定義欄位(文字)010
       faamud011 LIKE faam_t.faamud011, #自定義欄位(數字)011
       faamud012 LIKE faam_t.faamud012, #自定義欄位(數字)012
       faamud013 LIKE faam_t.faamud013, #自定義欄位(數字)013
       faamud014 LIKE faam_t.faamud014, #自定義欄位(數字)014
       faamud015 LIKE faam_t.faamud015, #自定義欄位(數字)015
       faamud016 LIKE faam_t.faamud016, #自定義欄位(數字)016
       faamud017 LIKE faam_t.faamud017, #自定義欄位(數字)017
       faamud018 LIKE faam_t.faamud018, #自定義欄位(數字)018
       faamud019 LIKE faam_t.faamud019, #自定義欄位(數字)019
       faamud020 LIKE faam_t.faamud020, #自定義欄位(數字)020
       faamud021 LIKE faam_t.faamud021, #自定義欄位(日期時間)021
       faamud022 LIKE faam_t.faamud022, #自定義欄位(日期時間)022
       faamud023 LIKE faam_t.faamud023, #自定義欄位(日期時間)023
       faamud024 LIKE faam_t.faamud024, #自定義欄位(日期時間)024
       faamud025 LIKE faam_t.faamud025, #自定義欄位(日期時間)025
       faamud026 LIKE faam_t.faamud026, #自定義欄位(日期時間)026
       faamud027 LIKE faam_t.faamud027, #自定義欄位(日期時間)027
       faamud028 LIKE faam_t.faamud028, #自定義欄位(日期時間)028
       faamud029 LIKE faam_t.faamud029, #自定義欄位(日期時間)029
       faamud030 LIKE faam_t.faamud030  #自定義欄位(日期時間)030
       END RECORD
DEFINE g_faah DYNAMIC ARRAY OF RECORD  #固定資產基礎資料檔
       faahent LIKE faah_t.faahent, #企業編號
       faah000 LIKE faah_t.faah000, #產生批號
       faah001 LIKE faah_t.faah001, #卡片編號
       faah002 LIKE faah_t.faah002, #型態
       faah003 LIKE faah_t.faah003, #財產編號
       faah004 LIKE faah_t.faah004, #附號
       faah005 LIKE faah_t.faah005, #資產性質
       faah006 LIKE faah_t.faah006, #資產主要類型
       faah007 LIKE faah_t.faah007, #資產次要類型
       faah008 LIKE faah_t.faah008, #資產組
       faah009 LIKE faah_t.faah009, #供應供應商
       faah010 LIKE faah_t.faah010, #製造供應商
       faah011 LIKE faah_t.faah011, #產地
       faah012 LIKE faah_t.faah012, #名稱
       faah013 LIKE faah_t.faah013, #規格型號
       faah014 LIKE faah_t.faah014, #取得日期
       faah015 LIKE faah_t.faah015, #資產狀態
       faah016 LIKE faah_t.faah016, #取得方式
       faah017 LIKE faah_t.faah017, #單位
       faah018 LIKE faah_t.faah018, #數量
       faah019 LIKE faah_t.faah019, #在外數量
       faah020 LIKE faah_t.faah020, #幣別
       faah021 LIKE faah_t.faah021, #原幣單價
       faah022 LIKE faah_t.faah022, #原幣金額
       faah023 LIKE faah_t.faah023, #本幣單價
       faah024 LIKE faah_t.faah024, #本幣金額
       faah025 LIKE faah_t.faah025, #保管人員
       faah026 LIKE faah_t.faah026, #保管部門
       faah027 LIKE faah_t.faah027, #存放位置
       faah028 LIKE faah_t.faah028, #存放組織
       faah029 LIKE faah_t.faah029, #負責人員
       faah030 LIKE faah_t.faah030, #管理組織
       faah031 LIKE faah_t.faah031, #核算組織
       faah032 LIKE faah_t.faah032, #歸屬法人
       faah033 LIKE faah_t.faah033, #直接資本化
       faah034 LIKE faah_t.faah034, #保稅
       faah035 LIKE faah_t.faah035, #保險
       faah036 LIKE faah_t.faah036, #免稅
       faah037 LIKE faah_t.faah037, #抵押
       faah038 LIKE faah_t.faah038, #採購單號
       faah039 LIKE faah_t.faah039, #收貨單號
       faah040 LIKE faah_t.faah040, #帳款單號
       faah041 LIKE faah_t.faah041, #來源營運中心
       faah042 LIKE faah_t.faah042, #資產屬性
       faah043 LIKE faah_t.faah043, #預計總工作量
       faah044 LIKE faah_t.faah044, #已使用工作量
       faah045 LIKE faah_t.faah045, #帳款編號項次
       faahownid LIKE faah_t.faahownid, #資料所有者
       faahowndp LIKE faah_t.faahowndp, #資料所屬部門
       faahcrtid LIKE faah_t.faahcrtid, #資料建立者
       faahcrtdp LIKE faah_t.faahcrtdp, #資料建立部門
       faahcrtdt LIKE faah_t.faahcrtdt, #資料創建日
       faahmodid LIKE faah_t.faahmodid, #資料修改者
       faahmoddt LIKE faah_t.faahmoddt, #最近修改日
       faahstus LIKE faah_t.faahstus, #狀態碼
       faah046 LIKE faah_t.faah046, #備註
       faahud001 LIKE faah_t.faahud001, #自定義欄位(文字)001
       faahud002 LIKE faah_t.faahud002, #自定義欄位(文字)002
       faahud003 LIKE faah_t.faahud003, #自定義欄位(文字)003
       faahud004 LIKE faah_t.faahud004, #自定義欄位(文字)004
       faahud005 LIKE faah_t.faahud005, #自定義欄位(文字)005
       faahud006 LIKE faah_t.faahud006, #自定義欄位(文字)006
       faahud007 LIKE faah_t.faahud007, #自定義欄位(文字)007
       faahud008 LIKE faah_t.faahud008, #自定義欄位(文字)008
       faahud009 LIKE faah_t.faahud009, #自定義欄位(文字)009
       faahud010 LIKE faah_t.faahud010, #自定義欄位(文字)010
       faahud011 LIKE faah_t.faahud011, #自定義欄位(數字)011
       faahud012 LIKE faah_t.faahud012, #自定義欄位(數字)012
       faahud013 LIKE faah_t.faahud013, #自定義欄位(數字)013
       faahud014 LIKE faah_t.faahud014, #自定義欄位(數字)014
       faahud015 LIKE faah_t.faahud015, #自定義欄位(數字)015
       faahud016 LIKE faah_t.faahud016, #自定義欄位(數字)016
       faahud017 LIKE faah_t.faahud017, #自定義欄位(數字)017
       faahud018 LIKE faah_t.faahud018, #自定義欄位(數字)018
       faahud019 LIKE faah_t.faahud019, #自定義欄位(數字)019
       faahud020 LIKE faah_t.faahud020, #自定義欄位(數字)020
       faahud021 LIKE faah_t.faahud021, #自定義欄位(日期時間)021
       faahud022 LIKE faah_t.faahud022, #自定義欄位(日期時間)022
       faahud023 LIKE faah_t.faahud023, #自定義欄位(日期時間)023
       faahud024 LIKE faah_t.faahud024, #自定義欄位(日期時間)024
       faahud025 LIKE faah_t.faahud025, #自定義欄位(日期時間)025
       faahud026 LIKE faah_t.faahud026, #自定義欄位(日期時間)026
       faahud027 LIKE faah_t.faahud027, #自定義欄位(日期時間)027
       faahud028 LIKE faah_t.faahud028, #自定義欄位(日期時間)028
       faahud029 LIKE faah_t.faahud029, #自定義欄位(日期時間)029
       faahud030 LIKE faah_t.faahud030, #自定義欄位(日期時間)030
       faah047 LIKE faah_t.faah047, #保稅機器擷取否
       faah048 LIKE faah_t.faah048, #投資抵減狀態
       faah049 LIKE faah_t.faah049, #投資抵減合併碼
       faah050 LIKE faah_t.faah050, #抵減率
       faah051 LIKE faah_t.faah051, #投資抵減用途
       faah052 LIKE faah_t.faah052, #抵減金額
       faah053 LIKE faah_t.faah053, #已抵減金額
       faah054 LIKE faah_t.faah054, #投資抵減否
       faah055 LIKE faah_t.faah055, #投資抵減年限
       faah056 LIKE faah_t.faah056, #免稅狀態
       #170207-00036#1--add--str--lujh
       faah057 LIKE faah_t.faah057, #雜發單號
       faah058 LIKE faah_t.faah058  #雜發單號項次
       #170207-00036#1--add--end--lujh
       END RECORD

DEFINE g_faaj DYNAMIC ARRAY OF RECORD  #固定資產帳套折舊資訊資料檔
       faajent LIKE faaj_t.faajent, #企業編碼
       faajld LIKE faaj_t.faajld, #帳套別編碼
       faajsite LIKE faaj_t.faajsite, #營運據點
       faaj000 LIKE faaj_t.faaj000, #批號
       faaj001 LIKE faaj_t.faaj001, #財產編號
       faaj002 LIKE faaj_t.faaj002, #附號
       faaj003 LIKE faaj_t.faaj003, #折舊方式
       faaj004 LIKE faaj_t.faaj004, #耐用年限(月數)
       faaj005 LIKE faaj_t.faaj005, #未使用年限(月數)
       faaj006 LIKE faaj_t.faaj006, #分攤方式
       faaj007 LIKE faaj_t.faaj007, #分攤類別
       faaj008 LIKE faaj_t.faaj008, #開始折舊年月
       faaj009 LIKE faaj_t.faaj009, #最近折舊年度
       faaj010 LIKE faaj_t.faaj010, #最近折舊期別
       faaj011 LIKE faaj_t.faaj011, #折畢再提
       faaj012 LIKE faaj_t.faaj012, #折畢再提預留殘值
       faaj013 LIKE faaj_t.faaj013, #折畢再提預留年月（數）
       faaj014 LIKE faaj_t.faaj014, #幣別
       faaj015 LIKE faaj_t.faaj015, #匯率
       faaj016 LIKE faaj_t.faaj016, #成本
       faaj017 LIKE faaj_t.faaj017, #累折
       faaj018 LIKE faaj_t.faaj018, #本期累折
       faaj019 LIKE faaj_t.faaj019, #預留殘值
       faaj020 LIKE faaj_t.faaj020, #調整成本
       faaj021 LIKE faaj_t.faaj021, #已提列減值準備
       faaj022 LIKE faaj_t.faaj022, #年折舊額
       faaj023 LIKE faaj_t.faaj023, #資產科目
       faaj024 LIKE faaj_t.faaj024, #累折科目
       faaj025 LIKE faaj_t.faaj025, #折舊科目
       faaj026 LIKE faaj_t.faaj026, #減值準備科目
       faaj027 LIKE faaj_t.faaj027, #銷帳減值準備
       faaj028 LIKE faaj_t.faaj028, #未折減額
       faaj029 LIKE faaj_t.faaj029, #第一個月未折減額
       faaj030 LIKE faaj_t.faaj030, #帳款編號
       faaj031 LIKE faaj_t.faaj031, #帳款編號項次
       faaj032 LIKE faaj_t.faaj032, #本期處置累折
       faaj033 LIKE faaj_t.faaj033, #處置數量
       faaj034 LIKE faaj_t.faaj034, #處置成本
       faaj035 LIKE faaj_t.faaj035, #處置累折
       faaj036 LIKE faaj_t.faaj036, #交易價格差異
       faaj037 LIKE faaj_t.faaj037, #卡片編號
       faaj038 LIKE faaj_t.faaj038, #資產狀態
       faaj039 LIKE faaj_t.faaj039, #部門
       faaj040 LIKE faaj_t.faaj040, #利潤/成本中心
       faaj041 LIKE faaj_t.faaj041, #區域
       faaj042 LIKE faaj_t.faaj042, #交易客商
       faaj043 LIKE faaj_t.faaj043, #帳款客商
       faaj044 LIKE faaj_t.faaj044, #客群
       faaj045 LIKE faaj_t.faaj045, #專案編號
       faaj046 LIKE faaj_t.faaj046, #WBS
       faaj047 LIKE faaj_t.faaj047, #人員
       faaj101 LIKE faaj_t.faaj101, #本位幣二幣別
       faaj102 LIKE faaj_t.faaj102, #本位幣二匯率
       faaj103 LIKE faaj_t.faaj103, #本位幣二成本
       faaj104 LIKE faaj_t.faaj104, #本位幣二累折
       faaj105 LIKE faaj_t.faaj105, #本位幣二預留殘值
       faaj106 LIKE faaj_t.faaj106, #本位幣二折畢再提預留殘值
       faaj107 LIKE faaj_t.faaj107, #本位幣二年折舊額
       faaj108 LIKE faaj_t.faaj108, #本位幣二未折減額
       faaj109 LIKE faaj_t.faaj109, #本位幣二第一月未折減額
       faaj110 LIKE faaj_t.faaj110, #本位幣二處置減值準備
       faaj111 LIKE faaj_t.faaj111, #本位幣二本年累折
       faaj112 LIKE faaj_t.faaj112, #本位幣二已提列減值準備
       faaj113 LIKE faaj_t.faaj113, #本位幣二處置成本
       faaj114 LIKE faaj_t.faaj114, #本位幣二處置累折
       faaj115 LIKE faaj_t.faaj115, #本位幣二本期處置累折
       faaj116 LIKE faaj_t.faaj116, #本位幣二交易價格差異
       faaj117 LIKE faaj_t.faaj117, #本位幣二調整成本
       faaj151 LIKE faaj_t.faaj151, #本位幣三幣別
       faaj152 LIKE faaj_t.faaj152, #本位幣三匯率
       faaj153 LIKE faaj_t.faaj153, #本位幣三成本
       faaj154 LIKE faaj_t.faaj154, #本位幣三累折
       faaj155 LIKE faaj_t.faaj155, #本位幣三預留殘值
       faaj156 LIKE faaj_t.faaj156, #本位幣三折畢再提預留殘值
       faaj157 LIKE faaj_t.faaj157, #本位幣三年折舊額
       faaj158 LIKE faaj_t.faaj158, #本位幣三未折減額
       faaj159 LIKE faaj_t.faaj159, #本位幣三第一月未折減額
       faaj160 LIKE faaj_t.faaj160, #本位幣三處置減值準備
       faaj161 LIKE faaj_t.faaj161, #本位幣三本年累折
       faaj162 LIKE faaj_t.faaj162, #本位幣三已提列減值準備
       faaj163 LIKE faaj_t.faaj163, #本位幣三處置成本
       faaj164 LIKE faaj_t.faaj164, #本位幣三處置累折
       faaj165 LIKE faaj_t.faaj165, #本位幣三本期處置累折
       faaj166 LIKE faaj_t.faaj166, #本位幣三交易價格差異
       faaj167 LIKE faaj_t.faaj167, #本位幣三調整成本
       faajownid LIKE faaj_t.faajownid, #資料所有者
       faajowndp LIKE faaj_t.faajowndp, #資料所屬部門
       faajcrtid LIKE faaj_t.faajcrtid, #資料建立者
       faajcrtdp LIKE faaj_t.faajcrtdp, #資料建立部門
       faajcrtdt LIKE faaj_t.faajcrtdt, #資料創建日
       faajmodid LIKE faaj_t.faajmodid, #資料修改者
       faajmoddt LIKE faaj_t.faajmoddt, #最近修改日
       faajstus LIKE faaj_t.faajstus, #狀態碼
       faaj048 LIKE faaj_t.faaj048  #列帳/列管
       END RECORD

DEFINE g_faal DYNAMIC ARRAY OF RECORD  #固定資產主要類型檔
       faalent LIKE faal_t.faalent, #企業編號
       faalld LIKE faal_t.faalld, #帳套
       faal001 LIKE faal_t.faal001, #資產主要類別
       faal002 LIKE faal_t.faal002, #已停用資產是否計提折舊
       faal003 LIKE faal_t.faal003, #當月處置是否計提折舊
       faal004 LIKE faal_t.faal004, #資產處置轉入清理科目
       faal005 LIKE faal_t.faal005, #本月入帳提列方式
       faalownid LIKE faal_t.faalownid, #資料所有者
       faalowndp LIKE faal_t.faalowndp, #資料所屬部門
       faalcrtid LIKE faal_t.faalcrtid, #資料建立者
       faalcrtdp LIKE faal_t.faalcrtdp, #資料建立部門
       faalcrtdt LIKE faal_t.faalcrtdt, #資料創建日
       faalmodid LIKE faal_t.faalmodid, #資料修改者
       faalmoddt LIKE faal_t.faalmoddt, #最近修改日
       faalstus LIKE faal_t.faalstus, #狀態碼
       faalud001 LIKE faal_t.faalud001, #自定義欄位(文字)001
       faalud002 LIKE faal_t.faalud002, #自定義欄位(文字)002
       faalud003 LIKE faal_t.faalud003, #自定義欄位(文字)003
       faalud004 LIKE faal_t.faalud004, #自定義欄位(文字)004
       faalud005 LIKE faal_t.faalud005, #自定義欄位(文字)005
       faalud006 LIKE faal_t.faalud006, #自定義欄位(文字)006
       faalud007 LIKE faal_t.faalud007, #自定義欄位(文字)007
       faalud008 LIKE faal_t.faalud008, #自定義欄位(文字)008
       faalud009 LIKE faal_t.faalud009, #自定義欄位(文字)009
       faalud010 LIKE faal_t.faalud010, #自定義欄位(文字)010
       faalud011 LIKE faal_t.faalud011, #自定義欄位(數字)011
       faalud012 LIKE faal_t.faalud012, #自定義欄位(數字)012
       faalud013 LIKE faal_t.faalud013, #自定義欄位(數字)013
       faalud014 LIKE faal_t.faalud014, #自定義欄位(數字)014
       faalud015 LIKE faal_t.faalud015, #自定義欄位(數字)015
       faalud016 LIKE faal_t.faalud016, #自定義欄位(數字)016
       faalud017 LIKE faal_t.faalud017, #自定義欄位(數字)017
       faalud018 LIKE faal_t.faalud018, #自定義欄位(數字)018
       faalud019 LIKE faal_t.faalud019, #自定義欄位(數字)019
       faalud020 LIKE faal_t.faalud020, #自定義欄位(數字)020
       faalud021 LIKE faal_t.faalud021, #自定義欄位(日期時間)021
       faalud022 LIKE faal_t.faalud022, #自定義欄位(日期時間)022
       faalud023 LIKE faal_t.faalud023, #自定義欄位(日期時間)023
       faalud024 LIKE faal_t.faalud024, #自定義欄位(日期時間)024
       faalud025 LIKE faal_t.faalud025, #自定義欄位(日期時間)025
       faalud026 LIKE faal_t.faalud026, #自定義欄位(日期時間)026
       faalud027 LIKE faal_t.faalud027, #自定義欄位(日期時間)027
       faalud028 LIKE faal_t.faalud028, #自定義欄位(日期時間)028
       faalud029 LIKE faal_t.faalud029, #自定義欄位(日期時間)029
       faalud030 LIKE faal_t.faalud030, #自定義欄位(日期時間)030
       faal006 LIKE faal_t.faal006  #列帳/列管
       END RECORD

DEFINE g_faah1 RECORD  #固定資產基礎資料檔
       faahent LIKE faah_t.faahent, #企業編號
       faah000 LIKE faah_t.faah000, #產生批號
       faah001 LIKE faah_t.faah001, #卡片編號
       faah002 LIKE faah_t.faah002, #型態
       faah003 LIKE faah_t.faah003, #財產編號
       faah004 LIKE faah_t.faah004, #附號
       faah005 LIKE faah_t.faah005, #資產性質
       faah006 LIKE faah_t.faah006, #資產主要類型
       faah007 LIKE faah_t.faah007, #資產次要類型
       faah008 LIKE faah_t.faah008, #資產組
       faah009 LIKE faah_t.faah009, #供應供應商
       faah010 LIKE faah_t.faah010, #製造供應商
       faah011 LIKE faah_t.faah011, #產地
       faah012 LIKE faah_t.faah012, #名稱
       faah013 LIKE faah_t.faah013, #規格型號
       faah014 LIKE faah_t.faah014, #取得日期
       faah015 LIKE faah_t.faah015, #資產狀態
       faah016 LIKE faah_t.faah016, #取得方式
       faah017 LIKE faah_t.faah017, #單位
       faah018 LIKE faah_t.faah018, #數量
       faah019 LIKE faah_t.faah019, #在外數量
       faah020 LIKE faah_t.faah020, #幣別
       faah021 LIKE faah_t.faah021, #原幣單價
       faah022 LIKE faah_t.faah022, #原幣金額
       faah023 LIKE faah_t.faah023, #本幣單價
       faah024 LIKE faah_t.faah024, #本幣金額
       faah025 LIKE faah_t.faah025, #保管人員
       faah026 LIKE faah_t.faah026, #保管部門
       faah027 LIKE faah_t.faah027, #存放位置
       faah028 LIKE faah_t.faah028, #存放組織
       faah029 LIKE faah_t.faah029, #負責人員
       faah030 LIKE faah_t.faah030, #管理組織
       faah031 LIKE faah_t.faah031, #核算組織
       faah032 LIKE faah_t.faah032, #歸屬法人
       faah033 LIKE faah_t.faah033, #直接資本化
       faah034 LIKE faah_t.faah034, #保稅
       faah035 LIKE faah_t.faah035, #保險
       faah036 LIKE faah_t.faah036, #免稅
       faah037 LIKE faah_t.faah037, #抵押
       faah038 LIKE faah_t.faah038, #採購單號
       faah039 LIKE faah_t.faah039, #收貨單號
       faah040 LIKE faah_t.faah040, #帳款單號
       faah041 LIKE faah_t.faah041, #來源營運中心
       faah042 LIKE faah_t.faah042, #資產屬性
       faah043 LIKE faah_t.faah043, #預計總工作量
       faah044 LIKE faah_t.faah044, #已使用工作量
       faah045 LIKE faah_t.faah045, #帳款編號項次
       faahownid LIKE faah_t.faahownid, #資料所有者
       faahowndp LIKE faah_t.faahowndp, #資料所屬部門
       faahcrtid LIKE faah_t.faahcrtid, #資料建立者
       faahcrtdp LIKE faah_t.faahcrtdp, #資料建立部門
       faahcrtdt LIKE faah_t.faahcrtdt, #資料創建日
       faahmodid LIKE faah_t.faahmodid, #資料修改者
       faahmoddt LIKE faah_t.faahmoddt, #最近修改日
       faahstus LIKE faah_t.faahstus, #狀態碼
       faah046 LIKE faah_t.faah046, #備註
       faahud001 LIKE faah_t.faahud001, #自定義欄位(文字)001
       faahud002 LIKE faah_t.faahud002, #自定義欄位(文字)002
       faahud003 LIKE faah_t.faahud003, #自定義欄位(文字)003
       faahud004 LIKE faah_t.faahud004, #自定義欄位(文字)004
       faahud005 LIKE faah_t.faahud005, #自定義欄位(文字)005
       faahud006 LIKE faah_t.faahud006, #自定義欄位(文字)006
       faahud007 LIKE faah_t.faahud007, #自定義欄位(文字)007
       faahud008 LIKE faah_t.faahud008, #自定義欄位(文字)008
       faahud009 LIKE faah_t.faahud009, #自定義欄位(文字)009
       faahud010 LIKE faah_t.faahud010, #自定義欄位(文字)010
       faahud011 LIKE faah_t.faahud011, #自定義欄位(數字)011
       faahud012 LIKE faah_t.faahud012, #自定義欄位(數字)012
       faahud013 LIKE faah_t.faahud013, #自定義欄位(數字)013
       faahud014 LIKE faah_t.faahud014, #自定義欄位(數字)014
       faahud015 LIKE faah_t.faahud015, #自定義欄位(數字)015
       faahud016 LIKE faah_t.faahud016, #自定義欄位(數字)016
       faahud017 LIKE faah_t.faahud017, #自定義欄位(數字)017
       faahud018 LIKE faah_t.faahud018, #自定義欄位(數字)018
       faahud019 LIKE faah_t.faahud019, #自定義欄位(數字)019
       faahud020 LIKE faah_t.faahud020, #自定義欄位(數字)020
       faahud021 LIKE faah_t.faahud021, #自定義欄位(日期時間)021
       faahud022 LIKE faah_t.faahud022, #自定義欄位(日期時間)022
       faahud023 LIKE faah_t.faahud023, #自定義欄位(日期時間)023
       faahud024 LIKE faah_t.faahud024, #自定義欄位(日期時間)024
       faahud025 LIKE faah_t.faahud025, #自定義欄位(日期時間)025
       faahud026 LIKE faah_t.faahud026, #自定義欄位(日期時間)026
       faahud027 LIKE faah_t.faahud027, #自定義欄位(日期時間)027
       faahud028 LIKE faah_t.faahud028, #自定義欄位(日期時間)028
       faahud029 LIKE faah_t.faahud029, #自定義欄位(日期時間)029
       faahud030 LIKE faah_t.faahud030, #自定義欄位(日期時間)030
       faah047 LIKE faah_t.faah047, #保稅機器擷取否
       faah048 LIKE faah_t.faah048, #投資抵減狀態
       faah049 LIKE faah_t.faah049, #投資抵減合併碼
       faah050 LIKE faah_t.faah050, #抵減率
       faah051 LIKE faah_t.faah051, #投資抵減用途
       faah052 LIKE faah_t.faah052, #抵減金額
       faah053 LIKE faah_t.faah053, #已抵減金額
       faah054 LIKE faah_t.faah054, #投資抵減否
       faah055 LIKE faah_t.faah055, #投資抵減年限
       faah056 LIKE faah_t.faah056, #免稅狀態
       #170207-00036#1--add--str--lujh
       faah057 LIKE faah_t.faah057, #雜發單號
       faah058 LIKE faah_t.faah058  #雜發單號項次
       #170207-00036#1--add--end--lujh
       END RECORD

DEFINE g_faaj1 RECORD  #固定資產帳套折舊資訊資料檔
       faajent LIKE faaj_t.faajent, #企業編碼
       faajld LIKE faaj_t.faajld, #帳套別編碼
       faajsite LIKE faaj_t.faajsite, #營運據點
       faaj000 LIKE faaj_t.faaj000, #批號
       faaj001 LIKE faaj_t.faaj001, #財產編號
       faaj002 LIKE faaj_t.faaj002, #附號
       faaj003 LIKE faaj_t.faaj003, #折舊方式
       faaj004 LIKE faaj_t.faaj004, #耐用年限(月數)
       faaj005 LIKE faaj_t.faaj005, #未使用年限(月數)
       faaj006 LIKE faaj_t.faaj006, #分攤方式
       faaj007 LIKE faaj_t.faaj007, #分攤類別
       faaj008 LIKE faaj_t.faaj008, #開始折舊年月
       faaj009 LIKE faaj_t.faaj009, #最近折舊年度
       faaj010 LIKE faaj_t.faaj010, #最近折舊期別
       faaj011 LIKE faaj_t.faaj011, #折畢再提
       faaj012 LIKE faaj_t.faaj012, #折畢再提預留殘值
       faaj013 LIKE faaj_t.faaj013, #折畢再提預留年月（數）
       faaj014 LIKE faaj_t.faaj014, #幣別
       faaj015 LIKE faaj_t.faaj015, #匯率
       faaj016 LIKE faaj_t.faaj016, #成本
       faaj017 LIKE faaj_t.faaj017, #累折
       faaj018 LIKE faaj_t.faaj018, #本期累折
       faaj019 LIKE faaj_t.faaj019, #預留殘值
       faaj020 LIKE faaj_t.faaj020, #調整成本
       faaj021 LIKE faaj_t.faaj021, #已提列減值準備
       faaj022 LIKE faaj_t.faaj022, #年折舊額
       faaj023 LIKE faaj_t.faaj023, #資產科目
       faaj024 LIKE faaj_t.faaj024, #累折科目
       faaj025 LIKE faaj_t.faaj025, #折舊科目
       faaj026 LIKE faaj_t.faaj026, #減值準備科目
       faaj027 LIKE faaj_t.faaj027, #銷帳減值準備
       faaj028 LIKE faaj_t.faaj028, #未折減額
       faaj029 LIKE faaj_t.faaj029, #第一個月未折減額
       faaj030 LIKE faaj_t.faaj030, #帳款編號
       faaj031 LIKE faaj_t.faaj031, #帳款編號項次
       faaj032 LIKE faaj_t.faaj032, #本期處置累折
       faaj033 LIKE faaj_t.faaj033, #處置數量
       faaj034 LIKE faaj_t.faaj034, #處置成本
       faaj035 LIKE faaj_t.faaj035, #處置累折
       faaj036 LIKE faaj_t.faaj036, #交易價格差異
       faaj037 LIKE faaj_t.faaj037, #卡片編號
       faaj038 LIKE faaj_t.faaj038, #資產狀態
       faaj039 LIKE faaj_t.faaj039, #部門
       faaj040 LIKE faaj_t.faaj040, #利潤/成本中心
       faaj041 LIKE faaj_t.faaj041, #區域
       faaj042 LIKE faaj_t.faaj042, #交易客商
       faaj043 LIKE faaj_t.faaj043, #帳款客商
       faaj044 LIKE faaj_t.faaj044, #客群
       faaj045 LIKE faaj_t.faaj045, #專案編號
       faaj046 LIKE faaj_t.faaj046, #WBS
       faaj047 LIKE faaj_t.faaj047, #人員
       faaj101 LIKE faaj_t.faaj101, #本位幣二幣別
       faaj102 LIKE faaj_t.faaj102, #本位幣二匯率
       faaj103 LIKE faaj_t.faaj103, #本位幣二成本
       faaj104 LIKE faaj_t.faaj104, #本位幣二累折
       faaj105 LIKE faaj_t.faaj105, #本位幣二預留殘值
       faaj106 LIKE faaj_t.faaj106, #本位幣二折畢再提預留殘值
       faaj107 LIKE faaj_t.faaj107, #本位幣二年折舊額
       faaj108 LIKE faaj_t.faaj108, #本位幣二未折減額
       faaj109 LIKE faaj_t.faaj109, #本位幣二第一月未折減額
       faaj110 LIKE faaj_t.faaj110, #本位幣二處置減值準備
       faaj111 LIKE faaj_t.faaj111, #本位幣二本年累折
       faaj112 LIKE faaj_t.faaj112, #本位幣二已提列減值準備
       faaj113 LIKE faaj_t.faaj113, #本位幣二處置成本
       faaj114 LIKE faaj_t.faaj114, #本位幣二處置累折
       faaj115 LIKE faaj_t.faaj115, #本位幣二本期處置累折
       faaj116 LIKE faaj_t.faaj116, #本位幣二交易價格差異
       faaj117 LIKE faaj_t.faaj117, #本位幣二調整成本
       faaj151 LIKE faaj_t.faaj151, #本位幣三幣別
       faaj152 LIKE faaj_t.faaj152, #本位幣三匯率
       faaj153 LIKE faaj_t.faaj153, #本位幣三成本
       faaj154 LIKE faaj_t.faaj154, #本位幣三累折
       faaj155 LIKE faaj_t.faaj155, #本位幣三預留殘值
       faaj156 LIKE faaj_t.faaj156, #本位幣三折畢再提預留殘值
       faaj157 LIKE faaj_t.faaj157, #本位幣三年折舊額
       faaj158 LIKE faaj_t.faaj158, #本位幣三未折減額
       faaj159 LIKE faaj_t.faaj159, #本位幣三第一月未折減額
       faaj160 LIKE faaj_t.faaj160, #本位幣三處置減值準備
       faaj161 LIKE faaj_t.faaj161, #本位幣三本年累折
       faaj162 LIKE faaj_t.faaj162, #本位幣三已提列減值準備
       faaj163 LIKE faaj_t.faaj163, #本位幣三處置成本
       faaj164 LIKE faaj_t.faaj164, #本位幣三處置累折
       faaj165 LIKE faaj_t.faaj165, #本位幣三本期處置累折
       faaj166 LIKE faaj_t.faaj166, #本位幣三交易價格差異
       faaj167 LIKE faaj_t.faaj167, #本位幣三調整成本
       faajownid LIKE faaj_t.faajownid, #資料所有者
       faajowndp LIKE faaj_t.faajowndp, #資料所屬部門
       faajcrtid LIKE faaj_t.faajcrtid, #資料建立者
       faajcrtdp LIKE faaj_t.faajcrtdp, #資料建立部門
       faajcrtdt LIKE faaj_t.faajcrtdt, #資料創建日
       faajmodid LIKE faaj_t.faajmodid, #資料修改者
       faajmoddt LIKE faaj_t.faajmoddt, #最近修改日
       faajstus LIKE faaj_t.faajstus, #狀態碼
       faaj048 LIKE faaj_t.faaj048  #列帳/列管
       END RECORD

DEFINE g_faag RECORD  #多部門折舊費用分攤單身檔
       faagent LIKE faag_t.faagent, #企業編號
       faagld LIKE faag_t.faagld, #帳套別編碼
       faag001 LIKE faag_t.faag001, #資料年度
       faag002 LIKE faag_t.faag002, #資料月份
       faag003 LIKE faag_t.faag003, #分攤類別
       faag004 LIKE faag_t.faag004, #項次
       faag005 LIKE faag_t.faag005, #分攤部門
       faag006 LIKE faag_t.faag006, #折舊費用科目
       faag007 LIKE faag_t.faag007, #分攤比率
       faag008 LIKE faag_t.faag008, #變動比率類型
       faag009 LIKE faag_t.faag009, #變動比率分子科目
       faag010 LIKE faag_t.faag010, #變動數值
       faagud001 LIKE faag_t.faagud001, #自定義欄位(文字)001
       faagud002 LIKE faag_t.faagud002, #自定義欄位(文字)002
       faagud003 LIKE faag_t.faagud003, #自定義欄位(文字)003
       faagud004 LIKE faag_t.faagud004, #自定義欄位(文字)004
       faagud005 LIKE faag_t.faagud005, #自定義欄位(文字)005
       faagud006 LIKE faag_t.faagud006, #自定義欄位(文字)006
       faagud007 LIKE faag_t.faagud007, #自定義欄位(文字)007
       faagud008 LIKE faag_t.faagud008, #自定義欄位(文字)008
       faagud009 LIKE faag_t.faagud009, #自定義欄位(文字)009
       faagud010 LIKE faag_t.faagud010, #自定義欄位(文字)010
       faagud011 LIKE faag_t.faagud011, #自定義欄位(數字)011
       faagud012 LIKE faag_t.faagud012, #自定義欄位(數字)012
       faagud013 LIKE faag_t.faagud013, #自定義欄位(數字)013
       faagud014 LIKE faag_t.faagud014, #自定義欄位(數字)014
       faagud015 LIKE faag_t.faagud015, #自定義欄位(數字)015
       faagud016 LIKE faag_t.faagud016, #自定義欄位(數字)016
       faagud017 LIKE faag_t.faagud017, #自定義欄位(數字)017
       faagud018 LIKE faag_t.faagud018, #自定義欄位(數字)018
       faagud019 LIKE faag_t.faagud019, #自定義欄位(數字)019
       faagud020 LIKE faag_t.faagud020, #自定義欄位(數字)020
       faagud021 LIKE faag_t.faagud021, #自定義欄位(日期時間)021
       faagud022 LIKE faag_t.faagud022, #自定義欄位(日期時間)022
       faagud023 LIKE faag_t.faagud023, #自定義欄位(日期時間)023
       faagud024 LIKE faag_t.faagud024, #自定義欄位(日期時間)024
       faagud025 LIKE faag_t.faagud025, #自定義欄位(日期時間)025
       faagud026 LIKE faag_t.faagud026, #自定義欄位(日期時間)026
       faagud027 LIKE faag_t.faagud027, #自定義欄位(日期時間)027
       faagud028 LIKE faag_t.faagud028, #自定義欄位(日期時間)028
       faagud029 LIKE faag_t.faagud029, #自定義欄位(日期時間)029
       faagud030 LIKE faag_t.faagud030  #自定義欄位(日期時間)030
       END RECORD

DEFINE g_glaa_t RECORD  #帳套資料檔
       glaaent LIKE glaa_t.glaaent, #企業編號
       glaaownid LIKE glaa_t.glaaownid, #資料所有者
       glaaowndp LIKE glaa_t.glaaowndp, #資料所屬部門
       glaacrtid LIKE glaa_t.glaacrtid, #資料建立者
       glaacrtdp LIKE glaa_t.glaacrtdp, #資料建立部門
       glaacrtdt LIKE glaa_t.glaacrtdt, #資料創建日
       glaamodid LIKE glaa_t.glaamodid, #資料修改者
       glaamoddt LIKE glaa_t.glaamoddt, #最近修改日
       glaastus LIKE glaa_t.glaastus, #狀態碼
       glaald LIKE glaa_t.glaald, #帳套編號
       glaacomp LIKE glaa_t.glaacomp, #歸屬法人
       glaa001 LIKE glaa_t.glaa001, #使用幣別
       glaa002 LIKE glaa_t.glaa002, #匯率參照表號
       glaa003 LIKE glaa_t.glaa003, #會計週期參照表號
       glaa004 LIKE glaa_t.glaa004, #會計科目參照表號
       glaa005 LIKE glaa_t.glaa005, #現金變動參照表號
       glaa006 LIKE glaa_t.glaa006, #月結方式
       glaa007 LIKE glaa_t.glaa007, #年結方式
       glaa008 LIKE glaa_t.glaa008, #平行記帳否
       glaa009 LIKE glaa_t.glaa009, #傳票登入方式
       glaa010 LIKE glaa_t.glaa010, #現行年度
       glaa011 LIKE glaa_t.glaa011, #現行期別
       glaa012 LIKE glaa_t.glaa012, #最後過帳日期
       glaa013 LIKE glaa_t.glaa013, #關帳日期
       glaa014 LIKE glaa_t.glaa014, #主帳套
       glaa015 LIKE glaa_t.glaa015, #啟用本位幣二
       glaa016 LIKE glaa_t.glaa016, #本位幣二
       glaa017 LIKE glaa_t.glaa017, #本位幣二換算基準
       glaa018 LIKE glaa_t.glaa018, #本位幣二匯率採用
       glaa019 LIKE glaa_t.glaa019, #啟用本位幣三
       glaa020 LIKE glaa_t.glaa020, #本位幣三
       glaa021 LIKE glaa_t.glaa021, #本位幣三換算基準
       glaa022 LIKE glaa_t.glaa022, #本位幣三匯率採用
       glaa023 LIKE glaa_t.glaa023, #次帳套帳務產生時機
       glaa024 LIKE glaa_t.glaa024, #單據別參照表號
       glaa025 LIKE glaa_t.glaa025, #本位幣一匯率採用
       glaa026 LIKE glaa_t.glaa026, #幣別參照表號
       glaa100 LIKE glaa_t.glaa100, #傳票輸入時自動按缺號產生
       glaa101 LIKE glaa_t.glaa101, #傳票總號輸入時機
       glaa102 LIKE glaa_t.glaa102, #傳票成立時,借貸不平衡的處理方式
       glaa103 LIKE glaa_t.glaa103, #未列印的傳票可否進行過帳
       glaa111 LIKE glaa_t.glaa111, #應計調整單別
       glaa112 LIKE glaa_t.glaa112, #期末結轉單別
       glaa113 LIKE glaa_t.glaa113, #年底結轉單別
       glaa120 LIKE glaa_t.glaa120, #成本計算類型
       glaa121 LIKE glaa_t.glaa121, #子模組啟用分錄底稿
       glaa122 LIKE glaa_t.glaa122, #總帳可維護資金異動明細
       glaa027 LIKE glaa_t.glaa027, #單據據點編號
       glaa130 LIKE glaa_t.glaa130, #合併帳套否
       glaa131 LIKE glaa_t.glaa131, #分層合併
       glaa132 LIKE glaa_t.glaa132, #平均匯率計算方式
       glaa133 LIKE glaa_t.glaa133, #非T100公司匯入餘額類型
       glaa134 LIKE glaa_t.glaa134, #合併科目轉換依據異動碼設定值
       glaa135 LIKE glaa_t.glaa135, #現流表間接法群組參照表號
       glaa136 LIKE glaa_t.glaa136, #應收帳款核銷限定己立帳傳票
       glaa137 LIKE glaa_t.glaa137, #應付帳款核銷限定已立帳傳票
       glaa138 LIKE glaa_t.glaa138, #合併報表編制期別
       glaa139 LIKE glaa_t.glaa139, #遞延收入(負債)管理產生否
       glaa140 LIKE glaa_t.glaa140, #無原出貨單的遞延負債減項者,是否仍立遞延收入管理?
       glaa123 LIKE glaa_t.glaa123, #應收帳款核銷可維護資金異動明細
       glaa124 LIKE glaa_t.glaa124, #應付帳款核銷可維護資金異動明細
       glaa028 LIKE glaa_t.glaa028  #匯率來源
       END RECORD

#161215-00044#1---modify----end-----------------
DEFINE g_flag               LIKE type_t.chr1
DEFINE g_flag_1             LIKE type_t.chr1
DEFINE l_first2,l_last2     LIKE type_t.dat
DEFINE l_first,l_last       LIKE type_t.num5
DEFINE g_mm                 LIKE type_t.chr2
DEFINE g_ym                 LIKE type_t.chr6
DEFINE g_yy                 LIKE type_t.chr4
DEFINE g_type               LIKE type_t.chr1
DEFINE g_glaa001            LIKE glaa_t.glaa001
DEFINE g_glaa015            LIKE glaa_t.glaa015
DEFINE g_glaa016            LIKE glaa_t.glaa016
DEFINE g_glaa017            LIKE glaa_t.glaa017
DEFINE g_glaa018            LIKE glaa_t.glaa018
DEFINE g_glaa019            LIKE glaa_t.glaa019
DEFINE g_glaa020            LIKE glaa_t.glaa020
DEFINE g_glaa021            LIKE glaa_t.glaa021
DEFINE g_glaa022            LIKE glaa_t.glaa022
DEFINE g_glaacomp            LIKE glaa_t.glaacomp
DEFINE g_faam013_year       LIKE faam_t.faam013
DEFINE g_faam013_all        LIKE faam_t.faam013
DEFINE g_cnt2               LIKE type_t.num5

DEFINE g_target STRING
DEFINE g_glaa004           LIKE glaa_t.glaa004
#DEFINE g_glaa_t            RECORD LIKE glaa_t.*  #20141106 #161215-00044#1--mark
#20141209 add by chenying
DEFINE g_faam013 LIKE faam_t.faam013
DEFINE g_faam016 LIKE faam_t.faam016
DEFINE g_faam014 LIKE faam_t.faam014
DEFINE g_faam015 LIKE faam_t.faam015
DEFINE g_faam018 LIKE faam_t.faam018
#20141209 add by chenying
DEFINE g_wc_cs_ld          STRING      #160125-00005#7
DEFINE g_wc_cs_orga        STRING      #160125-00005#7
#end add-point
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
#add-point:傳入參數說明 name="global.argv"

#end add-point
 
{</section>}
 
{<section id="afap230.main" type="s" >}
MAIN
   #add-point:main段define (客製用) name="main.define_customerization"
   
   #end add-point 
   DEFINE ls_js    STRING
   DEFINE lc_param type_parameter  
   #add-point:main段define name="main.define"
               
   #end add-point 
  
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log
 
   #add-point:初始化前定義 name="main.before_ap_init"
   
   #end add-point
   #依模組進行系統初始化設定(系統設定)
   CALL cl_ap_init("afa","")
 
   #add-point:定義背景狀態與整理進入需用參數ls_js name="main.background"
               
   #end add-point
 
   #背景(Y) 或半背景(T) 時不做主畫面開窗
   IF g_bgjob = "Y" OR g_bgjob = "T" THEN
      #排程參數由01開始，若不是1開始，表示有保留參數
      LET ls_js = g_argv[01]
     #CALL util.JSON.parse(ls_js,g_master)   #p類主要使用l_param,此處不解析
      #add-point:Service Call name="main.servicecall"
                              
      #end add-point
      CALL afap230_process(ls_js)
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_afap230 WITH FORM cl_ap_formpath("afa",g_code)
 
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
 
      #程式初始化
      CALL afap230_init()
 
      #進入選單 Menu (="N")
      CALL afap230_ui_dialog()
 
      #add-point:畫面關閉前 name="main.before_close"
                              
      #end add-point
      #畫面關閉
      CLOSE WINDOW w_afap230
   END IF
 
   #add-point:作業離開前 name="main.exit"
   
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
{</section>}
 
{<section id="afap230.init" type="s" >}
#+ 初始化作業
PRIVATE FUNCTION afap230_init()
 
   #add-point:init段define (客製用) name="init.define_customerization"
   
   #end add-point
   #add-point:ui_dialog段define name="init.define"
               
   #end add-point
 
   LET g_error_show = 1
   LET gwin_curr2 = ui.Window.getCurrent()
   LET gfrm_curr2 = gwin_curr2.getForm()
   CALL cl_schedule_import_4fd()
   CALL cl_set_combo_scc("gzpa003","75")
   IF cl_get_para(g_enterprise,"","E-SYS-0005") = "N" THEN
       CALL cl_set_comp_visible("scheduling_page,history_page",FALSE)
   END IF 
   #add-point:畫面資料初始化 name="init.init"
   CALL cl_set_combo_scc('faah005','9903')
   CALL cl_set_combo_scc('faah042','9917')
   
   CALL cl_set_combo_scc('b_faah005','9903')
   CALL cl_set_combo_scc('b_faah042','9917')  
   CALL cl_set_combo_scc('faah015','9914')  #20141212 add by chenying
   #营运据点范围
   CALL s_axrt300_get_site(g_user,'','1') RETURNING g_wc_cs_orga #160125-00005#7      
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="afap230.ui_dialog" type="s" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION afap230_ui_dialog()
 
   #add-point:ui_dialog段define (客製用) name="ui_dialog.define_customerization"
   
   #end add-point
   DEFINE li_exit  LIKE type_t.num5    #判別是否為離開作業
   DEFINE li_idx   LIKE type_t.num10
   DEFINE ls_js    STRING
   DEFINE ls_wc    STRING
   DEFINE l_dialog ui.DIALOG
   DEFINE lc_param type_parameter
   #add-point:ui_dialog段define name="ui_dialog.define"
   CALL afap230_ui_dialog_1()
   RETURN
   #end add-point
   
   #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog"
   
   #end add-point
 
   WHILE TRUE
      #add-point:ui_dialog段before dialog2 name="ui_dialog.before_dialog2"
      
      #end add-point
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #應用 a57 樣板自動產生(Version:3)
         INPUT BY NAME g_master.glaald,g_master.glaacomp,g_master.glaa001,g_master.year,g_master.month, 
             g_master.faah007,g_master.faah003,g_master.faah004,g_master.faah008,g_master.faah006 
            ATTRIBUTE(WITHOUT DEFAULTS)
            
            #自訂ACTION(master_input)
            
         
            BEFORE INPUT
               #add-point:資料輸入前 name="input.m.before_input"
               
               #end add-point
         
                     #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD glaald
            
            #add-point:AFTER FIELD glaald name="input.a.glaald"
            SELECT glaal002 INTO g_glaa_m.glaald_desc  FROM glaal_t
             WHERE glaalent=g_enterprise AND glaalld=g_glaa_m.glaald AND glaal001=g_dlang

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD glaald
            #add-point:BEFORE FIELD glaald name="input.b.glaald"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE glaald
            #add-point:ON CHANGE glaald name="input.g.glaald"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD glaacomp
            
            #add-point:AFTER FIELD glaacomp name="input.a.glaacomp"
            SELECT ooefl003 INTO g_glaa_m.glaacomp_desc FROM ooefl_t 
             WHERE ooeflent=g_enterprise AND ooefl001=g_glaa_m.glaacomp AND ooefl002=g_dlang


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD glaacomp
            #add-point:BEFORE FIELD glaacomp name="input.b.glaacomp"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE glaacomp
            #add-point:ON CHANGE glaacomp name="input.g.glaacomp"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD glaa001
            
            #add-point:AFTER FIELD glaa001 name="input.a.glaa001"
            SELECT ooail003 INTO  g_glaa_m.glaa001_desc FROM ooail_t 
             WHERE ooailent=g_enterprise AND ooail001= g_glaa_m.glaa001 AND ooail002=g_dlang


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD glaa001
            #add-point:BEFORE FIELD glaa001 name="input.b.glaa001"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE glaa001
            #add-point:ON CHANGE glaa001 name="input.g.glaa001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD year
            #add-point:BEFORE FIELD year name="input.b.year"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD year
            
            #add-point:AFTER FIELD year name="input.a.year"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE year
            #add-point:ON CHANGE year name="input.g.year"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD month
            #add-point:BEFORE FIELD month name="input.b.month"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD month
            
            #add-point:AFTER FIELD month name="input.a.month"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE month
            #add-point:ON CHANGE month name="input.g.month"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD faah007
            
            #add-point:AFTER FIELD faah007 name="input.a.faah007"
            IF NOT cl_null(g_master.faah007) THEN 
#應用 a19 樣板自動產生(Version:1)
               #校驗代值
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
               
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_master.faah007
               #160318-00025#5--add--str
               LET g_errshow = TRUE 
               LET g_chkparam.err_str[1] = "afa-00009:sub-01302|afai030|",cl_get_progname("afai030",g_lang,"2"),"|:EXEPROGafai030"
               #160318-00025#5--add--end
                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist_and_ref_val("v_faad001") THEN
                  #檢查成功時後續處理
                  #LET  = g_chkparam.return1
                  #DISPLAY BY NAME 
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF
            

            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faah007
            #add-point:BEFORE FIELD faah007 name="input.b.faah007"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE faah007
            #add-point:ON CHANGE faah007 name="input.g.faah007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faah003
            #add-point:BEFORE FIELD faah003 name="input.b.faah003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD faah003
            
            #add-point:AFTER FIELD faah003 name="input.a.faah003"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE faah003
            #add-point:ON CHANGE faah003 name="input.g.faah003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faah004
            #add-point:BEFORE FIELD faah004 name="input.b.faah004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD faah004
            
            #add-point:AFTER FIELD faah004 name="input.a.faah004"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE faah004
            #add-point:ON CHANGE faah004 name="input.g.faah004"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD faah008
            
            #add-point:AFTER FIELD faah008 name="input.a.faah008"
            IF NOT cl_null(g_master.faah008) THEN 
#應用 a19 樣板自動產生(Version:1)
               #校驗代值
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
               
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_master.faah008
               #160318-00025#5--add--str
               LET g_errshow = TRUE 
               LET g_chkparam.err_str[1] = "afa-00011:sub-01302|afai110|",cl_get_progname("afai110",g_lang,"2"),"|:EXEPROGafai110"
               #160318-00025#5--add--end
                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist_and_ref_val("v_oocq002_3903") THEN
                  #檢查成功時後續處理
                  #LET  = g_chkparam.return1
                  #DISPLAY BY NAME 
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF
            

            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faah008
            #add-point:BEFORE FIELD faah008 name="input.b.faah008"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE faah008
            #add-point:ON CHANGE faah008 name="input.g.faah008"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD faah006
            
            #add-point:AFTER FIELD faah006 name="input.a.faah006"
            IF NOT cl_null(g_master.faah006) THEN 
#應用 a19 樣板自動產生(Version:1)
               #校驗代值
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
               
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_master.faah006
               #160318-00025#5--add--str
               LET g_errshow = TRUE 
               LET g_chkparam.err_str[1] = "afa-00007:sub-01302|afai020|",cl_get_progname("afai020",g_lang,"2"),"|:EXEPROGafai020"
               #160318-00025#5--add--end
                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist_and_ref_val("v_faac001") THEN
                  #檢查成功時後續處理
                  #LET  = g_chkparam.return1
                  #DISPLAY BY NAME 
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF
            

            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faah006
            #add-point:BEFORE FIELD faah006 name="input.b.faah006"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE faah006
            #add-point:ON CHANGE faah006 name="input.g.faah006"
            
            #END add-point 
 
 
 
                     #Ctrlp:input.c.glaald
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD glaald
            #add-point:ON ACTION controlp INFIELD glaald name="input.c.glaald"
            
            #END add-point
 
 
         #Ctrlp:input.c.glaacomp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD glaacomp
            #add-point:ON ACTION controlp INFIELD glaacomp name="input.c.glaacomp"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_glaa_m.glaacomp             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            #CALL q_ooea001_2()                                #呼叫開窗    #170425-00037#7 mark by wanghaoz 2017/09/07
            CALL q_ooef001_2()                                #呼叫開窗    #170425-00037#7 add by wanghaoz 2017/09/07

            LET g_glaa_m.glaacomp = g_qryparam.return1              

            DISPLAY g_glaa_m.glaacomp TO glaacomp              #

            NEXT FIELD glaacomp                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.glaa001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD glaa001
            #add-point:ON ACTION controlp INFIELD glaa001 name="input.c.glaa001"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_glaa_m.glaa001             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_ooai001()                                #呼叫開窗

            LET g_glaa_m.glaa001 = g_qryparam.return1              

            DISPLAY g_glaa_m.glaa001 TO glaa001              #

            NEXT FIELD glaa001                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.year
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD year
            #add-point:ON ACTION controlp INFIELD year name="input.c.year"
            
            #END add-point
 
 
         #Ctrlp:input.c.month
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD month
            #add-point:ON ACTION controlp INFIELD month name="input.c.month"
            
            #END add-point
 
 
         #Ctrlp:input.c.faah007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD faah007
            #add-point:ON ACTION controlp INFIELD faah007 name="input.c.faah007"
            #應用 a07 樣板自動產生(Version:1)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_master.faah007             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s

            
            CALL q_faad001()                                #呼叫開窗

            LET g_master.faah007 = g_qryparam.return1              

            DISPLAY g_master.faah007 TO faah007              #

            NEXT FIELD faah007                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.faah003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD faah003
            #add-point:ON ACTION controlp INFIELD faah003 name="input.c.faah003"
            
            #END add-point
 
 
         #Ctrlp:input.c.faah004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD faah004
            #add-point:ON ACTION controlp INFIELD faah004 name="input.c.faah004"
            
            #END add-point
 
 
         #Ctrlp:input.c.faah008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD faah008
            #add-point:ON ACTION controlp INFIELD faah008 name="input.c.faah008"
            #應用 a07 樣板自動產生(Version:1)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_master.faah008             #給予default值
            LET g_qryparam.default2 = "" #g_master.oocq002 #應用分類碼
            #給予arg
            LET g_qryparam.arg1 = "" #s

            
            CALL q_oocq002()                                #呼叫開窗

            LET g_master.faah008 = g_qryparam.return1              
            #LET g_master.oocq002 = g_qryparam.return2 
            DISPLAY g_master.faah008 TO faah008              #
            #DISPLAY g_master.oocq002 TO oocq002 #應用分類碼
            NEXT FIELD faah008                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.faah006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD faah006
            #add-point:ON ACTION controlp INFIELD faah006 name="input.c.faah006"
            #應用 a07 樣板自動產生(Version:1)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_master.faah006             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s

            
            CALL q_faac001()                                #呼叫開窗

            LET g_master.faah006 = g_qryparam.return1              

            DISPLAY g_master.faah006 TO faah006              #

            NEXT FIELD faah006                          #返回原欄位


            #END add-point
 
 
 
               
            AFTER INPUT
               #add-point:資料輸入後 name="input.m.after_input"
              
               
               #end add-point
               
            #add-point:其他管控(on row change, etc...) name="input.other"
            
            #end add-point
         END INPUT
 
 
 
         
         #應用 a58 樣板自動產生(Version:3)
         CONSTRUCT BY NAME g_master.wc ON faamsite,glaald,glaacomp,glaa001,year,month,faah001,faah007, 
             faah003,faah005,faah004,faah008,faah006,faah042
            BEFORE CONSTRUCT
               #add-point:cs段before_construct name="cs.head.before_construct"
               
               #end add-point 
         
            #公用欄位開窗相關處理
            
               
            #一般欄位開窗相關處理    
                     #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faamsite
            #add-point:BEFORE FIELD faamsite name="construct.b.faamsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD faamsite
            
            #add-point:AFTER FIELD faamsite name="construct.a.faamsite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.faamsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD faamsite
            #add-point:ON ACTION controlp INFIELD faamsite name="construct.c.faamsite"
            
            #END add-point
 
 
         #Ctrlp:construct.c.glaald
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD glaald
            #add-point:ON ACTION controlp INFIELD glaald name="construct.c.glaald"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_authorised_ld()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO glaald  #顯示到畫面上
            NEXT FIELD glaald                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD glaald
            #add-point:BEFORE FIELD glaald name="construct.b.glaald"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD glaald
            
            #add-point:AFTER FIELD glaald name="construct.a.glaald"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.glaacomp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD glaacomp
            #add-point:ON ACTION controlp INFIELD glaacomp name="construct.c.glaacomp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            #CALL q_ooea001_2()                           #呼叫開窗   #170425-00037#7 mark by wanghaoz 2017/09/07
            CALL q_ooef001_2()                           #呼叫開窗   #170425-00037#7 add by wanghaoz 2017/09/07
            DISPLAY g_qryparam.return1 TO glaacomp  #顯示到畫面上
            NEXT FIELD glaacomp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD glaacomp
            #add-point:BEFORE FIELD glaacomp name="construct.b.glaacomp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD glaacomp
            
            #add-point:AFTER FIELD glaacomp name="construct.a.glaacomp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.glaa001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD glaa001
            #add-point:ON ACTION controlp INFIELD glaa001 name="construct.c.glaa001"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooai001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO glaa001  #顯示到畫面上
            NEXT FIELD glaa001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD glaa001
            #add-point:BEFORE FIELD glaa001 name="construct.b.glaa001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD glaa001
            
            #add-point:AFTER FIELD glaa001 name="construct.a.glaa001"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD year
            #add-point:BEFORE FIELD year name="construct.b.year"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD year
            
            #add-point:AFTER FIELD year name="construct.a.year"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.year
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD year
            #add-point:ON ACTION controlp INFIELD year name="construct.c.year"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD month
            #add-point:BEFORE FIELD month name="construct.b.month"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD month
            
            #add-point:AFTER FIELD month name="construct.a.month"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.month
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD month
            #add-point:ON ACTION controlp INFIELD month name="construct.c.month"
            
            #END add-point
 
 
         #Ctrlp:construct.c.faah001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD faah001
            #add-point:ON ACTION controlp INFIELD faah001 name="construct.c.faah001"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_faah001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO faah001  #顯示到畫面上
            NEXT FIELD faah001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faah001
            #add-point:BEFORE FIELD faah001 name="construct.b.faah001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD faah001
            
            #add-point:AFTER FIELD faah001 name="construct.a.faah001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.faah007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD faah007
            #add-point:ON ACTION controlp INFIELD faah007 name="construct.c.faah007"
            #應用 a08 樣板自動產生(Version:1)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_faad001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO faah007  #顯示到畫面上
            NEXT FIELD faah007                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faah007
            #add-point:BEFORE FIELD faah007 name="construct.b.faah007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD faah007
            
            #add-point:AFTER FIELD faah007 name="construct.a.faah007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.faah003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD faah003
            #add-point:ON ACTION controlp INFIELD faah003 name="construct.c.faah003"
            #應用 a08 樣板自動產生(Version:1)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_faah003()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO faah003  #顯示到畫面上
            NEXT FIELD faah003                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faah003
            #add-point:BEFORE FIELD faah003 name="construct.b.faah003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD faah003
            
            #add-point:AFTER FIELD faah003 name="construct.a.faah003"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faah005
            #add-point:BEFORE FIELD faah005 name="construct.b.faah005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD faah005
            
            #add-point:AFTER FIELD faah005 name="construct.a.faah005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.faah005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD faah005
            #add-point:ON ACTION controlp INFIELD faah005 name="construct.c.faah005"
            
            #END add-point
 
 
         #Ctrlp:construct.c.faah004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD faah004
            #add-point:ON ACTION controlp INFIELD faah004 name="construct.c.faah004"
            #應用 a08 樣板自動產生(Version:1)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_faah004()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO faah004  #顯示到畫面上
            NEXT FIELD faah004                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faah004
            #add-point:BEFORE FIELD faah004 name="construct.b.faah004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD faah004
            
            #add-point:AFTER FIELD faah004 name="construct.a.faah004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.faah008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD faah008
            #add-point:ON ACTION controlp INFIELD faah008 name="construct.c.faah008"
            #應用 a08 樣板自動產生(Version:1)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO faah008  #顯示到畫面上
            NEXT FIELD faah008                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faah008
            #add-point:BEFORE FIELD faah008 name="construct.b.faah008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD faah008
            
            #add-point:AFTER FIELD faah008 name="construct.a.faah008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.faah006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD faah006
            #add-point:ON ACTION controlp INFIELD faah006 name="construct.c.faah006"
            #應用 a08 樣板自動產生(Version:1)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_faac001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO faah006  #顯示到畫面上
            NEXT FIELD faah006                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faah006
            #add-point:BEFORE FIELD faah006 name="construct.b.faah006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD faah006
            
            #add-point:AFTER FIELD faah006 name="construct.a.faah006"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faah042
            #add-point:BEFORE FIELD faah042 name="construct.b.faah042"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD faah042
            
            #add-point:AFTER FIELD faah042 name="construct.a.faah042"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.faah042
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD faah042
            #add-point:ON ACTION controlp INFIELD faah042 name="construct.c.faah042"
            
            #END add-point
 
 
 
            
            #add-point:其他管控 name="cs.other"
            
            #end add-point
            
         END CONSTRUCT
 
 
 
      
         #add-point:ui_dialog段construct name="ui_dialog.more_construct"
                                             
         #end add-point
         #add-point:ui_dialog段input name="ui_dialog.more_input"
         INPUT ARRAY g_faah_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS,
                  INSERT ROW = FALSE,
                  DELETE ROW = FALSE,
                  APPEND ROW = FALSE)
             BEFORE INPUT
                CALL afap230_b_fill(g_wc2)
                LET g_rec_b = g_faah_d.getLength()
                CALL cl_set_comp_entry("faah003,faah004,faah006,faah007,faah005,faah008,faah042",FALSE)

            BEFORE ROW
               LET l_ac = ARR_CURR()
            
#            ON ACTION confirm
#               CALL afap230_confirm()

         END INPUT         
         #end add-point
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
#                                    DISPLAY ARRAY g_faah_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b1) #page1
#
#            BEFORE ROW
#               LET l_ac1 = DIALOG.getCurrentRow("s_detail1")
#               LET g_detail_idx1 = l_ac1
#               DISPLAY g_detail_idx1 TO h_index
#
#            BEFORE DISPLAY
#               CALL FGL_SET_ARR_CURR(g_detail_idx1)
#               LET l_ac1 = DIALOG.getCurrentRow("s_detail1")
#               DISPLAY g_rec_b1 TO h_count
#
#         END DISPLAY         
         #end add-point
 
         SUBDIALOG lib_cl_schedule.cl_schedule_setting
         SUBDIALOG lib_cl_schedule.cl_schedule_setting_exec_call
         SUBDIALOG lib_cl_schedule.cl_schedule_select_show_history
         SUBDIALOG lib_cl_schedule.cl_schedule_show_history
 
         BEFORE DIALOG
            LET l_dialog = ui.DIALOG.getCurrent()
            CALL afap230_get_buffer(l_dialog)
            #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog3"
            
            #end add-point
 
         ON ACTION batch_execute
            LET g_action_choice = "batch_execute"
            ACCEPT DIALOG
 
         #add-point:ui_dialog段before_qbeclear name="ui_dialog.before_qbeclear"
         
         #end add-point
 
         ON ACTION qbeclear         
            CLEAR FORM
            INITIALIZE g_master.* TO NULL   #畫面變數清空
            INITIALIZE lc_param.* TO NULL   #傳遞參數變數清空
            #add-point:ui_dialog段qbeclear name="ui_dialog.qbeclear"
            
            #end add-point
 
         ON ACTION history_fill
            CALL cl_schedule_history_fill()
 
         ON ACTION close
            LET INT_FLAG = TRUE
            EXIT DIALOG
         
         ON ACTION exit
            LET INT_FLAG = TRUE
            EXIT DIALOG
 
         #add-point:ui_dialog段action name="ui_dialog.more_action"
         
         #end add-point
 
         #主選單用ACTION
         &include "main_menu_exit_dialog.4gl"
         &include "relating_action.4gl"
         #交談指令共用ACTION
         &include "common_action.4gl"
            CONTINUE DIALOG
      END DIALOG
 
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM   
         INITIALIZE g_master.* TO NULL
         LET g_wc  = ' 1=2'
         LET g_action_choice = ""
         CALL afap230_init()
         CONTINUE WHILE
      END IF
 
      #檢查批次設定是否有錯(或未設定完成)
      IF NOT cl_schedule_exec_check() THEN
         CONTINUE WHILE
      END IF
      
      LET lc_param.wc = g_master.wc    #把畫面上的wc傳遞到參數變數
      #請在下方的add-point內進行把畫面的輸入資料(g_master)轉換到傳遞參數變數(lc_param)的動作
      #add-point:ui_dialog段exit dialog name="process.exit_dialog"
                              
      #end add-point
 
      LET ls_js = util.JSON.stringify(lc_param)  #r類使用g_master/p類使用lc_param
 
      IF INT_FLAG THEN
         LET INT_FLAG = FALSE
         EXIT WHILE
      ELSE
         IF g_chk_jobid THEN 
            LET g_jobid = g_schedule.gzpa001
         ELSE 
            LET g_jobid = cl_schedule_get_jobid(g_prog)
         END IF 
 
         #依照指定模式執行報表列印
         CASE 
            WHEN g_schedule.gzpa003 = "0"
                 CALL afap230_process(ls_js)
 
            WHEN g_schedule.gzpa003 = "1"
                 LET ls_js = afap230_transfer_argv(ls_js)
                 CALL cl_cmdrun(ls_js)
 
            WHEN g_schedule.gzpa003 = "2"
                 CALL cl_schedule_update_data(g_jobid,ls_js)
 
            WHEN g_schedule.gzpa003 = "3"
                 CALL cl_schedule_update_data(g_jobid,ls_js)
         END CASE  
 
         IF g_schedule.gzpa003 = "2" OR g_schedule.gzpa003 = "3" THEN 
            CALL cl_ask_confirm3("std-00014","") #設定完成
         END IF    
         LET g_schedule.gzpa003 = "0" #預設一開始 立即於前景執行
 
         #add-point:ui_dialog段after schedule name="process.after_schedule"
         
         #end add-point
 
         #欄位初始資訊 
         CALL cl_schedule_init_info("all",g_schedule.gzpa003) 
         LET gi_hiden_asign = FALSE 
         LET gi_hiden_exec = FALSE 
         LET gi_hiden_spec = FALSE 
         LET gi_hiden_exec_end = FALSE 
         CALL cl_schedule_hidden()
      END IF
   END WHILE
 
END FUNCTION
 
{</section>}
 
{<section id="afap230.transfer_argv" type="s" >}
#+ 轉換本地參數至cmdrun參數內,準備進入背景執行
PRIVATE FUNCTION afap230_transfer_argv(ls_js)
 
   #add-point:transfer_agrv段define (客製用) name="transfer_agrv.define_customerization"
   
   #end add-point
   DEFINE ls_js       STRING
   DEFINE la_cmdrun   RECORD
             prog       STRING,
             actionid   STRING,
             background LIKE type_t.chr1,
             param      DYNAMIC ARRAY OF STRING
                  END RECORD
   DEFINE la_param    type_parameter
   #add-point:transfer_agrv段define name="transfer_agrv.define"
   
   #end add-point
 
   LET la_cmdrun.prog = g_prog
   LET la_cmdrun.background = "Y"
   LET la_cmdrun.param[1] = ls_js
 
   #add-point:transfer.argv段程式內容 name="transfer.argv.define"
               
   #end add-point
 
   RETURN util.JSON.stringify( la_cmdrun )
END FUNCTION
 
{</section>}
 
{<section id="afap230.process" type="s" >}
#+ 資料處理   (r類使用g_master為主處理/p類使用l_param為主)
PRIVATE FUNCTION afap230_process(ls_js)
 
   #add-point:process段define (客製用) name="process.define_customerization"
   
   #end add-point
   DEFINE ls_js         STRING
   DEFINE lc_param      type_parameter
   DEFINE li_stus       LIKE type_t.num5
   DEFINE li_count      LIKE type_t.num10  #progressbar計量
   DEFINE ls_sql        STRING             #主SQL
   DEFINE li_p01_status LIKE type_t.num5
   #add-point:process段define name="process.define"
               
   #end add-point
 
  #INITIALIZE lc_param TO NULL           #p類不可以清空
   CALL util.JSON.parse(ls_js,lc_param)  #r類作業被t類呼叫時使用, p類主要解開參數處
   LET li_p01_status = 1
 
  #IF lc_param.wc IS NOT NULL THEN
  #   LET g_bgjob = "T"       #特殊情況,此為t類作業鬆耦合串入報表主程式使用
  #END IF
 
   #add-point:process段前處理 name="process.pre_process"
               
   #end add-point
 
   #預先計算progressbar迴圈次數
   IF g_bgjob <> "Y" THEN
      #add-point:process段count_progress name="process.count_progress"
#      CALL afap230_confirm()                         
      #end add-point
   END IF
 
   #主SQL及相關FOREACH前置處理
#  DECLARE afap230_process_cs CURSOR FROM ls_sql
#  FOREACH afap230_process_cs INTO
   #add-point:process段process name="process.process"
               
   #end add-point
#  END FOREACH
 
   IF g_bgjob = "N" THEN
      #前景作業完成處理
      #add-point:process段foreground完成處理 name="process.foreground_finish"
      CALL afap230_confirm()                         
      #end add-point
      CALL cl_ask_confirm3("std-00012","")
   ELSE
      #背景作業完成處理
      #add-point:process段background完成處理 name="process.background_finish"
      CALL afap230_confirm()                        
      #end add-point
      CALL cl_schedule_exec_call(li_p01_status)
   END IF
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL afap230_msgcentre_notify()
 
END FUNCTION
 
{</section>}
 
{<section id="afap230.get_buffer" type="s" >}
PRIVATE FUNCTION afap230_get_buffer(p_dialog)
 
   #add-point:process段define (客製用) name="get_buffer.define_customerization"
   
   #end add-point
   DEFINE p_dialog   ui.DIALOG
   #add-point:process段define name="get_buffer.define"
   
   #end add-point
 
   
   LET g_master.glaald = p_dialog.getFieldBuffer('glaald')
   LET g_master.glaacomp = p_dialog.getFieldBuffer('glaacomp')
   LET g_master.glaa001 = p_dialog.getFieldBuffer('glaa001')
   LET g_master.year = p_dialog.getFieldBuffer('year')
   LET g_master.month = p_dialog.getFieldBuffer('month')
   LET g_master.faah007 = p_dialog.getFieldBuffer('faah007')
   LET g_master.faah003 = p_dialog.getFieldBuffer('faah003')
   LET g_master.faah004 = p_dialog.getFieldBuffer('faah004')
   LET g_master.faah008 = p_dialog.getFieldBuffer('faah008')
   LET g_master.faah006 = p_dialog.getFieldBuffer('faah006')
 
   CALL cl_schedule_get_buffer(p_dialog)
 
   #add-point:get_buffer段其他欄位處理 name="get_buffer.others"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="afap230.msgcentre_notify" type="s" >}
PRIVATE FUNCTION afap230_msgcentre_notify()
 
   #add-point:process段define (客製用) name="msgcentre_notify.define_customerization"
   
   #end add-point
   DEFINE lc_state LIKE type_t.chr5
   #add-point:process段define name="msgcentre_notify.define"
   
   #end add-point
 
   INITIALIZE g_msgparam TO NULL
 
   #action-id與狀態填寫
   LET g_msgparam.state = "process"
 
   #add-point:msgcentre其他通知 name="msg_centre.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
{</section>}
 
{<section id="afap230.other_function" readonly="Y" type="s" >}
#add-point:自定義元件(Function) name="other.function"
################################################################################
# Descriptions...: 查詢
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION afap230_construct()
   DEFINE li_exit  LIKE type_t.num5    #判別是否為離開作業
   DEFINE li_idx   LIKE type_t.num5
   DEFINE ls_js    STRING
   DEFINE ls_wc    STRING
   DEFINE l_dialog ui.DIALOG
   DEFINE lc_param type_parameter
   
   CLEAR FORM
   INITIALIZE g_glaa_m.* TO NULL
   CALL g_faah_d.clear()
   INITIALIZE g_wc2 TO NULL
   
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
      INPUT BY NAME g_glaa_m.glaald,g_glaa_m.year,g_glaa_m.month
       
      
         BEFORE INPUT
            SELECT glaald INTO g_glaa_m.glaald FROM glaa_t
             WHERE glaaent = g_enterprise AND glaacomp = g_site
               AND glaa014 ='Y' 
            DISPLAY BY NAME g_glaa_m.glaald           
            CALL afap230_glaald_desc()
            #161215-00044#1---modify----begin-----------------
            #SELECT * INTO g_glaa_t.* 
            SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,
            glaald,glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,
            glaa011,glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,
            glaa023,glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,
            glaa121,glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,
            glaa139,glaa140,glaa123,glaa124,glaa028 INTO g_glaa_t.*
            #161215-00044#1---modify----end-----------------
            FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_glaa_m.glaald #20141106 add
            LET g_glaa_m.year = YEAR(g_today)
            LET g_glaa_m.month = MONTH(g_today)
            DISPLAY BY NAME g_glaa_m.year,g_glaa_m.month

      
         BEFORE FIELD glaald
         
         AFTER FIELD glaald
        
            IF NOT cl_null(g_glaa_m.glaald) THEN
               IF NOT s_ld_chk_authorization(g_user,g_glaa_m.glaald) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'agl-00165'
                  LET g_errparam.extend = g_glaa_m.glaald
                  LET g_errparam.popup = FALSE
                  CALL cl_err()

                  LET g_glaa_m.glaald = g_glaa_m_t.glaald
                  NEXT FIELD CURRENT
               END IF
               #161215-00044#1---modify----begin-----------------
               #SELECT * INTO g_glaa_t.* 
               SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,
               glaald,glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,
               glaa011,glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,
               glaa023,glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,
               glaa121,glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,
               glaa139,glaa140,glaa123,glaa124,glaa028 INTO g_glaa_t.*
               #161215-00044#1---modify----end-----------------
               FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_glaa_m.glaald #20141106 add
               CALL afap230_glaald_desc()         {#ADP版次:1#}
                                 
            END IF            
                
          ON ACTION controlp INFIELD glaald
	  	     #此段落由子樣板a07產生
            #開窗i段
                        INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_glaa_m.glaald             #給予default值
            LET g_qryparam.arg1 = g_user
            LET g_qryparam.arg2 = g_dept

            #給予arg
            CALL q_authorised_ld()

            LET g_glaa_m.glaald = g_qryparam.return1              #將開窗取得的值回傳到變數


            DISPLAY g_glaa_m.glaald TO glaald              #顯示到畫面上
            #161215-00044#1---modify----begin-----------------
            #SELECT * INTO g_glaa_t.* 
            SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,
            glaald,glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,
            glaa011,glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,
            glaa023,glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,
            glaa121,glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,
            glaa139,glaa140,glaa123,glaa124,glaa028 INTO g_glaa_t.*
            #161215-00044#1---modify----end-----------------
            FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_glaa_m.glaald #20141106 add
            CALL afap230_glaald_desc()

            NEXT FIELD glaald                          #返回原欄位
            
            AFTER FIELD year
               IF NOT cl_null(g_glaa_m.year) AND g_glaa_m.year < 1 THEN
                  LET g_glaa_m.year = g_glaa_m_t.year
                  DISPLAY BY NAME g_glaa_m.year
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'aoo-00113'
                  LET g_errparam.extend = g_glaa_m.year
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  NEXT FIELD CURRENT
               END IF 

            BEFORE FIELD month
               IF cl_null(g_glaa_m.year) THEN
                  NEXT FIELD year
               END IF

            AFTER FIELD month
               IF NOT cl_null(g_glaa_m.month) AND (g_glaa_m.month < 1 OR g_glaa_m.month > 12) THEN
               LET g_glaa_m.month = g_glaa_m_t.month
               DISPLAY BY NAME g_glaa_m.month
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'amm-00106'
               LET g_errparam.extend = g_glaa_m.month
               LET g_errparam.popup = TRUE
               CALL cl_err()

               NEXT FIELD CURRENT
            END IF          {#ADP版次:1#}
            
        AFTER INPUT
     END INPUT
     
     CONSTRUCT BY NAME g_wc2 ON  faah003,faah004,faah006,faah007,faah005,faah008,faah042
       BEFORE CONSTRUCT
          CALL cl_qbe_init() 
              

       ON ACTION controlp INFIELD faah003  #主帳套開窗
	      INITIALIZE g_qryparam.* TO NULL
          LET g_qryparam.state = 'c'
		  LET g_qryparam.reqry = FALSE
          CALL q_faah003()                #呼叫開窗
          DISPLAY g_qryparam.return1 TO faah003 #顯示到畫面上

          NEXT FIELD faah003                    #返回原欄位 
          
       ON ACTION controlp INFIELD faah004     #單據單號開窗
          INITIALIZE g_qryparam.* TO NULL
          LET g_qryparam.state = 'c'
		  LET g_qryparam.reqry = FALSE
          CALL q_faah004()                #呼叫開窗
          DISPLAY g_qryparam.return1 TO faah004 #顯示到畫面上

          NEXT FIELD faah004                    #返回原欄位 
          
       ON ACTION controlp INFIELD faah006     #單據單號開窗
          INITIALIZE g_qryparam.* TO NULL
          LET g_qryparam.state = 'c'
		  LET g_qryparam.reqry = FALSE
          CALL q_faac001()                #呼叫開窗
          DISPLAY g_qryparam.return1 TO faah006 #顯示到畫面上

          NEXT FIELD faah006                    #返回原欄位
          
      ON ACTION controlp INFIELD faah007     #單據單號開窗
          INITIALIZE g_qryparam.* TO NULL
          LET g_qryparam.state = 'c'
		  LET g_qryparam.reqry = FALSE
          CALL q_faad001()                #呼叫開窗
          DISPLAY g_qryparam.return1 TO faah007 #顯示到畫面上

          NEXT FIELD faah007                    #返回原欄位
          
      ON ACTION controlp INFIELD faah008     #單據單號開窗
          INITIALIZE g_qryparam.* TO NULL
          LET g_qryparam.state = 'c'
		  LET g_qryparam.reqry = FALSE
		  LET g_qryparam.arg1 = '3903'
          CALL q_oocq002()                #呼叫開窗
          DISPLAY g_qryparam.return1 TO faah008 #顯示到畫面上

          NEXT FIELD faah008                    #返回原欄位
       
     END CONSTRUCT   
          
     ON ACTION qbe_select      
 
      ON ACTION qbe_save       
      
      ON ACTION accept
         ACCEPT DIALOG
 
      ON ACTION cancel
         LET INT_FLAG = 1
         EXIT DIALOG 
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG
   END DIALOG
   
   
 
 
   IF INT_FLAG THEN
      RETURN
   END IF
END FUNCTION
################################################################################
# Descriptions...: 填充满足条件的数据
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION afap230_b_fill(p_wc2)
DEFINE p_wc2         STRING
DEFINE l_sql         STRING
DEFINE l_cnt         LIKE type_t.num5
DEFINE l_yy          STRING
DEFINE l_mm          STRING
DEFINE l_ym          STRING
#20150526--add--str--lujh
DEFINE l_year        LIKE faan_t.faan001   
DEFINE l_month       LIKE faan_t.faan002   
DEFINE l_colname     STRING
DEFINE l_comment     STRING
DEFINE l_n           LIKE type_t.num5
#20150526--add--end--lujh
DEFINE l_faah015     LIKE faah_t.faah015 #161104-00048#2 add
#170619-00054#1--add--s--xul
DEFINE l_first_day   LIKE type_t.dat
DEFINE l_last_day    LIKE type_t.dat
DEFINE l_days        LIKE type_t.num5 
#170619-00054#1--add--s--xul




    #20150526--add--str--lujh
    CALL cl_err_collect_init()  
    CALL s_azzi902_get_gzzd('afap100',"lbl_faah001") RETURNING l_colname,l_comment  #卡片编号
    LET g_coll_title[1] = l_colname
    CALL s_azzi902_get_gzzd('afap100',"lbl_faah003") RETURNING l_colname,l_comment  #财产编号
    LET g_coll_title[2] = l_colname
    CALL s_azzi902_get_gzzd('afap100',"lbl_faah004") RETURNING l_colname,l_comment  #符号
    LET g_coll_title[3] = l_colname
    #20150526--add--end--lujh

    CALL g_faah_d.clear()
    LET l_cnt = 1
    IF cl_null(p_wc2) THEN
       LET p_wc2 = " 1=1" 
    END IF
    #161111-00049#14--ADD--S--
	 LET p_wc2 = p_wc2 ," AND faah032 IN (SELECT glaacomp FROM glaa_t WHERE glaaent = ",g_enterprise," AND glaald = '",g_glaa_m.glaald,"' ) "
    
    #主要类型限定
    LET l_sql = " SELECT faal001  FROM faal_t  WHERE faalent = ",g_enterprise," AND faalld = '",g_glaa_m.glaald,"'"
    LET p_wc2 = p_wc2," AND faah006 IN (",l_sql,")"
#161214-00063#1 mark s---    
#    #次要类型限定
#    LET l_sql = " SELECT faad001  FROM faad_t  WHERE faadent = ",g_enterprise," AND faad002 IN (SELECT faal001 FROM faal_t WHERE faalent = ",g_enterprise," AND faalld = '",g_glaa_m.glaald,"')" 
#    LET p_wc2 = p_wc2," AND faah007 IN (",l_sql,")"  
#161214-00063#1 mark e---
	 #161111-00049#14--ADD--E--
    #chenying 1126
    LET l_yy = g_glaa_m.year
    LET l_yy = l_yy.trim()
    LET l_yy = l_yy USING "&&&&"
    LET l_mm = g_glaa_m.month
    LET l_mm = l_mm.trim() 
    LET l_mm = l_mm USING "&&"
    LET l_ym = l_yy,l_mm
    #chenying 1126
    
    #20150526--add--str--lujh
    IF g_glaa_m.month = 1 THEN 
       LET l_year = g_glaa_m.year - 1
       LET l_month = 12
    ELSE
       LET l_year = g_glaa_m.year
       LET l_month = g_glaa_m.month - 1
    END IF
    #20150526--add--end--lujh
    #170619-00054#1--add--s--xul
    #起始日期
    LET l_first_day = MDY(l_mm,1,l_yy)
    CALL s_date_get_max_day(l_yy,l_mm) RETURNING l_days
    #截止日期
    LET l_last_day = MDY(l_mm,l_days,l_yy)
    #170619-00054#1--add--e--xul
    # 判斷 資產狀態, 開始折舊年月, 確認碼, 折舊方法, 剩餘月數
    #LET l_sql = " SELECT 'Y',faah003 a,faah004 b,faah001 c,faah015,faah006,'',faah007,'',faah005,faah008,'',faah042,faaj005,faaj016,faaj017,faaj018,faaj021,faah_t.*,faaj_t.*", #20141212 add by chening faah001,faah015 #161104-00048#2 mark
    #LET l_sql = " SELECT 'Y',faah003 a,faah004 b,faah001 c,faaj038,faah006,'',faah007,'',faah005,faah008,'',faah042,faaj005,faaj016,faaj017,faaj018,faaj021,faah_t.*,faaj_t.*,", #20141212 add by chening faah001,faah015  #161104-00048#2 add faah015-->faaj038  #170207-00036#1 mark lujh
    #170207-00036#1--add--str--lujh
    LET l_sql = " SELECT 'Y',faah003 a,faah004 b,faah001 c,faaj038,faah006,'',faah007,'',faah005,faah008,'',faah042,faaj005,faaj016,faaj017,faaj018,faaj021,",              
                #faah_t
                "        faahent,faah000,faah001,faah002,faah003,faah004,faah005,faah006,faah007,faah008,",
                "        faah009,faah010,faah011,faah012,faah013,faah014,faah015,faah016,faah017,faah018,",
                "        faah019,faah020,faah021,faah022,faah023,faah024,faah025,faah026,faah027,faah028,",
                "        faah029,faah030,faah031,faah032,faah033,faah034,faah035,faah036,faah037,faah038,",
                "        faah039,faah040,faah041,faah042,faah043,faah044,faah045,faahownid,faahowndp,faahcrtid,",
                "        faahcrtdp,faahcrtdt,faahmodid,faahmoddt,faahstus,faah046,faahud001,faahud002,faahud003,",
                "        faahud004,faahud005,faahud006,faahud007,faahud008,faahud009,faahud010,faahud011,faahud012,",
                "        faahud013,faahud014,faahud015,faahud016,faahud017,faahud018,faahud019,faahud020,faahud021,",
                "        faahud022,faahud023,faahud024,faahud025,faahud026,faahud027,faahud028,faahud029,faahud030,",
                "        faah047,faah048,faah049,faah050,faah051,faah052,faah053,faah054,faah055,faah056,faah057,faah058,",
                #faaj_t
                "        faajent,faajld,faajsite,faaj000,faaj001,faaj002,faaj003,faaj004,faaj005,faaj006,",
                "        faaj007,faaj008,faaj009,faaj010,faaj011,faaj012,faaj013,faaj014,faaj015,faaj016,",
                "        faaj017,faaj018,faaj019,faaj020,faaj021,faaj022,faaj023,faaj024,faaj025,faaj026,",
                "        faaj027,faaj028,faaj029,faaj030,faaj031,faaj032,faaj033,faaj034,faaj035,faaj036,",
                "        faaj037,faaj038,faaj039,faaj040,faaj041,faaj042,faaj043,faaj044,faaj045,faaj046,",
                "        faaj047,faaj101,faaj102,faaj103,faaj104,faaj105,faaj106,faaj107,faaj108,faaj109,",
                "        faaj110,faaj111,faaj112,faaj113,faaj114,faaj115,faaj116,faaj117,faaj151,faaj152,",
                "        faaj153,faaj154,faaj155,faaj156,faaj157,faaj158,faaj159,faaj160,faaj161,faaj162,",
                "        faaj163,faaj164,faaj165,faaj166,faaj167,faajownid,faajowndp,faajcrtid,faajcrtdp,",
                "        faajcrtdt,faajmodid,faajmoddt,faajstus,faaj048,",
    #170207-00036#1--add--end--lujh
                "        faah015 ",  #161104-00048#2 add     
                "   FROM faah_t,faaj_t ",
                "  WHERE faahent = faajent AND faah000 =faaj000",
                "    AND faah003 = faaj001 AND faah004 = faaj002",
                "    AND faah001 = faaj037 ", #20141212 add by chening
                "    AND faahent = '",g_enterprise,"'",
                "    AND faajld  = '",g_glaa_m.glaald,"'",
                "    AND faah015 NOT IN ('0','4','5','6','7','10' )", #20141214 add 10:被资本化 by chenying  
                "    AND faah042 NOT IN ('2','5')",
                "    AND faaj038 NOT IN ('4','7')", #161104-00048#2 add 
                "    AND (faaj028 - faaj021-faaj027 ) > 0 AND faahstus = 'Y' ",
                "    AND faaj008 <= '",l_ym,"'", #chenying 1126
                "    AND faah006 NOT IN (SELECT DISTINCT faac001 FROM faac_t WHERE faacent = faahent AND faah006 = faac001 AND faac003 =5)", #20150825 
                "    AND faaj003 != 5 ",         #Hans20150824
                "    AND faaj048 ='2' ",    #160426-00014#28 by 07900 add
                "    AND faaj019 <> faaj028 ", #170630-00014#1---add
                "    AND ",p_wc2 CLIPPED
    LET l_sql = l_sql CLIPPED," UNION ",
                #" SELECT 'Y',faah003 a,faah004 b,faah001 c,faah015,faah006,'',faah007,'',faah005,faah008,'',faah042,faaj005,faaj016,faaj017,faaj018,faaj021,faah_t.*,faaj_t.*", #20141212 add by chening faah001,faah015 #161104-00048#2 mark 
                #" SELECT 'Y',faah003 a,faah004 b,faah001 c,faaj038,faah006,'',faah007,'',faah005,faah008,'',faah042,faaj005,faaj016,faaj017,faaj018,faaj021,faah_t.*,faaj_t.*,", #20141212 add by chening faah001,faah015  #161104-00048#2 add faah015-->faaj038  #170207-00036#1 mark lujh
                #170207-00036#1--add--str--lujh
                " SELECT 'Y',faah003 a,faah004 b,faah001 c,faaj038,faah006,'',faah007,'',faah005,faah008,'',faah042,faaj005,faaj016,faaj017,faaj018,faaj021,",
                #faah_t
                "        faahent,faah000,faah001,faah002,faah003,faah004,faah005,faah006,faah007,faah008,",
                "        faah009,faah010,faah011,faah012,faah013,faah014,faah015,faah016,faah017,faah018,",
                "        faah019,faah020,faah021,faah022,faah023,faah024,faah025,faah026,faah027,faah028,",
                "        faah029,faah030,faah031,faah032,faah033,faah034,faah035,faah036,faah037,faah038,",
                "        faah039,faah040,faah041,faah042,faah043,faah044,faah045,faahownid,faahowndp,faahcrtid,",
                "        faahcrtdp,faahcrtdt,faahmodid,faahmoddt,faahstus,faah046,faahud001,faahud002,faahud003,",
                "        faahud004,faahud005,faahud006,faahud007,faahud008,faahud009,faahud010,faahud011,faahud012,",
                "        faahud013,faahud014,faahud015,faahud016,faahud017,faahud018,faahud019,faahud020,faahud021,",
                "        faahud022,faahud023,faahud024,faahud025,faahud026,faahud027,faahud028,faahud029,faahud030,",
                "        faah047,faah048,faah049,faah050,faah051,faah052,faah053,faah054,faah055,faah056,faah057,faah058,",
                #faaj_t
                "        faajent,faajld,faajsite,faaj000,faaj001,faaj002,faaj003,faaj004,faaj005,faaj006,",
                "        faaj007,faaj008,faaj009,faaj010,faaj011,faaj012,faaj013,faaj014,faaj015,faaj016,",
                "        faaj017,faaj018,faaj019,faaj020,faaj021,faaj022,faaj023,faaj024,faaj025,faaj026,",
                "        faaj027,faaj028,faaj029,faaj030,faaj031,faaj032,faaj033,faaj034,faaj035,faaj036,",
                "        faaj037,faaj038,faaj039,faaj040,faaj041,faaj042,faaj043,faaj044,faaj045,faaj046,",
                "        faaj047,faaj101,faaj102,faaj103,faaj104,faaj105,faaj106,faaj107,faaj108,faaj109,",
                "        faaj110,faaj111,faaj112,faaj113,faaj114,faaj115,faaj116,faaj117,faaj151,faaj152,",
                "        faaj153,faaj154,faaj155,faaj156,faaj157,faaj158,faaj159,faaj160,faaj161,faaj162,",
                "        faaj163,faaj164,faaj165,faaj166,faaj167,faajownid,faajowndp,faajcrtid,faajcrtdp,",
                "        faajcrtdt,faajmodid,faajmoddt,faajstus,faaj048,",
                #170207-00036#1--add--end--lujh
                "        faah015 ",  #161104-00048#2 add                 
                "   FROM faah_t,faaj_t ",
                "  WHERE faahent = faajent AND faah000 =faaj000",
                "    AND faah003 = faaj001 AND faah004 = faaj002",
                "    AND faah001 = faaj037 ", #20141212 add by chening
                "    AND faahent = '",g_enterprise,"'",
                "    AND faajld  = '",g_glaa_m.glaald,"'",  #折畢再提/續提
                "    AND faah015 IN ('7' )",  
                "    AND faaj038 IN ('7' )",  #161104-00048#2 add
#                "    AND faaj028 > 0 AND faahstus = 'Y' ", #20141218 mark by chenying
                "    AND faahstus = 'Y' ",                  #20141218 add by chenying(wangxia规格调整)
                "    AND faah006 NOT IN (SELECT DISTINCT faac001 FROM faac_t WHERE faacent = faahent AND faah006 = faac001 AND faac003 =5)" ,#20150825
                "    AND faaj008 <= '",l_ym,"'", #chenying 1126
                "    AND faaj003 != 5 ",         #20150824
                "    AND faaj048 ='2' ",    #160426-00014#28 by 07900 add
                #170919-00013#1   by  09505  mark    --(S)--
#                "    AND faaj019 <> faaj028 ", #170630-00014#1---add     
                #170919-00013#1   by  09505  mark    --(E)--
                "    AND ",p_wc2 CLIPPED
    LET l_sql = l_sql CLIPPED,"  ORDER BY a,b,c " #20141212 add c by chening
    
    LET l_cnt = 1
    PREPARE afap230_bp_pre FROM l_sql
    DECLARE afap230_bp_cs CURSOR FOR afap230_bp_pre
    #FOREACH afap230_bp_cs INTO g_faah_d[l_cnt].*,g_faah1.*,g_faaj1.*          #161104-00048#2 mark
    #FOREACH afap230_bp_cs INTO g_faah_d[l_cnt].*,g_faah1.*,g_faaj1.*,l_faah015 #161104-00048#2 add   #170207-00036#1 mark lujh
    #170207-00036#1--add--str--lujh
    FOREACH afap230_bp_cs INTO g_faah_d[l_cnt].*,
                               #faah_t
                               g_faah1.faahent,g_faah1.faah000,g_faah1.faah001,g_faah1.faah002,g_faah1.faah003,
                               g_faah1.faah004,g_faah1.faah005,g_faah1.faah006,g_faah1.faah007,g_faah1.faah008,
                               g_faah1.faah009,g_faah1.faah010,g_faah1.faah011,g_faah1.faah012,g_faah1.faah013,
                               g_faah1.faah014,g_faah1.faah015,g_faah1.faah016,g_faah1.faah017,g_faah1.faah018,
                               g_faah1.faah019,g_faah1.faah020,g_faah1.faah021,g_faah1.faah022,g_faah1.faah023,
                               g_faah1.faah024,g_faah1.faah025,g_faah1.faah026,g_faah1.faah027,g_faah1.faah028,
                               g_faah1.faah029,g_faah1.faah030,g_faah1.faah031,g_faah1.faah032,g_faah1.faah033,
                               g_faah1.faah034,g_faah1.faah035,g_faah1.faah036,g_faah1.faah037,g_faah1.faah038,
                               g_faah1.faah039,g_faah1.faah040,g_faah1.faah041,g_faah1.faah042,g_faah1.faah043,
                               g_faah1.faah044,g_faah1.faah045,g_faah1.faahownid,g_faah1.faahowndp,g_faah1.faahcrtid,
                               g_faah1.faahcrtdp,g_faah1.faahcrtdt,g_faah1.faahmodid,g_faah1.faahmoddt,g_faah1.faahstus,
                               g_faah1.faah046,g_faah1.faahud001,g_faah1.faahud002,g_faah1.faahud003,g_faah1.faahud004,
                               g_faah1.faahud005,g_faah1.faahud006,g_faah1.faahud007,g_faah1.faahud008,g_faah1.faahud009,
                               g_faah1.faahud010,g_faah1.faahud011,g_faah1.faahud012,g_faah1.faahud013,g_faah1.faahud014,
                               g_faah1.faahud015,g_faah1.faahud016,g_faah1.faahud017,g_faah1.faahud018,g_faah1.faahud019,
                               g_faah1.faahud020,g_faah1.faahud021,g_faah1.faahud022,g_faah1.faahud023,g_faah1.faahud024,
                               g_faah1.faahud025,g_faah1.faahud026,g_faah1.faahud027,g_faah1.faahud028,g_faah1.faahud029,
                               g_faah1.faahud030,g_faah1.faah047,g_faah1.faah048,g_faah1.faah049,g_faah1.faah050,
                               g_faah1.faah051,g_faah1.faah052,g_faah1.faah053,g_faah1.faah054,g_faah1.faah055,
                               g_faah1.faah056,g_faah1.faah057,g_faah1.faah058,
                               #faaj_t
                               g_faaj1.faajent,g_faaj1.faajld ,g_faaj1.faajsite,g_faaj1.faaj000,g_faaj1.faaj001,
                               g_faaj1.faaj002,g_faaj1.faaj003,g_faaj1.faaj004,g_faaj1.faaj005,g_faaj1.faaj006,
                               g_faaj1.faaj007,g_faaj1.faaj008,g_faaj1.faaj009,g_faaj1.faaj010,g_faaj1.faaj011,
                               g_faaj1.faaj012,g_faaj1.faaj013,g_faaj1.faaj014,g_faaj1.faaj015,g_faaj1.faaj016,
                               g_faaj1.faaj017,g_faaj1.faaj018,g_faaj1.faaj019,g_faaj1.faaj020,g_faaj1.faaj021,
                               g_faaj1.faaj022,g_faaj1.faaj023,g_faaj1.faaj024,g_faaj1.faaj025,g_faaj1.faaj026,
                               g_faaj1.faaj027,g_faaj1.faaj028,g_faaj1.faaj029,g_faaj1.faaj030,g_faaj1.faaj031,
                               g_faaj1.faaj032,g_faaj1.faaj033,g_faaj1.faaj034,g_faaj1.faaj035,g_faaj1.faaj036,
                               g_faaj1.faaj037,g_faaj1.faaj038,g_faaj1.faaj039,g_faaj1.faaj040,g_faaj1.faaj041,
                               g_faaj1.faaj042,g_faaj1.faaj043,g_faaj1.faaj044,g_faaj1.faaj045,g_faaj1.faaj046,
                               g_faaj1.faaj047,g_faaj1.faaj101,g_faaj1.faaj102,g_faaj1.faaj103,g_faaj1.faaj104,
                               g_faaj1.faaj105,g_faaj1.faaj106,g_faaj1.faaj107,g_faaj1.faaj108,g_faaj1.faaj109,
                               g_faaj1.faaj110,g_faaj1.faaj111,g_faaj1.faaj112,g_faaj1.faaj113,g_faaj1.faaj114,
                               g_faaj1.faaj115,g_faaj1.faaj116,g_faaj1.faaj117,g_faaj1.faaj151,g_faaj1.faaj152,
                               g_faaj1.faaj153,g_faaj1.faaj154,g_faaj1.faaj155,g_faaj1.faaj156,g_faaj1.faaj157,
                               g_faaj1.faaj158,g_faaj1.faaj159,g_faaj1.faaj160,g_faaj1.faaj161,g_faaj1.faaj162,
                               g_faaj1.faaj163,g_faaj1.faaj164,g_faaj1.faaj165,g_faaj1.faaj166,g_faaj1.faaj167,
                               g_faaj1.faajownid,g_faaj1.faajowndp,g_faaj1.faajcrtid,g_faaj1.faajcrtdp,g_faaj1.faajcrtdt,
                               g_faaj1.faajmodid,g_faaj1.faajmoddt,g_faaj1.faajstus,g_faaj1.faaj048,
                               l_faah015
      #170207-00036#1--add--end--lujh
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "FOREACH:"
            LET g_errparam.popup = TRUE
            CALL cl_err()

            EXIT FOREACH
         END IF
         
         #170619-00054#1--add--s--xul
         #若资产在该月已折旧过，并在afat509里已审核/已过账，则afap230不再显示
         LET l_n = 0
         SELECT COUNT(1) 
           INTO l_n
           FROM fabg_t,fabh_t
          WHERE fabgent = fabhent 
            AND fabgdocno = fabhdocno 
            AND fabgld = fabhld
            AND fabgent = g_enterprise            
            AND fabg005 = '0'
            AND fabgld = g_glaa_m.glaald 
            AND fabgdocdt <= l_last_day
            AND fabgdocdt >= l_first_day
            AND fabgstus IN ('Y','S')
            AND fabh001 = g_faah_d[l_cnt].faah003
            AND fabh002 = g_faah_d[l_cnt].faah004
            AND fabh000 = g_faah_d[l_cnt].faah001 
         IF l_n > 0 THEN
            #170619-00054#2--mark--s--xul
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.code = 'afa-01180'
#            LET g_errparam.extend = g_faah_d[l_cnt].faah003,'/',g_faah_d[l_cnt].faah004,'/',g_faah_d[l_cnt].faah001
#            LET g_errparam.popup = TRUE
#            CALL cl_err()
            #170619-00054#2--mark--e--xul            
            CONTINUE FOREACH 
         END IF
         #170619-00054#1--add--e--xul

         #170417-00045#1--add--s--xul
         #检核当前月大于开始折旧年月，若是，检核 上月是否折旧，若没有，则报错，上月没有折旧
         IF l_ym > g_faaj1.faaj008 THEN
            LET l_n = 0
            SELECT COUNT(1) INTO l_n
              FROM faam_t
             WHERE faament = g_enterprise
               AND faamld  = g_glaa_m.glaald
               AND faam004 = l_year
               AND faam005 = l_month
               AND faam000 = g_faah_d[l_cnt].faah001
               AND faam001 = g_faah_d[l_cnt].faah003
               AND faam002 = g_faah_d[l_cnt].faah004
            IF l_n = 0 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'afa-01160'
               LET g_errparam.extend = g_faah_d[l_cnt].faah003,'/',g_faah_d[l_cnt].faah004,'/',g_faah_d[l_cnt].faah001
               LET g_errparam.popup = TRUE
               LET g_errparam.coll_vals[1] = g_faah_d[l_cnt].faah001      
               LET g_errparam.coll_vals[2] = g_faah_d[l_cnt].faah003
               LET g_errparam.coll_vals[3] = g_faah_d[l_cnt].faah004
               CALL cl_err()
               
               CONTINUE FOREACH
            END IF           
             
        #END IF  #170619-00054#1 xul mark 
         
         #170417-00045#1--add--e--xul
         #20150526--add--str--lujh
         #计提本月折旧时检核上月是否已经月结了，上月没有月结就不能执行,如果改资产是新增的则不需要检核
         LET l_n = 0
         SELECT COUNT(*) INTO l_n
           FROM faam_t
          WHERE faament = g_enterprise
            AND faamld = g_glaa_m.glaald
            AND faam000 = g_faah_d[l_cnt].faah001
            AND faam001 = g_faah_d[l_cnt].faah003
            AND faam002 = g_faah_d[l_cnt].faah004
            
         IF l_n > 0 THEN 
            LET g_cnt = 0
            SELECT COUNT(*) INTO g_cnt
              FROM faan_t
             WHERE faanent = g_enterprise
               AND faan001 = l_year
               AND faan002 = l_month
               AND faan003 = g_faah_d[l_cnt].faah001
               AND faan004 = g_faah_d[l_cnt].faah003
               AND faan005 = g_faah_d[l_cnt].faah004
               AND faanld = g_glaa_m.glaald
               
            IF g_cnt = 0 THEN 
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'afa-01020'
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               CALL cl_err()
               
               CONTINUE FOREACH
            END IF
         END IF
         #20150526--add--end--lujh
         END IF #170619-00054#1 xul add 
         #抓取參數資料
         SELECT faal002,faal003,faal004,faal005 
           INTO g_faal[l_cnt].faal002,g_faal[l_cnt].faal003,g_faal[l_cnt].faal004,g_faal[l_cnt].faal005 
           FROM faal_t
          WHERE faalent = g_enterprise AND faalld = g_glaa_m.glaald
            AND faal001 = g_faah1.faah006
#为空或者不存在afai021的资料也要在单身显示         
#         IF cl_null(g_faal[l_cnt].faal002) THEN LET g_faal[l_cnt].faal002 = 'N' END IF
#         IF cl_null(g_faal[l_cnt].faal003) THEN LET g_faal[l_cnt].faal003 = 'N' END IF
#         IF cl_null(g_faal[l_cnt].faal004) THEN LET g_faal[l_cnt].faal004 = 'N' END IF
#         IF cl_null(g_faal[l_cnt].faal005) THEN LET g_faal[l_cnt].faal005 = '2' END IF
         
         IF g_faal[l_cnt].faal002 = 'N' THEN
            #IF g_faah_d[l_cnt].faah015 = '8' THEN #161104-00048#2 mark
            IF l_faah015= '8' THEN                 #161104-00048#2 add
               CONTINUE FOREACH
            END IF
         END IF
         
         #--折舊月份已提列折舊,則不再提列(訊息不列入清單中)
         LET g_cnt = 0
         SELECT COUNT(*) INTO g_cnt FROM faam_t
          WHERE faament = g_enterprise 
            AND faam001=g_faah_d[l_cnt].faah003 AND faam002=g_faah_d[l_cnt].faah004
            AND faam000=g_faah_d[l_cnt].faah001 #20141212 add by chening
            AND faam004=g_glaa_m.year AND faam005=g_glaa_m.month
            AND faamld = g_glaa_m.glaald  #171227-00035#1 add
         IF g_cnt > 0 THEN
            #170619-00054#1--add--s--xul
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'afa-01181'
            LET g_errparam.extend = g_faah_d[l_cnt].faah003,'/',g_faah_d[l_cnt].faah004,'/',g_faah_d[l_cnt].faah001
            LET g_errparam.popup = TRUE
            CALL cl_err()
            #170619-00054#1--add--e--xul
            CONTINUE FOREACH
         END IF
         
         #--折舊月份已提列折舊,則不再提列(訊息不列入清單中)
         LET g_cnt = 0
         SELECT COUNT(*) INTO g_cnt FROM faam_t
          WHERE faament = g_enterprise AND faam001=g_faah_d[l_cnt].faah003 AND faam002=g_faah_d[l_cnt].faah004
            AND faam000 = g_faah_d[l_cnt].faah001 #20141212 add by chening
            AND (faam004>g_glaa_m.year OR (faam004=g_glaa_m.year AND faam005>=g_glaa_m.month))
            AND faam007 <> '3' AND faam006='1'
            AND faamld = g_glaa_m.glaald  #171227-00035#1 add
         IF g_cnt > 0 THEN
            CONTINUE FOREACH
         END IF

         LET g_faah[l_cnt].* = g_faah1.*
         LET g_faaj[l_cnt].* = g_faaj1.*
         LET g_faah[l_cnt].faah015 = g_faah_d[l_cnt].faah015 #161104-00048#2 add
        #LET g_faah_d[l_cnt].* = g_faah1_d.*
         
         SELECT faacl003 INTO g_faah_d[l_cnt].faah006_desc FROM faacl_t
          WHERE faaclent = g_enterprise AND faacl001 = g_faah_d[l_cnt].faah006
            AND faacl002 = g_dlang
         SELECT faadl003 INTO g_faah_d[l_cnt].faah007_desc FROM faadl_t
          WHERE faadlent = g_enterprise AND faadl001 = g_faah_d[l_cnt].faah007
            AND faadl002 = g_dlang
         SELECT oocql004 INTO g_faah_d[l_cnt].faah008_desc FROM oocql_t
          WHERE oocqlent = g_enterprise AND oocql001 = '3903'
            AND oocql002 = g_faah_d[l_cnt].faah008
            AND oocql003 = g_dlang
            
  
         LET l_cnt = l_cnt + 1
         IF l_cnt > g_max_rec THEN
            EXIT FOREACH
         END IF         
    END FOREACH
    CALL g_faah_d.deleteElement(g_faah_d.getLength())
    
    CALL cl_err_collect_show()   #20150526 add lujh
END FUNCTION
################################################################################
# Descriptions...: 帐套栏位带值
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION afap230_glaald_desc()
DEFINE l_str1      LIKE type_t.chr80
DEFINE l_str2      LIKE type_t.chr80
DEFINE l_ooall004  LIKE ooall_t.ooall004
#DEFINE l_ooeal003  LIKE ooeal_t.ooeal003        #170425-00037#7 mark by wanghaoz 2017/09/07
DEFINE l_ooefl003  LIKE ooefl_t.ooefl003        #170425-00037#7 add by wanghaoz 2017/09/07

   SELECT glaa001 INTO g_glaa_m.glaa001
     FROM glaa_t
    WHERE glaaent=g_enterprise AND glaald = g_glaa_m.glaald

   #帳套
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_glaa_m.glaald
   CALL ap_ref_array2(g_ref_fields,"SELECT glaal002 FROM glaal_t WHERE glaalent='"||g_enterprise||"' AND glaalld=? AND glaal001='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_glaa_m.glaald_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_glaa_m.glaald_desc

   #法人
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_glaa_m.glaacomp
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_glaa_m.glaacomp_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_glaa_m.glaacomp,g_glaa_m.glaacomp_desc
   
   #幣別   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_glaa_m.glaa001
   CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_glaa_m.glaa001_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_glaa_m.glaa001,g_glaa_m.glaa001_desc 
END FUNCTION
################################################################################
# Descriptions...: 资料检查
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION afap230_fill_chk()

END FUNCTION
################################################################################
# Descriptions...: 帐套带本位币二，本位币三币别及汇率
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION afap230_glaald_get()
DEFINE r_faam152    LIKE faam_t.faam152
DEFINE r_faam102    LIKE faam_t.faam102

   SELECT glaa001,glaa004,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,glaacomp
     INTO g_glaa001,g_glaa004,g_glaa015,g_glaa016,g_glaa017,g_glaa018,g_glaa019,g_glaa020,g_glaa021,g_glaa022,g_glaacomp
     FROM glaa_t
    WHERE glaaent = g_enterprise
      AND glaald = g_glaa_m.glaald
   IF NOT cl_null(g_glaa_m.glaald) THEN   
      IF g_glaa015 = 'Y' THEN
         #-----本位币二-------
                                  #匯率參照表;帳套;       日期;    來源幣別
         CALL s_aooi160_get_exrate('2',g_glaa_m.glaald,g_today,g_glaa001,
                                   #目的幣別;      交易金額; 匯類類型
                                   g_glaa016,0,g_glaa018)
         RETURNING r_faam102
      END IF
      IF g_glaa019 = 'Y' THEN
         #-----本位币三-------
                                  #匯率參照表;帳套;       日期;    來源幣別
         CALL s_aooi160_get_exrate('2',g_glaa_m.glaald,g_today,g_glaa001,
                                   #目的幣別;      交易金額; 匯類類型
                                   g_glaa020,0,g_glaa018)
         RETURNING r_faam152

      END IF
   END IF
   RETURN r_faam102,r_faam152
END FUNCTION
################################################################################
# Descriptions...: 资料摊提
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION afap230_confirm()
DEFINE l_msg       STRING
DEFINE l_n         LIKE type_t.num5
DEFINE l_i         LIKE type_t.num5
DEFINE l_amt       LIKE type_t.num20_6
DEFINE l_amt_o     LIKE type_t.num20_6
DEFINE l_cost      LIKE type_t.num20_6
DEFINE l_accd      LIKE type_t.num20_6
DEFINE l_fabb005   LIKE fabb_t.fabb005
DEFINE l_faah043   LIKE faah_t.faah043
DEFINE l_rate_y    LIKE type_t.num20_6
DEFINE l_rate      LIKE type_t.num20_6
DEFINE l_cnt       LIKE type_t.num5    
DEFINE l_cnt1      LIKE type_t.num5   
DEFINE p_yy,p_mm   LIKE type_t.num5
DEFINE l_faam015   LIKE faam_t.faam015
DEFINE l_faam016   LIKE faam_t.faam016
DEFINE l_over      LIKE type_t.chr1
DEFINE l_amt_y     LIKE type_t.num20_6
DEFINE l_fabb005_1 LIKE fabb_t.fabb005,
       l_faam009   LIKE faam_t.faam009,
       l_curr      LIKE type_t.num20_6,
       l_curr_y    LIKE type_t.num20_6,
       l_faah015   LIKE faah_t.faah015,
       l_faaf004   LIKE faaf_t.faaf004,
       l_faag007   LIKE faag_t.faag007,
       m_faag007   LIKE faag_t.faag007,
       m_faam013   LIKE faam_t.faam013,
       m_faam014   LIKE faam_t.faam014,
       m_faam015   LIKE faam_t.faam015,
       m_faam016   LIKE faam_t.faam016,
       m_faam018   LIKE faam_t.faam018,
       m_ratio,mm_ratio  LIKE type_t.num26_10,
       m_max_ratio  LIKE type_t.num26_10,
       m_curr      LIKE type_t.num20_6,
       y_curr      LIKE type_t.num20_6,
       m_tot       LIKE type_t.num20_6,
       p_faam015   LIKE faam_t.faam015,
       p_faam016   LIKE faam_t.faam016,
       p_faam015_1 LIKE faam_t.faam015,
       p_faam016_1 LIKE faam_t.faam016,
       mm_faag007  LIKE faag_t.faag007,
       mm_faam013  LIKE faam_t.faam013,
       mm_faam014  LIKE faam_t.faam014,
       mm_faam015  LIKE faam_t.faam015,
       mm_faam016  LIKE faam_t.faam016,
       mm_faam018  LIKE faam_t.faam018,
       l_faam013   LIKE faam_t.faam013,
       l_faam017   LIKE faam_t.faam017,
       m_tot_faam013  LIKE faam_t.faam013,
       m_tot_curr     LIKE faam_t.faam016,
       m_tot_faam014  LIKE faam_t.faam014,
       m_tot_faam015  LIKE faam_t.faam015,
       m_tot_faam018  LIKE faam_t.faam018,
       l_diff         LIKE faam_t.faam013,
       l_diff2        LIKE faam_t.faam013,
       m_glar         LIKE glar_t.glar005,
       m_faag005      LIKE faag_t.faag005,
       m_max_faag005  LIKE faag_t.faag005,
       l_faaj029      LIKE faaj_t.faaj029,
       l_faam010      LIKE faam_t.faam010,
       l_ooab002      LIKE ooab_t.ooab002,
       l_glac007      LIKE glac_t.glac007
DEFINE l_ooaj003      LIKE ooaj_t.ooaj003
DEFINE l_ooaj004      LIKE ooaj_t.ooaj004
DEFINE l_ooaj0042     LIKE ooaj_t.ooaj004
DEFINE l_ooaj0043     LIKE ooaj_t.ooaj004
#20141106
DEFINE l_faam013_1   LIKE faam_t.faam013
DEFINE l_faam014_1   LIKE faam_t.faam014
DEFINE l_faam015_1   LIKE faam_t.faam015
DEFINE l_faam016_1   LIKE faam_t.faam016
DEFINE l_faam018_1   LIKE faam_t.faam018
DEFINE l_amt_1       LIKE type_t.num20_6
DEFINE l_amt_Y_1     LIKE type_t.num20_6
#20141106
DEFINE l_ym          STRING  #chenying 1126
DEFINE l_faaf002     LIKE faaf_t.faaf002  #160426-00014#6 
DEFINE l_faaf001     LIKE faaf_t.faaf001  #160426-00014#39 add lujh
DEFINE l_faaj038     LIKE faaj_t.faaj038  #161104-00048#2 add

  #CALL cl_showmsg_init()       #150731-00004#1 20150807 mark
   CALL cl_err_collect_init()   #150731-00004#1 20150807 add
   LET g_success = 'Y'
   CALL s_transaction_begin()
   
   
   #170619-00054#1--mark--s--xul
   #chenying 1126
   #提示此资产中心账套年度期别是否已存在总账凭证
#   SELECT COUNT(*) INTO l_n FROM faam_t
#    WHERE faament = g_enterprise AND faamld = g_glaa_m.glaald
#      AND faam004 = g_glaa_m.year AND faam005 = g_glaa_m.month
#      AND faam024 IS NOT NULL
#   IF l_n > 0 THEN
#      LET l_ym = g_glaa_m.year,' ',g_glaa_m.month
#     #CALL cl_errmsg(g_glaa_m.glaald,l_ym,'','afa-00299',1)
#      #150731-00004#1 20150807 str---
#      #CALL cl_errmsg(g_glaa_m.glaald,l_ym,'','afa-00299',1)
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = 'afa-00299'
#      LET g_errparam.extend = g_glaa_m.glaald||' '||l_ym
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#      #150731-00004#1 20150807 end---
#   END IF
#   #chenying 1126
   #170619-00054#1--mark--e--xul      
   FOR l_cnt = 1 TO g_faah.getLength()
      IF g_faah_d[l_cnt].check = 'Y' THEN
         LET l_amt_y = 0   #add by huangtao
         
         #抓取參數資料
         LET l_n = 0
         LET l_msg = ''
         SELECT COUNT(*) INTO l_n FROM faal_t
          WHERE faalent = g_enterprise AND faalld = g_glaa_m.glaald
            AND faal001 = g_faah[l_cnt].faah006
            AND faalstus <> 'X' #161123-00011#2 add
         IF l_n = 0 THEN
           #LET l_msg = g_glaa_m.glaald," ",g_faah[l_cnt].faah006
           #CALL cl_errmsg('faalld,faal001',g_glaa_m.glaald||g_faah[l_cnt].faah006,'','afa-00240',1)
            #150731-00004#1 20150807 str---
            #CALL cl_errmsg('',g_glaa_m.glaald||' '||g_faah[l_cnt].faah006,'','afa-00240',1)
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'afa-00240'
            LET g_errparam.extend = g_glaa_m.glaald||' '||g_faah[l_cnt].faah006
            LET g_errparam.popup = TRUE
            CALL cl_err()
            #150731-00004#1 20150807 end---
            LET g_success='N'
            CONTINUE FOR
         END IF
         #170919-00013#1   by  09505  mark    --(S)--
         #170630-00014#1---add----str
#         IF g_faaj[l_cnt].faaj019 = g_faaj[l_cnt].faaj028  THEN
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.code = 'afa-01165'
#            LET g_errparam.extend = g_glaa_m.glaald||' '||g_faah[l_cnt].faah003
#            LET g_errparam.popup = TRUE
#            CALL cl_err()
#            LET g_success='N'
#            CONTINUE FOR
#         END IF
         #170630-00014#1---add----end
         #170919-00013#1   by  09505  mark    --(E)--
            
         #--折舊月份已提列折舊,則不再提列(訊息不列入清單中)
         LET g_cnt = 0
         SELECT COUNT(*) INTO g_cnt FROM faam_t
          WHERE faam001=g_faah[l_cnt].faah003 AND faam002=g_faah[l_cnt].faah004
            AND faam000=g_faah[l_cnt].faah001 #20141212 add by chening
            AND (faam004>g_glaa_m.year OR (faam004=g_glaa_m.year AND faam005>=g_glaa_m.month))
            AND faam007 <> '3' AND faam006='1'
            AND faament = g_enterprise #160905-00007#1 add
            AND faamld = g_glaa_m.glaald  #171227-00035#1 add
         IF g_cnt > 0 THEN
            CONTINUE FOR
         END IF
         
          #--若在折舊月份前就為先前折畢
         IF ((g_faaj[l_cnt].faaj005 = 0 AND g_faaj[l_cnt].faaj003 <> '4' ) 
            OR (g_faaj[l_cnt].faaj003 = '4' AND g_faah[l_cnt].faah043 <= g_faah[l_cnt].faah044)) 
            AND ( g_faaj[l_cnt].faaj009 < g_glaa_m.year OR 
            (g_faaj[l_cnt].faaj003=g_glaa_m.year and g_faaj[l_cnt].faaj010 < g_glaa_m.month )) THEN
            LET l_over = 'Y'
         ELSE
            LET l_over = 'N'
         END IF
         
         IF cl_null(g_faaj[l_cnt].faaj016) THEN LET g_faaj[l_cnt].faaj016 = 0 END IF
         IF cl_null(g_faaj[l_cnt].faaj017) THEN LET g_faaj[l_cnt].faaj017 = 0 END IF
         IF cl_null(g_faaj[l_cnt].faaj018) THEN LET g_faaj[l_cnt].faaj018 = 0 END IF
         IF cl_null(g_faaj[l_cnt].faaj019) THEN LET g_faaj[l_cnt].faaj019 = 0 END IF
         IF cl_null(g_faaj[l_cnt].faaj020) THEN LET g_faaj[l_cnt].faaj020 = 0 END IF
         IF cl_null(g_faaj[l_cnt].faaj021) THEN LET g_faaj[l_cnt].faaj021 = 0 END IF
         IF cl_null(g_faaj[l_cnt].faaj022) THEN LET g_faaj[l_cnt].faaj022 = 0 END IF
         IF cl_null(g_faaj[l_cnt].faaj027) THEN LET g_faaj[l_cnt].faaj027 = 0 END IF
         IF cl_null(g_faaj[l_cnt].faaj028) THEN LET g_faaj[l_cnt].faaj028 = 0 END IF
         IF cl_null(g_faaj[l_cnt].faaj029) THEN LET g_faaj[l_cnt].faaj029 = 0 END IF
         IF cl_null(g_faaj[l_cnt].faaj032) THEN LET g_faaj[l_cnt].faaj032 = 0 END IF
         IF cl_null(g_faaj[l_cnt].faaj034) THEN LET g_faaj[l_cnt].faaj034 = 0 END IF
         IF cl_null(g_faaj[l_cnt].faaj035) THEN LET g_faaj[l_cnt].faaj035 = 0 END IF
      
        #IF g_faaj[l_cnt].faaj028 + g_faaj[l_cnt].faaj029 <= g_faaj[l_cnt].faaj019 OR g_faaj[l_cnt].faaj015 = '4' THEN
         IF g_faaj[l_cnt].faaj028 + g_faaj[l_cnt].faaj029 <= g_faaj[l_cnt].faaj019 OR g_faah[l_cnt].faah015 = '7' THEN
            LET g_type = '2'   #资产已经折毕状态
         ELSE
            LET g_type = '1'   #一般提列折旧
         END IF
         
         
         #已為最後一期折舊則將剩餘淨值一併視為該期折舊
         IF g_faaj[l_cnt].faaj005 = 1 THEN 
            IF g_type = '1' THEN
               LET l_amt = g_faaj[l_cnt].faaj016 + g_faaj[l_cnt].faaj020 -g_faaj[l_cnt].faaj034  
                           - (g_faaj[l_cnt].faaj017 - g_faaj[l_cnt].faaj035)  
                           - (g_faaj[l_cnt].faaj021 - g_faaj[l_cnt].faaj027) 
                           - g_faaj[l_cnt].faaj019                       #当期折旧金额
               #末月的折舊金額不應包含第一个月未折减额
               IF g_faal[l_cnt].faal005 = '4' THEN
                  LET l_amt = l_amt - g_faaj[l_cnt].faaj029
               END IF
            ELSE
               LET l_amt = g_faaj[l_cnt].faaj016 + g_faaj[l_cnt].faaj020 -g_faaj[l_cnt].faaj034  
                           - (g_faaj[l_cnt].faaj017 - g_faaj[l_cnt].faaj035)  
                           - g_faaj[l_cnt].faaj012  #当期折旧金额 #20150204 g_faaj[l_cnt].faaj019-->g_faaj[l_cnt].faaj012 
            END IF
         ELSE
            IF g_faaj[l_cnt].faaj005 = 0 THEN 
              #入帐提列方式为4,當為未用年限為0之次月,折舊金額應為第一个月折旧额                                                                     
               IF g_faal[l_cnt].faal005 = '4' THEN                                                                                               
                  LET l_amt = g_faaj[l_cnt].faaj029                                                                                             
               ELSE                                                                                                                    
                  LET l_amt = 0
               END IF      
            ELSE 
               
               CASE g_faaj[l_cnt].faaj003
                  WHEN '1'   #平均年限法
                     IF g_type = '1' THEN
                        LET l_amt = (g_faaj[l_cnt].faaj016 + g_faaj[l_cnt].faaj020 -g_faaj[l_cnt].faaj034  
                                    - (g_faaj[l_cnt].faaj017 - g_faaj[l_cnt].faaj035)
                                    - g_faaj[l_cnt].faaj019 - g_faaj[l_cnt].faaj029                                    
                                    - (g_faaj[l_cnt].faaj021 - g_faaj[l_cnt].faaj027))/g_faaj[l_cnt].faaj005  #当期折旧金额
                     ELSE
                        LET l_amt = (g_faaj[l_cnt].faaj016 + g_faaj[l_cnt].faaj020 -g_faaj[l_cnt].faaj034  
                                    - (g_faaj[l_cnt].faaj017 - g_faaj[l_cnt].faaj035)
                                    - g_faaj[l_cnt].faaj012 - g_faaj[l_cnt].faaj029                                    
                                    - (g_faaj[l_cnt].faaj021 - g_faaj[l_cnt].faaj027))/g_faaj[l_cnt].faaj005  #albireo 160530 add   #160530-00036#1
                                    #- (g_faaj[l_cnt].faaj021 - g_faaj[l_cnt].faaj027))/g_faaj[l_cnt].faaj013  #折畢提列当期折旧金额  #20150204 g_faaj[l_cnt].faaj005-->g_faaj[l_cnt].faaj013   albireo 160530 mark
                     END IF
                      
                  WHEN '2'   #双倍余额递减法
                     IF g_faaj[l_cnt].faaj005 > 24 THEN   #未使用年限
                        IF g_faaj[l_cnt].faaj022 = 0 OR (g_faaj[l_cnt].faaj005 MOD 12 = 0) THEN
                           LET l_rate_y = (2/(g_faaj[l_cnt].faaj004/12))     #年折旧率  #faaj005->faaj004
                           LET l_amt_y = (g_faaj[l_cnt].faaj016 + g_faaj[l_cnt].faaj020 -g_faaj[l_cnt].faaj034  
                                        - g_faaj[l_cnt].faaj029 
                                        - (g_faaj[l_cnt].faaj017 - g_faaj[l_cnt].faaj035)) * l_rate_y  #年折旧额
                           LET l_amt = l_amt_y / 12
                        ELSE
                           LET l_amt_y = g_faaj[l_cnt].faaj022  #add by huangtao
                           LET l_amt = g_faaj[l_cnt].faaj022 / 12                    #add by yangxf 
#mark by yangxf -----
#                           IF g_faaj[l_cnt].faaj022 = 0 THEN
#                              LET l_amt_y = g_faaj[l_cnt].faaj028 - g_faaj[l_cnt].faaj019
#                              LET l_amt = l_amt_y / g_faaj[l_cnt].faaj005
#                           ELSE
#                              LET l_amt = g_faaj[l_cnt].faaj022 / 12
#                            END IF
#mark by yangxf -----
                        END IF
                     ELSE
                        IF g_faaj[l_cnt].faaj005 = 24 THEN   #未使用年限
                           LET l_amt_y = (g_faaj[l_cnt].faaj016 + g_faaj[l_cnt].faaj020 -g_faaj[l_cnt].faaj034  
                                        - g_faaj[l_cnt].faaj029 
                                        - (g_faaj[l_cnt].faaj017 - g_faaj[l_cnt].faaj035) 
                                        - g_faaj[l_cnt].faaj019) / 2  #年折旧额
                           LET l_amt = l_amt_y / 12
                        ELSE
                           LET l_amt_y = g_faaj[l_cnt].faaj022  #add by huangtao
#                          LET l_amt = g_faaj[l_cnt].faaj022 / 12	   #mark by yangxf
                           #add by yangxf ----
                           IF g_faaj[l_cnt].faaj022 = 0 THEN
                              LET l_amt_y = g_faaj[l_cnt].faaj028 - g_faaj[l_cnt].faaj019
                              LET l_amt = l_amt_y / g_faaj[l_cnt].faaj005
                           ELSE
                              LET l_amt = g_faaj[l_cnt].faaj022 / 12
                           END IF
                           #add by yangxf ---
#                           LET l_amt_y = (g_faaj[l_cnt].faaj016 + g_faaj[l_cnt].faaj020 -g_faaj[l_cnt].faaj034  
#                                        - g_faaj[l_cnt].faaj029 
#                                        - (g_faaj[l_cnt].faaj017 - g_faaj[l_cnt].faaj035) 
#                                        - g_faaj[l_cnt].faaj019 - g_faaj[l_cnt].faaj029 
#                                        - (g_faaj[l_cnt].faaj021 - g_faaj[l_cnt].faaj027)) * l_rate_y  #年折旧额
                        END IF
                     END IF
                  WHEN '3'   #定率余额递减法
                     IF g_faaj[l_cnt].faaj022 = 0 OR (g_faaj[l_cnt].faaj005 MOD 12 = 0) THEN
                        LET l_rate_y = (g_faaj[l_cnt].faaj005/12) /((g_faaj[l_cnt].faaj004/12) 
                                     * (g_faaj[l_cnt].faaj004/12 + 1)/2)
                        LET l_amt_y = (g_faaj[l_cnt].faaj016 + g_faaj[l_cnt].faaj020 - g_faaj[l_cnt].faaj019) * l_rate_y
                        LET l_amt = l_amt_y / 12
                     ELSE
                        LET l_amt_y = g_faaj[l_cnt].faaj022  #add by huangtao
                        LET l_amt = g_faaj[l_cnt].faaj022 / 12
                     END IF
                  WHEN '4'   #工作量法
                     SELECT fabb005 INTO l_fabb005 FROM faba_t,fabb_t 
                      WHERE fabaent = fabbent AND fabadocno = fabbdocno
                        AND fabbent = g_enterprise AND fabb001 = g_faah[l_cnt].faah003
                        AND fabb002 = g_faah[l_cnt].faah004 AND fabastus = 'Y'
                     SELECT faah043 INTO l_faah043 FROM faah_t 
                      WHERE faahent = g_enterprise AND faah003 = g_faah[l_cnt].faah003
                        AND faah004 = g_faah[l_cnt].faah004 
                        AND faah001 = g_faah[l_cnt].faah001  #20141212 add by chening
                        AND faahstus = 'Y'
                     IF cl_null(l_fabb005) THEN LET l_fabb005 = 0 END IF
                     IF cl_null(l_faah043) THEN LET l_faah043 = 0 END IF
                     IF l_fabb005 > l_faah043 THEN
                        LET l_amt = 0
                     ELSE
                        SELECT fabb005 INTO l_fabb005_1 FROM faba_t,fabb_t   #本月工作量合计
                         WHERE fabaent = fabbent AND fabadocno = fabbdocno
                           AND fabbent = g_enterprise AND fabb001 = g_faah[l_cnt].faah003
                           AND fabb002 = g_faah[l_cnt].faah004 AND fabastus = 'Y'
                           AND YEAR(fabadocdt) = g_glaa_m.year AND MONTH(fabadocdt) = g_glaa_m.month
                        LET l_rate_y = (g_faaj[l_cnt].faaj016 + g_faaj[l_cnt].faaj020 
                                       - g_faaj[l_cnt].faaj019) / l_faah043
                        LET l_amt = l_fabb005 * l_rate_y
                        IF (g_faaj[l_cnt].faaj016 + g_faaj[l_cnt].faaj020 - g_faaj[l_cnt].faaj019 -g_faaj[l_cnt].faaj017) < l_amt THEN
                           LET l_amt = g_faaj[l_cnt].faaj016 + g_faaj[l_cnt].faaj020 - g_faaj[l_cnt].faaj019 -g_faaj[l_cnt].faaj017
                        END IF                           
                     END IF
               END CASE
            END IF
         END IF
         
         #新增一筆折舊費用資料 ----------------------------------------
         IF g_faaj[l_cnt].faaj006 = '1' THEN 
            LET  l_faam009 = g_faaj[l_cnt].faaj007     #折舊部門
            LET  l_faam010 = ''
            CALL cl_get_para(g_enterprise,g_glaa_m.glaacomp,'S-FIN-9009') RETURNING l_ooab002
            IF l_ooab002 = '1' THEN   #若为1.部門，取afai050中科目
               SELECT faae003 INTO g_faaj[l_cnt].faaj025 FROM faae_t
                WHERE faaeent = g_enterprise AND faaeld = g_glaa_m.glaald
                  AND faae001 = trim(l_faam009) AND faae002 = g_faah[l_cnt].faah006  #20150825 --回追--
                  AND faaestus <> 'X' #161123-00011#2 add
               IF SQLCA.SQLCODE = 100 THEN
                 #LET l_msg = g_glaa_m.glaald," ",l_faam009," ",g_faah[l_cnt].faah006        #151203-00004#1 mark
                  LET l_msg = g_glaa_m.glaald," + ",l_faam009," + ",g_faah[l_cnt].faah006    #151203-00004#1 add
                  #150731-00004#1 20150807 str---
                  #CALL cl_errmsg('',l_msg,'','afa-00184',1)  #20141215 add by chenying 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'afa-00184'
                  LET g_errparam.extend = l_msg
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  #150731-00004#1 20150807 end---                  
#                   CALL cl_errmsg('',g_glaa_m.glaald||' '||l_faam009||' '||g_faah[l_cnt].faah006,'','afa-00184',1)
                   LET g_success='N'
                   CONTINUE FOR
               END IF
            ELSE    #若为2.資產，取卡片中折舊科目
               LET g_faaj[l_cnt].faaj025 = g_faaj[l_cnt].faaj025
            END IF
            IF cl_null(g_faaj[l_cnt].faaj025) THEN
               LET l_msg = g_glaa_m.glaald," ",l_faam009," ",g_faah[l_cnt].faah006  #151203-00004#1 mark
               LET l_msg = g_glaa_m.glaald," + ",l_faam009," + ",g_faah[l_cnt].faah006  #151203-00004#1 add
               #150731-00004#1 20150807 str---
               #CALL cl_errmsg('',l_msg,'','afa-00184',1)  #20141215 add by chenying 
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'afa-00184'
               LET g_errparam.extend = l_msg
               LET g_errparam.popup = TRUE
               CALL cl_err()
               #150731-00004#1 20150807 end---  
#               CALL cl_errmsg('',g_glaa_m.glaald||' '||l_faam009||' '||g_faah[l_cnt].faah006,'','afa-00184',1)  #20141215 add by chenying 
               LET g_success='N'
               CONTINUE FOR
            END IF
         ELSE
            LET  l_faam009 = g_faah[l_cnt].faah026     #保管部門
            LET  l_faam010 = g_faah[l_cnt].faah026     #保管部門
         END IF
         
          #170601-00058#1 Add By 01727  ---(S)---
          LET l_faam013 = 0
         SELECT faam013 INTO l_faam013 FROM faam_t
          WHERE faament = g_enterprise AND faamld = g_glaa_m.glaald
            AND faam001 = g_faaj[l_cnt].faaj001 AND faam002 = g_faaj[l_cnt].faaj002
            AND faam000 = g_faah[l_cnt].faah001
            AND faam004 * 12 + faam005 = g_glaa_m.year * 12 + g_glaa_m.month - 1 
            AND faam009 = l_faam009
         IF cl_null(l_faam013) THEN LET l_faam013 = 0 END IF
         #170802-00052#1 add(s)
         IF l_amt - l_faam013 < 0 THEN 
            LET l_amt = l_amt
         ELSE
         #170802-00052#1 add(e)         
            IF (l_faam013 - l_amt < 0.1 AND l_faam013 - l_amt > 0) OR (l_amt - l_faam013 < 0.1 AND l_amt - l_faam013 > 0) THEN
               LET l_amt = l_faam013
            END IF
         END IF  #170802-00052#1 add
         LET l_faam013 = 0
         #170601-00058#1 Add By 01727  ---(E)---
         
         #成本= faaj成本+faaj调整成本-faaj处置成本
#         LET l_cost = g_faaj[l_cnt].faaj016 + g_faaj[l_cnt].faaj020 - g_faaj[l_cnt].faaj019  #chenying mark
         LET l_cost = g_faaj[l_cnt].faaj016 + g_faaj[l_cnt].faaj020 - g_faaj[l_cnt].faaj034   #chenying add 
         IF cl_null(l_amt) THEN LET l_amt = 0 END IF
         LET g_yy = g_glaa_m.year
         LET g_mm = g_glaa_m.month
         LET g_ym = g_yy USING '&&&&',g_mm USING '&&'
         LET l_first2 = MDY(g_mm,1,g_yy)
         CALL s_date_get_last_date(l_first2) RETURNING l_last2
         #先把完整一個月該提列的折舊金額舊值記錄起來
         LET l_amt_o = l_amt
         IF cl_null(l_amt_o) THEN LET l_amt_o = 0 END IF
         IF g_faal[l_cnt].faal005 = '4' THEN
            IF g_ym = g_faaj[l_cnt].faaj008 THEN
               LET l_first = DAY(l_last2) - DAY(g_faah[l_cnt].faah014) + 1
               LET l_rate = l_first / DAY(l_last2)
               IF cl_null(l_rate) THEN LET l_rate = 1 END IF
               LET l_amt = l_amt * l_rate
               #算出第一個月未折減額faj331=完整一個月該攤提折舊-第一期攤提折舊
               IF cl_null(l_amt) THEN LET l_amt = 0 END IF
               LET l_faaj029 = l_amt_o - l_amt
               IF cl_null(l_faaj029) THEN LET l_faaj029 = 0 END IF
            END IF
         END IF
         LET l_accd=g_faaj[l_cnt].faaj017 - g_faaj[l_cnt].faaj035 + l_amt         #累折
         #本期累折=今年度折舊的加總，所以每年度的第一期清零本期累折
         IF g_glaa_m.month = 1 AND g_faaj[l_cnt].faaj018 >0 THEN
            LET g_faaj[l_cnt].faaj018 = 0
         END IF
         IF g_faaj[l_cnt].faaj018 = 0 THEN  
            LET l_curr   = l_amt
         ELSE
            LET l_curr=(g_faaj[l_cnt].faaj018 - g_faaj[l_cnt].faaj032) + l_amt
         END IF
         IF cl_null(l_amt) THEN LET l_amt = 0 END IF
         
         #20150213 add str
         #先取位后计算
         #小数位数
         #161215-00044#1---modify----begin-----------------
         #SELECT * INTO g_glaa_t.* 
         SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,
         glaald,glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,
         glaa011,glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,
         glaa023,glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,
         glaa121,glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,
         glaa139,glaa140,glaa123,glaa124,glaa028 INTO g_glaa_t.*
         #161215-00044#1---modify----end----------------- 
         FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_glaa_m.glaald
         SELECT ooaj003,ooaj004 INTO l_ooaj003,l_ooaj004 FROM ooaj_t WHERE ooajent = g_enterprise
           #AND ooaj001 = g_glaa_t.glaa026 AND ooaj002 = g_faaj[l_cnt].faaj014   #150812-00010#3 mark
            AND ooaj001 = g_glaa_t.glaa026 AND ooaj002 = g_glaa_t.glaa001        #150812-00010#3            
         SELECT ooaj004 INTO l_ooaj0042 FROM ooaj_t WHERE ooajent = g_enterprise
            AND ooaj001 = g_glaa_t.glaa026 AND ooaj002 = g_glaa_t.glaa016
         SELECT ooaj004 INTO l_ooaj0043 FROM ooaj_t WHERE ooajent = g_enterprise
            AND ooaj001 = g_glaa_t.glaa026 AND ooaj002 = g_glaa_t.glaa020 
            
         LET l_amt  = s_num_round('1',l_amt,l_ooaj004)
         #LET l_amt_y= s_num_round('1',l_amt,l_ooaj004)     #mark by yangxf
         LET l_amt_y= s_num_round('1',l_amt_y,l_ooaj004)    #add by yangxf
         LET l_cost = s_num_round('1',l_cost,l_ooaj004)
         LET l_accd = s_num_round('1',l_accd,l_ooaj004)
         LET l_curr = s_num_round('1',l_curr,l_ooaj004)
         #20150213 add end
         
         #本位币二汇率，本位币但汇率
         CALL afap230_glaald_get() RETURNING g_faam.faam102,g_faam.faam152
         LET g_faam.faam101 = g_glaa016    #本位币二币别
         LET g_faam.faam151 = g_glaa020    #本位币三币别
         #---本位币二---
         IF g_glaa015 = 'Y' THEN
            LET g_faam.faam103 = l_cost * g_faam.faam102  #成本
            LET g_faam.faam104 = l_amt * g_faam.faam102  #折旧金额
            LET g_faam.faam105 = l_accd * g_faam.faam102  #累折
            LET g_faam.faam106 = l_curr * g_faam.faam102  #本年累折
            LET g_faam.faam107 = (g_faaj[l_cnt].faaj021 - g_faaj[l_cnt].faaj027) * g_faam.faam102  #年折旧额
            LET g_faam.faam108 = (g_faaj[l_cnt].faaj022 + l_amt) * g_faam.faam102  #已提列减值准备
         END IF 
         #---本位币三---
         IF g_glaa019 = 'Y' THEN
            LET g_faam.faam153 = l_cost * g_faam.faam152  #成本
            LET g_faam.faam154 = l_amt * g_faam.faam152 #折旧金额
            LET g_faam.faam155 = l_accd * g_faam.faam152  #累折
            LET g_faam.faam156 = l_curr * g_faam.faam152  #本年累折
            LET g_faam.faam157 = (g_faaj[l_cnt].faaj021 - g_faaj[l_cnt].faaj027) * g_faam.faam152  #年折旧额
            LET g_faam.faam158 = (g_faaj[l_cnt].faaj022 + l_amt) * g_faam.faam152  #已提列减值准备
         END IF
         
         #20141106 --add--str--
#         #小数位数
#         SELECT * INTO g_glaa_t.* FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_glaa_m.glaald
#         SELECT ooaj003,ooaj004 INTO l_ooaj003,l_ooaj004 FROM ooaj_t WHERE ooajent = g_enterprise
#            AND ooaj001 = g_glaa_t.glaa026 AND ooaj002 = g_faaj[l_cnt].faaj014
#         SELECT ooaj004 INTO l_ooaj0042 FROM ooaj_t WHERE ooajent = g_enterprise
#            AND ooaj001 = g_glaa_t.glaa026 AND ooaj002 = g_glaa_t.glaa016
#         SELECT ooaj004 INTO l_ooaj0043 FROM ooaj_t WHERE ooajent = g_enterprise
#            AND ooaj001 = g_glaa_t.glaa026 AND ooaj002 = g_glaa_t.glaa020  
         #本位币
         #汇率  
         LET g_faam.faam012 = g_faaj[l_cnt].faaj015         
         LET g_faam.faam013 = l_amt
#         LET g_faam.faam014 = g_faaj[l_cnt].faaj016  #chenying mark
         LET g_faam.faam014 = l_cost                  #chenying add
         LET g_faam.faam015 = l_accd
         LET g_faam.faam016 = l_curr
         LET g_faam.faam018 = g_faaj[l_cnt].faaj021-g_faaj[l_cnt].faaj027 
         LET g_faam.faam019 = 0        

#         LET g_faam.faam012 = s_num_round('1',g_faam.faam012,l_ooaj003) #20141210 mark by chenying
         LET g_faam.faam013 = s_num_round('1',g_faam.faam013,l_ooaj004) 
         LET g_faam.faam014 = s_num_round('1',g_faam.faam014,l_ooaj004)
         LET g_faam.faam015 = s_num_round('1',g_faam.faam015,l_ooaj004)
         LET g_faam.faam016 = s_num_round('1',g_faam.faam016,l_ooaj004)
         LET g_faam.faam018 = s_num_round('1',g_faam.faam018,l_ooaj004)
         LET g_faam.faam019 = s_num_round('1',g_faam.faam019,l_ooaj004)
         #本位币二
#         #汇率          
#         LET g_faam.faam102 = s_num_round('1',g_faam.faam102,l_ooaj003) #20141210 mark by chenying
         LET g_faam.faam103 = s_num_round('1',g_faam.faam103,l_ooaj0042)
         LET g_faam.faam104 = s_num_round('1',g_faam.faam104,l_ooaj0042)
         LET g_faam.faam105 = s_num_round('1',g_faam.faam105,l_ooaj0042)
         LET g_faam.faam106 = s_num_round('1',g_faam.faam106,l_ooaj0042)
         LET g_faam.faam107 = s_num_round('1',g_faam.faam107,l_ooaj0042)
         LET g_faam.faam108 = s_num_round('1',g_faam.faam108,l_ooaj0042) 
         #本位币三
#         LET g_faam.faam152 = s_num_round('1',g_faam.faam152,l_ooaj003)  #20141210 mark by chenying
         LET g_faam.faam153 = s_num_round('1',g_faam.faam153,l_ooaj0043)
         LET g_faam.faam154 = s_num_round('1',g_faam.faam154,l_ooaj0043)
         LET g_faam.faam155 = s_num_round('1',g_faam.faam155,l_ooaj0043)
         LET g_faam.faam156 = s_num_round('1',g_faam.faam156,l_ooaj0043)
         LET g_faam.faam157 = s_num_round('1',g_faam.faam157,l_ooaj0043)
         LET g_faam.faam158 = s_num_round('1',g_faam.faam158,l_ooaj0043)
         #20141106 --add--end--
#161104-00048#3 remark s---           
#161104-00048#2 mark s---         
         INSERT INTO faam_t(  faament,faamsite,faamld,faamcomp,faam000,faam001,
                              faam002,faam003,faam004,faam005,faam006,
                              faam007,faam008,faam009,faam010,faam011,
                              faam012,faam013,faam014,faam015,faam016,
                              faam017,faam018,faam019,faam020,faam021,
                              faam022,faam023,faam024,faam025,faam026,
                              faam027,faam028,faam029,faam030,faam031,
                              faam032,faam033,faam034,faam035,faam036,
                              faam101,faam102,faam103,faam104,faam105,faam106,faam107,faam108,
                              faam151,faam152,faam153,faam154,faam155,faam156,faam157,faam158)  
                       VALUES(g_enterprise,g_glaa_m.faamsite,g_faaj[l_cnt].faajld,g_glaacomp,g_faah[l_cnt].faah001,g_faaj[l_cnt].faaj001,   #1-5
                              g_faaj[l_cnt].faaj002,g_faaj[l_cnt].faaj003,g_glaa_m.year,g_glaa_m.month,'1',    #6-10
                              g_faaj[l_cnt].faaj006,g_faaj[l_cnt].faaj007,l_faam009,l_faam010,g_faaj[l_cnt].faaj014,  #11-15
                              g_faam.faam012,g_faam.faam013,g_faam.faam014,g_faam.faam015,g_faam.faam016,100,g_faam.faam018, #16-22 #20150202 1-->100 分摊比率已百分比数值插入，显示100
                              g_faam.faam019,g_faaj[l_cnt].faaj023,g_faaj[l_cnt].faaj024,g_faaj[l_cnt].faaj025, #23-26，faam019先给0，不做计算，先faam019=g_faaj[l_cnt].faaj022+l_amt
                              g_faaj[l_cnt].faaj026,'','',g_faah[l_cnt].faah015,g_faaj[l_cnt].faajsite,g_faaj[l_cnt].faaj039, #27-32  
                              g_faaj[l_cnt].faaj040,g_faaj[l_cnt].faaj041,g_faaj[l_cnt].faaj042,g_faaj[l_cnt].faaj043,  #33-36
                              g_faaj[l_cnt].faaj044,'',g_faaj[l_cnt].faaj045,g_faaj[l_cnt].faaj046,g_faam.faam101,g_faam.faam102,#37-41
                              g_faam.faam103,g_faam.faam104,g_faam.faam105, #42-44
                              g_faam.faam106,g_faam.faam107,g_faam.faam108,g_faam.faam151,g_faam.faam152,g_faam.faam153, #45-51
                              g_faam.faam154,g_faam.faam155,g_faam.faam156,g_faam.faam157,g_faam.faam158)  #52-56
         IF SQLCA.sqlcode THEN
            #150731-00004#1 20150807 str---
            #CALL cl_errmsg('faaj001',g_faaj[l_cnt].faaj001,'','ins faam_t',1) 
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'ins faam_t'
            LET g_errparam.extend = 'faaj001：'||g_faaj[l_cnt].faaj001
            LET g_errparam.popup = TRUE
            CALL cl_err()
            #150731-00004#1 20150807 end---  
            LET g_cnt2 = g_cnt2 + 1
            LET g_success='N'
            CONTINUE FOR
         END IF
#161104-00048#2 mark e---  
#161104-00048#3 remark e---  
         #update 回資產主檔
          # 剩餘月數減 1
          LET g_faaj[l_cnt].faaj005 = g_faaj[l_cnt].faaj005 -1  #未使用月数
          LET g_faaj[l_cnt].faaj012 = g_faaj[l_cnt].faaj012     #折毕再提预留残值
          IF g_faaj[l_cnt].faaj005 < 0 THEN LET g_faaj[l_cnt].faaj005 = 0 END IF
          #----->資產狀態碼
          IF g_type = '2' THEN
             IF g_faaj[l_cnt].faaj005 > 0 AND g_faaj[l_cnt].faaj011 MATCHES '[Yy]' THEN  #160429-00002#1 add AND g_faaj[l_cnt].faaj011 MATCHES '[Yy]' lujh
                #LET l_faah015 = '7'  #161104-00048#2 mark
                LET l_faaj038 = '7'   #161104-00048#2 add
             ELSE
                #LET l_faah015 = '4'  #161104-00048#2 mark
                LET l_faaj038 = '4'   #161104-00048#2 add              
             END IF
          ELSE
             IF (g_faaj[l_cnt].faaj005 = 0 AND g_faaj[l_cnt].faaj003 <> '4') OR (g_faaj[l_cnt].faaj003 = '4' AND g_faah[l_cnt].faah043 <=g_faah[l_cnt].faah044) THEN   
               #當faa15=4時,判斷資產是否折畢,除了看未用年限是否變為0外,
               #還要看faj331也變為0才視為折畢,不然狀態還是要為折舊中
                IF g_faal[l_cnt].faal005 = '4' THEN
                   IF l_over = 'Y' OR g_faaj[l_cnt].faaj029 = 0 THEN  #已為折畢
                      IF g_faaj[l_cnt].faaj011 MATCHES '[Nn]' THEN
                         #LET l_faah015= '4'  # 折畢 #161104-00048#2 mark
                         LET l_faaj038= '4'  # 折畢  #161104-00048#2 add 
                      ELSE
                         #LET l_faah015 = '7'  # 折畢再提 #161104-00048#2 mark
                         LET l_faaj038 = '7'  # 折畢再提  #161104-00048#2 add
                         LET g_faaj[l_cnt].faaj005 = g_faaj[l_cnt].faaj013
                      END IF
                   ELSE                  #非最後那個殘月,資產狀態都需為2.折舊中
                      #LET l_faah015 = '2' #161104-00048#2 mark
                      LET l_faaj038 = '2'  #161104-00048#2 add
                   END IF
                ELSE
                #折畢再提:折完時,殘值為0 時 即為折畢
                   IF g_faaj[l_cnt].faaj011 MATCHES '[Nn]' THEN
                      #LET l_faah015 = '4' #161104-00048#2
                      LET l_faaj038 = '4'  #161104-00048#2
                   ELSE
                      #LET l_faah015 = '7'  # 第一次折畢, 即直接當做欲折畢再提 #161104-00048#2
                      LET l_faaj038 = '7'                                   #161104-00048#2
                      LET g_faaj[l_cnt].faaj005 = g_faaj[l_cnt].faaj013
                   END IF
                END IF   
             ELSE
#                IF g_faaj[l_cnt].faaj005='7' THEN  #20150212
                IF g_faah[l_cnt].faah015='7' THEN   #20150212
                   #LET l_faah015 = '7' #161104-00048#2
                   LET l_faaj038 = '7' #161104-00048#2
                ELSE
                   #LET l_faah015 = '2' #161104-00048#2
                   LET l_faaj038 = '2' #161104-00048#2
                END IF
             END IF            
          END IF
#161104-00048#3 mark s---          
##161104-00048#2 add s---           
#         INSERT INTO faam_t(  faament,faamsite,faamld,faamcomp,faam000,faam001,
#                              faam002,faam003,faam004,faam005,faam006,
#                              faam007,faam008,faam009,faam010,faam011,
#                              faam012,faam013,faam014,faam015,faam016,
#                              faam017,faam018,faam019,faam020,faam021,
#                              faam022,faam023,faam024,faam025,faam026,
#                              faam027,faam028,faam029,faam030,faam031,
#                              faam032,faam033,faam034,faam035,faam036,
#                              faam101,faam102,faam103,faam104,faam105,faam106,faam107,faam108,
#                              faam151,faam152,faam153,faam154,faam155,faam156,faam157,faam158)  
#                       VALUES(g_enterprise,g_glaa_m.faamsite,g_faaj[l_cnt].faajld,g_glaacomp,g_faah[l_cnt].faah001,g_faaj[l_cnt].faaj001,   #1-5
#                              g_faaj[l_cnt].faaj002,g_faaj[l_cnt].faaj003,g_glaa_m.year,g_glaa_m.month,'1',    #6-10
#                              g_faaj[l_cnt].faaj006,g_faaj[l_cnt].faaj007,l_faam009,l_faam010,g_faaj[l_cnt].faaj014,  #11-15
#                              g_faam.faam012,g_faam.faam013,g_faam.faam014,g_faam.faam015,g_faam.faam016,100,g_faam.faam018, #16-22 #20150202 1-->100 分摊比率已百分比数值插入，显示100
#                              g_faam.faam019,g_faaj[l_cnt].faaj023,g_faaj[l_cnt].faaj024,g_faaj[l_cnt].faaj025, #23-26，faam019先给0，不做计算，先faam019=g_faaj[l_cnt].faaj022+l_amt
#                              g_faaj[l_cnt].faaj026,'','',l_faaj038,g_faaj[l_cnt].faajsite,g_faaj[l_cnt].faaj039, #27-32   #161104-00048#2 faah015-->faaj038
#                              g_faaj[l_cnt].faaj040,g_faaj[l_cnt].faaj041,g_faaj[l_cnt].faaj042,g_faaj[l_cnt].faaj043,  #33-36
#                              g_faaj[l_cnt].faaj044,'',g_faaj[l_cnt].faaj045,g_faaj[l_cnt].faaj046,g_faam.faam101,g_faam.faam102,#37-41
#                              g_faam.faam103,g_faam.faam104,g_faam.faam105, #42-44
#                              g_faam.faam106,g_faam.faam107,g_faam.faam108,g_faam.faam151,g_faam.faam152,g_faam.faam153, #45-51
#                              g_faam.faam154,g_faam.faam155,g_faam.faam156,g_faam.faam157,g_faam.faam158)  #52-56
#         IF SQLCA.sqlcode THEN
#            #150731-00004#1 20150807 str---
#            #CALL cl_errmsg('faaj001',g_faaj[l_cnt].faaj001,'','ins faam_t',1) 
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.code = 'ins faam_t'
#            LET g_errparam.extend = 'faaj001：'||g_faaj[l_cnt].faaj001
#            LET g_errparam.popup = TRUE
#            CALL cl_err()
#            #150731-00004#1 20150807 end---  
#            LET g_cnt2 = g_cnt2 + 1
#            LET g_success='N'
#            CONTINUE FOR
#         END IF
##161104-00048#2 add e---  
#161104-00048#3 mark e---  
          #UPDATE  累折, 未折減額, 剩餘月數, 資產狀態
          IF g_faal[l_cnt].faal005 != '4' THEN  
             IF l_over = 'N' THEN
                LET g_faaj[l_cnt].faaj028 = (g_faaj[l_cnt].faaj016 + g_faaj[l_cnt].faaj020) - g_faaj[l_cnt].faaj034
                                            - (g_faaj[l_cnt].faaj017 + l_amt - g_faaj[l_cnt].faaj035)
#20141106 --mod--str--
 
#                UPDATE faaj_t SET faaj009 =g_glaa_m.year,            #最近折舊年
#                                    faaj010 =g_glaa_m.month,           #最近折舊月
#                                    faaj017 =faaj017 + l_amt,          #累折
#                                    faaj028 =g_faaj[l_cnt].faaj028,    #未折減額
#                                    faaj005 =g_faaj[l_cnt].faaj005,    #未用年限
#                                    faaj012 =g_faaj[l_cnt].faaj012,    #折畢再提預留殘值
#                                    faaj018 =faaj018+l_amt,            #本期累折
#                                    faaj022 =l_amt_y                   #年折舊額
#20141106 add
#                LET l_amt_1 = s_num_round('1',l_amt,l_ooaj004)      #20150213
                LET g_faaj[l_cnt].faaj028 = s_num_round('1',g_faaj[l_cnt].faaj028,l_ooaj004)
#                LET l_amt_y_1 = s_num_round('1',l_amt_y,l_ooaj004)  #20150213        
                UPDATE faaj_t SET faaj009 =g_glaa_m.year,              #最近折舊年
                                    faaj010 =g_glaa_m.month,           #最近折舊月
                                    faaj017 =faaj017+l_amt,            #累折 #20150213 l_amt_1-->l_amt
                                    faaj028 =g_faaj[l_cnt].faaj028,    #未折減額
                                    faaj005 =g_faaj[l_cnt].faaj005,    #未用年限
                                    faaj012 =g_faaj[l_cnt].faaj012,    #折畢再提預留殘值
                                    #faaj038 = l_faah015,  #albireo 160530 #160530-00036#1 #161104-00048#2 mark
                                    faaj038 = l_faaj038,                                   #161104-00048#2 add  
                                    ############mark by huangtao
                                    #faaj018 =faaj018+l_amt_1,          #本期累折
                                    faaj018 = (CASE WHEN g_glaa_m.month = 1 THEN l_amt  #20150213 l_amt_1-->l_amt
                                               ELSE faaj018+l_amt END ), #20150213 l_amt_1-->l_amt
                                    ############mark by huangtao
                                    faaj022 =l_amt_y,                #年折舊額 #20150213 l_amt_y_1-->l_amt_y
                                    #20141210 add by chenying
                                    faaj104 =faaj017+l_amt*g_faam.faam102,              #本位币二累折     #20150213 l_amt_1-->l_amt
                                    faaj108 =g_faaj[l_cnt].faaj028*g_faam.faam102,      #本位币二未折減額
                                    faaj106 =g_faaj[l_cnt].faaj012*g_faam.faam102,      #本位币二折畢再提預留殘值
                                    faaj111 =faaj018+l_amt*g_faam.faam102,              #本位币二本期累折 #20150213 l_amt_1-->l_amt
                                    faaj107 =l_amt_y*g_faam.faam102,                    #本位币二年折舊額 #20150213 l_amt_y_1-->l_amt_y  
                                    faaj154 =faaj017+l_amt*g_faam.faam152,              #本位币三累折     #20150213 l_amt_1-->l_amt
                                    faaj158 =g_faaj[l_cnt].faaj028*g_faam.faam152,      #本位币三未折減額
                                    faaj156 =g_faaj[l_cnt].faaj012*g_faam.faam152,      #本位币三折畢再提預留殘值
                                    faaj161 =faaj018+l_amt*g_faam.faam152,              #本位币三本期累折 #20150213 l_amt_1-->l_amt
                                    faaj157 =l_amt_y*g_faam.faam152                     #本位币三年折舊額 #20150213 l_amt_y_1-->l_amt_y                                      
                                    #20141210 add by chenying                                    
#20141106 add                                    
                 WHERE faajent=g_enterprise AND faajld=g_glaa_m.glaald
                   AND faaj001 = g_faaj[l_cnt].faaj001 AND faaj002 = g_faaj[l_cnt].faaj002
                   AND faaj037 = g_faaj[l_cnt].faaj037 AND faaj000 = g_faaj[l_cnt].faaj000 #20141212 add by chenying
                   
                IF SQLCA.sqlcode OR SQLCA.sqlerrd[3] = 0 THEN
                   #150731-00004#1 20150807 str---
                   #CALL cl_errmsg('faaj001',g_faaj[l_cnt].faaj001,'','upd faaj_t',1)
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.code = 'upd faam_t'
                   LET g_errparam.extend = 'faaj001：'||g_faaj[l_cnt].faaj001
                   LET g_errparam.popup = TRUE
                   CALL cl_err()
                   #150731-00004#1 20150807 end---  
                   LET g_cnt2 = g_cnt2 + 1
                   LET g_success='N'
                   CONTINUE FOR
                END IF
             END IF
          ELSE
             LET g_faaj[l_cnt].faaj028 = (g_faaj[l_cnt].faaj016 + g_faaj[l_cnt].faaj020) - g_faaj[l_cnt].faaj034
                                            - (g_faaj[l_cnt].faaj017 + l_amt - g_faaj[l_cnt].faaj035)
             IF cl_null(g_faaj[l_cnt].faaj028 ) THEN LET g_faaj[l_cnt].faaj028 = 0 END IF
             #非第一期的提列,faaj028均需扣掉第一月的未折減額faaj029
             IF g_ym != g_faaj[l_cnt].faaj008 AND l_over = 'N' THEN
                LET g_faaj[l_cnt].faaj028 = g_faaj[l_cnt].faaj028 - g_faaj[l_cnt].faaj029
             END IF
             IF cl_null(g_faaj[l_cnt].faaj028 ) THEN LET g_faaj[l_cnt].faaj028 = 0 END IF
             IF l_over = 'N' THEN   #非最後那個殘月的折舊
                IF g_ym = g_faaj[l_cnt].faaj008 THEN  #第一期攤提
#20141106 mod--str--                
#                   UPDATE faaj_t SET faaj009 =g_glaa_m.year,           #最近折舊年
#                                    faaj010 =g_glaa_m.month,           #最近折舊月
#                                    faaj017 =faaj017 + l_amt,          #累折
#                                    faaj028 =g_faaj[l_cnt].faaj028,    #未折減額
#                                    faaj029 =l_faaj029,                #第一個月未折減額
#                                    faaj005 =g_faaj[l_cnt].faaj005,    #未用年限
#                                    faaj012 =g_faaj[l_cnt].faaj012,    #折畢再提預留殘值
#                                    faaj018 =faaj018+l_amt,            #本期累折
#                                    faaj022 =l_amt_y                   #年折舊額
#20141106 add
#                LET l_amt_1 = s_num_round('1',l_amt,l_ooaj004)       #20150213
                LET g_faaj[l_cnt].faaj028 = s_num_round('1',g_faaj[l_cnt].faaj028,l_ooaj004)
#                LET l_amt_y_1 = s_num_round('1',l_amt_y,l_ooaj004)   #20150213
                LET l_faaj029 = s_num_round('1',l_faaj029,l_ooaj004)                
                 UPDATE faaj_t SET faaj009 =g_glaa_m.year,             #最近折舊年
                                    faaj010 =g_glaa_m.month,           #最近折舊月
                                    faaj017 =faaj017+l_amt,            #累折  #20150213 l_amt_1-->l_amt
                                    faaj028 =g_faaj[l_cnt].faaj028,    #未折減額
                                    faaj029 =l_faaj029,                #第一個月未折減額
                                    faaj005 =g_faaj[l_cnt].faaj005,    #未用年限
                                    faaj012 =g_faaj[l_cnt].faaj012,    #折畢再提預留殘值
                                    #faaj038 = l_faah015,  #albireo 160530   #160530-00036#1  #161104-00048#2 mark
                                    faaj038 = l_faaj038,                                      #161104-00048#2 add
                                     ############mark by huangtao
                                    #faaj018 =faaj018+l_amt_1,         #本期累折
                                    faaj018 = (CASE WHEN g_glaa_m.month = 1 THEN l_amt #20150213 l_amt_1-->l_amt
                                               ELSE faaj018+l_amt END ),               #20150213 l_amt_1-->l_amt
                                    ############mark by huangtao
                                    faaj022 =l_amt_y,                  #年折舊額        #20150213 l_amt_y_1-->l_amt_y
                                    #20141210 add by chenying
                                    faaj104 =faaj017+l_amt*g_faam.faam102,            #本位币二累折    #20150213 l_amt_1-->l_amt
                                    faaj108 =g_faaj[l_cnt].faaj028*g_faam.faam102,    #本位币二未折減額
                                    faaj109 =l_faaj029*g_faam.faam102,                #本位币二第一個月未折減額
                                    faaj106 =g_faaj[l_cnt].faaj012*g_faam.faam102,    #本位币二折畢再提預留殘值
                                    faaj111 =faaj018+l_amt*g_faam.faam102,            #本位币二本期累折 #20150213 l_amt_1-->l_amt
                                    faaj107 =l_amt_y*g_faam.faam102,                  #本位币二年折舊額 #20150213 l_amt_y_1-->l_amt_y
                                    faaj154 =faaj017+l_amt*g_faam.faam152,            #本位币三累折     #20150213 l_amt_1-->l_amt
                                    faaj158 =g_faaj[l_cnt].faaj028*g_faam.faam152,    #本位币三未折減額
                                    faaj159 =l_faaj029*g_faam.faam152,                #本位币三第一個月未折減額
                                    faaj156 =g_faaj[l_cnt].faaj012*g_faam.faam152,    #本位币三折畢再提預留殘值
                                    faaj161 =faaj018+l_amt*g_faam.faam152,            #本位币三本期累折 #20150213 l_amt_1-->l_amt
                                    faaj157 =l_amt_y*g_faam.faam152                   #本位币三年折舊額 #20150213 l_amt_y_1-->l_amt_y                                      
                                    #20141210 add by chenying                                         
#20141106 add                                                                        
                    WHERE faajent=g_enterprise AND faajld=g_glaa_m.glaald
                      AND faaj001 = g_faaj[l_cnt].faaj001 AND faaj002 = g_faaj[l_cnt].faaj002
                      AND faaj037 = g_faaj[l_cnt].faaj037 AND faaj000 = g_faaj[l_cnt].faaj000 #20141212 add by chenying
                ELSE
#                   UPDATE faaj_t SET faaj009 =g_glaa_m.year,        #最近折舊年
#                                    faaj010 =g_glaa_m.month,           #最近折舊月
#                                    faaj017 =faaj017 + l_amt,          #累折
#                                    faaj028 =g_faaj[l_cnt].faaj028,    #未折減額
#                                    faaj005 =g_faaj[l_cnt].faaj005,    #未用年限
#                                    faaj012 =g_faaj[l_cnt].faaj012,    #折畢再提預留殘值
#                                    faaj018 =faaj018+l_amt,            #本期累折
#                                    faaj022 =l_amt_y                   #年折舊額
#20141106 add
#                    LET l_amt_1 = s_num_round('1',l_amt,l_ooaj004)     #20150213
                    LET g_faaj[l_cnt].faaj028 = s_num_round('1',g_faaj[l_cnt].faaj028,l_ooaj004)
#                    LET l_amt_y_1 = s_num_round('1',l_amt_y,l_ooaj004) #20150213  
                    UPDATE faaj_t SET faaj009 =g_glaa_m.year,          #最近折舊年
                                    faaj010 =g_glaa_m.month,           #最近折舊月
                                    faaj017 =faaj017+l_amt,            #累折     #20150213 l_amt_1-->l_amt
                                    faaj028 =g_faaj[l_cnt].faaj028,    #未折減額 
                                    faaj005 =g_faaj[l_cnt].faaj005,    #未用年限
                                    faaj012 =g_faaj[l_cnt].faaj012,    #折畢再提預留殘值
                                    #faaj038 = l_faah015,  #albireo 160530   #160530-00036#1 #161104-00048#2 mark
                                    faaj038 = l_faaj038, #161104-00048#2 add
                                     ############mark by huangtao
                                    #faaj018 =faaj018+l_amt_1,          #本期累折
                                    faaj018 = (CASE WHEN g_glaa_m.month = 1 THEN l_amt #20150213 l_amt_1-->l_amt
                                               ELSE faaj018+l_amt END ),               #20150213 l_amt_1-->l_amt
                                    ############mark by huangtao
                                    faaj022 =l_amt_y,                                  #20150213 l_amt_y_1-->l_amt_y
                                    #20141210 add by chenying
                                    faaj104 =faaj017+l_amt*g_faam.faam102,              #本位币二累折    #20150213 l_amt_1-->l_amt
                                    faaj108 =g_faaj[l_cnt].faaj028*g_faam.faam102,      #本位币二未折減額
                                    faaj106 =g_faaj[l_cnt].faaj012*g_faam.faam102,      #本位币二折畢再提預留殘值
                                    faaj111 =faaj018+l_amt*g_faam.faam102,              #本位币二本期累折 #20150213 l_amt_1-->l_amt
                                    faaj107 =l_amt_y*g_faam.faam102,                    #本位币二年折舊額 #20150213 l_amt_y_1-->l_amt_y  
                                    faaj154 =faaj017+l_amt*g_faam.faam152,              #本位币三累折     #20150213 l_amt_1-->l_amt
                                    faaj158 =g_faaj[l_cnt].faaj028*g_faam.faam152,      #本位币三未折減額
                                    faaj156 =g_faaj[l_cnt].faaj012*g_faam.faam152,      #本位币三折畢再提預留殘值
                                    faaj161 =faaj018+l_amt*g_faam.faam152,              #本位币三本期累折 #20150213 l_amt_1-->l_amt
                                    faaj157 =l_amt_y*g_faam.faam152                     #本位币三年折舊額 #20150213 l_amt_y_1-->l_amt_y                                      
                                    #20141210 add by chenying                                     
#20141106 add                                    
                    WHERE faajent=g_enterprise AND faajld=g_glaa_m.glaald
                      AND faaj001 = g_faaj[l_cnt].faaj001 AND faaj002 = g_faaj[l_cnt].faaj002
                      AND faaj037 = g_faaj[l_cnt].faaj037 AND faaj000 = g_faaj[l_cnt].faaj000 #20141212 add by chenying
                END IF
             ELSE                   #最後那個殘月的折舊
#                UPDATE faaj_t SET faaj009 =g_glaa_m.year,           #最近折舊年
#                                    faaj010 =g_glaa_m.month,           #最近折舊月
#                                    faaj017 =faaj017 + l_amt,          #累折
#                                    faaj028 =g_faaj[l_cnt].faaj028,    #未折減額
#                                    faaj029 =0,                        #第一個月未折減額
#                                    faaj005 =g_faaj[l_cnt].faaj005,    #未用年限
#                                    faaj012 =g_faaj[l_cnt].faaj012,    #折畢再提預留殘值
#                                    faaj018 =faaj018+l_amt,            #本期累折
#                                    faaj022 =l_amt_y                   #年折舊額
#20141106 add--str--
#                   LET l_amt_1 = s_num_round('1',l_amt,l_ooaj004)     #20150213
                   LET g_faaj[l_cnt].faaj028 = s_num_round('1',g_faaj[l_cnt].faaj028,l_ooaj004)
#                   LET l_amt_y_1 = s_num_round('1',l_amt_y,l_ooaj004) #20150213 
                   UPDATE faaj_t SET faaj009 =g_glaa_m.year,           #最近折舊年
                                    faaj010 =g_glaa_m.month,           #最近折舊月
                                    faaj017 =faaj017+ l_amt,           #累折 #20150213 l_amt_1-->l_amt
                                    faaj028 =g_faaj[l_cnt].faaj028, #未折減額
                                    faaj029 =0,                        #第一個月未折減額
                                    faaj005 =g_faaj[l_cnt].faaj005,    #未用年限
                                    faaj012 =g_faaj[l_cnt].faaj012,    #折畢再提預留殘值
                                    #faaj038 = l_faah015,  #albireo 160530   #160530-00036#1 #161104-00048#2 mark
                                    faaj038 = l_faaj038,   #161104-00048#2 add
                                     ############mark by huangtao
                                    #faaj018 =faaj018+l_amt_1,          #本期累折
                                    faaj018 = (CASE WHEN g_glaa_m.month = 1 THEN l_amt #20150213 l_amt_1-->l_amt
                                               ELSE faaj018+l_amt END ),               #20150213 l_amt_1-->l_amt
                                    ############mark by huangtao
                                    faaj022 =l_amt_y,                                  #20150213 l_amt_y_1-->l_amt_y
                                    #20141210 add by chenying
                                    faaj104 =faaj017+l_amt*g_faam.faam102,            #本位币二累折 #20150213 l_amt_1-->l_amt
                                    faaj108 =g_faaj[l_cnt].faaj028*g_faam.faam102,    #本位币二未折減額
                                    faaj109 =0,                                       #本位币二第一個月未折減額
                                    faaj106 =g_faaj[l_cnt].faaj012*g_faam.faam102,    #本位币二折畢再提預留殘值
                                    faaj111 =faaj018+l_amt*g_faam.faam102,            #本位币二本期累折 #20150213 l_amt_1-->l_amt
                                    faaj107 =l_amt_y*g_faam.faam102,                  #本位币二年折舊額 #20150213 l_amt_y_1-->l_amt_y
                                    faaj154 =faaj017+l_amt*g_faam.faam152,            #本位币三累折     #20150213 l_amt_1-->l_amt
                                    faaj158 =g_faaj[l_cnt].faaj028*g_faam.faam152,    #本位币三未折減額
                                    faaj159 =0,                                       #本位币三第一個月未折減額
                                    faaj156 =g_faaj[l_cnt].faaj012*g_faam.faam152,    #本位币三折畢再提預留殘值
                                    faaj161 =faaj018+l_amt*g_faam.faam152,            #本位币三本期累折 #20150213 l_amt_1-->l_amt
                                    faaj157 =l_amt_y*g_faam.faam152                   #本位币三年折舊額 #20150213 l_amt_y_1-->l_amt_y                                     
                                    #20141210 add by chenying                                       
#20141106 add--end--                                    
#20141106 mod--end--                                    
                    WHERE faajent=g_enterprise AND faajld=g_glaa_m.glaald
                      AND faaj001 = g_faaj[l_cnt].faaj001 AND faaj002 = g_faaj[l_cnt].faaj002
                      AND faaj037 = g_faaj[l_cnt].faaj037 AND faaj000 = g_faaj[l_cnt].faaj000 #20141212 add by chenying
             END IF
             IF SQLCA.sqlcode OR SQLCA.sqlerrd[3] = 0 THEN
                #150731-00004#1 20150807 str---
                #CALL cl_errmsg('faaj001',g_faaj[l_cnt].faaj001,'','upd faaj_t',1)
                INITIALIZE g_errparam TO NULL
                LET g_errparam.code = 'upd faam_t'
                LET g_errparam.extend = 'faaj001：'||g_faaj[l_cnt].faaj001
                LET g_errparam.popup = TRUE
                CALL cl_err()
                #150731-00004#1 20150807 end--- 
                LET g_cnt2 = g_cnt2 + 1
                LET g_success='N'
                CONTINUE FOR
             END IF
         END IF
        
#         #更新资产状态
#161104-00048#2 mod s---
#         UPDATE faah_t SET faah015 = l_faah015
#          WHERE faahent=g_enterprise 
#            AND faah003 = g_faah[l_cnt].faah003 AND faah004 = g_faah[l_cnt].faah004
#            AND faah001 = g_faah[l_cnt].faah001 AND faah000 = g_faah[l_cnt].faah000 #20141212 add by chenying
         UPDATE faaj_t SET faaj038 = l_faaj038
          WHERE faajent=g_enterprise 
            AND faaj001 = g_faah[l_cnt].faah003 AND faaj002 = g_faah[l_cnt].faah004
            AND faaj037 = g_faah[l_cnt].faah001 AND faaj000 = g_faah[l_cnt].faah000 #20141212 add by chenying           
#161104-00048#2 mod e---
        #170323-00047#1--add--s--xul
         UPDATE faah_t SET faah015 = l_faaj038
          WHERE faahent= g_enterprise 
            AND faah003 = g_faah[l_cnt].faah003 AND faah004 = g_faah[l_cnt].faah004
            AND faah001 = g_faah[l_cnt].faah001 AND faah000 = g_faah[l_cnt].faah000
        #170323-00047#1--add--e--xul
        #IF g_faaj[l_cnt].faaj006 = '2' THEN                                #160426-00014#6 mark
        IF g_faaj[l_cnt].faaj006 = '2' OR g_faaj[l_cnt].faaj006 = '4' THEN  #160426-00014#6 add
        #-------- 折舊明細檔 SQL (針對多部門分攤折舊金額) ---------------
        #161215-00044#1---modify----begin-----------------
        #LET g_sql=" SELECT * FROM faam_t WHERE faam004='",g_glaa_m.year,"'",
         LET g_sql=" SELECT faament,faamsite,faamld,faamcomp,faam000,faam001,faam002,faam003,faam004,faam005,faam006,",
                   "faam007,faam008,faam009,faam010,faam011,faam012,faam013,faam014,faam015,faam016,faam017,faam018,faam019,",
                   "faam020,faam021,faam022,faam023,faam024,faam025,faam026,faam027,faam028,faam029,faam030,faam031,faam032,",
                   "faam033,faam034,faam035,faam036,faam037,faam038,faam039,faam040,faam041,faam042,faam043,faam044,faam045,",
                   "faam046,faam047,faam048,faam049,faam050,faam101,faam102,faam103,faam104,faam105,faam106,faam107,faam108,",
                   "faam151,faam152,faam153,faam154,faam155,faam156,faam157,faam158,faamud001,faamud002,faamud003,faamud004,",
                   "faamud005,faamud006,faamud007,faamud008,faamud009,faamud010,faamud011,faamud012,faamud013,faamud014,",
                   "faamud015,faamud016,faamud017,faamud018,faamud019,faamud020,faamud021,faamud022,faamud023,faamud024,",
                   "faamud025,faamud026,faamud027,faamud028,faamud029,faamud030 FROM faam_t WHERE faam004='",g_glaa_m.year,"'",
        #161215-00044#1---modify----end-----------------
                  "                          AND faam005='",g_glaa_m.month,"'",
                  #"                          AND faam006='1' AND faam007 = '2'", #160426-00014#6 mark
                  "                          AND faam006='1' AND faam007 = '",g_faaj[l_cnt].faaj006,"'",  #160426-00014#6 add
                  "                          AND faam001='",g_faaj[l_cnt].faaj001,"'",
                  "                          AND faam002='",g_faaj[l_cnt].faaj002,"'",
                  "                          AND faam000='",g_faaj[l_cnt].faaj037,"'", #20141212 add by chening
                  "                          AND faament='",g_enterprise,"'",
                  "                          AND faamld='",g_glaa_m.glaald,"'"                  
        PREPARE p230_pre1 FROM g_sql
        DECLARE p230_cur1 CURSOR WITH HOLD FOR p230_pre1
        FOREACH p230_cur1 INTO g_faam1.*
           IF STATUS THEN
              #150731-00004#1 20150807 str---
              #CALL cl_errmsg('faaj001',g_faaj[l_cnt].faaj001,'','foreach p230_cur1',1)
              INITIALIZE g_errparam TO NULL
              LET g_errparam.code = 'foreach p230_cur1'
              LET g_errparam.extend = 'faaj001：'||g_faaj[l_cnt].faaj001
              LET g_errparam.popup = TRUE
              CALL cl_err()
              #150731-00004#1 20150807 end--- 
              LET g_cnt2 = g_cnt2 + 1
              LET g_success='N'
              CONTINUE FOREACH
           END IF
           
           #-->讀取分攤方式
           #IF NOT (g_faaj[l_cnt].faaj006 = '2' AND  g_faaj[l_cnt].faaj003 = '4')  THEN  #160329-00024#1  #160426-00014#6 mark  
           IF NOT ((g_faaj[l_cnt].faaj006 = '2' OR g_faaj[l_cnt].faaj006 = '4' ) AND  g_faaj[l_cnt].faaj003 = '4')  THEN   #160426-00014#6 add                   
#160426-00014#6 mod s--- 
#              SELECT faaf004 INTO l_faaf004 FROM faaf_t 
#                   WHERE faafent = g_enterprise AND faafld = g_glaa_m.glaald 
#                     AND faaf001 = g_glaa_m.year AND faaf002 = g_glaa_m.month 
#                     AND faaf003 = trim(g_faam1.faam008)   #20150825 --回追--
#                     AND faafstus = 'Y'  
              LET g_sql = " SELECT faaf004,faaf001,faaf002 FROM faaf_t ",   #160426-00014#39 add faaf001 lujh
                          "  WHERE faafent = '",g_enterprise,"' AND faafld = '",g_glaa_m.glaald,"'", 
                          "    AND ((faaf001 = ",g_glaa_m.year," AND faaf002 <= ",g_glaa_m.month,  #afai060中取最接近折旧期别的资料
                          "         ) OR faaf001 < ",g_glaa_m.year,")",    #160426-00014#39 add lujh
                          "    AND faafstus = 'Y' "
              IF g_faaj[l_cnt].faaj006 = '4' THEN 
                 LET g_sql = g_sql," AND faaf003 = '",g_faam1.faam008,"' "   #依标签部分分摊时，分摊类别=卡编+财编+附号  
              ELSE 
                 LET g_sql = g_sql," AND faaf003 = trim('",g_faam1.faam008,"')"             
              END IF 
              LET g_sql = g_sql ," ORDER BY faaf001 DESC,faaf002 DESC"   #160426-00014#39 add faaf001 DESC lujh
              PREPARE afap230_pre FROM g_sql
              DECLARE afap230_cur SCROLL CURSOR WITH HOLD FOR afap230_pre
              OPEN afap230_cur
              FETCH FIRST afap230_cur INTO l_faaf004,l_faaf001,l_faaf002   #160426-00014#39 add faaf001 lujh
              CLOSE afap230_cur              
#160426-00014#6 mod e---       
              #IF SQLCA.sqlcode THEN                        #160426-00014#6 mark
              IF SQLCA.sqlcode OR cl_null(l_faaf004) THEN   #160426-00014#6 add
                 #150731-00004#1 20150807 str---
                 #CALL cl_errmsg('faaj001',g_faaj[l_cnt].faaj001,'','afa-00062',1)
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.code = 'afa-00062'
                 LET g_errparam.extend = 'faaj001：'||g_faaj[l_cnt].faaj001
                 LET g_errparam.popup = TRUE
                 CALL cl_err()
                 #150731-00004#1 20150807 end--- 
                 LET g_cnt2 = g_cnt2 + 1
                 LET g_success='N'
                 CONTINUE FOREACH
              END IF
           END IF              #160329-00024#1 add 
           #-->讀取分母
           #IF l_faaf004='1' THEN  #160426-00014#6 mark
           IF l_faaf004='1' OR l_faaf004='3' THEN  #160426-00014#6 add
#160426-00014#6 mod s---           
#              SELECT SUM(faag007) INTO l_faag007 FROM faag_t
#                WHERE faagent = g_enterprise AND faagld = g_glaa_m.glaald
#                  AND faag001 = g_glaa_m.year AND faag002 = g_glaa_m.month
#                  AND faag003 = trim(g_faam1.faam008)#20150825 --回追-- 
              IF l_faaf004='1' THEN 
                 SELECT SUM(faag007) INTO l_faag007 FROM faag_t
                   WHERE faagent = g_enterprise AND faagld = g_glaa_m.glaald
                     #AND faag001 = g_glaa_m.year AND faag002 = l_faaf002      #160426-00014#39 mark lujh
                     AND faag001 = l_faaf001 AND faag002 = l_faaf002           #160426-00014#39 add lujh
                     AND faag003 = trim(g_faam1.faam008)#20150825 --回追--  
              ELSE
                 SELECT SUM(faag007) INTO l_faag007 FROM faag_t
                   WHERE faagent = g_enterprise AND faagld = g_glaa_m.glaald
                     #AND faag001 = g_glaa_m.year AND faag002 = l_faaf002      #160426-00014#39 mark lujh
                     AND faag001 = l_faaf001 AND faag002 = l_faaf002           #160426-00014#39 add lujh
                     AND faag003 = g_faam1.faam008            
              END IF              
#160426-00014#6 mod e---
              IF SQLCA.sqlcode OR cl_null(l_faag007) THEN
                 #150731-00004#1 20150807 str---
                 #CALL cl_errmsg('faaj001',g_faaj[l_cnt].faaj001,'','afa-00062',1)
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.code = 'afa-00062'
                 LET g_errparam.extend = 'faaj001：'||g_faaj[l_cnt].faaj001
                 LET g_errparam.popup = TRUE
                 CALL cl_err()
                 #150731-00004#1 20150807 end--- 
                 LET g_cnt2 = g_cnt2 + 1
                 LET g_success='N'
                 CONTINUE FOREACH
              END IF
              LET m_faag007 = l_faag007           # 分攤比率合計
           END IF
	    
           #-->保留金額以便處理尾差
           LET mm_faam013=g_faam1.faam013          # 被分攤金額
           LET mm_faam016=g_faam1.faam016          # 本年累折金額
           LET mm_faam014=g_faam1.faam014          # 被分攤成本
           LET mm_faam015=g_faam1.faam015          # 被分攤累折
           LET mm_faam018=g_faam1.faam018          # 被分攤減值
           #20141209 add by chenying 
           #mm_faam*始终作为最开始的总金额
           LET g_faam013=g_faam1.faam013          # 被分攤金額
           LET g_faam016=g_faam1.faam016          # 本年累折金額
           LET g_faam014=g_faam1.faam014          # 被分攤成本
           LET g_faam015=g_faam1.faam015          # 被分攤累折
           LET g_faam018=g_faam1.faam018          # 被分攤減值 
           #m_tot_faam*作为4舍5入后的总金额           
           LET m_tot_faam013 = 0                  # 累计 
           LET m_tot_curr    = 0                  # 累计
           LET m_tot_faam014 = 0                  # 累计
           LET m_tot_faam015 = 0                  # 累计
           LET m_tot_faam018 = 0                  # 累计
	        #20141209 add by chenying 
	        
           #------- 找 faag_t分攤單身檔 ---------------
           LET m_tot=0
           #160426-00014#6 add s---
           IF l_faaf004 = '3' THEN  
              #161215-00044#1---modify----begin-----------------
              #LET g_sql = " SELECT * FROM faag_t ",
              LET g_sql = " SELECT faagent,faagld,faag001,faag002,faag003,faag004,faag005,faag006,faag007,faag008,",
                          "faag009,faag010,faagud001,faagud002,faagud003,faagud004,faagud005,faagud006,faagud007,",
                          "faagud008,faagud009,faagud010,faagud011,faagud012,faagud013,faagud014,faagud015,faagud016,",
                          "faagud017,faagud018,faagud019,faagud020,faagud021,faagud022,faagud023,faagud024,faagud025,",
                          "faagud026,faagud027,faagud028,faagud029,faagud030 FROM faag_t ",
              #161215-00044#1---modify----end-----------------
                          "  WHERE faagent= '",g_enterprise,"' AND faagld='",g_faam1.faamld,"'",
                          #"    AND faag001= ",g_faam1.faam004,"  AND faag002= ",l_faaf002,   #160426-00014#39 mark lujh
                          "    AND faag001= ",l_faaf001,"  AND faag002= ",l_faaf002,          #160426-00014#39 add lujh
                          "    AND faag003= '",g_faam1.faam008,"'"  
           ELSE
              #161215-00044#1---modify----begin-----------------
              #LET g_sql = " SELECT * FROM faag_t ",
              LET g_sql = " SELECT faagent,faagld,faag001,faag002,faag003,faag004,faag005,faag006,faag007,faag008,",
                          "faag009,faag010,faagud001,faagud002,faagud003,faagud004,faagud005,faagud006,faagud007,",
                          "faagud008,faagud009,faagud010,faagud011,faagud012,faagud013,faagud014,faagud015,faagud016,",
                          "faagud017,faagud018,faagud019,faagud020,faagud021,faagud022,faagud023,faagud024,faagud025,",
                          "faagud026,faagud027,faagud028,faagud029,faagud030 FROM faag_t ",
              #161215-00044#1---modify----end-----------------
                          "  WHERE faagent= '",g_enterprise,"' AND faagld='",g_faam1.faamld,"'",
                          #"    AND faag001= ",g_faam1.faam004,"  AND faag002= ",l_faaf002,    #160426-00014#39 mark lujh
                          "    AND faag001= ",l_faaf001,"  AND faag002= ",l_faaf002,           #160426-00014#39 add lujh
                          "    AND faag003=trim('",g_faam1.faam008,"')" 
                                    
           END IF  
           PREPARE p230_pre2 FROM g_sql           
           DECLARE p230_cur2 CURSOR FOR p230_pre2          
           #160426-00014#6 add e---
#160426-00014#6 mark s---           
#           DECLARE p230_cur2 CURSOR WITH HOLD FOR        
#              SELECT * FROM faag_t
#               WHERE faagent=g_enterprise AND faagld=g_faam1.faamld
#                 AND faag001=g_faam1.faam004 AND faag002=g_faam1.faam005
#                #AND faag006=g_faam1.faam020   #无科目连接
#                 #AND faag003=trim(g_faam1.faam008) #20150825---回追---  #160426-00014#6 mark
#                 AND faag003=l_faag003 #20150825---回追---   #160426-00014#6 add 
#160426-00014#6 mark e---
           FOREACH p230_cur2 INTO g_faag.*
              IF SQLCA.sqlcode OR (cl_null(l_faag007) AND l_faaf004='1') THEN
                 #150731-00004#1 20150807 str---
                 #CALL cl_errmsg('faaj001',g_faaj[l_cnt].faaj001,'','afa-00062',1)
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.code = 'afa-00062'
                 LET g_errparam.extend = 'faaj001：'||g_faaj[l_cnt].faaj001
                 LET g_errparam.popup = TRUE
                 CALL cl_err()
                 #150731-00004#1 20150807 end--- 
                 LET g_cnt2 = g_cnt2 + 1
                 LET g_success='N'
                 CONTINUE FOREACH
              END IF
              
              #CASE l_faaf004                         #160426-00014#6 mark
                 #WHEN '1'                            #160426-00014#6 mark
               CASE
                 WHEN l_faaf004='1' OR l_faaf004='3'  #160426-00014#6 add
                    LET m_max_ratio = 0     #20141209 add by chenying  获取最大分摊率的部门和比率    
                    LET m_max_faag005 =''   #20141209 add by chenying  
                    LET l_cnt1 = 0
                    SELECT COUNT(*) INTO l_cnt1
                      FROM faam_t
                     WHERE faament = g_enterprise AND faamld=g_faam1.faamld
                       AND faam001=g_faam1.faam001 AND faam002=g_faam1.faam002
                       AND faam000=g_faam1.faam000 #20141212 add by chening
                       AND faam004=g_faam1.faam004 AND faam005=g_faam1.faam005
                       AND faam009=g_faag.faag005 AND faam007='3'
                       AND (faam006 = '1' OR faam006='0')
#                    LET mm_ratio=g_faag.faag007/m_faag007*100      # 分攤比率(存入faam016用)
#                    LET m_ratio=g_faag.faag007/l_faag007*100       # 分攤比率
#                    LET m_faam013=m_faam013*m_ratio/100            # 分攤金額
#                    LET m_curr=m_faam016*m_ratio/100               # 分攤金額
#                    LET m_faam014=m_faam014*m_ratio/100            # 分攤成本
#                    LET m_faam015=m_faam015*m_ratio/100            # 分攤累折
#                    LET m_faam018=m_faam018*m_ratio/100            # 分攤減值
                    LET mm_ratio=g_faag.faag007/m_faag007*100      # 分攤比率(存入faam016用)
                    LET m_ratio=g_faag.faag007/l_faag007*100       # 分攤比率
#20141209 mark by chenying--------------------------------------------                    
#                    LET m_faam013=mm_faam013*m_ratio/100            # 分攤金額
#                    LET m_curr=mm_faam016*m_ratio/100               # 分攤金額
#                    LET m_faam014=mm_faam014*m_ratio/100            # 分攤成本
#                    LET m_faam015=mm_faam015*m_ratio/100            # 分攤累折
#                    LET m_faam018=mm_faam018*m_ratio/100            # 分攤減值
#                    LET l_faag007 = l_faag007 - g_faag.faag007     # 總分攤比率減少
#                    LET mm_faam013 = mm_faam013 - m_faam013
#                    LET mm_faam016 = mm_faam016 - m_curr
#                    LET mm_faam014 = mm_faam014 - m_faam014
#                    LET mm_faam015 = mm_faam015 - m_faam015
#                    LET mm_faam018 = mm_faam018 - m_faam018
                    LET m_faam013=g_faam013*m_ratio/100            # 分攤金額
                    LET m_curr   =g_faam016*m_ratio/100               # 分攤金額
                    LET m_faam014=g_faam014*m_ratio/100            # 分攤成本
                    LET m_faam015=g_faam015*m_ratio/100            # 分攤累折
                    LET m_faam018=g_faam018*m_ratio/100            # 分攤減值
                    LET g_faam013 = g_faam013 - m_faam013
                    LET g_faam016 = g_faam016 - m_curr
                    LET g_faam014 = g_faam014 - m_faam014
                    LET g_faam015 = g_faam015 - m_faam015
                    LET g_faam018 = g_faam018 - m_faam018                    
                    LET l_faag007 = l_faag007 - g_faag.faag007     # 總分攤比率減少
                    
                    #记录最大分摊比率的部门，用于尾差处理
                    IF m_ratio > m_max_ratio THEN
                       LET m_max_faag005 = g_faag.faag005
                       LET m_max_ratio = m_ratio
                    END IF 
#20141209 mark by chenying----------------------------------------------                    
                    IF l_cnt1 > 0 THEN
                       #20141106 add--str--
                       LET m_faam013 = s_num_round('1',m_faam013,l_ooaj004) 
                       LET m_faam014 = s_num_round('1',m_faam014,l_ooaj004)
                       LET m_faam015 = s_num_round('1',m_faam015,l_ooaj004)
                       LET m_curr    = s_num_round('1',m_curr,l_ooaj004)
                       LET m_faam018 = s_num_round('1',m_faam018,l_ooaj004)
                       #20141106 add--end--
                       #20141209 add by chenying
                       LET m_tot_faam013=m_tot_faam013+m_faam013  
                       LET m_tot_curr   =m_tot_curr   +m_curr  
                       LET m_tot_faam014=m_tot_faam014+m_faam014  
                       LET m_tot_faam015=m_tot_faam015+m_faam015  
                       LET m_tot_faam018=m_tot_faam018+m_faam018
                       #20141209 add by chenying
                       UPDATE faam_t SET faam013 = m_faam013,
                                           faam016 = m_curr,
                                           faam010 = g_faam1.faam009,
                                           faam022 = g_faag.faag006,
                                           faam014 = m_faam014,
                                           faam015 = m_faam015,
                                           faam017 = g_faag.faag007,
                                           faam018 = m_faam018
                                            
                                     WHERE faament = g_enterprise AND faamld=g_faam1.faamld
                                       AND faam001=g_faam1.faam001 AND faam002=g_faam1.faam002
                                       AND faam004=g_faam1.faam004 AND faam005=g_faam1.faam005
                                       AND faam009=g_faam1.faam009 AND faam007='3'
                                       AND (faam006 = '1' OR faam006='0')           
	    
                       IF STATUS OR SQLCA.SQLERRD[3]=0 THEN
                          #150731-00004#1 20150807 str---
                          #CALL cl_errmsg('faaj001',g_faaj[l_cnt].faaj001,'','upd faam_t',1)
                          INITIALIZE g_errparam TO NULL
                          LET g_errparam.code = 'upd faam_t'
                          LET g_errparam.extend = 'faaj001：'||g_faaj[l_cnt].faaj001
                          LET g_errparam.popup = TRUE
                          CALL cl_err()
                          #150731-00004#1 20150807 end--- 
                          LET g_cnt2 = g_cnt2 + 1
                          LET g_success='N'
                          CONTINUE FOREACH
                       END IF
                    ELSE
                       IF cl_null(g_faag.faag005) THEN
                          LET g_faag.faag005=' '
                       END IF
                       #---本位币二---
                       IF g_glaa015 = 'Y' THEN
                          LET g_faam1.faam103 = m_faam014 * g_faam.faam102  #成本
                          LET g_faam1.faam104 = m_faam013 * g_faam.faam102  #折旧金额
                          LET g_faam1.faam105 = m_faam015 * g_faam.faam102  #累折
                          LET g_faam1.faam106 = m_curr * g_faam.faam102  #本年累折
                          LET g_faam1.faam107 = (g_faaj[l_cnt].faaj021 - g_faaj[l_cnt].faaj027) * g_faam.faam102  #年折旧额
                          LET g_faam1.faam108 = m_faam018 * g_faam.faam102  #已提列减值准备
                       END IF
                       #---本位币三---
                       IF g_glaa019 = 'Y' THEN
                          LET g_faam1.faam153 = m_faam014 * g_faam.faam152  #成本
                          LET g_faam1.faam154 = m_faam013 * g_faam.faam152  #折旧金额
                          LET g_faam1.faam155 = m_faam015 * g_faam.faam152  #累折
                          LET g_faam1.faam156 = m_curr * g_faam.faam152  #本年累折
                          LET g_faam1.faam157 = (g_faaj[l_cnt].faaj022+m_faam013) * g_faam.faam152  #年折旧额
                          LET g_faam1.faam158 = m_faam018 * g_faam.faam152  #已提列减值准备
                       END IF
                       
                       #20141106 --add--str--
                       #小数位数
                       #161215-00044#1---modify----begin-----------------
                       #SELECT * INTO g_glaa_t.* 
                       SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,
                       glaald,glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,
                       glaa011,glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,
                       glaa023,glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,
                       glaa121,glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,
                       glaa139,glaa140,glaa123,glaa124,glaa028 INTO g_glaa_t.*
                       #161215-00044#1---modify----end----------------- 
                       FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_glaa_m.glaald
                       SELECT ooaj003,ooaj004 INTO l_ooaj003,l_ooaj004 FROM ooaj_t WHERE ooajent = g_enterprise
                         #AND ooaj001 = g_glaa_t.glaa026 AND ooaj002 = g_faaj[l_cnt].faaj014   #150812-00010#3 mark
                          AND ooaj001 = g_glaa_t.glaa026 AND ooaj002 = g_glaa_t.glaa001        #150812-00010#3                            
                       SELECT ooaj004 INTO l_ooaj0042 FROM ooaj_t WHERE ooajent = g_enterprise
                          AND ooaj001 = g_glaa_t.glaa026 AND ooaj002 = g_glaa_t.glaa016
                       SELECT ooaj004 INTO l_ooaj0043 FROM ooaj_t WHERE ooajent = g_enterprise
                          AND ooaj001 = g_glaa_t.glaa026 AND ooaj002 = g_glaa_t.glaa020 
                          
                       #本位币
                       LET g_faam1.faam012 = g_faaj[l_cnt].faaj015
                       LET g_faam1.faam013 = m_faam013
                       LET g_faam1.faam014 = m_faam014
                       LET g_faam1.faam015 = m_faam015
                       LET g_faam1.faam016 = m_curr
                       LET g_faam1.faam018 = m_faam018  
                       LET g_faam1.faam019 = 0
#                       #汇率            
#                       LET g_faam1.faam012 =  s_num_round('1',g_faam1.faam012,l_ooaj003)  
                       LET g_faam1.faam013 =  s_num_round('1',g_faam1.faam013,l_ooaj004) 
                       LET g_faam1.faam014 =  s_num_round('1',g_faam1.faam014,l_ooaj004)
                       LET g_faam1.faam015 =  s_num_round('1',g_faam1.faam015,l_ooaj004)
                       LET g_faam1.faam016 =  s_num_round('1',g_faam1.faam016,l_ooaj004)
                       LET g_faam1.faam018 =  s_num_round('1',g_faam1.faam018,l_ooaj004)
                       LET g_faam1.faam019 =  s_num_round('1',g_faam1.faam019,l_ooaj004)
                       #本位币二
#                       #汇率          
#                       LET g_faam1.faam102 =  s_num_round('1',g_faam1.faam102,l_ooaj003)
                       LET g_faam1.faam103 =  s_num_round('1',g_faam1.faam103,l_ooaj0042)
                       LET g_faam1.faam104 =  s_num_round('1',g_faam1.faam104,l_ooaj0042)
                       LET g_faam1.faam105 =  s_num_round('1',g_faam1.faam105,l_ooaj0042)
                       LET g_faam1.faam106 =  s_num_round('1',g_faam1.faam106,l_ooaj0042)
                       LET g_faam1.faam107 =  s_num_round('1',g_faam1.faam107,l_ooaj0042)
                       LET g_faam1.faam108 =  s_num_round('1',g_faam1.faam108,l_ooaj0042) 
#                       #本位币三
#                       LET g_faam1.faam152 =  s_num_round('1',g_faam1.faam152,l_ooaj003)
                       LET g_faam1.faam153 =  s_num_round('1',g_faam1.faam153,l_ooaj0043)
                       LET g_faam1.faam154 =  s_num_round('1',g_faam1.faam154,l_ooaj0043)
                       LET g_faam1.faam155 =  s_num_round('1',g_faam1.faam155,l_ooaj0043)
                       LET g_faam1.faam156 =  s_num_round('1',g_faam1.faam156,l_ooaj0043)
                       LET g_faam1.faam157 =  s_num_round('1',g_faam1.faam157,l_ooaj0043)
                       LET g_faam1.faam158 =  s_num_round('1',g_faam1.faam158,l_ooaj0043)
                       #20141106 --add--end-- 
                       #20141209 add by chenying
                       LET m_tot_faam013=m_tot_faam013+g_faam1.faam013
                       LET m_tot_curr   =m_tot_curr   +g_faam1.faam016  
                       LET m_tot_faam014=m_tot_faam014+g_faam1.faam014  
                       LET m_tot_faam015=m_tot_faam015+g_faam1.faam015  
                       LET m_tot_faam018=m_tot_faam018+g_faam1.faam018
                       #20141209 add by chenying
                       INSERT INTO faam_t(faament,faamsite,faamld,faamcomp,faam000,faam001,
                              faam002,faam003,faam004,faam005,faam006,
                              faam007,faam008,faam009,faam010,faam011,
                              faam012,faam013,faam014,faam015,faam016,
                              faam017,faam018,faam019,faam020,faam021,faam022,faam023,faam024,faam025,faam026,
                              faam027,faam028,faam029,faam030,faam031,faam032,faam033,faam034,faam035,faam036,
                              faam101,faam102,faam103,faam104,faam105,faam106,faam107,faam108,
                              faam151,faam152,faam153,faam154,faam155,faam156,faam157,faam158)  
                       VALUES(g_enterprise,g_glaa_m.faamsite,g_faaj[l_cnt].faajld,g_glaacomp,g_faah[l_cnt].faah001,g_faaj[l_cnt].faaj001,
                              g_faaj[l_cnt].faaj002,g_faaj[l_cnt].faaj003,g_glaa_m.year,g_glaa_m.month,'1',  #1-10
                              '3',g_faaj[l_cnt].faaj007,g_faag.faag005,g_faam1.faam009,g_faaj[l_cnt].faaj014,  #11~15
                              g_faam1.faam012,g_faam1.faam013,g_faam1.faam014,g_faam1.faam015,g_faam1.faam016,g_faag.faag007,g_faam1.faam018, #16~22 #20150202 mod g_faag.faag007/100--->g_faag.faag007 by chenying 
                              g_faam1.faam019,g_faam1.faam020,g_faam1.faam021,g_faag.faag006,  #19~22，faam019先给0，不做计算，先faam019=g_faaj[l_cnt].faaj022+m_faam013
                              g_faaj[l_cnt].faaj026,'','',g_faah[l_cnt].faah015,g_faaj[l_cnt].faajsite,g_faaj[l_cnt].faaj039, #161104-00048#2 mark #161104-00048#3 remark
                              #g_faaj[l_cnt].faaj026,'','',l_faaj038,g_faaj[l_cnt].faajsite,g_faaj[l_cnt].faaj039,#161104-00048#2 add #161104-00048#3 add
                              g_faaj[l_cnt].faaj040,g_faaj[l_cnt].faaj041,g_faaj[l_cnt].faaj042,g_faaj[l_cnt].faaj043,
                              g_faaj[l_cnt].faaj044,'',g_faaj[l_cnt].faaj045,g_faaj[l_cnt].faaj046,
                              g_faam1.faam101,g_faam1.faam102,
                              g_faam1.faam103,g_faam1.faam104,g_faam1.faam105, 
                              g_faam1.faam106,g_faam1.faam107,g_faam1.faam108,g_faam1.faam151,g_faam1.faam152,g_faam1.faam153, 
                              g_faam1.faam154,g_faam1.faam155,g_faam1.faam156,g_faam1.faam157,g_faam1.faam158)                              
                       IF STATUS THEN
                          #150731-00004#1 20150807 str---
                          #CALL cl_errmsg('faaj001',g_faaj[l_cnt].faaj001,'','ins faam_t',1)
                          INITIALIZE g_errparam TO NULL
                          LET g_errparam.code = 'ins faam_t'
                          LET g_errparam.extend = 'faaj001：'||g_faaj[l_cnt].faaj001
                          LET g_errparam.popup = TRUE
                          CALL cl_err()
                          #150731-00004#1 20150807 end--- 
                          LET g_cnt2 = g_cnt2 + 1
                          LET g_success='N'
                          CONTINUE FOREACH
                       END IF
                    END IF
# dennon lai 01/04/18 本期累折=今年度本期折舊(fan07)的加總
#                       累積折舊=全期本期折舊(fan07)的加總
               #No.3426 010824 modify 若用上述方法在年中導入時折舊會少
                  #例7月導入,fan 6月資料,本月折舊fan07=6月折舊金額, 故用
                  #select sum(fan07)的方法會少1-5 月的折舊金額
                  #故改成抓前一期累折+本月的折舊
                       IF g_faam1.faam005=1 THEN
                          LET p_yy = g_faam1.faam004-1
                          LET p_mm=12
                       ELSE
                          LET p_yy = g_faam1.faam004
                          LET p_mm=g_faam1.faam005-1
                       END IF
                        LET p_faam016=0  LET p_faam015=0
                        SELECT SUM(faam016),SUM(faam015) INTO p_faam016,p_faam015
                          FROM faam_t
                         WHERE faament = g_enterprise AND faamld=g_faam1.faamld
                           AND faam001=g_faam1.faam001 AND faam002=g_faam1.faam002
                           AND faam000=g_faam1.faam000 #20141212 add by chening
                           AND faam004=p_yy AND faam005=p_mm
                           AND faam009=g_faag.faag005 AND faam007='3'
                           AND (faam006 = '1' OR faam006='0')
                       IF SQLCA.SQLCODE THEN
                          LET p_faam016=0   LET p_faam015=0
                       END IF
                       IF cl_null(p_faam016) THEN
                          LET p_faam016=0
                       END IF
                       IF cl_null(p_faam015) THEN
                          LET p_faam015=0
                       END IF
                       IF g_faam.faam005 = 1 THEN
                          LET p_faam016= 0
                       END IF
                       LET p_faam016_1=0  LET p_faam015_1=0
                       SELECT SUM(faam013),SUM(faam013) INTO p_faam016_1,p_faam015_1 
                      #SELECT SUM(faam016),SUM(faam015) INTO p_faam016_1,p_faam015_1                       
                         FROM faam_t
                        WHERE faament = g_enterprise AND faamld=g_faam1.faamld
                           AND faam001=g_faam1.faam001 AND faam002=g_faam1.faam002
                           AND faam000=g_faam1.faam000 #20141212 add by chening
                           AND faam004=p_yy AND faam005=p_mm
                           AND faam009=g_faag.faag005 AND faam007='3'
                           AND faam006 = '2'
                       IF SQLCA.SQLCODE THEN
                          LET p_faam016_1=0   LET p_faam015_1=0
                       END IF
                       IF cl_null(p_faam016_1) THEN LET p_faam016_1=0 END IF
                       IF cl_null(p_faam015_1) THEN LET p_faam015_1=0 END IF
                       IF g_faam.faam005 = 1 THEN LET p_faam016_1 = 0 END IF
 
                       LET g_faam013_year = p_faam016 +m_faam013 + p_faam016_1
                       LET g_faam013_all  = p_faam015 +m_faam013 + p_faam015_1    
#20141209 mark by chenying                          
#分摊前已经算上当期的本月折旧了,分摊后数据不用再考虑，直接按比率计算
#                       SELECT COUNT(*) INTO g_cnt FROM faam_t
#                        WHERE faament = g_enterprise AND faamld=g_faam1.faamld
#                          AND faam001=g_faam1.faam001 AND faam002=g_faam1.faam002
#                          AND faam004=g_faam1.faam004 AND faam005=g_faam1.faam005
#                          AND faam009=g_faag.faag005 AND faam007='3'
#                          AND faam006 = '1'
#                       IF g_cnt>0 THEN
#                          LET g_faam013_year = s_num_round('1',g_faam013_year,l_ooaj004) #20141106 add
#                          LET g_faam013_all  = s_num_round('1',g_faam013_all,l_ooaj004) #20141106 add
##                          UPDATE faam_t SET faam016=g_faam013_year,faam015=g_faam013_all                #20141209 mark by chenying 
#                          UPDATE faam_t SET faam016=faam016+g_faam013_year,faam015=faam015+g_faam013_all #20141209 mark by chenying 
#                           WHERE faament = g_enterprise AND faamld=g_faam1.faamld
#                             AND faam001=g_faam1.faam001 AND faam002=g_faam1.faam002
#                             AND faam004=g_faam1.faam004 AND faam005=g_faam1.faam005
#                             AND faam009=g_faag.faag005 AND faam007='3'
#                             AND faam006 = '1'
#                          IF SQLCA.SQLCODE OR SQLCA.SQLERRD[3]=0 THEN
#                             CALL cl_errmsg('faaj001',g_faaj[l_cnt].faaj001,'','upd faam_t',1)
#                             LET g_cnt2 = g_cnt2 + 1
#                             LET g_success='N'
#                             CONTINUE FOREACH
#                          END IF
#                       END IF
#20141209 mark by chenying

                 #WHEN '2'              #160426-00014#6 mark 
                 WHEN l_faaf004 = '2'   #160426-00014#6 add
                       IF g_faag.faag008 = '1' THEN  #变动比率类型1:科目 #170712-00043#1 add xul 
                          LET l_glac007 = ''
                          SELECT glac007 INTO l_glac007 FROM glac_t
                           WHERE glacent = g_enterprise AND glac001=g_glaa004
                             AND glac002 = g_faag.faag009
                          IF l_glac007='1' THEN
                             SELECT SUM(glar005-glar006) INTO m_glar FROM glar_t
                              WHERE glarent =g_enterprise AND glarld=g_glaa_m.glaald
                                AND glar001 =g_faag.faag009 AND glar002=g_glaa_m.year
                                AND glar003 <=g_glaa_m.month
                          ELSE
                             SELECT glar005-glar006 INTO m_glar FROM glar_t
                              WHERE glarent =g_enterprise AND glarld=g_glaa_m.glaald
                                AND glar001 =g_faag.faag009 AND glar002=g_glaa_m.year
                                AND glar003 =g_glaa_m.month
                          END IF
                          IF STATUS=100 OR m_glar IS NULL THEN LET m_glar=0 END IF                          
                       #170712-00043#1--add--s--xul   
                       ELSE 
                       #变动比率类型2:人数
                       #变动数值合计 当分母，各变动值当分子 
                       LET m_glar = g_faag.faag010
                       IF cl_null(m_glar) THEN LET m_glar = 0  END IF                       
                       END IF
                       #170712-00043#1--add--e--xul                         
                       LET m_tot=m_tot+m_glar          ## 累加變動比率分母金額
 
                 END CASE
              END FOREACH 
         
                IF l_faaf004 = '2' THEN
 
                    LET m_max_ratio = 0         
                    LET m_max_faag005 =''
                    LET l_glac007 = '' 
                    
                    SELECT glac007 INTO l_glac007 FROM glac_t
                     WHERE glacent = g_enterprise AND glac001=g_glaa004
                       AND glac002 = g_faag.faag009

                       #20141217 add by chenying
                       LET g_faam013=g_faam1.faam013          # 被分攤金額
                       LET g_faam014=g_faam1.faam014          # 被分攤成本
                       LET g_faam015=g_faam1.faam015          # 被分攤累折
                       LET g_faam018=g_faam1.faam018          # 被分攤減值 
                       #20141217 add by chenying
                       
                     FOREACH p230_cur2 INTO g_faag.* 
                       IF g_faag.faag008 = '1' THEN  #变动比率类型1:科目 #170712-00043#1 add xul 
                          IF l_glac007='1' THEN
                             SELECT SUM(glar005-glar006) INTO m_glar FROM glar_t
                              WHERE glarent =g_enterprise AND glarld=g_glaa_m.glaald
                                AND glar001 =g_faag.faag009 AND glar002=g_glaa_m.year
                                AND glar003 <=g_glaa_m.month
                          ELSE
                             SELECT glar005-glar006 INTO m_glar FROM glar_t
                              WHERE glarent =g_enterprise AND glarld=g_glaa_m.glaald
                                AND glar001 =g_faag.faag009 AND glar002=g_glaa_m.year
                                AND glar003 =g_glaa_m.month
                          END IF  
                          IF STATUS=100 OR m_glar IS NULL THEN
                             LET m_glar=0
                          END IF
                       #170712-00043#1--add--s--xul      
                       ELSE
                          #变动比率类型2:人数
                          #变动数值合计 当分母，各变动值当分子 
                          LET m_glar = g_faag.faag010
                          IF cl_null(m_glar) THEN LET m_glar = 0  END IF                       
                       END IF
                       #170712-00043#1--add--e--xul   
                       SELECT SUM(faam013) INTO y_curr FROM faam_t
                        WHERE faament = g_enterprise AND faamld = g_glaa_m.glaald
                          AND faam001 = g_faam1.faam001 AND faam002 = g_faam1.faam002
                          AND faam000 = g_faam1.faam000 #20141212 add by chening
                          AND faam004 = g_glaa_m.year AND faam005 < g_glaa_m.month
                          AND faam009 = g_faag.faag005 AND faam007 = '3'
			       
                       IF cl_null(y_curr) THEN
                          LET y_curr = 0
                       END IF
                       LET m_ratio = m_glar/m_tot*100
                       IF m_ratio > m_max_ratio THEN
                          LET m_max_faag005 = g_faag.faag005
                          LET m_max_ratio = m_ratio
                       END IF
                       

                       
                       IF cl_null(g_faaj[l_cnt].faaj017) THEN LET g_faaj[l_cnt].faaj017 = 0 END IF
                       IF cl_null(g_faaj[l_cnt].faaj018) THEN LET g_faaj[l_cnt].faaj018 = 0 END IF
#20141217 mark by chenying
#                       LET m_faam013=g_faam1.faam013*m_ratio/100  #折旧金额
#                       LET m_curr = y_curr + m_faam013            #本年累折
#                       LET m_faam014=g_faam1.faam014*m_ratio/100  #成本
#                       LET m_faam015=g_faam1.faam015*m_ratio/100  #累折
#                       LET m_faam018=g_faam1.faam018*m_ratio/100  #已提列减值准备
#20141217 mark by chenying
                       #20141217 add by chenying
                       LET m_faam013 = g_faam013*m_ratio/100  #折旧金额
                       LET m_curr    = y_curr + m_faam013     #本年累折
                       LET m_faam014 = g_faam014*m_ratio/100  #成本
                       LET m_faam015 = g_faam015*m_ratio/100  #累折
                       LET m_faam018 = g_faam018*m_ratio/100  #已提列减值准备                                                 
                       #20141217 add by chenying
                       
                       LET m_tot_faam013=m_tot_faam013+m_faam013
                       LET m_tot_curr   =m_tot_curr +m_curr
                       LET m_tot_faam014=m_tot_faam014+m_faam014
                       LET m_tot_faam015=m_tot_faam015+m_faam015
                       LET m_tot_faam018=m_tot_faam018+m_faam018
                       SELECT COUNT(*) INTO g_cnt FROM faam_t
                        WHERE faament = g_enterprise AND faamld = g_glaa_m.glaald
                          AND faam001 = g_faam1.faam001 AND faam002 = g_faam1.faam002
                          AND faam000 = g_faam1.faam000 #20141212 add by chening
                          AND faam004 = g_glaa_m.year AND faam005 < g_glaa_m.month
                          AND faam009 = g_faag.faag005 AND faam007 = '3'
                          AND faam006 = '2'
                       IF g_cnt>0 THEN
                          #20141106 --add--str-- 
                          LET m_faam013 =  s_num_round('1',m_faam013,l_ooaj004) 
                          LET m_curr    =  s_num_round('1',m_curr,l_ooaj004)
                          LET m_faam018 =  s_num_round('1',m_faam018,l_ooaj004)
                          #20141106 --add--end--
                      
                          UPDATE faam_t SET faam013 = m_faam013,
                                            faam016 = m_curr,
                                            faam010 = g_faam1.faam010,
                                            faam022 = g_faag.faag006,
                                            faam017 = m_ratio,
                                            faam018 = m_faam018
                           WHERE faament = g_enterprise AND faamld = g_glaa_m.glaald
                             AND faam001 = g_faam1.faam001 AND faam002 = g_faam1.faam002
                             AND faam004 = g_glaa_m.year AND faam005 < g_glaa_m.month
                             AND faam009 = g_faag.faag005 AND faam007 = '3'
                             AND faam006 = '2'
                          IF STATUS OR SQLCA.sqlerrd[3] = 0 THEN
                             #150731-00004#1 20150807 str---
                             #CALL cl_errmsg('faaj001',g_faaj[l_cnt].faaj001,'','upd faam_t',1)
                             INITIALIZE g_errparam TO NULL
                             LET g_errparam.code = 'upd faam_t'
                             LET g_errparam.extend = 'faaj001：'||g_faaj[l_cnt].faaj001
                             LET g_errparam.popup = TRUE
                             CALL cl_err()
                             #150731-00004#1 20150807 end--- 
                             LET g_cnt2 = g_cnt2 + 1
                             LET g_success='N'
                             CONTINUE FOREACH
                          END IF
                       ELSE
                          IF cl_null(g_faag.faag005) THEN
                             LET g_faag.faag005=' '
                          END IF
                          #---本位币二---
                          IF g_glaa015 = 'Y' THEN
                             LET g_faam1.faam103 = m_faam014 * g_faam.faam102  #成本
                             LET g_faam1.faam104 = m_faam013 * g_faam.faam102  #折旧金额
                             LET g_faam1.faam105 = m_faam015 * g_faam.faam102  #累折
                             LET g_faam1.faam106 = m_curr * g_faam.faam102  #本年累折
                             LET g_faam1.faam107 = (g_faaj[l_cnt].faaj021 - g_faaj[l_cnt].faaj027) * g_faam.faam102  #年折旧额
                             LET g_faam1.faam108 = m_faam018 * g_faam.faam102  #已提列减值准备
                          END IF
                          #---本位币三---
                          IF g_glaa019 = 'Y' THEN
                             LET g_faam1.faam153 = m_faam014 * g_faam.faam152  #成本
                             LET g_faam1.faam154 = m_faam013 * g_faam.faam152  #折旧金额
                             LET g_faam1.faam155 = m_faam015 * g_faam.faam152  #累折
                             LET g_faam1.faam156 = m_curr * g_faam.faam152  #本年累折
                             LET g_faam1.faam157 = (g_faaj[l_cnt].faaj022+m_faam013) * g_faam.faam152  #年折旧额
                             LET g_faam1.faam158 = m_faam018 * g_faam.faam152  #已提列减值准备
                          END IF
                          
                          #20141106 --add--str--
                          #小数位数
                          #161215-00044#1---modify----begin-----------------
                          #SELECT * INTO g_glaa_t.* 
                          SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,
                          glaald,glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,
                          glaa011,glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,
                          glaa023,glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,
                          glaa121,glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,
                          glaa139,glaa140,glaa123,glaa124,glaa028 INTO g_glaa_t.*
                          #161215-00044#1---modify----end----------------- 
                          FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_glaa_m.glaald
                          SELECT ooaj003,ooaj004 INTO l_ooaj003,l_ooaj004 FROM ooaj_t WHERE ooajent = g_enterprise
                            #AND ooaj001 = g_glaa_t.glaa026 AND ooaj002 = g_faaj[l_cnt].faaj014   #150812-00010#3 mark
                             AND ooaj001 = g_glaa_t.glaa026 AND ooaj002 = g_glaa_t.glaa001        #150812-00010#3                                
                          SELECT ooaj004 INTO l_ooaj0042 FROM ooaj_t WHERE ooajent = g_enterprise
                             AND ooaj001 = g_glaa_t.glaa026 AND ooaj002 = g_glaa_t.glaa016
                          SELECT ooaj004 INTO l_ooaj0043 FROM ooaj_t WHERE ooajent = g_enterprise
                             AND ooaj001 = g_glaa_t.glaa026 AND ooaj002 = g_glaa_t.glaa020 
                             
                          #本位币
                          LET g_faam1.faam012 = g_faaj[l_cnt].faaj015
                          LET g_faam1.faam013 = m_faam013
                          LET g_faam1.faam014 = m_faam014
                          LET g_faam1.faam015 = m_faam015
                          LET g_faam1.faam016 = m_curr
                          LET g_faam1.faam018 = m_faam018  
                          LET g_faam1.faam019 = 0
#                          #汇率            
#                          LET g_faam1.faam012 = s_num_round('1',g_faam1.faam012,l_ooaj003)
                          LET g_faam1.faam013 = s_num_round('1',g_faam1.faam013,l_ooaj004) 
                          LET g_faam1.faam014 = s_num_round('1',g_faam1.faam014,l_ooaj004)
                          LET g_faam1.faam015 = s_num_round('1',g_faam1.faam015,l_ooaj004)
                          LET g_faam1.faam016 = s_num_round('1',g_faam1.faam016,l_ooaj004)
                          LET g_faam1.faam018 = s_num_round('1',g_faam1.faam018,l_ooaj004)
                          LET g_faam1.faam019 = s_num_round('1',g_faam1.faam019,l_ooaj004)
                          #本位币二
#                          #汇率          
#                          LET g_faam1.faam102 = s_num_round('1',g_faam1.faam102,l_ooaj003)
                          LET g_faam1.faam103 = s_num_round('1',g_faam1.faam103,l_ooaj0042)
                          LET g_faam1.faam104 = s_num_round('1',g_faam1.faam104,l_ooaj0042)
                          LET g_faam1.faam105 = s_num_round('1',g_faam1.faam105,l_ooaj0042)
                          LET g_faam1.faam106 = s_num_round('1',g_faam1.faam106,l_ooaj0042)
                          LET g_faam1.faam107 = s_num_round('1',g_faam1.faam107,l_ooaj0042)
                          LET g_faam1.faam108 = s_num_round('1',g_faam1.faam108,l_ooaj0042) 
                          #本位币三
#                          LET g_faam1.faam152 = s_num_round('1',g_faam1.faam152,l_ooaj003)
                          LET g_faam1.faam153 = s_num_round('1',g_faam1.faam153,l_ooaj0043)
                          LET g_faam1.faam154 = s_num_round('1',g_faam1.faam154,l_ooaj0043)
                          LET g_faam1.faam155 = s_num_round('1',g_faam1.faam155,l_ooaj0043)
                          LET g_faam1.faam156 = s_num_round('1',g_faam1.faam156,l_ooaj0043)
                          LET g_faam1.faam157 = s_num_round('1',g_faam1.faam157,l_ooaj0043)
                          LET g_faam1.faam158 = s_num_round('1',g_faam1.faam158,l_ooaj0043)
                          #20141106 --add--end-- 
                       
                          INSERT INTO faam_t(faament,faamsite,faamld,faamcomp,faam000,faam001,faam002,faam003,faam004,faam005,faam006,
                                            faam007,faam008,faam009,faam010,faam011,faam012,faam013,faam014,faam015,faam016,
                                            faam017,faam018,faam019,faam020,faam021,faam022,faam023,faam024,faam025,faam026,
                                            faam027,faam028,faam029,faam030,faam031,faam032,faam033,faam034,faam035,faam036,
                                            faam101,faam102,faam103,faam104,faam105,faam106,faam107,faam108,
                                            faam151,faam152,faam153,faam154,faam155,faam156,faam157,faam158)  
                                VALUES(g_enterprise,g_glaa_m.faamsite,g_faaj[l_cnt].faajld,g_glaacomp,g_faah[l_cnt].faah001,g_faaj[l_cnt].faaj001,
                                       g_faaj[l_cnt].faaj002,g_faaj[l_cnt].faaj003,g_glaa_m.year,g_glaa_m.month,'1',  #1-6
                                       '3',g_faaj[l_cnt].faaj007,g_faag.faag005,g_faam1.faam009,g_faaj[l_cnt].faaj014,  #7~11
                                       g_faam1.faam012,g_faam1.faam013,g_faam1.faam014,g_faam1.faam015,g_faam1.faam016,m_ratio,g_faam1.faam018, #12~18
                                       g_faam1.faam019,g_faam1.faam020,g_faam1.faam021,g_faag.faag006,  #19~22，faam019先给0，不做计算，先faam019=g_faaj[l_cnt].faaj022+m_faam013
                                       g_faaj[l_cnt].faaj026,'','',g_faah[l_cnt].faah015,g_faaj[l_cnt].faajsite,g_faaj[l_cnt].faaj039, #161104-00048#2  mark #161104-00048#3 remark
                                       #g_faaj[l_cnt].faaj026,'','',l_faaj038,g_faaj[l_cnt].faajsite,g_faaj[l_cnt].faaj039,  #161104-00048#2 add #161104-00048#3 mark
                                       g_faaj[l_cnt].faaj040,g_faaj[l_cnt].faaj041,g_faaj[l_cnt].faaj042,g_faaj[l_cnt].faaj043,
                                       g_faaj[l_cnt].faaj044,'',g_faaj[l_cnt].faaj045,g_faaj[l_cnt].faaj046,
                                       g_faam1.faam101,g_faam1.faam102,
                                       g_faam1.faam103,g_faam1.faam104,g_faam1.faam105, 
                                       g_faam1.faam106,g_faam1.faam107,g_faam1.faam108,g_faam1.faam151,g_faam1.faam152,g_faam1.faam153, 
                                       g_faam1.faam154,g_faam1.faam155,g_faam1.faam156,g_faam1.faam157,g_faam1.faam158)        
                          IF STATUS THEN
                             #150731-00004#1 20150807 str---
                             #CALL cl_errmsg('faaj001',g_faaj[l_cnt].faaj001,'','ins faam_t',1)
                             INITIALIZE g_errparam TO NULL
                             LET g_errparam.code = 'ins faam_t'
                             LET g_errparam.extend = 'faaj001：'||g_faaj[l_cnt].faaj001
                             LET g_errparam.popup = TRUE
                             CALL cl_err()
                             #150731-00004#1 20150807 end--- 
                             LET g_cnt2 = g_cnt2 + 1
                             LET g_success='N'
                             CONTINUE FOREACH
                          END IF
                       END IF 
                    END FOREACH
                    IF cl_null(m_max_faag005) THEN LET m_max_faag005 = g_faag.faag005 END IF
                 END IF 
             
#          IF l_faaf004 = '2' THEN     #20141209 mark by chenying
          #IF l_faaf004 = '2' OR l_faaf004 = '1' THEN  #20141209 add by chenying   #160426-00014#6  mark 
          IF l_faaf004 = '2' OR l_faaf004 = '1' OR l_faaf004 = '3' THEN  #20141209 add by chenying    #160426-00014#6 add      
             IF m_tot_faam013!=mm_faam013 OR m_tot_curr!=m_curr OR
                m_tot_faam014!=mm_faam014 OR m_tot_faam015!=mm_faam015 THEN

                LET m_faag005 = m_max_faag005
                SELECT faam013,faam016 INTO l_faam013,l_faam016 FROM faam_t
                 WHERE faament = g_enterprise AND faamld = g_glaa_m.glaald
                   AND faam001 = g_faam1.faam001 AND faam002 = g_faam1.faam002
                   AND faam000 = g_faam1.faam000 #20141212 add by chening
#                   AND faam004 = g_glaa_m.year AND faam005 < g_glaa_m.month  #20141209 mark by chenying 
                   AND faam004 = g_glaa_m.year AND faam005 = g_glaa_m.month   #20141209 add by chenying 
                   AND faam009 = m_faag005 AND faam007 = '3'
                LET l_diff = mm_faam013 - m_tot_faam013
                IF l_diff < 0 THEN
                   LET l_diff = l_diff * -1
                   IF l_faam013 < l_diff THEN
                      LET l_diff = 0
                   ELSE
                      LET l_diff = l_diff * -1
                   END IF
                END IF
                IF cl_null(m_tot_curr) THEN
                   LET m_tot_curr=0
                END IF
                LET l_diff2 = mm_faam016 - m_tot_curr
                IF l_diff2 < 0 THEN
                   LET l_diff2 = l_diff2 * -1
                   IF l_faam016 < l_diff2 THEN
                      LET l_diff2 = 0
                   ELSE
                      LET l_diff2 = l_diff2 * -1
                   END IF
                END IF
#20141209 mod by chenying                
#20141106 mod--str--                
                UPDATE faam_t SET faam013=faam013+l_diff,
                                  faam016=faam016+l_diff2,
                                  faam014=faam014+mm_faam014-m_tot_faam014,
                                  faam015=faam015+mm_faam015-m_tot_faam015,
                                  faam018=faam018+mm_faam018-m_tot_faam018
#                LET l_faam013_1 = l_diff
#                LET l_faam016_1 = l_diff2
#                LET l_faam014_1 = mm_faam014-m_tot_faam014
#                LET l_faam015_1 = mm_faam015-m_tot_faam015
#                LET l_faam018_1 = mm_faam018-m_tot_faam018
#                LET l_faam013_1 = s_num_round('1',l_faam013_1,l_ooaj004)
#                LET l_faam016_1 = s_num_round('1',l_faam016_1,l_ooaj004)
#                LET l_faam014_1 = s_num_round('1',l_faam014_1,l_ooaj004)
#                LET l_faam015_1 = s_num_round('1',l_faam015_1,l_ooaj004)
#                LET l_faam018_1 = s_num_round('1',l_faam018_1,l_ooaj004)
#                UPDATE faam_t SET faam013=faam013+l_faam013_1, 
#                                  faam016=faam016+l_faam016_1,
#                                  faam014=faam014+l_faam014_1, 
#                                  faam015=faam015+l_faam015_1, 
#                                  faam018=faam018+l_faam018_1 
#20141106 mod--end--                                  
                 WHERE faament = g_enterprise AND faamld = g_glaa_m.glaald
                   AND faam001 = g_faam1.faam001 AND faam002 = g_faam1.faam002
#                   AND faam004 = g_glaa_m.year AND faam005 < g_glaa_m.month #20141209 mark by chenying
                   AND faam004 = g_glaa_m.year AND faam005 = g_glaa_m.month  #20141209 add by chenying                   
                   AND faam009 = m_faag005 AND faam007 = '3'
                IF STATUS OR SQLCA.sqlerrd[3]=0  THEN
                     LET g_success='N'
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "lib-00101"
                     LET g_errparam.popup = TRUE
                     LET g_errparam.replace[1] = g_faaj[l_cnt].faaj001
                     LET g_errparam.replace[2] ="faam_t"
                     LET g_errparam.extend = "upd faam_t"
                     LET g_errparam. sqlerr = SQLCA.SQLERRD[2]
                     CALL cl_err()

                END IF
             END IF
             LET m_tot_faam013=0
             LET m_tot_faam014=0
             LET m_tot_faam015=0
             LET m_tot_faam018=0
             LET m_tot_curr =0
             LET m_tot=0
            END IF    
            END FOREACH 
         END IF
      ELSE
         CONTINUE FOR
      END IF
   END FOR
   IF g_success = 'Y' THEN
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
   #CALL cl_err_showmsg()       #150731-00004#1 20150807 mark
   CALL cl_err_collect_show()   #150731-00004#1 20150807 add
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION afap230_ui_dialog_1()
   DEFINE li_exit  LIKE type_t.num5    #判別是否為離開作業
   DEFINE li_idx   LIKE type_t.num5
   DEFINE ls_js    STRING
   DEFINE ls_wc    STRING
   DEFINE l_dialog ui.DIALOG
   DEFINE lc_param type_parameter
   DEFINE l_origin_str STRING
   DEFINE g_bookno     LIKE glaa_t.glaald
   DEFINE l_success    LIKE type_t.num5
   DEFINE l_year       LIKE type_t.num5
   DEFINE l_month      LIKE type_t.num5
   DEFINE l_ooab002    LIKE ooab_t.ooab002
   DEFINE l_glaa013    LIKE glaa_t.glaa013
   DEFINE l_begin      LIKE fabg_t.fabgdocdt
   DEFINE l_end        LIKE fabg_t.fabgdocdt
   DEFINE l_n          LIKE type_t.num5
   #170619-00054#1--add--s--xul
   DEFINE l_first_day   LIKE type_t.dat
   DEFINE l_last_day    LIKE type_t.dat
   DEFINE l_days        LIKE type_t.num5 
   #170619-00054#1--add--e--xul   
   #add-point:ui_dialog段before dialog 

   #end add-point
   
   
    
   WHILE TRUE
 
 
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)

      #chenying 1127 add--str--
      INPUT BY NAME g_glaa_m.faamsite,g_glaa_m.glaald,g_glaa_m.year,g_glaa_m.month
       
      
         BEFORE INPUT 
          # CALL s_afat503_default(g_bookno) RETURNING l_success,g_glaa_m.faamsite,g_glaa_m.glaald,g_glaa_m.glaacomp
          # CALL afap230_faamsite_desc(g_glaa_m.faamsite) RETURNING  g_glaa_m.faamsite_desc
          # 
          # CALL afap230_glaald_desc()   #帳套說明、法人說明、幣別+幣別說明
          #
          # SELECT * INTO g_glaa_t.* FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_glaa_m.glaald #20141106 add
          # CALL cl_get_para(g_enterprise,g_glaa_m.faamsite,'S-FIN-9018') RETURNING g_glaa_m.year
          # CALL cl_get_para(g_enterprise,g_glaa_m.faamsite,'S-FIN-9019') RETURNING g_glaa_m.month
          # DISPLAY BY NAME g_glaa_m.year,g_glaa_m.month,g_glaa_m.faamsite_desc

         BEFORE FIELD faamsite
            LET g_glaa_m_t.faamsite = g_glaa_m.faamsite
            
         AFTER FIELD faamsite
            IF NOT cl_null(g_glaa_m.faamsite) THEN
               
               #检查组织资料的合理性             
               IF NOT s_afat502_site_chk(g_glaa_m.faamsite) THEN
                  LET g_glaa_m.faamsite = g_glaa_m_t.faamsite
                  CALL afap230_faamsite_desc(g_glaa_m.faamsite) RETURNING  g_glaa_m.faamsite_desc
                  DISPLAY BY NAME g_glaa_m.faamsite_desc
                  NEXT FIELD CURRENT
               END IF  
               
               #user需要檢查和資產中心的權限
               #170828-00020#1 mark(s)
               #IF NOT s_afat502_site_user_chk(g_glaa_m.faamsite,g_user) THEN
               #   LET g_glaa_m.faamsite = g_glaa_m_t.faamsite
               #   CALL afap230_faamsite_desc(g_glaa_m.faamsite) RETURNING g_glaa_m.faamsite_desc
               #   DISPLAY BY NAME g_glaa_m.faamsite_desc
               #   NEXT FIELD CURRENT  
               #END IF
               #170828-00020#1 mark(e)
               #170828-00020#1 add(s)
               CALL s_afa_person_chk(g_glaa_m.faamsite,g_user) RETURNING l_success
               IF l_success = FALSE THEN
                  LET g_glaa_m.faamsite = g_glaa_m_t.faamsite              
                  CALL afap230_faamsite_desc(g_glaa_m.faamsite) RETURNING g_glaa_m.faamsite_desc
                  DISPLAY BY NAME g_glaa_m.faamsite_desc
                  NEXT FIELD CURRENT
               END IF
               #170828-00020#1 add(e)    
               
               #帐套不为空检查法人归属是否相同
               IF NOT cl_null(g_glaa_m.glaald) THEN
                  IF NOT s_afat502_site_ld_chk(g_glaa_m.faamsite,g_glaa_m.glaald) THEN
                     LET g_glaa_m.faamsite = g_glaa_m_t.faamsite
                     CALL afap230_faamsite_desc(g_glaa_m.faamsite) RETURNING g_glaa_m.faamsite_desc
                     DISPLAY BY NAME g_glaa_m.faamsite_desc
                     NEXT FIELD CURRENT  
                  END IF
               END IF 
               IF NOT cl_null(g_glaa_m.glaald) THEN                
                  #161215-00044#1---modify----begin-----------------
                  #SELECT * INTO g_glaa_t.* 
                  SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,
                  glaald,glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,
                  glaa011,glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,
                  glaa023,glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,
                  glaa121,glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,
                  glaa139,glaa140,glaa123,glaa124,glaa028 INTO g_glaa_t.*
                  #161215-00044#1---modify----end-----------------
                  FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_glaa_m.glaald #20141106 add
                  LET g_glaa_m.glaacomp = g_glaa_t.glaacomp                  
                  CALL afap230_glaald_desc()   
               END IF                  
         END IF       
         
         BEFORE FIELD glaald
            LET g_glaa_m_t.glaald = g_glaa_m.glaald
          
         AFTER FIELD glaald
        
            IF NOT cl_null(g_glaa_m.glaald) THEN
                
               INITIALIZE g_chkparam.* TO NULL
               
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1=g_glaa_m.glaald
               #160318-00025#5--add--str
               LET g_errshow = TRUE 
               LET g_chkparam.err_str[1] = "agl-00051:sub-01302|agli010|",cl_get_progname("agli010",g_lang,"2"),"|:EXEPROGagli010"
               #160318-00025#5--add--end  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_glaald") THEN
               
               ELSE
                  LET g_glaa_m.glaald = g_glaa_m_t.glaald
                  CALL afap230_glaald_desc()                
               END IF               
            
               IF NOT s_ld_chk_authorization(g_user,g_glaa_m.glaald) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'agl-00165'
                  LET g_errparam.extend = g_glaa_m.glaald
                  LET g_errparam.popup = FALSE
                  CALL cl_err()

                  LET g_glaa_m.glaald = g_glaa_m_t.glaald
                  CALL afap230_glaald_desc() 
                  NEXT FIELD CURRENT
               END IF
               
               #资产中心不为空时
               IF NOT cl_null(g_glaa_m.faamsite) THEN
                  IF NOT s_afat502_site_ld_chk(g_glaa_m.faamsite,g_glaa_m.glaald) THEN
                     LET g_glaa_m.glaald = g_glaa_m_t.glaald
                     CALL afap230_glaald_desc()
                     DISPLAY BY NAME g_glaa_m.glaald_desc
                     NEXT FIELD CURRENT
                  END IF
               END IF
               
                #161215-00044#1---modify----begin-----------------
                #SELECT * INTO g_glaa_t.* 
                SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,
                glaald,glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,
                glaa011,glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,
                glaa023,glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,
                glaa121,glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,
                glaa139,glaa140,glaa123,glaa124,glaa028 INTO g_glaa_t.*
                #161215-00044#1---modify----end-----------------
               FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_glaa_m.glaald #20141106 add
               LET g_glaa_m.glaacomp = g_glaa_t.glaacomp
               CALL afap230_glaald_desc()      
                                 
            END IF                  
                
         ON ACTION controlp INFIELD faamsite
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_glaa_m.faamsite             #給予default值
            LET g_qryparam.where = " ooef207 = 'Y' "
            #給予arg
            LET g_qryparam.arg1 = "" #

            #160125-00005#7--add--str--
            IF NOT cl_null(g_wc_cs_orga) THEN
			      LET g_qryparam.where = g_wc_cs_orga
			   END IF
			   #160125-00005#7--add--end
            
            #CALL q_ooef001()                                #呼叫開窗 #161024-00008#1
            CALL q_ooef001_47() #161024-00008#1

            LET g_glaa_m.faamsite = g_qryparam.return1              

            DISPLAY g_glaa_m.faamsite TO faamsite              #
            CALL afap230_faamsite_desc(g_glaa_m.faamsite) RETURNING g_glaa_m.faamsite_desc
            DISPLAY BY NAME g_glaa_m.faamsite_desc
            NEXT FIELD faamsite                          #返回原欄位
          
          ON ACTION controlp INFIELD glaald
	  	     #此段落由子樣板a07產生
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_glaa_m.glaald             #給予default值

            CALL s_fin_create_account_center_tmp()   
            #取得资产組織下所屬成員
            CALL s_fin_account_center_sons_query('5',g_glaa_m.faamsite,g_today,'1')
            #取得资产中心下所屬成員之帳別   
            CALL s_fin_account_center_comp_str() RETURNING l_origin_str
            #將取回的字串轉換為SQL條件
            CALL afap230_change_to_sql(l_origin_str) RETURNING l_origin_str  
            
            LET l_origin_str=l_origin_str.substring(2,l_origin_str.getLength()-1) #160125-00005#7 add             
            #LET g_qryparam.where = " (glaa008 = 'Y' OR glaa014 = 'Y') AND glaacomp IN (",l_origin_str," )" #160125-00005#7 mark
            LET g_qryparam.where = "  (glaa008 = 'Y' OR glaa014 = 'Y') " #160125-00005#7 add
            #給予arg
            LET g_qryparam.arg1 = g_user #
            LET g_qryparam.arg2 = g_dept #
            #160125-00005#7--add--str--
            #账套范围
            CALL s_axrt300_get_site(g_user,l_origin_str,'2')  RETURNING g_wc_cs_ld
            IF NOT cl_null(g_wc_cs_ld) THEN   
               LET g_qryparam.where = g_qryparam.where," AND ",g_wc_cs_ld
            END IF
            #160125-00005#7--add--end              
            
            CALL q_authorised_ld()                                #呼叫開窗

            LET g_glaa_m.glaald = g_qryparam.return1              

            DISPLAY g_glaa_m.glaald TO glaald              #
             
            #161215-00044#1---modify----begin-----------------
            #SELECT * INTO g_glaa_t.* 
            SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,
            glaald,glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,
            glaa011,glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,
            glaa023,glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,
            glaa121,glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,
            glaa139,glaa140,glaa123,glaa124,glaa028 INTO g_glaa_t.*
            #161215-00044#1---modify----end-----------------
            FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_glaa_m.glaald #20141106 add
            CALL afap230_glaald_desc()

            NEXT FIELD glaald                          #返回原欄位
            
            AFTER FIELD year
               IF NOT cl_null(g_glaa_m.year) AND g_glaa_m.year < 1 THEN
                  LET g_glaa_m.year = g_glaa_m_t.year
                  DISPLAY BY NAME g_glaa_m.year
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'aoo-00113'
                  LET g_errparam.extend = g_glaa_m.year
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  NEXT FIELD CURRENT
               END IF 

            BEFORE FIELD month
               IF cl_null(g_glaa_m.year) THEN
                  NEXT FIELD year
               END IF

            AFTER FIELD month
               IF NOT cl_null(g_glaa_m.month) AND (g_glaa_m.month < 1 OR g_glaa_m.month > 12) THEN
               LET g_glaa_m.month = g_glaa_m_t.month
               DISPLAY BY NAME g_glaa_m.month
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'amm-00106'
               LET g_errparam.extend = g_glaa_m.month
               LET g_errparam.popup = TRUE
               CALL cl_err()

               NEXT FIELD CURRENT
            END IF          {#ADP版次:1#}
            
        AFTER INPUT
            
            IF NOT cl_null(g_glaa_m.year) AND NOT cl_null(g_glaa_m.month)  THEN
               CALL cl_get_para(g_enterprise,g_glaa_m.glaacomp,'S-FIN-9003') RETURNING l_ooab002
               IF NOT cl_null(l_ooab002) THEN
                  LET l_year = YEAR(l_ooab002)
                  LET l_month = MONTH(l_ooab002)   
                  IF (g_glaa_m.year <l_year) OR (g_glaa_m.year =l_year AND g_glaa_m.month <=l_month) THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "afa-00375"
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     NEXT FIELD year
                  END IF
               END IF
               
               SELECT glaa013 INTO l_glaa013 FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_glaa_m.glaald 
               IF NOT cl_null(l_glaa013) THEN
                  LET l_year = YEAR(l_glaa013)
                  LET l_month = MONTH(l_glaa013) 
                  IF (g_glaa_m.year <l_year) OR (g_glaa_m.year =l_year AND g_glaa_m.month <=l_month) THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "afa-00376"
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     NEXT FIELD year
                  END IF
               END IF           
          
            END IF
     END INPUT  

     CONSTRUCT BY NAME g_wc2 ON  faah001,faah003,faah004,faah006,faah007,faah005,faah008,faah042 #20141212 add faah001 by chening
       BEFORE CONSTRUCT
          CALL cl_qbe_init() 
          #170619-00054#1--add--s--xul
          #起始日期
          LET l_first_day = MDY(g_glaa_m.month,1,g_glaa_m.year)
          CALL s_date_get_max_day(g_glaa_m.year,g_glaa_m.month) RETURNING l_days
          #截止日期
          LET l_last_day = MDY(g_glaa_m.month,l_days,g_glaa_m.year)
          #170619-00054#1--add--e--xul
          
       #20141212 add by chening       
       ON ACTION controlp INFIELD faah001  #主帳套開窗
	      INITIALIZE g_qryparam.* TO NULL
          LET g_qryparam.state = 'c'
		  LET g_qryparam.reqry = FALSE
		  
		  #160426-00014#28 2016/08/22  By 07900 --add -s--
		  LET g_qryparam.where =" faahstus = 'Y' "
		  #161111-00049#14--ADD--S--
		  LET g_qryparam.where = g_qryparam.where," AND faah032 IN (SELECT glaacomp FROM glaa_t WHERE glaaent = ",g_enterprise," AND glaald = '",g_glaa_m.glaald,"' ) " 			  
		  #161111-00049#14--ADD--E--
		  #170619-00054#1--add--s--xul
		  #不存在afat509
		  LET g_qryparam.where = g_qryparam.where," AND NOT EXISTS( SELECT 1 FROM fabg_t,fabh_t ",
                                                "                  WHERE fabgent = fabhent AND fabgdocno = fabhdocno ",
                                                "                    AND fabgld  = fabhld  AND fabg005 = '0'",
                                                "                    AND fabgdocdt BETWEEN '",l_first_day,"' ",
                                                "                    AND '",l_last_day,"'  AND fabgstus <> 'X' ",
                                                "                    AND fabh001 = faah003 AND fabh002 = faah004 AND fabh000 =faah001)"
		  #170619-00054#1--add--e--xul
		  LET g_qryparam.arg1 =g_glaa_m.glaald
		  
		  CALL q_faah001_02()
		  #160426-00014#28 2016/08/22  By 07900 --add -e--
         # CALL q_faah001()                #呼叫開窗    #160426-00014#28 2016/08/22  By 07900 mod
          DISPLAY g_qryparam.return1 TO faah001 #顯示到畫面上

          NEXT FIELD faah001                    #返回原欄位 
       #20141212 add by chening

       ON ACTION controlp INFIELD faah003  #主帳套開窗
	      INITIALIZE g_qryparam.* TO NULL
         LET g_qryparam.state = 'c'
		   LET g_qryparam.reqry = FALSE
		   #160426-00014#28 2016/08/22  By 07900 --add -s--
		   LET g_qryparam.where =" faahstus = 'Y' "
		   #161111-00049#14--ADD--S--
		   LET g_qryparam.where = g_qryparam.where," AND faah032 IN (SELECT glaacomp FROM glaa_t WHERE glaaent = ",g_enterprise," AND glaald = '",g_glaa_m.glaald,"' ) " 			  
		   #161111-00049#14--ADD--E--
		   #170619-00054#1--add--s--xul
		   #不存在afat509
		   LET g_qryparam.where = g_qryparam.where," AND NOT EXISTS( SELECT 1 FROM fabg_t,fabh_t ",
                                                 "                  WHERE fabgent = fabhent AND fabgdocno = fabhdocno ",
                                                 "                    AND fabgld  = fabhld  AND fabg005 = '0'",
                                                 "                    AND fabgdocdt BETWEEN '",l_first_day,"' ",
                                                 "                    AND '",l_last_day,"'  AND fabgstus <> 'X' ",
                                                 "                    AND fabh001 = faah003 AND fabh002 = faah004 AND fabh000 =faah001)"
		   #170619-00054#1--add--e--xul
		   LET g_qryparam.arg1 =g_glaa_m.glaald
		   CALL q_faah001_02()
		   #160426-00014#28 2016/08/22  By 07900 --add -e-- 
        #  CALL q_faah003_8()                #呼叫開窗         #160426-00014#28 2016/08/22  By 07900 mod
         DISPLAY g_qryparam.return2 TO faah003 #顯示到畫面上  #160426-00014#28 2016/08/22  By 07900 mod return1 -> return2
           
          NEXT FIELD faah003                    #返回原欄位 
          
       ON ACTION controlp INFIELD faah004     #單據單號開窗
          INITIALIZE g_qryparam.* TO NULL
          LET g_qryparam.state = 'c'
		    LET g_qryparam.reqry = FALSE
		    #160426-00014#28 2016/08/22  By 07900 --add -s--
		    LET g_qryparam.where =" faahstus = 'Y' "
		    #161111-00049#14--ADD--S--
		    LET g_qryparam.where = g_qryparam.where," AND faah032 IN (SELECT glaacomp FROM glaa_t WHERE glaaent = ",g_enterprise," AND glaald = '",g_glaa_m.glaald,"' ) " 			  
		    #161111-00049#14--ADD--E--
		    #170619-00054#1--add--s--xul
		    #不存在afat509
		    LET g_qryparam.where = g_qryparam.where," AND NOT EXISTS( SELECT 1 FROM fabg_t,fabh_t ",
                                                  "                  WHERE fabgent = fabhent AND fabgdocno = fabhdocno ",
                                                  "                    AND fabgld  = fabhld  AND fabg005 = '0'",
                                                  "                    AND fabgdocdt BETWEEN '",l_first_day,"' ",
                                                  "                    AND '",l_last_day,"'  AND fabgstus <> 'X' ",
                                                  "                    AND fabh001 = faah003 AND fabh002 = faah004 AND fabh000 =faah001)"
		    #170619-00054#1--add--e--xul
		    LET g_qryparam.arg1 =g_glaa_m.glaald
		    CALL q_faah001_02()
		    #160426-00014#28 2016/08/22  By 07900 --add -e-- 
      #    CALL q_faah004_2()                #呼叫開窗   #160426-00014#28 2016/08/22  By 07900 mod
          DISPLAY g_qryparam.return3 TO faah004 #顯示到畫面上 #160426-00014#28 2016/08/22  By 07900 mod return1->return3

          NEXT FIELD faah004                    #返回原欄位 
          
       ON ACTION controlp INFIELD faah006     #單據單號開窗
          INITIALIZE g_qryparam.* TO NULL
          LET g_qryparam.state = 'c'
		  LET g_qryparam.reqry = FALSE
          #161111-00049#14--ADD--S--		   
          LET g_qryparam.where = " faalld = '",g_glaa_m.glaald,"'" 
          CALL q_faal001_1() 
          #161111-00049#14--ADD--E--
          #CALL q_faac001()           #161111-00049#14--MARK--                     #呼叫開窗
          DISPLAY g_qryparam.return1 TO faah006 #顯示到畫面上

          NEXT FIELD faah006                    #返回原欄位
          
      ON ACTION controlp INFIELD faah007     #單據單號開窗
          INITIALIZE g_qryparam.* TO NULL
          LET g_qryparam.state = 'c'
		    LET g_qryparam.reqry = FALSE
		    #161111-00049#14--ADD--S--		   
          LET g_qryparam.where = " faad002 IN (SELECT faal001 FROM faal_t WHERE faalent = ",g_enterprise," AND faalld = '",g_glaa_m.glaald,"')"
          #161111-00049#14--ADD--E--
          CALL q_faad001()                #呼叫開窗
          DISPLAY g_qryparam.return1 TO faah007 #顯示到畫面上

          NEXT FIELD faah007                    #返回原欄位
          
      ON ACTION controlp INFIELD faah008     #單據單號開窗
          INITIALIZE g_qryparam.* TO NULL
          LET g_qryparam.state = 'c'
		  LET g_qryparam.reqry = FALSE
		  LET g_qryparam.arg1 = '3903'
          CALL q_oocq002()                #呼叫開窗
          DISPLAY g_qryparam.return1 TO faah008 #顯示到畫面上

          NEXT FIELD faah008                    #返回原欄位
       
     END CONSTRUCT 
      #chenying 1127 add--end--      
    
       INPUT ARRAY g_faah_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS,
                  INSERT ROW = FALSE,
                  DELETE ROW = FALSE,
                  APPEND ROW = TRUE)
             BEFORE INPUT
#                CALL afap230_b_fill(g_wc2)
                LET g_rec_b = g_faah_d.getLength()
                CALL cl_set_comp_entry("faah003,faah004,faah006,faah007,faah005,faah008,faah042",FALSE)

            BEFORE ROW
               LET l_ac = ARR_CURR()
            
#            ON ACTION confirm
#               CALL afap230_confirm()

         END INPUT 

         
#         #chenying 1127 add--str--
#         SUBDIALOG lib_cl_dlg.cl_dlg_qryplan
# 
#         BEFORE DIALOG
#            IF g_faah_d.getLength() > 0 THEN
#               CALL gfrm_curr.setFieldHidden("formonly.sel", TRUE)
#               CALL gfrm_curr.setFieldHidden("formonly.statepic", TRUE)
#            ELSE
#               CALL gfrm_curr.setFieldHidden("formonly.sel", FALSE)
#               CALL gfrm_curr.setFieldHidden("formonly.statepic", FALSE)
#            END IF
#            #add-point:ui_dialog段before_dialog2
#
#            #end add-point
#
#            #chenying 1127 add--str--       
            
         SUBDIALOG lib_cl_schedule.cl_schedule_setting
         SUBDIALOG lib_cl_schedule.cl_schedule_setting_exec_call
         SUBDIALOG lib_cl_schedule.cl_schedule_select_show_history
         SUBDIALOG lib_cl_schedule.cl_schedule_show_history
 
         BEFORE DIALOG
            LET l_dialog = ui.DIALOG.getCurrent()
            CALL cl_qbe_display_condition(FGL_GETENV("QUERYPLANID"), g_user)
            CALL afap230_get_buffer(l_dialog)
            #add-point:ui_dialog段before dialog
           #CALL afap230_construct()
           #CALL afap230_b_fill(g_wc2)
           #NEXT FIELD glaald
            #171227-00042#1 add--s 
            CLEAR FORM
            CALL g_faah_d.clear()
            INITIALIZE g_wc2 TO NULL
            #171227-00042#1 add--e  
            #end add-point
            CALL s_afat503_default(g_bookno) RETURNING l_success,g_glaa_m.faamsite,g_glaa_m.glaald,g_glaa_m.glaacomp
           CALL afap230_faamsite_desc(g_glaa_m.faamsite) RETURNING  g_glaa_m.faamsite_desc
           
           CALL afap230_glaald_desc()   #帳套說明、法人說明、幣別+幣別說明
            
            #161215-00044#1---modify----begin-----------------
            #SELECT * INTO g_glaa_t.* 
            SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,
            glaald,glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,
            glaa011,glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,
            glaa023,glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,
            glaa121,glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,
            glaa139,glaa140,glaa123,glaa124,glaa028 INTO g_glaa_t.*
            #161215-00044#1---modify----end----------------- 
           FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_glaa_m.glaald #20141106 add
           CALL cl_get_para(g_enterprise,g_glaa_m.faamsite,'S-FIN-9018') RETURNING g_glaa_m.year
           CALL cl_get_para(g_enterprise,g_glaa_m.faamsite,'S-FIN-9019') RETURNING g_glaa_m.month
           DISPLAY BY NAME g_glaa_m.year,g_glaa_m.month,g_glaa_m.faamsite_desc
          #chenying 1127 add--str--  
         #選擇全部
         ON ACTION selall
            CALL DIALOG.setSelectionRange("s_detail1", 1, -1, 1)
            FOR li_idx = 1 TO g_faah_d.getLength()
               LET g_faah_d[li_idx].check = "Y"
               #add-point:ui_dialog段on action selall
 
               #end add-point
            END FOR
            #add-point:ui_dialog段on action selall

            #end add-point
 
         #取消全部
         ON ACTION selnone
            CALL DIALOG.setSelectionRange("s_detail1", 1, -1, 0)
            FOR li_idx = 1 TO g_faah_d.getLength()
               LET g_faah_d[li_idx].check = "N"
               #add-point:ui_dialog段on action selnone

               #end add-point
            END FOR
            #add-point:ui_dialog段on action selnone

            #end add-point
 
         #勾選所選資料
         ON ACTION sel
            FOR li_idx = 1 TO g_faah_d.getLength()
               IF DIALOG.isRowSelected("s_detail1", li_idx) THEN
                  LET g_faah_d[li_idx].check = "Y"
               END IF
            END FOR
            #add-point:ui_dialog段on action sel
 
            #end add-point
         
         #取消所選資料
         ON ACTION unsel
            FOR li_idx = 1 TO g_faah_d.getLength()
               IF DIALOG.isRowSelected("s_detail1", li_idx) THEN
                  LET g_faah_d[li_idx].check = "N"
               END IF
            END FOR
            #add-point:ui_dialog段on action unsel

            #end add-point
         #chenying 1127 add--end--              
            
         ON ACTION qbe_select
            LET ls_wc = ""
            #需要用ITM類程式查詢方案在CONSTRUCT的功能，將值set到畫面上
            CALL cl_qbe_list("c") RETURNING ls_wc
            CALL afap230_get_buffer(l_dialog)
            IF NOT cl_null(ls_wc) THEN
               LET lc_param.wc = ls_wc
               #取得條件後需要執行項目,應新增於下方adp
               #add-point:ui_dialog段qbe_select後

               #end add-point
            END IF
 
         ON ACTION qbe_save
            CALL cl_qbe_save()
 
         ON ACTION batch_execute
            ACCEPT DIALOG
 
         ON ACTION qbeclear         
            CLEAR FORM
            INITIALIZE lc_param.* TO NULL
            #add-point:ui_dialog段qbeclear

            #end add-point
 
         ON ACTION history_fill
            CALL cl_schedule_history_fill()
 
         ON ACTION close
            LET INT_FLAG = TRUE
            EXIT DIALOG
         
         ON ACTION exit
            LET INT_FLAG = TRUE
            EXIT DIALOG
 
         ON ACTION accept
            CALL afap230_b_fill(g_wc2)
            NEXT FIELD check
      
#        #20141209 add by chenying
#        ON ACTION cancel
#           LET INT_FLAG = 0
#           EXIT DIALOG 
#        #20141209 add by chenying
      #交談指令共用ACTION
      #主選單用ACTION
         &include "main_menu.4gl"
         &include "relating_action.4gl"
         #交談指令共用ACTION
         &include "common_action.4gl"
         CONTINUE DIALOG
     END DIALOG
 
      #add-point:ui_dialog段exit dialog
                              
      #end add-point
 
      LET ls_js = util.JSON.stringify(lc_param)
 
      IF INT_FLAG THEN
         LET INT_FLAG = FALSE
         EXIT WHILE
      ELSE
         LET l_year = g_glaa_m.year USING '&&&&'
         LET l_month = g_glaa_m.month USING '&&'
         #得到当月第一天
         SELECT to_date(l_year||l_month,'yyyymm') INTO l_begin FROM dual
         #获取当月最后一天
         SELECT last_day(l_begin) INTO l_end FROM dual
         #170619-00054#1--mark--s--         
#         LET l_n = 0
#         #检查帐套+年月是否已经存在afat509
#         SELECT COUNT(*) INTO l_n
#           FROM fabg_t
#          WHERE fabgsite = g_glaa_m.faamsite
#            AND fabgld = g_glaa_m.glaald
#            AND fabg005 = '0'
#            AND fabgdocdt BETWEEN l_begin AND l_end
#            AND fabgstus <> 'X'  #20150514 add lujh
#            AND fabgent=g_enterprise #160905-00007#1 add
#         IF l_n > 0 THEN 
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.code = "afa-00452"
#            LET g_errparam.extend = ''
#            LET g_errparam.popup = TRUE
#            CALL cl_err()
#            CONTINUE WHILE 
#         END IF 
         #170619-00054#1--mark--e--  
         #LET g_jobid = cl_schedule_get_jobid(g_prog)
         IF g_chk_jobid THEN 
            LET g_jobid = g_schedule.gzpa001
         ELSE 
            LET g_jobid = cl_schedule_get_jobid(g_prog)
         END IF 
         CASE 
            WHEN g_schedule.gzpa003 = "0"
                 CALL afap230_process(ls_js)
            WHEN g_schedule.gzpa003 = "1"
            #    CALL cl_schedule_update_data(g_jobid,ls_js)
                 LET ls_js = afap230_transfer_argv(ls_js)
                 CALL cl_cmdrun(ls_js)
            WHEN g_schedule.gzpa003 = "2"
                 CALL cl_schedule_update_data(g_jobid,ls_js)
            WHEN g_schedule.gzpa003 = "3"
                 CALL cl_schedule_update_data(g_jobid,ls_js)
         END CASE  
         IF g_schedule.gzpa003 = "2" OR g_schedule.gzpa003 = "3" THEN 
            CALL cl_ask_confirm3("std-00014","") #設定完成
         END IF    
         LET g_schedule.gzpa003 = "0" #預設一開始 立即於前景執行
 
         #add-point:ui_dialog段after schedule

         #end add-point
 
         #欄位初始資訊 
         CALL cl_schedule_init_info("all",g_schedule.gzpa003) 
         LET gi_hiden_asign = FALSE 
         LET gi_hiden_exec = FALSE 
         LET gi_hiden_spec = FALSE 
         LET gi_hiden_exec_end = FALSE 
         CALL cl_schedule_hidden()
      END IF
   END WHILE
END FUNCTION

################################################################################
# Descriptions...:  
# Memo...........:
# Usage..........: CALL afap230_faamsite_desc(p_ooef001)
# Input parameter:  
# Modify.........:
################################################################################
PRIVATE FUNCTION afap230_faamsite_desc(p_ooef001)
   DEFINE p_ooef001         LIKE ooef_t.ooef001
   DEFINE r_desc           LIKE ooefl_t.ooefl003
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = p_ooef001
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET r_desc = '', g_rtn_fields[1] , ''
   RETURN r_desc
END FUNCTION

################################################################################
# Descriptions...:  
# Memo...........:
# Usage..........: CALL afap230_change_to_sql(p_wc)
# Input parameter:  
# Modify.........:
################################################################################
PRIVATE FUNCTION afap230_change_to_sql(p_wc)
   DEFINE p_wc       STRING
   DEFINE r_wc       STRING
   DEFINE tok        base.StringTokenizer
   DEFINE l_str      STRING

   LET tok = base.StringTokenizer.create(p_wc,",")
   WHILE tok.hasMoreTokens()
      IF cl_null(l_str) THEN
         LET l_str = tok.nextToken()
      ELSE
         LET l_str = l_str,"','",tok.nextToken()
      END IF
   END WHILE
   LET r_wc = "'",l_str,"'"

   RETURN r_wc
END FUNCTION

#end add-point
 
{</section>}
 
