#該程式未解開Section, 採用最新樣板產出!
{<section id="aint302.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0130(2017-06-20 17:05:29), PR版次:0130(2017-12-06 09:45:54)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 001132
#+ Filename...: aint302
#+ Description: 雜項庫存收料作業
#+ Creator....: 02294(2013-10-15 14:04:49)
#+ Modifier...: 04543 -SD/PR- 09767

{</section>}

{<section id="aint302.global" >}
#應用 t01 樣板自動產生(Version:90)
#add-point:填寫註解說明 name="global.memo"
#151224-00025#1   15/12/29 By tsungyung   手動輸入特徵碼沒有同步新增inam_t[料件產品特徵明細檔](整批修改)
#160127-00007#1   15/02/02 By lixiang     庫位都要檢核是否存在庫位基本資料檔中
#160127-00014#1   15/02/15 By lixh        aint302 做QC，产生申请资料时不需要产生入库明细资料
#150310-00003#19  16/02/23 By lixh        RMA转入的杂发单不可以做状态变更&删除
#160224-00015#1   16/03/10 By lixh        复制一笔资料时，会把源单据的实际数量和检验合格量一并复制下来
#160314-00008#1   16/03/14 By catmoon     批/序號3:不控管時,修改儲位/批號時沒有更新到inao_t
#160316-00007#1   16/03/16 By lixh        制造批序号相关程式请加上对库存管理特征的处理
#160302-00018#1   16/03/16 By lixiang     雜發單時，庫儲批等欄位的開窗同時回傳單位字段
#160314-00009#9   16/03/25 By zhujing     各程式增加产品特征是否需要自动开窗的程式段处理
#160330-00020#1   16/04/05 By zhujing     调整了元件s_feature_auto_chk的控制范围
#160411-00009#1   16/04/11 By lixh        及时刷新入库批序号明细页签
#160413-00011#2(#160413-00011#3) 2016/04/13 By lixiang  效能優化
#160318-00025#19  16/04/14 BY 07900       校验代码重复错误讯息的修改
#160420-00009#1   16/04/20 By lixh        新增点放弃报错
#160408-00024#1   16/04/20 By lixh        入库制造批序号明细笔数显示错误
#160430-00001#1   16/05/05 By Ann_Huang   修正若該項次有使用產品特徵而整批產生其他單身,該筆若有維護有效日期(inbb022)也需一併帶入
#160513-00006#1   16/05/31 By lixh        库存管理特征必输时inbb003 不可为' '
#160512-00004#2   16/06/17 By dorislai    1.新增製造日期欄位(inbb204) 2.有效日期需>製造日期
#                                         3.製造日期(inad014)、有效日期(inad011)在aini010有值的話，帶預設值&不可輸入；沒值，開放給user輸入
#160617-00005#1   16/06/27 By lixiang     入庫批號自動編碼產生(料件批號須有批號且自動編碼而批號為空就自動編碼)
#160623-00014#1   16/06/27 By dorislai    為應應行業別，修改g_prog。
#                                         原：g_prog='程式代碼'→改成：g_prog MATCHES '程式代碼*'
#160630-00039#1   16/07/01 By ywtsai      程式一進入會進到s_lot_b_fill段，但因程式開啟並無單號會出現傳入參數的錯誤，故判斷當單號非NULL時才進入該段取資料
#160707-00017#1   16/07/07 By lixh        整批产生按钮只能在未确认状态下使用
#160705-00042#9   16/07/13 By sakura      #160623-00014#1,g_prog MATCHES '程式代碼*'→g_prog MATCHES '程式代碼'
#160519-00008#1   16/07/14 By lixh        单据上库存管理特征栏位没有依料件设定控管
#160812-00017#2   16/08/15 By 06814       在satatchange( )的FUNCTION中，有RETURN指令但沒有加上transaction_end( ) 造成transaction沒有結束就直接RETURN
#160802-00015#1   16/08/16 By lixh        l_ac 下标有误
#160804-00041#1   16/08/18 By lixh        及时刷新入库明细页签
#160816-00001#4   2016/08/19  By 08734    抓取理由碼改CALL sub
#160808-00001#1   2016/08/19  By lixh     q_inag004_13 缺少传参
#160815-00028#1   2016/08/22  By lixh     VMI仓库，库存管理特征必输
#160818-00017#44  2016/08/16  By lixh     单据类作业修改，删除时需重新检查状态
#160811-00014#2   2016/08/30  By dongsz   增加扫码录入功能scan_barcode
#160825-00025#1   2016/08/31  By lixh     当单据号存在于axct313(xccw006)时，该单据应不可以异动
#160905-00007#5   20160905 by geza        sql加上ent条件
#160907-00019#1   2016/09/09  By 06948    調整aint302的azzi902設定，增加庫存雜發明細與庫存雜發製造批序號明細名稱
#160906-00045#1   2016/09/19  By lixh     aooi200设定了杂发理由码，单身的可以用，单头的没用管控，单头应该也要受这里的理由码管控
#160906-00025#1   2016/09/20  By lixh     庫位增加控制組檢核
#160831-00070#4   2016/10/03  By 06137    增加扫 码录入功能scan_barcode(aint302)
#161017-00010#1   2016/10/19  By lixh     aint302杂收单根据参数D-BAS-0058控管是否可以输入负数，调整AFTER FIELD inbb011控管
#160602-00018#1   2016/10/26  By lixh     料号不做批序号管理，不可开启批序号维护画面
#161027-00033#1   2016/10/27  By ywtsai   判斷當aimm212設定批號必須輸入且不自動編碼時限定批號(inbb009)欄位須為必要輸入
#161027-00017#1   2016/10/28  By wuxja    整单操作qc单查询按钮改传参数，改为单号
#161031-00013#1   2016/10/31  By lixh     依QC判定结果产生入库明细后,没有及时刷新单身入库明细页签
#161006-00018#2   2016/11/10  By lixh     增加参数D-MFG-0085(來源單據指定庫儲後，是否允許修改)
#161114-00040#1   2016/11/15  By wuxja    料件开窗和检查应过滤已经失效的资料
#161108-00042#1   2016/11/18  By lixh     參數D-BAS-0070是否為'Y',都要調用s_inventory_check_inan()检核库存是否足够
#161006-00018#31  2016/11/21  By lixh     數量和參考數量不可以同時為0
#161007-00012#3   2016/11/25  By dorislai 1.庫位，若為VMI庫存，則庫存管理特徵必輸
#                                         2.庫位，僅能選擇VMI存貨庫位、非VMIN庫位 (排除VMI結算庫位)
#161206-00016#1   2016/12/06  By lixh     g_qryparam.default 给值有误
#161109-00032#1   2016/12/07  By lixh     新增作业apjt500(项目发料单)g_argv[1] = '3'
#161109-00032#2   2016/12/07  By lixh     新增作业apjt600(项目退料单)g_argv[1] = '4'
#161223-00013#1   2016/12/23  By lixiang  取产品特征说明并回主sql处理,改从inaml_t抓取
#161124-00048#13  2016/12/29  By 08734    星号整批调整
#160824-00007#278 2016/12/29  By lori     修正舊值備份寫法
#161117-00032#1   2016/01/09  By lixh     單身不能下查詢條件
#170104-00028#1   2017/01/12  By lixh     1.庫存控制組設定產品分類控管,aint302過帳時,非該人員可控管的產品分類不可以過帳
#.........................................2.打單時，輸入庫位，不做庫存控制組的檢查，過帳時去檢查庫存控制組
#161031-00025#7   2017/02/06  By zhujing  1.將aooi360_01以嵌入的方式，用頁籤放在aint302單頭多帳期頁籤與異動資訊頁籤中間
#                                           要可修改
#                                           控制類型 =3:內部資訊傳遞 取消不要了
#                                           項次固定寫入0
#                                         2.原aint302的備註action，改為確認後可執行，直接修改單頭新的"備註"頁籤
#                                         3.aint302單身最後面增加顯示"長備註"欄位，一樣抓取aooi360的備註顯示
#                                           項次 = 單身項次
#                                           控制類型 = 列印在後
#160604-00034#1  2017/02/07 By lixh       單據的單據日期及過帳日期應依aoos020裡"進銷存單據日期控管方式"、"進銷存過帳日期控管方式"處理,
#                                         如參數設定為"不可修改"時，則新增、修改時，都不可異動該欄位資料
#170213-00038#1  2017/02/17 By 08734      修改单头理由码开窗
#170217-00068#3  2017/02/20 By 08993      g_prog MATCHES '程式編號*'，修正漏寫*的問題
#170220-00047#1  2017/02/21 By dujuan     aint301,aint302雜收發單據，單身內容點擊刪除後，單身的項次欄位，項次號直接清空且不自動產生
#170215-00048#1  2017/02/22 By wuxja      再录入修改时需要判断仓储批的合理性
#170220-00022#1  2017/02/28 By lixh       做批号管理时考虑單別參數D-MFG-0012，不做批号管理，不需要考虑
#170309-00052#1  2017/03/10 By lixh       若料号做制造批号或制造序号管理，修改料号或项次时检查是否已有inao资料，若有，将该笔已有的inao料号、项次同步变更
#170314-00104#1  2017/03/16 By lixh       批序号管理，更改料号出现【已有批序号资料，是否重新挑选批序号】提示，点否时，料号、仓储批等给旧值
#170321-00057#1  2017/03/21 By lixh       1：库位储位资料检核不存在不能直接NEXT FIELD 储位，要考虑储位管理
#.........................................2：AFTER ROW 检核之后不可直接NEXT FIELD 栏位 ，要检核是否在事务中
#170324-00052#1  2017/03/24 By lixh       批号自动编码时，批号生成后同步UPDATE inao_t
#170323-00024#1  2017/03/27 by 08172      新增时单身库位开窗过滤无效的库位，手工输入控管无效库位，预带库位保存时也要控管
#170314-00036#1  2017/03/28 By lixh       AFTER ROW 后的AFTER FIELD 栏位拿到AFTER INSERT / ON ROW CHANGE
#170325-00093#1  2017/03/28 By earl       inbb修正日期時同步更新inbc
#170328-00103#1  2017/03/28 By catmoon47  修正170323-00024，確認時倉庫可以為空。
#170330-00018#1  2017/03/29 By catmoon47  確認時，儲位、批號、庫存管理特徵可以為空
#170330-00078#1  2017/03/30 By 08734      1、aint301 雜發明細/雜發製造批序號明細 製造日期設隱藏。
#                                         2、管控过账时要维护库存管理特征
#                                         3、库存管理特征栏位输入检核不通过的资料要有提示。
#170323-00026#1  2017/04/01 By 01531      1.整单操作下面显示的是“入库明细维护”按钮，应该是“发料明细维护”，点进去以后下面也是显示的入库字样，且报错的时候也是入库字样
#                                         2.整单操作下面“依QC判定结果产生入库明细”也是不正确，改成“依QC判定结果产生发料明细”
#170407-00004#1  2017/04/06 By lixh       修改料号后删除inao_t
#170405-00051#1  2017/04/13 By lixh       單據日期、過帳日期，都要考慮關帳日的控管,如參數設定不可維護時，預設日期時加判斷，如果關帳日>=g_today，則預設日期=關帳日+1
#170426-00076#1  2017/04/27 By lixh       申請件數(inbb011)不可為0
#170503-00025#1  2017/05/04 By Whitney    還原161108-00042，維護申請明細的數量不控卡庫存
#170511-00025#1  2017/05/25 By 02111      aint301 aint302_inbb003_chk() 不再檢查 inag_t。
#170524-00059#1  2017/05/26 By lixh       l_ac1/l_ac2数组下标越界 num5=>num10
#170526-00058#1  2017/06/08 By Whitney    修正AFTER INSERT檢查不過後直接走AFTER ROW
#170425-00065#1  2017/06/09 By lixh       数据源2：差异转入的资料不可过账还原
#170331-00022#1  2017/06/09 By lixh       aint302 雜收時，製造批序號的有效日期應預設申請明細的有效日期
#170509-00052#1  2017/06/13 By 09042      1.单身移到空白处，按ctrl+r复制上一笔时，项次不可清空
#                                         2.单身在有资料处，按ctrl+r复制上一笔时，直接按确定，复制资料会不见
#170509-00033#1  2017/06/13 By 09042      點不使用參考單位，異動申請明細有隱藏參考單位，但入庫明細的參考單位等欄位沒隱藏到
#170618-00230#1  2017/06/18 by 08172      料件如果走批序号管理时，申请明细库存管理特征为空或空格时也要一并更新制造批序号明细
#170618-00287#1  2017/06/19 By 06814      修改:資料來源若為[8.下階料報廢轉入]時，申請數量、參考申請數量不可輸入！
#170618-00291#1  2017/06/19 By 06814      修改:單身若已有資料，不開放單頭的來源單號(inba006)
#170617-00536#1  2017/06/20 By lixh       s_aooi250_convert_qty()部分传参有误
#170310-00005#25 2017/06/05 By earl       新增條碼開帳用程式段落 g_prog = 'abct302' g_argv[1]='2' g_type = '2'邏輯同aint302
#170703-00025#6  2017/07/19 By wanghaoz   调整construct/input中的开窗调用，将q_ooag001/q_ooag001_4调整成q_ooag001_2
#                                         在对应的AFTER FIELD 人员编号的区块，调用v_ooag001_6进行检核
#170626-00059#1  2017/07/21 By liuym      单头维护进单身后，关闭单头单号栏位输入
#170710-00045#3  2017/07/24 By 08734      在查詢方案頁面將滑鼠右鍵全部功能關掉(標準的保留，例如修復多語言標籤以下那些)，整單操作跟明細操作的所有功能都反灰
#170310-00005#27 2017/07/27 By earl       條碼重複產生問題回追
#170727-00011#1  2017/07/28 By 02111      打單時，操作人員有可能不是倉管部門，所以打單過程不需要控卡到 aooi380 的部門 或人員，允許輸入符合 單別+控制項的庫位，所以 AFTER FIELD 單別的控制項檢核 CALL s_control_chk_doc() mark，因為這段會判斷到部門、人員。
#170706-00060#1  2017/08/01 By lixh       修改申請頁簽專案編號、WBS、活動編號，實際頁簽沒有同步更新
#170802-00056#1  2017/08/03 By Whitnet    修正單別參數D-BAS-0083設定確認後自動過帳，維護過帳日期失敗沒有提示錯誤訊息
#170724-00049#1  2017/08/04 By lixh       申請批序號沒有維護，通過"實際異動製造批序號維護"開啟維護,s_lot_ins()傳參有誤
#170803-00020#1  2017/08/07 By wanghaoz   在單據已確認後，整單操作、明細操作中可以執行的ACTION需要增加LOCK該筆單據單頭檔，LOCK後才能執行ACTION；過帳前也要LOCK該筆單據單頭檔、重新刷新單據狀態碼，LOCK後才能執行過帳
#170605-00020#2  2017/08/10 By lixh       製造批序號與一般庫存異動，庫位管理需一致
#.........................................1.非庫存異動單據，不帶預設值，可不輸入，有輸入時僅檢查是否存在庫位檔，不檢查是否存在inag及庫存量
#.........................................2.庫存異動單據，帶前單限定庫位，無限定帶料件預設，可不輸入，有輸入時，僅檢查是否存在庫位檔，不檢查是否存在inag及庫存量，統一於過帳段進行檢查
#170811-00052#1  2017/08/17 By 05599      將申請數量不可為零的控卡邏輯移至新增/更新單身前做檢查。
#170728-00002#2  2017/08/23 By 06137      複製時需將備註ooff_t資料一起複製，修正查詢ooff備註欄位無法正常查出bug
#170724-00041#4  2017/08/22 by sakura     s_inventory_check_inan()增加參數'p_imafsite',流通傳ALL,製造傳g_site或null
#170808-00058#1  2017/08/31 By lixiang    1.如果料號有設定有效期imaf031、imaf032，如果有設定且製造日期修改時，重新計算有效日期
#                                         2.如果異動單據上批號沒有值，製造日期、有效日期不能輸入，如果單據上的批號已有對應的inad_t，也不允許修改製造日期、有效日期(不管原先inad_t上的製造日期、有效日期有值或沒值)
#170818-00009#1  2017/09/04 By lixh       出庫類的單據不在輸入階段不檢核庫存量，在過賬段做檢核
#170905-00058#1  2017/09/08 By lixh       生命週期檢核報錯方式調整
#170905-00030#1  2017/09/13 By 09042      将after insert段和on row change段数量检核mark掉，在单身after input段、on action cancel、on action close、on action exit段加上数量栏位的管控
#170906-00028#1  2017/09/15 By 09042      雜發單別設定不撿核在撿量也需撿核備置量
#170904-00005#1  2017/09/15 By 09042      aint302單身有輸入料號跟批號時，應該要帶出製造日期跟有效日期 from inad_t(料號+產品特徵+批號)
#170908-00038#2  2017/09/19 By wanghaoz   调整lock库储批，报错处的return改成exit dialog，避免作业关闭
#170919-00052#1  2017/09/21 by 09767      检核不到错误的库位
#170922-00037#3  2017/10/02 By 10046      單據日期在修改模式時是否可修改，回歸到由cl_chk_update_docdt()來控管
#171117-00009#1  2017/11/17 By 08525      申请数量过栏位时，仍需依照参数[出库单据考虑在拣量]来控管，修正#170906-00028#1
#171204-00044#2  2017/12/05 by 09767      部门栏位不为空或者人员栏位不修改时，不重新带部门预设值
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
IMPORT FGL sub_s_lot
IMPORT FGL aoo_aooi360_01   #161031-00025#7 add
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

#end add-point

#單頭 type 宣告
PRIVATE type type_g_inba_m        RECORD
       inbadocno LIKE inba_t.inbadocno,
   inbadocno_desc LIKE type_t.chr80,
   inbasite LIKE inba_t.inbasite,
   inbadocdt LIKE inba_t.inbadocdt,
   inba002 LIKE inba_t.inba002,
   inba003 LIKE inba_t.inba003,
   inba003_desc LIKE type_t.chr80,
   inba004 LIKE inba_t.inba004,
   inba004_desc LIKE type_t.chr80,
   inbastus LIKE inba_t.inbastus,
   inba005 LIKE inba_t.inba005,
   inba006 LIKE inba_t.inba006,
   inba007 LIKE inba_t.inba007,
   inba007_desc LIKE type_t.chr80,
   inba008 LIKE inba_t.inba008,
   inbaownid LIKE inba_t.inbaownid,
   inbaownid_desc LIKE type_t.chr80,
   inbacrtdp LIKE inba_t.inbacrtdp,
   inbacrtdp_desc LIKE type_t.chr80,
   inbaowndp LIKE inba_t.inbaowndp,
   inbaowndp_desc LIKE type_t.chr80,
   inbacrtdt LIKE inba_t.inbacrtdt,
   inbacrtid LIKE inba_t.inbacrtid,
   inbacrtid_desc LIKE type_t.chr80,
   inbamodid LIKE inba_t.inbamodid,
   inbamodid_desc LIKE type_t.chr80,
   inbacnfdt LIKE inba_t.inbacnfdt,
   inbamoddt LIKE inba_t.inbamoddt,
   inbapstid LIKE inba_t.inbapstid,
   inbapstid_desc LIKE type_t.chr80,
   inbacnfid LIKE inba_t.inbacnfid,
   inbacnfid_desc LIKE type_t.chr80,
   inbapstdt LIKE inba_t.inbapstdt
       END RECORD

#單身 type 宣告
PRIVATE TYPE type_g_inbb_d        RECORD
       inbbsite LIKE inbb_t.inbbsite,
   inbbseq LIKE inbb_t.inbbseq,
   inbb026 LIKE inbb_t.inbb026,
   inbb001 LIKE inbb_t.inbb001,
   inbb001_desc LIKE type_t.chr500,
   imaal004 LIKE type_t.chr500,
   inbb002 LIKE inbb_t.inbb002,
   inbb002_desc LIKE type_t.chr500,
   inbb004 LIKE inbb_t.inbb004,
   inbb004_desc LIKE type_t.chr500,
   inbb007 LIKE inbb_t.inbb007,
   inbb007_desc LIKE type_t.chr500,
   inbb008 LIKE inbb_t.inbb008,
   inbb008_desc LIKE type_t.chr500,
   inbb009 LIKE inbb_t.inbb009,
   inbb010 LIKE inbb_t.inbb010,
   inbb010_desc LIKE type_t.chr500,
   inbb003 LIKE inbb_t.inbb003,
   inbb011 LIKE inbb_t.inbb011,
   inbb012 LIKE inbb_t.inbb012,
   inbb013 LIKE inbb_t.inbb013,
   inbb013_desc LIKE type_t.chr500,
   inbb014 LIKE inbb_t.inbb014,
   inbb015 LIKE inbb_t.inbb015,
   inbb016 LIKE inbb_t.inbb016,
   inbb016_desc LIKE type_t.chr500,
   inbb017 LIKE inbb_t.inbb017,
   inbb018 LIKE inbb_t.inbb018,
   inbb019 LIKE inbb_t.inbb019,
   inbb023 LIKE inbb_t.inbb023,
   inbb023_desc LIKE type_t.chr500,
   inbb024 LIKE inbb_t.inbb024,
   inbb024_desc LIKE type_t.chr500,
   inbb025 LIKE inbb_t.inbb025,
   inbb025_desc LIKE type_t.chr500,
   inbb020 LIKE inbb_t.inbb020,
   inbb204 LIKE inbb_t.inbb204,
   inbb022 LIKE inbb_t.inbb022,
   inbb021 LIKE inbb_t.inbb021,
   ooff013 LIKE type_t.chr500
       END RECORD


PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_inbadocno LIKE inba_t.inbadocno,
      b_inbadocdt LIKE inba_t.inbadocdt,
      b_inba002 LIKE inba_t.inba002,
      b_inba003 LIKE inba_t.inba003,
   b_inba003_desc LIKE type_t.chr80,
      b_inba004 LIKE inba_t.inba004,
   b_inba004_desc LIKE type_t.chr80
       END RECORD

#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
 TYPE type_g_inbc_d        RECORD
    inbcseq       LIKE inbc_t.inbcseq,
    inbcseq1      LIKE inbc_t.inbcseq1,
    inbc018       LIKE inbc_t.inbc018,
    inbc019       LIKE inbc_t.inbc019,
    inbc020       LIKE inbc_t.inbc020,
    inbc020_desc  LIKE type_t.chr80,
    inbc001       LIKE inbc_t.inbc001,
    inbc001_desc  LIKE imaal_t.imaal003,
    inbc001_desc2 LIKE imaal_t.imaal004,
    inbc002       LIKE inbc_t.inbc002,
    inbc002_desc  LIKE type_t.chr80,
    inbc004       LIKE inbc_t.inbc004,
    inbc003       LIKE inbc_t.inbc003,
    inbc005       LIKE inbc_t.inbc005,
    inbc005_desc  LIKE type_t.chr80,
    inbc006       LIKE inbc_t.inbc006,
    inbc006_desc  LIKE type_t.chr80,
    inbc007       LIKE inbc_t.inbc007,
    inbc009       LIKE inbc_t.inbc009,
    inbc009_desc  LIKE type_t.chr80,
    inbc010       LIKE inbc_t.inbc010,
    inbc011       LIKE inbc_t.inbc011,
    inbc011_desc  LIKE type_t.chr80,
    inbc015       LIKE inbc_t.inbc015,
    inbc021       LIKE inbc_t.inbc021,
    inbc021_desc  LIKE pjbal_t.pjbal003,
    inbc022       LIKE inbc_t.inbc022,
    inbc022_desc  LIKE pjbbl_t.pjbbl004,
    inbc023       LIKE inbc_t.inbc023,
    inbc023_desc  LIKE pjbml_t.pjbml004,
    inbc203       LIKE inbc_t.inbc203,  #160512-00004#2-add
    inbc016       LIKE inbc_t.inbc016,
    inbc017       LIKE inbc_t.inbc017
       END RECORD

# TYPE type_g_inao_d        RECORD
#    inaoseq       LIKE inao_t.inaoseq,
#    inaoseq1      LIKE inao_t.inaoseq1,
#    inaoseq2      LIKE inao_t.inaoseq2,
#    inao001       LIKE inao_t.inao001,
#    inao001_desc  LIKE imaal_t.imaal003,
#    inao001_desc2 LIKE imaal_t.imaal004,
#    inao008       LIKE inao_t.inao008,
#    inao009       LIKE inao_t.inao009,
#    inao010       LIKE inao_t.inao010,
#    inao012       LIKE inao_t.inao012
#       END RECORD

 TYPE type_g_inao_d2        RECORD
    inaoseq_1       LIKE inao_t.inaoseq,
    inaoseq1_1      LIKE inao_t.inaoseq1,
    inaoseq2_1      LIKE inao_t.inaoseq2,
    inao001_1       LIKE inao_t.inao001,
    inao001_1_desc  LIKE imaal_t.imaal003,
    inao001_1_desc2 LIKE imaal_t.imaal004,
    inao008_1       LIKE inao_t.inao008,
    inao009_1       LIKE inao_t.inao009,
    inao010_1       LIKE inao_t.inao010,
    inao012_1       LIKE inao_t.inao012
       END RECORD
DEFINE g_inbc_d          DYNAMIC ARRAY OF type_g_inbc_d
#DEFINE g_inao_d          DYNAMIC ARRAY OF type_g_inao_d
DEFINE g_inao_d2         DYNAMIC ARRAY OF type_g_inao_d2
#170524-00059#1-S mark
#DEFINE l_ac2                 LIKE type_t.num5
#DEFINE l_ac3                 LIKE type_t.num5
#DEFINE l_ac4                 LIKE type_t.num5
#DEFINE g_rec_b2              LIKE type_t.num5
#DEFINE g_rec_b3              LIKE type_t.num5
#DEFINE g_rec_b4              LIKE type_t.num5
#170524-00059#1-E mark
#170524-00059#1-S add
DEFINE l_ac2                 LIKE type_t.num10
DEFINE l_ac3                 LIKE type_t.num10
DEFINE l_ac4                 LIKE type_t.num10
DEFINE g_rec_b2              LIKE type_t.num10
DEFINE g_rec_b3              LIKE type_t.num10
DEFINE g_rec_b4              LIKE type_t.num10
#170524-00059#1-E add
DEFINE g_type     LIKE type_t.chr1   #'1'時代表是 庫存雜項發料維護作業  '2'時代表是 庫存雜項收料維護作業
DEFINE g_acc      LIKE gzcb_t.gzcb007
DEFINE g_ooef025  LIKE ooef_t.ooef025  #品管參照表號
DEFINE g_flag     LIKE type_t.num5

GLOBALS
   DEFINE g_d_idx_display   LIKE type_t.num5   #製造批序號明細所在筆數
   DEFINE g_d_cnt_display   LIKE type_t.num5   #製造批序號明細總筆數
   DEFINE g_appoint_idx     LIKE type_t.num5   #指定進入單身行數
# TYPE type_g_inao_d        RECORD
#    inaoseq       LIKE inao_t.inaoseq,
#    inaoseq1      LIKE inao_t.inaoseq1,
#    inaoseq2      LIKE inao_t.inaoseq2,
#    inao001       LIKE inao_t.inao001,
#    inao001_desc  LIKE imaal_t.imaal003,
#    inao001_desc2 LIKE imaal_t.imaal004,
#    inao008       LIKE inao_t.inao008,
#    inao009       LIKE inao_t.inao009,
#    inao010       LIKE inao_t.inao010,
#    inao012       LIKE inao_t.inao012
#       END RECORD
 TYPE type_g_inao_d        RECORD
    inao000           LIKE inao_t.inao000,
    inao013           LIKE inao_t.inao013,
    inaodocno         LIKE inao_t.inaodocno,
    inaoseq           LIKE inao_t.inaoseq,
    inaoseq1          LIKE inao_t.inaoseq1,
    inaoseq2          LIKE inao_t.inaoseq2,
    inao001           LIKE inao_t.inao001,
    inao001_desc      LIKE type_t.chr500,
    inao001_desc_desc LIKE type_t.chr500,
    inao008           LIKE inao_t.inao008,
    inao009           LIKE inao_t.inao009,
    inao012           LIKE inao_t.inao012,
    inao010           LIKE inao_t.inao010,
    inao011           LIKE inao_t.inao011
                  END RECORD
DEFINE g_inao_d          DYNAMIC ARRAY OF type_g_inao_d
DEFINE g_inao_d_t        type_g_inao_d
END GLOBALS
DEFINE  g_imaf055     LIKE imaf_t.imaf055   #160519-00008#1
DEFINE  g_bas_0043    LIKE type_t.chr80     #160815-00028#1
#161007-00012#3-s-add
DEFINE  g_bas_0044     LIKE type_t.chr80     #VMI結算庫位Tag
DEFINE  g_inbb007_type LIKE type_t.num5
#161007-00012#3-e-add
DEFINE  g_docdt        LIKE type_t.dat       #170405-00051#1 add #關帳日期
DEFINE  g_field              STRING          #170509-00052#1
#161031-00025#7---s
GLOBALS
TYPE type_g_ooff_d        RECORD
       ooff001 LIKE ooff_t.ooff001,
   ooff002 LIKE ooff_t.ooff002,
   ooff004 LIKE ooff_t.ooff004,
   ooff005 LIKE ooff_t.ooff005,
   ooff006 LIKE ooff_t.ooff006,
   ooff007 LIKE ooff_t.ooff007,
   ooff008 LIKE ooff_t.ooff008,
   ooff009 LIKE ooff_t.ooff009,
   ooff010 LIKE ooff_t.ooff010,
   ooff011 LIKE ooff_t.ooff011,
   ooff003 LIKE ooff_t.ooff003,
   ooff012 LIKE ooff_t.ooff012,
   ooff013 LIKE ooff_t.ooff013,
   ooff014 LIKE ooff_t.ooff014
       END RECORD

DEFINE g_ooff_d4          DYNAMIC ARRAY OF type_g_ooff_d

DEFINE g_detail_insert   LIKE type_t.num5   #單身的新增權限
DEFINE g_detail_delete   LIKE type_t.num5   #單身的刪除權限
DEFINE g_wc2_i36001      STRING             #备注单身QBE條件
DEFINE g_d_idx_i36001    LIKE type_t.num5   #备注单身所在筆數
DEFINE g_d_cnt_i36001    LIKE type_t.num5   #备注单身總筆數
DEFINE g_appoint_idx     LIKE type_t.num5   #指定進入單身行數
DEFINE g_ooff001_d       LIKE ooff_t.ooff001
DEFINE g_ooff002_d       LIKE ooff_t.ooff002
DEFINE g_ooff003_d       LIKE ooff_t.ooff003
DEFINE g_ooff004_d       LIKE ooff_t.ooff004
DEFINE g_ooff005_d       LIKE ooff_t.ooff005
DEFINE g_ooff006_d       LIKE ooff_t.ooff006
DEFINE g_ooff007_d       LIKE ooff_t.ooff007
DEFINE g_ooff008_d       LIKE ooff_t.ooff008
DEFINE g_ooff009_d       LIKE ooff_t.ooff009
DEFINE g_ooff010_d       LIKE ooff_t.ooff010
DEFINE g_ooff011_d       LIKE ooff_t.ooff011
DEFINE g_ls_js           STRING   #170331-00022#1 add
END GLOBALS
DEFINE g_detail_id          STRING           #紀錄停留在哪個Page
#161031-00025#7---e

#170331-00022#1-S
DEFINE l_tran   RECORD
          prog       STRING,
          inbb022    LIKE inbb_t.inbb022
       END RECORD
#170331-00022#1-E
DEFINE g_hidden          LIKE type_t.num5    #170710-00045#3 add 判斷瀏覽頁簽是否關閉整單操作功能
#end add-point

#模組變數(Module Variables)
DEFINE g_inba_m          type_g_inba_m
DEFINE g_inba_m_t        type_g_inba_m
DEFINE g_inba_m_o        type_g_inba_m
DEFINE g_inba_m_mask_o   type_g_inba_m #轉換遮罩前資料
DEFINE g_inba_m_mask_n   type_g_inba_m #轉換遮罩後資料

   DEFINE g_inbadocno_t LIKE inba_t.inbadocno


DEFINE g_inbb_d          DYNAMIC ARRAY OF type_g_inbb_d
DEFINE g_inbb_d_t        type_g_inbb_d
DEFINE g_inbb_d_o        type_g_inbb_d
DEFINE g_inbb_d_mask_o   DYNAMIC ARRAY OF type_g_inbb_d #轉換遮罩前資料
DEFINE g_inbb_d_mask_n   DYNAMIC ARRAY OF type_g_inbb_d #轉換遮罩後資料


DEFINE g_browser         DYNAMIC ARRAY OF type_browser
DEFINE g_browser_f       DYNAMIC ARRAY OF type_browser


DEFINE g_wc                  STRING
DEFINE g_wc_t                STRING
DEFINE g_wc2                 STRING                          #單身CONSTRUCT結果
DEFINE g_wc2_table1          STRING


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

{<section id="aint302.main" >}
#應用 a26 樣板自動產生(Version:7)
#+ 作業開始(主程式類型)
MAIN
   #add-point:main段define(客製用) name="main.define_customerization"

   #end add-point
   #add-point:main段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="main.define"
   DEFINE l_success    LIKE type_t.num5   #add--2015/03/19 By shiun
   #end add-point

   OPTIONS
   INPUT NO WRAP
   DEFER INTERRUPT

   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log

   #依模組進行系統初始化設定(系統設定)
   CALL cl_ap_init("ain","")

   #add-point:作業初始化 name="main.init"
   IF NOT cl_null(g_argv[1]) THEN
      LET g_type = g_argv[1]
   END IF

   IF NOT cl_null(g_argv[02]) THEN
      LET g_inba_m.inbadocno = g_argv[02]
   END IF
   LET g_acc = ''
   #抓取[T:系統分類值檔].[C:系統分類碼]=24且[T:系統分類值檔].[C:系統分類碼]=g_prog 的[T:系統分類值檔].[C:參考欄位二]的欄位值
   #SELECT gzcb004 INTO g_acc FROM gzcb_t WHERE gzcb001 = '24' AND gzcb002 = g_prog  #160816-00001#4  2016/08/19  By 08734 Mark
   LET g_acc = s_fin_get_scc_value('24',g_prog,'2')  #160816-00001#4  2016/08/19  By 08734 add

   LET g_ooef025 = ''
   SELECT ooef025 INTO g_ooef025 FROM ooef_t WHERE ooefent = g_enterprise AND ooef001 = g_site
   IF cl_null(g_ooef025) THEN
      LET g_ooef025 = ' '
   END IF
   CALL s_aooi390_cre_tmp_table() RETURNING l_success   #add--2015/03/19 By shiun
   CALL cl_get_para(g_enterprise,g_site,'S-MFG-0031') RETURNING g_docdt #170405-00051#1 add 關帳日期
   #end add-point



   #LOCK CURSOR (identifier)
   #add-point:SQL_define name="main.define_sql"

   #end add-point
   LET g_forupd_sql = " SELECT inbadocno,'',inbasite,inbadocdt,inba002,inba003,'',inba004,'',inbastus,
       inba005,inba006,inba007,'',inba008,inbaownid,'',inbacrtdp,'',inbaowndp,'',inbacrtdt,inbacrtid,
       '',inbamodid,'',inbacnfdt,inbamoddt,inbapstid,'',inbacnfid,'',inbapstdt",
                      " FROM inba_t",
                      " WHERE inbaent= ? AND inbadocno=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"

   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE aint302_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR

   LET g_sql = " SELECT DISTINCT t0.inbadocno,t0.inbasite,t0.inbadocdt,t0.inba002,t0.inba003,t0.inba004,
       t0.inbastus,t0.inba005,t0.inba006,t0.inba007,t0.inba008,t0.inbaownid,t0.inbacrtdp,t0.inbaowndp,
       t0.inbacrtdt,t0.inbacrtid,t0.inbamodid,t0.inbacnfdt,t0.inbamoddt,t0.inbapstid,t0.inbacnfid,t0.inbapstdt,
       t1.ooag011 ,t2.ooefl003 ,t3.ooag011 ,t4.ooefl003 ,t5.ooefl003 ,t6.ooag011 ,t7.ooag011 ,t8.ooag011 ,
       t9.ooag011",
               " FROM inba_t t0",
                              " LEFT JOIN ooag_t t1 ON t1.ooagent="||g_enterprise||" AND t1.ooag001=t0.inba003  ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.inba004 AND t2.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t3 ON t3.ooagent="||g_enterprise||" AND t3.ooag001=t0.inbaownid  ",
               " LEFT JOIN ooefl_t t4 ON t4.ooeflent="||g_enterprise||" AND t4.ooefl001=t0.inbacrtdp AND t4.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t5 ON t5.ooeflent="||g_enterprise||" AND t5.ooefl001=t0.inbaowndp AND t5.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t6 ON t6.ooagent="||g_enterprise||" AND t6.ooag001=t0.inbacrtid  ",
               " LEFT JOIN ooag_t t7 ON t7.ooagent="||g_enterprise||" AND t7.ooag001=t0.inbamodid  ",
               " LEFT JOIN ooag_t t8 ON t8.ooagent="||g_enterprise||" AND t8.ooag001=t0.inbapstid  ",
               " LEFT JOIN ooag_t t9 ON t9.ooagent="||g_enterprise||" AND t9.ooag001=t0.inbacnfid  ",

               " WHERE t0.inbaent = " ||g_enterprise|| " AND t0.inbadocno = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"

   #end add-point
   PREPARE aint302_master_referesh FROM g_sql




   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"

      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_aint302 WITH FORM cl_ap_formpath("ain",g_code)

      #瀏覽頁簽資料初始化
      CALL cl_ui_init()

      #程式初始化
      CALL aint302_init()

      #進入選單 Menu (="N")
      CALL aint302_ui_dialog()

      #add-point:畫面關閉前 name="main.before_close"
      CALL s_lot_ins_drop_tmp()
      CALL s_lot_sel_drop_tmp()

      #end add-point

      #畫面關閉
      CLOSE WINDOW w_aint302

   END IF

   CLOSE aint302_cl



   #add-point:作業離開前 name="main.exit"
   CALL s_aooi390_drop_tmp_table()   #add--2015/03/19 By shiun
   #end add-point

   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN




{</section>}

{<section id="aint302.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION aint302_init()
   #add-point:init段define(客製用) name="init.define_customerization"

   #end add-point
   #add-point:init段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   DEFINE l_title      LIKE gzzd_t.gzzd005   #160907-00019#1 add
   #end add-point

   #add-point:Function前置處理  name="init.pre_function"

   #end add-point

   LET g_bfill       = "Y"
   LET g_detail_idx  = 1 #第一層單身指標
   LET g_detail_idx2 = 1 #第二層單身指標

   #各個page指標
   LET g_detail_idx_list[1] = 1

   LET g_error_show  = 1
   LET l_ac = 1 #單身指標
   LET g_err_rec = "N"   #161130-00056
      CALL cl_set_combo_scc_part('inbastus','13','N,S,Y,A,D,R,W,Z,X')

      CALL cl_set_combo_scc('inba005','2051')

   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件

   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")


   #add-point:畫面資料初始化 name="init.init"
   LET g_hidden = 0   #170710-00045#3 add
   #161031-00025#7----s
   #子程式畫面取代主程式元件
   CALL cl_ui_replace_sub_window(cl_ap_formpath("aoo", "aooi360_01"), "grid_memo", "Table", "s_detail1_aooi360_01")
   CALL cl_set_combo_scc_part('ooff012','11','1,2,4')
   CALL cl_set_comp_visible("ooff003",FALSE)
   #161031-00025#7---e
   CALL cl_set_toolbaritem_visible("s_lot_ins,s_lot_sel,s_lot_sel1",TRUE)
   #aint301單身異動申請明細頁籤與入庫明細頁籤的[有效日期]、[存貨備註]欄位需隱藏不可維護
   #IF g_argv[1] = '1' THEN   #161109-00032#1  mark
   IF g_argv[1] = '1' OR g_argv[1] = '3' THEN  #161109-00032#1
      CALL cl_set_comp_visible("inbb021,inbb022,inbc016,inbc017",FALSE)
      CALL cl_set_comp_visible("inbb204,inbb203",FALSE) #製造日期 160512-00004#2-add
      CALL cl_set_toolbaritem_visible("s_lot_ins",FALSE)
   ELSE
      CALL cl_set_toolbaritem_visible("s_lot_sel1",FALSE)
   END IF
   #170330-00078#1 add(S)
   IF g_argv[1] = '1' THEN
      CALL cl_set_comp_visible("inbc203,inao010_1",FALSE)
   END IF
   #170330-00078#1 add(E)
   #160811-00014#2--dongsz add--s
   #CALL cl_set_toolbaritem_visible("scan_barcode",FALSE)   #160831-00070#4 Mark By Ken 161003
   #IF g_argv[1] = '1' THEN                                 #160831-00070#4 Mark By Ken 161003
      CALL cl_set_toolbaritem_visible("scan_barcode",TRUE)
   #END IF                                                  #160831-00070#4 Mark By Ken 161003
   #160811-00014#2--dongsz add--e

   #判斷據點參數若不使用參考單位時，則參考單位、數量需隱藏不可以維護(據點參數:S-BAS-0028)
   IF cl_get_para(g_enterprise,g_site,'S-BAS-0028') = 'N' THEN
      #CALL cl_set_comp_visible("inbb013,inbb013_desc,inbb014,inbb015",FALSE)  #170509-00033#1 mark
      CALL cl_set_comp_visible("inbb013,inbb013_desc,inbb014,inbb015,inbc011,inbc011_desc,inbc015",FALSE)  #170509-00033#1 add
   END IF

   #判斷據點參數若不使用產品特徵時，則產品特徵需隱藏不可以維護(據點參數:S-BAS-0036)
   IF cl_get_para(g_enterprise,g_site,'S-BAS-0036') = 'N' THEN
      CALL cl_set_comp_visible("inbb002,inbb002_desc,inbc002,inbc002_desc",FALSE)
   END IF

   CALL cl_ui_replace_sub_window(cl_ap_formpath("sub", "s_lot_s01"), "grid_s_lot", "Table", "s_detail1_s_lot_s01")

   CALL s_lot_ins_create_tmp()
   CALL s_lot_sel_create_tmp()
   #160815-00028#1-s
   LET g_bas_0043 = ''
   LET g_bas_0043 = cl_get_para(g_enterprise,g_site,'S-BAS-0043')  #VMI存貨庫位Tag
   #160815-00028#1-e
   LET g_bas_0044 = cl_get_para(g_enterprise,g_site,'S-BAS-0044')  #VMI結算庫位Tag  #161007-00012#3-add

   #add by lixh 20150818
#   IF g_prog = 'aint301' THEN
#      CALL cl_set_act_visible("gen_qc,qc_query,storage_by_qc",FALSE)
#   END IF
   #add by lixh 20150818

   #160907-00019#1 --- add (S)
   LET l_title = ''
   IF g_type = '1' THEN    #雜項發料 aint301
      SELECT gzzd005 INTO l_title FROM gzzd_t
       WHERE gzzdstus = 'Y'
         AND gzzd001  = 'aint302'
         AND gzzd002  = g_lang
         AND gzzd003  = 'page_3_1'
      CALL cl_set_comp_att_text('page_3',l_title)
      LET l_title = ''
      SELECT gzzd005 INTO l_title FROM gzzd_t
       WHERE gzzdstus = 'Y'
         AND gzzd001  = 'aint302'
         AND gzzd002  = g_lang
         AND gzzd003  = 'page_5_1'
      CALL cl_set_comp_att_text('page_5',l_title)
   END IF
   IF g_type = '2' THEN    #雜項收料 aint302
      SELECT gzzd005 INTO l_title FROM gzzd_t
       WHERE gzzdstus = 'Y'
         AND gzzd001  = 'aint302'
         AND gzzd002  = g_lang
         AND gzzd003  = 'page_3_2'
      CALL cl_set_comp_att_text('page_3',l_title)
      LET l_title = ''
      SELECT gzzd005 INTO l_title FROM gzzd_t
       WHERE gzzdstus = 'Y'
         AND gzzd001  = 'aint302'
         AND gzzd002  = g_lang
         AND gzzd003  = 'page_5_2'
      CALL cl_set_comp_att_text('page_5',l_title)
   END IF
   #160907-00019#1 --- add (E)
   #161109-00032#1-S
   LET l_title = ''
   IF g_type = '3' THEN    #雜項發料 aint301
      SELECT gzzd005 INTO l_title FROM gzzd_t
       WHERE gzzdstus = 'Y'
         AND gzzd001  = 'aint302'
         AND gzzd002  = g_lang
         AND gzzd003  = 'page_3_3'
      CALL cl_set_comp_att_text('page_3',l_title)
      LET l_title = ''
      SELECT gzzd005 INTO l_title FROM gzzd_t
       WHERE gzzdstus = 'Y'
         AND gzzd001  = 'aint302'
         AND gzzd002  = g_lang
         AND gzzd003  = 'page_5_3'
      CALL cl_set_comp_att_text('page_5',l_title)
   END IF
   IF g_type = '4' THEN    #雜項收料 aint302
      SELECT gzzd005 INTO l_title FROM gzzd_t
       WHERE gzzdstus = 'Y'
         AND gzzd001  = 'aint302'
         AND gzzd002  = g_lang
         AND gzzd003  = 'page_3_4'
      CALL cl_set_comp_att_text('page_3',l_title)
      LET l_title = ''
      SELECT gzzd005 INTO l_title FROM gzzd_t
       WHERE gzzdstus = 'Y'
         AND gzzd001  = 'aint302'
         AND gzzd002  = g_lang
         AND gzzd003  = 'page_5_4'
      CALL cl_set_comp_att_text('page_5',l_title)
   END IF
   #161109-00032#1-S
   #170323-00026#1 add s---
   IF g_type = '1' THEN
      CALL cl_set_toolbaritem_visible("storage_by_qc,aint302_01",FALSE)
   END IF
   IF g_type = '2' THEN
      CALL cl_set_toolbaritem_visible("storage_by_qc_1,aint302_01_1",FALSE)
   END IF
   #170323-00026#1 add e---

   #170310-00005#25 add s
   IF g_prog <> 'abct302' THEN
      CALL cl_set_comp_visible("inbb026",FALSE)
   END IF
   #170310-00005#25 add e

   #end add-point

   #初始化搜尋條件
   CALL aint302_default_search()

END FUNCTION

{</section>}

{<section id="aint302.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION aint302_ui_dialog()
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
   DEFINE l_success LIKE type_t.num5
   DEFINE l_amount  LIKE inbb_t.inbb011
   DEFINE l_inbc018 LIKE inbc_t.inbc018
   DEFINE l_inao012 LIKE inao_t.inao012
   DEFINE l_inao012_2 LIKE inao_t.inao012  #add by lixh 20151223
   DEFINE l_imaf053 LIKE imaf_t.imaf053
   DEFINE l_imaf054 LIKE imaf_t.imaf054
   DEFINE l_cnt     LIKE type_t.num5
   #end add-point

   #add-point:Function前置處理  name="ui_dialog.pre_function"
   #170710-00045#3 add(s)
   IF g_default THEN
      LET g_hidden = 1
   ELSE
      LET g_hidden = 0
   END IF
   #170710-00045#3 add(e)
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
            CALL aint302_insert()
            #add-point:ON ACTION insert name="menu.default.insert"

            #END add-point
         END IF

      #add-point:action default自訂 name="ui_dialog.action_default"

      #end add-point
      OTHERWISE
   END CASE




   LET lb_first = TRUE

   #add-point:ui_dialog段before dialog  name="ui_dialog.before_dialog"
   #add by lixh 20150901
   CALL cl_set_toolbaritem_visible("s_lot_ins,s_lot_sel,s_lot_sel1",TRUE)
   #aint301單身異動申請明細頁籤與入庫明細頁籤的[有效日期]、[存貨備註]欄位需隱藏不可維護
   #IF g_argv[1] = '1' THEN                     #161109-00032#1 mark
   IF g_argv[1] = '1' OR  g_argv[1] = '3' THEN  #161109-00032#1
      #CALL cl_set_comp_visible("inbb021,inbb022,inbc016,inbc017",FALSE)
      CALL cl_set_toolbaritem_visible("s_lot_ins",FALSE)
   ELSE
      CALL cl_set_toolbaritem_visible("s_lot_sel1",FALSE)
   END IF
   #add by lixh 20150901
   #end add-point

   WHILE TRUE

      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_browser.clear()
         INITIALIZE g_inba_m.* TO NULL
         CALL g_inbb_d.clear()

         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL aint302_init()
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

               CALL aint302_fetch('') # reload data
               LET l_ac = 1
               CALL aint302_ui_detailshow() #Setting the current row

               CALL aint302_idx_chk()
               #NEXT FIELD inbbseq

               ON ACTION qbefield_user   #欄位隱藏設定
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
         END DISPLAY

         DISPLAY ARRAY g_inbb_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1

            BEFORE ROW
               #顯示單身筆數
               CALL aint302_idx_chk()
               #確定當下選擇的筆數
               LET l_ac = DIALOG.getCurrentRow("s_detail1")
               LET g_detail_idx = l_ac
               LET g_detail_idx_list[1] = l_ac
               CALL g_idx_group.addAttribute("'1',",l_ac)

               #add-point:page1, before row動作 name="ui_dialog.page1.before_row"
              #160411-00009#1
#              IF g_argv[1] = '1' THEN
#                 CALL s_lot_b_fill('2',g_site,'1',g_inba_m.inbadocno,'','','-1')
#              ELSE
#                 CALL s_lot_b_fill('2',g_site,'1',g_inba_m.inbadocno,'','','1')
#              END IF
#              CALL aint302_inao_fill2()
              #160411-00009#1
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
               CALL aint302_idx_chk()
               #add-point:page1自定義行為 name="ui_dialog.page1.before_display"
               CALL cl_set_act_visible("s_lot_ins,s_lot_sel,s_lot_sel1",TRUE)
               CALL aint302_set_act_no_visible_b()   #add by lixh 20151010
               IF NOT cl_null(g_inba_m.inbadocno) THEN      #160630-00039#1 add
                  #160411-00009#1
                  #IF g_argv[1] = '1' THEN   #161109-00032#1   #161109-00032#1 mark
                  IF g_argv[1] = '1' OR g_argv[1] = '3' THEN   #161109-00032#1
                     CALL s_lot_b_fill('2',g_site,'1',g_inba_m.inbadocno,'','','-1')
                  ELSE
                     CALL s_lot_b_fill('2',g_site,'1',g_inba_m.inbadocno,'','','1')
                  END IF
               END IF              #160630-00039#1 add
               CALL aint302_inao_fill2()
               #160411-00009#1
               #end add-point

            #自訂ACTION(detail_show,page_1)


         #應用 a43 樣板自動產生(Version:4)
         ON ACTION s_lot_sel1
            LET g_action_choice="s_lot_sel1"
            IF cl_auth_chk_act("s_lot_sel1") THEN

               #add-point:ON ACTION s_lot_sel1 name="menu.detail_show.page1.s_lot_sel1"
#               IF cl_null(g_detail_idx) OR g_detail_idx = 0 OR g_prog = 'aint302' THEN        #160623-00014#1-mod-(S)
                #IF cl_null(g_detail_idx) OR g_detail_idx = 0 OR g_prog MATCHES 'aint302' THEN  #160623-00014#1-mod-(E)
#                IF cl_null(g_detail_idx) OR g_detail_idx = 0 OR g_prog MATCHES 'aint302' OR g_prog MATCHES 'apjt600' THEN   #161109-00032#1 #170217-00068#3
                IF cl_null(g_detail_idx) OR g_detail_idx = 0
                   OR g_prog MATCHES 'aint302*'
                   OR g_prog MATCHES 'abct302*'  #170310-00005#25 add
                   OR g_prog MATCHES 'apjt600*' THEN

                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'abm-00073'
                  LET g_errparam.extend = ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  EXIT DIALOG
               END IF

               IF g_inba_m.inbastus <> 'N' THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'apm-00035'
                  LET g_errparam.extend = ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  EXIT DIALOG
               END IF
               IF aint302_get_imaf071_imaf081() THEN  #160602-00018#1
                  IF NOT cl_null(g_inba_m.inbadocno) AND
                     NOT cl_null(g_inbb_d[g_detail_idx].inbbseq) AND
                     NOT cl_null(g_inbb_d[g_detail_idx].inbb001) AND
                     NOT cl_null(g_inbb_d[g_detail_idx].inbb010) AND
                     NOT cl_null(g_inbb_d[g_detail_idx].inbb011) AND
                     NOT cl_null(g_inba_m.inba003) THEN
                     LET l_success = ''
                     CALL s_transaction_begin()
                     #CALL s_lot_sel('1','1',g_site,g_inba_m.inbadocno,g_inbb_d[g_detail_idx].inbbseq,'0',g_inbb_d[g_detail_idx].inbb001,g_inbb_d[g_detail_idx].inbb002,g_inbb_d[g_detail_idx].inbb003,g_inbb_d[g_detail_idx].inbb007,g_inbb_d[g_detail_idx].inbb008,g_inbb_d[g_detail_idx].inbb009,g_inbb_d[g_detail_idx].inbb010,g_inbb_d[g_detail_idx].inbb011,'-1','aint301','')
                     CALL s_lot_sel('1','1',g_site,g_inba_m.inbadocno,g_inbb_d[g_detail_idx].inbbseq,'1',g_inbb_d[g_detail_idx].inbb001,g_inbb_d[g_detail_idx].inbb002,g_inbb_d[g_detail_idx].inbb003,g_inbb_d[g_detail_idx].inbb007,g_inbb_d[g_detail_idx].inbb008,g_inbb_d[g_detail_idx].inbb009,g_inbb_d[g_detail_idx].inbb010,g_inbb_d[g_detail_idx].inbb011,'-1','aint301','','','','','0')   #add by lixh 20150901
                          RETURNING l_success

                     #add by lixh 20150909
                     IF NOT aint302_ins_inao_2() THEN
                     END IF
                     #add by lixh 20150909
                     CALL aint302_inao_fill2()   #add by lixh 20151010
                     IF l_success THEN
                        CALL s_transaction_end('Y','0')
                     ELSE
                        CALL s_transaction_end('N','0')
                     END IF
                     #add by lixh 20151010
                     #組合新增資料的條件
                     LET g_add_browse = " inbaent = '" ||g_enterprise|| "' AND",
                         " inbadocno = '", g_inba_m.inbadocno, "' "

                     LET g_current_row = g_current_idx #目前指標
                      #add by lixh 20151010
                  END IF
               END IF  #160602-00018#1
               #END add-point

            END IF




         #應用 a43 樣板自動產生(Version:4)
         ON ACTION s_lot_ins
            LET g_action_choice="s_lot_ins"
            IF cl_auth_chk_act("s_lot_ins") THEN

               #add-point:ON ACTION s_lot_ins name="menu.detail_show.page1.s_lot_ins"


               IF aint302_get_imaf071_imaf081() THEN  #160602-00018#1
#               IF cl_null(g_detail_idx) OR g_detail_idx = 0 OR g_prog = 'aint301' THEN        #160623-00014#1-mod-(S)
               #IF cl_null(g_detail_idx) OR g_detail_idx = 0 OR g_prog MATCHES 'aint301' THEN  #160623-00014#1-mod-(E)     #161109-00032#1  mark
#                IF cl_null(g_detail_idx) OR g_detail_idx = 0 OR g_prog MATCHES 'aint301' OR g_prog MATCHES 'apjt500' THEN  #161109-00032#1  #170217-00068#3
                IF cl_null(g_detail_idx) OR g_detail_idx = 0 OR g_prog MATCHES 'aint301*' OR g_prog MATCHES 'apjt500*' THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'abm-00073'
                  LET g_errparam.extend = ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  #add by lixh 20151010
                  #組合新增資料的條件
                  LET g_add_browse = " inbaent = '" ||g_enterprise|| "' AND",
                      " inbadocno = '", g_inba_m.inbadocno, "' "

                  LET g_current_row = g_current_idx #目前指標
                   #add by lixh 20151010
                  EXIT DIALOG
               END IF

               IF g_inba_m.inbastus <> 'N' THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'apm-00035'
                  LET g_errparam.extend = ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  #add by lixh 20151010
                  #組合新增資料的條件
                  LET g_add_browse = " inbaent = '" ||g_enterprise|| "' AND",
                      " inbadocno = '", g_inba_m.inbadocno, "' "

                  LET g_current_row = g_current_idx #目前指標
                   #add by lixh 20151010
                  EXIT DIALOG
               END IF

               IF NOT cl_null(g_inba_m.inbadocno) AND
                  NOT cl_null(g_inbb_d[g_detail_idx].inbbseq) AND
                  NOT cl_null(g_inbb_d[g_detail_idx].inbb001) AND
                  NOT cl_null(g_inbb_d[g_detail_idx].inbb010) AND
                  NOT cl_null(g_inbb_d[g_detail_idx].inbb011) AND
                  NOT cl_null(g_inba_m.inba003) THEN
                  LET l_success = ''
                  LET l_amount = ''
                  CALL s_transaction_begin()
                  #170331-00022#1-S add
                  LET l_tran.prog = g_prog
                  LET l_tran.inbb022 = g_inbb_d[l_ac].inbb022
                  LET g_ls_js = util.JSON.stringify(l_tran)
                  #170331-00022#1-E add
                  #CALL s_lot_ins(g_site,g_inba_m.inbadocno,g_inbb_d[g_detail_idx].inbbseq,'0',g_inbb_d[g_detail_idx].inbb001,g_inbb_d[g_detail_idx].inbb002,g_inbb_d[g_detail_idx].inbb010,g_inbb_d[g_detail_idx].inbb011,'1',g_inba_m.inba003,'2','') #mark by lixh 20150909
                  CALL s_lot_ins(g_site,g_inba_m.inbadocno,g_inbb_d[g_detail_idx].inbbseq,'1',g_inbb_d[g_detail_idx].inbb001,g_inbb_d[g_detail_idx].inbb002,g_inbb_d[g_detail_idx].inbb010,g_inbb_d[g_detail_idx].inbb011,'1',g_inba_m.inba003,'1','',
                                 g_inbb_d[g_detail_idx].inbb007,g_inbb_d[g_detail_idx].inbb008,g_inbb_d[g_detail_idx].inbb009,g_inbb_d[g_detail_idx].inbb003)  #160316-00007#1 add by lixh 20160316 add inbb003   #add by lixh 20150909
                                 #add by lixh 201511106 add inbb007,inbb008,inbb009
                       RETURNING l_success,l_amount
                  IF l_success THEN
                  #add by lixh 20150909
                     IF NOT aint302_ins_inao_2() THEN
                        CALL s_transaction_end('N','0')
                        EXIT DIALOG
                     END IF
                  #add by lixh 20150909
                     #CALL s_transaction_end('Y','0')
                     IF g_inbb_d[g_detail_idx].inbb011 <> l_amount THEN
                        IF cl_ask_confirm('ain-00249') THEN
                           #170617-00536#1-S mark
                           #CALL s_aooi250_convert_qty(g_inbb_d[g_detail_idx].inbb010,g_inbb_d[g_detail_idx].inbb011,
                           #                           g_inbb_d[g_detail_idx].inbb013,g_inbb_d[g_detail_idx].inbb014)
                           # RETURNING l_success,g_inbb_d[g_detail_idx].inbb014
                           #170617-00536#1-E mark

                           #170617-00536#1-S add
                           IF NOT cl_null(g_inbb_d[g_detail_idx].inbb010) AND  NOT cl_null(g_inbb_d[g_detail_idx].inbb013) THEN
                              CALL s_aooi250_convert_qty(g_inbb_d[g_detail_idx].inbb001,g_inbb_d[g_detail_idx].inbb010,
                                                         g_inbb_d[g_detail_idx].inbb013,l_amount)
                                 RETURNING l_success,g_inbb_d[g_detail_idx].inbb014
                           END IF
                           #170617-00536#1-S add
                           UPDATE inbb_t SET inbb011 = l_amount,
                                             inbb012 = l_amount,     #add by lixh 20150820
                                             inbb019 = l_amount,     #add by lixh 20151010
                                             inbb014 = g_inbb_d[g_detail_idx].inbb014  #add by lixh 20150820
                            WHERE inbbent = g_enterprise AND inbbsite = g_site
                              AND inbbdocno = g_inba_m.inbadocno AND inbbseq = g_inbb_d[g_detail_idx].inbbseq
                           IF SQLCA.sqlcode THEN
                              INITIALIZE g_errparam TO NULL
                              LET g_errparam.code = SQLCA.sqlcode
                              LET g_errparam.extend = "inbb_t"
                              LET g_errparam.popup = FALSE
                              CALL cl_err()
                           #add by lixh 20150820
                           ELSE
                              LET g_inbb_d[g_detail_idx].inbb011 = l_amount
                              LET g_inbb_d[g_detail_idx].inbb012 = l_amount
                              #add by lixh 20101010
                              UPDATE inbc_t SET inbc010 = l_amount
                               WHERE inbcent = g_enterprise AND inbcsite = g_site
                                 AND inbcdocno = g_inba_m.inbadocno AND inbcseq = g_inbb_d[g_detail_idx].inbbseq
                              LET g_inbc_d[g_detail_idx].inbc010 = l_amount
                              #add by lixh 20101010
                           #add by lixh 20150820
                           END IF
                        END IF
                     END IF
                     CALL aint302_inao_fill2()        #add by lixh 20151010
                     CALL s_transaction_end('Y','0')  #add by lixh 20150909
                  ELSE
                     CALL s_transaction_end('N','0')
                  END IF
                  #add by lixh 20151010
                  #組合新增資料的條件
                  LET g_add_browse = " inbaent = '" ||g_enterprise|| "' AND",
                      " inbadocno = '", g_inba_m.inbadocno, "' "

                  LET g_current_row = g_current_idx #目前指標
                   #add by lixh 20151010
               END IF
               END IF  #160602-00018#1
               #END add-point

            END IF





            #add-point:page1自定義行為 name="ui_dialog.page1.action"

            #end add-point

         END DISPLAY





         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         DISPLAY ARRAY g_inbc_d TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b2) #page2

         ON ACTION s_lot_sel
            LET g_action_choice="s_lot_sel"
            IF cl_auth_chk_act("s_lot_sel") THEN
               IF cl_null(g_detail_idx2) OR g_detail_idx2 = 0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'abm-00073'
                  LET g_errparam.extend = ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  EXIT DIALOG
               END IF

               IF g_inba_m.inbastus <> 'Y' THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ain-00024'
                  LET g_errparam.extend = ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  EXIT DIALOG
               END IF

               IF NOT cl_null(g_inbc_d[g_detail_idx2].inbcseq) THEN
                  IF aint302_get_imaf071_imaf081() THEN   #160602-00018#1
                  LET l_success = ''
                  LET l_cnt = 0
                  SELECT COUNT(*) INTO l_cnt FROM inao_t
                   WHERE inaoent = g_enterprise
                     AND inaosite = g_site
                     AND inaodocno = g_inba_m.inbadocno
                     AND inaoseq = g_inbc_d[g_detail_idx2].inbcseq
                     AND inao000 = '1'  #申請
                  IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
                  CALL s_transaction_begin()
                  #IF g_type = '1' THEN  #161109-00032#1
                  IF g_type = '1' OR g_type = '3' THEN  #161109-00032#1
#                     IF l_cnt <> 0 THEN     #add by lixh 20151010
#                     #add by lixh 20151223
#                        IF s_aint302_copy_inao(g_inba_m.inbadocno,g_inbc_d[g_detail_idx2].inbcseq,g_inbc_d[g_detail_idx2].inbcseq1,'-1',g_inbc_d[g_detail_idx2].inbc005,g_inbc_d[g_detail_idx2].inbc006,g_inbc_d[g_detail_idx2].inbc007,'-1') THEN
#                           IF g_inbc_d[g_detail_idx2].inbcseq1 = '1' THEN
#                              UPDATE inao_t SET inaoseq1 = '0'
#                               WHERE inaoent = g_enterprise
#                                 AND inaodocno = g_inba_m.inbadocno
#                                 AND inaoseq = g_inbc_d[g_detail_idx2].inbcseq
#                                 AND inaoseq1 = 1
#                                 AND inao000 = '2'
#                              CALL s_lot_sel('2','2',g_site,g_inba_m.inbadocno,g_inbc_d[g_detail_idx2].inbcseq,'0',g_inbc_d[g_detail_idx2].inbc001,g_inbc_d[g_detail_idx2].inbc002,g_inbc_d[g_detail_idx2].inbc003,g_inbc_d[g_detail_idx2].inbc005,g_inbc_d[g_detail_idx2].inbc006,g_inbc_d[g_detail_idx2].inbc007,g_inbc_d[g_detail_idx2].inbc009,g_inbc_d[g_detail_idx2].inbc010,'-1','aint301','','','','','0')
#                                   RETURNING l_success
#                           ELSE
#                              CALL s_lot_sel('2','2',g_site,g_inba_m.inbadocno,g_inbc_d[g_detail_idx2].inbcseq,g_inbc_d[g_detail_idx2].inbcseq1,g_inbc_d[g_detail_idx2].inbc001,g_inbc_d[g_detail_idx2].inbc002,g_inbc_d[g_detail_idx2].inbc003,g_inbc_d[g_detail_idx2].inbc005,g_inbc_d[g_detail_idx2].inbc006,g_inbc_d[g_detail_idx2].inbc007,g_inbc_d[g_detail_idx2].inbc009,g_inbc_d[g_detail_idx2].inbc010,'-1','aint301','','','','','0')
#                                   RETURNING l_success
#                           END IF
#                        END IF
#                        IF g_inbc_d[g_detail_idx2].inbcseq1 = '1' THEN
#                           IF NOT s_aint302_upd_inao(g_inba_m.inbadocno,g_inbc_d[g_detail_idx2].inbcseq,'0','-1',g_inbc_d[g_detail_idx2].inbc005,g_inbc_d[g_detail_idx2].inbc006,g_inbc_d[g_detail_idx2].inbc007,'1') THEN
#                              NEXT FIELD CURRENT
#                           END IF
#                        ELSE
#                           IF NOT s_aint302_upd_inao(g_inba_m.inbadocno,g_inbc_d[g_detail_idx2].inbcseq,g_inbc_d[g_detail_idx2].inbcseq1,'-1',g_inbc_d[g_detail_idx2].inbc005,g_inbc_d[g_detail_idx2].inbc006,g_inbc_d[g_detail_idx2].inbc007,'1') THEN
#                              NEXT FIELD CURRENT
#                           END IF
#                        END IF
#                        IF g_inbc_d[g_detail_idx2].inbcseq1 = '1' THEN
#                           UPDATE inao_t SET inaoseq1 = '1'
#                            WHERE inaoent = g_enterprise
#                              AND inaodocno = g_inba_m.inbadocno
#                              AND inaoseq = g_inbc_d[g_detail_idx2].inbcseq
#                              AND inao000 = '2'
#                              AND inaoseq1 = 0
#                           DELETE FROM inao_t
#                            WHERE inaoent = g_enterprise
#                              AND inaodocno = g_inba_m.inbadocno
#                              AND inaoseq = g_inbc_d[g_detail_idx2].inbcseq
#                              AND inao000 = '1'
#                              AND inaoseq1 = 0
#                        ELSE
#                           #delete 其他項序的申請資料
#                           DELETE FROM inao_t
#                            WHERE inaoent = g_enterprise
#                              AND inaodocno = g_inba_m.inbadocno
#                              AND inaoseq = g_inbc_d[g_detail_idx2].inbcseq
#                              AND inao000 = '1'
#                              AND inaoseq1 = g_inbc_d[g_detail_idx2].inbcseq1
#                        END IF
#                     #add by lixh 20151223
##                        CALL s_lot_sel('2','2',g_site,g_inba_m.inbadocno,g_inbc_d[g_detail_idx2].inbcseq,g_inbc_d[g_detail_idx2].inbcseq1,g_inbc_d[g_detail_idx2].inbc001,g_inbc_d[g_detail_idx2].inbc002,g_inbc_d[g_detail_idx2].inbc003,g_inbc_d[g_detail_idx2].inbc005,g_inbc_d[g_detail_idx2].inbc006,g_inbc_d[g_detail_idx2].inbc007,g_inbc_d[g_detail_idx2].inbc009,g_inbc_d[g_detail_idx2].inbc010,'-1','aint301','','','','','0')
##                             RETURNING l_success
#                     #add by lixh 20151010
#                     ELSE
#                        CALL s_lot_sel('1','2',g_site,g_inba_m.inbadocno,g_inbc_d[g_detail_idx2].inbcseq,g_inbc_d[g_detail_idx2].inbcseq1,g_inbc_d[g_detail_idx2].inbc001,g_inbc_d[g_detail_idx2].inbc002,g_inbc_d[g_detail_idx2].inbc003,g_inbc_d[g_detail_idx2].inbc005,g_inbc_d[g_detail_idx2].inbc006,g_inbc_d[g_detail_idx2].inbc007,g_inbc_d[g_detail_idx2].inbc009,g_inbc_d[g_detail_idx2].inbc010,'-1','aint301','','','','','0')
#                             RETURNING l_success
#                     END IF
                     #add by lixh 20160107 151228-00001/1
                     CALL s_lot_sel('1','2',g_site,g_inba_m.inbadocno,g_inbc_d[g_detail_idx2].inbcseq,g_inbc_d[g_detail_idx2].inbcseq1,g_inbc_d[g_detail_idx2].inbc001,g_inbc_d[g_detail_idx2].inbc002,g_inbc_d[g_detail_idx2].inbc003,g_inbc_d[g_detail_idx2].inbc005,g_inbc_d[g_detail_idx2].inbc006,g_inbc_d[g_detail_idx2].inbc007,g_inbc_d[g_detail_idx2].inbc009,g_inbc_d[g_detail_idx2].inbc010,'-1','aint301','','','','','0')
                          RETURNING l_success
                     #add by lixh 20160107 151228-00001/1
                     LET l_inao012 = 0
                     SELECT SUM(inao012) INTO l_inao012 FROM inao_t
                      WHERE inaoent = g_enterprise
                        AND inaodocno = g_inba_m.inbadocno
                        AND inaoseq = g_inbc_d[g_detail_idx2].inbcseq
                        AND inao000 = '2'
                        AND inao013 = '-1'
                     IF cl_null(l_inao012) THEN LET l_inao012 = 0 END IF
                     LET l_inao012_2 = 0
                     SELECT SUM(inao012) INTO l_inao012_2 FROM inao_t
                      WHERE inaoent = g_enterprise
                        AND inaodocno = g_inba_m.inbadocno
                        AND inaoseq = g_inbc_d[g_detail_idx2].inbcseq
                        AND inaoseq1 = g_inbc_d[g_detail_idx2].inbcseq1
                        AND inao000 = '2'
                        AND inao013 = '-1'
                     IF cl_null(l_inao012_2) THEN LET l_inao012_2 = 0 END IF
                     #add by lixh 20151010

                  ELSE
                     IF l_cnt <> 0 THEN   #add by lixh 20151010
                     #add by lixh 20151223
                        IF s_aint302_copy_inao(g_inba_m.inbadocno,g_inbc_d[g_detail_idx2].inbcseq,g_inbc_d[g_detail_idx2].inbcseq1,'1',g_inbc_d[g_detail_idx2].inbc005,g_inbc_d[g_detail_idx2].inbc006,g_inbc_d[g_detail_idx2].inbc007,'-1') THEN
                           IF g_inbc_d[g_detail_idx2].inbcseq1 = '1' THEN
                              UPDATE inao_t SET inaoseq1 = '0'
                               WHERE inaoent = g_enterprise
                                 AND inaodocno = g_inba_m.inbadocno
                                 AND inaoseq = g_inbc_d[g_detail_idx2].inbcseq
                                 AND inaoseq1 = 1
                                 AND inao000 = '2'

                              CALL s_lot_sel('2','2',g_site,g_inba_m.inbadocno,g_inbc_d[g_detail_idx2].inbcseq,'0',g_inbc_d[g_detail_idx2].inbc001,g_inbc_d[g_detail_idx2].inbc002,g_inbc_d[g_detail_idx2].inbc003,g_inbc_d[g_detail_idx].inbc005,g_inbc_d[g_detail_idx].inbc006,g_inbc_d[g_detail_idx].inbc007,g_inbc_d[g_detail_idx2].inbc009,g_inbc_d[g_detail_idx].inbc010,'1','aint302','','','','','0')
                                   RETURNING l_success
                           ELSE
                              CALL s_lot_sel('2','2',g_site,g_inba_m.inbadocno,g_inbc_d[g_detail_idx2].inbcseq,g_inbc_d[g_detail_idx2].inbcseq1,g_inbc_d[g_detail_idx2].inbc001,g_inbc_d[g_detail_idx2].inbc002,g_inbc_d[g_detail_idx2].inbc003,g_inbc_d[g_detail_idx2].inbc005,g_inbc_d[g_detail_idx2].inbc006,g_inbc_d[g_detail_idx2].inbc007,g_inbc_d[g_detail_idx2].inbc009,g_inbc_d[g_detail_idx2].inbc010,'1','aint302','','','','','0')
                                   RETURNING l_success
                           END IF
                        END IF
                        IF g_inbc_d[g_detail_idx2].inbcseq1 = '1' THEN
                           IF NOT s_aint302_upd_inao(g_inba_m.inbadocno,g_inbc_d[g_detail_idx2].inbcseq,'0','1',g_inbc_d[g_detail_idx2].inbc005,g_inbc_d[g_detail_idx2].inbc006,g_inbc_d[g_detail_idx2].inbc007,'1') THEN
                              NEXT FIELD CURRENT
                           END IF
                        ELSE
                           IF NOT s_aint302_upd_inao(g_inba_m.inbadocno,g_inbc_d[g_detail_idx2].inbcseq,g_inbc_d[g_detail_idx2].inbcseq1,'1',g_inbc_d[g_detail_idx2].inbc005,g_inbc_d[g_detail_idx2].inbc006,g_inbc_d[g_detail_idx2].inbc007,'1') THEN
                              NEXT FIELD CURRENT
                           END IF
                        END IF
                        IF g_inbc_d[g_detail_idx2].inbcseq1 = '1' THEN
                           UPDATE inao_t SET inaoseq1 = '1'
                            WHERE inaoent = g_enterprise
                              AND inaodocno = g_inba_m.inbadocno
                              AND inaoseq = g_inbc_d[g_detail_idx2].inbcseq
                              AND inao000 = '2'
                              AND inaoseq1 = 0
                           DELETE FROM inao_t
                            WHERE inaoent = g_enterprise
                              AND inaodocno = g_inba_m.inbadocno
                              AND inaoseq = g_inbc_d[g_detail_idx2].inbcseq
                              AND inao000 = '1'
                              AND inaoseq1 = 0
                        ELSE
                           #delete 其他項序的申請資料
                           DELETE FROM inao_t
                            WHERE inaoent = g_enterprise
                              AND inaodocno = g_inba_m.inbadocno
                              AND inaoseq = g_inbc_d[g_detail_idx2].inbcseq
                              AND inao000 = '1'
                              AND inaoseq1 = g_inbc_d[g_detail_idx2].inbcseq1
                        END IF
                     #add by lixh 20151223
#                        CALL s_lot_sel('2','2',g_site,g_inba_m.inbadocno,g_inbc_d[g_detail_idx2].inbcseq,g_inbc_d[g_detail_idx2].inbcseq1,g_inbc_d[g_detail_idx2].inbc001,g_inbc_d[g_detail_idx2].inbc002,g_inbc_d[g_detail_idx2].inbc003,g_inbc_d[g_detail_idx2].inbc005,g_inbc_d[g_detail_idx2].inbc006,g_inbc_d[g_detail_idx2].inbc007,g_inbc_d[g_detail_idx2].inbc009,g_inbc_d[g_detail_idx2].inbc010,'1','aint302','','','','','0')
#                             RETURNING l_success
                     #add by lixh 20151010
                     ELSE
                        #170331-00022#1-S add
                        LET l_tran.prog = g_prog
                        LET l_tran.inbb022 = g_inbb_d[l_ac].inbb022
                        LET g_ls_js = util.JSON.stringify(l_tran)
                        #170331-00022#1-E add
                       #170724-00049#1-S mark
                       #CALL s_lot_ins(g_site,g_inba_m.inbadocno,g_inbb_d[g_detail_idx].inbbseq,'1',g_inbb_d[g_detail_idx].inbb001,g_inbb_d[g_detail_idx].inbb002,g_inbb_d[g_detail_idx].inbb010,g_inbb_d[g_detail_idx].inbb011,'2',g_inba_m.inba003,'1','',
                       #               g_inbb_d[g_detail_idx].inbb007,g_inbb_d[g_detail_idx].inbb008,g_inbb_d[g_detail_idx].inbb009,g_inbb_d[g_detail_idx].inbb003)  #160316-00007#1 add by lixh 20160316 add inbb003  #add by lixh 20151106
                       #     RETURNING l_success,l_amount
                       #170724-00049#1-E mark

                       #170724-00049#1-S add
                       CALL s_lot_ins(g_site,g_inba_m.inbadocno,g_inbc_d[g_detail_idx2].inbcseq,'1',g_inbc_d[g_detail_idx2].inbc001,g_inbc_d[g_detail_idx2].inbc002,g_inbc_d[g_detail_idx2].inbc009,g_inbc_d[g_detail_idx2].inbc010,'2',g_inba_m.inba003,'1','',
                                      g_inbc_d[g_detail_idx2].inbc005,g_inbc_d[g_detail_idx2].inbc006,g_inbc_d[g_detail_idx2].inbc007,g_inbc_d[g_detail_idx2].inbc003)
                            RETURNING l_success,l_amount
                       #170724-00049#1-E add
                     END IF
                     #add by lixh 20151010
                     LET l_inao012 = 0
                     SELECT SUM(inao012) INTO l_inao012 FROM inao_t
                      WHERE inaoent = g_enterprise
                        AND inaodocno = g_inba_m.inbadocno
                        AND inaoseq = g_inbc_d[g_detail_idx2].inbcseq
                        AND inao000 = '2'
                        AND inao013 = '1'
                     IF cl_null(l_inao012) THEN LET l_inao012 = 0 END IF

                     LET l_inao012_2 = 0
                     SELECT SUM(inao012) INTO l_inao012_2 FROM inao_t    #add by lixh 20151223
                      WHERE inaoent = g_enterprise
                        AND inaodocno = g_inba_m.inbadocno
                        AND inaoseq = g_inbc_d[g_detail_idx2].inbcseq
                        AND inaoseq1 = g_inbc_d[g_detail_idx2].inbcseq1
                        AND inao000 = '2'
                        AND inao013 = '1'
                     IF cl_null(l_inao012_2) THEN LET l_inao012_2 = 0 END IF
                     #add by lixh 20151010
                  END IF
                  IF l_success THEN
                     #add by lixh 20151010
                     SELECT imaf053,imaf054 INTO l_imaf053,l_imaf054 FROM imaf_t
                      WHERE imafent = g_enterprise
                        AND imafsite = g_site
                        AND imaf001 = g_inbc_d[g_detail_idx2].inbc001

                     IF l_imaf054 = 'N' THEN   #不走多倉儲批
                        CALL s_aooi250_convert_qty(g_inbc_d[g_detail_idx2].inbc001,l_imaf053,g_inbc_d[g_detail_idx2].inbc009,l_inao012)
                             RETURNING l_success,l_inao012
                     END IF

                     LET g_inbc_d[g_detail_idx2].inbc010 = l_inao012
                     #170617-00536#1-S mark
                     #CALL s_aooi250_convert_qty(g_inbc_d[g_detail_idx2].inbc009,g_inbc_d[g_detail_idx2].inbc010,
                     #                           g_inbc_d[g_detail_idx2].inbc011,g_inbc_d[g_detail_idx2].inbc015)

                     #RETURNING l_success,g_inbc_d[g_detail_idx2].inbc015
                     #170617-00536#1-E mark
                     #170617-00536#1-S add
                     IF NOT cl_null(g_inbc_d[g_detail_idx2].inbc009) AND NOT cl_null(g_inbc_d[g_detail_idx2].inbc011) THEN
                        CALL s_aooi250_convert_qty(g_inbc_d[g_detail_idx2].inbc001,g_inbc_d[g_detail_idx2].inbc009,
                                                   g_inbc_d[g_detail_idx2].inbc011,l_inao012_2)
                           RETURNING l_success,g_inbc_d[g_detail_idx2].inbc015
                     END IF
                     #170617-00536#1-E add
                     IF g_inbb_d[g_detail_idx2].inbb019 < l_inao012 THEN
                        LET g_inbb_d[g_detail_idx2].inbb019 = l_inao012
                     END IF
                     UPDATE inbb_t SET inbb012 = l_inao012,
                                       inbb019 = g_inbb_d[g_detail_idx2].inbb019
                      WHERE inbbent = g_enterprise
                        AND inbbdocno = g_inba_m.inbadocno
                        AND inbbseq = g_inbc_d[g_detail_idx2].inbcseq

                     UPDATE inbc_t SET inbc010 = l_inao012_2,
                                       inbc015 = g_inbc_d[g_detail_idx2].inbc015
                      WHERE inbcent = g_enterprise
                        AND inbcdocno = g_inba_m.inbadocno
                        AND inbcseq = g_inbc_d[g_detail_idx2].inbcseq
                        AND inbcseq1 = g_inbc_d[g_detail_idx2].inbcseq1    #add by lixh 20151223

                     LET g_inbc_d[g_detail_idx2].inbc010 = l_inao012_2
                     LET g_inbb_d[g_detail_idx2].inbb012 = l_inao012
                     #add by lixh 20151010
                     CALL s_transaction_end('Y','0')
                  ELSE
                     CALL s_transaction_end('N','0')
                  END IF
                  #add by lixh 20150918
                  #組合新增資料的條件
                  LET g_add_browse = " inbaent = '" ||g_enterprise|| "' AND",
                      " inbadocno = '", g_inba_m.inbadocno, "' "
                  #add by lixh 20150918
                  LET g_current_row = g_current_idx #目前指標
               END IF
               END IF  #160602-00018#1
               EXIT DIALOG
            END IF

            BEFORE ROW
               CALL aint302_idx_chk()
               LET l_ac2 = DIALOG.getCurrentRow("s_detail2")
               LET g_detail_idx2 = l_ac2

            BEFORE DISPLAY
               CALL cl_set_act_visible("s_lot_ins,s_lot_sel,s_lot_sel1",TRUE)
               CALL aint302_set_act_no_visible_b()   #add by lixh 20151010
               CALL FGL_SET_ARR_CURR(g_detail_idx2)
               LET l_ac2 = DIALOG.getCurrentRow("s_detail2")
               CALL aint302_idx_chk()
               LET g_current_page = 2

         END DISPLAY

         DISPLAY ARRAY g_inao_d2 TO s_detail4.* ATTRIBUTES(COUNT=g_rec_b4) #page4

            BEFORE DISPLAY
            #   CALL FGL_SET_ARR_CURR(g_detail_idx)
            #   LET l_ac4 = DIALOG.getCurrentRow("s_detail4")
               CALL cl_set_act_visible("s_lot_ins,s_lot_sel,s_lot_sel1",FALSE)
               CALL aint302_inao_fill2()    #160411-00009#1
               LET g_current_page = 4
               CALL aint302_idx_chk()

            BEFORE ROW
               #160408-00024#1
               LET g_d_idx_display = DIALOG.getCurrentRow("s_detail4")
               DISPLAY g_d_idx_display TO FORMONLY.idx
               LET g_d_cnt_display = g_inao_d2.getLength()
               LET g_current_page = 4
               #160408-00024#1

               CALL aint302_idx_chk()
            #   LET l_ac4 = DIALOG.getCurrentRow("s_detail4")
            #   LET g_detail_idx = l_ac4
            #

         END DISPLAY

         SUBDIALOG sub_s_lot.s_lot_display
         #单头备注显示
         SUBDIALOG aoo_aooi360_01.aooi360_01_display     #161031-00025#7 add
         #end add-point

         SUBDIALOG lib_cl_dlg.cl_dlg_qryplan
         SUBDIALOG lib_cl_dlg.cl_dlg_relateapps

         BEFORE DIALOG
            CALL cl_ap_code_set_action() #171110-00013#1
            #先填充browser資料
            CALL aint302_browser_fill("")
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
               CALL aint302_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL aint302_ui_detailshow() #Setting the current row

            #筆數顯示
            LET g_current_page = 1
            CALL aint302_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            #150310-00003#19 add by lixh 20160223
            IF g_inba_m.inba005 = '10' AND NOT cl_null(g_inba_m.inba006) THEN
               CALL cl_set_act_visible("modify,delete,modify_detail",FALSE)
            END IF
            #150310-00003#19 add by lixh 20160223

         #161031-00025#7---s
         ON ACTION remarks_page
            LET g_detail_id = "remarks_page"
            NEXT FIELD ooff012
         #161031-00025#7---e

         ON ACTION s_lot
            CALL cl_set_act_visible("s_lot_ins,s_lot_sel,s_lot_sel1",FALSE)
            IF NOT cl_null(g_detail_idx) AND g_detail_idx <> 0 THEN
               #IF g_argv[1] = '1' THEN  #161109-00032#1 mark
               IF g_argv[1] = '1' OR g_argv[1] = '3' THEN   #161109-00032#1
                  CALL s_lot_b_fill('2',g_site,'1',g_inba_m.inbadocno,'','','-1')
               ELSE
                  CALL s_lot_b_fill('2',g_site,'1',g_inba_m.inbadocno,'','','1')
               END IF
            END IF
            LET lb_first = FALSE

            #end add-point

         #add-point:ui_dialog段more_action name="ui_dialog.more_action"

         #end add-point

         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL aint302_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL aint302_set_act_visible()
            CALL aint302_set_act_no_visible()
            IF NOT (g_inba_m.inbadocno IS NULL

              ) THEN
               #組合條件
               LET g_add_browse = " inbaent = " ||g_enterprise|| " AND",
                                  " inbadocno = '", g_inba_m.inbadocno, "' "

               #填到對應位置
               CALL aint302_browser_fill("")
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

               FOR li_idx = 1 TO la_wc.getLength()
                  CASE
                     WHEN la_wc[li_idx].tableid = "inba_t"
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "inbb_t"
                        LET g_wc2_table1 = la_wc[li_idx].wc

                     WHEN la_wc[li_idx].tableid = "EXTENDWC"
                        LET g_wc2_extend = la_wc[li_idx].wc
                  END CASE
               END FOR
               IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1)

                  OR NOT cl_null(g_wc2_extend)
                  THEN
                  #組合g_wc2
                  IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
                     LET g_wc2 = g_wc2_table1
                  END IF

                  IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
                  END IF

                  IF g_wc2.subString(1,5) = " AND " THEN
                     LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
                  END IF
               END IF
               CALL aint302_browser_fill("F")   #browser_fill()會將notice區塊清空
               CALL cl_notice()   #重新顯示,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
            END IF

         #查詢方案選擇
         ON ACTION qbe_select
            LET g_action_choice = "queryplan" #ver:81
            CALL cl_qbe_list("m") RETURNING ls_wc
            IF NOT cl_null(ls_wc) THEN
               CALL util.JSON.parse(ls_wc, la_wc)
               INITIALIZE g_wc, g_wc2,g_wc2_table1,g_wc2_extend TO NULL

               FOR li_idx = 1 TO la_wc.getLength()
                  CASE
                     WHEN la_wc[li_idx].tableid = "inba_t"
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "inbb_t"
                        LET g_wc2_table1 = la_wc[li_idx].wc

                     WHEN la_wc[li_idx].tableid = "EXTENDWC"
                        LET g_wc2_extend = la_wc[li_idx].wc
                  END CASE
               END FOR
               IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1)

                  OR NOT cl_null(g_wc2_extend)
                  THEN
                  IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
                     LET g_wc2 = g_wc2_table1
                  END IF

                  IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
                  END IF
                  IF g_wc2.subString(1,5) = " AND " THEN
                     LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
                  END IF
                  #取得條件後需要重查、跳到結果第一筆資料的功能程式段
                  CALL aint302_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = ""
                     LET g_errparam.code = "-100"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL aint302_fetch("F")
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
               CALL aint302_filter()
               EXIT DIALOG




         ON ACTION first
            LET g_action_choice = "fetch"
            CALL aint302_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL aint302_idx_chk()

         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL aint302_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL aint302_idx_chk()

         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL aint302_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL aint302_idx_chk()

         ON ACTION next
            LET g_action_choice = "fetch"
            CALL aint302_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL aint302_idx_chk()

         ON ACTION last
            LET g_action_choice = "fetch"
            CALL aint302_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL aint302_idx_chk()

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
                        LET l_arr_len = g_inbb_d.getLength()
                        LET g_export_tag[1] = rec_arr_type.create(l_arr_len)
                        LET g_export_tabname[1] = "s_detail1"
                        FOR l_arr_cnt = 1 TO l_arr_len
                           LET g_export_tag[1][l_arr_cnt] = g_inbb_d[l_arr_cnt]
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
                        LET g_export_node[1] = base.typeInfo.create(g_inbb_d)
                        LET g_export_id[1]   = "s_detail1"

                        #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"
                  #add by lixh 20150109
                  LET g_export_node[2] = base.typeInfo.create(g_inbc_d)
                  LET g_export_id[2]   = "s_detail2"
                  LET g_export_node[3] = base.typeInfo.create(g_inao_d)
                  LET g_export_id[3]   = "s_detail1_s_lot_s01"
                  LET g_export_node[4] = base.typeInfo.create(g_inao_d2)
                  LET g_export_id[4]   = "s_detail4"
                  #161031-00025#7---s
                  LET g_export_node[5] = base.typeInfo.create(g_ooff_d4)
                  LET g_export_id[5]   = "s_detail1_aooi360_01"
                  #161031-00025#7---e
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
            #170710-00045#3 add(s)
            #此段為主畫面切回查詢方案畫面時 g_main_hidden不會馬上變回1 因此在執行回查詢方案畫面時先關閉action
            #g_hidden重新赋值0(查询方案页签显示)
            IF g_main_hidden = 0 THEN
               CALL cl_set_act_visible("aint302_01,aint302_01_1,open_memo,gen_qc,storage_by_qc,storage_by_qc_1,qc_query,gen_detail",FALSE)
               CALL cl_set_act_visible("open_detail_memo,scan_barcode,s_lot_sel1,s_lot_ins,s_lot_sel,prog_inba003,unposted",FALSE)
            END IF
            LET g_hidden = 0
            #170710-00045#3 add(e)
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
            #170710-00045#3 add(s)
            #此段為從查詢方案進入主畫面時，g_main_hidden不會馬上變回0，所以在執行動作
            #時先判斷action是否關閉，並且g_hidden 重新賦值1(查詢方案隱藏)，因為這邊不
            #會重新調用fetch()回到主畫面後部分action需要重新開啟，所以要調用此段
            IF g_main_hidden = 1 THEN
               LET g_hidden = 1              #aint302_set_act_no_visible的判斷
               CALL aint302_set_act_visible()
               CALL aint302_set_act_no_visible()
            END IF
            #170710-00045#3 add(e)
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
               NEXT FIELD inbbseq
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
         ON ACTION aint302_01
            LET g_action_choice="aint302_01"
            IF cl_auth_chk_act("aint302_01") THEN

               #add-point:ON ACTION aint302_01 name="menu.aint302_01"
               #170803-00020#1 add by wanghaoz 2017/08/07--(s)
               CALL s_transaction_begin()

               OPEN aint302_cl USING g_enterprise,g_inba_m.inbadocno
               IF SQLCA.SQLCODE THEN
                  CLOSE aint302_cl
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = "OPEN aint302_cl:",SQLERRMESSAGE
                  LET g_errparam.code   = SQLCA.SQLCODE
                  LET g_errparam.popup = TRUE
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  #RETURN                  #170908-00038#2 mark by wanghaoz 2017/09/19
                  EXIT DIALOG             #170908-00038#2 add by wanghaoz 2017/09/19
               END IF

               #顯示最新的資料
               EXECUTE aint302_master_referesh USING g_inba_m.inbadocno INTO g_inba_m.inbadocno,g_inba_m.inbasite,
                   g_inba_m.inbadocdt,g_inba_m.inba002,g_inba_m.inba003,g_inba_m.inba004,g_inba_m.inbastus,g_inba_m.inba005,
                   g_inba_m.inba006,g_inba_m.inba007,g_inba_m.inba008,g_inba_m.inbaownid,g_inba_m.inbacrtdp,g_inba_m.inbaowndp,
                   g_inba_m.inbacrtdt,g_inba_m.inbacrtid,g_inba_m.inbamodid,g_inba_m.inbacnfdt,g_inba_m.inbamoddt,
                   g_inba_m.inbapstid,g_inba_m.inbacnfid,g_inba_m.inbapstdt,g_inba_m.inba003_desc,g_inba_m.inba004_desc,
                   g_inba_m.inbaownid_desc,g_inba_m.inbacrtdp_desc,g_inba_m.inbaowndp_desc,g_inba_m.inbacrtid_desc,
                   g_inba_m.inbamodid_desc,g_inba_m.inbapstid_desc,g_inba_m.inbacnfid_desc


               #檢查是否允許此動作
               IF NOT aint302_action_chk() THEN
                  CLOSE aint302_cl
                  CALL s_transaction_end('N','0')
                  #RETURN                  #170908-00038#2 mark by wanghaoz 2017/09/19
                  EXIT DIALOG             #170908-00038#2 add by wanghaoz 2017/09/19
               END IF

               #將資料顯示到畫面上
               DISPLAY BY NAME g_inba_m.inbadocno,g_inba_m.inbadocno_desc,g_inba_m.inbasite,g_inba_m.inbadocdt,g_inba_m.inba002,
                   g_inba_m.inba003,g_inba_m.inba003_desc,g_inba_m.inba004,g_inba_m.inba004_desc,g_inba_m.inbastus,
                   g_inba_m.inba005,g_inba_m.inba006,g_inba_m.inba007,g_inba_m.inba007_desc,g_inba_m.inba008,g_inba_m.inbaownid,
                   g_inba_m.inbaownid_desc,g_inba_m.inbacrtdp,g_inba_m.inbacrtdp_desc,g_inba_m.inbaowndp,g_inba_m.inbaowndp_desc,
                   g_inba_m.inbacrtdt,g_inba_m.inbacrtid,g_inba_m.inbacrtid_desc,g_inba_m.inbamodid,g_inba_m.inbamodid_desc,
                   g_inba_m.inbacnfdt,g_inba_m.inbamoddt,g_inba_m.inbapstid,g_inba_m.inbapstid_desc,g_inba_m.inbacnfid,
                   g_inba_m.inbacnfid_desc,g_inba_m.inbapstdt

               CASE g_inba_m.inbastus
                  WHEN "N"
                     CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
                  WHEN "S"
                     CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
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
                  WHEN "Z"
                     CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
                  WHEN "X"
                     CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")

               END CASE
               IF g_inba_m.inbastus <> 'S' THEN
               #170803-00020#1 add by wanghaoz 2017/08/07--(e)
               IF NOT cl_null(g_inba_m.inbadocno) THEN
                  CALL aint302_01(g_type,g_inba_m.inbadocno)
                  CALL aint302_b_fill()
                  CALL aint302_inbc_fill('')
               END IF
               #170803-00020#1 add by wanghaoz 2017/08/07--(s)
               ELSE
                  INITIALIZE g_errparam TO NULL
                  CLOSE aint302_cl
                  LET g_errparam.code = 'axm-00852'
                  LET g_errparam.extend = ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  CALL s_transaction_end('N','0')
                  CALL cl_set_act_visible("aint302_01",FALSE)
               END IF
               CLOSE aint302_cl
               CALL s_transaction_end('Y','0')
               #170803-00020#1 add by wanghaoz 2017/08/07--(e)
               #END add-point

            END IF




         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify
            LET g_action_choice="modify"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = ''
               CALL aint302_modify()
               #add-point:ON ACTION modify name="menu.modify"

               #END add-point

            END IF




         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL aint302_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"

               #END add-point

            END IF




         #應用 a43 樣板自動產生(Version:4)
         ON ACTION aint302_01_1
            LET g_action_choice="aint302_01_1"
            IF cl_auth_chk_act("aint302_01_1") THEN

               #add-point:ON ACTION aint302_01_1 name="menu.aint302_01_1"
               #170803-00020#1 add by wanghaoz 2017/08/07--(s)
               CALL s_transaction_begin()

               OPEN aint302_cl USING g_enterprise,g_inba_m.inbadocno
               IF SQLCA.SQLCODE THEN
                  CLOSE aint302_cl
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = "OPEN aint302_cl:",SQLERRMESSAGE
                  LET g_errparam.code   = SQLCA.SQLCODE
                  LET g_errparam.popup = TRUE
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  #RETURN                  #170908-00038#2 mark by wanghaoz 2017/09/19
                  EXIT DIALOG             #170908-00038#2 add by wanghaoz 2017/09/19
               END IF

               #顯示最新的資料
               EXECUTE aint302_master_referesh USING g_inba_m.inbadocno INTO g_inba_m.inbadocno,g_inba_m.inbasite,
                   g_inba_m.inbadocdt,g_inba_m.inba002,g_inba_m.inba003,g_inba_m.inba004,g_inba_m.inbastus,g_inba_m.inba005,
                   g_inba_m.inba006,g_inba_m.inba007,g_inba_m.inba008,g_inba_m.inbaownid,g_inba_m.inbacrtdp,g_inba_m.inbaowndp,
                   g_inba_m.inbacrtdt,g_inba_m.inbacrtid,g_inba_m.inbamodid,g_inba_m.inbacnfdt,g_inba_m.inbamoddt,
                   g_inba_m.inbapstid,g_inba_m.inbacnfid,g_inba_m.inbapstdt,g_inba_m.inba003_desc,g_inba_m.inba004_desc,
                   g_inba_m.inbaownid_desc,g_inba_m.inbacrtdp_desc,g_inba_m.inbaowndp_desc,g_inba_m.inbacrtid_desc,
                   g_inba_m.inbamodid_desc,g_inba_m.inbapstid_desc,g_inba_m.inbacnfid_desc


               #檢查是否允許此動作
               IF NOT aint302_action_chk() THEN
                  CLOSE aint302_cl
                  CALL s_transaction_end('N','0')
                  #RETURN                  #170908-00038#2 mark by wanghaoz 2017/09/19
                  EXIT DIALOG             #170908-00038#2 add by wanghaoz 2017/09/19
               END IF

               #將資料顯示到畫面上
               DISPLAY BY NAME g_inba_m.inbadocno,g_inba_m.inbadocno_desc,g_inba_m.inbasite,g_inba_m.inbadocdt,g_inba_m.inba002,
                   g_inba_m.inba003,g_inba_m.inba003_desc,g_inba_m.inba004,g_inba_m.inba004_desc,g_inba_m.inbastus,
                   g_inba_m.inba005,g_inba_m.inba006,g_inba_m.inba007,g_inba_m.inba007_desc,g_inba_m.inba008,g_inba_m.inbaownid,
                   g_inba_m.inbaownid_desc,g_inba_m.inbacrtdp,g_inba_m.inbacrtdp_desc,g_inba_m.inbaowndp,g_inba_m.inbaowndp_desc,
                   g_inba_m.inbacrtdt,g_inba_m.inbacrtid,g_inba_m.inbacrtid_desc,g_inba_m.inbamodid,g_inba_m.inbamodid_desc,
                   g_inba_m.inbacnfdt,g_inba_m.inbamoddt,g_inba_m.inbapstid,g_inba_m.inbapstid_desc,g_inba_m.inbacnfid,
                   g_inba_m.inbacnfid_desc,g_inba_m.inbapstdt

               CASE g_inba_m.inbastus
                  WHEN "N"
                     CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
                  WHEN "S"
                     CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
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
                  WHEN "Z"
                     CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
                  WHEN "X"
                     CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")

               END CASE
               IF g_inba_m.inbastus <> 'S' THEN
               #170803-00020#1 add by wanghaoz 2017/08/07--(e)
               #170323-00026#1 add s---
               IF NOT cl_null(g_inba_m.inbadocno) THEN
                  CALL aint302_01(g_type,g_inba_m.inbadocno)
                  CALL aint302_b_fill()
                  CALL aint302_inbc_fill('')
               END IF
               #170323-00026#1 add e---
               #170803-00020#1 add by wanghaoz 2017/08/07--(s)
               ELSE
                  INITIALIZE g_errparam TO NULL
                  CLOSE aint302_cl
                  LET g_errparam.code = 'axm-00852'
                  LET g_errparam.extend = ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  CALL s_transaction_end('N','0')
                  CALL cl_set_act_visible("aint302_01_1",FALSE)
               END IF
               CLOSE aint302_cl
               CALL s_transaction_end('Y','0')
               #170803-00020#1 add by wanghaoz 2017/08/07--(e)
               #END add-point

            END IF




         #應用 a43 樣板自動產生(Version:4)
         ON ACTION gen_detail
            LET g_action_choice="gen_detail"
            IF cl_auth_chk_act("gen_detail") THEN

               #add-point:ON ACTION gen_detail name="menu.gen_detail"
              #160707-00017#1-S
               IF g_inba_m.inbastus NOT MATCHES "[NDR]" THEN
                  RETURN
               END IF
               #160707-00017#1-E
               IF NOT cl_null(g_inba_m.inbadocno) THEN
                  CALL s_transaction_begin()
                  IF NOT aint302_gen_detail() THEN
                     CALL s_transaction_end('N','0')
                  ELSE
                     CALL s_transaction_end('Y','0')
                     CALL aint302_b_fill()
                     CALL aint302_inbc_fill('')
                  END IF
               END IF
               #END add-point

            END IF




         #應用 a43 樣板自動產生(Version:4)
         ON ACTION unposted
            LET g_action_choice="unposted"
            IF cl_auth_chk_act("unposted") THEN

               #add-point:ON ACTION unposted name="menu.unposted"

               #END add-point

            END IF




         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL aint302_delete()
               #add-point:ON ACTION delete name="menu.delete"

               #END add-point

            END IF




         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL aint302_insert()
               #add-point:ON ACTION insert name="menu.insert"

               #END add-point

            END IF




         #應用 a43 樣板自動產生(Version:4)
         ON ACTION open_memo
            LET g_action_choice="open_memo"
            IF cl_auth_chk_act("open_memo") THEN

               #add-point:ON ACTION open_memo name="menu.open_memo"
               IF NOT cl_null(g_inba_m.inbadocno) THEN
                    #161031-00025#7---s
#                    CALL aooi360_02('6',g_inba_m.inbadocno,'','','','','','','','','','4')
                    CALL aint302_memos()
                    #161031-00025#7---e
                 END IF
               #END add-point

            END IF




         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN

               #add-point:ON ACTION output name="menu.output"
               LET g_rep_wc = " inbaent = ",g_enterprise," AND inbadocno ='",g_inba_m.inbadocno,"'"
               #END add-point
               &include "erp/ain/aint302_rep.4gl"
               #add-point:ON ACTION output.after name="menu.after_output"

               #END add-point

            END IF




         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN

               #add-point:ON ACTION quickprint name="menu.quickprint"
               LET g_rep_wc = " inbaent = ",g_enterprise," AND inbadocno ='",g_inba_m.inbadocno,"'"
               #END add-point
               &include "erp/ain/aint302_rep.4gl"
               #add-point:ON ACTION quickprint.after name="menu.after_quickprint"

               #END add-point

            END IF




         #應用 a43 樣板自動產生(Version:4)
         ON ACTION qc_query
            LET g_action_choice="qc_query"
            IF cl_auth_chk_act("qc_query") THEN

               #add-point:ON ACTION qc_query name="menu.qc_query"
              #161027-00017#1 mark --begin--
              #IF g_detail_idx2 <> 0 THEN
              #   SELECT inbc018 INTO l_inbc018 FROM inbc_t
              #    WHERE inbcent = g_enterprise
              #      AND inbcsite = g_site
              #      AND inbcdocno = g_inba_m.inbadocno
              #      AND inbcseq = g_inbc_d[g_detail_idx2].inbcseq
              #      AND inbcseq1 = g_inbc_d[g_detail_idx2].inbcseq1
              #   LET la_param.prog = 'aqct300'
              #   LET la_param.param[1] = l_inbc018
              #   LET ls_js = util.JSON.stringify( la_param )
              #   CALL cl_cmdrun(ls_js)
              #END IF
              #161027-00017#1 mark --end--
              #161027-00017#1 add  --begin--
               IF NOT cl_null(g_inba_m.inbadocno) THEN
                  INITIALIZE la_param.* TO NULL
                  LET la_param.prog = 'aqct300'
                  LET la_param.param[1] = ''
                  LET la_param.param[2] = ''
                  LET la_param.param[3] = g_inba_m.inbadocno
                  LET ls_js = util.JSON.stringify( la_param )
                  CALL cl_cmdrun(ls_js)
               END IF
              #161027-00017#1 add --end--
               #END add-point

            END IF




         #應用 a43 樣板自動產生(Version:4)
         ON ACTION reproduce
            LET g_action_choice="reproduce"
            IF cl_auth_chk_act("reproduce") THEN
               CALL aint302_reproduce()
               #add-point:ON ACTION reproduce name="menu.reproduce"

               #END add-point

            END IF




         #應用 a43 樣板自動產生(Version:4)
         ON ACTION storage_by_qc_1
            LET g_action_choice="storage_by_qc_1"
            IF cl_auth_chk_act("storage_by_qc_1") THEN

               #add-point:ON ACTION storage_by_qc_1 name="menu.storage_by_qc_1"
               #170323-00026#1 add s---
               IF NOT cl_null(g_inba_m.inbadocno) THEN
                  CALL s_transaction_begin()
                  CALL s_aint302_gen_storage_by_qc(g_inba_m.inbadocno,'')
                       RETURNING l_success
                  IF l_success THEN
                     CALL s_transaction_end('Y',1)
                  ELSE
                     CALL s_transaction_end('N',1)
                  END IF
                  LET g_action_choice=''
                  CALL aint302_b_fill()
                  CALL aint302_inbc_fill('')  #161031-00013#1
               END IF
               #170323-00026#1 add e----
               #END add-point

            END IF




         #應用 a43 樣板自動產生(Version:4)
         ON ACTION open_detail_memo
            LET g_action_choice="open_detail_memo"
            IF cl_auth_chk_act("open_detail_memo") THEN

               #add-point:ON ACTION open_detail_memo name="menu.open_detail_memo"
               #modify by lixiang 2015/08/4--start----
               #單身備註需傳入項次
               #IF NOT cl_null(g_inba_m.inbadocno) THEN
               #   CALL aooi360_01('7',g_inba_m.inbadocno,'','','','','','','','','')
               #END IF

               IF NOT cl_null(g_inba_m.inbadocno) AND g_detail_idx > 0 THEN
                  #161031-00025#1 mod-S
#                  CALL aooi360_01('7',g_inba_m.inbadocno,g_inbb_d[g_detail_idx].inbbseq,'','','','','','','','')
                  CALL aooi360_02('7',g_prog,g_inba_m.inbadocno,g_inbb_d[g_detail_idx].inbbseq,'','','','','','','','1')
                  CALL s_aooi360_sel('7',g_prog,g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'','','','','','','','1') RETURNING l_success,g_inbb_d[l_ac].ooff013
                  #161031-00025#7---s
                  LET g_ooff001_d = '6'   #6.單據單頭備註
                  LET g_ooff002_d = g_prog
                  LET g_ooff003_d = g_inba_m.inbadocno   #单号
                  LET g_ooff004_d = 0     #项次
                  LET g_ooff005_d = ' '
                  LET g_ooff006_d = ' '
                  LET g_ooff007_d = ' '
                  LET g_ooff008_d = ' '
                  LET g_ooff009_d = ' '
                  LET g_ooff010_d = ' '
                  LET g_ooff011_d = ' '
                  CALL aooi360_01_b_fill(g_ooff001_d,g_ooff002_d,g_ooff003_d,g_ooff004_d,g_ooff005_d,g_ooff006_d,g_ooff007_d,g_ooff008_d,g_ooff009_d,g_ooff010_d,g_ooff011_d)   #备注单身
                  #161031-00025#7---e
                  #161031-00025#1 mod-E
               END IF
               #modify by lixiang 2015/08/4--end----
               #END add-point

            END IF




         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL aint302_query()
               #add-point:ON ACTION query name="menu.query"

               #END add-point
               #應用 a59 樣板自動產生(Version:3)
               CALL g_curr_diag.setCurrentRow("s_detail1",1)




            END IF




         #應用 a43 樣板自動產生(Version:4)
         ON ACTION gen_qc
            LET g_action_choice="gen_qc"
            IF cl_auth_chk_act("gen_qc") THEN

               #add-point:ON ACTION gen_qc name="menu.gen_qc"
               IF NOT cl_null(g_inba_m.inbadocno) THEN
                  CALL s_transaction_begin()
                  CALL aint302_02(g_inba_m.inbadocno)
                  LET g_action_choice=''
                  CALL aint302_b_fill()
                  CALL aint302_inbc_fill('')   #160804-00041#1
               END IF
               #END add-point

            END IF




         #應用 a43 樣板自動產生(Version:4)
         ON ACTION scan_barcode
            LET g_action_choice="scan_barcode"
            IF cl_auth_chk_act("scan_barcode") THEN

               #add-point:ON ACTION scan_barcode name="menu.scan_barcode"
               #160811-00014#2--dongsz add--s
               #单头无资料，不可点击
               LET l_cnt = 0
               SELECT COUNT(*) INTO l_cnt FROM inba_t
                WHERE inbaent = g_enterprise
                  AND inbadocno = g_inba_m.inbadocno
                  AND inbastus = 'N'
               IF l_cnt < 1 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'asl-00022'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  CONTINUE DIALOG
               END IF
               #写入扫码录入临时表资料
               CALL s_scancode_aint301_ins_tmp(g_inba_m.inbadocno)
               CALL aint302_b_fill()
               CALL aint302_inbc_fill('')
               #160811-00014#2--dongsz add--e
               #END add-point

            END IF




         #應用 a43 樣板自動產生(Version:4)
         ON ACTION storage_by_qc
            LET g_action_choice="storage_by_qc"
            IF cl_auth_chk_act("storage_by_qc") THEN

               #add-point:ON ACTION storage_by_qc name="menu.storage_by_qc"
               IF NOT cl_null(g_inba_m.inbadocno) THEN
                  CALL s_transaction_begin()
                  CALL s_aint302_gen_storage_by_qc(g_inba_m.inbadocno,'')
                       RETURNING l_success
                  IF l_success THEN
                     CALL s_transaction_end('Y',1)
                  ELSE
                     CALL s_transaction_end('N',1)
                  END IF
                  LET g_action_choice=''
                  CALL aint302_b_fill()
                  CALL aint302_inbc_fill('')  #161031-00013#1
               END IF
               #END add-point

            END IF




         #應用 a43 樣板自動產生(Version:4)
         ON ACTION prog_inba003
            LET g_action_choice="prog_inba003"
            IF cl_auth_chk_act("prog_inba003") THEN

               #add-point:ON ACTION prog_inba003 name="menu.prog_inba003"
               #+ 此段落由子樣板a45產生
               CALL cl_user_contact("aooi130", "ooag_t", "ooag002", "ooag001",g_inba_m.inba003)


               #END add-point

            END IF





         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL aint302_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"

               #END add-point
               CALL cl_doc()
            END IF

         ON ACTION agendum
            CALL aint302_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"

            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()

         ON ACTION followup
            CALL aint302_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"

            #END add-point
            CALL cl_user_overview_follow(g_inba_m.inbadocdt)




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

{<section id="aint302.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION aint302_browser_fill(ps_page_action)
   #add-point:browser_fill段define(客製用) name="browser_fill.define_customerization"

   #end add-point
   DEFINE ps_page_action    STRING
   DEFINE l_wc              STRING
   DEFINE l_wc2             STRING
   DEFINE l_sql             STRING
   DEFINE l_sub_sql         STRING
   DEFINE l_sql_rank        STRING
   #add-point:browser_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="browser_fill.define"

   #end add-point

   #add-point:Function前置處理 name="browser_fill.before_browser_fill"
   #add by lixh 20150901
   CALL cl_set_toolbaritem_visible("s_lot_ins,s_lot_sel,s_lot_sel1",TRUE)
   #aint301單身異動申請明細頁籤與入庫明細頁籤的[有效日期]、[存貨備註]欄位需隱藏不可維護
   #IF g_argv[1] = '1' THEN   #161109-00032#1 mark
   IF g_argv[1] = '1' OR g_argv[1] = '3' THEN  #161109-00032#1
      #CALL cl_set_comp_visible("inbb021,inbb022,inbc016,inbc017",FALSE)
      CALL cl_set_toolbaritem_visible("s_lot_ins",FALSE)
   ELSE
      CALL cl_set_toolbaritem_visible("s_lot_sel1",FALSE)
   END IF
   #add by lixh 20150901
   #161031-00025#7---s
   IF cl_null(g_add_browse) THEN
      CALL aooi360_01_clear_detail()   #清除备注单身
   END IF
   #161031-00025#7---e
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

   IF cl_null(g_wc) THEN
      LET g_wc = " inbasite = '",g_site,"' "
   ELSE
      LET g_wc = g_wc," AND inbasite = '",g_site,"' "
   END IF

   IF NOT cl_null(g_argv[01]) THEN
      #LET g_wc = g_wc," AND inba001 = '", g_argv[01], "' "  #161109-00032#1
      #161109-00032#1-S
      IF g_argv[01] = '3' OR g_argv[01] = '4' THEN
         IF g_argv[01] = '3' THEN
            LET g_wc = g_wc," AND inba001 = 'X1' "
         END IF
         IF g_argv[01] = '4' THEN
            LET g_wc = g_wc," AND inba001 = 'X2' "
         END IF
      ELSE
         LET g_wc = g_wc," AND inba001 = '", g_argv[01], "' "
      END IF
      #161109-00032#1-E
   END IF

   LET l_wc  = g_wc.trim()

   #end add-point

   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT inbadocno ",
                      " FROM inba_t ",
                      " ",
                      " LEFT JOIN inbb_t ON inbbent = inbaent AND inbadocno = inbbdocno ", "  ",
                      #add-point:browser_fill段sql(inbb_t1) name="browser_fill.cnt.join.}"
                      #170728-00002#2 Add By Ken 170823(S)
                      " LEFT JOIN ooff_t ON ooffent = inbaent AND ooff001 = '7'
                              AND ooff002 = '",g_prog,"'  AND inbadocno = ooff003  AND ooff004 = to_char(inbbseq)", "  ",
                      #170728-00002#2 Add By Ken 170823(E)
                      #end add-point


                      " ",
                      " ",


                      " WHERE inbaent = " ||g_enterprise|| " AND inbbent = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("inba_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT inbadocno ",
                      " FROM inba_t ",
                      "  ",
                      "  ",
                      " WHERE inbaent = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("inba_t")
   END IF

   #add-point:browser_fill,cnt wc name="browser_fill.cnt_sqlwc"
   #170728-00002#2 Mark By Ken 170823(S)
   ##161031-00025#7---s
   #IF NOT cl_null(g_wc2_i36001) AND g_wc2_i36001 <> " 1=1" THEN
   #   LET l_sub_sql = l_sub_sql CLIPPED, " AND inbadocno IN ( SELECT ooff003 FROM ooff_t WHERE ooffent = ",g_enterprise," AND ooff001 = '6' AND ooff003= 0 AND ",g_wc2_i36001 CLIPPED ,")"
   #END IF
   ##161031-00025#7---e
   #170728-00002#2 Mark By Ken 170823(E)
   #170728-00002#2 Add By Ken 170823(S)
   IF NOT cl_null(g_wc2_i36001) AND g_wc2_i36001 <> " 1=1" THEN
      LET l_sub_sql = l_sub_sql CLIPPED, " AND EXISTS (SELECT ooff003 FROM ooff_t
                                                        WHERE ooffent = ",g_enterprise," AND ooff001 = '6'
                                                          AND ooff002 = '",g_prog,"'
                                                          AND ooff003 = inbadocno
                                                          AND ooff004 = '0'
                                                          AND ",g_wc2_i36001 CLIPPED ,")"
   END IF
   #170728-00002#2 Add By Ken 170823(E)
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
      INITIALIZE g_inba_m.* TO NULL
      CALL g_inbb_d.clear()

      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"

      #end add-point
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1"
      LET g_cnt = g_current_idx
   END IF

   #依照t0.inbadocno,t0.inbadocdt,t0.inba002,t0.inba003,t0.inba004 Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件
      LET g_sql = " SELECT DISTINCT t0.inbastus,t0.inbadocno,t0.inbadocdt,t0.inba002,t0.inba003,t0.inba004,
          t1.ooag011 ,t2.ooefl003 ",
                  " FROM inba_t t0",
                  "  ",
                  "  LEFT JOIN inbb_t ON inbbent = inbaent AND inbadocno = inbbdocno ", "  ",
                  #add-point:browser_fill段sql(inbb_t1) name="browser_fill.join.inbb_t1"
                  #170728-00002#2 Add By Ken 170823(S)
                  " LEFT JOIN ooff_t ON ooffent = inbaent AND ooff001 = '7'
                          AND ooff002 = '",g_prog,"'  AND inbadocno = ooff003  AND ooff004 = to_char(inbbseq)", "  ",
                  #170728-00002#2 Add By Ken 170823(E)
                  #end add-point


                  " ",


                                 " LEFT JOIN ooag_t t1 ON t1.ooagent="||g_enterprise||" AND t1.ooag001=t0.inba003  ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.inba004 AND t2.ooefl002='"||g_dlang||"' ",

                  " WHERE t0.inbaent = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("inba_t")
   ELSE
      #單身無輸入搜尋條件
      LET g_sql = " SELECT DISTINCT t0.inbastus,t0.inbadocno,t0.inbadocdt,t0.inba002,t0.inba003,t0.inba004,
          t1.ooag011 ,t2.ooefl003 ",
                  " FROM inba_t t0",
                  "  ",
                                 " LEFT JOIN ooag_t t1 ON t1.ooagent="||g_enterprise||" AND t1.ooag001=t0.inba003  ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.inba004 AND t2.ooefl002='"||g_dlang||"' ",

                  " WHERE t0.inbaent = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("inba_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
   #170728-00002#2 Add By Ken 170823(S)
   IF NOT cl_null(g_wc2_i36001) AND g_wc2_i36001 <> " 1=1" THEN
      LET g_sql = g_sql CLIPPED, " AND EXISTS (SELECT ooff003 FROM ooff_t
                                                        WHERE ooffent = ",g_enterprise," AND ooff001 = '6'
                                                          AND ooff002 = '",g_prog,"'
                                                          AND ooff003 = inbadocno
                                                          AND ooff004 = '0'
                                                          AND ",g_wc2_i36001 CLIPPED ,")"
   END IF
   #170728-00002#2 Add By Ken 170823(E)
   #end add-point
   LET g_sql = g_sql, " ORDER BY inbadocno ",g_order

   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"

   #end add-point

   #LET g_sql = cl_sql_add_tabid(g_sql,"inba_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料

   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre

      #add-point:browser_fill段open cursor name="browser_fill.open"

      #end add-point

      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_inbadocno,g_browser[g_cnt].b_inbadocdt,
          g_browser[g_cnt].b_inba002,g_browser[g_cnt].b_inba003,g_browser[g_cnt].b_inba004,g_browser[g_cnt].b_inba003_desc,
          g_browser[g_cnt].b_inba004_desc
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
         CALL aint302_browser_mask()

               #應用 a24 樣板自動產生(Version:3)
      #browser顯示圖片
      CASE g_browser[g_cnt].b_statepic
         WHEN "N"
            LET g_browser[g_cnt].b_statepic = "stus/16/unconfirmed.png"
         WHEN "S"
            LET g_browser[g_cnt].b_statepic = "stus/16/posted.png"
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
         WHEN "Z"
            LET g_browser[g_cnt].b_statepic = "stus/16/unposted.png"
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

   IF cl_null(g_browser[g_cnt].b_inbadocno) THEN
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
   #add by lixh 20151010
   CALL aint302_set_act_visible()
   CALL aint302_set_act_no_visible()
   CALL aint302_set_act_visible_b()
   CALL aint302_set_act_no_visible_b()
   #add by lixh 20151010
   #end add-point

END FUNCTION

{</section>}

{<section id="aint302.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION aint302_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"

   #end add-point
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"

   #end add-point

   #add-point:Function前置處理  name="ui_headershow.pre_function"

   #end add-point

   LET g_inba_m.inbadocno = g_browser[g_current_idx].b_inbadocno

   EXECUTE aint302_master_referesh USING g_inba_m.inbadocno INTO g_inba_m.inbadocno,g_inba_m.inbasite,
       g_inba_m.inbadocdt,g_inba_m.inba002,g_inba_m.inba003,g_inba_m.inba004,g_inba_m.inbastus,g_inba_m.inba005,
       g_inba_m.inba006,g_inba_m.inba007,g_inba_m.inba008,g_inba_m.inbaownid,g_inba_m.inbacrtdp,g_inba_m.inbaowndp,
       g_inba_m.inbacrtdt,g_inba_m.inbacrtid,g_inba_m.inbamodid,g_inba_m.inbacnfdt,g_inba_m.inbamoddt,
       g_inba_m.inbapstid,g_inba_m.inbacnfid,g_inba_m.inbapstdt,g_inba_m.inba003_desc,g_inba_m.inba004_desc,
       g_inba_m.inbaownid_desc,g_inba_m.inbacrtdp_desc,g_inba_m.inbaowndp_desc,g_inba_m.inbacrtid_desc,
       g_inba_m.inbamodid_desc,g_inba_m.inbapstid_desc,g_inba_m.inbacnfid_desc

   CALL aint302_inba_t_mask()
   CALL aint302_show()

END FUNCTION

{</section>}

{<section id="aint302.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION aint302_ui_detailshow()
   #add-point:ui_detailshow段define(客製用) name="ui_detailshow.define_customerization"

   #end add-point
   #add-point:ui_detailshow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_detailshow.define"

   #end add-point

   #add-point:Function前置處理 name="ui_detailshow.before"

   #end add-point

   IF g_curr_diag IS NOT NULL THEN
      CALL g_curr_diag.setCurrentRow("s_detail1",g_detail_idx)

   END IF

   #add-point:ui_detailshow段after name="ui_detailshow.after"
   #170710-00045#3 add(s)
   #1)此funtion第一次開啟畫面在BEFORE DIALOG段調用，根據g_main_hidden變數判斷，如果g_main_hidden=1主畫面隱藏需要關閉所有需要關閉的action id
   #2)此function從主畫面回查詢方案時上下點選單據調用，關閉所有需要關閉的action id
   IF g_main_hidden = 1 THEN   #主劃面隱藏
      CALL cl_set_act_visible("aint302_01,aint302_01_1,open_memo,gen_qc,storage_by_qc,storage_by_qc_1,qc_query,gen_detail",FALSE)
      CALL cl_set_act_visible("open_detail_memo,scan_barcode,s_lot_sel1,s_lot_ins,s_lot_sel,prog_inba003,unposted",FALSE)
   END IF
   #170710-00045#3 add(e)

   IF g_curr_diag IS NOT NULL THEN
      CALL g_curr_diag.setCurrentRow("s_detail2",g_detail_idx2)
   END IF
   #end add-point

END FUNCTION

{</section>}

{<section id="aint302.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION aint302_ui_browser_refresh()
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
      IF g_browser[l_i].b_inbadocno = g_inba_m.inbadocno

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

{<section id="aint302.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION aint302_construct()
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

   #end add-point

   #add-point:Function前置處理  name="cs.pre_function"
   CALL aooi360_01_clear_detail()   #清除备注单身  #161031-00025#7
   #end add-point

   #清除畫面
   CLEAR FORM
   INITIALIZE g_inba_m.* TO NULL
   CALL g_inbb_d.clear()


   LET g_action_choice = ""

   INITIALIZE g_wc TO NULL
   INITIALIZE g_wc2 TO NULL

   INITIALIZE g_wc2_table1 TO NULL


   LET g_qryparam.state = 'c'

   #add-point:cs段開始前 name="cs.before_construct"

   #end add-point

   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)

      #單頭
      CONSTRUCT BY NAME g_wc ON inbadocno,inbadocno_desc,inbasite,inbadocdt,inba002,inba003,inba004,
          inbastus,inba005,inba006,inba007,inba007_desc,inba008,inbaownid,inbacrtdp,inbaowndp,inbacrtdt,
          inbacrtid,inbamodid,inbacnfdt,inbamoddt,inbapstid,inbacnfid,inbapstdt

         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"

            #end add-point

         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理
         ##----<<inbacrtdt>>----
         AFTER FIELD inbacrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)

         #----<<inbamoddt>>----
         AFTER FIELD inbamoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)

         #----<<inbacnfdt>>----
         AFTER FIELD inbacnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)

         #----<<inbapstdt>>----
         AFTER FIELD inbapstdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)




         #一般欄位開窗相關處理
                  #Ctrlp:construct.c.inbadocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbadocno
            #add-point:ON ACTION controlp INFIELD inbadocno name="construct.c.inbadocno"
                                                #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
			   #161109-00032#1-S
#            IF g_argv[1] = '1' THEN
#               LET g_qryparam.where = " inba001 = '1' "
#            ELSE
#               LET g_qryparam.where = " inba001 = '2' "
#            END IF
            #161109-00032#1-E
            #161109-00032#1-S
            IF g_argv[1] = '1' THEN
               LET g_qryparam.where = " inba001 = '1' "
            END IF
            IF g_argv[1] = '2' THEN
               LET g_qryparam.where = " inba001 = '2' "
            END IF
            IF g_argv[1] = '3' OR g_argv[1] = '4' THEN
               IF g_argv[1] = '3'  THEN
                  LET g_qryparam.where = " inba001 = 'X1' "
               END IF
               IF g_argv[1] = '4'  THEN
                  LET g_qryparam.where = " inba001 = 'X2' "
               END IF
            END IF
            #161109-00032#1-E
            CALL q_inbadocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO inbadocno  #顯示到畫面上
               #DISPLAY g_qryparam.return2 TO inbadocdt #輸入日期
               #DISPLAY g_qryparam.return3 TO inba003 #申請人員
               #DISPLAY g_qryparam.return4 TO inba004 #申請部門
               #DISPLAY g_qryparam.return5 TO inbastus #狀態碼

            NEXT FIELD inbadocno                     #返回原欄位


            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbadocno
            #add-point:BEFORE FIELD inbadocno name="construct.b.inbadocno"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbadocno

            #add-point:AFTER FIELD inbadocno name="construct.a.inbadocno"

            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbadocno_desc
            #add-point:BEFORE FIELD inbadocno_desc name="construct.b.inbadocno_desc"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbadocno_desc

            #add-point:AFTER FIELD inbadocno_desc name="construct.a.inbadocno_desc"

            #END add-point



         #Ctrlp:construct.c.inbadocno_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbadocno_desc
            #add-point:ON ACTION controlp INFIELD inbadocno_desc name="construct.c.inbadocno_desc"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbasite
            #add-point:BEFORE FIELD inbasite name="construct.b.inbasite"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbasite

            #add-point:AFTER FIELD inbasite name="construct.a.inbasite"

            #END add-point



         #Ctrlp:construct.c.inbasite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbasite
            #add-point:ON ACTION controlp INFIELD inbasite name="construct.c.inbasite"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbadocdt
            #add-point:BEFORE FIELD inbadocdt name="construct.b.inbadocdt"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbadocdt

            #add-point:AFTER FIELD inbadocdt name="construct.a.inbadocdt"

            #END add-point



         #Ctrlp:construct.c.inbadocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbadocdt
            #add-point:ON ACTION controlp INFIELD inbadocdt name="construct.c.inbadocdt"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inba002
            #add-point:BEFORE FIELD inba002 name="construct.b.inba002"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inba002

            #add-point:AFTER FIELD inba002 name="construct.a.inba002"

            #END add-point



         #Ctrlp:construct.c.inba002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inba002
            #add-point:ON ACTION controlp INFIELD inba002 name="construct.c.inba002"

            #END add-point


         #Ctrlp:construct.c.inba003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inba003
            #add-point:ON ACTION controlp INFIELD inba003 name="construct.c.inba003"
                                                #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
           #CALL q_ooag001()                           #呼叫開窗            #mark wanghaoz 2017/07/19 #170703-00025#6
            CALL q_ooag001_2()           #呼叫开窗             #add wanghaoz 2017/07/19 #170703-00025#6
            DISPLAY g_qryparam.return1 TO inba003  #顯示到畫面上

            NEXT FIELD inba003                     #返回原欄位


            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inba003
            #add-point:BEFORE FIELD inba003 name="construct.b.inba003"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inba003

            #add-point:AFTER FIELD inba003 name="construct.a.inba003"

            #END add-point



         #Ctrlp:construct.c.inba004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inba004
            #add-point:ON ACTION controlp INFIELD inba004 name="construct.c.inba004"
                                                #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooeg001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO inba004  #顯示到畫面上

            NEXT FIELD inba004                     #返回原欄位


            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inba004
            #add-point:BEFORE FIELD inba004 name="construct.b.inba004"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inba004

            #add-point:AFTER FIELD inba004 name="construct.a.inba004"

            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbastus
            #add-point:BEFORE FIELD inbastus name="construct.b.inbastus"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbastus

            #add-point:AFTER FIELD inbastus name="construct.a.inbastus"

            #END add-point



         #Ctrlp:construct.c.inbastus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbastus
            #add-point:ON ACTION controlp INFIELD inbastus name="construct.c.inbastus"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inba005
            #add-point:BEFORE FIELD inba005 name="construct.b.inba005"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inba005

            #add-point:AFTER FIELD inba005 name="construct.a.inba005"

            #END add-point



         #Ctrlp:construct.c.inba005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inba005
            #add-point:ON ACTION controlp INFIELD inba005 name="construct.c.inba005"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inba006
            #add-point:BEFORE FIELD inba006 name="construct.b.inba006"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inba006

            #add-point:AFTER FIELD inba006 name="construct.a.inba006"

            #END add-point



         #Ctrlp:construct.c.inba006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inba006
            #add-point:ON ACTION controlp INFIELD inba006 name="construct.c.inba006"

            #END add-point


         #Ctrlp:construct.c.inba007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inba007
            #add-point:ON ACTION controlp INFIELD inba007 name="construct.c.inba007"
                                                #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
			#170213-00038#1  2017/02/17 By 08734 mark(S)
			#LET g_qryparam.arg1 = g_acc
         #   CALL q_oocq002()                           #呼叫開窗
         #170213-00038#1  2017/02/17 By 08734 mark(E)
            CALL q_inba007()   #170213-00038#1  2017/02/17 By 08734 add
            DISPLAY g_qryparam.return1 TO inba007  #顯示到畫面上

            NEXT FIELD inba007                     #返回原欄位


            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inba007
            #add-point:BEFORE FIELD inba007 name="construct.b.inba007"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inba007

            #add-point:AFTER FIELD inba007 name="construct.a.inba007"

            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inba007_desc
            #add-point:BEFORE FIELD inba007_desc name="construct.b.inba007_desc"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inba007_desc

            #add-point:AFTER FIELD inba007_desc name="construct.a.inba007_desc"

            #END add-point



         #Ctrlp:construct.c.inba007_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inba007_desc
            #add-point:ON ACTION controlp INFIELD inba007_desc name="construct.c.inba007_desc"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inba008
            #add-point:BEFORE FIELD inba008 name="construct.b.inba008"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inba008

            #add-point:AFTER FIELD inba008 name="construct.a.inba008"

            #END add-point



         #Ctrlp:construct.c.inba008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inba008
            #add-point:ON ACTION controlp INFIELD inba008 name="construct.c.inba008"

            #END add-point


         #Ctrlp:construct.c.inbaownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbaownid
            #add-point:ON ACTION controlp INFIELD inbaownid name="construct.c.inbaownid"
                                                #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO inbaownid  #顯示到畫面上

            NEXT FIELD inbaownid                     #返回原欄位


            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbaownid
            #add-point:BEFORE FIELD inbaownid name="construct.b.inbaownid"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbaownid

            #add-point:AFTER FIELD inbaownid name="construct.a.inbaownid"

            #END add-point



         #Ctrlp:construct.c.inbacrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbacrtdp
            #add-point:ON ACTION controlp INFIELD inbacrtdp name="construct.c.inbacrtdp"
                                                #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO inbacrtdp  #顯示到畫面上

            NEXT FIELD inbacrtdp                     #返回原欄位


            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbacrtdp
            #add-point:BEFORE FIELD inbacrtdp name="construct.b.inbacrtdp"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbacrtdp

            #add-point:AFTER FIELD inbacrtdp name="construct.a.inbacrtdp"

            #END add-point



         #Ctrlp:construct.c.inbaowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbaowndp
            #add-point:ON ACTION controlp INFIELD inbaowndp name="construct.c.inbaowndp"
                                                #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO inbaowndp  #顯示到畫面上

            NEXT FIELD inbaowndp                     #返回原欄位


            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbaowndp
            #add-point:BEFORE FIELD inbaowndp name="construct.b.inbaowndp"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbaowndp

            #add-point:AFTER FIELD inbaowndp name="construct.a.inbaowndp"

            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbacrtdt
            #add-point:BEFORE FIELD inbacrtdt name="construct.b.inbacrtdt"

            #END add-point


         #Ctrlp:construct.c.inbacrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbacrtid
            #add-point:ON ACTION controlp INFIELD inbacrtid name="construct.c.inbacrtid"
                                                #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO inbacrtid  #顯示到畫面上

            NEXT FIELD inbacrtid                     #返回原欄位


            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbacrtid
            #add-point:BEFORE FIELD inbacrtid name="construct.b.inbacrtid"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbacrtid

            #add-point:AFTER FIELD inbacrtid name="construct.a.inbacrtid"

            #END add-point



         #Ctrlp:construct.c.inbamodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbamodid
            #add-point:ON ACTION controlp INFIELD inbamodid name="construct.c.inbamodid"
                                                #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO inbamodid  #顯示到畫面上

            NEXT FIELD inbamodid                     #返回原欄位


            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbamodid
            #add-point:BEFORE FIELD inbamodid name="construct.b.inbamodid"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbamodid

            #add-point:AFTER FIELD inbamodid name="construct.a.inbamodid"

            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbacnfdt
            #add-point:BEFORE FIELD inbacnfdt name="construct.b.inbacnfdt"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbamoddt
            #add-point:BEFORE FIELD inbamoddt name="construct.b.inbamoddt"

            #END add-point


         #Ctrlp:construct.c.inbapstid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbapstid
            #add-point:ON ACTION controlp INFIELD inbapstid name="construct.c.inbapstid"
                                                #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO inbapstid  #顯示到畫面上

            NEXT FIELD inbapstid                     #返回原欄位


            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbapstid
            #add-point:BEFORE FIELD inbapstid name="construct.b.inbapstid"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbapstid

            #add-point:AFTER FIELD inbapstid name="construct.a.inbapstid"

            #END add-point



         #Ctrlp:construct.c.inbacnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbacnfid
            #add-point:ON ACTION controlp INFIELD inbacnfid name="construct.c.inbacnfid"
                                                #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO inbacnfid  #顯示到畫面上

            NEXT FIELD inbacnfid                     #返回原欄位


            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbacnfid
            #add-point:BEFORE FIELD inbacnfid name="construct.b.inbacnfid"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbacnfid

            #add-point:AFTER FIELD inbacnfid name="construct.a.inbacnfid"

            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbapstdt
            #add-point:BEFORE FIELD inbapstdt name="construct.b.inbapstdt"

            #END add-point




      END CONSTRUCT

      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON inbbseq,inbb026,inbb001,inbb002,inbb004,inbb007,inbb008,inbb009,inbb010,
          inbb003,inbb011,inbb012,inbb013,inbb014,inbb015,inbb016,inbb016_desc,inbb017,inbb018,inbb019,
          inbb023,inbb024,inbb025,inbb020,inbb204,inbb022,inbb021,ooff013
           FROM s_detail1[1].inbbseq,s_detail1[1].inbb026,s_detail1[1].inbb001,s_detail1[1].inbb002,
               s_detail1[1].inbb004,s_detail1[1].inbb007,s_detail1[1].inbb008,s_detail1[1].inbb009,s_detail1[1].inbb010,
               s_detail1[1].inbb003,s_detail1[1].inbb011,s_detail1[1].inbb012,s_detail1[1].inbb013,s_detail1[1].inbb014,
               s_detail1[1].inbb015,s_detail1[1].inbb016,s_detail1[1].inbb016_desc,s_detail1[1].inbb017,
               s_detail1[1].inbb018,s_detail1[1].inbb019,s_detail1[1].inbb023,s_detail1[1].inbb024,s_detail1[1].inbb025,
               s_detail1[1].inbb020,s_detail1[1].inbb204,s_detail1[1].inbb022,s_detail1[1].inbb021,s_detail1[1].ooff013


         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"

            #end add-point

       #單身公用欄位開窗相關處理


       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbbseq
            #add-point:BEFORE FIELD inbbseq name="construct.b.page1.inbbseq"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbbseq

            #add-point:AFTER FIELD inbbseq name="construct.a.page1.inbbseq"

            #END add-point



         #Ctrlp:construct.c.page1.inbbseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbbseq
            #add-point:ON ACTION controlp INFIELD inbbseq name="construct.c.page1.inbbseq"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb026
            #add-point:BEFORE FIELD inbb026 name="construct.b.page1.inbb026"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb026

            #add-point:AFTER FIELD inbb026 name="construct.a.page1.inbb026"

            #END add-point



         #Ctrlp:construct.c.page1.inbb026
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb026
            #add-point:ON ACTION controlp INFIELD inbb026 name="construct.c.page1.inbb026"
            #170310-00005#25 add s
            #開窗c段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
		   	LET g_qryparam.reqry = FALSE
            CALL q_bcaa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO inbb026  #顯示到畫面上

            NEXT FIELD inbb026                     #返回原欄位
            #170310-00005#25 add e
            #END add-point


         #Ctrlp:construct.c.page1.inbb001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb001
            #add-point:ON ACTION controlp INFIELD inbb001 name="construct.c.page1.inbb001"
                                                #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_imaf001_15()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO inbb001  #顯示到畫面上

            NEXT FIELD inbb001                     #返回原欄位


            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb001
            #add-point:BEFORE FIELD inbb001 name="construct.b.page1.inbb001"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb001

            #add-point:AFTER FIELD inbb001 name="construct.a.page1.inbb001"

            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb002
            #add-point:BEFORE FIELD inbb002 name="construct.b.page1.inbb002"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb002

            #add-point:AFTER FIELD inbb002 name="construct.a.page1.inbb002"

            #END add-point



         #Ctrlp:construct.c.page1.inbb002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb002
            #add-point:ON ACTION controlp INFIELD inbb002 name="construct.c.page1.inbb002"

            #END add-point


         #Ctrlp:construct.c.page1.inbb004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb004
            #add-point:ON ACTION controlp INFIELD inbb004 name="construct.c.page1.inbb004"
                                                #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_imaf001_12()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO inbb004  #顯示到畫面上
               #DISPLAY g_qryparam.return2 TO imaal003 #品名

            NEXT FIELD inbb004                     #返回原欄位


            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb004
            #add-point:BEFORE FIELD inbb004 name="construct.b.page1.inbb004"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb004

            #add-point:AFTER FIELD inbb004 name="construct.a.page1.inbb004"

            #END add-point



         #Ctrlp:construct.c.page1.inbb007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb007
            #add-point:ON ACTION controlp INFIELD inbb007 name="construct.c.page1.inbb007"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_inaa001_2()                    #呼叫開窗
            DISPLAY g_qryparam.return1 TO inbb007  #顯示到畫面上
            NEXT FIELD inbb007                     #返回原欄位

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb007
            #add-point:BEFORE FIELD inbb007 name="construct.b.page1.inbb007"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb007

            #add-point:AFTER FIELD inbb007 name="construct.a.page1.inbb007"

            #END add-point



         #Ctrlp:construct.c.page1.inbb008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb008
            #add-point:ON ACTION controlp INFIELD inbb008 name="construct.c.page1.inbb008"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_inab002()                    #呼叫開窗
            DISPLAY g_qryparam.return2 TO inbb008  #顯示到畫面上
            NEXT FIELD inbb008                     #返回原欄位

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb008
            #add-point:BEFORE FIELD inbb008 name="construct.b.page1.inbb008"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb008

            #add-point:AFTER FIELD inbb008 name="construct.a.page1.inbb008"

            #END add-point



         #Ctrlp:construct.c.page1.inbb009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb009
            #add-point:ON ACTION controlp INFIELD inbb009 name="construct.c.page1.inbb009"
            #INITIALIZE g_qryparam.* TO NULL
            #LET g_qryparam.state = 'c'
            #LET g_qryparam.reqry = FALSE
            #CALL q_inag004_13()                    #呼叫開窗
            #DISPLAY g_qryparam.return3 TO inbb009  #顯示到畫面上
            #NEXT FIELD inbb009                     #返回原欄位

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb009
            #add-point:BEFORE FIELD inbb009 name="construct.b.page1.inbb009"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb009

            #add-point:AFTER FIELD inbb009 name="construct.a.page1.inbb009"

            #END add-point



         #Ctrlp:construct.c.page1.inbb010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb010
            #add-point:ON ACTION controlp INFIELD inbb010 name="construct.c.page1.inbb010"
                                                #此段落由子樣板a08產生
            #開窗c段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
		   	LET g_qryparam.reqry = FALSE
            CALL q_ooca001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO inbb010  #顯示到畫面上

            NEXT FIELD inbb010                     #返回原欄位


            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb010
            #add-point:BEFORE FIELD inbb010 name="construct.b.page1.inbb010"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb010

            #add-point:AFTER FIELD inbb010 name="construct.a.page1.inbb010"

            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb003
            #add-point:BEFORE FIELD inbb003 name="construct.b.page1.inbb003"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb003

            #add-point:AFTER FIELD inbb003 name="construct.a.page1.inbb003"

            #END add-point



         #Ctrlp:construct.c.page1.inbb003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb003
            #add-point:ON ACTION controlp INFIELD inbb003 name="construct.c.page1.inbb003"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb011
            #add-point:BEFORE FIELD inbb011 name="construct.b.page1.inbb011"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb011

            #add-point:AFTER FIELD inbb011 name="construct.a.page1.inbb011"

            #END add-point



         #Ctrlp:construct.c.page1.inbb011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb011
            #add-point:ON ACTION controlp INFIELD inbb011 name="construct.c.page1.inbb011"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb012
            #add-point:BEFORE FIELD inbb012 name="construct.b.page1.inbb012"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb012

            #add-point:AFTER FIELD inbb012 name="construct.a.page1.inbb012"

            #END add-point



         #Ctrlp:construct.c.page1.inbb012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb012
            #add-point:ON ACTION controlp INFIELD inbb012 name="construct.c.page1.inbb012"

            #END add-point


         #Ctrlp:construct.c.page1.inbb013
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb013
            #add-point:ON ACTION controlp INFIELD inbb013 name="construct.c.page1.inbb013"
                                                #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooca001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO inbb013  #顯示到畫面上

            NEXT FIELD inbb013                     #返回原欄位


            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb013
            #add-point:BEFORE FIELD inbb013 name="construct.b.page1.inbb013"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb013

            #add-point:AFTER FIELD inbb013 name="construct.a.page1.inbb013"

            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb014
            #add-point:BEFORE FIELD inbb014 name="construct.b.page1.inbb014"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb014

            #add-point:AFTER FIELD inbb014 name="construct.a.page1.inbb014"

            #END add-point



         #Ctrlp:construct.c.page1.inbb014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb014
            #add-point:ON ACTION controlp INFIELD inbb014 name="construct.c.page1.inbb014"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb015
            #add-point:BEFORE FIELD inbb015 name="construct.b.page1.inbb015"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb015

            #add-point:AFTER FIELD inbb015 name="construct.a.page1.inbb015"

            #END add-point



         #Ctrlp:construct.c.page1.inbb015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb015
            #add-point:ON ACTION controlp INFIELD inbb015 name="construct.c.page1.inbb015"

            #END add-point


         #Ctrlp:construct.c.page1.inbb016
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb016
            #add-point:ON ACTION controlp INFIELD inbb016 name="construct.c.page1.inbb016"
                                                #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
			LET g_qryparam.arg1 = g_acc
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO inbb016  #顯示到畫面上

            NEXT FIELD inbb016                     #返回原欄位


            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb016
            #add-point:BEFORE FIELD inbb016 name="construct.b.page1.inbb016"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb016

            #add-point:AFTER FIELD inbb016 name="construct.a.page1.inbb016"

            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb016_desc
            #add-point:BEFORE FIELD inbb016_desc name="construct.b.page1.inbb016_desc"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb016_desc

            #add-point:AFTER FIELD inbb016_desc name="construct.a.page1.inbb016_desc"

            #END add-point



         #Ctrlp:construct.c.page1.inbb016_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb016_desc
            #add-point:ON ACTION controlp INFIELD inbb016_desc name="construct.c.page1.inbb016_desc"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb017
            #add-point:BEFORE FIELD inbb017 name="construct.b.page1.inbb017"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb017

            #add-point:AFTER FIELD inbb017 name="construct.a.page1.inbb017"

            #END add-point



         #Ctrlp:construct.c.page1.inbb017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb017
            #add-point:ON ACTION controlp INFIELD inbb017 name="construct.c.page1.inbb017"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb018
            #add-point:BEFORE FIELD inbb018 name="construct.b.page1.inbb018"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb018

            #add-point:AFTER FIELD inbb018 name="construct.a.page1.inbb018"

            #END add-point



         #Ctrlp:construct.c.page1.inbb018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb018
            #add-point:ON ACTION controlp INFIELD inbb018 name="construct.c.page1.inbb018"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb019
            #add-point:BEFORE FIELD inbb019 name="construct.b.page1.inbb019"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb019

            #add-point:AFTER FIELD inbb019 name="construct.a.page1.inbb019"

            #END add-point



         #Ctrlp:construct.c.page1.inbb019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb019
            #add-point:ON ACTION controlp INFIELD inbb019 name="construct.c.page1.inbb019"

            #END add-point


         #Ctrlp:construct.c.page1.inbb023
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb023
            #add-point:ON ACTION controlp INFIELD inbb023 name="construct.c.page1.inbb023"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pjba001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO inbb023  #顯示到畫面上
            NEXT FIELD inbb023                     #返回原欄位



            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb023
            #add-point:BEFORE FIELD inbb023 name="construct.b.page1.inbb023"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb023

            #add-point:AFTER FIELD inbb023 name="construct.a.page1.inbb023"

            #END add-point



         #Ctrlp:construct.c.page1.inbb024
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb024
            #add-point:ON ACTION controlp INFIELD inbb024 name="construct.c.page1.inbb024"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pjbb002_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO inbb024  #顯示到畫面上
            NEXT FIELD inbb024                     #返回原欄位



            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb024
            #add-point:BEFORE FIELD inbb024 name="construct.b.page1.inbb024"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb024

            #add-point:AFTER FIELD inbb024 name="construct.a.page1.inbb024"

            #END add-point



         #Ctrlp:construct.c.page1.inbb025
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb025
            #add-point:ON ACTION controlp INFIELD inbb025 name="construct.c.page1.inbb025"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pjbm002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO inbb025  #顯示到畫面上
            NEXT FIELD inbb025                     #返回原欄位



            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb025
            #add-point:BEFORE FIELD inbb025 name="construct.b.page1.inbb025"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb025

            #add-point:AFTER FIELD inbb025 name="construct.a.page1.inbb025"

            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb020
            #add-point:BEFORE FIELD inbb020 name="construct.b.page1.inbb020"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb020

            #add-point:AFTER FIELD inbb020 name="construct.a.page1.inbb020"

            #END add-point



         #Ctrlp:construct.c.page1.inbb020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb020
            #add-point:ON ACTION controlp INFIELD inbb020 name="construct.c.page1.inbb020"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb204
            #add-point:BEFORE FIELD inbb204 name="construct.b.page1.inbb204"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb204

            #add-point:AFTER FIELD inbb204 name="construct.a.page1.inbb204"

            #END add-point



         #Ctrlp:construct.c.page1.inbb204
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb204
            #add-point:ON ACTION controlp INFIELD inbb204 name="construct.c.page1.inbb204"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb022
            #add-point:BEFORE FIELD inbb022 name="construct.b.page1.inbb022"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb022

            #add-point:AFTER FIELD inbb022 name="construct.a.page1.inbb022"

            #END add-point



         #Ctrlp:construct.c.page1.inbb022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb022
            #add-point:ON ACTION controlp INFIELD inbb022 name="construct.c.page1.inbb022"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb021
            #add-point:BEFORE FIELD inbb021 name="construct.b.page1.inbb021"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb021

            #add-point:AFTER FIELD inbb021 name="construct.a.page1.inbb021"

            #END add-point



         #Ctrlp:construct.c.page1.inbb021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb021
            #add-point:ON ACTION controlp INFIELD inbb021 name="construct.c.page1.inbb021"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooff013
            #add-point:BEFORE FIELD ooff013 name="construct.b.page1.ooff013"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ooff013

            #add-point:AFTER FIELD ooff013 name="construct.a.page1.ooff013"

            #END add-point



         #Ctrlp:construct.c.page1.ooff013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ooff013
            #add-point:ON ACTION controlp INFIELD ooff013 name="construct.c.page1.ooff013"

            #END add-point




      END CONSTRUCT





      #add-point:cs段add_cs(本段內只能出現新的CONSTRUCT指令) name="cs.add_cs"
      SUBDIALOG aoo_aooi360_01.aooi360_01_construct   #备注单身  #161031-00025#7
      #end add-point

      BEFORE DIALOG
         CALL cl_qbe_init()
         #add-point:cs段b_dialog name="cs.b_dialog"
         #161117-00032#1-S
         LET g_inbb_d[1].inbbseq = ""
         DISPLAY ARRAY g_inbb_d TO s_detail1.*
            BEFORE DISPLAY
               EXIT DISPLAY
         END DISPLAY
         #161117-00032#1-E
         #end add-point

      #查詢方案列表
      ON ACTION qbe_select
         LET ls_wc = ""
         CALL cl_qbe_list("c") RETURNING ls_wc
         IF NOT cl_null(ls_wc) THEN
            CALL util.JSON.parse(ls_wc, la_wc)
            INITIALIZE g_wc, g_wc2, g_wc2_table1, g_wc2_extend TO NULL

            FOR li_idx = 1 TO la_wc.getLength()
               CASE
                  WHEN la_wc[li_idx].tableid = "inba_t"
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "inbb_t"
                     LET g_wc2_table1 = la_wc[li_idx].wc

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




   #add-point:cs段結束前 name="cs.after_construct"

   #end add-point

   IF INT_FLAG THEN
      RETURN
   END IF

END FUNCTION

{</section>}

{<section id="aint302.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION aint302_filter()
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
      CONSTRUCT g_wc_filter ON inbadocno,inbadocdt,inba002,inba003,inba004
                          FROM s_browse[1].b_inbadocno,s_browse[1].b_inbadocdt,s_browse[1].b_inba002,
                              s_browse[1].b_inba003,s_browse[1].b_inba004

         BEFORE CONSTRUCT
               DISPLAY aint302_filter_parser('inbadocno') TO s_browse[1].b_inbadocno
            DISPLAY aint302_filter_parser('inbadocdt') TO s_browse[1].b_inbadocdt
            DISPLAY aint302_filter_parser('inba002') TO s_browse[1].b_inba002
            DISPLAY aint302_filter_parser('inba003') TO s_browse[1].b_inba003
            DISPLAY aint302_filter_parser('inba004') TO s_browse[1].b_inba004

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

      CALL aint302_filter_show('inbadocno')
   CALL aint302_filter_show('inbadocdt')
   CALL aint302_filter_show('inba002')
   CALL aint302_filter_show('inba003')
   CALL aint302_filter_show('inba004')

END FUNCTION

{</section>}

{<section id="aint302.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION aint302_filter_parser(ps_field)
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

{<section id="aint302.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION aint302_filter_show(ps_field)
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
   LET ls_condition = aint302_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF

   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)

END FUNCTION

{</section>}

{<section id="aint302.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION aint302_query()
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
   CALL g_inbb_d.clear()


   #add-point:query段other name="query.other"
   CALL aooi360_01_clear_detail()   #清除备注单身  #161031-00025#7
   #end add-point

   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count

   CALL aint302_construct()

   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL aint302_browser_fill("")
      CALL aint302_fetch("")
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

   LET g_error_show  = 1
   LET g_wc_filter   = ""
   LET l_ac = 1
   CALL FGL_SET_ARR_CURR(1)
      CALL aint302_filter_show('inbadocno')
   CALL aint302_filter_show('inbadocdt')
   CALL aint302_filter_show('inba002')
   CALL aint302_filter_show('inba003')
   CALL aint302_filter_show('inba004')
   CALL aint302_browser_fill("F")

   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ""
      LET g_errparam.code = "-100"
      LET g_errparam.popup = TRUE
      CALL cl_err()
   ELSE
      CALL aint302_fetch("F")
      #顯示單身筆數
      CALL aint302_idx_chk()
   END IF

END FUNCTION

{</section>}

{<section id="aint302.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION aint302_fetch(p_flag)
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

   LET g_inba_m.inbadocno = g_browser[g_current_idx].b_inbadocno


   #重讀DB,因TEMP有不被更新特性
   EXECUTE aint302_master_referesh USING g_inba_m.inbadocno INTO g_inba_m.inbadocno,g_inba_m.inbasite,
       g_inba_m.inbadocdt,g_inba_m.inba002,g_inba_m.inba003,g_inba_m.inba004,g_inba_m.inbastus,g_inba_m.inba005,
       g_inba_m.inba006,g_inba_m.inba007,g_inba_m.inba008,g_inba_m.inbaownid,g_inba_m.inbacrtdp,g_inba_m.inbaowndp,
       g_inba_m.inbacrtdt,g_inba_m.inbacrtid,g_inba_m.inbamodid,g_inba_m.inbacnfdt,g_inba_m.inbamoddt,
       g_inba_m.inbapstid,g_inba_m.inbacnfid,g_inba_m.inbapstdt,g_inba_m.inba003_desc,g_inba_m.inba004_desc,
       g_inba_m.inbaownid_desc,g_inba_m.inbacrtdp_desc,g_inba_m.inbaowndp_desc,g_inba_m.inbacrtid_desc,
       g_inba_m.inbamodid_desc,g_inba_m.inbapstid_desc,g_inba_m.inbacnfid_desc

   #遮罩相關處理
   LET g_inba_m_mask_o.* =  g_inba_m.*
   CALL aint302_inba_t_mask()
   LET g_inba_m_mask_n.* =  g_inba_m.*

   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL aint302_set_act_visible()
   CALL aint302_set_act_no_visible()

   #add-point:fetch段action控制 name="fetch.action_control"
   CALL cl_set_act_visible("modify,delete,query,modify_detail",TRUE)
   IF g_inba_m.inbastus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail",FALSE)
   END IF
   IF NOT cl_null(g_argv[02]) THEN
      CALL cl_set_act_visible("query",FALSE)
   END IF
   #add by lixh 20150818
#   IF g_prog = 'aint301' THEN
#      CALL cl_set_act_visible("gen_qc,qc_query,storage_by_qc",FALSE)
#   END IF
   #add by lixh 20150818

   #add by lixh 20150901
   #CALL cl_set_toolbaritem_visible("s_lot_ins,s_lot_sel,s_lot_sel1",TRUE)  #mark by lixh 20151010
   #aint301單身異動申請明細頁籤與入庫明細頁籤的[有效日期]、[存貨備註]欄位需隱藏不可維護
   #IF g_argv[1] = '1' THEN  #161109-00032#1 mark
   IF g_argv[1] = '1' OR g_argv[1] = '3' THEN  #161109-00032#1
      CALL cl_set_toolbaritem_visible("s_lot_ins",FALSE)
   ELSE
      CALL cl_set_toolbaritem_visible("s_lot_sel1",FALSE)
   END IF
   #add by lixh 20150901
   #150310-00003#19 add by lixh 20160223
   IF g_inba_m.inba005 = '10' AND NOT cl_null(g_inba_m.inba006) THEN
      CALL cl_set_act_visible("modify,delete,modify_detail",FALSE)
   END IF
   #150310-00003#19 add by lixh 20160223
   #end add-point



   #add-point:fetch結束前 name="fetch.after"

   #end add-point

   #保存單頭舊值
   LET g_inba_m_t.* = g_inba_m.*
   LET g_inba_m_o.* = g_inba_m.*

   LET g_data_owner = g_inba_m.inbaownid
   LET g_data_dept  = g_inba_m.inbaowndp

   #重新顯示
   CALL aint302_show()

   #應用 a56 樣板自動產生(Version:3)
   #檢查此單據是否需顯示BPM簽核狀況按鈕
   IF cl_bpm_chk() THEN
      CALL cl_set_act_visible("bpm_status",TRUE)
   ELSE
      CALL cl_set_act_visible("bpm_status",FALSE)
   END IF





END FUNCTION

{</section>}

{<section id="aint302.insert" >}
#+ 資料新增
PRIVATE FUNCTION aint302_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"

   #end add-point
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
            #新增前,若當下有資料先備份單別/單號,作為後續欄位控制條件
   IF NOT cl_null(g_inba_m.inbadocno) THEN
      LET g_inbadocno_t = g_inba_m.inbadocno
   END IF
   #end add-point

   #add-point:Function前置處理  name="insert.pre_function"

   #end add-point

   #清畫面欄位內容
   CLEAR FORM
   CALL g_inbb_d.clear()


   INITIALIZE g_inba_m.* TO NULL             #DEFAULT 設定

   LET g_inbadocno_t = NULL


   LET g_master_insert = FALSE

   #add-point:insert段before name="insert.before"
   CALL aooi360_01_clear_detail()   #清除备注单身  #161031-00025#7
   #end add-point

   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)
      #公用欄位新增給值
      LET g_inba_m.inbaownid = g_user
      LET g_inba_m.inbaowndp = g_dept
      LET g_inba_m.inbacrtid = g_user
      LET g_inba_m.inbacrtdp = g_dept
      LET g_inba_m.inbacrtdt = cl_get_current()
      LET g_inba_m.inbamodid = g_user
      LET g_inba_m.inbamoddt = cl_get_current()
      LET g_inba_m.inbastus = 'N'




      #append欄位給值


      #一般欄位給值
            LET g_inba_m.inba005 = "1"


      #add-point:單頭預設值 name="insert.default"
      CALL g_inbc_d.clear()
      CALL g_inao_d.clear()
      CALL g_inao_d2.clear()

      LET g_inba_m.inbasite = g_site
      LET g_inba_m.inbastus = "N"

      LET g_inba_m.inbadocdt = g_today
      #170405-00051#1-S add
      #docdt欄位依照設定關閉(FALSE則為設定不同意修正)
      LET g_inba_m.inbadocdt = cl_get_today()
      #IF NOT cl_chk_update_docdt() THEN
         #若關帳日期>今天，擇預設為關帳日期+1
         IF g_docdt >= cl_get_today() THEN
            LET g_inba_m.inbadocdt = g_docdt + 1
         ELSE
            LET g_inba_m.inbadocdt = cl_get_today()
         END IF
      #END IF
      #170405-00051#1-E add
      LET g_inba_m.inba002 = g_today
      LET g_inba_m.inba003 = g_user
      CALL aint302_inba003_ref(g_inba_m.inba003) RETURNING g_inba_m.inba003_desc
      DISPLAY BY NAME g_inba_m.inba003_desc

      LET g_inba_m.inba004 = g_dept
      CALL aint302_inba004_ref(g_inba_m.inba004) RETURNING g_inba_m.inba004_desc
      DISPLAY BY NAME g_inba_m.inba004_desc

      ##161109-00032#1-S
      IF g_type = '3' OR g_type = '4' THEN
         LET g_inba_m.inba005 = '1'
         DISPLAY BY NAME g_inba_m.inba005
      END IF
      ##161109-00032#1-E
      INITIALIZE g_inba_m_t.* TO NULL
      LET g_inba_m_t.* = g_inba_m.*

      CALL s_lot_clear_detail()
      #161031-00025#7---s
      LET g_ooff001_d = '6'   #6.單據單頭備註
      LET g_ooff002_d = g_prog
      LET g_ooff003_d = ''    #单号
      LET g_ooff004_d = 0     #项次
      LET g_ooff005_d = ' '
      LET g_ooff006_d = ' '
      LET g_ooff007_d = ' '
      LET g_ooff008_d = ' '
      LET g_ooff009_d = ' '
      LET g_ooff010_d = ' '
      LET g_ooff011_d = ' '
      #161031-00025#7---e
      #end add-point

      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_inba_m_t.* = g_inba_m.*
      LET g_inba_m_o.* = g_inba_m.*

      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_inba_m.inbastus
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "S"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
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
         WHEN "Z"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")

      END CASE




      CALL aint302_input("a")

      #add-point:單頭輸入後 name="insert.after_insert"

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
         INITIALIZE g_inba_m.* TO NULL
         INITIALIZE g_inbb_d TO NULL

         #add-point:取消新增後 name="insert.cancel"

         #end add-point
         CALL aint302_show()
         CALL aint302_idx_chk()   #(ver:83)
         RETURN
      END IF

      LET INT_FLAG = 0
      #CALL g_inbb_d.clear()


      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE

   END WHILE

   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL aint302_set_act_visible()
   CALL aint302_set_act_no_visible()

   #將新增的資料併入搜尋條件中
   LET g_inbadocno_t = g_inba_m.inbadocno


   #組合新增資料的條件
   LET g_add_browse = " inbaent = " ||g_enterprise|| " AND",
                      " inbadocno = '", g_inba_m.inbadocno, "' "


   #add-point:組合新增資料的條件後 name="insert.after.add_browse"

   #end add-point

   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL aint302_browser_fill("")

   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)

   CLOSE aint302_cl

   CALL aint302_idx_chk()

   #撈取異動後的資料(主要是帶出reference)
   EXECUTE aint302_master_referesh USING g_inba_m.inbadocno INTO g_inba_m.inbadocno,g_inba_m.inbasite,
       g_inba_m.inbadocdt,g_inba_m.inba002,g_inba_m.inba003,g_inba_m.inba004,g_inba_m.inbastus,g_inba_m.inba005,
       g_inba_m.inba006,g_inba_m.inba007,g_inba_m.inba008,g_inba_m.inbaownid,g_inba_m.inbacrtdp,g_inba_m.inbaowndp,
       g_inba_m.inbacrtdt,g_inba_m.inbacrtid,g_inba_m.inbamodid,g_inba_m.inbacnfdt,g_inba_m.inbamoddt,
       g_inba_m.inbapstid,g_inba_m.inbacnfid,g_inba_m.inbapstdt,g_inba_m.inba003_desc,g_inba_m.inba004_desc,
       g_inba_m.inbaownid_desc,g_inba_m.inbacrtdp_desc,g_inba_m.inbaowndp_desc,g_inba_m.inbacrtid_desc,
       g_inba_m.inbamodid_desc,g_inba_m.inbapstid_desc,g_inba_m.inbacnfid_desc


   #遮罩相關處理
   LET g_inba_m_mask_o.* =  g_inba_m.*
   CALL aint302_inba_t_mask()
   LET g_inba_m_mask_n.* =  g_inba_m.*

   #將資料顯示到畫面上
   DISPLAY BY NAME g_inba_m.inbadocno,g_inba_m.inbadocno_desc,g_inba_m.inbasite,g_inba_m.inbadocdt,g_inba_m.inba002,
       g_inba_m.inba003,g_inba_m.inba003_desc,g_inba_m.inba004,g_inba_m.inba004_desc,g_inba_m.inbastus,
       g_inba_m.inba005,g_inba_m.inba006,g_inba_m.inba007,g_inba_m.inba007_desc,g_inba_m.inba008,g_inba_m.inbaownid,
       g_inba_m.inbaownid_desc,g_inba_m.inbacrtdp,g_inba_m.inbacrtdp_desc,g_inba_m.inbaowndp,g_inba_m.inbaowndp_desc,
       g_inba_m.inbacrtdt,g_inba_m.inbacrtid,g_inba_m.inbacrtid_desc,g_inba_m.inbamodid,g_inba_m.inbamodid_desc,
       g_inba_m.inbacnfdt,g_inba_m.inbamoddt,g_inba_m.inbapstid,g_inba_m.inbapstid_desc,g_inba_m.inbacnfid,
       g_inba_m.inbacnfid_desc,g_inba_m.inbapstdt

   #add-point:新增結束後 name="insert.after"

   #end add-point

   LET g_data_owner = g_inba_m.inbaownid
   LET g_data_dept  = g_inba_m.inbaowndp

   #功能已完成,通報訊息中心
   CALL aint302_msgcentre_notify('insert')

   CALL aint302_idx_chk()   #(ver:83)

END FUNCTION

{</section>}

{<section id="aint302.modify" >}
#+ 資料修改
PRIVATE FUNCTION aint302_modify()
   #add-point:modify段define(客製用) name="modify.define_customerization"

   #end add-point
   DEFINE l_new_key    DYNAMIC ARRAY OF STRING
   DEFINE l_old_key    DYNAMIC ARRAY OF STRING
   DEFINE l_field_key  DYNAMIC ARRAY OF STRING
   DEFINE l_wc2_table1          STRING


   #add-point:modify段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"

   #end add-point

   #add-point:Function前置處理  name="modify.pre_function"

   #end add-point

   #保存單頭舊值
   LET g_inba_m_t.* = g_inba_m.*
   LET g_inba_m_o.* = g_inba_m.*

   IF g_inba_m.inbadocno IS NULL

   THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ""
      LET g_errparam.code = "std-00003"
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN
   END IF

   ERROR ""

   LET g_inbadocno_t = g_inba_m.inbadocno

   CALL s_transaction_begin()

   OPEN aint302_cl USING g_enterprise,g_inba_m.inbadocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "OPEN aint302_cl:",SQLERRMESSAGE
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE
      CLOSE aint302_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF

   #顯示最新的資料
   EXECUTE aint302_master_referesh USING g_inba_m.inbadocno INTO g_inba_m.inbadocno,g_inba_m.inbasite,
       g_inba_m.inbadocdt,g_inba_m.inba002,g_inba_m.inba003,g_inba_m.inba004,g_inba_m.inbastus,g_inba_m.inba005,
       g_inba_m.inba006,g_inba_m.inba007,g_inba_m.inba008,g_inba_m.inbaownid,g_inba_m.inbacrtdp,g_inba_m.inbaowndp,
       g_inba_m.inbacrtdt,g_inba_m.inbacrtid,g_inba_m.inbamodid,g_inba_m.inbacnfdt,g_inba_m.inbamoddt,
       g_inba_m.inbapstid,g_inba_m.inbacnfid,g_inba_m.inbapstdt,g_inba_m.inba003_desc,g_inba_m.inba004_desc,
       g_inba_m.inbaownid_desc,g_inba_m.inbacrtdp_desc,g_inba_m.inbaowndp_desc,g_inba_m.inbacrtid_desc,
       g_inba_m.inbamodid_desc,g_inba_m.inbapstid_desc,g_inba_m.inbacnfid_desc

   #檢查是否允許此動作
   IF NOT aint302_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF

   #遮罩相關處理
   LET g_inba_m_mask_o.* =  g_inba_m.*
   CALL aint302_inba_t_mask()
   LET g_inba_m_mask_n.* =  g_inba_m.*



   #add-point:modify段show之前 name="modify.before_show"

   #end add-point

   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"



   CALL aint302_show()
   #add-point:modify段show之後 name="modify.after_show"
   #150310-00003#19 add by lixh 20160223
   IF g_inba_m.inba005 = '10' AND NOT cl_null(g_inba_m.inba006) THEN
      CLOSE aint302_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   #150310-00003#19 add by lixh 20160223
   #end add-point

   #LET g_wc2_table1 = l_wc2_table1



   WHILE TRUE
      LET g_inbadocno_t = g_inba_m.inbadocno


      #寫入修改者/修改日期資訊(單頭)
      LET g_inba_m.inbamodid = g_user
LET g_inba_m.inbamoddt = cl_get_current()
LET g_inba_m.inbamodid_desc = cl_get_username(g_inba_m.inbamodid)

      #add-point:modify段修改前 name="modify.before_input"
      #「D抽單 / R已拒絕」狀況碼更改資料後，需還原為「N未確認」
      IF g_inba_m.inbastus MATCHES "[DR]" THEN
         LET g_inba_m.inbastus = "N"
      END IF

      #end add-point

      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL aint302_input("u")
      LET g_loc = 'n'

      #add-point:modify段修改後 name="modify.after_input"
      CALL aint302_show()  #170220-00047#1----add
      #end add-point

      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE inba_t SET (inbamodid,inbamoddt) = (g_inba_m.inbamodid,g_inba_m.inbamoddt)
          WHERE inbaent = g_enterprise AND inbadocno = g_inbadocno_t

      END IF

      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_inba_m.* = g_inba_m_t.*
         #  CALL aint302_show()   #(ver:83)
         END IF
         CALL aint302_show()   #(ver:83)
         CALL aint302_idx_chk()   #(ver:83)
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = ''
         LET g_errparam.code = 9001
         LET g_errparam.popup = FALSE
         CALL cl_err()
         RETURN
      END IF

      #若單頭key欄位有變更
      IF g_inba_m.inbadocno != g_inba_m_t.inbadocno

      THEN
         CALL s_transaction_begin()

         #add-point:單身fk修改前 name="modify.body.b_fk_update"

         #end add-point

         #更新單身key值
         UPDATE inbb_t SET inbbdocno = g_inba_m.inbadocno

          WHERE inbbent = g_enterprise AND inbbdocno = g_inba_m_t.inbadocno


         #add-point:單身fk修改中 name="modify.body.m_fk_update"

         #end add-point

         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL
            #   LET g_errparam.extend = "inbb_t"
            #   LET g_errparam.code = "std-00009"
            #   LET g_errparam.popup = TRUE
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "inbb_t:",SQLERRMESSAGE
               LET g_errparam.code = SQLCA.SQLCODE
               LET g_errparam.popup = TRUE
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CONTINUE WHILE
         END CASE

         #add-point:單身fk修改後 name="modify.body.a_fk_update"

         #end add-point





         #UPDATE 多語言table key值

            #161130-00056 add

         CALL s_transaction_end('Y','0')
      END IF

      EXIT WHILE
   END WHILE

   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL aint302_set_act_visible()
   CALL aint302_set_act_no_visible()

   #組合新增資料的條件
   LET g_add_browse = " inbaent = " ||g_enterprise|| " AND",
                      " inbadocno = '", g_inba_m.inbadocno, "' "

   #填到對應位置
   CALL aint302_browser_fill("")

   CLOSE aint302_cl

   CALL s_transaction_end('Y','0')

   #功能已完成,通報訊息中心
   CALL aint302_msgcentre_notify('modify')

   CALL aint302_idx_chk() #ver:83

END FUNCTION

{</section>}

{<section id="aint302.input" >}
#+ 資料輸入
PRIVATE FUNCTION aint302_input(p_cmd)
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
   DEFINE  l_success       LIKE type_t.num5
   DEFINE  l_ooef004       LIKE ooef_t.ooef004
   DEFINE  l_ooac004       LIKE ooac_t.ooac004
   DEFINE  l_inaa007       LIKE inaa_t.inaa007
   DEFINE  l_rate          LIKE inaj_t.inaj014
   DEFINE  l_ooba002       LIKE ooba_t.ooba002
   DEFINE  l_ooba015       LIKE ooba_t.ooba015
   DEFINE  l_site          LIKE ooef_t.ooef001
   DEFINE  l_ooba014       LIKE ooba_t.ooba014
   DEFINE  l_flag1         LIKE type_t.num5
   DEFINE  l_ooac002       LIKE ooac_t.ooac002
   DEFINE  l_imaa005       LIKE imaa_t.imaa005       #特徵類別
   DEFINE  l_inam          DYNAMIC ARRAY OF RECORD   #記錄產品特徵
              inam001      LIKE inam_t.inam001,
              inam002      LIKE inam_t.inam002,
              inam004      LIKE inam_t.inam004
                        END RECORD
   #DEFINE l_inbb           RECORD LIKE inbb_t.*  #161124-00048#13  16/12/29 By 08734 mark
   #161124-00048#13  16/12/29 By 08734 add(S)
   DEFINE l_inbb RECORD  #雜項庫存異動申請明細檔
       inbbent LIKE inbb_t.inbbent, #企业编号
       inbbsite LIKE inbb_t.inbbsite, #营运据点
       inbbdocno LIKE inbb_t.inbbdocno, #单据编号
       inbbseq LIKE inbb_t.inbbseq, #项次
       inbb026 LIKE inbb_t.inbb026, #條碼編號   ##170310-00005#25 add
       inbb001 LIKE inbb_t.inbb001, #料件编号
       inbb002 LIKE inbb_t.inbb002, #产品特征
       inbb003 LIKE inbb_t.inbb003, #库存管理特征
       inbb004 LIKE inbb_t.inbb004, #包装容器编号
       inbb007 LIKE inbb_t.inbb007, #库位
       inbb008 LIKE inbb_t.inbb008, #限定储位
       inbb009 LIKE inbb_t.inbb009, #限定批号
       inbb010 LIKE inbb_t.inbb010, #交易单位
       inbb011 LIKE inbb_t.inbb011, #申请数量
       inbb012 LIKE inbb_t.inbb012, #实际异动数量
       inbb013 LIKE inbb_t.inbb013, #参考单位
       inbb014 LIKE inbb_t.inbb014, #参考单位申请数量
       inbb015 LIKE inbb_t.inbb015, #参考单位实际数量
       inbb016 LIKE inbb_t.inbb016, #理由码
       inbb017 LIKE inbb_t.inbb017, #来源单号
       inbb018 LIKE inbb_t.inbb018, #检验否
       inbb019 LIKE inbb_t.inbb019, #检验合格量
       inbb020 LIKE inbb_t.inbb020, #单据备注
       inbb021 LIKE inbb_t.inbb021, #存货备注
       inbb022 LIKE inbb_t.inbb022, #有效日期
       inbb200 LIKE inbb_t.inbb200, #商品条码
       inbb201 LIKE inbb_t.inbb201, #包装单位
       inbb202 LIKE inbb_t.inbb202, #申请包装数量
       inbb203 LIKE inbb_t.inbb203, #实际包装数量
       inbbunit LIKE inbb_t.inbbunit, #应用组织
       inbb204 LIKE inbb_t.inbb204, #制造日期
       inbb023 LIKE inbb_t.inbb023, #项目编号
       inbb024 LIKE inbb_t.inbb024, #WBS
       inbb025 LIKE inbb_t.inbb025, #活动编号
       inbb205 LIKE inbb_t.inbb205, #领用/退回单价
       inbb206 LIKE inbb_t.inbb206, #领用/退回金额
       inbb207 LIKE inbb_t.inbb207, #成本单价
       inbb208 LIKE inbb_t.inbb208, #成本金额
       inbb209 LIKE inbb_t.inbb209, #费用编号
       inbb210 LIKE inbb_t.inbb210, #进价
       inbb211 LIKE inbb_t.inbb211, #来源单据项次
       inbb212 LIKE inbb_t.inbb212, #来源单据项序
       inbb213 LIKE inbb_t.inbb213, #转入商品条码
       inbb214 LIKE inbb_t.inbb214, #转入商品编号
       inbb215 LIKE inbb_t.inbb215, #转入产品特征
       inbb216 LIKE inbb_t.inbb216, #转入单位
       inbb217 LIKE inbb_t.inbb217, #转入数量
       inbb218 LIKE inbb_t.inbb218, #转入包装单位
       inbb219 LIKE inbb_t.inbb219, #转入包装数量
       inbb220 LIKE inbb_t.inbb220, #转入库位
       inbb221 LIKE inbb_t.inbb221, #转入储位
       inbb222 LIKE inbb_t.inbb222, #转入批号
       inbb223 LIKE inbb_t.inbb223, #转入进价
       inbb224 LIKE inbb_t.inbb224, #计价单位
       inbb225 LIKE inbb_t.inbb225 #计价数量
END RECORD
#161124-00048#13  16/12/29 By 08734 add(E)
   DEFINE l_inbbseq        LIKE inbb_t.inbbseq
   DEFINE l_inbc016        LIKE inbc_t.inbc016   #有效日期
   DEFINE l_imaf032        LIKE imaf_t.imaf032   #有效期加天數
   DEFINE l_inbcseq1       LIKE inbc_t.inbcseq1
   DEFINE l_amount         LIKE inbb_t.inbb011
   DEFINE l_sql1           STRING
   DEFINE l_sql2           STRING
   DEFINE l_imaf062        LIKE imaf_t.imaf062
   DEFINE l_imaf063        LIKE imaf_t.imaf063
   DEFINE l_imaf061        LIKE imaf_t.imaf061
   DEFINE l_imaf031        LIKE imaf_t.imaf031
   DEFINE l_inad011        LIKE inad_t.inad011
   DEFINE l_imaf071        LIKE imaf_t.imaf071
   DEFINE l_imaf081        LIKE imaf_t.imaf081
   DEFINE r_success        LIKE type_t.num5
   DEFINE l_imaf055        LIKE imaf_t.imaf055
   DEFINE l_imaf016        LIKE imaf_t.imaf016   #161114-00040#1 add
   DEFINE l_j              LIKE type_t.num5      #161114-00040#1 add
   DEFINE l_rep_flag       LIKE type_t.num5      #170509-00052#1 add 用来记录是否是复制触发的before insert
#160617-00005#1---s--
DEFINE l_oofg_return DYNAMIC ARRAY OF RECORD
          oofg019     LIKE oofg_t.oofg019,   #field
          oofg020     LIKE oofg_t.oofg020    #value
                  END RECORD
#160617-00005#1---e--
#170309-00052#1-S
DEFINE  l_flag2       LIKE type_t.chr1
DEFINE  l_imaf071_t   LIKE imaf_t.imaf071
DEFINE  l_imaf081_t   LIKE imaf_t.imaf081
#170309-00052#1-E
DEFINE  l_cnt1        LIKE type_t.num5   #170323-00024#1 add by 08172
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
   DISPLAY BY NAME g_inba_m.inbadocno,g_inba_m.inbadocno_desc,g_inba_m.inbasite,g_inba_m.inbadocdt,g_inba_m.inba002,
       g_inba_m.inba003,g_inba_m.inba003_desc,g_inba_m.inba004,g_inba_m.inba004_desc,g_inba_m.inbastus,
       g_inba_m.inba005,g_inba_m.inba006,g_inba_m.inba007,g_inba_m.inba007_desc,g_inba_m.inba008,g_inba_m.inbaownid,
       g_inba_m.inbaownid_desc,g_inba_m.inbacrtdp,g_inba_m.inbacrtdp_desc,g_inba_m.inbaowndp,g_inba_m.inbaowndp_desc,
       g_inba_m.inbacrtdt,g_inba_m.inbacrtid,g_inba_m.inbacrtid_desc,g_inba_m.inbamodid,g_inba_m.inbamodid_desc,
       g_inba_m.inbacnfdt,g_inba_m.inbamoddt,g_inba_m.inbapstid,g_inba_m.inbapstid_desc,g_inba_m.inbacnfid,
       g_inba_m.inbacnfid_desc,g_inba_m.inbapstdt

   #ver:82
   #清空單身條件
   LET g_wc2 = " 1=1"
   LET g_wc2_table1 = " 1=1 "

   #CALL aint302_b_fill()
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

   #end add-point
   LET g_forupd_sql = "SELECT inbbsite,inbbseq,inbb026,inbb001,inbb002,inbb004,inbb007,inbb008,inbb009,
       inbb010,inbb003,inbb011,inbb012,inbb013,inbb014,inbb015,inbb016,inbb017,inbb018,inbb019,inbb023,
       inbb024,inbb025,inbb020,inbb204,inbb022,inbb021 FROM inbb_t WHERE inbbent=? AND inbbdocno=? AND
       inbbseq=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"

   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE aint302_bcl CURSOR FROM g_forupd_sql





   #add-point:input段define_sql name="input.other_sql"

   #end add-point

   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'

   #控制key欄位可否輸入
   CALL aint302_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   #將單身輸入權限放入共用變數給嵌入的子程式用, 若子程式要自己控管, 還是可以從子程式中覆蓋掉值
   #161031-00025#7---s
   LET g_detail_insert = l_allow_insert
   LET g_detail_delete = l_allow_delete
   #161031-00025#7---e
   #end add-point
   CALL aint302_set_no_entry(p_cmd)

   DISPLAY BY NAME g_inba_m.inbadocno,g_inba_m.inbasite,g_inba_m.inbadocdt,g_inba_m.inba002,g_inba_m.inba003,
       g_inba_m.inba004,g_inba_m.inbastus,g_inba_m.inba005,g_inba_m.inba006,g_inba_m.inba007,g_inba_m.inba008


   LET lb_reproduce = FALSE
   LET l_ac_t = 1

   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()

   #add-point:資料輸入前 name="input.before_input"
            LET g_errshow = 1
   #end add-point

   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)

{</section>}

{<section id="aint302.input.head" >}
      #單頭段
      INPUT BY NAME g_inba_m.inbadocno,g_inba_m.inbasite,g_inba_m.inbadocdt,g_inba_m.inba002,g_inba_m.inba003,
          g_inba_m.inba004,g_inba_m.inbastus,g_inba_m.inba005,g_inba_m.inba006,g_inba_m.inba007,g_inba_m.inba008

         ATTRIBUTE(WITHOUT DEFAULTS)

         #自訂ACTION(master_input)

         #應用 a43 樣板自動產生(Version:4)
         ON ACTION open_memo
            LET g_action_choice="open_memo"
            IF cl_auth_chk_act("open_memo") THEN

               #add-point:ON ACTION open_memo name="input.master_input.open_memo"
                  IF NOT cl_null(g_inba_m.inbadocno) THEN
                    CALL aooi360_02('6',g_inba_m.inbadocno,'','','','','','','','','','4')
                 END IF
               #END add-point
            END IF




         #應用 a43 樣板自動產生(Version:4)
         ON ACTION open_detail_memo
            LET g_action_choice="open_detail_memo"
            IF cl_auth_chk_act("open_detail_memo") THEN

               #add-point:ON ACTION open_detail_memo name="input.master_input.open_detail_memo"
               #modify by lixiang 2015/08/4--start----
               #單身備註需傳入項次
               #IF NOT cl_null(g_inba_m.inbadocno) THEN
               #   CALL aooi360_01('7',g_inba_m.inbadocno,'','','','','','','','','')
               #END IF

               IF NOT cl_null(g_inba_m.inbadocno) AND g_detail_idx > 0 THEN
                  #161031-00025#7 mod-S
#                  CALL aooi360_01('7',g_inba_m.inbadocno,g_inbc_d[g_detail_idx2].inbcseq,'','','','','','','','')
                  CALL aooi360_02('7',g_prog,g_inba_m.inbadocno,g_inbc_d[g_detail_idx2].inbcseq,'','','','','','','','1')
                  CALL s_aooi360_sel('7',g_prog,g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'','','','','','','','1') RETURNING l_success,g_inbb_d[l_ac].ooff013
                  #161031-00025#7---s
                  LET g_ooff001_d = '6'   #6.單據單頭備註
                  LET g_ooff002_d = g_prog
                  LET g_ooff003_d = g_inba_m.inbadocno   #单号
                  LET g_ooff004_d = 0     #项次
                  LET g_ooff005_d = ' '
                  LET g_ooff006_d = ' '
                  LET g_ooff007_d = ' '
                  LET g_ooff008_d = ' '
                  LET g_ooff009_d = ' '
                  LET g_ooff010_d = ' '
                  LET g_ooff011_d = ' '
                  CALL aooi360_01_b_fill(g_ooff001_d,g_ooff002_d,g_ooff003_d,g_ooff004_d,g_ooff005_d,g_ooff006_d,g_ooff007_d,g_ooff008_d,g_ooff009_d,g_ooff010_d,g_ooff011_d)   #备注单身
                  #161031-00025#7---e
                  #161031-00025#7 mod-E
               END IF
               #modify by lixiang 2015/08/4--end----
               #END add-point
            END IF





         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN aint302_cl USING g_enterprise,g_inba_m.inbadocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "OPEN aint302_cl:",SQLERRMESSAGE
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE
               CLOSE aint302_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF

            IF l_cmd_t = 'r' THEN

            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL aint302_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
            IF l_cmd_t = 'r' THEN
               CALL aint302_reproduce_init()
            END IF
            CALL cl_showmsg_init()
            CALL aint302_set_entry(p_cmd)
            CALL aint302_set_no_entry(p_cmd)
            #end add-point
            CALL aint302_set_no_entry(p_cmd)

                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbadocno

            #add-point:AFTER FIELD inbadocno name="input.a.inbadocno"
                                                #此段落由子樣板a05產生
            CALL s_aooi200_get_slip_desc(g_inba_m.inbadocno) RETURNING g_inba_m.inbadocno_desc
            DISPLAY BY NAME g_inba_m.inbadocno_desc
            IF NOT cl_null(g_inba_m.inbadocno) THEN
              IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_inba_m.inbadocno != g_inbadocno_t )) THEN        #160824-00007#278 161229 by lori mark  #170707-00025#1 remark
               #IF g_inba_m.inbadocno != g_inbadocno_t OR cl_null(g_inbadocno_t)                        #160824-00007#278 161229 by lori add #170707-00025#1 mark
               #OR g_inba_m.inbadocno != g_inba_m_o.inbadocno OR cl_null(g_inba_m_o.inbadocno) THEN    #160824-00007#278 161229 by lori add  #170707-00025#1 mark
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM inba_t WHERE "||"inbaent = '" ||g_enterprise|| "' AND inbasite = '" ||g_site|| "' AND "||"inbadocno = '"||g_inba_m.inbadocno ||"'",'std-00004',0) THEN
                    #160824-00007#278 161229 by lori mod---(S)
                    #LET g_inba_m.inbadocno =  g_inba_m_t.inbadocno
                     LET g_inba_m.inbadocno =  g_inba_m_o.inbadocno
                     DISPLAY BY NAME g_inba_m.inbadocno
                    #160824-00007#278 161229 by lori mod---(E)
                     CALL s_aooi200_get_slip_desc(g_inba_m.inbadocno) RETURNING g_inba_m.inbadocno_desc
                     DISPLAY BY NAME g_inba_m.inbadocno_desc
                     NEXT FIELD CURRENT
                  END IF

                  #170727-00011#1 mark start -----
                  ##20151029 by stellar add ----- (S)
                  #CALL s_control_chk_doc('1',g_inba_m.inbadocno,'5',g_user,g_dept,'','') RETURNING l_success,l_flag1
                  #IF NOT l_success OR NOT l_flag1 THEN
                  #  #160824-00007#278 161229 by lori mod---(S)
                  #  #LET g_inba_m.inbadocno =  g_inba_m_t.inbadocno
                  #   LET g_inba_m.inbadocno =  g_inba_m_o.inbadocno
                  #   DISPLAY BY NAME g_inba_m.inbadocno
                  #  #160824-00007#278 161229 by lori mod---(E)
                  #   CALL s_aooi200_get_slip_desc(g_inba_m.inbadocno) RETURNING g_inba_m.inbadocno_desc
                  #   DISPLAY BY NAME g_inba_m.inbadocno_desc
                  #   NEXT FIELD CURRENT
                  #END IF
                  ##20151029 by stellar add ----- (E)
                  #170727-00011#1 mark end   -----

                  IF NOT s_aooi200_chk_slip(g_site,'',g_inba_m.inbadocno,g_prog) THEN
                    #160824-00007#278 161229 by lori mod---(S)
                    #LET g_inba_m.inbadocno =  g_inba_m_t.inbadocno
                     LET g_inba_m.inbadocno =  g_inba_m_o.inbadocno
                     DISPLAY BY NAME g_inba_m.inbadocno
                    #160824-00007#278 161229 by lori mod---(E)
                     CALL s_aooi200_get_slip_desc(g_inba_m.inbadocno) RETURNING g_inba_m.inbadocno_desc
                     DISPLAY BY NAME g_inba_m.inbadocno_desc
                     NEXT FIELD CURRENT
                  END IF
               END IF
               CALL aint302_get_col_default()   #取得欄位預設值
               CALL aint302_set_entry(p_cmd)
               CALL aint302_set_no_entry(p_cmd)
            END IF

            LET g_inba_m_o.inbadocno = g_inba_m.inbadocno   #160824-00007#278 161229 by lori add
            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbadocno
            #add-point:BEFORE FIELD inbadocno name="input.b.inbadocno"

            #END add-point


         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inbadocno
            #add-point:ON CHANGE inbadocno name="input.g.inbadocno"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbasite
            #add-point:BEFORE FIELD inbasite name="input.b.inbasite"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbasite

            #add-point:AFTER FIELD inbasite name="input.a.inbasite"

            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inbasite
            #add-point:ON CHANGE inbasite name="input.g.inbasite"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbadocdt
            #add-point:BEFORE FIELD inbadocdt name="input.b.inbadocdt"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbadocdt

            #add-point:AFTER FIELD inbadocdt name="input.a.inbadocdt"
            #IF NOT cl_null(g_inba_m.inbadocdt) THEN
            #   IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_inba_m.inbadocdt != g_inba_m_t.inbadocdt)) THEN
            #      LET g_inba_m.inbadocdt = g_inba_m_t.inbadocdt
            #      DISPLAY g_inba_m.inbadocdt TO inbadocdt
            #   END IF
            #ELSE
            #   NEXT FIELD inbadocdt
            #END IF
            #CALL cl_set_comp_entry("inbadocno,inbadocdt",FALSE)
            #170405-00051#1-S add
            IF NOT cl_null(g_inba_m.inbadocdt) THEN
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_inba_m.inbadocdt != g_inba_m_t.inbadocdt)) THEN
                  IF NOT s_date_chk_close(g_inba_m.inbadocdt,'1') THEN
                     LET g_inba_m.inbadocdt = g_inba_m_t.inbadocdt
                     DISPLAY g_inba_m.inbadocdt TO inbadocdt
                     NEXT FIELD inbadocdt
                  END IF
               END IF
            END IF
            LET g_inba_m_t.inbadocdt = g_inba_m.inbadocdt
            #170405-00051#1-E add
            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inbadocdt
            #add-point:ON CHANGE inbadocdt name="input.g.inbadocdt"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inba002
            #add-point:BEFORE FIELD inba002 name="input.b.inba002"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inba002

            #add-point:AFTER FIELD inba002 name="input.a.inba002"
            #170405-00051#1-S add
            IF NOT cl_null(g_inba_m.inba002) THEN
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_inba_m.inba002 != g_inba_m_t.inba002)) THEN
                  IF NOT s_date_chk_close(g_inba_m.inba002,'1') THEN
                     LET g_inba_m.inba002 = g_inba_m_t.inba002
                     DISPLAY g_inba_m.inba002 TO inba002
                     NEXT FIELD inba002
                  END IF
               END IF
            END IF
            LET g_inba_m_t.inba002 = g_inba_m.inba002
            #170405-00051#1-E add
            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inba002
            #add-point:ON CHANGE inba002 name="input.g.inba002"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inba003

            #add-point:AFTER FIELD inba003 name="input.a.inba003"

            CALL aint302_inba003_ref(g_inba_m.inba003) RETURNING g_inba_m.inba003_desc
            DISPLAY BY NAME g_inba_m.inba003_desc
            IF NOT cl_null(g_inba_m.inba003) THEN
              #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_inba_m.inba003 != g_inba_m_t.inba003 OR cl_null(g_inba_m_t.inba003))) THEN   #160824-00007#278 161229 by lori mark
              #IF g_inba_m.inba003 != g_inba_m_o.inba003 OR cl_null(g_inba_m_o.inba003) THEN   #160824-00007#278 161229 by lori add   #mark by wanghaoz 2017/07/20 170703-00025#6
               IF p_cmd = 'a' OR ( g_inba_m.inba003 != g_inba_m_o.inba003 OR cl_null(g_inba_m_o.inba003)) THEN     #add by wanghaoz 2017/07/20 170703-00025#6
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL

                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_inba_m.inba003
                  LET g_chkparam.arg2 = g_site              #add wanghaoz 2017/07/19 #170703-00025#6
                  #160318-00025#18  by 07900 --add-str
                  LET g_errshow = TRUE #是否開窗
                  LET g_chkparam.err_str[1] ="aim-00070:sub-01302|aooi130|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"
                  #160318-00025#18  by 07900 --add-end
                  #呼叫檢查存在並帶值的library
                 #IF NOT cl_chk_exist("v_ooag001") THEN           #mark wanghaoz 2017/07/19 #170703-00025#6
                  IF NOT cl_chk_exist("v_ooag001_6") THEN        #add wanghaoz 2017/07/19 #170703-00025#6
                    #160824-00007#278 161229 by lori mod---(S)
                    #LET g_inba_m.inba003 =  g_inba_m_t.inba003
                     LET g_inba_m.inba003 =  g_inba_m_o.inba003
                     #170703-00025#6 170721 by wanghaoz---(s)
                     SELECT ooag003 INTO g_inba_m.inba004 FROM ooag_t WHERE ooagent = g_enterprise AND ooag001 = g_inba_m.inba003
                     CALL aint302_inba004_ref(g_inba_m.inba004) RETURNING g_inba_m.inba004_desc
                     DISPLAY BY NAME g_inba_m.inba004_desc
                     #170703-00025#6 170721 by wanghaoz---(e)
                     DISPLAY BY NAME g_inba_m.inba003
                    #160824-00007#278 161229 by lori mod---(E)
                     CALL aint302_inba003_ref(g_inba_m.inba003) RETURNING g_inba_m.inba003_desc
                     DISPLAY BY NAME g_inba_m.inba003_desc
                     NEXT FIELD CURRENT
                  END IF
               END IF
               IF g_inba_m.inba003 <> g_inba_m_o.inba003 OR cl_null(g_inba_m_o.inba003) OR cl_null(g_inba_m.inba004) THEN   #171204-00044#2  add by 09767
                  SELECT ooag003 INTO g_inba_m.inba004 FROM ooag_t WHERE ooagent = g_enterprise AND ooag001 = g_inba_m.inba003
                  CALL aint302_inba004_ref(g_inba_m.inba004) RETURNING g_inba_m.inba004_desc
                  DISPLAY BY NAME g_inba_m.inba004_desc
               END IF    #171204-00044#2  add by 09767
            END IF

               LET g_inba_m_o.inba003 = g_inba_m.inba003   #160824-00007#278 161229 by lori
               LET g_inba_m_o.inba004 = g_inba_m.inba004   #160824-00007#278 161229 by lori
            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inba003
            #add-point:BEFORE FIELD inba003 name="input.b.inba003"

            #END add-point


         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inba003
            #add-point:ON CHANGE inba003 name="input.g.inba003"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inba004

            #add-point:AFTER FIELD inba004 name="input.a.inba004"
                                                CALL aint302_inba004_ref(g_inba_m.inba004) RETURNING g_inba_m.inba004_desc
            DISPLAY BY NAME g_inba_m.inba004_desc
            IF NOT cl_null(g_inba_m.inba004) THEN
              #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_inba_m.inba004 != g_inba_m_t.inba004 OR cl_null(g_inba_m_t.inba004))) THEN    #160824-00007#278 161229 by lori mark
               IF g_inba_m.inba004 != g_inba_m_o.inba004 OR cl_null(g_inba_m_o.inba004) THEN    #160824-00007#278 161229 by lori add
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL

                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_inba_m.inba004
                  LET g_chkparam.arg2 = g_inba_m.inbadocdt
                  #160318-00025#19  by 07900 --add-str
                  LET g_errshow = TRUE #是否開窗
                  LET g_chkparam.err_str[1] ="aoo-00029:sub-01302|aooi125|",cl_get_progname("aooi125",g_lang,"2"),"|:EXEPROGaooi125"
                  #160318-00025#19  by 07900 --add-end
                  #呼叫檢查存在並帶值的library
                  IF NOT cl_chk_exist("v_ooeg001") THEN
                    #160824-00007#278 161229 by lori mod---(S)
                    #LET g_inba_m.inba004 = g_inba_m_t.inba004
                     LET g_inba_m.inba004 = g_inba_m_o.inba004
                     DISPLAY BY NAME g_inba_m.inba004
                    #160824-00007#278 161229 by lori mod---(E)
                     CALL aint302_inba004_ref(g_inba_m.inba004) RETURNING g_inba_m.inba004_desc
                     DISPLAY BY NAME g_inba_m.inba004_desc
                     NEXT FIELD inba004
                  END IF
               END IF
            END IF

            LET g_inba_m_o.inba004 = g_inba_m.inba004    #160824-00007#278 161229 by lori add
            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inba004
            #add-point:BEFORE FIELD inba004 name="input.b.inba004"

            #END add-point


         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inba004
            #add-point:ON CHANGE inba004 name="input.g.inba004"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbastus
            #add-point:BEFORE FIELD inbastus name="input.b.inbastus"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbastus

            #add-point:AFTER FIELD inbastus name="input.a.inbastus"

            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inbastus
            #add-point:ON CHANGE inbastus name="input.g.inbastus"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inba005
            #add-point:BEFORE FIELD inba005 name="input.b.inba005"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inba005

            #add-point:AFTER FIELD inba005 name="input.a.inba005"

            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inba005
            #add-point:ON CHANGE inba005 name="input.g.inba005"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inba006
            #add-point:BEFORE FIELD inba006 name="input.b.inba006"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inba006

            #add-point:AFTER FIELD inba006 name="input.a.inba006"

            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inba006
            #add-point:ON CHANGE inba006 name="input.g.inba006"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inba007

            #add-point:AFTER FIELD inba007 name="input.a.inba007"
            CALL aint302_inba007_ref(g_inba_m.inba007) RETURNING g_inba_m.inba007_desc
            DISPLAY BY NAME g_inba_m.inba007_desc
            IF NOT cl_null(g_inba_m.inba007) THEN
              #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_inba_m.inba007 != g_inba_m_t.inba007 OR cl_null(g_inba_m_t.inba007))) THEN    #160824-00007#278 161229 by lori mark
               IF g_inba_m.inba007 != g_inba_m_o.inba007 OR cl_null(g_inba_m_o.inba007) THEN    #160824-00007#278 161229 by lori add
                  IF NOT aint302_inba007_chk(g_inba_m.inba007) THEN
                    #160824-00007#278 161229 by lori mod---(S)
                    #LET g_inba_m.inba007 = g_inba_m_t.inba007
                     LET g_inba_m.inba007 = g_inba_m_o.inba007
                    #160824-00007#278 161229 by lori mod---(E)
                     CALL aint302_inba007_ref(g_inba_m.inba007) RETURNING g_inba_m.inba007_desc
                     DISPLAY BY NAME g_inba_m.inba007_desc
                     NEXT FIELD inba007
                  END IF
               END IF
            END IF
           #LET g_inba_m_t.inba007 = g_inba_m.inba007   #160906-00045#1   #160824-00007#278 161229 by lori mark
            LET g_inba_m_o.inba007 = g_inba_m.inba007   #160824-00007#278 161229 by lori add
            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inba007
            #add-point:BEFORE FIELD inba007 name="input.b.inba007"

            #END add-point


         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inba007
            #add-point:ON CHANGE inba007 name="input.g.inba007"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inba008
            #add-point:BEFORE FIELD inba008 name="input.b.inba008"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inba008

            #add-point:AFTER FIELD inba008 name="input.a.inba008"

            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inba008
            #add-point:ON CHANGE inba008 name="input.g.inba008"

            #END add-point


 #欄位檢查
                  #Ctrlp:input.c.inbadocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbadocno
            #add-point:ON ACTION controlp INFIELD inbadocno name="input.c.inbadocno"
                                    #此段落由子樣板a07產生
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_inba_m.inbadocno             #給予default值

            #給予arg
            LET l_ooef004 = ''
            SELECT ooef004 INTO l_ooef004 FROM ooef_t WHERE ooef001 = g_site AND ooefent  = g_enterprise
            LET g_qryparam.arg1 = l_ooef004 #參照表編號
            LET g_qryparam.arg2 = g_prog #單據性質

            #20151029 by stellar add ----- (S)
            CALL s_control_get_docno_sql(g_user,g_dept)
                 RETURNING l_success,l_sql1
            IF NOT cl_null(l_sql1) THEN
               LET g_qryparam.where = l_sql1
            END IF
            #20151029 by stellar add ----- (E)

            CALL q_ooba002_1()                                #呼叫開窗

            LET g_inba_m.inbadocno = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_inba_m.inbadocno TO inbadocno              #顯示到畫面上
            CALL s_aooi200_get_slip_desc(g_inba_m.inbadocno) RETURNING g_inba_m.inbadocno_desc
            DISPLAY BY NAME g_inba_m.inbadocno_desc

            NEXT FIELD inbadocno                          #返回原欄位


            #END add-point


         #Ctrlp:input.c.inbasite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbasite
            #add-point:ON ACTION controlp INFIELD inbasite name="input.c.inbasite"

            #END add-point


         #Ctrlp:input.c.inbadocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbadocdt
            #add-point:ON ACTION controlp INFIELD inbadocdt name="input.c.inbadocdt"

            #END add-point


         #Ctrlp:input.c.inba002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inba002
            #add-point:ON ACTION controlp INFIELD inba002 name="input.c.inba002"

            #END add-point


         #Ctrlp:input.c.inba003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inba003
            #add-point:ON ACTION controlp INFIELD inba003 name="input.c.inba003"
                                    #此段落由子樣板a07產生
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_inba_m.inba003             #給予default值

            #給予arg

           #CALL q_ooag001()                           #呼叫開窗            #mark wanghaoz 2017/07/19 #170703-00025#6
            CALL q_ooag001_2()           #呼叫开窗             #add wanghaoz 2017/07/19 #170703-00025#6

            LET g_inba_m.inba003 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_inba_m.inba003 TO inba003              #顯示到畫面上
            CALL aint302_inba003_ref(g_inba_m.inba003) RETURNING g_inba_m.inba003_desc
            DISPLAY BY NAME g_inba_m.inba003_desc

            NEXT FIELD inba003                          #返回原欄位


            #END add-point


         #Ctrlp:input.c.inba004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inba004
            #add-point:ON ACTION controlp INFIELD inba004 name="input.c.inba004"
                                    #此段落由子樣板a07產生
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_inba_m.inba004             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_inba_m.inbadocdt #

            CALL q_ooeg001()                                #呼叫開窗

            LET g_inba_m.inba004 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_inba_m.inba004 TO inba004              #顯示到畫面上
            CALL aint302_inba003_ref(g_inba_m.inba003) RETURNING g_inba_m.inba003_desc
            DISPLAY BY NAME g_inba_m.inba003_desc

            NEXT FIELD inba004                          #返回原欄位


            #END add-point


         #Ctrlp:input.c.inbastus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbastus
            #add-point:ON ACTION controlp INFIELD inbastus name="input.c.inbastus"

            #END add-point


         #Ctrlp:input.c.inba005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inba005
            #add-point:ON ACTION controlp INFIELD inba005 name="input.c.inba005"

            #END add-point


         #Ctrlp:input.c.inba006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inba006
            #add-point:ON ACTION controlp INFIELD inba006 name="input.c.inba006"

            #END add-point


         #Ctrlp:input.c.inba007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inba007
            #add-point:ON ACTION controlp INFIELD inba007 name="input.c.inba007"
                                    #此段落由子樣板a07產生
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
         LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE
			#根據單據別加上限制理由碼的條件
			#160906-00045#1-s
			LET g_qryparam.where = "1=1 "
         LET l_sql1 = ''
         CALL s_control_get_doc_sql("oocq002",g_inba_m.inbadocno,'8') RETURNING l_success,l_sql1
         IF l_success THEN
            LET g_qryparam.where = g_qryparam.where ," AND ",l_sql1
         END IF
         #160906-00045#1-e
			#160906-00045#1-s-mark
#			#獲取單據別
#			LET l_ooba002 = ''
#			CALL s_aooi200_get_slip(g_inba_m.inbadocno) RETURNING l_success,l_ooba002
#			#獲取單號的營運據點
#			LET l_site = ''
#			CALL s_aooi200_get_site(g_inba_m.inbadocno) RETURNING l_success,l_site
#			#獲取參照表編號
#			LET l_ooef004 = ''
#			SELECT ooef004 INTO l_ooef004 FROM ooef_t WHERE ooefent = g_enterprise AND ooef005 = l_site
#			LET l_n = 0
#			SELECT COUNT(oobi003) INTO l_n FROM ooba_t,oobi_t WHERE oobaent=oobient AND ooba001=oobi001 AND ooba002=oobi002
#                 AND oobaent = g_enterprise AND ooba001 = l_ooef004 AND ooba002 = l_ooba002
#			IF l_n > 0 THEN
#			   #判斷是正向列表還是負向列表
#			   LET l_ooba015 = ''
#			   SELECT ooba015 INTO l_ooba015 FROM ooba_t
#			     WHERE oobaent = g_enterprise AND ooba001 = l_ooef004 AND ooba002 = l_ooba002
#               #正向列表
#               IF l_ooba015 = '1' THEN
#                  LET g_qryparam.where = " oocq002 IN (SELECT oobi003 FROM oobi_t WHERE oobient = '",g_enterprise,"' AND oobi001 = '",l_ooef004,"' AND oobi002 = '",l_ooba002,"')"
#               END IF
#
#               #負向列表
#               IF l_ooba015 = '2' THEN
#                  LET g_qryparam.where = " oocq002 NOT IN (SELECT oobi003 FROM oobi_t WHERE oobient = '",g_enterprise,"' AND oobi001 = '",l_ooef004,"' AND oobi002 = '",l_ooba002,"')"
#               END IF
#            END IF
			#160906-00045#1-e mark
            LET g_qryparam.default1 = g_inba_m.inba007             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_acc #

            CALL q_oocq002()                                #呼叫開窗
            LET g_qryparam.where = " "

            LET g_inba_m.inba007 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_inba_m.inba007 TO inba007              #顯示到畫面上
            CALL aint302_inba007_ref(g_inba_m.inba007) RETURNING g_inba_m.inba007_desc
            DISPLAY BY NAME g_inba_m.inba007_desc

            NEXT FIELD inba007                          #返回原欄位


            #END add-point


         #Ctrlp:input.c.inba008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inba008
            #add-point:ON ACTION controlp INFIELD inba008 name="input.c.inba008"

            #END add-point


 #欄位開窗

         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF

            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_inba_m.inbadocno

            #add-point:單頭INPUT後 name="input.head.after_input"
            #add wanghaoz 2017/07/20 #170703-00025#6--(s)
            IF NOT cl_null(g_inba_m.inba003) THEN
               INITIALIZE g_chkparam.* TO NULL
               LET g_errshow = TRUE #是否開窗
               LET g_chkparam.arg1 = g_inba_m.inba003
               LET g_chkparam.arg2 = g_site
               LET g_chkparam.err_str[1] ="aim-00070:sub-01302|aooi130|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"
               IF NOT cl_chk_exist("v_ooag001_6") THEN
                  LET g_inba_m.inba003 =  g_inba_m_o.inba003
                  CALL s_desc_get_person_desc(g_inba_m.inba003)RETURNING g_inba_m.inba003_desc
                  DISPLAY BY NAME g_inba_m.inba003
                  NEXT FIELD inba003
               END IF
            END IF
            #add wanghaoz 2017/07/20 #170703-00025#6--(e)
            #end add-point

            IF p_cmd <> 'u' THEN

               CALL s_transaction_begin()

               #add-point:單頭新增前 name="input.head.b_insert"
               CALL s_aooi200_gen_docno(g_site,g_inba_m.inbadocno,g_inba_m.inbadocdt,g_prog) RETURNING l_success,g_inba_m.inbadocno
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'apm-00003'
                  LET g_errparam.extend = g_inba_m.inbadocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  NEXT FIELD inbadocno
               END IF
               #end add-point

               INSERT INTO inba_t (inbaent,inbadocno,inbasite,inbadocdt,inba002,inba003,inba004,inbastus,
                   inba005,inba006,inba007,inba008,inbaownid,inbacrtdp,inbaowndp,inbacrtdt,inbacrtid,
                   inbamodid,inbacnfdt,inbamoddt,inbapstid,inbacnfid,inbapstdt)
               VALUES (g_enterprise,g_inba_m.inbadocno,g_inba_m.inbasite,g_inba_m.inbadocdt,g_inba_m.inba002,
                   g_inba_m.inba003,g_inba_m.inba004,g_inba_m.inbastus,g_inba_m.inba005,g_inba_m.inba006,
                   g_inba_m.inba007,g_inba_m.inba008,g_inba_m.inbaownid,g_inba_m.inbacrtdp,g_inba_m.inbaowndp,
                   g_inba_m.inbacrtdt,g_inba_m.inbacrtid,g_inba_m.inbamodid,g_inba_m.inbacnfdt,g_inba_m.inbamoddt,
                   g_inba_m.inbapstid,g_inba_m.inbacnfid,g_inba_m.inbapstdt)
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = "g_inba_m:",SQLERRMESSAGE
                  LET g_errparam.code = SQLCA.SQLCODE
                  LET g_errparam.popup = TRUE
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF

               #add-point:單頭新增中 name="input.head.m_insert"
               LET g_ooff003_d = g_inba_m.inbadocno   #161031-00025#7
               #end add-point



                  #161130-00056

               #add-point:單頭新增後 name="input.head.a_insert"
               IF g_type MATCHES '[12]' THEN  #161109-00032#1
                  UPDATE inba_t SET inba001 = g_type WHERE inbaent = g_enterprise AND inbasite = g_site AND inbadocno = g_inba_m.inbadocno
               END IF #161109-00032#1

               #161109-00032#1-S
               IF g_type = '3' THEN
                  UPDATE inba_t SET inba001 = 'X1' WHERE inbaent = g_enterprise AND inbasite = g_site AND inbadocno = g_inba_m.inbadocno
               END IF
               IF g_type = '4' THEN
                  UPDATE inba_t SET inba001 = 'X2' WHERE inbaent = g_enterprise AND inbasite = g_site AND inbadocno = g_inba_m.inbadocno
               END IF
               #161109-00032#1-E
               #end add-point
               CALL s_transaction_end('Y','0')

               IF l_cmd_t = 'r' AND p_cmd = 'a' THEN
                  CALL aint302_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL aint302_b_fill()
                  CALL aint302_b_fill2('0')
               END IF

               #add-point:單頭新增後 name="input.head.a_insert2"

               #end add-point

               LET g_master_insert = TRUE

               LET p_cmd = 'u'
            ELSE
               CALL s_transaction_begin()

               #add-point:單頭修改前 name="input.head.b_update"

               #end add-point

               #將遮罩欄位還原
               CALL aint302_inba_t_mask_restore('restore_mask_o')

               UPDATE inba_t SET (inbadocno,inbasite,inbadocdt,inba002,inba003,inba004,inbastus,inba005,
                   inba006,inba007,inba008,inbaownid,inbacrtdp,inbaowndp,inbacrtdt,inbacrtid,inbamodid,
                   inbacnfdt,inbamoddt,inbapstid,inbacnfid,inbapstdt) = (g_inba_m.inbadocno,g_inba_m.inbasite,
                   g_inba_m.inbadocdt,g_inba_m.inba002,g_inba_m.inba003,g_inba_m.inba004,g_inba_m.inbastus,
                   g_inba_m.inba005,g_inba_m.inba006,g_inba_m.inba007,g_inba_m.inba008,g_inba_m.inbaownid,
                   g_inba_m.inbacrtdp,g_inba_m.inbaowndp,g_inba_m.inbacrtdt,g_inba_m.inbacrtid,g_inba_m.inbamodid,
                   g_inba_m.inbacnfdt,g_inba_m.inbamoddt,g_inba_m.inbapstid,g_inba_m.inbacnfid,g_inba_m.inbapstdt)

                WHERE inbaent = g_enterprise AND inbadocno = g_inbadocno_t

               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = "inba_t:",SQLERRMESSAGE
                  LET g_errparam.code = SQLCA.SQLCODE
                  LET g_errparam.popup = TRUE
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF

               #add-point:單頭修改中 name="input.head.m_update"

               #end add-point



                  #161130-00056

               #將遮罩欄位進行遮蔽
               CALL aint302_inba_t_mask_restore('restore_mask_n')

               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_inba_m_t)
               LET g_log2 = util.JSON.stringify(g_inba_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF

               #add-point:單頭修改後 name="input.head.a_update"

               #end add-point
            END IF

            LET g_master_commit = "Y"
            LET g_inbadocno_t = g_inba_m.inbadocno


      END INPUT


{</section>}

{<section id="aint302.input.body" >}

      #Page1 預設值產生於此處
      INPUT ARRAY g_inbb_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert,
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)

         #自訂ACTION(detail_input,page_1)


         #應用 a43 樣板自動產生(Version:4)
         ON ACTION gen_detail
            LET g_action_choice="gen_detail"
            IF cl_auth_chk_act("gen_detail") THEN

               #add-point:ON ACTION gen_detail name="input.detail_input.page1.gen_detail"
               #160707-00017#1-S
               IF g_inba_m.inbastus NOT MATCHES "[NDR]" THEN
                  RETURN
               END IF
               #160707-00017#1-E
               IF NOT cl_null(g_inba_m.inbadocno) THEN
                  IF NOT aint302_gen_detail() THEN
                     CALL s_transaction_end('N','0')
                  ELSE
                     CALL s_transaction_end('Y','0')
                     CALL aint302_b_fill()
                     CALL aint302_inbc_fill('')
                     IF g_rec_b > 0 THEN
                        LET g_flag = TRUE
                        EXIT DIALOG
                     END IF
                  END IF
               END IF
               #END add-point
            END IF




         #應用 a43 樣板自動產生(Version:4)
         ON ACTION s_lot_sel1
            LET g_action_choice="s_lot_sel1"
            IF cl_auth_chk_act("s_lot_sel1") THEN

               #add-point:ON ACTION s_lot_sel1 name="input.detail_input.page1.s_lot_sel1"
#               IF NOT cl_null(g_inba_m.inbadocno) AND g_prog = 'aint301' AND        #160623-00014#1-mod-(S)
               IF aint302_get_imaf071_imaf081() THEN  #160602-00018#1
                  #IF NOT cl_null(g_inba_m.inbadocno) AND g_prog MATCHES 'aint301' AND  #160623-00014#1-mod-(E)       #161109-00032#1
#                  IF NOT cl_null(g_inba_m.inbadocno) AND (g_prog MATCHES 'aint301' OR g_prog MATCHES 'apjt500') AND   #161109-00032#1  #170217-00068#3
                  IF NOT cl_null(g_inba_m.inbadocno) AND (g_prog MATCHES 'aint301*' OR g_prog MATCHES 'apjt500*') AND
                     NOT cl_null(g_inbb_d[g_detail_idx].inbbseq) AND
                     NOT cl_null(g_inbb_d[g_detail_idx].inbb001) AND
                     NOT cl_null(g_inbb_d[g_detail_idx].inbb010) AND
                     NOT cl_null(g_inbb_d[g_detail_idx].inbb011) AND
                     NOT cl_null(g_inba_m.inba003) THEN
                     LET l_success = ''
                     #CALL s_lot_sel('1','1',g_site,g_inba_m.inbadocno,g_inbb_d[g_detail_idx].inbbseq,'0',g_inbb_d[g_detail_idx].inbb001,g_inbb_d[g_detail_idx].inbb002,g_inbb_d[g_detail_idx].inbb003,g_inbb_d[g_detail_idx].inbb007,g_inbb_d[g_detail_idx].inbb008,g_inbb_d[g_detail_idx].inbb009,g_inbb_d[g_detail_idx].inbb010,g_inbb_d[g_detail_idx].inbb011,'-1','aint301','')
                     CALL s_lot_sel('1','1',g_site,g_inba_m.inbadocno,g_inbb_d[g_detail_idx].inbbseq,'1',g_inbb_d[g_detail_idx].inbb001,g_inbb_d[g_detail_idx].inbb002,g_inbb_d[g_detail_idx].inbb003,g_inbb_d[g_detail_idx].inbb007,g_inbb_d[g_detail_idx].inbb008,g_inbb_d[g_detail_idx].inbb009,g_inbb_d[g_detail_idx].inbb010,g_inbb_d[g_detail_idx].inbb011,'-1','aint301','','','','','0')   #add by lixh 20150901
                          RETURNING l_success
                     #add by lixh 20150909
                     IF NOT aint302_ins_inao_2() THEN
                     END IF
                     #add by lixh 20150909
                     CALL aint302_inao_fill2()     #add by lixh 20151010
                     IF NOT l_success THEN
                        #CALL s_transaction_end('N','0')   #add by lixh 20150909
                     END IF
                  END IF
               END IF  #160602-00018#1
               #END add-point
            END IF




         #應用 a43 樣板自動產生(Version:4)
         ON ACTION open_detail_memo
            LET g_action_choice="open_detail_memo"
            IF cl_auth_chk_act("open_detail_memo") THEN

               #add-point:ON ACTION open_detail_memo name="input.detail_input.page1.open_detail_memo"
                 IF NOT cl_null(g_inba_m.inbadocno) AND NOT cl_null(g_inbb_d[l_ac].inbbseq)  THEN
                    #161031-00025#7 mod-S
#                    CALL aooi360_02('7',g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'','','','','','','','',4)
                    CALL aooi360_02('7',g_prog,g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'','','','','','','',4)
                    CALL s_aooi360_sel('7',g_prog,g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'','','','','','','','1') RETURNING l_success,g_inbb_d[l_ac].ooff013
                    #161031-00025#7---s
                    LET g_ooff001_d = '6'   #6.單據單頭備註
                    LET g_ooff002_d = g_prog
                    LET g_ooff003_d = g_inba_m.inbadocno   #单号
                    LET g_ooff004_d = 0     #项次
                    LET g_ooff005_d = ' '
                    LET g_ooff006_d = ' '
                    LET g_ooff007_d = ' '
                    LET g_ooff008_d = ' '
                    LET g_ooff009_d = ' '
                    LET g_ooff010_d = ' '
                    LET g_ooff011_d = ' '
                    CALL aooi360_01_b_fill(g_ooff001_d,g_ooff002_d,g_ooff003_d,g_ooff004_d,g_ooff005_d,g_ooff006_d,g_ooff007_d,g_ooff008_d,g_ooff009_d,g_ooff010_d,g_ooff011_d)   #备注单身
                    #161031-00025#7---e
                    #161031-00025#7 mod-E
                 END IF
               #END add-point
            END IF




         #應用 a43 樣板自動產生(Version:4)
         ON ACTION s_lot_ins
            LET g_action_choice="s_lot_ins"
            IF cl_auth_chk_act("s_lot_ins") THEN

               #add-point:ON ACTION s_lot_ins name="input.detail_input.page1.s_lot_ins"
               IF aint302_get_imaf071_imaf081() THEN   #160602-00018#1
#               IF NOT cl_null(g_inba_m.inbadocno) AND g_prog = 'aint302' AND  #160623-00014#1-mod-(S)
               #IF NOT cl_null(g_inba_m.inbadocno) AND g_prog MATCHES 'aint302' AND  #160623-00014#1-mod-(E)      #161109-00032#1
#               IF NOT cl_null(g_inba_m.inbadocno) AND (g_prog MATCHES 'aint302' OR g_prog MATCHES 'apjt600') AND  #161109-00032#1  #170217-00068#3
               IF NOT cl_null(g_inba_m.inbadocno) AND (g_prog MATCHES 'aint302*'
                                                       OR g_prog MATCHES 'abct302*' #170310-00005#25
                                                       OR g_prog MATCHES 'apjt600*') AND
                  NOT cl_null(g_inbb_d[l_ac].inbbseq) AND
                  NOT cl_null(g_inbb_d[l_ac].inbb001) AND
                  NOT cl_null(g_inbb_d[l_ac].inbb010) AND
                  NOT cl_null(g_inbb_d[l_ac].inbb011) AND
                  NOT cl_null(g_inba_m.inba003) THEN
                  LET l_success = ''
                  LET l_amount = ''
                  #170331-00022#1-S add
                  LET l_tran.prog = g_prog
                  LET l_tran.inbb022 = g_inbb_d[l_ac].inbb022
                  LET g_ls_js = util.JSON.stringify(l_tran)
                  #170331-00022#1-E add
                  #CALL s_lot_ins(g_site,g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'0',g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002,g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb011,'1',g_inba_m.inba003,'2','')
                  CALL s_lot_ins(g_site,g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'1',g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002,g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb011,'1',g_inba_m.inba003,'1','',
                                 g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008,g_inbb_d[l_ac].inbb009,g_inbb_d[l_ac].inbb003)  #160316-00007#1 add by lixh 20160316 add inbb003   #add by lixh 20150909
                       RETURNING l_success,l_amount
                  IF l_success THEN
                     IF g_inbb_d[l_ac].inbb011 <> l_amount THEN
                        IF cl_ask_confirm('ain-00249') THEN
                           #170617-00536#1-S mark
                           #CALL s_aooi250_convert_qty(g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb011,
                           #                           g_inbb_d[l_ac].inbb013,g_inbb_d[l_ac].inbb014)
                           #
                           # RETURNING l_success,g_inbb_d[l_ac].inbb014
                           #170617-00536#1-E mark

                           #170617-00536#1-S add
                           IF NOT cl_null(g_inbb_d[l_ac].inbb011) AND NOT cl_null(g_inbb_d[l_ac].inbb013) THEN
                              CALL s_aooi250_convert_qty(g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb010,
                                                         g_inbb_d[l_ac].inbb013,l_amount)
                                 RETURNING l_success,g_inbb_d[l_ac].inbb014
                           END IF
                           #170617-00536#1-E add

                           LET g_inbb_d[l_ac].inbb011 = l_amount
                           LET g_inbb_d[l_ac].inbb012 = l_amount   #add by lixh 20150820

                           UPDATE inbb_t SET inbb011 = l_amount,
                                             inbb012 = l_amount,
                                             inbb019 = l_amount,    #add by lixh 20151010
                                             inbb014 = g_inbb_d[l_ac].inbb014
                            WHERE inbbent = g_enterprise AND inbbsite = g_site
                              AND inbbdocno = g_inba_m.inbadocno AND inbbseq = g_inbb_d[l_ac].inbbseq
                           IF SQLCA.sqlcode THEN
                              INITIALIZE g_errparam TO NULL
                              LET g_errparam.code = SQLCA.sqlcode
                              LET g_errparam.extend = "inbb_t"
                              LET g_errparam.popup = FALSE
                              CALL cl_err()
                           END IF
                           #add by lixh 20101010
                           UPDATE inbc_t SET inbc010 = l_amount
                            WHERE inbcent = g_enterprise AND inbcsite = g_site
                              AND inbcdocno = g_inba_m.inbadocno AND inbcseq = g_inbb_d[l_ac].inbbseq
                           LET g_inbc_d[l_ac].inbc010 = l_amount
                           #add by lixh 20101010
                        END IF
                     END IF
                     #add by lixh 20150909
                     IF NOT aint302_ins_inao_2() THEN

                     END IF
                     #add by lixh 20150909
                     CALL aint302_inao_fill2()     #add by lixh 20151010
                  ELSE
                     #CALL s_transaction_end('N','0')   #add by lixh 20150819 事務暫時不提交OR回滾
                  END IF
               END IF
               END IF  #160602-00018#1
               #END add-point
            END IF





         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"

            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN
              CALL FGL_SET_ARR_CURR(g_inbb_d.getLength()+1)
              LET g_insert = 'N'
           END IF

            CALL aint302_b_fill() #ver:82
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_inbb_d.getLength()
            #add-point:資料輸入前 name="input.d.before_input"

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
            OPEN aint302_cl USING g_enterprise,g_inba_m.inbadocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "OPEN aint302_cl:",SQLERRMESSAGE
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE
               CLOSE aint302_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF

            LET g_rec_b = g_inbb_d.getLength()

            IF g_rec_b >= l_ac
               AND g_inbb_d[l_ac].inbbseq IS NOT NULL

            THEN
               LET l_cmd='u'
               LET g_inbb_d_t.* = g_inbb_d[l_ac].*  #BACKUP
               LET g_inbb_d_o.* = g_inbb_d[l_ac].*  #BACKUP
               CALL aint302_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
               #160519-00008#1-s
               CALL aint302_set_no_required_b()
               CALL aint302_set_required_b()
               #160519-00008#1-e
               #161007-00012#3-s-add
               LET g_inbb007_type = ''
               IF NOT cl_null(g_inbb_d[l_ac].inbb007) THEN
                  CALL s_aint320_vmi_type(g_site,g_inbb_d[l_ac].inbb007) RETURNING g_inbb007_type
               END IF
               #161007-00012#3-e-add
               #end add-point
               CALL aint302_set_no_entry_b(l_cmd)
               IF NOT aint302_lock_b("inbb_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH aint302_bcl INTO g_inbb_d[l_ac].inbbsite,g_inbb_d[l_ac].inbbseq,g_inbb_d[l_ac].inbb026,
                      g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002,g_inbb_d[l_ac].inbb004,g_inbb_d[l_ac].inbb007,
                      g_inbb_d[l_ac].inbb008,g_inbb_d[l_ac].inbb009,g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb003,
                      g_inbb_d[l_ac].inbb011,g_inbb_d[l_ac].inbb012,g_inbb_d[l_ac].inbb013,g_inbb_d[l_ac].inbb014,
                      g_inbb_d[l_ac].inbb015,g_inbb_d[l_ac].inbb016,g_inbb_d[l_ac].inbb017,g_inbb_d[l_ac].inbb018,
                      g_inbb_d[l_ac].inbb019,g_inbb_d[l_ac].inbb023,g_inbb_d[l_ac].inbb024,g_inbb_d[l_ac].inbb025,
                      g_inbb_d[l_ac].inbb020,g_inbb_d[l_ac].inbb204,g_inbb_d[l_ac].inbb022,g_inbb_d[l_ac].inbb021

                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = g_inbb_d_t.inbbseq,":",SQLERRMESSAGE
                     LET g_errparam.code = SQLCA.SQLCODE
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF

                  #遮罩相關處理
                  LET g_inbb_d_mask_o[l_ac].* =  g_inbb_d[l_ac].*
                  CALL aint302_inbb_t_mask()
                  LET g_inbb_d_mask_n[l_ac].* =  g_inbb_d[l_ac].*

                  LET g_bfill = "N"
                  CALL aint302_show()
                  LET g_bfill = "Y"

                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body.before_row"
            #160512-00004#2-add-(S)
            CALL aint302_set_entry_b(l_cmd)
            #160519-00008#1-s
            CALL aint302_set_no_required_b()
            CALL aint302_set_required_b()
            #160519-00008#1-e
            CALL aint302_set_no_entry_b(l_cmd)
            #160512-00004#2-add-(E)
            #170220-00047#1----add----str
            IF cl_null(g_inbb_d[l_ac].inbbseq) THEN
               SELECT MAX(inbbseq)+1 INTO g_inbb_d[l_ac].inbbseq FROM inbb_t
                  WHERE inbbent = g_enterprise AND inbbsite = g_site AND inbbdocno = g_inba_m.inbadocno
               IF cl_null(g_inbb_d[l_ac].inbbseq) OR g_inbb_d[l_ac].inbbseq = 0 THEN
                  LET g_inbb_d[l_ac].inbbseq = 1
               END IF
               #DISPLAY BY NAME g_inbb_d[l_ac].inbbseq  #170526-00058#1 mark
            END IF
            #170220-00047#1----add----end
            #170331-00022#1-S add
            LET l_tran.prog = g_prog
            LET l_tran.inbb022 = g_inbb_d[l_ac].inbb022
            LET g_ls_js = util.JSON.stringify(l_tran)
            #170331-00022#1-E add
            #end add-point
            #其他table資料備份(確定是否更改用)


            #其他table進行lock


            CALL aint302_idx_chk()   #(ver:83)

         BEFORE INSERT

            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            CALL aint302_idx_chk()   #(ver:83)
            INITIALIZE g_inbb_d[l_ac].* TO NULL
            INITIALIZE g_inbb_d_t.* TO NULL
            INITIALIZE g_inbb_d_o.* TO NULL
            #公用欄位給值(單身)

            #自定義預設值
                  LET g_inbb_d[l_ac].inbb011 = "0"
      LET g_inbb_d[l_ac].inbb012 = "0"
      LET g_inbb_d[l_ac].inbb014 = "0"
      LET g_inbb_d[l_ac].inbb015 = "0"
      LET g_inbb_d[l_ac].inbb018 = "N"
      LET g_inbb_d[l_ac].inbb019 = "0"

            #add-point:modify段before備份 name="input.body.insert.before_bak"
            LET g_inbb_d[l_ac].inbb019 = 0
            LET g_inbb_d[l_ac].inbb011 = '' #170905-00030#1 add
            LET g_inbb_d[l_ac].inbb012 = '' #170905-00030#1 add
            #end add-point
            LET g_inbb_d_t.* = g_inbb_d[l_ac].*     #新輸入資料
            LET g_inbb_d_o.* = g_inbb_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL aint302_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
            #160519-00008#1-s
            CALL aint302_set_no_required_b()
            CALL aint302_set_required_b()
               #160519-00008#1-e
            LET l_rep_flag = FALSE        #170509-00052#1 add
            LET l_rep_flag = lb_reproduce #170509-00052#1 add
            #end add-point
            CALL aint302_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_inbb_d[li_reproduce_target].* = g_inbb_d[li_reproduce].*

               LET g_inbb_d[li_reproduce_target].inbbseq = NULL

            END IF


            #add-point:modify段before insert name="input.body.before_insert"
            CALL s_transaction_begin()

            IF NOT cl_null(g_inba_m.inba006) THEN
               LET g_inbb_d[l_ac].inbb017 = g_inba_m.inba006
            END IF
            IF l_ac > 1 THEN
               LET g_inbb_d[l_ac].inbb016 = g_inbb_d[l_ac-1].inbb016
            END IF
            IF NOT cl_null(g_inba_m.inba007) AND cl_null(g_inbb_d[l_ac].inbb016) THEN
               LET g_inbb_d[l_ac].inbb016 = g_inba_m.inba007
               CALL aint302_inba007_ref(g_inbb_d[l_ac].inbb016) RETURNING g_inbb_d[l_ac].inbb016_desc
               #DISPLAY BY NAME g_inbb_d[l_ac].inbb016_desc  #170526-00058#1 mark
            END IF
            CALL aint302_inba007_ref(g_inbb_d[l_ac].inbb016) RETURNING g_inbb_d[l_ac].inbb016_desc
            #DISPLAY BY NAME g_inbb_d[l_ac].inbb016_desc  #170526-00058#1 mark

            SELECT MAX(inbbseq)+1 INTO g_inbb_d[l_ac].inbbseq FROM inbb_t
               WHERE inbbent = g_enterprise AND inbbsite = g_site AND inbbdocno = g_inba_m.inbadocno
            IF cl_null(g_inbb_d[l_ac].inbbseq) OR g_inbb_d[l_ac].inbbseq = 0 THEN
               LET g_inbb_d[l_ac].inbbseq = 1
            END IF
            #170509-00052#1 add-S
            IF l_rep_flag = TRUE THEN
               DISPLAY BY NAME g_inbb_d[l_ac].inbbseq
               LET l_rep_flag = FALSE
            ELSE
            #170509-00052#1 add-E
            LET g_inbb_d[l_ac].inbb002 = ''
            LET g_inbb_d[l_ac].inbb003 = ''
            LET g_inbb_d[l_ac].inbbsite = g_site
            END IF   #170509-00052#1 add
            LET g_inbb_d_o.* = g_inbb_d[l_ac].*
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
            #170905-00030#1 mark(s)
            #170811-00052#1 add (s)
            #申請件數不可為0
            #IF g_inbb_d[l_ac].inbb011 = 0 THEN
            #   INITIALIZE g_errparam TO NULL
            #   LET g_errparam.code = 'ain-00019'
            #   LET g_errparam.extend = g_inbb_d[l_ac].inbb011
            #   LET g_errparam.popu#p = TRUE
            #   CALL cl_err()
            #
            #   LET g_inbb_d[l_ac].inbb011 = g_inbb_d_o.inbb011
            #   NEXT FIELD inbb011
            #END IF
            #170811-00052#1 add (e)
            #170905-00030#1 mark(e)
            #160617-00005#1---s--
            LET l_imaf061 = ''
            LET l_imaf062 = ''
            LET l_imaf063 = ''

            SELECT imaf061,imaf062,imaf063,imaf031,imaf032 INTO l_imaf061,l_imaf062,l_imaf063,l_imaf031,l_imaf032   #170407-00004#1 add imaf031,imaf032
               FROM imaf_t WHERE imafent = g_enterprise AND imafsite = g_site AND imaf001 = g_inbb_d[l_ac].inbb001

            #若是雜項庫存收料作業時
            #IF g_type = '2' THEN  #161109-00032#1
            IF g_type = '2' OR g_type = '4' THEN #161109-00032#1
               IF cl_null(g_inbb_d[l_ac].inbb009) AND l_imaf061 = '1' AND l_imaf062 = 'Y' AND (NOT cl_null(l_imaf063)) THEN
                  CALL s_aooi390_gen_1('6',l_imaf063) RETURNING l_success,g_inbb_d[l_ac].inbb009,l_oofg_return
                  IF NOT l_success THEN
                     LET g_inbb_d[l_ac].inbb009 = ''
                  ELSE
                     CALL s_aooi390_get_auto_no('6',g_inbb_d[l_ac].inbb009) RETURNING l_success,g_inbb_d[l_ac].inbb009
                     CALL s_aooi390_oofi_upd('6',g_inbb_d[l_ac].inbb009) RETURNING l_success
                  END IF
                  #170324-00052#1-S
                  #批号自动编码更新批号
                  UPDATE inao_t SET inao007 = g_inbb_d[l_ac].inbb009
                   WHERE inaoent = g_enterprise
                     AND inaodocno = g_inba_m.inbadocno
                     AND inaoseq = g_inbb_d[g_detail_idx].inbbseq
                  #170324-00052#1-E
               END IF
            END IF
            #DISPLAY BY NAME g_inbb_d[l_ac].inbb009  #170526-00058#1 mark
            #160617-00005#1---e--

#170526-00058#1-s mark 移到 ON ACTION ACCEPT
#            #170314-00036#1-S
#             #IF cl_get_para(g_enterprise,g_site,'S-BAS-0028') = 'N' THEN #不使用参考单位   #170426-00073#1 mark
#                IF g_inbb_d[l_ac].inbb011 = 0 THEN
#                   IF NOT s_transaction_chk('Y',0) THEN
#                      CALL s_transaction_begin()
#                   END IF
#                   NEXT FIELD inbb011
#                END IF
#             #END IF    #170426-00073#1 mark
#             IF cl_get_para(g_enterprise,g_site,'S-BAS-0028') = 'Y' THEN
#                IF g_inbb_d[l_ac].inbb011 = 0 AND g_inbb_d[l_ac].inbb014 = 0 THEN
#                   IF NOT s_transaction_chk('Y',0) THEN
#                      CALL s_transaction_begin()
#                   END IF
#                   NEXT FIELD inbb011
#                END IF
#             END IF
#             #170314-00036#1-E
#            #170215-00048#1 add  --begin--
#            #检查仓储批、库存管理特征的合理性
#            IF NOT cl_null(g_inbb_d[l_ac].inbb007) THEN
#               IF NOT aint302_inbb007_chk(g_inbb_d[l_ac].inbb007) THEN
#                  LET g_inbb_d[l_ac].inbb007 = g_inbb_d_o.inbb007
#                  LET g_inbb_d[l_ac].inbb008 = g_inbb_d_o.inbb008
#                  LET g_inbb_d[l_ac].inbb009 = g_inbb_d_o.inbb009
#                  CALL s_desc_get_stock_desc(g_site,g_inbb_d[l_ac].inbb007) RETURNING g_inbb_d[l_ac].inbb007_desc
#                  CALL s_desc_get_locator_desc(g_site,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008) RETURNING g_inbb_d[l_ac].inbb008_desc
#                  NEXT FIELD inbb007
#               END IF
#
#               IF g_inbb_d[l_ac].inbb008 IS NOT NULL THEN
#                  IF NOT aint302_inbb008_chk(g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008) THEN
#                     LET g_inbb_d[l_ac].inbb007 = g_inbb_d_o.inbb007
#                     LET g_inbb_d[l_ac].inbb008 = g_inbb_d_o.inbb008
#                     LET g_inbb_d[l_ac].inbb009 = g_inbb_d_o.inbb009
#                     CALL s_desc_get_stock_desc(g_site,g_inbb_d[l_ac].inbb007) RETURNING g_inbb_d[l_ac].inbb007_desc
#                     CALL s_desc_get_locator_desc(g_site,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008) RETURNING g_inbb_d[l_ac].inbb008_desc
#                     #NEXT FIELD inbb008  #170321-00057#1  mark
#                     #170321-00057#1-S
#                     LET l_inaa007 = ''
#                     SELECT inaa007 INTO l_inaa007 FROM inaa_t
#                      WHERE inaaent = g_enterprise
#                        AND inaasite = g_site
#                        AND inaa001 = g_inbb_d[l_ac].inbb007
#                     IF NOT s_transaction_chk('Y',0) THEN
#                        CALL s_transaction_begin()
#                     END IF
#                     IF l_inaa007 = '5' THEN
#                        NEXT FIELD inbb007
#                     ELSE
#                        NEXT FIELD inbb008
#                     END IF
#                     #170321-00057#1-E
#                  END IF
#
#                  IF g_inbb_d[l_ac].inbb009 IS NOT NULL THEN
#                     IF NOT aint302_inbb009_chk() THEN
#                        LET g_inbb_d[l_ac].inbb007 = g_inbb_d_o.inbb007
#                        LET g_inbb_d[l_ac].inbb008 = g_inbb_d_o.inbb008
#                        LET g_inbb_d[l_ac].inbb009 = g_inbb_d_o.inbb009
#                        CALL s_desc_get_stock_desc(g_site,g_inbb_d[l_ac].inbb007) RETURNING g_inbb_d[l_ac].inbb007_desc
#                        CALL s_desc_get_locator_desc(g_site,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008) RETURNING g_inbb_d[l_ac].inbb008_desc
#                        #NEXT FIELD inbb009  #170321-00057#1 mark
#                        #170321-00057#1-S
#                        LET l_imaf061 = ''
#                        SELECT imaf061 INTO l_imaf061 FROM imaf_t
#                         WHERE imafent = g_enterprise
#                           AND imafsite = g_site
#                           AND imaf001 = g_inbb_d[l_ac].inbb001
#                        IF NOT s_transaction_chk('Y',0) THEN
#                           CALL s_transaction_begin()
#                        END IF
#                        IF l_imaf061 = '2' THEN
#                           NEXT FIELD inbb007
#                        ELSE
#                           NEXT FIELD inbb009
#                        END IF
#                        #170321-00057#1-E
#                     END IF
#                  END IF
#               END IF
#
#               IF NOT aint302_inbb003_chk() THEN
#               #170321-00057#1-S
#                  IF NOT s_transaction_chk('Y',0) THEN
#                     CALL s_transaction_begin()
#                  END IF
#               #170321-00057#1-E
#                  NEXT FIELD inbb007
#               END IF
#            END IF
#            #170215-00048#1 add  --end--
#170526-00058#1-e mark
            #end add-point

            LET l_count = 1
            SELECT COUNT(1) INTO l_count FROM inbb_t
             WHERE inbbent = g_enterprise AND inbbdocno = g_inba_m.inbadocno

               AND inbbseq = g_inbb_d[l_ac].inbbseq


            #資料未重複, 插入新增資料
            IF l_count = 0 THEN
               #add-point:單身新增前 name="input.body.b_insert"

               #end add-point

               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL
               LET gs_keys[1] = g_inba_m.inbadocno
               LET gs_keys[2] = g_inbb_d[g_detail_idx].inbbseq
               CALL aint302_insert_b('inbb_t',gs_keys,"'1'")

               #add-point:單身新增後 name="input.body.a_insert"
               #161031-00025#7---s
               IF NOT cl_null(g_inbb_d[l_ac].ooff013) THEN
                  CALL s_aooi360_gen('7',g_prog,g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'','','','','','','','1',g_inbb_d[l_ac].ooff013) RETURNING l_success
               END IF
               #161031-00025#7---e
               #end add-point
            ELSE
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = 'INSERT'
               LET g_errparam.code = "std-00006"
               LET g_errparam.popup = TRUE
               INITIALIZE g_inbb_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF

            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "inbb_t:",SQLERRMESSAGE
               LET g_errparam.code = SQLCA.SQLCODE
               LET g_errparam.popup = TRUE
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL aint302_b_fill()
               #資料多語言用-增/改

                  #161130-00056 add
               #add-point:input段-after_insert name="input.body.a_insert2"
               #新增一筆資料後需同步新增一筆[T:雜項庫存異動庫儲批明細檔]
               IF g_inbb_d[l_ac].inbb018 = 'N' THEN  #160127-00014#1 add by lixh 20160215
                  IF NOT aint302_ins_inbc() THEN
                     CALL s_transaction_end('N','0')
                     CANCEL INSERT
                  END IF
               END IF  #160127-00014#1 add by lixh 20160215
               #將其他產品特徵資料寫入DB,並新增[T:雜項庫存異動庫儲批明細檔]
               LET l_inbbseq = NULL
               #160512-00004#2-add-'inbb204','l_inbb.inbb204'
               INITIALIZE l_inbb.* TO NULL
               SELECT inbbent, inbbsite, inbbdocno,
                      '',               #170310-00005#25 add
                      inbb001,inbb002,inbb003,inbb004,inbb007,
                      inbb008,inbb009,inbb010,inbb011,inbb012,
                      inbb013,inbb014,inbb015,inbb016,inbb017,
                      inbb018,inbb019,inbb020,inbb021,
                      inbb023,inbb024,inbb025,inbb204,inbb022       #160430-00001#1  --- add inbb022
                 INTO l_inbb.inbbent,l_inbb.inbbsite,l_inbb.inbbdocno,
                      l_inbb.inbb026,   #170310-00005#25 add
                      l_inbb.inbb001,l_inbb.inbb002,l_inbb.inbb003,l_inbb.inbb004,l_inbb.inbb007,
                      l_inbb.inbb008,l_inbb.inbb009,l_inbb.inbb010,l_inbb.inbb011,l_inbb.inbb012,
                      l_inbb.inbb013,l_inbb.inbb014,l_inbb.inbb015,l_inbb.inbb016,l_inbb.inbb017,
                      l_inbb.inbb018,l_inbb.inbb019,l_inbb.inbb020,l_inbb.inbb021,
                      l_inbb.inbb023,l_inbb.inbb024,l_inbb.inbb025,l_inbb.inbb204,l_inbb.inbb022   #160430-00001#1  --- add inbb022

                 FROM inbb_t
                WHERE inbbent = g_enterprise
                  AND inbbsite = g_site
                  AND inbbdocno = g_inba_m.inbadocno
                  AND inbbseq = g_inbb_d[l_ac].inbbseq

               IF l_inam.getLength() > 1 THEN  #因為第一筆資料已呈現在畫面並寫入DB, 從第二筆開始處理
                  IF cl_null(l_inbbseq) THEN
                     SELECT MAX(inbbseq) INTO l_inbbseq
                       FROM inbb_t
                      WHERE inbbent   = g_enterprise
                        AND inbbsite  = g_site
                        AND inbbdocno = g_inba_m.inbadocno
                  END IF

                  FOR l_i = 2 TO l_inam.getLength()
                     IF cl_null(l_inbbseq) THEN
                        LET l_inbbseq = 1
                     ELSE
                        LET l_inbbseq = l_inbbseq + 1
                     END IF

                     #根據數量計算參數數量
                     IF (NOT cl_null(l_inbb.inbb001)) AND (NOT cl_null(l_inbb.inbb010)) AND (NOT cl_null(l_inbb.inbb013)) THEN
#                        CALL s_aimi190_get_convert(l_inbb.inbb001,l_inbb.inbb010,l_inbb.inbb013) RETURNING l_success,l_rate #xj mod
                        CALL s_aooi250_convert_qty(l_inbb.inbb001,l_inbb.inbb010,l_inbb.inbb013,l_inam[l_i].inam004)
                           RETURNING l_success,l_inbb.inbb014
                        IF l_success THEN
#                           LET l_inbb.inbb014 = l_inam[l_i].inam004 * l_rate #xj mod
                           LET l_inbb.inbb015 = l_inbb.inbb014
                        END IF
                     END IF

                     LET l_inbb.inbb012 = l_inam[l_i].inam004
                     #檢驗否為'N'
                     IF l_inbb.inbb018 = 'N' THEN
                        LET l_inbb.inbb019 = l_inam[l_i].inam004
                     ELSE
                        LET l_inbb.inbb019 = 0
                     END IF

                     #160512-00004#2-add-'inbb024'.'l_inbb.inbb204'
                     INSERT INTO inbb_t
                                 (inbbent, inbbsite, inbbdocno, inbbseq,
                                  inbb026,   #170310-00005#25 add
                                  inbb001,inbb002,inbb003,inbb004,inbb007,
                                  inbb008,inbb009,inbb010,inbb011,inbb012,
                                  inbb013,inbb014,inbb015,inbb016,inbb017,
                                  inbb018,inbb019,inbb020,inbb021,inbb023,inbb024,inbb025,inbb204,inbb022)  #160430-00001#1  --- add inbb022
                           VALUES(l_inbb.inbbent,l_inbb.inbbsite,l_inbb.inbbdocno,l_inbbseq,
                                  l_inbb.inbb026,   #170310-00005#25 add
                                  l_inbb.inbb001,l_inam[l_i].inam002,l_inbb.inbb003,l_inbb.inbb004,     l_inbb.inbb007,
                                  l_inbb.inbb008,l_inbb.inbb009,     l_inbb.inbb010,l_inam[l_i].inam004,l_inbb.inbb012,
                                  l_inbb.inbb013,l_inbb.inbb014,     l_inbb.inbb015,l_inbb.inbb016,     l_inbb.inbb017,
                                  l_inbb.inbb018,l_inbb.inbb019,     l_inbb.inbb020,l_inbb.inbb021,
                                  l_inbb.inbb023,l_inbb.inbb024,     l_inbb.inbb025,l_inbb.inbb204,l_inbb.inbb022) #160430-00001#1  --- add inbb022
                     IF SQLCA.sqlcode THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = SQLCA.sqlcode
                        LET g_errparam.extend = "inbb_t"
                        LET g_errparam.popup = FALSE
                        CALL cl_err()

                     ELSE
                        #同步新增[T:雜項庫存異動庫儲批明細檔]
                        IF g_inbb_d[l_ac].inbb018 = 'N' THEN  #160127-00014#1 add by lixh 20160215
                           LET l_inbc016 = g_today
                           LET l_imaf032 = NULL
                           LET l_inbcseq1 = 0
                           #如果料件有做批號控管時，則[C:有效日期]=g_today+[T:料件集團檔].[C:有效天數]
                           SELECT imaf032 INTO l_imaf032
                             FROM imaf_t
                            WHERE imafent = g_enterprise
                              AND imafsite = 'ALL'
                              AND imaf001 = l_inbb.inbb001
                           IF NOT cl_null(l_imaf032) THEN
                              LET l_inbc016 = l_inbc016 + l_imaf032
                           END IF

                           IF cl_null(l_inbcseq1) THEN
                              SELECT MAX(inbcseq1) INTO l_inbcseq1
                                FROM inbc_t
                               WHERE inbcent   = g_enterprise
                                 AND inbcsite  = g_site
                                 AND inbcdocno = g_inba_m.inbadocno
                                 AND inbcseq   = l_inbbseq
                           END IF
                           IF cl_null(l_inbcseq1) THEN
                              LET l_inbcseq1 = 1
                           ELSE
                              LET l_inbcseq1 = l_inbcseq1 + 1
                           END IF
                           #160512-00004#2-add-'inbc203','l_inbb.inbb204'
                           IF cl_null(l_inbb.inbb007) THEN LET l_inbb.inbb008 = '' END IF  #161006-00018#31
                           INSERT INTO inbc_t
                                      (inbcent,inbcsite,inbcdocno,inbcseq,inbcseq1,
                                       inbc001,inbc002,inbc003,inbc004,inbc005,
                                       inbc006,inbc007,inbc009,inbc010,inbc011,
                                       inbc015,inbc203,inbc016,inbc017,inbc021,inbc022,inbc023)
                                VALUES(l_inbb.inbbent,l_inbb.inbbsite,l_inbb.inbbdocno,l_inbbseq,l_inbcseq1,
                                       l_inbb.inbb001,l_inam[l_i].inam002,l_inbb.inbb003,l_inbb.inbb004,l_inbb.inbb007,
                                       l_inbb.inbb008,l_inbb.inbb009,l_inbb.inbb010,l_inam[l_i].inam004,l_inbb.inbb013,
                                       l_inbb.inbb015,l_inbb.inbb204,l_inbb.inbb022,l_inbb.inbb021,l_inbb.inbb023,l_inbb.inbb024,l_inbb.inbb025)
                           IF SQLCA.sqlcode THEN
                              INITIALIZE g_errparam TO NULL
                              LET g_errparam.code = SQLCA.sqlcode
                              LET g_errparam.extend = "inbc_t"
                              LET g_errparam.popup = FALSE
                              CALL cl_err()

                           END IF
                           #161031-00025#7---s
                           IF NOT cl_null(g_inbb_d[l_ac].ooff013) THEN
                              CALL s_aooi360_gen('7',g_prog,g_inba_m.inbadocno,l_inbbseq,'','','','','','','','1',g_inbb_d[l_ac].ooff013) RETURNING l_success
                           END IF
                           #161031-00025#7---e
                        END IF   #160127-00014#1 add by lixh 20160215
                     END IF
                  END FOR

                  LET g_rec_b = l_inam.getLength() - 1
               END IF

               CALL aint302_b_fill()
               CALL aint302_inbc_fill('')
               CALL aint302_inao_fill2()   #add by lixh 20150909
               #end add-point
               CALL s_transaction_end('Y','0')
               #ERROR 'INSERT O.K'
               LET g_rec_b = g_rec_b + 1
            END IF

         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' THEN
               LET l_cmd='d'
               #add-point:單身刪除後(=d) name="input.body.after_delete_d"
               CALL s_transaction_end('N','0')   #add by lixh 20151010
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

               #end add-point

               #取得該筆資料key值
               INITIALIZE gs_keys TO NULL
               LET gs_keys[01] = g_inba_m.inbadocno

               LET gs_keys[gs_keys.getLength()+1] = g_inbb_d_t.inbbseq


               #刪除同層單身
               IF NOT aint302_delete_b('inbb_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE aint302_bcl
                  CANCEL DELETE
               END IF

               #刪除下層單身
               IF NOT aint302_key_delete_b(gs_keys,'inbb_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE aint302_bcl
                  CANCEL DELETE
               END IF

               #刪除多語言



   #161130-00056 add

               #add-point:單身刪除中 name="input.body.m_delete"
               #161031-00025#7---s
               CALL s_aooi360_del('7',g_prog,g_inba_m.inbadocno,g_inbb_d_t.inbbseq,'','','','','','','','1') RETURNING l_success
               #161031-00025#7---e
               #end add-point

               CALL s_transaction_end('Y','0')
               CLOSE aint302_bcl

               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
                                                                        #同步刪除對應的[T:雜項庫存異動庫儲批明細檔]與[T:製造批序號庫存異動明細檔]
                  IF NOT aint302_del_inbc() THEN
                     CALL s_transaction_end('N','0')
                     CANCEL DELETE
                  END IF
                  IF NOT aint302_del_inao() THEN
                     CALL s_transaction_end('N','0')
                     CANCEL DELETE
                  END IF
               #end add-point
               LET l_count = g_inbb_d.getLength()

               #add-point:單身刪除後(<>d) name="input.body.after_delete"

               #end add-point
            END IF

         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_inbb_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF

                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbbseq
            #add-point:BEFORE FIELD inbbseq name="input.b.page1.inbbseq"
                                                #SELECT MAX(inbbseq)+1 INTO g_inbb_d[l_ac].inbbseq FROM inbb_t
            #   WHERE inbbent = g_enterprise AND inbbsite = g_site AND inbbdocno = g_inba_m.inbadocno
            #IF cl_null(g_inbb_d[l_ac].inbbseq) OR g_inbb_d[l_ac].inbbseq = 0 THEN
            #   LET g_inbb_d[l_ac].inbbseq = 1
            #END IF
            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbbseq

            #add-point:AFTER FIELD inbbseq name="input.a.page1.inbbseq"
                                                #此段落由子樣板a05產生
            IF  NOT cl_null(g_inba_m.inbadocno) AND NOT cl_null(g_inbb_d[l_ac].inbbseq) THEN
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND ( l_cmd = 'u' AND (g_inba_m.inbadocno != g_inbadocno_t OR g_inbb_d[l_ac].inbbseq != g_inbb_d_t.inbbseq))) THEN
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM inbb_t WHERE "||"inbbent = '" ||g_enterprise|| "' AND inbbsite = '" ||g_site|| "' AND "||"inbbdocno = '"||g_inba_m.inbadocno ||"' AND "|| "inbbseq = '"||g_inbb_d[g_detail_idx].inbbseq ||"'",'std-00004',0) THEN
                     LET g_inbb_d[l_ac].inbbseq = g_inbb_d_t.inbbseq
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            #170509-00052#1 add-S
            IF l_rep_flag THEN
               DISPLAY BY NAME g_inbb_d[l_ac].inbbseq
               LET l_rep_flag = FALSE
            END IF
            #170509-00052#1 add-E
            #170309-00052#1-S
            IF g_inbb_d[l_ac].inbbseq <> g_inbb_d_o.inbbseq OR g_inbb_d_o.inbbseq IS NULL THEN
               IF s_lot_batch_number_1n3(g_inbb_d[l_ac].inbb001,g_site) THEN
                  LET l_cnt = 0
                  SELECT COUNT(1) INTO l_cnt FROM inao_t
                   WHERE inaoent = g_enterprise
                     AND inaodocno = g_inba_m.inbadocno
                     AND inaoseq = g_inbb_d_o.inbbseq
                  IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
                  IF l_cnt > 0 THEN
                     CALL s_lot_upd_inao_2('Y',g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'1',g_inbb_d_o.inbbseq,'1',' ',g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002,
                                           g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008,g_inbb_d[l_ac].inbb009,g_site)   #170314-00104#1  add inbb007,inbb008,inbb009
                          RETURNING r_success
                     IF NOT r_success THEN
                        NEXT FIELD CURRENT
                     END IF
                  END IF
                  CALL aint302_inao_fill2()
               END IF
            END IF
            LET g_inbb_d_o.inbbseq = g_inbb_d[l_ac].inbbseq
            #170309-00052#1-E

            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inbbseq
            #add-point:ON CHANGE inbbseq name="input.g.page1.inbbseq"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb026
            #add-point:BEFORE FIELD inbb026 name="input.b.page1.inbb026"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb026

            #add-point:AFTER FIELD inbb026 name="input.a.page1.inbb026"
            #170310-00005#25 add s
            IF NOT cl_null(g_inbb_d[l_ac].inbb026) THEN
               #170310-00005#27 mark s
#               IF NOT aint302_barcode_chk(g_inba_m.inbadocno,g_inbb_d_t.inbbseq,g_inbb_d[l_ac].inbb026) THEN
#                  LET g_inbb_d[l_ac].inbb026 = g_inbb_d_o.inbb026
#                  NEXT FIELD CURRENT
#               END IF
               #170310-00005#27 mark e
               #170310-00005#27 add s
               IF NOT aint302_inbb026_inbb001_chk() THEN
                  LET g_inbb_d[l_ac].inbb026 = g_inbb_d_o.inbb026
                  NEXT FIELD CURRENT
               END IF
               #170310-00005#27 add e
            END IF
            LET g_inbb_d_o.inbb026 = g_inbb_d[l_ac].inbb026
            #170310-00005#25 add e
            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inbb026
            #add-point:ON CHANGE inbb026 name="input.g.page1.inbb026"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb001

            #add-point:AFTER FIELD inbb001 name="input.a.page1.inbb001"

            IF NOT cl_null(g_inbb_d[l_ac].inbb001) THEN
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_inbb_d[l_ac].inbb001 != g_inbb_d_o.inbb001)) THEN
                  CALL aint302_inbb001_ref(g_inbb_d[l_ac].inbb001)

                  IF NOT aint302_inbb001_chk(g_inbb_d[l_ac].inbb001) THEN
                     LET g_inbb_d[l_ac].inbb001 = g_inbb_d_o.inbb001
                     LET g_inbb_d[l_ac].inbb001_desc = g_inbb_d_o.inbb001_desc
                     LET g_inbb_d[l_ac].imaal004 = g_inbb_d_o.imaal004
                     NEXT FIELD CURRENT
                  END IF

                  #170310-00005#27 add s
                  IF NOT aint302_inbb026_inbb001_chk() THEN
                     LET g_inbb_d[l_ac].inbb001 = g_inbb_d_o.inbb001
                     LET g_inbb_d[l_ac].inbb001_desc = g_inbb_d_o.inbb001_desc
                     LET g_inbb_d[l_ac].imaal004 = g_inbb_d_o.imaal004
                     NEXT FIELD CURRENT
                  END IF
                  #170310-00005#27 add e

                  #抓取料件據點進銷存相關資訊
                   LET l_imaf071 = NULL
                   LET l_imaf081 = NULL
                   SELECT imaf071,imaf081,imaf055,imaf016 INTO l_imaf071,l_imaf081,g_imaf055,l_imaf016 FROM imaf_t WHERE imafent = g_enterprise   #160519-00008#1  #161114-00040#1 add imaf016
                     AND imafsite = g_site AND imaf001 = g_inbb_d[l_ac].inbb001
                   #160519-00008#1-s
                   IF (g_imaf055 = '1' OR aint302_get_vmi()) AND cl_null(g_inbb_d[l_ac].inbb003) THEN
                      LET g_inbb_d[l_ac].inbb003 = ''
                   END IF
                   #160519-00008#1-e

                   #170905-00058#1-S add
                   LET l_j = 0
                   SELECT COUNT(*) INTO l_j FROM oocq_t
                    WHERE oocqent = g_enterprise AND oocq001 = '210'
                      AND oocq002 = l_imaf016 AND oocqstus = 'Y'
                   IF cl_null(l_j) THEN LET l_j = 0 END IF
                   IF l_j = 0 THEN
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = 'abm-00296'
                      LET g_errparam.extend = ''
                      LET g_errparam.popup = TRUE
                      LET g_errparam.replace[1] = l_imaf016
                      CALL cl_err()
                      LET g_inbb_d[l_ac].inbb001 = g_inbb_d_o.inbb001
                      LET g_inbb_d[l_ac].inbb001_desc = g_inbb_d_o.inbb001_desc
                      LET g_inbb_d[l_ac].imaal004 = g_inbb_d_o.imaal004
                      NEXT FIELD CURRENT
                   END IF
                   LET l_j = 0
                   SELECT COUNT(*) INTO l_j FROM oocq_t
                    WHERE oocqent = g_enterprise AND oocq001 = '210'
                      AND oocq002 = l_imaf016 AND oocq009 = 'N'
                   IF cl_null(l_j) THEN LET l_j = 0 END IF
                   IF l_j = 0 THEN
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = 'abm-00297'
                      LET g_errparam.extend = ''
                      LET g_errparam.popup = TRUE
                      LET g_errparam.replace[1] = l_imaf016
                      CALL cl_err()
                      LET g_inbb_d[l_ac].inbb001 = g_inbb_d_o.inbb001
                      LET g_inbb_d[l_ac].inbb001_desc = g_inbb_d_o.inbb001_desc
                      LET g_inbb_d[l_ac].imaal004 = g_inbb_d_o.imaal004
                      NEXT FIELD CURRENT
                   END IF
                   #170905-00058#1-E add

                   #161114-00040#1 --begin--
                   SELECT COUNT(*) INTO l_j FROM oocq_t
                    WHERE oocqent = g_enterprise AND oocq001 = '210'
                      AND oocq002 = l_imaf016 AND oocq009 = 'N' AND oocqstus = 'Y'
                   IF l_j = 0 THEN
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = 'abm-00250'
                      LET g_errparam.extend = ''
                      LET g_errparam.popup = TRUE
                      LET g_errparam.replace[1] = l_imaf016
                      LET g_errparam.replace[2] = g_inbb_d[l_ac].inbb001
                      CALL cl_err()
                      LET g_inbb_d[l_ac].inbb001 = g_inbb_d_o.inbb001
                      LET g_inbb_d[l_ac].inbb001_desc = g_inbb_d_o.inbb001_desc
                      LET g_inbb_d[l_ac].imaal004 = g_inbb_d_o.imaal004
                      NEXT FIELD CURRENT
                   END IF
                   #161114-00040#1 --end--

                  #清空產品特徵的值
                  #LET g_inbb_d[l_ac].inbb002 = ''
                  #LET g_inbb_d[l_ac].inbb003 = ''
#170407-00004#1-S
#                  #170309-00052#1-S
#                  IF g_inbb_d[l_ac].inbb001 != g_inbb_d_o.inbb001 OR g_inbb_d_o.inbb001 IS NULL THEN
#                     IF s_lot_batch_number_1n3(g_inbb_d[l_ac].inbb001,g_site) THEN
#                        LET l_cnt = 0
#                        SELECT COUNT(1) INTO l_cnt FROM inao_t
#                         WHERE inaoent = g_enterprise
#                           AND inaodocno = g_inba_m.inbadocno
#                           AND inaoseq = g_inbb_d[l_ac].inbbseq
#                        IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
#                        IF l_cnt > 0 THEN
#                           SELECT imaf071,imaf081 INTO l_imaf071_t,l_imaf081_t FROM imaf_t
#                            WHERE imafent = g_enterprise
#                              AND imafsite = g_site
#                              AND imaf001 = g_inbb_d_o.inbb001
#                           SELECT imaf071,imaf081 INTO l_imaf071,l_imaf081 FROM imaf_t
#                            WHERE imafent = g_enterprise
#                              AND imafsite = g_site
#                              AND imaf001 = g_inbb_d[l_ac].inbb001
#                           LET l_flag2 = 'N'
#                           IF (l_imaf071_t = '1' AND l_imaf071 = '2') OR (l_imaf081_t = '1' AND l_imaf081 = '2') THEN
#                              LET l_flag2 = 'Y'
#                           END IF
#                           IF (l_imaf071_t = '2' AND l_imaf071 <> '2') OR (l_imaf081_t = '2' AND l_imaf081 <> '2') THEN
#                              LET l_flag2 = 'Y'
#                           END IF
#                           IF (l_imaf071_t = '3' AND l_imaf071 <> '3') OR (l_imaf081_t = '3' AND l_imaf081 <> '3') THEN
#                              LET l_flag2 = 'Y'
#                           END IF
#                           IF l_flag2 = 'Y' THEN
#                              #删除制造批序号资料(inao_t 申請+實際)
#                              DELETE FROM inao_t
#                               WHERE inaoent = g_enterprise AND inaosite = g_site
#                                 AND inaodocno = g_inba_m.inbadocno
#                                 AND inaoseq = g_inbb_d[l_ac].inbbseq #項次
#                           END IF
#                        END IF
#                        IF l_cnt > 0 AND l_flag2 = 'N' THEN
#                           #進項單據
#                           IF g_prog MATCHES 'aint302*' OR g_prog MATCHES 'apjt600*' THEN   #雜收&退料
#
#                              CALL s_lot_upd_inao_2('N',g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'1',' ',' ',' ',g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002,
#                                                    g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008,g_inbb_d[l_ac].inbb009,g_site)   #170314-00104#1 add inbb007,inbb008,inbb009
#                                   RETURNING r_success
#                              IF NOT r_success THEN
#                                 NEXT FIELD CURRENT
#                              END IF
#                              CALL aint302_inao_fill2()
#                           END IF
#                        END IF
#                        #出項單據
#                        IF g_prog MATCHES 'aint301*' OR g_prog MATCHES 'apjt500*' THEN   #雜發&項目發料
#                           CALL s_lot_inao_chk(g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'1',' ',g_site) RETURNING l_success,l_count
#                           IF l_count > 0 THEN
#                              IF l_success  THEN
#                                 CALL s_lot_sel('1','1',g_site,g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'1',g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002,g_inbb_d[l_ac].inbb003,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008,g_inbb_d[l_ac].inbb009,g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb011,'-1','aint301','','','','','0')
#                                      RETURNING l_success
#                                 #自動新增實際資料 申請=實際
#                                 IF NOT aint302_ins_inao_2() THEN
#                                    NEXT FIELD CURRENT
#                                 END IF
#                                 CALL aint302_inao_fill2()
#                              ELSE
#                                 LET g_inbb_d[l_ac].inbb001 = g_inbb_d_o.inbb001
#                                 #170314-00104#1-S
#                                 LET g_inbb_d[l_ac].inbb002 = g_inbb_d_o.inbb002
#                                 LET g_inbb_d[l_ac].inbb003 = g_inbb_d_o.inbb003
#                                 LET g_inbb_d[l_ac].inbb007 = g_inbb_d_o.inbb007
#                                 LET g_inbb_d[l_ac].inbb008 = g_inbb_d_o.inbb008
#                                 LET g_inbb_d[l_ac].inbb009 = g_inbb_d_o.inbb009
#                                 LET g_inbb_d[l_ac].inbb010 = g_inbb_d_o.inbb010
#                                 #170314-00104#1-E
#                              END IF
#                           ELSE
#                              CALL s_lot_sel('1','1',g_site,g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'1',g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002,g_inbb_d[l_ac].inbb003,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008,g_inbb_d[l_ac].inbb009,g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb011,'-1','aint301','','','','','0')
#                                   RETURNING l_success
#
#                              IF NOT aint302_ins_inao_2() THEN
#                                 NEXT FIELD CURRENT
#                              END IF
#                              CALL aint302_inao_fill2()
#                           END IF
#                        END IF
#                     ELSE
#                        #删除制造批序号资料(inao_t 申請+實際)
#                        DELETE FROM inao_t
#                         WHERE inaoent = g_enterprise AND inaosite = g_site
#                           AND inaodocno = g_inba_m.inbadocno
#                           AND inaoseq = g_inbb_d[l_ac].inbbseq #項次
#                     END IF
#                  END IF
#                  #170309-00052#1-E
#170407-00004#1-E
               END IF
               #170407-00004#1-S
               IF g_inbb_d[l_ac].inbb001 != g_inbb_d_o.inbb001 OR g_inbb_d_o.inbb001 IS NULL THEN
                  DELETE FROM inao_t
                   WHERE inaoent = g_enterprise AND inaosite = g_site
                     AND inaodocno = g_inba_m.inbadocno
                     AND inaoseq = g_inbb_d[l_ac].inbbseq #項次
                  #170407-00020#1-S
                  IF s_lot_batch_number(g_inbb_d[l_ac].inbb001,g_site) THEN
                     #進項單據
                     IF g_prog MATCHES 'aint302*'
                        OR g_prog MATCHES 'abct302*' #170310-00005#25
                        OR g_prog MATCHES 'apjt600*' THEN   #雜收&退料

                        IF g_inbb_d[l_ac].inbb011 <> 0 THEN
                           #170331-00022#1-S add
                           CALL aint302_set_entry_b(l_cmd)
                           CALL aint302_set_no_entry_b(l_cmd)
                           LET l_tran.prog = g_prog
                           LET l_tran.inbb022 = g_inbb_d[l_ac].inbb022
                           LET g_ls_js = util.JSON.stringify(l_tran)
                           #170331-00022#1-E add
                           CALL s_lot_ins(g_site,g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'1',g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002,g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb011,'1',g_inba_m.inba003,'1','',
                                          g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008,g_inbb_d[l_ac].inbb009,g_inbb_d[l_ac].inbb003)
                                RETURNING l_success,l_amount
                        END IF
                     END IF
                     #出項單據
                     IF g_prog MATCHES 'aint301*' OR g_prog MATCHES 'apjt500*' THEN   #雜發&項目發料

                        CALL s_lot_sel('1','1',g_site,g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'1',g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002,g_inbb_d[l_ac].inbb003,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008,g_inbb_d[l_ac].inbb009,g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb011,'-1','aint301','','','','','0')
                             RETURNING l_success

                        IF NOT aint302_ins_inao_2() THEN
                           NEXT FIELD CURRENT
                        END IF
                        CALL aint302_inao_fill2()
                     END IF
                  END IF
                  #170407-00020#1-S
               END IF
               #170407-00004#1-E
               #170808-00058#1--add---s
               #如果料號有設定有效期imaf031、imaf032，如果有設定且製造日期修改時，重新計算有效日期
               IF (g_type = '2' OR g_type = '4') AND NOT cl_null(g_inbb_d[l_ac].inbb204) THEN
                  CALL s_aini010_calculate_effdt(g_site,g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002,g_inbb_d[l_ac].inbb009,g_inbb_d[l_ac].inbb204) RETURNING g_inbb_d[l_ac].inbb022
                  DISPLAY BY NAME g_inbb_d[l_ac].inbb022
               END IF
               #170808-00058#1--add---e

            END IF
            CALL aint302_set_entry_b(l_cmd)
            CALL aint302_set_no_required_b()
            CALL aint302_set_required_b()
            CALL aint302_set_no_entry_b(l_cmd)

            #LET g_inbb_d_o.inbb001 = g_inbb_d[l_ac].inbb001   #170309-00052#1 mark
            LET l_imaa005 = ''
            CALL aint302_get_imaa005(g_enterprise,g_inbb_d[l_ac].inbb001) RETURNING l_imaa005
            #160330-00020#1 zhujing mod 2016-4-5---(S)调整了元件s_feature_auto_chk的控制范围
            CALL l_inam.clear()
            IF cl_get_para(g_enterprise,g_site,'S-BAS-0036') = 'Y' THEN
               IF NOT cl_null(l_imaa005) THEN
                  IF l_cmd = 'a' THEN
                     IF s_feature_auto_chk(g_inbb_d[l_ac].inbb001) AND cl_null(g_inbb_d[l_ac].inbb002) THEN #160314-00009#9   16/03/25 zhujing mod
                        #CALL l_inam.clear()
                        CALL s_feature(l_cmd,g_inbb_d[l_ac].inbb001,'','',g_site,g_inba_m.inbadocno) RETURNING l_success,l_inam
                        LET g_inbb_d[l_ac].inbb002 = l_inam[1].inam002
                        LET g_inbb_d[l_ac].inbb011 = l_inam[1].inam004
                        #DISPLAY BY NAME g_inbb_d[l_ac].inbb002,g_inbb_d[l_ac].inbb011  #170526-00058#1 mark

                        LET g_inbb_d[l_ac].inbb012 = g_inbb_d[l_ac].inbb011
                        #檢驗否為'N'
                        IF g_inbb_d[l_ac].inbb018 = 'N' THEN
                           LET g_inbb_d[l_ac].inbb019 = g_inbb_d[l_ac].inbb011
                        ELSE
                           LET g_inbb_d[l_ac].inbb019 = 0
                        END IF

                        #計算參考數量
                        IF (NOT cl_null(g_inbb_d[l_ac].inbb001)) AND (NOT cl_null(g_inbb_d[l_ac].inbb011)) AND (NOT cl_null(g_inbb_d[l_ac].inbb013)) THEN
   #                        CALL s_aimi190_get_convert(g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb013) RETURNING l_success,l_rate  #xj mod
                           CALL s_aooi250_convert_qty(g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb013,g_inbb_d[l_ac].inbb011)
                              RETURNING l_success,g_inbb_d[l_ac].inbb014
                           IF l_success THEN
   #                           LET g_inbb_d[l_ac].inbb014 = g_inbb_d[l_ac].inbb011 * l_rate   #xj mod
                              LET g_inbb_d[l_ac].inbb015 = g_inbb_d[l_ac].inbb014
                           END IF
                           #160330-00020#1 zhujing mod 2016-4-5---(E)调整了元件s_feature_auto_chk的控制范围
                        END IF
                        #DISPLAY BY NAME g_inbb_d[l_ac].inbb014,g_inbb_d[l_ac].inbb015  #170526-00058#1 mark
                     END IF
                  END IF
               ELSE
                  LET g_inbb_d[l_ac].inbb002 = ' '
                  LET g_inbb_d[l_ac].inbb002_desc = ''
               END IF
            ELSE
               LET g_inbb_d[l_ac].inbb002 = ' '
               LET g_inbb_d[l_ac].inbb002_desc = ''
            END IF
            #DISPLAY BY NAME g_inbb_d[l_ac].inbb002,g_inbb_d[l_ac].inbb002_desc,g_inbb_d[l_ac].inbb001   #160801-00005#1 add g_inbb_d[l_ac].inbb001  #170526-00058#1 mark
            LET g_inbb_d_o.inbb001 = g_inbb_d[l_ac].inbb001   #170309-00052#1 add
            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb001
            #add-point:BEFORE FIELD inbb001 name="input.b.page1.inbb001"

            #END add-point


         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inbb001
            #add-point:ON CHANGE inbb001 name="input.g.page1.inbb001"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb002

            #add-point:AFTER FIELD inbb002 name="input.a.page1.inbb002"

            CALL s_feature_description(g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002) RETURNING l_success,g_inbb_d[l_ac].inbb002_desc
            #DISPLAY BY NAME g_inbb_d[l_ac].inbb002_desc  #170526-00058#1 mark
            IF NOT cl_null(g_inbb_d[l_ac].inbb002) THEN
               IF NOT s_feature_check(g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002) THEN
                  LET g_inbb_d[l_ac].inbb002 = g_inbb_d_t.inbb002
                  CALL s_feature_description(g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002) RETURNING l_success,g_inbb_d[l_ac].inbb002_desc
                  #DISPLAY BY NAME g_inbb_d[l_ac].inbb002_desc  #170526-00058#1 mark
                  NEXT FIELD CURRENT
               END IF
               #151224-00025#1 tsungyung --- add start ---
               IF NOT s_feature_direct_input(g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002,g_inbb_d_t.inbb002,g_inba_m.inbadocno,g_inba_m.inbasite) THEN
                  NEXT FIELD CURRENT
               END IF
               #151224-00025#1 tsungyung --- add end   ---
            END IF
            #160512-00004#2-add-(S)
            CALL aint302_set_entry_b(l_cmd)
            #160519-00008#1-s
            CALL aint302_set_no_required_b()
            CALL aint302_set_required_b()
            #160519-00008#1-e
            CALL aint302_set_no_entry_b(l_cmd)
            #160512-00004#2-add-(E)
            LET g_inbb_d_o.inbb002 = g_inbb_d[l_ac].inbb002  #170314-00104#1 add
            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb002
            #add-point:BEFORE FIELD inbb002 name="input.b.page1.inbb002"

            ##取得料件產品特徵
            #LET l_imaa005 = ''
            #CALL aint302_get_imaa005(g_enterprise,g_inbb_d[l_ac].inbb001) RETURNING l_imaa005
            #
            #IF NOT cl_null(l_imaa005) THEN
            #   IF l_cmd = 'a' THEN
            #      CALL l_inam.clear()
            #      CALL s_feature(l_cmd,g_inbb_d[l_ac].inbb001,'','',g_site,g_inba_m.inbadocno) RETURNING l_success,l_inam
            #      LET g_inbb_d[l_ac].inbb002 = l_inam[1].inam002
            #      LET g_inbb_d[l_ac].inbb011 = l_inam[1].inam004
            #      DISPLAY BY NAME g_inbb_d[l_ac].inbb002,g_inbb_d[l_ac].inbb011
            #   END IF
            #   IF l_cmd = 'u' THEN
            #      CALL s_feature_single(g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002,g_site,g_inba_m.inbadocno)
            #         RETURNING l_success,g_inbb_d[l_ac].inbb002
            #      DISPLAY BY NAME g_inbb_d[l_ac].inbb002
            #   END IF
            #END IF

            #END add-point


         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inbb002
            #add-point:ON CHANGE inbb002 name="input.g.page1.inbb002"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb004

            #add-point:AFTER FIELD inbb004 name="input.a.page1.inbb004"
                                                CALL aint302_inbb004_ref(g_inbb_d[l_ac].inbb004) RETURNING g_inbb_d[l_ac].inbb004_desc
            #DISPLAY BY NAME g_inbb_d[l_ac].inbb004_desc  #170526-00058#1 mark
            IF NOT cl_null(g_inbb_d[l_ac].inbb004) THEN
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_inbb_d[l_ac].inbb004 != g_inbb_d_t.inbb004)) THEN
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL

                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_inbb_d[l_ac].inbb004

                  #呼叫檢查存在並帶值的library
                  IF NOT cl_chk_exist("v_imaa001_3") THEN
                     LET g_inbb_d[l_ac].inbb004 = g_inbb_d_t.inbb004
                     CALL aint302_inbb004_ref(g_inbb_d[l_ac].inbb004) RETURNING g_inbb_d[l_ac].inbb004_desc
                     #DISPLAY BY NAME g_inbb_d[l_ac].inbb004_desc  #170526-00058#1 mark
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF

            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb004
            #add-point:BEFORE FIELD inbb004 name="input.b.page1.inbb004"

            #END add-point


         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inbb004
            #add-point:ON CHANGE inbb004 name="input.g.page1.inbb004"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb007

            #add-point:AFTER FIELD inbb007 name="input.a.page1.inbb007"
            LET g_inbb_d[l_ac].inbb007_desc = ''
            #DISPLAY BY NAME g_inbb_d[l_ac].inbb007_desc  #170526-00058#1 mark
            IF NOT cl_null(g_inbb_d[l_ac].inbb007) THEN

               #IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_inbb_d[l_ac].inbb007 != g_inbb_d_o.inbb007)) THEN    #170919-00052#1  mark by 09767
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_inbb_d[l_ac].inbb007 != g_inbb_d_o.inbb007 OR cl_null(g_inbb_d_o.inbb007))) THEN   #170919-00052#1  modify by 09767
#               #160815-00028#1-s
#                  IF NOT cl_null(g_bas_0043)  THEN  #VMI存貨庫位Tag
#                     LET l_n = 0
#                     SELECT COUNT(*) INTO l_n FROM inac_t WHERE inacent = g_enterprise AND inacsite = g_site AND inac001 = g_inbb_d[l_ac].inbb007 AND inac003 = g_bas_0043
#                     IF g_prog = 'aint302' THEN   #VMI雜收
#                        IF l_n = 0 OR cl_null(l_n) THEN
#                           INITIALIZE g_errparam TO NULL
#                           LET g_errparam.code = 'ain-00781'
#                           LET g_errparam.extend = g_inbb_d[l_ac].inbb007
#                           LET g_errparam.popup = TRUE
#                           CALL cl_err()
#                           LET g_inbb_d[l_ac].inbb007 = g_inbb_d_o.inbb007
#                           CALL s_desc_get_stock_desc(g_site,g_inbb_d[l_ac].inbb007) RETURNING g_inbb_d[l_ac].inbb007_desc
#                           DISPLAY BY NAME g_inbb_d[l_ac].inbb007_desc
#                           NEXT FIELD CURRENT
#                        END IF
#                     ELSE
#                        IF l_n > 0 THEN
#                           INITIALIZE g_errparam TO NULL
#                           LET g_errparam.code = 'ain-00782'
#                           LET g_errparam.extend = g_inbb_d[l_ac].inbb007
#                           LET g_errparam.popup = TRUE
#                           CALL cl_err()
#                           LET g_inbb_d[l_ac].inbb007 = g_inbb_d_o.inbb007
#                           CALL s_desc_get_stock_desc(g_site,g_inbb_d[l_ac].inbb007) RETURNING g_inbb_d[l_ac].inbb007_desc
#                           DISPLAY BY NAME g_inbb_d[l_ac].inbb007_desc
#                           NEXT FIELD CURRENT
#                        END IF
#                     END IF
#                  END IF
#               #160815-00028#1-e
                  IF NOT aint302_inbb007_chk(g_inbb_d[l_ac].inbb007) THEN
                     LET g_inbb_d[l_ac].inbb007 = g_inbb_d_o.inbb007
                     LET g_inbb_d[l_ac].inbb008 = g_inbb_d_o.inbb008
                     LET g_inbb_d[l_ac].inbb009 = g_inbb_d_o.inbb009
                     CALL s_desc_get_stock_desc(g_site,g_inbb_d[l_ac].inbb007) RETURNING g_inbb_d[l_ac].inbb007_desc
                     CALL s_desc_get_locator_desc(g_site,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008) RETURNING g_inbb_d[l_ac].inbb008_desc
                     NEXT FIELD CURRENT
                  END IF
                  #161007-00012#3-s-add
                  LET g_inbb007_type = ''
                  CALL s_aint320_vmi_type(g_site,g_inbb_d[l_ac].inbb007) RETURNING g_inbb007_type
                  IF g_inbb007_type = '2' THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = ''
                     LET g_errparam.code = 'ain-00841'  #庫位：%1，為結算倉，不可輸入！
                     LET g_errparam.replace[1] = g_inbb_d[l_ac].inbb007
                     LET g_errparam.popup = TRUE
                     LET g_inbb_d[l_ac].inbb007 = g_inbb_d_o.inbb007
                     LET g_inbb_d[l_ac].inbb008 = g_inbb_d_o.inbb008
                     LET g_inbb_d[l_ac].inbb009 = g_inbb_d_o.inbb009
                     CALL cl_err()
                     NEXT FIELD CURRENT
                  END IF
                  #161007-00012#3-e-add
                  #160616-00012#1-S
                  IF NOT aint302_inbb003_chk() THEN
                     NEXT FIELD CURRENT
                  END IF
                  #160616-00012#1-E
                  IF g_inbb_d[l_ac].inbb007 != g_inbb_d_o.inbb007 THEN
                  #mark by lixh 20151127
#                     LET g_inbb_d[l_ac].inbb00l8 = ''
#                     LET g_inbb_d[l_ac].inbb009 = ''
                  #mark by lixh 20151127

                  #add by lixh 20151127
                      IF NOT cl_null(g_inbb_d[l_ac].inbb007) AND NOT cl_null(g_inbb_d[l_ac].inbb008)  THEN
                         LET l_cnt = 0
                         SELECT COUNT(*) INTO l_cnt FROM inab_t
                          WHERE inabent = g_enterprise
                            AND inabsite = g_site
                            AND inab001 = g_inbb_d[l_ac].inbb007
                            AND inab002 = g_inbb_d[l_ac].inbb008
                         IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
                         IF l_cnt = 0 THEN
                            LET g_inbb_d[l_ac].inbb008 = ' '
                         END IF
                      END IF
                  #add by lixh 20151127
                  END IF
                  #[C:庫位]有值時，需呼叫應用元件取得該庫位是否有設置在庫存控制組中，
                  #若有時需判斷該控制組是否與其他項次的庫位所對應的控制組一樣
                  #若不一樣則需訊息告知，並將游標跳到[C:庫位]欄位供修改
                  IF NOT cl_null(g_inbb_d[l_ac].inbb007) AND l_ac > 1 THEN

                  END IF

                  IF NOT cl_null(g_inbb_d[l_ac].inbb008) THEN
                     IF NOT aint302_inbb008_chk(g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008) THEN
                        LET g_inbb_d[l_ac].inbb007 = g_inbb_d_o.inbb007
                        LET g_inbb_d[l_ac].inbb008 = g_inbb_d_o.inbb008
                        LET g_inbb_d[l_ac].inbb009 = g_inbb_d_o.inbb009
                        CALL s_desc_get_stock_desc(g_site,g_inbb_d[l_ac].inbb007) RETURNING g_inbb_d[l_ac].inbb007_desc
                        CALL s_desc_get_locator_desc(g_site,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008) RETURNING g_inbb_d[l_ac].inbb008_desc
                        NEXT FIELD CURRENT
                     END IF
                  END IF

               END IF
               #add by lixh 20151111
              #IF s_lot_batch_number(g_inbb_d[l_ac].inbb001,g_site) THEN     #160314-00008#1 mark
               IF s_lot_batch_number_1n3(g_inbb_d[l_ac].inbb001,g_site) THEN #160314-00008#1 add
                  IF g_inbb_d[l_ac].inbb007 != g_inbb_d_o.inbb007 OR g_inbb_d_o.inbb007 IS NULL OR
                     g_inbb_d[l_ac].inbb008 != g_inbb_d_o.inbb008 OR g_inbb_d_o.inbb008 IS NULL OR
                     g_inbb_d[l_ac].inbb009 != g_inbb_d_o.inbb009 OR g_inbb_d_o.inbb009 IS NULL  THEN  #變更倉庫
#                     IF g_prog = 'aint302' THEN   #雜收        #160623-00014#1-mod-(S)
                     #IF g_prog MATCHES 'aint302' THEN   #雜收  #160623-00014#1-mod-(E)  #161109-00032#1
#                     IF g_prog MATCHES 'aint302' OR g_prog MATCHES 'apjt600' THEN   #雜收&退料  #161109-00032#1  #170217-00068#3
                     IF g_prog MATCHES 'aint302*'
                        OR g_prog MATCHES 'abct302*' #170310-00005#25
                        OR g_prog MATCHES 'apjt600*' THEN   #雜收&退料

                        CALL s_lot_upd_inao(g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'1',' ',g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008,g_inbb_d[l_ac].inbb009,'',g_inbb_d[l_ac].inbb003)  #160316-00007#1 add by lixh 20160316 add inbb003
                             RETURNING r_success
                        IF NOT r_success THEN
                           NEXT FIELD CURRENT
                        END IF
                        CALL aint302_inao_fill2()
                     END IF
#                     IF g_prog = 'aint301' THEN   #雜發        #160623-00014#1-mod-(S)
                     #IF g_prog MATCHES 'aint301' THEN   #雜發  #160623-00014#1-mod-(E)
#                     IF g_prog MATCHES 'aint301' OR g_prog MATCHES 'apjt500' THEN   #雜發&項目發料  #161109-00032#1  170217-00068#3 mark
                     IF g_prog MATCHES 'aint301*' OR g_prog MATCHES 'apjt500*' THEN   #雜發&項目發料
                        CALL s_lot_inao_chk(g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'1',' ',g_site) RETURNING l_success,l_count
                        IF l_count > 0 THEN
                           IF l_success  THEN
                              CALL s_lot_sel('1','1',g_site,g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'1',g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002,g_inbb_d[l_ac].inbb003,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008,g_inbb_d[l_ac].inbb009,g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb011,'-1','aint301','','','','','0')
                                   RETURNING l_success

                              IF NOT aint302_ins_inao_2() THEN
                                 NEXT FIELD CURRENT
                              END IF
                              CALL aint302_inao_fill2()
                           ELSE
                              LET g_inbb_d[l_ac].inbb007 = g_inbb_d_o.inbb007
                              LET g_inbb_d[l_ac].inbb008 = g_inbb_d_o.inbb008
                              LET g_inbb_d[l_ac].inbb009 = g_inbb_d_o.inbb009
                           END IF
                        #add by lixh 20151204
                        ELSE
                           CALL s_lot_sel('1','1',g_site,g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'1',g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002,g_inbb_d[l_ac].inbb003,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008,g_inbb_d[l_ac].inbb009,g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb011,'-1','aint301','','','','','0')
                                RETURNING l_success

                           IF NOT aint302_ins_inao_2() THEN
                              NEXT FIELD CURRENT
                           END IF
                           CALL aint302_inao_fill2()
                        #add by lixh 20151204
                        END IF
                     END IF
                  END IF
               END IF
               #add by lixh 20151111
               CALL aint302_set_entry_b(l_cmd)
               CALL aint302_set_no_required_b()
               CALL aint302_set_required_b()
               CALL aint302_set_no_entry_b(l_cmd)
            END IF
            LET g_inbb_d_o.inbb007 = g_inbb_d[l_ac].inbb007
            LET g_inbb_d_o.inbb008 = g_inbb_d[l_ac].inbb008
            LET g_inbb_d_o.inbb009 = g_inbb_d[l_ac].inbb009
            CALL s_desc_get_stock_desc(g_site,g_inbb_d[l_ac].inbb007) RETURNING g_inbb_d[l_ac].inbb007_desc
            CALL s_desc_get_locator_desc(g_site,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008) RETURNING g_inbb_d[l_ac].inbb008_desc

            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb007
            #add-point:BEFORE FIELD inbb007 name="input.b.page1.inbb007"

            #END add-point


         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inbb007
            #add-point:ON CHANGE inbb007 name="input.g.page1.inbb007"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb008

            #add-point:AFTER FIELD inbb008 name="input.a.page1.inbb008"
            LET g_inbb_d[l_ac].inbb008_desc = ''
            #DISPLAY BY NAME g_inbb_d[l_ac].inbb008_desc  #170526-00058#1 mark
            #170330-00018#1--mark--start--
            ##add by lixh 20151204
            #IF g_inbb_d[l_ac].inbb008 IS NULL THEN
            #   LET g_inbb_d[l_ac].inbb008 = ' '
            #END IF
            ##add by lixh 20151204
            #170330-00018#1--mark--end----
            IF NOT cl_null(g_inbb_d[l_ac].inbb008) THEN  #170330-00018#1 add
               IF (g_inbb_d[l_ac].inbb008 IS NOT NULL) AND (NOT cl_null(g_inbb_d[l_ac].inbb007)) THEN
               #IF (NOT cl_null(g_inbb_d[l_ac].inbb008)) AND (NOT cl_null(g_inbb_d[l_ac].inbb007)) THEN
                  IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_inbb_d[l_ac].inbb008 != g_inbb_d_o.inbb008 OR cl_null(g_inbb_d_o.inbb008))) THEN
                     #雜收時若輸入的庫位+儲位不存在[T:儲位資料檔]時，則呼叫應用元件判斷是否需要新增儲位基本資料
                     #IF g_type = '2' THEN  #161109-00032#1
                     IF g_type = '2' OR g_type = '4' THEN  #161109-00032#1
                        #檢核傳入的庫位、儲位是否存在儲為基本資料檔中，若存在則不需要新增
                        LET l_n = 0
                        SELECT count(*) INTO l_n FROM inab_t WHERE inabent = g_enterprise AND inabsite = g_site
                            AND inab001 = g_inbb_d[l_ac].inbb007 AND inab002 = g_inbb_d[l_ac].inbb008
                        IF l_n = 0 OR cl_null(l_n) THEN
                           IF NOT s_aini002_ins_inab(g_site,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008) THEN
                              INITIALIZE g_errparam TO NULL
                              LET g_errparam.code = 'ain-00282'
                              LET g_errparam.extend = "inab_t"
                              LET g_errparam.popup = TRUE
                              CALL cl_err()
                              LET g_inbb_d[l_ac].inbb007 = g_inbb_d_o.inbb007
                              LET g_inbb_d[l_ac].inbb008 = g_inbb_d_o.inbb008
                              LET g_inbb_d[l_ac].inbb009 = g_inbb_d_o.inbb009
                              CALL s_desc_get_stock_desc(g_site,g_inbb_d[l_ac].inbb007) RETURNING g_inbb_d[l_ac].inbb007_desc
                              CALL s_desc_get_locator_desc(g_site,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008) RETURNING g_inbb_d[l_ac].inbb008_desc
                              NEXT FIELD CURRENT
                           END IF
                        END IF
                     END IF

                     IF NOT aint302_inbb008_chk(g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008) THEN
                        LET g_inbb_d[l_ac].inbb007 = g_inbb_d_o.inbb007
                        LET g_inbb_d[l_ac].inbb008 = g_inbb_d_o.inbb008
                        LET g_inbb_d[l_ac].inbb009 = g_inbb_d_o.inbb009
                        CALL s_desc_get_stock_desc(g_site,g_inbb_d[l_ac].inbb007) RETURNING g_inbb_d[l_ac].inbb007_desc
                        CALL s_desc_get_locator_desc(g_site,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008) RETURNING g_inbb_d[l_ac].inbb008_desc
                        NEXT FIELD CURRENT
                     END IF
                     #160616-00012#1-S
                     IF NOT aint302_inbb003_chk() THEN
                        NEXT FIELD CURRENT
                     END IF
                     #160616-00012#1-E
                  END IF
               END IF
               IF cl_null(g_inbb_d[l_ac].inbb008) THEN
                  LET g_inbb_d[l_ac].inbb008 = ' '
               END IF
               #add by lixh 20151111
               IF NOT cl_null(g_inbb_d[l_ac].inbb007) THEN  #161006-00018#2
              #IF s_lot_batch_number(g_inbb_d[l_ac].inbb001,g_site) THEN      #160314-00008#1 mark
               IF s_lot_batch_number_1n3(g_inbb_d[l_ac].inbb001,g_site) THEN  #160314-00008#1 add
                  IF g_inbb_d[l_ac].inbb007 != g_inbb_d_o.inbb007 OR g_inbb_d_o.inbb007 IS NULL OR
                     g_inbb_d[l_ac].inbb008 != g_inbb_d_o.inbb008 OR g_inbb_d_o.inbb008 IS NULL OR
                     g_inbb_d[l_ac].inbb009 != g_inbb_d_o.inbb009 OR g_inbb_d_o.inbb009 IS NULL  THEN  #變更倉庫

#                     IF g_prog = 'aint302' THEN   #雜收        #160623-00014#1-mod-(S)
                     #IF g_prog MATCHES 'aint302' THEN   #雜收  #160623-00014#1-mod-(E) #161109-00032#1
#                     IF g_prog MATCHES 'aint302' OR g_prog MATCHES 'apjt600' THEN    #161109-00032#1  #170217-00068#3
                     IF g_prog MATCHES 'aint302*'
                        OR g_prog MATCHES 'abct302*' #170310-00005#25
                        OR g_prog MATCHES 'apjt600*' THEN

                        CALL s_lot_upd_inao(g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'1',' ',g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008,g_inbb_d[l_ac].inbb009,'',g_inbb_d[l_ac].inbb003)   #160316-00007#1 add by lixh 20160316 add inbb003
                             RETURNING r_success
                        IF NOT r_success THEN
                           NEXT FIELD CURRENT
                        END IF
                        CALL aint302_inao_fill2()
                     END IF
#                     IF g_prog = 'aint301' THEN   #雜發        #160623-00014#1-mod-(S)
                     #IF g_prog MATCHES 'aint301' THEN   #雜發  #160623-00014#1-mod-(E) #161109-00032#1
#                     IF g_prog MATCHES 'aint301' OR g_prog MATCHES 'apjt500' THEN #161109-00032#1  #170217-00068#3
                     IF g_prog MATCHES 'aint301*' OR g_prog MATCHES 'apjt500*' THEN
                        CALL s_lot_inao_chk(g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'1',' ',g_site) RETURNING l_success,l_count
                        IF l_count > 0 THEN
                           IF l_success THEN
                              CALL s_lot_sel('1','1',g_site,g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'1',g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002,g_inbb_d[l_ac].inbb003,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008,g_inbb_d[l_ac].inbb009,g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb011,'-1','aint301','','','','','0')
                                   RETURNING l_success

                              IF NOT aint302_ins_inao_2() THEN
                              END IF
                              CALL aint302_inao_fill2()
                           ELSE
                              LET g_inbb_d[l_ac].inbb008 = g_inbb_d_o.inbb008
                           END IF
                       #add by lixh 20151204
                        ELSE
                           CALL s_lot_sel('1','1',g_site,g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'1',g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002,g_inbb_d[l_ac].inbb003,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008,g_inbb_d[l_ac].inbb009,g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb011,'-1','aint301','','','','','0')
                                RETURNING l_success

                           IF NOT aint302_ins_inao_2() THEN
                           END IF
                           CALL aint302_inao_fill2()
                       #add by lixh 20151204
                        END IF
                     END IF
                  END IF
               END IF
               #add by lixh 20151111
               END IF  #161006-00018#2
            #170330-00018#1--add--start--
            END IF
            IF g_inbb_d[l_ac].inbb008 IS NULL THEN
               LET g_inbb_d[l_ac].inbb008 = ' '
            END IF
            #170330-00018#1--add--end----
            LET g_inbb_d_o.inbb007 = g_inbb_d[l_ac].inbb007
            LET g_inbb_d_o.inbb008 = g_inbb_d[l_ac].inbb008
            LET g_inbb_d_o.inbb009 = g_inbb_d[l_ac].inbb009
            CALL s_desc_get_stock_desc(g_site,g_inbb_d[l_ac].inbb007) RETURNING g_inbb_d[l_ac].inbb007_desc
            CALL s_desc_get_locator_desc(g_site,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008) RETURNING g_inbb_d[l_ac].inbb008_desc

            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb008
            #add-point:BEFORE FIELD inbb008 name="input.b.page1.inbb008"

            #END add-point


         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inbb008
            #add-point:ON CHANGE inbb008 name="input.g.page1.inbb008"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb009
            #add-point:BEFORE FIELD inbb009 name="input.b.page1.inbb009"
            #若料件據點資料設置批號自動編碼，則進欄位之前自動編號
            #IF cl_null(g_inbb_d[l_ac].inbb009) THEN
            #   LET l_imaf062 = ''
            #   LET l_imaf063 = ''
            #   SELECT imaf062,imaf063 INTO l_imaf062,l_imaf063 FROM imaf_t
            #      WHERE imafent = g_enterprise AND imaf001 = g_inbb_d[l_ac].inbb001 AND imafsite = g_site
            #   IF l_imaf062 = 'Y' AND (NOT cl_null(l_imaf063)) THEN  #自動編碼
            #       CALL s_aooi390_1('6',l_imaf063) RETURNING l_success,g_inbb_d[l_ac].inbb009
            #   END IF
            #END IF
            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb009

            #add-point:AFTER FIELD inbb009 name="input.a.page1.inbb009"
            #170330-00018#1--mark--start--
            ##add by lixh 20151204
            #IF g_inbb_d[l_ac].inbb009 IS NULL THEN
            #   LET g_inbb_d[l_ac].inbb009 = ' '
            #END IF
            ##add by lixh 20151204
            #170330-00018#1--mark--end----
            IF NOT cl_null(g_inbb_d[l_ac].inbb009) THEN  #170330-00018#1 add
               #IF NOT cl_null(g_inbb_d[l_ac].inbb009) THEN   #mark by lixh 20151204
               IF g_inbb_d[l_ac].inbb009 IS NOT NULL THEN     #add by lixh 20151204
                  IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_inbb_d[l_ac].inbb009 != g_inbb_d_o.inbb009 OR cl_null(g_inbb_d_o.inbb009))) THEN
                     IF NOT aint302_inbb009_chk() THEN
                        LET g_inbb_d[l_ac].inbb007 = g_inbb_d_o.inbb007
                        LET g_inbb_d[l_ac].inbb008 = g_inbb_d_o.inbb008
                        LET g_inbb_d[l_ac].inbb009 = g_inbb_d_o.inbb009
                        CALL s_desc_get_stock_desc(g_site,g_inbb_d[l_ac].inbb007) RETURNING g_inbb_d[l_ac].inbb007_desc
                        CALL s_desc_get_locator_desc(g_site,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008) RETURNING g_inbb_d[l_ac].inbb008_desc
                        NEXT FIELD CURRENT
                     END IF
                     #IF g_type = '2' AND cl_null(g_inbb_d[l_ac].inbb022) THEN  #161109-00032#1
                     IF (g_type = '2' OR g_type = '4') AND cl_null(g_inbb_d[l_ac].inbb022) THEN  #161109-00032#1
                        #雜收作業若料件要做批號管理且又有做有效期管理時，需要自動計算該批的有效日期
                        CALL s_aini010_calculate_effdt(g_site,g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002,g_inbb_d[l_ac].inbb009,g_inba_m.inbadocdt) RETURNING g_inbb_d[l_ac].inbb022
                        #DISPLAY BY NAME g_inbb_d[l_ac].inbb022  #170526-00058#1 mark
                     END IF
                     #160616-00012#1-S
                     IF NOT aint302_inbb003_chk() THEN
                        NEXT FIELD CURRENT
                     END IF
                     #160616-00012#1-E
                  END IF
                  #add by lixh 20151111
                  IF cl_null(g_inbb_d[l_ac].inbb009) THEN
                     LET g_inbb_d[l_ac].inbb009 = ' '
                  END IF
                 #IF s_lot_batch_number(g_inbb_d[l_ac].inbb001,g_site) THEN     #160314-00008#1 mark
                  IF s_lot_batch_number_1n3(g_inbb_d[l_ac].inbb001,g_site) THEN #160314-00008#1 add
                     IF g_inbb_d[l_ac].inbb007 != g_inbb_d_o.inbb007 OR g_inbb_d_o.inbb007 IS NULL OR
                        g_inbb_d[l_ac].inbb008 != g_inbb_d_o.inbb008 OR g_inbb_d_o.inbb008 IS NULL OR
                        g_inbb_d[l_ac].inbb009 != g_inbb_d_o.inbb009 OR g_inbb_d_o.inbb009 IS NULL  THEN  #變更倉庫
#                        IF g_prog = 'aint302' THEN   #雜收        #160623-00014#1-mod-(S)
                        #IF g_prog MATCHES 'aint302' THEN   #雜收  #160623-00014#1-mod-(E)
#                        IF g_prog MATCHES 'aint302' OR g_prog MATCHES 'apjt600' THEN   #161109-00032#1  #170217-00068#3
                        IF g_prog MATCHES 'aint302*'
                           OR g_prog MATCHES 'abct302*' #170310-00005#25
                           OR g_prog MATCHES 'apjt600*' THEN

                           CALL s_lot_upd_inao(g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'1',' ',g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008,g_inbb_d[l_ac].inbb009,'',g_inbb_d[l_ac].inbb003)   #160316-00007#1 add by lixh 20160316 add inbb003
                                RETURNING r_success
                           IF NOT r_success THEN
                              NEXT FIELD CURRENT
                           END IF
                           CALL aint302_inao_fill2()
                        END IF
#                        IF g_prog = 'aint301' THEN   #雜發        #160623-00014#1-mod-(S)
                        #IF g_prog MATCHES 'aint301' THEN   #雜發  #160623-00014#1-mod-(E) #161109-00032#1
#                        IF g_prog MATCHES 'aint301' OR g_prog MATCHES 'apjt500' THEN       #161109-00032#1  #170217-00068#3
                        IF g_prog MATCHES 'aint301*' OR g_prog MATCHES 'apjt500*' THEN
                           CALL s_lot_inao_chk(g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'1',' ',g_site) RETURNING l_success,l_count
                           IF l_count > 0 THEN
                              IF l_success THEN
                                 CALL s_lot_sel('1','1',g_site,g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'1',g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002,g_inbb_d[l_ac].inbb003,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008,g_inbb_d[l_ac].inbb009,g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb011,'-1','aint301','','','','','0')
                                      RETURNING l_success

                                 IF NOT aint302_ins_inao_2() THEN
                                    NEXT FIELD CURRENT
                                 END IF
                                 CALL aint302_inao_fill2()
                              ELSE
                                 LET g_inbb_d[l_ac].inbb009 = g_inbb_d_o.inbb009
                              END IF
                          #add by lixh 20151204
                           ELSE
                              CALL s_lot_sel('1','1',g_site,g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'1',g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002,g_inbb_d[l_ac].inbb003,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008,g_inbb_d[l_ac].inbb009,g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb011,'-1','aint301','','','','','0')
                                   RETURNING l_success

                              IF NOT aint302_ins_inao_2() THEN
                                 NEXT FIELD CURRENT
                              END IF
                              CALL aint302_inao_fill2()
                          #add by lixh 20151204
                           END IF
                        END IF
#                        IF NOT r_success THEN
#                           NEXT FIELD CURRENT
#                        END IF
                     END IF
                  END IF
                  #add by lixh 20151111
               END IF
            END IF   #170330-00018#1 add

            IF cl_null(g_inbb_d[l_ac].inbb009) THEN
               LET g_inbb_d[l_ac].inbb009 = ' '
            END IF
            #160512-00004#2-add-(S)
            CALL aint302_set_entry_b(l_cmd)
            #160519-00008#1-s
            CALL aint302_set_no_required_b()
            CALL aint302_set_required_b()
            #160519-00008#1-e
            CALL aint302_set_no_entry_b(l_cmd)
            #160512-00004#2-add-(E)
            LET g_inbb_d_o.inbb007 = g_inbb_d[l_ac].inbb007
            LET g_inbb_d_o.inbb008 = g_inbb_d[l_ac].inbb008
            LET g_inbb_d_o.inbb009 = g_inbb_d[l_ac].inbb009
            CALL s_desc_get_stock_desc(g_site,g_inbb_d[l_ac].inbb007) RETURNING g_inbb_d[l_ac].inbb007_desc
            CALL s_desc_get_locator_desc(g_site,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008) RETURNING g_inbb_d[l_ac].inbb008_desc
            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inbb009
            #add-point:ON CHANGE inbb009 name="input.g.page1.inbb009"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb010

            #add-point:AFTER FIELD inbb010 name="input.a.page1.inbb010"
            CALL aint302_inbb010_ref(g_inbb_d[l_ac].inbb010) RETURNING g_inbb_d[l_ac].inbb010_desc
            #DISPLAY BY NAME g_inbb_d[l_ac].inbb010_desc  #170526-00058#1 mark

            IF NOT cl_null(g_inbb_d[l_ac].inbb010) THEN
              #IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_inbb_d[l_ac].inbb010 != g_inbb_d_t.inbb010)) THEN   #160824-00007#278 161229 by lori mark
               IF g_inbb_d[l_ac].inbb010 != g_inbb_d_o.inbb010 OR cl_null(g_inbb_d_o.inbb010) THEN        #160824-00007#278 161229 by lori add
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL

                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_inbb_d[l_ac].inbb001
                  LET g_chkparam.arg2 = g_inbb_d[l_ac].inbb010

                  #呼叫檢查存在並帶值的library
#                  IF NOT cl_chk_exist("v_ooca001") THEN
                  IF NOT cl_chk_exist("v_imao002") THEN
                    #LET g_inbb_d[l_ac].inbb010 = g_inbb_d_o.inbb010   #160824-00007#278 161229 by lori mark
                     LET g_inbb_d[l_ac].inbb010 = g_inbb_d_t.inbb010   #160824-00007#278 161229 by lori add
                     CALL aint302_inbb010_ref(g_inbb_d[l_ac].inbb010) RETURNING g_inbb_d[l_ac].inbb010_desc
                     #DISPLAY BY NAME g_inbb_d[l_ac].inbb010_desc  #170526-00058#1 mark
                     NEXT FIELD CURRENT
                  END IF

                  IF NOT cl_null(g_inbb_d[l_ac].inbb011) THEN
                     CALL s_aooi250_take_decimals(g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb011)
                        RETURNING l_success,g_inbb_d[l_ac].inbb011
                     #DISPLAY BY NAME g_inbb_d[l_ac].inbb011  #170526-00058#1 mark
                  END IF

                  IF (NOT cl_null(g_inbb_d[l_ac].inbb001)) AND (NOT cl_null(g_inbb_d[l_ac].inbb011)) AND (NOT cl_null(g_inbb_d[l_ac].inbb013)) THEN
#                     CALL s_aimi190_get_convert(g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb013) RETURNING l_success,l_rate #xj mod
                     CALL s_aooi250_convert_qty(g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb013,g_inbb_d[l_ac].inbb011)
                        RETURNING l_success,g_inbb_d[l_ac].inbb014
                     IF l_success THEN
#                        LET g_inbb_d[l_ac].inbb014 = g_inbb_d[l_ac].inbb011 * l_rate #xj mod
                        LET g_inbb_d[l_ac].inbb015 = g_inbb_d[l_ac].inbb014
                     END IF
                  END IF
               END IF
            END IF

            #160824-00007#278 161229 by lori add---(S)
            LET g_inbb_d_o.inbb010 = g_inbb_d[l_ac].inbb010
            LET g_inbb_d_o.inbb011 = g_inbb_d[l_ac].inbb011
            LET g_inbb_d_o.inbb014 = g_inbb_d[l_ac].inbb014
            LET g_inbb_d_o.inbb015 = g_inbb_d[l_ac].inbb015
            #160824-00007#278 161229 by lori add---(E)
            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb010
            #add-point:BEFORE FIELD inbb010 name="input.b.page1.inbb010"

            #END add-point


         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inbb010
            #add-point:ON CHANGE inbb010 name="input.g.page1.inbb010"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb003
            #add-point:BEFORE FIELD inbb003 name="input.b.page1.inbb003"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb003

            #add-point:AFTER FIELD inbb003 name="input.a.page1.inbb003"
            #160316-00007#1 add by lixh 20160316
            #170330-00018#1--mark--start--
            #160513-00006#1-s
            #SELECT imaf055 INTO l_imaf055 FROM imaf_t
            # WHERE imafent = g_enterprise
            #   AND imafsite = g_site
            #   AND imaf001 = g_inbb_d[l_ac].inbb001
            #IF l_imaf055 <> '1' AND NOT aint302_get_vmi() THEN
            ##160513-00006#1-e
            #   IF cl_null(g_inbb_d[l_ac].inbb003) THEN
            #      LET g_inbb_d[l_ac].inbb003 = ' '
            #   END IF
            #END IF   #160513-00006#1
            #170330-00018#1--mark--end----
            IF NOT cl_null(g_inbb_d[l_ac].inbb003) THEN  #170330-00018#1 add
               #160616-00012#1-S
               IF g_inbb_d[l_ac].inbb003 != g_inbb_d_o.inbb003 OR g_inbb_d_o.inbb003 IS NULL THEN
                  IF NOT aint302_inbb003_chk() THEN
                     #170330-00078#1 add(S)
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'ain-00018'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     #170330-00078#1 add(E)
                     NEXT FIELD CURRENT
                  END IF
               END IF
               #160616-00012#1-E
               IF s_lot_batch_number_1n3(g_inbb_d[l_ac].inbb001,g_site) THEN #160314-00008#1 add
                  IF g_inbb_d[l_ac].inbb003 != g_inbb_d_o.inbb003 OR g_inbb_d_o.inbb003 IS NULL THEN
#                     IF g_prog = 'aint302' THEN   #雜收        #160623-00014#1-mod-(S)
                     #IF g_prog MATCHES 'aint302' THEN   #雜收  #160623-00014#1-mod-(E) #161109-00032#1
#                     IF g_prog MATCHES 'aint302' OR g_prog MATCHES 'apjt600' THEN       #161109-00032#1 add  #170217-00068#3
                     IF g_prog MATCHES 'aint302*'
                        OR g_prog MATCHES 'abct302*' #170310-00005#25
                        OR g_prog MATCHES 'apjt600*' THEN

                        CALL s_lot_upd_inao(g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'1',' ',g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008,g_inbb_d[l_ac].inbb009,'',g_inbb_d[l_ac].inbb003)
                             RETURNING r_success
                        IF NOT r_success THEN
                           NEXT FIELD CURRENT
                        END IF
                        CALL aint302_inao_fill2()
                     END IF
#                     IF g_prog = 'aint301' THEN   #雜發         #160623-00014#1-mod-(S)
                     #IF g_prog MATCHES 'aint301' THEN   #雜發   #160623-00014#1-mod-(E)    #161109-00032#1
#                     IF g_prog MATCHES 'aint301' OR g_prog MATCHES 'apjt500' THEN   #雜發   #161109-00032#1  #170217-00068#3
                     IF g_prog MATCHES 'aint301*' OR g_prog MATCHES 'apjt500*' THEN   #雜發
                        CALL s_lot_inao_chk(g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'1',' ',g_site) RETURNING l_success,l_count
                        IF l_count > 0 THEN
                           IF l_success  THEN
                              CALL s_lot_sel('1','1',g_site,g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'1',g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002,g_inbb_d[l_ac].inbb003,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008,g_inbb_d[l_ac].inbb009,g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb011,'-1','aint301','','','','','0')
                                   RETURNING l_success

                              IF NOT aint302_ins_inao_2() THEN
                                 NEXT FIELD CURRENT
                              END IF
                              CALL aint302_inao_fill2()
                           ELSE
                              #add by lixh 20161223
                              IF g_inbb_d_o.inbb003 IS NOT NULL THEN
                                 LET g_inbb_d[l_ac].inbb003 = g_inbb_d_o.inbb003
                              END IF
                              #add by lixh 20161223
                           END IF
                        ELSE
                           CALL s_lot_sel('1','1',g_site,g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'1',g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002,g_inbb_d[l_ac].inbb003,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008,g_inbb_d[l_ac].inbb009,g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb011,'-1','aint301','','','','','0')
                                RETURNING l_success

                           IF NOT aint302_ins_inao_2() THEN
                              NEXT FIELD CURRENT
                           END IF
                           CALL aint302_inao_fill2()
                        END IF
                     END IF
                  END IF
               END IF
            #170330-00018#1 add Start
            END IF
            #170618-00230#1 -s 20170618 add by 08172
            LET l_imaf055 = ''
            #若設定imaf055(庫存管理特徵)等於'2.不可有庫存管理特徵'時
            SELECT imaf055 INTO l_imaf055
              FROM imaf_t
             WHERE imafent = g_enterprise
               AND imaf001 = g_inbb_d[l_ac].inbb001
               AND imafsite = g_site
            IF l_imaf055 = '2' AND NOT aint302_get_vmi() THEN
               #170618-00230#1 -e 20170618 add by 08172
               IF cl_null(g_inbb_d[l_ac].inbb003) THEN
                  LET g_inbb_d[l_ac].inbb003 = ' '
               END IF
               #170330-00018#1 add END
            END IF  #170618-00230#1 20170618 add by 08172
            #170618-00230#1 -s 20170618 add by 08172
            IF s_lot_batch_number_1n3(g_inbb_d[l_ac].inbb001,g_site) THEN
               IF g_prog MATCHES 'aint302*'
                  OR g_prog MATCHES 'abct302*' #170310-00005#25
                  OR g_prog MATCHES 'apjt600*' THEN

                  IF g_inbb_d[l_ac].inbb003 = ' ' OR cl_null(g_inbb_d[l_ac].inbb003) THEN
                     CALL s_lot_upd_inao(g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'1',' ',g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008,g_inbb_d[l_ac].inbb009,'',g_inbb_d[l_ac].inbb003)
                          RETURNING r_success
                     IF NOT r_success THEN
                        NEXT FIELD CURRENT
                     END IF
                     CALL aint302_inao_fill2()
                  END IF
               END IF
            END IF
            #170618-00230#1 -e 20170618 add by 08172
            LET g_inbb_d_o.inbb003  = g_inbb_d[l_ac].inbb003
               #160316-00007#1 add by lixh 20160316
            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inbb003
            #add-point:ON CHANGE inbb003 name="input.g.page1.inbb003"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb011
            #add-point:BEFORE FIELD inbb011 name="input.b.page1.inbb011"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb011

            #add-point:AFTER FIELD inbb011 name="input.a.page1.inbb011"
            #170811-00052#1 mark (s)
            ##170426-00076#1-S add
            ##申請件數不可為0
            #IF g_inbb_d[l_ac].inbb011 = 0 THEN
            #   INITIALIZE g_errparam TO NULL
            #   LET g_errparam.code = 'ain-00019'
            #   LET g_errparam.extend = g_inbb_d[l_ac].inbb011
            #   LET g_errparam.popup = TRUE
            #   CALL cl_err()
            #   LET g_inbb_d[l_ac].inbb011 = g_inbb_d_o.inbb011
            #   NEXT FIELD CURRENT
            #END IF
            ##170426-00076#1-E add
            #170811-00052#1 mark (e)
            IF NOT cl_null(g_inbb_d[l_ac].inbb011) THEN
              #IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_inbb_d[l_ac].inbb011 != g_inbb_d_o.inbb011)) THEN   #160824-00007#278 161229 by lori mark
               IF g_inbb_d[l_ac].inbb011 != g_inbb_d_o.inbb011 OR cl_null(g_inbb_d_o.inbb011) THEN        #160824-00007#278 161229 by lori add
                  #170811-00052#1 mark (s)
                  ##申請件數不可為0
                  #IF g_inbb_d[l_ac].inbb011 = 0 THEN
                  #   INITIALIZE g_errparam TO NULL
                  #   LET g_errparam.code = 'ain-00019'
                  #   LET g_errparam.extend = g_inbb_d[l_ac].inbb011
                  #   LET g_errparam.popup = TRUE
                  #   CALL cl_err()
                  #
                  #   LET g_inbb_d[l_ac].inbb011 = g_inbb_d_o.inbb011
                  #   NEXT FIELD CURRENT
                  #END IF
                  #170811-00052#1 mark (e)

                  #依據單據別參數控管判斷是否允許輸入小於0
                  #CALL aint302_get_ooac004() RETURNING l_ooac004
                  CALL s_aooi200_get_slip(g_inba_m.inbadocno) RETURNING l_flag1,l_ooac002
                  CALL cl_get_doc_para(g_enterprise,g_site,l_ooac002,'D-BAS-0058') RETURNING l_ooac004
                  #CALL cl_get_doc_para(g_enterprise,g_site,g_inba_m.inbadocno,'D-BAS-0058') RETURNING l_ooac004
                  IF l_ooac004 = 'N' AND g_inbb_d[l_ac].inbb011 < 0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'ain-00020'
                     LET g_errparam.extend = g_inbb_d[l_ac].inbb011
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET g_inbb_d[l_ac].inbb011 = g_inbb_d_o.inbb011
                     NEXT FIELD CURRENT
                  END IF

                  IF NOT cl_null(g_inbb_d[l_ac].inbb010) THEN
                     CALL s_aooi250_take_decimals(g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb011)
                        RETURNING l_success,g_inbb_d[l_ac].inbb011
                     #DISPLAY BY NAME g_inbb_d[l_ac].inbb011  #170526-00058#1 mark
                  END IF

                  #檢核目前庫存量-已在揀量後是否還足夠進行發料，若不夠則show錯誤訊息告知
                  #IF g_argv[1] = '1' THEN  #161109-00032#1
                  IF g_argv[1] = '1' OR g_argv[1] = '3' THEN  #161109-00032#1
                     #出庫單據考慮再揀量
                     CALL s_aooi200_get_slip(g_inba_m.inbadocno) RETURNING l_flag1,l_ooac002
                     CALL cl_get_doc_para(g_enterprise,g_site,l_ooac002,'D-BAS-0070') RETURNING l_ooac004
                     IF l_ooac004 = 'Y' THEN  #161108-00042 mark  #170503-00025#1 remark  #170906-00028#1 mark單據不考慮在撿量也須考慮備置量,因此還是需撿核 #171117-00009#1 remark
                        CALL s_inventory_check_inan(g_site,g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002,g_inbb_d[l_ac].inbb003,
                                                    g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008,g_inbb_d[l_ac].inbb009,
                                                    g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb011,g_inba_m.inbadocno,
                                                    g_inbb_d[l_ac].inbbseq,'0','','','') #160408-00035#9-add-'',''   #170724-00041#4 by sakura add 增加參數,''
                             RETURNING l_success,l_flag1
                        IF NOT l_success OR l_flag1 = 0 THEN
                           LET g_inbb_d[l_ac].inbb011 = g_inbb_d_o.inbb011
                           NEXT FIELD CURRENT
                        END IF
                     END IF  #161108-00042 mark  #170503-00025#1 remark   #170906-00028#1 mark單據不考慮在撿量也須考慮備置量,因此還是需撿核  #171117-00009#1 remark
                  END IF
                  #170503-00025#1-s mark 過帳才做庫存檢查
                  ##當申請數量是打負數時代表是出庫行為，檢核庫存量是否足夠
                  ##IF g_argv[1] = '2' AND g_inbb_d[l_ac].inbb011 < 0 THEN   #161109-00032#1  mark
                  #IF (g_argv[1] = '2' OR g_argv[1] = '4') AND g_inbb_d[l_ac].inbb011 < 0 THEN    #161109-00032#1
                  #   #庫儲需存在與庫存明細檔中
                  #   IF NOT cl_null(g_inbb_d[l_ac].inbb007) THEN
                  #      IF NOT aint302_chk_inag004(g_inbb_d[l_ac].inbb007) THEN
                  #         LET g_inbb_d[l_ac].inbb011 = g_inbb_d_o.inbb011
                  #         NEXT FIELD CURRENT
                  #      END IF
                  #   END IF
                  #
                  #   IF (NOT cl_null(g_inbb_d[l_ac].inbb007)) AND g_inbb_d[l_ac].inbb008 IS NOT NULL THEN
                  #      IF NOT aint302_chk_inag005(g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008) THEN
                  #         LET g_inbb_d[l_ac].inbb011 = g_inbb_d_o.inbb011
                  #         NEXT FIELD CURRENT
                  #      END IF
                  #   END IF
                  #
                  #   LET l_success = ''
                  #   LET l_flag1 = ''
                  #   CALL s_inventory_check_inag008('-1',g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002,g_inbb_d[l_ac].inbb003,
                  #                               g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008,g_inbb_d[l_ac].inbb009,
                  #                               g_inbb_d[l_ac].inbb011*(-1),g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,
                  #                               '0',g_inbb_d[l_ac].inbb010,'')
                  #        RETURNING l_success,l_flag1
                  #   IF NOT l_success THEN      #處理狀況
                  #      LET g_inbb_d[l_ac].inbb011 = g_inbb_d_o.inbb011
                  #      NEXT FIELD CURRENT
                  #   ELSE
                  #      IF l_flag1 = 0 THEN      #庫存量足夠否
                  #         INITIALIZE g_errparam TO NULL
                  #         LET g_errparam.code = 'ain-00270'
                  #         LET g_errparam.extend = ''
                  #         LET g_errparam.popup = TRUE
                  #         CALL cl_err()
                  #
                  #         LET g_inbb_d[l_ac].inbb011 = g_inbb_d_o.inbb011
                  #         NEXT FIELD CURRENT
                  #      END IF
                  #   END IF
                  #END IF
                  #170503-00025#1-e mark

               END IF

               #若料件設置要做製造批序號管理時，新增時維護完數量時自動開啟批序號維護作業維護相關資料

               #add by lixh 20150826
               LET l_imaf071 = NULL
               LET l_imaf081 = NULL
               SELECT imaf071,imaf081 INTO l_imaf071,l_imaf081 FROM imaf_t WHERE imafent = g_enterprise
                 AND imafsite = g_site AND imaf001 = g_inbb_d[l_ac].inbb001
               #add by lixh 20150826

               #IF l_cmd = 'a' AND (l_imaf071 = '1' OR l_imaf081 = '1') THEN #mark by lixh 20150826
               IF (l_cmd = 'a' AND (l_imaf071 = '1' OR l_imaf081 = '1')) OR (g_inbb_d[l_ac].inbb011 <> g_inbb_d_o.inbb011 AND (l_imaf071 = '1' OR l_imaf081 = '1'))  THEN  #add by lixh 20150826
                  #IF g_type = '2' AND g_inbb_d[l_ac].inbb011 > 0 THEN     #161109-00032#1
                  IF (g_type = '2' OR g_type = '4') AND g_inbb_d[l_ac].inbb011 > 0 THEN   #161109-00032#1
                  #   CALL s_lot_ins(g_site,g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'0',g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002,g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb011,'1',g_inba_m.inba003,'2','')
                     #170331-00022#1-S add
                     LET l_tran.prog = g_prog
                     LET l_tran.inbb022 = g_inbb_d[l_ac].inbb022
                     LET g_ls_js = util.JSON.stringify(l_tran)
                     #170331-00022#1-E add
                     CALL s_lot_ins(g_site,g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'1',g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002,g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb011,'1',g_inba_m.inba003,'1','',
                                    g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008,g_inbb_d[l_ac].inbb009,g_inbb_d[l_ac].inbb003)   #160316-00007#1 add by lixh 20160316 add inbb003  #add by lixh 20150909
                          RETURNING l_success,l_amount
                     IF g_inbb_d[l_ac].inbb011 <> l_amount THEN
                        IF cl_ask_confirm('ain-00249') THEN
                           #170617-00536#1-S mark
                           #CALL s_aooi250_convert_qty(g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb011,
                           #                           g_inbb_d[l_ac].inbb013,g_inbb_d[l_ac].inbb014)
                           #   RETURNING l_success,g_inbb_d[l_ac].inbb014
                           #170617-00536#1-E mark

                           #170617-00536#1-S
                           IF NOT cl_null(g_inbb_d[l_ac].inbb010) AND NOT cl_null(g_inbb_d[l_ac].inbb013) THEN
                              CALL s_aooi250_convert_qty(g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb010,
                                                         g_inbb_d[l_ac].inbb013,l_amount)
                                 RETURNING l_success,g_inbb_d[l_ac].inbb014
                           END IF
                           #170617-00536#1-E

                           LET g_inbb_d[l_ac].inbb011 = l_amount
                           LET g_inbb_d[l_ac].inbb012 = l_amount   #add by lixh 20150820
                           #add by lixh 20150820
                           UPDATE inbb_t SET inbb011 = l_amount,
                                             inbb012 = l_amount,
                                             inbb019 = l_amount,  #add by lixh 20151010
                                             inbb014 = g_inbb_d[l_ac].inbb014
                            WHERE inbbent = g_enterprise AND inbbsite = g_site
                              AND inbbdocno = g_inba_m.inbadocno AND inbbseq = g_inbb_d[l_ac].inbbseq
                           IF SQLCA.sqlcode THEN
                              INITIALIZE g_errparam TO NULL
                              LET g_errparam.code = SQLCA.sqlcode
                              LET g_errparam.extend = "inbb_t"
                              LET g_errparam.popup = FALSE
                              CALL cl_err()
                           END IF
                           #add by lixh 20150820
                           #add by lixh 20151010
                           UPDATE inbc_t SET inbc010 = l_amount
                            WHERE inbcent = g_enterprise AND inbcsite = g_site
                              AND inbcdocno = g_inba_m.inbadocno AND inbcseq = g_inbb_d[l_ac].inbbseq
                           LET g_inbc_d[l_ac].inbc010 = l_amount
                           #add by lixh 20151010
                        END IF
                     END IF
                  ELSE
                     #add by lixh 20151210
                     LET l_cnt = 0
                     SELECT COUNT(*) INTO l_cnt FROM inao_t
                      WHERE inaoent = g_enterprise
                        AND inaodocno = g_inba_m.inbadocno
                        AND inaoseq = g_inbb_d[g_detail_idx].inbbseq
                        AND inaoseq1 = 1
                        AND inao000 = '2'
                        AND inao013 = '-1'
                     IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
                     IF l_cnt <> g_inbb_d[l_ac].inbb011 THEN
                     #add by lixh 20151210
                        CALL s_lot_sel('1','1',g_site,g_inba_m.inbadocno,g_inbb_d[g_detail_idx].inbbseq,'1',g_inbb_d[g_detail_idx].inbb001,g_inbb_d[g_detail_idx].inbb002,g_inbb_d[g_detail_idx].inbb003,g_inbb_d[g_detail_idx].inbb007,g_inbb_d[g_detail_idx].inbb008,g_inbb_d[g_detail_idx].inbb009,g_inbb_d[g_detail_idx].inbb010,g_inbb_d[g_detail_idx].inbb011,'-1','aint301','','','','','0')   #add by lixh 20150901
                             RETURNING l_success
                     END IF  #add by lixh 20151210
                  END IF
                  #add by lixh 20150909
                  IF NOT aint302_ins_inao_2() THEN
                  END IF
                  #add by lixh 20150909
                  CALL aint302_inao_fill2()     #add by lixh 20151010
               END IF

               LET g_inbb_d[l_ac].inbb012 = g_inbb_d[l_ac].inbb011

               IF (NOT cl_null(g_inbb_d[l_ac].inbb001)) AND (NOT cl_null(g_inbb_d[l_ac].inbb010)) AND (NOT cl_null(g_inbb_d[l_ac].inbb013)) THEN
#                  CALL s_aimi190_get_convert(g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb013) RETURNING l_success,l_rate  #xj mod
                  CALL s_aooi250_convert_qty(g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb013,g_inbb_d[l_ac].inbb011) RETURNING l_success,g_inbb_d[l_ac].inbb014
                  IF l_success THEN
#                     LET g_inbb_d[l_ac].inbb014 = g_inbb_d[l_ac].inbb011 * l_rate #xj mod
                     LET g_inbb_d[l_ac].inbb015 = g_inbb_d[l_ac].inbb014
                  END IF
               END IF

               #檢驗否為'N'
               IF g_inbb_d[l_ac].inbb018 = 'N' THEN
                  LET g_inbb_d[l_ac].inbb019 = g_inbb_d[l_ac].inbb011
               ELSE
                  LET g_inbb_d[l_ac].inbb019 = 0
               END IF

            END IF
            LET g_inbb_d_o.inbb011 = g_inbb_d[l_ac].inbb011
            #160824-00007#278 161229 by lori add---(S)
            LET g_inbb_d_o.inbb010 = g_inbb_d[l_ac].inbb010
            LET g_inbb_d_o.inbb012 = g_inbb_d[l_ac].inbb012
            LET g_inbb_d_o.inbb014 = g_inbb_d[l_ac].inbb014
            LET g_inbb_d_o.inbb015 = g_inbb_d[l_ac].inbb015
            #160824-00007#278 161229 by lori add---(E)
            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inbb011
            #add-point:ON CHANGE inbb011 name="input.g.page1.inbb011"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb012
            #add-point:BEFORE FIELD inbb012 name="input.b.page1.inbb012"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb012

            #add-point:AFTER FIELD inbb012 name="input.a.page1.inbb012"

            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inbb012
            #add-point:ON CHANGE inbb012 name="input.g.page1.inbb012"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb013

            #add-point:AFTER FIELD inbb013 name="input.a.page1.inbb013"
                                                INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_inbb_d[l_ac].inbb013
            CALL ap_ref_array2(g_ref_fields,"SELECT oocal003 FROM oocal_t WHERE oocalent='"||g_enterprise||"' AND oocal001=? AND oocal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_inbb_d[l_ac].inbb013_desc = '', g_rtn_fields[1] , ''
            #DISPLAY BY NAME g_inbb_d[l_ac].inbb013_desc  #170526-00058#1 mark

            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb013
            #add-point:BEFORE FIELD inbb013 name="input.b.page1.inbb013"

            #END add-point


         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inbb013
            #add-point:ON CHANGE inbb013 name="input.g.page1.inbb013"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb014
            #add-point:BEFORE FIELD inbb014 name="input.b.page1.inbb014"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb014

            #add-point:AFTER FIELD inbb014 name="input.a.page1.inbb014"
            IF NOT cl_null(g_inbb_d[l_ac].inbb014) THEN
              #IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_inbb_d[l_ac].inbb014 != g_inbb_d_o.inbb014)) THEN    #160824-00007#278 161229 by lori mark
               IF g_inbb_d[l_ac].inbb014 != g_inbb_d_o.inbb014 OR cl_null(g_inbb_d_o.inbb014) THEN    #160824-00007#278 161229 by lori add

                  #依據單據別參數控管判斷是否允許輸入小於0
                  #CALL aint302_get_ooac004() RETURNING l_ooac004
                  CALL s_aooi200_get_slip(g_inba_m.inbadocno) RETURNING l_flag1,l_ooac002
                  CALL cl_get_doc_para(g_enterprise,g_site,l_ooac002,'D-BAS-0058') RETURNING l_ooac004
                  #CALL cl_get_doc_para(g_enterprise,g_site,g_inba_m.inbadocno,'D-BAS-0058') RETURNING l_ooac004
                  IF l_ooac004 = 'N' AND g_inbb_d[l_ac].inbb011 < 0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'ain-00020'
                     LET g_errparam.extend = g_inbb_d[l_ac].inbb014
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET g_inbb_d[l_ac].inbb014 = g_inbb_d_o.inbb014
                     NEXT FIELD CURRENT
                  END IF
                  #IF (NOT cl_null(g_inbb_d[l_ac].inbb001)) AND (NOT cl_null(g_inbb_d[l_ac].inbb010)) AND (NOT cl_null(g_inbb_d[l_ac].inbb013)) THEN
#                 #    CALL s_aimi190_get_convert(g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb013,g_inbb_d[l_ac].inbb010) RETURNING l_success,l_rate #xj mod
                  #   CALL s_aooi250_convert_qty(g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb013,g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb014)
                  #      RETURNING l_success,g_inbb_d[l_ac].inbb011
                  #   IF l_success THEN
#                 #       LET g_inbb_d[l_ac].inbb011 = g_inbb_d[l_ac].inbb014 * l_rate  #xj mod
                  #      LET g_inbb_d[l_ac].inbb012 = g_inbb_d[l_ac].inbb011
                  #   END IF
                  #END IF
                  LET g_inbb_d[l_ac].inbb015 = g_inbb_d[l_ac].inbb014
               END IF
            END IF
            LET g_inbb_d_o.inbb014 = g_inbb_d[l_ac].inbb014
            LET g_inbb_d_o.inbb015 = g_inbb_d[l_ac].inbb015   #160824-00007#278 161229 by lori add
            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inbb014
            #add-point:ON CHANGE inbb014 name="input.g.page1.inbb014"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb015
            #add-point:BEFORE FIELD inbb015 name="input.b.page1.inbb015"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb015

            #add-point:AFTER FIELD inbb015 name="input.a.page1.inbb015"

            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inbb015
            #add-point:ON CHANGE inbb015 name="input.g.page1.inbb015"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb016

            #add-point:AFTER FIELD inbb016 name="input.a.page1.inbb016"
            CALL aint302_inba007_ref(g_inbb_d[l_ac].inbb016) RETURNING g_inbb_d[l_ac].inbb016_desc
            #DISPLAY BY NAME g_inbb_d[l_ac].inbb016_desc  #170526-00058#1 mark
            IF NOT cl_null(g_inbb_d[l_ac].inbb016) THEN
            #2015/09/09 by stellar mark ----- (S)
            #整批產生後，理由碼有可能沒值
               #IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_inbb_d[l_ac].inbb016 != g_inbb_d_t.inbb016)) THEN
               IF l_cmd = 'a' OR (l_cmd = 'u' AND ((g_inbb_d_t.inbb016 IS NULL) OR (g_inbb_d[l_ac].inbb016 != g_inbb_d_t.inbb016))) THEN
            #2015/09/09 by stellar mark ----- (E)
                  IF NOT aint302_inba007_chk(g_inbb_d[l_ac].inbb016) THEN
                     LET g_inbb_d[l_ac].inbb016 = g_inbb_d_t.inbb016
                     CALL aint302_inba007_ref(g_inbb_d[l_ac].inbb016) RETURNING g_inbb_d[l_ac].inbb016_desc
                     #DISPLAY BY NAME g_inbb_d[l_ac].inbb016_desc  #170526-00058#1 mark
                     NEXT FIELD inbb016
                  END IF
               END IF
            END IF
            LET g_inbb_d_t.inbb016 = g_inbb_d[l_ac].inbb016 #160906-00045#1
            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb016
            #add-point:BEFORE FIELD inbb016 name="input.b.page1.inbb016"

            #END add-point


         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inbb016
            #add-point:ON CHANGE inbb016 name="input.g.page1.inbb016"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb016_desc
            #add-point:BEFORE FIELD inbb016_desc name="input.b.page1.inbb016_desc"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb016_desc

            #add-point:AFTER FIELD inbb016_desc name="input.a.page1.inbb016_desc"

            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inbb016_desc
            #add-point:ON CHANGE inbb016_desc name="input.g.page1.inbb016_desc"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb017
            #add-point:BEFORE FIELD inbb017 name="input.b.page1.inbb017"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb017

            #add-point:AFTER FIELD inbb017 name="input.a.page1.inbb017"

            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inbb017
            #add-point:ON CHANGE inbb017 name="input.g.page1.inbb017"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb018
            #add-point:BEFORE FIELD inbb018 name="input.b.page1.inbb018"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb018

            #add-point:AFTER FIELD inbb018 name="input.a.page1.inbb018"
            IF g_inbb_d[l_ac].inbb018 = 'N' THEN
               LET g_inbb_d[l_ac].inbb019 = g_inbb_d[l_ac].inbb011
            ELSE
               LET g_inbb_d[l_ac].inbb019 = 0
               #走QC不需要自動產生入庫單
               #160127-00014#1 2016/02/15  By lixh 20160215
               DELETE FROM inbc_t WHERE inbcent = g_enterprise
                                    AND inbcdocno = g_inba_m.inbadocno
                                    AND inbcseq = g_inbb_d[l_ac].inbbseq
               #160127-00014#1 2016/02/15  By lixh 20160215
            END IF
            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inbb018
            #add-point:ON CHANGE inbb018 name="input.g.page1.inbb018"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb019
            #add-point:BEFORE FIELD inbb019 name="input.b.page1.inbb019"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb019

            #add-point:AFTER FIELD inbb019 name="input.a.page1.inbb019"

            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inbb019
            #add-point:ON CHANGE inbb019 name="input.g.page1.inbb019"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb023

            #add-point:AFTER FIELD inbb023 name="input.a.page1.inbb023"
            CALL s_desc_get_project_desc(g_inbb_d[l_ac].inbb023) RETURNING g_inbb_d[l_ac].inbb023_desc
            #DISPLAY BY NAME g_inbb_d[l_ac].inbb023_desc  #170526-00058#1 mark

            IF NOT cl_null(g_inbb_d[l_ac].inbb023) THEN
               IF g_inbb_d[l_ac].inbb023 != g_inbb_d_o.inbb023 OR cl_null(g_inbb_d_o.inbb023) THEN
#應用 a17 樣板自動產生(Version:2)
               #欄位存在檢查
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL

                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_inbb_d[l_ac].inbb023
                  #160318-00025#19  by 07900 --add-str
                  LET g_errshow = TRUE #是否開窗
                  LET g_chkparam.err_str[1] ="apj-00012:sub-01302|apjm200|",cl_get_progname("apjm200",g_lang,"2"),"|:EXEPROGapjm200"
                  #160318-00025#19  by 07900 --add-end
                  #呼叫檢查存在並帶值的library
                  IF NOT cl_chk_exist("v_pjba001") THEN
                     #檢查成功時後續處理
                     LET g_inbb_d[l_ac].inbb023 = g_inbb_d_o.inbb023
                     CALL s_desc_get_project_desc(g_inbb_d[l_ac].inbb023) RETURNING g_inbb_d[l_ac].inbb023_desc
                     #DISPLAY BY NAME g_inbb_d[l_ac].inbb023_desc  #170526-00058#1 mark
                     NEXT FIELD CURRENT
                  END IF
                  LET g_inbb_d[l_ac].inbb024 = ''
                  LET g_inbb_d[l_ac].inbb024_desc = ''
                  LET g_inbb_d[l_ac].inbb025 = ''
                  LET g_inbb_d[l_ac].inbb025_desc = ''
               END IF
            END IF
            LET g_inbb_d_o.inbb023 = g_inbb_d[l_ac].inbb023
            CALL aint302_set_entry_b(l_cmd)
            #160519-00008#1-s
            CALL aint302_set_no_required_b()
            CALL aint302_set_required_b()
            #160519-00008#1-e
            CALL aint302_set_no_entry_b(l_cmd)

            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb023
            #add-point:BEFORE FIELD inbb023 name="input.b.page1.inbb023"

            #END add-point


         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inbb023
            #add-point:ON CHANGE inbb023 name="input.g.page1.inbb023"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb024

            #add-point:AFTER FIELD inbb024 name="input.a.page1.inbb024"
            CALL s_desc_get_wbs_desc(g_inbb_d[l_ac].inbb023,g_inbb_d[l_ac].inbb024) RETURNING g_inbb_d[l_ac].inbb024_desc
            #DISPLAY BY NAME g_inbb_d[l_ac].inbb024_desc  #170526-00058#1 mark

            IF NOT cl_null(g_inbb_d[l_ac].inbb024) THEN
#應用 a17 樣板自動產生(Version:2)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL

               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_inbb_d[l_ac].inbb023
               LET g_chkparam.arg2 = g_inbb_d[l_ac].inbb024

               #呼叫檢查存在並帶值的library
               IF NOT cl_chk_exist("v_pjbb002") THEN
                  #檢查失敗時後續處理
                  LET g_inbb_d[l_ac].inbb024 = g_inbb_d_t.inbb024
                  CALL s_desc_get_wbs_desc(g_inbb_d[l_ac].inbb023,g_inbb_d[l_ac].inbb024) RETURNING g_inbb_d[l_ac].inbb024_desc
                  #DISPLAY BY NAME g_inbb_d[l_ac].inbb024_desc  #170526-00058#1 mark
                  NEXT FIELD CURRENT
               END IF

            END IF
            LET g_inbb_d_o.inbb024 = g_inbb_d[l_ac].inbb024  #170706-00060#1 add
            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb024
            #add-point:BEFORE FIELD inbb024 name="input.b.page1.inbb024"

            #END add-point


         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inbb024
            #add-point:ON CHANGE inbb024 name="input.g.page1.inbb024"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb025

            #add-point:AFTER FIELD inbb025 name="input.a.page1.inbb025"
            CALL s_desc_get_activity_desc(g_inbb_d[l_ac].inbb023,g_inbb_d[l_ac].inbb025) RETURNING g_inbb_d[l_ac].inbb025_desc
            #DISPLAY BY NAME g_inbb_d[l_ac].inbb025_desc  #170526-00058#1 mark

            IF NOT cl_null(g_inbb_d[l_ac].inbb025) THEN
#應用 a17 樣板自動產生(Version:2)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL

               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_inbb_d[l_ac].inbb023
               LET g_chkparam.arg2 = g_inbb_d[l_ac].inbb025

               #呼叫檢查存在並帶值的library
               IF NOT cl_chk_exist("v_pjbm002") THEN
                  #檢查失敗時後續處理
                  LET g_inbb_d[l_ac].inbb025 = g_inbb_d_t.inbb025
                  CALL s_desc_get_activity_desc(g_inbb_d[l_ac].inbb023,g_inbb_d[l_ac].inbb025) RETURNING g_inbb_d[l_ac].inbb025_desc
                  #DISPLAY BY NAME g_inbb_d[l_ac].inbb025_desc  #170526-00058#1 mark
                  NEXT FIELD CURRENT
               END IF
            END IF

            LET g_inbb_d_o.inbb025 = g_inbb_d[l_ac].inbb025  #170706-00060#1 add
            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb025
            #add-point:BEFORE FIELD inbb025 name="input.b.page1.inbb025"

            #END add-point


         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inbb025
            #add-point:ON CHANGE inbb025 name="input.g.page1.inbb025"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb020
            #add-point:BEFORE FIELD inbb020 name="input.b.page1.inbb020"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb020

            #add-point:AFTER FIELD inbb020 name="input.a.page1.inbb020"

            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inbb020
            #add-point:ON CHANGE inbb020 name="input.g.page1.inbb020"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb204
            #add-point:BEFORE FIELD inbb204 name="input.b.page1.inbb204"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb204

            #add-point:AFTER FIELD inbb204 name="input.a.page1.inbb204"
            #170808-00058#1--add---s
            #如果料號有設定有效期imaf031、imaf032，如果有設定且製造日期修改時，重新計算有效日期
            IF g_type = '2' OR g_type = '4' THEN
               CALL s_aini010_calculate_effdt(g_site,g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002,g_inbb_d[l_ac].inbb009,g_inbb_d[l_ac].inbb204) RETURNING g_inbb_d[l_ac].inbb022
               DISPLAY BY NAME g_inbb_d[l_ac].inbb022
            END IF
            #170808-00058#1--add---e
            #160512-00004#2-add-(S)
            IF NOT aint302_inbb204_inbb022_chk(g_inbb_d[l_ac].inbb204,g_inbb_d[l_ac].inbb022) THEN
               LET g_inbb_d[l_ac].inbb204 = g_inbb_d_o.inbb204
               NEXT FIELD CURRENT
            END IF
            LET g_inbb_d_o.inbb204 = g_inbb_d[l_ac].inbb204
            #160512-00004#2-add-(E)

            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inbb204
            #add-point:ON CHANGE inbb204 name="input.g.page1.inbb204"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb022
            #add-point:BEFORE FIELD inbb022 name="input.b.page1.inbb022"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb022

            #add-point:AFTER FIELD inbb022 name="input.a.page1.inbb022"
            #160512-00004#2-add-(S)
            IF NOT aint302_inbb204_inbb022_chk(g_inbb_d[l_ac].inbb204,g_inbb_d[l_ac].inbb022) THEN
               LET g_inbb_d[l_ac].inbb022 = g_inbb_d_o.inbb022
               NEXT FIELD CURRENT
            END IF
            #170331-00022#1-S add
            LET l_tran.prog = g_prog
            LET l_tran.inbb022 = g_inbb_d[l_ac].inbb022
            LET g_ls_js = util.JSON.stringify(l_tran)
            #170331-00022#1-E add
            LET g_inbb_d_o.inbb022 = g_inbb_d[l_ac].inbb022
            #160512-00004#2-add-(E)
            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inbb022
            #add-point:ON CHANGE inbb022 name="input.g.page1.inbb022"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inbb021
            #add-point:BEFORE FIELD inbb021 name="input.b.page1.inbb021"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inbb021

            #add-point:AFTER FIELD inbb021 name="input.a.page1.inbb021"

            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE inbb021
            #add-point:ON CHANGE inbb021 name="input.g.page1.inbb021"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooff013
            #add-point:BEFORE FIELD ooff013 name="input.b.page1.ooff013"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ooff013

            #add-point:AFTER FIELD ooff013 name="input.a.page1.ooff013"

            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ooff013
            #add-point:ON CHANGE ooff013 name="input.g.page1.ooff013"

            #END add-point



                  #Ctrlp:input.c.page1.inbbseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbbseq
            #add-point:ON ACTION controlp INFIELD inbbseq name="input.c.page1.inbbseq"

            #END add-point


         #Ctrlp:input.c.page1.inbb026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb026
            #add-point:ON ACTION controlp INFIELD inbb026 name="input.c.page1.inbb026"

            #END add-point


         #Ctrlp:input.c.page1.inbb001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb001
            #add-point:ON ACTION controlp INFIELD inbb001 name="input.c.page1.inbb001"
                                    #此段落由子樣板a07產生
            #開窗i段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE

            LET g_qryparam.where = "1=1 "
            LET l_sql1 = ''
            CALL s_control_get_doc_sql("imaf016",g_inba_m.inbadocno,'4') RETURNING l_success,l_sql1
            IF l_success THEN
               LET g_qryparam.where = g_qryparam.where ," AND ",l_sql1
            END IF

            LET l_sql2 = ''
            CALL s_control_get_doc_sql("imaa009",g_inba_m.inbadocno,'5') RETURNING l_success,l_sql2
            IF l_success THEN
               LET g_qryparam.where = g_qryparam.where ," AND ",l_sql2
            END IF

           ##161114-00040#1 add  --begin--
            LET g_qryparam.where = g_qryparam.where ," AND imaf016 IN(SELECT oocq002 FROM oocq_t ",
                                                     " WHERE oocqent = ",g_enterprise,
                                                     "   AND oocq001 = '210' AND oocq009 = 'N' AND oocqstus = 'Y') "
           ##161114-00040#1 add  --end--

            LET g_qryparam.default1 = g_inbb_d[l_ac].inbb001             #給予default值

            CALL q_imaf001_15()
            LET g_qryparam.where = " "

            LET g_inbb_d[l_ac].inbb001 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_inbb_d[l_ac].inbb001 TO inbb001              #顯示到畫面上
            #CALL aint302_inbb001_ref(g_inbb_d[l_ac].inbb001)      #170314-00104#1 mark
            NEXT FIELD inbb001                          #返回原欄位


            #END add-point


         #Ctrlp:input.c.page1.inbb002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb002
            #add-point:ON ACTION controlp INFIELD inbb002 name="input.c.page1.inbb002"
            #取得料件產品特徵
            LET l_imaa005 = ''
            CALL aint302_get_imaa005(g_enterprise,g_inbb_d[l_ac].inbb001) RETURNING l_imaa005

            IF NOT cl_null(l_imaa005) THEN
               IF l_cmd = 'a' THEN
                  CALL l_inam.clear()
                  CALL s_feature(l_cmd,g_inbb_d[l_ac].inbb001,'','',g_site,g_inba_m.inbadocno) RETURNING l_success,l_inam
                  LET g_inbb_d[l_ac].inbb002 = l_inam[1].inam002
                  LET g_inbb_d[l_ac].inbb011 = l_inam[1].inam004
                  #DISPLAY BY NAME g_inbb_d[l_ac].inbb002,g_inbb_d[l_ac].inbb011  #170526-00058#1 mark

                  LET g_inbb_d[l_ac].inbb012 = g_inbb_d[l_ac].inbb011
                  #檢驗否為'N'
                  IF g_inbb_d[l_ac].inbb018 = 'N' THEN
                     LET g_inbb_d[l_ac].inbb019 = g_inbb_d[l_ac].inbb011
                  ELSE
                     LET g_inbb_d[l_ac].inbb019 = 0
                  END IF

               END IF
               IF l_cmd = 'u' THEN
                  CALL s_feature_single(g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002,g_site,g_inba_m.inbadocno)
                     RETURNING l_success,g_inbb_d[l_ac].inbb002
                  #DISPLAY BY NAME g_inbb_d[l_ac].inbb002  #170526-00058#1 mark
               END IF
            END IF
            #END add-point


         #Ctrlp:input.c.page1.inbb004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb004
            #add-point:ON ACTION controlp INFIELD inbb004 name="input.c.page1.inbb004"
                                    #此段落由子樣板a07產生
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_inbb_d[l_ac].inbb004             #給予default值
            LET g_qryparam.default2 = "" #g_inbb_d[l_ac].imaal003 #品名

            #給予arg

            CALL q_imaf001_12()                                #呼叫開窗

            LET g_inbb_d[l_ac].inbb004 = g_qryparam.return1              #將開窗取得的值回傳到變數
            #LET g_inbb_d[l_ac].inbb004_desc = g_qryparam.return2 #品名

            DISPLAY g_inbb_d[l_ac].inbb004 TO inbb004              #顯示到畫面上
            CALL aint302_inbb004_ref(g_inbb_d[l_ac].inbb004) RETURNING g_inbb_d[l_ac].inbb004_desc
            #DISPLAY BY NAME g_inbb_d[l_ac].inbb004_desc  #170526-00058#1 mark

            NEXT FIELD inbb004                          #返回原欄位


            #END add-point


         #Ctrlp:input.c.page1.inbb007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb007
            #add-point:ON ACTION controlp INFIELD inbb007 name="input.c.page1.inbb007"
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE

			   LET g_qryparam.where = "1=1 "
            LET l_sql1 = ''
            CALL s_control_get_doc_sql("inaa001",g_inba_m.inbadocno,'6') RETURNING l_success,l_sql1
            IF l_success THEN
               LET g_qryparam.where = g_qryparam.where ," AND ",l_sql1
            END IF
            #LET l_sql2 = ''
            #CALL s_control_get_sql("inaa001",'9','5',g_user,g_dept) RETURNING l_success,l_sql2
            #IF l_success THEN
            #   LET g_qryparam.where = g_qryparam.where ," AND ",l_sql2
            #END IF

            #雜收時，庫位開窗與檢核需排除待報廢庫位
            #IF g_type = '2' THEN                 #161109-00032#1
            IF g_type = '2' OR g_type = '4' THEN  #161109-00032#1
               LET g_qryparam.where = g_qryparam.where ," AND inaa016 = 'N' "
            END IF

            #給予default值
            LET g_qryparam.default1 = g_inbb_d[l_ac].inbb007

            #若是雜項庫存發料作業時，輸入的料件+產品特徵+庫存管理特徵+庫位必須存在[T:庫存明細檔]中
            #IF g_type = '1' THEN  #161109-00032#1
            IF g_type = '1' OR g_type = '3' THEN  #161109-00032#1
               #給予arg
               LET g_qryparam.arg1 = g_inbb_d[l_ac].inbb001
               LET g_qryparam.arg2 = g_inbb_d[l_ac].inbb002
               #排除库位无效
               #170323-00024#1 -s 20170327 add by 08172
               LET g_qryparam.where = g_qryparam.where CLIPPED," AND inaastus = 'Y' "
               #170323-00024#1 -e 20170327 add by 08172
               #161007-00012#3-s-add
               #--排除結算倉的部分
               LET g_qryparam.where = g_qryparam.where CLIPPED," AND NOT EXISTS (SELECT inac001 FROM inac_t ",
                                                               "                  WHERE inacent='",g_enterprise,"' AND inacsite='",g_site,"' AND inac001=inag004 AND inac003='",g_bas_0044,"') "
               #161007-00012#3-e-add
               #呼叫開窗
               CALL q_inag004_13()
               #將開窗取得的值回傳到變數
               LET g_inbb_d[l_ac].inbb007 = g_qryparam.return1
               LET g_inbb_d[l_ac].inbb008 = g_qryparam.return2
               LET g_inbb_d[l_ac].inbb009 = g_qryparam.return3
               LET g_inbb_d[l_ac].inbb003 = g_qryparam.return4
               LET g_inbb_d[l_ac].inbb010 = g_qryparam.return5  #160302-00018#1 add
            #若是雜項庫存收料作業時
            ELSE
               #161007-00012#3-s-add
               #--排除結算倉的部分
               LET g_qryparam.where = g_qryparam.where CLIPPED," AND NOT EXISTS (SELECT inac001 FROM inac_t ",
                                                               "                  WHERE inacent='",g_enterprise,"' AND inacsite='",g_site,"' AND inac001=inaa001 AND inac003='",g_bas_0044,"') "
               #161007-00012#3-e-add
               CALL q_inaa001_2()
               #CALL q_inaa001_21()
               LET g_inbb_d[l_ac].inbb007 = g_qryparam.return1
               #LET g_inbb_d[l_ac].inbb008 = g_qryparam.return2
            END IF

            #顯示到畫面上
            DISPLAY g_inbb_d[l_ac].inbb007 TO inbb007
            DISPLAY g_inbb_d[l_ac].inbb008 TO inbb008
            DISPLAY g_inbb_d[l_ac].inbb009 TO inbb009
            DISPLAY g_inbb_d[l_ac].inbb003 TO inbb003

            #160302-00018#1---add--begin---
            DISPLAY g_inbb_d[l_ac].inbb010 TO inbb010
            CALL s_desc_get_unit_desc(g_inbb_d[l_ac].inbb010) RETURNING g_inbb_d[l_ac].inbb010_desc
            #DISPLAY BY NAME g_inbb_d[l_ac].inbb010_desc  #170526-00058#1 mark
            #160302-00018#1---add--end---

            CALL s_desc_get_stock_desc(g_site,g_inbb_d[l_ac].inbb007) RETURNING g_inbb_d[l_ac].inbb007_desc
            CALL s_desc_get_locator_desc(g_site,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008) RETURNING g_inbb_d[l_ac].inbb008_desc
            #DISPLAY BY NAME g_inbb_d[l_ac].inbb007_desc,g_inbb_d[l_ac].inbb008_desc  #170526-00058#1 mark

            #返回原欄位
            NEXT FIELD inbb007


            #END add-point


         #Ctrlp:input.c.page1.inbb008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb008
            #add-point:ON ACTION controlp INFIELD inbb008 name="input.c.page1.inbb008"

            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE

            #給予default值
            #161007-00012#3-s-mod 按取消時，回傳值會放錯欄位，如inbb008會放到inbb007
            #LET g_qryparam.default1 = g_inbb_d[l_ac].inbb008
            LET g_qryparam.default1 = g_inbb_d[l_ac].inbb007
            LET g_qryparam.default2 = g_inbb_d[l_ac].inbb008
            LET g_qryparam.default3 = g_inbb_d[l_ac].inbb009
            LET g_qryparam.default4 = g_inbb_d[l_ac].inbb003
            LET g_qryparam.default5 = g_inbb_d[l_ac].inbb010
            #161007-00012#3-e-mod

            #若是雜項庫存發料作業時，輸入的料件+產品特徵+庫存管理特徵+庫位必須存在[T:庫存明細檔]中
            #IF g_type = '1' THEN   #161109-00032#1
            IF g_type = '1' OR g_type = '3'  THEN   #161109-00032#1
               LET g_qryparam.arg1 = g_inbb_d[l_ac].inbb001
               LET g_qryparam.arg2 = g_inbb_d[l_ac].inbb002
               #161007-00012#3-s-add
               #--排除結算倉的部分
               LET g_qryparam.where = " NOT EXISTS (SELECT inac001 FROM inac_t ",
                                      "              WHERE inacent='",g_enterprise,"' AND inacsite='",g_site,"' AND inac001=inag004 AND inac003='",g_bas_0044,"') "
               #161007-00012#3-e-add
               CALL q_inag004_13()
               #將開窗取得的值回傳到變數
               LET g_inbb_d[l_ac].inbb007 = g_qryparam.return1
               LET g_inbb_d[l_ac].inbb008 = g_qryparam.return2
               LET g_inbb_d[l_ac].inbb009 = g_qryparam.return3
               LET g_inbb_d[l_ac].inbb003 = g_qryparam.return4
               LET g_inbb_d[l_ac].inbb010 = g_qryparam.return5  #160302-00018#1 add
            #若是雜項庫存收料作業時
            ELSE
               LET g_qryparam.where = " inab001 = '",g_inbb_d[l_ac].inbb007,"' "
               #161007-00012#3-s-add
               #--排除結算倉的部分
               LET g_qryparam.where = g_qryparam.where CLIPPED," AND NOT EXISTS (SELECT inac001 FROM inac_t ",
                                                               "                  WHERE inacent='",g_enterprise,"' AND inacsite='",g_site,"' AND inac001=inab001 AND inac003='",g_bas_0044,"') "
               #161007-00012#3-e-add
               LET g_qryparam.default1 = g_inbb_d[l_ac].inbb008  #161206-00016#1
               CALL q_inab002()
               LET g_inbb_d[l_ac].inbb008 = g_qryparam.return1
            END IF

            DISPLAY g_inbb_d[l_ac].inbb007 TO inbb007
            DISPLAY g_inbb_d[l_ac].inbb008 TO inbb008
            DISPLAY g_inbb_d[l_ac].inbb009 TO inbb009
            DISPLAY g_inbb_d[l_ac].inbb003 TO inbb003

            #160302-00018#1---add--begin---
            DISPLAY g_inbb_d[l_ac].inbb010 TO inbb010
            CALL s_desc_get_unit_desc(g_inbb_d[l_ac].inbb010) RETURNING g_inbb_d[l_ac].inbb010_desc
            #DISPLAY BY NAME g_inbb_d[l_ac].inbb010_desc  #170526-00058#1 mark
            #160302-00018#1---add--end---

            CALL s_desc_get_stock_desc(g_site,g_inbb_d[l_ac].inbb007) RETURNING g_inbb_d[l_ac].inbb007_desc
            CALL s_desc_get_locator_desc(g_site,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008) RETURNING g_inbb_d[l_ac].inbb008_desc
            #DISPLAY BY NAME g_inbb_d[l_ac].inbb007_desc,g_inbb_d[l_ac].inbb008_desc  #170526-00058#1 mark
            NEXT FIELD inbb008

            #END add-point


         #Ctrlp:input.c.page1.inbb009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb009
            #add-point:ON ACTION controlp INFIELD inbb009 name="input.c.page1.inbb009"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE

            #給予default值
            #LET g_qryparam.default1 = g_inbb_d[l_ac].inbb009  #161206-00016#1
            #161206-00016#1-S
            LET g_qryparam.default1 = g_inbb_d[l_ac].inbb007
            LET g_qryparam.default2 = g_inbb_d[l_ac].inbb008
            LET g_qryparam.default3 = g_inbb_d[l_ac].inbb009
            LET g_qryparam.default4 = g_inbb_d[l_ac].inbb003
            LET g_qryparam.default5 = g_inbb_d[l_ac].inbb010
            #161206-00016#1-E
            #若是雜項庫存發料作業時，輸入的料件+產品特徵+庫存管理特徵+庫位必須存在[T:庫存明細檔]中
            #IF g_type = '1' THEN  #161109-00032#1
            IF g_type = '1' OR g_type = '3' THEN  #161109-00032#1
               LET g_qryparam.arg1 = g_inbb_d[l_ac].inbb001
               LET g_qryparam.arg2 = g_inbb_d[l_ac].inbb002
               #161007-00012#3-s-add
               #--排除結算倉的部分
               LET g_qryparam.where = " NOT EXISTS (SELECT inac001 FROM inac_t ",
                                      "              WHERE inacent='",g_enterprise,"' AND inacsite='",g_site,"' AND inac001=inag004 AND inac003='",g_bas_0044,"') "
               #161007-00012#3-e-add
               CALL q_inag004_13()
               #將開窗取得的值回傳到變數
               LET g_inbb_d[l_ac].inbb007 = g_qryparam.return1
               LET g_inbb_d[l_ac].inbb008 = g_qryparam.return2
               LET g_inbb_d[l_ac].inbb009 = g_qryparam.return3
               LET g_inbb_d[l_ac].inbb003 = g_qryparam.return4
               LET g_inbb_d[l_ac].inbb010 = g_qryparam.return5  #160302-00018#1 add
            END IF

            DISPLAY g_inbb_d[l_ac].inbb007 TO inbb007
            DISPLAY g_inbb_d[l_ac].inbb008 TO inbb008
            DISPLAY g_inbb_d[l_ac].inbb009 TO inbb009
            DISPLAY g_inbb_d[l_ac].inbb003 TO inbb003

            #160302-00018#1---add--begin---
            DISPLAY g_inbb_d[l_ac].inbb010 TO inbb010
            CALL s_desc_get_unit_desc(g_inbb_d[l_ac].inbb010) RETURNING g_inbb_d[l_ac].inbb010_desc
            #DISPLAY BY NAME g_inbb_d[l_ac].inbb010_desc  #170526-00058#1 mark
            #160302-00018#1---add--end---

            CALL s_desc_get_stock_desc(g_site,g_inbb_d[l_ac].inbb007) RETURNING g_inbb_d[l_ac].inbb007_desc
            CALL s_desc_get_locator_desc(g_site,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008) RETURNING g_inbb_d[l_ac].inbb008_desc
            #DISPLAY BY NAME g_inbb_d[l_ac].inbb007_desc,g_inbb_d[l_ac].inbb008_desc  #170526-00058#1 mark

            NEXT FIELD inbb009
            #END add-point


         #Ctrlp:input.c.page1.inbb010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb010
            #add-point:ON ACTION controlp INFIELD inbb010 name="input.c.page1.inbb010"
                                    #此段落由子樣板a07產生
            #開窗i段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_inbb_d[l_ac].inbb010             #給予default值

            #給予arg

            #CALL q_ooca001_1()                                #呼叫開窗

            LET g_qryparam.arg1 = g_inbb_d[l_ac].inbb001

            CALL q_imao002()

            LET g_inbb_d[l_ac].inbb010 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_inbb_d[l_ac].inbb010 TO inbb010              #顯示到畫面上

            CALL aint302_inbb010_ref(g_inbb_d[l_ac].inbb010) RETURNING g_inbb_d[l_ac].inbb010_desc
            #DISPLAY BY NAME g_inbb_d[l_ac].inbb010_desc  #170526-00058#1 mark

            NEXT FIELD inbb010                          #返回原欄位


            #END add-point


         #Ctrlp:input.c.page1.inbb003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb003
            #add-point:ON ACTION controlp INFIELD inbb003 name="input.c.page1.inbb003"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE

            #LET g_qryparam.default1 = g_inbb_d[l_ac].inbb003         #161206-00016#1 mark
            #161206-00016#1-S
            LET g_qryparam.default1 = g_inbb_d[l_ac].inbb007
            LET g_qryparam.default2 = g_inbb_d[l_ac].inbb008
            LET g_qryparam.default3 = g_inbb_d[l_ac].inbb009
            LET g_qryparam.default4 = g_inbb_d[l_ac].inbb003
            LET g_qryparam.default5 = g_inbb_d[l_ac].inbb010
            #161206-00016#1-E
            #若是雜項庫存發料作業時，輸入的料件+產品特徵+庫存管理特徵+庫位必須存在[T:庫存明細檔]中
            #IF g_type = '1' THEN  #161109-00032#1
            IF g_type = '1' OR g_type = '3' THEN  #161109-00032#1
               #LET g_qryparam.where = " inag001 = '",g_inbb_d[l_ac].inbb001,"' AND inag002 = '",g_inbb_d[l_ac].inbb002,"' " #160808-00001#1 mark
               #160808-00001#1-s
               #給予arg
               LET g_qryparam.arg1 = g_inbb_d[l_ac].inbb001
               LET g_qryparam.arg2 = g_inbb_d[l_ac].inbb002
               #160808-00001#1-e
               #161007-00012#3-s-add
               #--排除結算倉的部分
               LET g_qryparam.where = " NOT EXISTS (SELECT inac001 FROM inac_t ",
                                      "              WHERE inacent='",g_enterprise,"' AND inacsite='",g_site,"' AND inac001=inag004 AND inac003='",g_bas_0044,"') "
               #161007-00012#3-e-add
               CALL q_inag004_13()
               LET g_inbb_d[l_ac].inbb007 = g_qryparam.return1
               LET g_inbb_d[l_ac].inbb008 = g_qryparam.return2              #將開窗取得的值回傳到變數
               LET g_inbb_d[l_ac].inbb009 = g_qryparam.return3
               LET g_inbb_d[l_ac].inbb003 = g_qryparam.return4
               LET g_inbb_d[l_ac].inbb010 = g_qryparam.return5  #160302-00018#1 add
               DISPLAY g_inbb_d[l_ac].inbb007 TO inbb007
               DISPLAY g_inbb_d[l_ac].inbb008 TO inbb008
               DISPLAY g_inbb_d[l_ac].inbb009 TO inbb009
               DISPLAY g_inbb_d[l_ac].inbb003 TO inbb003

               #160302-00018#1---add--begin---
               DISPLAY g_inbb_d[l_ac].inbb010 TO inbb010
               CALL s_desc_get_unit_desc(g_inbb_d[l_ac].inbb010) RETURNING g_inbb_d[l_ac].inbb010_desc
               #DISPLAY BY NAME g_inbb_d[l_ac].inbb010_desc  #170526-00058#1 mark

               CALL s_desc_get_stock_desc(g_site,g_inbb_d[l_ac].inbb007) RETURNING g_inbb_d[l_ac].inbb007_desc
               CALL s_desc_get_locator_desc(g_site,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008) RETURNING g_inbb_d[l_ac].inbb008_desc
               #DISPLAY BY NAME g_inbb_d[l_ac].inbb007_desc,g_inbb_d[l_ac].inbb008_desc  #170526-00058#1 mark
               #160302-00018#1---add--end---

            END IF

            NEXT FIELD inbb003
            #END add-point


         #Ctrlp:input.c.page1.inbb011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb011
            #add-point:ON ACTION controlp INFIELD inbb011 name="input.c.page1.inbb011"

            #END add-point


         #Ctrlp:input.c.page1.inbb012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb012
            #add-point:ON ACTION controlp INFIELD inbb012 name="input.c.page1.inbb012"

            #END add-point


         #Ctrlp:input.c.page1.inbb013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb013
            #add-point:ON ACTION controlp INFIELD inbb013 name="input.c.page1.inbb013"

            #END add-point


         #Ctrlp:input.c.page1.inbb014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb014
            #add-point:ON ACTION controlp INFIELD inbb014 name="input.c.page1.inbb014"

            #END add-point


         #Ctrlp:input.c.page1.inbb015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb015
            #add-point:ON ACTION controlp INFIELD inbb015 name="input.c.page1.inbb015"

            #END add-point


         #Ctrlp:input.c.page1.inbb016
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb016
            #add-point:ON ACTION controlp INFIELD inbb016 name="input.c.page1.inbb016"
                                    #此段落由子樣板a07產生
            #開窗i段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE
			   LET g_qryparam.where = "1=1 "
            LET l_sql1 = ''
            CALL s_control_get_doc_sql("oocq002",g_inba_m.inbadocno,'8') RETURNING l_success,l_sql1
            IF l_success THEN
               LET g_qryparam.where = g_qryparam.where ," AND ",l_sql1
            END IF

            LET g_qryparam.default1 = g_inbb_d[l_ac].inbb016             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_acc #

            CALL q_oocq002()                                #呼叫開窗
            LET g_qryparam.where = " "

            LET g_inbb_d[l_ac].inbb016 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_inbb_d[l_ac].inbb016 TO inbb016              #顯示到畫面上
            CALL aint302_inba007_ref(g_inba_m.inba007) RETURNING g_inba_m.inba007_desc
            #DISPLAY BY NAME g_inba_m.inba007_desc  #170526-00058#1 mark

            NEXT FIELD inbb016                          #返回原欄位


            #END add-point


         #Ctrlp:input.c.page1.inbb016_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb016_desc
            #add-point:ON ACTION controlp INFIELD inbb016_desc name="input.c.page1.inbb016_desc"

            #END add-point


         #Ctrlp:input.c.page1.inbb017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb017
            #add-point:ON ACTION controlp INFIELD inbb017 name="input.c.page1.inbb017"

            #END add-point


         #Ctrlp:input.c.page1.inbb018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb018
            #add-point:ON ACTION controlp INFIELD inbb018 name="input.c.page1.inbb018"

            #END add-point


         #Ctrlp:input.c.page1.inbb019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb019
            #add-point:ON ACTION controlp INFIELD inbb019 name="input.c.page1.inbb019"

            #END add-point


         #Ctrlp:input.c.page1.inbb023
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb023
            #add-point:ON ACTION controlp INFIELD inbb023 name="input.c.page1.inbb023"
            #應用 a07 樣板自動產生(Version:2)
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_inbb_d[l_ac].inbb023             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s


            CALL q_pjba001()                                #呼叫開窗

            LET g_inbb_d[l_ac].inbb023 = g_qryparam.return1

            DISPLAY g_inbb_d[l_ac].inbb023 TO inbb023              #
            CALL s_desc_get_project_desc(g_inbb_d[l_ac].inbb023) RETURNING g_inbb_d[l_ac].inbb023_desc
            #DISPLAY BY NAME g_inbb_d[l_ac].inbb023_desc  #170526-00058#1 mark

            NEXT FIELD inbb023                          #返回原欄位


            #END add-point


         #Ctrlp:input.c.page1.inbb024
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb024
            #add-point:ON ACTION controlp INFIELD inbb024 name="input.c.page1.inbb024"
            #應用 a07 樣板自動產生(Version:2)
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_inbb_d[l_ac].inbb024             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_inbb_d[l_ac].inbb023  #s


            CALL q_pjbb002_1()                                #呼叫開窗

            LET g_inbb_d[l_ac].inbb024 = g_qryparam.return1

            DISPLAY g_inbb_d[l_ac].inbb024 TO inbb024              #
            CALL s_desc_get_wbs_desc(g_inbb_d[l_ac].inbb023,g_inbb_d[l_ac].inbb024) RETURNING g_inbb_d[l_ac].inbb024_desc
            #DISPLAY BY NAME g_inbb_d[l_ac].inbb024_desc  #170526-00058#1 mark

            NEXT FIELD inbb024                          #返回原欄位


            #END add-point


         #Ctrlp:input.c.page1.inbb025
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb025
            #add-point:ON ACTION controlp INFIELD inbb025 name="input.c.page1.inbb025"
            #應用 a07 樣板自動產生(Version:2)
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_inbb_d[l_ac].inbb025             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_inbb_d[l_ac].inbb023   #s


            CALL q_pjbm002()                                #呼叫開窗

            LET g_inbb_d[l_ac].inbb025 = g_qryparam.return1

            DISPLAY g_inbb_d[l_ac].inbb025 TO inbb025              #
            CALL s_desc_get_activity_desc(g_inbb_d[l_ac].inbb023,g_inbb_d[l_ac].inbb025) RETURNING g_inbb_d[l_ac].inbb025_desc
            #DISPLAY BY NAME g_inbb_d[l_ac].inbb025_desc  #170526-00058#1 mark

            NEXT FIELD inbb025                          #返回原欄位


            #END add-point


         #Ctrlp:input.c.page1.inbb020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb020
            #add-point:ON ACTION controlp INFIELD inbb020 name="input.c.page1.inbb020"

            #END add-point


         #Ctrlp:input.c.page1.inbb204
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb204
            #add-point:ON ACTION controlp INFIELD inbb204 name="input.c.page1.inbb204"

            #END add-point


         #Ctrlp:input.c.page1.inbb022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb022
            #add-point:ON ACTION controlp INFIELD inbb022 name="input.c.page1.inbb022"

            #END add-point


         #Ctrlp:input.c.page1.inbb021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inbb021
            #add-point:ON ACTION controlp INFIELD inbb021 name="input.c.page1.inbb021"

            #END add-point


         #Ctrlp:input.c.page1.ooff013
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ooff013
            #add-point:ON ACTION controlp INFIELD ooff013 name="input.c.page1.ooff013"
            #161031-00025#7 add-S
            IF NOT cl_null(g_inba_m.inbadocno) AND l_ac > 0 THEN
               CALL aooi360_02('7',g_prog,g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'','','','','','','','1')
               CALL s_aooi360_sel('7',g_prog,g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'','','','','','','','1') RETURNING l_success,g_inbb_d[l_ac].ooff013
               LET g_ooff001_d = '6'   #6.單據單頭備註
               LET g_ooff002_d = g_prog
               LET g_ooff003_d = g_inba_m.inbadocno   #单号
               LET g_ooff004_d = 0     #项次
               LET g_ooff005_d = ' '
               LET g_ooff006_d = ' '
               LET g_ooff007_d = ' '
               LET g_ooff008_d = ' '
               LET g_ooff009_d = ' '
               LET g_ooff010_d = ' '
               LET g_ooff011_d = ' '
               CALL aooi360_01_b_fill(g_ooff001_d,g_ooff002_d,g_ooff003_d,g_ooff004_d,g_ooff005_d,g_ooff006_d,g_ooff007_d,g_ooff008_d,g_ooff009_d,g_ooff010_d,g_ooff011_d)   #备注单身
            END IF
            #161031-00025#7 add-E
            #END add-point




         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_inbb_d[l_ac].* = g_inbb_d_t.*
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = ''
               LET g_errparam.code = 9001
               LET g_errparam.popup = FALSE
               CLOSE aint302_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG
            END IF

            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = g_inbb_d[l_ac].inbbseq
               LET g_errparam.code = -263
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET g_inbb_d[l_ac].* = g_inbb_d_t.*
            ELSE

               #add-point:單身修改前 name="input.body.b_update"
               #170905-00030#1 mark(s)
               ##170811-00052#1 add (s)
               ##申請件數不可為0
               #IF g_inbb_d[l_ac].inbb011 = 0 THEN
               #   INITIALIZE g_errparam TO NULL
               #   LET g_errparam.code = 'ain-00019'
               #   LET g_errparam.extend = g_inbb_d[l_ac].inbb011
               #   LET g_errparam.popup = TRUE
               #   CALL cl_err()
               #
               #   LET g_inbb_d[l_ac].inbb011 = g_inbb_d_o.inbb011
               #   NEXT FIELD inbb011
               #END IF
               ##170811-00052#1 add (e)
               #170905-00030#1 mark(e)
               #160617-00005#1---s--
               LET l_imaf061 = ''
               LET l_imaf062 = ''
               LET l_imaf063 = ''

               SELECT imaf061,imaf062,imaf063 INTO l_imaf061,l_imaf062,l_imaf063
                  FROM imaf_t WHERE imafent = g_enterprise AND imafsite = g_site AND imaf001 = g_inbb_d[l_ac].inbb001

               #若是雜項庫存收料作業時
               #IF g_type = '2' THEN   #161109-00032#1
               IF g_type = '2' OR g_type = '4' THEN   #161109-00032#1
                  IF cl_null(g_inbb_d[l_ac].inbb009) AND l_imaf061 = '1' AND l_imaf062 = 'Y' AND (NOT cl_null(l_imaf063)) THEN
                     CALL s_aooi390_gen_1('6',l_imaf063) RETURNING l_success,g_inbb_d[l_ac].inbb009,l_oofg_return
                     IF NOT l_success THEN
                        LET g_inbb_d[l_ac].inbb009 = ''
                     ELSE
                        CALL s_aooi390_get_auto_no('6',g_inbb_d[l_ac].inbb009) RETURNING l_success,g_inbb_d[l_ac].inbb009
                        CALL s_aooi390_oofi_upd('6',g_inbb_d[l_ac].inbb009) RETURNING l_success
                     END IF
                     #170324-00052#1-S
                     #批号自动编码更新批号
                     UPDATE inao_t SET inao007 = g_inbb_d[l_ac].inbb009
                      WHERE inaoent = g_enterprise
                        AND inaodocno = g_inba_m.inbadocno
                        AND inaoseq = g_inbb_d[l_ac].inbbseq
                     #170324-00052#1-E
                  END IF
               END IF
               #DISPLAY BY NAME g_inbb_d[l_ac].inbb009  #170526-00058#1 mark
               #160617-00005#1---e--
               #170314-00036#1-S
               #IF cl_get_para(g_enterprise,g_site,'S-BAS-0028') = 'N' THEN #不使用参考单位  #170426-00076#1 mark
                  IF g_inbb_d[l_ac].inbb011 = 0 THEN
                     IF NOT s_transaction_chk('Y',0) THEN
                        CALL s_transaction_begin()
                     END IF
                     NEXT FIELD inbb011
                  END IF
               #END IF   #170426-00076#1 mark
               IF cl_get_para(g_enterprise,g_site,'S-BAS-0028') = 'Y' THEN
                  IF g_inbb_d[l_ac].inbb011 = 0 AND g_inbb_d[l_ac].inbb014 = 0 THEN
                     IF NOT s_transaction_chk('Y',0) THEN
                        CALL s_transaction_begin()
                     END IF
                     NEXT FIELD inbb011
                  END IF
               END IF
               #170314-00036#1-E
               #170215-00048#1 add  --begin--
               #检查仓储批、库存管理特征的合理性
               IF NOT cl_null(g_inbb_d[l_ac].inbb007) THEN
                  IF NOT aint302_inbb007_chk(g_inbb_d[l_ac].inbb007) THEN
                     LET g_inbb_d[l_ac].inbb007 = g_inbb_d_o.inbb007
                     LET g_inbb_d[l_ac].inbb008 = g_inbb_d_o.inbb008
                     LET g_inbb_d[l_ac].inbb009 = g_inbb_d_o.inbb009
                     CALL s_desc_get_stock_desc(g_site,g_inbb_d[l_ac].inbb007) RETURNING g_inbb_d[l_ac].inbb007_desc
                     CALL s_desc_get_locator_desc(g_site,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008) RETURNING g_inbb_d[l_ac].inbb008_desc
                     NEXT FIELD inbb007
                  END IF

                  IF g_inbb_d[l_ac].inbb008 IS NOT NULL THEN
                     IF NOT aint302_inbb008_chk(g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008) THEN
                        LET g_inbb_d[l_ac].inbb007 = g_inbb_d_o.inbb007
                        LET g_inbb_d[l_ac].inbb008 = g_inbb_d_o.inbb008
                        LET g_inbb_d[l_ac].inbb009 = g_inbb_d_o.inbb009
                        CALL s_desc_get_stock_desc(g_site,g_inbb_d[l_ac].inbb007) RETURNING g_inbb_d[l_ac].inbb007_desc
                        CALL s_desc_get_locator_desc(g_site,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008) RETURNING g_inbb_d[l_ac].inbb008_desc
                        #NEXT FIELD inbb008  #170321-00057#1  mark
                        #170321-00057#1-S
                        LET l_inaa007 = ''
                        SELECT inaa007 INTO l_inaa007 FROM inaa_t
                         WHERE inaaent = g_enterprise
                           AND inaasite = g_site
                           AND inaa001 = g_inbb_d[l_ac].inbb007
                        IF NOT s_transaction_chk('Y',0) THEN
                           CALL s_transaction_begin()
                        END IF
                        IF l_inaa007 = '5' THEN
                           NEXT FIELD inbb007
                        ELSE
                           NEXT FIELD inbb008
                        END IF
                        #170321-00057#1-E
                     END IF

                     IF g_inbb_d[l_ac].inbb009 IS NOT NULL THEN
                        IF NOT aint302_inbb009_chk() THEN
                           LET g_inbb_d[l_ac].inbb007 = g_inbb_d_o.inbb007
                           LET g_inbb_d[l_ac].inbb008 = g_inbb_d_o.inbb008
                           LET g_inbb_d[l_ac].inbb009 = g_inbb_d_o.inbb009
                           CALL s_desc_get_stock_desc(g_site,g_inbb_d[l_ac].inbb007) RETURNING g_inbb_d[l_ac].inbb007_desc
                           CALL s_desc_get_locator_desc(g_site,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008) RETURNING g_inbb_d[l_ac].inbb008_desc
                           #NEXT FIELD inbb009  #170321-00057#1 mark
                           #170321-00057#1-S
                           LET l_imaf061 = ''
                           SELECT imaf061 INTO l_imaf061 FROM imaf_t
                            WHERE imafent = g_enterprise
                              AND imafsite = g_site
                              AND imaf001 = g_inbb_d[l_ac].inbb001
                           IF NOT s_transaction_chk('Y',0) THEN
                              CALL s_transaction_begin()
                           END IF
                           IF l_imaf061 = '2' THEN
                              NEXT FIELD inbb007
                           ELSE
                              NEXT FIELD inbb009
                           END IF
                           #170321-00057#1-E
                        END IF
                     END IF
                  END IF

                  IF NOT aint302_inbb003_chk() THEN
                     #170321-00057#1-S
                     IF NOT s_transaction_chk('Y',0) THEN
                        CALL s_transaction_begin()
                     END IF
                     #170321-00057#1-E
                     NEXT FIELD inbb007
                  END IF
               END IF
               #170215-00048#1 add  --end--
               #end add-point

               #寫入修改者/修改日期資訊(單身)


               #將遮罩欄位還原
               CALL aint302_inbb_t_mask_restore('restore_mask_o')

               UPDATE inbb_t SET (inbbdocno,inbbsite,inbbseq,inbb026,inbb001,inbb002,inbb004,inbb007,
                   inbb008,inbb009,inbb010,inbb003,inbb011,inbb012,inbb013,inbb014,inbb015,inbb016,inbb017,
                   inbb018,inbb019,inbb023,inbb024,inbb025,inbb020,inbb204,inbb022,inbb021) = (g_inba_m.inbadocno,
                   g_inbb_d[l_ac].inbbsite,g_inbb_d[l_ac].inbbseq,g_inbb_d[l_ac].inbb026,g_inbb_d[l_ac].inbb001,
                   g_inbb_d[l_ac].inbb002,g_inbb_d[l_ac].inbb004,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008,
                   g_inbb_d[l_ac].inbb009,g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb003,g_inbb_d[l_ac].inbb011,
                   g_inbb_d[l_ac].inbb012,g_inbb_d[l_ac].inbb013,g_inbb_d[l_ac].inbb014,g_inbb_d[l_ac].inbb015,
                   g_inbb_d[l_ac].inbb016,g_inbb_d[l_ac].inbb017,g_inbb_d[l_ac].inbb018,g_inbb_d[l_ac].inbb019,
                   g_inbb_d[l_ac].inbb023,g_inbb_d[l_ac].inbb024,g_inbb_d[l_ac].inbb025,g_inbb_d[l_ac].inbb020,
                   g_inbb_d[l_ac].inbb204,g_inbb_d[l_ac].inbb022,g_inbb_d[l_ac].inbb021)
                WHERE inbbent = g_enterprise AND inbbdocno = g_inba_m.inbadocno

                  AND inbbseq = g_inbb_d_t.inbbseq #項次


               #add-point:單身修改中 name="input.body.m_update"

               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_inbb_d[l_ac].* = g_inbb_d_t.*
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = "inbb_t"
                     LET g_errparam.code = "std-00009"
                     LET g_errparam.popup = TRUE
                     CALL s_transaction_end('N','0')
                     CALL cl_err()

                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_inbb_d[l_ac].* = g_inbb_d_t.*
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = "inbb_t:",SQLERRMESSAGE
                     LET g_errparam.code = SQLCA.SQLCODE
                     LET g_errparam.popup = TRUE
                     CALL s_transaction_end('N','0')
                     CALL cl_err()

                  OTHERWISE
                     #資料多語言用-增/改

                        #161130-00056 add
                                    INITIALIZE gs_keys TO NULL
               LET gs_keys[1] = g_inba_m.inbadocno
               LET gs_keys_bak[1] = g_inbadocno_t
               LET gs_keys[2] = g_inbb_d[g_detail_idx].inbbseq
               LET gs_keys_bak[2] = g_inbb_d_t.inbbseq
               CALL aint302_update_b('inbb_t',gs_keys,gs_keys_bak,"'1'")
               END CASE

               #將遮罩欄位進行遮蔽
               CALL aint302_inbb_t_mask_restore('restore_mask_n')

               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_inbb_d[g_detail_idx].inbbseq = g_inbb_d_t.inbbseq

                  ) THEN
                  LET gs_keys[01] = g_inba_m.inbadocno

                  LET gs_keys[gs_keys.getLength()+1] = g_inbb_d_t.inbbseq

                  CALL aint302_key_update_b(gs_keys,'inbb_t')
               END IF

               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_inba_m),util.JSON.stringify(g_inbb_d_t)
               LET g_log2 = util.JSON.stringify(g_inba_m),util.JSON.stringify(g_inbb_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN
                  CALL s_transaction_end('N','0')
               END IF

               #add-point:單身修改後 name="input.body.a_update"
               IF NOT aint302_upd_inbc() THEN
                  LET g_inbb_d[l_ac].* = g_inbb_d_t.*
                  CALL s_transaction_end('N','0')
               END IF
               #161031-00025#7---s
               CALL s_aooi360_del('7',g_prog,g_inba_m.inbadocno,g_inbb_d_t.inbbseq,'','','','','','','','1') RETURNING l_success
               IF NOT cl_null(g_inbb_d[l_ac].ooff013) THEN
                  CALL s_aooi360_gen('7',g_prog,g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'','','','','','','','1',g_inbb_d[l_ac].ooff013) RETURNING l_success
               END IF
               #161031-00025#7---e
               CALL aint302_b_fill()
               CALL aint302_inbc_fill('')
               CALL aint302_inao_fill2()   #add by lixh 20150909

               #end add-point

            END IF

         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
            #170314-00036#1-S mark
#            #161006-00018#31-S
#            IF cl_get_para(g_enterprise,g_site,'S-BAS-0028') = 'N' THEN #不使用参考单位
#               IF g_inbb_d[l_ac].inbb011 = 0 THEN
#                  NEXT FIELD inbb011
#               END IF
#            END IF
#            IF cl_get_para(g_enterprise,g_site,'S-BAS-0028') = 'Y' THEN
#               IF g_inbb_d[l_ac].inbb011 = 0 AND g_inbb_d[l_ac].inbb014 = 0 THEN
#                  NEXT FIELD inbb011
#               END IF
#            END IF
#            #161006-00018#31-E
            #170314-00036#1-E mark
            #end add-point
            CALL aint302_unlock_b("inbb_t","'1'")
            CALL s_transaction_end('Y','0')
            #其他table進行unlock
            #add-point:單身after_row2 name="input.body.after_row2"

            #end add-point

         AFTER INPUT
            #add-point:input段after input  name="input.body.after_input"
            #170905-00030#1 add(s)
            FOR l_ac = 1 TO g_inbb_d.getLength()
               IF g_inbb_d[l_ac].inbb011 = 0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ain-00019'
                  LET g_errparam.extend = g_inbb_d[l_ac].inbb011
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  CALL s_transaction_end('N','0')
                  NEXT FIELD inbb011
               END IF
            END FOR
            CALL s_transaction_end('Y','0')
            #170905-00030#1 add(e)
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
                  LET g_inbb_d[li_reproduce_target].* = g_inbb_d[li_reproduce].*

                  LET g_inbb_d[li_reproduce_target].inbbseq = NULL

               END IF
               #170920-00028 --- modify end ---
            ELSE
               CALL FGL_SET_ARR_CURR(g_inbb_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_inbb_d.getLength()+1
            END IF
            #(ver:84) ---start---
            #add-point:input段單身複製  name="input.body.controlo"
            #170509-00052#1 add-S
            IF l_insert THEN
               SELECT MAX(inbbseq)+1 INTO g_inbb_d[l_ac].inbbseq FROM inbb_t
                  WHERE inbbent = g_enterprise AND inbbsite = g_site AND inbbdocno = g_inba_m.inbadocno
               IF cl_null(g_inbb_d[l_ac].inbbseq) OR g_inbb_d[l_ac].inbbseq = 0 THEN
                  LET g_inbb_d[l_ac].inbbseq = 1
               END IF
               LET l_rep_flag = TRUE
            END IF
            #170509-00052#1 add-E
            #end add-point
            #(ver:84) --- end ---

         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG

      END INPUT







{</section>}

{<section id="aint302.input.other" >}

      #add-point:自定義input name="input.more_input"
          DISPLAY ARRAY g_inbc_d TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b2) #page2

            BEFORE ROW
               CALL aint302_idx_chk()
               LET l_ac2 = DIALOG.getCurrentRow("s_detail2")
               LET g_detail_idx2 = l_ac2

            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(g_detail_idx2)
               LET l_ac2 = DIALOG.getCurrentRow("s_detail2")
               CALL aint302_idx_chk()
               LET g_current_page = 2

         END DISPLAY

         DISPLAY ARRAY g_inao_d TO s_detail3.* ATTRIBUTES(COUNT=g_rec_b3) #page3

            BEFORE ROW
               CALL aint302_idx_chk()
            #   LET l_ac = DIALOG.getCurrentRow("s_detail3")
            #   LET g_detail_idx = l_ac

            BEFORE DISPLAY
            #   CALL FGL_SET_ARR_CURR(g_detail_idx)
            #   LET l_ac = DIALOG.getCurrentRow("s_detail3")
               LET g_current_page = 3
               CALL aint302_idx_chk()


         END DISPLAY

         DISPLAY ARRAY g_inao_d2 TO s_detail4.* ATTRIBUTES(COUNT=g_rec_b4) #page4

            BEFORE DISPLAY
            #   CALL FGL_SET_ARR_CURR(g_detail_idx)
            #   LET l_ac4 = DIALOG.getCurrentRow("s_detail4")
               #160408-00024#1
               #CALL cl_set_act_visible("s_lot_ins,s_lot_sel,s_lot_sel1",FALSE)
               CALL aint302_inao_fill2()
               #160408-00024#1
               LET g_current_page = 4
               CALL aint302_idx_chk()

            BEFORE ROW
               #160408-00024#1
               LET g_d_idx_display = DIALOG.getCurrentRow("s_detail4")
               DISPLAY g_d_idx_display TO FORMONLY.idx
               LET g_current_page = 4
               #160408-00024#1
               CALL aint302_inao_fill2()    #160411-00009#1
               CALL aint302_idx_chk()
            #   LET l_ac4 = DIALOG.getCurrentRow("s_detail4")
            #   LET g_detail_idx = l_ac4
            #

         END DISPLAY

      SUBDIALOG aoo_aooi360_01.aooi360_01_input   #备注单身  #161031-00025#7
      #end add-point

      BEFORE DIALOG
         #CALL cl_err_collect_init()
         #add-point:input段before dialog name="input.before_dialog"
         IF g_flag THEN
            LET g_flag = FALSE
            NEXT FIELD inbb001
         END IF

         #161031-00025#7---s
         #為了修改功能doubleClick可以直接進入單身, 需指定要進入哪一個單身
         IF NOT cl_null(p_cmd) AND p_cmd != 'a' THEN
            CASE g_aw
               WHEN "s_detail1_aooi360_01"
                  NEXT FIELD ooff012
            END CASE
         END IF
         #161031-00025#7---e
         #end add-point
         #重新導回資料到正確位置上
         CALL DIALOG.setCurrentRow("s_detail1",g_idx_group.getValue("'1',"))

         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            #add-point:input段next_field name="input.next_field"

            #end add-point
            NEXT FIELD inbadocno #170906-00011#1
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD inbbseq #170906-00011#1

               #add-point:input段modify_detail  name="input.modify_detail.other"

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

         #170526-00058#1-s
         IF NOT cl_null(l_ac) AND l_ac > 0 AND g_inbb_d.getLength() > 0 THEN
            IF g_inbb_d[l_ac].inbb011 = 0 THEN
               NEXT FIELD inbb011
            END IF
            #检查仓储批、库存管理特征的合理性
            IF NOT cl_null(g_inbb_d[l_ac].inbb007) THEN
               IF NOT aint302_inbb007_chk(g_inbb_d[l_ac].inbb007) THEN
                  NEXT FIELD inbb007
               END IF
               IF g_inbb_d[l_ac].inbb008 IS NOT NULL THEN
                  IF NOT aint302_inbb008_chk(g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008) THEN
                     LET l_inaa007 = ''
                     SELECT inaa007 INTO l_inaa007 FROM inaa_t
                      WHERE inaaent = g_enterprise AND inaasite = g_site AND inaa001 = g_inbb_d[l_ac].inbb007
                     IF l_inaa007 = '5' THEN
                        NEXT FIELD inbb007
                     ELSE
                        NEXT FIELD inbb008
                     END IF
                  END IF
               END IF
               IF g_inbb_d[l_ac].inbb009 IS NOT NULL THEN
                  IF NOT aint302_inbb009_chk() THEN
                     LET l_imaf061 = ''
                     SELECT imaf061 INTO l_imaf061 FROM imaf_t
                      WHERE imafent = g_enterprise AND imafsite = g_site AND imaf001 = g_inbb_d[l_ac].inbb001
                     IF l_imaf061 = '2' THEN
                        NEXT FIELD inbb007
                     ELSE
                        NEXT FIELD inbb009
                     END IF
                  END IF
               END IF
            END IF
         END IF
         #170526-00058#1-e
#170526-00058#1-e mark
         #170323-00024#1 -s 20170327 add by 08172
         IF g_type = '1' OR g_type = '3' THEN
            LET l_cnt1 = 0
            SELECT COUNT(1) INTO l_cnt1
              FROM inbb_t
             WHERE inbbent = g_enterprise
               AND inbbdocno = g_inba_m.inbadocno
               AND inbb007 IS NOT NULL               #170328-00103#1 add
               AND NOT EXISTS (SELECT 1 FROM inaa_t
                                WHERE inaaent = inbbent
                                  AND inaasite = inbbsite
                                  AND inaa001 = inbb007
                                  AND inaastus = 'Y')
            IF l_cnt1 > 0 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = "ain-00887"
               LET g_errparam.extend = ""
               LET g_errparam.popup = TRUE
               CALL cl_err()
               NEXT FIELD inbb007
            END IF
         END IF
         #170323-00024#1 -e 20170327 add by 08172
         LET g_field = DIALOG.getCurrentItem() #170509-00052#1 add 添加后，在单身空白处复制，确认后，能保存
         #end add-point
         ACCEPT DIALOG

      ON ACTION cancel      #在dialog button (放棄)
         #add-point:input段cancel name="input.cancel"
         #170905-00030#1 add(s)
         FOR l_ac = 1 TO g_inbb_d.getLength()
            IF g_inbb_d[l_ac].inbb011 = 0 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'ain-00019'
               LET g_errparam.extend = g_inbb_d[l_ac].inbb011
               LET g_errparam.popup = TRUE
               CALL cl_err()
               CALL s_transaction_end('N','0')
               NEXT FIELD inbb011
            END IF
         END FOR
         CALL s_transaction_end('Y','0')
         #170905-00030#1 add(e)
         #end add-point
         LET INT_FLAG = TRUE
         LET g_detail_idx  = 1
         LET g_detail_idx2 = 1
         #各個page指標
         LET g_detail_idx_list[1] = 1

         CALL g_curr_diag.setCurrentRow("s_detail1",1)

         EXIT DIALOG

      ON ACTION close       #在dialog 右上角 (X)
         #add-point:input段close name="input.close"
         #170905-00030#1 add(s)
         FOR l_ac = 1 TO g_inbb_d.getLength()
            IF g_inbb_d[l_ac].inbb011 = 0 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'ain-00019'
               LET g_errparam.extend = g_inbb_d[l_ac].inbb011
               LET g_errparam.popup = TRUE
               CALL cl_err()
               CALL s_transaction_end('N','0')
               NEXT FIELD inbb011
            END IF
         END FOR
         CALL s_transaction_end('Y','0')
         #170905-00030#1 add(e)
         #end add-point
         LET INT_FLAG = TRUE
         EXIT DIALOG

      ON ACTION exit        #toolbar 離開
         #add-point:input段exit name="input.exit"
         #170905-00030#1 add(s)
         FOR l_ac = 1 TO g_inbb_d.getLength()
            IF g_inbb_d[l_ac].inbb011 = 0 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'ain-00019'
               LET g_errparam.extend = g_inbb_d[l_ac].inbb011
               LET g_errparam.popup = TRUE
               CALL cl_err()
               CALL s_transaction_end('N','0')
               #LET g_inbb_d[l_ac].inbb011 = g_inbb_d_o.inbb011
               NEXT FIELD inbb011
            END IF
         END FOR
         CALL s_transaction_end('Y','0')
         #170905-00030#1 add(e)
         #end add-point
         LET INT_FLAG = TRUE
         LET g_detail_idx  = 1
         LET g_detail_idx2 = 1
         #各個page指標
         LET g_detail_idx_list[1] = 1

         CALL g_curr_diag.setCurrentRow("s_detail1",1)

         EXIT DIALOG

      #交談指令共用ACTION
      &include "common_action.4gl"
         CONTINUE DIALOG
   END DIALOG

   #add-point:input段after input  name="input.after_input"
   IF g_flag THEN
      CALL aint302_input('u')
   END IF
   #end add-point

END FUNCTION

{</section>}

{<section id="aint302.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION aint302_show()
   #add-point:show段define(客製用) name="show.define_customerization"

   #end add-point
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   DEFINE l_success   LIKE type_t.num5
   DEFINE l_ooba002   LIKE ooba_t.ooba002
   DEFINE l_title     LIKE gzzd_t.gzzd005   #170323-00026#1 add
   #end add-point

   #add-point:Function前置處理 name="show.before"

   #end add-point



   IF g_bfill = "Y" THEN
      CALL aint302_b_fill() #單身填充
      CALL aint302_b_fill2('0') #單身填充
   END IF

   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)




   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL aint302_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"

   #END add-point
   CALL cl_user_overview_set_follow_pic()





   LET l_ac_t = l_ac

   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"
   IF NOT cl_null(g_inba_m.inbadocno) THEN
      CALL s_aooi200_get_slip(g_inba_m.inbadocno) RETURNING l_success,l_ooba002
      CALL s_aooi200_get_slip_desc(l_ooba002) RETURNING g_inba_m.inbadocno_desc
   END IF
   DISPLAY BY NAME g_inba_m.inbadocno_desc

   CALL aint302_inba003_ref(g_inba_m.inba003) RETURNING g_inba_m.inba003_desc
   DISPLAY BY NAME g_inba_m.inba003_desc

   CALL aint302_inba004_ref(g_inba_m.inba004) RETURNING g_inba_m.inba004_desc
   DISPLAY BY NAME g_inba_m.inba004_desc

   CALL aint302_inba007_ref(g_inba_m.inba007) RETURNING g_inba_m.inba007_desc
   DISPLAY BY NAME g_inba_m.inba007_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_inba_m.inbamodid
   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
   LET g_inba_m.inbamodid_desc = g_rtn_fields[1]
   DISPLAY BY NAME g_inba_m.inbamodid_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_inba_m.inbaownid
   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
   LET g_inba_m.inbaownid_desc = g_rtn_fields[1]
   DISPLAY BY NAME g_inba_m.inbaownid_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_inba_m.inbaowndp
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_inba_m.inbaowndp_desc = g_rtn_fields[1]
   DISPLAY BY NAME g_inba_m.inbaowndp_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_inba_m.inbacrtid
   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
   LET g_inba_m.inbacrtid_desc = g_rtn_fields[1]
   DISPLAY BY NAME g_inba_m.inbacrtid_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_inba_m.inbacrtdp
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_inba_m.inbacrtdp_desc = g_rtn_fields[1]
   DISPLAY BY NAME g_inba_m.inbacrtdp_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_inba_m.inbacnfid
   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
   LET g_inba_m.inbacnfid_desc = g_rtn_fields[1]
   DISPLAY BY NAME g_inba_m.inbacnfid_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_inba_m.inbapstid
   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
   LET g_inba_m.inbapstid_desc = g_rtn_fields[1]
   DISPLAY BY NAME g_inba_m.inbapstid_desc


   #170323-00026#1 add s---
   IF g_type = '1' THEN
      CALL cl_set_act_visible("storage_by_qc,aint302_01",FALSE)
      CALL cl_set_act_visible("storage_by_qc_1,aint302_01_1",TRUE)
   END IF
   IF g_type = '2' THEN
      CALL cl_set_act_visible("storage_by_qc,aint302_01",TRUE)
      CALL cl_set_act_visible("storage_by_qc_1,aint302_01_1",FALSE)
   END IF
   #170323-00026#1 add e---
   #end add-point

   #遮罩相關處理
   LET g_inba_m_mask_o.* =  g_inba_m.*
   CALL aint302_inba_t_mask()
   LET g_inba_m_mask_n.* =  g_inba_m.*

   #將資料輸出到畫面上
   DISPLAY BY NAME g_inba_m.inbadocno,g_inba_m.inbadocno_desc,g_inba_m.inbasite,g_inba_m.inbadocdt,g_inba_m.inba002,
       g_inba_m.inba003,g_inba_m.inba003_desc,g_inba_m.inba004,g_inba_m.inba004_desc,g_inba_m.inbastus,
       g_inba_m.inba005,g_inba_m.inba006,g_inba_m.inba007,g_inba_m.inba007_desc,g_inba_m.inba008,g_inba_m.inbaownid,
       g_inba_m.inbaownid_desc,g_inba_m.inbacrtdp,g_inba_m.inbacrtdp_desc,g_inba_m.inbaowndp,g_inba_m.inbaowndp_desc,
       g_inba_m.inbacrtdt,g_inba_m.inbacrtid,g_inba_m.inbacrtid_desc,g_inba_m.inbamodid,g_inba_m.inbamodid_desc,
       g_inba_m.inbacnfdt,g_inba_m.inbamoddt,g_inba_m.inbapstid,g_inba_m.inbapstid_desc,g_inba_m.inbacnfid,
       g_inba_m.inbacnfid_desc,g_inba_m.inbapstdt

   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_inba_m.inbastus
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "S"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
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
         WHEN "Z"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")

      END CASE




   #讀入ref值(單身)
   FOR l_ac = 1 TO g_inbb_d.getLength()
      #add-point:show段單身reference name="show.body.reference"

      #end add-point
   END FOR





   #add-point:show段other name="show.other"

   #end add-point

   LET l_ac = l_ac_t

   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()

   CALL aint302_detail_show()

   #add-point:show段之後 name="show.after"
   CALL aint302_inbc_fill('')
   #CALL aint302_inao_fill1()
   CALL aint302_inao_fill2()
   #end add-point

END FUNCTION

{</section>}

{<section id="aint302.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION aint302_detail_show()
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

{<section id="aint302.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION aint302_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"

   #end add-point
   DEFINE l_newno     LIKE inba_t.inbadocno
   DEFINE l_oldno     LIKE inba_t.inbadocno

   DEFINE l_master    RECORD LIKE inba_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE inbb_t.* #此變數樣板目前無使用


   DEFINE l_cnt       LIKE type_t.num10
   #add-point:reproduce段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
            DEFINE l_ooef004   LIKE ooef_t.ooef004
   #DEFINE l_detai2    RECORD LIKE inbc_t.*  #161124-00048#13   2016/12/29   By 08734 mark
   #161124-00048#13   2016/12/29   By 08734 add(S)
   DEFINE l_detai2 RECORD  #雜項庫存異動庫儲批明細檔
       inbcent LIKE inbc_t.inbcent, #企业编号
       inbcsite LIKE inbc_t.inbcsite, #营运据点
       inbcdocno LIKE inbc_t.inbcdocno, #单据编号
       inbcseq LIKE inbc_t.inbcseq, #项次
       inbcseq1 LIKE inbc_t.inbcseq1, #项序
       inbc001 LIKE inbc_t.inbc001, #料件编号
       inbc002 LIKE inbc_t.inbc002, #产品特征
       inbc003 LIKE inbc_t.inbc003, #库存管理特征
       inbc004 LIKE inbc_t.inbc004, #包装容器编号
       inbc005 LIKE inbc_t.inbc005, #库位
       inbc006 LIKE inbc_t.inbc006, #储位
       inbc007 LIKE inbc_t.inbc007, #批号
       inbc009 LIKE inbc_t.inbc009, #交易单位
       inbc010 LIKE inbc_t.inbc010, #数量
       inbc011 LIKE inbc_t.inbc011, #参考单位
       inbc015 LIKE inbc_t.inbc015, #参考数量
       inbc016 LIKE inbc_t.inbc016, #有效日期
       inbc017 LIKE inbc_t.inbc017, #存货备注
       inbc018 LIKE inbc_t.inbc018, #QC单号
       inbc019 LIKE inbc_t.inbc019, #QC判定项次
       inbc020 LIKE inbc_t.inbc020, #判定结果
       inbc200 LIKE inbc_t.inbc200, #商品条码
       inbc201 LIKE inbc_t.inbc201, #包装单位
       inbc202 LIKE inbc_t.inbc202, #包装数量
       inbcunit LIKE inbc_t.inbcunit, #应用组织
       inbc203 LIKE inbc_t.inbc203, #制造日期
       inbc021 LIKE inbc_t.inbc021, #项目编号
       inbc022 LIKE inbc_t.inbc022, #WBS
       inbc023 LIKE inbc_t.inbc023, #活动编号
       inbc204 LIKE inbc_t.inbc204, #领用/退回单价
       inbc205 LIKE inbc_t.inbc205, #领用/退回金额
       inbc206 LIKE inbc_t.inbc206, #成本单价
       inbc207 LIKE inbc_t.inbc207, #成本金额
       inbc208 LIKE inbc_t.inbc208, #费用编号
       inbc209 LIKE inbc_t.inbc209, #来源单据项次
       inbc210 LIKE inbc_t.inbc210, #来源单据项序
       inbc211 LIKE inbc_t.inbc211, #计价单位
       inbc212 LIKE inbc_t.inbc212 #计价数量
END RECORD
#161124-00048#13   2016/12/29   By 08734 add(E)
   DEFINE l_success   LIKE type_t.num5
   #end add-point

   #add-point:Function前置處理  name="reproduce.pre_function"

   #end add-point

   #切換畫面
   IF g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   END IF

   LET g_master_insert = FALSE

   IF g_inba_m.inbadocno IS NULL

   THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ""
      LET g_errparam.code = "std-00003"
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN
   END IF

   LET g_inbadocno_t = g_inba_m.inbadocno


   LET g_inba_m.inbadocno = ""


   CALL cl_set_head_visible("","YES")

   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)
      #公用欄位新增給值
      LET g_inba_m.inbaownid = g_user
      LET g_inba_m.inbaowndp = g_dept
      LET g_inba_m.inbacrtid = g_user
      LET g_inba_m.inbacrtdp = g_dept
      LET g_inba_m.inbacrtdt = cl_get_current()
      LET g_inba_m.inbamodid = g_user
      LET g_inba_m.inbamoddt = cl_get_current()
      LET g_inba_m.inbastus = 'N'




   CALL s_transaction_begin()

   #add-point:複製輸入前 name="reproduce.head.b_input"
   #170405-00051#1-S add
   #docdt欄位依照設定關閉(FALSE則為設定不同意修正)
   LET g_inba_m.inbadocdt = cl_get_today()
   #IF NOT cl_chk_update_docdt() THEN
      #若關帳日期>今天，擇預設為關帳日期+1
      IF g_docdt >= cl_get_today() THEN
         LET g_inba_m.inbadocdt = g_docdt + 1
      ELSE
         LET g_inba_m.inbadocdt = cl_get_today()
      END IF
   #END IF
   #170405-00051#1-E add
   #end add-point

   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_inba_m.inbastus
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "S"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
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
         WHEN "Z"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")

      END CASE




   #清空key欄位的desc
      LET g_inba_m.inbadocno_desc = ''
   DISPLAY BY NAME g_inba_m.inbadocno_desc


   CALL aint302_input("r")

   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_inba_m.* TO NULL
      INITIALIZE g_inbb_d TO NULL

      #add-point:複製取消後 name="reproduce.cancel"

      #end add-point
      CALL aint302_show()
      CALL aint302_idx_chk()   #(ver:83)
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
   CALL aint302_set_act_visible()
   CALL aint302_set_act_no_visible()

   #將新增的資料併入搜尋條件中
   LET g_inbadocno_t = g_inba_m.inbadocno


   #組合新增資料的條件
   LET g_add_browse = " inbaent = " ||g_enterprise|| " AND",
                      " inbadocno = '", g_inba_m.inbadocno, "' "

   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL aint302_browser_fill("")

   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)

   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   CALL aint302_inao_fill2()     #160411-00009#1
   #end add-point

   CALL aint302_idx_chk()

   LET g_data_owner = g_inba_m.inbaownid
   LET g_data_dept  = g_inba_m.inbaowndp

   #功能已完成,通報訊息中心
   CALL aint302_msgcentre_notify('reproduce')

END FUNCTION

{</section>}

{<section id="aint302.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION aint302_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"

   #end add-point
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE inbb_t.* #此變數樣板目前無使用


   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
   #160310-00010#1 add by lixh 20160310
   DEFINE l_inbcseq1   LIKE inbc_t.inbcseq1
   #DEFINE l_inbb       RECORD LIKE inbb_t.*  #161124-00048#13  16/12/29 By 08734 mark
   #161124-00048#13  16/12/29 By 08734 add(S)
   DEFINE l_inbb RECORD  #雜項庫存異動申請明細檔
       inbbent LIKE inbb_t.inbbent, #企业编号
       inbbsite LIKE inbb_t.inbbsite, #营运据点
       inbbdocno LIKE inbb_t.inbbdocno, #单据编号
       inbbseq LIKE inbb_t.inbbseq, #项次
       inbb001 LIKE inbb_t.inbb001, #料件编号
       inbb002 LIKE inbb_t.inbb002, #产品特征
       inbb003 LIKE inbb_t.inbb003, #库存管理特征
       inbb004 LIKE inbb_t.inbb004, #包装容器编号
       inbb007 LIKE inbb_t.inbb007, #库位
       inbb008 LIKE inbb_t.inbb008, #限定储位
       inbb009 LIKE inbb_t.inbb009, #限定批号
       inbb010 LIKE inbb_t.inbb010, #交易单位
       inbb011 LIKE inbb_t.inbb011, #申请数量
       inbb012 LIKE inbb_t.inbb012, #实际异动数量
       inbb013 LIKE inbb_t.inbb013, #参考单位
       inbb014 LIKE inbb_t.inbb014, #参考单位申请数量
       inbb015 LIKE inbb_t.inbb015, #参考单位实际数量
       inbb016 LIKE inbb_t.inbb016, #理由码
       inbb017 LIKE inbb_t.inbb017, #来源单号
       inbb018 LIKE inbb_t.inbb018, #检验否
       inbb019 LIKE inbb_t.inbb019, #检验合格量
       inbb020 LIKE inbb_t.inbb020, #单据备注
       inbb021 LIKE inbb_t.inbb021, #存货备注
       inbb022 LIKE inbb_t.inbb022, #有效日期
       inbb200 LIKE inbb_t.inbb200, #商品条码
       inbb201 LIKE inbb_t.inbb201, #包装单位
       inbb202 LIKE inbb_t.inbb202, #申请包装数量
       inbb203 LIKE inbb_t.inbb203, #实际包装数量
       inbbunit LIKE inbb_t.inbbunit, #应用组织
       inbb204 LIKE inbb_t.inbb204, #制造日期
       inbb023 LIKE inbb_t.inbb023, #项目编号
       inbb024 LIKE inbb_t.inbb024, #WBS
       inbb025 LIKE inbb_t.inbb025, #活动编号
       inbb205 LIKE inbb_t.inbb205, #领用/退回单价
       inbb206 LIKE inbb_t.inbb206, #领用/退回金额
       inbb207 LIKE inbb_t.inbb207, #成本单价
       inbb208 LIKE inbb_t.inbb208, #成本金额
       inbb209 LIKE inbb_t.inbb209, #费用编号
       inbb210 LIKE inbb_t.inbb210, #进价
       inbb211 LIKE inbb_t.inbb211, #来源单据项次
       inbb212 LIKE inbb_t.inbb212, #来源单据项序
       inbb213 LIKE inbb_t.inbb213, #转入商品条码
       inbb214 LIKE inbb_t.inbb214, #转入商品编号
       inbb215 LIKE inbb_t.inbb215, #转入产品特征
       inbb216 LIKE inbb_t.inbb216, #转入单位
       inbb217 LIKE inbb_t.inbb217, #转入数量
       inbb218 LIKE inbb_t.inbb218, #转入包装单位
       inbb219 LIKE inbb_t.inbb219, #转入包装数量
       inbb220 LIKE inbb_t.inbb220, #转入库位
       inbb221 LIKE inbb_t.inbb221, #转入储位
       inbb222 LIKE inbb_t.inbb222, #转入批号
       inbb223 LIKE inbb_t.inbb223, #转入进价
       inbb224 LIKE inbb_t.inbb224, #计价单位
       inbb225 LIKE inbb_t.inbb225 #计价数量
END RECORD
#161124-00048#13  16/12/29 By 08734 add(E)
   DEFINE l_inbc016    LIKE inbc_t.inbc016
   DEFINE l_imaf032    LIKE imaf_t.imaf032
   DEFINE l_sql        STRING
   #160310-00010#1 add by lixh 20160310
   #end add-point

   #add-point:Function前置處理  name="detail_reproduce.pre_function"

   #end add-point

   CALL s_transaction_begin()

   LET ld_date = cl_get_current()

   DROP TABLE aint302_detail

   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"

   #end add-point

   #CREATE TEMP TABLE
   SELECT * FROM inbb_t
    WHERE inbbent = g_enterprise AND inbbdocno = g_inbadocno_t

    INTO TEMP aint302_detail

   #將key修正為調整後
   UPDATE aint302_detail
      #更新key欄位
      SET inbbdocno = g_inba_m.inbadocno

      #更新共用欄位


   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   #160224-00015#1 add by lixh 20160310
   UPDATE aint302_detail
      #更新检验合格量欄位
      SET inbb012 = inbb011,
          inbb019 = inbb011,
          inbb009 = ''   #160617-00005#1
   #160224-00015#1 add by lixh 20160310
   #end add-point

   #將資料塞回原table
   INSERT INTO inbb_t SELECT * FROM aint302_detail

   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "reproduce:",SQLERRMESSAGE
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN
   END IF

   #add-point:單身複製中1 name="detail_reproduce.body.table1.m_insert"
   #170728-00002#2 Add By Ken 170823(S)
   DROP TABLE aint302_detail

   #复制备注页签的资料
   SELECT * FROM ooff_t
    WHERE ooffent = g_enterprise AND ooff002 = g_prog AND ooff003 = g_inbadocno_t

    INTO TEMP aint302_detail

   #將key修正為調整後
   UPDATE aint302_detail
      #更新key欄位
      SET ooff003 = g_inba_m.inbadocno

   #將資料塞回原table
   INSERT INTO ooff_t SELECT * FROM aint302_detail

   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "reproduce:",SQLERRMESSAGE
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN
   END IF
   #170728-00002#2 Add By Ken 170823(E)
   #end add-point

   #刪除TEMP TABLE
   DROP TABLE aint302_detail

   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
#   LET ls_sql = "CREATE GLOBAL TEMPORARY TABLE aint302_detail AS ",
#                "SELECT * FROM inbc_t "
#   PREPARE repro_tb2 FROM ls_sql
#   EXECUTE repro_tb2
#   FREE repro_tb2
#
#   #將符合條件的資料丟入TEMP TABLE
#   INSERT INTO aint302_detail SELECT * FROM inbc_t
#                                         WHERE inbcent = g_enterprise AND inbcdocno = g_inbadocno_t
#
#
#   #將key修正為調整後
#   UPDATE aint302_detail
#      #更新key欄位
#      SET inbcdocno = g_inba_m.inbadocno
#
#   INSERT INTO inbc_t SELECT * FROM aint302_detail
#
#   IF SQLCA.sqlcode THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = SQLCA.sqlcode
#      LET g_errparam.extend = "reproduce"
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#
#      RETURN
#   END IF
#
#   DROP TABLE aint302_detail

#160310-00010#1 add by lixh 20160310
   INITIALIZE l_inbb.* TO NULL
   #LET l_sql = " SELECT * FROM inbb_t WHERE inbbent = '",g_enterprise,"'",  #161124-00048#13  16/12/29 By 08734 mark
   LET l_sql = " SELECT inbbent,inbbsite,inbbdocno,inbbseq,inbb001,inbb002,inbb003,inbb004,inbb007,inbb008,inbb009,",
               " inbb010,inbb011,inbb012,inbb013,inbb014,inbb015,inbb016,inbb017,inbb018,inbb019,inbb020,",
               " inbb021,inbb022,inbb200,inbb201,inbb202,inbb203,inbbunit,inbb204,inbb023,inbb024,inbb025,",
               " inbb205,inbb206,inbb207,inbb208,inbb209,inbb210,inbb211,inbb212,inbb213,inbb214,inbb215,",
               " inbb216,inbb217,inbb218,inbb219,inbb220,inbb221,inbb222,inbb223,inbb224,inbb225 FROM inbb_t WHERE inbbent = '",g_enterprise,"'",  #161124-00048#13  16/12/29 By 08734 add
               "    AND inbbdocno = '",g_inba_m.inbadocno,"'"
   PREPARE aint302_repro_pre FROM l_sql
   DECLARE aint302_repro_cs CURSOR FOR aint302_repro_pre
   FOREACH aint302_repro_cs INTO l_inbb.*
      IF l_inbb.inbb018 = 'N' THEN  #不走检验

         LET l_inbc016 = g_today
         LET l_imaf032 = NULL
         LET l_inbcseq1 = 0
         #如果料件有做批號控管時，則[C:有效日期]=g_today+[T:料件集團檔].[C:有效天數]
         SELECT imaf032 INTO l_imaf032
           FROM imaf_t
          WHERE imafent = g_enterprise
            AND imafsite = 'ALL'
            AND imaf001 = l_inbb.inbb001
         IF NOT cl_null(l_imaf032) THEN
            LET l_inbc016 = l_inbc016 + l_imaf032
         END IF

         IF cl_null(l_inbcseq1) THEN
            SELECT MAX(inbcseq1) INTO l_inbcseq1
              FROM inbc_t
             WHERE inbcent   = g_enterprise
               AND inbcsite  = g_site
               AND inbcdocno = g_inba_m.inbadocno
               AND inbcseq   = l_inbb.inbbseq
         END IF
         IF cl_null(l_inbcseq1) THEN
            LET l_inbcseq1 = 1
         ELSE
            LET l_inbcseq1 = l_inbcseq1 + 1
         END IF
         #160512-00004#2-add-'inbc203','l_inbb.inbb204'
         INSERT INTO inbc_t
                    (inbcent,inbcsite,inbcdocno,inbcseq,inbcseq1,
                     inbc001,inbc002,inbc003,inbc004,inbc005,
                     inbc006,inbc007,inbc009,inbc010,inbc011,
                     inbc015,inbc203,inbc016,inbc017,inbc021,inbc022,inbc023)
              VALUES(l_inbb.inbbent,l_inbb.inbbsite,l_inbb.inbbdocno,l_inbb.inbbseq,l_inbcseq1,
                     l_inbb.inbb001,l_inbb.inbb002,l_inbb.inbb003,l_inbb.inbb004,l_inbb.inbb007,
                     l_inbb.inbb008,l_inbb.inbb009,l_inbb.inbb010,l_inbb.inbb011,l_inbb.inbb013,
                     l_inbb.inbb015,l_inbb.inbb204,l_inbb.inbb022,l_inbb.inbb021,l_inbb.inbb023,l_inbb.inbb024,l_inbb.inbb025)
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "inbc_t"
            LET g_errparam.popup = FALSE
            CALL cl_err()
            RETURN
         END IF
      ELSE
         UPDATE inbb_t SET inbb019 = 0
          WHERE inbbent = g_enterprise
            AND inbbdocno = g_inba_m.inbadocno
            AND inbbseq = l_inbb.inbbseq
      END IF
   END FOREACH
#160310-00010#1 add by lixh 20160310
   #end add-point





   #多語言複製段落


   CALL s_transaction_end('Y','0')

   #已新增完, 調整資料內容(修改時使用)
   LET g_inbadocno_t = g_inba_m.inbadocno


END FUNCTION

{</section>}

{<section id="aint302.delete" >}
#+ 資料刪除
PRIVATE FUNCTION aint302_delete()
   #add-point:delete段define(客製用) name="delete.define_customerization"

   #end add-point
   DEFINE  l_var_keys      DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys    DYNAMIC ARRAY OF STRING
   DEFINE  l_vars          DYNAMIC ARRAY OF STRING
   DEFINE  l_fields        DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak  DYNAMIC ARRAY OF STRING
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete.define"
   DEFINE l_ooff012        LIKE ooff_t.ooff012  #161031-00025#7
   #end add-point

   #add-point:Function前置處理  name="delete.pre_function"

   #end add-point

   IF g_inba_m.inbadocno IS NULL

   THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ""
      LET g_errparam.code = "std-00003"
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN
   END IF



   CALL s_transaction_begin()

   OPEN aint302_cl USING g_enterprise,g_inba_m.inbadocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "OPEN aint302_cl:",SQLERRMESSAGE
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE
      CLOSE aint302_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF

   #顯示最新的資料
   EXECUTE aint302_master_referesh USING g_inba_m.inbadocno INTO g_inba_m.inbadocno,g_inba_m.inbasite,
       g_inba_m.inbadocdt,g_inba_m.inba002,g_inba_m.inba003,g_inba_m.inba004,g_inba_m.inbastus,g_inba_m.inba005,
       g_inba_m.inba006,g_inba_m.inba007,g_inba_m.inba008,g_inba_m.inbaownid,g_inba_m.inbacrtdp,g_inba_m.inbaowndp,
       g_inba_m.inbacrtdt,g_inba_m.inbacrtid,g_inba_m.inbamodid,g_inba_m.inbacnfdt,g_inba_m.inbamoddt,
       g_inba_m.inbapstid,g_inba_m.inbacnfid,g_inba_m.inbapstdt,g_inba_m.inba003_desc,g_inba_m.inba004_desc,
       g_inba_m.inbaownid_desc,g_inba_m.inbacrtdp_desc,g_inba_m.inbaowndp_desc,g_inba_m.inbacrtid_desc,
       g_inba_m.inbamodid_desc,g_inba_m.inbapstid_desc,g_inba_m.inbacnfid_desc


   #檢查是否允許此動作
   IF NOT aint302_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF

   #遮罩相關處理
   LET g_inba_m_mask_o.* =  g_inba_m.*
   CALL aint302_inba_t_mask()
   LET g_inba_m_mask_n.* =  g_inba_m.*

   CALL aint302_show()

   #add-point:delete段before ask name="delete.before_ask"
   #add by lixh 20150526
   IF g_inba_m.inba005 = '10' AND NOT cl_null(g_inba_m.inba006) THEN
      CLOSE aint302_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   #add by lixh 20150526
   #end add-point

   IF cl_ask_del_master() THEN              #確認一下

      #add-point:單頭刪除前 name="delete.head.b_delete"

      #end add-point

      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL aint302_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"

      #end add-point
      CALL cl_doc_remove()





      #資料備份
      LET g_inbadocno_t = g_inba_m.inbadocno


      DELETE FROM inba_t
       WHERE inbaent = g_enterprise AND inbadocno = g_inba_m.inbadocno


      #add-point:單頭刪除中 name="delete.head.m_delete"

      #end add-point

      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = g_inba_m.inbadocno,":",SQLERRMESSAGE
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = FALSE
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF

      #add-point:單頭刪除後 name="delete.head.a_delete"
      IF NOT s_aooi200_del_docno(g_inba_m.inbadocno,g_inba_m.inbadocdt) THEN
         CALL s_transaction_end('N','0')
         RETURN
      END IF
      #end add-point

      #add-point:單身刪除前 name="delete.body.b_delete"

      #end add-point

      DELETE FROM inbb_t
       WHERE inbbent = g_enterprise AND inbbdocno = g_inba_m.inbadocno


      #add-point:單身刪除中 name="delete.body.m_delete"

      #end add-point

      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "inbb_t:",SQLERRMESSAGE
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = FALSE
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF

      #add-point:單身刪除後 name="delete.body.a_delete"
      #同步刪除對應的[T:雜項庫存異動庫儲批明細檔]與[T:製造批序號庫存異動明細檔]
      DELETE FROM inbc_t
         WHERE inbcent = g_enterprise AND inbcsite = g_site AND inbcdocno = g_inba_m.inbadocno
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "inbc_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()

         CALL s_transaction_end('N','0')
         RETURN
      END IF
      DELETE FROM inao_t
         WHERE inaoent = g_enterprise AND inaosite = g_site AND inaodocno = g_inba_m.inbadocno
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "inao_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()

         CALL s_transaction_end('N','0')
         RETURN
      END IF

      IF g_inba_m.inba005 = '8' THEN
         UPDATE sfja_t SET sfja004 = NULL
          WHERE sfjaent = g_enterprise
            AND sfjadocno = g_inba_m.inba006
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "upd sfja004"
            LET g_errparam.popup = FALSE
            CALL cl_err()

            CALL s_transaction_end('N','0')
            RETURN
         END IF
      END IF
      #161031-00025#7---s
      #单头的aooi360_01的备注单身资料同步删除
      DECLARE ooff_cs CURSOR FOR
         SELECT ooff012 INTO l_ooff012 FROM ooff_t WHERE ooffent = g_enterprise AND ooff001 = '6' AND ooff002 = g_inba_m.inbadocno AND ooff003 = 0
      FOREACH ooff_cs INTO l_ooff012
         IF NOT s_aooi360_del('6',g_prog,g_inba_m.inbadocno,'','','','','','','','',l_ooff012) THEN
            CALL s_transaction_end('N','0')
            RETURN
         END IF
      END FOREACH
      CALL aooi360_01_clear_detail()   #清除备注单身

      #单身的长备注栏位也要同步删除
      IF NOT s_aooi360_del('7',g_prog,g_inba_m.inbadocno,'','','','','','','','','1') THEN
         CALL s_transaction_end('N','0')
         RETURN
      END IF
      #161031-00025#7---e
      #end add-point







      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_inba_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE aint302_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF

      CLEAR FORM
      CALL g_inbb_d.clear()


      CALL aint302_ui_browser_refresh()
      #CALL aint302_ui_headershow()
      #CALL aint302_ui_detailshow()

      #add-point:多語言刪除 name="delete.lang.before_delete"
      #add by lixh 20150909
      CALL g_inbc_d.clear()
      CALL g_inao_d.clear()
      CALL g_inao_d2.clear()
      #add by lixh 20150909
      #end add-point

      #單頭多語言刪除

         #161130-00056 add

      #單身多語言刪除

         #161130-00056 add


      #add-point:多語言刪除 name="delete.lang.delete"

      #end add-point

      IF g_browser_cnt > 0 THEN
         #CALL aint302_browser_fill("")
         CALL aint302_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF

      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF

   CLOSE aint302_cl

   #功能已完成,通報訊息中心
   CALL aint302_msgcentre_notify('delete')

END FUNCTION

{</section>}

{<section id="aint302.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION aint302_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"

   #end add-point
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   DEFINE l_success   LIKE type_t.num5
   #end add-point

   #add-point:Function前置處理  name="b_fill.pre_function"

   #end add-point

   #清空第一階單身
   CALL g_inbb_d.clear()


   #add-point:b_fill段sql_before name="b_fill.sql_before"
   CALL g_inao_d.clear()       #160411-00009#1
   #end add-point

   #判斷是否填充
   IF aint302_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      #若有觸發條件(g_wc2)異動的任何行為都需添加在下方條件中,避免條件無正常刷新 ver:81
      IF (g_action_choice = "query" OR cl_null(g_action_choice) OR g_action_choice = "queryplan" OR
          g_action_choice = "insert" OR g_action_choice = "modify" OR g_action_choice = "reproduce" ) #ver:81 #ver:82
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"

      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT inbbsite,inbbseq,inbb026,inbb001,inbb002,inbb004,inbb007,inbb008,
             inbb009,inbb010,inbb003,inbb011,inbb012,inbb013,inbb014,inbb015,inbb016,inbb017,inbb018,
             inbb019,inbb023,inbb024,inbb025,inbb020,inbb204,inbb022,inbb021 ,t1.imaal003 ,t2.inaml004 ,
             t3.imaal003 ,t4.inayl003 ,t5.inab003 ,t6.oocal003 ,t7.oocal003 ,t8.pjbal003 ,t9.pjbbl004 ,
             t10.pjbml004 FROM inbb_t",
                     " INNER JOIN inba_t ON inbaent = " ||g_enterprise|| " AND inbadocno = inbbdocno ",

                     #"",

                     "",
                     #下層單身所需的join條件

                                    " LEFT JOIN imaal_t t1 ON t1.imaalent="||g_enterprise||" AND t1.imaal001=inbb001 AND t1.imaal002='"||g_dlang||"' ",
               " LEFT JOIN inaml_t t2 ON t2.inamlent="||g_enterprise||" AND t2.inaml001=inbb001 AND t2.inaml002=inbb002 AND t2.inaml003='"||g_dlang||"' ",
               " LEFT JOIN imaal_t t3 ON t3.imaalent="||g_enterprise||" AND t3.imaal001=inbb004 AND t3.imaal002='"||g_dlang||"' ",
               " LEFT JOIN inayl_t t4 ON t4.inaylent="||g_enterprise||" AND t4.inayl001=inbb007 AND t4.inayl002='"||g_dlang||"' ",
               " LEFT JOIN inab_t t5 ON t5.inabent="||g_enterprise||" AND t5.inabsite=inbbsite AND t5.inab001=inbb007 AND t5.inab002=inbb008  ",
               " LEFT JOIN oocal_t t6 ON t6.oocalent="||g_enterprise||" AND t6.oocal001=inbb010 AND t6.oocal002='"||g_dlang||"' ",
               " LEFT JOIN oocal_t t7 ON t7.oocalent="||g_enterprise||" AND t7.oocal001=inbb013 AND t7.oocal002='"||g_dlang||"' ",
               " LEFT JOIN pjbal_t t8 ON t8.pjbalent="||g_enterprise||" AND t8.pjbal001=inbb023 AND t8.pjbal002='"||g_dlang||"' ",
               " LEFT JOIN pjbbl_t t9 ON t9.pjbblent="||g_enterprise||" AND t9.pjbbl001=inbb023 AND t9.pjbbl002=inbb024 AND t9.pjbbl003='"||g_dlang||"' ",
               " LEFT JOIN pjbml_t t10 ON t10.pjbmlent="||g_enterprise||" AND t10.pjbml001=inbb023 AND t10.pjbml002=inbb025 AND t10.pjbml003='"||g_dlang||"' ",

                     " WHERE inbbent=? AND inbbdocno=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
         #170728-00002#2 Add By Ken 170823(S)
         LET g_sql = "SELECT  DISTINCT inbbsite,inbbseq,inbb026,inbb001,inbb002,inbb004,inbb007,inbb008,
             inbb009,inbb010,inbb003,inbb011,inbb012,inbb013,inbb014,inbb015,inbb016,inbb017,inbb018,
             inbb019,inbb023,inbb024,inbb025,inbb020,inbb204,inbb022,inbb021 ,t1.imaal003 ,t2.inaml004 ,
             t3.imaal003 ,t4.inayl003 ,t5.inab003 ,t6.oocal003 ,t7.oocal003 ,t8.pjbal003 ,t9.pjbbl004 ,
             t10.pjbml004 FROM inbb_t",
                     " INNER JOIN inba_t ON inbaent = " ||g_enterprise|| " AND inbadocno = inbbdocno ",

                     #"",

                     "",
                     #下層單身所需的join條件

                                    " LEFT JOIN imaal_t t1 ON t1.imaalent="||g_enterprise||" AND t1.imaal001=inbb001 AND t1.imaal002='"||g_dlang||"' ",
               " LEFT JOIN inaml_t t2 ON t2.inamlent="||g_enterprise||" AND t2.inaml001=inbb001 AND t2.inaml002=inbb002 AND t2.inaml003='"||g_dlang||"' ",
               " LEFT JOIN imaal_t t3 ON t3.imaalent="||g_enterprise||" AND t3.imaal001=inbb004 AND t3.imaal002='"||g_dlang||"' ",
               " LEFT JOIN inayl_t t4 ON t4.inaylent="||g_enterprise||" AND t4.inayl001=inbb007 AND t4.inayl002='"||g_dlang||"' ",
               " LEFT JOIN inab_t t5 ON t5.inabent="||g_enterprise||" AND t5.inabsite=inbbsite AND t5.inab001=inbb007 AND t5.inab002=inbb008  ",
               " LEFT JOIN oocal_t t6 ON t6.oocalent="||g_enterprise||" AND t6.oocal001=inbb010 AND t6.oocal002='"||g_dlang||"' ",
               " LEFT JOIN oocal_t t7 ON t7.oocalent="||g_enterprise||" AND t7.oocal001=inbb013 AND t7.oocal002='"||g_dlang||"' ",
               " LEFT JOIN pjbal_t t8 ON t8.pjbalent="||g_enterprise||" AND t8.pjbal001=inbb023 AND t8.pjbal002='"||g_dlang||"' ",
               " LEFT JOIN pjbbl_t t9 ON t9.pjbblent="||g_enterprise||" AND t9.pjbbl001=inbb023 AND t9.pjbbl002=inbb024 AND t9.pjbbl003='"||g_dlang||"' ",
               " LEFT JOIN pjbml_t t10 ON t10.pjbmlent="||g_enterprise||" AND t10.pjbml001=inbb023 AND t10.pjbml002=inbb025 AND t10.pjbml003='"||g_dlang||"' ",
               " LEFT JOIN ooff_t  ON ooffent="||g_enterprise||" AND ooff002 = '",g_prog,"' AND ooff003 = inbbdocno AND ooff004 = to_char(inbbseq)  ",
                     " WHERE inbbent=? AND inbbdocno=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #170728-00002#2 Add By Ken 170823(E)
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF

         #子單身的WC


         LET g_sql = g_sql, " ORDER BY inbb_t.inbbseq"

         #add-point:單身填充控制 name="b_fill.sql"

         #end add-point

         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE aint302_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR aint302_pb
      END IF

      LET g_cnt = l_ac
      LET l_ac = 1

   #  OPEN b_fill_cs USING g_enterprise,g_inba_m.inbadocno   #(ver:78)

      FOREACH b_fill_cs USING g_enterprise,g_inba_m.inbadocno INTO g_inbb_d[l_ac].inbbsite,g_inbb_d[l_ac].inbbseq,
          g_inbb_d[l_ac].inbb026,g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002,g_inbb_d[l_ac].inbb004,
          g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008,g_inbb_d[l_ac].inbb009,g_inbb_d[l_ac].inbb010,
          g_inbb_d[l_ac].inbb003,g_inbb_d[l_ac].inbb011,g_inbb_d[l_ac].inbb012,g_inbb_d[l_ac].inbb013,
          g_inbb_d[l_ac].inbb014,g_inbb_d[l_ac].inbb015,g_inbb_d[l_ac].inbb016,g_inbb_d[l_ac].inbb017,
          g_inbb_d[l_ac].inbb018,g_inbb_d[l_ac].inbb019,g_inbb_d[l_ac].inbb023,g_inbb_d[l_ac].inbb024,
          g_inbb_d[l_ac].inbb025,g_inbb_d[l_ac].inbb020,g_inbb_d[l_ac].inbb204,g_inbb_d[l_ac].inbb022,
          g_inbb_d[l_ac].inbb021,g_inbb_d[l_ac].inbb001_desc,g_inbb_d[l_ac].inbb002_desc,g_inbb_d[l_ac].inbb004_desc,
          g_inbb_d[l_ac].inbb007_desc,g_inbb_d[l_ac].inbb008_desc,g_inbb_d[l_ac].inbb010_desc,g_inbb_d[l_ac].inbb013_desc,
          g_inbb_d[l_ac].inbb023_desc,g_inbb_d[l_ac].inbb024_desc,g_inbb_d[l_ac].inbb025_desc   #(ver:78)

         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE
            LET g_errparam.code = SQLCA.SQLCODE
            LET g_errparam.popup = TRUE
            CALL cl_err()
            EXIT FOREACH
         END IF

         #add-point:b_fill段資料填充 name="b_fill.fill"
         CALL aint302_inbb001_desc(g_inbb_d[l_ac].inbb001) RETURNING g_inbb_d[l_ac].inbb001_desc,g_inbb_d[l_ac].imaal004

#         INITIALIZE g_ref_fields TO NULL
#         LET g_ref_fields[1] = g_inbb_d[l_ac].inbb004
#         CALL ap_ref_array2(g_ref_fields,"SELECT imaal003 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
#         LET g_inbb_d[l_ac].inbb004_desc =  g_rtn_fields[1]

         #CALL s_feature_description(g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002) RETURNING l_success,g_inbb_d[l_ac].inbb002_desc  #161223-00013#1 mark

#         CALL s_desc_get_stock_desc(g_site,g_inbb_d[l_ac].inbb007) RETURNING g_inbb_d[l_ac].inbb007_desc

         #CALL s_desc_get_locator_desc(g_site,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008) RETURNING g_inbb_d[l_ac].inbb008_desc #160413-00011#2 mark

#         CALL aint302_inbb010_ref(g_inbb_d[l_ac].inbb010) RETURNING g_inbb_d[l_ac].inbb010_desc

#         CALL aint302_inbb010_ref(g_inbb_d[l_ac].inbb013) RETURNING g_inbb_d[l_ac].inbb013_desc

         CALL aint302_inba007_ref(g_inbb_d[l_ac].inbb016) RETURNING g_inbb_d[l_ac].inbb016_desc

         #160413-00011#2---mark--begin---
         #CALL s_desc_get_project_desc(g_inbb_d[l_ac].inbb023) RETURNING g_inbb_d[l_ac].inbb023_desc
         #
         #CALL s_desc_get_wbs_desc(g_inbb_d[l_ac].inbb023,g_inbb_d[l_ac].inbb024) RETURNING g_inbb_d[l_ac].inbb024_desc
         #
         #CALL s_desc_get_activity_desc(g_inbb_d[l_ac].inbb023,g_inbb_d[l_ac].inbb025) RETURNING g_inbb_d[l_ac].inbb025_desc
         #160413-00011#2---mark--end---

         #160411-00009#1    mark
#         #add by lixh 20150826
#         IF g_argv[1] = '1' THEN
#            CALL s_lot_b_fill('2',g_site,'1',g_inba_m.inbadocno,'','','-1')
#         ELSE
#            CALL s_lot_b_fill('2',g_site,'1',g_inba_m.inbadocno,'','','1')
#         END IF
#         #add by lixh 20150826
        #160411-00009#1     mark
         #161031-00025#7---s
         CALL s_aooi360_sel('7',g_prog,g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,'','','','','','','','1') RETURNING l_success,g_inbb_d[l_ac].ooff013
         #161031-00025#7---s
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



   #add-point:browser_fill段其他table處理 name="browser_fill.other_fill"
   #160411-00009#1
   IF g_inbb_d.getLength() > 1 THEN  #160420-00009#1
      #IF g_argv[1] = '1' THEN                     #161109-00032#1 mark
      IF g_argv[1] = '1' OR g_argv[1] = '3' THEN   #161109-00032#1
         CALL s_lot_b_fill('2',g_site,'1',g_inba_m.inbadocno,'','','-1')
      ELSE
         CALL s_lot_b_fill('2',g_site,'1',g_inba_m.inbadocno,'','','1')
      END IF
   END IF  #160420-00009#1
   #160411-00009#1
   #161031-00025#7---s
   LET g_ooff001_d = '6'   #6.單據單頭備註
   LET g_ooff002_d = g_prog
   LET g_ooff003_d = g_inba_m.inbadocno   #单号
   LET g_ooff004_d = 0     #项次
   LET g_ooff005_d = ' '
   LET g_ooff006_d = ' '
   LET g_ooff007_d = ' '
   LET g_ooff008_d = ' '
   LET g_ooff009_d = ' '
   LET g_ooff010_d = ' '
   LET g_ooff011_d = ' '
   CALL aooi360_01_b_fill(g_ooff001_d,g_ooff002_d,g_ooff003_d,g_ooff004_d,g_ooff005_d,g_ooff006_d,g_ooff007_d,g_ooff008_d,g_ooff009_d,g_ooff010_d,g_ooff011_d)   #备注单身
   #161031-00025#7---e
   #end add-point

   CALL g_inbb_d.deleteElement(g_inbb_d.getLength())



   LET l_ac = g_cnt
   LET g_cnt = 0

   FREE aint302_pb


   LET li_idx = l_ac

   #遮罩相關處理
   FOR l_ac = 1 TO g_inbb_d.getLength()
      LET g_inbb_d_mask_o[l_ac].* =  g_inbb_d[l_ac].*
      CALL aint302_inbb_t_mask()
      LET g_inbb_d_mask_n[l_ac].* =  g_inbb_d[l_ac].*
   END FOR



   LET l_ac = li_idx

   CALL cl_ap_performance_next_end()

END FUNCTION

{</section>}

{<section id="aint302.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION aint302_delete_b(ps_table,ps_keys_bak,ps_page)
   #add-point:delete_b段define(客製用) name="delete_b.define_customerization"

   #end add-point
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys_bak DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   DEFINE li_idx      LIKE type_t.num10
   #add-point:delete_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete_b.define"

   #end add-point

   #add-point:Function前置處理  name="delete_b.pre_function"

   #end add-point

   LET g_update = TRUE

   #判斷是否是同一群組的table
   LET ls_group = "'1',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前 name="delete_b.b_delete"

      #end add-point
      DELETE FROM inbb_t
       WHERE inbbent = g_enterprise AND
         inbbdocno = ps_keys_bak[1] AND inbbseq = ps_keys_bak[2]
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
         CALL g_inbb_d.deleteElement(li_idx)
      END IF

   END IF





   #add-point:delete_b段other name="delete_b.other"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN

      DELETE FROM inbc_t
       WHERE inbcent = g_enterprise AND
         inbcdocno = ps_keys_bak[1] AND inbcseq = ps_keys_bak[2]

      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = ""
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = FALSE
         CALL cl_err()
      END IF

      LET li_idx = g_detail_idx
      CALL g_inbc_d.deleteElement(li_idx)

   END IF
   #end add-point

   RETURN TRUE

END FUNCTION

{</section>}

{<section id="aint302.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION aint302_insert_b(ps_table,ps_keys,ps_page)
   #add-point:insert_b段define(客製用) name="insert_b.define_customerization"

   #end add-point
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys     DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   DEFINE ls_page     STRING
   DEFINE li_idx      LIKE type_t.num10
   #add-point:insert_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert_b.define"

   #end add-point

   #add-point:Function前置處理  name="insert_b.pre_function"

   #end add-point

   LET g_update = TRUE

   #判斷是否是同一群組的table
   LET ls_group = "'1',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前 name="insert_b.before_insert"

      #end add-point
      INSERT INTO inbb_t
                  (inbbent,
                   inbbdocno,
                   inbbseq
                   ,inbbsite,inbb026,inbb001,inbb002,inbb004,inbb007,inbb008,inbb009,inbb010,inbb003,inbb011,inbb012,inbb013,inbb014,inbb015,inbb016,inbb017,inbb018,inbb019,inbb023,inbb024,inbb025,inbb020,inbb204,inbb022,inbb021)
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_inbb_d[g_detail_idx].inbbsite,g_inbb_d[g_detail_idx].inbb026,g_inbb_d[g_detail_idx].inbb001,
                       g_inbb_d[g_detail_idx].inbb002,g_inbb_d[g_detail_idx].inbb004,g_inbb_d[g_detail_idx].inbb007,
                       g_inbb_d[g_detail_idx].inbb008,g_inbb_d[g_detail_idx].inbb009,g_inbb_d[g_detail_idx].inbb010,
                       g_inbb_d[g_detail_idx].inbb003,g_inbb_d[g_detail_idx].inbb011,g_inbb_d[g_detail_idx].inbb012,
                       g_inbb_d[g_detail_idx].inbb013,g_inbb_d[g_detail_idx].inbb014,g_inbb_d[g_detail_idx].inbb015,
                       g_inbb_d[g_detail_idx].inbb016,g_inbb_d[g_detail_idx].inbb017,g_inbb_d[g_detail_idx].inbb018,
                       g_inbb_d[g_detail_idx].inbb019,g_inbb_d[g_detail_idx].inbb023,g_inbb_d[g_detail_idx].inbb024,
                       g_inbb_d[g_detail_idx].inbb025,g_inbb_d[g_detail_idx].inbb020,g_inbb_d[g_detail_idx].inbb204,
                       g_inbb_d[g_detail_idx].inbb022,g_inbb_d[g_detail_idx].inbb021)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"

      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "inbb_t:",SQLERRMESSAGE
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = FALSE
         CALL cl_err()
      END IF

      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN
         CALL g_inbb_d.insertElement(li_idx)
      END IF

      #add-point:insert_b段資料新增後 name="insert_b.after_insert"

      #end add-point
   END IF





   #add-point:insert_b段other name="insert_b.other"

   #end add-point

END FUNCTION

{</section>}

{<section id="aint302.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION aint302_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
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
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "inbb_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"

      #end add-point

      #將遮罩欄位還原
      CALL aint302_inbb_t_mask_restore('restore_mask_o')

      UPDATE inbb_t
         SET (inbbdocno,
              inbbseq
              ,inbbsite,inbb026,inbb001,inbb002,inbb004,inbb007,inbb008,inbb009,inbb010,inbb003,inbb011,inbb012,inbb013,inbb014,inbb015,inbb016,inbb017,inbb018,inbb019,inbb023,inbb024,inbb025,inbb020,inbb204,inbb022,inbb021)
              =
             (ps_keys[1],ps_keys[2]
              ,g_inbb_d[g_detail_idx].inbbsite,g_inbb_d[g_detail_idx].inbb026,g_inbb_d[g_detail_idx].inbb001,
                  g_inbb_d[g_detail_idx].inbb002,g_inbb_d[g_detail_idx].inbb004,g_inbb_d[g_detail_idx].inbb007,
                  g_inbb_d[g_detail_idx].inbb008,g_inbb_d[g_detail_idx].inbb009,g_inbb_d[g_detail_idx].inbb010,
                  g_inbb_d[g_detail_idx].inbb003,g_inbb_d[g_detail_idx].inbb011,g_inbb_d[g_detail_idx].inbb012,
                  g_inbb_d[g_detail_idx].inbb013,g_inbb_d[g_detail_idx].inbb014,g_inbb_d[g_detail_idx].inbb015,
                  g_inbb_d[g_detail_idx].inbb016,g_inbb_d[g_detail_idx].inbb017,g_inbb_d[g_detail_idx].inbb018,
                  g_inbb_d[g_detail_idx].inbb019,g_inbb_d[g_detail_idx].inbb023,g_inbb_d[g_detail_idx].inbb024,
                  g_inbb_d[g_detail_idx].inbb025,g_inbb_d[g_detail_idx].inbb020,g_inbb_d[g_detail_idx].inbb204,
                  g_inbb_d[g_detail_idx].inbb022,g_inbb_d[g_detail_idx].inbb021)
         WHERE inbbent = g_enterprise AND inbbdocno = ps_keys_bak[1] AND inbbseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update"

      #end add-point
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "inbb_t"
            LET g_errparam.code = "std-00009"
            LET g_errparam.popup = TRUE
            CALL s_transaction_end('N','0')
            CALL cl_err()

         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "inbb_t:",SQLERRMESSAGE
            LET g_errparam.code = SQLCA.SQLCODE
            LET g_errparam.popup = TRUE
            CALL s_transaction_end('N','0')
            CALL cl_err()

         OTHERWISE

      END CASE

      #將遮罩欄位進行遮蔽
      CALL aint302_inbb_t_mask_restore('restore_mask_n')

      #add-point:update_b段修改後 name="update_b.after_update"

      #end add-point
   END IF

   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN

   END IF






   #add-point:update_b段other name="update_b.other"

   #end add-point

END FUNCTION

{</section>}

{<section id="aint302.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION aint302_key_update_b(ps_keys_bak,ps_table)
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

{<section id="aint302.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION aint302_key_delete_b(ps_keys_bak,ps_table)
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

{<section id="aint302.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION aint302_lock_b(ps_table,ps_page)
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
   #CALL aint302_b_fill()

   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "inbb_t"

   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN aint302_bcl USING g_enterprise,
                                       g_inba_m.inbadocno,g_inbb_d[g_detail_idx].inbbseq
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "aint302_bcl:",SQLERRMESSAGE
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF





   #add-point:lock_b段other name="lock_b.other"

   #end add-point

   RETURN TRUE

END FUNCTION

{</section>}

{<section id="aint302.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION aint302_unlock_b(ps_table,ps_page)
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
      CLOSE aint302_bcl
   END IF





   #add-point:unlock_b段other name="unlock_b.other"

   #end add-point

END FUNCTION

{</section>}

{<section id="aint302.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION aint302_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"

   #end add-point
   DEFINE p_cmd   LIKE type_t.chr1
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
            DEFINE l_fields   STRING
   #end add-point

   #add-point:Function前置處理  name="set_entry.pre_function"

   #end add-point

   CALL cl_set_comp_entry("inbadocno",TRUE)

   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("inbadocno",TRUE)
      CALL cl_set_comp_entry("inbadocdt",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      CALL cl_set_comp_entry("inbadocdt",TRUE)

      #end add-point
   END IF

   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   CALL cl_set_comp_entry("inba002,inba003,inba004,inba005,inba006,inba007,inba008",TRUE)
   CALL cl_set_comp_entry("inbadocdt",TRUE)  #160604-00034#1
   #end add-point

END FUNCTION

{</section>}

{<section id="aint302.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION aint302_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"

   #end add-point
   DEFINE p_cmd   LIKE type_t.chr1
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   DEFINE l_fields   STRING
   DEFINE l_cnt   LIKE type_t.num10   #170618-00291#1 20170619 add by beckxie
   #end add-point

   #add-point:Function前置處理  name="set_no_entry.pre_function"

   #end add-point

   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("inbadocno",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
     #CALL cl_set_comp_entry("inbadocdt",FALSE)   #170922-00037#3 mark
      #end add-point
   END IF

   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("inbadocno",FALSE)
   END IF

#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("inbadocdt",FALSE)
      END IF
#  END IF

   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   #依目前的單別控制欄位是否可輸入
   IF NOT cl_null(g_inba_m.inbadocno) THEN
      LET l_fields = s_aooi200_get_doc_fields(g_site,'1',g_inba_m.inbadocno)
      CALL cl_set_comp_entry(l_fields,FALSE)
   END IF
   #161109-00032#1-S
   IF g_type = '3' OR g_type = '4' THEN
      CALL cl_set_comp_entry("inba005",FALSE)
   END IF
   #161109-00032#1-E
   IF NOT cl_chk_update_pstdt() THEN
      CALL cl_set_comp_entry("inba002",FALSE)
   END IF
   #160604-00034#1-S
   #160604-00034#1-E

   #170618-00291#1 20170619 add by beckxie---S
   LET l_cnt = 0
   SELECT COUNT(1) INTO l_cnt
     FROM inbb_t
    WHERE inbbent = g_enterprise
      AND inbbdocno = g_inba_m.inbadocno

   IF l_cnt > 0 THEN
      #單身若已有資料，不開放單頭的來源單號(inba006)
      CALL cl_set_comp_entry("inba006",FALSE)
   END IF
   #170618-00291#1 20170619 add by beckxie---E
   #end add-point

END FUNCTION

{</section>}

{<section id="aint302.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION aint302_set_entry_b(p_cmd)
   #add-point:set_entry_b段define(客製用) name="set_entry_b.define_customerization"

   #end add-point
   DEFINE p_cmd   LIKE type_t.chr1
   #add-point:set_entry_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry_b.define"

   #end add-point

   #add-point:Function前置處理  name="set_entry_b.pre_function"

   #end add-point

   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("",TRUE)
      #add-point:set_entry段欄位控制 name="set_entry_b.field_control"

      #end add-point
   END IF

   #add-point:set_entry_b段 name="set_entry_b.set_entry_b"
   CALL cl_set_comp_entry("inbb003,inbb009,inbb008,inbbseq,inbb002",TRUE)
   CALL cl_set_comp_entry("inbb014",TRUE)
   CALL cl_set_comp_entry("inbb204,inbb022",TRUE) #160512-00004#2-add
   CALL cl_set_comp_entry("inbb011",TRUE)         #170618-00287#1 20170618 add by beckxie
   #end add-point
END FUNCTION

{</section>}

{<section id="aint302.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION aint302_set_no_entry_b(p_cmd)
   #add-point:set_no_entry_b段define(客製用) name="set_no_entry_b.define_customerization"

   #end add-point
   DEFINE p_cmd   LIKE type_t.chr1
   #add-point:set_no_entry_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry_b.define"
            DEFINE l_imaf055  LIKE imaf_t.imaf055
   DEFINE l_inaa007  LIKE inaa_t.inaa007
   DEFINE l_imaf061  LIKE imaf_t.imaf061
   DEFINE l_imaa005  LIKE imaa_t.imaa005
   DEFINE l_imea002  LIKE imea_t.imea002
   DEFINE l_imaf015  LIKE imaf_t.imaf015
   DEFINE l_pjaa013  LIKE pjaa_t.pjaa013
   #160512-00004#2-add-(S)
   DEFINE l_success  LIKE type_t.num5
   DEFINE l_inad011  LIKE inad_t.inad011 #有效日期
   DEFINE l_inad014  LIKE inad_t.inad014 #製造日期
   DEFINE l_ooac004  LIKE ooac_t.ooac004 #製造日期
   DEFINE l_ooac002  LIKE ooac_t.ooac002 #單別
   DEFINE l_n        LIKE type_t.num10   #170808-00058#1 add
   DEFINE l_inbb002  LIKE inbb_t.inbb002 #170808-00058#1 add
   #160512-00004#2-add-(E)
   #end add-point

   #add-point:Function前置處理  name="set_no_entry_b.pre_function"

   #end add-point

   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("",FALSE)
      #add-point:set_no_entry_b段欄位控制 name="set_no_entry_b.field_control"

      #end add-point
   END IF

   #add-point:set_no_entry_b段 name="set_no_entry_b.set_no_entry_b"

   LET l_imaf015 = ''

   #若設定imaf055(庫存管理特徵)等於'2.不可有庫存管理特徵'時，則[C:庫存管理特徵]欄位不可輸入
   SELECT imaf015,imaf055,imaf061 INTO l_imaf015,l_imaf055,l_imaf061 FROM imaf_t WHERE imafent = g_enterprise AND imaf001 = g_inbb_d[l_ac].inbb001 AND imafsite = g_site
   #IF l_imaf055 = '2' THEN   #160815-00028#1 mark
   IF l_imaf055 = '2' AND NOT aint302_get_vmi() THEN   #160815-00028#1
      CALL cl_set_comp_entry("inbb003",FALSE)
      LET g_inbb_d[l_ac].inbb003 = ' '
   END IF
   #[T:料件據點進銷存檔].[C:庫存批號控管]=2時,[C:不可有批號]欄位不可輸入
   IF l_imaf061 = '2' THEN
      CALL cl_set_comp_entry("inbb009",FALSE)
      LET g_inbb_d[l_ac].inbb009 = ''
   END IF

   #當料件不使用參考單位管理時，則參考數量不允許輸入
   IF cl_null(l_imaf015) THEN
      CALL cl_set_comp_entry("inbb014",FALSE)
      LET g_inbb_d[l_ac].inbb013 = ''
      LET g_inbb_d[l_ac].inbb013_desc = ''
      LET g_inbb_d[l_ac].inbb014 = ''
      LET g_inbb_d[l_ac].inbb015 = ''
   END IF

   #若[T:庫位資料檔].[C:儲位管理]='5'(不使用儲位管理)時，則[C:限定儲位]不可以維護
   SELECT inaa007 INTO l_inaa007 FROM inaa_t WHERE inaaent = g_enterprise AND inaasite = g_site AND inaa001 = g_inbb_d[l_ac].inbb007
   IF l_inaa007 = '5' THEN
      CALL cl_set_comp_entry("inbb008",FALSE)
      LET g_inbb_d[l_ac].inbb008 = ' '
      LET g_inbb_d[l_ac].inbb008_desc = ''
   END IF

   IF p_cmd = 'u' THEN
      CALL cl_set_comp_entry("inbbseq",FALSE)
   END IF

   #判斷料件是否存在產品特徵功能
   LET l_imaa005 = ''
   CALL aint302_get_imaa005(g_enterprise,g_inbb_d[l_ac].inbb001) RETURNING l_imaa005
   IF cl_null(l_imaa005) THEN
      CALL cl_set_comp_entry("inbb002",FALSE)
      LET g_inbb_d[l_ac].inbb002 = ' '
   ELSE
      IF cl_null(g_inbb_d[l_ac].inbb002) THEN
         LET g_inbb_d[l_ac].inbb002 = ''
      END IF
   END IF

   #有專案代號且"專案庫存控管"="Y"時，自動將專案代號帶入庫存管理特徵欄位中，不可修改
   IF NOT cl_null(g_inbb_d[l_ac].inbb023) THEN
      SELECT pjaa013 INTO l_pjaa013 FROM pjaa_t,pjba_t
         WHERE pjaaent = pjbaent AND pjaa001 = pjba000 AND pjaaent = g_enterprise AND pjba001 = g_inbb_d[l_ac].inbb023
      IF l_pjaa013 = 'Y' THEN
         LET g_inbb_d[l_ac].inbb003 = g_inbb_d[l_ac].inbb023
         CALL cl_set_comp_entry("inbb003",FALSE)
      END IF
   END IF

   #160512-00004#2-add-(S)
   #若aini010中的有效日期(inad011).製造日期(inad014)有值，則不能進行輸入
   IF NOT cl_null(g_inbb_d[l_ac].inbb001) AND NOT cl_null(g_inbb_d[l_ac].inbb009) THEN
      CALL s_aooi200_get_slip(g_inba_m.inbadocno) RETURNING l_success,l_ooac002
      CALL cl_get_doc_para(g_enterprise,g_site,l_ooac002,'D-MFG-0012') RETURNING l_ooac004
      #庫存批號是否允許重覆
      IF l_ooac004 = 'Y' THEN
         LET l_inad011 = ''
         LET l_inad014 = ''
         SELECT inad014,inad011 INTO l_inad014,l_inad011
           FROM inad_t
          WHERE inadent = g_enterprise
            AND inadsite = g_site
            AND inad001 = g_inbb_d[l_ac].inbb001
            AND inad002 = g_inbb_d[l_ac].inbb002
            AND inad003 = g_inbb_d[l_ac].inbb009
         #製造日期
         IF NOT cl_null(l_inad014) THEN
            LET g_inbb_d[l_ac].inbb204 = l_inad014
            CALL cl_set_comp_entry("inbb204",FALSE)
         END IF
         #有效日期
         IF NOT cl_null(l_inad011) THEN
            LET g_inbb_d[l_ac].inbb022 = l_inad011
            CALL cl_set_comp_entry("inbb022",FALSE)
         END IF
         #DISPLAY BY NAME g_inbb_d[l_ac].inbb204,g_inbb_d[l_ac].inbb022  #170526-00058#1 mark
      END IF
   END IF
   #160512-00004#2-add-(E)
   #170618-00287#1 20170618 add by beckxie---S
   IF g_inba_m.inba005 = '8' THEN
      CALL cl_set_comp_entry("inbb011,inbb014",FALSE)
   END IF
   #170618-00287#1 20170618 add by beckxie---E

   #170808-00058#1--add--s
   #如果異動單據上批號沒有值，製造日期、有效日期不能輸入，如果單據上的批號已有對應的inad_t，也不允許修改製造日期、有效日期(不管原先inad_t上的製造日期、有效日期有值或沒值)
   IF cl_null(g_inbb_d[l_ac].inbb009) THEN
      CALL cl_set_comp_entry("inbb204,inbb022",FALSE)
      LET g_inbb_d[l_ac].inbb204 = ''
      LET g_inbb_d[l_ac].inbb022 = ''
   ELSE
      LET l_n = 0
      LET l_inbb002 = g_inbb_d[l_ac].inbb002
      IF cl_null(g_inbb_d[l_ac].inbb002) THEN
         LET l_inbb002 = ' '
      END IF
      SELECT COUNT(1) INTO l_n FROM inad_t
        WHERE inadent = g_enterprise
          AND inadsite = g_site
          AND inad001 = g_inbb_d[l_ac].inbb001
          AND NVL(inad002,' ') = l_inbb002
          AND inad003 = g_inbb_d[l_ac].inbb009
      IF l_n > 0 THEN
         CALL cl_set_comp_entry("inbb204,inbb022",FALSE)
         #170904-00005#1 mark(s)
         #LET g_inbb_d[l_ac].inbb204 = ''
         #LET g_inbb_d[l_ac].inbb022 = ''
         #170904-00005#1 mark(e)
         #170904-00005#1 add(s)
         IF NOT cl_null(g_inbb_d[l_ac].inbb001) AND NOT cl_null(g_inbb_d[l_ac].inbb009) THEN
            SELECT inad014,inad011 INTO g_inbb_d[l_ac].inbb204,g_inbb_d[l_ac].inbb022
              FROM inad_t
             WHERE inadent = g_enterprise
               AND inadsite = g_site
               AND inad001 = g_inbb_d[l_ac].inbb001
               AND inad003 = g_inbb_d[l_ac].inbb009
               AND NVL(inad002,' ') = l_inbb002
         DISPLAY BY NAME g_inbb_d[l_ac].inbb204,g_inbb_d[l_ac].inbb022
         END IF
         #170904-00005#1 add(e)
      END IF
   END IF
   #170808-00058#1--add--e

   #end add-point
END FUNCTION

{</section>}

{<section id="aint302.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION aint302_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"

   #end add-point
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   CALL cl_set_act_visible("modify,delete,modify_detail,s_lot_ins,s_lot_sel1,gen_detail", TRUE)  #add by lixh 20151010  #160707-00017#1 add gen_detail
   #end add-point
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   CALL cl_set_act_visible("aint302_01,aint302_01_1,open_memo,gen_qc,storage_by_qc,storage_by_qc_1,qc_query",TRUE) #170710-00045#3 add
   CALL cl_set_act_visible("open_detail_memo,scan_barcode,s_lot_sel,prog_inba003,unposted",TRUE) #170710-00045#3 add

   #170323-00026#1 add s---
   IF g_type = '1' THEN
      CALL cl_set_act_visible("storage_by_qc_1,aint302_01_1",TRUE)
   END IF
   IF g_type = '2' THEN
      CALL cl_set_act_visible("storage_by_qc,aint302_01",TRUE)
   END IF
   #170323-00026#1 add e---

   #end add-point
END FUNCTION

{</section>}

{<section id="aint302.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION aint302_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"

   #end add-point
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   #160825-00025#1-s
   DEFINE l_xccwcomp LIKE xccw_t.xccwcomp
   DEFINE l_xccwld   LIKE xccw_t.xccwld
   DEFINE l_xccw004  LIKE xccw_t.xccw004
   DEFINE l_xccw005  LIKE xccw_t.xccw005
   DEFINE l_xccw003  LIKE xccw_t.xccw003
   DEFINE l_cnt      LIKE type_t.num5
   #160825-00025#1-e
   #end add-point
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   #應用 a63 樣板自動產生(Version:1)
   #170710-00045#3 add(s)
   #此段為進入查詢方案畫面g_main_hidden = 1 AND g_hidden = 0，要將所有的action關閉
   #此段在查詢方案畫面和主畫面都會調用，action的關閉只需要在查詢方案畫面做，所以這邊有條件控管action的關閉
   IF g_main_hidden = 1 AND g_hidden = 0 THEN    #g_hidden為aint302_set_act_no_visible()的判斷
      CALL cl_set_act_visible("aint302_01,aint302_01_1,open_memo,gen_qc,storage_by_qc,storage_by_qc_1,qc_query,gen_detail",FALSE)
      CALL cl_set_act_visible("open_detail_memo,scan_barcode,s_lot_sel1,s_lot_ins,s_lot_sel,prog_inba003,unposted",FALSE)
   END IF
   #170710-00045#3 add(e)

   IF g_inba_m.inbastus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail,s_lot_ins,s_lot_sel1,gen_detail", FALSE)   #add by lixh 20151010  #add s_lot_ins,s_lot_sel1  #160707-00017#1
   END IF
   #add by lixh 20151010

   #150310-00003#19 add by lixh 20160223
   IF g_inba_m.inba005 = '10' AND NOT cl_null(g_inba_m.inba006) THEN
      CALL cl_set_act_visible("modify,delete,modify_detail",FALSE)
   END IF
   #150310-00003#19 add by lixh 20160223
   #160825-00025#1-s
   CALL s_axc_set_site_default() RETURNING l_xccwcomp,l_xccwld,l_xccw004,l_xccw005,l_xccw003
   LET l_cnt  = 0
   SELECT COUNT(*) INTO l_cnt FROM xccw_t
    WHERE xccwent = g_enterprise
      AND xccw006 = g_inba_m.inbadocno
      AND xccwcomp = l_xccwcomp
      AND xccw012 IN ('1','2')
   IF l_cnt  > 0 THEN
      CALL cl_set_act_visible("modify,delete,modify_detail",FALSE)
   END IF
   #160825-00025#1-e
   #IF g_argv[1] = '1' THEN #161109-00032#1
   IF g_argv[1] = '1' OR g_argv[1] = '3' THEN    #161109-00032#1
      CALL cl_set_act_visible("s_lot_ins",FALSE)
   ELSE
      CALL cl_set_act_visible("s_lot_sel1",FALSE)
   END IF
   #add by lixh 20151010
   #170323-00026#1 add s---
   IF g_type = '1' THEN
      CALL cl_set_act_visible("storage_by_qc,aint302_01",FALSE)
   END IF
   IF g_type = '2' THEN
      CALL cl_set_act_visible("storage_by_qc_1,aint302_01_1",FALSE)
   END IF
   #170323-00026#1 add e---
   #end add-point
END FUNCTION

{</section>}

{<section id="aint302.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION aint302_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"

   #end add-point
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   CALL cl_set_act_visible("s_lot_ins,s_lot_sel,s_lot_sel1",TRUE)  #add by lixh 20151010
   #end add-point
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"

   #end add-point
END FUNCTION

{</section>}

{<section id="aint302.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION aint302_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"

   #end add-point
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   DEFINE   l_imaf071     LIKE imaf_t.imaf071
   DEFINE   l_imaf081     LIKE imaf_t.imaf081
   #end add-point
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   #add by lixh 20151010
   IF l_ac = 0 OR cl_null(l_ac) THEN
      RETURN
   END IF
   #160801-00005#1-s
   IF l_ac > g_inbb_d.getLength() THEN
      RETURN
   END IF
   #160801-00005#1-e
   SELECT DISTINCT imaf071,imaf081 INTO l_imaf071,l_imaf081 FROM imaf_t
    WHERE imafent = g_enterprise
      AND imafsite = g_site
      AND imaf001 = g_inbb_d[l_ac].inbb001

   IF l_imaf071 <> '1' AND l_imaf081 <> '1' THEN
      CALL cl_set_act_visible("s_lot_ins,s_lot_sel,s_lot_sel1",FALSE)
   END IF
   IF g_inba_m.inbastus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail,s_lot_ins,s_lot_sel1", FALSE)   #add by lixh 20151010  #add s_lot_ins,s_lot_sel1
   END IF
   #IF g_argv[1] = '1' THEN                     #161109-00032#1
   IF g_argv[1] = '1' OR g_argv[1] = '3' THEN   #161109-00032#1
      CALL cl_set_act_visible("s_lot_ins",FALSE)
   ELSE
      CALL cl_set_act_visible("s_lot_sel1",FALSE)
   END IF
   #add by lixh 20151010
   #end add-point
END FUNCTION

{</section>}

{<section id="aint302.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION aint302_default_search()
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
      LET ls_wc = ls_wc, " inbadocno = '", g_argv[01], "' AND "
   END IF



   #add-point:default_search段after sql name="default_search.after_sql"
   LET ls_wc= ''
   IF NOT cl_null(g_argv[02]) THEN
      LET ls_wc = " inbadocno = '", g_argv[02], "' AND "
   END IF
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

         FOR li_idx = 1 TO la_wc.getLength()
            CASE
               WHEN la_wc[li_idx].tableid = "inba_t"
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "inbb_t"
                  LET g_wc2_table1 = la_wc[li_idx].wc

               WHEN la_wc[li_idx].tableid = "EXTENDWC"
                  LET g_wc2_extend = la_wc[li_idx].wc
            END CASE
         END FOR
         IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1)

            OR NOT cl_null(g_wc2_extend)
            THEN
            #組合g_wc2
            IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
               LET g_wc2 = g_wc2_table1
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
   IF NOT cl_null(g_argv[01]) THEN
      #LET g_wc = g_wc , " AND inba001 = '", g_argv[01], "' "  #161109-00032#1
      #161109-00032#1-S
      IF g_argv[01] = '3' OR g_argv[01] = '4' THEN
         IF g_argv[01] = '3' THEN
            LET g_wc = g_wc , " AND inba001 = 'X1' "
         END IF
         IF g_argv[01] = '4' THEN
            LET g_wc = g_wc , " AND inba001 = 'X2' "
         END IF
      ELSE
         LET g_wc = g_wc , " AND inba001 = '", g_argv[01], "' "
      END IF
      #161109-00032#1-E
   END IF
   #end add-point

   IF g_wc.getIndexOf(" 1=2", 1) THEN
      LET g_default = TRUE
   END IF


END FUNCTION

{</section>}

{<section id="aint302.state_change" >}
   #應用 a09 樣板自動產生(Version:22)
#+ 確認碼變更
PRIVATE FUNCTION aint302_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"

   #end add-point
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   DEFINE l_ooac004         LIKE ooac_t.ooac004
   DEFINE l_ooac002         LIKE ooac_t.ooac002
   DEFINE l_flag1           LIKE type_t.num5
   #160825-00025#1-s
   DEFINE l_xccwcomp        LIKE xccw_t.xccwcomp
   DEFINE l_xccwld          LIKE xccw_t.xccwld
   DEFINE l_xccw004         LIKE xccw_t.xccw004
   DEFINE l_xccw005         LIKE xccw_t.xccw005
   DEFINE l_xccw003         LIKE xccw_t.xccw003
   DEFINE l_cnt             LIKE type_t.num5
   #160825-00025#1-e
   #end add-point

   #add-point:Function前置處理 name="statechange.before"
   IF g_inba_m.inbastus = 'X' THEN
      RETURN
   END IF
   #150310-00003#19 add by lixh 20160223
   IF g_type = '1' AND g_inba_m.inba005 = '10' THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ""
      LET g_errparam.code   = "ain-00737"
      LET g_errparam.popup  = FALSE
      CALL cl_err()
      RETURN
   END IF
   #150310-00003#19 add by lixh 20160223

   #160825-00025#1-s
   CALL s_axc_set_site_default() RETURNING l_xccwcomp,l_xccwld,l_xccw004,l_xccw005,l_xccw003
   LET l_cnt  = 0
   SELECT COUNT(*) INTO l_cnt FROM xccw_t
    WHERE xccwent = g_enterprise
      AND xccw006 = g_inba_m.inbadocno
      AND xccwcomp = l_xccwcomp
      AND xccw012 IN ('1','2')
   IF l_cnt  > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ""
      LET g_errparam.code   = "ain-00784"
      LET g_errparam.popup  = FALSE
      CALL cl_err()
      RETURN
   END IF
   #160825-00025#1-e
   #end add-point

   ERROR ""     #清空畫面右下側ERROR區塊

   IF g_inba_m.inbadocno IS NULL

   THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ""
      LET g_errparam.code   = "std-00003"
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN
   END IF

   CALL s_transaction_begin()

   OPEN aint302_cl USING g_enterprise,g_inba_m.inbadocno
   IF SQLCA.SQLCODE THEN
      CLOSE aint302_cl
   #  CALL s_transaction_end('N','0')   #(ver:19)
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "OPEN aint302_cl:",SQLERRMESSAGE
      LET g_errparam.code   = SQLCA.SQLCODE
      LET g_errparam.popup = TRUE
      CALL s_transaction_end('N','0')   #(ver:19)
      CALL cl_err()
      RETURN
   END IF

   #顯示最新的資料
   EXECUTE aint302_master_referesh USING g_inba_m.inbadocno INTO g_inba_m.inbadocno,g_inba_m.inbasite,
       g_inba_m.inbadocdt,g_inba_m.inba002,g_inba_m.inba003,g_inba_m.inba004,g_inba_m.inbastus,g_inba_m.inba005,
       g_inba_m.inba006,g_inba_m.inba007,g_inba_m.inba008,g_inba_m.inbaownid,g_inba_m.inbacrtdp,g_inba_m.inbaowndp,
       g_inba_m.inbacrtdt,g_inba_m.inbacrtid,g_inba_m.inbamodid,g_inba_m.inbacnfdt,g_inba_m.inbamoddt,
       g_inba_m.inbapstid,g_inba_m.inbacnfid,g_inba_m.inbapstdt,g_inba_m.inba003_desc,g_inba_m.inba004_desc,
       g_inba_m.inbaownid_desc,g_inba_m.inbacrtdp_desc,g_inba_m.inbaowndp_desc,g_inba_m.inbacrtid_desc,
       g_inba_m.inbamodid_desc,g_inba_m.inbapstid_desc,g_inba_m.inbacnfid_desc


   #檢查是否允許此動作
   IF NOT aint302_action_chk() THEN
      CLOSE aint302_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF

   #將資料顯示到畫面上
   DISPLAY BY NAME g_inba_m.inbadocno,g_inba_m.inbadocno_desc,g_inba_m.inbasite,g_inba_m.inbadocdt,g_inba_m.inba002,
       g_inba_m.inba003,g_inba_m.inba003_desc,g_inba_m.inba004,g_inba_m.inba004_desc,g_inba_m.inbastus,
       g_inba_m.inba005,g_inba_m.inba006,g_inba_m.inba007,g_inba_m.inba007_desc,g_inba_m.inba008,g_inba_m.inbaownid,
       g_inba_m.inbaownid_desc,g_inba_m.inbacrtdp,g_inba_m.inbacrtdp_desc,g_inba_m.inbaowndp,g_inba_m.inbaowndp_desc,
       g_inba_m.inbacrtdt,g_inba_m.inbacrtid,g_inba_m.inbacrtid_desc,g_inba_m.inbamodid,g_inba_m.inbamodid_desc,
       g_inba_m.inbacnfdt,g_inba_m.inbamoddt,g_inba_m.inbapstid,g_inba_m.inbapstid_desc,g_inba_m.inbacnfid,
       g_inba_m.inbacnfid_desc,g_inba_m.inbapstdt

   CASE g_inba_m.inbastus
      WHEN "N"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
      WHEN "S"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
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
      WHEN "Z"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
      WHEN "X"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")

   END CASE

   #add-point:資料刷新後 name="statechange.after_refresh"

   #end add-point

   MENU "" ATTRIBUTES (STYLE="popup")
      BEFORE MENU
         HIDE OPTION "approved"
         HIDE OPTION "rejection"
         CASE g_inba_m.inbastus

            WHEN "N"
               HIDE OPTION "unconfirmed"
            WHEN "S"
               HIDE OPTION "posted"
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
            WHEN "Z"
               HIDE OPTION "unposted"
            WHEN "X"
               HIDE OPTION "invalid"
         END CASE

      #add-point:menu前 name="statechange.before_menu"
      CALL cl_set_act_visible("signing,withdraw",FALSE)
      CALL cl_set_act_visible("unconfirmed,posted,unposted,invalid,confirmed",TRUE)
         CASE g_inba_m.inbastus
            WHEN "N"
               #HIDE OPTION "open"
               CALL cl_set_act_visible("unconfirmed,posted,unposted",FALSE)
               #需提交至BPM時，則顯示「提交」功能並隱藏「確認」功能
               IF cl_bpm_chk() THEN
                   CALL cl_set_act_visible("signing",TRUE)
                   CALL cl_set_act_visible("confirmed",FALSE)
               END IF

            WHEN "R"   #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
               CALL cl_set_act_visible("confirmed,unconfirmed,posted,unposted",FALSE)

            WHEN "D"   #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
               CALL cl_set_act_visible("confirmed,unconfirmed,posted,unposted",FALSE)


            WHEN "S"
               #HIDE OPTION "posted"
               CALL cl_set_act_visible("unconfirmed,posted,invalid,confirmed",FALSE)

            WHEN "X"
               #HIDE OPTION "invalid"
               CALL cl_set_act_visible("unconfirmed,posted,invalid,confirmed,unposted",FALSE)

            WHEN "Y"
               #HIDE OPTION "confirmed"
               CALL cl_set_act_visible("invalid,confirmed,unposted",FALSE)

            WHEN "W"    #只能顯示抽單;其餘應用功能皆隱藏
                CALL cl_set_act_visible("withdraw",TRUE)
                CALL cl_set_act_visible("unconfirmed,invalid,confirmed,posted,unposted",FALSE)

            WHEN "A"     #只能顯示確認; 其餘應用功能皆隱藏
                CALL cl_set_act_visible("confirmed ",TRUE)
                CALL cl_set_act_visible("unconfirmed,invalid,posted,unposted",FALSE)


         END CASE
         #add by lixh 20150525
#         IF g_type = '1' AND g_inba_m.inba005 = '10' AND NOT cl_null(g_inba_m.inba006) THEN
#            CALL cl_set_act_visible("unconfirmed,posted,unposted,invalid,confirmed,approved,rejection,withdraw,signing",TRUE)
#         END IF
         #add by lixh 20150525
      #end add-point

      #應用 a36 樣板自動產生(Version:5)
      #提交
      ON ACTION signing
         IF cl_auth_chk_act("signing") THEN
            IF NOT aint302_send() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE aint302_cl
            RETURN
         END IF

      #抽單
      ON ACTION withdraw
         IF cl_auth_chk_act("withdraw") THEN
            IF NOT aint302_draw_out() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE aint302_cl
            RETURN
         END IF




      ON ACTION unconfirmed
         IF cl_auth_chk_act("unconfirmed") THEN
            LET lc_state = "N"
            #add-point:action控制 name="statechange.unconfirmed"
            CALL s_transaction_begin()
            IF NOT cl_ask_confirm('aim-00110') THEN
               CALL s_transaction_end('N','0')
               CLOSE aint302_cl  #170802-00056#1
               RETURN
            #ELSE   #170802-00056#1 mark
            END IF  #170802-00056#1
            CALL cl_err_collect_init()
            IF NOT s_aint302_unconf(g_inba_m.inbadocno) THEN
               CALL s_transaction_end('N','0')
               CALL cl_err_collect_show()
               CLOSE aint302_cl  #170802-00056#1
               RETURN
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            CALL cl_err_collect_show()
            #END IF  #170802-00056#1 mark
            #end add-point
         END IF
         EXIT MENU
      ON ACTION posted
         IF cl_auth_chk_act("posted") THEN
            LET lc_state = "S"
            #add-point:action控制 name="statechange.posted"
            #add by lixh 20150525
            IF g_type = '1' AND g_inba_m.inba005 = '10' THEN
               CALL s_transaction_end('N','0')   #160812-00017#2 20160815 add by beckxie
               CLOSE aint302_cl  #170802-00056#1
               RETURN
            END IF
            #add by lixh 20150525
            CALL s_transaction_begin()

            IF NOT cl_ask_confirm('sub-00232') THEN
               CALL s_transaction_end('N','0')
               CLOSE aint302_cl  #170802-00056#1
               RETURN
            #ELSE   #170802-00056#1 mark
            END IF  #170802-00056#1
            IF aint302_inba002_upd() THEN
               CALL cl_err_collect_init()
               IF NOT s_aint302_posted(g_inba_m.inbadocno) THEN
                  CALL s_transaction_end('N','0')
                  CALL cl_err_collect_show()
                  CLOSE aint302_cl  #170802-00056#1
                  RETURN
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               CALL cl_err_collect_show()
            ELSE
               CALL s_transaction_end('N','0')   #160812-00017#2 20160815 add by beckxie
               CLOSE aint302_cl  #170802-00056#1
               RETURN
            END IF
            #END IF  #170802-00056#1 mark
            #end add-point
         END IF
         EXIT MENU
      ON ACTION confirmed
         IF cl_auth_chk_act("confirmed") THEN
            LET lc_state = "Y"
            #add-point:action控制 name="statechange.confirmed"
            CALL s_transaction_begin()
            IF NOT cl_ask_confirm('aim-00108') THEN
               CALL s_transaction_end('N','0')
               CLOSE aint302_cl  #170802-00056#1
               RETURN
            #ELSE   #170802-00056#1 mark
            END IF  #170802-00056#1
            CALL cl_err_collect_init()
            #add by lixh 20150820
            IF NOT s_aint302_conf_chk(g_inba_m.inbadocno) THEN
               CALL s_transaction_end('N','0')
               CALL cl_err_collect_show()
               CLOSE aint302_cl  #170802-00056#1
               RETURN
            END IF
            #add by lixh 20150820
            IF NOT s_aint302_conf(g_inba_m.inbadocno) THEN
               CALL s_transaction_end('N','0')
               CALL cl_err_collect_show()
               CLOSE aint302_cl  #170802-00056#1
               RETURN
            #ELSE   #170802-00056#1 mark
            END IF  #170802-00056#1
            CALL cl_err_collect_show()  #170802-00056#1
            #單別若設置確認時自動過帳，則在確認後需自動過帳(單據別參數:D-BAS-0083)
            CALL s_aooi200_get_slip(g_inba_m.inbadocno) RETURNING l_flag1,l_ooac002
            CALL cl_get_doc_para(g_enterprise,g_site,l_ooac002,'D-BAS-0083') RETURNING l_ooac004
            IF l_ooac004 = 'Y' THEN
               LET lc_state = "S"
               IF aint302_inba002_upd() THEN
                  CALL cl_err_collect_init()  #170802-00056#1
                  IF NOT s_aint302_posted(g_inba_m.inbadocno) THEN
                     CALL s_transaction_end('N','0')
                     CALL cl_err_collect_show()
                     CLOSE aint302_cl  #170802-00056#1
                     RETURN
                  ELSE
                     CALL s_transaction_end('Y','0')
                  END IF
                  CALL cl_err_collect_show()
               ELSE
                  CALL s_transaction_end('N','0')
                  CLOSE aint302_cl  #170802-00056#1
                  RETURN
               END IF
            END IF
            CALL s_transaction_end('Y','0')
            #END IF  #170802-00056#1 mark
            #CALL cl_err_collect_show()  #170802-00056#1 mark
            #END IF  #170802-00056#1 mark
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
      ON ACTION unposted
         IF cl_auth_chk_act("unposted") THEN
            LET lc_state = "Z"
            #add-point:action控制 name="statechange.unposted"
            #add by lixh 20150525
            IF g_type = '1' AND g_inba_m.inba005 = '10' THEN
               CALL s_transaction_end('N','0')   #160812-00017#2 20160815 add by beckxie
               CLOSE aint302_cl  #170802-00056#1
               RETURN
            END IF
            #add by lixh 20150525
            #170425-00065#1-S add
            IF g_inba_m.inba005 = '2' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'ain-00903'
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               CALL cl_err()
               CALL s_transaction_end('N','0')
               CLOSE aint302_cl  #170802-00056#1
               RETURN
            END IF
            #170425-00065#1-E add
            LET lc_state = "Y"

            CALL s_transaction_begin()
            IF NOT cl_ask_confirm('sub-00233') THEN
               CALL s_transaction_end('N','0')
               CLOSE aint302_cl  #170802-00056#1
               RETURN
            ELSE
               CALL cl_err_collect_init()
               IF NOT s_aint302_unposted(g_inba_m.inbadocno) THEN
                  CALL s_transaction_end('N','0')
                  CALL cl_err_collect_show()
                  CLOSE aint302_cl  #170802-00056#1
                  RETURN
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               CALL cl_err_collect_show()
            END IF

            EXIT MENU
            #end add-point
         END IF
         EXIT MENU
      ON ACTION invalid
         IF cl_auth_chk_act("invalid") THEN
            LET lc_state = "X"
            #add-point:action控制 name="statechange.invalid"
         CALL s_transaction_begin()
         IF NOT cl_ask_confirm('aim-00109') THEN
            CALL s_transaction_end('N','0')
            CLOSE aint302_cl  #170802-00056#1
            RETURN
         ELSE
            CALL cl_err_collect_init()
            IF NOT s_aint302_invalid(g_inba_m.inbadocno) THEN
               CALL s_transaction_end('N','0')
               CALL cl_err_collect_show()
               CLOSE aint302_cl  #170802-00056#1
               RETURN
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            CALL cl_err_collect_show()
         END IF
            #end add-point
         END IF
         EXIT MENU

      #add-point:stus控制 name="statechange.more_control"
      #ON ACTION unposted
      #   #add by lixh 20150525
      #   IF g_type = '1' AND g_inba_m.inba005 = '10' THEN
      #      RETURN
      #   END IF
      #   #add by lixh 20150525
      #   LET lc_state = "Y"
      #
      #   CALL s_transaction_begin()
      #   IF NOT cl_ask_confirm('sub-00233') THEN
      #      CALL s_transaction_end('N','0')
      #      RETURN
      #   ELSE
      #      CALL cl_err_collect_init()
      #      IF NOT s_aint302_unposted(g_inba_m.inbadocno) THEN
      #         CALL s_transaction_end('N','0')
      #         CALL cl_err_collect_show()
      #         RETURN
      #      ELSE
      #         CALL s_transaction_end('Y','0')
      #      END IF
      #      CALL cl_err_collect_show()
      #   END IF
      #
      #   EXIT MENU
      #end add-point

   END MENU
   LET INT_FLAG=FALSE  #(ver.18)

   #確認被選取的狀態碼在清單中
   IF (lc_state <> "N"
      AND lc_state <> "S"
      AND lc_state <> "Y"
      AND lc_state <> "A"
      AND lc_state <> "D"
      AND lc_state <> "R"
      AND lc_state <> "W"
      AND lc_state <> "Z"
      AND lc_state <> "X"
      ) OR
      g_inba_m.inbastus = lc_state OR cl_null(lc_state) THEN
      CLOSE aint302_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF

   #add-point:stus修改前 name="statechange.b_update"
   ##單別若設置確認時自動過帳，則在確認後需自動過帳(單據別參數:D-BAS-0083)
   #CALL s_aooi200_get_slip(g_inba_m.inbadocno) RETURNING l_flag1,l_ooac002
   #CALL cl_get_doc_para(g_enterprise,g_site,l_ooac002,'D-BAS-0083') RETURNING l_ooac004
   #IF l_ooac004 = 'Y' THEN
   #   LET lc_state = "S"
   #END IF
   SELECT inbastus INTO lc_state FROM inba_t WHERE inbaent = g_enterprise AND inbadocno = g_inba_m.inbadocno
   #end add-point

   LET g_inba_m.inbamodid = g_user
   LET g_inba_m.inbamoddt = cl_get_current()
   LET g_inba_m.inbastus = lc_state

   #異動狀態碼欄位/修改人/修改日期
   UPDATE inba_t
      SET (inbastus,inbamodid,inbamoddt)
        = (g_inba_m.inbastus,g_inba_m.inbamodid,g_inba_m.inbamoddt)
    WHERE inbaent = g_enterprise AND inbadocno = g_inba_m.inbadocno


   IF SQLCA.SQLCODE THEN
      #171011-00030 ---start---
      CLOSE aint302_cl
      CALL s_transaction_end('N','0')
      #171011-00030 --- end ---
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ""
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.popup = FALSE
      CALL cl_err()
      #170801-00033 ---start---
   #  CLOSE aint302_cl   #171011-00030 mark
   #  CALL s_transaction_end('N','0')   #171011-00030 mark
      RETURN
      #170801-00033 --- end ---
   ELSE
      CASE lc_state
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "S"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
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
         WHEN "Z"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")

      END CASE

      #撈取異動後的資料
      EXECUTE aint302_master_referesh USING g_inba_m.inbadocno INTO g_inba_m.inbadocno,g_inba_m.inbasite,
          g_inba_m.inbadocdt,g_inba_m.inba002,g_inba_m.inba003,g_inba_m.inba004,g_inba_m.inbastus,g_inba_m.inba005,
          g_inba_m.inba006,g_inba_m.inba007,g_inba_m.inba008,g_inba_m.inbaownid,g_inba_m.inbacrtdp,g_inba_m.inbaowndp,
          g_inba_m.inbacrtdt,g_inba_m.inbacrtid,g_inba_m.inbamodid,g_inba_m.inbacnfdt,g_inba_m.inbamoddt,
          g_inba_m.inbapstid,g_inba_m.inbacnfid,g_inba_m.inbapstdt,g_inba_m.inba003_desc,g_inba_m.inba004_desc,
          g_inba_m.inbaownid_desc,g_inba_m.inbacrtdp_desc,g_inba_m.inbaowndp_desc,g_inba_m.inbacrtid_desc,
          g_inba_m.inbamodid_desc,g_inba_m.inbapstid_desc,g_inba_m.inbacnfid_desc

      #將資料顯示到畫面上
      DISPLAY BY NAME g_inba_m.inbadocno,g_inba_m.inbadocno_desc,g_inba_m.inbasite,g_inba_m.inbadocdt,
          g_inba_m.inba002,g_inba_m.inba003,g_inba_m.inba003_desc,g_inba_m.inba004,g_inba_m.inba004_desc,
          g_inba_m.inbastus,g_inba_m.inba005,g_inba_m.inba006,g_inba_m.inba007,g_inba_m.inba007_desc,
          g_inba_m.inba008,g_inba_m.inbaownid,g_inba_m.inbaownid_desc,g_inba_m.inbacrtdp,g_inba_m.inbacrtdp_desc,
          g_inba_m.inbaowndp,g_inba_m.inbaowndp_desc,g_inba_m.inbacrtdt,g_inba_m.inbacrtid,g_inba_m.inbacrtid_desc,
          g_inba_m.inbamodid,g_inba_m.inbamodid_desc,g_inba_m.inbacnfdt,g_inba_m.inbamoddt,g_inba_m.inbapstid,
          g_inba_m.inbapstid_desc,g_inba_m.inbacnfid,g_inba_m.inbacnfid_desc,g_inba_m.inbapstdt
   END IF

   #add-point:stus修改後 name="statechange.a_update"
   CALL aint302_show()    #add by lixh 20150901
   #end add-point

   #add-point:statechange段結束前 name="statechange.after"
   CALL aint302_set_act_visible()       #add by lixh 20151010
   CALL aint302_set_act_no_visible()    #add by lixh 20151010
   #end add-point

   CLOSE aint302_cl
   CALL s_transaction_end('Y','0')

   #(ver:20) ---start---
   #add-point:transaction結束後 name="statechange.transaction_after"

   #end add-point
   #(ver:20) --- end ---

   #功能已完成,通報訊息中心
   CALL aint302_msgcentre_notify('statechange:'||lc_state)

END FUNCTION




{</section>}

{<section id="aint302.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION aint302_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"

   #end add-point
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"

   #end add-point

   #add-point:Function前置處理  name="idx_chk.pre_function"

   #end add-point

   LET g_curr_diag = ui.DIALOG.getCurrent()   #(ver:83)

   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_inbb_d.getLength() THEN
         LET g_detail_idx = g_inbb_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_inbb_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_inbb_d.getLength() TO FORMONLY.cnt
   END IF



   #add-point:idx_chk段other name="idx_chk.other"
   IF g_current_page = 2 THEN
      LET g_detail_idx2 = g_curr_diag.getCurrentRow("s_detail2")
      IF g_detail_idx2 > g_inbc_d.getLength() THEN
         LET g_detail_idx2 = g_inbc_d.getLength()
      END IF
      IF g_detail_idx2 = 0 AND g_inbc_d.getLength() <> 0 THEN
         LET g_detail_idx2 = 1
      END IF
      DISPLAY g_detail_idx2 TO FORMONLY.idx
      DISPLAY g_inbc_d.getLength() TO FORMONLY.cnt
   END IF

   IF g_current_page = 3 OR g_current_page = 4 THEN
      CALL FGL_SET_ARR_CURR(g_d_idx_display)
      DISPLAY g_d_idx_display, g_d_cnt_display TO FORMONLY.idx, FORMONLY.cnt
   END IF
   #end add-point

END FUNCTION

{</section>}

{<section id="aint302.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION aint302_b_fill2(pi_idx)
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

   CALL aint302_detail_show()

   LET g_detail_idx = li_detail_idx_tmp

END FUNCTION

{</section>}

{<section id="aint302.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION aint302_fill_chk(ps_idx)
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
   IF (cl_null(g_wc2_table1) OR g_wc2_table1.trim() = '1=1') THEN
      #add-point:fill_chk段other_chk name="fill_chk.other_chk"

      #end add-point
      RETURN TRUE
   END IF

   #add-point:fill_chk段after_chk name="fill_chk.after_chk"

   #end add-point

   RETURN TRUE

END FUNCTION

{</section>}

{<section id="aint302.status_show" >}
PRIVATE FUNCTION aint302_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"

   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"

   #end add-point

   #add-point:status_show段status_show name="status_show.status_show"

   #end add-point
END FUNCTION

{</section>}

{<section id="aint302.mask_functions" >}
&include "erp/ain/aint302_mask.4gl"

{</section>}

{<section id="aint302.signature" >}
   #應用 a39 樣板自動產生(Version:10)
#+ BPM提交
PRIVATE FUNCTION aint302_send()
   #add-point:send段define(客製用) name="send.define_customerization"

   #end add-point
   #add-point:send段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="send.define"

   #end add-point

   #add-point:Function前置處理  name="send.pre_function"

   #end add-point

   #依據單據個數，需要指定所有單身條件為" 1=1"  (單身有幾個就要設幾個)
   LET g_wc2_table1 = " 1=1"


   CALL aint302_show()
   CALL aint302_set_pk_array()

   #add-point: 初始化的ADP name="send.before_send"
   #確認前檢核段
   IF NOT s_aint302_conf_chk(g_inba_m.inbadocno) THEN
      CLOSE aint302_cl
      CALL s_transaction_end('N','0')
      RETURN FALSE
   END IF

   #end add-point

   #公用變數初始化
   CALL cl_bpm_data_init()

   #依照主檔/單身個數產生 CALL cl_bpm_set_master_data() / cl_bpm_set_detail_data()
   #單頭固定為 CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(xxxx)) 傳入參數: (1)單頭陣列  ; 回傳值: 無
   CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(g_inba_m))

   #單身固定為 CALL cl_bpm_set_detail_data(s_detailX, util.JSONArray.fromFGL(xxxx)) 傳入參數: (1)單身SR名稱  (2)單身陣列  ; 回傳值: 無
   CALL cl_bpm_set_detail_data("s_detail1", util.JSONArray.fromFGL(g_inbb_d))


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
   #CALL aint302_ui_browser_refresh()

   #重新指定此筆單據資料狀態圖片=>送簽中
   LET g_browser[g_current_idx].b_statepic = "stus/16/signing.png"

   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL aint302_ui_headershow()
   CALL aint302_ui_detailshow()

   RETURN TRUE

END FUNCTION



#應用 a40 樣板自動產生(Version:9)
#+ BPM抽單
PRIVATE FUNCTION aint302_draw_out()
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
   CALL aint302_ui_headershow()
   CALL aint302_ui_detailshow()

   #add-point:Function後置處理  name="draw.after_function"

   #end add-point

   RETURN TRUE

END FUNCTION





{</section>}

{<section id="aint302.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION aint302_set_pk_array()
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
   LET g_pk_array[1].values = g_inba_m.inbadocno
   LET g_pk_array[1].column = 'inbadocno'


   #add-point:set_pk_array段之後 name="set_pk_array.after"

   #end add-point

END FUNCTION




{</section>}

{<section id="aint302.other_dialog" readonly="Y" >}


{</section>}

{<section id="aint302.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION aint302_msgcentre_notify(lc_state)
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
   CALL aint302_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_inba_m)

   #add-point:msgcentre其他通知 name="msgcentre_notify.process"

   #end add-point

   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()

END FUNCTION




{</section>}

{<section id="aint302.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION aint302_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"

   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"

   #end add-point

   #add-point:action_chk段action_chk name="action_chk.action_chk"
   #160818-00017#16-s
   SELECT inbastus INTO g_inba_m.inbastus FROM inba_t
    WHERE inbaent = g_enterprise
      AND inbasite = g_site
      AND inbadocno = g_inba_m.inbadocno
   IF (g_action_choice="modify" OR g_action_choice="delete" OR g_action_choice="modify_detail")  THEN
     LET g_errno = NULL
     CASE g_inba_m.inbastus
        WHEN 'W'
           LET g_errno = 'sub-01347'
        WHEN 'X'
           LET g_errno = 'sub-00229'
        WHEN 'Y'
           LET g_errno = 'sub-00178'
        WHEN 'S'
           LET g_errno = 'sub-00230'
        WHEN 'Z'
           LET g_errno = 'sub-01351'
     END CASE

     IF NOT cl_null(g_errno) THEN
        INITIALIZE g_errparam TO NULL
        LET g_errparam.code = g_errno
        LET g_errparam.extend = g_inba_m.inbadocno
        LET g_errparam.popup = TRUE
        CALL cl_err()
        LET g_errno = NULL
        CALL aint302_set_act_visible()
        CALL aint302_set_act_no_visible()
        CALL aint302_show()
        RETURN FALSE
     END IF
   END IF
   #160818-00017#16-e

   #end add-point

   RETURN TRUE

END FUNCTION

{</section>}

{<section id="aint302.other_function" readonly="Y" >}
#+
PRIVATE FUNCTION aint302_inbb009_chk()
DEFINE r_success   LIKE type_t.num5
DEFINE l_success   LIKE type_t.num5
DEFINE l_ooac001   LIKE ooac_t.ooac001
DEFINE l_ooac002   LIKE ooac_t.ooac002
DEFINE l_ooac004   LIKE ooac_t.ooac004
DEFINE l_flag      LIKE type_t.num5          #标识符，TRUE/FALSE
DEFINE l_flag1     LIKE type_t.num5          #标识符，TRUE/FALSE
DEFINE l_site      LIKE type_t.chr20
DEFINE l_inbadocno STRING
DEFINE l_n         LIKE type_t.num5
DEFINE l_imaf061   LIKE imaf_t.imaf061       #170220-00022#1

      LET l_flag = TRUE
      LET l_flag1 = TRUE
      LET l_ooac001 = NULL
      LET l_ooac002 = NULL

      LET r_success = TRUE

      IF cl_null(g_inbb_d[l_ac].inbb003) AND g_imaf055 <> '1'  AND NOT aint302_get_vmi() THEN  #160519-00008#1 add g_imaf055  #160815-00028#1 add
         LET g_inbb_d[l_ac].inbb003 = ' '
      END IF

      #若是雜項庫存發料作業時，輸入的料件+產品特徵+庫存管理特徵+庫位+儲位+批號必須存在[T:庫存明細檔]中
      #IF g_type = '1' THEN  #161109-00032#1
      IF g_type = '1' OR g_type = '3' THEN  #161109-00032#1
         IF cl_null(g_inbb_d[l_ac].inbb002) THEN
            LET g_inbb_d[l_ac].inbb002 = ' '
         END IF
         IF cl_null(g_inbb_d[l_ac].inbb003) AND g_imaf055 <> '1' AND NOT aint302_get_vmi() THEN  #160815-00028#1  add
            LET g_inbb_d[l_ac].inbb003 = ' '
         END IF
         IF cl_null(g_inbb_d[l_ac].inbb008) THEN
            LET g_inbb_d[l_ac].inbb008 = ' '
         END IF
         IF cl_null(g_inbb_d[l_ac].inbb009) THEN
            LET g_inbb_d[l_ac].inbb009 = ' '
         END IF
         #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
         INITIALIZE g_chkparam.* TO NULL

         #設定g_chkparam.*的參數
         LET g_chkparam.arg1 = g_site
         LET g_chkparam.arg2 = g_inbb_d[l_ac].inbb001
         LET g_chkparam.arg3 = g_inbb_d[l_ac].inbb002
         LET g_chkparam.arg4 = g_inbb_d[l_ac].inbb003
         LET g_chkparam.arg5 = g_inbb_d[l_ac].inbb007
         LET g_chkparam.arg6 = g_inbb_d[l_ac].inbb008
         LET g_chkparam.arg7 = g_inbb_d[l_ac].inbb009

         ##呼叫檢查存在並帶值的library
         #IF NOT cl_chk_exist("v_inag006") THEN
         #   LET r_success = FALSE
         #   RETURN r_success
         #END IF
      END IF

      #若是[P:雜項庫存收料維護作業]時，需檢核單據別參數的"庫存批號可重覆否"是否允許，
      #若勾選不允許則要檢查輸入的批號是否存在[T:料件批號檔]中
      #IF g_type = '2' THEN                 #161109-00032#1
      IF g_type = '2' OR g_type = '4' THEN  #161109-00032#1
         #ent+參照表號+單據別+參數編號(D-MFG-0012)抓ooac004的值
         IF NOT cl_null(g_inba_m.inbadocno) THEN
            #已經自動編號
            LET l_inbadocno = g_inba_m.inbadocno
            IF l_inbadocno.getLength() > 3 THEN
               CALL s_aooi200_get_slip(g_inba_m.inbadocno) RETURNING l_flag1,l_ooac002
               CALL cl_get_doc_para(g_enterprise,g_site,l_ooac002,'D-MFG-0012') RETURNING l_ooac004
            ELSE
               #未自動編號
               CALL cl_get_doc_para(g_enterprise,g_site,g_inba_m.inbadocno,'D-MFG-0012') RETURNING l_ooac004
            END IF
         END IF
         #170220-00022#1-S
         LET l_imaf061 = ''
         SELECT imaf061 INTO l_imaf061 FROM imaf_t
          WHERE imafent = g_enterprise
            AND imafsite = g_site
            AND imaf001 = g_inbb_d[l_ac].inbb001
         #170220-00022#1-E
         #IF l_ooac004 = 'N' THEN  #不允許重複
         IF l_ooac004 = 'N' AND l_imaf061 = '1' THEN   #170220-00022#1
            LET l_n = 0
            IF g_inbb_d[l_ac].inbb002 IS NOT NULL THEN
               SELECT COUNT(*) INTO l_n FROM inad_t
                 WHERE inadent = g_enterprise AND inadsite = g_site AND inad001 = g_inbb_d[l_ac].inbb001
                   AND inad002 = g_inbb_d[l_ac].inbb002 AND inad003 = g_inbb_d[l_ac].inbb009
            ELSE
               SELECT COUNT(*) INTO l_n FROM inad_t
                 WHERE inadent = g_enterprise AND inadsite = g_site AND inad001 = g_inbb_d[l_ac].inbb001
                   AND inad003 = g_inbb_d[l_ac].inbb009
            END IF
            IF l_n > 0 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'ain-00269'
               LET g_errparam.extend = g_inbb_d[l_ac].inbb009
               LET g_errparam.popup = TRUE
               CALL cl_err()

               LET r_success = FALSE
               RETURN r_success
            END IF
         END IF
      END IF

      RETURN r_success
END FUNCTION
#+
PRIVATE FUNCTION aint302_inbb010_ref(p_inbb010)
DEFINE p_inbb010      LIKE inbb_t.inbb010
DEFINE r_inbb010_desc LIKE oocal_t.oocal003

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = p_inbb010
      CALL ap_ref_array2(g_ref_fields,"SELECT oocal003 FROM oocal_t WHERE oocalent='"||g_enterprise||"' AND oocal001=? AND oocal002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET r_inbb010_desc =  g_rtn_fields[1]
      RETURN r_inbb010_desc

END FUNCTION
#獲取單據別參數判斷是否允許輸入小於0的數值
PRIVATE FUNCTION aint302_get_ooac004()
DEFINE l_ooac001   LIKE ooac_t.ooac001
DEFINE l_ooac002   LIKE ooac_t.ooac002
DEFINE r_ooac004   LIKE ooac_t.ooac004
DEFINE l_flag      LIKE type_t.num5          #标识符，TRUE/FALSE
DEFINE l_flag1     LIKE type_t.num5          #标识符，TRUE/FALSE
DEFINE l_site      LIKE type_t.chr20
DEFINE l_inbadocno STRING

      LET r_ooac004 = ''
      #ent+參照表號+單據別+參數編號(D-BAS-0058)抓ooac004的值
      IF NOT cl_null(g_inba_m.inbadocno) THEN
         #已經自動編號
         LET l_inbadocno = g_inba_m.inbadocno
         IF l_inbadocno.getLength() > 3 THEN
            CALL s_aooi200_get_site(g_inba_m.inbadocno) RETURNING l_flag,l_site
            IF l_flag THEN
               SELECT ooef004 INTO l_ooac001 FROM ooef_t
                WHERE ooef005 = l_site
                  AND ooefent = g_enterprise
            END IF
            CALL s_aooi200_get_slip(g_inba_m.inbadocno) RETURNING l_flag1,l_ooac002
            IF l_flag1 THEN
               IF NOT cl_null(l_ooac001) AND NOT cl_null(l_ooac002) THEN
                  #ent+參照表號+單據別+參數編號(D-BAS-0058)抓ooac004的值
                  SELECT ooac004 INTO r_ooac004 FROM ooac_t WHERE ooacent = g_enterprise AND ooac001 = l_ooac001 AND ooac002 = l_ooac002 AND ooac003 = 'D-BAS-0058'
               END IF
            END IF
         ELSE
            #未自動編號
            SELECT ooef004 INTO l_ooac001 FROM ooef_t WHERE ooef001 = g_site AND ooefent = g_enterprise
            #ent+參照表號+單據別+參數編號(D-BAS-0058)抓ooac004的值
            SELECT ooac004 INTO r_ooac004 FROM ooac_t WHERE ooacent = g_enterprise AND ooac001 = l_ooac001 AND ooac002 = g_inba_m.inbadocno AND ooac003 = 'D-BAS-00582'
         END IF
      END IF
      RETURN r_ooac004

END FUNCTION
#+
PRIVATE FUNCTION aint302_inbb001_desc(p_inbb001)
DEFINE p_inbb001      LIKE inbb_t.inbb001
DEFINE r_imaal003     LIKE imaal_t.imaal003
DEFINE r_imaal004     LIKE imaal_t.imaal004

       LET r_imaal003 = ''
       LET r_imaal004 = ''

       #品名、規格
       SELECT imaal003,imaal004 INTO r_imaal003,r_imaal004 FROM imaal_t WHERE imaalent = g_enterprise AND imaal001 = p_inbb001 AND imaal002 = g_dlang

       RETURN r_imaal003,r_imaal004
END FUNCTION
#+
PRIVATE FUNCTION aint302_inba003_ref(p_inba003)
DEFINE p_inba003      LIKE inba_t.inba003
DEFINE r_inba003_desc LIKE oofa_t.oofa011

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = p_inba003
      CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
      LET r_inba003_desc = '', g_rtn_fields[1] , ''
      RETURN r_inba003_desc

END FUNCTION
#+
PRIVATE FUNCTION aint302_inba004_ref(p_inba004)
DEFINE p_inba004      LIKE inba_t.inba004
DEFINE r_inba004_desc LIKE ooefl_t.ooefl003

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = p_inba004
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET r_inba004_desc = '', g_rtn_fields[1] , ''
            RETURN r_inba004_desc

END FUNCTION
#檢查理由嗎
PRIVATE FUNCTION aint302_inba007_chk(p_inba007)
DEFINE p_inba007  LIKE inba_t.inba007
DEFINE l_success  LIKE type_t.num5
DEFINE r_success  LIKE type_t.num5
DEFINE l_flag     LIKE type_t.num5

      LET r_success = TRUE
      IF l_ac > 0 THEN
         IF cl_null(g_inbb_d[l_ac].inbb003) AND g_imaf055 <> '1' AND NOT aint302_get_vmi() THEN  #160815-00028#1 add
            LET g_inbb_d[l_ac].inbb003 = ' '
         END IF
      END IF
      #1.抓取[T:系統分類值檔].[C:系統分類碼]=24且[T:系統分類值檔].[C:系統分類碼]=g_prog 的[T:系統分類值檔].[C:參考欄位二]的欄位值
      IF NOT s_azzi650_chk_exist(g_acc,p_inba007) THEN
         LET r_success = FALSE
         RETURN r_success
      END IF
      CALL s_control_chk_doc('8',g_inba_m.inbadocno,p_inba007,'','','','') RETURNING l_success,l_flag
      IF NOT l_success THEN
         LET r_success = FALSE
         RETURN r_success
      ELSE
         IF NOT l_flag THEN
            LET r_success = FALSE
            RETURN r_success
         END IF
      END IF

      RETURN r_success

END FUNCTION
#+
PRIVATE FUNCTION aint302_inba007_ref(p_inba007)
DEFINE p_inba007      LIKE inba_t.inba007
DEFINE r_inba007_desc LIKE oocql_t.oocql004

      #抓取[T:系統分類值檔].[C:系統分類碼]=24且[T:系統分類值檔].[C:系統分類碼]=g_prog 的[T:系統分類值檔].[C:參考欄位二]的欄位值

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = p_inba007
      CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='"||g_acc||"' AND oocql002 = ? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET r_inba007_desc = '', g_rtn_fields[1] , ''
      RETURN r_inba007_desc

END FUNCTION
#+
PRIVATE FUNCTION aint302_inbb001_chk(p_inbb001)
DEFINE p_inbb001   LIKE inbb_t.inbb001
DEFINE r_success   LIKE type_t.num5
DEFINE l_success  LIKE type_t.num5
DEFINE l_flag     LIKE type_t.num5

      LET r_success = TRUE

      #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
      INITIALIZE g_chkparam.* TO NULL

      #設定g_chkparam.*的參數
      LET g_chkparam.arg1 = p_inbb001

      #呼叫檢查存在並帶值的library
      IF NOT cl_chk_exist("v_imaf001_14") THEN
         LET r_success = FALSE
         RETURN r_success
      END IF

      #呼叫s_control_doc_chk('4',inbbdocno,inbb001,'','','','')應用元件，
      #檢核輸入的料件的生命週期是否在單據別限制範圍內，若不在限制內則不允許雜收此料
      CALL s_control_chk_doc('4',g_inba_m.inbadocno,p_inbb001,'','','','') RETURNING l_success,l_flag
      IF NOT l_success THEN
         LET r_success = FALSE
         RETURN r_success
      ELSE
         IF NOT l_flag THEN
            #CALL cl_err(p_inbb001,'ain-00015',1)
            LET r_success = FALSE
            RETURN r_success
         END IF
      END IF

      #呼叫s_control_doc_chk('5',inbbdocno,inbb004,'','','','')應用元件，
      #檢核輸入的料件的產品分類是否在單據別限制範圍內，若不在限制內則不允許雜收此料
      CALL s_control_chk_doc('5',g_inba_m.inbadocno,p_inbb001,'','','','') RETURNING l_success,l_flag
      IF NOT l_success THEN
         LET r_success = FALSE
         RETURN r_success
      ELSE
         IF NOT l_flag THEN
            #CALL cl_err(p_inbb001,'apm-00238',1)
            LET r_success = FALSE
            RETURN r_success
         END IF
      END IF

      #帶舊值
      IF NOT r_success THEN
         CALL aint302_inbb001_ref(g_inbb_d_o.inbb001)
      END IF

      #[C:庫位]有值時，需呼叫應用元件取得該庫位是否有設置在庫存控制組中，
      #若有時需判斷該控制組是否與其他項次的庫位所對應的控制組一樣
      #若不一樣則需訊息告知，並將游標跳到[C:庫位]欄位供修改
      IF NOT cl_null(g_inbb_d[l_ac].inbb007) AND l_ac > 1 THEN

      END IF

      RETURN r_success
END FUNCTION
#+
PRIVATE FUNCTION aint302_inbb001_ref(p_inbb001)
DEFINE p_inbb001      LIKE inbb_t.inbb001


       LET g_inbb_d[l_ac].inbb001_desc = ''
       LET g_inbb_d[l_ac].imaal004 = ''
       LET g_inbb_d[l_ac].inbb004 = ''
       LET g_inbb_d[l_ac].inbb007 = ''
       LET g_inbb_d[l_ac].inbb008 = ''
       LET g_inbb_d[l_ac].inbb010 = ''
       LET g_inbb_d[l_ac].inbb013 = ''
       #品名、規格
       SELECT imaal003,imaal004 INTO g_inbb_d[l_ac].inbb001_desc,g_inbb_d[l_ac].imaal004 FROM imaal_t WHERE imaalent = g_enterprise AND imaal001 = p_inbb001 AND imaal002 = g_dlang

       #單位
       SELECT imaa006 INTO g_inbb_d[l_ac].inbb010 FROM imaa_t WHERE imaaent = g_enterprise AND imaa001 = p_inbb001

       #參考單位、庫位、儲位、包裝容器
       SELECT imaf015,imaf091,imaf092,imaf123
          INTO g_inbb_d[l_ac].inbb013,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008,g_inbb_d[l_ac].inbb004
          FROM imaf_t WHERE imafent = g_enterprise AND imafsite = g_site AND imaf001 = p_inbb001

       LET g_inbb_d_o.inbb007 = g_inbb_d[l_ac].inbb007  #170605-00020#2 add
       IF cl_null(g_inbb_d[l_ac].inbb008) THEN
           LET g_inbb_d[l_ac].inbb008 = ' '
       END IF
       #LET g_inbb_d_o.inbb007 = g_inbb_d[l_ac].inbb007    #170314-00104#1 mark

       CALL s_desc_get_stock_desc(g_site,g_inbb_d[l_ac].inbb007) RETURNING g_inbb_d[l_ac].inbb007_desc
       #DISPLAY BY NAME g_inbb_d[l_ac].inbb007_desc  #170526-00058#1 mark

       CALL s_desc_get_locator_desc(g_site,g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008) RETURNING g_inbb_d[l_ac].inbb008_desc
       #DISPLAY BY NAME g_inbb_d[l_ac].inbb008_desc  #170526-00058#1 mark

       CALL aint302_inbb010_ref(g_inbb_d[l_ac].inbb010) RETURNING g_inbb_d[l_ac].inbb010_desc
       #DISPLAY BY NAME g_inbb_d[l_ac].inbb010_desc  #170526-00058#1 mark

       CALL aint302_inbb010_ref(g_inbb_d[l_ac].inbb013) RETURNING g_inbb_d[l_ac].inbb013_desc
       #DISPLAY BY NAME g_inbb_d[l_ac].inbb013_desc  #170526-00058#1 mark

END FUNCTION
#+
PRIVATE FUNCTION aint302_set_required_b()
   DEFINE l_imaf055  LIKE imaf_t.imaf055
   DEFINE l_imaf056  LIKE imaf_t.imaf056
   DEFINE l_imaf061  LIKE imaf_t.imaf061   #161027-00033#1 add
   DEFINE l_imaf062  LIKE imaf_t.imaf062   #161027-00033#1 add
   IF l_ac > 0 THEN #160815-00028#1
      #170330-00018#1--mark--start--
      ##SELECT imaf055,imaf056 INTO l_imaf055,l_imaf056 FROM imaf_t WHERE imafent = g_enterprise AND imafsite = g_site AND imaf001 = g_inbb_d[l_ac].inbb001   #161027-00033#1 mark
      ##161027-00033#1 add---start---
      #SELECT imaf055,imaf056,imaf061,imaf062
      #  INTO l_imaf055,l_imaf056,l_imaf061,l_imaf062
      #  FROM imaf_t
      # WHERE imafent = g_enterprise AND imafsite = g_site AND imaf001 = g_inbb_d[l_ac].inbb001
      ##161027-00033#1 add---end---
      #
      #
      ##若設定imaf055(庫存管理特徵)等於'1.必須有庫存管理特徵'時，則[C:庫存管理特徵]欄位必須輸入
      #IF l_imaf055 = '1' THEN
      #   CALL cl_set_comp_required("inbb003",TRUE)
      #   #160815-00028#1-s
      #   IF cl_null(g_inbb_d[l_ac].inbb003) THEN
      #      LET g_inbb_d[l_ac].inbb003 = ''
      #   END IF
      #   #160815-00028#1-e
      ##161007-00012#3-s-add
      #ELSE
      #   #撥出/入庫位
      #   IF g_inbb007_type = '1' THEN
      #      CALL cl_set_comp_required('inbb003',TRUE)
      #      IF cl_null(g_inbb_d[l_ac].inbb003) THEN
      #         LET g_inbb_d[l_ac].inbb003 = ''
      #      END IF
      #   ELSE
      #      IF cl_null(g_inbb_d[l_ac].inbb003) THEN
      #         LET g_inbb_d[l_ac].inbb003 = ' '
      #      END IF
      #   END IF
      ##161007-00012#3-e-add
      #END IF
      ##161027-00033#1 add---end---
      #170330-00018#1--mark--end----
#160815-00028#1-s
      IF aint302_get_vmi()  THEN  #VMI存貨庫位Tag 庫存管理特徵必輸

         CALL cl_set_comp_required("inbb003",TRUE)

         IF cl_null(g_inbb_d[l_ac].inbb003) THEN
            LET g_inbb_d[l_ac].inbb003 = ''
         END IF
      END IF
   END IF
#160815-00028#1-e

END FUNCTION
#+
PRIVATE FUNCTION aint302_inbb007_chk(p_inbb007)
DEFINE p_inbb007   LIKE inbb_t.inbb007
DEFINE r_success   LIKE type_t.num5
DEFINE l_success  LIKE type_t.num5
DEFINE l_flag     LIKE type_t.num5

      LET r_success = TRUE
     #170605-00020#2-S add
      #库位有值才做检核
      IF cl_null(p_inbb007) THEN
         RETURN r_success
      END IF
     #170605-00020#2-E add

      #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
      INITIALIZE g_chkparam.* TO NULL

      #呼叫檢查存在並帶值的library
      #IF g_type = '1' THEN   #160127-00007#1 mark
         #設定g_chkparam.*的參數
         LET g_chkparam.arg1 = g_site
         LET g_chkparam.arg2 = p_inbb007
         #160318-00025#19  by 07900 --add-str
         LET g_errshow = TRUE #是否開窗
         LET g_chkparam.err_str[1] ="aim-00065:sub-01302|aini001|",cl_get_progname("aini001",g_lang,"2"),"|:EXEPROGaini001"
         #160318-00025#19  by 07900 --add-end
         IF NOT cl_chk_exist("v_inaa001") THEN
            LET r_success = FALSE
            RETURN r_success
         END IF
      #END IF   #160127-00007#1 mark

      #所有單據都無需過濾是否為報廢庫
      ##雜收需過濾非報廢庫位
      #IF g_type = '2' THEN
      #   #設定g_chkparam.*的參數
      #   LET g_chkparam.arg1 = p_inbb007
      #
      #   IF NOT cl_chk_exist("v_inaa001_9") THEN
      #      LET r_success = FALSE
      #      RETURN r_success
      #   END IF
      #END IF

      #呼叫s_control_doc_chk('6',inbbdocno,inbb007,'','','','')應用元件，
      #檢核輸入的庫位是否在單據別限制範圍內，若不在限制內則不允許使用此庫位
      CALL s_control_chk_doc('6',g_inba_m.inbadocno,p_inbb007,'','','','') RETURNING l_success,l_flag
      IF NOT l_success THEN
         LET r_success = FALSE
         RETURN r_success
      ELSE
         IF NOT l_flag THEN
            LET r_success = FALSE
            RETURN r_success
         END IF
      END IF

     #170104-00028#1-S 秋鳳要求此控管放在过账段
#     #160906-00025#1-s  (之前此段被mark)
#     #檢查庫位是否在庫存控制組範圍內
#     CALL s_control_chk_group('6','5',g_user,g_dept,g_site,p_inbb007,'','','') RETURNING l_success,l_flag
#     IF NOT l_success THEN
#        LET r_success = FALSE
#        RETURN r_success
#     ELSE
#        IF NOT l_flag THEN
#           #CALL cl_err(p_inbb007,'ain-00273',1)   #160906-00025#1 mark
#           INITIALIZE g_errparam TO NULL
#           LET g_errparam.code = 'ain-00273'
#           LET g_errparam.extend = p_inbb007
#           LET g_errparam.popup = TRUE
#           CALL cl_err()
#           LET r_success = FALSE
#           RETURN r_success
#        END IF
#     END IF
#     #160906-00025#1-e
     #170104-00028#1-E
      #檢查當前庫位與單身中的其他項次對應的庫位是否存在相同的控制組
      IF NOT aint302_inbb007_chk_group(p_inbb007) THEN
         LET r_success = FALSE
         RETURN r_success
      END IF

      #若是雜項庫存發料作業時，輸入的料件+產品特徵+庫存管理特徵+庫位必須存在[T:庫存明細檔]中
      IF g_type = '1' THEN
         #IF NOT aint302_chk_inag004(p_inbb007)THEN
         #   LET r_success = FALSE
         #   RETURN r_success
         #END IF
      END IF

      RETURN r_success

END FUNCTION
#+
PRIVATE FUNCTION aint302_inbb008_chk(p_inbb007,p_inbb008)
DEFINE p_inbb007   LIKE inbb_t.inbb007
DEFINE p_inbb008   LIKE inbb_t.inbb008
DEFINE r_success   LIKE type_t.num5
DEFINE l_success   LIKE type_t.num5
DEFINE l_flag      LIKE type_t.num5
DEFINE l_inaa007   LIKE inaa_t.inaa007

      LET r_success = TRUE

      #170818-00009#1-S
      IF cl_null(p_inbb007) THEN
         RETURN r_success
      END IF
      SELECT inaa007 INTO l_inaa007 FROM inaa_t
       WHERE inaaent = g_enterprise
         AND inaa001 = p_inbb007
         AND inaasite = g_site
      IF l_inaa007 = '5' THEN
      #170818-00009#1-E
         IF cl_null(p_inbb008) THEN
            LET p_inbb008 = ' '
         END IF
      END IF  #170818-00009#1 add
      IF cl_null(g_inbb_d[l_ac].inbb003) AND g_imaf055 <> '1' AND NOT aint302_get_vmi() THEN   #160815-00028#1 add NOT aint302_get_vmi()
         LET g_inbb_d[l_ac].inbb003 = ' '
      END IF

      #若是雜項庫存發料作業時，輸入的料件+產品特徵+庫存管理特徵+庫位必須存在[T:庫存明細檔]中
      IF g_type = '1' THEN
         #IF NOT aint302_chk_inag005(p_inbb007,p_inbb008) THEN
         #   LET r_success = FALSE
         #   RETURN r_success
         #END IF
      END IF

      #若是雜項庫存收料作業時
      #IF g_type = '2' THEN     #170818-00009#1 mark
      IF l_inaa007 = '1' THEN   #170818-00009#1 add
         #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
         INITIALIZE g_chkparam.* TO NULL

         #設定g_chkparam.*的參數
         LET g_chkparam.arg1 = g_site
         LET g_chkparam.arg2 = p_inbb007
         LET g_chkparam.arg3 = p_inbb008
         #160318-00025#19  by 07900 --add-str
         LET g_errshow = TRUE #是否開窗
         LET g_chkparam.err_str[1] ="aim-00063:sub-01302|aini002|",cl_get_progname("aini002",g_lang,"2"),"|:EXEPROGaini002"
         #160318-00025#19  by 07900 --add-end
         #呼叫檢查存在並帶值的library
         IF NOT cl_chk_exist("v_inab002") THEN
            LET r_success = FALSE
            RETURN r_success
         END IF
      END IF

      #呼叫s_control_doc_chk('6',inbbdocno,inbb007,inbb008,'','','')應用元件，
      #檢核輸入的庫位是否在單據別限制範圍內，若不在限制內則不允許使用此庫位
      CALL s_control_chk_doc('6',g_inba_m.inbadocno,p_inbb007,p_inbb008,'','','') RETURNING l_success,l_flag
      IF NOT l_success THEN
         LET r_success = FALSE
         RETURN r_success
      ELSE
         IF NOT l_flag THEN
            LET r_success = FALSE
            RETURN r_success
         END IF
      END IF

      RETURN r_success

END FUNCTION
#+
PRIVATE FUNCTION aint302_ins_inbc()
DEFINE l_inbc016    LIKE inbc_t.inbc016
DEFINE l_imaf032    LIKE imaf_t.imaf032
DEFINE r_success    LIKE type_t.num5

      LET r_success = TRUE
      #如果料件有做批號控管時，則[C:有效日期]=g_today+[T:料件集團檔].[C:有效天數]
      LET l_inbc016 = g_today

      SELECT imaf032 INTO l_imaf032 FROM imaf_t WHERE imafent = g_enterprise AND imafsite = 'ALL' AND imaf001 = g_inbb_d[g_detail_idx].inbb001
      IF NOT cl_null(l_imaf032) THEN
         LET l_inbc016 = l_inbc016 + l_imaf032
      END IF
      #161006-00018#31-S
      IF cl_null(g_inbb_d[l_ac].inbb007) THEN
         LET g_inbb_d[l_ac].inbb008 = ''
      END IF
      #161006-00018#31-E
      #160512-00004#2-add-'inbc203','g_inbb_d[l_ac].inbb204'
      INSERT INTO inbc_t
                  (inbcent, inbcsite,
                   inbcdocno,inbcseq,inbcseq1,
                   inbc001,inbc002,inbc003,inbc004,inbc005,inbc006,inbc007,
                   inbc009,inbc010,inbc011,inbc015,inbc203,inbc016,inbc017,inbc021,inbc022,inbc023)
            VALUES(g_enterprise, g_site,
                   g_inba_m.inbadocno,g_inbb_d[l_ac].inbbseq,1,
                   g_inbb_d[l_ac].inbb001,g_inbb_d[l_ac].inbb002,g_inbb_d[l_ac].inbb003,g_inbb_d[l_ac].inbb004,
                   g_inbb_d[l_ac].inbb007,g_inbb_d[l_ac].inbb008,g_inbb_d[l_ac].inbb009,
                   g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb011,g_inbb_d[l_ac].inbb013,
                   g_inbb_d[l_ac].inbb015,g_inbb_d[l_ac].inbb204,g_inbb_d[l_ac].inbb022,g_inbb_d[l_ac].inbb021,
                   g_inbb_d[l_ac].inbb023,g_inbb_d[l_ac].inbb024,g_inbb_d[l_ac].inbb025)


      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "inbc_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF
      RETURN r_success

END FUNCTION
#+
PRIVATE FUNCTION aint302_upd_inbc()
DEFINE r_success LIKE type_t.num5

      LET r_success = TRUE
      #160127-00014#1 add by lixh 20160217
      IF g_inbb_d[l_ac].inbb018 = 'Y' THEN
         RETURN r_success
      END IF
      #160127-00014#1 add by lixh 20160217
      #1.修改時若有修改到料號、產品特徵、庫存管理特徵、庫位、限定儲位、限定批號、申請數量、
      #  參考單位申請數量時，則需將所有對應的[T:雜項庫存異動庫儲批明細檔]資料刪除，
      #  併重新產生一筆新的[T:雜項庫存異動庫儲批明細檔]資料，欄位預設原則與新增狀態一樣
      IF ((g_inbb_d[l_ac].inbb001 != g_inbb_d_t.inbb001) OR ((NOT cl_null(g_inbb_d[l_ac].inbb001)) AND cl_null(g_inbb_d_t.inbb001)) OR ((NOT cl_null(g_inbb_d_t.inbb001)) AND cl_null(g_inbb_d[l_ac].inbb001))) OR
         ((g_inbb_d[l_ac].inbb002 != g_inbb_d_t.inbb002) OR ((NOT cl_null(g_inbb_d[l_ac].inbb002)) AND cl_null(g_inbb_d_t.inbb002)) OR ((NOT cl_null(g_inbb_d_t.inbb002)) AND cl_null(g_inbb_d[l_ac].inbb002))) OR
         ((g_inbb_d[l_ac].inbb003 != g_inbb_d_t.inbb003) OR ((NOT cl_null(g_inbb_d[l_ac].inbb003)) AND cl_null(g_inbb_d_t.inbb003)) OR ((NOT cl_null(g_inbb_d_t.inbb003)) AND cl_null(g_inbb_d[l_ac].inbb003))) OR
         ((g_inbb_d[l_ac].inbb007 != g_inbb_d_t.inbb007) OR ((NOT cl_null(g_inbb_d[l_ac].inbb007)) AND cl_null(g_inbb_d_t.inbb007)) OR ((NOT cl_null(g_inbb_d_t.inbb007)) AND cl_null(g_inbb_d[l_ac].inbb007))) OR
         ((g_inbb_d[l_ac].inbb008 != g_inbb_d_t.inbb008) OR ((NOT cl_null(g_inbb_d[l_ac].inbb008)) AND cl_null(g_inbb_d_t.inbb008)) OR ((NOT cl_null(g_inbb_d_t.inbb008)) AND cl_null(g_inbb_d[l_ac].inbb008))) OR
         ((g_inbb_d[l_ac].inbb009 != g_inbb_d_t.inbb009) OR ((NOT cl_null(g_inbb_d[l_ac].inbb009)) AND cl_null(g_inbb_d_t.inbb009)) OR ((NOT cl_null(g_inbb_d_t.inbb009)) AND cl_null(g_inbb_d[l_ac].inbb009))) OR
         ((g_inbb_d[l_ac].inbb011 != g_inbb_d_t.inbb011) OR ((NOT cl_null(g_inbb_d[l_ac].inbb011)) AND cl_null(g_inbb_d_t.inbb011)) OR ((NOT cl_null(g_inbb_d_t.inbb011)) AND cl_null(g_inbb_d[l_ac].inbb011))) OR
         ((g_inbb_d[l_ac].inbb014 != g_inbb_d_t.inbb014) OR ((NOT cl_null(g_inbb_d[l_ac].inbb014)) AND cl_null(g_inbb_d_t.inbb014)) OR ((NOT cl_null(g_inbb_d_t.inbb014)) AND cl_null(g_inbb_d[l_ac].inbb014))) OR
         ((g_inbb_d[l_ac].inbb023 != g_inbb_d_t.inbb023) OR ((NOT cl_null(g_inbb_d[l_ac].inbb023)) AND cl_null(g_inbb_d_t.inbb023)) OR ((NOT cl_null(g_inbb_d_t.inbb023)) AND cl_null(g_inbb_d[l_ac].inbb023))) OR  #170706-00060#1 add
         ((g_inbb_d[l_ac].inbb024 != g_inbb_d_t.inbb024) OR ((NOT cl_null(g_inbb_d[l_ac].inbb024)) AND cl_null(g_inbb_d_t.inbb024)) OR ((NOT cl_null(g_inbb_d_t.inbb024)) AND cl_null(g_inbb_d[l_ac].inbb024))) OR  #170706-00060#1 add
         ((g_inbb_d[l_ac].inbb025 != g_inbb_d_t.inbb025) OR ((NOT cl_null(g_inbb_d[l_ac].inbb025)) AND cl_null(g_inbb_d_t.inbb025)) OR ((NOT cl_null(g_inbb_d_t.inbb025)) AND cl_null(g_inbb_d[l_ac].inbb025))) OR  #170706-00060#1 add
         (g_inbb_d[l_ac].inbb018 != g_inbb_d_t.inbb018) THEN  #160127-00014#1 add by lixh 20160217

         IF NOT aint302_del_inbc() THEN
            LET r_success = FALSE
            RETURN r_success
         ELSE
            IF NOT aint302_ins_inbc() THEN
               LET r_success = FALSE
               RETURN r_success
            END IF
         END IF
      END IF

      #2.修改時若有修改到單位、參考單位時，需同步更新[T:雜項庫存異動庫儲批明細檔]相對的欄位值
      IF ((g_inbb_d[l_ac].inbb010 != g_inbb_d_t.inbb010) OR ((NOT cl_null(g_inbb_d[l_ac].inbb010)) AND cl_null(g_inbb_d_t.inbb010)) OR ((NOT cl_null(g_inbb_d_t.inbb010)) AND cl_null(g_inbb_d[l_ac].inbb010))) OR
         ((g_inbb_d[l_ac].inbb013 != g_inbb_d_t.inbb013) OR ((NOT cl_null(g_inbb_d[l_ac].inbb013)) AND cl_null(g_inbb_d_t.inbb013)) OR ((NOT cl_null(g_inbb_d_t.inbb013)) AND cl_null(g_inbb_d[l_ac].inbb013))) THEN

         UPDATE inbc_t
            SET (inbc009,inbc011) = (g_inbb_d[l_ac].inbb010,g_inbb_d[l_ac].inbb013)
              WHERE inbcent = g_enterprise AND inbcsite = g_site
                AND inbcdocno = g_inba_m.inbadocno
                AND inbcseq = g_inbb_d_t.inbbseq #項次
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = ""
            LET g_errparam.popup = FALSE
            CALL cl_err()

            LET r_success = FALSE
            RETURN r_success
         END IF
      END IF

      #3.若有修改到存貨備註時，需開窗詢問是否同步更新[T:雜項庫存異動庫儲批明細檔].[C:存貨備註]
      IF ((g_inbb_d[l_ac].inbb021 != g_inbb_d_t.inbb021) OR ((NOT cl_null(g_inbb_d[l_ac].inbb021)) AND cl_null(g_inbb_d_t.inbb021)) OR ((NOT cl_null(g_inbb_d_t.inbb021)) AND cl_null(g_inbb_d[l_ac].inbb021))) THEN
         IF cl_ask_confirm('ain-00021') THEN
            UPDATE inbc_t SET inbc017 = g_inbb_d[l_ac].inbb021
              WHERE inbcent = g_enterprise AND inbcsite = g_site
                AND inbcdocno = g_inba_m.inbadocno
                AND inbcseq = g_inbb_d_t.inbbseq #項次
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = ""
            LET g_errparam.popup = FALSE
            CALL cl_err()

               LET r_success = FALSE
               RETURN r_success
            END IF
         END IF
      END IF

      #170325-00093#1 add s
      #4.若有修改到製造日期、有效日期，需同步更新[T:雜項庫存異動庫儲批明細檔]
      IF ((g_inbb_d[l_ac].inbb204 != g_inbb_d_t.inbb204) OR ((NOT cl_null(g_inbb_d[l_ac].inbb204)) AND cl_null(g_inbb_d_t.inbb204)) OR ((NOT cl_null(g_inbb_d_t.inbb204)) AND cl_null(g_inbb_d[l_ac].inbb204))) THEN
         UPDATE inbc_t SET inbc203 = g_inbb_d[l_ac].inbb204
           WHERE inbcent = g_enterprise AND inbcsite = g_site
             AND inbcdocno = g_inba_m.inbadocno
             AND inbcseq = g_inbb_d_t.inbbseq #項次
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = ""
            LET g_errparam.popup = FALSE
            CALL cl_err()

            LET r_success = FALSE
            RETURN r_success
         END IF
      END IF

      IF ((g_inbb_d[l_ac].inbb022 != g_inbb_d_t.inbb022) OR ((NOT cl_null(g_inbb_d[l_ac].inbb022)) AND cl_null(g_inbb_d_t.inbb022)) OR ((NOT cl_null(g_inbb_d_t.inbb022)) AND cl_null(g_inbb_d[l_ac].inbb022))) THEN
         UPDATE inbc_t SET inbc016 = g_inbb_d[l_ac].inbb022
           WHERE inbcent = g_enterprise AND inbcsite = g_site
             AND inbcdocno = g_inba_m.inbadocno
             AND inbcseq = g_inbb_d_t.inbbseq #項次
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = ""
            LET g_errparam.popup = FALSE
            CALL cl_err()

            LET r_success = FALSE
            RETURN r_success
         END IF
      END IF
      #170325-00093#1 add e

      RETURN r_success
END FUNCTION
#+
PRIVATE FUNCTION aint302_del_inbc()
DEFINE r_success  LIKE type_t.num5
DEFINE l_cnt      LIKE type_t.num5

       LET r_success = TRUE
       #160127-00014#1 add by lixh 20160217
       LET l_cnt = 0
       SELECT COUNT(*) INTO l_cnt FROM inbc_t
        WHERE inbcent = g_enterprise
          AND inbcdocno = g_inba_m.inbadocno
          AND inbcseq = g_inbb_d_t.inbbseq #項次
       #160127-00014#1 add by lixh 20160217
       IF l_cnt > 0 THEN   #160127-00014#1 add by lixh 20160217
          DELETE FROM inbc_t
              WHERE inbcent = g_enterprise AND inbcsite = g_site
                AND inbcdocno = g_inba_m.inbadocno
                AND inbcseq = g_inbb_d_t.inbbseq #項次
          IF SQLCA.sqlcode THEN
             INITIALIZE g_errparam TO NULL
             LET g_errparam.code = SQLCA.sqlcode
             LET g_errparam.extend = ""
             LET g_errparam.popup = FALSE
             CALL cl_err()

             LET r_success = FALSE
             RETURN r_success
          END IF
      END IF  #160127-00014#1 add by lixh 20160217
      RETURN r_success

END FUNCTION
#+
PRIVATE FUNCTION aint302_del_inao()
DEFINE r_success  LIKE type_t.num5

   LET r_success = TRUE

   DELETE FROM inao_t
       WHERE inaoent = g_enterprise AND inaosite = g_site
         AND inaodocno = g_inba_m.inbadocno
         AND inaoseq = g_inbb_d_t.inbbseq #項次
     IF SQLCA.sqlcode THEN
        INITIALIZE g_errparam TO NULL
        LET g_errparam.code = SQLCA.sqlcode
        LET g_errparam.extend = ""
        LET g_errparam.popup = FALSE
        CALL cl_err()

        LET r_success = FALSE
        RETURN r_success
     END IF


     RETURN r_success

END FUNCTION
#+
PRIVATE FUNCTION aint302_inbc_fill(p_inbbseq)
DEFINE p_inbbseq   LIKE inbb_t.inbbseq
DEFINE l_ac1       LIKE type_t.num5
DEFINE l_success   LIKE type_t.num5

   CALL g_inbc_d.clear()


   #LET g_sql = "SELECT  UNIQUE inbcseq,inbcseq1,inbc018,inbc019,inbc020,'',inbc001,'','',inbc002,inbc004,inbc003,inbc005,",
   #            "               inbc006,inbc007,inbc009,inbc010,inbc011,inbc015,inbc016,inbc017 ",
   #            "  FROM inbc_t ",
   #            " INNER JOIN inba_t ON inbadocno = inbcdocno AND inbaent = inbcent AND inbasite = inbcsite ",
   #
   #            " WHERE inbcent=? AND inbcsite=? AND inbcdocno=?"
   #
   #IF NOT cl_null(g_wc2_table1) THEN
   #   LET g_sql = g_sql CLIPPED, " AND inbcseq IN ( SELECT inbbseq FROM inbb_t WHERE inbbent='",g_enterprise,"' AND inbbsite='",g_site,"' AND inbbdocno='",g_inba_m.inbadocno,"' AND ", g_wc2_table1 CLIPPED, " ) "
   #END IF
   #
   #IF NOT cl_null(p_inbbseq) THEN
   #   LET g_sql = g_sql CLIPPED, " AND inbcseq = '",p_inbbseq,"' "
   #END IF
   #LET g_sql = g_sql, " ORDER BY inbc_t.inbcseq,inbcseq1"

   LET g_sql = "SELECT * FROM ",
               " ( SELECT  UNIQUE inbcseq,inbcseq1,inbc018,inbc019,inbc020,inbc001,inbc002,inbc004,inbc003,inbc005, ",
               #160512-00004#2-mod-(S)
#               "          inbc006,inbc007,inbc009,inbc010,inbc011,inbc015,inbc016,inbc017,inbc021,inbc022,inbc023,t1.qcaol004,t2.imaal003,t3.imaal004,t4.oocal001,t5.oocal001 oocal001_1,t6.inayl003,t7.inab003, ",
               "          inbc006,inbc007,inbc009,inbc010,inbc011,inbc015,inbc203,inbc016,inbc017,inbc021,inbc022,inbc023,t1.qcaol004,t2.imaal003,t3.imaal004,t4.oocal001,t5.oocal001 oocal001_1,t6.inayl003,t7.inab003, ",
               #160512-00004#2-mod-(E)
               "          t8.pjbal003,t9.pjbbl004,t10.pjbml004 ",
               "          ,t11.inaml004 ",  #161223-00013#1 add
               "    FROM inbc_t ",
               "     LEFT JOIN qcaol_t t1 ON t1.qcaolent='"||g_enterprise||"' AND t1.qcaol001='"||g_ooef025||"' AND t1.qcaol002=inbc020 AND t1.qcaol003='"||g_dlang||"' ",
               "     LEFT JOIN imaal_t t2 ON t2.imaalent='"||g_enterprise||"' AND t2.imaal001=inbc001 AND t2.imaal002='"||g_dlang||"' ",
               "     LEFT JOIN imaal_t t3 ON t3.imaalent='"||g_enterprise||"' AND t3.imaal001=inbc001 AND t3.imaal002='"||g_dlang||"' ",
               "     LEFT JOIN oocal_t t4 ON t4.oocalent='"||g_enterprise||"' AND t4.oocal001=inbc009 AND t4.oocal002='"||g_dlang||"' ",
               "     LEFT JOIN oocal_t t5 ON t5.oocalent='"||g_enterprise||"' AND t5.oocal001=inbc011 AND t5.oocal002='"||g_dlang||"' ",
               "     LEFT JOIN inayl_t t6 ON t6.inaylent='"||g_enterprise||"' AND t6.inayl001=inbc005 AND t6.inayl002='"||g_dlang||"' ",
               "     LEFT JOIN inab_t  t7 ON t7.inabent='"||g_enterprise||"' AND t7.inabsite='"||g_site||"' AND t7.inab001=inbc005 AND t7.inab002=inbc006 ",
               "     LEFT JOIN pjbal_t t8 ON t8.pjbalent='"||g_enterprise||"' AND t8.pjbal001=inbc021 AND t8.pjbal002='"||g_dlang||"' ",
               "     LEFT JOIN pjbbl_t t9 ON t9.pjbblent='"||g_enterprise||"' AND t9.pjbbl001=inbc021 AND t9.pjbbl002=inbc022 AND t9.pjbbl003='"||g_dlang||"' ",
               "     LEFT JOIN pjbml_t t10 ON t10.pjbmlent='"||g_enterprise||"' AND t10.pjbml001=inbc021 AND t10.pjbml002=inbc023 AND t10.pjbml003='"||g_dlang||"' ",
               "     LEFT JOIN inaml_t t11 ON t11.inamlent="||g_enterprise||" AND t11.inaml001=inbc001 AND t11.inaml002=inbc002 AND t11.inaml003='"||g_dlang||"' ",  #161223-00013#1
               "    ,inba_t ",
               "    WHERE inbaent = inbcent AND inbasite = inbcsite AND inbadocno = inbcdocno AND inbcent=? AND inbcsite=? AND inbcdocno=? ",
               "    ORDER BY inbc_t.inbcseq,inbcseq1 )"

   LET g_sql = g_sql CLIPPED, " WHERE ROWNUM <= '",g_max_rec,"' "


   PREPARE aint302_inbc_pb FROM g_sql
   DECLARE inbc_b_fill_cs CURSOR FOR aint302_inbc_pb

   LET g_cnt = l_ac1
   LET l_ac1 = 1

   OPEN inbc_b_fill_cs USING g_enterprise, g_site,g_inba_m.inbadocno


   FOREACH inbc_b_fill_cs INTO g_inbc_d[l_ac1].inbcseq,g_inbc_d[l_ac1].inbcseq1,g_inbc_d[l_ac1].inbc018,g_inbc_d[l_ac1].inbc019,g_inbc_d[l_ac1].inbc020,
                               g_inbc_d[l_ac1].inbc001,
                               g_inbc_d[l_ac1].inbc002,g_inbc_d[l_ac1].inbc004,g_inbc_d[l_ac1].inbc003,g_inbc_d[l_ac1].inbc005,
                               g_inbc_d[l_ac1].inbc006,g_inbc_d[l_ac1].inbc007,g_inbc_d[l_ac1].inbc009,g_inbc_d[l_ac1].inbc010,
                               g_inbc_d[l_ac1].inbc011,g_inbc_d[l_ac1].inbc015,g_inbc_d[l_ac1].inbc203, #160512-00004#2-add-'g_inbc_d[l_ac1].inbc203'
                               g_inbc_d[l_ac1].inbc016,g_inbc_d[l_ac1].inbc017,
                               g_inbc_d[l_ac1].inbc021,g_inbc_d[l_ac1].inbc022,g_inbc_d[l_ac1].inbc023,
                               g_inbc_d[l_ac1].inbc020_desc,g_inbc_d[l_ac1].inbc001_desc,g_inbc_d[l_ac1].inbc001_desc2,
                               g_inbc_d[l_ac1].inbc009_desc,g_inbc_d[l_ac1].inbc011_desc,g_inbc_d[l_ac1].inbc005_desc,
                               g_inbc_d[l_ac1].inbc006_desc,
                               g_inbc_d[l_ac1].inbc021_desc,g_inbc_d[l_ac1].inbc022_desc,g_inbc_d[l_ac1].inbc023_desc
                               ,g_inbc_d[l_ac1].inbc002_desc#161223-00013#1

      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF

      #add-point:b_fill段資料填充
      #CALL aint302_inbb001_desc(g_inbc_d[l_ac1].inbc001) RETURNING g_inbc_d[l_ac1].inbc001_desc,g_inbc_d[l_ac1].inbc001_desc2
      #DISPLAY BY NAME g_inbc_d[l_ac1].inbc001_desc,g_inbc_d[l_ac1].inbc001_desc2

      #161223-00013#1---s
      #CALL s_feature_description(g_inbc_d[l_ac1].inbc001,g_inbc_d[l_ac1].inbc002) RETURNING l_success,g_inbc_d[l_ac1].inbc002_desc
      #DISPLAY BY NAME g_inbc_d[l_ac1].inbc002_desc
      #161223-00013#1---e

      #CALL s_desc_get_stock_desc(g_site,g_inbc_d[l_ac1].inbc005) RETURNING g_inbc_d[l_ac1].inbc005_desc
      #DISPLAY BY NAME g_inbc_d[l_ac1].inbc005_desc

      #CALL s_desc_get_locator_desc(g_site,g_inbc_d[l_ac1].inbc005,g_inbc_d[l_ac1].inbc006) RETURNING g_inbc_d[l_ac1].inbc006_desc
      #DISPLAY BY NAME g_inbc_d[l_ac1].inbc006_desc

      #CALL aint302_inbb010_ref(g_inbc_d[l_ac1].inbc009) RETURNING g_inbc_d[l_ac1].inbc009_desc
      #DISPLAY BY NAME g_inbc_d[l_ac1].inbc009_desc
      #
      #CALL aint302_inbb010_ref(g_inbc_d[l_ac1].inbc011) RETURNING g_inbc_d[l_ac1].inbc011_desc
      #DISPLAY BY NAME g_inbc_d[l_ac1].inbc011_desc
      #
      #CALL aint302_inbc020_ref(g_inbc_d[l_ac1].inbc020) RETURNING g_inbc_d[l_ac1].inbc020_desc
      #DISPLAY BY NAME g_inbc_d[l_ac1].inbc020_desc

      #CALL aint302_inao_fill2()   #add by lixh 20150909 #160413-00011#2 mark #放到foreach外面填充，无需关联foreach里面的变量

      LET l_ac1 = l_ac1 + 1
      IF l_ac1 > g_max_rec AND g_error_show = 1 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code =  9035
         LET g_errparam.extend =  ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF

   END FOREACH
   LET g_error_show = 0



   CALL g_inbc_d.deleteElement(g_inbc_d.getLength())


   LET g_rec_b2 = g_inbc_d.getLength()
   LET l_ac1 = g_cnt
   LET g_cnt = 0

   FREE aint302_inbc_pb

   CALL aint302_inao_fill2()   #160413-00011#2 add

END FUNCTION
#維護扣帳日期:開放單頭[C:扣帳日期]欄位維護
PRIVATE FUNCTION aint302_inba002_upd()
   DEFINE r_success   LIKE type_t.num5
   DEFINE l_inbamoddt LIKE inba_t.inbamoddt
   DEFINE l_gzsz008   LIKE gzsz_t.gzsz008
   DEFINE l_forupd_sql STRING

   LET r_success = TRUE
   LET l_gzsz008 = ''

   IF g_inba_m.inbadocno IS NULL THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = "std-00003"
      LET g_errparam.extend = ""
      LET g_errparam.popup = FALSE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF

   SELECT UNIQUE inbadocno,inbadocdt,inba003,inba002,inba004,#inbastus,
                 inba005,inba006,inba007,inba008,inbaownid,inbaowndp,inbacrtid,inbacrtdp,inbacrtdt,inbamodid,inbamoddt,inbacnfid,inbacnfdt,inbapstid,inbapstdt
     INTO g_inba_m.inbadocno,g_inba_m.inbadocdt,g_inba_m.inba003,g_inba_m.inba002,g_inba_m.inba004,#g_inba_m.inbastus,
          g_inba_m.inba005,g_inba_m.inba006,g_inba_m.inba007,g_inba_m.inba008,g_inba_m.inbaownid,g_inba_m.inbaowndp,g_inba_m.inbacrtid,g_inba_m.inbacrtdp,g_inba_m.inbacrtdt,g_inba_m.inbamodid,g_inba_m.inbamoddt,g_inba_m.inbacnfid,g_inba_m.inbacnfdt,g_inba_m.inbapstid,g_inba_m.inbapstdt
     FROM inba_t
    WHERE inbaent = g_enterprise AND inbasite = g_site AND inbadocno = g_inba_m.inbadocno

   LET l_forupd_sql = " SELECT inbadocno,inbasite,inbadocdt,inba002,inba003,inba004,",  #inbastus, ",
                      "  inba005,inba006,inba007,inba008,inbaownid,inbacrtdp,inbaowndp,inbacrtdt,inbacrtid, ",
                      "  inbamodid,inbacnfdt,inbamoddt,inbapstid,inbacnfid,inbapstdt",
                      " FROM inba_t ",
                      " WHERE inbaent= ? AND inbadocno=? FOR UPDATE"

   LET l_forupd_sql = cl_sql_forupd(l_forupd_sql)                #轉換不同資料庫語法
   LET l_forupd_sql = cl_sql_add_mask(l_forupd_sql)              #遮蔽特定資料
   DECLARE aint302_inba002_cl CURSOR FROM l_forupd_sql

   OPEN aint302_inba002_cl USING g_enterprise,g_inba_m.inbadocno

   IF STATUS THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code =  STATUS
      LET g_errparam.extend = "OPEN aint302_inba002_cl:"
      LET g_errparam.popup = TRUE
      CALL cl_err()

      CLOSE aint302_inba002_cl
      LET r_success = FALSE
      RETURN r_success
   END IF

   #鎖住將被更改或取消的資料
   FETCH aint302_inba002_cl INTO g_inba_m.inbadocno,g_inba_m.inbasite,g_inba_m.inbadocdt,g_inba_m.inba002,g_inba_m.inba003,g_inba_m.inba004,#g_inba_m.inbastus,
                                 g_inba_m.inba005,g_inba_m.inba006,g_inba_m.inba007,g_inba_m.inba008,g_inba_m.inbaownid,g_inba_m.inbacrtdp,g_inba_m.inbaowndp,g_inba_m.inbacrtdt,g_inba_m.inbacrtid,
                                 g_inba_m.inbamodid,g_inba_m.inbacnfdt,g_inba_m.inbamoddt,g_inba_m.inbapstid,g_inba_m.inbacnfid,g_inba_m.inbapstdt
   #資料被他人LOCK, 或是sql執行時出現錯誤
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = g_inba_m.inbadocno
      LET g_errparam.popup = FALSE
      CALL cl_err()

      CLOSE aint302_inba002_cl
      LET r_success = FALSE
      RETURN r_success
   END IF

   CALL aint302_show()

   #160604-00034#1-S
   CALL cl_set_comp_entry("inba002",TRUE)
   IF NOT cl_chk_update_pstdt() THEN
      #170405-00051#1-S
      #如果關帳日期>過帳日期，預設值為過帳日期+1，反之預設值為今天
      IF cl_null(g_inba_m.inba002) THEN
         LET g_inba_m.inba002 = cl_get_today()
      END IF
      IF g_docdt >= g_today THEN
         LET g_inba_m.inba002 = g_docdt +1
      ELSE
         LET g_inba_m.inba002 = cl_get_today()
      END IF
      #170405-00051#1-E
      CALL cl_set_comp_entry("inba002",FALSE)
      #LET g_inba_m.inba002 = g_today    #170405-00051#1 mark
      DISPLAY BY NAME g_inba_m.inba002
   END IF
   #160604-00034#1-E
   INPUT BY NAME g_inba_m.inba002 WITHOUT DEFAULTS

      AFTER INPUT
         #若取消則直接結束
         IF INT_FLAG = 1 THEN
            LET INT_FLAG = 0
            LET r_success = FALSE
            RETURN r_success
         END IF

         LET g_inba_m_o.inba002 = g_inba_m.inba002   #160824-00007#278 161229 by lori add

      AFTER FIELD inba002
         IF NOT cl_null(g_inba_m.inba002) THEN   #160824-00007#278 161229 by lori add
            IF g_inba_m.inba002 <> g_inba_m_o.inba002 OR NOT cl_null(g_inba_m_o.inba002) THEN   #160824-00007#278 161229 by lori add
               #維護的日期不可小於庫存關帳日
               LET l_gzsz008 = cl_get_para(g_enterprise,g_site,'S-MFG-0031')
               IF g_inba_m.inba002 <= l_gzsz008 THEN
                  LET r_success = FALSE
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'sub-00306'
                  LET g_errparam.extend = g_inba_m.inba002
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET g_inba_m.inba002 = g_inba_m_o.inba002  #170802-00056#1
                  DISPLAY BY NAME g_inba_m.inba002
                  NEXT FIELD inba002
                  #RETURN r_success  #170802-00056#1 mark
               END IF
            END IF   #160824-00007#278 161229 by lori add
         END IF      #160824-00007#278 161229 by lori add
         LET g_inba_m_o.inba002 = g_inba_m.inba002   #160824-00007#278 161229 by lori add
      #維護的日期不可大於現行年月，錯誤訊息「扣帳日期大於會計年度期別，請重新輸入]

   END INPUT

   IF INT_FLAG OR g_inba_m.inba002 IS NULL THEN
      LET INT_FLAG = 0
      CLOSE aint302_inba002_cl
      LET r_success = FALSE
      RETURN r_success
   END IF

   LET l_inbamoddt = cl_get_current()

   UPDATE inba_t SET inba002 = g_inba_m.inba002,
                     inbamodid = g_user,
                     inbamoddt = l_inbamoddt
     WHERE inbaent = g_enterprise AND inbasite = g_site AND inbadocno = g_inba_m.inbadocno

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "g_inba_m"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      CLOSE aint302_inba002_cl

      LET r_success = FALSE
      RETURN r_success
   END IF

   CLOSE aint302_inba002_cl
   RETURN r_success
END FUNCTION
#+
PRIVATE FUNCTION aint302_set_no_required_b()
   CALL cl_set_comp_required("inbb003",FALSE)
   CALL cl_set_comp_required("inbb009",FALSE)   #161027-00033#1 add

END FUNCTION
#申請明細單身 inao000 = '1'
PRIVATE FUNCTION aint302_inao_fill1()
DEFINE l_ac1       LIKE type_t.num5

   CALL g_inao_d.clear()


   LET g_sql = "SELECT  UNIQUE inaoseq,inaoseq1,inaoseq2,inao001,'','',inao008,inao009,inao010,inao012 ",
               "  FROM inao_t ",
               " INNER JOIN inba_t ON inbadocno = inaodocno AND inbaent = inaoent AND inbasite = inaosite ",

               " WHERE inaoent=? AND inaosite=? AND inaodocno=? AND inao000 = '1'"

   IF NOT cl_null(g_wc2_table1) THEN
      LET g_sql = g_sql CLIPPED, " AND inaoseq IN ( SELECT inbbseq FROM inbb_t WHERE inbbent='",g_enterprise,"' AND inbbsite='",g_site,"' AND inbbdocno='",g_inba_m.inbadocno,"' AND ", g_wc2_table1 CLIPPED, " ) "
   END IF

   LET g_sql = g_sql, " ORDER BY inaoseq,inaoseq1,inaoseq2"

   #add-point:單身填充控制

   #end add-point

   PREPARE aint302_inao_pb1 FROM g_sql
   DECLARE inao_b_fill_cs1 CURSOR FOR aint302_inao_pb1

   LET g_cnt = l_ac1
   LET l_ac1 = 1

   OPEN inao_b_fill_cs1 USING g_enterprise, g_site,g_inba_m.inbadocno


   FOREACH inao_b_fill_cs1 INTO g_inao_d[l_ac1].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF

      #add-point:b_fill段資料填充
      #CALL aint302_inbb001_desc(g_inao_d[l_ac1].inao001) RETURNING g_inao_d[l_ac1].inao001_desc,g_inao_d[l_ac1].inao001_desc2
      CALL aint302_inbb001_desc(g_inao_d[l_ac1].inao001) RETURNING g_inao_d[l_ac1].inao001_desc,g_inao_d[l_ac1].inao001_desc_desc
      #DISPLAY BY NAME g_inao_d[l_ac1].inao001_desc,g_inao_d[l_ac1].inao001_desc_desc  #170526-00058#1 mark

      LET l_ac1 = l_ac1 + 1
      IF l_ac1 > g_max_rec AND g_error_show = 1 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code =  9035
         LET g_errparam.extend =  ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF

   END FOREACH
   LET g_error_show = 0



   CALL g_inao_d.deleteElement(g_inao_d.getLength())


   LET g_rec_b3 = g_inao_d.getLength()
   LET l_ac1 = g_cnt
   LET g_cnt = 0

   FREE aint302_inao_pb1

END FUNCTION
#入庫明細單身 inao000 = '2'
PRIVATE FUNCTION aint302_inao_fill2()
#DEFINE l_ac1       LIKE type_t.num5   #170524-00059#1 mark
DEFINE  l_ac1       LIKE type_t.num10  #170524-00059#1 add

   CALL g_inao_d2.clear()


   #LET g_sql = "SELECT  UNIQUE inaoseq,inaoseq1,inaoseq2,inao001,'','',inao008,inao009,inao010,inao012 ",  #160413-00011#2 mark
    LET g_sql = "SELECT  UNIQUE inaoseq,inaoseq1,inaoseq2,inao001,t1.imaal003,t2.imaal004,inao008,inao009,inao010,inao012 ",  #160413-00011#2 add
               "  FROM inao_t ",
               "     LEFT JOIN imaal_t t1 ON t1.imaalent='"||g_enterprise||"' AND t1.imaal001=inao001 AND t1.imaal002='"||g_dlang||"' ", #160413-00011#2 add
               "     LEFT JOIN imaal_t t2 ON t2.imaalent='"||g_enterprise||"' AND t2.imaal001=inao001 AND t2.imaal002='"||g_dlang||"' ", #160413-00011#2 add
               " INNER JOIN inba_t ON inbadocno = inaodocno AND inbaent = inaoent AND inbasite = inaosite ",

               " WHERE inaoent=? AND inaosite=? AND inaodocno=? AND inao000 = '2'"

   IF NOT cl_null(g_wc2_table1) THEN
      LET g_sql = g_sql CLIPPED, " AND inaoseq IN ( SELECT inbbseq FROM inbb_t WHERE inbbent='",g_enterprise,"' AND inbbsite='",g_site,"' AND inbbdocno='",g_inba_m.inbadocno,"' AND ", g_wc2_table1 CLIPPED, " ) "
   END IF

   LET g_sql = g_sql, " ORDER BY inaoseq,inaoseq1,inaoseq2"


   PREPARE aint302_inao_pb2 FROM g_sql
   DECLARE inao_b_fill_cs2 CURSOR FOR aint302_inao_pb2

   LET g_cnt = l_ac1
   LET l_ac1 = 1

   OPEN inao_b_fill_cs2 USING g_enterprise, g_site,g_inba_m.inbadocno


   FOREACH inao_b_fill_cs2 INTO g_inao_d2[l_ac1].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF

      #add-point:b_fill段資料填充
      #CALL aint302_inbb001_desc(g_inao_d2[l_ac1].inao001_1) RETURNING g_inao_d2[l_ac1].inao001_1_desc,g_inao_d2[l_ac1].inao001_1_desc2  #160413-00011#2 mark
      #DISPLAY BY NAME g_inao_d2[l_ac1].inao001_1_desc,g_inao_d2[l_ac1].inao001_1_desc2  #160413-00011#2 mark

      LET l_ac1 = l_ac1 + 1
      IF l_ac1 > g_max_rec AND g_error_show = 1 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code =  9035
         LET g_errparam.extend =  ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF

   END FOREACH
   LET g_error_show = 0



   CALL g_inao_d2.deleteElement(g_inao_d2.getLength())


   LET g_rec_b4 = g_inao_d2.getLength()
   #160408-00024#1
   #將總筆數, 目前筆數指定到共用變數中
   IF g_rec_b4 > 0 THEN
      LET g_d_idx_display = 1
   ELSE
      LET g_d_idx_display = 0
   END IF
   LET g_d_cnt_display = g_rec_b4
   #160408-00024#1
   LET l_ac1 = g_cnt
   LET g_cnt = 0

   FREE aint302_inao_pb2

END FUNCTION

PRIVATE FUNCTION aint302_inbb004_ref(p_inbb004)
DEFINE p_inbb004      LIKE inbb_t.inbb004
DEFINE r_inbb004_desc LIKE imaal_t.imaal003

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = p_inbb004
      CALL ap_ref_array2(g_ref_fields,"SELECT imaal003 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET r_inbb004_desc =  g_rtn_fields[1]
      RETURN r_inbb004_desc

END FUNCTION

PRIVATE FUNCTION aint302_reproduce_init()
      LET g_inba_m.inbadocno = ''
      LET g_inba_m.inbadocno_desc = ''
      LET g_inba_m.inbadocdt = g_today
      LET g_inba_m.inba002 = g_today
      DISPLAY BY NAME g_inba_m.inbadocno,g_inba_m.inbadocno_desc,g_inba_m.inbadocdt,g_inba_m.inba002
      LET g_inba_m.inbastus = 'N'
      CALL gfrm_curr.setElementImage("statechange", "stus/32/open.png")
      DISPLAY BY NAME g_inba_m.inbastus
      LET g_inba_m.inba003 = g_user
      LET g_inba_m.inba004 = g_dept
      CALL aint302_inba003_ref(g_inba_m.inba003) RETURNING g_inba_m.inba003_desc
      DISPLAY BY NAME g_inba_m.inba003,g_inba_m.inba003_desc

      CALL aint302_inba004_ref(g_inba_m.inba004) RETURNING g_inba_m.inba004_desc
      DISPLAY BY NAME g_inba_m.inba004,g_inba_m.inba004_desc

      LET g_inba_m.inbaownid = g_user
      LET g_inba_m.inbaowndp = g_dept
      LET g_inba_m.inbacrtid = g_user
      LET g_inba_m.inbacrtdp = g_dept
      LET g_inba_m.inbacrtdt = cl_get_current()
      LET g_inba_m.inbamodid = NULL
      LET g_inba_m.inbamodid_desc = NULL
      LET g_inba_m.inbamoddt = NULL
      LET g_inba_m.inbacnfid = NULL
      LET g_inba_m.inbacnfid_desc = NULL
      LET g_inba_m.inbacnfdt = NULL
      LET g_inba_m.inbapstid = NULL
      LET g_inba_m.inbapstid_desc = NULL
      LET g_inba_m.inbapstdt = NULL

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_inba_m.inbaownid
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_inba_m.inbaownid_desc = g_rtn_fields[1]
            DISPLAY BY NAME g_inba_m.inbaownid_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_inba_m.inbaowndp
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_inba_m.inbaowndp_desc = g_rtn_fields[1]
            DISPLAY BY NAME g_inba_m.inbaowndp_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_inba_m.inbacrtid
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_inba_m.inbacrtid_desc = g_rtn_fields[1]
            DISPLAY BY NAME g_inba_m.inbacrtid_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_inba_m.inbacrtdp
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_inba_m.inbacrtdp_desc = g_rtn_fields[1]
            DISPLAY BY NAME g_inba_m.inbacrtdp_desc



      DISPLAY BY NAME g_inba_m.inbaownid,g_inba_m.inbaownid_desc,g_inba_m.inbaowndp,g_inba_m.inbaowndp_desc,g_inba_m.inbacrtid,g_inba_m.inbacrtid_desc,g_inba_m.inbacrtdp,g_inba_m.inbacrtdp_desc,g_inba_m.inbacrtdt,g_inba_m.inbamodid,g_inba_m.inbamodid_desc,g_inba_m.inbamoddt,g_inba_m.inbacnfid,g_inba_m.inbacnfid_desc,g_inba_m.inbacnfdt,g_inba_m.inbapstid,g_inba_m.inbapstid_desc,g_inba_m.inbapstdt


      INITIALIZE g_inba_m_t.* TO NULL
      LET g_inba_m_t.* = g_inba_m.*

END FUNCTION
################################################################################
# Descriptions...: 取得單據別設定的欄位預設值
# Memo...........: 需搭配單據別aooi200的設定
# Usage..........: CALL aint302_get_col_default()
# Date & Author..: 2014/01/23 By Lori
# Modify.........:
################################################################################
PRIVATE FUNCTION aint302_get_col_default()
   LET g_inba_m.inbadocdt = s_aooi200_get_doc_default(g_site,'1',g_inba_m.inbadocno,'inbadocdt',g_inba_m.inbadocdt)
   LET g_inba_m.inba002 = s_aooi200_get_doc_default(g_site,'1',g_inba_m.inbadocno,'inba002',g_inba_m.inba002)
   LET g_inba_m.inba003 = s_aooi200_get_doc_default(g_site,'1',g_inba_m.inbadocno,'inba003',g_inba_m.inba003)
   LET g_inba_m.inba004 = s_aooi200_get_doc_default(g_site,'1',g_inba_m.inbadocno,'inba004',g_inba_m.inba004)
   LET g_inba_m.inba005 = s_aooi200_get_doc_default(g_site,'1',g_inba_m.inbadocno,'inba005',g_inba_m.inba005)
   LET g_inba_m.inba006 = s_aooi200_get_doc_default(g_site,'1',g_inba_m.inbadocno,'inba006',g_inba_m.inba006)
   LET g_inba_m.inba007 = s_aooi200_get_doc_default(g_site,'1',g_inba_m.inbadocno,'inba007',g_inba_m.inba007)
   LET g_inba_m.inba008 = s_aooi200_get_doc_default(g_site,'1',g_inba_m.inbadocno,'inba008',g_inba_m.inba008)

   DISPLAY g_inba_m.inbadocdt TO inbadocdt
   DISPLAY g_inba_m.inba002 TO inba002
   DISPLAY g_inba_m.inba003 TO inba003
   DISPLAY g_inba_m.inba004 TO inba004
   DISPLAY g_inba_m.inba005 TO inba005
   DISPLAY g_inba_m.inba006 TO inba006
   DISPLAY g_inba_m.inba007 TO inba007
   DISPLAY g_inba_m.inba008 TO inba008

   CALL aint302_inba007_ref(g_inba_m.inba007) RETURNING g_inba_m.inba007_desc
   DISPLAY BY NAME g_inba_m.inba007_desc

   #160824-00007#278 161229 by lori add---(S)
   LET g_inba_m_o.inbadocdt = g_inba_m.inbadocdt
   LET g_inba_m_o.inba002   = g_inba_m.inba002
   LET g_inba_m_o.inba003   = g_inba_m.inba003
   LET g_inba_m_o.inba004   = g_inba_m.inba004
   LET g_inba_m_o.inba005   = g_inba_m.inba005
   LET g_inba_m_o.inba006   = g_inba_m.inba006
   LET g_inba_m_o.inba007   = g_inba_m.inba007
   LET g_inba_m_o.inba008   = g_inba_m.inba008
   #160824-00007#278 161229 by lori add---(E)
END FUNCTION
################################################################################
# Descriptions...: 取得產品特徵類別
# Memo...........:
# Usage..........: CALL s_aint302_get_imaa005(p_enterprise,p_imaa001)
#                  RETURNING r_imaa005
# Input parameter: p_enterprise   企業編號
#                : p_imaa001      料號
# Return code....: r_imaa005      特徵類別
# Date & Author..: 2014/02/05 By Lori
# Modify.........:
################################################################################
PRIVATE FUNCTION aint302_get_imaa005(p_enterprise,p_imaa001)
   DEFINE p_enterprise   LIKE type_t.num5,
          p_imaa001      LIKE imaa_t.imaa001
   DEFINE r_imaa005      LIKE imaa_t.imaa005

   LET r_imaa005 = ''
   SELECT imaa005 INTO r_imaa005
     FROM imaa_t
    WHERE imaaent = p_enterprise
      AND imaa001 = p_imaa001

   RETURN r_imaa005
END FUNCTION

#輸入的料件+產品特徵+庫存管理特徵+庫位必須存在[T:庫存明細檔]中
PRIVATE FUNCTION aint302_chk_inag004(p_inbb007)
DEFINE p_inbb007   LIKE inbb_t.inbb007
DEFINE r_success   LIKE type_t.num5

      LET r_success = TRUE

      IF cl_null(g_inbb_d[l_ac].inbb002) THEN
         LET g_inbb_d[l_ac].inbb002 = ' '
      END IF
      IF cl_null(g_inbb_d[l_ac].inbb003) AND g_imaf055 <> '1' AND NOT aint302_get_vmi() THEN  #160815-00028#1 add
         LET g_inbb_d[l_ac].inbb003 = ' '
      END IF
      #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
      INITIALIZE g_chkparam.* TO NULL

      #設定g_chkparam.*的參數
      LET g_chkparam.arg1 = g_site
      LET g_chkparam.arg2 = g_inbb_d[l_ac].inbb001
      LET g_chkparam.arg3 = g_inbb_d[l_ac].inbb002
      LET g_chkparam.arg4 = g_inbb_d[l_ac].inbb003
      LET g_chkparam.arg5 = p_inbb007

      #呼叫檢查存在並帶值的library
      IF NOT cl_chk_exist("v_inag004") THEN
         LET r_success = FALSE
         RETURN r_success
      END IF

      RETURN r_success

END FUNCTION

#輸入的料件+產品特徵+庫存管理特徵+庫位+儲位必須存在[T:庫存明細檔]中
PRIVATE FUNCTION aint302_chk_inag005(p_inbb007,p_inbb008)
DEFINE p_inbb007   LIKE inbb_t.inbb007
DEFINE p_inbb008   LIKE inbb_t.inbb008
DEFINE r_success   LIKE type_t.num5

      LET r_success = TRUE

      IF cl_null(p_inbb008) THEN
         LET p_inbb008 = ' '
      END IF
      IF cl_null(g_inbb_d[l_ac].inbb003) AND g_imaf055 <> '1'  AND NOT aint302_get_vmi() THEN  #160815-00028#1 add
         LET g_inbb_d[l_ac].inbb003 = ' '
      END IF

      #若是雜項庫存發料作業時，輸入的料件+產品特徵+庫存管理特徵+庫位必須存在[T:庫存明細檔]中
      IF cl_null(g_inbb_d[l_ac].inbb002) THEN
         LET g_inbb_d[l_ac].inbb002 = ' '
      END IF
      IF cl_null(g_inbb_d[l_ac].inbb003) AND g_imaf055 <> '1' AND NOT aint302_get_vmi() THEN  #160815-00028#1 add
         LET g_inbb_d[l_ac].inbb003 = ' '
      END IF
      IF cl_null(p_inbb008) THEN
         LET p_inbb008 = ' '
      END IF
      #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
      INITIALIZE g_chkparam.* TO NULL

      #設定g_chkparam.*的參數
      LET g_chkparam.arg1 = g_site
      LET g_chkparam.arg2 = g_inbb_d[l_ac].inbb001
      LET g_chkparam.arg3 = g_inbb_d[l_ac].inbb002
      LET g_chkparam.arg4 = g_inbb_d[l_ac].inbb003
      LET g_chkparam.arg5 = p_inbb007
      LET g_chkparam.arg6 = p_inbb008

      #呼叫檢查存在並帶值的library
      IF NOT cl_chk_exist("v_inag005") THEN
         LET r_success = FALSE
         RETURN r_success
      END IF
      RETURN r_success

END FUNCTION

#檢查當前庫位與單身中的其他項次對應的庫位是否存在相同的控制組
PRIVATE FUNCTION aint302_inbb007_chk_group(p_inbb007)
DEFINE p_inbb007    LIKE inbb_t.inbb007
DEFINE l_inbb007    LIKE inbb_t.inbb007
DEFINE l_oohl001    LIKE oohl_t.oohl001
DEFINE l_n          LIKE type_t.num5
DEFINE l_flag       LIKE type_t.num5
DEFINE r_success    LIKE type_t.num5
DEFINE l_inbbseq    LIKE inbb_t.inbbseq
DEFINE l_i          LIKE type_t.num5
DEFINE l_cn         LIKE type_t.num5

    LET r_success = TRUE
    LET l_flag = TRUE
    LET l_i = 0
    LET l_cn = 0

    IF cl_null(g_inbb_d_t.inbbseq) THEN
       LET l_inbbseq = g_inbb_d[l_ac].inbbseq
    ELSE
       LET l_inbbseq = g_inbb_d_t.inbbseq
    END IF

    DECLARE inbb007_cs1 CURSOR FOR
        SELECT DISTINCT inbb007 FROM inbb_t
          WHERE inbbent = g_enterprise AND inbbdocno = g_inba_m.inbadocno
            AND inbbseq <> l_inbbseq     #考慮到修改資料時，修改前的資料不需要再進行檢查
    FOREACH inbb007_cs1 INTO l_inbb007

       LET l_cn = l_cn + 1  #單身是否有資料

       DECLARE inbb007_cs2 CURSOR FOR
          SELECT oohl001 FROM oohl_t WHERE oohlent = g_enterprise AND oohl002 = g_site AND oohl003 = l_inbb007
       FOREACH inbb007_cs2 INTO l_oohl001   #獲得控制組編號

          LET l_i = l_i +1   #用于判断是否有走进foreach,即判断其他单身的库位是否存在控制组

          #判斷當前輸入的庫位編號是否存在其他庫位編號的控制組中
          LET l_n = 0
          SELECT COUNT(*) INTO l_n FROM oohl_t
             WHERE oohlent = g_enterprise AND oohl001 = l_oohl001
               AND oohl002 = g_site AND oohl003 = p_inbb007
          IF l_n > 0 THEN  #存在相同的控制組編號
             LET l_flag = TRUE
             EXIT FOREACH   #存在一個相同的控制組編號，則其他的控制組編號無需再判斷
          ELSE
             LET l_flag = FALSE
          END IF

       END FOREACH

       IF NOT l_flag THEN   #如果已經有一筆庫位的控制組編號與當前庫位不存在相同的控制組，則其他的單身庫位也無需在進行檢查
          EXIT FOREACH
       END IF

    END FOREACH

    #如果其他单身的库位都不存在控制组中且單身有其他資料，再判断当前库位是否有控制组，若有，则报错
    IF l_i = 0 AND l_cn > 0 THEN
       LET l_n = 0
       SELECT COUNT(oohl001) INTO l_n FROM oohl_t
         WHERE oohlent = g_enterprise AND oohl002 = g_site AND oohl003 = p_inbb007
       IF l_n > 0 THEN
          LET l_flag = FALSE
       END IF
    END IF

    IF NOT l_flag THEN
       INITIALIZE g_errparam TO NULL
       LET g_errparam.code = 'ain-00274'
       LET g_errparam.extend = p_inbb007
       LET g_errparam.popup = TRUE
       CALL cl_err()

       LET r_success = FALSE
       RETURN r_success
    END IF

    RETURN r_success

END FUNCTION
#判定結果說明
PRIVATE FUNCTION aint302_inbc020_ref(p_inbc020)
DEFINE p_inbc020      LIKE inbc_t.inbc020
DEFINE r_qcaol004     LIKE qcaol_t.qcaol004

      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = p_inbc020
      CALL ap_ref_array2(g_ref_fields,"SELECT qcaol004 FROM qcaol_t WHERE qcaolent='"||g_enterprise||"' AND qcaol001='"||g_ooef025||"' AND qcaol002=? AND qcaol003='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET r_qcaol004 = '', g_rtn_fields[1] , ''
      RETURN r_qcaol004

END FUNCTION

#整批產生單身
PRIVATE FUNCTION aint302_gen_detail()
DEFINE r_success    LIKE type_t.num5
DEFINE l_success    LIKE type_t.num5
DEFINE l_detail     DYNAMIC ARRAY OF RECORD
   inbb001      LIKE inbb_t.inbb001,
   imaal003     LIKE imaal_t.imaal003,
   imaal004     LIKE imaal_t.imaal004,
   inbb002      LIKE inbb_t.inbb002,
   inbb002_desc LIKE type_t.chr500,
   inbb010      LIKE inbb_t.inbb010,
   inbb010_desc LIKE type_t.chr80,
   inbb011      LIKE inbb_t.inbb011,
   inbb007      LIKE inbb_t.inbb007,
   inbb007_desc LIKE type_t.chr80,
   inbb008      LIKE inbb_t.inbb008,
   inbb008_desc LIKE type_t.chr80,
   inbb009      LIKE inbb_t.inbb009,
   inbb003      LIKE inbb_t.inbb003
       END RECORD
#DEFINE l_inbb       RECORD LIKE inbb_t.*  #161124-00048#13  16/12/29 By 08734 mark
#161124-00048#13  16/12/29 By 08734 add(S)
DEFINE l_inbb RECORD  #雜項庫存異動申請明細檔
       inbbent LIKE inbb_t.inbbent, #企业编号
       inbbsite LIKE inbb_t.inbbsite, #营运据点
       inbbdocno LIKE inbb_t.inbbdocno, #单据编号
       inbbseq LIKE inbb_t.inbbseq, #项次
       inbb001 LIKE inbb_t.inbb001, #料件编号
       inbb002 LIKE inbb_t.inbb002, #产品特征
       inbb003 LIKE inbb_t.inbb003, #库存管理特征
       inbb004 LIKE inbb_t.inbb004, #包装容器编号
       inbb007 LIKE inbb_t.inbb007, #库位
       inbb008 LIKE inbb_t.inbb008, #限定储位
       inbb009 LIKE inbb_t.inbb009, #限定批号
       inbb010 LIKE inbb_t.inbb010, #交易单位
       inbb011 LIKE inbb_t.inbb011, #申请数量
       inbb012 LIKE inbb_t.inbb012, #实际异动数量
       inbb013 LIKE inbb_t.inbb013, #参考单位
       inbb014 LIKE inbb_t.inbb014, #参考单位申请数量
       inbb015 LIKE inbb_t.inbb015, #参考单位实际数量
       inbb016 LIKE inbb_t.inbb016, #理由码
       inbb017 LIKE inbb_t.inbb017, #来源单号
       inbb018 LIKE inbb_t.inbb018, #检验否
       inbb019 LIKE inbb_t.inbb019, #检验合格量
       inbb020 LIKE inbb_t.inbb020, #单据备注
       inbb021 LIKE inbb_t.inbb021, #存货备注
       inbb022 LIKE inbb_t.inbb022, #有效日期
       inbb200 LIKE inbb_t.inbb200, #商品条码
       inbb201 LIKE inbb_t.inbb201, #包装单位
       inbb202 LIKE inbb_t.inbb202, #申请包装数量
       inbb203 LIKE inbb_t.inbb203, #实际包装数量
       inbbunit LIKE inbb_t.inbbunit, #应用组织
       inbb204 LIKE inbb_t.inbb204, #制造日期
       inbb023 LIKE inbb_t.inbb023, #项目编号
       inbb024 LIKE inbb_t.inbb024, #WBS
       inbb025 LIKE inbb_t.inbb025, #活动编号
       inbb205 LIKE inbb_t.inbb205, #领用/退回单价
       inbb206 LIKE inbb_t.inbb206, #领用/退回金额
       inbb207 LIKE inbb_t.inbb207, #成本单价
       inbb208 LIKE inbb_t.inbb208, #成本金额
       inbb209 LIKE inbb_t.inbb209, #费用编号
       inbb210 LIKE inbb_t.inbb210, #进价
       inbb211 LIKE inbb_t.inbb211, #来源单据项次
       inbb212 LIKE inbb_t.inbb212, #来源单据项序
       inbb213 LIKE inbb_t.inbb213, #转入商品条码
       inbb214 LIKE inbb_t.inbb214, #转入商品编号
       inbb215 LIKE inbb_t.inbb215, #转入产品特征
       inbb216 LIKE inbb_t.inbb216, #转入单位
       inbb217 LIKE inbb_t.inbb217, #转入数量
       inbb218 LIKE inbb_t.inbb218, #转入包装单位
       inbb219 LIKE inbb_t.inbb219, #转入包装数量
       inbb220 LIKE inbb_t.inbb220, #转入库位
       inbb221 LIKE inbb_t.inbb221, #转入储位
       inbb222 LIKE inbb_t.inbb222, #转入批号
       inbb223 LIKE inbb_t.inbb223, #转入进价
       inbb224 LIKE inbb_t.inbb224, #计价单位
       inbb225 LIKE inbb_t.inbb225 #计价数量
END RECORD
#161124-00048#13  16/12/29 By 08734 add(E)
DEFINE l_inbbseq    LIKE inbb_t.inbbseq
DEFINE l_inbc016    LIKE inbc_t.inbc016   #有效日期
DEFINE l_imaf032    LIKE imaf_t.imaf032   #有效期加天數
DEFINE l_inbcseq1   LIKE inbc_t.inbcseq1
DEFINE  l_i         LIKE type_t.num10

    LET r_success = TRUE

    IF cl_null(g_inba_m.inbadocno) THEN
       LET r_success = FALSE
       RETURN r_success
    END IF

    CALL s_gen_detail(g_inba_m.inbadocno) RETURNING l_success,l_detail
    IF NOT l_success THEN
       LET r_success = FALSE
       RETURN r_success
    END IF
    IF l_detail.getLength() <= 0 THEN
       LET r_success = FALSE
       RETURN r_success
    END IF
    IF l_detail.getLength() > 0 THEN  #因為第一筆資料已呈現在畫面並寫入DB, 從第二筆開始處理
       IF cl_null(l_inbbseq) OR l_inbbseq = 0 THEN
          SELECT MAX(inbbseq) INTO l_inbbseq
            FROM inbb_t
           WHERE inbbent   = g_enterprise
             AND inbbdocno = g_inba_m.inbadocno
       END IF

       FOR l_i = 1 TO l_detail.getLength()
          IF cl_null(l_inbbseq) OR l_inbbseq = 0 THEN
             LET l_inbbseq = 1
          ELSE
             LET l_inbbseq = l_inbbseq + 1
          END IF

          INITIALIZE l_inbb.* TO NULL

          LET l_inbb.inbbseq = l_inbbseq

          LET l_inbb.inbbdocno = g_inba_m.inbadocno
          LET l_inbb.inbbent = g_enterprise
          LET l_inbb.inbbsite = g_site

          LET l_inbb.inbb001 = l_detail[l_i].inbb001
          LET l_inbb.inbb002 = l_detail[l_i].inbb002
          LET l_inbb.inbb003 = l_detail[l_i].inbb003
          LET l_inbb.inbb010 = l_detail[l_i].inbb010
          LET l_inbb.inbb011 = l_detail[l_i].inbb011
          LET l_inbb.inbb012 = l_detail[l_i].inbb011
          LET l_inbb.inbb007 = l_detail[l_i].inbb007
          LET l_inbb.inbb008 = l_detail[l_i].inbb008
          LET l_inbb.inbb009 = l_detail[l_i].inbb009

          LET l_inbb.inbb016 = g_inba_m.inba007

          #參考單位、包裝容器
          SELECT imaf015,imaf123 INTO l_inbb.inbb013,l_inbb.inbb004
             FROM imaf_t WHERE imafent = g_enterprise AND imafsite = g_site AND imaf001 = l_inbb.inbb001


          IF (NOT cl_null(l_inbb.inbb001)) AND (NOT cl_null(l_inbb.inbb010)) AND (NOT cl_null(l_inbb.inbb013)) THEN
              CALL s_aooi250_convert_qty(l_inbb.inbb001,l_inbb.inbb010,l_inbb.inbb013,l_inbb.inbb011) RETURNING l_success,l_inbb.inbb014
             IF l_success THEN
                LET l_inbb.inbb015 = l_inbb.inbb014
             END IF
          END IF

          IF cl_null(l_inbb.inbb008) THEN
             LET l_inbb.inbb008 = ' '
          END IF
          #檢驗否為'N'
          LET l_inbb.inbb018 = 'N'
          LET l_inbb.inbb019 = l_inbb.inbb011

          INSERT INTO inbb_t
                      (inbbent, inbbsite, inbbdocno, inbbseq,
                       inbb001,inbb002,inbb003,inbb004,inbb007,
                       inbb008,inbb009,inbb010,inbb011,inbb012,
                       inbb013,inbb014,inbb015,inbb016,inbb017,
                       inbb018,inbb019,inbb020,inbb021,
                       inbb023,inbb024,inbb025)
                VALUES(l_inbb.inbbent,l_inbb.inbbsite,l_inbb.inbbdocno,l_inbbseq,
                       l_inbb.inbb001,l_inbb.inbb002 ,l_inbb.inbb003,l_inbb.inbb004,l_inbb.inbb007,
                       l_inbb.inbb008,l_inbb.inbb009, l_inbb.inbb010,l_inbb.inbb011,l_inbb.inbb012,
                       l_inbb.inbb013,l_inbb.inbb014, l_inbb.inbb015,l_inbb.inbb016,l_inbb.inbb017,
                       l_inbb.inbb018,l_inbb.inbb019, l_inbb.inbb020,l_inbb.inbb021,
                       l_inbb.inbb023,l_inbb.inbb024,l_inbb.inbb025)
          IF SQLCA.sqlcode THEN
             INITIALIZE g_errparam TO NULL
             LET g_errparam.code = SQLCA.sqlcode
             LET g_errparam.extend = "inbb_t"
             LET g_errparam.popup = FALSE
             CALL cl_err()
             LET r_success = FALSE
             RETURN r_success
          ELSE
             #同步新增[T:雜項庫存異動庫儲批明細檔]
             LET l_inbc016 = g_today
             LET l_imaf032 = NULL
             LET l_inbcseq1 = 0
             #如果料件有做批號控管時，則[C:有效日期]=g_today+[T:料件集團檔].[C:有效天數]
             SELECT imaf032 INTO l_imaf032
               FROM imaf_t
              WHERE imafent = g_enterprise
                AND imafsite = 'ALL'
                AND imaf001 = l_inbb.inbb001
             IF NOT cl_null(l_imaf032) THEN
                LET l_inbc016 = l_inbc016 + l_imaf032
             END IF

             IF cl_null(l_inbcseq1) THEN
                SELECT MAX(inbcseq1) INTO l_inbcseq1
                  FROM inbc_t
                 WHERE inbcent   = g_enterprise
                   AND inbcsite  = g_site
                   AND inbcdocno = g_inba_m.inbadocno
                   AND inbcseq   = l_inbb.inbbseq
             END IF
             IF cl_null(l_inbcseq1) THEN
                LET l_inbcseq1 = 1
             ELSE
                LET l_inbcseq1 = l_inbcseq1 + 1
             END IF
             #160512-00004#2-add-'inbc203','l_inbb.inbb204'
             INSERT INTO inbc_t
                        (inbcent,inbcsite,inbcdocno,inbcseq,inbcseq1,
                         inbc001,inbc002,inbc003,inbc004,inbc005,
                         inbc006,inbc007,inbc009,inbc010,inbc011,
                         inbc015,inbc203,inbc016,inbc017,inbc021,inbc022,inbc023)
                  VALUES(l_inbb.inbbent,l_inbb.inbbsite,l_inbb.inbbdocno,l_inbb.inbbseq,l_inbcseq1,
                         l_inbb.inbb001,l_inbb.inbb002,l_inbb.inbb003,l_inbb.inbb004,l_inbb.inbb007,
                         l_inbb.inbb008,l_inbb.inbb009,l_inbb.inbb010,l_inbb.inbb011,l_inbb.inbb013,
                         l_inbb.inbb015,l_inbb.inbb204,l_inbb.inbb022,l_inbb.inbb021,
                         l_inbb.inbb023,l_inbb.inbb024,l_inbb.inbb025)
             IF SQLCA.sqlcode THEN
                INITIALIZE g_errparam TO NULL
                LET g_errparam.code = SQLCA.sqlcode
                LET g_errparam.extend = "inbc_t"
                LET g_errparam.popup = FALSE
                CALL cl_err()
                LET r_success = FALSE
                RETURN r_success
             END IF
          END IF
       END FOR
    END IF

    RETURN r_success

END FUNCTION

################################################################################
# Descriptions...: 批序號數量與申請數量是否一致
# Memo...........:
# Usage..........: CALL aint302_inao012_chk()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By lixh
# Modify.........:
################################################################################
PRIVATE FUNCTION aint302_inao012_chk()
DEFINE  l_s_inao012      LIKE inao_t.inao012
   IF l_ac <> 0 THEN
      SELECT SUM(inao012) INTO l_s_inao012 FROM inao_t
       WHERE inaoent = g_enterprise
         AND inaodocno = g_inba_m.inbadocno
         AND inaoseq = g_inbb_d[l_ac].inbbseq
   END IF
END FUNCTION

################################################################################
# Descriptions...: 產生申請資料的同時產生實際異動資料
# Memo...........:
# Usage..........: CALL aint302_ins_inao_2()
#                  RETURNING TRUE/FALSE
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By lixh
# Modify.........:
################################################################################
PRIVATE FUNCTION aint302_ins_inao_2()
DEFINE  l_sql       STRING
#DEFINE  l_inao      RECORD LIKE inao_t.*  #161124-00048#13  16/12/29 By 08734 mark
#161124-00048#13  16/12/29 By 08734 add(S)
DEFINE l_inao RECORD  #製造批序號庫存異動明細檔
       inaoent LIKE inao_t.inaoent, #企业编号
       inaosite LIKE inao_t.inaosite, #营运据点
       inaodocno LIKE inao_t.inaodocno, #单号
       inaoseq LIKE inao_t.inaoseq, #项次
       inaoseq1 LIKE inao_t.inaoseq1, #项序
       inaoseq2 LIKE inao_t.inaoseq2, #序号
       inao000 LIKE inao_t.inao000, #数据类型
       inao001 LIKE inao_t.inao001, #料件编号
       inao002 LIKE inao_t.inao002, #产品特征
       inao003 LIKE inao_t.inao003, #库存管理特征
       inao004 LIKE inao_t.inao004, #包装容器编号
       inao005 LIKE inao_t.inao005, #库位
       inao006 LIKE inao_t.inao006, #储位
       inao007 LIKE inao_t.inao007, #批号
       inao008 LIKE inao_t.inao008, #制造批号
       inao009 LIKE inao_t.inao009, #制造序号
       inao010 LIKE inao_t.inao010, #制造日期
       inao011 LIKE inao_t.inao011, #有效日期
       inao012 LIKE inao_t.inao012, #数量
       inao013 LIKE inao_t.inao013, #出入库码
       inao014 LIKE inao_t.inao014, #库存单位
       inao020 LIKE inao_t.inao020, #检验合格量
       inao021 LIKE inao_t.inao021, #已入库/出货/签收量
       inao022 LIKE inao_t.inao022, #已验退/签退量
       inao023 LIKE inao_t.inao023, #已仓退/销退量
       inao024 LIKE inao_t.inao024, #已转QC量
       inao025 LIKE inao_t.inao025 #已退品量
END RECORD
#161124-00048#13  16/12/29 By 08734 add(E)
DEFINE  r_success   LIKE type_t.num5



   #先刪除實際資料
   DELETE FROM inao_t
    WHERE inaodocno = g_inba_m.inbadocno
      AND inaosite = g_site
      AND inaoseq = g_inbb_d[g_detail_idx].inbbseq
      AND inao000 = '2'
      AND inaoent = g_enterprise #add by geza 20160905 #160905-00007#5

   #LET l_sql = "SELECT * FROM inao_t ",  #161124-00048#13  16/12/29 By 08734 mark
   LET l_sql = " SELECT inaoent,inaosite,inaodocno,inaoseq,inaoseq1,inaoseq2,inao000,inao001,inao002,inao003,inao004,",
               " inao005,inao006,inao007,inao008,inao009,inao010,inao011,inao012,inao013,inao014,inao020,inao021,",
               " inao022,inao023,inao024,inao025 FROM inao_t ",  #161124-00048#13  16/12/29 By 08734 add
               " WHERE inaodocno = '",g_inba_m.inbadocno,"'",
               "   AND inaoseq = ",g_inbb_d[g_detail_idx].inbbseq,
               "   AND inaoent = ",g_enterprise," ", #add by geza 20160905 #160905-00007#5
               "   AND inao000 = '1' "

   PREPARE aint302_inao_pre FROM l_sql
   DECLARE aint302_inao_ins CURSOR FOR aint302_inao_pre

   LET r_success = TRUE

   FOREACH aint302_inao_ins INTO l_inao.*

      UPDATE inao_t SET inao021 = l_inao.inao012
       WHERE inaoent = g_enterprise
         AND inaodocno = g_inba_m.inbadocno
         AND inaoseq = l_inao.inaoseq
         AND inaoseq1 = l_inao.inaoseq1
         AND inaoseq2 = l_inao.inaoseq2
         AND inao000 = '1'
         AND inao013 = l_inao.inao013

      LET l_inao.inao000 = '2'
      LET l_inao.inaoseq1 = 1

      INSERT INTO inao_t (inaoent,inaosite,inaodocno,inaoseq,inaoseq1,inaoseq2,inao000,inao001,inao002,inao003,inao004,inao005,inao006,
                          inao007,inao008,inao009,inao010,inao011,inao012,inao013,inao014,inao020,inao021,inao022,inao023,inao024)
                  VALUES (g_enterprise,g_site,g_inba_m.inbadocno,g_inbb_d[g_detail_idx].inbbseq,l_inao.inaoseq1,l_inao.inaoseq2,l_inao.inao000,
                          l_inao.inao001,l_inao.inao002,l_inao.inao003,l_inao.inao004,l_inao.inao005,l_inao.inao006,l_inao.inao007,l_inao.inao008,
                          l_inao.inao009,l_inao.inao010,l_inao.inao011,l_inao.inao012,l_inao.inao013,l_inao.inao014,l_inao.inao020,l_inao.inao021,
                          l_inao.inao022,l_inao.inao023,l_inao.inao024)
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "inao_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()
         LET r_success = FALSE
      END IF

   END FOREACH

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 檢查是否為 有效日期>製造日期
# Memo...........:
# Usage..........: CALL aint302_inbb204_inbb022_chk(p_inbb204,p_inbb022)
#                  RETURNING r_success
# Input parameter: p_inbb204   製造日期
#                : p_inbb022   有效日期
# Return code....: r_success   TRUE/FALSE
# Date & Author..: 2016/06/17 By doislai (#160512-00004#2)
# Modify.........:
################################################################################
PRIVATE FUNCTION aint302_inbb204_inbb022_chk(p_inbb204,p_inbb022)
   DEFINE p_inbb204  LIKE inbb_t.inbb204
   DEFINE p_inbb022  LIKE inbb_t.inbb022
   DEFINE r_success  LIKE type_t.num5

   LET r_success = TRUE

   IF NOT cl_null(p_inbb204) AND NOT cl_null(p_inbb022) THEN
      #製造日期>有效日期
      IF p_inbb204 > p_inbb022 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = ""
         LET g_errparam.code   = "ain-00311"  #有效日期不可以小於製造日期！
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
   END IF

   RETURN r_success

END FUNCTION

################################################################################
# Descriptions...: 库存管理特征检查
# Memo...........:
# Usage..........: CALL aint302_inbb003_chk()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By lixh
# Modify.........:
################################################################################
PRIVATE FUNCTION aint302_inbb003_chk()
DEFINE   l_sql   STRING
DEFINE   l_cnt   LIKE type_t.num5
   #IF g_prog MATCHES 'aint302' OR g_prog MATCHES 'apjt600' THEN   #161109-00032#1  #170217-00068#3
   #IF g_prog MATCHES 'aint302*' OR g_prog MATCHES 'apjt600*' THEN   #170511-00025#1 mark
   IF g_prog MATCHES 'aint301*'
      OR g_prog MATCHES 'aint302*'
      OR g_prog MATCHES 'abct302*' #170310-00005#25
      OR g_prog MATCHES 'apjt500*' #170818-00009#1 add
      OR g_prog MATCHES 'apjt600*' THEN   #170511-00025#1 add

      RETURN TRUE
   END IF
   LET l_cnt = 0
   IF l_ac > 0 THEN
      LET l_sql = " SELECT COUNT(*) FROM inag_t ",
                  "  WHERE inagent = ",g_enterprise,
                  "    AND inagsite = '",g_site,"'"

      IF NOT cl_null(g_inbb_d[l_ac].inbb001) THEN
         LET l_sql = l_sql ," AND inag001 = '",g_inbb_d[l_ac].inbb001,"'"
      END IF

      IF NOT cl_null(g_inbb_d[l_ac].inbb002) THEN
         LET l_sql = l_sql ," AND inag002 = '",g_inbb_d[l_ac].inbb002,"'"
      END IF

      IF NOT cl_null(g_inbb_d[l_ac].inbb003) THEN
         LET l_sql = l_sql ," AND inag003 = '",g_inbb_d[l_ac].inbb003,"'"
      END IF

      IF NOT cl_null(g_inbb_d[l_ac].inbb007) THEN
         LET l_sql = l_sql ," AND inag004 = '",g_inbb_d[l_ac].inbb007,"'"
      END IF

      IF NOT cl_null(g_inbb_d[l_ac].inbb008) THEN
         LET l_sql = l_sql ," AND inag005 = '",g_inbb_d[l_ac].inbb008,"'"
      END IF

      IF NOT cl_null(g_inbb_d[l_ac].inbb009) THEN
         LET l_sql = l_sql ," AND inag006 = '",g_inbb_d[l_ac].inbb009,"'"
      END IF

      PREPARE aint302_cnt_pre FROM l_sql
      EXECUTE aint302_cnt_pre INTO l_cnt
      IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
      FREE aint302_cnt_pre
      IF l_cnt > 0 THEN
         RETURN TRUE
      ELSE
         RETURN FALSE
      END IF
   END IF
   RETURN TRUE
END FUNCTION

################################################################################
# Descriptions...: 是否為VMI倉
# Memo...........:
# Usage..........: CALL aint302_get_vmi()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By lixh
# Modify.........:
################################################################################
PRIVATE FUNCTION aint302_get_vmi()
DEFINE  l_n    LIKE type_t.num5
   #IF l_ac > 0 AND g_prog = 'aint302' THEN   #161007-00012#3-s-mod aint301或aint302只要是VMI倉，庫存管理特徵就要必輸
   IF l_ac > 0  THEN                          #161007-00012#3-e-mod
      IF NOT cl_null(g_bas_0043)  THEN  #VMI存貨庫位Tag
         LET l_n = 0
         SELECT COUNT(*) INTO l_n FROM inac_t
          WHERE inacent = g_enterprise
            AND inacsite = g_site
            AND inac001 = g_inbb_d[l_ac].inbb007
            AND inac003 = g_bas_0043
         IF l_n > 0 THEN
            RETURN TRUE
         END IF
      END IF
   END IF
   RETURN FALSE
END FUNCTION

################################################################################
# Descriptions...: 是否进行批序号管理
# Memo...........:
# Usage..........: CALL aint302_get_imaf071_imaf081()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By lixh
# Modify.........:
################################################################################
PRIVATE FUNCTION aint302_get_imaf071_imaf081()
DEFINE  l_imaf071   LIKE imaf_t.imaf071
DEFINE  l_imaf081   LIKE imaf_t.imaf081

   IF l_ac > 0 THEN
      IF NOT cl_null(g_inbb_d[l_ac].inbb001) THEN
         SELECT imaf071,imaf081 INTO l_imaf071,l_imaf081 FROM imaf_t
          WHERE imafent = g_enterprise
            AND imafsite = g_site
            AND imaf001 = g_inbb_d[l_ac].inbb001
         IF l_imaf071 = '2' AND l_imaf081 = '2' THEN
            RETURN FALSE
         ELSE
            RETURN TRUE
         END IF
      END IF
   END IF
   RETURN FALSE
END FUNCTION

################################################################################
# Descriptions...: 維護備註單身
# Memo...........: #161031-00025#7 add
################################################################################
PRIVATE FUNCTION aint302_memos()
DEFINE l_sql      STRING

   IF g_inba_m.inbadocno IS NULL THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = "std-00003"
      LET g_errparam.extend = ""
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN
   END IF

   LET l_sql = " SELECT inbadocno,inbasite,inbadocdt,inba002,inba003,inba004,",  #inbastus, ",
               "  inba005,inba006,inba007,inba008,inbaownid,inbacrtdp,inbaowndp,inbacrtdt,inbacrtid, ",
               "  inbamodid,inbacnfdt,inbamoddt,inbapstid,inbacnfid,inbapstdt",
               " FROM inba_t ",
               " WHERE inbaent= ? AND inbadocno=? FOR UPDATE"
   LET l_sql = cl_sql_forupd(l_sql)                #轉換不同資料庫語法
   LET l_sql = cl_sql_add_mask(l_sql)              #遮蔽特定資料
   DECLARE aint302_ooff_cl CURSOR FROM l_sql

   CALL s_transaction_begin()

   OPEN aint302_ooff_cl USING g_enterprise,g_inba_m.inbadocno

   IF STATUS THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code =  STATUS
      LET g_errparam.extend = "OPEN aint302_ooff_cl:"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      CLOSE aint302_ooff_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF

   #鎖住將被更改的資料
   FETCH aint302_ooff_cl INTO g_inba_m.inbadocno,g_inba_m.inbasite,g_inba_m.inbadocdt,g_inba_m.inba002,g_inba_m.inba003,g_inba_m.inba004,#g_inba_m.inbastus,
                              g_inba_m.inba005,g_inba_m.inba006,g_inba_m.inba007,g_inba_m.inba008,g_inba_m.inbaownid,g_inba_m.inbacrtdp,g_inba_m.inbaowndp,g_inba_m.inbacrtdt,g_inba_m.inbacrtid,
                              g_inba_m.inbamodid,g_inba_m.inbacnfdt,g_inba_m.inbamoddt,g_inba_m.inbapstid,g_inba_m.inbacnfid,g_inba_m.inbapstdt

   #資料被他人LOCK, 或是sql執行時出現錯誤
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = g_inba_m.inbadocno
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = FALSE
      CALL cl_err()
      CLOSE aint302_ooff_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF

   #檢查是否允許此動作
   IF NOT aint302_action_chk() THEN
      CLOSE aint302_ooff_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF

   #將資料顯示到畫面上
   DISPLAY BY NAME g_inba_m.inbadocno,g_inba_m.inbasite,g_inba_m.inbadocdt,g_inba_m.inba002,g_inba_m.inba003,g_inba_m.inba004,#g_inba_m.inbastus,
                   g_inba_m.inba005,g_inba_m.inba006,g_inba_m.inba007,g_inba_m.inba008,g_inba_m.inbaownid,g_inba_m.inbacrtdp,g_inba_m.inbaowndp,g_inba_m.inbacrtdt,g_inba_m.inbacrtid,
                   g_inba_m.inbamodid,g_inba_m.inbacnfdt,g_inba_m.inbamoddt,g_inba_m.inbapstid,g_inba_m.inbacnfid,g_inba_m.inbapstdt

   LET g_detail_insert = cl_auth_detail_input("insert")
   LET g_detail_delete = cl_auth_detail_input("delete")

   LET g_ooff001_d = '6'   #6.單據單頭備註
   LET g_ooff002_d = g_prog
   LET g_ooff003_d = g_inba_m.inbadocno   #单号
   LET g_ooff004_d = 0    #项次
   LET g_ooff005_d = ' '
   LET g_ooff006_d = ' '
   LET g_ooff007_d = ' '
   LET g_ooff008_d = ' '
   LET g_ooff009_d = ' '
   LET g_ooff010_d = ' '
   LET g_ooff011_d = ' '

   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)

      SUBDIALOG aoo_aooi360_01.aooi360_01_input   #备注单身

      ON ACTION accept
         ACCEPT DIALOG

      ON ACTION cancel      #在dialog button (放棄)
         LET INT_FLAG = TRUE
         LET g_detail_idx  = 1
         LET g_detail_idx2 = 1
         #各個page指標
         LET g_detail_idx_list[1] = 1
         LET g_detail_idx_list[2] = 1
         LET g_detail_idx_list[3] = 1

         CALL g_curr_diag.setCurrentRow("s_detail1",1)
         CALL g_curr_diag.setCurrentRow("s_detail2",1)
         CALL g_curr_diag.setCurrentRow("s_detail3",1)

         EXIT DIALOG

      ON ACTION close       #在dialog 右上角 (X)
         LET INT_FLAG = TRUE
         EXIT DIALOG

      ON ACTION exit        #toolbar 離開
         LET INT_FLAG = TRUE
         LET g_detail_idx  = 1
         LET g_detail_idx2 = 1
         #各個page指標
         LET g_detail_idx_list[1] = 1
         LET g_detail_idx_list[2] = 1
         LET g_detail_idx_list[3] = 1

         CALL g_curr_diag.setCurrentRow("s_detail1",1)
         CALL g_curr_diag.setCurrentRow("s_detail2",1)
         CALL g_curr_diag.setCurrentRow("s_detail3",1)

         EXIT DIALOG

      #交談指令共用ACTION
      &include "common_action.4gl"
         CONTINUE DIALOG
   END DIALOG

   CLOSE aint302_ooff_cl

   CALL s_transaction_end('Y','0')

   CALL aooi360_01_b_fill(g_ooff001_d,g_ooff002_d,g_ooff003_d,g_ooff004_d,g_ooff005_d,g_ooff006_d,g_ooff007_d,g_ooff008_d,g_ooff009_d,g_ooff010_d,g_ooff011_d)   #备注单身

END FUNCTION

################################################################################
# Descriptions...: 條碼檢查
# Memo...........:
# Usage..........: CALL aint302_barcode_chk(p_inbbdocno,p_inbbseq,p_inbb026)
#                  RETURNING r_success
# Input parameter: p_inbbdocno  單號
#                : p_inbbseq    項次
#                : p_inbb026    條碼編號
# Return code....: r_success    執行結果
#                :
# Date & Author..: 170620 By earl
# Modify.........: #170310-00005#25
################################################################################
PRIVATE FUNCTION aint302_barcode_chk(p_inbbdocno,p_inbbseq,p_inbb026)
   DEFINE p_inbbdocno  LIKE inbb_t.inbbdocno
   DEFINE p_inbbseq    LIKE inbb_t.inbbseq
   DEFINE p_inbb026    LIKE inbb_t.inbb026
   DEFINE r_success    LIKE type_t.num5
   DEFINE l_cnt        LIKE type_t.num10
   DEFINE l_sql        STRING
   LET r_success = TRUE

   LET l_cnt = 0
   SELECT COUNT(1) INTO l_cnt
     FROM bcaa_t
    WHERE bcaaent = g_enterprise
      AND bcaasite = g_site
      AND bcaa000 = 1
      AND bcaa001 = p_inbb026
      AND bcaastus = 'Y'

   IF l_cnt > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ''
      LET g_errparam.code   = 'abc-00015'  #條碼%1已存在，請重新輸入！
      LET g_errparam.popup  = TRUE
      LET g_errparam.replace[1] = p_inbb026
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF


   LET l_sql = "SELECT COUNT(1)",
               "  FROM inba_t,inbb_t",
               " WHERE inbaent = inbbent AND inbbent = ",g_enterprise,
               "   AND inbadocno = inbbdocno",
               "   AND inbb026 = '",p_inbb026,"'",
               "   AND inbastus = 'N'"

   IF NOT cl_null(p_inbbdocno) AND NOT cl_null(p_inbbseq) THEN
      LET l_sql = l_sql," AND NOT (inbbdocno = '",p_inbbdocno,"' AND inbbseq = '",p_inbbseq,"')"
   END IF

   PREPARE aint302_pre01 FROM l_sql
   LET l_cnt = 0
   EXECUTE aint302_pre01 INTO l_cnt

   IF l_cnt > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ''
      LET g_errparam.code   = 'abc-00037'  #條碼%1重複輸入或存在其他未確認之單據！
      LET g_errparam.popup  = TRUE
      LET g_errparam.replace[1] = p_inbb026
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 條碼檢查
# Memo...........:
# Usage..........: CALL aint302_barcode_chk_1()
#                  RETURNING r_success
# Input parameter:
#                :
# Return code....:
#                :
# Date & Author..: 170726 By earl
# Modify.........: #170310-00005#27
################################################################################
PRIVATE FUNCTION aint302_inbb026_inbb001_chk()
   DEFINE r_success     LIKE type_t.num5
   DEFINE l_bcba002     LIKE bcba_t.bcba002

   LET r_success = TRUE
   IF NOT cl_null(g_inbb_d[l_ac].inbb026) AND NOT cl_null(g_inbb_d[l_ac].inbb001) THEN
      LET l_bcba002 = ''
      SELECT bcba002 INTO l_bcba002
        FROM imaf_t LEFT OUTER JOIN bcba_t ON bcbaent = imafent
                                          AND bcba001 = imaf178
                                          AND bcbastus = 'Y'
       WHERE imafent = g_enterprise
         AND imafsite = g_site
         AND imaf001 = g_inbb_d[l_ac].inbb001

      IF cl_null(l_bcba002) THEN
         LET l_bcba002 = '1'
      END IF

      IF NOT s_aint302_barcode_chk(g_inbb_d[l_ac].inbb026,l_bcba002,g_inba_m.inbadocno,g_inbb_d_t.inbbseq) THEN
         LET r_success = FALSE
         RETURN r_success
      END IF
   END IF

   RETURN r_success
END FUNCTION


{</section>}

