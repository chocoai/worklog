#該程式未解開Section, 採用最新樣板產出!
{<section id="axrt300_02.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0042(2017-10-18 10:21:38), PR版次:0042(2017-11-23 09:32:42)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000528
#+ Filename...: axrt300_02
#+ Description: 直接沖帳
#+ Creator....: 01727(2013-10-22 00:00:00)
#+ Modifier...: 08172 -SD/PR- 09773
 
{</section>}
 
{<section id="axrt300_02.global" >}
#應用 i02 樣板自動產生(Version:52)
#add-point:填寫註解說明 name="global.memo"
#150311-00003#2 By   01727 xrce027 = 'Y'的資料寫入xrca106其他資料寫入xrca107
#150821-00002#1   2015/08/21  By 01727    1.s_curr_round、s_num_round改為s_curr_round_ld
#                                         2.檢查原幣的取位,幣別應傳入原幣;本幣的取位,幣別應傳入本幣

#150916-00015#1   2015/11/30  By taozf    当有账套时，科目检查改为检查是否存在于glad_t中
#151130-00015#3   2015/12/29  By 01727    訂金沖銷依aoos020 參數 S-FIN-2020  是否依單核銷訂金 則只能沖同一張訂單之訂金
#160122-00001#5   2016/03/03  By 07673    当没有权限时，用户不能看到交易账户编号，用“*”显示，当有权限时，才可 看到具体交易账户编号
#160318-00005#53  160401      by pengxin  修正azzi920重复定义之错误讯息
#160331-00012#1   2016/04/12  By 07673    部门栏位的开窗以及检核都错误
#160420-00001#1   2016/04/29  By 01727    直接沖帳不能含有直接收款選項,因為直接收款在 topmenu 已獨立
#                                         直接收款,若不同幣別收款且本幣已沖完, 原幣換算時也要同時沖完畢
#160420-00001#13  2016/05/05  By 01727    axrt400 沖待抵單時不可超過原始預收單已收款金額
#160531-00041#1   2016/06/03  By 01531    axrt3* 直接沖帳不顯示與AP 對沖的選項(直接冲账里面限定只能冲应收的待抵单)
#160628-00002#1   2016/06/28  By 02599    往來帳款沖銷待抵單時,需要將含稅待抵單的稅額拆分出來顯示
#160905-00002#6   2016/09/05  By 08732    補齊SQL where條件的ent
#161011-00007#1   2016/10/11  By 01727    整批调整axr模组中部门栏位开窗,改用aooi125的资料
#161026-00013#2   2016/10/26  By 06821    組織類型與職能開窗調整
#161118-00026#1   2016/11/22  By 01727    来源于aist310单身的资料不可以修改
#161128-00061#4   2016/12/02  by 02481    标准程式定义采用宣告模式,弃用.*写法
#160824-00007#360 2017/01/18  By 06814    新舊值處理
#170210-00048#1   2017/02/10  By 02599    当已冲销本币金额=账款单本币应收金额（本币未税金额+本币税额）时，原币冲销金额不倒退，直接扣除
#170213-00008#1   2017/02/14  By 02114    手动录入待抵单,会插入不成功
#170221-00054#1   2017/02/23  By Reanna   上品追單
#170309-00063#1   2017/03/20  By 01531    票據號碼C505屬性改為 40C長度 (僅代碼下載重新上傳處理) 
#170301-00023#10  2017/03/24  By 09256    "為因應行業包，g_prog整批調整加上'*'
#170618-00443#1   2017/06/18  By 02114    "非同一张订单之订金待抵单,不可冲销"的检核逻辑只有axrt300时才会走
#170616-00046#1   170619      By albireo  22 29類來源單據有設置需開立折讓證明單仍視同含稅扣抵否N做後續處理
#170621-00032#1   170621      By albireo  增加核算項通路(渠道)欄位
#170531-00062#2   2017/07/28  By 02599    账款单号增加检核：冲销账款单日期必须<=立账单日期
#170816-00068#1   2017/08/18  By chenssz  直接冲账，人工贴单号有部分栏位未带出
#170621-00044#2   2017/08/22  By 01531   【直接沖帳】維護後, 判斷若有沖帳原始單的匯率與現在立帳匯率不同者，則提示"是否自動產生匯差處理?"；
#                                         若Y则在直接收款中产生汇兑损益
#170828-00038#1   2017/08/28  By 01531    直接收款 手动输入时xrce001需赋值
#170831-00040#1   2017/09/01  By 05795    INSERT INTO xrce的时候增加xrcecomp
#170831-00033#1   2017/09/01  By 05795    少串ent條件導致金額撈出異常,INSERT INTO xrce_t 時，有欄位排序錯了
#170907-00022#1   2017/09/08  By 06821    當刪除”直接沖帳”資料且直接沖帳無資料時，連帶刪除”直接收款”中匯兌損益
#170911-00001#1   2017/09/11  By 06821    延續#170907-00022#1 執行直接沖帳刪除後，未重推本幣，導致分錄問題
#170814-00012#42  2017/09/15  By 10043    開窗q_ooeg001_4與q_ooeg001 內容相同,整批修改
#170512-00045#2   2017/09/26  By 01531    科目開窗時，若有啟用核算項，仿照總帳一樣，跳小窗輸入啟用的核算項值
#171016-00011#3   2017/10/17  by 08172    1.画面增加自由核算项相关栏位
#                                         2.若冲账参数S-FIN-1002不为3，则核算项的值预带单身第一笔的核算项值，若冲账参数为3，则预带单身明细的核算项值。
#171023-00004#2   2017/11/22  By 09773    T作业单身维护科目后，若启用的核算项都有值，则不需打开核算项子画面

#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
#(ver:46) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:46) --- end ---
 
IMPORT os
IMPORT util
IMPORT JAVA com.fourjs.fgl.lang.FglRecord  #(ver:47) add
#add-point:增加匯入項目 name="global.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
GLOBALS   #(ver:36) add
   DEFINE mc_data_owner_check LIKE type_t.num5   #(ver:36) add
   #(ver:47) ---add start---
   #單身匯excel POI變數
   TYPE rec_arr_type           ARRAY [] OF com.fourjs.fgl.lang.FglRecord
   DEFINE g_export_tag         DYNAMIC ARRAY OF rec_arr_type                 #畫面欄位數
   DEFINE g_export_tabname     DYNAMIC ARRAY OF STRING                       #畫面名稱
   #(ver:47) --- add end ---
END GLOBALS   #(ver:36) add
 
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
#單身 type 宣告
PRIVATE TYPE type_g_xrce_d RECORD
       xrce001 LIKE xrce_t.xrce001, 
   xrcedocno LIKE xrce_t.xrcedocno, 
   xrceld LIKE xrce_t.xrceld, 
   xrcesite LIKE xrce_t.xrcesite, 
   xrceseq LIKE xrce_t.xrceseq, 
   xrce002 LIKE xrce_t.xrce002, 
   xrce003 LIKE xrce_t.xrce003, 
   xrce004 LIKE xrce_t.xrce004, 
   xrce005 LIKE xrce_t.xrce005, 
   xrce024 LIKE xrce_t.xrce024, 
   xrce025 LIKE xrce_t.xrce025, 
   xrce008 LIKE xrce_t.xrce008, 
   lc_xrce008 LIKE type_t.chr500, 
   xrce015 LIKE xrce_t.xrce015, 
   xrce100 LIKE xrce_t.xrce100, 
   xrce101 LIKE xrce_t.xrce101, 
   xrce103 LIKE xrce_t.xrce103, 
   xrce104 LIKE xrce_t.xrce104, 
   xrce109 LIKE xrce_t.xrce109, 
   xrce113 LIKE xrce_t.xrce113, 
   xrce114 LIKE xrce_t.xrce114, 
   xrce119 LIKE xrce_t.xrce119, 
   xrce027 LIKE xrce_t.xrce027, 
   xrce028 LIKE xrce_t.xrce028, 
   xrcecomp LIKE xrce_t.xrcecomp, 
   xrceorga LIKE xrce_t.xrceorga, 
   xrce010 LIKE xrce_t.xrce010, 
   xrce016 LIKE xrce_t.xrce016, 
   xrce016_desc_1 LIKE type_t.chr500
       END RECORD
PRIVATE TYPE type_g_xrce2_d RECORD
       xrce001 LIKE xrce_t.xrce001, 
   xrcedocno LIKE xrce_t.xrcedocno, 
   xrceld LIKE xrce_t.xrceld, 
   xrcesite LIKE xrce_t.xrcesite, 
   xrceseq LIKE xrce_t.xrceseq, 
   xrce002 LIKE xrce_t.xrce002, 
   xrce003 LIKE xrce_t.xrce003, 
   xrce004 LIKE xrce_t.xrce004, 
   xrce008 LIKE xrce_t.xrce008, 
   xrce100 LIKE xrce_t.xrce100, 
   xrce103 LIKE xrce_t.xrce103, 
   xrce104 LIKE xrce_t.xrce104, 
   xrce109 LIKE xrce_t.xrce109, 
   xrce101 LIKE xrce_t.xrce101, 
   xrce113 LIKE xrce_t.xrce113, 
   xrce114 LIKE xrce_t.xrce114, 
   xrce119 LIKE xrce_t.xrce119, 
   xrce120 LIKE xrce_t.xrce120, 
   xrce121 LIKE xrce_t.xrce121, 
   xrce123 LIKE xrce_t.xrce123, 
   xrce124 LIKE xrce_t.xrce124, 
   xrce129 LIKE xrce_t.xrce129, 
   xrce130 LIKE xrce_t.xrce130, 
   xrce131 LIKE xrce_t.xrce131, 
   xrce133 LIKE xrce_t.xrce133, 
   xrce134 LIKE xrce_t.xrce134, 
   xrce139 LIKE xrce_t.xrce139
       END RECORD
PRIVATE TYPE type_g_xrce3_d RECORD
       xrce001 LIKE xrce_t.xrce001, 
   xrcedocno LIKE xrce_t.xrcedocno, 
   xrceld LIKE xrce_t.xrceld, 
   xrcesite LIKE xrce_t.xrcesite, 
   xrceseq LIKE xrce_t.xrceseq, 
   xrce002 LIKE xrce_t.xrce002, 
   xrce003 LIKE xrce_t.xrce003, 
   xrce004 LIKE xrce_t.xrce004, 
   xrce005 LIKE xrce_t.xrce005, 
   xrce008 LIKE xrce_t.xrce008, 
   xrce100 LIKE xrce_t.xrce100, 
   xrce109 LIKE xrce_t.xrce109, 
   xrce101 LIKE xrce_t.xrce101, 
   xrce119 LIKE xrce_t.xrce119, 
   xrce027 LIKE xrce_t.xrce027, 
   xrce010 LIKE xrce_t.xrce010, 
   xrce016 LIKE xrce_t.xrce016, 
   xrce016_u_desc LIKE type_t.chr500, 
   xrce017 LIKE xrce_t.xrce017, 
   xrce017_desc LIKE type_t.chr500, 
   xrce018 LIKE xrce_t.xrce018, 
   xrce018_u_desc LIKE type_t.chr500, 
   xrce019 LIKE xrce_t.xrce019, 
   xrce019_desc LIKE type_t.chr500, 
   xrce020 LIKE xrce_t.xrce020, 
   xrce020_desc LIKE type_t.chr500, 
   xrce022 LIKE xrce_t.xrce022, 
   xrce023 LIKE xrce_t.xrce023, 
   xrce040 LIKE xrce_t.xrce040, 
   l_xrce040_desc LIKE type_t.chr100, 
   xrce035 LIKE xrce_t.xrce035, 
   xrce035_desc LIKE type_t.chr500, 
   xrce036 LIKE xrce_t.xrce036, 
   xrce036_desc LIKE type_t.chr500, 
   xrce038 LIKE xrce_t.xrce038, 
   xrce039 LIKE xrce_t.xrce039, 
   xrce041 LIKE xrce_t.xrce041, 
   xrce041_desc LIKE type_t.chr500, 
   xrce042 LIKE xrce_t.xrce042, 
   xrce042_desc LIKE type_t.chr500, 
   xrce043 LIKE xrce_t.xrce043, 
   xrce043_desc LIKE type_t.chr500, 
   xrce044 LIKE xrce_t.xrce044, 
   xrce044_desc LIKE type_t.chr500, 
   xrce045 LIKE xrce_t.xrce045, 
   xrce045_desc LIKE type_t.chr500, 
   xrce046 LIKE xrce_t.xrce046, 
   xrce046_desc LIKE type_t.chr500, 
   xrce047 LIKE xrce_t.xrce047, 
   xrce047_desc LIKE type_t.chr500, 
   xrce048 LIKE xrce_t.xrce048, 
   xrce048_desc LIKE type_t.chr500, 
   xrce049 LIKE xrce_t.xrce049, 
   xrce049_desc LIKE type_t.chr500, 
   xrce050 LIKE xrce_t.xrce050, 
   xrce050_desc LIKE type_t.chr500, 
   xrce051 LIKE xrce_t.xrce051, 
   xrce051_desc LIKE type_t.chr500
       END RECORD
 
 
 
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
#161128-00061#4---mdofiy--begin---------
#DEFINE g_xrca_t              RECORD LIKE xrca_t.*
#DEFINE g_glaa_t              RECORD LIKE glaa_t.*
#DEFINE g_xrce_t              RECORD LIKE xrce_t.*
DEFINE g_xrca_t RECORD  #應收憑單單頭
       xrcaent LIKE xrca_t.xrcaent, #企業編號
       xrcaownid LIKE xrca_t.xrcaownid, #資料所有者
       xrcaowndp LIKE xrca_t.xrcaowndp, #資料所屬部門
       xrcacrtid LIKE xrca_t.xrcacrtid, #資料建立者
       xrcacrtdp LIKE xrca_t.xrcacrtdp, #資料建立部門
       xrcacrtdt LIKE xrca_t.xrcacrtdt, #資料創建日
       xrcamodid LIKE xrca_t.xrcamodid, #資料修改者
       xrcamoddt LIKE xrca_t.xrcamoddt, #最近修改日
       xrcacnfid LIKE xrca_t.xrcacnfid, #資料確認者
       xrcacnfdt LIKE xrca_t.xrcacnfdt, #資料確認日
       xrcapstid LIKE xrca_t.xrcapstid, #資料過帳者
       xrcapstdt LIKE xrca_t.xrcapstdt, #資料過帳日
       xrcastus LIKE xrca_t.xrcastus, #狀態碼
       xrcacomp LIKE xrca_t.xrcacomp, #法人
       xrcald LIKE xrca_t.xrcald, #帳套
       xrcadocno LIKE xrca_t.xrcadocno, #應收帳款單號碼
       xrcadocdt LIKE xrca_t.xrcadocdt, #帳款日期
       xrca001 LIKE xrca_t.xrca001, #帳款單性質
       xrcasite LIKE xrca_t.xrcasite, #帳務中心
       xrca003 LIKE xrca_t.xrca003, #帳務人員
       xrca004 LIKE xrca_t.xrca004, #帳款客戶編號
       xrca005 LIKE xrca_t.xrca005, #收款客戶
       xrca006 LIKE xrca_t.xrca006, #客戶分類
       xrca007 LIKE xrca_t.xrca007, #帳款類別
       xrca008 LIKE xrca_t.xrca008, #收款條件編號
       xrca009 LIKE xrca_t.xrca009, #應收款日/應扣抵日
       xrca010 LIKE xrca_t.xrca010, #容許票據到期日
       xrca011 LIKE xrca_t.xrca011, #稅別
       xrca012 LIKE xrca_t.xrca012, #稅率
       xrca013 LIKE xrca_t.xrca013, #含稅否
       xrca014 LIKE xrca_t.xrca014, #人員編號
       xrca015 LIKE xrca_t.xrca015, #部門編號
       xrca016 LIKE xrca_t.xrca016, #來源作業類型
       xrca017 LIKE xrca_t.xrca017, #產生方式
       xrca018 LIKE xrca_t.xrca018, #來源參考單號
       xrca019 LIKE xrca_t.xrca019, #系統產生對應單號(待抵帳款-預收)
       xrca020 LIKE xrca_t.xrca020, #信用狀申請流程否
       xrca021 LIKE xrca_t.xrca021, #商業發票號碼(IV no.)
       xrca022 LIKE xrca_t.xrca022, #出口報單號碼
       xrca023 LIKE xrca_t.xrca023, #發票客戶編號
       xrca024 LIKE xrca_t.xrca024, #發票客戶統一編號
       xrca025 LIKE xrca_t.xrca025, #發票客戶全名
       xrca026 LIKE xrca_t.xrca026, #發票客戶地址
       xrca028 LIKE xrca_t.xrca028, #發票類型
       xrca029 LIKE xrca_t.xrca029, #發票匯率
       xrca030 LIKE xrca_t.xrca030, #發票應開未稅金額
       xrca031 LIKE xrca_t.xrca031, #發票應開稅額
       xrca032 LIKE xrca_t.xrca032, #發票應開含稅金額
       xrca033 LIKE xrca_t.xrca033, #專案編號
       xrca034 LIKE xrca_t.xrca034, #責任中心
       xrca035 LIKE xrca_t.xrca035, #應收(借方)科目編號
       xrca036 LIKE xrca_t.xrca036, #收入(貸方)科目編號
       xrca037 LIKE xrca_t.xrca037, #分錄傳票產生否
       xrca038 LIKE xrca_t.xrca038, #拋轉傳票號碼
       xrca039 LIKE xrca_t.xrca039, #會計檢核附件份數
       xrca040 LIKE xrca_t.xrca040, #留置否
       xrca041 LIKE xrca_t.xrca041, #留置理由碼
       xrca042 LIKE xrca_t.xrca042, #留置設定日期
       xrca043 LIKE xrca_t.xrca043, #留置解除日期
       xrca044 LIKE xrca_t.xrca044, #留置原幣金額
       xrca045 LIKE xrca_t.xrca045, #留置說明
       xrca046 LIKE xrca_t.xrca046, #關係人否
       xrca047 LIKE xrca_t.xrca047, #多角序號
       xrca048 LIKE xrca_t.xrca048, #集團代收/代付單號
       xrca049 LIKE xrca_t.xrca049, #來源營運中心編號
       xrca050 LIKE xrca_t.xrca050, #交易原始單據份數
       xrca051 LIKE xrca_t.xrca051, #作廢理由碼
       xrca052 LIKE xrca_t.xrca052, #列印次數
       xrca053 LIKE xrca_t.xrca053, #備註
       xrca054 LIKE xrca_t.xrca054, #多帳期設定
       xrca055 LIKE xrca_t.xrca055, #繳款優惠條件
       xrca056 LIKE xrca_t.xrca056, #會計檢核附件狀態
       xrca057 LIKE xrca_t.xrca057, #交易對象識別碼
       xrca058 LIKE xrca_t.xrca058, #銷售分類
       xrca059 LIKE xrca_t.xrca059, #預算編號
       xrca060 LIKE xrca_t.xrca060, #發票開立原則
       xrca061 LIKE xrca_t.xrca061, #預計開立發票日期
       xrca062 LIKE xrca_t.xrca062, #多角性質
       xrca063 LIKE xrca_t.xrca063, #整帳批序號
       xrca064 LIKE xrca_t.xrca064, #訂金序次
       xrca065 LIKE xrca_t.xrca065, #發票編號
       xrca066 LIKE xrca_t.xrca066, #發票號碼
       xrca100 LIKE xrca_t.xrca100, #交易原幣別
       xrca101 LIKE xrca_t.xrca101, #原幣匯率
       xrca103 LIKE xrca_t.xrca103, #原幣未稅金額
       xrca104 LIKE xrca_t.xrca104, #原幣稅額
       xrca106 LIKE xrca_t.xrca106, #原幣直接折抵合計金額
       xrca107 LIKE xrca_t.xrca107, #原幣直接沖帳(調整)合計金額
       xrca108 LIKE xrca_t.xrca108, #原幣應收金額
       xrca113 LIKE xrca_t.xrca113, #本幣未稅金額
       xrca114 LIKE xrca_t.xrca114, #本幣稅額
       xrca116 LIKE xrca_t.xrca116, #本幣直接沖帳(調整)合計金額
       xrca117 LIKE xrca_t.xrca117, #本幣直接沖帳(調整)合計金額
       xrca118 LIKE xrca_t.xrca118, #本幣應收金額
       xrca120 LIKE xrca_t.xrca120, #本位幣二幣別
       xrca121 LIKE xrca_t.xrca121, #本位幣二匯率
       xrca123 LIKE xrca_t.xrca123, #本位幣二未稅金額
       xrca124 LIKE xrca_t.xrca124, #本位幣二稅額
       xrca126 LIKE xrca_t.xrca126, #本位幣二直接折抵合計金額
       xrca127 LIKE xrca_t.xrca127, #本位幣二直接沖帳(調整)合計金額
       xrca128 LIKE xrca_t.xrca128, #本位幣二應收金額
       xrca130 LIKE xrca_t.xrca130, #本位幣三幣別
       xrca131 LIKE xrca_t.xrca131, #本位幣三匯率
       xrca133 LIKE xrca_t.xrca133, #本位幣三未稅金額
       xrca134 LIKE xrca_t.xrca134, #本位幣三稅額
       xrca136 LIKE xrca_t.xrca136, #本位幣三直接折抵合計金額
       xrca137 LIKE xrca_t.xrca137, #本位幣三直接沖帳(調整)合計金額
       xrca138 LIKE xrca_t.xrca138  #本位幣三應收金額
       END RECORD

DEFINE g_glaa_t  RECORD  #帳套資料檔
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
DEFINE g_xrce_t RECORD  #應收沖銷明細檔
       xrceent LIKE xrce_t.xrceent, #企業編號
       xrcecomp LIKE xrce_t.xrcecomp, #法人
       xrceld LIKE xrce_t.xrceld, #帳套
       xrcedocno LIKE xrce_t.xrcedocno, #沖銷單單號
       xrceseq LIKE xrce_t.xrceseq, #項次
       xrcelegl LIKE xrce_t.xrcelegl, #no use
       xrcesite LIKE xrce_t.xrcesite, #帳務中心
       xrceorga LIKE xrce_t.xrceorga, #帳務歸屬組織
       xrce001 LIKE xrce_t.xrce001, #來源作業
       xrce002 LIKE xrce_t.xrce002, #沖銷類型
       xrce003 LIKE xrce_t.xrce003, #沖銷帳款單單號
       xrce004 LIKE xrce_t.xrce004, #沖銷帳款單項次
       xrce005 LIKE xrce_t.xrce005, #沖銷帳款單帳期
       xrce006 LIKE xrce_t.xrce006, #no use
       xrce007 LIKE xrce_t.xrce007, #no use
       xrce008 LIKE xrce_t.xrce008, #no use
       xrce009 LIKE xrce_t.xrce009, #no use
       xrce010 LIKE xrce_t.xrce010, #摘要說明
       xrce011 LIKE xrce_t.xrce011, #no use
       xrce012 LIKE xrce_t.xrce012, #no use
       xrce013 LIKE xrce_t.xrce013, #no use
       xrce014 LIKE xrce_t.xrce014, #no use
       xrce015 LIKE xrce_t.xrce015, #沖銷加減項
       xrce016 LIKE xrce_t.xrce016, #沖銷科目
       xrce017 LIKE xrce_t.xrce017, #業務人員
       xrce018 LIKE xrce_t.xrce018, #業務部門
       xrce019 LIKE xrce_t.xrce019, #責任中心
       xrce020 LIKE xrce_t.xrce020, #產品類別
       xrce021 LIKE xrce_t.xrce021, #no use
       xrce022 LIKE xrce_t.xrce022, #專案編號
       xrce023 LIKE xrce_t.xrce023, #WBS編號
       xrce024 LIKE xrce_t.xrce024, #第二參考單號
       xrce025 LIKE xrce_t.xrce025, #第二參考單號項次
       xrce026 LIKE xrce_t.xrce026, #no use
       xrce027 LIKE xrce_t.xrce027, #應稅折抵否
       xrce028 LIKE xrce_t.xrce028, #產生方式
       xrce029 LIKE xrce_t.xrce029, #傳票號碼
       xrce030 LIKE xrce_t.xrce030, #傳票項次
       xrce035 LIKE xrce_t.xrce035, #區域
       xrce036 LIKE xrce_t.xrce036, #客戶分類
       xrce037 LIKE xrce_t.xrce037, #no use
       xrce038 LIKE xrce_t.xrce038, #對象
       xrce039 LIKE xrce_t.xrce039, #經營方式
       xrce040 LIKE xrce_t.xrce040, #通路
       xrce041 LIKE xrce_t.xrce041, #品牌
       xrce042 LIKE xrce_t.xrce042, #自由核算項一
       xrce043 LIKE xrce_t.xrce043, #自由核算項二
       xrce044 LIKE xrce_t.xrce044, #自由核算項三
       xrce045 LIKE xrce_t.xrce045, #自由核算項四
       xrce046 LIKE xrce_t.xrce046, #自由核算項五
       xrce047 LIKE xrce_t.xrce047, #自由核算項六
       xrce048 LIKE xrce_t.xrce048, #自由核算項七
       xrce049 LIKE xrce_t.xrce049, #自由核算項八
       xrce050 LIKE xrce_t.xrce050, #自由核算項九
       xrce051 LIKE xrce_t.xrce051, #自由核算項十
       xrce053 LIKE xrce_t.xrce053, #發票編號
       xrce054 LIKE xrce_t.xrce054, #發票號碼
       xrce100 LIKE xrce_t.xrce100, #幣別
       xrce101 LIKE xrce_t.xrce101, #匯率
       xrce104 LIKE xrce_t.xrce104, #原幣應稅折抵稅額
       xrce109 LIKE xrce_t.xrce109, #原幣沖帳金額
       xrce114 LIKE xrce_t.xrce114, #本幣應稅折抵稅額
       xrce119 LIKE xrce_t.xrce119, #本幣沖帳金額
       xrce120 LIKE xrce_t.xrce120, #本位幣二幣別
       xrce121 LIKE xrce_t.xrce121, #本位幣二匯率
       xrce124 LIKE xrce_t.xrce124, #本位幣二應稅折抵稅額
       xrce129 LIKE xrce_t.xrce129, #本位幣二沖帳金額
       xrce130 LIKE xrce_t.xrce130, #本位幣二幣別
       xrce131 LIKE xrce_t.xrce131, #本位幣三匯率
       xrce134 LIKE xrce_t.xrce134, #本位幣三應稅折抵稅額
       xrce139 LIKE xrce_t.xrce139, #本位幣三沖帳金額
       xrce055 LIKE xrce_t.xrce055, #費用編號
       xrce056 LIKE xrce_t.xrce056, #方向
       xrce057 LIKE xrce_t.xrce057, #預收待抵單號
       xrce058 LIKE xrce_t.xrce058, #應付單號
       xrce103 LIKE xrce_t.xrce103, #未稅原幣沖銷額
       xrce113 LIKE xrce_t.xrce113, #未稅本幣沖銷額
       xrce123 LIKE xrce_t.xrce123, #本位幣二未稅沖銷額
       xrce133 LIKE xrce_t.xrce133, #本位幣三未稅沖銷額
       xrce059 LIKE xrce_t.xrce059  #預收單號
       END RECORD

#161128-00061#4---mdofiy--end---------
DEFINE g_msg                 LIKE type_t.chr80
DEFINE g_amt                 LIKE xrde_t.xrde109
DEFINE g_amt1                LIKE xrde_t.xrde109
DEFINE g_amt2                LIKE xrde_t.xrde109
DEFINE g_amt3                LIKE xrde_t.xrde109
DEFINE g_amt4                LIKE xrde_t.xrde109
#20150323--add--str--
DEFINE g_amt5                LIKE xrde_t.xrde109
DEFINE g_amt6                LIKE xrde_t.xrde109
DEFINE g_amt7                LIKE xrde_t.xrde109
DEFINE g_amt8                LIKE xrde_t.xrde109
#20150323--add--end--
DEFINE g_xrca118             LIKE xrca_t.xrca108
DEFINE g_amt_1               LIKE xrde_t.xrde109
DEFINE g_amt_2               LIKE xrde_t.xrde109
DEFINE g_amt_9               LIKE xrde_t.xrde109
DEFINE g_amt_10              LIKE xrde_t.xrde109
#170512-00045#2 add ------
DEFINE g_glaq_s            RECORD
          glaq017             LIKE glaq_t.glaq017,
          glaq018             LIKE glaq_t.glaq018,
          glaq019             LIKE glaq_t.glaq019,
          glaq020             LIKE glaq_t.glaq020,
          glaq021             LIKE glaq_t.glaq021,
          glaq022             LIKE glaq_t.glaq022,
          glaq023             LIKE glaq_t.glaq023,
          glaq024             LIKE glaq_t.glaq024,
          glaq051             LIKE glaq_t.glaq051,
          glaq052             LIKE glaq_t.glaq052,
          glaq053             LIKE glaq_t.glaq053,
          glaq025             LIKE glaq_t.glaq025,
          glaq027             LIKE glaq_t.glaq027,
          glaq028             LIKE glaq_t.glaq028,
          glaq029             LIKE glaq_t.glaq029,
          glaq030             LIKE glaq_t.glaq030,
          glaq031             LIKE glaq_t.glaq031,
          glaq032             LIKE glaq_t.glaq032,
          glaq033             LIKE glaq_t.glaq033,
          glaq034             LIKE glaq_t.glaq034,
          glaq035             LIKE glaq_t.glaq035,
          glaq036             LIKE glaq_t.glaq036,
          glaq037             LIKE glaq_t.glaq037,
          glaq038             LIKE glaq_t.glaq038,
          glbc004             LIKE glbc_t.glbc004
                           END RECORD
#170512-00045#2 add end---  
#171016-00011#3 -s 171018 add by 01872
#是否做自由科目核算项管理
DEFINE g_glad017        LIKE glad_t.glad017
DEFINE g_glad0171       LIKE glad_t.glad0171 
DEFINE g_glad0172       LIKE glad_t.glad0172 
DEFINE g_glad018        LIKE glad_t.glad018
DEFINE g_glad0181       LIKE glad_t.glad0181
DEFINE g_glad0182       LIKE glad_t.glad0182
DEFINE g_glad019        LIKE glad_t.glad019
DEFINE g_glad0191       LIKE glad_t.glad0191
DEFINE g_glad0192       LIKE glad_t.glad0192
DEFINE g_glad020        LIKE glad_t.glad020
DEFINE g_glad0201       LIKE glad_t.glad0201
DEFINE g_glad0202       LIKE glad_t.glad0202
DEFINE g_glad021        LIKE glad_t.glad021
DEFINE g_glad0211       LIKE glad_t.glad0211
DEFINE g_glad0212       LIKE glad_t.glad0212
DEFINE g_glad022        LIKE glad_t.glad022
DEFINE g_glad0221       LIKE glad_t.glad0221
DEFINE g_glad0222       LIKE glad_t.glad0222
DEFINE g_glad023        LIKE glad_t.glad023
DEFINE g_glad0231       LIKE glad_t.glad0231
DEFINE g_glad0232       LIKE glad_t.glad0232
DEFINE g_glad024        LIKE glad_t.glad024
DEFINE g_glad0241       LIKE glad_t.glad0241
DEFINE g_glad0242       LIKE glad_t.glad0242
DEFINE g_glad025        LIKE glad_t.glad025
DEFINE g_glad0251       LIKE glad_t.glad0251
DEFINE g_glad0252       LIKE glad_t.glad0252
DEFINE g_glad026        LIKE glad_t.glad026
DEFINE g_glad0261       LIKE glad_t.glad0261
DEFINE g_glad0262       LIKE glad_t.glad0262
DEFINE g_glae009        LIKE glae_t.glae009
DEFINE g_glae002        LIKE glae_t.glae002
#171016-00011#3 -e 171018 add by 01872
#end add-point
 
#模組變數(Module Variables)
DEFINE g_xrce_d          DYNAMIC ARRAY OF type_g_xrce_d #單身變數
DEFINE g_xrce_d_t        type_g_xrce_d                  #單身備份
DEFINE g_xrce_d_o        type_g_xrce_d                  #單身備份
DEFINE g_xrce_d_mask_o   DYNAMIC ARRAY OF type_g_xrce_d #單身變數
DEFINE g_xrce_d_mask_n   DYNAMIC ARRAY OF type_g_xrce_d #單身變數
DEFINE g_xrce2_d   DYNAMIC ARRAY OF type_g_xrce2_d
DEFINE g_xrce2_d_t type_g_xrce2_d
DEFINE g_xrce2_d_o type_g_xrce2_d
DEFINE g_xrce2_d_mask_o DYNAMIC ARRAY OF type_g_xrce2_d
DEFINE g_xrce2_d_mask_n DYNAMIC ARRAY OF type_g_xrce2_d
DEFINE g_xrce3_d   DYNAMIC ARRAY OF type_g_xrce3_d
DEFINE g_xrce3_d_t type_g_xrce3_d
DEFINE g_xrce3_d_o type_g_xrce3_d
DEFINE g_xrce3_d_mask_o DYNAMIC ARRAY OF type_g_xrce3_d
DEFINE g_xrce3_d_mask_n DYNAMIC ARRAY OF type_g_xrce3_d
 
      
DEFINE g_wc2                STRING
DEFINE g_sql                STRING
DEFINE g_forupd_sql         STRING                        #SELECT ... FOR UPDATE SQL
DEFINE g_before_input_done  LIKE type_t.num5
DEFINE g_cnt                LIKE type_t.num10    
DEFINE l_ac                 LIKE type_t.num10             #目前處理的ARRAY CNT 
DEFINE g_curr_diag          ui.Dialog                     #Current Dialog
DEFINE gwin_curr            ui.Window                     #Current Window
DEFINE gfrm_curr            ui.Form                       #Current Form
DEFINE g_temp_idx           LIKE type_t.num10             #單身 所在筆數(暫存用)
DEFINE g_detail_idx         LIKE type_t.num10             #單身 所在筆數(所有資料)
DEFINE g_detail_cnt         LIKE type_t.num10             #單身 總筆數(所有資料)
DEFINE g_ref_fields         DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields         DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_ref_vars           DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE gs_keys              DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE gs_keys_bak          DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE g_insert             LIKE type_t.chr5              #是否導到其他page
DEFINE g_error_show         LIKE type_t.num5
DEFINE g_chk                BOOLEAN
DEFINE g_aw                 STRING                        #確定當下點擊的單身
DEFINE g_log1               STRING                        #log用
DEFINE g_log2               STRING                        #log用
DEFINE g_current_page       LIKE type_t.num10             #目前所在頁數   #(ver:42)
DEFINE g_err_rec            LIKE type_t.chr1              #紀錄是否有錯誤   #161130-00056
 
#多table用wc
DEFINE g_wc_table           STRING
 
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
#add-point:傳入參數說明(global.argv) name="global.argv"

#end add-point
 
{</section>}
 
{<section id="axrt300_02.main" >}
#應用 a27 樣板自動產生(Version:6)
#+ 作業開始(子程式類型)
PUBLIC FUNCTION axrt300_02(--)
   #add-point:main段變數傳入 name="main.get_var"
   p_doc,p_ld
   #end add-point
   )
   #add-point:main段define(客製用) name="main.define_customerization"
   
   #end add-point   
   #add-point:main段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="main.define"
   DEFINE p_doc       LIKE xrce_t.xrcedocno
   DEFINE p_ld        LIKE xrce_t.xrceld
   DEFINE l_success   LIKE type_t.chr1
   DEFINE l_xrce109   LIKE xrce_t.xrce109
   DEFINE l_xrce119   LIKE xrce_t.xrce119
   DEFINE l_xrce129   LIKE xrce_t.xrce129
   DEFINE l_xrce139   LIKE xrce_t.xrce139
   #150311-00003#2 By 01727 Add  ---(S)---
   DEFINE l_xrca106   LIKE xrca_t.xrca106
   DEFINE l_xrca107   LIKE xrca_t.xrca107
   DEFINE l_xrca116   LIKE xrca_t.xrca116
   DEFINE l_xrca117   LIKE xrca_t.xrca117
   DEFINE l_xrca126   LIKE xrca_t.xrca126
   DEFINE l_xrca127   LIKE xrca_t.xrca127
   DEFINE l_xrca136   LIKE xrca_t.xrca136
   DEFINE l_xrca137   LIKE xrca_t.xrca137
   DEFINE l_errno     LIKE type_t.chr10
   #150311-00003#2 By 01727 Add  ---(E)---
   #170221-00054#1 add ------
   DEFINE l_xrce100   LIKE xrce_t.xrce100
   DEFINE l_xrde100   LIKE xrde_t.xrde100
   #170221-00054#1 add end---
   DEFINE l_xrce101   LIKE xrce_t.xrce101   #170621-00044#2 add
   DEFINE l_dfin0030  LIKE ooac_t.ooac004   #170621-00044#2 add
   DEFINE l_slip      LIKE xrde_t.xrdedocno #170621-00044#2 add
   DEFINE l_flag      LIKE type_t.chr1      #170621-00044#2 add
   DEFINE l_cnt_xrcedocno LIKE type_t.num5  #170907-00022#1 add  
   #end add-point   
   
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log
 
   #add-point:作業初始化 name="main.init"
   #161128-00061#4---mdofiy--begin---------
   #SELECT * INTO g_xrca_t.* 
   SELECT xrcaent,xrcaownid,xrcaowndp,xrcacrtid,xrcacrtdp,xrcacrtdt,xrcamodid,xrcamoddt,xrcacnfid,
          xrcacnfdt,xrcapstid,xrcapstdt,xrcastus,xrcacomp,xrcald,xrcadocno,xrcadocdt,xrca001,
          xrcasite,xrca003,xrca004,xrca005,xrca006,xrca007,xrca008,xrca009,xrca010,xrca011,
          xrca012,xrca013,xrca014,xrca015,xrca016,xrca017,xrca018,xrca019,xrca020,xrca021,
          xrca022,xrca023,xrca024,xrca025,xrca026,xrca028,xrca029,xrca030,xrca031,xrca032,
          xrca033,xrca034,xrca035,xrca036,xrca037,xrca038,xrca039,xrca040,xrca041,xrca042,
          xrca043,xrca044,xrca045,xrca046,xrca047,xrca048,xrca049,xrca050,xrca051,xrca052,
          xrca053,xrca054,xrca055,xrca056,xrca057,xrca058,xrca059,xrca060,xrca061,xrca062,
          xrca063,xrca064,xrca065,xrca066,xrca100,xrca101,xrca103,xrca104,xrca106,xrca107,
          xrca108,xrca113,xrca114,xrca116,xrca117,xrca118,xrca120,xrca121,xrca123,xrca124,
          xrca126,xrca127,xrca128,xrca130,xrca131,xrca133,xrca134,xrca136,xrca137,xrca138 INTO g_xrca_t.* 
   #161128-00061#4---mdofiy--end---------
   FROM xrca_t WHERE xrcaent = g_enterprise
      AND xrcadocno = p_doc
      AND xrcald    = p_ld
      
   #161128-00061#4-----modify--begin----------
   #SELECT * INTO g_glaa_t.*  
    SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,glaald,
           glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,glaa011,
           glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,glaa023,
           glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,glaa121,
           glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,glaa139,
           glaa140,glaa123,glaa124,glaa028 INTO g_glaa_t.* 
   #161128-00061#4----modify--end----------
      
   FROM glaa_t WHERE glaaent = g_enterprise
      AND glaald = p_ld

   #end add-point
   
   
 
   #LOCK CURSOR (identifier)
 
   
   #add-point:main段define_sql name="main.body.define_sql"
  #160420-00001#1 Mark ---(S)---
  #LET g_forupd_sql = "SELECT xrde001,xrdedocno,xrdeld,xrdesite,xrdeseq,xrde002,xrde006,xrde003,xrde004,
  #    xrde008,xrde100,xrde109,xrde101,xrde119,xrde015,
  #    xrde028,xrdecomp,xrdeorga,xrde010,xrde016,xrde012,xrde001,xrdedocno,xrdeld,xrdesite,xrdeseq,
  #    xrde002,xrde006,xrde003,xrde004,xrde008,xrde100,xrde109,xrde101,xrde119,xrde120,xrde121,xrde129,
  #    xrde130,xrde131,xrde139,xrde001,xrdedocno,xrdeld,xrdesite,xrdeseq,xrde002,xrde006,xrde003,xrde004,
  #    xrde008,xrde100,xrde109,xrde101,xrde119,xrde010,xrde016,xrde017,xrde018,xrde019,
  #    xrde020,xrde022,xrde023 FROM xrde_t WHERE xrdeent=? AND xrdeld=? AND xrdedocno=? AND xrdeseq=?
  #    FOR UPDATE"
  #LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
  #LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
  #DECLARE axrt300_02_bcl1 CURSOR FROM g_forupd_sql
  #160420-00001#1 Mark ---(E)---
   #end add-point 
   LET g_forupd_sql = "SELECT xrce001,xrcedocno,xrceld,xrcesite,xrceseq,xrce002,xrce003,xrce004,xrce005, 
       xrce024,xrce025,xrce008,xrce015,xrce100,xrce101,xrce103,xrce104,xrce109,xrce113,xrce114,xrce119, 
       xrce027,xrce028,xrcecomp,xrceorga,xrce010,xrce016,xrce001,xrcedocno,xrceld,xrcesite,xrceseq,xrce002, 
       xrce003,xrce004,xrce008,xrce100,xrce103,xrce104,xrce109,xrce101,xrce113,xrce114,xrce119,xrce120, 
       xrce121,xrce123,xrce124,xrce129,xrce130,xrce131,xrce133,xrce134,xrce139,xrce001,xrcedocno,xrceld, 
       xrcesite,xrceseq,xrce002,xrce003,xrce004,xrce005,xrce008,xrce100,xrce109,xrce101,xrce119,xrce027, 
       xrce010,xrce016,xrce017,xrce018,xrce019,xrce020,xrce022,xrce023,xrce040,xrce035,xrce036,xrce038, 
       xrce039,xrce041,xrce042,xrce043,xrce044,xrce045,xrce046,xrce047,xrce048,xrce049,xrce050,xrce051  
       FROM xrce_t WHERE xrceent=? AND xrceld=? AND xrcedocno=? AND xrceseq=? FOR UPDATE"
   #add-point:main段define_sql name="main.body.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE axrt300_02_bcl CURSOR FROM g_forupd_sql
 
 
   
   #畫面開啟 (identifier)
   OPEN WINDOW w_axrt300_02 WITH FORM cl_ap_formpath("axr","axrt300_02")
   
   #瀏覽頁簽資料初始化
   CALL cl_ui_init()
   
   #程式初始化
   CALL axrt300_02_init()   
 
   #進入選單 Menu (="N")
   CALL axrt300_02_ui_dialog() 
 
   #畫面關閉
   CLOSE WINDOW w_axrt300_02
 
   
   
 
   #add-point:離開前 name="main.exit"
   LET g_action_choice = ''
   IF g_xrca_t.xrcastus <> 'Y' THEN
      CALL s_transaction_begin()

     #150311-00003#2 By 01727 Mark ---(S)---
     #SELECT xrce109,xrce119,xrce129,xrce139 INTO l_xrce109,l_xrce119,l_xrce129,l_xrce139
     #  FROM xrce_t
     # WHERE xrceent   = g_enterprise
     #   AND xrceld    = p_ld
     #   AND xrcedocno = p_doc
     #IF cl_null(l_xrce109) THEN LET l_xrce109 = 0 END IF
     #IF cl_null(l_xrce119) THEN LET l_xrce119 = 0 END IF
     #IF cl_null(l_xrce129) THEN LET l_xrce129 = 0 END IF
     #IF cl_null(l_xrce139) THEN LET l_xrce139 = 0 END IF
     #
     ##UPDATE xrca_t SET xrca107 = l_xrce109,
     ##                  xrca117 = l_xrce119,
     ##                  xrca127 = l_xrce129,
     ##                  xrca137 = l_xrce139
     ## WHERE xrcaent   = g_enterprise
     ##   AND xrcadocno = p_doc
     ##   AND xrcald    = p_ld
     #
     #UPDATE xrca_t SET xrca107 = g_amt1,
     #                  xrca117 = g_amt2,
     #                  xrca127 = g_amt3,
     #                  xrca137 = g_amt4,
     #                  #20150323--add--str--
     #                  xrca106 = g_amt5,
     #                  xrca116 = g_amt6,
     #                  xrca126 = g_amt7,
     #                  xrca136 = g_amt8
     #                  #20150323--add--end--
     # WHERE xrcaent   = g_enterprise
     #   AND xrcadocno = p_doc
     #   AND xrcald    = p_ld
     #150311-00003#2 By 01727 Mark ---(E)---
     #150311-00003#2 By 01727 Add  ---(S)---

      #170621-00044#2 add s---
      LET l_flag= 'N'
      SELECT xrce101 INTO l_xrce101 FROM xrce_t WHERE xrceent = g_enterprise   AND xrcedocno = p_doc AND xrceld  = p_ld
      IF l_xrce101 <> g_xrca_t.xrca101 THEN 
         IF cl_ask_confirm('axr-01080') THEN 
            LET l_flag= 'Y'
            DELETE FROM xrde_t WHERE xrdeent = g_enterprise AND xrdedocno = p_doc AND xrdeld = p_ld AND xrde002 IN('11','12')
            CALL s_axrp133_ins_xrce_diff(p_doc,p_ld)
         END IF  
      END IF 
      #170621-00044#2 add e---
      
      #170911-00001#1 --s add 下方邏輯搬上來處理
      LET l_cnt_xrcedocno = 0
      SELECT COUNT(xrcedocno) INTO l_cnt_xrcedocno 
        FROM xrce_t 
       WHERE xrceent = g_enterprise AND xrceld = p_ld AND xrcedocno = p_doc
      IF cl_null(l_cnt_xrcedocno) THEN LET l_cnt_xrcedocno = 0 END IF
      IF l_cnt_xrcedocno = 0 THEN
         DELETE FROM xrde_t WHERE xrdeent = g_enterprise AND xrdedocno = p_doc AND xrdeld = p_ld AND xrde002 IN('11','12')
         IF SQLCA.SQLCODE THEN 
            LET l_success = FALSE
         ELSE
            LET l_flag= 'Y' #需更新分錄
         END IF
      END IF      
      #170911-00001#1 --e add       
      

     #應稅折抵者回寫xrca106
      LET l_xrca106 = 0   LET l_xrca116 = 0
      LET l_xrca126 = 0   LET l_xrca136 = 0
      SELECT SUM(xrce109 * CASE WHEN xrce015 = 'D' THEN 1 ELSE -1 END),SUM(xrce119 * CASE WHEN xrce015 = 'D' THEN 1 ELSE -1 END)
        INTO l_xrca106,l_xrca116
        FROM xrce_t
       WHERE xrceent = g_enterprise   AND xrcedocno = p_doc
         AND xrceld  = p_ld           AND xrce027   = 'Y'
      IF cl_null(l_xrca106) THEN LET l_xrca106 = 0 END IF
      IF cl_null(l_xrca116) THEN LET l_xrca116 = 0 END IF
      
      #170210-00048#1--add--str--
      #当已冲销本币金额=账款单本币应收金额（本币未税金额+本币税额）时，原币冲销金额不倒退，直接扣除
      IF g_xrca_t.xrca113 + g_xrca_t.xrca114 = l_xrca116 THEN
         LET l_xrca106 = g_xrca_t.xrca103 + g_xrca_t.xrca104
         LET l_xrca126 = g_xrca_t.xrca123 + g_xrca_t.xrca124
         LET l_xrca136 = g_xrca_t.xrca133 + g_xrca_t.xrca134
      ELSE
      #170210-00048#1--add--end
         CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_xrca_t.xrca100,l_xrca116 / g_xrca_t.xrca101,2)
            RETURNING l_success,l_errno,l_xrca106
      
         IF g_glaa_t.glaa015 = 'Y' THEN
            IF g_glaa_t.glaa017 = '1' THEN
               LET l_xrca126 = l_xrca106 * g_xrca_t.xrca121
            ELSE
               LET l_xrca126 = l_xrca116 * g_xrca_t.xrca121
            END IF
         END IF
         IF g_glaa_t.glaa019 = 'Y' THEN
            IF g_glaa_t.glaa021 = '1' THEN
               LET l_xrca136 = l_xrca106 * g_xrca_t.xrca131
            ELSE
               LET l_xrca136 = l_xrca116 * g_xrca_t.xrca131
            END IF
         END IF
      END IF #170210-00048#1 add
      IF cl_null(l_xrca106) THEN LET l_xrca106 = 0 END IF IF cl_null(l_xrca116) THEN LET l_xrca116 = 0 END IF
      IF cl_null(l_xrca126) THEN LET l_xrca126 = 0 END IF IF cl_null(l_xrca136) THEN LET l_xrca136 = 0 END IF
      UPDATE xrca_t SET xrca106 = l_xrca106,
                        xrca116 = l_xrca116,
                        xrca126 = l_xrca126,
                        xrca136 = l_xrca136
       WHERE xrcaent   = g_enterprise
         AND xrcadocno = p_doc
         AND xrcald    = p_ld      
     
      
      #非應稅折抵者及直接收款者寫入xrca107
      LET l_xrca106 = 0   LET l_xrca116 = 0
      LET l_xrca126 = 0   LET l_xrca136 = 0
      SELECT SUM(xrce109 * CASE WHEN xrce015 = 'D' THEN 1 ELSE -1 END),SUM(xrce119 * CASE WHEN xrce015 = 'D' THEN 1 ELSE -1 END)
            ,xrce100   #170221-00054#1 add
        INTO l_xrca106,l_xrca116
            ,l_xrce100 #170221-00054#1 add           
        FROM xrce_t
       WHERE xrceent = g_enterprise   AND xrcedocno = p_doc
         AND xrceld  = p_ld           AND xrce027   = 'N'
       GROUP BY xrce100 #170221-00054#1 add
      IF cl_null(l_xrca106) THEN LET l_xrca106 = 0 END IF
      IF cl_null(l_xrca116) THEN LET l_xrca116 = 0 END IF
      IF l_xrce100 <> g_xrca_t.xrca100 THEN #170221-00054#1 add
         CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_xrca_t.xrca100,l_xrca116 / g_xrca_t.xrca101,2)
            RETURNING l_success,l_errno,l_xrca106
      END IF #170221-00054#1 add

      IF g_glaa_t.glaa015 = 'Y' THEN
         IF g_glaa_t.glaa017 = '1' THEN
            LET l_xrca126 = l_xrca106 * g_xrca_t.xrca121
         ELSE
            LET l_xrca126 = l_xrca116 * g_xrca_t.xrca121
         END IF
      END IF
      IF g_glaa_t.glaa019 = 'Y' THEN
         IF g_glaa_t.glaa021 = '1' THEN
            LET l_xrca136 = l_xrca106 * g_xrca_t.xrca131
         ELSE
            LET l_xrca136 = l_xrca116 * g_xrca_t.xrca131
         END IF
      END IF
      IF cl_null(l_xrca106) THEN LET l_xrca106 = 0 END IF IF cl_null(l_xrca116) THEN LET l_xrca116 = 0 END IF
      IF cl_null(l_xrca126) THEN LET l_xrca126 = 0 END IF IF cl_null(l_xrca136) THEN LET l_xrca136 = 0 END IF
      LET l_xrca107 = 0   LET l_xrca117 = 0
      LET l_xrca127 = 0   LET l_xrca137 = 0
      
      
      SELECT SUM(xrde109 * CASE WHEN xrde015 = 'D' THEN 1 ELSE -1 END),SUM(xrde119 * CASE WHEN xrde015 = 'D' THEN 1 ELSE -1 END)
            ,xrde100    #170221-00054#1 add
        INTO l_xrca107,l_xrca117
            ,l_xrde100  #170221-00054#1 add
        FROM xrde_t
       WHERE xrdeent = g_enterprise   AND xrdedocno = p_doc
         AND xrdeld  = p_ld
       GROUP BY xrde100 #170221-00054#1 add
      #若為11:匯兌損失or12:匯兌收益，原幣=0，這種不走反推
      IF l_xrde100 <> g_xrca_t.xrca100 AND l_xrca107 > 0 THEN #170221-00054#1 add
         CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_xrca_t.xrca100,l_xrca117 / g_xrca_t.xrca101,2)
            RETURNING l_success,l_errno,l_xrca107
      END IF #170221-00054#1 add
      IF cl_null(l_xrca107) THEN LET l_xrca107 = 0 END IF
      IF cl_null(l_xrca117) THEN LET l_xrca117 = 0 END IF
      IF g_glaa_t.glaa015 = 'Y' THEN
         IF g_glaa_t.glaa017 = '1' THEN
            LET l_xrca127 = l_xrca107 * g_xrca_t.xrca121
         ELSE
            LET l_xrca127 = l_xrca117 * g_xrca_t.xrca121
         END IF
      END IF
      IF g_glaa_t.glaa019 = 'Y' THEN
         IF g_glaa_t.glaa021 = '1' THEN
            LET l_xrca137 = l_xrca107 * g_xrca_t.xrca131
         ELSE
            LET l_xrca137 = l_xrca117 * g_xrca_t.xrca131
         END IF
      END IF
      IF cl_null(l_xrca107) THEN LET l_xrca107 = 0 END IF IF cl_null(l_xrca117) THEN LET l_xrca117 = 0 END IF
      IF cl_null(l_xrca127) THEN LET l_xrca127 = 0 END IF IF cl_null(l_xrca137) THEN LET l_xrca137 = 0 END IF
      

      
      UPDATE xrca_t SET xrca107 = l_xrca106 + l_xrca107,
                        xrca117 = l_xrca116 + l_xrca117,
                        xrca127 = l_xrca126 + l_xrca127,
                        xrca137 = l_xrca136 + l_xrca137
       WHERE xrcaent   = g_enterprise
         AND xrcadocno = p_doc
         AND xrcald    = p_ld

      #160420-00001#1 Add  ---(S)---
      UPDATE xrca_t SET xrca107 = xrca103 + xrca104 - xrca106,
                        xrca127 = xrca123 + xrca124 - xrca126,
                        xrca137 = xrca133 + xrca134 - xrca136
       WHERE xrcaent   = g_enterprise
         AND xrcadocno = p_doc
         AND xrcald    = p_ld
         AND xrca113 + xrca114 = xrca116 + xrca117
      #160420-00001#1 Add  ---(E)---
      
      #170911-00001#1 --s mark 搬上去處理
      ##170907-00022#1 --s add  
      #LET l_cnt_xrcedocno = 0
      #SELECT COUNT(xrcedocno) INTO l_cnt_xrcedocno 
      #  FROM xrce_t 
      # WHERE xrceent = g_enterprise AND xrceld = p_ld AND xrcedocno = p_doc
      #IF cl_null(l_cnt_xrcedocno) THEN LET l_cnt_xrcedocno = 0 END IF
      #IF l_cnt_xrcedocno = 0 THEN
      #   DELETE FROM xrde_t WHERE xrdeent = g_enterprise AND xrdedocno = p_doc AND xrdeld = p_ld AND xrde002 IN('11','12')
      #   IF SQLCA.SQLCODE THEN 
      #      LET l_success = FALSE
      #   ELSE
      #      LET l_flag= 'Y' #需更新分錄
      #   END IF
      #END IF      
      ##170907-00022#1 --e add    
      #170911-00001#1 --e mark      
      
      CALL s_axrt300_installments(g_xrca_t.xrcald,g_xrca_t.xrcadocno) RETURNING l_success  
      
      
      #150311-00003#2 By 01727 Add  ---(E)---


      #170621-00044#2 add s---
      IF l_flag = 'Y' THEN  #產生損益後 增加提示重新產生分錄
         #获取单别
         CALL s_aooi200_fin_get_slip(g_xrca_t.xrcadocno) RETURNING l_success,l_slip
         #是否抛傳票
         CALL s_fin_get_doc_para(g_xrca_t.xrcald,g_xrca_t.xrcacomp,l_slip,'D-FIN-0030') RETURNING l_dfin0030
         
         IF l_dfin0030 = 'Y' AND g_glaa_t.glaa121 = 'Y' THEN   
            CALL s_pre_voucher_ins('AR','R10',g_xrca_t.xrcald,g_xrca_t.xrcadocno,g_xrca_t.xrcadocdt,'1')
               RETURNING l_success
         END IF      
      END IF   
      #170621-00044#2 add e---     
      
      
      IF l_success THEN
         CALL s_transaction_end('Y',0)
      ELSE
         CALL s_transaction_end('N',0)
      END IF
   END IF
   #end add-point
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="axrt300_02.init" >}
#+ 畫面資料初始化
PRIVATE FUNCTION axrt300_02_init()
   #add-point:init段define(客製用) name="init.define_customerization"
   
   #end add-point
   #add-point:init段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   DEFINE l_sql      STRING
   DEFINE l_str      STRING
   DEFINE l_str1     STRING
   DEFINE l_gzcb002  LIKE gzcb_t.gzcb002
   DEFINE l_ooab002  LIKE ooab_t.ooab002
   #end add-point   
   
   #add-point:Function前置處理  name="init.pre_function"
   
   #end add-point
   
   
   
   LET g_error_show = 1
   LET g_err_rec = "N"   #161130-00056
   
   #add-point:畫面資料初始化 name="init.init"
   #CALL cl_set_combo_scc('xrce006_t','8310')
   #CALL cl_set_combo_scc('xrce006_u','8310')
   
  #160420-00001#1 Mark ---(S)---
  ##xrce006下拉菜單取值,SCC_8310 AND gzcb002<>'ZZ'
  #LET l_str = Null
  #LET l_gzcb002 = Null
  #LET l_str1 = " AND gzcb002 <> 'ZZ'"
  #LET l_sql = "SELECT gzcb002 FROM gzcb_t WHERE gzcb001 = '8310' "
  #IF g_prog <> 'axrt350'  THEN
  #   LET l_sql = l_sql,l_str1
  #END IF
  #PREPARE axrt300_02_xrce006_prep FROM l_sql
  #DECLARE axrt300_02_xrce006_curs CURSOR FOR axrt300_02_xrce006_prep
  #LET l_str = Null
  #LET l_gzcb002 = Null
  #FOREACH axrt300_02_xrce006_curs INTO l_gzcb002
  #   IF cl_null(l_str) THEN LET l_str = l_gzcb002 CONTINUE FOREACH END IF
  #   LET l_str = l_str,",",l_gzcb002
  #END FOREACH
  #CALL cl_set_combo_scc_part('xrce006','8310',l_str)
  #CALL cl_set_combo_scc_part('xrce006_t','8310',l_str)
  #CALL cl_set_combo_scc_part('xrce006_u','8310',l_str)
      
  ##xrce002下拉菜單取值,SCC_8306 AND gzcb005 NOT Null
  #LET l_sql = "SELECT gzcb002 FROM gzcb_t WHERE gzcb001 = '8306' AND gzcb005 Is Not Null"
  #PREPARE axrt300_02_xrce002_prep FROM l_sql
  #DECLARE axrt300_02_xrce002_curs CURSOR FOR axrt300_02_xrce002_prep
  #LET l_str = Null
  #LET l_gzcb002 = Null
  #FOREACH axrt300_02_xrce002_curs INTO l_gzcb002
  #   IF cl_null(l_str) THEN LET l_str = l_gzcb002 CONTINUE FOREACH END IF
  #   LET l_str = l_str,",",l_gzcb002
  #END FOREACH
  #CALL cl_set_combo_scc_part('xrce002','8306',l_str)
  #CALL cl_set_combo_scc_part('xrce002_t','8306',l_str)
  #CALL cl_set_combo_scc_part('xrce002_u','8306',l_str)
  #160420-00001#1 Mark ---(E)---

  #160420-00001#1 Add  ---(S)---
   #xrce002下拉菜單取值,SCC_8306 AND gzcb004='2'
   LET l_str = Null
   LET l_gzcb002 = Null
#160531-00041#1 mod s---
#   LET l_sql = "SELECT gzcb002 FROM gzcb_t WHERE gzcb001 = '8306' AND gzcb004 = '2' AND gzcb002 <> '30'"
   LET l_sql = "SELECT gzcb002 FROM gzcb_t WHERE gzcb001 = '8306' AND gzcb004 = '2' AND gzcb002 IN('31','32') "
#160531-00041#1 mod e---
   PREPARE axrt400_xrce002_prep FROM l_sql
   DECLARE axrt400_xrce002_curs CURSOR FOR axrt400_xrce002_prep
   LET l_str = Null
   LET l_gzcb002 = Null
   FOREACH axrt400_xrce002_curs INTO l_gzcb002
      IF cl_null(l_str) THEN LET l_str = l_gzcb002 CONTINUE FOREACH END IF
      LET l_str = l_str,",",l_gzcb002
   END FOREACH
   CALL cl_set_combo_scc_part('xrce002','8306',l_str)
   CALL cl_set_combo_scc_part('xrce002_t','8306',l_str)
   CALL cl_set_combo_scc_part('xrce002_u','8306',l_str)
  #160420-00001#1 Add  ---(E)---

   IF g_glaa_t.glaa015 = 'N' AND g_glaa_t.glaa019 = 'N' THEN
      CALL cl_set_comp_visible('bpage_2',FALSE)
   ELSE
      CALL cl_set_comp_visible('bpage_2',TRUE)
   END IF

   IF g_glaa_t.glaa015 = 'N' THEN
      CALL cl_set_comp_visible('xrce120,xrce121,xrce129',FALSE)
   ELSE
      CALL cl_set_comp_visible('xrce120,xrce121,xrce129',TRUE)
   END IF

   IF g_glaa_t.glaa019 = 'N' THEN
      CALL cl_set_comp_visible('xrce130,xrce131,xrce139',FALSE)
   ELSE
      CALL cl_set_comp_visible('xrce130,xrce131,xrce139',TRUE)
   END IF

   CALL axrt300_02_ref_amt()

   #IF g_prog = 'axrt350' THEN #170301-00023#10 mark    
   IF g_prog MATCHES 'axrt350*' THEN #170301-00023#10 add
      CALL cl_set_comp_visible('xrce002,xrce003,xrce004,xrce005',FALSE)
     #CALL cl_set_comp_visible('xrde007,xrde007_desc',TRUE)    #160420-00001#1 Mark
   ELSE
      CALL cl_set_comp_visible('xrce002,xrce003,xrce004,xrce005',TRUE)
     #CALL cl_set_comp_visible('xrde007,xrde007_desc',FALSE)   #160420-00001#1 Mark
   END IF

   #LET l_ooab002 = ''
   #SELECT ooab002 INTO l_ooab002 FROM ooab_t
   # WHERE ooabent = g_enterprise
   #   AND ooab001 = 'S-FIN-1002'
   #   AND ooabsite= g_xrca_t.xrcasite
   #IF l_ooab002 = 'N' THEN
   #   CALL cl_set_comp_visible('xrce004,xrce025',FALSE)
   #   CALL cl_set_comp_visible('xrce004_t,xrce004_u',FALSE)
   #ELSE
   #   CALL cl_set_comp_visible('xrce004,xrce025',TRUE)
   #   CALL cl_set_comp_visible('xrce004_t,xrce004_u',TRUE)
   #END IF
   CALL cl_set_combo_scc('xrce039','6013') #171016-00011#3 add 
   CALL cl_set_combo_scc('xrce039_desc','6013') #171016-00011#3 add 
   #end add-point
   
   CALL axrt300_02_default_search()
   
END FUNCTION
 
{</section>}
 
{<section id="axrt300_02.ui_dialog" >}
#+ 功能選單 
PRIVATE FUNCTION axrt300_02_ui_dialog()
   #add-point:ui_dialog段define(客製用) name="ui_dialog.define_customerization"
   
   #end add-point
   DEFINE li_idx   LIKE type_t.num10
   DEFINE la_param  RECORD #串查用
             prog   STRING,
             param  DYNAMIC ARRAY OF STRING
                    END RECORD
   DEFINE ls_js     STRING
   DEFINE l_cmd_token           base.StringTokenizer   #報表作業cmdrun使用 
   DEFINE l_cmd_next            STRING                 #報表作業cmdrun使用
   DEFINE l_cmd_cnt             LIKE type_t.num5       #報表作業cmdrun使用
   DEFINE l_cmd_prog_arg        STRING                 #報表作業cmdrun使用
   DEFINE l_cmd_arg             STRING                 #報表作業cmdrun使用
   #(ver:47) ---add start---
   DEFINE l_arr_len       INTEGER
   DEFINE l_arr_cnt       INTEGER
   DEFINE lb_get_type     LIKE type_t.chr20
   #(ver:47) --- add end ---
   #add-point:ui_dialog段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_dialog.define"
   DEFINE l_item          DYNAMIC ARRAY OF VARCHAR(100) #170512-00045#2   
   #end add-point 
   
   #add-point:Function前置處理  name="ui_dialog.pre_function"
   
   #end add-point
   
   LET g_action_choice = " "  
   LET gwin_curr = ui.Window.getCurrent()
   LET gfrm_curr = gwin_curr.getForm()      
 
   CALL cl_set_act_visible("accept,cancel", FALSE)
   
   LET g_detail_idx = 1
   
   #add-point:ui_dialog段before dialog  name="ui_dialog.before_dialog"
   LET g_wc2 = " xrcedocno = '",g_xrca_t.xrcadocno,"' AND xrceld = '",g_xrca_t.xrcald,"'"
   #end add-point
   
   WHILE TRUE
   
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_xrce_d.clear()
         CALL g_xrce2_d.clear()
         CALL g_xrce3_d.clear()
 
         LET g_wc2 = ' 1=2'
         LET g_action_choice = ""
         CALL axrt300_02_init()
      END IF
   
      CALL axrt300_02_b_fill(g_wc2)
   
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         DISPLAY ARRAY g_xrce_d TO s_detail1.* ATTRIBUTE(COUNT=g_detail_cnt) 
      
            BEFORE DISPLAY 
               #add-point:ui_dialog段before display  name="ui_dialog.body.before_display"

               #IF g_prog = 'axrt350' THEN #170301-00023#10 mark    
               IF g_prog MATCHES 'axrt350*' THEN #170301-00023#10 add
                  CALL cl_set_comp_visible('xrce002,xrce003,xrce004,xrce005',FALSE)
                 #CALL cl_set_comp_visible('xrde007,xrde007_desc',TRUE)    #160420-00001#1 Mark
               ELSE
                  CALL cl_set_comp_visible('xrce002,xrce003,xrce004,xrce005',TRUE)
                 #CALL cl_set_comp_visible('xrde007,xrde007_desc',FALSE)   #160420-00001#1 Mark
               END IF

               #end add-point
               #讓各頁籤能夠同步指到特定資料
               CALL FGL_SET_ARR_CURR(g_detail_idx)
               #add-point:ui_dialog段before display2 name="ui_dialog.body.before_display2"
               
               #end add-point
               
            BEFORE ROW
               #(ver:42) ---start---
               LET g_current_page = 1
               CALL axrt300_02_idx_chk()
               #(ver:42) --- end ---
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
               LET l_ac = g_detail_idx
               LET g_temp_idx = l_ac
               DISPLAY g_detail_idx TO FORMONLY.idx
               CALL cl_show_fld_cont() 
               #顯示followup圖示
               #應用 a48 樣板自動產生(Version:3)
   CALL axrt300_02_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
               #add-point:display array-before row name="ui_dialog.before_row"
 
               #end add-point
         
            #自訂ACTION(detail_show,page_1)
            
               
         END DISPLAY
      
         DISPLAY ARRAY g_xrce2_d TO s_detail2.*
            ATTRIBUTES(COUNT=g_detail_cnt)  
         
            BEFORE DISPLAY 
               #add-point:ui_dialog段before display  name="ui_dialog.body2.before_display"
               
               #end add-point
               CALL FGL_SET_ARR_CURR(g_detail_idx)
               #add-point:ui_dialog段before display2 name="ui_dialog.body2.before_display2"
               
               #end add-point
         
            BEFORE ROW
               #(ver:42) ---start---
               LET g_current_page = 2
               CALL axrt300_02_idx_chk()
               #(ver:42) --- end ---
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail2")
               LET l_ac = g_detail_idx
               LET g_temp_idx = l_ac
               DISPLAY g_detail_idx TO FORMONLY.idx
               CALL cl_show_fld_cont() 
               #顯示followup圖示
               #應用 a48 樣板自動產生(Version:3)
   CALL axrt300_02_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
               #add-point:display array-before row name="ui_dialog.before_row2"
               
               #end add-point
               
            #自訂ACTION(detail_show,page_2)
            
               
         END DISPLAY
         DISPLAY ARRAY g_xrce3_d TO s_detail3.*
            ATTRIBUTES(COUNT=g_detail_cnt)  
         
            BEFORE DISPLAY 
               #add-point:ui_dialog段before display  name="ui_dialog.body3.before_display"
               
               #end add-point
               CALL FGL_SET_ARR_CURR(g_detail_idx)
               #add-point:ui_dialog段before display2 name="ui_dialog.body3.before_display2"
               
               #end add-point
         
            BEFORE ROW
               #(ver:42) ---start---
               LET g_current_page = 3
               CALL axrt300_02_idx_chk()
               #(ver:42) --- end ---
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail3")
               LET l_ac = g_detail_idx
               LET g_temp_idx = l_ac
               DISPLAY g_detail_idx TO FORMONLY.idx
               CALL cl_show_fld_cont() 
               #顯示followup圖示
               #應用 a48 樣板自動產生(Version:3)
   CALL axrt300_02_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
               #add-point:display array-before row name="ui_dialog.before_row3"
               #170512-00045#2 add ------
               LET l_item[1] = g_xrca_t.xrcald
               LET l_item[2] = g_xrce3_d[l_ac].xrce016
               CALL axrt300_02_set_fixacc_require(l_item)
               #170512-00045#2 add end---
               #end add-point
               
            #自訂ACTION(detail_show,page_3)
            
               
         END DISPLAY
 
      
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         
         #end add-point
    
         BEFORE DIALOG
            IF g_temp_idx > 0 THEN
               LET l_ac = g_temp_idx
               CALL DIALOG.setCurrentRow("s_detail1",l_ac)
               LET g_temp_idx = 1
            END IF
            LET g_curr_diag = ui.DIALOG.getCurrent()         
            CALL DIALOG.setSelectionMode("s_detail1", 1)
            CALL DIALOG.setSelectionMode("s_detail2", 1)
            CALL DIALOG.setSelectionMode("s_detail3", 1)
 
            #add-point:ui_dialog段before name="ui_dialog.b_dialog"
            IF g_xrca_t.xrcastus <> 'N' THEN 
               CALL cl_set_act_visible("insert,modify,delete,modify_detail", FALSE)  
            ELSE
               CALL cl_set_act_visible("insert,modify,delete,modify_detail", TRUE)  
            END IF
            CALL cl_set_act_visible("logistics", FALSE) 
            #end add-point
            NEXT FIELD CURRENT
      
         
         #應用 a67 樣板自動產生(Version:1)
         ON ACTION modify
            LET g_action_choice="modify"
            LET g_aw = ''
            CALL axrt300_02_show_ownid_msg()
            #因為不呼叫cl_auth_chk_act()，所以需另外紀錄log，
            #但紀錄log時需紀錄status，與鴻傑討論後，決議先一律紀錄成功
            CALL cl_log_act(g_action_choice,TRUE)
            CALL axrt300_02_modify()
            #add-point:ON ACTION modify name="menu.modify"
            
            #END add-point
            
 
 
 
 
         #應用 a67 樣板自動產生(Version:1)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            LET g_aw = g_curr_diag.getCurrentItem()
            CALL axrt300_02_show_ownid_msg()
            #因為不呼叫cl_auth_chk_act()，所以需另外紀錄log，
            #但紀錄log時需紀錄status，與鴻傑討論後，決議先一律紀錄成功
            CALL cl_log_act(g_action_choice,TRUE)
            CALL axrt300_02_modify()
            #add-point:ON ACTION modify_detail name="menu.modify_detail"
            
            #END add-point
            
 
 
 
 
         #應用 a67 樣板自動產生(Version:1)
         ON ACTION delete
            LET g_action_choice="delete"
            CALL axrt300_02_show_ownid_msg()
            #因為不呼叫cl_auth_chk_act()，所以需另外紀錄log，
            #但紀錄log時需紀錄status，與鴻傑討論後，決議先一律紀錄成功
            CALL cl_log_act(g_action_choice,TRUE)
            CALL axrt300_02_delete()
            #add-point:ON ACTION delete name="menu.delete"
            
            #END add-point
            
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL axrt300_02_insert()
               #add-point:ON ACTION insert name="menu.insert"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
      
         ON ACTION exporttoexcel
            LET g_action_choice="exporttoexcel"
            IF cl_auth_chk_act("exporttoexcel") THEN
               #(ver:47) ---start---
               #因應匯出excel規則調整，需同時符合新舊做法
               LET lb_get_type = cl_get_exporttoexcel_type()
               #add-point:ON ACTION exporttoexcel name="ui_dialog.exporttoexcel_type_change"
               
               #END add-point
               DISPLAY "lb_get_type:",lb_get_type
 
               CASE
                  WHEN lb_get_type = "poi"   #使用poi樣板
                     CALL g_export_node.clear()
                     LET l_arr_len = g_xrce_d.getLength()
                     LET g_export_tag[1] = rec_arr_type.create(l_arr_len)
                     LET g_export_tabname[1] = "s_detail1"
                     FOR l_arr_cnt = 1 TO l_arr_len
                        LET g_export_tag[1][l_arr_cnt] = g_xrce_d[l_arr_cnt]
                     END FOR
 
                     LET l_arr_len = g_xrce2_d.getLength()
                     LET g_export_tag[2] = rec_arr_type.create(l_arr_len)
                     LET g_export_tabname[2] = "s_detail2"
                     FOR l_arr_cnt = 1 TO l_arr_len
                         LET g_export_tag[2][l_arr_cnt] = g_xrce2_d[l_arr_cnt]
                     END FOR
                     LET l_arr_len = g_xrce3_d.getLength()
                     LET g_export_tag[3] = rec_arr_type.create(l_arr_len)
                     LET g_export_tabname[3] = "s_detail3"
                     FOR l_arr_cnt = 1 TO l_arr_len
                         LET g_export_tag[3][l_arr_cnt] = g_xrce3_d[l_arr_cnt]
                     END FOR
 
                     #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_poi"
                     
                     #END add-point
                     CALL cl_export_to_excel_getpage()
                     CALL cl_export_poi()
                     #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_after_poi"
                     
                     #END add-point
 
                  OTHERWISE   #使用原始樣板
               #(ver:47) --- end ---
                     CALL g_export_node.clear()
                     LET g_export_node[1] = base.typeInfo.create(g_xrce_d)
                     LET g_export_id[1]   = "s_detail1"
                     LET g_export_node[2] = base.typeInfo.create(g_xrce2_d)
                     LET g_export_id[2]   = "s_detail2"
                     LET g_export_node[3] = base.typeInfo.create(g_xrce3_d)
                     LET g_export_id[3]   = "s_detail3"
 
                     #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"
                     
                     #END add-point
                     CALL cl_export_to_excel_getpage()
                     CALL cl_export_to_excel()
                     #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_after"   #(ver:40)
                     
                     #END add-point
               END CASE   #(ver:47) add
            END IF
            
         ON ACTION close
            LET INT_FLAG=FALSE         
            LET g_action_choice="exit"
            CANCEL DIALOG
      
         ON ACTION exit
            LET g_action_choice="exit"
            CANCEL DIALOG
            
         
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL axrt300_02_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL axrt300_02_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL axrt300_02_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow('')
 
 
 
         
         #主選單用ACTION
         &include "main_menu_exit_dialog.4gl"
         &include "relating_action.4gl"
         #交談指令共用ACTION
         &include "common_action.4gl"
            CONTINUE DIALOG
      END DIALOG
      
      IF g_action_choice = "exit" AND NOT cl_null(g_action_choice) THEN
         #add-point:ui_dialog段離開dialog前 name="ui_dialog.b_exit"
         
         #end add-point
         EXIT WHILE
      END IF
      
   END WHILE
 
   CALL cl_set_act_visible("accept,cancel", TRUE)
 
END FUNCTION
 
{</section>}
 
{<section id="axrt300_02.query" >}
#+ QBE資料查詢
PRIVATE FUNCTION axrt300_02_query()
   #add-point:query段define(客製用) name="query.define_customerization"
   
   #end add-point
   DEFINE ls_wc      LIKE type_t.chr500
   DEFINE ls_return  STRING
   DEFINE ls_result  STRING 
   #add-point:query段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="query.define"
   DEFINE l_glaa005  LIKE glaa_t.glaa005
   #end add-point 
   
   #add-point:Function前置處理  name="query.pre_function"
   
   #end add-point
   
   LET INT_FLAG = 0
   CLEAR FORM
   CALL g_xrce_d.clear()
   
   LET g_qryparam.state = "c"
   
   #wc備份
   LET ls_wc = g_wc2
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
      CONSTRUCT g_wc2 ON xrce001,xrcedocno,xrceld,xrcesite,xrceseq,xrce002,xrce003,xrce004,xrce005,xrce024, 
          xrce025,xrce008,lc_xrce008,xrce015,xrce100,xrce101,xrce103,xrce104,xrce109,xrce113,xrce114, 
          xrce119,xrce027,xrce028,xrcecomp,xrceorga,xrce010,xrce016,xrce016_desc_1,xrce001_t,xrcedocno_t, 
          xrceld_t,xrcesite_t,xrceseq_t,xrce002_t,xrce003_t,xrce004_t,xrce008_t,xrce100_t,xrce103_t, 
          xrce104_t,xrce109_t,xrce101_t,xrce113_t,xrce114_t,xrce119_t,xrce120,xrce121,xrce123,xrce124, 
          xrce129,xrce130,xrce131,xrce133,xrce134,xrce139,xrce001_u,xrcedocno_u,xrceld_u,xrcesite_u, 
          xrceseq_u,xrce002_u,xrce003_u,xrce004_u,xrce005_u,xrce008_u,xrce100_u,xrce109_u,xrce101_u, 
          xrce119_u,xrce027_u,xrce010_u,xrce016_u,xrce016_u_desc,xrce017,xrce018_u,xrce019,xrce020,xrce022, 
          xrce023,xrce040,xrce035,xrce035_desc,xrce036,xrce036_desc,xrce038,xrce039,xrce041,xrce041_desc, 
          xrce042,xrce042_desc,xrce043,xrce043_desc,xrce044,xrce044_desc,xrce045,xrce045_desc,xrce046, 
          xrce046_desc,xrce047,xrce047_desc,xrce048,xrce048_desc,xrce049,xrce049_desc,xrce050,xrce050_desc, 
          xrce051,xrce051_desc 
 
         FROM s_detail1[1].xrce001,s_detail1[1].xrcedocno,s_detail1[1].xrceld,s_detail1[1].xrcesite, 
             s_detail1[1].xrceseq,s_detail1[1].xrce002,s_detail1[1].xrce003,s_detail1[1].xrce004,s_detail1[1].xrce005, 
             s_detail1[1].xrce024,s_detail1[1].xrce025,s_detail1[1].xrce008,s_detail1[1].lc_xrce008, 
             s_detail1[1].xrce015,s_detail1[1].xrce100,s_detail1[1].xrce101,s_detail1[1].xrce103,s_detail1[1].xrce104, 
             s_detail1[1].xrce109,s_detail1[1].xrce113,s_detail1[1].xrce114,s_detail1[1].xrce119,s_detail1[1].xrce027, 
             s_detail1[1].xrce028,s_detail1[1].xrcecomp,s_detail1[1].xrceorga,s_detail1[1].xrce010,s_detail1[1].xrce016, 
             s_detail1[1].xrce016_desc_1,s_detail2[1].xrce001_t,s_detail2[1].xrcedocno_t,s_detail2[1].xrceld_t, 
             s_detail2[1].xrcesite_t,s_detail2[1].xrceseq_t,s_detail2[1].xrce002_t,s_detail2[1].xrce003_t, 
             s_detail2[1].xrce004_t,s_detail2[1].xrce008_t,s_detail2[1].xrce100_t,s_detail2[1].xrce103_t, 
             s_detail2[1].xrce104_t,s_detail2[1].xrce109_t,s_detail2[1].xrce101_t,s_detail2[1].xrce113_t, 
             s_detail2[1].xrce114_t,s_detail2[1].xrce119_t,s_detail2[1].xrce120,s_detail2[1].xrce121, 
             s_detail2[1].xrce123,s_detail2[1].xrce124,s_detail2[1].xrce129,s_detail2[1].xrce130,s_detail2[1].xrce131, 
             s_detail2[1].xrce133,s_detail2[1].xrce134,s_detail2[1].xrce139,s_detail3[1].xrce001_u,s_detail3[1].xrcedocno_u, 
             s_detail3[1].xrceld_u,s_detail3[1].xrcesite_u,s_detail3[1].xrceseq_u,s_detail3[1].xrce002_u, 
             s_detail3[1].xrce003_u,s_detail3[1].xrce004_u,s_detail3[1].xrce005_u,s_detail3[1].xrce008_u, 
             s_detail3[1].xrce100_u,s_detail3[1].xrce109_u,s_detail3[1].xrce101_u,s_detail3[1].xrce119_u, 
             s_detail3[1].xrce027_u,s_detail3[1].xrce010_u,s_detail3[1].xrce016_u,s_detail3[1].xrce016_u_desc, 
             s_detail3[1].xrce017,s_detail3[1].xrce018_u,s_detail3[1].xrce019,s_detail3[1].xrce020,s_detail3[1].xrce022, 
             s_detail3[1].xrce023,s_detail3[1].xrce040,s_detail3[1].xrce035,s_detail3[1].xrce035_desc, 
             s_detail3[1].xrce036,s_detail3[1].xrce036_desc,s_detail3[1].xrce038,s_detail3[1].xrce039, 
             s_detail3[1].xrce041,s_detail3[1].xrce041_desc,s_detail3[1].xrce042,s_detail3[1].xrce042_desc, 
             s_detail3[1].xrce043,s_detail3[1].xrce043_desc,s_detail3[1].xrce044,s_detail3[1].xrce044_desc, 
             s_detail3[1].xrce045,s_detail3[1].xrce045_desc,s_detail3[1].xrce046,s_detail3[1].xrce046_desc, 
             s_detail3[1].xrce047,s_detail3[1].xrce047_desc,s_detail3[1].xrce048,s_detail3[1].xrce048_desc, 
             s_detail3[1].xrce049,s_detail3[1].xrce049_desc,s_detail3[1].xrce050,s_detail3[1].xrce050_desc, 
             s_detail3[1].xrce051,s_detail3[1].xrce051_desc 
      
         
      
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce001
            #add-point:BEFORE FIELD xrce001 name="query.b.page1.xrce001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce001
            
            #add-point:AFTER FIELD xrce001 name="query.a.page1.xrce001"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.xrce001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce001
            #add-point:ON ACTION controlp INFIELD xrce001 name="query.c.page1.xrce001"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcedocno
            #add-point:BEFORE FIELD xrcedocno name="query.b.page1.xrcedocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcedocno
            
            #add-point:AFTER FIELD xrcedocno name="query.a.page1.xrcedocno"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.xrcedocno
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcedocno
            #add-point:ON ACTION controlp INFIELD xrcedocno name="query.c.page1.xrcedocno"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrceld
            #add-point:BEFORE FIELD xrceld name="query.b.page1.xrceld"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrceld
            
            #add-point:AFTER FIELD xrceld name="query.a.page1.xrceld"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.xrceld
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrceld
            #add-point:ON ACTION controlp INFIELD xrceld name="query.c.page1.xrceld"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcesite
            #add-point:BEFORE FIELD xrcesite name="query.b.page1.xrcesite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcesite
            
            #add-point:AFTER FIELD xrcesite name="query.a.page1.xrcesite"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.xrcesite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcesite
            #add-point:ON ACTION controlp INFIELD xrcesite name="query.c.page1.xrcesite"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrceseq
            #add-point:BEFORE FIELD xrceseq name="query.b.page1.xrceseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrceseq
            
            #add-point:AFTER FIELD xrceseq name="query.a.page1.xrceseq"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.xrceseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrceseq
            #add-point:ON ACTION controlp INFIELD xrceseq name="query.c.page1.xrceseq"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce002
            #add-point:BEFORE FIELD xrce002 name="query.b.page1.xrce002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce002
            
            #add-point:AFTER FIELD xrce002 name="query.a.page1.xrce002"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.xrce002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce002
            #add-point:ON ACTION controlp INFIELD xrce002 name="query.c.page1.xrce002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce003
            #add-point:BEFORE FIELD xrce003 name="query.b.page1.xrce003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce003
            
            #add-point:AFTER FIELD xrce003 name="query.a.page1.xrce003"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.xrce003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce003
            #add-point:ON ACTION controlp INFIELD xrce003 name="query.c.page1.xrce003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce004
            #add-point:BEFORE FIELD xrce004 name="query.b.page1.xrce004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce004
            
            #add-point:AFTER FIELD xrce004 name="query.a.page1.xrce004"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.xrce004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce004
            #add-point:ON ACTION controlp INFIELD xrce004 name="query.c.page1.xrce004"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce005
            #add-point:BEFORE FIELD xrce005 name="query.b.page1.xrce005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce005
            
            #add-point:AFTER FIELD xrce005 name="query.a.page1.xrce005"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.xrce005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce005
            #add-point:ON ACTION controlp INFIELD xrce005 name="query.c.page1.xrce005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce024
            #add-point:BEFORE FIELD xrce024 name="query.b.page1.xrce024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce024
            
            #add-point:AFTER FIELD xrce024 name="query.a.page1.xrce024"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.xrce024
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce024
            #add-point:ON ACTION controlp INFIELD xrce024 name="query.c.page1.xrce024"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce025
            #add-point:BEFORE FIELD xrce025 name="query.b.page1.xrce025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce025
            
            #add-point:AFTER FIELD xrce025 name="query.a.page1.xrce025"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.xrce025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce025
            #add-point:ON ACTION controlp INFIELD xrce025 name="query.c.page1.xrce025"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce008
            #add-point:BEFORE FIELD xrce008 name="query.b.page1.xrce008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce008
            
            #add-point:AFTER FIELD xrce008 name="query.a.page1.xrce008"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.xrce008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce008
            #add-point:ON ACTION controlp INFIELD xrce008 name="query.c.page1.xrce008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD lc_xrce008
            #add-point:BEFORE FIELD lc_xrce008 name="query.b.page1.lc_xrce008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD lc_xrce008
            
            #add-point:AFTER FIELD lc_xrce008 name="query.a.page1.lc_xrce008"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.lc_xrce008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD lc_xrce008
            #add-point:ON ACTION controlp INFIELD lc_xrce008 name="query.c.page1.lc_xrce008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce015
            #add-point:BEFORE FIELD xrce015 name="query.b.page1.xrce015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce015
            
            #add-point:AFTER FIELD xrce015 name="query.a.page1.xrce015"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.xrce015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce015
            #add-point:ON ACTION controlp INFIELD xrce015 name="query.c.page1.xrce015"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.xrce100
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce100
            #add-point:ON ACTION controlp INFIELD xrce100 name="construct.c.page1.xrce100"
            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_aooi001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO xrce100  #顯示到畫面上

            NEXT FIELD xrce100                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce100
            #add-point:BEFORE FIELD xrce100 name="query.b.page1.xrce100"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce100
            
            #add-point:AFTER FIELD xrce100 name="query.a.page1.xrce100"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce101
            #add-point:BEFORE FIELD xrce101 name="query.b.page1.xrce101"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce101
            
            #add-point:AFTER FIELD xrce101 name="query.a.page1.xrce101"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.xrce101
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce101
            #add-point:ON ACTION controlp INFIELD xrce101 name="query.c.page1.xrce101"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce103
            #add-point:BEFORE FIELD xrce103 name="query.b.page1.xrce103"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce103
            
            #add-point:AFTER FIELD xrce103 name="query.a.page1.xrce103"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.xrce103
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce103
            #add-point:ON ACTION controlp INFIELD xrce103 name="query.c.page1.xrce103"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce104
            #add-point:BEFORE FIELD xrce104 name="query.b.page1.xrce104"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce104
            
            #add-point:AFTER FIELD xrce104 name="query.a.page1.xrce104"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.xrce104
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce104
            #add-point:ON ACTION controlp INFIELD xrce104 name="query.c.page1.xrce104"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce109
            #add-point:BEFORE FIELD xrce109 name="query.b.page1.xrce109"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce109
            
            #add-point:AFTER FIELD xrce109 name="query.a.page1.xrce109"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.xrce109
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce109
            #add-point:ON ACTION controlp INFIELD xrce109 name="query.c.page1.xrce109"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce113
            #add-point:BEFORE FIELD xrce113 name="query.b.page1.xrce113"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce113
            
            #add-point:AFTER FIELD xrce113 name="query.a.page1.xrce113"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.xrce113
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce113
            #add-point:ON ACTION controlp INFIELD xrce113 name="query.c.page1.xrce113"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce114
            #add-point:BEFORE FIELD xrce114 name="query.b.page1.xrce114"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce114
            
            #add-point:AFTER FIELD xrce114 name="query.a.page1.xrce114"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.xrce114
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce114
            #add-point:ON ACTION controlp INFIELD xrce114 name="query.c.page1.xrce114"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce119
            #add-point:BEFORE FIELD xrce119 name="query.b.page1.xrce119"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce119
            
            #add-point:AFTER FIELD xrce119 name="query.a.page1.xrce119"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.xrce119
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce119
            #add-point:ON ACTION controlp INFIELD xrce119 name="query.c.page1.xrce119"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce027
            #add-point:BEFORE FIELD xrce027 name="query.b.page1.xrce027"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce027
            
            #add-point:AFTER FIELD xrce027 name="query.a.page1.xrce027"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.xrce027
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce027
            #add-point:ON ACTION controlp INFIELD xrce027 name="query.c.page1.xrce027"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce028
            #add-point:BEFORE FIELD xrce028 name="query.b.page1.xrce028"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce028
            
            #add-point:AFTER FIELD xrce028 name="query.a.page1.xrce028"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.xrce028
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce028
            #add-point:ON ACTION controlp INFIELD xrce028 name="query.c.page1.xrce028"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcecomp
            #add-point:BEFORE FIELD xrcecomp name="query.b.page1.xrcecomp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcecomp
            
            #add-point:AFTER FIELD xrcecomp name="query.a.page1.xrcecomp"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.xrcecomp
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcecomp
            #add-point:ON ACTION controlp INFIELD xrcecomp name="query.c.page1.xrcecomp"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrceorga
            #add-point:BEFORE FIELD xrceorga name="query.b.page1.xrceorga"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrceorga
            
            #add-point:AFTER FIELD xrceorga name="query.a.page1.xrceorga"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.xrceorga
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrceorga
            #add-point:ON ACTION controlp INFIELD xrceorga name="query.c.page1.xrceorga"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.xrce010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce010
            #add-point:ON ACTION controlp INFIELD xrce010 name="construct.c.page1.xrce010"
            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_oocq002_2()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO xrce010  #顯示到畫面上

            NEXT FIELD xrce010                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce010
            #add-point:BEFORE FIELD xrce010 name="query.b.page1.xrce010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce010
            
            #add-point:AFTER FIELD xrce010 name="query.a.page1.xrce010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.xrce016
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce016
            #add-point:ON ACTION controlp INFIELD xrce016 name="construct.c.page1.xrce016"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL aglt310_04()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO xrce016  #顯示到畫面上
            NEXT FIELD xrce016                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce016
            #add-point:BEFORE FIELD xrce016 name="query.b.page1.xrce016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce016
            
            #add-point:AFTER FIELD xrce016 name="query.a.page1.xrce016"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce016_desc_1
            #add-point:BEFORE FIELD xrce016_desc_1 name="query.b.page1.xrce016_desc_1"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce016_desc_1
            
            #add-point:AFTER FIELD xrce016_desc_1 name="query.a.page1.xrce016_desc_1"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.xrce016_desc_1
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce016_desc_1
            #add-point:ON ACTION controlp INFIELD xrce016_desc_1 name="query.c.page1.xrce016_desc_1"
            
            #END add-point
 
 
  
         
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce001_t
            #add-point:BEFORE FIELD xrce001_t name="query.b.page2.xrce001_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce001_t
            
            #add-point:AFTER FIELD xrce001_t name="query.a.page2.xrce001_t"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page2.xrce001_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce001_t
            #add-point:ON ACTION controlp INFIELD xrce001_t name="query.c.page2.xrce001_t"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcedocno_t
            #add-point:BEFORE FIELD xrcedocno_t name="query.b.page2.xrcedocno_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcedocno_t
            
            #add-point:AFTER FIELD xrcedocno_t name="query.a.page2.xrcedocno_t"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page2.xrcedocno_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcedocno_t
            #add-point:ON ACTION controlp INFIELD xrcedocno_t name="query.c.page2.xrcedocno_t"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrceld_t
            #add-point:BEFORE FIELD xrceld_t name="query.b.page2.xrceld_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrceld_t
            
            #add-point:AFTER FIELD xrceld_t name="query.a.page2.xrceld_t"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page2.xrceld_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrceld_t
            #add-point:ON ACTION controlp INFIELD xrceld_t name="query.c.page2.xrceld_t"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcesite_t
            #add-point:BEFORE FIELD xrcesite_t name="query.b.page2.xrcesite_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcesite_t
            
            #add-point:AFTER FIELD xrcesite_t name="query.a.page2.xrcesite_t"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page2.xrcesite_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcesite_t
            #add-point:ON ACTION controlp INFIELD xrcesite_t name="query.c.page2.xrcesite_t"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrceseq_t
            #add-point:BEFORE FIELD xrceseq_t name="query.b.page2.xrceseq_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrceseq_t
            
            #add-point:AFTER FIELD xrceseq_t name="query.a.page2.xrceseq_t"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page2.xrceseq_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrceseq_t
            #add-point:ON ACTION controlp INFIELD xrceseq_t name="query.c.page2.xrceseq_t"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce002_t
            #add-point:BEFORE FIELD xrce002_t name="query.b.page2.xrce002_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce002_t
            
            #add-point:AFTER FIELD xrce002_t name="query.a.page2.xrce002_t"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page2.xrce002_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce002_t
            #add-point:ON ACTION controlp INFIELD xrce002_t name="query.c.page2.xrce002_t"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce003_t
            #add-point:BEFORE FIELD xrce003_t name="query.b.page2.xrce003_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce003_t
            
            #add-point:AFTER FIELD xrce003_t name="query.a.page2.xrce003_t"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page2.xrce003_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce003_t
            #add-point:ON ACTION controlp INFIELD xrce003_t name="query.c.page2.xrce003_t"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce004_t
            #add-point:BEFORE FIELD xrce004_t name="query.b.page2.xrce004_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce004_t
            
            #add-point:AFTER FIELD xrce004_t name="query.a.page2.xrce004_t"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page2.xrce004_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce004_t
            #add-point:ON ACTION controlp INFIELD xrce004_t name="query.c.page2.xrce004_t"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce008_t
            #add-point:BEFORE FIELD xrce008_t name="query.b.page2.xrce008_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce008_t
            
            #add-point:AFTER FIELD xrce008_t name="query.a.page2.xrce008_t"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page2.xrce008_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce008_t
            #add-point:ON ACTION controlp INFIELD xrce008_t name="query.c.page2.xrce008_t"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce100_t
            #add-point:BEFORE FIELD xrce100_t name="query.b.page2.xrce100_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce100_t
            
            #add-point:AFTER FIELD xrce100_t name="query.a.page2.xrce100_t"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page2.xrce100_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce100_t
            #add-point:ON ACTION controlp INFIELD xrce100_t name="query.c.page2.xrce100_t"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce103_t
            #add-point:BEFORE FIELD xrce103_t name="query.b.page2.xrce103_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce103_t
            
            #add-point:AFTER FIELD xrce103_t name="query.a.page2.xrce103_t"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page2.xrce103_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce103_t
            #add-point:ON ACTION controlp INFIELD xrce103_t name="query.c.page2.xrce103_t"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce104_t
            #add-point:BEFORE FIELD xrce104_t name="query.b.page2.xrce104_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce104_t
            
            #add-point:AFTER FIELD xrce104_t name="query.a.page2.xrce104_t"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page2.xrce104_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce104_t
            #add-point:ON ACTION controlp INFIELD xrce104_t name="query.c.page2.xrce104_t"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce109_t
            #add-point:BEFORE FIELD xrce109_t name="query.b.page2.xrce109_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce109_t
            
            #add-point:AFTER FIELD xrce109_t name="query.a.page2.xrce109_t"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page2.xrce109_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce109_t
            #add-point:ON ACTION controlp INFIELD xrce109_t name="query.c.page2.xrce109_t"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce101_t
            #add-point:BEFORE FIELD xrce101_t name="query.b.page2.xrce101_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce101_t
            
            #add-point:AFTER FIELD xrce101_t name="query.a.page2.xrce101_t"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page2.xrce101_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce101_t
            #add-point:ON ACTION controlp INFIELD xrce101_t name="query.c.page2.xrce101_t"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce113_t
            #add-point:BEFORE FIELD xrce113_t name="query.b.page2.xrce113_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce113_t
            
            #add-point:AFTER FIELD xrce113_t name="query.a.page2.xrce113_t"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page2.xrce113_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce113_t
            #add-point:ON ACTION controlp INFIELD xrce113_t name="query.c.page2.xrce113_t"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce114_t
            #add-point:BEFORE FIELD xrce114_t name="query.b.page2.xrce114_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce114_t
            
            #add-point:AFTER FIELD xrce114_t name="query.a.page2.xrce114_t"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page2.xrce114_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce114_t
            #add-point:ON ACTION controlp INFIELD xrce114_t name="query.c.page2.xrce114_t"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce119_t
            #add-point:BEFORE FIELD xrce119_t name="query.b.page2.xrce119_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce119_t
            
            #add-point:AFTER FIELD xrce119_t name="query.a.page2.xrce119_t"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page2.xrce119_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce119_t
            #add-point:ON ACTION controlp INFIELD xrce119_t name="query.c.page2.xrce119_t"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce120
            #add-point:BEFORE FIELD xrce120 name="query.b.page2.xrce120"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce120
            
            #add-point:AFTER FIELD xrce120 name="query.a.page2.xrce120"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page2.xrce120
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce120
            #add-point:ON ACTION controlp INFIELD xrce120 name="query.c.page2.xrce120"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce121
            #add-point:BEFORE FIELD xrce121 name="query.b.page2.xrce121"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce121
            
            #add-point:AFTER FIELD xrce121 name="query.a.page2.xrce121"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page2.xrce121
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce121
            #add-point:ON ACTION controlp INFIELD xrce121 name="query.c.page2.xrce121"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce123
            #add-point:BEFORE FIELD xrce123 name="query.b.page2.xrce123"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce123
            
            #add-point:AFTER FIELD xrce123 name="query.a.page2.xrce123"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page2.xrce123
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce123
            #add-point:ON ACTION controlp INFIELD xrce123 name="query.c.page2.xrce123"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce124
            #add-point:BEFORE FIELD xrce124 name="query.b.page2.xrce124"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce124
            
            #add-point:AFTER FIELD xrce124 name="query.a.page2.xrce124"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page2.xrce124
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce124
            #add-point:ON ACTION controlp INFIELD xrce124 name="query.c.page2.xrce124"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce129
            #add-point:BEFORE FIELD xrce129 name="query.b.page2.xrce129"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce129
            
            #add-point:AFTER FIELD xrce129 name="query.a.page2.xrce129"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page2.xrce129
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce129
            #add-point:ON ACTION controlp INFIELD xrce129 name="query.c.page2.xrce129"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce130
            #add-point:BEFORE FIELD xrce130 name="query.b.page2.xrce130"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce130
            
            #add-point:AFTER FIELD xrce130 name="query.a.page2.xrce130"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page2.xrce130
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce130
            #add-point:ON ACTION controlp INFIELD xrce130 name="query.c.page2.xrce130"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce131
            #add-point:BEFORE FIELD xrce131 name="query.b.page2.xrce131"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce131
            
            #add-point:AFTER FIELD xrce131 name="query.a.page2.xrce131"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page2.xrce131
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce131
            #add-point:ON ACTION controlp INFIELD xrce131 name="query.c.page2.xrce131"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce133
            #add-point:BEFORE FIELD xrce133 name="query.b.page2.xrce133"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce133
            
            #add-point:AFTER FIELD xrce133 name="query.a.page2.xrce133"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page2.xrce133
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce133
            #add-point:ON ACTION controlp INFIELD xrce133 name="query.c.page2.xrce133"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce134
            #add-point:BEFORE FIELD xrce134 name="query.b.page2.xrce134"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce134
            
            #add-point:AFTER FIELD xrce134 name="query.a.page2.xrce134"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page2.xrce134
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce134
            #add-point:ON ACTION controlp INFIELD xrce134 name="query.c.page2.xrce134"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce139
            #add-point:BEFORE FIELD xrce139 name="query.b.page2.xrce139"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce139
            
            #add-point:AFTER FIELD xrce139 name="query.a.page2.xrce139"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page2.xrce139
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce139
            #add-point:ON ACTION controlp INFIELD xrce139 name="query.c.page2.xrce139"
            
            #END add-point
 
 
  
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce001_u
            #add-point:BEFORE FIELD xrce001_u name="query.b.page3.xrce001_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce001_u
            
            #add-point:AFTER FIELD xrce001_u name="query.a.page3.xrce001_u"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce001_u
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce001_u
            #add-point:ON ACTION controlp INFIELD xrce001_u name="query.c.page3.xrce001_u"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcedocno_u
            #add-point:BEFORE FIELD xrcedocno_u name="query.b.page3.xrcedocno_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcedocno_u
            
            #add-point:AFTER FIELD xrcedocno_u name="query.a.page3.xrcedocno_u"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrcedocno_u
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcedocno_u
            #add-point:ON ACTION controlp INFIELD xrcedocno_u name="query.c.page3.xrcedocno_u"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrceld_u
            #add-point:BEFORE FIELD xrceld_u name="query.b.page3.xrceld_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrceld_u
            
            #add-point:AFTER FIELD xrceld_u name="query.a.page3.xrceld_u"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrceld_u
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrceld_u
            #add-point:ON ACTION controlp INFIELD xrceld_u name="query.c.page3.xrceld_u"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcesite_u
            #add-point:BEFORE FIELD xrcesite_u name="query.b.page3.xrcesite_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcesite_u
            
            #add-point:AFTER FIELD xrcesite_u name="query.a.page3.xrcesite_u"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrcesite_u
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcesite_u
            #add-point:ON ACTION controlp INFIELD xrcesite_u name="query.c.page3.xrcesite_u"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrceseq_u
            #add-point:BEFORE FIELD xrceseq_u name="query.b.page3.xrceseq_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrceseq_u
            
            #add-point:AFTER FIELD xrceseq_u name="query.a.page3.xrceseq_u"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrceseq_u
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrceseq_u
            #add-point:ON ACTION controlp INFIELD xrceseq_u name="query.c.page3.xrceseq_u"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce002_u
            #add-point:BEFORE FIELD xrce002_u name="query.b.page3.xrce002_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce002_u
            
            #add-point:AFTER FIELD xrce002_u name="query.a.page3.xrce002_u"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce002_u
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce002_u
            #add-point:ON ACTION controlp INFIELD xrce002_u name="query.c.page3.xrce002_u"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce003_u
            #add-point:BEFORE FIELD xrce003_u name="query.b.page3.xrce003_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce003_u
            
            #add-point:AFTER FIELD xrce003_u name="query.a.page3.xrce003_u"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce003_u
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce003_u
            #add-point:ON ACTION controlp INFIELD xrce003_u name="query.c.page3.xrce003_u"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce004_u
            #add-point:BEFORE FIELD xrce004_u name="query.b.page3.xrce004_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce004_u
            
            #add-point:AFTER FIELD xrce004_u name="query.a.page3.xrce004_u"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce004_u
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce004_u
            #add-point:ON ACTION controlp INFIELD xrce004_u name="query.c.page3.xrce004_u"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce005_u
            #add-point:BEFORE FIELD xrce005_u name="query.b.page3.xrce005_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce005_u
            
            #add-point:AFTER FIELD xrce005_u name="query.a.page3.xrce005_u"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce005_u
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce005_u
            #add-point:ON ACTION controlp INFIELD xrce005_u name="query.c.page3.xrce005_u"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce008_u
            #add-point:BEFORE FIELD xrce008_u name="query.b.page3.xrce008_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce008_u
            
            #add-point:AFTER FIELD xrce008_u name="query.a.page3.xrce008_u"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce008_u
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce008_u
            #add-point:ON ACTION controlp INFIELD xrce008_u name="query.c.page3.xrce008_u"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce100_u
            #add-point:BEFORE FIELD xrce100_u name="query.b.page3.xrce100_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce100_u
            
            #add-point:AFTER FIELD xrce100_u name="query.a.page3.xrce100_u"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce100_u
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce100_u
            #add-point:ON ACTION controlp INFIELD xrce100_u name="query.c.page3.xrce100_u"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce109_u
            #add-point:BEFORE FIELD xrce109_u name="query.b.page3.xrce109_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce109_u
            
            #add-point:AFTER FIELD xrce109_u name="query.a.page3.xrce109_u"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce109_u
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce109_u
            #add-point:ON ACTION controlp INFIELD xrce109_u name="query.c.page3.xrce109_u"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce101_u
            #add-point:BEFORE FIELD xrce101_u name="query.b.page3.xrce101_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce101_u
            
            #add-point:AFTER FIELD xrce101_u name="query.a.page3.xrce101_u"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce101_u
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce101_u
            #add-point:ON ACTION controlp INFIELD xrce101_u name="query.c.page3.xrce101_u"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce119_u
            #add-point:BEFORE FIELD xrce119_u name="query.b.page3.xrce119_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce119_u
            
            #add-point:AFTER FIELD xrce119_u name="query.a.page3.xrce119_u"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce119_u
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce119_u
            #add-point:ON ACTION controlp INFIELD xrce119_u name="query.c.page3.xrce119_u"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce027_u
            #add-point:BEFORE FIELD xrce027_u name="query.b.page3.xrce027_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce027_u
            
            #add-point:AFTER FIELD xrce027_u name="query.a.page3.xrce027_u"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce027_u
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce027_u
            #add-point:ON ACTION controlp INFIELD xrce027_u name="query.c.page3.xrce027_u"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page3.xrce010_u
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce010_u
            #add-point:ON ACTION controlp INFIELD xrce010_u name="construct.c.page3.xrce010_u"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_oocq002_2()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO xrce010_u  #顯示到畫面上
            NEXT FIELD xrce010_u                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce010_u
            #add-point:BEFORE FIELD xrce010_u name="query.b.page3.xrce010_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce010_u
            
            #add-point:AFTER FIELD xrce010_u name="query.a.page3.xrce010_u"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.xrce016_u
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce016_u
            #add-point:ON ACTION controlp INFIELD xrce016_u name="construct.c.page3.xrce016_u"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL aglt310_04()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO xrce016_u  #顯示到畫面上
            NEXT FIELD xrce016_u                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce016_u
            #add-point:BEFORE FIELD xrce016_u name="query.b.page3.xrce016_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce016_u
            
            #add-point:AFTER FIELD xrce016_u name="query.a.page3.xrce016_u"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce016_u_desc
            #add-point:BEFORE FIELD xrce016_u_desc name="query.b.page3.xrce016_u_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce016_u_desc
            
            #add-point:AFTER FIELD xrce016_u_desc name="query.a.page3.xrce016_u_desc"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce016_u_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce016_u_desc
            #add-point:ON ACTION controlp INFIELD xrce016_u_desc name="query.c.page3.xrce016_u_desc"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page3.xrce017
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce017
            #add-point:ON ACTION controlp INFIELD xrce017 name="construct.c.page3.xrce017"
            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO xrce017  #顯示到畫面上

            NEXT FIELD xrce017                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce017
            #add-point:BEFORE FIELD xrce017 name="query.b.page3.xrce017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce017
            
            #add-point:AFTER FIELD xrce017 name="query.a.page3.xrce017"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.xrce018_u
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce018_u
            #add-point:ON ACTION controlp INFIELD xrce018_u name="construct.c.page3.xrce018_u"
            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
			LET g_qryparam.arg1  = g_xrca_t.xrcadocdt #160331-00012#1 add 
#            CALL q_ooef001_13()  #160331-00012#1 mark                           #呼叫開窗 
             #CALL q_ooeg001_4()   #160331-00012#1 add    #170814-00012#42 170915 mark by 10043 
             CALL q_ooeg001()                             #170814-00012#42 170915  add by 10043
            DISPLAY g_qryparam.return1 TO xrce018_u  #顯示到畫面上

            NEXT FIELD xrce018_u                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce018_u
            #add-point:BEFORE FIELD xrce018_u name="query.b.page3.xrce018_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce018_u
            
            #add-point:AFTER FIELD xrce018_u name="query.a.page3.xrce018_u"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.xrce019
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce019
            #add-point:ON ACTION controlp INFIELD xrce019 name="construct.c.page3.xrce019"
            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " ooeg003 IN ('1','2','3') "     #161026-00013#2 add
            #CALL q_ooeg001_4()                             #呼叫開窗 #161026-00013#2 add    #170814-00012#42 170915 mark by 10043 
            CALL q_ooeg001()                                                                #170814-00012#42 170915  add by 10043
            #CALL q_ooef001_13()                           #呼叫開窗 #161026-00013#2 mark
            DISPLAY g_qryparam.return1 TO xrce019  #顯示到畫面上

            NEXT FIELD xrce019                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce019
            #add-point:BEFORE FIELD xrce019 name="query.b.page3.xrce019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce019
            
            #add-point:AFTER FIELD xrce019 name="query.a.page3.xrce019"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page3.xrce020
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce020
            #add-point:ON ACTION controlp INFIELD xrce020 name="construct.c.page3.xrce020"
            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_oocq002_5()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO xrce020  #顯示到畫面上

            NEXT FIELD xrce020                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce020
            #add-point:BEFORE FIELD xrce020 name="query.b.page3.xrce020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce020
            
            #add-point:AFTER FIELD xrce020 name="query.a.page3.xrce020"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce022
            #add-point:BEFORE FIELD xrce022 name="query.b.page3.xrce022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce022
            
            #add-point:AFTER FIELD xrce022 name="query.a.page3.xrce022"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce022
            #add-point:ON ACTION controlp INFIELD xrce022 name="query.c.page3.xrce022"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce023
            #add-point:BEFORE FIELD xrce023 name="query.b.page3.xrce023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce023
            
            #add-point:AFTER FIELD xrce023 name="query.a.page3.xrce023"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce023
            #add-point:ON ACTION controlp INFIELD xrce023 name="query.c.page3.xrce023"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce040
            #add-point:BEFORE FIELD xrce040 name="query.b.page3.xrce040"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce040
            
            #add-point:AFTER FIELD xrce040 name="query.a.page3.xrce040"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce040
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce040
            #add-point:ON ACTION controlp INFIELD xrce040 name="query.c.page3.xrce040"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce035
            #add-point:BEFORE FIELD xrce035 name="query.b.page3.xrce035"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce035
            
            #add-point:AFTER FIELD xrce035 name="query.a.page3.xrce035"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce035
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce035
            #add-point:ON ACTION controlp INFIELD xrce035 name="query.c.page3.xrce035"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce035_desc
            #add-point:BEFORE FIELD xrce035_desc name="query.b.page3.xrce035_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce035_desc
            
            #add-point:AFTER FIELD xrce035_desc name="query.a.page3.xrce035_desc"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce035_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce035_desc
            #add-point:ON ACTION controlp INFIELD xrce035_desc name="query.c.page3.xrce035_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce036
            #add-point:BEFORE FIELD xrce036 name="query.b.page3.xrce036"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce036
            
            #add-point:AFTER FIELD xrce036 name="query.a.page3.xrce036"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce036
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce036
            #add-point:ON ACTION controlp INFIELD xrce036 name="query.c.page3.xrce036"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce036_desc
            #add-point:BEFORE FIELD xrce036_desc name="query.b.page3.xrce036_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce036_desc
            
            #add-point:AFTER FIELD xrce036_desc name="query.a.page3.xrce036_desc"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce036_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce036_desc
            #add-point:ON ACTION controlp INFIELD xrce036_desc name="query.c.page3.xrce036_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce038
            #add-point:BEFORE FIELD xrce038 name="query.b.page3.xrce038"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce038
            
            #add-point:AFTER FIELD xrce038 name="query.a.page3.xrce038"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce038
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce038
            #add-point:ON ACTION controlp INFIELD xrce038 name="query.c.page3.xrce038"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce039
            #add-point:BEFORE FIELD xrce039 name="query.b.page3.xrce039"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce039
            
            #add-point:AFTER FIELD xrce039 name="query.a.page3.xrce039"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce039
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce039
            #add-point:ON ACTION controlp INFIELD xrce039 name="query.c.page3.xrce039"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce041
            #add-point:BEFORE FIELD xrce041 name="query.b.page3.xrce041"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce041
            
            #add-point:AFTER FIELD xrce041 name="query.a.page3.xrce041"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce041
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce041
            #add-point:ON ACTION controlp INFIELD xrce041 name="query.c.page3.xrce041"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce041_desc
            #add-point:BEFORE FIELD xrce041_desc name="query.b.page3.xrce041_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce041_desc
            
            #add-point:AFTER FIELD xrce041_desc name="query.a.page3.xrce041_desc"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce041_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce041_desc
            #add-point:ON ACTION controlp INFIELD xrce041_desc name="query.c.page3.xrce041_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce042
            #add-point:BEFORE FIELD xrce042 name="query.b.page3.xrce042"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce042
            
            #add-point:AFTER FIELD xrce042 name="query.a.page3.xrce042"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce042
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce042
            #add-point:ON ACTION controlp INFIELD xrce042 name="query.c.page3.xrce042"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce042_desc
            #add-point:BEFORE FIELD xrce042_desc name="query.b.page3.xrce042_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce042_desc
            
            #add-point:AFTER FIELD xrce042_desc name="query.a.page3.xrce042_desc"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce042_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce042_desc
            #add-point:ON ACTION controlp INFIELD xrce042_desc name="query.c.page3.xrce042_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce043
            #add-point:BEFORE FIELD xrce043 name="query.b.page3.xrce043"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce043
            
            #add-point:AFTER FIELD xrce043 name="query.a.page3.xrce043"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce043
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce043
            #add-point:ON ACTION controlp INFIELD xrce043 name="query.c.page3.xrce043"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce043_desc
            #add-point:BEFORE FIELD xrce043_desc name="query.b.page3.xrce043_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce043_desc
            
            #add-point:AFTER FIELD xrce043_desc name="query.a.page3.xrce043_desc"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce043_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce043_desc
            #add-point:ON ACTION controlp INFIELD xrce043_desc name="query.c.page3.xrce043_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce044
            #add-point:BEFORE FIELD xrce044 name="query.b.page3.xrce044"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce044
            
            #add-point:AFTER FIELD xrce044 name="query.a.page3.xrce044"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce044
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce044
            #add-point:ON ACTION controlp INFIELD xrce044 name="query.c.page3.xrce044"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce044_desc
            #add-point:BEFORE FIELD xrce044_desc name="query.b.page3.xrce044_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce044_desc
            
            #add-point:AFTER FIELD xrce044_desc name="query.a.page3.xrce044_desc"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce044_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce044_desc
            #add-point:ON ACTION controlp INFIELD xrce044_desc name="query.c.page3.xrce044_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce045
            #add-point:BEFORE FIELD xrce045 name="query.b.page3.xrce045"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce045
            
            #add-point:AFTER FIELD xrce045 name="query.a.page3.xrce045"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce045
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce045
            #add-point:ON ACTION controlp INFIELD xrce045 name="query.c.page3.xrce045"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce045_desc
            #add-point:BEFORE FIELD xrce045_desc name="query.b.page3.xrce045_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce045_desc
            
            #add-point:AFTER FIELD xrce045_desc name="query.a.page3.xrce045_desc"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce045_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce045_desc
            #add-point:ON ACTION controlp INFIELD xrce045_desc name="query.c.page3.xrce045_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce046
            #add-point:BEFORE FIELD xrce046 name="query.b.page3.xrce046"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce046
            
            #add-point:AFTER FIELD xrce046 name="query.a.page3.xrce046"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce046
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce046
            #add-point:ON ACTION controlp INFIELD xrce046 name="query.c.page3.xrce046"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce046_desc
            #add-point:BEFORE FIELD xrce046_desc name="query.b.page3.xrce046_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce046_desc
            
            #add-point:AFTER FIELD xrce046_desc name="query.a.page3.xrce046_desc"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce046_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce046_desc
            #add-point:ON ACTION controlp INFIELD xrce046_desc name="query.c.page3.xrce046_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce047
            #add-point:BEFORE FIELD xrce047 name="query.b.page3.xrce047"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce047
            
            #add-point:AFTER FIELD xrce047 name="query.a.page3.xrce047"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce047
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce047
            #add-point:ON ACTION controlp INFIELD xrce047 name="query.c.page3.xrce047"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce047_desc
            #add-point:BEFORE FIELD xrce047_desc name="query.b.page3.xrce047_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce047_desc
            
            #add-point:AFTER FIELD xrce047_desc name="query.a.page3.xrce047_desc"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce047_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce047_desc
            #add-point:ON ACTION controlp INFIELD xrce047_desc name="query.c.page3.xrce047_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce048
            #add-point:BEFORE FIELD xrce048 name="query.b.page3.xrce048"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce048
            
            #add-point:AFTER FIELD xrce048 name="query.a.page3.xrce048"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce048
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce048
            #add-point:ON ACTION controlp INFIELD xrce048 name="query.c.page3.xrce048"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce048_desc
            #add-point:BEFORE FIELD xrce048_desc name="query.b.page3.xrce048_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce048_desc
            
            #add-point:AFTER FIELD xrce048_desc name="query.a.page3.xrce048_desc"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce048_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce048_desc
            #add-point:ON ACTION controlp INFIELD xrce048_desc name="query.c.page3.xrce048_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce049
            #add-point:BEFORE FIELD xrce049 name="query.b.page3.xrce049"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce049
            
            #add-point:AFTER FIELD xrce049 name="query.a.page3.xrce049"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce049
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce049
            #add-point:ON ACTION controlp INFIELD xrce049 name="query.c.page3.xrce049"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce049_desc
            #add-point:BEFORE FIELD xrce049_desc name="query.b.page3.xrce049_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce049_desc
            
            #add-point:AFTER FIELD xrce049_desc name="query.a.page3.xrce049_desc"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce049_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce049_desc
            #add-point:ON ACTION controlp INFIELD xrce049_desc name="query.c.page3.xrce049_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce050
            #add-point:BEFORE FIELD xrce050 name="query.b.page3.xrce050"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce050
            
            #add-point:AFTER FIELD xrce050 name="query.a.page3.xrce050"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce050
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce050
            #add-point:ON ACTION controlp INFIELD xrce050 name="query.c.page3.xrce050"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce050_desc
            #add-point:BEFORE FIELD xrce050_desc name="query.b.page3.xrce050_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce050_desc
            
            #add-point:AFTER FIELD xrce050_desc name="query.a.page3.xrce050_desc"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce050_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce050_desc
            #add-point:ON ACTION controlp INFIELD xrce050_desc name="query.c.page3.xrce050_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce051
            #add-point:BEFORE FIELD xrce051 name="query.b.page3.xrce051"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce051
            
            #add-point:AFTER FIELD xrce051 name="query.a.page3.xrce051"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce051
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce051
            #add-point:ON ACTION controlp INFIELD xrce051 name="query.c.page3.xrce051"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce051_desc
            #add-point:BEFORE FIELD xrce051_desc name="query.b.page3.xrce051_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce051_desc
            
            #add-point:AFTER FIELD xrce051_desc name="query.a.page3.xrce051_desc"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page3.xrce051_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce051_desc
            #add-point:ON ACTION controlp INFIELD xrce051_desc name="query.c.page3.xrce051_desc"
            
            #END add-point
 
 
  
 
      
         BEFORE CONSTRUCT
            #add-point:cs段more_construct name="cs.before_construct"
            
            #end add-point 
      
      END CONSTRUCT
  
      #add-point:query段more_construct name="query.more_construct"
      
      #end add-point 
  
      BEFORE DIALOG 
         CALL cl_qbe_init()
         #add-point:query段before_dialog name="query.before_dialog"
         
         #end add-point 
      
      ON ACTION qbe_select
         LET ls_wc = ""
         CALL cl_qbe_list("c") RETURNING ls_wc
      
      ON ACTION qbe_save
         CALL cl_qbe_save()
      
      ON ACTION accept
         ACCEPT DIALOG
         
      ON ACTION cancel
         LET INT_FLAG = 1
      #  CANCEL DIALOG   #(ver:44) mark
         EXIT DIALOG   #(ver:44)
      
      #交談指令共用ACTION
      &include "common_action.4gl"
      CONTINUE DIALOG 
   END DIALOG
 
   #add-point:query段after_construct name="query.after_construct"
   
   #end add-point
 
   IF INT_FLAG THEN
      LET INT_FLAG = 0
      #還原
      #LET g_wc2 = ls_wc
      LET g_wc2 = " 1=2"
      RETURN
   ELSE
      LET g_error_show = 1
      LET g_detail_idx = 1
   END IF
    
   CALL axrt300_02_b_fill(g_wc2)
 
   IF g_detail_cnt = 0 AND NOT INT_FLAG THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = -100 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   END IF
   
   LET INT_FLAG = FALSE
   
END FUNCTION
 
{</section>}
 
{<section id="axrt300_02.insert" >}
#+ 資料新增
PRIVATE FUNCTION axrt300_02_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point
   #add-point:delete段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   
   #end add-point                
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #add-point:單身新增前 name="insert.b_insert"
   
   #end add-point
   
   LET g_insert = 'Y'
   CALL axrt300_02_modify()
            
   #add-point:單身新增後 name="insert.a_insert"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="axrt300_02.modify" >}
#+ 資料修改
PRIVATE FUNCTION axrt300_02_modify()
   #add-point:modify段define(客製用) name="modify.define_customerization"
   
   #end add-point
   DEFINE  l_cmd                  LIKE type_t.chr1
   DEFINE  l_ac_t                 LIKE type_t.num10               #未取消的ARRAY CNT 
   DEFINE  l_n                    LIKE type_t.num10               #檢查重複用  
   DEFINE  l_cnt                  LIKE type_t.num10               #檢查重複用  
   DEFINE  l_lock_sw              LIKE type_t.chr1                #單身鎖住否  
   DEFINE  l_allow_insert         LIKE type_t.num5                #可新增否 
   DEFINE  l_allow_delete         LIKE type_t.num5                #可刪除否  
   DEFINE  l_count                LIKE type_t.num10
   DEFINE  l_i                    LIKE type_t.num10
   DEFINE  ls_return              STRING
   DEFINE  l_var_keys             DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys           DYNAMIC ARRAY OF STRING
   DEFINE  l_vars                 DYNAMIC ARRAY OF STRING
   DEFINE  l_fields               DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak         DYNAMIC ARRAY OF STRING
   DEFINE  li_reproduce           LIKE type_t.num10
   DEFINE  li_reproduce_target    LIKE type_t.num10
   DEFINE  lb_reproduce           BOOLEAN
   DEFINE  l_insert               BOOLEAN
   #add-point:modify段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"
   DEFINE  l_flag          LIKE type_t.chr1
   DEFINE  l_ooab002       LIKE ooab_t.ooab002
   DEFINE  l_ooaistus      LIKE ooai_t.ooaistus
   DEFINE  l_xrcastus      LIKE xrca_t.xrcastus
   DEFINE  l_glacstus      LIKE glac_t.glacstus
   DEFINE  l_amt           LIKE xrce_t.xrce109
   DEFINE  l_glaa001       LIKE glaa_t.glaa001
   DEFINE  l_ooagstus      LIKE ooag_t.ooagstus
   DEFINE  l_xrca060       LIKE xrca_t.xrca060
   DEFINE  l_gzcb004       LIKE gzcb_t.gzcb004
   DEFINE  l_xrce109       LIKE xrce_t.xrce109
   DEFINE  l_xrce119       LIKE xrce_t.xrce119
   DEFINE  l_xrce003       LIKE xrce_t.xrce003
   DEFINE  l_xrce004       LIKE xrce_t.xrce004
   DEFINE  l_xrce005       LIKE xrce_t.xrce005
   DEFINE  l_xrde100       LIKE xrde_t.xrde100
   DEFINE  l_xrde011       LIKE xrde_t.xrde011
   DEFINE  l_success       LIKE type_t.num5
   DEFINE  l_glaa005       LIKE glaa_t.glaa005
   #151012-00014#1--add--str--lujh
   DEFINE  ls_js           STRING
   DEFINE  lc_param        RECORD
            apca004        LIKE apca_t.apca004
                           END RECORD
   DEFINE  l_desc          LIKE type_t.chr500
   #151012-00014#1--add--end--lujh
   DEFINE  l_glaa004       LIKE glaa_t.glaa004  #150916-00015#1 -add   
   DEFINE l_sfin2020    LIKE type_t.chr1   #151130-00015#3   Add
   DEFINE l_wc2         STRING             #151130-00015#3   Add
   #160628-00002#1--add--str--
   DEFINE r_xrce_w            RECORD
          xrce103             LIKE xrce_t.xrce103,
          xrce104             LIKE xrce_t.xrce104,
          xrce109             LIKE xrce_t.xrce109,
          xrce113             LIKE xrce_t.xrce113,
          xrce114             LIKE xrce_t.xrce114,
          xrce119             LIKE xrce_t.xrce119,
          xrce123             LIKE xrce_t.xrce123,
          xrce124             LIKE xrce_t.xrce124,
          xrce129             LIKE xrce_t.xrce129,
          xrce133             LIKE xrce_t.xrce133,
          xrce134             LIKE xrce_t.xrce134,
          xrce139             LIKE xrce_t.xrce139
          END RECORD
   DEFINE l_xrca011           LIKE xrca_t.xrca011
   DEFINE l_oodb005           LIKE oodb_t.oodb005
   DEFINE l_oodb006           LIKE oodb_t.oodb006
   DEFINE l_oodb011           LIKE oodb_t.oodb011
   DEFINE l_oodbl004          LIKE oodbl_t.oodbl004
   DEFINE l_ooeg003           LIKE ooeg_t.ooeg003      #161026-00013#2 add 
   #160628-00002#1--add--end
   #170621-00032#1-----s
   DEFINE l_glak_sql          STRING
   #170621-00032#1-----e
   DEFINE l_xrcadocdt         LIKE xrca_t.xrcadocdt #170531-00062#2 add
   DEFINE l_xrca100           LIKE xrca_t.xrca100   #170621-00044#2 add
   DEFINE l_item              DYNAMIC ARRAY OF VARCHAR(100) #170512-00045#2    
   DEFINE l_errno             LIKE type_t.chr10  #171016-00011#3 add
   #end add-point 
   
   #add-point:Function前置處理  name="modify.pre_function"
   
   #end add-point
   
#  LET g_action_choice = ""   #(ver:35) mark
   
   LET g_qryparam.state = "i"
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   
   #add-point:modify開始前 name="modify.define_sql"
   #IF g_prog = 'axrt350' THEN #170301-00023#10 mark    
   IF g_prog MATCHES 'axrt350*' THEN #170301-00023#10 add
      LET l_allow_insert = FALSE
      LET l_allow_delete = FALSE
   END IF
   #end add-point
   
   LET INT_FLAG = FALSE
   LET lb_reproduce = FALSE
   LET l_insert = FALSE
 
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
 
   #add-point:modify段修改前 name="modify.before_input"
   WHILE TRUE
      LET l_flag = 'N'
   #end add-point
 
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
      #Page1 預設值產生於此處
      INPUT ARRAY g_xrce_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_detail_cnt,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_xrce_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL axrt300_02_b_fill(g_wc2)
            LET g_detail_cnt = g_xrce_d.getLength()
         
         BEFORE ROW
            #add-point:modify段before row name="input.body.before_row2"
           #IF 1 = 0 THEN   #160420-00001#1 Mark
            #end add-point  
            #(ver:42) ---start---
            LET g_current_page = 1
            CALL axrt300_02_idx_chk()
            #(ver:42) --- end ---
            LET l_insert = FALSE
            LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
            LET l_cmd = ''
            LET l_ac_t = l_ac 
            LET l_ac = g_detail_idx
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
            DISPLAY g_xrce_d.getLength() TO FORMONLY.cnt
         
            CALL s_transaction_begin()
            LET g_detail_cnt = g_xrce_d.getLength()
            
            IF g_detail_cnt >= l_ac 
               AND g_xrce_d[l_ac].xrceld IS NOT NULL
               AND g_xrce_d[l_ac].xrcedocno IS NOT NULL
               AND g_xrce_d[l_ac].xrceseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_xrce_d_t.* = g_xrce_d[l_ac].*  #BACKUP
               LET g_xrce_d_o.* = g_xrce_d[l_ac].*  #BACKUP
               IF NOT axrt300_02_lock_b("xrce_t") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH axrt300_02_bcl INTO g_xrce_d[l_ac].xrce001,g_xrce_d[l_ac].xrcedocno,g_xrce_d[l_ac].xrceld, 
                      g_xrce_d[l_ac].xrcesite,g_xrce_d[l_ac].xrceseq,g_xrce_d[l_ac].xrce002,g_xrce_d[l_ac].xrce003, 
                      g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce005,g_xrce_d[l_ac].xrce024,g_xrce_d[l_ac].xrce025, 
                      g_xrce_d[l_ac].xrce008,g_xrce_d[l_ac].xrce015,g_xrce_d[l_ac].xrce100,g_xrce_d[l_ac].xrce101, 
                      g_xrce_d[l_ac].xrce103,g_xrce_d[l_ac].xrce104,g_xrce_d[l_ac].xrce109,g_xrce_d[l_ac].xrce113, 
                      g_xrce_d[l_ac].xrce114,g_xrce_d[l_ac].xrce119,g_xrce_d[l_ac].xrce027,g_xrce_d[l_ac].xrce028, 
                      g_xrce_d[l_ac].xrcecomp,g_xrce_d[l_ac].xrceorga,g_xrce_d[l_ac].xrce010,g_xrce_d[l_ac].xrce016, 
                      g_xrce2_d[l_ac].xrce001,g_xrce2_d[l_ac].xrcedocno,g_xrce2_d[l_ac].xrceld,g_xrce2_d[l_ac].xrcesite, 
                      g_xrce2_d[l_ac].xrceseq,g_xrce2_d[l_ac].xrce002,g_xrce2_d[l_ac].xrce003,g_xrce2_d[l_ac].xrce004, 
                      g_xrce2_d[l_ac].xrce008,g_xrce2_d[l_ac].xrce100,g_xrce2_d[l_ac].xrce103,g_xrce2_d[l_ac].xrce104, 
                      g_xrce2_d[l_ac].xrce109,g_xrce2_d[l_ac].xrce101,g_xrce2_d[l_ac].xrce113,g_xrce2_d[l_ac].xrce114, 
                      g_xrce2_d[l_ac].xrce119,g_xrce2_d[l_ac].xrce120,g_xrce2_d[l_ac].xrce121,g_xrce2_d[l_ac].xrce123, 
                      g_xrce2_d[l_ac].xrce124,g_xrce2_d[l_ac].xrce129,g_xrce2_d[l_ac].xrce130,g_xrce2_d[l_ac].xrce131, 
                      g_xrce2_d[l_ac].xrce133,g_xrce2_d[l_ac].xrce134,g_xrce2_d[l_ac].xrce139,g_xrce3_d[l_ac].xrce001, 
                      g_xrce3_d[l_ac].xrcedocno,g_xrce3_d[l_ac].xrceld,g_xrce3_d[l_ac].xrcesite,g_xrce3_d[l_ac].xrceseq, 
                      g_xrce3_d[l_ac].xrce002,g_xrce3_d[l_ac].xrce003,g_xrce3_d[l_ac].xrce004,g_xrce3_d[l_ac].xrce005, 
                      g_xrce3_d[l_ac].xrce008,g_xrce3_d[l_ac].xrce100,g_xrce3_d[l_ac].xrce109,g_xrce3_d[l_ac].xrce101, 
                      g_xrce3_d[l_ac].xrce119,g_xrce3_d[l_ac].xrce027,g_xrce3_d[l_ac].xrce010,g_xrce3_d[l_ac].xrce016, 
                      g_xrce3_d[l_ac].xrce017,g_xrce3_d[l_ac].xrce018,g_xrce3_d[l_ac].xrce019,g_xrce3_d[l_ac].xrce020, 
                      g_xrce3_d[l_ac].xrce022,g_xrce3_d[l_ac].xrce023,g_xrce3_d[l_ac].xrce040,g_xrce3_d[l_ac].xrce035, 
                      g_xrce3_d[l_ac].xrce036,g_xrce3_d[l_ac].xrce038,g_xrce3_d[l_ac].xrce039,g_xrce3_d[l_ac].xrce041, 
                      g_xrce3_d[l_ac].xrce042,g_xrce3_d[l_ac].xrce043,g_xrce3_d[l_ac].xrce044,g_xrce3_d[l_ac].xrce045, 
                      g_xrce3_d[l_ac].xrce046,g_xrce3_d[l_ac].xrce047,g_xrce3_d[l_ac].xrce048,g_xrce3_d[l_ac].xrce049, 
                      g_xrce3_d[l_ac].xrce050,g_xrce3_d[l_ac].xrce051
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_xrce_d_t.xrceld,":",SQLERRMESSAGE  
                     LET g_errparam.code = SQLCA.SQLCODE
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_xrce_d_mask_o[l_ac].* =  g_xrce_d[l_ac].*
                  CALL axrt300_02_xrce_t_mask()
                  LET g_xrce_d_mask_n[l_ac].* =  g_xrce_d[l_ac].*
                  
                  CALL axrt300_02_detail_show()
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            CALL axrt300_02_set_entry_b(l_cmd)
            CALL axrt300_02_set_no_entry_b(l_cmd)
            #add-point:modify段before row name="input.body.before_row"
           #160420-00001#1 Mark ---(S)---
           #ELSE
           #   LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
           #   LET l_cmd = ''
           #   LET l_ac = g_detail_idx
           #   LET l_lock_sw = 'N'            #DEFAULT
           #   LET l_n = ARR_COUNT()
           #   DISPLAY l_ac TO FORMONLY.idx
           #   DISPLAY g_xrce_d.getLength() TO FORMONLY.cnt
           #   
           #   CALL s_transaction_begin()
           #   LET g_detail_cnt = g_xrce_d.getLength()
           #   
           #   IF g_detail_cnt >= l_ac 
           #      AND g_xrce_d[l_ac].xrceld IS NOT NULL
           #      AND g_xrce_d[l_ac].xrcedocno IS NOT NULL
           #      AND g_xrce_d[l_ac].xrceseq IS NOT NULL
           #   
           #   THEN
           #      LET l_cmd='u'
           #      LET g_xrce_d_t.* = g_xrce_d[l_ac].*  #BACKUP
           #      LET g_xrce_d_o.* = g_xrce_d[l_ac].*  #BACKUP
           #      IF NOT axrt300_02_lock_b("xrce_t") THEN
           #         LET l_lock_sw='Y'
           #      ELSE
           #         SELECT gzcb004 INTO l_gzcb004
           #           FROM gzcb_t
           #          WHERE gzcb001 = '8306'
           #            AND gzcb002 = g_xrce_d[l_ac].xrce002
           #         IF l_gzcb004 = '2' THEN 
           #            FETCH axrt300_02_bcl INTO g_xrce_d[l_ac].xrce001,g_xrce_d[l_ac].xrcedocno,g_xrce_d[l_ac].xrceld, 
           #                g_xrce_d[l_ac].xrcesite,g_xrce_d[l_ac].xrceseq,g_xrce_d[l_ac].xrce002,g_xrce_d[l_ac].xrce006, 
           #                g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce005,g_xrce_d[l_ac].xrce024, 
           #                g_xrce_d[l_ac].xrce025,g_xrce_d[l_ac].xrce008,g_xrce_d[l_ac].xrce015,g_xrce_d[l_ac].xrce100, 
           #                g_xrce_d[l_ac].xrce101,g_xrce_d[l_ac].xrce109,g_xrce_d[l_ac].xrce119,g_xrce_d[l_ac].xrce027, 
           #                g_xrce_d[l_ac].xrce028,g_xrce_d[l_ac].xrce104,g_xrce_d[l_ac].xrce114,g_xrce_d[l_ac].xrce124, 
           #                g_xrce_d[l_ac].xrce134,g_xrce_d[l_ac].xrcecomp,g_xrce_d[l_ac].xrceorga,g_xrce_d[l_ac].xrce010, 
           #                g_xrce_d[l_ac].xrce016,g_xrce2_d[l_ac].xrce001,g_xrce2_d[l_ac].xrcedocno,g_xrce2_d[l_ac].xrceld, 
           #                g_xrce2_d[l_ac].xrcesite,g_xrce2_d[l_ac].xrceseq,g_xrce2_d[l_ac].xrce002,g_xrce2_d[l_ac].xrce006, 
           #                g_xrce2_d[l_ac].xrce003,g_xrce2_d[l_ac].xrce004,g_xrce2_d[l_ac].xrce008,g_xrce2_d[l_ac].xrce100, 
           #                g_xrce2_d[l_ac].xrce109,g_xrce2_d[l_ac].xrce101,g_xrce2_d[l_ac].xrce119,g_xrce2_d[l_ac].xrce120, 
           #                g_xrce2_d[l_ac].xrce121,g_xrce2_d[l_ac].xrce129,g_xrce2_d[l_ac].xrce130,g_xrce2_d[l_ac].xrce131, 
           #                g_xrce2_d[l_ac].xrce139,g_xrce3_d[l_ac].xrce001,g_xrce3_d[l_ac].xrcedocno,g_xrce3_d[l_ac].xrceld, 
           #                g_xrce3_d[l_ac].xrcesite,g_xrce3_d[l_ac].xrceseq,g_xrce3_d[l_ac].xrce002,g_xrce3_d[l_ac].xrce006, 
           #                g_xrce3_d[l_ac].xrce003,g_xrce3_d[l_ac].xrce004,g_xrce3_d[l_ac].xrce005,g_xrce3_d[l_ac].xrce008, 
           #                g_xrce3_d[l_ac].xrce100,g_xrce3_d[l_ac].xrce109,g_xrce3_d[l_ac].xrce101,g_xrce3_d[l_ac].xrce119, 
           #                g_xrce3_d[l_ac].xrce027,g_xrce3_d[l_ac].xrce010,g_xrce3_d[l_ac].xrce016,g_xrce3_d[l_ac].xrce017, 
           #                g_xrce3_d[l_ac].xrce018,g_xrce3_d[l_ac].xrce019,g_xrce3_d[l_ac].xrce020,g_xrce3_d[l_ac].xrce022, 
           #                g_xrce3_d[l_ac].xrce023
           #         ELSE
           #            FETCH axrt300_02_bcl1 INTO g_xrce_d[l_ac].xrce001,g_xrce_d[l_ac].xrcedocno,g_xrce_d[l_ac].xrceld,
           #                g_xrce_d[l_ac].xrcesite,g_xrce_d[l_ac].xrceseq,g_xrce_d[l_ac].xrce002,g_xrce_d[l_ac].xrce006,
           #                g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce008,g_xrce_d[l_ac].xrce100,
           #                g_xrce_d[l_ac].xrce109,g_xrce_d[l_ac].xrce101,g_xrce_d[l_ac].xrce119,
           #                g_xrce_d[l_ac].xrce015,g_xrce_d[l_ac].xrce028,g_xrce_d[l_ac].xrcecomp,
           #                g_xrce_d[l_ac].xrceorga,g_xrce_d[l_ac].xrce010,g_xrce_d[l_ac].xrce016,g_xrce_d[l_ac].xrde012,
           #                g_xrce2_d[l_ac].xrce001,g_xrce2_d[l_ac].xrcedocno,g_xrce2_d[l_ac].xrceld,
           #                g_xrce2_d[l_ac].xrcesite,g_xrce2_d[l_ac].xrceseq,g_xrce2_d[l_ac].xrce002,g_xrce2_d[l_ac].xrce006,
           #                g_xrce2_d[l_ac].xrce003,g_xrce2_d[l_ac].xrce004,g_xrce2_d[l_ac].xrce008,g_xrce2_d[l_ac].xrce100,
           #                g_xrce2_d[l_ac].xrce109,g_xrce2_d[l_ac].xrce101,g_xrce2_d[l_ac].xrce119,g_xrce2_d[l_ac].xrce120,
           #                g_xrce2_d[l_ac].xrce121,g_xrce2_d[l_ac].xrce129,g_xrce2_d[l_ac].xrce130,g_xrce2_d[l_ac].xrce131,
           #                g_xrce2_d[l_ac].xrce139,g_xrce3_d[l_ac].xrce001,g_xrce3_d[l_ac].xrcedocno,g_xrce3_d[l_ac].xrceld,
           #                g_xrce3_d[l_ac].xrcesite,g_xrce3_d[l_ac].xrceseq,g_xrce3_d[l_ac].xrce002,g_xrce3_d[l_ac].xrce006,
           #                g_xrce3_d[l_ac].xrce003,g_xrce3_d[l_ac].xrce004,g_xrce3_d[l_ac].xrce008,
           #                g_xrce3_d[l_ac].xrce100,g_xrce3_d[l_ac].xrce109,g_xrce3_d[l_ac].xrce101,g_xrce3_d[l_ac].xrce119,
           #                g_xrce3_d[l_ac].xrce010,g_xrce3_d[l_ac].xrce016,g_xrce3_d[l_ac].xrce017,
           #                g_xrce3_d[l_ac].xrce018,g_xrce3_d[l_ac].xrce019,g_xrce3_d[l_ac].xrce020,g_xrce3_d[l_ac].xrce022,
           #                g_xrce3_d[l_ac].xrce023
           #         END IF
           #         IF SQLCA.sqlcode THEN
           #            INITIALIZE g_errparam TO NULL 
           #            LET g_errparam.extend = g_xrce_d_t.xrceld 
           #            LET g_errparam.code   = SQLCA.sqlcode 
           #            LET g_errparam.popup  = TRUE 
           #            CALL cl_err()
           #   
           #            LET l_lock_sw = "Y"
           #         END IF
           #         
           #         CALL axrt300_02_detail_show()
           #         CALL cl_show_fld_cont()
           #      END IF
           #   ELSE
           #      LET l_cmd='a'
           #   END IF
           #END IF
           #LET g_xrce_t.xrceent = g_enterprise
           #LET g_xrce_t.xrcecomp = g_xrce_d[l_ac].xrcecomp
           #LET g_xrce_t.xrcedocno = g_xrca_t.xrcadocno
           #LET g_xrce_t.xrceseq = g_xrce_d[l_ac].xrceseq
           #LET g_xrce_t.xrceld = g_xrca_t.xrcald
           #LET g_xrce_t.xrcesite = g_xrce_d[l_ac].xrcesite
           #LET g_xrce_t.xrceorga = g_xrce_d[l_ac].xrceorga
           #LET g_xrce_t.xrce001 = g_xrce_d[l_ac].xrce001
           #LET g_xrce_t.xrce002 = g_xrce_d[l_ac].xrce002
           #LET g_xrce_t.xrce003 = g_xrce_d[l_ac].xrce003
           #LET g_xrce_t.xrce004 = g_xrce_d[l_ac].xrce004
           #LET g_xrce_t.xrce005 = g_xrce_d[l_ac].xrce005
           #LET g_xrce_t.xrce006 = g_xrce_d[l_ac].xrce006
           #LET g_xrce_t.xrce008 = g_xrce_d[l_ac].xrce008
           #LET g_xrce_t.xrce010 = g_xrce3_d[l_ac].xrce010
           #LET g_xrce_t.xrce015 = g_xrce_d[l_ac].xrce015
           #LET g_xrce_t.xrce016 = g_xrce3_d[l_ac].xrce016
           #LET g_xrce_t.xrce017 = g_xrce3_d[l_ac].xrce017
           #LET g_xrce_t.xrce018 = g_xrce3_d[l_ac].xrce018
           #LET g_xrce_t.xrce019 = g_xrce3_d[l_ac].xrce019
           #LET g_xrce_t.xrce020 = g_xrce3_d[l_ac].xrce020
           #LET g_xrce_t.xrce022 = g_xrce3_d[l_ac].xrce022
           #LET g_xrce_t.xrce023 = g_xrce3_d[l_ac].xrce023
           #LET g_xrce_t.xrce024 = g_xrce_d[l_ac].xrce024
           #LET g_xrce_t.xrce025 = g_xrce_d[l_ac].xrce025
           #LET g_xrce_t.xrce100 = g_xrce_d[l_ac].xrce100
           #LET g_xrce_t.xrce101 = g_xrce_d[l_ac].xrce101
           #LET g_xrce_t.xrce109 = g_xrce_d[l_ac].xrce109
           #LET g_xrce_t.xrce119 = g_xrce_d[l_ac].xrce119
           #LET g_xrce_t.xrce120 = g_xrce2_d[l_ac].xrce120
           #LET g_xrce_t.xrce121 = g_xrce2_d[l_ac].xrce121
           #LET g_xrce_t.xrce129 = g_xrce2_d[l_ac].xrce129
           #LET g_xrce_t.xrce130 = g_xrce2_d[l_ac].xrce130
           #LET g_xrce_t.xrce131 = g_xrce2_d[l_ac].xrce131
           #LET g_xrce_t.xrce139 = g_xrce2_d[l_ac].xrce139
           #LET g_xrce_t.xrce027 = g_xrce_d[l_ac].xrce027
           #
           #CALL axrt300_02_set_entry_b("a")
           #CALL axrt300_02_set_no_entry_b("a")
           #160420-00001#1 Mark ---(E)---
           
            #160628-00002#1--add--str--
            IF l_cmd = 'u' THEN
               IF g_xrce_d[l_ac].xrce027 = 'Y' THEN
                  #判断是否冲抵完，如果全冲销完，未税金额和税额不可修改
                  CALL s_axrt300_not_washed_amt(g_xrce_d[l_ac].xrceld,g_xrce_d[l_ac].xrcedocno,g_xrce_d[l_ac].xrceseq,g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce005)
                  RETURNING r_xrce_w.*
                  IF r_xrce_w.xrce109 = g_xrce_d[l_ac].xrce109 THEN
                     CALL cl_set_comp_entry("xrce103,xrce104,xrce113,xrce114,xrce123,xrce124,xrce133,xrce134",FALSE)
                  ELSE
                     CALL cl_set_comp_entry("xrce103,xrce104,xrce113,xrce114,xrce123,xrce124,xrce133,xrce134",TRUE)
                  END IF
               ELSE
                  CALL cl_set_comp_entry("xrce103,xrce104,xrce113,xrce114,xrce123,xrce124,xrce133,xrce134",FALSE)
               END IF
            END IF
            #160628-00002#1--add--end
            #161118-00026#1 Add  ---(S)---
            IF g_xrca_t.xrca001 = '17' THEN
               LET l_count = 0 
               SELECT COUNT(1) INTO l_count FROM isag_t WHERE isagent = g_enterprise
                  AND isagdocno = g_xrca_t.xrca018
                  AND isagcomp  = g_xrca_t.xrcacomp
                  AND isag002   = g_xrce_d[l_ac].xrce003
                  AND isag003   = g_xrce_d[l_ac].xrce004
               IF cl_null(l_count) THEN LET l_count = 0 END IF
               IF l_count > 0 THEN
                  CALL cl_set_comp_entry("xrce103,xrce104,xrce113,xrce114,xrce123,xrce124,xrce133,xrce134",FALSE)
                  CALL cl_set_comp_entry("xrce002,xrce003,xrce004,xrce005 ,xrce100,xrce101",FALSE)
               ELSE
                  CALL cl_set_comp_entry("xrce103,xrce104,xrce113,xrce114,xrce123,xrce124,xrce133,xrce134",TRUE)
                  CALL cl_set_comp_entry("xrce002,xrce003,xrce004,xrce005 ,xrce100,xrce101",TRUE)
               END IF
            END IF
            #161118-00026#1 Add  ---(E)---
            #end add-point  
            #其他table資料備份(確定是否更改用)
            
 
 
 
            #其他table進行lock
            
 
 
 
        
         BEFORE INSERT
            
            LET l_insert = TRUE
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            CALL axrt300_02_idx_chk()   #(ver:42)
            INITIALIZE g_xrce_d_t.* TO NULL
            INITIALIZE g_xrce_d_o.* TO NULL
            INITIALIZE g_xrce_d[l_ac].* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值(單身3)
                  LET g_xrce_d[l_ac].xrce103 = "0"
      LET g_xrce_d[l_ac].xrce113 = "0"
      LET g_xrce_d[l_ac].xrce027 = "N"
 
            #add-point:modify段before備份 name="input.body.before_bak"
            
            #end add-point
            LET g_xrce_d_t.* = g_xrce_d[l_ac].*     #新輸入資料
            LET g_xrce_d_o.* = g_xrce_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_xrce_d[li_reproduce_target].* = g_xrce_d[li_reproduce].*
               LET g_xrce2_d[li_reproduce_target].* = g_xrce2_d[li_reproduce].*
               LET g_xrce3_d[li_reproduce_target].* = g_xrce3_d[li_reproduce].*
 
               LET g_xrce_d[g_xrce_d.getLength()].xrceld = NULL
               LET g_xrce_d[g_xrce_d.getLength()].xrcedocno = NULL
               LET g_xrce_d[g_xrce_d.getLength()].xrceseq = NULL
 
            END IF
            
 
 
 
            CALL axrt300_02_set_entry_b(l_cmd)
            CALL axrt300_02_set_no_entry_b(l_cmd)
            #add-point:modify段before insert name="input.body.before_insert"
            #帳別、單號賦值
            LET g_xrce_d[l_ac].xrceld = g_xrca_t.xrcald
            LET g_xrce_d[l_ac].xrcedocno = g_xrca_t.xrcadocno
            LET g_xrce_d[l_ac].xrce015 = 'C'
            LET g_xrce_d[l_ac].xrcesite = g_xrca_t.xrcasite
            IF cl_null(g_xrce_d[l_ac].xrceorga) THEN 
               LET g_xrce_d[l_ac].xrceorga = g_xrca_t.xrcacomp
            END IF
            
            #項次給默認值
            IF cl_null(g_xrce_d[l_ac].xrceseq) THEN
               SELECT MAX(xrceseq) INTO g_xrce_d[l_ac].xrceseq
                 FROM xrce_t
                WHERE xrceent = g_enterprise AND xrceld = g_xrce_d[l_ac].xrceld
                  AND xrcedocno = g_xrce_d[l_ac].xrcedocno
               IF cl_null(g_xrce_d[l_ac].xrceseq) THEN
                  LET g_xrce_d[l_ac].xrceseq = 1
               ELSE
                  LET g_xrce_d[l_ac].xrceseq = g_xrce_d[l_ac].xrceseq +1
               END IF
              #160420-00001#1 Mark ---(S)---
              #SELECT MAX(xrdeseq) INTO g_xrce_d[l_ac].xrceseq
              #  FROM xrde_t
              # WHERE xrdeent = g_enterprise AND xrdeld = g_xrce_d[l_ac].xrceld
              #   AND xrdedocno = g_xrce_d[l_ac].xrcedocno
              #IF cl_null(g_xrce_d[l_ac].xrceseq) THEN
              #   LET g_xrce_d[l_ac].xrceseq = 1
              #ELSE
              #   LET g_xrce_d[l_ac].xrceseq = g_xrce_d[l_ac].xrceseq +1
              #END IF
              #160420-00001#1 Mark ---(E)---
            END IF
            #end add-point  
  
         AFTER INSERT
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CALL cl_err()
               LET INT_FLAG = 0
               CANCEL INSERT
            END IF
               
            LET l_count = 1  
            SELECT COUNT(1) INTO l_count FROM xrce_t 
             WHERE xrceent = g_enterprise AND xrceld = g_xrce_d[l_ac].xrceld
                                       AND xrcedocno = g_xrce_d[l_ac].xrcedocno
                                       AND xrceseq = g_xrce_d[l_ac].xrceseq
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               #171023-00004#2   2017/11/22 By 09773 add(S)   
               #T作业单身维护科目后，若启用的核算项都有值，则不需打开核算项子画面
               LET g_glaq_s.glaq025 = g_xrce3_d[l_ac].xrce017
               LET g_glaq_s.glaq018 = g_xrce3_d[l_ac].xrce018
               LET g_glaq_s.glaq019 = g_xrce3_d[l_ac].xrce019
               LET g_glaq_s.glaq024 = g_xrce3_d[l_ac].xrce020
               LET g_glaq_s.glaq027 = g_xrce3_d[l_ac].xrce022
               LET g_glaq_s.glaq028 = g_xrce3_d[l_ac].xrce023
               LET g_glaq_s.glaq052 = g_xrce3_d[l_ac].xrce040
               LET g_glaq_s.glaq020 = g_xrce3_d[l_ac].xrce035
               LET g_glaq_s.glaq023 = g_xrce3_d[l_ac].xrce036
               LET g_glaq_s.glaq022 = g_xrce3_d[l_ac].xrce038
               LET g_glaq_s.glaq051 = g_xrce3_d[l_ac].xrce039
               LET g_glaq_s.glaq053 = g_xrce3_d[l_ac].xrce041
               LET g_glaq_s.glaq029 = g_xrce3_d[l_ac].xrce042
               LET g_glaq_s.glaq030 = g_xrce3_d[l_ac].xrce043
               LET g_glaq_s.glaq031 = g_xrce3_d[l_ac].xrce044
               LET g_glaq_s.glaq032 = g_xrce3_d[l_ac].xrce045
               LET g_glaq_s.glaq033 = g_xrce3_d[l_ac].xrce046
               LET g_glaq_s.glaq034 = g_xrce3_d[l_ac].xrce047
               LET g_glaq_s.glaq035 = g_xrce3_d[l_ac].xrce048
               LET g_glaq_s.glaq036 = g_xrce3_d[l_ac].xrce049
               LET g_glaq_s.glaq037 = g_xrce3_d[l_ac].xrce050
               LET g_glaq_s.glaq038 = g_xrce3_d[l_ac].xrce051
               #171023-00004#2   2017/11/22 By 09773 add(E)
               #170512-00045#2 add s---   
                  CALL aglt310_02('c',g_xrca_t.xrcald,'',g_xrca_t.xrcadocdt,g_xrce_d[l_ac].xrce016,'','axrt300',g_glaq_s.*)
                  RETURNING g_glaq_s.glaq017,g_glaq_s.glaq018,g_glaq_s.glaq019,g_glaq_s.glaq020,g_glaq_s.glaq021,
                            g_glaq_s.glaq022,g_glaq_s.glaq023,g_glaq_s.glaq024,g_glaq_s.glaq051,g_glaq_s.glaq052,
                            g_glaq_s.glaq053,g_glaq_s.glaq025,g_glaq_s.glaq027,g_glaq_s.glaq028,g_glaq_s.glaq029,
                            g_glaq_s.glaq030,g_glaq_s.glaq031,g_glaq_s.glaq032,g_glaq_s.glaq033,g_glaq_s.glaq034,
                            g_glaq_s.glaq035,g_glaq_s.glaq036,g_glaq_s.glaq037,g_glaq_s.glaq038,g_glaq_s.glbc004
                  #171016-00011#3 -s 171020 mark by 08172
#                  LET g_xrce3_d[l_ac].xrce017 = g_glaq_s.glaq025
#                  LET g_xrce3_d[l_ac].xrce018 = g_glaq_s.glaq018
#                  LET g_xrce3_d[l_ac].xrce019 = g_glaq_s.glaq019
#                  LET g_xrce3_d[l_ac].xrce020 = g_glaq_s.glaq024
#                  LET g_xrce3_d[l_ac].xrce022 = g_glaq_s.glaq027
#                  LET g_xrce3_d[l_ac].xrce023 = g_glaq_s.glaq028
#                  LET g_xrce3_d[l_ac].xrce040 = g_glaq_s.glaq052
#                  LET g_xrce3_d[l_ac].xrce035 = g_glaq_s.glaq020
#                  LET g_xrce3_d[l_ac].xrce036 = g_glaq_s.glaq023
#                  LET g_xrce3_d[l_ac].xrce038 = g_glaq_s.glaq022
#                  LET g_xrce3_d[l_ac].xrce039 = g_glaq_s.glaq051
#                  LET g_xrce3_d[l_ac].xrce041 = g_glaq_s.glaq053
#                  LET g_xrce3_d[l_ac].xrce042 = g_glaq_s.glaq029
#                  LET g_xrce3_d[l_ac].xrce043 = g_glaq_s.glaq030
#                  LET g_xrce3_d[l_ac].xrce044 = g_glaq_s.glaq031
#                  LET g_xrce3_d[l_ac].xrce045 = g_glaq_s.glaq032
#                  LET g_xrce3_d[l_ac].xrce046 = g_glaq_s.glaq033
#                  LET g_xrce3_d[l_ac].xrce047 = g_glaq_s.glaq034
#                  LET g_xrce3_d[l_ac].xrce048 = g_glaq_s.glaq035
#                  LET g_xrce3_d[l_ac].xrce049 = g_glaq_s.glaq036
#                  LET g_xrce3_d[l_ac].xrce050 = g_glaq_s.glaq037
#                  LET g_xrce3_d[l_ac].xrce051 = g_glaq_s.glaq038
                  #171016-00011#3 -e 171020 mark by 08172
                  #171016-00011#3 -s 171020 add by 08172
                  IF NOT cl_null(g_glaq_s.glaq025) THEN LET g_xrce3_d[l_ac].xrce017 = g_glaq_s.glaq025 END IF
                  IF NOT cl_null(g_glaq_s.glaq018) THEN LET g_xrce3_d[l_ac].xrce018 = g_glaq_s.glaq018 END IF
                  IF NOT cl_null(g_glaq_s.glaq019) THEN LET g_xrce3_d[l_ac].xrce019 = g_glaq_s.glaq019 END IF
                  IF NOT cl_null(g_glaq_s.glaq024) THEN LET g_xrce3_d[l_ac].xrce020 = g_glaq_s.glaq024 END IF
                  IF NOT cl_null(g_glaq_s.glaq027) THEN LET g_xrce3_d[l_ac].xrce022 = g_glaq_s.glaq027 END IF
                  IF NOT cl_null(g_glaq_s.glaq028) THEN LET g_xrce3_d[l_ac].xrce023 = g_glaq_s.glaq028 END IF
                  IF NOT cl_null(g_glaq_s.glaq052) THEN LET g_xrce3_d[l_ac].xrce040 = g_glaq_s.glaq052 END IF
                  IF NOT cl_null(g_glaq_s.glaq020) THEN LET g_xrce3_d[l_ac].xrce035 = g_glaq_s.glaq020 END IF
                  IF NOT cl_null(g_glaq_s.glaq023) THEN LET g_xrce3_d[l_ac].xrce036 = g_glaq_s.glaq023 END IF
                  IF NOT cl_null(g_glaq_s.glaq022) THEN LET g_xrce3_d[l_ac].xrce038 = g_glaq_s.glaq022 END IF
                  IF NOT cl_null(g_glaq_s.glaq051) THEN LET g_xrce3_d[l_ac].xrce039 = g_glaq_s.glaq051 END IF
                  IF NOT cl_null(g_glaq_s.glaq053) THEN LET g_xrce3_d[l_ac].xrce041 = g_glaq_s.glaq053 END IF
                  IF NOT cl_null(g_glaq_s.glaq029) THEN LET g_xrce3_d[l_ac].xrce042 = g_glaq_s.glaq029 END IF
                  IF NOT cl_null(g_glaq_s.glaq030) THEN LET g_xrce3_d[l_ac].xrce043 = g_glaq_s.glaq030 END IF
                  IF NOT cl_null(g_glaq_s.glaq031) THEN LET g_xrce3_d[l_ac].xrce044 = g_glaq_s.glaq031 END IF
                  IF NOT cl_null(g_glaq_s.glaq032) THEN LET g_xrce3_d[l_ac].xrce045 = g_glaq_s.glaq032 END IF
                  IF NOT cl_null(g_glaq_s.glaq033) THEN LET g_xrce3_d[l_ac].xrce046 = g_glaq_s.glaq033 END IF
                  IF NOT cl_null(g_glaq_s.glaq034) THEN LET g_xrce3_d[l_ac].xrce047 = g_glaq_s.glaq034 END IF
                  IF NOT cl_null(g_glaq_s.glaq035) THEN LET g_xrce3_d[l_ac].xrce048 = g_glaq_s.glaq035 END IF
                  IF NOT cl_null(g_glaq_s.glaq036) THEN LET g_xrce3_d[l_ac].xrce049 = g_glaq_s.glaq036 END IF
                  IF NOT cl_null(g_glaq_s.glaq037) THEN LET g_xrce3_d[l_ac].xrce050 = g_glaq_s.glaq037 END IF
                  IF NOT cl_null(g_glaq_s.glaq038) THEN LET g_xrce3_d[l_ac].xrce051 = g_glaq_s.glaq038 END IF
                  #171016-00011#3 -e 171020 add by 08172
                  DISPLAY BY NAME
                  g_xrce3_d[l_ac].xrce017,g_xrce3_d[l_ac].xrce018,g_xrce3_d[l_ac].xrce019,
                  g_xrce3_d[l_ac].xrce020,g_xrce3_d[l_ac].xrce022,g_xrce3_d[l_ac].xrce023,
                  g_xrce3_d[l_ac].xrce040,g_xrce3_d[l_ac].xrce035,g_xrce3_d[l_ac].xrce038,
                  g_xrce3_d[l_ac].xrce039,g_xrce3_d[l_ac].xrce041,g_xrce3_d[l_ac].xrce042,
                  g_xrce3_d[l_ac].xrce043,g_xrce3_d[l_ac].xrce044,g_xrce3_d[l_ac].xrce045,
                  g_xrce3_d[l_ac].xrce046,g_xrce3_d[l_ac].xrce047,g_xrce3_d[l_ac].xrce048,
                  g_xrce3_d[l_ac].xrce049,g_xrce3_d[l_ac].xrce050,g_xrce3_d[l_ac].xrce036
                  #170512-00045#2 add e---











               #end add-point
            
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_xrce_d[g_detail_idx].xrceld
               LET gs_keys[2] = g_xrce_d[g_detail_idx].xrcedocno
               LET gs_keys[3] = g_xrce_d[g_detail_idx].xrceseq
               CALL axrt300_02_insert_b('xrce_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_xrce_d[l_ac].* TO NULL
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "xrce_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL axrt300_02_b_fill(g_wc2)
               #資料多語言用-增/改
               
                  #161130-00056
               #add-point:input段-after_insert name="input.body.a_insert2"
               CALL axrt300_02_ref_amt()
               #end add-point
               ##ERROR 'INSERT O.K'
               LET g_detail_cnt = g_detail_cnt + 1
               
               LET g_wc2 = g_wc2, " OR (xrceld = '", g_xrce_d[l_ac].xrceld, "' "
                                  ," AND xrcedocno = '", g_xrce_d[l_ac].xrcedocno, "' "
                                  ," AND xrceseq = '", g_xrce_d[l_ac].xrceseq, "' "
 
                                  ,")"
            END IF                
              
         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' THEN
               LET l_cmd='d'
            ELSE
               #add-point:單身刪除ask前 name="input.body.b_delete_ask"
               
               #end add-point   
               
               IF NOT cl_ask_del_detail() THEN
                  CANCEL DELETE
               END IF
               IF l_lock_sw = "Y" THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code = -263 
                  LET g_errparam.popup = TRUE 
                  CALL cl_err()
                  CANCEL DELETE
               END IF
 
               #171006-00020 ---start---
               #確定是否有刪除的權限
               #先確定該table有ownid
               IF cl_getField("xrce_t","") THEN
                  IF NOT cl_auth_chk_act_permission("delete") THEN
                     #有目前權限無法刪除的資料
                     CANCEL DELETE
                  END IF
               END IF
               #171006-00020 --- end ---
              
               #add-point:單身刪除前 name="input.body.b_delete"
              #160420-00001#1 Mark ---(S)---
              #SELECT gzcb004 INTO l_gzcb004
              #  FROM gzcb_t
              # WHERE gzcb001 = '8306'
              #   AND gzcb002 = g_xrce_d[l_ac].xrce002
              #IF l_gzcb004 = '2' THEN 
              #160420-00001#1 Mark ---(E)---
               #end add-point   
               
               DELETE FROM xrce_t
                WHERE xrceent = g_enterprise AND 
                      xrceld = g_xrce_d_t.xrceld
                      AND xrcedocno = g_xrce_d_t.xrcedocno
                      AND xrceseq = g_xrce_d_t.xrceseq
 
                      
               #add-point:單身刪除中 name="input.body.m_delete"
              #160420-00001#1 Mark ---(S)---
              #ELSE
              #   DELETE FROM xrde_t
              #    WHERE xrdeent = g_enterprise 
              #      AND xrdeld = g_xrce_d_t.xrceld
              #      AND xrdedocno = g_xrce_d_t.xrcedocno
              #      AND xrdeseq = g_xrce_d_t.xrceseq
              #END IF
              #160420-00001#1 Mark ---(E)---
               #end add-point  
                      
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "xrce_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE
                  LET g_errparam.popup = TRUE 
                  CALL cl_err()
                  CANCEL DELETE   
               ELSE
                  LET g_detail_cnt = g_detail_cnt-1
                  
 
 
 
                  
 
 
   #161130-00056
                  #add-point:單身刪除後 name="input.body.a_delete"
                  
                  #end add-point
                  #修改歷程記錄(刪除)
                  CALL axrt300_02_set_pk_array()
                  LET g_log1 = util.JSON.stringify(g_xrce_d[l_ac])   #(ver:38)
                  IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:38)
                  ELSE
                  END IF
               END IF 
               CLOSE axrt300_02_bcl
               #add-point:單身關閉bcl name="input.body.close"
              #CLOSE axrt300_02_bcl1   #160420-00001#1 Mark
               #end add-point
               LET l_count = g_xrce_d.getLength()
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_xrce_d_t.xrceld
               LET gs_keys[2] = g_xrce_d_t.xrcedocno
               LET gs_keys[3] = g_xrce_d_t.xrceseq
 
               #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL axrt300_02_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
 
            END IF 
              
         AFTER DELETE 
            IF l_cmd <> 'd' THEN
               #add-point:單身刪除後2 name="input.body.after_delete"
            CALL axrt300_02_ref_amt()
               #end add-point
                              CALL axrt300_02_delete_b('xrce_t',gs_keys,"'1'")
            END IF
            #如果是最後一筆
            IF l_ac = (g_xrce_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
            #add-point:單身刪除後3 name="input.body.after_delete3"
            
            #end add-point
 
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce001
            #add-point:BEFORE FIELD xrce001 name="input.b.page1.xrce001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce001
            
            #add-point:AFTER FIELD xrce001 name="input.a.page1.xrce001"
            #此段落由子樣板a05產生
            IF  g_xrce_d[g_detail_idx].xrceld IS NOT NULL AND g_xrce_d[g_detail_idx].xrcedocno IS NOT NULL AND g_xrce_d[g_detail_idx].xrceseq IS NOT NULL AND g_xrce_d[g_detail_idx].xrcesite IS NOT NULL AND g_xrce_d[g_detail_idx].xrce001 IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_xrce_d[g_detail_idx].xrceld != g_xrce_d_t.xrceld OR g_xrce_d[g_detail_idx].xrcedocno != g_xrce_d_t.xrcedocno OR g_xrce_d[g_detail_idx].xrceseq != g_xrce_d_t.xrceseq OR g_xrce_d[g_detail_idx].xrcesite != g_xrce_d_t.xrcesite OR g_xrce_d[g_detail_idx].xrce001 != g_xrce_d_t.xrce001)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM xrce_t WHERE "||"xrceent = '" ||g_enterprise|| "' AND "||"xrceld = '"||g_xrce_d[g_detail_idx].xrceld ||"' AND "|| "xrcedocno = '"||g_xrce_d[g_detail_idx].xrcedocno ||"' AND "|| "xrceseq = '"||g_xrce_d[g_detail_idx].xrceseq ||"' AND "|| "xrcesite = '"||g_xrce_d[g_detail_idx].xrcesite ||"' AND "|| "xrce001 = '"||g_xrce_d[g_detail_idx].xrce001 ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce001
            #add-point:ON CHANGE xrce001 name="input.g.page1.xrce001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcedocno
            #add-point:BEFORE FIELD xrcedocno name="input.b.page1.xrcedocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcedocno
            
            #add-point:AFTER FIELD xrcedocno name="input.a.page1.xrcedocno"
            #此段落由子樣板a05產生
            IF  g_xrce_d[g_detail_idx].xrceld IS NOT NULL AND g_xrce_d[g_detail_idx].xrcedocno IS NOT NULL AND g_xrce_d[g_detail_idx].xrceseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_xrce_d[g_detail_idx].xrceld != g_xrce_d_t.xrceld OR g_xrce_d[g_detail_idx].xrcedocno != g_xrce_d_t.xrcedocno OR g_xrce_d[g_detail_idx].xrceseq != g_xrce_d_t.xrceseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM xrce_t WHERE "||"xrceent = '" ||g_enterprise|| "' AND "||"xrceld = '"||g_xrce_d[g_detail_idx].xrceld ||"' AND "|| "xrcedocno = '"||g_xrce_d[g_detail_idx].xrcedocno ||"' AND "|| "xrceseq = '"||g_xrce_d[g_detail_idx].xrceseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcedocno
            #add-point:ON CHANGE xrcedocno name="input.g.page1.xrcedocno"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrceld
            #add-point:BEFORE FIELD xrceld name="input.b.page1.xrceld"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrceld
            
            #add-point:AFTER FIELD xrceld name="input.a.page1.xrceld"
            #此段落由子樣板a05產生
            IF  g_xrce_d[g_detail_idx].xrceld IS NOT NULL AND g_xrce_d[g_detail_idx].xrcedocno IS NOT NULL AND g_xrce_d[g_detail_idx].xrceseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_xrce_d[g_detail_idx].xrceld != g_xrce_d_t.xrceld OR g_xrce_d[g_detail_idx].xrcedocno != g_xrce_d_t.xrcedocno OR g_xrce_d[g_detail_idx].xrceseq != g_xrce_d_t.xrceseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM xrce_t WHERE "||"xrceent = '" ||g_enterprise|| "' AND "||"xrceld = '"||g_xrce_d[g_detail_idx].xrceld ||"' AND "|| "xrcedocno = '"||g_xrce_d[g_detail_idx].xrcedocno ||"' AND "|| "xrceseq = '"||g_xrce_d[g_detail_idx].xrceseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrceld
            #add-point:ON CHANGE xrceld name="input.g.page1.xrceld"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcesite
            #add-point:BEFORE FIELD xrcesite name="input.b.page1.xrcesite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcesite
            
            #add-point:AFTER FIELD xrcesite name="input.a.page1.xrcesite"
            #此段落由子樣板a05產生
            IF  g_xrce_d[g_detail_idx].xrceld IS NOT NULL AND g_xrce_d[g_detail_idx].xrcedocno IS NOT NULL AND g_xrce_d[g_detail_idx].xrceseq IS NOT NULL AND g_xrce_d[g_detail_idx].xrcesite IS NOT NULL AND g_xrce_d[g_detail_idx].xrce001 IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_xrce_d[g_detail_idx].xrceld != g_xrce_d_t.xrceld OR g_xrce_d[g_detail_idx].xrcedocno != g_xrce_d_t.xrcedocno OR g_xrce_d[g_detail_idx].xrceseq != g_xrce_d_t.xrceseq OR g_xrce_d[g_detail_idx].xrcesite != g_xrce_d_t.xrcesite OR g_xrce_d[g_detail_idx].xrce001 != g_xrce_d_t.xrce001)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM xrce_t WHERE "||"xrceent = '" ||g_enterprise|| "' AND "||"xrceld = '"||g_xrce_d[g_detail_idx].xrceld ||"' AND "|| "xrcedocno = '"||g_xrce_d[g_detail_idx].xrcedocno ||"' AND "|| "xrceseq = '"||g_xrce_d[g_detail_idx].xrceseq ||"' AND "|| "xrcesite = '"||g_xrce_d[g_detail_idx].xrcesite ||"' AND "|| "xrce001 = '"||g_xrce_d[g_detail_idx].xrce001 ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcesite
            #add-point:ON CHANGE xrcesite name="input.g.page1.xrcesite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrceseq
            #add-point:BEFORE FIELD xrceseq name="input.b.page1.xrceseq"
            IF cl_null(g_xrce_d[l_ac].xrceseq) THEN
               SELECT MAX(xrceseq) INTO g_xrce_d[l_ac].xrceseq
                 FROM xrce_t
                WHERE xrceent = g_enterprise AND xrceld = g_xrce_d[l_ac].xrceld
                  AND xrcedocno = g_xrce_d[l_ac].xrcedocno
               IF cl_null(g_xrce_d[l_ac].xrceseq) THEN
                  LET g_xrce_d[l_ac].xrceseq = 1
               ELSE
                  LET g_xrce_d[l_ac].xrceseq = g_xrce_d[l_ac].xrceseq +1
               END IF
            END IF
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrceseq
            
            #add-point:AFTER FIELD xrceseq name="input.a.page1.xrceseq"
            #此段落由子樣板a05產生
            IF  g_xrce_d[g_detail_idx].xrceld IS NOT NULL AND g_xrce_d[g_detail_idx].xrcedocno IS NOT NULL AND g_xrce_d[g_detail_idx].xrceseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_xrce_d[g_detail_idx].xrceld != g_xrce_d_t.xrceld OR g_xrce_d[g_detail_idx].xrcedocno != g_xrce_d_t.xrcedocno OR g_xrce_d[g_detail_idx].xrceseq != g_xrce_d_t.xrceseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM xrce_t WHERE "||"xrceent = '" ||g_enterprise|| "' AND "||"xrceld = '"||g_xrce_d[g_detail_idx].xrceld ||"' AND "|| "xrcedocno = '"||g_xrce_d[g_detail_idx].xrcedocno ||"' AND "|| "xrceseq = '"||g_xrce_d[g_detail_idx].xrceseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrceseq
            #add-point:ON CHANGE xrceseq name="input.g.page1.xrceseq"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce002
            #add-point:BEFORE FIELD xrce002 name="input.b.page1.xrce002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce002
            
            #add-point:AFTER FIELD xrce002 name="input.a.page1.xrce002"
 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce002
            #add-point:ON CHANGE xrce002 name="input.g.page1.xrce002"
           #160420-00001#1 Mark ---(S)---
          # IF NOT cl_null(g_xrce_d[l_ac].xrce002) THEN
          #    IF (g_xrce_d[l_ac].xrce002 = '20' OR g_xrce_d[l_ac].xrce002 = '21') THEN
          #       DISPLAY '10' TO s_detail1[l_ac].xrce002
          #       INITIALIZE g_errparam TO NULL
          #       LET g_errparam.code = 'axr-00072'
          #       LET g_errparam.extend = g_xrce_d[l_ac].xrce002
          #       LET g_errparam.popup = TRUE
          #       CALL cl_err()
          #
          #       LET g_xrce_d[l_ac].xrce002 = '10'
          #       DISPLAY g_xrce_d[l_ac].xrce002 TO s_detail1[l_ac].xrce002
          #       NEXT FIELD CURRENT
          #    END IF
          #    CALL axrt300_02_set_entry_b(l_cmd)
          #    CALL axrt300_02_set_no_entry_b(l_cmd)
          #    IF l_cmd = 'a' OR (l_cmd = 'u' AND g_xrce_d[l_ac].xrce002 != g_xrce_d_t.xrce002) THEN
          #       LET g_xrce_d[l_ac].xrce003 = ''
          #       LET g_xrce_d[l_ac].xrce004 = ''
          #       LET g_xrce_d[l_ac].xrce005 = 0
          #       LET g_xrce_d[l_ac].xrce024 = ''
          #       LET g_xrce_d[l_ac].xrce025 = ''
          #       LET g_xrce_d[l_ac].xrce008 = ''
          #       LET g_xrce_d[l_ac].lc_xrce008 = '' #160122-00001#5 add
          #       LET g_xrce_d[l_ac].xrce100 = ''
          #       LET g_xrce_d[l_ac].xrce109 = ''
          #       LET g_xrce_d[l_ac].xrce101 = ''
          #       LET g_xrce_d[l_ac].xrce119 = ''
          #       LET g_xrce_d[l_ac].xrce027 = 'N'
          #       CASE
          #          WHEN g_xrce_d[l_ac].xrce002 = '10'
          #             LET g_xrce_d[l_ac].xrce006 = '10'
          #          OTHERWISE
          #             LET g_xrce_d[l_ac].xrce006 = ''
          #       END CASE
          #       
          #       IF g_xrce_d[l_ac].xrce002 <> '10' THEN 
          #          LET g_xrce_d[l_ac].xrce100 = g_glaa_t.glaa001
          #          LET g_xrce_d[l_ac].xrce101 = 1
          #       ELSE
          #          LET g_xrce_d[l_ac].xrce100 = ''
          #          LET g_xrce_d[l_ac].xrce101 = ''
          #       END IF
          #       
          #       CALL s_subject_get(g_xrce_d[l_ac].xrce002,g_xrca_t.xrcald,g_xrca_t.xrcacomp,g_xrca_t.xrca004) RETURNING l_success,g_xrce3_d[l_ac].xrce016,l_xrde011 
          #       
          #       DISPLAY g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce008,g_xrce_d[l_ac].xrce100,
          #               g_xrce_d[l_ac].xrce109,g_xrce_d[l_ac].xrce101,g_xrce_d[l_ac].xrce119,
          #               g_xrce_d[l_ac].xrce006,g_xrce_d[l_ac].xrce027,
          #               g_xrce_d[l_ac].xrce005
          #            TO s_detail1[l_ac].xrce003,s_detail1[l_ac].xrce004,s_detail1[l_ac].xrce008,s_detail1[l_ac].xrce100,
          #               s_detail1[l_ac].xrce109,s_detail1[l_ac].xrce101,s_detail1[l_ac].xrce119,
          #               s_detail1[l_ac].xrce006,s_detail1[l_ac].xrce027,
          #               s_detail1[l_ac].xrce005        
          #    END IF
          #    SELECT gzcb005 INTO g_xrce_d[l_ac].xrce015 FROM gzcb_t
          #     WHERE gzcb001 = '8306' AND gzcb002 = g_xrce_d[l_ac].xrce002
          # END IF 
          # SELECT gzcb004 INTO l_gzcb004 FROM gzcb_t WHERE gzcb001 = '8306' AND gzcb002 = g_xrce_d[l_ac].xrce002
          ##160420-00001#1 Mark ---(S)---
          ##IF l_gzcb004 <> '1' THEN
          ##   CALL cl_set_comp_entry('xrde012_u',FALSE)
          ##ELSE
          ##   CALL cl_set_comp_entry('xrde012_u',TRUE)
          ##END IF
          ##160420-00001#1 Mark ---(E)---
          #160420-00001#1 Mark ---(S)---
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce003
            #add-point:BEFORE FIELD xrce003 name="input.b.page1.xrce003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce003
            
            #add-point:AFTER FIELD xrce003 name="input.a.page1.xrce003"
           #160420-00001#1 Mark ---(S)---
           #IF NOT cl_null(g_xrce_d[l_ac].xrce003) AND g_xrce_d[l_ac].xrce002 = '10' THEN
           #   CALL axrt300_02_chk_xrde003()
           #   IF NOT cl_null(g_errno) AND g_errno != 'agl-00154' THEN
           #      LET l_xrce003 = g_xrce_d[l_ac].xrce003
           #      IF l_cmd = 'a' THEN
           #         LET g_xrce_d[l_ac].xrce003 = ''
           #         LET g_xrce_d[l_ac].xrce004 = ''
           #      ELSE
           #         LET g_xrce_d[l_ac].xrce003 = g_xrce_d_t.xrce003
           #         LET g_xrce_d[l_ac].xrce004 = g_xrce_d_t.xrce004
           #      END IF
           #      DISPLAY g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004 TO s_detail1[l_ac].xrce003,s_detail1[l_ac].xrce004
           #      INITIALIZE g_errparam TO NULL
           #      LET g_errparam.code = g_errno
           #      LET g_errparam.extend = l_xrce003
           #      #160318-00005#53 --s add
           #      CASE g_errno
           #         WHEN 'sub-01302'
           #            LET g_errparam.replace[1] = 'anmt310'
           #            LET g_errparam.replace[2] = cl_get_progname('anmt310',g_lang,"2")
           #            LET g_errparam.exeprog = 'anmt310'
           #      END CASE
           #      #160318-00005#53 --e add
           #      LET g_errparam.popup = TRUE
           #      CALL cl_err()
           #
           #      NEXT FIELD xrce003
           #   ELSE
           #      IF g_errno = 'agl-00154' THEN
           #         INITIALIZE g_errparam TO NULL
           #         LET g_errparam.code = g_errno
           #         LET g_errparam.extend = g_xrce_d[l_ac].xrce003
           #         LET g_errparam.popup = FALSE
           #         CALL cl_err()
           #
           #      END IF
           #   END IF
           #   CALL cl_set_comp_entry('xrce100',FALSE)
           #ELSE
           #   CALL cl_set_comp_entry('xrce100',TRUE)
           #END IF
           #160420-00001#1 Mark ---(E)---
            
            IF NOT cl_null(g_xrce_d[l_ac].xrce003) AND (g_xrce_d[l_ac].xrce002 = '31' OR g_xrce_d[l_ac].xrce002 = '32') THEN
               SELECT xrcastus,xrcadocdt,xrca100 INTO l_xrcastus,l_xrcadocdt,l_xrca100 FROM xrca_t #170531-00062#2 add xrcadocdt #170621-00044#2 add xrca100
                WHERE xrcaent = g_enterprise
                  AND xrcald = g_xrca_t.xrcald
                  AND xrcadocno = g_xrce_d[l_ac].xrce003
               LET g_errno = " "
               CASE
                  WHEN SQLCA.SQLCODE = 100
                     LET g_errno = 'axr-00064'
                  WHEN l_xrcastus != 'Y'
                     LET g_errno = 'axr-00065'
                  #170531-00062#2--add--str--
                  #冲销单的日期不可大于单据立账日期，请重新输入
                  WHEN l_xrcadocdt > g_xrca_t.xrcadocdt
                     LET g_errno = 'aap-00642'
                  #170531-00062#2--add--end
                  #170621-00044#2 add s---
                  #沖帳幣別需與立帳單交易幣別一致
                  WHEN l_xrca100 != g_xrca_t.xrca100 AND l_xrca100 != g_glaa_t.glaa001
                     LET g_errno = 'axr-01081'
                  #170621-00044#2 add e---
               END CASE
               IF NOT cl_null(g_errno) THEN
                  LET l_xrce003 = g_xrce_d[l_ac].xrce003
                  IF l_cmd = 'a' THEN
                     LET g_xrce_d[l_ac].xrce003 = ''
                  ELSE
                     #LET g_xrce_d[l_ac].xrce003 = g_xrce_d_t.xrce003   #160824-00007#360 20170118 mark by beckxie
                     LET g_xrce_d[l_ac].xrce003 = g_xrce_d_o.xrce003   #160824-00007#360 20170118 add by beckxie
                  END IF
                  DISPLAY BY NAME g_xrce_d[DIALOG.getCurrentRow('s_detail1')].xrce003  #160420-00001#1 Mod
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = l_xrce003
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  NEXT FIELD xrce003
               END IF
               CALL axrt300_02_chk_xrce003()
               IF NOT cl_null(g_errno) THEN
                  LET l_xrce003 = g_xrce_d[l_ac].xrce003
                  IF l_cmd = 'a' THEN
                     LET g_xrce_d[l_ac].xrce003 = ''
                  ELSE
                     #LET g_xrce_d[l_ac].xrce003 = g_xrce_d_t.xrce003   #160824-00007#360 20170118 mark by beckxie
                     LET g_xrce_d[l_ac].xrce003 = g_xrce_d_o.xrce003   #160824-00007#360 20170118 add by beckxie
                  END IF
                  DISPLAY BY NAME g_xrce_d[DIALOG.getCurrentRow('s_detail1')].xrce003  #160420-00001#1 Mod
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = l_xrce003
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  NEXT FIELD xrce003
               END IF
               
               #IF (l_cmd = 'a' OR (l_cmd = 'u' AND (g_xrce_d[l_ac].xrce003 != g_xrce_d_t.xrce003 OR cl_null(g_xrce_d_t.xrce003))))    #160824-00007#360 20170118 mark by beckxie
               IF (g_xrce_d[l_ac].xrce003 != g_xrce_d_o.xrce003 OR cl_null(g_xrce_d_o.xrce003))    #160824-00007#360 20170118 add by beckxie
                   AND NOT cl_null(g_xrce_d[l_ac].xrce002)
                   AND NOT cl_null(g_xrce_d[l_ac].xrce004) 
                   AND NOT cl_null(g_xrce_d[l_ac].xrce005) THEN
                  CALL axrt300_02_def_xrcc(g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce005)
                  #160628-00002#1--add--str--
                  #判断是否为应税折抵，如果时，抓取可冲抵未税金额、税额、含税金额
                  IF g_xrce_d[l_ac].xrce027 = 'Y' THEN
                     CALL s_axrt300_not_washed_amt(g_xrce_d[l_ac].xrceld,g_xrce_d[l_ac].xrcedocno,g_xrce_d[l_ac].xrceseq,g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce005)
                     RETURNING r_xrce_w.*
                     LET g_xrce_d[l_ac].xrce103=r_xrce_w.xrce103
                     LET g_xrce_d[l_ac].xrce104=r_xrce_w.xrce104
                     LET g_xrce_d[l_ac].xrce113=r_xrce_w.xrce113
                     LET g_xrce_d[l_ac].xrce114=r_xrce_w.xrce114
                     IF g_glaa_t.glaa015='Y' THEN
                        LET g_xrce2_d[l_ac].xrce123=r_xrce_w.xrce123
                        LET g_xrce2_d[l_ac].xrce124=r_xrce_w.xrce124
                        LET g_xrce2_d[l_ac].xrce129=r_xrce_w.xrce129
                     END IF
                     IF g_glaa_t.glaa019='Y' THEN
                        LET g_xrce2_d[l_ac].xrce133=r_xrce_w.xrce133
                        LET g_xrce2_d[l_ac].xrce134=r_xrce_w.xrce134
                        LET g_xrce2_d[l_ac].xrce139=r_xrce_w.xrce139
                     END IF
                  ELSE
                     LET g_xrce_d[l_ac].xrce103=g_xrce_d[l_ac].xrce109
                     LET g_xrce_d[l_ac].xrce104=0
                     LET g_xrce_d[l_ac].xrce113=g_xrce_d[l_ac].xrce119
                     LET g_xrce_d[l_ac].xrce114=0
                     IF g_glaa_t.glaa015='Y' THEN
                        LET g_xrce2_d[l_ac].xrce123=g_xrce2_d[l_ac].xrce129
                        LET g_xrce2_d[l_ac].xrce124=0
                     END IF
                     IF g_glaa_t.glaa019='Y' THEN
                        LET g_xrce2_d[l_ac].xrce133=g_xrce2_d[l_ac].xrce139
                        LET g_xrce2_d[l_ac].xrce134=0
                     END IF
                  END IF
                  CALL cl_set_comp_entry("xrce103,xrce104,xrce113,xrce114,xrce123,xrce124,xrce133,xrce134",FALSE)
                  #160628-00002#1--add--end
               END IF
            END IF
            LET g_xrce_d_o.* = g_xrce_d[l_ac].*   #160824-00007#360 20170118 add by beckxie
            LET g_xrce2_d_o.* = g_xrce2_d[l_ac].*   #160824-00007#360 20170118 add by beckxie
#            IF NOT cl_null(g_xrce_d[l_ac].xrce002) THEN
#               IF g_xrce_d[l_ac].xrce002 = '10' THEN
#                  IF NOT cl_null(g_xrce_d[l_ac].xrce003) THEN
#                     CALL axrt300_02_chk_xrce003(l_cmd)
#                     IF NOT cl_null(g_errno) AND g_errno != 'agl-00154' THEN
#                        IF l_cmd = 'a' THEN
#                           DISPLAY '','' TO s_detail1[l_ac].xrce003,s_detail1[l_ac].xrce004
#                        ELSE
#                           DISPLAY g_xrce_d_t.xrce003,g_xrce_d_t.xrce004 TO s_detail1[l_ac].xrce003,s_detail1[l_ac].xrce004
#                        END IF
#                        INITIALIZE g_errparam TO NULL
#                        LET g_errparam.code = g_errno
#                        LET g_errparam.extend = g_xrce_d[l_ac].xrce003
#                        LET g_errparam.popup = TRUE
#                        CALL cl_err()
#
#                        IF l_cmd = 'a' THEN
#                           LET g_xrce_d[l_ac].xrce003 = ''
#                           LET g_xrce_d[l_ac].xrce004 = ''
#                        ELSE
#                           LET g_xrce_d[l_ac].xrce003 = g_xrce_d_t.xrce003
#                           LET g_xrce_d[l_ac].xrce004 = g_xrce_d_t.xrce004
#                        END IF
#                        DISPLAY g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004 TO s_detail1[l_ac].xrce003,s_detail1[l_ac].xrce004
#                        NEXT FIELD xrce003
#                     ELSE
#                        IF g_errno = 'agl-00154' THEN
#                           INITIALIZE g_errparam TO NULL
#                           LET g_errparam.code = g_errno
#                           LET g_errparam.extend = g_xrce_d[l_ac].xrce003
#                           LET g_errparam.popup = FALSE
#                           CALL cl_err()
#
#                        END IF
#                        IF (l_cmd = 'a' OR (l_cmd = 'u' AND g_xrce_d[l_ac].xrce003 != g_xrce_d_t.xrce003 AND NOT cl_null(g_xrce_d_t.xrce003))) AND NOT cl_null(g_xrce_d[l_ac].xrce004) THEN
#                           CALL axrt300_02_def_xrce(g_xrce_d[l_ac].xrce002,g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004,0,g_xrce_d[l_ac].xrce006,g_xrce_d[l_ac].xrce003)
#                        END IF
#                     END IF
#                     CALL cl_set_comp_entry('xrce100',FALSE)
#                  ELSE
#                     CALL cl_set_comp_entry('xrce100',TRUE)
#                  END IF
#               END IF
#               IF g_xrce_d[l_ac].xrce002 = '31' THEN
#                  IF NOT cl_null(g_xrce_d[l_ac].xrce003) THEN
#      
#                     SELECT xrcastus INTO l_xrcastus FROM xrca_t
#                      WHERE xrcaent = g_enterprise
#                        AND xrcald = g_xrca_t.xrcald
#                        AND xrcadocno = g_xrce_d[l_ac].xrce003
#                     LET g_errno = " "
#                     CASE
#                        WHEN SQLCA.SQLCODE = 100
#                           LET g_errno = 'axr-00064'
#                        WHEN l_xrcastus != 'Y'
#                           LET g_errno = 'axr-00065'
#                     END CASE
#                     IF NOT cl_null(g_errno) THEN
#                        IF l_cmd = 'a' THEN
#                           DISPLAY '' TO s_detail3[l_ac].xrce003
#                        ELSE
#                           DISPLAY g_xrce_d_t.xrce003 TO s_detail3[l_ac].xrce003
#                        END IF
#                        INITIALIZE g_errparam TO NULL
#                        LET g_errparam.code = g_errno
#                        LET g_errparam.extend = g_xrce_d[l_ac].xrce003
#                        LET g_errparam.popup = TRUE
#                        CALL cl_err()
#
#                        IF l_cmd = 'a' THEN
#                           LET g_xrce_d[l_ac].xrce003 = ''
#                        ELSE
#                           LET g_xrce_d[l_ac].xrce003 = g_xrce_d_t.xrce003
#                        END IF
#                        DISPLAY g_xrce_d[l_ac].xrce003 TO s_detail3[l_ac].xrce003
#                        NEXT FIELD xrce003
#                     END IF
#                     CALL axrt300_02_xrce024(l_cmd)
#                     IF NOT cl_null(g_errno) THEN
#                        IF l_cmd = 'a' THEN
#                           DISPLAY '' TO s_detail3[l_ac].xrce003
#                        ELSE
#                           DISPLAY g_xrce_d_t.xrce003 TO s_detail3[l_ac].xrce003
#                        END IF
#                        INITIALIZE g_errparam TO NULL
#                        LET g_errparam.code = g_errno
#                        LET g_errparam.extend = g_xrce_d[l_ac].xrce003
#                        LET g_errparam.popup = TRUE
#                        CALL cl_err()
#
#                        IF l_cmd = 'a' THEN
#                           LET g_xrce_d[l_ac].xrce003 = ''
#                        ELSE
#                           LET g_xrce_d[l_ac].xrce003 = g_xrce_d_t.xrce003
#                        END IF
#                        DISPLAY g_xrce_d[l_ac].xrce003 TO s_detail3[l_ac].xrce003
#                        NEXT FIELD xrce003
#                     END IF
#                     SELECT xrca060 INTO l_xrca060 FROM xrca_t
#                      WHERE xrcald = g_xrca_t.xrcald
#                        AND xrca019 = g_xrce_d[l_ac].xrce003
#                     IF l_xrca060 = '2' THEN
#                        LET g_xrce_d[l_ac].xrce027 = 'Y'
#                     ELSE
#                        LET g_xrce_d[l_ac].xrce027 = 'N'
#                     END IF
#                     IF (l_cmd = 'a' OR (l_cmd = 'u' AND (g_xrce_d[l_ac].xrce003 != g_xrce_d_t.xrce003 OR cl_null(g_xrce_d_t.xrce003)))) AND NOT cl_null(g_xrce_d[l_ac].xrce002) THEN
#                        CALL axrt300_02_def_xrce(g_xrce_d[l_ac].xrce002,g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce005,'',g_xrce_d[l_ac].xrce024)
#                     END IF
#                  END IF
#               END IF
#            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce003
            #add-point:ON CHANGE xrce003 name="input.g.page1.xrce003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce004
            #add-point:BEFORE FIELD xrce004 name="input.b.page1.xrce004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce004
            
            #add-point:AFTER FIELD xrce004 name="input.a.page1.xrce004"
           #160420-00001#1 Mark ---(S)---
           #IF NOT cl_null(g_xrce_d[l_ac].xrce003) AND NOT cl_null(g_xrce_d[l_ac].xrce004) AND g_xrce_d[l_ac].xrce002 = '10' THEN
           #   CALL axrt300_02_chk_xrde003()
           #   IF NOT cl_null(g_errno) AND g_errno != 'agl-00154' THEN
           #      LET l_xrce004 = g_xrce_d[l_ac].xrce004
           #      IF l_cmd = 'a' THEN
           #         LET g_xrce_d[l_ac].xrce003 = ''
           #         LET g_xrce_d[l_ac].xrce004 = ''
           #      ELSE
           #         LET g_xrce_d[l_ac].xrce003 = g_xrce_d_t.xrce003
           #         LET g_xrce_d[l_ac].xrce004 = g_xrce_d_t.xrce004
           #      END IF
           #      DISPLAY g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004 TO s_detail1[l_ac].xrce003,s_detail1[l_ac].xrce004
           #      INITIALIZE g_errparam TO NULL
           #      LET g_errparam.code = g_errno
           #      LET g_errparam.extend = l_xrce004
           #      #160318-00005#53 --s add
           #      CASE g_errno
           #         WHEN 'sub-01302'
           #            LET g_errparam.replace[1] = 'anmt310'
           #            LET g_errparam.replace[2] = cl_get_progname('anmt310',g_lang,"2")
           #            LET g_errparam.exeprog = 'anmt310'
           #      END CASE
           #      #160318-00005#53 --e add
           #      LET g_errparam.popup = TRUE
           #      CALL cl_err()
           #
           #      NEXT FIELD xrce004
           #   ELSE
           #      IF g_errno = 'agl-00154' THEN
           #         INITIALIZE g_errparam TO NULL
           #         LET g_errparam.code = g_errno
           #         LET g_errparam.extend = g_xrce_d[l_ac].xrce004
           #         LET g_errparam.popup = FALSE
           #         CALL cl_err()
           #
           #      END IF
           #   END IF
           #END IF
           #160420-00001#1 Mark ---(E)---
            
            IF NOT cl_null(g_xrce_d[l_ac].xrce003) AND NOT cl_null(g_xrce_d[l_ac].xrce004) AND (g_xrce_d[l_ac].xrce002 = '31' OR g_xrce_d[l_ac].xrce002 = '32') THEN
               CALL axrt300_02_chk_xrce003()
               IF NOT cl_null(g_errno) THEN
                  LET l_xrce004 = g_xrce_d[l_ac].xrce004
                  IF l_cmd = 'a' THEN
                     LET g_xrce_d[l_ac].xrce004 = ''
                  ELSE
                     #LET g_xrce_d[l_ac].xrce004 = g_xrce_d_t.xrce004   #160824-00007#360 20170118 mark by beckxie
                     LET g_xrce_d[l_ac].xrce004 = g_xrce_d_o.xrce004   #160824-00007#360 20170118 add by beckxie
                  END IF
                  DISPLAY BY NAME g_xrce_d[DIALOG.getCurrentRow('s_detail1')].xrce004  #160420-00001#1 Mod
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = l_xrce004
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  NEXT FIELD xrce004
               END IF
               
               #IF (l_cmd = 'a' OR (l_cmd = 'u' AND (g_xrce_d[l_ac].xrce004 != g_xrce_d_t.xrce004 OR cl_null(g_xrce_d_t.xrce004))))    #160824-00007#360 20170118 mark by beckxie
               IF (g_xrce_d[l_ac].xrce004 != g_xrce_d_o.xrce004 OR cl_null(g_xrce_d_o.xrce004))    #160824-00007#360 20170118 add by beckxie
                  AND NOT cl_null(g_xrce_d[l_ac].xrce002) 
                  AND NOT cl_null(g_xrce_d[l_ac].xrce004) 
                  AND NOT cl_null(g_xrce_d[l_ac].xrce005) THEN
                  CALL axrt300_02_def_xrcc(g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce005)
                  #160628-00002#1--add--str--
                  #判断是否为应税折抵，如果时，抓取可冲抵未税金额、税额、含税金额
                  IF g_xrce_d[l_ac].xrce027 = 'Y' THEN
                     CALL s_axrt300_not_washed_amt(g_xrce_d[l_ac].xrceld,g_xrce_d[l_ac].xrcedocno,g_xrce_d[l_ac].xrceseq,g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce005)
                     RETURNING r_xrce_w.*
                     LET g_xrce_d[l_ac].xrce103=r_xrce_w.xrce103
                     LET g_xrce_d[l_ac].xrce104=r_xrce_w.xrce104
                     LET g_xrce_d[l_ac].xrce113=r_xrce_w.xrce113
                     LET g_xrce_d[l_ac].xrce114=r_xrce_w.xrce114
                     IF g_glaa_t.glaa015='Y' THEN
                        LET g_xrce2_d[l_ac].xrce123=r_xrce_w.xrce123
                        LET g_xrce2_d[l_ac].xrce124=r_xrce_w.xrce124
                        LET g_xrce2_d[l_ac].xrce129=r_xrce_w.xrce129
                     END IF
                     IF g_glaa_t.glaa019='Y' THEN
                        LET g_xrce2_d[l_ac].xrce133=r_xrce_w.xrce133
                        LET g_xrce2_d[l_ac].xrce134=r_xrce_w.xrce134
                        LET g_xrce2_d[l_ac].xrce139=r_xrce_w.xrce139
                     END IF
                  ELSE
                     LET g_xrce_d[l_ac].xrce103=g_xrce_d[l_ac].xrce109
                     LET g_xrce_d[l_ac].xrce104=0
                     LET g_xrce_d[l_ac].xrce113=g_xrce_d[l_ac].xrce119
                     LET g_xrce_d[l_ac].xrce114=0
                     IF g_glaa_t.glaa015='Y' THEN
                        LET g_xrce2_d[l_ac].xrce123=g_xrce2_d[l_ac].xrce129
                        LET g_xrce2_d[l_ac].xrce124=0
                     END IF
                     IF g_glaa_t.glaa019='Y' THEN
                        LET g_xrce2_d[l_ac].xrce133=g_xrce2_d[l_ac].xrce139
                        LET g_xrce2_d[l_ac].xrce134=0
                     END IF
                  END IF
                  CALL cl_set_comp_entry("xrce103,xrce104,xrce113,xrce114,xrce123,xrce124,xrce133,xrce134",FALSE)
                  #160628-00002#1--add--end
               END IF
            END IF
            #170618-00443#1--mark--str--lujh
            #LET g_xrce_d[l_ac].* = g_xrce_d_o.*   #160824-00007#360 20170118 add by beckxie
            #LET g_xrce2_d[l_ac].* = g_xrce2_d_o.*   #160824-00007#360 20170118 add by beckxie
            #170618-00443#1--mark--end--lujh
            
            #170618-00443#1--add--str--lujh
            LET g_xrce_d_o.* = g_xrce_d[l_ac].*  
            LET g_xrce2_d_o.* = g_xrce2_d[l_ac].*   
            #170618-00443#1--add--end--lujh
            
#            IF NOT cl_null(g_xrce_d[l_ac].xrce003) AND NOT cl_null(g_xrce_d[l_ac].xrce004) AND g_xrce_d[l_ac].xrce002 = '10' THEN
#               CALL axrt300_02_chk_xrce003()
#               IF NOT cl_null(g_errno) AND g_errno != 'agl-00154' THEN
#                  IF l_cmd = 'a' THEN
#                     DISPLAY '','' TO s_detail1[l_ac].xrce003,s_detail1[l_ac].xrce004
#                  ELSE
#                     DISPLAY g_xrce_d_t.xrce003,g_xrce_d_t.xrce004 TO s_detail1[l_ac].xrce003,s_detail1[l_ac].xrce004
#                  END IF
#                  INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = g_errno
#                  LET g_errparam.extend = g_xrce_d[l_ac].xrce004
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()
#
#                  IF l_cmd = 'a' THEN
#                     LET g_xrce_d[l_ac].xrce003 = ''
#                     LET g_xrce_d[l_ac].xrce004 = ''
#                  ELSE
#                     LET g_xrce_d[l_ac].xrce003 = g_xrce_d_t.xrce003
#                     LET g_xrce_d[l_ac].xrce004 = g_xrce_d_t.xrce004
#                  END IF
#                  DISPLAY g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004 TO s_detail1[l_ac].xrce003,s_detail1[l_ac].xrce004
#                  NEXT FIELD xrce004
#               ELSE
#                  IF g_errno = 'agl-00154' THEN
#                     INITIALIZE g_errparam TO NULL
#                     LET g_errparam.code = g_errno
#                     LET g_errparam.extend = g_xrce_d[l_ac].xrce003
#                     LET g_errparam.popup = FALSE
#                     CALL cl_err()
#
#                  END IF
#                  IF (l_cmd = 'a' OR (l_cmd = 'u' AND g_xrce_d[l_ac].xrce004 != g_xrce_d_t.xrce004 AND NOT cl_null(g_xrce_d_t.xrce004))) AND NOT cl_null(g_xrce_d[l_ac].xrce003) THEN
#                     CALL axrt300_02_def_xrce(g_xrce_d[l_ac].xrce002,g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004,0,g_xrce_d[l_ac].xrce006,g_xrce_d[l_ac].xrce003)
#                  END IF
#               END IF
#            END IF
#            IF NOT cl_null(g_xrce_d[l_ac].xrce003) AND NOT cl_null(g_xrce_d[l_ac].xrce004) AND g_xrce_d[l_ac].xrce002 = '31' THEN
#               SELECT COUNT(*) INTO l_count FROM xrcb_t
#                WHERE xrcbent = g_enterprise
#                  AND xrcbld = g_xrca_t.xrcald
#                  AND xrcbdocno = g_xrce_d[l_ac].xrce003
#                  AND xrcbseq   = g_xrce_d[l_ac].xrce004
#               IF l_count = 0 THEN
#                  IF l_cmd = 'a' THEN
#                     DISPLAY '' TO s_detail3[l_ac].xrce003
#                  ELSE
#                     DISPLAY g_xrce_d_t.xrce003 TO s_detail3[l_ac].xrce003
#                  END IF
#                  INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = 'axr-00064'
#                  LET g_errparam.extend = g_xrce_d[l_ac].xrce003
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()
#
#                  IF l_cmd = 'a' THEN
#                     LET g_xrce_d[l_ac].xrce003 = ''
#                  ELSE
#                     LET g_xrce_d[l_ac].xrce003 = g_xrce_d_t.xrce003
#                  END IF
#                  DISPLAY g_xrce_d[l_ac].xrce003 TO s_detail3[l_ac].xrce003
#                  NEXT FIELD xrce003
#               END IF
#               CALL axrt300_02_xrce024(l_cmd)
#               IF NOT cl_null(g_errno) THEN
#                  IF l_cmd = 'a' THEN
#                     DISPLAY '' TO s_detail3[l_ac].xrce003
#                  ELSE
#                     DISPLAY g_xrce_d_t.xrce003 TO s_detail3[l_ac].xrce003
#                  END IF
#                  INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = 'axr-00064'
#                  LET g_errparam.extend = g_xrce_d[l_ac].xrce003
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()
#
#                  IF l_cmd = 'a' THEN
#                     LET g_xrce_d[l_ac].xrce003 = ''
#                  ELSE
#                     LET g_xrce_d[l_ac].xrce003 = g_xrce_d_t.xrce003
#                  END IF
#                  DISPLAY g_xrce_d[l_ac].xrce003 TO s_detail3[l_ac].xrce003
#                  NEXT FIELD xrce003
#               END IF
#               
#               IF (l_cmd = 'a' OR (l_cmd = 'u' AND (g_xrce_d[l_ac].xrce004 != g_xrce_d_t.xrce004 OR cl_null(g_xrce_d_t.xrce004)))) AND NOT cl_null(g_xrce_d[l_ac].xrce002) THEN
#                  CALL axrt300_02_def_xrce(g_xrce_d[l_ac].xrce002,g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce005,'',g_xrce_d[l_ac].xrce024)
#               END IF
#            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce004
            #add-point:ON CHANGE xrce004 name="input.g.page1.xrce004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce005
            #add-point:BEFORE FIELD xrce005 name="input.b.page1.xrce005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce005
            
            #add-point:AFTER FIELD xrce005 name="input.a.page1.xrce005"
            IF NOT cl_null(g_xrce_d[l_ac].xrce005) AND NOT cl_null(g_xrce_d[l_ac].xrce003) AND NOT cl_null(g_xrce_d[l_ac].xrce004) AND (g_xrce_d[l_ac].xrce002 = '31' OR g_xrce_d[l_ac].xrce002 = '32') THEN
               CALL axrt300_02_chk_xrce003()
               IF NOT cl_null(g_errno) THEN
                  LET l_xrce005 = g_xrce_d[l_ac].xrce005
                  IF l_cmd = 'a' THEN
                     LET g_xrce_d[l_ac].xrce005 = ''
                  ELSE
                     #LET g_xrce_d[l_ac].xrce005 = g_xrce_d_t.xrce005   #160824-00007#360 20170118 mark by beckxie
                     LET g_xrce_d[l_ac].xrce005 = g_xrce_d_o.xrce005   #160824-00007#360 20170118 add by beckxie
                  END IF
                  DISPLAY BY NAME g_xrce_d[DIALOG.getCurrentRow('s_detail1')].xrce005  #160420-00001#1 Mod
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = l_xrce005
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  NEXT FIELD xrce005
               END IF
               
               #IF (l_cmd = 'a' OR (l_cmd = 'u' AND (g_xrce_d[l_ac].xrce005 != g_xrce_d_t.xrce005 OR cl_null(g_xrce_d_t.xrce005))))    #160824-00007#360 20170118 mark by beckxie
               IF (g_xrce_d[l_ac].xrce005 != g_xrce_d_o.xrce005 OR cl_null(g_xrce_d_o.xrce005))    #160824-00007#360 20170118 add by beckxie
                  AND NOT cl_null(g_xrce_d[l_ac].xrce002) 
                  AND NOT cl_null(g_xrce_d[l_ac].xrce004) 
                  AND NOT cl_null(g_xrce_d[l_ac].xrce005) THEN
                  CALL axrt300_02_def_xrcc(g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce005)
                  #160628-00002#1--add--str--
                  #判断是否为应税折抵，如果时，抓取可冲抵未税金额、税额、含税金额
                  IF g_xrce_d[l_ac].xrce027 = 'Y' THEN
                     CALL s_axrt300_not_washed_amt(g_xrce_d[l_ac].xrceld,g_xrce_d[l_ac].xrcedocno,g_xrce_d[l_ac].xrceseq,g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce005)
                     RETURNING r_xrce_w.*
                     LET g_xrce_d[l_ac].xrce103=r_xrce_w.xrce103
                     LET g_xrce_d[l_ac].xrce104=r_xrce_w.xrce104
                     LET g_xrce_d[l_ac].xrce113=r_xrce_w.xrce113
                     LET g_xrce_d[l_ac].xrce114=r_xrce_w.xrce114
                     IF g_glaa_t.glaa015='Y' THEN
                        LET g_xrce2_d[l_ac].xrce123=r_xrce_w.xrce123
                        LET g_xrce2_d[l_ac].xrce124=r_xrce_w.xrce124
                        LET g_xrce2_d[l_ac].xrce129=r_xrce_w.xrce129
                     END IF
                     IF g_glaa_t.glaa019='Y' THEN
                        LET g_xrce2_d[l_ac].xrce133=r_xrce_w.xrce133
                        LET g_xrce2_d[l_ac].xrce134=r_xrce_w.xrce134
                        LET g_xrce2_d[l_ac].xrce139=r_xrce_w.xrce139
                     END IF
                  ELSE
                     LET g_xrce_d[l_ac].xrce103=g_xrce_d[l_ac].xrce109
                     LET g_xrce_d[l_ac].xrce104=0
                     LET g_xrce_d[l_ac].xrce113=g_xrce_d[l_ac].xrce119
                     LET g_xrce_d[l_ac].xrce114=0
                     IF g_glaa_t.glaa015='Y' THEN
                        LET g_xrce2_d[l_ac].xrce123=g_xrce2_d[l_ac].xrce129
                        LET g_xrce2_d[l_ac].xrce124=0
                     END IF
                     IF g_glaa_t.glaa019='Y' THEN
                        LET g_xrce2_d[l_ac].xrce133=g_xrce2_d[l_ac].xrce139
                        LET g_xrce2_d[l_ac].xrce134=0
                     END IF
                  END IF
                  CALL cl_set_comp_entry("xrce103,xrce104,xrce113,xrce114,xrce123,xrce124,xrce133,xrce134",FALSE)
                  #160628-00002#1--add--end
               END IF
            END IF
            LET g_xrce_d_o.* = g_xrce_d[l_ac].*   #160824-00007#360 20170118 add by beckxie
            LET g_xrce2_d_o.* = g_xrce2_d[l_ac].*   #160824-00007#360 20170118 add by beckxie
#            IF NOT cl_null(g_xrce_d[l_ac].xrce005) AND NOT cl_null(g_xrce_d[l_ac].xrce002) AND g_xrce_d[l_ac].xrce002 = '31' THEN
#               IF NOT cl_null(g_xrce_d[l_ac].xrce003) THEN
#                  LET l_count = 0
#                  SELECT COUNT(*) INTO l_count FROM xrcc_t
#                   WHERE xrccent = g_enterprise
#                     AND xrccdocno = g_xrce_d[l_ac].xrce003
#                     AND xrcc001 = g_xrce_d[l_ac].xrce005
#                  IF l_count = 0 THEN
#                     IF l_cmd = 'a' THEN
#                        DISPLAY '' TO s_detail1[l_ac].xrce005
#                     ELSE
#                        DISPLAY g_xrce_d_t.xrce005 TO s_detail1[l_ac].xrce005
#                     END IF
#                     INITIALIZE g_errparam TO NULL
#                     LET g_errparam.code = 'axr-00066'
#                     LET g_errparam.extend = g_xrce_d[l_ac].xrce005
#                     LET g_errparam.popup = TRUE
#                     CALL cl_err()
#
#                     IF l_cmd = 'a' THEN
#                        LET g_xrce_d[l_ac].xrce005 = ''
#                     ELSE
#                        LET g_xrce_d[l_ac].xrce005 = g_xrce_d_t.xrce005
#                     END IF
#                     DISPLAY g_xrce_d[l_ac].xrce005 TO s_detail1[l_ac].xrce005
#                     NEXT FIELD xrce005
#                  END IF
#               END IF
#               CALL axrt300_02_xrce024(l_cmd)
#               IF NOT cl_null(g_errno) THEN
#                  IF l_cmd = 'a' THEN
#                     DISPLAY '' TO s_detail1[l_ac].xrce005
#                  ELSE
#                     DISPLAY g_xrce_d_t.xrce005 TO s_detail1[l_ac].xrce005
#                  END IF
#                  INITIALIZE g_errparam TO NULL
#                     LET g_errparam.code = 'axr-00066'
#                     LET g_errparam.extend = g_xrce_d[l_ac].xrce005
#                     LET g_errparam.popup = TRUE
#                     CALL cl_err()
#
#                  IF l_cmd = 'a' THEN
#                     LET g_xrce_d[l_ac].xrce005 = ''
#                  ELSE
#                     LET g_xrce_d[l_ac].xrce005 = g_xrce_d_t.xrce005
#                  END IF
#                  DISPLAY g_xrce_d[l_ac].xrce005 TO s_detail1[l_ac].xrce005
#                  NEXT FIELD xrce005
#               END IF
#               
#               IF (l_cmd = 'a' OR (l_cmd = 'u' AND (g_xrce_d[l_ac].xrce005 != g_xrce_d_t.xrce005 OR cl_null(g_xrce_d_t.xrce005)))) AND NOT cl_null(g_xrce_d[l_ac].xrce002) THEN
#                  CALL axrt300_02_def_xrce(g_xrce_d[l_ac].xrce002,g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce005,'',g_xrce_d[l_ac].xrce024)
#               END IF
#            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce005
            #add-point:ON CHANGE xrce005 name="input.g.page1.xrce005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce024
            #add-point:BEFORE FIELD xrce024 name="input.b.page1.xrce024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce024
            
            #add-point:AFTER FIELD xrce024 name="input.a.page1.xrce024"
            IF NOT cl_null(g_xrce_d[l_ac].xrce024) THEN
               #IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_xrce_d[l_ac].xrce024 != g_xrce_d_t.xrce024 AND NOT cl_null(g_xrce_d_t.xrce024))) THEN    #160824-00007#360 20170118 mark by beckxie
               IF g_xrce_d[l_ac].xrce024 != g_xrce_d_o.xrce024 AND cl_null(g_xrce_d_o.xrce024) THEN    #160824-00007#360 20170118 add by beckxie

                  LET l_ooab002 = ''
                  SELECT ooab002 INTO l_ooab002 FROM ooab_t
                   WHERE ooabent = g_enterprise
                     AND ooab001 = 'S-FIN-1002'
                     AND ooabsite= g_xrca_t.xrcasite

                  #檢查交易單據存在性、有效性
                  IF l_ooab002 = 'N' THEN
                     SELECT COUNT(*) INTO l_count FROM xrcb_t,xrca_t
                      WHERE xrcbent = g_enterprise
                        AND xrcaent = xrcbent
                        AND xrcadocno = xrcbdocno
                        AND xrcb002 = g_xrce_d[l_ac].xrce024
                        AND xrcastus = 'Y'
                     IF l_count = 0 THEN
                        SELECT COUNT(*) INTO l_count FROM xrcb_t,xrca_t
                         WHERE xrcbent = g_enterprise
                           AND xrcaent = xrcbent
                           AND xrcadocno = xrcbdocno
                           AND xrcb002 = g_xrce_d[l_ac].xrce024
                        IF l_count = 0 THEN
                           LET g_errno = 'axr-00062'
                        ELSE
                           LET g_errno = 'axr-00063'
                        END IF
                     END IF
                  ELSE
                     IF NOT cl_null(g_xrce_d[l_ac].xrce025) THEN
                        SELECT COUNT(*) INTO l_count FROM xrcb_t,xrca_t
                         WHERE xrcbent = g_enterprise
                           AND xrcaent = xrcbent
                           AND xrcadocno = xrcbdocno
                           AND xrcb002 = g_xrce_d[l_ac].xrce024
                           AND xrcb003 = g_xrce_d[l_ac].xrce025
                           AND xrcastus = 'Y'
                        IF l_count = 0 THEN
                           SELECT COUNT(*) INTO l_count FROM xrcb_t,xrca_t
                            WHERE xrcbent = g_enterprise
                              AND xrcaent = xrcbent
                              AND xrcadocno = xrcbdocno
                              AND xrcb002 = g_xrce_d[l_ac].xrce024
                              AND xrcb003 = g_xrce_d[l_ac].xrce025
                           IF l_count = 0 THEN
                              LET g_errno = 'axr-00062'
                           ELSE
                              LET g_errno = 'axr-00063'
                           END IF
                        END IF
                     END IF
                  END IF
                  IF NOT cl_null(g_errno) THEN
                    #160420-00001#1 Mark ---(S)---
                    #IF l_cmd = 'a'THEN
                    #   DISPLAY '' TO s_detail3[l_ac].xrce024
                    #ELSE
                    #   DISPLAY g_xrce_d_t.xrce024 TO s_detail3[l_ac].xrce024
                    #END IF
                    #160420-00001#1 Mark ---(E)---
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = g_xrce_d[l_ac].xrce024
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     IF l_cmd = 'a'THEN
                        LET g_xrce_d[l_ac].xrce024 = ''
                     ELSE
                        #LET g_xrce_d[l_ac].xrce024 = g_xrce_d_t.xrce024   #160824-00007#360 20170118 mark by beckxie
                        LET g_xrce_d[l_ac].xrce024 = g_xrce_d_o.xrce024   #160824-00007#360 20170118 add by beckxie
                     END IF
                    #DISPLAY g_xrce_d[l_ac].xrce024 TO s_detail3[l_ac].xrce024   #160420-00001#1 Mark
                     DISPLAY BY NAME g_xrce_d[DIALOG.getCurrentRow('s_detail1')].xrce024  #160420-00001#1 Mod
                     NEXT FIELD xrce024
                  END IF
                  CALL axrt300_02_xrce024(l_cmd)
                  IF NOT cl_null(g_errno) THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = g_xrce_d[l_ac].xrce024
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     IF l_cmd = 'a'THEN
                        LET g_xrce_d[l_ac].xrce024 = ''
                     ELSE
                        #LET g_xrce_d[l_ac].xrce024 = g_xrce_d_t.xrce024   #160824-00007#360 20170118 mark by beckxie
                        LET g_xrce_d[l_ac].xrce024 = g_xrce_d_o.xrce024   #160824-00007#360 20170118 add by beckxie
                     END IF
                     DISPLAY BY NAME g_xrce_d[DIALOG.getCurrentRow('s_detail1')].xrce004  #160420-00001#1 Mod
                     NEXT FIELD xrce024
                  END IF
               END IF
               
               #IF (l_cmd = 'a' OR (l_cmd = 'u' AND (g_xrce_d[l_ac].xrce024 != g_xrce_d_t.xrce024 OR cl_null(g_xrce_d_t.xrce024)))) AND NOT cl_null(g_xrce3_d[l_ac].xrce002) THEN   #160824-00007#360 20170118 mark by beckxie
               IF (g_xrce_d[l_ac].xrce024 != g_xrce_d_o.xrce024 OR cl_null(g_xrce_d_o.xrce024)) AND NOT cl_null(g_xrce3_d[l_ac].xrce002) THEN   #160824-00007#360 20170118 add by beckxie
                  CALL axrt300_02_def_xrce(g_xrce3_d[l_ac].xrce002,g_xrce3_d[l_ac].xrce003,g_xrce3_d[l_ac].xrce004,g_xrce3_d[l_ac].xrce005,'',g_xrce_d[l_ac].xrce024)
               END IF
            END IF
            LET g_xrce_d_o.* = g_xrce_d[l_ac].*   #160824-00007#360 20170118 add by beckxie
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce024
            #add-point:ON CHANGE xrce024 name="input.g.page1.xrce024"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce025
            #add-point:BEFORE FIELD xrce025 name="input.b.page1.xrce025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce025
            
            #add-point:AFTER FIELD xrce025 name="input.a.page1.xrce025"
            IF NOT cl_null(g_xrce_d[l_ac].xrce025) THEN
               #IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_xrce_d[l_ac].xrce025 != g_xrce_d_t.xrce025)) THEN   #160824-00007#360 20170118 mark by beckxie
               IF (g_xrce_d[l_ac].xrce025 != g_xrce_d_o.xrce025) OR cl_null(g_xrce_d_o.xrce025) THEN   #160824-00007#360 20170118 add by beckxie
                  #檢查交易單據存在性、有效性
                  SELECT COUNT(*) INTO l_count FROM xrcb_t,xrca_t
                   WHERE xrcbent = g_enterprise
                     AND xrcaent = xrcbent
                     AND xrcadocno = xrcbdocno
                     AND xrcb002 = g_xrce_d[l_ac].xrce024
                     AND xrcb003 = g_xrce_d[l_ac].xrce025
                     AND xrcastus = 'Y'
                  IF l_count = 0 THEN
                     SELECT COUNT(*) INTO l_count FROM xrcb_t,xrca_t
                      WHERE xrcbent = g_enterprise
                        AND xrcaent = xrcbent
                        AND xrcadocno = xrcbdocno
                        AND xrcb002 = g_xrce_d[l_ac].xrce024
                        AND xrcb003 = g_xrce_d[l_ac].xrce025
                     IF l_count = 0 THEN
                        LET g_errno = 'axr-00062'
                     ELSE
                        LET g_errno = 'axr-00063'
                     END IF
                  END IF
                  IF NOT cl_null(g_errno) THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = g_xrce_d[l_ac].xrce025
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     IF l_cmd = 'a'THEN
                        LET g_xrce_d[l_ac].xrce025 = ''
                     ELSE
                        #LET g_xrce_d[l_ac].xrce025 = g_xrce_d_t.xrce025   #160824-00007#360 20170118 mark by beckxie
                        LET g_xrce_d[l_ac].xrce025 = g_xrce_d_o.xrce025   #160824-00007#360 20170118 add by beckxie
                     END IF
                     DISPLAY BY NAME g_xrce_d[DIALOG.getCurrentRow('s_detail1')].xrce025  #160420-00001#1 Mod
                     NEXT FIELD xrce025
                  END IF
                  CALL axrt300_02_xrce024(l_cmd)
                  IF NOT cl_null(g_errno) THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = g_xrce_d[l_ac].xrce025
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     IF l_cmd = 'a'THEN
                        LET g_xrce_d[l_ac].xrce025 = ''
                     ELSE
                        #LET g_xrce_d[l_ac].xrce025 = g_xrce_d_t.xrce025   #160824-00007#360 20170118 mark by beckxie
                        LET g_xrce_d[l_ac].xrce025 = g_xrce_d_t.xrce025   #160824-00007#360 20170118 add by beckxie
                     END IF
                     DISPLAY BY NAME g_xrce_d[DIALOG.getCurrentRow('s_detail1')].xrce025  #160420-00001#1 Mod
                     NEXT FIELD xrce025
                  END IF
               END IF
                  
               #IF (l_cmd = 'a' OR (l_cmd = 'u' AND (g_xrce_d[l_ac].xrce025 != g_xrce_d_t.xrce025 OR cl_null(g_xrce_d_t.xrce025)))) AND NOT cl_null(g_xrce_d[l_ac].xrce002) THEN   #160824-00007#360 20170118 mark by beckxie
               IF (g_xrce_d[l_ac].xrce025 != g_xrce_d_o.xrce025 OR cl_null(g_xrce_d_o.xrce025)) AND NOT cl_null(g_xrce_d[l_ac].xrce002) THEN   #160824-00007#360 20170118 add by beckxie
                  CALL axrt300_02_def_xrce(g_xrce_d[l_ac].xrce002,g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce005,'',g_xrce_d[l_ac].xrce024)
               END IF
            END IF
            LET g_xrce_d_o.* = g_xrce_d[l_ac].*   #160824-00007#360 20170118 add by beckxie
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce025
            #add-point:ON CHANGE xrce025 name="input.g.page1.xrce025"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce008
            #add-point:BEFORE FIELD xrce008 name="input.b.page1.xrce008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce008
            
            #add-point:AFTER FIELD xrce008 name="input.a.page1.xrce008"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce008
            #add-point:ON CHANGE xrce008 name="input.g.page1.xrce008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD lc_xrce008
            #add-point:BEFORE FIELD lc_xrce008 name="input.b.page1.lc_xrce008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD lc_xrce008
            
            #add-point:AFTER FIELD lc_xrce008 name="input.a.page1.lc_xrce008"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE lc_xrce008
            #add-point:ON CHANGE lc_xrce008 name="input.g.page1.lc_xrce008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce015
            #add-point:BEFORE FIELD xrce015 name="input.b.page1.xrce015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce015
            
            #add-point:AFTER FIELD xrce015 name="input.a.page1.xrce015"


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce015
            #add-point:ON CHANGE xrce015 name="input.g.page1.xrce015"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce100
            #add-point:BEFORE FIELD xrce100 name="input.b.page1.xrce100"
            #170221-00054#1 add ------
            IF NOT cl_null(g_xrce_d[l_ac].xrce003) THEN
               CALL cl_set_comp_entry("xrce100,xrce101,xrce103,xrce104",FALSE)
               NEXT FIELD NEXT
            ELSE
               CALL cl_set_comp_entry("xrce100,xrce101,xrce103,xrce104",TRUE)
            END IF
            #170221-00054#1 add end---
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce100
            
            #add-point:AFTER FIELD xrce100 name="input.a.page1.xrce100"
            IF NOT cl_null(g_xrce_d[l_ac].xrce100) THEN
               LET l_ooaistus = Null
               SELECT ooaistus INTO l_ooaistus FROM ooai_t
                #WHERE ooai001 = g_xrce_d[l_ac].xrce100                             #160905-00002#6  mark
                WHERE ooaient = g_enterprise AND ooai001 = g_xrce_d[l_ac].xrce100   #160905-00002#6  add
               LET g_errno = ''
               CASE
                  WHEN SQLCA.SQLCODE = 100
                     LET g_errno = 'aoo-00028'
                  WHEN l_ooaistus = 'N'
#                     LET g_errno = 'aoo-00011'    #160318-00005#53  mark
                     LET g_errno = 'sub-01302'     #160318-00005#53  add
               END CASE
               IF NOT cl_null(g_errno) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_xrce_d[l_ac].xrce100
                  #160318-00005#53 --s add
                  CASE g_errno
                     WHEN 'sub-01302'
                        LET g_errparam.replace[1] = 'aooi140'
                        LET g_errparam.replace[2] = cl_get_progname('aooi140',g_lang,"2")
                        LET g_errparam.exeprog = 'aooi140'
                  END CASE
                  #160318-00005#53 --e add
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  IF l_cmd = 'a' THEN
                     LET g_xrce_d[l_ac].xrce100 = ''
                  ELSE
                     LET g_xrce_d[l_ac].xrce100 = g_xrce_d_t.xrce100
                  END IF
                  DISPLAY BY NAME g_xrce_d[DIALOG.getCurrentRow('s_detail1')].xrce100   #160420-00001#1 Mod
                  NEXT FIELD xrce100
               END IF
            END IF
            #151012-00014#1--mark--str--lujh
            #                   #匯率參照表;帳套;           日期;          來源幣別
            #CALL s_aooi160_get_exrate('2',g_glaa_t.glaald,g_xrca_t.xrcadocdt,g_xrce_d[l_ac].xrce100,
            #                         #目的幣別;   交易金額;              匯類類型
            #                          g_glaa_t.glaa001,0,g_glaa_t.glaa025)
            #RETURNING g_xrce_d[l_ac].xrce101
            #151012-00014#1--mark--end--lujh
            
            #151012-00014#1--add--str--lujh
            LET lc_param.apca004 = g_xrca_t.xrca004
            LET ls_js = util.JSON.stringify(lc_param)
            CALL s_fin_get_curr_rate(g_xrca_t.xrcacomp,g_xrca_t.xrcald,g_xrca_t.xrcadocdt,g_xrca_t.xrca100,ls_js)    
                 RETURNING g_xrce_d[l_ac].xrce101,l_desc,l_desc
            #151012-00014#1--add--end--lujh
            
            DISPLAY g_xrce_d[l_ac].xrce101 TO s_detail1[l_ac].xrce101
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce100
            #add-point:ON CHANGE xrce100 name="input.g.page1.xrce100"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce101
            #add-point:BEFORE FIELD xrce101 name="input.b.page1.xrce101"
            #170221-00054#1 add ------
            IF NOT cl_null(g_xrce_d[l_ac].xrce003) THEN
               CALL cl_set_comp_entry("xrce101",FALSE)
               NEXT FIELD NEXT
            END IF
            #170221-00054#1 add end---
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce101
            
            #add-point:AFTER FIELD xrce101 name="input.a.page1.xrce101"
            IF cl_null(g_xrce_d[l_ac].xrce003) AND cl_null(g_xrce_d[l_ac].xrce101) 
               AND NOT cl_null(g_xrce_d[l_ac].xrce109) AND NOT cl_null(g_xrce_d[l_ac].xrce100) THEN
               SELECT ooab002 INTO l_ooab002 FROM ooab_t
                WHERE ooabent = g_enterprise
                  AND ooabsite= g_xrca_t.xrcasite
                  AND ooab001 = 'S-BAS-0010'
               #151012-00014#1--mark--str--lujh
               #                         #匯率參照表;帳套;           日期;               來源幣別
               #CALL s_aooi160_get_exrate('2',g_xrca_t.xrcald,g_xrca_t.xrcadocdt,g_xrce_d[l_ac].xrce100,
               #                         #目的幣別;  交易金額;              匯類類型
               #                          g_glaa_t.glaa001,0,l_ooab002)
               #   RETURNING g_xrce_d[l_ac].xrce101
               #151012-00014#1--mark--end--lujh
               
               #151012-00014#1--add--str--lujh
               LET lc_param.apca004 = g_xrca_t.xrca004
               LET ls_js = util.JSON.stringify(lc_param)
               CALL s_fin_get_curr_rate(g_xrca_t.xrcacomp,g_xrca_t.xrcald,g_xrca_t.xrcadocdt,g_xrca_t.xrca100,ls_js)    
                    RETURNING g_xrce_d[l_ac].xrce101,l_desc,l_desc      
               #151012-00014#1--add--end--lujh                    
                  
               DISPLAY g_xrce_d[l_ac].xrce101 TO s_detail1[l_ac].xrce101
            END IF
            IF NOT cl_null(g_xrce_d[l_ac].xrce101) AND NOT cl_null(g_xrce_d[l_ac].xrce109) THEN
               LET g_xrce_d[l_ac].xrce119 = g_xrce_d[l_ac].xrce109 * g_xrce_d[l_ac].xrce101
               DISPLAY BY NAME g_xrce_d[DIALOG.getCurrentRow('s_detail1')].xrce119   #160420-00001#1 Mod
            END IF
            IF cl_null(g_xrce_d[l_ac].xrce024) AND cl_null(g_xrce_d[l_ac].xrce101) 
               AND NOT cl_null(g_xrce_d[l_ac].xrce109) AND NOT cl_null(g_xrce_d[l_ac].xrce100) THEN
               SELECT ooab002 INTO l_ooab002 FROM ooab_t
                WHERE ooabent = g_enterprise
                  AND ooabsite= g_xrca_t.xrcasite
                  AND ooab001 = 'S-BAS-0010'
                  
               #151012-00014#1--mark--str--lujh
               #                         #匯率參照表;帳套;           日期;               來源幣別
               #CALL s_aooi160_get_exrate('2',g_xrca_t.xrcald,g_xrca_t.xrcadocdt,g_xrce_d[l_ac].xrce100,
               #                         #目的幣別;  交易金額;              匯類類型
               #                          g_glaa_t.glaa001,g_xrce_d[l_ac].xrce109,l_ooab002)
               #   RETURNING g_xrce_d[l_ac].xrce101
               #151012-00014#1--mark--end--lujh
                  
               #151012-00014#1--add--str--lujh
               LET lc_param.apca004 = g_xrca_t.xrca004
               LET ls_js = util.JSON.stringify(lc_param)
               CALL s_fin_get_curr_rate(g_xrca_t.xrcacomp,g_xrca_t.xrcald,g_xrca_t.xrcadocdt,g_xrca_t.xrca100,ls_js)    
                    RETURNING g_xrce_d[l_ac].xrce101,l_desc,l_desc      
               #151012-00014#1--add--end--lujh
               DISPLAY BY NAME g_xrce_d[DIALOG.getCurrentRow('s_detail1')].xrce101   #160420-00001#1 Mod
            END IF
            IF NOT cl_null(g_xrce_d[l_ac].xrce101) AND NOT cl_null(g_xrce_d[l_ac].xrce109) THEN
               LET g_xrce_d[l_ac].xrce119 = g_xrce_d[l_ac].xrce109* g_xrce_d[l_ac].xrce101
               DISPLAY g_xrce_d[l_ac].xrce119 TO s_detail3[l_ac].xrce119
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce101
            #add-point:ON CHANGE xrce101 name="input.g.page1.xrce101"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce103
            #add-point:BEFORE FIELD xrce103 name="input.b.page1.xrce103"
            #160628-00002#1--add--str--
            IF g_xrce_d[l_ac].xrce027 = 'Y' THEN
               SELECT xrca011 INTO l_xrca011 FROM xrca_t 
               WHERE xrcaent=g_enterprise AND xrcald=g_xrca_t.xrcald AND xrcadocno=g_xrce_d[l_ac].xrce003
               #根據單身稅別-含稅否 
               CALL s_tax_chk(g_glaa_t.glaacomp,l_xrca011) 
                   RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
            END IF
            #160628-00002#1--add--end
            #170221-00054#1 add ------
            IF NOT cl_null(g_xrce_d[l_ac].xrce003) THEN
               CALL cl_set_comp_entry("xrce100,xrce101,xrce103,xrce104",FALSE)
               NEXT FIELD NEXT
            ELSE
               CALL cl_set_comp_entry("xrce100,xrce101,xrce103,xrce104",TRUE)
            END IF
            #170221-00054#1 add end---
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce103
            
            #add-point:AFTER FIELD xrce103 name="input.a.page1.xrce103"
            #160628-00002#1--add--str--
            IF NOT cl_null(g_xrce_d[l_ac].xrce103) THEN
               #IF l_cmd='a' OR (l_cmd='u' AND g_xrce_d[l_ac].xrce103 <> g_xrce_d_t.xrce103) THEN   #160824-00007#360 20170118 mark by beckxie
               IF g_xrce_d[l_ac].xrce103 <> g_xrce_d_o.xrce103 OR cl_null(g_xrce_d_o.xrce103) THEN   #160824-00007#360 20170118 add by beckxie
                  IF g_xrce_d[l_ac].xrce103 > r_xrce_w.xrce103 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'axr-00054'
                     LET g_errparam.extend = g_xrce_d[l_ac].xrce103,'>', r_xrce_w.xrce103
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     #LET g_xrce_d[l_ac].xrce103 = g_xrce_d_t.xrce103   #160824-00007#360 20170118 mark by beckxie
                     #160824-00007#360 20170118 add by beckxie---S
                     LET g_xrce_d[l_ac].xrce103 = g_xrce_d_o.xrce103   
                     LET g_xrce_d[l_ac].xrce104 = g_xrce_d_o.xrce104
                     LET g_xrce_d[l_ac].xrce109 = g_xrce_d_o.xrce109
                     LET g_xrce_d[l_ac].xrce113 = g_xrce_d_o.xrce113
                     LET g_xrce_d[l_ac].xrce114 = g_xrce_d_o.xrce114
                     LET g_xrce_d[l_ac].xrce119 = g_xrce_d_o.xrce119
                     LET g_xrce2_d[l_ac].xrce123= g_xrce2_d_o.xrce123
                     LET g_xrce2_d[l_ac].xrce124= g_xrce2_d_o.xrce124
                     LET g_xrce2_d[l_ac].xrce129= g_xrce2_d_o.xrce129
                     LET g_xrce2_d[l_ac].xrce133= g_xrce2_d_o.xrce133
                     LET g_xrce2_d[l_ac].xrce134= g_xrce2_d_o.xrce134
                     LET g_xrce2_d[l_ac].xrce139= g_xrce2_d_o.xrce139
                     #160824-00007#360 20170118 add by beckxie---E
                     NEXT FIELD xrce103
                  END IF
                  IF g_xrce_d[l_ac].xrce027 = 'Y' THEN
                     #完全冲销
                     IF g_xrce_d[l_ac].xrce103 = r_xrce_w.xrce103 THEN
                        LET g_xrce_d[l_ac].xrce104 = r_xrce_w.xrce104
                        LET g_xrce_d[l_ac].xrce109 = r_xrce_w.xrce109
                        LET g_xrce_d[l_ac].xrce113 = r_xrce_w.xrce113
                        LET g_xrce_d[l_ac].xrce114 = r_xrce_w.xrce114
                        LET g_xrce_d[l_ac].xrce119 = r_xrce_w.xrce119
                        IF g_glaa_t.glaa015 = 'Y' THEN 
                           LET g_xrce2_d[l_ac].xrce123 = r_xrce_w.xrce123
                           LET g_xrce2_d[l_ac].xrce124 = r_xrce_w.xrce124
                           LET g_xrce2_d[l_ac].xrce129 = r_xrce_w.xrce129
                        END IF
                        IF g_glaa_t.glaa019 = 'Y' THEN 
                           LET g_xrce2_d[l_ac].xrce133 = r_xrce_w.xrce133
                           LET g_xrce2_d[l_ac].xrce134 = r_xrce_w.xrce134
                           LET g_xrce2_d[l_ac].xrce139 = r_xrce_w.xrce139
                        END IF
                     ELSE
                     #部分冲销
                        IF l_oodb005 = 'Y' THEN
                           LET g_xrce_d[l_ac].xrce104 = g_xrce_d[l_ac].xrce109 - g_xrce_d[l_ac].xrce103
                           LET g_xrce_d[l_ac].xrce114 = g_xrce_d[l_ac].xrce104 * g_xrce_d[l_ac].xrce101
                           CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa001,g_xrce_d[l_ac].xrce114,2)
                               RETURNING l_success,g_errno,g_xrce_d[l_ac].xrce114
                           LET g_xrce_d[l_ac].xrce113 = g_xrce_d[l_ac].xrce119 - g_xrce_d[l_ac].xrce114
                           IF g_glaa_t.glaa015 = 'Y' THEN
                              IF g_glaa_t.glaa017='1' THEN
                                 LET g_xrce2_d[l_ac].xrce124 = g_xrce_d[l_ac].xrce104 * g_xrce2_d[l_ac].xrce121
                              ELSE
                                 LET g_xrce2_d[l_ac].xrce124 = g_xrce_d[l_ac].xrce114 * g_xrce2_d[l_ac].xrce121
                              END IF
                              CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa016,g_xrce2_d[l_ac].xrce124,2)
                                  RETURNING l_success,g_errno,g_xrce2_d[l_ac].xrce124
                              LET g_xrce2_d[l_ac].xrce123 = g_xrce2_d[l_ac].xrce129 - g_xrce2_d[l_ac].xrce124
                           END IF
                           IF g_glaa_t.glaa019 = 'Y' THEN
                              IF g_glaa_t.glaa021='1' THEN
                                 LET g_xrce2_d[l_ac].xrce134 = g_xrce_d[l_ac].xrce104 * g_xrce2_d[l_ac].xrce131
                              ELSE
                                 LET g_xrce2_d[l_ac].xrce134 = g_xrce_d[l_ac].xrce114 * g_xrce2_d[l_ac].xrce131
                              END IF
                              CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa020,g_xrce2_d[l_ac].xrce134,2)
                                  RETURNING l_success,g_errno,g_xrce2_d[l_ac].xrce134
                              LET g_xrce2_d[l_ac].xrce133 = g_xrce2_d[l_ac].xrce139 - g_xrce2_d[l_ac].xrce134
                           END IF
                        ELSE
                           CALL s_tax_ins(g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004,0,g_glaa_t.glaacomp,
                                    g_xrce_d[l_ac].xrce103,l_xrca011,1,g_xrce_d[l_ac].xrce100,g_xrce_d[l_ac].xrce101,
                                    g_xrca_t.xrcald,g_xrce2_d[l_ac].xrce121,g_xrce2_d[l_ac].xrce131)
                           RETURNING g_xrce_d[l_ac].xrce103,g_xrce_d[l_ac].xrce104,g_xrce_d[l_ac].xrce109,
                                     g_xrce_d[l_ac].xrce113,g_xrce_d[l_ac].xrce114,g_xrce_d[l_ac].xrce119,
                                     g_xrce2_d[l_ac].xrce123,g_xrce2_d[l_ac].xrce124,g_xrce2_d[l_ac].xrce129,
                                     g_xrce2_d[l_ac].xrce133,g_xrce2_d[l_ac].xrce134,g_xrce2_d[l_ac].xrce139
                           IF g_xrce_d[l_ac].xrce100 = g_glaa_t.glaa001 THEN
                              LET g_xrce_d[l_ac].xrce113=g_xrce_d[l_ac].xrce103
                              LET g_xrce_d[l_ac].xrce114=g_xrce_d[l_ac].xrce104
                              LET g_xrce_d[l_ac].xrce119=g_xrce_d[l_ac].xrce109
                           END IF
                        END IF
                     END IF
                  END IF
               END IF
            END IF
            #160628-00002#1--add--end
            LET g_xrce_d_o.* = g_xrce_d[l_ac].*   #160824-00007#360 20170118 add by beckxie
            LET g_xrce2_d_o.* = g_xrce2_d[l_ac].*   #160824-00007#360 20170118 add by beckxie
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce103
            #add-point:ON CHANGE xrce103 name="input.g.page1.xrce103"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce104
            #add-point:BEFORE FIELD xrce104 name="input.b.page1.xrce104"
            #160628-00002#1--add--str--
            IF g_xrce_d[l_ac].xrce027 = 'Y' THEN
               SELECT xrca011 INTO l_xrca011 FROM xrca_t 
               WHERE xrcaent=g_enterprise AND xrcald=g_xrca_t.xrcald AND xrcadocno=g_xrce_d[l_ac].xrce003
               #根據單身稅別-含稅否 
               CALL s_tax_chk(g_glaa_t.glaacomp,l_xrca011) 
                   RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
            END IF
            #160628-00002#1--add--end
            #170221-00054#1 add ------
            IF NOT cl_null(g_xrce_d[l_ac].xrce003) THEN
               CALL cl_set_comp_entry("xrce100,xrce101,xrce103,xrce104",FALSE)
               NEXT FIELD NEXT
            ELSE
               CALL cl_set_comp_entry("xrce100,xrce101,xrce103,xrce104",TRUE)
            END IF
            #170221-00054#1 add end---
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce104
            
            #add-point:AFTER FIELD xrce104 name="input.a.page1.xrce104"
            #160628-00002#1--add--str--
            IF NOT cl_null(g_xrce_d[l_ac].xrce104) THEN
               #IF l_cmd='a' OR (l_cmd='u' AND g_xrce_d[l_ac].xrce104 <> g_xrce_d_t.xrce104) THEN   #160824-00007#360 20170118 mark by beckxie
               IF g_xrce_d[l_ac].xrce104 <> g_xrce_d_o.xrce104 OR cl_null(g_xrce_d_o.xrce104) THEN   #160824-00007#360 20170118 add by beckxie
                  IF g_xrce_d[l_ac].xrce104 > r_xrce_w.xrce104 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'axr-00054'
                     LET g_errparam.extend = g_xrce_d[l_ac].xrce104,'>', r_xrce_w.xrce104
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     #LET g_xrce_d[l_ac].xrce104 = g_xrce_d_t.xrce104   #160824-00007#360 20170118 mark by beckxie
                     #160824-00007#360 20170118 add by beckxie---S
                     LET g_xrce_d[l_ac].xrce103 = g_xrce_d_o.xrce103   
                     LET g_xrce_d[l_ac].xrce104 = g_xrce_d_o.xrce104
                     LET g_xrce_d[l_ac].xrce109 = g_xrce_d_o.xrce109
                     LET g_xrce_d[l_ac].xrce113 = g_xrce_d_o.xrce113
                     LET g_xrce_d[l_ac].xrce114 = g_xrce_d_o.xrce114
                     LET g_xrce_d[l_ac].xrce119 = g_xrce_d_o.xrce119
                     LET g_xrce2_d[l_ac].xrce123= g_xrce2_d_o.xrce123
                     LET g_xrce2_d[l_ac].xrce124= g_xrce2_d_o.xrce124
                     LET g_xrce2_d[l_ac].xrce129= g_xrce2_d_o.xrce129
                     LET g_xrce2_d[l_ac].xrce133= g_xrce2_d_o.xrce133
                     LET g_xrce2_d[l_ac].xrce134= g_xrce2_d_o.xrce134
                     LET g_xrce2_d[l_ac].xrce139= g_xrce2_d_o.xrce139
                     #160824-00007#360 20170118 add by beckxie---E
                     NEXT FIELD xrce104
                  END IF
                  IF g_xrce_d[l_ac].xrce027 = 'Y' THEN
                     #全部冲销
                     IF g_xrce_d[l_ac].xrce104 = r_xrce_w.xrce104 THEN
                        LET g_xrce_d[l_ac].xrce103 = r_xrce_w.xrce103
                        LET g_xrce_d[l_ac].xrce109 = r_xrce_w.xrce109
                        LET g_xrce_d[l_ac].xrce113 = r_xrce_w.xrce113
                        LET g_xrce_d[l_ac].xrce114 = r_xrce_w.xrce114
                        LET g_xrce_d[l_ac].xrce119 = r_xrce_w.xrce119
                        IF g_glaa_t.glaa015 = 'Y' THEN 
                           LET g_xrce2_d[l_ac].xrce123 = r_xrce_w.xrce123
                           LET g_xrce2_d[l_ac].xrce124 = r_xrce_w.xrce124
                           LET g_xrce2_d[l_ac].xrce129 = r_xrce_w.xrce129
                        END IF
                        IF g_glaa_t.glaa019 = 'Y' THEN 
                           LET g_xrce2_d[l_ac].xrce133 = r_xrce_w.xrce133
                           LET g_xrce2_d[l_ac].xrce134 = r_xrce_w.xrce134
                           LET g_xrce2_d[l_ac].xrce139 = r_xrce_w.xrce139
                        END IF
                     ELSE
                     #部分冲销
                        IF l_oodb005 = 'Y' THEN
                           LET g_xrce_d[l_ac].xrce103 = g_xrce_d[l_ac].xrce109 - g_xrce_d[l_ac].xrce104
                           LET g_xrce_d[l_ac].xrce114 = g_xrce_d[l_ac].xrce104 * g_xrce_d[l_ac].xrce101
                           CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa001,g_xrce_d[l_ac].xrce114,2)
                               RETURNING l_success,g_errno,g_xrce_d[l_ac].xrce114
                           LET g_xrce_d[l_ac].xrce113 = g_xrce_d[l_ac].xrce119 - g_xrce_d[l_ac].xrce114
                           IF g_glaa_t.glaa015 = 'Y' THEN
                              IF g_glaa_t.glaa017='1' THEN
                                 LET g_xrce2_d[l_ac].xrce124 = g_xrce_d[l_ac].xrce104 * g_xrce2_d[l_ac].xrce121
                              ELSE
                                 LET g_xrce2_d[l_ac].xrce124 = g_xrce_d[l_ac].xrce114 * g_xrce2_d[l_ac].xrce121
                              END IF
                              CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa016,g_xrce2_d[l_ac].xrce124,2)
                                  RETURNING l_success,g_errno,g_xrce2_d[l_ac].xrce124
                              LET g_xrce2_d[l_ac].xrce123 = g_xrce2_d[l_ac].xrce129 - g_xrce2_d[l_ac].xrce124
                           END IF
                           IF g_glaa_t.glaa019 = 'Y' THEN
                              IF g_glaa_t.glaa021='1' THEN
                                 LET g_xrce2_d[l_ac].xrce134 = g_xrce_d[l_ac].xrce104 * g_xrce2_d[l_ac].xrce131
                              ELSE
                                 LET g_xrce2_d[l_ac].xrce134 = g_xrce_d[l_ac].xrce114 * g_xrce2_d[l_ac].xrce131
                              END IF
                              CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa020,g_xrce2_d[l_ac].xrce134,2)
                                  RETURNING l_success,g_errno,g_xrce2_d[l_ac].xrce134
                              LET g_xrce2_d[l_ac].xrce133 = g_xrce2_d[l_ac].xrce139 - g_xrce2_d[l_ac].xrce134
                           END IF
                        ELSE
                           LET g_xrce_d[l_ac].xrce109 = g_xrce_d[l_ac].xrce103 + g_xrce_d[l_ac].xrce104
                           LET g_xrce_d[l_ac].xrce114 = g_xrce_d[l_ac].xrce104 * g_xrce_d[l_ac].xrce101
                           CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa001,g_xrce_d[l_ac].xrce114,2)
                               RETURNING l_success,g_errno,g_xrce_d[l_ac].xrce114
                           LET g_xrce_d[l_ac].xrce119 = g_xrce_d[l_ac].xrce113 + g_xrce_d[l_ac].xrce114
                           IF g_glaa_t.glaa015 = 'Y' THEN
                              IF g_glaa_t.glaa017='1' THEN
                                 LET g_xrce2_d[l_ac].xrce124 = g_xrce_d[l_ac].xrce104 * g_xrce2_d[l_ac].xrce121
                              ELSE
                                 LET g_xrce2_d[l_ac].xrce124 = g_xrce_d[l_ac].xrce114 * g_xrce2_d[l_ac].xrce121
                              END IF
                              CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa016,g_xrce2_d[l_ac].xrce124,2)
                                  RETURNING l_success,g_errno,g_xrce2_d[l_ac].xrce124
                              LET g_xrce2_d[l_ac].xrce129 = g_xrce2_d[l_ac].xrce123 + g_xrce2_d[l_ac].xrce124
                           END IF
                           IF g_glaa_t.glaa019 = 'Y' THEN
                              IF g_glaa_t.glaa021='1' THEN
                                 LET g_xrce2_d[l_ac].xrce134 = g_xrce_d[l_ac].xrce104 * g_xrce2_d[l_ac].xrce131
                              ELSE
                                 LET g_xrce2_d[l_ac].xrce134 = g_xrce_d[l_ac].xrce114 * g_xrce2_d[l_ac].xrce131
                              END IF
                              CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa020,g_xrce2_d[l_ac].xrce134,2)
                                  RETURNING l_success,g_errno,g_xrce2_d[l_ac].xrce134
                              LET g_xrce2_d[l_ac].xrce139 = g_xrce2_d[l_ac].xrce133 + g_xrce2_d[l_ac].xrce134
                           END IF
                        END IF
                     END IF
                  END IF
               END IF
            END IF
            #160628-00002#1--add--end
            LET g_xrce_d_o.* = g_xrce_d[l_ac].*   #160824-00007#360 20170118 add by beckxie
            LET g_xrce2_d_o.* = g_xrce2_d[l_ac].*   #160824-00007#360 20170118 add by beckxie
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce104
            #add-point:ON CHANGE xrce104 name="input.g.page1.xrce104"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce109
            #add-point:BEFORE FIELD xrce109 name="input.b.page1.xrce109"
            #160628-00002#1--add--str--
            IF g_xrce_d[l_ac].xrce027 = 'Y' THEN
               SELECT xrca011 INTO l_xrca011 FROM xrca_t 
               WHERE xrcaent=g_enterprise AND xrcald=g_xrca_t.xrcald AND xrcadocno=g_xrce_d[l_ac].xrce003
               #根據單身稅別-含稅否 
               CALL s_tax_chk(g_glaa_t.glaacomp,l_xrca011) 
                   RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
            END IF
            #160628-00002#1--add--end
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce109
            
            #add-point:AFTER FIELD xrce109 name="input.a.page1.xrce109"
#160628-00002#1--mark--str--
#            IF NOT cl_null(g_xrce_d[l_ac].xrce101) AND NOT cl_null(g_xrce_d[l_ac].xrce109) THEN
#               
#               LET g_xrce_d[l_ac].xrce119 = g_xrce_d[l_ac].xrce109 * g_xrce_d[l_ac].xrce101
#              #LET g_xrce_d[l_ac].xrce119 = s_curr_round(g_glaa_t.glaacomp,g_glaa_t.glaa001,g_xrce_d[l_ac].xrce119,2)     #150821-00002#1 Mark
#               #150821-00002#1 Add ---(S)---
#               SELECT glaa001 INTO l_glaa001 FROM glaa_t WHERE glaaent = g_enterprise
#                 #AND glaald = g_xrca_m.xrcald   #150909 mark
#                  AND glaald = g_xrca_t.xrcald   #150909 
#                CALL s_curr_round_ld('1',g_xrca_t.xrcald,l_glaa001,g_xrce_d[l_ac].xrce119,2)
#                   RETURNING l_success,g_errno,g_xrce_d[l_ac].xrce119
#               #150821-00002#1 Add ---(E)---
#               DISPLAY g_xrce_d[l_ac].xrce119 TO s_detail1[l_ac].xrce119
#               IF g_glaa_t.glaa015 = 'Y' THEN
#               LET g_xrce2_d[l_ac].xrce129 = g_xrce_d[l_ac].xrce109 * g_xrce2_d[l_ac].xrce121
#              #LET g_xrce2_d[l_ac].xrce129 = s_curr_round(g_glaa_t.glaacomp,g_xrce2_d[l_ac].xrce120,g_xrce2_d[l_ac].xrce121,2)     #150821-00002#1 Mark
#               CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa016,g_xrce2_d[l_ac].xrce121,2)
#                   RETURNING l_success,g_errno,g_xrce2_d[l_ac].xrce121   #150821-00002#1 Add
#               END IF
#               IF g_glaa_t.glaa015 = 'Y' THEN
#               LET g_xrce2_d[l_ac].xrce139 = g_xrce_d[l_ac].xrce109 * g_xrce2_d[l_ac].xrce131
#              #LET g_xrce2_d[l_ac].xrce139 = s_curr_round(g_glaa_t.glaacomp,g_xrce2_d[l_ac].xrce130,g_xrce2_d[l_ac].xrce131,2)     #150821-00002#1 Mark
#               CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa020,g_xrce2_d[l_ac].xrce131,2)
#                   RETURNING l_success,g_errno,g_xrce2_d[l_ac].xrce131   #150821-00002#1 Add
#               END IF
#            END IF
#160628-00002#1--mark--end
           
           #160420-00001#1 Mark ---(S)---
           #IF NOT cl_null(g_xrce_d[l_ac].xrce109) AND NOT cl_null(g_xrce_d[l_ac].xrce003) AND g_xrce_d[l_ac].xrce002 = '10' THEN
           #   CALL axrt300_02_chk_xrde109()
           #   IF NOT cl_null(g_errno) THEN
           #      LET l_xrce109 = g_xrce_d[l_ac].xrce109
           #      IF l_cmd = 'a' THEN
           #         LET g_xrce_d[l_ac].xrce109 = 0
           #         LET g_xrce_d[l_ac].xrce119 = 0    #20150924 add lujh
           #      ELSE
           #         LET g_xrce_d[l_ac].xrce109 = g_xrce_d_t.xrce109
           #         LET g_xrce_d[l_ac].xrce119 = g_xrce_d_t.xrce119   #20150924 add lujh
           #      END IF
           #      DISPLAY g_xrce_d[l_ac].xrce109 TO s_detail1[l_ac].xrce109
           #      INITIALIZE g_errparam TO NULL
           #      LET g_errparam.code = g_errno
           #      LET g_errparam.extend = l_xrce109
           #      LET g_errparam.popup = TRUE
           #      CALL cl_err()
           #
           #      NEXT FIELD xrce109
           #   END IF
           #END IF
           #160420-00001#1 Mark ---(E)---
            
            IF NOT cl_null(g_xrce_d[l_ac].xrce109) AND NOT cl_null(g_xrce_d[l_ac].xrce003)  
               AND (g_xrce_d[l_ac].xrce002 = '31' OR g_xrce_d[l_ac].xrce002 = '32') THEN
#               CALL axrt300_02_chk_xrce109() #160628-00002#1 mark
#               IF NOT cl_null(g_errno) THEN  #160628-00002#1 mark
               IF g_xrce_d[l_ac].xrce109 > r_xrce_w.xrce109 THEN #160628-00002#1 add
                  LET l_xrce109 = g_xrce_d[l_ac].xrce109
                  #160628-00002#1--add--str--
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'axr-00054'  
                  LET g_errparam.extend = g_xrce_d[l_ac].xrce109,'>',r_xrce_w.xrce109 
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  #160628-00002#1--add--end
                  IF l_cmd = 'a' THEN
                     LET g_xrce_d[l_ac].xrce109 = 0
                     LET g_xrce_d[l_ac].xrce119 = 0    #20150924 add lujh
                  ELSE
                     LET g_xrce_d[l_ac].xrce109 = g_xrce_d_t.xrce109
                     LET g_xrce_d[l_ac].xrce119 = g_xrce_d_t.xrce119   #20150924 add lujh
                  END IF
                  DISPLAY g_xrce_d[l_ac].xrce109 TO s_detail1[l_ac].xrce109
                  #160628-00002#1--mark--str--
#                  INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = g_errno     
#                  LET g_errparam.extend = l_xrce109 
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()
                  #160628-00002#1--mark--end
                  NEXT FIELD xrce109
               END IF
               #160628-00002#1--add--str--
               IF g_xrce_d[l_ac].xrce027 = 'Y' THEN
                  IF g_xrce_d[l_ac].xrce109 = r_xrce_w.xrce109 THEN
                     #当含税金额全部冲抵时，未税金额和税额也要全部冲抵
                     #carol.wu 170222 原單的未沖金額, 是不能修改的, 只能帶出來
                    #LET g_xrce_d[l_ac].xrce103 = r_xrce_w.xrce103 #170221-00054#1 mark
                     LET g_xrce_d[l_ac].xrce104 = r_xrce_w.xrce104
                    #LET g_xrce_d[l_ac].xrce113 = r_xrce_w.xrce113 #170221-00054#1 mark
                     LET g_xrce_d[l_ac].xrce114 = r_xrce_w.xrce114
                     LET g_xrce_d[l_ac].xrce119 = r_xrce_w.xrce119
                    #LET g_xrce2_d[l_ac].xrce123 = r_xrce_w.xrce123 #170221-00054#1 mark
                     LET g_xrce2_d[l_ac].xrce124 = r_xrce_w.xrce124
                     LET g_xrce2_d[l_ac].xrce129 = r_xrce_w.xrce129
                    #LET g_xrce2_d[l_ac].xrce133 = r_xrce_w.xrce133 #170221-00054#1 mark
                     LET g_xrce2_d[l_ac].xrce134 = r_xrce_w.xrce134
                     LET g_xrce2_d[l_ac].xrce139 = r_xrce_w.xrce139
                     CALL cl_set_comp_entry("xrce103,xrce104,xrce113,xrce114,xrce123,xrce124,xrce133,xrce134",FALSE)
                  ELSE
                     #当含税部分冲抵时，根据单价是否含税计算未税金额和税额
                    #CALL cl_set_comp_entry("xrce103,xrce104,xrce113,xrce114,xrce123,xrce124,xrce133,xrce134",TRUE)  #170221-00054#1 mark
                     CALL cl_set_comp_entry("xrce103,xrce104,xrce113,xrce114,xrce123,xrce124,xrce133,xrce134",FALSE) #170221-00054#1
                     IF l_oodb005 = 'Y' THEN
                        CALL s_tax_ins(g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004,0,g_glaa_t.glaacomp,
                                       g_xrce_d[l_ac].xrce109,l_xrca011,
                                       1,g_xrce_d[l_ac].xrce100,g_xrce_d[l_ac].xrce101,g_xrce_d[l_ac].xrceld,g_xrce2_d[l_ac].xrce121,g_xrce2_d[l_ac].xrce131)
                          #170221-00054#1 mark ------
                          #RETURNING g_xrce_d[l_ac].xrce103,g_xrce_d[l_ac].xrce104,g_xrce_d[l_ac].xrce109,
                          #          g_xrce_d[l_ac].xrce113,g_xrce_d[l_ac].xrce114,g_xrce_d[l_ac].xrce119,
                          #          g_xrce2_d[l_ac].xrce123,g_xrce2_d[l_ac].xrce124,g_xrce2_d[l_ac].xrce129,
                          #          g_xrce2_d[l_ac].xrce133,g_xrce2_d[l_ac].xrce134,g_xrce2_d[l_ac].xrce139
                          #170221-00054#1 mark end---
                          #170221-00054#1 add ------
                          RETURNING r_xrce_w.xrce103,g_xrce_d[l_ac].xrce104,g_xrce_d[l_ac].xrce109,
                                    r_xrce_w.xrce113,g_xrce_d[l_ac].xrce114,g_xrce_d[l_ac].xrce119,
                                    r_xrce_w.xrce123,g_xrce2_d[l_ac].xrce124,g_xrce2_d[l_ac].xrce129,
                                    r_xrce_w.xrce133,g_xrce2_d[l_ac].xrce134,g_xrce2_d[l_ac].xrce139
                          #170221-00054#1 add end---
                        IF g_xrce_d[l_ac].xrce100 = g_glaa_t.glaa001 THEN
                           LET g_xrce_d[l_ac].xrce113=g_xrce_d[l_ac].xrce103
                           LET g_xrce_d[l_ac].xrce114=g_xrce_d[l_ac].xrce104
                           LET g_xrce_d[l_ac].xrce119=g_xrce_d[l_ac].xrce109
                        END IF
                     ELSE
                        LET g_xrce_d[l_ac].xrce104 = g_xrce_d[l_ac].xrce109 - g_xrce_d[l_ac].xrce103
                        #本币
                        LET g_xrce_d[l_ac].xrce119 = g_xrce_d[l_ac].xrce109 * g_xrce_d[l_ac].xrce101
                        CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa001,g_xrce_d[l_ac].xrce119,2)
                           RETURNING l_success,g_errno,g_xrce_d[l_ac].xrce119
                        LET g_xrce_d[l_ac].xrce114 = g_xrce_d[l_ac].xrce119 - g_xrce_d[l_ac].xrce113
                        #本位币二
                        IF g_glaa_t.glaa015 = 'Y' THEN
                           IF g_glaa_t.glaa017='1' THEN
                              LET g_xrce2_d[l_ac].xrce129 = g_xrce_d[l_ac].xrce109 * g_xrce2_d[l_ac].xrce121
                           ELSE
                              LET g_xrce2_d[l_ac].xrce129 = g_xrce_d[l_ac].xrce119 * g_xrce2_d[l_ac].xrce121
                           END IF
                           CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa016,g_xrce2_d[l_ac].xrce129,2)
                               RETURNING l_success,g_errno,g_xrce2_d[l_ac].xrce129   
                           LET g_xrce2_d[l_ac].xrce124 = g_xrce2_d[l_ac].xrce129 - g_xrce2_d[l_ac].xrce123
                        END IF
                        #本位币三
                        IF g_glaa_t.glaa019 = 'Y' THEN
                           IF g_glaa_t.glaa021 = '1' THEN
                              LET g_xrce2_d[l_ac].xrce139 = g_xrce_d[l_ac].xrce109 * g_xrce2_d[l_ac].xrce131
                           ELSE
                              LET g_xrce2_d[l_ac].xrce139 = g_xrce_d[l_ac].xrce119 * g_xrce2_d[l_ac].xrce131
                           END IF
                           CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa020,g_xrce2_d[l_ac].xrce139,2)
                               RETURNING l_success,g_errno,g_xrce2_d[l_ac].xrce139
                           LET g_xrce2_d[l_ac].xrce134 = g_xrce2_d[l_ac].xrce139 - g_xrce2_d[l_ac].xrce133
                        END IF
                     END IF
                  END IF
               ELSE
                  #非应税折抵时，未税金额=含税金额，税额=0，且不可录入
                  #carol.wu:不可異動原單據金額
                  #LET g_xrce_d[l_ac].xrce103 = g_xrce_d[l_ac].xrce109 #170221-00054#1 mark
                  LET g_xrce_d[l_ac].xrce104 = 0
                  #本币
                  LET g_xrce_d[l_ac].xrce119 = g_xrce_d[l_ac].xrce109 * g_xrce_d[l_ac].xrce101
                  CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa001,g_xrce_d[l_ac].xrce119,2)
                      RETURNING l_success,g_errno,g_xrce_d[l_ac].xrce119
                  #LET g_xrce_d[l_ac].xrce113 = g_xrce_d[l_ac].xrce119 #170221-00054#1 mark
                  LET g_xrce_d[l_ac].xrce114 = 0
                  #本位币二
                 IF g_glaa_t.glaa015 = 'Y' THEN
                    IF g_glaa_t.glaa017='1' THEN
                       LET g_xrce2_d[l_ac].xrce129 = g_xrce_d[l_ac].xrce109 * g_xrce2_d[l_ac].xrce121
                    ELSE
                       LET g_xrce2_d[l_ac].xrce129 = g_xrce_d[l_ac].xrce119 * g_xrce2_d[l_ac].xrce121
                    END IF
                    CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa016,g_xrce2_d[l_ac].xrce129,2)
                        RETURNING l_success,g_errno,g_xrce2_d[l_ac].xrce129
                     LET g_xrce2_d[l_ac].xrce123 = g_xrce2_d[l_ac].xrce129
                     LET g_xrce2_d[l_ac].xrce124 = 0
                  END IF
                  #本位币三
                  IF g_glaa_t.glaa019 = 'Y' THEN
                     IF g_glaa_t.glaa021 = '1' THEN
                        LET g_xrce2_d[l_ac].xrce139 = g_xrce_d[l_ac].xrce109 * g_xrce2_d[l_ac].xrce131
                     ELSE
                        LET g_xrce2_d[l_ac].xrce139 = g_xrce_d[l_ac].xrce119 * g_xrce2_d[l_ac].xrce131
                     END IF
                     CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa020,g_xrce2_d[l_ac].xrce139,2)
                         RETURNING l_success,g_errno,g_xrce2_d[l_ac].xrce139
                     LET g_xrce2_d[l_ac].xrce133 = g_xrce2_d[l_ac].xrce139
                     LET g_xrce2_d[l_ac].xrce134 = 0
                  END IF
               END IF
               #160628-00002#1--add--end
            END IF
            
            #------------------------------
#            IF NOT cl_null(g_xrce_d[l_ac].xrce109) AND NOT cl_null(g_xrce_d[l_ac].xrce003) AND g_xrce_d[l_ac].xrce002 = '10' THEN
#               CALL axrt300_02_chk_xrce109()
#               IF NOT cl_null(g_errno) THEN
#                  IF l_cmd = 'a' THEN
#                     DISPLAY 0 TO s_detail1[l_ac].xrce109
#                  ELSE
#                     DISPLAY g_xrce_t.xrce109 TO s_detail1[l_ac].xrce109
#                  END IF
#                  INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = g_errno
#                  LET g_errparam.extend = g_xrce_d[l_ac].xrce109
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()
#
#                  IF l_cmd = 'a' THEN
#                     LET g_xrce_d[l_ac].xrce109 = 0
#                  ELSE
#                     LET g_xrce_d[l_ac].xrce109 = g_xrce_t.xrce109
#                  END IF
#                  DISPLAY g_xrce_d[l_ac].xrce109 TO s_detail1[l_ac].xrce109
#                  NEXT FIELD xrce109
#               END IF
#            END IF
#            IF NOT cl_null(g_xrce_d[l_ac].xrce101) AND NOT cl_null(g_xrce_d[l_ac].xrce109) THEN
#               LET g_xrce_d[l_ac].xrce119 = g_xrce_d[l_ac].xrce109 * g_xrce_d[l_ac].xrce101
#               LET g_xrce_d[l_ac].xrce119 = s_curr_round(g_glaa_t.glaacomp,g_glaa_t.glaa001,g_xrce_d[l_ac].xrce119,2)
#               DISPLAY g_xrce_d[l_ac].xrce119 TO s_detail1[l_ac].xrce119
#               IF g_glaa_t.glaa015 = 'Y' THEN
#               LET g_xrce2_d[l_ac].xrce129 = g_xrce_d[l_ac].xrce109 * g_xrce2_d[l_ac].xrce121
#               LET g_xrce2_d[l_ac].xrce129 = s_curr_round(g_glaa_t.glaacomp,g_xrce2_d[l_ac].xrce120,g_xrce2_d[l_ac].xrce121,2)
#               END IF
#               IF g_glaa_t.glaa015 = 'Y' THEN
#               LET g_xrce2_d[l_ac].xrce139 = g_xrce_d[l_ac].xrce109 * g_xrce2_d[l_ac].xrce131
#               LET g_xrce2_d[l_ac].xrce139 = s_curr_round(g_glaa_t.glaacomp,g_xrce2_d[l_ac].xrce130,g_xrce2_d[l_ac].xrce131,2)
#               END IF
#            END IF
#            IF NOT cl_null(g_xrce_d[l_ac].xrce109) AND NOT cl_null(g_xrce_d[l_ac].xrce024) AND g_xrce_d[l_ac].xrce002 = '31' THEN
#               CALL axrt300_02_chk_xrce109_1()
#               IF NOT cl_null(g_errno) THEN
#                  IF l_cmd = 'a' THEN
#                     DISPLAY 0 TO s_detail1[l_ac].xrce109
#                  ELSE
#                     DISPLAY g_xrce_t.xrce109 TO s_detail1[l_ac].xrce109
#                  END IF
#                  INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = g_errno
#                  LET g_errparam.extend = g_xrce_d[l_ac].xrce109
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()
#
#                  IF l_cmd = 'a' THEN
#                     LET g_xrce_d[l_ac].xrce109 = 0
#                  ELSE
#                     LET g_xrce_d[l_ac].xrce109 = g_xrce_t.xrce109
#                  END IF
#                  DISPLAY g_xrce_d[l_ac].xrce109 TO s_detail1[l_ac].xrce109
#                  NEXT FIELD xrce109
#               END IF
#            END IF
#            IF NOT cl_null(g_xrce3_d[l_ac].xrce101) AND NOT cl_null(g_xrce_d[l_ac].xrce109) THEN
#               LET g_xrce3_d[l_ac].xrce119 = g_xrce_d[l_ac].xrce109 * g_xrce3_d[l_ac].xrce101
#               DISPLAY g_xrce3_d[l_ac].xrce119 TO s_detail3[l_ac].xrce119_1
#            END IF
#            LET g_xrce_t.xrce109 = g_xrce_d[l_ac].xrce109
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce109
            #add-point:ON CHANGE xrce109 name="input.g.page1.xrce109"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce113
            #add-point:BEFORE FIELD xrce113 name="input.b.page1.xrce113"
            #160628-00002#1--add--str--
            IF g_xrce_d[l_ac].xrce027 = 'Y' THEN
               SELECT xrca011 INTO l_xrca011 FROM xrca_t 
               WHERE xrcaent=g_enterprise AND xrcald=g_xrca_t.xrcald AND xrcadocno=g_xrce_d[l_ac].xrce003
               #根據單身稅別-含稅否 
               CALL s_tax_chk(g_glaa_t.glaacomp,l_xrca011) 
                   RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
            END IF
            #160628-00002#1--add--end
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce113
            
            #add-point:AFTER FIELD xrce113 name="input.a.page1.xrce113"
            #160628-00002#1--add--str--
            IF NOT cl_null(g_xrce_d[l_ac].xrce113) THEN
               #IF l_cmd='a' OR (l_cmd='u' AND g_xrce_d[l_ac].xrce113 <> g_xrce_d_t.xrce113) THEN   #160824-00007#360 20170118 mark by beckxie
               IF g_xrce_d[l_ac].xrce113 <> g_xrce_d_o.xrce113 OR cl_null(g_xrce_d_o.xrce113) THEN   #160824-00007#360 20170118 add by beckxie
                  IF g_xrce_d[l_ac].xrce113 > r_xrce_w.xrce113 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'axr-00054'
                     LET g_errparam.extend = g_xrce_d[l_ac].xrce113,'>', r_xrce_w.xrce113
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     #LET g_xrce_d[l_ac].xrce113 = g_xrce_d_t.xrce113   #160824-00007#360 20170118 mark by beckxie
                     #160824-00007#360 20170118 add by beckxie---S
                     LET g_xrce_d[l_ac].xrce103 = g_xrce_d_o.xrce103   
                     LET g_xrce_d[l_ac].xrce104 = g_xrce_d_o.xrce104
                     LET g_xrce_d[l_ac].xrce109 = g_xrce_d_o.xrce109
                     LET g_xrce_d[l_ac].xrce113 = g_xrce_d_o.xrce113
                     LET g_xrce_d[l_ac].xrce114 = g_xrce_d_o.xrce114
                     LET g_xrce_d[l_ac].xrce119 = g_xrce_d_o.xrce119
                     LET g_xrce2_d[l_ac].xrce123= g_xrce2_d_o.xrce123
                     LET g_xrce2_d[l_ac].xrce124= g_xrce2_d_o.xrce124
                     LET g_xrce2_d[l_ac].xrce129= g_xrce2_d_o.xrce129
                     LET g_xrce2_d[l_ac].xrce133= g_xrce2_d_o.xrce133
                     LET g_xrce2_d[l_ac].xrce134= g_xrce2_d_o.xrce134
                     LET g_xrce2_d[l_ac].xrce139= g_xrce2_d_o.xrce139
                     #160824-00007#360 20170118 add by beckxie---E
                     NEXT FIELD xrce113
                  END IF
                  IF g_xrce_d[l_ac].xrce027 = 'Y' THEN
                     #全部冲销
                     IF g_xrce_d[l_ac].xrce113 = r_xrce_w.xrce113 THEN
                        LET g_xrce_d[l_ac].xrce114 = r_xrce_w.xrce114
                        LET g_xrce_d[l_ac].xrce119 = r_xrce_w.xrce119
                        LET g_xrce_d[l_ac].xrce103 = r_xrce_w.xrce103
                        LET g_xrce_d[l_ac].xrce104 = r_xrce_w.xrce104
                        LET g_xrce_d[l_ac].xrce109 = r_xrce_w.xrce109
                        IF g_glaa_t.glaa015='Y' THEN
                           LET g_xrce2_d[l_ac].xrce123 = r_xrce_w.xrce123
                           LET g_xrce2_d[l_ac].xrce124 = r_xrce_w.xrce124
                           LET g_xrce2_d[l_ac].xrce129 = r_xrce_w.xrce129
                        END IF
                        IF g_glaa_t.glaa019='Y' THEN
                           LET g_xrce2_d[l_ac].xrce133 = r_xrce_w.xrce133
                           LET g_xrce2_d[l_ac].xrce134 = r_xrce_w.xrce134
                           LET g_xrce2_d[l_ac].xrce139 = r_xrce_w.xrce139
                        END IF
                     ELSE
                     #部分冲销
                        IF l_oodb005 = 'Y' THEN
                           LET g_xrce_d[l_ac].xrce114 = g_xrce_d[l_ac].xrce119 - g_xrce_d[l_ac].xrce113
                           #原币
                           LET g_xrce_d[l_ac].xrce104 = g_xrce_d[l_ac].xrce114 / g_xrce_d[l_ac].xrce101
                           CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_xrce_d[l_ac].xrce100,g_xrce_d[l_ac].xrce104,2)
                                 RETURNING l_success,g_errno,g_xrce_d[l_ac].xrce104
                           #LET g_xrce_d[l_ac].xrce103 = g_xrce_d[l_ac].xrce109 - g_xrce_d[l_ac].xrce104 #170221-00054#1 mark
                           #本位币二
                           IF g_glaa_t.glaa015 = 'Y' THEN
                              IF g_glaa_t.glaa017='1' THEN
                                 LET g_xrce2_d[l_ac].xrce124 = g_xrce_d[l_ac].xrce104 * g_xrce2_d[l_ac].xrce121
                              ELSE
                                 LET g_xrce2_d[l_ac].xrce124 = g_xrce_d[l_ac].xrce114 * g_xrce2_d[l_ac].xrce121
                              END IF
                              CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa016,g_xrce2_d[l_ac].xrce124,2)
                                 RETURNING l_success,g_errno,g_xrce2_d[l_ac].xrce124
                              LET g_xrce2_d[l_ac].xrce123 = g_xrce2_d[l_ac].xrce129 - g_xrce2_d[l_ac].xrce124
                           END IF
                           #本位币三
                           IF g_glaa_t.glaa019 = 'Y' THEN
                              IF g_glaa_t.glaa021='1' THEN
                                 LET g_xrce2_d[l_ac].xrce134 = g_xrce_d[l_ac].xrce104 * g_xrce2_d[l_ac].xrce131
                              ELSE
                                 LET g_xrce2_d[l_ac].xrce134 = g_xrce_d[l_ac].xrce114 * g_xrce2_d[l_ac].xrce131
                              END IF
                              CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa020,g_xrce2_d[l_ac].xrce134,2)
                                 RETURNING l_success,g_errno,g_xrce2_d[l_ac].xrce134
                              LET g_xrce2_d[l_ac].xrce133 = g_xrce2_d[l_ac].xrce139 - g_xrce2_d[l_ac].xrce134
                           END IF
                        ELSE
                           LET g_xrce_d[l_ac].xrce119 = g_xrce_d[l_ac].xrce113 + g_xrce_d[l_ac].xrce114
                           #carol.wu:不要再回算
                           #170221-00054#1 mark ------
                           ##原币
                           #LET g_xrce_d[l_ac].xrce103 = g_xrce_d[l_ac].xrce113 / g_xrce_d[l_ac].xrce101
                           #CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_xrce_d[l_ac].xrce100,g_xrce_d[l_ac].xrce103,2)
                           #      RETURNING l_success,g_errno,g_xrce_d[l_ac].xrce103
                           #LET g_xrce_d[l_ac].xrce109 = g_xrce_d[l_ac].xrce103 + g_xrce_d[l_ac].xrce104
                           ##本位币二
                           #IF g_glaa_t.glaa015 = 'Y' THEN
                           #   IF g_glaa_t.glaa017='1' THEN
                           #      LET g_xrce2_d[l_ac].xrce123 = g_xrce_d[l_ac].xrce103 * g_xrce2_d[l_ac].xrce121
                           #   ELSE
                           #      LET g_xrce2_d[l_ac].xrce123 = g_xrce_d[l_ac].xrce113 * g_xrce2_d[l_ac].xrce121
                           #   END IF
                           #   CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa016,g_xrce2_d[l_ac].xrce123,2)
                           #      RETURNING l_success,g_errno,g_xrce2_d[l_ac].xrce123
                           #   LET g_xrce2_d[l_ac].xrce129 = g_xrce2_d[l_ac].xrce123 + g_xrce2_d[l_ac].xrce124
                           #END IF
                           ##本位币三
                           #IF g_glaa_t.glaa019 = 'Y' THEN
                           #   IF g_glaa_t.glaa021='1' THEN
                           #      LET g_xrce2_d[l_ac].xrce133 = g_xrce_d[l_ac].xrce103 * g_xrce2_d[l_ac].xrce131
                           #   ELSE
                           #      LET g_xrce2_d[l_ac].xrce133 = g_xrce_d[l_ac].xrce113 * g_xrce2_d[l_ac].xrce131
                           #   END IF
                           #   CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa020,g_xrce2_d[l_ac].xrce133,2)
                           #      RETURNING l_success,g_errno,g_xrce2_d[l_ac].xrce133
                           #   LET g_xrce2_d[l_ac].xrce139 = g_xrce2_d[l_ac].xrce133 + g_xrce2_d[l_ac].xrce134
                           #END IF
                           #170221-00054#1 mark end---
                        END IF
                     END IF 
                  END IF   
               END IF
            END IF
            #160628-00002#1--add--end
            LET g_xrce_d_o.* = g_xrce_d[l_ac].*   #160824-00007#360 20170118 add by beckxie
            LET g_xrce2_d_o.* = g_xrce2_d[l_ac].*   #160824-00007#360 20170118 add by beckxie
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce113
            #add-point:ON CHANGE xrce113 name="input.g.page1.xrce113"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce114
            #add-point:BEFORE FIELD xrce114 name="input.b.page1.xrce114"
            #160628-00002#1--add--str--
            IF g_xrce_d[l_ac].xrce027 = 'Y' THEN
               SELECT xrca011 INTO l_xrca011 FROM xrca_t 
               WHERE xrcaent=g_enterprise AND xrcald=g_xrca_t.xrcald AND xrcadocno=g_xrce_d[l_ac].xrce003
               #根據單身稅別-含稅否 
               CALL s_tax_chk(g_glaa_t.glaacomp,l_xrca011) 
                   RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
            END IF
            #160628-00002#1--add--end
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce114
            
            #add-point:AFTER FIELD xrce114 name="input.a.page1.xrce114"
            #160628-00002#1--add--str--
            IF NOT cl_null(g_xrce_d[l_ac].xrce114) THEN
               #IF l_cmd='a' OR (l_cmd='u' AND g_xrce_d[l_ac].xrce114 <> g_xrce_d_t.xrce114) THEN   #160824-00007#360 20170118 mark by beckxie
               IF g_xrce_d[l_ac].xrce114 <> g_xrce_d_o.xrce114 OR cl_null(g_xrce_d_o.xrce114) THEN   #160824-00007#360 20170118 add by beckxie
                  IF g_xrce_d[l_ac].xrce114 > r_xrce_w.xrce114 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'axr-00054'
                     LET g_errparam.extend = g_xrce_d[l_ac].xrce114,'>', r_xrce_w.xrce114
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     #LET g_xrce_d[l_ac].xrce114 = g_xrce_d_t.xrce114   #160824-00007#360 20170118 mark by beckxie
                     #160824-00007#360 20170118 add by beckxie---S
                     LET g_xrce_d[l_ac].xrce103 = g_xrce_d_o.xrce103   
                     LET g_xrce_d[l_ac].xrce104 = g_xrce_d_o.xrce104
                     LET g_xrce_d[l_ac].xrce109 = g_xrce_d_o.xrce109
                     LET g_xrce_d[l_ac].xrce113 = g_xrce_d_o.xrce113
                     LET g_xrce_d[l_ac].xrce114 = g_xrce_d_o.xrce114
                     LET g_xrce_d[l_ac].xrce119 = g_xrce_d_o.xrce119
                     LET g_xrce2_d[l_ac].xrce123= g_xrce2_d_o.xrce123
                     LET g_xrce2_d[l_ac].xrce124= g_xrce2_d_o.xrce124
                     LET g_xrce2_d[l_ac].xrce129= g_xrce2_d_o.xrce129
                     LET g_xrce2_d[l_ac].xrce133= g_xrce2_d_o.xrce133
                     LET g_xrce2_d[l_ac].xrce134= g_xrce2_d_o.xrce134
                     LET g_xrce2_d[l_ac].xrce139= g_xrce2_d_o.xrce139
                     #160824-00007#360 20170118 add by beckxie---E
                     NEXT FIELD xrce114
                  END IF
                  IF g_xrce_d[l_ac].xrce027 = 'Y' THEN
                     #全部冲销
                     IF g_xrce_d[l_ac].xrce114 = r_xrce_w.xrce114 THEN
                        LET g_xrce_d[l_ac].xrce113 = r_xrce_w.xrce113
                        LET g_xrce_d[l_ac].xrce119 = r_xrce_w.xrce119
                        LET g_xrce_d[l_ac].xrce103 = r_xrce_w.xrce103
                        LET g_xrce_d[l_ac].xrce104 = r_xrce_w.xrce104
                        LET g_xrce_d[l_ac].xrce109 = r_xrce_w.xrce109
                        IF g_glaa_t.glaa015='Y' THEN
                           LET g_xrce2_d[l_ac].xrce123 = r_xrce_w.xrce123
                           LET g_xrce2_d[l_ac].xrce124 = r_xrce_w.xrce124
                           LET g_xrce2_d[l_ac].xrce129 = r_xrce_w.xrce129
                        END IF
                        IF g_glaa_t.glaa019='Y' THEN
                           LET g_xrce2_d[l_ac].xrce133 = r_xrce_w.xrce133
                           LET g_xrce2_d[l_ac].xrce134 = r_xrce_w.xrce134
                           LET g_xrce2_d[l_ac].xrce139 = r_xrce_w.xrce139
                        END IF
                     ELSE
                     #部分冲销
                        IF l_oodb005 = 'Y' THEN
                           LET g_xrce_d[l_ac].xrce113 = g_xrce_d[l_ac].xrce119 - g_xrce_d[l_ac].xrce114
                           #原币
                           LET g_xrce_d[l_ac].xrce104 = g_xrce_d[l_ac].xrce114 / g_xrce_d[l_ac].xrce101
                           CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_xrce_d[l_ac].xrce100,g_xrce_d[l_ac].xrce104,2)
                                 RETURNING l_success,g_errno,g_xrce_d[l_ac].xrce104
                           LET g_xrce_d[l_ac].xrce103 = g_xrce_d[l_ac].xrce109 - g_xrce_d[l_ac].xrce104
                           #本位币二
                           IF g_glaa_t.glaa015 = 'Y' THEN
                              IF g_glaa_t.glaa017='1' THEN
                                 LET g_xrce2_d[l_ac].xrce124 = g_xrce_d[l_ac].xrce104 * g_xrce2_d[l_ac].xrce121
                              ELSE
                                 LET g_xrce2_d[l_ac].xrce124 = g_xrce_d[l_ac].xrce114 * g_xrce2_d[l_ac].xrce121
                              END IF
                              CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa016,g_xrce2_d[l_ac].xrce124,2)
                                 RETURNING l_success,g_errno,g_xrce2_d[l_ac].xrce124
                              LET g_xrce2_d[l_ac].xrce123 = g_xrce2_d[l_ac].xrce129 - g_xrce2_d[l_ac].xrce124
                           END IF
                           #本位币三
                           IF g_glaa_t.glaa019 = 'Y' THEN
                              IF g_glaa_t.glaa021='1' THEN
                                 LET g_xrce2_d[l_ac].xrce134 = g_xrce_d[l_ac].xrce104 * g_xrce2_d[l_ac].xrce131
                              ELSE
                                 LET g_xrce2_d[l_ac].xrce134 = g_xrce_d[l_ac].xrce114 * g_xrce2_d[l_ac].xrce131
                              END IF
                              CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa020,g_xrce2_d[l_ac].xrce134,2)
                                 RETURNING l_success,g_errno,g_xrce2_d[l_ac].xrce134
                              LET g_xrce2_d[l_ac].xrce133 = g_xrce2_d[l_ac].xrce139 - g_xrce2_d[l_ac].xrce134
                           END IF
                        ELSE
                           LET g_xrce_d[l_ac].xrce119 = g_xrce_d[l_ac].xrce113 + g_xrce_d[l_ac].xrce114
                           #原币
                           LET g_xrce_d[l_ac].xrce103 = g_xrce_d[l_ac].xrce113 / g_xrce_d[l_ac].xrce101
                           CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_xrce_d[l_ac].xrce100,g_xrce_d[l_ac].xrce103,2)
                                 RETURNING l_success,g_errno,g_xrce_d[l_ac].xrce103
                           LET g_xrce_d[l_ac].xrce109 = g_xrce_d[l_ac].xrce103 + g_xrce_d[l_ac].xrce104
                           #本位币二
                           IF g_glaa_t.glaa015 = 'Y' THEN
                              IF g_glaa_t.glaa017='1' THEN
                                 LET g_xrce2_d[l_ac].xrce123 = g_xrce_d[l_ac].xrce103 * g_xrce2_d[l_ac].xrce121
                              ELSE
                                 LET g_xrce2_d[l_ac].xrce123 = g_xrce_d[l_ac].xrce113 * g_xrce2_d[l_ac].xrce121
                              END IF
                              CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa016,g_xrce2_d[l_ac].xrce123,2)
                                 RETURNING l_success,g_errno,g_xrce2_d[l_ac].xrce123
                              LET g_xrce2_d[l_ac].xrce129 = g_xrce2_d[l_ac].xrce123 + g_xrce2_d[l_ac].xrce124
                           END IF
                           #本位币三
                           IF g_glaa_t.glaa019 = 'Y' THEN
                              IF g_glaa_t.glaa021='1' THEN
                                 LET g_xrce2_d[l_ac].xrce133 = g_xrce_d[l_ac].xrce103 * g_xrce2_d[l_ac].xrce131
                              ELSE
                                 LET g_xrce2_d[l_ac].xrce133 = g_xrce_d[l_ac].xrce113 * g_xrce2_d[l_ac].xrce131
                              END IF
                              CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa020,g_xrce2_d[l_ac].xrce133,2)
                                 RETURNING l_success,g_errno,g_xrce2_d[l_ac].xrce133
                              LET g_xrce2_d[l_ac].xrce139 = g_xrce2_d[l_ac].xrce133 + g_xrce2_d[l_ac].xrce134
                           END IF
                        END IF
                     END IF
                  END IF
               END IF
            END IF
            #160628-00002#1--add--end
            LET g_xrce_d_o.* = g_xrce_d[l_ac].*   #160824-00007#360 20170118 add by beckxie
            LET g_xrce2_d_o.* = g_xrce2_d[l_ac].*   #160824-00007#360 20170118 add by beckxie
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce114
            #add-point:ON CHANGE xrce114 name="input.g.page1.xrce114"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce119
            #add-point:BEFORE FIELD xrce119 name="input.b.page1.xrce119"
            #160628-00002#1--add--str--
            IF g_xrce_d[l_ac].xrce027 = 'Y' THEN
               SELECT xrca011 INTO l_xrca011 FROM xrca_t 
               WHERE xrcaent=g_enterprise AND xrcald=g_xrca_t.xrcald AND xrcadocno=g_xrce_d[l_ac].xrce003
               #根據單身稅別-含稅否 
               CALL s_tax_chk(g_glaa_t.glaacomp,l_xrca011) 
                   RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
            END IF
            #160628-00002#1--add--end
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce119
            
            #add-point:AFTER FIELD xrce119 name="input.a.page1.xrce119"
           #160420-00001#1 Mark ---(S)---
           #IF NOT cl_null(g_xrce_d[l_ac].xrce109) AND NOT cl_null(g_xrce_d[l_ac].xrce003) AND g_xrce_d[l_ac].xrce002 = '10' THEN
           #   CALL axrt300_02_chk_xrde109()
           #   IF NOT cl_null(g_errno) THEN
           #      LET l_xrce119 = g_xrce_d[l_ac].xrce119
           #      IF l_cmd = 'a' THEN
           #         LET g_xrce_d[l_ac].xrce109 = 0     #20150924 add lujh
           #         LET g_xrce_d[l_ac].xrce119 = 0
           #      ELSE
           #         LET g_xrce_d[l_ac].xrce109 = g_xrce_d_t.xrce109    #20150924 add lujh
           #         LET g_xrce_d[l_ac].xrce119 = g_xrce_d_t.xrce119
           #      END IF
           #      DISPLAY g_xrce_d[l_ac].xrce119 TO s_detail1[l_ac].xrce119
           #      INITIALIZE g_errparam TO NULL
           #      LET g_errparam.code = g_errno
           #      LET g_errparam.extend = l_xrce119
           #      LET g_errparam.popup = TRUE
           #      CALL cl_err()
           #
           #      NEXT FIELD xrce119
           #   END IF
           #END IF
           #160420-00001#1 Mark ---(E)---

#            IF NOT cl_null(g_xrce_d[l_ac].xrce109) AND NOT cl_null(g_xrce_d[l_ac].xrce003) #160628-00002#1 mark
            IF NOT cl_null(g_xrce_d[l_ac].xrce119) AND NOT cl_null(g_xrce_d[l_ac].xrce003)  #160628-00002#1 add
               AND (g_xrce_d[l_ac].xrce002 = '31' OR g_xrce_d[l_ac].xrce002 = '32') THEN
#               CALL axrt300_02_chk_xrce109() #160628-00002#1 mark
#               IF NOT cl_null(g_errno) THEN  #160628-00002#1 mark
               #160628-00002#1--add--str--
               IF g_xrce_d[l_ac].xrce119 > r_xrce_w.xrce119 THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'axr-00054'  
                  LET g_errparam.extend = g_xrce_d[l_ac].xrce119,'>',r_xrce_w.xrce119
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  #160628-00002#1--add--end
                  LET l_xrce119 = g_xrce_d[l_ac].xrce119
                  IF l_cmd = 'a' THEN
                     LET g_xrce_d[l_ac].xrce109 = 0     #20150924 add lujh
                     LET g_xrce_d[l_ac].xrce119 = 0
                  ELSE
                     LET g_xrce_d[l_ac].xrce109 = g_xrce_d_t.xrce109    #20150924 add lujh
                     LET g_xrce_d[l_ac].xrce119 = g_xrce_d_t.xrce119
                  END IF
                  DISPLAY g_xrce_d[l_ac].xrce119 TO s_detail1[l_ac].xrce119
                  #160628-00002#1--mark--str--
#                  INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = g_errno     
#                  LET g_errparam.extend = l_xrce119
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()
                  #160628-00002#1--mark--end
                  NEXT FIELD xrce119
               END IF
               #160628-00002#1--add--str--
               IF g_xrce_d[l_ac].xrce027 = 'Y' THEN
                  #全部冲销
                  IF g_xrce_d[l_ac].xrce119 = r_xrce_w.xrce119 THEN
                     LET g_xrce_d[l_ac].xrce113 = r_xrce_w.xrce113
                     LET g_xrce_d[l_ac].xrce114 = r_xrce_w.xrce114
                     LET g_xrce_d[l_ac].xrce103 = r_xrce_w.xrce103
                     LET g_xrce_d[l_ac].xrce104 = r_xrce_w.xrce104
                     LET g_xrce_d[l_ac].xrce109 = r_xrce_w.xrce109
                     IF g_glaa_t.glaa015='Y' THEN
                        LET g_xrce2_d[l_ac].xrce123 = r_xrce_w.xrce123
                        LET g_xrce2_d[l_ac].xrce124 = r_xrce_w.xrce124
                        LET g_xrce2_d[l_ac].xrce129 = r_xrce_w.xrce129
                     END IF
                     IF g_glaa_t.glaa019='Y' THEN
                        LET g_xrce2_d[l_ac].xrce133 = r_xrce_w.xrce133
                        LET g_xrce2_d[l_ac].xrce134 = r_xrce_w.xrce134
                        LET g_xrce2_d[l_ac].xrce139 = r_xrce_w.xrce139
                     END IF
                     CALL cl_set_comp_entry("xrce103,xrce104,xrce113,xrce114,xrce123,xrce124,xrce133,xrce134",FALSE)
                  ELSE
                  #部分冲销
                     CALL cl_set_comp_entry("xrce103,xrce104,xrce113,xrce114,xrce123,xrce124,xrce133,xrce134",TRUE)
                     IF l_oodb005 = 'Y' THEN
                        LET g_xrce_d[l_ac].xrce113 = g_xrce_d[l_ac].xrce119 - g_xrce_d[l_ac].xrce114
                        #170221-00054#1 mark ------
                        ##原币
                        #carol.wu不要再回推原幣
                        #LET g_xrce_d[l_ac].xrce109 = g_xrce_d[l_ac].xrce119 / g_xrce_d[l_ac].xrce101
                        #CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_xrce_d[l_ac].xrce100,g_xrce_d[l_ac].xrce109,2)
                        #      RETURNING l_success,g_errno,g_xrce_d[l_ac].xrce109
                        #170221-00054#1 mark end---
                        LET g_xrce_d[l_ac].xrce103 = g_xrce_d[l_ac].xrce109 - g_xrce_d[l_ac].xrce104
                        #本位币二
                        IF g_glaa_t.glaa015 = 'Y' THEN
                           IF g_glaa_t.glaa017='1' THEN
                              LET g_xrce2_d[l_ac].xrce129 = g_xrce_d[l_ac].xrce109 * g_xrce2_d[l_ac].xrce121
                           ELSE
                              LET g_xrce2_d[l_ac].xrce129 = g_xrce_d[l_ac].xrce119 * g_xrce2_d[l_ac].xrce121
                           END IF
                           CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa016,g_xrce2_d[l_ac].xrce129,2)
                              RETURNING l_success,g_errno,g_xrce2_d[l_ac].xrce129
                           LET g_xrce2_d[l_ac].xrce123 = g_xrce2_d[l_ac].xrce129 - g_xrce2_d[l_ac].xrce124
                        END IF
                        #本位币三
                        IF g_glaa_t.glaa019 = 'Y' THEN
                           IF g_glaa_t.glaa021='1' THEN
                              LET g_xrce2_d[l_ac].xrce139 = g_xrce_d[l_ac].xrce109 * g_xrce2_d[l_ac].xrce131
                           ELSE
                              LET g_xrce2_d[l_ac].xrce139 = g_xrce_d[l_ac].xrce119 * g_xrce2_d[l_ac].xrce131
                           END IF
                           CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa020,g_xrce2_d[l_ac].xrce139,2)
                              RETURNING l_success,g_errno,g_xrce2_d[l_ac].xrce139
                           LET g_xrce2_d[l_ac].xrce133 = g_xrce2_d[l_ac].xrce139 - g_xrce2_d[l_ac].xrce134
                        END IF
                     ELSE
                        LET g_xrce_d[l_ac].xrce114 = g_xrce_d[l_ac].xrce119 - g_xrce_d[l_ac].xrce113
                        #170221-00054#1 mark ------
                        ##原币
                        #carol.wu不要再回推原幣
                        #LET g_xrce_d[l_ac].xrce109 = g_xrce_d[l_ac].xrce119 / g_xrce_d[l_ac].xrce101
                        #CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_xrce_d[l_ac].xrce100,g_xrce_d[l_ac].xrce109,2)
                        #      RETURNING l_success,g_errno,g_xrce_d[l_ac].xrce109
                        #LET g_xrce_d[l_ac].xrce104 = g_xrce_d[l_ac].xrce109 - g_xrce_d[l_ac].xrce103
                        #170221-00054#1 mark end---
                        #本位币二
                        IF g_glaa_t.glaa015 = 'Y' THEN
                           IF g_glaa_t.glaa017='1' THEN
                              LET g_xrce2_d[l_ac].xrce129 = g_xrce_d[l_ac].xrce109 * g_xrce2_d[l_ac].xrce121
                           ELSE
                              LET g_xrce2_d[l_ac].xrce129 = g_xrce_d[l_ac].xrce119 * g_xrce2_d[l_ac].xrce121
                           END IF
                           CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa016,g_xrce2_d[l_ac].xrce129,2)
                              RETURNING l_success,g_errno,g_xrce2_d[l_ac].xrce129
                           LET g_xrce2_d[l_ac].xrce124 = g_xrce2_d[l_ac].xrce129 - g_xrce2_d[l_ac].xrce123
                        END IF
                        #本位币三
                        IF g_glaa_t.glaa019 = 'Y' THEN
                           IF g_glaa_t.glaa021='1' THEN
                              LET g_xrce2_d[l_ac].xrce139 = g_xrce_d[l_ac].xrce109 * g_xrce2_d[l_ac].xrce131
                           ELSE
                              LET g_xrce2_d[l_ac].xrce139 = g_xrce_d[l_ac].xrce119 * g_xrce2_d[l_ac].xrce131
                           END IF
                           CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa020,g_xrce2_d[l_ac].xrce139,2)
                              RETURNING l_success,g_errno,g_xrce2_d[l_ac].xrce139
                           LET g_xrce2_d[l_ac].xrce134 = g_xrce2_d[l_ac].xrce139 - g_xrce2_d[l_ac].xrce133
                        END IF
                     END IF
                  END IF
               ELSE
                  #非应税折抵
                  LET g_xrce_d[l_ac].xrce113 = g_xrce_d[l_ac].xrce119
                  LET g_xrce_d[l_ac].xrce114 = 0
                  #本币
                  #carol.wu不要再回推原幣
                  #170221-00054#1 mark ------
                  #LET g_xrce_d[l_ac].xrce109 = g_xrce_d[l_ac].xrce119 / g_xrce_d[l_ac].xrce101
                  #CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_xrce_d[l_ac].xrce100,g_xrce_d[l_ac].xrce109,2)
                  #    RETURNING l_success,g_errno,g_xrce_d[l_ac].xrce109
                  #170221-00054#1 mark end---
                  LET g_xrce_d[l_ac].xrce103 = g_xrce_d[l_ac].xrce109
                  LET g_xrce_d[l_ac].xrce104 = 0
                  #本位币二
                 IF g_glaa_t.glaa015 = 'Y' THEN
                    IF g_glaa_t.glaa017='1' THEN
                       LET g_xrce2_d[l_ac].xrce129 = g_xrce_d[l_ac].xrce109 * g_xrce2_d[l_ac].xrce121
                    ELSE
                       LET g_xrce2_d[l_ac].xrce129 = g_xrce_d[l_ac].xrce119 * g_xrce2_d[l_ac].xrce121
                    END IF
                    CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa016,g_xrce2_d[l_ac].xrce129,2)
                        RETURNING l_success,g_errno,g_xrce2_d[l_ac].xrce129
                     LET g_xrce2_d[l_ac].xrce123 = g_xrce2_d[l_ac].xrce129
                     LET g_xrce2_d[l_ac].xrce124 = 0
                  END IF
                  #本位币三
                  IF g_glaa_t.glaa019 = 'Y' THEN
                     IF g_glaa_t.glaa021 = '1' THEN
                        LET g_xrce2_d[l_ac].xrce139 = g_xrce_d[l_ac].xrce109 * g_xrce2_d[l_ac].xrce131
                     ELSE
                        LET g_xrce2_d[l_ac].xrce139 = g_xrce_d[l_ac].xrce119 * g_xrce2_d[l_ac].xrce131
                     END IF
                     CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa020,g_xrce2_d[l_ac].xrce139,2)
                         RETURNING l_success,g_errno,g_xrce2_d[l_ac].xrce139
                     LET g_xrce2_d[l_ac].xrce133 = g_xrce2_d[l_ac].xrce139
                     LET g_xrce2_d[l_ac].xrce134 = 0
                  END IF 
               END IF
               #160628-00002#1--add--end
            END IF



#            IF NOT cl_null(g_xrce_d[l_ac].xrce119) AND NOT cl_null(g_xrce_d[l_ac].xrce003) AND g_xrce_d[l_ac].xrce002 = '10' THEN
#               CALL axrt300_02_chk_xrce109()
#               IF NOT cl_null(g_errno) THEN
#                  IF l_cmd = 'a' THEN
#                     DISPLAY 0 TO s_detail1[l_ac].xrce119
#                  ELSE
#                     DISPLAY g_xrce_t.xrce119 TO s_detail1[l_ac].xrce119
#                  END IF
#                  INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = g_errno
#                  LET g_errparam.extend = g_xrce_d[l_ac].xrce119
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()
#
#                  IF l_cmd = 'a' THEN
#                     LET g_xrce_d[l_ac].xrce119 = 0
#                  ELSE
#                     LET g_xrce_d[l_ac].xrce119 = g_xrce_t.xrce119
#                  END IF
#                  DISPLAY g_xrce_d[l_ac].xrce119 TO s_detail1[l_ac].xrce119
#                  NEXT FIELD xrce119
#               END IF
#            END IF
#            IF NOT cl_null(g_xrce_d[l_ac].xrce119) AND NOT cl_null(g_xrce_d[l_ac].xrce101) THEN
#               LET g_xrce_d[l_ac].xrce109 = g_xrce_d[l_ac].xrce119 / g_xrce_d[l_ac].xrce101
#               LET g_xrce_d[l_ac].xrce109 = s_curr_round(g_glaa_t.glaacomp,g_xrce_d[l_ac].xrce100,g_xrce_d[l_ac].xrce109,2)
#               DISPLAY g_xrce_d[l_ac].xrce109 TO s_detail1[l_ac].xrce109
#               IF g_glaa_t.glaa015 = 'Y' THEN
#               LET g_xrce2_d[l_ac].xrce129 = g_xrce_d[l_ac].xrce109 * g_xrce2_d[l_ac].xrce121
#               LET g_xrce2_d[l_ac].xrce129 = s_curr_round(g_glaa_t.glaacomp,g_xrce2_d[l_ac].xrce120,g_xrce2_d[l_ac].xrce121,2)
#               END IF 
#               IF g_glaa_t.glaa019 = 'Y' THEN
#               LET g_xrce2_d[l_ac].xrce139 = g_xrce_d[l_ac].xrce109 * g_xrce2_d[l_ac].xrce131
#               LET g_xrce2_d[l_ac].xrce139 = s_curr_round(g_glaa_t.glaacomp,g_xrce2_d[l_ac].xrce130,g_xrce2_d[l_ac].xrce131,2)
#               END IF
#            END IF
#            IF NOT cl_null(g_xrce3_d[l_ac].xrce119) AND NOT cl_null(g_xrce_d[l_ac].xrce024) AND g_xrce_d[l_ac].xrce002 = '31' THEN
#               CALL axrt300_02_chk_xrce109_1()
#               IF NOT cl_null(g_errno) THEN
#                  IF l_cmd = 'a' THEN
#                     DISPLAY 0 TO s_detail1[l_ac].xrce119
#                  ELSE
#                     DISPLAY g_xrce_t.xrce119 TO s_detail1[l_ac].xrce119
#                  END IF
#                  INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = g_errno
#                  LET g_errparam.extend = g_xrce_d[l_ac].xrce119
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()
#
#                  IF l_cmd = 'a' THEN
#                     LET g_xrce_d[l_ac].xrce119 = 0
#                  ELSE
#                     LET g_xrce_d[l_ac].xrce119 = g_xrce_t.xrce119
#                  END IF
#                  DISPLAY g_xrce_d[l_ac].xrce119 TO s_detail1[l_ac].xrce119
#                  NEXT FIELD xrce119
#               END IF
#            END IF
#            IF NOT cl_null(g_xrce3_d[l_ac].xrce119) AND NOT cl_null(g_xrce_d[l_ac].xrce109) THEN
#               LET g_xrce3_d[l_ac].xrce101 = g_xrce3_d[l_ac].xrce119 / g_xrce_d[l_ac].xrce109
#               DISPLAY g_xrce3_d[l_ac].xrce119 TO s_detail3[l_ac].xrce119_1
#            END IF
#            LET g_xrce_t.xrce119 = g_xrce3_d[l_ac].xrce119
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce119
            #add-point:ON CHANGE xrce119 name="input.g.page1.xrce119"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce027
            #add-point:BEFORE FIELD xrce027 name="input.b.page1.xrce027"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce027
            
            #add-point:AFTER FIELD xrce027 name="input.a.page1.xrce027"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce027
            #add-point:ON CHANGE xrce027 name="input.g.page1.xrce027"
            #160628-00002#1--add--str--
            IF g_xrce_d[l_ac].xrce027 = 'N' THEN
               CALL cl_set_comp_entry("xrce103,xrce104,xrce113,xrce114,xrce123,xrce124,xrce133,xrce134",FALSE)
            ELSE
               IF g_xrce_d[l_ac].xrce109 = r_xrce_w.xrce109 THEN
                  CALL cl_set_comp_entry("xrce103,xrce104,xrce113,xrce114,xrce123,xrce124,xrce133,xrce134",FALSE)
               ELSE
                  CALL cl_set_comp_entry("xrce103,xrce104,xrce113,xrce114,xrce123,xrce124,xrce133,xrce134",TRUE)
               END IF
            END IF
            #160628-00002#1--add--end
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce028
            #add-point:BEFORE FIELD xrce028 name="input.b.page1.xrce028"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce028
            
            #add-point:AFTER FIELD xrce028 name="input.a.page1.xrce028"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce028
            #add-point:ON CHANGE xrce028 name="input.g.page1.xrce028"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcecomp
            #add-point:BEFORE FIELD xrcecomp name="input.b.page1.xrcecomp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcecomp
            
            #add-point:AFTER FIELD xrcecomp name="input.a.page1.xrcecomp"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcecomp
            #add-point:ON CHANGE xrcecomp name="input.g.page1.xrcecomp"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrceorga
            #add-point:BEFORE FIELD xrceorga name="input.b.page1.xrceorga"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrceorga
            
            #add-point:AFTER FIELD xrceorga name="input.a.page1.xrceorga"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrceorga
            #add-point:ON CHANGE xrceorga name="input.g.page1.xrceorga"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce010
            #add-point:BEFORE FIELD xrce010 name="input.b.page1.xrce010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce010
            
            #add-point:AFTER FIELD xrce010 name="input.a.page1.xrce010"
            IF NOT cl_null(g_xrce_d[l_ac].xrce010) THEN
              LET g_msg = g_xrce_d[l_ac].xrce010
              IF g_msg[1,1] = '.' THEN
                 LET g_msg = g_msg[2,10]
                 SELECT oocql004 INTO g_xrce_d[l_ac].xrce010 FROM oocql_t
                  WHERE oocqlent = g_enterprise
                    AND oocql001 = '3005'
                    AND oocql002 = g_msg
                    AND oocql003 = g_lang
                 DISPLAY g_xrce_d[l_ac].xrce010 TO s_detail1[l_ac].xrce010
              END IF
           END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce010
            #add-point:ON CHANGE xrce010 name="input.g.page1.xrce010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce016
            #add-point:BEFORE FIELD xrce016 name="input.b.page1.xrce016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce016
            
            #add-point:AFTER FIELD xrce016 name="input.a.page1.xrce016"
            IF NOT cl_null(g_xrce_d[l_ac].xrce016) THEN
               # 开窗模糊查询 150916-00015#1 --add                      
               IF s_aglt310_getlike_lc_subject(g_xrce_d[g_detail_idx].xrceld,g_xrce_d[l_ac].xrce016,"")  THEN            
                  
                  SELECT glaa004 INTO l_glaa004
                    FROM glaa_t
                   WHERE glaaent = g_enterprise
                     AND glaald  = g_xrce_d[g_detail_idx].xrceld
                  
                  INITIALIZE g_qryparam.* TO NULL
                  LET g_qryparam.state = 'i'
                  LET g_qryparam.reqry = 'FALSE'
                  LET g_qryparam.default1 = g_xrce_d[l_ac].xrce016
                                
                  LET g_qryparam.arg1 = l_glaa004
                  LET g_qryparam.arg2 = g_xrce_d[l_ac].xrce016
                  LET g_qryparam.arg3 = g_xrce_d[g_detail_idx].xrceld
                  LET g_qryparam.arg4 = " 1"
                  CALL q_glac002_6()
                  LET  g_xrce_d[l_ac].xrce016 = g_qryparam.return1                 
               END IF
               #科目存在性，有效性，非统治科目，非子系统科目，账户科目属性检查
               IF NOT  s_aglt310_lc_subject( g_xrce_d[g_detail_idx].xrceld,g_xrce_d[l_ac].xrce016,'N') THEN
                  LET g_xrce_d[l_ac].xrce016 = g_xrce_d_t.xrce016
                  NEXT FIELD  CURRENT
               #171016-00011#3 -s 171018 add by 01872
               ELSE
                  SELECT glad017,glad0171,glad0172,glad018,glad0181,glad0182,
                         glad019,glad0191,glad0192,glad020,glad0201,glad0202,
                         glad021,glad0211,glad0212,glad022,glad0221,glad0222,
                         glad023,glad0231,glad0232,glad024,glad0221,glad0242,
                         glad025,glad0251,glad0252,glad026,glad0261,glad0262
                   INTO  g_glad017,g_glad0171,g_glad0172,g_glad018,g_glad0181,g_glad0182,
                         g_glad019,g_glad0191,g_glad0192,g_glad020,g_glad0201,g_glad0202,
                         g_glad021,g_glad0211,g_glad0212,g_glad022,g_glad0221,g_glad0222,
                         g_glad023,g_glad0231,g_glad0232,g_glad024,g_glad0241,g_glad0242,
                         g_glad025,g_glad0251,g_glad0252,g_glad026,g_glad0261,g_glad0262
                   FROM  glad_t
                   WHERE gladent = g_enterprise
                     AND gladld = g_xrca_t.xrcald
                     AND glad001 = g_xrce_d[l_ac].xrce016 
               #171016-00011#3 -e 171018 add by 01872
               END IF               
               
               IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_xrce_d[l_ac].xrce016 != g_xrce_d_t.xrce016 OR g_xrce_d_t.xrce016 IS NULL )) THEN
               SELECT glacstus INTO l_glacstus FROM glac_t
                WHERE glacent = g_enterprise
                  AND glac001 = g_glaa_t.glaa004
                  AND glac002 = g_xrce_d[l_ac].xrce016
               LET g_errno = ' '
               CASE
                  WHEN SQLCA.SQLCODE = 100
                     LET g_errno = 'agl-00011'
                  WHEN l_glacstus = 'N'
#                     LET g_errno = 'agl-00012' #160318-00005#53  mark
                     LET g_errno = 'sub-01302'  #160318-00005#53  add
               END CASE
               IF NOT cl_null(g_errno) THEN
                  IF l_cmd = 'a' THEN
                     LET g_xrce_d[l_ac].xrce016_desc_1 = ''
                     DISPLAY '','' TO s_detail3[l_ac].xrce016,s_detail3[l_ac].xrce016_desc_1
                  ELSE
                     INITIALIZE g_ref_fields TO NULL
                     LET g_ref_fields[1] = g_xrce_d_t.xrce016
                     CALL ap_ref_array2(g_ref_fields,"SELECT glacl004 FROM glacl_t WHERE glaclent='"||g_enterprise||"' AND glacl001='"||g_glaa_t.glaa004||"' AND glacl002=? AND glacl003='"||g_lang||"'","") RETURNING g_rtn_fields
                     LET g_xrce_d[l_ac].xrce016_desc_1 = '', g_rtn_fields[1] , ''
                     DISPLAY g_xrce_d_t.xrce016,g_xrce_d[l_ac].xrce016_desc_1 TO s_detail3[l_ac].xrce016,s_detail3[l_ac].xrce016_desc
                  END IF
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_xrce_d[l_ac].xrce016
                  #160318-00005#53 --s add
                  CASE g_errno
                     WHEN 'sub-01302'
                        LET g_errparam.replace[1] = 'agli020'
                        LET g_errparam.replace[2] = cl_get_progname('agli020',g_lang,"2")
                        LET g_errparam.exeprog = 'agli020'
                  END CASE
                  #160318-00005#53 --e add
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  IF l_cmd = 'a' THEN
                     LET g_xrce_d[l_ac].xrce016 = ''
                  ELSE
                     LET g_xrce_d[l_ac].xrce016 = g_xrce_d_t.xrce016
                  END IF
                  DISPLAY g_xrce_d[l_ac].xrce016 TO s_detail3[l_ac].xrce016
                  NEXT FIELD xrce016
               END IF
               # 150916-00015#1 --end
                  #170512-00045#2 add ------
                  IF l_cmd = 'u' THEN 
                  LET l_cnt = 0
                  SELECT COUNT(1) INTO l_cnt
                    FROM xrce_t
                   WHERE xrceent = g_enterprise
                     AND xrceld = g_xrca_t.xrcald
                     AND xrcedocno = g_xrca_t.xrcadocno
                     AND xrceseq = g_xrce_d[l_ac].xrceseq
                  IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
                  #171023-00004#2   2017/11/22 By 09773 add(S)   
                  #T作业单身维护科目后，若启用的核算项都有值，则不需打开核算项子画面
                  LET g_glaq_s.glaq025 = g_xrce3_d[l_ac].xrce017
                  LET g_glaq_s.glaq018 = g_xrce3_d[l_ac].xrce018
                  LET g_glaq_s.glaq019 = g_xrce3_d[l_ac].xrce019
                  LET g_glaq_s.glaq024 = g_xrce3_d[l_ac].xrce020
                  LET g_glaq_s.glaq027 = g_xrce3_d[l_ac].xrce022
                  LET g_glaq_s.glaq028 = g_xrce3_d[l_ac].xrce023
                  LET g_glaq_s.glaq052 = g_xrce3_d[l_ac].xrce040
                  LET g_glaq_s.glaq020 = g_xrce3_d[l_ac].xrce035
                  LET g_glaq_s.glaq023 = g_xrce3_d[l_ac].xrce036
                  LET g_glaq_s.glaq022 = g_xrce3_d[l_ac].xrce038
                  LET g_glaq_s.glaq051 = g_xrce3_d[l_ac].xrce039
                  LET g_glaq_s.glaq053 = g_xrce3_d[l_ac].xrce041
                  LET g_glaq_s.glaq029 = g_xrce3_d[l_ac].xrce042
                  LET g_glaq_s.glaq030 = g_xrce3_d[l_ac].xrce043
                  LET g_glaq_s.glaq031 = g_xrce3_d[l_ac].xrce044
                  LET g_glaq_s.glaq032 = g_xrce3_d[l_ac].xrce045
                  LET g_glaq_s.glaq033 = g_xrce3_d[l_ac].xrce046
                  LET g_glaq_s.glaq034 = g_xrce3_d[l_ac].xrce047
                  LET g_glaq_s.glaq035 = g_xrce3_d[l_ac].xrce048
                  LET g_glaq_s.glaq036 = g_xrce3_d[l_ac].xrce049
                  LET g_glaq_s.glaq037 = g_xrce3_d[l_ac].xrce050
                  LET g_glaq_s.glaq038 = g_xrce3_d[l_ac].xrce051
                  #171023-00004#2   2017/11/22 By 09773 add(E)
                  CALL aglt310_02('c',g_xrca_t.xrcald,'',g_xrca_t.xrcadocdt,g_xrce_d[l_ac].xrce016,'','axrt300',g_glaq_s.*) 
                  RETURNING g_glaq_s.glaq017,g_glaq_s.glaq018,g_glaq_s.glaq019,g_glaq_s.glaq020,g_glaq_s.glaq021,
                            g_glaq_s.glaq022,g_glaq_s.glaq023,g_glaq_s.glaq024,g_glaq_s.glaq051,g_glaq_s.glaq052,
                            g_glaq_s.glaq053,g_glaq_s.glaq025,g_glaq_s.glaq027,g_glaq_s.glaq028,g_glaq_s.glaq029,
                            g_glaq_s.glaq030,g_glaq_s.glaq031,g_glaq_s.glaq032,g_glaq_s.glaq033,g_glaq_s.glaq034,
                            g_glaq_s.glaq035,g_glaq_s.glaq036,g_glaq_s.glaq037,g_glaq_s.glaq038,g_glaq_s.glbc004
#                  #如果單身有資料，就update核算項
#                  IF l_cnt > 0 THEN
#                     LET l_item[1] = g_xrca_t.xrcald
#                     LET l_item[2] = g_xrca_t.xrcadocno
#                     LET l_item[3] = g_xrce_d[l_ac].xrceseq
#                     LET l_item[4] = g_xrce_d[l_ac].xrce016
#                     CALL s_axrt300_upd_xrce_fix_acc(l_item,g_glaq_s.*)
#                  END IF
                  LET g_xrce3_d[l_ac].xrce017 = g_glaq_s.glaq025
                  LET g_xrce3_d[l_ac].xrce018 = g_glaq_s.glaq018
                  LET g_xrce3_d[l_ac].xrce019 = g_glaq_s.glaq019
                  LET g_xrce3_d[l_ac].xrce020 = g_glaq_s.glaq024
                  LET g_xrce3_d[l_ac].xrce022 = g_glaq_s.glaq027
                  LET g_xrce3_d[l_ac].xrce023 = g_glaq_s.glaq028
                  LET g_xrce3_d[l_ac].xrce040 = g_glaq_s.glaq052
                  LET g_xrce3_d[l_ac].xrce035 = g_glaq_s.glaq020
                  LET g_xrce3_d[l_ac].xrce036 = g_glaq_s.glaq023
                  LET g_xrce3_d[l_ac].xrce038 = g_glaq_s.glaq022
                  LET g_xrce3_d[l_ac].xrce039 = g_glaq_s.glaq051
                  LET g_xrce3_d[l_ac].xrce041 = g_glaq_s.glaq053
                  LET g_xrce3_d[l_ac].xrce042 = g_glaq_s.glaq029
                  LET g_xrce3_d[l_ac].xrce043 = g_glaq_s.glaq030
                  LET g_xrce3_d[l_ac].xrce044 = g_glaq_s.glaq031
                  LET g_xrce3_d[l_ac].xrce045 = g_glaq_s.glaq032
                  LET g_xrce3_d[l_ac].xrce046 = g_glaq_s.glaq033
                  LET g_xrce3_d[l_ac].xrce047 = g_glaq_s.glaq034
                  LET g_xrce3_d[l_ac].xrce048 = g_glaq_s.glaq035
                  LET g_xrce3_d[l_ac].xrce049 = g_glaq_s.glaq036
                  LET g_xrce3_d[l_ac].xrce050 = g_glaq_s.glaq037
                  LET g_xrce3_d[l_ac].xrce051 = g_glaq_s.glaq038
                  DISPLAY BY NAME
                  g_xrce3_d[l_ac].xrce017,g_xrce3_d[l_ac].xrce018,g_xrce3_d[l_ac].xrce019,
                  g_xrce3_d[l_ac].xrce020,g_xrce3_d[l_ac].xrce022,g_xrce3_d[l_ac].xrce023,
                  g_xrce3_d[l_ac].xrce040,g_xrce3_d[l_ac].xrce035,g_xrce3_d[l_ac].xrce038,
                  g_xrce3_d[l_ac].xrce039,g_xrce3_d[l_ac].xrce041,g_xrce3_d[l_ac].xrce042,
                  g_xrce3_d[l_ac].xrce043,g_xrce3_d[l_ac].xrce044,g_xrce3_d[l_ac].xrce045,
                  g_xrce3_d[l_ac].xrce046,g_xrce3_d[l_ac].xrce047,g_xrce3_d[l_ac].xrce048,
                  g_xrce3_d[l_ac].xrce049,g_xrce3_d[l_ac].xrce050,g_xrce3_d[l_ac].xrce036
                  
                  LET l_item[1] = g_xrca_t.xrcald
                  LET l_item[2] = g_xrce_d[l_ac].xrce016
                  CALL axrt300_02_set_fixacc_require(l_item) 
                  END IF
                  #170512-00045#2 add end---                 
               CALL axrt300_02_acc_def()
               END IF
            END IF
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_xrce_d[l_ac].xrce016
            CALL ap_ref_array2(g_ref_fields,"SELECT glacl004 FROM glacl_t WHERE glaclent='"||g_enterprise||"' AND glacl001='"||g_glaa_t.glaa004||"' AND glacl002=? AND glacl003='"||g_lang||"'","") RETURNING g_rtn_fields
            LET g_xrce_d[l_ac].xrce016_desc_1 = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_xrce_d[l_ac].xrce016_desc_1
            LET g_xrce3_d[l_ac].xrce016 = g_xrce_d[l_ac].xrce016
            LET g_xrce3_d[l_ac].xrce016_u_desc = g_xrce_d[l_ac].xrce016_desc_1
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce016
            #add-point:ON CHANGE xrce016 name="input.g.page1.xrce016"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce016_desc_1
            #add-point:BEFORE FIELD xrce016_desc_1 name="input.b.page1.xrce016_desc_1"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce016_desc_1
            
            #add-point:AFTER FIELD xrce016_desc_1 name="input.a.page1.xrce016_desc_1"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce016_desc_1
            #add-point:ON CHANGE xrce016_desc_1 name="input.g.page1.xrce016_desc_1"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.xrce001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce001
            #add-point:ON ACTION controlp INFIELD xrce001 name="input.c.page1.xrce001"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.xrcedocno
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcedocno
            #add-point:ON ACTION controlp INFIELD xrcedocno name="input.c.page1.xrcedocno"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.xrceld
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrceld
            #add-point:ON ACTION controlp INFIELD xrceld name="input.c.page1.xrceld"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.xrcesite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcesite
            #add-point:ON ACTION controlp INFIELD xrcesite name="input.c.page1.xrcesite"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.xrceseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrceseq
            #add-point:ON ACTION controlp INFIELD xrceseq name="input.c.page1.xrceseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.xrce002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce002
            #add-point:ON ACTION controlp INFIELD xrce002 name="input.c.page1.xrce002"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.xrce003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce003
            #add-point:ON ACTION controlp INFIELD xrce003 name="input.c.page1.xrce003"
            #開窗i段
            #170618-00443#1--add--str--lujh
            LET l_wc2 = " 1=1 "
            IF g_prog = 'axrt300' THEN 
            #170618-00443#1--add--end--lujh
               #151130-00015#3 Add  ---(S)---
               CALL cl_get_para(g_enterprise,g_xrca_t.xrcacomp,'S-FIN-2020') RETURNING l_sfin2020
               IF l_sfin2020 MATCHES '[Yy]' THEN
                  #本應收單號單身的出貨單,對應的訂單,對應的應收單,對應的待抵單
               
                  #應收單單身對應的出貨單
                  LET l_wc2 = "SELECT xrcb002 || '#' || xrcb003 FROM xrcb_t WHERE xrcbent = '",g_enterprise,"'    ",
                              "   AND xrcbld = '",g_xrca_t.xrcald,"' AND xrcb001 = '11' AND xrcbdocno = '",g_xrca_t.xrcadocno,"'"
                  #出貨單單身對應的訂單
                  LET l_wc2 = "SELECT xmdl003 || '#' || xmdl004 FROM xmdl_t WHERE xmdlent = '",g_enterprise,"'  ",
                              "   AND xmdl003 IS NOT NULL AND xmdldocno || '#' || xmdlseq IN (",l_wc2 CLIPPED,")"
                  #訂單對應的訂單應收單
                  LET l_wc2 = "SELECT xrcbdocno FROM xrcb_t WHERE xrcbent = '",g_enterprise,"' ",
                              "   AND xrcbld = '",g_xrca_t.xrcald,"' AND xrcb001 = '10'               ",
                              "   AND xrcb002 || '#' || xrcb003 IN (",l_wc2 CLIPPED,")         "
                  #訂單應收單對應的待抵單
                  LET l_wc2 = " xrca018 IN (",l_wc2 CLIPPED,")"
               ELSE
                  LET l_wc2 = " 1=1"
               END IF
               #151130-00015#3 Add  ---(E)---
            END IF    #170618-00443#1 add lujh
            
            IF g_xrce_d[l_ac].xrce002 = '31' THEN
			      INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
			      LET g_qryparam.reqry = FALSE
			      LET g_qryparam.default1 = g_xrce_d[l_ac].xrce003
			      
			      LET g_qryparam.arg1 = g_xrca_t.xrca005
               LET g_qryparam.arg2 = g_xrca_t.xrcald
               LET g_qryparam.arg3 = g_xrca_t.xrcasite

               LET g_qryparam.where= "      xrcadocdt <= '",g_xrca_t.xrcadocdt,"'",
                                     "  AND SUBSTR(xrca001,1,1) = '2' ",
                                     "  AND xrca001 <> '25'",
                                     "  AND ",l_wc2 CLIPPED #151130-00015#3 Add
               #直接沖帳若非本帳套使用幣種時, 限定過濾與交易幣種一樣                      
               LET g_qryparam.where= g_qryparam.where," AND ((xrca100 = xrcc100 AND xrca100 = '",g_xrca_t.xrca100,"') OR xrcc100 = '",g_glaa_t.glaa001,"')" #170621-00044#2 add                          
               
               CALL axrt400_04()                         #銀存收支資料沖帳挑選(子作業)

               CALL axrt300_02_ins_xrce(g_xrce_d[l_ac].xrce002,0)
               LET l_flag = 'Y'
               #CALL axrt300_02_b_fill("1=1")
               CALL axrt300_02_ref_amt()
               EXIT DIALOG

            END IF
            IF g_xrce_d[l_ac].xrce002 = '32' THEN
			      INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
			      LET g_qryparam.reqry = FALSE
			      LET g_qryparam.default1 = g_xrce_d[l_ac].xrce003
			      
			      LET g_qryparam.arg1 = g_xrca_t.xrca005
               LET g_qryparam.arg2 = g_xrca_t.xrcald
               LET g_qryparam.arg3 = g_xrca_t.xrcasite

               LET g_qryparam.where= "      xrcadocdt <= '",g_xrca_t.xrcadocdt,"'",
                                     "  AND xrca001 = '25'",
                                     "  AND ",l_wc2 CLIPPED #151130-00015#3 Add
               #直接沖帳若非本帳套使用幣種時, 限定過濾與交易幣種一樣                      
               LET g_qryparam.where= g_qryparam.where," AND ((xrca100 = xrcc100 AND xrca100 = '",g_xrca_t.xrca100,"') OR xrcc100 = '",g_glaa_t.glaa001,"')" #170621-00044#2 add                         
               
               CALL axrt400_04()                         #銀存收支資料沖帳挑選(子作業)

               CALL axrt300_02_ins_xrce(g_xrce_d[l_ac].xrce002,0)
               LET l_flag = 'Y'
               #CALL axrt300_02_b_fill("1=1")
               CALL axrt300_02_ref_amt()
               EXIT DIALOG

            END IF
            
            CALL axrt300_02_ref_amt()
            NEXT FIELD xrce003                                 #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.page1.xrce004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce004
            #add-point:ON ACTION controlp INFIELD xrce004 name="input.c.page1.xrce004"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.xrce005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce005
            #add-point:ON ACTION controlp INFIELD xrce005 name="input.c.page1.xrce005"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.xrce024
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce024
            #add-point:ON ACTION controlp INFIELD xrce024 name="input.c.page1.xrce024"
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
			IF cl_null(g_xrce_d_t.xrce024) THEN
               LET g_qryparam.state = 'c'
            ELSE
               LET g_qryparam.state = 'i'
            END IF
			LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_xrce_d[l_ac].xrce024   #給予default值
            LET g_qryparam.default2 = g_xrce_d[l_ac].xrce025   #給予default值
            #呼叫開窗
            CASE
               WHEN g_xrce_d[l_ac].xrce002 = '31'           #銀行電匯款
                  #給予arg
                  LET g_qryparam.arg1 = g_xrca_t.xrcasite   #帳務中心
                  LET g_qryparam.arg2 = g_xrca_t.xrca004    #核銷客戶
                  LET g_qryparam.arg3 = g_xrca_t.xrca005    #收款客戶
                  LET g_qryparam.arg4 = g_xrca_t.xrcacomp   #來源組織
                  LET g_qryparam.arg5 = g_xrca_t.xrcald     #帳套
                 #LET g_qryparam.arg6 =                     #來源類型
                 #LET g_qryparam.arg7 = '-1'                #表單性質
                  LET g_qryparam.arg8 = l_ooab002           #沖帳至項次否   -Y 是   -N 否

                  LET g_qryparam.where= "xrcadocdt <= '",g_xrca_t.xrcadocdt,"'"
                  
                  CALL axrt400_04()                         #銀存收支資料沖帳挑選(子作業)
                  IF NOT cl_null(g_xrce_d_t.xrce024) THEN
                     LET g_xrce_d[l_ac].xrce024 = g_qryparam.return1    #將開窗取得的值回傳到變數
                     LET g_xrce_d[l_ac].xrce025 = g_qryparam.return2
                     LET g_xrce_d[l_ac].xrce003 = g_qryparam.return3
                     LET g_xrce_d[l_ac].xrce004 = g_qryparam.return4
                  
                     DISPLAY g_xrce_d[l_ac].xrce024,g_xrce_d[l_ac].xrce005 TO s_detail1[l_ac].xrce024_1,s_detail1[l_ac].xrce005_1          #顯示到畫面上
                     DISPLAY g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004 TO s_detail1[l_ac].xrce003_1,s_detail1[l_ac].xrce004_1          #顯示到畫面上
                  ELSE
                     CALL axrt300_02_ins_xrce(g_xrce_d[l_ac].xrce002,0)
                     LET l_flag = 'Y'
                     CALL axrt300_02_ref_amt()
                     EXIT DIALOG
                  END IF
            
               WHEN g_xrce_d[l_ac].xrce002 = '32'           #暫無規格
               WHEN g_xrce_d[l_ac].xrce002 = '40'           #暫無規格
               WHEN g_xrce_d[l_ac].xrce002 = '41'           #暫無規格
               WHEN g_xrce_d[l_ac].xrce002 = '42'           #暫無規格
            END CASE
            CALL axrt300_02_ref_amt()

            NEXT FIELD xrce024                                 #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.page1.xrce025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce025
            #add-point:ON ACTION controlp INFIELD xrce025 name="input.c.page1.xrce025"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.xrce008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce008
            #add-point:ON ACTION controlp INFIELD xrce008 name="input.c.page1.xrce008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.lc_xrce008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD lc_xrce008
            #add-point:ON ACTION controlp INFIELD lc_xrce008 name="input.c.page1.lc_xrce008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.xrce015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce015
            #add-point:ON ACTION controlp INFIELD xrce015 name="input.c.page1.xrce015"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.xrce100
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce100
            #add-point:ON ACTION controlp INFIELD xrce100 name="input.c.page1.xrce100"
#此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_xrce_d[l_ac].xrce100             #給予default值

            #給予arg

            CALL q_aooi001_1()                                #呼叫開窗

            LET g_xrce_d[l_ac].xrce100 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_xrce_d[l_ac].xrce100 TO xrce100              #顯示到畫面上

            NEXT FIELD xrce100                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.xrce101
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce101
            #add-point:ON ACTION controlp INFIELD xrce101 name="input.c.page1.xrce101"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.xrce103
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce103
            #add-point:ON ACTION controlp INFIELD xrce103 name="input.c.page1.xrce103"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.xrce104
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce104
            #add-point:ON ACTION controlp INFIELD xrce104 name="input.c.page1.xrce104"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.xrce109
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce109
            #add-point:ON ACTION controlp INFIELD xrce109 name="input.c.page1.xrce109"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.xrce113
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce113
            #add-point:ON ACTION controlp INFIELD xrce113 name="input.c.page1.xrce113"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.xrce114
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce114
            #add-point:ON ACTION controlp INFIELD xrce114 name="input.c.page1.xrce114"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.xrce119
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce119
            #add-point:ON ACTION controlp INFIELD xrce119 name="input.c.page1.xrce119"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.xrce027
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce027
            #add-point:ON ACTION controlp INFIELD xrce027 name="input.c.page1.xrce027"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.xrce028
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce028
            #add-point:ON ACTION controlp INFIELD xrce028 name="input.c.page1.xrce028"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.xrcecomp
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcecomp
            #add-point:ON ACTION controlp INFIELD xrcecomp name="input.c.page1.xrcecomp"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.xrceorga
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrceorga
            #add-point:ON ACTION controlp INFIELD xrceorga name="input.c.page1.xrceorga"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.xrce010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce010
            #add-point:ON ACTION controlp INFIELD xrce010 name="input.c.page1.xrce010"
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_xrce_d[l_ac].xrce010             #給予default值

            #給予arg

            CALL q_oocq002_2()                                #呼叫開窗

            LET g_xrce_d[l_ac].xrce010 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_xrce_d[l_ac].xrce010 TO xrce010              #顯示到畫面上
            LET g_xrce3_d[l_ac].xrce010 = g_xrce_d[l_ac].xrce010

            NEXT FIELD xrce010                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.xrce016
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce016
            #add-point:ON ACTION controlp INFIELD xrce016 name="input.c.page1.xrce016"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_xrce_d[l_ac].xrce016             #給予default值
            LET g_qryparam.where = " glac001 = '",g_glaa_t.glaa004,"' AND glac006 = '1'",
                                   " AND glac002 IN (SELECT glad001 FROM glad_t,glac_t WHERE glad001= glac002 AND gladld='",g_xrce_d[g_detail_idx].xrceld,"' AND gladent=",g_enterprise,
                                   " AND gladstus = 'Y' )" #150916-00015#1 add


            #給予arg
            LET g_qryparam.arg1 = "" #


            CALL aglt310_04()                                #呼叫開窗

            LET g_xrce_d[l_ac].xrce016 = g_qryparam.return1              

            DISPLAY g_xrce_d[l_ac].xrce016 TO xrce016              #
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_xrce_d[l_ac].xrce016
            CALL ap_ref_array2(g_ref_fields,"SELECT glacl004 FROM glacl_t WHERE glaclent='"||g_enterprise||"' AND glacl001='"||g_glaa_t.glaa004||"' AND glacl002=? AND glacl003='"||g_lang||"'","") RETURNING g_rtn_fields
            LET g_xrce_d[l_ac].xrce016_desc_1 = '', g_rtn_fields[1] , ''
            LET g_xrce3_d[l_ac].xrce016 = g_xrce_d[l_ac].xrce016
            LET g_xrce3_d[l_ac].xrce016_u_desc = g_xrce_d[l_ac].xrce016_desc_1 

            NEXT FIELD xrce016                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.xrce016_desc_1
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce016_desc_1
            #add-point:ON ACTION controlp INFIELD xrce016_desc_1 name="input.c.page1.xrce016_desc_1"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               CLOSE axrt300_02_bcl
               LET INT_FLAG = 0
               LET g_xrce_d[l_ac].* = g_xrce_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CALL cl_err()
               #add-point:單身取消時 name="input.body.cancel"
              #CLOSE axrt300_02_bcl1   #160420-00001#1 Mark
               #end add-point
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_xrce_d[l_ac].xrceld 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_xrce_d[l_ac].* = g_xrce_d_t.*
            ELSE
               #寫入修改者/修改日期資訊(單身)
               
            
               #add-point:單身修改前 name="input.body.b_update"
              #160420-00001#1 Mark ---(S)---
              #SELECT gzcb004 INTO l_gzcb004
              #  FROM gzcb_t
              # WHERE gzcb001 = '8306'
              #   AND gzcb002 = g_xrce_d[l_ac].xrce002
              #IF l_gzcb004 = '2' THEN
              #160420-00001#1 Mark ---(E)---
               #end add-point
               
               #將遮罩欄位還原
               CALL axrt300_02_xrce_t_mask_restore('restore_mask_o')
 
               UPDATE xrce_t SET (xrce001,xrcedocno,xrceld,xrcesite,xrceseq,xrce002,xrce003,xrce004, 
                   xrce005,xrce024,xrce025,xrce008,xrce015,xrce100,xrce101,xrce103,xrce104,xrce109,xrce113, 
                   xrce114,xrce119,xrce027,xrce028,xrcecomp,xrceorga,xrce010,xrce016,xrce120,xrce121, 
                   xrce123,xrce124,xrce129,xrce130,xrce131,xrce133,xrce134,xrce139,xrce017,xrce018,xrce019, 
                   xrce020,xrce022,xrce023,xrce040,xrce035,xrce036,xrce038,xrce039,xrce041,xrce042,xrce043, 
                   xrce044,xrce045,xrce046,xrce047,xrce048,xrce049,xrce050,xrce051) = (g_xrce_d[l_ac].xrce001, 
                   g_xrce_d[l_ac].xrcedocno,g_xrce_d[l_ac].xrceld,g_xrce_d[l_ac].xrcesite,g_xrce_d[l_ac].xrceseq, 
                   g_xrce_d[l_ac].xrce002,g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce005, 
                   g_xrce_d[l_ac].xrce024,g_xrce_d[l_ac].xrce025,g_xrce_d[l_ac].xrce008,g_xrce_d[l_ac].xrce015, 
                   g_xrce_d[l_ac].xrce100,g_xrce_d[l_ac].xrce101,g_xrce_d[l_ac].xrce103,g_xrce_d[l_ac].xrce104, 
                   g_xrce_d[l_ac].xrce109,g_xrce_d[l_ac].xrce113,g_xrce_d[l_ac].xrce114,g_xrce_d[l_ac].xrce119, 
                   g_xrce_d[l_ac].xrce027,g_xrce_d[l_ac].xrce028,g_xrce_d[l_ac].xrcecomp,g_xrce_d[l_ac].xrceorga, 
                   g_xrce_d[l_ac].xrce010,g_xrce_d[l_ac].xrce016,g_xrce2_d[l_ac].xrce120,g_xrce2_d[l_ac].xrce121, 
                   g_xrce2_d[l_ac].xrce123,g_xrce2_d[l_ac].xrce124,g_xrce2_d[l_ac].xrce129,g_xrce2_d[l_ac].xrce130, 
                   g_xrce2_d[l_ac].xrce131,g_xrce2_d[l_ac].xrce133,g_xrce2_d[l_ac].xrce134,g_xrce2_d[l_ac].xrce139, 
                   g_xrce3_d[l_ac].xrce017,g_xrce3_d[l_ac].xrce018,g_xrce3_d[l_ac].xrce019,g_xrce3_d[l_ac].xrce020, 
                   g_xrce3_d[l_ac].xrce022,g_xrce3_d[l_ac].xrce023,g_xrce3_d[l_ac].xrce040,g_xrce3_d[l_ac].xrce035, 
                   g_xrce3_d[l_ac].xrce036,g_xrce3_d[l_ac].xrce038,g_xrce3_d[l_ac].xrce039,g_xrce3_d[l_ac].xrce041, 
                   g_xrce3_d[l_ac].xrce042,g_xrce3_d[l_ac].xrce043,g_xrce3_d[l_ac].xrce044,g_xrce3_d[l_ac].xrce045, 
                   g_xrce3_d[l_ac].xrce046,g_xrce3_d[l_ac].xrce047,g_xrce3_d[l_ac].xrce048,g_xrce3_d[l_ac].xrce049, 
                   g_xrce3_d[l_ac].xrce050,g_xrce3_d[l_ac].xrce051)
                WHERE xrceent = g_enterprise AND
                  xrceld = g_xrce_d_t.xrceld #項次   
                  AND xrcedocno = g_xrce_d_t.xrcedocno  
                  AND xrceseq = g_xrce_d_t.xrceseq  
 
                  
               #add-point:單身修改中 name="input.body.m_update"
              #160420-00001#1 Mark ---(S)---
              #ELSE
              #   UPDATE xrde_t SET (xrde001,xrdedocno,xrdeld,xrdesite,xrdeseq,xrde002,xrde006,xrde003, 
              #                      xrde004,xrde008,xrde100,xrde109,xrde101,xrde119,xrde010, 
              #                      xrde018,xrde015,xrde028,xrdecomp,xrdeorga,xrde120, 
              #                      xrde121,xrde129,xrde130,xrde131,xrde139,xrde016,xrde017,xrde019,xrde020,xrde022,xrde023,xrde012) = (g_xrce_d[l_ac].xrce001, 
              #                      g_xrce_d[l_ac].xrcedocno,g_xrce_d[l_ac].xrceld,g_xrce_d[l_ac].xrcesite,g_xrce_d[l_ac].xrceseq, 
              #                      g_xrce_d[l_ac].xrce002,g_xrce_d[l_ac].xrce006,g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004, 
              #                      g_xrce_d[l_ac].xrce008, 
              #                      g_xrce_d[l_ac].xrce100,g_xrce_d[l_ac].xrce109,g_xrce_d[l_ac].xrce101,g_xrce_d[l_ac].xrce119, 
              #                      g_xrce_d[l_ac].xrce010,g_xrce3_d[l_ac].xrce018,g_xrce_d[l_ac].xrce015, 
              #                      g_xrce_d[l_ac].xrce028, 
              #                      g_xrce_d[l_ac].xrcecomp,g_xrce_d[l_ac].xrceorga,g_xrce2_d[l_ac].xrce120, 
              #                      g_xrce2_d[l_ac].xrce121,g_xrce2_d[l_ac].xrce129,g_xrce2_d[l_ac].xrce130,g_xrce2_d[l_ac].xrce131, 
              #                      g_xrce2_d[l_ac].xrce139,g_xrce_d[l_ac].xrce016,g_xrce3_d[l_ac].xrce017,g_xrce3_d[l_ac].xrce019, 
              #                      g_xrce3_d[l_ac].xrce020,g_xrce3_d[l_ac].xrce022,g_xrce3_d[l_ac].xrce023,g_xrce_d[l_ac].xrde012)
              # WHERE xrdeent = g_enterprise 
              #   AND xrdeld = g_xrce_d_t.xrceld #項次   
              #   AND xrdedocno = g_xrce_d_t.xrcedocno  
              #   AND xrdeseq = g_xrce_d_t.xrceseq  
              #END IF
              #160420-00001#1 Mark ---(E)---
               #end add-point
                  
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "xrce_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                  WHEN SQLCA.SQLCODE #其他錯誤
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "xrce_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                  OTHERWISE
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_xrce_d[g_detail_idx].xrceld
               LET gs_keys_bak[1] = g_xrce_d_t.xrceld
               LET gs_keys[2] = g_xrce_d[g_detail_idx].xrcedocno
               LET gs_keys_bak[2] = g_xrce_d_t.xrcedocno
               LET gs_keys[3] = g_xrce_d[g_detail_idx].xrceseq
               LET gs_keys_bak[3] = g_xrce_d_t.xrceseq
               CALL axrt300_02_update_b('xrce_t',gs_keys,gs_keys_bak,"'1'")
                     #資料多語言用-增/改
                     
                        #161130-00056
                     #修改歷程記錄(修改)
                     LET g_log1 = util.JSON.stringify(g_xrce_d_t)
                     LET g_log2 = util.JSON.stringify(g_xrce_d[l_ac])
                     IF NOT cl_log_modified_record(g_log1,g_log2) THEN
                     END IF
               END CASE
               
               #將遮罩欄位進行遮蔽
               CALL axrt300_02_xrce_t_mask_restore('restore_mask_n')
               
               #add-point:單身修改後 name="input.body.a_update"
               CALL axrt300_02_ref_amt()
               #end add-point
 
            END IF
            
         AFTER ROW
            CALL axrt300_02_unlock_b("xrce_t")
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CALL cl_err()
               LET INT_FLAG = 0
               IF l_cmd = 'u' THEN
                  LET g_xrce_d[l_ac].* = g_xrce_d_t.*
               END IF
               #add-point:單身after row name="input.body.a_close"
               
               #end add-point
               EXIT DIALOG   #(ver:44)
            ELSE
            END IF
            #其他table進行unlock
            
             #add-point:單身after row name="input.body.a_row"
            
            #end add-point
            
         AFTER INPUT
            #add-point:單身input後 name="input.body.a_input"
           
            CALL axrt300_02_ref_amt()            
            CALL axrt300_02_b_fill(g_wc2)  #170512-00045#2 add
            #end add-point
            #錯誤訊息統整顯示
            #CALL cl_err_collect_show()
            #CALL cl_showmsg()
            
         ON ACTION controlo   
            IF l_insert THEN
               #170920-00028 ---modify start---
               #新增判斷是否有上一筆資料可供複製
               IF l_ac_t <= 0 OR l_ac_t IS NULL THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = ""
                  LET g_errparam.code   = "adz-01032"
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
               ELSE
                  LET li_reproduce = l_ac_t
                  LET li_reproduce_target = l_ac
                  LET g_xrce_d[li_reproduce_target].* = g_xrce_d[li_reproduce].*
               LET g_xrce2_d[li_reproduce_target].* = g_xrce2_d[li_reproduce].*
               LET g_xrce3_d[li_reproduce_target].* = g_xrce3_d[li_reproduce].*
 
                  LET g_xrce_d[li_reproduce_target].xrceld = NULL
                  LET g_xrce_d[li_reproduce_target].xrcedocno = NULL
                  LET g_xrce_d[li_reproduce_target].xrceseq = NULL
 
               END IF
               #170920-00028 --- modify end ---
            ELSE
               CALL FGL_SET_ARR_CURR(g_xrce_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_xrce_d.getLength()+1
            END IF
            #(ver:43) ---start---
            #add-point:單身複製後 name="input.body.controlo"
            
            #end add-point
            #(ver:43) --- end ---
            
      END INPUT
      
      INPUT ARRAY g_xrce2_d FROM s_detail2.*
         ATTRIBUTE(COUNT = g_detail_cnt,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                 INSERT ROW = FALSE, #此頁面insert功能由產生器控制, 手動之設定無效! 
 
                 DELETE ROW = l_allow_delete,
                 APPEND ROW = l_allow_insert)
                 
         #自訂ACTION(detail_input,page_2)
         
         
         BEFORE INPUT
          CALL FGL_SET_ARR_CURR(g_detail_idx)
            
            CALL axrt300_02_b_fill(g_wc2)
            LET g_detail_cnt = g_xrce2_d.getLength()
    
         BEFORE INSERT
            LET g_insert = 'Y' 
            NEXT FIELD xrceld
 
            LET l_insert = TRUE
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_xrce2_d[l_ac].* TO NULL 
            INITIALIZE g_xrce2_d_t.* TO NULL
            INITIALIZE g_xrce2_d_o.* TO NULL
            #公用欄位給值(單身2)
            
            #自定義預設值(單身2)
                  LET g_xrce2_d[l_ac].xrce123 = "0"
      LET g_xrce2_d[l_ac].xrce133 = "0"
 
            #add-point:modify段before備份 name="input.body2.before_bak"
            
            #end add-point
            LET g_xrce2_d_t.* = g_xrce2_d[l_ac].*     #新輸入資料
            LET g_xrce2_d_o.* = g_xrce2_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_xrce_d[li_reproduce_target].* = g_xrce_d[li_reproduce].*
               LET g_xrce2_d[li_reproduce_target].* = g_xrce2_d[li_reproduce].*
               LET g_xrce3_d[li_reproduce_target].* = g_xrce3_d[li_reproduce].*
 
               LET g_xrce2_d[li_reproduce_target].xrceld = NULL
               LET g_xrce2_d[li_reproduce_target].xrcedocno = NULL
               LET g_xrce2_d[li_reproduce_target].xrceseq = NULL
            END IF
            
 
 
 
            CALL axrt300_02_set_entry_b(l_cmd)
            CALL axrt300_02_set_no_entry_b(l_cmd)
            #add-point:modify段before insert name="input.body2.before_insert"
 
            #end add-point  
            
         BEFORE ROW 
            #add-point:modify段before row name="input.body2.before_row2"
           #IF 1 = 0 THEN   #160420-00001#1 Mark
            #end add-point  
            LET l_insert = FALSE
            #(ver:42) ---start---
            LET g_current_page = 2
            CALL axrt300_02_idx_chk()
            #(ver:42) --- end ---
            LET g_detail_idx = DIALOG.getCurrentRow("s_detail2")
            LET l_cmd = ''
            LET l_ac_t = l_ac 
            LET l_ac = g_detail_idx
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
            DISPLAY g_xrce2_d.getLength() TO FORMONLY.cnt
         
            CALL s_transaction_begin()
            
            LET g_detail_cnt = g_xrce2_d.getLength()
            
            IF g_detail_cnt >= l_ac 
               AND g_xrce2_d[l_ac].xrceld IS NOT NULL
               AND g_xrce2_d[l_ac].xrcedocno IS NOT NULL
               AND g_xrce2_d[l_ac].xrceseq IS NOT NULL
            THEN 
               LET l_cmd='u'
               LET g_xrce2_d_t.* = g_xrce2_d[l_ac].*  #BACKUP
               LET g_xrce2_d_o.* = g_xrce2_d[l_ac].*  #BACKUP
               IF NOT axrt300_02_lock_b("xrce_t") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH axrt300_02_bcl INTO g_xrce_d[l_ac].xrce001,g_xrce_d[l_ac].xrcedocno,g_xrce_d[l_ac].xrceld, 
                      g_xrce_d[l_ac].xrcesite,g_xrce_d[l_ac].xrceseq,g_xrce_d[l_ac].xrce002,g_xrce_d[l_ac].xrce003, 
                      g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce005,g_xrce_d[l_ac].xrce024,g_xrce_d[l_ac].xrce025, 
                      g_xrce_d[l_ac].xrce008,g_xrce_d[l_ac].xrce015,g_xrce_d[l_ac].xrce100,g_xrce_d[l_ac].xrce101, 
                      g_xrce_d[l_ac].xrce103,g_xrce_d[l_ac].xrce104,g_xrce_d[l_ac].xrce109,g_xrce_d[l_ac].xrce113, 
                      g_xrce_d[l_ac].xrce114,g_xrce_d[l_ac].xrce119,g_xrce_d[l_ac].xrce027,g_xrce_d[l_ac].xrce028, 
                      g_xrce_d[l_ac].xrcecomp,g_xrce_d[l_ac].xrceorga,g_xrce_d[l_ac].xrce010,g_xrce_d[l_ac].xrce016, 
                      g_xrce2_d[l_ac].xrce001,g_xrce2_d[l_ac].xrcedocno,g_xrce2_d[l_ac].xrceld,g_xrce2_d[l_ac].xrcesite, 
                      g_xrce2_d[l_ac].xrceseq,g_xrce2_d[l_ac].xrce002,g_xrce2_d[l_ac].xrce003,g_xrce2_d[l_ac].xrce004, 
                      g_xrce2_d[l_ac].xrce008,g_xrce2_d[l_ac].xrce100,g_xrce2_d[l_ac].xrce103,g_xrce2_d[l_ac].xrce104, 
                      g_xrce2_d[l_ac].xrce109,g_xrce2_d[l_ac].xrce101,g_xrce2_d[l_ac].xrce113,g_xrce2_d[l_ac].xrce114, 
                      g_xrce2_d[l_ac].xrce119,g_xrce2_d[l_ac].xrce120,g_xrce2_d[l_ac].xrce121,g_xrce2_d[l_ac].xrce123, 
                      g_xrce2_d[l_ac].xrce124,g_xrce2_d[l_ac].xrce129,g_xrce2_d[l_ac].xrce130,g_xrce2_d[l_ac].xrce131, 
                      g_xrce2_d[l_ac].xrce133,g_xrce2_d[l_ac].xrce134,g_xrce2_d[l_ac].xrce139,g_xrce3_d[l_ac].xrce001, 
                      g_xrce3_d[l_ac].xrcedocno,g_xrce3_d[l_ac].xrceld,g_xrce3_d[l_ac].xrcesite,g_xrce3_d[l_ac].xrceseq, 
                      g_xrce3_d[l_ac].xrce002,g_xrce3_d[l_ac].xrce003,g_xrce3_d[l_ac].xrce004,g_xrce3_d[l_ac].xrce005, 
                      g_xrce3_d[l_ac].xrce008,g_xrce3_d[l_ac].xrce100,g_xrce3_d[l_ac].xrce109,g_xrce3_d[l_ac].xrce101, 
                      g_xrce3_d[l_ac].xrce119,g_xrce3_d[l_ac].xrce027,g_xrce3_d[l_ac].xrce010,g_xrce3_d[l_ac].xrce016, 
                      g_xrce3_d[l_ac].xrce017,g_xrce3_d[l_ac].xrce018,g_xrce3_d[l_ac].xrce019,g_xrce3_d[l_ac].xrce020, 
                      g_xrce3_d[l_ac].xrce022,g_xrce3_d[l_ac].xrce023,g_xrce3_d[l_ac].xrce040,g_xrce3_d[l_ac].xrce035, 
                      g_xrce3_d[l_ac].xrce036,g_xrce3_d[l_ac].xrce038,g_xrce3_d[l_ac].xrce039,g_xrce3_d[l_ac].xrce041, 
                      g_xrce3_d[l_ac].xrce042,g_xrce3_d[l_ac].xrce043,g_xrce3_d[l_ac].xrce044,g_xrce3_d[l_ac].xrce045, 
                      g_xrce3_d[l_ac].xrce046,g_xrce3_d[l_ac].xrce047,g_xrce3_d[l_ac].xrce048,g_xrce3_d[l_ac].xrce049, 
                      g_xrce3_d[l_ac].xrce050,g_xrce3_d[l_ac].xrce051
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "FETCH axrt300_02_bcl:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_xrce2_d_mask_o[l_ac].* =  g_xrce2_d[l_ac].*
                  CALL axrt300_02_xrce_t_mask()
                  LET g_xrce2_d_mask_n[l_ac].* =  g_xrce2_d[l_ac].*
                  
                  CALL cl_show_fld_cont()
                  CALL axrt300_02_detail_show()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            CALL axrt300_02_set_entry_b(l_cmd)
            CALL axrt300_02_set_no_entry_b(l_cmd)
            #add-point:modify段before row name="input.body2.before_row"
           #160420-00001#1 Mark ---(S)---
           #ELSE
           #   LET g_detail_idx = DIALOG.getCurrentRow("s_detail2")
           #   LET l_cmd = ''
           #   LET l_ac = ARR_CURR()
           #   LET l_lock_sw = 'N'            #DEFAULT
           #   LET l_n = ARR_COUNT()
           #   DISPLAY l_ac TO FORMONLY.idx
           #   DISPLAY g_xrce2_d.getLength() TO FORMONLY.cnt
           #
           #   CALL s_transaction_begin()
           #   
           #   LET g_detail_cnt = g_xrce2_d.getLength()
           #   
           #   IF g_detail_cnt >= l_ac 
           #      AND g_xrce2_d[l_ac].xrceld IS NOT NULL
           #      AND g_xrce2_d[l_ac].xrcedocno IS NOT NULL
           #
           #      AND g_xrce2_d[l_ac].xrceseq IS NOT NULL
           #
           #   THEN 
           #      LET l_cmd='u'
           #      LET g_xrce2_d_t.* = g_xrce2_d[l_ac].*  #BACKUP
           #      IF NOT axrt300_02_lock_b("xrce_t") THEN
           #         LET l_lock_sw='Y'
           #      ELSE
           #         SELECT gzcb004 INTO l_gzcb004
           #           FROM gzcb_t
           #          WHERE gzcb001 = '8306'
           #            AND gzcb002 = g_xrce_d[l_ac].xrce002
           #         IF l_gzcb004 = '2' THEN 
           #            FETCH axrt300_02_bcl INTO g_xrce_d[l_ac].xrce001,g_xrce_d[l_ac].xrcedocno,g_xrce_d[l_ac].xrceld, 
           #                g_xrce_d[l_ac].xrcesite,g_xrce_d[l_ac].xrceseq,g_xrce_d[l_ac].xrce002,g_xrce_d[l_ac].xrce006, 
           #                g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce005,g_xrce_d[l_ac].xrce024, 
           #                g_xrce_d[l_ac].xrce025,g_xrce_d[l_ac].xrce008,g_xrce_d[l_ac].xrce015,g_xrce_d[l_ac].xrce100, 
           #                g_xrce_d[l_ac].xrce101,g_xrce_d[l_ac].xrce109,g_xrce_d[l_ac].xrce119,g_xrce_d[l_ac].xrce027, 
           #                g_xrce_d[l_ac].xrce028,g_xrce_d[l_ac].xrce104,g_xrce_d[l_ac].xrce114,g_xrce_d[l_ac].xrce124, 
           #                g_xrce_d[l_ac].xrce134,g_xrce_d[l_ac].xrcecomp,g_xrce_d[l_ac].xrceorga,g_xrce_d[l_ac].xrce010, 
           #                g_xrce_d[l_ac].xrce016,g_xrce2_d[l_ac].xrce001,g_xrce2_d[l_ac].xrcedocno,g_xrce2_d[l_ac].xrceld, 
           #                g_xrce2_d[l_ac].xrcesite,g_xrce2_d[l_ac].xrceseq,g_xrce2_d[l_ac].xrce002,g_xrce2_d[l_ac].xrce006, 
           #                g_xrce2_d[l_ac].xrce003,g_xrce2_d[l_ac].xrce004,g_xrce2_d[l_ac].xrce008,g_xrce2_d[l_ac].xrce100, 
           #                g_xrce2_d[l_ac].xrce109,g_xrce2_d[l_ac].xrce101,g_xrce2_d[l_ac].xrce119,g_xrce2_d[l_ac].xrce120, 
           #                g_xrce2_d[l_ac].xrce121,g_xrce2_d[l_ac].xrce129,g_xrce2_d[l_ac].xrce130,g_xrce2_d[l_ac].xrce131, 
           #                g_xrce2_d[l_ac].xrce139,g_xrce3_d[l_ac].xrce001,g_xrce3_d[l_ac].xrcedocno,g_xrce3_d[l_ac].xrceld, 
           #                g_xrce3_d[l_ac].xrcesite,g_xrce3_d[l_ac].xrceseq,g_xrce3_d[l_ac].xrce002,g_xrce3_d[l_ac].xrce006, 
           #                g_xrce3_d[l_ac].xrce003,g_xrce3_d[l_ac].xrce004,g_xrce3_d[l_ac].xrce005,g_xrce3_d[l_ac].xrce008, 
           #                g_xrce3_d[l_ac].xrce100,g_xrce3_d[l_ac].xrce109,g_xrce3_d[l_ac].xrce101,g_xrce3_d[l_ac].xrce119, 
           #                g_xrce3_d[l_ac].xrce027,g_xrce3_d[l_ac].xrce010,g_xrce3_d[l_ac].xrce016,g_xrce3_d[l_ac].xrce017, 
           #                g_xrce3_d[l_ac].xrce018,g_xrce3_d[l_ac].xrce019,g_xrce3_d[l_ac].xrce020,g_xrce3_d[l_ac].xrce022, 
           #                g_xrce3_d[l_ac].xrce023
           #         ELSE
           #            FETCH axrt300_02_bcl1 INTO g_xrce_d[l_ac].xrce001,g_xrce_d[l_ac].xrcedocno,g_xrce_d[l_ac].xrceld,
           #                g_xrce_d[l_ac].xrcesite,g_xrce_d[l_ac].xrceseq,g_xrce_d[l_ac].xrce002,g_xrce_d[l_ac].xrce006,
           #                g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce008,g_xrce_d[l_ac].xrce100,
           #                g_xrce_d[l_ac].xrce109,g_xrce_d[l_ac].xrce101,g_xrce_d[l_ac].xrce119,
           #                g_xrce_d[l_ac].xrce015,g_xrce_d[l_ac].xrce028,g_xrce_d[l_ac].xrcecomp,
           #                g_xrce_d[l_ac].xrceorga,g_xrce_d[l_ac].xrce010,g_xrce_d[l_ac].xrce016,g_xrce_d[l_ac].xrde012,
           #                g_xrce2_d[l_ac].xrce001,g_xrce2_d[l_ac].xrcedocno,g_xrce2_d[l_ac].xrceld,
           #                g_xrce2_d[l_ac].xrcesite,g_xrce2_d[l_ac].xrceseq,g_xrce2_d[l_ac].xrce002,g_xrce2_d[l_ac].xrce006,
           #                g_xrce2_d[l_ac].xrce003,g_xrce2_d[l_ac].xrce004,g_xrce2_d[l_ac].xrce008,g_xrce2_d[l_ac].xrce100,
           #                g_xrce2_d[l_ac].xrce109,g_xrce2_d[l_ac].xrce101,g_xrce2_d[l_ac].xrce119,g_xrce2_d[l_ac].xrce120,
           #                g_xrce2_d[l_ac].xrce121,g_xrce2_d[l_ac].xrce129,g_xrce2_d[l_ac].xrce130,g_xrce2_d[l_ac].xrce131,
           #                g_xrce2_d[l_ac].xrce139,g_xrce3_d[l_ac].xrce001,g_xrce3_d[l_ac].xrcedocno,g_xrce3_d[l_ac].xrceld,
           #                g_xrce3_d[l_ac].xrcesite,g_xrce3_d[l_ac].xrceseq,g_xrce3_d[l_ac].xrce002,g_xrce3_d[l_ac].xrce006,
           #                g_xrce3_d[l_ac].xrce003,g_xrce3_d[l_ac].xrce004,g_xrce3_d[l_ac].xrce008,
           #                g_xrce3_d[l_ac].xrce100,g_xrce3_d[l_ac].xrce109,g_xrce3_d[l_ac].xrce101,g_xrce3_d[l_ac].xrce119,
           #                g_xrce3_d[l_ac].xrce010,g_xrce3_d[l_ac].xrce016,g_xrce3_d[l_ac].xrce017,
           #                g_xrce3_d[l_ac].xrce018,g_xrce3_d[l_ac].xrce019,g_xrce3_d[l_ac].xrce020,g_xrce3_d[l_ac].xrce022,
           #                g_xrce3_d[l_ac].xrce023
           #         END IF
           #         IF SQLCA.sqlcode THEN
           #            INITIALIZE g_errparam TO NULL
           #            LET g_errparam.code = SQLCA.sqlcode
           #            LET g_errparam.extend = ''
           #            LET g_errparam.popup = TRUE
           #            CALL cl_err()
           #
           #            LET l_lock_sw = "Y"
           #         END IF
           #         
           #         CALL cl_show_fld_cont()
           #         CALL axrt300_02_detail_show()
           #      END IF
           #   ELSE
           #      LET l_cmd='a'
           #   END IF
           #END IF
           #160420-00001#1 Mark ---(E)---
           
           #160628-00002#1--add--str--
            IF l_cmd = 'u' THEN
               IF g_xrce_d[l_ac].xrce027 = 'Y' THEN
                  #判断是否冲抵完，如果全冲销完，未税金额和税额不可修改
                  CALL s_axrt300_not_washed_amt(g_xrce_d[l_ac].xrceld,g_xrce_d[l_ac].xrcedocno,g_xrce_d[l_ac].xrceseq,g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce005)
                  RETURNING r_xrce_w.*
                  IF r_xrce_w.xrce109 = g_xrce_d[l_ac].xrce109 THEN
                     CALL cl_set_comp_entry("xrce103,xrce104,xrce113,xrce114,xrce123,xrce124,xrce133,xrce134",FALSE)
                  ELSE
                     CALL cl_set_comp_entry("xrce103,xrce104,xrce113,xrce114,xrce123,xrce124,xrce133,xrce134",TRUE)
                  END IF
               ELSE
                  CALL cl_set_comp_entry("xrce103,xrce104,xrce113,xrce114,xrce123,xrce124,xrce133,xrce134",FALSE)
               END IF
            END IF
            #160628-00002#1--add--end           
            #end add-point  
            #其他table資料備份(確定是否更改用)
            
 
 
 
            #其他table進行lock
            
 
 
 
            
         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' THEN
               LET l_cmd='d'
            ELSE
               #add-point:單身2ask刪除前 name="input.body2.b_delete_ask" #171003-00009#1
               
               #end add-point 
            
               IF NOT cl_ask_del_detail() THEN
                  CANCEL DELETE
               END IF
               IF l_lock_sw = "Y" THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code = -263 
                  LET g_errparam.popup = TRUE 
                  CALL cl_err()
                  CANCEL DELETE
               END IF
               #171006-00020 ---start---
               #確定是否有刪除的權限
               #先確定該table有ownid
               IF cl_getField("xrce_t","") THEN   
                  IF NOT cl_auth_chk_act_permission("delete") THEN
                     #有目前權限無法刪除的資料
                     CANCEL DELETE
                  END IF
               END IF
               #171006-00020 --- end ---
               
               #add-point:單身2刪除前 name="input.body2.b_delete"
              #160420-00001#1 Mark ---(S)---
              #SELECT gzcb004 INTO l_gzcb004
              #  FROM gzcb_t
              # WHERE gzcb001 = '8306'
              #   AND gzcb002 = g_xrce_d[l_ac].xrce002
              #IF l_gzcb004 = '2' THEN
              #160420-00001#1 Mark ---(E)---
               #end add-point 
               
               DELETE FROM xrce_t
                WHERE xrceent = g_enterprise AND
                  xrceld = g_xrce2_d_t.xrceld
                  AND xrcedocno = g_xrce2_d_t.xrcedocno
                  AND xrceseq = g_xrce2_d_t.xrceseq
                  
               #add-point:單身2刪除中 name="input.body2.m_delete"
              #160420-00001#1 Mark ---(S)---
              #ELSE
              #   DELETE FROM xrde_t
              #    WHERE xrdeent = g_enterprise 
              #      AND xrdeld = g_xrce2_d_t.xrceld
              #      AND xrdedocno = g_xrce2_d_t.xrcedocno
              #      AND xrdeseq = g_xrce2_d_t.xrceseq
              #END IF
              #160420-00001#1 Mark ---(E)---
               #end add-point 
                  
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "xrce_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE
                  LET g_errparam.popup = TRUE 
                  CALL cl_err()
                  CANCEL DELETE   
               ELSE
                  LET g_detail_cnt = g_detail_cnt-1
                  
 
 
 
                  
 
 
   #161130-00056
                  #add-point:單身2刪除後 name="input.body2.a_delete"
                  
                  #end add-point
                  #修改歷程記錄(刪除)
                  CALL axrt300_02_set_pk_array()
                  LET g_log1 = util.JSON.stringify(g_xrce2_d[l_ac])   #(ver:38)
                  IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:38)
                  ELSE
                  END IF
               END IF 
               CLOSE axrt300_02_bcl
               #add-point:單身2刪除關閉bcl name="input.body2.close"
              #CLOSE axrt300_02_bcl1   #160420-00001#1 Mark
               #end add-point
               LET l_count = g_xrce_d.getLength()
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_xrce2_d_t.xrceld
               LET gs_keys[2] = g_xrce2_d_t.xrcedocno
               LET gs_keys[3] = g_xrce2_d_t.xrceseq
 
               #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL axrt300_02_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
 
            END IF 
            
         AFTER DELETE 
            IF l_cmd <> 'd' THEN
               #add-point:單身刪除後2 name="input.body2.after_delete"
               
               #end add-point
                              CALL axrt300_02_delete_b('xrce_t',gs_keys,"'2'")
            END IF
            #如果是最後一筆
            IF l_ac = (g_xrce2_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
            #add-point:單身刪除後3 name="input.body2.after_delete3"
            
            #end add-point
 
         AFTER INSERT    
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CALL cl_err()
               LET INT_FLAG = 0
               CANCEL INSERT
            END IF
               
            LET l_count = 1  
            SELECT COUNT(1) INTO l_count FROM xrce_t 
             WHERE xrceent = g_enterprise AND
                   xrceld = g_xrce2_d[l_ac].xrceld
                   AND xrcedocno = g_xrce2_d[l_ac].xrcedocno
                   AND xrceseq = g_xrce2_d[l_ac].xrceseq
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身2新增前 name="input.body2.b_insert"
 
               #end add-point
            
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_xrce2_d[g_detail_idx].xrceld
               LET gs_keys[2] = g_xrce2_d[g_detail_idx].xrcedocno
               LET gs_keys[3] = g_xrce2_d[g_detail_idx].xrceseq
               CALL axrt300_02_insert_b('xrce_t',gs_keys,"'2'")
                           
               #add-point:單身新增後2 name="input.body2.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_xrce_d[l_ac].* TO NULL
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "xrce_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL axrt300_02_b_fill(g_wc2)
               #資料多語言用-增/改
               
                  #161130-00056
               #add-point:單身新增後 name="input.body2.after_insert"
               
               #end add-point
               ##ERROR 'INSERT O.K'
               LET g_detail_cnt = g_detail_cnt + 1
               LET g_wc2 = g_wc2, " OR (xrceld = '", g_xrce2_d[l_ac].xrceld, "' "
                                  ," AND xrcedocno = '", g_xrce2_d[l_ac].xrcedocno, "' "
                                  ," AND xrceseq = '", g_xrce2_d[l_ac].xrceseq, "' "
                                  ,")"
            END IF
            
         ON ROW CHANGE 
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CALL cl_err()
               LET INT_FLAG = 0
               LET g_xrce2_d[l_ac].* = g_xrce2_d_t.*
               CLOSE axrt300_02_bcl
               #add-point:單身page2取消後 name="input.body2.cancel"
              #CLOSE axrt300_02_bcl1   #160420-00001#1 Mark
               #end add-point
               EXIT DIALOG 
            END IF
            
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_xrce2_d[l_ac].* = g_xrce2_d_t.*
            ELSE
               
               #寫入修改者/修改日期資訊(單身2)
               
               
               #add-point:單身page2修改前 name="input.body2.b_update"
              #160420-00001#1 Mark ---(S)---
              #SELECT gzcb004 INTO l_gzcb004
              #  FROM gzcb_t
              # WHERE gzcb001 = '8306'
              #   AND gzcb002 = g_xrce_d[l_ac].xrce002
              #IF l_gzcb004 = '2' THEN
              #160420-00001#1 Mark ---(E)---
               #end add-point
               
               #將遮罩欄位還原
               CALL axrt300_02_xrce_t_mask_restore('restore_mask_o')
               
               UPDATE xrce_t SET (xrce001,xrcedocno,xrceld,xrcesite,xrceseq,xrce002,xrce003,xrce004, 
                   xrce005,xrce024,xrce025,xrce008,xrce015,xrce100,xrce101,xrce103,xrce104,xrce109,xrce113, 
                   xrce114,xrce119,xrce027,xrce028,xrcecomp,xrceorga,xrce010,xrce016,xrce120,xrce121, 
                   xrce123,xrce124,xrce129,xrce130,xrce131,xrce133,xrce134,xrce139,xrce017,xrce018,xrce019, 
                   xrce020,xrce022,xrce023,xrce040,xrce035,xrce036,xrce038,xrce039,xrce041,xrce042,xrce043, 
                   xrce044,xrce045,xrce046,xrce047,xrce048,xrce049,xrce050,xrce051) = (g_xrce_d[l_ac].xrce001, 
                   g_xrce_d[l_ac].xrcedocno,g_xrce_d[l_ac].xrceld,g_xrce_d[l_ac].xrcesite,g_xrce_d[l_ac].xrceseq, 
                   g_xrce_d[l_ac].xrce002,g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce005, 
                   g_xrce_d[l_ac].xrce024,g_xrce_d[l_ac].xrce025,g_xrce_d[l_ac].xrce008,g_xrce_d[l_ac].xrce015, 
                   g_xrce_d[l_ac].xrce100,g_xrce_d[l_ac].xrce101,g_xrce_d[l_ac].xrce103,g_xrce_d[l_ac].xrce104, 
                   g_xrce_d[l_ac].xrce109,g_xrce_d[l_ac].xrce113,g_xrce_d[l_ac].xrce114,g_xrce_d[l_ac].xrce119, 
                   g_xrce_d[l_ac].xrce027,g_xrce_d[l_ac].xrce028,g_xrce_d[l_ac].xrcecomp,g_xrce_d[l_ac].xrceorga, 
                   g_xrce_d[l_ac].xrce010,g_xrce_d[l_ac].xrce016,g_xrce2_d[l_ac].xrce120,g_xrce2_d[l_ac].xrce121, 
                   g_xrce2_d[l_ac].xrce123,g_xrce2_d[l_ac].xrce124,g_xrce2_d[l_ac].xrce129,g_xrce2_d[l_ac].xrce130, 
                   g_xrce2_d[l_ac].xrce131,g_xrce2_d[l_ac].xrce133,g_xrce2_d[l_ac].xrce134,g_xrce2_d[l_ac].xrce139, 
                   g_xrce3_d[l_ac].xrce017,g_xrce3_d[l_ac].xrce018,g_xrce3_d[l_ac].xrce019,g_xrce3_d[l_ac].xrce020, 
                   g_xrce3_d[l_ac].xrce022,g_xrce3_d[l_ac].xrce023,g_xrce3_d[l_ac].xrce040,g_xrce3_d[l_ac].xrce035, 
                   g_xrce3_d[l_ac].xrce036,g_xrce3_d[l_ac].xrce038,g_xrce3_d[l_ac].xrce039,g_xrce3_d[l_ac].xrce041, 
                   g_xrce3_d[l_ac].xrce042,g_xrce3_d[l_ac].xrce043,g_xrce3_d[l_ac].xrce044,g_xrce3_d[l_ac].xrce045, 
                   g_xrce3_d[l_ac].xrce046,g_xrce3_d[l_ac].xrce047,g_xrce3_d[l_ac].xrce048,g_xrce3_d[l_ac].xrce049, 
                   g_xrce3_d[l_ac].xrce050,g_xrce3_d[l_ac].xrce051) #自訂欄位頁簽
                WHERE xrceent = g_enterprise AND
                  xrceld = g_xrce2_d_t.xrceld #項次 
                  AND xrcedocno = g_xrce2_d_t.xrcedocno
                  AND xrceseq = g_xrce2_d_t.xrceseq
                  
               #add-point:單身page2修改中 name="input.body2.m_update"
              #160420-00001#1 Mark ---(S)---
              #ELSE
              #   UPDATE xrde_t SET (xrde001,xrdedocno,xrdeld,xrdesite,xrdeseq,xrde002,xrde006,xrde003, 
              #                      xrde004,xrde008,xrde100,xrde109,xrde101,xrde119,xrde010, 
              #                      xrde018,xrde015,xrde028,xrdecomp,xrdeorga,xrde120, 
              #                      xrde121,xrde129,xrde130,xrde131,xrde139,xrde016,xrde017,xrde019,xrde020,xrde022,xrde023) = (g_xrce_d[l_ac].xrce001, 
              #                      g_xrce_d[l_ac].xrcedocno,g_xrce_d[l_ac].xrceld,g_xrce_d[l_ac].xrcesite,g_xrce_d[l_ac].xrceseq, 
              #                      g_xrce_d[l_ac].xrce002,g_xrce_d[l_ac].xrce006,g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004, 
              #                      g_xrce_d[l_ac].xrce008, 
              #                      g_xrce_d[l_ac].xrce100,g_xrce_d[l_ac].xrce109,g_xrce_d[l_ac].xrce101,g_xrce_d[l_ac].xrce119, 
              #                      g_xrce3_d[l_ac].xrce010,g_xrce3_d[l_ac].xrce018,g_xrce_d[l_ac].xrce015, 
              #                      g_xrce_d[l_ac].xrce028, 
              #                      g_xrce_d[l_ac].xrcecomp,g_xrce_d[l_ac].xrceorga,g_xrce2_d[l_ac].xrce120, 
              #                      g_xrce2_d[l_ac].xrce121,g_xrce2_d[l_ac].xrce129,g_xrce2_d[l_ac].xrce130,g_xrce2_d[l_ac].xrce131, 
              #                      g_xrce2_d[l_ac].xrce139,g_xrce3_d[l_ac].xrce016,g_xrce3_d[l_ac].xrce017,g_xrce3_d[l_ac].xrce019, 
              #                      g_xrce3_d[l_ac].xrce020,g_xrce3_d[l_ac].xrce022,g_xrce3_d[l_ac].xrce023)
              # WHERE xrdeent = g_enterprise 
              #   AND xrdeld = g_xrce2_d_t.xrceld #項次 
              #   AND xrdedocno = g_xrce2_d_t.xrcedocno
              #   AND xrdeseq = g_xrce2_d_t.xrceseq
              #END IF
              #160420-00001#1 Mark ---(E)---
               #end add-point
                  
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "xrce_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                  WHEN SQLCA.SQLCODE #其他錯誤
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "xrce_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                  OTHERWISE
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_xrce2_d[g_detail_idx].xrceld
               LET gs_keys_bak[1] = g_xrce2_d_t.xrceld
               LET gs_keys[2] = g_xrce2_d[g_detail_idx].xrcedocno
               LET gs_keys_bak[2] = g_xrce2_d_t.xrcedocno
               LET gs_keys[3] = g_xrce2_d[g_detail_idx].xrceseq
               LET gs_keys_bak[3] = g_xrce2_d_t.xrceseq
               CALL axrt300_02_update_b('xrce_t',gs_keys,gs_keys_bak,"'2'")
                     #資料多語言用-增/改
                     
                        #161130-00056
                     
                     #修改歷程記錄(修改)
                     LET g_log1 = util.JSON.stringify(g_xrce2_d_t)
                     LET g_log2 = util.JSON.stringify(g_xrce2_d[l_ac])
                     IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                     END IF
               END CASE
               
               #將遮罩欄位進行遮蔽
               CALL axrt300_02_xrce_t_mask_restore('restore_mask_n')
               
               #add-point:單身page2修改後 name="input.body2.a_update"
               CALL axrt300_02_ref_amt()
               #end add-point
            END IF
         
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce001_t
            #add-point:BEFORE FIELD xrce001_t name="input.b.page2.xrce001_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce001_t
            
            #add-point:AFTER FIELD xrce001_t name="input.a.page2.xrce001_t"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce001_t
            #add-point:ON CHANGE xrce001_t name="input.g.page2.xrce001_t"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcedocno_t
            #add-point:BEFORE FIELD xrcedocno_t name="input.b.page2.xrcedocno_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcedocno_t
            
            #add-point:AFTER FIELD xrcedocno_t name="input.a.page2.xrcedocno_t"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcedocno_t
            #add-point:ON CHANGE xrcedocno_t name="input.g.page2.xrcedocno_t"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrceld_t
            #add-point:BEFORE FIELD xrceld_t name="input.b.page2.xrceld_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrceld_t
            
            #add-point:AFTER FIELD xrceld_t name="input.a.page2.xrceld_t"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrceld_t
            #add-point:ON CHANGE xrceld_t name="input.g.page2.xrceld_t"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcesite_t
            #add-point:BEFORE FIELD xrcesite_t name="input.b.page2.xrcesite_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcesite_t
            
            #add-point:AFTER FIELD xrcesite_t name="input.a.page2.xrcesite_t"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcesite_t
            #add-point:ON CHANGE xrcesite_t name="input.g.page2.xrcesite_t"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrceseq_t
            #add-point:BEFORE FIELD xrceseq_t name="input.b.page2.xrceseq_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrceseq_t
            
            #add-point:AFTER FIELD xrceseq_t name="input.a.page2.xrceseq_t"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrceseq_t
            #add-point:ON CHANGE xrceseq_t name="input.g.page2.xrceseq_t"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce002_t
            #add-point:BEFORE FIELD xrce002_t name="input.b.page2.xrce002_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce002_t
            
            #add-point:AFTER FIELD xrce002_t name="input.a.page2.xrce002_t"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce002_t
            #add-point:ON CHANGE xrce002_t name="input.g.page2.xrce002_t"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce003_t
            #add-point:BEFORE FIELD xrce003_t name="input.b.page2.xrce003_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce003_t
            
            #add-point:AFTER FIELD xrce003_t name="input.a.page2.xrce003_t"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce003_t
            #add-point:ON CHANGE xrce003_t name="input.g.page2.xrce003_t"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce004_t
            #add-point:BEFORE FIELD xrce004_t name="input.b.page2.xrce004_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce004_t
            
            #add-point:AFTER FIELD xrce004_t name="input.a.page2.xrce004_t"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce004_t
            #add-point:ON CHANGE xrce004_t name="input.g.page2.xrce004_t"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce008_t
            #add-point:BEFORE FIELD xrce008_t name="input.b.page2.xrce008_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce008_t
            
            #add-point:AFTER FIELD xrce008_t name="input.a.page2.xrce008_t"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce008_t
            #add-point:ON CHANGE xrce008_t name="input.g.page2.xrce008_t"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce100_t
            #add-point:BEFORE FIELD xrce100_t name="input.b.page2.xrce100_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce100_t
            
            #add-point:AFTER FIELD xrce100_t name="input.a.page2.xrce100_t"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce100_t
            #add-point:ON CHANGE xrce100_t name="input.g.page2.xrce100_t"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce103_t
            #add-point:BEFORE FIELD xrce103_t name="input.b.page2.xrce103_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce103_t
            
            #add-point:AFTER FIELD xrce103_t name="input.a.page2.xrce103_t"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce103_t
            #add-point:ON CHANGE xrce103_t name="input.g.page2.xrce103_t"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce104_t
            #add-point:BEFORE FIELD xrce104_t name="input.b.page2.xrce104_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce104_t
            
            #add-point:AFTER FIELD xrce104_t name="input.a.page2.xrce104_t"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce104_t
            #add-point:ON CHANGE xrce104_t name="input.g.page2.xrce104_t"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce109_t
            #add-point:BEFORE FIELD xrce109_t name="input.b.page2.xrce109_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce109_t
            
            #add-point:AFTER FIELD xrce109_t name="input.a.page2.xrce109_t"
            IF NOT cl_null(g_xrce2_d[l_ac].xrce109) AND NOT cl_null(g_xrce2_d[l_ac].xrce003) AND g_xrce2_d[l_ac].xrce002 = '10' THEN
               LET g_xrce_d[l_ac].xrce109 = g_xrce2_d[l_ac].xrce109
               LET g_xrce_d[l_ac].xrce101 = g_xrce2_d[l_ac].xrce101
               LET g_xrce_d[l_ac].xrce119 = g_xrce2_d[l_ac].xrce119
               CALL axrt300_02_chk_xrce109()
               IF NOT cl_null(g_errno) THEN
                  IF l_cmd = 'a' THEN
                     DISPLAY 0 TO s_detail2[l_ac].xrce109
                  ELSE
                     DISPLAY g_xrce_t.xrce109 TO s_detail2[l_ac].xrce109
                  END IF
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_xrce2_d[l_ac].xrce109
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  IF l_cmd = 'a' THEN
                     LET g_xrce2_d[l_ac].xrce109 = 0
                  ELSE
                     LET g_xrce2_d[l_ac].xrce109 = g_xrce_t.xrce109
                  END IF
                  DISPLAY g_xrce2_d[l_ac].xrce109 TO s_detail2[l_ac].xrce109
                  NEXT FIELD xrce109_t
               END IF
            END IF
            IF NOT cl_null(g_xrce2_d[l_ac].xrce101) AND NOT cl_null(g_xrce2_d[l_ac].xrce109) THEN
               LET g_xrce2_d[l_ac].xrce119 = g_xrce2_d[l_ac].xrce109 * g_xrce2_d[l_ac].xrce101
              #LET g_xrce2_d[l_ac].xrce119 = s_curr_round(g_glaa_t.glaacomp,g_glaa_t.glaa001,g_xrce2_d[l_ac].xrce119,2)     #150821-00002#1 Mark
               #150821-00002#1 Add ---(S)---
               SELECT glaa001 INTO l_glaa001 FROM glaa_t WHERE glaaent = g_enterprise
                 #AND glaald = g_xrca_m.xrcald   #150909 mark
                  AND glaald = g_xrca_t.xrcald   #150909                   
                CALL s_curr_round_ld('1',g_xrca_t.xrcald,l_glaa001,g_xrce_d[l_ac].xrce119,2)
                   RETURNING l_success,g_errno,g_xrce_d[l_ac].xrce119
               #150821-00002#1 Add ---(E)---
               DISPLAY g_xrce2_d[l_ac].xrce119 TO s_detail2[l_ac].xrce119
               IF g_glaa_t.glaa015 = 'Y' THEN
                  LET g_xrce2_d[l_ac].xrce129 = g_xrce2_d[l_ac].xrce109 * g_xrce2_d[l_ac].xrce121
                 #LET g_xrce2_d[l_ac].xrce129 = s_curr_round(g_glaa_t.glaacomp,g_xrce2_d[l_ac].xrce120,g_xrce2_d[l_ac].xrce121,2)     #150821-00002#1 Mark
                 #150821-00002#1 Add ---(S)---
                  CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa016,g_xrce2_d[l_ac].xrce121,2)
                     RETURNING l_success,g_errno,g_xrce2_d[l_ac].xrce121
                 #150821-00002#1 Add ---(E)---
               END IF
               IF g_glaa_t.glaa019 = 'Y' THEN
                  LET g_xrce2_d[l_ac].xrce139 = g_xrce2_d[l_ac].xrce109 * g_xrce2_d[l_ac].xrce131
                 #LET g_xrce2_d[l_ac].xrce139 = s_curr_round(g_glaa_t.glaacomp,g_xrce2_d[l_ac].xrce130,g_xrce2_d[l_ac].xrce131,2)     #150821-00002#1 Mark
                 #150821-00002#1 Add ---(S)---
                  CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_glaa_t.glaa016,g_xrce2_d[l_ac].xrce131,2)
                     RETURNING l_success,g_errno,g_xrce2_d[l_ac].xrce131
                 #150821-00002#1 Add ---(E)---
               END IF
            END IF
            IF NOT cl_null(g_xrce2_d[l_ac].xrce109) AND NOT cl_null(g_xrce_d[l_ac].xrce024) AND g_xrce2_d[l_ac].xrce002 = '31' THEN
               LET g_xrce_d[l_ac].xrce109 = g_xrce2_d[l_ac].xrce109
               LET g_xrce_d[l_ac].xrce101 = g_xrce2_d[l_ac].xrce101
               LET g_xrce_d[l_ac].xrce119 = g_xrce2_d[l_ac].xrce119
               CALL axrt300_02_chk_xrce109_1()
               IF NOT cl_null(g_errno) THEN
                  IF l_cmd = 'a' THEN
                     DISPLAY 0 TO s_detail2[l_ac].xrce109
                  ELSE
                     DISPLAY g_xrce_t.xrce109 TO s_detail2[l_ac].xrce109
                  END IF
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_xrce2_d[l_ac].xrce109
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  IF l_cmd = 'a' THEN
                     LET g_xrce2_d[l_ac].xrce109 = 0
                  ELSE
                     LET g_xrce2_d[l_ac].xrce109 = g_xrce_t.xrce109
                  END IF
                  DISPLAY g_xrce2_d[l_ac].xrce109 TO s_detail2[l_ac].xrce109
                  NEXT FIELD xrce109_t
               END IF
            END IF
            IF NOT cl_null(g_xrce2_d[l_ac].xrce101) AND NOT cl_null(g_xrce2_d[l_ac].xrce109) THEN
               LET g_xrce2_d[l_ac].xrce119 = g_xrce2_d[l_ac].xrce109 * g_xrce2_d[l_ac].xrce101
               DISPLAY g_xrce3_d[l_ac].xrce119 TO s_detail2[l_ac].xrce119
            END IF
            LET g_xrce_t.xrce109 = g_xrce2_d[l_ac].xrce109
            LET g_xrce_d[l_ac].xrce109 = g_xrce2_d[l_ac].xrce109
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce109_t
            #add-point:ON CHANGE xrce109_t name="input.g.page2.xrce109_t"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce101_t
            #add-point:BEFORE FIELD xrce101_t name="input.b.page2.xrce101_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce101_t
            
            #add-point:AFTER FIELD xrce101_t name="input.a.page2.xrce101_t"
            IF cl_null(g_xrce2_d[l_ac].xrce003) AND cl_null(g_xrce2_d[l_ac].xrce101) 
               AND NOT cl_null(g_xrce2_d[l_ac].xrce109) AND NOT cl_null(g_xrce2_d[l_ac].xrce100) THEN
               SELECT ooab002 INTO l_ooab002 FROM ooab_t
                WHERE ooabent = g_enterprise
                  AND ooabsite= g_xrca_t.xrcasite
                  AND ooab001 = 'S-BAS-0010'
                  
               #151012-00014#1--mark--str--lujh
               #                         #匯率參照表;帳套;           日期;               來源幣別
               #CALL s_aooi160_get_exrate('2',g_xrca_t.xrcald,g_xrca_t.xrcadocdt,g_xrce2_d[l_ac].xrce100,
               #                         #目的幣別;  交易金額;              匯類類型
               #                          g_glaa_t.glaa001,0,l_ooab002)
               #   RETURNING g_xrce2_d[l_ac].xrce101
               #151012-00014#1--mark--end--lujh
                  
               #151012-00014#1--add--str--lujh
               LET lc_param.apca004 = g_xrca_t.xrca004
               LET ls_js = util.JSON.stringify(lc_param)
               CALL s_fin_get_curr_rate(g_xrca_t.xrcacomp,g_xrca_t.xrcald,g_xrca_t.xrcadocdt,g_xrca_t.xrca100,ls_js)    
                    RETURNING g_xrce_d[l_ac].xrce101,l_desc,l_desc      
               #151012-00014#1--add--end--lujh    
                  
               DISPLAY g_xrce2_d[l_ac].xrce101 TO s_detail2[l_ac].xrce101
            END IF
            IF NOT cl_null(g_xrce2_d[l_ac].xrce101) AND NOT cl_null(g_xrce2_d[l_ac].xrce109) THEN
               LET g_xrce2_d[l_ac].xrce119 = g_xrce2_d[l_ac].xrce109 * g_xrce2_d[l_ac].xrce101
               DISPLAY g_xrce2_d[l_ac].xrce119 TO s_detail2[l_ac].xrce119
            END IF
            IF cl_null(g_xrce_d[l_ac].xrce024) AND cl_null(g_xrce2_d[l_ac].xrce101) 
               AND NOT cl_null(g_xrce2_d[l_ac].xrce109) AND NOT cl_null(g_xrce2_d[l_ac].xrce100) THEN
               SELECT ooab002 INTO l_ooab002 FROM ooab_t
                WHERE ooabent = g_enterprise
                  AND ooabsite= g_xrca_t.xrcasite
                  AND ooab001 = 'S-BAS-0010'
               #151012-00014#1--mark--str--lujh
               #                         #匯率參照表;帳套;           日期;               來源幣別
               #CALL s_aooi160_get_exrate('2',g_xrca_t.xrcald,g_xrca_t.xrcadocdt,g_xrce2_d[l_ac].xrce100,
               #                         #目的幣別;  交易金額;              匯類類型
               #                          g_glaa_t.glaa001,g_xrce2_d[l_ac].xrce109,l_ooab002)
               #   RETURNING g_xrce2_d[l_ac].xrce101
               #151012-00014#1--mark--end--lujh
                  
               #151012-00014#1--add--str--lujh
               LET lc_param.apca004 = g_xrca_t.xrca004
               LET ls_js = util.JSON.stringify(lc_param)
               CALL s_fin_get_curr_rate(g_xrca_t.xrcacomp,g_xrca_t.xrcald,g_xrca_t.xrcadocdt,g_xrca_t.xrca100,ls_js)    
                    RETURNING g_xrce_d[l_ac].xrce101,l_desc,l_desc      
               #151012-00014#1--add--end--lujh
               DISPLAY g_xrce2_d[l_ac].xrce101 TO s_detail3[l_ac].xrce101
            END IF
            IF NOT cl_null(g_xrce2_d[l_ac].xrce101) AND NOT cl_null(g_xrce2_d[l_ac].xrce109) THEN
               LET g_xrce2_d[l_ac].xrce119 = g_xrce2_d[l_ac].xrce109* g_xrce2_d[l_ac].xrce101
               DISPLAY g_xrce2_d[l_ac].xrce119 TO s_detail3[l_ac].xrce119
            END IF
            LET g_xrce_d[l_ac].xrce109 = g_xrce2_d[l_ac].xrce109
            LET g_xrce_d[l_ac].xrce101 = g_xrce2_d[l_ac].xrce101
            LET g_xrce_d[l_ac].xrce119 = g_xrce2_d[l_ac].xrce119
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce101_t
            #add-point:ON CHANGE xrce101_t name="input.g.page2.xrce101_t"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce113_t
            #add-point:BEFORE FIELD xrce113_t name="input.b.page2.xrce113_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce113_t
            
            #add-point:AFTER FIELD xrce113_t name="input.a.page2.xrce113_t"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce113_t
            #add-point:ON CHANGE xrce113_t name="input.g.page2.xrce113_t"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce114_t
            #add-point:BEFORE FIELD xrce114_t name="input.b.page2.xrce114_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce114_t
            
            #add-point:AFTER FIELD xrce114_t name="input.a.page2.xrce114_t"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce114_t
            #add-point:ON CHANGE xrce114_t name="input.g.page2.xrce114_t"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce119_t
            #add-point:BEFORE FIELD xrce119_t name="input.b.page2.xrce119_t"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce119_t
            
            #add-point:AFTER FIELD xrce119_t name="input.a.page2.xrce119_t"
            IF NOT cl_null(g_xrce2_d[l_ac].xrce119) AND NOT cl_null(g_xrce2_d[l_ac].xrce003) AND g_xrce2_d[l_ac].xrce002 = '10' THEN
               CALL axrt300_02_chk_xrce109()
               IF NOT cl_null(g_errno) THEN
                  IF l_cmd = 'a' THEN
                     DISPLAY 0 TO s_detail2[l_ac].xrce119
                  ELSE
                     DISPLAY g_xrce_t.xrce119 TO s_detail2[l_ac].xrce119
                  END IF
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_xrce2_d[l_ac].xrce119
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  IF l_cmd = 'a' THEN
                     LET g_xrce2_d[l_ac].xrce119 = 0
                  ELSE
                     LET g_xrce2_d[l_ac].xrce119 = g_xrce_t.xrce119
                  END IF
                  DISPLAY g_xrce2_d[l_ac].xrce119 TO s_detail2[l_ac].xrce119
                  NEXT FIELD xrce119_t
               END IF
            END IF
            IF NOT cl_null(g_xrce2_d[l_ac].xrce119) AND NOT cl_null(g_xrce2_d[l_ac].xrce101) THEN
               LET g_xrce2_d[l_ac].xrce109 = g_xrce2_d[l_ac].xrce119 / g_xrce2_d[l_ac].xrce101
              #LET g_xrce2_d[l_ac].xrce109 = s_curr_round(g_glaa_t.glaacomp,g_xrce2_d[l_ac].xrce100,g_xrce2_d[l_ac].xrce109,2)     #150821-00002#1 Mark
               #150821-00002#1 Add ---(S)---
                CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_xrce2_d[l_ac].xrce100,g_xrce_d[l_ac].xrce109,2)
                   RETURNING l_success,g_errno,g_xrce_d[l_ac].xrce109
               #150821-00002#1 Add ---(E)---
               DISPLAY g_xrce2_d[l_ac].xrce109 TO s_detail2[l_ac].xrce109
               IF g_glaa_t.glaa015 = 'Y' THEN
                  LET g_xrce2_d[l_ac].xrce129 = g_xrce2_d[l_ac].xrce109 * g_xrce2_d[l_ac].xrce121
                 #LET g_xrce2_d[l_ac].xrce129 = s_curr_round(g_glaa_t.glaacomp,g_xrce2_d[l_ac].xrce120,g_xrce2_d[l_ac].xrce121,2)     #150821-00002#1 Mark
                 #150821-00002#1 Add ---(S)---
                  CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_xrce2_d[l_ac].xrce120,g_xrce2_d[l_ac].xrce121,2)
                     RETURNING l_success,g_errno,g_xrce2_d[l_ac].xrce121
                 #150821-00002#1 Add ---(E)---
               END IF
               IF g_glaa_t.glaa019 = 'Y' THEN
                  LET g_xrce2_d[l_ac].xrce139 = g_xrce2_d[l_ac].xrce109 * g_xrce2_d[l_ac].xrce131
                 #LET g_xrce2_d[l_ac].xrce139 = s_curr_round(g_glaa_t.glaacomp,g_xrce2_d[l_ac].xrce130,g_xrce2_d[l_ac].xrce131,2)     #150821-00002#1 Mark
                 #150821-00002#1 Add ---(S)---
                  CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_xrce2_d[l_ac].xrce130,g_xrce2_d[l_ac].xrce131,2)
                     RETURNING l_success,g_errno,g_xrce2_d[l_ac].xrce131
                 #150821-00002#1 Add ---(E)---
               END IF
            END IF
            IF NOT cl_null(g_xrce2_d[l_ac].xrce119) AND NOT cl_null(g_xrce_d[l_ac].xrce024) AND g_xrce2_d[l_ac].xrce002 = '31' THEN
               CALL axrt300_02_chk_xrce109_1()
               IF NOT cl_null(g_errno) THEN
                  IF l_cmd = 'a' THEN
                     DISPLAY 0 TO s_detail2[l_ac].xrce119
                  ELSE
                     DISPLAY g_xrce_t.xrce119 TO s_detail2[l_ac].xrce119
                  END IF
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_xrce2_d[l_ac].xrce119
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  IF l_cmd = 'a' THEN
                     LET g_xrce2_d[l_ac].xrce119 = 0
                  ELSE
                     LET g_xrce2_d[l_ac].xrce119 = g_xrce_t.xrce119
                  END IF
                  DISPLAY g_xrce2_d[l_ac].xrce119 TO s_detail2[l_ac].xrce119
                  NEXT FIELD xrce119_t
               END IF
            END IF
            IF NOT cl_null(g_xrce2_d[l_ac].xrce119) AND NOT cl_null(g_xrce2_d[l_ac].xrce109) THEN
               LET g_xrce2_d[l_ac].xrce101 = g_xrce2_d[l_ac].xrce119 / g_xrce2_d[l_ac].xrce109
               DISPLAY g_xrce2_d[l_ac].xrce119 TO s_detail2[l_ac].xrce119
            END IF
            LET g_xrce_t.xrce119 = g_xrce2_d[l_ac].xrce119
            LET g_xrce_d[l_ac].xrce109 = g_xrce2_d[l_ac].xrce109
            LET g_xrce_d[l_ac].xrce101 = g_xrce2_d[l_ac].xrce101
            LET g_xrce_d[l_ac].xrce119 = g_xrce2_d[l_ac].xrce119
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce119_t
            #add-point:ON CHANGE xrce119_t name="input.g.page2.xrce119_t"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce120
            #add-point:BEFORE FIELD xrce120 name="input.b.page2.xrce120"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce120
            
            #add-point:AFTER FIELD xrce120 name="input.a.page2.xrce120"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce120
            #add-point:ON CHANGE xrce120 name="input.g.page2.xrce120"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce121
            #add-point:BEFORE FIELD xrce121 name="input.b.page2.xrce121"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce121
            
            #add-point:AFTER FIELD xrce121 name="input.a.page2.xrce121"
            IF g_glaa_t.glaa017 = '1' THEN
               LET l_glaa001 = g_xrce2_d[l_ac].xrce100
               LET l_amt     = g_xrce2_d[l_ac].xrce109
            ELSE
               LET l_glaa001 = g_glaa_t.glaa001
               LET l_amt     = g_xrce2_d[l_ac].xrce119
            END IF
            IF cl_null(g_xrce2_d[l_ac].xrce003) AND cl_null(g_xrce2_d[l_ac].xrce121) AND NOT cl_null(g_xrce2_d[l_ac].xrce100) THEN
               #151012-00014#1--mark--str--lujh
               #                         #匯率參照表;       帳套;           日期;               來源幣別
               #CALL s_aooi160_get_exrate('2',g_xrca_t.xrcald,g_xrca_t.xrcadocdt,l_glaa001,
               #                         #目的幣別;         交易金額; 匯類類型
               #                          g_glaa_t.glaa016,l_amt,l_ooab002)
               #   RETURNING g_xrce2_d[l_ac].xrce121
               #151012-00014#1--mark--str--lujh
               
               #151012-00014#1--add--str--lujh
               LET lc_param.apca004 = g_xrca_t.xrca004
               LET ls_js = util.JSON.stringify(lc_param)
               CALL s_fin_get_curr_rate(g_xrca_t.xrcacomp,g_xrca_t.xrcald,g_xrca_t.xrcadocdt,g_xrca_t.xrca100,ls_js)    
                    RETURNING l_desc,g_xrce2_d[l_ac].xrce121,l_desc      
               #151012-00014#1--add--end--lujh               
                  
               DISPLAY g_xrce2_d[l_ac].xrce121 TO s_detail2[l_ac].xrce121
            END IF
            IF NOT cl_null(g_xrce2_d[l_ac].xrce121) AND NOT cl_null(l_amt) THEN
               LET g_xrce2_d[l_ac].xrce129 = l_amt * g_xrce2_d[l_ac].xrce121
               DISPLAY g_xrce2_d[l_ac].xrce129 TO s_detail2[l_ac].xrce129
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce121
            #add-point:ON CHANGE xrce121 name="input.g.page2.xrce121"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce123
            #add-point:BEFORE FIELD xrce123 name="input.b.page2.xrce123"
            #160628-00002#1--add--str--
            IF g_xrce_d[l_ac].xrce027 = 'Y' THEN
               SELECT xrca011 INTO l_xrca011 FROM xrca_t 
               WHERE xrcaent=g_enterprise AND xrcald=g_xrca_t.xrcald AND xrcadocno=g_xrce_d[l_ac].xrce003
               #根據單身稅別-含稅否 
               CALL s_tax_chk(g_glaa_t.glaacomp,l_xrca011) 
                   RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
            END IF
            #160628-00002#1--add--end
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce123
            
            #add-point:AFTER FIELD xrce123 name="input.a.page2.xrce123"
            #160628-00002#1--add--str--
            IF NOT cl_null(g_xrce2_d[l_ac].xrce123) THEN
               #IF l_cmd='a' OR (l_cmd='u' AND g_xrce2_d[l_ac].xrce123 <> g_xrce2_d_t.xrce123) THEN   #160824-00007#360 20170118 mark by beckxie
               IF g_xrce2_d[l_ac].xrce123 <> g_xrce2_d_o.xrce123 OR cl_null(g_xrce2_d_o.xrce123) THEN   #160824-00007#360 20170118 add by beckxie
                  IF g_xrce2_d[l_ac].xrce123 > r_xrce_w.xrce123 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'axr-00054'
                     LET g_errparam.extend = g_xrce2_d[l_ac].xrce123,'>', r_xrce_w.xrce123
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     #LET g_xrce2_d[l_ac].xrce123 = g_xrce2_d_t.xrce123   #160824-00007#360 20170118 mark by beckxie
                     #160824-00007#360 20170118 add by beckxie---S
                     LET g_xrce2_d[l_ac].xrce123 = g_xrce2_d_o.xrce123   
                     LET g_xrce2_d[l_ac].xrce124 = g_xrce2_d_o.xrce124
                     LET g_xrce2_d[l_ac].xrce129 = g_xrce2_d_o.xrce129
                     #160824-00007#360 20170118 add by beckxie---E
                     NEXT FIELD xrce123
                  END IF
                  IF g_xrce_d[l_ac].xrce027 = 'Y' THEN
                     #全部冲销
                     IF g_xrce2_d[l_ac].xrce123 = r_xrce_w.xrce123 THEN
                        LET g_xrce2_d[l_ac].xrce124 = r_xrce_w.xrce124
                        LET g_xrce2_d[l_ac].xrce129 = r_xrce_w.xrce129
                     ELSE
                     #部分冲销
                        IF l_oodb005 = 'Y' THEN
                           LET g_xrce2_d[l_ac].xrce124 = g_xrce2_d[l_ac].xrce129 - g_xrce2_d[l_ac].xrce123
                        ELSE
                           LET g_xrce2_d[l_ac].xrce129 = g_xrce2_d[l_ac].xrce123 + g_xrce2_d[l_ac].xrce124
                        END IF
                     END IF 
                  END IF   
               END IF
            END IF
            #160628-00002#1--add--end
            LET g_xrce2_d_o.* = g_xrce2_d[l_ac].*   #160824-00007#360 20170118 add by beckxie
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce123
            #add-point:ON CHANGE xrce123 name="input.g.page2.xrce123"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce124
            #add-point:BEFORE FIELD xrce124 name="input.b.page2.xrce124"
            #160628-00002#1--add--str--
            IF g_xrce_d[l_ac].xrce027 = 'Y' THEN
               SELECT xrca011 INTO l_xrca011 FROM xrca_t 
               WHERE xrcaent=g_enterprise AND xrcald=g_xrca_t.xrcald AND xrcadocno=g_xrce_d[l_ac].xrce003
               #根據單身稅別-含稅否 
               CALL s_tax_chk(g_glaa_t.glaacomp,l_xrca011) 
                   RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
            END IF
            #160628-00002#1--add--end
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce124
            
            #add-point:AFTER FIELD xrce124 name="input.a.page2.xrce124"
            #160628-00002#1--add--str--
            IF NOT cl_null(g_xrce2_d[l_ac].xrce124) THEN
               #IF l_cmd='a' OR (l_cmd='u' AND g_xrce2_d[l_ac].xrce124 <> g_xrce2_d_t.xrce124) THEN   #160824-00007#360 20170118 mark by beckxie
               IF g_xrce2_d[l_ac].xrce124 <> g_xrce2_d_o.xrce124 OR cl_null(g_xrce2_d_o.xrce124) THEN   #160824-00007#360 20170118 add by beckxie
                  IF g_xrce2_d[l_ac].xrce124 > r_xrce_w.xrce124 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'axr-00054'
                     LET g_errparam.extend = g_xrce2_d[l_ac].xrce124,'>', r_xrce_w.xrce124
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     #LET g_xrce2_d[l_ac].xrce124 = g_xrce2_d_t.xrce124   #160824-00007#360 20170118 mark by beckxie
                     #160824-00007#360 20170118 add by beckxie---S
                     LET g_xrce2_d[l_ac].xrce124 = g_xrce2_d_o.xrce124
                     LET g_xrce2_d[l_ac].xrce123 = g_xrce2_d_o.xrce123
                     LET g_xrce2_d[l_ac].xrce129 = g_xrce2_d_o.xrce129
                     #160824-00007#360 20170118 add by beckxie---E
                     NEXT FIELD xrce124
                  END IF
                  IF g_xrce_d[l_ac].xrce027 = 'Y' THEN
                     #全部冲销
                     IF g_xrce2_d[l_ac].xrce124 = r_xrce_w.xrce124 THEN
                        LET g_xrce2_d[l_ac].xrce123 = r_xrce_w.xrce123
                        LET g_xrce2_d[l_ac].xrce129 = r_xrce_w.xrce129
                     ELSE
                     #部分冲销
                        IF l_oodb005 = 'Y' THEN
                           LET g_xrce2_d[l_ac].xrce123 = g_xrce2_d[l_ac].xrce129 - g_xrce2_d[l_ac].xrce124
                        ELSE
                           LET g_xrce2_d[l_ac].xrce129 = g_xrce2_d[l_ac].xrce123 + g_xrce2_d[l_ac].xrce124
                        END IF
                     END IF 
                  END IF   
               END IF
            END IF
            #160628-00002#1--add--end
            LET g_xrce2_d_o.* = g_xrce2_d[l_ac].*   #160824-00007#360 20170118 add by beckxie
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce124
            #add-point:ON CHANGE xrce124 name="input.g.page2.xrce124"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce129
            #add-point:BEFORE FIELD xrce129 name="input.b.page2.xrce129"
            #160628-00002#1--add--str--
            IF g_xrce_d[l_ac].xrce027 = 'Y' THEN
               SELECT xrca011 INTO l_xrca011 FROM xrca_t 
               WHERE xrcaent=g_enterprise AND xrcald=g_xrca_t.xrcald AND xrcadocno=g_xrce_d[l_ac].xrce003
               #根據單身稅別-含稅否 
               CALL s_tax_chk(g_glaa_t.glaacomp,l_xrca011) 
                   RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
            END IF
            #160628-00002#1--add--end
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce129
            
            #add-point:AFTER FIELD xrce129 name="input.a.page2.xrce129"
#160628-00002#1--mark--str--
#            IF g_glaa_t.glaa017 = '1' THEN
#               LET l_amt = g_xrce2_d[l_ac].xrce109
#            ELSE
#               LET l_amt = g_xrce2_d[l_ac].xrce119
#            END IF
#            IF cl_null(g_xrce2_d[l_ac].xrce129) AND NOT cl_null(g_xrce2_d[l_ac].xrce121) THEN
#                  LET g_xrce2_d[l_ac].xrce129 = l_amt * g_xrce2_d[l_ac].xrce121
#            END IF
#            IF NOT cl_null(g_xrce2_d[l_ac].xrce129) AND NOT cl_null(l_amt) THEN
#               LET g_xrce2_d[l_ac].xrce121 = g_xrce2_d[l_ac].xrce129 / l_amt
#               DISPLAY g_xrce2_d[l_ac].xrce121 TO s_detail2[l_ac].xrce121
#            END IF
#160628-00002#1--mark--end
            #160628-00002#1--add--str--
            IF NOT cl_null(g_xrce2_d[l_ac].xrce129) THEN
               #IF l_cmd='a' OR (l_cmd='u' AND g_xrce2_d[l_ac].xrce129 <> g_xrce2_d_t.xrce129) THEN   #160824-00007#360 20170118 mark by beckxie
               IF g_xrce2_d[l_ac].xrce129 <> g_xrce2_d_o.xrce129 OR cl_null(g_xrce2_d_o.xrce129) THEN   #160824-00007#360 20170118 add by beckxie
                  IF g_xrce2_d[l_ac].xrce129 > r_xrce_w.xrce129 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'axr-00054'
                     LET g_errparam.extend = g_xrce2_d[l_ac].xrce129,'>', r_xrce_w.xrce129
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     #LET g_xrce2_d[l_ac].xrce129 = g_xrce2_d_t.xrce129   #160824-00007#360 20170118 mark by beckxie
                     #160824-00007#360 20170118 add by beckxie---S
                     LET g_xrce2_d[l_ac].xrce124 = g_xrce2_d_o.xrce124
                     LET g_xrce2_d[l_ac].xrce123 = g_xrce2_d_o.xrce123
                     LET g_xrce2_d[l_ac].xrce129 = g_xrce2_d_o.xrce129
                     #160824-00007#360 20170118 add by beckxie---E
                     NEXT FIELD xrce129
                  END IF
                  IF g_xrce_d[l_ac].xrce027 = 'Y' THEN
                     #全部冲销
                     IF g_xrce2_d[l_ac].xrce129 = r_xrce_w.xrce129 THEN
                        LET g_xrce2_d[l_ac].xrce123 = r_xrce_w.xrce123
                        LET g_xrce2_d[l_ac].xrce124 = r_xrce_w.xrce124
                     ELSE
                     #部分冲销
                        IF l_oodb005 = 'Y' THEN
                           LET g_xrce2_d[l_ac].xrce123 = g_xrce2_d[l_ac].xrce129 - g_xrce2_d[l_ac].xrce124
                        ELSE
                           LET g_xrce2_d[l_ac].xrce124 = g_xrce2_d[l_ac].xrce129 - g_xrce2_d[l_ac].xrce123
                        END IF
                     END IF
                  ELSE
                     LET g_xrce2_d[l_ac].xrce123 = g_xrce2_d[l_ac].xrce129
                     LET g_xrce2_d[l_ac].xrce123 = 0
                  END IF   
               END IF
            END IF
            #160628-00002#1--add--end
            LET g_xrce2_d_o.* = g_xrce2_d[l_ac].*   #160824-00007#360 20170118 add by beckxie
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce129
            #add-point:ON CHANGE xrce129 name="input.g.page2.xrce129"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce130
            #add-point:BEFORE FIELD xrce130 name="input.b.page2.xrce130"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce130
            
            #add-point:AFTER FIELD xrce130 name="input.a.page2.xrce130"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce130
            #add-point:ON CHANGE xrce130 name="input.g.page2.xrce130"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce131
            #add-point:BEFORE FIELD xrce131 name="input.b.page2.xrce131"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce131
            
            #add-point:AFTER FIELD xrce131 name="input.a.page2.xrce131"
            IF g_glaa_t.glaa021 = '1' THEN
               LET l_glaa001 = g_xrce2_d[l_ac].xrce100
               LET l_amt     = g_xrce2_d[l_ac].xrce109
            ELSE
               LET l_glaa001 = g_glaa_t.glaa001
               LET l_amt     = g_xrce2_d[l_ac].xrce119
            END IF
            IF cl_null(g_xrce_d[l_ac].xrce024) AND cl_null(g_xrce2_d[l_ac].xrce131) AND NOT cl_null(g_xrce2_d[l_ac].xrce100) THEN
               #151012-00014#1--mark--str--lujh
               #                         #匯率參照表;帳套;           日期;               來源幣別
               #CALL s_aooi160_get_exrate('2',g_xrca_t.xrcald,g_xrca_t.xrcadocdt,g_glaa_t.glaa001,
               #                         #目的幣別;  交易金額;              匯類類型
               #                          g_glaa_t.glaa016,l_amt,l_ooab002)
               #   RETURNING g_xrce2_d[l_ac].xrce131
               #151012-00014#1--mark--end--lujh
                  
               #151012-00014#1--add--str--lujh
               LET lc_param.apca004 = g_xrca_t.xrca004
               LET ls_js = util.JSON.stringify(lc_param)
               CALL s_fin_get_curr_rate(g_xrca_t.xrcacomp,g_xrca_t.xrcald,g_xrca_t.xrcadocdt,g_xrca_t.xrca100,ls_js)    
                    RETURNING l_desc,l_desc,g_xrce2_d[l_ac].xrce131      
               #151012-00014#1--add--end--lujh     
                  
               DISPLAY g_xrce2_d[l_ac].xrce131 TO s_detail2[l_ac].xrce131
            END IF
            IF NOT cl_null(g_xrce2_d[l_ac].xrce131) AND NOT cl_null(l_amt) THEN
               LET g_xrce2_d[l_ac].xrce139 = l_amt * g_xrce2_d[l_ac].xrce131
               DISPLAY g_xrce2_d[l_ac].xrce139 TO s_detail2[l_ac].xrce139
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce131
            #add-point:ON CHANGE xrce131 name="input.g.page2.xrce131"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce133
            #add-point:BEFORE FIELD xrce133 name="input.b.page2.xrce133"
            #160628-00002#1--add--str--
            IF g_xrce_d[l_ac].xrce027 = 'Y' THEN
               SELECT xrca011 INTO l_xrca011 FROM xrca_t 
               WHERE xrcaent=g_enterprise AND xrcald=g_xrca_t.xrcald AND xrcadocno=g_xrce_d[l_ac].xrce003
               #根據單身稅別-含稅否 
               CALL s_tax_chk(g_glaa_t.glaacomp,l_xrca011) 
                   RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
            END IF
            #160628-00002#1--add--end
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce133
            
            #add-point:AFTER FIELD xrce133 name="input.a.page2.xrce133"
            #160628-00002#1--add--str--
            IF NOT cl_null(g_xrce2_d[l_ac].xrce133) THEN
               #IF l_cmd='a' OR (l_cmd='u' AND g_xrce2_d[l_ac].xrce133 <> g_xrce2_d_t.xrce133) THEN   #160824-00007#360 20170118 mark by beckxie
               IF g_xrce2_d[l_ac].xrce133 <> g_xrce2_d_o.xrce133 OR cl_null(g_xrce2_d_o.xrce133) THEN   #160824-00007#360 20170118 add by beckxie
                  IF g_xrce2_d[l_ac].xrce133 > r_xrce_w.xrce133 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'axr-00054'
                     LET g_errparam.extend = g_xrce2_d[l_ac].xrce133,'>', r_xrce_w.xrce133
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     #LET g_xrce2_d[l_ac].xrce133 = g_xrce2_d_t.xrce133   #160824-00007#360 20170118 add by beckxie
                     #160824-00007#360 20170118 add by beckxie---S
                     LET g_xrce2_d[l_ac].xrce133 = g_xrce2_d_o.xrce133
                     LET g_xrce2_d[l_ac].xrce134 = g_xrce2_d_o.xrce134
                     LET g_xrce2_d[l_ac].xrce139 = g_xrce2_d_o.xrce139
                     #160824-00007#360 20170118 add by beckxie---E
                     NEXT FIELD xrce133
                  END IF
                  IF g_xrce_d[l_ac].xrce027 = 'Y' THEN
                     #全部冲销
                     IF g_xrce2_d[l_ac].xrce133 = r_xrce_w.xrce133 THEN
                        LET g_xrce2_d[l_ac].xrce134 = r_xrce_w.xrce134
                        LET g_xrce2_d[l_ac].xrce139 = r_xrce_w.xrce139
                     ELSE
                     #部分冲销
                        IF l_oodb005 = 'Y' THEN
                           LET g_xrce2_d[l_ac].xrce134 = g_xrce2_d[l_ac].xrce139 - g_xrce2_d[l_ac].xrce133
                        ELSE
                           LET g_xrce2_d[l_ac].xrce139 = g_xrce2_d[l_ac].xrce133 + g_xrce2_d[l_ac].xrce134
                        END IF
                     END IF 
                  END IF   
               END IF
            END IF
            #160628-00002#1--add--end
            LET g_xrce2_d_o.* = g_xrce2_d[l_ac].*   #160824-00007#360 20170118 add by beckxie
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce133
            #add-point:ON CHANGE xrce133 name="input.g.page2.xrce133"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce134
            #add-point:BEFORE FIELD xrce134 name="input.b.page2.xrce134"
            #160628-00002#1--add--str--
            IF g_xrce_d[l_ac].xrce027 = 'Y' THEN
               SELECT xrca011 INTO l_xrca011 FROM xrca_t 
               WHERE xrcaent=g_enterprise AND xrcald=g_xrca_t.xrcald AND xrcadocno=g_xrce_d[l_ac].xrce003
               #根據單身稅別-含稅否 
               CALL s_tax_chk(g_glaa_t.glaacomp,l_xrca011) 
                   RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
            END IF
            #160628-00002#1--add--end
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce134
            
            #add-point:AFTER FIELD xrce134 name="input.a.page2.xrce134"
            #160628-00002#1--add--str--
            IF NOT cl_null(g_xrce2_d[l_ac].xrce134) THEN
               #IF l_cmd='a' OR (l_cmd='u' AND g_xrce2_d[l_ac].xrce134 <> g_xrce2_d_t.xrce134) THEN   #160824-00007#360 20170118 mark by beckxie
               IF g_xrce2_d[l_ac].xrce134 <> g_xrce2_d_o.xrce134 OR cl_null(g_xrce2_d_o.xrce134) THEN   #160824-00007#360 20170118 add by beckxie
                  IF g_xrce2_d[l_ac].xrce134 > r_xrce_w.xrce134 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'axr-00054'
                     LET g_errparam.extend = g_xrce2_d[l_ac].xrce134,'>', r_xrce_w.xrce134
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     #LET g_xrce2_d[l_ac].xrce134 = g_xrce2_d_t.xrce134   #160824-00007#360 20170118 mark by beckxie
                     #160824-00007#360 20170118 add by beckxie---S
                     LET g_xrce2_d[l_ac].xrce133 = g_xrce2_d_o.xrce133
                     LET g_xrce2_d[l_ac].xrce134 = g_xrce2_d_o.xrce134
                     LET g_xrce2_d[l_ac].xrce139 = g_xrce2_d_o.xrce139
                     #160824-00007#360 20170118 add by beckxie---E
                     NEXT FIELD xrce134
                  END IF
                  IF g_xrce_d[l_ac].xrce027 = 'Y' THEN
                     #全部冲销
                     IF g_xrce2_d[l_ac].xrce134 = r_xrce_w.xrce134 THEN
                        LET g_xrce2_d[l_ac].xrce133 = r_xrce_w.xrce133
                        LET g_xrce2_d[l_ac].xrce139 = r_xrce_w.xrce139
                     ELSE
                     #部分冲销
                        IF l_oodb005 = 'Y' THEN
                           LET g_xrce2_d[l_ac].xrce133 = g_xrce2_d[l_ac].xrce139 - g_xrce2_d[l_ac].xrce134
                        ELSE
                           LET g_xrce2_d[l_ac].xrce139 = g_xrce2_d[l_ac].xrce133 + g_xrce2_d[l_ac].xrce134
                        END IF
                     END IF 
                  END IF   
               END IF
            END IF
            #160628-00002#1--add--end
            LET g_xrce2_d_o.* = g_xrce2_d[l_ac].*   #160824-00007#360 20170118 add by beckxie
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce134
            #add-point:ON CHANGE xrce134 name="input.g.page2.xrce134"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce139
            #add-point:BEFORE FIELD xrce139 name="input.b.page2.xrce139"
            #160628-00002#1--add--str--
            IF g_xrce_d[l_ac].xrce027 = 'Y' THEN
               SELECT xrca011 INTO l_xrca011 FROM xrca_t 
               WHERE xrcaent=g_enterprise AND xrcald=g_xrca_t.xrcald AND xrcadocno=g_xrce_d[l_ac].xrce003
               #根據單身稅別-含稅否 
               CALL s_tax_chk(g_glaa_t.glaacomp,l_xrca011) 
                   RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
            END IF
            #160628-00002#1--add--end
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce139
            
            #add-point:AFTER FIELD xrce139 name="input.a.page2.xrce139"
#160628-00002#1--mark--str--
#            IF g_glaa_t.glaa021 = '1' THEN
#               LET l_amt = g_xrce2_d[l_ac].xrce109
#            ELSE
#               LET l_amt = g_xrce2_d[l_ac].xrce119
#            END IF
#            IF cl_null(g_xrce2_d[l_ac].xrce139) AND NOT cl_null(g_xrce2_d[l_ac].xrce131) THEN
#               LET g_xrce2_d[l_ac].xrce139 = l_amt * g_xrce2_d[l_ac].xrce131
#            END IF
#            IF NOT cl_null(g_xrce2_d[l_ac].xrce139) AND NOT cl_null(l_amt) THEN
#               LET g_xrce2_d[l_ac].xrce131 = g_xrce2_d[l_ac].xrce139 / l_amt
#               DISPLAY g_xrce2_d[l_ac].xrce131 TO s_detail2[l_ac].xrce131
#            END IF
#160628-00002#1--mark--end
            #160628-00002#1--add--str--
            IF NOT cl_null(g_xrce2_d[l_ac].xrce139) THEN
               #IF l_cmd='a' OR (l_cmd='u' AND g_xrce2_d[l_ac].xrce139 <> g_xrce2_d_t.xrce139) THEN   #160824-00007#360 20170118 mark by beckxie
               IF g_xrce2_d[l_ac].xrce139 <> g_xrce2_d_o.xrce139 OR cl_null(g_xrce2_d_o.xrce139) THEN   #160824-00007#360 20170118 add by beckxie
                  IF g_xrce2_d[l_ac].xrce139 > r_xrce_w.xrce139 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'axr-00054'
                     LET g_errparam.extend = g_xrce2_d[l_ac].xrce139,'>', r_xrce_w.xrce139
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     #LET g_xrce2_d[l_ac].xrce139 = g_xrce2_d_t.xrce139   #160824-00007#360 20170118 mark by beckxie
                     #160824-00007#360 20170118 add by beckxie---S
                     LET g_xrce2_d[l_ac].xrce133 = g_xrce2_d_o.xrce133
                     LET g_xrce2_d[l_ac].xrce134 = g_xrce2_d_o.xrce134
                     LET g_xrce2_d[l_ac].xrce139 = g_xrce2_d_o.xrce139
                     #160824-00007#360 20170118 add by beckxie---E
                     NEXT FIELD xrce139
                  END IF
                  IF g_xrce_d[l_ac].xrce027 = 'Y' THEN
                     #全部冲销
                     IF g_xrce2_d[l_ac].xrce139 = r_xrce_w.xrce139 THEN
                        LET g_xrce2_d[l_ac].xrce133 = r_xrce_w.xrce133
                        LET g_xrce2_d[l_ac].xrce134 = r_xrce_w.xrce134
                     ELSE
                     #部分冲销
                        IF l_oodb005 = 'Y' THEN
                           LET g_xrce2_d[l_ac].xrce133 = g_xrce2_d[l_ac].xrce139 - g_xrce2_d[l_ac].xrce134
                        ELSE
                           LET g_xrce2_d[l_ac].xrce134 = g_xrce2_d[l_ac].xrce139 - g_xrce2_d[l_ac].xrce133
                        END IF
                     END IF
                  ELSE
                     LET g_xrce2_d[l_ac].xrce133 = g_xrce2_d[l_ac].xrce139
                     LET g_xrce2_d[l_ac].xrce133 = 0
                  END IF   
               END IF
            END IF
            #160628-00002#1--add--end
            LET g_xrce2_d_o.* = g_xrce2_d[l_ac].*   #160824-00007#360 20170118 add by beckxie
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce139
            #add-point:ON CHANGE xrce139 name="input.g.page2.xrce139"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page2.xrce001_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce001_t
            #add-point:ON ACTION controlp INFIELD xrce001_t name="input.c.page2.xrce001_t"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrcedocno_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcedocno_t
            #add-point:ON ACTION controlp INFIELD xrcedocno_t name="input.c.page2.xrcedocno_t"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrceld_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrceld_t
            #add-point:ON ACTION controlp INFIELD xrceld_t name="input.c.page2.xrceld_t"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrcesite_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcesite_t
            #add-point:ON ACTION controlp INFIELD xrcesite_t name="input.c.page2.xrcesite_t"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrceseq_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrceseq_t
            #add-point:ON ACTION controlp INFIELD xrceseq_t name="input.c.page2.xrceseq_t"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrce002_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce002_t
            #add-point:ON ACTION controlp INFIELD xrce002_t name="input.c.page2.xrce002_t"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrce003_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce003_t
            #add-point:ON ACTION controlp INFIELD xrce003_t name="input.c.page2.xrce003_t"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrce004_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce004_t
            #add-point:ON ACTION controlp INFIELD xrce004_t name="input.c.page2.xrce004_t"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrce008_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce008_t
            #add-point:ON ACTION controlp INFIELD xrce008_t name="input.c.page2.xrce008_t"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrce100_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce100_t
            #add-point:ON ACTION controlp INFIELD xrce100_t name="input.c.page2.xrce100_t"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrce103_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce103_t
            #add-point:ON ACTION controlp INFIELD xrce103_t name="input.c.page2.xrce103_t"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrce104_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce104_t
            #add-point:ON ACTION controlp INFIELD xrce104_t name="input.c.page2.xrce104_t"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrce109_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce109_t
            #add-point:ON ACTION controlp INFIELD xrce109_t name="input.c.page2.xrce109_t"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrce101_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce101_t
            #add-point:ON ACTION controlp INFIELD xrce101_t name="input.c.page2.xrce101_t"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrce113_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce113_t
            #add-point:ON ACTION controlp INFIELD xrce113_t name="input.c.page2.xrce113_t"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrce114_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce114_t
            #add-point:ON ACTION controlp INFIELD xrce114_t name="input.c.page2.xrce114_t"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrce119_t
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce119_t
            #add-point:ON ACTION controlp INFIELD xrce119_t name="input.c.page2.xrce119_t"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrce120
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce120
            #add-point:ON ACTION controlp INFIELD xrce120 name="input.c.page2.xrce120"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrce121
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce121
            #add-point:ON ACTION controlp INFIELD xrce121 name="input.c.page2.xrce121"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrce123
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce123
            #add-point:ON ACTION controlp INFIELD xrce123 name="input.c.page2.xrce123"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrce124
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce124
            #add-point:ON ACTION controlp INFIELD xrce124 name="input.c.page2.xrce124"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrce129
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce129
            #add-point:ON ACTION controlp INFIELD xrce129 name="input.c.page2.xrce129"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrce130
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce130
            #add-point:ON ACTION controlp INFIELD xrce130 name="input.c.page2.xrce130"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrce131
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce131
            #add-point:ON ACTION controlp INFIELD xrce131 name="input.c.page2.xrce131"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrce133
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce133
            #add-point:ON ACTION controlp INFIELD xrce133 name="input.c.page2.xrce133"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrce134
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce134
            #add-point:ON ACTION controlp INFIELD xrce134 name="input.c.page2.xrce134"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrce139
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce139
            #add-point:ON ACTION controlp INFIELD xrce139 name="input.c.page2.xrce139"
            
            #END add-point
 
 
 
 
         AFTER ROW
            LET l_ac = ARR_CURR()
            LET l_ac_t = l_ac
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CALL cl_err()
               LET INT_FLAG = 0
               IF l_cmd = 'u' THEN
                  LET g_xrce2_d[l_ac].* = g_xrce2_d_t.*
               END IF
               CLOSE axrt300_02_bcl
               #add-point:單身after row name="input.body2.a_close"
              #CLOSE axrt300_02_bcl1   #160420-00001#1 Mark
               #end add-point
               EXIT DIALOG   #(ver:44)
            END IF
            
            #其他table進行unlock
            
 
            CALL axrt300_02_unlock_b("xrce_t")
            #add-point:單身after row name="input.body2.a_row"
            
            #end add-point
            
         AFTER INPUT
            #add-point:單身2input後 name="input.body2.a_input"
            
            #end add-point
         
         #複製上一次指定的單身資料至最下方
         ON ACTION controlo   
            IF l_insert THEN
               #170920-00028 ---modify start---
               #新增判斷是否有上一筆資料可供複製
               IF l_ac_t <= 0 OR l_ac_t IS NULL THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = ""
                  LET g_errparam.code   = "adz-01032"
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
               ELSE
                  LET li_reproduce = l_ac_t
                  LET li_reproduce_target = l_ac
                  LET g_xrce_d[li_reproduce_target].* = g_xrce_d[li_reproduce].*
               LET g_xrce2_d[li_reproduce_target].* = g_xrce2_d[li_reproduce].*
               LET g_xrce3_d[li_reproduce_target].* = g_xrce3_d[li_reproduce].*
 
                  LET g_xrce2_d[li_reproduce_target].xrceld = NULL
                  LET g_xrce2_d[li_reproduce_target].xrcedocno = NULL
                  LET g_xrce2_d[li_reproduce_target].xrceseq = NULL
               END IF
               #170920-00028 --- modify end ---
            ELSE
               CALL FGL_SET_ARR_CURR(g_xrce2_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_xrce2_d.getLength()+1
            END IF
            #(ver:43) ---start---
            #add-point:單身2複製後 name="input.body2.controlo"
            
            #end add-point
            #(ver:43) --- end ---
      END INPUT
      INPUT ARRAY g_xrce3_d FROM s_detail3.*
         ATTRIBUTE(COUNT = g_detail_cnt,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                 INSERT ROW = FALSE, #此頁面insert功能由產生器控制, 手動之設定無效! 
 
                 DELETE ROW = l_allow_delete,
                 APPEND ROW = l_allow_insert)
                 
         #自訂ACTION(detail_input,page_3)
         
         
         BEFORE INPUT
          CALL FGL_SET_ARR_CURR(g_detail_idx)
            
            CALL axrt300_02_b_fill(g_wc2)
            LET g_detail_cnt = g_xrce3_d.getLength()
    
         BEFORE INSERT
            LET g_insert = 'Y' 
            NEXT FIELD xrceld
 
            LET l_insert = TRUE
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_xrce3_d[l_ac].* TO NULL 
            INITIALIZE g_xrce3_d_t.* TO NULL
            INITIALIZE g_xrce3_d_o.* TO NULL
            #公用欄位給值(單身3)
            
            #自定義預設值(單身3)
            
            #add-point:modify段before備份 name="input.body3.before_bak"
            
            #end add-point
            LET g_xrce3_d_t.* = g_xrce3_d[l_ac].*     #新輸入資料
            LET g_xrce3_d_o.* = g_xrce3_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_xrce_d[li_reproduce_target].* = g_xrce_d[li_reproduce].*
               LET g_xrce2_d[li_reproduce_target].* = g_xrce2_d[li_reproduce].*
               LET g_xrce3_d[li_reproduce_target].* = g_xrce3_d[li_reproduce].*
 
               LET g_xrce3_d[li_reproduce_target].xrceld = NULL
               LET g_xrce3_d[li_reproduce_target].xrcedocno = NULL
               LET g_xrce3_d[li_reproduce_target].xrceseq = NULL
            END IF
            
 
 
 
            CALL axrt300_02_set_entry_b(l_cmd)
            CALL axrt300_02_set_no_entry_b(l_cmd)
            #add-point:modify段before insert name="input.body3.before_insert"
            
            #end add-point  
            
         BEFORE ROW 
            #add-point:modify段before row name="input.body3.before_row2"
           #IF 1 = 0 THEN   #160420-00001#1 Mark
            #end add-point  
            LET l_insert = FALSE
            #(ver:42) ---start---
            LET g_current_page = 3
            CALL axrt300_02_idx_chk()
            #(ver:42) --- end ---
            LET g_detail_idx = DIALOG.getCurrentRow("s_detail3")
            LET l_cmd = ''
            LET l_ac_t = l_ac 
            LET l_ac = g_detail_idx
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
            DISPLAY g_xrce3_d.getLength() TO FORMONLY.cnt
         
            CALL s_transaction_begin()
            
            LET g_detail_cnt = g_xrce3_d.getLength()
            
            IF g_detail_cnt >= l_ac 
               AND g_xrce3_d[l_ac].xrceld IS NOT NULL
               AND g_xrce3_d[l_ac].xrcedocno IS NOT NULL
               AND g_xrce3_d[l_ac].xrceseq IS NOT NULL
            THEN 
               LET l_cmd='u'
               LET g_xrce3_d_t.* = g_xrce3_d[l_ac].*  #BACKUP
               LET g_xrce3_d_o.* = g_xrce3_d[l_ac].*  #BACKUP
               IF NOT axrt300_02_lock_b("xrce_t") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH axrt300_02_bcl INTO g_xrce_d[l_ac].xrce001,g_xrce_d[l_ac].xrcedocno,g_xrce_d[l_ac].xrceld, 
                      g_xrce_d[l_ac].xrcesite,g_xrce_d[l_ac].xrceseq,g_xrce_d[l_ac].xrce002,g_xrce_d[l_ac].xrce003, 
                      g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce005,g_xrce_d[l_ac].xrce024,g_xrce_d[l_ac].xrce025, 
                      g_xrce_d[l_ac].xrce008,g_xrce_d[l_ac].xrce015,g_xrce_d[l_ac].xrce100,g_xrce_d[l_ac].xrce101, 
                      g_xrce_d[l_ac].xrce103,g_xrce_d[l_ac].xrce104,g_xrce_d[l_ac].xrce109,g_xrce_d[l_ac].xrce113, 
                      g_xrce_d[l_ac].xrce114,g_xrce_d[l_ac].xrce119,g_xrce_d[l_ac].xrce027,g_xrce_d[l_ac].xrce028, 
                      g_xrce_d[l_ac].xrcecomp,g_xrce_d[l_ac].xrceorga,g_xrce_d[l_ac].xrce010,g_xrce_d[l_ac].xrce016, 
                      g_xrce2_d[l_ac].xrce001,g_xrce2_d[l_ac].xrcedocno,g_xrce2_d[l_ac].xrceld,g_xrce2_d[l_ac].xrcesite, 
                      g_xrce2_d[l_ac].xrceseq,g_xrce2_d[l_ac].xrce002,g_xrce2_d[l_ac].xrce003,g_xrce2_d[l_ac].xrce004, 
                      g_xrce2_d[l_ac].xrce008,g_xrce2_d[l_ac].xrce100,g_xrce2_d[l_ac].xrce103,g_xrce2_d[l_ac].xrce104, 
                      g_xrce2_d[l_ac].xrce109,g_xrce2_d[l_ac].xrce101,g_xrce2_d[l_ac].xrce113,g_xrce2_d[l_ac].xrce114, 
                      g_xrce2_d[l_ac].xrce119,g_xrce2_d[l_ac].xrce120,g_xrce2_d[l_ac].xrce121,g_xrce2_d[l_ac].xrce123, 
                      g_xrce2_d[l_ac].xrce124,g_xrce2_d[l_ac].xrce129,g_xrce2_d[l_ac].xrce130,g_xrce2_d[l_ac].xrce131, 
                      g_xrce2_d[l_ac].xrce133,g_xrce2_d[l_ac].xrce134,g_xrce2_d[l_ac].xrce139,g_xrce3_d[l_ac].xrce001, 
                      g_xrce3_d[l_ac].xrcedocno,g_xrce3_d[l_ac].xrceld,g_xrce3_d[l_ac].xrcesite,g_xrce3_d[l_ac].xrceseq, 
                      g_xrce3_d[l_ac].xrce002,g_xrce3_d[l_ac].xrce003,g_xrce3_d[l_ac].xrce004,g_xrce3_d[l_ac].xrce005, 
                      g_xrce3_d[l_ac].xrce008,g_xrce3_d[l_ac].xrce100,g_xrce3_d[l_ac].xrce109,g_xrce3_d[l_ac].xrce101, 
                      g_xrce3_d[l_ac].xrce119,g_xrce3_d[l_ac].xrce027,g_xrce3_d[l_ac].xrce010,g_xrce3_d[l_ac].xrce016, 
                      g_xrce3_d[l_ac].xrce017,g_xrce3_d[l_ac].xrce018,g_xrce3_d[l_ac].xrce019,g_xrce3_d[l_ac].xrce020, 
                      g_xrce3_d[l_ac].xrce022,g_xrce3_d[l_ac].xrce023,g_xrce3_d[l_ac].xrce040,g_xrce3_d[l_ac].xrce035, 
                      g_xrce3_d[l_ac].xrce036,g_xrce3_d[l_ac].xrce038,g_xrce3_d[l_ac].xrce039,g_xrce3_d[l_ac].xrce041, 
                      g_xrce3_d[l_ac].xrce042,g_xrce3_d[l_ac].xrce043,g_xrce3_d[l_ac].xrce044,g_xrce3_d[l_ac].xrce045, 
                      g_xrce3_d[l_ac].xrce046,g_xrce3_d[l_ac].xrce047,g_xrce3_d[l_ac].xrce048,g_xrce3_d[l_ac].xrce049, 
                      g_xrce3_d[l_ac].xrce050,g_xrce3_d[l_ac].xrce051
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "FETCH axrt300_02_bcl:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_xrce3_d_mask_o[l_ac].* =  g_xrce3_d[l_ac].*
                  CALL axrt300_02_xrce_t_mask()
                  LET g_xrce3_d_mask_n[l_ac].* =  g_xrce3_d[l_ac].*
                  
                  CALL cl_show_fld_cont()
                  CALL axrt300_02_detail_show()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            CALL axrt300_02_set_entry_b(l_cmd)
            CALL axrt300_02_set_no_entry_b(l_cmd)
            #add-point:modify段before row name="input.body3.before_row"
            #171016-00011#3 -s 171018 add by 01872
            SELECT glad017,glad0171,glad0172,glad018,glad0181,glad0182,
                   glad019,glad0191,glad0192,glad020,glad0201,glad0202,
                   glad021,glad0211,glad0212,glad022,glad0221,glad0222,
                   glad023,glad0231,glad0232,glad024,glad0221,glad0242,
                   glad025,glad0251,glad0252,glad026,glad0261,glad0262
             INTO  g_glad017,g_glad0171,g_glad0172,g_glad018,g_glad0181,g_glad0182,
                   g_glad019,g_glad0191,g_glad0192,g_glad020,g_glad0201,g_glad0202,
                   g_glad021,g_glad0211,g_glad0212,g_glad022,g_glad0221,g_glad0222,
                   g_glad023,g_glad0231,g_glad0232,g_glad024,g_glad0241,g_glad0242,
                   g_glad025,g_glad0251,g_glad0252,g_glad026,g_glad0261,g_glad0262
             FROM  glad_t
             WHERE gladent = g_enterprise
               AND gladld = g_xrca_t.xrcald
               AND glad001 = g_xrce_d[l_ac].xrce016 
            #171016-00011#3 -e 171018 add by 01872
           #160420-00001#1 Mark ---(S)---
           #ELSE
           #   LET g_detail_idx = DIALOG.getCurrentRow("s_detail3")
           #   LET l_cmd = ''
           #   LET l_ac = ARR_CURR()
           #   LET l_lock_sw = 'N'            #DEFAULT
           #   LET l_n = ARR_COUNT()
           #   DISPLAY l_ac TO FORMONLY.idx
           #   DISPLAY g_xrce3_d.getLength() TO FORMONLY.cnt
           #
           #   CALL s_transaction_begin()
           #   
           #   LET g_detail_cnt = g_xrce3_d.getLength()
           #   
           #   IF g_detail_cnt >= l_ac 
           #      AND g_xrce3_d[l_ac].xrceld IS NOT NULL
           #      AND g_xrce3_d[l_ac].xrcedocno IS NOT NULL
           #
           #      AND g_xrce3_d[l_ac].xrceseq IS NOT NULL
           #
           #   THEN 
           #      LET l_cmd='u'
           #      LET g_xrce3_d_t.* = g_xrce3_d[l_ac].*  #BACKUP
           #      IF NOT axrt300_02_lock_b("xrce_t") THEN
           #         LET l_lock_sw='Y'
           #      ELSE
           #         SELECT gzcb004 INTO l_gzcb004
           #           FROM gzcb_t
           #          WHERE gzcb001 = '8306'
           #            AND gzcb002 = g_xrce_d[l_ac].xrce002
           #         IF l_gzcb004 = '2' THEN 
           #            FETCH axrt300_02_bcl INTO g_xrce_d[l_ac].xrce001,g_xrce_d[l_ac].xrcedocno,g_xrce_d[l_ac].xrceld, 
           #                g_xrce_d[l_ac].xrcesite,g_xrce_d[l_ac].xrceseq,g_xrce_d[l_ac].xrce002,g_xrce_d[l_ac].xrce006, 
           #                g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce005,g_xrce_d[l_ac].xrce024, 
           #                g_xrce_d[l_ac].xrce025,g_xrce_d[l_ac].xrce008,g_xrce_d[l_ac].xrce015,g_xrce_d[l_ac].xrce100, 
           #                g_xrce_d[l_ac].xrce101,g_xrce_d[l_ac].xrce109,g_xrce_d[l_ac].xrce119,g_xrce_d[l_ac].xrce027, 
           #                g_xrce_d[l_ac].xrce028,g_xrce_d[l_ac].xrce104,g_xrce_d[l_ac].xrce114,g_xrce_d[l_ac].xrce124, 
           #                g_xrce_d[l_ac].xrce134,g_xrce_d[l_ac].xrcecomp,g_xrce_d[l_ac].xrceorga,g_xrce_d[l_ac].xrce010, 
           #                g_xrce_d[l_ac].xrce016,g_xrce2_d[l_ac].xrce001,g_xrce2_d[l_ac].xrcedocno,g_xrce2_d[l_ac].xrceld, 
           #                g_xrce2_d[l_ac].xrcesite,g_xrce2_d[l_ac].xrceseq,g_xrce2_d[l_ac].xrce002,g_xrce2_d[l_ac].xrce006, 
           #                g_xrce2_d[l_ac].xrce003,g_xrce2_d[l_ac].xrce004,g_xrce2_d[l_ac].xrce008,g_xrce2_d[l_ac].xrce100, 
           #                g_xrce2_d[l_ac].xrce109,g_xrce2_d[l_ac].xrce101,g_xrce2_d[l_ac].xrce119,g_xrce2_d[l_ac].xrce120, 
           #                g_xrce2_d[l_ac].xrce121,g_xrce2_d[l_ac].xrce129,g_xrce2_d[l_ac].xrce130,g_xrce2_d[l_ac].xrce131, 
           #                g_xrce2_d[l_ac].xrce139,g_xrce3_d[l_ac].xrce001,g_xrce3_d[l_ac].xrcedocno,g_xrce3_d[l_ac].xrceld, 
           #                g_xrce3_d[l_ac].xrcesite,g_xrce3_d[l_ac].xrceseq,g_xrce3_d[l_ac].xrce002,g_xrce3_d[l_ac].xrce006, 
           #                g_xrce3_d[l_ac].xrce003,g_xrce3_d[l_ac].xrce004,g_xrce3_d[l_ac].xrce005,g_xrce3_d[l_ac].xrce008, 
           #                g_xrce3_d[l_ac].xrce100,g_xrce3_d[l_ac].xrce109,g_xrce3_d[l_ac].xrce101,g_xrce3_d[l_ac].xrce119, 
           #                g_xrce3_d[l_ac].xrce027,g_xrce3_d[l_ac].xrce010,g_xrce3_d[l_ac].xrce016,g_xrce3_d[l_ac].xrce017, 
           #                g_xrce3_d[l_ac].xrce018,g_xrce3_d[l_ac].xrce019,g_xrce3_d[l_ac].xrce020,g_xrce3_d[l_ac].xrce022, 
           #                g_xrce3_d[l_ac].xrce023
           #         ELSE
           #            FETCH axrt300_02_bcl1 INTO g_xrce_d[l_ac].xrce001,g_xrce_d[l_ac].xrcedocno,g_xrce_d[l_ac].xrceld,
           #                g_xrce_d[l_ac].xrcesite,g_xrce_d[l_ac].xrceseq,g_xrce_d[l_ac].xrce002,g_xrce_d[l_ac].xrce006,
           #                g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce008,g_xrce_d[l_ac].xrce100,
           #                g_xrce_d[l_ac].xrce109,g_xrce_d[l_ac].xrce101,g_xrce_d[l_ac].xrce119,
           #                g_xrce_d[l_ac].xrce015,g_xrce_d[l_ac].xrce028,g_xrce_d[l_ac].xrcecomp,
           #                g_xrce_d[l_ac].xrceorga,g_xrce_d[l_ac].xrce010,g_xrce_d[l_ac].xrce016,g_xrce_d[l_ac].xrde012,
           #                g_xrce2_d[l_ac].xrce001,g_xrce2_d[l_ac].xrcedocno,g_xrce2_d[l_ac].xrceld,
           #                g_xrce2_d[l_ac].xrcesite,g_xrce2_d[l_ac].xrceseq,g_xrce2_d[l_ac].xrce002,g_xrce2_d[l_ac].xrce006,
           #                g_xrce2_d[l_ac].xrce003,g_xrce2_d[l_ac].xrce004,g_xrce2_d[l_ac].xrce008,g_xrce2_d[l_ac].xrce100,
           #                g_xrce2_d[l_ac].xrce109,g_xrce2_d[l_ac].xrce101,g_xrce2_d[l_ac].xrce119,g_xrce2_d[l_ac].xrce120,
           #                g_xrce2_d[l_ac].xrce121,g_xrce2_d[l_ac].xrce129,g_xrce2_d[l_ac].xrce130,g_xrce2_d[l_ac].xrce131,
           #                g_xrce2_d[l_ac].xrce139,g_xrce3_d[l_ac].xrce001,g_xrce3_d[l_ac].xrcedocno,g_xrce3_d[l_ac].xrceld,
           #                g_xrce3_d[l_ac].xrcesite,g_xrce3_d[l_ac].xrceseq,g_xrce3_d[l_ac].xrce002,g_xrce3_d[l_ac].xrce006,
           #                g_xrce3_d[l_ac].xrce003,g_xrce3_d[l_ac].xrce004,g_xrce3_d[l_ac].xrce008,
           #                g_xrce3_d[l_ac].xrce100,g_xrce3_d[l_ac].xrce109,g_xrce3_d[l_ac].xrce101,g_xrce3_d[l_ac].xrce119,
           #                g_xrce3_d[l_ac].xrce010,g_xrce3_d[l_ac].xrce016,g_xrce3_d[l_ac].xrce017,
           #                g_xrce3_d[l_ac].xrce018,g_xrce3_d[l_ac].xrce019,g_xrce3_d[l_ac].xrce020,g_xrce3_d[l_ac].xrce022,
           #                g_xrce3_d[l_ac].xrce023
           #         END IF
           #         IF SQLCA.sqlcode THEN
           #            INITIALIZE g_errparam TO NULL
           #            LET g_errparam.code = SQLCA.sqlcode
           #            LET g_errparam.extend = ''
           #            LET g_errparam.popup = TRUE
           #            CALL cl_err()
           #
           #            LET l_lock_sw = "Y"
           #         END IF
           #         
           #         CALL cl_show_fld_cont()
           #         CALL axrt300_02_detail_show()
           #      END IF
           #   ELSE
           #      LET l_cmd='a'
           #   END IF
           #END IF
           #160420-00001#1 Mark ---(S)---
            #end add-point  
            #其他table資料備份(確定是否更改用)
            
 
 
 
            #其他table進行lock
            
 
 
 
            
         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' THEN
               LET l_cmd='d'
            ELSE
               #add-point:單身3ask刪除前 name="input.body3.b_delete_ask" #171003-00009#1
               
               #end add-point 
            
               IF NOT cl_ask_del_detail() THEN
                  CANCEL DELETE
               END IF
               IF l_lock_sw = "Y" THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code = -263 
                  LET g_errparam.popup = TRUE 
                  CALL cl_err()
                  CANCEL DELETE
               END IF
               #171006-00020 ---start---
               #確定是否有刪除的權限
               #先確定該table有ownid
               IF cl_getField("xrce_t","") THEN   
                  IF NOT cl_auth_chk_act_permission("delete") THEN
                     #有目前權限無法刪除的資料
                     CANCEL DELETE
                  END IF
               END IF
               #171006-00020 --- end ---
               
               #add-point:單身3刪除前 name="input.body3.b_delete"
              #160420-00001#1 Mark ---(S)---
              #SELECT gzcb004 INTO l_gzcb004
              #  FROM gzcb_t
              # WHERE gzcb001 = '8306'
              #   AND gzcb002 = g_xrce_d[l_ac].xrce002
              #IF l_gzcb004 = '2' THEN
              #160420-00001#1 Mark ---(E)---
               #end add-point 
               
               DELETE FROM xrce_t
                WHERE xrceent = g_enterprise AND
                  xrceld = g_xrce3_d_t.xrceld
                  AND xrcedocno = g_xrce3_d_t.xrcedocno
                  AND xrceseq = g_xrce3_d_t.xrceseq
                  
               #add-point:單身3刪除中 name="input.body3.m_delete"
              #160420-00001#1 Mark ---(S)---
              #ELSE
              #   DELETE FROM xrde_t
              #    WHERE xrdeent = g_enterprise
              #      AND xrdeld = g_xrce3_d_t.xrceld
              #      AND xrdedocno = g_xrce3_d_t.xrcedocno
              #      AND xrdeseq = g_xrce3_d_t.xrceseq
              #END IF
              #160420-00001#1 Mark ---(E)---
               #end add-point 
                  
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "xrce_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE
                  LET g_errparam.popup = TRUE 
                  CALL cl_err()
                  CANCEL DELETE   
               ELSE
                  LET g_detail_cnt = g_detail_cnt-1
                  
 
 
 
                  
 
 
   #161130-00056
                  #add-point:單身3刪除後 name="input.body3.a_delete"
                  
                  #end add-point
                  #修改歷程記錄(刪除)
                  CALL axrt300_02_set_pk_array()
                  LET g_log1 = util.JSON.stringify(g_xrce3_d[l_ac])   #(ver:38)
                  IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:38)
                  ELSE
                  END IF
               END IF 
               CLOSE axrt300_02_bcl
               #add-point:單身3刪除關閉bcl name="input.body3.close"
              #CLOSE axrt300_02_bcl1   #160420-00001#1 Mark
               #end add-point
               LET l_count = g_xrce_d.getLength()
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_xrce3_d_t.xrceld
               LET gs_keys[2] = g_xrce3_d_t.xrcedocno
               LET gs_keys[3] = g_xrce3_d_t.xrceseq
 
               #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL axrt300_02_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
 
            END IF 
            
         AFTER DELETE 
            IF l_cmd <> 'd' THEN
               #add-point:單身刪除後2 name="input.body3.after_delete"
               
               #end add-point
                              CALL axrt300_02_delete_b('xrce_t',gs_keys,"'3'")
            END IF
            #如果是最後一筆
            IF l_ac = (g_xrce3_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
            #add-point:單身刪除後3 name="input.body3.after_delete3"
            
            #end add-point
 
         AFTER INSERT    
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CALL cl_err()
               LET INT_FLAG = 0
               CANCEL INSERT
            END IF
               
            LET l_count = 1  
            SELECT COUNT(1) INTO l_count FROM xrce_t 
             WHERE xrceent = g_enterprise AND
                   xrceld = g_xrce3_d[l_ac].xrceld
                   AND xrcedocno = g_xrce3_d[l_ac].xrcedocno
                   AND xrceseq = g_xrce3_d[l_ac].xrceseq
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身3新增前 name="input.body3.b_insert"
 
               #end add-point
            
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_xrce3_d[g_detail_idx].xrceld
               LET gs_keys[2] = g_xrce3_d[g_detail_idx].xrcedocno
               LET gs_keys[3] = g_xrce3_d[g_detail_idx].xrceseq
               CALL axrt300_02_insert_b('xrce_t',gs_keys,"'3'")
                           
               #add-point:單身新增後3 name="input.body3.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_xrce_d[l_ac].* TO NULL
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "xrce_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL axrt300_02_b_fill(g_wc2)
               #資料多語言用-增/改
               
                  #161130-00056
               #add-point:單身新增後 name="input.body3.after_insert"
               
               #end add-point
               ##ERROR 'INSERT O.K'
               LET g_detail_cnt = g_detail_cnt + 1
               LET g_wc2 = g_wc2, " OR (xrceld = '", g_xrce3_d[l_ac].xrceld, "' "
                                  ," AND xrcedocno = '", g_xrce3_d[l_ac].xrcedocno, "' "
                                  ," AND xrceseq = '", g_xrce3_d[l_ac].xrceseq, "' "
                                  ,")"
            END IF
            
         ON ROW CHANGE 
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CALL cl_err()
               LET INT_FLAG = 0
               LET g_xrce3_d[l_ac].* = g_xrce3_d_t.*
               CLOSE axrt300_02_bcl
               #add-point:單身page3取消後 name="input.body3.cancel"
              #CLOSE axrt300_02_bcl1   #160420-00001#1 Mark
               #end add-point
               EXIT DIALOG 
            END IF
            
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_xrce3_d[l_ac].* = g_xrce3_d_t.*
            ELSE
               
               #寫入修改者/修改日期資訊(單身3)
               
               
               #add-point:單身page3修改前 name="input.body3.b_update"
              #160420-00001#1 Mark ---(S)---
              #SELECT gzcb004 INTO l_gzcb004
              #  FROM gzcb_t
              # WHERE gzcb001 = '8306'
              #   AND gzcb002 = g_xrce_d[l_ac].xrce002
              #IF l_gzcb004 = '2' THEN
              #160420-00001#1 Mark ---(E)---
               #end add-point
               
               #將遮罩欄位還原
               CALL axrt300_02_xrce_t_mask_restore('restore_mask_o')
               
               UPDATE xrce_t SET (xrce001,xrcedocno,xrceld,xrcesite,xrceseq,xrce002,xrce003,xrce004, 
                   xrce005,xrce024,xrce025,xrce008,xrce015,xrce100,xrce101,xrce103,xrce104,xrce109,xrce113, 
                   xrce114,xrce119,xrce027,xrce028,xrcecomp,xrceorga,xrce010,xrce016,xrce120,xrce121, 
                   xrce123,xrce124,xrce129,xrce130,xrce131,xrce133,xrce134,xrce139,xrce017,xrce018,xrce019, 
                   xrce020,xrce022,xrce023,xrce040,xrce035,xrce036,xrce038,xrce039,xrce041,xrce042,xrce043, 
                   xrce044,xrce045,xrce046,xrce047,xrce048,xrce049,xrce050,xrce051) = (g_xrce_d[l_ac].xrce001, 
                   g_xrce_d[l_ac].xrcedocno,g_xrce_d[l_ac].xrceld,g_xrce_d[l_ac].xrcesite,g_xrce_d[l_ac].xrceseq, 
                   g_xrce_d[l_ac].xrce002,g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce005, 
                   g_xrce_d[l_ac].xrce024,g_xrce_d[l_ac].xrce025,g_xrce_d[l_ac].xrce008,g_xrce_d[l_ac].xrce015, 
                   g_xrce_d[l_ac].xrce100,g_xrce_d[l_ac].xrce101,g_xrce_d[l_ac].xrce103,g_xrce_d[l_ac].xrce104, 
                   g_xrce_d[l_ac].xrce109,g_xrce_d[l_ac].xrce113,g_xrce_d[l_ac].xrce114,g_xrce_d[l_ac].xrce119, 
                   g_xrce_d[l_ac].xrce027,g_xrce_d[l_ac].xrce028,g_xrce_d[l_ac].xrcecomp,g_xrce_d[l_ac].xrceorga, 
                   g_xrce_d[l_ac].xrce010,g_xrce_d[l_ac].xrce016,g_xrce2_d[l_ac].xrce120,g_xrce2_d[l_ac].xrce121, 
                   g_xrce2_d[l_ac].xrce123,g_xrce2_d[l_ac].xrce124,g_xrce2_d[l_ac].xrce129,g_xrce2_d[l_ac].xrce130, 
                   g_xrce2_d[l_ac].xrce131,g_xrce2_d[l_ac].xrce133,g_xrce2_d[l_ac].xrce134,g_xrce2_d[l_ac].xrce139, 
                   g_xrce3_d[l_ac].xrce017,g_xrce3_d[l_ac].xrce018,g_xrce3_d[l_ac].xrce019,g_xrce3_d[l_ac].xrce020, 
                   g_xrce3_d[l_ac].xrce022,g_xrce3_d[l_ac].xrce023,g_xrce3_d[l_ac].xrce040,g_xrce3_d[l_ac].xrce035, 
                   g_xrce3_d[l_ac].xrce036,g_xrce3_d[l_ac].xrce038,g_xrce3_d[l_ac].xrce039,g_xrce3_d[l_ac].xrce041, 
                   g_xrce3_d[l_ac].xrce042,g_xrce3_d[l_ac].xrce043,g_xrce3_d[l_ac].xrce044,g_xrce3_d[l_ac].xrce045, 
                   g_xrce3_d[l_ac].xrce046,g_xrce3_d[l_ac].xrce047,g_xrce3_d[l_ac].xrce048,g_xrce3_d[l_ac].xrce049, 
                   g_xrce3_d[l_ac].xrce050,g_xrce3_d[l_ac].xrce051) #自訂欄位頁簽
                WHERE xrceent = g_enterprise AND
                  xrceld = g_xrce3_d_t.xrceld #項次 
                  AND xrcedocno = g_xrce3_d_t.xrcedocno
                  AND xrceseq = g_xrce3_d_t.xrceseq
                  
               #add-point:單身page3修改中 name="input.body3.m_update"
              #160420-00001#1 Mark ---(S)---
              #ELSE
              #   UPDATE xrde_t SET (xrde001,xrdedocno,xrdeld,xrdesite,xrdeseq,xrde002,xrde006,xrde003, 
              #                      xrde004,xrde008,xrde100,xrde109,xrde101,xrde119,xrde010, 
              #                      xrde018,xrde015,xrde028,xrdecomp,xrdeorga,xrde120, 
              #                      xrde121,xrde129,xrde130,xrde131,xrde139,xrde016,xrde017,xrde019,xrde020,xrde022,xrde023) = (g_xrce_d[l_ac].xrce001, 
              #                      g_xrce_d[l_ac].xrcedocno,g_xrce_d[l_ac].xrceld,g_xrce_d[l_ac].xrcesite,g_xrce_d[l_ac].xrceseq, 
              #                      g_xrce_d[l_ac].xrce002,g_xrce_d[l_ac].xrce006,g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004, 
              #                      g_xrce_d[l_ac].xrce008, 
              #                      g_xrce_d[l_ac].xrce100,g_xrce_d[l_ac].xrce109,g_xrce_d[l_ac].xrce101,g_xrce_d[l_ac].xrce119, 
              #                      g_xrce3_d[l_ac].xrce010,g_xrce3_d[l_ac].xrce018,g_xrce_d[l_ac].xrce015, 
              #                      g_xrce_d[l_ac].xrce028, 
              #                      g_xrce_d[l_ac].xrcecomp,g_xrce_d[l_ac].xrceorga,g_xrce2_d[l_ac].xrce120, 
              #                      g_xrce2_d[l_ac].xrce121,g_xrce2_d[l_ac].xrce129,g_xrce2_d[l_ac].xrce130,g_xrce2_d[l_ac].xrce131, 
              #                      g_xrce2_d[l_ac].xrce139,g_xrce3_d[l_ac].xrce016,g_xrce3_d[l_ac].xrce017,g_xrce3_d[l_ac].xrce019, 
              #                      g_xrce3_d[l_ac].xrce020,g_xrce3_d[l_ac].xrce022,g_xrce3_d[l_ac].xrce023)
              # WHERE xrdeent = g_enterprise 
              #   AND xrdeld = g_xrce3_d_t.xrceld #項次 
              #   AND xrdedocno = g_xrce3_d_t.xrcedocno
              #   AND xrdeseq = g_xrce3_d_t.xrceseq 
              #END IF
              #160420-00001#1 Mark ---(E)---
               #end add-point
                  
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "xrce_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                  WHEN SQLCA.SQLCODE #其他錯誤
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "xrce_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                  OTHERWISE
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_xrce3_d[g_detail_idx].xrceld
               LET gs_keys_bak[1] = g_xrce3_d_t.xrceld
               LET gs_keys[2] = g_xrce3_d[g_detail_idx].xrcedocno
               LET gs_keys_bak[2] = g_xrce3_d_t.xrcedocno
               LET gs_keys[3] = g_xrce3_d[g_detail_idx].xrceseq
               LET gs_keys_bak[3] = g_xrce3_d_t.xrceseq
               CALL axrt300_02_update_b('xrce_t',gs_keys,gs_keys_bak,"'3'")
                     #資料多語言用-增/改
                     
                        #161130-00056
                     
                     #修改歷程記錄(修改)
                     LET g_log1 = util.JSON.stringify(g_xrce3_d_t)
                     LET g_log2 = util.JSON.stringify(g_xrce3_d[l_ac])
                     IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                     END IF
               END CASE
               
               #將遮罩欄位進行遮蔽
               CALL axrt300_02_xrce_t_mask_restore('restore_mask_n')
               
               #add-point:單身page3修改後 name="input.body3.a_update"
               
               #end add-point
            END IF
         
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce001_u
            #add-point:BEFORE FIELD xrce001_u name="input.b.page3.xrce001_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce001_u
            
            #add-point:AFTER FIELD xrce001_u name="input.a.page3.xrce001_u"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce001_u
            #add-point:ON CHANGE xrce001_u name="input.g.page3.xrce001_u"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcedocno_u
            #add-point:BEFORE FIELD xrcedocno_u name="input.b.page3.xrcedocno_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcedocno_u
            
            #add-point:AFTER FIELD xrcedocno_u name="input.a.page3.xrcedocno_u"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcedocno_u
            #add-point:ON CHANGE xrcedocno_u name="input.g.page3.xrcedocno_u"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrceld_u
            #add-point:BEFORE FIELD xrceld_u name="input.b.page3.xrceld_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrceld_u
            
            #add-point:AFTER FIELD xrceld_u name="input.a.page3.xrceld_u"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrceld_u
            #add-point:ON CHANGE xrceld_u name="input.g.page3.xrceld_u"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcesite_u
            #add-point:BEFORE FIELD xrcesite_u name="input.b.page3.xrcesite_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcesite_u
            
            #add-point:AFTER FIELD xrcesite_u name="input.a.page3.xrcesite_u"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcesite_u
            #add-point:ON CHANGE xrcesite_u name="input.g.page3.xrcesite_u"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrceseq_u
            #add-point:BEFORE FIELD xrceseq_u name="input.b.page3.xrceseq_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrceseq_u
            
            #add-point:AFTER FIELD xrceseq_u name="input.a.page3.xrceseq_u"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrceseq_u
            #add-point:ON CHANGE xrceseq_u name="input.g.page3.xrceseq_u"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce002_u
            #add-point:BEFORE FIELD xrce002_u name="input.b.page3.xrce002_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce002_u
            
            #add-point:AFTER FIELD xrce002_u name="input.a.page3.xrce002_u"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce002_u
            #add-point:ON CHANGE xrce002_u name="input.g.page3.xrce002_u"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce003_u
            #add-point:BEFORE FIELD xrce003_u name="input.b.page3.xrce003_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce003_u
            
            #add-point:AFTER FIELD xrce003_u name="input.a.page3.xrce003_u"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce003_u
            #add-point:ON CHANGE xrce003_u name="input.g.page3.xrce003_u"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce004_u
            #add-point:BEFORE FIELD xrce004_u name="input.b.page3.xrce004_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce004_u
            
            #add-point:AFTER FIELD xrce004_u name="input.a.page3.xrce004_u"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce004_u
            #add-point:ON CHANGE xrce004_u name="input.g.page3.xrce004_u"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce005_u
            #add-point:BEFORE FIELD xrce005_u name="input.b.page3.xrce005_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce005_u
            
            #add-point:AFTER FIELD xrce005_u name="input.a.page3.xrce005_u"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce005_u
            #add-point:ON CHANGE xrce005_u name="input.g.page3.xrce005_u"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce008_u
            #add-point:BEFORE FIELD xrce008_u name="input.b.page3.xrce008_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce008_u
            
            #add-point:AFTER FIELD xrce008_u name="input.a.page3.xrce008_u"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce008_u
            #add-point:ON CHANGE xrce008_u name="input.g.page3.xrce008_u"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce100_u
            #add-point:BEFORE FIELD xrce100_u name="input.b.page3.xrce100_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce100_u
            
            #add-point:AFTER FIELD xrce100_u name="input.a.page3.xrce100_u"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce100_u
            #add-point:ON CHANGE xrce100_u name="input.g.page3.xrce100_u"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce109_u
            #add-point:BEFORE FIELD xrce109_u name="input.b.page3.xrce109_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce109_u
            
            #add-point:AFTER FIELD xrce109_u name="input.a.page3.xrce109_u"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce109_u
            #add-point:ON CHANGE xrce109_u name="input.g.page3.xrce109_u"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce101_u
            #add-point:BEFORE FIELD xrce101_u name="input.b.page3.xrce101_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce101_u
            
            #add-point:AFTER FIELD xrce101_u name="input.a.page3.xrce101_u"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce101_u
            #add-point:ON CHANGE xrce101_u name="input.g.page3.xrce101_u"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce119_u
            #add-point:BEFORE FIELD xrce119_u name="input.b.page3.xrce119_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce119_u
            
            #add-point:AFTER FIELD xrce119_u name="input.a.page3.xrce119_u"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce119_u
            #add-point:ON CHANGE xrce119_u name="input.g.page3.xrce119_u"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce027_u
            #add-point:BEFORE FIELD xrce027_u name="input.b.page3.xrce027_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce027_u
            
            #add-point:AFTER FIELD xrce027_u name="input.a.page3.xrce027_u"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce027_u
            #add-point:ON CHANGE xrce027_u name="input.g.page3.xrce027_u"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce010_u
            #add-point:BEFORE FIELD xrce010_u name="input.b.page3.xrce010_u"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce010_u
            
            #add-point:AFTER FIELD xrce010_u name="input.a.page3.xrce010_u"
            IF NOT cl_null(g_xrce3_d[l_ac].xrce010) THEN
              LET g_msg = g_xrce3_d[l_ac].xrce010
              IF g_msg[1,1] = '.' THEN
                 LET g_msg = g_msg[2,10]
                 SELECT oocql004 INTO g_xrce3_d[l_ac].xrce010 FROM oocql_t
                  WHERE oocqlent = g_enterprise
                    AND oocql001 = '3005'
                    AND oocql002 = g_msg
                    AND oocql003 = g_lang
                 DISPLAY g_xrce3_d[l_ac].xrce010 TO s_detail3[l_ac].xrce010
              END IF
           END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce010_u
            #add-point:ON CHANGE xrce010_u name="input.g.page3.xrce010_u"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce016_u
            
            #add-point:AFTER FIELD xrce016_u name="input.a.page3.xrce016_u"


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce016_u
            #add-point:BEFORE FIELD xrce016_u name="input.b.page3.xrce016_u"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce016_u
            #add-point:ON CHANGE xrce016_u name="input.g.page3.xrce016_u"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce016_u_desc
            #add-point:BEFORE FIELD xrce016_u_desc name="input.b.page3.xrce016_u_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce016_u_desc
            
            #add-point:AFTER FIELD xrce016_u_desc name="input.a.page3.xrce016_u_desc"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce016_u_desc
            #add-point:ON CHANGE xrce016_u_desc name="input.g.page3.xrce016_u_desc"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce017
            
            #add-point:AFTER FIELD xrce017 name="input.a.page3.xrce017"
            IF NOT cl_null(g_xrce3_d[l_ac].xrce017) THEN
               SELECT ooagstus INTO l_ooagstus FROM ooag_t
                #WHERE ooag001 = g_xrce3_d[l_ac].xrce017                             #160905-00002#6  mark
                WHERE ooagent = g_enterprise AND ooag001 = g_xrce3_d[l_ac].xrce017   #160905-00002#6  add
               LET g_errno = ' '
               CASE
                  WHEN SQLCA.SQLCODE = 100              #存在性
                     LET g_errno = 'aim-00069' RETURN
                  WHEN l_ooagstus = 'N'                 #有效性
#                     LET g_errno = 'aim-00070' RETURN   #160318-00005#53  mark
                     LET g_errno = 'sub-01302' RETURN    #160318-00005#53  add
               END CASE
               IF NOT cl_null(g_errno) THEN
                  IF l_cmd = 'a' THEN
                     DISPLAY '','' TO s_detail3[l_ac].xrce017,s_detail3[l_ac].xrce017_desc
                  ELSE
                     DISPLAY g_xrce3_d_t.xrce017 TO s_detail3[l_ac].xrce017
                     LET g_ref_fields[1] = g_xrce3_d_t.xrce017
                     CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
                     LET g_xrce3_d[l_ac].xrce017_desc = '', g_rtn_fields[1] , ''
                     DISPLAY BY NAME g_xrce3_d[l_ac].xrce017_desc
                  END IF
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_xrce3_d[l_ac].xrce017
                  #160318-00005#53 --s add
                  CASE g_errno
                     WHEN 'sub-01302'
                        LET g_errparam.replace[1] = 'aooi130'
                        LET g_errparam.replace[2] = cl_get_progname('aooi130',g_lang,"2")
                        LET g_errparam.exeprog = 'aooi130'
                  END CASE
                  #160318-00005#53 --e add
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  IF l_cmd = 'a' THEN
                     LET g_xrce3_d[l_ac].xrce017 = ''
                  ELSE
                     LET g_xrce3_d[l_ac].xrce017 =  g_xrce3_d_t.xrce017
                  END IF
                  DISPLAY g_xrce3_d[l_ac].xrce017 TO s_detail3[l_ac].xrce017
                  NEXT FIELD xrce017
               END IF
            END IF
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_xrce3_d[l_ac].xrce017
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_xrce3_d[l_ac].xrce017_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_xrce3_d[l_ac].xrce017_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce017
            #add-point:BEFORE FIELD xrce017 name="input.b.page3.xrce017"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce017
            #add-point:ON CHANGE xrce017 name="input.g.page3.xrce017"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce018_u
            
            #add-point:AFTER FIELD xrce018_u name="input.a.page3.xrce018_u"
            
            #160331-00012#1 add -str
               IF NOT cl_null(g_xrce3_d[l_ac].xrce018) THEN 
                  LET g_errno = ''
                  CALL s_voucher_glaq018_chk(g_xrce3_d[l_ac].xrce018,g_xrca_t.xrcadocdt)
                  IF NOT cl_null(g_errno) THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code   = g_errno
                     LEt g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_xrce3_d[l_ac].xrce018 = g_xrce3_d_t.xrce018
                     NEXT FIELD CURRENT  
                  END IF 
         
               END IF
            #160331-00012#1 add -end
#            IF NOT ap_chk_isExist(g_xrce3_d[l_ac].xrce018,"SELECT COUNT(*) FROM ooea_t WHERE "||"ooeaent = '" ||g_enterprise|| "' AND "||"ooea001 = ? ",'aoo-00094',1) THEN 
#               LET g_xrce3_d[l_ac].xrce018 = g_xrce3_d_t.xrce018
#               NEXT FIELD CURRENT
#            END IF
#            IF NOT ap_chk_isExist(g_xrce3_d[l_ac].xrce018,"SELECT COUNT(*) FROM ooea_t WHERE "||"ooeaent = '" ||g_enterprise|| "' AND "||"ooea001 = ? AND ooeastus = 'Y' ",'aoo-00095',1) THEN    #160318-00005#53  mark
#            IF NOT ap_chk_isExist(g_xrce3_d[l_ac].xrce018,"SELECT COUNT(*) FROM ooea_t WHERE "||"ooeaent = '" ||g_enterprise|| "' AND "||"ooea001 = ? AND ooeastus = 'Y' ",'sub-01302','aooi125') THEN   #160318-00005#53  add
#               LET g_xrce3_d[l_ac].xrce018 = g_xrce3_d_t.xrce018
#               NEXT FIELD CURRENT
#            END IF  
#            IF NOT ap_chk_isExist(g_xrce3_d[l_ac].xrce018,"SELECT COUNT(*) FROM ooea_t WHERE "||"ooeaent = '" ||g_enterprise|| "' AND "||"ooea001 = ? AND ooeastus = 'Y' AND ooea016 = 'Y' ",'aoo-00092',1) THEN 
#               LET g_xrce3_d[l_ac].xrce018 = g_xrce3_d_t.xrce018
#               NEXT FIELD CURRENT
#            END IF
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_xrce3_d[l_ac].xrce018
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_xrce3_d[l_ac].xrce018_u_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_xrce3_d[l_ac].xrce018_u_desc

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce018_u
            #add-point:BEFORE FIELD xrce018_u name="input.b.page3.xrce018_u"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce018_u
            #add-point:ON CHANGE xrce018_u name="input.g.page3.xrce018_u"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce019
            
            #add-point:AFTER FIELD xrce019 name="input.a.page3.xrce019"
            IF NOT cl_null(g_xrce3_d[l_ac].xrce019) THEN
               IF NOT ap_chk_isExist(g_xrce3_d[l_ac].xrce019,"SELECT COUNT(*) FROM ooeg_t WHERE "||"ooegent = '" ||g_enterprise|| "' AND "||"ooeg001 = ? ",'aoo-00094',1) THEN   #161011-00007#1 Mod ooea --> ooeg
                  LET g_xrce3_d[l_ac].xrce019 = g_xrce3_d_t.xrce019
                  NEXT FIELD CURRENT
               END IF
#               IF NOT ap_chk_isExist(g_xrce3_d[l_ac].xrce019,"SELECT COUNT(*) FROM ooea_t WHERE "||"ooeaent = '" ||g_enterprise|| "' AND "||"ooea001 = ? AND ooeastus = 'Y' ",'aoo-00095',1) THEN    #160318-00005#53  mark
               IF NOT ap_chk_isExist(g_xrce3_d[l_ac].xrce019,"SELECT COUNT(*) FROM ooeg_t WHERE "||"ooegent = '" ||g_enterprise|| "' AND "||"ooeg001 = ? AND ooegstus = 'Y' ",'sub-01302','aooi125') THEN     #160318-00005#53  add   #161011-00007#1 Mod ooea --> ooeg
                  LET g_xrce3_d[l_ac].xrce019 = g_xrce3_d_t.xrce019
                  NEXT FIELD CURRENT
               #161026-00013#2 --s add
               ELSE
                  #責任中心類型檢核
                  LET l_ooeg003 = ''
                  SELECT ooeg003 INTO l_ooeg003 FROM ooeg_t WHERE ooegent = g_enterprise AND ooeg001 = g_xrce3_d[l_ac].xrce019
                  IF NOT (l_ooeg003 = '1' OR l_ooeg003 = '2' OR l_ooeg003 = '3') THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_xrce3_d[l_ac].xrce019
                     LET g_errparam.code   = 'agl-00305'
                     LET g_errparam.popup  = FALSE 
                     CALL cl_err()
                     LET g_xrce3_d[l_ac].xrce019 = g_xrce3_d_t.xrce019
                     NEXT FIELD CURRENT
                  END IF
               #161026-00013#2 --e add
               END IF
            END IF
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_xrce3_d[l_ac].xrce019
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_lang||"'","") RETURNING g_rtn_fields
            LET g_xrce3_d[l_ac].xrce019_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_xrce3_d[l_ac].xrce019_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce019
            #add-point:BEFORE FIELD xrce019 name="input.b.page3.xrce019"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce019
            #add-point:ON CHANGE xrce019 name="input.g.page3.xrce019"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce020
            
            #add-point:AFTER FIELD xrce020 name="input.a.page3.xrce020"


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce020
            #add-point:BEFORE FIELD xrce020 name="input.b.page3.xrce020"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce020
            #add-point:ON CHANGE xrce020 name="input.g.page3.xrce020"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce022
            #add-point:BEFORE FIELD xrce022 name="input.b.page3.xrce022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce022
            
            #add-point:AFTER FIELD xrce022 name="input.a.page3.xrce022"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce022
            #add-point:ON CHANGE xrce022 name="input.g.page3.xrce022"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce023
            #add-point:BEFORE FIELD xrce023 name="input.b.page3.xrce023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce023
            
            #add-point:AFTER FIELD xrce023 name="input.a.page3.xrce023"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce023
            #add-point:ON CHANGE xrce023 name="input.g.page3.xrce023"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce040
            
            #add-point:AFTER FIELD xrce040 name="input.a.page3.xrce040"
            #170621-00032#1-----s
            IF NOT cl_null(g_xrce3_d[l_ac].xrce040) THEN
               CALL s_voucher_glaq052_chk(g_xrce3_d[l_ac].xrce040)
               IF NOT cl_null(g_errno) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET g_xrce3_d[l_ac].xrce040        = g_xrce3_d_t.xrce040
                  LET g_xrce3_d[l_ac].l_xrce040_desc = g_xrce3_d_t.l_xrce040_desc
                  DISPLAY BY NAME g_xrce3_d[l_ac].xrce040
                  NEXT FIELD CURRENT
               END IF
            END IF
            LET g_xrce3_d[l_ac].l_xrce040_desc = s_desc_get_oojdl003_desc(g_xrce3_d[l_ac].xrce040)
            #170621-00032#1-----e
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce040
            #add-point:BEFORE FIELD xrce040 name="input.b.page3.xrce040"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce040
            #add-point:ON CHANGE xrce040 name="input.g.page3.xrce040"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_xrce040_desc
            #add-point:BEFORE FIELD l_xrce040_desc name="input.b.page3.l_xrce040_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_xrce040_desc
            
            #add-point:AFTER FIELD l_xrce040_desc name="input.a.page3.l_xrce040_desc"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_xrce040_desc
            #add-point:ON CHANGE l_xrce040_desc name="input.g.page3.l_xrce040_desc"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce035
            #add-point:BEFORE FIELD xrce035 name="input.b.page3.xrce035"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce035
            
            #add-point:AFTER FIELD xrce035 name="input.a.page3.xrce035"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce035
            #add-point:ON CHANGE xrce035 name="input.g.page3.xrce035"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce035_desc
            #add-point:BEFORE FIELD xrce035_desc name="input.b.page3.xrce035_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce035_desc
            
            #add-point:AFTER FIELD xrce035_desc name="input.a.page3.xrce035_desc"
            #171016-00011#3 -s 171017 add by 08172
            LET g_xrce3_d[l_ac].xrce035 = g_xrce3_d[l_ac].xrce035_desc
            CALL axrt300_02_xrce035_desc('287',g_xrce3_d[l_ac].xrce035) RETURNING g_xrce3_d[l_ac].xrce035_desc
            LET g_xrce3_d[l_ac].xrce035_desc = g_xrce3_d[l_ac].xrce035 CLIPPED,g_xrce3_d[l_ac].xrce035_desc
            IF NOT cl_null(g_xrce3_d[l_ac].xrce035) THEN 
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL    
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_xrce3_d[l_ac].xrce035
               LET g_errshow = TRUE   
               #呼叫檢查存在並帶值的library
               
               LET g_chkparam.err_str[1] = "axm-00004:sub-01302|",cl_get_progname("axmi027",g_lang,"2"),"|:EXEPROGaxmi027"
               LET g_chkparam.err_str[2] = "axm-00003:sub-01303|axmi027|",cl_get_progname("axmi027",g_lang,"2"),"|:EXEPROGaxmi027"
               
               IF cl_chk_exist("v_oocq002_287") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  LET g_xrce3_d[l_ac].xrce035 = g_xrce3_d_t.xrce035
                  LET g_xrce3_d[l_ac].xrce035_desc = g_xrce3_d_t.xrce035_desc
                  NEXT FIELD CURRENT
               END IF
            END IF
            #171016-00011#3 -e 171017 add by 08172
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce035_desc
            #add-point:ON CHANGE xrce035_desc name="input.g.page3.xrce035_desc"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce036
            #add-point:BEFORE FIELD xrce036 name="input.b.page3.xrce036"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce036
            
            #add-point:AFTER FIELD xrce036 name="input.a.page3.xrce036"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce036
            #add-point:ON CHANGE xrce036 name="input.g.page3.xrce036"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce036_desc
            #add-point:BEFORE FIELD xrce036_desc name="input.b.page3.xrce036_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce036_desc
            
            #add-point:AFTER FIELD xrce036_desc name="input.a.page3.xrce036_desc"
            #171016-00011#3 -s 171017 add by 08172
            LET g_xrce3_d[l_ac].xrce036 = g_xrce3_d[l_ac].xrce036_desc
            CALL axrt300_02_xrce035_desc('281',g_xrce3_d[l_ac].xrce036) RETURNING g_xrce3_d[l_ac].xrce036_desc
            LET g_xrce3_d[l_ac].xrce036_desc = g_xrce3_d[l_ac].xrce036 CLIPPED,g_xrce3_d[l_ac].xrce036_desc
            IF NOT cl_null(g_xrce3_d[l_ac].xrce036) THEN 
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL    
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_xrce3_d[l_ac].xrce036
               LET g_errshow = TRUE   
               LET g_chkparam.err_str[1] = "apm-00093:sub-01302|",cl_get_progname("axmi021",g_lang,"2"),"|:EXEPROGaxmi021"                            
               LET g_chkparam.err_str[2] = "apm-00092:sub-01303|axmi021|",cl_get_progname("axmi021",g_lang,"2"),"|:EXEPROGaxmi021"    
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_oocq002_281") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  LET g_xrce3_d[l_ac].xrce036 = g_xrce3_d_t.xrce036
                  LET g_xrce3_d[l_ac].xrce036_desc = g_xrce3_d_t.xrce036_desc
                  NEXT FIELD CURRENT
               END IF
            END IF 
            #171016-00011#3 -e 171017 add by 08172
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce036_desc
            #add-point:ON CHANGE xrce036_desc name="input.g.page3.xrce036_desc"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce038
            #add-point:BEFORE FIELD xrce038 name="input.b.page3.xrce038"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce038
            
            #add-point:AFTER FIELD xrce038 name="input.a.page3.xrce038"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce038
            #add-point:ON CHANGE xrce038 name="input.g.page3.xrce038"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce039
            #add-point:BEFORE FIELD xrce039 name="input.b.page3.xrce039"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce039
            
            #add-point:AFTER FIELD xrce039 name="input.a.page3.xrce039"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce039
            #add-point:ON CHANGE xrce039 name="input.g.page3.xrce039"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce041
            #add-point:BEFORE FIELD xrce041 name="input.b.page3.xrce041"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce041
            
            #add-point:AFTER FIELD xrce041 name="input.a.page3.xrce041"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce041
            #add-point:ON CHANGE xrce041 name="input.g.page3.xrce041"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce041_desc
            #add-point:BEFORE FIELD xrce041_desc name="input.b.page3.xrce041_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce041_desc
            
            #add-point:AFTER FIELD xrce041_desc name="input.a.page3.xrce041_desc"
            #171016-00011#3 -s 171017 add by 08172
            LET g_xrce3_d[l_ac].xrce041 = g_xrce3_d[l_ac].xrce041_desc
            CALL s_desc_get_acc_desc('2002',g_xrce3_d[l_ac].xrce041) RETURNING g_xrce3_d[l_ac].xrce041_desc
            LET g_xrce3_d[l_ac].xrce041_desc = g_xrce3_d[l_ac].xrce041 CLIPPED,g_xrce3_d[l_ac].xrce041_desc
            IF NOT cl_null(g_xrce3_d[l_ac].xrce041) THEN 
               IF NOT s_azzi650_chk_exist('2002',g_xrce3_d[l_ac].xrce041) THEN
                  LET g_xrce3_d[l_ac].xrce041 = g_xrce3_d_t.xrce041
                  LET g_xrce3_d[l_ac].xrce041_desc = g_xrce3_d_t.xrce041_desc
                  NEXT FIELD CURRENT
               END IF
            END IF 
            #171016-00011#3 -e 171017 add by 08172
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce041_desc
            #add-point:ON CHANGE xrce041_desc name="input.g.page3.xrce041_desc"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce042
            #add-point:BEFORE FIELD xrce042 name="input.b.page3.xrce042"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce042
            
            #add-point:AFTER FIELD xrce042 name="input.a.page3.xrce042"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce042
            #add-point:ON CHANGE xrce042 name="input.g.page3.xrce042"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce042_desc
            #add-point:BEFORE FIELD xrce042_desc name="input.b.page3.xrce042_desc"
            #171016-00011#3 -s 171017 add by 08172
            LET g_xrce3_d[l_ac].xrce042_desc = g_xrce3_d[l_ac].xrce042
            #当来源类型为1时，开窗为agli041的开窗查询代码值，为2时，开q_glaf002,为3时不给开窗
            LET g_glae002 = ''
            LET g_glae009 = ''
            SELECT glae002 INTO g_glae002 FROM glae_t
             WHERE glaeent = g_enterprise
               AND glae001 = g_glad0171
             IF g_glae002 = '1' THEN
                SELECT glae009 INTO g_glae009 FROM glae_t
                 WHERE glaeent = g_enterprise
                   AND glae001 = g_glad0171
             END IF 
             IF g_glae002 = '2' THEN
                LET g_glae009 = 'q_glaf002'
             END IF 
             
             IF g_glae002 = '3' THEN
                LET g_glae009 = ''
             END IF
            #171016-00011#3 -e 171017 add by 08172
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce042_desc
            
            #add-point:AFTER FIELD xrce042_desc name="input.a.page3.xrce042_desc"
            #171016-00011#3 -s 171017 add by 08172
            LET g_xrce3_d[l_ac].xrce042 = g_xrce3_d[l_ac].xrce042_desc
            DISPLAY '' TO xrce042_desc
            IF NOT cl_null(g_xrce3_d[l_ac].xrce042) THEN
               CALL axrt300_02_free_account_chk(g_glad0171,g_xrce3_d[l_ac].xrce042,g_glad0172) RETURNING l_errno
               IF NOT cl_null(l_errno) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = l_errno
                  LET g_errparam.extend = g_xrce3_d[l_ac].xrce042
                  CASE l_errno
                     WHEN 'sub-01302'
                        LET g_errparam.replace[1] = 'agli041'
                        LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
                        LET g_errparam.exeprog = 'agli041'
                  END CASE
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_xrce3_d[l_ac].xrce042 = g_xrce3_d_t.xrce042
                  LET g_xrce3_d[l_ac].xrce042_desc = g_xrce3_d_t.xrce042_desc
                  DISPLAY g_xrce3_d[l_ac].xrce042_desc TO s_detail3[l_ac].xrce042_desc
                  NEXT FIELD xrce042_desc
               END IF
            END IF
            CALL axrt300_02_free_account_desc(g_glad0171,g_xrce3_d[l_ac].xrce042) RETURNING g_xrce3_d[l_ac].xrce042_desc
            LET g_xrce3_d[l_ac].xrce042_desc = g_xrce3_d[l_ac].xrce042 CLIPPED ,g_xrce3_d[l_ac].xrce042_desc
            DISPLAY g_xrce3_d[l_ac].xrce042_desc TO s_detail3[l_ac].xrce042_desc
            #171016-00011#3 -e 171017 add by 08172
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce042_desc
            #add-point:ON CHANGE xrce042_desc name="input.g.page3.xrce042_desc"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce043
            #add-point:BEFORE FIELD xrce043 name="input.b.page3.xrce043"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce043
            
            #add-point:AFTER FIELD xrce043 name="input.a.page3.xrce043"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce043
            #add-point:ON CHANGE xrce043 name="input.g.page3.xrce043"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce043_desc
            #add-point:BEFORE FIELD xrce043_desc name="input.b.page3.xrce043_desc"
            #171016-00011#3 -s 171017 add by 08172
            LET g_xrce3_d[l_ac].xrce043_desc = g_xrce3_d[l_ac].xrce043
            #当来源类型为1时，开窗为agli041的开窗查询代码值，为2时，开q_glaf002,为3时不给开窗
            LET g_glae002 = ''
            LET g_glae009 = ''
            SELECT glae002 INTO g_glae002 FROM glae_t
             WHERE glaeent = g_enterprise
               AND glae001 = g_glad0181
             IF g_glae002 = '1' THEN
                SELECT glae009 INTO g_glae009 FROM glae_t
                 WHERE glaeent = g_enterprise
                   AND glae001 = g_glad0181
             END IF 
             IF g_glae002 = '2' THEN
                LET g_glae009 = 'q_glaf002'
             END IF 
             
             IF g_glae002 = '3' THEN
                LET g_glae009 = ''
             END IF
            #171016-00011#3 -e 171017 add by 08172
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce043_desc
            
            #add-point:AFTER FIELD xrce043_desc name="input.a.page3.xrce043_desc"
            #171016-00011#3 -s 171017 add by 08172
            LET g_xrce3_d[l_ac].xrce043 = g_xrce3_d[l_ac].xrce043_desc
            DISPLAY '' TO xrce043_desc
            IF NOT cl_null(g_xrce3_d[l_ac].xrce043) THEN
               CALL axrt300_02_free_account_chk(g_glad0181,g_xrce3_d[l_ac].xrce043,g_glad0182) RETURNING l_errno
               IF NOT cl_null(l_errno) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = l_errno
                  LET g_errparam.extend = g_xrce3_d[l_ac].xrce043
                  CASE l_errno
                     WHEN 'sub-01302'
                        LET g_errparam.replace[1] = 'agli041'
                        LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
                        LET g_errparam.exeprog = 'agli041'
                  END CASE
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_xrce3_d[l_ac].xrce043 = g_xrce3_d_t.xrce043
                  LET g_xrce3_d[l_ac].xrce043_desc = g_xrce3_d_t.xrce043_desc
                  DISPLAY g_xrce3_d[l_ac].xrce043_desc TO s_detail3[l_ac].xrce043_desc
                  NEXT FIELD xrce043_desc
               END IF
            END IF
            CALL axrt300_02_free_account_desc(g_glad0181,g_xrce3_d[l_ac].xrce043) RETURNING g_xrce3_d[l_ac].xrce043_desc
            LET g_xrce3_d[l_ac].xrce043_desc = g_xrce3_d[l_ac].xrce043 CLIPPED ,g_xrce3_d[l_ac].xrce043_desc
            DISPLAY g_xrce3_d[l_ac].xrce043_desc TO s_detail3[l_ac].xrce043_desc
            #171016-00011#3 -e 171017 add by 08172
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce043_desc
            #add-point:ON CHANGE xrce043_desc name="input.g.page3.xrce043_desc"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce044
            #add-point:BEFORE FIELD xrce044 name="input.b.page3.xrce044"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce044
            
            #add-point:AFTER FIELD xrce044 name="input.a.page3.xrce044"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce044
            #add-point:ON CHANGE xrce044 name="input.g.page3.xrce044"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce044_desc
            #add-point:BEFORE FIELD xrce044_desc name="input.b.page3.xrce044_desc"
            #171016-00011#3 -s 171017 add by 08172
            LET g_xrce3_d[l_ac].xrce044_desc = g_xrce3_d[l_ac].xrce044
            #当来源类型为1时，开窗为agli041的开窗查询代码值，为2时，开q_glaf002,为3时不给开窗
            LET g_glae002 = ''
            LET g_glae009 = ''
            SELECT glae002 INTO g_glae002 FROM glae_t
             WHERE glaeent = g_enterprise
               AND glae001 = g_glad0191
             IF g_glae002 = '1' THEN
                SELECT glae009 INTO g_glae009 FROM glae_t
                 WHERE glaeent = g_enterprise
                   AND glae001 = g_glad0191
             END IF 
             IF g_glae002 = '2' THEN
                LET g_glae009 = 'q_glaf002'
             END IF 
             
             IF g_glae002 = '3' THEN
                LET g_glae009 = ''
             END IF
            #171016-00011#3 -e 171017 add by 08172
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce044_desc
            
            #add-point:AFTER FIELD xrce044_desc name="input.a.page3.xrce044_desc"
            #171016-00011#3 -s 171017 add by 08172
            LET g_xrce3_d[l_ac].xrce044 = g_xrce3_d[l_ac].xrce044_desc
            DISPLAY '' TO xrce044_desc
            IF NOT cl_null(g_xrce3_d[l_ac].xrce044) THEN
               CALL axrt300_02_free_account_chk(g_glad0191,g_xrce3_d[l_ac].xrce044,g_glad0192) RETURNING l_errno
               IF NOT cl_null(l_errno) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = l_errno
                  LET g_errparam.extend = g_xrce3_d[l_ac].xrce044
                  CASE l_errno
                     WHEN 'sub-01302'
                        LET g_errparam.replace[1] = 'agli041'
                        LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
                        LET g_errparam.exeprog = 'agli041'
                  END CASE
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_xrce3_d[l_ac].xrce044 = g_xrce3_d_t.xrce044
                  LET g_xrce3_d[l_ac].xrce044_desc = g_xrce3_d_t.xrce044_desc
                  DISPLAY g_xrce3_d[l_ac].xrce044_desc TO s_detail3[l_ac].xrce044_desc
                  NEXT FIELD xrce044_desc
               END IF
            END IF
            CALL axrt300_02_free_account_desc(g_glad0191,g_xrce3_d[l_ac].xrce044) RETURNING g_xrce3_d[l_ac].xrce044_desc
            LET g_xrce3_d[l_ac].xrce044_desc = g_xrce3_d[l_ac].xrce044 CLIPPED ,g_xrce3_d[l_ac].xrce044_desc
            DISPLAY g_xrce3_d[l_ac].xrce044_desc TO s_detail3[l_ac].xrce044_desc
            #171016-00011#3 -e 171017 add by 08172
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce044_desc
            #add-point:ON CHANGE xrce044_desc name="input.g.page3.xrce044_desc"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce045
            #add-point:BEFORE FIELD xrce045 name="input.b.page3.xrce045"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce045
            
            #add-point:AFTER FIELD xrce045 name="input.a.page3.xrce045"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce045
            #add-point:ON CHANGE xrce045 name="input.g.page3.xrce045"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce045_desc
            #add-point:BEFORE FIELD xrce045_desc name="input.b.page3.xrce045_desc"
            #171016-00011#3 -s 171017 add by 08172
            LET g_xrce3_d[l_ac].xrce045_desc = g_xrce3_d[l_ac].xrce045
            #当来源类型为1时，开窗为agli041的开窗查询代码值，为2时，开q_glaf002,为3时不给开窗
            LET g_glae002 = ''
            LET g_glae009 = ''
            SELECT glae002 INTO g_glae002 FROM glae_t
             WHERE glaeent = g_enterprise
               AND glae001 = g_glad0201
             IF g_glae002 = '1' THEN
                SELECT glae009 INTO g_glae009 FROM glae_t
                 WHERE glaeent = g_enterprise
                   AND glae001 = g_glad0201
             END IF 
             IF g_glae002 = '2' THEN
                LET g_glae009 = 'q_glaf002'
             END IF 
             
             IF g_glae002 = '3' THEN
                LET g_glae009 = ''
             END IF
            #171016-00011#3 -e 171017 add by 08172
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce045_desc
            
            #add-point:AFTER FIELD xrce045_desc name="input.a.page3.xrce045_desc"
            #171016-00011#3 -s 171017 add by 08172
            LET g_xrce3_d[l_ac].xrce045 = g_xrce3_d[l_ac].xrce045_desc
            DISPLAY '' TO xrce045_desc
            IF NOT cl_null(g_xrce3_d[l_ac].xrce045) THEN
               CALL axrt300_02_free_account_chk(g_glad0201,g_xrce3_d[l_ac].xrce045,g_glad0202) RETURNING l_errno
               IF NOT cl_null(l_errno) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = l_errno
                  LET g_errparam.extend = g_xrce3_d[l_ac].xrce045
                  CASE l_errno
                     WHEN 'sub-01302'
                        LET g_errparam.replace[1] = 'agli041'
                        LET g_errparam.replace[2] = cl_get_progname('agli041',g_lang,"2")
                        LET g_errparam.exeprog = 'agli041'
                  END CASE
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_xrce3_d[l_ac].xrce045 = g_xrce3_d_t.xrce045
                  LET g_xrce3_d[l_ac].xrce045_desc = g_xrce3_d_t.xrce045_desc
                  DISPLAY g_xrce3_d[l_ac].xrce045_desc TO s_detail3[l_ac].xrce045_desc
                  NEXT FIELD xrce045_desc
               END IF
            END IF
            CALL axrt300_02_free_account_desc(g_glad0201,g_xrce3_d[l_ac].xrce045) RETURNING g_xrce3_d[l_ac].xrce045_desc
            LET g_xrce3_d[l_ac].xrce045_desc = g_xrce3_d[l_ac].xrce045 CLIPPED ,g_xrce3_d[l_ac].xrce045_desc
            DISPLAY g_xrce3_d[l_ac].xrce045_desc TO s_detail3[l_ac].xrce045_desc
            #171016-00011#3 -e 171017 add by 08172
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce045_desc
            #add-point:ON CHANGE xrce045_desc name="input.g.page3.xrce045_desc"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce046
            #add-point:BEFORE FIELD xrce046 name="input.b.page3.xrce046"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce046
            
            #add-point:AFTER FIELD xrce046 name="input.a.page3.xrce046"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce046
            #add-point:ON CHANGE xrce046 name="input.g.page3.xrce046"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce046_desc
            #add-point:BEFORE FIELD xrce046_desc name="input.b.page3.xrce046_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce046_desc
            
            #add-point:AFTER FIELD xrce046_desc name="input.a.page3.xrce046_desc"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce046_desc
            #add-point:ON CHANGE xrce046_desc name="input.g.page3.xrce046_desc"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce047
            #add-point:BEFORE FIELD xrce047 name="input.b.page3.xrce047"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce047
            
            #add-point:AFTER FIELD xrce047 name="input.a.page3.xrce047"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce047
            #add-point:ON CHANGE xrce047 name="input.g.page3.xrce047"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce047_desc
            #add-point:BEFORE FIELD xrce047_desc name="input.b.page3.xrce047_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce047_desc
            
            #add-point:AFTER FIELD xrce047_desc name="input.a.page3.xrce047_desc"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce047_desc
            #add-point:ON CHANGE xrce047_desc name="input.g.page3.xrce047_desc"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce048
            #add-point:BEFORE FIELD xrce048 name="input.b.page3.xrce048"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce048
            
            #add-point:AFTER FIELD xrce048 name="input.a.page3.xrce048"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce048
            #add-point:ON CHANGE xrce048 name="input.g.page3.xrce048"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce048_desc
            #add-point:BEFORE FIELD xrce048_desc name="input.b.page3.xrce048_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce048_desc
            
            #add-point:AFTER FIELD xrce048_desc name="input.a.page3.xrce048_desc"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce048_desc
            #add-point:ON CHANGE xrce048_desc name="input.g.page3.xrce048_desc"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce049
            #add-point:BEFORE FIELD xrce049 name="input.b.page3.xrce049"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce049
            
            #add-point:AFTER FIELD xrce049 name="input.a.page3.xrce049"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce049
            #add-point:ON CHANGE xrce049 name="input.g.page3.xrce049"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce049_desc
            #add-point:BEFORE FIELD xrce049_desc name="input.b.page3.xrce049_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce049_desc
            
            #add-point:AFTER FIELD xrce049_desc name="input.a.page3.xrce049_desc"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce049_desc
            #add-point:ON CHANGE xrce049_desc name="input.g.page3.xrce049_desc"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce050
            #add-point:BEFORE FIELD xrce050 name="input.b.page3.xrce050"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce050
            
            #add-point:AFTER FIELD xrce050 name="input.a.page3.xrce050"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce050
            #add-point:ON CHANGE xrce050 name="input.g.page3.xrce050"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce050_desc
            #add-point:BEFORE FIELD xrce050_desc name="input.b.page3.xrce050_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce050_desc
            
            #add-point:AFTER FIELD xrce050_desc name="input.a.page3.xrce050_desc"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce050_desc
            #add-point:ON CHANGE xrce050_desc name="input.g.page3.xrce050_desc"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce051
            #add-point:BEFORE FIELD xrce051 name="input.b.page3.xrce051"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce051
            
            #add-point:AFTER FIELD xrce051 name="input.a.page3.xrce051"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce051
            #add-point:ON CHANGE xrce051 name="input.g.page3.xrce051"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrce051_desc
            #add-point:BEFORE FIELD xrce051_desc name="input.b.page3.xrce051_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrce051_desc
            
            #add-point:AFTER FIELD xrce051_desc name="input.a.page3.xrce051_desc"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrce051_desc
            #add-point:ON CHANGE xrce051_desc name="input.g.page3.xrce051_desc"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page3.xrce001_u
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce001_u
            #add-point:ON ACTION controlp INFIELD xrce001_u name="input.c.page3.xrce001_u"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrcedocno_u
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcedocno_u
            #add-point:ON ACTION controlp INFIELD xrcedocno_u name="input.c.page3.xrcedocno_u"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrceld_u
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrceld_u
            #add-point:ON ACTION controlp INFIELD xrceld_u name="input.c.page3.xrceld_u"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrcesite_u
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcesite_u
            #add-point:ON ACTION controlp INFIELD xrcesite_u name="input.c.page3.xrcesite_u"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrceseq_u
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrceseq_u
            #add-point:ON ACTION controlp INFIELD xrceseq_u name="input.c.page3.xrceseq_u"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce002_u
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce002_u
            #add-point:ON ACTION controlp INFIELD xrce002_u name="input.c.page3.xrce002_u"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce003_u
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce003_u
            #add-point:ON ACTION controlp INFIELD xrce003_u name="input.c.page3.xrce003_u"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce004_u
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce004_u
            #add-point:ON ACTION controlp INFIELD xrce004_u name="input.c.page3.xrce004_u"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce005_u
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce005_u
            #add-point:ON ACTION controlp INFIELD xrce005_u name="input.c.page3.xrce005_u"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce008_u
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce008_u
            #add-point:ON ACTION controlp INFIELD xrce008_u name="input.c.page3.xrce008_u"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce100_u
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce100_u
            #add-point:ON ACTION controlp INFIELD xrce100_u name="input.c.page3.xrce100_u"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce109_u
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce109_u
            #add-point:ON ACTION controlp INFIELD xrce109_u name="input.c.page3.xrce109_u"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce101_u
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce101_u
            #add-point:ON ACTION controlp INFIELD xrce101_u name="input.c.page3.xrce101_u"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce119_u
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce119_u
            #add-point:ON ACTION controlp INFIELD xrce119_u name="input.c.page3.xrce119_u"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce027_u
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce027_u
            #add-point:ON ACTION controlp INFIELD xrce027_u name="input.c.page3.xrce027_u"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce010_u
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce010_u
            #add-point:ON ACTION controlp INFIELD xrce010_u name="input.c.page3.xrce010_u"
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_xrce3_d[l_ac].xrce010             #給予default值

            #給予arg

            CALL q_oocq002_2()                                #呼叫開窗

            LET g_xrce3_d[l_ac].xrce010 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_xrce3_d[l_ac].xrce010 TO xrce010_u              #顯示到畫面上

            NEXT FIELD xrce010_u                          #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce016_u
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce016_u
            #add-point:ON ACTION controlp INFIELD xrce016_u name="input.c.page3.xrce016_u"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_xrce3_d[l_ac].xrce016             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #


            CALL aglt310_04()                                #呼叫開窗

            LET g_xrce3_d[l_ac].xrce016 = g_qryparam.return1              

            DISPLAY g_xrce3_d[l_ac].xrce016 TO xrce016_u              #

            NEXT FIELD xrce016_u                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce016_u_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce016_u_desc
            #add-point:ON ACTION controlp INFIELD xrce016_u_desc name="input.c.page3.xrce016_u_desc"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce017
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce017
            #add-point:ON ACTION controlp INFIELD xrce017 name="input.c.page3.xrce017"
#此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_xrce3_d[l_ac].xrce017             #給予default值

            #給予arg

            CALL q_ooag001()                                #呼叫開窗

            LET g_xrce3_d[l_ac].xrce017 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_xrce3_d[l_ac].xrce017 TO xrce017              #顯示到畫面上
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_xrce3_d[l_ac].xrce017
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_xrce3_d[l_ac].xrce017_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_xrce3_d[l_ac].xrce017_desc
            
            NEXT FIELD xrce017                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce018_u
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce018_u
            #add-point:ON ACTION controlp INFIELD xrce018_u name="input.c.page3.xrce018_u"
            #此段落由子樣板a07產生            
            #開窗i段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_xrce3_d[l_ac].xrce018             #給予default值
            LET g_qryparam.arg1  = g_xrca_t.xrcadocdt   #160331-00012#1 add 
            #給予arg

#            CALL q_ooeg001_1()           #160331-00012#1 mrak                      #呼叫開窗
             #CALL q_ooeg001_4()           #160331-00012#1 add    #170814-00012#42 170915 mark by 10043 
             CALL q_ooeg001()                                     #170814-00012#42 170915  add by 10043

            LET g_xrce3_d[l_ac].xrce018 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_xrce3_d[l_ac].xrce018 TO xrce018_u              #顯示到畫面上

            NEXT FIELD xrce018_u                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce019
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce019
            #add-point:ON ACTION controlp INFIELD xrce019 name="input.c.page3.xrce019"
#此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_xrce3_d[l_ac].xrce019             #給予default值

            #給予arg
            #161026-00013#2 --s add
            LET g_qryparam.arg1  = g_xrca_t.xrcadocdt
            LET g_qryparam.where = " ooeg003 IN ('1','2','3') "         
            #CALL q_ooeg001_4()                         #呼叫開窗   #170814-00012#42 170915 mark by 10043 
            CALL q_ooeg001()                                       #170814-00012#42 170915  add by 10043     
            #161026-00013#2 --e add
            #CALL q_ooeg001_1()                                #呼叫開窗 #161026-00013#2 mark

            LET g_xrce3_d[l_ac].xrce019 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_xrce3_d[l_ac].xrce019 TO xrce019              #顯示到畫面上
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_xrce3_d[l_ac].xrce019
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_lang||"'","") RETURNING g_rtn_fields
            LET g_xrce3_d[l_ac].xrce019_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_xrce3_d[l_ac].xrce019_desc
            
            NEXT FIELD xrce019                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce020
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce020
            #add-point:ON ACTION controlp INFIELD xrce020 name="input.c.page3.xrce020"
#此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_xrce3_d[l_ac].xrce020             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            CALL q_rtax001_1()                                #呼叫開窗

            LET g_xrce3_d[l_ac].xrce020 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_xrce3_d[l_ac].xrce020 TO xrce020              #顯示到畫面上
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_xrce3_d[l_ac].xrce020
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='200' AND oocql002=? AND oocql003='"||g_lang||"'","") RETURNING g_rtn_fields
            LET g_xrce3_d[l_ac].xrce020_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_xrce3_d[l_ac].xrce020_desc
      
            NEXT FIELD xrce020                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce022
            #add-point:ON ACTION controlp INFIELD xrce022 name="input.c.page3.xrce022"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce023
            #add-point:ON ACTION controlp INFIELD xrce023 name="input.c.page3.xrce023"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce040
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce040
            #add-point:ON ACTION controlp INFIELD xrce040 name="input.c.page3.xrce040"
#170621-00032#1-----s
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_xrce3_d[l_ac].xrce040
            LET g_qryparam.where = " oojdstus='Y' "
            CALL q_oojd001_2()
            LET g_xrce3_d[l_ac].xrce040        = g_qryparam.return1
            LET g_xrce3_d[l_ac].l_xrce040_desc = s_desc_get_oojdl003_desc(g_xrce3_d[l_ac].xrce040)
            DISPLAY BY NAME g_xrce3_d[l_ac].xrce040
            NEXT FIELD xrce040
#170621-00032#1-----e
            #END add-point
 
 
         #Ctrlp:input.c.page3.l_xrce040_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_xrce040_desc
            #add-point:ON ACTION controlp INFIELD l_xrce040_desc name="input.c.page3.l_xrce040_desc"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce035
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce035
            #add-point:ON ACTION controlp INFIELD xrce035 name="input.c.page3.xrce035"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce035_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce035_desc
            #add-point:ON ACTION controlp INFIELD xrce035_desc name="input.c.page3.xrce035_desc"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce036
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce036
            #add-point:ON ACTION controlp INFIELD xrce036 name="input.c.page3.xrce036"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce036_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce036_desc
            #add-point:ON ACTION controlp INFIELD xrce036_desc name="input.c.page3.xrce036_desc"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce038
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce038
            #add-point:ON ACTION controlp INFIELD xrce038 name="input.c.page3.xrce038"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce039
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce039
            #add-point:ON ACTION controlp INFIELD xrce039 name="input.c.page3.xrce039"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce041
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce041
            #add-point:ON ACTION controlp INFIELD xrce041 name="input.c.page3.xrce041"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce041_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce041_desc
            #add-point:ON ACTION controlp INFIELD xrce041_desc name="input.c.page3.xrce041_desc"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce042
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce042
            #add-point:ON ACTION controlp INFIELD xrce042 name="input.c.page3.xrce042"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce042_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce042_desc
            #add-point:ON ACTION controlp INFIELD xrce042_desc name="input.c.page3.xrce042_desc"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce043
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce043
            #add-point:ON ACTION controlp INFIELD xrce043 name="input.c.page3.xrce043"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce043_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce043_desc
            #add-point:ON ACTION controlp INFIELD xrce043_desc name="input.c.page3.xrce043_desc"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce044
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce044
            #add-point:ON ACTION controlp INFIELD xrce044 name="input.c.page3.xrce044"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce044_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce044_desc
            #add-point:ON ACTION controlp INFIELD xrce044_desc name="input.c.page3.xrce044_desc"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce045
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce045
            #add-point:ON ACTION controlp INFIELD xrce045 name="input.c.page3.xrce045"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce045_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce045_desc
            #add-point:ON ACTION controlp INFIELD xrce045_desc name="input.c.page3.xrce045_desc"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce046
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce046
            #add-point:ON ACTION controlp INFIELD xrce046 name="input.c.page3.xrce046"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce046_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce046_desc
            #add-point:ON ACTION controlp INFIELD xrce046_desc name="input.c.page3.xrce046_desc"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce047
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce047
            #add-point:ON ACTION controlp INFIELD xrce047 name="input.c.page3.xrce047"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce047_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce047_desc
            #add-point:ON ACTION controlp INFIELD xrce047_desc name="input.c.page3.xrce047_desc"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce048
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce048
            #add-point:ON ACTION controlp INFIELD xrce048 name="input.c.page3.xrce048"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce048_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce048_desc
            #add-point:ON ACTION controlp INFIELD xrce048_desc name="input.c.page3.xrce048_desc"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce049
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce049
            #add-point:ON ACTION controlp INFIELD xrce049 name="input.c.page3.xrce049"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce049_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce049_desc
            #add-point:ON ACTION controlp INFIELD xrce049_desc name="input.c.page3.xrce049_desc"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce050
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce050
            #add-point:ON ACTION controlp INFIELD xrce050 name="input.c.page3.xrce050"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce050_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce050_desc
            #add-point:ON ACTION controlp INFIELD xrce050_desc name="input.c.page3.xrce050_desc"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce051
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce051
            #add-point:ON ACTION controlp INFIELD xrce051 name="input.c.page3.xrce051"
            
            #END add-point
 
 
         #Ctrlp:input.c.page3.xrce051_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrce051_desc
            #add-point:ON ACTION controlp INFIELD xrce051_desc name="input.c.page3.xrce051_desc"
            
            #END add-point
 
 
 
 
         AFTER ROW
            LET l_ac = ARR_CURR()
            LET l_ac_t = l_ac
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CALL cl_err()
               LET INT_FLAG = 0
               IF l_cmd = 'u' THEN
                  LET g_xrce3_d[l_ac].* = g_xrce3_d_t.*
               END IF
               CLOSE axrt300_02_bcl
               #add-point:單身after row name="input.body3.a_close"
              #CLOSE axrt300_02_bcl1   #160420-00001#1 Mark
               #end add-point
               EXIT DIALOG   #(ver:44)
            END IF
            
            #其他table進行unlock
            
 
            CALL axrt300_02_unlock_b("xrce_t")
            #add-point:單身after row name="input.body3.a_row"
            
            #end add-point
            
         AFTER INPUT
            #add-point:單身3input後 name="input.body3.a_input"
            
            #end add-point
         
         #複製上一次指定的單身資料至最下方
         ON ACTION controlo   
            IF l_insert THEN
               #170920-00028 ---modify start---
               #新增判斷是否有上一筆資料可供複製
               IF l_ac_t <= 0 OR l_ac_t IS NULL THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = ""
                  LET g_errparam.code   = "adz-01032"
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
               ELSE
                  LET li_reproduce = l_ac_t
                  LET li_reproduce_target = l_ac
                  LET g_xrce_d[li_reproduce_target].* = g_xrce_d[li_reproduce].*
               LET g_xrce2_d[li_reproduce_target].* = g_xrce2_d[li_reproduce].*
               LET g_xrce3_d[li_reproduce_target].* = g_xrce3_d[li_reproduce].*
 
                  LET g_xrce3_d[li_reproduce_target].xrceld = NULL
                  LET g_xrce3_d[li_reproduce_target].xrcedocno = NULL
                  LET g_xrce3_d[li_reproduce_target].xrceseq = NULL
               END IF
               #170920-00028 --- modify end ---
            ELSE
               CALL FGL_SET_ARR_CURR(g_xrce3_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_xrce3_d.getLength()+1
            END IF
            #(ver:43) ---start---
            #add-point:單身3複製後 name="input.body3.controlo"
            
            #end add-point
            #(ver:43) --- end ---
      END INPUT
 
      
 
      
      #add-point:before_more_input name="input.more_input"
      
      #end add-point
      
      BEFORE DIALOG
         #CALL cl_err_collect_init()      
         IF g_temp_idx > 0 THEN
            LET l_ac = g_temp_idx
            CALL DIALOG.setCurrentRow("s_detail1",l_ac)
            LET g_temp_idx = 1
         END IF
         #LET g_curr_diag = ui.DIALOG.getCurrent()
         #add-point:before_dialog name="input.before_dialog"
         
         #end add-point
         CASE g_aw
            WHEN "s_detail1"
               NEXT FIELD xrce001 #170906-00011#1
            WHEN "s_detail2"
               NEXT FIELD xrce001 #170906-00011#1
            WHEN "s_detail3"
               NEXT FIELD xrce001 #170906-00011#1
 
         END CASE
   
      ON ACTION accept
         ACCEPT DIALOG
      
      ON ACTION cancel
         LET INT_FLAG = TRUE 
         #(ver:45) ---start---
         #add-point:modify段cancel name="query.cancel"
         
         #end add-point
         #(ver:45) --- end ---
      #  CANCEL DIALOG   #(ver:44) mark
         EXIT DIALOG   #(ver:44)
 
      ON ACTION controlr
         CALL cl_show_req_fields()
 
      ON ACTION controlf
         CALL cl_set_focus_form(ui.Interface.getRootNode()) 
              RETURNING g_fld_name,g_frm_name 
         CALL cl_fldhelp(g_frm_name,g_fld_name,g_lang) 
           
      #交談指令共用ACTION
      &include "common_action.4gl"
         CONTINUE DIALOG
   
   END DIALOG 
    
   #新增後取消
   IF l_cmd = 'a' THEN
      #當取消或無輸入資料按確定時刪除對應資料
      IF INT_FLAG OR cl_null(g_xrce_d[g_detail_idx].xrceld) THEN
         CALL g_xrce_d.deleteElement(g_detail_idx)
         CALL g_xrce2_d.deleteElement(g_detail_idx)
         CALL g_xrce3_d.deleteElement(g_detail_idx)
 
         CALL axrt300_02_idx_chk()   #(ver:42)
      END IF
   END IF
   
   #修改後取消
   IF l_cmd = 'u' AND INT_FLAG THEN
      LET g_xrce_d[g_detail_idx].* = g_xrce_d_t.*
   END IF
   
   #add-point:modify段修改後 name="modify.after_input"
   IF l_flag = 'Y' THEN
      CONTINUE WHILE
   ELSE
      EXIT WHILE
   END IF
   END WHILE
  #CLOSE axrt300_02_bcl1   #160420-00001#1 Mark
   
   CALL axrt300_02_ref_amt()
  #SELECT COUNT(*) INTO l_cnt 
  #  FROM xrde_t
  # WHERE xrdeent = g_enterprise
  #   AND xrdedocno = g_xrca_t.xrcadocno
  #   AND xrdeld = g_xrca_t.xrcald
  #   AND xrde002 = '10'
  #   
  #IF l_cnt = 1 THEN
     #160420-00001#1 Mark ---(S)---
     #SELECT DISTINCT xrde100 INTO l_xrde100
     #  FROM xrde_t
     # WHERE xrdeent = g_enterprise
     #   AND xrdedocno = g_xrca_t.xrcadocno
     #   AND xrdeld = g_xrca_t.xrcald
     #   AND xrde002 = '10'  
     #   
     #IF g_amt_9 > g_amt_1 THEN 
     #   INITIALIZE g_errparam TO NULL 
     #   LET g_errparam.extend = '' 
     #   LET g_errparam.code   = 'axr-00248' 
     #   LET g_errparam.popup  = TRUE 
     #   CALL cl_err()
     #   
     #   RETURN
     #END IF
     #
     #IF g_xrca_t.xrca100 <> g_glaa_t.glaa001 AND l_xrde100 = g_xrca_t.xrca100 AND g_amt_1 = g_amt1 AND g_amt <> 0  THEN 
     #   IF g_amt > 0 THEN 
     #      CALL axrt400_09('1',g_xrca_t.xrcasite,g_xrca_t.xrcacomp,g_xrca_t.xrca003,g_xrca_t.xrca004,g_xrca_t.xrcadocno,g_xrca_t.xrcadocdt,g_xrca_t.xrcald,g_amt)
     #   ELSE
     #      CALL axrt400_09('2',g_xrca_t.xrcasite,g_xrca_t.xrcacomp,g_xrca_t.xrca003,g_xrca_t.xrca004,g_xrca_t.xrcadocno,g_xrca_t.xrcadocdt,g_xrca_t.xrcald,g_amt)
     #   END IF
     #END IF
     #160420-00001#1 Mark ---(E)---
      CALL axrt300_02_b_fill(g_wc2)
      CALL axrt300_02_ref_amt()
  #END IF
   #end add-point
 
   CLOSE axrt300_02_bcl
   
END FUNCTION
 
{</section>}
 
{<section id="axrt300_02.delete" >}
#+ 資料刪除
PRIVATE FUNCTION axrt300_02_delete()
   #add-point:delete段define(客製用) name="delete.define_customerization"
   
   #end add-point
   DEFINE li_idx          LIKE type_t.num10
   DEFINE li_ac_t         LIKE type_t.num10
   DEFINE li_detail_tmp   LIKE type_t.num10
   DEFINE l_var_keys      DYNAMIC ARRAY OF STRING
   DEFINE l_var_keys_bak  DYNAMIC ARRAY OF STRING
   DEFINE l_field_keys    DYNAMIC ARRAY OF STRING
   DEFINE l_vars          DYNAMIC ARRAY OF STRING
   DEFINE l_fields        DYNAMIC ARRAY OF STRING
   #add-point:delete段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete.define"
   DEFINE l_gzcb004       LIKE gzcb_t.gzcb004
   #end add-point 
   
   #add-point:Function前置處理  name="delete.body.before_delete"
 
   #end add-point
   
   LET g_curr_diag = ui.DIALOG.getCurrent() #(ver:45)
 
   CALL s_transaction_begin()
   
   LET li_ac_t = l_ac
   
   LET li_detail_tmp = g_detail_idx
    
   #lock所有所選資料
   FOR li_idx = 1 TO g_xrce_d.getLength()
      LET g_detail_idx = li_idx
      #已選擇的資料
      IF g_curr_diag.isRowSelected(g_curr_diag.getCurrentItem(), li_idx) THEN 
         #確定是否有被鎖定
         IF NOT axrt300_02_lock_b("xrce_t") THEN
            #已被他人鎖定
            RETURN
         END IF
 
         #(ver:35) ---add start---
         #確定是否有刪除的權限
         #先確定該table有ownid
      #  IF cl_getField("xrce_t","") THEN   #171006-00020 mark
         IF cl_getField("xrce_t","") THEN   #171006-00020 modify
            IF NOT cl_auth_chk_act_permission("delete") THEN
               #有目前權限無法刪除的資料
               RETURN
            END IF
         END IF
         #(ver:35) --- add end ---
      END IF
   END FOR
   
   #add-point:單身刪除詢問前 name="delete.body.b_delete_ask"
   
   #end add-point  
   
   #詢問是否確定刪除所選資料
   IF NOT cl_ask_del_detail() THEN
      RETURN
   END IF
   
   FOR li_idx = 1 TO g_xrce_d.getLength()
      IF g_xrce_d[li_idx].xrceld IS NOT NULL
         AND g_xrce_d[li_idx].xrcedocno IS NOT NULL
         AND g_xrce_d[li_idx].xrceseq IS NOT NULL
 
         AND g_curr_diag.isRowSelected(g_curr_diag.getCurrentItem(), li_idx) THEN 
         
         #add-point:單身刪除前 name="delete.body.b_delete"
        #160420-00001#1 Mark ---(S)---
        #SELECT gzcb004 INTO l_gzcb004
        #  FROM gzcb_t
        # WHERE gzcb001 = '8306'
        #   AND gzcb002 = g_xrce_d[li_idx].xrce002
        #IF l_gzcb004 = '2' THEN
        #160420-00001#1 Mark ---(E)---
         #end add-point   
         
         DELETE FROM xrce_t
          WHERE xrceent = g_enterprise AND 
                xrceld = g_xrce_d[li_idx].xrceld
                AND xrcedocno = g_xrce_d[li_idx].xrcedocno
                AND xrceseq = g_xrce_d[li_idx].xrceseq
 
         #add-point:單身刪除中 name="delete.body.m_delete"
        #160420-00001#1 Mark ---(S)---
        #ELSE
        #   DELETE FROM xrde_t
        #    WHERE xrdeent = g_enterprise 
        #      AND xrdeld = g_xrce_d[li_idx].xrceld
        #      AND xrdedocno = g_xrce_d[li_idx].xrcedocno
        #      AND xrdeseq = g_xrce_d[li_idx].xrceseq
        #END IF
        #160420-00001#1 Mark ---(E)---
         #end add-point  
                
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "xrce_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            RETURN
         ELSE 
            #(ver:41) ---start---
            #修改歷程記錄(刪除)
            LET g_log1 = util.JSON.stringify(g_xrce_d[li_idx])
            IF NOT cl_log_modified_record(g_log1,'') THEN
               CALL s_transaction_end('N','0')
               RETURN
            END IF
            #(ver:41) --- end ---
 
            LET g_detail_cnt = g_detail_cnt-1
            LET l_ac = li_idx
            
 
 
 
            
 
 
 
            
 
 
 
 
            
 
 
 
            
 
 
   #161130-00056
            
 
 
 
            
 
 
   #161130-00056
            
 
 
 
            
 
 
   #161130-00056
 
            #add-point:單身同步刪除前(同層table) name="delete.body.a_delete"
            
            #end add-point
            LET g_detail_idx = li_idx
                           INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_xrce_d_t.xrceld
               LET gs_keys[2] = g_xrce_d_t.xrcedocno
               LET gs_keys[3] = g_xrce_d_t.xrceseq
 
            #add-point:單身同步刪除中(同層table) name="delete.body.a_delete2"
            
            #end add-point
                           CALL axrt300_02_delete_b('xrce_t',gs_keys,"'1'")
            #add-point:單身同步刪除後(同層table) name="delete.body.a_delete3"
            
            #end add-point
            #刪除相關文件
            #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL axrt300_02_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove.func"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
 
            
         END IF 
      END IF 
    
   END FOR
   
   LET g_detail_idx = li_detail_tmp
            
   #add-point:單身刪除後 name="delete.after"
   
   #end add-point  
   
   LET l_ac = li_ac_t
   
   #刷新資料
   CALL axrt300_02_b_fill(g_wc2)
            
END FUNCTION
 
{</section>}
 
{<section id="axrt300_02.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION axrt300_02_b_fill(p_wc2)              #BODY FILL UP
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point
   DEFINE p_wc2            STRING
   DEFINE ls_owndept_list  STRING  #(ver:35) add
   DEFINE ls_ownuser_list  STRING  #(ver:35) add
   #add-point:b_fill段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   DEFINE l_gzcb004      LIKE gzcb_t.gzcb004
   DEFINE l_glaa004         LIKE glaa_t.glaa004
   DEFINE l_glaa005         LIKE glaa_t.glaa005
   #end add-point
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   IF cl_null(p_wc2) THEN
      LET p_wc2 = " 1=1"
   END IF
   
   #add-point:b_fill段sql之前 name="b_fill.sql_before"

   SELECT glaa004,glaa005 INTO l_glaa004,l_glaa005 FROM glaa_t
    WHERE glaaent = g_enterprise AND glaald  = g_xrca_t.xrcald

   #end add-point
 
   LET g_sql = "SELECT  DISTINCT t0.xrce001,t0.xrcedocno,t0.xrceld,t0.xrcesite,t0.xrceseq,t0.xrce002, 
       t0.xrce003,t0.xrce004,t0.xrce005,t0.xrce024,t0.xrce025,t0.xrce008,t0.xrce015,t0.xrce100,t0.xrce101, 
       t0.xrce103,t0.xrce104,t0.xrce109,t0.xrce113,t0.xrce114,t0.xrce119,t0.xrce027,t0.xrce028,t0.xrcecomp, 
       t0.xrceorga,t0.xrce010,t0.xrce016,t0.xrce001,t0.xrcedocno,t0.xrceld,t0.xrcesite,t0.xrceseq,t0.xrce002, 
       t0.xrce003,t0.xrce004,t0.xrce008,t0.xrce100,t0.xrce103,t0.xrce104,t0.xrce109,t0.xrce101,t0.xrce113, 
       t0.xrce114,t0.xrce119,t0.xrce120,t0.xrce121,t0.xrce123,t0.xrce124,t0.xrce129,t0.xrce130,t0.xrce131, 
       t0.xrce133,t0.xrce134,t0.xrce139,t0.xrce001,t0.xrcedocno,t0.xrceld,t0.xrcesite,t0.xrceseq,t0.xrce002, 
       t0.xrce003,t0.xrce004,t0.xrce005,t0.xrce008,t0.xrce100,t0.xrce109,t0.xrce101,t0.xrce119,t0.xrce027, 
       t0.xrce010,t0.xrce016,t0.xrce017,t0.xrce018,t0.xrce019,t0.xrce020,t0.xrce022,t0.xrce023,t0.xrce040, 
       t0.xrce035,t0.xrce036,t0.xrce038,t0.xrce039,t0.xrce041,t0.xrce042,t0.xrce043,t0.xrce044,t0.xrce045, 
       t0.xrce046,t0.xrce047,t0.xrce048,t0.xrce049,t0.xrce050,t0.xrce051 ,t1.ooag011 ,t2.ooefl003 ,t3.ooefl003 , 
       t4.rtaxl003 FROM xrce_t t0",
               "",
                              " LEFT JOIN ooag_t t1 ON t1.ooagent="||g_enterprise||" AND t1.ooag001=t0.xrce017  ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.xrce018 AND t2.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t3 ON t3.ooeflent="||g_enterprise||" AND t3.ooefl001=t0.xrce019 AND t3.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN rtaxl_t t4 ON t4.rtaxlent="||g_enterprise||" AND t4.rtaxl001=t0.xrce020 AND t4.rtaxl002='"||g_dlang||"' ",
 
               " WHERE t0.xrceent= ?  AND  1=1 AND (", p_wc2, ") "
 
   #(ver:35) ---add start---
   
   #(ver:35) --- add end ---
 
   #add-point:b_fill段sql wc name="b_fill.sql_wc"
   
   #end add-point
   LET g_sql = g_sql, cl_sql_add_filter("xrce_t"),
                      " ORDER BY t0.xrceld,t0.xrcedocno,t0.xrceseq"
   
   #add-point:b_fill段sql之後 name="b_fill.sql_after"
  #160420-00001#1 Mark ---(S)---
  #LET g_sql = "SELECT  UNIQUE t0.xrce001,t0.xrcedocno,t0.xrceld,t0.xrcesite,t0.xrceseq,t0.xrce002,t0.xrce006,                ",
  #            "        t0.xrce003,t0.xrce004,t0.xrce005,t0.xrce024,t0.xrce025,t0.xrce008,t0.xrce015,t0.xrce100,t0.xrce101,   ",
  #            "        t0.xrce109,t0.xrce119,t0.xrce027,t0.xrce028,t0.xrce104,t0.xrce114,t0.xrce124,t0.xrce134,t0.xrcecomp,  ",
  #            "        t0.xrceorga,t0.xrce010,t0.xrce016,t0.xrce001,t0.xrcedocno,t0.xrceld,t0.xrcesite,t0.xrceseq,t0.xrce002,", 
  #            "        t0.xrce006,t0.xrce003,t0.xrce004,t0.xrce008,t0.xrce100,t0.xrce109,t0.xrce101,t0.xrce119,t0.xrce120,   ",
  #            "        t0.xrce121,t0.xrce129,t0.xrce130,t0.xrce131,t0.xrce139,t0.xrce001,t0.xrcedocno,t0.xrceld,t0.xrcesite, ",
  #            "        t0.xrceseq,t0.xrce002,t0.xrce006,t0.xrce003,t0.xrce004,t0.xrce005,t0.xrce008,t0.xrce100,t0.xrce109,   ",
  #            "        t0.xrce101,t0.xrce119,t0.xrce027,t0.xrce010,t0.xrce016,t0.xrce017,t0.xrce018,t0.xrce019,t0.xrce020,   ",
  #            "        t0.xrce022,t0.xrce023 ,t1.ooag011 ,t2.ooefl003 ,t3.ooefl003 ,t4.rtaxl003 FROM xrce_t t0",             
  #            " LEFT JOIN ooag_t t1 ON t1.ooagent='"||g_enterprise||"' AND t1.ooag001=t0.xrce017  ",
  #            " LEFT JOIN ooefl_t t2 ON t2.ooeflent='"||g_enterprise||"' AND t2.ooefl001=t0.xrce018 AND t2.ooefl002='"||g_dlang||"' ",
  #            " LEFT JOIN ooefl_t t3 ON t3.ooeflent='"||g_enterprise||"' AND t3.ooefl001=t0.xrce019 AND t3.ooefl002='"||g_dlang||"' ",
  #            " LEFT JOIN rtaxl_t t4 ON t4.rtaxlent='"||g_enterprise||"' AND t4.rtaxl001=t0.xrce020 AND t4.rtaxl002='"||g_dlang||"' ",
  #
  #            " WHERE t0.xrceent= ?  AND  1=1 AND (", p_wc2, ") " 
  #
  #LET p_wc2 = cl_replace_str(p_wc2,'xrcedocno','xrdedocno')
  #LET p_wc2 = cl_replace_str(p_wc2,'xrceld','xrdeld')
  #LET p_wc2 = cl_replace_str(p_wc2,'xrceseq','xrdeseq')
  #LET g_sql = g_sql," UNION ",
  #            "SELECT  UNIQUE t5.xrde001,t5.xrdedocno,t5.xrdeld,t5.xrdesite,t5.xrdeseq,t5.xrde002,t5.xrde006, 
  #             t5.xrde003,t5.xrde004,0,'',0,t5.xrde008,t5.xrde015,t5.xrde100,t5.xrde101,t5.xrde109, 
  #             t5.xrde119,'N',t5.xrde028,0,0,0, 
  #             0,t5.xrdecomp,t5.xrdeorga,t5.xrde010,t5.xrde016,t5.xrde001,t5.xrdedocno,t5.xrdeld,t5.xrdesite,t5.xrdeseq,t5.xrde002, 
  #             t5.xrde006,t5.xrde003,t5.xrde004,t5.xrde008,t5.xrde100,t5.xrde109,t5.xrde101,t5.xrde119,t5.xrde120, 
  #             t5.xrde121,t5.xrde129,t5.xrde130,t5.xrde131,t5.xrde139,t5.xrde001,t5.xrdedocno,t5.xrdeld,t5.xrdesite, 
  #             t5.xrdeseq,t5.xrde002,t5.xrde006,t5.xrde003,t5.xrde004,0,t5.xrde008,t5.xrde100,t5.xrde109, 
  #             t5.xrde101,t5.xrde119,'',t5.xrde010,t5.xrde016,t5.xrde017,t5.xrde018,t5.xrde019,t5.xrde020, 
  #             t5.xrde022,t5.xrde023,t6.ooag011 ,t7.ooefl003 ,t8.ooefl003 ,t9.rtaxl003 FROM xrde_t t5", 
  #            " LEFT JOIN ooag_t t6 ON t6.ooagent='"||g_enterprise||"' AND t6.ooag001=t5.xrde017  ",
  #            " LEFT JOIN ooefl_t t7 ON t7.ooeflent='"||g_enterprise||"' AND t7.ooefl001=t5.xrde018 AND t7.ooefl002='"||g_dlang||"' ",
  #            " LEFT JOIN ooefl_t t8 ON t8.ooeflent='"||g_enterprise||"' AND t8.ooefl001=t5.xrde019 AND t8.ooefl002='"||g_dlang||"' ",
  #            " LEFT JOIN rtaxl_t t9 ON t9.rtaxlent='"||g_enterprise||"' AND t9.rtaxl001=t5.xrde020 AND t9.rtaxl002='"||g_dlang||"' ",
  #
  #            " WHERE t5.xrdeent= '",g_enterprise,"' AND  1=1 AND (", p_wc2, ") " 
  #160420-00001#1 Mark ---(S)---
   #end add-point
   
   #LET g_sql = cl_sql_add_tabid(g_sql,"xrce_t")            #WC重組
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   PREPARE axrt300_02_pb FROM g_sql
   DECLARE b_fill_curs CURSOR FOR axrt300_02_pb
   
   OPEN b_fill_curs USING g_enterprise
 
   CALL g_xrce_d.clear()
   CALL g_xrce2_d.clear()   
   CALL g_xrce3_d.clear()   
 
 
   LET g_cnt = l_ac
   LET l_ac = 1   
#  ERROR "Searching!"    #(ver:38) mark
 
   FOREACH b_fill_curs INTO g_xrce_d[l_ac].xrce001,g_xrce_d[l_ac].xrcedocno,g_xrce_d[l_ac].xrceld,g_xrce_d[l_ac].xrcesite, 
       g_xrce_d[l_ac].xrceseq,g_xrce_d[l_ac].xrce002,g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce005, 
       g_xrce_d[l_ac].xrce024,g_xrce_d[l_ac].xrce025,g_xrce_d[l_ac].xrce008,g_xrce_d[l_ac].xrce015,g_xrce_d[l_ac].xrce100, 
       g_xrce_d[l_ac].xrce101,g_xrce_d[l_ac].xrce103,g_xrce_d[l_ac].xrce104,g_xrce_d[l_ac].xrce109,g_xrce_d[l_ac].xrce113, 
       g_xrce_d[l_ac].xrce114,g_xrce_d[l_ac].xrce119,g_xrce_d[l_ac].xrce027,g_xrce_d[l_ac].xrce028,g_xrce_d[l_ac].xrcecomp, 
       g_xrce_d[l_ac].xrceorga,g_xrce_d[l_ac].xrce010,g_xrce_d[l_ac].xrce016,g_xrce2_d[l_ac].xrce001, 
       g_xrce2_d[l_ac].xrcedocno,g_xrce2_d[l_ac].xrceld,g_xrce2_d[l_ac].xrcesite,g_xrce2_d[l_ac].xrceseq, 
       g_xrce2_d[l_ac].xrce002,g_xrce2_d[l_ac].xrce003,g_xrce2_d[l_ac].xrce004,g_xrce2_d[l_ac].xrce008, 
       g_xrce2_d[l_ac].xrce100,g_xrce2_d[l_ac].xrce103,g_xrce2_d[l_ac].xrce104,g_xrce2_d[l_ac].xrce109, 
       g_xrce2_d[l_ac].xrce101,g_xrce2_d[l_ac].xrce113,g_xrce2_d[l_ac].xrce114,g_xrce2_d[l_ac].xrce119, 
       g_xrce2_d[l_ac].xrce120,g_xrce2_d[l_ac].xrce121,g_xrce2_d[l_ac].xrce123,g_xrce2_d[l_ac].xrce124, 
       g_xrce2_d[l_ac].xrce129,g_xrce2_d[l_ac].xrce130,g_xrce2_d[l_ac].xrce131,g_xrce2_d[l_ac].xrce133, 
       g_xrce2_d[l_ac].xrce134,g_xrce2_d[l_ac].xrce139,g_xrce3_d[l_ac].xrce001,g_xrce3_d[l_ac].xrcedocno, 
       g_xrce3_d[l_ac].xrceld,g_xrce3_d[l_ac].xrcesite,g_xrce3_d[l_ac].xrceseq,g_xrce3_d[l_ac].xrce002, 
       g_xrce3_d[l_ac].xrce003,g_xrce3_d[l_ac].xrce004,g_xrce3_d[l_ac].xrce005,g_xrce3_d[l_ac].xrce008, 
       g_xrce3_d[l_ac].xrce100,g_xrce3_d[l_ac].xrce109,g_xrce3_d[l_ac].xrce101,g_xrce3_d[l_ac].xrce119, 
       g_xrce3_d[l_ac].xrce027,g_xrce3_d[l_ac].xrce010,g_xrce3_d[l_ac].xrce016,g_xrce3_d[l_ac].xrce017, 
       g_xrce3_d[l_ac].xrce018,g_xrce3_d[l_ac].xrce019,g_xrce3_d[l_ac].xrce020,g_xrce3_d[l_ac].xrce022, 
       g_xrce3_d[l_ac].xrce023,g_xrce3_d[l_ac].xrce040,g_xrce3_d[l_ac].xrce035,g_xrce3_d[l_ac].xrce036, 
       g_xrce3_d[l_ac].xrce038,g_xrce3_d[l_ac].xrce039,g_xrce3_d[l_ac].xrce041,g_xrce3_d[l_ac].xrce042, 
       g_xrce3_d[l_ac].xrce043,g_xrce3_d[l_ac].xrce044,g_xrce3_d[l_ac].xrce045,g_xrce3_d[l_ac].xrce046, 
       g_xrce3_d[l_ac].xrce047,g_xrce3_d[l_ac].xrce048,g_xrce3_d[l_ac].xrce049,g_xrce3_d[l_ac].xrce050, 
       g_xrce3_d[l_ac].xrce051,g_xrce3_d[l_ac].xrce017_desc,g_xrce3_d[l_ac].xrce018_u_desc,g_xrce3_d[l_ac].xrce019_desc, 
       g_xrce3_d[l_ac].xrce020_desc
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH b_fill_curs:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
  
      #add-point:b_fill段資料填充 name="b_fill.fill"

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_xrce_d[l_ac].xrce016
      CALL ap_ref_array2(g_ref_fields,"SELECT glacl004 FROM glacl_t WHERE glaclent='"||g_enterprise||"' AND glacl001='"||g_glaa_t.glaa004||"' AND glacl002=? AND glacl003='"||g_lang||"'","") RETURNING g_rtn_fields
      LET g_xrce_d[l_ac].xrce016_desc_1 = '', g_rtn_fields[1] , ''

      LET g_xrce3_d[l_ac].xrce016 = g_xrce_d[l_ac].xrce016
      LET g_xrce3_d[l_ac].xrce016_u_desc = g_xrce_d[l_ac].xrce016_desc_1

      LET g_xrce3_d[l_ac].xrce010 = g_xrce_d[l_ac].xrce010
     #160420-00001#1 Mark ---(S)---
     #SELECT gzcb004 INTO l_gzcb004
     #  FROM gzcb_t
     # WHERE gzcb001 = '8306'
     #   AND gzcb002 = g_xrce_d[l_ac].xrce002
     #IF l_gzcb004 = '1' THEN
     #   SELECT xrde012 INTO g_xrce_d[l_ac].xrde012 FROM xrde_t
     #    WHERE xrdeent = g_enterprise
     #      AND xrdedocno = g_xrce_d[l_ac].xrcedocno
     #      AND xrdeld   = g_xrce_d[l_ac].xrceld
     #END IF
     #
     #SELECT xrde012 INTO g_xrce_d[l_ac].xrde012 FROM xrde_t WHERE xrdeent = g_enterprise
     #   AND xrdeld = g_xrca_t.xrcald
     #   AND xrdedocno = g_xrca_t.xrcadocno
     #   AND xrdeseq = g_xrce_d[l_ac].xrceseq
     # INITIALIZE g_ref_fields TO NULL
     # LET g_ref_fields[1] = l_glaa005
     # LET g_ref_fields[2] = g_xrce_d[l_ac].xrde012
     # CALL ap_ref_array2(g_ref_fields,"SELECT nmail004 FROM nmail_t WHERE nmailent='"||g_enterprise||"' AND nmail001=? AND nmail002=? AND nmail003='"||g_dlang||"'","")
     #    RETURNING g_rtn_fields
     # LET g_xrce_d[l_ac].xrde012_u_desc = '', g_rtn_fields[1] , ''
     #
     # SELECT xrde007 INTO g_xrce_d[l_ac].xrde007 FROM xrde_t WHERE xrdeent = g_enterprise
     #   AND xrdeld = g_xrca_t.xrcald
     #   AND xrdedocno = g_xrca_t.xrcadocno
     #   AND xrdeseq = g_xrce_d[l_ac].xrceseq
     #
     # INITIALIZE g_ref_fields TO NULL
     # LET g_ref_fields[1] = g_xrce_d[l_ac].xrde007
     # CALL ap_ref_array2(g_ref_fields,"SELECT ooial003 FROM ooial_t WHERE ooialent='"||g_enterprise||"' AND ooial001=? AND ooial002='"||g_dlang||"'","") RETURNING g_rtn_fields
     # LET g_xrce_d[l_ac].xrde007_desc = '', g_rtn_fields[1] , ''
     #160420-00001#1 Mark ---(E)---

#      INITIALIZE g_ref_fields TO NULL
#      LET g_ref_fields[1] = g_xrce3_d[l_ac].xrce017
#      CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
#      LET g_xrce3_d[l_ac].xrce017_desc = '', g_rtn_fields[1] , ''
#      DISPLAY BY NAME g_xrce3_d[l_ac].xrce017_desc
#            
#      INITIALIZE g_ref_fields TO NULL
#      LET g_ref_fields[1] = g_xrce3_d[l_ac].xrce019
#      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_lang||"'","") RETURNING g_rtn_fields
#      LET g_xrce3_d[l_ac].xrce019_desc = '', g_rtn_fields[1] , ''
#      DISPLAY BY NAME g_xrce3_d[l_ac].xrce019_desc
#      
#      
#      INITIALIZE g_ref_fields TO NULL
#      LET g_ref_fields[1] = g_xrce3_d[l_ac].xrce020
#      CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='200' AND oocql002=? AND oocql003='"||g_lang||"'","") RETURNING g_rtn_fields
#      LET g_xrce3_d[l_ac].xrce020_desc = '', g_rtn_fields[1] , ''
#      DISPLAY BY NAME g_xrce3_d[l_ac].xrce020_desc
#170621-00032#1-----s
LET g_xrce3_d[l_ac].l_xrce040_desc = s_desc_get_oojdl003_desc(g_xrce3_d[l_ac].xrce040)
#170621-00032#1-----e
      #171016-00011#3 -s 171018 add by 01872
      CALL axrt300_02_xrce035_desc('287',g_xrce3_d[l_ac].xrce035) RETURNING g_xrce3_d[l_ac].xrce035_desc
      LET g_xrce3_d[l_ac].xrce035_desc = g_xrce3_d[l_ac].xrce035 CLIPPED,g_xrce3_d[l_ac].xrce035_desc
      CALL axrt300_02_xrce035_desc('281',g_xrce3_d[l_ac].xrce036) RETURNING g_xrce3_d[l_ac].xrce036_desc
      LET g_xrce3_d[l_ac].xrce036_desc = g_xrce3_d[l_ac].xrce036 CLIPPED,g_xrce3_d[l_ac].xrce036_desc
      CALL s_desc_get_acc_desc('2002',g_xrce3_d[l_ac].xrce041) RETURNING g_xrce3_d[l_ac].xrce041_desc
      LET g_xrce3_d[l_ac].xrce041_desc = g_xrce3_d[l_ac].xrce041 CLIPPED,g_xrce3_d[l_ac].xrce041_desc
      SELECT glad017,glad0171,glad0172,glad018,glad0181,glad0182,
             glad019,glad0191,glad0192,glad020,glad0201,glad0202,
             glad021,glad0211,glad0212,glad022,glad0221,glad0222,
             glad023,glad0231,glad0232,glad024,glad0221,glad0242,
             glad025,glad0251,glad0252,glad026,glad0261,glad0262
       INTO  g_glad017,g_glad0171,g_glad0172,g_glad018,g_glad0181,g_glad0182,
             g_glad019,g_glad0191,g_glad0192,g_glad020,g_glad0201,g_glad0202,
             g_glad021,g_glad0211,g_glad0212,g_glad022,g_glad0221,g_glad0222,
             g_glad023,g_glad0231,g_glad0232,g_glad024,g_glad0241,g_glad0242,
             g_glad025,g_glad0251,g_glad0252,g_glad026,g_glad0261,g_glad0262
       FROM  glad_t
       WHERE gladent = g_enterprise
         AND gladld = g_xrca_t.xrcald
         AND glad001 = g_xrce_d[l_ac].xrce016 
      CALL axrt300_02_free_account_desc(g_glad0171,g_xrce3_d[l_ac].xrce042) RETURNING g_xrce3_d[l_ac].xrce042_desc
      LET g_xrce3_d[l_ac].xrce042_desc = g_xrce3_d[l_ac].xrce042 CLIPPED ,g_xrce3_d[l_ac].xrce042_desc
      CALL axrt300_02_free_account_desc(g_glad0181,g_xrce3_d[l_ac].xrce043) RETURNING g_xrce3_d[l_ac].xrce043_desc
      LET g_xrce3_d[l_ac].xrce043_desc = g_xrce3_d[l_ac].xrce043 CLIPPED ,g_xrce3_d[l_ac].xrce043_desc
      CALL axrt300_02_free_account_desc(g_glad0191,g_xrce3_d[l_ac].xrce044) RETURNING g_xrce3_d[l_ac].xrce044_desc
      LET g_xrce3_d[l_ac].xrce044_desc = g_xrce3_d[l_ac].xrce044 CLIPPED ,g_xrce3_d[l_ac].xrce044_desc
      CALL axrt300_02_free_account_desc(g_glad0201,g_xrce3_d[l_ac].xrce045) RETURNING g_xrce3_d[l_ac].xrce045_desc
      LET g_xrce3_d[l_ac].xrce045_desc = g_xrce3_d[l_ac].xrce045 CLIPPED ,g_xrce3_d[l_ac].xrce045_desc
      CALL axrt300_02_free_account_desc(g_glad0211,g_xrce3_d[l_ac].xrce046) RETURNING g_xrce3_d[l_ac].xrce046_desc
      LET g_xrce3_d[l_ac].xrce046_desc = g_xrce3_d[l_ac].xrce046 CLIPPED ,g_xrce3_d[l_ac].xrce046_desc
      CALL axrt300_02_free_account_desc(g_glad0221,g_xrce3_d[l_ac].xrce047) RETURNING g_xrce3_d[l_ac].xrce047_desc
      LET g_xrce3_d[l_ac].xrce047_desc = g_xrce3_d[l_ac].xrce047 CLIPPED ,g_xrce3_d[l_ac].xrce047_desc
      CALL axrt300_02_free_account_desc(g_glad0231,g_xrce3_d[l_ac].xrce048) RETURNING g_xrce3_d[l_ac].xrce048_desc
      LET g_xrce3_d[l_ac].xrce048_desc = g_xrce3_d[l_ac].xrce048 CLIPPED ,g_xrce3_d[l_ac].xrce048_desc
      CALL axrt300_02_free_account_desc(g_glad0241,g_xrce3_d[l_ac].xrce049) RETURNING g_xrce3_d[l_ac].xrce049_desc
      LET g_xrce3_d[l_ac].xrce049_desc = g_xrce3_d[l_ac].xrce049 CLIPPED ,g_xrce3_d[l_ac].xrce049_desc
      CALL axrt300_02_free_account_desc(g_glad0251,g_xrce3_d[l_ac].xrce050) RETURNING g_xrce3_d[l_ac].xrce050_desc
      LET g_xrce3_d[l_ac].xrce050_desc = g_xrce3_d[l_ac].xrce050 CLIPPED ,g_xrce3_d[l_ac].xrce050_desc
      CALL axrt300_02_free_account_desc(g_glad0261,g_xrce3_d[l_ac].xrce051) RETURNING g_xrce3_d[l_ac].xrce051_desc
      LET g_xrce3_d[l_ac].xrce051_desc = g_xrce3_d[l_ac].xrce051 CLIPPED ,g_xrce3_d[l_ac].xrce051_desc
      #171016-00011#3 -e 171018 add by 01872
      #end add-point
      
      CALL axrt300_02_detail_show()      
 
      IF l_ac > g_max_rec THEN
         IF g_error_show = 1 THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = l_ac
            LET g_errparam.code = 9035 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
         END IF
         EXIT FOREACH
      END IF
 
      LET l_ac = l_ac + 1
      
   END FOREACH
 
   LET g_error_show = 0
   
 
   
   CALL g_xrce_d.deleteElement(g_xrce_d.getLength())   
   CALL g_xrce2_d.deleteElement(g_xrce2_d.getLength())
   CALL g_xrce3_d.deleteElement(g_xrce3_d.getLength())
 
   
   #將key欄位填到每個page
   FOR l_ac = 1 TO g_xrce_d.getLength()
      LET g_xrce2_d[l_ac].xrceld = g_xrce_d[l_ac].xrceld 
      LET g_xrce2_d[l_ac].xrcedocno = g_xrce_d[l_ac].xrcedocno 
      LET g_xrce2_d[l_ac].xrceseq = g_xrce_d[l_ac].xrceseq 
      LET g_xrce3_d[l_ac].xrceld = g_xrce_d[l_ac].xrceld 
      LET g_xrce3_d[l_ac].xrcedocno = g_xrce_d[l_ac].xrcedocno 
      LET g_xrce3_d[l_ac].xrceseq = g_xrce_d[l_ac].xrceseq 
 
      #add-point:b_fill段key值相關欄位 name="b_fill.keys.fill"
      
      #end add-point
   END FOR
   
   IF g_cnt > g_xrce_d.getLength() THEN
      LET l_ac = g_xrce_d.getLength()
   ELSE
      LET l_ac = g_cnt
   END IF
   LET g_cnt = l_ac
 
   #遮罩相關處理
   FOR l_ac = 1 TO g_xrce_d.getLength()
      LET g_xrce_d_mask_o[l_ac].* =  g_xrce_d[l_ac].*
      CALL axrt300_02_xrce_t_mask()
      LET g_xrce_d_mask_n[l_ac].* =  g_xrce_d[l_ac].*
   END FOR
   
   LET g_xrce2_d_mask_o.* =  g_xrce2_d.*
   FOR l_ac = 1 TO g_xrce2_d.getLength()
      LET g_xrce2_d_mask_o[l_ac].* =  g_xrce2_d[l_ac].*
      CALL axrt300_02_xrce_t_mask()
      LET g_xrce2_d_mask_n[l_ac].* =  g_xrce2_d[l_ac].*
   END FOR
   LET g_xrce3_d_mask_o.* =  g_xrce3_d.*
   FOR l_ac = 1 TO g_xrce3_d.getLength()
      LET g_xrce3_d_mask_o[l_ac].* =  g_xrce3_d[l_ac].*
      CALL axrt300_02_xrce_t_mask()
      LET g_xrce3_d_mask_n[l_ac].* =  g_xrce3_d[l_ac].*
   END FOR
 
   
   LET l_ac = g_cnt
 
   #add-point:b_fill段資料填充(其他單身) name="b_fill.others.fill"
   FOR l_ac = 1 TO g_xrce_d.getLength()
      #page2
      LET g_xrce2_d[l_ac].xrce002 = g_xrce_d[l_ac].xrce002
      LET g_xrce2_d[l_ac].xrce003 = g_xrce_d[l_ac].xrce003
      LET g_xrce2_d[l_ac].xrce004 = g_xrce_d[l_ac].xrce004
      LET g_xrce2_d[l_ac].xrce100 = g_xrce_d[l_ac].xrce100
      LET g_xrce2_d[l_ac].xrce109 = g_xrce_d[l_ac].xrce109
      LET g_xrce2_d[l_ac].xrce101 = g_xrce_d[l_ac].xrce101
      LET g_xrce2_d[l_ac].xrce119 = g_xrce_d[l_ac].xrce119
      
      #page3
      LET g_xrce3_d[l_ac].xrce002 = g_xrce_d[l_ac].xrce002
      LET g_xrce3_d[l_ac].xrce003 = g_xrce_d[l_ac].xrce003
      LET g_xrce3_d[l_ac].xrce004 = g_xrce_d[l_ac].xrce004
      LET g_xrce3_d[l_ac].xrce005 = g_xrce_d[l_ac].xrce005
      LET g_xrce3_d[l_ac].xrce008 = g_xrce_d[l_ac].xrce008
      LET g_xrce3_d[l_ac].xrce100 = g_xrce_d[l_ac].xrce100
      LET g_xrce_d[l_ac].xrce109 = g_xrce_d[l_ac].xrce109
      LET g_xrce3_d[l_ac].xrce101 = g_xrce_d[l_ac].xrce101
      LET g_xrce3_d[l_ac].xrce119 = g_xrce_d[l_ac].xrce119
      LET g_xrce3_d[l_ac].xrce027 = g_xrce_d[l_ac].xrce027
      
   END FOR
   #end add-point
   
#  ERROR ""    #(ver:48) mark
 
   LET g_detail_cnt = g_xrce_d.getLength()
   DISPLAY g_detail_idx TO FORMONLY.idx
   DISPLAY g_detail_cnt TO FORMONLY.cnt
   
   CLOSE b_fill_curs
   FREE axrt300_02_pb
   
END FUNCTION
 
{</section>}
 
{<section id="axrt300_02.detail_show" >}
#+ 顯示相關資料
PRIVATE FUNCTION axrt300_02_detail_show()
   #add-point:detail_show段define(客製用) name="detail_show.define_customerization"
   
   #end add-point
   #add-point:show段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_show.define"
   DEFINE l_i     LIKE type_t.num5
   DEFINE l_gzcb004   LIKE gzcb_t.gzcb004
   #end add-point
   
   #add-point:Function前置處理  name="detail_show.before"
   CALL axrt300_02_set_entry_b("a")
   CALL axrt300_02_set_no_entry_b("a")
   #end add-point
   
   
   
   #帶出公用欄位reference值page1
   
    
   #帶出公用欄位reference值page2
   
   #帶出公用欄位reference值page3
   
 
   
   #讀入ref值
   #add-point:show段單身reference name="detail_show.reference"
   
   #end add-point
   
   #add-point:show段單身reference name="detail_show.body2.reference"
  #160420-00001#1 Mark ---(S)---
  ##150311-00003#2 By   01727 Add  ---(S)---
  #IF g_xrce_d[l_ac].xrce006 = '90' THEN 
  #   CALL cl_set_comp_required('xrce003,xrce004',FALSE)
  #ELSE
  #   CALL cl_set_comp_required('xrce003,xrce004',TRUE)
  #END IF
  #
  #IF NOT cl_null(g_xrce_d[l_ac].xrce003) AND g_xrce_d[l_ac].xrce002 = '10' THEN
  #   CALL cl_set_comp_entry('xrce100',FALSE)
  #ELSE
  #   CALL cl_set_comp_entry('xrce100',TRUE)
  #END IF
  #SELECT gzcb004 INTO l_gzcb004 FROM gzcb_t WHERE gzcb001 = '8306' AND gzcb002 = g_xrce_d[l_ac].xrce002
  #IF l_gzcb004 <> '1' THEN
  #   CALL cl_set_comp_entry('xrde012_u',FALSE)
  #ELSE
  #   CALL cl_set_comp_entry('xrde012_u',TRUE)
  #END IF
  #160420-00001#1 Mark ---(E)---
   #150311-00003#2 By   01727 Add  ---(E)---
   #end add-point
   #add-point:show段單身reference name="detail_show.body3.reference"
   FOR l_i = 1 TO g_detail_cnt
      LET g_xrce2_d[l_ac].xrceld = g_xrce_d[l_ac].xrceld 
      LET g_xrce2_d[l_ac].xrcedocno = g_xrce_d[l_ac].xrcedocno 
      LET g_xrce2_d[l_ac].xrceseq = g_xrce_d[l_ac].xrceseq 
  
      LET g_xrce3_d[l_ac].xrceld = g_xrce_d[l_ac].xrceld 
      LET g_xrce3_d[l_ac].xrcedocno = g_xrce_d[l_ac].xrcedocno 
      LET g_xrce3_d[l_ac].xrceseq = g_xrce_d[l_ac].xrceseq 
    
       #page2
      LET g_xrce2_d[l_ac].xrce002 = g_xrce_d[l_ac].xrce002
      LET g_xrce2_d[l_ac].xrce003 = g_xrce_d[l_ac].xrce003
      LET g_xrce2_d[l_ac].xrce004 = g_xrce_d[l_ac].xrce004
      LET g_xrce2_d[l_ac].xrce100 = g_xrce_d[l_ac].xrce100
      LET g_xrce2_d[l_ac].xrce109 = g_xrce_d[l_ac].xrce109
      LET g_xrce2_d[l_ac].xrce101 = g_xrce_d[l_ac].xrce101
      LET g_xrce2_d[l_ac].xrce119 = g_xrce_d[l_ac].xrce119
       
       #page3
      LET g_xrce3_d[l_ac].xrce002 = g_xrce_d[l_ac].xrce002
      LET g_xrce3_d[l_ac].xrce003 = g_xrce_d[l_ac].xrce003
      LET g_xrce3_d[l_ac].xrce004 = g_xrce_d[l_ac].xrce004
      LET g_xrce3_d[l_ac].xrce005 = g_xrce_d[l_ac].xrce005
      LET g_xrce3_d[l_ac].xrce008 = g_xrce_d[l_ac].xrce008
      LET g_xrce3_d[l_ac].xrce100 = g_xrce_d[l_ac].xrce100
      LET g_xrce3_d[l_ac].xrce109 = g_xrce_d[l_ac].xrce109
      LET g_xrce3_d[l_ac].xrce101 = g_xrce_d[l_ac].xrce101
      LET g_xrce3_d[l_ac].xrce119 = g_xrce_d[l_ac].xrce119
      LET g_xrce3_d[l_ac].xrce027 = g_xrce_d[l_ac].xrce027

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_xrce3_d[l_ac].xrce016
      CALL ap_ref_array2(g_ref_fields,"SELECT glacl004 FROM glacl_t WHERE glaclent='"||g_enterprise||"' AND glacl001='"||g_glaa_t.glaa004||"' AND glacl002=? AND glacl003='"||g_lang||"'","") RETURNING g_rtn_fields
      LET g_xrce_d[l_ac].xrce016_desc_1 = '', g_rtn_fields[1] , ''
      
#      INITIALIZE g_ref_fields TO NULL
#      LET g_ref_fields[1] = g_xrce3_d[l_ac].xrce017
#      CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
#      LET g_xrce3_d[l_ac].xrce017_desc = '', g_rtn_fields[1] , ''
#      DISPLAY BY NAME g_xrce3_d[l_ac].xrce017_desc
#            
#      INITIALIZE g_ref_fields TO NULL
#      LET g_ref_fields[1] = g_xrce3_d[l_ac].xrce019
#      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_lang||"'","") RETURNING g_rtn_fields
#      LET g_xrce3_d[l_ac].xrce019_desc = '', g_rtn_fields[1] , ''
#      DISPLAY BY NAME g_xrce3_d[l_ac].xrce019_desc
#      
#      INITIALIZE g_ref_fields TO NULL
#      LET g_ref_fields[1] = g_xrce3_d[l_ac].xrce020
#      CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='200' AND oocql002=? AND oocql003='"||g_lang||"'","") RETURNING g_rtn_fields
#      LET g_xrce3_d[l_ac].xrce020_desc = '', g_rtn_fields[1] , ''
#      DISPLAY BY NAME g_xrce3_d[l_ac].xrce020_desc
   END FOR
   #end add-point
 
   #add-point:detail_show段之後 name="detail_show.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="axrt300_02.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION axrt300_02_set_entry_b(p_cmd)                                                  
   #add-point:set_entry_b段define(客製用) name="set_entry_b.define_customerization"
   
   #end add-point
   DEFINE p_cmd   LIKE type_t.chr1         
   #add-point:set_entry_b段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry_b.define"
   
   #end add-point
 
   IF p_cmd = "a" THEN
      CALL cl_set_comp_entry("",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry_b段欄位控制 name="set_entry_b.field_control"
      
      #end add-point 
   END IF
   
   #add-point:set_entry_b段control name="set_entry_b.set_entry_b"
   CALL cl_set_comp_entry('xrce100,xrce101',TRUE)
   CALL cl_set_comp_entry('xrce100_t,xrce101_t',TRUE)
   CALL cl_set_comp_entry('xrce003,xrce004,xrce100,xrce109',TRUE)
   CALL cl_set_comp_entry('xrce101,xrce119,xrce010,xrce019',TRUE)
   CALL cl_set_comp_entry('xrce004',TRUE)
   #end add-point                                                                   
                                                                                
END FUNCTION                                                                 
 
{</section>}
 
{<section id="axrt300_02.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION axrt300_02_set_no_entry_b(p_cmd)                                               
   #add-point:set_no_entry_b段define(客製用) name="set_no_entry_b.define_customerization"
   
   #end add-point   
   DEFINE p_cmd   LIKE type_t.chr1           
   #add-point:set_no_entry_b段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry_b.define"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry_b段欄位控制 name="set_no_entry_b.field_control"
      
      #end add-point 
   END IF
   
   #add-point:set_no_entry_b段control name="set_no_entry_b.set_no_entry_b"
   CASE
     #160420-00001#1 Mark ---(S)---
     #WHEN g_xrce_d[l_ac].xrce002 = '10'
     #   CALL cl_set_comp_entry('xrce100,xrce101',FALSE)
     #   CALL cl_set_comp_entry('xrce100_t,xrce101_t',FALSE)
     #WHEN g_xrce_d[l_ac].xrce002 = '11'
     #   CALL cl_set_comp_entry('xrce006,xrce003,xrce004,xrce005',FALSE)
     #WHEN g_xrce_d[l_ac].xrce002 = '12'
     #   CALL cl_set_comp_entry('xrce006,xrce003,xrce004,xrce005',FALSE)
     #WHEN g_xrce_d[l_ac].xrce002 = '13'
     #   CALL cl_set_comp_entry('xrce006,xrce003,xrce004,xrce005',FALSE)
     #WHEN g_xrce_d[l_ac].xrce002 = '14'
     #   CALL cl_set_comp_entry('xrce006,xrce003,xrce004,xrce005',FALSE)
     #WHEN g_xrce_d[l_ac].xrce002 = '15'
     #   CALL cl_set_comp_entry('xrce006,xrce003,xrce004,xrce005',FALSE)
     #WHEN g_xrce_d[l_ac].xrce002 = '20'
     #   CALL cl_set_comp_entry('xrce006,xrce003,xrce004,xrce005',FALSE)
     #WHEN g_xrce_d[l_ac].xrce002 = '21'
     #   CALL cl_set_comp_entry('xrce006,xrce003,xrce004,xrce005',FALSE)
     #160420-00001#1 Mark ---(S)---
      WHEN g_xrce_d[l_ac].xrce002 = '31'
         CALL cl_set_comp_entry('xrce100,xrce101',FALSE)
      WHEN g_xrce_d[l_ac].xrce002 = '32'
         CALL cl_set_comp_entry('xrce100,xrce101',FALSE)
      WHEN g_xrce_d[l_ac].xrce002 = '91'
         CALL cl_set_comp_entry('xrce003,xrce004,xrce005',FALSE)
      WHEN g_xrce_d[l_ac].xrce002 = '92'
         CALL cl_set_comp_entry('xrce003,xrce004,xrce005',FALSE)
         
   END CASE
   
   #IF g_prog = "axrt350" THEN #170301-00023#10 mark    
   IF g_prog MATCHES "axrt350*" THEN #170301-00023#10 add
      CALL cl_set_comp_entry('xrceseq,xrce002,xrce003,xrce004,xrce005,xrce100,xrce109,xrce119',FALSE)
   END IF
   #end add-point       
                                                                                
END FUNCTION
 
{</section>}
 
{<section id="axrt300_02.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION axrt300_02_default_search()
   #add-point:default_search段define(客製用) name="default_search.define_customerization"
   
   #end add-point
   DEFINE li_idx  LIKE type_t.num10
   DEFINE li_cnt  LIKE type_t.num10
   DEFINE ls_wc   STRING
   #add-point:default_search段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="default_search.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="default_search.before"
   
   #end add-point  
   
   IF NOT cl_null(g_argv[01]) THEN
      LET ls_wc = ls_wc, " xrceld = '", g_argv[01], "' AND "
   END IF
   
   IF NOT cl_null(g_argv[02]) THEN
      LET ls_wc = ls_wc, " xrcedocno = '", g_argv[02], "' AND "
   END IF
   IF NOT cl_null(g_argv[03]) THEN
      LET ls_wc = ls_wc, " xrceseq = '", g_argv[03], "' AND "
   END IF
 
   
   #add-point:default_search段after sql name="default_search.after_sql"
   
   #end add-point  
   
   IF NOT cl_null(ls_wc) THEN
      LET ls_wc = ls_wc.subString(1,ls_wc.getLength()-5)
      LET g_wc2 = ls_wc
   ELSE
      LET g_wc2 = " 1=1"
      #預設查詢條件
      LET g_wc2 = cl_qbe_get_default_qryplan()
      IF cl_null(g_wc2) THEN
         LET g_wc2 = " 1=1"
      END IF
   END IF
 
   #add-point:default_search段結束前 name="default_search.after"
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="axrt300_02.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION axrt300_02_delete_b(ps_table,ps_keys_bak,ps_page)
   #add-point:delete_b段define(客製用) name="delete_b.define_customerization"
   
   #end add-point
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys_bak DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   DEFINE li_idx      LIKE type_t.num10
   #add-point:delete_b段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete_b.define"
   DEFINE l_gzcb004   LIKE gzcb_t.gzcb004
   #end add-point     
   
   #add-point:Function前置處理  name="delete_b.pre_function"
   
   #end add-point
   
   #判斷是否是同一群組的table
   LET ls_group = "xrce_t,"
   IF ls_group.getIndexOf(ps_table,1) > 0 THEN
      IF ps_table <> 'xrce_t' THEN
         #add-point:delete_b段刪除前 name="delete_b.b_delete"
     #160420-00001#1 Mark ---(S)---
     #SELECT gzcb004 INTO l_gzcb004
     #  FROM gzcb_t
     # WHERE gzcb001 = '8306'
     #   AND gzcb002 = g_xrce_d[l_ac].xrce002
     #IF l_gzcb004 = '2' THEN
     #160420-00001#1 Mark ---(E)---
         #end add-point     
         
         DELETE FROM xrce_t
          WHERE xrceent = g_enterprise AND
            xrceld = ps_keys_bak[1] AND xrcedocno = ps_keys_bak[2] AND xrceseq = ps_keys_bak[3]
         
         #add-point:delete_b段刪除中 name="delete_b.m_delete"
     #160420-00001#1 Mark ---(S)---
     #ELSE
     #   DELETE FROM xrde_t
     #    WHERE xrdeent = g_enterprise 
     #      AND xrdeld = ps_keys_bak[1] AND xrdedocno = ps_keys_bak[2] AND xrdeseq = ps_keys_bak[3]
     #END IF
     #160420-00001#1 Mark ---(E)---
         #end add-point  
            
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = ":",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE
            LET g_errparam.popup = FALSE 
            CALL cl_err()
         END IF
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_xrce_d.deleteElement(li_idx) 
      END IF 
      IF ps_page <> "'2'" THEN 
         CALL g_xrce2_d.deleteElement(li_idx) 
      END IF 
      IF ps_page <> "'3'" THEN 
         CALL g_xrce3_d.deleteElement(li_idx) 
      END IF 
 
      
      #add-point:delete_b段刪除後 name="delete_b.a_delete"
      
      #end add-point
      
      RETURN
   END IF
   
 
   
END FUNCTION
 
{</section>}
 
{<section id="axrt300_02.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION axrt300_02_insert_b(ps_table,ps_keys,ps_page)
   #add-point:insert_b段define(客製用) name="insert_b.define_customerization"
   
   #end add-point
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys     DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   #add-point:insert_b段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert_b.define"
   DEFINE l_gzcb004   LIKE gzcb_t.gzcb004
   #end add-point     
   
   #add-point:Function前置處理  name="insert_b.pre_function"
   
   #end add-point
   
   #判斷是否是同一群組的table
   LET ls_group = "xrce_t,"
   #IF ls_group.getIndexOf(ps_table,1) > 0 THEN
      
      #add-point:insert_b段新增前 name="insert_b.b_insert"
      #170831-00040#1----add-----str
      #法人
       IF cl_null(g_xrce_d[l_ac].xrcecomp) THEN 
          SELECT ooef017 INTO g_xrce_d[l_ac].xrcecomp
            FROM ooef_t
           WHERE ooefent = g_enterprise
             AND ooef001 = g_site
             AND ooefstus = 'Y'
       END IF
      #170831-00040#1----add-----end
      
      IF 1=0 THEN   #160420-00001#1 Mark   #170213-00008#1 unmark lujh
      #end add-point    
      INSERT INTO xrce_t
                  (xrceent,
                   xrceld,xrcedocno,xrceseq
                   ,xrce001,xrcesite,xrce002,xrce003,xrce004,xrce005,xrce024,xrce025,xrce008,xrce015,xrce100,xrce101,xrce103,xrce104,xrce109,xrce113,xrce114,xrce119,xrce027,xrce028,xrcecomp,xrceorga,xrce010,xrce016,xrce001,xrcesite,xrce002,xrce003,xrce004,xrce008,xrce100,xrce103,xrce104,xrce109,xrce101,xrce113,xrce114,xrce119,xrce120,xrce121,xrce123,xrce124,xrce129,xrce130,xrce131,xrce133,xrce134,xrce139,xrce001,xrcesite,xrce002,xrce003,xrce004,xrce005,xrce008,xrce100,xrce109,xrce101,xrce119,xrce027,xrce010,xrce016,xrce017,xrce018,xrce019,xrce020,xrce022,xrce023,xrce040,xrce035,xrce036,xrce038,xrce039,xrce041,xrce042,xrce043,xrce044,xrce045,xrce046,xrce047,xrce048,xrce049,xrce050,xrce051) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2],ps_keys[3]
                   ,g_xrce_d[l_ac].xrce001,g_xrce_d[l_ac].xrcesite,g_xrce_d[l_ac].xrce002,g_xrce_d[l_ac].xrce003, 
                       g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce005,g_xrce_d[l_ac].xrce024,g_xrce_d[l_ac].xrce025, 
                       g_xrce_d[l_ac].xrce008,g_xrce_d[l_ac].xrce015,g_xrce_d[l_ac].xrce100,g_xrce_d[l_ac].xrce101, 
                       g_xrce_d[l_ac].xrce103,g_xrce_d[l_ac].xrce104,g_xrce_d[l_ac].xrce109,g_xrce_d[l_ac].xrce113, 
                       g_xrce_d[l_ac].xrce114,g_xrce_d[l_ac].xrce119,g_xrce_d[l_ac].xrce027,g_xrce_d[l_ac].xrce028, 
                       g_xrce_d[l_ac].xrcecomp,g_xrce_d[l_ac].xrceorga,g_xrce_d[l_ac].xrce010,g_xrce_d[l_ac].xrce016, 
                       g_xrce_d[l_ac].xrce001,g_xrce_d[l_ac].xrcesite,g_xrce_d[l_ac].xrce002,g_xrce_d[l_ac].xrce003, 
                       g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce008,g_xrce_d[l_ac].xrce100,g_xrce_d[l_ac].xrce103, 
                       g_xrce_d[l_ac].xrce104,g_xrce_d[l_ac].xrce109,g_xrce_d[l_ac].xrce101,g_xrce_d[l_ac].xrce113, 
                       g_xrce_d[l_ac].xrce114,g_xrce_d[l_ac].xrce119,g_xrce2_d[l_ac].xrce120,g_xrce2_d[l_ac].xrce121, 
                       g_xrce2_d[l_ac].xrce123,g_xrce2_d[l_ac].xrce124,g_xrce2_d[l_ac].xrce129,g_xrce2_d[l_ac].xrce130, 
                       g_xrce2_d[l_ac].xrce131,g_xrce2_d[l_ac].xrce133,g_xrce2_d[l_ac].xrce134,g_xrce2_d[l_ac].xrce139, 
                       g_xrce_d[l_ac].xrce001,g_xrce_d[l_ac].xrcesite,g_xrce_d[l_ac].xrce002,g_xrce_d[l_ac].xrce003, 
                       g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce005,g_xrce_d[l_ac].xrce008,g_xrce_d[l_ac].xrce100, 
                       g_xrce_d[l_ac].xrce109,g_xrce_d[l_ac].xrce101,g_xrce_d[l_ac].xrce119,g_xrce_d[l_ac].xrce027, 
                       g_xrce_d[l_ac].xrce010,g_xrce_d[l_ac].xrce016,g_xrce3_d[l_ac].xrce017,g_xrce3_d[l_ac].xrce018, 
                       g_xrce3_d[l_ac].xrce019,g_xrce3_d[l_ac].xrce020,g_xrce3_d[l_ac].xrce022,g_xrce3_d[l_ac].xrce023, 
                       g_xrce3_d[l_ac].xrce040,g_xrce3_d[l_ac].xrce035,g_xrce3_d[l_ac].xrce036,g_xrce3_d[l_ac].xrce038, 
                       g_xrce3_d[l_ac].xrce039,g_xrce3_d[l_ac].xrce041,g_xrce3_d[l_ac].xrce042,g_xrce3_d[l_ac].xrce043, 
                       g_xrce3_d[l_ac].xrce044,g_xrce3_d[l_ac].xrce045,g_xrce3_d[l_ac].xrce046,g_xrce3_d[l_ac].xrce047, 
                       g_xrce3_d[l_ac].xrce048,g_xrce3_d[l_ac].xrce049,g_xrce3_d[l_ac].xrce050,g_xrce3_d[l_ac].xrce051) 
 
      #add-point:insert_b段新增中 name="insert_b.m_insert"
     #160420-00001#1 Mark ---(S)---
     ELSE     #170213-00008#1 unmark lujh
     #   SELECT gzcb004 INTO l_gzcb004
     #     FROM gzcb_t
     #    WHERE gzcb001 = '8306'
     #      AND gzcb002 = g_xrce_d[l_ac].xrce002
     #
     #   IF l_gzcb004 = '1' THEN
     #      INSERT INTO xrde_t
     #                  (xrdeent,
     #                   xrdeld,xrdedocno,xrdeseq,
     #                   xrde001,xrdesite,xrde002,xrde006,xrde003,xrde004,xrde008,xrde100,xrde109,xrde101,xrde119,xrde010,
     #                   xrde018,xrde015,xrde028,xrdecomp,xrdeorga,
     #                   xrde120,xrde121,xrde129,xrde130,xrde131,xrde139,xrde016,xrde017,xrde019,xrde020,xrde022,xrde023,xrde012)  
     #            VALUES(g_enterprise,
     #                   ps_keys[1],ps_keys[2],ps_keys[3],
     #                   g_xrce_d[l_ac].xrce001, g_xrce_d[l_ac].xrcesite,g_xrce_d[l_ac].xrce002, g_xrce_d[l_ac].xrce006, 
     #                   g_xrce_d[l_ac].xrce003, g_xrce_d[l_ac].xrce004,  
     #                   g_xrce_d[l_ac].xrce008, g_xrce_d[l_ac].xrce100, g_xrce_d[l_ac].xrce109, 
     #                   g_xrce_d[l_ac].xrce101, g_xrce_d[l_ac].xrce119, g_xrce3_d[l_ac].xrce010, 
     #                   g_xrce3_d[l_ac].xrce018, g_xrce_d[l_ac].xrce015, g_xrce_d[l_ac].xrce028, 
     #                   g_xrce_d[l_ac].xrcecomp,g_xrce_d[l_ac].xrceorga,g_xrce2_d[l_ac].xrce120,g_xrce2_d[l_ac].xrce121, 
     #                   g_xrce2_d[l_ac].xrce129,g_xrce2_d[l_ac].xrce130,g_xrce2_d[l_ac].xrce131,g_xrce2_d[l_ac].xrce139, 
     #                   g_xrce3_d[l_ac].xrce016,g_xrce3_d[l_ac].xrce017,
     #                   g_xrce3_d[l_ac].xrce019,g_xrce3_d[l_ac].xrce020,g_xrce3_d[l_ac].xrce022,g_xrce3_d[l_ac].xrce023,g_xrce_d[l_ac].xrde012)
     #   ELSE
     #      INSERT INTO xrce_t
     #                  (xrceent,
     #                   xrceld,xrcedocno,xrceseq,
     #                   xrce001,xrcesite,xrce002,xrce006,xrce003,xrce004,xrce005,xrce024,xrce025,xrce008,xrce100,xrce109,xrce101,xrce119,xrce027,xrce010,
     #                   xrce018,xrce015,xrce028,xrce104,xrce114,xrce124,xrce134,xrcecomp,xrceorga,
     #                   xrce120,xrce121,xrce129,xrce130,xrce131,xrce139,xrce016,xrce017,xrce019,xrce020,xrce022,xrce023)  
     #            VALUES(g_enterprise,
     #                   ps_keys[1],ps_keys[2],ps_keys[3],
     #                   g_xrce_d[l_ac].xrce001, g_xrce_d[l_ac].xrcesite,g_xrce_d[l_ac].xrce002, g_xrce_d[l_ac].xrce006, 
     #                   g_xrce_d[l_ac].xrce003, g_xrce_d[l_ac].xrce004, g_xrce_d[l_ac].xrce005, g_xrce_d[l_ac].xrce024, 
     #                   g_xrce_d[l_ac].xrce025, g_xrce_d[l_ac].xrce008, g_xrce_d[l_ac].xrce100, g_xrce_d[l_ac].xrce109, 
     #                   g_xrce_d[l_ac].xrce101, g_xrce_d[l_ac].xrce119, g_xrce_d[l_ac].xrce027, g_xrce3_d[l_ac].xrce010, 
     #                   g_xrce3_d[l_ac].xrce018, g_xrce_d[l_ac].xrce015, g_xrce_d[l_ac].xrce028, 
     #                   g_xrce_d[l_ac].xrce104, g_xrce_d[l_ac].xrce114, g_xrce_d[l_ac].xrce124, g_xrce_d[l_ac].xrce134, 
     #                   g_xrce_d[l_ac].xrcecomp,g_xrce_d[l_ac].xrceorga,g_xrce2_d[l_ac].xrce120,g_xrce2_d[l_ac].xrce121, 
     #                   g_xrce2_d[l_ac].xrce129,g_xrce2_d[l_ac].xrce130,g_xrce2_d[l_ac].xrce131,g_xrce2_d[l_ac].xrce139, 
     #                   g_xrce3_d[l_ac].xrce016,g_xrce3_d[l_ac].xrce017,
     #                   g_xrce3_d[l_ac].xrce019,g_xrce3_d[l_ac].xrce020,g_xrce3_d[l_ac].xrce022,g_xrce3_d[l_ac].xrce023)
     #   END IF      
        #170213-00008#1--add--str--lujh
                  
        
        INSERT INTO xrce_t
                  (xrceent,
                   xrceld,xrcedocno,xrceseq
                   ,xrce001,xrcesite,xrce002,
                   xrce003,xrce004,xrce005,
                   xrce024,xrce025,xrce008,
                   xrce015,xrce100,xrce101,
                   xrce103,xrce104,xrce109,
                   xrce113,xrce114,xrce119,
                   xrce027,xrce028,xrcecomp,
                   xrceorga,xrce010,xrce016,
#                   xrce120,xrce121,xrce129,    #170831-00033#1---mark
#                   xrce123,xrce124,xrce130,  #170831-00033#1---mark
                   xrce120,xrce121,xrce123,xrce124,xrce129,xrce130,   #170831-00033#1---add
                   xrce131,xrce133,xrce134,
                   xrce139,
                   xrce040,   #170621-00032#1
                   xrce017,xrce018,xrce019,
                   #170512-00045#2 add s---
                   xrce035,xrce036,xrce038,xrce039,xrce041,
                   xrce042,xrce043,xrce044,xrce045,xrce046,
                   xrce047,xrce048,xrce049,xrce050,
                   #170512-00045#2 add e---
                   xrce051,     #171016-00011#3 171020 add by 08172
                   xrce020,xrce022,xrce023) 
                 VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2],ps_keys[3]
                   ,g_xrce_d[l_ac].xrce001,g_xrce_d[l_ac].xrcesite,g_xrce_d[l_ac].xrce002,g_xrce_d[l_ac].xrce003,
                       g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce005,g_xrce_d[l_ac].xrce024,g_xrce_d[l_ac].xrce025,
                       g_xrce_d[l_ac].xrce008,g_xrce_d[l_ac].xrce015,g_xrce_d[l_ac].xrce100,g_xrce_d[l_ac].xrce101,
                       g_xrce_d[l_ac].xrce103,g_xrce_d[l_ac].xrce104,g_xrce_d[l_ac].xrce109,g_xrce_d[l_ac].xrce113,
                       g_xrce_d[l_ac].xrce114,g_xrce_d[l_ac].xrce119,g_xrce_d[l_ac].xrce027,g_xrce_d[l_ac].xrce028,
                       g_xrce_d[l_ac].xrcecomp,g_xrce_d[l_ac].xrceorga,g_xrce_d[l_ac].xrce010,g_xrce_d[l_ac].xrce016,
                       g_xrce2_d[l_ac].xrce120,g_xrce2_d[l_ac].xrce121,
                       g_xrce2_d[l_ac].xrce123,g_xrce2_d[l_ac].xrce124,g_xrce2_d[l_ac].xrce129,g_xrce2_d[l_ac].xrce130,
                       g_xrce2_d[l_ac].xrce131,g_xrce2_d[l_ac].xrce133,g_xrce2_d[l_ac].xrce134,g_xrce2_d[l_ac].xrce139,
                       g_xrce3_d[l_ac].xrce040,   #170621-00032#1
                       g_xrce3_d[l_ac].xrce017,g_xrce3_d[l_ac].xrce018,
                       g_xrce3_d[l_ac].xrce019,
                       #170512-00045#2 add s---
                       g_xrce3_d[l_ac].xrce035,g_xrce3_d[l_ac].xrce036,g_xrce3_d[l_ac].xrce038,g_xrce3_d[l_ac].xrce039,g_xrce3_d[l_ac].xrce041,
                       g_xrce3_d[l_ac].xrce042,g_xrce3_d[l_ac].xrce043,g_xrce3_d[l_ac].xrce044,g_xrce3_d[l_ac].xrce045,g_xrce3_d[l_ac].xrce046,
                       g_xrce3_d[l_ac].xrce047,g_xrce3_d[l_ac].xrce048,g_xrce3_d[l_ac].xrce049,g_xrce3_d[l_ac].xrce050,
                       #170512-00045#2 add e---  
                       g_xrce3_d[l_ac].xrce051,     #171016-00011#3 171020 add by 08172                       
                       g_xrce3_d[l_ac].xrce020,g_xrce3_d[l_ac].xrce022,g_xrce3_d[l_ac].xrce023)
        #170213-00008#1--add--end--lujh
     END IF    #170213-00008#1 unmark lujh
     #160420-00001#1 Mark ---(E)---
      #end add-point    
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "xrce_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      #add-point:insert_b段新增後 name="insert_b.a_insert"
      
      #end add-point    
   #END IF
   
 
   
END FUNCTION
 
{</section>}
 
{<section id="axrt300_02.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION axrt300_02_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
   #add-point:update_b段define(客製用) name="update_b.define_customerization"
   
   #end add-point
   DEFINE ps_page          STRING
   DEFINE ps_table         STRING
   DEFINE ps_keys          DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ps_keys_bak      DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group         STRING
   DEFINE li_idx           LIKE type_t.num10
   DEFINE lb_chk           BOOLEAN
   DEFINE l_new_key        DYNAMIC ARRAY OF STRING
   DEFINE l_old_key        DYNAMIC ARRAY OF STRING
   DEFINE l_field_key      DYNAMIC ARRAY OF STRING
   #add-point:update_b段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="update_b.define"
   DEFINE l_gzcb004        LIKE gzcb_t.gzcb004
   #end add-point     
   
   #add-point:Function前置處理  name="update_b.pre_function"
   
   #end add-point
   
   #比對新舊值, 判斷key是否有改變
   LET lb_chk = TRUE
   FOR li_idx = 1 TO ps_keys.getLength()
      IF ps_keys[li_idx] <> ps_keys_bak[li_idx] THEN
         LET lb_chk = FALSE
         EXIT FOR
      END IF
   END FOR
   
   #若key無變動, 不需要做處理
   IF lb_chk THEN
      RETURN
   END IF
    
   #若key有變動, 則連動其他table的資料   
   #判斷是否是同一群組的table
   LET ls_group = "xrce_t,"
   IF ls_group.getIndexOf(ps_table,1) > 0 AND ps_table <> "xrce_t" THEN
      #add-point:update_b段修改前 name="update_b.b_update"
     #160420-00001#1 Mark ---(S)---
     #SELECT gzcb004 INTO l_gzcb004
     #  FROM gzcb_t
     # WHERE gzcb001 = '8306'
     #   AND gzcb002 = g_xrce_d[l_ac].xrce002
     #IF l_gzcb004 = '2' THEN 
     #160420-00001#1 Mark ---(E)---
      #end add-point     
      UPDATE xrce_t 
         SET (xrceld,xrcedocno,xrceseq
              ,xrce001,xrcesite,xrce002,xrce003,xrce004,xrce005,xrce024,xrce025,xrce008,xrce015,xrce100,xrce101,xrce103,xrce104,xrce109,xrce113,xrce114,xrce119,xrce027,xrce028,xrcecomp,xrceorga,xrce010,xrce016,xrce001,xrcesite,xrce002,xrce003,xrce004,xrce008,xrce100,xrce103,xrce104,xrce109,xrce101,xrce113,xrce114,xrce119,xrce120,xrce121,xrce123,xrce124,xrce129,xrce130,xrce131,xrce133,xrce134,xrce139,xrce001,xrcesite,xrce002,xrce003,xrce004,xrce005,xrce008,xrce100,xrce109,xrce101,xrce119,xrce027,xrce010,xrce016,xrce017,xrce018,xrce019,xrce020,xrce022,xrce023,xrce040,xrce035,xrce036,xrce038,xrce039,xrce041,xrce042,xrce043,xrce044,xrce045,xrce046,xrce047,xrce048,xrce049,xrce050,xrce051) 
              = 
             (ps_keys[1],ps_keys[2],ps_keys[3]
              ,g_xrce_d[l_ac].xrce001,g_xrce_d[l_ac].xrcesite,g_xrce_d[l_ac].xrce002,g_xrce_d[l_ac].xrce003, 
                  g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce005,g_xrce_d[l_ac].xrce024,g_xrce_d[l_ac].xrce025, 
                  g_xrce_d[l_ac].xrce008,g_xrce_d[l_ac].xrce015,g_xrce_d[l_ac].xrce100,g_xrce_d[l_ac].xrce101, 
                  g_xrce_d[l_ac].xrce103,g_xrce_d[l_ac].xrce104,g_xrce_d[l_ac].xrce109,g_xrce_d[l_ac].xrce113, 
                  g_xrce_d[l_ac].xrce114,g_xrce_d[l_ac].xrce119,g_xrce_d[l_ac].xrce027,g_xrce_d[l_ac].xrce028, 
                  g_xrce_d[l_ac].xrcecomp,g_xrce_d[l_ac].xrceorga,g_xrce_d[l_ac].xrce010,g_xrce_d[l_ac].xrce016, 
                  g_xrce_d[l_ac].xrce001,g_xrce_d[l_ac].xrcesite,g_xrce_d[l_ac].xrce002,g_xrce_d[l_ac].xrce003, 
                  g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce008,g_xrce_d[l_ac].xrce100,g_xrce_d[l_ac].xrce103, 
                  g_xrce_d[l_ac].xrce104,g_xrce_d[l_ac].xrce109,g_xrce_d[l_ac].xrce101,g_xrce_d[l_ac].xrce113, 
                  g_xrce_d[l_ac].xrce114,g_xrce_d[l_ac].xrce119,g_xrce2_d[l_ac].xrce120,g_xrce2_d[l_ac].xrce121, 
                  g_xrce2_d[l_ac].xrce123,g_xrce2_d[l_ac].xrce124,g_xrce2_d[l_ac].xrce129,g_xrce2_d[l_ac].xrce130, 
                  g_xrce2_d[l_ac].xrce131,g_xrce2_d[l_ac].xrce133,g_xrce2_d[l_ac].xrce134,g_xrce2_d[l_ac].xrce139, 
                  g_xrce_d[l_ac].xrce001,g_xrce_d[l_ac].xrcesite,g_xrce_d[l_ac].xrce002,g_xrce_d[l_ac].xrce003, 
                  g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce005,g_xrce_d[l_ac].xrce008,g_xrce_d[l_ac].xrce100, 
                  g_xrce_d[l_ac].xrce109,g_xrce_d[l_ac].xrce101,g_xrce_d[l_ac].xrce119,g_xrce_d[l_ac].xrce027, 
                  g_xrce_d[l_ac].xrce010,g_xrce_d[l_ac].xrce016,g_xrce3_d[l_ac].xrce017,g_xrce3_d[l_ac].xrce018, 
                  g_xrce3_d[l_ac].xrce019,g_xrce3_d[l_ac].xrce020,g_xrce3_d[l_ac].xrce022,g_xrce3_d[l_ac].xrce023, 
                  g_xrce3_d[l_ac].xrce040,g_xrce3_d[l_ac].xrce035,g_xrce3_d[l_ac].xrce036,g_xrce3_d[l_ac].xrce038, 
                  g_xrce3_d[l_ac].xrce039,g_xrce3_d[l_ac].xrce041,g_xrce3_d[l_ac].xrce042,g_xrce3_d[l_ac].xrce043, 
                  g_xrce3_d[l_ac].xrce044,g_xrce3_d[l_ac].xrce045,g_xrce3_d[l_ac].xrce046,g_xrce3_d[l_ac].xrce047, 
                  g_xrce3_d[l_ac].xrce048,g_xrce3_d[l_ac].xrce049,g_xrce3_d[l_ac].xrce050,g_xrce3_d[l_ac].xrce051)  
 
         WHERE xrceent = g_enterprise AND xrceld = ps_keys_bak[1] AND xrcedocno = ps_keys_bak[2] AND xrceseq = ps_keys_bak[3]
      #add-point:update_b段修改中 name="update_b.m_update"
     #160420-00001#1 Mark ---(S)---
     #ELSE
     #   UPDATE xrde_t 
     #      SET (xrdeld,xrdedocno,xrdeseq
     #           ,xrde001,xrdesite,xrde002,xrde006,xrde003,xrde004,xrde008,xrde100,
     #            xrde109,xrde101,xrde119,xrde010,xrde018,xrde015,xrde028,
     #            xrdecomp,xrdeorga,xrde001,xrdesite,xrde002,xrde006,xrde003,xrde004,xrde008,xrde100,xrde109,
     #            xrde101,xrde119,xrde120,xrde121,xrde129,xrde130,xrde131,xrde139,xrde001,xrdesite,xrde002,
     #            xrde006,xrde003,xrde004,xrde008,xrde100,xrde109,xrde101,xrde119,xrde010,
     #            xrde016,xrde017,xrde018,xrde019,xrde020,xrde022,xrde023) 
     #           = 
     #          (ps_keys[1],ps_keys[2],ps_keys[3]
     #           ,g_xrce_d[l_ac].xrce001,g_xrce_d[l_ac].xrcesite,g_xrce_d[l_ac].xrce002,g_xrce_d[l_ac].xrce006, 
     #               g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004,
     #               g_xrce_d[l_ac].xrce008,g_xrce_d[l_ac].xrce100,g_xrce_d[l_ac].xrce109, 
     #               g_xrce_d[l_ac].xrce101,g_xrce_d[l_ac].xrce119,g_xrce3_d[l_ac].xrce010, 
     #               g_xrce3_d[l_ac].xrce018,g_xrce_d[l_ac].xrce015,g_xrce_d[l_ac].xrce028,g_xrce_d[l_ac].xrcecomp, 
     #               g_xrce_d[l_ac].xrceorga,g_xrce_d[l_ac].xrce001,g_xrce_d[l_ac].xrcesite,g_xrce_d[l_ac].xrce002, 
     #               g_xrce_d[l_ac].xrce006,g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004,g_xrce_d[l_ac].xrce008, 
     #               g_xrce_d[l_ac].xrce100,g_xrce_d[l_ac].xrce109,g_xrce_d[l_ac].xrce101,g_xrce_d[l_ac].xrce119, 
     #               g_xrce2_d[l_ac].xrce120,g_xrce2_d[l_ac].xrce121,g_xrce2_d[l_ac].xrce129,g_xrce2_d[l_ac].xrce130, 
     #               g_xrce2_d[l_ac].xrce131,g_xrce2_d[l_ac].xrce139,g_xrce_d[l_ac].xrce001,g_xrce_d[l_ac].xrcesite, 
     #               g_xrce_d[l_ac].xrce002,g_xrce_d[l_ac].xrce006,g_xrce_d[l_ac].xrce003,g_xrce_d[l_ac].xrce004, 
     #               g_xrce_d[l_ac].xrce008,g_xrce_d[l_ac].xrce100,g_xrce_d[l_ac].xrce109, 
     #               g_xrce_d[l_ac].xrce101,g_xrce_d[l_ac].xrce119,g_xrce3_d[l_ac].xrce010, 
     #               g_xrce3_d[l_ac].xrce016,g_xrce3_d[l_ac].xrce017,g_xrce3_d[l_ac].xrce018,g_xrce3_d[l_ac].xrce019, 
     #               g_xrce3_d[l_ac].xrce020,g_xrce3_d[l_ac].xrce022,g_xrce3_d[l_ac].xrce023) 
     #      WHERE xrdeld = ps_keys_bak[1] AND xrdedocno = ps_keys_bak[2] AND xrdeseq = ps_keys_bak[3]
     #END IF
     #160420-00001#1 Mark ---(E)---
      #end add-point 
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "xrce_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "xrce_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE
            LET g_errparam.popup = TRUE 
            CALL cl_err()
         OTHERWISE
            
      END CASE
      #add-point:update_b段修改後 name="update_b.a_update"
      
      #end add-point 
      RETURN
   END IF
   
 
   
END FUNCTION
 
{</section>}
 
{<section id="axrt300_02.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION axrt300_02_lock_b(ps_table)
   #add-point:lock_b段define(客製用) name="lock_b.define_customerization"
   
   #end add-point
   DEFINE ps_table STRING
   DEFINE ls_group STRING
   #add-point:lock_b段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="lock_b.define"
  #160420-00001#1 Mark ---(S)---
  #LET ls_group = "xrce_t"
  #
  #IF ls_group.getIndexOf(ps_table,1) THEN
  #
  #   OPEN axrt300_02_bcl1 USING g_enterprise,
  #                                    g_xrce_d[g_detail_idx].xrceld,g_xrce_d[g_detail_idx].xrcedocno, 
  #                                        g_xrce_d[g_detail_idx].xrceseq
  #                                    
  #   IF SQLCA.sqlcode THEN
  #      INITIALIZE g_errparam TO NULL 
  #      LET g_errparam.extend = "axrt300_02_bcl1" 
  #      LET g_errparam.code   = SQLCA.sqlcode 
  #      LET g_errparam.popup  = TRUE 
  #      CALL cl_err()
  #      RETURN FALSE
  #   END IF
  #
  #END IF
  #160420-00001#1 Mark ---(E)---
   #end add-point   
   
   #add-point:Function前置處理  name="lock_b.pre_function"
   
   #end add-point
   
   #先刷新資料
   #CALL axrt300_02_b_fill(g_wc2)
   
   #鎖定整組table
   #LET ls_group = ""
   #僅鎖定自身table
   LET ls_group = "xrce_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
   
      OPEN axrt300_02_bcl USING g_enterprise,
                                       g_xrce_d[g_detail_idx].xrceld,g_xrce_d[g_detail_idx].xrcedocno, 
                                           g_xrce_d[g_detail_idx].xrceseq
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "axrt300_02_bcl:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   
   END IF
                                    
 
   
   RETURN TRUE
 
END FUNCTION
 
{</section>}
 
{<section id="axrt300_02.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION axrt300_02_unlock_b(ps_table)
   #add-point:unlock_b段define(客製用) name="unlock_b.define_customerization"
   
   #end add-point
   DEFINE ps_table STRING
   DEFINE ls_group STRING
   #add-point:unlock_b段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="unlock_b.define"
   LET ls_group = ""
              #CLOSE axrt300_02_bcl1   #160420-00001#1 Mark
   #end add-point  
   
   #add-point:Function前置處理  name="unlock_b.pre_function"
   
   #end add-point
   
   LET ls_group = ""
   
   #IF ls_group.getIndexOf(ps_table,1) THEN
      CLOSE axrt300_02_bcl
   #END IF
   
 
   
   #add-point:unlock_b段結束前 name="unlock_b.after"
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="axrt300_02.modify_detail_chk" >}
#+ 單身輸入判定(因應modify_detail)
PRIVATE FUNCTION axrt300_02_modify_detail_chk(ps_record)
   #add-point:modify_detail_chk段define(客製用) name="modify_detail_chk.define_customerization"
   
   #end add-point
   DEFINE ps_record STRING
   DEFINE ls_return STRING
   #add-point:modify_detail_chk段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify_detail_chk.define"
   
   #end add-point
   
   #add-point:modify_detail_chk段開始前 name="modify_detail_chk.before"
   
   #end add-point
   
   #根據sr名稱確定該page第一個欄位的名稱
   CASE ps_record
      WHEN "s_detail1" 
         LET ls_return = "xrce001"
      WHEN "s_detail2"
         LET ls_return = "xrce001"
      WHEN "s_detail3"
         LET ls_return = "xrce001"
 
      #add-point:modify_detail_chk段自訂page控制 name="modify_detail_chk.page_control"
      
      #end add-point
   END CASE
    
   #add-point:modify_detail_chk段結束前 name="modify_detail_chk.after"
   
   #end add-point
   
   RETURN ls_return
   
END FUNCTION
 
{</section>}
 
{<section id="axrt300_02.show_ownid_msg" >}
#+ 判斷是否顯示只能修改自己權限資料的訊息
#(ver:35) ---add start---
PRIVATE FUNCTION axrt300_02_show_ownid_msg()
   #add-point:show_ownid_msg段define(客製用) name="show_ownid_msg.define_customerization"
   
   #end add-point
   #add-point:show_ownid_msg段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show_ownid_msg.define"
   
   #end add-point
  
 
   
 
END FUNCTION
#(ver:35) --- add end ---
 
{</section>}
 
{<section id="axrt300_02.idx_chk" >}
#(ver:42) ---add start---
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION axrt300_02_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk"
   
   #end add-point
 
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
 
   LET g_curr_diag = ui.DIALOG.getCurrent() #(ver:42)
 
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_xrce_d.getLength() THEN
         LET g_detail_idx = g_xrce_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_xrce_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_xrce_d.getLength() TO FORMONLY.cnt
   END IF
 
   IF g_current_page = 2 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail2")
      IF g_detail_idx > g_xrce2_d.getLength() THEN
         LET g_detail_idx = g_xrce2_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_xrce2_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_xrce2_d.getLength() TO FORMONLY.cnt
   END IF
   IF g_current_page = 3 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail3")
      IF g_detail_idx > g_xrce3_d.getLength() THEN
         LET g_detail_idx = g_xrce3_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_xrce3_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_xrce3_d.getLength() TO FORMONLY.cnt
   END IF
 
 
   #add-point:idx_chk段other name="idx_chk.other"
   
   #end add-point
 
END FUNCTION
#(ver:42) --- add end ---
 
{</section>}
 
{<section id="axrt300_02.mask_functions" >}
&include "erp/axr/axrt300_02_mask.4gl"
 
{</section>}
 
{<section id="axrt300_02.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION axrt300_02_set_pk_array()
   #add-point:set_pk_array段define name="set_pk_array.define_customerization"
   
   #end add-point
   #add-point:set_pk_array段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_pk_array.define"
   
   #end add-point
   
   #add-point:Function前置處理 name="set_pk_array.before"
   
   #end add-point  
   
   #若l_ac<=0代表沒有資料
   IF l_ac <= 0 THEN
      RETURN
   END IF
   
   CALL g_pk_array.clear()
   LET g_pk_array[1].values = g_xrce_d[l_ac].xrceld
   LET g_pk_array[1].column = 'xrceld'
   LET g_pk_array[2].values = g_xrce_d[l_ac].xrcedocno
   LET g_pk_array[2].column = 'xrcedocno'
   LET g_pk_array[3].values = g_xrce_d[l_ac].xrceseq
   LET g_pk_array[3].column = 'xrceseq'
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="axrt300_02.state_change" >}
   
 
{</section>}
 
{<section id="axrt300_02.other_dialog" readonly="Y" >}

 
{</section>}
 
{<section id="axrt300_02.other_function" readonly="Y" >}
################################################################################
# Descriptions...: 根據類型、款別檢查來源單號+項次
# Memo...........:
# Usage..........: CALL axrt300_02_chk_xrce003(p_cmd)
#                  RETURNING 
# Input parameter: p_cmd          新增/修改
#                : 
# Return code....: 
#                : 
# Date & Author..: 2014/01/15 By zhangweib
# Modify.........:
################################################################################
PRIVATE FUNCTION axrt300_02_chk_xrce003()
   DEFINE l_ooab002      LIKE ooab_t.ooab002
   DEFINE l_count        LIKE type_t.num5
   DEFINE l_xrcc108      LIKE xrcc_t.xrcc108
   DEFINE l_xrcc118      LIKE xrcc_t.xrcc118
   DEFINE l_xrcc128      LIKE xrcc_t.xrcc128
   DEFINE l_xrcc138      LIKE xrcc_t.xrcc138
   DEFINE l_apcc108      LIKE apcc_t.apcc108
   DEFINE l_apcc118      LIKE apcc_t.apcc118
   DEFINE l_apcc128      LIKE apcc_t.apcc128
   DEFINE l_apcc138      LIKE apcc_t.apcc138
   DEFINE l_sfin2020     LIKE type_t.chr1   #151130-00015#3   Add
   DEFINE l_sql          STRING             #151130-00015#3   Add

   LET l_ooab002 = ''
   LET g_errno = ''
   SELECT ooab002 INTO l_ooab002 FROM ooab_t
    WHERE ooabent = g_enterprise
      AND ooab001 = 'S-FIN-1002'
      AND ooabsite= g_xrca_t.xrcasite
      
   IF cl_null(g_xrce_d[l_ac].xrce004) THEN RETURN END IF
   
   IF cl_null(g_xrce_d[l_ac].xrce005) THEN RETURN END IF

   IF g_xrce_d[l_ac].xrce002 = '31' OR g_xrce_d[l_ac].xrce002 = '32' THEN
      #檢查資料1:存在性;2.可沖金額大於0
      SELECT COUNT(*) INTO l_count FROM xrca_t,xrcc_t
       WHERE xrcaent = g_enterprise
         AND xrcaent = xrccent
         AND xrcadocno = xrccdocno
         AND xrcald = xrccld
         AND xrccld = g_xrca_t.xrcald
         AND xrccdocno = g_xrce_d[l_ac].xrce003
         AND xrccseq = g_xrce_d[l_ac].xrce004
         AND xrcc001 = g_xrce_d[l_ac].xrce005
      SELECT SUM(xrcc108 - xrcc109),SUM(xrcc118 - xrcc119 + xrcc113),SUM(xrcc128 - xrcc129 + xrcc123),SUM(xrcc138 - xrcc139 + xrcc133) 
        INTO l_xrcc108,l_xrcc118,l_xrcc128,l_xrcc138
        FROM xrcc_t
       WHERE xrccent = g_enterprise
         AND xrccld = g_xrca_t.xrcald
         AND xrccdocno = g_xrce_d[l_ac].xrce003
         AND xrccseq = g_xrce_d[l_ac].xrce004
         AND xrcc001 = g_xrce_d[l_ac].xrce005

      IF cl_null(l_xrcc108) THEN LET l_xrcc108 = 0 END IF
      IF cl_null(l_xrcc118) THEN LET l_xrcc118 = 0 END IF
      IF cl_null(l_xrcc128) THEN LET l_xrcc128 = 0 END IF
      IF cl_null(l_xrcc138) THEN LET l_xrcc138 = 0 END IF
      CASE
         WHEN l_count = 0
         LET g_errno = 'axr-00067'   RETURN
         WHEN l_xrcc108 = 0 OR l_xrcc118 = 0
         LET g_errno = 'axr-00058'   RETURN
      END CASE
   END IF

   IF g_prog = 'axrt300' THEN    #170618-00443#1 add lujh
      #151130-00015#3 Add  ---(S)---
      CALL cl_get_para(g_enterprise,g_xrca_t.xrcacomp,'S-FIN-2020') RETURNING l_sfin2020
      IF l_sfin2020 MATCHES '[Yy]' THEN
         #本應收單號單身的出貨單,對應的訂單,對應的應收單,對應的待抵單
      
         #應收單單身對應的出貨單
         LET l_sql = "SELECT xrcb002 || '#' || xrcb003 FROM xrcb_t WHERE xrcbent = '",g_enterprise,"'    ",
                     "   AND xrcbld = '",g_xrca_t.xrcald,"' AND xrcb001 = '11' AND xrcbdocno = '",g_xrca_t.xrcadocno,"'"
         #出貨單單身對應的訂單
         LET l_sql = "SELECT xmdl003 || '#' || xmdl004 FROM xmdl_t WHERE xmdlent = '",g_enterprise,"'  ",
                     "   AND xmdl003 IS NOT NULL AND xmdldocno || '#' || xmdlseq IN (",l_sql CLIPPED,")"
         #訂單對應的訂單應收單
         LET l_sql = "SELECT xrcbdocno FROM xrcb_t WHERE xrcbent = '",g_enterprise,"' ",
                     "   AND xrcbld = '",g_xrca_t.xrcald,"' AND xrcb001 = '10'               ",
                     "   AND xrcb002 || '#' || xrcb003 IN (",l_sql CLIPPED,")         "
         #訂單應收單對應的待抵單
         LET l_sql = "SELECT COUNT(*) FROM xrca_t WHERE xrca018 IN (",l_sql CLIPPED,")",
                     "   AND xrcaent = '",g_enterprise,"' AND xrcald = '",g_xrca_t.xrcald,"' ",
                     "   AND xrcadocno = '",g_xrce_d[l_ac].xrce003,"'"
      ELSE
         LET l_sql = "SELECT 1 FROM DUAL"
      END IF
      PREPARE axrt300_02_chk FROM l_sql
      LET l_count = 0
      EXECUTE axrt300_02_chk INTO l_count
      IF cl_null(l_count) THEN LET l_count = 0 END IF
      IF l_count = 0 THEN
         LET g_errno = 'axr-00361'   RETURN
      END IF
      LET l_count = 0
      #151130-00015#3 Add  ---(E)---
   END IF   #170618-00443#1 add lujh

END FUNCTION
################################################################################
# Descriptions...: 根絕單身沖銷類型、款別類型以及來源單號給單身其他字段默認值
# Memo...........:
# Usage..........: CALL axrt300_02_def_xrce(p_xrce002,p_xrce003,p_xrce004,p_xrce005,p_xrce006,p_xrce024)
#                  RETURNING 
# Input parameter: p_xrce002      沖銷類型
#                : p_xrce003      沖銷帳款單號
#                : p_xrce004      沖銷帳款單項次
#                : p_xrce005      期別
#                : p_xrce006      款別類型
#                : p_xrce024      第二參考單號
# Return code....: 
# Date & Author..: 2014/01/15 By zhangweib
# Modify.........:
################################################################################
PRIVATE FUNCTION axrt300_02_def_xrce(p_xrce002,p_xrce003,p_xrce004,p_xrce005,p_xrce006,p_xrce024)
   DEFINE p_xrce002      LIKE xrce_t.xrce002
   DEFINE p_xrce005      LIKE xrce_t.xrce005
   DEFINE p_xrce006      LIKE xrce_t.xrce006
   DEFINE p_xrce003      LIKE xrce_t.xrce003
   DEFINE p_xrce004      LIKE xrce_t.xrce004
   DEFINE p_xrce024      LIKE xrce_t.xrce024

   INITIALIZE g_xrce_t.* TO Null

   #IF p_xrce002 = '30' THEN
   #   CALL axrt300_02_def_xrcc(p_xrce003,p_xrce004,p_xrce005,p_xrce024)
   #END IF
   #
   #IF p_xrce002 = '31' THEN
   #   CALL axrt300_02_def_xrcc(p_xrce003,p_xrce004,p_xrce005,p_xrce003)
   #END IF
   
END FUNCTION
################################################################################
# Descriptions...: 根據類型檢查第二來源單號
# Memo...........:
# Usage..........: CALL axrt300_02_xrce024(p_cmd)
#                  RETURNING 
# Input parameter: p_cmd          新增/修改
#                : 
# Return code....: 
#                : 
# Date & Author..: 2014/01/15 By zhangweib
# Modify.........:
################################################################################
PRIVATE FUNCTION axrt300_02_xrce024(p_cmd)
   DEFINE p_cmd          LIKE type_t.chr1
   DEFINE l_ooab002      LIKE ooab_t.ooab002
   DEFINE l_count        LIKE type_t.num5
   DEFINE l_xrcc108      LIKE xrcc_t.xrcc108
   DEFINE l_xrcc118      LIKE xrcc_t.xrcc118
   DEFINE l_xrcc128      LIKE xrcc_t.xrcc128
   DEFINE l_xrcc138      LIKE xrcc_t.xrcc138

   LET l_ooab002 = ''
   SELECT ooab002 INTO l_ooab002 FROM ooab_t
    WHERE ooabent = g_enterprise
      AND ooab001 = 'S-FIN-1002'
      AND ooabsite= g_xrca_t.xrcasite

   LET g_errno = " "

   IF cl_null(g_xrce_d[l_ac].xrce024) THEN RETURN END IF

   IF cl_null(g_xrce3_d[l_ac].xrce003) THEN RETURN END IF
   
   IF cl_null(g_xrce3_d[l_ac].xrce005) THEN RETURN END IF
   
   IF l_ooab002 = 'Y' AND (cl_null(g_xrce_d[l_ac].xrce025) OR cl_null(g_xrce3_d[l_ac].xrce004)) THEN RETURN END IF
   
   IF l_ooab002 = 'Y' AND (g_xrce_d[l_ac].xrce025 = 0 OR g_xrce3_d[l_ac].xrce004 = 0) THEN RETURN END IF

   IF g_xrce3_d[l_ac].xrce002 = '30' THEN
      #檢查資料1:存在性;2.可沖金額大於0
      IF l_ooab002 = 'Y' THEN
         SELECT COUNT(*) INTO l_count FROM xrca_t,xrcb_t,xrcc_t
          WHERE xrcaent = g_enterprise
            AND xrcaent = xrcbent
            AND xrcaent = xrccent
            AND xrcadocno = xrcbdocno
            AND xrcadocno = xrccdocno
            AND xrcbseq = xrccseq
            AND xrcb002 = g_xrce_d[l_ac].xrce024
            AND xrcb003 = g_xrce_d[l_ac].xrce025
            AND xrcbdocno = g_xrce3_d[l_ac].xrce003
            AND xrcbseq = g_xrce3_d[l_ac].xrce004
            AND xrcc001 = g_xrce3_d[l_ac].xrce005
         SELECT SUM(xrcc108 - xrcc109),SUM(xrcc118 - xrcc119),SUM(xrcc128 - xrcc129),SUM(xrcc138 - xrcc139) 
           INTO l_xrcc108,l_xrcc118,l_xrcc128,l_xrcc138
           FROM xrcc_t,xrcb_t
          WHERE xrcbent = g_enterprise
            AND xrccent = xrcbent
            AND xrccdocno = xrcbdocno
            AND xrcbseq = xrccseq
            AND xrcb002 = g_xrce_d[l_ac].xrce024
            AND xrcb003 = g_xrce_d[l_ac].xrce025
            AND xrcbdocno = g_xrce3_d[l_ac].xrce003
            AND xrcbseq = g_xrce3_d[l_ac].xrce004
            AND xrcc001 = g_xrce3_d[l_ac].xrce005
         
      ELSE
         SELECT COUNT(*) INTO l_count FROM xrca_t,xrcb_t,xrcc_t
          WHERE xrcaent = g_enterprise
            AND xrcaent = xrcbent
            AND xrcaent = xrccent
            AND xrcadocno = xrcbdocno
            AND xrcadocno = xrccdocno
            AND xrcbseq = xrccseq
            AND xrcb002 = g_xrce_d[l_ac].xrce024
            AND xrcbdocno = g_xrce3_d[l_ac].xrce003
            AND xrcc001 = g_xrce3_d[l_ac].xrce005
         SELECT SUM(xrcc108 - xrcc109),SUM(xrcc118 - xrcc119),SUM(xrcc128 - xrcc129),SUM(xrcc138 - xrcc139) 
           INTO l_xrcc108,l_xrcc118,l_xrcc128,l_xrcc138
           FROM xrcc_t,xrcb_t
          WHERE xrcbent = g_enterprise
            AND xrccent = xrcbent
            AND xrccdocno = xrcbdocno
            AND xrcbseq = xrccseq
            AND xrcb002 = g_xrce_d[l_ac].xrce024
            AND xrcbdocno = g_xrce3_d[l_ac].xrce003
            AND xrcc001 = g_xrce3_d[l_ac].xrce005
       END IF
       IF cl_null(l_xrcc108) THEN LET l_xrcc108 = 0 END IF
       IF cl_null(l_xrcc118) THEN LET l_xrcc118 = 0 END IF
       IF cl_null(l_xrcc128) THEN LET l_xrcc128 = 0 END IF
       IF cl_null(l_xrcc138) THEN LET l_xrcc138 = 0 END IF
       CASE
          WHEN l_count = 0
          LET g_errno = 'axr-00067'   RETURN
          WHEN l_xrcc108 = 0 OR l_xrcc118 = 0 OR l_xrcc128 = 0 OR l_xrcc138 = 0
          LET g_errno = 'axr-00058'   RETURN
       END CASE
   END IF

   IF g_xrce3_d[l_ac].xrce002 = '31' THEN       #暫無規格
   END IF
END FUNCTION
################################################################################
# Descriptions...: 根據來源單號計算原幣金額
# Memo...........:
# Usage..........: CALL axrt300_02_chk_xrce109()
#                  RETURNING
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2014/01/15     By zhangweib
# Modify.........:
################################################################################
PRIVATE FUNCTION axrt300_02_chk_xrce109()
   DEFINE l_tot1         LIKE nmbb_t.nmbb006   #原幣金額
   DEFINE l_tot2         LIKE nmbb_t.nmbb007   #本幣金額
   DEFINE l_errno1       LIKE gzze_t.gzze001
   DEFINE l_count        LIKE type_t.num5
   DEFINE l_ld_s         LIKE type_t.num5
   DEFINE l_ooab002      LIKE ooab_t.ooab002
   DEFINE l_xrcc108      LIKE xrcc_t.xrcc108
   DEFINE l_xrcc118      LIKE xrcc_t.xrcc118
   DEFINE l_xrce109      LIKE xrce_t.xrce109
   DEFINE l_xrce119      LIKE xrce_t.xrce119
   DEFINE l_success      LIKE type_t.num5
   DEFINE l_glaa001      LIKE glaa_t.glaa001
   #20150924--add--str--lujh
   DEFINE l_xrce109_1    LIKE xrce_t.xrce109
   DEFINE l_xrce119_1    LIKE xrce_t.xrce119
   #20150924--add--end--lujh
   #151105-00008#6--add--str--lujh
   DEFINE l_xrfc103      LIKE xrfc_t.xrfc103     
   DEFINE l_xrfc104      LIKE xrfc_t.xrfc104
   #151105-00008#6--add--end--lujh
   DEFINE l_xrca001      LIKE xrca_t.xrca001   #160420-00001#13 Add
   DEFINE l_gzcb005      LIKE gzcb_t.gzcb005   #160420-00001#13 Add
   DEFINE l_xrcc108_t    LIKE xrcc_t.xrcc108   #160420-00001#13 Add
   DEFINE l_xrcc118_t    LIKE xrcc_t.xrcc118   #160420-00001#13 Add

   LET g_errno = ' '

   LET l_ooab002 = ''
   SELECT ooab002 INTO l_ooab002 FROM ooab_t
    WHERE ooabent = g_enterprise
      AND ooab001 = 'S-FIN-1002'
      AND ooabsite= g_xrca_t.xrcasite
                    
   IF cl_null(g_xrce_d[l_ac].xrce003) THEN RETURN END IF

   IF g_xrce_d[l_ac].xrce002 = '31' OR g_xrce_d[l_ac].xrce002 = '32' THEN
      SELECT SUM(xrcc108 - xrcc109),SUM(xrcc118 + xrcc113 - xrcc119) INTO l_xrcc108,l_xrcc118 FROM xrcc_t   #20150925 add xrcc109 xrcc119 lujh
       WHERE xrccent = g_enterprise
         AND xrccld = g_xrca_t.xrcald
         AND xrccdocno = g_xrce_d[l_ac].xrce003
         AND xrccseq = g_xrce_d[l_ac].xrce004
         AND xrcc001 = g_xrce_d[l_ac].xrce005

     #160420-00001#13 Add  ---(S)---
     #重新计算訂金待抵單可沖總金額.待抵單可沖總金額應為原始單據已收款金額
     LET l_gzcb005 = ''
     LET l_xrcc108_t = 0
     LET l_xrcc118_t = 0
     SELECT xrca001 INTO l_xrca001 FROM xrca_t WHERE xrcaent = g_enterprise
       AND xrcald = g_xrca_t.xrcald
       AND xrcadocno = g_xrce_d[l_ac].xrce003
     SELECT gzcb005 INTO l_gzcb005 FROM gzcb_t WHERE gzcb001 = '8302' AND gzcb002 = l_xrca001
     IF l_gzcb005 = 'axrq342' THEN
        SELECT SUM(xrcc108 - xrcc109),SUM(xrcc118 - xrcc119 + xrcc113) INTO l_xrcc108_t,l_xrcc118_t FROM xrcc_t
         WHERE xrccent = g_enterprise
           AND xrccld = g_xrca_t.xrcald
           AND xrccdocno IN (
         SELECT xrca018 FROM xrca_t WHERE xrcaent = g_enterprise
         AND xrcald = g_xrca_t.xrcald
         AND xrcadocno = g_xrce_d[l_ac].xrce003)
     END IF
     LET l_xrcc108 = l_xrcc108 - l_xrcc108_t
     LET l_xrcc118 = l_xrcc118 - l_xrcc118_t
     #160420-00001#13 Add  ---(E)---

   END IF
      
  #LET l_xrcc108 = s_curr_round(g_xrca_t.xrcasite,g_glaa_t.glaa001,l_xrcc108,2)     #150821-00002#1 Mark
  #LET l_xrcc118 = s_curr_round(g_xrca_t.xrcasite,g_glaa_t.glaa001,l_xrcc118,2)     #150821-00002#1 Mark
  #150821-00002#1 Add ---(S)---
   CALL s_curr_round_ld('1',g_xrca_t.xrcald,g_xrce_d[l_ac].xrce100,l_xrcc108,2)
      RETURNING l_success,g_errno,l_xrcc108
   SELECT glaa001 INTO l_glaa001 FROM glaa_t WHERE glaaent = g_enterprise
     #AND glaald = g_xrca_m.xrcald   #150909 mark
      AND glaald = g_xrca_t.xrcald   #150909       
    CALL s_curr_round_ld('1',g_xrca_t.xrcald,l_glaa001,l_xrcc118,2)
       RETURNING l_success,g_errno,l_xrcc118
   #150821-00002#1 Add ---(E)---
      
   #20150924--mark--str--lujh
   #SELECT SUM(xrce109),SUM(xrce119) INTO l_xrce109,l_xrce119 FROM xrce_t
   # WHERE xrceent = g_enterprise
   #   AND xrceld = g_xrca_t.xrcald
   #   AND xrce003 = g_xrce_d[l_ac].xrce003
   #   AND xrce004 = g_xrce_d[l_ac].xrce004
   #   AND xrce005 = g_xrce_d[l_ac].xrce005
   #20150924--mark--end--lujh
   
   #20150924--add--str--lujh
   SELECT SUM(xrce109),SUM(xrce119) INTO l_xrce109,l_xrce119 FROM xrce_t,xrda_t
    WHERE xrceent = g_enterprise
      AND xrceent = xrdaent
      AND xrceld = xrdald
      AND xrcedocno = xrdadocno
      AND xrceld = g_xrca_t.xrcald
      AND xrce003 = g_xrce_d[l_ac].xrce003
      AND xrce004 = g_xrce_d[l_ac].xrce004
      AND xrce005 = g_xrce_d[l_ac].xrce005
      AND xrdastus = 'N'
      
   SELECT SUM(xrce109),SUM(xrce119) INTO l_xrce109_1,l_xrce119_1 FROM xrce_t,xrca_t
    WHERE xrceent = g_enterprise
      AND xrceent = xrcaent
      AND xrceld = xrcald
      AND xrcedocno = xrcadocno
      AND xrceld = g_xrca_t.xrcald
      AND xrce003 = g_xrce_d[l_ac].xrce003
      AND xrce004 = g_xrce_d[l_ac].xrce004
      AND xrce005 = g_xrce_d[l_ac].xrce005
      AND xrcastus = 'N' 
   
   IF cl_null(l_xrce109_1) THEN LET l_xrce109_1 = 0 END IF
   IF cl_null(l_xrce119_1) THEN LET l_xrce119_1 = 0 END IF 
   #20150924--add--str--lujh   
   
   #151105-00008#6--add--str--lujh
   #抓取axrt460已存在未审核的单子
   LET l_xrfc103 = 0   LET l_xrfc104 = 0
   SELECT SUM(xrfc103),SUM(xrfc104) INTO l_xrfc103,l_xrfc104 FROM xrfa_t,xrfc_t
    WHERE xrfaent   = g_enterprise
      AND xrfadocno = xrfcdocno
#      AND xrfald    = g_xrda_m.xrdald  #160628-00002#1 mark
      AND xrfald    = g_xrca_t.xrcald  #160628-00002#1 add
      AND xrfc003   = g_xrce_d[l_ac].xrce003
      AND xrfc004   = g_xrce_d[l_ac].xrce004
      AND xrfc005   = g_xrce_d[l_ac].xrce005
      AND xrfastus  = 'N'
   IF cl_null(l_xrfc103) THEN LET l_xrfc103 = 0 END IF
   IF cl_null(l_xrfc104) THEN LET l_xrfc104 = 0 END IF
   #151105-00008#6--add--end--lujh

   IF cl_null(l_xrcc108) THEN LET l_xrcc108 = 0 END IF
   IF cl_null(l_xrcc118) THEN LET l_xrcc118 = 0 END IF
   IF cl_null(l_xrce109) THEN LET l_xrce109 = 0 END IF
   IF cl_null(l_xrce119) THEN LET l_xrce119 = 0 END IF

   IF NOT cl_null(g_xrce_d_t.xrce003) AND NOT cl_null(g_xrce_d_t.xrce005) AND NOT cl_null(g_xrce_d_t.xrce005) THEN
      IF g_xrce_d[l_ac].xrce003 = g_xrce_d_t.xrce003 AND g_xrce_d[l_ac].xrce004 = g_xrce_d_t.xrce004 AND g_xrce_d[l_ac].xrce005 = g_xrce_d_t.xrce005 THEN
         LET l_xrce109 = l_xrce109 - g_xrce_d_t.xrce109
         LET l_xrce119 = l_xrce119 - g_xrce_d_t.xrce119
      END IF
   END IF

   IF l_xrcc108 - l_xrce109 - l_xrce109_1 - l_xrfc103 < g_xrce_d[l_ac].xrce109 OR l_xrcc118 - l_xrce119 - l_xrce119_1 - l_xrfc104 < g_xrce_d[l_ac].xrce119 THEN   #20150924 add l_xrce109_1 l_xrce119_1 lujh   #151105-00008#6 add l_xrfc103,l_xrfc104 lujh
      LET g_errno = 'axr-00054'
   END IF
   
END FUNCTION
################################################################################
# Descriptions...: 根據來源單號計算原幣金額
# Memo...........:
# Usage..........: CALL axrt300_02_chk_xrce109_1()
#                  RETURNING
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2014/01/15 By zhangweib
# Modify.........:
################################################################################
PRIVATE FUNCTION axrt300_02_chk_xrce109_1()
   DEFINE l_tot1         LIKE nmbb_t.nmbb006   #原幣金額
   DEFINE l_tot2         LIKE nmbb_t.nmbb007   #本幣金額
   DEFINE l_errno1       LIKE gzze_t.gzze001
   DEFINE l_count        LIKE type_t.num5
   DEFINE l_ld_s         LIKE type_t.num5
   DEFINE l_ooab002      LIKE ooab_t.ooab002
   DEFINE l_xrcc108      LIKE xrcc_t.xrcc108
   DEFINE l_xrcc118      LIKE xrcc_t.xrcc118
   DEFINE l_xrce109      LIKE xrce_t.xrce109
   DEFINE l_xrce119      LIKE xrce_t.xrce119

   LET l_ooab002 = ''
   SELECT ooab002 INTO l_ooab002 FROM ooab_t
    WHERE ooabent = g_enterprise
      AND ooab001 = 'S-FIN-1002'
      AND ooabsite= g_xrca_t.xrcasite
                     
   IF cl_null(g_xrce_d[l_ac].xrce024) THEN RETURN END IF

   IF cl_null(g_xrce3_d[l_ac].xrce003) THEN RETURN END IF
   
   IF l_ooab002 = 'Y' AND (cl_null(g_xrce_d[l_ac].xrce025) OR cl_null(g_xrce3_d[l_ac].xrce004)) THEN RETURN END IF
   
   IF l_ooab002 = 'Y' AND (g_xrce_d[l_ac].xrce025 = 0 OR g_xrce3_d[l_ac].xrce004 = 0) THEN RETURN END IF

   IF l_ooab002 = 'Y' THEN
      SELECT SUM(xrcc108 - xrcc109),SUM(xrcc118 - xrcc119) INTO l_xrcc108,l_xrcc118 FROM xrcc_t,xrcb_t
       WHERE xrccent = g_enterprise
         AND xrccent = xrcbent
         AND xrccdocno = xrcbdocno
         AND xrccseq = xrcbseq
         AND xrccseq = g_xrce3_d[l_ac].xrce004
         AND xrccdocno = g_xrce3_d[l_ac].xrce003
         AND xrcc001 = g_xrce3_d[l_ac].xrce005
         AND xrcb002 = g_xrce_d[l_ac].xrce024
         AND xrcb003 = g_xrce_d[l_ac].xrce025
         	
      SELECT SUM(xrce109),SUM(xrce119) INTO l_xrce109,l_xrce119 FROM xrce_t
       WHERE xrceent = g_enterprise
         AND xrcedocno = g_xrca_t.xrcadocno
         AND xrceseq <> g_xrce3_d[l_ac].xrceseq
         AND xrce003 = g_xrce3_d[l_ac].xrce003
         AND xrce004 = g_xrce3_d[l_ac].xrce004
         AND xrce005 = g_xrce3_d[l_ac].xrce005
   ELSE
      SELECT SUM(xrcc108 - xrcc109),SUM(xrcc118 - xrcc119) INTO l_xrcc108,l_xrcc118 FROM xrcc_t,xrcb_t
       WHERE xrccent = g_enterprise
         AND xrccent = xrcbent
         AND xrccdocno = xrcbdocno
         AND xrccseq = xrcbseq
         AND xrccdocno = g_xrce3_d[l_ac].xrce003
         AND xrcc001 = g_xrce3_d[l_ac].xrce005
         AND xrcb002 = g_xrce_d[l_ac].xrce024
         
      SELECT SUM(xrce109),SUM(xrce119) INTO l_xrce109,l_xrce119 FROM xrce_t
       WHERE xrceent = g_enterprise
         AND xrcedocno = g_xrca_t.xrcadocno
         AND xrceseq <> g_xrce3_d[l_ac].xrceseq
         AND xrce003 = g_xrce3_d[l_ac].xrce003
         AND xrce005 = g_xrce3_d[l_ac].xrce005
   END IF
   IF cl_null(l_xrcc108) THEN LET l_xrcc108 = 0 END IF
   IF cl_null(l_xrcc118) THEN LET l_xrcc118 = 0 END IF
   IF cl_null(l_xrce109) THEN LET l_xrce109 = 0 END IF
   IF cl_null(l_xrce119) THEN LET l_xrce119 = 0 END IF
   IF (l_xrcc108 = 0 OR l_xrcc118 = 0) OR (l_xrcc108 - l_xrce109 < g_xrce_d[l_ac].xrce109 OR l_xrcc118 - l_xrce119 < g_xrce3_d[l_ac].xrce119) THEN
      LET g_errno = 'axr-00054'
   END IF
   
END FUNCTION
################################################################################
# Descriptions...: 根據回傳值,批次新增單身資料
# Memo...........:
# Usage..........: CALL axrt300_02_ins_xrce(p_xrce002,p_xrce006)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION axrt300_02_ins_xrce(p_xrce002,p_xrce006)
   DEFINE p_xrce002      LIKE xrce_t.xrce002
   DEFINE p_xrce006      LIKE xrce_t.xrce006

   CALL s_transaction_end('N',0)

   CALL s_transaction_begin()
   LET g_success = 'Y'

   IF p_xrce002 = '31' OR p_xrce002 = '32' THEN
      CALL axrt300_02_ins_xrce_04(p_xrce002)
   END IF

   IF g_success = 'Y' THEN
      CALL s_transaction_end('Y',0)
   ELSE
      CALL s_transaction_end('N',0)
   END IF

   CALL axrt300_02_b_fill(g_wc2)
END FUNCTION
################################################################################
# Descriptions...: 根據單號、項次、參考項次二抓取多帳期明細默認資料
# Memo...........:
# Usage..........: CALL axrt300_02_def_xrcc(p_xrce003,p_xrce004,p_xrce005)
#                  RETURNING 
# Input parameter: p_xrce003      沖銷帳款單號
#                : p_xrce004      沖銷帳款單項次
#                : p_xrce005      期别
#                : p_xrce024      第二參考單號
# Return code....: 
# Date & Author..: 2014/01/15 By zhangweib
# Modify.........:
################################################################################
PRIVATE FUNCTION axrt300_02_def_xrcc(p_xrce003,p_xrce004,p_xrce005)
   DEFINE p_xrce003      LIKE xrce_t.xrce003
   DEFINE p_xrce004      LIKE xrce_t.xrce004
   DEFINE p_xrce024      LIKE xrce_t.xrce024
   DEFINE p_xrce005      LIKE xrce_t.xrce005
   DEFINE l_xrce109      LIKE xrce_t.xrce109
   DEFINE l_xrce119      LIKE xrce_t.xrce119
   DEFINE l_xrce129      LIKE xrce_t.xrce129
   DEFINE l_xrce139      LIKE xrce_t.xrce139
   DEFINE l_gzcb005      LIKE gzcb_t.gzcb005
   DEFINE l_ooab002      LIKE ooab_t.ooab002
   DEFINE l_sql          STRING
   #161128-00061#4---mdofiy--begin---------
   #DEFINE l_xrcc_t       RECORD LIKE xrcc_t.*
   #DEFINE l_xrcb_t       RECORD LIKE xrcb_t.*
   #DEFINE l_xrca_t       RECORD LIKE xrca_t.*
   DEFINE l_xrca_t RECORD  #應收憑單單頭
       xrcaent LIKE xrca_t.xrcaent, #企業編號
       xrcaownid LIKE xrca_t.xrcaownid, #資料所有者
       xrcaowndp LIKE xrca_t.xrcaowndp, #資料所屬部門
       xrcacrtid LIKE xrca_t.xrcacrtid, #資料建立者
       xrcacrtdp LIKE xrca_t.xrcacrtdp, #資料建立部門
       xrcacrtdt LIKE xrca_t.xrcacrtdt, #資料創建日
       xrcamodid LIKE xrca_t.xrcamodid, #資料修改者
       xrcamoddt LIKE xrca_t.xrcamoddt, #最近修改日
       xrcacnfid LIKE xrca_t.xrcacnfid, #資料確認者
       xrcacnfdt LIKE xrca_t.xrcacnfdt, #資料確認日
       xrcapstid LIKE xrca_t.xrcapstid, #資料過帳者
       xrcapstdt LIKE xrca_t.xrcapstdt, #資料過帳日
       xrcastus LIKE xrca_t.xrcastus, #狀態碼
       xrcacomp LIKE xrca_t.xrcacomp, #法人
       xrcald LIKE xrca_t.xrcald, #帳套
       xrcadocno LIKE xrca_t.xrcadocno, #應收帳款單號碼
       xrcadocdt LIKE xrca_t.xrcadocdt, #帳款日期
       xrca001 LIKE xrca_t.xrca001, #帳款單性質
       xrcasite LIKE xrca_t.xrcasite, #帳務中心
       xrca003 LIKE xrca_t.xrca003, #帳務人員
       xrca004 LIKE xrca_t.xrca004, #帳款客戶編號
       xrca005 LIKE xrca_t.xrca005, #收款客戶
       xrca006 LIKE xrca_t.xrca006, #客戶分類
       xrca007 LIKE xrca_t.xrca007, #帳款類別
       xrca008 LIKE xrca_t.xrca008, #收款條件編號
       xrca009 LIKE xrca_t.xrca009, #應收款日/應扣抵日
       xrca010 LIKE xrca_t.xrca010, #容許票據到期日
       xrca011 LIKE xrca_t.xrca011, #稅別
       xrca012 LIKE xrca_t.xrca012, #稅率
       xrca013 LIKE xrca_t.xrca013, #含稅否
       xrca014 LIKE xrca_t.xrca014, #人員編號
       xrca015 LIKE xrca_t.xrca015, #部門編號
       xrca016 LIKE xrca_t.xrca016, #來源作業類型
       xrca017 LIKE xrca_t.xrca017, #產生方式
       xrca018 LIKE xrca_t.xrca018, #來源參考單號
       xrca019 LIKE xrca_t.xrca019, #系統產生對應單號(待抵帳款-預收)
       xrca020 LIKE xrca_t.xrca020, #信用狀申請流程否
       xrca021 LIKE xrca_t.xrca021, #商業發票號碼(IV no.)
       xrca022 LIKE xrca_t.xrca022, #出口報單號碼
       xrca023 LIKE xrca_t.xrca023, #發票客戶編號
       xrca024 LIKE xrca_t.xrca024, #發票客戶統一編號
       xrca025 LIKE xrca_t.xrca025, #發票客戶全名
       xrca026 LIKE xrca_t.xrca026, #發票客戶地址
       xrca028 LIKE xrca_t.xrca028, #發票類型
       xrca029 LIKE xrca_t.xrca029, #發票匯率
       xrca030 LIKE xrca_t.xrca030, #發票應開未稅金額
       xrca031 LIKE xrca_t.xrca031, #發票應開稅額
       xrca032 LIKE xrca_t.xrca032, #發票應開含稅金額
       xrca033 LIKE xrca_t.xrca033, #專案編號
       xrca034 LIKE xrca_t.xrca034, #責任中心
       xrca035 LIKE xrca_t.xrca035, #應收(借方)科目編號
       xrca036 LIKE xrca_t.xrca036, #收入(貸方)科目編號
       xrca037 LIKE xrca_t.xrca037, #分錄傳票產生否
       xrca038 LIKE xrca_t.xrca038, #拋轉傳票號碼
       xrca039 LIKE xrca_t.xrca039, #會計檢核附件份數
       xrca040 LIKE xrca_t.xrca040, #留置否
       xrca041 LIKE xrca_t.xrca041, #留置理由碼
       xrca042 LIKE xrca_t.xrca042, #留置設定日期
       xrca043 LIKE xrca_t.xrca043, #留置解除日期
       xrca044 LIKE xrca_t.xrca044, #留置原幣金額
       xrca045 LIKE xrca_t.xrca045, #留置說明
       xrca046 LIKE xrca_t.xrca046, #關係人否
       xrca047 LIKE xrca_t.xrca047, #多角序號
       xrca048 LIKE xrca_t.xrca048, #集團代收/代付單號
       xrca049 LIKE xrca_t.xrca049, #來源營運中心編號
       xrca050 LIKE xrca_t.xrca050, #交易原始單據份數
       xrca051 LIKE xrca_t.xrca051, #作廢理由碼
       xrca052 LIKE xrca_t.xrca052, #列印次數
       xrca053 LIKE xrca_t.xrca053, #備註
       xrca054 LIKE xrca_t.xrca054, #多帳期設定
       xrca055 LIKE xrca_t.xrca055, #繳款優惠條件
       xrca056 LIKE xrca_t.xrca056, #會計檢核附件狀態
       xrca057 LIKE xrca_t.xrca057, #交易對象識別碼
       xrca058 LIKE xrca_t.xrca058, #銷售分類
       xrca059 LIKE xrca_t.xrca059, #預算編號
       xrca060 LIKE xrca_t.xrca060, #發票開立原則
       xrca061 LIKE xrca_t.xrca061, #預計開立發票日期
       xrca062 LIKE xrca_t.xrca062, #多角性質
       xrca063 LIKE xrca_t.xrca063, #整帳批序號
       xrca064 LIKE xrca_t.xrca064, #訂金序次
       xrca065 LIKE xrca_t.xrca065, #發票編號
       xrca066 LIKE xrca_t.xrca066, #發票號碼
       xrca100 LIKE xrca_t.xrca100, #交易原幣別
       xrca101 LIKE xrca_t.xrca101, #原幣匯率
       xrca103 LIKE xrca_t.xrca103, #原幣未稅金額
       xrca104 LIKE xrca_t.xrca104, #原幣稅額
       xrca106 LIKE xrca_t.xrca106, #原幣直接折抵合計金額
       xrca107 LIKE xrca_t.xrca107, #原幣直接沖帳(調整)合計金額
       xrca108 LIKE xrca_t.xrca108, #原幣應收金額
       xrca113 LIKE xrca_t.xrca113, #本幣未稅金額
       xrca114 LIKE xrca_t.xrca114, #本幣稅額
       xrca116 LIKE xrca_t.xrca116, #本幣直接沖帳(調整)合計金額
       xrca117 LIKE xrca_t.xrca117, #本幣直接沖帳(調整)合計金額
       xrca118 LIKE xrca_t.xrca118, #本幣應收金額
       xrca120 LIKE xrca_t.xrca120, #本位幣二幣別
       xrca121 LIKE xrca_t.xrca121, #本位幣二匯率
       xrca123 LIKE xrca_t.xrca123, #本位幣二未稅金額
       xrca124 LIKE xrca_t.xrca124, #本位幣二稅額
       xrca126 LIKE xrca_t.xrca126, #本位幣二直接折抵合計金額
       xrca127 LIKE xrca_t.xrca127, #本位幣二直接沖帳(調整)合計金額
       xrca128 LIKE xrca_t.xrca128, #本位幣二應收金額
       xrca130 LIKE xrca_t.xrca130, #本位幣三幣別
       xrca131 LIKE xrca_t.xrca131, #本位幣三匯率
       xrca133 LIKE xrca_t.xrca133, #本位幣三未稅金額
       xrca134 LIKE xrca_t.xrca134, #本位幣三稅額
       xrca136 LIKE xrca_t.xrca136, #本位幣三直接折抵合計金額
       xrca137 LIKE xrca_t.xrca137, #本位幣三直接沖帳(調整)合計金額
       xrca138 LIKE xrca_t.xrca138  #本位幣三應收金額
       END RECORD
   DEFINE l_xrcb_t RECORD  #應收憑單單身
       xrcbent LIKE xrcb_t.xrcbent, #企業編號
       xrcbld LIKE xrcb_t.xrcbld, #帳套
       xrcbdocno LIKE xrcb_t.xrcbdocno, #單號
       xrcbseq LIKE xrcb_t.xrcbseq, #項次
       xrcbsite LIKE xrcb_t.xrcbsite, #營運據點
       xrcborga LIKE xrcb_t.xrcborga, #帳務來源SITE
       xrcb001 LIKE xrcb_t.xrcb001, #來源類型
       xrcb002 LIKE xrcb_t.xrcb002, #來源業務單據號碼
       xrcb003 LIKE xrcb_t.xrcb003, #來源業務單據項次
       xrcb004 LIKE xrcb_t.xrcb004, #產品編號
       xrcb005 LIKE xrcb_t.xrcb005, #品名規格
       xrcb006 LIKE xrcb_t.xrcb006, #單位
       xrcb007 LIKE xrcb_t.xrcb007, #計價數量
       xrcb008 LIKE xrcb_t.xrcb008, #參考單據號碼
       xrcb009 LIKE xrcb_t.xrcb009, #參考單號項次
       xrcblegl LIKE xrcb_t.xrcblegl, #核算組織
       xrcb010 LIKE xrcb_t.xrcb010, #業務部門
       xrcb011 LIKE xrcb_t.xrcb011, #責任中心
       xrcb012 LIKE xrcb_t.xrcb012, #產品類別
       xrcb013 LIKE xrcb_t.xrcb013, #發票帳否(搭贈/備品/樣品)
       xrcb014 LIKE xrcb_t.xrcb014, #理由碼
       xrcb015 LIKE xrcb_t.xrcb015, #專案編號
       xrcb016 LIKE xrcb_t.xrcb016, #WBS編號
       xrcb017 LIKE xrcb_t.xrcb017, #預算細項
       xrcb018 LIKE xrcb_t.xrcb018, #商戶編號
       xrcb019 LIKE xrcb_t.xrcb019, #開票性質
       xrcb020 LIKE xrcb_t.xrcb020, #稅別
       xrcb021 LIKE xrcb_t.xrcb021, #收入會計科目
       xrcb022 LIKE xrcb_t.xrcb022, #正負值
       xrcb023 LIKE xrcb_t.xrcb023, #沖暫估單否
       xrcb024 LIKE xrcb_t.xrcb024, #區域
       xrcb025 LIKE xrcb_t.xrcb025, #傳票號碼
       xrcb026 LIKE xrcb_t.xrcb026, #傳票項次
       xrcb027 LIKE xrcb_t.xrcb027, #發票編號
       xrcb028 LIKE xrcb_t.xrcb028, #發票號碼
       xrcb029 LIKE xrcb_t.xrcb029, #應收帳款科目
       xrcb030 LIKE xrcb_t.xrcb030, #已開發票數量
       xrcb031 LIKE xrcb_t.xrcb031, #收款條件編號
       xrcb032 LIKE xrcb_t.xrcb032, #訂金序次
       xrcb033 LIKE xrcb_t.xrcb033, #經營方式
       xrcb034 LIKE xrcb_t.xrcb034, #通路
       xrcb035 LIKE xrcb_t.xrcb035, #品牌
       xrcb036 LIKE xrcb_t.xrcb036, #客群
       xrcb037 LIKE xrcb_t.xrcb037, #自由核算項一
       xrcb038 LIKE xrcb_t.xrcb038, #自由核算項二
       xrcb039 LIKE xrcb_t.xrcb039, #自由核算項三
       xrcb040 LIKE xrcb_t.xrcb040, #自由核算項四
       xrcb041 LIKE xrcb_t.xrcb041, #自由核算項五
       xrcb042 LIKE xrcb_t.xrcb042, #自由核算項六
       xrcb043 LIKE xrcb_t.xrcb043, #自由核算項七
       xrcb044 LIKE xrcb_t.xrcb044, #自由核算項八
       xrcb045 LIKE xrcb_t.xrcb045, #自由核算項九
       xrcb046 LIKE xrcb_t.xrcb046, #自由核算項十
       xrcb047 LIKE xrcb_t.xrcb047, #摘要
       xrcb048 LIKE xrcb_t.xrcb048, #客戶訂購單號
       xrcb049 LIKE xrcb_t.xrcb049, #開票單號
       xrcb050 LIKE xrcb_t.xrcb050, #開票項次
       xrcb051 LIKE xrcb_t.xrcb051, #業務人員
       xrcb100 LIKE xrcb_t.xrcb100, #交易原幣
       xrcb101 LIKE xrcb_t.xrcb101, #交易原幣單價
       xrcb102 LIKE xrcb_t.xrcb102, #交易匯率
       xrcb103 LIKE xrcb_t.xrcb103, #交易原幣未稅金額
       xrcb104 LIKE xrcb_t.xrcb104, #交易原幣稅額
       xrcb105 LIKE xrcb_t.xrcb105, #交易原幣含稅金額
       xrcb106 LIKE xrcb_t.xrcb106, #交易原幣調整差異金額
       xrcb111 LIKE xrcb_t.xrcb111, #本幣單價
       xrcb113 LIKE xrcb_t.xrcb113, #本幣未稅金額
       xrcb114 LIKE xrcb_t.xrcb114, #本幣稅額
       xrcb115 LIKE xrcb_t.xrcb115, #本幣含稅金額
       xrcb116 LIKE xrcb_t.xrcb116, #本幣調整差異金額
       xrcb117 LIKE xrcb_t.xrcb117, #已開發票金額(未稅)
       xrcb118 LIKE xrcb_t.xrcb118, #應開發票未稅金額
       xrcb119 LIKE xrcb_t.xrcb119, #應開發票含稅金額
       xrcb121 LIKE xrcb_t.xrcb121, #本位幣二匯率
       xrcb123 LIKE xrcb_t.xrcb123, #本位幣二未稅金額
       xrcb124 LIKE xrcb_t.xrcb124, #本位幣二稅額
       xrcb125 LIKE xrcb_t.xrcb125, #本位幣二含稅金額
       xrcb126 LIKE xrcb_t.xrcb126, #本位幣二調整差異金額
       xrcb131 LIKE xrcb_t.xrcb131, #本位幣三匯率
       xrcb133 LIKE xrcb_t.xrcb133, #本位幣三未稅金額
       xrcb134 LIKE xrcb_t.xrcb134, #本位幣三稅額
       xrcb135 LIKE xrcb_t.xrcb135, #本位幣三含稅金額
       xrcb136 LIKE xrcb_t.xrcb136, #本位幣三調整差異金額
       xrcb052 LIKE xrcb_t.xrcb052, #款別編號
       xrcb053 LIKE xrcb_t.xrcb053, #帳款對象
       xrcb054 LIKE xrcb_t.xrcb054, #收款對象
       xrcb055 LIKE xrcb_t.xrcb055, #收現金額(流通)
       xrcb056 LIKE xrcb_t.xrcb056, #應收金額(流通)
       xrcb057 LIKE xrcb_t.xrcb057, #扣款金額(流通)
       xrcb058 LIKE xrcb_t.xrcb058, #預收科目
       xrcb059 LIKE xrcb_t.xrcb059, #代收銀科目
       xrcb060 LIKE xrcb_t.xrcb060, #月份類型
       xrcb107 LIKE xrcb_t.xrcb107  #出貨單單價
       END RECORD

   DEFINE l_xrcc_t RECORD  #多帳期明細
       xrccent LIKE xrcc_t.xrccent, #企業編號
       xrccld LIKE xrcc_t.xrccld, #帳套
       xrcccomp LIKE xrcc_t.xrcccomp, #法人
       xrccdocno LIKE xrcc_t.xrccdocno, #應收帳款單號碼
       xrccseq LIKE xrcc_t.xrccseq, #項次
       xrcc001 LIKE xrcc_t.xrcc001, #期別
       xrcc002 LIKE xrcc_t.xrcc002, #應收收款類別
       xrcc003 LIKE xrcc_t.xrcc003, #應收款日
       xrcc004 LIKE xrcc_t.xrcc004, #容許票據到期日
       xrcc005 LIKE xrcc_t.xrcc005, #帳款起算日
       xrcc006 LIKE xrcc_t.xrcc006, #正負值
       xrcclegl LIKE xrcc_t.xrcclegl, #核算組織
       xrcc008 LIKE xrcc_t.xrcc008, #發票編號
       xrcc009 LIKE xrcc_t.xrcc009, #發票號碼
       xrccsite LIKE xrcc_t.xrccsite, #帳務中心
       xrcc010 LIKE xrcc_t.xrcc010, #發票日期
       xrcc011 LIKE xrcc_t.xrcc011, #出貨單據日期
       xrcc012 LIKE xrcc_t.xrcc012, #立帳日期
       xrcc013 LIKE xrcc_t.xrcc013, #交易認定日期
       xrcc014 LIKE xrcc_t.xrcc014, #出入庫扣帳日期
       xrcc100 LIKE xrcc_t.xrcc100, #交易原幣別
       xrcc101 LIKE xrcc_t.xrcc101, #原幣匯率
       xrcc102 LIKE xrcc_t.xrcc102, #原幣重估後匯率
       xrcc103 LIKE xrcc_t.xrcc103, #重評價調整數
       xrcc104 LIKE xrcc_t.xrcc104, #No Use
       xrcc105 LIKE xrcc_t.xrcc105, #No Use
       xrcc106 LIKE xrcc_t.xrcc106, #No Use
       xrcc107 LIKE xrcc_t.xrcc107, #No Use
       xrcc108 LIKE xrcc_t.xrcc108, #原幣應收金額
       xrcc109 LIKE xrcc_t.xrcc109, #原幣收款沖帳金額
       xrcc113 LIKE xrcc_t.xrcc113, #本幣重評價調整數
       xrcc114 LIKE xrcc_t.xrcc114, #No Use
       xrcc115 LIKE xrcc_t.xrcc115, #No Use
       xrcc116 LIKE xrcc_t.xrcc116, #No Use
       xrcc117 LIKE xrcc_t.xrcc117, #No Use
       xrcc118 LIKE xrcc_t.xrcc118, #本幣應收金額
       xrcc119 LIKE xrcc_t.xrcc119, #本幣收款沖帳金額
       xrcc120 LIKE xrcc_t.xrcc120, #本位幣二幣別
       xrcc121 LIKE xrcc_t.xrcc121, #本位幣二匯率
       xrcc122 LIKE xrcc_t.xrcc122, #本位幣二重估後匯率
       xrcc123 LIKE xrcc_t.xrcc123, #本位幣二重評價調整數
       xrcc124 LIKE xrcc_t.xrcc124, #No Use
       xrcc125 LIKE xrcc_t.xrcc125, #No Use
       xrcc126 LIKE xrcc_t.xrcc126, #No Use
       xrcc127 LIKE xrcc_t.xrcc127, #No Use
       xrcc128 LIKE xrcc_t.xrcc128, #本位幣二應收金額
       xrcc129 LIKE xrcc_t.xrcc129, #本位幣二收款沖帳金額
       xrcc130 LIKE xrcc_t.xrcc130, #本位幣三幣別
       xrcc131 LIKE xrcc_t.xrcc131, #本位幣三匯率
       xrcc132 LIKE xrcc_t.xrcc132, #本位幣三重估後匯率
       xrcc133 LIKE xrcc_t.xrcc133, #本位幣三重評價調整數
       xrcc134 LIKE xrcc_t.xrcc134, #No Use
       xrcc135 LIKE xrcc_t.xrcc135, #No Use
       xrcc136 LIKE xrcc_t.xrcc136, #No Use
       xrcc137 LIKE xrcc_t.xrcc137, #No Use
       xrcc138 LIKE xrcc_t.xrcc138, #本位幣三應收金額
       xrcc139 LIKE xrcc_t.xrcc139, #本位幣三收款沖帳金額
       xrcc015 LIKE xrcc_t.xrcc015, #收款條件
       xrcc016 LIKE xrcc_t.xrcc016, #帳款類型
       xrcc017 LIKE xrcc_t.xrcc017  #訂單單號
       END RECORD
       
   #20150924--add--str--lujh
   DEFINE l_xrce109_1    LIKE xrce_t.xrce109
   DEFINE l_xrce119_1    LIKE xrce_t.xrce119
   DEFINE l_xrce129_1    LIKE xrce_t.xrce129
   DEFINE l_xrce139_1    LIKE xrce_t.xrce139
   #20150924--add--end--lujh
   #151105-00008#6--add--str--lujh
   DEFINE l_xrfc103      LIKE xrfc_t.xrfc103     
   DEFINE l_xrfc104      LIKE xrfc_t.xrfc104
   #151105-00008#6--add--end--lujh
   DEFINE l_type         LIKE type_t.chr1  #171016-00011#3 add 


   #170621-00032#1-----s
   WHENEVER ERROR CONTINUE
   #170621-00032#1-----e

   SELECT gzcb005 INTO l_gzcb005 FROM gzcb_t
    WHERE gzcb001 = '8306'
      AND gzcb002 = g_xrce_d[l_ac].xrce002

   IF cl_null(p_xrce003) OR cl_null(p_xrce004) OR cl_null(p_xrce005) THEN
      RETURN
   END IF

   #LET l_ooab002 = ''
   #SELECT ooab002 INTO l_ooab002 FROM ooab_t
   # WHERE ooabent = g_enterprise
   #   AND ooab001 = 'S-FIN-1002'
   #   AND ooabsite= g_xrca_t.xrcasite  
   #
   #IF l_ooab002 = 'Y' AND cl_null(p_xrce004) THEN
   #   RETURN
   #END IF

#   IF p_xrce004 != 0 THEN
#      LET l_sql = "SELECT * FROM xrcc_t,xrcb_t,xrca_t",
#                  " WHERE xrcaent = xrcbent",
#                  "   AND xrcbent = xrccent",
#                  "   AND xrcadocno = xrcbdocno",
#                  "   AND xrcbdocno = xrccdocno",
#                  "   AND xrcbseq = xrccseq",
#                  "   AND xrcald = xrcbld",
#                  "   AND xrcald = xrccld",
#                  "   AND (xrcb002 = '",p_xrce024,"' OR xrcb002 IS NULL)",
#                  "   AND xrcc001 = '",p_xrce005,"'",
#                  "   AND xrcbdocno = '",p_xrce003,"'",
#                  "   AND xrcbseq = '",p_xrce004,"'",
#                  "   AND xrccld = '",g_xrca_t.xrcald,"'"
#   ELSE
#      LET l_sql = "SELECT * FROM xrcc_t,xrcb_t,xrca_t",
#                  " WHERE xrcaent = xrcbent",
#                  "   AND xrcbent = xrccent",
#                  "   AND xrcadocno = xrcbdocno",
#                  "   AND xrcbdocno = xrccdocno",
#                  "   AND xrcbseq = xrccseq",
#                  "   AND xrcald = xrcbld",
#                  "   AND xrcald = xrccld",
#                  "   AND (xrcb002 = '",p_xrce024,"' OR xrcb002 IS NULL)",
#                  "   AND xrcc001 = '",p_xrce005,"'",
#                  "   AND xrcbdocno = '",p_xrce003,"'",
#                  "   AND xrccld = '",g_xrca_t.xrcald,"'"
#   END IF

   #161128-00061#4---mdofiy--begin---------
   #SELECT * INTO l_xrcc_t.*,l_xrca_t.*
    SELECT xrccent,xrccld,xrcccomp,xrccdocno,xrccseq,xrcc001,xrcc002,xrcc003,xrcc004,xrcc005,xrcc006,
           xrcclegl,xrcc008,xrcc009,xrccsite,xrcc010,xrcc011,xrcc012,xrcc013,xrcc014,xrcc100,xrcc101,
           xrcc102,xrcc103,xrcc104,xrcc105,xrcc106,xrcc107,xrcc108,xrcc109,xrcc113,xrcc114,xrcc115,
           xrcc116,xrcc117,xrcc118,xrcc119,xrcc120,xrcc121,xrcc122,xrcc123,xrcc124,xrcc125,xrcc126,
           xrcc127,xrcc128,xrcc129,xrcc130,xrcc131,xrcc132,xrcc133,xrcc134,xrcc135,xrcc136,xrcc137,
           xrcc138,xrcc139,xrcc015,xrcc016,xrcc017,
           xrcaent,xrcaownid,xrcaowndp,xrcacrtid,xrcacrtdp,xrcacrtdt,xrcamodid,xrcamoddt,xrcacnfid,
           xrcacnfdt,xrcapstid,xrcapstdt,xrcastus,xrcacomp,xrcald,xrcadocno,xrcadocdt,xrca001,xrcasite,
           xrca003,xrca004,xrca005,xrca006,xrca007,xrca008,xrca009,xrca010,xrca011,xrca012,xrca013,
           xrca014,xrca015,xrca016,xrca017,xrca018,xrca019,xrca020,xrca021,xrca022,xrca023,xrca024,
           xrca025,xrca026,xrca028,xrca029,xrca030,xrca031,xrca032,xrca033,xrca034,xrca035,xrca036,
           xrca037,xrca038,xrca039,xrca040,xrca041,xrca042,xrca043,xrca044,xrca045,xrca046,xrca047,
           xrca048,xrca049,xrca050,xrca051,xrca052,xrca053,xrca054,xrca055,xrca056,xrca057,xrca058,
           xrca059,xrca060,xrca061,xrca062,xrca063,xrca064,xrca065,xrca066,xrca100,xrca101,xrca103,
           xrca104,xrca106,xrca107,xrca108,xrca113,xrca114,xrca116,xrca117,xrca118,xrca120,xrca121,
           xrca123,xrca124,xrca126,xrca127,xrca128,xrca130,xrca131,xrca133,xrca134,xrca136,xrca137,xrca138
           INTO l_xrcc_t.*,l_xrca_t.*
   #161128-00061#4---mdofiy--end---------
     FROM xrcc_t,xrca_t
    WHERE xrcaent = g_enterprise
      AND xrcaent = xrccent
      AND xrcadocno = xrccdocno
      AND xrcald = xrccld
      AND xrccld = g_xrca_t.xrcald          #20150924 change g_xrda_m.xrdald to g_xrca_t.xrcald lujh 
      AND xrccdocno = p_xrce003
      AND xrccseq = p_xrce004
      AND xrcc001 = p_xrce005
   
   LET g_xrce_t.xrcecomp  = l_xrcc_t.xrcccomp
   LET g_xrce_t.xrcesite  = l_xrcc_t.xrccsite
   LET g_xrce_t.xrceorga  = g_xrca_t.xrcacomp
   LET g_xrce_t.xrce001   = 'axrt300'
   LET g_xrce_t.xrce002   = g_xrce_d[l_ac].xrce002
   LET g_xrce_t.xrce003   = l_xrcc_t.xrccdocno
   LET g_xrce_t.xrce004   = l_xrcc_t.xrccseq
   LET g_xrce_t.xrce005   = l_xrcc_t.xrcc001
   LET g_xrce_t.xrce008   = l_xrcc_t.xrccdocno
   LET g_xrce_t.xrce010   = ''
   LET g_xrce_t.xrce015   = l_gzcb005
   LET g_xrce_t.xrce016   = l_xrca_t.xrca035
   LET g_xrce_t.xrce017   = l_xrca_t.xrca014
   #160628-00002#1--add--str--
   #161128-00061#4---mdofiy--begin---------
   #SELECT * INTO l_xrcb_t.*
   #171016-00011#3 -s 171018 add by 08172
   CALL cl_get_para(g_enterprise,g_xrce_t.xrcecomp,'S-FIN-1002') RETURNING l_type
   IF l_type = '3' THEN
      IF l_xrca_t.xrca001 = '21' OR l_xrca_t.xrca001 = '23' THEN
         SELECT xrcbent,xrcbld,xrcbdocno,xrcbseq,xrcbsite,xrcborga,xrcb001,xrcb002,xrcb003,xrcb004,
                xrcb005,xrcb006,xrcb007,xrcb008,xrcb009,xrcblegl,xrcb010,xrcb011,xrcb012,xrcb013,
                xrcb014,xrcb015,xrcb016,xrcb017,xrcb018,xrcb019,xrcb020,xrcb021,xrcb022,xrcb023,
                xrcb024,xrcb025,xrcb026,xrcb027,xrcb028,xrcb029,xrcb030,xrcb031,xrcb032,xrcb033,
                xrcb034,xrcb035,xrcb036,xrcb037,xrcb038,xrcb039,xrcb040,xrcb041,xrcb042,xrcb043,
                xrcb044,xrcb045,xrcb046,xrcb047,xrcb048,xrcb049,xrcb050,xrcb051,xrcb100,xrcb101,
                xrcb102,xrcb103,xrcb104,xrcb105,xrcb106,xrcb111,xrcb113,xrcb114,xrcb115,xrcb116,
                xrcb117,xrcb118,xrcb119,xrcb121,xrcb123,xrcb124,xrcb125,xrcb126,xrcb131,xrcb133,
                xrcb134,xrcb135,xrcb136,xrcb052,xrcb053,xrcb054,xrcb055,xrcb056,xrcb057,xrcb058,
                xrcb059,xrcb060,xrcb107 INTO l_xrcb_t.*
          FROM xrcb_t
         WHERE xrcbent = g_enterprise
           AND xrcbld = g_xrca_t.xrcald 
           AND xrcbdocno IN (SELECT xrca018 
                               FROM xrca_t 
                              WHERE xrcaent = g_enterprise
                                AND xrcald = g_xrca_t.xrcald
                                AND xrcadocno = p_xrce003)
           AND xrcbseq = p_xrce004
      ELSE
         IF l_xrca_t.xrca001 = '24' THEN
            SELECT xrde003,xrde004,xrde017,xrde018,xrde019,xrde020,xrde022,xrde023,xrde035,xrde039,xrde040,
                   xrde041,xrde036,xrde042,xrde043,xrde044,xrde045,xrde046,xrde047,xrde048,xrde049,
                   xrde050,xrde051
              INTO l_xrcb_t.xrcb002,l_xrcb_t.xrcb003,l_xrcb_t.xrcb051,l_xrcb_t.xrcb010,l_xrcb_t.xrcb011,l_xrcb_t.xrcb012,
                   l_xrcb_t.xrcb015,l_xrcb_t.xrcb016,l_xrcb_t.xrcb024,l_xrcb_t.xrcb033,l_xrcb_t.xrcb034,
                   l_xrcb_t.xrcb035,l_xrcb_t.xrcb036,l_xrcb_t.xrcb037,l_xrcb_t.xrcb038,l_xrcb_t.xrcb039,
                   l_xrcb_t.xrcb040,l_xrcb_t.xrcb041,l_xrcb_t.xrcb042,l_xrcb_t.xrcb043,l_xrcb_t.xrcb044,
                   l_xrcb_t.xrcb045,l_xrcb_t.xrcb046
              FROM xrde_t
             WHERE xrdeent = g_enterprise
               AND xrdeld = g_xrca_t.xrcald 
               AND xrdedocno IN (SELECT xrca018 
                                   FROM xrca_t 
                                  WHERE xrcaent = g_enterprise
                                    AND xrcald = g_xrca_t.xrcald
                                    AND xrcadocno = p_xrce003)
               AND xrde014 = p_xrce003
               AND xrdeseq = p_xrce004
         ELSE 
      #171016-00011#3 -e 171018 add by 08172 
            SELECT xrcbent,xrcbld,xrcbdocno,xrcbseq,xrcbsite,xrcborga,xrcb001,xrcb002,xrcb003,xrcb004,
                   xrcb005,xrcb006,xrcb007,xrcb008,xrcb009,xrcblegl,xrcb010,xrcb011,xrcb012,xrcb013,
                   xrcb014,xrcb015,xrcb016,xrcb017,xrcb018,xrcb019,xrcb020,xrcb021,xrcb022,xrcb023,
                   xrcb024,xrcb025,xrcb026,xrcb027,xrcb028,xrcb029,xrcb030,xrcb031,xrcb032,xrcb033,
                   xrcb034,xrcb035,xrcb036,xrcb037,xrcb038,xrcb039,xrcb040,xrcb041,xrcb042,xrcb043,
                   xrcb044,xrcb045,xrcb046,xrcb047,xrcb048,xrcb049,xrcb050,xrcb051,xrcb100,xrcb101,
                   xrcb102,xrcb103,xrcb104,xrcb105,xrcb106,xrcb111,xrcb113,xrcb114,xrcb115,xrcb116,
                   xrcb117,xrcb118,xrcb119,xrcb121,xrcb123,xrcb124,xrcb125,xrcb126,xrcb131,xrcb133,
                   xrcb134,xrcb135,xrcb136,xrcb052,xrcb053,xrcb054,xrcb055,xrcb056,xrcb057,xrcb058,
                   xrcb059,xrcb060,xrcb107 INTO l_xrcb_t.*
           #161128-00061#4---mdofiy--end---------
             FROM xrcb_t
            WHERE xrcbent = g_enterprise
              AND xrcbld = g_xrca_t.xrcald 
              AND xrcbdocno = p_xrce003  
              AND xrcbseq = p_xrce004
           #160628-00002#1--add--end      
   #171016-00011#3 -s 171018 add by 08172
         END IF
      END IF
   ELSE
      IF l_xrca_t.xrca001 = '21' OR l_xrca_t.xrca001 = '23' THEN
         SELECT xrcbent,xrcbld,xrcbdocno,xrcbseq,xrcbsite,xrcborga,xrcb001,xrcb002,xrcb003,xrcb004,
                xrcb005,xrcb006,xrcb007,xrcb008,xrcb009,xrcblegl,xrcb010,xrcb011,xrcb012,xrcb013,
                xrcb014,xrcb015,xrcb016,xrcb017,xrcb018,xrcb019,xrcb020,xrcb021,xrcb022,xrcb023,
                xrcb024,xrcb025,xrcb026,xrcb027,xrcb028,xrcb029,xrcb030,xrcb031,xrcb032,xrcb033,
                xrcb034,xrcb035,xrcb036,xrcb037,xrcb038,xrcb039,xrcb040,xrcb041,xrcb042,xrcb043,
                xrcb044,xrcb045,xrcb046,xrcb047,xrcb048,xrcb049,xrcb050,xrcb051,xrcb100,xrcb101,
                xrcb102,xrcb103,xrcb104,xrcb105,xrcb106,xrcb111,xrcb113,xrcb114,xrcb115,xrcb116,
                xrcb117,xrcb118,xrcb119,xrcb121,xrcb123,xrcb124,xrcb125,xrcb126,xrcb131,xrcb133,
                xrcb134,xrcb135,xrcb136,xrcb052,xrcb053,xrcb054,xrcb055,xrcb056,xrcb057,xrcb058,
                xrcb059,xrcb060,xrcb107 INTO l_xrcb_t.*
          FROM xrcb_t
         WHERE xrcbent = g_enterprise
           AND xrcbld = g_xrca_t.xrcald 
           AND xrcbdocno IN (SELECT xrca018 
                               FROM xrca_t 
                              WHERE xrcaent = g_enterprise
                                AND xrcald = g_xrca_t.xrcald
                                AND xrcadocno = p_xrce003)
           AND xrcbseq = (SELECT MIN(xrcbseq) 
                            FROM xrcb_t
                           WHERE xrcbent = g_enterprise
                             AND xrcbld = g_xrca_t.xrcald 
                             AND xrcbdocno IN (SELECT xrca018 
                                                 FROM xrca_t 
                                                WHERE xrcaent = g_enterprise
                                                  AND xrcald = g_xrca_t.xrcald
                                                  AND xrcadocno = p_xrce003))
      ELSE
         IF l_xrca_t.xrca001 = '24' THEN
            SELECT xrde003,xrde004,xrde017,xrde018,xrde019,xrde020,xrde022,xrde023,xrde035,xrde039,xrde040,
                   xrde041,xrde036,xrde042,xrde043,xrde044,xrde045,xrde046,xrde047,xrde048,xrde049,
                   xrde050,xrde051
              INTO l_xrcb_t.xrcb002,l_xrcb_t.xrcb003,l_xrcb_t.xrcb051,l_xrcb_t.xrcb010,l_xrcb_t.xrcb011,l_xrcb_t.xrcb012,
                   l_xrcb_t.xrcb015,l_xrcb_t.xrcb016,l_xrcb_t.xrcb024,l_xrcb_t.xrcb033,l_xrcb_t.xrcb034,
                   l_xrcb_t.xrcb035,l_xrcb_t.xrcb036,l_xrcb_t.xrcb037,l_xrcb_t.xrcb038,l_xrcb_t.xrcb039,
                   l_xrcb_t.xrcb040,l_xrcb_t.xrcb041,l_xrcb_t.xrcb042,l_xrcb_t.xrcb043,l_xrcb_t.xrcb044,
                   l_xrcb_t.xrcb045,l_xrcb_t.xrcb046
              FROM xrde_t
             WHERE xrdeent = g_enterprise
               AND xrdeld = g_xrca_t.xrcald 
               AND xrdedocno IN (SELECT xrca018 
                                   FROM xrca_t 
                                  WHERE xrcaent = g_enterprise
                                    AND xrcald = g_xrca_t.xrcald
                                    AND xrcadocno = p_xrce003)
               AND xrde014 = p_xrce003
               AND xrdeseq = (SELECT MIN(xrdeseq) 
                                FROM xrde_t
                               WHERE xrdeent = g_enterprise
                                 AND xrdeld = g_xrca_t.xrcald 
                                 AND xrdedocno IN (SELECT xrca018 
                                                     FROM xrca_t 
                                                    WHERE xrcaent = g_enterprise
                                                      AND xrcald = g_xrca_t.xrcald
                                                      AND xrcadocno = p_xrce003)
                                 AND xrde014 = p_xrce003)
         ELSE 
            SELECT xrcbent,xrcbld,xrcbdocno,xrcbseq,xrcbsite,xrcborga,xrcb001,xrcb002,xrcb003,xrcb004,
                   xrcb005,xrcb006,xrcb007,xrcb008,xrcb009,xrcblegl,xrcb010,xrcb011,xrcb012,xrcb013,
                   xrcb014,xrcb015,xrcb016,xrcb017,xrcb018,xrcb019,xrcb020,xrcb021,xrcb022,xrcb023,
                   xrcb024,xrcb025,xrcb026,xrcb027,xrcb028,xrcb029,xrcb030,xrcb031,xrcb032,xrcb033,
                   xrcb034,xrcb035,xrcb036,xrcb037,xrcb038,xrcb039,xrcb040,xrcb041,xrcb042,xrcb043,
                   xrcb044,xrcb045,xrcb046,xrcb047,xrcb048,xrcb049,xrcb050,xrcb051,xrcb100,xrcb101,
                   xrcb102,xrcb103,xrcb104,xrcb105,xrcb106,xrcb111,xrcb113,xrcb114,xrcb115,xrcb116,
                   xrcb117,xrcb118,xrcb119,xrcb121,xrcb123,xrcb124,xrcb125,xrcb126,xrcb131,xrcb133,
                   xrcb134,xrcb135,xrcb136,xrcb052,xrcb053,xrcb054,xrcb055,xrcb056,xrcb057,xrcb058,
                   xrcb059,xrcb060,xrcb107 INTO l_xrcb_t.*
              FROM xrcb_t
             WHERE xrcbent = g_enterprise
               AND xrcbld = g_xrca_t.xrcald 
               AND xrcbdocno = p_xrce003  
               AND xrcbseq = (SELECT MIN(xrcbseq) 
                                FROM xrcb_t
                               WHERE xrcbent = g_enterprise
                                 AND xrcbld = g_xrca_t.xrcald 
                                 AND xrcbdocno = p_xrce003)
         END IF
      END IF
   END IF
   LET g_xrce_t.xrce017   = l_xrcb_t.xrcb051
   LET g_xrce_t.xrce035   = l_xrcb_t.xrcb024
   LET g_xrce_t.xrce036   = l_xrcb_t.xrcb036
   LET g_xrce_t.xrce039   = l_xrcb_t.xrcb033
   LET g_xrce_t.xrce040   = l_xrcb_t.xrcb034
   LET g_xrce_t.xrce041   = l_xrcb_t.xrcb035
   LET g_xrce_t.xrce042   = l_xrcb_t.xrcb037
   LET g_xrce_t.xrce043   = l_xrcb_t.xrcb038
   LET g_xrce_t.xrce044   = l_xrcb_t.xrcb039
   LET g_xrce_t.xrce045   = l_xrcb_t.xrcb040
   LET g_xrce_t.xrce046   = l_xrcb_t.xrcb041
   LET g_xrce_t.xrce047   = l_xrcb_t.xrcb042
   LET g_xrce_t.xrce048   = l_xrcb_t.xrcb043
   LET g_xrce_t.xrce049   = l_xrcb_t.xrcb044
   LET g_xrce_t.xrce050   = l_xrcb_t.xrcb045
   LET g_xrce_t.xrce051   = l_xrcb_t.xrcb046
   #171016-00011#3 -e 171018 add by 08172
   LET g_xrce_t.xrce018   = l_xrcb_t.xrcb010
   LET g_xrce_t.xrce019   = l_xrcb_t.xrcb011
   LET g_xrce_t.xrce020   = l_xrcb_t.xrcb012
   LET g_xrce_t.xrce022   = l_xrcb_t.xrcb015
   LET g_xrce_t.xrce023   = l_xrcb_t.xrcb016
   LET g_xrce_t.xrce024   = l_xrcb_t.xrcb002
   LET g_xrce_t.xrce025   = l_xrcb_t.xrcb003
#   LET g_xrce_t.xrce027   = 'N' #160628-00002#1 mark
   #160628-00002#1--add--str--
   IF l_xrca_t.xrca060 = '2' THEN
      LET g_xrce_t.xrce027 = 'Y'
   ELSE
      LET g_xrce_t.xrce027 = 'N'
   END IF
   #160628-00002#1--add--end
   #170616-00046#1-----s
   IF l_xrca_t.xrca001 = '22' OR l_xrca_t.xrca001 = '29' THEN
      LET g_xrce_t.xrce027 = 'N'
   END IF
   #170616-00046#1-----e   
   LET g_xrce_t.xrce100   = l_xrcc_t.xrcc100
   LET g_xrce_t.xrce101   = l_xrcc_t.xrcc102    #20150313  xrcc101 ---->xrcc102
   LET g_xrce_t.xrce109   = l_xrcc_t.xrcc108 - l_xrcc_t.xrcc109      #20150924 add lujh
   LET g_xrce_t.xrce119   = l_xrcc_t.xrcc118 - l_xrcc_t.xrcc119
   LET g_xrce_t.xrce120   = l_xrcc_t.xrcc120
   LET g_xrce_t.xrce121   = l_xrcc_t.xrcc122
   LET g_xrce_t.xrce129   = l_xrcc_t.xrcc128 - l_xrcc_t.xrcc129
   LET g_xrce_t.xrce130   = l_xrcc_t.xrcc130
   LET g_xrce_t.xrce131   = l_xrcc_t.xrcc132
   LET g_xrce_t.xrce139   = l_xrcc_t.xrcc138 - l_xrcc_t.xrcc139

   SELECT SUM(xrce109),SUM(xrce119),SUM(xrce129),SUM(xrce139)
     INTO l_xrce109,l_xrce119,l_xrce129,l_xrce139
     FROM xrce_t,xrda_t
    WHERE xrceent = g_enterprise
      AND xrdald = xrceld
      AND xrdadocno = xrcedocno
      AND xrdaent = xrceent
      AND xrceld = g_xrca_t.xrcald
      AND xrce003 = g_xrce_t.xrce003
      AND xrce004 = g_xrce_t.xrce004
      AND xrce005 = g_xrce_t.xrce005
      #AND xrcedocno <> g_xrca_t.xrcadocno    #20150924 mark lujh
      AND xrdastus = 'N'                      #20150924 add lujh
   IF cl_null(l_xrce109) THEN LET l_xrce109 = 0 END IF
   IF cl_null(l_xrce119) THEN LET l_xrce119 = 0 END IF
   IF cl_null(l_xrce129) THEN LET l_xrce129 = 0 END IF
   IF cl_null(l_xrce139) THEN LET l_xrce139 = 0 END IF
   
  
   #20150924--add--str--lujh
   #直接冲账
   SELECT SUM(xrce109),SUM(xrce119),SUM(xrce129),SUM(xrce139) 
     INTO l_xrce109_1,l_xrce119_1,l_xrce129_1,l_xrce139_1 
     FROM xrce_t,xrca_t
    WHERE xrcaent   = g_enterprise
      AND xrcald    = xrceld
      AND xrcadocno = xrcedocno
      AND xrcaent = xrceent #170831-00033#1---add
      AND xrcald = g_xrca_t.xrcald
      AND xrce003 = g_xrce_t.xrce003
      AND xrce004 = g_xrce_t.xrce004
      AND xrce005 = g_xrce_t.xrce005
      AND xrcastus  = 'N'
      
   IF cl_null(l_xrce109_1) THEN LET l_xrce109_1 = 0 END IF
   IF cl_null(l_xrce119_1) THEN LET l_xrce119_1 = 0 END IF
   IF cl_null(l_xrce129_1) THEN LET l_xrce129_1 = 0 END IF
   IF cl_null(l_xrce139_1) THEN LET l_xrce139_1 = 0 END IF
   #20150924--add--end--lujh
   
   #151105-00008#6--add--str--lujh
   #抓取axrt460已存在未审核的单子
   LET l_xrfc103 = 0   LET l_xrfc104 = 0
   SELECT SUM(xrfc103),SUM(xrfc104) INTO l_xrfc103,l_xrfc104 FROM xrfa_t,xrfc_t
    WHERE xrfaent   = g_enterprise
      AND xrfadocno = xrfcdocno
      AND xrfaent = xrfcent #170831-00033#1---add
#      AND xrfald    = g_xrda_m.xrdald #160628-00002#1 mark
      AND xrfald    = g_xrca_t.xrcald  #160628-00002#1 add
      AND xrfc003   = g_xrce_t.xrce003
      AND xrfc004   = g_xrce_t.xrce004
      AND xrfc005   = g_xrce_t.xrce005
      AND xrfastus  = 'N'
   IF cl_null(l_xrfc103) THEN LET l_xrfc103 = 0 END IF
   IF cl_null(l_xrfc104) THEN LET l_xrfc104 = 0 END IF
   #151105-00008#6--add--end--lujh
   
   LET g_xrce_t.xrce109 = g_xrce_t.xrce109 - l_xrce109 - l_xrce109_1 - l_xrfc103      #20150924 add l_xrce109_1 lujh
   LET g_xrce_t.xrce119 = g_xrce_t.xrce119 - l_xrce119 - l_xrce119_1 - l_xrfc104      #20150924 add l_xrce119_1 lujh
   LET g_xrce_t.xrce129 = g_xrce_t.xrce129 - l_xrce129 - l_xrce129_1                  #20150924 add l_xrce129_1 lujh
   LET g_xrce_t.xrce139 = g_xrce_t.xrce139 - l_xrce139 - l_xrce139_1                  #20150924 add l_xrce139_1 lujh
   
   LET g_xrce_d[l_ac].xrce001 = g_xrce_t.xrce001  #170828-00038#1 add 
   LET g_xrce_d[l_ac].xrceorga = g_xrce_t.xrceorga
   LET g_xrce_d[l_ac].xrce024 = g_xrce_t.xrce024
   LET g_xrce_d[l_ac].xrce025 = g_xrce_t.xrce025
   LET g_xrce3_d[l_ac].xrce008 = g_xrce_t.xrce008
   LET g_xrce3_d[l_ac].xrce003 = g_xrce_t.xrce003
   LET g_xrce3_d[l_ac].xrce004 = g_xrce_t.xrce004
   LET g_xrce3_d[l_ac].xrce005 = g_xrce_t.xrce005
   LET g_xrce3_d[l_ac].xrce100 = g_xrce_t.xrce100
   
   #170831-00033#1 add2 (S) --- 
   LET g_xrce_d[l_ac].xrcecomp = g_xrce_t.xrcecomp 
   LET g_xrce3_d[l_ac].xrce017 = g_xrce_t.xrce017
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_xrce3_d[l_ac].xrce017
   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
   LET g_xrce3_d[l_ac].xrce017_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_xrce3_d[l_ac].xrce017_desc
   LET g_xrce3_d[l_ac].xrce018 = g_xrce_t.xrce018
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_xrce3_d[l_ac].xrce018
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_xrce3_d[l_ac].xrce018_u_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_xrce3_d[l_ac].xrce018_u_desc
   #170831-00033#1 add2 (E) ---
   
   
   LET g_xrce_d[l_ac].xrce101 = g_xrce_t.xrce101
   LET g_xrce_d[l_ac].xrce109 = g_xrce_t.xrce109
   LET g_xrce3_d[l_ac].xrce109 = g_xrce_t.xrce109
   LET g_xrce_d[l_ac].xrce119 = g_xrce_t.xrce119
   LET g_xrce2_d[l_ac].xrce119 = g_xrce_t.xrce119
   LET g_xrce3_d[l_ac].xrce119 = g_xrce_t.xrce119
   LET g_xrce3_d[l_ac].xrce010 = g_xrce_t.xrce010
   LET g_xrce3_d[l_ac].xrce018  = g_xrce_t.xrce018
   LET g_xrce_d[l_ac].xrce109 = g_xrce_t.xrce109
   LET g_xrce2_d[l_ac].xrce101 = g_xrce_t.xrce101
   LET g_xrce2_d[l_ac].xrce121 = g_xrce_t.xrce121
   LET g_xrce2_d[l_ac].xrce129 = g_xrce_t.xrce129
   LET g_xrce2_d[l_ac].xrce131 = g_xrce_t.xrce131
   LET g_xrce2_d[l_ac].xrce139 = g_xrce_t.xrce139
   #170621-00032#1-----s
   LET g_xrce3_d[l_ac].xrce040 = l_xrcb_t.xrcb034
   LET g_xrce3_d[l_ac].l_xrce040_desc = s_desc_get_oojdl003_desc(g_xrce3_d[l_ac].xrce040)
   DISPLAY BY NAME g_xrce3_d[l_ac].xrce040,g_xrce3_d[l_ac].l_xrce040_desc
   #170621-00032#1-----e
   #170816-00068#1 add --s--
   LET g_xrce_d[l_ac].xrce100 = g_xrce_t.xrce100 
   LET g_xrce_d[l_ac].xrce104 = g_xrce_t.xrce104 
   LET g_xrce_d[l_ac].xrce114 = g_xrce_t.xrce114 
   LET g_xrce_d[l_ac].xrce027 = g_xrce_t.xrce027 
   LET g_xrce_d[l_ac].xrce010 = g_xrce_t.xrce010
   LET g_xrce_d[l_ac].xrce015 = g_xrce_t.xrce015
   LET g_xrce_d[l_ac].xrce016 = g_xrce_t.xrce016   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_xrce_d[l_ac].xrce016
   CALL ap_ref_array2(g_ref_fields,"SELECT glacl004 FROM glacl_t WHERE glaclent='"||g_enterprise||"' AND glacl001='"||g_glaa_t.glaa004||"' AND glacl002=? AND glacl003='"||g_lang||"'","") RETURNING g_rtn_fields
   LET g_xrce_d[l_ac].xrce016_desc_1 = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_xrce_d[l_ac].xrce016_desc_1
   #170816-00068#1 add --e--
   #171016-00011#3 -s 171018 add by 08172
   LET g_xrce3_d[l_ac].xrce017 = g_xrce_t.xrce017  
   LET g_xrce3_d[l_ac].xrce018 = g_xrce_t.xrce018  
   LET g_xrce3_d[l_ac].xrce019 = g_xrce_t.xrce019  
   LET g_xrce3_d[l_ac].xrce020 = g_xrce_t.xrce020  
   LET g_xrce3_d[l_ac].xrce022 = g_xrce_t.xrce022  
   LET g_xrce3_d[l_ac].xrce023 = g_xrce_t.xrce023   
   LET g_xrce3_d[l_ac].xrce035 = g_xrce_t.xrce035   
   LET g_xrce3_d[l_ac].xrce036 = g_xrce_t.xrce036   
   LET g_xrce3_d[l_ac].xrce039 = g_xrce_t.xrce039   
   LET g_xrce3_d[l_ac].xrce040 = g_xrce_t.xrce040   
   LET g_xrce3_d[l_ac].xrce041 = g_xrce_t.xrce041   
   LET g_xrce3_d[l_ac].xrce042 = g_xrce_t.xrce042   
   LET g_xrce3_d[l_ac].xrce043 = g_xrce_t.xrce043   
   LET g_xrce3_d[l_ac].xrce044 = g_xrce_t.xrce044   
   LET g_xrce3_d[l_ac].xrce045 = g_xrce_t.xrce045   
   LET g_xrce3_d[l_ac].xrce046 = g_xrce_t.xrce046   
   LET g_xrce3_d[l_ac].xrce047 = g_xrce_t.xrce047   
   LET g_xrce3_d[l_ac].xrce048 = g_xrce_t.xrce048   
   LET g_xrce3_d[l_ac].xrce049 = g_xrce_t.xrce049   
   LET g_xrce3_d[l_ac].xrce050 = g_xrce_t.xrce050   
   LET g_xrce3_d[l_ac].xrce051 = g_xrce_t.xrce051   
   CALL axrt300_02_xrce035_desc('287',g_xrce3_d[l_ac].xrce035) RETURNING g_xrce3_d[l_ac].xrce035_desc
   LET g_xrce3_d[l_ac].xrce035_desc = g_xrce3_d[l_ac].xrce035 CLIPPED,g_xrce3_d[l_ac].xrce035_desc
   CALL axrt300_02_xrce035_desc('281',g_xrce3_d[l_ac].xrce036) RETURNING g_xrce3_d[l_ac].xrce036_desc
   LET g_xrce3_d[l_ac].xrce036_desc = g_xrce3_d[l_ac].xrce036 CLIPPED,g_xrce3_d[l_ac].xrce036_desc
   CALL s_desc_get_acc_desc('2002',g_xrce3_d[l_ac].xrce041) RETURNING g_xrce3_d[l_ac].xrce041_desc
   LET g_xrce3_d[l_ac].xrce041_desc = g_xrce3_d[l_ac].xrce041 CLIPPED,g_xrce3_d[l_ac].xrce041_desc
   SELECT glad017,glad0171,glad0172,glad018,glad0181,glad0182,
          glad019,glad0191,glad0192,glad020,glad0201,glad0202,
          glad021,glad0211,glad0212,glad022,glad0221,glad0222,
          glad023,glad0231,glad0232,glad024,glad0221,glad0242,
          glad025,glad0251,glad0252,glad026,glad0261,glad0262
    INTO  g_glad017,g_glad0171,g_glad0172,g_glad018,g_glad0181,g_glad0182,
          g_glad019,g_glad0191,g_glad0192,g_glad020,g_glad0201,g_glad0202,
          g_glad021,g_glad0211,g_glad0212,g_glad022,g_glad0221,g_glad0222,
          g_glad023,g_glad0231,g_glad0232,g_glad024,g_glad0241,g_glad0242,
          g_glad025,g_glad0251,g_glad0252,g_glad026,g_glad0261,g_glad0262
    FROM  glad_t
    WHERE gladent = g_enterprise
      AND gladld = g_xrca_t.xrcald
      AND glad001 = g_xrce_d[l_ac].xrce016 
   CALL axrt300_02_free_account_desc(g_glad0171,g_xrce3_d[l_ac].xrce042) RETURNING g_xrce3_d[l_ac].xrce042_desc
   LET g_xrce3_d[l_ac].xrce042_desc = g_xrce3_d[l_ac].xrce042 CLIPPED ,g_xrce3_d[l_ac].xrce042_desc
   CALL axrt300_02_free_account_desc(g_glad0181,g_xrce3_d[l_ac].xrce043) RETURNING g_xrce3_d[l_ac].xrce043_desc
   LET g_xrce3_d[l_ac].xrce043_desc = g_xrce3_d[l_ac].xrce043 CLIPPED ,g_xrce3_d[l_ac].xrce043_desc
   CALL axrt300_02_free_account_desc(g_glad0191,g_xrce3_d[l_ac].xrce044) RETURNING g_xrce3_d[l_ac].xrce044_desc
   LET g_xrce3_d[l_ac].xrce044_desc = g_xrce3_d[l_ac].xrce044 CLIPPED ,g_xrce3_d[l_ac].xrce044_desc
   CALL axrt300_02_free_account_desc(g_glad0201,g_xrce3_d[l_ac].xrce045) RETURNING g_xrce3_d[l_ac].xrce045_desc
   LET g_xrce3_d[l_ac].xrce045_desc = g_xrce3_d[l_ac].xrce045 CLIPPED ,g_xrce3_d[l_ac].xrce045_desc
   CALL axrt300_02_free_account_desc(g_glad0211,g_xrce3_d[l_ac].xrce046) RETURNING g_xrce3_d[l_ac].xrce046_desc
   LET g_xrce3_d[l_ac].xrce046_desc = g_xrce3_d[l_ac].xrce046 CLIPPED ,g_xrce3_d[l_ac].xrce046_desc
   CALL axrt300_02_free_account_desc(g_glad0221,g_xrce3_d[l_ac].xrce047) RETURNING g_xrce3_d[l_ac].xrce047_desc
   LET g_xrce3_d[l_ac].xrce047_desc = g_xrce3_d[l_ac].xrce047 CLIPPED ,g_xrce3_d[l_ac].xrce047_desc
   CALL axrt300_02_free_account_desc(g_glad0231,g_xrce3_d[l_ac].xrce048) RETURNING g_xrce3_d[l_ac].xrce048_desc
   LET g_xrce3_d[l_ac].xrce048_desc = g_xrce3_d[l_ac].xrce048 CLIPPED ,g_xrce3_d[l_ac].xrce048_desc
   CALL axrt300_02_free_account_desc(g_glad0241,g_xrce3_d[l_ac].xrce049) RETURNING g_xrce3_d[l_ac].xrce049_desc
   LET g_xrce3_d[l_ac].xrce049_desc = g_xrce3_d[l_ac].xrce049 CLIPPED ,g_xrce3_d[l_ac].xrce049_desc
   CALL axrt300_02_free_account_desc(g_glad0251,g_xrce3_d[l_ac].xrce050) RETURNING g_xrce3_d[l_ac].xrce050_desc
   LET g_xrce3_d[l_ac].xrce050_desc = g_xrce3_d[l_ac].xrce050 CLIPPED ,g_xrce3_d[l_ac].xrce050_desc
   CALL axrt300_02_free_account_desc(g_glad0261,g_xrce3_d[l_ac].xrce051) RETURNING g_xrce3_d[l_ac].xrce051_desc
   LET g_xrce3_d[l_ac].xrce051_desc = g_xrce3_d[l_ac].xrce051 CLIPPED ,g_xrce3_d[l_ac].xrce051_desc
   #171016-00011#3 -e 171018 add by 08172
   DISPLAY g_xrce_d[l_ac].xrce024,g_xrce_d[l_ac].xrce025,g_xrce3_d[l_ac].xrce008,g_xrce3_d[l_ac].xrce003,
           g_xrce3_d[l_ac].xrce004,g_xrce3_d[l_ac].xrce005,g_xrce3_d[l_ac].xrce100,g_xrce3_d[l_ac].xrce101,
           g_xrce_d[l_ac].xrce109,g_xrce3_d[l_ac].xrce119,g_xrce3_d[l_ac].xrce010,g_xrce3_d[l_ac].xrce018,
           g_xrce_d[l_ac].xrce109,g_xrce_d[l_ac].xrceorga
        TO s_detail3[l_ac].xrce024_1,s_detail3[l_ac].xrce025_1,s_detail3[l_ac].xrce008_1,s_detail3[l_ac].xrce003_1,
           s_detail3[l_ac].xrce004_1,s_detail3[l_ac].xrce005_1,s_detail3[l_ac].xrce100_1,s_detail3[l_ac].xrce101_1,
           s_detail3[l_ac].xrce109_1,s_detail3[l_ac].xrce119_1,s_detail3[l_ac].xrce010_1,s_detail3[l_ac].xrce018_1,
           s_detail3[l_ac].xrce109_1,s_detail3[l_ac].xrceorga_1

   #170816-00068#1 add --s--
   DISPLAY g_xrce_d[l_ac].xrce100,g_xrce_d[l_ac].xrce104,g_xrce_d[l_ac].xrce114,g_xrce_d[l_ac].xrce027,
           g_xrce_d[l_ac].xrce010,g_xrce_d[l_ac].xrce015,g_xrce_d[l_ac].xrce016,g_xrce_d[l_ac].xrce016_desc_1
        TO s_detail1[l_ac].xrce100,s_detail1[l_ac].xrce104,s_detail1[l_ac].xrce114,s_detail1[l_ac].xrce027,
           s_detail1[l_ac].xrce010,s_detail1[l_ac].xrce015,s_detail1[l_ac].xrce016,s_detail1[l_ac].xrce016_desc_1 
   #170816-00068#1 add --e--
   #171016-00011#3 -s 171018 add by 08172
   DISPLAY g_xrce3_d[l_ac].xrce035_desc,g_xrce3_d[l_ac].xrce036_desc,g_xrce3_d[l_ac].xrce041_desc,
           g_xrce3_d[l_ac].xrce042_desc,g_xrce3_d[l_ac].xrce043_desc,g_xrce3_d[l_ac].xrce044_desc,
           g_xrce3_d[l_ac].xrce045_desc,g_xrce3_d[l_ac].xrce046_desc,g_xrce3_d[l_ac].xrce047_desc,
           g_xrce3_d[l_ac].xrce048_desc,g_xrce3_d[l_ac].xrce049_desc,g_xrce3_d[l_ac].xrce050_desc,
           g_xrce3_d[l_ac].xrce051_desc
        TO s_detail3[l_ac].xrce035_desc,s_detail3[l_ac].xrce036_desc,s_detail3[l_ac].xrce041_desc,
           s_detail3[l_ac].xrce042_desc,s_detail3[l_ac].xrce043_desc,s_detail3[l_ac].xrce044_desc,
           s_detail3[l_ac].xrce045_desc,s_detail3[l_ac].xrce046_desc,s_detail3[l_ac].xrce047_desc,
           s_detail3[l_ac].xrce048_desc,s_detail3[l_ac].xrce049_desc,s_detail3[l_ac].xrce050_desc,
           s_detail3[l_ac].xrce051_desc
   #171016-00011#3 -e 171018 add by 08172   
END FUNCTION
################################################################################
# Descriptions...: 多帳期明細新增进xrcc_t
# Memo...........:
# Usage..........: CALL axrt300_02_ins_xrce_04()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION axrt300_02_ins_xrce_04(p_xrce002)
   DEFINE p_xrce002      LIKE xrce_t.xrce002
   DEFINE l_xrce109      LIKE xrce_t.xrce109
   DEFINE l_xrce119      LIKE xrce_t.xrce119
   DEFINE l_xrce129      LIKE xrce_t.xrce129
   DEFINE l_xrce139      LIKE xrce_t.xrce139
   DEFINE l_gzcb003      LIKE gzcb_t.gzcb003
   DEFINE l_count        LIKE type_t.num5
   DEFINE l_ls_s         LIKE type_t.num5
   DEFINE l_sql          STRING
   #161128-00061#4---mdofiy--begin---------
   #DEFINE l_xrca_t       RECORD LIKE xrca_t.*
   #DEFINE l_xrcc_t       RECORD LIKE xrcc_t.*
   #DEFINE l_xrce_t       RECORD LIKE xrce_t.*
   DEFINE l_xrca_t RECORD  #應收憑單單頭
       xrcaent LIKE xrca_t.xrcaent, #企業編號
       xrcaownid LIKE xrca_t.xrcaownid, #資料所有者
       xrcaowndp LIKE xrca_t.xrcaowndp, #資料所屬部門
       xrcacrtid LIKE xrca_t.xrcacrtid, #資料建立者
       xrcacrtdp LIKE xrca_t.xrcacrtdp, #資料建立部門
       xrcacrtdt LIKE xrca_t.xrcacrtdt, #資料創建日
       xrcamodid LIKE xrca_t.xrcamodid, #資料修改者
       xrcamoddt LIKE xrca_t.xrcamoddt, #最近修改日
       xrcacnfid LIKE xrca_t.xrcacnfid, #資料確認者
       xrcacnfdt LIKE xrca_t.xrcacnfdt, #資料確認日
       xrcapstid LIKE xrca_t.xrcapstid, #資料過帳者
       xrcapstdt LIKE xrca_t.xrcapstdt, #資料過帳日
       xrcastus LIKE xrca_t.xrcastus, #狀態碼
       xrcacomp LIKE xrca_t.xrcacomp, #法人
       xrcald LIKE xrca_t.xrcald, #帳套
       xrcadocno LIKE xrca_t.xrcadocno, #應收帳款單號碼
       xrcadocdt LIKE xrca_t.xrcadocdt, #帳款日期
       xrca001 LIKE xrca_t.xrca001, #帳款單性質
       xrcasite LIKE xrca_t.xrcasite, #帳務中心
       xrca003 LIKE xrca_t.xrca003, #帳務人員
       xrca004 LIKE xrca_t.xrca004, #帳款客戶編號
       xrca005 LIKE xrca_t.xrca005, #收款客戶
       xrca006 LIKE xrca_t.xrca006, #客戶分類
       xrca007 LIKE xrca_t.xrca007, #帳款類別
       xrca008 LIKE xrca_t.xrca008, #收款條件編號
       xrca009 LIKE xrca_t.xrca009, #應收款日/應扣抵日
       xrca010 LIKE xrca_t.xrca010, #容許票據到期日
       xrca011 LIKE xrca_t.xrca011, #稅別
       xrca012 LIKE xrca_t.xrca012, #稅率
       xrca013 LIKE xrca_t.xrca013, #含稅否
       xrca014 LIKE xrca_t.xrca014, #人員編號
       xrca015 LIKE xrca_t.xrca015, #部門編號
       xrca016 LIKE xrca_t.xrca016, #來源作業類型
       xrca017 LIKE xrca_t.xrca017, #產生方式
       xrca018 LIKE xrca_t.xrca018, #來源參考單號
       xrca019 LIKE xrca_t.xrca019, #系統產生對應單號(待抵帳款-預收)
       xrca020 LIKE xrca_t.xrca020, #信用狀申請流程否
       xrca021 LIKE xrca_t.xrca021, #商業發票號碼(IV no.)
       xrca022 LIKE xrca_t.xrca022, #出口報單號碼
       xrca023 LIKE xrca_t.xrca023, #發票客戶編號
       xrca024 LIKE xrca_t.xrca024, #發票客戶統一編號
       xrca025 LIKE xrca_t.xrca025, #發票客戶全名
       xrca026 LIKE xrca_t.xrca026, #發票客戶地址
       xrca028 LIKE xrca_t.xrca028, #發票類型
       xrca029 LIKE xrca_t.xrca029, #發票匯率
       xrca030 LIKE xrca_t.xrca030, #發票應開未稅金額
       xrca031 LIKE xrca_t.xrca031, #發票應開稅額
       xrca032 LIKE xrca_t.xrca032, #發票應開含稅金額
       xrca033 LIKE xrca_t.xrca033, #專案編號
       xrca034 LIKE xrca_t.xrca034, #責任中心
       xrca035 LIKE xrca_t.xrca035, #應收(借方)科目編號
       xrca036 LIKE xrca_t.xrca036, #收入(貸方)科目編號
       xrca037 LIKE xrca_t.xrca037, #分錄傳票產生否
       xrca038 LIKE xrca_t.xrca038, #拋轉傳票號碼
       xrca039 LIKE xrca_t.xrca039, #會計檢核附件份數
       xrca040 LIKE xrca_t.xrca040, #留置否
       xrca041 LIKE xrca_t.xrca041, #留置理由碼
       xrca042 LIKE xrca_t.xrca042, #留置設定日期
       xrca043 LIKE xrca_t.xrca043, #留置解除日期
       xrca044 LIKE xrca_t.xrca044, #留置原幣金額
       xrca045 LIKE xrca_t.xrca045, #留置說明
       xrca046 LIKE xrca_t.xrca046, #關係人否
       xrca047 LIKE xrca_t.xrca047, #多角序號
       xrca048 LIKE xrca_t.xrca048, #集團代收/代付單號
       xrca049 LIKE xrca_t.xrca049, #來源營運中心編號
       xrca050 LIKE xrca_t.xrca050, #交易原始單據份數
       xrca051 LIKE xrca_t.xrca051, #作廢理由碼
       xrca052 LIKE xrca_t.xrca052, #列印次數
       xrca053 LIKE xrca_t.xrca053, #備註
       xrca054 LIKE xrca_t.xrca054, #多帳期設定
       xrca055 LIKE xrca_t.xrca055, #繳款優惠條件
       xrca056 LIKE xrca_t.xrca056, #會計檢核附件狀態
       xrca057 LIKE xrca_t.xrca057, #交易對象識別碼
       xrca058 LIKE xrca_t.xrca058, #銷售分類
       xrca059 LIKE xrca_t.xrca059, #預算編號
       xrca060 LIKE xrca_t.xrca060, #發票開立原則
       xrca061 LIKE xrca_t.xrca061, #預計開立發票日期
       xrca062 LIKE xrca_t.xrca062, #多角性質
       xrca063 LIKE xrca_t.xrca063, #整帳批序號
       xrca064 LIKE xrca_t.xrca064, #訂金序次
       xrca065 LIKE xrca_t.xrca065, #發票編號
       xrca066 LIKE xrca_t.xrca066, #發票號碼
       xrca100 LIKE xrca_t.xrca100, #交易原幣別
       xrca101 LIKE xrca_t.xrca101, #原幣匯率
       xrca103 LIKE xrca_t.xrca103, #原幣未稅金額
       xrca104 LIKE xrca_t.xrca104, #原幣稅額
       xrca106 LIKE xrca_t.xrca106, #原幣直接折抵合計金額
       xrca107 LIKE xrca_t.xrca107, #原幣直接沖帳(調整)合計金額
       xrca108 LIKE xrca_t.xrca108, #原幣應收金額
       xrca113 LIKE xrca_t.xrca113, #本幣未稅金額
       xrca114 LIKE xrca_t.xrca114, #本幣稅額
       xrca116 LIKE xrca_t.xrca116, #本幣直接沖帳(調整)合計金額
       xrca117 LIKE xrca_t.xrca117, #本幣直接沖帳(調整)合計金額
       xrca118 LIKE xrca_t.xrca118, #本幣應收金額
       xrca120 LIKE xrca_t.xrca120, #本位幣二幣別
       xrca121 LIKE xrca_t.xrca121, #本位幣二匯率
       xrca123 LIKE xrca_t.xrca123, #本位幣二未稅金額
       xrca124 LIKE xrca_t.xrca124, #本位幣二稅額
       xrca126 LIKE xrca_t.xrca126, #本位幣二直接折抵合計金額
       xrca127 LIKE xrca_t.xrca127, #本位幣二直接沖帳(調整)合計金額
       xrca128 LIKE xrca_t.xrca128, #本位幣二應收金額
       xrca130 LIKE xrca_t.xrca130, #本位幣三幣別
       xrca131 LIKE xrca_t.xrca131, #本位幣三匯率
       xrca133 LIKE xrca_t.xrca133, #本位幣三未稅金額
       xrca134 LIKE xrca_t.xrca134, #本位幣三稅額
       xrca136 LIKE xrca_t.xrca136, #本位幣三直接折抵合計金額
       xrca137 LIKE xrca_t.xrca137, #本位幣三直接沖帳(調整)合計金額
       xrca138 LIKE xrca_t.xrca138  #本位幣三應收金額
       END RECORD
   DEFINE l_xrcc_t RECORD  #多帳期明細
       xrccent LIKE xrcc_t.xrccent, #企業編號
       xrccld LIKE xrcc_t.xrccld, #帳套
       xrcccomp LIKE xrcc_t.xrcccomp, #法人
       xrccdocno LIKE xrcc_t.xrccdocno, #應收帳款單號碼
       xrccseq LIKE xrcc_t.xrccseq, #項次
       xrcc001 LIKE xrcc_t.xrcc001, #期別
       xrcc002 LIKE xrcc_t.xrcc002, #應收收款類別
       xrcc003 LIKE xrcc_t.xrcc003, #應收款日
       xrcc004 LIKE xrcc_t.xrcc004, #容許票據到期日
       xrcc005 LIKE xrcc_t.xrcc005, #帳款起算日
       xrcc006 LIKE xrcc_t.xrcc006, #正負值
       xrcclegl LIKE xrcc_t.xrcclegl, #核算組織
       xrcc008 LIKE xrcc_t.xrcc008, #發票編號
       xrcc009 LIKE xrcc_t.xrcc009, #發票號碼
       xrccsite LIKE xrcc_t.xrccsite, #帳務中心
       xrcc010 LIKE xrcc_t.xrcc010, #發票日期
       xrcc011 LIKE xrcc_t.xrcc011, #出貨單據日期
       xrcc012 LIKE xrcc_t.xrcc012, #立帳日期
       xrcc013 LIKE xrcc_t.xrcc013, #交易認定日期
       xrcc014 LIKE xrcc_t.xrcc014, #出入庫扣帳日期
       xrcc100 LIKE xrcc_t.xrcc100, #交易原幣別
       xrcc101 LIKE xrcc_t.xrcc101, #原幣匯率
       xrcc102 LIKE xrcc_t.xrcc102, #原幣重估後匯率
       xrcc103 LIKE xrcc_t.xrcc103, #重評價調整數
       xrcc104 LIKE xrcc_t.xrcc104, #No Use
       xrcc105 LIKE xrcc_t.xrcc105, #No Use
       xrcc106 LIKE xrcc_t.xrcc106, #No Use
       xrcc107 LIKE xrcc_t.xrcc107, #No Use
       xrcc108 LIKE xrcc_t.xrcc108, #原幣應收金額
       xrcc109 LIKE xrcc_t.xrcc109, #原幣收款沖帳金額
       xrcc113 LIKE xrcc_t.xrcc113, #本幣重評價調整數
       xrcc114 LIKE xrcc_t.xrcc114, #No Use
       xrcc115 LIKE xrcc_t.xrcc115, #No Use
       xrcc116 LIKE xrcc_t.xrcc116, #No Use
       xrcc117 LIKE xrcc_t.xrcc117, #No Use
       xrcc118 LIKE xrcc_t.xrcc118, #本幣應收金額
       xrcc119 LIKE xrcc_t.xrcc119, #本幣收款沖帳金額
       xrcc120 LIKE xrcc_t.xrcc120, #本位幣二幣別
       xrcc121 LIKE xrcc_t.xrcc121, #本位幣二匯率
       xrcc122 LIKE xrcc_t.xrcc122, #本位幣二重估後匯率
       xrcc123 LIKE xrcc_t.xrcc123, #本位幣二重評價調整數
       xrcc124 LIKE xrcc_t.xrcc124, #No Use
       xrcc125 LIKE xrcc_t.xrcc125, #No Use
       xrcc126 LIKE xrcc_t.xrcc126, #No Use
       xrcc127 LIKE xrcc_t.xrcc127, #No Use
       xrcc128 LIKE xrcc_t.xrcc128, #本位幣二應收金額
       xrcc129 LIKE xrcc_t.xrcc129, #本位幣二收款沖帳金額
       xrcc130 LIKE xrcc_t.xrcc130, #本位幣三幣別
       xrcc131 LIKE xrcc_t.xrcc131, #本位幣三匯率
       xrcc132 LIKE xrcc_t.xrcc132, #本位幣三重估後匯率
       xrcc133 LIKE xrcc_t.xrcc133, #本位幣三重評價調整數
       xrcc134 LIKE xrcc_t.xrcc134, #No Use
       xrcc135 LIKE xrcc_t.xrcc135, #No Use
       xrcc136 LIKE xrcc_t.xrcc136, #No Use
       xrcc137 LIKE xrcc_t.xrcc137, #No Use
       xrcc138 LIKE xrcc_t.xrcc138, #本位幣三應收金額
       xrcc139 LIKE xrcc_t.xrcc139, #本位幣三收款沖帳金額
       xrcc015 LIKE xrcc_t.xrcc015, #收款條件
       xrcc016 LIKE xrcc_t.xrcc016, #帳款類型
       xrcc017 LIKE xrcc_t.xrcc017  #訂單單號
       END RECORD
   DEFINE l_xrce_t RECORD  #應收沖銷明細檔
       xrceent LIKE xrce_t.xrceent, #企業編號
       xrcecomp LIKE xrce_t.xrcecomp, #法人
       xrceld LIKE xrce_t.xrceld, #帳套
       xrcedocno LIKE xrce_t.xrcedocno, #沖銷單單號
       xrceseq LIKE xrce_t.xrceseq, #項次
       xrcelegl LIKE xrce_t.xrcelegl, #no use
       xrcesite LIKE xrce_t.xrcesite, #帳務中心
       xrceorga LIKE xrce_t.xrceorga, #帳務歸屬組織
       xrce001 LIKE xrce_t.xrce001, #來源作業
       xrce002 LIKE xrce_t.xrce002, #沖銷類型
       xrce003 LIKE xrce_t.xrce003, #沖銷帳款單單號
       xrce004 LIKE xrce_t.xrce004, #沖銷帳款單項次
       xrce005 LIKE xrce_t.xrce005, #沖銷帳款單帳期
       xrce006 LIKE xrce_t.xrce006, #no use
       xrce007 LIKE xrce_t.xrce007, #no use
       xrce008 LIKE xrce_t.xrce008, #no use
       xrce009 LIKE xrce_t.xrce009, #no use
       xrce010 LIKE xrce_t.xrce010, #摘要說明
       xrce011 LIKE xrce_t.xrce011, #no use
       xrce012 LIKE xrce_t.xrce012, #no use
       xrce013 LIKE xrce_t.xrce013, #no use
       xrce014 LIKE xrce_t.xrce014, #no use
       xrce015 LIKE xrce_t.xrce015, #沖銷加減項
       xrce016 LIKE xrce_t.xrce016, #沖銷科目
       xrce017 LIKE xrce_t.xrce017, #業務人員
       xrce018 LIKE xrce_t.xrce018, #業務部門
       xrce019 LIKE xrce_t.xrce019, #責任中心
       xrce020 LIKE xrce_t.xrce020, #產品類別
       xrce021 LIKE xrce_t.xrce021, #no use
       xrce022 LIKE xrce_t.xrce022, #專案編號
       xrce023 LIKE xrce_t.xrce023, #WBS編號
       xrce024 LIKE xrce_t.xrce024, #第二參考單號
       xrce025 LIKE xrce_t.xrce025, #第二參考單號項次
       xrce026 LIKE xrce_t.xrce026, #no use
       xrce027 LIKE xrce_t.xrce027, #應稅折抵否
       xrce028 LIKE xrce_t.xrce028, #產生方式
       xrce029 LIKE xrce_t.xrce029, #傳票號碼
       xrce030 LIKE xrce_t.xrce030, #傳票項次
       xrce035 LIKE xrce_t.xrce035, #區域
       xrce036 LIKE xrce_t.xrce036, #客戶分類
       xrce037 LIKE xrce_t.xrce037, #no use
       xrce038 LIKE xrce_t.xrce038, #對象
       xrce039 LIKE xrce_t.xrce039, #經營方式
       xrce040 LIKE xrce_t.xrce040, #通路
       xrce041 LIKE xrce_t.xrce041, #品牌
       xrce042 LIKE xrce_t.xrce042, #自由核算項一
       xrce043 LIKE xrce_t.xrce043, #自由核算項二
       xrce044 LIKE xrce_t.xrce044, #自由核算項三
       xrce045 LIKE xrce_t.xrce045, #自由核算項四
       xrce046 LIKE xrce_t.xrce046, #自由核算項五
       xrce047 LIKE xrce_t.xrce047, #自由核算項六
       xrce048 LIKE xrce_t.xrce048, #自由核算項七
       xrce049 LIKE xrce_t.xrce049, #自由核算項八
       xrce050 LIKE xrce_t.xrce050, #自由核算項九
       xrce051 LIKE xrce_t.xrce051, #自由核算項十
       xrce053 LIKE xrce_t.xrce053, #發票編號
       xrce054 LIKE xrce_t.xrce054, #發票號碼
       xrce100 LIKE xrce_t.xrce100, #幣別
       xrce101 LIKE xrce_t.xrce101, #匯率
       xrce104 LIKE xrce_t.xrce104, #原幣應稅折抵稅額
       xrce109 LIKE xrce_t.xrce109, #原幣沖帳金額
       xrce114 LIKE xrce_t.xrce114, #本幣應稅折抵稅額
       xrce119 LIKE xrce_t.xrce119, #本幣沖帳金額
       xrce120 LIKE xrce_t.xrce120, #本位幣二幣別
       xrce121 LIKE xrce_t.xrce121, #本位幣二匯率
       xrce124 LIKE xrce_t.xrce124, #本位幣二應稅折抵稅額
       xrce129 LIKE xrce_t.xrce129, #本位幣二沖帳金額
       xrce130 LIKE xrce_t.xrce130, #本位幣二幣別
       xrce131 LIKE xrce_t.xrce131, #本位幣三匯率
       xrce134 LIKE xrce_t.xrce134, #本位幣三應稅折抵稅額
       xrce139 LIKE xrce_t.xrce139, #本位幣三沖帳金額
       xrce055 LIKE xrce_t.xrce055, #費用編號
       xrce056 LIKE xrce_t.xrce056, #方向
       xrce057 LIKE xrce_t.xrce057, #預收待抵單號
       xrce058 LIKE xrce_t.xrce058, #應付單號
       xrce103 LIKE xrce_t.xrce103, #未稅原幣沖銷額
       xrce113 LIKE xrce_t.xrce113, #未稅本幣沖銷額
       xrce123 LIKE xrce_t.xrce123, #本位幣二未稅沖銷額
       xrce133 LIKE xrce_t.xrce133, #本位幣三未稅沖銷額
       xrce059 LIKE xrce_t.xrce059  #預收單號
       END RECORD
   #171016-00011#3 -s 171018 add by 08172
   DEFINE l_xrcb_t RECORD  
       xrcb051 LIKE xrcb_t.xrcb051, #业务人员
       xrcb010 LIKE xrcb_t.xrcb010, #业务部门
       xrcb011 LIKE xrcb_t.xrcb011, #责任中心
       xrcb012 LIKE xrcb_t.xrcb012, #产品类别
       xrcb015 LIKE xrcb_t.xrcb015, #项目编号
       xrcb016 LIKE xrcb_t.xrcb016, #WBS编号
       xrcb024 LIKE xrcb_t.xrcb024, #区域
       xrcb033 LIKE xrcb_t.xrcb033, #经营方式
       xrcb034 LIKE xrcb_t.xrcb034, #渠道
       xrcb035 LIKE xrcb_t.xrcb035, #品牌
       xrcb036 LIKE xrcb_t.xrcb036, #客群
       xrcb037 LIKE xrcb_t.xrcb037, #自由核算項一
       xrcb038 LIKE xrcb_t.xrcb038, #自由核算項二
       xrcb039 LIKE xrcb_t.xrcb039, #自由核算項三
       xrcb040 LIKE xrcb_t.xrcb040, #自由核算項四
       xrcb041 LIKE xrcb_t.xrcb041, #自由核算項五
       xrcb042 LIKE xrcb_t.xrcb042, #自由核算項六
       xrcb043 LIKE xrcb_t.xrcb043, #自由核算項七
       xrcb044 LIKE xrcb_t.xrcb044, #自由核算項八
       xrcb045 LIKE xrcb_t.xrcb045, #自由核算項九
       xrcb046 LIKE xrcb_t.xrcb046  #自由核算項十
       END RECORD
   DEFINE l_type         LIKE type_t.chr1
   #171016-00011#3 -e 171018 add by 08172
   #161128-00061#4---mdofiy--end---------
   DEFINE l_ooab002      LIKE ooab_t.ooab002
   DEFINE l_xrca060      LIKE xrca_t.xrca060
   #20150924--add--str--lujh
   DEFINE l_xrce109_1    LIKE xrce_t.xrce109
   DEFINE l_xrce119_1    LIKE xrce_t.xrce119
   DEFINE l_xrce129_1    LIKE xrce_t.xrce129
   DEFINE l_xrce139_1    LIKE xrce_t.xrce139
   #20150924--add--end--lujh
   #151105-00008#6--add--str--lujh
   DEFINE l_xrfc103      LIKE xrfc_t.xrfc103     
   DEFINE l_xrfc104      LIKE xrfc_t.xrfc104
   #151105-00008#6--add--end--lujh
   DEFINE l_gzcb005      LIKE gzcb_t.gzcb005   #160420-00001#13 Add
   #160628-00002#1--add--str--
   DEFINE l_xrce103      LIKE xrce_t.xrce103
   DEFINE l_xrce104      LIKE xrce_t.xrce104
   DEFINE l_xrce113      LIKE xrce_t.xrce113
   DEFINE l_xrce114      LIKE xrce_t.xrce114
   DEFINE l_xrce123      LIKE xrce_t.xrce123
   DEFINE l_xrce124      LIKE xrce_t.xrce124
   DEFINE l_xrce133      LIKE xrce_t.xrce133
   DEFINE l_xrce134      LIKE xrce_t.xrce134
   DEFINE l_xrce103_1    LIKE xrce_t.xrce103
   DEFINE l_xrce104_1    LIKE xrce_t.xrce104
   DEFINE l_xrce113_1    LIKE xrce_t.xrce113
   DEFINE l_xrce114_1    LIKE xrce_t.xrce114
   DEFINE l_xrce123_1    LIKE xrce_t.xrce123
   DEFINE l_xrce124_1    LIKE xrce_t.xrce124
   DEFINE l_xrce133_1    LIKE xrce_t.xrce133
   DEFINE l_xrce134_1    LIKE xrce_t.xrce134
   DEFINE l_xrce109_3    LIKE xrce_t.xrce109
   DEFINE l_xrce119_3    LIKE xrce_t.xrce119
   DEFINE l_xrce129_3    LIKE xrce_t.xrce129
   DEFINE l_xrce139_3    LIKE xrce_t.xrce139
   DEFINE l_xrca103_s    LIKE xrca_t.xrca103
   DEFINE l_xrca104_s    LIKE xrca_t.xrca104
   DEFINE l_xrca113_s    LIKE xrca_t.xrca113
   DEFINE l_xrca114_s    LIKE xrca_t.xrca114
   DEFINE l_xrca123_s    LIKE xrca_t.xrca123
   DEFINE l_xrca124_s    LIKE xrca_t.xrca124
   DEFINE l_xrca133_s    LIKE xrca_t.xrca133
   DEFINE l_xrca134_s    LIKE xrca_t.xrca134
   DEFINE l_xrca108_s    LIKE xrca_t.xrca108
   DEFINE l_xrca118_s    LIKE xrca_t.xrca118
   DEFINE l_xrca128_s    LIKE xrca_t.xrca128
   DEFINE l_xrca138_s    LIKE xrca_t.xrca138
   DEFINE l_success      LIKE type_t.chr1
   DEFINE l_errno        LIKE type_t.chr10
   #160628-00002#1--add--end
   #170616-00046#1-----s
   DEFINE l_xrca001      LIKE xrca_t.xrca001
   #170616-00046#1-----e
   #170621-00032#1-----s
   DEFINE l_xrce040      LIKE xrce_t.xrce040
   #170621-00032#1-----e

   DELETE FROM xrce_t 
    WHERE xrceent = g_enterprise
      AND xrceld = g_xrca_t.xrcald
      AND xrcedocno = g_xrca_t.xrcadocno
      AND xrceseq = g_xrce_d[l_ac].xrceseq
      AND xrce003 = g_xrce_d[l_ac].xrce003

   LET l_ooab002 = ''
   SELECT ooab002 INTO l_ooab002 FROM ooab_t
    WHERE ooabent = g_enterprise
      AND ooabsite= g_xrca_t.xrcasite
      AND ooab001 = 'S-FIN-1002'

   IF cl_null(g_xrce_d_t.xrce003) THEN 
      SELECT MAX(xrceseq) INTO l_xrce_t.xrceseq
        FROM xrce_t
       WHERE xrceent = g_enterprise 
         AND xrceld = g_xrca_t.xrcald
         AND xrcedocno = g_xrca_t.xrcadocno
      IF cl_null(l_xrce_t.xrceseq) THEN
         LET l_xrce_t.xrceseq = 1
      ELSE
         LET l_xrce_t.xrceseq = l_xrce_t.xrceseq + 1
      END IF
   ELSE
      LET l_xrce_t.xrceseq = g_xrce_d_t.xrceseq
   END IF

   #計算帳款部分
   #161128-00061#4---mdofiy--begin---------
   #LET l_sql ="SELECT * FROM xrcc_t,xrca_t,gzcb_t",
   LET l_sql ="SELECT xrccent,xrccld,xrcccomp,xrccdocno,xrccseq,xrcc001,xrcc002,xrcc003,xrcc004,xrcc005,xrcc006,",
              "xrcclegl,xrcc008,xrcc009,xrccsite,xrcc010,xrcc011,xrcc012,xrcc013,xrcc014,xrcc100,xrcc101,",
              "xrcc102,xrcc103,xrcc104,xrcc105,xrcc106,xrcc107,xrcc108,xrcc109,xrcc113,xrcc114,xrcc115,",
              "xrcc116,xrcc117,xrcc118,xrcc119,xrcc120,xrcc121,xrcc122,xrcc123,xrcc124,xrcc125,xrcc126,",
              "xrcc127,xrcc128,xrcc129,xrcc130,xrcc131,xrcc132,xrcc133,xrcc134,xrcc135,xrcc136,xrcc137,",
              "xrcc138,xrcc139,xrcc015,xrcc016,xrcc017,",
              "xrcaent,xrcaownid,xrcaowndp,xrcacrtid,xrcacrtdp,xrcacrtdt,xrcamodid,xrcamoddt,xrcacnfid,",
              "xrcacnfdt,xrcapstid,xrcapstdt,xrcastus,xrcacomp,xrcald,xrcadocno,xrcadocdt,xrca001,xrcasite,",
              "xrca003,xrca004,xrca005,xrca006,xrca007,xrca008,xrca009,xrca010,xrca011,xrca012,xrca013,",
              "xrca014,xrca015,xrca016,xrca017,xrca018,xrca019,xrca020,xrca021,xrca022,xrca023,xrca024,",
              "xrca025,xrca026,xrca028,xrca029,xrca030,xrca031,xrca032,xrca033,xrca034,xrca035,xrca036,",
              "xrca037,xrca038,xrca039,xrca040,xrca041,xrca042,xrca043,xrca044,xrca045,xrca046,xrca047,",
              "xrca048,xrca049,xrca050,xrca051,xrca052,xrca053,xrca054,xrca055,xrca056,xrca057,xrca058,",
              "xrca059,xrca060,xrca061,xrca062,xrca063,xrca064,xrca065,xrca066,xrca100,xrca101,xrca103,",
              "xrca104,xrca106,xrca107,xrca108,xrca113,xrca114,xrca116,xrca117,xrca118,xrca120,xrca121,",
              "xrca123,xrca124,xrca126,xrca127,xrca128,xrca130,xrca131,xrca133,xrca134,xrca136,xrca137,xrca138",
              #161128-00061#4---mdofiy--end---------
              " FROM xrcc_t,xrca_t,gzcb_t",
              " WHERE xrccent = '",g_enterprise,"'",
              "   AND xrccld = xrcald",
              "   AND xrccdocno = xrcadocno",
              "   AND xrccent = xrcaent ",
              "   AND xrcastus = 'Y'",
              "   AND xrca001 = gzcb002",
              "   AND gzcb003 = '1'",
              "   AND gzcb001 = '8302'",
              "   AND xrcc108 - xrcc109 > 0",
              "   AND xrca005 = '",g_xrca_t.xrca005,"'",
              "   AND (",g_qryparam.return1,")"
   
   PREPARE axrt300_02_sel_xrcc_prep FROM l_sql
   DECLARE axrt300_02_sel_xrcc_curs CURSOR FOR axrt300_02_sel_xrcc_prep

    
   SELECT gzcb003 INTO l_gzcb003 FROM gzcb_t
    WHERE gzcb002 = p_xrce002
      AND gzcb001 = '8306'
   LET l_xrce_t.xrceent = g_enterprise
   LET l_xrce_t.xrceld = g_xrca_t.xrcald
   LET l_xrce_t.xrcedocno = g_xrca_t.xrcadocno
   LET l_xrce_t.xrcesite  = g_xrca_t.xrcasite
   LET l_xrce_t.xrce002   = p_xrce002
   LET l_xrce_t.xrce010   = ''
   IF l_gzcb003 = 'D' THEN
      LET l_xrce_t.xrce015   =  'D'
   ELSE
      LET l_xrce_t.xrce015   =  'C'
   END IF
   

   FOREACH axrt300_02_sel_xrcc_curs INTO l_xrcc_t.*,l_xrca_t.*

     #160420-00001#13 Add  ---(S)---
     #重新计算訂金待抵單可沖總金額.待抵單可沖總金額應為原始單據已收款金額
     LET l_gzcb005 = ''
     SELECT gzcb005 INTO l_gzcb005 FROM gzcb_t WHERE gzcb001 = '8302' AND gzcb002 = l_xrca_t.xrca001
     IF l_gzcb005 = 'axrq342' THEN
        SELECT SUM(xrcc109),SUM(xrcc119),SUM(xrcc129),SUM(xrcc139)
          INTO l_xrcc_t.xrcc108,l_xrcc_t.xrcc118,l_xrcc_t.xrcc128,l_xrcc_t.xrcc138
          FROM xrcc_t WHERE xrccent = g_enterprise
           AND xrccld = l_xrcc_t.xrccld
           AND xrccdocno IN (
         SELECT xrca018 FROM xrca_t WHERE xrcaent = g_enterprise
            AND xrcald = l_xrca_t.xrcald
            AND xrcadocno = l_xrca_t.xrcadocno)
     END IF
     #160420-00001#13 Add  ---(E)---

      #計算預沖金額
      LET l_xrce109 = 0   LET l_xrce119 = 0
      LET l_xrce129 = 0   LET l_xrce139 = 0
      #SELECT SUM(xrce109),SUM(xrce119),SUM(xrce129),SUM(xrce139) INTO l_xrce109,l_xrce129,l_xrce129,l_xrce139   #20150924 mark lujh
      SELECT SUM(xrce109),SUM(xrce119),SUM(xrce129),SUM(xrce139) INTO l_xrce109,l_xrce119,l_xrce129,l_xrce139    #20150924 add lujh
        FROM xrce_t,xrda_t
       WHERE xrdaent   = xrceent
         AND xrdald    = xrceld
         AND xrdadocno = xrcedocno
         AND xrdald = g_xrca_t.xrcald
         AND xrce003   = l_xrcc_t.xrccdocno
         AND xrce004   = l_xrcc_t.xrccseq
         AND xrce005   = l_xrcc_t.xrcc001
         AND xrdastus  = 'N'
      IF cl_null(l_xrce109) THEN LET l_xrce109 = 0 END IF
      IF cl_null(l_xrce119) THEN LET l_xrce119 = 0 END IF
      IF cl_null(l_xrce129) THEN LET l_xrce129 = 0 END IF
      IF cl_null(l_xrce139) THEN LET l_xrce139 = 0 END IF
      
      #20150924--add--str--lujh
      #直接冲账
      SELECT SUM(xrce109),SUM(xrce119),SUM(xrce129),SUM(xrce139) 
        INTO l_xrce109_1,l_xrce119_1,l_xrce129_1,l_xrce139_1 
        FROM xrce_t,xrca_t
       WHERE xrcaent   = g_enterprise
         AND xrcald    = xrceld
         AND xrcadocno = xrcedocno
         AND xrcaent = xrceent    #170831-00033#1---add
         AND xrcald = g_xrca_t.xrcald
         AND xrce003   = l_xrcc_t.xrccdocno
         AND xrce004   = l_xrcc_t.xrccseq
         AND xrce005   = l_xrcc_t.xrcc001
         AND xrcastus  = 'N'
         
      IF cl_null(l_xrce109_1) THEN LET l_xrce109_1 = 0 END IF
      IF cl_null(l_xrce119_1) THEN LET l_xrce119_1 = 0 END IF
      IF cl_null(l_xrce129_1) THEN LET l_xrce129_1 = 0 END IF
      IF cl_null(l_xrce139_1) THEN LET l_xrce139_1 = 0 END IF
      #20150924--add--end--lujh
      
      #151105-00008#6--add--str--lujh
      #抓取axrt460已存在未审核的单子
      LET l_xrfc103 = 0   LET l_xrfc104 = 0
      SELECT SUM(xrfc103),SUM(xrfc104) INTO l_xrfc103,l_xrfc104 FROM xrfa_t,xrfc_t
       WHERE xrfaent   = g_enterprise
         AND xrfadocno = xrfcdocno
         AND xrfaent = xrfcent     #170831-00033#1---add
#         AND xrfald    = g_xrda_m.xrdald #160628-00002#1 mark
         AND xrfald    = g_xrca_t.xrcald  #160628-00002#1 add
         AND xrfc003   = l_xrcc_t.xrccdocno
         AND xrfc004   = l_xrcc_t.xrccseq
         AND xrfc005   = l_xrcc_t.xrcc001
         AND xrfastus  = 'N'
      IF cl_null(l_xrfc103) THEN LET l_xrfc103 = 0 END IF
      IF cl_null(l_xrfc104) THEN LET l_xrfc104 = 0 END IF
      #151105-00008#6--add--end--lujh
      
      LET l_xrce_t.xrcecomp = l_xrcc_t.xrcccomp
      LET l_xrce_t.xrceorga = g_xrca_t.xrcacomp
      LET l_xrce_t.xrce001  = g_prog   #'axrt400'   20150520 Mod
      LET l_xrce_t.xrce003  = l_xrcc_t.xrccdocno
      LET l_xrce_t.xrce004  = l_xrcc_t.xrccseq
      LET l_xrce_t.xrce005  = l_xrcc_t.xrcc001
      LET l_xrce_t.xrce016  = l_xrca_t.xrca035
      LET l_xrce_t.xrce017  = l_xrca_t.xrca014
      LET l_xrce_t.xrce018  = l_xrca_t.xrca015
     #LET l_xrce_t.xrce027	 = 'N'
     #150316-00013#1 By 01727 Add  ---(S)---
      SELECT xrca060 INTO l_xrca060 FROM xrca_t
       WHERE xrcald = l_xrce_t.xrceld
         AND xrcadocno = l_xrce_t.xrce003
         AND xrcaent = g_enterprise
      IF l_xrca060 = '2' THEN
         LET l_xrce_t.xrce027 = 'Y'
      ELSE
         LET l_xrce_t.xrce027 = 'N'
      END IF
      #170616-00046#1-----s
      LET l_xrca001 = NULL
      SELECT xrca001 INTO l_xrca001 FROM xrca_t
       WHERE xrcald = l_xrce_t.xrceld
         AND xrcadocno = l_xrce_t.xrce003
         AND xrcaent = g_enterprise
      IF l_xrca001 = '22' OR l_xrca001 = '29' THEN
         LET l_xrce_t.xrce027 = 'N'
      END IF
      #170616-00046#1-----e

     #150316-00013#1 By 01727 Add  ---(S)---
      LET l_xrce_t.xrce028	 = 0
      LET l_xrce_t.xrce036	 = l_xrca_t.xrca006
      LET l_xrce_t.xrce053  = l_xrcc_t.xrcc008
      LET l_xrce_t.xrce054  = l_xrcc_t.xrcc009
      LET l_xrce_t.xrce100  = l_xrcc_t.xrcc100
      LET l_xrce_t.xrce101  = l_xrcc_t.xrcc102   #20150313  xrcc101 ---->xrcc102
      LET l_xrce_t.xrce104	 = 0
      LET l_xrce_t.xrce114	 = 0
      LET l_xrce_t.xrce120  = l_xrcc_t.xrcc120
      LET l_xrce_t.xrce121  = l_xrcc_t.xrcc122
      LET l_xrce_t.xrce130  = l_xrcc_t.xrcc130
      LET l_xrce_t.xrce131  = l_xrcc_t.xrcc132
      
      LET l_xrce_t.xrce109  = l_xrcc_t.xrcc108 - l_xrcc_t.xrcc109 - l_xrce109 - l_xrce109_1 - l_xrfc103    #20150924 add l_xrce109_1 lujh  #151105-00008#6 add l_xrfc103 lujh
      LET l_xrce_t.xrce119  = l_xrcc_t.xrcc118 - l_xrcc_t.xrcc119 + l_xrcc_t.xrcc113 - l_xrce119 - l_xrce119_1 - l_xrfc104   #20150924 add l_xrce119_1 lujh   #151105-00008#6 add l_xrfc104 lujh
      IF l_xrce_t.xrce109 <= 0 THEN CONTINUE FOREACH END IF
      LET l_xrce_t.xrce129  = l_xrcc_t.xrcc128 - l_xrcc_t.xrcc129 + l_xrcc_t.xrcc123 - l_xrce129 - l_xrce129_1   #20150924 add l_xrce129_1 lujh
      LET l_xrce_t.xrce139  = l_xrcc_t.xrcc138 - l_xrcc_t.xrcc139 + l_xrcc_t.xrcc133 - l_xrce139 - l_xrce139_1   #20150924 add l_xrce139_1 lujh
      #160628-00002#1--add--str--
      #增加未税冲销额和冲销税额
      IF l_xrce_t.xrce027 = 'N' THEN
         LET l_xrce_t.xrce103 = l_xrce_t.xrce109
         LET l_xrce_t.xrce104	 = 0
         LET l_xrce_t.xrce113 = l_xrce_t.xrce119
         LET l_xrce_t.xrce114	 = 0
         LET l_xrce_t.xrce123 = l_xrce_t.xrce129
         LET l_xrce_t.xrce124	 = 0
         LET l_xrce_t.xrce133 = l_xrce_t.xrce139
         LET l_xrce_t.xrce134	 = 0
      ELSE
         #1.axrt310中立账的订金xrca108 =  收到订金款sum(xrcc109)
         IF l_xrca_t.xrca108 = l_xrcc_t.xrcc108 THEN
            #1）当所有的订金一次抵扣完时，未税金额、税额、含税金额等于订金待抵单的金额
            IF l_xrce_t.xrce109  = l_xrcc_t.xrcc108 THEN
               LET l_xrce_t.xrce103 = l_xrca_t.xrca103
               LET l_xrce_t.xrce104	= l_xrca_t.xrca104
               LET l_xrce_t.xrce113 = l_xrca_t.xrca113
               LET l_xrce_t.xrce114	= l_xrca_t.xrca114
               LET l_xrce_t.xrce123 = l_xrca_t.xrca123
               LET l_xrce_t.xrce124	= l_xrca_t.xrca124
               LET l_xrce_t.xrce133 = l_xrca_t.xrca133
               LET l_xrce_t.xrce134	= l_xrca_t.xrca134
            ELSE
            #2）当订金待抵单已存在冲抵金额，未税金额(税额)=总的未税金额(税额)-已冲抵的未税金额(税额)
               SELECT SUM(xrce103),SUM(xrce104),SUM(xrce113),SUM(xrce114),
                      SUM(xrce123),SUM(xrce124),SUM(xrce133),SUM(xrce134)
                 INTO l_xrce103,l_xrce104,l_xrce113,l_xrce114,
                      l_xrce123,l_xrce124,l_xrce133,l_xrce134           
                 FROM xrce_t,xrca_t
                WHERE xrcaent = g_enterprise
                  AND xrcald = xrceld
                  AND xrcadocno = xrcedocno
                  AND xrcaent = xrceent     #170831-00033#1---add
                  AND xrcald = g_xrca_t.xrcald
                  AND xrce003 = l_xrcc_t.xrccdocno
                  AND xrce004 = l_xrcc_t.xrccseq
                  AND xrce005 = l_xrcc_t.xrcc001
                  AND xrcastus <> 'X'
               IF cl_null(l_xrce103) THEN LET l_xrce103 = 0 END IF
               IF cl_null(l_xrce104) THEN LET l_xrce104 = 0 END IF
               IF cl_null(l_xrce113) THEN LET l_xrce113 = 0 END IF
               IF cl_null(l_xrce114) THEN LET l_xrce114 = 0 END IF
               IF cl_null(l_xrce123) THEN LET l_xrce123 = 0 END IF
               IF cl_null(l_xrce124) THEN LET l_xrce124 = 0 END IF
               IF cl_null(l_xrce133) THEN LET l_xrce133 = 0 END IF
               IF cl_null(l_xrce134) THEN LET l_xrce134 = 0 END IF
               LET l_xrce_t.xrce103 = l_xrca_t.xrca103 - l_xrce103
               LET l_xrce_t.xrce104	= l_xrca_t.xrca104 - l_xrce104
               LET l_xrce_t.xrce113 = l_xrca_t.xrca113 - l_xrce113
               LET l_xrce_t.xrce114	= l_xrca_t.xrca114 - l_xrce114
               LET l_xrce_t.xrce123 = l_xrca_t.xrca123 - l_xrce123
               LET l_xrce_t.xrce124	= l_xrca_t.xrca124 - l_xrce124
               LET l_xrce_t.xrce133 = l_xrca_t.xrca133 - l_xrce133
               LET l_xrce_t.xrce134	= l_xrca_t.xrca134 - l_xrce134
            END IF
         ELSE
         #2.axrt310中立账的订金xrca108 =  收到订金款sum(xrcc109) + 应税折抵金额sum(xrce109)
         #3.axrt310中立账的订金xrca108 <>  收到订金款sum(xrcc109),直接收到的钱不等于立账的金额
            #1)抓取订金中应税折抵金额
            SELECT SUM(xrce103),SUM(xrce104),SUM(xrce109),SUM(xrce113),SUM(xrce114),SUM(xrce119),
                   SUM(xrce123),SUM(xrce124),SUM(xrce129),SUM(xrce133),SUM(xrce134),SUM(xrce139)
              INTO l_xrce103_1,l_xrce104_1,l_xrce109_3,l_xrce113,l_xrce114_1,l_xrce119_3,
                   l_xrce123_1,l_xrce124_1,l_xrce129_3,l_xrce133,l_xrce134_1,l_xrce139_3
              FROM xrce_t,xrca_t
             WHERE xrcaent = g_enterprise
               AND xrcald = xrceld
               AND xrcadocno = xrcedocno
               AND xrcaent = xrceent    #170831-00033#1---add
               AND xrcald = l_xrca_t.xrcald
               AND xrcadocno IN (SELECT xrca018 FROM xrca_t WHERE xrcaent = g_enterprise
                                 AND xrcald = l_xrca_t.xrcald AND xrcadocno = l_xrca_t.xrcadocno)
               AND xrce027='Y'
            IF cl_null(l_xrce103_1) THEN LET l_xrce103_1 = 0 END IF
            IF cl_null(l_xrce104_1) THEN LET l_xrce104_1 = 0 END IF
            IF cl_null(l_xrce113_1) THEN LET l_xrce113_1 = 0 END IF
            IF cl_null(l_xrce114_1) THEN LET l_xrce114_1 = 0 END IF
            IF cl_null(l_xrce123_1) THEN LET l_xrce123_1 = 0 END IF
            IF cl_null(l_xrce124_1) THEN LET l_xrce124_1 = 0 END IF
            IF cl_null(l_xrce133_1) THEN LET l_xrce133_1 = 0 END IF
            IF cl_null(l_xrce134_1) THEN LET l_xrce134_1 = 0 END IF
            IF cl_null(l_xrce109_3) THEN LET l_xrce109_3 = 0 END IF
            IF cl_null(l_xrce119_3) THEN LET l_xrce119_3 = 0 END IF
            IF cl_null(l_xrce129_3) THEN LET l_xrce129_3 = 0 END IF
            IF cl_null(l_xrce139_3) THEN LET l_xrce139_3 = 0 END IF
            #2）axrt310订金单中，可冲抵的未税金额(税额)=axrt310中立账的未税金额(税额) - axrt310中应税折抵的未税金额(税额)
            LET l_xrca103_s = l_xrca_t.xrca103 - l_xrce103_1
            LET l_xrca104_s = l_xrca_t.xrca104 - l_xrce104_1
            LET l_xrca113_s = l_xrca_t.xrca113 - l_xrce113_1
            LET l_xrca114_s = l_xrca_t.xrca114 - l_xrce114_1
            LET l_xrca123_s = l_xrca_t.xrca123 - l_xrce123_1
            LET l_xrca124_s = l_xrca_t.xrca124 - l_xrce124_1
            LET l_xrca133_s = l_xrca_t.xrca133 - l_xrce133_1
            LET l_xrca134_s = l_xrca_t.xrca134 - l_xrce134_1
            #订金立账金额-冲抵的应税折抵金额
            LET l_xrca108_s = l_xrca_t.xrca108 - l_xrce109_3
            LET l_xrca118_s = l_xrca_t.xrca118 - l_xrce119_3
            LET l_xrca128_s = l_xrca_t.xrca128 - l_xrce129_3
            LET l_xrca138_s = l_xrca_t.xrca138 - l_xrce139_3
            #3)收到的钱中未税金额、税额，分别占多少
            #原币
            LET l_xrca103_s = l_xrca103_s * (l_xrcc_t.xrcc108 / l_xrca108_s)
            CALL s_curr_round_ld('1',l_xrca_t.xrcald,l_xrca_t.xrca100,l_xrca103_s,2)
            RETURNING l_success,l_errno,l_xrca103_s
            #税额 = 含税金额 - 未税金额
            LET l_xrca104_s = l_xrcc_t.xrcc108 - l_xrca103_s
            #本币
            LET l_xrca113_s = l_xrca113_s * (l_xrcc_t.xrcc118 / l_xrca118_s)
            CALL s_curr_round_ld('1',l_xrca_t.xrcald,g_glaa_t.glaa001,l_xrca113_s,2)
            RETURNING l_success,l_errno,l_xrca113_s
            LET l_xrca114_s = l_xrcc_t.xrcc118 - l_xrca113_s
            #本位币二
            LET l_xrca123_s = l_xrca123_s * (l_xrcc_t.xrcc128 / l_xrca128_s)
            CALL s_curr_round_ld('1',l_xrca_t.xrcald,l_xrca_t.xrca120,l_xrca123_s,2)
            RETURNING l_success,l_errno,l_xrca123_s
            LET l_xrca124_s = l_xrcc_t.xrcc128 - l_xrca123_s
            #本位币三
            LET l_xrca133_s = l_xrca133_s * (l_xrcc_t.xrcc138 / l_xrca138_s)
            CALL s_curr_round_ld('1',l_xrca_t.xrcald,l_xrca_t.xrca130,l_xrca133_s,2)
            RETURNING l_success,l_errno,l_xrca133_s
            LET l_xrca134_s = l_xrcc_t.xrcc138 - l_xrca133_s
            
            #4)当所有的订金一次抵扣完时，未税金额、税额、含税金额等于订金待抵单的金额
            IF l_xrce_t.xrce109  = l_xrcc_t.xrcc108 THEN
               LET l_xrce_t.xrce103 = l_xrca103_s
               LET l_xrce_t.xrce104	= l_xrca104_s
               LET l_xrce_t.xrce113 = l_xrca113_s
               LET l_xrce_t.xrce114	= l_xrca114_s
               LET l_xrce_t.xrce123 = l_xrca123_s
               LET l_xrce_t.xrce124	= l_xrca124_s
               LET l_xrce_t.xrce133 = l_xrca133_s
               LET l_xrce_t.xrce134	= l_xrca134_s
            ELSE
            #5)当订金待抵单已存在冲抵金额，未税金额(税额)=总的未税金额(税额)-已冲抵的未税金额(税额)
               SELECT SUM(xrce103),SUM(xrce104),SUM(xrce113),SUM(xrce114),
                      SUM(xrce123),SUM(xrce124),SUM(xrce133),SUM(xrce134)
                 INTO l_xrce103,l_xrce104,l_xrce113,l_xrce114,
                      l_xrce123,l_xrce124,l_xrce133,l_xrce134            
                 FROM xrce_t,xrca_t
                WHERE xrcaent = g_enterprise
                  AND xrcald = xrceld
                  AND xrcadocno = xrcedocno
                  AND xrcaent = xrceent     #170831-00033#1---add
                  AND xrcald = g_xrca_t.xrcald
                  AND xrce003 = l_xrcc_t.xrccdocno
                  AND xrce004 = l_xrcc_t.xrccseq
                  AND xrce005 = l_xrcc_t.xrcc001
                  AND xrcastus <> 'X'
               IF cl_null(l_xrce103) THEN LET l_xrce103 = 0 END IF
               IF cl_null(l_xrce104) THEN LET l_xrce104 = 0 END IF
               IF cl_null(l_xrce113) THEN LET l_xrce113 = 0 END IF
               IF cl_null(l_xrce114) THEN LET l_xrce114 = 0 END IF
               IF cl_null(l_xrce123) THEN LET l_xrce123 = 0 END IF
               IF cl_null(l_xrce124) THEN LET l_xrce124 = 0 END IF
               IF cl_null(l_xrce133) THEN LET l_xrce133 = 0 END IF
               IF cl_null(l_xrce134) THEN LET l_xrce134 = 0 END IF
               LET l_xrce_t.xrce103 = l_xrca103_s - l_xrce103
               LET l_xrce_t.xrce104	= l_xrca104_s - l_xrce104
               LET l_xrce_t.xrce113 = l_xrca113_s - l_xrce113
               LET l_xrce_t.xrce114	= l_xrca114_s - l_xrce114
               LET l_xrce_t.xrce123 = l_xrca123_s - l_xrce123
               LET l_xrce_t.xrce124	= l_xrca124_s - l_xrce124
               LET l_xrce_t.xrce133 = l_xrca133_s - l_xrce133
               LET l_xrce_t.xrce134	= l_xrca134_s - l_xrce134   
            END IF
         END IF
      END IF
      #160628-00002#1--add--end

      IF g_glaa_t.glaa015 = 'N' THEN
         LET l_xrce_t.xrce120 = ''
         LET l_xrce_t.xrce121 = 0
         LET l_xrce_t.xrce129 = 0
         LET l_xrce_t.xrce123 = 0 #160628-00002#1
         LET l_xrce_t.xrce124 = 0 #160628-00002#1
      END IF
      
      IF g_glaa_t.glaa019 = 'N' THEN
         LET l_xrce_t.xrce130 = ''
         LET l_xrce_t.xrce131 = 0
         LET l_xrce_t.xrce139 = 0
         LET l_xrce_t.xrce133 = 0 #160628-00002#1
         LET l_xrce_t.xrce134 = 0 #160628-00002#1
      END IF
      
      #170621-00032#1-----s
      LET l_xrce040 = NULL
      SELECT DISTINCT xrcb034 INTO l_xrce040 FROM xrcb_t
       WHERE xrcbent = g_enterprise
         AND xrcbdocno = l_xrca_t.xrcadocno
         AND xrcbld = l_xrca_t.xrcald
         AND xrcb034 IS NOT NULL AND xrcb034 NOT IN (' ')
      #170621-00032#1-----e

      #171016-00011#3 -s 171018 add by 08172
      INITIALIZE l_xrcb_t.* TO NULL
      IF l_ooab002 = '3' THEN
         IF l_xrca_t.xrca001 = '21' OR l_xrca_t.xrca001 = '23' THEN
            SELECT xrcb051,xrcb010,xrcb011,xrcb012,xrcb015,xrcb016,
                   xrcb024,xrcb033,xrcb034,xrcb035,xrcb036,xrcb037,xrcb038,xrcb039,
                   xrcb040,xrcb041,xrcb042,xrcb043,xrcb044,xrcb045,xrcb046
              INTO l_xrcb_t.*
              FROM xrcb_t
             WHERE xrcbent = g_enterprise
               AND xrcbld = l_xrca_t.xrcald
               AND xrcbdocno IN (SELECT xrca018 
                                   FROM xrca_t 
                                  WHERE xrcaent = g_enterprise
                                    AND xrcald = l_xrca_t.xrcald
                                    AND xrcadocno = l_xrca_t.xrcadocno)
               AND xrcbseq = l_xrce_t.xrce004
         ELSE
            IF l_xrca_t.xrca001 = '24' THEN
               SELECT xrde017,xrde018,xrde019,xrde020,xrde022,xrde023,
                      xrde035,xrde039,xrde040,xrde041,xrde036,xrde042,xrde043,
                      xrde044,xrde045,xrde046,xrde047,xrde048,xrde049,xrde050,
                      xrde051
                 INTO l_xrcb_t.*
                 FROM xrde_t
                WHERE xrdeent = g_enterprise
                  AND xrdeld = l_xrca_t.xrcald
                  AND xrdedocno IN (SELECT xrca018 
                                      FROM xrca_t 
                                     WHERE xrcaent = g_enterprise
                                       AND xrcald = l_xrca_t.xrcald
                                       AND xrcadocno = l_xrca_t.xrcadocno)
                  AND xrde014 = l_xrca_t.xrcadocno
                  AND xrdeseq = l_xrce_t.xrce004
            ELSE  
               SELECT xrcb051,xrcb010,xrcb011,xrcb012,xrcb015,xrcb016,
                      xrcb024,xrcb033,xrcb034,xrcb035,xrcb036,xrcb037,xrcb038,xrcb039,
                      xrcb040,xrcb041,xrcb042,xrcb043,xrcb044,xrcb045,xrcb046
                 INTO l_xrcb_t.*
                 FROM xrcb_t
                WHERE xrcbent = g_enterprise
                  AND xrcbld = l_xrca_t.xrcald
                  AND xrcbdocno = l_xrca_t.xrcadocno
                  AND xrcbseq = l_xrce_t.xrce004
            END IF
         END IF
      ELSE
         IF l_xrca_t.xrca001 = '21' OR l_xrca_t.xrca001 = '23' THEN
            SELECT xrcb051,xrcb010,xrcb011,xrcb012,xrcb015,xrcb016,
                   xrcb024,xrcb033,xrcb034,xrcb035,xrcb036,xrcb037,xrcb038,xrcb039,
                   xrcb040,xrcb041,xrcb042,xrcb043,xrcb044,xrcb045,xrcb046
              INTO l_xrcb_t.*
              FROM xrcb_t
             WHERE xrcbent = g_enterprise
               AND xrcbld = l_xrca_t.xrcald 
               AND xrcbdocno IN (SELECT xrca018 
                                   FROM xrca_t 
                                  WHERE xrcaent = g_enterprise
                                    AND xrcald = l_xrca_t.xrcald
                                    AND xrcadocno = l_xrca_t.xrcadocno)
               AND xrcbseq = (SELECT MIN(xrcbseq) 
                                FROM xrcb_t
                               WHERE xrcbent = g_enterprise
                                 AND xrcbld = l_xrca_t.xrcald
                                 AND xrcbdocno IN (SELECT xrca018 
                                                     FROM xrca_t 
                                                    WHERE xrcaent = g_enterprise
                                                      AND xrcald = l_xrca_t.xrcald
                                                      AND xrcadocno = l_xrca_t.xrcadocno))
         ELSE
            IF l_xrca_t.xrca001 = '24' THEN
               SELECT xrde017,xrde018,xrde019,xrde020,xrde022,xrde023,
                      xrde035,xrde039,xrde040,xrde041,xrde036,xrde042,xrde043,
                      xrde044,xrde045,xrde046,xrde047,xrde048,xrde049,xrde050,
                      xrde051
                 INTO l_xrcb_t.*
                 FROM xrde_t
                WHERE xrdeent = g_enterprise
                  AND xrdeld = l_xrca_t.xrcald
                  AND xrdedocno IN (SELECT xrca018 
                                      FROM xrca_t 
                                     WHERE xrcaent = g_enterprise
                                       AND xrcald = l_xrca_t.xrcald
                                       AND xrcadocno = l_xrca_t.xrcadocno)
                  AND xrde014 = l_xrca_t.xrcadocno
                  AND xrdeseq = (SELECT MIN(xrdeseq) 
                                   FROM xrde_t
                                  WHERE xrdeent = g_enterprise
                                    AND xrdeld = l_xrca_t.xrcald
                                    AND xrdedocno IN (SELECT xrca018 
                                                        FROM xrca_t 
                                                       WHERE xrcaent = g_enterprise
                                                         AND xrcald = l_xrca_t.xrcald
                                                         AND xrcadocno = l_xrca_t.xrcadocno)
                                    AND xrde014 = l_xrca_t.xrcadocno)
            ELSE  
               SELECT xrcb051,xrcb010,xrcb011,xrcb012,xrcb015,xrcb016,
                      xrcb024,xrcb033,xrcb034,xrcb035,xrcb036,xrcb037,xrcb038,xrcb039,
                      xrcb040,xrcb041,xrcb042,xrcb043,xrcb044,xrcb045,xrcb046
                 INTO l_xrcb_t.*
                 FROM xrcb_t
                WHERE xrcbent = g_enterprise
                  AND xrcbld = l_xrca_t.xrcald
                  AND xrcbdocno = l_xrca_t.xrcadocno
                  AND xrcbseq = (SELECT MIN(xrcbseq) 
                                   FROM xrcb_t
                                  WHERE xrcbent = g_enterprise
                                    AND xrcbld = l_xrca_t.xrcald
                                    AND xrcbdocno = l_xrca_t.xrcadocno)
            END IF
         END IF
      END IF
      LET l_xrce_t.xrce017 = l_xrcb_t.xrcb051
      LET l_xrce_t.xrce018 = l_xrcb_t.xrcb010
      LET l_xrce_t.xrce019 = l_xrcb_t.xrcb011
      LET l_xrce_t.xrce020 = l_xrcb_t.xrcb012
      LET l_xrce_t.xrce022 = l_xrcb_t.xrcb015     
      LET l_xrce_t.xrce023 = l_xrcb_t.xrcb016
      LET l_xrce_t.xrce035 = l_xrcb_t.xrcb024
      LET l_xrce_t.xrce036 = l_xrcb_t.xrcb036
      LET l_xrce_t.xrce040 = l_xrcb_t.xrcb034
      LET l_xrce_t.xrce039 = l_xrcb_t.xrcb033
      LET l_xrce_t.xrce041 = l_xrcb_t.xrcb035
      LET l_xrce_t.xrce042 = l_xrcb_t.xrcb037
      LET l_xrce_t.xrce043 = l_xrcb_t.xrcb038
      LET l_xrce_t.xrce044 = l_xrcb_t.xrcb039
      LET l_xrce_t.xrce045 = l_xrcb_t.xrcb040
      LET l_xrce_t.xrce046 = l_xrcb_t.xrcb041
      LET l_xrce_t.xrce047 = l_xrcb_t.xrcb042
      LET l_xrce_t.xrce048 = l_xrcb_t.xrcb043
      LET l_xrce_t.xrce049 = l_xrcb_t.xrcb044
      LET l_xrce_t.xrce050 = l_xrcb_t.xrcb045
      LET l_xrce_t.xrce051 = l_xrcb_t.xrcb046
      #171016-00011#3 -e 171018 add by 08172
      #INSERT INTO xrce_t VALUES(l_xrce_t.*)
      INSERT INTO xrce_t(xrceent,xrcecomp,xrceorga,xrcesite,xrceld,xrcedocno,xrceseq,xrce001,xrce002,xrce003,
                         xrce004,xrce005,xrce010,xrce015,xrce016,xrce017,xrce018,xrce027,xrce028,xrce036,
                         xrce053,xrce054,xrce100,xrce101,xrce104,xrce114,xrce109,
                         xrce119,xrce120,xrce121,xrce129,xrce130,xrce131,xrce139,
                         xrce040,    #170621-00032#1
                         #171016-00011#3 -s 171018 add by 08172
                         xrce019,xrce020,xrce022,xrce023,
                         xrce035,xrce039,xrce041,xrce042,xrce043,xrce044,
                         xrce045,xrce046,xrce047,xrce048,xrce049,xrce050,xrce051,
                         #171016-00011#3 -e 171018 add by 08172
                         xrce103,xrce113,xrce123,xrce124,xrce133,xrce134 #160628-00002#1
                         )
                  VALUES(l_xrce_t.xrceent,l_xrce_t.xrcecomp ,l_xrce_t.xrceorga,l_xrce_t.xrcesite,
                         l_xrce_t.xrceld ,l_xrce_t.xrcedocno,l_xrce_t.xrceseq ,l_xrce_t.xrce001 ,
                         l_xrce_t.xrce002,l_xrce_t.xrce003  ,l_xrce_t.xrce004 ,l_xrce_t.xrce005 ,
                         l_xrce_t.xrce010,l_xrce_t.xrce015  ,l_xrce_t.xrce016 ,l_xrce_t.xrce017 ,
                         l_xrce_t.xrce018,l_xrce_t.xrce027  ,l_xrce_t.xrce028 ,l_xrce_t.xrce036 ,
                         l_xrce_t.xrce053,l_xrce_t.xrce054  ,l_xrce_t.xrce100 ,l_xrce_t.xrce101 ,
                         l_xrce_t.xrce104,l_xrce_t.xrce114  ,l_xrce_t.xrce109 ,l_xrce_t.xrce119 ,
                         l_xrce_t.xrce120,l_xrce_t.xrce121  ,l_xrce_t.xrce129 ,l_xrce_t.xrce130 ,
                         l_xrce_t.xrce131,l_xrce_t.xrce139,
                         l_xrce040,   #170621-00032#1
                         #171016-00011#3 -s 171018 add by 08172
                         l_xrce_t.xrce019,l_xrce_t.xrce020,l_xrce_t.xrce022,l_xrce_t.xrce023,
                         l_xrce_t.xrce035,l_xrce_t.xrce039,l_xrce_t.xrce041,
                         l_xrce_t.xrce042,l_xrce_t.xrce043,l_xrce_t.xrce044,
                         l_xrce_t.xrce045,l_xrce_t.xrce046,l_xrce_t.xrce047,l_xrce_t.xrce048,
                         l_xrce_t.xrce049,l_xrce_t.xrce050,l_xrce_t.xrce051,
                         #171016-00011#3 -e 171018 add by 08172
                         l_xrce_t.xrce103,l_xrce_t.xrce113, #160628-00002#1
                         l_xrce_t.xrce123,l_xrce_t.xrce124,l_xrce_t.xrce133,l_xrce_t.xrce134  #160628-00002#1
                        )
      IF SQLCA.sqlcode THEN
         LET g_success = 'N' RETURN
      END IF

      LET l_xrce_t.xrceseq = l_xrce_t.xrceseq + 1

   END FOREACH
   
END FUNCTION
################################################################################
# Descriptions...: 刷新合計金額顯示
# Memo...........:
# Usage..........: CALL axrt300_02_ref_amt()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION axrt300_02_ref_amt()
   DEFINE l_amt1,l_amt2,l_amt3,l_amt4          LIKE xrce_t.xrce109     #收款金額
   DEFINE l_amt5,l_amt6,l_amt7,l_amt8          LIKE xrce_t.xrce109     #帳款金額
   DEFINE l_amt9,l_amt10,l_amt11,l_amt12       LIKE xrce_t.xrce109     #匯差及調整金額
   DEFINE l_amt13,l_amt14,l_amt15,l_amt16      LIKE xrce_t.xrce109     #差異金額
   DEFINE l_amt17,l_amt18,l_amt19,l_amt20      LIKE xrce_t.xrce109     #差異金額
   DEFINE l_xrce109 LIKE xrce_t.xrce109
   DEFINE l_xrce119 LIKE xrce_t.xrce119
   DEFINE l_xrce129 LIKE xrce_t.xrce129
   DEFINE l_xrce139 LIKE xrce_t.xrce139
   DEFINE l_xrde109 LIKE xrde_t.xrde109
   DEFINE l_xrde119 LIKE xrde_t.xrde119
   DEFINE l_xrde129 LIKE xrde_t.xrde129
   DEFINE l_xrde139 LIKE xrde_t.xrde139
   DEFINE l_sum1    LIKE xrce_t.xrce109
   DEFINE l_sum2    LIKE xrce_t.xrce109
   DEFINE l_sum3    LIKE xrce_t.xrce109
   DEFINE l_sum4    LIKE xrce_t.xrce109
   DEFINE l_amt5_1,l_amt6_1,l_amt7_1,l_amt8_1          LIKE xrce_t.xrce109     #帳款金額  #20150323 add
   
   DISPLAY g_xrca_t.xrca100 TO xrca100
   DISPLAY g_glaa_t.glaa001,g_glaa_t.glaa016,g_glaa_t.glaa020 TO glaa001,glaa016,glaa020
   
   LET l_amt1 = g_xrca_t.xrca103 + g_xrca_t.xrca104
   LET l_amt2 = g_xrca_t.xrca113 + g_xrca_t.xrca114
   LET l_amt3 = g_xrca_t.xrca123 + g_xrca_t.xrca124
   LET l_amt4 = g_xrca_t.xrca133 + g_xrca_t.xrca134
   IF cl_null(l_amt1) THEN LET l_amt1 = 0 END IF
   IF cl_null(l_amt2) THEN LET l_amt2 = 0 END IF
   IF cl_null(l_amt3) THEN LET l_amt3 = 0 END IF
   IF cl_null(l_amt4) THEN LET l_amt4 = 0 END IF
   
   #稅前折抵金額
   SELECT SUM(xrce109),SUM(xrce119),SUM(xrce129),SUM(xrce139) INTO l_amt5,l_amt6,l_amt7,l_amt8 FROM xrce_t
    WHERE xrceent = g_enterprise
      AND xrceld  = g_xrca_t.xrcald
      AND xrcedocno = g_xrca_t.xrcadocno
      AND xrce027 = 'Y'
   IF cl_null(l_amt5) THEN LET l_amt5 = 0 END IF
   IF cl_null(l_amt6) THEN LET l_amt6 = 0 END IF
   IF cl_null(l_amt7) THEN LET l_amt7 = 0 END IF
   IF cl_null(l_amt8) THEN LET l_amt8 = 0 END IF
   
   #20150323--add--str--
   SELECT SUM(xrce109),SUM(xrce119),SUM(xrce129),SUM(xrce139) INTO l_amt5_1,l_amt6_1,l_amt7_1,l_amt8_1 FROM xrce_t
    WHERE xrceent = g_enterprise
      AND xrceld  = g_xrca_t.xrcald
      AND xrcedocno = g_xrca_t.xrcadocno
      AND xrce027 = 'N'
   
   IF cl_null(l_amt5_1) THEN LET l_amt5_1 = 0 END IF
   IF cl_null(l_amt6_1) THEN LET l_amt6_1 = 0 END IF
   IF cl_null(l_amt7_1) THEN LET l_amt7_1 = 0 END IF
   IF cl_null(l_amt8_1) THEN LET l_amt8_1 = 0 END IF
   #20150323--add--end--
   
   #直接繳款金額
   SELECT SUM(xrde109 * CASE WHEN xrde015 = 'D' THEN 1 ELSE -1 END),SUM(xrde119 * CASE WHEN xrde015 = 'D' THEN 1 ELSE -1 END),
          SUM(xrde129 * CASE WHEN xrde015 = 'D' THEN 1 ELSE -1 END),SUM(xrde139 * CASE WHEN xrde015 = 'D' THEN 1 ELSE -1 END)
     INTO l_amt9,l_amt10,l_amt11,l_amt12 FROM xrde_t,gzcb_t
    WHERE xrdeent = g_enterprise
      AND xrdeld  = g_xrca_t.xrcald
      AND xrdedocno = g_xrca_t.xrcadocno
      AND xrde002 = gzcb002
      AND gzcb001 = '8306'
      AND gzcb004 = '1'
      AND xrde002 = '10'
   
  #LET l_amt9 = l_amt10 / g_xrca_t.xrca101   #220150520 Mark By 01727
      
   IF cl_null(l_amt9)  THEN LET l_amt9  = 0 END IF
   IF cl_null(l_amt10) THEN LET l_amt10 = 0 END IF
   IF cl_null(l_amt11) THEN LET l_amt11 = 0 END IF
   IF cl_null(l_amt12) THEN LET l_amt12 = 0 END IF
   
   #直接沖銷帳金額
   #SELECT SUM(xrce109),SUM(xrce119),SUM(xrce129),SUM(xrce139) INTO l_amt13,l_amt14,l_amt15,l_amt16 FROM xrce_t,gzcb_t
   # WHERE xrceent = g_enterprise
   #   AND xrceld  = g_xrca_t.xrcald
   #   AND xrcedocno = g_xrca_t.xrcadocno
   #   AND xrce002 = gzcb002
   #   AND gzcb001 = '8306'
   #   AND gzcb004 = '1'
   #   AND xrce002 <> '10'
      
   #計算帳款
   SELECT SUM(xrce109 * CASE WHEN gzcb003 = 'D' THEN 1 ELSE -1 END),SUM(xrce119 * CASE WHEN gzcb003 = 'D' THEN 1 ELSE -1 END),
          SUM(xrce129 * CASE WHEN gzcb003 = 'D' THEN 1 ELSE -1 END),SUM(xrce139 * CASE WHEN gzcb003 = 'D' THEN 1 ELSE -1 END)
     INTO l_xrce109,l_xrce119,l_xrce129,l_xrce139
     FROM xrce_t,gzcb_t
    WHERE xrceent = g_enterprise
      AND xrceld  = g_xrca_t.xrcald
      AND xrcedocno = g_xrca_t.xrcadocno
      AND gzcb001 = '8306'
      AND gzcb004 = '2'
      AND gzcb002 = xrce002
   IF cl_null(l_xrce109) THEN LET l_xrce109 = 0 END IF
   IF cl_null(l_xrce119) THEN LET l_xrce119 = 0 END IF
   IF cl_null(l_xrce129) THEN LET l_xrce129 = 0 END IF
   IF cl_null(l_xrce139) THEN LET l_xrce139 = 0 END IF
   
   #計算匯差及調整帳款
   SELECT SUM(xrde109 * CASE WHEN gzcb003 = 'D' THEN 1 ELSE -1 END),SUM(xrde119 * CASE WHEN gzcb003 = 'D' THEN 1 ELSE -1 END),
          SUM(xrde129 * CASE WHEN gzcb003 = 'D' THEN 1 ELSE -1 END),SUM(xrde139 * CASE WHEN gzcb003 = 'D' THEN 1 ELSE -1 END)
     INTO l_xrde109,l_xrde119,l_xrde129,l_xrde139
     FROM xrde_t,gzcb_t
    WHERE xrdeent = g_enterprise
      AND xrdeld  = g_xrca_t.xrcald
      AND xrdedocno = g_xrca_t.xrcadocno
      AND xrde002 = gzcb002
      AND gzcb001 = '8306'
      AND xrde002 <> 10
      AND gzcb004 = '1'  

   IF cl_null(l_xrde109) THEN LET l_xrde109 = 0 END IF
   IF cl_null(l_xrde119) THEN LET l_xrde119 = 0 END IF
   IF cl_null(l_xrde129) THEN LET l_xrde129 = 0 END IF
   IF cl_null(l_xrde139) THEN LET l_xrde139 = 0 END IF
   
   LET l_amt13 = l_xrde109 + l_xrce109
   LET l_amt14 = l_xrde119 + l_xrce119
   LET l_amt15 = l_xrde129 + l_xrce129
   LET l_amt16 = l_xrde139 + l_xrce139
   
  #LET l_amt13 = l_amt14 / g_xrca_t.xrca101   #220150520 Mark By 01727

   IF cl_null(l_amt13) THEN LET l_amt13 = 0 END IF
   IF cl_null(l_amt14) THEN LET l_amt14 = 0 END IF
   IF cl_null(l_amt15) THEN LET l_amt15 = 0 END IF
   IF cl_null(l_amt16) THEN LET l_amt16 = 0 END IF
   
   #20150324 这里计算l_amt13和l_amt5_1有重复的地方
   LET l_sum1 = l_amt9  + l_amt13#+ l_amt5_1   #20150323 add l_amt5_1
   LET l_sum2 = l_amt10 + l_amt14#+ l_amt6_1   #20150323 add l_amt6_1
   LET l_sum3 = l_amt11 + l_amt15#+ l_amt7_1   #20150323 add l_amt7_1
   LET l_sum4 = l_amt12 + l_amt16#+ l_amt8_1   #20150323 add l_amt8_1
   
   IF l_sum1 < 0 THEN LET l_sum1 = l_sum1 * -1 END IF
   IF l_sum2 < 0 THEN LET l_sum2 = l_sum2 * -1 END IF
   IF l_sum3 < 0 THEN LET l_sum3 = l_sum3 * -1 END IF
   IF l_sum4 < 0 THEN LET l_sum4 = l_sum4 * -1 END IF
   
   LET l_amt17 = l_amt1 - l_sum1
   LET l_amt18 = l_amt2 - l_sum2
   LET l_amt19 = l_amt3 - l_sum3
   LET l_amt20 = l_amt4 - l_sum4

   IF g_glaa_t.glaa015 = 'N' THEN
      CALL cl_set_comp_visible('glaa016,lbl_lab3',FALSE)  #160628-00002#1 add 'lbl_lab3'
#      CALL cl_set_comp_visible('amt3,amt7,amt11,amt15,amt19',FALSE) #160628-00002#1 mark
      CALL cl_set_comp_visible('amt3,amt11,amt15,amt19',FALSE) #160628-00002#1 add
   ELSE
      CALL cl_set_comp_visible('glaa016,lbl_lab3',TRUE)   #160628-00002#1 add 'lbl_lab3'
#      CALL cl_set_comp_visible('amt3,amt7,amt11,amt15,amt19',TRUE) #160628-00002#1 mark
      CALL cl_set_comp_visible('amt3,amt11,amt15,amt19',TRUE) #160628-00002#1 add
   END IF
   IF g_glaa_t.glaa019 = 'N' THEN
      CALL cl_set_comp_visible('glaa020,lbl_lab4',FALSE)  #160628-00002#1 add 'lbl_lab4'
#      CALL cl_set_comp_visible('amt4,amt8,amt12,amt16,amt20',FALSE) #160628-00002#1 mark
      CALL cl_set_comp_visible('amt4,amt12,amt16,amt20',FALSE) #160628-00002#1 add
   ELSE
      CALL cl_set_comp_visible('glaa020,lbl_lab4',TRUE)   #160628-00002#1 add 'lbl_lab4'
#      CALL cl_set_comp_visible('amt4,amt8,amt12,amt16,amt20',TRUE) #160628-00002#1 mark
      CALL cl_set_comp_visible('amt4,amt12,amt16,amt20',TRUE) #160628-00002#1 add
   END IF

   DISPLAY l_amt1,l_amt5,l_amt9, l_amt13,l_amt17 TO amt1,amt5,amt9, amt13,amt17
   DISPLAY l_amt2,l_amt6,l_amt10,l_amt14,l_amt18 TO amt2,amt6,amt10,amt14,amt18
   DISPLAY l_amt3,l_amt7,l_amt11,l_amt15,l_amt19 TO amt3,amt7,amt11,amt15,amt19
   DISPLAY l_amt4,l_amt8,l_amt12,l_amt16,l_amt20 TO amt4,amt8,amt12,amt16,amt20
   
   LET g_amt1 = l_sum1
   LET g_amt2 = l_sum2
   LET g_amt3 = l_sum3
   LET g_amt4 = l_sum4
   #20150323--add--str--
   LET g_amt5 = l_amt5
   LET g_amt6 = l_amt6
   LET g_amt7 = l_amt7
   LET g_amt8 = l_amt8
   #20150323--add--end--
   
   LET g_amt_1 = l_amt1
   LET g_amt_9 = l_amt9
   LET g_xrca118 = l_amt2
   LET g_amt = g_amt2 - g_xrca118
END FUNCTION
# 10:收款时金额检查
PRIVATE FUNCTION axrt300_02_chk_xrde109()
   DEFINE l_tot1         LIKE nmbb_t.nmbb006   #原幣金額
   DEFINE l_tot2         LIKE nmbb_t.nmbb007   #本幣金額
   DEFINE l_amt1         LIKE nmbb_t.nmbb008   #已沖原幣金額  主帳套
   DEFINE l_amt2         LIKE nmbb_t.nmbb009   #已沖本幣金額  主帳套
   DEFINE l_amt3         LIKE nmbb_t.nmbb020   #已沖原幣金額  次帳套一
   DEFINE l_amt4         LIKE nmbb_t.nmbb021   #已沖本幣金額  次帳套一
   DEFINE l_amt5         LIKE nmbb_t.nmbb023   #已沖原幣金額  次帳套二
   DEFINE l_amt6         LIKE nmbb_t.nmbb024   #已沖本幣金額  次帳套二
   DEFINE l_errno1       LIKE gzze_t.gzze001
   DEFINE l_count        LIKE type_t.num5
   DEFINE l_ld_s         LIKE type_t.num5
   #20150702--add--str--lujh
   DEFINE l_xrde109      LIKE xrde_t.xrde109
   DEFINE l_xrde119      LIKE xrde_t.xrde119
   DEFINE l_xrde129      LIKE xrde_t.xrde129
   DEFINE l_xrde139      LIKE xrde_t.xrde139
   #20150702--add--end--lujh
   #151105-00008#2--add--str--lujh
   DEFINE l_xrfb103      LIKE xrfb_t.xrfb103
   DEFINE l_xrfb104      LIKE xrfb_t.xrfb104
   #151105-00008#2--add--end--lujh
 
#160420-00001#1 函数作废
 
#   LET g_errno = ' '
# 
#   #檢查是否是主帳套
#   LET l_count = 0
#   SELECT COUNT(*) INTO l_count FROM glaa_t
#    WHERE glaaent = g_enterprise
#      AND glaald  = g_xrca_t.xrcald
#      AND glaa014 = 'Y'
#   IF l_count > 0 THEN
#     LET l_ld_s = 1
#   ELSE
#      #次帳套一
#      LET l_count = 0
#      SELECT COUNT(*) INTO l_count FROM ooab_t WHERE ooab001 = 'S-FIN-0001' AND ooab002 = g_xrca_t.xrcald
#                  AND ooabsite= g_xrca_t.xrcasite
#      IF l_count > 0 THEN
#         LET l_ld_s = 2
#      END IF
#      #次帳套二
#      LET l_count = 0
#      SELECT COUNT(*) INTO l_count FROM ooab_t WHERE ooab001 = 'S-FIN-0002' AND ooab002 = g_xrda_m.xrdald
#                  AND ooabsite= g_xrca_t.xrcasite
#      IF l_count > 0 THEN
#         LET l_ld_s = 3
#      END IF
#   END IF
#   
#   CASE
#      WHEN g_xrce_d[l_ac].xrce006 = '10' OR g_xrce_d[l_ac].xrce006 = '20' OR g_xrce_d[l_ac].xrce006 = '30'
#         #檢查銀存收支明細檔(nmbb_t)
#         SELECT nmbb006,nmbb007,nmbb008,nmbb009,nmbb020,nmbb021,nmbb023,nmbb024
#           INTO l_tot1,l_tot2,l_amt1,l_amt2,l_amt3,l_amt4,l_amt5,l_amt6
#           FROM nmbb_t
#          WHERE nmbbent  = g_enterprise
#            AND nmbbdocno= g_xrce_d[l_ac].xrce003
#            AND nmbbseq  = g_xrce_d[l_ac].xrce004
#         LET l_errno1 = 'axr-00054'
#   END CASE
#   
#   #20150702--add--str--lujh
#   SELECT SUM(xrde109),SUM(xrde119),SUM(xrde129),SUM(xrde139)
#     INTO l_xrde109,l_xrde119,l_xrde129,l_xrde139
#     FROM xrde_t,xrda_t
#    WHERE xrdeent = g_enterprise
#      AND xrdeent = xrdaent
#      AND xrdedocno = xrdadocno
#      AND xrdeld = xrdald
#      AND xrdastus = 'N'
#      AND xrde003 = g_xrce_d[l_ac].xrce003
#      AND xrde004 = g_xrce_d[l_ac].xrce004
#   
#   IF cl_null(l_xrde109) THEN LET l_xrde109 = 0 END IF
#   IF cl_null(l_xrde119) THEN LET l_xrde119 = 0 END IF
#   IF cl_null(l_xrde129) THEN LET l_xrde129 = 0 END IF
#   IF cl_null(l_xrde139) THEN LET l_xrde139 = 0 END IF
#   #20150702--add--end--lujh
#   
#   #151105-00008#2--add--str--lujh
#   LET l_xrfb103 = 0 LET l_xrfb104 = 0
#   SELECT SUM(xrfb103),SUM(xrfb104)
#     INTO l_xrfb103,l_xrfb104
#     FROM xrfa_t,xrfb_t
#    WHERE xrfaent = g_enterprise
#      AND xrfaent = xrfbent
#      AND xrfadocno = xrfbdocno
#      AND xrfald = xrfbld
#      AND xrfastus = 'N'
#      AND xrfb002 = g_xrce_d[l_ac].xrce003
#      AND xrfb003 = g_xrce_d[l_ac].xrce004
#   
#   IF cl_null(l_xrfb103) THEN LET l_xrfb103 = 0 END IF
#   IF cl_null(l_xrfb104) THEN LET l_xrfb104 = 0 END IF
#   #151105-00008#2--add--end--lujh
#   
#   IF l_ld_s = 1 THEN
#      LET l_tot1 = l_tot1 - l_amt1
#      LET l_tot2 = l_tot2 - l_amt2
#   ELSE
#      IF l_ld_s = 2 THEN
#        LET l_tot1 = l_tot1 - l_amt3
#        LET l_tot2 = l_tot2 - l_amt4
#      ELSE
#        LET l_tot1 = l_tot1 - l_amt5
#        LET l_tot2 = l_tot2 - l_amt6
#      END IF
#   END IF
#   IF l_tot1 < g_xrce_d[l_ac].xrce109 + l_xrde109 + l_xrfb103 OR l_tot2 < g_xrce_d[l_ac].xrce119 + l_xrde119 + l_xrfb104 THEN   #151105-00008#2 add l_xrfb103  l_xrfb104 lujh
#      LET g_errno = l_errno1 RETURN
#   END IF
END FUNCTION
# 10:收款单号检查
PRIVATE FUNCTION axrt300_02_chk_xrde003()
   DEFINE l_SQLCODE      LIKE type_t.chr20
   DEFINE l_stus         LIKE nmba_t.nmbastus
   DEFINE l_errno1       LIKE gzze_t.gzze001
   DEFINE l_errno2       LIKE gzze_t.gzze001
   DEFINE l_errno3       LIKE gzze_t.gzze001
   DEFINE l_errno4       LIKE gzze_t.gzze001
   DEFINE l_errno5       LIKE gzze_t.gzze001
   DEFINE l_count        LIKE type_t.num5
   DEFINE l_ld_s         LIKE type_t.num5      #帳套   1:主帳套;2:次帳套一;3:次帳套二
   DEFINE l_tot1         LIKE nmbb_t.nmbb006   #原幣金額
   DEFINE l_tot2         LIKE nmbb_t.nmbb007   #本幣金額
   DEFINE l_amt1         LIKE nmbb_t.nmbb008   #已沖原幣金額  主帳套
   DEFINE l_amt2         LIKE nmbb_t.nmbb009   #已沖本幣金額  主帳套
   DEFINE l_amt3         LIKE nmbb_t.nmbb020   #已沖原幣金額  次帳套一
   DEFINE l_amt4         LIKE nmbb_t.nmbb021   #已沖本幣金額  次帳套一
   DEFINE l_amt5         LIKE nmbb_t.nmbb023   #已沖原幣金額  次帳套二
   DEFINE l_amt6         LIKE nmbb_t.nmbb024   #已沖本幣金額  次帳套二
   DEFINE l_nmcnstus     LIKE nmcn_t.nmcnstus
   DEFINE l_nmba004      LIKE nmba_t.nmba004
   DEFINE l_pmaa069      LIKE pmaa_t.pmaa069
   DEFINE l_pmaa006      LIKE pmaa_t.pmaa006
   DEFINE l_pmaa006_1    LIKE pmaa_t.pmaa006
   DEFINE l_flag         LIKE type_t.chr2
   DEFINE l_cnt          LIKE type_t.num5

  #160420-00001#1 Mark 函数作废

#   #檢查是否是主帳套
#   LET l_count = 0
#   SELECT COUNT(*) INTO l_count FROM glaa_t
#    WHERE glaaent = g_enterprise
#      AND glaald  = g_xrca_t.xrcald
#      AND glaa014 = 'Y'
#   IF l_count > 0 THEN
#     LET l_ld_s = 1
#   ELSE
#      #次帳套一
#      LET l_count = 0
#      SELECT COUNT(*) INTO l_count FROM ooab_t WHERE ooab001 = 'S-FIN-0001' AND ooab002 = g_xrca_t.xrcald 
#         AND ooabsite= g_xrca_t.xrcasite
#      IF l_count > 0 THEN
#         LET l_ld_s = 2
#      END IF
#      #次帳套二
#      LET l_count = 0
#      SELECT COUNT(*) INTO l_count FROM ooab_t WHERE ooab001 = 'S-FIN-0002' AND ooab002 = g_xrca_t.xrcald
#         AND ooabsite= g_xrca_t.xrcasite
#      IF l_count > 0 THEN
#         LET l_ld_s = 3
#      END IF
#   END IF
#   
#   LET g_errno = ' '
#   IF g_xrce_d[l_ac].xrce002 = '10' THEN
#      CASE
#         WHEN g_xrce_d[l_ac].xrce006 = '10' OR  g_xrce_d[l_ac].xrce006 = '20' OR  g_xrce_d[l_ac].xrce006 = '30'   #現金類型 OR #銀行電匯款
#            #檢查資料1:存在性、有效性;2.已確認;3.可沖金額大於0
#            SELECT nmbastus,nmba004 INTO l_stus,l_nmba004 FROM nmba_t
#             WHERE nmbaent  = g_enterprise
#               AND nmbadocno= g_xrce_d[l_ac].xrce003
#            LET l_SQLCODE = SQLCA.SQLCODE
#            IF NOT SQLCA.SQLCODE AND NOT cl_null(g_xrce_d[l_ac].xrce004) THEN
#               SELECT nmbb006,nmbb007,nmbb008,nmbb009,nmbb020,nmbb021,nmbb023,nmbb024
#                 INTO l_tot1,l_tot2,l_amt1,l_amt2,l_amt3,l_amt4,l_amt5,l_amt6
#                 FROM nmbb_t
#                WHERE nmbbent  = g_enterprise
#                  AND nmbbdocno= g_xrce_d[l_ac].xrce003
#                  AND nmbbseq  = g_xrce_d[l_ac].xrce004
#               IF SQLCA.SQLCODE = 100 THEN LET l_SQLCODE = SQLCA.SQLCODE END IF
#            END IF
#            #對象合理性判斷
#            SELECT nmbb026 INTO l_nmba004 FROM nmbb_t WHERE nmbbent  = g_enterprise
#               AND nmbbdocno= g_xrce_d[l_ac].xrce003
#               AND nmbbseq  = g_xrce_d[l_ac].xrce004
#            IF l_nmba004 <> g_xrca_t.xrca005 THEN
#               SELECT pmaa069 INTO l_pmaa069 FROM pmaa_t
#                WHERE pmaaent = g_enterprise
#                  AND pmaa001 = l_nmba004
#               IF l_pmaa069 = 'N' OR cl_null(l_pmaa069) THEN
#                  LET l_errno5 = 'axr-00070'   #該交易單據非帳款核銷客戶!
#               ELSE
#                  #收款客戶、核銷客戶是否屬於同一集團
#                  SELECT pmaa006 INTO l_pmaa006   FROM pmaa_t WHERE pmaaent = g_enterprise
#                     AND pmaa001 = g_xrca_t.xrca005
#                  SELECT pmaa006 INTO l_pmaa006_1 FROM pmaa_t WHERE pmaaent = g_enterprise
#                     AND pmaa001 = g_xrca_t.xrca004
#                  IF NOT cl_null(l_pmaa006_1) AND NOT cl_null(l_pmaa006) AND l_pmaa006_1 != l_pmaa006 THEN LET l_flag = 'N' END IF
#                  IF (cl_null(l_pmaa006_1) AND NOT cl_null(l_pmaa006)) OR (NOT cl_null(l_pmaa006_1) AND cl_null(l_pmaa006)) THEN LET l_flag = 'N' END IF
#            
#                  #檢核夥伙關係(pmac_t)中,有無設定
#                  LET l_cnt = 0
#                  SELECT COUNT(*) INTO l_cnt FROM pmac_t WHERE pmacent = g_enterprise AND pmac001 = g_xrca_t.xrca005
#                     AND pmacstus = 'Y' AND pmac003 = '1' AND pmac002 = g_xrca_t.xrca004
#                  IF l_cnt < 1 THEN LET l_flag = l_flag,'N' END IF
#            
#                  IF l_flag = 'NN' THEN
#                     LET l_errno5 = 'agl-00153'
#                  ELSE
#                     LET l_errno5 = 'agl-00154'
#                  END IF
#               END IF
#            END IF
#            LET l_errno1 = 'axr-00051'
##            LET l_errno2 = 'axr-00052'   #160318-00005#53  mark
#            LET l_errno2 = 'sub-01302'    #160318-00005#53  add
##            LET l_errno3 = 'axr-00053'   #160318-00005#53  mark
#            LET l_errno3 = 'ain-00265'    #160318-00005#53  add
#            LET l_errno4 = 'axr-00054'
#      END CASE
#      IF l_ld_s = 1 THEN
#         LET l_tot1 = l_tot1 - l_amt1
#         LET l_tot2 = l_tot2 - l_amt2
#      ELSE
#         IF l_ld_s = 2 THEN
#           LET l_tot1 = l_tot1 - l_amt3
#           LET l_tot2 = l_tot2 - l_amt4
#         ELSE
#           LET l_tot1 = l_tot1 - l_amt5
#           LET l_tot2 = l_tot2 - l_amt6
#         END IF
#      END IF
#      CASE
#         WHEN l_SQLCODE = '100'
#            LET g_errno = l_errno1 RETURN
#         WHEN l_stus = 'X'
#            LET g_errno = l_errno2 RETURN
#         WHEN l_stus = 'N'
#            LET g_errno = l_errno3 RETURN
#         WHEN l_tot1 = 0 OR l_tot2 = 0
#            LET g_errno = l_errno4 RETURN
#      END CASE
#      IF cl_null(g_errno) AND NOT cl_null(l_errno5) THEN
#         LET g_errno = l_errno5
#      END IF
#   END IF
END FUNCTION

################################################################################
# Descriptions...: 科目是否啟用現金變動碼、默認值
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
PRIVATE FUNCTION axrt300_02_acc_def()
   DEFINE l_glaa004         LIKE glaa_t.glaa004
   DEFINE l_glaa005         LIKE glaa_t.glaa005
   DEFINE l_glac016         LIKE glac_t.glac016

   SELECT glaa004,glaa005 INTO l_glaa004,l_glaa005 FROM glaa_t
    WHERE glaaent = g_enterprise AND glaald  = g_xrca_t.xrcald

   SELECT glac016 INTO l_glac016 FROM glac_t
    WHERE glacent = g_enterprise AND glac001 = l_glaa004 AND glac002 = g_xrce_d[l_ac].xrce016

  #160420-00001#1 Mark ---(S)---
  #IF cl_null(l_glac016) OR l_glac016 = 'N' THEN
  #   LET g_xrce_d[l_ac].xrde012 = ''
  #ELSE
  #   SELECT glad006 INTO g_xrce_d[l_ac].xrde012 FROM glad_t WHERE gladent = g_enterprise
  #      AND gladld = g_xrca_t.xrcald
  #      AND glad001= g_xrce_d[l_ac].xrce016
  #END IF
  #
  #INITIALIZE g_ref_fields TO NULL
  #LET g_ref_fields[1] = l_glaa005
  #LET g_ref_fields[2] = g_xrce_d[l_ac].xrde012
  #CALL ap_ref_array2(g_ref_fields,"SELECT nmail004 FROM nmail_t WHERE nmailent='"||g_enterprise||"' AND nmail001=? AND nmail002=? AND nmail003='"||g_dlang||"'","")
  #   RETURNING g_rtn_fields
  #LET g_xrce_d[l_ac].xrde012_u_desc = '', g_rtn_fields[1] , ''
  #160420-00001#1 Mark ---(E)---

END FUNCTION

################################################################################
# Descriptions...: #170512-00045#2
# Memo...........:
# Usage..........: CALL axrt300_02_set_fixacc_require(p_item)
# Modify.........:
################################################################################
PRIVATE FUNCTION axrt300_02_set_fixacc_require(p_item)
DEFINE p_item        DYNAMIC ARRAY OF VARCHAR(100)
DEFINE l_glad        DYNAMIC ARRAY OF RECORD
          glad007       LIKE glad_t.glad007, #啟用部門管理
          glad008       LIKE glad_t.glad008, #啟用利潤成本管理
          glad009       LIKE glad_t.glad009, #啟用區域管理
          glad010       LIKE glad_t.glad010, #啟用收付款客商管理
          glad011       LIKE glad_t.glad011, #啟用客群管理
          glad012       LIKE glad_t.glad012, #啟用產品類別管理
          glad013       LIKE glad_t.glad013, #啟用人員管理
          glad015       LIKE glad_t.glad015, #啟用專案管理
          glad016       LIKE glad_t.glad016, #啟用WBS管理
          glad017       LIKE glad_t.glad017, #啟用自由核算項一
          glad018       LIKE glad_t.glad018, #啟用自由核算項二
          glad019       LIKE glad_t.glad019, #啟用自由核算項三
          glad020       LIKE glad_t.glad020, #啟用自由核算項四
          glad021       LIKE glad_t.glad021, #啟用自由核算項五
          glad022       LIKE glad_t.glad022, #啟用自由核算項六
          glad023       LIKE glad_t.glad023, #啟用自由核算項七
          glad024       LIKE glad_t.glad024, #啟用自由核算項八
          glad025       LIKE glad_t.glad025, #啟用自由核算項九
          glad026       LIKE glad_t.glad026, #啟用自由核算項十
          glad027       LIKE glad_t.glad027, #啟用帳款客商管理
          glad031       LIKE glad_t.glad031, #啟用經營方式管理
          glad032       LIKE glad_t.glad032, #啟用通路管理
          glad033       LIKE glad_t.glad033  #啟用品牌管理
                     END RECORD
   #p_item[1] 帳套
   #p_item[2] A科目
   #p_item[3] B科目
   
   #找出科目啟用核算項情形
   CALL s_voucher_fix_acc_open_chk(p_item[1],p_item[2])
   RETURNING l_glad[1].glad007,l_glad[1].glad008,l_glad[1].glad009,l_glad[1].glad010,l_glad[1].glad027,
             l_glad[1].glad011,l_glad[1].glad012,l_glad[1].glad013,l_glad[1].glad015,l_glad[1].glad016,
             l_glad[1].glad031,l_glad[1].glad032,l_glad[1].glad033
   SELECT glad017,glad018,glad019,glad020,glad021,
          glad022,glad023,glad024,glad025,glad026
     INTO l_glad[1].glad017,l_glad[1].glad018,l_glad[1].glad019,l_glad[1].glad020,l_glad[1].glad021,
          l_glad[1].glad022,l_glad[1].glad023,l_glad[1].glad024,l_glad[1].glad025,l_glad[1].glad026
     FROM glad_t
    WHERE gladent = g_enterprise
      AND gladld = p_item[1]
      AND glad001 = p_item[2]
   
   #部門
   IF l_glad[1].glad007 = "Y" THEN
      CALL cl_set_comp_required("xrce018,xrce018_u_desc",TRUE)
      IF g_xrce3_d[l_ac].xrce018_u_desc = ' ' THEN LET g_xrce3_d[l_ac].xrce018_u_desc = '' END IF
   ELSE
      CALL cl_set_comp_required("xrce018,xrce018_u_desc",FALSE)
   END IF
   #利潤/成本中心
   IF l_glad[1].glad008 = "Y" THEN
      CALL cl_set_comp_required("xrce019_desc",TRUE)
      IF g_xrce3_d[l_ac].xrce019_desc = ' ' THEN LET g_xrce3_d[l_ac].xrce019_desc = '' END IF
   ELSE
      CALL cl_set_comp_required("xrce019_desc",FALSE)
   END IF
   #產品類別
   IF l_glad[1].glad012 = "Y" THEN
      CALL cl_set_comp_required("xrce020,xrce020_desc",TRUE)
      IF g_xrce3_d[l_ac].xrce020_desc = ' ' THEN LET g_xrce3_d[l_ac].xrce020_desc = '' END IF
   ELSE
      CALL cl_set_comp_required("xrce020,xrce020_desc",FALSE)
   END IF
   #人員
   IF l_glad[1].glad013 = "Y" THEN
      CALL cl_set_comp_required("xrce017_desc",TRUE)
      IF g_xrce3_d[l_ac].xrce017_desc = ' ' THEN LET g_xrce3_d[l_ac].xrce017_desc = '' END IF
   ELSE
      CALL cl_set_comp_required("xrce017_desc",FALSE)
   END IF  
   #通路
   IF l_glad[1].glad032 = "Y" THEN
      CALL cl_set_comp_required("xrce040,l_xrce040_desc",TRUE)
      IF g_xrce3_d[l_ac].l_xrce040_desc = ' ' THEN LET g_xrce3_d[l_ac].l_xrce040_desc = '' END IF
   ELSE
      CALL cl_set_comp_required("xrce040,l_xrce040_desc",FALSE)
   END IF   
   
#   #區域
#   IF l_glad[1].glad009 = "Y" THEN
#      CALL cl_set_comp_required("xrce035_desc",TRUE)
#      IF g_xrce3_d[l_ac].xrce035_desc = ' ' THEN LET g_xrce3_d[l_ac].xrce035_desc = '' END IF
#   ELSE
#      CALL cl_set_comp_required("xrce035_desc",FALSE)
#   END IF
   ##收付款客商
   #IF l_glad[1].glad010 = "Y" THEN
   #   CALL cl_set_comp_required("xrce061,xrce061_desc",TRUE)
   #   IF g_xrce3_d[l_ac].xrce061_desc = ' ' THEN LET g_xrce3_d[l_ac].xrce061_desc = '' END IF
   #ELSE
   #   CALL cl_set_comp_required("xrce061,xrce061_desc",FALSE)
   #END IF
   ##帳款客戶
   #IF l_glad[1].glad027 = "Y" THEN
   #   CALL cl_set_comp_required("xrce038,xrce038_desc",TRUE)
   #   IF g_xrce3_d[l_ac].xrce038_desc = ' ' THEN LET g_xrce3_d[l_ac].xrce038_desc = '' END IF
   #ELSE
   #   CALL cl_set_comp_required("xrce038,xrce038_desc",FALSE)
   #END IF
   #客群
#   IF l_glad[1].glad011= "Y" THEN
#      CALL cl_set_comp_required("xrce036",TRUE)
#   ELSE
#      CALL cl_set_comp_required("xrce036",FALSE)
#   END IF

#   #經營方式
#   IF l_glad[1].glad031 = "Y" THEN
#      CALL cl_set_comp_required("xrce044",TRUE)
#      IF g_xrce3_d[l_ac].xrce044 = ' ' THEN LET g_xrce3_d[l_ac].xrce044 = '' END IF
#   ELSE
#      CALL cl_set_comp_required("xrce044",FALSE)
#   END IF

#   #品牌
#   IF l_glad[1].glad033 = "Y" THEN
#      CALL cl_set_comp_required("xrce046_desc",TRUE)
#      IF g_xrce3_d[l_ac].xrce046_desc = ' ' THEN LET g_xrce3_d[l_ac].xrce046_desc = '' END IF
#   ELSE
#      CALL cl_set_comp_required("xrce046_desc",FALSE)
#   END IF

#   #專案編號
#   IF l_glad[1].glad015 = "Y" THEN
#      CALL cl_set_comp_required("xrce022",TRUE)
#   ELSE
#      CALL cl_set_comp_required("xrce022",FALSE)
#   END IF
#   #WBS
#   IF l_glad[1].glad016 = "Y" THEN
#      CALL cl_set_comp_required("xrce023",TRUE)
#   ELSE
#      CALL cl_set_comp_required("xrce023",FALSE)
#   END IF
   
#   #自由核算項一
#   IF l_glad[1].glad017 = "Y" THEN
#      CALL cl_set_comp_required("xrce051_desc",TRUE)
#      IF g_xrce3_d[l_ac].xrce051_desc = ' ' THEN LET g_xrce3_d[l_ac].xrce051_desc = '' END IF
#   ELSE
#      CALL cl_set_comp_required("xrce051_desc",FALSE)
#   END IF
#   #自由核算項二
#   IF l_glad[1].glad018 = "Y" THEN
#      CALL cl_set_comp_required("xrce052_desc",TRUE)
#      IF g_xrce3_d[l_ac].xrce052_desc = ' ' THEN LET g_xrce3_d[l_ac].xrce052_desc = '' END IF
#   ELSE
#      CALL cl_set_comp_required("xrce052_desc",FALSE)
#   END IF
#   #自由核算項三
#   IF l_glad[1].glad019 = "Y"  THEN
#      CALL cl_set_comp_required("xrce053_desc",TRUE)
#      IF g_xrce3_d[l_ac].xrce053_desc = ' ' THEN LET g_xrce3_d[l_ac].xrce053_desc = '' END IF
#   ELSE
#      CALL cl_set_comp_required("xrce053_desc",FALSE)
#   END IF
#   #自由核算項四
#   IF l_glad[1].glad020 = "Y" THEN
#      CALL cl_set_comp_required("xrce054_desc",TRUE)
#      IF g_xrce3_d[l_ac].xrce054_desc = ' ' THEN LET g_xrce3_d[l_ac].xrce054_desc = '' END IF
#   ELSE
#      CALL cl_set_comp_required("xrce054_desc",FALSE)
#   END IF
#   #自由核算項五
#   IF l_glad[1].glad021 = "Y"  THEN
#      CALL cl_set_comp_required("xrce055_desc",TRUE)
#      IF g_xrce3_d[l_ac].xrce055_desc = ' ' THEN LET g_xrce3_d[l_ac].xrce055_desc = '' END IF
#   ELSE
#      CALL cl_set_comp_required("xrce055_desc",FALSE)
#   END IF
#   #自由核算項六
#   IF l_glad[1].glad022 = "Y"  THEN
#      CALL cl_set_comp_required("xrce056_desc",TRUE)
#      IF g_xrce3_d[l_ac].xrce056_desc = ' ' THEN LET g_xrce3_d[l_ac].xrce056_desc = '' END IF
#   ELSE
#      CALL cl_set_comp_required("xrce056_desc",FALSE)
#   END IF
#   #自由核算項七
#   IF l_glad[1].glad023 = "Y"  THEN
#      CALL cl_set_comp_required("xrce057_desc",TRUE)
#      IF g_xrce3_d[l_ac].xrce057_desc = ' ' THEN LET g_xrce3_d[l_ac].xrce057_desc = '' END IF
#   ELSE
#      CALL cl_set_comp_required("xrce057_desc",FALSE)
#   END IF
#   #自由核算項八
#   IF l_glad[1].glad024 = "Y"  THEN
#      CALL cl_set_comp_required("xrce058_desc",TRUE)
#      IF g_xrce3_d[l_ac].xrce058_desc = ' ' THEN LET g_xrce3_d[l_ac].xrce058_desc = '' END IF
#   ELSE
#      CALL cl_set_comp_required("xrce058_desc",FALSE)
#   END IF
#   #自由核算項九
#   IF l_glad[1].glad025 = "Y"  THEN
#      CALL cl_set_comp_required("xrce059_desc",TRUE)
#      IF g_xrce3_d[l_ac].xrce059_desc = ' ' THEN LET g_xrce3_d[l_ac].xrce059_desc = '' END IF
#   ELSE
#      CALL cl_set_comp_required("xrce059_desc",FALSE)
#   END IF
#   #自由核算項十
#   IF l_glad[1].glad026 = "Y" THEN
#      CALL cl_set_comp_required("xrce060_desc",TRUE)
#      IF g_xrce3_d[l_ac].xrce060_desc = ' ' THEN LET g_xrce3_d[l_ac].xrce060_desc = '' END IF
#   ELSE
#      CALL cl_set_comp_required("xrce060_desc",FALSE)
#   END IF
   
   
   DISPLAY BY NAME
   g_xrce3_d[l_ac].xrce018,g_xrce3_d[l_ac].xrce018_u_desc,
   g_xrce3_d[l_ac].xrce019,g_xrce3_d[l_ac].xrce019_desc,
   g_xrce3_d[l_ac].xrce035, 
   g_xrce3_d[l_ac].xrce036, 
   g_xrce3_d[l_ac].xrce020,g_xrce3_d[l_ac].xrce020_desc,
   g_xrce3_d[l_ac].xrce040,g_xrce3_d[l_ac].l_xrce040_desc,
   g_xrce3_d[l_ac].xrce041, 
   g_xrce3_d[l_ac].xrce042, 
   g_xrce3_d[l_ac].xrce043, 
   g_xrce3_d[l_ac].xrce044, 
   g_xrce3_d[l_ac].xrce045, 
   g_xrce3_d[l_ac].xrce046, 
   g_xrce3_d[l_ac].xrce047, 
   g_xrce3_d[l_ac].xrce048, 
   g_xrce3_d[l_ac].xrce049, 
   g_xrce3_d[l_ac].xrce050, 
   g_xrce3_d[l_ac].xrce038, 
   g_xrce3_d[l_ac].xrce039
END FUNCTION

################################################################################
# Descriptions...: 区域/客群名称
# Date & Author..: #171016-00011#3 171018 by 08172
# Modify.........:
################################################################################
PRIVATE FUNCTION axrt300_02_xrce035_desc(p_oocq001,p_oocq002)
   DEFINE p_oocq001  LIKE oocq_t.oocq001
   DEFINE p_oocq002  LIKE oocq_t.oocq002
   DEFINE r_oocql004 LIKE oocql_t.oocql004 
   
   SELECT oocql004  INTO r_oocql004
     FROM oocql_t 
    WHERE oocqlent=g_enterprise
      AND oocql001=p_oocq001 
      AND oocql002=p_oocq002 
      AND oocql003=g_dlang
   
   RETURN r_oocql004
END FUNCTION

################################################################################
# Descriptions...: 核算项说明
#                : 如果栏位对应的核算项类型对应的资料来源为‘1’，则自组sql来抓取说明
# Date & Author..: #171016-00011#3 171018 by 08172
# Modify.........:
################################################################################
PRIVATE FUNCTION axrt300_02_free_account_desc(p_glad,p_field)
   DEFINE p_glad        LIKE glad_t.glad0171
   DEFINE p_field       LIKE xrde_t.xrde042
   DEFINE l_glae002     LIKE glae_t.glae002     #资料来源
   DEFINE l_sql         STRING                  #组的抓取资料的sql
   DEFINE r_field_desc  LIKE type_t.chr80
   
   #核算项一
   LET l_glae002 = ''
   LET l_sql = ''
   SELECT glae002 INTO l_glae002 FROM glae_t
    WHERE glaeent = g_enterprise
      AND glae001 = p_glad
   IF l_glae002 = '2' THEN
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = p_glad
      LET g_ref_fields[2] = p_field
      CALL ap_ref_array2(g_ref_fields,"SELECT glafl004 FROM glafl_t WHERE glaflent='"||g_enterprise||"' AND glafl001=? AND glafl002=? AND glafl003='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET r_field_desc = g_rtn_fields[1]
   ELSE
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = p_field
      CALL axrt300_02_make_sql_desc(p_glad) RETURNING l_sql
      CALL ap_ref_array2(g_ref_fields,l_sql,"") RETURNING g_rtn_fields
      LET r_field_desc = g_rtn_fields[1]
   END IF 
   
   RETURN r_field_desc
END FUNCTION

################################################################################
# Descriptions...: #
# Date & Author..: #171016-00011#3 171018 by 08172
# Modify.........:
################################################################################
PRIVATE FUNCTION axrt300_02_make_sql_desc(p_glae001)
   DEFINE p_glae001   LIKE glae_t.glae001   #核算项类型
   DEFINE r_sql       STRING
   DEFINE l_glae003   LIKE glae_t.glae003   #来源档案
   DEFINE l_glae004   LIKE glae_t.glae004   #来源编号栏位
   DEFINE l_glae005   LIKE glae_t.glae005   #来源说明档案
   DEFINE l_glae006   LIKE glae_t.glae006   #来源说明栏位  
   DEFINE l_dzeb002   LIKE dzeb_t.dzeb002   #栏位代号
   DEFINE l_dzeb006   LIKE dzeb_t.dzeb002   #栏位属性    
   DEFINE l_sql     STRING
   DEFINE li_sql1   STRING    #抓主档表的key
   DEFINE li_sql2   STRING    #抓对应多语言表的key 
   #抓取主表的key放入数组
   DEFINE li_main    DYNAMIC ARRAY OF RECORD
          dzeb002    LIKE dzeb_t.dzeb002       
   END RECORD 
   #抓取多语言表的key放入数组
   DEFINE li_dlang    DYNAMIC ARRAY OF RECORD
          dzeb002    LIKE dzeb_t.dzeb002       
   END RECORD 
   DEFINE l_where   STRING    #组出的对应的抓取说明的where条件    
   DEFINE l_i,l_i2,l_i3       LIKE type_t.num5
    
    #初始化
    CALL li_main.clear()
    CALL li_dlang.clear()
    
   #抓取来源档案，来源说明档案，来源说明栏位
   SELECT glae003,glae004,glae005,glae006 INTO l_glae003,l_glae004,l_glae005,l_glae006 FROM glae_t
    WHERE glaeent = g_enterprise
      AND glae001 = p_glae001
      
   #抓取主档key
   LET l_i = 1
   LET li_sql1 = " SELECT dzeb002 FROM dzeb_t ",
                 "  WHERE dzeb001 = '",l_glae003,"'",
                 "    AND dzeb004 = 'Y'", 
                 "  ORDER BY dzeb021 " 
   PREPARE axrt300_02_pr FROM li_sql1
   DECLARE axrt300_02_cs1 CURSOR FOR axrt300_02_pr
   FOREACH axrt300_02_cs1 INTO li_main[l_i].dzeb002
       LET l_i = l_i +1
   END FOREACH
   #真实数组长度
   LET l_i = l_i -1  
   
   #抓取多语言档key
   LET l_i2 = 1
   LET li_sql2 = " SELECT dzeb002 FROM dzeb_t ",
                 " WHERE dzeb001 = '",l_glae005,"'" ,
                  "  AND dzeb004 = 'Y'",
                 " ORDER BY dzeb021 "
   PREPARE axrt300_02_pr2 FROM li_sql2
   DECLARE axrt300_02_cs2 CURSOR FOR axrt300_02_pr2
   FOREACH axrt300_02_cs2 INTO li_dlang[l_i2].dzeb002
       LET l_i2 = l_i2 +1
   END FOREACH
   #真实数组长度
   LET l_i2 = l_i2 -1  

   
   #组合where条件 
   LET l_where = '1=1'
   FOR  l_i3 = 1 TO  l_i 
       LET l_where = l_where," AND ", li_main[l_i3].dzeb002, " = " ,li_dlang[l_i3].dzeb002
   END FOR    
   
   #组出的基础sql   
   LET r_sql = " SELECT ", l_glae006 ," FROM ",l_glae005 ,',',l_glae003,
               " WHERE " , l_glae004," = ?",
               "   AND " ,l_where
   #组sql               
   LET l_sql = "SELECT dzeb002,dzeb006 FROM dzeb_t ",
               " WHERE dzeb001 = '",l_glae005,"'",
               "   AND dzeb004 = 'Y'"
   PREPARE axrt300_02_make_sql_pre1 FROM l_sql
   DECLARE axrt300_02_make_sql_cs1 CURSOR FOR axrt300_02_make_sql_pre1
   FOREACH axrt300_02_make_sql_cs1 INTO l_dzeb002,l_dzeb006
      #判断是否有ent栏位
      IF l_dzeb006 = 'N802' THEN
         LET r_sql = r_sql CLIPPED," AND ",l_dzeb002 ," ='",g_enterprise,"' "
      END IF 
      
      IF l_dzeb006 = 'C800' THEN
         LET r_sql = r_sql CLIPPED," AND ",l_dzeb002 ," ='",g_dlang,"' "
      END IF

   END FOREACH
   RETURN r_sql
END FUNCTION

################################################################################
# Descriptions...: 自由核算项检查
# Date & Author..: #171016-00011#3 171018 by 08172
# Modify.........:
################################################################################
PRIVATE FUNCTION axrt300_02_free_account_chk(p_glaf001,p_glaf002,p_ctrl)
   DEFINE p_glaf001      LIKE glaf_t.glaf001
   DEFINE p_glaf002      LIKE glaf_t.glaf002
   DEFINE p_ctrl         LIKE type_t.chr5       #控制方式1.1.允许空白，2：必输不需检查或，3：必输需要检查
   DEFINE r_errno        LIKE type_t.chr10      #错误编号
   DEFINE l_glafstus     LIKE glaf_t.glafstus
   DEFINE l_glae002      LIKE glae_t.glae002
   DEFINE l_glae003      LIKE glae_t.glae003
   DEFINE l_glae004      LIKE glae_t.glae004
   DEFINE l_cnt          LIKE type_t.num5
   DEFINE l_sql          STRING
   
      LET r_errno = ''
      LET l_glae002 = ''
      LET l_glae003 = ''
      LET l_glae004 = ''
      #.抓出該类型对应的资料来源，来源档案，来源编号栏位
      SELECT glae002,glae003,glae004 INTO l_glae002,l_glae003,l_glae004 FROM glae_t
       WHERE glaeent = g_enterprise
         AND glae001 = p_glaf001
      #来源类型为1.‘基本资料’，則檢核來源編號欄位是否存在,並依核算项类型对应的控制方式，檢核核算项值的合理性
      IF l_glae002 = '1' THEN
         SELECT count(*) INTO l_cnt FROM dzeb_t
          WHERE dzeb001 = l_glae003
            AND dzeb002 = l_glae004
         IF l_cnt = 0  THEN
            LET r_errno = 'agl-00073'
            RETURN r_errno
         END IF
         #控制方式3：必输必检查
         IF p_ctrl = '3'  THEN
            #1.检查资料的有效存在
             LET l_cnt = 0
             CALL axrt300_02_make_sql(l_glae003,l_glae004,p_glaf002) RETURNING l_sql
             PREPARE axrt300_03_chk  FROM l_sql
             EXECUTE axrt300_03_chk INTO l_cnt             
             IF  l_cnt = 0  THEN
                 LET r_errno = 'agl-00099'
                 RETURN r_errno
             END IF
         END IF
      END IF
      #来源类型为2.预设值，則輸入值應檢核是否存在自由核算項資料檔,並依核算项类型对应的控制方式，檢核核算项值的合理性
      IF l_glae002 = '2' THEN
         SELECT glafstus INTO l_glafstus FROM glaf_t
             WHERE glafent = g_enterprise
               AND glaf001 = p_glaf001
               AND glaf002 = p_glaf002
         IF SQLCA.SQLCODE = 100  THEN
            LET r_errno = 'agl-00062'
            RETURN r_errno
          END IF
          IF p_ctrl = '3'  THEN
             IF l_glafstus = 'N'  THEN
                LET g_errno = 'sub-01302'       
                RETURN r_errno
             END IF
          END IF
      END IF
      #若来源类型为3.'自行輸入'則user可任意輸入且不需檢核
      RETURN r_errno
END FUNCTION

################################################################################
# Descriptions...: 检查资料存在有效的sql
# Date & Author..: #171016-00011#3 171018 by 08172
# Modify.........:
################################################################################
PRIVATE FUNCTION axrt300_02_make_sql(p_glae003,p_glae004,p_glaf002)
   DEFINE p_glae003 LIKE glae_t.glae003    #来源档案
   DEFINE p_glae004 LIKE glae_t.glae004    #来源编号栏位
   DEFINE p_glaf002 LIKE glaf_t.glaf002    #核算项值
   DEFINE l_dzeb002 LIKE dzeb_t.dzeb002
   DEFINE l_dzeb006 LIKE dzeb_t.dzeb006
   DEFINE l_sql     STRING
   DEFINE r_sql     STRING

   LET r_sql = " SELECT count(*) FROM ",p_glae003 ,
               "  WHERE ", p_glae004," = '",p_glaf002,"'"
               
   LET l_sql = "SELECT dzeb002,dzeb006 FROM dzeb_t ",
               " WHERE dzeb001 = '", p_glae003,"'"
   PREPARE axrt300_02_make_sql_pre FROM l_sql
   DECLARE axrt300_02_make_sql_cs CURSOR FOR axrt300_02_make_sql_pre
   FOREACH axrt300_02_make_sql_cs INTO l_dzeb002,l_dzeb006
      #判断是否有ent栏位
      IF l_dzeb006 = 'N802' THEN
         LET r_sql = r_sql CLIPPED," AND ",l_dzeb002 ," ='",g_enterprise,"' "
      END IF
      #判断是否有stus栏位
      IF l_dzeb002 LIKE '%stus'  THEN
         LET r_sql = r_sql CLIPPED," AND ",l_dzeb002 ," ='Y'"
      END IF
   END FOREACH
   RETURN r_sql
END FUNCTION

 
{</section>}
 
