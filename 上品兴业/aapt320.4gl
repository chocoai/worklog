#該程式未解開Section, 採用最新樣板產出!
{<section id="aapt320.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0066(2017-09-26 18:00:38), PR版次:0066(2017-10-06 11:07:23)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000365
#+ Filename...: aapt320
#+ Description: 暫估應付單維護作業
#+ Creator....: 03080(2014-05-27 00:00:00)
#+ Modifier...: 10044 -SD/PR- 10043
 
{</section>}
 
{<section id="aapt320.global" >}
#應用 t01 樣板自動產生(Version:89)
#add-point:填寫註解說明 name="global.memo" 
#150106-00011#3               By Belle    修改部門/責任中心預設值
#150128-00005#9   2015/02/04  By Hans     單身未稅、含稅、稅額欄位計算邏輯更改.
#                                         若稅別含稅:修改含稅金額後使用s_tax_ins重計交易稅;修改未稅金額(稅額)使用"含稅金額 = 未稅金額 + 稅額"公式計算
#                                         若稅別不含:修改未稅金額後使用s_tax_ins重計交易稅;修改含稅金額(稅額)使用"含稅金額 = 未稅金額 + 稅額"公式計算
#                                         px.1)使用公式計算後，需要更新xrcd_t檔案
#                                         px.2)僅單一稅別使用以上邏輯.若稅別為複合稅則使用原有邏輯計算金額
#150206-00013#3               BY Hans     單身最後方,參考單號之後,增加【存貨科目】apcb021、科目說明、【摘要】apcb047 的顯示及維護。
#150210-00009#1   2015/02/12  By Belle    修改 詢問分錄底稿產生位置
#140806-00012#10  2015/03/03  By Reanna   其他訊息來源單據開窗增加稅別條件
#140806-00012#12  2015/03/04  By Reanna   新增時給予留置相關欄位預設值&全部立帳時，應依照來源單據比照給值
#150311           2015/03/11  By Belle    配合狀態碼狀態修改/調整整帳批序號應用
#150616-00026#3   2015/06/16  By apo      按下確認鍵時,單頭會計科目說明會消失
#150617-00002#3   2015/07/06  By Hans     複製程式修改 
#150617-00002#4   2015/07/06  By Hans     aooi390程式修改
#150401-00001#13  2015/07/17  By RayHuang statechange段問題修正
#150910-00012#1   2015/09/11  By albireo  異動單頭票到期日時,重新呼叫元件展算多帳期
#150828-00001#7   2015/09/11  By Jessy    業務部門移至帳款明細頁籤維護,其他訊息頁籤業務部門改成僅顯示
#150921-00148#3   2015/09/24  By albireo  異動單頭應付款日票到期日付款條件時，重展多帳期
#151014-00018#2   2015/10/16  By Jessy    輸入完帳款對象時,若apmm100沒有設定主要交易夥伴時,則付款對象預設為帳款對象
#151105           2015/11/05  By albireo  修正無對應帳別經過ld_info會跳出的問題
#151105-00007#1   2015/11/09  By yihsuan  執行作廢能正常維護作廢原因,且作廢原因為必輸欄位.
#150703-00021#24  2015/11/13  By Hans     增加預算控管
#151125-00006#2   2015/12/01  By 06421    新增[編輯完單據後立即審核]和[編輯完單據後立即拋轉憑證]功能
#150916-00015#1   2015/12/7   By Xiaozg   当有账套时，科目检查改为检查是否存在于glad_t中
#151013-00016#15  2015/12/04  By Hans     修改業務部門時(apca015)詢問是否更新單身之部門欄位(apcb010)
#151215-00013#3   2015/12/17  By fionchen 預設帶存貨科目
#151130-00015#2   2015/12/30  BY taozf    判断 是否可以更改單據日期 設定開放單據日期修改
#160104-00007#3   2016/01/19  By 02097    增加拋轉還原
#151231-00010#1   2016/01/20  By sakura   增加控制組
#160125-00005#2   2016/01/26  By Hans     單身稅別一律顯示，若稅別設定aooi610 稅別應用=2 則單身可維護，
#                                         單身稅別預帶aooi640依產品分類所對應的稅別
#160127-00017#1   2016/01/28  By 02097    付款條件录入开窗与检查时，资料都应存在于当前交易对象的pmad002交易条件中
#160128-00012#1   2016/01/29  By Hans     修改單頭預付科目(apca036)，帳款科目(apca035)時詢問並且且更新單身科目
#160125-00005#6   2016/02/15  By 02097    查詢時，只顯示有權限的帳套
#160225-00001#1   2016/03/04  By 02097    參數D-FIN-0033=N 時不管什麼欄位都不可異動
#160321-00016#21  2016/03/23  By Jessy    修正azzi920重複定義之錯誤訊息
#160107-00001#1   2016/03/28  By 02097    增加标准成本计算
#160318-00025#39  2016/04/22  By pengxin  將重複內容的錯誤訊息置換為公用錯誤訊息(r.v)
#160420-00013#1   2016/04/25  By 02097    在新增單頭時，依單別參數判斷，有預算控管，則default預算編號
#160511-00026#1   2016/05/11  By 02097    fix bug:aoos020已修改应付暂估立账选项为‘2.含税立账’，但单据上选择税别的开窗只能看到0税率的
#160506-00002#1   2016/05/30  By 01531    新增应付立冲账串查询
#160621-00012#1   2016/06/21  By 03538    更新單頭付款對象時,要一起更新apca057
#160616-00005#2   2016/06/24  By 02599    在畫面最下腳增加原幣未稅金額、原幣稅額、原幣含稅金額、本幣未稅金額、本幣稅額、本幣含稅金額合計
#160707-00030#1   160707      By albireo  單頭匯率需取位(依原幣)再做後續處理
#160614-00014#2   160724      By 03538    稅別的輸入檢核及開窗，同aapp131方式相同，依參數決定取稅別
#160726-00020#8   2016/07/29  By 08729    更新新舊值處理方式
#160509-00004#110 2016/07/31  By 02114    單身增加帳款客戶 收款客戶
#160726-00020#10  2016/08/11  By 08729    新舊值二次處理
#160812-00027#1   2016/08/18  By 06821    全面盤點應付程式帳套權限控管
#160726-00020#14  2016/08/17  By 08171    人員帶出部門
#160822-00007#1   2016/08/22  By 03538    b_fill的組成sql,單身條件要組進主sql前,要先清空單身已經組進主sql的條件,不然會造成重複組入
#160829-00004#1   2016/08/30  By 08729    處理取匯率但幣別取錯
#160816-00022#3   2016/09/08  By 06821    立暫估時稅額科目取aapi011暫估稅額科目,並把入庫單單價存入apcb107,不含稅或雜項立暫估,aapt320單身稅別取單頭稅別
#160908-00045#1   2016/09/10  By 08729    規格新增來源組織說明欄位
#160902-00034#1   2016/09/10  By Hans     1.aapt3***單身的預算編號及專案編號的default及控管
#161006-00005#4   2016/10/18  By 08732    組織類型與職能開窗調整
#161014-00053#3   2016/10/21  By 08171    帳套權限調整、增加控制組
#161101-00005#1   2016/11/01  By Reanna   稅別異動之後，說明沒有更換
#161104-00024#3   2016/11/09  By 08729    處理DEFINE有星號
#161111-00042#2   2016/11/12  By 06821    應付_開窗過濾據點
#161121-00020#1   2016/11/21  By Reanna   修改單身未稅金額會報錯，原因是CALL s_tax_ins()重推金額時，apcb103金額不應該清空
#160802-00007#2   161128      By albireo  一次性交易對象識別碼(pmaa004=2)功能應用
#161027-00051#3   161209      By albireo  摘要允許開窗帶回並限制法人條件
#161214-00014#1   2016/12/14  By dorishsu 可立暫估數量小於等於0,則控卡不可輸入
#161114-00009#1   2016/12/27  By 06821    單據審核時的效能調校(科目說明apca035/apca036已於畫面調整欄位型態為FFlabel,因此不會有串聯後為空的問題)
#161229-00047#43  2017/01/09  By 06821    財務用供應商對象控制組,法人條件改為用 IN (site...)的方式,QBE時,傳入符合權限的法人；INPUT時傳入目前法人據點
#161104-00046#19  2017/01/11  By 06821    單別預設值;資料依照單別user dept權限過濾單號
#170213-00013#3   2017/02/14  By Hans     允許性質別為03,04者, 可作單據複製處理(同aapt301)
#170301-00027#12  2017/03/07  By 09042    財務模組的單別應該使用帳套所對應的單別參照表
#161102-00015#3   2017/03/16  By 06821    1.未啟用的核算項要放一個空白存檔 2.若交易幣別=帳套幣別時, 本幣不可維護
#170223-00020#1   2017/03/17  By Sabrina  當g_apca_m.apca054為null時就不呼叫s_azzi650_chk_exist()
#170324-00123#2   2017/03/25  By Sabrina  總帳傳票產生若aooi200未設單別則不顯示錯誤訊息'aap-00219'
#170326-00005#1   2017/03/27  By Sabrina  帳款對象說明未顯示
#170327-00097#1   2017/03/28  By Sabrina  加強#170324-00123的修改
#170329-00074#1   2017/04/10  By 08729    应付、应收模块下各单据表体其他信息维护生成科目的核算项时，责任中心字段应该用于维护成本/利润中心核算项信息，但是开窗后无法选到成本中心档案
#170414-00037#1   2017/04/18  By 08729    aapt300_03多發票清單,統編後增加廠商名稱:統編=pmaa003對應的pmaa001抓取簡稱
#170424-00028#1   2017/04/25  BY 09263    英文語系:差異處理及留置的頁籤中,留置Group 應改為讀取azzi902多語言(lbl_xxx的方式)
#170426-00070#1   2017/04/28  By 09263    調整專案編號的查詢開窗程式碼
#170330-00057#8   2017/05/02  By 08729    專編編號(項目編號)的開窗。前端作業有更改開窗處理"q_pjab001_1專案編號開窗	。財務端亦須跟進修改 帳款單頭【專案編號】、單身核算項【專案編號】開窗都統一為 "q_pjab001_1專案編號開窗	" 將畫面該欄位打開
#170504-00014#1   2017/05/10  By 09257    原幣單價的小數位數未根据aooi150的設置進行小數位取值
#170502-00042#1   2017/05/19  By 09263    AP 核算項由嵌入程式獨立頁籤，作業查詢時手打核算項條件，因串主SQL條件組合有誤，無法正確查出資料。
#170519-00022#1   2017/06/03  By 09256    1.單頭帳務中心與帳務人員可非必輸
#                                         2.其他資訊頁籤中 登打業務部門出錯後,會報錯兩次一樣的訊息
#                                         3.其他資訊頁籤中 業務人員帶出業務部門時,應同時帶出業務部門說明
#                                         4.其他資訊頁籤中 業務部門帶出責任中心時,應同時帶出責任中心說明
#                                         5.其他資訊頁籤中 其他/ 應付附件份數 可以打負得數值 -> 應>=0
#                                         6.集團交易訊息中 集團交易單號查詢與新增時都無開窗邏輯,但畫面卻是開窗型態 -> 建議改為EDIT
#                                         8.單身輸入來源單+項次後,如項次輸入錯誤,會清空金額資料,再輸入為正確的項次也沒有重帶
#                                         9.單身新增會帶入單頭業務部門,但只顯示說明,業務部門欄位空,打勾後 不會寫入 -> 應由單頭寫入單身當預設值
#                                         10.單身存貨科目如為空,新增時應預帶單頭科目資訊
#                                         11.單身交易稅明細頁簽,品名規格 可以修改,但在打勾時不做寫入 -> 不能修改則要鎖上
#                                         12.整單操作 應付多帳期帳款  其他本位幣不啟用時只隱藏欄位 -> 應把欄位名稱一併隱藏
#                                         13.單頭 差異處理及留置 group title名稱變代碼
#                                         14.點完單身後過帳款類別欄位未修改值就會直接蓋過已設定的科目
#170522-00030#1   2017/06/09  By 08729    ㄧ次性交易對象沒有帶出說明
#170617-00242#1   170617      By albireo  自行登打來源單號,未依原始料號取科目
#170617-00527#1   170620      By 06821    修改單據時,如單身有資料時,單頭日期不可異動 (在參數與單別修改日期控卡後,增加此判斷)
#170620-00032#1   170620      By 08729    aapt320複製,帳款單性質也應為03.其他應付暫估單,不應為01.應付暫估單
#170619-00059#1   170626      By 06821    aapt320 開立發票欄位apca060,不可修改 預設 1:不開立發票
#170518-00001#3   170704      By 06821    業務人員修改後,重帶業務部門(取部門資料檔中業務部門資料),單身有資料要詢問是否更新
#170509-00070#2   170713      By 08729    清查傳票還原作業，增加詢問處理。
#170616-00008#1   170713      By 06821    單身來源單據幣別應根單頭一致
#170713-00046#1   170726      By 08729    延續 170522-00030 處理一次性交易對象依據帳款單性質開窗應用01,02請開啟查詢視窗03,04請開啟維護視窗
#170724-00040#1   170803      By Sabrina  傳票還原時需控卡不可小於關帳日期
#170817-00055#1   170822      By chenssz  來源作業類型、來源參考單據查詢出資料時未顯示在畫面上
#170814-00012#11  2017/08/24  By 10044    開窗q_ooeg001_4與q_ooeg001 內容相同,整批修改
#170512-00045#10  2017/09/26  By 10044    科目開窗時，若有啟用核算項，仿照總帳一樣，跳小窗輸入啟用的核算項值
#170920-00040#2   2017/10/06  By 10043    g_grup 變數改用 g_dept
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
#(ver:86) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:86) --- end ---
 
IMPORT os
IMPORT util
IMPORT FGL lib_cl_dlg
IMPORT JAVA com.fourjs.fgl.lang.FglRecord   #(ver:87) add
#add-point:增加匯入項目 name="global.import"
IMPORT FGL aap_aapt300_08              #嵌入單身其他訊息
IMPORT FGL aap_aapt300_13              #嵌入留置畫面
#end add-point 
 
SCHEMA ds 
 
GLOBALS "../../cfg/top_global.inc"
#(ver:87) ---add start---
GLOBALS
#單身匯excel POI變數
TYPE rec_arr_type           ARRAY [] OF com.fourjs.fgl.lang.FglRecord
DEFINE g_export_tag         DYNAMIC ARRAY OF rec_arr_type                 #畫面欄位數
DEFINE g_export_tabname     DYNAMIC ARRAY OF STRING                       #畫面名稱
END GLOBALS
#(ver:87) --- add end ---
 
#add-point:增加匯入變數檔 name="global.inc"
GLOBALS "../../cfg/top_finance.inc"             #財務模組使用
GLOBALS "../../../com/sub/4gl/s_axcp500.inc"    #160107-00001#1
#end add-point
 
#單頭 type 宣告
PRIVATE type type_g_apca_m        RECORD
       apcasite LIKE apca_t.apcasite, 
   apcasite_desc LIKE type_t.chr80, 
   apca003 LIKE apca_t.apca003, 
   apca003_desc LIKE type_t.chr80, 
   apcald LIKE apca_t.apcald, 
   apcald_desc LIKE type_t.chr80, 
   apcacomp LIKE apca_t.apcacomp, 
   apcacomp_desc LIKE type_t.chr80, 
   apcadocno LIKE apca_t.apcadocno, 
   apca001 LIKE apca_t.apca001, 
   apcadocno_desc LIKE type_t.chr80, 
   apcadocdt LIKE apca_t.apcadocdt, 
   apca004 LIKE apca_t.apca004, 
   apca004_desc LIKE type_t.chr80, 
   apca005 LIKE apca_t.apca005, 
   apca005_desc LIKE type_t.chr80, 
   apca038 LIKE apca_t.apca038, 
   apca006 LIKE apca_t.apca006, 
   apca057 LIKE apca_t.apca057, 
   apcastus LIKE apca_t.apcastus, 
   apca065 LIKE apca_t.apca065, 
   apca066 LIKE apca_t.apca066, 
   apca008 LIKE apca_t.apca008, 
   apca008_desc LIKE type_t.chr80, 
   apca009 LIKE apca_t.apca009, 
   apca010 LIKE apca_t.apca010, 
   apca060 LIKE apca_t.apca060, 
   apca013 LIKE apca_t.apca013, 
   apca012 LIKE apca_t.apca012, 
   apca011 LIKE apca_t.apca011, 
   apca011_desc LIKE type_t.chr80, 
   apca007 LIKE apca_t.apca007, 
   apca007_desc LIKE type_t.chr80, 
   apca036 LIKE apca_t.apca036, 
   apca036_desc LIKE type_t.chr80, 
   apca035 LIKE apca_t.apca035, 
   apca035_desc LIKE type_t.chr80, 
   apca100 LIKE apca_t.apca100, 
   apca103 LIKE apca_t.apca103, 
   apca104 LIKE apca_t.apca104, 
   apca106 LIKE apca_t.apca106, 
   fflabel_1 LIKE type_t.chr80, 
   apca108 LIKE apca_t.apca108, 
   apcc109 LIKE type_t.num20_6, 
   net108 LIKE type_t.num20_6, 
   glaa001 LIKE type_t.chr10, 
   apca101 LIKE apca_t.apca101, 
   apca113 LIKE apca_t.apca113, 
   apca114 LIKE apca_t.apca114, 
   apca116 LIKE apca_t.apca116, 
   apcc113 LIKE apcc_t.apcc113, 
   apca118 LIKE apca_t.apca118, 
   apcc119 LIKE type_t.num20_6, 
   net118 LIKE type_t.num20_6, 
   apca0501 LIKE type_t.chr500, 
   apca039 LIKE apca_t.apca039, 
   apca056 LIKE apca_t.apca056, 
   apca016 LIKE apca_t.apca016, 
   apca055 LIKE apca_t.apca055, 
   apca055_desc LIKE type_t.chr80, 
   apca018 LIKE apca_t.apca018, 
   apca019 LIKE apca_t.apca019, 
   apca014 LIKE apca_t.apca014, 
   apca014_desc LIKE type_t.chr80, 
   apca054 LIKE apca_t.apca054, 
   apca054_desc LIKE type_t.chr80, 
   apca015 LIKE apca_t.apca015, 
   apca015_desc LIKE type_t.chr80, 
   apca034 LIKE apca_t.apca034, 
   apca034_desc LIKE type_t.chr80, 
   apca033 LIKE apca_t.apca033, 
   apca033_desc LIKE type_t.chr80, 
   apca058 LIKE apca_t.apca058, 
   apca058_desc LIKE type_t.chr80, 
   apca059 LIKE apca_t.apca059, 
   apca059_desc LIKE type_t.chr80, 
   apca063 LIKE apca_t.apca063, 
   apca050 LIKE apca_t.apca050, 
   apca052 LIKE apca_t.apca052, 
   apca017 LIKE apca_t.apca017, 
   partition2 LIKE type_t.chr80, 
   apca051 LIKE apca_t.apca051, 
   apca051_desc LIKE type_t.chr80, 
   apca053 LIKE apca_t.apca053, 
   apca025 LIKE apca_t.apca025, 
   apca031 LIKE apca_t.apca031, 
   apca030 LIKE apca_t.apca030, 
   apca030_desc LIKE type_t.chr80, 
   partition3 LIKE type_t.chr80, 
   apca026 LIKE apca_t.apca026, 
   apca027 LIKE apca_t.apca027, 
   apca028 LIKE apca_t.apca028, 
   apca029 LIKE apca_t.apca029, 
   apca020 LIKE apca_t.apca020, 
   apca021 LIKE apca_t.apca021, 
   apca022 LIKE apca_t.apca022, 
   apca046 LIKE apca_t.apca046, 
   apca0181 LIKE type_t.chr500, 
   apca047 LIKE apca_t.apca047, 
   apca048 LIKE apca_t.apca048, 
   apca1001 LIKE type_t.chr10, 
   apca1031 LIKE type_t.num20_6, 
   apca1041 LIKE type_t.num20_6, 
   apca1061 LIKE type_t.num20_6, 
   fflabel_2 LIKE type_t.chr80, 
   apca1081 LIKE type_t.num20_6, 
   apcc1091 LIKE type_t.num20_6, 
   net1081 LIKE type_t.num20_6, 
   glaa0011 LIKE type_t.chr10, 
   apca1011 LIKE type_t.num26_10, 
   apca120 LIKE apca_t.apca120, 
   apca121 LIKE apca_t.apca121, 
   apca130 LIKE apca_t.apca130, 
   apca131 LIKE apca_t.apca131, 
   apca1131 LIKE type_t.num20_6, 
   apca123 LIKE apca_t.apca123, 
   apca133 LIKE apca_t.apca133, 
   apca1141 LIKE type_t.num20_6, 
   apca124 LIKE apca_t.apca124, 
   apca134 LIKE apca_t.apca134, 
   apca1161 LIKE type_t.num20_6, 
   apca126 LIKE apca_t.apca126, 
   apca136 LIKE apca_t.apca136, 
   apcc1131 LIKE type_t.num20_6, 
   apcc123 LIKE apcc_t.apcc123, 
   apcc133 LIKE apcc_t.apcc133, 
   apca1181 LIKE type_t.num20_6, 
   apca128 LIKE apca_t.apca128, 
   apca138 LIKE apca_t.apca138, 
   apcc1191 LIKE type_t.num20_6, 
   apcc129 LIKE type_t.num20_6, 
   apcc139 LIKE type_t.num20_6, 
   net1181 LIKE type_t.num20_6, 
   net128 LIKE type_t.num20_6, 
   net138 LIKE type_t.num20_6, 
   apcaownid LIKE apca_t.apcaownid, 
   apcaownid_desc LIKE type_t.chr80, 
   apcaowndp LIKE apca_t.apcaowndp, 
   apcaowndp_desc LIKE type_t.chr80, 
   apcacrtid LIKE apca_t.apcacrtid, 
   apcacrtid_desc LIKE type_t.chr80, 
   apcacrtdp LIKE apca_t.apcacrtdp, 
   apcacrtdp_desc LIKE type_t.chr80, 
   apcacrtdt LIKE apca_t.apcacrtdt, 
   apcamodid LIKE apca_t.apcamodid, 
   apcamodid_desc LIKE type_t.chr80, 
   apcamoddt LIKE apca_t.apcamoddt, 
   apcacnfid LIKE apca_t.apcacnfid, 
   apcacnfid_desc LIKE type_t.chr80, 
   apcacnfdt LIKE apca_t.apcacnfdt, 
   apcb103_s LIKE type_t.num20_6, 
   apcb104_s LIKE type_t.num20_6, 
   apcb105_s LIKE type_t.num20_6, 
   apcb113_s LIKE type_t.num20_6, 
   apcb114_s LIKE type_t.num20_6, 
   apcb115_s LIKE type_t.num20_6
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_apcb_d        RECORD
       apcbseq LIKE apcb_t.apcbseq, 
   apcb001 LIKE apcb_t.apcb001, 
   apcborga LIKE apcb_t.apcborga, 
   apcborga_desc LIKE type_t.chr500, 
   apcb002 LIKE apcb_t.apcb002, 
   apcb003 LIKE apcb_t.apcb003, 
   apcb023 LIKE apcb_t.apcb023, 
   apcb004 LIKE apcb_t.apcb004, 
   apcb005 LIKE apcb_t.apcb005, 
   apcb030 LIKE apcb_t.apcb030, 
   apcb020 LIKE apcb_t.apcb020, 
   apcb020_desc LIKE type_t.chr500, 
   apcb006 LIKE apcb_t.apcb006, 
   apcb022 LIKE apcb_t.apcb022, 
   apcb007 LIKE apcb_t.apcb007, 
   apcb101 LIKE apcb_t.apcb101, 
   apcb103 LIKE apcb_t.apcb103, 
   apcb104 LIKE apcb_t.apcb104, 
   apcb105 LIKE apcb_t.apcb105, 
   apcb111 LIKE apcb_t.apcb111, 
   apcb113 LIKE apcb_t.apcb113, 
   apcb114 LIKE apcb_t.apcb114, 
   apcb115 LIKE apcb_t.apcb115, 
   apcb028 LIKE apcb_t.apcb028, 
   apcb049 LIKE apcb_t.apcb049, 
   apcb048 LIKE apcb_t.apcb048, 
   apcb008 LIKE apcb_t.apcb008, 
   apcb009 LIKE apcb_t.apcb009, 
   apcb010 LIKE apcb_t.apcb010, 
   apcb010_desc LIKE type_t.chr500, 
   apcb047 LIKE apcb_t.apcb047, 
   apcb021 LIKE apcb_t.apcb021, 
   apcb021_desc LIKE type_t.chr500, 
   apcb029 LIKE apcb_t.apcb029, 
   apcb029_desc LIKE type_t.chr500, 
   apcb017 LIKE apcb_t.apcb017, 
   apcb017_desc LIKE type_t.chr500, 
   apcb100 LIKE apcb_t.apcb100, 
   apcb123 LIKE apcb_t.apcb123, 
   apcb124 LIKE apcb_t.apcb124, 
   apcb125 LIKE apcb_t.apcb125, 
   apcb133 LIKE apcb_t.apcb133, 
   apcb134 LIKE apcb_t.apcb134, 
   apcb135 LIKE apcb_t.apcb135, 
   apcblegl LIKE apcb_t.apcblegl, 
   apcb011 LIKE apcb_t.apcb011, 
   apcb012 LIKE apcb_t.apcb012, 
   apcb014 LIKE apcb_t.apcb014, 
   apcb015 LIKE apcb_t.apcb015, 
   apcb016 LIKE apcb_t.apcb016, 
   apcb024 LIKE apcb_t.apcb024, 
   apcbsite LIKE apcb_t.apcbsite, 
   apcb013 LIKE apcb_t.apcb013, 
   apcb018 LIKE apcb_t.apcb018, 
   apcb019 LIKE apcb_t.apcb019, 
   apcb106 LIKE apcb_t.apcb106, 
   apcb108 LIKE apcb_t.apcb108, 
   apcb051 LIKE apcb_t.apcb051, 
   apcb102 LIKE apcb_t.apcb102, 
   apcb034 LIKE apcb_t.apcb034, 
   apcb054 LIKE apcb_t.apcb054, 
   apcb055 LIKE apcb_t.apcb055, 
   apcb036 LIKE apcb_t.apcb036, 
   l_apcb0332 LIKE type_t.chr500, 
   apcb035 LIKE apcb_t.apcb035, 
   apcb037 LIKE apcb_t.apcb037, 
   apcb038 LIKE apcb_t.apcb038, 
   apcb039 LIKE apcb_t.apcb039, 
   apcb040 LIKE apcb_t.apcb040, 
   apcb041 LIKE apcb_t.apcb041, 
   apcb042 LIKE apcb_t.apcb042, 
   apcb043 LIKE apcb_t.apcb043, 
   apcb044 LIKE apcb_t.apcb044, 
   apcb045 LIKE apcb_t.apcb045, 
   apcb046 LIKE apcb_t.apcb046
       END RECORD
PRIVATE TYPE type_g_apcb2_d RECORD
       xrcdseq LIKE xrcd_t.xrcdseq, 
   xrcdseq2 LIKE xrcd_t.xrcdseq2, 
   imaa003_desc LIKE type_t.chr500, 
   xrcd007 LIKE xrcd_t.xrcd007, 
   xrcd002 LIKE xrcd_t.xrcd002, 
   xrcd002_desc LIKE type_t.chr500, 
   xrcd003 LIKE xrcd_t.xrcd003, 
   xrcd006 LIKE xrcd_t.xrcd006, 
   xrcd005 LIKE xrcd_t.xrcd005, 
   xrcd102 LIKE xrcd_t.xrcd102, 
   xrcd103 LIKE xrcd_t.xrcd103, 
   xrcd104 LIKE xrcd_t.xrcd104, 
   xrcd105 LIKE xrcd_t.xrcd105, 
   xrcd113 LIKE xrcd_t.xrcd113, 
   xrcd114 LIKE xrcd_t.xrcd114, 
   xrcd115 LIKE xrcd_t.xrcd115, 
   xrcd123 LIKE xrcd_t.xrcd123, 
   xrcd124 LIKE xrcd_t.xrcd124, 
   xrcd125 LIKE xrcd_t.xrcd125, 
   xrcd133 LIKE xrcd_t.xrcd133, 
   xrcd134 LIKE xrcd_t.xrcd134, 
   xrcd135 LIKE xrcd_t.xrcd135, 
   xrcdorga LIKE xrcd_t.xrcdorga, 
   xrcd009 LIKE xrcd_t.xrcd009, 
   xrcd009_desc LIKE type_t.chr500
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_apcadocno LIKE apca_t.apcadocno,
      b_apcald LIKE apca_t.apcald,
   b_apcald_desc LIKE type_t.chr80,
      b_apca001 LIKE apca_t.apca001,
      b_apca003 LIKE apca_t.apca003,
   b_apca003_desc LIKE type_t.chr80,
      b_apca004 LIKE apca_t.apca004,
   b_apca004_desc LIKE type_t.chr80,
      b_apca005 LIKE apca_t.apca005,
   b_apca005_desc LIKE type_t.chr80
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
GLOBALS
TYPE type_g_apcb_d1        RECORD
       apcbdocno LIKE apcb_t.apcbdocno, 
       apcbld LIKE apcb_t.apcbld, 
       apcbseq LIKE apcb_t.apcbseq, 
       apcb047 LIKE apcb_t.apcb047, 
       apcb021 LIKE apcb_t.apcb021, 
       l_apcb021_desc LIKE type_t.chr500, 
       apcb029 LIKE apcb_t.apcb029, 
       l_apcb029_desc LIKE type_t.chr500, 
       apcb051 LIKE apcb_t.apcb051, 
       l_apcb051_desc LIKE type_t.chr500, 
       apcb010 LIKE apcb_t.apcb010, 
       l_apcb010_desc LIKE type_t.chr500, 
       apcb011 LIKE apcb_t.apcb011, 
       l_apcb011_desc LIKE type_t.chr500, 
       apcb024 LIKE apcb_t.apcb024, 
       l_apcb024_desc LIKE type_t.chr500, 
       apcb012 LIKE apcb_t.apcb012, 
       l_apcb012_desc LIKE type_t.chr500, 
       apcb015 LIKE apcb_t.apcb015, 
       l_apcb015_desc LIKE type_t.chr500, 
       apcb016 LIKE apcb_t.apcb016, 
       l_apcb016_desc LIKE type_t.chr500, 
       apcb017 LIKE apcb_t.apcb017,          #160902-00034#1  
       l_apcb017_desc LIKE type_t.chr500,    #160902-00034#1  
       apcb033 LIKE apcb_t.apcb033, 
       apcb034 LIKE apcb_t.apcb034, 
       l_apcb034_desc LIKE type_t.chr500, 
       apcb035 LIKE apcb_t.apcb035, 
       l_apcb035_desc LIKE type_t.chr500, 
       apcb036 LIKE apcb_t.apcb036, 
       l_apcb036_desc LIKE type_t.chr500,
       #160509-00004#110--add--str--lujh
       apcb054 LIKE apcb_t.apcb054, 
       l_apcb054_desc LIKE type_t.chr500, 
       apcb055 LIKE apcb_t.apcb055, 
       l_apcb055_desc LIKE type_t.chr500, 
       #160509-00004#110--add--end--lujh       
       apcb037 LIKE apcb_t.apcb037, 
       l_apcb037_desc LIKE type_t.chr500, 
       apcb038 LIKE apcb_t.apcb038, 
       l_apcb038_desc LIKE type_t.chr500, 
       apcb039 LIKE apcb_t.apcb039, 
       l_apcb039_desc LIKE type_t.chr500, 
       apcb040 LIKE apcb_t.apcb040, 
       l_apcb040_desc LIKE type_t.chr500, 
       apcb041 LIKE apcb_t.apcb041, 
       l_apcb041_desc LIKE type_t.chr500, 
       apcb042 LIKE apcb_t.apcb042, 
       l_apcb042_desc LIKE type_t.chr500, 
       apcb043 LIKE apcb_t.apcb043, 
       l_apcb043_desc LIKE type_t.chr500, 
       apcb044 LIKE apcb_t.apcb044, 
       l_apcb044_desc LIKE type_t.chr500, 
       apcb045 LIKE apcb_t.apcb045, 
       l_apcb045_desc LIKE type_t.chr500, 
       apcb046 LIKE apcb_t.apcb046, 
       l_apcb046_desc LIKE type_t.chr500, 
       img1 LIKE type_t.chr500
       END RECORD
TYPE type_g_isam_d RECORD
       isam001 LIKE isam_t.isam001, 
       isamdocno LIKE isam_t.isamdocno, 
       isamseq LIKE isam_t.isamseq, 
       isam008 LIKE isam_t.isam008, 
       isam037 LIKE isam_t.isam037, 
       isam011 LIKE isam_t.isam011, 
       isam010 LIKE isam_t.isam010, 
       isam030 LIKE isam_t.isam030, 
       l_pmaal002_desc LIKE type_t.chr500, #170414-00037#1 add        
       isam009 LIKE isam_t.isam009, 
       isam012 LIKE isam_t.isam012, 
       isam012_desc_desc LIKE type_t.chr500, 
       isam0121 LIKE isam_t.isam0121, 
       isam013 LIKE isam_t.isam013, 
       isam014 LIKE isam_t.isam014, 
       isam015 LIKE isam_t.isam015, 
       isam023 LIKE isam_t.isam023, 
       isam024 LIKE isam_t.isam024, 
       isam025 LIKE isam_t.isam025, 
       isam026 LIKE isam_t.isam026, 
       isam027 LIKE isam_t.isam027, 
       isam028 LIKE isam_t.isam028, 
       isamcomp LIKE isam_t.isamcomp, 
       isamstus LIKE isam_t.isamstus, 
       isam002 LIKE isam_t.isam002, 
       isam004 LIKE isam_t.isam004, 
       isam016 LIKE isam_t.isam016, 
       isam017 LIKE isam_t.isam017, 
       isam018 LIKE isam_t.isam018, 
       isam019 LIKE isam_t.isam019, 
       isam020 LIKE isam_t.isam020, 
       isam021 LIKE isam_t.isam021, 
       isam022 LIKE isam_t.isam022, 
       isam029 LIKE isam_t.isam029, 
       isam031 LIKE isam_t.isam031, 
       isam032 LIKE isam_t.isam032, 
       isam033 LIKE isam_t.isam033, 
       isam034 LIKE isam_t.isam034, 
       isam038 LIKE isam_t.isam038, 
       isam039 LIKE isam_t.isam039
       END RECORD
DEFINE g_apcb_d4         DYNAMIC ARRAY OF type_g_apcb_d1
DEFINE g_apcb_d5         DYNAMIC ARRAY OF type_g_isam_d
DEFINE g_wc_t300_08      STRING               #其他訊息QBE條件
END GLOBALS
#單身 type 宣告
TYPE type_g_apcb3_d          RECORD              #其他本位幣
                             apcbseq  LIKE  apcb_t.apcbseq,
                             apcb002  LIKE  apcb_t.apcb002,
                             apcb003  LIKE  apcb_t.apcb003,
                             apcb004  LIKE  apcb_t.apcb004,
                             apcb005  LIKE  apcb_t.apcb005,
                             apcb103  LIKE  apcb_t.apcb103,
                             apcb105  LIKE  apcb_t.apcb105,
                             apcb113  LIKE  apcb_t.apcb113,
                             apcb114  LIKE  apcb_t.apcb114,
                             apcb115  LIKE  apcb_t.apcb115,
                             apcb123  LIKE  apcb_t.apcb123,
                             apcb124  LIKE  apcb_t.apcb124,
                             apcb125  LIKE  apcb_t.apcb125,
                             apcb133  LIKE  apcb_t.apcb133,
                             apcb134  LIKE  apcb_t.apcb134,
                             apcb135  LIKE  apcb_t.apcb135,
                             apcborga LIKE  apcb_t.apcborga,
                             apcb020  LIKE  apcb_t.apcb020
                         END RECORD
DEFINE g_glaa                RECORD
                             glaacomp  LIKE glaa_t.glaacomp,
                             glaa001   LIKE glaa_t.glaa001,
                             glaa004   LIKE glaa_t.glaa004,
                             glaa015   LIKE glaa_t.glaa015,
                             glaa016   LIKE glaa_t.glaa016,
                             glaa017   LIKE glaa_t.glaa017,
                             glaa019   LIKE glaa_t.glaa019,
                             glaa020   LIKE glaa_t.glaa020,
                             glaa021   LIKE glaa_t.glaa021,
                             glaa024   LIKE glaa_t.glaa024,
                             glaa120   LIKE glaa_t.glaa120,       #160107-00001#1
                             glaa121   LIKE glaa_t.glaa121,
                             glaa025   LIKE glaa_t.glaa025,       #160107-00001#1
                             glaa018   LIKE glaa_t.glaa018,       #160107-00001#1
                             glaa022   LIKE glaa_t.glaa022        #160107-00001#1
                         END RECORD
DEFINE g_apcb3_d             DYNAMIC ARRAY OF type_g_apcb3_d
DEFINE g_apcb3_d_t           type_g_apcb3_d
DEFINE g_fin_arg1            LIKE gzsz_t.gzsz002      #財務應用參數(定義於azzi991)D-FIN-3001--應付帳款單性質
DEFINE g_ooef019             LIKE ooef_t.ooef019      #稅區參照表(依據所屬法人所帶的設定)
DEFINE g_ap_slip             LIKE ooba_t.ooba002      #應付帳款單單別
DEFINE g_gl_slip             LIKE ooba_t.ooba002      #總帳單別
DEFINE g_page_mark           LIKE type_t.chr100
DEFINE g_wc_apcasite         STRING                   #帳務組織條件
DEFINE g_wc_apcald           STRING
DEFINE g_sfin2002            LIKE type_t.chr100       #沖銷參數
DEFINE g_sfin3010            LIKE apca_t.apca011      #應付暫估預設稅別
DEFINE g_sfin3012            LIKE type_t.chr1         #應付暫估立帳選項
DEFINE g_dfin0030            LIKE type_t.chr1
DEFINE g_dfin5002            LIKE type_t.chr1         #新增預算控管   #150703-00021#24
DEFINE g_glab003             LIKE glab_t.glab003      #預設會科代碼 for apca036 對於 apca001不同狀況會不同所使用  
DEFINE gc_paramtax           RECORD                   #檢查稅別設定
         chktype             LIKE type_t.chr10,       #1.稅別基本檢查/2.發票開立方式/3.限定零稅
         apcacomp            LIKE apca_t.apcacomp,    #法人
         ooef019             LIKE ooef_t.ooef019,     #稅區
         apca011             LIKE apca_t.apca011,     #稅別
         apca012             LIKE apca_t.apca012,     #稅率
         apca060             LIKE apca_t.apca060      #發票開立方式
                         END RECORD

DEFINE  g_tran  RECORD             #150703-00021#24  ---s---
            act       LIKE type_t.chr10,   #[1].chr 動作
            site      LIKE ooef_t.ooef001, #[2].chr 預算組織
            dat       LIKE type_t.dat,     #[3].dat 日期
            bgae001   LIKE bgae_t.bgae001 #[4].chr 預算項目
END RECORD                        #150703-00021#24   ---e---
DEFINE g_wc_apcbxrcd1        STRING                #160822-00007#1
DEFINE g_wc_apcbxrcd2        STRING                #160822-00007#1
DEFINE g_sql_ctrl            STRING                #151231-00010#1
DEFINE g_wc_cs_ld            STRING                #160125-00005#6
DEFINE g_wc_cs_orga          STRING                #160125-00005#6
DEFINE g_xcat005             LIKE xcat_t.xcat005   #160107-00001#1
DEFINE g_site_str            STRING                #161014-00053#3
#160802-00007#2-----s
DEFINE g_s300ar            RECORD
                           apca001    LIKE apca_t.apca001,
                           apca057    LIKE apca_t.apca057,
                           apcald     LIKE apca_t.apcald,
                           apca100    LIKE apca_t.apca100  #170616-00008#1 add
                           END RECORD
#160802-00007#2-----e
DEFINE g_wc_cs_comp        STRING  #161229-00047#43 add
DEFINE g_comp_str          STRING  #161229-00047#43 add 
#161104-00046#19 --s add
DEFINE g_user_dept_wc   STRING     
DEFINE g_user_dept_wc_q STRING     
DEFINE g_user_slip_wc   STRING  
#161104-00046#19 --e add
DEFINE g_apcadocno           LIKE apca_t.apcadocno #170713-00046#1 add 判斷是否刪除ㄧ次性交易對象pmak_t


#170512-00045#10 add ------
DEFINE g_glaq_s            DYNAMIC ARRAY OF RECORD
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
#170512-00045#10 add end---

#end add-point
       
#模組變數(Module Variables)
DEFINE g_apca_m          type_g_apca_m
DEFINE g_apca_m_t        type_g_apca_m
DEFINE g_apca_m_o        type_g_apca_m
DEFINE g_apca_m_mask_o   type_g_apca_m #轉換遮罩前資料
DEFINE g_apca_m_mask_n   type_g_apca_m #轉換遮罩後資料
 
   DEFINE g_apcald_t LIKE apca_t.apcald
DEFINE g_apcadocno_t LIKE apca_t.apcadocno
 
 
DEFINE g_apcb_d          DYNAMIC ARRAY OF type_g_apcb_d
DEFINE g_apcb_d_t        type_g_apcb_d
DEFINE g_apcb_d_o        type_g_apcb_d
DEFINE g_apcb_d_mask_o   DYNAMIC ARRAY OF type_g_apcb_d #轉換遮罩前資料
DEFINE g_apcb_d_mask_n   DYNAMIC ARRAY OF type_g_apcb_d #轉換遮罩後資料
DEFINE g_apcb2_d          DYNAMIC ARRAY OF type_g_apcb2_d
DEFINE g_apcb2_d_t        type_g_apcb2_d
DEFINE g_apcb2_d_o        type_g_apcb2_d
DEFINE g_apcb2_d_mask_o   DYNAMIC ARRAY OF type_g_apcb2_d #轉換遮罩前資料
DEFINE g_apcb2_d_mask_n   DYNAMIC ARRAY OF type_g_apcb2_d #轉換遮罩後資料
 
 
DEFINE g_browser         DYNAMIC ARRAY OF type_browser
DEFINE g_browser_f       DYNAMIC ARRAY OF type_browser
 
 
DEFINE g_wc                  STRING
DEFINE g_wc_t                STRING
DEFINE g_wc2                 STRING                          #單身CONSTRUCT結果
DEFINE g_wc2_table1          STRING
DEFINE g_wc2_table2   STRING
 
 
 
DEFINE g_wc2_extend          STRING
DEFINE g_wc_filter           STRING
DEFINE g_wc_filter_t         STRING
 
DEFINE g_sql                 STRING
DEFINE g_forupd_sql          STRING
DEFINE g_cnt                 LIKE type_t.num10
DEFINE g_current_idx         LIKE type_t.num10     
DEFINE g_jump                LIKE type_t.num10        
DEFINE g_no_ask              LIKE type_t.num5        
DEFINE g_rec_b               LIKE type_t.num10           
DEFINE l_ac                  LIKE type_t.num10    
DEFINE g_curr_diag           ui.Dialog                         #Current Dialog
                                                               
DEFINE g_pagestart           LIKE type_t.num10                 
DEFINE gwin_curr             ui.Window                         #Current Window
DEFINE gfrm_curr             ui.Form                           #Current Form
DEFINE g_page_action         STRING                            #page action
DEFINE g_header_hidden       LIKE type_t.num5                  #隱藏單頭
DEFINE g_worksheet_hidden    LIKE type_t.num5                  #隱藏工作Panel
DEFINE g_page                STRING                            #第幾頁
DEFINE g_state               STRING       
DEFINE g_header_cnt          LIKE type_t.num10
DEFINE g_detail_cnt          LIKE type_t.num10                  #單身總筆數
DEFINE g_detail_idx          LIKE type_t.num10                  #單身目前所在筆數
DEFINE g_detail_idx_tmp      LIKE type_t.num10                  #單身目前所在筆數
DEFINE g_detail_idx2         LIKE type_t.num10                  #單身2目前所在筆數
DEFINE g_detail_idx_list     DYNAMIC ARRAY OF LIKE type_t.num10 #單身2目前所在筆數
DEFINE g_browser_cnt         LIKE type_t.num10                  #Browser總筆數
DEFINE g_browser_idx         LIKE type_t.num10                  #Browser目前所在筆數
DEFINE g_temp_idx            LIKE type_t.num10                  #Browser目前所在筆數(暫存用)
DEFINE g_order               STRING                             #查詢排序欄位
                                                        
DEFINE g_current_row         LIKE type_t.num10                  #Browser所在筆數
DEFINE g_current_sw          BOOLEAN                            #Browser所在筆數用開關
DEFINE g_current_page        LIKE type_t.num10                  #目前所在頁數
DEFINE g_insert              LIKE type_t.chr5                   #是否導到其他page
 
DEFINE g_ref_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_ref_vars            DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE gs_keys               DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE gs_keys_bak           DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE g_bfill               LIKE type_t.chr5              #是否刷新單身
DEFINE g_error_show          LIKE type_t.num5              #是否顯示筆數提示訊息
DEFINE g_master_insert       BOOLEAN                       #確認單頭資料是否寫入
 
DEFINE g_wc_frozen           STRING                        #凍結欄位使用
DEFINE g_chk                 BOOLEAN                       #助記碼判斷用
DEFINE g_aw                  STRING                        #確定當下點擊的單身
DEFINE g_default             BOOLEAN                       #是否有外部參數查詢
DEFINE g_log1                STRING                        #log用
DEFINE g_log2                STRING                        #log用
DEFINE g_loc                 LIKE type_t.chr5              #判斷游標所在位置
DEFINE g_add_browse          STRING                        #新增填充用WC
DEFINE g_update              BOOLEAN                       #確定單頭/身是否異動過
DEFINE g_idx_group           om.SaxAttributes              #頁籤群組
DEFINE g_master_commit       LIKE type_t.chr1              #確認單頭是否修改過
DEFINE g_err_rec             LIKE type_t.chr1              #紀錄是否有錯誤   #161130-00056
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
#add-point:傳入參數說明(global.argv) name="global.argv"

#end add-point
 
{</section>}
 
{<section id="aapt320.main" >}
#應用 a26 樣板自動產生(Version:7)
#+ 作業開始(主程式類型)
MAIN
   #add-point:main段define(客製用) name="main.define_customerization"
   
   #end add-point   
   #add-point:main段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="main.define"
   
   #end add-point   
   
   OPTIONS
   INPUT NO WRAP
   DEFER INTERRUPT
   
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log
       
   #依模組進行系統初始化設定(系統設定)
   CALL cl_ap_init("aap","")
 
   #add-point:作業初始化 name="main.init"
   #scc/acc預設值
   LET g_fin_arg1 = 'D-FIN-3001'
   #161111-00042#2 --s mark
   ##151231-00010#1(S)
   #LET g_sql_ctrl = NULL
   #CALL s_control_get_supplier_sql('4',g_site,g_user,g_dept,'') RETURNING g_sub_success,g_sql_ctrl
   ##151231-00010#1(E)   
   #161111-00042#2 --e mark
   #161111-00042#2 --s add
   LET g_sql_ctrl = NULL
   SELECT ooef017 INTO g_apca_m.apcacomp FROM ooef_t WHERE ooefent = g_enterprise AND ooef001 = g_site AND ooefstus = 'Y'
   #CALL s_control_get_supplier_sql_pmab('4',g_site,g_user,g_dept,'',g_apca_m.apcacomp) RETURNING g_sub_success,g_sql_ctrl #161229-00047#43 mark
   #161111-00042#2 --e add
   CALL s_aap_create_multi_bill_perod_tmp()                 #新增多帳期FUNCTION用的TEMP TABLE
   CALL s_fin_create_account_center_tmp()                   #展組織下階成員所需之暫存檔
   CALL s_aapp330_cre_tmp()       RETURNING g_sub_success   
   CALL s_aooi390_cre_tmp_table() RETURNING g_sub_success
   CALL s_fin_azzi800_sons_query(g_today)                      #160125-00005#6
   CALL s_fin_account_center_ld_str() RETURNING g_wc_cs_ld     #160125-00005#6
   CALL s_fin_get_wc_str(g_wc_cs_ld) RETURNING g_wc_cs_ld      #160125-00005#6
   CALL s_fin_account_center_sons_str() RETURNING g_wc_cs_orga #160125-00005#6
   CALL s_fin_get_wc_str(g_wc_cs_orga) RETURNING g_wc_cs_orga  #160125-00005#6
   #161229-00047#43 --s add
   CALL s_fin_account_center_comp_str() RETURNING g_wc_cs_comp   
   CALL s_fin_get_wc_str(g_wc_cs_comp) RETURNING g_wc_cs_comp      
   CALL s_control_get_supplier_sql_pmab('4',g_site,g_user,g_dept,'',g_wc_cs_comp) RETURNING g_sub_success,g_sql_ctrl
   #161229-00047#43 --e add  
      #161104-00046#19 --s add
   #建立與單頭array相同的temptable
   CALL s_aooi200def_create('','g_apca_m','','','','','','')RETURNING g_sub_success
   #單別控制組
   LET g_user_dept_wc = ''
   CALL s_fin_get_user_dept_control('','apcald','apcaent','apcadocno') RETURNING g_user_dept_wc
   #開窗使用
   LET g_user_dept_wc_q = g_user_dept_wc
   CALL s_control_get_docno_sql(g_user,g_dept) RETURNING g_sub_success,g_user_slip_wc  
   #161104-00046#19 --e add
   #end add-point
   
   
 
   #LOCK CURSOR (identifier)
   #add-point:SQL_define name="main.define_sql"
   
   LET g_sql = "SELECT apcbseq,apcborga,apcb020,apcb007,apcb101,apcb111,",
               "       apcb103,apcb104 ,apcb105,apcb113,apcb114,apcb115,",
               "       apcb123,apcb124 ,apcb125,apcb133,apcb134,apcb135",
               "  FROM apcb_t",
               " WHERE apcbent= ? AND apcbld=?  AND apcbdocno=?"
   DECLARE aapt320_c2 CURSOR WITH HOLD FROM g_sql
   #end add-point
   LET g_forupd_sql = " SELECT apcasite,'',apca003,'',apcald,'',apcacomp,'',apcadocno,apca001,'',apcadocdt, 
       apca004,'',apca005,'',apca038,apca006,apca057,apcastus,apca065,apca066,apca008,'',apca009,apca010, 
       apca060,apca013,apca012,apca011,'',apca007,'',apca036,'',apca035,'',apca100,apca103,apca104,apca106, 
       '',apca108,'','','',apca101,apca113,apca114,apca116,'',apca118,'','','',apca039,apca056,apca016, 
       apca055,'',apca018,apca019,apca014,'',apca054,'',apca015,'',apca034,'',apca033,'',apca058,'', 
       apca059,'',apca063,apca050,apca052,apca017,'',apca051,'',apca053,apca025,apca031,apca030,'','', 
       apca026,apca027,apca028,apca029,apca020,apca021,apca022,apca046,'',apca047,apca048,'','','','', 
       '','','','','','',apca120,apca121,apca130,apca131,'',apca123,apca133,'',apca124,apca134,'',apca126, 
       apca136,'','','','',apca128,apca138,'','','','','','',apcaownid,'',apcaowndp,'',apcacrtid,'', 
       apcacrtdp,'',apcacrtdt,apcamodid,'',apcamoddt,apcacnfid,'',apcacnfdt,'','','','','',''", 
                      " FROM apca_t",
                      " WHERE apcaent= ? AND apcald=? AND apcadocno=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE aapt320_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.apcasite,t0.apca003,t0.apcald,t0.apcacomp,t0.apcadocno,t0.apca001, 
       t0.apcadocdt,t0.apca004,t0.apca005,t0.apca038,t0.apca006,t0.apca057,t0.apcastus,t0.apca065,t0.apca066, 
       t0.apca008,t0.apca009,t0.apca010,t0.apca060,t0.apca013,t0.apca012,t0.apca011,t0.apca007,t0.apca036, 
       t0.apca035,t0.apca100,t0.apca103,t0.apca104,t0.apca106,t0.apca108,t0.apca101,t0.apca113,t0.apca114, 
       t0.apca116,t0.apca118,t0.apca039,t0.apca056,t0.apca016,t0.apca055,t0.apca018,t0.apca019,t0.apca014, 
       t0.apca054,t0.apca015,t0.apca034,t0.apca033,t0.apca058,t0.apca059,t0.apca063,t0.apca050,t0.apca052, 
       t0.apca017,t0.apca051,t0.apca053,t0.apca025,t0.apca031,t0.apca030,t0.apca026,t0.apca027,t0.apca028, 
       t0.apca029,t0.apca020,t0.apca021,t0.apca022,t0.apca046,t0.apca047,t0.apca048,t0.apca120,t0.apca121, 
       t0.apca130,t0.apca131,t0.apca123,t0.apca133,t0.apca124,t0.apca134,t0.apca126,t0.apca136,t0.apca128, 
       t0.apca138,t0.apcaownid,t0.apcaowndp,t0.apcacrtid,t0.apcacrtdp,t0.apcacrtdt,t0.apcamodid,t0.apcamoddt, 
       t0.apcacnfid,t0.apcacnfdt,t1.ooefl003 ,t2.ooag011 ,t3.glaal002 ,t4.pmaal004 ,t5.pmaal004 ,t6.ooibl004 , 
       t7.oocql004 ,t8.ooidl003 ,t9.ooag011 ,t10.oocql004 ,t11.ooefl003 ,t12.ooefl003 ,t13.ooefl003 , 
       t14.oocql004 ,t15.bgaal003 ,t16.glacl004 ,t17.ooag011 ,t18.ooefl003 ,t19.ooag011 ,t20.ooefl003 , 
       t21.ooag011 ,t22.ooag011",
               " FROM apca_t t0",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.apcasite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t2 ON t2.ooagent="||g_enterprise||" AND t2.ooag001=t0.apca003  ",
               " LEFT JOIN glaal_t t3 ON t3.glaalent="||g_enterprise||" AND t3.glaalld=t0.apcald AND t3.glaal001='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t4 ON t4.pmaalent="||g_enterprise||" AND t4.pmaal001=t0.apca004 AND t4.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t5 ON t5.pmaalent="||g_enterprise||" AND t5.pmaal001=t0.apca005 AND t5.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN ooibl_t t6 ON t6.ooiblent="||g_enterprise||" AND t6.ooibl002=t0.apca008 AND t6.ooibl003='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t7 ON t7.oocqlent="||g_enterprise||" AND t7.oocql001='3211' AND t7.oocql002=t0.apca007 AND t7.oocql003='"||g_dlang||"' ",
               " LEFT JOIN ooidl_t t8 ON t8.ooidlent="||g_enterprise||" AND t8.ooidl001=t0.apca055 AND t8.ooidl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t9 ON t9.ooagent="||g_enterprise||" AND t9.ooag001=t0.apca014  ",
               " LEFT JOIN oocql_t t10 ON t10.oocqlent="||g_enterprise||" AND t10.oocql001='3114' AND t10.oocql002=t0.apca054 AND t10.oocql003='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t11 ON t11.ooeflent="||g_enterprise||" AND t11.ooefl001=t0.apca015 AND t11.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t12 ON t12.ooeflent="||g_enterprise||" AND t12.ooefl001=t0.apca034 AND t12.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t13 ON t13.ooeflent="||g_enterprise||" AND t13.ooefl001=t0.apca033 AND t13.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t14 ON t14.oocqlent="||g_enterprise||" AND t14.oocql001='264' AND t14.oocql002=t0.apca058 AND t14.oocql003='"||g_dlang||"' ",
               " LEFT JOIN bgaal_t t15 ON t15.bgaalent="||g_enterprise||" AND t15.bgaal001=t0.apca059 AND t15.bgaal002='"||g_dlang||"' ",
               " LEFT JOIN glacl_t t16 ON t16.glaclent="||g_enterprise||" AND t16.glacl001='' AND t16.glacl002=t0.apca030 AND t16.glacl003='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t17 ON t17.ooagent="||g_enterprise||" AND t17.ooag001=t0.apcaownid  ",
               " LEFT JOIN ooefl_t t18 ON t18.ooeflent="||g_enterprise||" AND t18.ooefl001=t0.apcaowndp AND t18.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t19 ON t19.ooagent="||g_enterprise||" AND t19.ooag001=t0.apcacrtid  ",
               " LEFT JOIN ooefl_t t20 ON t20.ooeflent="||g_enterprise||" AND t20.ooefl001=t0.apcacrtdp AND t20.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t21 ON t21.ooagent="||g_enterprise||" AND t21.ooag001=t0.apcamodid  ",
               " LEFT JOIN ooag_t t22 ON t22.ooagent="||g_enterprise||" AND t22.ooag001=t0.apcacnfid  ",
 
               " WHERE t0.apcaent = " ||g_enterprise|| " AND t0.apcald = ? AND t0.apcadocno = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE aapt320_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_aapt320 WITH FORM cl_ap_formpath("aap",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL aapt320_init()   
 
      #進入選單 Menu (="N")
      CALL aapt320_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_aapt320
      
   END IF 
   
   CLOSE aapt320_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi390_drop_tmp_table()
   DROP TABLE s_aap_tmp1            #多帳期
   DROP TABLE s_fin_tmp1            #下層組織
   DROP TABLE s_voucher_tmp         #分錄底稿
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="aapt320.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION aapt320_init()
   #add-point:init段define(客製用) name="init.define_customerization"
   
   #end add-point    
   #add-point:init段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   DEFINE l_sql        STRING
   DEFINE l_str        STRING
   
   #end add-point   
   
   #add-point:Function前置處理  name="init.pre_function"
   
   #end add-point
   
   LET g_bfill       = "Y"
   LET g_detail_idx  = 1 #第一層單身指標
   LET g_detail_idx2 = 1 #第二層單身指標
   
   #各個page指標
   LET g_detail_idx_list[1] = 1 
   LET g_detail_idx_list[2] = 1
 
   LET g_error_show  = 1
   LET l_ac = 1 #單身指標
   LET g_err_rec = "N"   #161130-00056
      CALL cl_set_combo_scc_part('apcastus','13','N,Y,A,D,R,W,X')
 
      CALL cl_set_combo_scc('apca001','8502') 
   CALL cl_set_combo_scc('apca060','8321') 
   CALL cl_set_combo_scc('apcb001','8540') 
 
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")
   CALL g_idx_group.addAttribute("'2',","1")
 
 
   #add-point:畫面資料初始化 name="init.init"
   CALL cl_ui_replace_sub_window(cl_ap_formpath("aap", "aapt300_08"), "grid_8", "Table","s_detail1_aapt300_08")　　　#畫面-單身其他訊息
   CALL cl_ui_replace_sub_window(cl_ap_formpath("aap", "aapt300_13"), "grid_7", "Grid", "master")　　　#載入留置子畫面
   CALL cl_set_comp_att_text("lbl_apca036",cl_getmsg("aap-00288",g_dlang))
   CALL cl_set_comp_att_text("l_apcb021_desc",cl_getmsg("aap-00288",g_dlang))
   CALL cl_set_comp_att_text("apcb021",cl_getmsg("aap-00288",g_dlang))
   CALL cl_set_combo_scc('apca017','8324')                  #產生方式
   CALL cl_set_combo_scc('apca025','8511')                  #差異處理
   CALL cl_set_combo_scc('apca056','8323')                  #會計檢核附件狀態
   CALL cl_set_combo_scc('apca060','8321')                  #發票開立方式
   LET l_str = s_fin_last_doc_fields(g_prog,'8540','2|3')   #取得可用的來源類型       
   CALL cl_set_combo_scc_part('apca016','8540',l_str)       #來源作業類型
   CALL cl_set_combo_scc_part('apcb001','8540',l_str)       #來源作業類型
   LET l_str = s_fin_last_doc_fields(g_prog,'8502','3|3')   #取得可用的來源類型       
   CALL cl_set_combo_scc_part('b_apca001','8502',l_str)     #帳款單性質
   CALL cl_set_combo_scc_part('apca001','8502',l_str)       #帳款單性質 
   CALL cl_set_combo_scc('apcb033','6013') #170512-00045#10   
   #end add-point
   
   #初始化搜尋條件
   CALL aapt320_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="aapt320.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION aapt320_ui_dialog()
   #add-point:ui_dialog段define(客製用) name="ui_dialog.define_customerization"
   
   #end add-point
   DEFINE li_idx     LIKE type_t.num10
   DEFINE ls_wc      STRING
   DEFINE lb_first   BOOLEAN
   DEFINE la_wc      DYNAMIC ARRAY OF RECORD
          tableid    STRING,
          wc         STRING
          END RECORD
   DEFINE la_param   RECORD
          prog       STRING,
          actionid   STRING,
          background LIKE type_t.chr1,
          param      DYNAMIC ARRAY OF STRING
          END RECORD
   DEFINE ls_js      STRING
   DEFINE la_output  DYNAMIC ARRAY OF STRING   #報表元件鬆耦合使用
   DEFINE  l_cmd_token           base.StringTokenizer   #報表作業cmdrun使用 
   DEFINE  l_cmd_next            STRING                 #報表作業cmdrun使用
   DEFINE  l_cmd_cnt             LIKE type_t.num5       #報表作業cmdrun使用
   DEFINE  l_cmd_prog_arg        STRING                 #報表作業cmdrun使用
   DEFINE  l_cmd_arg             STRING                 #報表作業cmdrun使用
   #(ver:87) ---add start---
   DEFINE l_arr_len       INTEGER
   DEFINE l_arr_cnt       INTEGER
   DEFINE lb_get_type     LIKE type_t.chr20
   #(ver:87) --- add end ---
   #add-point:ui_dialog段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_dialog.define"
   DEFINE l_chr     LIKE type_t.chr1       #狀態碼
   DEFINE l_diff    LIKE apca_t.apca108    #差異金額
   DEFINE l_glap001 LIKE glap_t.glap001    #傳票性質
   DEFINE l_cnt        LIKE type_t.num5
   DEFINE la_param1  RECORD            #160104-00007#3--(S)
             glaald  LIKE glaa_t.glaald,
             type	   LIKE type_t.chr10,
             wc      STRING
                 END RECORD
   DEFINE l_glapstus  LIKE glap_t.glapstus
   DEFINE l_glapdocdt LIKE glap_t.glapdocdt 
   DEFINE l_glaa013   LIKE glaa_t.glaa013     #160104-00007#3--(E)
   DEFINE l_date_close LIKE glap_t.glapdocdt         #170724-00040#1 add
   #end add-point
   
   #add-point:Function前置處理  name="ui_dialog.pre_function"
   
   #end add-point
   
   CALL cl_set_act_visible("accept,cancel", FALSE)
 
   #因應查詢方案進行處理
   IF g_default THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   ELSE
      CALL gfrm_curr.setElementHidden("mainlayout",1)
      CALL gfrm_curr.setElementHidden("worksheet",0)
      LET g_main_hidden = 1
   END IF
   
   #action default動作
   #應用 a42 樣板自動產生(Version:3)
   #進入程式時預設執行的動作
   CASE g_actdefault
      WHEN "insert"
         LET g_action_choice="insert"
         LET g_actdefault = ""
         IF cl_auth_chk_act("insert") THEN
            CALL aapt320_insert()
            #add-point:ON ACTION insert name="menu.default.insert"
            
            #END add-point
         END IF
 
      #add-point:action default自訂 name="ui_dialog.action_default"
      
      #end add-point
      OTHERWISE
   END CASE
 
 
 
   
   LET lb_first = TRUE
   
   #add-point:ui_dialog段before dialog  name="ui_dialog.before_dialog"
   
   #end add-point
   
   WHILE TRUE 
   
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_browser.clear()       
         INITIALIZE g_apca_m.* TO NULL
         CALL g_apcb_d.clear()
         CALL g_apcb2_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL aapt320_init()
      END IF
   
      CALL lib_cl_dlg.cl_dlg_before_display()
            
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
         #左側瀏覽頁簽
         DISPLAY ARRAY g_browser TO s_browse.* ATTRIBUTES(COUNT=g_header_cnt)
            BEFORE ROW
               #回歸舊筆數位置 (回到當時異動的筆數)
               LET g_current_idx = DIALOG.getCurrentRow("s_browse")
               IF g_current_row > 1 AND g_current_idx = 1 AND g_current_sw = FALSE THEN
                  CALL DIALOG.setCurrentRow("s_browse",g_current_row)
                  LET g_current_idx = g_current_row
               END IF
               LET g_current_row = g_current_idx #目前指標
               LET g_current_sw = TRUE
         
               IF g_current_idx > g_browser.getLength() THEN
                  LET g_current_idx = g_browser.getLength()
               END IF 
               
               CALL aapt320_fetch('') # reload data
               LET l_ac = 1
               CALL aapt320_ui_detailshow() #Setting the current row 
         
               CALL aapt320_idx_chk()
               #NEXT FIELD apcbseq
         
               ON ACTION qbefield_user   #欄位隱藏設定 
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
         END DISPLAY
    
         DISPLAY ARRAY g_apcb_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL aapt320_idx_chk()
               #確定當下選擇的筆數
               LET l_ac = DIALOG.getCurrentRow("s_detail1")
               LET g_detail_idx = l_ac
               LET g_detail_idx_list[1] = l_ac
               CALL g_idx_group.addAttribute("'1',",l_ac)
               
               #add-point:page1, before row動作 name="ui_dialog.page1.before_row"
               
               #end add-point
               
            BEFORE DISPLAY
               #如果一直都在單身1則控制筆數位置
               IF g_loc = 'm' THEN
                  CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
               END IF
               LET g_loc = 'm'
               LET l_ac = DIALOG.getCurrentRow("s_detail1")
               LET g_current_page = 1
               #顯示單身筆數
               CALL aapt320_idx_chk()
               #add-point:page1自定義行為 name="ui_dialog.page1.before_display"
               
               #end add-point
               
            #自訂ACTION(detail_show,page_1)
            
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION detail_qrystr
               MENU "" ATTRIBUTE(STYLE="popup")
                  #add-point:ON ACTION detail_qrystr相關動作 name="menu.detail_show.page1_sub.detail_qrystr"
                  
                  #END add-point
                                 #應用 a43 樣板自動產生(Version:4)
               ON ACTION prog_apcb002
                  LET g_action_choice="prog_apcb002"
                  IF cl_auth_chk_act("prog_apcb002") THEN
                     
                     #add-point:ON ACTION prog_apcb002 name="menu.detail_show.page1_sub.prog_apcb002"
                     IF NOT cl_null(g_detail_idx) AND g_detail_idx > 0 THEN
                        CALL aapt320_qrystr(g_apcb_d[g_detail_idx].apcborga,g_apcb_d[g_detail_idx].apcb001,g_apcb_d[g_detail_idx].apcb002)
                     END IF
                     #END add-point
                     
                  END IF
 
 
 
 
               END MENU
 
 
 
               #add-point:ON ACTION detail_qrystr name="menu.detail_show.page1.detail_qrystr"
               
               #END add-point
 
 
 
 
               
            #add-point:page1自定義行為 name="ui_dialog.page1.action"
            
            #end add-point
               
         END DISPLAY
        
         #第一階單身段落
         DISPLAY ARRAY g_apcb2_d TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b)  
    
            BEFORE ROW
               #顯示單身筆數
               CALL aapt320_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail2")
               LET g_detail_idx = l_ac
               LET g_detail_idx_list[2] = l_ac
               CALL g_idx_group.addAttribute("'2',",l_ac)
               
               #add-point:page2, before row動作 name="ui_dialog.body2.before_row"
               
               #end add-point
               
            BEFORE DISPLAY
               #如果一直都在單身1則控制筆數位置
               IF g_loc = 'm' THEN
                  CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'2',"))
               END IF
               LET g_loc = 'm'
               LET l_ac = DIALOG.getCurrentRow("s_detail2")
               LET g_current_page = 2
               #顯示單身筆數
               CALL aapt320_idx_chk()
               #add-point:page2自定義行為 name="ui_dialog.body2.before_display"
               
               #end add-point
      
            #自訂ACTION(detail_show,page_2)
            
         
            #add-point:page2自定義行為 name="ui_dialog.body2.action"
           
            #end add-point
         
         END DISPLAY
 
         
 
         
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         DISPLAY ARRAY g_apcb3_d TO s_detail3.* ATTRIBUTES(COUNT=g_rec_b) #page3  
     
            BEFORE ROW
               CALL aapt320_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail3")
               LET g_detail_idx = l_ac
     
            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(g_detail_idx)
               LET l_ac = DIALOG.getCurrentRow("s_detail3")
               CALL aapt320_idx_chk()
               LET g_current_page = 3
                         
         END DISPLAY
         SUBDIALOG aap_aapt300_08.aapt300_08_display  #單身4--其他訊息
         #end add-point
         
         SUBDIALOG lib_cl_dlg.cl_dlg_qryplan
         SUBDIALOG lib_cl_dlg.cl_dlg_relateapps
      
         BEFORE DIALOG
            #先填充browser資料
            CALL aapt320_browser_fill("")
            CALL cl_notice()
            CALL cl_navigator_setting(g_current_idx, g_detail_cnt)
            LET g_curr_diag = ui.DIALOG.getCurrent()
            LET g_current_sw = FALSE
            #回歸舊筆數位置 (回到當時異動的筆數)
            LET g_current_idx = DIALOG.getCurrentRow("s_browse")
            IF g_current_row > 1 AND g_current_idx = 1 AND g_current_sw = FALSE THEN
               CALL DIALOG.setCurrentRow("s_browse",g_current_row)
               LET g_current_idx = g_current_row
            END IF
            
            #確保g_current_idx位於正常區間內
            #小於,等於0則指到第1筆
            IF g_current_idx <= 0 THEN
               LET g_current_idx = 1
            END IF
            #超過最大筆數則指到最後1筆
            IF g_current_idx > g_browser.getLength() THEN
               LEt g_current_idx = g_browser.getLength()
            END IF 
            
            LET g_current_sw = TRUE
            LET g_current_row = g_current_idx #目前指標
            
            #有資料才進行fetch
            IF g_current_idx <> 0 THEN
               CALL aapt320_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL aapt320_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL aapt320_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            CASE g_page_mark
                WHEN "bpage_1"
                     NEXT FIELD apcb001
                WHEN "bpage_2"
                     NEXT FIELD xrcd104
                WHEN "bpage_3"
                     NEXT FIELD apcb123
            OTHERWISE
               NEXT FIELD apcb001
            END CASE
                    
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL aapt320_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL aapt320_set_act_visible()   
            CALL aapt320_set_act_no_visible()
            IF NOT (g_apca_m.apcald IS NULL
              OR g_apca_m.apcadocno IS NULL
 
              ) THEN
               #組合條件
               LET g_add_browse = " apcaent = " ||g_enterprise|| " AND",
                                  " apcald = '", g_apca_m.apcald, "' "
                                  ," AND apcadocno = '", g_apca_m.apcadocno, "' "
 
               #填到對應位置
               CALL aapt320_browser_fill("")
            END IF
         #應用 a32 樣板自動產生(Version:3)
         #簽核狀況
         ON ACTION bpm_status
            #查詢簽核狀況, 統一建立HyperLink
            CALL cl_bpm_status()
            #add-point:ON ACTION bpm_status name="menu.bpm_status"
            
            #END add-point
 
 
 
          
         #查詢方案選擇 
         ON ACTION queryplansel
            LET g_action_choice = "queryplan" #ver:81
            CALL cl_dlg_qryplan_select() RETURNING ls_wc
            #不是空條件才寫入g_wc跟重新找資料
            IF NOT cl_null(ls_wc) THEN
               CALL util.JSON.parse(ls_wc, la_wc)
               INITIALIZE g_wc, g_wc2,g_wc2_table1,g_wc2_extend TO NULL
               INITIALIZE g_wc2_table2 TO NULL
 
 
               FOR li_idx = 1 TO la_wc.getLength()
                  CASE
                     WHEN la_wc[li_idx].tableid = "apca_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "apcb_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "xrcd_t" 
                        LET g_wc2_table2 = la_wc[li_idx].wc
 
 
                     WHEN la_wc[li_idx].tableid = "EXTENDWC"
                        LET g_wc2_extend = la_wc[li_idx].wc
                  END CASE
               END FOR
               IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1) 
                  OR NOT cl_null(g_wc2_table2)
 
 
                  OR NOT cl_null(g_wc2_extend)
                  THEN
                  #組合g_wc2
                  IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
                     LET g_wc2 = g_wc2_table1
                  END IF
                  IF g_wc2_table2 <> " 1=1" AND NOT cl_null(g_wc2_table2) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_table2
                  END IF
 
 
                  IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
                  END IF
 
                  IF g_wc2.subString(1,5) = " AND " THEN
                     LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
                  END IF
               END IF
               CALL aapt320_browser_fill("F")   #browser_fill()會將notice區塊清空
               CALL cl_notice()   #重新顯示,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
            END IF
         
         #查詢方案選擇
         ON ACTION qbe_select
            LET g_action_choice = "queryplan" #ver:81
            CALL cl_qbe_list("m") RETURNING ls_wc
            IF NOT cl_null(ls_wc) THEN
               CALL util.JSON.parse(ls_wc, la_wc)
               INITIALIZE g_wc, g_wc2,g_wc2_table1,g_wc2_extend TO NULL
               INITIALIZE g_wc2_table2 TO NULL
 
 
               FOR li_idx = 1 TO la_wc.getLength()
                  CASE
                     WHEN la_wc[li_idx].tableid = "apca_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "apcb_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "xrcd_t" 
                        LET g_wc2_table2 = la_wc[li_idx].wc
 
 
                     WHEN la_wc[li_idx].tableid = "EXTENDWC"
                        LET g_wc2_extend = la_wc[li_idx].wc
                  END CASE
               END FOR
               IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1)
                  OR NOT cl_null(g_wc2_table2)
 
 
                  OR NOT cl_null(g_wc2_extend)
                  THEN
                  IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
                     LET g_wc2 = g_wc2_table1
                  END IF
                  IF g_wc2_table2 <> " 1=1" AND NOT cl_null(g_wc2_table2) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_table2
                  END IF
 
 
                  IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
                  END IF
                  IF g_wc2.subString(1,5) = " AND " THEN
                     LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
                  END IF
                  #取得條件後需要重查、跳到結果第一筆資料的功能程式段
                  CALL aapt320_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL aapt320_fetch("F")
                  END IF
               END IF
            END IF
            #重新搜尋會將notice區塊清空,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
            CALL cl_notice()
          
         #應用 a49 樣板自動產生(Version:4)
            #過濾瀏覽頁資料
            ON ACTION filter
               LET g_action_choice = "fetch"
               #add-point:filter action name="ui_dialog.action.filter"
               
               #end add-point
               CALL aapt320_filter()
               EXIT DIALOG
 
 
 
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL aapt320_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL aapt320_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL aapt320_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL aapt320_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL aapt320_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL aapt320_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL aapt320_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL aapt320_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL aapt320_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL aapt320_idx_chk()
          
         #excel匯出功能          
         ON ACTION exporttoexcel
            LET g_action_choice="exporttoexcel"
            IF cl_auth_chk_act("exporttoexcel") THEN
               #(ver:87) ---start---
               #因應匯出excel規則調整，需同時符合新舊做法
               LET lb_get_type = cl_get_exporttoexcel_type()
               #add-point:ON ACTION exporttoexcel name="ui_dialog.exporttoexcel_type_change"
               
               #END add-point
               DISPLAY "lb_get_type:",lb_get_type
             
               CASE
                  WHEN lb_get_type = "poi"   #使用poi樣板
                     #browser
                     CALL g_export_node.clear()
                     IF g_main_hidden = 1 THEN
                        LET l_arr_len = g_browser.getLength()
                        LET g_export_tabname[1] = "s_browse"
                        LET g_export_tag[1] = rec_arr_type.create(l_arr_len)
                        FOR l_arr_cnt = 1 TO l_arr_len
                           LET g_export_tag[1][l_arr_cnt] = g_browser[l_arr_cnt]
                        END FOR
 
                        #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_browser_poi"
                        
                        #END add-point
                        CALL cl_export_poi()
                        #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_browser_after_poi"
                        
                        #END add-point
                     #非browser
                     ELSE
                        LET l_arr_len = g_apcb_d.getLength()
                        LET g_export_tag[1] = rec_arr_type.create(l_arr_len)
                        LET g_export_tabname[1] = "s_detail1"
                        FOR l_arr_cnt = 1 TO l_arr_len
                           LET g_export_tag[1][l_arr_cnt] = g_apcb_d[l_arr_cnt]
                        END FOR
 
                        LET l_arr_len = g_apcb2_d.getLength()
                        LET g_export_tag[2] = rec_arr_type.create(l_arr_len)
                        LET g_export_tabname[2] = "s_detail2"
                        FOR l_arr_cnt = 1 TO l_arr_len
                            LET g_export_tag[2][l_arr_cnt] = g_apcb2_d[l_arr_cnt]
                        END FOR
 
                        #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_poi"
                        
                        #END add-point
                        CALL cl_export_to_excel_getpage()
                        CALL cl_export_poi()
                        #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_after_poi"
                        
                        #END add-point
                     END IF
 
                  OTHERWISE   #使用原始樣板
               #(ver:87) --- end ---
               
                     #browser
                     CALL g_export_node.clear()
                     IF g_main_hidden = 1 THEN
                        LET g_export_node[1] = base.typeInfo.create(g_browser)
                        LET g_export_id[1]   = "s_browse"
                        #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_browser"   #(ver:80)
                        
                        #END add-point
                        CALL cl_export_to_excel()
                        #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_browser_after"   #(ver:80)
                        
                        #END add-point
                     #非browser
                     ELSE
                        LET g_export_node[1] = base.typeInfo.create(g_apcb_d)
                        LET g_export_id[1]   = "s_detail1"
                        LET g_export_node[2] = base.typeInfo.create(g_apcb2_d)
                        LET g_export_id[2]   = "s_detail2"
 
                        #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"
                  LET g_export_node[3] = base.typeInfo.create(g_apcb3_d)
                  LET g_export_id[3]   = "s_detail3"
                  LET g_export_node[4] = base.typeInfo.create(g_apcb_d5)
                  LET g_export_id[4]   = "s_detail1_aapt300_03"
                  LET g_export_node[5] = base.typeInfo.create(g_apcb_d4)
                  LET g_export_id[5]   = "s_detail1_aapt300_08"
                        #END add-point
                        CALL cl_export_to_excel_getpage()
                        CALL cl_export_to_excel()
                        #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_after"   #(ver:80)
                        
                        #END add-point
                     END IF
               END CASE   #(ver:87) add
            END IF
        
         ON ACTION close
            LET INT_FLAG = FALSE
            LET g_action_choice = "exit"
            EXIT DIALOG
          
         ON ACTION exit
            LET g_action_choice = "exit"
            EXIT DIALOG
    
         #主頁摺疊
         ON ACTION mainhidden       
            #(ver:85) ---start---
            #add-point:ui_dialog段 mainhidden name="ui_dialog.mainhidden"
            
            #end add-point
            #(ver:85) --- end ---
            IF g_main_hidden THEN
               CALL gfrm_curr.setElementHidden("mainlayout",0)
               CALL gfrm_curr.setElementHidden("worksheet",1)
               LET g_main_hidden = 0
            ELSE
               CALL gfrm_curr.setElementHidden("mainlayout",1)
               CALL gfrm_curr.setElementHidden("worksheet",0)
               LET g_main_hidden = 1
               CALL cl_notice()
            END IF
            
         #瀏覽頁折疊
         ON ACTION worksheethidden   
            #(ver:85) ---start---
            #add-point:ui_dialog段 worksheethidden name="ui_dialog.worksheethidden"
            
            #end add-point
            #(ver:85) --- end ---
            IF g_main_hidden THEN
               CALL gfrm_curr.setElementHidden("mainlayout",0)
               CALL gfrm_curr.setElementHidden("worksheet",1)
               LET g_main_hidden = 0
            ELSE
               CALL gfrm_curr.setElementHidden("mainlayout",1)
               CALL gfrm_curr.setElementHidden("worksheet",0)
               LET g_main_hidden = 1
            END IF
            IF lb_first THEN
               LET lb_first = FALSE
               NEXT FIELD apcbseq
            END IF
       
         #單頭摺疊，可利用hot key "Alt-s"開啟/關閉單頭
         ON ACTION controls     
            IF g_header_hidden THEN
               CALL gfrm_curr.setElementHidden("vb_master",0)
               CALL gfrm_curr.setElementImage("controls","small/arr-u.png")
               LET g_header_hidden = 0     #visible
            ELSE
               CALL gfrm_curr.setElementHidden("vb_master",1)
               CALL gfrm_curr.setElementImage("controls","small/arr-d.png")
               LET g_header_hidden = 1     #hidden     
            END IF
    
         
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify
            LET g_action_choice="modify"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = ''
               CALL aapt320_modify()
               #add-point:ON ACTION modify name="menu.modify"
               #add 151125-00006#2 --s
               SELECT COUNT(*) INTO l_cnt FROM apca_t 
                WHERE apcaent = g_enterprise AND apcacomp = g_apca_m.apcacomp
                  AND apcald  = g_apca_m.apcald AND apcadocno = g_apca_m.apcadocno
               IF l_cnt > 0 AND NOT cl_null (g_current_idx) AND g_current_idx <> 0 THEN
                  CALL aapt320_ui_headershow()
               END IF
               #add 151125-00006#2 --e
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL aapt320_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"
               #add 151125-00006#2 --s
               SELECT COUNT(*) INTO l_cnt FROM apca_t 
                WHERE apcaent = g_enterprise AND apcacomp = g_apca_m.apcacomp
                  AND apcald  = g_apca_m.apcald AND apcadocno = g_apca_m.apcadocno
               IF l_cnt > 0 AND NOT cl_null (g_current_idx) AND g_current_idx <> 0 THEN
                  CALL aapt320_ui_headershow()
               END IF
               #add 151125-00006#2 --e
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION open_aapp330
            LET g_action_choice="open_aapp330"
            IF cl_auth_chk_act("open_aapp330") THEN
               
               #add-point:ON ACTION open_aapp330 name="menu.open_aapp330"
               #科目及核算項預覽
               IF g_apca_m.apcastus <> 'Y' THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'aap-00255'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  CONTINUE DIALOG
               END IF
               CALL la_param.param.clear()
               IF cl_null(g_apca_m.apca038) THEN
                  CALL s_aooi200_fin_get_slip(g_apca_m.apcadocno) RETURNING g_sub_success,g_ap_slip               
                  CALL s_fin_get_doc_para(g_apca_m.apcald,g_apca_m.apcacomp,g_ap_slip,'D-FIN-0030') RETURNING l_chr
                  IF l_chr = 'Y' THEN
                     LET g_gl_slip = ''      #取得傳票單別(D-FIN-1002:產生之總帳傳票單別)
                     CALL s_fin_get_doc_para(g_apca_m.apcald,g_apca_m.apcacomp,g_ap_slip,'D-FIN-2002') RETURNING g_gl_slip
                    #170324-00123#2---mark---start---
                    #IF cl_null(g_gl_slip) THEN
                    #   INITIALIZE g_errparam TO NULL
                    #   LET g_errparam.code = 'aap-00219'
                    #   LET g_errparam.extend = ''
                    #   LET g_errparam.popup = TRUE
                    #   CALL cl_err()
                    #   CONTINUE DIALOG
                    #END IF
                    #170324-00123#2---mark---end---
                     LET la_param.prog = 'aapp330'
                    #IF NOT cl_null(g_gl_slip) THEN                #170327-00097#1 mark
                        LET la_param.param[1] = g_apca_m.apcald      #帳套
                        LET la_param.param[2] = g_apca_m.apcadocno   #單號
                        LET la_param.param[3] = g_gl_slip            #總帳單別
                        LET la_param.param[4] = g_apca_m.apcadocdt   #日期
                        LET la_param.param[5] = g_apca_m.apcasite    #帳務中心
                    #END IF                                        #170327-00097#1 mark
                     LET ls_js = util.JSON.stringify( la_param )
                     CALL cl_cmdrun_wait(ls_js)
                  ELSE
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'aap-00054'
                     LET g_errparam.extend = g_ap_slip
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     CONTINUE DIALOG
                  END IF
               ELSE
                  LET l_glap001 = ''
                  SELECT glap001 INTO l_glap001
                    FROM glap_t
                   WHERE glapent = g_enterprise AND glapld = g_apca_m.apcald
                     AND glapdocno = g_apca_m.apca038
                  IF NOT l_glap001 MATCHES '[1235]' THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'sub-00029'
                     LET g_errparam.extend = g_apca_m.apcadocno
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     CONTINUE DIALOG
                  ELSE
                     CASE
                         WHEN '1'  LET la_param.prog = 'aglt310'
                         WHEN '2'  LET la_param.prog = 'aglt320'
                         WHEN '3'  LET la_param.prog = 'aglt330'
                         WHEN '5'  LET la_param.prog = 'aglt350'
                     END CASE
                     LET la_param.param[1] = g_apca_m.apcald
                     LET la_param.param[2] = g_apca_m.apca038
                     LET ls_js = util.JSON.stringify( la_param )
                     CALL cl_cmdrun(ls_js)
                  END IF
               END IF
               CALL aapt320_ui_headershow()
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION open_pre
            LET g_action_choice="open_pre"
            IF cl_auth_chk_act("open_pre") THEN
               
               #add-point:ON ACTION open_pre name="menu.open_pre"
               #產生分錄底稿
               IF NOT cl_null(g_apca_m.apcadocno) AND g_apca_m.apcastus = 'N' THEN
                  CALL s_pre_voucher_ins('AP','P10',g_apca_m.apcald,g_apca_m.apcadocno,g_apca_m.apcadocdt,'1')
                       RETURNING g_sub_success
               END IF
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION lien
            LET g_action_choice="lien"
            IF cl_auth_chk_act("lien") THEN
               
               #add-point:ON ACTION lien name="menu.lien"
               #帳款留置設定
               CALL aapt300_13_set_lien(g_apca_m.apcald,g_apca_m.apcadocno,TRUE)
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION open_aapt300_14
            LET g_action_choice="open_aapt300_14"
            IF cl_auth_chk_act("open_aapt300_14") THEN
               
               #add-point:ON ACTION open_aapt300_14 name="menu.open_aapt300_14"
               #傳票預覽
               IF g_glaa.glaa121 = 'Y' THEN               
                  CALL s_pre_voucher('AP','P10',g_apca_m.apcald,g_apca_m.apcadocno,g_apca_m.apcadocdt)
               ELSE
                  CALL aapt300_14(g_apca_m.apcald,g_apca_m.apcadocno,'1')
               END IF
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL aapt320_delete()
               #add-point:ON ACTION delete name="menu.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL aapt320_insert()
               #add-point:ON ACTION insert name="menu.insert"
               #add 151125-00006#2 --s
               SELECT COUNT(*) INTO l_cnt FROM apca_t 
                WHERE apcaent = g_enterprise AND apcacomp = g_apca_m.apcacomp
                  AND apcald  = g_apca_m.apcald AND apcadocno = g_apca_m.apcadocno
               IF l_cnt > 0 AND NOT cl_null (g_current_idx) AND g_current_idx <> 0 THEN
                  CALL aapt320_ui_headershow()
               END IF
               #add 151125-00006#2 --e
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               LET g_rep_wc = " apcaent = '",g_enterprise,"'  AND apcald = '",g_apca_m.apcald,"' AND apcadocno = '",g_apca_m.apcadocno,"' "
               #END add-point
               &include "erp/aap/aapt320_rep.4gl"
               #add-point:ON ACTION output.after name="menu.after_output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               LET g_rep_wc = " apcaent = '",g_enterprise,"'  AND apcald = '",g_apca_m.apcald,"' AND apcadocno = '",g_apca_m.apcadocno,"' "
               #END add-point
               &include "erp/aap/aapt320_rep.4gl"
               #add-point:ON ACTION quickprint.after name="menu.after_quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION reproduce
            LET g_action_choice="reproduce"
            IF cl_auth_chk_act("reproduce") THEN
               CALL aapt320_reproduce()
               #add-point:ON ACTION reproduce name="menu.reproduce"
               #add 151125-00006#2 --s
               SELECT COUNT(*) INTO l_cnt FROM apca_t 
                WHERE apcaent = g_enterprise AND apcacomp = g_apca_m.apcacomp
                  AND apcald  = g_apca_m.apcald AND apcadocno = g_apca_m.apcadocno
               IF l_cnt > 0 AND NOT cl_null (g_current_idx) AND g_current_idx <> 0 THEN
                  CALL aapt320_ui_headershow()
               END IF
               #add 151125-00006#2 --e
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION open_aapt300_01
            LET g_action_choice="open_aapt300_01"
            IF cl_auth_chk_act("open_aapt300_01") THEN
               
               #add-point:ON ACTION open_aapt300_01 name="menu.open_aapt300_01"
               #帳期帳款維護
               #檢核多帳期合計數是否與單頭相符，不符合詢問是否要重展多帳期
               CALL s_aapt300_compare_apcb_with_apcc(g_apca_m.apcald,g_apca_m.apcadocno) RETURNING l_diff
               IF l_diff <> 0 AND g_apca_m.apcastus = "N" THEN
                  IF cl_ask_confirm('aap-00243') THEN
                     #展多帳期
                     CALL s_transaction_begin()
                     CALL s_aap_multi_bill_period(g_apca_m.apcald,g_apca_m.apcadocno) RETURNING g_sub_success,g_errno
                     IF NOT g_sub_success THEN  #多帳期產生失敗
                        CALL s_transaction_end('N','0')
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = "aap-00092"
                        LET g_errparam.extend = "upd apcc_t"
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                        CONTINUE DIALOG
                     ELSE
                        CALL s_transaction_end('Y','0')
                     END IF
                  END IF
               END IF
               CALL aapt300_01(g_apca_m.apcald,g_apca_m.apcadocno)
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION open_aapt300_05
            LET g_action_choice="open_aapt300_05"
            IF cl_auth_chk_act("open_aapt300_05") THEN
               
               #add-point:ON ACTION open_aapt300_05 name="menu.open_aapt300_05"
               #ACTION 說明:差異金額檢核及處理
               IF g_apca_m.apcastus MATCHES '[YXW]' THEN     #已確認、作廢、送簽　狀態的單據，不開放處理
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'aap-00053'
                  LET g_errparam.extend = g_apca_m.apcadocno
                  LET g_errparam.popup = FALSE
                  CALL cl_err()
                  EXIT DIALOG
               END IF
               #差異金額:單頭/單身的檢核
              #IF l_diff > 0 THEN CALL aapt300_05(g_apca_m.apcald,g_apca_m.apcadocno) END IF
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL aapt320_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
               CALL g_curr_diag.setCurrentRow("s_detail2",1)
 
 
 
 
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION open_aapp342
            LET g_action_choice="open_aapp342"
            IF cl_auth_chk_act("open_aapp342") THEN
               
               #add-point:ON ACTION open_aapp342 name="menu.open_aapp342"
               #170509-00070#2 add(s)
               IF NOT cl_ask_confirm('afm-00038') THEN
                  CONTINUE DIALOG
               END IF
               #170509-00070#2 add(e)
               CALL cl_get_para(g_enterprise,g_site,'S-FIN-3007') RETURNING l_date_close    #170724-00040#1 add
               #160104-00007#3--(S)
               SELECT glapstus,glapdocdt INTO l_glapstus,l_glapdocdt
                 FROM glap_t
                WHERE glapent = g_enterprise 
                  AND glapld = g_apca_m.apcald AND glapdocno = g_apca_m.apca038    
               SELECT glaa013 INTO l_glaa013
                 FROM glaa_t
                WHERE glaaent = g_enterprise AND glaald = g_apca_m.apcald
               CASE 
                   WHEN l_glapstus = 'Y' OR l_glapstus = 'S' OR cl_null(g_apca_m.apca038)
                        INITIALIZE g_errparam TO NULL
                        CASE
                           WHEN l_glapstus = 'Y' OR l_glapstus = 'S' 
                               LET g_errparam.code   = 'axr-00076'
                           WHEN cl_null(g_apca_m.apca038) 
                               LET g_errparam.code   = 'aap-00093'
                               LET g_errparam.extend = s_fin_get_colname('','apca038'),"=' '"
                        END CASE
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                   WHEN l_glapdocdt <= l_glaa013
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = 'aap-00077'
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                   #170724-00040#1---add---start--- 
                   WHEN l_glapdocdt <  l_date_close  #傳票還原日期不可小於關帳日期(aoos020)
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = 'afm-00130'
                      LET g_errparam.extend = ''
                      LET g_errparam.popup = TRUE
                      CALL cl_err()           
                   #170724-00040#1---add---end---       
                   OTHERWISE
                        LET la_param.prog = "aapp342" 
                        LET la_param.background = "Y"
                        LET la_param1.glaald = g_apca_m.apcald
                        LET la_param1.type   = "aapt300"
                        LET la_param1.wc     = " glapdocno = '",g_apca_m.apca038,"'" 
                        LET la_param.param[1] = util.JSON.stringify( la_param1 )
                        LET ls_js = util.JSON.stringify( la_param )
                        CALL cl_cmdrun(ls_js)
                        LET g_apca_m.apca038 = ''
                        DISPLAY BY NAME g_apca_m.apca038
               END CASE
               #160104-00007#3--(E)             
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION open_aapt300_02
            LET g_action_choice="open_aapt300_02"
            IF cl_auth_chk_act("open_aapt300_02") THEN
               
               #add-point:ON ACTION open_aapt300_02 name="menu.open_aapt300_02"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION open_aapq380
            LET g_action_choice="open_aapq380"
            IF cl_auth_chk_act("open_aapq380") THEN
               
               #add-point:ON ACTION open_aapq380 name="menu.open_aapq380"
               #160506-00002#1 add---s---
               IF NOT cl_null(g_apca_m.apcald) AND NOT cl_null(g_apca_m.apcasite) AND NOT cl_null(g_apca_m.apcadocno) THEN
                  LET la_param.prog = 'aapq380'
                  LET la_param.param[1] = g_apca_m.apcald
                  LET la_param.param[2] = g_apca_m.apcadocno
                  LET la_param.param[3] = g_apca_m.apcasite
                  LET ls_js = util.JSON.stringify( la_param )
                  CALL cl_cmdrun(ls_js)
               END IF
               #160506-00002#1 add---e---
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION waiver_of_lien
            LET g_action_choice="waiver_of_lien"
            IF cl_auth_chk_act("waiver_of_lien") THEN
               
               #add-point:ON ACTION waiver_of_lien name="menu.waiver_of_lien"
               #ACTION 說明:解除帳款留置
               CALL aapt300_13_set_lien(g_apca_m.apcald,g_apca_m.apcadocno,FALSE)
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION prog_apca003
            LET g_action_choice="prog_apca003"
            IF cl_auth_chk_act("prog_apca003") THEN
               
               #add-point:ON ACTION prog_apca003 name="menu.prog_apca003"
               #應用 a45 樣板自動產生(Version:2)
               CALL cl_user_contact("aooi130", "ooag_t", "ooag002", "ooag001",g_apca_m.apca003)
 


               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION prog_apca038
            LET g_action_choice="prog_apca038"
            IF cl_auth_chk_act("prog_apca038") THEN
               
               #add-point:ON ACTION prog_apca038 name="menu.prog_apca038"
               #應用 a41 樣板自動產生(Version:2)
               #使用JSON格式組合參數與作業編號(串查)
               IF cl_null(g_apca_m.apcald) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code   = 'sub-00280'
                  LET g_errparam.extend = s_fin_get_colname(g_prog,'apcald')
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  CONTINUE DIALOG
               END IF
               IF cl_null(g_apca_m.apca038) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code   = 'sub-00280'
                  LET g_errparam.extend = s_fin_get_colname(g_prog,'apca038')
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  CONTINUE DIALOG
               END IF
               
               INITIALIZE la_param.* TO NULL
               CALL s_aapt300_get_aglt3xx_prog(g_apca_m.apcald,g_apca_m.apca038)RETURNING la_param.prog
               LET la_param.param[1] = g_apca_m.apcald
               LET la_param.param[2] = g_apca_m.apca038
               LET ls_js = util.JSON.stringify(la_param)
               CALL cl_cmdrun_wait(ls_js)
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION prog_apca018
            LET g_action_choice="prog_apca018"
            IF cl_auth_chk_act("prog_apca018") THEN
               
               #add-point:ON ACTION prog_apca018 name="menu.prog_apca018"
               CALL aapt320_qrystr(g_apca_m.apcasite,g_apca_m.apca016,g_apca_m.apca018)
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION prog_apca014
            LET g_action_choice="prog_apca014"
            IF cl_auth_chk_act("prog_apca014") THEN
               
               #add-point:ON ACTION prog_apca014 name="menu.prog_apca014"
               #應用 a45 樣板自動產生(Version:2)
               CALL cl_user_contact("aooi130", "ooag_t", "ooag002", "ooag001",g_apca_m.apca014)
 


               #END add-point
               
            END IF
 
 
 
 
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL aapt320_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL aapt320_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL aapt320_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow(g_apca_m.apcadocdt)
 
 
 
         
         #主選單用ACTION
         &include "main_menu_exit_dialog.4gl"
         &include "relating_action.4gl"
    
         #交談指令共用ACTION
         &include "common_action.4gl" 
            CONTINUE DIALOG
      END DIALOG
 
      #(ver:79) ---add start---
      #add-point:ui_dialog段 after dialog name="ui_dialog.exit_dialog"
      
      #end add-point
      #(ver:79) --- add end ---
    
      IF g_action_choice = "exit" AND NOT cl_null(g_action_choice) THEN
         #add-point:ui_dialog段離開dialog前 name="ui_dialog.b_exit"
         
         #end add-point
         EXIT WHILE
      END IF
    
   END WHILE    
      
   CALL cl_set_act_visible("accept,cancel", TRUE)
    
END FUNCTION
 
{</section>}
 
{<section id="aapt320.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION aapt320_browser_fill(ps_page_action)
   #add-point:browser_fill段define(客製用) name="browser_fill.define_customerization"
   
   #end add-point  
   DEFINE ps_page_action    STRING
   DEFINE l_wc              STRING
   DEFINE l_wc2             STRING
   DEFINE l_sql             STRING
   DEFINE l_sub_sql         STRING
   DEFINE l_sql_rank        STRING
   #add-point:browser_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="browser_fill.define"
   DEFINE l_ld_str          STRING               #161014-00053#3 add
   #end add-point    
   
   #add-point:Function前置處理 name="browser_fill.before_browser_fill"
 
   #end add-point
   
   IF cl_null(g_wc) THEN
      LET g_wc = " 1=1"
   END IF
   IF cl_null(g_wc2) THEN
      LET g_wc2 = " 1=1"
   END IF
   LET l_wc  = g_wc.trim() 
   LET l_wc2 = g_wc2.trim()
 
   #add-point:browser_fill,foreach前 name="browser_fill.before_foreach"
   #161014-00053#3 --s add
   CALL s_axrt300_get_site(g_user,'','2') RETURNING l_ld_str  
   LET l_ld_str = cl_replace_str(l_ld_str,"glaald","apcald")
   LET l_wc = l_wc," AND ",l_ld_str
   #161014-00053#3 --e add
   #end add-point
   
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件                      
      LET l_sub_sql = " SELECT DISTINCT apcald,apcadocno ",
                      " FROM apca_t ",
                      " ",
                      " LEFT JOIN apcb_t ON apcbent = apcaent AND apcald = apcbld AND apcadocno = apcbdocno ", "  ",
                      #add-point:browser_fill段sql(apcb_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
                      " LEFT JOIN xrcd_t ON xrcdent = apcaent AND apcald = xrcdld AND apcadocno = xrcddocno", "  ",
                      #add-point:browser_fill段sql(xrcd_t1) name="browser_fill.cnt.join.xrcd_t1"
                      
                      #end add-point
 
 
 
                      " ", 
                      " ", 
                      " ",                      
 
 
 
                      " WHERE apcaent = " ||g_enterprise|| " AND apcbent = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("apca_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT apcald,apcadocno ",
                      " FROM apca_t ", 
                      "  ",
                      "  ",
                      " WHERE apcaent = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("apca_t")
   END IF
   
   #add-point:browser_fill,cnt wc name="browser_fill.cnt_sqlwc"
   
   #end add-point
   
   LET g_sql = " SELECT COUNT(1) FROM (",l_sub_sql,")"
   
   #add-point:browser_fill,count前 name="browser_fill.before_count"
   
   #end add-point
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE header_cnt_pre FROM g_sql
      EXECUTE header_cnt_pre INTO g_browser_cnt   #總筆數
      FREE header_cnt_pre
   END IF
    
   IF g_browser_cnt > g_max_browse THEN
      IF g_error_show = 1 THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_browser_cnt
         LET g_errparam.code = 9035 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
      END IF
      LET g_browser_cnt = g_max_browse
   END IF
   
   DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
   DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
 
   #根據行為確定資料填充位置及WC
   IF cl_null(g_add_browse) THEN
      #清除畫面
      CLEAR FORM                
      INITIALIZE g_apca_m.* TO NULL
      CALL g_apcb_d.clear()        
      CALL g_apcb2_d.clear() 
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      CALL g_apcb3_d.clear() 
      CALL aapt300_08_clear_detail() 
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.apcadocno,t0.apcald,t0.apca001,t0.apca003,t0.apca004,t0.apca005 Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.apcastus,t0.apcadocno,t0.apcald,t0.apca001,t0.apca003,t0.apca004, 
          t0.apca005,t1.glaal002 ,t2.ooag011 ,t3.pmaal004 ,t4.pmaal004 ",
                  " FROM apca_t t0",
                  "  ",
                  "  LEFT JOIN apcb_t ON apcbent = apcaent AND apcald = apcbld AND apcadocno = apcbdocno ", "  ", 
                  #add-point:browser_fill段sql(apcb_t1) name="browser_fill.join.apcb_t1"
                  
                  #end add-point
                  "  LEFT JOIN xrcd_t ON xrcdent = apcaent AND apcald = xrcdld AND apcadocno = xrcddocno", "  ", 
                  #add-point:browser_fill段sql(xrcd_t1) name="browser_fill.join.xrcd_t1"
                  
                  #end add-point
 
 
 
                  " ", 
                  " ",                      
 
 
 
                                 " LEFT JOIN glaal_t t1 ON t1.glaalent="||g_enterprise||" AND t1.glaalld=t0.apcald AND t1.glaal001='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t2 ON t2.ooagent="||g_enterprise||" AND t2.ooag001=t0.apca003  ",
               " LEFT JOIN pmaal_t t3 ON t3.pmaalent="||g_enterprise||" AND t3.pmaal001=t0.apca004 AND t3.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t4 ON t4.pmaalent="||g_enterprise||" AND t4.pmaal001=t0.apca005 AND t4.pmaal002='"||g_dlang||"' ",
 
                  " WHERE t0.apcaent = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("apca_t")
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.apcastus,t0.apcadocno,t0.apcald,t0.apca001,t0.apca003,t0.apca004, 
          t0.apca005,t1.glaal002 ,t2.ooag011 ,t3.pmaal004 ,t4.pmaal004 ",
                  " FROM apca_t t0",
                  "  ",
                                 " LEFT JOIN glaal_t t1 ON t1.glaalent="||g_enterprise||" AND t1.glaalld=t0.apcald AND t1.glaal001='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t2 ON t2.ooagent="||g_enterprise||" AND t2.ooag001=t0.apca003  ",
               " LEFT JOIN pmaal_t t3 ON t3.pmaalent="||g_enterprise||" AND t3.pmaal001=t0.apca004 AND t3.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t4 ON t4.pmaalent="||g_enterprise||" AND t4.pmaal001=t0.apca005 AND t4.pmaal002='"||g_dlang||"' ",
 
                  " WHERE t0.apcaent = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("apca_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
   #151231-00010#1(S)
   IF NOT cl_null(g_sql_ctrl) AND NOT g_sql_ctrl = ' 1=1'  THEN
      LET g_sql = g_sql," AND EXISTS (SELECT 1 FROM pmaa_t ",
                        "              WHERE pmaaent = ",g_enterprise,
                        "                AND ",g_sql_ctrl,
                        "                AND pmaaent = apcaent ",
                        "                AND pmaa001 = apca004 )"
   END IF
   #151231-00010#1(E) 
   IF NOT cl_null(g_wc_cs_ld) THEN     #160125-00005#6--(S)
      LET g_sql = g_sql , " AND apcald IN ",g_wc_cs_ld
   END IF                              #160125-00005#6--(E)
   #end add-point
   LET g_sql = g_sql, " ORDER BY apcald,apcadocno ",g_order
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
   
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"apca_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      #add-point:browser_fill段open cursor name="browser_fill.open"
      
      #end add-point
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_apcadocno,g_browser[g_cnt].b_apcald, 
          g_browser[g_cnt].b_apca001,g_browser[g_cnt].b_apca003,g_browser[g_cnt].b_apca004,g_browser[g_cnt].b_apca005, 
          g_browser[g_cnt].b_apcald_desc,g_browser[g_cnt].b_apca003_desc,g_browser[g_cnt].b_apca004_desc, 
          g_browser[g_cnt].b_apca005_desc
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "Foreach:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
      
         #add-point:browser_fill段reference name="browser_fill.reference"
       
         #end add-point
      
         #遮罩相關處理
         CALL aapt320_browser_mask()
      
               #應用 a24 樣板自動產生(Version:3)
      #browser顯示圖片
      CASE g_browser[g_cnt].b_statepic
         WHEN "N"
            LET g_browser[g_cnt].b_statepic = "stus/16/unconfirmed.png"
         WHEN "Y"
            LET g_browser[g_cnt].b_statepic = "stus/16/confirmed.png"
         WHEN "A"
            LET g_browser[g_cnt].b_statepic = "stus/16/approved.png"
         WHEN "D"
            LET g_browser[g_cnt].b_statepic = "stus/16/withdraw.png"
         WHEN "R"
            LET g_browser[g_cnt].b_statepic = "stus/16/rejection.png"
         WHEN "W"
            LET g_browser[g_cnt].b_statepic = "stus/16/signing.png"
         WHEN "X"
            LET g_browser[g_cnt].b_statepic = "stus/16/invalid.png"
         
      END CASE
 
 
 
         LET g_cnt = g_cnt + 1
         IF g_cnt > g_max_browse THEN
            EXIT FOREACH
         END IF
         
      END FOREACH
      FREE browse_pre
   END IF
   
   #清空g_add_browse, 並指定指標位置
   IF NOT cl_null(g_add_browse) THEN
      LET g_add_browse = ""
      CALL g_curr_diag.setCurrentRow("s_browse",g_current_idx)
   END IF
   
   IF cl_null(g_browser[g_cnt].b_apcald) THEN
      CALL g_browser.deleteElement(g_cnt)
   END IF
   
   LET g_header_cnt  = g_browser.getLength()
   LET g_browser_cnt = g_browser.getLength()
   
   #筆數顯示
   IF g_browser_cnt > 0 THEN
      DISPLAY g_browser_idx TO FORMONLY.b_index #當下筆數
      DISPLAY g_browser_cnt TO FORMONLY.b_count #總筆數
      DISPLAY g_browser_idx TO FORMONLY.h_index #當下筆數
      DISPLAY g_browser_cnt TO FORMONLY.h_count #總筆數
      DISPLAY g_detail_idx  TO FORMONLY.idx     #單身當下筆數
      DISPLAY g_detail_cnt  TO FORMONLY.cnt     #單身總筆數
   ELSE
      DISPLAY '' TO FORMONLY.b_index #當下筆數
      DISPLAY '' TO FORMONLY.b_count #總筆數
      DISPLAY '' TO FORMONLY.h_index #當下筆數
      DISPLAY '' TO FORMONLY.h_count #總筆數
      DISPLAY '' TO FORMONLY.idx     #單身當下筆數
      DISPLAY '' TO FORMONLY.cnt     #單身總筆數
   END IF
 
   LET g_rec_b = g_cnt - 1
   LET g_detail_cnt = g_rec_b
   LET g_cnt = 0
 
   #若無資料則關閉相關功能
   IF g_browser_cnt = 0 THEN
      CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce,mainhidden", FALSE)
      CALL cl_navigator_setting(0,0)
   ELSE
      CALL cl_set_act_visible("mainhidden", TRUE)
   END IF
                  
   
   #add-point:browser_fill段結束前 name="browser_fill.after"
   
   #end add-point   
 
END FUNCTION
 
{</section>}
 
{<section id="aapt320.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION aapt320_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
   
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
   
   LET g_apca_m.apcald = g_browser[g_current_idx].b_apcald   
   LET g_apca_m.apcadocno = g_browser[g_current_idx].b_apcadocno   
 
   EXECUTE aapt320_master_referesh USING g_apca_m.apcald,g_apca_m.apcadocno INTO g_apca_m.apcasite,g_apca_m.apca003, 
       g_apca_m.apcald,g_apca_m.apcacomp,g_apca_m.apcadocno,g_apca_m.apca001,g_apca_m.apcadocdt,g_apca_m.apca004, 
       g_apca_m.apca005,g_apca_m.apca038,g_apca_m.apca006,g_apca_m.apca057,g_apca_m.apcastus,g_apca_m.apca065, 
       g_apca_m.apca066,g_apca_m.apca008,g_apca_m.apca009,g_apca_m.apca010,g_apca_m.apca060,g_apca_m.apca013, 
       g_apca_m.apca012,g_apca_m.apca011,g_apca_m.apca007,g_apca_m.apca036,g_apca_m.apca035,g_apca_m.apca100, 
       g_apca_m.apca103,g_apca_m.apca104,g_apca_m.apca106,g_apca_m.apca108,g_apca_m.apca101,g_apca_m.apca113, 
       g_apca_m.apca114,g_apca_m.apca116,g_apca_m.apca118,g_apca_m.apca039,g_apca_m.apca056,g_apca_m.apca016, 
       g_apca_m.apca055,g_apca_m.apca018,g_apca_m.apca019,g_apca_m.apca014,g_apca_m.apca054,g_apca_m.apca015, 
       g_apca_m.apca034,g_apca_m.apca033,g_apca_m.apca058,g_apca_m.apca059,g_apca_m.apca063,g_apca_m.apca050, 
       g_apca_m.apca052,g_apca_m.apca017,g_apca_m.apca051,g_apca_m.apca053,g_apca_m.apca025,g_apca_m.apca031, 
       g_apca_m.apca030,g_apca_m.apca026,g_apca_m.apca027,g_apca_m.apca028,g_apca_m.apca029,g_apca_m.apca020, 
       g_apca_m.apca021,g_apca_m.apca022,g_apca_m.apca046,g_apca_m.apca047,g_apca_m.apca048,g_apca_m.apca120, 
       g_apca_m.apca121,g_apca_m.apca130,g_apca_m.apca131,g_apca_m.apca123,g_apca_m.apca133,g_apca_m.apca124, 
       g_apca_m.apca134,g_apca_m.apca126,g_apca_m.apca136,g_apca_m.apca128,g_apca_m.apca138,g_apca_m.apcaownid, 
       g_apca_m.apcaowndp,g_apca_m.apcacrtid,g_apca_m.apcacrtdp,g_apca_m.apcacrtdt,g_apca_m.apcamodid, 
       g_apca_m.apcamoddt,g_apca_m.apcacnfid,g_apca_m.apcacnfdt,g_apca_m.apcasite_desc,g_apca_m.apca003_desc, 
       g_apca_m.apcald_desc,g_apca_m.apca004_desc,g_apca_m.apca005_desc,g_apca_m.apca008_desc,g_apca_m.apca007_desc, 
       g_apca_m.apca055_desc,g_apca_m.apca014_desc,g_apca_m.apca054_desc,g_apca_m.apca015_desc,g_apca_m.apca034_desc, 
       g_apca_m.apca033_desc,g_apca_m.apca058_desc,g_apca_m.apca059_desc,g_apca_m.apca030_desc,g_apca_m.apcaownid_desc, 
       g_apca_m.apcaowndp_desc,g_apca_m.apcacrtid_desc,g_apca_m.apcacrtdp_desc,g_apca_m.apcamodid_desc, 
       g_apca_m.apcacnfid_desc
   
   CALL aapt320_apca_t_mask()
   CALL aapt320_show()
      
END FUNCTION
 
{</section>}
 
{<section id="aapt320.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION aapt320_ui_detailshow()
   #add-point:ui_detailshow段define(客製用) name="ui_detailshow.define_customerization"
   
   #end add-point    
   #add-point:ui_detailshow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_detailshow.define"
   
   #end add-point    
 
   #add-point:Function前置處理 name="ui_detailshow.before"
   
   #end add-point    
   
   IF g_curr_diag IS NOT NULL THEN
      CALL g_curr_diag.setCurrentRow("s_detail1",g_detail_idx)      
      CALL g_curr_diag.setCurrentRow("s_detail2",g_detail_idx)
 
   END IF
   
   #add-point:ui_detailshow段after name="ui_detailshow.after"
   
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="aapt320.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION aapt320_ui_browser_refresh()
   #add-point:ui_browser_refresh段define(客製用) name="ui_browser_refresh.define_customerization"
   
   #end add-point    
   DEFINE l_i  LIKE type_t.num10
   #add-point:ui_browser_refresh段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_browser_refresh.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="ui_browser_refresh.pre_function"
   
   #end add-point
   
   LET g_browser_cnt = g_browser.getLength()
   LET g_header_cnt  = g_browser.getLength()
   FOR l_i =1 TO g_browser.getLength()
      IF g_browser[l_i].b_apcald = g_apca_m.apcald 
         AND g_browser[l_i].b_apcadocno = g_apca_m.apcadocno 
 
         THEN
         CALL g_browser.deleteElement(l_i)
         EXIT FOR
      END IF
   END FOR
   LET g_browser_cnt = g_browser_cnt - 1
   LET g_header_cnt = g_header_cnt - 1
    
   #若無資料則關閉相關功能
   IF g_browser_cnt = 0 THEN
      CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce,mainhidden", FALSE)
      CALL cl_navigator_setting(0,0)
      CLEAR FORM
   ELSE
      CALL cl_set_act_visible("mainhidden", TRUE)
   END IF
   
   #add-point:ui_browser_refresh段after name="ui_browser_refresh.after"
   
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="aapt320.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION aapt320_construct()
   #add-point:cs段define(客製用) name="cs.define_customerization"
   
   #end add-point    
   DEFINE ls_return   STRING
   DEFINE ls_result   STRING 
   DEFINE ls_wc       STRING 
   DEFINE la_wc       DYNAMIC ARRAY OF RECORD
          tableid     STRING,
          wc          STRING
          END RECORD
   DEFINE li_idx      LIKE type_t.num10
   #add-point:cs段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="cs.define"
   DEFINE l_ooef017     LIKE ooef_t.ooef017  #160511-00026#1
   DEFINE l_ooef019     LIKE ooef_t.ooef019  #160511-00026#1
   DEFINE l_ld_str      STRING               #161014-00053#3 add
   #161111-00042#2 --s add
   DEFINE l_apcb004_comp LIKE ooef_t.ooef017
   DEFINE l_ld           LIKE glaa_t.glaald
   DEFINE l_comp         LIKE ooef_t.ooef001
   #161111-00042#2 --e add   
   #end add-point    
   
   #add-point:Function前置處理  name="cs.pre_function"
   
   #end add-point
    
   #清除畫面
   CLEAR FORM                
   INITIALIZE g_apca_m.* TO NULL
   CALL g_apcb_d.clear()        
   CALL g_apcb2_d.clear() 
 
   
   LET g_action_choice = ""
    
   INITIALIZE g_wc TO NULL
   INITIALIZE g_wc2 TO NULL
   
   INITIALIZE g_wc2_table1 TO NULL
   INITIALIZE g_wc2_table2 TO NULL
 
 
    
   LET g_qryparam.state = 'c'
   
   #add-point:cs段開始前 name="cs.before_construct"
   CALL g_apcb3_d.clear() 
   CALL aapt300_08_clear_detail() 
   LET g_site_str = NULL   #161014-00053#3
   
   #end add-point 
   
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
      
      #單頭
      CONSTRUCT BY NAME g_wc ON apcasite,apca003,apcald,apcacomp,apcacomp_desc,apcadocno,apca001,apcadocdt, 
          apca004,apca005,apca038,apcastus,apca065,apca066,apca008,apca009,apca010,apca060,apca013,apca012, 
          apca011,apca011_desc,apca007,apca036,apca035,apca100,apca103,apca104,apca106,apca108,glaa001, 
          apca101,apca113,apca114,apca116,apcc113,apca118,apca056,apca016,apca055,apca018,apca019,apca014, 
          apca054,apca015,apca034,apca033,apca058,apca059,apca063,apca050,apca017,partition2,apca051, 
          apca051_desc,apca053,apca025,apca031,apca030,partition3,apca026,apca027,apca028,apca029,apca020, 
          apca021,apca022,apca046,apca0181,apca047,apca048,apcc123,apcc133,apcaownid,apcaowndp,apcacrtid, 
          apcacrtdp,apcacrtdt,apcamodid,apcamoddt,apcacnfid,apcacnfdt
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
 
            #end add-point 
            
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<apcacrtdt>>----
         AFTER FIELD apcacrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<apcamoddt>>----
         AFTER FIELD apcamoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<apcacnfdt>>----
         AFTER FIELD apcacnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<apcapstdt>>----
 
 
 
            
         #一般欄位開窗相關處理    
                  #Ctrlp:construct.c.apcasite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcasite
            #add-point:ON ACTION controlp INFIELD apcasite name="construct.c.apcasite"
            #帳務中心
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            #CALL q_ooef001()     #161006-00005#4  mark
            CALL q_ooef001_46()   #161006-00005#4   add
            DISPLAY g_qryparam.return1 TO apcasite
            NEXT FIELD apcasite
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcasite
            #add-point:BEFORE FIELD apcasite name="construct.b.apcasite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcasite
            
            #add-point:AFTER FIELD apcasite name="construct.a.apcasite"
            CALL FGL_DIALOG_GETBUFFER() RETURNING g_site_str   #161014-00053#3 add
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca003
            #add-point:ON ACTION controlp INFIELD apca003 name="construct.c.apca003"
            #帳務人員
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           
            DISPLAY g_qryparam.return1 TO apca003      
            NEXT FIELD apca003
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca003
            #add-point:BEFORE FIELD apca003 name="construct.b.apca003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca003
            
            #add-point:AFTER FIELD apca003 name="construct.a.apca003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apcald
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcald
            #add-point:ON ACTION controlp INFIELD apcald name="construct.c.apcald"
            #帳別
            #開窗c段
         CALL s_axrt300_get_site(g_user,g_site_str,'2') RETURNING l_ld_str #161014-00053#3 add
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
			   LET g_qryparam.arg1 = g_user
            #LET g_qryparam.arg2 = g_grup   #170920-00040#2  2017/10/06  mark by 10043
            LET g_qryparam.arg2 = g_dept    #170920-00040#2  2017/10/06  add by 10043
            #LET g_qryparam.where = " glaald IN ",g_wc_cs_ld    #160125-00005#6
            LET g_qryparam.where = l_ld_str CLIPPED," AND (glaa008 = 'Y' OR glaa014 = 'Y')" #161014-00053#3 add
            CALL q_authorised_ld()                           
            DISPLAY g_qryparam.return1 TO apcald             
            NEXT FIELD apcald
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcald
            #add-point:BEFORE FIELD apcald name="construct.b.apcald"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcald
            
            #add-point:AFTER FIELD apcald name="construct.a.apcald"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcacomp
            #add-point:BEFORE FIELD apcacomp name="construct.b.apcacomp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcacomp
            
            #add-point:AFTER FIELD apcacomp name="construct.a.apcacomp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apcacomp
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcacomp
            #add-point:ON ACTION controlp INFIELD apcacomp name="construct.c.apcacomp"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcacomp_desc
            #add-point:BEFORE FIELD apcacomp_desc name="construct.b.apcacomp_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcacomp_desc
            
            #add-point:AFTER FIELD apcacomp_desc name="construct.a.apcacomp_desc"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apcacomp_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcacomp_desc
            #add-point:ON ACTION controlp INFIELD apcacomp_desc name="construct.c.apcacomp_desc"
            
            #END add-point
 
 
         #Ctrlp:construct.c.apcadocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcadocno
            #add-point:ON ACTION controlp INFIELD apcadocno name="construct.c.apcadocno"
            #單據編號
            #開窗c段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = "apca001 IN (",s_fin_get_scc_gzcb002('8502','3',g_prog) ,")"
            #151231-00010#1(S)
            IF NOT cl_null(g_sql_ctrl) AND NOT g_sql_ctrl = ' 1=1'  THEN
               LET g_qryparam.where = g_qryparam.where," AND EXISTS (SELECT 1 FROM pmaa_t ",
                                                       "              WHERE pmaaent = ",g_enterprise,
                                                       "                AND ",g_sql_ctrl,
                                                       "                AND pmaaent = apcaent ",
                                                       "                AND pmaa001 = apca004 )"
            END IF
            #151231-00010#1(E)          
            #161111-00042#2 --s add
            #查詢依帳套權限管理
            CALL s_axrt300_get_site(g_user,g_site_str,'2') RETURNING l_ld_str 
            LET l_ld_str = cl_replace_str(l_ld_str,"glaald","apcald")
            LET g_qryparam.where = g_qryparam.where," AND ",l_ld_str
            #161111-00042#2 --e add            
            #161104-00046#19 --s add
            #單別權限控管
            IF NOT cl_null(g_user_dept_wc_q) AND NOT g_user_dept_wc_q = ' 1=1'  THEN
               LET g_qryparam.where = g_qryparam.where," AND ",g_user_dept_wc_q CLIPPED
            END IF
            #161104-00046#19 --e add            
            CALL q_apcadocno()                                
            LET g_apca_m.apcadocno = g_qryparam.return1       
            DISPLAY g_qryparam.return1 TO apcadocno           

            NEXT FIELD apcadocno        
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcadocno
            #add-point:BEFORE FIELD apcadocno name="construct.b.apcadocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcadocno
            
            #add-point:AFTER FIELD apcadocno name="construct.a.apcadocno"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca001
            #add-point:BEFORE FIELD apca001 name="construct.b.apca001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca001
            
            #add-point:AFTER FIELD apca001 name="construct.a.apca001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca001
            #add-point:ON ACTION controlp INFIELD apca001 name="construct.c.apca001"
            #帳款單性質
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcadocdt
            #add-point:BEFORE FIELD apcadocdt name="construct.b.apcadocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcadocdt
            
            #add-point:AFTER FIELD apcadocdt name="construct.a.apcadocdt"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apcadocdt
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcadocdt
            #add-point:ON ACTION controlp INFIELD apcadocdt name="construct.c.apcadocdt"
            #立帳日期
            #END add-point
 
 
         #Ctrlp:construct.c.apca004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca004
            #add-point:ON ACTION controlp INFIELD apca004 name="construct.c.apca004"
            #帳款對象編號
            #開窗c段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
			   LET g_qryparam.arg1 = "('1','3')"
            #151231-00010#1(S)
            IF NOT cl_null(g_sql_ctrl) AND NOT g_sql_ctrl = ' 1=1'  THEN
               LET g_qryparam.where = g_sql_ctrl
            END IF
            #151231-00010#1(E)			
            CALL q_pmaa001_1()                           
            DISPLAY g_qryparam.return1 TO apca004      
            NEXT FIELD apca004                    
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca004
            #add-point:BEFORE FIELD apca004 name="construct.b.apca004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca004
            
            #add-point:AFTER FIELD apca004 name="construct.a.apca004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca005
            #add-point:ON ACTION controlp INFIELD apca005 name="construct.c.apca005"
            #付款對象
            #開窗c段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
            #151231-00010#1(S)
            IF NOT cl_null(g_sql_ctrl) AND NOT g_sql_ctrl = ' 1=1'  THEN
               LET g_qryparam.where = " EXISTS (SELECT 1 FROM pmaa_t ",
                                      "          WHERE pmaaent = ",g_enterprise,
                                      "            AND ",g_sql_ctrl,
                                      "            AND pmaaent = pmacent ",
                                      "            AND pmaa001 = pmac002 )"
            END IF
            #151231-00010#1(E)			   
            CALL q_pmac002_1()                     
            DISPLAY g_qryparam.return1 TO apca005  
            NEXT FIELD apca005                

            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca005
            #add-point:BEFORE FIELD apca005 name="construct.b.apca005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca005
            
            #add-point:AFTER FIELD apca005 name="construct.a.apca005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca038
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca038
            #add-point:ON ACTION controlp INFIELD apca038 name="construct.c.apca038"
            #拋轉傳票號碼
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
			LET g_qryparam.where = "apca001 IN (",s_fin_get_scc_gzcb002('8502','3',g_prog) ,")"
            CALL q_apca038()                       
            DISPLAY g_qryparam.return1 TO apca038  
            NEXT FIELD apca038

            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca038
            #add-point:BEFORE FIELD apca038 name="construct.b.apca038"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca038
            
            #add-point:AFTER FIELD apca038 name="construct.a.apca038"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcastus
            #add-point:BEFORE FIELD apcastus name="construct.b.apcastus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcastus
            
            #add-point:AFTER FIELD apcastus name="construct.a.apcastus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apcastus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcastus
            #add-point:ON ACTION controlp INFIELD apcastus name="construct.c.apcastus"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca065
            #add-point:BEFORE FIELD apca065 name="construct.b.apca065"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca065
            
            #add-point:AFTER FIELD apca065 name="construct.a.apca065"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca065
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca065
            #add-point:ON ACTION controlp INFIELD apca065 name="construct.c.apca065"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca066
            #add-point:BEFORE FIELD apca066 name="construct.b.apca066"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca066
            
            #add-point:AFTER FIELD apca066 name="construct.a.apca066"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca066
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca066
            #add-point:ON ACTION controlp INFIELD apca066 name="construct.c.apca066"
            
            #END add-point
 
 
         #Ctrlp:construct.c.apca008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca008
            #add-point:ON ACTION controlp INFIELD apca008 name="construct.c.apca008"
            #付款條件編號
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_pmad002_2()                           
            DISPLAY g_qryparam.return1 TO apca008  

            NEXT FIELD apca008                


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca008
            #add-point:BEFORE FIELD apca008 name="construct.b.apca008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca008
            
            #add-point:AFTER FIELD apca008 name="construct.a.apca008"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca009
            #add-point:BEFORE FIELD apca009 name="construct.b.apca009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca009
            
            #add-point:AFTER FIELD apca009 name="construct.a.apca009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca009
            #add-point:ON ACTION controlp INFIELD apca009 name="construct.c.apca009"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca010
            #add-point:BEFORE FIELD apca010 name="construct.b.apca010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca010
            
            #add-point:AFTER FIELD apca010 name="construct.a.apca010"
            LET g_apca_m_o.* = g_apca_m.*   #160726-00020#10
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca010
            #add-point:ON ACTION controlp INFIELD apca010 name="construct.c.apca010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca060
            #add-point:BEFORE FIELD apca060 name="construct.b.apca060"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca060
            
            #add-point:AFTER FIELD apca060 name="construct.a.apca060"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca060
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca060
            #add-point:ON ACTION controlp INFIELD apca060 name="construct.c.apca060"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca013
            #add-point:BEFORE FIELD apca013 name="construct.b.apca013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca013
            
            #add-point:AFTER FIELD apca013 name="construct.a.apca013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca013
            #add-point:ON ACTION controlp INFIELD apca013 name="construct.c.apca013"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca012
            #add-point:BEFORE FIELD apca012 name="construct.b.apca012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca012
            
            #add-point:AFTER FIELD apca012 name="construct.a.apca012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca012
            #add-point:ON ACTION controlp INFIELD apca012 name="construct.c.apca012"
            
            #END add-point
 
 
         #Ctrlp:construct.c.apca011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca011
            #add-point:ON ACTION controlp INFIELD apca011 name="construct.c.apca011"
            #稅區
            #開窗c段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
   			LET g_qryparam.reqry = FALSE
   			SELECT ooef017 INTO l_ooef017 #160511-00026#1--(S)
   			     FROM ooef_t
   			    WHERE ooefent = g_enterprise
   			      AND ooef001 = g_site
   			   CALL s_tax_get_ooef019(l_ooef017) RETURNING g_sub_success,l_ooef019
   			LET g_qryparam.arg1 = l_ooef019
		      LET g_qryparam.where = " oodb004 ='1' "  #160511-00026#1--(E)
		     #LET g_qryparam.where = " oodb004 ='1' AND  oodb008 = '2'"  #160511-00026#1   Mark
			   CALL q_oodb002_5() 
            DISPLAY g_qryparam.return1 TO apca011  
            NEXT FIELD apca011                


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca011
            #add-point:BEFORE FIELD apca011 name="construct.b.apca011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca011
            
            #add-point:AFTER FIELD apca011 name="construct.a.apca011"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca011_desc
            #add-point:BEFORE FIELD apca011_desc name="construct.b.apca011_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca011_desc
            
            #add-point:AFTER FIELD apca011_desc name="construct.a.apca011_desc"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca011_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca011_desc
            #add-point:ON ACTION controlp INFIELD apca011_desc name="construct.c.apca011_desc"
            
            #END add-point
 
 
         #Ctrlp:construct.c.apca007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca007
            #add-point:ON ACTION controlp INFIELD apca007 name="construct.c.apca007"
            #帳款類別
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
			LET g_qryparam.arg1 = '3211'
            CALL q_oocq002()                           
            DISPLAY g_qryparam.return1 TO apca007  

            NEXT FIELD apca007                


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca007
            #add-point:BEFORE FIELD apca007 name="construct.b.apca007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca007
            
            #add-point:AFTER FIELD apca007 name="construct.a.apca007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca036
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca036
            #add-point:ON ACTION controlp INFIELD apca036 name="construct.c.apca036"
            #費用(借方)科目編號
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
			LET g_qryparam.where = "glac003 <>'1' " #非統制科目
            #161111-00042#2 --s add
			   LET l_comp = NULL
			   SELECT ooef017 INTO l_comp FROM ooef_t WHERE ooefent = g_enterprise AND ooef001 = g_site
			   LET l_ld = NULL
            SELECT glaald INTO l_ld FROM glaa_t WHERE glaaent = g_enterprise AND glaacomp = l_comp AND glaa014 = 'Y'
            LET g_qryparam.where = g_qryparam.where,
                                   " AND glac002 IN (SELECT glad001 FROM glad_t,glac_t WHERE glacent = gladent AND glad001= glac002 ",
                                   " AND gladld='",l_ld,"' AND gladent=",g_enterprise,
                                   " AND gladstus = 'Y' )"
            #161111-00042#2 --s add			
            CALL aglt310_04()                       
            DISPLAY g_qryparam.return1 TO apca036   

            NEXT FIELD apca036                 


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca036
            #add-point:BEFORE FIELD apca036 name="construct.b.apca036"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca036
            
            #add-point:AFTER FIELD apca036 name="construct.a.apca036"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca035
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca035
            #add-point:ON ACTION controlp INFIELD apca035 name="construct.c.apca035"
            #應付(貸方)科目編號
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
			LET g_qryparam.where = "glac003 <>'1' " #非統制科目
            #161111-00042#2 --s add
			   LET l_comp = NULL
			   SELECT ooef017 INTO l_comp FROM ooef_t WHERE ooefent = g_enterprise AND ooef001 = g_site
			   LET l_ld = NULL
            SELECT glaald INTO l_ld FROM glaa_t WHERE glaaent = g_enterprise AND glaacomp = l_comp AND glaa014 = 'Y'
            LET g_qryparam.where = g_qryparam.where,
                                   " AND glac002 IN (SELECT glad001 FROM glad_t,glac_t WHERE glacent = gladent AND glad001= glac002 ",
                                   " AND gladld='",l_ld,"' AND gladent=",g_enterprise,
                                   " AND gladstus = 'Y' )"
            #161111-00042#2 --s add
            CALL aglt310_04()                       
            #DISPLAY g_qryparam.return1 TO apca036    #161111-00042#2 mark
            DISPLAY g_qryparam.return1 TO apca035     #161111-00042#2 add 

            NEXT FIELD apca035                


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca035
            #add-point:BEFORE FIELD apca035 name="construct.b.apca035"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca035
            
            #add-point:AFTER FIELD apca035 name="construct.a.apca035"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca100
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca100
            #add-point:ON ACTION controlp INFIELD apca100 name="construct.c.apca100"
            #交易幣別
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooai001()                           
            DISPLAY g_qryparam.return1 TO apca100  

            NEXT FIELD apca100                


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca100
            #add-point:BEFORE FIELD apca100 name="construct.b.apca100"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca100
            
            #add-point:AFTER FIELD apca100 name="construct.a.apca100"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca103
            #add-point:BEFORE FIELD apca103 name="construct.b.apca103"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca103
            
            #add-point:AFTER FIELD apca103 name="construct.a.apca103"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca103
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca103
            #add-point:ON ACTION controlp INFIELD apca103 name="construct.c.apca103"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca104
            #add-point:BEFORE FIELD apca104 name="construct.b.apca104"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca104
            
            #add-point:AFTER FIELD apca104 name="construct.a.apca104"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca104
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca104
            #add-point:ON ACTION controlp INFIELD apca104 name="construct.c.apca104"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca106
            #add-point:BEFORE FIELD apca106 name="construct.b.apca106"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca106
            
            #add-point:AFTER FIELD apca106 name="construct.a.apca106"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca106
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca106
            #add-point:ON ACTION controlp INFIELD apca106 name="construct.c.apca106"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca108
            #add-point:BEFORE FIELD apca108 name="construct.b.apca108"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca108
            
            #add-point:AFTER FIELD apca108 name="construct.a.apca108"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca108
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca108
            #add-point:ON ACTION controlp INFIELD apca108 name="construct.c.apca108"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD glaa001
            #add-point:BEFORE FIELD glaa001 name="construct.b.glaa001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD glaa001
            
            #add-point:AFTER FIELD glaa001 name="construct.a.glaa001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.glaa001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD glaa001
            #add-point:ON ACTION controlp INFIELD glaa001 name="construct.c.glaa001"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca101
            #add-point:BEFORE FIELD apca101 name="construct.b.apca101"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca101
            
            #add-point:AFTER FIELD apca101 name="construct.a.apca101"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca101
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca101
            #add-point:ON ACTION controlp INFIELD apca101 name="construct.c.apca101"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca113
            #add-point:BEFORE FIELD apca113 name="construct.b.apca113"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca113
            
            #add-point:AFTER FIELD apca113 name="construct.a.apca113"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca113
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca113
            #add-point:ON ACTION controlp INFIELD apca113 name="construct.c.apca113"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca114
            #add-point:BEFORE FIELD apca114 name="construct.b.apca114"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca114
            
            #add-point:AFTER FIELD apca114 name="construct.a.apca114"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca114
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca114
            #add-point:ON ACTION controlp INFIELD apca114 name="construct.c.apca114"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca116
            #add-point:BEFORE FIELD apca116 name="construct.b.apca116"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca116
            
            #add-point:AFTER FIELD apca116 name="construct.a.apca116"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca116
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca116
            #add-point:ON ACTION controlp INFIELD apca116 name="construct.c.apca116"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcc113
            #add-point:BEFORE FIELD apcc113 name="construct.b.apcc113"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcc113
            
            #add-point:AFTER FIELD apcc113 name="construct.a.apcc113"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apcc113
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcc113
            #add-point:ON ACTION controlp INFIELD apcc113 name="construct.c.apcc113"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca118
            #add-point:BEFORE FIELD apca118 name="construct.b.apca118"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca118
            
            #add-point:AFTER FIELD apca118 name="construct.a.apca118"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca118
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca118
            #add-point:ON ACTION controlp INFIELD apca118 name="construct.c.apca118"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca056
            #add-point:BEFORE FIELD apca056 name="construct.b.apca056"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca056
            
            #add-point:AFTER FIELD apca056 name="construct.a.apca056"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca056
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca056
            #add-point:ON ACTION controlp INFIELD apca056 name="construct.c.apca056"
 
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca016
            #add-point:BEFORE FIELD apca016 name="construct.b.apca016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca016
            
            #add-point:AFTER FIELD apca016 name="construct.a.apca016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca016
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca016
            #add-point:ON ACTION controlp INFIELD apca016 name="construct.c.apca016"
            #來源作業類型
            #END add-point
 
 
         #Ctrlp:construct.c.apca055
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca055
            #add-point:ON ACTION controlp INFIELD apca055 name="construct.c.apca055"
            #繳款優惠條件
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooid001_1()                           
            DISPLAY g_qryparam.return1 TO apca055  

            NEXT FIELD apca055                


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca055
            #add-point:BEFORE FIELD apca055 name="construct.b.apca055"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca055
            
            #add-point:AFTER FIELD apca055 name="construct.a.apca055"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca018
            #add-point:BEFORE FIELD apca018 name="construct.b.apca018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca018
            
            #add-point:AFTER FIELD apca018 name="construct.a.apca018"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca018
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca018
            #add-point:ON ACTION controlp INFIELD apca018 name="construct.c.apca018"
            #來源參考單號
            #END add-point
 
 
         #Ctrlp:construct.c.apca019
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca019
            #add-point:ON ACTION controlp INFIELD apca019 name="construct.c.apca019"
            #系統產生對應單號
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_apca019()                       
            DISPLAY g_qryparam.return1 TO apca019  
            NEXT FIELD apca019                
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca019
            #add-point:BEFORE FIELD apca019 name="construct.b.apca019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca019
            
            #add-point:AFTER FIELD apca019 name="construct.a.apca019"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca014
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca014
            #add-point:ON ACTION controlp INFIELD apca014 name="construct.c.apca014"
            #業務人員
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001_8()                       
            DISPLAY g_qryparam.return1 TO apca014  
            NEXT FIELD apca014                


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca014
            #add-point:BEFORE FIELD apca014 name="construct.b.apca014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca014
            
            #add-point:AFTER FIELD apca014 name="construct.a.apca014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca054
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca054
            #add-point:ON ACTION controlp INFIELD apca054 name="construct.c.apca054"
            #多帳期設定
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
			LET g_qryparam.arg1  = '3114'
            CALL q_oocq002()                       
            DISPLAY g_qryparam.return1 TO apca054  

            NEXT FIELD apca054                


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca054
            #add-point:BEFORE FIELD apca054 name="construct.b.apca054"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca054
            
            #add-point:AFTER FIELD apca054 name="construct.a.apca054"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca015
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca015
            #add-point:ON ACTION controlp INFIELD apca015 name="construct.c.apca015"
            #業務部門
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            #CALL q_ooeg001_4()        #170814-00012#11  170824 By 10044 mark
            CALL q_ooeg001()           #170814-00012#11  170824 By 10044 add                     
            DISPLAY g_qryparam.return1 TO apca015  
            NEXT FIELD apca015                


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca015
            #add-point:BEFORE FIELD apca015 name="construct.b.apca015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca015
            
            #add-point:AFTER FIELD apca015 name="construct.a.apca015"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca034
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca034
            #add-point:ON ACTION controlp INFIELD apca034 name="construct.c.apca034"
            #責任中心
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            #CALL q_ooeg001_5()                     #170329-00074#1 mark
            LET g_qryparam.where = " ooeg003 IN ('2','3','4','5')"#170329-00074#1 add
            CALL q_ooeg001_9()                                    #170329-00074#1 add       
            DISPLAY g_qryparam.return1 TO apca034  

            NEXT FIELD apca034                


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca034
            #add-point:BEFORE FIELD apca034 name="construct.b.apca034"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca034
            
            #add-point:AFTER FIELD apca034 name="construct.a.apca034"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca033
            #add-point:BEFORE FIELD apca033 name="construct.b.apca033"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca033
            
            #add-point:AFTER FIELD apca033 name="construct.a.apca033"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca033
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca033
            #add-point:ON ACTION controlp INFIELD apca033 name="construct.c.apca033"
            #專案編號
		   	INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
		   	LET g_qryparam.reqry = FALSE
            #CALL q_pjba001()  #170330-00057#8 mark
            CALL q_pjab001_1() #170330-00057#8 add                        
            #170426-00070#1 mark(S)            
            #DISPLAY g_qryparam.return1 TO apca019  #顯示到畫面上   
            #NEXT FIELD apca019
            #170426-00070#1 mark(E)           
            #170426-00070#1 add(S)            
            DISPLAY g_qryparam.return1 TO apca033
            NEXT FIELD apca033 
            #170426-00070#1 add(E)          
            #END add-point
 
 
         #Ctrlp:construct.c.apca058
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca058
            #add-point:ON ACTION controlp INFIELD apca058 name="construct.c.apca058"
            #採購分類
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
			LET g_qryparam.arg1  = '264'
            CALL q_oocq002()                           
            DISPLAY g_qryparam.return1 TO apca058  

            NEXT FIELD apca058                
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca058
            #add-point:BEFORE FIELD apca058 name="construct.b.apca058"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca058
            
            #add-point:AFTER FIELD apca058 name="construct.a.apca058"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca059
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca059
            #add-point:ON ACTION controlp INFIELD apca059 name="construct.c.apca059"
            #預算編號
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_bgaa001()                       
            DISPLAY g_qryparam.return1 TO apca059  

            NEXT FIELD apca059                


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca059
            #add-point:BEFORE FIELD apca059 name="construct.b.apca059"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca059
            
            #add-point:AFTER FIELD apca059 name="construct.a.apca059"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca063
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca063
            #add-point:ON ACTION controlp INFIELD apca063 name="construct.c.apca063"
            #整帳批序號
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_apca063()                       
            DISPLAY g_qryparam.return1 TO apca063  

            NEXT FIELD apca063                


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca063
            #add-point:BEFORE FIELD apca063 name="construct.b.apca063"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca063
            
            #add-point:AFTER FIELD apca063 name="construct.a.apca063"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca050
            #add-point:BEFORE FIELD apca050 name="construct.b.apca050"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca050
            
            #add-point:AFTER FIELD apca050 name="construct.a.apca050"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca050
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca050
            #add-point:ON ACTION controlp INFIELD apca050 name="construct.c.apca050"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca017
            #add-point:BEFORE FIELD apca017 name="construct.b.apca017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca017
            
            #add-point:AFTER FIELD apca017 name="construct.a.apca017"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca017
            #add-point:ON ACTION controlp INFIELD apca017 name="construct.c.apca017"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD partition2
            #add-point:BEFORE FIELD partition2 name="construct.b.partition2"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD partition2
            
            #add-point:AFTER FIELD partition2 name="construct.a.partition2"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.partition2
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD partition2
            #add-point:ON ACTION controlp INFIELD partition2 name="construct.c.partition2"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca051
            #add-point:BEFORE FIELD apca051 name="construct.b.apca051"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca051
            
            #add-point:AFTER FIELD apca051 name="construct.a.apca051"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca051
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca051
            #add-point:ON ACTION controlp INFIELD apca051 name="construct.c.apca051"
            #作廢理由碼
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
			LET g_qryparam.arg1 = "3115"
            CALL q_oocq002()                       
            DISPLAY g_qryparam.return1 TO apca051  
            NEXT FIELD apca051                
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca051_desc
            #add-point:BEFORE FIELD apca051_desc name="construct.b.apca051_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca051_desc
            
            #add-point:AFTER FIELD apca051_desc name="construct.a.apca051_desc"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca051_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca051_desc
            #add-point:ON ACTION controlp INFIELD apca051_desc name="construct.c.apca051_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca053
            #add-point:BEFORE FIELD apca053 name="construct.b.apca053"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca053
            
            #add-point:AFTER FIELD apca053 name="construct.a.apca053"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca053
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca053
            #add-point:ON ACTION controlp INFIELD apca053 name="construct.c.apca053"
            #備註
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca025
            #add-point:BEFORE FIELD apca025 name="construct.b.apca025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca025
            
            #add-point:AFTER FIELD apca025 name="construct.a.apca025"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca025
            #add-point:ON ACTION controlp INFIELD apca025 name="construct.c.apca025"
            
            #END add-point
 
 
         #Ctrlp:construct.c.apca031
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca031
            #add-point:ON ACTION controlp INFIELD apca031 name="construct.c.apca031"
            #產生之差異折讓單號
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
		   #LET g_qryparam.arg1 =                  #帳款單性質
            CALL q_apca019()                       
            DISPLAY g_qryparam.return1 TO apca031  
            NEXT FIELD apca031                


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca031
            #add-point:BEFORE FIELD apca031 name="construct.b.apca031"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca031
            
            #add-point:AFTER FIELD apca031 name="construct.a.apca031"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca030
            #add-point:BEFORE FIELD apca030 name="construct.b.apca030"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca030
            
            #add-point:AFTER FIELD apca030 name="construct.a.apca030"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca030
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca030
            #add-point:ON ACTION controlp INFIELD apca030 name="construct.c.apca030"
            #差異科目
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            #161111-00042#2 --s add
            LET g_qryparam.where = "glac003 <>'1' " #非統制科目
			   LET l_comp = NULL
			   SELECT ooef017 INTO l_comp FROM ooef_t WHERE ooefent = g_enterprise AND ooef001 = g_site
			   LET l_ld = NULL
            SELECT glaald INTO l_ld FROM glaa_t WHERE glaaent = g_enterprise AND glaacomp = l_comp AND glaa014 = 'Y'
            LET g_qryparam.where = g_qryparam.where,
                                   " AND glac002 IN (SELECT glad001 FROM glad_t,glac_t WHERE glacent = gladent AND glad001= glac002 ",
                                   " AND gladld='",l_ld,"' AND gladent=",g_enterprise,
                                   " AND gladstus = 'Y' )"
            #161111-00042#2 --s add             
            CALL aglt310_04()                       
            DISPLAY g_qryparam.return1 TO apca030  
            NEXT FIELD apca030     
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD partition3
            #add-point:BEFORE FIELD partition3 name="construct.b.partition3"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD partition3
            
            #add-point:AFTER FIELD partition3 name="construct.a.partition3"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.partition3
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD partition3
            #add-point:ON ACTION controlp INFIELD partition3 name="construct.c.partition3"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca026
            #add-point:BEFORE FIELD apca026 name="construct.b.apca026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca026
            
            #add-point:AFTER FIELD apca026 name="construct.a.apca026"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca026
            #add-point:ON ACTION controlp INFIELD apca026 name="construct.c.apca026"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca027
            #add-point:BEFORE FIELD apca027 name="construct.b.apca027"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca027
            
            #add-point:AFTER FIELD apca027 name="construct.a.apca027"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca027
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca027
            #add-point:ON ACTION controlp INFIELD apca027 name="construct.c.apca027"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca028
            #add-point:BEFORE FIELD apca028 name="construct.b.apca028"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca028
            
            #add-point:AFTER FIELD apca028 name="construct.a.apca028"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca028
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca028
            #add-point:ON ACTION controlp INFIELD apca028 name="construct.c.apca028"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca029
            #add-point:BEFORE FIELD apca029 name="construct.b.apca029"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca029
            
            #add-point:AFTER FIELD apca029 name="construct.a.apca029"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca029
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca029
            #add-point:ON ACTION controlp INFIELD apca029 name="construct.c.apca029"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca020
            #add-point:BEFORE FIELD apca020 name="construct.b.apca020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca020
            
            #add-point:AFTER FIELD apca020 name="construct.a.apca020"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca020
            #add-point:ON ACTION controlp INFIELD apca020 name="construct.c.apca020"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca021
            #add-point:BEFORE FIELD apca021 name="construct.b.apca021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca021
            
            #add-point:AFTER FIELD apca021 name="construct.a.apca021"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca021
            #add-point:ON ACTION controlp INFIELD apca021 name="construct.c.apca021"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca022
            #add-point:BEFORE FIELD apca022 name="construct.b.apca022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca022
            
            #add-point:AFTER FIELD apca022 name="construct.a.apca022"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca022
            #add-point:ON ACTION controlp INFIELD apca022 name="construct.c.apca022"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca046
            #add-point:BEFORE FIELD apca046 name="construct.b.apca046"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca046
            
            #add-point:AFTER FIELD apca046 name="construct.a.apca046"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca046
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca046
            #add-point:ON ACTION controlp INFIELD apca046 name="construct.c.apca046"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca0181
            #add-point:BEFORE FIELD apca0181 name="construct.b.apca0181"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca0181
            
            #add-point:AFTER FIELD apca0181 name="construct.a.apca0181"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca0181
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca0181
            #add-point:ON ACTION controlp INFIELD apca0181 name="construct.c.apca0181"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca047
            #add-point:BEFORE FIELD apca047 name="construct.b.apca047"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca047
            
            #add-point:AFTER FIELD apca047 name="construct.a.apca047"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca047
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca047
            #add-point:ON ACTION controlp INFIELD apca047 name="construct.c.apca047"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca048
            #add-point:BEFORE FIELD apca048 name="construct.b.apca048"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca048
            
            #add-point:AFTER FIELD apca048 name="construct.a.apca048"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apca048
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca048
            #add-point:ON ACTION controlp INFIELD apca048 name="construct.c.apca048"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcc123
            #add-point:BEFORE FIELD apcc123 name="construct.b.apcc123"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcc123
            
            #add-point:AFTER FIELD apcc123 name="construct.a.apcc123"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apcc123
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcc123
            #add-point:ON ACTION controlp INFIELD apcc123 name="construct.c.apcc123"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcc133
            #add-point:BEFORE FIELD apcc133 name="construct.b.apcc133"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcc133
            
            #add-point:AFTER FIELD apcc133 name="construct.a.apcc133"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apcc133
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcc133
            #add-point:ON ACTION controlp INFIELD apcc133 name="construct.c.apcc133"
            
            #END add-point
 
 
         #Ctrlp:construct.c.apcaownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcaownid
            #add-point:ON ACTION controlp INFIELD apcaownid name="construct.c.apcaownid"
            #資料所有者
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           
            DISPLAY g_qryparam.return1 TO apcaownid  

            NEXT FIELD apcaownid                


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcaownid
            #add-point:BEFORE FIELD apcaownid name="construct.b.apcaownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcaownid
            
            #add-point:AFTER FIELD apcaownid name="construct.a.apcaownid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apcaowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcaowndp
            #add-point:ON ACTION controlp INFIELD apcaowndp name="construct.c.apcaowndp"
            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           
            DISPLAY g_qryparam.return1 TO apcaowndp  

            NEXT FIELD apcaowndp                


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcaowndp
            #add-point:BEFORE FIELD apcaowndp name="construct.b.apcaowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcaowndp
            
            #add-point:AFTER FIELD apcaowndp name="construct.a.apcaowndp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apcacrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcacrtid
            #add-point:ON ACTION controlp INFIELD apcacrtid name="construct.c.apcacrtid"
            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           
            DISPLAY g_qryparam.return1 TO apcacrtid  

            NEXT FIELD apcacrtid                


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcacrtid
            #add-point:BEFORE FIELD apcacrtid name="construct.b.apcacrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcacrtid
            
            #add-point:AFTER FIELD apcacrtid name="construct.a.apcacrtid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apcacrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcacrtdp
            #add-point:ON ACTION controlp INFIELD apcacrtdp name="construct.c.apcacrtdp"
            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           
            DISPLAY g_qryparam.return1 TO apcacrtdp  

            NEXT FIELD apcacrtdp                


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcacrtdp
            #add-point:BEFORE FIELD apcacrtdp name="construct.b.apcacrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcacrtdp
            
            #add-point:AFTER FIELD apcacrtdp name="construct.a.apcacrtdp"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcacrtdt
            #add-point:BEFORE FIELD apcacrtdt name="construct.b.apcacrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.apcamodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcamodid
            #add-point:ON ACTION controlp INFIELD apcamodid name="construct.c.apcamodid"
            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           
            DISPLAY g_qryparam.return1 TO apcamodid  

            NEXT FIELD apcamodid                


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcamodid
            #add-point:BEFORE FIELD apcamodid name="construct.b.apcamodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcamodid
            
            #add-point:AFTER FIELD apcamodid name="construct.a.apcamodid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcamoddt
            #add-point:BEFORE FIELD apcamoddt name="construct.b.apcamoddt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.apcacnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcacnfid
            #add-point:ON ACTION controlp INFIELD apcacnfid name="construct.c.apcacnfid"
            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           
            DISPLAY g_qryparam.return1 TO apcacnfid  

            NEXT FIELD apcacnfid                


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcacnfid
            #add-point:BEFORE FIELD apcacnfid name="construct.b.apcacnfid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcacnfid
            
            #add-point:AFTER FIELD apcacnfid name="construct.a.apcacnfid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcacnfdt
            #add-point:BEFORE FIELD apcacnfdt name="construct.b.apcacnfdt"
            
            #END add-point
 
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON apcbseq,apcb001,apcborga,apcb002,apcb003,apcb023,apcb004,apcb005,apcb030, 
          apcb020,apcb006,apcb022,apcb007,apcb101,apcb103,apcb104,apcb105,apcb111,apcb113,apcb114,apcb115, 
          apcb049,apcb048,apcb008,apcb009,apcb010,apcb047,apcb021,apcb021_desc,apcb029,apcb029_desc, 
          apcb017_desc,apcb135,apcb013,apcb018,apcb019,apcb106,apcb108,apcb051,apcb102,apcb034,apcb054, 
          apcb055,apcb036,l_apcb0332,apcb035,apcb037,apcb038,apcb039,apcb040,apcb041,apcb042,apcb043, 
          apcb044,apcb045,apcb046
           FROM s_detail1[1].apcbseq,s_detail1[1].apcb001,s_detail1[1].apcborga,s_detail1[1].apcb002, 
               s_detail1[1].apcb003,s_detail1[1].apcb023,s_detail1[1].apcb004,s_detail1[1].apcb005,s_detail1[1].apcb030, 
               s_detail1[1].apcb020,s_detail1[1].apcb006,s_detail1[1].apcb022,s_detail1[1].apcb007,s_detail1[1].apcb101, 
               s_detail1[1].apcb103,s_detail1[1].apcb104,s_detail1[1].apcb105,s_detail1[1].apcb111,s_detail1[1].apcb113, 
               s_detail1[1].apcb114,s_detail1[1].apcb115,s_detail1[1].apcb049,s_detail1[1].apcb048,s_detail1[1].apcb008, 
               s_detail1[1].apcb009,s_detail1[1].apcb010,s_detail1[1].apcb047,s_detail1[1].apcb021,s_detail1[1].apcb021_desc, 
               s_detail1[1].apcb029,s_detail1[1].apcb029_desc,s_detail1[1].apcb017_desc,s_detail1[1].apcb135, 
               s_detail1[1].apcb013,s_detail1[1].apcb018,s_detail1[1].apcb019,s_detail1[1].apcb106,s_detail1[1].apcb108, 
               s_detail1[1].apcb051,s_detail1[1].apcb102,s_detail1[1].apcb034,s_detail1[1].apcb054,s_detail1[1].apcb055, 
               s_detail1[1].apcb036,s_detail1[1].l_apcb0332,s_detail1[1].apcb035,s_detail1[1].apcb037, 
               s_detail1[1].apcb038,s_detail1[1].apcb039,s_detail1[1].apcb040,s_detail1[1].apcb041,s_detail1[1].apcb042, 
               s_detail1[1].apcb043,s_detail1[1].apcb044,s_detail1[1].apcb045,s_detail1[1].apcb046
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcbseq
            #add-point:BEFORE FIELD apcbseq name="construct.b.page1.apcbseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcbseq
            
            #add-point:AFTER FIELD apcbseq name="construct.a.page1.apcbseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcbseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcbseq
            #add-point:ON ACTION controlp INFIELD apcbseq name="construct.c.page1.apcbseq"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb001
            #add-point:BEFORE FIELD apcb001 name="construct.b.page1.apcb001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb001
            
            #add-point:AFTER FIELD apcb001 name="construct.a.page1.apcb001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb001
            #add-point:ON ACTION controlp INFIELD apcb001 name="construct.c.page1.apcb001"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.apcborga
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcborga
            #add-point:ON ACTION controlp INFIELD apcborga name="construct.c.page1.apcborga"
            #來源組織
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
			LET g_qryparam.where = "ooef201 = 'Y'"   #161006-00005#4   add
			IF NOT cl_null(g_wc_cs_orga) THEN         #160125-00005#6
			   LET g_qryparam.where = g_qryparam.where ,   #161006-00005#4   add 
			                          " AND ooef001 IN ",g_wc_cs_orga
			END IF                                    #160125-00005#6
            CALL q_ooef001()  
            DISPLAY g_qryparam.return1 TO apcborga  

            NEXT FIELD apcborga                


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcborga
            #add-point:BEFORE FIELD apcborga name="construct.b.page1.apcborga"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcborga
            
            #add-point:AFTER FIELD apcborga name="construct.a.page1.apcborga"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb002
            #add-point:BEFORE FIELD apcb002 name="construct.b.page1.apcb002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb002
            
            #add-point:AFTER FIELD apcb002 name="construct.a.page1.apcb002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb002
            #add-point:ON ACTION controlp INFIELD apcb002 name="construct.c.page1.apcb002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb003
            #add-point:BEFORE FIELD apcb003 name="construct.b.page1.apcb003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb003
            
            #add-point:AFTER FIELD apcb003 name="construct.a.page1.apcb003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb003
            #add-point:ON ACTION controlp INFIELD apcb003 name="construct.c.page1.apcb003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb023
            #add-point:BEFORE FIELD apcb023 name="construct.b.page1.apcb023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb023
            
            #add-point:AFTER FIELD apcb023 name="construct.a.page1.apcb023"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb023
            #add-point:ON ACTION controlp INFIELD apcb023 name="construct.c.page1.apcb023"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.apcb004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb004
            #add-point:ON ACTION controlp INFIELD apcb004 name="construct.c.page1.apcb004"
            #產品編號
            #開窗c段
            #161111-00042#2 --s add 
            LET l_apcb004_comp = ''
            SELECT ooef017 INTO l_apcb004_comp FROM ooef_t WHERE ooefent = g_enterprise AND ooef001 = g_site
            #161111-00042#2 --e add 
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
			   LET g_qryparam.arg1 = l_apcb004_comp              #161111-00042#2 add 
            #CALL q_imaa001_14()                   #呼叫開窗  #161111-00042#2 mark
            CALL q_imaf001_21()                              #161111-00042#2 add     
            DISPLAY g_qryparam.return1 TO apcb004  

            NEXT FIELD apcb004                


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb004
            #add-point:BEFORE FIELD apcb004 name="construct.b.page1.apcb004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb004
            
            #add-point:AFTER FIELD apcb004 name="construct.a.page1.apcb004"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb005
            #add-point:BEFORE FIELD apcb005 name="construct.b.page1.apcb005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb005
            
            #add-point:AFTER FIELD apcb005 name="construct.a.page1.apcb005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb005
            #add-point:ON ACTION controlp INFIELD apcb005 name="construct.c.page1.apcb005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb030
            #add-point:BEFORE FIELD apcb030 name="construct.b.page1.apcb030"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb030
            
            #add-point:AFTER FIELD apcb030 name="construct.a.page1.apcb030"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb030
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb030
            #add-point:ON ACTION controlp INFIELD apcb030 name="construct.c.page1.apcb030"
            #付款條件編號            
            #開窗c段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
   			LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apcb_d[l_ac].apcb030
            LET g_qryparam.arg1 =g_apca_m.apca004
            CALL q_pmad002_2()                                
            LET g_apcb_d[l_ac].apcb030 = g_qryparam.return1   
            NEXT FIELD apcb030       
            #END add-point
 
 
         #Ctrlp:construct.c.page1.apcb020
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb020
            #add-point:ON ACTION controlp INFIELD apcb020 name="construct.c.page1.apcb020"
            #稅別
            #開窗c段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
   			LET g_qryparam.reqry = FALSE
		      SELECT ooef017 INTO l_ooef017 #160511-00026#1--(S)
			     FROM ooef_t
			    WHERE ooefent = g_enterprise
			      AND ooef001 = g_site
			   CALL s_tax_get_ooef019(l_ooef017) RETURNING g_sub_success,l_ooef019
   			LET g_qryparam.arg1 = l_ooef019
		      LET g_qryparam.where = " oodb004 ='1' "  #160511-00026#1--(E)
		     #LET g_qryparam.where = " oodb004 ='1' AND  oodb008 = '2'"  #160511-00026#1   Mark
            CALL q_oodb002_5()                     
            DISPLAY g_qryparam.return1 TO apcb020  

            NEXT FIELD apcb020                


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb020
            #add-point:BEFORE FIELD apcb020 name="construct.b.page1.apcb020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb020
            
            #add-point:AFTER FIELD apcb020 name="construct.a.page1.apcb020"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb006
            #add-point:ON ACTION controlp INFIELD apcb006 name="construct.c.page1.apcb006"
            #單位
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooca001_1()                     
            DISPLAY g_qryparam.return1 TO apcb006  

            NEXT FIELD apcb006                


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb006
            #add-point:BEFORE FIELD apcb006 name="construct.b.page1.apcb006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb006
            
            #add-point:AFTER FIELD apcb006 name="construct.a.page1.apcb006"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb022
            #add-point:BEFORE FIELD apcb022 name="construct.b.page1.apcb022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb022
            
            #add-point:AFTER FIELD apcb022 name="construct.a.page1.apcb022"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb022
            #add-point:ON ACTION controlp INFIELD apcb022 name="construct.c.page1.apcb022"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb007
            #add-point:BEFORE FIELD apcb007 name="construct.b.page1.apcb007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb007
            
            #add-point:AFTER FIELD apcb007 name="construct.a.page1.apcb007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb007
            #add-point:ON ACTION controlp INFIELD apcb007 name="construct.c.page1.apcb007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb101
            #add-point:BEFORE FIELD apcb101 name="construct.b.page1.apcb101"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb101
            
            #add-point:AFTER FIELD apcb101 name="construct.a.page1.apcb101"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb101
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb101
            #add-point:ON ACTION controlp INFIELD apcb101 name="construct.c.page1.apcb101"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb103
            #add-point:BEFORE FIELD apcb103 name="construct.b.page1.apcb103"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb103
            
            #add-point:AFTER FIELD apcb103 name="construct.a.page1.apcb103"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb103
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb103
            #add-point:ON ACTION controlp INFIELD apcb103 name="construct.c.page1.apcb103"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb104
            #add-point:BEFORE FIELD apcb104 name="construct.b.page1.apcb104"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb104
            
            #add-point:AFTER FIELD apcb104 name="construct.a.page1.apcb104"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb104
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb104
            #add-point:ON ACTION controlp INFIELD apcb104 name="construct.c.page1.apcb104"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb105
            #add-point:BEFORE FIELD apcb105 name="construct.b.page1.apcb105"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb105
            
            #add-point:AFTER FIELD apcb105 name="construct.a.page1.apcb105"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb105
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb105
            #add-point:ON ACTION controlp INFIELD apcb105 name="construct.c.page1.apcb105"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb111
            #add-point:BEFORE FIELD apcb111 name="construct.b.page1.apcb111"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb111
            
            #add-point:AFTER FIELD apcb111 name="construct.a.page1.apcb111"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb111
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb111
            #add-point:ON ACTION controlp INFIELD apcb111 name="construct.c.page1.apcb111"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb113
            #add-point:BEFORE FIELD apcb113 name="construct.b.page1.apcb113"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb113
            
            #add-point:AFTER FIELD apcb113 name="construct.a.page1.apcb113"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb113
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb113
            #add-point:ON ACTION controlp INFIELD apcb113 name="construct.c.page1.apcb113"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb114
            #add-point:BEFORE FIELD apcb114 name="construct.b.page1.apcb114"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb114
            
            #add-point:AFTER FIELD apcb114 name="construct.a.page1.apcb114"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb114
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb114
            #add-point:ON ACTION controlp INFIELD apcb114 name="construct.c.page1.apcb114"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb115
            #add-point:BEFORE FIELD apcb115 name="construct.b.page1.apcb115"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb115
            
            #add-point:AFTER FIELD apcb115 name="construct.a.page1.apcb115"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb115
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb115
            #add-point:ON ACTION controlp INFIELD apcb115 name="construct.c.page1.apcb115"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb049
            #add-point:BEFORE FIELD apcb049 name="construct.b.page1.apcb049"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb049
            
            #add-point:AFTER FIELD apcb049 name="construct.a.page1.apcb049"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb049
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb049
            #add-point:ON ACTION controlp INFIELD apcb049 name="construct.c.page1.apcb049"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb048
            #add-point:BEFORE FIELD apcb048 name="construct.b.page1.apcb048"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb048
            
            #add-point:AFTER FIELD apcb048 name="construct.a.page1.apcb048"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb048
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb048
            #add-point:ON ACTION controlp INFIELD apcb048 name="construct.c.page1.apcb048"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb008
            #add-point:BEFORE FIELD apcb008 name="construct.b.page1.apcb008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb008
            
            #add-point:AFTER FIELD apcb008 name="construct.a.page1.apcb008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb008
            #add-point:ON ACTION controlp INFIELD apcb008 name="construct.c.page1.apcb008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb009
            #add-point:BEFORE FIELD apcb009 name="construct.b.page1.apcb009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb009
            
            #add-point:AFTER FIELD apcb009 name="construct.a.page1.apcb009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb009
            #add-point:ON ACTION controlp INFIELD apcb009 name="construct.c.page1.apcb009"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb010
            #add-point:BEFORE FIELD apcb010 name="construct.b.page1.apcb010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb010
            
            #add-point:AFTER FIELD apcb010 name="construct.a.page1.apcb010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb010
            #add-point:ON ACTION controlp INFIELD apcb010 name="construct.c.page1.apcb010"
	         #150828-00001#7--s
            #業務部門
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_today
            #CALL q_ooeg001_4()        #170814-00012#11  170824 By 10044 mark
            CALL q_ooeg001()           #170814-00012#11  170824 By 10044 add                     
            DISPLAY g_qryparam.return1 TO apcb010  
            NEXT FIELD apcb010                     
            #150828-00001#7--e
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb047
            #add-point:BEFORE FIELD apcb047 name="construct.b.page1.apcb047"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb047
            
            #add-point:AFTER FIELD apcb047 name="construct.a.page1.apcb047"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb047
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb047
            #add-point:ON ACTION controlp INFIELD apcb047 name="construct.c.page1.apcb047"
            #161027-00051#3-----s
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " ( oocq004 = (SELECT ooef017 FROM ooef_t WHERE ooefent = ",g_enterprise," AND ooef001 = '",g_site,"'
                                         AND ooefstus = 'Y' ) OR oocq004 IS NULL) "
            #給予arg
            CALL q_oocq002_2()                                #呼叫開窗               
            DISPLAY g_qryparam.return1 TO apcb047             #顯示到畫面上             
            NEXT FIELD apcb047            
            #161027-00051#3-----e
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb021
            #add-point:BEFORE FIELD apcb021 name="construct.b.page1.apcb021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb021
            
            #add-point:AFTER FIELD apcb021 name="construct.a.page1.apcb021"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb021
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb021
            #add-point:ON ACTION controlp INFIELD apcb021 name="construct.c.page1.apcb021"
            #150206-00013#3   ---(s)---
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = "glac003 <>'1' "  #glac003(科目類型)
            #161111-00042#2 --s add
			   LET l_comp = NULL
			   SELECT ooef017 INTO l_comp FROM ooef_t WHERE ooefent = g_enterprise AND ooef001 = g_site
			   LET l_ld = NULL
            SELECT glaald INTO l_ld FROM glaa_t WHERE glaaent = g_enterprise AND glaacomp = l_comp AND glaa014 = 'Y'
            LET g_qryparam.where = g_qryparam.where,
                                   " AND glac002 IN (SELECT glad001 FROM glad_t,glac_t WHERE glacent = gladent AND glad001= glac002 ",
                                   " AND gladld='",l_ld,"' AND gladent=",g_enterprise,
                                   " AND gladstus = 'Y' )"
            #161111-00042#2 --s add	
            CALL aglt310_04()                               
            DISPLAY g_qryparam.return1 TO apcb021
            NEXT FIELD apcb021
            #150206-00013#3   ---(e)---   
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb021_desc
            #add-point:BEFORE FIELD apcb021_desc name="construct.b.page1.apcb021_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb021_desc
            
            #add-point:AFTER FIELD apcb021_desc name="construct.a.page1.apcb021_desc"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb021_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb021_desc
            #add-point:ON ACTION controlp INFIELD apcb021_desc name="construct.c.page1.apcb021_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb029
            #add-point:BEFORE FIELD apcb029 name="construct.b.page1.apcb029"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb029
            
            #add-point:AFTER FIELD apcb029 name="construct.a.page1.apcb029"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb029
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb029
            #add-point:ON ACTION controlp INFIELD apcb029 name="construct.c.page1.apcb029"
            #150206-00013#3   ---(s)---
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = "glac003 <>'1' "  #glac003(科目類型)
            #161111-00042#2 --s add
			   LET l_comp = NULL
			   SELECT ooef017 INTO l_comp FROM ooef_t WHERE ooefent = g_enterprise AND ooef001 = g_site
			   LET l_ld = NULL
            SELECT glaald INTO l_ld FROM glaa_t WHERE glaaent = g_enterprise AND glaacomp = l_comp AND glaa014 = 'Y'
            LET g_qryparam.where = g_qryparam.where,
                                   " AND glac002 IN (SELECT glad001 FROM glad_t,glac_t WHERE glacent = gladent AND glad001= glac002 ",
                                   " AND gladld='",l_ld,"' AND gladent=",g_enterprise,
                                   " AND gladstus = 'Y' )"
            #161111-00042#2 --s add
            CALL aglt310_04()                               
            DISPLAY g_qryparam.return1 TO apcb029
            NEXT FIELD apcb029
            #150206-00013#3   ---(e)--- 
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb029_desc
            #add-point:BEFORE FIELD apcb029_desc name="construct.b.page1.apcb029_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb029_desc
            
            #add-point:AFTER FIELD apcb029_desc name="construct.a.page1.apcb029_desc"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb029_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb029_desc
            #add-point:ON ACTION controlp INFIELD apcb029_desc name="construct.c.page1.apcb029_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb017
            #add-point:BEFORE FIELD apcb017 name="construct.b.page1.apcb017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb017
            
            #add-point:AFTER FIELD apcb017 name="construct.a.page1.apcb017"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb017
            #add-point:ON ACTION controlp INFIELD apcb017 name="construct.c.page1.apcb017"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb017_desc
            #add-point:BEFORE FIELD apcb017_desc name="construct.b.page1.apcb017_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb017_desc
            
            #add-point:AFTER FIELD apcb017_desc name="construct.a.page1.apcb017_desc"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb017_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb017_desc
            #add-point:ON ACTION controlp INFIELD apcb017_desc name="construct.c.page1.apcb017_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb135
            #add-point:BEFORE FIELD apcb135 name="construct.b.page1.apcb135"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb135
            
            #add-point:AFTER FIELD apcb135 name="construct.a.page1.apcb135"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb135
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb135
            #add-point:ON ACTION controlp INFIELD apcb135 name="construct.c.page1.apcb135"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb013
            #add-point:BEFORE FIELD apcb013 name="construct.b.page1.apcb013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb013
            
            #add-point:AFTER FIELD apcb013 name="construct.a.page1.apcb013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb013
            #add-point:ON ACTION controlp INFIELD apcb013 name="construct.c.page1.apcb013"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb018
            #add-point:BEFORE FIELD apcb018 name="construct.b.page1.apcb018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb018
            
            #add-point:AFTER FIELD apcb018 name="construct.a.page1.apcb018"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb018
            #add-point:ON ACTION controlp INFIELD apcb018 name="construct.c.page1.apcb018"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb019
            #add-point:BEFORE FIELD apcb019 name="construct.b.page1.apcb019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb019
            
            #add-point:AFTER FIELD apcb019 name="construct.a.page1.apcb019"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb019
            #add-point:ON ACTION controlp INFIELD apcb019 name="construct.c.page1.apcb019"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb106
            #add-point:BEFORE FIELD apcb106 name="construct.b.page1.apcb106"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb106
            
            #add-point:AFTER FIELD apcb106 name="construct.a.page1.apcb106"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb106
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb106
            #add-point:ON ACTION controlp INFIELD apcb106 name="construct.c.page1.apcb106"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb108
            #add-point:BEFORE FIELD apcb108 name="construct.b.page1.apcb108"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb108
            
            #add-point:AFTER FIELD apcb108 name="construct.a.page1.apcb108"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb108
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb108
            #add-point:ON ACTION controlp INFIELD apcb108 name="construct.c.page1.apcb108"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb051
            #add-point:BEFORE FIELD apcb051 name="construct.b.page1.apcb051"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb051
            
            #add-point:AFTER FIELD apcb051 name="construct.a.page1.apcb051"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb051
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb051
            #add-point:ON ACTION controlp INFIELD apcb051 name="construct.c.page1.apcb051"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb102
            #add-point:BEFORE FIELD apcb102 name="construct.b.page1.apcb102"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb102
            
            #add-point:AFTER FIELD apcb102 name="construct.a.page1.apcb102"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb102
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb102
            #add-point:ON ACTION controlp INFIELD apcb102 name="construct.c.page1.apcb102"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb034
            #add-point:BEFORE FIELD apcb034 name="construct.b.page1.apcb034"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb034
            
            #add-point:AFTER FIELD apcb034 name="construct.a.page1.apcb034"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb034
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb034
            #add-point:ON ACTION controlp INFIELD apcb034 name="construct.c.page1.apcb034"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb054
            #add-point:BEFORE FIELD apcb054 name="construct.b.page1.apcb054"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb054
            
            #add-point:AFTER FIELD apcb054 name="construct.a.page1.apcb054"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb054
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb054
            #add-point:ON ACTION controlp INFIELD apcb054 name="construct.c.page1.apcb054"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb055
            #add-point:BEFORE FIELD apcb055 name="construct.b.page1.apcb055"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb055
            
            #add-point:AFTER FIELD apcb055 name="construct.a.page1.apcb055"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb055
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb055
            #add-point:ON ACTION controlp INFIELD apcb055 name="construct.c.page1.apcb055"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb036
            #add-point:BEFORE FIELD apcb036 name="construct.b.page1.apcb036"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb036
            
            #add-point:AFTER FIELD apcb036 name="construct.a.page1.apcb036"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb036
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb036
            #add-point:ON ACTION controlp INFIELD apcb036 name="construct.c.page1.apcb036"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_apcb0332
            #add-point:BEFORE FIELD l_apcb0332 name="construct.b.page1.l_apcb0332"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_apcb0332
            
            #add-point:AFTER FIELD l_apcb0332 name="construct.a.page1.l_apcb0332"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.l_apcb0332
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_apcb0332
            #add-point:ON ACTION controlp INFIELD l_apcb0332 name="construct.c.page1.l_apcb0332"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb035
            #add-point:BEFORE FIELD apcb035 name="construct.b.page1.apcb035"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb035
            
            #add-point:AFTER FIELD apcb035 name="construct.a.page1.apcb035"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb035
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb035
            #add-point:ON ACTION controlp INFIELD apcb035 name="construct.c.page1.apcb035"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb037
            #add-point:BEFORE FIELD apcb037 name="construct.b.page1.apcb037"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb037
            
            #add-point:AFTER FIELD apcb037 name="construct.a.page1.apcb037"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb037
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb037
            #add-point:ON ACTION controlp INFIELD apcb037 name="construct.c.page1.apcb037"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb038
            #add-point:BEFORE FIELD apcb038 name="construct.b.page1.apcb038"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb038
            
            #add-point:AFTER FIELD apcb038 name="construct.a.page1.apcb038"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb038
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb038
            #add-point:ON ACTION controlp INFIELD apcb038 name="construct.c.page1.apcb038"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb039
            #add-point:BEFORE FIELD apcb039 name="construct.b.page1.apcb039"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb039
            
            #add-point:AFTER FIELD apcb039 name="construct.a.page1.apcb039"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb039
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb039
            #add-point:ON ACTION controlp INFIELD apcb039 name="construct.c.page1.apcb039"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb040
            #add-point:BEFORE FIELD apcb040 name="construct.b.page1.apcb040"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb040
            
            #add-point:AFTER FIELD apcb040 name="construct.a.page1.apcb040"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb040
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb040
            #add-point:ON ACTION controlp INFIELD apcb040 name="construct.c.page1.apcb040"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb041
            #add-point:BEFORE FIELD apcb041 name="construct.b.page1.apcb041"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb041
            
            #add-point:AFTER FIELD apcb041 name="construct.a.page1.apcb041"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb041
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb041
            #add-point:ON ACTION controlp INFIELD apcb041 name="construct.c.page1.apcb041"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb042
            #add-point:BEFORE FIELD apcb042 name="construct.b.page1.apcb042"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb042
            
            #add-point:AFTER FIELD apcb042 name="construct.a.page1.apcb042"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb042
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb042
            #add-point:ON ACTION controlp INFIELD apcb042 name="construct.c.page1.apcb042"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb043
            #add-point:BEFORE FIELD apcb043 name="construct.b.page1.apcb043"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb043
            
            #add-point:AFTER FIELD apcb043 name="construct.a.page1.apcb043"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb043
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb043
            #add-point:ON ACTION controlp INFIELD apcb043 name="construct.c.page1.apcb043"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb044
            #add-point:BEFORE FIELD apcb044 name="construct.b.page1.apcb044"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb044
            
            #add-point:AFTER FIELD apcb044 name="construct.a.page1.apcb044"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb044
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb044
            #add-point:ON ACTION controlp INFIELD apcb044 name="construct.c.page1.apcb044"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb045
            #add-point:BEFORE FIELD apcb045 name="construct.b.page1.apcb045"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb045
            
            #add-point:AFTER FIELD apcb045 name="construct.a.page1.apcb045"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb045
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb045
            #add-point:ON ACTION controlp INFIELD apcb045 name="construct.c.page1.apcb045"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb046
            #add-point:BEFORE FIELD apcb046 name="construct.b.page1.apcb046"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb046
            
            #add-point:AFTER FIELD apcb046 name="construct.a.page1.apcb046"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apcb046
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb046
            #add-point:ON ACTION controlp INFIELD apcb046 name="construct.c.page1.apcb046"
            
            #END add-point
 
 
   
       
      END CONSTRUCT
      
      CONSTRUCT g_wc2_table2 ON xrcdseq,xrcd002,xrcd002_desc,xrcd003,xrcd006,xrcd005,xrcd102,xrcd103, 
          xrcd104,xrcd105,xrcd113,xrcd114,xrcd115,xrcd123,xrcd124,xrcd125,xrcd133,xrcd134,xrcd135,xrcdorga, 
          xrcd009,xrcd009_desc
           FROM s_detail2[1].xrcdseq,s_detail2[1].xrcd002,s_detail2[1].xrcd002_desc,s_detail2[1].xrcd003, 
               s_detail2[1].xrcd006,s_detail2[1].xrcd005,s_detail2[1].xrcd102,s_detail2[1].xrcd103,s_detail2[1].xrcd104, 
               s_detail2[1].xrcd105,s_detail2[1].xrcd113,s_detail2[1].xrcd114,s_detail2[1].xrcd115,s_detail2[1].xrcd123, 
               s_detail2[1].xrcd124,s_detail2[1].xrcd125,s_detail2[1].xrcd133,s_detail2[1].xrcd134,s_detail2[1].xrcd135, 
               s_detail2[1].xrcdorga,s_detail2[1].xrcd009,s_detail2[1].xrcd009_desc
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body2.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理(table 2)
       
       
       #單身一般欄位開窗相關處理       
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcdseq
            #add-point:BEFORE FIELD xrcdseq name="construct.b.page2.xrcdseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcdseq
            
            #add-point:AFTER FIELD xrcdseq name="construct.a.page2.xrcdseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.xrcdseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcdseq
            #add-point:ON ACTION controlp INFIELD xrcdseq name="construct.c.page2.xrcdseq"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd002
            #add-point:BEFORE FIELD xrcd002 name="construct.b.page2.xrcd002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd002
            
            #add-point:AFTER FIELD xrcd002 name="construct.a.page2.xrcd002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.xrcd002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd002
            #add-point:ON ACTION controlp INFIELD xrcd002 name="construct.c.page2.xrcd002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd002_desc
            #add-point:BEFORE FIELD xrcd002_desc name="construct.b.page2.xrcd002_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd002_desc
            
            #add-point:AFTER FIELD xrcd002_desc name="construct.a.page2.xrcd002_desc"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.xrcd002_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd002_desc
            #add-point:ON ACTION controlp INFIELD xrcd002_desc name="construct.c.page2.xrcd002_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd003
            #add-point:BEFORE FIELD xrcd003 name="construct.b.page2.xrcd003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd003
            
            #add-point:AFTER FIELD xrcd003 name="construct.a.page2.xrcd003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.xrcd003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd003
            #add-point:ON ACTION controlp INFIELD xrcd003 name="construct.c.page2.xrcd003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd006
            #add-point:BEFORE FIELD xrcd006 name="construct.b.page2.xrcd006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd006
            
            #add-point:AFTER FIELD xrcd006 name="construct.a.page2.xrcd006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.xrcd006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd006
            #add-point:ON ACTION controlp INFIELD xrcd006 name="construct.c.page2.xrcd006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd005
            #add-point:BEFORE FIELD xrcd005 name="construct.b.page2.xrcd005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd005
            
            #add-point:AFTER FIELD xrcd005 name="construct.a.page2.xrcd005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.xrcd005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd005
            #add-point:ON ACTION controlp INFIELD xrcd005 name="construct.c.page2.xrcd005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd102
            #add-point:BEFORE FIELD xrcd102 name="construct.b.page2.xrcd102"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd102
            
            #add-point:AFTER FIELD xrcd102 name="construct.a.page2.xrcd102"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.xrcd102
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd102
            #add-point:ON ACTION controlp INFIELD xrcd102 name="construct.c.page2.xrcd102"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd103
            #add-point:BEFORE FIELD xrcd103 name="construct.b.page2.xrcd103"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd103
            
            #add-point:AFTER FIELD xrcd103 name="construct.a.page2.xrcd103"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.xrcd103
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd103
            #add-point:ON ACTION controlp INFIELD xrcd103 name="construct.c.page2.xrcd103"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd104
            #add-point:BEFORE FIELD xrcd104 name="construct.b.page2.xrcd104"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd104
            
            #add-point:AFTER FIELD xrcd104 name="construct.a.page2.xrcd104"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.xrcd104
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd104
            #add-point:ON ACTION controlp INFIELD xrcd104 name="construct.c.page2.xrcd104"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd105
            #add-point:BEFORE FIELD xrcd105 name="construct.b.page2.xrcd105"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd105
            
            #add-point:AFTER FIELD xrcd105 name="construct.a.page2.xrcd105"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.xrcd105
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd105
            #add-point:ON ACTION controlp INFIELD xrcd105 name="construct.c.page2.xrcd105"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd113
            #add-point:BEFORE FIELD xrcd113 name="construct.b.page2.xrcd113"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd113
            
            #add-point:AFTER FIELD xrcd113 name="construct.a.page2.xrcd113"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.xrcd113
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd113
            #add-point:ON ACTION controlp INFIELD xrcd113 name="construct.c.page2.xrcd113"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd114
            #add-point:BEFORE FIELD xrcd114 name="construct.b.page2.xrcd114"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd114
            
            #add-point:AFTER FIELD xrcd114 name="construct.a.page2.xrcd114"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.xrcd114
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd114
            #add-point:ON ACTION controlp INFIELD xrcd114 name="construct.c.page2.xrcd114"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd115
            #add-point:BEFORE FIELD xrcd115 name="construct.b.page2.xrcd115"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd115
            
            #add-point:AFTER FIELD xrcd115 name="construct.a.page2.xrcd115"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.xrcd115
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd115
            #add-point:ON ACTION controlp INFIELD xrcd115 name="construct.c.page2.xrcd115"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd123
            #add-point:BEFORE FIELD xrcd123 name="construct.b.page2.xrcd123"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd123
            
            #add-point:AFTER FIELD xrcd123 name="construct.a.page2.xrcd123"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.xrcd123
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd123
            #add-point:ON ACTION controlp INFIELD xrcd123 name="construct.c.page2.xrcd123"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd124
            #add-point:BEFORE FIELD xrcd124 name="construct.b.page2.xrcd124"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd124
            
            #add-point:AFTER FIELD xrcd124 name="construct.a.page2.xrcd124"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.xrcd124
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd124
            #add-point:ON ACTION controlp INFIELD xrcd124 name="construct.c.page2.xrcd124"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd125
            #add-point:BEFORE FIELD xrcd125 name="construct.b.page2.xrcd125"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd125
            
            #add-point:AFTER FIELD xrcd125 name="construct.a.page2.xrcd125"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.xrcd125
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd125
            #add-point:ON ACTION controlp INFIELD xrcd125 name="construct.c.page2.xrcd125"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd133
            #add-point:BEFORE FIELD xrcd133 name="construct.b.page2.xrcd133"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd133
            
            #add-point:AFTER FIELD xrcd133 name="construct.a.page2.xrcd133"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.xrcd133
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd133
            #add-point:ON ACTION controlp INFIELD xrcd133 name="construct.c.page2.xrcd133"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd134
            #add-point:BEFORE FIELD xrcd134 name="construct.b.page2.xrcd134"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd134
            
            #add-point:AFTER FIELD xrcd134 name="construct.a.page2.xrcd134"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.xrcd134
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd134
            #add-point:ON ACTION controlp INFIELD xrcd134 name="construct.c.page2.xrcd134"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd135
            #add-point:BEFORE FIELD xrcd135 name="construct.b.page2.xrcd135"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd135
            
            #add-point:AFTER FIELD xrcd135 name="construct.a.page2.xrcd135"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.xrcd135
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd135
            #add-point:ON ACTION controlp INFIELD xrcd135 name="construct.c.page2.xrcd135"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcdorga
            #add-point:BEFORE FIELD xrcdorga name="construct.b.page2.xrcdorga"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcdorga
            
            #add-point:AFTER FIELD xrcdorga name="construct.a.page2.xrcdorga"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.xrcdorga
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcdorga
            #add-point:ON ACTION controlp INFIELD xrcdorga name="construct.c.page2.xrcdorga"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd009
            #add-point:BEFORE FIELD xrcd009 name="construct.b.page2.xrcd009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd009
            
            #add-point:AFTER FIELD xrcd009 name="construct.a.page2.xrcd009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.xrcd009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd009
            #add-point:ON ACTION controlp INFIELD xrcd009 name="construct.c.page2.xrcd009"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd009_desc
            #add-point:BEFORE FIELD xrcd009_desc name="construct.b.page2.xrcd009_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd009_desc
            
            #add-point:AFTER FIELD xrcd009_desc name="construct.a.page2.xrcd009_desc"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.xrcd009_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd009_desc
            #add-point:ON ACTION controlp INFIELD xrcd009_desc name="construct.c.page2.xrcd009_desc"
            
            #END add-point
 
 
   
       
      END CONSTRUCT
 
 
      
 
      
      #add-point:cs段add_cs(本段內只能出現新的CONSTRUCT指令) name="cs.add_cs"
      SUBDIALOG aap_aapt300_08.aapt300_08_construct
      #end add-point
 
      BEFORE DIALOG
         CALL cl_qbe_init()
         #add-point:cs段b_dialog name="cs.b_dialog"
         CALL s_control_get_supplier_sql_pmab('4',g_site,g_user,g_dept,'',g_wc_cs_comp) RETURNING g_sub_success,g_sql_ctrl #161229-00047#43 add
         CASE g_aw
            WHEN "s_detail1"
               NEXT FIELD apcborga
            WHEN "s_detail2"
               NEXT FIELD xrcd009
            WHEN "s_detail1_aapt300_08"
               NEXT FIELD apcb047
            OTHERWISE
               NEXT FIELD apcborga
         END CASE
         #end add-point  
 
      #查詢方案列表
      ON ACTION qbe_select
         LET ls_wc = ""
         CALL cl_qbe_list("c") RETURNING ls_wc
         IF NOT cl_null(ls_wc) THEN
            CALL util.JSON.parse(ls_wc, la_wc)
            INITIALIZE g_wc, g_wc2, g_wc2_table1, g_wc2_extend TO NULL
            INITIALIZE g_wc2_table2 TO NULL
 
 
            FOR li_idx = 1 TO la_wc.getLength()
               CASE
                  WHEN la_wc[li_idx].tableid = "apca_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "apcb_t" 
                     LET g_wc2_table1 = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "xrcd_t" 
                     LET g_wc2_table2 = la_wc[li_idx].wc
 
 
               END CASE
            END FOR
         END IF
    
      #條件儲存為方案
      ON ACTION qbe_save
         CALL cl_qbe_save()
 
      ON ACTION accept
         ACCEPT DIALOG
 
      ON ACTION cancel
         LET INT_FLAG = 1
         EXIT DIALOG 
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG
   END DIALOG
   
   #組合g_wc2
   LET g_wc2 = g_wc2_table1
   IF g_wc2_table2 <> " 1=1" THEN
      LET g_wc2 = g_wc2 ," AND ", g_wc2_table2
   END IF
 
 
 
 
   
   #add-point:cs段結束前 name="cs.after_construct"
   IF cl_null(g_wc) THEN
      LET g_wc = "apca001 IN (",s_fin_get_scc_gzcb002('8502','3',g_prog) ,")"
   ELSE
      LET g_wc = g_wc CLIPPED, " AND apca001 IN (",s_fin_get_scc_gzcb002('8502','3',g_prog) ,")" CLIPPED
   END IF
   IF g_wc_t300_08 <>  " 1=1" THEN
      #LET g_wc = g_wc ," AND ", g_wc_t300_08      #170502-00042#1 mark
      LET g_wc2 = g_wc2 ," AND ", g_wc_t300_08   #170502-00042#1 add  
   END IF
   #161104-00046#19 --s add
   IF cl_null(g_user_dept_wc)THEN
      LET g_user_dept_wc = ' 1=1'
   END IF
   IF g_user_dept_wc <>  " 1=1" THEN
      LET g_wc = g_wc ," AND ", g_user_dept_wc CLIPPED
   END IF   
   #161104-00046#19 --e add    
   #end add-point    
 
   IF INT_FLAG THEN
      RETURN
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="aapt320.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION aapt320_filter()
   #add-point:filter段define name="filter.define_customerization"
   
   #end add-point   
   #add-point:filter段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="filter.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="filter.pre_function"
   
   #end add-point
   
   #切換畫面
   IF NOT g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",1)
      CALL gfrm_curr.setElementHidden("worksheet",0)
      LET g_main_hidden = 1
   END IF   
 
   LET INT_FLAG = 0
 
   LET g_qryparam.state = 'c'
 
   LET g_wc_filter_t = g_wc_filter.trim()
   LET g_wc_t = g_wc
 
   LET g_wc = cl_replace_str(g_wc, g_wc_filter_t, '')
 
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
      #單頭
      CONSTRUCT g_wc_filter ON apcadocno,apcald,apca001,apca003,apca004,apca005
                          FROM s_browse[1].b_apcadocno,s_browse[1].b_apcald,s_browse[1].b_apca001,s_browse[1].b_apca003, 
                              s_browse[1].b_apca004,s_browse[1].b_apca005
 
         BEFORE CONSTRUCT
               DISPLAY aapt320_filter_parser('apcadocno') TO s_browse[1].b_apcadocno
            DISPLAY aapt320_filter_parser('apcald') TO s_browse[1].b_apcald
            DISPLAY aapt320_filter_parser('apca001') TO s_browse[1].b_apca001
            DISPLAY aapt320_filter_parser('apca003') TO s_browse[1].b_apca003
            DISPLAY aapt320_filter_parser('apca004') TO s_browse[1].b_apca004
            DISPLAY aapt320_filter_parser('apca005') TO s_browse[1].b_apca005
      
         #add-point:filter段cs_ctrl name="filter.cs_ctrl"
         
         #end add-point
      
      END CONSTRUCT
 
      #add-point:filter段add_cs name="filter.add_cs"
      
      #end add-point
 
      BEFORE DIALOG
         #add-point:filter段b_dialog name="filter.b_dialog"
         
         #end add-point  
      
      ON ACTION accept
         ACCEPT DIALOG
 
      ON ACTION cancel
         LET INT_FLAG = 1
         EXIT DIALOG 
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG
   
   END DIALOG
 
   IF NOT INT_FLAG THEN
      LET g_wc_filter = "   AND   ", g_wc_filter, "   "
      LET g_wc = g_wc , g_wc_filter
   ELSE
      LET g_wc_filter = g_wc_filter_t
      LET g_wc = g_wc_t
   END IF
 
      CALL aapt320_filter_show('apcadocno')
   CALL aapt320_filter_show('apcald')
   CALL aapt320_filter_show('apca001')
   CALL aapt320_filter_show('apca003')
   CALL aapt320_filter_show('apca004')
   CALL aapt320_filter_show('apca005')
 
END FUNCTION
 
{</section>}
 
{<section id="aapt320.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION aapt320_filter_parser(ps_field)
   #add-point:filter段define name="filter_parser.define_customerization"
   
   #end add-point    
   DEFINE ps_field   STRING
   DEFINE ls_tmp     STRING
   DEFINE li_tmp     LIKE type_t.num10
   DEFINE li_tmp2    LIKE type_t.num10
   DEFINE ls_var     STRING
   #add-point:filter段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="filter_parser.define"
   
   #end add-point    
   
   #一般條件解析
   LET ls_tmp = ps_field, "='"
   LET li_tmp = g_wc_filter.getIndexOf(ls_tmp,1)
   IF li_tmp > 0 THEN
      LET li_tmp = ls_tmp.getLength() + li_tmp
      LET li_tmp2 = g_wc_filter.getIndexOf("'",li_tmp + 1) - 1
      LET ls_var = g_wc_filter.subString(li_tmp,li_tmp2)
   END IF
 
   #模糊條件解析
   LET ls_tmp = ps_field, " like '"
   LET li_tmp = g_wc_filter.getIndexOf(ls_tmp,1)
   IF li_tmp > 0 THEN
      LET li_tmp = ls_tmp.getLength() + li_tmp
      LET li_tmp2 = g_wc_filter.getIndexOf("'",li_tmp + 1) - 1
      LET ls_var = g_wc_filter.subString(li_tmp,li_tmp2)
      LET ls_var = cl_replace_str(ls_var,'%','*')
   END IF
 
   RETURN ls_var
 
END FUNCTION
 
{</section>}
 
{<section id="aapt320.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION aapt320_filter_show(ps_field)
   DEFINE ps_field         STRING
   DEFINE lnode_item       om.DomNode
   DEFINE ls_title         STRING
   DEFINE ls_name          STRING
   DEFINE ls_condition     STRING
 
   LET ls_name = "formonly.b_", ps_field
   LET lnode_item = gfrm_curr.findNode("TableColumn", ls_name)
   LET ls_title = lnode_item.getAttribute("text")
   IF ls_title.getIndexOf('※',1) > 0 THEN
      LEt ls_title = ls_title.subString(1,ls_title.getIndexOf('※',1)-1)
   END IF
 
   #顯示資料組合
   LET ls_condition = aapt320_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="aapt320.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION aapt320_query()
   #add-point:query段define(客製用) name="query.define_customerization"
   
   #end add-point   
   DEFINE ls_wc STRING
   #add-point:query段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="query.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="query.pre_function"
   
   #end add-point
   
   #切換畫面
   IF g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   END IF   
   
   LET ls_wc = g_wc
   
   LET INT_FLAG = 0
   CALL cl_navigator_setting( g_current_idx, g_detail_cnt )
   ERROR ""
   
   #清除畫面及相關資料
   CLEAR FORM
   CALL g_browser.clear()       
   CALL g_apcb_d.clear()
   CALL g_apcb2_d.clear()
 
   
   #add-point:query段other name="query.other"
   CALL g_apcb3_d.clear() 
   CALL aapt300_08_clear_detail() 
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count
   
   CALL aapt320_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL aapt320_browser_fill("")
      CALL aapt320_fetch("")
      RETURN
   END IF
   
   #儲存WC資訊
   CALL cl_dlg_save_user_latestqry("("||g_wc||") AND ("||g_wc2||")")
   
   #搜尋後資料初始化 
   LET g_detail_cnt  = 0
   LET g_current_idx = 1
   LET g_current_row = 0
   LET g_detail_idx  = 1
   LET g_detail_idx2 = 1
   LET g_detail_idx_list[1] = 1
   LET g_detail_idx_list[2] = 1
 
   LET g_error_show  = 1
   LET g_wc_filter   = ""
   LET l_ac = 1
   CALL FGL_SET_ARR_CURR(1)
      CALL aapt320_filter_show('apcadocno')
   CALL aapt320_filter_show('apcald')
   CALL aapt320_filter_show('apca001')
   CALL aapt320_filter_show('apca003')
   CALL aapt320_filter_show('apca004')
   CALL aapt320_filter_show('apca005')
   CALL aapt320_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL aapt320_fetch("F") 
      #顯示單身筆數
      CALL aapt320_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="aapt320.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION aapt320_fetch(p_flag)
   #add-point:fetch段define(客製用) name="fetch.define_customerization"
   
   #end add-point    
   DEFINE p_flag     LIKE type_t.chr1
   DEFINE ls_msg     STRING
   #add-point:fetch段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="fetch.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="fetch.pre_function"
   
   #end add-point
   
   IF g_browser_cnt = 0 THEN
      RETURN
   END IF
 
   #清空第二階單身
 
   
   CALL cl_ap_performance_next_start()
   CASE p_flag
      WHEN 'F' 
         LET g_current_idx = 1
      WHEN 'L'  
         LET g_current_idx = g_browser.getLength()              
      WHEN 'P'
         IF g_current_idx > 1 THEN               
            LET g_current_idx = g_current_idx - 1
         END IF 
      WHEN 'N'
         IF g_current_idx < g_header_cnt THEN
            LET g_current_idx =  g_current_idx + 1
         END IF        
      WHEN '/'
         IF (NOT g_no_ask) THEN    
            CALL cl_set_act_visible("accept,cancel", TRUE)    
            CALL cl_getmsg('fetch',g_lang) RETURNING ls_msg
            LET INT_FLAG = 0
 
            PROMPT ls_msg CLIPPED,':' FOR g_jump
               #交談指令共用ACTION
               &include "common_action.4gl" 
            END PROMPT
 
            CALL cl_set_act_visible("accept,cancel", FALSE)    
            IF INT_FLAG THEN
                LET INT_FLAG = 0
                EXIT CASE  
            END IF           
         END IF
         
         IF g_jump > 0 AND g_jump <= g_browser.getLength() THEN
             LET g_current_idx = g_jump
         END IF
         LET g_no_ask = FALSE  
   END CASE 
 
   CALL g_curr_diag.setCurrentRow("s_browse", g_current_idx) #設定browse 索引
   
   LET g_current_row = g_current_idx
   LET g_detail_cnt = g_header_cnt                  
   
   #單身總筆數顯示
   IF g_detail_cnt > 0 THEN
      #若單身有資料時, idx至少為1
      IF g_detail_idx <= 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx  
   ELSE
      LET g_detail_idx = 0
      DISPLAY '' TO FORMONLY.idx    
   END IF
   
   #瀏覽頁筆數顯示
   LET g_browser_idx = g_pagestart+g_current_idx-1
   DISPLAY g_browser_idx TO FORMONLY.b_index   #當下筆數
   DISPLAY g_browser_idx TO FORMONLY.h_index   #當下筆數
   
   CALL cl_navigator_setting( g_current_idx, g_browser_cnt )
 
   #代表沒有資料
   IF g_current_idx = 0 OR g_browser.getLength() = 0 THEN
      RETURN
   END IF
   
   #避免超出browser資料筆數上限
   IF g_current_idx > g_browser.getLength() THEN
      LET g_browser_idx = g_browser.getLength()
      LET g_current_idx = g_browser.getLength()
   END IF
   
   LET g_apca_m.apcald = g_browser[g_current_idx].b_apcald
   LET g_apca_m.apcadocno = g_browser[g_current_idx].b_apcadocno
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE aapt320_master_referesh USING g_apca_m.apcald,g_apca_m.apcadocno INTO g_apca_m.apcasite,g_apca_m.apca003, 
       g_apca_m.apcald,g_apca_m.apcacomp,g_apca_m.apcadocno,g_apca_m.apca001,g_apca_m.apcadocdt,g_apca_m.apca004, 
       g_apca_m.apca005,g_apca_m.apca038,g_apca_m.apca006,g_apca_m.apca057,g_apca_m.apcastus,g_apca_m.apca065, 
       g_apca_m.apca066,g_apca_m.apca008,g_apca_m.apca009,g_apca_m.apca010,g_apca_m.apca060,g_apca_m.apca013, 
       g_apca_m.apca012,g_apca_m.apca011,g_apca_m.apca007,g_apca_m.apca036,g_apca_m.apca035,g_apca_m.apca100, 
       g_apca_m.apca103,g_apca_m.apca104,g_apca_m.apca106,g_apca_m.apca108,g_apca_m.apca101,g_apca_m.apca113, 
       g_apca_m.apca114,g_apca_m.apca116,g_apca_m.apca118,g_apca_m.apca039,g_apca_m.apca056,g_apca_m.apca016, 
       g_apca_m.apca055,g_apca_m.apca018,g_apca_m.apca019,g_apca_m.apca014,g_apca_m.apca054,g_apca_m.apca015, 
       g_apca_m.apca034,g_apca_m.apca033,g_apca_m.apca058,g_apca_m.apca059,g_apca_m.apca063,g_apca_m.apca050, 
       g_apca_m.apca052,g_apca_m.apca017,g_apca_m.apca051,g_apca_m.apca053,g_apca_m.apca025,g_apca_m.apca031, 
       g_apca_m.apca030,g_apca_m.apca026,g_apca_m.apca027,g_apca_m.apca028,g_apca_m.apca029,g_apca_m.apca020, 
       g_apca_m.apca021,g_apca_m.apca022,g_apca_m.apca046,g_apca_m.apca047,g_apca_m.apca048,g_apca_m.apca120, 
       g_apca_m.apca121,g_apca_m.apca130,g_apca_m.apca131,g_apca_m.apca123,g_apca_m.apca133,g_apca_m.apca124, 
       g_apca_m.apca134,g_apca_m.apca126,g_apca_m.apca136,g_apca_m.apca128,g_apca_m.apca138,g_apca_m.apcaownid, 
       g_apca_m.apcaowndp,g_apca_m.apcacrtid,g_apca_m.apcacrtdp,g_apca_m.apcacrtdt,g_apca_m.apcamodid, 
       g_apca_m.apcamoddt,g_apca_m.apcacnfid,g_apca_m.apcacnfdt,g_apca_m.apcasite_desc,g_apca_m.apca003_desc, 
       g_apca_m.apcald_desc,g_apca_m.apca004_desc,g_apca_m.apca005_desc,g_apca_m.apca008_desc,g_apca_m.apca007_desc, 
       g_apca_m.apca055_desc,g_apca_m.apca014_desc,g_apca_m.apca054_desc,g_apca_m.apca015_desc,g_apca_m.apca034_desc, 
       g_apca_m.apca033_desc,g_apca_m.apca058_desc,g_apca_m.apca059_desc,g_apca_m.apca030_desc,g_apca_m.apcaownid_desc, 
       g_apca_m.apcaowndp_desc,g_apca_m.apcacrtid_desc,g_apca_m.apcacrtdp_desc,g_apca_m.apcamodid_desc, 
       g_apca_m.apcacnfid_desc
   
   #遮罩相關處理
   LET g_apca_m_mask_o.* =  g_apca_m.*
   CALL aapt320_apca_t_mask()
   LET g_apca_m_mask_n.* =  g_apca_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL aapt320_set_act_visible()   
   CALL aapt320_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
 
   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
   
   #end add-point
   
   #保存單頭舊值
   LET g_apca_m_t.* = g_apca_m.*
   LET g_apca_m_o.* = g_apca_m.*
   
   LET g_data_owner = g_apca_m.apcaownid      
   LET g_data_dept  = g_apca_m.apcaowndp
   
   #重新顯示   
   CALL aapt320_show()
 
   #應用 a56 樣板自動產生(Version:3)
   #檢查此單據是否需顯示BPM簽核狀況按鈕 
   IF cl_bpm_chk() THEN
      CALL cl_set_act_visible("bpm_status",TRUE)
   ELSE
      CALL cl_set_act_visible("bpm_status",FALSE)
   END IF
 
 
 
 
 
END FUNCTION
 
{</section>}
 
{<section id="aapt320.insert" >}
#+ 資料新增
PRIVATE FUNCTION aapt320_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   DEFINE l_pmak006      LIKE pmak_t.pmak006 #170713-00046#1 add
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_apcb_d.clear()   
   CALL g_apcb2_d.clear()  
 
 
   INITIALIZE g_apca_m.* TO NULL             #DEFAULT 設定
   
   LET g_apcald_t = NULL
   LET g_apcadocno_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   CALL g_apcb3_d.clear() 
   CALL aapt300_08_clear_detail() 
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_apca_m.apcaownid = g_user
      LET g_apca_m.apcaowndp = g_dept
      LET g_apca_m.apcacrtid = g_user
      LET g_apca_m.apcacrtdp = g_dept 
      LET g_apca_m.apcacrtdt = cl_get_current()
      LET g_apca_m.apcamodid = g_user
      LET g_apca_m.apcamoddt = cl_get_current()
      LET g_apca_m.apcastus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
            LET g_apca_m.apcastus = "N"
      LET g_apca_m.apca060 = "1"
      LET g_apca_m.apca103 = "0"
      LET g_apca_m.apca104 = "0"
      LET g_apca_m.apca106 = "0"
      LET g_apca_m.apca108 = "0"
      LET g_apca_m.apcc109 = "0"
      LET g_apca_m.net108 = "0"
      LET g_apca_m.apca101 = "0"
      LET g_apca_m.apca113 = "0"
      LET g_apca_m.apca114 = "0"
      LET g_apca_m.apca116 = "0"
      LET g_apca_m.apcc113 = "0"
      LET g_apca_m.apca118 = "0"
      LET g_apca_m.apcc119 = "0"
      LET g_apca_m.net118 = "0"
      LET g_apca_m.apca0501 = "0"
      LET g_apca_m.apca039 = "0"
      LET g_apca_m.apca056 = "0"
      LET g_apca_m.apca050 = "0"
      LET g_apca_m.apca052 = "0"
      LET g_apca_m.apca017 = "0"
      LET g_apca_m.apca025 = "0"
      LET g_apca_m.apca020 = "N"
      LET g_apca_m.apca046 = "N"
      LET g_apca_m.apca1031 = "0"
      LET g_apca_m.apca1041 = "0"
      LET g_apca_m.apca1061 = "0"
      LET g_apca_m.apca1081 = "0"
      LET g_apca_m.apcc1091 = "0"
      LET g_apca_m.net1081 = "0"
      LET g_apca_m.apca1011 = "0"
      LET g_apca_m.apca121 = "0"
      LET g_apca_m.apca131 = "0"
      LET g_apca_m.apca1131 = "0"
      LET g_apca_m.apca123 = "0"
      LET g_apca_m.apca133 = "0"
      LET g_apca_m.apca1141 = "0"
      LET g_apca_m.apca124 = "0"
      LET g_apca_m.apca134 = "0"
      LET g_apca_m.apca1161 = "0"
      LET g_apca_m.apca126 = "0"
      LET g_apca_m.apca136 = "0"
      LET g_apca_m.apcc1131 = "0"
      LET g_apca_m.apcc123 = "0"
      LET g_apca_m.apcc133 = "0"
      LET g_apca_m.apca1181 = "0"
      LET g_apca_m.apca128 = "0"
      LET g_apca_m.apca138 = "0"
      LET g_apca_m.apcc1191 = "0"
      LET g_apca_m.apcc129 = "0"
      LET g_apca_m.apcc139 = "0"
      LET g_apca_m.net1181 = "0"
      LET g_apca_m.net128 = "0"
      LET g_apca_m.net138 = "0"
      LET g_apca_m.apcb103_s = "0"
      LET g_apca_m.apcb104_s = "0"
      LET g_apca_m.apcb105_s = "0"
      LET g_apca_m.apcb113_s = "0"
      LET g_apca_m.apcb114_s = "0"
      LET g_apca_m.apcb115_s = "0"
 
  
      #add-point:單頭預設值 name="insert.default"
      LET g_apca_m.apca003   = g_user        #帳務人員
      LET g_apca_m.apcadocdt = g_today       #帳款日期
      LET g_apca_m.apca017   = 0             #產生方式(0:人員登錄)
      CALL s_desc_get_person_desc(g_apca_m.apca003) RETURNING g_apca_m.apca003_desc

      CALL s_aap_get_default_apcasite('1','','') RETURNING g_sub_success,g_errno,g_apca_m.apcasite,g_apca_m.apcald,g_apca_m.apcacomp
      CALL s_desc_get_department_desc(g_apca_m.apcasite) RETURNING g_apca_m.apcasite_desc
      CALL s_fin_get_wc_str(g_apca_m.apcacomp) RETURNING g_comp_str  #161229-00047#43 add 
      CALL s_control_get_supplier_sql_pmab('4',g_site,g_user,g_dept,'',g_comp_str) RETURNING g_sub_success,g_sql_ctrl         #161229-00047#43 add 
      #CALL s_control_get_supplier_sql_pmab('4',g_site,g_user,g_dept,'',g_apca_m.apcacomp) RETURNING g_sub_success,g_sql_ctrl #161111-00042#2 add   #161229-00047#43 mark
   
      #設定帳別相關預設值
      IF NOT cl_null(g_apca_m.apcald) THEN
         CALL s_desc_get_ld_desc(g_apca_m.apcald)  RETURNING g_apca_m.apcald_desc
         CALL aapt320_set_ld_info(g_apca_m.apcald,'')
      END IF
      DISPLAY BY NAME g_apca_m.apcasite,g_apca_m.apcasite_desc,g_apca_m.apcald  ,g_apca_m.apcald_desc,
                      g_apca_m.apca003 ,g_apca_m.apca003_desc,g_apca_m.apca017 ,g_apca_m.apcadocdt,
                      g_apca_m.apca136
      LET g_apca_m_t.*  = g_apca_m.*    #設定預設值後
      LET g_apca_m_o.* = g_apca_m.*    #舊值備份
      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_apca_m_t.* = g_apca_m.*
      LET g_apca_m_o.* = g_apca_m.*
      
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_apca_m.apcastus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
    
      CALL aapt320_input("a")
      
      #add-point:單頭輸入後 name="insert.after_insert"
      #170713-00046#1 add(s)
      IF INT_FLAG THEN
         IF NOT cl_null(g_apca_m.apca057) THEN
            SELECT pmak006 INTO l_pmak006 FROM pmak_t WHERE pmakent = g_enterprise AND pmak001 = g_apca_m.apca057
            IF l_pmak006 = g_apcadocno THEN
               DELETE FROM pmak_t
                WHERE pmakent = g_enterprise 
                  AND pmak001 = g_apca_m.apca057
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = ''
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = FALSE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  RETURN
               END IF   
            END IF
         END IF
      END IF
      #170713-00046#1 add(e)
      #end add-point
      
      IF INT_FLAG THEN
         LET INT_FLAG = 0
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
      END IF
      
      IF NOT g_master_insert THEN
         DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
         DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
         INITIALIZE g_apca_m.* TO NULL
         INITIALIZE g_apcb_d TO NULL
         INITIALIZE g_apcb2_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL aapt320_show()
         CALL aapt320_idx_chk()   #(ver:83)
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_apcb_d.clear()
      #CALL g_apcb2_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL aapt320_set_act_visible()   
   CALL aapt320_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_apcald_t = g_apca_m.apcald
   LET g_apcadocno_t = g_apca_m.apcadocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " apcaent = " ||g_enterprise|| " AND",
                      " apcald = '", g_apca_m.apcald, "' "
                      ," AND apcadocno = '", g_apca_m.apcadocno, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   
   #end add-point
      
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL aapt320_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE aapt320_cl
   
   CALL aapt320_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE aapt320_master_referesh USING g_apca_m.apcald,g_apca_m.apcadocno INTO g_apca_m.apcasite,g_apca_m.apca003, 
       g_apca_m.apcald,g_apca_m.apcacomp,g_apca_m.apcadocno,g_apca_m.apca001,g_apca_m.apcadocdt,g_apca_m.apca004, 
       g_apca_m.apca005,g_apca_m.apca038,g_apca_m.apca006,g_apca_m.apca057,g_apca_m.apcastus,g_apca_m.apca065, 
       g_apca_m.apca066,g_apca_m.apca008,g_apca_m.apca009,g_apca_m.apca010,g_apca_m.apca060,g_apca_m.apca013, 
       g_apca_m.apca012,g_apca_m.apca011,g_apca_m.apca007,g_apca_m.apca036,g_apca_m.apca035,g_apca_m.apca100, 
       g_apca_m.apca103,g_apca_m.apca104,g_apca_m.apca106,g_apca_m.apca108,g_apca_m.apca101,g_apca_m.apca113, 
       g_apca_m.apca114,g_apca_m.apca116,g_apca_m.apca118,g_apca_m.apca039,g_apca_m.apca056,g_apca_m.apca016, 
       g_apca_m.apca055,g_apca_m.apca018,g_apca_m.apca019,g_apca_m.apca014,g_apca_m.apca054,g_apca_m.apca015, 
       g_apca_m.apca034,g_apca_m.apca033,g_apca_m.apca058,g_apca_m.apca059,g_apca_m.apca063,g_apca_m.apca050, 
       g_apca_m.apca052,g_apca_m.apca017,g_apca_m.apca051,g_apca_m.apca053,g_apca_m.apca025,g_apca_m.apca031, 
       g_apca_m.apca030,g_apca_m.apca026,g_apca_m.apca027,g_apca_m.apca028,g_apca_m.apca029,g_apca_m.apca020, 
       g_apca_m.apca021,g_apca_m.apca022,g_apca_m.apca046,g_apca_m.apca047,g_apca_m.apca048,g_apca_m.apca120, 
       g_apca_m.apca121,g_apca_m.apca130,g_apca_m.apca131,g_apca_m.apca123,g_apca_m.apca133,g_apca_m.apca124, 
       g_apca_m.apca134,g_apca_m.apca126,g_apca_m.apca136,g_apca_m.apca128,g_apca_m.apca138,g_apca_m.apcaownid, 
       g_apca_m.apcaowndp,g_apca_m.apcacrtid,g_apca_m.apcacrtdp,g_apca_m.apcacrtdt,g_apca_m.apcamodid, 
       g_apca_m.apcamoddt,g_apca_m.apcacnfid,g_apca_m.apcacnfdt,g_apca_m.apcasite_desc,g_apca_m.apca003_desc, 
       g_apca_m.apcald_desc,g_apca_m.apca004_desc,g_apca_m.apca005_desc,g_apca_m.apca008_desc,g_apca_m.apca007_desc, 
       g_apca_m.apca055_desc,g_apca_m.apca014_desc,g_apca_m.apca054_desc,g_apca_m.apca015_desc,g_apca_m.apca034_desc, 
       g_apca_m.apca033_desc,g_apca_m.apca058_desc,g_apca_m.apca059_desc,g_apca_m.apca030_desc,g_apca_m.apcaownid_desc, 
       g_apca_m.apcaowndp_desc,g_apca_m.apcacrtid_desc,g_apca_m.apcacrtdp_desc,g_apca_m.apcamodid_desc, 
       g_apca_m.apcacnfid_desc
   
   
   #遮罩相關處理
   LET g_apca_m_mask_o.* =  g_apca_m.*
   CALL aapt320_apca_t_mask()
   LET g_apca_m_mask_n.* =  g_apca_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_apca_m.apcasite,g_apca_m.apcasite_desc,g_apca_m.apca003,g_apca_m.apca003_desc,g_apca_m.apcald, 
       g_apca_m.apcald_desc,g_apca_m.apcacomp,g_apca_m.apcacomp_desc,g_apca_m.apcadocno,g_apca_m.apca001, 
       g_apca_m.apcadocno_desc,g_apca_m.apcadocdt,g_apca_m.apca004,g_apca_m.apca004_desc,g_apca_m.apca005, 
       g_apca_m.apca005_desc,g_apca_m.apca038,g_apca_m.apca006,g_apca_m.apca057,g_apca_m.apcastus,g_apca_m.apca065, 
       g_apca_m.apca066,g_apca_m.apca008,g_apca_m.apca008_desc,g_apca_m.apca009,g_apca_m.apca010,g_apca_m.apca060, 
       g_apca_m.apca013,g_apca_m.apca012,g_apca_m.apca011,g_apca_m.apca011_desc,g_apca_m.apca007,g_apca_m.apca007_desc, 
       g_apca_m.apca036,g_apca_m.apca036_desc,g_apca_m.apca035,g_apca_m.apca035_desc,g_apca_m.apca100, 
       g_apca_m.apca103,g_apca_m.apca104,g_apca_m.apca106,g_apca_m.fflabel_1,g_apca_m.apca108,g_apca_m.apcc109, 
       g_apca_m.net108,g_apca_m.glaa001,g_apca_m.apca101,g_apca_m.apca113,g_apca_m.apca114,g_apca_m.apca116, 
       g_apca_m.apcc113,g_apca_m.apca118,g_apca_m.apcc119,g_apca_m.net118,g_apca_m.apca0501,g_apca_m.apca039, 
       g_apca_m.apca056,g_apca_m.apca016,g_apca_m.apca055,g_apca_m.apca055_desc,g_apca_m.apca018,g_apca_m.apca019, 
       g_apca_m.apca014,g_apca_m.apca014_desc,g_apca_m.apca054,g_apca_m.apca054_desc,g_apca_m.apca015, 
       g_apca_m.apca015_desc,g_apca_m.apca034,g_apca_m.apca034_desc,g_apca_m.apca033,g_apca_m.apca033_desc, 
       g_apca_m.apca058,g_apca_m.apca058_desc,g_apca_m.apca059,g_apca_m.apca059_desc,g_apca_m.apca063, 
       g_apca_m.apca050,g_apca_m.apca052,g_apca_m.apca017,g_apca_m.partition2,g_apca_m.apca051,g_apca_m.apca051_desc, 
       g_apca_m.apca053,g_apca_m.apca025,g_apca_m.apca031,g_apca_m.apca030,g_apca_m.apca030_desc,g_apca_m.partition3, 
       g_apca_m.apca026,g_apca_m.apca027,g_apca_m.apca028,g_apca_m.apca029,g_apca_m.apca020,g_apca_m.apca021, 
       g_apca_m.apca022,g_apca_m.apca046,g_apca_m.apca0181,g_apca_m.apca047,g_apca_m.apca048,g_apca_m.apca1001, 
       g_apca_m.apca1031,g_apca_m.apca1041,g_apca_m.apca1061,g_apca_m.fflabel_2,g_apca_m.apca1081,g_apca_m.apcc1091, 
       g_apca_m.net1081,g_apca_m.glaa0011,g_apca_m.apca1011,g_apca_m.apca120,g_apca_m.apca121,g_apca_m.apca130, 
       g_apca_m.apca131,g_apca_m.apca1131,g_apca_m.apca123,g_apca_m.apca133,g_apca_m.apca1141,g_apca_m.apca124, 
       g_apca_m.apca134,g_apca_m.apca1161,g_apca_m.apca126,g_apca_m.apca136,g_apca_m.apcc1131,g_apca_m.apcc123, 
       g_apca_m.apcc133,g_apca_m.apca1181,g_apca_m.apca128,g_apca_m.apca138,g_apca_m.apcc1191,g_apca_m.apcc129, 
       g_apca_m.apcc139,g_apca_m.net1181,g_apca_m.net128,g_apca_m.net138,g_apca_m.apcaownid,g_apca_m.apcaownid_desc, 
       g_apca_m.apcaowndp,g_apca_m.apcaowndp_desc,g_apca_m.apcacrtid,g_apca_m.apcacrtid_desc,g_apca_m.apcacrtdp, 
       g_apca_m.apcacrtdp_desc,g_apca_m.apcacrtdt,g_apca_m.apcamodid,g_apca_m.apcamodid_desc,g_apca_m.apcamoddt, 
       g_apca_m.apcacnfid,g_apca_m.apcacnfid_desc,g_apca_m.apcacnfdt,g_apca_m.apcb103_s,g_apca_m.apcb104_s, 
       g_apca_m.apcb105_s,g_apca_m.apcb113_s,g_apca_m.apcb114_s,g_apca_m.apcb115_s
   
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
   
   LET g_data_owner = g_apca_m.apcaownid      
   LET g_data_dept  = g_apca_m.apcaowndp
   
   #功能已完成,通報訊息中心
   CALL aapt320_msgcentre_notify('insert')
   
   CALL aapt320_idx_chk()   #(ver:83)
   
END FUNCTION
 
{</section>}
 
{<section id="aapt320.modify" >}
#+ 資料修改
PRIVATE FUNCTION aapt320_modify()
   #add-point:modify段define(客製用) name="modify.define_customerization"
   
   #end add-point    
   DEFINE l_new_key    DYNAMIC ARRAY OF STRING
   DEFINE l_old_key    DYNAMIC ARRAY OF STRING
   DEFINE l_field_key  DYNAMIC ARRAY OF STRING
   DEFINE l_wc2_table1          STRING
   DEFINE l_wc2_table2   STRING
 
 
 
   #add-point:modify段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="modify.pre_function"
   
   #end add-point
   
   #保存單頭舊值
   LET g_apca_m_t.* = g_apca_m.*
   LET g_apca_m_o.* = g_apca_m.*
   
   IF g_apca_m.apcald IS NULL
   OR g_apca_m.apcadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_apcald_t = g_apca_m.apcald
   LET g_apcadocno_t = g_apca_m.apcadocno
 
   CALL s_transaction_begin()
   
   OPEN aapt320_cl USING g_enterprise,g_apca_m.apcald,g_apca_m.apcadocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN aapt320_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE aapt320_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE aapt320_master_referesh USING g_apca_m.apcald,g_apca_m.apcadocno INTO g_apca_m.apcasite,g_apca_m.apca003, 
       g_apca_m.apcald,g_apca_m.apcacomp,g_apca_m.apcadocno,g_apca_m.apca001,g_apca_m.apcadocdt,g_apca_m.apca004, 
       g_apca_m.apca005,g_apca_m.apca038,g_apca_m.apca006,g_apca_m.apca057,g_apca_m.apcastus,g_apca_m.apca065, 
       g_apca_m.apca066,g_apca_m.apca008,g_apca_m.apca009,g_apca_m.apca010,g_apca_m.apca060,g_apca_m.apca013, 
       g_apca_m.apca012,g_apca_m.apca011,g_apca_m.apca007,g_apca_m.apca036,g_apca_m.apca035,g_apca_m.apca100, 
       g_apca_m.apca103,g_apca_m.apca104,g_apca_m.apca106,g_apca_m.apca108,g_apca_m.apca101,g_apca_m.apca113, 
       g_apca_m.apca114,g_apca_m.apca116,g_apca_m.apca118,g_apca_m.apca039,g_apca_m.apca056,g_apca_m.apca016, 
       g_apca_m.apca055,g_apca_m.apca018,g_apca_m.apca019,g_apca_m.apca014,g_apca_m.apca054,g_apca_m.apca015, 
       g_apca_m.apca034,g_apca_m.apca033,g_apca_m.apca058,g_apca_m.apca059,g_apca_m.apca063,g_apca_m.apca050, 
       g_apca_m.apca052,g_apca_m.apca017,g_apca_m.apca051,g_apca_m.apca053,g_apca_m.apca025,g_apca_m.apca031, 
       g_apca_m.apca030,g_apca_m.apca026,g_apca_m.apca027,g_apca_m.apca028,g_apca_m.apca029,g_apca_m.apca020, 
       g_apca_m.apca021,g_apca_m.apca022,g_apca_m.apca046,g_apca_m.apca047,g_apca_m.apca048,g_apca_m.apca120, 
       g_apca_m.apca121,g_apca_m.apca130,g_apca_m.apca131,g_apca_m.apca123,g_apca_m.apca133,g_apca_m.apca124, 
       g_apca_m.apca134,g_apca_m.apca126,g_apca_m.apca136,g_apca_m.apca128,g_apca_m.apca138,g_apca_m.apcaownid, 
       g_apca_m.apcaowndp,g_apca_m.apcacrtid,g_apca_m.apcacrtdp,g_apca_m.apcacrtdt,g_apca_m.apcamodid, 
       g_apca_m.apcamoddt,g_apca_m.apcacnfid,g_apca_m.apcacnfdt,g_apca_m.apcasite_desc,g_apca_m.apca003_desc, 
       g_apca_m.apcald_desc,g_apca_m.apca004_desc,g_apca_m.apca005_desc,g_apca_m.apca008_desc,g_apca_m.apca007_desc, 
       g_apca_m.apca055_desc,g_apca_m.apca014_desc,g_apca_m.apca054_desc,g_apca_m.apca015_desc,g_apca_m.apca034_desc, 
       g_apca_m.apca033_desc,g_apca_m.apca058_desc,g_apca_m.apca059_desc,g_apca_m.apca030_desc,g_apca_m.apcaownid_desc, 
       g_apca_m.apcaowndp_desc,g_apca_m.apcacrtid_desc,g_apca_m.apcacrtdp_desc,g_apca_m.apcamodid_desc, 
       g_apca_m.apcacnfid_desc
   
   #檢查是否允許此動作
   IF NOT aapt320_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_apca_m_mask_o.* =  g_apca_m.*
   CALL aapt320_apca_t_mask()
   LET g_apca_m_mask_n.* =  g_apca_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   CALL s_fin_account_center_sons_query('3',g_apca_m.apcasite,g_apca_m.apcadocdt,'1')
   CALL s_fin_account_center_sons_str() RETURNING g_wc_apcasite
   CALL s_fin_get_wc_str(g_wc_apcasite) RETURNING g_wc_apcasite  
   CALL s_fin_account_center_ld_str() RETURNING g_wc_apcald
   CALL s_fin_get_wc_str(g_wc_apcald) RETURNING g_wc_apcald  
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
   #LET l_wc2_table2 = g_wc2_table2
   #LET l_wc2_table2 = " 1=1"
 
 
 
   
   CALL aapt320_show()
   #add-point:modify段show之後 name="modify.after_show"
   #150311--add--str--
   IF g_apca_m.apcastus <> 'N' THEN 
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'agl-00313'
      LET g_errparam.extend = g_apca_m.apcastus
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN
   END IF
   #150311--add--end--
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
   #LET  g_wc2_table2 = l_wc2_table2 
 
 
 
    
   WHILE TRUE
      LET g_apcald_t = g_apca_m.apcald
      LET g_apcadocno_t = g_apca_m.apcadocno
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_apca_m.apcamodid = g_user 
LET g_apca_m.apcamoddt = cl_get_current()
LET g_apca_m.apcamodid_desc = cl_get_username(g_apca_m.apcamodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      LET g_apca_m_o.* = g_apca_m.*  #舊值備份     
     #「D抽單 / R已拒絕」狀況碼更改資料後，需還原為「N未確認」
      IF g_apca_m.apcastus MATCHES "[DR]" THEN 
         LET g_apca_m.apcastus = "N"
      END IF

      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL aapt320_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE apca_t SET (apcamodid,apcamoddt) = (g_apca_m.apcamodid,g_apca_m.apcamoddt)
          WHERE apcaent = g_enterprise AND apcald = g_apcald_t
            AND apcadocno = g_apcadocno_t
 
      END IF
    
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_apca_m.* = g_apca_m_t.*
         #  CALL aapt320_show()   #(ver:83)
         END IF
         CALL aapt320_show()   #(ver:83)
         CALL aapt320_idx_chk()   #(ver:83)
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_apca_m.apcald != g_apca_m_t.apcald
      OR g_apca_m.apcadocno != g_apca_m_t.apcadocno
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
         
         #end add-point
         
         #更新單身key值
         UPDATE apcb_t SET apcbld = g_apca_m.apcald
                                       ,apcbdocno = g_apca_m.apcadocno
 
          WHERE apcbent = g_enterprise AND apcbld = g_apca_m_t.apcald
            AND apcbdocno = g_apca_m_t.apcadocno
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
         
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "apcb_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "apcb_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CONTINUE WHILE
         END CASE
         
         #add-point:單身fk修改後 name="modify.body.a_fk_update"
         
         #end add-point
         
         #更新單身key值
         #add-point:單身fk修改前 name="modify.body.b_fk_update2"
         
         #end add-point
         
         UPDATE xrcd_t
            SET xrcdld = g_apca_m.apcald
               ,xrcddocno = g_apca_m.apcadocno
 
          WHERE xrcdent = g_enterprise AND
                xrcdld = g_apcald_t
            AND xrcddocno = g_apcadocno_t
 
         #add-point:單身fk修改中 name="modify.body.m_fk_update2"
         
         #end add-point
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "xrcd_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "xrcd_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CONTINUE WHILE
         END CASE
         #add-point:單身fk修改後 name="modify.body.a_fk_update2"
         
         #end add-point
 
 
         
 
         
         #UPDATE 多語言table key值
         
            #161130-00056 add
         
            #161130-00056 add
 
         CALL s_transaction_end('Y','0')
      END IF
    
      EXIT WHILE
   END WHILE
 
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL aapt320_set_act_visible()   
   CALL aapt320_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " apcaent = " ||g_enterprise|| " AND",
                      " apcald = '", g_apca_m.apcald, "' "
                      ," AND apcadocno = '", g_apca_m.apcadocno, "' "
 
   #填到對應位置
   CALL aapt320_browser_fill("")
 
   CLOSE aapt320_cl
   
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL aapt320_msgcentre_notify('modify')
   
   CALL aapt320_idx_chk() #ver:83
 
END FUNCTION 
 
{</section>}
 
{<section id="aapt320.input" >}
#+ 資料輸入
PRIVATE FUNCTION aapt320_input(p_cmd)
   #add-point:input段define(客製用) name="input.define_customerization"
   
   #end add-point  
   DEFINE  p_cmd                 LIKE type_t.chr1
   DEFINE  l_cmd_t               LIKE type_t.chr1
   DEFINE  l_cmd                 LIKE type_t.chr1
   DEFINE  l_n                   LIKE type_t.num10                #檢查重複用  
   DEFINE  l_cnt                 LIKE type_t.num10                #檢查重複用  
   DEFINE  l_lock_sw             LIKE type_t.chr1                #單身鎖住否  
   DEFINE  l_allow_insert        LIKE type_t.num5                #可新增否 
   DEFINE  l_allow_delete        LIKE type_t.num5                #可刪除否  
   DEFINE  l_count               LIKE type_t.num10
   DEFINE  l_i                   LIKE type_t.num10
   DEFINE  l_ac_t                LIKE type_t.num10
   DEFINE  l_insert              BOOLEAN
   DEFINE  ls_return             STRING
   DEFINE  l_var_keys            DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys          DYNAMIC ARRAY OF STRING
   DEFINE  l_vars                DYNAMIC ARRAY OF STRING
   DEFINE  l_fields              DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak        DYNAMIC ARRAY OF STRING
   DEFINE  lb_reproduce          BOOLEAN
   DEFINE  li_reproduce          LIKE type_t.num10
   DEFINE  li_reproduce_target   LIKE type_t.num10
   DEFINE  ls_keys               DYNAMIC ARRAY OF VARCHAR(500)
   #add-point:input段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="input.define"

   DEFINE  l_diff                LIKE apcb_t.apcb113  #差異數
   DEFINE  l_oodb004             LIKE oodb_t.oodb004  #稅別名稱
   DEFINE  l_oodb005             LIKE oodb_t.oodb005  #含稅否
   DEFINE  l_oodb006             LIKE oodb_t.oodb006  #稅率
   DEFINE  l_oodb011             LIKE oodb_t.oodb011  #稅別應用(1.正常稅率 2.依料件設定)
   DEFINE  l_apcb105             LIKE apcb_t.apcb105
   DEFINE  l_success             LIKE type_t.num5
   DEFINE  l_using               LIKE type_t.num5
   DEFINE  l_apcb007_max         LIKE apcb_t.apcb007          #實際 可立帳數量:若單身為修改時，需將apcb_t.apcb007的值加回來
   DEFINE  l_source              DYNAMIC ARRAY OF RECORD      #單身其他信息
                 chr             LIKE type_t.chr500,
                 dat             LIKE type_t.dat
                             END RECORD
   DEFINE  l_sql                 STRING
   DEFINE  l_str                 STRING
   DEFINE  l_amount              RECORD
                 apcb103         LIKE apcb_t.apcb103,
                 apcb113         LIKE apcb_t.apcb113,
                 apcb123         LIKE apcb_t.apcb123,
                 apcb133         LIKE apcb_t.apcb133,
                 xrcd104         LIKE xrcd_t.xrcd104,
                 xrcd114         LIKE xrcd_t.xrcd114,
                 xrcd124         LIKE xrcd_t.xrcd124,
                 xrcd134         LIKE xrcd_t.xrcd134,
                 apca106         LIKE apca_t.apca106,
                 apca116         LIKE apca_t.apca116,
                 apca126         LIKE apca_t.apca126,
                 apca136         LIKE apca_t.apca136,
                 apca107         LIKE apca_t.apca107,
                 apca117         LIKE apca_t.apca117,
                 apca127         LIKE apca_t.apca127,
                 apca137         LIKE apca_t.apca137,
                 apca108         LIKE apca_t.apca108,
                 apca118         LIKE apca_t.apca118,
                 apca128         LIKE apca_t.apca128,
                 apca138         LIKE apca_t.apca138
                             END RECORD
   DEFINE l_apcb1                RECORD
                 apcbseq         LIKE apcb_t.apcbseq,
                 apcborga        LIKE apcb_t.apcborga,
                 apcb020         LIKE apcb_t.apcb020,
                 apcb007         LIKE apcb_t.apcb007,
                 apcb101         LIKE apcb_t.apcb101,
                 apcb111         LIKE apcb_t.apcb111,
                 apcb103         LIKE apcb_t.apcb103,
                 apcb104         LIKE apcb_t.apcb104,
                 apcb105         LIKE apcb_t.apcb105,
                 apcb113         LIKE apcb_t.apcb113,
                 apcb114         LIKE apcb_t.apcb114,
                 apcb115         LIKE apcb_t.apcb115,
                 apcb123         LIKE apcb_t.apcb123,
                 apcb124         LIKE apcb_t.apcb124,
                 apcb125         LIKE apcb_t.apcb125,
                 apcb133         LIKE apcb_t.apcb133,
                 apcb134         LIKE apcb_t.apcb134,
                 apcb135         LIKE apcb_t.apcb135,
                 apcb049         LIKE apcb_t.apcb049
                             END RECORD
   DEFINE l_dt                   LIKE apca_t.apcadocdt
   DEFINE l_apcb103              LIKE apcb_t.apcb103
   #albireo 141106 ------------------------------s
   DEFINE l_redo_apca101         LIKE type_t.chr1      #有變動是否做匯率重算
   DEFINE l_redo_apca011         LIKE type_t.chr1      #有變動是否做匯率重算
   #albireo 141106 ------------------------------e
   DEFINE l_xrcd009              LIKE xrcd_t.xrcd009
   DEFINE l_wc_ar                DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE l_oofg_return          DYNAMIC ARRAY OF RECORD
                   oofg019       LIKE oofg_t.oofg019,   #field
                   oofg020       LIKE oofg_t.oofg020    #value
                             END RECORD
   DEFINE ls_js         STRING
   DEFINE lc_param      RECORD
            apca004     LIKE apca_t.apca004,
            ooib001     LIKE ooib_t.ooib001        #160127-00017#1
                    END RECORD
   DEFINE l_apcbseq    LIKE apcb_t.apcbseq
   DEFINE  l_cn                 LIKE type_t.num10 #151125-00006#2
   DEFINE l_glaa004              LIKE  glaa_t.glaa004 
   DEFINE l_pmdt016              LIKE pmdt_t.pmdt016  #160120-00011#2
   DEFINE l_apcb021_upd          LIKE type_t.chr1  #費用會計科目 #160128-00012#1 
   DEFINE l_apcb029_upd          LIKE type_t.chr1  #應付帳款科目 #160128-00012#1  
   DEFINE l_apcb106     LIKE apcb_t.apcb106  #160107-00001#1
   DEFINE l_apcb116     LIKE apcb_t.apcb116  #160107-00001#1
   DEFINE l_apcb126     LIKE apcb_t.apcb126  #160107-00001#1
   DEFINE l_apcb136     LIKE apcb_t.apcb136  #160107-00001#1   
   DEFINE l_oodb008     LIKE oodb_t.oodb008  #160511-00026#1
   #160616-00005#2--add--str--
   DEFINE l_sum             RECORD
          apcb103           LIKE apcb_t.apcb103,
          apcb104           LIKE apcb_t.apcb104,
          apcb105           LIKE apcb_t.apcb105,
          apcb113           LIKE apcb_t.apcb113,
          apcb114           LIKE apcb_t.apcb114,
          apcb115           LIKE apcb_t.apcb115
          END RECORD
   #160616-00005#2--add--end
   #160902-00034#1---s---
   DEFINE l_bgaa008         LIKE bgaa_t.bgaa008    #預算參照表
   DEFINE l_apcb017         LIKE apcb_t.apcb017
   DEFINE l_tran    RECORD
             docno        LIKE apcb_t.apcbdocno,
             ld           LIKE apcb_t.apcbld,
             docdt        LIKE apca_t.apcadocdt,
             comp         LIKE apca_t.apcacomp,
             seq          LIKE apcb_t.apcbseq,  
             bgbd007      LIKE bgbd_t.bgbd007,     
             bgbd037      LIKE bgbd_t.bgbd037,
             bgbd038      LIKE bgbd_t.bgbd038,
             bgbd040      LIKE bgbd_t.bgbd040,     
             bgbd007_t    LIKE bgbd_t.bgbd007,    #修改前的預算細項
             bgbd037_t    LIKE bgbd_t.bgbd037,    #修改前的單號
             bgbd038_t    LIKE bgbd_t.bgbd038,    #修改前的項次
             bgbd040_t    LIKE bgbd_t.bgbd040,    #修改前被占用的金額
             act          LIKE type_t.chr10     
   END RECORD
   DEFINE l_ls_js   STRING
   #160902-00034#1---e---
   DEFINE l_comp_wc              STRING  #161014-00053#3 add
   DEFINE l_apcb004_comp         LIKE glaa_t.glaacomp  #161111-00042#2 add
   DEFINE l_pmaa004              LIKE pmaa_t.pmaa004   #160802-00007#2
   DEFINE l_flag                 LIKE type_t.num5      #161104-00046#19 add
   DEFINE l_item          DYNAMIC ARRAY OF VARCHAR(100) #170512-00045#10 add
   #end add-point  
   
   #add-point:Function前置處理  name="input.pre_function"
   
   #end add-point
   
   #先做狀態判定
   IF p_cmd = 'r' THEN
      LET l_cmd_t = 'r'
      LET p_cmd   = 'a'
   ELSE
      LET l_cmd_t = p_cmd
   END IF   
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_apca_m.apcasite,g_apca_m.apcasite_desc,g_apca_m.apca003,g_apca_m.apca003_desc,g_apca_m.apcald, 
       g_apca_m.apcald_desc,g_apca_m.apcacomp,g_apca_m.apcacomp_desc,g_apca_m.apcadocno,g_apca_m.apca001, 
       g_apca_m.apcadocno_desc,g_apca_m.apcadocdt,g_apca_m.apca004,g_apca_m.apca004_desc,g_apca_m.apca005, 
       g_apca_m.apca005_desc,g_apca_m.apca038,g_apca_m.apca006,g_apca_m.apca057,g_apca_m.apcastus,g_apca_m.apca065, 
       g_apca_m.apca066,g_apca_m.apca008,g_apca_m.apca008_desc,g_apca_m.apca009,g_apca_m.apca010,g_apca_m.apca060, 
       g_apca_m.apca013,g_apca_m.apca012,g_apca_m.apca011,g_apca_m.apca011_desc,g_apca_m.apca007,g_apca_m.apca007_desc, 
       g_apca_m.apca036,g_apca_m.apca036_desc,g_apca_m.apca035,g_apca_m.apca035_desc,g_apca_m.apca100, 
       g_apca_m.apca103,g_apca_m.apca104,g_apca_m.apca106,g_apca_m.fflabel_1,g_apca_m.apca108,g_apca_m.apcc109, 
       g_apca_m.net108,g_apca_m.glaa001,g_apca_m.apca101,g_apca_m.apca113,g_apca_m.apca114,g_apca_m.apca116, 
       g_apca_m.apcc113,g_apca_m.apca118,g_apca_m.apcc119,g_apca_m.net118,g_apca_m.apca0501,g_apca_m.apca039, 
       g_apca_m.apca056,g_apca_m.apca016,g_apca_m.apca055,g_apca_m.apca055_desc,g_apca_m.apca018,g_apca_m.apca019, 
       g_apca_m.apca014,g_apca_m.apca014_desc,g_apca_m.apca054,g_apca_m.apca054_desc,g_apca_m.apca015, 
       g_apca_m.apca015_desc,g_apca_m.apca034,g_apca_m.apca034_desc,g_apca_m.apca033,g_apca_m.apca033_desc, 
       g_apca_m.apca058,g_apca_m.apca058_desc,g_apca_m.apca059,g_apca_m.apca059_desc,g_apca_m.apca063, 
       g_apca_m.apca050,g_apca_m.apca052,g_apca_m.apca017,g_apca_m.partition2,g_apca_m.apca051,g_apca_m.apca051_desc, 
       g_apca_m.apca053,g_apca_m.apca025,g_apca_m.apca031,g_apca_m.apca030,g_apca_m.apca030_desc,g_apca_m.partition3, 
       g_apca_m.apca026,g_apca_m.apca027,g_apca_m.apca028,g_apca_m.apca029,g_apca_m.apca020,g_apca_m.apca021, 
       g_apca_m.apca022,g_apca_m.apca046,g_apca_m.apca0181,g_apca_m.apca047,g_apca_m.apca048,g_apca_m.apca1001, 
       g_apca_m.apca1031,g_apca_m.apca1041,g_apca_m.apca1061,g_apca_m.fflabel_2,g_apca_m.apca1081,g_apca_m.apcc1091, 
       g_apca_m.net1081,g_apca_m.glaa0011,g_apca_m.apca1011,g_apca_m.apca120,g_apca_m.apca121,g_apca_m.apca130, 
       g_apca_m.apca131,g_apca_m.apca1131,g_apca_m.apca123,g_apca_m.apca133,g_apca_m.apca1141,g_apca_m.apca124, 
       g_apca_m.apca134,g_apca_m.apca1161,g_apca_m.apca126,g_apca_m.apca136,g_apca_m.apcc1131,g_apca_m.apcc123, 
       g_apca_m.apcc133,g_apca_m.apca1181,g_apca_m.apca128,g_apca_m.apca138,g_apca_m.apcc1191,g_apca_m.apcc129, 
       g_apca_m.apcc139,g_apca_m.net1181,g_apca_m.net128,g_apca_m.net138,g_apca_m.apcaownid,g_apca_m.apcaownid_desc, 
       g_apca_m.apcaowndp,g_apca_m.apcaowndp_desc,g_apca_m.apcacrtid,g_apca_m.apcacrtid_desc,g_apca_m.apcacrtdp, 
       g_apca_m.apcacrtdp_desc,g_apca_m.apcacrtdt,g_apca_m.apcamodid,g_apca_m.apcamodid_desc,g_apca_m.apcamoddt, 
       g_apca_m.apcacnfid,g_apca_m.apcacnfid_desc,g_apca_m.apcacnfdt,g_apca_m.apcb103_s,g_apca_m.apcb104_s, 
       g_apca_m.apcb105_s,g_apca_m.apcb113_s,g_apca_m.apcb114_s,g_apca_m.apcb115_s
   
   #ver:82
   #清空單身條件
   LET g_wc2 = " 1=1"
   LET g_wc2_table1 = " 1=1 "
   LET g_wc2_table2 = " 1=1 "
 
 
   #CALL aapt320_b_fill()
   #ver:82
   
   #切換畫面
   IF g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   END IF
 
   CALL cl_set_head_visible("","YES")  
 
   LET l_insert = FALSE
   LET g_action_choice = ""
 
   #add-point:input段define_sql name="input.define_sql"
   LET g_forupd_sql = "SELECT apcbseq,apcb002,apcb003,apcb004,apcb005,",
                      "       apcb103,        apcb105,",
                      "       apcb113,apcb114,apcb115,",
                      "       apcb123,apcb124,apcb125,",
                      "       apcb133,apcb134,apcb135,",
                      "       apcborga,apcb020",
                      "  FROM apcb_t ",
                      " WHERE apcbent=? AND apcbld=? AND apcbdocno=? AND apcbseq=? FOR UPDATE"
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   DECLARE aapt320_bcl3 CURSOR FROM g_forupd_sql 
   #end add-point 
   LET g_forupd_sql = "SELECT apcbseq,apcb001,apcborga,apcb002,apcb003,apcb023,apcb004,apcb005,apcb030, 
       apcb020,apcb006,apcb022,apcb007,apcb101,apcb103,apcb104,apcb105,apcb111,apcb113,apcb114,apcb115, 
       apcb028,apcb049,apcb048,apcb008,apcb009,apcb010,apcb047,apcb021,apcb029,apcb017,apcb100,apcb123, 
       apcb124,apcb125,apcb133,apcb134,apcb135,apcblegl,apcb011,apcb012,apcb014,apcb015,apcb016,apcb024, 
       apcbsite,apcb013,apcb018,apcb019,apcb106,apcb108,apcb051,apcb102,apcb034,apcb054,apcb055,apcb036, 
       apcb035,apcb037,apcb038,apcb039,apcb040,apcb041,apcb042,apcb043,apcb044,apcb045,apcb046 FROM  
       apcb_t WHERE apcbent=? AND apcbld=? AND apcbdocno=? AND apcbseq=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE aapt320_bcl CURSOR FROM g_forupd_sql
   
   #add-point:input段define_sql name="input.define_sql2"
   
   #end add-point    
   LET g_forupd_sql = "SELECT xrcdseq,xrcdseq2,xrcd007,xrcd002,xrcd003,xrcd006,xrcd005,xrcd102,xrcd103, 
       xrcd104,xrcd105,xrcd113,xrcd114,xrcd115,xrcd123,xrcd124,xrcd125,xrcd133,xrcd134,xrcd135,xrcdorga, 
       xrcd009 FROM xrcd_t WHERE xrcdent=? AND xrcdld=? AND xrcddocno=? AND xrcdseq=? AND xrcdseq2=?  
       AND xrcd007=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql2"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE aapt320_bcl2 CURSOR FROM g_forupd_sql
 
 
   
 
 
   #add-point:input段define_sql name="input.other_sql"
   LET g_forupd_sql = "SELECT apcbseq,apcb014,apcb005,apcb105,apcb115,apcb125,apcb135
                         FROM apcb_t
                        WHERE apcbent=? AND apcbld=? AND apcbdocno=? AND apcbseq=?  
                          FOR UPDATE"
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   DECLARE aapt331_bcl3 CURSOR FROM g_forupd_sql
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL aapt320_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   
   #end add-point
   CALL aapt320_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_apca_m.apcasite,g_apca_m.apca003,g_apca_m.apcald,g_apca_m.apcacomp,g_apca_m.apcadocno, 
       g_apca_m.apca001,g_apca_m.apcadocdt,g_apca_m.apca004,g_apca_m.apca005,g_apca_m.apca038,g_apca_m.apcastus, 
       g_apca_m.apca065,g_apca_m.apca066,g_apca_m.apca008,g_apca_m.apca009,g_apca_m.apca010,g_apca_m.apca060, 
       g_apca_m.apca013,g_apca_m.apca012,g_apca_m.apca011,g_apca_m.apca007,g_apca_m.apca036,g_apca_m.apca035, 
       g_apca_m.apca100,g_apca_m.apca103,g_apca_m.apca104,g_apca_m.apca106,g_apca_m.apca108,g_apca_m.apcc109, 
       g_apca_m.net108,g_apca_m.apca101,g_apca_m.apca113,g_apca_m.apca114,g_apca_m.apca116,g_apca_m.apcc113, 
       g_apca_m.apca118,g_apca_m.apcc119,g_apca_m.net118,g_apca_m.apca039,g_apca_m.apca056,g_apca_m.apca016, 
       g_apca_m.apca055,g_apca_m.apca018,g_apca_m.apca019,g_apca_m.apca014,g_apca_m.apca054,g_apca_m.apca015, 
       g_apca_m.apca034,g_apca_m.apca033,g_apca_m.apca058,g_apca_m.apca059,g_apca_m.apca063,g_apca_m.apca050, 
       g_apca_m.apca051,g_apca_m.apca053,g_apca_m.apca025,g_apca_m.apca031,g_apca_m.apca030,g_apca_m.apca026, 
       g_apca_m.apca027,g_apca_m.apca028,g_apca_m.apca029,g_apca_m.apca020,g_apca_m.apca021,g_apca_m.apca022, 
       g_apca_m.apca046,g_apca_m.apca0181,g_apca_m.apca047,g_apca_m.apca048,g_apca_m.apca1011,g_apca_m.apca121, 
       g_apca_m.apca131,g_apca_m.apcc123,g_apca_m.apcc133
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
   CALL s_desc_get_ld_desc(g_apca_m.apcald) RETURNING g_apca_m.apcald_desc                                 #150617-00002#3
   CALL s_desc_get_acc_desc('3211',g_apca_m.apca007) RETURNING g_apca_m.apca007_desc                       #150617-00002#3
   CALL s_desc_get_account_desc(g_apca_m.apcald,g_apca_m.apca035)RETURNING g_apca_m.apca035_desc           #150617-00002#3
   CALL s_desc_get_account_desc(g_apca_m.apcald,g_apca_m.apca036)RETURNING g_apca_m.apca036_desc           #150617-00002#3
   DISPLAY BY NAME g_apca_m.apcald_desc,g_apca_m.apca007_desc,g_apca_m.apca035_desc,g_apca_m.apca036_desc  #150617-00002#3
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="aapt320.input.head" >}
      #單頭段
      INPUT BY NAME g_apca_m.apcasite,g_apca_m.apca003,g_apca_m.apcald,g_apca_m.apcacomp,g_apca_m.apcadocno, 
          g_apca_m.apca001,g_apca_m.apcadocdt,g_apca_m.apca004,g_apca_m.apca005,g_apca_m.apca038,g_apca_m.apcastus, 
          g_apca_m.apca065,g_apca_m.apca066,g_apca_m.apca008,g_apca_m.apca009,g_apca_m.apca010,g_apca_m.apca060, 
          g_apca_m.apca013,g_apca_m.apca012,g_apca_m.apca011,g_apca_m.apca007,g_apca_m.apca036,g_apca_m.apca035, 
          g_apca_m.apca100,g_apca_m.apca103,g_apca_m.apca104,g_apca_m.apca106,g_apca_m.apca108,g_apca_m.apcc109, 
          g_apca_m.net108,g_apca_m.apca101,g_apca_m.apca113,g_apca_m.apca114,g_apca_m.apca116,g_apca_m.apcc113, 
          g_apca_m.apca118,g_apca_m.apcc119,g_apca_m.net118,g_apca_m.apca039,g_apca_m.apca056,g_apca_m.apca016, 
          g_apca_m.apca055,g_apca_m.apca018,g_apca_m.apca019,g_apca_m.apca014,g_apca_m.apca054,g_apca_m.apca015, 
          g_apca_m.apca034,g_apca_m.apca033,g_apca_m.apca058,g_apca_m.apca059,g_apca_m.apca063,g_apca_m.apca050, 
          g_apca_m.apca051,g_apca_m.apca053,g_apca_m.apca025,g_apca_m.apca031,g_apca_m.apca030,g_apca_m.apca026, 
          g_apca_m.apca027,g_apca_m.apca028,g_apca_m.apca029,g_apca_m.apca020,g_apca_m.apca021,g_apca_m.apca022, 
          g_apca_m.apca046,g_apca_m.apca0181,g_apca_m.apca047,g_apca_m.apca048,g_apca_m.apca1011,g_apca_m.apca121, 
          g_apca_m.apca131,g_apca_m.apcc123,g_apca_m.apcc133 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
     
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN aapt320_cl USING g_enterprise,g_apca_m.apcald,g_apca_m.apcadocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN aapt320_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE aapt320_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            IF l_cmd_t = 'r' THEN
               
            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL aapt320_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
            #INITIALIZE g_apca_m_o.* TO NULL #170519-00022#1 mark
            LET l_apcb021_upd = 'N' #160128-00012#1
            LET l_apcb029_upd = 'N' #160128-00012#1
            #end add-point
            CALL aapt320_set_no_entry(p_cmd)
    
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcasite
            
            #add-point:AFTER FIELD apcasite name="input.a.apcasite"
            LET g_apca_m.apcasite_desc = ''
            IF NOT cl_null(g_apca_m.apcasite) THEN
               #IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_apca_m.apcasite != g_apca_m_t.apcasite OR cl_null(g_apca_m_t.apcasite) )) THEN  #160726-00020#8 mark
               IF g_apca_m.apcasite != g_apca_m_o.apcasite OR cl_null(g_apca_m_o.apcasite) THEN       #160726-00020#8
                  CALL s_fin_account_center_sons_query('3',g_apca_m.apcasite,g_apca_m.apcadocdt,'1')
                  #IF g_apca_m_t.apcasite != g_apca_m.apcasite AND NOT cl_null(g_apca_m.apcald) THEN  #160726-00020#8 mark
                  IF g_apca_m_o.apcasite != g_apca_m.apcasite AND NOT cl_null(g_apca_m.apcald) THEN   #160726-00020#8
                     CALL s_fin_account_center_with_ld_chk(g_apca_m.apcasite,g_apca_m.apcald,g_user,'3','N','',g_apca_m.apcadocdt) RETURNING g_sub_success,g_errno
                     IF NOT g_sub_success THEN
                        LET g_apca_m.apcacomp = ''   #160726-00020#10
                        LET g_apca_m.apcald = ''     #160726-00020#10
                        CALL s_fin_orga_get_comp_ld(g_apca_m.apcasite) RETURNING g_sub_success,g_errno,g_apca_m.apcacomp,g_apca_m.apcald
                        CALL s_fin_get_wc_str(g_apca_m.apcacomp) RETURNING g_comp_str  #161229-00047#43 add 
                        CALL s_control_get_supplier_sql_pmab('4',g_site,g_user,g_dept,'',g_comp_str) RETURNING g_sub_success,g_sql_ctrl         #161229-00047#43 add
                        #CALL s_control_get_supplier_sql_pmab('4',g_site,g_user,g_dept,'',g_apca_m.apcacomp) RETURNING g_sub_success,g_sql_ctrl #161111-00042#2 add #161229-00047#43 mark
                        CALL s_fin_account_center_with_ld_chk(g_apca_m.apcasite,g_apca_m.apcald,g_user,'3','N','',g_apca_m.apcadocdt) RETURNING g_sub_success,g_errno
                     END IF
                     IF NOT g_sub_success THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = g_errno
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                        #LET g_apca_m.apcasite = g_apca_m_t.apcasite   #160726-00020#8 mark
                        #LET g_apca_m.apcald   = g_apca_m_t.apcald     #160726-00020#8 mark
                        LET g_apca_m.apcasite = g_apca_m_o.apcasite    #160726-00020#8 
                        LET g_apca_m.apcald   = g_apca_m_o.apcald      #160726-00020#8 
                        CALL s_desc_get_department_desc(g_apca_m.apcasite) RETURNING g_apca_m.apcasite_desc
                        DISPLAY BY NAME g_apca_m.apcasite_desc
                        CALL s_desc_get_ld_desc(g_apca_m.apcald) RETURNING g_apca_m.apcald_desc    #160726-00020#8
                        DISPLAY BY NAME g_apca_m.apcald_desc                                       #160726-00020#8
                        NEXT FIELD CURRENT
                     END IF
                     CALL s_desc_get_ld_desc(g_apca_m.apcald) RETURNING g_apca_m.apcald_desc
                     CALL aapt320_set_ld_info(g_apca_m.apcald,'')
                     DISPLAY BY NAME g_apca_m.apcald_desc
                  END IF
                  CALL s_fin_account_center_with_ld_chk(g_apca_m.apcasite,g_apca_m.apcald,g_user,'3','N','',g_apca_m.apcadocdt) RETURNING g_sub_success,g_errno
                  IF NOT g_sub_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     #LET g_apca_m.apcasite = g_apca_m_t.apcasite   #160726-00020#8 mark
                     #LET g_apca_m.apcald   = g_apca_m_t.apcald     #160726-00020#8 mark
                     LET g_apca_m.apcasite = g_apca_m_o.apcasite    #160726-00020#8 
                     LET g_apca_m.apcald   = g_apca_m_o.apcald      #160726-00020#8 
                     CALL s_desc_get_department_desc(g_apca_m.apcasite) RETURNING g_apca_m.apcasite_desc
                     DISPLAY BY NAME g_apca_m.apcasite_desc
                     CALL s_desc_get_ld_desc(g_apca_m.apcald) RETURNING g_apca_m.apcald_desc    #160726-00020#8 
                     DISPLAY BY NAME g_apca_m.apcald_desc                                       #160726-00020#8 
                     NEXT FIELD CURRENT
                  END IF
                  LET g_apca_m_o.apcasite = g_apca_m.apcasite    #160726-00020#8 
                  LET g_apca_m_o.apcald   = g_apca_m.apcald      #160726-00020#8 
               END IF
               CALL s_fin_account_center_sons_query('3',g_apca_m.apcasite,g_apca_m.apcadocdt,'1')
               CALL s_fin_account_center_sons_str() RETURNING g_wc_apcasite
               CALL s_fin_get_wc_str(g_wc_apcasite) RETURNING g_wc_apcasite
               CALL s_fin_account_center_ld_str() RETURNING g_wc_apcald
               CALL s_fin_get_wc_str(g_wc_apcald) RETURNING g_wc_apcald
               LET g_apca_m_t.apcasite = g_apca_m.apcasite
            END IF
            CALL s_desc_get_department_desc(g_apca_m.apcasite) RETURNING g_apca_m.apcasite_desc                    
            DISPLAY BY NAME g_apca_m.apcasite_desc
            #161014-00053#3 --s add
            CALL s_fin_account_center_sons_query('3',g_apca_m.apcasite,g_today,'1')  #依據正確的資料再重展一次結構
            #取得帳務中心底下的帳套範圍 
            CALL s_fin_account_center_ld_str() RETURNING g_wc_apcald
            CALL s_fin_get_wc_str(g_wc_apcald) RETURNING g_wc_apcald
            #161014-00053#3 --e add
            LET g_apca_m_o.* = g_apca_m.*   #160726-00020#10
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcasite
            #add-point:BEFORE FIELD apcasite name="input.b.apcasite"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcasite
            #add-point:ON CHANGE apcasite name="input.g.apcasite"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca003
            
            #add-point:AFTER FIELD apca003 name="input.a.apca003"
            LET g_apca_m.apca003_desc = ' '
            IF NOT cl_null(g_apca_m.apca003) THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_apca_m.apca003 != g_apca_m_t.apca003 OR g_apca_m_t.apca003 IS NULL )) THEN
                  LET g_errno = ''
                  CALL s_employee_chk(g_apca_m.apca003) RETURNING g_sub_success
                  IF NOT g_sub_success THEN
                     LET g_apca_m.apca003 = g_apca_m_t.apca003
                     CALL s_desc_get_person_desc(g_apca_m.apca003) RETURNING g_apca_m.apca003_desc
                     DISPLAY BY NAME g_apca_m.apca003_desc
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            CALL s_desc_get_person_desc(g_apca_m.apca003) RETURNING g_apca_m.apca003_desc
            DISPLAY BY NAME g_apca_m.apca003_desc   
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca003
            #add-point:BEFORE FIELD apca003 name="input.b.apca003"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca003
            #add-point:ON CHANGE apca003 name="input.g.apca003"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcald
            
            #add-point:AFTER FIELD apcald name="input.a.apcald"
            LET g_apca_m.apcald_desc = ''
           #IF NOT cl_null(g_apca_m.apcald) AND NOT cl_null(g_apca_m.apcasite) THEN #161014-00053#3 mark 
            IF NOT cl_null(g_apca_m.apcald) THEN #161014-00053#3 add
              #IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_apca_m.apcald != g_apca_m_t.apcald OR g_apca_m_t.apcald IS NULL )) THEN     #160726-00020#8  mark
               IF g_apca_m.apcald != g_apca_m_o.apcald OR cl_null(g_apca_m_o.apcald ) THEN   #160726-00020#8
                 #CALL s_fin_account_center_with_ld_chk(g_apca_m.apcasite,g_apca_m.apcald,g_user,'3','N',g_wc_apcald,g_apca_m.apcadocdt) RETURNING g_sub_success,g_errno #160812-00027#1 mark
                  CALL s_fin_account_center_with_ld_chk(g_apca_m.apcasite,g_apca_m.apcald,g_user,'3','Y',g_wc_apcald,g_apca_m.apcadocdt) RETURNING g_sub_success,g_errno  #160812-00027#1 add
                  IF NOT g_sub_success THEN
                     #LET g_apca_m.apcald = g_apca_m_t.apcald        #160726-00020#8 mark
                     #LET g_apca_m.apcacomp = g_apca_m_t.apcacomp    #160726-00020#8 mark
                     LET g_apca_m.apcald = g_apca_m_o.apcald         #160726-00020#8 
                     LET g_apca_m.apcacomp = g_apca_m_o.apcacomp     #160726-00020#8
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     CALL s_desc_get_department_desc(g_apca_m.apcasite) RETURNING g_apca_m.apcasite_desc #160726-00020#8
                     CALL s_desc_get_ld_desc(g_apca_m.apcald) RETURNING g_apca_m.apcald_desc     #160726-00020#8
                     DISPLAY BY NAME g_apca_m.apcasite_desc,g_apca_m.apcald_desc                 #160726-00020#8
                     NEXT FIELD CURRENT
                  END IF
                  LET g_apca_m.apcacomp = ''     #160726-00020#10
                  CALL aapt320_set_ld_info(g_apca_m.apcald,'')
                  #160420-00013#1--(S)
                  LET g_apca_m.apca059 = ''     #160726-00020#10
                  CALL s_aap_get_bgaf004(g_apca_m.apcald,g_apca_m.apcacomp,g_apca_m.apcadocno,g_apca_m.apcadocdt) RETURNING g_apca_m.apca059,g_apca_m.apca059_desc
                  DISPLAY BY NAME g_apca_m.apca059,g_apca_m.apca059_desc
                  #160420-00013#1--(E)
                  #帳款類別有值,應重載會計科目
                  IF NOT cl_null(g_apca_m.apca007) THEN
                     LET g_apca_m.apca036 = ''   #160726-00020#10
                     LET g_apca_m.apca035 = ''   #160726-00020#10
                    #151215-00013#3 mark --start--
                    #CASE
                    #   WHEN g_apca_m.apca001 = '01'
                    #      LET g_glab003 = '8504_01'
                    #   WHEN g_apca_m.apca001 = '02'
                    #      LET g_glab003 = '8504_24'
                    #END CASE
                    #151215-00013#3 mark --end--
                     #151215-00013#3 add --start--
                     CASE g_apca_m.apca001
                        WHEN '01'   LET g_glab003 = '8504_01'
                        WHEN '02'   LET g_glab003 = '8504_24'
                        WHEN '03'   LET g_glab003 = '8504_02' #採購費用科目
                        WHEN '04'   LET g_glab003 = '8504_24' #折讓科目
                     END CASE
                     #151215-00013#3 add --end--                    

                     CALL s_fin_get_account(g_apca_m.apcald,'13',g_apca_m.apca007,g_glab003) RETURNING g_sub_success,g_apca_m.apca036,g_errno   #albireo-s
                     CALL s_fin_get_account(g_apca_m.apcald,'13',g_apca_m.apca007,'8504_22') RETURNING g_sub_success,g_apca_m.apca035,g_errno   #albireo-e
                  END IF
                  IF NOT cl_null(g_apca_m.apca100) AND NOT cl_null(g_apca_m.apcadocdt) THEN
                     LET g_apca_m.apca101 = ''   #160726-00020#10
                     LET g_apca_m.apca121 = ''   #160726-00020#10
                     LET g_apca_m.apca131 = ''   #160726-00020#10
                     LET lc_param.apca004 = g_apca_m.apca004
                     LET ls_js = util.JSON.stringify(lc_param)
                     CALL s_fin_get_curr_rate(g_apca_m.apcacomp,g_apca_m.apcald,g_apca_m.apcadocdt,g_apca_m.apca100,ls_js)
                          RETURNING g_apca_m.apca101,g_apca_m.apca121,g_apca_m.apca131
                     IF g_apca_m.apca100 = g_apca_m.glaa001 THEN
                        LET l_using = FALSE
                     ELSE
                        LET l_using = TRUE
                     END IF
                     CALL cl_set_comp_entry("apca101",l_using)
                     LET g_apca_m.apca1001 = g_apca_m.apca100
                     LET g_apca_m.apca1011 = g_apca_m.apca101
                     DISPLAY BY NAME g_apca_m.apca1001,g_apca_m.apca101,g_apca_m.apca1011,g_apca_m.apca121,g_apca_m.apca131
                  ELSE
                     LET g_apca_m.apca101  = 0
                     LET g_apca_m.apca1011 = 0
                     LET g_apca_m.apca121  = 0
                     LET g_apca_m.apca131  = 0
                     DISPLAY BY NAME g_apca_m.apca1001,g_apca_m.apca101,g_apca_m.apca1011,g_apca_m.apca121,g_apca_m.apca131
                  END IF
                 LET g_apca_m_o.apcald   = g_apca_m.apcald      #160726-00020#8
                 LET g_apca_m_o.apcacomp = g_apca_m.apcacomp    #160726-00020#8                 
               END IF
            END IF
            CALL s_desc_get_ld_desc(g_apca_m.apcald) RETURNING g_apca_m.apcald_desc
            DISPLAY BY NAME g_apca_m.apcald_desc
            LET g_apca_m_o.* = g_apca_m.*   #160726-00020#10
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcald
            #add-point:BEFORE FIELD apcald name="input.b.apcald"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcald
            #add-point:ON CHANGE apcald name="input.g.apcald"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcacomp
            
            #add-point:AFTER FIELD apcacomp name="input.a.apcacomp"


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcacomp
            #add-point:BEFORE FIELD apcacomp name="input.b.apcacomp"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcacomp
            #add-point:ON CHANGE apcacomp name="input.g.apcacomp"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcadocno
            
            #add-point:AFTER FIELD apcadocno name="input.a.apcadocno"
            LET g_apca_m.apcadocno_desc = ' '
            #檢查是否有重複的單據編號(企業代碼/帳別/單號)
            IF NOT cl_null(g_apca_m.apcadocno) THEN 
               #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (cl_null(g_apca_m_t.apcadocno) OR g_apca_m.apcadocno != g_apca_m_t.apcadocno)) THEN  #160726-00020#8 mark
               IF cl_null(g_apca_m_o.apcadocno) OR g_apca_m.apcadocno != g_apca_m_o.apcadocno THEN  #160726-00020#8
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM apca_t WHERE "||"apcaent = '" ||g_enterprise|| "' AND "||"apcadocno = '"||g_apca_m.apcadocno ||"'  AND "||"apcald = '"||g_apca_m.apcald ||"' ",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
                  IF NOT s_aooi200_fin_chk_docno(g_apca_m.apcald,'','',g_apca_m.apcadocno,g_apca_m.apcadocdt,g_prog) THEN
                     #LET g_apca_m.apcadocno = g_apca_m_t.apcadocno  #160726-00020#8
                     LET g_apca_m.apcadocno = g_apca_m_o.apcadocno   #160726-00020#8
                     #LET g_apca_m.apca059 = g_apca_m_o.apca059       #160726-00020#8 #160726-00020#10 mark
                     NEXT FIELD CURRENT
                  END IF
                  #161104-00046#19 --s add
                  #170301-00027#12 by 09042 mark（s）
                  #CALL s_control_chk_doc('1',g_apca_m.apcadocno,'4',g_user,g_dept,'','') RETURNING g_sub_success,l_flag
                  #170301-00027#12 by 09042 mark（e）
                  #170301-00027#12 by 09042 add（s）               
                  CALL s_control_chk_doc('1',g_apca_m.apcadocno,'4',g_user,g_dept,g_apca_m.apcald,'') RETURNING g_sub_success,l_flag   #170301-00027#12  畫面上有帳套，將帳套傳入。               
                  #170301-00027#12 by 09042 add（e）                   
                  IF g_sub_success AND l_flag THEN             
                  ELSE
                     LET g_apca_m.apcadocno = g_apca_m_o.apcadocno
                     NEXT FIELD CURRENT             
                  END IF            
                  #161104-00046#19 --e add                      
                  #取得單別性質(apca001)
                  CALL s_aooi200_fin_get_slip(g_apca_m.apcadocno) RETURNING g_sub_success,g_ap_slip
                  CALL s_fin_get_doc_para(g_apca_m.apcald,g_apca_m.apcacomp,g_ap_slip,g_fin_arg1) RETURNING g_apca_m.apca001
                  #170620-00032#1 add(s)
                  IF l_cmd_t = 'r' AND p_cmd = 'a' THEN
                     IF cl_null(g_apca_m.apca001) THEN
                        LET g_apca_m.apca001 = g_apca_m_o.apca001
                     ELSE
                        IF g_apca_m.apca001 NOT MATCHES'0[34]'THEN
                           INITIALIZE g_errparam TO NULL
                           LET g_errparam.code = 'aap-00639'
                           LET g_errparam.extend = ''
                           LET g_errparam.popup = TRUE
                           CALL cl_err()
                           NEXT FIELD CURRENT
                        END IF
                     END IF
                  END IF
                  #170620-00032#1 add(e)
                  DISPLAY BY NAME g_apca_m.apca001
                  CALL aapt320_apca016_item_change()
                  #160420-00013#1--(S)
                  LET g_apca_m.apca059 = ''        #160726-00020#10
                  CALL s_aap_get_bgaf004(g_apca_m.apcald,g_apca_m.apcacomp,g_apca_m.apcadocno,g_apca_m.apcadocdt) RETURNING g_apca_m.apca059,g_apca_m.apca059_desc
                  DISPLAY BY NAME g_apca_m.apca059,g_apca_m.apca059_desc
                  #160420-00013#1--(E)
                  #LET g_apca_m_o.apcadocno = g_apca_m.apcadocno #160726-00020#8 #160726-00020#10 mark
                  #LET g_apca_m_o.apca059 = g_apca_m.apca059     #160726-00020#8 #160726-00020#10 mark
                  #161104-00046#19 --s add
                  #刪除單別預設temptable
                  DELETE FROM s_aooi200def1
                  #以目前畫面資訊新增temp資料   #請勿調整.*
                  INSERT INTO s_aooi200def1 VALUES(g_apca_m.*)
                  #依單別預設取用資訊
                  CALL s_aooi200def_get('','',g_apca_m.apcasite,'2',g_ap_slip,'','',g_apca_m.apcald)
                  #依單別預設值TEMP內容 給予到畫面上   #請勿調整.*
                  SELECT * INTO g_apca_m.* FROM s_aooi200def1               
                  #161104-00046#19 --e add                    
               END IF
            END IF
            LET g_apcadocno = g_apca_m.apcadocno #170713-00046#1 add
            CALL s_aooi200_fin_get_slip_desc(g_apca_m.apcadocno) RETURNING g_apca_m.apcadocno_desc
            DISPLAY BY NAME g_apca_m.apcadocno_desc
            LET g_apca_m_o.* = g_apca_m.*   #160726-00020#10
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcadocno
            #add-point:BEFORE FIELD apcadocno name="input.b.apcadocno"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcadocno
            #add-point:ON CHANGE apcadocno name="input.g.apcadocno"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca001
            #add-point:BEFORE FIELD apca001 name="input.b.apca001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca001
            
            #add-point:AFTER FIELD apca001 name="input.a.apca001"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca001
            #add-point:ON CHANGE apca001 name="input.g.apca001"
            CALL aapt320_apca016_item_change()
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcadocdt
            #add-point:BEFORE FIELD apcadocdt name="input.b.apcadocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcadocdt
            
            #add-point:AFTER FIELD apcadocdt name="input.a.apcadocdt"
            IF NOT cl_null(g_apca_m.apcadocdt) THEN 
               CALL s_fin_date_close_chk('',g_apca_m.apcacomp,'AAP',g_apca_m.apcadocdt) RETURNING g_sub_success
               IF NOT g_sub_success THEN
                  LET g_apca_m.apcadocdt= g_apca_m_t.apcadocdt
                  NEXT FIELD CURRENT
               END IF          
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_apca_m.apcadocdt != g_apca_m_t.apcadocdt OR g_apca_m_t.apcadocdt IS NULL )) THEN
                  CALL s_fin_account_center_with_ld_chk(g_apca_m.apcasite,g_apca_m.apcald,g_user,'3','N',g_wc_apcald,g_apca_m.apcadocdt) RETURNING g_sub_success,g_errno
                  IF NOT g_sub_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_apca_m.apcadocdt= g_apca_m_t.apcadocdt
                     NEXT FIELD CURRENT
                  END IF
                  #160420-00013#1--(S)
                  CALL s_aap_get_bgaf004(g_apca_m.apcald,g_apca_m.apcacomp,g_apca_m.apcadocno,g_apca_m.apcadocdt) RETURNING g_apca_m.apca059,g_apca_m.apca059_desc
                  DISPLAY BY NAME g_apca_m.apca059,g_apca_m.apca059_desc
                  #160420-00013#1--(E)
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcadocdt
            #add-point:ON CHANGE apcadocdt name="input.g.apcadocdt"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca004
            
            #add-point:AFTER FIELD apca004 name="input.a.apca004"
            LET g_apca_m.apca004_desc = ''
            IF NOT cl_null(g_apca_m.apca004) THEN
               #IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_apca_m.apca004 != g_apca_m_t.apca004 OR g_apca_m_t.apca004 IS NULL )) THEN  #160726-00020#8 mark
               IF g_apca_m.apca004 != g_apca_m_o.apca004 OR cl_null ( g_apca_m_o.apca004 ) THEN    #160726-00020#8               
                  CALL s_aap_apca004_chk(g_apca_m.apca004) RETURNING g_sub_success,g_errno
                  IF NOT g_sub_success THEN
                     #151231-00010#1(S)
                     IF NOT cl_null(g_errno) THEN
                     #151231-00010#1(E)
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = g_errno
                        LET g_errparam.extend = ''
                        #160321-00016#21 --s add
                        LET g_errparam.replace[1] = 'apmm100'
                        LET g_errparam.replace[2] = cl_get_progname('apmm100',g_lang,"2")
                        LET g_errparam.exeprog = 'apmm100'
                        #160321-00016#21 --e add
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                     END IF  #151231-00010#1

                     #LET g_apca_m.apca004 = g_apca_m_t.apca004   #160726-00020#8 mark
                     LET g_apca_m.apca004 = g_apca_m_o.apca004    #160726-00020#8
                     CALL aapt320_get_apca004_info()              #160726-00020#8
                     CALL s_desc_get_trading_partner_abbr_desc(g_apca_m.apca004) RETURNING g_apca_m.apca004_desc
                     DISPLAY BY NAME g_apca_m.apca004_desc
                     CALL s_desc_get_trading_partner_abbr_desc(g_apca_m.apca005) RETURNING g_apca_m.apca005_desc #160726-00020#8
                     DISPLAY BY NAME g_apca_m.apca005_desc                                                       #160726-00020#8
                     NEXT FIELD CURRENT 
                  END IF
                  #160802-00007#2-----s
                  SELECT pmaa004 INTO l_pmaa004 FROM pmaa_t WHERE pmaaent = g_enterprise AND pmaa001 = g_apca_m.apca004
                  IF l_pmaa004 = '2' THEN   #一次性交易對象
                     IF g_apca_m.apca001 MATCHES '0[34]' THEN #170713-00046#1 add
                        CALL apmi004_01('1',g_apca_m.apca057,g_apca_m.apca004,g_apca_m.apcadocno) RETURNING g_apca_m.apca057
                     #170713-00046#1 add(s)
                     ELSE
                        INITIALIZE g_qryparam.* TO NULL
                        LET g_qryparam.state = 'i'
		    	            LET g_qryparam.reqry = FALSE
		    	            LET g_qryparam.default1 = g_apca_m.apca057
		    	            LET g_qryparam.arg1 = g_apca_m.apca004
                        CALL q_pmak002() 
                        LET g_apca_m.apca057 = g_qryparam.return1
                        CALL s_axrt300_xrca_ref('xrca057',g_apca_m.apca004,g_apca_m.apca057,'') RETURNING g_sub_success,g_apca_m.apca004_desc
                     END IF
                     #170713-00046#1 add(e)  
                  END IF
                  IF l_pmaa004 = '4' THEN   #內部員工
                     CALL apmi004_01('2',g_apca_m.apca057,g_apca_m.apca004,g_apca_m.apcadocno) RETURNING g_apca_m.apca057
                  END IF
                  #160802-00007#2-----e
                  #IF g_apca_m_o.apca004 IS NULL OR g_apca_m_o.apca004 != g_apca_m.apca004 THEN    #160726-00020#8 mark
                  IF cl_null (g_apca_m_o.apca004) OR g_apca_m_o.apca004 != g_apca_m.apca004 THEN   #160726-00020#8                  
                     CALL aapt320_get_apca004_info()
                     #LET g_apca_m_t.apca005 = g_apca_m.apca005   #151014-00018#5  #160726-00020#8 mark
                  END IF
                  LET g_apca_m_o.* = g_apca_m.*                   #160726-00020#10
                  #LET g_apca_m_o.apca004 = g_apca_m.apca004      #160726-00020#8  #160726-00020#10 mark
               END IF
            END IF
            #160802-00007#2-----s
            IF cl_null(g_apca_m.apca004) THEN
               LET g_apca_m.apca057 = ''
            END IF
            #160802-00007#2-----e
            CALL s_desc_get_trading_partner_abbr_desc(g_apca_m.apca004) RETURNING g_apca_m.apca004_desc
            #160802-00007#2-----s
            IF NOT cl_null(g_apca_m.apca057) THEN
               #CALL s_axrt300_xrca_ref('xrca057',g_apca_m.apca057,'','') RETURNING g_sub_success,g_apca_m.apca004_desc #170522-00030#1 mark
               #170522-00030#1 add(s)
               CALL s_axrt300_xrca_ref('xrca057',g_apca_m.apca004,g_apca_m.apca057,'') RETURNING g_sub_success,g_apca_m.apca004_desc
               IF g_apca_m.apca005 = g_apca_m.apca004 THEN
                  LET g_apca_m.apca005_desc = g_apca_m.apca004_desc
                  DISPLAY BY NAME g_apca_m.apca005_desc
               END IF
               #170522-00030#1 add(e)
            END IF
            #160802-00007#2-----e            
            DISPLAY BY NAME g_apca_m.apca004_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca004
            #add-point:BEFORE FIELD apca004 name="input.b.apca004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca004
            #add-point:ON CHANGE apca004 name="input.g.apca004"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca005
            
            #add-point:AFTER FIELD apca005 name="input.a.apca005"
            LET g_apca_m.apca005_desc = ' '
            IF NOT cl_null(g_apca_m.apca005) THEN
               #IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_apca_m.apca005 != g_apca_m_t.apca005 OR g_apca_m_t.apca005 IS NULL )) THEN   #160726-00020#10 mark
               IF g_apca_m.apca005 != g_apca_m_o.apca005 OR cl_null(g_apca_m_o.apca005) THEN   #160726-00020#10
                  LET g_errno = ''
                  CALL s_voucher_glaq021_chk(g_apca_m.apca005)  #151014-00018#2 mod apca004 >> apca005
                  IF NOT cl_null(g_errno) THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     #160321-00016#21 --s add
                     LET g_errparam.replace[1] = 'apmm100'
                     LET g_errparam.replace[2] = cl_get_progname('apmm100',g_lang,"2")
                     LET g_errparam.exeprog = 'apmm100'
                     #160321-00016#21 --e add
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_apca_m.apca005 = g_apca_m_o.apca005   #160726-00020#10 
                     #LET g_apca_m.apca005 = g_apca_m_t.apca005   #160726-00020#10 mark
                     CALL s_desc_get_trading_partner_abbr_desc(g_apca_m.apca005) RETURNING g_apca_m.apca005_desc
                     #170522-00030#4 add(s)
                     IF g_apca_m.apca005 = g_apca_m.apca004 THEN
                        LET g_apca_m.apca005_desc = g_apca_m.apca004_desc
                     END IF
                     #170522-00030#4 add(e)
                     DISPLAY BY NAME g_apca_m.apca005_desc
                     NEXT FIELD CURRENT
                  END IF
                  #151014-00018#2--s
                  CALL s_aapt300_partner_chk(g_apca_m.apca004,g_apca_m.apca005) RETURNING g_sub_success,g_errno
                  IF NOT g_sub_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_apca_m.apca005 = g_apca_m_t.apca005
                     CALL s_desc_get_trading_partner_abbr_desc(g_apca_m.apca005) RETURNING g_apca_m.apca005_desc
                     #170522-00030#4 add(s)
                     IF g_apca_m.apca005 = g_apca_m.apca004 THEN
                        LET g_apca_m.apca005_desc = g_apca_m.apca004_desc
                     END IF
                     #170522-00030#4 add(e)
                     DISPLAY BY NAME g_apca_m.apca005_desc
                     NEXT FIELD CURRENT
                  END IF                  
                  #151014-00018#2--e
                  LET g_apca_m_t.apca005 = g_apca_m.apca005   #151014-00018#5            
               END IF
            END IF
            CALL s_desc_get_trading_partner_abbr_desc(g_apca_m.apca005) RETURNING g_apca_m.apca005_desc
            #170522-00030#4 add(s)
            IF g_apca_m.apca005 = g_apca_m.apca004 THEN
               LET g_apca_m.apca005_desc = g_apca_m.apca004_desc
            END IF
            #170522-00030#4 add(e)
            DISPLAY BY NAME g_apca_m.apca005_desc
            LET g_apca_m_o.* = g_apca_m.*   #160726-00020#10
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca005
            #add-point:BEFORE FIELD apca005 name="input.b.apca005"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca005
            #add-point:ON CHANGE apca005 name="input.g.apca005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca038
            #add-point:BEFORE FIELD apca038 name="input.b.apca038"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca038
            
            #add-point:AFTER FIELD apca038 name="input.a.apca038"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca038
            #add-point:ON CHANGE apca038 name="input.g.apca038"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcastus
            #add-point:BEFORE FIELD apcastus name="input.b.apcastus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcastus
            
            #add-point:AFTER FIELD apcastus name="input.a.apcastus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcastus
            #add-point:ON CHANGE apcastus name="input.g.apcastus"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca065
            #add-point:BEFORE FIELD apca065 name="input.b.apca065"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca065
            
            #add-point:AFTER FIELD apca065 name="input.a.apca065"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca065
            #add-point:ON CHANGE apca065 name="input.g.apca065"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca066
            #add-point:BEFORE FIELD apca066 name="input.b.apca066"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca066
            
            #add-point:AFTER FIELD apca066 name="input.a.apca066"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca066
            #add-point:ON CHANGE apca066 name="input.g.apca066"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca008
            
            #add-point:AFTER FIELD apca008 name="input.a.apca008"
            LET g_apca_m.apca008_desc = ' '
            IF NOT cl_null(g_apca_m.apca008) THEN
               #IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_apca_m.apca008 != g_apca_m_t.apca008 OR g_apca_m_t.apca008 IS NULL )) THEN  #160726-00020#8 mark
               IF g_apca_m.apca008 != g_apca_m_o.apca008 OR cl_null(g_apca_m_o.apca008) THEN       #160726-00020#8
                 #CALL s_aap_ooib002_chk(g_apca_m.apca008,'1')RETURNING g_sub_success,g_errno      #160127-00017#1
                  #160127-00017#1--(S)
                  LET lc_param.apca004 = g_apca_m.apca004
                  LET lc_param.ooib001 = '1'
                  LET ls_js = util.JSON.stringify(lc_param)
                  CALL s_aap_ooib002_chk(g_apca_m.apca008,ls_js)RETURNING g_sub_success,g_errno
                  #160127-00017#1--(E)
                  IF NOT g_sub_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     #160321-00016#21 --s add
                     LET g_errparam.replace[1] = 'aooi716'
                     LET g_errparam.replace[2] = cl_get_progname('aooi716',g_lang,"2")
                     LET g_errparam.exeprog = 'aooi716'
                     #160321-00016#21 --e add
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     #LET g_apca_m.apca008 = g_apca_m_t.apca008   #160726-00020#8
                     LET g_apca_m.apca008 = g_apca_m_o.apca008   #160726-00020#8
                     LET g_apca_m.apca009 = g_apca_m_o.apca009   #160726-00020#8
                     LET g_apca_m.apca010 = g_apca_m_o.apca010   #160726-00020#8
                     LET g_apca_m.apca054 = g_apca_m_o.apca054   #160726-00020#8
                     LET g_apca_m.apca055 = g_apca_m_o.apca055   #160726-00020#8
                     CALL s_desc_get_acc_desc('3114',g_apca_m.apca054) RETURNING g_apca_m.apca054_desc  #160726-00020#8
                     CALL s_desc_ooid001_desc(g_apca_m.apca055) RETURNING g_apca_m.apca055_desc         #160726-00020#8
                     CALL s_desc_get_ooib002_desc(g_apca_m.apca008) RETURNING g_apca_m.apca008_desc
                     #DISPLAY BY NAME g_apca_m.apca008_desc     #160726-00020#8 mark
                     DISPLAY BY NAME g_apca_m.apca008_desc,g_apca_m.apca054_desc,g_apca_m.apca055_desc     #160726-00020#8
                     NEXT FIELD CURRENT
                  END IF
                  #160726-00020#10--s
                  LET g_apca_m.apca054 = ''
                  LET g_apca_m.apca055 = ''
                  LET g_apca_m.apca009 = ''
                  LET g_apca_m.apca010 = ''
                  #160726-00020#10--e
                  #付款日期/票據到期日
                  CALL s_fin_date_ap_payable(g_apca_m.apcasite,g_apca_m.apca004,g_apca_m.apca008,g_apca_m.apcadocdt,
                    g_apca_m.apcadocdt,g_apca_m.apcadocdt,'') RETURNING g_sub_success,g_apca_m.apca009,g_apca_m.apca010
                  #多帳期設定/繳款優惠條件
                  SELECT ooib025,ooib005 INTO g_apca_m.apca054,g_apca_m.apca055
                    FROM ooib_t
                   WHERE ooibent = g_enterprise AND ooib002 = g_apca_m.apca008
                  IF NOT cl_null(g_apca_m.apca054) THEN
                     IF NOT s_azzi650_chk_exist('3114',g_apca_m.apca054) THEN LET g_apca_m.apca054 = '' END IF
                     CALL s_desc_get_acc_desc('3114',g_apca_m.apca054) RETURNING g_apca_m.apca054_desc
                  END IF
                  IF NOT cl_null(g_apca_m.apca055) THEN
                     CALL s_aap_ooid001_chk(g_apca_m.apca055) RETURNING g_sub_success,g_errno
                     IF NOT g_sub_success THEN LET g_apca_m.apca055 = '' END IF
                     CALL s_desc_ooid001_desc(g_apca_m.apca055) RETURNING g_apca_m.apca055_desc 
                  END IF
                  DISPLAY BY NAME g_apca_m.apca054_desc,g_apca_m.apca055_desc
                  LET g_apca_m_o.apca008 = g_apca_m.apca008   #160726-00020#8
                  LET g_apca_m_o.apca009 = g_apca_m.apca009   #160726-00020#8
                  LET g_apca_m_o.apca010 = g_apca_m.apca010   #160726-00020#8
                  LET g_apca_m_o.apca054 = g_apca_m.apca054   #160726-00020#8
                  LET g_apca_m_o.apca055 = g_apca_m.apca055   #160726-00020#8
               END IF
            END IF
            CALL s_desc_get_ooib002_desc(g_apca_m.apca008) RETURNING g_apca_m.apca008_desc
            DISPLAY BY NAME g_apca_m.apca008_desc
            LET g_apca_m_o.* = g_apca_m.*   #160726-00020#10
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca008
            #add-point:BEFORE FIELD apca008 name="input.b.apca008"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca008
            #add-point:ON CHANGE apca008 name="input.g.apca008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca009
            #add-point:BEFORE FIELD apca009 name="input.b.apca009"
   
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca009
            
            #add-point:AFTER FIELD apca009 name="input.a.apca009"
            #LET g_apca_m_o.apca009 = g_apca_m.apca009  #160726-00020#8  #160726-00020#10 mark
            LET g_apca_m_o.* = g_apca_m.*   #160726-00020#10
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca009
            #add-point:ON CHANGE apca009 name="input.g.apca009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca010
            #add-point:BEFORE FIELD apca010 name="input.b.apca010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca010
            
            #add-point:AFTER FIELD apca010 name="input.a.apca010"
            LET g_apca_m_o.apca010 = g_apca_m.apca010   #160726-00020#8
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca010
            #add-point:ON CHANGE apca010 name="input.g.apca010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca060
            #add-point:BEFORE FIELD apca060 name="input.b.apca060"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca060
            
            #add-point:AFTER FIELD apca060 name="input.a.apca060"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca060
            #add-point:ON CHANGE apca060 name="input.g.apca060"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca013
            #add-point:BEFORE FIELD apca013 name="input.b.apca013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca013
            
            #add-point:AFTER FIELD apca013 name="input.a.apca013"
            LET g_apca_m_o.* = g_apca_m.*   #160726-00020#10
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca013
            #add-point:ON CHANGE apca013 name="input.g.apca013"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca012
            #add-point:BEFORE FIELD apca012 name="input.b.apca012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca012
            
            #add-point:AFTER FIELD apca012 name="input.a.apca012"
            LET g_apca_m_o.* = g_apca_m.*   #160726-00020#10
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca012
            #add-point:ON CHANGE apca012 name="input.g.apca012"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca011
            
            #add-point:AFTER FIELD apca011 name="input.a.apca011"
            #160726-00020#10 mark--s
            #LET g_apca_m.apca013 = 'N'   #含稅否
            #LET g_apca_m.apca012 = ''    #稅率
            #160726-00020#10 mark--e
            IF NOT cl_null(g_apca_m.apca011) THEN
               #IF p_cmd = 'a' OR (p_cmd = 'u' AND ((g_apca_m.apca011 != g_apca_m_t.apca011 OR g_apca_m_t.apca011 IS NULL ) )) THEN #160726-00020#10 mark
               IF g_apca_m.apca011 != g_apca_m_o.apca011 OR cl_null(g_apca_m_o.apca011) THEN                                        #160726-00020#10
                  #160726-00020#10--s
                  LET g_apca_m.apca013 = 'N'   #含稅否
                  LET g_apca_m.apca012 = ''    #稅率
                  #160726-00020#10--e
                  #160511-00026#1--(S)
                  #CALL s_aap_tax_for_noevidence(g_apca_m.apcacomp,g_apca_m.apca011) RETURNING g_sub_success,g_errno
                  #IF NOT g_sub_success THEN
                  #   INITIALIZE g_errparam TO NULL
                  #   LET g_errparam.code = g_errno
                  #   LET g_errparam.extend = ''
                  #   LET g_errparam.popup = TRUE
                  #   CALL cl_err()
                  #   LET g_apca_m.apca011 = g_apca_m_t.apca011
                  #   LET g_apca_m.apca012 = g_apca_m_t.apca012
                  #   LET g_apca_m.apca013 = g_apca_m_t.apca013
                  #   NEXT FIELD CURRENT
                  #END IF
                  #160511-00026#1--(E)
                  CALL s_tax_chk(g_apca_m.apcacomp,g_apca_m.apca011) RETURNING g_sub_success,l_oodb004,g_apca_m.apca013,g_apca_m.apca012,l_oodb011
                  IF NOT g_sub_success THEN
                     #160726-00020#10 mark--s
                     LET g_apca_m.apca011 = g_apca_m_t.apca011
                     LET g_apca_m.apca012 = g_apca_m_t.apca012
                     LET g_apca_m.apca013 = g_apca_m_t.apca013
                     #160726-00020#10 mark--e
                     #160726-00020#10--s
                     LET g_apca_m.apca011 = g_apca_m_o.apca011
                     LET g_apca_m.apca012 = g_apca_m_o.apca012
                     LET g_apca_m.apca013 = g_apca_m_o.apca013
                     #160726-00020#10--e
                     NEXT FIELD CURRENT
                  ELSE     
                     #160511-00026#1--(S)
                     LET l_oodb004 = NULL
                     LET l_oodb008 = NULL
                     SELECT oodb004,oodb008 INTO l_oodb004,l_oodb008
                       FROM oodb_t
                     #WHERE oodbent  = g_enterprise AND oodb001  = l_ooef019   #160614-00014#2 mark
                      WHERE oodbent  = g_enterprise AND oodb001  = g_ooef019   #160614-00014#2 
                        AND oodb002  = g_apca_m.apca011
                     IF l_oodb004 <> '1' THEN   #非單一稅率
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = 'aap-00182'
                        LET g_errparam.extend = ''
                       #LET g_errparam.popup = FALSE          #160614-00014#2 mark
                        LET g_errparam.popup = TRUE           #160614-00014#2 
                        CALL cl_err()
                        NEXT FIELD apca011
                     END IF
                     IF g_sfin3012 = '1' THEN
                        IF NOT l_oodb008 MATCHES '[23]' THEN
                           INITIALIZE g_errparam TO NULL
                          #LET g_errparam.code = 'aap-00182'  #160614-00014#2 mark
                           LET g_errparam.code = 'aap-00343'  #160614-00014#2 
                           LET g_errparam.extend = ''
                          #LET g_errparam.popup = FALSE       #160614-00014#2 mark
                           LET g_errparam.popup = TRUE        #160614-00014#2 
                           CALL cl_err()
                           NEXT FIELD apca011
                        END IF
                     END IF
                     #160511-00026#1--(E)
                  END IF
               END IF
               CALL s_desc_get_tax_desc(g_ooef019,g_apca_m.apca011) RETURNING g_apca_m.apca011_desc
               DISPLAY BY NAME g_apca_m.apca011_desc  #161101-00005#1
            END IF
            LET g_apca_m_o.* = g_apca_m.*   #160726-00020#10
            DISPLAY BY NAME g_apca_m.apca011,g_apca_m.apca012,g_apca_m.apca013
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca011
            #add-point:BEFORE FIELD apca011 name="input.b.apca011"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca011
            #add-point:ON CHANGE apca011 name="input.g.apca011"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca007
            
            #add-point:AFTER FIELD apca007 name="input.a.apca007"
            LET g_apca_m.apca007_desc = ' '
            IF NOT cl_null(g_apca_m.apca007) THEN
               #IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_apca_m.apca007 != g_apca_m_t.apca007 OR g_apca_m_t.apca007 IS NULL )) THEN #160726-00020#10 mark 
               IF g_apca_m.apca007 != g_apca_m_o.apca007 OR cl_null(g_apca_m_o.apca007) THEN                                     #160726-00020#10
                  IF NOT s_azzi650_chk_exist('3211',g_apca_m.apca007) THEN
                     #LET g_apca_m.apca007  = g_apca_m_t.apca007           #160726-00020#10 mark
                     LET g_apca_m.apca007  = g_apca_m_o.apca007            #160726-00020#10
                     CALL s_desc_get_acc_desc('3211',g_apca_m.apca007) RETURNING g_apca_m.apca007_desc
                     DISPLAY BY NAME g_apca_m.apca007_desc
                     NEXT FIELD CURRENT
                  END IF
                  CASE g_apca_m.apca001
                     WHEN '01'   LET g_glab003 = '8504_01'
                     WHEN '02'   LET g_glab003 = '8504_24'
                     #151215-00013#3 add --start--
                     WHEN '03'   LET g_glab003 = '8504_02' #採購費用科目
                     WHEN '04'   LET g_glab003 = '8504_24' #折讓科目
                     #151215-00013#3 add --end--
                  END CASE
                  #160420-00013#1--(S)
                  LET g_apca_m.apca036 = ''   #160726-00020#10
                  LET g_apca_m.apca035 = ''   #160726-00020#10
                  CALL s_aap_apca007_chk(g_apca_m.apcald,g_apca_m.apca007) RETURNING g_sub_success,g_errno
                  IF NOT g_sub_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     #LET g_apca_m.apca007  = g_apca_m_t.apca007           #160726-00020#10 mark
                     LET g_apca_m.apca007  = g_apca_m_o.apca007            #160726-00020#10
                     CALL s_desc_get_acc_desc('3211',g_apca_m.apca007) RETURNING g_apca_m.apca007_desc
                     DISPLAY BY NAME g_apca_m.apca007_desc
                  END IF
                  #160420-00013#1--(E)
                  CALL s_fin_get_account(g_apca_m.apcald,'13',g_apca_m.apca007,g_glab003) RETURNING g_sub_success,g_apca_m.apca036,g_errno  
                  CALL s_fin_get_account(g_apca_m.apcald,'13',g_apca_m.apca007,'8504_22') RETURNING g_sub_success,g_apca_m.apca035,g_errno
                  #140921 apo add str-- #170519-00022#1-s mark
                  #CALL s_aap_glac002_chk(g_apca_m.apca035,g_apca_m.apcald) RETURNING g_sub_success,g_errno
                  #IF NOT g_sub_success THEN LET g_apca_m.apca035 = '' END IF
                  #CALL s_aap_glac002_chk(g_apca_m.apca036,g_apca_m.apcald) RETURNING g_sub_success,g_errno
                  #IF NOT g_sub_success THEN LET g_apca_m.apca036 = '' END IF              
                  #140921 apo add end-- #170519-00022#1-e mark
                  CALL s_desc_get_account_desc(g_apca_m.apcald,g_apca_m.apca035) RETURNING g_apca_m.apca035_desc
                  CALL s_desc_get_account_desc(g_apca_m.apcald,g_apca_m.apca036) RETURNING g_apca_m.apca036_desc
                  DISPLAY BY NAME g_apca_m.apca035_desc,g_apca_m.apca036_desc
               END IF
            END IF   
            CALL s_desc_get_acc_desc('3211',g_apca_m.apca007) RETURNING g_apca_m.apca007_desc
            DISPLAY BY NAME g_apca_m.apca007_desc
            LET g_apca_m_o.* = g_apca_m.*   #160726-00020#10
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca007
            #add-point:BEFORE FIELD apca007 name="input.b.apca007"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca007
            #add-point:ON CHANGE apca007 name="input.g.apca007"
            LET g_apca_m.apca007_desc = ' '
            IF NOT cl_null(g_apca_m.apca007) THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_apca_m.apca007 != g_apca_m_t.apca007 OR g_apca_m_t.apca007 IS NULL )) THEN
                  IF NOT s_azzi650_chk_exist('3211',g_apca_m.apca007) THEN
                     LET g_apca_m.apca007  = g_apca_m_t.apca007
                     CALL s_desc_get_acc_desc('3211',g_apca_m.apca007) RETURNING g_apca_m.apca007_desc
                     DISPLAY BY NAME g_apca_m.apca007_desc
                     NEXT FIELD CURRENT
                  END IF
                  CASE g_apca_m.apca001
                     WHEN '01'   LET g_glab003 = '8504_01'
                     WHEN '02'   LET g_glab003 = '8504_24'
                     #151215-00013#3 add --start--
                     WHEN '03'   LET g_glab003 = '8504_02' #採購費用科目
                     WHEN '04'   LET g_glab003 = '8504_24' #折讓科目
                     #151215-00013#3 add --end--
                  END CASE
                  CALL s_fin_get_account(g_apca_m.apcald,'13',g_apca_m.apca007,g_glab003) RETURNING g_sub_success,g_apca_m.apca036,g_errno  
                  CALL s_fin_get_account(g_apca_m.apcald,'13',g_apca_m.apca007,'8504_22') RETURNING g_sub_success,g_apca_m.apca035,g_errno 
                  CALL s_desc_get_account_desc(g_apca_m.apcald,g_apca_m.apca035) RETURNING g_apca_m.apca035_desc
                  CALL s_desc_get_account_desc(g_apca_m.apcald,g_apca_m.apca036) RETURNING g_apca_m.apca036_desc
                  DISPLAY BY NAME g_apca_m.apca035_desc,g_apca_m.apca036_desc
               END IF
            END IF   
            CALL s_desc_get_acc_desc('3211',g_apca_m.apca007) RETURNING g_apca_m.apca007_desc
            DISPLAY BY NAME g_apca_m.apca007_desc
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca036
            
            #add-point:AFTER FIELD apca036 name="input.a.apca036"
            IF NOT cl_null(g_apca_m.apca036) THEN
              #150916-00015#1 BEGIN    快捷带出类似科目编号     ADD BY XZG20151130
              #{   #151224 mark
               IF s_aglt310_getlike_lc_subject(g_apca_m.apcald,g_apca_m.apca036,'') THEN
                  INITIALIZE g_qryparam.* TO NULL
                  LET g_qryparam.state = 'i'
                  LET g_qryparam.reqry = 'FALSE'
                  LET g_qryparam.default1 = g_apca_m.apca036
                  LET g_qryparam.arg1 = g_glaa.glaa004
                  LET g_qryparam.arg2 = g_apca_m.apca036
                  LET g_qryparam.arg3 = g_apca_m.apcald
                  LET g_qryparam.arg4 = "1"
                  CALL q_glac002_6()
                  LET g_apca_m.apca036 = g_qryparam.return1  
                  CALL s_desc_get_account_desc(g_apca_m.apcald,g_apca_m.apca036) RETURNING g_apca_m.apca036_desc
                  DISPLAY BY NAME g_apca_m.apca036,g_apca_m.apca036_desc
               END IF
               IF NOT s_aglt310_lc_subject(g_apca_m.apcald,g_apca_m.apca036,'N') THEN
                  #LET g_apca_m.apca036 = g_apca_m_t.apca036   #160726-00020#10 mark
                  LET g_apca_m.apca036 = g_apca_m_o.apca036   #160726-00020#10
                   CALL s_desc_get_account_desc(g_apca_m.apcald,g_apca_m.apca036) RETURNING g_apca_m.apca036_desc
                   DISPLAY BY NAME g_apca_m.apca036_desc
                   NEXT FIELD CURRENT
               END IF
              #}     #151224 mark
               #150916-00015#1--(E)
               LET g_apca_m.apca036_desc = ''                                                   #160726-00020#10
               DISPLAY BY NAME g_apca_m.apca036_desc                                            #160726-00020#10
               IF g_apca_m.apca036 != g_apca_m_o.apca036 OR cl_null(g_apca_m_o.apca036) THEN    #160726-00020#10
               #IF g_apca_m.apca036 != g_apca_m_t.apca036 OR g_apca_m_t.apca036 IS NULL THEN    #160726-00020#10 mark
                  CALL s_aap_glac002_chk(g_apca_m.apca036,g_apca_m.apcald) RETURNING g_sub_success,g_errno
                  IF NOT g_sub_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     #160321-00016#21 --s add
                     LET g_errparam.replace[1] = 'agli020'
                     LET g_errparam.replace[2] = cl_get_progname('agli020',g_lang,"2")
                     LET g_errparam.exeprog = 'agli020'
                     #160321-00016#21 --e add
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     #LET g_apca_m.apca036 = g_apca_m_t.apca036     #160726-00020#10 mark
                     LET g_apca_m.apca036 = g_apca_m_o.apca036      #160726-00020#10 
                     CALL s_desc_get_account_desc(g_apca_m.apcald,g_apca_m.apca036) RETURNING g_apca_m.apca036_desc
                     DISPLAY BY NAME g_apca_m.apca036_desc
                     NEXT FIELD CURRENT
                  END IF
                  #160128-00012#1 ---s---
                  SELECT COUNT(*) INTO l_cnt
                    FROM apcb_t 
                   WHERE apcbent = g_enterprise AND apcbld = g_apca_m.apcald
                     AND apcbdocno = g_apca_m.apcadocno
                  IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
                  IF l_cnt > 0 THEN
                     IF cl_ask_confirm('aap-00444') THEN
                        LET l_apcb021_upd = 'Y'
                        #170512-00045#10 add ------
                        #如果單身有資料，就update核算項
                        CALL aglt310_02('d',g_apca_m.apcald,'',g_apca_m.apcadocdt,g_apca_m.apca036,'','aapt320',g_glaq_s[1].*) 
                        RETURNING g_glaq_s[1].glaq017,g_glaq_s[1].glaq018,g_glaq_s[1].glaq019,g_glaq_s[1].glaq020,g_glaq_s[1].glaq021,
                                  g_glaq_s[1].glaq022,g_glaq_s[1].glaq023,g_glaq_s[1].glaq024,g_glaq_s[1].glaq051,g_glaq_s[1].glaq052,
                                  g_glaq_s[1].glaq053,g_glaq_s[1].glaq025,g_glaq_s[1].glaq027,g_glaq_s[1].glaq028,g_glaq_s[1].glaq029,
                                  g_glaq_s[1].glaq030,g_glaq_s[1].glaq031,g_glaq_s[1].glaq032,g_glaq_s[1].glaq033,g_glaq_s[1].glaq034,
                                  g_glaq_s[1].glaq035,g_glaq_s[1].glaq036,g_glaq_s[1].glaq037,g_glaq_s[1].glaq038,g_glaq_s[1].glbc004
                        LET l_item[1] = g_apca_m.apcald
                        LET l_item[2] = g_apca_m.apcadocno
                        LET l_item[3] = ''
                        LET l_item[4] = g_apca_m.apca035
                        CALL s_aapt300_upd_apcb_fix_acc(l_item,g_glaq_s[1].*)
                        #170512-00045#10 add end---
                     ELSE
                        LET l_apcb021_upd = 'N'
                     END IF
                  END IF        
                  #160128-00012#1 ---e---    
               END IF
            END IF
            CALL s_desc_get_account_desc(g_apca_m.apcald,g_apca_m.apca036) RETURNING g_apca_m.apca036_desc
            DISPLAY BY NAME g_apca_m.apca036_desc
            LET g_apca_m_o.* = g_apca_m.*   #160726-00020#10              
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca036
            #add-point:BEFORE FIELD apca036 name="input.b.apca036"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca036
            #add-point:ON CHANGE apca036 name="input.g.apca036"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca035
            
            #add-point:AFTER FIELD apca035 name="input.a.apca035"
            IF NOT cl_null(g_apca_m.apca035) THEN
               #150916-00015#1 BEGIN    快捷带出类似账款科目编号     ADD BY XZG20151130
               #{  #151224 mark
               IF s_aglt310_getlike_lc_subject(g_apca_m.apcald,g_apca_m.apca035,'') THEN
                  INITIALIZE g_qryparam.* TO NULL
                  LET g_qryparam.state = 'i'
                  LET g_qryparam.reqry = 'FALSE'
                  LET g_qryparam.default1 = g_apca_m.apca035
                  LET g_qryparam.arg1 = g_glaa.glaa004
                  LET g_qryparam.arg2 = g_apca_m.apca035
                  LET g_qryparam.arg3 = g_apca_m.apcald
                  LET g_qryparam.arg4 = "1"
                  CALL q_glac002_6()
                  LET g_apca_m.apca035 = g_qryparam.return1  
                  CALL s_desc_get_account_desc(g_apca_m.apcald,g_apca_m.apca035) RETURNING g_apca_m.apca035_desc
                  DISPLAY BY NAME g_apca_m.apca035,g_apca_m.apca035_desc
               END IF
               IF NOT s_aglt310_lc_subject(g_apca_m.apcald,g_apca_m.apca035,'N') THEN
                  #LET g_apca_m.apca035 = g_apca_m_t.apca035     #160726-00020#10 mark
                  LET g_apca_m.apca035 = g_apca_m_o.apca035      #160726-00020#10
                  CALL s_desc_get_account_desc(g_apca_m.apcald,g_apca_m.apca035) RETURNING g_apca_m.apca035_desc
                  DISPLAY BY NAME g_apca_m.apca035_desc
                  NEXT FIELD CURRENT
               END IF
               #}  #151224 mark
               #150916-00015#1--(E)
               LET g_apca_m.apca035_desc = ''                                                  #160726-00020#10
               DISPLAY BY NAME g_apca_m.apca035_desc                                           #160726-00020#10
               #IF g_apca_m.apca035 != g_apca_m_t.apca035 OR g_apca_m_t.apca035 IS NULL THEN   #160726-00020#10 mark
               IF g_apca_m.apca035 != g_apca_m_o.apca035 OR cl_null(g_apca_m_o.apca035) THEN   #160726-00020#10 
                  CALL s_aap_glac002_chk(g_apca_m.apca035,g_apca_m.apcald) RETURNING g_sub_success,g_errno
                  IF NOT g_sub_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     #160321-00016#21 --s add
                     LET g_errparam.replace[1] = 'agli020'
                     LET g_errparam.replace[2] = cl_get_progname('agli020',g_lang,"2")
                     LET g_errparam.exeprog = 'agli020'
                     #160321-00016#21 --e add
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     #LET g_apca_m.apca035 = g_apca_m_t.apca035    #160726-00020#10 mark
                     LET g_apca_m.apca035 = g_apca_m_o.apca035     #160726-00020#10 
                     CALL s_desc_get_account_desc(g_apca_m.apcald,g_apca_m.apca035) RETURNING g_apca_m.apca035_desc
                     DISPLAY BY NAME g_apca_m.apca035_desc
                     NEXT FIELD CURRENT
                  END IF
                  #160128-00012#1 ---s---
                  SELECT COUNT(*) INTO l_cnt
                    FROM apcb_t 
                   WHERE apcbent = g_enterprise AND apcbld = g_apca_m.apcald
                     AND apcbdocno = g_apca_m.apcadocno
                  IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
                  IF l_cnt > 0 THEN
                     IF cl_ask_confirm('aap-00444') THEN
                        LET l_apcb029_upd = 'Y'
                        #170512-00045#10 add ------
                        #如果單身有資料，就update核算項
                        CALL aglt310_02('c',g_apca_m.apcald,'',g_apca_m.apcadocdt,g_apca_m.apca035,'','aapt320',g_glaq_s[2].*) 
                        RETURNING g_glaq_s[2].glaq017,g_glaq_s[2].glaq018,g_glaq_s[2].glaq019,g_glaq_s[2].glaq020,g_glaq_s[2].glaq021,
                                  g_glaq_s[2].glaq022,g_glaq_s[2].glaq023,g_glaq_s[2].glaq024,g_glaq_s[2].glaq051,g_glaq_s[2].glaq052,
                                  g_glaq_s[2].glaq053,g_glaq_s[2].glaq025,g_glaq_s[2].glaq027,g_glaq_s[2].glaq028,g_glaq_s[2].glaq029,
                                  g_glaq_s[2].glaq030,g_glaq_s[2].glaq031,g_glaq_s[2].glaq032,g_glaq_s[2].glaq033,g_glaq_s[2].glaq034,
                                  g_glaq_s[2].glaq035,g_glaq_s[2].glaq036,g_glaq_s[2].glaq037,g_glaq_s[2].glaq038,g_glaq_s[2].glbc004
                        LET l_item[1] = g_apca_m.apcald
                        LET l_item[2] = g_apca_m.apcadocno
                        LET l_item[3] = ''
                        LET l_item[4] = g_apca_m.apca036
                        CALL s_aapt300_upd_apcb_fix_acc(l_item,g_glaq_s[2].*)
                        #170512-00045#10 add end---
                     ELSE
                        LET l_apcb029_upd = 'N'
                     END IF
                  END IF        
                  #160128-00012#1 ---e---
                END IF
            END IF
            CALL s_desc_get_account_desc(g_apca_m.apcald,g_apca_m.apca035) RETURNING g_apca_m.apca035_desc
            DISPLAY BY NAME g_apca_m.apca035_desc   
            LET g_apca_m_o.* = g_apca_m.*   #160726-00020#10
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca035
            #add-point:BEFORE FIELD apca035 name="input.b.apca035"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca035
            #add-point:ON CHANGE apca035 name="input.g.apca035"
           
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca100
            #add-point:BEFORE FIELD apca100 name="input.b.apca100"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca100
            
            #add-point:AFTER FIELD apca100 name="input.a.apca100"
            IF NOT cl_null(g_apca_m.apca100) THEN
               #IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_apca_m.apca100 != g_apca_m_t.apca100 OR g_apca_m_t.apca100 IS NULL )) THEN  #160726-00020#10 mark
               IF g_apca_m.apca100 != g_apca_m_o.apca100 OR cl_null(g_apca_m_o.apca100) THEN                                      #160726-00020#10 
                  CALL s_aap_ooaj001_chk(g_apca_m.apcald,g_apca_m.apca100) RETURNING g_sub_success,g_errno
                  IF NOT g_sub_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     #160321-00016#21 --s add
                     LET g_errparam.replace[1] = 'aooi150'
                     LET g_errparam.replace[2] = cl_get_progname('aooi150',g_lang,"2")
                     LET g_errparam.exeprog = 'aooi150'
                     #160321-00016#21 --e add
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     #LET g_apca_m.apca100 = g_apca_m_t.apca100   #160726-00020#10 mark
                     LET g_apca_m.apca100 = g_apca_m_o.apca100    #160726-00020#10 
                     NEXT FIELD CURRENT
                  END IF
                  IF NOT cl_null(g_apca_m.apcadocdt) AND NOT cl_null(g_apca_m.apca004) THEN
                     LET lc_param.apca004 = g_apca_m.apca004
                     LET ls_js = util.JSON.stringify(lc_param)
                     #160726-00020#10--s
                     LET g_apca_m.apca101 = ''
                     LET g_apca_m.apca121 = ''
                     LET g_apca_m.apca131 = ''
                     #160726-00020#10--e
                     CALL s_fin_get_curr_rate(g_apca_m.apcacomp,g_apca_m.apcald,g_apca_m.apcadocdt,g_apca_m.apca100,ls_js)
                          RETURNING g_apca_m.apca101,g_apca_m.apca121,g_apca_m.apca131
                     IF g_apca_m.apca100 = g_apca_m.glaa001 THEN    #交易幣與本幣相同時
                        LET l_using = FALSE
                     ELSE
                        LET l_using = TRUE
                     END IF
                     CALL cl_set_comp_entry("apca101",l_using)
                     LET g_apca_m.apca1001 = g_apca_m.apca100
                     LET g_apca_m.apca1011 = g_apca_m.apca101
                     DISPLAY BY NAME g_apca_m.apca1001,g_apca_m.apca101,g_apca_m.apca1011,g_apca_m.apca121,g_apca_m.apca131
                  END IF
               END IF
            END IF
            LET g_apca_m_o.* = g_apca_m.*   #160726-00020#10
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca100
            #add-point:ON CHANGE apca100 name="input.g.apca100"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca103
            #add-point:BEFORE FIELD apca103 name="input.b.apca103"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca103
            
            #add-point:AFTER FIELD apca103 name="input.a.apca103"
            IF NOT cl_null(g_apca_m.apca101) AND NOT cl_null(g_apca_m.apca103) THEN
               #IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_apca_m.apca103 != g_apca_m_t.apca103 OR g_apca_m_t.apca103 IS NULL )) THEN   #160726-00020#10 mark
               IF g_apca_m.apca103 != g_apca_m_o.apca103 OR cl_null(g_apca_m_o.apca103) THEN                                       #160726-00020#10 
                  LET g_apca_m.apca108 = ''  #160726-00020#10
                  LET g_apca_m.net108 = ''   #160726-00020#10
                  LET g_apca_m.apca108 = g_apca_m.apca103 - g_apca_m.apca106 + g_apca_m.apca104
                  LET g_apca_m.net108  = g_apca_m.apca108 - g_apca_m.apcc109
                  #計算本幣部分
                  LET l_apcb103 = g_apca_m.apca101 * g_apca_m.apca103
                  IF cl_null(l_apcb103) THEN LET l_apcb103 = 0 END IF
                  LET g_apca_m.apca113 = ''  #160726-00020#10
                  CALL s_curr_round_ld('1',g_apca_m.apcald,g_apca_m.glaa001,l_apcb103,2) RETURNING g_sub_success,g_errno,g_apca_m.apca113
                  LET g_apca_m.apca118 = ''  #160726-00020#10
                  LET g_apca_m.net118 = ''   #160726-00020#10
                  LET g_apca_m.apca118 = g_apca_m.apca113 - g_apca_m.apca116 + g_apca_m.apca114
                  LET g_apca_m.net118  = g_apca_m.apca118 - g_apca_m.apcc119
                  DISPLAY BY NAME g_apca_m.apca108,g_apca_m.apca113,g_apca_m.net108,g_apca_m.apca118,g_apca_m.net118
               END IF
            END IF
            LET g_apca_m_o.* = g_apca_m.*   #160726-00020#10
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca103
            #add-point:ON CHANGE apca103 name="input.g.apca103"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca104
            #add-point:BEFORE FIELD apca104 name="input.b.apca104"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca104
            
            #add-point:AFTER FIELD apca104 name="input.a.apca104"
            IF NOT cl_null(g_apca_m.apca101) AND NOT cl_null(g_apca_m.apca104) THEN
               LET g_apca_m.apca108 = g_apca_m.apca103 - g_apca_m.apca106 + g_apca_m.apca104
               LET g_apca_m.net108  = g_apca_m.apca108 - g_apca_m.apcc109
               LET l_apcb103 = g_apca_m.apca101 * g_apca_m.apca104
               IF cl_null(l_apcb103) THEN LET l_apcb103 = 0 END IF
               CALL s_curr_round_ld('1',g_apca_m.apcald,g_apca_m.glaa001,l_apcb103,2) RETURNING g_sub_success,g_errno,g_apca_m.apca114
               LET g_apca_m.apca118 = g_apca_m.apca113 - g_apca_m.apca116 + g_apca_m.apca114
               LET g_apca_m.net118  = g_apca_m.apca118 - g_apca_m.apcc119
               DISPLAY BY NAME g_apca_m.apca108,g_apca_m.apca113,g_apca_m.net108,
                               g_apca_m.apca114,g_apca_m.apca118,g_apca_m.apca113,g_apca_m.net118
            END IF
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca104
            #add-point:ON CHANGE apca104 name="input.g.apca104"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca106
            #add-point:BEFORE FIELD apca106 name="input.b.apca106"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca106
            
            #add-point:AFTER FIELD apca106 name="input.a.apca106"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca106
            #add-point:ON CHANGE apca106 name="input.g.apca106"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca108
            #add-point:BEFORE FIELD apca108 name="input.b.apca108"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca108
            
            #add-point:AFTER FIELD apca108 name="input.a.apca108"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca108
            #add-point:ON CHANGE apca108 name="input.g.apca108"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcc109
            #add-point:BEFORE FIELD apcc109 name="input.b.apcc109"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcc109
            
            #add-point:AFTER FIELD apcc109 name="input.a.apcc109"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcc109
            #add-point:ON CHANGE apcc109 name="input.g.apcc109"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD net108
            #add-point:BEFORE FIELD net108 name="input.b.net108"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD net108
            
            #add-point:AFTER FIELD net108 name="input.a.net108"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE net108
            #add-point:ON CHANGE net108 name="input.g.net108"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca101
            #add-point:BEFORE FIELD apca101 name="input.b.apca101"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca101
            
            #add-point:AFTER FIELD apca101 name="input.a.apca101"
            #本幣匯率
            IF NOT cl_null(g_apca_m.apca101) THEN
               #IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_apca_m.apca101 != g_apca_m_t.apca101 OR g_apca_m_t.apca101 IS NULL )) THEN    #160726-00020#10 mark
               IF g_apca_m.apca101 != g_apca_m_o.apca101 OR cl_null(g_apca_m_o.apca101) THEN                                        #160726-00020#10 
                  LET l_cnt = 0
                  SELECT count(*) INTO l_cnt FROM apcb_t
                   WHERE apcbent  = g_enterprise AND apcbld = g_apca_m.apcald
                     AND apcbdocno = g_apca_m.apcadocno
                  IF l_cnt > 0 THEN
                     IF NOT cl_ask_confirm('aap-00058') THEN
                        #LET g_apca_m.apca101 = g_apca_m_t.apca101     #160726-00020#10 mark
                        LET g_apca_m.apca101 = g_apca_m_o.apca101      #160726-00020#10 
                        DISPLAY BY NAME g_apca_m.apca101
                        RETURN
                     END IF   
                  END IF
                  #CALL s_curr_round_ld('1',g_apca_m.apcald,g_apca_m.glaa001,g_apca_m.apca101,3) RETURNING g_sub_success,g_errno,g_apca_m.apca101   #160707-00030#1 mark
                  CALL s_curr_round_ld('1',g_apca_m.apcald,g_apca_m.apca100,g_apca_m.apca101,3) RETURNING g_sub_success,g_errno,g_apca_m.apca101   #160707-00030#1 add
                  
                  IF NOT cl_null(g_apca_m.apca103) THEN    #原幣未稅金額
                     LET l_apcb103 = g_apca_m.apca101 * g_apca_m.apca103
                     IF cl_null(l_apcb103) THEN LET l_apcb103 = 0 END IF
                     LET g_apca_m.apca113 = ''   #160726-00020#10
                     CALL s_curr_round_ld('1',g_apca_m.apcald,g_apca_m.glaa001,l_apcb103,2) RETURNING g_sub_success,g_errno,g_apca_m.apca113
                  END IF
                  IF NOT cl_null(g_apca_m.apca104) THEN    #原幣稅額
                     LET l_apcb103 = g_apca_m.apca101 * g_apca_m.apca104
                     IF cl_null(l_apcb103) THEN LET l_apcb103 = 0 END IF
                     LET g_apca_m.apca114 = ''   #160726-00020#10
                     CALL s_curr_round_ld('1',g_apca_m.apcald,g_apca_m.glaa001,l_apcb103,2) RETURNING g_sub_success,g_errno,g_apca_m.apca114
                  END IF
                  DISPLAY BY NAME g_apca_m.apca113,g_apca_m.apca114
               END IF
            END IF
            LET g_apca_m_o.* = g_apca_m.*   #160726-00020#10
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca101
            #add-point:ON CHANGE apca101 name="input.g.apca101"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca113
            #add-point:BEFORE FIELD apca113 name="input.b.apca113"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca113
            
            #add-point:AFTER FIELD apca113 name="input.a.apca113"
            #本幣未稅金額
            IF NOT cl_null(g_apca_m.apca113) THEN
               #IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_apca_m.apca113 != g_apca_m_t.apca113 OR g_apca_m_t.apca113 IS NULL )) THEN   #160726-00020#10 mark
               IF g_apca_m.apca113 != g_apca_m_o.apca113 OR cl_null(g_apca_m_o.apca113) THEN                                       #160726-00020#10
                  LET g_apca_m.apca118 = ''   #160726-00020#10
                  LET g_apca_m.net118 = ''    #160726-00020#10
                  LET g_apca_m.apca118 = g_apca_m.apca113 - g_apca_m.apca116 + g_apca_m.apca114
                  LET g_apca_m.net118  = g_apca_m.apca118 - g_apca_m.apcc119
                  DISPLAY BY NAME g_apca_m.apca118,g_apca_m.net118
               END IF
            END IF
            LET g_apca_m_o.* = g_apca_m.*   #160726-00020#10
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca113
            #add-point:ON CHANGE apca113 name="input.g.apca113"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca114
            #add-point:BEFORE FIELD apca114 name="input.b.apca114"
            #160726-00020#10--s
            #本幣稅額
            IF NOT cl_null(g_apca_m.apca114) THEN
              #IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_apca_m.apca114 != g_apca_m_t.apca114 OR g_apca_m_t.apca114 IS NULL )) THEN   #160726-00020#10 mark
               IF g_apca_m.apca114 != g_apca_m_o.apca114 OR cl_null(g_apca_m_o.apca114) THEN                                      #160726-00020#10     
                  LET g_apca_m.apca118 = g_apca_m.apca113 - g_apca_m.apca116 + g_apca_m.apca114
                  LET g_apca_m.net118  = g_apca_m.apca118 - g_apca_m.apcc119
                  DISPLAY BY NAME g_apca_m.apca118,g_apca_m.net118                  
               END IF
            END IF
            LET g_apca_m_o.* = g_apca_m.*
            #160726-00020#10--e
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca114
            
            #add-point:AFTER FIELD apca114 name="input.a.apca114"
 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca114
            #add-point:ON CHANGE apca114 name="input.g.apca114"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca116
            #add-point:BEFORE FIELD apca116 name="input.b.apca116"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca116
            
            #add-point:AFTER FIELD apca116 name="input.a.apca116"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca116
            #add-point:ON CHANGE apca116 name="input.g.apca116"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcc113
            #add-point:BEFORE FIELD apcc113 name="input.b.apcc113"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcc113
            
            #add-point:AFTER FIELD apcc113 name="input.a.apcc113"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcc113
            #add-point:ON CHANGE apcc113 name="input.g.apcc113"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca118
            #add-point:BEFORE FIELD apca118 name="input.b.apca118"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca118
            
            #add-point:AFTER FIELD apca118 name="input.a.apca118"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca118
            #add-point:ON CHANGE apca118 name="input.g.apca118"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcc119
            #add-point:BEFORE FIELD apcc119 name="input.b.apcc119"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcc119
            
            #add-point:AFTER FIELD apcc119 name="input.a.apcc119"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcc119
            #add-point:ON CHANGE apcc119 name="input.g.apcc119"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD net118
            #add-point:BEFORE FIELD net118 name="input.b.net118"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD net118
            
            #add-point:AFTER FIELD net118 name="input.a.net118"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE net118
            #add-point:ON CHANGE net118 name="input.g.net118"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca039
            #add-point:BEFORE FIELD apca039 name="input.b.apca039"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca039
            
            #add-point:AFTER FIELD apca039 name="input.a.apca039"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca039
            #add-point:ON CHANGE apca039 name="input.g.apca039"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca056
            #add-point:BEFORE FIELD apca056 name="input.b.apca056"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca056
            
            #add-point:AFTER FIELD apca056 name="input.a.apca056"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca056
            #add-point:ON CHANGE apca056 name="input.g.apca056"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca016
            #add-point:BEFORE FIELD apca016 name="input.b.apca016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca016
            
            #add-point:AFTER FIELD apca016 name="input.a.apca016"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca016
            #add-point:ON CHANGE apca016 name="input.g.apca016"
            #170616-00008#1 --s add
            LET g_apca_m.apca018 = '' 
            DISPlAY BY NAME  g_apca_m.apca018
            #170616-00008#1 --e add
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca055
            
            #add-point:AFTER FIELD apca055 name="input.a.apca055"
            LET g_apca_m.apca055_desc = ' '
            IF NOT cl_null(g_apca_m.apca055) THEN
               #IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_apca_m.apca055 != g_apca_m_t.apca055 OR g_apca_m_t.apca055 IS NULL )) THEN #160726-00020#8 mark
               IF g_apca_m.apca055 != g_apca_m_o.apca055 OR cl_null(g_apca_m_o.apca055) THEN #160726-00020#8
                  CALL s_aap_ooid001_chk(g_apca_m.apca055) RETURNING g_sub_success,g_errno
                  IF NOT g_sub_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     #160321-00016#21 --s add
                     LET g_errparam.replace[1] = 'aooi717'
                     LET g_errparam.replace[2] = cl_get_progname('aooi717',g_lang,"2")
                     LET g_errparam.exeprog = 'aooi717'
                     #160321-00016#21 --e add
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     #LET g_apca_m.apca055 = g_apca_m_t.apca055  #160726-00020#8 mark 
                     LET g_apca_m.apca055 = g_apca_m_o.apca055  #160726-00020#8
                     CALL s_desc_ooid001_desc(g_apca_m.apca055) RETURNING g_apca_m.apca055_desc
                     DISPLAY BY NAME g_apca_m.apca055_desc
                     NEXT FIELD CURRENT
                  END IF
                  LET g_apca_m_o.apca055 = g_apca_m.apca055   #160726-00020#8
               END IF
            END IF
            CALL s_desc_ooid001_desc(g_apca_m.apca055) RETURNING g_apca_m.apca055_desc
            DISPLAY BY NAME g_apca_m.apca055_desc
            LET g_apca_m_o.* = g_apca_m.*   #160726-00020#10
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca055
            #add-point:BEFORE FIELD apca055 name="input.b.apca055"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca055
            #add-point:ON CHANGE apca055 name="input.g.apca055"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca018
            #add-point:BEFORE FIELD apca018 name="input.b.apca018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca018
            
            #add-point:AFTER FIELD apca018 name="input.a.apca018"
            IF NOT cl_null(g_apca_m.apca018) THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_apca_m.apca018 != g_apca_m_t.apca018 OR g_apca_m_t.apca018 IS NULL )) THEN
                  #160802-00007#2 mark-----s
                  #CALL s_aapt300_source_doc_chk(g_apca_m.apcacomp,g_apca_m.apcasite,g_apca_m.apca004,g_apca_m.apca016,g_apca_m.apca018,'',g_apca_m.apcadocdt,g_apca_m.apcald)
                  #  RETURNING g_sub_success,g_errno
                  #160802-00007#2 mark-----e
                  #160802-00007#2-----s
                  INITIALIZE g_s300ar.* TO NULL
                  LET g_s300ar.apca001 = g_apca_m.apca001
                  LET g_s300ar.apca057 = g_apca_m.apca057
                  LET g_s300ar.apcald  = g_apca_m.apcald
                  LET g_s300ar.apca100 = g_apca_m.apca100 #170616-00008#1 add
                  LET ls_js = util.JSON.stringify(g_s300ar)
                  CALL s_aapt300_source_doc_chk(g_apca_m.apcacomp,g_apca_m.apcasite,g_apca_m.apca004,g_apca_m.apca016,g_apca_m.apca018,'',g_apca_m.apcadocdt,ls_js)
                    RETURNING g_sub_success,g_errno                  
                  #160802-00007#2-----e
                  IF NOT g_sub_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET g_apca_m.apca018 = g_apca_m_t.apca018
                     NEXT FIELD CURRENT
                  END IF
                  #albireo 141117----------------------------------------------------s
                  CALL s_aapt300_source_doc_used_amount_chk_h(g_apca_m.apcald,g_apca_m.apca016,g_apca_m.apca018,'',g_apca_m.apca001,
                                                              g_apca_m.apcadocno,-1,0,'','')
                     RETURNING g_sub_success,g_errno
                  IF NOT g_sub_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET g_apca_m.apca018 = g_apca_m_t.apca018
                     NEXT FIELD CURRENT
                  END IF                     
                  #albireo 141117----------------------------------------------------e
               END IF
            END IF
            #來源單號及來源項次皆有值的時候,應帶入來源單據的預設值
            IF NOT cl_null(g_apca_m.apca016) AND NOT cl_null(g_apca_m.apca018) THEN
               IF g_apca_m_o.apca016 IS NULL OR g_apca_m_o.apca018 IS NULL OR g_apca_m.apca016 != g_apca_m_o.apca016 OR g_apca_m.apca018 != g_apca_m_o.apca018 THEN
                  CALL l_source.clear()
                  CALL s_aapt300_source_doc_carry_h(g_apca_m.apca016,g_apca_m.apca018,g_apca_m.apcacomp,g_apca_m.apcald)
                       RETURNING g_sub_success,g_errno,l_source
                  CALL aapt320_set_default_m(l_source)
                  LET g_apca_m_o.apca016 = g_apca_m.apca016
                  LET g_apca_m_o.apca018 = g_apca_m.apca018
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca018
            #add-point:ON CHANGE apca018 name="input.g.apca018"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca019
            #add-point:BEFORE FIELD apca019 name="input.b.apca019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca019
            
            #add-point:AFTER FIELD apca019 name="input.a.apca019"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca019
            #add-point:ON CHANGE apca019 name="input.g.apca019"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca014
            
            #add-point:AFTER FIELD apca014 name="input.a.apca014"
            #業務人員
            LET g_apca_m.apca014_desc = ''
            IF NOT cl_null(g_apca_m.apca014) THEN
               #IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_apca_m.apca014 != g_apca_m_t.apca014 OR g_apca_m_t.apca014 IS NULL )) THEN  #160726-00020#10 mark
               IF g_apca_m.apca014 != g_apca_m_o.apca014 OR cl_null(g_apca_m_o.apca014) THEN                                      #160726-00020#10
                  LET g_errno = ''
                  CALL s_employee_chk(g_apca_m.apca014) RETURNING g_sub_success
                  IF NOT g_sub_success THEN
                     #LET g_apca_m.apca014 = g_apca_m_t.apca014  #160726-00020#10 mark
                     LET g_apca_m.apca014 = g_apca_m_o.apca014   #160726-00020#10
                     CALL s_desc_get_person_desc(g_apca_m.apca014) RETURNING g_apca_m.apca014_desc
                     DISPLAY BY NAME g_apca_m.apca014_desc
                     NEXT FIELD CURRENT
                  END IF
                  #170518-00001#3 --s add
                  LET g_apca_m.apca015 = ''
                  SELECT ooag003 INTO g_apca_m.apca015 FROM ooag_t
                   WHERE ooagent = g_enterprise AND ooag001 = g_apca_m.apca014   
                  CALL s_desc_get_department_desc(g_apca_m.apca015) RETURNING g_apca_m.apca015_desc  
                  DISPLAY BY NAME g_apca_m.apca015,g_apca_m.apca015_desc            
                  
                  IF NOT cl_null(g_apca_m.apca015) THEN
                     #更新責任中心
                     LET g_apca_m.apca034 = ''   
                     CALL s_department_get_respon_center(g_apca_m.apca015,g_apca_m.apcadocdt)
                      RETURNING g_sub_success,g_errno,g_apca_m.apca034,g_apca_m.apca034_desc
                     IF NOT g_sub_success THEN
                        LET g_apca_m.apca034      = g_apca_m.apca015
                        LET g_apca_m.apca034_desc = g_apca_m.apca015_desc
                     END IF        
                     DISPLAY BY NAME g_apca_m.apca034,g_apca_m.apca034_desc                    
                     
                     #更新單身資料否
                     LET l_cnt = 0
                     SELECT COUNT(apcbseq) INTO l_cnt 
                       FROM apcb_t
                      WHERE apcbent = g_enterprise AND apcbld = g_apca_m.apcald
                        AND apcbdocno = g_apca_m.apcadocno
                     IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF   
                     IF l_cnt > 0 THEN  
                        IF cl_ask_confirm('aap-00409') THEN
                           UPDATE apcb_t
                             SET apcb010 = g_apca_m.apca015
                           WHERE apcbent = g_enterprise AND apcbdocno = g_apca_m.apcadocno
                           CALL aapt320_b_fill()                     
                        END IF
                     END IF     
                  END IF                          
                  #170518-00001#3 --e add                  
               END IF
               #170518-00001#3 --s mark 往上搬,異動人員都要重帶
               ##160726-00020#14---(S)
               #IF cl_null(g_apca_m.apca015) THEN
               #   SELECT ooag003 INTO g_apca_m.apca015 FROM ooag_t
               #    WHERE ooagent = g_enterprise AND ooag001 = g_apca_m.apca014
               #END IF
               ##160726-00020#14---(E)
               #CALL s_desc_get_department_desc(g_apca_m.apca015) RETURNING g_apca_m.apca015_desc #170519-00022#1 add
               #170518-00001#3 --e mark
            END IF
            CALL s_desc_get_person_desc(g_apca_m.apca014) RETURNING g_apca_m.apca014_desc
            DISPLAY BY NAME g_apca_m.apca014_desc
            DISPLAY BY NAME g_apca_m.apca015_desc #170519-00022#1 add
            LET g_apca_m_o.* = g_apca_m.*   #160726-00020#10            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca014
            #add-point:BEFORE FIELD apca014 name="input.b.apca014"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca014
            #add-point:ON CHANGE apca014 name="input.g.apca014"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca054
            
            #add-point:AFTER FIELD apca054 name="input.a.apca054"
            #多帳期檢核
            LET g_apca_m.apca054_desc = ' '
            IF NOT cl_null(g_apca_m.apca054) THEN
               #IF p_cmd = 'a' OR (p_cmd = 'u' AND ((g_apca_m.apca054 != g_apca_m_t.apca054 OR g_apca_m_t.apca054 IS NULL ) )) THEN #160726-00020#8 mark
               IF g_apca_m.apca054 != g_apca_m_o.apca054 OR cl_null(g_apca_m_o.apca054) THEN  #160726-00020#8
                  IF NOT s_azzi650_chk_exist('3114',g_apca_m.apca054) THEN
                     #LET g_apca_m.apca054 = g_apca_m_t.apca054   #160726-00020#8 mark
                     LET g_apca_m.apca054 = g_apca_m_o.apca054   #160726-00020#8
                     CALL s_desc_get_acc_desc('3114',g_apca_m.apca054) RETURNING g_apca_m.apca054_desc
                     DISPLAY BY NAME g_apca_m.apca054_desc
                     NEXT FIELD CURRENT
                  END IF
                  LET g_apca_m_o.apca054 = g_apca_m.apca054   #160726-00020#8
               END IF
            END IF
            CALL s_desc_get_acc_desc('3114',g_apca_m.apca054) RETURNING g_apca_m.apca054_desc
            DISPLAY BY NAME g_apca_m.apca054_desc
            LET g_apca_m_o.* = g_apca_m.*   #160726-00020#10
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca054
            #add-point:BEFORE FIELD apca054 name="input.b.apca054"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca054
            #add-point:ON CHANGE apca054 name="input.g.apca054"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca015
            
            #add-point:AFTER FIELD apca015 name="input.a.apca015"
            #業務部門
            LET g_apca_m.apca015_desc = ''
            IF NOT cl_null(g_apca_m.apca015) THEN
               #IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_apca_m.apca015 != g_apca_m_t.apca015 OR g_apca_m_t.apca015 IS NULL )) THEN   #160726-00020#10 mark
               IF g_apca_m.apca015 != g_apca_m_o.apca015 OR cl_null(g_apca_m_o.apca015) THEN                                       #160726-00020#10
                  LET g_errno = ''
                  CALL s_department_chk(g_apca_m.apca015,g_apca_m.apcadocdt) RETURNING g_sub_success
                  IF NOT g_sub_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     #160321-00016#21 --s add
                     LET g_errparam.replace[1] = 'aooi125'
                     LET g_errparam.replace[2] = cl_get_progname('aooi125',g_lang,"2")
                     LET g_errparam.exeprog = 'aooi125'
                     #160321-00016#21 --e add
                     #LET g_errparam.popup = TRUE #170519-00022#1 mark
                     LET g_errparam.popup = FALSE #170519-00022#1 add
                     CALL cl_err() 

                     #LET g_apca_m.apca015 = g_apca_m_t.apca015     #160726-00020#10 mark
                     LET g_apca_m.apca015 = g_apca_m_o.apca015      #160726-00020#10
                     CALL s_desc_get_department_desc(g_apca_m.apca015) RETURNING g_apca_m.apca015_desc
                     DISPLAY BY NAME g_apca_m.apca015_desc
                     NEXT FIELD CURRENT
                  END IF
                  #151013-00016#15---s---
                  IF cl_ask_confirm('aap-00409') THEN
                     UPDATE apcb_t
                       SET apcb010 = g_apca_m.apca015
                     WHERE apcbent = g_enterprise AND apcbdocno = g_apca_m.apcadocno
                     CALL aapt320_b_fill()                     
                  END IF
                  #151013-00016#15---e---
                  #160726-00020#10--s #170519-00022#1-s mark
                  #LET g_apca_m.apca034 = ''   
                  #CALL s_department_get_respon_center(g_apca_m.apca015,g_apca_m.apcadocdt)
                  # RETURNING g_sub_success,g_errno,g_apca_m.apca034,g_apca_m.apca034_desc
                  #IF NOT g_sub_success THEN
                  #   LET g_apca_m.apca034      = g_apca_m.apca015
                  #   LET g_apca_m.apca034_desc = g_apca_m.apca015_desc
                  #END IF        
                  #DISPLAY BY NAME g_apca_m.apca034,g_apca_m.apca034_desc
                  #LET g_apca_m_o.* = g_apca_m.*   
                  #160726-00020#10--e #170519-00022#1-e mark
               END IF
               #160726-00020#10 mark--s
               #CALL s_department_get_respon_center(g_apca_m.apca015,g_apca_m.apcadocdt)
               #   RETURNING g_sub_success,g_errno,g_apca_m.apca034,g_apca_m.apca034_desc
               #IF NOT g_sub_success THEN
               #   LET g_apca_m.apca034      = g_apca_m.apca015
               #   LET g_apca_m.apca034_desc = g_apca_m.apca015_desc
               #END IF
               #DISPLAY BY NAME g_apca_m.apca034,g_apca_m.apca034_desc
               #END IF
               #160726-00020#10 mark--e
            END IF   
            CALL s_desc_get_department_desc(g_apca_m.apca015) RETURNING g_apca_m.apca015_desc
            DISPLAY BY NAME g_apca_m.apca015_desc
            #170519-00022#1-s add
            LET g_apca_m.apca034 = ''   
            CALL s_department_get_respon_center(g_apca_m.apca015,g_apca_m.apcadocdt)
             RETURNING g_sub_success,g_errno,g_apca_m.apca034,g_apca_m.apca034_desc
            IF NOT g_sub_success THEN
               LET g_apca_m.apca034      = g_apca_m.apca015
               LET g_apca_m.apca034_desc = g_apca_m.apca015_desc
            END IF        
            DISPLAY BY NAME g_apca_m.apca034,g_apca_m.apca034_desc
            LET g_apca_m_o.* = g_apca_m.*   
            #170519-00022#1-e add
            
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca015
            #add-point:BEFORE FIELD apca015 name="input.b.apca015"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca015
            #add-point:ON CHANGE apca015 name="input.g.apca015"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca034
            
            #add-point:AFTER FIELD apca034 name="input.a.apca034"
            #責任中心
            LET g_apca_m.apca034_desc = ' '
            IF NOT cl_null(g_apca_m.apca034) THEN
               #IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_apca_m.apca034 != g_apca_m_t.apca034 OR g_apca_m_t.apca034 IS NULL )) THEN   #160726-00020#10 mark
               IF g_apca_m.apca034 != g_apca_m_o.apca034 OR cl_null(g_apca_m_o.apca034) THEN                                       #160726-00020#10
                  LET g_errno = ''
                  #CALL s_voucher_glaq018_chk(g_apca_m.apca034,g_apca_m.apcadocdt) #170329-00074#1 mark
                  CALL s_voucher_glaq019_chk(g_apca_m.apca034,g_apca_m.apcadocdt)  #170329-00074#1 add
                  IF NOT cl_null(g_errno) THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     #160321-00016#21 --s add
                     LET g_errparam.replace[1] = 'aooi125'
                     LET g_errparam.replace[2] = cl_get_progname('aooi125',g_lang,"2")
                     LET g_errparam.exeprog = 'aooi125'
                     #160321-00016#21 --e add
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     #LET g_apca_m.apca034 = g_apca_m_t.apca034   #160726-00020#10 mark
                     LET g_apca_m.apca034 = g_apca_m_o.apca034    #160726-00020#10 
                     CALL s_desc_get_department_desc(g_apca_m.apca034) RETURNING g_apca_m.apca034_desc
                     DISPLAY BY NAME g_apca_m.apca034_desc
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            CALL s_desc_get_department_desc(g_apca_m.apca034) RETURNING g_apca_m.apca034_desc
            DISPLAY BY NAME g_apca_m.apca034_desc
            LET g_apca_m_o.* = g_apca_m.*   #160726-00020#10
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca034
            #add-point:BEFORE FIELD apca034 name="input.b.apca034"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca034
            #add-point:ON CHANGE apca034 name="input.g.apca034"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca033
            
            #add-point:AFTER FIELD apca033 name="input.a.apca033"
            #專案編號
            LET g_apca_m.apca033_desc = ' '
            IF NOT cl_null(g_apca_m.apca033) THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND ((g_apca_m.apca033 != g_apca_m_t.apca033 OR g_apca_m_t.apca033 IS NULL ) )) THEN
                  CALL s_aap_project_chk(g_apca_m.apca033) RETURNING g_sub_success,g_errno
                  IF NOT g_sub_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     #160321-00016#21 --s add
                     LET g_errparam.replace[1] = 'apjm200'
                     LET g_errparam.replace[2] = cl_get_progname('apjm200',g_lang,"2")
                     LET g_errparam.exeprog = 'apjm200'
                     #160321-00016#21 --e add
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET g_apca_m.apca033 = g_apca_m_t.apca033
                     CALL s_desc_get_project_desc(g_apca_m.apca033) RETURNING　g_apca_m.apca033_desc
                     DISPLAY BY NAME g_apca_m.apca033_desc
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF           
            CALL s_desc_get_project_desc(g_apca_m.apca033) RETURNING　g_apca_m.apca033_desc
            DISPLAY BY NAME g_apca_m.apca033_desc      
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca033
            #add-point:BEFORE FIELD apca033 name="input.b.apca033"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca033
            #add-point:ON CHANGE apca033 name="input.g.apca033"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca058
            
            #add-point:AFTER FIELD apca058 name="input.a.apca058"
            LET g_apca_m.apca058_desc = ' '
            IF NOT cl_null(g_apca_m.apca058) THEN
               #IF p_cmd = 'a' OR (p_cmd = 'u' AND ((g_apca_m.apca058 != g_apca_m_t.apca058 OR g_apca_m_t.apca058 IS NULL ) )) THEN   #160726-00020#10 mark
               IF g_apca_m.apca058 != g_apca_m_o.apca058 OR cl_null(g_apca_m_o.apca058) THEN                                          #160726-00020#10 
                  IF NOT s_azzi650_chk_exist('264',g_apca_m.apca058) THEN
                     #LET g_apca_m.apca058 = g_apca_m_t.apca058     #160726-00020#10 mark
                     LET g_apca_m.apca058 = g_apca_m_o.apca058      #160726-00020#10
                     CALL s_desc_get_acc_desc('264',g_apca_m.apca058) RETURNING g_apca_m.apca058_desc
                     DISPLAY BY NAME g_apca_m.apca058_desc
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            CALL s_desc_get_acc_desc('264',g_apca_m.apca058) RETURNING g_apca_m.apca058_desc
            DISPLAY BY NAME g_apca_m.apca058_desc
            LET g_apca_m_o.* = g_apca_m.*   #160726-00020#10
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca058
            #add-point:BEFORE FIELD apca058 name="input.b.apca058"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca058
            #add-point:ON CHANGE apca058 name="input.g.apca058"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca059
            
            #add-point:AFTER FIELD apca059 name="input.a.apca059"
            #預算項目
            LET g_apca_m.apca059_desc = ''
            IF NOT cl_null(g_apca_m.apca059) THEN
               #IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_apca_m.apca059 != g_apca_m_t.apca059 OR g_apca_m_t.apca059 IS NULL )) THEN   #160726-00020#8 mark
               IF g_apca_m.apca059 != g_apca_m_o.apca059 OR cl_null(g_apca_m_o.apca059) THEN    #160726-00020#8
                  CALL s_fin_budget_chk(g_apca_m.apca059) RETURNING g_sub_success,g_errno
                  IF NOT g_sub_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     #160321-00016#21 --s add
                     LET g_errparam.replace[1] = 'abgi040'
                     LET g_errparam.replace[2] = cl_get_progname('abgi040',g_lang,"2")
                     LET g_errparam.exeprog = 'abgi040'
                     #160321-00016#21 --e add
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     #LET g_apca_m.apca059 = g_apca_m_t.apca059   #160726-00020#8 mark
                     LET g_apca_m.apca059 = g_apca_m_o.apca059    #160726-00020#8
                     CALL s_desc_get_budget_desc(g_apca_m.apca059) RETURNING g_apca_m.apca059_desc
                     DISPLAY BY NAME g_apca_m.apca059_desc
                     NEXT FIELD CURRENT
                  END IF
                  LET g_apca_m_o.apca059 = g_apca_m.apca059    #160726-00020#8
               END IF
            END IF
            CALL s_desc_get_budget_desc(g_apca_m.apca059) RETURNING g_apca_m.apca059_desc
            DISPLAY BY NAME g_apca_m.apca059_desc
            LET g_apca_m_o.* = g_apca_m.*   #160726-00020#10
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca059
            #add-point:BEFORE FIELD apca059 name="input.b.apca059"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca059
            #add-point:ON CHANGE apca059 name="input.g.apca059"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca063
            #add-point:BEFORE FIELD apca063 name="input.b.apca063"
 
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca063
            
            #add-point:AFTER FIELD apca063 name="input.a.apca063"
            #add--2015/05/15 By shiun--(S)
            IF NOT cl_null(g_apca_m.apca063) THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_apca_m.apca063 != g_apca_m_t.apca063 OR g_apca_m_t.apca063 IS NULL )) THEN
                  IF NOT s_aooi390_chk('14',g_apca_m.apca063) THEN
                     LET g_apca_m.apca063 = g_apca_m_t.apca063
                     DISPLAY BY NAME g_apca_m.apca063
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            #add--2015/05/15 By shiun--(E)
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca063
            #add-point:ON CHANGE apca063 name="input.g.apca063"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca050
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_apca_m.apca050,"0","1","","","azz-00079",1) THEN
               NEXT FIELD apca050
            END IF 
 
 
 
            #add-point:AFTER FIELD apca050 name="input.a.apca050"
            LET g_apca_m.apca0501 = g_apca_m.apca050
            LET g_apca_m.apca039  = g_apca_m.apca050
            DISPLAY BY NAME g_apca_m.apca039,g_apca_m.apca0501
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca050
            #add-point:BEFORE FIELD apca050 name="input.b.apca050"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca050
            #add-point:ON CHANGE apca050 name="input.g.apca050"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca051
            
            #add-point:AFTER FIELD apca051 name="input.a.apca051"
            LET g_apca_m.apca051_desc = ' '
            IF NOT cl_null(g_apca_m.apca051) THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND ((g_apca_m.apca051 != g_apca_m_t.apca051 OR g_apca_m_t.apca051 IS NULL ) )) THEN
                  IF NOT s_azzi650_chk_exist('3115',g_apca_m.apca051) THEN
                     LET g_apca_m.apca051 = g_apca_m_t.apca051
                     CALL s_desc_get_acc_desc('3115',g_apca_m.apca051) RETURNING g_apca_m.apca051_desc
                     DISPLAY BY NAME g_apca_m.apca051_desc
                     NEXT FIELD CURRENT
                  END IF
               END IF
            ELSE
               NEXT FIELD CURRENT 
            END IF
            CALL s_desc_get_acc_desc('3115',g_apca_m.apca058) RETURNING g_apca_m.apca051_desc
            DISPLAY BY NAME g_apca_m.apca051_desc   
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca051
            #add-point:BEFORE FIELD apca051 name="input.b.apca051"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca051
            #add-point:ON CHANGE apca051 name="input.g.apca051"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca053
            #add-point:BEFORE FIELD apca053 name="input.b.apca053"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca053
            
            #add-point:AFTER FIELD apca053 name="input.a.apca053"
    
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca053
            #add-point:ON CHANGE apca053 name="input.g.apca053"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca025
            #add-point:BEFORE FIELD apca025 name="input.b.apca025"
            IF cl_null(g_apca_m.apca026) THEN LET g_apca_m.apca026=0 END IF
            IF cl_null(g_apca_m.apca027) THEN LET g_apca_m.apca027=0 END IF
            IF cl_null(g_apca_m.apca028) THEN LET g_apca_m.apca028=0 END IF
            IF cl_null(g_apca_m.apca029) THEN LET g_apca_m.apca029=0 END IF
            IF (g_apca_m.apca026+g_apca_m.apca027+g_apca_m.apca028+g_apca_m.apca029=0) THEN
               CALL cl_set_comp_entry("apca025,apca030,apca031",FALSE)
               CALL cl_set_comp_entry("apca026,apca027,apca028,apca029",FALSE)
               LET g_apca_m.apca030 = ''
               LET g_apca_m.apca031 = ''
               DISPLAY BY NAME g_apca_m.apca030
               DISPLAY BY NAME g_apca_m.apca031
            ELSE
               CALL cl_set_comp_entry("apca025",TRUE)
            END IF     
            
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca025
            
            #add-point:AFTER FIELD apca025 name="input.a.apca025"
            IF (g_apca_m.apca025 = '2') THEN
                #差異處理方式＝'2'時,才開放科目欄位輸入。
                CALL cl_set_comp_entry("apca030",FALSE)
            END IF
            IF (g_apca_m.apca025 = '8') THEN
                #差異處理方式＝'5',產生折讓單時, 才可開放輸入,選擇單別
                CALL cl_set_comp_entry("apca031",FALSE)
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca025
            #add-point:ON CHANGE apca025 name="input.g.apca025"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca031
            #add-point:BEFORE FIELD apca031 name="input.b.apca031"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca031
            
            #add-point:AFTER FIELD apca031 name="input.a.apca031"
 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca031
            #add-point:ON CHANGE apca031 name="input.g.apca031"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca030
            
            #add-point:AFTER FIELD apca030 name="input.a.apca030"
            LET g_apca_m.apca030_desc = ' '
            IF NOT cl_null(g_apca_m.apca030) THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_apca_m.apca030 != g_apca_m_t.apca030 OR cl_null(g_apca_m_t.apca030) )) THEN
                  CALL s_aap_glac002_chk(g_apca_m.apca030,g_apca_m.apcald) RETURNING g_sub_success,g_errno
                  IF NOT g_sub_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     #160321-00016#21 --s add
                     LET g_errparam.replace[1] = 'agli020'
                     LET g_errparam.replace[2] = cl_get_progname('agli020',g_lang,"2")
                     LET g_errparam.exeprog = 'agli020'
                     #160321-00016#21 --e add
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET g_apca_m.apca030 = g_apca_m_t.apca030
                     CALL s_desc_get_account_desc(g_apca_m.apcald,g_apca_m.apca030) RETURNING g_apca_m.apca030_desc
                     DISPLAY BY NAME g_apca_m.apca030_desc
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            CALL s_desc_get_account_desc(g_apca_m.apcald,g_apca_m.apca030) RETURNING g_apca_m.apca030_desc
            DISPLAY BY NAME g_apca_m.apca030_desc  
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca030
            #add-point:BEFORE FIELD apca030 name="input.b.apca030"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca030
            #add-point:ON CHANGE apca030 name="input.g.apca030"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca026
            #add-point:BEFORE FIELD apca026 name="input.b.apca026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca026
            
            #add-point:AFTER FIELD apca026 name="input.a.apca026"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca026
            #add-point:ON CHANGE apca026 name="input.g.apca026"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca027
            #add-point:BEFORE FIELD apca027 name="input.b.apca027"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca027
            
            #add-point:AFTER FIELD apca027 name="input.a.apca027"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca027
            #add-point:ON CHANGE apca027 name="input.g.apca027"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca028
            #add-point:BEFORE FIELD apca028 name="input.b.apca028"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca028
            
            #add-point:AFTER FIELD apca028 name="input.a.apca028"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca028
            #add-point:ON CHANGE apca028 name="input.g.apca028"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca029
            #add-point:BEFORE FIELD apca029 name="input.b.apca029"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca029
            
            #add-point:AFTER FIELD apca029 name="input.a.apca029"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca029
            #add-point:ON CHANGE apca029 name="input.g.apca029"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca020
            #add-point:BEFORE FIELD apca020 name="input.b.apca020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca020
            
            #add-point:AFTER FIELD apca020 name="input.a.apca020"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca020
            #add-point:ON CHANGE apca020 name="input.g.apca020"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca021
            #add-point:BEFORE FIELD apca021 name="input.b.apca021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca021
            
            #add-point:AFTER FIELD apca021 name="input.a.apca021"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca021
            #add-point:ON CHANGE apca021 name="input.g.apca021"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca022
            #add-point:BEFORE FIELD apca022 name="input.b.apca022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca022
            
            #add-point:AFTER FIELD apca022 name="input.a.apca022"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca022
            #add-point:ON CHANGE apca022 name="input.g.apca022"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca046
            #add-point:BEFORE FIELD apca046 name="input.b.apca046"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca046
            
            #add-point:AFTER FIELD apca046 name="input.a.apca046"
            LET g_apca_m_o.* = g_apca_m.*   #160726-00020#10 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca046
            #add-point:ON CHANGE apca046 name="input.g.apca046"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca0181
            #add-point:BEFORE FIELD apca0181 name="input.b.apca0181"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca0181
            
            #add-point:AFTER FIELD apca0181 name="input.a.apca0181"
 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca0181
            #add-point:ON CHANGE apca0181 name="input.g.apca0181"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca047
            #add-point:BEFORE FIELD apca047 name="input.b.apca047"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca047
            
            #add-point:AFTER FIELD apca047 name="input.a.apca047"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca047
            #add-point:ON CHANGE apca047 name="input.g.apca047"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca048
            #add-point:BEFORE FIELD apca048 name="input.b.apca048"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca048
            
            #add-point:AFTER FIELD apca048 name="input.a.apca048"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca048
            #add-point:ON CHANGE apca048 name="input.g.apca048"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca1011
            #add-point:BEFORE FIELD apca1011 name="input.b.apca1011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca1011
            
            #add-point:AFTER FIELD apca1011 name="input.a.apca1011"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca1011
            #add-point:ON CHANGE apca1011 name="input.g.apca1011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca121
            #add-point:BEFORE FIELD apca121 name="input.b.apca121"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca121
            
            #add-point:AFTER FIELD apca121 name="input.a.apca121"
            #本位幣二匯率
            IF NOT cl_null(g_apca_m.apca121) THEN
               #IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_apca_m.apca121 != g_apca_m_t.apca121 OR g_apca_m_t.apca121 IS NULL )) THEN    #160726-00020#10 mark
               IF g_apca_m.apca121 != g_apca_m_o.apca121 OR cl_null(g_apca_m_o.apca121) THEN                                        #160726-00020#10 
                  LET l_cnt = 0
                  SELECT count(*) INTO l_cnt FROM apcb_t
                   WHERE apcbent  = g_enterprise AND apcbld = g_apca_m.apcald
                     AND apcbdocno = g_apca_m.apcadocno
                  IF l_cnt > 0 THEN
                     IF NOT cl_ask_confirm('aap-00058') THEN
                        #LET g_apca_m.apca121 = g_apca_m_t.apca121   #160726-00020#10 mark
                        LET g_apca_m.apca121 = g_apca_m_o.apca121    #160726-00020#10 
                        DISPLAY BY NAME g_apca_m.apca121
                        RETURN
                     END IF   
                  END IF
                  #CALL s_curr_round_ld('1',g_apca_m.apcald,g_apca_m.glaa001,g_apca_m.apca121,3) RETURNING g_sub_success,g_errno,g_apca_m.apca121  #160829-00004#1 mark
                  #160829-00004#1--(s)
                  IF g_glaa.glaa015 = 'Y' THEN          
                     #來源幣別
                     IF g_glaa.glaa017 = '1' THEN
                        CALL s_curr_round_ld('1',g_apca_m.apcald,g_apca_m.apca100,g_apca_m.apca121,3) RETURNING g_sub_success,g_errno,g_apca_m.apca121
                     ELSE   #表示帳簿幣別 
                        CALL s_curr_round_ld('1',g_apca_m.apcald,g_apca_m.glaa001,g_apca_m.apca121,3) RETURNING g_sub_success,g_errno,g_apca_m.apca121   #帳套使用幣別
                     END IF
                  END IF
                  #160829-00004#1--(e)
               END IF
            END IF
            LET g_apca_m_o.* = g_apca_m.*   #160726-00020#10
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca121
            #add-point:ON CHANGE apca121 name="input.g.apca121"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apca131
            #add-point:BEFORE FIELD apca131 name="input.b.apca131"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apca131
            
            #add-point:AFTER FIELD apca131 name="input.a.apca131"
            #本位幣三匯率
            IF NOT cl_null(g_apca_m.apca131) THEN
               #IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_apca_m.apca131 != g_apca_m_t.apca131 OR g_apca_m_t.apca131 IS NULL )) THEN   #160726-00020#10 mark
               IF g_apca_m.apca131 != g_apca_m_o.apca131 OR cl_null(g_apca_m_o.apca131) THEN                                       #160726-00020#10
                  LET l_cnt = 0
                  SELECT count(*) INTO l_cnt FROM apcb_t
                   WHERE apcbent  = g_enterprise AND apcbld = g_apca_m.apcald
                     AND apcbdocno = g_apca_m.apcadocno
                  IF l_cnt > 0 THEN
                     IF NOT cl_ask_confirm('aap-00058') THEN
                        #LET g_apca_m.apca131 = g_apca_m_t.apca131   #160726-00020#10 mark
                        LET g_apca_m.apca131 = g_apca_m_o.apca131    #160726-00020#10
                        DISPLAY BY NAME g_apca_m.apca131
                        RETURN
                     END IF   
                  END IF
                  #CALL s_curr_round_ld('1',g_apca_m.apcald,g_apca_m.glaa001,g_apca_m.apca131,3) RETURNING g_sub_success,g_errno,g_apca_m.apca131  #160829-00004#1 mark
                  #160829-00004#1--(s)
                  IF g_glaa.glaa019 = 'Y' THEN 
                     #來源幣別
                     IF g_glaa.glaa021 = '1' THEN 
                        CALL s_curr_round_ld('1',g_apca_m.apcald,g_apca_m.apca100,g_apca_m.apca131,3) RETURNING g_sub_success,g_errno,g_apca_m.apca131               
                     ELSE   #表示帳簿幣別 
                        CALL s_curr_round_ld('1',g_apca_m.apcald,g_apca_m.glaa001,g_apca_m.apca131,3) RETURNING g_sub_success,g_errno,g_apca_m.apca131    #帳套使用幣別
                     END IF
                  END IF
                  #160829-00004#1--(e)
               END IF
            END IF
            LET g_apca_m_o.* = g_apca_m.*   #160726-00020#10
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apca131
            #add-point:ON CHANGE apca131 name="input.g.apca131"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcc123
            #add-point:BEFORE FIELD apcc123 name="input.b.apcc123"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcc123
            
            #add-point:AFTER FIELD apcc123 name="input.a.apcc123"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcc123
            #add-point:ON CHANGE apcc123 name="input.g.apcc123"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcc133
            #add-point:BEFORE FIELD apcc133 name="input.b.apcc133"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcc133
            
            #add-point:AFTER FIELD apcc133 name="input.a.apcc133"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcc133
            #add-point:ON CHANGE apcc133 name="input.g.apcc133"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.apcasite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcasite
            #add-point:ON ACTION controlp INFIELD apcasite name="input.c.apcasite"
            #帳務中心            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apca_m.apcasite
           #LET g_qryparam.where = " ooef201 = 'Y' "            
            #CALL q_ooef001()     #161006-00005#4  mark
            CALL q_ooef001_46()   #161006-00005#4   add                              
            LET g_apca_m.apcasite = g_qryparam.return1        
            CALL s_desc_get_department_desc(g_apca_m.apcasite) RETURNING g_apca_m.apcasite_desc                    
            DISPLAY BY NAME g_apca_m.apcasite,g_apca_m.apcasite_desc
            NEXT FIELD apcasite                          
            #END add-point
 
 
         #Ctrlp:input.c.apca003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca003
            #add-point:ON ACTION controlp INFIELD apca003 name="input.c.apca003"
            #帳務人員            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apca_m.apca003    
            CALL q_ooag001()                                
            LET g_apca_m.apca003 = g_qryparam.return1       
            CALL s_desc_get_person_desc(g_apca_m.apca003) RETURNING g_apca_m.apca003_desc
            DISPLAY BY NAME g_apca_m.apca003,g_apca_m.apca003_desc
            NEXT FIELD apca003                         
            #END add-point
 
 
         #Ctrlp:input.c.apcald
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcald
            #add-point:ON ACTION controlp INFIELD apcald name="input.c.apcald"
            #帳別            
            #開窗i段
            #161014-00053#3 --s add
            #取得帳務組織下所屬成員之帳別   
            CALL s_fin_account_center_comp_str() RETURNING l_comp_wc
            #將取回的字串轉換為SQL條件
            CALL aapt320_get_ooef001_wc(l_comp_wc) RETURNING l_comp_wc
            #161014-00053#3 --e add
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apca_m.apcald                  
            LET g_qryparam.arg1 = g_user                                 #人員權限
            LET g_qryparam.arg2 = g_dept                                 #部門權限
            #LET g_qryparam.where = " glaald IN ",g_wc_apcald CLIPPED                                      #160812-00027#1 mark
            #LET g_qryparam.where = " (glaa008 = 'Y' OR glaa014 = 'Y') AND glaald IN ",g_wc_apcald CLIPPED #160812-00027#1 add #161014-00053#3 mark
            LET g_qryparam.where = " (glaa008 = 'Y' OR glaa014 = 'Y') AND glaacomp IN ",l_comp_wc,""       #161014-00053#3 add
            CALL q_authorised_ld()                                       
            LET g_apca_m.apcald = g_qryparam.return1                     
            CALL s_desc_get_ld_desc(g_apca_m.apcald) RETURNING g_apca_m.apcald_desc
            DISPLAY BY NAME g_apca_m.apcald,g_apca_m.apcald_desc
            NEXT FIELD apcald                                       
            #END add-point
 
 
         #Ctrlp:input.c.apcacomp
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcacomp
            #add-point:ON ACTION controlp INFIELD apcacomp name="input.c.apcacomp"
            
            #END add-point
 
 
         #Ctrlp:input.c.apcadocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcadocno
            #add-point:ON ACTION controlp INFIELD apcadocno name="input.c.apcadocno"
            #單號            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apca_m.apcadocno    
            LET g_qryparam.arg1 = g_glaa.glaa024
            LET g_qryparam.arg2 = g_prog
            #161104-00046#19 --s add
            IF NOT cl_null(g_user_slip_wc)THEN
               LET g_qryparam.where = g_user_slip_wc
            END IF
            #161104-00046#19 --e add            
            CALL q_ooba002_1()
            LET g_apca_m.apcadocno = g_qryparam.return1   
            IF NOT cl_null(g_apca_m.apcadocno) THEN            
               CALL s_aooi200_fin_get_slip_desc(g_apca_m.apcadocno) RETURNING g_apca_m.apcadocno_desc
               CALL s_aooi200_fin_get_slip(g_apca_m.apcadocno) RETURNING g_sub_success,g_ap_slip
               CALL s_fin_get_doc_para(g_apca_m.apcald,g_apca_m.apcacomp,g_ap_slip,g_fin_arg1) RETURNING g_apca_m.apca001
               #170620-00032#1 add(s)
               IF l_cmd_t = 'r' AND p_cmd = 'a' THEN
                  IF cl_null(g_apca_m.apca001) THEN
                     LET g_apca_m.apca001 = g_apca_m_o.apca001
                  ELSE
                     IF g_apca_m.apca001 NOT MATCHES'0[34]'THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = 'aap-00639'
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                        NEXT FIELD CURRENT
                     END IF
                  END IF
               END IF
               #170620-00032#1 add(e)
               DISPLAY BY NAME g_apca_m.apcadocno_desc,g_apca_m.apca001
            END IF
            DISPLAY BY NAME g_apca_m.apcadocno
            NEXT FIELD apcadocno                         
            #END add-point
 
 
         #Ctrlp:input.c.apca001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca001
            #add-point:ON ACTION controlp INFIELD apca001 name="input.c.apca001"
            
            #END add-point
 
 
         #Ctrlp:input.c.apcadocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcadocdt
            #add-point:ON ACTION controlp INFIELD apcadocdt name="input.c.apcadocdt"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca004
            #add-point:ON ACTION controlp INFIELD apca004 name="input.c.apca004"
            #帳款對象編號            
            #開窗i段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apca_m.apca004    
            LET g_qryparam.arg1 = "('1','3')"
            #151231-00010#1(S)
            IF NOT cl_null(g_sql_ctrl) AND NOT g_sql_ctrl = ' 1=1'  THEN
               LET g_qryparam.where = g_sql_ctrl
            END IF
            #151231-00010#1(E)            
            CALL q_pmaa001_1()                                
            LET g_apca_m.apca004 = g_qryparam.return1       
            CALL s_desc_get_trading_partner_abbr_desc(g_apca_m.apca004) RETURNING g_apca_m.apca004_desc
            DISPLAY BY NAME g_apca_m.apca004,g_apca_m.apca004_desc
            IF g_apca_m_o.apca004 IS NULL OR g_apca_m_o.apca004 != g_apca_m.apca004 THEN
               CALL aapt320_get_apca004_info()
               LET g_apca_m_o.apca004 = g_apca_m.apca004
               LET g_apca_m_t.apca005 = g_apca_m.apca005   #151014-00018#5 
            END IF
            
            NEXT FIELD apca004                         
            #END add-point
 
 
         #Ctrlp:input.c.apca005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca005
            #add-point:ON ACTION controlp INFIELD apca005 name="input.c.apca005"
            #付款對象            
            #開窗i段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apca_m.apca005      
            LET g_qryparam.arg1 = g_apca_m.apca004
            LET g_qryparam.arg2 = "1"
            #151231-00010#1(S)
            IF NOT cl_null(g_sql_ctrl) AND NOT g_sql_ctrl = ' 1=1'  THEN
               LET g_qryparam.where = " EXISTS (SELECT 1 FROM pmaa_t ",
                                      "          WHERE pmaaent = ",g_enterprise,
                                      "            AND ",g_sql_ctrl,
                                      "            AND pmaaent = pmacent ",
                                      "            AND pmaa001 = pmac002 )"
            END IF
            #151231-00010#1(E)            
            CALL q_pmac002_1()                                
            LET g_apca_m.apca005 = g_qryparam.return1         
            LET g_apca_m.apca005_desc = g_qryparam.return2    #交易對象簡稱
            DISPLAY BY NAME g_apca_m.apca005,g_apca_m.apca005_desc
            NEXT FIELD apca005                     
            #END add-point
 
 
         #Ctrlp:input.c.apca038
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca038
            #add-point:ON ACTION controlp INFIELD apca038 name="input.c.apca038"
            
            #END add-point
 
 
         #Ctrlp:input.c.apcastus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcastus
            #add-point:ON ACTION controlp INFIELD apcastus name="input.c.apcastus"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca065
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca065
            #add-point:ON ACTION controlp INFIELD apca065 name="input.c.apca065"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca066
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca066
            #add-point:ON ACTION controlp INFIELD apca066 name="input.c.apca066"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca008
            #add-point:ON ACTION controlp INFIELD apca008 name="input.c.apca008"
            #付款條件編號            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apca_m.apca008     
            LET g_qryparam.arg1 =g_apca_m.apca004
            CALL q_pmad002_2()                                
            LET g_apca_m.apca008 = g_qryparam.return1         
            CALL s_desc_get_ooib002_desc(g_apca_m.apca008) RETURNING g_apca_m.apca008_desc
            DISPLAY BY NAME g_apca_m.apca008,g_apca_m.apca008_desc#,g_apca_m.apca009,g_apca_m.apca010
            NEXT FIELD apca008                           
            #END add-point
 
 
         #Ctrlp:input.c.apca009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca009
            #add-point:ON ACTION controlp INFIELD apca009 name="input.c.apca009"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca010
            #add-point:ON ACTION controlp INFIELD apca010 name="input.c.apca010"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca060
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca060
            #add-point:ON ACTION controlp INFIELD apca060 name="input.c.apca060"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca013
            #add-point:ON ACTION controlp INFIELD apca013 name="input.c.apca013"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca012
            #add-point:ON ACTION controlp INFIELD apca012 name="input.c.apca012"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca011
            #add-point:ON ACTION controlp INFIELD apca011 name="input.c.apca011"
            #稅別            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apca_m.apca011                 
            LET g_qryparam.arg1 = g_ooef019                   #稅區
           #LET g_qryparam.where = " oodb004 ='1' AND  oodb008 = '2' "     #160511-00026#1   Mark--(S)
            IF g_sfin3012 = '1' THEN   #不含稅  #160511-00026#1--(S)
               LET g_qryparam.where = " oodb004 ='1' AND oodb008 IN ('2','3') "
            ELSE
               LET g_qryparam.where = " oodb004 ='1' "
            END IF            #160511-00026#1--(E)
            CALL q_oodb002_5()                                
            LET g_apca_m.apca011 = g_qryparam.return1         
            CALL s_tax_chk(g_apca_m.apcacomp,g_apca_m.apca011) RETURNING g_sub_success,l_oodb004,g_apca_m.apca013,g_apca_m.apca012,l_oodb011
            DISPLAY BY NAME g_apca_m.apca011,g_apca_m.apca012,g_apca_m.apca013
            NEXT FIELD apca011                           
            #END add-point
 
 
         #Ctrlp:input.c.apca007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca007
            #add-point:ON ACTION controlp INFIELD apca007 name="input.c.apca007"
            #帳款類別            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apca_m.apca007    
            #LET g_qryparam.arg1 = "3211"        #160420-00013#1 mark
           #CALL q_oocq002()                    #160420-00013#1 mark
            LET g_qryparam.arg1 = g_apca_m.apcald     #160420-00013#1
            CALL q_glab002_1()                        #160420-00013#1                         
            LET g_apca_m.apca007 = g_qryparam.return1       
            CALL s_desc_get_acc_desc('3211',g_apca_m.apca007) RETURNING g_apca_m.apca007_desc
            DISPLAY BY NAME g_apca_m.apca007,g_apca_m.apca007_desc          
            NEXT FIELD apca007                         
            #END add-point
 
 
         #Ctrlp:input.c.apca036
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca036
            #add-point:ON ACTION controlp INFIELD apca036 name="input.c.apca036"
            #費用科目編號            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apca_m.apca036     
            LET g_qryparam.where = "glac001 = '",g_glaa.glaa004,"' AND  glac003 <>'1' " , #glac001(會計科目參照表)/glac003(科目類型)
                                   " AND glac002 IN (SELECT glad001 FROM glad_t,glac_t WHERE glad001= glac002 ",
                                   " AND glacent = gladent ", #161111-00042#2 add
                                   "AND gladld='",g_apca_m.apcald,"' AND gladent='",g_enterprise,"'",
                                   " AND gladstus = 'Y' )"        
          CALL aglt310_04()                                
            LET g_apca_m.apca036 = g_qryparam.return1        
            CALL s_desc_get_account_desc(g_apca_m.apcald,g_apca_m.apca036) RETURNING g_apca_m.apca036_desc
            DISPLAY BY NAME g_apca_m.apca036,g_apca_m.apca036_desc
            NEXT FIELD apca036                          
            #END add-point
 
 
         #Ctrlp:input.c.apca035
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca035
            #add-point:ON ACTION controlp INFIELD apca035 name="input.c.apca035"
            #應付帳款科目編號            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apca_m.apca035     
            LET g_qryparam.where = "glac001 = '",g_glaa.glaa004,"' AND  glac003 <>'1' ",
                                 " AND glac002 IN (SELECT glad001 FROM glad_t,glac_t WHERE glad001= glac002 ",
                                 " AND glacent = gladent ", #161111-00042#2 add
                                   "AND gladld='",g_apca_m.apcald,"' AND gladent='",g_enterprise,"'",
                                   " AND gladstus = 'Y' )"
            CALL aglt310_04()                                
            LET g_apca_m.apca035 = g_qryparam.return1        
            CALL s_desc_get_account_desc(g_apca_m.apcald,g_apca_m.apca035) RETURNING g_apca_m.apca035_desc
            DISPLAY BY NAME g_apca_m.apca035,g_apca_m.apca035_desc
            NEXT FIELD apca035                          
            #END add-point
 
 
         #Ctrlp:input.c.apca100
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca100
            #add-point:ON ACTION controlp INFIELD apca100 name="input.c.apca100"
            #幣別            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apca_m.apca100       
            LET g_qryparam.arg1 = g_apca_m.apcacomp 
            CALL q_ooaj002_1()                                 
            LET g_apca_m.apca100 = g_qryparam.return1          
            DISPLAY BY NAME g_apca_m.apca100
            NEXT FIELD apca100                            
            #END add-point
 
 
         #Ctrlp:input.c.apca103
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca103
            #add-point:ON ACTION controlp INFIELD apca103 name="input.c.apca103"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca104
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca104
            #add-point:ON ACTION controlp INFIELD apca104 name="input.c.apca104"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca106
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca106
            #add-point:ON ACTION controlp INFIELD apca106 name="input.c.apca106"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca108
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca108
            #add-point:ON ACTION controlp INFIELD apca108 name="input.c.apca108"
            
            #END add-point
 
 
         #Ctrlp:input.c.apcc109
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcc109
            #add-point:ON ACTION controlp INFIELD apcc109 name="input.c.apcc109"
            
            #END add-point
 
 
         #Ctrlp:input.c.net108
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD net108
            #add-point:ON ACTION controlp INFIELD net108 name="input.c.net108"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca101
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca101
            #add-point:ON ACTION controlp INFIELD apca101 name="input.c.apca101"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca113
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca113
            #add-point:ON ACTION controlp INFIELD apca113 name="input.c.apca113"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca114
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca114
            #add-point:ON ACTION controlp INFIELD apca114 name="input.c.apca114"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca116
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca116
            #add-point:ON ACTION controlp INFIELD apca116 name="input.c.apca116"
            
            #END add-point
 
 
         #Ctrlp:input.c.apcc113
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcc113
            #add-point:ON ACTION controlp INFIELD apcc113 name="input.c.apcc113"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca118
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca118
            #add-point:ON ACTION controlp INFIELD apca118 name="input.c.apca118"
            
            #END add-point
 
 
         #Ctrlp:input.c.apcc119
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcc119
            #add-point:ON ACTION controlp INFIELD apcc119 name="input.c.apcc119"
            
            #END add-point
 
 
         #Ctrlp:input.c.net118
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD net118
            #add-point:ON ACTION controlp INFIELD net118 name="input.c.net118"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca039
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca039
            #add-point:ON ACTION controlp INFIELD apca039 name="input.c.apca039"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca056
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca056
            #add-point:ON ACTION controlp INFIELD apca056 name="input.c.apca056"
 
            #END add-point
 
 
         #Ctrlp:input.c.apca016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca016
            #add-point:ON ACTION controlp INFIELD apca016 name="input.c.apca016"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca055
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca055
            #add-point:ON ACTION controlp INFIELD apca055 name="input.c.apca055"
            #繳款優惠設定            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apca_m.apca055      
            CALL q_ooid001_1()                                
            LET g_apca_m.apca055 = g_qryparam.return1         
            CALL s_desc_ooid001_desc(g_apca_m.apca055) RETURNING g_apca_m.apca055_desc
            DISPLAY BY NAME g_apca_m.apca055,g_apca_m.apca055_desc
            NEXT FIELD apca055                           
            #END add-point
 
 
         #Ctrlp:input.c.apca018
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca018
            #add-point:ON ACTION controlp INFIELD apca018 name="input.c.apca018"
            #來源參考單號
            #開窗i段
            #140806-00012#10 add ------
            CALL l_wc_ar.clear()
            LET l_wc_ar[1] = g_apca_m.apca100      #幣別
            LET l_wc_ar[2] = g_apca_m.apca011      #稅別
            #140806-00012#10 add end---
            #160802-00007#2 mark-----s
            #CALL s_aapt300_source_doc_query_h(g_apca_m.apca016,g_apca_m.apca018,g_wc_apcasite,g_apca_m.apcald,g_apca_m.apcadocdt,g_apca_m.apca004,g_apca_m.apca001,l_wc_ar)
            #     RETURNING g_apca_m.apca018
            #160802-00007#2 mark-----e
            #160802-00007#2-----s
            INITIALIZE g_s300ar.* TO NULL
            LET g_s300ar.apca001 = g_apca_m.apca001
            LET g_s300ar.apca057 = g_apca_m.apca057
            LET g_s300ar.apcald  = g_apca_m.apcald
            LET ls_js = util.JSON.stringify(g_s300ar)
            CALL s_aapt300_source_doc_query_h(g_apca_m.apca016,g_apca_m.apca018,g_wc_apcasite,g_apca_m.apcald,g_apca_m.apcadocdt,g_apca_m.apca004,ls_js,l_wc_ar)
                 RETURNING g_apca_m.apca018            
            #160802-00007#2-----e
            NEXT FIELD apca018
            #END add-point
 
 
         #Ctrlp:input.c.apca019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca019
            #add-point:ON ACTION controlp INFIELD apca019 name="input.c.apca019"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca014
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca014
            #add-point:ON ACTION controlp INFIELD apca014 name="input.c.apca014"
            #人員編號            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apca_m.apca014    
            CALL q_ooag001_8()                                
            LET g_apca_m.apca014 = g_qryparam.return1       
            CALL s_desc_get_person_desc(g_apca_m.apca014) RETURNING g_apca_m.apca014_desc
            DISPLAY BY NAME g_apca_m.apca014,g_apca_m.apca014_desc
            NEXT FIELD apca014                         
            #END add-point
 
 
         #Ctrlp:input.c.apca054
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca054
            #add-point:ON ACTION controlp INFIELD apca054 name="input.c.apca054"
            #多帳期設定            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apca_m.apca054    
            LET g_qryparam.arg1 = "3114"                    #應用分類碼
            CALL q_oocq002()                                
            LET g_apca_m.apca054 = g_qryparam.return1       
            CALL s_desc_get_acc_desc('3114',g_apca_m.apca054) RETURNING g_apca_m.apca054_desc
            DISPLAY BY NAME g_apca_m.apca054,g_apca_m.apca054_desc
            NEXT FIELD apca054                         


            #END add-point
 
 
         #Ctrlp:input.c.apca015
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca015
            #add-point:ON ACTION controlp INFIELD apca015 name="input.c.apca015"
            #部門編號            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apca_m.apca015
            LET g_qryparam.arg1 = g_apca_m.apcadocdt          #應以單據日期
            #CALL q_ooeg001_4()        #170814-00012#11  170824 By 10044 mark
            CALL q_ooeg001()           #170814-00012#11  170824 By 10044 add                                
            LET g_apca_m.apca015 = g_qryparam.return1   
            CALL s_department_get_respon_center(g_apca_m.apca015,g_apca_m.apcadocdt)
                 RETURNING g_sub_success,g_errno,g_apca_m.apca034,g_apca_m.apca034_desc
            IF NOT g_sub_success THEN
               LET g_apca_m.apca034      = g_apca_m.apca015
               LET g_apca_m.apca034_desc = g_apca_m.apca015_desc
            END IF               
            CALL s_desc_get_department_desc(g_apca_m.apca015) RETURNING g_apca_m.apca015_desc
            DISPLAY BY NAME g_apca_m.apca015,g_apca_m.apca015_desc,g_apca_m.apca034_desc,g_apca_m.apca034
            NEXT FIELD apca015                           
            #END add-point
 
 
         #Ctrlp:input.c.apca034
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca034
            #add-point:ON ACTION controlp INFIELD apca034 name="input.c.apca034"
            #責任中心            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apca_m.apca034       
            LET g_qryparam.arg1  = g_apca_m.apcadocdt          #生效日期
            #LET g_qryparam.where = " ooeg003 IN ('1','2','3')"   #170329-00074#1 mark
            #CALL q_ooeg001_5()                                   #170329-00074#1 mark
            LET g_qryparam.where = " ooeg003 IN ('2','3','4','5')"#170329-00074#1 add
            CALL q_ooeg001_9()                                    #170329-00074#1 add
            LET g_apca_m.apca034 = g_qryparam.return1          
            CALL s_desc_get_department_desc(g_apca_m.apca034) RETURNING　g_apca_m.apca034_desc
            DISPLAY BY NAME g_apca_m.apca034,g_apca_m.apca034_desc
            NEXT FIELD apca034        　　　　             
            #END add-point
 
 
         #Ctrlp:input.c.apca033
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca033
            #add-point:ON ACTION controlp INFIELD apca033 name="input.c.apca033"
            #專案代號            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apca_m.apca033       
            #CALL q_pjba001()  #170330-00057#8 mark
            CALL q_pjab001_1() #170330-00057#8 add                                    
            LET g_apca_m.apca033 = g_qryparam.return1          
            CALL s_desc_get_project_desc(g_apca_m.apca033) RETURNING　g_apca_m.apca033_desc
            DISPLAY BY NAME g_apca_m.apca033,g_apca_m.apca033_desc
            NEXT FIELD apca033        　　　　             
            #END add-point
 
 
         #Ctrlp:input.c.apca058
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca058
            #add-point:ON ACTION controlp INFIELD apca058 name="input.c.apca058"
            #採購分類
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apca_m.apca058    
            LET g_qryparam.arg1 = "264"                     #給予arg
            CALL q_oocq002()                                
            LET g_apca_m.apca058 = g_qryparam.return1       
            CALL s_desc_get_acc_desc('264',g_apca_m.apca058) RETURNING g_apca_m.apca058_desc
            DISPLAY BY NAME g_apca_m.apca058,g_apca_m.apca058_desc
            NEXT FIELD apca058                         
            #END add-point
 
 
         #Ctrlp:input.c.apca059
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca059
            #add-point:ON ACTION controlp INFIELD apca059 name="input.c.apca059"
            #預算編號            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apca_m.apca059    
            CALL q_bgaa001()                                
            LET g_apca_m.apca059 = g_qryparam.return1       
            CALL s_desc_get_budget_desc(g_apca_m.apca059) RETURNING g_apca_m.apca059_desc
            DISPLAY BY NAME g_apca_m.apca059,g_apca_m.apca059_desc
            NEXT FIELD apca059                     
            #END add-point
 
 
         #Ctrlp:input.c.apca063
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca063
            #add-point:ON ACTION controlp INFIELD apca063 name="input.c.apca063"
           #CALL s_aooi390('14') RETURNING g_sub_success,g_apca_m.apca063                          #150311 mark
#            CALL s_aooi390_auto_no('14') RETURNING g_sub_success,g_apca_m.apca063,l_oofg_return    #150311   #mark--2015/05/15 By shiun
            CALL s_aooi390_gen('14') RETURNING g_sub_success,g_apca_m.apca063,l_oofg_return   #add--2015/05/15 By shiun
            DISPLAY BY NAME g_apca_m.apca063
            NEXT FIELD apca063
            #END add-point
 
 
         #Ctrlp:input.c.apca050
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca050
            #add-point:ON ACTION controlp INFIELD apca050 name="input.c.apca050"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca051
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca051
            #add-point:ON ACTION controlp INFIELD apca051 name="input.c.apca051"
			#作廢
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apca_m.apca051     
            LET g_qryparam.arg1 = "3115"
            CALL q_oocq002()                                 
            LET g_apca_m.apca051 = g_qryparam.return1        
            CALL s_desc_get_acc_desc('3115',g_apca_m.apca058) RETURNING g_apca_m.apca051_desc
            DISPLAY BY NAME g_apca_m.apca051,g_apca_m.apca051_desc            
            NEXT FIELD apca051     
            #END add-point
 
 
         #Ctrlp:input.c.apca053
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca053
            #add-point:ON ACTION controlp INFIELD apca053 name="input.c.apca053"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca025
            #add-point:ON ACTION controlp INFIELD apca025 name="input.c.apca025"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca031
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca031
            #add-point:ON ACTION controlp INFIELD apca031 name="input.c.apca031"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca030
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca030
            #add-point:ON ACTION controlp INFIELD apca030 name="input.c.apca030"
            #161111-00042#2 --s add
            #差異科目
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apca_m.apca030
            LET g_qryparam.where = "glac001 = '",g_glaa.glaa004,"' AND  glac003 <>'1' " , #glac001(會計科目參照表)/glac003(科目類型)
                                   " AND glac002 IN (SELECT glad001 FROM glad_t,glac_t WHERE glad001= glac002 ",
                                   " AND glacent = gladent ",
                                   " AND gladld='",g_apca_m.apcald,"' AND gladent='",g_enterprise,"'",
                                   " AND gladstus = 'Y' )"
            CALL aglt310_04()
            LET g_apca_m.apca030 = g_qryparam.return1     
            CALL s_desc_get_account_desc(g_apca_m.apcald,g_apca_m.apca030) RETURNING g_apca_m.apca030_desc
            DISPLAY BY NAME g_apca_m.apca030,g_apca_m.apca030_desc
            NEXT FIELD apca030
            #161111-00042#2 --e add
            #END add-point
 
 
         #Ctrlp:input.c.apca026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca026
            #add-point:ON ACTION controlp INFIELD apca026 name="input.c.apca026"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca027
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca027
            #add-point:ON ACTION controlp INFIELD apca027 name="input.c.apca027"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca028
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca028
            #add-point:ON ACTION controlp INFIELD apca028 name="input.c.apca028"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca029
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca029
            #add-point:ON ACTION controlp INFIELD apca029 name="input.c.apca029"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca020
            #add-point:ON ACTION controlp INFIELD apca020 name="input.c.apca020"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca021
            #add-point:ON ACTION controlp INFIELD apca021 name="input.c.apca021"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca022
            #add-point:ON ACTION controlp INFIELD apca022 name="input.c.apca022"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca046
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca046
            #add-point:ON ACTION controlp INFIELD apca046 name="input.c.apca046"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca0181
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca0181
            #add-point:ON ACTION controlp INFIELD apca0181 name="input.c.apca0181"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca047
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca047
            #add-point:ON ACTION controlp INFIELD apca047 name="input.c.apca047"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca048
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca048
            #add-point:ON ACTION controlp INFIELD apca048 name="input.c.apca048"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca1011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca1011
            #add-point:ON ACTION controlp INFIELD apca1011 name="input.c.apca1011"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca121
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca121
            #add-point:ON ACTION controlp INFIELD apca121 name="input.c.apca121"
            
            #END add-point
 
 
         #Ctrlp:input.c.apca131
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apca131
            #add-point:ON ACTION controlp INFIELD apca131 name="input.c.apca131"
            
            #END add-point
 
 
         #Ctrlp:input.c.apcc123
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcc123
            #add-point:ON ACTION controlp INFIELD apcc123 name="input.c.apcc123"
            
            #END add-point
 
 
         #Ctrlp:input.c.apcc133
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcc133
            #add-point:ON ACTION controlp INFIELD apcc133 name="input.c.apcc133"
            
            #END add-point
 
 
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_apca_m.apcald,g_apca_m.apcadocno
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
 
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
              #150617-00002#4  -s-              
               CALL s_aooi390_get_auto_no('14',g_apca_m.apca063) RETURNING g_sub_success,g_apca_m.apca063   
               IF NOT g_sub_success THEN
                  CALL s_transaction_end('N','0')
                  NEXT FIELD CURRENT
               END IF               
               #150617-00002#4  -e-  
               CALL s_aooi200_fin_gen_docno(g_apca_m.apcald,'','',g_apca_m.apcadocno,g_apca_m.apcadocdt,g_prog)
                    RETURNING g_sub_success,g_apca_m.apcadocno
               IF NOT g_sub_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'apm-00003'
                  LET g_errparam.extend = g_apca_m.apcadocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CALL s_transaction_end('N','0')
                  NEXT FIELD apcadocno
               END IF
               DISPLAY BY NAME g_apca_m.apcadocno          {#ADP版次:1#}
               
               IF cl_null(g_apca_m.apca057)THEN #170522-00030#1 add
                  LET g_apca_m.apca057 = g_apca_m.apca004
               END IF #170522-00030#1 add
               #170522-00030#1 add(s)
               UPDATE pmak_t SET pmak006 = g_apca_m.apcadocno 
                WHERE pmakent = g_enterprise AND pmak001 = g_apca_m.apca057
               #170522-00030#1 add(e) 
               #140806-00012#12 add -------
               IF cl_null(g_apca_m.apca026) THEN LET g_apca_m.apca026 = 0 END IF
               IF cl_null(g_apca_m.apca027) THEN LET g_apca_m.apca027 = 0 END IF
               IF cl_null(g_apca_m.apca028) THEN LET g_apca_m.apca028 = 0 END IF
               IF cl_null(g_apca_m.apca029) THEN LET g_apca_m.apca029 = 0 END IF
               #140806-00012#12 add end ---
               CALL s_aooi390_oofi_upd('14',g_apca_m.apca063) RETURNING l_success  #add--2015/05/15 By shiun 增加編碼功能
               
               
               #end add-point
               
               INSERT INTO apca_t (apcaent,apcasite,apca003,apcald,apcacomp,apcadocno,apca001,apcadocdt, 
                   apca004,apca005,apca038,apca006,apca057,apcastus,apca065,apca066,apca008,apca009, 
                   apca010,apca060,apca013,apca012,apca011,apca007,apca036,apca035,apca100,apca103,apca104, 
                   apca106,apca108,apca101,apca113,apca114,apca116,apca118,apca039,apca056,apca016,apca055, 
                   apca018,apca019,apca014,apca054,apca015,apca034,apca033,apca058,apca059,apca063,apca050, 
                   apca052,apca017,apca051,apca053,apca025,apca031,apca030,apca026,apca027,apca028,apca029, 
                   apca020,apca021,apca022,apca046,apca047,apca048,apca120,apca121,apca130,apca131,apca123, 
                   apca133,apca124,apca134,apca126,apca136,apca128,apca138,apcaownid,apcaowndp,apcacrtid, 
                   apcacrtdp,apcacrtdt,apcamodid,apcamoddt,apcacnfid,apcacnfdt)
               VALUES (g_enterprise,g_apca_m.apcasite,g_apca_m.apca003,g_apca_m.apcald,g_apca_m.apcacomp, 
                   g_apca_m.apcadocno,g_apca_m.apca001,g_apca_m.apcadocdt,g_apca_m.apca004,g_apca_m.apca005, 
                   g_apca_m.apca038,g_apca_m.apca006,g_apca_m.apca057,g_apca_m.apcastus,g_apca_m.apca065, 
                   g_apca_m.apca066,g_apca_m.apca008,g_apca_m.apca009,g_apca_m.apca010,g_apca_m.apca060, 
                   g_apca_m.apca013,g_apca_m.apca012,g_apca_m.apca011,g_apca_m.apca007,g_apca_m.apca036, 
                   g_apca_m.apca035,g_apca_m.apca100,g_apca_m.apca103,g_apca_m.apca104,g_apca_m.apca106, 
                   g_apca_m.apca108,g_apca_m.apca101,g_apca_m.apca113,g_apca_m.apca114,g_apca_m.apca116, 
                   g_apca_m.apca118,g_apca_m.apca039,g_apca_m.apca056,g_apca_m.apca016,g_apca_m.apca055, 
                   g_apca_m.apca018,g_apca_m.apca019,g_apca_m.apca014,g_apca_m.apca054,g_apca_m.apca015, 
                   g_apca_m.apca034,g_apca_m.apca033,g_apca_m.apca058,g_apca_m.apca059,g_apca_m.apca063, 
                   g_apca_m.apca050,g_apca_m.apca052,g_apca_m.apca017,g_apca_m.apca051,g_apca_m.apca053, 
                   g_apca_m.apca025,g_apca_m.apca031,g_apca_m.apca030,g_apca_m.apca026,g_apca_m.apca027, 
                   g_apca_m.apca028,g_apca_m.apca029,g_apca_m.apca020,g_apca_m.apca021,g_apca_m.apca022, 
                   g_apca_m.apca046,g_apca_m.apca047,g_apca_m.apca048,g_apca_m.apca120,g_apca_m.apca121, 
                   g_apca_m.apca130,g_apca_m.apca131,g_apca_m.apca123,g_apca_m.apca133,g_apca_m.apca124, 
                   g_apca_m.apca134,g_apca_m.apca126,g_apca_m.apca136,g_apca_m.apca128,g_apca_m.apca138, 
                   g_apca_m.apcaownid,g_apca_m.apcaowndp,g_apca_m.apcacrtid,g_apca_m.apcacrtdp,g_apca_m.apcacrtdt, 
                   g_apca_m.apcamodid,g_apca_m.apcamoddt,g_apca_m.apcacnfid,g_apca_m.apcacnfdt) 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_apca_m:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭新增中 name="input.head.m_insert"
               #140806-00012#12 add -------
               UPDATE apca_t
                  SET apca040 = 'N'
                WHERE apcaent = g_enterprise
                  AND apcald = g_apca_m.apcald
                  AND apcadocno = g_apca_m.apcadocno
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0
                       INITIALIZE g_errparam TO NULL
                       LET g_errparam.code = "std-00009"
                       LET g_errparam.extend = "upd apca_t"
                       LET g_errparam.popup = TRUE
                       CALL cl_err()
                       CALL s_transaction_end('N','0')
                       CONTINUE DIALOG
                  WHEN SQLCA.sqlcode
                       INITIALIZE g_errparam TO NULL
                       LET g_errparam.code = SQLCA.sqlcode
                       LET g_errparam.extend = "g_apca_m"
                       LET g_errparam.popup = TRUE
                       CALL cl_err()
                       CALL s_transaction_end('N','0')
                       CONTINUE DIALOG
               END CASE
               #140806-00012#12 add end ---
               #end add-point
               
               
               
                  #161130-00056
               
               #add-point:單頭新增後 name="input.head.a_insert"
               IF NOT cl_null(g_apca_m.apca016) AND NOT cl_null(g_apca_m.apca018) THEN
                  CALL s_aapt300_apca018_ins_apcb(g_apca_m.apcald,g_apca_m.apcadocno) RETURNING g_sub_success
                  IF NOT g_sub_success THEN
                     CALL s_transaction_end('N','0')
                     CONTINUE DIALOG
                  END IF                  
                  
                  #單頭金額資訊處理-資料顯示
                  CALL aapt320_curr_info_master()
                  
                  CALL s_aap_multi_bill_period(g_apca_m.apcald,g_apca_m.apcadocno) RETURNING g_sub_success,g_errno
                  IF NOT g_sub_success THEN
                     CALL s_transaction_end('N','0')
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "aap-00092"
                     LET g_errparam.extend = "upd apcc_t"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     CONTINUE DIALOG
                  END IF
                  CALL aapt320_b_fill()
               END IF
               #end add-point
               CALL s_transaction_end('Y','0') 
               
               IF l_cmd_t = 'r' AND p_cmd = 'a' THEN
                  CALL aapt320_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL aapt320_b_fill()
                  CALL aapt320_b_fill2('0')
               END IF
               
               #add-point:單頭新增後 name="input.head.a_insert2"
               
               #end add-point
               
               LET g_master_insert = TRUE
               
               LET p_cmd = 'u'
            ELSE
               CALL s_transaction_begin()
            
               #add-point:單頭修改前 name="input.head.b_update"
               #150617-00002#4 -s- 
               CALL s_aooi390_get_auto_no('14',g_apca_m.apca063) RETURNING l_success,g_apca_m.apca063  
               IF NOT l_success THEN
                  CALL s_transaction_end('N','0')
                  NEXT FIELD CURRENT
               END IF               
               #150617-00002#4 -e-               
               #單身因應需要修改的欄位
               LET l_cnt = 0
               SELECT count(*) INTO l_cnt FROM apcb_t
                WHERE apcbent = g_enterprise AND apcbld = g_apcald_t
                  AND apcbdocno = g_apcadocno_t 
               IF l_cnt > 0 THEN
                  IF NOT cl_null(g_apca_m.apca008) THEN   #付款條件
                     IF g_sfin2002 MATCHES '[12]' AND (cl_null(g_apca_m_t.apca008) OR g_apca_m.apca008 != g_apca_m_t.apca008)  THEN    
                        UPDATE apcb_t 
                           SET apcb030 = g_apca_m.apca008
                         WHERE apcbent = g_enterprise AND apcbld = g_apca_m.apcald
                           AND apcbdocno = g_apca_m.apcadocno
                        IF SQLCA.sqlerrd[3] = 0 THEN
                             CALL s_transaction_end('N','0')
                             INITIALIZE g_errparam TO NULL
                             LET g_errparam.code = "std-00009"
                             LET g_errparam.extend = "upd apcb030"
                             LET g_errparam.popup = TRUE
                             CALL cl_err()
                             CONTINUE DIALOG
                        END IF
                     END IF
                  END IF
                  #160128-00012#1 --(S)
                  IF l_apcb029_upd = 'Y' THEN
                     UPDATE apcb_t 
                        SET apcb029 = g_apca_m.apca035
                      WHERE apcbent = g_enterprise AND apcbld = g_apca_m.apcald
                        AND apcbdocno = g_apca_m.apcadocno
                  END IF
                  IF l_apcb021_upd = 'Y' THEN
                      UPDATE apcb_t 
                         SET apcb021 = g_apca_m.apca036
                       WHERE apcbent = g_enterprise AND apcbld = g_apca_m.apcald
                         AND apcbdocno = g_apca_m.apcadocno  
                     #160902-00034#1 ---s---單頭會計科目更改過後，重新給予預算細項                 
                     CALL s_aooi200_fin_get_slip(g_apca_m.apcadocno) RETURNING g_sub_success,g_ap_slip
                     CALL s_fin_get_doc_para(g_apca_m.apcald,g_apca_m.apcacomp,g_ap_slip,'D-FIN-5002') RETURNING g_dfin5002
                     IF g_dfin5002 = 'Y' THEN
                        #取得 預算細項參照表
                        SELECT bgaa008 INTO l_bgaa008  FROM bgaa_t
                         WHERE bgaaent = g_enterprise  AND  bgaa001 = g_apca_m.apca059
                        #取得會計科目所對應的預算細項 
                        SELECT bgao004 INTO l_apcb017 FROM bgao_t
                          WHERE bgao001 = l_bgaa008 AND bgaoent = g_enterprise
                            AND bgao002 = g_glaa.glaa004
                            AND bgao003 = g_apca_m.apca036
                        #檢核預算細項是否可被使用(abgi100)
                        CALL s_abg_bgai_chk(g_apca_m.apca059,g_apca_m.apcacomp,l_apcb017) RETURNING g_sub_success,g_errno
                        IF NOT g_sub_success THEN LET l_apcb017 = '' END IF     
                        #沒有來源單據的才需要被更新
                        UPDATE apcb_t  SET apcb017 = l_apcb017
                         WHERE apcbent = g_enterprise AND apcbld = g_apca_m.apcald
                           AND apcbdocno = g_apca_m.apcadocno  AND apcb002 IS NULL                                 
                        #沒有來源單據的預算細項才需要重新產生預算滾動檔                        
                        LET g_sql = "  SELECT apcbseq FROM apcb_t  ",                        
                                    "   WHERE apcbent = '",g_enterprise,"' AND apcbdocno = '",g_apca_m.apcadocno,"' ",
                                    "     AND apcbld = '",g_apca_m.apcald,"' AND apcbseq IS NOT NULL                ",
                                    "     AND apcb002 IS NULL                                                       "  
                        PREPARE aapt310_prep01 FROM g_sql
                        DECLARE aapt310_curs01 CURSOR FOR aapt310_prep01
                        FOREACH aapt310_curs01 INTO l_apcbseq        
                           #刪除舊的bgbd_t /先將額度釋放出來
                           DELETE FROM bgbd_t WHERE bgbdent = g_enterprise AND bgbd037 = g_apca_m.apcadocno AND bgbd038 = l_apcbseq                           
                           #檢核是否存在與算滾動檔
                           CALL s_aapt300_bgbd_upd(g_apca_m.apcadocno,g_apca_m.apcald,l_apcbseq,'','4')
                               RETURNING g_sub_success,g_errno                                                 
                           IF g_sub_success THEN    
                              #檢核預算是否超限
                              CALL s_aapt300_bgbd_upd(g_apca_m.apcadocno,g_apca_m.apcald,l_apcbseq,'','2')
                                  RETURNING g_sub_success,g_errno
                              IF NOT g_sub_success THEN
                                 INITIALIZE g_errparam TO NULL 
                                 LET g_errparam.extend = g_apca_m.apcadocno,'/',l_apcbseq
                                 LET g_errparam.code   = g_errno 
                                 LET g_errparam.popup  = TRUE 
                                 CALL cl_err()
                                CALL s_transaction_end('N','0') 
                                CONTINUE DIALOG                 
                              END IF                                                     
                              #新增一筆bgbd_t       
                              CALL s_aapt300_bgbd_upd(g_apca_m.apcadocno,g_apca_m.apcald,l_apcbseq,'I','3')
                                 RETURNING g_sub_success,g_errno
                              IF NOT g_sub_success THEN
                                 INITIALIZE g_errparam TO NULL 
                                 LET g_errparam.extend = '' 
                                 LET g_errparam.code   = g_errno 
                                 LET g_errparam.popup  = TRUE 
                                 CALL cl_err()
                                 CALL s_transaction_end('N','0')
                                 CONTINUE DIALOG                               
                              END IF                    
                           END IF        
                        END FOREACH                                                          
                     END IF
                     #160902-00034#1---e---                               
                  END IF
                  ##160128-00012#1 --- (S)
                   #160128-00012#1  mark (S)
                  #IF NOT cl_null(g_apca_m.apca035)THEN
                  #   IF cl_null(g_apca_m_t.apca035) OR g_apca_m.apca035 != g_apca_m_t.apca035 THEN    #應付會計科目
                  #      SELECT count(*) INTO l_cnt
                  #        FROM apcb_t 
                  #       WHERE apcbent = g_enterprise AND apcbld = g_apca_m.apcald
                  #         AND apcbdocno = g_apca_m.apcadocno
                  #         AND apcb029 IS NULL
                  #      IF l_cnt > 0 THEN
                  #         UPDATE apcb_t 
                  #            SET apcb029 = g_apca_m.apca035
                  #          WHERE apcbent = g_enterprise AND apcbld = g_apca_m.apcald
                  #            AND apcbdocno = g_apca_m.apcadocno
                  #            AND apcb029 IS NULL
                  #         IF SQLCA.sqlerrd[3] = 0 THEN
                  #            CALL s_transaction_end('N','0')
                  #            INITIALIZE g_errparam TO NULL
                  #            LET g_errparam.code = "std-00009"
                  #            LET g_errparam.extend = "upd apcb029"
                  #            LET g_errparam.popup = TRUE
                  #            CALL cl_err()
                  #            CONTINUE DIALOG
                  #         END IF
                  #      END IF
                  #   END IF
                  #END IF
                   #160128-00012#1  mark (E)
                  IF NOT cl_null(g_apca_m.apca036)THEN
                     IF cl_null(g_apca_m_t.apca036) OR g_apca_m.apca036 != g_apca_m_t.apca036 THEN
                        SELECT count(*) INTO l_cnt
                          FROM apcb_t 
                         WHERE apcbent = g_enterprise AND apcbld = g_apca_m.apcald
                           AND apcbdocno = g_apca_m.apcadocno
                           AND apcb021 IS NULL
                        #160902-00034#1 ---s---
                        #IF l_cnt > 0 THEN
                        ##150703-00021#24 ---s--- 修改bgbd_t                             
                        #   #檢核新的預算編號是否存在            
                        #   CALL s_aooi200_fin_get_slip(g_apca_m.apcadocno) RETURNING g_sub_success,g_ap_slip
                        #   CALL s_fin_get_doc_para(g_apca_m.apcald,g_apca_m.apcacomp,g_ap_slip,'D-FIN-5002') RETURNING g_dfin5002
                        #   IF g_dfin5002 = 'Y' THEN       
                        #      LET g_sql = "  SELECT apcbseq FROM apcb_t  ",
                        #                  "   WHERE apcbent = '",g_enterprise,"' AND apcbdocno = '",g_apca_m.apcadocno,"' ",
                        #                  "     AND　apcbld = '",g_apca_m.apcald,"' AND apcbseq IS NULL                    "
                        #      PREPARE aapt300_prep01 FROM g_sql
                        #      DECLARE aapt300_curs01 CURSOR FOR aapt300_prep01
                        #      FOREACH aapt300_curs01 INTO l_apcbseq
                        #          #160128-00012#1  mark (S)
                        #         #更新apcb_t
                        #         #UPDATE apcb_t 
                        #         #   SET apcb021 = g_apca_m.apca036
                        #         # WHERE apcbent = g_enterprise AND apcbld = g_apca_m.apcald
                        #         #   AND apcbdocno = g_apca_m.apcadocno
                        #         #   AND apcb021 IS NULL AND apcbseq = l_apcbseq
                        #          #160128-00012#1  mark (E)
                        #         #檢核是否存在
                        #         CALL s_aapt300_bgbd_upd(g_apca_m.apcadocno,g_apca_m.apcald,l_apcbseq,'','1')
                        #            RETURNING g_sub_success,g_errno
                        #         IF NOT g_sub_success THEN
                        #            INITIALIZE g_errparam TO NULL 
                        #            LET g_errparam.extend = '' 
                        #            LET g_errparam.code   = g_errno 
                        #            LET g_errparam.popup  = TRUE 
                        #            CALL cl_err()
                        #            CALL s_transaction_end('N','0')
                        #            CONTINUE DIALOG
                        #         END IF                                                                                  
                        #         #檢查新的數字是否超過額度                                   
                        #         CALL s_aapt300_bgbd_upd(g_apca_m.apcadocno,g_apca_m.apcald,l_apcbseq,'','2')
                        #            RETURNING g_sub_success,g_errno
                        #         IF NOT g_sub_success THEN
                        #            INITIALIZE g_errparam TO NULL 
                        #            LET g_errparam.extend = '' 
                        #            LET g_errparam.code   = g_errno 
                        #            LET g_errparam.popup  = TRUE 
                        #            CALL cl_err()
                        #            CALL s_transaction_end('N','0')
                        #            CONTINUE DIALOG
                        #         END IF                                         
                        #         #新增一筆bgbd_t               
                        #         CALL s_aapt300_bgbd_upd(g_apca_m.apcadocno,g_apca_m.apcald,l_apcbseq,'I','3')
                        #            RETURNING g_sub_success,g_errno
                        #         IF NOT g_sub_success THEN
                        #            INITIALIZE g_errparam TO NULL 
                        #            LET g_errparam.extend = '' 
                        #            LET g_errparam.code   = g_errno 
                        #            LET g_errparam.popup  = TRUE 
                        #            CALL cl_err()
                        #            CALL s_transaction_end('N','0')
                        #            CONTINUE DIALOG                                 END IF 
                        #      END FOREACH 
                        #      #150703-00021#24 ---e---                                 
                        #      #160128-00012#1  mark (S)
                        #  #ELSE              
                        #     #UPDATE apcb_t 
                        #     #   SET apcb021 = g_apca_m.apca036
                        #     # WHERE apcbent = g_enterprise AND apcbld = g_apca_m.apcald
                        #     #   AND apcbdocno = g_apca_m.apcadocno
                        #     #   AND apcb021 IS NULL
                        #     #IF SQLCA.sqlerrd[3] = 0 THEN
                        #     #   CALL s_transaction_end('N','0')
                        #     #   INITIALIZE g_errparam TO NULL
                        #     #   LET g_errparam.code = "std-00009"
                        #     #   LET g_errparam.extend = "upd apcb021"
                        #     #   LET g_errparam.popup = TRUE
                        #     #   CALL cl_err()
                        #     #   CONTINUE DIALOG
                        #     #END IF
                        #   END IF
                        #END IF
                        #160902-00034#1 ---e---
                     END IF
                  END IF   
                  #albireo 141106 --------------------------------------------------s
                  LET l_redo_apca101 = 'N'
                  LET l_redo_apca011 = 'N'
                  #判斷要不要做
                  IF g_apca_m.apca101 != g_apca_m_t.apca101 OR g_apca_m.apca121 != g_apca_m_t.apca121 OR
                        g_apca_m.apca131 != g_apca_m_t.apca131 THEN
                     LET l_redo_apca101 = 'Y'
                  END IF
                  
                  IF g_apca_m.apca011 != g_apca_m_t.apca011 THEN
                     LET l_redo_apca011 = 'Y'
                  END IF                  
                  
                  CASE
                     WHEN l_redo_apca101 = 'Y' AND l_redo_apca011 = 'Y'
                        IF NOT cl_ask_confirm('aap-00253') THEN
                           LET l_redo_apca101 = 'N'
                           LET l_redo_apca011 = 'N'
                        END IF
                     WHEN l_redo_apca101 = 'Y'
                        IF NOT cl_ask_confirm('aap-00251') THEN
                           LET l_redo_apca101 = 'N'
                        END IF
                     WHEN l_redo_apca011 = 'Y'
                        IF NOT cl_ask_confirm('aap-00252') THEN
                           LET l_redo_apca011 = 'N'
                        END IF
                     OTHERWISE
                  END CASE
                  
                  
                  #albireo 141106 --------------------------------------------------e
                  
                  #匯率(S)
                  IF (g_apca_m.apca101 != g_apca_m_t.apca101 OR g_apca_m.apca121 != g_apca_m_t.apca121 OR
                     g_apca_m.apca131 != g_apca_m_t.apca131) AND l_redo_apca101 = 'Y' THEN
                     OPEN aapt320_c2 USING g_enterprise,g_apca_m.apcald,g_apca_m.apcadocno
                     FOREACH aapt320_c2 INTO l_apcb1.*
                        CALL s_tax_chk(l_apcb1.apcborga,l_apcb1.apcb020) RETURNING g_sub_success,l_oodb004,l_oodb005,l_oodb006,l_oodb011
                        IF l_oodb005 = 'Y' THEN
                           LET l_apcb105 = l_apcb1.apcb105
                        ELSE
                           LET l_apcb105 = l_apcb1.apcb103
                        END IF
                        CALL s_tax_ins(g_apca_m.apcadocno,l_apcb1.apcbseq,'0',l_apcb1.apcborga,l_apcb105,
                                       l_apcb1.apcb020,l_apcb1.apcb007,g_apca_m.apca100,g_apca_m.apca101,g_apca_m.apcald,g_apca_m.apca121,g_apca_m.apca131)
                             RETURNING l_apcb1.apcb103,l_apcb1.apcb104,l_apcb1.apcb105,
                                       l_apcb1.apcb113,l_apcb1.apcb114,l_apcb1.apcb115,
                                       l_apcb1.apcb123,l_apcb1.apcb124,l_apcb1.apcb125,
                                       l_apcb1.apcb133,l_apcb1.apcb134,l_apcb1.apcb135
                        LET l_cnt = 0  #Reanna 150203
                        SELECT count(*) INTO l_cnt
                          FROM xrcd_t
                         WHERE xrcdent = g_enterprise AND xrcdld = g_apca_m.apcald AND xrcddocno = g_apca_m.apcadocno AND xrcd009 IS NULL
                        IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF #Reanna 150203
                        IF l_cnt > 0 THEN
                           CALL s_fin_get_account(g_apca_m.apcald,'13',g_apca_m.apca007,'8504_08') RETURNING g_sub_success,l_xrcd009,g_errno
                           UPDATE xrcd_t SET xrcd009 = l_xrcd009
                            WHERE xrcdent= g_enterprise 
                              AND xrcdld = g_apca_m.apcald AND xrcddocno = g_apca_m.apcadocno
                              AND xrcd009 IS NULL
                           IF SQLCA.sqlerrd[3] = 0 THEN
                              CALL s_transaction_end('N','0')
                              INITIALIZE g_errparam TO NULL
                              LET g_errparam.code = "std-00009"
                              LET g_errparam.extend = "upd xrcd009"
                              LET g_errparam.popup = TRUE
                              CALL cl_err()

                              CONTINUE DIALOG
                           END IF
                        END IF
                        IF g_apca_m.apca101 != g_apca_m_t.apca101 THEN                        #本幣匯率
                           LET l_apcb1.apcb111 = l_apcb1.apcb101 * g_apca_m.apca101
                           IF cl_null(l_apcb1.apcb111) THEN LET l_apcb1.apcb111 = 0 END IF
                           #Reanna 15/02/03
                           #CALL s_curr_round_ld('1',g_apca_m.apcald,g_apca_m.glaa001,l_apcb1.apcb111,2) RETURNING g_sub_success,g_errno,l_apcb1.apcb111
                           CALL s_curr_round_ld('1',g_apca_m.apcald,g_apca_m.glaa001,l_apcb1.apcb111,1) RETURNING g_sub_success,g_errno,l_apcb1.apcb111
                           UPDATE apcb_t 
                              #SET (apcb111,apcb113,apcb114,apcb115) ##150128-00005#9 mark
                              #= (l_apcb1.apcb111,l_apcb1.apcb113,l_apcb1.apcb114,l_apcb1.apcb115) ##150128-00005#9 mark
                              #150128-00005#9 ---(s)---
                              SET (apcb111,apcb113,apcb114,apcb115,apcb102)  
                                 = (l_apcb1.apcb111,l_apcb1.apcb113,l_apcb1.apcb114,l_apcb1.apcb115,g_apca_m.apca101)
                              #150128-00005#9 ---(e)---                                   
                            WHERE apcbent = g_enterprise AND apcbld = g_apca_m.apcald
                              AND apcbdocno = g_apca_m.apcadocno AND apcbseq = l_apcb1.apcbseq
                           IF SQLCA.sqlerrd[3] = 0 THEN
                              CALL s_transaction_end('N','0')
                              INITIALIZE g_errparam TO NULL
                              LET g_errparam.code = "std-00009"
                              LET g_errparam.extend = "upd apcb101~apcb105"
                              LET g_errparam.popup = TRUE
                              CALL cl_err()
                              CONTINUE DIALOG
                           END IF
                        END IF
                        IF g_glaa.glaa015 = 'Y' AND g_apca_m.apca121 != g_apca_m_t.apca121 THEN    #本幣二匯率
                           UPDATE apcb_t 
                              #SET (apcb121,apcb123,apcb124,apcb125) #150128-00005#9 mark
                              #  = (g_apca_m.apca121,l_apcb1.apcb123,l_apcb1.apcb124,l_apcb1.apcb125) #150128-00005#9 mark
                              #150128-00005#9 ---(s)---
                              SET (apcb121,apcb123,apcb124,apcb125,apcb121)  
                                = (g_apca_m.apca121,l_apcb1.apcb123,l_apcb1.apcb124,l_apcb1.apcb125,g_apca_m.apca121)
                              #150128-00005#9 ---(e)---  
                            WHERE apcbent = g_enterprise AND apcbld = g_apca_m.apcald
                              AND apcbdocno = g_apca_m.apcadocno AND apcbseq = l_apcb1.apcbseq
                           IF SQLCA.sqlerrd[3] = 0 THEN
                              CALL s_transaction_end('N','0')
                              INITIALIZE g_errparam TO NULL
                              LET g_errparam.code = "std-00009"
                              LET g_errparam.extend = "upd apcb121~apcb125"
                              LET g_errparam.popup = TRUE
                              CALL cl_err()
                              CONTINUE DIALOG
                           END IF
                        END IF               
                        IF g_glaa.glaa019 = 'Y' AND g_apca_m.apca131 != g_apca_m_t.apca131 THEN    #本幣三匯率
                           UPDATE apcb_t 
                              #SET (apcb131,apcb133,apcb134,apcb135) 150128-00005#9 mark
                              #  = (g_apca_m.apca131,l_apcb1.apcb133,l_apcb1.apcb134,l_apcb1.apcb135) 150128-00005#9 mark
                              #150128-00005#9 ---(s)---
                              SET (apcb131,apcb133,apcb134,apcb135,apcb131)
                                = (g_apca_m.apca131,l_apcb1.apcb133,l_apcb1.apcb134,l_apcb1.apcb135,g_apca_m.apca131)
                              #150128-00005#9 ---(e)---
                            WHERE apcbent = g_enterprise AND apcbld = g_apca_m.apcald
                              AND apcbdocno = g_apca_m.apcadocno AND apcbseq = l_apcb1.apcbseq
                           IF SQLCA.sqlerrd[3] = 0 THEN
                              CALL s_transaction_end('N','0')
                              INITIALIZE g_errparam TO NULL
                              LET g_errparam.code = "std-00009"
                              LET g_errparam.extend = "upd apcb131~apcb135"
                              LET g_errparam.popup = TRUE
                              CALL cl_err()
                              CONTINUE DIALOG
                           END IF
                        END IF
                     END FOREACH
                  END IF
                  #匯率(E)
                  #稅別(S)
                  IF (g_apca_m.apca011 != g_apca_m_t.apca011) AND l_redo_apca011 = 'Y' THEN
                     IF g_sfin2002 MATCHES '[12]' THEN
                        UPDATE apcb_t SET apcb020 = g_apca_m.apca011
                         WHERE apcbent = g_enterprise
                           AND apcbld  = g_apca_m.apcald AND apcbdocno = g_apca_m.apcadocno
                     ELSE
                        UPDATE apcb_t SET apcb020 = g_apca_m.apca011
                         WHERE apcbent = g_enterprise
                           AND apcbld  = g_apca_m.apcald AND apcbdocno = g_apca_m.apcadocno
                           AND apcb049 IS NULL
                     END IF
                     OPEN aapt320_c2 USING g_enterprise,g_apca_m.apcald,g_apca_m.apcadocno
                     FOREACH aapt320_c2 INTO l_apcb1.*
                        #CASE 3  THEN update  稅別 and 金額重計 where [收票單號apcb049]為空白者,。
                        IF g_sfin2002 = 3 AND NOT cl_null(l_apcb1.apcb049) THEN CONTINUE FOREACH END IF
                        
                        CALL s_tax_chk(l_apcb1.apcborga,l_apcb1.apcb020) RETURNING g_sub_success,l_oodb004,l_oodb005,l_oodb006,l_oodb011
                        IF l_oodb005 = 'Y' THEN
                           LET l_apcb105 = l_apcb1.apcb105
                        ELSE
                           LET l_apcb105 = l_apcb1.apcb103
                        END IF
                        CALL s_tax_ins(g_apca_m.apcadocno,l_apcb1.apcbseq,'0',l_apcb1.apcborga,l_apcb105,
                                       l_apcb1.apcb020,l_apcb1.apcb007,g_apca_m.apca100,g_apca_m.apca101,g_apca_m.apcald,g_apca_m.apca121,g_apca_m.apca131)
                             RETURNING l_apcb1.apcb103,l_apcb1.apcb104,l_apcb1.apcb105,
                                       l_apcb1.apcb113,l_apcb1.apcb114,l_apcb1.apcb115,
                                       l_apcb1.apcb123,l_apcb1.apcb124,l_apcb1.apcb125,
                                       l_apcb1.apcb133,l_apcb1.apcb134,l_apcb1.apcb135
                        #重推原幣/本幣單價 Reanna 150203----------
                        IF l_oodb005 = 'Y' THEN
                           LET l_apcb1.apcb101 = l_apcb1.apcb105 / l_apcb1.apcb007
                           LET l_apcb1.apcb111 = l_apcb1.apcb115 / l_apcb1.apcb007
                        ELSE
                           LET l_apcb1.apcb101 = l_apcb1.apcb103 / l_apcb1.apcb007
                           LET l_apcb1.apcb111 = l_apcb1.apcb113 / l_apcb1.apcb007
                        END IF
                        CALL s_curr_round_ld('1',g_apca_m.apcald,g_apca_m.glaa001,l_apcb1.apcb101,1) RETURNING g_sub_success,g_errno,l_apcb1.apcb101
                        CALL s_curr_round_ld('1',g_apca_m.apcald,g_apca_m.glaa001,l_apcb1.apcb111,1) RETURNING g_sub_success,g_errno,l_apcb1.apcb111
                        #重推原幣/本幣單價 Reanna 150203 end------
                        LET l_cnt = 0  #Reanna 150203
                        SELECT count(*) INTO l_cnt
                          FROM xrcd_t
                         WHERE xrcdent = g_enterprise AND xrcdld = g_apca_m.apcald AND xrcddocno = g_apca_m.apcadocno AND xrcd009 IS NULL
                        IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF #Reanna 150203
                        IF l_cnt > 0 THEN
                           CALL s_fin_get_account(g_apca_m.apcald,'13',g_apca_m.apca007,'8504_08') RETURNING g_sub_success,l_xrcd009,g_errno
                           UPDATE xrcd_t SET xrcd009 = l_xrcd009
                            WHERE xrcdent= g_enterprise 
                              AND xrcdld = g_apca_m.apcald AND xrcddocno = g_apca_m.apcadocno
                              AND xrcd009 IS NULL    

                           IF SQLCA.sqlerrd[3] = 0 THEN
                              CALL s_transaction_end('N','0')
                              INITIALIZE g_errparam TO NULL
                              LET g_errparam.code = "std-00009"
                              LET g_errparam.extend = "upd xrcd009"
                              LET g_errparam.popup = TRUE
                              CALL cl_err()

                              CONTINUE DIALOG
                           END IF
                        END IF
                        #Reanna 150203 add apcb101
                        UPDATE apcb_t 
                           SET (apcb101,apcb111,apcb103,apcb104,apcb105,apcb113,apcb114,apcb115)
                             = (l_apcb1.apcb101,l_apcb1.apcb111,l_apcb1.apcb103,l_apcb1.apcb104,l_apcb1.apcb105,l_apcb1.apcb113,l_apcb1.apcb114,l_apcb1.apcb115)
                         WHERE apcbent = g_enterprise AND apcbld = g_apca_m.apcald
                           AND apcbdocno = g_apca_m.apcadocno AND apcbseq = l_apcb1.apcbseq
                        IF SQLCA.sqlerrd[3] = 0 THEN
                           CALL s_transaction_end('N','0')
                           INITIALIZE g_errparam TO NULL
                           LET g_errparam.code = "std-00009"
                           LET g_errparam.extend = "upd apcb101~apcb105"
                           LET g_errparam.popup = TRUE
                           CALL cl_err()

                           CONTINUE DIALOG
                        END IF
                        IF g_glaa.glaa015 = 'Y' THEN    #本幣二匯率
                           UPDATE apcb_t 
                              SET (apcb121,apcb123,apcb124,apcb125)
                                = (g_apca_m.apca121,l_apcb1.apcb123,l_apcb1.apcb124,l_apcb1.apcb125)
                            WHERE apcbent = g_enterprise AND apcbld = g_apca_m.apcald
                              AND apcbdocno = g_apca_m.apcadocno AND apcbseq = l_apcb1.apcbseq
                           IF SQLCA.sqlerrd[3] = 0 THEN
                              CALL s_transaction_end('N','0')
                              INITIALIZE g_errparam TO NULL
                              LET g_errparam.code = "std-00009"
                              LET g_errparam.extend = "upd apcb121~apcb125"
                              LET g_errparam.popup = TRUE
                              CALL cl_err()

                              CONTINUE DIALOG
                           END IF
                        END IF               
                        IF g_glaa.glaa019 = 'Y' THEN    #本幣三匯率
                           UPDATE apcb_t 
                              SET (apcb131,apcb133,apcb134,apcb135)
                                = (g_apca_m.apca131,l_apcb1.apcb133,l_apcb1.apcb134,l_apcb1.apcb135)
                            WHERE apcbent = g_enterprise AND apcbld = g_apca_m.apcald
                              AND apcbdocno = g_apca_m.apcadocno AND apcbseq = l_apcb1.apcbseq
                           IF SQLCA.sqlerrd[3] = 0 THEN
                              CALL s_transaction_end('N','0')
                              INITIALIZE g_errparam TO NULL
                              LET g_errparam.code = "std-00009"
                              LET g_errparam.extend = "upd apcb131~apcb135"
                              LET g_errparam.popup = TRUE
                              CALL cl_err()

                              CONTINUE DIALOG
                           END IF
                        END IF
                     END FOREACH
                  END IF
                  #稅別(E)
                  #判斷是否單身金額與多帳期金額是否一致
                  CALL s_aapt300_compare_apcb_with_apcc(g_apca_m.apcald,g_apca_m.apcadocno)
                       RETURNING l_diff
                  IF l_diff = 0 THEN
                     #金額平了以後，再檢核 沖銷參數1/2的狀況，付款條件是否有修改
                     IF g_sfin2002 MATCHES '[12]' AND g_apca_m.apca008 != g_apca_m_t.apca008 THEN   
                        LET l_diff = 1
                     END IF
                     
                     #150910-00012#1-----s
                     IF NOT cl_null(g_apca_m.apca010) AND g_apca_m.apca010 != g_apca_m_t.apca010 THEN
                        LET l_diff = 1
                     END IF
                     #150910-00012#1-----e
                     
                     #150921-00148#3-----s
                     IF NOT cl_null(g_apca_m.apca009) AND g_apca_m.apca009 != g_apca_m_t.apca009 THEN
                        LET l_diff = 1
                     END IF                     
                     
                     IF NOT cl_null(g_apca_m.apca008) AND g_apca_m.apca008 != g_apca_m_t.apca008 THEN
                        LET l_diff = 1
                     END IF
                     #150921-00148#3-----e
                  END IF

                  IF l_diff > 0 THEN
                    
                     INITIALIZE l_amount.* TO NULL
                     CALL s_aap_clac_bill_master(g_apca_m.apcald,g_apca_m.apcadocno) RETURNING l_amount.*
                     
                     LET g_apca_m.apcamoddt = cl_get_current()
                     
                     UPDATE apca_t SET (apca103,apca104,apca106,apca107,apca108,
                                        apca113,apca114,apca116,apca117,apca118,
                                        apca123,apca124,apca126,apca127,apca128,
                                        apca133,apca134,apca136,apca137,apca138,
                                        apca008,apca009,   #150921-00148#3 add
                                        apcamodid,apcamoddt,apca010) =
                                       (l_amount.apcb103,l_amount.xrcd104,l_amount.apca106,l_amount.apca107,l_amount.apca108,
                                        l_amount.apcb113,l_amount.xrcd114,l_amount.apca116,l_amount.apca117,l_amount.apca118,
                                        l_amount.apcb123,l_amount.xrcd124,l_amount.apca126,l_amount.apca127,l_amount.apca128,
                                        l_amount.apcb133,l_amount.xrcd134,l_amount.apca136,l_amount.apca137,l_amount.apca138,
                                        g_apca_m.apca008,g_apca_m.apca009,   #150921-00148#3 add
                                        g_user,g_apca_m.apcamoddt,g_apca_m.apca010)
                       WHERE apcaent = g_enterprise AND apcald = g_apca_m.apcald
                         AND apcadocno = g_apca_m.apcadocno
                         
                     IF SQLCA.sqlerrd[3] = 0 THEN
                        CALL s_transaction_end('N','0')
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = "std-00009"
                        LET g_errparam.extend = "upd apca_t"
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                        CONTINUE DIALOG

                     END IF
                     #單頭金額資訊處理-資料顯示
                     CALL aapt320_curr_info_master()
                     #展多帳期
                     CALL s_aap_multi_bill_period(g_apca_m.apcald,g_apca_m.apcadocno) RETURNING g_sub_success,g_errno
                     IF NOT g_sub_success THEN
                        CALL s_transaction_end('N','0')
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = "aap-00092"
                        LET g_errparam.extend = "upd apcc_t"
                        LET g_errparam.popup = TRUE
                        CALL cl_err()

                        CONTINUE DIALOG
                     END IF
                     
                  END IF
                  CALL aapt320_b_fill()   
               END IF
               CALL s_aooi390_oofi_upd('14',g_apca_m.apca063) RETURNING l_success  #add--2015/05/15 By shiun 增加編碼功能
               #170522-00030#1 mark(s)
               #160621-00012#1--s
               #IF g_apca_m.apca005 <>　g_apca_m.apca057 THEN
               #   LET g_apca_m.apca057 = g_apca_m.apca005
               #   DISPLAY BY NAME g_apca_m.apca057
               #END IF
               #160621-00012#1--e
               #170522-00030#1 mark(e)
               #170522-00030#1 add(s)
               IF cl_null(g_apca_m.apca057)THEN    
                  LET g_apca_m.apca057 = g_apca_m.apca004
               END IF    
               UPDATE pmak_t SET pmak006 = g_apca_m.apcadocno 
                WHERE pmakent = g_enterprise AND pmak001 = g_apca_m.apca057   
               #170522-00030#1 add(e) 
               #end add-point
               
               #將遮罩欄位還原
               CALL aapt320_apca_t_mask_restore('restore_mask_o')
               
               UPDATE apca_t SET (apcasite,apca003,apcald,apcacomp,apcadocno,apca001,apcadocdt,apca004, 
                   apca005,apca038,apca006,apca057,apcastus,apca065,apca066,apca008,apca009,apca010, 
                   apca060,apca013,apca012,apca011,apca007,apca036,apca035,apca100,apca103,apca104,apca106, 
                   apca108,apca101,apca113,apca114,apca116,apca118,apca039,apca056,apca016,apca055,apca018, 
                   apca019,apca014,apca054,apca015,apca034,apca033,apca058,apca059,apca063,apca050,apca052, 
                   apca017,apca051,apca053,apca025,apca031,apca030,apca026,apca027,apca028,apca029,apca020, 
                   apca021,apca022,apca046,apca047,apca048,apca120,apca121,apca130,apca131,apca123,apca133, 
                   apca124,apca134,apca126,apca136,apca128,apca138,apcaownid,apcaowndp,apcacrtid,apcacrtdp, 
                   apcacrtdt,apcamodid,apcamoddt,apcacnfid,apcacnfdt) = (g_apca_m.apcasite,g_apca_m.apca003, 
                   g_apca_m.apcald,g_apca_m.apcacomp,g_apca_m.apcadocno,g_apca_m.apca001,g_apca_m.apcadocdt, 
                   g_apca_m.apca004,g_apca_m.apca005,g_apca_m.apca038,g_apca_m.apca006,g_apca_m.apca057, 
                   g_apca_m.apcastus,g_apca_m.apca065,g_apca_m.apca066,g_apca_m.apca008,g_apca_m.apca009, 
                   g_apca_m.apca010,g_apca_m.apca060,g_apca_m.apca013,g_apca_m.apca012,g_apca_m.apca011, 
                   g_apca_m.apca007,g_apca_m.apca036,g_apca_m.apca035,g_apca_m.apca100,g_apca_m.apca103, 
                   g_apca_m.apca104,g_apca_m.apca106,g_apca_m.apca108,g_apca_m.apca101,g_apca_m.apca113, 
                   g_apca_m.apca114,g_apca_m.apca116,g_apca_m.apca118,g_apca_m.apca039,g_apca_m.apca056, 
                   g_apca_m.apca016,g_apca_m.apca055,g_apca_m.apca018,g_apca_m.apca019,g_apca_m.apca014, 
                   g_apca_m.apca054,g_apca_m.apca015,g_apca_m.apca034,g_apca_m.apca033,g_apca_m.apca058, 
                   g_apca_m.apca059,g_apca_m.apca063,g_apca_m.apca050,g_apca_m.apca052,g_apca_m.apca017, 
                   g_apca_m.apca051,g_apca_m.apca053,g_apca_m.apca025,g_apca_m.apca031,g_apca_m.apca030, 
                   g_apca_m.apca026,g_apca_m.apca027,g_apca_m.apca028,g_apca_m.apca029,g_apca_m.apca020, 
                   g_apca_m.apca021,g_apca_m.apca022,g_apca_m.apca046,g_apca_m.apca047,g_apca_m.apca048, 
                   g_apca_m.apca120,g_apca_m.apca121,g_apca_m.apca130,g_apca_m.apca131,g_apca_m.apca123, 
                   g_apca_m.apca133,g_apca_m.apca124,g_apca_m.apca134,g_apca_m.apca126,g_apca_m.apca136, 
                   g_apca_m.apca128,g_apca_m.apca138,g_apca_m.apcaownid,g_apca_m.apcaowndp,g_apca_m.apcacrtid, 
                   g_apca_m.apcacrtdp,g_apca_m.apcacrtdt,g_apca_m.apcamodid,g_apca_m.apcamoddt,g_apca_m.apcacnfid, 
                   g_apca_m.apcacnfdt)
                WHERE apcaent = g_enterprise AND apcald = g_apcald_t
                  AND apcadocno = g_apcadocno_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "apca_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭修改中 name="input.head.m_update"
               #albireo 141117
               LET l_cnt = 0
               SELECT count(*) INTO l_cnt FROM apcb_t
                WHERE apcbent = g_enterprise AND apcbld = g_apcald_t
                  AND apcbdocno = g_apcadocno_t 
                   
               IF l_cnt = 0 AND NOT cl_null(g_apca_m.apca016) AND NOT cl_null(g_apca_m.apca018) THEN
                  CALL s_aapt300_apca018_ins_apcb(g_apca_m.apcald,g_apca_m.apcadocno) RETURNING g_sub_success                                    
                  IF NOT g_sub_success THEN
                     CALL s_transaction_end('N','0')
                     CONTINUE DIALOG
                  END IF                  
                                    
                  #單頭金額資訊處理-資料顯示
                  CALL aapt320_curr_info_master()
                  
                  CALL s_aap_multi_bill_period(g_apca_m.apcald,g_apca_m.apcadocno) RETURNING g_sub_success,g_errno
                  IF NOT g_sub_success THEN
                     CALL s_transaction_end('N','0')
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "aap-00092"
                     LET g_errparam.extend = "upd apcc_t"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     CONTINUE DIALOG
                  END IF
                  CALL aapt320_b_fill()
               END IF
               #end add-point
               
               
               
                  #161130-00056
               
               #將遮罩欄位進行遮蔽
               CALL aapt320_apca_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_apca_m_t)
               LET g_log2 = util.JSON.stringify(g_apca_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
               #150210-00009#1--Mark
               ##141202-00061-15--(S)
               #CALL s_aooi200_fin_get_slip(g_apca_m.apcadocno) RETURNING g_sub_success,g_ap_slip               
               #CALL s_fin_get_doc_para(g_apca_m.apcald,g_apca_m.apcacomp,g_ap_slip,'D-FIN-0030') RETURNING g_dfin0030
               #IF g_glaa.glaa121 = 'Y' AND g_dfin0030 = 'Y'THEN
               #   SELECT count(*) INTO l_count
               #     FROM apcb_t
               #    WHERE apcbent = g_enterprise 
               #      AND apcbld = g_apca_m.apcald AND apcedocno= g_apca_m.apcadocno
               #   #修改單頭時 判斷是否有單身都資料 若有資料再重展單身
               #   IF l_count > 0 THEN
               #      CALL s_transaction_begin()
               #      CALL s_pre_voucher_ins('AP','P10',g_apca_m.apcald,g_apca_m.apcadocno,g_apca_m.apcadocdt,'1')
               #           RETURNING g_sub_success
               #      IF g_sub_success THEN 
               #         CALL s_transaction_end('Y','0')
               #      ELSE
               #         CALL s_transaction_end('N','0')
               #      END IF
               #   END IF
               #END IF
               ##141202-00061-15--(E) 
               #150210-00009#1--Mark
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_apcald_t = g_apca_m.apcald
            LET g_apcadocno_t = g_apca_m.apcadocno
 
            
      END INPUT
   
 
{</section>}
 
{<section id="aapt320.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_apcb_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
 
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_apcb_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL aapt320_b_fill() #ver:82
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_apcb_d.getLength()
            #add-point:資料輸入前 name="input.d.before_input"
            #160902-00034#1 ---s---
            CALL s_aooi200_fin_get_slip(g_apca_m.apcadocno) RETURNING g_sub_success,g_ap_slip
            CALL s_fin_get_doc_para(g_apca_m.apcald,g_apca_m.apcacomp,g_ap_slip,'D-FIN-5002') RETURNING g_dfin5002
            IF g_dfin5002 = 'Y' THEN
               #有座預算控管 必須存在預算編號
               IF cl_null(g_apca_m.apca059) THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = '' 
                  LET g_errparam.code   = 'abg-00159' 
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()               
                  NEXT FIELD apcasite
               END IF            
            END IF   
            #160902-00034#1 ---e---          
            
            
            #160616-00005#2--add--str--
            #实时显示单身金额合计
            CALL s_aapt300_sum(g_apca_m.apcald,g_apca_m.apcadocno,'')
            RETURNING g_apca_m.apcb103_s,g_apca_m.apcb104_s,g_apca_m.apcb105_s,
                      g_apca_m.apcb113_s,g_apca_m.apcb114_s,g_apca_m.apcb115_s
            DISPLAY BY NAME g_apca_m.apcb103_s,g_apca_m.apcb104_s,g_apca_m.apcb105_s,
                            g_apca_m.apcb113_s,g_apca_m.apcb114_s,g_apca_m.apcb115_s
            #160616-00005#2--add--end
            #end add-point
         
         BEFORE ROW
            #add-point:modify段before row2 name="input.body.before_row2"
 
            #end add-point  
            LET l_insert = FALSE
            LET l_cmd = ''
            LET l_ac_t = l_ac 
            LET l_ac = ARR_CURR()
            LET g_detail_idx = l_ac
            LET g_detail_idx_list[1] = l_ac
            LET g_current_page = 1
            
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN aapt320_cl USING g_enterprise,g_apca_m.apcald,g_apca_m.apcadocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN aapt320_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE aapt320_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_apcb_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_apcb_d[l_ac].apcbseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_apcb_d_t.* = g_apcb_d[l_ac].*  #BACKUP
               LET g_apcb_d_o.* = g_apcb_d[l_ac].*  #BACKUP
               CALL aapt320_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
                LET g_apcb_d_o.* = g_apcb_d[l_ac].*
               #end add-point  
               CALL aapt320_set_no_entry_b(l_cmd)
               IF NOT aapt320_lock_b("apcb_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH aapt320_bcl INTO g_apcb_d[l_ac].apcbseq,g_apcb_d[l_ac].apcb001,g_apcb_d[l_ac].apcborga, 
                      g_apcb_d[l_ac].apcb002,g_apcb_d[l_ac].apcb003,g_apcb_d[l_ac].apcb023,g_apcb_d[l_ac].apcb004, 
                      g_apcb_d[l_ac].apcb005,g_apcb_d[l_ac].apcb030,g_apcb_d[l_ac].apcb020,g_apcb_d[l_ac].apcb006, 
                      g_apcb_d[l_ac].apcb022,g_apcb_d[l_ac].apcb007,g_apcb_d[l_ac].apcb101,g_apcb_d[l_ac].apcb103, 
                      g_apcb_d[l_ac].apcb104,g_apcb_d[l_ac].apcb105,g_apcb_d[l_ac].apcb111,g_apcb_d[l_ac].apcb113, 
                      g_apcb_d[l_ac].apcb114,g_apcb_d[l_ac].apcb115,g_apcb_d[l_ac].apcb028,g_apcb_d[l_ac].apcb049, 
                      g_apcb_d[l_ac].apcb048,g_apcb_d[l_ac].apcb008,g_apcb_d[l_ac].apcb009,g_apcb_d[l_ac].apcb010, 
                      g_apcb_d[l_ac].apcb047,g_apcb_d[l_ac].apcb021,g_apcb_d[l_ac].apcb029,g_apcb_d[l_ac].apcb017, 
                      g_apcb_d[l_ac].apcb100,g_apcb_d[l_ac].apcb123,g_apcb_d[l_ac].apcb124,g_apcb_d[l_ac].apcb125, 
                      g_apcb_d[l_ac].apcb133,g_apcb_d[l_ac].apcb134,g_apcb_d[l_ac].apcb135,g_apcb_d[l_ac].apcblegl, 
                      g_apcb_d[l_ac].apcb011,g_apcb_d[l_ac].apcb012,g_apcb_d[l_ac].apcb014,g_apcb_d[l_ac].apcb015, 
                      g_apcb_d[l_ac].apcb016,g_apcb_d[l_ac].apcb024,g_apcb_d[l_ac].apcbsite,g_apcb_d[l_ac].apcb013, 
                      g_apcb_d[l_ac].apcb018,g_apcb_d[l_ac].apcb019,g_apcb_d[l_ac].apcb106,g_apcb_d[l_ac].apcb108, 
                      g_apcb_d[l_ac].apcb051,g_apcb_d[l_ac].apcb102,g_apcb_d[l_ac].apcb034,g_apcb_d[l_ac].apcb054, 
                      g_apcb_d[l_ac].apcb055,g_apcb_d[l_ac].apcb036,g_apcb_d[l_ac].apcb035,g_apcb_d[l_ac].apcb037, 
                      g_apcb_d[l_ac].apcb038,g_apcb_d[l_ac].apcb039,g_apcb_d[l_ac].apcb040,g_apcb_d[l_ac].apcb041, 
                      g_apcb_d[l_ac].apcb042,g_apcb_d[l_ac].apcb043,g_apcb_d[l_ac].apcb044,g_apcb_d[l_ac].apcb045, 
                      g_apcb_d[l_ac].apcb046
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_apcb_d_t.apcbseq,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_apcb_d_mask_o[l_ac].* =  g_apcb_d[l_ac].*
                  CALL aapt320_apcb_t_mask()
                  LET g_apcb_d_mask_n[l_ac].* =  g_apcb_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL aapt320_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body.before_row"
            #160616-00005#2--add--str--
            #抓取除了当前行次金额的单身金额合计
            CALL s_aapt300_sum(g_apca_m.apcald,g_apca_m.apcadocno,g_apcb_d[l_ac].apcbseq)
            RETURNING l_sum.apcb103,l_sum.apcb104,l_sum.apcb105,l_sum.apcb113,l_sum.apcb114,l_sum.apcb115
            #160616-00005#2--add--end
            
            LET l_oodb005 = 'N'
            IF NOT cl_null(g_apcb_d[l_ac].apcb020) THEN
               CALL s_tax_chk(g_apcb_d[l_ac].apcborga,g_apcb_d[l_ac].apcb020) RETURNING g_sub_success,l_oodb004,l_oodb005,l_oodb006,l_oodb011
            END IF
            CALL aapt320_set_entry_apcb020(l_oodb005)
            CALL aapt320_set_entry_b(l_cmd)
            CALL aapt320_set_no_entry_b(l_cmd)
            #單身新增的欄位預設位置
            IF l_cmd = 'a' THEN
               IF NOT cl_null(g_apca_m.apca018) THEN NEXT FIELD apcb003 END IF
            END IF
            
            #end add-point  
            #其他table資料備份(確定是否更改用)
            
 
            #其他table進行lock
            
 
            CALL aapt320_idx_chk()   #(ver:83)
        
         BEFORE INSERT  
            
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            CALL aapt320_idx_chk()   #(ver:83)
            INITIALIZE g_apcb_d[l_ac].* TO NULL 
            INITIALIZE g_apcb_d_t.* TO NULL 
            INITIALIZE g_apcb_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
                  LET g_apcb_d[l_ac].apcb023 = "N"
      LET g_apcb_d[l_ac].apcb022 = "1"
      LET g_apcb_d[l_ac].apcb007 = "0"
      LET g_apcb_d[l_ac].apcb101 = "0"
      LET g_apcb_d[l_ac].apcb103 = "0"
      LET g_apcb_d[l_ac].apcb104 = "0"
      LET g_apcb_d[l_ac].apcb105 = "0"
      LET g_apcb_d[l_ac].apcb111 = "0"
      LET g_apcb_d[l_ac].apcb113 = "0"
      LET g_apcb_d[l_ac].apcb114 = "0"
      LET g_apcb_d[l_ac].apcb115 = "0"
      LET g_apcb_d[l_ac].apcb123 = "0"
      LET g_apcb_d[l_ac].apcb124 = "0"
      LET g_apcb_d[l_ac].apcb125 = "0"
      LET g_apcb_d[l_ac].apcb133 = "0"
      LET g_apcb_d[l_ac].apcb134 = "0"
      LET g_apcb_d[l_ac].apcb135 = "0"
      LET g_apcb_d[l_ac].apcb106 = "0"
      LET g_apcb_d[l_ac].apcb108 = "0"
 
            #add-point:modify段before備份 name="input.body.insert.before_bak"
            
            #end add-point
            LET g_apcb_d_t.* = g_apcb_d[l_ac].*     #新輸入資料
            LET g_apcb_d_o.* = g_apcb_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL aapt320_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
            LET g_apcb_d[l_ac].apcb102 = g_apca_m.apca101   ##150128-00005#9
            #end add-point
            CALL aapt320_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_apcb_d[li_reproduce_target].* = g_apcb_d[li_reproduce].*
 
               LET g_apcb_d[li_reproduce_target].apcbseq = NULL
 
            END IF
            
 
            #add-point:modify段before insert name="input.body.before_insert"
            #單身預設值
            #項次
            
            IF l_cmd = 'a' AND cl_null(g_apcb_d[l_ac].apcbseq) THEN
               SELECT MAX(apcbseq)+1 INTO g_apcb_d[l_ac].apcbseq
                 FROM apcb_t
                WHERE apcbent = g_enterprise AND apcbld = g_apca_m.apcald
                  AND apcbdocno = g_apca_m.apcadocno        
               IF cl_null(g_apcb_d[l_ac].apcbseq) THEN LET g_apcb_d[l_ac].apcbseq = 1 END IF  
            END IF
            CALL aapt320_set_default_b(l_ac)
            #160908-00045#1--add(s)
            CALL s_desc_get_department_desc(g_apcb_d[l_ac].apcborga) RETURNING g_apcb_d[l_ac].apcborga_desc
            DISPLAY BY NAME g_apcb_d[l_ac].apcborga_desc
            #160908-00045#1--add(e)
            IF NOT cl_null(g_apcb_d[l_ac].apcb020) THEN
               CALL s_tax_chk(g_apcb_d[l_ac].apcborga,g_apcb_d[l_ac].apcb020) RETURNING g_sub_success,l_oodb004,l_oodb005,l_oodb006,l_oodb011              
            END IF
            CALL aapt320_set_entry_apcb020(l_oodb005)
            LET g_apcb_d_t.* = g_apcb_d[l_ac].*
            LET g_apcb_d_o.* = g_apcb_d[l_ac].*
            #end add-point  
  
         AFTER INSERT
            LET l_insert = FALSE
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CALL cl_err()
               LET INT_FLAG = 0
               CANCEL INSERT
            END IF
               
            #add-point:單身新增 name="input.body.b_a_insert"
            #161214-00014#1---add---str--
            IF g_apcb_d[l_ac].apcb007 <= 0 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'aap-00451'
               LET g_errparam.extend = 'INSERT'
               LET g_errparam.popup = TRUE
               INITIALIZE g_apcb_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
            #161214-00014#1---add---end--
            #end add-point
               
            LET l_count = 1  
            SELECT COUNT(1) INTO l_count FROM apcb_t 
             WHERE apcbent = g_enterprise AND apcbld = g_apca_m.apcald
               AND apcbdocno = g_apca_m.apcadocno
 
               AND apcbseq = g_apcb_d[l_ac].apcbseq
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               #170512-00045#10 add ------
               CALL g_glaq_s.clear()
               CALL aglt310_02('d',g_apca_m.apcald,'',g_apca_m.apcadocdt,g_apcb_d[l_ac].apcb021,'',g_apcb_d[l_ac].apcb029,g_glaq_s[1].*)
               RETURNING g_glaq_s[1].glaq017,g_glaq_s[1].glaq018,g_glaq_s[1].glaq019,g_glaq_s[1].glaq020,g_glaq_s[1].glaq021,
                         g_glaq_s[1].glaq022,g_glaq_s[1].glaq023,g_glaq_s[1].glaq024,g_glaq_s[1].glaq051,g_glaq_s[1].glaq052,
                         g_glaq_s[1].glaq053,g_glaq_s[1].glaq025,g_glaq_s[1].glaq027,g_glaq_s[1].glaq028,g_glaq_s[1].glaq029,
                         g_glaq_s[1].glaq030,g_glaq_s[1].glaq031,g_glaq_s[1].glaq032,g_glaq_s[1].glaq033,g_glaq_s[1].glaq034,
                         g_glaq_s[1].glaq035,g_glaq_s[1].glaq036,g_glaq_s[1].glaq037,g_glaq_s[1].glaq038,g_glaq_s[1].glbc004
               
               LET g_apcb_d[l_ac].apcb010 = g_glaq_s[1].glaq018
               LET g_apcb_d[l_ac].apcb011 = g_glaq_s[1].glaq019
               LET g_apcb_d[l_ac].apcb024 = g_glaq_s[1].glaq020
               LET g_apcb_d[l_ac].apcb054 = g_glaq_s[1].glaq021
               LET g_apcb_d[l_ac].apcb055 = g_glaq_s[1].glaq022
               LET g_apcb_d[l_ac].apcb036 = g_glaq_s[1].glaq023
               LET g_apcb_d[l_ac].apcb012 = g_glaq_s[1].glaq024
               LET g_apcb_d[l_ac].l_apcb0332 = g_glaq_s[1].glaq051
               LET g_apcb_d[l_ac].apcb034 = g_glaq_s[1].glaq052
               LET g_apcb_d[l_ac].apcb035 = g_glaq_s[1].glaq053
               LET g_apcb_d[l_ac].apcb051 = g_glaq_s[1].glaq025
               LET g_apcb_d[l_ac].apcb015 = g_glaq_s[1].glaq027
               LET g_apcb_d[l_ac].apcb016 = g_glaq_s[1].glaq028
               LET g_apcb_d[l_ac].apcb037 = g_glaq_s[1].glaq029
               LET g_apcb_d[l_ac].apcb038 = g_glaq_s[1].glaq030
               LET g_apcb_d[l_ac].apcb039 = g_glaq_s[1].glaq031
               LET g_apcb_d[l_ac].apcb040 = g_glaq_s[1].glaq032
               LET g_apcb_d[l_ac].apcb041 = g_glaq_s[1].glaq033
               LET g_apcb_d[l_ac].apcb042 = g_glaq_s[1].glaq034
               LET g_apcb_d[l_ac].apcb043 = g_glaq_s[1].glaq035
               LET g_apcb_d[l_ac].apcb044 = g_glaq_s[1].glaq036
               LET g_apcb_d[l_ac].apcb045 = g_glaq_s[1].glaq037
               LET g_apcb_d[l_ac].apcb046 = g_glaq_s[1].glaq038
               DISPLAY BY NAME
               g_apcb_d[l_ac].apcb010,g_apcb_d[l_ac].apcb011,g_apcb_d[l_ac].apcb024,
               g_apcb_d[l_ac].apcb054,g_apcb_d[l_ac].apcb055,g_apcb_d[l_ac].apcb036,
               g_apcb_d[l_ac].apcb012,g_apcb_d[l_ac].l_apcb0332,g_apcb_d[l_ac].apcb034,
               g_apcb_d[l_ac].apcb035,g_apcb_d[l_ac].apcb051,g_apcb_d[l_ac].apcb015,
               g_apcb_d[l_ac].apcb016,g_apcb_d[l_ac].apcb037,g_apcb_d[l_ac].apcb038,
               g_apcb_d[l_ac].apcb039,g_apcb_d[l_ac].apcb040,g_apcb_d[l_ac].apcb041,
               g_apcb_d[l_ac].apcb042,g_apcb_d[l_ac].apcb043,g_apcb_d[l_ac].apcb044,
               g_apcb_d[l_ac].apcb045,g_apcb_d[l_ac].apcb046
               #170512-00045#10 add end---
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_apca_m.apcald
               LET gs_keys[2] = g_apca_m.apcadocno
               LET gs_keys[3] = g_apcb_d[g_detail_idx].apcbseq
               CALL aapt320_insert_b('apcb_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_apcb_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "apcb_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL aapt320_b_fill()
               #資料多語言用-增/改
               
                  #161130-00056 add
               #add-point:input段-after_insert name="input.body.a_insert2"
               CALL aapt320_b_fill()
               #end add-point
               CALL s_transaction_end('Y','0')
               #ERROR 'INSERT O.K'
               LET g_rec_b = g_rec_b + 1
            END IF
              
         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' THEN
               LET l_cmd='d'
               #add-point:單身刪除後(=d) name="input.body.after_delete_d"
               
               #end add-point
            ELSE
               #add-point:單身刪除前 name="input.body.b_delete_ask"
               
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
               
               #add-point:單身刪除前 name="input.body.b_delete"
               #回寫入庫單立暫估數量
               IF NOT cl_null(g_apcb_d_t.apcb002) AND NOT cl_null(g_apcb_d_t.apcb003) THEN
                  CALL s_aapt300_pmdt_upd(g_apca_m.apcald,g_apca_m.apcadocno,g_apcb_d_t.apcbseq,'-') RETURNING g_sub_success,g_errno
               END IF
               #end add-point 
               
               #取得該筆資料key值
               INITIALIZE gs_keys TO NULL
               LET gs_keys[01] = g_apca_m.apcald
               LET gs_keys[gs_keys.getLength()+1] = g_apca_m.apcadocno
 
               LET gs_keys[gs_keys.getLength()+1] = g_apcb_d_t.apcbseq
 
            
               #刪除同層單身
               IF NOT aapt320_delete_b('apcb_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE aapt320_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT aapt320_key_delete_b(gs_keys,'apcb_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE aapt320_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
   #161130-00056 add
               
               #add-point:單身刪除中 name="input.body.m_delete"
 
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE aapt320_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
                  DELETE FROM xrcd_t
                   WHERE xrcdent  = g_enterprise         AND xrcdld  = g_apca_m.apcald
                     AND xrcddocno= g_apca_m.apcadocno   AND xrcdseq = g_apcb_d_t.apcbseq
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = "xrcd_t"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     CALL s_transaction_end('N','0')
                     CANCEL DELETE   
                  END IF
               #end add-point
               LET l_count = g_apcb_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
               
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_apcb_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcbseq
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_apcb_d[l_ac].apcbseq,"1","1","","","azz-00079",1) THEN
               NEXT FIELD apcbseq
            END IF 
 
 
 
            #add-point:AFTER FIELD apcbseq name="input.a.page1.apcbseq"
            #項次
            IF NOT cl_null(g_apcb_d[l_ac].apcbseq) THEN
               #check序號是否重複
               IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_apcb_d[l_ac].apcbseq != g_apcb_d_t.apcbseq OR g_apcb_d_t.apcbseq IS NULL )) THEN
                  LET l_cnt = 0
                  SELECT count(*) INTO l_cnt FROM apcb_t
                   WHERE apcbent = g_enterprise AND apcbld = g_apca_m.apcald
                     AND apcbdocno = g_apca_m.apcadocno
                     AND apcbseq = g_apcb_d[l_ac].apcbseq
                  IF l_cnt > 0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "std-00004"
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = FALSE
                     CALL cl_err()

                     LET g_apcb_d[l_ac].apcbseq = g_apcb_d_t.apcbseq
                     NEXT FIELD CURRENT
                  END IF  
               END IF
               #apcb/xrcd的seq為連動值,seq變更時 需一併變更xrcd的seq 避免s_tax_ins,在del時會因seq變動時 砍不到資料
               IF g_apcb_d[l_ac].apcbseq != g_apcb_d_o.apcbseq THEN
                  LET l_cnt = 0
                  SELECT count(*) INTO l_cnt
                    FROM xrcd_t
                   WHERE xrcdent = g_enterprise AND xrcdld = g_apca_m.apcald
                     AND xrcddocno = g_apcb_d_o.apcbseq
                  IF l_cnt > 0 THEN
                     UPDATE xrcd_t
                        SET xrcdseq   = g_apcb_d[l_ac].apcbseq
                      WHERE xrcdent   = g_enterprise AND xrcdld = g_apca_m.apcald
                        AND xrcddocno = g_apcb_d_o.apcbseq
                  END IF
                  LET g_apcb_d_o.apcbseq = g_apcb_d[l_ac].apcbseq
               END IF
            ELSE
               NEXT FIELD apcbseq
            END IF
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcbseq
            #add-point:BEFORE FIELD apcbseq name="input.b.page1.apcbseq"
            #沖暫估
            IF cl_null(g_apcb_d[l_ac].apcbseq) THEN 
               SELECT MAX(apcbseq) INTO g_apcb_d[g_detail_idx].apcbseq
                 FROM apcb_t
                WHERE apcbent = g_enterprise AND apcbld = g_apca_m.apcald
                  AND apcbdocno = g_apca_m.apcadocno
               IF cl_null(g_apcb_d[g_detail_idx].apcbseq) THEN 
                  LET g_apcb_d[g_detail_idx].apcbseq = 1
               ELSE
                  LET g_apcb_d[g_detail_idx].apcbseq = g_apcb_d[g_detail_idx].apcbseq +1               
               END IF
            END IF
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcbseq
            #add-point:ON CHANGE apcbseq name="input.g.page1.apcbseq"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb001
            #add-point:BEFORE FIELD apcb001 name="input.b.page1.apcb001"
 
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb001
            
            #add-point:AFTER FIELD apcb001 name="input.a.page1.apcb001"
            #來源類型
            IF g_apcb_d[l_ac].apcb001 MATCHES '[12]9' THEN
               CALL cl_set_comp_required("apcb002,apcb003",FALSE)
            ELSE
               CALL cl_set_comp_required("apcb002,apcb003",TRUE)
            END IF
            LET g_apcb_d[l_ac].apcb022 = s_fin_get_scc_value('8540',g_apcb_d[l_ac].apcb001,'4')
            DISPLAY BY NAME g_apcb_d[l_ac].apcb022
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb001
            #add-point:ON CHANGE apcb001 name="input.g.page1.apcb001"
            #來源類型
            IF NOT cl_null(g_apcb_d[l_ac].apcb001) THEN
               IF g_apcb_d[l_ac].apcb001 != g_apcb_d_o.apcb001 THEN
                  IF l_cmd = 'u' THEN
                     IF NOT cl_ask_confirm("aap-00061") THEN       #來源類型若有改變應該詢問是否改變目前資料
                        LET g_apcb_d[l_ac].apcb001 = g_apcb_d_t.apcb001
                        RETURN
                     END IF   
                  END IF
                  LET g_apcb_d_t.apcb001 = g_apcb_d[l_ac].apcb001
                  INITIALIZE g_apcb_d[l_ac].* TO NULL
                  CALL aapt320_set_default_b(l_ac)  #依據單頭重帶預設值
                  LET g_apcb_d[l_ac].apcbseq = g_apcb_d_t.apcbseq
                  LET g_apcb_d[l_ac].apcb001 = g_apcb_d_t.apcb001
                  IF NOT cl_null(g_apcb_d[l_ac].apcb020) THEN
                     CALL s_tax_chk(g_apcb_d[l_ac].apcborga,g_apcb_d[l_ac].apcb020) RETURNING g_sub_success,l_oodb004,l_oodb005,l_oodb006,l_oodb011
                  END IF
                  CALL aapt320_set_entry_apcb020(l_oodb005)
                  #160616-00005#2--add--str--
                  #实时显示单身金额合计
                  #此时单身金额全为NULL
                  LET g_apca_m.apcb103_s = l_sum.apcb103
                  LET g_apca_m.apcb104_s = l_sum.apcb104
                  LET g_apca_m.apcb105_s = l_sum.apcb105
                  LET g_apca_m.apcb113_s = l_sum.apcb113
                  LET g_apca_m.apcb114_s = l_sum.apcb114
                  LET g_apca_m.apcb115_s = l_sum.apcb115
                  DISPLAY BY NAME g_apca_m.apcb103_s,g_apca_m.apcb104_s,g_apca_m.apcb105_s,
                                  g_apca_m.apcb113_s,g_apca_m.apcb114_s,g_apca_m.apcb115_s
                  #160616-00005#2--add--end
               END IF
               LET g_apcb_d_t.apcb001 = g_apcb_d[l_ac].apcb001
            END IF
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcborga
            
            #add-point:AFTER FIELD apcborga name="input.a.page1.apcborga"
            #來源組織
            IF NOT cl_null(g_apcb_d[l_ac].apcborga) THEN
               IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_apcb_d[l_ac].apcborga != g_apcb_d_t.apcborga OR g_apcb_d_t.apcborga IS NULL )) THEN            
                  #160908-00045#1--add(s)
                  CALL s_desc_get_department_desc(g_apcb_d[l_ac].apcborga) RETURNING g_apcb_d[l_ac].apcborga_desc
                  DISPLAY BY NAME g_apcb_d[l_ac].apcborga_desc
                  #160908-00045#1--add(e)
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
                  
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_apcb_d[l_ac].apcborga
                  #160318-00025#39  2016/04/22  by pengxin  add(S)
                  LET g_errshow = TRUE #是否開窗 
                  LET g_chkparam.err_str[1] = "aoo-00095:sub-01302|aooi125|",cl_get_progname("aooi125",g_lang,"2"),"|:EXEPROGaooi125"
                  #160318-00025#39  2016/04/22  by pengxin  add(E)
                  
                  IF NOT cl_chk_exist("v_ooef001") THEN
                     #檢查失敗時後續處理
                     LET g_apcb_d[l_ac].apcborga = g_apcb_d_t.apcborga
                     #160908-00045#1--add(s)
                     CALL s_desc_get_department_desc(g_apcb_d[l_ac].apcborga) RETURNING g_apcb_d[l_ac].apcborga_desc
                     DISPLAY BY NAME g_apcb_d[l_ac].apcborga_desc
                     #160908-00045#1--add(e)
                     NEXT FIELD CURRENT
                  END IF
                  CALL s_aap_apcborga_chk(g_apca_m.apcald,g_apca_m.apcadocno,g_apcb_d[l_ac].apcborga,g_wc_apcasite) 
                       RETURNING g_sub_success,g_errno
                  IF NOT g_sub_success THEN
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_apcb_d[l_ac].apcborga = g_apcb_d_t.apcborga
                     #160908-00045#1--add(s)
                     CALL s_desc_get_department_desc(g_apcb_d[l_ac].apcborga) RETURNING g_apcb_d[l_ac].apcborga_desc
                     DISPLAY BY NAME g_apcb_d[l_ac].apcborga_desc
                     #160908-00045#1--add(e)
                     NEXT FIELD CURRENT
                  END IF    
               END IF  
            END IF                    
            #140922 apo add end--              
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcborga
            #add-point:BEFORE FIELD apcborga name="input.b.page1.apcborga"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcborga
            #add-point:ON CHANGE apcborga name="input.g.page1.apcborga"
 
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb002
            #add-point:BEFORE FIELD apcb002 name="input.b.page1.apcb002"
 
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb002
            
            #add-point:AFTER FIELD apcb002 name="input.a.page1.apcb002"
            #來源業務單據
            IF NOT cl_null(g_apcb_d[l_ac].apcb002) THEN
               #IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_apcb_d[l_ac].apcb002 != g_apcb_d_t.apcb002 OR g_apcb_d_t.apcb002 IS NULL )) THEN  #160726-00020#8 mark
               IF g_apcb_d[l_ac].apcb002 != g_apcb_d_o.apcb002 OR cl_null(g_apcb_d_o.apcb002) THEN  #160726-00020#8              
                  #160802-00007#2 mark-----s
                  #CALL s_aapt300_source_doc_chk(g_apca_m.apcacomp,g_apca_m.apcasite,g_apca_m.apca004,g_apcb_d[l_ac].apcb001,
                  #                             g_apcb_d[l_ac].apcb002,g_apcb_d[l_ac].apcb003,g_apca_m.apcadocdt,g_apca_m.apcald)
                  #     RETURNING g_sub_success,g_errno
                  #160802-00007#2 mark-----e
                  #160802-00007#2-----s
                  INITIALIZE g_s300ar.* TO NULL
                  LET g_s300ar.apca001 = g_apca_m.apca001
                  LET g_s300ar.apca057 = g_apca_m.apca057
                  LET g_s300ar.apcald  = g_apca_m.apcald
                  LET g_s300ar.apca100 = g_apca_m.apca100 #170616-00008#1 add
                  LET ls_js = util.JSON.stringify(g_s300ar)                 
                  CALL s_aapt300_source_doc_chk(g_apca_m.apcacomp,g_apca_m.apcasite,g_apca_m.apca004,g_apcb_d[l_ac].apcb001,
                                               g_apcb_d[l_ac].apcb002,g_apcb_d[l_ac].apcb003,g_apca_m.apcadocdt,ls_js)
                       RETURNING g_sub_success,g_errno                                         
                  #160802-00007#2-----e
                  IF NOT g_sub_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     #LET g_apcb_d[l_ac].apcb002 = g_apcb_d_t.apcb002   #160726-00020#8 mark
                     LET g_apcb_d[l_ac].apcb002 = g_apcb_d_o.apcb002   #160726-00020#8
                     LET g_apcb_d[l_ac].apcb003 = g_apcb_d_o.apcb003   #160726-00020#8
                     NEXT FIELD CURRENT
                  END IF
                  #來源類型不等於19來源單號及來源項次皆有值的時候,應帶入來源單據的預設值
                  IF NOT g_apcb_d[l_ac].apcb001 MATCHES '[12]9' THEN  
                     IF NOT cl_null(g_apcb_d[l_ac].apcb002) AND NOT cl_null(g_apcb_d[l_ac].apcb003) THEN
                        CALL aapt320_get_source_b(l_ac,'') RETURNING l_apcb007_max
                        #161214-00014#1---add---str--
                        IF l_apcb007_max <= 0 THEN
                           INITIALIZE g_errparam TO NULL
                           LET g_errparam.code = 'aap-00451'
                           LET g_errparam.extend = ''
                           LET g_errparam.popup = TRUE
                           CALL cl_err()
                           NEXT FIELD CURRENT
                        END IF
                        #161214-00014#1---add---end--
                        LET g_apcb_d_o.apcb023 = g_apcb_d[l_ac].apcb023
                        LET g_apcb_d_o.apcb002 = g_apcb_d[l_ac].apcb002  #160726-00020#8
                        LET g_apcb_d_o.apcb003 = g_apcb_d[l_ac].apcb003  #160726-00020#8                        
                        #160616-00005#2--add--str--
                        #实时显示单身金额合计
                        LET g_apca_m.apcb103_s = l_sum.apcb103 + g_apcb_d[l_ac].apcb103
                        LET g_apca_m.apcb104_s = l_sum.apcb104 + g_apcb_d[l_ac].apcb104
                        LET g_apca_m.apcb105_s = l_sum.apcb105 + g_apcb_d[l_ac].apcb105
                        LET g_apca_m.apcb113_s = l_sum.apcb113 + g_apcb_d[l_ac].apcb113
                        LET g_apca_m.apcb114_s = l_sum.apcb114 + g_apcb_d[l_ac].apcb114
                        LET g_apca_m.apcb115_s = l_sum.apcb115 + g_apcb_d[l_ac].apcb115
                        DISPLAY BY NAME g_apca_m.apcb103_s,g_apca_m.apcb104_s,g_apca_m.apcb105_s,
                                        g_apca_m.apcb113_s,g_apca_m.apcb114_s,g_apca_m.apcb115_s
                        #160616-00005#2--add--end
                        #160902-00034#1 ---s---
                        CALL s_aooi200_fin_get_slip(g_apca_m.apcadocno) RETURNING g_sub_success,g_ap_slip
                        CALL s_fin_get_doc_para(g_apca_m.apcald,g_apca_m.apcacomp,g_ap_slip,'D-FIN-5002') RETURNING g_dfin5002
                        IF g_dfin5002 = 'Y' THEN
                           #輸入的資料不存在任何預算細項資料，請重新輸入!          
                           IF cl_null(g_apcb_d[l_ac].apcb017) THEN      
                              INITIALIZE g_errparam TO NULL
                              LET g_errparam.code = 'abg-00153'
                              LET g_errparam.extend = ''
                              LET g_errparam.popup = TRUE
                              LET g_apcb_d[l_ac].apcb002 = g_apcb_d_o.apcb002 
                              LET g_apcb_d[l_ac].apcb003 = g_apcb_d_o.apcb003 
                              CALL cl_err()                        
                              NEXT FIELD CURRENT
                           END IF      
                        END IF                                          
                        #160902-00034#1 ---e--
                     END IF
                  END IF
                  LET g_apcb_d_o.* = g_apcb_d[l_ac].*               #160726-00020#10
               END IF
            END IF
            CALL aapt320_set_entry_b(l_cmd)
            CALL aapt320_set_no_entry_b(l_cmd)
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb002
            #add-point:ON CHANGE apcb002 name="input.g.page1.apcb002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb003
            #add-point:BEFORE FIELD apcb003 name="input.b.page1.apcb003"
 
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb003
            
            #add-point:AFTER FIELD apcb003 name="input.a.page1.apcb003"
            #來源項次
            IF NOT cl_null(g_apcb_d[l_ac].apcb003) THEN
               #IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_apcb_d[l_ac].apcb003 != g_apcb_d_t.apcb003 OR g_apcb_d_t.apcb003 IS NULL )) THEN  #160726-00020#8 mark
               IF g_apcb_d[l_ac].apcb003 != g_apcb_d_o.apcb003 OR cl_null(g_apcb_d_o.apcb003 ) THEN        #160726-00020#8              
                  #160802-00007#2 mark-----s
                  #CALL s_aapt300_source_doc_chk(g_apca_m.apcacomp,g_apca_m.apcasite,g_apca_m.apca004,g_apcb_d[l_ac].apcb001,
                  #                              g_apcb_d[l_ac].apcb002,g_apcb_d[l_ac].apcb003,g_apca_m.apcadocdt,g_apca_m.apcald)
                  #     RETURNING g_sub_success,g_errno
                  #160802-00007#2 mark-----e
                  #160802-00007#2-----s
                  INITIALIZE g_s300ar.* TO NULL
                  LET g_s300ar.apca001 = g_apca_m.apca001
                  LET g_s300ar.apca057 = g_apca_m.apca057
                  LET g_s300ar.apcald  = g_apca_m.apcald
                  LET g_s300ar.apca100 = g_apca_m.apca100 #170616-00008#1 add
                  LET ls_js = util.JSON.stringify(g_s300ar)
                  CALL s_aapt300_source_doc_chk(g_apca_m.apcacomp,g_apca_m.apcasite,g_apca_m.apca004,g_apcb_d[l_ac].apcb001,
                                                g_apcb_d[l_ac].apcb002,g_apcb_d[l_ac].apcb003,g_apca_m.apcadocdt,ls_js)
                       RETURNING g_sub_success,g_errno                  
                  #160802-00007#2-----e
                  IF NOT g_sub_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     #LET g_apcb_d[l_ac].apcb002 = g_apcb_d_t.apcb002   #160726-00020#8 mark
                     LET g_apcb_d[l_ac].apcb002 = g_apcb_d_o.apcb002    #160726-00020#8
                     #LET g_apcb_d[l_ac].apcb002 = g_apcb_d_o.apcb003    #160726-00020#8 #170519-00022#1 mark
                     LET g_apcb_d[l_ac].apcb003 = g_apcb_d_o.apcb003 #170519-00022#1 add
                     NEXT FIELD CURRENT
                  END IF
                  #來源單號及來源項次皆有值的時候,應帶入來源單據的預設值
                  IF NOT g_apcb_d[l_ac].apcb001 MATCHES '[12]9' THEN 
                     IF NOT cl_null(g_apcb_d[l_ac].apcb002) AND NOT cl_null(g_apcb_d[l_ac].apcb003) THEN
                        CALL aapt320_get_source_b(l_ac,'') RETURNING l_apcb007_max
                        #161214-00014#1---add---str--
                        IF l_apcb007_max <= 0 THEN
                           INITIALIZE g_errparam TO NULL
                           LET g_errparam.code = 'aap-00451'
                           LET g_errparam.extend = ''
                           LET g_errparam.popup = TRUE
                           CALL cl_err()
                           NEXT FIELD CURRENT
                        END IF
                        #161214-00014#1---add---end--
                        LET g_apcb_d_o.apcb023 = g_apcb_d[l_ac].apcb023
                        LET g_apcb_d_o.apcb002 = g_apcb_d[l_ac].apcb002   #160726-00020#8
                        LET g_apcb_d_o.apcb003 = g_apcb_d[l_ac].apcb003   #160726-00020#8
                        #160616-00005#2--add--str--
                        #实时显示单身金额合计
                        LET g_apca_m.apcb103_s = l_sum.apcb103 + g_apcb_d[l_ac].apcb103
                        LET g_apca_m.apcb104_s = l_sum.apcb104 + g_apcb_d[l_ac].apcb104
                        LET g_apca_m.apcb105_s = l_sum.apcb105 + g_apcb_d[l_ac].apcb105
                        LET g_apca_m.apcb113_s = l_sum.apcb113 + g_apcb_d[l_ac].apcb113
                        LET g_apca_m.apcb114_s = l_sum.apcb114 + g_apcb_d[l_ac].apcb114
                        LET g_apca_m.apcb115_s = l_sum.apcb115 + g_apcb_d[l_ac].apcb115
                        DISPLAY BY NAME g_apca_m.apcb103_s,g_apca_m.apcb104_s,g_apca_m.apcb105_s,
                                        g_apca_m.apcb113_s,g_apca_m.apcb114_s,g_apca_m.apcb115_s
                        #160616-00005#2--add--end
                        #160902-00034#1 ---s---
                        CALL s_aooi200_fin_get_slip(g_apca_m.apcadocno) RETURNING g_sub_success,g_ap_slip
                        CALL s_fin_get_doc_para(g_apca_m.apcald,g_apca_m.apcacomp,g_ap_slip,'D-FIN-5002') RETURNING g_dfin5002
                        IF g_dfin5002 = 'Y' THEN
                           #輸入的資料不存在任何預算細項資料，請重新輸入!          
                           IF cl_null(g_apcb_d[l_ac].apcb017) THEN      
                              INITIALIZE g_errparam TO NULL
                              LET g_errparam.code = 'abg-00153'
                              LET g_errparam.extend = ''
                              LET g_errparam.popup = TRUE
                              CALL cl_err()              
                              LET g_apcb_d[l_ac].apcb003 = g_apcb_d_o.apcb003                           
                              NEXT FIELD CURRENT
                           END IF      
                        END IF                                          
                        #160902-00034#1 ---e---
                     END IF
                  END IF
                  LET g_apcb_d_o.* = g_apcb_d[l_ac].*               #160726-00020#10
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb003
            #add-point:ON CHANGE apcb003 name="input.g.page1.apcb003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb004
            #add-point:BEFORE FIELD apcb004 name="input.b.page1.apcb004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb004
            
            #add-point:AFTER FIELD apcb004 name="input.a.page1.apcb004"
            #產品編號
            IF NOT cl_null(g_apcb_d[l_ac].apcb004) THEN
               #IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_apcb_d[l_ac].apcb004 != g_apcb_d_t.apcb004 OR g_apcb_d_t.apcb004 IS NULL )) THEN   #160726-00020#10 mark
               IF g_apcb_d[l_ac].apcb004 != g_apcb_d_o.apcb004 OR cl_null(g_apcb_d_o.apcb004) THEN                                       #160726-00020#10
                  INITIALIZE g_chkparam.* TO NULL
                  #161111-00042#2 --s add 
                  LET l_apcb004_comp = ''
                  SELECT glaacomp INTO l_apcb004_comp FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_apca_m.apcald
                  #161111-00042#2 --e add 
                  #LET g_chkparam.arg1 = g_apcb_d[l_ac].apcborga  #161111-00042#2 mark
                  LET g_chkparam.arg1 = l_apcb004_comp            #161111-00042#2 add
                  LET g_chkparam.arg2 = g_apcb_d[l_ac].apcb004 
                  IF NOT cl_chk_exist("v_imaf001_3") THEN
                     #LET g_apcb_d[l_ac].apcb004 = g_apcb_d_t.apcb004   #160726-00020#10 mark
                     LET g_apcb_d[l_ac].apcb004 = g_apcb_d_o.apcb004    #160726-00020#10
                     NEXT FIELD CURRENT
                  END IF
                  LET g_apcb_d[l_ac].apcb006 = ''
                  SELECT imaf113 INTO g_apcb_d[l_ac].apcb006       #依據法人帶單位值
                    FROM imaf_t
                   WHERE imafent = g_enterprise AND imafsite = g_apca_m.apcasite
                     AND imaf001 = g_apcb_d[l_ac].apcb004
                 #IF cl_null(g_apcb_d[l_ac].apcb002) THEN                                #無來源單據的預設值(S) #160125-00005#2 
                  IF g_apcb_d[l_ac].apcb001 = '19' OR g_apcb_d[l_ac].apcb001 = '29' THEN #其他加項減項的預設值(S) #160125-00005#2
                     LET g_apcb_d[l_ac].apcb005 = ''   #160726-00020#10                  
                     CALL s_desc_get_item_desc(g_apcb_d[l_ac].apcb004) RETURNING g_apcb_d[l_ac].apcb005,l_str
                     IF cl_null(g_apcb_d[l_ac].apcb005) AND NOT cl_null(l_str) THEN
                        LET g_apcb_d[l_ac].apcb005 = l_str
                     END IF
                     IF NOT cl_null(g_apcb_d[l_ac].apcb005) AND NOT cl_null(l_str) THEN
                        LET g_apcb_d[l_ac].apcb005 = g_apcb_d[l_ac].apcb005,"/",l_str
                     END IF
                     CALL s_tax_chk(g_apca_m.apcacomp,g_apca_m.apca011) RETURNING g_sub_success,l_oodb004,l_oodb005,l_oodb006,l_oodb011
                     #albireo-s   #要細看怎麼加上0稅率條件
                     IF g_sub_success AND l_oodb011 = '2' THEN        #依料件設定稅率(S)
                        LET l_oodb006 = ''
                        LET g_apcb_d[l_ac].apcb020 = ''   #160726-00020#10
                        CALL s_tax_chktype(g_apcb_d[l_ac].apcborga,g_apca_m.apca004,g_apcb_d[l_ac].apcb004,'2',g_apca_m.apca058)
                             RETURNING g_sub_success,g_apcb_d[l_ac].apcb020,l_oodb006
                        IF NOT g_sub_success THEN RETURN END IF        #取稅別
                        LET l_oodb005 = 'N'
                        CALL s_tax_chk(g_apcb_d[l_ac].apcborga,g_apcb_d[l_ac].apcb020) RETURNING g_sub_success,l_oodb004,l_oodb005,l_oodb006,l_oodb011
                        IF NOT g_sub_success THEN RETURN END IF        #含稅否
                        
                        #albireo 141117---------------------------------------------------s
                        #單頭稅別與單身稅別勾稽
                        CALL s_aapt300_tax_chk(g_apca_m.apcacomp,g_apca_m.apca011,g_apcb_d[l_ac].apcborga,g_apcb_d[l_ac].apcb020)
                           RETURNING g_sub_success,g_errno
                        IF NOT g_sub_success THEN
                           INITIALIZE g_errparam TO NULL
                           LET g_errparam.code = g_errno
                           LET g_errparam.extend = ''
                           LET g_errparam.popup = TRUE
                           CALL cl_err()
                           RETURN
                        END IF
                        #albireo 141117---------------------------------------------------e
                        CALL aapt320_set_entry_apcb020(l_oodb005)
                        IF l_oodb005 = 'Y' THEN
                           LET g_apcb_d[l_ac].apcb103 = ''
                           LET l_apcb105 = g_apcb_d[l_ac].apcb105
                        ELSE
                           LET g_apcb_d[l_ac].apcb105 = ''
                           LET l_apcb105 = g_apcb_d[l_ac].apcb103
                        END IF
                        IF NOT cl_null(g_apcb_d[l_ac].apcb007) AND NOT cl_null(g_apcb_d[l_ac].apcb101) THEN
                           LET l_apcb105 = g_apcb_d[l_ac].apcb007 * g_apcb_d[l_ac].apcb101
                           #161121-00020#1 mark ------
                           ##160726-00020#10--S
                           #LET g_apcb_d[l_ac].apcb103 = ''   LET g_apcb_d[l_ac].apcb104 = ''   LET g_apcb_d[l_ac].apcb105 = ''   
                           #LET g_apcb_d[l_ac].apcb113 = ''   LET g_apcb_d[l_ac].apcb114 = ''   LET g_apcb_d[l_ac].apcb115 = ''   
                           #LET g_apcb_d[l_ac].apcb123 = ''   LET g_apcb_d[l_ac].apcb124 = ''   LET g_apcb_d[l_ac].apcb125 = ''   
                           #LET g_apcb_d[l_ac].apcb133 = ''   LET g_apcb_d[l_ac].apcb134 = ''   LET g_apcb_d[l_ac].apcb135 = ''   
                           ##160726-00020#10--E
                           #161121-00020#1 mark end---
                           CALL s_tax_ins(g_apca_m.apcadocno,g_apcb_d[l_ac].apcbseq,'0',g_apcb_d[l_ac].apcborga,l_apcb105,
                                          g_apcb_d[l_ac].apcb020,g_apcb_d[l_ac].apcb007,g_apca_m.apca100,g_apca_m.apca101,g_apca_m.apcald,g_apca_m.apca121,g_apca_m.apca131)
                                RETURNING g_apcb_d[l_ac].apcb103,g_apcb_d[l_ac].apcb104,g_apcb_d[l_ac].apcb105,
                                          g_apcb_d[l_ac].apcb113,g_apcb_d[l_ac].apcb114,g_apcb_d[l_ac].apcb115,
                                          g_apcb_d[l_ac].apcb123,g_apcb_d[l_ac].apcb124,g_apcb_d[l_ac].apcb125,
                                          g_apcb_d[l_ac].apcb133,g_apcb_d[l_ac].apcb134,g_apcb_d[l_ac].apcb135
                           #160616-00005#2--add--str--
                           #实时显示单身金额合计
                           LET g_apca_m.apcb103_s = l_sum.apcb103 + g_apcb_d[l_ac].apcb103
                           LET g_apca_m.apcb104_s = l_sum.apcb104 + g_apcb_d[l_ac].apcb104
                           LET g_apca_m.apcb105_s = l_sum.apcb105 + g_apcb_d[l_ac].apcb105
                           LET g_apca_m.apcb113_s = l_sum.apcb113 + g_apcb_d[l_ac].apcb113
                           LET g_apca_m.apcb114_s = l_sum.apcb114 + g_apcb_d[l_ac].apcb114
                           LET g_apca_m.apcb115_s = l_sum.apcb115 + g_apcb_d[l_ac].apcb115
                           DISPLAY BY NAME g_apca_m.apcb103_s,g_apca_m.apcb104_s,g_apca_m.apcb105_s,
                                           g_apca_m.apcb113_s,g_apca_m.apcb114_s,g_apca_m.apcb115_s
                           #160616-00005#2--add--end
                        END IF
                     END IF        #依料件設定稅率(E)
                   #END IF          #無來源單據的預設值(E)
                  END IF           #其他加項減項的預設值(E)
                  IF cl_null(g_apcb_d[l_ac].apcb021) THEN
                     LET g_apcb_d[l_ac].apcb021 = ''   #160726-00020#10
                    #CALL s_get_item_acc(g_apca_m.apcald,'1',g_apcb_d[l_ac].apcb004,'','','','')         #160120-00011#2 mark
                     LET l_pmdt016 = ''
                     IF g_apcb_d[l_ac].apcb001 = '11' OR  g_apcb_d[l_ac].apcb001 = '21' THEN
                        LET l_sql = " SELECT pmdt016 FROM pmdt_t ",
                                    "  WHERE pmdtent = ",g_enterprise,
                                    "    AND pmdtdocno = '",g_apcb_d[l_ac].apcb002,"' AND pmdtseq =", g_apcb_d[l_ac].apcb003
                        PREPARE pmdt016_pre FROM l_sql
                        EXECUTE pmdt016_pre INTO l_pmdt016
                     END IF
                     CALL s_get_item_acc(g_apca_m.apcald,'1',g_apcb_d[l_ac].apcb004,g_apca_m.apca058,g_apcb_d[l_ac].apcb034,g_apca_m.apcacomp,l_pmdt016)   #160120-00011#2
                        RETURNING g_sub_success,g_apcb_d[l_ac].apcb021
                  END IF
                  LET g_apcb_d_o.* = g_apcb_d[l_ac].*   #160726-00020#10
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb004
            #add-point:ON CHANGE apcb004 name="input.g.page1.apcb004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb005
            #add-point:BEFORE FIELD apcb005 name="input.b.page1.apcb005"
            #無來源參考單號(apcb008)，才提供輸入
            IF cl_null(g_apcb_d[l_ac].apcb008) THEN
               CALL cl_set_comp_entry("apcb005",TRUE)
            ELSE
               CALL cl_set_comp_entry("apcb005",FALSE)
            END IF
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb005
            
            #add-point:AFTER FIELD apcb005 name="input.a.page1.apcb005"
            #品名規格
            #160726-00020#10--s
            IF g_apcb_d[l_ac].apcb005 != g_apcb_d_o.apcb005 OR cl_null(g_apcb_d_o.apcb005) THEN  
               LET g_apcb_d_o.* = g_apcb_d[l_ac].* 
            END IF
            #160726-00020#10--e
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb005
            #add-point:ON CHANGE apcb005 name="input.g.page1.apcb005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb030
            #add-point:BEFORE FIELD apcb030 name="input.b.page1.apcb030"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb030
            
            #add-point:AFTER FIELD apcb030 name="input.a.page1.apcb030"
            IF NOT cl_null(g_apcb_d[l_ac].apcb030) THEN
               IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_apcb_d[l_ac].apcb030 != g_apcb_d_t.apcb030 OR g_apcb_d_t.apcb030 IS NULL )) THEN
                  CALL s_aap_ooib002_chk(g_apcb_d[l_ac].apcb030,'1')RETURNING g_sub_success,g_errno
                  IF NOT g_sub_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     #160321-00016#21 --s add
                     LET g_errparam.replace[1] = 'aooi716'
                     LET g_errparam.replace[2] = cl_get_progname('aooi716',g_lang,"2")
                     LET g_errparam.exeprog = 'aooi716'
                     #160321-00016#21 --e add
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET g_apcb_d[l_ac].apcb030 = g_apcb_d_t.apcb030
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb030
            #add-point:ON CHANGE apcb030 name="input.g.page1.apcb030"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb020
            
            #add-point:AFTER FIELD apcb020 name="input.a.page1.apcb020"
            #稅別
            LET g_apcb_d[l_ac].apcb020_desc = ''
            IF NOT cl_null(g_apcb_d[l_ac].apcb020) THEN
               #IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_apcb_d[l_ac].apcb020 != g_apcb_d_t.apcb020 OR g_apcb_d_t.apcb020 IS NULL )) THEN     #160726-00020#10 mark
               IF g_apcb_d[l_ac].apcb020 != g_apcb_d_o.apcb020 OR cl_null(g_apcb_d_o.apcb020) THEN                                          #160726-00020#10             
               
                 #CALL s_aap_tax_for_noevidence(g_apca_m.apcacomp,g_apcb_d[l_ac].apcb020) RETURNING g_sub_success,g_errno
                 #IF NOT g_sub_success THEN
                 #   INITIALIZE g_errparam TO NULL
                 #   LET g_errparam.code = g_errno
                 #   LET g_errparam.extend = ''
                 #   LET g_errparam.popup = TRUE
                 #   CALL cl_err()
                 #   LET g_apcb_d[l_ac].apcb020 = g_apcb_d_t.apcb020
                 #   NEXT FIELD CURRENT
                 #END IF
                  CALL s_tax_chk(g_apcb_d[l_ac].apcborga,g_apcb_d[l_ac].apcb020) RETURNING g_sub_success,l_oodb004,l_oodb005,l_oodb006,l_oodb011
                  IF NOT g_sub_success THEN
                     #LET g_apcb_d[l_ac].apcb020 = g_apcb_d_t.apcb020   #160726-00020#10 mark
                     LET g_apcb_d[l_ac].apcb020 = g_apcb_d_o.apcb020    #160726-00020#10
                     NEXT FIELD CURRENT
                  ELSE
                     #160511-00026#1--(S)
                     LET l_oodb004 = NULL
                     LET l_oodb008 = NULL
                     SELECT oodb004,oodb008 INTO l_oodb004,l_oodb008
                       FROM oodb_t
                      WHERE oodbent  = g_enterprise AND oodb001  = g_ooef019
                        AND oodb002  = g_apcb_d[l_ac].apcb020
                     IF l_oodb004 <> '1' THEN   #非單一稅率
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = 'aap-00182'
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = FALSE
                        CALL cl_err()
                        NEXT FIELD apcb020
                     END IF
                     IF g_sfin3012 = '1' THEN
                        IF NOT l_oodb008 MATCHES '[23]' THEN
                           INITIALIZE g_errparam TO NULL
                           LET g_errparam.code = 'aap-00182'
                           LET g_errparam.extend = ''
                           LET g_errparam.popup = FALSE
                           CALL cl_err()
                           NEXT FIELD apcb020
                        END IF
                     END IF
                     #160511-00026#1--(E)
                  END IF
                  #albireo 141117---------------------------------------------------s
                  #單頭稅別與單身稅別勾稽
                  CALL s_aapt300_tax_chk(g_apca_m.apcacomp,g_apca_m.apca011,g_apcb_d[l_ac].apcborga,g_apcb_d[l_ac].apcb020)
                     RETURNING g_sub_success,g_errno
                  IF NOT g_sub_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     #LET g_apcb_d[l_ac].apcb020 = g_apcb_d_t.apcb020     #160726-00020#10 mark
                     LET g_apcb_d[l_ac].apcb020 = g_apcb_d_o.apcb020      #160726-00020#10
                     NEXT FIELD CURRENT
                  END IF
                  #albireo 141117---------------------------------------------------e
                  CALL aapt320_set_entry_apcb020(l_oodb005)
                  IF l_oodb005 = 'Y' THEN
                     LET g_apcb_d[l_ac].apcb103 = ''
                     LET l_apcb105 = g_apcb_d[l_ac].apcb105
                  ELSE
                     LET g_apcb_d[l_ac].apcb105 = ''
                     LET l_apcb105 = g_apcb_d[l_ac].apcb103
                  END IF
                  IF NOT cl_null(g_apcb_d[l_ac].apcb007) AND NOT cl_null(g_apcb_d[l_ac].apcb101) THEN
                     LET l_apcb105 = g_apcb_d[l_ac].apcb007 * g_apcb_d[l_ac].apcb101
                     #161121-00020#1 mark ------
                     ##160726-00020#10--S
                     #LET g_apcb_d[l_ac].apcb103 = ''   LET g_apcb_d[l_ac].apcb104 = ''   LET g_apcb_d[l_ac].apcb105 = ''   
                     #LET g_apcb_d[l_ac].apcb113 = ''   LET g_apcb_d[l_ac].apcb114 = ''   LET g_apcb_d[l_ac].apcb115 = ''   
                     #LET g_apcb_d[l_ac].apcb123 = ''   LET g_apcb_d[l_ac].apcb124 = ''   LET g_apcb_d[l_ac].apcb125 = ''   
                     #LET g_apcb_d[l_ac].apcb133 = ''   LET g_apcb_d[l_ac].apcb134 = ''   LET g_apcb_d[l_ac].apcb135 = ''   
                     ##160726-00020#10--E
                     #161121-00020#1 mark end---
                     CALL s_tax_ins(g_apca_m.apcadocno,g_apcb_d[l_ac].apcbseq,'0',g_apcb_d[l_ac].apcborga,l_apcb105,
                                    g_apcb_d[l_ac].apcb020,g_apcb_d[l_ac].apcb007,g_apca_m.apca100,g_apca_m.apca101,g_apca_m.apcald,g_apca_m.apca121,g_apca_m.apca131)
                          RETURNING g_apcb_d[l_ac].apcb103,g_apcb_d[l_ac].apcb104,g_apcb_d[l_ac].apcb105,
                                    g_apcb_d[l_ac].apcb113,g_apcb_d[l_ac].apcb114,g_apcb_d[l_ac].apcb115,
                                    g_apcb_d[l_ac].apcb123,g_apcb_d[l_ac].apcb124,g_apcb_d[l_ac].apcb125,
                                    g_apcb_d[l_ac].apcb133,g_apcb_d[l_ac].apcb134,g_apcb_d[l_ac].apcb135
                     #160616-00005#2--add--str--
                     #实时显示单身金额合计
                     LET g_apca_m.apcb103_s = l_sum.apcb103 + g_apcb_d[l_ac].apcb103
                     LET g_apca_m.apcb104_s = l_sum.apcb104 + g_apcb_d[l_ac].apcb104
                     LET g_apca_m.apcb105_s = l_sum.apcb105 + g_apcb_d[l_ac].apcb105
                     LET g_apca_m.apcb113_s = l_sum.apcb113 + g_apcb_d[l_ac].apcb113
                     LET g_apca_m.apcb114_s = l_sum.apcb114 + g_apcb_d[l_ac].apcb114
                     LET g_apca_m.apcb115_s = l_sum.apcb115 + g_apcb_d[l_ac].apcb115
                     DISPLAY BY NAME g_apca_m.apcb103_s,g_apca_m.apcb104_s,g_apca_m.apcb105_s,
                                     g_apca_m.apcb113_s,g_apca_m.apcb114_s,g_apca_m.apcb115_s
                     #160616-00005#2--add--end
                  END IF
                  LET g_apcb_d_o.* = g_apcb_d[l_ac].*   #160726-00020#10
               END IF              
            END IF
            CALL s_desc_get_tax_desc(g_ooef019,g_apcb_d[l_ac].apcb020) RETURNING g_apcb_d[l_ac].apcb020_desc
            DISPLAY BY NAME g_apcb_d[l_ac].apcb020_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb020
            #add-point:BEFORE FIELD apcb020 name="input.b.page1.apcb020"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb020
            #add-point:ON CHANGE apcb020 name="input.g.page1.apcb020"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb006
            #add-point:BEFORE FIELD apcb006 name="input.b.page1.apcb006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb006
            
            #add-point:AFTER FIELD apcb006 name="input.a.page1.apcb006"
            #單位
            IF NOT cl_null(g_apcb_d[l_ac].apcb006) THEN
               #IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_apcb_d[l_ac].apcb006 != g_apcb_d_t.apcb006 OR g_apcb_d_t.apcb006 IS NULL )) THEN   #160726-00020#10 mark
               IF g_apcb_d[l_ac].apcb006 != g_apcb_d_o.apcb006 OR cl_null(g_apcb_d_o.apcb006) THEN                                      #160726-00020#10
                  LET g_chkparam.arg1 = g_apcb_d[l_ac].apcb006
                  #160318-00025#39  2016/04/22  by pengxin  add(S)
                  LET g_errshow = TRUE #是否開窗 
                  LET g_chkparam.err_str[1] = "aim-00005:sub-01302|aooi250|",cl_get_progname("aooi250",g_lang,"2"),"|:EXEPROGaooi250"
                  #160318-00025#39  2016/04/22  by pengxin  add(E)
                  IF NOT cl_chk_exist("v_ooca001") THEN
                     #LET g_apcb_d[l_ac].apcb006 = g_apcb_d_t.apcb006     #160726-00020#10 mark
                     LET g_apcb_d[l_ac].apcb006 = g_apcb_d_o.apcb006      #160726-00020#10
                     NEXT FIELD CURRENT
                  END IF
                  LET g_apcb_d_o.* = g_apcb_d[l_ac].*   #160726-00020#10
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb006
            #add-point:ON CHANGE apcb006 name="input.g.page1.apcb006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb022
            #add-point:BEFORE FIELD apcb022 name="input.b.page1.apcb022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb022
            
            #add-point:AFTER FIELD apcb022 name="input.a.page1.apcb022"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb022
            #add-point:ON CHANGE apcb022 name="input.g.page1.apcb022"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb007
            #add-point:BEFORE FIELD apcb007 name="input.b.page1.apcb007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb007
            
            #add-point:AFTER FIELD apcb007 name="input.a.page1.apcb007"
            #數量
            #
            IF NOT cl_null(g_apcb_d[l_ac].apcb007) THEN 
               #IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_apcb_d[l_ac].apcb007 != g_apcb_d_t.apcb007 OR g_apcb_d_t.apcb007 IS NULL )) THEN   #160726-00020#10 mark
               IF g_apcb_d[l_ac].apcb007 != g_apcb_d_o.apcb007 OR cl_null(g_apcb_d_o.apcb007) THEN                                       #160726-00020#10
                  IF NOT cl_null(g_apcb_d[l_ac].apcb001) AND NOT g_apcb_d[l_ac].apcb001 MATCHES '[12]9' THEN   #有來源編號者 皆要計算可立帳數量
                     IF g_apcb_d[l_ac].apcb007 > l_apcb007_max THEN
                        #LET g_apcb_d[l_ac].apcb007 = g_apcb_d_t.apcb007    #160726-00020#10 mark
                        LET g_apcb_d[l_ac].apcb007 = g_apcb_d_o.apcb007     #160726-00020#10
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = 'aap-00060'
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()

                        NEXT FIELD CURRENT
                     END IF
                  END IF
                  IF l_oodb005 = 'Y' THEN
                     LET l_apcb105 = g_apcb_d[l_ac].apcb105
                  ELSE
                     LET l_apcb105 = g_apcb_d[l_ac].apcb103
                  END IF
                  LET l_apcb105 = ''
                  IF NOT cl_null(g_apcb_d[l_ac].apcb007) AND NOT cl_null(g_apcb_d[l_ac].apcb101) THEN
                     LET l_apcb105 = g_apcb_d[l_ac].apcb007 * g_apcb_d[l_ac].apcb101
                  END IF
                  IF NOT cl_null(g_apcb_d[l_ac].apcb020) AND NOT cl_null(l_apcb105) THEN
                     #161121-00020#1 mark ------
                     ##160726-00020#10--S
                     #LET g_apcb_d[l_ac].apcb103 = ''   LET g_apcb_d[l_ac].apcb104 = ''   LET g_apcb_d[l_ac].apcb105 = ''   
                     #LET g_apcb_d[l_ac].apcb113 = ''   LET g_apcb_d[l_ac].apcb114 = ''   LET g_apcb_d[l_ac].apcb115 = ''   
                     #LET g_apcb_d[l_ac].apcb123 = ''   LET g_apcb_d[l_ac].apcb124 = ''   LET g_apcb_d[l_ac].apcb125 = ''   
                     #LET g_apcb_d[l_ac].apcb133 = ''   LET g_apcb_d[l_ac].apcb134 = ''   LET g_apcb_d[l_ac].apcb135 = ''   
                     ##160726-00020#10--E
                     #161121-00020#1 mark end---
                     CALL s_tax_ins(g_apca_m.apcadocno,g_apcb_d[l_ac].apcbseq,'0',g_apcb_d[l_ac].apcborga,l_apcb105,
                                    g_apcb_d[l_ac].apcb020,g_apcb_d[l_ac].apcb007,g_apca_m.apca100,g_apca_m.apca101,g_apca_m.apcald,g_apca_m.apca121,g_apca_m.apca131)
                          RETURNING g_apcb_d[l_ac].apcb103,g_apcb_d[l_ac].apcb104,g_apcb_d[l_ac].apcb105,
                                    g_apcb_d[l_ac].apcb113,g_apcb_d[l_ac].apcb114,g_apcb_d[l_ac].apcb115,
                                    g_apcb_d[l_ac].apcb123,g_apcb_d[l_ac].apcb124,g_apcb_d[l_ac].apcb125,
                                    g_apcb_d[l_ac].apcb133,g_apcb_d[l_ac].apcb134,g_apcb_d[l_ac].apcb135
                     #160616-00005#2--add--str--
                     #实时显示单身金额合计
                     LET g_apca_m.apcb103_s = l_sum.apcb103 + g_apcb_d[l_ac].apcb103
                     LET g_apca_m.apcb104_s = l_sum.apcb104 + g_apcb_d[l_ac].apcb104
                     LET g_apca_m.apcb105_s = l_sum.apcb105 + g_apcb_d[l_ac].apcb105
                     LET g_apca_m.apcb113_s = l_sum.apcb113 + g_apcb_d[l_ac].apcb113
                     LET g_apca_m.apcb114_s = l_sum.apcb114 + g_apcb_d[l_ac].apcb114
                     LET g_apca_m.apcb115_s = l_sum.apcb115 + g_apcb_d[l_ac].apcb115
                     DISPLAY BY NAME g_apca_m.apcb103_s,g_apca_m.apcb104_s,g_apca_m.apcb105_s,
                                     g_apca_m.apcb113_s,g_apca_m.apcb114_s,g_apca_m.apcb115_s
                     #160616-00005#2--add--end
                  END IF
                  LET g_apcb_d_o.* = g_apcb_d[l_ac].*   #160726-00020#10
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb007
            #add-point:ON CHANGE apcb007 name="input.g.page1.apcb007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb101
            #add-point:BEFORE FIELD apcb101 name="input.b.page1.apcb101"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb101
            
            #add-point:AFTER FIELD apcb101 name="input.a.page1.apcb101"
            #原幣單價
            IF NOT cl_null(g_apcb_d[l_ac].apcb101) THEN 
               #IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_apcb_d[l_ac].apcb101 != g_apcb_d_t.apcb101 OR g_apcb_d_t.apcb101 IS NULL )) THEN  #150128-00005#9 mark
               #IF g_apcb_d[l_ac].apcb101 != g_apcb_d_t.apcb101 OR g_apcb_d_t.apcb101 IS NULL THEN  #160726-00020#10 mark #150128-00005#9
               IF g_apcb_d[l_ac].apcb101 != g_apcb_d_o.apcb101 OR cl_null(g_apcb_d_o.apcb101) THEN  #160726-00020#10
                  CALL s_curr_round_ld('1',g_apca_m.apcald,g_apca_m.apca100,g_apcb_d[l_ac].apcb101,1) RETURNING g_sub_success,g_errno,g_apcb_d[l_ac].apcb101   #170504-00014#1 by 09257 --add
                  LET g_apcb_d[l_ac].apcb111 = g_apcb_d[l_ac].apcb101 * g_apca_m.apca101
                  IF cl_null(g_apcb_d[l_ac].apcb111) THEN LET g_apcb_d[l_ac].apcb111 = 0 END IF
                  #Reanna 15/02/03
                  #CALL s_curr_round_ld('1',g_apca_m.apcald,g_apca_m.glaa001,g_apcb_d[l_ac].apcb111,2) RETURNING g_sub_success,g_errno,g_apcb_d[l_ac].apcb111
                  CALL s_curr_round_ld('1',g_apca_m.apcald,g_apca_m.glaa001,g_apcb_d[l_ac].apcb111,1) RETURNING g_sub_success,g_errno,g_apcb_d[l_ac].apcb111
                 IF l_oodb005 = 'Y' THEN
                    LET l_apcb105 = g_apcb_d[l_ac].apcb105
                 ELSE
                    LET l_apcb105 = g_apcb_d[l_ac].apcb103
                 END IF
                 LET l_apcb105 = ''
                 IF NOT cl_null(g_apcb_d[l_ac].apcb007) AND NOT cl_null(g_apcb_d[l_ac].apcb101) THEN
                    LET l_apcb105 = g_apcb_d[l_ac].apcb007 * g_apcb_d[l_ac].apcb101
                 END IF
                 IF NOT cl_null(g_apcb_d[l_ac].apcb020) AND NOT cl_null(l_apcb105) THEN
                     #161121-00020#1 mark ------
                     ##160726-00020#10--S
                     #LET g_apcb_d[l_ac].apcb103 = ''   LET g_apcb_d[l_ac].apcb104 = ''   LET g_apcb_d[l_ac].apcb105 = ''   
                     #LET g_apcb_d[l_ac].apcb113 = ''   LET g_apcb_d[l_ac].apcb114 = ''   LET g_apcb_d[l_ac].apcb115 = ''   
                     #LET g_apcb_d[l_ac].apcb123 = ''   LET g_apcb_d[l_ac].apcb124 = ''   LET g_apcb_d[l_ac].apcb125 = ''   
                     #LET g_apcb_d[l_ac].apcb133 = ''   LET g_apcb_d[l_ac].apcb134 = ''   LET g_apcb_d[l_ac].apcb135 = ''   
                     ##160726-00020#10--E
                     #161121-00020#1 mark end---
                     CALL s_tax_ins(g_apca_m.apcadocno,g_apcb_d[l_ac].apcbseq,'0',g_apcb_d[l_ac].apcborga,l_apcb105,
                                    g_apcb_d[l_ac].apcb020,g_apcb_d[l_ac].apcb007,g_apca_m.apca100,g_apca_m.apca101,g_apca_m.apcald,g_apca_m.apca121,g_apca_m.apca131)
                          RETURNING g_apcb_d[l_ac].apcb103,g_apcb_d[l_ac].apcb104,g_apcb_d[l_ac].apcb105,
                                    g_apcb_d[l_ac].apcb113,g_apcb_d[l_ac].apcb114,g_apcb_d[l_ac].apcb115,
                                    g_apcb_d[l_ac].apcb123,g_apcb_d[l_ac].apcb124,g_apcb_d[l_ac].apcb125,
                                    g_apcb_d[l_ac].apcb133,g_apcb_d[l_ac].apcb134,g_apcb_d[l_ac].apcb135
                     #160616-00005#2--add--str--
                     #实时显示单身金额合计
                     LET g_apca_m.apcb103_s = l_sum.apcb103 + g_apcb_d[l_ac].apcb103
                     LET g_apca_m.apcb104_s = l_sum.apcb104 + g_apcb_d[l_ac].apcb104
                     LET g_apca_m.apcb105_s = l_sum.apcb105 + g_apcb_d[l_ac].apcb105
                     LET g_apca_m.apcb113_s = l_sum.apcb113 + g_apcb_d[l_ac].apcb113
                     LET g_apca_m.apcb114_s = l_sum.apcb114 + g_apcb_d[l_ac].apcb114
                     LET g_apca_m.apcb115_s = l_sum.apcb115 + g_apcb_d[l_ac].apcb115
                     DISPLAY BY NAME g_apca_m.apcb103_s,g_apca_m.apcb104_s,g_apca_m.apcb105_s,
                                     g_apca_m.apcb113_s,g_apca_m.apcb114_s,g_apca_m.apcb115_s
                     #160616-00005#2--add--end
                  END IF
                  LET g_apcb_d_o.* = g_apcb_d[l_ac].*   #160726-00020#10
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb101
            #add-point:ON CHANGE apcb101 name="input.g.page1.apcb101"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb103
            #add-point:BEFORE FIELD apcb103 name="input.b.page1.apcb103"
            #150128-00005#9 ---(s)---
            #根據單身稅別-含稅否 
            CALL s_tax_chk(g_glaa.glaacomp,g_apcb_d[l_ac].apcb020) 
                RETURNING g_sub_success,l_oodb004,l_oodb005,l_oodb006,l_oodb011
            #150128-00005#9 ---(e)---
            IF l_oodb005 = 'Y' AND g_apcb_d[l_ac].apcb103 = 0 AND g_apcb_d[l_ac].apcb105 = 0 THEN
               NEXT FIELD apcb105
            END IF
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb103
            
            #add-point:AFTER FIELD apcb103 name="input.a.page1.apcb103"
            #原幣未稅金額
            IF NOT cl_null(g_apcb_d[l_ac].apcb103) THEN 
               #IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_apcb_d[l_ac].apcb103 != g_apcb_d_t.apcb103 OR g_apcb_d_t.apcb103 IS NULL )) THEN  #150128-00005#9
               #IF g_apcb_d[l_ac].apcb103 != g_apcb_d_t.apcb103 OR g_apcb_d_t.apcb103 IS NULL THEN     #160726-00020#10 mark
               IF g_apcb_d[l_ac].apcb103 != g_apcb_d_o.apcb103 OR cl_null(g_apcb_d_o.apcb103) THEN    #160726-00020#10
                  IF l_oodb005 = 'N' THEN   #稅別未稅時修改未稅金額使用s_tax_ins   #150128-00005#9
                     #161121-00020#1 mark ------
                     ##160726-00020#10--S
                     #LET g_apcb_d[l_ac].apcb103 = ''   LET g_apcb_d[l_ac].apcb104 = ''   LET g_apcb_d[l_ac].apcb105 = ''   
                     #LET g_apcb_d[l_ac].apcb113 = ''   LET g_apcb_d[l_ac].apcb114 = ''   LET g_apcb_d[l_ac].apcb115 = ''   
                     #LET g_apcb_d[l_ac].apcb123 = ''   LET g_apcb_d[l_ac].apcb124 = ''   LET g_apcb_d[l_ac].apcb125 = ''   
                     #LET g_apcb_d[l_ac].apcb133 = ''   LET g_apcb_d[l_ac].apcb134 = ''   LET g_apcb_d[l_ac].apcb135 = ''   
                     ##160726-00020#10--E
                     #161121-00020#1 mark end---
                     CALL s_tax_ins(g_apca_m.apcadocno,g_apcb_d[l_ac].apcbseq,'0',g_apcb_d[l_ac].apcborga,g_apcb_d[l_ac].apcb103,
                                    g_apcb_d[l_ac].apcb020,g_apcb_d[l_ac].apcb007,g_apca_m.apca100,g_apca_m.apca101,g_apca_m.apcald,g_apca_m.apca121,g_apca_m.apca131)
                          RETURNING g_apcb_d[l_ac].apcb103,g_apcb_d[l_ac].apcb104,g_apcb_d[l_ac].apcb105,
                                    g_apcb_d[l_ac].apcb113,g_apcb_d[l_ac].apcb114,g_apcb_d[l_ac].apcb115,
                                    g_apcb_d[l_ac].apcb123,g_apcb_d[l_ac].apcb124,g_apcb_d[l_ac].apcb125,
                                    g_apcb_d[l_ac].apcb133,g_apcb_d[l_ac].apcb134,g_apcb_d[l_ac].apcb135
                  #150128-00005#9--(s)
                  #稅別含稅,修改未稅金额后使用公式反推稅額、計算本幣金額
                  ELSE
                     #160726-00020#10--S
                     LET g_apcb_d[l_ac].apcb104 = ''  
                     LET g_apcb_d[l_ac].apcb113 = ''  
                     LET g_apcb_d[l_ac].apcb114 = ''  
                     #160726-00020#10--E 
                     LET g_apcb_d[l_ac].apcb104 = g_apcb_d[l_ac].apcb105 - g_apcb_d[l_ac].apcb103
                     LET g_apcb_d[l_ac].apcb113 = g_apcb_d[l_ac].apcb103 * g_apcb_d[l_ac].apcb102
                     LET g_apcb_d[l_ac].apcb113 = s_curr_round(g_apca_m.apcasite,g_glaa.glaa001,g_apcb_d[l_ac].apcb113,2)
                     #LET g_apcb_d[l_ac].apcb114 = g_apcb_d[l_ac].apcb104 * g_apcb_d[l_ac].apcb102 #150128-00005#9 mark
                     #LET g_apcb_d[l_ac].apcb114 = s_curr_round(g_apca_m.apcasite,g_glaa.glaa001,g_apcb_d[l_ac].apcb114,2) #150128-00005#9 mark
                     #LET g_apcb_d[l_ac].apcb115 = g_apcb_d[l_ac].apcb113 + g_apcb_d[l_ac].apcb114  #150128-00005#9 mark
                     LET g_apcb_d[l_ac].apcb114 = g_apcb_d[l_ac].apcb115 - g_apcb_d[l_ac].apcb113    #150128-00005#9
                     UPDATE xrcd_t SET xrcd103 = g_apcb_d[l_ac].apcb103,
                                       xrcd104 = g_apcb_d[l_ac].apcb104,
                                       xrcd105 = g_apcb_d[l_ac].apcb105,
                                       xrcd113 = g_apcb_d[l_ac].apcb113,
                                       xrcd114 = g_apcb_d[l_ac].apcb114,
                                       xrcd115 = g_apcb_d[l_ac].apcb115
                      WHERE xrcdent   = g_enterprise
                        AND xrcddocno = g_apca_m.apcadocno
                        AND xrcdseq   = g_apcb_d[l_ac].apcbseq
                        AND xrcdld    = g_apca_m.apcald                          
                     #150128-00005#9--(e)
                  #END IF    #150128-00005#9 mark 
                  END IF 
                  
                  #150128-00005#9 mark-(s)
                  #LET g_apcb_d[l_ac].apcb105 = g_apcb_d[l_ac].apcb103 + g_apcb_d[l_ac].apcb104
                  #原幣金額修改 依據匯率重帶本幣金額的預設值
                  #LET g_apcb_d[l_ac].apcb113 = g_apcb_d[l_ac].apcb103 * g_apca_m.apca101
                  #LET g_apcb_d[l_ac].apcb115 = g_apcb_d[l_ac].apcb113 + g_apcb_d[l_ac].apcb114
                  #150128-00005#9 mark-(e)
                  CALL aapt320_save_amount_data()   #150128-00005#9
                  #160616-00005#2--add--str--
                  #实时显示单身金额合计
                  LET g_apca_m.apcb103_s = l_sum.apcb103 + g_apcb_d[l_ac].apcb103
                  LET g_apca_m.apcb104_s = l_sum.apcb104 + g_apcb_d[l_ac].apcb104
                  LET g_apca_m.apcb105_s = l_sum.apcb105 + g_apcb_d[l_ac].apcb105
                  LET g_apca_m.apcb113_s = l_sum.apcb113 + g_apcb_d[l_ac].apcb113
                  LET g_apca_m.apcb114_s = l_sum.apcb114 + g_apcb_d[l_ac].apcb114
                  LET g_apca_m.apcb115_s = l_sum.apcb115 + g_apcb_d[l_ac].apcb115
                  DISPLAY BY NAME g_apca_m.apcb103_s,g_apca_m.apcb104_s,g_apca_m.apcb105_s,
                                  g_apca_m.apcb113_s,g_apca_m.apcb114_s,g_apca_m.apcb115_s
                  #160616-00005#2--add--end
                  LET g_apcb_d_o.* = g_apcb_d[l_ac].*   #160726-00020#10
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb103
            #add-point:ON CHANGE apcb103 name="input.g.page1.apcb103"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb104
            #add-point:BEFORE FIELD apcb104 name="input.b.page1.apcb104"
            #150128-00005#9---(S)---
            #根據單身稅別-含稅否 
             CALL s_tax_chk(g_glaa.glaacomp,g_apcb_d[l_ac].apcb020) 
                 RETURNING g_sub_success,l_oodb004,l_oodb005,l_oodb006,l_oodb011
            #150128-00005#9 ---(E)---
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb104
            
            #add-point:AFTER FIELD apcb104 name="input.a.page1.apcb104"
            #150128-00005#9 ---(S)---
            IF NOT cl_null(g_apcb_d[l_ac].apcb104) THEN
               #IF g_apcb_d[l_ac].apcb104 != g_apcb_d_t.apcb104 OR g_apcb_d_t.apcb104 IS NULL THEN    #160726-00020#10 mark
               IF g_apcb_d[l_ac].apcb104 != g_apcb_d_o.apcb104 OR cl_null(g_apcb_d_o.apcb104) THEN    #160726-00020#10    
                  IF l_oodb005 = 'Y' THEN
                     LET g_apcb_d[l_ac].apcb104 = g_apcb_d_o.apcb104   #160726-00020#10
                     #160726-00020#10--s
                     LET g_apcb_d[l_ac].apcb103 = ''
                     LET g_apcb_d[l_ac].apcb114 = ''
                     LET g_apcb_d[l_ac].apcb113 = ''
                     #160726-00020#10--e
                     LET g_apcb_d[l_ac].apcb103 = g_apcb_d[l_ac].apcb105 - g_apcb_d[l_ac].apcb104
                     #0204apo -(s)
                     LET g_apcb_d[l_ac].apcb114 = g_apcb_d[l_ac].apcb104 * g_apcb_d[l_ac].apcb102  
                     LET g_apcb_d[l_ac].apcb114 = s_curr_round(g_apca_m.apcasite,g_glaa.glaa001,g_apcb_d[l_ac].apcb114,2)
                     LET g_apcb_d[l_ac].apcb113 = g_apcb_d[l_ac].apcb115 - g_apcb_d[l_ac].apcb114
                     #0204apo -(e)                  
                  ELSE
                     #160726-00020#10--s
                     LET g_apcb_d[l_ac].apcb105 = ''
                     LET g_apcb_d[l_ac].apcb114 = ''
                     LET g_apcb_d[l_ac].apcb115 = ''
                     #160726-00020#10--e
                     LET g_apcb_d[l_ac].apcb105 = g_apcb_d[l_ac].apcb103 + g_apcb_d[l_ac].apcb104
                     #0204apo -(s)
                     LET g_apcb_d[l_ac].apcb114 = g_apcb_d[l_ac].apcb104 * g_apcb_d[l_ac].apcb102  
                     LET g_apcb_d[l_ac].apcb114 = s_curr_round(g_apca_m.apcasite,g_glaa.glaa001,g_apcb_d[l_ac].apcb114,2)
                     LET g_apcb_d[l_ac].apcb115 = g_apcb_d[l_ac].apcb113 + g_apcb_d[l_ac].apcb114
                     #0204apo -(e)                                              
                  END IF
                  #-0204apo mark--
                  #LET g_apcb_d[l_ac].apcb113 = g_apcb_d[l_ac].apcb103 * g_apcb_d[l_ac].apcb102
                  #LET g_apcb_d[l_ac].apcb113 = s_curr_round(g_apca_m.apcasite,g_glaa.glaa001,g_apcb_d[l_ac].apcb113,2)
                  #LET g_apcb_d[l_ac].apcb114 = g_apcb_d[l_ac].apcb104 * g_apcb_d[l_ac].apcb102
                  #LET g_apcb_d[l_ac].apcb114 = s_curr_round(g_apca_m.apcasite,g_glaa.glaa001,g_apcb_d[l_ac].apcb114,2)
                  #LET g_apcb_d[l_ac].apcb115 = g_apcb_d[l_ac].apcb105 * g_apcb_d[l_ac].apcb102
                  #LET g_apcb_d[l_ac].apcb115 = s_curr_round(g_apca_m.apcasite,g_glaa.glaa001,g_apcb_d[l_ac].apcb115,2)
                  #-0204apo mark--
                  UPDATE xrcd_t SET xrcd103 = g_apcb_d[l_ac].apcb103,
                                    xrcd104 = g_apcb_d[l_ac].apcb104,
                                    xrcd105 = g_apcb_d[l_ac].apcb105,
                                    xrcd113 = g_apcb_d[l_ac].apcb113,
                                    xrcd114 = g_apcb_d[l_ac].apcb114,
                                    xrcd115 = g_apcb_d[l_ac].apcb115
                  WHERE xrcdent   = g_enterprise
                    AND xrcddocno = g_apca_m.apcadocno
                    AND xrcdseq   = g_apcb_d[l_ac].apcbseq
                    AND xrcdld    = g_apca_m.apcald 
                  CALL aapt320_save_amount_data()   #150128-00005#9
                  #160616-00005#2--add--str--
                  #实时显示单身金额合计
                  LET g_apca_m.apcb103_s = l_sum.apcb103 + g_apcb_d[l_ac].apcb103
                  LET g_apca_m.apcb104_s = l_sum.apcb104 + g_apcb_d[l_ac].apcb104
                  LET g_apca_m.apcb105_s = l_sum.apcb105 + g_apcb_d[l_ac].apcb105
                  LET g_apca_m.apcb113_s = l_sum.apcb113 + g_apcb_d[l_ac].apcb113
                  LET g_apca_m.apcb114_s = l_sum.apcb114 + g_apcb_d[l_ac].apcb114
                  LET g_apca_m.apcb115_s = l_sum.apcb115 + g_apcb_d[l_ac].apcb115
                  DISPLAY BY NAME g_apca_m.apcb103_s,g_apca_m.apcb104_s,g_apca_m.apcb105_s,
                                  g_apca_m.apcb113_s,g_apca_m.apcb114_s,g_apca_m.apcb115_s
                  #160616-00005#2--add--end
                  LET g_apcb_d_o.* = g_apcb_d[l_ac].*   #160726-00020#10
               END IF
            END IF
            #150128-00005#9 ---(E)---
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb104
            #add-point:ON CHANGE apcb104 name="input.g.page1.apcb104"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb105
            #add-point:BEFORE FIELD apcb105 name="input.b.page1.apcb105"
            #150128-00005#9 ---(S)---
            #根據單身稅別-含稅否 
            CALL s_tax_chk(g_glaa.glaacomp,g_apcb_d[l_ac].apcb020) 
                RETURNING g_sub_success,l_oodb004,l_oodb005,l_oodb006,l_oodb011
            #150128-00005#9 ---(E)---
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb105
            
            #add-point:AFTER FIELD apcb105 name="input.a.page1.apcb105"
            #原幣含稅金額
            IF NOT cl_null(g_apcb_d[l_ac].apcb105) THEN 
               #IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_apcb_d[l_ac].apcb105 != g_apcb_d_t.apcb105 OR g_apcb_d_t.apcb105 IS NULL )) THEN
               #IF g_apcb_d[l_ac].apcb105 != g_apcb_d_t.apcb105 OR g_apcb_d_t.apcb105 IS NULL THEN   #160726-00020#10 mark
               IF g_apcb_d[l_ac].apcb105 != g_apcb_d_o.apcb105 OR cl_null(g_apcb_d_o.apcb105) THEN    #160726-00020#10               
                  IF l_oodb005 = 'Y' THEN   #150128-00005#9 
                        #161121-00020#1 mark ------
                        ##160726-00020#10--S
                        #LET g_apcb_d[l_ac].apcb103 = ''   LET g_apcb_d[l_ac].apcb104 = ''   LET g_apcb_d[l_ac].apcb105 = ''   
                        #LET g_apcb_d[l_ac].apcb113 = ''   LET g_apcb_d[l_ac].apcb114 = ''   LET g_apcb_d[l_ac].apcb115 = ''   
                        #LET g_apcb_d[l_ac].apcb123 = ''   LET g_apcb_d[l_ac].apcb124 = ''   LET g_apcb_d[l_ac].apcb125 = ''   
                        #LET g_apcb_d[l_ac].apcb133 = ''   LET g_apcb_d[l_ac].apcb134 = ''   LET g_apcb_d[l_ac].apcb135 = ''   
                        ##160726-00020#10--E
                        #161121-00020#1 mark end---
                        CALL s_tax_ins(g_apca_m.apcadocno,g_apcb_d[l_ac].apcbseq,'0',g_apcb_d[l_ac].apcborga,g_apcb_d[l_ac].apcb105,
                                       g_apcb_d[l_ac].apcb020,g_apcb_d[l_ac].apcb007,g_apca_m.apca100,g_apca_m.apca101,g_apca_m.apcald,g_apca_m.apca121,g_apca_m.apca131)
                             RETURNING g_apcb_d[l_ac].apcb103,g_apcb_d[l_ac].apcb104,g_apcb_d[l_ac].apcb105,
                                       g_apcb_d[l_ac].apcb113,g_apcb_d[l_ac].apcb114,g_apcb_d[l_ac].apcb115,
                                       g_apcb_d[l_ac].apcb123,g_apcb_d[l_ac].apcb124,g_apcb_d[l_ac].apcb125,
                                       g_apcb_d[l_ac].apcb133,g_apcb_d[l_ac].apcb134,g_apcb_d[l_ac].apcb135

                  #150128-00005#9 ---(S)---
                  ELSE
                     #160726-00020#10--S
                     LET g_apcb_d[l_ac].apcb104 = ''  
                     LET g_apcb_d[l_ac].apcb115 = ''  
                     LET g_apcb_d[l_ac].apcb114 = ''  
                     #160726-00020#10--E
                     LET g_apcb_d[l_ac].apcb104 = g_apcb_d[l_ac].apcb105 - g_apcb_d[l_ac].apcb103
                     #0204apo mark--
                     #LET g_apcb_d[l_ac].apcb113 = g_apcb_d[l_ac].apcb103 * g_apcb_d[l_ac].apcb102
                     #LET g_apcb_d[l_ac].apcb113 = s_curr_round(g_apca_m.apcasite,g_glaa.glaa001,g_apcb_d[l_ac].apcb113,2)
                     #LET g_apcb_d[l_ac].apcb114 = g_apcb_d[l_ac].apcb104 * g_apcb_d[l_ac].apcb102
                     #LET g_apcb_d[l_ac].apcb114 = s_curr_round(g_apca_m.apcasite,g_glaa.glaa001,g_apcb_d[l_ac].apcb114,2)
                     #LET g_apcb_d[l_ac].apcb115 = g_apcb_d[l_ac].apcb113 + g_apcb_d[l_ac].apcb114 
                     #0204apo mark--
                     #0204apo--(s)
                     LET g_apcb_d[l_ac].apcb115 = g_apcb_d[l_ac].apcb105 * g_apcb_d[l_ac].apcb102
                     LET g_apcb_d[l_ac].apcb115 = s_curr_round(g_apca_m.apcasite,g_glaa.glaa001,g_apcb_d[l_ac].apcb115,2)
                     LET g_apcb_d[l_ac].apcb114 = g_apcb_d[l_ac].apcb115 - g_apcb_d[l_ac].apcb113                       
                     #0204apo--(e)
                     
                     UPDATE xrcd_t SET xrcd103 = g_apcb_d[l_ac].apcb103,
                                       xrcd104 = g_apcb_d[l_ac].apcb104,
                                       xrcd105 = g_apcb_d[l_ac].apcb105,
                                       xrcd113 = g_apcb_d[l_ac].apcb113,
                                       xrcd114 = g_apcb_d[l_ac].apcb114,
                                       xrcd115 = g_apcb_d[l_ac].apcb115
                      WHERE xrcdent   = g_enterprise
                        AND xrcddocno = g_apca_m.apcadocno
                        AND xrcdseq   = g_apcb_d[l_ac].apcbseq
                        AND xrcdld    = g_apca_m.apcald 
                  END IF
                  #150128-00005#9 ---(E)---
                  #150128-00005#9-mark-(s)             
                  #LET g_apcb_d[l_ac].apcb103 = g_apcb_d[l_ac].apcb105 - g_apcb_d[l_ac].apcb104
                  #LET g_apcb_d[l_ac].apcb113 = g_apcb_d[l_ac].apcb103 * g_apca_m.apca101
                  #LET g_apcb_d[l_ac].apcb113 = g_apcb_d[l_ac].apcb115 - g_apcb_d[l_ac].apcb114
                  #150128-00005#9-mark-(e)
                  CALL aapt320_save_amount_data()   #150128-00005#9
                  LET g_apcb_d_o.* = g_apcb_d[l_ac].*   #160726-00020#10
                  #160616-00005#2--add--str--
                  #实时显示单身金额合计
                  LET g_apca_m.apcb103_s = l_sum.apcb103 + g_apcb_d[l_ac].apcb103
                  LET g_apca_m.apcb104_s = l_sum.apcb104 + g_apcb_d[l_ac].apcb104
                  LET g_apca_m.apcb105_s = l_sum.apcb105 + g_apcb_d[l_ac].apcb105
                  LET g_apca_m.apcb113_s = l_sum.apcb113 + g_apcb_d[l_ac].apcb113
                  LET g_apca_m.apcb114_s = l_sum.apcb114 + g_apcb_d[l_ac].apcb114
                  LET g_apca_m.apcb115_s = l_sum.apcb115 + g_apcb_d[l_ac].apcb115
                  DISPLAY BY NAME g_apca_m.apcb103_s,g_apca_m.apcb104_s,g_apca_m.apcb105_s,
                                  g_apca_m.apcb113_s,g_apca_m.apcb114_s,g_apca_m.apcb115_s
                  #160616-00005#2--add--end
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb105
            #add-point:ON CHANGE apcb105 name="input.g.page1.apcb105"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb111
            #add-point:BEFORE FIELD apcb111 name="input.b.page1.apcb111"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb111
            
            #add-point:AFTER FIELD apcb111 name="input.a.page1.apcb111"
            #本幣單價
            IF NOT cl_null(g_apcb_d[l_ac].apcb111) THEN 
               #IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_apcb_d[l_ac].apcb101 != g_apcb_d_t.apcb101 OR g_apcb_d_t.apcb101 IS NULL )) THEN #150128-00005#9 mark
               #IF g_apcb_d[l_ac].apcb111 != g_apcb_d_t.apcb111 OR g_apcb_d_t.apcb111 IS NULL THEN  #160726-00020#10 mark #150128-00005#9
               IF g_apcb_d[l_ac].apcb111 != g_apcb_d_o.apcb111 OR cl_null(g_apcb_d_o.apcb111) THEN  #160726-00020#10
                 #160726-00020#10--S
                 LET g_apcb_d[l_ac].apcb115 = ''   
                 LET g_apcb_d[l_ac].apcb113 = ''  
                 #160726-00020#10--E               
                 IF l_oodb005 = 'Y' THEN
                    LET g_apcb_d[l_ac].apcb115 = g_apcb_d[l_ac].apcb007 * g_apcb_d[l_ac].apcb111
                    LET g_apcb_d[l_ac].apcb113 = g_apcb_d[l_ac].apcb115 - g_apcb_d[l_ac].apcb114
                 ELSE
                    LET g_apcb_d[l_ac].apcb113 = g_apcb_d[l_ac].apcb007 * g_apcb_d[l_ac].apcb111
                    LET g_apcb_d[l_ac].apcb115 = g_apcb_d[l_ac].apcb113 + g_apcb_d[l_ac].apcb114
                 END IF
                  #160616-00005#2--add--str--
                  #实时显示单身金额合计
                  LET g_apca_m.apcb113_s = l_sum.apcb113 + g_apcb_d[l_ac].apcb113
                  LET g_apca_m.apcb114_s = l_sum.apcb114 + g_apcb_d[l_ac].apcb114
                  LET g_apca_m.apcb115_s = l_sum.apcb115 + g_apcb_d[l_ac].apcb115
                  DISPLAY BY NAME g_apca_m.apcb113_s,g_apca_m.apcb114_s,g_apca_m.apcb115_s
                  #160616-00005#2--add--end
                  LET g_apcb_d_o.* = g_apcb_d[l_ac].*   #160726-00020#10
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb111
            #add-point:ON CHANGE apcb111 name="input.g.page1.apcb111"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb113
            #add-point:BEFORE FIELD apcb113 name="input.b.page1.apcb113"
            #150128-00005#9 ---(s)---
            #根據單身稅別-含稅否 
            CALL s_tax_chk(g_glaa.glaacomp,g_apcb_d[l_ac].apcb020) 
                RETURNING g_sub_success,l_oodb004,l_oodb005,l_oodb006,l_oodb011
            #150128-00005#9 ---(e)---
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb113
            
            #add-point:AFTER FIELD apcb113 name="input.a.page1.apcb113"
            #本幣未稅金額
            #150128-00005#9-mark-(s)
            #IF NOT cl_null(g_apcb_d[l_ac].apcb113) THEN 
            #   IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_apcb_d[l_ac].apcb113 != g_apcb_d_t.apcb113 OR g_apcb_d_t.apcb113 IS NULL )) THEN
            #      LET g_apcb_d[l_ac].apcb115 = g_apcb_d[l_ac].apcb113 + g_apcb_d[l_ac].apcb114
            #   END IF
            #END IF
            #150128-00005#9-mark-(e)
            #150128-00005#9 ---(S)---
            IF NOT cl_null(g_apcb_d[l_ac].apcb113) THEN
               #IF g_apcb_d[l_ac].apcb114 != g_apcb_d_t.apcb114 OR g_apcb_d_t.apcb114 IS NULL THEN   #160726-00020#10 mark
               IF g_apcb_d[l_ac].apcb113 != g_apcb_d_o.apcb113 OR cl_null(g_apcb_d_o.apcb113) THEN   #160726-00020#10
                  IF g_apcb_d[l_ac].apcb113 = 0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'axr-00047'
                     LET g_errparam.extend = g_apcb_d[l_ac].apcb113
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_apcb_d[l_ac].apcb113 = g_apcb_d_o.apcb113   #160726-00020#10
                     NEXT FIELD CURRENT
                  END IF
                  IF l_oodb005 = 'Y' THEN
                     LET g_apcb_d[l_ac].apcb114 = ''   #160726-00020#10
                     LET g_apcb_d[l_ac].apcb114 = g_apcb_d[l_ac].apcb115 - g_apcb_d[l_ac].apcb113
                  ELSE
                     LET g_apcb_d[l_ac].apcb115 = ''   #160726-00020#10
                     LET g_apcb_d[l_ac].apcb115 = g_apcb_d[l_ac].apcb113 + g_apcb_d[l_ac].apcb114
                  END IF
                  UPDATE xrcd_t SET xrcd113 = g_apcb_d[l_ac].apcb113,
                                    xrcd114 = g_apcb_d[l_ac].apcb114,
                                    xrcd115 = g_apcb_d[l_ac].apcb115
                  WHERE xrcdent   = g_enterprise
                    AND xrcddocno = g_apca_m.apcadocno
                    AND xrcdseq   = g_apcb_d[l_ac].apcbseq
                    AND xrcdld    = g_apca_m.apcald 
                  #稅別為含稅則可維護含稅金額, 反之可維護未稅金額
                  #1.本幣單價=本幣金額(視含稅未稅否) /數量
                  #2.以含稅金額重計匯率       #150128-00005#9
                  LET g_apcb_d[l_ac].apcb115 = ''   #160726-00020#10
                  LET g_apcb_d[l_ac].apcb102 = ''   #160726-00020#10
                  LET g_apcb_d[l_ac].apcb115 = g_apcb_d[l_ac].apcb113 + g_apcb_d[l_ac].apcb114  #本幣含稅金額
                  LET g_apcb_d[l_ac].apcb102 = g_apcb_d[l_ac].apcb115 / g_apcb_d[l_ac].apcb105  #匯率
                  CALL aapt320_save_amount_data()
                  #160616-00005#2--add--str--
                  #实时显示单身金额合计
                  LET g_apca_m.apcb113_s = l_sum.apcb113 + g_apcb_d[l_ac].apcb113
                  LET g_apca_m.apcb114_s = l_sum.apcb114 + g_apcb_d[l_ac].apcb114
                  LET g_apca_m.apcb115_s = l_sum.apcb115 + g_apcb_d[l_ac].apcb115
                  DISPLAY BY NAME g_apca_m.apcb113_s,g_apca_m.apcb114_s,g_apca_m.apcb115_s
                  #160616-00005#2--add--end
                  LET g_apcb_d_o.* = g_apcb_d[l_ac].*   #160726-00020#10
               END IF                    
            END IF
                 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb113
            #add-point:ON CHANGE apcb113 name="input.g.page1.apcb113"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb114
            #add-point:BEFORE FIELD apcb114 name="input.b.page1.apcb114"
            #150128-00005#9 ---(S)---
            #根據單身稅別-含稅否 
            CALL s_tax_chk(g_glaa.glaacomp,g_apcb_d[l_ac].apcb020) 
                RETURNING g_sub_success,l_oodb004,l_oodb005,l_oodb006,l_oodb011
            #150128-00005#9 Add ---(E)---
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb114
            
            #add-point:AFTER FIELD apcb114 name="input.a.page1.apcb114"
            #150128-00005#9 ---(S)---
            IF NOT cl_null(g_apcb_d[l_ac].apcb114) THEN
               #IF g_apcb_d[l_ac].apcb114 != g_apcb_d_t.apcb114 OR g_apcb_d_t.apcb114 IS NULL THEN  #160726-00020#10 mark  #150128-00005#9
               IF g_apcb_d[l_ac].apcb114 != g_apcb_d_o.apcb114 OR cl_null(g_apcb_d_o.apcb114) THEN   #160726-00020#10
                  IF l_oodb005 = 'Y' THEN
                     LET g_apcb_d[l_ac].apcb113 = ''   #160726-00020#10
                     LET g_apcb_d[l_ac].apcb113 = g_apcb_d[l_ac].apcb115 - g_apcb_d[l_ac].apcb114
                  ELSE
                     LET g_apcb_d[l_ac].apcb115 = ''   #160726-00020#10
                     LET g_apcb_d[l_ac].apcb115 = g_apcb_d[l_ac].apcb113 + g_apcb_d[l_ac].apcb114
                  END IF
                  UPDATE xrcd_t SET xrcd113 = g_apcb_d[l_ac].apcb113,
                                    xrcd114 = g_apcb_d[l_ac].apcb114,
                                    xrcd115 = g_apcb_d[l_ac].apcb115
                   WHERE xrcdent   = g_enterprise
                     AND xrcddocno = g_apca_m.apcadocno
                     AND xrcdseq   = g_apcb_d[l_ac].apcbseq
                     AND xrcdld    = g_apca_m.apcald 
                  CALL aapt320_save_amount_data()   #150128-00005#9
                  #160616-00005#2--add--str--
                  #实时显示单身金额合计
                  LET g_apca_m.apcb113_s = l_sum.apcb113 + g_apcb_d[l_ac].apcb113
                  LET g_apca_m.apcb114_s = l_sum.apcb114 + g_apcb_d[l_ac].apcb114
                  LET g_apca_m.apcb115_s = l_sum.apcb115 + g_apcb_d[l_ac].apcb115
                  DISPLAY BY NAME g_apca_m.apcb113_s,g_apca_m.apcb114_s,g_apca_m.apcb115_s
                  #160616-00005#2--add--end
                  LET g_apcb_d_o.* = g_apcb_d[l_ac].*   #160726-00020#10
               END IF                               #150128-00005#9
            END IF
            #150128-00005#9 ---(E)---
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb114
            #add-point:ON CHANGE apcb114 name="input.g.page1.apcb114"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb115
            #add-point:BEFORE FIELD apcb115 name="input.b.page1.apcb115"
            #150128-00005#9 ---(S)---
            #根據單身稅別-含稅否 
            CALL s_tax_chk(g_glaa.glaacomp,g_apcb_d[l_ac].apcb020) 
                RETURNING g_sub_success,l_oodb004,l_oodb005,l_oodb006,l_oodb011
            #150128-00005#9 ---(E)---
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb115
            
            #add-point:AFTER FIELD apcb115 name="input.a.page1.apcb115"
            #本幣含稅金額
            #150128-00005#9-mark-(s)
            #IF NOT cl_null(g_apcb_d[l_ac].apcb115) THEN 
            #   IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_apcb_d[l_ac].apcb115 != g_apcb_d_t.apcb115 OR g_apcb_d_t.apcb115 IS NULL )) THEN
            #      LET g_apcb_d[l_ac].apcb113 = g_apcb_d[l_ac].apcb115 - g_apcb_d[l_ac].apcb114
            #   END IF
            #END IF
            #150128-00005#9-mark-(e)
            #150128-00005#9 ---(S)---
            IF NOT cl_null(g_apcb_d[l_ac].apcb115) THEN
               #IF g_apcb_d[l_ac].apcb115 != g_apcb_d_t.apcb115 OR g_apcb_d_t.apcb115 IS NULL THEN    #160726-00020#10
               IF g_apcb_d[l_ac].apcb115 != g_apcb_d_o.apcb115 OR cl_null(g_apcb_d_o.apcb115) THEN    #160726-00020#10
                  IF g_apcb_d[l_ac].apcb115 = 0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'axr-00047'
                     LET g_errparam.extend = g_apcb_d[l_ac].apcb115
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                  
                     NEXT FIELD CURRENT
                  END IF
                  IF l_oodb005 = 'Y' THEN
                     LET g_apcb_d[l_ac].apcb113 = ''   #160726-00020#10
                     #LET g_apcb_d[l_ac].apcb114 = g_apcb_d[l_ac].apcb115 - g_apcb_d[l_ac].apcb113 #0204apo mark
                     LET g_apcb_d[l_ac].apcb113 = g_apcb_d[l_ac].apcb115 - g_apcb_d[l_ac].apcb114  #0204apo
                  ELSE
                     LET g_apcb_d[l_ac].apcb114 = ''   #160726-00020#10
                     #LET g_apcb_d[l_ac].apcb113 = g_apcb_d[l_ac].apcb115 - g_apcb_d[l_ac].apcb114 #0204apo mark
                     LET g_apcb_d[l_ac].apcb114 = g_apcb_d[l_ac].apcb115 - g_apcb_d[l_ac].apcb113  #0204apo
                  END IF
                  UPDATE xrcd_t SET xrcd113 = g_apcb_d[l_ac].apcb113,
                                    xrcd114 = g_apcb_d[l_ac].apcb114,
                                    xrcd115 = g_apcb_d[l_ac].apcb115
                   WHERE     xrcdent   = g_enterprise
                         AND xrcddocno = g_apca_m.apcadocno
                         AND xrcdseq   = g_apcb_d[l_ac].apcbseq
                         AND xrcdld    = g_apca_m.apcald
                  #稅別為含稅則可維護含稅金額, 反之可維護未稅金額                             
                  #1.本幣單價=本幣金額(視含稅未稅否) /數量
                  #2.以含稅金額重計匯率 
                  LET g_apcb_d[l_ac].apcb113 = g_apcb_d[l_ac].apcb115 - g_apcb_d[l_ac].apcb114          #本幣未稅金額
                  LET g_apcb_d[l_ac].apcb102 = g_apcb_d[l_ac].apcb115 / g_apcb_d[l_ac].apcb105          #匯率  
                  CALL aapt320_save_amount_data()   #150128-00005#9                                         
                  #160616-00005#2--add--str--
                  #实时显示单身金额合计
                  LET g_apca_m.apcb113_s = l_sum.apcb113 + g_apcb_d[l_ac].apcb113
                  LET g_apca_m.apcb114_s = l_sum.apcb114 + g_apcb_d[l_ac].apcb114
                  LET g_apca_m.apcb115_s = l_sum.apcb115 + g_apcb_d[l_ac].apcb115
                  DISPLAY BY NAME g_apca_m.apcb113_s,g_apca_m.apcb114_s,g_apca_m.apcb115_s
                  #160616-00005#2--add--end
                  LET g_apcb_d_o.* = g_apcb_d[l_ac].*   #160726-00020#10
               END IF
            END IF
               
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb115
            #add-point:ON CHANGE apcb115 name="input.g.page1.apcb115"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb028
            #add-point:BEFORE FIELD apcb028 name="input.b.page1.apcb028"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb028
            
            #add-point:AFTER FIELD apcb028 name="input.a.page1.apcb028"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb028
            #add-point:ON CHANGE apcb028 name="input.g.page1.apcb028"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb049
            #add-point:BEFORE FIELD apcb049 name="input.b.page1.apcb049"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb049
            
            #add-point:AFTER FIELD apcb049 name="input.a.page1.apcb049"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb049
            #add-point:ON CHANGE apcb049 name="input.g.page1.apcb049"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb048
            #add-point:BEFORE FIELD apcb048 name="input.b.page1.apcb048"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb048
            
            #add-point:AFTER FIELD apcb048 name="input.a.page1.apcb048"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb048
            #add-point:ON CHANGE apcb048 name="input.g.page1.apcb048"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb008
            #add-point:BEFORE FIELD apcb008 name="input.b.page1.apcb008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb008
            
            #add-point:AFTER FIELD apcb008 name="input.a.page1.apcb008"
            #來源參考單據號碼
            IF cl_null(g_apcb_d[l_ac].apcb008) THEN
               CALL cl_set_comp_entry("apcb005",TRUE)
            ELSE
               LET g_apcb_d[l_ac].apcb005 = ''
               CALL cl_set_comp_entry("apcb005",FALSE)
            END IF
            #160726-00020#10--s
            IF g_apcb_d[l_ac].apcb008 != g_apcb_d_o.apcb008 OR cl_null(g_apcb_d_o.apcb008) THEN  
               LET g_apcb_d_o.* = g_apcb_d[l_ac].* 
            END IF
            #160726-00020#10--e
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb008
            #add-point:ON CHANGE apcb008 name="input.g.page1.apcb008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb009
            #add-point:BEFORE FIELD apcb009 name="input.b.page1.apcb009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb009
            
            #add-point:AFTER FIELD apcb009 name="input.a.page1.apcb009"
 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb009
            #add-point:ON CHANGE apcb009 name="input.g.page1.apcb009"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb010
            
            #add-point:AFTER FIELD apcb010 name="input.a.page1.apcb010"
            #150828-00001#7--s
            #業務部門   
            IF NOT cl_null(g_apcb_d[l_ac].apcb010) THEN
               #IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_apcb_d[l_ac].apcb010 != g_apcb_d_t.apcb010 OR g_apcb_d_t.apcb010 IS NULL )) THEN #160726-00020#10  mark 
               IF g_apcb_d[l_ac].apcb010 != g_apcb_d_o.apcb010 OR cl_null(g_apcb_d_o.apcb010) THEN          #160726-00020#10      
                  #IF (g_apcb_d[l_ac].apcb010 != g_apcb_d_t.apcb010 OR g_apcb_d_t.apcb010 IS NULL) THEN     #160726-00020#10    mark
                  IF g_apcb_d[l_ac].apcb010 != g_apcb_d_o.apcb010 OR cl_null(g_apcb_d_o.apcb010) THEN       #160726-00020#10
                     IF g_glaa.glaa121 = 'N' THEN
                        CALL s_department_chk(g_apcb_d[l_ac].apcb010,g_apca_m.apcadocdt) RETURNING g_sub_success
                        IF NOT g_sub_success THEN
                           #LET g_apcb_d[l_ac].apcb010      = g_apcb_d_t.apcb010         #160726-00020#10  mark
                           #LET g_apcb_d[l_ac].apcb010_desc = g_apcb_d_t.apcb010_desc    #160726-00020#10  mark
                           LET g_apcb_d[l_ac].apcb010      = g_apcb_d_o.apcb010          #160726-00020#10  
                           LET g_apcb_d[l_ac].apcb010_desc = g_apcb_d_o.apcb010_desc     #160726-00020#10
                           DISPLAY BY NAME g_apcb_d[l_ac].apcb010,g_apcb_d[l_ac].apcb010_desc
                           NEXT FIELD CURRENT
                        END IF                            
                     END IF                            
                  END IF
                  LET g_apcb_d_o.* = g_apcb_d[l_ac].*         #160726-00020#10                  
               END IF
            END IF
            LET g_apcb_d[l_ac].apcb010_desc = s_desc_get_department_desc(g_apcb_d[l_ac].apcb010)
            DISPLAY BY NAME g_apcb_d[l_ac].apcb010 ,g_apcb_d[l_ac].apcb010_desc              
            #150828-00001#7--e
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb010
            #add-point:BEFORE FIELD apcb010 name="input.b.page1.apcb010"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb010
            #add-point:ON CHANGE apcb010 name="input.g.page1.apcb010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb047
            #add-point:BEFORE FIELD apcb047 name="input.b.page1.apcb047"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb047
            
            #add-point:AFTER FIELD apcb047 name="input.a.page1.apcb047"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb047
            #add-point:ON CHANGE apcb047 name="input.g.page1.apcb047"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb021
            
            #add-point:AFTER FIELD apcb021 name="input.a.page1.apcb021"
            #150206-00013#3  ---(s)---
            IF NOT cl_null(g_apcb_d[l_ac].apcb021) THEN
               #150916-00015#1 BEGIN    快捷带出类似科目编号     ADD BY XZG201511204
               #{  #151224 mark
               IF s_aglt310_getlike_lc_subject(g_apca_m.apcald,g_apcb_d[l_ac].apcb021,'') THEN
                  INITIALIZE g_qryparam.* TO NULL
                  LET g_qryparam.state = 'i'
                  LET g_qryparam.reqry = 'FALSE'
                  LET g_qryparam.default1 = g_apcb_d[l_ac].apcb021
                  LET g_qryparam.arg1 = g_glaa.glaa004
                  LET g_qryparam.arg2 = g_apcb_d[l_ac].apcb021
                  LET g_qryparam.arg3 = g_apca_m.apcald
                  LET g_qryparam.arg4 = "1"
                  CALL q_glac002_6()
                  LET g_apcb_d[l_ac].apcb021       = g_qryparam.return1
                  LET g_apcb_d[l_ac].apcb021_desc  = s_desc_get_account_desc(g_apca_m.apcald,g_apcb_d[l_ac].apcb021)
                  DISPLAY BY NAME g_apcb_d[l_ac].apcb021,g_apcb_d[l_ac].apcb021_desc
               END IF
               IF NOT s_aglt310_lc_subject(g_apca_m.apcald,g_apcb_d[l_ac].apcb021,'N') THEN
                  LET g_apcb_d[l_ac].apcb021        = g_apcb_d_t.apcb021
                  LET g_apcb_d[l_ac].apcb021_desc = g_apcb_d_t.apcb021_desc
                  DISPLAY BY NAME g_apcb_d[l_ac].apcb021,g_apcb_d[l_ac].apcb021_desc
                  NEXT FIELD CURRENT
               END IF
               #}  #151224 mark
               #150916-00015#1--(E)
               #IF ( g_apcb_d[l_ac].apcb021 != g_apcb_d_t.apcb021 OR g_apcb_d_t.apcb021 IS NULL ) THEN      #160726-00020#10 mark
               IF g_apcb_d[l_ac].apcb021 != g_apcb_d_o.apcb021 OR cl_null(g_apcb_d_o.apcb021) THEN          #160726-00020#10
                  CALL s_aap_glac002_chk(g_apcb_d[l_ac].apcb021,g_apca_m.apcald) RETURNING g_sub_success,g_errno
                  IF NOT g_sub_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     #160321-00016#21 --s add
                     LET g_errparam.replace[1] = 'agli020'
                     LET g_errparam.replace[2] = cl_get_progname('agli020',g_lang,"2")
                     LET g_errparam.exeprog = 'agli020'
                     #160321-00016#21 --e add
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     #LET g_apcb_d[l_ac].apcb021        = g_apcb_d_t.apcb021      #160726-00020#10 mark
                     #LET g_apcb_d[l_ac].apcb021_desc = g_apcb_d_t.apcb021_desc   #160726-00020#10 mark
                     LET g_apcb_d[l_ac].apcb021      = g_apcb_d_o.apcb021         #160726-00020#10 
                     LET g_apcb_d[l_ac].apcb021_desc = g_apcb_d_o.apcb021_desc    #160726-00020#10
                     DISPLAY BY NAME g_apcb_d[l_ac].apcb021,g_apcb_d[l_ac].apcb021_desc
                     NEXT FIELD CURRENT
                  END IF
                  #170512-00045#10 add ------
                  LET l_cnt = 0
                  SELECT COUNT(1) INTO l_cnt
                    FROM apcb_t
                   WHERE apcbent = g_enterprise
                     AND apcbld = g_apca_m.apcald
                     AND apcbdocno = g_apca_m.apcadocno
                     AND apcbseq = g_apcb_d[l_ac].apcbseq
                  IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
                  CALL aglt310_02('d',g_apca_m.apcald,'',g_apca_m.apcadocdt,g_apcb_d[l_ac].apcb021,'','aapt320',g_glaq_s[1].*)
                  RETURNING g_glaq_s[1].glaq017,g_glaq_s[1].glaq018,g_glaq_s[1].glaq019,g_glaq_s[1].glaq020,g_glaq_s[1].glaq021,
                            g_glaq_s[1].glaq022,g_glaq_s[1].glaq023,g_glaq_s[1].glaq024,g_glaq_s[1].glaq051,g_glaq_s[1].glaq052,
                            g_glaq_s[1].glaq053,g_glaq_s[1].glaq025,g_glaq_s[1].glaq027,g_glaq_s[1].glaq028,g_glaq_s[1].glaq029,
                            g_glaq_s[1].glaq030,g_glaq_s[1].glaq031,g_glaq_s[1].glaq032,g_glaq_s[1].glaq033,g_glaq_s[1].glaq034,
                            g_glaq_s[1].glaq035,g_glaq_s[1].glaq036,g_glaq_s[1].glaq037,g_glaq_s[1].glaq038,g_glaq_s[1].glbc004
                  
                  IF g_glaq_s[1].glaq018 <> ' ' OR g_glaq_s[2].glaq018 = ' ' THEN LET g_apcb_d[l_ac].apcb010 = g_glaq_s[1].glaq018 END IF
                  IF g_glaq_s[1].glaq019 <> ' ' OR g_glaq_s[2].glaq019 = ' ' THEN LET g_apcb_d[l_ac].apcb011 = g_glaq_s[1].glaq019 END IF
                  IF g_glaq_s[1].glaq020 <> ' ' OR g_glaq_s[2].glaq020 = ' ' THEN LET g_apcb_d[l_ac].apcb024 = g_glaq_s[1].glaq020 END IF
                  IF g_glaq_s[1].glaq021 <> ' ' OR g_glaq_s[2].glaq021 = ' ' THEN LET g_apcb_d[l_ac].apcb054 = g_glaq_s[1].glaq021 END IF
                  IF g_glaq_s[1].glaq022 <> ' ' OR g_glaq_s[2].glaq022 = ' ' THEN LET g_apcb_d[l_ac].apcb055 = g_glaq_s[1].glaq022 END IF
                  IF g_glaq_s[1].glaq023 <> ' ' OR g_glaq_s[2].glaq023 = ' ' THEN LET g_apcb_d[l_ac].apcb036 = g_glaq_s[1].glaq023 END IF
                  IF g_glaq_s[1].glaq024 <> ' ' OR g_glaq_s[2].glaq024 = ' ' THEN LET g_apcb_d[l_ac].apcb012 = g_glaq_s[1].glaq024 END IF
                  IF g_glaq_s[1].glaq051 <> ' ' OR g_glaq_s[2].glaq051 = ' ' THEN LET g_apcb_d[l_ac].l_apcb0332 = g_glaq_s[1].glaq051 END IF
                  IF g_glaq_s[1].glaq052 <> ' ' OR g_glaq_s[2].glaq052 = ' ' THEN LET g_apcb_d[l_ac].apcb034 = g_glaq_s[1].glaq052 END IF
                  IF g_glaq_s[1].glaq053 <> ' ' OR g_glaq_s[2].glaq053 = ' ' THEN LET g_apcb_d[l_ac].apcb035 = g_glaq_s[1].glaq053 END IF
                  IF g_glaq_s[1].glaq025 <> ' ' OR g_glaq_s[2].glaq025 = ' ' THEN LET g_apcb_d[l_ac].apcb051 = g_glaq_s[1].glaq025 END IF
                  IF g_glaq_s[1].glaq027 <> ' ' OR g_glaq_s[2].glaq027 = ' ' THEN LET g_apcb_d[l_ac].apcb015 = g_glaq_s[1].glaq027 END IF
                  IF g_glaq_s[1].glaq028 <> ' ' OR g_glaq_s[2].glaq028 = ' ' THEN LET g_apcb_d[l_ac].apcb016 = g_glaq_s[1].glaq028 END IF
                  IF g_glaq_s[1].glaq029 <> ' ' OR g_glaq_s[2].glaq029 = ' ' THEN LET g_apcb_d[l_ac].apcb037 = g_glaq_s[1].glaq029 END IF
                  IF g_glaq_s[1].glaq030 <> ' ' OR g_glaq_s[2].glaq030 = ' ' THEN LET g_apcb_d[l_ac].apcb038 = g_glaq_s[1].glaq030 END IF
                  IF g_glaq_s[1].glaq031 <> ' ' OR g_glaq_s[2].glaq031 = ' ' THEN LET g_apcb_d[l_ac].apcb039 = g_glaq_s[1].glaq031 END IF
                  IF g_glaq_s[1].glaq032 <> ' ' OR g_glaq_s[2].glaq032 = ' ' THEN LET g_apcb_d[l_ac].apcb040 = g_glaq_s[1].glaq032 END IF
                  IF g_glaq_s[1].glaq033 <> ' ' OR g_glaq_s[2].glaq033 = ' ' THEN LET g_apcb_d[l_ac].apcb041 = g_glaq_s[1].glaq033 END IF
                  IF g_glaq_s[1].glaq034 <> ' ' OR g_glaq_s[2].glaq034 = ' ' THEN LET g_apcb_d[l_ac].apcb042 = g_glaq_s[1].glaq034 END IF
                  IF g_glaq_s[1].glaq035 <> ' ' OR g_glaq_s[2].glaq035 = ' ' THEN LET g_apcb_d[l_ac].apcb043 = g_glaq_s[1].glaq035 END IF
                  IF g_glaq_s[1].glaq036 <> ' ' OR g_glaq_s[2].glaq036 = ' ' THEN LET g_apcb_d[l_ac].apcb044 = g_glaq_s[1].glaq036 END IF
                  IF g_glaq_s[1].glaq037 <> ' ' OR g_glaq_s[2].glaq037 = ' ' THEN LET g_apcb_d[l_ac].apcb045 = g_glaq_s[1].glaq037 END IF
                  IF g_glaq_s[1].glaq038 <> ' ' OR g_glaq_s[2].glaq038 = ' ' THEN LET g_apcb_d[l_ac].apcb046 = g_glaq_s[1].glaq038 END IF
                  DISPLAY BY NAME
                  g_apcb_d[l_ac].apcb010,g_apcb_d[l_ac].apcb011,g_apcb_d[l_ac].apcb024,
                  g_apcb_d[l_ac].apcb054,g_apcb_d[l_ac].apcb055,g_apcb_d[l_ac].apcb036,
                  g_apcb_d[l_ac].apcb012,g_apcb_d[l_ac].l_apcb0332,g_apcb_d[l_ac].apcb034,
                  g_apcb_d[l_ac].apcb035,g_apcb_d[l_ac].apcb051,g_apcb_d[l_ac].apcb015,
                  g_apcb_d[l_ac].apcb016,g_apcb_d[l_ac].apcb037,g_apcb_d[l_ac].apcb038,
                  g_apcb_d[l_ac].apcb039,g_apcb_d[l_ac].apcb040,g_apcb_d[l_ac].apcb041,
                  g_apcb_d[l_ac].apcb042,g_apcb_d[l_ac].apcb043,g_apcb_d[l_ac].apcb044,
                  g_apcb_d[l_ac].apcb045,g_apcb_d[l_ac].apcb046
                  #170512-00045#10 add end---
                  LET g_apcb_d_o.* = g_apcb_d[l_ac].*   #160726-00020#10
               END IF
               #檢查是否適用預算科目 #150703-00021#24  ---s---
               CALL s_aooi200_fin_get_slip(g_apca_m.apcadocno) RETURNING g_sub_success,g_ap_slip
               CALL s_fin_get_doc_para(g_apca_m.apcald,g_apca_m.apcacomp,g_ap_slip,'D-FIN-5002') RETURNING g_dfin5002
               IF g_dfin5002 = 'Y' THEN
                  #160902-00034#1---s---                     
                  IF cl_null(g_apcb_d[l_ac].apcb002) THEN #當沒有來源單據的時候 才會重新帶出預算細項。
                     #取得預算細項參照表                     
                     SELECT bgaa008 INTO l_bgaa008  FROM bgaa_t
                      WHERE bgaaent = g_enterprise  AND  bgaa001 = g_apca_m.apca059
                     #取得會計科目所對應的預算細項 
                     LET g_apcb_d[l_ac].apcb017  = ''
                     SELECT bgao004 INTO g_apcb_d[l_ac].apcb017 
                       FROM bgao_t
                      WHERE bgao001 = l_bgaa008       AND bgaoent = g_enterprise
                        AND bgao002 = g_glaa.glaa004  AND bgao003 = g_apcb_d[l_ac].apcb021
                     #預算細項說明    
                     SELECT bgael003 INTO g_apcb_d[l_ac].apcb017_desc 
                       FROM bgael_t 
                      WHERE bgaelent = g_enterprise           AND bgael006 = l_bgaa008  
                        AND bgael001 = g_apcb_d[l_ac].apcb017 AND bgael002 = g_dlang
                     #檢核預算細項是否可被使用(abgi100)    
                     CALL s_abg_bgai_chk(g_apca_m.apca059,g_apca_m.apcacomp,g_apcb_d[l_ac].apcb017)
                        RETURNING g_sub_success,g_errno                      
                     IF NOT g_sub_success THEN                         
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.extend = g_apcb_d[l_ac].apcb017
                        LET g_errparam.code = g_errno                     
                        LET g_errparam.popup = TRUE
                        CALL cl_err()                                                
                        LET g_apcb_d[l_ac].apcb017        = g_apcb_d_o.apcb017
                        LET g_apcb_d[l_ac].apcb017_desc   = g_apcb_d_o.apcb017_desc
                        LET g_apcb_d[l_ac].apcb021        = g_apcb_d_o.apcb021
                        LET g_apcb_d[l_ac].apcb021_desc   = g_apcb_d_o.apcb021_desc                           
                        DISPLAY BY NAME g_apcb_d[l_ac].apcb017,g_apcb_d[l_ac].apcb017_desc,g_apcb_d[l_ac].apcb021,g_apcb_d[l_ac].apcb021_desc
                        NEXT FIELD CURRENT
                     END IF
                     DISPLAY BY NAME g_apcb_d[l_ac].apcb017,g_apcb_d[l_ac].apcb017_desc
                  END IF
                  #CALL s_aapt300_bgbd_upd(g_apca_m.apcadocno,g_apca_m.apcald,g_apcb_d[l_ac].apcbseq,'','1')
                  #   RETURNING g_sub_success,g_errno
                  #IF NOT g_sub_success THEN
                  #   INITIALIZE g_errparam TO NULL
                  #   LET g_errparam.code = g_errno
                  #   LET g_errparam.extend = ''
                  #   LET g_errparam.popup = TRUE
                  #   CALL cl_err()
                  #   #LET g_apcb_d[l_ac].apcb021        = g_apcb_d_t.apcb021      #160726-00020#10 mark
                  #   #LET g_apcb_d[l_ac].apcb021_desc = g_apcb_d_t.apcb021_desc   #160726-00020#10 mark
                  #   LET g_apcb_d[l_ac].apcb021      = g_apcb_d_o.apcb021         #160726-00020#10 
                  #   LET g_apcb_d[l_ac].apcb021_desc = g_apcb_d_o.apcb021_desc    #160726-00020#10
                  #   DISPLAY BY NAME g_apcb_d[l_ac].apcb021,g_apcb_d[l_ac].apcb021_desc
                  #   NEXT FIELD CURRENT
                  #END IF     
                  #160902-00034#1---e--- 
                  #LET g_apcb_d_o.* = g_apcb_d[l_ac].*   #160726-00020#10                  
               END IF
               #150703-00021#24  ---e---
            ELSE           
               LET g_apcb_d[l_ac].apcb021 = ''
            END IF
            LET g_apcb_d[l_ac].apcb021_desc = s_desc_get_account_desc(g_apca_m.apcald,g_apcb_d[l_ac].apcb021)            
            DISPLAY BY NAME g_apcb_d[l_ac].apcb021,g_apcb_d[l_ac].apcb021_desc
            #150206-00013#3  ---(e)---
             LET g_apcb_d_o.* = g_apcb_d[l_ac].*   #160902-00034#1
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb021
            #add-point:BEFORE FIELD apcb021 name="input.b.page1.apcb021"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb021
            #add-point:ON CHANGE apcb021 name="input.g.page1.apcb021"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb021_desc
            #add-point:BEFORE FIELD apcb021_desc name="input.b.page1.apcb021_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb021_desc
            
            #add-point:AFTER FIELD apcb021_desc name="input.a.page1.apcb021_desc"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb021_desc
            #add-point:ON CHANGE apcb021_desc name="input.g.page1.apcb021_desc"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb029
            
            #add-point:AFTER FIELD apcb029 name="input.a.page1.apcb029"
            #150206-00013#3  ---(s)---
            IF NOT cl_null(g_apcb_d[l_ac].apcb029) THEN
               #150916-00015#1 BEGIN    快捷带出类似科目编号     ADD BY XZG201511204
               #{  #151224 mark
               IF s_aglt310_getlike_lc_subject(g_apca_m.apcald,g_apcb_d[l_ac].apcb029,'') THEN
                  LET g_qryparam.state = 'i'
                  LET g_qryparam.reqry = 'FALSE'
                  LET g_qryparam.default1 = g_apcb_d[l_ac].apcb029
                  LET g_qryparam.arg1 = g_glaa.glaa004
                  LET g_qryparam.arg2 = g_apcb_d[l_ac].apcb029
                  LET g_qryparam.arg3 = g_apca_m.apcald
                  LET g_qryparam.arg4 = "1 "
                  CALL q_glac002_6()
                  LET g_apcb_d[l_ac].apcb029       = g_qryparam.return1
                  LET g_apcb_d[l_ac].apcb029_desc  = s_desc_get_account_desc(g_apca_m.apcald,g_apcb_d[l_ac].apcb029)
                  DISPLAY BY NAME g_apcb_d[l_ac].apcb029,g_apcb_d[l_ac].apcb029_desc
               END IF
               IF NOT s_aglt310_lc_subject(g_apca_m.apcald,g_apcb_d[l_ac].apcb029,'N') THEN
                  LET g_apcb_d[l_ac].apcb029       = g_apcb_d_t.apcb029
                  LET g_apcb_d[l_ac].apcb029_desc  = g_apcb_d_t.apcb029_desc
                  DISPLAY BY NAME g_apcb_d[l_ac].apcb029,g_apcb_d[l_ac].apcb029_desc
                  NEXT FIELD CURRENT 
               END IF
               #}  #151224 mark
               #150916-00015#1--(E)
               #IF ( g_apcb_d[l_ac].apcb029 != g_apcb_d_t.apcb029 OR g_apcb_d_t.apcb029 IS NULL ) THEN    #170512-00045#10 mark
               IF g_apcb_d[l_ac].apcb029 != g_apcb_d_o.apcb029 OR cl_null(g_apcb_d_o.apcb029) THEN     #170512-00045#10                
                  CALL s_aap_glac002_chk(g_apcb_d[l_ac].apcb029,g_apca_m.apcald) RETURNING g_sub_success,g_errno
                  IF NOT g_sub_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     #160321-00016#21 --s add
                     LET g_errparam.replace[1] = 'agli020'
                     LET g_errparam.replace[2] = cl_get_progname('agli020',g_lang,"2")
                     LET g_errparam.exeprog = 'agli020'
                     #160321-00016#21 --e add
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_apcb_d[l_ac].apcb029       = g_apcb_d_t.apcb029
                     LET g_apcb_d[l_ac].apcb029_desc  = g_apcb_d_t.apcb029_desc
                     DISPLAY BY NAME g_apcb_d[l_ac].apcb029,g_apcb_d[l_ac].apcb029_desc
                     NEXT FIELD CURRENT
                  END IF
                  #170512-00045#10 add ------
                  LET l_cnt = 0
                  SELECT COUNT(1) INTO l_cnt
                    FROM apcb_t
                   WHERE apcbent = g_enterprise
                     AND apcbld = g_apca_m.apcald
                     AND apcbdocno = g_apca_m.apcadocno
                     AND apcbseq = g_apcb_d[l_ac].apcbseq
                  IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
                  CALL aglt310_02('c',g_apca_m.apcald,'',g_apca_m.apcadocdt,g_apcb_d[l_ac].apcb029,'','aapt320',g_glaq_s[2].*) 
                  RETURNING g_glaq_s[2].glaq017,g_glaq_s[2].glaq018,g_glaq_s[2].glaq019,g_glaq_s[2].glaq020,g_glaq_s[2].glaq021,
                            g_glaq_s[2].glaq022,g_glaq_s[2].glaq023,g_glaq_s[2].glaq024,g_glaq_s[2].glaq051,g_glaq_s[2].glaq052,
                            g_glaq_s[2].glaq053,g_glaq_s[2].glaq025,g_glaq_s[2].glaq027,g_glaq_s[2].glaq028,g_glaq_s[2].glaq029,
                            g_glaq_s[2].glaq030,g_glaq_s[2].glaq031,g_glaq_s[2].glaq032,g_glaq_s[2].glaq033,g_glaq_s[2].glaq034,
                            g_glaq_s[2].glaq035,g_glaq_s[2].glaq036,g_glaq_s[2].glaq037,g_glaq_s[2].glaq038,g_glaq_s[2].glbc004
                  
                  IF g_glaq_s[2].glaq018 <> ' ' OR g_glaq_s[1].glaq018 = ' ' THEN LET g_apcb_d[l_ac].apcb010 = g_glaq_s[2].glaq018 END IF
                  IF g_glaq_s[2].glaq019 <> ' ' OR g_glaq_s[1].glaq019 = ' ' THEN LET g_apcb_d[l_ac].apcb011 = g_glaq_s[2].glaq019 END IF
                  IF g_glaq_s[2].glaq020 <> ' ' OR g_glaq_s[1].glaq020 = ' ' THEN LET g_apcb_d[l_ac].apcb024 = g_glaq_s[2].glaq020 END IF
                  IF g_glaq_s[2].glaq021 <> ' ' OR g_glaq_s[1].glaq021 = ' ' THEN LET g_apcb_d[l_ac].apcb054 = g_glaq_s[2].glaq021 END IF
                  IF g_glaq_s[2].glaq022 <> ' ' OR g_glaq_s[1].glaq022 = ' ' THEN LET g_apcb_d[l_ac].apcb055 = g_glaq_s[2].glaq022 END IF
                  IF g_glaq_s[2].glaq023 <> ' ' OR g_glaq_s[1].glaq023 = ' ' THEN LET g_apcb_d[l_ac].apcb036 = g_glaq_s[2].glaq023 END IF
                  IF g_glaq_s[2].glaq024 <> ' ' OR g_glaq_s[1].glaq024 = ' ' THEN LET g_apcb_d[l_ac].apcb012 = g_glaq_s[2].glaq024 END IF
                  IF g_glaq_s[2].glaq051 <> ' ' OR g_glaq_s[1].glaq051 = ' ' THEN LET g_apcb_d[l_ac].l_apcb0332 = g_glaq_s[2].glaq051 END IF
                  IF g_glaq_s[2].glaq052 <> ' ' OR g_glaq_s[1].glaq052 = ' ' THEN LET g_apcb_d[l_ac].apcb034 = g_glaq_s[2].glaq052 END IF
                  IF g_glaq_s[2].glaq053 <> ' ' OR g_glaq_s[1].glaq053 = ' ' THEN LET g_apcb_d[l_ac].apcb035 = g_glaq_s[2].glaq053 END IF
                  IF g_glaq_s[2].glaq025 <> ' ' OR g_glaq_s[1].glaq025 = ' ' THEN LET g_apcb_d[l_ac].apcb051 = g_glaq_s[2].glaq025 END IF
                  IF g_glaq_s[2].glaq027 <> ' ' OR g_glaq_s[1].glaq027 = ' ' THEN LET g_apcb_d[l_ac].apcb015 = g_glaq_s[2].glaq027 END IF
                  IF g_glaq_s[2].glaq028 <> ' ' OR g_glaq_s[1].glaq028 = ' ' THEN LET g_apcb_d[l_ac].apcb016 = g_glaq_s[2].glaq028 END IF
                  IF g_glaq_s[2].glaq029 <> ' ' OR g_glaq_s[1].glaq029 = ' ' THEN LET g_apcb_d[l_ac].apcb037 = g_glaq_s[2].glaq029 END IF
                  IF g_glaq_s[2].glaq030 <> ' ' OR g_glaq_s[1].glaq030 = ' ' THEN LET g_apcb_d[l_ac].apcb038 = g_glaq_s[2].glaq030 END IF
                  IF g_glaq_s[2].glaq031 <> ' ' OR g_glaq_s[1].glaq031 = ' ' THEN LET g_apcb_d[l_ac].apcb039 = g_glaq_s[2].glaq031 END IF
                  IF g_glaq_s[2].glaq032 <> ' ' OR g_glaq_s[1].glaq032 = ' ' THEN LET g_apcb_d[l_ac].apcb040 = g_glaq_s[2].glaq032 END IF
                  IF g_glaq_s[2].glaq033 <> ' ' OR g_glaq_s[1].glaq033 = ' ' THEN LET g_apcb_d[l_ac].apcb041 = g_glaq_s[2].glaq033 END IF
                  IF g_glaq_s[2].glaq034 <> ' ' OR g_glaq_s[1].glaq034 = ' ' THEN LET g_apcb_d[l_ac].apcb042 = g_glaq_s[2].glaq034 END IF
                  IF g_glaq_s[2].glaq035 <> ' ' OR g_glaq_s[1].glaq035 = ' ' THEN LET g_apcb_d[l_ac].apcb043 = g_glaq_s[2].glaq035 END IF
                  IF g_glaq_s[2].glaq036 <> ' ' OR g_glaq_s[1].glaq036 = ' ' THEN LET g_apcb_d[l_ac].apcb044 = g_glaq_s[2].glaq036 END IF
                  IF g_glaq_s[2].glaq037 <> ' ' OR g_glaq_s[1].glaq037 = ' ' THEN LET g_apcb_d[l_ac].apcb045 = g_glaq_s[2].glaq037 END IF
                  IF g_glaq_s[2].glaq038 <> ' ' OR g_glaq_s[1].glaq038 = ' ' THEN LET g_apcb_d[l_ac].apcb046 = g_glaq_s[2].glaq038 END IF
                  DISPLAY BY NAME
                  g_apcb_d[l_ac].apcb010,g_apcb_d[l_ac].apcb011,g_apcb_d[l_ac].apcb024,
                  g_apcb_d[l_ac].apcb054,g_apcb_d[l_ac].apcb055,g_apcb_d[l_ac].apcb036,
                  g_apcb_d[l_ac].apcb012,g_apcb_d[l_ac].l_apcb0332,g_apcb_d[l_ac].apcb034,
                  g_apcb_d[l_ac].apcb035,g_apcb_d[l_ac].apcb051,g_apcb_d[l_ac].apcb015,
                  g_apcb_d[l_ac].apcb016,g_apcb_d[l_ac].apcb037,g_apcb_d[l_ac].apcb038,
                  g_apcb_d[l_ac].apcb039,g_apcb_d[l_ac].apcb040,g_apcb_d[l_ac].apcb041,
                  g_apcb_d[l_ac].apcb042,g_apcb_d[l_ac].apcb043,g_apcb_d[l_ac].apcb044,
                  g_apcb_d[l_ac].apcb045,g_apcb_d[l_ac].apcb046
                  #170512-00045#10 add end---
               END IF
            ELSE
               LET g_apcb_d[l_ac].apcb029 = ''
            END IF
            LET g_apcb_d[l_ac].apcb029_desc = s_desc_get_account_desc(g_apca_m.apcald,g_apcb_d[l_ac].apcb029)            
            DISPLAY BY NAME g_apcb_d[l_ac].apcb029,g_apcb_d[l_ac].apcb029_desc
            #150206-00013#3  ---(e)---

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb029
            #add-point:BEFORE FIELD apcb029 name="input.b.page1.apcb029"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb029
            #add-point:ON CHANGE apcb029 name="input.g.page1.apcb029"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb029_desc
            #add-point:BEFORE FIELD apcb029_desc name="input.b.page1.apcb029_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb029_desc
            
            #add-point:AFTER FIELD apcb029_desc name="input.a.page1.apcb029_desc"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb029_desc
            #add-point:ON CHANGE apcb029_desc name="input.g.page1.apcb029_desc"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb017
            
            #add-point:AFTER FIELD apcb017 name="input.a.page1.apcb017"


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb017
            #add-point:BEFORE FIELD apcb017 name="input.b.page1.apcb017"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb017
            #add-point:ON CHANGE apcb017 name="input.g.page1.apcb017"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb100
            #add-point:BEFORE FIELD apcb100 name="input.b.page1.apcb100"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb100
            
            #add-point:AFTER FIELD apcb100 name="input.a.page1.apcb100"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb100
            #add-point:ON CHANGE apcb100 name="input.g.page1.apcb100"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb123
            #add-point:BEFORE FIELD apcb123 name="input.b.page1.apcb123"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb123
            
            #add-point:AFTER FIELD apcb123 name="input.a.page1.apcb123"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb123
            #add-point:ON CHANGE apcb123 name="input.g.page1.apcb123"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb124
            #add-point:BEFORE FIELD apcb124 name="input.b.page1.apcb124"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb124
            
            #add-point:AFTER FIELD apcb124 name="input.a.page1.apcb124"
            #160726-00020#10--s
            IF g_apcb_d[l_ac].apcb124 != g_apcb_d_o.apcb124 OR cl_null(g_apcb_d_o.apcb124) THEN  
               LET g_apcb_d_o.* = g_apcb_d[l_ac].* 
            END IF
            #160726-00020#10--e
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb124
            #add-point:ON CHANGE apcb124 name="input.g.page1.apcb124"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb125
            #add-point:BEFORE FIELD apcb125 name="input.b.page1.apcb125"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb125
            
            #add-point:AFTER FIELD apcb125 name="input.a.page1.apcb125"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb125
            #add-point:ON CHANGE apcb125 name="input.g.page1.apcb125"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb133
            #add-point:BEFORE FIELD apcb133 name="input.b.page1.apcb133"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb133
            
            #add-point:AFTER FIELD apcb133 name="input.a.page1.apcb133"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb133
            #add-point:ON CHANGE apcb133 name="input.g.page1.apcb133"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb134
            #add-point:BEFORE FIELD apcb134 name="input.b.page1.apcb134"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb134
            
            #add-point:AFTER FIELD apcb134 name="input.a.page1.apcb134"
            #160726-00020#10--s
            IF g_apcb_d[l_ac].apcb134 != g_apcb_d_o.apcb134 OR cl_null(g_apcb_d_o.apcb134) THEN  
               LET g_apcb_d_o.* = g_apcb_d[l_ac].* 
            END IF
            #160726-00020#10--e
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb134
            #add-point:ON CHANGE apcb134 name="input.g.page1.apcb134"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb135
            #add-point:BEFORE FIELD apcb135 name="input.b.page1.apcb135"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb135
            
            #add-point:AFTER FIELD apcb135 name="input.a.page1.apcb135"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb135
            #add-point:ON CHANGE apcb135 name="input.g.page1.apcb135"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcblegl
            #add-point:BEFORE FIELD apcblegl name="input.b.page1.apcblegl"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcblegl
            
            #add-point:AFTER FIELD apcblegl name="input.a.page1.apcblegl"
            #160726-00020#10--s
            IF g_apcb_d[l_ac].apcblegl != g_apcb_d_o.apcblegl OR cl_null(g_apcb_d_o.apcblegl) THEN  
               LET g_apcb_d_o.* = g_apcb_d[l_ac].* 
            END IF
            #160726-00020#10--e
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcblegl
            #add-point:ON CHANGE apcblegl name="input.g.page1.apcblegl"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb011
            #add-point:BEFORE FIELD apcb011 name="input.b.page1.apcb011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb011
            
            #add-point:AFTER FIELD apcb011 name="input.a.page1.apcb011"
            #160726-00020#10--s
            IF g_apcb_d[l_ac].apcb011 != g_apcb_d_o.apcb011 OR cl_null(g_apcb_d_o.apcb011) THEN  
               LET g_apcb_d_o.* = g_apcb_d[l_ac].* 
            END IF
            #160726-00020#10--e
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb011
            #add-point:ON CHANGE apcb011 name="input.g.page1.apcb011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb012
            #add-point:BEFORE FIELD apcb012 name="input.b.page1.apcb012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb012
            
            #add-point:AFTER FIELD apcb012 name="input.a.page1.apcb012"
            #160726-00020#10--s
            IF g_apcb_d[l_ac].apcb012 != g_apcb_d_o.apcb012 OR cl_null(g_apcb_d_o.apcb012) THEN  
               LET g_apcb_d_o.* = g_apcb_d[l_ac].* 
            END IF
            #160726-00020#10--e
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb012
            #add-point:ON CHANGE apcb012 name="input.g.page1.apcb012"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb014
            #add-point:BEFORE FIELD apcb014 name="input.b.page1.apcb014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb014
            
            #add-point:AFTER FIELD apcb014 name="input.a.page1.apcb014"
            #160726-00020#10--s
            IF g_apcb_d[l_ac].apcb014 != g_apcb_d_o.apcb014 OR cl_null(g_apcb_d_o.apcb014) THEN  
               LET g_apcb_d_o.* = g_apcb_d[l_ac].* 
            END IF
            #160726-00020#10--e
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb014
            #add-point:ON CHANGE apcb014 name="input.g.page1.apcb014"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb015
            #add-point:BEFORE FIELD apcb015 name="input.b.page1.apcb015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb015
            
            #add-point:AFTER FIELD apcb015 name="input.a.page1.apcb015"


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb015
            #add-point:ON CHANGE apcb015 name="input.g.page1.apcb015"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb016
            #add-point:BEFORE FIELD apcb016 name="input.b.page1.apcb016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb016
            
            #add-point:AFTER FIELD apcb016 name="input.a.page1.apcb016"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb016
            #add-point:ON CHANGE apcb016 name="input.g.page1.apcb016"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb024
            #add-point:BEFORE FIELD apcb024 name="input.b.page1.apcb024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb024
            
            #add-point:AFTER FIELD apcb024 name="input.a.page1.apcb024"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb024
            #add-point:ON CHANGE apcb024 name="input.g.page1.apcb024"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcbsite
            #add-point:BEFORE FIELD apcbsite name="input.b.page1.apcbsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcbsite
            
            #add-point:AFTER FIELD apcbsite name="input.a.page1.apcbsite"
            #160726-00020#10--s
            IF g_apcb_d[l_ac].apcbsite != g_apcb_d_o.apcbsite OR cl_null(g_apcb_d_o.apcbsite) THEN  
               LET g_apcb_d_o.* = g_apcb_d[l_ac].* 
            END IF
            #160726-00020#10--e
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcbsite
            #add-point:ON CHANGE apcbsite name="input.g.page1.apcbsite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb013
            #add-point:BEFORE FIELD apcb013 name="input.b.page1.apcb013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb013
            
            #add-point:AFTER FIELD apcb013 name="input.a.page1.apcb013"
            #160726-00020#10--s
            IF g_apcb_d[l_ac].apcb013 != g_apcb_d_o.apcb013 OR cl_null(g_apcb_d_o.apcb013) THEN  
               LET g_apcb_d_o.* = g_apcb_d[l_ac].* 
            END IF
            #160726-00020#10--e
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb013
            #add-point:ON CHANGE apcb013 name="input.g.page1.apcb013"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb018
            #add-point:BEFORE FIELD apcb018 name="input.b.page1.apcb018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb018
            
            #add-point:AFTER FIELD apcb018 name="input.a.page1.apcb018"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb018
            #add-point:ON CHANGE apcb018 name="input.g.page1.apcb018"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb019
            #add-point:BEFORE FIELD apcb019 name="input.b.page1.apcb019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb019
            
            #add-point:AFTER FIELD apcb019 name="input.a.page1.apcb019"
            #160726-00020#10--s
            IF g_apcb_d[l_ac].apcb019 != g_apcb_d_o.apcb019 OR cl_null(g_apcb_d_o.apcb019) THEN  
               LET g_apcb_d_o.* = g_apcb_d[l_ac].* 
            END IF
            #160726-00020#10--e
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb019
            #add-point:ON CHANGE apcb019 name="input.g.page1.apcb019"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb106
            #add-point:BEFORE FIELD apcb106 name="input.b.page1.apcb106"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb106
            
            #add-point:AFTER FIELD apcb106 name="input.a.page1.apcb106"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb106
            #add-point:ON CHANGE apcb106 name="input.g.page1.apcb106"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb108
            #add-point:BEFORE FIELD apcb108 name="input.b.page1.apcb108"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb108
            
            #add-point:AFTER FIELD apcb108 name="input.a.page1.apcb108"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb108
            #add-point:ON CHANGE apcb108 name="input.g.page1.apcb108"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb051
            #add-point:BEFORE FIELD apcb051 name="input.b.page1.apcb051"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb051
            
            #add-point:AFTER FIELD apcb051 name="input.a.page1.apcb051"
            #160726-00020#10--s
            IF g_apcb_d[l_ac].apcb051 != g_apcb_d_o.apcb051 OR cl_null(g_apcb_d_o.apcb051) THEN  
               LET g_apcb_d_o.* = g_apcb_d[l_ac].* 
            END IF
            #160726-00020#10--e
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb051
            #add-point:ON CHANGE apcb051 name="input.g.page1.apcb051"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb102
            #add-point:BEFORE FIELD apcb102 name="input.b.page1.apcb102"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb102
            
            #add-point:AFTER FIELD apcb102 name="input.a.page1.apcb102"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb102
            #add-point:ON CHANGE apcb102 name="input.g.page1.apcb102"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb034
            #add-point:BEFORE FIELD apcb034 name="input.b.page1.apcb034"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb034
            
            #add-point:AFTER FIELD apcb034 name="input.a.page1.apcb034"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb034
            #add-point:ON CHANGE apcb034 name="input.g.page1.apcb034"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb054
            #add-point:BEFORE FIELD apcb054 name="input.b.page1.apcb054"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb054
            
            #add-point:AFTER FIELD apcb054 name="input.a.page1.apcb054"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb054
            #add-point:ON CHANGE apcb054 name="input.g.page1.apcb054"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb055
            #add-point:BEFORE FIELD apcb055 name="input.b.page1.apcb055"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb055
            
            #add-point:AFTER FIELD apcb055 name="input.a.page1.apcb055"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb055
            #add-point:ON CHANGE apcb055 name="input.g.page1.apcb055"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb036
            #add-point:BEFORE FIELD apcb036 name="input.b.page1.apcb036"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb036
            
            #add-point:AFTER FIELD apcb036 name="input.a.page1.apcb036"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb036
            #add-point:ON CHANGE apcb036 name="input.g.page1.apcb036"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_apcb0332
            #add-point:BEFORE FIELD l_apcb0332 name="input.b.page1.l_apcb0332"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_apcb0332
            
            #add-point:AFTER FIELD l_apcb0332 name="input.a.page1.l_apcb0332"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_apcb0332
            #add-point:ON CHANGE l_apcb0332 name="input.g.page1.l_apcb0332"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb035
            #add-point:BEFORE FIELD apcb035 name="input.b.page1.apcb035"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb035
            
            #add-point:AFTER FIELD apcb035 name="input.a.page1.apcb035"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb035
            #add-point:ON CHANGE apcb035 name="input.g.page1.apcb035"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb037
            #add-point:BEFORE FIELD apcb037 name="input.b.page1.apcb037"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb037
            
            #add-point:AFTER FIELD apcb037 name="input.a.page1.apcb037"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb037
            #add-point:ON CHANGE apcb037 name="input.g.page1.apcb037"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb038
            #add-point:BEFORE FIELD apcb038 name="input.b.page1.apcb038"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb038
            
            #add-point:AFTER FIELD apcb038 name="input.a.page1.apcb038"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb038
            #add-point:ON CHANGE apcb038 name="input.g.page1.apcb038"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb039
            #add-point:BEFORE FIELD apcb039 name="input.b.page1.apcb039"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb039
            
            #add-point:AFTER FIELD apcb039 name="input.a.page1.apcb039"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb039
            #add-point:ON CHANGE apcb039 name="input.g.page1.apcb039"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb040
            #add-point:BEFORE FIELD apcb040 name="input.b.page1.apcb040"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb040
            
            #add-point:AFTER FIELD apcb040 name="input.a.page1.apcb040"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb040
            #add-point:ON CHANGE apcb040 name="input.g.page1.apcb040"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb041
            #add-point:BEFORE FIELD apcb041 name="input.b.page1.apcb041"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb041
            
            #add-point:AFTER FIELD apcb041 name="input.a.page1.apcb041"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb041
            #add-point:ON CHANGE apcb041 name="input.g.page1.apcb041"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb042
            #add-point:BEFORE FIELD apcb042 name="input.b.page1.apcb042"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb042
            
            #add-point:AFTER FIELD apcb042 name="input.a.page1.apcb042"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb042
            #add-point:ON CHANGE apcb042 name="input.g.page1.apcb042"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb043
            #add-point:BEFORE FIELD apcb043 name="input.b.page1.apcb043"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb043
            
            #add-point:AFTER FIELD apcb043 name="input.a.page1.apcb043"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb043
            #add-point:ON CHANGE apcb043 name="input.g.page1.apcb043"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb044
            #add-point:BEFORE FIELD apcb044 name="input.b.page1.apcb044"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb044
            
            #add-point:AFTER FIELD apcb044 name="input.a.page1.apcb044"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb044
            #add-point:ON CHANGE apcb044 name="input.g.page1.apcb044"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb045
            #add-point:BEFORE FIELD apcb045 name="input.b.page1.apcb045"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb045
            
            #add-point:AFTER FIELD apcb045 name="input.a.page1.apcb045"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb045
            #add-point:ON CHANGE apcb045 name="input.g.page1.apcb045"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apcb046
            #add-point:BEFORE FIELD apcb046 name="input.b.page1.apcb046"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD apcb046
            
            #add-point:AFTER FIELD apcb046 name="input.a.page1.apcb046"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apcb046
            #add-point:ON CHANGE apcb046 name="input.g.page1.apcb046"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.apcbseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcbseq
            #add-point:ON ACTION controlp INFIELD apcbseq name="input.c.page1.apcbseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb001
            #add-point:ON ACTION controlp INFIELD apcb001 name="input.c.page1.apcb001"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcborga
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcborga
            #add-point:ON ACTION controlp INFIELD apcborga name="input.c.page1.apcborga"
            #來源組織
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
		      LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apcb_d[l_ac].apcborga
            LET g_qryparam.where    = "ooef001 IN ",g_wc_apcasite, " AND ooef017 ='",g_apca_m.apcacomp,"' ",
                                      " AND ooef201 = 'Y'"   #161006-00005#4   add
            CALL q_ooef001()                                 
            LET g_apcb_d[l_ac].apcborga = g_qryparam.return1  
            DISPLAY BY NAME g_apcb_d[l_ac].apcborga
            NEXT FIELD apcborga
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb002
            #add-point:ON ACTION controlp INFIELD apcb002 name="input.c.page1.apcb002"
            #160802-00007#2 mark-----s
            #CALL s_aapt300_source_doc_query_b(g_apcb_d[l_ac].apcb001,g_apcb_d[l_ac].apcb002,g_apcb_d[l_ac].apcb003,g_apca_m.apcasite,g_apca_m.apcald,g_apca_m.apcadocdt,g_apca_m.apca004,g_apcb_d[l_ac].apcborga,g_apca_m.apca001)
            #   RETURNING g_apcb_d[l_ac].apcb002,g_apcb_d[l_ac].apcb003
            #160802-00007#2 mark-----e
            #160802-00007#2-----s
            INITIALIZE g_s300ar.* TO NULL
            LET g_s300ar.apca001 = g_apca_m.apca001
            LET g_s300ar.apca057 = g_apca_m.apca057
            LET g_s300ar.apcald  = g_apca_m.apcald
            LET g_s300ar.apca100 = g_apca_m.apca100 #170616-00008#1 add
            LET ls_js = util.JSON.stringify(g_s300ar)
            CALL s_aapt300_source_doc_query_b(g_apcb_d[l_ac].apcb001,g_apcb_d[l_ac].apcb002,g_apcb_d[l_ac].apcb003,g_apca_m.apcasite,g_apca_m.apcald,g_apca_m.apcadocdt,g_apca_m.apca004,g_apcb_d[l_ac].apcborga,ls_js)
               RETURNING g_apcb_d[l_ac].apcb002,g_apcb_d[l_ac].apcb003            
            #160802-00007#2-----e
            NEXT FIELD apcb002
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb003
            #add-point:ON ACTION controlp INFIELD apcb003 name="input.c.page1.apcb003"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb004
            #add-point:ON ACTION controlp INFIELD apcb004 name="input.c.page1.apcb004"
            #產品編號            
            #開窗i段
            #161111-00042#2 --s add 
            LET l_apcb004_comp = ''
            SELECT glaacomp INTO l_apcb004_comp FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_apca_m.apcald
            #161111-00042#2 --e add 
		   	INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apcb_d[l_ac].apcb004   
            #LET g_qryparam.arg1 = g_apcb_d[l_ac].apcborga         #161111-00042#2 mark
            #CALL q_imaf001_7()                         #呼叫開窗   #161111-00042#2 mark
            LET g_qryparam.arg1 = l_apcb004_comp                   #161111-00042#2 add 
            CALL q_imaf001_21()                                    #161111-00042#2 add                               
            LET g_apcb_d[l_ac].apcb004 = g_qryparam.return1    
            CALL s_desc_get_item_desc(g_apcb_d[l_ac].apcb004)
                 RETURNING g_apcb_d[l_ac].apcb005,l_str
            IF cl_null(g_apcb_d[l_ac].apcb005) AND NOT cl_null(l_str) THEN
               LET g_apcb_d[l_ac].apcb005 = l_str
            END IF
            IF NOT cl_null(g_apcb_d[l_ac].apcb005) AND NOT cl_null(l_str) THEN
               LET g_apcb_d[l_ac].apcb005 = g_apcb_d[l_ac].apcb005,"/",l_str
            END IF
            DISPLAY BY NAME g_apcb_d[l_ac].apcb004,g_apcb_d[l_ac].apcb005
            NEXT FIELD apcb004
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb005
            #add-point:ON ACTION controlp INFIELD apcb005 name="input.c.page1.apcb005"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb030
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb030
            #add-point:ON ACTION controlp INFIELD apcb030 name="input.c.page1.apcb030"
            #付款條件編號            
            #開窗i段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
   			LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apcb_d[l_ac].apcb030
            LET g_qryparam.arg1 =g_apca_m.apca004
            CALL q_pmad002_2()                                
            LET g_apcb_d[l_ac].apcb030 = g_qryparam.return1   
            NEXT FIELD apcb030                           
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb020
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb020
            #add-point:ON ACTION controlp INFIELD apcb020 name="input.c.page1.apcb020"
            #稅別            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apcb_d[l_ac].apcb020
            LET g_qryparam.arg1 = g_ooef019                   #稅區
            #LET g_qryparam.where = " oodb004 ='1' AND  oodb008 = '2' "     #160511-00026#1   Mark--(S)#單一稅率(oodb004)/零稅率(oodb008)
            IF g_sfin3012 = '1' THEN   #不含稅  #160511-00026#1--(S)
               LET g_qryparam.where = " oodb004 ='1' AND oodb008 IN ('2','3') "
            ELSE
               LET g_qryparam.where = " oodb004 ='1' "
            END IF            #160511-00026#1--(E)
            CALL q_oodb002_5()                                
            LET g_apcb_d[l_ac].apcb020 = g_qryparam.return1   
            CALL s_desc_get_tax_desc(g_ooef019,g_apcb_d[l_ac].apcb020)
                 RETURNING g_apcb_d[l_ac].apcb020_desc
            DISPLAY BY NAME g_apcb_d[l_ac].apcb020,g_apcb_d[l_ac].apcb020_desc
            NEXT FIELD apcb020                     
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb006
            #add-point:ON ACTION controlp INFIELD apcb006 name="input.c.page1.apcb006"
            #單位            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apcb_d[l_ac].apcb006 
            CALL q_ooca001_1()                                 
            LET g_apcb_d[l_ac].apcb006 = g_qryparam.return1    
            DISPLAY BY NAME g_apcb_d[l_ac].apcb006             
            NEXT FIELD apcb006                            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb022
            #add-point:ON ACTION controlp INFIELD apcb022 name="input.c.page1.apcb022"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb007
            #add-point:ON ACTION controlp INFIELD apcb007 name="input.c.page1.apcb007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb101
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb101
            #add-point:ON ACTION controlp INFIELD apcb101 name="input.c.page1.apcb101"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb103
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb103
            #add-point:ON ACTION controlp INFIELD apcb103 name="input.c.page1.apcb103"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb104
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb104
            #add-point:ON ACTION controlp INFIELD apcb104 name="input.c.page1.apcb104"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb105
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb105
            #add-point:ON ACTION controlp INFIELD apcb105 name="input.c.page1.apcb105"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb111
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb111
            #add-point:ON ACTION controlp INFIELD apcb111 name="input.c.page1.apcb111"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb113
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb113
            #add-point:ON ACTION controlp INFIELD apcb113 name="input.c.page1.apcb113"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb114
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb114
            #add-point:ON ACTION controlp INFIELD apcb114 name="input.c.page1.apcb114"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb115
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb115
            #add-point:ON ACTION controlp INFIELD apcb115 name="input.c.page1.apcb115"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb028
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb028
            #add-point:ON ACTION controlp INFIELD apcb028 name="input.c.page1.apcb028"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb049
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb049
            #add-point:ON ACTION controlp INFIELD apcb049 name="input.c.page1.apcb049"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb048
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb048
            #add-point:ON ACTION controlp INFIELD apcb048 name="input.c.page1.apcb048"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb008
            #add-point:ON ACTION controlp INFIELD apcb008 name="input.c.page1.apcb008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb009
            #add-point:ON ACTION controlp INFIELD apcb009 name="input.c.page1.apcb009"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb010
            #add-point:ON ACTION controlp INFIELD apcb010 name="input.c.page1.apcb010"
            #150828-00001#7--s
            #業務部門
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apcb_d[l_ac].apcb010            
            LET g_qryparam.arg1 = g_apca_m.apcadocdt
            #CALL q_ooeg001_4()        #170814-00012#11  170824 By 10044 mark
            CALL q_ooeg001()           #170814-00012#11  170824 By 10044 add                       
            LET g_apcb_d[l_ac].apcb010 = g_qryparam.return1              
            LET g_apcb_d[l_ac].apcb010_desc = s_desc_get_department_desc(g_apcb_d[l_ac].apcb010)
            DISPLAY BY NAME g_apcb_d[l_ac].apcb010 ,g_apcb_d[l_ac].apcb010_desc               
            NEXT FIELD apcb010
            #150828-00001#7--e
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb047
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb047
            #add-point:ON ACTION controlp INFIELD apcb047 name="input.c.page1.apcb047"
            #161027-00051#3-----s
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apcb_d[l_ac].apcb047                #給予default值
            LET g_qryparam.where = " ( oocq004 = '",g_apca_m.apcacomp,"' OR oocq004 IS NULL) "
            CALL q_oocq002_2()                                #呼叫開窗
            LET g_apcb_d[l_ac].apcb047 = g_qryparam.return1              #將開窗取得的值回傳到變數
            DISPLAY g_apcb_d[l_ac].apcb047 TO apcb047              #顯示到畫面上
            NEXT FIELD apcb047
            #161027-00051#3-----e
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb021
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb021
            #add-point:ON ACTION controlp INFIELD apcb021 name="input.c.page1.apcb021"
            #150206-00013#3   ---(s)---
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apcb_d[l_ac].apcb021    
            LET g_qryparam.where = "glac001 = '",g_glaa.glaa004,"' AND  glac003 <>'1' "  ,#glac001(會計科目參照表)/glac003(科目類型)
                                 " AND glac002 IN (SELECT glad001 FROM glad_t,glac_t WHERE glad001= glac002 ",
                                 " AND glacent = gladent ", #161111-00042#2 add
                                   "AND gladld='",g_apca_m.apcald,"' AND gladent='",g_enterprise,"'",
                                   " AND gladstus = 'Y' )"
            CALL aglt310_04()                               
            LET g_apcb_d[l_ac].apcb021       = g_qryparam.return1
            LET g_apcb_d[l_ac].apcb021_desc  = s_desc_get_account_desc(g_apca_m.apcald,g_apcb_d[l_ac].apcb021)
            DISPLAY BY NAME g_apcb_d[l_ac].apcb021,g_apcb_d[l_ac].apcb021_desc                    
            #150206-00013#3   ---(e)---
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb021_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb021_desc
            #add-point:ON ACTION controlp INFIELD apcb021_desc name="input.c.page1.apcb021_desc"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb029
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb029
            #add-point:ON ACTION controlp INFIELD apcb029 name="input.c.page1.apcb029"
            #150206-00013#3   ---(s)---
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apcb_d[l_ac].apcb029    
            LET g_qryparam.where = "glac001 = '",g_glaa.glaa004,"' AND  glac003 <>'1' " , #glac001(會計科目參照表)/glac003(科目類型)
                                    " AND glac002 IN (SELECT glad001 FROM glad_t,glac_t WHERE glad001= glac002 ",
                                    " AND glacent = gladent ", #161111-00042#2 add
                                   "AND gladld='",g_apca_m.apcald,"' AND gladent='",g_enterprise,"'",
                                   " AND gladstus = 'Y' )"
            CALL aglt310_04()                               
            LET g_apcb_d[l_ac].apcb029       = g_qryparam.return1
            LET g_apcb_d[l_ac].apcb029_desc  = s_desc_get_account_desc(g_apca_m.apcald,g_apcb_d[l_ac].apcb029)
            DISPLAY BY NAME g_apcb_d[l_ac].apcb029,g_apcb_d[l_ac].apcb029_desc
            #150206-00013#3   ---(e)---        
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb029_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb029_desc
            #add-point:ON ACTION controlp INFIELD apcb029_desc name="input.c.page1.apcb029_desc"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb017
            #add-point:ON ACTION controlp INFIELD apcb017 name="input.c.page1.apcb017"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb100
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb100
            #add-point:ON ACTION controlp INFIELD apcb100 name="input.c.page1.apcb100"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb123
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb123
            #add-point:ON ACTION controlp INFIELD apcb123 name="input.c.page1.apcb123"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb124
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb124
            #add-point:ON ACTION controlp INFIELD apcb124 name="input.c.page1.apcb124"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb125
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb125
            #add-point:ON ACTION controlp INFIELD apcb125 name="input.c.page1.apcb125"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb133
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb133
            #add-point:ON ACTION controlp INFIELD apcb133 name="input.c.page1.apcb133"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb134
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb134
            #add-point:ON ACTION controlp INFIELD apcb134 name="input.c.page1.apcb134"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb135
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb135
            #add-point:ON ACTION controlp INFIELD apcb135 name="input.c.page1.apcb135"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcblegl
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcblegl
            #add-point:ON ACTION controlp INFIELD apcblegl name="input.c.page1.apcblegl"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb011
            #add-point:ON ACTION controlp INFIELD apcb011 name="input.c.page1.apcb011"
 
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb012
            #add-point:ON ACTION controlp INFIELD apcb012 name="input.c.page1.apcb012"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb014
            #add-point:ON ACTION controlp INFIELD apcb014 name="input.c.page1.apcb014"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb015
            #add-point:ON ACTION controlp INFIELD apcb015 name="input.c.page1.apcb015"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb016
            #add-point:ON ACTION controlp INFIELD apcb016 name="input.c.page1.apcb016"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb024
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb024
            #add-point:ON ACTION controlp INFIELD apcb024 name="input.c.page1.apcb024"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcbsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcbsite
            #add-point:ON ACTION controlp INFIELD apcbsite name="input.c.page1.apcbsite"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb013
            #add-point:ON ACTION controlp INFIELD apcb013 name="input.c.page1.apcb013"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb018
            #add-point:ON ACTION controlp INFIELD apcb018 name="input.c.page1.apcb018"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb019
            #add-point:ON ACTION controlp INFIELD apcb019 name="input.c.page1.apcb019"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb106
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb106
            #add-point:ON ACTION controlp INFIELD apcb106 name="input.c.page1.apcb106"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb108
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb108
            #add-point:ON ACTION controlp INFIELD apcb108 name="input.c.page1.apcb108"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb051
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb051
            #add-point:ON ACTION controlp INFIELD apcb051 name="input.c.page1.apcb051"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb102
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb102
            #add-point:ON ACTION controlp INFIELD apcb102 name="input.c.page1.apcb102"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb034
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb034
            #add-point:ON ACTION controlp INFIELD apcb034 name="input.c.page1.apcb034"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb054
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb054
            #add-point:ON ACTION controlp INFIELD apcb054 name="input.c.page1.apcb054"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb055
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb055
            #add-point:ON ACTION controlp INFIELD apcb055 name="input.c.page1.apcb055"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb036
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb036
            #add-point:ON ACTION controlp INFIELD apcb036 name="input.c.page1.apcb036"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_apcb0332
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_apcb0332
            #add-point:ON ACTION controlp INFIELD l_apcb0332 name="input.c.page1.l_apcb0332"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb035
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb035
            #add-point:ON ACTION controlp INFIELD apcb035 name="input.c.page1.apcb035"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb037
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb037
            #add-point:ON ACTION controlp INFIELD apcb037 name="input.c.page1.apcb037"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb038
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb038
            #add-point:ON ACTION controlp INFIELD apcb038 name="input.c.page1.apcb038"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb039
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb039
            #add-point:ON ACTION controlp INFIELD apcb039 name="input.c.page1.apcb039"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb040
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb040
            #add-point:ON ACTION controlp INFIELD apcb040 name="input.c.page1.apcb040"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb041
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb041
            #add-point:ON ACTION controlp INFIELD apcb041 name="input.c.page1.apcb041"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb042
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb042
            #add-point:ON ACTION controlp INFIELD apcb042 name="input.c.page1.apcb042"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb043
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb043
            #add-point:ON ACTION controlp INFIELD apcb043 name="input.c.page1.apcb043"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb044
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb044
            #add-point:ON ACTION controlp INFIELD apcb044 name="input.c.page1.apcb044"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb045
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb045
            #add-point:ON ACTION controlp INFIELD apcb045 name="input.c.page1.apcb045"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apcb046
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apcb046
            #add-point:ON ACTION controlp INFIELD apcb046 name="input.c.page1.apcb046"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_apcb_d[l_ac].* = g_apcb_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE aapt320_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_apcb_d[l_ac].apcbseq 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_apcb_d[l_ac].* = g_apcb_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
               #150703-00021#24 ---s---
               IF s_transaction_chk("N",0) THEN
                  CALL s_transaction_begin()
               END IF
               #150703-00021#24 ---e---                                             
               IF NOT cl_null(g_apcb_d[g_detail_idx].apcb002) AND NOT cl_null(g_apcb_d[g_detail_idx].apcb003) THEN
                  #原單身若修改單號+項次(先把數量釋放出來)
                  CALL s_aapt300_pmdt_upd(g_apca_m.apcald,g_apca_m.apcadocno,g_apcb_d[g_detail_idx].apcbseq,'-') RETURNING g_sub_success,g_errno
                  CALL s_aapt300_pmdt_get_apcb007(g_apca_m.apcald,g_apcb_d[l_ac].apcb002,g_apcb_d[l_ac].apcb003,g_apca_m.apca001) 
                       RETURNING l_apcb007_max,g_sub_success
               END IF
               #150211--(S)---
               CALL s_curr_round_ld('1',g_apca_m.apcald,g_apca_m.apca100,g_apcb_d[l_ac].apcb101,1) RETURNING g_sub_success,g_errno,g_apcb_d[l_ac].apcb101   #單價  
               CALL s_curr_round_ld('1',g_apca_m.apcald,g_apca_m.apca100,g_apcb_d[l_ac].apcb102,3) RETURNING g_sub_success,g_errno,g_apcb_d[l_ac].apcb102   #匯率
               CALL s_curr_round_ld('1',g_apca_m.apcald,g_glaa.glaa001,g_apcb_d[l_ac].apcb111,1) RETURNING g_sub_success,g_errno,g_apcb_d[l_ac].apcb111     #本幣單價 
               CALL s_curr_round_ld('1',g_apca_m.apcald,g_glaa.glaa001,g_apcb_d[l_ac].apcb113,2) RETURNING g_sub_success,g_errno,g_apcb_d[l_ac].apcb113     #本幣未稅
               CALL s_curr_round_ld('1',g_apca_m.apcald,g_glaa.glaa001,g_apcb_d[l_ac].apcb114,2) RETURNING g_sub_success,g_errno,g_apcb_d[l_ac].apcb114     #本幣稅額
               CALL s_curr_round_ld('1',g_apca_m.apcald,g_glaa.glaa001,g_apcb_d[l_ac].apcb115,2) RETURNING g_sub_success,g_errno,g_apcb_d[l_ac].apcb115     #本幣含稅           
               #150211--(E)---
               #170512-00045#10 add ------
               #更新經營方式
               UPDATE apcb_t
                  SET apcb033 = g_apcb_d[l_ac].l_apcb0332
                WHERE apcbent = g_enterprise
                  AND apcbld = g_apca_m.apcald
                  AND apcbdocno = g_apca_m.apcadocno
                  AND apcbseq = g_apcb_d_t.apcbseq
               #170512-00045#10 add end---
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL aapt320_apcb_t_mask_restore('restore_mask_o')
      
               UPDATE apcb_t SET (apcbld,apcbdocno,apcbseq,apcb001,apcborga,apcb002,apcb003,apcb023, 
                   apcb004,apcb005,apcb030,apcb020,apcb006,apcb022,apcb007,apcb101,apcb103,apcb104,apcb105, 
                   apcb111,apcb113,apcb114,apcb115,apcb028,apcb049,apcb048,apcb008,apcb009,apcb010,apcb047, 
                   apcb021,apcb029,apcb017,apcb100,apcb123,apcb124,apcb125,apcb133,apcb134,apcb135,apcblegl, 
                   apcb011,apcb012,apcb014,apcb015,apcb016,apcb024,apcbsite,apcb013,apcb018,apcb019, 
                   apcb106,apcb108,apcb051,apcb102,apcb034,apcb054,apcb055,apcb036,apcb035,apcb037,apcb038, 
                   apcb039,apcb040,apcb041,apcb042,apcb043,apcb044,apcb045,apcb046) = (g_apca_m.apcald, 
                   g_apca_m.apcadocno,g_apcb_d[l_ac].apcbseq,g_apcb_d[l_ac].apcb001,g_apcb_d[l_ac].apcborga, 
                   g_apcb_d[l_ac].apcb002,g_apcb_d[l_ac].apcb003,g_apcb_d[l_ac].apcb023,g_apcb_d[l_ac].apcb004, 
                   g_apcb_d[l_ac].apcb005,g_apcb_d[l_ac].apcb030,g_apcb_d[l_ac].apcb020,g_apcb_d[l_ac].apcb006, 
                   g_apcb_d[l_ac].apcb022,g_apcb_d[l_ac].apcb007,g_apcb_d[l_ac].apcb101,g_apcb_d[l_ac].apcb103, 
                   g_apcb_d[l_ac].apcb104,g_apcb_d[l_ac].apcb105,g_apcb_d[l_ac].apcb111,g_apcb_d[l_ac].apcb113, 
                   g_apcb_d[l_ac].apcb114,g_apcb_d[l_ac].apcb115,g_apcb_d[l_ac].apcb028,g_apcb_d[l_ac].apcb049, 
                   g_apcb_d[l_ac].apcb048,g_apcb_d[l_ac].apcb008,g_apcb_d[l_ac].apcb009,g_apcb_d[l_ac].apcb010, 
                   g_apcb_d[l_ac].apcb047,g_apcb_d[l_ac].apcb021,g_apcb_d[l_ac].apcb029,g_apcb_d[l_ac].apcb017, 
                   g_apcb_d[l_ac].apcb100,g_apcb_d[l_ac].apcb123,g_apcb_d[l_ac].apcb124,g_apcb_d[l_ac].apcb125, 
                   g_apcb_d[l_ac].apcb133,g_apcb_d[l_ac].apcb134,g_apcb_d[l_ac].apcb135,g_apcb_d[l_ac].apcblegl, 
                   g_apcb_d[l_ac].apcb011,g_apcb_d[l_ac].apcb012,g_apcb_d[l_ac].apcb014,g_apcb_d[l_ac].apcb015, 
                   g_apcb_d[l_ac].apcb016,g_apcb_d[l_ac].apcb024,g_apcb_d[l_ac].apcbsite,g_apcb_d[l_ac].apcb013, 
                   g_apcb_d[l_ac].apcb018,g_apcb_d[l_ac].apcb019,g_apcb_d[l_ac].apcb106,g_apcb_d[l_ac].apcb108, 
                   g_apcb_d[l_ac].apcb051,g_apcb_d[l_ac].apcb102,g_apcb_d[l_ac].apcb034,g_apcb_d[l_ac].apcb054, 
                   g_apcb_d[l_ac].apcb055,g_apcb_d[l_ac].apcb036,g_apcb_d[l_ac].apcb035,g_apcb_d[l_ac].apcb037, 
                   g_apcb_d[l_ac].apcb038,g_apcb_d[l_ac].apcb039,g_apcb_d[l_ac].apcb040,g_apcb_d[l_ac].apcb041, 
                   g_apcb_d[l_ac].apcb042,g_apcb_d[l_ac].apcb043,g_apcb_d[l_ac].apcb044,g_apcb_d[l_ac].apcb045, 
                   g_apcb_d[l_ac].apcb046)
                WHERE apcbent = g_enterprise AND apcbld = g_apca_m.apcald 
                  AND apcbdocno = g_apca_m.apcadocno 
 
                  AND apcbseq = g_apcb_d_t.apcbseq #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
 
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_apcb_d[l_ac].* = g_apcb_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "apcb_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_apcb_d[l_ac].* = g_apcb_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "apcb_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                        #161130-00056 add
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_apca_m.apcald
               LET gs_keys_bak[1] = g_apcald_t
               LET gs_keys[2] = g_apca_m.apcadocno
               LET gs_keys_bak[2] = g_apcadocno_t
               LET gs_keys[3] = g_apcb_d[g_detail_idx].apcbseq
               LET gs_keys_bak[3] = g_apcb_d_t.apcbseq
               CALL aapt320_update_b('apcb_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL aapt320_apcb_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_apcb_d[g_detail_idx].apcbseq = g_apcb_d_t.apcbseq 
 
                  ) THEN
                  LET gs_keys[01] = g_apca_m.apcald
                  LET gs_keys[gs_keys.getLength()+1] = g_apca_m.apcadocno
 
                  LET gs_keys[gs_keys.getLength()+1] = g_apcb_d_t.apcbseq
 
                  CALL aapt320_key_update_b(gs_keys,'apcb_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_apca_m),util.JSON.stringify(g_apcb_d_t)
               LET g_log2 = util.JSON.stringify(g_apca_m),util.JSON.stringify(g_apcb_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
               CALL aapt320_get_apcb1x6(g_detail_idx) RETURNING l_apcb106,l_apcb116,l_apcb126,l_apcb136   #160107-00001#1
               UPDATE apcb_t 
                  SET (apcb108,apcb118,apcb128,apcb138,apcb106,apcb116,apcb126,apcb136) 
                       = 
                      (g_apcb_d[g_detail_idx].apcb103,g_apcb_d[g_detail_idx].apcb113,g_apcb_d[g_detail_idx].apcb123,g_apcb_d[g_detail_idx].apcb133,l_apcb106,l_apcb116,l_apcb126,l_apcb136)  
                  WHERE apcbent = g_enterprise AND apcbld = g_apca_m.apcald AND apcbdocno = g_apca_m.apcadocno AND apcbseq = g_apcb_d[g_detail_idx].apcbseq
               #回寫入庫單立暫估數量
               IF NOT cl_null(g_apcb_d[g_detail_idx].apcb002) AND NOT cl_null(g_apcb_d[g_detail_idx].apcb003) THEN
                   CALL s_aapt300_pmdt_upd(g_apca_m.apcald,g_apca_m.apcadocno,g_apcb_d[g_detail_idx].apcbseq,'+') RETURNING g_sub_success,g_errno
               END IF
               
               #150206-00013#3   ---(s)---
               IF (g_apcb_d[g_detail_idx].apcb021 != g_apcb_d_t.apcb021 OR g_apcb_d_t.apcb021 IS NULL) OR
                  (g_apcb_d[g_detail_idx].apcb029 != g_apcb_d_t.apcb029 OR g_apcb_d_t.apcb029 IS NULL) THEN                  
                  CALL aapt300_08_b_fill(g_enterprise,g_apca_m.apcald,g_apca_m.apcadocno)  
               END IF
               #150206-00013#3   ---(e)---
               
               #150703-00021#24 ---s--- 修改bgbd_t                                        
               #檢核新的預算編號是否存在            
               CALL s_aooi200_fin_get_slip(g_apca_m.apcadocno) RETURNING g_sub_success,g_ap_slip
               CALL s_fin_get_doc_para(g_apca_m.apcald,g_apca_m.apcacomp,g_ap_slip,'D-FIN-5002') RETURNING g_dfin5002
               IF g_dfin5002 = 'Y' THEN
                  #160902-00034#1 ---s---
                  #CALL s_aapt300_bgbd_upd(g_apca_m.apcadocno,g_apca_m.apcald,g_apcb_d[g_detail_idx].apcbseq,'','1')
                  #   RETURNING g_sub_success,g_errno
                  #IF NOT g_sub_success THEN
                  #   INITIALIZE g_errparam TO NULL
                  #   LET g_errparam.code = g_errno
                  #   LET g_errparam.extend = ''
                  #   LET g_errparam.popup = TRUE
                  #   CALL cl_err()
                  #   CALL s_transaction_end('N','0')
                  #   NEXT FIELD CURRENT
                  #END IF      
                 #預算轉移原本占用的
                  IF g_apcb_d[g_detail_idx].apcb002 <> g_apcb_d_t.apcb002 OR g_apcb_d[g_detail_idx].apcb003 <> g_apcb_d_t.apcb003 THEN
                     LET l_tran.docno     = g_apca_m.apcadocno
                     LET l_tran.ld        = g_apca_m.apcald
                     LET l_tran.docdt     = g_apca_m.apcadocdt
                     LET l_tran.comp      = g_apca_m.apcacomp
                     LET l_tran.seq       = g_apcb_d[g_detail_idx].apcbseq
                     LET l_tran.bgbd007   = g_apcb_d[g_detail_idx].apcb017
                     LET l_tran.bgbd037   = g_apcb_d[g_detail_idx].apcb002
                     LET l_tran.bgbd038   = g_apcb_d[g_detail_idx].apcb003
                     LET l_tran.bgbd040   = g_apcb_d[g_detail_idx].apcb004
                     LET l_tran.bgbd007_t = g_apcb_d_t.apcb017 #修改前的預算細項
                     LET l_tran.bgbd037_t = g_apcb_d_t.apcb002 #修改前的單號
                     LET l_tran.bgbd038_t = g_apcb_d_t.apcb003 #修改前的項次
                     LET l_tran.bgbd040_t = g_apcb_d_t.apcb103 #修改前被占用的金額
                     LET l_tran.act       = 'UD'                     
                     LET l_ls_js = util.JSON.stringify(l_tran)
                     IF NOT cl_null(g_apcb_d_t.apcb002) AND NOT cl_null(g_apcb_d_t.apcb003) THEN                       
                        CALL s_abg_tran(l_ls_js) RETURNING g_sub_success,g_errno 
                     END IF
                     IF NOT cl_null(g_apcb_d[g_detail_idx].apcb002) AND cl_null(g_apcb_d[g_detail_idx].apcb003) THEN
                        LET l_tran.act       = 'A'       
                        LET l_ls_js = util.JSON.stringify(l_tran)       
                        CALL s_abg_tran(l_ls_js) RETURNING g_sub_success,g_errno                      
                     END IF                     
                  END IF
                  #160902-00034#1 ---e---                 
               
                  #刪除舊的bgbd_t /先將額度釋放出來
                  DELETE FROM bgbd_t 
                   WHERE bgbdent = g_enterprise
                     AND bgbd037 = g_apca_m.apcadocno
                     AND bgbd038 = g_apcb_d[g_detail_idx].apcbseq
                  #160902-00034#1 ---s---  
                  CALL s_aapt300_bgbd_upd(g_apca_m.apcadocno,g_apca_m.apcald,g_apcb_d[g_detail_idx].apcbseq,'','4')
                            RETURNING g_sub_success,g_errno                                                 
                  IF g_sub_success THEN
                  #160902-00034#1 ---e---                                      
                     #檢查新的數字是否超過額度 
                     CALL s_aapt300_bgbd_upd(g_apca_m.apcadocno,g_apca_m.apcald,g_apcb_d[g_detail_idx].apcbseq,'','2')
                        RETURNING g_sub_success,g_errno
                     IF NOT g_sub_success THEN
                        INITIALIZE g_errparam TO NULL 
                        LET g_errparam.extend = '' 
                        LET g_errparam.code   = g_errno 
                        LET g_errparam.popup  = TRUE 
                        CALL cl_err()
                        CALL s_transaction_end('N','0')
                        NEXT FIELD CURRENT
                     END IF                
                        
                     #新增一筆bgbd_t               
                     CALL s_aapt300_bgbd_upd(g_apca_m.apcadocno,g_apca_m.apcald,g_apcb_d[g_detail_idx].apcbseq,'I','3')
                        RETURNING g_sub_success,g_errno
                     IF NOT g_sub_success THEN
                        INITIALIZE g_errparam TO NULL 
                        LET g_errparam.extend = '' 
                        LET g_errparam.code   = g_errno 
                        LET g_errparam.popup  = TRUE 
                        CALL cl_err()
                        CALL s_transaction_end('N','0')
                        NEXT FIELD CURRENT
                     END IF   
                  END IF    #160902-00034#1                    
               END IF                 
               #150703-00021#24 ---e--- 
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
 
            #end add-point
            CALL aapt320_unlock_b("apcb_t","'1'")
            CALL s_transaction_end('Y','0')
            #其他table進行unlock
            #add-point:單身after_row2 name="input.body.after_row2"
            
            #end add-point
              
         AFTER INPUT
            #add-point:input段after input  name="input.body.after_input"
            #單身1
            LET g_page_mark = "bpage_1"
            #主要控制apca100的欄位
            CALL aapt320_set_entry('u')
            CALL aapt320_set_no_entry('u')
            CALL s_transaction_begin()
            #判斷是否單身金額與多帳期金額是否一致
            CALL s_aapt300_compare_apcb_with_apcc(g_apca_m.apcald,g_apca_m.apcadocno)
                 RETURNING l_diff
            IF l_diff > 0 THEN
               INITIALIZE l_amount.* TO NULL
               CALL s_aap_clac_bill_master(g_apca_m.apcald,g_apca_m.apcadocno) RETURNING l_amount.*
               
               LET g_apca_m.apcamoddt = cl_get_current()
               
               #重展多帳期前 先把匯率寫回資料庫
               UPDATE apca_t SET (apca101,apca103,apca104,apca106,apca107,apca108,
                                          apca113,apca114,apca116,apca117,apca118,
                                  apca121,apca123,apca124,apca126,apca127,apca128,
                                  apca131,apca133,apca134,apca136,apca137,apca138,
                                  apcamodid,apcamoddt) =
                                 (g_apca_m.apca101,l_amount.apcb103,l_amount.xrcd104,l_amount.apca106,l_amount.apca107,l_amount.apca108,
                                                   l_amount.apcb113,l_amount.xrcd114,l_amount.apca116,l_amount.apca117,l_amount.apca118,
                                  g_apca_m.apca121,l_amount.apcb123,l_amount.xrcd124,l_amount.apca126,l_amount.apca127,l_amount.apca128,
                                  g_apca_m.apca131,l_amount.apcb133,l_amount.xrcd134,l_amount.apca136,l_amount.apca137,l_amount.apca138,
                                  g_user,g_apca_m.apcamoddt)
                 WHERE apcaent = g_enterprise AND apcald = g_apca_m.apcald
                   AND apcadocno = g_apca_m.apcadocno

               IF SQLCA.sqlerrd[3] = 0 THEN
                   CALL s_transaction_end('N','0')
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = "std-00009"
                  LET g_errparam.extend = "upd apca_t"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  CONTINUE DIALOG
               END IF       
               
               #單頭金額資訊處理-資料顯示
               CALL aapt320_curr_info_master()
               
               CALL s_aap_multi_bill_period(g_apca_m.apcald,g_apca_m.apcadocno) RETURNING g_sub_success,g_errno
               IF NOT g_sub_success THEN
                  CALL s_transaction_end('N','0')
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = "aap-00092"
                  LET g_errparam.extend = "upd apcc_t"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CONTINUE DIALOG
               END IF
               
              
            END IF
            LET l_cnt = 0 #160816-00022#3 add
            SELECT count(*) INTO l_cnt
              FROM xrcd_t
             WHERE xrcdent = g_enterprise AND xrcdld = g_apca_m.apcald AND xrcddocno = g_apca_m.apcadocno AND xrcd009 IS NULL
            IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF #160816-00022#3 add
            IF l_cnt > 0 THEN
               CALL s_fin_get_account(g_apca_m.apcald,'13',g_apca_m.apca007,'8504_08') RETURNING g_sub_success,l_xrcd009,g_errno
               UPDATE xrcd_t SET xrcd009 = l_xrcd009
                WHERE xrcdent= g_enterprise 
                  AND xrcdld = g_apca_m.apcald AND xrcddocno = g_apca_m.apcadocno
                  AND xrcd009 IS NULL

               IF SQLCA.sqlerrd[3] = 0 THEN
                  CALL s_transaction_end('N','0')
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = "std-00009"
                  LET g_errparam.extend = "upd xrcd009"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CONTINUE DIALOG
               END IF
               CALL aapt320_b_fill()
            END IF
            CALL s_transaction_end('Y','0')
            #150210-00009#1--Mark
            ##141202-00061-15--(S)
            #CALL s_aooi200_fin_get_slip(g_apca_m.apcadocno) RETURNING g_sub_success,g_ap_slip               
            #CALL s_fin_get_doc_para(g_apca_m.apcald,g_apca_m.apcacomp,g_ap_slip,'D-FIN-0030') RETURNING g_dfin0030
            #IF g_glaa.glaa121 = 'Y' AND g_dfin0030 = 'Y'THEN
            #   CALL s_transaction_begin()
            #   CALL s_pre_voucher_ins('AP','P10',g_apca_m.apcald,g_apca_m.apcadocno,g_apca_m.apcadocdt,'1')
            #        RETURNING g_sub_success
            #   IF g_sub_success THEN 
            #      CALL s_transaction_end('Y','0')
            #   ELSE
            #      CALL s_transaction_end('N','0')
            #   END IF
            #END IF
            #141202-00061-15--(E)  
            #150210-00009#1--Mark
            #end add-point 
    
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
                  LET g_apcb_d[li_reproduce_target].* = g_apcb_d[li_reproduce].*
 
                  LET g_apcb_d[li_reproduce_target].apcbseq = NULL
 
               END IF
               #170920-00028 --- modify end ---
            ELSE
               CALL FGL_SET_ARR_CURR(g_apcb_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_apcb_d.getLength()+1
            END IF
            #(ver:84) ---start---
            #add-point:input段單身複製  name="input.body.controlo"
            
            #end add-point
            #(ver:84) --- end ---
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
      INPUT ARRAY g_apcb2_d FROM s_detail2.*
         ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                 INSERT ROW = FALSE, #此頁面insert功能由產生器控制, 手動之設定無效! 
 
                 DELETE ROW = FALSE,
                 APPEND ROW = FALSE)
                 
         #自訂ACTION(detail_input,page_2)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body2.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_apcb2_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL aapt320_b_fill() #ver:82
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'd' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'2',"))
            END IF
            LET g_loc = 'd'
            LET g_rec_b = g_apcb2_d.getLength()
            #add-point:資料輸入前 name="input.body2.before_input"
            
            #end add-point
            
         BEFORE INSERT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            CALL aapt320_idx_chk()   #(ver:83)
            LET l_cmd = 'a'
            INITIALIZE g_apcb2_d[l_ac].* TO NULL 
            INITIALIZE g_apcb2_d_t.* TO NULL 
            INITIALIZE g_apcb2_d_o.* TO NULL 
            #公用欄位給值(單身2)
            
            #自定義預設值(單身2)
                  LET g_apcb2_d[l_ac].xrcd006 = "N"
      LET g_apcb2_d[l_ac].xrcd005 = "1"
 
            #add-point:modify段before備份 name="input.body2.insert.before_bak"
            
            #end add-point
            LET g_apcb2_d_t.* = g_apcb2_d[l_ac].*     #新輸入資料
            LET g_apcb2_d_o.* = g_apcb2_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL aapt320_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body2.insert.after_set_entry_b"
            
            #end add-point
            CALL aapt320_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_apcb2_d[li_reproduce_target].* = g_apcb2_d[li_reproduce].*
 
               LET g_apcb2_d[li_reproduce_target].xrcdseq = NULL
               LET g_apcb2_d[li_reproduce_target].xrcdseq2 = NULL
               LET g_apcb2_d[li_reproduce_target].xrcd007 = NULL
            END IF
            
 
            #add-point:modify段before insert name="input.body2.before_insert"
            
            #end add-point  
 
         BEFORE ROW     
            #add-point:modify段before row2 name="input.body2.before_row2"
            
            #end add-point  
            LET l_insert = FALSE
            LET l_cmd = ''
            LET l_ac_t = l_ac 
            LET g_detail_idx_list[2] = l_ac
            LET l_ac = ARR_CURR()
            LET g_detail_idx = l_ac
            LET g_current_page = 2
              
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN aapt320_cl USING g_enterprise,g_apca_m.apcald,g_apca_m.apcadocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN aapt320_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE aapt320_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_apcb2_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_apcb2_d[l_ac].xrcdseq IS NOT NULL
               AND g_apcb2_d[l_ac].xrcdseq2 IS NOT NULL
               AND g_apcb2_d[l_ac].xrcd007 IS NOT NULL
            THEN 
               LET l_cmd='u'
               LET g_apcb2_d_t.* = g_apcb2_d[l_ac].*  #BACKUP
               LET g_apcb2_d_o.* = g_apcb2_d[l_ac].*  #BACKUP
               CALL aapt320_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body2.after_set_entry_b"
               
               #end add-point  
               CALL aapt320_set_no_entry_b(l_cmd)
               IF NOT aapt320_lock_b("xrcd_t","'2'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH aapt320_bcl2 INTO g_apcb2_d[l_ac].xrcdseq,g_apcb2_d[l_ac].xrcdseq2,g_apcb2_d[l_ac].xrcd007, 
                      g_apcb2_d[l_ac].xrcd002,g_apcb2_d[l_ac].xrcd003,g_apcb2_d[l_ac].xrcd006,g_apcb2_d[l_ac].xrcd005, 
                      g_apcb2_d[l_ac].xrcd102,g_apcb2_d[l_ac].xrcd103,g_apcb2_d[l_ac].xrcd104,g_apcb2_d[l_ac].xrcd105, 
                      g_apcb2_d[l_ac].xrcd113,g_apcb2_d[l_ac].xrcd114,g_apcb2_d[l_ac].xrcd115,g_apcb2_d[l_ac].xrcd123, 
                      g_apcb2_d[l_ac].xrcd124,g_apcb2_d[l_ac].xrcd125,g_apcb2_d[l_ac].xrcd133,g_apcb2_d[l_ac].xrcd134, 
                      g_apcb2_d[l_ac].xrcd135,g_apcb2_d[l_ac].xrcdorga,g_apcb2_d[l_ac].xrcd009
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = SQLERRMESSAGE  
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_apcb2_d_mask_o[l_ac].* =  g_apcb2_d[l_ac].*
                  CALL aapt320_xrcd_t_mask()
                  LET g_apcb2_d_mask_n[l_ac].* =  g_apcb2_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL aapt320_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body2.before_row"
            CALL s_tax_chk(g_apcb2_d[l_ac].xrcdorga,g_apcb2_d[l_ac].xrcd002) RETURNING g_sub_success,l_oodb004,l_oodb005,l_oodb006,l_oodb011
            #end add-point  
            #其他table資料備份(確定是否更改用)
            
 
            #其他table進行lock
            
 
            CALL aapt320_idx_chk()   #(ver:83)
            
         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' THEN
               LET l_cmd='d'
               #add-point:單身AFTER DELETE (=d) name="input.body2.after_delete_d"
               
               #end add-point
            ELSE
               #add-point:單身刪除前 name="input.body2.b_delete_ask"
               
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
               
               #add-point:單身2刪除前 name="input.body2.b_delete"
               
               #end add-point    
                  
               #取得該筆資料key值
               INITIALIZE gs_keys TO NULL
               LET gs_keys[01] = g_apca_m.apcald
               LET gs_keys[gs_keys.getLength()+1] = g_apca_m.apcadocno
               LET gs_keys[gs_keys.getLength()+1] = g_apcb2_d_t.xrcdseq
               LET gs_keys[gs_keys.getLength()+1] = g_apcb2_d_t.xrcdseq2
               LET gs_keys[gs_keys.getLength()+1] = g_apcb2_d_t.xrcd007
            
               #刪除同層單身
               IF NOT aapt320_delete_b('xrcd_t',gs_keys,"'2'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE aapt320_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT aapt320_key_delete_b(gs_keys,'xrcd_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE aapt320_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
   #161130-00056 add
               
               #add-point:單身2刪除中 name="input.body2.m_delete"
               
               #end add-point    
               
               CALL s_transaction_end('Y','0')
               CLOSE aapt320_bcl
 
               LET g_rec_b = g_rec_b-1
               #add-point:單身2刪除後 name="input.body2.a_delete"
               
               #end add-point
               LET l_count = g_apcb_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body2.after_delete"
               
               #end add-point
            END IF 
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_apcb2_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
         AFTER INSERT    
            LET l_insert = FALSE
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CALL cl_err()
               LET INT_FLAG = 0
               CANCEL INSERT
            END IF
               
            #add-point:單身2新增前 name="input.body2.b_a_insert"
            
            #end add-point
               
            LET l_count = 1  
            SELECT COUNT(1) INTO l_count FROM xrcd_t 
             WHERE xrcdent = g_enterprise AND xrcdld = g_apca_m.apcald
               AND xrcddocno = g_apca_m.apcadocno
               AND xrcdseq = g_apcb2_d[l_ac].xrcdseq
               AND xrcdseq2 = g_apcb2_d[l_ac].xrcdseq2
               AND xrcd007 = g_apcb2_d[l_ac].xrcd007
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身2新增前 name="input.body2.b_insert"
               
               #end add-point
            
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_apca_m.apcald
               LET gs_keys[2] = g_apca_m.apcadocno
               LET gs_keys[3] = g_apcb2_d[g_detail_idx].xrcdseq
               LET gs_keys[4] = g_apcb2_d[g_detail_idx].xrcdseq2
               LET gs_keys[5] = g_apcb2_d[g_detail_idx].xrcd007
               CALL aapt320_insert_b('xrcd_t',gs_keys,"'2'")
                           
               #add-point:單身新增後2 name="input.body2.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_apcb_d[l_ac].* TO NULL
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "xrcd_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL aapt320_b_fill()
               #資料多語言用-增/改
               
                  #161130-00056 add
               #add-point:單身新增後 name="input.body2.after_insert"
         
               #end add-point
               CALL s_transaction_end('Y','0')
               #ERROR 'INSERT O.K'
               LET g_rec_b = g_rec_b + 1
            END IF
            
         ON ROW CHANGE 
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_apcb2_d[l_ac].* = g_apcb2_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE aapt320_bcl2
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
            
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_apcb2_d[l_ac].* = g_apcb2_d_t.*
            ELSE
               #add-point:單身page2修改前 name="input.body2.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身2)
               
               
               #將遮罩欄位還原
               CALL aapt320_xrcd_t_mask_restore('restore_mask_o')
                              
               UPDATE xrcd_t SET (xrcdld,xrcddocno,xrcdseq,xrcdseq2,xrcd007,xrcd002,xrcd003,xrcd006, 
                   xrcd005,xrcd102,xrcd103,xrcd104,xrcd105,xrcd113,xrcd114,xrcd115,xrcd123,xrcd124,xrcd125, 
                   xrcd133,xrcd134,xrcd135,xrcdorga,xrcd009) = (g_apca_m.apcald,g_apca_m.apcadocno,g_apcb2_d[l_ac].xrcdseq, 
                   g_apcb2_d[l_ac].xrcdseq2,g_apcb2_d[l_ac].xrcd007,g_apcb2_d[l_ac].xrcd002,g_apcb2_d[l_ac].xrcd003, 
                   g_apcb2_d[l_ac].xrcd006,g_apcb2_d[l_ac].xrcd005,g_apcb2_d[l_ac].xrcd102,g_apcb2_d[l_ac].xrcd103, 
                   g_apcb2_d[l_ac].xrcd104,g_apcb2_d[l_ac].xrcd105,g_apcb2_d[l_ac].xrcd113,g_apcb2_d[l_ac].xrcd114, 
                   g_apcb2_d[l_ac].xrcd115,g_apcb2_d[l_ac].xrcd123,g_apcb2_d[l_ac].xrcd124,g_apcb2_d[l_ac].xrcd125, 
                   g_apcb2_d[l_ac].xrcd133,g_apcb2_d[l_ac].xrcd134,g_apcb2_d[l_ac].xrcd135,g_apcb2_d[l_ac].xrcdorga, 
                   g_apcb2_d[l_ac].xrcd009) #自訂欄位頁簽
                WHERE xrcdent = g_enterprise AND xrcdld = g_apca_m.apcald
                  AND xrcddocno = g_apca_m.apcadocno
                  AND xrcdseq = g_apcb2_d_t.xrcdseq #項次 
                  AND xrcdseq2 = g_apcb2_d_t.xrcdseq2
                  AND xrcd007 = g_apcb2_d_t.xrcd007
                  
               #add-point:單身page2修改中 name="input.body2.m_update"
               
               #end add-point
                  
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_apcb2_d[l_ac].* = g_apcb2_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "xrcd_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_apcb2_d[l_ac].* = g_apcb2_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "xrcd_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                        #161130-00056 add
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_apca_m.apcald
               LET gs_keys_bak[1] = g_apcald_t
               LET gs_keys[2] = g_apca_m.apcadocno
               LET gs_keys_bak[2] = g_apcadocno_t
               LET gs_keys[3] = g_apcb2_d[g_detail_idx].xrcdseq
               LET gs_keys_bak[3] = g_apcb2_d_t.xrcdseq
               LET gs_keys[4] = g_apcb2_d[g_detail_idx].xrcdseq2
               LET gs_keys_bak[4] = g_apcb2_d_t.xrcdseq2
               LET gs_keys[5] = g_apcb2_d[g_detail_idx].xrcd007
               LET gs_keys_bak[5] = g_apcb2_d_t.xrcd007
               CALL aapt320_update_b('xrcd_t',gs_keys,gs_keys_bak,"'2'")
               END CASE
               
               #將遮罩欄位進行遮蔽
               CALL aapt320_xrcd_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT (g_apcb2_d[g_detail_idx].xrcdseq = g_apcb2_d_t.xrcdseq 
                  AND g_apcb2_d[g_detail_idx].xrcdseq2 = g_apcb2_d_t.xrcdseq2 
                  AND g_apcb2_d[g_detail_idx].xrcd007 = g_apcb2_d_t.xrcd007 
                  ) THEN
                  LET gs_keys[01] = g_apca_m.apcald
                  LET gs_keys[gs_keys.getLength()+1] = g_apca_m.apcadocno
                  LET gs_keys[gs_keys.getLength()+1] = g_apcb2_d_t.xrcdseq
                  LET gs_keys[gs_keys.getLength()+1] = g_apcb2_d_t.xrcdseq2
                  LET gs_keys[gs_keys.getLength()+1] = g_apcb2_d_t.xrcd007
                  CALL aapt320_key_update_b(gs_keys,'xrcd_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_apca_m),util.JSON.stringify(g_apcb2_d_t)
               LET g_log2 = util.JSON.stringify(g_apca_m),util.JSON.stringify(g_apcb2_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身page2修改後 name="input.body2.a_update"
            #   CALL aapt320_apcb_upd()
               #end add-point
            END IF
         
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd002
            
            #add-point:AFTER FIELD xrcd002 name="input.a.page2.xrcd002"
 
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd002
            #add-point:BEFORE FIELD xrcd002 name="input.b.page2.xrcd002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcd002
            #add-point:ON CHANGE xrcd002 name="input.g.page2.xrcd002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd002_desc
            #add-point:BEFORE FIELD xrcd002_desc name="input.b.page2.xrcd002_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd002_desc
            
            #add-point:AFTER FIELD xrcd002_desc name="input.a.page2.xrcd002_desc"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcd002_desc
            #add-point:ON CHANGE xrcd002_desc name="input.g.page2.xrcd002_desc"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd103
            #add-point:BEFORE FIELD xrcd103 name="input.b.page2.xrcd103"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd103
            
            #add-point:AFTER FIELD xrcd103 name="input.a.page2.xrcd103"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcd103
            #add-point:ON CHANGE xrcd103 name="input.g.page2.xrcd103"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd104
            #add-point:BEFORE FIELD xrcd104 name="input.b.page2.xrcd104"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd104
            
            #add-point:AFTER FIELD xrcd104 name="input.a.page2.xrcd104"
            #交易幣稅額
            IF NOT cl_null(g_apcb2_d[l_ac].xrcd104) THEN
               #IF p_cmd = 'u' AND (g_apcb2_d[l_ac].xrcd104 != g_apcb2_d_t.xrcd104 OR g_apcb2_d_t.xrcd104 IS NULL ) THEN     #160726-00020#10 mark
               IF g_apcb2_d[l_ac].xrcd104 != g_apcb2_d_o.xrcd104 OR cl_null(g_apcb2_d_o.xrcd104) THEN                        #160726-00020#10
                  INITIALIZE l_apcb1.* TO NULL
                  CALL s_tax_calc_curr_tax_amount(g_apca_m.apcald,g_apca_m.apcadocno,g_apcb2_d[l_ac].xrcdseq,0,g_apcb2_d[l_ac].xrcd104,'')
                       RETURNING g_apcb2_d[l_ac].xrcd103,l_apcb1.apcb104        ,g_apcb2_d[l_ac].xrcd105,
                                 g_apcb2_d[l_ac].xrcd113,g_apcb2_d[l_ac].xrcd114,g_apcb2_d[l_ac].xrcd115,
                                 l_apcb1.apcb123        ,l_apcb1.apcb124        ,l_apcb1.apcb125,
                                 l_apcb1.apcb133        ,l_apcb1.apcb134        ,l_apcb1.apcb135
                  #原幣稅額變更後會連動影響本幣稅額/因此其他本位幣二三會連動變更
                  IF g_glaa.glaa015 = 'Y' THEN
                     #160726-00020#10--s
                     LET g_apcb2_d[l_ac].xrcd123 = ''
                     LET g_apcb2_d[l_ac].xrcd124 = ''
                     LET g_apcb2_d[l_ac].xrcd125 = ''                 
                     #160726-00020#10--e
                     LET g_apcb2_d[l_ac].xrcd123 = l_apcb1.apcb123
                     LET g_apcb2_d[l_ac].xrcd124 = l_apcb1.apcb124
                     LET g_apcb2_d[l_ac].xrcd125 = l_apcb1.apcb125
                  END IF
                  IF g_glaa.glaa019 = 'Y' THEN
                     #160726-00020#10--s
                     LET g_apcb2_d[l_ac].xrcd133 = ''
                     LET g_apcb2_d[l_ac].xrcd134 = ''
                     LET g_apcb2_d[l_ac].xrcd135 = ''                 
                     #160726-00020#10--e
                     LET g_apcb2_d[l_ac].xrcd133 = l_apcb1.apcb133
                     LET g_apcb2_d[l_ac].xrcd134 = l_apcb1.apcb134
                     LET g_apcb2_d[l_ac].xrcd135 = l_apcb1.apcb135
                  END IF
                  LET g_apcb2_d_o.* = g_apcb2_d[l_ac].*   #160726-00020#10
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcd104
            #add-point:ON CHANGE xrcd104 name="input.g.page2.xrcd104"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd113
            #add-point:BEFORE FIELD xrcd113 name="input.b.page2.xrcd113"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd113
            
            #add-point:AFTER FIELD xrcd113 name="input.a.page2.xrcd113"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcd113
            #add-point:ON CHANGE xrcd113 name="input.g.page2.xrcd113"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd114
            #add-point:BEFORE FIELD xrcd114 name="input.b.page2.xrcd114"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd114
            
            #add-point:AFTER FIELD xrcd114 name="input.a.page2.xrcd114"
            #本幣稅額
            IF NOT cl_null(g_apcb2_d[l_ac].xrcd104) THEN
               IF p_cmd = 'u' AND (g_apcb2_d[l_ac].xrcd104 != g_apcb2_d_t.xrcd104 OR g_apcb2_d_t.xrcd104 IS NULL ) THEN
                  INITIALIZE l_apcb1.* TO NULL
                  CALL s_tax_calc_curr_tax_amount(g_apca_m.apcald,g_apca_m.apcadocno,g_apcb2_d[l_ac].xrcdseq,0,'',g_apcb2_d[l_ac].xrcd114)
                       RETURNING l_apcb1.apcb103        ,l_apcb1.apcb104        ,l_apcb1.apcb105,
                                 g_apcb2_d[l_ac].xrcd113,g_apcb2_d[l_ac].xrcd114,g_apcb2_d[l_ac].xrcd115,
                                 l_apcb1.apcb123        ,l_apcb1.apcb124        ,l_apcb1.apcb125,
                                 l_apcb1.apcb133        ,l_apcb1.apcb134        ,l_apcb1.apcb135
                  #只變更以帳簿幣別為換算基準的幣別
                  IF g_glaa.glaa015 = 'Y' AND g_glaa.glaa017 = '2' THEN
                     LET g_apcb2_d[l_ac].xrcd123 = l_apcb1.apcb123
                     LET g_apcb2_d[l_ac].xrcd124 = l_apcb1.apcb124
                     LET g_apcb2_d[l_ac].xrcd125 = l_apcb1.apcb125
                  END IF
                  IF g_glaa.glaa019 = 'Y' AND g_glaa.glaa021 = '2' THEN
                     LET g_apcb2_d[l_ac].xrcd133 = l_apcb1.apcb133
                     LET g_apcb2_d[l_ac].xrcd134 = l_apcb1.apcb134
                     LET g_apcb2_d[l_ac].xrcd135 = l_apcb1.apcb135
                  END IF
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcd114
            #add-point:ON CHANGE xrcd114 name="input.g.page2.xrcd114"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd115
            #add-point:BEFORE FIELD xrcd115 name="input.b.page2.xrcd115"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd115
            
            #add-point:AFTER FIELD xrcd115 name="input.a.page2.xrcd115"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcd115
            #add-point:ON CHANGE xrcd115 name="input.g.page2.xrcd115"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd123
            #add-point:BEFORE FIELD xrcd123 name="input.b.page2.xrcd123"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd123
            
            #add-point:AFTER FIELD xrcd123 name="input.a.page2.xrcd123"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcd123
            #add-point:ON CHANGE xrcd123 name="input.g.page2.xrcd123"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd124
            #add-point:BEFORE FIELD xrcd124 name="input.b.page2.xrcd124"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd124
            
            #add-point:AFTER FIELD xrcd124 name="input.a.page2.xrcd124"
            #本位幣二稅額
            IF NOT cl_null(g_apcb2_d[l_ac].xrcd124) THEN
               #IF p_cmd = 'u' AND (g_apcb2_d[l_ac].xrcd124 != g_apcb2_d_t.xrcd124 OR g_apcb2_d_t.xrcd124 IS NULL ) THEN    #160726-00020#10 mark
               IF g_apcb2_d[l_ac].xrcd124 != g_apcb2_d_o.xrcd124 OR cl_null(g_apcb2_d_o.xrcd124) THEN                       #160726-00020#10
                  #160726-00020#10--s
                  LET g_apcb2_d[l_ac].xrcd123 =''
                  LET g_apcb2_d[l_ac].xrcd125 =''
                  #160726-00020#10--e
                  CALL s_tax_calc_tax_amount(l_oodb005,g_apcb2_d[l_ac].xrcd123,g_apcb2_d[l_ac].xrcd124,g_apcb2_d[l_ac].xrcd125)
                       RETURNING g_apcb2_d[l_ac].xrcd123,l_apcb1.apcb124,g_apcb2_d[l_ac].xrcd125
                  LET g_apcb2_d_o.* = g_apcb2_d[l_ac].*   #160726-00020#10     
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcd124
            #add-point:ON CHANGE xrcd124 name="input.g.page2.xrcd124"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd125
            #add-point:BEFORE FIELD xrcd125 name="input.b.page2.xrcd125"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd125
            
            #add-point:AFTER FIELD xrcd125 name="input.a.page2.xrcd125"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcd125
            #add-point:ON CHANGE xrcd125 name="input.g.page2.xrcd125"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd133
            #add-point:BEFORE FIELD xrcd133 name="input.b.page2.xrcd133"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd133
            
            #add-point:AFTER FIELD xrcd133 name="input.a.page2.xrcd133"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcd133
            #add-point:ON CHANGE xrcd133 name="input.g.page2.xrcd133"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd134
            #add-point:BEFORE FIELD xrcd134 name="input.b.page2.xrcd134"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd134
            
            #add-point:AFTER FIELD xrcd134 name="input.a.page2.xrcd134"
            #本位幣三稅額
            IF NOT cl_null(g_apcb2_d[l_ac].xrcd134) THEN
               #IF p_cmd = 'u' AND (g_apcb2_d[l_ac].xrcd134 != g_apcb2_d_t.xrcd134 OR g_apcb2_d_t.xrcd134 IS NULL ) THEN     #160726-00020#10 mark
               IF g_apcb2_d[l_ac].xrcd134 != g_apcb2_d_o.xrcd134 OR cl_null(g_apcb2_d_o.xrcd134) THEN                        #160726-00020#10
                  #160726-00020#10 --s
                  LET g_apcb2_d[l_ac].xrcd133 = ''
                  LET g_apcb2_d[l_ac].xrcd135 = ''
                  #160726-00020#10 --e
                  CALL s_tax_calc_tax_amount(l_oodb005,g_apcb2_d[l_ac].xrcd133,g_apcb2_d[l_ac].xrcd134,g_apcb2_d[l_ac].xrcd135)
                       RETURNING g_apcb2_d[l_ac].xrcd133,l_apcb1.apcb134,g_apcb2_d[l_ac].xrcd135
                  LET g_apcb2_d_o.* = g_apcb2_d[l_ac].*   #160726-00020#10     
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcd134
            #add-point:ON CHANGE xrcd134 name="input.g.page2.xrcd134"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd135
            #add-point:BEFORE FIELD xrcd135 name="input.b.page2.xrcd135"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd135
            
            #add-point:AFTER FIELD xrcd135 name="input.a.page2.xrcd135"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcd135
            #add-point:ON CHANGE xrcd135 name="input.g.page2.xrcd135"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcdorga
            #add-point:BEFORE FIELD xrcdorga name="input.b.page2.xrcdorga"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcdorga
            
            #add-point:AFTER FIELD xrcdorga name="input.a.page2.xrcdorga"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcdorga
            #add-point:ON CHANGE xrcdorga name="input.g.page2.xrcdorga"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd009
            
            #add-point:AFTER FIELD xrcd009 name="input.a.page2.xrcd009"


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd009
            #add-point:BEFORE FIELD xrcd009 name="input.b.page2.xrcd009"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcd009
            #add-point:ON CHANGE xrcd009 name="input.g.page2.xrcd009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcd009_desc
            #add-point:BEFORE FIELD xrcd009_desc name="input.b.page2.xrcd009_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD xrcd009_desc
            
            #add-point:AFTER FIELD xrcd009_desc name="input.a.page2.xrcd009_desc"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcd009_desc
            #add-point:ON CHANGE xrcd009_desc name="input.g.page2.xrcd009_desc"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page2.xrcd002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd002
            #add-point:ON ACTION controlp INFIELD xrcd002 name="input.c.page2.xrcd002"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrcd002_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd002_desc
            #add-point:ON ACTION controlp INFIELD xrcd002_desc name="input.c.page2.xrcd002_desc"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrcd103
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd103
            #add-point:ON ACTION controlp INFIELD xrcd103 name="input.c.page2.xrcd103"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrcd104
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd104
            #add-point:ON ACTION controlp INFIELD xrcd104 name="input.c.page2.xrcd104"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrcd113
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd113
            #add-point:ON ACTION controlp INFIELD xrcd113 name="input.c.page2.xrcd113"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrcd114
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd114
            #add-point:ON ACTION controlp INFIELD xrcd114 name="input.c.page2.xrcd114"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrcd115
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd115
            #add-point:ON ACTION controlp INFIELD xrcd115 name="input.c.page2.xrcd115"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrcd123
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd123
            #add-point:ON ACTION controlp INFIELD xrcd123 name="input.c.page2.xrcd123"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrcd124
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd124
            #add-point:ON ACTION controlp INFIELD xrcd124 name="input.c.page2.xrcd124"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrcd125
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd125
            #add-point:ON ACTION controlp INFIELD xrcd125 name="input.c.page2.xrcd125"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrcd133
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd133
            #add-point:ON ACTION controlp INFIELD xrcd133 name="input.c.page2.xrcd133"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrcd134
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd134
            #add-point:ON ACTION controlp INFIELD xrcd134 name="input.c.page2.xrcd134"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrcd135
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd135
            #add-point:ON ACTION controlp INFIELD xrcd135 name="input.c.page2.xrcd135"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrcdorga
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcdorga
            #add-point:ON ACTION controlp INFIELD xrcdorga name="input.c.page2.xrcdorga"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrcd009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd009
            #add-point:ON ACTION controlp INFIELD xrcd009 name="input.c.page2.xrcd009"
            
            #END add-point
 
 
         #Ctrlp:input.c.page2.xrcd009_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcd009_desc
            #add-point:ON ACTION controlp INFIELD xrcd009_desc name="input.c.page2.xrcd009_desc"
            
            #END add-point
 
 
 
 
         AFTER ROW
            #add-point:單身page2 after_row name="input.body2.after_row"
            IF (g_apcb2_d[l_ac].xrcd104 != g_apcb2_d_t.xrcd104) OR (g_apcb2_d[l_ac].xrcd114 != g_apcb2_d_t.xrcd114) OR 
               (g_apcb2_d[l_ac].xrcd124 != g_apcb2_d_t.xrcd124) OR (g_apcb2_d[l_ac].xrcd134 != g_apcb2_d_t.xrcd134) THEN
               INITIALIZE l_apcb1.* TO NULL
               CALL s_tax_sum_tax_by_seq(g_apca_m.apcald,g_apca_m.apcadocno,g_apcb2_d[l_ac].xrcdseq,0) 
                    RETURNING l_apcb1.apcb103,l_apcb1.apcb104,l_apcb1.apcb105,
                              l_apcb1.apcb113,l_apcb1.apcb114,l_apcb1.apcb115,
                              l_apcb1.apcb123,l_apcb1.apcb124,l_apcb1.apcb125,
                              l_apcb1.apcb133,l_apcb1.apcb134,l_apcb1.apcb135
               LET l_sql = ""
               IF g_apcb2_d[l_ac].xrcd104 != g_apcb2_d_t.xrcd104 THEN
                  LET l_sql = l_sql,"apcb103 = ",l_apcb1.apcb103,",",
                                    "apcb104 = ",l_apcb1.apcb104,",",
                                    "apcb105 = ",l_apcb1.apcb105
               END IF
               IF g_apcb2_d[l_ac].xrcd114 != g_apcb2_d_t.xrcd114 THEN
                  IF l_sql.getLength() > 0 THEN LET l_sql = l_sql,"," END IF
                  LET l_sql = l_sql,"apcb113 = ",l_apcb1.apcb113,",",
                                    "apcb114 = ",l_apcb1.apcb114,",",
                                    "apcb115 = ",l_apcb1.apcb115
               END IF
               IF g_apcb2_d[l_ac].xrcd124 != g_apcb2_d_t.xrcd124 THEN
                  IF l_sql.getLength() > 0 THEN LET l_sql = l_sql,"," END IF
                  LET l_sql = l_sql,"apcb123 = ",l_apcb1.apcb123,",",
                                    "apcb124 = ",l_apcb1.apcb124,",",
                                    "apcb125 = ",l_apcb1.apcb125
               END IF
               IF g_apcb2_d[l_ac].xrcd104 != g_apcb2_d_t.xrcd104 THEN
                  IF l_sql.getLength() > 0 THEN LET l_sql = l_sql,"," END IF
                  LET l_sql = l_sql,"apcb133 = ",l_apcb1.apcb133,",",
                                    "apcb134 = ",l_apcb1.apcb134,",",
                                    "apcb135 = ",l_apcb1.apcb135
               END IF
               LET l_sql = " UPDATE apcb_t SET ",l_sql,
                           "  WHERE apcbent = '",g_enterprise,"' AND apcbld = '",g_apca_m.apcald,"'",
                           "    AND apcbdocno = '",g_apca_m.apcadocno,"'",
                           "    AND apcbseq = '",g_apcb2_d[l_ac].xrcdseq,"'"
               PREPARE update_apcb_from_xrcd_p FROM l_sql
               EXECUTE update_apcb_from_xrcd_p
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                       CALL s_transaction_end('N','0')
                       INITIALIZE g_errparam TO NULL
                       LET g_errparam.code = "std-00009"
                       LET g_errparam.extend = 'UPDATE apcb_t'
                       LET g_errparam.popup = TRUE
                       CALL cl_err()
                  WHEN SQLCA.sqlcode #其他錯誤
                       CALL s_transaction_end('N','0')
                       INITIALIZE g_errparam TO NULL
                       LET g_errparam.code = SQLCA.SQLCODE
                       LET g_errparam.extend = 'UPDATE apcb_t'
                       LET g_errparam.popup = TRUE
                       CALL cl_err()
                  OTHERWISE
                     CALL aapt320_show()
               END CASE
            END IF
            #end add-point
            LET l_ac = ARR_CURR()
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               IF l_cmd = 'u' THEN
                  LET g_apcb2_d[l_ac].* = g_apcb2_d_t.*
               END IF
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE aapt320_bcl2
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
            
            #其他table進行unlock
            
            CALL aapt320_unlock_b("xrcd_t","'2'")
            CALL s_transaction_end('Y','0')
            #add-point:單身page2 after_row2 name="input.body2.after_row2"
            
            #end add-point
 
         AFTER INPUT
            #add-point:input段after input  name="input.body2.after_input"
            #單身2
            LET g_page_mark = "bpage_2"
            #150210-00009#1--Mark
            ##141202-00061-15--(S)
            #CALL s_aooi200_fin_get_slip(g_apca_m.apcadocno) RETURNING g_sub_success,g_ap_slip               
            #CALL s_fin_get_doc_para(g_apca_m.apcald,g_apca_m.apcacomp,g_ap_slip,'D-FIN-0030') RETURNING g_dfin0030
            #IF g_glaa.glaa121 = 'Y' AND g_dfin0030 = 'Y'THEN
            #   CALL s_transaction_begin()
            #   CALL s_pre_voucher_ins('AP','P10',g_apca_m.apcald,g_apca_m.apcadocno,g_apca_m.apcadocdt,'1')
            #        RETURNING g_sub_success
            #   IF g_sub_success THEN 
            #      CALL s_transaction_end('Y','0')
            #   ELSE
            #      CALL s_transaction_end('N','0')
            #   END IF
            #END IF
            ##141202-00061-15--(E)  
            #150210-00009#1--Mark
            
            #160816-00022#3 --s add
            #立暫估時稅額科目取aapi011暫估稅額科目
            LET l_cnt = 0
            SELECT count(*) INTO l_cnt
              FROM xrcd_t
             WHERE xrcdent = g_enterprise AND xrcdld = g_apca_m.apcald AND xrcddocno = g_apca_m.apcadocno
            IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
            IF l_cnt > 0 THEN
               IF s_transaction_chk("N",0) THEN
                  CALL s_transaction_begin()
               END IF
               
               CALL s_fin_get_account(g_apca_m.apcald,'13',g_apca_m.apca007,'8504_08') RETURNING g_sub_success,l_xrcd009,g_errno
               UPDATE xrcd_t SET xrcd009 = l_xrcd009
                WHERE xrcdent= g_enterprise 
                  AND xrcdld = g_apca_m.apcald AND xrcddocno = g_apca_m.apcadocno

               IF SQLCA.sqlerrd[3] = 0 THEN
                  CALL s_transaction_end('N','0')
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = "std-00009"
                  LET g_errparam.extend = "upd xrcd009"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  CONTINUE DIALOG
               END IF
               CALL s_transaction_end('Y','0')
            END IF
            #160816-00022#3 --s add
            #end add-point   
    
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
                  LET g_apcb2_d[li_reproduce_target].* = g_apcb2_d[li_reproduce].*
 
                  LET g_apcb2_d[li_reproduce_target].xrcdseq = NULL
                  LET g_apcb2_d[li_reproduce_target].xrcdseq2 = NULL
                  LET g_apcb2_d[li_reproduce_target].xrcd007 = NULL
               END IF
               #170920-00028 --- modify end ---
            ELSE
               CALL FGL_SET_ARR_CURR(g_apcb2_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_apcb2_d.getLength()+1
            END IF
            #(ver:84) ---start---
            #add-point:input段單身複製  name="input.body2.controlo"
            
            #end add-point
            #(ver:84) --- end ---
            
      END INPUT
 
      
 
 
 
 
{</section>}
 
{<section id="aapt320.input.other" >}
      
      #add-point:自定義input name="input.more_input"
      INPUT ARRAY g_apcb3_d FROM s_detail3.*
          ATTRIBUTE(COUNT = g_rec_b,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS, 
                  INSERT ROW = FALSE,    #不給新增跟刪除
                  DELETE ROW = FALSE,
                  APPEND ROW = FALSE)
         
         BEFORE INPUT
            CALL aapt320_b_fill()
            LET g_rec_b = g_apcb3_d.getLength()
         
         BEFORE ROW
            LET l_insert = FALSE
            LET l_cmd = ''
            LET l_ac = ARR_CURR()
            LET g_detail_idx = l_ac
            LET l_success = TRUE
            
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN aapt320_cl USING g_enterprise,g_apca_m.apcald,g_apca_m.apcadocno

            IF STATUS THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code =  STATUS
               LET g_errparam.extend = "OPEN aapt320_cl:"
               LET g_errparam.popup = TRUE
               CALL cl_err()

               CLOSE aapt320_cl
               CALL s_transaction_end('N','0')
               RETURN
            END IF
            
            LET g_rec_b = g_apcb_d.getLength()




            LET l_cmd='u'
            LET g_apcb3_d_t.* = g_apcb3_d[l_ac].*
            IF NOT aapt320_lock_b("apcb_t","'2'") THEN
               LET l_lock_sw='Y'
            ELSE
               FETCH aapt320_bcl3 INTO g_apcb3_d[l_ac].apcbseq,g_apcb3_d[l_ac].apcb002,
                                       g_apcb3_d[l_ac].apcb003,g_apcb3_d[l_ac].apcb004,g_apcb3_d[l_ac].apcb005,
                                       g_apcb3_d[l_ac].apcb103,                        g_apcb3_d[l_ac].apcb105,
                                       g_apcb3_d[l_ac].apcb113,g_apcb3_d[l_ac].apcb114,g_apcb3_d[l_ac].apcb115,
                                       g_apcb3_d[l_ac].apcb123,g_apcb3_d[l_ac].apcb124,g_apcb3_d[l_ac].apcb125,
                                       g_apcb3_d[l_ac].apcb133,g_apcb3_d[l_ac].apcb134,g_apcb3_d[l_ac].apcb135,
                                       g_apcb3_d[l_ac].apcborga,g_apcb3_d[l_ac].apcb020
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = g_apcb_d_t.apcbseq
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET l_lock_sw = "Y"
               END IF
                  
               LET g_bfill = "N"
               CALL aapt320_show()
               LET g_bfill = "Y"
                  
               CALL cl_show_fld_cont()
            END IF
            #依照含稅否判斷是否開啟含稅或未稅欄位
            LET l_oodb005 = 'N'
            IF NOT cl_null(g_apcb3_d[l_ac].apcb020) THEN
               CALL s_tax_chk(g_apcb3_d[l_ac].apcborga,g_apcb3_d[l_ac].apcb020) RETURNING g_sub_success,l_oodb004,l_oodb005,l_oodb006,l_oodb011
            END IF
            CALL cl_set_comp_entry("formonly.apcb123,formonly.apcb133,formonly.apcb125,formonly.apcb135",FALSE)
            IF l_oodb005 = 'Y' THEN
               CALL cl_set_comp_entry("formonly.apcb125,formonly.apcb135",TRUE)
            ELSE
               CALL cl_set_comp_entry("formonly.apcb123,formonly.apcb133",TRUE)
            END IF

         AFTER FIELD apcb123
            #本位幣二未稅金額
            IF NOT cl_null(g_apcb3_d[l_ac].apcb123) THEN
               IF g_apcb_d[l_ac].apcb123 != g_apcb_d_o.apcb123 OR cl_null(g_apcb_d_o.apcb123) THEN  #160726-00020#10
                  LET g_apcb3_d[l_ac].apcb125 = ''      #160726-00020#10
                  LET g_apcb3_d[l_ac].apcb125 = g_apcb3_d[l_ac].apcb123 + g_apcb3_d[l_ac].apcb124
                  LET g_apcb_d_o.* = g_apcb_d[l_ac].*   #160726-00020#10
               END IF                                   #160726-00020#10  
            END IF

         AFTER FIELD apcb125
            #本位幣二含稅金額
            IF NOT cl_null(g_apcb3_d[l_ac].apcb125) THEN 
               IF g_apcb_d[l_ac].apcb125 != g_apcb_d_o.apcb125 OR cl_null(g_apcb_d_o.apcb125) THEN  #160726-00020#10
                  LET g_apcb3_d[l_ac].apcb123 = ''      #160726-00020#10
                  LET g_apcb3_d[l_ac].apcb123 = g_apcb3_d[l_ac].apcb125 - g_apcb3_d[l_ac].apcb124
                  LET g_apcb_d_o.* = g_apcb_d[l_ac].*   #160726-00020#10
               END IF                                   #160726-00020#10
            END IF

         AFTER FIELD apcb133
            #本位幣三未稅金額
            IF NOT cl_null(g_apcb3_d[l_ac].apcb133) THEN
               IF g_apcb_d[l_ac].apcb133 != g_apcb_d_o.apcb133 OR cl_null(g_apcb_d_o.apcb133) THEN  #160726-00020#10
                  LET g_apcb3_d[l_ac].apcb135 = ''      #160726-00020#10
                  LET g_apcb3_d[l_ac].apcb135 = g_apcb3_d[l_ac].apcb133 + g_apcb3_d[l_ac].apcb134
                  LET g_apcb_d_o.* = g_apcb_d[l_ac].*   #160726-00020#10
               END IF                                   #160726-00020#10            
            END IF

         AFTER FIELD apcb135
            #本位幣三含稅金額
            IF NOT cl_null(g_apcb3_d[l_ac].apcb135) THEN 
               IF g_apcb_d[l_ac].apcb135 != g_apcb_d_o.apcb135 OR cl_null(g_apcb_d_o.apcb135) THEN  #160726-00020#10
                  LET g_apcb3_d[l_ac].apcb133 = ''      #160726-00020#10
                  LET g_apcb3_d[l_ac].apcb133 = g_apcb3_d[l_ac].apcb135 - g_apcb3_d[l_ac].apcb134
                  LET g_apcb_d_o.* = g_apcb_d[l_ac].*   #160726-00020#10
               END IF                                   #160726-00020#10
            END IF

         ON ROW CHANGE
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 9001
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET INT_FLAG = 0
               LET g_apcb3_d[l_ac].* = g_apcb3_d_t.*
               CLOSE aapt320_bcl3
               CALL s_transaction_end('N','0')
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = -263
               LET g_errparam.extend = g_apcb_d[l_ac].apcbseq
               LET g_errparam.popup = TRUE
               CALL cl_err()

               LET g_apcb3_d[l_ac].* = g_apcb3_d_t.*
            ELSE
               #apcb_t單身
               UPDATE apcb_t SET (apcb123,apcb125,apcb128,apcb133,apcb135,apcb138) =
                                 (g_apcb3_d[l_ac].apcb123,g_apcb3_d[l_ac].apcb125,g_apcb3_d[l_ac].apcb123,
                                  g_apcb3_d[l_ac].apcb133,g_apcb3_d[l_ac].apcb135,g_apcb3_d[l_ac].apcb133)
                WHERE apcbent = g_enterprise AND apcbld = g_apca_m.apcald 
                  AND apcbdocno = g_apca_m.apcadocno 
                  AND apcbseq = g_apcb3_d_t.apcbseq #項次 
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET l_success = FALSE
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "std-00009"
                     LET g_errparam.extend = "apcb_t"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET g_apcb3_d[l_ac].* = g_apcb3_d_t.*
                  WHEN SQLCA.sqlcode #其他錯誤
                     LET l_success = FALSE
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = "apcb_t"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET g_apcb3_d[l_ac].* = g_apcb3_d_t.*                     
                  OTHERWISE
                     INITIALIZE gs_keys TO NULL 
                     LET gs_keys[1] = g_apca_m.apcald
                     LET gs_keys_bak[1] = g_apcald_t
                     LET gs_keys[2] = g_apca_m.apcadocno
                     LET gs_keys_bak[2] = g_apcadocno_t
                     LET gs_keys[3] = g_apcb3_d[g_detail_idx].apcbseq
                     LET gs_keys_bak[3] = g_apcb3_d_t.apcbseq
               END CASE              
            END IF
            
         AFTER ROW
            IF l_success THEN
               CALL s_transaction_end('Y','0')
            ELSE
               CALL s_transaction_end('N','0')
            END IF
            CALL aapt320_unlock_b("apcb_t","'1'")
            
         AFTER INPUT
            LET g_page_mark = "bpage_3"
            CALL s_transaction_begin()
            
            INITIALIZE l_amount.* TO NULL
            CALL s_aap_clac_bill_master(g_apca_m.apcald,g_apca_m.apcadocno) RETURNING l_amount.*
            
            LET g_apca_m.apcamoddt = cl_get_current()
            
            UPDATE apca_t SET (apca123,apca124,apca126,apca127,apca128,
                               apca133,apca134,apca136,apca137,apca138,
                               apcamodid,apcamoddt) =
                              (l_amount.apcb123,l_amount.xrcd124,l_amount.apca126,l_amount.apca127,l_amount.apca128,
                               l_amount.apcb133,l_amount.xrcd134,l_amount.apca136,l_amount.apca137,l_amount.apca138,
                               g_user,g_apca_m.apcamoddt)
              WHERE apcaent = g_enterprise AND apcald = g_apca_m.apcald
                AND apcadocno = g_apca_m.apcadocno
            
            IF SQLCA.sqlerrd[3] = 0 THEN
               CALL s_transaction_end('N','0')
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = "std-00009"
               LET g_errparam.extend = "apca_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()

            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            CALL aapt320_curr_info_master()
            #150210-00009#1--Mark
            ##141202-00061-15--(S)
            #CALL s_aooi200_fin_get_slip(g_apca_m.apcadocno) RETURNING g_sub_success,g_ap_slip               
            #CALL s_fin_get_doc_para(g_apca_m.apcald,g_apca_m.apcacomp,g_ap_slip,'D-FIN-0030') RETURNING g_dfin0030
            #IF g_glaa.glaa121 = 'Y' AND g_dfin0030 = 'Y'THEN
            #   CALL s_transaction_begin()
            #   CALL s_pre_voucher_ins('AP','P10',g_apca_m.apcald,g_apca_m.apcadocno,g_apca_m.apcadocdt,'1')
            #        RETURNING g_sub_success
            #   IF g_sub_success THEN 
            #      CALL s_transaction_end('Y','0')
            #   ELSE
            #      CALL s_transaction_end('N','0')
            #   END IF
            #END IF
            #141202-00061-15--(E)  
            #150210-00009#1--Mark
            
         ON ACTION controlo    
            CALL FGL_SET_ARR_CURR(g_apcb_d.getLength()+1)
            LET lb_reproduce = TRUE
            LET li_reproduce = l_ac
            LET li_reproduce_target = g_apcb_d.getLength()+1
           
      END INPUT
      SUBDIALOG aap_aapt300_08.aapt300_08_input
      #end add-point
    
      BEFORE DIALOG 
         #CALL cl_err_collect_init()    
         #add-point:input段before dialog name="input.before_dialog"

         CALL s_fin_account_center_sons_query('3',g_apca_m.apcasite,g_apca_m.apcadocdt,'1')
         CALL s_fin_account_center_sons_str() RETURNING g_wc_apcasite
         CALL s_fin_get_wc_str(g_wc_apcasite) RETURNING g_wc_apcasite 
         CALL s_fin_account_center_ld_str() RETURNING g_wc_apcald
         CALL s_fin_get_wc_str(g_wc_apcald) RETURNING g_wc_apcald
         IF p_cmd = 'a' THEN
            NEXT FIELD apcadocno
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD apcborga
               WHEN "s_detail2"
                  NEXT FIELD xrcd009
               WHEN "s_detail3"
                  NEXT FIELD apcb047
               OTHERWISE
                  NEXT FIELD apcborga
            END CASE
         END IF
         #end add-point    
         #重新導回資料到正確位置上
         CALL DIALOG.setCurrentRow("s_detail1",g_idx_group.getValue("'1',"))      
         CALL DIALOG.setCurrentRow("s_detail2",g_idx_group.getValue("'2',"))
 
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            #add-point:input段next_field name="input.next_field"
            
            #end add-point  
            NEXT FIELD apcasite #170906-00011#1
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD apcbseq #170906-00011#1
               WHEN "s_detail2"
                  NEXT FIELD xrcd002_desc #170906-00011#1
 
               #add-point:input段modify_detail  name="input.modify_detail.other"
               OTHERWISE
                  NEXT FIELD apcbseq
               #end add-point  
            END CASE
         END IF
      
      AFTER DIALOG
         #add-point:input段after_dialog name="input.after_dialog"
         
         #end add-point    
         
      ON ACTION controlf
         CALL cl_set_focus_form(ui.Interface.getRootNode()) RETURNING g_fld_name,g_frm_name
         CALL cl_fldhelp(g_frm_name,g_fld_name,g_lang)
 
      ON ACTION controlr
         CALL cl_show_req_fields()
 
      ON ACTION controls
         IF g_header_hidden THEN
            CALL gfrm_curr.setElementHidden("vb_master",0)
            CALL gfrm_curr.setElementImage("controls","small/arr-u.png")
            LET g_header_hidden = 0     #visible
         ELSE
            CALL gfrm_curr.setElementHidden("vb_master",1)
            CALL gfrm_curr.setElementImage("controls","small/arr-d.png")
            LET g_header_hidden = 1     #hidden     
         END IF
 
      ON ACTION accept
         #add-point:input段accept  name="input.accept"
         CALL aapt300_08_b_fill(g_enterprise,g_apca_m.apcald,g_apca_m.apcadocno)  #150206-00013#3
         #end add-point    
         ACCEPT DIALOG
        
      ON ACTION cancel      #在dialog button (放棄)
         #add-point:input段cancel name="input.cancel"
         
         #end add-point  
         LET INT_FLAG = TRUE 
         LET g_detail_idx  = 1
         LET g_detail_idx2 = 1
         #各個page指標
         LET g_detail_idx_list[1] = 1 
         LET g_detail_idx_list[2] = 1
 
         CALL g_curr_diag.setCurrentRow("s_detail1",1)    
         CALL g_curr_diag.setCurrentRow("s_detail2",1)
 
         EXIT DIALOG
 
      ON ACTION close       #在dialog 右上角 (X)
         #add-point:input段close name="input.close"
         
         #end add-point  
         LET INT_FLAG = TRUE 
         EXIT DIALOG
 
      ON ACTION exit        #toolbar 離開
         #add-point:input段exit name="input.exit"
         
         #end add-point
         LET INT_FLAG = TRUE 
         LET g_detail_idx  = 1
         LET g_detail_idx2 = 1
         #各個page指標
         LET g_detail_idx_list[1] = 1 
         LET g_detail_idx_list[2] = 1
 
         CALL g_curr_diag.setCurrentRow("s_detail1",1)    
         CALL g_curr_diag.setCurrentRow("s_detail2",1)
 
         EXIT DIALOG
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG 
   END DIALOG
    
   #add-point:input段after input  name="input.after_input"
   CALL aapt320_show()     #150206-00013#3
   #150210-00009#1--(S)
   IF NOT INT_FLAG THEN
      CALL s_aooi200_fin_get_slip(g_apca_m.apcadocno) RETURNING g_sub_success,g_ap_slip     
      CALL s_fin_get_doc_para(g_apca_m.apcald,g_apca_m.apcacomp,g_ap_slip,'D-FIN-0030') RETURNING g_dfin0030
      IF g_glaa.glaa121 = 'Y' AND g_dfin0030 = 'Y'THEN
         CALL s_transaction_begin()
         CALL s_pre_voucher_ins('AP','P10',g_apca_m.apcald,g_apca_m.apcadocno,g_apca_m.apcadocdt,'1')
              RETURNING g_sub_success
         IF g_sub_success THEN 
            CALL s_transaction_end('Y','0')
         ELSE
            CALL s_transaction_end('N','0')
         END IF
      END IF
   END IF
   #150210-00009#1--(E)
   #151125-00006#2--s
#   CALL s_aapt300_immediately_conf(g_apca_m.apcald,g_apca_m.apcacomp,g_apca_m.apcadocno)
#   CALL s_aapt300_immediately_gen(g_apca_m.apcald,g_apca_m.apcacomp,g_apca_m.apcadocno)
#   SELECT COUNT(*) INTO l_cn FROM apca_t 
#   WHERE apcald  = g_apca_m.apcald AND  apcacomp = g_apca_m.apcacomp AND apcadocno = g_apca_m.apcadocno
#   IF l_cn > 0 THEN
#      CALL aapt320_ui_headershow()
#   END IF
   IF NOT INT_FLAG THEN
      SELECT count(*) INTO l_cnt 
        FROM apcb_t
       WHERE apcbent = g_enterprise
         AND apcbld  = g_apca_m.apcald AND apcbdocno = g_apca_m.apcadocno
      IF l_cnt > 0 THEN
         CALL s_aapt300_immediately_conf(g_apca_m.apcald,g_apca_m.apcacomp,g_apca_m.apcadocno)
         CALL s_aapt300_immediately_gen(g_apca_m.apcald,g_apca_m.apcacomp,g_apca_m.apcadocno)
      END IF
   END IF
   #151125-00006#2--e
   #end add-point    
 
END FUNCTION
 
{</section>}
 
{<section id="aapt320.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION aapt320_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   DEFINE l_pmaa004  LIKE pmaa_t.pmaa004          #170326-00005#1 add
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
 
   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL aapt320_b_fill() #單身填充
      CALL aapt320_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL aapt320_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"
   LET g_apca_m.apcadocno_desc= s_aooi200_fin_get_slip_desc(g_apca_m.apcadocno)    #單別
  #LET g_apca_m.apca058_desc  = s_desc_get_acc_desc('264',g_apca_m.apca058)    #採購分類
  #LET g_apca_m.apca054_desc  = s_desc_get_acc_desc('3114',g_apca_m.apca054)   #多帳期設定
   LET g_apca_m.apca051_desc  = s_desc_get_acc_desc('3115',g_apca_m.apca051)   #作廢理由碼   #151105-00007#1 remark
  #LET g_apca_m.apca007_desc  = s_desc_get_acc_desc('3211',g_apca_m.apca007)   #帳款類別
   LET g_apca_m.apca036_desc  = s_desc_get_account_desc(g_apca_m.apcald,g_apca_m.apca036) #會計科目(應付帳款)
   LET g_apca_m.apca035_desc  = s_desc_get_account_desc(g_apca_m.apcald,g_apca_m.apca035) #會計科目(費用)
   LET g_apca_m.apca0501 = g_apca_m.apca050   #應付附件份數
   LET g_apca_m.apca1001 = g_apca_m.apca100   #交易幣別
   LET g_apca_m.apca1011 = g_apca_m.apca101   #交易匯率
   CALL aapt320_set_ld_info(g_apca_m.apcald,'s')
   LET g_apca_m.apca011_desc  = s_desc_get_tax_desc(g_ooef019,g_apca_m.apca011)
   CALL aapt320_curr_info_master()
   CALL aapt300_13_show_lien (g_apca_m.apcald,g_apca_m.apcadocno)
   #160616-00005#2--add--str--
   #画面最下角显示单身金额合计
   CALL s_aapt300_sum(g_apca_m.apcald,g_apca_m.apcadocno,'')
   RETURNING g_apca_m.apcb103_s,g_apca_m.apcb104_s,g_apca_m.apcb105_s,
             g_apca_m.apcb113_s,g_apca_m.apcb114_s,g_apca_m.apcb115_s
   #160616-00005#2--add--end
   #160802-00007#2-----s
   IF cl_null(g_apca_m.apca004) THEN
      LET g_apca_m.apca057 = ''
   END IF
   SELECT pmaa004 INTO l_pmaa004 FROM pmaa_t WHERE pmaaent = g_enterprise AND pmaa001 = g_apca_m.apca004        #170326-00005#1 add
   IF l_pmaa004 MATCHES '[24]' THEN              #170326-00005#1 add   
      IF NOT cl_null(g_apca_m.apca057) THEN
         #CALL s_axrt300_xrca_ref('xrca057',g_apca_m.apca057,'','') RETURNING g_sub_success,g_apca_m.apca004_desc #170522-00030#1 mark
         #170522-00030#1 add(s)
         CALL s_axrt300_xrca_ref('xrca057',g_apca_m.apca004,g_apca_m.apca057,'') RETURNING g_sub_success,g_apca_m.apca004_desc 
         IF g_apca_m.apca005 = g_apca_m.apca004 THEN
            LET g_apca_m.apca005_desc = g_apca_m.apca004_desc
         END IF
         #170522-00030#1 add(e)
      END IF
   END IF                       #170326-00005#1 add
   #160802-00007#2-----e
   #end add-point
   
   #遮罩相關處理
   LET g_apca_m_mask_o.* =  g_apca_m.*
   CALL aapt320_apca_t_mask()
   LET g_apca_m_mask_n.* =  g_apca_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_apca_m.apcasite,g_apca_m.apcasite_desc,g_apca_m.apca003,g_apca_m.apca003_desc,g_apca_m.apcald, 
       g_apca_m.apcald_desc,g_apca_m.apcacomp,g_apca_m.apcacomp_desc,g_apca_m.apcadocno,g_apca_m.apca001, 
       g_apca_m.apcadocno_desc,g_apca_m.apcadocdt,g_apca_m.apca004,g_apca_m.apca004_desc,g_apca_m.apca005, 
       g_apca_m.apca005_desc,g_apca_m.apca038,g_apca_m.apca006,g_apca_m.apca057,g_apca_m.apcastus,g_apca_m.apca065, 
       g_apca_m.apca066,g_apca_m.apca008,g_apca_m.apca008_desc,g_apca_m.apca009,g_apca_m.apca010,g_apca_m.apca060, 
       g_apca_m.apca013,g_apca_m.apca012,g_apca_m.apca011,g_apca_m.apca011_desc,g_apca_m.apca007,g_apca_m.apca007_desc, 
       g_apca_m.apca036,g_apca_m.apca036_desc,g_apca_m.apca035,g_apca_m.apca035_desc,g_apca_m.apca100, 
       g_apca_m.apca103,g_apca_m.apca104,g_apca_m.apca106,g_apca_m.fflabel_1,g_apca_m.apca108,g_apca_m.apcc109, 
       g_apca_m.net108,g_apca_m.glaa001,g_apca_m.apca101,g_apca_m.apca113,g_apca_m.apca114,g_apca_m.apca116, 
       g_apca_m.apcc113,g_apca_m.apca118,g_apca_m.apcc119,g_apca_m.net118,g_apca_m.apca0501,g_apca_m.apca039, 
       g_apca_m.apca056,g_apca_m.apca016,g_apca_m.apca055,g_apca_m.apca055_desc,g_apca_m.apca018,g_apca_m.apca019, 
       g_apca_m.apca014,g_apca_m.apca014_desc,g_apca_m.apca054,g_apca_m.apca054_desc,g_apca_m.apca015, 
       g_apca_m.apca015_desc,g_apca_m.apca034,g_apca_m.apca034_desc,g_apca_m.apca033,g_apca_m.apca033_desc, 
       g_apca_m.apca058,g_apca_m.apca058_desc,g_apca_m.apca059,g_apca_m.apca059_desc,g_apca_m.apca063, 
       g_apca_m.apca050,g_apca_m.apca052,g_apca_m.apca017,g_apca_m.partition2,g_apca_m.apca051,g_apca_m.apca051_desc, 
       g_apca_m.apca053,g_apca_m.apca025,g_apca_m.apca031,g_apca_m.apca030,g_apca_m.apca030_desc,g_apca_m.partition3, 
       g_apca_m.apca026,g_apca_m.apca027,g_apca_m.apca028,g_apca_m.apca029,g_apca_m.apca020,g_apca_m.apca021, 
       g_apca_m.apca022,g_apca_m.apca046,g_apca_m.apca0181,g_apca_m.apca047,g_apca_m.apca048,g_apca_m.apca1001, 
       g_apca_m.apca1031,g_apca_m.apca1041,g_apca_m.apca1061,g_apca_m.fflabel_2,g_apca_m.apca1081,g_apca_m.apcc1091, 
       g_apca_m.net1081,g_apca_m.glaa0011,g_apca_m.apca1011,g_apca_m.apca120,g_apca_m.apca121,g_apca_m.apca130, 
       g_apca_m.apca131,g_apca_m.apca1131,g_apca_m.apca123,g_apca_m.apca133,g_apca_m.apca1141,g_apca_m.apca124, 
       g_apca_m.apca134,g_apca_m.apca1161,g_apca_m.apca126,g_apca_m.apca136,g_apca_m.apcc1131,g_apca_m.apcc123, 
       g_apca_m.apcc133,g_apca_m.apca1181,g_apca_m.apca128,g_apca_m.apca138,g_apca_m.apcc1191,g_apca_m.apcc129, 
       g_apca_m.apcc139,g_apca_m.net1181,g_apca_m.net128,g_apca_m.net138,g_apca_m.apcaownid,g_apca_m.apcaownid_desc, 
       g_apca_m.apcaowndp,g_apca_m.apcaowndp_desc,g_apca_m.apcacrtid,g_apca_m.apcacrtid_desc,g_apca_m.apcacrtdp, 
       g_apca_m.apcacrtdp_desc,g_apca_m.apcacrtdt,g_apca_m.apcamodid,g_apca_m.apcamodid_desc,g_apca_m.apcamoddt, 
       g_apca_m.apcacnfid,g_apca_m.apcacnfid_desc,g_apca_m.apcacnfdt,g_apca_m.apcb103_s,g_apca_m.apcb104_s, 
       g_apca_m.apcb105_s,g_apca_m.apcb113_s,g_apca_m.apcb114_s,g_apca_m.apcb115_s
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_apca_m.apcastus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
   
   #讀入ref值(單身)
   FOR l_ac = 1 TO g_apcb_d.getLength()
      #add-point:show段單身reference name="show.body.reference"
      LET g_apcb_d[l_ac].apcb020_desc = s_desc_get_tax_desc(g_ooef019,g_apcb_d[l_ac].apcb020)
      #170512-00045#10 add ------
      SELECT apcb033 INTO g_apcb_d[l_ac].l_apcb0332
        FROM apcb_t
       WHERE apcbent = g_enterprise
         AND apcbld = g_apca_m.apcald
         AND apcbdocno = g_apca_m.apcadocno
         AND apcbseq = g_apcb_d[l_ac].apcbseq
      #170512-00045#10 add end---
      #end add-point
   END FOR
   
   FOR l_ac = 1 TO g_apcb2_d.getLength()
      #add-point:show段單身reference name="show.body2.reference"
      LET g_apcb2_d[l_ac].xrcd002_desc = s_desc_get_tax_desc(g_ooef019,g_apcb2_d[l_ac].xrcd002)
      #end add-point
   END FOR
 
   
    
   
   #add-point:show段other name="show.other"
   
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL aapt320_detail_show()
 
   #add-point:show段之後 name="show.after"
 
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="aapt320.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION aapt320_detail_show()
   #add-point:detail_show段define(客製用) name="detail_show.define_customerization"
   
   #end add-point  
   #add-point:detail_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_show.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="detail_show.before"
   
   #end add-point
   
   #add-point:detail_show段之後 name="detail_show.after"
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="aapt320.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION aapt320_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE apca_t.apcald 
   DEFINE l_oldno     LIKE apca_t.apcald 
   DEFINE l_newno02     LIKE apca_t.apcadocno 
   DEFINE l_oldno02     LIKE apca_t.apcadocno 
 
   DEFINE l_master    RECORD LIKE apca_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE apcb_t.* #此變數樣板目前無使用
   DEFINE l_detail2    RECORD LIKE xrcd_t.* #此變數樣板目前無使用
 
 
 
   DEFINE l_cnt       LIKE type_t.num10
   #add-point:reproduce段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="reproduce.pre_function"
   #170213-00013#3  ---s---
   CASE g_apca_m.apca001
     WHEN 03
        LET g_apca_m.apca038 = '' 
     WHEN 04
        LET g_apca_m.apca038 = '' 
     OTHERWISE 
        CALL s_transaction_end('N','0')      
        RETURN
   END CASE
   #170213-00013#3  ---e---
   #end add-point
   
   #切換畫面
   IF g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   END IF
   
   LET g_master_insert = FALSE
   
   IF g_apca_m.apcald IS NULL
   OR g_apca_m.apcadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_apcald_t = g_apca_m.apcald
   LET g_apcadocno_t = g_apca_m.apcadocno
 
    
   LET g_apca_m.apcald = ""
   LET g_apca_m.apcadocno = ""
 
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_apca_m.apcaownid = g_user
      LET g_apca_m.apcaowndp = g_dept
      LET g_apca_m.apcacrtid = g_user
      LET g_apca_m.apcacrtdp = g_dept 
      LET g_apca_m.apcacrtdt = cl_get_current()
      LET g_apca_m.apcamodid = g_user
      LET g_apca_m.apcamoddt = cl_get_current()
      LET g_apca_m.apcastus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
   LET g_apca_m.apcald = g_apcald_t    #150617-00002#3 
   #CALL aapt320_rep_default()          #150617-00002#3 #170213-00013#3 mark
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_apca_m.apcastus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
   
   #清空key欄位的desc
      LET g_apca_m.apcald_desc = ''
   DISPLAY BY NAME g_apca_m.apcald_desc
   LET g_apca_m.apcadocno_desc = ''
   DISPLAY BY NAME g_apca_m.apcadocno_desc
 
   
   CALL aapt320_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_apca_m.* TO NULL
      INITIALIZE g_apcb_d TO NULL
      INITIALIZE g_apcb2_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL aapt320_show()
      CALL aapt320_idx_chk()   #(ver:83)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = '' 
      LET g_errparam.code = 9001 
      LET g_errparam.popup = FALSE 
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL aapt320_set_act_visible()   
   CALL aapt320_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_apcald_t = g_apca_m.apcald
   LET g_apcadocno_t = g_apca_m.apcadocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " apcaent = " ||g_enterprise|| " AND",
                      " apcald = '", g_apca_m.apcald, "' "
                      ," AND apcadocno = '", g_apca_m.apcadocno, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL aapt320_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
   
   CALL aapt320_idx_chk()
   
   LET g_data_owner = g_apca_m.apcaownid      
   LET g_data_dept  = g_apca_m.apcaowndp
   
   #功能已完成,通報訊息中心
   CALL aapt320_msgcentre_notify('reproduce')
   
END FUNCTION
 
{</section>}
 
{<section id="aapt320.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION aapt320_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE apcb_t.* #此變數樣板目前無使用
   DEFINE l_detail2    RECORD LIKE xrcd_t.* #此變數樣板目前無使用
 
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"

   #170213-00013#3---e---
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
  
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE aapt320_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"


   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM apcb_t
    WHERE apcbent = g_enterprise AND apcbld = g_apcald_t
     AND apcbdocno = g_apcadocno_t
 
    INTO TEMP aapt320_detail
 
   #將key修正為調整後   
   UPDATE aapt320_detail 
      #更新key欄位
      SET apcbld = g_apca_m.apcald
          , apcbdocno = g_apca_m.apcadocno
 
      #更新共用欄位
      
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   #DELETE FROM aapt320_detail  #150617-00002#3  #170213-00013#3 mark
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO apcb_t SELECT * FROM aapt320_detail
   
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "reproduce:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #add-point:單身複製中1 name="detail_reproduce.body.table1.m_insert"
 
   #end add-point
   
   #刪除TEMP TABLE
   DROP TABLE aapt320_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
   
   #end add-point
 
   #add-point:單身複製前 name="detail_reproduce.body.table2.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM xrcd_t 
    WHERE xrcdent = g_enterprise AND xrcdld = g_apcald_t
      AND xrcddocno = g_apcadocno_t   
 
    INTO TEMP aapt320_detail
 
   #將key修正為調整後   
   UPDATE aapt320_detail SET xrcdld = g_apca_m.apcald
                                       , xrcddocno = g_apca_m.apcadocno
 
  
   #add-point:單身修改前 name="detail_reproduce.body.table2.b_update"
   
   #end add-point    
 
   #將資料塞回原table   
   INSERT INTO xrcd_t SELECT * FROM aapt320_detail
   
   #add-point:單身複製中 name="detail_reproduce.body.table2.m_insert"
   
   #end add-point
   
   #刪除TEMP TABLE
   DROP TABLE aapt320_detail
   
   #add-point:單身複製後 name="detail_reproduce.body.table2.a_insert"
   #170213-00013#3---s---
   ##150617-00002#3   ---s---
   #DELETE FROM xrcd_t
   # WHERE xrcdld = g_apca_m.apcald
   #   AND xrcddocno = g_apca_m.apcadocno
   #   AND xrcdent = g_enterprise
   ##150617-00002#3   ---e---
   #170213-00013#3---e---
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_apcald_t = g_apca_m.apcald
   LET g_apcadocno_t = g_apca_m.apcadocno
 
   
END FUNCTION
 
{</section>}
 
{<section id="aapt320.delete" >}
#+ 資料刪除
PRIVATE FUNCTION aapt320_delete()
   #add-point:delete段define(客製用) name="delete.define_customerization"
   
   #end add-point     
   DEFINE  l_var_keys      DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys    DYNAMIC ARRAY OF STRING
   DEFINE  l_vars          DYNAMIC ARRAY OF STRING
   DEFINE  l_fields        DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak  DYNAMIC ARRAY OF STRING
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete.define"
   DEFINE  l_str           LIKE type_t.chr5
   #160902-00034#1---s---
   DEFINE  l_tran    RECORD
             docno        LIKE apcb_t.apcbdocno,
             ld           LIKE apcb_t.apcbld,
             docdt        LIKE apca_t.apcadocdt,
             comp         LIKE apca_t.apcacomp,
             seq          LIKE apcb_t.apcbseq,  
             bgbd007      LIKE bgbd_t.bgbd007,     
             bgbd037      LIKE bgbd_t.bgbd037,
             bgbd038      LIKE bgbd_t.bgbd038,
             bgbd040      LIKE bgbd_t.bgbd040,     
             bgbd007_t    LIKE bgbd_t.bgbd007,    #修改前的預算細項
             bgbd037_t    LIKE bgbd_t.bgbd037,    #修改前的單號
             bgbd038_t    LIKE bgbd_t.bgbd038,    #修改前的項次
             bgbd040_t    LIKE bgbd_t.bgbd040,    #修改前被占用的金額
             act          LIKE type_t.chr10     
   END RECORD
   DEFINE l_ls_js   STRING
   DEFINE l_sql     STRING
   #160902-00034#1---e---
   #end add-point     
   
   #add-point:Function前置處理  name="delete.pre_function"
   
   #end add-point
   
   IF g_apca_m.apcald IS NULL
   OR g_apca_m.apcadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   
   
   CALL s_transaction_begin()
 
   OPEN aapt320_cl USING g_enterprise,g_apca_m.apcald,g_apca_m.apcadocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN aapt320_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE aapt320_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE aapt320_master_referesh USING g_apca_m.apcald,g_apca_m.apcadocno INTO g_apca_m.apcasite,g_apca_m.apca003, 
       g_apca_m.apcald,g_apca_m.apcacomp,g_apca_m.apcadocno,g_apca_m.apca001,g_apca_m.apcadocdt,g_apca_m.apca004, 
       g_apca_m.apca005,g_apca_m.apca038,g_apca_m.apca006,g_apca_m.apca057,g_apca_m.apcastus,g_apca_m.apca065, 
       g_apca_m.apca066,g_apca_m.apca008,g_apca_m.apca009,g_apca_m.apca010,g_apca_m.apca060,g_apca_m.apca013, 
       g_apca_m.apca012,g_apca_m.apca011,g_apca_m.apca007,g_apca_m.apca036,g_apca_m.apca035,g_apca_m.apca100, 
       g_apca_m.apca103,g_apca_m.apca104,g_apca_m.apca106,g_apca_m.apca108,g_apca_m.apca101,g_apca_m.apca113, 
       g_apca_m.apca114,g_apca_m.apca116,g_apca_m.apca118,g_apca_m.apca039,g_apca_m.apca056,g_apca_m.apca016, 
       g_apca_m.apca055,g_apca_m.apca018,g_apca_m.apca019,g_apca_m.apca014,g_apca_m.apca054,g_apca_m.apca015, 
       g_apca_m.apca034,g_apca_m.apca033,g_apca_m.apca058,g_apca_m.apca059,g_apca_m.apca063,g_apca_m.apca050, 
       g_apca_m.apca052,g_apca_m.apca017,g_apca_m.apca051,g_apca_m.apca053,g_apca_m.apca025,g_apca_m.apca031, 
       g_apca_m.apca030,g_apca_m.apca026,g_apca_m.apca027,g_apca_m.apca028,g_apca_m.apca029,g_apca_m.apca020, 
       g_apca_m.apca021,g_apca_m.apca022,g_apca_m.apca046,g_apca_m.apca047,g_apca_m.apca048,g_apca_m.apca120, 
       g_apca_m.apca121,g_apca_m.apca130,g_apca_m.apca131,g_apca_m.apca123,g_apca_m.apca133,g_apca_m.apca124, 
       g_apca_m.apca134,g_apca_m.apca126,g_apca_m.apca136,g_apca_m.apca128,g_apca_m.apca138,g_apca_m.apcaownid, 
       g_apca_m.apcaowndp,g_apca_m.apcacrtid,g_apca_m.apcacrtdp,g_apca_m.apcacrtdt,g_apca_m.apcamodid, 
       g_apca_m.apcamoddt,g_apca_m.apcacnfid,g_apca_m.apcacnfdt,g_apca_m.apcasite_desc,g_apca_m.apca003_desc, 
       g_apca_m.apcald_desc,g_apca_m.apca004_desc,g_apca_m.apca005_desc,g_apca_m.apca008_desc,g_apca_m.apca007_desc, 
       g_apca_m.apca055_desc,g_apca_m.apca014_desc,g_apca_m.apca054_desc,g_apca_m.apca015_desc,g_apca_m.apca034_desc, 
       g_apca_m.apca033_desc,g_apca_m.apca058_desc,g_apca_m.apca059_desc,g_apca_m.apca030_desc,g_apca_m.apcaownid_desc, 
       g_apca_m.apcaowndp_desc,g_apca_m.apcacrtid_desc,g_apca_m.apcacrtdp_desc,g_apca_m.apcamodid_desc, 
       g_apca_m.apcacnfid_desc
   
   
   #檢查是否允許此動作
   IF NOT aapt320_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_apca_m_mask_o.* =  g_apca_m.*
   CALL aapt320_apca_t_mask()
   LET g_apca_m_mask_n.* =  g_apca_m.*
   
   CALL aapt320_show()
   
   #add-point:delete段before ask name="delete.before_ask"
   #150311--add--str--
   IF g_apca_m.apcastus <> 'N' THEN 
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'agl-00313'
      LET g_errparam.extend = g_apca_m.apcastus
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN
   END IF
   #150311--add--end--
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
      #回寫入庫單立暫估數量
      CALL s_aapt300_pmdt_upd(g_apca_m.apcald,g_apca_m.apcadocno,0,'-') RETURNING g_sub_success,g_errno
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL aapt320_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_apcald_t = g_apca_m.apcald
      LET g_apcadocno_t = g_apca_m.apcadocno
 
 
      DELETE FROM apca_t
       WHERE apcaent = g_enterprise AND apcald = g_apca_m.apcald
         AND apcadocno = g_apca_m.apcadocno
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_apca_m.apcald,":",SQLERRMESSAGE  
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF
      
      #add-point:單頭刪除後 name="delete.head.a_delete"
      IF NOT s_aooi200_fin_del_docno(g_apca_m.apcald,g_apca_m.apcadocno,g_apca_m.apcadocdt) THEN
         CALL s_transaction_end('N','0')
         RETURN
      END IF
      #end add-point
  
      #add-point:單身刪除前 name="delete.body.b_delete"
 
      #end add-point
      
      DELETE FROM apcb_t
       WHERE apcbent = g_enterprise AND apcbld = g_apca_m.apcald
         AND apcbdocno = g_apca_m.apcadocno
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
      DELETE FROM xrcd_t
       WHERE xrcdent  = g_enterprise         AND xrcdld  = g_apca_m.apcald
         AND xrcddocno= g_apca_m.apcadocno   AND xrcdseq = g_apcb_d_t.apcbseq
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "apcb_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF    
 
      #add-point:單身刪除後 name="delete.body.a_delete"
      #160902-00034#1---s---            
      CALL s_aooi200_fin_get_slip(g_apca_m.apcadocno) RETURNING g_sub_success,g_ap_slip
      CALL s_fin_get_doc_para(g_apca_m.apcald,g_apca_m.apcacomp,g_ap_slip,'D-FIN-5002') RETURNING g_dfin5002
      IF g_dfin5002 = 'Y' THEN           
         #150703-00021#24   ---s--- 刪除 預算滾動檔
         DELETE FROM bgbd_t
          WHERE bgbdent = g_enterprise
            AND bgbd037 = g_apca_m.apcadocno
         #150703-00021#24   ---e---              
         
         INITIALIZE l_tran.* TO NULL
         LET l_sql = " SELECT apcb017,apcb002,apcb003,apcb103             ",         
                     "   FROM apcb_t                                      ",
                     "  WHERE apcbent   = ",g_enterprise,"                ",
                     "    AND apcbdocno = '",g_apca_m.apcadocno,"'        ",
                     "    AND apcbld    = '",g_apca_m.apcald,"'           ",
                     "    AND apcb002 IS NOT NULL AND apcb003 IS NOT NULL "
         PREPARE aapt320_bgbd_ud_p FROM l_sql
         DECLARE aapt320_bgbd_ud_c CURSOR FOR aapt320_bgbd_ud_c
         FOREACH aapt320_bgbd_ud_c INTO l_tran.bgbd007_t,l_tran.bgbd037_t,
                                        l_tran.bgbd038_t,l_tran.bgbd040_t
            #有轉出單號項次  回寫金額轉出金額-項  
            LET l_tran.docno     = g_apca_m.apcadocno 
            LET l_tran.ld        = g_apca_m.apcald
            LET l_tran.docdt     = g_apca_m.apcadocdt
            LET l_tran.comp      = g_apca_m.apcacomp
            LET l_tran.act       = 'UD'                     
            LET l_ls_js = util.JSON.stringify(l_tran)                  
            CALL s_abg_tran(l_ls_js) RETURNING g_sub_success,g_errno 
         END FOREACH
      END IF
      #160902-00034#1 ---e---
      #end add-point
      
            
                                                               
      #add-point:單身刪除前 name="delete.body.b_delete2"
      
      #end add-point
      DELETE FROM xrcd_t
       WHERE xrcdent = g_enterprise AND
             xrcdld = g_apca_m.apcald AND xrcddocno = g_apca_m.apcadocno
      #add-point:單身刪除中 name="delete.body.m_delete2"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "xrcd_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF      
 
      #add-point:單身刪除後 name="delete.body.a_delete2"
      CALL s_aapt300_del_sub_table(g_apca_m.apcald,g_apca_m.apcadocno) RETURNING g_sub_success,g_errno,l_str
      IF NOT g_sub_success THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = l_str 
         LET g_errparam.code   = g_errno 
         LET g_errparam.popup  = FALSE 
         CALL cl_err()
 
         CALL s_transaction_end('N','0')
         RETURN
      END IF   
      CALL g_apcb3_d.clear() 
      CALL aapt300_08_clear_detail() 
      #end add-point
 
 
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_apca_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE aapt320_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_apcb_d.clear() 
      CALL g_apcb2_d.clear()       
 
     
      CALL aapt320_ui_browser_refresh()  
      #CALL aapt320_ui_headershow()  
      #CALL aapt320_ui_detailshow()
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      
      #end add-point
      
      #單頭多語言刪除
      
         #161130-00056 add
      
      #單身多語言刪除
      
         #161130-00056 add
      
         #161130-00056 add
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
      
      #end add-point
      
      IF g_browser_cnt > 0 THEN 
         #CALL aapt320_browser_fill("")
         CALL aapt320_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE aapt320_cl
 
   #功能已完成,通報訊息中心
   CALL aapt320_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="aapt320.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION aapt320_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   CALL g_apcb3_d.clear() 
   CALL aapt300_08_clear_detail() 
   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_apcb_d.clear()
   CALL g_apcb2_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   CALL g_apcb3_d.clear()
   #end add-point
   
   #判斷是否填充
   IF aapt320_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      #若有觸發條件(g_wc2)異動的任何行為都需添加在下方條件中,避免條件無正常刷新 ver:81
      IF (g_action_choice = "query" OR cl_null(g_action_choice) OR g_action_choice = "queryplan" OR 
          g_action_choice = "insert" OR g_action_choice = "modify" OR g_action_choice = "reproduce" ) #ver:81 #ver:82
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT apcbseq,apcb001,apcborga,apcb002,apcb003,apcb023,apcb004,apcb005, 
             apcb030,apcb020,apcb006,apcb022,apcb007,apcb101,apcb103,apcb104,apcb105,apcb111,apcb113, 
             apcb114,apcb115,apcb028,apcb049,apcb048,apcb008,apcb009,apcb010,apcb047,apcb021,apcb029, 
             apcb017,apcb100,apcb123,apcb124,apcb125,apcb133,apcb134,apcb135,apcblegl,apcb011,apcb012, 
             apcb014,apcb015,apcb016,apcb024,apcbsite,apcb013,apcb018,apcb019,apcb106,apcb108,apcb051, 
             apcb102,apcb034,apcb054,apcb055,apcb036,apcb035,apcb037,apcb038,apcb039,apcb040,apcb041, 
             apcb042,apcb043,apcb044,apcb045,apcb046 ,t1.ooefl003 ,t2.oodbl004 FROM apcb_t",   
                     " INNER JOIN apca_t ON apcaent = " ||g_enterprise|| " AND apcald = apcbld ",
                     " AND apcadocno = apcbdocno ",
 
                     #"",
                     
                     "",
                     #下層單身所需的join條件
 
                                    " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=apcborga AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN oodbl_t t2 ON t2.oodblent="||g_enterprise||" AND t2.oodbl001='' AND t2.oodbl002=apcb020 AND t2.oodbl003='"||g_dlang||"' ",
 
                     " WHERE apcbent=? AND apcbld=? AND apcbdocno=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
         #160822-00007#1 mark--s
         #IF NOT cl_null(g_wc2_table2) AND g_wc2_table2 <> " 1=1" THEN
         #   LET g_wc2_table1 = g_wc2_table1 CLIPPED,
         #                   " AND (apcbdocno,apcbseq) IN (SELECT xrcddocno,xrcdseq FROM xrcd_t ",
         #                                                " WHERE apcbent = xrcdent ",
         #                                                "   AND apcbdocno = xrcddocno ",
         #                                                "   AND apcbseq = xrcdseq ",
         #                                                "   AND ",g_wc2_table2 CLIPPED,")"
         #END IF
         #160822-00007#1 mark--e
         #160822-00007#1--s
         #由於會造成單身下條件後b_fillSQL的異常狀況,所以改成先清掉原條件再加上
         #清空原邏輯
         LET g_wc_apcbxrcd1 = g_wc_apcbxrcd1.trim()
         LET g_wc2_table1 = cl_replace_str(g_wc2_table1, g_wc_apcbxrcd1, '')
         IF NOT cl_null(g_wc2_table2) AND g_wc2_table2 <> " 1=1" THEN     
            LET g_wc_apcbxrcd1 = " AND (apcbdocno,apcbseq) IN (SELECT xrcddocno,xrcdseq FROM xrcd_t ",
                                                            " WHERE apcbent = xrcdent ",
                                                            "   AND apcbdocno = xrcddocno ",
                                                            "   AND apcbseq = xrcdseq ",
                                                            "   AND ",g_wc2_table2 CLIPPED,")"
            LET g_wc2_table1 = g_wc2_table1 CLIPPED,g_wc_apcbxrcd1 CLIPPED
         END IF
         #160822-00007#1--e
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY apcb_t.apcbseq"
         
         #add-point:單身填充控制 name="b_fill.sql"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE aapt320_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR aapt320_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
   #  OPEN b_fill_cs USING g_enterprise,g_apca_m.apcald,g_apca_m.apcadocno   #(ver:78)
                                               
      FOREACH b_fill_cs USING g_enterprise,g_apca_m.apcald,g_apca_m.apcadocno INTO g_apcb_d[l_ac].apcbseq, 
          g_apcb_d[l_ac].apcb001,g_apcb_d[l_ac].apcborga,g_apcb_d[l_ac].apcb002,g_apcb_d[l_ac].apcb003, 
          g_apcb_d[l_ac].apcb023,g_apcb_d[l_ac].apcb004,g_apcb_d[l_ac].apcb005,g_apcb_d[l_ac].apcb030, 
          g_apcb_d[l_ac].apcb020,g_apcb_d[l_ac].apcb006,g_apcb_d[l_ac].apcb022,g_apcb_d[l_ac].apcb007, 
          g_apcb_d[l_ac].apcb101,g_apcb_d[l_ac].apcb103,g_apcb_d[l_ac].apcb104,g_apcb_d[l_ac].apcb105, 
          g_apcb_d[l_ac].apcb111,g_apcb_d[l_ac].apcb113,g_apcb_d[l_ac].apcb114,g_apcb_d[l_ac].apcb115, 
          g_apcb_d[l_ac].apcb028,g_apcb_d[l_ac].apcb049,g_apcb_d[l_ac].apcb048,g_apcb_d[l_ac].apcb008, 
          g_apcb_d[l_ac].apcb009,g_apcb_d[l_ac].apcb010,g_apcb_d[l_ac].apcb047,g_apcb_d[l_ac].apcb021, 
          g_apcb_d[l_ac].apcb029,g_apcb_d[l_ac].apcb017,g_apcb_d[l_ac].apcb100,g_apcb_d[l_ac].apcb123, 
          g_apcb_d[l_ac].apcb124,g_apcb_d[l_ac].apcb125,g_apcb_d[l_ac].apcb133,g_apcb_d[l_ac].apcb134, 
          g_apcb_d[l_ac].apcb135,g_apcb_d[l_ac].apcblegl,g_apcb_d[l_ac].apcb011,g_apcb_d[l_ac].apcb012, 
          g_apcb_d[l_ac].apcb014,g_apcb_d[l_ac].apcb015,g_apcb_d[l_ac].apcb016,g_apcb_d[l_ac].apcb024, 
          g_apcb_d[l_ac].apcbsite,g_apcb_d[l_ac].apcb013,g_apcb_d[l_ac].apcb018,g_apcb_d[l_ac].apcb019, 
          g_apcb_d[l_ac].apcb106,g_apcb_d[l_ac].apcb108,g_apcb_d[l_ac].apcb051,g_apcb_d[l_ac].apcb102, 
          g_apcb_d[l_ac].apcb034,g_apcb_d[l_ac].apcb054,g_apcb_d[l_ac].apcb055,g_apcb_d[l_ac].apcb036, 
          g_apcb_d[l_ac].apcb035,g_apcb_d[l_ac].apcb037,g_apcb_d[l_ac].apcb038,g_apcb_d[l_ac].apcb039, 
          g_apcb_d[l_ac].apcb040,g_apcb_d[l_ac].apcb041,g_apcb_d[l_ac].apcb042,g_apcb_d[l_ac].apcb043, 
          g_apcb_d[l_ac].apcb044,g_apcb_d[l_ac].apcb045,g_apcb_d[l_ac].apcb046,g_apcb_d[l_ac].apcborga_desc, 
          g_apcb_d[l_ac].apcb020_desc   #(ver:78)
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill.fill"
         LET g_apcb_d[l_ac].apcb021_desc = s_desc_get_account_desc(g_apca_m.apcald,g_apcb_d[l_ac].apcb021)   #150206-00013#3
         LET g_apcb_d[l_ac].apcb029_desc = s_desc_get_account_desc(g_apca_m.apcald,g_apcb_d[l_ac].apcb029)   #150206-00013#3
         #end add-point
      
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
   
   END IF
    
   #判斷是否填充
   IF aapt320_fill_chk(2) THEN
      #若有觸發條件(g_wc2)異動的任何行為都需添加在下方條件中,避免條件無正常刷新 ver:81
      IF (g_action_choice = "query" OR cl_null(g_action_choice) OR g_action_choice = "queryplan" OR
          g_action_choice = "insert" OR g_action_choice = "modify" OR g_action_choice = "reproduce" ) #ver:81 #ver:82
         #add-point:b_fill段long_sql_if name="b_fill.body2.long_sql_if"
         
         #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT xrcdseq,xrcdseq2,xrcd007,xrcd002,xrcd003,xrcd006,xrcd005,xrcd102, 
             xrcd103,xrcd104,xrcd105,xrcd113,xrcd114,xrcd115,xrcd123,xrcd124,xrcd125,xrcd133,xrcd134, 
             xrcd135,xrcdorga,xrcd009  FROM xrcd_t",   
                     " INNER JOIN  apca_t ON apcaent = " ||g_enterprise|| " AND apcald = xrcdld ",
                     " AND apcadocno = xrcddocno ",
 
                     "",
                     
                     
                     " WHERE xrcdent=? AND xrcdld=? AND xrcddocno=?"   
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段fill_sql name="b_fill.body2.fill_sql"
         #160822-00007#1 mark--s
         #IF NOT cl_null(g_wc2_table1) AND g_wc2_table1 <> " 1=1" THEN
         #   LET g_wc2_table2 = g_wc2_table2 CLIPPED,
         #                   " AND (xrcddocno,xrcdseq) IN (SELECT xrcddocno,xrcdseq FROM apcb_t ",
         #                                                " WHERE apcbent = xrcdent ",
         #                                                "   AND apcbdocno = xrcddocno ",
         #                                                "   AND apcbseq = xrcdseq ",
         #                                                "   AND ",g_wc2_table1 CLIPPED,")"
         #END IF
         #160822-00007#1 mark--e
         #160822-00007#1--s
         #清空原邏輯
         LET g_wc_apcbxrcd2 = g_wc_apcbxrcd2.trim()
         LET g_wc2_table2 = cl_replace_str(g_wc2_table2, g_wc_apcbxrcd2, '')
         IF NOT cl_null(g_wc2_table1) AND g_wc2_table1 <> " 1=1" THEN     
            LET g_wc_apcbxrcd2 = " AND (xrcddocno,xrcdseq) IN (SELECT xrcddocno,xrcdseq FROM apcb_t ",
                                                         " WHERE apcbent = xrcdent ",
                                                         "   AND apcbdocno = xrcddocno ",
                                                         "   AND apcbseq = xrcdseq ",
                                                         "   AND ",g_wc2_table1 CLIPPED,")"
            LET g_wc2_table2 = g_wc2_table2 CLIPPED,g_wc_apcbxrcd2 CLIPPED
         END IF
         #160822-00007#1--e
         #end add-point
         IF NOT cl_null(g_wc2_table2) THEN
            LET g_sql = g_sql CLIPPED," AND ",g_wc2_table2 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY xrcd_t.xrcdseq,xrcd_t.xrcdseq2,xrcd_t.xrcd007"
         
         #add-point:單身填充控制 name="b_fill.sql2"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE aapt320_pb2 FROM g_sql
         DECLARE b_fill_cs2 CURSOR FOR aapt320_pb2
      END IF
    
      LET l_ac = 1
      
   #  OPEN b_fill_cs2 USING g_enterprise,g_apca_m.apcald,g_apca_m.apcadocno   #(ver:78)
                                               
      FOREACH b_fill_cs2 USING g_enterprise,g_apca_m.apcald,g_apca_m.apcadocno INTO g_apcb2_d[l_ac].xrcdseq, 
          g_apcb2_d[l_ac].xrcdseq2,g_apcb2_d[l_ac].xrcd007,g_apcb2_d[l_ac].xrcd002,g_apcb2_d[l_ac].xrcd003, 
          g_apcb2_d[l_ac].xrcd006,g_apcb2_d[l_ac].xrcd005,g_apcb2_d[l_ac].xrcd102,g_apcb2_d[l_ac].xrcd103, 
          g_apcb2_d[l_ac].xrcd104,g_apcb2_d[l_ac].xrcd105,g_apcb2_d[l_ac].xrcd113,g_apcb2_d[l_ac].xrcd114, 
          g_apcb2_d[l_ac].xrcd115,g_apcb2_d[l_ac].xrcd123,g_apcb2_d[l_ac].xrcd124,g_apcb2_d[l_ac].xrcd125, 
          g_apcb2_d[l_ac].xrcd133,g_apcb2_d[l_ac].xrcd134,g_apcb2_d[l_ac].xrcd135,g_apcb2_d[l_ac].xrcdorga, 
          g_apcb2_d[l_ac].xrcd009   #(ver:78)
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill2.fill"
         SELECT apcb005 INTO g_apcb2_d[l_ac].imaa003_desc
           FROM apcb_t
          WHERE apcbent= g_enterprise
            AND apcbld = g_apca_m.apcald AND apcbdocno = g_apca_m.apcadocno
            AND apcbseq= g_apcb2_d[l_ac].xrcdseq
         LET g_apcb2_d[l_ac].xrcd002_desc = s_desc_get_tax_desc(g_ooef019,g_apcb2_d[l_ac].xrcd002)
         LET g_apcb2_d[l_ac].xrcd009_desc = s_desc_get_account_desc(g_apca_m.apcald,g_apcb2_d[l_ac].xrcd009)   #稅額會計科目
         LET g_apcb_d[l_ac].apcb010_desc = s_desc_get_department_desc(g_apcb_d[l_ac].apcb010)         #150828-00001#7
         #end add-point
      
         LET l_ac = l_ac + 1
         IF l_ac > g_max_rec THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = l_ac
            LET g_errparam.code = 9035 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
         
      END FOREACH
   END IF
 
 
   
   #add-point:browser_fill段其他table處理 name="browser_fill.other_fill"
   CALL aapt300_08_b_fill(g_enterprise,g_apca_m.apcald,g_apca_m.apcadocno)
   #其他本位幣處理
   LET g_sql = "SELECT UNIQUE apcbseq,apcb002,apcb003,apcb004,apcb005,",
               "              apcb103,        apcb105,apcb113,apcb114,apcb115,",
               "              apcb123,apcb124,apcb125,apcb133,apcb134,apcb135,",   
               "              apcborga,apcb020",               
               "  FROM apcb_t",
               #" INNER JOIN apca_t ON apcald = apcbld ",             #170301-00027#12  2017/03/07  By 09042   mark
               " INNER JOIN apca_t ON apcaent = apcbent ",            #170301-00027#12  2017/03/07  By 09042   add
               #"   AND apcadocno = apcbdocno AND apcaent = apcbent ",#170301-00027#12  2017/03/07  By 09042   mark
               "   AND apcadocno = apcbdocno AND apcald = apcbld ",   #170301-00027#12  2017/03/07  By 09042   add
               " WHERE apcbent=? AND apcbld=? AND apcbdocno=?",  
               " ORDER BY apcb_t.apcbseq"
      
      PREPARE aapt320_pb1 FROM g_sql
      DECLARE b_fill_cs1 CURSOR FOR aapt320_pb1
   
      LET l_ac = 1
      OPEN b_fill_cs1 USING g_enterprise,g_apca_m.apcald,g_apca_m.apcadocno
                                               
      FOREACH b_fill_cs1 INTO g_apcb3_d[l_ac].apcbseq,g_apcb3_d[l_ac].apcb002,
                              g_apcb3_d[l_ac].apcb003,g_apcb3_d[l_ac].apcb004,g_apcb3_d[l_ac].apcb005,
                              g_apcb3_d[l_ac].apcb103,                        g_apcb3_d[l_ac].apcb105,
                              g_apcb3_d[l_ac].apcb113,g_apcb3_d[l_ac].apcb114,g_apcb3_d[l_ac].apcb115,
                              g_apcb3_d[l_ac].apcb123,g_apcb3_d[l_ac].apcb124,g_apcb3_d[l_ac].apcb125,
                              g_apcb3_d[l_ac].apcb133,g_apcb3_d[l_ac].apcb134,g_apcb3_d[l_ac].apcb135,
                              g_apcb3_d[l_ac].apcborga,g_apcb3_d[l_ac].apcb020
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "FOREACH:"
            LET g_errparam.popup = TRUE
            CALL cl_err()

            EXIT FOREACH
         END IF
         LET l_ac = l_ac + 1
         IF l_ac > g_max_rec AND g_error_show = 1 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code =  9035
            LET g_errparam.extend =  ''
            LET g_errparam.popup = TRUE
            CALL cl_err()

            EXIT FOREACH
         END IF
      END FOREACH
      CALL g_apcb3_d.deleteElement(g_apcb_d.getLength())
   #end add-point
   
   CALL g_apcb_d.deleteElement(g_apcb_d.getLength())
   CALL g_apcb2_d.deleteElement(g_apcb2_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE aapt320_pb
   FREE aapt320_pb2
 
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_apcb_d.getLength()
      LET g_apcb_d_mask_o[l_ac].* =  g_apcb_d[l_ac].*
      CALL aapt320_apcb_t_mask()
      LET g_apcb_d_mask_n[l_ac].* =  g_apcb_d[l_ac].*
   END FOR
   
   LET g_apcb2_d_mask_o.* =  g_apcb2_d.*
   FOR l_ac = 1 TO g_apcb2_d.getLength()
      LET g_apcb2_d_mask_o[l_ac].* =  g_apcb2_d[l_ac].*
      CALL aapt320_xrcd_t_mask()
      LET g_apcb2_d_mask_n[l_ac].* =  g_apcb2_d[l_ac].*
   END FOR
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="aapt320.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION aapt320_delete_b(ps_table,ps_keys_bak,ps_page)
   #add-point:delete_b段define(客製用) name="delete_b.define_customerization"
   
   #end add-point     
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys_bak DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   DEFINE li_idx      LIKE type_t.num10
   #add-point:delete_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete_b.define"
   #160902-00034#1---s---  
   DEFINE  l_tran    RECORD
             docno        LIKE apcb_t.apcbdocno,
             ld           LIKE apcb_t.apcbld,
             docdt        LIKE apca_t.apcadocdt,
             comp         LIKE apca_t.apcacomp,
             seq          LIKE apcb_t.apcbseq,  
             bgbd007      LIKE bgbd_t.bgbd007,     
             bgbd037      LIKE bgbd_t.bgbd037,
             bgbd038      LIKE bgbd_t.bgbd038,
             bgbd040      LIKE bgbd_t.bgbd040,     
             bgbd007_t    LIKE bgbd_t.bgbd007,    #修改前的預算細項
             bgbd037_t    LIKE bgbd_t.bgbd037,    #修改前的單號
             bgbd038_t    LIKE bgbd_t.bgbd038,    #修改前的項次
             bgbd040_t    LIKE bgbd_t.bgbd040,    #修改前被占用的金額
             act          LIKE type_t.chr10     
   END RECORD
   DEFINE l_ls_js   STRING
   #160902-00034#1---e---
   #end add-point     
   
   #add-point:Function前置處理  name="delete_b.pre_function"
   
   #end add-point
   
   LET g_update = TRUE  
   
   #判斷是否是同一群組的table
   LET ls_group = "'1',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前 name="delete_b.b_delete"
      CALL s_aooi200_fin_get_slip(g_apca_m.apcadocno) RETURNING g_sub_success,g_ap_slip                    #160902-00034#1 
      CALL s_fin_get_doc_para(g_apca_m.apcald,g_apca_m.apcacomp,g_ap_slip,'D-FIN-5002') RETURNING g_dfin5002#160902-00034#1 
      IF g_dfin5002 = 'Y' THEN #160902-00034#1                     
         #150703-00021#24---s---單身刪除/刪除bgbd_t
         CALL s_aapt300_bgbd_upd(ps_keys_bak[2],ps_keys_bak[1],ps_keys_bak[3],'D','3') 
            RETURNING g_sub_success,g_errno
         IF NOT g_sub_success THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "" 
            LET g_errparam.code   = g_errno 
            LET g_errparam.popup  = FALSE 
            CALL cl_err()
            RETURN FALSE
         END IF
         #150703-00021#24---e---
         #160902-00034#1 ---s---
         IF NOT cl_null(g_apcb_d[g_detail_idx].apcb002) AND NOT cl_null(g_apcb_d[g_detail_idx].apcb003) THEN
            LET l_tran.docno     = g_apca_m.apcadocno
            LET l_tran.ld        = g_apca_m.apcald
            LET l_tran.docdt     = g_apca_m.apcadocdt
            LET l_tran.comp      = g_apca_m.apcacomp
            LET l_tran.seq       = g_apcb_d[g_detail_idx].apcbseq
            LET l_tran.bgbd007   = ''
            LET l_tran.bgbd037   = ''
            LET l_tran.bgbd038   = ''
            LET l_tran.bgbd040   = ''
            LET l_tran.bgbd007_t = g_apcb_d[g_detail_idx].apcb017
            LET l_tran.bgbd037_t = g_apcb_d[g_detail_idx].apcb002   
            LET l_tran.bgbd038_t = g_apcb_d[g_detail_idx].apcb003    
            LET l_tran.bgbd040_t = g_apcb_d[g_detail_idx].apcb103 
            LET l_tran.act       = 'UD'                     
            LET l_ls_js = util.JSON.stringify(l_tran)                  
            CALL s_abg_tran(l_ls_js) RETURNING g_sub_success,g_errno  
         END IF
      END IF #160902-00034#1  ---e---
      #end add-point    
      DELETE FROM apcb_t
       WHERE apcbent = g_enterprise AND
         apcbld = ps_keys_bak[1] AND apcbdocno = ps_keys_bak[2] AND apcbseq = ps_keys_bak[3]
      #add-point:delete_b段刪除中 name="delete_b.m_delete"
      
      #end add-point    
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = ":",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN FALSE
      END IF
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_apcb_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前 name="delete_b.b_delete2"
      
      #end add-point    
      DELETE FROM xrcd_t
       WHERE xrcdent = g_enterprise AND
             xrcdld = ps_keys_bak[1] AND xrcddocno = ps_keys_bak[2] AND xrcdseq = ps_keys_bak[3] AND xrcdseq2 = ps_keys_bak[4] AND xrcd007 = ps_keys_bak[5]
      #add-point:delete_b段刪除中 name="delete_b.m_delete2"
      
      #end add-point    
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "xrcd_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN FALSE
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'2'" THEN 
         CALL g_apcb2_d.deleteElement(li_idx) 
      END IF 
 
      #add-point:delete_b段刪除後 name="delete_b.a_delete2"
      
      #end add-point    
   END IF
 
 
   
 
   
   #add-point:delete_b段other name="delete_b.other"
   
   #end add-point  
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="aapt320.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION aapt320_insert_b(ps_table,ps_keys,ps_page)
   #add-point:insert_b段define(客製用) name="insert_b.define_customerization"
   
   #end add-point     
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys     DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   DEFINE ls_page     STRING
   DEFINE li_idx      LIKE type_t.num10
   #add-point:insert_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert_b.define"
   DEFINE ls_js         STRING               #150703-00021#24
   DEFINE l_apcb106     LIKE apcb_t.apcb106  #160107-00001#1
   DEFINE l_apcb116     LIKE apcb_t.apcb116  #160107-00001#1
   DEFINE l_apcb126     LIKE apcb_t.apcb126  #160107-00001#1
   DEFINE l_apcb136     LIKE apcb_t.apcb136  #160107-00001#1
   DEFINE l_pmdt036     LIKE pmdt_t.pmdt036  #160816-00022#3 add 
   DEFINE l_apcb107     LIKE apcb_t.apcb107  #160816-00022#3 add 
   #160902-00034#1---s---
   DEFINE l_ls_js   STRING
   DEFINE l_tran    RECORD
             docno        LIKE apcb_t.apcbdocno,
             ld           LIKE apcb_t.apcbld,
             docdt        LIKE apca_t.apcadocdt,
             comp         LIKE apca_t.apcacomp,
             seq          LIKE apcb_t.apcbseq,  
             bgbd007      LIKE bgbd_t.bgbd007,     
             bgbd037      LIKE bgbd_t.bgbd037,
             bgbd038      LIKE bgbd_t.bgbd038,
             bgbd040      LIKE bgbd_t.bgbd040,     
             bgbd007_t    LIKE bgbd_t.bgbd007,    #修改前的預算細項
             bgbd037_t    LIKE bgbd_t.bgbd037,    #修改前的單號
             bgbd038_t    LIKE bgbd_t.bgbd038,    #修改前的項次
             bgbd040_t    LIKE bgbd_t.bgbd040,    #修改前被占用的金額
             act          LIKE type_t.chr10     
   END RECORD
   #160902-00034#1---s---
   #end add-point     
   
   #add-point:Function前置處理  name="insert_b.pre_function"
   
   #end add-point
   
   LET g_update = TRUE  
   
   #判斷是否是同一群組的table
   LET ls_group = "'1',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前 name="insert_b.before_insert"
      
      #end add-point 
      INSERT INTO apcb_t
                  (apcbent,
                   apcbld,apcbdocno,
                   apcbseq
                   ,apcb001,apcborga,apcb002,apcb003,apcb023,apcb004,apcb005,apcb030,apcb020,apcb006,apcb022,apcb007,apcb101,apcb103,apcb104,apcb105,apcb111,apcb113,apcb114,apcb115,apcb028,apcb049,apcb048,apcb008,apcb009,apcb010,apcb047,apcb021,apcb029,apcb017,apcb100,apcb123,apcb124,apcb125,apcb133,apcb134,apcb135,apcblegl,apcb011,apcb012,apcb014,apcb015,apcb016,apcb024,apcbsite,apcb013,apcb018,apcb019,apcb106,apcb108,apcb051,apcb102,apcb034,apcb054,apcb055,apcb036,apcb035,apcb037,apcb038,apcb039,apcb040,apcb041,apcb042,apcb043,apcb044,apcb045,apcb046) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2],ps_keys[3]
                   ,g_apcb_d[g_detail_idx].apcb001,g_apcb_d[g_detail_idx].apcborga,g_apcb_d[g_detail_idx].apcb002, 
                       g_apcb_d[g_detail_idx].apcb003,g_apcb_d[g_detail_idx].apcb023,g_apcb_d[g_detail_idx].apcb004, 
                       g_apcb_d[g_detail_idx].apcb005,g_apcb_d[g_detail_idx].apcb030,g_apcb_d[g_detail_idx].apcb020, 
                       g_apcb_d[g_detail_idx].apcb006,g_apcb_d[g_detail_idx].apcb022,g_apcb_d[g_detail_idx].apcb007, 
                       g_apcb_d[g_detail_idx].apcb101,g_apcb_d[g_detail_idx].apcb103,g_apcb_d[g_detail_idx].apcb104, 
                       g_apcb_d[g_detail_idx].apcb105,g_apcb_d[g_detail_idx].apcb111,g_apcb_d[g_detail_idx].apcb113, 
                       g_apcb_d[g_detail_idx].apcb114,g_apcb_d[g_detail_idx].apcb115,g_apcb_d[g_detail_idx].apcb028, 
                       g_apcb_d[g_detail_idx].apcb049,g_apcb_d[g_detail_idx].apcb048,g_apcb_d[g_detail_idx].apcb008, 
                       g_apcb_d[g_detail_idx].apcb009,g_apcb_d[g_detail_idx].apcb010,g_apcb_d[g_detail_idx].apcb047, 
                       g_apcb_d[g_detail_idx].apcb021,g_apcb_d[g_detail_idx].apcb029,g_apcb_d[g_detail_idx].apcb017, 
                       g_apcb_d[g_detail_idx].apcb100,g_apcb_d[g_detail_idx].apcb123,g_apcb_d[g_detail_idx].apcb124, 
                       g_apcb_d[g_detail_idx].apcb125,g_apcb_d[g_detail_idx].apcb133,g_apcb_d[g_detail_idx].apcb134, 
                       g_apcb_d[g_detail_idx].apcb135,g_apcb_d[g_detail_idx].apcblegl,g_apcb_d[g_detail_idx].apcb011, 
                       g_apcb_d[g_detail_idx].apcb012,g_apcb_d[g_detail_idx].apcb014,g_apcb_d[g_detail_idx].apcb015, 
                       g_apcb_d[g_detail_idx].apcb016,g_apcb_d[g_detail_idx].apcb024,g_apcb_d[g_detail_idx].apcbsite, 
                       g_apcb_d[g_detail_idx].apcb013,g_apcb_d[g_detail_idx].apcb018,g_apcb_d[g_detail_idx].apcb019, 
                       g_apcb_d[g_detail_idx].apcb106,g_apcb_d[g_detail_idx].apcb108,g_apcb_d[g_detail_idx].apcb051, 
                       g_apcb_d[g_detail_idx].apcb102,g_apcb_d[g_detail_idx].apcb034,g_apcb_d[g_detail_idx].apcb054, 
                       g_apcb_d[g_detail_idx].apcb055,g_apcb_d[g_detail_idx].apcb036,g_apcb_d[g_detail_idx].apcb035, 
                       g_apcb_d[g_detail_idx].apcb037,g_apcb_d[g_detail_idx].apcb038,g_apcb_d[g_detail_idx].apcb039, 
                       g_apcb_d[g_detail_idx].apcb040,g_apcb_d[g_detail_idx].apcb041,g_apcb_d[g_detail_idx].apcb042, 
                       g_apcb_d[g_detail_idx].apcb043,g_apcb_d[g_detail_idx].apcb044,g_apcb_d[g_detail_idx].apcb045, 
                       g_apcb_d[g_detail_idx].apcb046)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
      
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "apcb_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_apcb_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
      #apcb_t欄位預設值
      CALL aapt320_get_apcb1x6(g_detail_idx) RETURNING l_apcb106,l_apcb116,l_apcb126,l_apcb136   #160107-00001#1
      

      #160816-00022#3 --s add
      #入庫數量
      LET l_apcb107 = 0
      IF g_apca_m.apca001 MATCHES '0[12]' THEN
         LET l_pmdt036 = 0
         SELECT pmdt036 INTO l_pmdt036 FROM pmdt_t 
          WHERE pmdtent = g_enterprise
            AND pmdtdocno = g_apcb_d[g_detail_idx].apcb002 
            AND pmdtseq = g_apcb_d[g_detail_idx].apcb003
            
         IF cl_null(l_pmdt036) THEN LET l_pmdt036 = 0 END IF
         LET l_apcb107 = l_pmdt036
      END IF
      
      #160816-00022#3 --e add

      
      UPDATE apcb_t 
         SET (        apcb106,apcb107,apcb108,
                      apcb116,apcb117,apcb118,apcb119, 
              apcb121,apcb126,apcb127,apcb128,
              apcb131,apcb136,apcb137,apcb138)
           #= (                 l_apcb106,   0,apcb103,        #160816-00022#3 mark  
           = (                 l_apcb106,   l_apcb107,apcb103, #160816-00022#3 add 
                               l_apcb116,   0,apcb113,      0,
              g_apca_m.apca121,l_apcb126,   0,apcb123,
              g_apca_m.apca131,l_apcb136,   0,apcb133)
       WHERE apcbent   = g_enterprise AND apcbld =  ps_keys[1]
         AND apcbdocno = ps_keys[2]   AND apcbseq = ps_keys[3]
         
      #170512-00045#10 mark ------
      #在s_aapt300_upd_apcb_fix_acc()就會給了故這邊mark         
      #161102-00015#3 --s add
      #IF cl_null(g_apcb_d[g_detail_idx].apcb010) THEN LET g_apcb_d[g_detail_idx].apcb010 = " " END IF #業務部門
      #IF cl_null(g_apcb_d[g_detail_idx].apcb011) THEN LET g_apcb_d[g_detail_idx].apcb011 = " " END IF #責任中心
      #IF cl_null(g_apcb_d[g_detail_idx].apcb012) THEN LET g_apcb_d[g_detail_idx].apcb012 = " " END IF #產品類別
      #IF cl_null(g_apcb_d[g_detail_idx].apcb015) THEN LET g_apcb_d[g_detail_idx].apcb015 = " " END IF #專案編號
      #IF cl_null(g_apcb_d[g_detail_idx].apcb016) THEN LET g_apcb_d[g_detail_idx].apcb016 = " " END IF #WBS編號
      #IF cl_null(g_apcb_d[g_detail_idx].apcb024) THEN LET g_apcb_d[g_detail_idx].apcb024 = " " END IF #區域
      #IF cl_null(g_apcb_d[g_detail_idx].apcb030) THEN LET g_apcb_d[g_detail_idx].apcb030 = " " END IF #付款條件
      #IF cl_null(g_apcb_d[g_detail_idx].apcb034) THEN LET g_apcb_d[g_detail_idx].apcb034 = " " END IF #通路
      #IF cl_null(g_apcb_d[g_detail_idx].apcb051) THEN LET g_apcb_d[g_detail_idx].apcb051 = " " END IF #業務人員
      #
      ##因畫面上無實體欄位,因此在未異動其他資訊頁簽前,先給上空字串
      #UPDATE apcb_t 
      #   SET (apcb010,apcb011,apcb012,apcb015,apcb016,apcb024,apcb030,apcb033,
      #        apcb034,apcb035,apcb036,apcb037,apcb038,apcb039,apcb040,apcb041,
      #        apcb042,apcb043,apcb044,apcb045,apcb046,apcb051,apcb054,apcb055)
      #     = (g_apcb_d[g_detail_idx].apcb010,g_apcb_d[g_detail_idx].apcb011,g_apcb_d[g_detail_idx].apcb012,g_apcb_d[g_detail_idx].apcb015,g_apcb_d[g_detail_idx].apcb016,g_apcb_d[g_detail_idx].apcb024,g_apcb_d[g_detail_idx].apcb030," ",
      #        g_apcb_d[g_detail_idx].apcb034," "," "," "," "," "," "," ",
      #        " "," "," "," "," ",g_apcb_d[g_detail_idx].apcb051," "," ")
      # WHERE apcbent   = g_enterprise AND apcbld =  ps_keys[1]
      #   AND apcbdocno = ps_keys[2]   AND apcbseq = ps_keys[3]           
      ##161102-00015#3 --e add
      #170512-00045#10 mark end---
      #170512-00045#10 add ------
      #更新經營方式
      UPDATE apcb_t
         SET apcb033 = g_apcb_d[g_detail_idx].l_apcb0332
       WHERE apcbent = g_enterprise
         AND apcbld = ps_keys[1]
         AND apcbdocno = ps_keys[2]
         AND apcbseq = ps_keys[3]
      #170512-00045#10 add end---      
         
      #回寫入庫單立暫估數量
      IF NOT cl_null(g_apcb_d[g_detail_idx].apcb002) AND NOT cl_null(g_apcb_d[g_detail_idx].apcb003) THEN
         CALL s_aapt300_pmdt_upd(g_apca_m.apcald,g_apca_m.apcadocno,ps_keys[3],'=') RETURNING g_sub_success,g_errno
      END IF
      
      #150703-00021#24 ---s--- 修改bgbd_t               
      #檢核新的預算編號是否存在 
      CALL s_aooi200_fin_get_slip(ps_keys[2]) RETURNING g_sub_success,g_ap_slip
      CALL s_fin_get_doc_para(ps_keys[1],g_apca_m.apcacomp,g_ap_slip,'D-FIN-5002') RETURNING g_dfin5002
      IF g_dfin5002 = 'Y' THEN
         #160902-00034#1---s--
         #CALL s_aapt300_bgbd_upd(ps_keys[2],ps_keys[1],ps_keys[3],'','1')
         #    RETURNING g_sub_success,g_errno        #預算額度是否超過
         #IF NOT g_sub_success THEN
         #   INITIALIZE g_errparam TO NULL
         #   LET g_errparam.code = g_errno
         #   LET g_errparam.extend = ''
         #   LET g_errparam.popup = TRUE
         #   CALL cl_err()
         #   CALL s_transaction_end('N','0')
         #   RETURN
         #END IF        
         IF NOT cl_null(g_apcb_d[g_detail_idx].apcb002) AND NOT cl_null(g_apcb_d[g_detail_idx].apcb003) THEN 
            LET l_tran.docno     = g_apca_m.apcadocno
            LET l_tran.ld        = g_apca_m.apcald
            LET l_tran.docdt     = g_apca_m.apcadocdt
            LET l_tran.comp      = g_apca_m.apcacomp
            LET l_tran.seq       = g_apcb_d[g_detail_idx].apcbseq
            LET l_tran.bgbd007   = g_apcb_d[g_detail_idx].apcb017
            LET l_tran.bgbd037   = g_apcb_d[g_detail_idx].apcb002
            LET l_tran.bgbd038   = g_apcb_d[g_detail_idx].apcb003
            LET l_tran.bgbd040   = g_apcb_d[g_detail_idx].apcb004
            LET l_tran.bgbd007_t = '' #修改前的預算細項
            LET l_tran.bgbd037_t = '' #修改前的單號
            LET l_tran.bgbd038_t = '' #修改前的項次
            LET l_tran.bgbd040_t = '' #修改前被占用的金額
            LET l_tran.act       = 'A'                     
            #預算轉移
            LET l_ls_js = util.JSON.stringify(l_tran)                  
            CALL s_abg_tran(l_ls_js) RETURNING g_sub_success,g_errno 
         END IF                       
         #檢核預算滾動檔是否存在
         CALL s_aapt300_bgbd_upd(g_apca_m.apcadocno,g_apca_m.apcald,g_apcb_d[g_detail_idx].apcbseq,'','4')
                   RETURNING g_sub_success,g_errno                                                 
         IF g_sub_success THEN         
         #160902-00034#1---e--           
            CALL s_aapt300_bgbd_upd(ps_keys[2],ps_keys[1],ps_keys[3],'','2')
                RETURNING g_sub_success,g_errno        #預算額度是否超過
            IF NOT g_sub_success THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = g_errno
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               CALL cl_err()
               CALL s_transaction_end('N','0')
               RETURN
            END IF      
            #新增一筆bgbd_t               
            CALL s_aapt300_bgbd_upd(ps_keys[2],ps_keys[1],ps_keys[3],'I','3')
               RETURNING g_sub_success,g_errno
            IF NOT g_sub_success THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code   = g_errno 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()        
               CALL s_transaction_end('N','0') 
               RETURN
            END IF    
         END IF #160902-00034#1 
      END IF               
      #150703-00021#24 ---e---
      #end add-point 
   END IF
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前 name="insert_b.before_insert2"
 
      #end add-point 
      INSERT INTO xrcd_t
                  (xrcdent,
                   xrcdld,xrcddocno,
                   xrcdseq,xrcdseq2,xrcd007
                   ,xrcd002,xrcd003,xrcd006,xrcd005,xrcd102,xrcd103,xrcd104,xrcd105,xrcd113,xrcd114,xrcd115,xrcd123,xrcd124,xrcd125,xrcd133,xrcd134,xrcd135,xrcdorga,xrcd009) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2],ps_keys[3],ps_keys[4],ps_keys[5]
                   ,g_apcb2_d[g_detail_idx].xrcd002,g_apcb2_d[g_detail_idx].xrcd003,g_apcb2_d[g_detail_idx].xrcd006, 
                       g_apcb2_d[g_detail_idx].xrcd005,g_apcb2_d[g_detail_idx].xrcd102,g_apcb2_d[g_detail_idx].xrcd103, 
                       g_apcb2_d[g_detail_idx].xrcd104,g_apcb2_d[g_detail_idx].xrcd105,g_apcb2_d[g_detail_idx].xrcd113, 
                       g_apcb2_d[g_detail_idx].xrcd114,g_apcb2_d[g_detail_idx].xrcd115,g_apcb2_d[g_detail_idx].xrcd123, 
                       g_apcb2_d[g_detail_idx].xrcd124,g_apcb2_d[g_detail_idx].xrcd125,g_apcb2_d[g_detail_idx].xrcd133, 
                       g_apcb2_d[g_detail_idx].xrcd134,g_apcb2_d[g_detail_idx].xrcd135,g_apcb2_d[g_detail_idx].xrcdorga, 
                       g_apcb2_d[g_detail_idx].xrcd009)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert2"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "xrcd_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'2'" THEN 
         CALL g_apcb2_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert2"
 
      #end add-point
   END IF
 
 
   
 
   
   #add-point:insert_b段other name="insert_b.other"
   
   #end add-point     
   
END FUNCTION
 
{</section>}
 
{<section id="aapt320.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION aapt320_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
   #add-point:update_b段define(客製用) name="update_b.define_customerization"
   
   #end add-point   
   DEFINE ps_table         STRING
   DEFINE ps_page          STRING
   DEFINE ps_keys          DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ps_keys_bak      DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group         STRING
   DEFINE li_idx           LIKE type_t.num10 
   DEFINE lb_chk           BOOLEAN
   DEFINE l_new_key        DYNAMIC ARRAY OF STRING
   DEFINE l_old_key        DYNAMIC ARRAY OF STRING
   DEFINE l_field_key      DYNAMIC ARRAY OF STRING
   #add-point:update_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="update_b.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="update_b.pre_function"
   
   #end add-point
   
   LET g_update = TRUE   
   
   #判斷key是否有改變
   LET lb_chk = TRUE
   FOR li_idx = 1 TO ps_keys.getLength()
      IF ps_keys[li_idx] <> ps_keys_bak[li_idx] THEN
         LET lb_chk = FALSE
         EXIT FOR
      END IF
   END FOR
   
   #不需要做處理
   IF lb_chk THEN
      RETURN
   END IF
   
   #判斷是否是同一群組的table
   LET ls_group = "'1',"
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "apcb_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
      
      #end add-point 
      
      #將遮罩欄位還原
      CALL aapt320_apcb_t_mask_restore('restore_mask_o')
               
      UPDATE apcb_t 
         SET (apcbld,apcbdocno,
              apcbseq
              ,apcb001,apcborga,apcb002,apcb003,apcb023,apcb004,apcb005,apcb030,apcb020,apcb006,apcb022,apcb007,apcb101,apcb103,apcb104,apcb105,apcb111,apcb113,apcb114,apcb115,apcb028,apcb049,apcb048,apcb008,apcb009,apcb010,apcb047,apcb021,apcb029,apcb017,apcb100,apcb123,apcb124,apcb125,apcb133,apcb134,apcb135,apcblegl,apcb011,apcb012,apcb014,apcb015,apcb016,apcb024,apcbsite,apcb013,apcb018,apcb019,apcb106,apcb108,apcb051,apcb102,apcb034,apcb054,apcb055,apcb036,apcb035,apcb037,apcb038,apcb039,apcb040,apcb041,apcb042,apcb043,apcb044,apcb045,apcb046) 
              = 
             (ps_keys[1],ps_keys[2],ps_keys[3]
              ,g_apcb_d[g_detail_idx].apcb001,g_apcb_d[g_detail_idx].apcborga,g_apcb_d[g_detail_idx].apcb002, 
                  g_apcb_d[g_detail_idx].apcb003,g_apcb_d[g_detail_idx].apcb023,g_apcb_d[g_detail_idx].apcb004, 
                  g_apcb_d[g_detail_idx].apcb005,g_apcb_d[g_detail_idx].apcb030,g_apcb_d[g_detail_idx].apcb020, 
                  g_apcb_d[g_detail_idx].apcb006,g_apcb_d[g_detail_idx].apcb022,g_apcb_d[g_detail_idx].apcb007, 
                  g_apcb_d[g_detail_idx].apcb101,g_apcb_d[g_detail_idx].apcb103,g_apcb_d[g_detail_idx].apcb104, 
                  g_apcb_d[g_detail_idx].apcb105,g_apcb_d[g_detail_idx].apcb111,g_apcb_d[g_detail_idx].apcb113, 
                  g_apcb_d[g_detail_idx].apcb114,g_apcb_d[g_detail_idx].apcb115,g_apcb_d[g_detail_idx].apcb028, 
                  g_apcb_d[g_detail_idx].apcb049,g_apcb_d[g_detail_idx].apcb048,g_apcb_d[g_detail_idx].apcb008, 
                  g_apcb_d[g_detail_idx].apcb009,g_apcb_d[g_detail_idx].apcb010,g_apcb_d[g_detail_idx].apcb047, 
                  g_apcb_d[g_detail_idx].apcb021,g_apcb_d[g_detail_idx].apcb029,g_apcb_d[g_detail_idx].apcb017, 
                  g_apcb_d[g_detail_idx].apcb100,g_apcb_d[g_detail_idx].apcb123,g_apcb_d[g_detail_idx].apcb124, 
                  g_apcb_d[g_detail_idx].apcb125,g_apcb_d[g_detail_idx].apcb133,g_apcb_d[g_detail_idx].apcb134, 
                  g_apcb_d[g_detail_idx].apcb135,g_apcb_d[g_detail_idx].apcblegl,g_apcb_d[g_detail_idx].apcb011, 
                  g_apcb_d[g_detail_idx].apcb012,g_apcb_d[g_detail_idx].apcb014,g_apcb_d[g_detail_idx].apcb015, 
                  g_apcb_d[g_detail_idx].apcb016,g_apcb_d[g_detail_idx].apcb024,g_apcb_d[g_detail_idx].apcbsite, 
                  g_apcb_d[g_detail_idx].apcb013,g_apcb_d[g_detail_idx].apcb018,g_apcb_d[g_detail_idx].apcb019, 
                  g_apcb_d[g_detail_idx].apcb106,g_apcb_d[g_detail_idx].apcb108,g_apcb_d[g_detail_idx].apcb051, 
                  g_apcb_d[g_detail_idx].apcb102,g_apcb_d[g_detail_idx].apcb034,g_apcb_d[g_detail_idx].apcb054, 
                  g_apcb_d[g_detail_idx].apcb055,g_apcb_d[g_detail_idx].apcb036,g_apcb_d[g_detail_idx].apcb035, 
                  g_apcb_d[g_detail_idx].apcb037,g_apcb_d[g_detail_idx].apcb038,g_apcb_d[g_detail_idx].apcb039, 
                  g_apcb_d[g_detail_idx].apcb040,g_apcb_d[g_detail_idx].apcb041,g_apcb_d[g_detail_idx].apcb042, 
                  g_apcb_d[g_detail_idx].apcb043,g_apcb_d[g_detail_idx].apcb044,g_apcb_d[g_detail_idx].apcb045, 
                  g_apcb_d[g_detail_idx].apcb046) 
         WHERE apcbent = g_enterprise AND apcbld = ps_keys_bak[1] AND apcbdocno = ps_keys_bak[2] AND apcbseq = ps_keys_bak[3]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "apcb_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "apcb_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL aapt320_apcb_t_mask_restore('restore_mask_n')
               
      #add-point:update_b段修改後 name="update_b.after_update"
     
      #end add-point  
   END IF
   
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
   
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "xrcd_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update2"
      
      #end add-point  
      
      #將遮罩欄位還原
      CALL aapt320_xrcd_t_mask_restore('restore_mask_o')
               
      UPDATE xrcd_t 
         SET (xrcdld,xrcddocno,
              xrcdseq,xrcdseq2,xrcd007
              ,xrcd002,xrcd003,xrcd006,xrcd005,xrcd102,xrcd103,xrcd104,xrcd105,xrcd113,xrcd114,xrcd115,xrcd123,xrcd124,xrcd125,xrcd133,xrcd134,xrcd135,xrcdorga,xrcd009) 
              = 
             (ps_keys[1],ps_keys[2],ps_keys[3],ps_keys[4],ps_keys[5]
              ,g_apcb2_d[g_detail_idx].xrcd002,g_apcb2_d[g_detail_idx].xrcd003,g_apcb2_d[g_detail_idx].xrcd006, 
                  g_apcb2_d[g_detail_idx].xrcd005,g_apcb2_d[g_detail_idx].xrcd102,g_apcb2_d[g_detail_idx].xrcd103, 
                  g_apcb2_d[g_detail_idx].xrcd104,g_apcb2_d[g_detail_idx].xrcd105,g_apcb2_d[g_detail_idx].xrcd113, 
                  g_apcb2_d[g_detail_idx].xrcd114,g_apcb2_d[g_detail_idx].xrcd115,g_apcb2_d[g_detail_idx].xrcd123, 
                  g_apcb2_d[g_detail_idx].xrcd124,g_apcb2_d[g_detail_idx].xrcd125,g_apcb2_d[g_detail_idx].xrcd133, 
                  g_apcb2_d[g_detail_idx].xrcd134,g_apcb2_d[g_detail_idx].xrcd135,g_apcb2_d[g_detail_idx].xrcdorga, 
                  g_apcb2_d[g_detail_idx].xrcd009) 
         WHERE xrcdent = g_enterprise AND xrcdld = ps_keys_bak[1] AND xrcddocno = ps_keys_bak[2] AND xrcdseq = ps_keys_bak[3] AND xrcdseq2 = ps_keys_bak[4] AND xrcd007 = ps_keys_bak[5]
      #add-point:update_b段修改中 name="update_b.m_update2"
      
      #end add-point  
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "xrcd_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "xrcd_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
          
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL aapt320_xrcd_t_mask_restore('restore_mask_n')
 
      #add-point:update_b段修改後 name="update_b.after_update2"
      
      #end add-point  
   END IF
 
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
 
 
   
 
   
   #add-point:update_b段other name="update_b.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="aapt320.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION aapt320_key_update_b(ps_keys_bak,ps_table)
   #add-point:update_b段define(客製用) name="key_update_b.define_customerization"
   
   #end add-point
   DEFINE ps_keys_bak       DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ps_table          STRING
   DEFINE l_field_key       DYNAMIC ARRAY OF STRING
   DEFINE l_var_keys_bak    DYNAMIC ARRAY OF STRING
   DEFINE l_new_key         DYNAMIC ARRAY OF STRING
   DEFINE l_old_key         DYNAMIC ARRAY OF STRING
   #add-point:update_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="key_update_b.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="key_update_b.pre_function"
   
   #end add-point
   
 
   
END FUNCTION
 
{</section>}
 
{<section id="aapt320.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION aapt320_key_delete_b(ps_keys_bak,ps_table)
   #add-point:delete_b段define(客製用) name="key_delete_b.define_customerization"
   
   #end add-point
   DEFINE ps_keys_bak       DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ps_table          STRING
   DEFINE l_field_keys      DYNAMIC ARRAY OF STRING
   DEFINE l_var_keys_bak    DYNAMIC ARRAY OF STRING
   DEFINE l_new_key         DYNAMIC ARRAY OF STRING
   DEFINE l_old_key         DYNAMIC ARRAY OF STRING
   #add-point:delete_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="key_delete_b.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="key_delete_b.pre_function"
   
   #end add-point
   
 
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="aapt320.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION aapt320_lock_b(ps_table,ps_page)
   #add-point:lock_b段define(客製用) name="lock_b.define_customerization"
   
   #end add-point   
   DEFINE ps_page     STRING
   DEFINE ps_table    STRING
   DEFINE ls_group    STRING
   #add-point:lock_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="lock_b.define"
 
   #end add-point   
   
   #add-point:Function前置處理  name="lock_b.pre_function"
   
   #end add-point
    
   #先刷新資料
   #CALL aapt320_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "apcb_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN aapt320_bcl USING g_enterprise,
                                       g_apca_m.apcald,g_apca_m.apcadocno,g_apcb_d[g_detail_idx].apcbseq  
                                               
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "aapt320_bcl:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF
                                    
   #鎖定整組table
   #LET ls_group = "'2',"
   #僅鎖定自身table
   LET ls_group = "xrcd_t"
   IF ls_group.getIndexOf(ps_table,1) THEN
   
      OPEN aapt320_bcl2 USING g_enterprise,
                                             g_apca_m.apcald,g_apca_m.apcadocno,g_apcb2_d[g_detail_idx].xrcdseq, 
                                                 g_apcb2_d[g_detail_idx].xrcdseq2,g_apcb2_d[g_detail_idx].xrcd007 
 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "aapt320_bcl2:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF
 
 
   
 
   
   #add-point:lock_b段other name="lock_b.other"
   LET ls_group = "apcb_t"
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN aapt320_bcl3 USING g_enterprise,g_apca_m.apcald,g_apca_m.apcadocno,g_apcb_d[g_detail_idx].apcbseq 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "aapt320_bcl3"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN FALSE
      END IF
   END IF
   #end add-point  
   
   RETURN TRUE
 
END FUNCTION
 
{</section>}
 
{<section id="aapt320.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION aapt320_unlock_b(ps_table,ps_page)
   #add-point:unlock_b段define(客製用) name="unlock_b.define_customerization"
   
   #end add-point  
   DEFINE ps_page     STRING
   DEFINE ps_table    STRING
   DEFINE ls_group    STRING
   #add-point:unlock_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="unlock_b.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="unlock_b.pre_function"
   
   #end add-point
    
   LET ls_group = "'1',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE aapt320_bcl
   END IF
   
   LET ls_group = "'2',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE aapt320_bcl2
   END IF
 
 
   
 
 
   #add-point:unlock_b段other name="unlock_b.other"
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="aapt320.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION aapt320_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("apcadocno,apcald",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("apcald,apcadocno",TRUE)
      CALL cl_set_comp_entry("apcadocdt",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      CALL cl_set_comp_entry("apcasite,apca001,apca004,apcadocdt",TRUE)
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   CALL cl_set_comp_entry("apca100",TRUE)
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="aapt320.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION aapt320_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   DEFINE l_cnt   LIKE type_t.num5
   DEFINE l_dfin0033  LIKE type_t.chr1  #151130-00015#2
   DEFINE l_success   LIKE type_t.chr1  #151130-00015#2
   DEFINE l_slip      LIKE type_t.chr80  #151130-00015#2 
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   CALL cl_set_comp_entry("apca051",FALSE)   #151105-00007#1 add
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("apcald,apcadocno",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      CALL cl_set_comp_entry("apcasite,apca001,apca004",FALSE)
      #end add-point 
   END IF 
   
   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("apcadocno,apcald",FALSE)
   END IF 
 
#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("apcadocdt",FALSE)
      END IF
#  END IF 
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   IF p_cmd = 'u' THEN
      CALL cl_set_comp_entry("apcasite,apca001,apca004",FALSE)
   END IF
   #留置
   CALL cl_set_comp_entry("apca040,apca041,apca042,apca043,apca044,apca045",FALSE)
   #作廢
   CALL cl_set_comp_entry("apca051",FALSE)
   #aapt300/aapt340/aapt320(apca001=01,02) 者:已有單身者不能修改幣別
   #aapt331/aapt341/aapt320(apca001=03,04) 者:開修改幣別,並一併更單身的幣別欄位
   IF NOT cl_null(g_apca_m.apcald) AND NOT cl_null(g_apca_m.apca001) THEN
      SELECT COUNT(*) INTO l_cnt
        FROM apcb_t
       WHERE apcbent = g_enterprise
         AND apcbld  = g_apca_m.apcald AND apcbdocno = g_apca_m.apcadocno
      IF g_apca_m.apca001 MATCHES '0[34]' AND l_cnt > 0 THEN
         CALL cl_set_comp_entry("apca100",FALSE)
      END IF
   END IF    

   #151130-00015#2  -add -str
   IF NOT cl_null(g_apca_m.apcadocno) THEN  
      #获取单别
      CALL s_aooi200_fin_get_slip(g_apca_m.apcadocno) RETURNING l_success,l_slip
      #取得單別設置的"是否直接審核"參數
      CALL s_fin_get_doc_para(g_apca_m.apcald,g_apca_m.apcacomp,l_slip,'D-FIN-0033') RETURNING l_dfin0033
      IF l_dfin0033 = "Y"  THEN 
         CALL cl_set_comp_entry("apcadocdt",TRUE)
    
      END IF          
   END IF 
   #151130-00015#2  -end -str
   
   #170617-00527#1 --s add 修改單據時,如單身有資料時,單頭日期不可異動 (在參數與單別修改日期控卡後,增加此判斷)
   IF p_cmd = 'u' THEN
      LET l_cnt = 0
      SELECT COUNT(apcbseq) INTO l_cnt
        FROM apcb_t
       WHERE apcbent = g_enterprise
         AND apcbld  = g_apca_m.apcald AND apcbdocno = g_apca_m.apcadocno
      IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
      IF l_cnt > 0 THEN
         CALL cl_set_comp_entry("apcadocdt",FALSE)
      END IF
   END IF
   #170617-00527#1 --e add   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="aapt320.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION aapt320_set_entry_b(p_cmd)
   #add-point:set_entry_b段define(客製用) name="set_entry_b.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_entry_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry_b.define"
   DEFINE l_oodb004  LIKE oodb_t.oodb004
   DEFINE l_oodb005  LIKE oodb_t.oodb005
   DEFINE l_oodb006  LIKE oodb_t.oodb006
   DEFINE l_oodb011  LIKE oodb_t.oodb011
   #end add-point     
   
   #add-point:Function前置處理  name="set_entry_b.pre_function"
   
   #end add-point
    
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("",TRUE)
      #add-point:set_entry段欄位控制 name="set_entry_b.field_control"
      
      #end add-point  
   END IF
   
   #add-point:set_entry_b段 name="set_entry_b.set_entry_b"
   CALL cl_set_comp_entry("apcb004,apcb005,apcb006,apcb007,apcb008,apcb020,apcb030,apcb048",TRUE)
   CALL cl_set_comp_entry("apcb101,apcb103,apcb104,apcb105,apcb111,apcb113,apcb114,apcb115",TRUE)  #150128-00005#9     
   #160125-00005#2 ---s---
   CALL s_tax_chk(g_glaa.glaacomp,g_apca_m.apca011)
        RETURNING g_sub_success,l_oodb004,l_oodb005,l_oodb006,l_oodb011
   IF l_oodb011 = '1' THEN
      CALL cl_set_comp_entry('apcb020',FALSE)                     
   END IF
   #160125-00005#2 ---e---
   CALL cl_set_comp_entry("xrcd114",TRUE) #161102-00015#3 add
   #end add-point  
END FUNCTION
 
{</section>}
 
{<section id="aapt320.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION aapt320_set_no_entry_b(p_cmd)
   #add-point:set_no_entry_b段define(客製用) name="set_no_entry_b.define_customerization"
   
   #end add-point    
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry_b.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="set_no_entry_b.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("",FALSE)
      #add-point:set_no_entry_b段欄位控制 name="set_no_entry_b.field_control"
      
      #end add-point 
   END IF 
   
   #add-point:set_no_entry_b段 name="set_no_entry_b.set_no_entry_b"
   #有發票號碼者不可異動資料  
    IF NOT g_apcb_d[l_ac].apcb001 MATCHES '[12]9' THEN
      IF NOT cl_null(g_apcb_d[l_ac].apcb002) OR NOT cl_null(g_apcb_d[l_ac].apcb028) OR NOT cl_null(g_apcb_d[l_ac].apcb049)THEN
         CALL cl_set_comp_entry("apcb004,apcb005,apcb006,apcb007,apcb008,apcb020,apcb030,apcb048",FALSE)
         CALL cl_set_comp_entry("apcb101,apcb103,apcb104,apcb105,apcb111,apcb113,apcb114,apcb115",FALSE)  #150128-00005#9
      END IF
   END IF
   
   #161102-00015#3 --s add 若交易幣別=帳套幣別時, 本幣不可維護
   CALL s_ld_sel_glaa(g_apca_m.apcald,'glaa001') RETURNING g_sub_success,g_glaa.glaa001
   IF g_apca_m.apca100 = g_glaa.glaa001 THEN
      CALL cl_set_comp_entry("apcb111,apcb113,apcb114,apcb115",FALSE) 
      CALL cl_set_comp_entry("xrcd114",FALSE) 
   END IF
   #161102-00015#3 --e add     
   #end add-point     
END FUNCTION
 
{</section>}
 
{<section id="aapt320.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION aapt320_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   CALL cl_set_act_visible("modify,delete,modify_detail", TRUE)
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="aapt320.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION aapt320_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   DEFINE l_ld          LIKE glaa_t.glaald      #160225-00001#1
   DEFINE l_dfin0033    LIKE type_t.chr1        #160225-00001#1
   DEFINE l_slip        LIKE apca_t.apcadocno   #160225-00001#1
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   IF g_apca_m.apcastus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF
   #160225-00001#1--(S)
   IF NOT cl_null(g_apca_m.apcadocno) THEN
      SELECT glaald INTO l_ld FROM glaa_t
       WHERE glaaent = g_enterprise
         AND glaacomp = g_apca_m.apcacomp
         AND glaa014 = 'Y'
      CALL s_aooi200_fin_get_slip(g_apca_m.apcadocno) RETURNING g_sub_success,l_slip
      CALL s_fin_get_doc_para(l_ld,g_apca_m.apcacomp,l_slip,'D-FIN-0033') RETURNING l_dfin0033
      CALL s_fin_date_close_chk('@',g_apca_m.apcacomp,'AAP',g_apca_m.apcadocdt) RETURNING g_sub_success
      IF l_dfin0033 = "N" AND NOT g_sub_success THEN 
         CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
      END IF
   END IF
   #160225-00001#1--(E)
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="aapt320.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION aapt320_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
   
 

   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="aapt320.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION aapt320_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
  
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="aapt320.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION aapt320_default_search()
   #add-point:default_search段define(客製用) name="default_search.define_customerization"
   
   #end add-point  
   DEFINE li_idx     LIKE type_t.num10
   DEFINE li_cnt     LIKE type_t.num10
   DEFINE ls_wc      STRING
   DEFINE la_wc      DYNAMIC ARRAY OF RECORD
          tableid    STRING,
          wc         STRING
          END RECORD
   DEFINE ls_where   STRING
   #add-point:default_search段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="default_search.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="default_search.before"
   
   #end add-point  
   
   LET g_pagestart = 1
   
   IF cl_null(g_order) THEN
      LET g_order = "ASC"
   END IF
   
   IF NOT cl_null(g_argv[01]) THEN
      LET ls_wc = ls_wc, " apcald = '", g_argv[01], "' AND "
   END IF
   
   IF NOT cl_null(g_argv[02]) THEN
      LET ls_wc = ls_wc, " apcadocno = '", g_argv[02], "' AND "
   END IF
 
   
   #add-point:default_search段after sql name="default_search.after_sql"
   
   #end add-point  
   
   IF NOT cl_null(ls_wc) THEN
      LET g_wc = ls_wc.subString(1,ls_wc.getLength()-5)
      LET g_default = TRUE
   ELSE
      #若無外部參數則預設為1=2
      LET g_default = FALSE
      
      #預設查詢條件
      CALL cl_qbe_get_default_qryplan() RETURNING ls_where
      IF NOT cl_null(ls_where) THEN
         CALL util.JSON.parse(ls_where, la_wc)
         INITIALIZE g_wc, g_wc2,g_wc2_table1,g_wc2_extend TO NULL
         INITIALIZE g_wc2_table2 TO NULL
 
 
         FOR li_idx = 1 TO la_wc.getLength()
            CASE
               WHEN la_wc[li_idx].tableid = "apca_t" 
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "apcb_t" 
                  LET g_wc2_table1 = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "xrcd_t" 
                  LET g_wc2_table2 = la_wc[li_idx].wc
 
 
               WHEN la_wc[li_idx].tableid = "EXTENDWC"
                  LET g_wc2_extend = la_wc[li_idx].wc
            END CASE
         END FOR
         IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1) 
            OR NOT cl_null(g_wc2_table2)
 
 
            OR NOT cl_null(g_wc2_extend)
            THEN
            #組合g_wc2
            IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
               LET g_wc2 = g_wc2_table1
            END IF
            IF g_wc2_table2 <> " 1=1" AND NOT cl_null(g_wc2_table2) THEN
               LET g_wc2 = g_wc2 ," AND ", g_wc2_table2
            END IF
 
 
            IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
               LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
            END IF
         
            IF g_wc2.subString(1,5) = " AND " THEN
               LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
            END IF
         END IF
      END IF
    
      IF cl_null(g_wc) AND cl_null(g_wc2) THEN
         LET g_wc = " 1=2"
      END IF
   END IF
   
   #add-point:default_search段結束前 name="default_search.after"
  #LET g_wc =  "apca001 IN (",s_fin_get_scc_gzcb002('8502','3',g_prog) ,")"   #過濾條件
   #end add-point  
 
   IF g_wc.getIndexOf(" 1=2", 1) THEN
      LET g_default = TRUE
   END IF
 
 
END FUNCTION
 
{</section>}
 
{<section id="aapt320.state_change" >}
   #應用 a09 樣板自動產生(Version:22)
#+ 確認碼變更 
PRIVATE FUNCTION aapt320_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   DEFINE l_cnt     LIKE type_t.num5
   DEFINE l_diff    LIKE apcc_t.apcc109
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
   #CALL aapt320_ui_headershow()        #150311--add #顯示最新的資料 #161114-00009#1 mark 在執行前會刷新資料,因此不用重CALL aapt320_ui_headershow
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_apca_m.apcald IS NULL
      OR g_apca_m.apcadocno IS NULL
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN aapt320_cl USING g_enterprise,g_apca_m.apcald,g_apca_m.apcadocno
   IF SQLCA.SQLCODE THEN
      CLOSE aapt320_cl
   #  CALL s_transaction_end('N','0')   #(ver:19)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN aapt320_cl:",SQLERRMESSAGE
      LET g_errparam.code   = SQLCA.SQLCODE
      LET g_errparam.popup = TRUE 
      CALL s_transaction_end('N','0')   #(ver:19)
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE aapt320_master_referesh USING g_apca_m.apcald,g_apca_m.apcadocno INTO g_apca_m.apcasite,g_apca_m.apca003, 
       g_apca_m.apcald,g_apca_m.apcacomp,g_apca_m.apcadocno,g_apca_m.apca001,g_apca_m.apcadocdt,g_apca_m.apca004, 
       g_apca_m.apca005,g_apca_m.apca038,g_apca_m.apca006,g_apca_m.apca057,g_apca_m.apcastus,g_apca_m.apca065, 
       g_apca_m.apca066,g_apca_m.apca008,g_apca_m.apca009,g_apca_m.apca010,g_apca_m.apca060,g_apca_m.apca013, 
       g_apca_m.apca012,g_apca_m.apca011,g_apca_m.apca007,g_apca_m.apca036,g_apca_m.apca035,g_apca_m.apca100, 
       g_apca_m.apca103,g_apca_m.apca104,g_apca_m.apca106,g_apca_m.apca108,g_apca_m.apca101,g_apca_m.apca113, 
       g_apca_m.apca114,g_apca_m.apca116,g_apca_m.apca118,g_apca_m.apca039,g_apca_m.apca056,g_apca_m.apca016, 
       g_apca_m.apca055,g_apca_m.apca018,g_apca_m.apca019,g_apca_m.apca014,g_apca_m.apca054,g_apca_m.apca015, 
       g_apca_m.apca034,g_apca_m.apca033,g_apca_m.apca058,g_apca_m.apca059,g_apca_m.apca063,g_apca_m.apca050, 
       g_apca_m.apca052,g_apca_m.apca017,g_apca_m.apca051,g_apca_m.apca053,g_apca_m.apca025,g_apca_m.apca031, 
       g_apca_m.apca030,g_apca_m.apca026,g_apca_m.apca027,g_apca_m.apca028,g_apca_m.apca029,g_apca_m.apca020, 
       g_apca_m.apca021,g_apca_m.apca022,g_apca_m.apca046,g_apca_m.apca047,g_apca_m.apca048,g_apca_m.apca120, 
       g_apca_m.apca121,g_apca_m.apca130,g_apca_m.apca131,g_apca_m.apca123,g_apca_m.apca133,g_apca_m.apca124, 
       g_apca_m.apca134,g_apca_m.apca126,g_apca_m.apca136,g_apca_m.apca128,g_apca_m.apca138,g_apca_m.apcaownid, 
       g_apca_m.apcaowndp,g_apca_m.apcacrtid,g_apca_m.apcacrtdp,g_apca_m.apcacrtdt,g_apca_m.apcamodid, 
       g_apca_m.apcamoddt,g_apca_m.apcacnfid,g_apca_m.apcacnfdt,g_apca_m.apcasite_desc,g_apca_m.apca003_desc, 
       g_apca_m.apcald_desc,g_apca_m.apca004_desc,g_apca_m.apca005_desc,g_apca_m.apca008_desc,g_apca_m.apca007_desc, 
       g_apca_m.apca055_desc,g_apca_m.apca014_desc,g_apca_m.apca054_desc,g_apca_m.apca015_desc,g_apca_m.apca034_desc, 
       g_apca_m.apca033_desc,g_apca_m.apca058_desc,g_apca_m.apca059_desc,g_apca_m.apca030_desc,g_apca_m.apcaownid_desc, 
       g_apca_m.apcaowndp_desc,g_apca_m.apcacrtid_desc,g_apca_m.apcacrtdp_desc,g_apca_m.apcamodid_desc, 
       g_apca_m.apcacnfid_desc
   
 
   #檢查是否允許此動作
   IF NOT aapt320_action_chk() THEN
      CLOSE aapt320_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_apca_m.apcasite,g_apca_m.apcasite_desc,g_apca_m.apca003,g_apca_m.apca003_desc,g_apca_m.apcald, 
       g_apca_m.apcald_desc,g_apca_m.apcacomp,g_apca_m.apcacomp_desc,g_apca_m.apcadocno,g_apca_m.apca001, 
       g_apca_m.apcadocno_desc,g_apca_m.apcadocdt,g_apca_m.apca004,g_apca_m.apca004_desc,g_apca_m.apca005, 
       g_apca_m.apca005_desc,g_apca_m.apca038,g_apca_m.apca006,g_apca_m.apca057,g_apca_m.apcastus,g_apca_m.apca065, 
       g_apca_m.apca066,g_apca_m.apca008,g_apca_m.apca008_desc,g_apca_m.apca009,g_apca_m.apca010,g_apca_m.apca060, 
       g_apca_m.apca013,g_apca_m.apca012,g_apca_m.apca011,g_apca_m.apca011_desc,g_apca_m.apca007,g_apca_m.apca007_desc, 
       g_apca_m.apca036,g_apca_m.apca036_desc,g_apca_m.apca035,g_apca_m.apca035_desc,g_apca_m.apca100, 
       g_apca_m.apca103,g_apca_m.apca104,g_apca_m.apca106,g_apca_m.fflabel_1,g_apca_m.apca108,g_apca_m.apcc109, 
       g_apca_m.net108,g_apca_m.glaa001,g_apca_m.apca101,g_apca_m.apca113,g_apca_m.apca114,g_apca_m.apca116, 
       g_apca_m.apcc113,g_apca_m.apca118,g_apca_m.apcc119,g_apca_m.net118,g_apca_m.apca0501,g_apca_m.apca039, 
       g_apca_m.apca056,g_apca_m.apca016,g_apca_m.apca055,g_apca_m.apca055_desc,g_apca_m.apca018,g_apca_m.apca019, 
       g_apca_m.apca014,g_apca_m.apca014_desc,g_apca_m.apca054,g_apca_m.apca054_desc,g_apca_m.apca015, 
       g_apca_m.apca015_desc,g_apca_m.apca034,g_apca_m.apca034_desc,g_apca_m.apca033,g_apca_m.apca033_desc, 
       g_apca_m.apca058,g_apca_m.apca058_desc,g_apca_m.apca059,g_apca_m.apca059_desc,g_apca_m.apca063, 
       g_apca_m.apca050,g_apca_m.apca052,g_apca_m.apca017,g_apca_m.partition2,g_apca_m.apca051,g_apca_m.apca051_desc, 
       g_apca_m.apca053,g_apca_m.apca025,g_apca_m.apca031,g_apca_m.apca030,g_apca_m.apca030_desc,g_apca_m.partition3, 
       g_apca_m.apca026,g_apca_m.apca027,g_apca_m.apca028,g_apca_m.apca029,g_apca_m.apca020,g_apca_m.apca021, 
       g_apca_m.apca022,g_apca_m.apca046,g_apca_m.apca0181,g_apca_m.apca047,g_apca_m.apca048,g_apca_m.apca1001, 
       g_apca_m.apca1031,g_apca_m.apca1041,g_apca_m.apca1061,g_apca_m.fflabel_2,g_apca_m.apca1081,g_apca_m.apcc1091, 
       g_apca_m.net1081,g_apca_m.glaa0011,g_apca_m.apca1011,g_apca_m.apca120,g_apca_m.apca121,g_apca_m.apca130, 
       g_apca_m.apca131,g_apca_m.apca1131,g_apca_m.apca123,g_apca_m.apca133,g_apca_m.apca1141,g_apca_m.apca124, 
       g_apca_m.apca134,g_apca_m.apca1161,g_apca_m.apca126,g_apca_m.apca136,g_apca_m.apcc1131,g_apca_m.apcc123, 
       g_apca_m.apcc133,g_apca_m.apca1181,g_apca_m.apca128,g_apca_m.apca138,g_apca_m.apcc1191,g_apca_m.apcc129, 
       g_apca_m.apcc139,g_apca_m.net1181,g_apca_m.net128,g_apca_m.net138,g_apca_m.apcaownid,g_apca_m.apcaownid_desc, 
       g_apca_m.apcaowndp,g_apca_m.apcaowndp_desc,g_apca_m.apcacrtid,g_apca_m.apcacrtid_desc,g_apca_m.apcacrtdp, 
       g_apca_m.apcacrtdp_desc,g_apca_m.apcacrtdt,g_apca_m.apcamodid,g_apca_m.apcamodid_desc,g_apca_m.apcamoddt, 
       g_apca_m.apcacnfid,g_apca_m.apcacnfid_desc,g_apca_m.apcacnfdt,g_apca_m.apcb103_s,g_apca_m.apcb104_s, 
       g_apca_m.apcb105_s,g_apca_m.apcb113_s,g_apca_m.apcb114_s,g_apca_m.apcb115_s
 
   CASE g_apca_m.apcastus
      WHEN "N"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
      WHEN "Y"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
      WHEN "A"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
      WHEN "D"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
      WHEN "R"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
      WHEN "W"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
      WHEN "X"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
      
   END CASE
 
   #add-point:資料刷新後 name="statechange.after_refresh"
   #161114-00009#1 --s mark
   #已於畫面調整欄位型態為FFlabel,因此不會有串聯後為空的問題
   #CALL s_desc_get_account_desc(g_apca_m.apcald,g_apca_m.apca035)RETURNING g_apca_m.apca035_desc           #150616-00026#3
   #CALL s_desc_get_account_desc(g_apca_m.apcald,g_apca_m.apca036)RETURNING g_apca_m.apca036_desc           #150616-00026#3
   #DISPLAY BY NAME g_apca_m.apca035_desc,g_apca_m.apca036_desc   
   #161114-00009#1 --e mark
   #170522-00030#1 add(s)
   IF NOT cl_null(g_apca_m.apca057) THEN
      CALL s_axrt300_xrca_ref('xrca057',g_apca_m.apca004,g_apca_m.apca057,'') RETURNING g_sub_success,g_apca_m.apca004_desc
      IF g_apca_m.apca005 = g_apca_m.apca004 THEN
         LET g_apca_m.apca005_desc = g_apca_m.apca004_desc
      END IF
      DISPLAY BY NAME g_apca_m.apca004_desc,g_apca_m.apca005_desc 
   END IF
   #170522-00030#1 add(e)
   #end add-point
 
   MENU "" ATTRIBUTES (STYLE="popup")
      BEFORE MENU
         HIDE OPTION "approved"
         HIDE OPTION "rejection"
         CASE g_apca_m.apcastus
            
            WHEN "N"
               HIDE OPTION "unconfirmed"
            WHEN "Y"
               HIDE OPTION "confirmed"
            WHEN "A"
               HIDE OPTION "approved"
            WHEN "D"
               HIDE OPTION "withdraw"
            WHEN "R"
               HIDE OPTION "rejection"
            WHEN "W"
               HIDE OPTION "signing"
            WHEN "X"
               HIDE OPTION "invalid"
         END CASE
     
      #add-point:menu前 name="statechange.before_menu"
      CALL cl_set_act_visible("signing,withdraw",FALSE)
      CALL cl_set_act_visible("unconfirmed,invalid,confirmed",TRUE)
      CALL cl_set_act_visible("closed",FALSE)
      
      CASE g_apca_m.apcastus
         WHEN "N"  
            CALL cl_set_act_visible("unconfirmed,hold",FALSE)
            #需提交至BPM時，則顯示「提交」功能並隱藏「確認」功能
            IF cl_bpm_chk() THEN
                CALL cl_set_act_visible("signing",TRUE)
                CALL cl_set_act_visible("confirmed",FALSE)
            END IF
   
         WHEN "R"   #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
            CALL cl_set_act_visible("confirmed,unconfirmed",FALSE)
   
         WHEN "D"   #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
            CALL cl_set_act_visible("confirmed,unconfirmed",FALSE) 
          
         WHEN "X"
            CALL s_transaction_end('N','0')      #150401-00001#13
            RETURN
   
         WHEN "Y"
            CALL cl_set_act_visible("invalid,confirmed",FALSE)
         
         WHEN "W"    #只能顯示抽單;其餘應用功能皆隱藏
             CALL cl_set_act_visible("withdraw",TRUE)  
             CALL cl_set_act_visible("unconfirmed,invalid,confirmed",FALSE)
         
         WHEN "A"     #只能顯示確認; 其餘應用功能皆隱藏
             CALL cl_set_act_visible("confirmed ",TRUE)  
             CALL cl_set_act_visible("unconfirmed,invalid",FALSE)
   
      END CASE
      #end add-point
      
      #應用 a36 樣板自動產生(Version:5)
      #提交
      ON ACTION signing
         IF cl_auth_chk_act("signing") THEN
            IF NOT aapt320_send() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE aapt320_cl
            RETURN
         END IF
    
      #抽單
      ON ACTION withdraw
         IF cl_auth_chk_act("withdraw") THEN
            IF NOT aapt320_draw_out() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE aapt320_cl
            RETURN
         END IF
 
 
 
	  
      ON ACTION unconfirmed
         IF cl_auth_chk_act("unconfirmed") THEN
            LET lc_state = "N"
            #add-point:action控制 name="statechange.unconfirmed"
      
            #end add-point
         END IF
         EXIT MENU
      ON ACTION confirmed
         IF cl_auth_chk_act("confirmed") THEN
            LET lc_state = "Y"
            #add-point:action控制 name="statechange.confirmed"
 
            #end add-point
         END IF
         EXIT MENU
      ON ACTION approved
         IF cl_auth_chk_act("approved") THEN
            LET lc_state = "A"
            #add-point:action控制 name="statechange.approved"
            
            #end add-point
         END IF
         EXIT MENU
      #ON ACTION withdraw
      #   IF cl_auth_chk_act("withdraw") THEN
      #      LET lc_state = "D"
      #      #add-point:action控制 name="statechange.withdraw"
      #      
      #      #end add-point
      #   END IF
      #   EXIT MENU
      ON ACTION rejection
         IF cl_auth_chk_act("rejection") THEN
            LET lc_state = "R"
            #add-point:action控制 name="statechange.rejection"
            
            #end add-point
         END IF
         EXIT MENU
      #ON ACTION signing
      #   IF cl_auth_chk_act("signing") THEN
      #      LET lc_state = "W"
      #      #add-point:action控制 name="statechange.signing"
      #      
      #      #end add-point
      #   END IF
      #   EXIT MENU
      ON ACTION invalid
         IF cl_auth_chk_act("invalid") THEN
            LET lc_state = "X"
            #add-point:action控制 name="statechange.invalid"
 
            #end add-point
         END IF
         EXIT MENU
 
      #add-point:stus控制 name="statechange.more_control"
      
      #end add-point
      
   END MENU
   LET INT_FLAG=FALSE  #(ver.18)
   
   #確認被選取的狀態碼在清單中
   IF (lc_state <> "N" 
      AND lc_state <> "Y"
      AND lc_state <> "A"
      AND lc_state <> "D"
      AND lc_state <> "R"
      AND lc_state <> "W"
      AND lc_state <> "X"
      ) OR 
      g_apca_m.apcastus = lc_state OR cl_null(lc_state) THEN
      CLOSE aapt320_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
   #取消確認
   IF lc_state = 'N' THEN
      CALL cl_set_comp_entry("apca051",TRUE)
      CALL s_aapt300_prepare_declare()
      CALL cl_err_collect_init()
      IF NOT s_aapt300_unconf_chk(g_apca_m.apcald,g_apca_m.apcadocno)  THEN
         CALL s_transaction_end('N','0')     #150401-00001#13
         CALL cl_err_collect_show()   
         RETURN    #一定要RETURN,避免執行後面的UPDATE狀態的程式段
      ELSE
         IF NOT cl_ask_confirm('aim-00110') THEN
            CALL s_transaction_end('N','0')  #150401-00001#13
            CALL cl_err_collect_show()   
            RETURN
         ELSE
            CALL s_transaction_begin()
            IF NOT s_aapt300_unconf_upd(g_apca_m.apcald,g_apca_m.apcadocno) THEN
               CALL s_transaction_end('N','0')   #避免transaction被卡住,所以 rollback 後 再顯示錯誤訊息
               CALL cl_err_collect_show()   
               RETURN
            ELSE
               CALL s_transaction_end('Y','0')
               CALL cl_err_collect_show() 
            END IF
         END IF
      END IF
   END IF
   #確認
   IF lc_state = 'Y' THEN
#      #albireo 150114 MARK---------------------------------------------------s
#      #檢核是否有單身,若無單身自動產生
#      LET l_cnt = 0
#      SELECT count(*) INTO l_cnt
#        FROM apcb_t
#       WHERE apcbent = g_enterprise AND apcbld = g_apca_m.apcald
#         AND apcbdocno = g_apca_m.apcadocno
#      IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
#      #無單身資料無法確認
#      IF l_cnt = 0 THEN
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = "agl-00065"
#         LET g_errparam.extend = ""
#         LET g_errparam.popup = TRUE
#         CALL cl_err()
#         RETURN      
#      END IF   
 
      #s_aapt300_conf_chk已經有做 所以MARK
      #albireo 150114 MARK---------------------------------------------------e
      
      CALL s_aapt300_prepare_declare()
      CALL cl_err_collect_init()
      IF NOT s_aapt300_conf_chk(g_apca_m.apcald,g_apca_m.apcadocno)  THEN
         CALL s_transaction_end('N','0')     #150401-00001#13
         CALL cl_err_collect_show()
         RETURN    #一定要RETURN,避免執行後面的UPDATE狀態的程式段
      ELSE
         IF NOT cl_ask_confirm('aim-00108') THEN
            CALL s_transaction_end('N','0')  #150401-00001#13
            CALL cl_err_collect_show()   
            RETURN
         ELSE
            CALL s_transaction_begin()
            IF NOT s_aapt300_conf_upd(g_apca_m.apcald,g_apca_m.apcadocno) THEN
               CALL s_transaction_end('N','0')   #避免transaction被卡住,所以 rollback 後 再顯示錯誤訊息
               CALL cl_err_collect_show()   
               RETURN
            ELSE
               CALL s_transaction_end('Y','0')
               CALL cl_err_collect_show()
            END IF
         END IF
      END IF
   END IF
   #作廢
   IF lc_state = 'X' THEN
      CALL cl_set_comp_entry("apca051",TRUE)
      CALL s_aapt300_prepare_declare()
      CALL cl_err_collect_init()
      IF NOT s_aapt300_void_chk(g_apca_m.apcald,g_apca_m.apcadocno)  THEN
         CALL s_transaction_end('N','0')     #150401-00001#13
         CALL cl_err_collect_show()   
         RETURN    #一定要RETURN,避免執行後面的UPDATE狀態的程式段
      ELSE
         IF NOT cl_ask_confirm('aim-00109') THEN
            CALL s_transaction_end('N','0')  #150401-00001#13
            CALL cl_err_collect_show()   
            RETURN
         ELSE
            CALL s_transaction_begin()
            #--151105-00007#1 add start--
            INPUT BY NAME g_apca_m.apca051 WITHOUT DEFAULTS
               BEFORE INPUT
                  LET INT_FLAG = 0
               
               ON ACTION controlp INFIELD apca051
                  #作廢
         			INITIALIZE g_qryparam.* TO NULL
                  LET g_qryparam.state = 'i'
         			LET g_qryparam.reqry = FALSE
                  LET g_qryparam.default1 = g_apca_m.apca051       
                  LET g_qryparam.arg1 = "3115"
                  CALL q_oocq002()                           
                  LET g_apca_m.apca051 = g_qryparam.return1     
                  CALL s_desc_get_acc_desc('3115',g_apca_m.apca051) RETURNING g_apca_m.apca051_desc
                  DISPLAY BY NAME g_apca_m.apca051,g_apca_m.apca051_desc            
                  NEXT FIELD apca051   
               
               AFTER FIELD apca051
                  LET g_apca_m.apca051_desc = ' '
                  IF NOT cl_null(g_apca_m.apca051) THEN
                     IF NOT s_azzi650_chk_exist('3115',g_apca_m.apca051) THEN
                        LET g_apca_m.apca051 = g_apca_m_t.apca051
                        CALL s_desc_get_acc_desc('3115',g_apca_m.apca051) RETURNING g_apca_m.apca051_desc
                        DISPLAY BY NAME g_apca_m.apca051_desc
                        NEXT FIELD CURRENT
                     END IF
                  ELSE
                     NEXT FIELD CURRENT 
                  END IF
                  CALL s_desc_get_acc_desc('3115',g_apca_m.apca051) RETURNING g_apca_m.apca051_desc
                  DISPLAY BY NAME g_apca_m.apca051_desc 
            
               AFTER INPUT
                  IF NOT cl_null(g_apca_m.apcald) THEN
                     UPDATE apca_t SET apca051 = g_apca_m.apca051
                      WHERE apcaent   = g_enterprise
                        AND apcald    = g_apca_m.apcald
                        AND apcadocno = g_apca_m.apcadocno
                  END IF
               ON ACTION accept
                  ACCEPT INPUT
           
               ON ACTION cancel
                  LET INT_FLAG = 1
                  LET g_apca_m.apca051 = ''
                  LET g_apca_m.apca051_desc = ''
                  EXIT INPUT 
                
               IF INT_FLAG THEN
                  CALL cl_err_collect_show()   
                  CALL s_transaction_end('N','0') 
                  RETURN
               END IF
            END INPUT
            IF cl_null(g_apca_m.apca051) THEN
               LET lc_state = 'N'
               LET g_apca_m.apcastus = lc_state
               CALL s_transaction_end('N','0') 
               CALL cl_err_collect_show()   
               DISPLAY BY NAME g_apca_m.apca051,g_apca_m.apca051_desc,g_apca_m.apcastus
               RETURN
            END IF
            #--151105-00007#1 add end--
            IF NOT s_aapt300_void_upd(g_apca_m.apcald,g_apca_m.apcadocno) THEN
               CALL s_transaction_end('N','0')   #避免transaction被卡住,所以 rollback 後 再顯示錯誤訊息
               CALL cl_err_collect_show()   
               RETURN
            ELSE
               CALL s_transaction_end('Y','0')
               CALL cl_err_collect_show()
            END IF
         END IF
      END IF    
   END IF
   #end add-point
   
   LET g_apca_m.apcamodid = g_user
   LET g_apca_m.apcamoddt = cl_get_current()
   LET g_apca_m.apcastus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE apca_t 
      SET (apcastus,apcamodid,apcamoddt) 
        = (g_apca_m.apcastus,g_apca_m.apcamodid,g_apca_m.apcamoddt)     
    WHERE apcaent = g_enterprise AND apcald = g_apca_m.apcald
      AND apcadocno = g_apca_m.apcadocno
    
   IF SQLCA.SQLCODE THEN
      #171011-00030 ---start---
      CLOSE aapt320_cl
      CALL s_transaction_end('N','0')
      #171011-00030 --- end ---
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = SQLCA.SQLCODE 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      #170801-00033 ---start---
   #  CLOSE aapt320_cl   #171011-00030 mark
   #  CALL s_transaction_end('N','0')   #171011-00030 mark
      RETURN
      #170801-00033 --- end ---
   ELSE
      CASE lc_state
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
    
      #撈取異動後的資料
      EXECUTE aapt320_master_referesh USING g_apca_m.apcald,g_apca_m.apcadocno INTO g_apca_m.apcasite, 
          g_apca_m.apca003,g_apca_m.apcald,g_apca_m.apcacomp,g_apca_m.apcadocno,g_apca_m.apca001,g_apca_m.apcadocdt, 
          g_apca_m.apca004,g_apca_m.apca005,g_apca_m.apca038,g_apca_m.apca006,g_apca_m.apca057,g_apca_m.apcastus, 
          g_apca_m.apca065,g_apca_m.apca066,g_apca_m.apca008,g_apca_m.apca009,g_apca_m.apca010,g_apca_m.apca060, 
          g_apca_m.apca013,g_apca_m.apca012,g_apca_m.apca011,g_apca_m.apca007,g_apca_m.apca036,g_apca_m.apca035, 
          g_apca_m.apca100,g_apca_m.apca103,g_apca_m.apca104,g_apca_m.apca106,g_apca_m.apca108,g_apca_m.apca101, 
          g_apca_m.apca113,g_apca_m.apca114,g_apca_m.apca116,g_apca_m.apca118,g_apca_m.apca039,g_apca_m.apca056, 
          g_apca_m.apca016,g_apca_m.apca055,g_apca_m.apca018,g_apca_m.apca019,g_apca_m.apca014,g_apca_m.apca054, 
          g_apca_m.apca015,g_apca_m.apca034,g_apca_m.apca033,g_apca_m.apca058,g_apca_m.apca059,g_apca_m.apca063, 
          g_apca_m.apca050,g_apca_m.apca052,g_apca_m.apca017,g_apca_m.apca051,g_apca_m.apca053,g_apca_m.apca025, 
          g_apca_m.apca031,g_apca_m.apca030,g_apca_m.apca026,g_apca_m.apca027,g_apca_m.apca028,g_apca_m.apca029, 
          g_apca_m.apca020,g_apca_m.apca021,g_apca_m.apca022,g_apca_m.apca046,g_apca_m.apca047,g_apca_m.apca048, 
          g_apca_m.apca120,g_apca_m.apca121,g_apca_m.apca130,g_apca_m.apca131,g_apca_m.apca123,g_apca_m.apca133, 
          g_apca_m.apca124,g_apca_m.apca134,g_apca_m.apca126,g_apca_m.apca136,g_apca_m.apca128,g_apca_m.apca138, 
          g_apca_m.apcaownid,g_apca_m.apcaowndp,g_apca_m.apcacrtid,g_apca_m.apcacrtdp,g_apca_m.apcacrtdt, 
          g_apca_m.apcamodid,g_apca_m.apcamoddt,g_apca_m.apcacnfid,g_apca_m.apcacnfdt,g_apca_m.apcasite_desc, 
          g_apca_m.apca003_desc,g_apca_m.apcald_desc,g_apca_m.apca004_desc,g_apca_m.apca005_desc,g_apca_m.apca008_desc, 
          g_apca_m.apca007_desc,g_apca_m.apca055_desc,g_apca_m.apca014_desc,g_apca_m.apca054_desc,g_apca_m.apca015_desc, 
          g_apca_m.apca034_desc,g_apca_m.apca033_desc,g_apca_m.apca058_desc,g_apca_m.apca059_desc,g_apca_m.apca030_desc, 
          g_apca_m.apcaownid_desc,g_apca_m.apcaowndp_desc,g_apca_m.apcacrtid_desc,g_apca_m.apcacrtdp_desc, 
          g_apca_m.apcamodid_desc,g_apca_m.apcacnfid_desc
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_apca_m.apcasite,g_apca_m.apcasite_desc,g_apca_m.apca003,g_apca_m.apca003_desc, 
          g_apca_m.apcald,g_apca_m.apcald_desc,g_apca_m.apcacomp,g_apca_m.apcacomp_desc,g_apca_m.apcadocno, 
          g_apca_m.apca001,g_apca_m.apcadocno_desc,g_apca_m.apcadocdt,g_apca_m.apca004,g_apca_m.apca004_desc, 
          g_apca_m.apca005,g_apca_m.apca005_desc,g_apca_m.apca038,g_apca_m.apca006,g_apca_m.apca057, 
          g_apca_m.apcastus,g_apca_m.apca065,g_apca_m.apca066,g_apca_m.apca008,g_apca_m.apca008_desc, 
          g_apca_m.apca009,g_apca_m.apca010,g_apca_m.apca060,g_apca_m.apca013,g_apca_m.apca012,g_apca_m.apca011, 
          g_apca_m.apca011_desc,g_apca_m.apca007,g_apca_m.apca007_desc,g_apca_m.apca036,g_apca_m.apca036_desc, 
          g_apca_m.apca035,g_apca_m.apca035_desc,g_apca_m.apca100,g_apca_m.apca103,g_apca_m.apca104, 
          g_apca_m.apca106,g_apca_m.fflabel_1,g_apca_m.apca108,g_apca_m.apcc109,g_apca_m.net108,g_apca_m.glaa001, 
          g_apca_m.apca101,g_apca_m.apca113,g_apca_m.apca114,g_apca_m.apca116,g_apca_m.apcc113,g_apca_m.apca118, 
          g_apca_m.apcc119,g_apca_m.net118,g_apca_m.apca0501,g_apca_m.apca039,g_apca_m.apca056,g_apca_m.apca016, 
          g_apca_m.apca055,g_apca_m.apca055_desc,g_apca_m.apca018,g_apca_m.apca019,g_apca_m.apca014, 
          g_apca_m.apca014_desc,g_apca_m.apca054,g_apca_m.apca054_desc,g_apca_m.apca015,g_apca_m.apca015_desc, 
          g_apca_m.apca034,g_apca_m.apca034_desc,g_apca_m.apca033,g_apca_m.apca033_desc,g_apca_m.apca058, 
          g_apca_m.apca058_desc,g_apca_m.apca059,g_apca_m.apca059_desc,g_apca_m.apca063,g_apca_m.apca050, 
          g_apca_m.apca052,g_apca_m.apca017,g_apca_m.partition2,g_apca_m.apca051,g_apca_m.apca051_desc, 
          g_apca_m.apca053,g_apca_m.apca025,g_apca_m.apca031,g_apca_m.apca030,g_apca_m.apca030_desc, 
          g_apca_m.partition3,g_apca_m.apca026,g_apca_m.apca027,g_apca_m.apca028,g_apca_m.apca029,g_apca_m.apca020, 
          g_apca_m.apca021,g_apca_m.apca022,g_apca_m.apca046,g_apca_m.apca0181,g_apca_m.apca047,g_apca_m.apca048, 
          g_apca_m.apca1001,g_apca_m.apca1031,g_apca_m.apca1041,g_apca_m.apca1061,g_apca_m.fflabel_2, 
          g_apca_m.apca1081,g_apca_m.apcc1091,g_apca_m.net1081,g_apca_m.glaa0011,g_apca_m.apca1011,g_apca_m.apca120, 
          g_apca_m.apca121,g_apca_m.apca130,g_apca_m.apca131,g_apca_m.apca1131,g_apca_m.apca123,g_apca_m.apca133, 
          g_apca_m.apca1141,g_apca_m.apca124,g_apca_m.apca134,g_apca_m.apca1161,g_apca_m.apca126,g_apca_m.apca136, 
          g_apca_m.apcc1131,g_apca_m.apcc123,g_apca_m.apcc133,g_apca_m.apca1181,g_apca_m.apca128,g_apca_m.apca138, 
          g_apca_m.apcc1191,g_apca_m.apcc129,g_apca_m.apcc139,g_apca_m.net1181,g_apca_m.net128,g_apca_m.net138, 
          g_apca_m.apcaownid,g_apca_m.apcaownid_desc,g_apca_m.apcaowndp,g_apca_m.apcaowndp_desc,g_apca_m.apcacrtid, 
          g_apca_m.apcacrtid_desc,g_apca_m.apcacrtdp,g_apca_m.apcacrtdp_desc,g_apca_m.apcacrtdt,g_apca_m.apcamodid, 
          g_apca_m.apcamodid_desc,g_apca_m.apcamoddt,g_apca_m.apcacnfid,g_apca_m.apcacnfid_desc,g_apca_m.apcacnfdt, 
          g_apca_m.apcb103_s,g_apca_m.apcb104_s,g_apca_m.apcb105_s,g_apca_m.apcb113_s,g_apca_m.apcb114_s, 
          g_apca_m.apcb115_s
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
   SELECT apcamodid,apcamoddt,apcacnfid,apcacnfdt
     INTO g_apca_m.apcamodid,g_apca_m.apcamoddt,g_apca_m.apcacnfid,g_apca_m.apcacnfdt
     FROM apca_t
    WHERE apcaent = g_enterprise 
      AND apcald = g_apca_m.apcald AND apcadocno = g_apca_m.apcadocno
   DISPLAY BY NAME g_apca_m.apcamodid,g_apca_m.apcamoddt,g_apca_m.apcacnfid,g_apca_m.apcacnfdt
   #170522-00030#1 add(s)
   IF NOT cl_null(g_apca_m.apca057) THEN
      CALL s_axrt300_xrca_ref('xrca057',g_apca_m.apca004,g_apca_m.apca057,'') RETURNING g_sub_success,g_apca_m.apca004_desc
      IF g_apca_m.apca005 = g_apca_m.apca004 THEN
         LET g_apca_m.apca005_desc = g_apca_m.apca004_desc
      END IF
      DISPLAY BY NAME g_apca_m.apca004_desc,g_apca_m.apca005_desc
   END IF
   #170522-00030#1 add(e)
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   #151125-00006#2--s
   IF g_apca_m.apcastus = 'Y' THEN
      CALL s_aapt300_immediately_gen(g_apca_m.apcald,g_apca_m.apcacomp,g_apca_m.apcadocno)
      CALL aapt320_ui_headershow()
   END IF
   #151125-00006#2--e
   #end add-point  
 
   CLOSE aapt320_cl
   CALL s_transaction_end('Y','0')
   
   #(ver:20) ---start---
   #add-point:transaction結束後 name="statechange.transaction_after"
   
   #end add-point  
   #(ver:20) --- end --- 
 
   #功能已完成,通報訊息中心
   CALL aapt320_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="aapt320.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION aapt320_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
   IF g_current_page = 3 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail3")
      IF g_detail_idx > g_apcb3_d.getLength() THEN
         LET g_detail_idx = g_apcb3_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_apcb3_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_apcb3_d.getLength() TO FORMONLY.cnt
   END IF
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   LET g_curr_diag = ui.DIALOG.getCurrent()   #(ver:83)
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_apcb_d.getLength() THEN
         LET g_detail_idx = g_apcb_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_apcb_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_apcb_d.getLength() TO FORMONLY.cnt
   END IF
   
   IF g_current_page = 2 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail2")
      IF g_detail_idx > g_apcb2_d.getLength() THEN
         LET g_detail_idx = g_apcb2_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_apcb2_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_apcb2_d.getLength() TO FORMONLY.cnt
   END IF
 
   
   #add-point:idx_chk段other name="idx_chk.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="aapt320.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION aapt320_b_fill2(pi_idx)
   #add-point:b_fill2段define(客製用) name="b_fill2.define_customerization"
   
   #end add-point
   DEFINE pi_idx                 LIKE type_t.num10
   DEFINE li_ac                  LIKE type_t.num10
   DEFINE li_detail_idx_tmp      LIKE type_t.num10
   DEFINE ls_chk                 LIKE type_t.chr1
   #add-point:b_fill2段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill2.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="b_fill2.pre_function"
   
   #end add-point
   
   LET li_ac = l_ac 
   
   IF g_detail_idx <= 0 THEN
      RETURN
   END IF
   
   LET li_detail_idx_tmp = g_detail_idx
   
 
      
 
      
   #add-point:單身填充後 name="b_fill2.after_fill"
   
   #end add-point
    
   LET l_ac = li_ac
   
   CALL aapt320_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="aapt320.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION aapt320_fill_chk(ps_idx)
   #add-point:fill_chk段define(客製用) name="fill_chk.define_customerization"
   
   #end add-point
   DEFINE ps_idx        LIKE type_t.chr10
   #add-point:fill_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="fill_chk.define"
   
   #end add-point
   
   #add-point:Function前置處理 name="fill_chk.before_chk"
   
   #end add-point
   
   #此funtion功能暫時停用(2015/1/12)
   #無論傳入值為何皆回傳true(代表要填充該單身)
 
   #全部為1=1 or null時回傳true
   IF (cl_null(g_wc2_table1) OR g_wc2_table1.trim() = '1=1')  AND 
      (cl_null(g_wc2_table2) OR g_wc2_table2.trim() = '1=1') THEN
      #add-point:fill_chk段other_chk name="fill_chk.other_chk"
      
      #end add-point
      RETURN TRUE
   END IF
   
   #add-point:fill_chk段after_chk name="fill_chk.after_chk"
   IF ((NOT cl_null(g_wc2_table1) AND g_wc2_table1.trim() <> '1=1')) OR
      ((NOT cl_null(g_wc2_table2) AND g_wc2_table2.trim() <> '1=1')) THEN
      RETURN TRUE
   END IF
   #end add-point
   
   RETURN TRUE
 
END FUNCTION
 
{</section>}
 
{<section id="aapt320.status_show" >}
PRIVATE FUNCTION aapt320_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="aapt320.mask_functions" >}
&include "erp/aap/aapt320_mask.4gl"
 
{</section>}
 
{<section id="aapt320.signature" >}
   #應用 a39 樣板自動產生(Version:10)
#+ BPM提交
PRIVATE FUNCTION aapt320_send()
   #add-point:send段define(客製用) name="send.define_customerization"
   
   #end add-point 
   #add-point:send段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="send.define"
   
   #end add-point 
   
   #add-point:Function前置處理  name="send.pre_function"
   
   #end add-point
   
   #依據單據個數，需要指定所有單身條件為" 1=1"  (單身有幾個就要設幾個)
   LET g_wc2_table1 = " 1=1"
   LET g_wc2_table2 = " 1=1"
 
 
   CALL aapt320_show()
   CALL aapt320_set_pk_array()
   
   #add-point: 初始化的ADP name="send.before_send"
   CALL s_aapt300_prepare_declare()
   IF NOT s_aapt300_conf_chk(g_apca_m.apcald,g_apca_m.apcadocno) THEN
      CLOSE aapt320_cl
      CALL s_transaction_end('N','0')
      RETURN FALSE
   END IF
   #end add-point
   
   #公用變數初始化
   CALL cl_bpm_data_init()
                  
   #依照主檔/單身個數產生 CALL cl_bpm_set_master_data() / cl_bpm_set_detail_data() 
   #單頭固定為 CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(xxxx)) 傳入參數: (1)單頭陣列  ; 回傳值: 無
   CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(g_apca_m))
                              
   #單身固定為 CALL cl_bpm_set_detail_data(s_detailX, util.JSONArray.fromFGL(xxxx)) 傳入參數: (1)單身SR名稱  (2)單身陣列  ; 回傳值: 無
   CALL cl_bpm_set_detail_data("s_detail1", util.JSONArray.fromFGL(g_apcb_d))
   CALL cl_bpm_set_detail_data("s_detail2", util.JSONArray.fromFGL(g_apcb2_d))
 
 
   # cl_bpm_cli() 裡有包含以前的aws_condition()=>送簽資料檢核和更新單據狀況碼為'W'
   # cl_bpm_cli() 傳入參數:無  ;  回傳值: 0 開單失敗; 1 開單成功
 
   #add-point: 提交前的ADP name="send.before_cli"
   
   #end add-point
 
   #開單失敗
   IF NOT cl_bpm_cli() THEN 
      RETURN FALSE
   END IF
 
   #add-point: 提交後的ADP name="send.after_send"
   
   #end add-point
 
   #此段落不需要刪除資料,但是否需要refresh圖片樣式???
   #CALL aapt320_ui_browser_refresh()
 
   #重新指定此筆單據資料狀態圖片=>送簽中
   LET g_browser[g_current_idx].b_statepic = "stus/16/signing.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL aapt320_ui_headershow()
   CALL aapt320_ui_detailshow()
 
   RETURN TRUE
   
END FUNCTION
 
 
 
#應用 a40 樣板自動產生(Version:9)
#+ BPM抽單
PRIVATE FUNCTION aapt320_draw_out()
   #add-point:draw段define name="draw.define_customerization"
   
   #end add-point
   #add-point:draw段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="draw.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="draw.pre_function"
   
   #end add-point
   
   #抽單失敗
   IF NOT cl_bpm_draw_out() THEN 
      RETURN FALSE
   END IF    
          
   #重新指定此筆單據資料狀態圖片=>抽單
   LET g_browser[g_current_idx].b_statepic = "stus/16/draw_out.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL aapt320_ui_headershow()  
   CALL aapt320_ui_detailshow()
 
   #add-point:Function後置處理  name="draw.after_function"
   
   #end add-point
 
   RETURN TRUE
   
END FUNCTION
 
 
 
 
 
{</section>}
 
{<section id="aapt320.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION aapt320_set_pk_array()
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
   LET g_pk_array[1].values = g_apca_m.apcald
   LET g_pk_array[1].column = 'apcald'
   LET g_pk_array[2].values = g_apca_m.apcadocno
   LET g_pk_array[2].column = 'apcadocno'
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="aapt320.other_dialog" readonly="Y" >}
   
 
{</section>}
 
{<section id="aapt320.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION aapt320_msgcentre_notify(lc_state)
   #add-point:msgcentre_notify段define name="msgcentre_notify.define_customerization"
   
   #end add-point   
   DEFINE lc_state LIKE type_t.chr80
   #add-point:msgcentre_notify段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="msgcentre_notify.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="msgcentre_notify.pre_function"
   
   #end add-point
   
   INITIALIZE g_msgparam TO NULL
 
   #action-id與狀態填寫
   LET g_msgparam.state = lc_state
 
   #PK資料填寫
   CALL aapt320_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_apca_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="aapt320.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION aapt320_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="aapt320.other_function" readonly="Y" >}

################################################################################
# Descriptions...: 設定本位幣單頭金額
# Memo...........:
# Usage..........: CALL aapt320_curr_info_master()
# Input parameter: void
# Return code....: void
# Date & Author..: 14/04/08 By Belle
# Modify.........:
################################################################################
PRIVATE FUNCTION aapt320_curr_info_master()
  
   CALL s_aapt300_curr_info_master(g_apca_m.apcald,g_apca_m.apcadocno) 
         RETURNING g_apca_m.apca103,g_apca_m.apca104,g_apca_m.apca106,g_apca_m.apca108,g_apca_m.apcc109,g_apca_m.net108 ,
                   g_apca_m.apca113,g_apca_m.apca114,g_apca_m.apca116,g_apca_m.apca118,g_apca_m.apcc119,g_apca_m.net1181,g_apca_m.apcc113,
                   g_apca_m.apca123,g_apca_m.apca124,g_apca_m.apca126,g_apca_m.apca128,g_apca_m.apcc129,g_apca_m.net128,g_apca_m.apcc123,
                   g_apca_m.apca133,g_apca_m.apca134,g_apca_m.apca136,g_apca_m.apca138,g_apca_m.apcc139,g_apca_m.net138,g_apca_m.apcc133,
                   g_apca_m.apca1031,g_apca_m.apca1041,g_apca_m.apca1061,g_apca_m.apca1081,g_apca_m.apcc1091,g_apca_m.net1081,
                   g_apca_m.apca1131,g_apca_m.apca1141,g_apca_m.apca1161,g_apca_m.apca1181,g_apca_m.apcc1191,g_apca_m.net118,g_apca_m.apcc1131
      
   DISPLAY BY NAME g_apca_m.apca103,g_apca_m.apca104,g_apca_m.apca106,g_apca_m.apca108,g_apca_m.apcc109,g_apca_m.net108 ,
                   g_apca_m.apca113,g_apca_m.apca114,g_apca_m.apca116,g_apca_m.apca118,g_apca_m.apcc119,g_apca_m.net1181,g_apca_m.apcc113,
                   g_apca_m.apca123,g_apca_m.apca124,g_apca_m.apca126,g_apca_m.apca128,g_apca_m.apcc129,g_apca_m.net128,g_apca_m.apcc123,
                   g_apca_m.apca133,g_apca_m.apca134,g_apca_m.apca136,g_apca_m.apca138,g_apca_m.apcc139,g_apca_m.net138,g_apca_m.apcc133,
                   g_apca_m.apca1031,g_apca_m.apca1041,g_apca_m.apca1061,g_apca_m.apca1081,g_apca_m.apcc1091,g_apca_m.net1081,
                   g_apca_m.apca1131,g_apca_m.apca1141,g_apca_m.apca1161,g_apca_m.apca1181,g_apca_m.apcc1191,g_apca_m.net118,g_apca_m.apcc1131
       
           
END FUNCTION

################################################################################
# Descriptions...: 檢查帳別權限及設定取得帳別後的預設資料
# Memo...........:
# Usage..........: CALL aapt320_set_ld_info(p_ld,p_stus)
# Date & Author..: 2014/03/12 By Belle
# Modify.........:
################################################################################
PRIVATE FUNCTION aapt320_set_ld_info(p_ld,p_stus)
DEFINE p_ld       LIKE apca_t.apcald
DEFINE p_stus     LIKE type_t.chr1
DEFINE l_gzzd005  LIKE gzzd_t.gzzd005
DEFINE l_using    LIKE type_t.num5
DEFINE l_i        LIKE type_t.num5
DEFINE l_str      LIKE type_t.chr100
DEFINE l_sql      STRING
DEFINE l_title    DYNAMIC ARRAY OF RECORD        
         curr1    LIKE type_t.chr100,
         curr2    LIKE type_t.chr100,
         curr3    LIKE type_t.chr100
              END RECORD 
DEFINE l_oodb004     LIKE oodb_t.oodb004
DEFINE l_oodb011     LIKE oodb_t.oodb011
DEFINE l_isai002     LIKE isai_t.isai002
DEFINE l_cnt         LIKE type_t.num5        #160107-00001#1

   IF cl_null(p_ld) THEN 
      #RETURN g_glaa.glaacomp   #albireo 151105 mark
      RETURN                    #albireo 151105 add
   END IF
   CALL s_ld_sel_glaa(p_ld,'glaacomp|glaa001|glaa004|glaa015|glaa016|glaa017|glaa019|glaa020|glaa021|glaa024|glaa120|glaa121|glaa025|glaa018|glaa022')
        RETURNING g_sub_success,g_glaa.glaacomp,g_glaa.glaa001,g_glaa.glaa004,g_glaa.glaa015,g_glaa.glaa016,
                                g_glaa.glaa017,g_glaa.glaa019,g_glaa.glaa020,g_glaa.glaa021,g_glaa.glaa024,
                                g_glaa.glaa120,g_glaa.glaa121,g_glaa.glaa025,g_glaa.glaa018,g_glaa.glaa022
   LET g_apca_m.apca120 = g_glaa.glaa016
   LET g_apca_m.apca130 = g_glaa.glaa020
   LET g_apca_m.glaa001 = g_glaa.glaa001
   LET g_apca_m.glaa0011 =g_glaa.glaa001   
   DISPLAY BY NAME g_apca_m.glaa001,g_apca_m.glaa0011,g_apca_m.apca120,g_apca_m.apca130
   #160107-00001#1--(S)
   LET g_xcat005 = 'N'
   IF NOT cl_null(g_glaa.glaa120) THEN
      #以帳套檢核, 該帳套是否有啟用"標準成本"處理，取agli010的設置成本計算類型glaa120，若在axci100的計價方式值為1.標準成本
      SELECT count(*) INTO l_cnt
        FROM xcat_t
       WHERE xcatent = g_enterprise AND xcat005 ='1'
         AND xcat001 = g_glaa.glaa120
      IF l_cnt > 0 THEN LET g_xcat005 = 'Y' END IF
   END IF   
   #160107-00001#1--(E)
   #取得法人據點資訊
   CALL cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-3010') RETURNING g_sfin3010 #稅
   CALL cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-3012') RETURNING g_sfin3012 
      
   #取得帳務組織下所屬成員
   IF cl_null(p_stus) THEN
      CALL s_fin_account_center_sons_query('3',g_apca_m.apcasite,g_apca_m.apcadocdt,'1')
      CALL s_fin_account_center_sons_str() RETURNING g_wc_apcasite
      CALL s_fin_get_wc_str(g_wc_apcasite) RETURNING g_wc_apcasite
      CALL s_fin_account_center_ld_str() RETURNING g_wc_apcald
      CALL s_fin_get_wc_str(g_wc_apcald) RETURNING g_wc_apcald
   END IF
   #取得該法人的稅區
   SELECT ooef019 INTO g_ooef019
     FROM ooef_t
    WHERE ooefent = g_enterprise AND ooef001 = g_glaa.glaacomp
   SELECT isai002 INTO l_isai002
     FROM isai_t
    WHERE isaient = g_enterprise AND isai001 = g_ooef019
   IF l_isai002 = "1" THEN
      CALL cl_set_comp_visible('apca065,isam009',FALSE)
   ELSE
      CALL cl_set_comp_visible('apca065,isam009',TRUE)
   END IF
   #設定欄位名稱
   LET l_title[1].curr1 = 'apcb1131'   LET l_title[2].curr1 = 'apcb1141'   LET l_title[3].curr1 = 'apcb1151'
   LET l_title[1].curr2 = 'apcb1231'   LET l_title[2].curr2 = 'apcb1241'   LET l_title[3].curr2 = 'apcb1251'
   LET l_title[1].curr3 = 'apcb1331'   LET l_title[2].curr3 = 'apcb1341'   LET l_title[3].curr3 = 'apcb1351'
   LET l_sql = "SELECT gzzd005 FROM gzzd_t",
               " WHERE gzzd001 = ? AND gzzd002 = '",g_lang,"'",
               "   AND gzzd003 = ? AND gzzdstus = 'Y'"
   PREPARE get_title_pre FROM l_sql
     
   #本幣處理===(S)===
   #單身幣別名稱設定(azzi902要設定)
   FOR l_i = 1 TO l_title.getLength()
       LET l_str = "lbl_",l_title[l_i].curr1
       EXECUTE get_title_pre USING g_prog,l_str INTO l_gzzd005
       LET l_str = l_gzzd005,"(",g_apca_m.glaa001,")"
       CALL cl_set_comp_att_text(l_title[l_i].curr1,l_str)
   END FOR
   #本幣處理===(E)===
   IF g_glaa.glaa015 = 'N' AND  g_glaa.glaa019 = 'N' THEN
      CALL cl_set_comp_visible('page7,bpage2,xrcd124,xrcd134',FALSE)    #本位幣頁籤隱藏
      CALL cl_set_comp_required('apca121,apca131',FALSE)
   ELSE
      CALL cl_set_comp_visible('page7,bpage2',TRUE)     #本位幣頁籤顯示
      #本幣二處理===(S)===
      IF g_glaa.glaa015 = 'Y' THEN LET l_using = TRUE ELSE LET l_using = FALSE END IF
      CALL cl_set_comp_visible('apca120,apca121,apca123,apca124,apca126,apca128,apcc123,apcc129,net128',l_using)
      CALL cl_set_comp_visible('apcb1231,apcb1241,apcb1251,xrcd124',l_using)
      CALL cl_set_comp_required('apca121',l_using)
      IF g_glaa.glaa015 = 'Y' THEN
         FOR l_i = 1 TO l_title.getLength()
             LET l_str = "lbl_",l_title[l_i].curr2
             EXECUTE get_title_pre USING g_prog,l_str INTO l_gzzd005
             LET l_str = l_gzzd005,"(",g_apca_m.apca120,")"
             CALL cl_set_comp_att_text(l_title[l_i].curr2,l_str)
         END FOR
      END IF
      #本幣二處理===(E)===
      
      #本幣三處理===(S)===
      LET l_using = TRUE
      IF g_glaa.glaa019 = 'Y' THEN LET l_using = TRUE ELSE LET l_using = FALSE END IF
      CALL cl_set_comp_visible('apca130,apca131,apca133,apca134,apca136,apca138,apcc133,apcc139,net138',l_using)
      CALL cl_set_comp_visible('apcb1331,apcb1341,apcb1351,xrcd134',l_using)
      CALL cl_set_comp_required('apca131',l_using)
      IF g_glaa.glaa019 = 'Y' THEN
         FOR l_i = 1 TO l_title.getLength()
             LET l_str = "lbl_",l_title[l_i].curr3
             EXECUTE get_title_pre USING g_prog,l_str INTO l_gzzd005
             LET l_str = l_gzzd005,"(",g_apca_m.apca130,")"
             CALL cl_set_comp_att_text(l_title[l_i].curr3,l_str)
         END FOR
      END IF
      #本幣三處理===(E)===
   END IF
   IF NOT cl_null(g_glaa.glaacomp) THEN 
      CALL cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-2002') RETURNING g_sfin2002
      CALL cl_set_comp_visible('apcb020,apcb020_desc,apcb030',TRUE)
      IF g_sfin2002 MATCHES '[12]' THEN
         #CALL cl_set_comp_visible('apcb020,apcb020_desc,apcb030',FALSE) #160125-00005#2
         CALL cl_set_comp_visible('apcb030',FALSE)                       #160125-00005#2
      END IF
   END IF
   #是否啟用分錄底稿
   IF g_glaa.glaa121 = 'Y' THEN
      CALL cl_set_toolbaritem_visible("open_pre", TRUE)
   ELSE
      CALL cl_set_toolbaritem_visible("open_pre", FALSE)
   END IF
   CALL aapt320_apca016_item_change()
   LET gc_paramtax.apcacomp= g_glaa.glaacomp
   LET gc_paramtax.ooef019 = g_ooef019
   
   LET g_apca_m.apcacomp = g_glaa.glaacomp
   CALL s_fin_get_wc_str(g_apca_m.apcacomp) RETURNING g_comp_str  #161229-00047#43 add 
   CALL s_control_get_supplier_sql_pmab('4',g_site,g_user,g_dept,'',g_comp_str) RETURNING g_sub_success,g_sql_ctrl         #161229-00047#43 add 
   #CALL s_control_get_supplier_sql_pmab('4',g_site,g_user,g_dept,'',g_apca_m.apcacomp) RETURNING g_sub_success,g_sql_ctrl #161111-00042#2 add  #161229-00047#43 mark
END FUNCTION

################################################################################
# Descriptions...: 依據含稅否決定開啟欄位
# Usage..........: CALL aapt320_set_entry_apcb020(p_oodb005)
# Input parameter: p_oodb005      含稅否
# Date & Author..: 14/05/12 By Bell
# Modify.........:
################################################################################
PRIVATE FUNCTION aapt320_set_entry_apcb020(p_oodb005)
DEFINE p_oodb005 LIKE oodb_t.oodb005
#0204--(s)
DEFINE l_ooef019         LIKE ooef_t.ooef019
DEFINE l_oodbl004        LIKE oodbl_t.oodbl004
DEFINE l_oodb005         LIKE oodb_t.oodb005
DEFINE l_oodb006         LIKE oodb_t.oodb006
DEFINE l_oodb011         LIKE oodb_t.oodb011
DEFINE l_oodb004         LIKE oodb_t.oodb004
#0204--(e)

   #150128-00005#9 ---(s)---
   #CALL cl_set_comp_entry("apcb103,apcb113,apcb105,apcb115",FALSE)
   #IF p_oodb005 = 'Y' THEN
   #   CALL cl_set_comp_entry("apcb105,apcb115",TRUE)
   #ELSE
   #   CALL cl_set_comp_entry("apcb103,apcb113",TRUE)
   #END IF
   #150128-00005#9 ---(e)---
   
   #150128-00005#9 ---(s)---
   CALL s_tax_get_ooef019(g_glaa.glaacomp) RETURNING g_sub_success,l_ooef019
   #直接取單頭稅別,由於aapt300單身與單頭稅別一定相同且不開放維護
   CALL s_tax_chk(g_glaa.glaacomp,g_apca_m.apca011)
      RETURNING g_sub_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
   
    SELECT oodb004 INTO l_oodb004 FROM oodb_t
     WHERE oodb002  = g_apcb_d[l_ac].apcb020
       AND oodb001  = l_ooef019
       AND oodbent  = g_enterprise
   
   CALL cl_set_comp_entry('apcb103,apcb104,apcb105,apcb113,apcb114,apcb115',TRUE)
   
   IF l_oodb004 = '2' THEN
      #複合稅:未稅不可錄入稅額、含稅金額;含稅不可錄入稅額、未稅金額
      IF l_oodb005 = 'Y' THEN
         CALL cl_set_comp_entry('apcb103,apcb104,apcb113,apcb114',FALSE)
      ELSE
         CALL cl_set_comp_entry('apcb104,apcb105,apcb114,apcb115',FALSE)
      END IF
   END IF
   CALL aapt320_set_no_entry_b('')
   #150128-00005#9 ---(e)---    
   
END FUNCTION

################################################################################
# Descriptions...: 依據來源單據設定單頭
# Memo...........:
# Usage..........: 
# Date & Author..: 14/09/16 By Belle
# Modify.........:
################################################################################
PRIVATE FUNCTION aapt320_set_default_m(p_source)
DEFINE  p_source     DYNAMIC ARRAY OF RECORD
              chr    LIKE type_t.chr500,
              dat    LIKE type_t.dat
                 END RECORD
DEFINE l_oodb004     LIKE oodb_t.oodb004
DEFINE l_oodb011     LIKE oodb_t.oodb011

   #付款條件
   CALL s_aap_ooib002_chk(p_source[2].chr,'1')RETURNING g_sub_success,g_errno
   IF g_sub_success THEN
      LET g_apca_m.apca008 = p_source[2].chr
      CALL s_desc_get_ooib002_desc(g_apca_m.apca008) RETURNING g_apca_m.apca008_desc
      
      SELECT ooib025,ooib005 INTO g_apca_m.apca054,g_apca_m.apca055  #多帳期/繳款優惠設定
        FROM ooib_t
       WHERE ooibent = g_enterprise AND ooib002 = g_apca_m.apca008
      IF NOT cl_null(g_apca_m.apca054) THEN                      #170223-00020#1 add 
         IF NOT s_azzi650_chk_exist('3114',g_apca_m.apca054) THEN LET g_apca_m.apca054 = '' END IF
      END IF                                                     #170223-00020#1 add   
      CALL s_aap_ooid001_chk(g_apca_m.apca055) RETURNING g_sub_success,g_errno
      IF NOT g_sub_success THEN LET g_apca_m.apca055 = '' END IF
      CALL s_desc_get_acc_desc('3114',g_apca_m.apca054) RETURNING g_apca_m.apca054_desc
      CALL s_desc_ooid001_desc(g_apca_m.apca055)        RETURNING g_apca_m.apca055_desc
      DISPLAY BY NAME g_apca_m.apca008,g_apca_m.apca008_desc,g_apca_m.apca054_desc,g_apca_m.apca055_desc
   END IF
  ##稅別(t320不以來源單據稅別作立帳
  #CALL s_tax_chk(g_apca_m.apcacomp,p_source[3].chr) RETURNING g_sub_success,l_oodb004,g_apca_m.apca013,g_apca_m.apca012,l_oodb011
  #IF g_sub_success THEN
  #   LET g_apca_m.apca011 = p_source[3].chr
  #   LET g_apca_m.apca012 = p_source[4].chr
  #   LET g_apca_m.apca013 = p_source[5].chr
  #   DISPLAY BY NAME g_apca_m.apca011,g_apca_m.apca012,g_apca_m.apca013
  #END IF
   LET g_errno = ''
   CALL s_employee_chk(p_source[6].chr) RETURNING g_sub_success
   IF NOT g_sub_success THEN
      LET g_apca_m.apca014 = p_source[6].chr    #人員
   END IF
   LET g_errno = ''
   CALL s_department_chk(p_source[7].chr,g_apca_m.apcadocdt) RETURNING g_sub_success
   IF NOT g_sub_success THEN
      LET g_apca_m.apca015 = p_source[7].chr    #部門
   END IF
   IF NOT cl_null(p_source[7].chr) THEN      #責任中心
      CALL s_department_get_respon_center(g_apca_m.apca015,g_apca_m.apcadocdt)
           RETURNING g_sub_success,g_errno,g_apca_m.apca034,g_apca_m.apca034_desc
      IF NOT g_sub_success THEN
         LET g_apca_m.apca034      = g_apca_m.apca015
         LET g_apca_m.apca034_desc = g_apca_m.apca015_desc
      END IF
   END IF
   CALL s_desc_get_person_desc(g_apca_m.apca014) RETURNING g_apca_m.apca014_desc
   CALL s_desc_get_department_desc(g_apca_m.apca015) RETURNING g_apca_m.apca015_desc
   LET g_apca_m.apca020 = p_source[8].chr    #信用狀付款
   LET g_apca_m.apca022 = p_source[9].chr    #進口報單
   LET g_apca_m.apca100 = p_source[15].chr   #幣別
   DISPLAY BY NAME g_apca_m.apca014,g_apca_m.apca014_desc,g_apca_m.apca015,g_apca_m.apca015_desc,
                   g_apca_m.apca020,g_apca_m.apca022,g_apca_m.apca100
END FUNCTION

################################################################################
# Descriptions...: 單身預設值
# Usage..........: 
# Input parameter: 
# Date & Author..: 14/05/12 By Belle
# Modify.........:
################################################################################
PRIVATE FUNCTION aapt320_set_default_b(p_ac)
DEFINE p_ac       LIKE type_t.num5
#DEFINE l_apcb     RECORD LIKE apcb_t.*#161104-00024#3 mark
#161104-00024#3-add(s)
DEFINE l_apcb    RECORD  #應付憑單單身
       apcbent     LIKE apcb_t.apcbent, #企業編號
       apcbld      LIKE apcb_t.apcbld, #帳套
       apcblegl    LIKE apcb_t.apcblegl, #核算組織
       apcborga    LIKE apcb_t.apcborga, #帳務歸屬組織(來源組織)
       apcbsite    LIKE apcb_t.apcbsite, #應付帳務組織
       apcbdocno   LIKE apcb_t.apcbdocno, #單號
       apcbseq     LIKE apcb_t.apcbseq, #項次
       apcb001     LIKE apcb_t.apcb001, #來源類型
       apcb002     LIKE apcb_t.apcb002, #來源業務單據號碼
       apcb003     LIKE apcb_t.apcb003, #來源業務單據項次
       apcb004     LIKE apcb_t.apcb004, #產品編號
       apcb005     LIKE apcb_t.apcb005, #品名規格
       apcb006     LIKE apcb_t.apcb006, #單位
       apcb007     LIKE apcb_t.apcb007, #計價數量
       apcb008     LIKE apcb_t.apcb008, #參考單據號碼
       apcb009     LIKE apcb_t.apcb009, #參考單據項次
       apcb010     LIKE apcb_t.apcb010, #業務部門
       apcb011     LIKE apcb_t.apcb011, #責任中心
       apcb012     LIKE apcb_t.apcb012, #產品類別
       apcb013     LIKE apcb_t.apcb013, #搭贈
       apcb014     LIKE apcb_t.apcb014, #理由碼
       apcb015     LIKE apcb_t.apcb015, #專案編號
       apcb016     LIKE apcb_t.apcb016, #WBS編號
       apcb017     LIKE apcb_t.apcb017, #預算細項
       apcb018     LIKE apcb_t.apcb018, #专柜编号
       apcb019     LIKE apcb_t.apcb019, #開票性質
       apcb020     LIKE apcb_t.apcb020, #稅別
       apcb021     LIKE apcb_t.apcb021, #費用會計科目
       apcb022     LIKE apcb_t.apcb022, #正負值
       apcb023     LIKE apcb_t.apcb023, #沖暫估單否
       apcb024     LIKE apcb_t.apcb024, #區域
       apcb025     LIKE apcb_t.apcb025, #傳票號碼
       apcb026     LIKE apcb_t.apcb026, #傳票項次
       apcb027     LIKE apcb_t.apcb027, #發票代碼
       apcb028     LIKE apcb_t.apcb028, #發票號碼
       apcb029     LIKE apcb_t.apcb029, #應付帳款科目
       apcb030     LIKE apcb_t.apcb030, #付款條件
       apcb032     LIKE apcb_t.apcb032, #訂金序次
       apcb033     LIKE apcb_t.apcb033, #經營方式
       apcb034     LIKE apcb_t.apcb034, #通路
       apcb035     LIKE apcb_t.apcb035, #品牌
       apcb036     LIKE apcb_t.apcb036, #客群
       apcb037     LIKE apcb_t.apcb037, #自由核算項一
       apcb038     LIKE apcb_t.apcb038, #自由核算項二
       apcb039     LIKE apcb_t.apcb039, #自由核算項三
       apcb040     LIKE apcb_t.apcb040, #自由核算項四
       apcb041     LIKE apcb_t.apcb041, #自由核算項五
       apcb042     LIKE apcb_t.apcb042, #自由核算項六
       apcb043     LIKE apcb_t.apcb043, #自由核算項七
       apcb044     LIKE apcb_t.apcb044, #自由核算項八
       apcb045     LIKE apcb_t.apcb045, #自由核算項九
       apcb046     LIKE apcb_t.apcb046, #自由核算項十
       apcb047     LIKE apcb_t.apcb047, #摘要
       apcb048     LIKE apcb_t.apcb048, #來源訂購單號
       apcb049     LIKE apcb_t.apcb049, #開票單號
       apcb050     LIKE apcb_t.apcb050, #開票項次
       apcb051     LIKE apcb_t.apcb051, #業務人員
       apcb100     LIKE apcb_t.apcb100, #交易原幣
       apcb101     LIKE apcb_t.apcb101, #交易原幣單價
       apcb102     LIKE apcb_t.apcb102, #原幣匯率
       apcb103     LIKE apcb_t.apcb103, #交易原幣未稅金額
       apcb104     LIKE apcb_t.apcb104, #交易原幣稅額
       apcb105     LIKE apcb_t.apcb105, #交易原幣含稅金額
       apcb106     LIKE apcb_t.apcb106, #交易幣標準成本金額
       apcb107     LIKE apcb_t.apcb107, #NO USE
       apcb108     LIKE apcb_t.apcb108, #交易原幣成本認列金額
       apcb111     LIKE apcb_t.apcb111, #本幣單價
       apcb113     LIKE apcb_t.apcb113, #本幣未稅金額
       apcb114     LIKE apcb_t.apcb114, #本幣稅額
       apcb115     LIKE apcb_t.apcb115, #本幣含稅金額
       apcb116     LIKE apcb_t.apcb116, #本幣標準成本金額
       apcb117     LIKE apcb_t.apcb117, #NO USE
       apcb118     LIKE apcb_t.apcb118, #本幣成本認列金額
       apcb119     LIKE apcb_t.apcb119, #應開發票含稅金額
       apcb121     LIKE apcb_t.apcb121, #本位幣二匯率
       apcb123     LIKE apcb_t.apcb123, #本位幣二未稅金額
       apcb124     LIKE apcb_t.apcb124, #本位幣二稅額
       apcb125     LIKE apcb_t.apcb125, #本位幣二含稅金額
       apcb126     LIKE apcb_t.apcb126, #本幣二標準成本金額
       apcb127     LIKE apcb_t.apcb127, #NO USE
       apcb128     LIKE apcb_t.apcb128, #本位幣二成本認列金額
       apcb131     LIKE apcb_t.apcb131, #本位幣三匯率
       apcb133     LIKE apcb_t.apcb133, #本位幣三未稅金額
       apcb134     LIKE apcb_t.apcb134, #本位幣三稅額
       apcb135     LIKE apcb_t.apcb135, #本位幣三含稅金額
       apcb136     LIKE apcb_t.apcb136, #本幣三標準成本金額
       apcb137     LIKE apcb_t.apcb137, #NO USE
       apcb138     LIKE apcb_t.apcb138, #本位幣三成本認列金額
       apcbud001   LIKE apcb_t.apcbud001, #自定義欄位(文字)001
       apcbud002   LIKE apcb_t.apcbud002, #自定義欄位(文字)002
       apcbud003   LIKE apcb_t.apcbud003, #自定義欄位(文字)003
       apcbud004   LIKE apcb_t.apcbud004, #自定義欄位(文字)004
       apcbud005   LIKE apcb_t.apcbud005, #自定義欄位(文字)005
       apcbud006   LIKE apcb_t.apcbud006, #自定義欄位(文字)006
       apcbud007   LIKE apcb_t.apcbud007, #自定義欄位(文字)007
       apcbud008   LIKE apcb_t.apcbud008, #自定義欄位(文字)008
       apcbud009   LIKE apcb_t.apcbud009, #自定義欄位(文字)009
       apcbud010   LIKE apcb_t.apcbud010, #自定義欄位(文字)010
       apcbud011   LIKE apcb_t.apcbud011, #自定義欄位(數字)011
       apcbud012   LIKE apcb_t.apcbud012, #自定義欄位(數字)012
       apcbud013   LIKE apcb_t.apcbud013, #自定義欄位(數字)013
       apcbud014   LIKE apcb_t.apcbud014, #自定義欄位(數字)014
       apcbud015   LIKE apcb_t.apcbud015, #自定義欄位(數字)015
       apcbud016   LIKE apcb_t.apcbud016, #自定義欄位(數字)016
       apcbud017   LIKE apcb_t.apcbud017, #自定義欄位(數字)017
       apcbud018   LIKE apcb_t.apcbud018, #自定義欄位(數字)018
       apcbud019   LIKE apcb_t.apcbud019, #自定義欄位(數字)019
       apcbud020   LIKE apcb_t.apcbud020, #自定義欄位(數字)020
       apcbud021   LIKE apcb_t.apcbud021, #自定義欄位(日期時間)021
       apcbud022   LIKE apcb_t.apcbud022, #自定義欄位(日期時間)022
       apcbud023   LIKE apcb_t.apcbud023, #自定義欄位(日期時間)023
       apcbud024   LIKE apcb_t.apcbud024, #自定義欄位(日期時間)024
       apcbud025   LIKE apcb_t.apcbud025, #自定義欄位(日期時間)025
       apcbud026   LIKE apcb_t.apcbud026, #自定義欄位(日期時間)026
       apcbud027   LIKE apcb_t.apcbud027, #自定義欄位(日期時間)027
       apcbud028   LIKE apcb_t.apcbud028, #自定義欄位(日期時間)028
       apcbud029   LIKE apcb_t.apcbud029, #自定義欄位(日期時間)029
       apcbud030   LIKE apcb_t.apcbud030, #自定義欄位(日期時間)030
       apcb052     LIKE apcb_t.apcb052, #稅額
       apcb053     LIKE apcb_t.apcb053, #含稅金額
       apcb054     LIKE apcb_t.apcb054, #帳款對象
       apcb055     LIKE apcb_t.apcb055  #付款對象
             END RECORD
#161104-00024#3-add(e)
DEFINE l_bgaa008  LIKE bgaa_t.bgaa008 #160902-00034#1

   
   CALL s_aapt300_set_default_detail(g_apca_m.apcald,g_apca_m.apcadocno,p_ac)
        RETURNING l_apcb.*
   
   LET g_apcb_d[p_ac].apcborga= l_apcb.apcborga
   LET g_apcb_d[p_ac].apcbsite= l_apcb.apcbsite
   LET g_apcb_d[p_ac].apcblegl= l_apcb.apcblegl
   LET g_apcb_d[p_ac].apcb001 = l_apcb.apcb001
   LET g_apcb_d[p_ac].apcb007 = l_apcb.apcb007
   LET g_apcb_d[p_ac].apcb010 = l_apcb.apcb010
   LET g_apcb_d[l_ac].apcb010_desc = s_desc_get_department_desc(g_apcb_d[l_ac].apcb010)         #150828-00001#7
   LET g_apcb_d[p_ac].apcb011 = l_apcb.apcb011 
   LET g_apcb_d[p_ac].apcb015 = l_apcb.apcb015 
   LET g_apcb_d[p_ac].apcb017 = l_apcb.apcb017 
   LET g_apcb_d[p_ac].apcb020 = l_apcb.apcb020 
   LET g_apcb_d[p_ac].apcb020_desc = s_desc_get_tax_desc(g_ooef019,g_apcb_d[p_ac].apcb020)     #稅別名稱
   LET g_apcb_d[p_ac].apcb021 = l_apcb.apcb021
   LET g_apcb_d[p_ac].apcb022 = l_apcb.apcb022
   LET g_apcb_d[p_ac].apcb023 = l_apcb.apcb023
   LET g_apcb_d[p_ac].apcb029 = l_apcb.apcb029 
   LET g_apcb_d[p_ac].apcb030 = l_apcb.apcb030 
   LET g_apcb_d[p_ac].apcb051 = l_apcb.apcb051 
   LET g_apcb_d[p_ac].apcb100 = l_apcb.apcb100 
   LET g_apcb_d[p_ac].apcb101 = l_apcb.apcb101
   LET g_apcb_d[p_ac].apcb102 = l_apcb.apcb102 
   LET g_apcb_d[p_ac].apcb104 = l_apcb.apcb104
   
   #160902-00034#1---s---
   LET g_apcb_d[l_ac].apcb015 = g_apca_m.apca033
   IF NOT cl_null(g_apcb_d[l_ac].apcb021) THEN
      #取得 預算細項參照表
      SELECT bgaa008 INTO l_bgaa008  FROM bgaa_t
       WHERE bgaaent = g_enterprise  AND  bgaa001 = g_apca_m.apca059
      #取得會計科目所對應的預算細項 
      SELECT bgao004 INTO g_apcb_d[l_ac].apcb017 FROM bgao_t
        WHERE bgao001 = l_bgaa008 AND bgaoent = g_enterprise
          AND bgao002 = g_glaa.glaa004
          AND bgao003 = g_apcb_d[l_ac].apcb021
       #檢核預算細項是否可被使用(abgi100)
       CALL s_abg_bgai_chk(g_apca_m.apca059,g_apca_m.apcacomp,g_apcb_d[l_ac].apcb017)
          RETURNING g_sub_success,g_errno
       IF NOT g_sub_success THEN 
          LET g_apcb_d[l_ac].apcb017 = ''
       ELSE
          SELECT bgael003 INTO g_apcb_d[l_ac].apcb017_desc FROM bgael_t 
           WHERE bgaelent = g_enterprise AND bgael006 = l_bgaa008 
             AND bgael001 = g_apcb_d[l_ac].apcb017 AND bgael002 = g_dlang
          DISPLAY BY NAME g_apcb_d[l_ac].apcb017,g_apcb_d[l_ac].apcb017_desc
       END IF
   END IF
   #160902-00034#1---e---
   #09256
   IF cl_null(g_apcb_d[l_ac].apcb021) OR NOT cl_null(g_apca_m.apca036) THEN
      LET g_apcb_d[l_ac].apcb021 = g_apca_m.apca036
      LET g_apcb_d[l_ac].apcb021_desc = s_desc_get_account_desc(g_apca_m.apcald,g_apcb_d[l_ac].apcb021)
      DISPLAY BY NAME g_apcb_d[l_ac].apcb021,g_apcb_d[l_ac].apcb021_desc                     
   END IF
   #09256
   
END FUNCTION

################################################################################
# Descriptions...: 
# Memo...........:
# Date & Author..: 15/07/09 By Belle
# Modify.........:
################################################################################
PRIVATE FUNCTION aapt320_get_apca004_info()
DEFINE l_using          LIKE type_t.num5
DEFINE ls_js            STRING   
DEFINE lc_param_apca    RECORD
         apcald         LIKE apca_t.apcald,
         apcacomp       LIKE apca_t.apcacomp,
         apcasite       LIKE apca_t.apcasite,
         apcadocdt      LIKE apca_t.apcadocdt,
         apca001        LIKE apca_t.apca001,
         apca004        LIKE apca_t.apca004,
         ooef019        LIKE ooef_t.ooef019
                    END RECORD
DEFINE l_oodb004        LIKE oodb_t.oodb004
DEFINE l_oodb011        LIKE oodb_t.oodb011
DEFINE lc_param_info    RECORD
         apca005        LIKE apca_t.apca005,
         apca005_desc   LIKE type_t.chr80,
         apca006        LIKE apca_t.apca006,    #供應商分類
         apca007        LIKE apca_t.apca007,
         apca007_desc   LIKE type_t.chr80,
         apca008        LIKE apca_t.apca008,
         apca008_desc   LIKE type_t.chr80,
         apca009        LIKE apca_t.apca009,
         apca010        LIKE apca_t.apca010,
         apca011        LIKE apca_t.apca011,
         apca011_desc   LIKE type_t.chr80,
         apca012        LIKE apca_t.apca012,
         apca013        LIKE apca_t.apca013,
         apca014        LIKE apca_t.apca014,
         apca014_desc   LIKE type_t.chr80,
         apca015        LIKE apca_t.apca015,
         apca015_desc   LIKE type_t.chr80,
         apca034        LIKE apca_t.apca034,
         apca034_desc   LIKE type_t.chr80,
         apca035        LIKE apca_t.apca035,
         apca035_desc   LIKE type_t.chr80,
         apca036        LIKE apca_t.apca036,
         apca036_desc   LIKE type_t.chr80,
         apca046        LIKE apca_t.apca046,
         apca054        LIKE apca_t.apca054,
         apca054_desc   LIKE type_t.chr80,
         apca055        LIKE apca_t.apca055,
         apca055_desc   LIKE type_t.chr80,
         apca056        LIKE apca_t.apca056,
         apca058        LIKE apca_t.apca058,
         apca058_desc   LIKE type_t.chr80,
         apca060        LIKE apca_t.apca060,
         apca100        LIKE apca_t.apca100,
         apca101        LIKE apca_t.apca101,
         apca121        LIKE apca_t.apca121,
         apca131        LIKE apca_t.apca131
                    END RECORD
   IF cl_null(g_apca_m.apca004) THEN RETURN END IF
   #預設值檢核不過 給予空值
   LET g_apca_m.apca005 = ''   #160726-00020#10
   LET lc_param_apca.apcald   = g_apca_m.apcald
   LET lc_param_apca.apcacomp = g_apca_m.apcacomp
   LET lc_param_apca.apcasite = g_apca_m.apcasite
   LET lc_param_apca.apcadocdt= g_apca_m.apcadocdt
   LET lc_param_apca.apca001  = g_apca_m.apca001
   LET lc_param_apca.apca004  = g_apca_m.apca004
   LET lc_param_apca.ooef019  = g_ooef019
   LET ls_js = util.JSON.stringify(lc_param_apca)
   CALL s_aapt300_get_apca004_info(ls_js) RETURNING ls_js
   CALL util.JSON.parse(ls_js,lc_param_info)
   
   LET g_apca_m.apca005 = lc_param_info.apca005
   LET g_apca_m.apca006 = lc_param_info.apca006
   LET g_apca_m.apca007 = lc_param_info.apca007
   LET g_apca_m.apca008 = lc_param_info.apca008
   LET g_apca_m.apca009 = lc_param_info.apca009
   LET g_apca_m.apca010 = lc_param_info.apca010
   #170619-00059#1 --s mark
   #CASE g_sfin3012
   #     WHEN '1'  LET g_apca_m.apca060 = '1'
   #     WHEN '2'  LET g_apca_m.apca060 = '2'
   #END CASE
   #170619-00059#1 --e mark
   LET g_apca_m.apca060 = '1' #170619-00059#1 add kris:暫估都是不開發票   
   
   
   #依照據點設定稅別
   LET g_apca_m.apca011 = g_sfin3010
   IF NOT cl_null(g_apca_m.apca011) THEN
      LET gc_paramtax.apca011 = g_apca_m.apca011
      LET gc_paramtax.apca060 = g_apca_m.apca060
      IF g_sfin3012 = '1' THEN
         LET gc_paramtax.chktype = '1|2|3'
         LET ls_js = util.JSON.stringify(gc_paramtax)
         CALL s_aap_tax_chk(ls_js) RETURNING g_sub_success,g_errno
      ELSE
         #160726-00020#10--S 
         LET g_apca_m.apca013 = ''  
         LET g_apca_m.apca012 = ''  
         #160726-00020#10--E 
         CALL s_tax_chk(g_apca_m.apcacomp,g_apca_m.apca011) RETURNING g_sub_success,l_oodb004,g_apca_m.apca013,g_apca_m.apca012,l_oodb011
      END IF
      IF NOT g_sub_success THEN
         LET g_apca_m.apca011 = ''
         LET g_apca_m.apca011_desc = ''  #161101-00005#1
         LET g_apca_m.apca012 = ''
         LET g_apca_m.apca013 = 'N'
      ELSE
         IF cl_null(g_apca_m.apca012) THEN
            SELECT oodb005,oodb006 INTO g_apca_m.apca013,g_apca_m.apca012
              FROM oodb_t
             WHERE oodbent = g_enterprise
               AND oodb001 = g_ooef019 AND oodb002 = g_apca_m.apca011
         END IF
         CALL s_desc_get_tax_desc(g_ooef019,g_apca_m.apca011) RETURNING g_apca_m.apca011_desc
      END IF
   END IF
   
   LET g_apca_m.apca014 = lc_param_info.apca014
   LET g_apca_m.apca015 = lc_param_info.apca015
   LET g_apca_m.apca034 = lc_param_info.apca034
   LET g_apca_m.apca035 = lc_param_info.apca035
   LET g_apca_m.apca036 = lc_param_info.apca036
   LET g_apca_m.apca046 = lc_param_info.apca046
   LET g_apca_m.apca054 = lc_param_info.apca054
   LET g_apca_m.apca055 = lc_param_info.apca055
   LET g_apca_m.apca058 = lc_param_info.apca058

   LET g_apca_m.apca100 = lc_param_info.apca100
   LET g_apca_m.apca1001= g_apca_m.apca100
   LET g_apca_m.apca1011= g_apca_m.apca101
   LET g_apca_m.apca101 = lc_param_info.apca101
   LET g_apca_m.apca121 = lc_param_info.apca121
   LET g_apca_m.apca131 = lc_param_info.apca131
   
   LET g_apca_m.apca005_desc = lc_param_info.apca005_desc
   LET g_apca_m.apca007_desc = lc_param_info.apca007_desc
   LET g_apca_m.apca008_desc = lc_param_info.apca008_desc
   #LET g_apca_m.apca011_desc = lc_param_info.apca011_desc  #161101-00005#1 mark
   LET g_apca_m.apca014_desc = lc_param_info.apca014_desc
   LET g_apca_m.apca015_desc = lc_param_info.apca015_desc
   LET g_apca_m.apca034_desc = lc_param_info.apca034_desc
   LET g_apca_m.apca035_desc = lc_param_info.apca035_desc
   LET g_apca_m.apca036_desc = lc_param_info.apca036_desc
   LET g_apca_m.apca054_desc = lc_param_info.apca054_desc
   LET g_apca_m.apca055_desc = lc_param_info.apca055_desc
   LET g_apca_m.apca058_desc = lc_param_info.apca058_desc
      
   IF g_apca_m.apca100 = g_apca_m.glaa001 THEN
      LET l_using = FALSE
   ELSE
      LET l_using = TRUE
   END IF
   CALL cl_set_comp_entry("apca101",l_using)
   
   DISPLAY BY NAME g_apca_m.apca005,g_apca_m.apca006,g_apca_m.apca007,g_apca_m.apca008,
                   g_apca_m.apca009,g_apca_m.apca010,g_apca_m.apca011,g_apca_m.apca012,
                   g_apca_m.apca013,g_apca_m.apca014,g_apca_m.apca015,g_apca_m.apca034,
                   g_apca_m.apca035,g_apca_m.apca036,g_apca_m.apca046,g_apca_m.apca054,
                   g_apca_m.apca055,g_apca_m.apca058,
                   g_apca_m.apca005_desc,g_apca_m.apca007_desc,g_apca_m.apca008_desc,g_apca_m.apca011_desc,
                   g_apca_m.apca014_desc,g_apca_m.apca015_desc,g_apca_m.apca034_desc,
                   g_apca_m.apca035_desc,g_apca_m.apca036_desc,
                   g_apca_m.apca054_desc,g_apca_m.apca055_desc,g_apca_m.apca058_desc
END FUNCTION

################################################################################
# Descriptions...: 來源單據
# Memo...........:
# Usage..........: 
# Date & Author..: 14/04/18 By Belle
# Modify.........:
################################################################################
PRIVATE FUNCTION aapt320_get_source_b(p_ac,p_flag)
DEFINE p_ac        LIKE type_t.num5
DEFINE p_flag      LIKE apcb_t.apcb023
DEFINE l_apca001   LIKE apca_t.apca001
DEFINE l_oodb004   LIKE oodb_t.oodb004        #稅別名稱
DEFINE l_oodb005   LIKE oodb_t.oodb005        #含稅否
DEFINE l_oodb006   LIKE oodb_t.oodb006        #稅率
DEFINE l_oodb011   LIKE oodb_t.oodb011        #稅別應用(1.正常稅率 2.依料件設定)
DEFINE l_apcb105   LIKE apcb_t.apcb105
DEFINE l_cnt       LIKE type_t.num5
DEFINE l_source    DYNAMIC ARRAY OF RECORD    #單身其他信息
            chr    LIKE type_t.chr500,
            dat    LIKE type_t.dat
               END RECORD
DEFINE l_flag      LIKE type_t.num5           #140806-00012#12
DEFINE l_apcb007   LIKE apcb_t.apcb007        #140806-00012#12
DEFINE l_bgaa008 　LIKE bgaa_t.bgaa008        #160902-00034#1

   
   #160726-00020#10--s
    LET g_apcb_d[l_ac].apcb004 = ''   LET g_apcb_d[l_ac].apcb005 = ''   LET g_apcb_d[l_ac].apcb006 = ''
    LET g_apcb_d[l_ac].apcb007 = ''   LET g_apcb_d[l_ac].apcb008 = ''   LET g_apcb_d[l_ac].apcb010 = ''
    LET g_apcb_d[l_ac].apcb011 = ''   LET g_apcb_d[l_ac].apcb012 = ''   LET g_apcb_d[l_ac].apcb014 = ''
    LET g_apcb_d[l_ac].apcb020 = ''   LET g_apcb_d[l_ac].apcb021 = ''   LET g_apcb_d[l_ac].apcb022 = ''
    LET g_apcb_d[l_ac].apcb051 = ''   LET g_apcb_d[l_ac].apcb101 = ''   LET g_apcb_d[l_ac].apcb111 = '' 
    LET g_apcb_d[l_ac].apcb103 = ''   LET g_apcb_d[l_ac].apcb104 = ''   LET g_apcb_d[l_ac].apcb105 = ''
    LET g_apcb_d[l_ac].apcb113 = ''   LET g_apcb_d[l_ac].apcb114 = ''   LET g_apcb_d[l_ac].apcb115 = ''
    LET g_apcb_d[l_ac].apcb123 = ''   LET g_apcb_d[l_ac].apcb124 = ''   LET g_apcb_d[l_ac].apcb125 = ''
    LET g_apcb_d[l_ac].apcb133 = ''   LET g_apcb_d[l_ac].apcb134 = ''   LET g_apcb_d[l_ac].apcb135 = ''   
    LET g_apcb_d[l_ac].apcbsite= ''   LET g_apcb_d[l_ac].apcblegl= ''   LET g_apcb_d[l_ac].apcb013 = ''
    LET g_apcb_d[l_ac].apcb019 = ''   LET g_apcb_d[l_ac].apcb023 = ''    
    #160726-00020#10--e
    
   IF g_apcb_d[p_ac].apcb001 MATCHES '[12]9' THEN RETURN 0 END IF #160422-00017#1
   IF cl_null(p_flag) THEN LET p_flag = 'Y' END IF
   LET l_cnt = 0
   #來源單據取值
   CALL l_source.clear()
   CALL s_aapt300_source_doc_carry_b(g_apcb_d[l_ac].apcb001,g_apcb_d[l_ac].apcb002,g_apcb_d[l_ac].apcb003,g_apca_m.apcadocno,g_apca_m.apcald)
               RETURNING g_sub_success,g_errno,l_source
   LET g_apcb_d[p_ac].apcb004 = l_source[4].chr
   LET g_apcb_d[p_ac].apcb005 = l_source[5].chr
   LET g_apcb_d[p_ac].apcb006 = l_source[6].chr
   LET g_apcb_d[p_ac].apcb007 = l_source[7].chr
   LET g_apcb_d[p_ac].apcb008 = l_source[8].chr
   LET g_apcb_d[p_ac].apcb009 = l_source[9].chr
   LET g_apcb_d[p_ac].apcb010 = l_source[10].chr
   LET g_apcb_d[p_ac].apcb011 = l_source[11].chr
   LET g_apcb_d[p_ac].apcb013 = l_source[13].chr
   LET g_apcb_d[p_ac].apcb015 = l_source[15].chr   #專案代號
   LET g_apcb_d[p_ac].apcb016 = l_source[16].chr   #WBS
   LET g_apcb_d[p_ac].apcb019 = l_source[19].chr
   LET g_apcb_d[p_ac].apcb022 = l_source[22].chr
   LET g_apcb_d[p_ac].apcb023 = l_source[23].chr
   LET g_apcb_d[p_ac].apcb051 = l_source[51].chr
   LET g_apcb_d[p_ac].apcb101 = l_source[31].chr   #原幣單價
   LET g_apcb_d[p_ac].apcb111 = l_source[32].chr   #本幣單價
   LET g_apcb_d[p_ac].apcborga= l_source[33].chr   #營運據點
   LET g_apcb_d[p_ac].apcblegl= l_source[34].chr   #核算組織
   LET g_apcb_d[p_ac].apcb034 = l_source[35].chr   #渠道      #160120-00011#2
   #170617-00242#1-----s
   LET g_apcb_d[p_ac].apcb021 = l_source[21].chr
   LET g_apcb_d[p_ac].apcb021_desc = s_desc_get_account_desc(g_apca_m.apcald,g_apcb_d[p_ac].apcb021)
   DISPLAY BY NAME g_apcb_d[p_ac].apcb021,g_apcb_d[p_ac].apcb021_desc
   #170617-00242#1-----e
   
   #161214-00014#1---add---str--
   IF g_apcb_d[p_ac].apcb007 <= 0 THEN
      RETURN g_apcb_d[p_ac].apcb007
   END IF
   #161214-00014#1---add---end--

   #160816-00022#3 --s add
   #不含稅或雜項立暫估,aapt320單身稅別取單頭稅別
   CALL cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-3012') RETURNING g_sfin3012 
   IF g_sfin3012 = '1' OR g_apca_m.apca001 MATCHES '0[34]' THEN
      LET g_apcb_d[p_ac].apcb020 = g_apca_m.apca011
   ELSE
   #160816-00022#3 --e add

     #CALL cl_get_para(g_enterprise,g_apca_m.apcacomp,'S-FIN-2010') RETURNING g_apcb_d[p_ac].apcb020
      CALL cl_get_para(g_enterprise,g_apca_m.apcacomp,'S-FIN-3010') RETURNING g_apcb_d[p_ac].apcb020
      CALL s_aap_tax_for_noevidence(g_apca_m.apcacomp,g_apcb_d[p_ac].apcb020) RETURNING g_sub_success,g_errno
      IF NOT g_sub_success THEN
         LET g_apca_m.apca011 = ''
         LET g_apca_m.apca012 = ''
         LET g_apca_m.apca013 = 'N'   
      END IF
   END IF #160816-00022#3 add 
   
   IF NOT cl_null(g_apcb_d[p_ac].apcb020) THEN
      CALL s_tax_chk(g_apca_m.apcacomp,g_apca_m.apca011) 
           RETURNING g_sub_success,l_oodb004,l_oodb005,l_oodb006,l_oodb011
      IF NOT g_sub_success THEN
         LET g_apcb_d[p_ac].apcb020 = ''
      END IF
   END IF
   IF NOT g_sub_success THEN
      LET g_apcb_d[p_ac].apcb020 = ''
   ELSE
      CALL aapt320_set_entry_apcb020('N')
      LET g_apcb_d[p_ac].apcb105 = ''
      LET l_apcb105 = g_apcb_d[p_ac].apcb103
      IF NOT cl_null(g_apcb_d[p_ac].apcb007) AND NOT cl_null(g_apcb_d[p_ac].apcb101) THEN
         LET l_apcb105 = g_apcb_d[p_ac].apcb007 * g_apcb_d[p_ac].apcb101
      END IF
      IF NOT cl_null(g_apcb_d[p_ac].apcb020) AND NOT cl_null(l_apcb105) THEN
         CALL s_tax_ins(g_apca_m.apcadocno,g_apcb_d[p_ac].apcbseq,'0',g_apcb_d[p_ac].apcborga,l_apcb105,
                        g_apcb_d[p_ac].apcb020,g_apcb_d[p_ac].apcb007,g_apca_m.apca100,g_apca_m.apca101,g_apca_m.apcald,g_apca_m.apca121,g_apca_m.apca131)
              RETURNING g_apcb_d[p_ac].apcb103,g_apcb_d[p_ac].apcb104,g_apcb_d[p_ac].apcb105,
                        g_apcb_d[p_ac].apcb113,g_apcb_d[p_ac].apcb114,g_apcb_d[p_ac].apcb115,
                        g_apcb_d[p_ac].apcb123,g_apcb_d[p_ac].apcb124,g_apcb_d[p_ac].apcb125,
                        g_apcb_d[p_ac].apcb133,g_apcb_d[p_ac].apcb134,g_apcb_d[p_ac].apcb135
      END IF
   END IF
   #140806-00012#12 add ------
   #判斷如果為全部立帳時，應依照來源單據比照給值
   CALL s_aapt300_pmdt_get_apcb007(g_apca_m.apcald,g_apcb_d[p_ac].apcb002,g_apcb_d[p_ac].apcb003,g_apca_m.apca001) RETURNING l_apcb007,l_flag
   IF l_flag THEN
      CALL s_aapp131_entire_amount('1',g_apca_m.apcald,g_apca_m.apcadocno,p_ac,g_apcb_d[p_ac].apcb002,
                                   g_apcb_d[p_ac].apcb003,'','',g_apcb_d[p_ac].apcb103,g_apcb_d[p_ac].apcb104,
                                   g_apcb_d[p_ac].apcb105,g_apcb_d[p_ac].apcb113,g_apcb_d[p_ac].apcb114,g_apcb_d[p_ac].apcb115,g_apca_m.apca101)
           RETURNING g_apcb_d[p_ac].apcb103,g_apcb_d[p_ac].apcb104,g_apcb_d[p_ac].apcb105,g_apcb_d[p_ac].apcb113,
                     g_apcb_d[p_ac].apcb114,g_apcb_d[p_ac].apcb115
   END IF
   #160902-00034#1---s--- 根據來源單號 帶出預算細項
   CALL s_aooi200_fin_get_slip(g_apca_m.apcadocno) RETURNING g_sub_success,g_ap_slip
   CALL s_fin_get_doc_para(g_apca_m.apcald,g_apca_m.apcacomp,g_ap_slip,'D-FIN-5002') RETURNING g_dfin5002
   IF g_dfin5002 = 'Y' THEN
      LET g_apcb_d[p_ac].apcb017 = ''
      SELECT pmdt075 INTO g_apcb_d[p_ac].apcb017
        FROM pmdt_t WHERE pmdtent = g_enterprise
         AND pmdtdocno = g_apcb_d[p_ac].apcb002
         AND pmdtseq   = g_apcb_d[p_ac].apcb003
      #取得 預算細項參照表
      SELECT bgaa008 INTO l_bgaa008 
        FROM bgaa_t
       WHERE bgaaent = g_enterprise  AND  bgaa001 = g_apca_m.apca059
      SELECT bgael003 INTO g_apcb_d[p_ac].apcb017_desc FROM bgael_t 
       WHERE bgaelent = g_enterprise AND bgael006 = l_bgaa008  
         AND bgael001 = apcb017      AND bgael002 = g_dlang
      DISPLAY BY NAME g_apcb_d[p_ac].apcb017,g_apcb_d[p_ac].apcb017_desc
   END IF
   ##160902-00034#1---e---   
   #140806-00012#12 add end---
   DISPLAY BY NAME g_apcb_d[p_ac].apcb004,g_apcb_d[l_ac].apcb005,g_apcb_d[p_ac].apcb006,
                   g_apcb_d[p_ac].apcb007,g_apcb_d[p_ac].apcb008,g_apcb_d[p_ac].apcb009,
                   g_apcb_d[p_ac].apcb010,g_apcb_d[p_ac].apcb013,g_apcb_d[p_ac].apcb019,
                   g_apcb_d[p_ac].apcb020,g_apcb_d[l_ac].apcb022,g_apcb_d[l_ac].apcb023,
                   g_apcb_d[p_ac].apcb101,
                   g_apcb_d[p_ac].apcb103,g_apcb_d[p_ac].apcb104,g_apcb_d[p_ac].apcb105,
                   g_apcb_d[p_ac].apcb113,g_apcb_d[p_ac].apcb114,g_apcb_d[p_ac].apcb115,
                   g_apcb_d[p_ac].apcb123,g_apcb_d[p_ac].apcb124,g_apcb_d[p_ac].apcb125,
                   g_apcb_d[p_ac].apcb133,g_apcb_d[p_ac].apcb134,g_apcb_d[p_ac].apcb135,
                   g_apcb_d[p_ac].apcblegl
  

   RETURN g_apcb_d[p_ac].apcb007
   
END FUNCTION

################################################################################
# Descriptions...: 依據不同的apca001改變單頭的來源作業
# Memo...........:
# Usage..........: CALL aapt320_apca016_item_change()
# Input parameter: 
# Date & Author..: 14/05/28 By albireo
# Modify.........:
################################################################################
PRIVATE FUNCTION aapt320_apca016_item_change()
   IF cl_null(g_apca_m.apcadocno) OR cl_null(g_apca_m.apcald) THEN RETURN END IF

   CASE g_apca_m.apca001
      WHEN '01'
         CALL cl_set_combo_scc_part('apca016','8540','11')
         CALL cl_set_combo_scc_part('apcb001','8540','11')
      WHEN '02'
         CALL cl_set_combo_scc_part('apcb001','8540','20,21')
         CALL cl_set_combo_scc_part('apca016','8540','20,21')
      WHEN '03' 
         CALL cl_set_combo_scc_part('apcb001','8540','19')
         CALL cl_set_combo_scc_part('apca016','8540','19')
      WHEN '04' 
         CALL cl_set_combo_scc_part('apcb001','8540','29')
         CALL cl_set_combo_scc_part('apca016','8540','29')
   END CASE
#   LET g_apca_m.apca016 = ''     #170817-00055#1 mark
#   LET g_apca_m.apca018 = ''     #170817-00055#1 mark
   DISPLAY BY NAME g_apca_m.apca016,g_apca_m.apca018
END FUNCTION

################################################################################
# Descriptions...: 根據稅別設置欄位開啟否
# Memo...........:
# Usage..........: CALL saapt320_tax_entry()
# Date & Author..: 2015/02/04 By Hans(#150128-00005#9)
# Modify.........:
################################################################################
PRIVATE FUNCTION aapt320_tax_entry()
   DEFINE l_ooef019         LIKE ooef_t.ooef019
   DEFINE l_oodbl004        LIKE oodbl_t.oodbl004
   DEFINE l_oodb005         LIKE oodb_t.oodb005
   DEFINE l_oodb006         LIKE oodb_t.oodb006
   DEFINE l_oodb011         LIKE oodb_t.oodb011
   DEFINE l_oodb004         LIKE oodb_t.oodb004

   IF cl_null(g_apcb_d[l_ac].apcb020) THEN RETURN END IF

   CALL s_tax_get_ooef019(g_glaa.glaacomp) RETURNING g_sub_success,l_ooef019
   CALL s_tax_chk(g_glaa.glaacomp,g_apcb_d[l_ac].apcb020)
      RETURNING g_sub_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011

    SELECT oodb004 INTO l_oodb004 FROM oodb_t
     WHERE oodb002  = g_apcb_d[l_ac].apcb020
       AND oodb001  = l_ooef019
       AND oodbent  = g_enterprise

   CALL cl_set_comp_entry('apcb103,apcb104,apcb105,apcb113,apcb114,apcb115',TRUE)

   IF l_oodb004 = '2' THEN
      #複合稅:未稅不可錄入稅額、含稅金額;含稅不可錄入稅額、未稅金額
      IF l_oodb005 = 'Y' THEN
         CALL cl_set_comp_entry('apcb103,apcb104,apcb113,apcb114',FALSE)
      ELSE
         CALL cl_set_comp_entry('apcb104,apcb105,apcb114,apcb115',FALSE)
      END IF
   END IF
END FUNCTION

################################################################################
# Descriptions...: 儲存金額欄位現值
# Memo...........:
# Usage..........: CALL aapt320_save_amount_data()
# Date & Author..: 15/02/04 By Hans (#150128-00005#9)
# Modify.........:
################################################################################
PRIVATE FUNCTION aapt320_save_amount_data()
   LET g_apcb_d_t.apcb103 = g_apcb_d[l_ac].apcb103
   LET g_apcb_d_t.apcb104 = g_apcb_d[l_ac].apcb104
   LET g_apcb_d_t.apcb105 = g_apcb_d[l_ac].apcb105
   LET g_apcb_d_t.apcb113 = g_apcb_d[l_ac].apcb113
   LET g_apcb_d_t.apcb114 = g_apcb_d[l_ac].apcb114
   LET g_apcb_d_t.apcb115 = g_apcb_d[l_ac].apcb115
   LET g_apcb_d_t.apcb115 = g_apcb_d[l_ac].apcb115
   LET g_apcb_d_t.apcb101 = g_apcb_d[l_ac].apcb101
   LET g_apcb_d_t.apcb111 = g_apcb_d[l_ac].apcb111
END FUNCTION
################################################################################
# Descriptions...: 單據串查
# Memo...........:
# Date & Author..: 15/05/13 By rayhuang
# Modify.........:
################################################################################
PRIVATE FUNCTION aapt320_qrystr(p_apcasite,p_apca016,p_apca018)
DEFINE p_apcasite    LIKE apca_t.apcasite
DEFINE p_apca016     LIKE apca_t.apca016
DEFINE p_apca018     LIKE apca_t.apca018     
DEFINE l_pmds000     LIKE pmds_t.pmds000     #單據性質
DEFINE la_param      RECORD
       prog          STRING,
       actionid      STRING,
       background    LIKE type_t.chr1,
       param         DYNAMIC ARRAY OF STRING
                 END RECORD
DEFINE ls_js      STRING
DEFINE l_sql      STRING
   
   IF cl_null(p_apcasite) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = 'sub-00280'
      LET g_errparam.extend = s_fin_get_colname(g_prog,'apcasite')
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN
   END IF
   IF cl_null(p_apca016) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = 'sub-00280'
      LET g_errparam.extend = s_fin_get_colname(g_prog,'apca016')
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN
   END IF
   IF cl_null(p_apca018) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = 'sub-00280'
      LET g_errparam.extend = s_fin_get_colname(g_prog,'apca018')
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN
   END IF
   
   INITIALIZE la_param.* TO NULL
   CALL s_aapt300_get_source_apm_prog(p_apca016,p_apca018) RETURNING la_param.prog
   LET la_param.param[1] = p_apca018
   LET la_param.param[3] = p_apcasite
   LET ls_js = util.JSON.stringify(la_param)
   CALL cl_cmdrun_wait(ls_js)
END FUNCTION

################################################################################
# Descriptions...: 複製給予預設
# Memo...........:
# Usage..........: CALL aapt320_rep_default()
# Date & Author..: 2015/07/06 By Hans
# Modify.........:
################################################################################
PRIVATE FUNCTION aapt320_rep_default()
DEFINE l_apca007_t     LIKE apca_t.apca007
DEFINE l_apca035_t     LIKE apca_t.apca035
DEFINE l_apca036_t     LIKE apca_t.apca036
DEFINE l_apca100_t     LIKE apca_t.apca100
DEFINE l_glaa001_t     LIKE glaa_t.glaa001
DEFINE l_apca101_t     LIKE apca_t.apca101
DEFINE l_apca1001_t    LIKE apca_t.apca100
DEFINE l_glaa0011_t    LIKE glaa_t.glaa001
DEFINE l_apca1011_t    LIKE apca_t.apca101
DEFINE l_apca120_t     LIKE apca_t.apca120
DEFINE l_apca121_t     LIKE apca_t.apca121
DEFINE l_apca130_t     LIKE apca_t.apca130
DEFINE l_apca131_t     LIKE apca_t.apca131
DEFINE l_apca011_t     LIKE apca_t.apca011

   #備份舊值   
   LET l_apca007_t = g_apca_m.apca007
   LET l_apca035_t = g_apca_m.apca035
   LET l_apca036_t = g_apca_m.apca036
   LET l_apca100_t = g_apca_m.apca100
   LET l_glaa001_t = g_apca_m.glaa001
   LET l_apca101_t = g_apca_m.apca101
   LET l_apca1001_t = g_apca_m.apca1001
   LET l_glaa0011_t = g_apca_m.glaa0011
   LET l_apca1011_t = g_apca_m.apca1011
   LET l_apca120_t = g_apca_m.apca120
   LET l_apca121_t = g_apca_m.apca121
   LET l_apca130_t = g_apca_m.apca130
   LET l_apca131_t = g_apca_m.apca131
   LET l_apca011_t = g_apca_m.apca011

   LET g_apca_m.apca003 = g_user
   LET g_apca_m.apca003_desc =s_desc_get_person_desc(g_apca_m.apca003)
   LET g_apca_m.apcadocdt = g_today
   LET g_apca_m.apcastus = 'N'
   LET g_apca_m.apca038 = ''
   LET g_apca_m.apca065 = ''
   LET g_apca_m.apca066 = ''
   #交易原幣帳款
   LET g_apca_m.apca103 = 0
   LET g_apca_m.apca104 = 0
   LET g_apca_m.apca106 = 0
   LET g_apca_m.apca108 = 0
   LET g_apca_m.apcc109 = 0
   LET g_apca_m.net108  = 0
   LET g_apca_m.apca113 = 0
   LET g_apca_m.apca114 = 0
   LET g_apca_m.apca116 = 0
   LET g_apca_m.apcc113 = 0
   LET g_apca_m.apca118 = 0
   LET g_apca_m.apcc119 = 0
   LET g_apca_m.net118  = 0
   #其他本位幣
   LET g_apca_m.apca1001 = ''
   LET g_apca_m.apca1031 = 0
   LET g_apca_m.apca1041 = 0
   LET g_apca_m.apca1061 = 0
   LET g_apca_m.apca1081 = 0
   LET g_apca_m.apcc1091 = 0
   LET g_apca_m.net1081  = 0
   LET g_apca_m.apca1131 = 0
   LET g_apca_m.apca1141 = 0
   LET g_apca_m.apca1161 = 0
   LET g_apca_m.apcc1131 = 0
   LET g_apca_m.apca1181 = 0
   LET g_apca_m.apcc1191 = 0
   LET g_apca_m.net1181  = 0
   LET g_apca_m.apca123 = 0
   LET g_apca_m.apca124 = 0
   LET g_apca_m.apca126 = 0
   LET g_apca_m.apcc123 = 0
   LET g_apca_m.apca128 = 0
   LET g_apca_m.apcc129 = 0
   LET g_apca_m.net128  = 0
   LET g_apca_m.apca130 = ''
   LET g_apca_m.apca131 = ''
   LET g_apca_m.apca133 = 0
   LET g_apca_m.apca134 = 0
   LET g_apca_m.apca136 = 0
   LET g_apca_m.apcc133 = 0
   LET g_apca_m.apca138 = 0
   LET g_apca_m.apcc139 = 0
   LET g_apca_m.net138  = 0
   #會計資料
   LET g_apca_m.apca0501 = ''
   LET g_apca_m.apca039 = ''
   LET g_apca_m.apca056 = '0'
   #其他訊息
   LET g_apca_m.apca016 = ''
   LET g_apca_m.apca018 = ''
   LET g_apca_m.apca019 = ''
   LET g_apca_m.apca014 = ''
   LET g_apca_m.apca014_desc = ''
   LET g_apca_m.apca015 = ''
   LET g_apca_m.apca015_desc = ''
   LET g_apca_m.apca033 = ''
   LET g_apca_m.apca033_desc = ''
   LET g_apca_m.apca058 = ''
   LET g_apca_m.apca058_desc = ''
   LET g_apca_m.apca054 = ''
   LET g_apca_m.apca054_desc = ''
   LET g_apca_m.apca055 = ''
   LET g_apca_m.apca055_desc = ''
   LET g_apca_m.apca050 = ''
   LET g_apca_m.apca052 = 0
   LET g_apca_m.apca017 = 0
   LET g_apca_m.apca051 = ''
   LET g_apca_m.apca053 = ''
   #發票明細/其他訊息
   CALL aapt300_03_clear_detail()
   CALL aapt300_08_clear_detail()
   CALL aapt300_13_clear()
   #差異處理及留置
   LET g_apca_m.apca025 = 0
   LET g_apca_m.apca031 = ''
   LET g_apca_m.apca053 = ''
   LET g_apca_m.apca030 = ''
   LET g_apca_m.apca030_desc = ''
   LET g_apca_m.apca026 = 0
   LET g_apca_m.apca028 = 0
   LET g_apca_m.apca027 = 0
   LET g_apca_m.apca029 = 0
   #集團交易信息
   LET g_apca_m.apca020 = 'N'
   LET g_apca_m.apca021 = ''
   LET g_apca_m.apca022 = ''
   LET g_apca_m.apca046 = 'N'
   LET g_apca_m.apca047 = ''
   LET g_apca_m.apca048 = ''
   LET g_apca_m.apca0181 = ''
   #異動訊息
   LET g_apca_m.apcaownid = g_user
   LET g_apca_m.apcaownid_desc = s_desc_get_person_desc(g_user)
   LET g_apca_m.apcaowndp = g_dept
   LET g_apca_m.apcaowndp_desc = s_desc_get_department_desc(g_dept)
   LET g_apca_m.apcacrtid = g_user
   LET g_apca_m.apcacrtid_desc = s_desc_get_person_desc(g_user)
   LET g_apca_m.apcacrtdp = g_dept
   LET g_apca_m.apcacrtdp_desc = s_desc_get_department_desc(g_dept)
   LET g_apca_m.apcamodid = g_user
   LET g_apca_m.apcamodid_desc = s_desc_get_person_desc(g_user)
   LET g_apca_m.apcamoddt = g_today
   LET g_apca_m.apcacnfid = ''
   LET g_apca_m.apcacnfid_desc = ''
   LET g_apca_m.apcacnfdt = ''
   #單身清空
   CALL g_apcb_d.clear()
   CALL g_apcb2_d.clear()
   CALL g_apcb3_d.clear()
   #預設
   CALL aapt320_get_apca004_info()
   LET g_apca_m.apca007 = l_apca007_t
   LET g_apca_m.apca035 = l_apca035_t
   LET g_apca_m.apca036 = l_apca036_t
   LET g_apca_m.apca100 = l_apca100_t
   LET g_apca_m.glaa001 = l_glaa001_t
   LET g_apca_m.apca101 = l_apca101_t
   LET g_apca_m.apca1001 = l_apca1001_t
   LET g_apca_m.glaa0011 = l_glaa0011_t
   LET g_apca_m.apca1011 = l_apca1011_t
   LET g_apca_m.apca120  = l_apca120_t
   LET g_apca_m.apca121  = l_apca121_t
   LET g_apca_m.apca130  = l_apca130_t
   LET g_apca_m.apca131  = l_apca131_t
   LET g_apca_m.apca011  = l_apca011_t
   
   
END FUNCTION

################################################################################
# Descriptions...: 
# Memo...........:
# Date & Author..: 16/03/29 By Belle
# Modify.........:
################################################################################
PRIVATE FUNCTION aapt320_get_apcb1x6(p_ac)
DEFINE p_ac          LIKE type_t.num10
DEFINE r_apcb106     LIKE apcb_t.apcb106
DEFINE r_apcb116     LIKE apcb_t.apcb116
DEFINE r_apcb126     LIKE apcb_t.apcb126
DEFINE r_apcb136     LIKE apcb_t.apcb136
DEFINE l_std_cost    type_g_std_cost
DEFINE l_xcag001     LIKE xcag_t.xcag001

   IF g_xcat005 = 'Y' AND NOT cl_null(g_apcb_d[p_ac].apcb004) 
      AND (g_apcb_d[p_ac].apcb001 = '11' OR g_apcb_d[p_ac].apcb001 MATCHES '2[01]') THEN
      
      #1.确定"标准成本分类"
      SELECT xcaa001 INTO l_xcag001
        FROM xcaa_t
       WHERE xcaaent = g_enterprise AND xcaa002 = 'Y'   
      #2.呼叫s_axcp500_std的CURSOR定义
      LET g_field_type = '1'
      LET g_ld = g_apca_m.apcald
      LET g_edate = g_apca_m.apcadocdt
      LET g_curr[1].curr = g_glaa.glaa001
      LET g_curr[2].curr = g_apca_m.apca120
      LET g_curr[3].curr = g_apca_m.apca130
      LET g_curr[1].type2= g_glaa.glaa025
      LET g_curr[2].type2= g_glaa.glaa018
      LET g_curr[3].type2= g_glaa.glaa022
      CALL s_axcp500_std_def_cursor() RETURNING g_sub_success
      #3.取标准成本
      #3.1取料件的标准成本
      CALL s_axcp500_std_get_std_cost('1',g_apca_m.apcacomp,l_xcag001,g_apcb_d[p_ac].apcb004) RETURNING g_sub_success,l_std_cost.*
      LET r_apcb116 = l_std_cost.sum * g_apcb_d[p_ac].apcb007
      LET r_apcb106 = r_apcb116 / g_apca_m.apca101
      CALL s_curr_round_ld('1',g_apca_m.apcald,g_apca_m.apca100,r_apcb106,2) RETURNING g_sub_success,g_errno,r_apcb106
      CALL s_curr_round_ld('1',g_apca_m.apcald,g_glaa.glaa001,r_apcb116,2)   RETURNING g_sub_success,g_errno,r_apcb116
      IF g_glaa.glaa015 = 'Y' THEN
         CALL s_axcp500_std_get_std_cost('2',g_apca_m.apcacomp,l_xcag001,g_apcb_d[p_ac].apcb004) RETURNING g_sub_success,l_std_cost.*
         LET r_apcb126 = l_std_cost.sum * g_apcb_d[p_ac].apcb007
         CALL s_curr_round_ld('1',g_apca_m.apcald,g_apca_m.apca120,r_apcb126,2)   RETURNING g_sub_success,g_errno,r_apcb126
      END IF
      IF g_glaa.glaa019 = 'Y' THEN
         CALL s_axcp500_std_get_std_cost('3',g_apca_m.apcacomp,l_xcag001,g_apcb_d[p_ac].apcb004) RETURNING g_sub_success,l_std_cost.*
         LET r_apcb136 = l_std_cost.sum * g_apcb_d[p_ac].apcb007
         CALL s_curr_round_ld('1',g_apca_m.apcald,g_apca_m.apca130,r_apcb136,2)   RETURNING g_sub_success,g_errno,r_apcb136
      END IF
   END IF
   IF cl_null(r_apcb106) THEN LET r_apcb106 = 0 END IF
   IF cl_null(r_apcb116) THEN LET r_apcb116 = 0 END IF
   IF cl_null(r_apcb126) THEN LET r_apcb126 = 0 END IF
   IF cl_null(r_apcb136) THEN LET r_apcb136 = 0 END IF
   
   RETURN r_apcb106,r_apcb116,r_apcb126,r_apcb136
END FUNCTION

################################################################################
# Descriptions...: 轉成SQL
# Memo...........: #161014-00053#3
# Usage..........: CALL aapt320_get_ooef001_wc(p_wc)
#                  RETURNING 回传参数
# Input parameter: p_wc 帳套
# Return code....: r_wc ('帳套')
# Date & Author..: 161021 By 08171
# Modify.........:
################################################################################
PRIVATE FUNCTION aapt320_get_ooef001_wc(p_wc)
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
   LET r_wc = "('",l_str,"')"
   
   RETURN r_wc
END FUNCTION

 
{</section>}
 
