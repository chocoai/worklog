#該程式未解開Section, 採用最新樣板產出!
#該程式為freestyle程式!
{<section id="s_asft800.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0056(1900-01-01 00:00:00), PR版次:0056(2018-06-14 15:38:50)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000246
#+ Filename...: s_asft800
#+ Description: 工單變更作業元件
#+ Creator....: 01258(2014-04-30 13:48:29)
#+ Modifier...: 00000 -SD/PR- 09767
 
{</section>}
 
{<section id="s_asft800.global" type="s" >}
#應用 p00 樣板自動產生(Version:6)
#add-point:填寫註解說明 name="main.memo"
#170618-00297#1  2017/07/04   By 08992      修正總應發數量不應用單位設定的取位方式取位,應無條件進位需調整工單與工單變更中更新總應發數量單位取位的部份應調整為無條件進位(本來呼叫s_aooi250_take_decimals,改為呼叫s_num_round)
#170618-00452#1  2017/07/12   By 08171      1. 若該製程沒有任何報工點時,不需寫入數量
#                                           2. 發料制度=事先發料在變更後，轉入轉出數量不變(因為還沒發料，不會有轉出入)；倒扣料的話要回寫轉出入量
#160726-00001#10 2017/08/18   By fionchen   調整生產數量增減時,SET取替代備料的標準應發數量計算
#170807-00020#8  2017/08/25   By Mars       增加ERP拋轉MES單據別判斷
#170904-00001#1  2017/09/18   By 07423      修正#160726-00001#10,若有SET取替代時,一般備料數量計算有誤
#170929-00029#1  2017/10/20   By 08171      單頭發料制度=2.到扣料 OR 整張單身都到扣料時，要回寫在製量
#171020-00007#1  2017/10/25   By 04226      工單變更生產數量時，產生條碼數量需一同變更
#170816-00007#85 2017/11/09   By 10046      調整公用元件錯誤訊息,顯示更明確的資訊內容
#171115-00011#1  2017/11/15   By 05426      变更工单开工日期但是不重新计算完工日期时，更新sfcb资料中完工日期错误问题修正
#171123-00012#1  2017/11/24   By 05426      变更生产数量检查已入库与已发足套数关系时，考虑料件超交率
#171019-00015#31 2018/01/08   By 10042      mark非必要的site對應
#180108-00032#1  2018/01/09   By 08734      修正工单变更单单头的生产数量后，单身的调整应发量被清0，没有按照损耗计算调整应发量问题。#
#180323-00018#1  2018/03/27   By 04441      回寫製程檔增加RC條件
#170618-00276#1  2018/03/23   By 01534      多特征数量可以变更，变更后重新产生备料档，并判断每一笔备料是否发生变更\新增\删除，将备料档变更状态自动写入
#180503-00021#1  2018/05/28   By 07423      工單變更單更新工單時,取消工單結案的更新,改由呼叫asfp500的工單結案funcntion
#171110-00021#12 2018/06/06   by 09767      资料来源为3.计划时，变更生产数量，需回写psos062
#end add-point
#add-point:填寫註解說明(客製用) name="main.memo_customerization"

#end add-point
#(ver:6) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:6) --- end ---
 
IMPORT os
#add-point:增加匯入項目 name="main.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
{</section>}
 
{<section id="s_asft800.free_style_variable" type="s" >}
#add-point:free_style模組變數(Module Variable) name="free_style.variable"
GLOBALS #160726-00020#19 add
TYPE type_g_replace     RECORD
                    sfkgseq     LIKE sfkg_t.sfkgseq,
                    sfkgseq1    LIKE sfkg_t.sfkgseq1,
                    sfkg022     LIKE sfkg_t.sfkg022,  #替代率
                    sfkg023_t   LIKE sfkg_t.sfkg023,  #标准应发-变更前
                    sfkg024_t   LIKE sfkg_t.sfkg024,  #调整量-变更前
                    sfkg013_t   LIKE sfkg_t.sfkg013,  #实际应发-变更前
                    sfkg010     LIKE sfkg_t.sfkg010,  #標準QPA  #160905-00022#2
                    sfkg011     LIKE sfkg_t.sfkg011,  #實際QPA  #160905-00022#2
                    sfkg014     LIKE sfkg_t.sfkg014,  #單位     #160905-00022#2
                    sfkg015     LIKE sfkg_t.sfkg015,  #委外代买数量
                    sfkg016     LIKE sfkg_t.sfkg016,  #已发数量
                    sfkg023     LIKE sfkg_t.sfkg023,  #标准应发-变更后
                    sfkg024     LIKE sfkg_t.sfkg024,  #调整量-变更后
                    sfkg013     LIKE sfkg_t.sfkg013   #实际应发-变更后
                                END RECORD
DEFINE g_replace                DYNAMIC ARRAY OF type_g_replace
DEFINE g_replace_cnt            LIKE type_t.num10
END GLOBALS #160726-00020#19 add

#end add-point
 
{</section>}
 
{<section id="s_asft800.global_variable" type="s" >}
#add-point:自定義模組變數(Module Variable) name="global.variable"
GLOBALS #160726-00020#19 add
DEFINE g_sfkh007             LIKE sfkh_t.sfkh007
#170816-00007#85 add --s
DEFINE g_colname_1   STRING   
DEFINE g_comment_1   STRING       
DEFINE g_msg         STRING   #錯誤訊息
#170816-00007#85 add --e
END GLOBALS #160726-00020#19 add
#end add-point
 
{</section>}
 
{<section id="s_asft800.other_dialog" type="s" >}

 
{</section>}
 
{<section id="s_asft800.other_function" readonly="Y" type="s" >}

################################################################################
# Descriptions...: 創建臨時表
# Memo...........:
# Usage..........: CALL s_asft800_create_temp()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2017/03/27 By lixh
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft800_create_temp()
   CREATE TEMP TABLE s_asft800_tmp (
       sfaaent LIKE sfaa_t.sfaaent, #企業編號
       sfaaownid LIKE sfaa_t.sfaaownid, #資料所有者
       sfaaowndp LIKE sfaa_t.sfaaowndp, #資料所有部門
       sfaacrtid LIKE sfaa_t.sfaacrtid, #資料建立者
       sfaacrtdp LIKE sfaa_t.sfaacrtdp, #資料建立部門
       sfaacrtdt LIKE sfaa_t.sfaacrtdt, #資料創建日
       sfaamodid LIKE sfaa_t.sfaamodid, #資料修改者
       sfaamoddt LIKE sfaa_t.sfaamoddt, #最近修改日
       sfaacnfid LIKE sfaa_t.sfaacnfid, #資料確認者
       sfaacnfdt LIKE sfaa_t.sfaacnfdt, #資料確認日
       sfaapstid LIKE sfaa_t.sfaapstid, #資料過帳者
       sfaapstdt LIKE sfaa_t.sfaapstdt, #資料過帳日
       sfaastus LIKE sfaa_t.sfaastus, #狀態碼
       sfaasite LIKE sfaa_t.sfaasite, #營運據點
       sfaadocno LIKE sfaa_t.sfaadocno, #單號
       sfaadocdt LIKE sfaa_t.sfaadocdt, #單據日期
       sfaa001 LIKE sfaa_t.sfaa001, #變更版本
       sfaa002 LIKE sfaa_t.sfaa002, #生管人員
       sfaa003 LIKE sfaa_t.sfaa003, #工單類型
       sfaa004 LIKE sfaa_t.sfaa004, #發料制度
       sfaa005 LIKE sfaa_t.sfaa005, #工單來源
       sfaa006 LIKE sfaa_t.sfaa006, #來源單號
       sfaa007 LIKE sfaa_t.sfaa007, #來源項次
       sfaa008 LIKE sfaa_t.sfaa008, #來源項序
       sfaa009 LIKE sfaa_t.sfaa009, #參考客戶
       sfaa010 LIKE sfaa_t.sfaa010, #生產料號
       sfaa011 LIKE sfaa_t.sfaa011, #特性
       sfaa012 LIKE sfaa_t.sfaa012, #生產數量
       sfaa013 LIKE sfaa_t.sfaa013, #生產單位
       sfaa014 LIKE sfaa_t.sfaa014, #BOM版本
       sfaa015 LIKE sfaa_t.sfaa015, #BOM有效日期
       sfaa016 LIKE sfaa_t.sfaa016, #製程編號
       sfaa017 LIKE sfaa_t.sfaa017, #部門供應商
       sfaa018 LIKE sfaa_t.sfaa018, #協作據點
       sfaa019 LIKE sfaa_t.sfaa019, #預計開工日
       sfaa020 LIKE sfaa_t.sfaa020, #預計完工日
       sfaa021 LIKE sfaa_t.sfaa021, #母工單單號
       sfaa022 LIKE sfaa_t.sfaa022, #參考原始單號
       sfaa023 LIKE sfaa_t.sfaa023, #參考原始項次
       sfaa024 LIKE sfaa_t.sfaa024, #參考原始項序
       sfaa025 LIKE sfaa_t.sfaa025, #前工單單號
       sfaa026 LIKE sfaa_t.sfaa026, #料表批號(PBI)
       sfaa027 LIKE sfaa_t.sfaa027, #No Use
       sfaa028 LIKE sfaa_t.sfaa028, #專案編號
       sfaa029 LIKE sfaa_t.sfaa029, #WBS
       sfaa030 LIKE sfaa_t.sfaa030, #活動
       sfaa031 LIKE sfaa_t.sfaa031, #理由碼
       sfaa032 LIKE sfaa_t.sfaa032, #緊急比率
       sfaa033 LIKE sfaa_t.sfaa033, #優先順序
       sfaa034 LIKE sfaa_t.sfaa034, #預計入庫庫位
       sfaa035 LIKE sfaa_t.sfaa035, #預計入庫儲位
       sfaa036 LIKE sfaa_t.sfaa036, #手冊編號
       sfaa037 LIKE sfaa_t.sfaa037, #保稅核准文號
       sfaa038 LIKE sfaa_t.sfaa038, #保稅核銷
       sfaa039 LIKE sfaa_t.sfaa039, #備料已產生
       sfaa040 LIKE sfaa_t.sfaa040, #生產途程已確認
       sfaa041 LIKE sfaa_t.sfaa041, #凍結
       sfaa042 LIKE sfaa_t.sfaa042, #重工
       sfaa043 LIKE sfaa_t.sfaa043, #備置
       sfaa044 LIKE sfaa_t.sfaa044, #FQC
       sfaa045 LIKE sfaa_t.sfaa045, #實際開始發料日
       sfaa046 LIKE sfaa_t.sfaa046, #最後入庫日
       sfaa047 LIKE sfaa_t.sfaa047, #生管結案日
       sfaa048 LIKE sfaa_t.sfaa048, #成本結案日
       sfaa049 LIKE sfaa_t.sfaa049, #已發料套數
       sfaa050 LIKE sfaa_t.sfaa050, #已入庫合格量
       sfaa051 LIKE sfaa_t.sfaa051, #已入庫不合格量
       sfaa052 LIKE sfaa_t.sfaa052, #Bouns
       sfaa053 LIKE sfaa_t.sfaa053, #工單轉入數量
       sfaa054 LIKE sfaa_t.sfaa054, #工單轉出數量
       sfaa055 LIKE sfaa_t.sfaa055, #下線數量
       sfaa056 LIKE sfaa_t.sfaa056, #報廢數量
       sfaa057 LIKE sfaa_t.sfaa057, #委外類型
       sfaa058 LIKE sfaa_t.sfaa058, #參考數量
       sfaa059 LIKE sfaa_t.sfaa059, #預計入庫批號
       sfaa060 LIKE sfaa_t.sfaa060, #參考單位
       sfaa061 LIKE sfaa_t.sfaa061, #製程
       sfaa062 LIKE sfaa_t.sfaa062, #納入AMRP計算
       sfaa063 LIKE sfaa_t.sfaa063, #來源分批序
       sfaa064 LIKE sfaa_t.sfaa064, #參考原始分批序
       sfaa065 LIKE sfaa_t.sfaa065, #生管結案狀態
       sfaa066 LIKE sfaa_t.sfaa066, #多角流程編號
       sfaa067 LIKE sfaa_t.sfaa067, #多角流程式號
       sfaa068 LIKE sfaa_t.sfaa068, #成本中心
       sfaa069 LIKE sfaa_t.sfaa069, #可供給量
       sfaa070 LIKE sfaa_t.sfaa070, #原始預計完工日期
       sfaaud001 LIKE sfaa_t.sfaaud001, #自定義欄位(文字)001
       sfaaud002 LIKE sfaa_t.sfaaud002, #自定義欄位(文字)002
       sfaaud003 LIKE sfaa_t.sfaaud003, #自定義欄位(文字)003
       sfaaud004 LIKE sfaa_t.sfaaud004, #自定義欄位(文字)004
       sfaaud005 LIKE sfaa_t.sfaaud005, #自定義欄位(文字)005
       sfaaud006 LIKE sfaa_t.sfaaud006, #自定義欄位(文字)006
       sfaaud007 LIKE sfaa_t.sfaaud007, #自定義欄位(文字)007
       sfaaud008 LIKE sfaa_t.sfaaud008, #自定義欄位(文字)008
       sfaaud009 LIKE sfaa_t.sfaaud009, #自定義欄位(文字)009
       sfaaud010 LIKE sfaa_t.sfaaud010, #自定義欄位(文字)010
       sfaaud011 LIKE sfaa_t.sfaaud011, #自定義欄位(數字)011
       sfaaud012 LIKE sfaa_t.sfaaud012, #自定義欄位(數字)012
       sfaaud013 LIKE sfaa_t.sfaaud013, #自定義欄位(數字)013
       sfaaud014 LIKE sfaa_t.sfaaud014, #自定義欄位(數字)014
       sfaaud015 LIKE sfaa_t.sfaaud015, #自定義欄位(數字)015
       sfaaud016 LIKE sfaa_t.sfaaud016, #自定義欄位(數字)016
       sfaaud017 LIKE sfaa_t.sfaaud017, #自定義欄位(數字)017
       sfaaud018 LIKE sfaa_t.sfaaud018, #自定義欄位(數字)018
       sfaaud019 LIKE sfaa_t.sfaaud019, #自定義欄位(數字)019
       sfaaud020 LIKE sfaa_t.sfaaud020, #自定義欄位(數字)020
       sfaaud021 LIKE sfaa_t.sfaaud021, #自定義欄位(日期時間)021
       sfaaud022 LIKE sfaa_t.sfaaud022, #自定義欄位(日期時間)022
       sfaaud023 LIKE sfaa_t.sfaaud023, #自定義欄位(日期時間)023
       sfaaud024 LIKE sfaa_t.sfaaud024, #自定義欄位(日期時間)024
       sfaaud025 LIKE sfaa_t.sfaaud025, #自定義欄位(日期時間)025
       sfaaud026 LIKE sfaa_t.sfaaud026, #自定義欄位(日期時間)026
       sfaaud027 LIKE sfaa_t.sfaaud027, #自定義欄位(日期時間)027
       sfaaud028 LIKE sfaa_t.sfaaud028, #自定義欄位(日期時間)028
       sfaaud029 LIKE sfaa_t.sfaaud029, #自定義欄位(日期時間)029
       sfaaud030 LIKE sfaa_t.sfaaud030, #自定義欄位(日期時間)030
       sfaa071 LIKE sfaa_t.sfaa071, #齊料套數
       sfaa072 LIKE sfaa_t.sfaa072, #保稅否
       sfaa073 LIKE sfaa_t.sfaa073,  #預計入庫庫存管理特徵
       sfaa074 LIKE sfaa_t.sfaa074
       );

   CREATE TEMP TABLE s_asft800_tmp2 ( 
       sfabent LIKE sfab_t.sfabent, #企業編號
       sfabsite LIKE sfab_t.sfabsite, #營運據點
       sfabdocno LIKE sfab_t.sfabdocno, #單號
       sfab001 LIKE sfab_t.sfab001, #來源
       sfab002 LIKE sfab_t.sfab002, #來源單號
       sfab003 LIKE sfab_t.sfab003, #來源項次
       sfab004 LIKE sfab_t.sfab004, #來源項序
       sfab005 LIKE sfab_t.sfab005, #分批序
       sfab006 LIKE sfab_t.sfab006, #分配優先序
       sfab007 LIKE sfab_t.sfab007, #本次轉開工單量
       sfabseq LIKE sfab_t.sfabseq, #項次
       sfabud001 LIKE sfab_t.sfabud001, #自定義欄位(文字)001
       sfabud002 LIKE sfab_t.sfabud002, #自定義欄位(文字)002
       sfabud003 LIKE sfab_t.sfabud003, #自定義欄位(文字)003
       sfabud004 LIKE sfab_t.sfabud004, #自定義欄位(文字)004
       sfabud005 LIKE sfab_t.sfabud005, #自定義欄位(文字)005
       sfabud006 LIKE sfab_t.sfabud006, #自定義欄位(文字)006
       sfabud007 LIKE sfab_t.sfabud007, #自定義欄位(文字)007
       sfabud008 LIKE sfab_t.sfabud008, #自定義欄位(文字)008
       sfabud009 LIKE sfab_t.sfabud009, #自定義欄位(文字)009
       sfabud010 LIKE sfab_t.sfabud010, #自定義欄位(文字)010
       sfabud011 LIKE sfab_t.sfabud011, #自定義欄位(數字)011
       sfabud012 LIKE sfab_t.sfabud012, #自定義欄位(數字)012
       sfabud013 LIKE sfab_t.sfabud013, #自定義欄位(數字)013
       sfabud014 LIKE sfab_t.sfabud014, #自定義欄位(數字)014
       sfabud015 LIKE sfab_t.sfabud015, #自定義欄位(數字)015
       sfabud016 LIKE sfab_t.sfabud016, #自定義欄位(數字)016
       sfabud017 LIKE sfab_t.sfabud017, #自定義欄位(數字)017
       sfabud018 LIKE sfab_t.sfabud018, #自定義欄位(數字)018
       sfabud019 LIKE sfab_t.sfabud019, #自定義欄位(數字)019
       sfabud020 LIKE sfab_t.sfabud020, #自定義欄位(數字)020
       sfabud021 LIKE sfab_t.sfabud021, #自定義欄位(日期時間)021
       sfabud022 LIKE sfab_t.sfabud022, #自定義欄位(日期時間)022
       sfabud023 LIKE sfab_t.sfabud023, #自定義欄位(日期時間)023
       sfabud024 LIKE sfab_t.sfabud024, #自定義欄位(日期時間)024
       sfabud025 LIKE sfab_t.sfabud025, #自定義欄位(日期時間)025
       sfabud026 LIKE sfab_t.sfabud026, #自定義欄位(日期時間)026
       sfabud027 LIKE sfab_t.sfabud027, #自定義欄位(日期時間)027
       sfabud028 LIKE sfab_t.sfabud028, #自定義欄位(日期時間)028
       sfabud029 LIKE sfab_t.sfabud029, #自定義欄位(日期時間)029
       sfabud030 LIKE sfab_t.sfabud030, #自定義欄位(日期時間)030
       sfab008   LIKE sfab_t.sfab008, #備註
       sfab009   LIKE sfab_t.sfab009 
       );

   CREATE TEMP TABLE s_asft800_tmp3 ( 
       sfacent LIKE sfac_t.sfacent, #企業編號
       sfacsite LIKE sfac_t.sfacsite, #營運據點
       sfacdocno LIKE sfac_t.sfacdocno, #單號
       sfac001 LIKE sfac_t.sfac001, #料件編號
       sfac002 LIKE sfac_t.sfac002, #類型
       sfac003 LIKE sfac_t.sfac003, #預計產出量
       sfac004 LIKE sfac_t.sfac004, #單位
       sfac005 LIKE sfac_t.sfac005, #實際產出數量
       sfacseq LIKE sfac_t.sfacseq, #項次
       sfac006 LIKE sfac_t.sfac006, #產品特徵
       sfacud001 LIKE sfac_t.sfacud001, #自定義欄位(文字)001
       sfacud002 LIKE sfac_t.sfacud002, #自定義欄位(文字)002
       sfacud003 LIKE sfac_t.sfacud003, #自定義欄位(文字)003
       sfacud004 LIKE sfac_t.sfacud004, #自定義欄位(文字)004
       sfacud005 LIKE sfac_t.sfacud005, #自定義欄位(文字)005
       sfacud006 LIKE sfac_t.sfacud006, #自定義欄位(文字)006
       sfacud007 LIKE sfac_t.sfacud007, #自定義欄位(文字)007
       sfacud008 LIKE sfac_t.sfacud008, #自定義欄位(文字)008
       sfacud009 LIKE sfac_t.sfacud009, #自定義欄位(文字)009
       sfacud010 LIKE sfac_t.sfacud010, #自定義欄位(文字)010
       sfacud011 LIKE sfac_t.sfacud011, #自定義欄位(數字)011
       sfacud012 LIKE sfac_t.sfacud012, #自定義欄位(數字)012
       sfacud013 LIKE sfac_t.sfacud013, #自定義欄位(數字)013
       sfacud014 LIKE sfac_t.sfacud014, #自定義欄位(數字)014
       sfacud015 LIKE sfac_t.sfacud015, #自定義欄位(數字)015
       sfacud016 LIKE sfac_t.sfacud016, #自定義欄位(數字)016
       sfacud017 LIKE sfac_t.sfacud017, #自定義欄位(數字)017
       sfacud018 LIKE sfac_t.sfacud018, #自定義欄位(數字)018
       sfacud019 LIKE sfac_t.sfacud019, #自定義欄位(數字)019
       sfacud020 LIKE sfac_t.sfacud020, #自定義欄位(數字)020
       sfacud021 LIKE sfac_t.sfacud021, #自定義欄位(日期時間)021
       sfacud022 LIKE sfac_t.sfacud022, #自定義欄位(日期時間)022
       sfacud023 LIKE sfac_t.sfacud023, #自定義欄位(日期時間)023
       sfacud024 LIKE sfac_t.sfacud024, #自定義欄位(日期時間)024
       sfacud025 LIKE sfac_t.sfacud025, #自定義欄位(日期時間)025
       sfacud026 LIKE sfac_t.sfacud026, #自定義欄位(日期時間)026
       sfacud027 LIKE sfac_t.sfacud027, #自定義欄位(日期時間)027
       sfacud028 LIKE sfac_t.sfacud028, #自定義欄位(日期時間)028
       sfacud029 LIKE sfac_t.sfacud029, #自定義欄位(日期時間)029
       sfacud030 LIKE sfac_t.sfacud030, #自定義欄位(日期時間)030
       sfac007 LIKE sfac_t.sfac007 #保稅否
       );
       
   CREATE TEMP TABLE s_asft800_tmp4 ( 
       sfbaent LIKE sfba_t.sfbaent, #企業編號
       sfbasite LIKE sfba_t.sfbasite, #營運據點
       sfbadocno LIKE sfba_t.sfbadocno, #單號
       sfbaseq LIKE sfba_t.sfbaseq, #項次
       sfbaseq1 LIKE sfba_t.sfbaseq1, #項序
       sfba001 LIKE sfba_t.sfba001, #上階料號
       sfba002 LIKE sfba_t.sfba002, #部位
       sfba003 LIKE sfba_t.sfba003, #作業編號
       sfba004 LIKE sfba_t.sfba004, #作業序
       sfba005 LIKE sfba_t.sfba005, #BOM料號
       sfba006 LIKE sfba_t.sfba006, #發料料號
       sfba007 LIKE sfba_t.sfba007, #投料時距
       sfba008 LIKE sfba_t.sfba008, #必要特性
       sfba009 LIKE sfba_t.sfba009, #倒扣料
       sfba010 LIKE sfba_t.sfba010, #標準QPA分子
       sfba011 LIKE sfba_t.sfba011, #標準QPA分母
       sfba012 LIKE sfba_t.sfba012, #允許誤差率
       sfba013 LIKE sfba_t.sfba013, #應發數量
       sfba014 LIKE sfba_t.sfba014, #單位
       sfba015 LIKE sfba_t.sfba015, #委外代買數量
       sfba016 LIKE sfba_t.sfba016, #已發數量
       sfba017 LIKE sfba_t.sfba017, #報廢數量
       sfba018 LIKE sfba_t.sfba018, #盤盈虧數量
       sfba019 LIKE sfba_t.sfba019, #指定發料倉庫
       sfba020 LIKE sfba_t.sfba020, #指定發料儲位
       sfba021 LIKE sfba_t.sfba021, #產品特徵
       sfba022 LIKE sfba_t.sfba022, #替代率
       sfba023 LIKE sfba_t.sfba023, #標準應發數量
       sfba024 LIKE sfba_t.sfba024, #調整應發數量
       sfba025 LIKE sfba_t.sfba025, #超領數量
       sfba026 LIKE sfba_t.sfba026, #SET替代狀態
       sfba027 LIKE sfba_t.sfba027, #SET替代群組
       sfba028 LIKE sfba_t.sfba028, #客供料
       sfba029 LIKE sfba_t.sfba029, #指定發料批號
       sfba030 LIKE sfba_t.sfba030, #指定庫存管理特徵
       sfbaud001 LIKE sfba_t.sfbaud001, #自定義欄位(文字)001
       sfbaud002 LIKE sfba_t.sfbaud002, #自定義欄位(文字)002
       sfbaud003 LIKE sfba_t.sfbaud003, #自定義欄位(文字)003
       sfbaud004 LIKE sfba_t.sfbaud004, #自定義欄位(文字)004
       sfbaud005 LIKE sfba_t.sfbaud005, #自定義欄位(文字)005
       sfbaud006 LIKE sfba_t.sfbaud006, #自定義欄位(文字)006
       sfbaud007 LIKE sfba_t.sfbaud007, #自定義欄位(文字)007
       sfbaud008 LIKE sfba_t.sfbaud008, #自定義欄位(文字)008
       sfbaud009 LIKE sfba_t.sfbaud009, #自定義欄位(文字)009
       sfbaud010 LIKE sfba_t.sfbaud010, #自定義欄位(文字)010
       sfbaud011 LIKE sfba_t.sfbaud011, #自定義欄位(數字)011
       sfbaud012 LIKE sfba_t.sfbaud012, #自定義欄位(數字)012
       sfbaud013 LIKE sfba_t.sfbaud013, #自定義欄位(數字)013
       sfbaud014 LIKE sfba_t.sfbaud014, #自定義欄位(數字)014
       sfbaud015 LIKE sfba_t.sfbaud015, #自定義欄位(數字)015
       sfbaud016 LIKE sfba_t.sfbaud016, #自定義欄位(數字)016
       sfbaud017 LIKE sfba_t.sfbaud017, #自定義欄位(數字)017
       sfbaud018 LIKE sfba_t.sfbaud018, #自定義欄位(數字)018
       sfbaud019 LIKE sfba_t.sfbaud019, #自定義欄位(數字)019
       sfbaud020 LIKE sfba_t.sfbaud020, #自定義欄位(數字)020
       sfbaud021 LIKE sfba_t.sfbaud021, #自定義欄位(日期時間)021
       sfbaud022 LIKE sfba_t.sfbaud022, #自定義欄位(日期時間)022
       sfbaud023 LIKE sfba_t.sfbaud023, #自定義欄位(日期時間)023
       sfbaud024 LIKE sfba_t.sfbaud024, #自定義欄位(日期時間)024
       sfbaud025 LIKE sfba_t.sfbaud025, #自定義欄位(日期時間)025
       sfbaud026 LIKE sfba_t.sfbaud026, #自定義欄位(日期時間)026
       sfbaud027 LIKE sfba_t.sfbaud027, #自定義欄位(日期時間)027
       sfbaud028 LIKE sfba_t.sfbaud028, #自定義欄位(日期時間)028
       sfbaud029 LIKE sfba_t.sfbaud029, #自定義欄位(日期時間)029
       sfbaud030 LIKE sfba_t.sfbaud030, #自定義欄位(日期時間)030
       sfba031 LIKE sfba_t.sfba031, #備置量
       sfba032 LIKE sfba_t.sfba032, #備置理由碼
       sfba033 LIKE sfba_t.sfba033, #保稅否
       sfba034 LIKE sfba_t.sfba034, #SET被替代群組
       sfba035 LIKE sfba_t.sfba035, #SET替代套數
       sfba036 LIKE sfba_t.sfba036, #SET已發料套數
       sfba037 LIKE sfba_t.sfba037 #替代群組
       );
       
   CREATE TEMP TABLE s_asft800_tmp5 ( 
       sfbaent LIKE sfba_t.sfbaent, #企業編號
       sfbasite LIKE sfba_t.sfbasite, #營運據點
       sfbadocno LIKE sfba_t.sfbadocno, #單號
       sfbaseq LIKE sfba_t.sfbaseq, #項次
       sfbaseq1 LIKE sfba_t.sfbaseq1, #項序
       sfba001 LIKE sfba_t.sfba001, #上階料號
       sfba002 LIKE sfba_t.sfba002, #部位
       sfba003 LIKE sfba_t.sfba003, #作業編號
       sfba004 LIKE sfba_t.sfba004, #作業序
       sfba005 LIKE sfba_t.sfba005, #BOM料號
       sfba006 LIKE sfba_t.sfba006, #發料料號
       sfba007 LIKE sfba_t.sfba007, #投料時距
       sfba008 LIKE sfba_t.sfba008, #必要特性
       sfba009 LIKE sfba_t.sfba009, #倒扣料
       sfba010 LIKE sfba_t.sfba010, #標準QPA分子
       sfba011 LIKE sfba_t.sfba011, #標準QPA分母
       sfba012 LIKE sfba_t.sfba012, #允許誤差率
       sfba013 LIKE sfba_t.sfba013, #應發數量
       sfba014 LIKE sfba_t.sfba014, #單位
       sfba015 LIKE sfba_t.sfba015, #委外代買數量
       sfba016 LIKE sfba_t.sfba016, #已發數量
       sfba017 LIKE sfba_t.sfba017, #報廢數量
       sfba018 LIKE sfba_t.sfba018, #盤盈虧數量
       sfba019 LIKE sfba_t.sfba019, #指定發料倉庫
       sfba020 LIKE sfba_t.sfba020, #指定發料儲位
       sfba021 LIKE sfba_t.sfba021, #產品特徵
       sfba022 LIKE sfba_t.sfba022, #替代率
       sfba023 LIKE sfba_t.sfba023, #標準應發數量
       sfba024 LIKE sfba_t.sfba024, #調整應發數量
       sfba025 LIKE sfba_t.sfba025, #超領數量
       sfba026 LIKE sfba_t.sfba026, #SET替代狀態
       sfba027 LIKE sfba_t.sfba027, #SET替代群組
       sfba028 LIKE sfba_t.sfba028, #客供料
       sfba029 LIKE sfba_t.sfba029, #指定發料批號
       sfba030 LIKE sfba_t.sfba030, #指定庫存管理特徵
       sfbaud001 LIKE sfba_t.sfbaud001, #自定義欄位(文字)001
       sfbaud002 LIKE sfba_t.sfbaud002, #自定義欄位(文字)002
       sfbaud003 LIKE sfba_t.sfbaud003, #自定義欄位(文字)003
       sfbaud004 LIKE sfba_t.sfbaud004, #自定義欄位(文字)004
       sfbaud005 LIKE sfba_t.sfbaud005, #自定義欄位(文字)005
       sfbaud006 LIKE sfba_t.sfbaud006, #自定義欄位(文字)006
       sfbaud007 LIKE sfba_t.sfbaud007, #自定義欄位(文字)007
       sfbaud008 LIKE sfba_t.sfbaud008, #自定義欄位(文字)008
       sfbaud009 LIKE sfba_t.sfbaud009, #自定義欄位(文字)009
       sfbaud010 LIKE sfba_t.sfbaud010, #自定義欄位(文字)010
       sfbaud011 LIKE sfba_t.sfbaud011, #自定義欄位(數字)011
       sfbaud012 LIKE sfba_t.sfbaud012, #自定義欄位(數字)012
       sfbaud013 LIKE sfba_t.sfbaud013, #自定義欄位(數字)013
       sfbaud014 LIKE sfba_t.sfbaud014, #自定義欄位(數字)014
       sfbaud015 LIKE sfba_t.sfbaud015, #自定義欄位(數字)015
       sfbaud016 LIKE sfba_t.sfbaud016, #自定義欄位(數字)016
       sfbaud017 LIKE sfba_t.sfbaud017, #自定義欄位(數字)017
       sfbaud018 LIKE sfba_t.sfbaud018, #自定義欄位(數字)018
       sfbaud019 LIKE sfba_t.sfbaud019, #自定義欄位(數字)019
       sfbaud020 LIKE sfba_t.sfbaud020, #自定義欄位(數字)020
       sfbaud021 LIKE sfba_t.sfbaud021, #自定義欄位(日期時間)021
       sfbaud022 LIKE sfba_t.sfbaud022, #自定義欄位(日期時間)022
       sfbaud023 LIKE sfba_t.sfbaud023, #自定義欄位(日期時間)023
       sfbaud024 LIKE sfba_t.sfbaud024, #自定義欄位(日期時間)024
       sfbaud025 LIKE sfba_t.sfbaud025, #自定義欄位(日期時間)025
       sfbaud026 LIKE sfba_t.sfbaud026, #自定義欄位(日期時間)026
       sfbaud027 LIKE sfba_t.sfbaud027, #自定義欄位(日期時間)027
       sfbaud028 LIKE sfba_t.sfbaud028, #自定義欄位(日期時間)028
       sfbaud029 LIKE sfba_t.sfbaud029, #自定義欄位(日期時間)029
       sfbaud030 LIKE sfba_t.sfbaud030, #自定義欄位(日期時間)030
       sfba031 LIKE sfba_t.sfba031, #備置量
       sfba032 LIKE sfba_t.sfba032, #備置理由碼
       sfba033 LIKE sfba_t.sfba033, #保稅否
       sfba034 LIKE sfba_t.sfba034, #SET被替代群組
       sfba035 LIKE sfba_t.sfba035, #SET替代套數
       sfba036 LIKE sfba_t.sfba036, #SET已發料套數
       sfba037 LIKE sfba_t.sfba037, #替代群組
       btype   LIKE sfkg_t.sfkg901  #變更類型
       );       
END FUNCTION

################################################################################
# Descriptions...: 新增工单变更历程档
# Memo...........:
# Usage..........: CALL s_asft800_ins_sfkh(p_sfkhdocno,p_sfkhseq,p_sfkhseq1,p_sfkh001,p_sfkh002,p_sfkh003,p_sfkh004,p_sfkh005,p_sfkh007)
#                  RETURNING r_success
# Input parameter: 1.p_sfkhdocno                LIKE sfkh_t.sfkhdocn
#                : 2.p_sfkhseq                  LIKE sfkh_t.sfkhseq
#                : 3.p_sfkhseq1                 LIKE sfkh_t.sfkhseq1
#                : 4.p_sfkh001                  LIKE sfkh_t.sfkh001
#                : 5.p_sfkh002                  LIKE sfkh_t.sfkh002
#                : 6.p_sfkh003                  LIKE sfkh_t.sfkh003
#                : 7.p_sfkh004                  LIKE sfkh_t.sfkh004
#                : 8.p_sfkh005                  LIKE sfkh_t.sfkh005
#                : 9.p_sfkh007                  LIKE sfkh_t.sfkh007
# Return code....: 1.r_success                  LIKE type_t.num5
# Date & Author..: 14/05/28 By wuxja
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft800_ins_sfkh(p_sfkhdocno,p_sfkhseq,p_sfkhseq1,p_sfkh001,p_sfkh002,p_sfkh003,p_sfkh004,p_sfkh005,p_sfkh007)
DEFINE p_sfkhdocno                LIKE sfkh_t.sfkhdocno
DEFINE p_sfkhseq                  LIKE sfkh_t.sfkhseq
DEFINE p_sfkhseq1                 LIKE sfkh_t.sfkhseq1
DEFINE p_sfkh001                  LIKE sfkh_t.sfkh001
DEFINE p_sfkh002                  LIKE sfkh_t.sfkh002
DEFINE p_sfkh003                  LIKE sfkh_t.sfkh003
DEFINE p_sfkh004                  LIKE sfkh_t.sfkh004
DEFINE p_sfkh005                  LIKE sfkh_t.sfkh005
DEFINE p_sfkh007                  LIKE sfkh_t.sfkh007
DEFINE r_success                  LIKE type_t.num5
DEFINE l_sfkh006                  DATETIME YEAR TO SECOND




   LET r_success = FALSE
   #170816-00007#85 mark --s
   #IF cl_null(p_sfkhdocno) OR cl_null(p_sfkhseq) OR cl_null(p_sfkhseq1) OR cl_null(p_sfkh001) OR cl_null(p_sfkh002) THEN
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.code = 'sub-00001'
   #   LET g_errparam.extend = ''
   #   LET g_errparam.popup = TRUE
   #   CALL cl_err()
   #
   #   RETURN r_success
   #END IF
   #170816-00007#85 mark --e
   #170816-00007#85 add --s
   LET g_msg = ''
   IF cl_null(p_sfkhdocno) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("asfp100","lbl_sfaadocno") RETURNING g_colname_1,g_comment_1   #工單單號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_sfkhseq) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("asfp310","lbl_seq_2") RETURNING g_colname_1,g_comment_1   #項次
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_sfkhseq1) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("asfp320","lbl_l_inaoseq1") RETURNING g_colname_1,g_comment_1   #項序
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
    IF cl_null(p_sfkh001) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("asf-00901",g_dlang)   #變更序
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_sfkh002) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("asf-00902",g_dlang)   #變更欄位
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF NOT cl_null(g_msg) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00788'  #%1傳入值為空(錯誤)
      LET g_errparam.popup = TRUE
      LET g_errparam.replace[1] = g_msg 
      CALL cl_err()
      RETURN r_success
   END IF
   #170816-00007#85 add --e
   IF NOT s_asft800_del_sfkh(p_sfkhdocno,p_sfkhseq,p_sfkhseq1,p_sfkh001,p_sfkh002) THEN
      RETURN r_success
   END IF
   LET l_sfkh006 = cl_get_current()
   INSERT INTO sfkh_t(sfkhent,sfkhsite,sfkhdocno,sfkhseq,sfkhseq1,sfkh001,sfkh002,
                      sfkh003,sfkh004,sfkh005,sfkh006,sfkh007,
                      sfkhownid,sfkhowndp,sfkhcrtid,sfkhcrtdp,sfkhcrtdt,sfkhstus)
              VALUES (g_enterprise,g_site,p_sfkhdocno,p_sfkhseq,p_sfkhseq1,p_sfkh001,p_sfkh002,
                      p_sfkh003,p_sfkh004,p_sfkh005,l_sfkh006,p_sfkh007,
                      g_user,g_dept,g_user,g_dept,l_sfkh006,'Y')                     
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "INSERT sfkh_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success
   END IF
   LET r_success = TRUE
   RETURN r_success    
END FUNCTION
################################################################################
# Descriptions...: 删除工单变更历程档
# Memo...........:
# Usage..........: CALL s_asft800_del_sfkh(p_sfkhdocno,p_sfkhseq,p_sfkhseq1,p_sfkh001,p_sfkh002)
#                  RETURNING r_success
# Input parameter: 1.p_sfkhdocno                LIKE sfkh_t.sfkhdocn
#                : 2.p_sfkhseq                  LIKE sfkh_t.sfkhseq
#                : 3.p_sfkhseq1                 LIKE sfkh_t.sfkhseq1
#                : 4.p_sfkh001                  LIKE sfkh_t.sfkh001
#                : 5.p_sfkh002                  LIKE sfkh_t.sfkh002
# Return code....: 1.r_success                  LIKE type_t.num5
# Date & Author..: 14/05/28 By wuxja
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft800_del_sfkh(p_sfkhdocno,p_sfkhseq,p_sfkhseq1,p_sfkh001,p_sfkh002)
DEFINE p_sfkhdocno                LIKE sfkh_t.sfkhdocno
DEFINE p_sfkhseq                  LIKE sfkh_t.sfkhseq
DEFINE p_sfkhseq1                 LIKE sfkh_t.sfkhseq1
DEFINE p_sfkh001                  LIKE sfkh_t.sfkh001
DEFINE p_sfkh002                  LIKE sfkh_t.sfkh002
DEFINE r_success                  LIKE type_t.num5


   LET r_success = FALSE

   #170816-00007#85 mark --s
   #IF cl_null(p_sfkhdocno) OR cl_null(p_sfkhseq) OR cl_null(p_sfkhseq1) OR cl_null(p_sfkh001) OR cl_null(p_sfkh002) THEN
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.code = 'sub-00001'
   #   LET g_errparam.extend = ''
   #   LET g_errparam.popup = TRUE
   #   CALL cl_err()
   #
   #   RETURN r_success
   #END IF
   #170816-00007#85 mark --e
   #170816-00007#85 add --s
   LET g_msg = ''
   IF cl_null(p_sfkhdocno) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("asfp100","lbl_sfaadocno") RETURNING g_colname_1,g_comment_1   #工單單號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_sfkhseq) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("asfp310","lbl_seq_2") RETURNING g_colname_1,g_comment_1   #項次
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_sfkhseq1) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("asfp320","lbl_l_inaoseq1") RETURNING g_colname_1,g_comment_1   #項序
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
    IF cl_null(p_sfkh001) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("asf-00901",g_dlang)   #變更序
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_sfkh002) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("asf-00902",g_dlang)   #變更欄位
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF NOT cl_null(g_msg) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00788'  #%1傳入值為空(錯誤)
      LET g_errparam.popup = TRUE
      LET g_errparam.replace[1] = g_msg 
      CALL cl_err()
      RETURN r_success
   END IF
   #170816-00007#85 add --e
  #DELETE FROM sfkh_t WHERE sfkhent = g_enterprise AND sfkhsite = g_site  #171019-00015#31 mark
   DELETE FROM sfkh_t WHERE sfkhent = g_enterprise                        #171019-00015#31 add
      AND sfkhdocno = p_sfkhdocno AND sfkhseq = p_sfkhseq AND sfkhseq1 = p_sfkhseq1
      AND sfkh001 = p_sfkh001 AND sfkh002 = p_sfkh002
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "DELETE sfkh_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success
   END IF
   LET r_success = TRUE
   RETURN r_success 
END FUNCTION

################################################################################
# Descriptions...: 生产数量变更后，对应的相关档案数量变更
# Memo...........:
# Usage..........: CALL s_asft800_upd_qty(p_sfkadocno,p_sfka900,p_sfka012,p_sfka013)
#                  RETURNING r_success
# Input parameter: 1.p_sfkadocno          LIKE sfka_t.sfkadocno
#                : 2.p_sfka900            LIKE sfka_t.sfka900
#                : 3.p_sfka012            LIKE sfka_t.sfka012
#                : 4.p_sfka013            LIKE sfka_t.sfka013
# Return code....: 1.r_success            LIKE type_t.num5
# Date & Author..: 14/7/18 By wuxja
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft800_upd_qty(p_sfkadocno,p_sfka900,p_sfka012,p_sfka013)
DEFINE p_sfkadocno          LIKE sfka_t.sfkadocno
DEFINE p_sfka900            LIKE sfka_t.sfka900
DEFINE p_sfka012            LIKE sfka_t.sfka012
DEFINE p_sfka013            LIKE sfka_t.sfka013
DEFINE r_success            LIKE type_t.num5
DEFINE l_sfkb007_sum        LIKE sfkb_t.sfkb007
DEFINE l_sfkc003_sum        LIKE sfkc_t.sfkc003
DEFINE l_sfkb007_sum1       LIKE sfkb_t.sfkb007
DEFINE l_sfkc003_sum1       LIKE sfkc_t.sfkc003
DEFINE l_sfke001_sum        LIKE sfke_t.sfke001
#161109-00085#59-s add
#DEFINE l_sfab               RECORD LIKE sfab_t.*   #161109-00085#59 mark
DEFINE l_sfab               RECORD  #工單來源檔
       sfab007 LIKE sfab_t.sfab007  #本次轉開工單量
                 END RECORD
#161109-00085#59-e add
#161109-00085#59-s add
#DEFINE l_sfac               RECORD LIKE sfac_t.*   #161109-00085#59 mark
DEFINE l_sfac               RECORD  #工單聯產品檔
       sfac003 LIKE sfac_t.sfac003  #預計產出量
               END RECORD
#161109-00085#59-e add
#161109-00085#59-s add
#DEFINE l_sfba               RECORD LIKE sfba_t.*   #161109-00085#59 mark
DEFINE l_sfba               RECORD  #工單備料單身檔
       sfba013 LIKE sfba_t.sfba013, #應發數量
       sfba016 LIKE sfba_t.sfba016, #已發數量
       sfba023 LIKE sfba_t.sfba023, #標準應發數量
       sfba024 LIKE sfba_t.sfba024  #調整應發數量
               END RECORD
#161109-00085#59-e add
#161109-00085#59-s add
#DEFINE l_sfkb               RECORD LIKE sfkb_t.*   #161109-00085#59 mark
DEFINE l_sfkb               RECORD  #工單變更單來源檔
       sfkbseq LIKE sfkb_t.sfkbseq, #項次
       sfkb007 LIKE sfkb_t.sfkb007, #本次轉開工單量
       sfkb901 LIKE sfkb_t.sfkb901  #變更類型
                 END RECORD
#161109-00085#59-e add
#161109-00085#59-s add
#DEFINE l_sfkc               RECORD LIKE sfkc_t.*   #161109-00085#59 mark
DEFINE l_sfkc               RECORD  #工單變更單聯產品檔
       sfkcseq LIKE sfkc_t.sfkcseq, #項次
       sfkc001 LIKE sfkc_t.sfkc001, #料件編號
       sfkc003 LIKE sfkc_t.sfkc003, #預計產出量
       sfkc004 LIKE sfkc_t.sfkc004, #單位
       sfkc901 LIKE sfkc_t.sfkc901  #變更類型
      ,sfkc002 LIKE sfkc_t.sfkc002, #170618-00276#1 add
       sfkc006 LIKE sfkc_t.sfkc006  #170618-00276#1 add    
               END RECORD
#161109-00085#59-e add
#161109-00085#59-s add
#DEFINE l_sfkg               RECORD LIKE sfkg_t.*   #161109-00085#59 mark
DEFINE l_sfkg               RECORD  #工單變更單備料單身
       sfkgseq LIKE sfkg_t.sfkgseq, #項次
       sfkgseq1 LIKE sfkg_t.sfkgseq1, #項序
       sfkg006 LIKE sfkg_t.sfkg006, #發料料號
       sfkg010 LIKE sfkg_t.sfkg010, #標準QPA
       sfkg011 LIKE sfkg_t.sfkg011, #實際QPA
       sfkg013 LIKE sfkg_t.sfkg013, #應發數量
       sfkg014 LIKE sfkg_t.sfkg014, #單位
       sfkg015 LIKE sfkg_t.sfkg015, #委外代買數量
       sfkg016 LIKE sfkg_t.sfkg016, #已發數量
       sfkg023 LIKE sfkg_t.sfkg023, #標準應發數量
       sfkg024 LIKE sfkg_t.sfkg024, #調整應發數量
       sfkg901 LIKE sfkg_t.sfkg901  #調整應發數量
       #170519-00043#1 add(s)
      ,sfkg034 LIKE sfkg_t.sfkg034,
       sfkg035 LIKE sfkg_t.sfkg035,
       #180108-00032#1 add(s)
       sfkg002 LIKE sfkg_t.sfkg002,
       sfkg003 LIKE sfkg_t.sfkg003,
       sfkg004 LIKE sfkg_t.sfkg004,
       sfkg008 LIKE sfkg_t.sfkg008,
       sfkg021 LIKE sfkg_t.sfkg021
       #180108-00032#1 add(e)
      #170519-00043#1 add(e)
               END RECORD
#161109-00085#59-e add
DEFINE l_sfkg013            LIKE sfkg_t.sfkg013
DEFINE l_sql                STRING
DEFINE l_success            LIKE type_t.num5
DEFINE l_rate               LIKE inaj_t.inaj014
DEFINE l_n                  LIKE type_t.num5
DEFINE l_sfkc003            LIKE sfkc_t.sfkc003
DEFINE l_sfkc003_1          LIKE sfkc_t.sfkc003  
DEFINE l_sfaa012            LIKE sfaa_t.sfaa012
DEFINE l_sfkgseq_t          LIKE sfkg_t.sfkgseq
DEFINE li_i                 LIKE type_t.num10
DEFINE l_sfkg013_t          LIKE sfkg_t.sfkg013    #161031-00060#2 add 变更前应发总量
DEFINE l_sfba026            LIKE sfba_t.sfba026   #170519-00043#1 add
DEFINE l_sfba035            LIKE sfba_t.sfba035   #170519-00043#1 add
DEFINE l_sfba034            LIKE sfba_t.sfba034   #170519-00043#1 add
DEFINE l_sfba035_sum        LIKE sfba_t.sfba035   #170519-00043#1 add
DEFINE l_ooca002            LIKE ooca_t.ooca002   #170618-00297#1 add
DEFINE l_ooca004            LIKE ooca_t.ooca004   #170618-00297#1 add
#160726-00001#10 add --(S)--   
DEFINE l_sfba027            LIKE sfba_t.sfba027 
DEFINE l_sfba013            LIKE sfba_t.sfba013
DEFINE l_sfba023            LIKE sfba_t.sfba023
DEFINE l_sfba024            LIKE sfba_t.sfba024
DEFINE l_sfba027_max        LIKE sfba_t.sfba027
DEFINE l_sfba035_max        LIKE sfba_t.sfba035
DEFINE l_sfkg035_set        LIKE sfkg_t.sfkg035
DEFINE l_sfkg035_cal        LIKE sfkg_t.sfkg035
DEFINE l_flag               LIKE type_t.chr1
#160726-00001#10 add --(E)--
#180108-00032#1 add(s)
DEFINE l_extqty             LIKE type_t.num10    # 记录损耗量
DEFINE l_d_mfg_0046         LIKE type_t.chr2     #单据别参数是否考虑损耗
DEFINE l_slip               LIKE ooba_t.ooba002  #单据别
DEFINE l_sfka010            LIKE sfka_t.sfka010
DEFINE l_sfka011            LIKE sfka_t.sfka011
DEFINE l_sfka902            LIKE sfka_t.sfka902
DEFINE l_bmba033            LIKE bmba_t.bmba033
DEFINE l_bmba034            LIKE bmba_t.bmba034
DEFINE l_bmba029            LIKE bmba_t.bmba029
DEFINE l_bmbb011            LIKE bmbb_t.bmbb011  
DEFINE l_bmbb012            LIKE bmbb_t.bmbb012
#180108-00032#1 add(e)
DEFINE l_sfba001            LIKE sfba_t.sfba001   #180402-00012#1 add
DEFINE l_cnt                LIKE type_t.num10     #170618-00276#1 add

   WHENEVER ERROR CONTINUE
   LET r_success = FALSE
   LET l_ooca002 = ''       #170618-00297#1 add
   LET l_ooca004 = ''       #170618-00297#1 add
   #检查:应在事物中的
   IF NOT s_transaction_chk('Y','0') THEN
      RETURN r_success
   END IF

   
   #170816-00007#85 mark --s
   #IF cl_null(p_sfkadocno) OR cl_null(p_sfka900) OR cl_null(p_sfka012) OR cl_null(p_sfka013) THEN
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.code = 'sub-00001'
   #   LET g_errparam.extend = ''
   #   LET g_errparam.popup = TRUE
   #   CALL cl_err()
   #   RETURN r_success
   #END IF
   #170816-00007#85 mark --e
   #170816-00007#85 add --s
   LET g_msg = ''
   IF cl_null(p_sfkadocno) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("asfp100","lbl_sfaadocno") RETURNING g_colname_1,g_comment_1   #工單單號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_sfka900) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("asf-00901",g_dlang)   #變更序
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_sfka012) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("asfp200","lbl_sfcb027") RETURNING g_colname_1,g_comment_1   #生產數量
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_sfka013) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("asfp220","lbl_a3") RETURNING g_colname_1,g_comment_1   #生產單位
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF NOT cl_null(g_msg) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00788'  #%1傳入值為空(錯誤)
      LET g_errparam.popup = TRUE
      LET g_errparam.replace[1] = g_msg 
      CALL cl_err()
      RETURN r_success
   END IF
   #170816-00007#85 add --e
   #工单来源是订单时，变更工单来源档对应转工单量
   LET l_sfkb007_sum = 0 
   #180108-00032#1 add(s)
   IF cl_null(l_slip) THEN
      CALL s_aooi200_get_slip(p_sfkadocno) RETURNING l_success,l_slip
   END IF
   LET l_d_mfg_0046 = cl_get_doc_para(g_enterprise,g_site,l_slip,'D-MFG-0046')
   #180108-00032#1 add(e)
   SELECT SUM(sfkb007) INTO l_sfkb007_sum FROM sfkb_t 
   #WHERE sfkbent = g_enterprise AND sfkbsite = g_site  #171019-00015#31 mark
    WHERE sfkbent = g_enterprise                        #171019-00015#31 add
      AND sfkbdocno = p_sfkadocno AND sfkb900 = p_sfka900
   IF l_sfkb007_sum != p_sfka012 AND l_sfkb007_sum > 0 THEN    
      DECLARE s_asft800_upd_qty_cs0 CURSOR FOR
         #SELECT * FROM sfkb_t WHERE sfkbent = g_enterprise AND sfkbsite = g_site   #161109-00085#59 mark
         #161109-00085#59-s add
         SELECT sfkbseq,sfkb007,sfkb901
           FROM sfkb_t
         #WHERE sfkbent = g_enterprise AND sfkbsite = g_site  #171019-00015#31 mark
          WHERE sfkbent = g_enterprise                        #171019-00015#31 add
         #161109-00085#59-e add
            AND sfkbdocno = p_sfkadocno AND sfkb900 = p_sfka900
      #FOREACH s_asft800_upd_qty_cs0 INTO l_sfkb.*   #161109-00085#59 mark
      #161109-00085#59-s add
      FOREACH s_asft800_upd_qty_cs0
         INTO l_sfkb.sfkbseq,l_sfkb.sfkb007,l_sfkb.sfkb901
      #161109-00085#59-e add
         #变更数量
         LET l_sfkb.sfkb007 = l_sfkb.sfkb007 * p_sfka012 / l_sfkb007_sum
         CALL s_aooi250_take_decimals(p_sfka013,l_sfkb.sfkb007) RETURNING l_success,l_sfkb.sfkb007
         UPDATE sfkb_t SET sfkb007 = l_sfkb.sfkb007
         #WHERE sfkbent = g_enterprise AND sfkbsite = g_site  #171019-00015#31 mark
          WHERE sfkbent = g_enterprise                        #171019-00015#31 add
            AND sfkbdocno = p_sfkadocno AND sfkb900 = p_sfka900
            AND sfkbseq = l_sfkb.sfkbseq
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'update sfkb_t'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            RETURN r_success
         END IF
         INITIALIZE l_sfab.* TO NULL
         IF l_sfkb.sfkb901 != '3' THEN
            #SELECT * INTO l_sfab.* FROM sfab_t WHERE sfabent = g_enterprise AND sfabsite = g_site   #161109-00085#59 mark
            #161109-00085#59-s add
            SELECT sfab007
              INTO l_sfab.sfab007
              FROM sfab_t 
            #WHERE sfabent = g_enterprise AND sfabsite = g_site  #171019-00015#31 mark
             WHERE sfabent = g_enterprise                        #171019-00015#31 add
            #161109-00085#59-e add
               AND sfabdocno = p_sfkadocno AND sfabseq = l_sfkb.sfkbseq
         END IF
         IF l_sfkb.sfkb901 = '3' OR l_sfkb.sfkb007 != l_sfab.sfab007 THEN
            #其說明的SQL
            LET g_sfkh007 = ""
            IF NOT s_asft800_ins_sfkh(p_sfkadocno,l_sfkb.sfkbseq,0,p_sfka900,'sfab007','1',l_sfab.sfab007,l_sfkb.sfkb007,g_sfkh007) THEN
               RETURN r_success
            END IF
         ELSE
            IF NOT s_asft800_del_sfkh(p_sfkadocno,l_sfkb.sfkbseq,0,p_sfka900,'sfab007') THEN
               RETURN r_success
            END IF
         END IF
         IF l_sfkb.sfkb901 != '3' THEN
           #SELECT COUNT(1) INTO l_n FROM sfkh_t WHERE sfkhent = g_enterprise AND sfkhsite = g_site  #171019-00015#31 mark
            SELECT COUNT(1) INTO l_n FROM sfkh_t WHERE sfkhent = g_enterprise                        #171019-00015#31 add
               AND sfkhdocno = p_sfkadocno AND sfkhseq = l_sfkb.sfkbseq
               AND sfkh001 = p_sfka900 AND sfkh002 LIKE 'sfab%'
            IF l_n = 0 THEN
               UPDATE sfkb_t SET sfkb901 = '1' 
               #WHERE sfkbent = g_enterprise AND sfkbsite = g_site  #171019-00015#31 mark
                WHERE sfkbent = g_enterprise                        #171019-00015#31 add
                  AND sfkbdocno = p_sfkadocno AND sfkb900 = p_sfka900
                  AND sfkbseq = l_sfkb.sfkbseq
            ELSE
               UPDATE sfkb_t SET sfkb901 = '2' 
               #WHERE sfkbent = g_enterprise AND sfkbsite = g_site  #171019-00015#31 mark
                WHERE sfkbent = g_enterprise                        #171019-00015#31 add 
                  AND sfkbdocno = p_sfkadocno AND sfkb900 = p_sfka900
                  AND sfkbseq = l_sfkb.sfkbseq
            END IF
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'update sfkb_t'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               RETURN r_success
            END IF
         END IF
      END FOREACH
      #误差数量，累加到项次最小资料上
      SELECT SUM(sfkb007) INTO l_sfkb007_sum1 FROM sfkb_t 
      #WHERE sfkbent = g_enterprise AND sfkbsite = g_site  #171019-00015#31 mark
       WHERE sfkbent = g_enterprise                        #171019-00015#31 add
         AND sfkbdocno = p_sfkadocno AND sfkb900 = p_sfka900
      IF l_sfkb007_sum1 != p_sfka012 THEN
         #SELECT * INTO l_sfkb.* FROM sfkb_t   #161109-00085#59 mark
         #161109-00085#59-s add
         SELECT sfkbseq,sfkb007
           INTO l_sfkb.sfkbseq,l_sfkb.sfkb007
           FROM sfkb_t
         #161109-00085#59-e add
         #WHERE sfkbent = g_enterprise AND sfkbsite = g_site  #171019-00015#31 mark
          WHERE sfkbent = g_enterprise                        #171019-00015#31 add
            AND sfkbdocno = p_sfkadocno AND sfkb900 = p_sfka900
           #AND sfkbseq = (SELECT MIN(sfkbseq) FROM sfkb_t WHERE sfkbent = g_enterprise AND sfkbsite = g_site AND sfkbdocno = p_sfkadocno AND sfkb900 = p_sfka900)  #171019-00015#31 mark
            AND sfkbseq = (SELECT MIN(sfkbseq) FROM sfkb_t WHERE sfkbent = g_enterprise AND sfkbdocno = p_sfkadocno AND sfkb900 = p_sfka900)                        #171019-00015#31 add
         LET l_sfkb.sfkb007 = l_sfkb.sfkb007 + (p_sfka012 - l_sfkb007_sum1) 
         UPDATE sfkb_t SET sfkb007 = l_sfkb.sfkb007
         #WHERE sfkbent = g_enterprise AND sfkbsite = g_site  #171019-00015#31 mark
          WHERE sfkbent = g_enterprise                        #171019-00015#31 add
            AND sfkbdocno = p_sfkadocno AND sfkb900 = p_sfka900
            AND sfkbseq = l_sfkb.sfkbseq
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'update sfkb_t'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            RETURN r_success
         END IF
         UPDATE sfkh_t SET sfkh005 = l_sfkb.sfkb007 
         #WHERE sfkhent = g_enterprise AND sfkhsite = g_site  #171019-00015#31 mark
          WHERE sfkhent = g_enterprise                        #171019-00015#31 add
            AND sfkhdocno = p_sfkadocno AND sfkhseq = l_sfkb.sfkbseq
            AND sfkh001 = p_sfka900 AND sfkh002 = 'sfab007'
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'update sfkh_t'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            RETURN r_success
         END IF
      END IF
   END IF
   
   #变更工单生产料号明细资料信息
   #LET l_sql = " SELECT * FROM sfkc_t WHERE sfkcent=",g_enterprise," AND sfkcsite='",g_site,"'",   #161109-00085#59 mark
   #161109-00085#59-s add
   INITIALIZE l_sfkc.* TO NULL
   LET l_sql = " SELECT sfkc001,sfkc003,sfkc004",
               "       ,sfkc002,sfkc006 ",         #170618-00276#1 add
               "   FROM sfkc_t",
              #"  WHERE sfkcent=",g_enterprise," AND sfkcsite='",g_site,"'",  #171019-00015#31 mark
               "  WHERE sfkcent=",g_enterprise,                               #171019-00015#31 add
   #161109-00085#59-e add
               "    AND sfkcdocno='",p_sfkadocno,"' AND sfkc900=",p_sfka900," AND (sfkc002 = '1' OR sfkc002 = '2')"
   PREPARE s_asft800_upd_qty_pre1 FROM l_sql
   DECLARE s_asft800_upd_qty_cs1 CURSOR FOR s_asft800_upd_qty_pre1
   LET l_sfkc003_sum = 0
   #FOREACH s_asft800_upd_qty_cs1 INTO l_sfkc.*   #161109-00085#59 mark
   #161109-00085#59-s add
   FOREACH s_asft800_upd_qty_cs1
      INTO l_sfkc.sfkc001,l_sfkc.sfkc003,l_sfkc.sfkc004,l_sfkc.sfkc002,l_sfkc.sfkc006   #170618-00276#1 add sfkc002,sfkc006 
   #161109-00085#59-e add
     #CALL s_aimi190_get_convert(l_sfkc.sfkc001,l_sfkc.sfkc004,p_sfka013) RETURNING l_success,l_rate
     #IF NOT l_success THEN
     #   LET l_rate = 1
     #END IF
     #LET l_sfkc003_sum = l_sfkc.sfkc003 * l_rate + l_sfkc003_sum
      CALL s_aooi250_convert_qty(l_sfkc.sfkc001,l_sfkc.sfkc004,p_sfka013,l_sfkc.sfkc003) 
           RETURNING l_success,l_sfkc003
      IF NOT l_success THEN
         LET l_sfkc003 = l_sfkc.sfkc003
      END IF
      LET l_sfkc003_sum = l_sfkc003 + l_sfkc003_sum
   END FOREACH
   IF l_sfkc003_sum != p_sfka012 AND l_sfkc003_sum > 0 THEN     
      DECLARE s_asft800_upd_qty_cs2 CURSOR FOR
       #SELECT * FROM sfkc_t WHERE sfkcent = g_enterprise AND sfkcsite = g_site   #161109-00085#59 mark
       #161109-00085#59-s add
       SELECT sfkcseq,sfkc003,sfkc901,sfkc004   #170123-00025#1 add ,sfkc004
         FROM sfkc_t 
        #WHERE sfkcent = g_enterprise AND sfkcsite = g_site  #171019-00015#31 mark
         WHERE sfkcent = g_enterprise                        #171019-00015#31 add
       #161109-00085#59-e add
          AND sfkcdocno = p_sfkadocno AND sfkc900 = p_sfka900
      #FOREACH s_asft800_upd_qty_cs2 INTO l_sfkc.*   #161109-00085#59 mark
      #161109-00085#59-s add
      INITIALIZE l_sfkc.* TO NULL
      FOREACH s_asft800_upd_qty_cs2
         INTO l_sfkc.sfkcseq,l_sfkc.sfkc003,l_sfkc.sfkc901,l_sfkc.sfkc004    #170123-00025#1 add ,l_sfkc.sfkc004
      #161109-00085#59-e add
         LET l_sfkc.sfkc003 = l_sfkc.sfkc003 * p_sfka012 / l_sfkc003_sum
         CALL s_aooi250_take_decimals(l_sfkc.sfkc004,l_sfkc.sfkc003) RETURNING l_success,l_sfkc.sfkc003
         UPDATE sfkc_t SET sfkc003 = l_sfkc.sfkc003
         #WHERE sfkcent = g_enterprise AND sfkcsite = g_site  #171019-00015#31 mark
          WHERE sfkcent = g_enterprise                        #171019-00015#31 add
            AND sfkcdocno = p_sfkadocno AND sfkc900 = p_sfka900
            AND sfkcseq = l_sfkc.sfkcseq
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'update sfkc_t'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            RETURN r_success
         END IF
         INITIALIZE l_sfac.* TO NULL
         IF l_sfkc.sfkc901 != '3' THEN
            #SELECT * INTO l_sfac.* FROM sfac_t WHERE sfacent = g_enterprise AND sfacsite = g_site   #161109-00085#59 mark
            #161109-00085#59-s add
            SELECT sfac003
              INTO l_sfac.sfac003
              FROM sfac_t 
            #WHERE sfacent = g_enterprise AND sfacsite = g_site  #171019-00015#31 mark
             WHERE sfacent = g_enterprise                        #171019-00015#31 add
            #161109-00085#59-e add
               AND sfacdocno = p_sfkadocno AND sfacseq = l_sfkc.sfkcseq
         END IF
         IF l_sfkc.sfkc901 = '3' OR l_sfkc.sfkc003 != l_sfac.sfac003 THEN
            #其說明的SQL
            LET g_sfkh007 = ""
            IF NOT s_asft800_ins_sfkh(p_sfkadocno,l_sfkc.sfkcseq,0,p_sfka900,'sfac003','1',l_sfac.sfac003,l_sfkc.sfkc003,g_sfkh007) THEN
               RETURN r_success
            END IF
         ELSE
            IF NOT s_asft800_del_sfkh(p_sfkadocno,l_sfkc.sfkcseq,0,p_sfka900,'sfac003') THEN
               RETURN r_success
            END IF
         END IF
         IF l_sfkc.sfkc901 != '3' THEN
           #SELECT COUNT(1) INTO l_n FROM sfkh_t WHERE sfkhent = g_enterprise AND sfkhsite = g_site  #171019-00015#31 mark
            SELECT COUNT(1) INTO l_n FROM sfkh_t WHERE sfkhent = g_enterprise                        #171019-00015#31 add
               AND sfkhdocno = p_sfkadocno AND sfkhseq = l_sfkc.sfkcseq
               AND sfkh001 = p_sfka900 AND sfkh002 LIKE 'sfac%'
            IF l_n = 0 THEN
               UPDATE sfkc_t SET sfkc901 = '1' 
               #WHERE sfkcent = g_enterprise AND sfkcsite = g_site  #171019-00015#31 mark
                WHERE sfkcent = g_enterprise                        #171019-00015#31 add
                  AND sfkcdocno = p_sfkadocno AND sfkc900 = p_sfka900
                  AND sfkcseq = l_sfkc.sfkcseq
            ELSE
               UPDATE sfkc_t SET sfkc901 = '2' 
               #WHERE sfkcent = g_enterprise AND sfkcsite = g_site  #171019-00015#31 mark
                WHERE sfkcent = g_enterprise                        #171019-00015#31 add
                  AND sfkcdocno = p_sfkadocno AND sfkc900 = p_sfka900
                  AND sfkcseq = l_sfkc.sfkcseq
            END IF
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'update sfkc_t'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               RETURN r_success
            END IF
         END IF
      END FOREACH
      #误差数量，累加到项次最小资料上
      LET l_sfkc003_sum1 = 0
      #FOREACH s_asft800_upd_qty_cs1 INTO l_sfkc.*   #161109-00085#59 mark
      #161109-00085#59-s add
      INITIALIZE l_sfkc.* TO NULL
      FOREACH s_asft800_upd_qty_cs1
         INTO l_sfkc.sfkc001,l_sfkc.sfkc003,l_sfkc.sfkc004
      #161109-00085#59-e add
        #CALL s_aimi190_get_convert(l_sfkc.sfkc001,l_sfkc.sfkc004,p_sfka013) RETURNING l_success,l_rate
        #IF NOT l_success THEN
        #   LET l_rate = 1
        #END IF
        #LET l_sfkc003_sum1 = l_sfkc.sfkc003 * l_rate + l_sfkc003_sum1
         CALL s_aooi250_convert_qty(l_sfkc.sfkc001,l_sfkc.sfkc004,p_sfka013,l_sfkc.sfkc003) 
              RETURNING l_success,l_sfkc003
         IF NOT l_success THEN
            LET l_sfkc003 = l_sfkc.sfkc003
         END IF
         LET l_sfkc003_sum1 = l_sfkc003 + l_sfkc003_sum1
      END FOREACH
      IF l_sfkc003_sum1 != p_sfka012 THEN
         #SELECT * INTO l_sfkc.* FROM sfkc_t   #161109-00085#59 mark
         #161109-00085#59-s add
         INITIALIZE l_sfkc.* TO NULL
         SELECT sfkcseq,sfkc001,sfkc003,sfkc004
           INTO l_sfkc.sfkcseq,l_sfkc.sfkc001,l_sfkc.sfkc003,l_sfkc.sfkc004
           FROM sfkc_t 
         #161109-00085#59-e add
         #WHERE sfkcent = g_enterprise AND sfkcsite = g_site  #171019-00015#31 mark
          WHERE sfkcent = g_enterprise                        #171019-00015#31 add
            AND sfkcdocno = p_sfkadocno AND sfkc900 = p_sfka900
           #AND sfkcseq = (SELECT MIN(sfkcseq) FROM sfkc_t WHERE sfkcent = g_enterprise AND sfkcsite = g_site AND sfkcdocno = p_sfkadocno AND sfkc900 = p_sfka900)  #171019-00015#31 mark
            AND sfkcseq = (SELECT MIN(sfkcseq) FROM sfkc_t WHERE sfkcent = g_enterprise AND sfkcdocno = p_sfkadocno AND sfkc900 = p_sfka900)                        #171019-00015#31 add
        #CALL s_aimi190_get_convert(l_sfkc.sfkc001,p_sfka013,l_sfkc.sfkc004) RETURNING l_success,l_rate
        #IF NOT l_success THEN
        #   LET l_rate = 1
        #END IF
        #LET l_sfkc.sfkc003 = l_sfkc.sfkc003 + (p_sfka012 - l_sfkc003_sum1) * l_rate 
         CALL s_aooi250_convert_qty(l_sfkc.sfkc001,p_sfka013,l_sfkc.sfkc004,p_sfka012 - l_sfkc003_sum1)
              RETURNING l_success,l_sfkc003_1
         IF NOT l_success THEN
            LET l_sfkc003_1 = p_sfka012 - l_sfkc003_sum1
         END IF
         LET l_sfkc.sfkc003 = l_sfkc.sfkc003 + l_sfkc003_1
         UPDATE sfkc_t SET sfkc003 = l_sfkc.sfkc003
         #WHERE sfkcent = g_enterprise AND sfkcsite = g_site  #171019-00015#31 mark
          WHERE sfkcent = g_enterprise                        #171019-00015#31 add
            AND sfkcdocno = p_sfkadocno AND sfkc900 = p_sfka900
            AND sfkcseq = l_sfkc.sfkcseq
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'update sfkc_t'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            RETURN r_success
         END IF
         UPDATE sfkh_t SET sfkh005 = l_sfkc.sfkc003
         #WHERE sfkhent = g_enterprise AND sfkhsite = g_site  #171019-00015#31 mark
          WHERE sfkhent = g_enterprise                        #171019-00015#31 add
            AND sfkhdocno = p_sfkadocno AND sfkhseq = l_sfkc.sfkcseq
            AND sfkh001 = p_sfka900 AND sfkh002 = 'sfac003'
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'update sfkh_t'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            RETURN r_success
         END IF
      END IF
   END IF

#170618-00276#1-S add
   

   LET l_cnt = 0
   SELECT COUNT(1) INTO l_cnt FROM sfkc_t 
    WHERE sfkcent = g_enterprise
      AND sfkcsite = g_site
      AND sfkcdocno = p_sfkadocno
      AND sfkc900 = p_sfka900
      AND sfkc002 = '1' 
      AND sfkc006 IS NOT NULL AND sfkc006 <> ' '
   IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF   
   IF l_cnt > 0 THEN 
      CALL s_asft800_gene_new_sfba(p_sfkadocno,p_sfka900) RETURNING l_success
      IF l_success THEN 
         LET r_success = TRUE
      ELSE
         LET r_success = FALSE
      END IF          
   ELSE 
#170618-00276#1-E add

   #更新工单备料档资料
   #160726-00001#10 add --(S)--
   #取得變更前工單生產數量
   SELECT sfaa012 INTO l_sfaa012
     FROM sfaa_t 
    WHERE sfaaent = g_enterprise
      AND sfaadocno = p_sfkadocno    
   #160726-00001#10 add --(E)--
   #LET l_sql = "SELECT * FROM sfkg_t WHERE sfkgent = ",g_enterprise," AND sfkgsite = '",g_site,"'",   #161109-00085#59 mark
   #161109-00085#59-s add
   LET l_sql = "SELECT sfkgseq,sfkgseq1,sfkg006,sfkg010,sfkg011,sfkg013,sfkg014,sfkg015,sfkg016,sfkg023,sfkg024,sfkg901",
               "      ,sfkg034,sfkg035",  #170519-00043#1 add
               " , sfkg002,sfkg003,sfkg004,sfkg008,sfkg021 " ,  #180108-00032#1 add
               "  FROM sfkg_t ",
              #" WHERE sfkgent = ",g_enterprise," AND sfkgsite = '",g_site,"'",  #171019-00015#31 mark
               " WHERE sfkgent = ",g_enterprise,                                 #171019-00015#31 add
   #161109-00085#59-e add
               "   AND sfkgdocno='",p_sfkadocno,"' AND sfkg900=",p_sfka900 
   PREPARE s_asft800_upd_qty_pre3 FROM l_sql
   DECLARE s_asft800_upd_qty_cs3 CURSOR FOR s_asft800_upd_qty_pre3
   LET l_sfkgseq_t = ''
   #FOREACH s_asft800_upd_qty_cs3 INTO l_sfkg.*   #161109-00085#59 mark
   #161109-00085#59-s add
   FOREACH s_asft800_upd_qty_cs3
      INTO l_sfkg.sfkgseq,l_sfkg.sfkgseq1,l_sfkg.sfkg006,l_sfkg.sfkg010,l_sfkg.sfkg011,
           l_sfkg.sfkg013,l_sfkg.sfkg014,l_sfkg.sfkg015,l_sfkg.sfkg016,l_sfkg.sfkg023,
           l_sfkg.sfkg024,l_sfkg.sfkg901,l_sfkg.sfkg034,l_sfkg.sfkg035 #170519-00043#1  add sfkg034.sfkg035
           ,l_sfkg.sfkg002,l_sfkg.sfkg003,l_sfkg.sfkg004,l_sfkg.sfkg008,l_sfkg.sfkg021 #180108-00032#1 add
   #161109-00085#59-e add
   
      #160905-00022#2-s
      INITIALIZE l_sfba.* TO NULL
      #SELECT sfba_t.*,sfaa012 INTO l_sfba.*,l_sfaa012   #161109-00085#59 mark
      #161109-00085#59-s add
      SELECT sfba013,sfba016,sfba023,sfba024,sfaa012,sfba026,sfba035,sfba034,sfba027,sfba013,sfba023,sfba024   #170519-00043#1 add sfba026,sfba035  #160726-00001#10 add sfba027,sfba013,sfba023,sfba024
        INTO l_sfba.sfba013,l_sfba.sfba016,l_sfba.sfba023,l_sfba.sfba024,l_sfaa012,l_sfba026,l_sfba035,l_sfba034,l_sfba027,l_sfba013,l_sfba023,l_sfba024  #170519-00043#1 add sfba026,sfba035 #160726-00001#10 add sfba027,sfba013,sfba023,sfba024
      #161109-00085#59-e add
        FROM sfba_t
      #171019-00015#31 -S mark
      # LEFT JOIN sfaa_t ON sfaaent=sfbaent AND sfaasite=sfbasite AND sfaadocno=sfbadocno
      #WHERE sfbaent = g_enterprise AND sfbasite = g_site
      #171019-00015#31 -E mark
      #171019-00015#31 -S add
        LEFT JOIN sfaa_t ON sfaaent=sfbaent AND sfaadocno=sfbadocno
       WHERE sfbaent = g_enterprise
      #171019-00015#31 -E add
         AND sfbadocno = p_sfkadocno AND sfbaseq = l_sfkg.sfkgseq AND sfbaseq1 = l_sfkg.sfkgseq1
      #160905-00022#2-e
      LET l_sfkg013_t=0                 #161031-00060#2 add
      LET l_sfkg013_t=l_sfkg.sfkg013    #161031-00060#2 add
      IF NOT cl_null(l_sfba026) AND l_sfba026 = '1' THEN   #170519-00043#1 add不做SET 替代的 直接重算应发数量
         SELECT COUNT(1) INTO l_n FROM sfkg_t
         #WHERE sfkgent = g_enterprise AND sfkgsite = g_site  #171019-00015#31 mark
          WHERE sfkgent = g_enterprise                        #171019-00015#31 add
            AND sfkgdocno = p_sfkadocno AND sfkg900 = p_sfka900
            AND sfkgseq = l_sfkg.sfkgseq
         IF l_n = 1 THEN
            LET l_sfkg.sfkg023 = p_sfka012 * l_sfkg.sfkg010 / l_sfkg.sfkg011
            #LET l_sfkg.sfkg013 = l_sfkg.sfkg023 + l_sfkg.sfkg024                     #170618-00426#1  mark
            #180108-00032#1 add(s)
            #计算总应发量时考虑到损耗率
            #1、取生产料号、特性
            SELECT sfka010,sfka011,sfka902 INTO l_sfka010,l_sfka011,l_sfka902 FROM sfka_t WHERE sfkaent=g_enterprise AND sfkadocno=p_sfkadocno AND sfka900=p_sfka900
            #180402-00012#1---add---s
            SELECT sfba001 INTO l_sfba001 FROM sfba_t 
             WHERE sfbaent = g_enterprise 
               AND sfbadocno = p_sfkadocno
               AND sfbaseq = l_sfkg.sfkgseq 
               AND sfbaseq1 = l_sfkg.sfkgseq1
            IF cl_null(l_sfba001) THEN LET l_sfba001 = l_sfka010  END IF 
            #180402-00012#1---add---e
            IF cl_null(l_sfka011) THEN LET l_sfka011=' ' END IF
            #2、取bom设定损耗
            #      损耗公式否   损耗公式  损耗型态   损耗率   损耗量
            SELECT bmba033,   bmba034,  bmba029,  bmbb011, bmbb012 INTO l_bmba033,l_bmba034,l_bmba029,l_bmbb011,l_bmbb012
               FROM bmba_t 
               LEFT JOIN bmbb_t ON bmbaent=bmbbent AND bmbasite=bmbbsite AND bmba001=bmbb001 AND bmba002=bmbb002
               AND bmba003=bmbb003 AND bmba004=bmbb004 AND bmba005=bmbb005 AND bmba007=bmbb007 AND bmba008=bmbb008
               #AND bmbb009<=p_sfka012 AND bmbb010>=p_sfka012   #180402-00012#1 mark
               #WHERE bmbaent=g_enterprise AND bmbasite=g_site AND bmba001=l_sfka010 AND bmba002=l_sfka011  #180402-00012#1 mark
               #AND bmba003=l_sfkg.sfkg006 AND bmba004=l_sfkg.sfkg002  AND bmba007=l_sfkg.sfkg003 AND bmba008=l_sfkg.sfkg008  #180402-00012#1 mark
               AND bmbb009<=p_sfka012 AND (bmbb010>=p_sfka012 OR bmbb010 IS NULL)  #180402-00012#1 
               WHERE bmbaent=g_enterprise AND bmbasite=g_site AND bmba001 = l_sfba001 AND bmba002=l_sfka011  #180402-00012#1 add 
               AND bmba003=l_sfkg.sfkg006 AND bmba004=l_sfkg.sfkg002  AND bmba007=l_sfkg.sfkg003 AND bmba008=l_sfkg.sfkg004   #180402-00012#1
           
            IF cl_null(l_bmba033) THEN LET l_bmba033='N' END IF
            IF l_bmba033='Y' THEN
               CALL s_asft300_04(p_sfkadocno,l_sfka010,l_sfka011,l_bmba034,l_sfkg.sfkg021,l_sfkg.sfkg023)
                 RETURNING l_success,l_bmbb011
            END IF
            IF cl_null(l_bmbb011) THEN LET l_bmbb011=0 END IF
            IF cl_null(l_bmbb012) THEN LET l_bmbb012=0 END IF   
            LET l_extqty=l_sfkg.sfkg023*l_bmbb011/100+l_bmbb012
            IF l_bmba029='2' AND l_d_mfg_0046='Y' THEN
               LET l_sfkg.sfkg013=l_extqty+l_sfkg.sfkg023
            ELSE 
               LET l_sfkg.sfkg013 = l_sfkg.sfkg023 
            END IF
            #180108-00032#1 add(e)
            #LET l_sfkg.sfkg013 = l_sfkg.sfkg023                                       #170618-00426#1  add #180108-00032#1 mark
            #建议应发数量
            CALL s_asft300_03(l_sfkg.sfkg006,l_sfkg.sfkg013) RETURNING l_success,l_sfkg013
            IF l_success THEN
               LET l_sfkg.sfkg013 = l_sfkg013
            END IF
            #170618-00297#1-s mod 
            #CALL s_aooi250_take_decimals(l_sfkg.sfkg014,l_sfkg.sfkg013) RETURNING l_success,l_sfkg.sfkg013  #170618-00401#1 add
            CALL s_aooi250_get_msg(l_sfkg.sfkg014) RETURNING l_success,l_ooca002,l_ooca004
            IF l_success THEN
               #依據傳入的數量進行取位
               CALL s_num_round('4',l_sfkg.sfkg013,l_ooca002) RETURNING l_sfkg.sfkg013
            ELSE
               LET r_success = FALSE
            END IF
            #170618-00297#1-e mod 
            LET l_sfkg.sfkg024 = l_sfkg.sfkg013 - l_sfkg.sfkg023
            #160905-00022#2-s
            #往後挪
            #CALL s_aooi250_take_decimals(l_sfkg.sfkg014,l_sfkg.sfkg023) RETURNING l_success,l_sfkg.sfkg023
            #CALL s_aooi250_take_decimals(l_sfkg.sfkg014,l_sfkg.sfkg024) RETURNING l_success,l_sfkg.sfkg024
            #CALL s_aooi250_take_decimals(l_sfkg.sfkg014,l_sfkg.sfkg013) RETURNING l_success,l_sfkg.sfkg013
            #160905-00022#2-e
         ELSE
            
            IF cl_null(l_sfkgseq_t) OR l_sfkg.sfkgseq != l_sfkgseq_t THEN
               #160905-00022#2-s
               #SELECT sfka012 INTO l_sfaa012 FROM sfka_t
               # WHERE sfkaent = g_enterprise AND sfkasite = g_site
               #   AND sfkadocno = p_sfkadocno
               #   AND sfka900   = p_sfka900
               #160905-00022#2-e
               #调用function计算取替代对应的值
               CALL s_asft800_get_replace(p_sfkadocno,p_sfka900,p_sfka012,l_sfkg.sfkgseq,l_sfaa012)
            END IF
            FOR li_i = 1 TO g_replace_cnt
                IF g_replace[li_i].sfkgseq1 = l_sfkg.sfkgseq1 THEN
                   LET l_sfkg.sfkg023 = g_replace[li_i].sfkg023
                   LET l_sfkg.sfkg024 = g_replace[li_i].sfkg024
                   LET l_sfkg.sfkg013 = g_replace[li_i].sfkg013
                END IF
            END FOR
         END IF
      END IF     #170519-00043#1 add
      #160905-00022#2-s
      #170519-00043#1 add(s)
      #如果备料已被SET替代,并且SET替代套数>0 则需要减去SET替代套数以后再重算应发数量
     #160726-00001#10 mark --(S)-- 
     #以下SQL若SET群組有超過一個料件時,會造成SET替代套數重複計算
     #IF NOT cl_null(l_sfba026) AND l_sfba026 = '2' AND l_sfba035 > 0 THEN    
        #SELECT NVL(SUM(sfba035),0) INTO l_sfba035_sum FROM sfba_t
        # WHERE sfbaent = g_enterprise
        #   AND sfbadocno = p_sfkadocno
        #   AND (sfba026 = '3' OR (sfba026 = '2' AND sfbaseq <> l_sfkg.sfkgseq))
        #   AND sfba034 = l_sfkg.sfkg034
     #160726-00001#10 mark --(E)-- 
      IF NOT cl_null(l_sfba026) AND l_sfba026 <> '1' THEN    #170904-00001#1 add     
         #160726-00001#10 add --(S)--
         LET l_flag = 'N'    #是否有更新套數資料
         #取得SET替代套数      
         SELECT NVL(SUM(sfba035),0) INTO l_sfba035_sum
           FROM (SELECT DISTINCT sfba027,sfba035 FROM sfba_t
                  WHERE sfbaent = g_enterprise
                    AND sfbadocno = p_sfkadocno
                    AND (sfba026 = '3' OR (sfba026 = '2' AND sfba027 <> l_sfkg.sfkg034))
                    AND sfba034 = l_sfkg.sfkg034)
         #生產數量增加時,把增加的數量都加到 sfkg026 = 2.已被SET替代 的套數skfg035中
         IF (p_sfka012 - l_sfaa012 > 0) THEN
            IF NOT cl_null(l_sfba026) AND l_sfba026 = '2' THEN 
               LET l_flag = 'Y'         
         #160726-00001#10 add --(E)--          
               #SET替代套数=变更后生产数量-变更前生产数量 - SET替代料的SET被替代群組SUM(SET替代套数)
               LET l_sfkg.sfkg035 = p_sfka012  - l_sfba035_sum
               #应发数量=SET替代套数*QPA
               LET l_sfkg.sfkg023 = l_sfkg.sfkg035 * (l_sfkg.sfkg010 / l_sfkg.sfkg011)
         
               LET l_sfkg.sfkg013 = l_sfkg.sfkg023 + l_sfkg.sfkg024
#         #建议应发数量
#         CALL s_asft300_03(l_sfkg.sfkg006,l_sfkg.sfkg013) RETURNING l_success,l_sfkg013
#         IF l_success THEN
#            LET l_sfkg.sfkg013 = l_sfkg013
#         END IF
               LET l_sfkg.sfkg024 = l_sfkg.sfkg013 - l_sfkg.sfkg023 
            END IF
      #170519-00043#1 add(e)
         #160726-00001#10 add --(S)--
         #生產數量減少時,減少的數量要優先從 sfkg026 = 3.SET替代料減少，但可減少的套數是同一SET替代群組(sfkg027)下最大的SET已發料套數sfkg036
         #              若已經沒有可減少的套數，就要扣掉 sfkg026 = 2.已被SET替代 的套數skfg035
         ELSE
            IF ((l_sfaa012 - p_sfka012) > l_sfba035_sum) AND 
               (NOT cl_null(l_sfba026) AND l_sfba026 = '2') THEN
               LET l_flag = 'Y'
               LET l_sfkg.sfkg035 = p_sfka012
               #应发数量=SET替代套数*QPA
               LET l_sfkg.sfkg023 = l_sfkg.sfkg035 * (l_sfkg.sfkg010 / l_sfkg.sfkg011)
         
               LET l_sfkg.sfkg013 = l_sfkg.sfkg023 + l_sfkg.sfkg024   
               LET l_sfkg.sfkg024 = l_sfkg.sfkg013 - l_sfkg.sfkg023            
            ELSE    
               IF NOT cl_null(l_sfba026) AND l_sfba026 = '3' THEN
                  #取同一SET替代群組(sfkg027)資料,依替代群組編碼排序
                  DECLARE s_asft800_upd_set_cs1 CURSOR FOR
                   SELECT DISTINCT sfba027,(sfba035-sfba036) as sfba035          
                     FROM sfba_t
                    WHERE sfbaent = g_enterprise
                      AND sfbadocno = p_sfkadocno
                      AND sfba026 = '3' 
                      AND sfba034 = l_sfkg.sfkg034
                    ORDER BY sfba027
                  LET l_sfkg035_cal = l_sfaa012 - p_sfka012  #減少套數  
                  FOREACH s_asft800_upd_set_cs1
                     INTO l_sfba027_max,l_sfba035_max
                     IF l_sfkg035_cal > l_sfba035_max THEN
                        LET l_sfkg035_set = 0
                        LET l_sfkg035_cal = l_sfkg035_cal - l_sfba035_max
                     ELSE
                        LET l_sfkg035_set = l_sfba035_max - l_sfkg035_cal
                        LET l_sfkg035_cal = 0
                     END IF                     
                     IF l_sfba027_max = l_sfba027 THEN
                        LET l_flag = 'Y'
                        LET l_sfkg.sfkg035 = l_sfkg035_set
                        #应发数量=SET替代套数*QPA
                        LET l_sfkg.sfkg023 = l_sfkg.sfkg035 * (l_sfkg.sfkg010 / l_sfkg.sfkg011)
         
                        LET l_sfkg.sfkg013 = l_sfkg.sfkg023 + l_sfkg.sfkg024   
                        LET l_sfkg.sfkg024 = l_sfkg.sfkg013 - l_sfkg.sfkg023
                        EXIT FOREACH
                     END IF
                     IF l_sfkg035_cal <= 0 THEN
                        EXIT FOREACH
                     END IF
                  END FOREACH                 
               END IF            
            END IF
                  
         END IF
         IF l_flag = 'N' THEN
            LET l_sfkg.sfkg035 = l_sfba035
            LET l_sfkg.sfkg013 = l_sfba013
            LET l_sfkg.sfkg023 = l_sfba023
            LET l_sfkg.sfkg024 = l_sfba024
         END IF
         #160726-00001#10 add --(E)--
      END IF   #170904-00001#1 add

      #CALL s_aooi250_take_decimals(l_sfkg.sfkg014,l_sfkg.sfkg023) RETURNING l_success,l_sfkg.sfkg023      #170618-00401#1 mark
      #CALL s_aooi250_take_decimals(l_sfkg.sfkg014,l_sfkg.sfkg024) RETURNING l_success,l_sfkg.sfkg024      #170618-00401#1 mark
      #170618-00297#1-s mod 
      #CALL s_aooi250_take_decimals(l_sfkg.sfkg014,l_sfkg.sfkg013) RETURNING l_success,l_sfkg.sfkg013  #170618-00401#1 add
      CALL s_aooi250_get_msg(l_sfkg.sfkg014) RETURNING l_success,l_ooca002,l_ooca004
      IF l_success THEN
         #依據傳入的數量進行取位
         CALL s_num_round('4',l_sfkg.sfkg013,l_ooca002) RETURNING l_sfkg.sfkg013
      ELSE
         LET r_success = FALSE
      END IF
      #170618-00297#1-e mod 
      #160905-00022#2-e
      #161031-00060#2 add----s--------
      IF l_sfkg013_t=l_sfkg.sfkg015 THEN
         LET l_sfkg.sfkg015=l_sfkg.sfkg013
      END IF
      #161031-00060#2 add-----e-----------      
      #160905-00022#2-s
      #IF l_sfkg.sfkg015 + l_sfkg.sfkg016 > l_sfkg.sfkg013 THEN
      IF l_sfkg.sfkg015 + l_sfba.sfba016 > l_sfkg.sfkg013 THEN
      #160905-00022#2-e
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'asf-00379'
         LET g_errparam.extend = l_sfkg.sfkg006
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN r_success
      END IF
      #UPDATE sfkg_t SET sfkg_t.* = l_sfkg.* WHERE sfkgent = g_enterprise AND sfkgsite = g_site   #161109-00085#59 mark
      #161109-00085#59-s add
      UPDATE sfkg_t
         SET sfkg013 = l_sfkg.sfkg013,
             sfkg023 = l_sfkg.sfkg023,
             sfkg024 = l_sfkg.sfkg024,
             sfkg015 = l_sfkg.sfkg015  #161031-00060#2 add
            ,sfkg035 = l_sfkg.sfkg035  #170519-00043#1 add 
      #WHERE sfkgent = g_enterprise AND sfkgsite = g_site  #171019-00015#31 mark
       WHERE sfkgent = g_enterprise                        #171019-00015#31 add
     #161109-00085#59-e add
         AND sfkgdocno = p_sfkadocno AND sfkg900 = p_sfka900 
         AND sfkgseq = l_sfkg.sfkgseq AND sfkgseq1 = l_sfkg.sfkgseq1
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'update sfkg_t'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN r_success
      END IF
      
      #160905-00022#2-s
      #往前搬
      #INITIALIZE l_sfba.* TO NULL
      #IF l_sfkg.sfkg901 != '3' THEN
      #   SELECT * INTO l_sfba.* FROM sfba_t WHERE sfbaent = g_enterprise AND sfbasite = g_site
      #      AND sfbadocno = p_sfkadocno AND sfbaseq = l_sfkg.sfkgseq AND sfbaseq1 = l_sfkg.sfkgseq1
      #END IF
      #160905-00022#2-e
      IF l_sfkg.sfkg901 = '3' OR l_sfkg.sfkg013 != l_sfba.sfba013 THEN
         #其說明的SQL
         LET g_sfkh007 = ""
         IF NOT s_asft800_ins_sfkh(p_sfkadocno,l_sfkg.sfkgseq,l_sfkg.sfkgseq1,p_sfka900,'sfba013','1',l_sfba.sfba013,l_sfkg.sfkg013,g_sfkh007) THEN
            RETURN r_success
         END IF
      ELSE
         IF NOT s_asft800_del_sfkh(p_sfkadocno,l_sfkg.sfkgseq,l_sfkg.sfkgseq1,p_sfka900,'sfba013') THEN
            RETURN r_success
         END IF
      END IF
      IF l_sfkg.sfkg901 = '3' OR l_sfkg.sfkg023 != l_sfba.sfba023 THEN
         #其說明的SQL
         LET g_sfkh007 = ""
         IF NOT s_asft800_ins_sfkh(p_sfkadocno,l_sfkg.sfkgseq,l_sfkg.sfkgseq1,p_sfka900,'sfba023','1',l_sfba.sfba023,l_sfkg.sfkg023,g_sfkh007) THEN
            RETURN r_success
         END IF
      ELSE
         IF NOT s_asft800_del_sfkh(p_sfkadocno,l_sfkg.sfkgseq,l_sfkg.sfkgseq1,p_sfka900,'sfba023') THEN
            RETURN r_success
         END IF
      END IF
      IF l_sfkg.sfkg901 = '3' OR l_sfkg.sfkg024 != l_sfba.sfba024 THEN
         #其說明的SQL
         LET g_sfkh007 = ""
         IF NOT s_asft800_ins_sfkh(p_sfkadocno,l_sfkg.sfkgseq,l_sfkg.sfkgseq1,p_sfka900,'sfba024','1',l_sfba.sfba024,l_sfkg.sfkg024,g_sfkh007) THEN
            RETURN r_success
         END IF
      ELSE
         IF NOT s_asft800_del_sfkh(p_sfkadocno,l_sfkg.sfkgseq,l_sfkg.sfkgseq1,p_sfka900,'sfba024') THEN
            RETURN r_success
         END IF
      END IF
      
      #170519-00043#1 add(s)
      #SET替代套数
      IF l_sfkg.sfkg901 = '3' OR l_sfkg.sfkg035 != l_sfba035 THEN
         #其說明的SQL
         LET g_sfkh007 = ""
         IF NOT s_asft800_ins_sfkh(p_sfkadocno,l_sfkg.sfkgseq,l_sfkg.sfkgseq1,p_sfka900,'sfba035','1',l_sfba035,l_sfkg.sfkg035,g_sfkh007) THEN
            RETURN r_success
         END IF
      ELSE
         IF NOT s_asft800_del_sfkh(p_sfkadocno,l_sfkg.sfkgseq,l_sfkg.sfkgseq1,p_sfka900,'sfba035') THEN
            RETURN r_success
         END IF
      END IF
      #170519-00043#1 add(e)
      
      IF l_sfkg.sfkg901 != '3' THEN
        #SELECT COUNT(1) INTO l_n FROM sfkh_t WHERE sfkhent = g_enterprise AND sfkhsite = g_site  #171019-00015#31 mark
         SELECT COUNT(1) INTO l_n FROM sfkh_t WHERE sfkhent = g_enterprise                        #171019-00015#31 add
            AND sfkhdocno = p_sfkadocno AND sfkhseq = l_sfkg.sfkgseq AND sfkhseq1 = l_sfkg.sfkgseq1
            AND sfkh001 = p_sfka900 AND sfkh002 LIKE 'sfba%'
         IF l_n = 0 THEN
            UPDATE sfkg_t SET sfkg901 = '1' 
            #WHERE sfkgent = g_enterprise AND sfkgsite = g_site  #171019-00015#31 mark
             WHERE sfkgent = g_enterprise                        #171019-00015#31 add
               AND sfkgdocno = p_sfkadocno AND sfkg900 = p_sfka900
               AND sfkgseq = l_sfkg.sfkgseq AND sfkgseq1 = l_sfkg.sfkgseq1
         ELSE
            UPDATE sfkg_t SET sfkg901 = '2' 
            #WHERE sfkgent = g_enterprise AND sfkgsite = g_site  #171019-00015#31 mark
             WHERE sfkgent = g_enterprise                        #171019-00015#31 add
               AND sfkgdocno = p_sfkadocno AND sfkg900 = p_sfka900
               AND sfkgseq = l_sfkg.sfkgseq AND sfkgseq1 = l_sfkg.sfkgseq1
         END IF
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'update sfkg_t'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            RETURN r_success
         END IF
      END IF
      IF cl_null(l_sfkgseq_t) OR l_sfkgseq_t != l_sfkg.sfkgseq THEN
         LET l_sfkgseq_t = l_sfkg.sfkgseq
      END IF
   END FOREACH
      
   
   LET r_success = TRUE
   END IF  #170618-00276#1 add
   RETURN r_success
   
END FUNCTION

################################################################################
# Descriptions...: 工单变更审核前检查
# Memo...........:
# Usage..........: CALL s_asft800_confirm_chk(p_sfkadocno,p_sfka900)
#                  RETURNING r_success
# Input parameter: 1.p_sfkadocno
#                : 2.p_sfka900
# Return code....: 1.r_success
# Date & Author..: 14/7/22 By wuxja
# Modify.........: #160905-00022#2 改用彙總訊息
################################################################################
PUBLIC FUNCTION s_asft800_confirm_chk(p_sfkadocno,p_sfka900)
DEFINE p_sfkadocno  LIKE sfka_t.sfkadocno
DEFINE p_sfka900    LIKE sfka_t.sfka900
DEFINE r_success    LIKE type_t.num5
DEFINE l_cnt1          LIKE type_t.num5         #170310-00058#1 add
DEFINE l_sfka       RECORD
    sfkastus   LIKE sfka_t.sfkastus,
    sfkaacti   LIKE sfka_t.sfkaacti,  #161018-00002#1
    sfka003    LIKE sfka_t.sfka003,
    sfka010    LIKE sfka_t.sfka010,
    sfka012    LIKE sfka_t.sfka012,
    sfka013    LIKE sfka_t.sfka013
   ,sfka005    LIKE sfka_t.sfka005 #161219-00035#1 add
                END RECORD
DEFINE l_sfaa       RECORD
    sfaastus   LIKE sfaa_t.sfaastus,  #170427-00076#1
    sfaa013    LIKE sfaa_t.sfaa013,
    sfaa047    LIKE sfaa_t.sfaa047,
    sfaa048    LIKE sfaa_t.sfaa048,
    sfaa049    LIKE sfaa_t.sfaa049,
    sfaa050    LIKE sfaa_t.sfaa050,
    sfaa051    LIKE sfaa_t.sfaa051
                END RECORD
DEFINE l_imae015    LIKE imae_t.imae015   #生产超交率
DEFINE l_n          LIKE type_t.num5
DEFINE l_sql        STRING
DEFINE l_sfkb       RECORD
    sfkbseq    LIKE sfkb_t.sfkbseq,
    sfkb002    LIKE sfkb_t.sfkb002,
    sfkb003    LIKE sfkb_t.sfkb003,
    sfkb004    LIKE sfkb_t.sfkb004,
    sfkb005    LIKE sfkb_t.sfkb005,
    sfkb007    LIKE sfkb_t.sfkb007
                END RECORD
DEFINE l_xmdd004    LIKE xmdd_t.xmdd004
DEFINE l_xmdd006    LIKE xmdd_t.xmdd006
DEFINE l_sfaa013    LIKE sfaa_t.sfaa013
DEFINE l_sfab007    LIKE sfab_t.sfab007
DEFINE l_sum0       LIKE sfaa_t.sfaa012
DEFINE l_sum1       LIKE sfaa_t.sfaa012
DEFINE l_success    LIKE type_t.num5
DEFINE l_sfkg       RECORD
    sfkgseq    LIKE sfkg_t.sfkgseq,
    sfkgseq1   LIKE sfkg_t.sfkgseq1,   #170321-00106 add sfkgseq1
    sfkg006    LIKE sfkg_t.sfkg006,
    sfkg008    LIKE sfkg_t.sfkg008,
    sfkg013    LIKE sfkg_t.sfkg013,
    sfkg030    LIKE sfkg_t.sfkg030
                END RECORD
DEFINE l_sfba       RECORD
    sfbaseq    LIKE sfba_t.sfbaseq,
    sfba009    LIKE sfba_t.sfba009,
    sfba010    LIKE sfba_t.sfba010,
    sfba011    LIKE sfba_t.sfba011,
    sfba016    LIKE sfba_t.sfba016,
    sfba017    LIKE sfba_t.sfba017,
    sfba025    LIKE sfba_t.sfba025
                END RECORD
DEFINE l_sfba010    LIKE sfba_t.sfba010
DEFINE l_sfba011    LIKE sfba_t.sfba011
DEFINE l_sfba_sum   LIKE sfba_t.sfba013
DEFINE l_imaf055    LIKE imaf_t.imaf055  #160519-00008#21
DEFINE l_sfaa050    LIKE sfaa_t.sfaa050
#161021-00049#1-s
DEFINE l_ooff013_1  LIKE ooff_t.ooff013
DEFINE l_ooff013_2  LIKE ooff_t.ooff013
DEFINE l_flag       LIKE type_t.chr1
#161021-00049#1-e
DEFINE  l_sfkg006_old   LIKE sfkg_t.sfkg006     #170321-00106 add
DEFINE  l_imae020    LIKE imae_t.imae020        #171123-00012#1 add

   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   
   #检查参数
   #170816-00007#85 mark --s
   #IF cl_null(p_sfkadocno) OR cl_null(p_sfka900) THEN
   #   #传入参数为空或传入值不正确!请联系MIS人员检查!
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.code = 'sub-00280'
   #   LET g_errparam.extend = 's_asft800_confirm_chk'
   #   LET g_errparam.popup = TRUE
   #   CALL cl_err()
   #   LET r_success = FALSE
   #   RETURN r_success
   #END IF
   #170816-00007#85 mark --e
   #170816-00007#85 add --s
   LET g_msg = ''
   IF cl_null(p_sfkadocno) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("asfp100","lbl_sfaadocno") RETURNING g_colname_1,g_comment_1   #工單單號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_sfka900) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("asf-00901",g_dlang)   #變更序
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF NOT cl_null(g_msg) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00788'  #%1傳入值為空(錯誤)
      LET g_errparam.popup = TRUE
      LET g_errparam.replace[1] = g_msg 
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF   
   #170816-00007#85 add --e
   
   INITIALIZE l_sfaa.* TO NULL
   INITIALIZE l_sfkg.* TO NULL
   LET l_imae015 = 0
   SELECT sfaastus,sfaa013,sfaa047,sfaa048,sfaa049,sfaa050,sfaa051,sfkastus,sfkaacti,sfka003,sfka010,sfka012,sfka013,sfka005,imae015 #161219-00035#1 add sfka005  #170427-00076#1 add sfaastus
     INTO l_sfaa.sfaastus,l_sfaa.sfaa013,l_sfaa.sfaa047,l_sfaa.sfaa048,l_sfaa.sfaa049,l_sfaa.sfaa050,  #170427-00076#1 add sfaastus
          l_sfaa.sfaa051,l_sfka.sfkastus,l_sfka.sfkaacti,l_sfka.sfka003,l_sfka.sfka010,
          l_sfka.sfka012,l_sfka.sfka013,l_sfka.sfka005,l_imae015 #161219-00035#1 add sfka005
     FROM sfaa_t,sfka_t
     LEFT JOIN imae_t ON imaeent=sfkaent AND imaesite=sfkasite AND imae001=sfka010
   #171019-00015#31 -S mark
   #WHERE sfaaent=sfkaent AND sfaasite=sfkasite AND sfaadocno=sfkadocno
   #  AND sfkaent = g_enterprise AND sfkasite = g_site
   #171019-00015#31 -E mark
   #171019-00015#31 -S add
    WHERE sfaaent=sfkaent AND sfaadocno=sfkadocno
      AND sfkaent = g_enterprise
   #171019-00015#31 -E add
      AND sfkadocno = p_sfkadocno AND sfka900 = p_sfka900
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00381'
      LET g_errparam.extend = p_sfkadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   IF cl_null(l_imae015) THEN LET l_imae015 = 0 END IF
   #171123-00012#1 add---s-------
   SELECT imae020 INTO l_imae020 FROM imae_t 
      WHERE imaeent=g_enterprise AND imaesite=g_site AND imae001=l_sfka.sfka010   
   IF cl_null(l_imae020) THEN LET l_imae020=0 END IF  
   #171123-00012#1 add----e-------
   #170427-00076#1-s
   #工單狀態須為F:發出才能執行變更！
   IF l_sfaa.sfaastus <> 'F' THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00859'
      LET g_errparam.extend = p_sfkadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF
   #170427-00076#1-e
   
   #170310-00058#1-s
   #判斷備註是否有異動過
   LET l_cnt1 = 0
   SELECT COUNT(1) INTO l_cnt1
     FROM ooff_t A
    WHERE ooffent = g_enterprise AND ooff001 IN ('6','7')
      AND ooff002 = g_prog       AND ooff003 = p_sfkadocno
      AND NOT EXISTS (SELECT 1 FROM ooff_t B WHERE B.ooffent = A.ooffent AND B.ooff001 = A.ooff001
                                               AND B.ooff002 = 'asft300' AND B.ooff003 = A.ooff003
                                               AND B.ooff004 = A.ooff004 
                                               AND B.ooff012 = A.ooff012 
                                               AND NVL(B.ooff013,' ') = NVL(A.ooff013,' ')
                                               AND NVL(B.ooff014,'99/12/31') = NVL(A.ooff014,'99/12/31'))                                               
   #170310-00058#1-e
         
   #检查状态是否为'未确认'
   #MOD BY zhujing 2015-6-16 单据核准状态可以执行确认
   IF cl_null(l_sfka.sfkastus) OR l_sfka.sfkastus NOT MATCHES '[NA]' THEN
      #本單據狀態不為 未確認，不可執行確認
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00198'
      LET g_errparam.extend = l_sfka.sfkastus
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF
   #170310-00058#1-s mark
#   #161021-00049#1-s
#   LET l_flag = 'N'
#   CALL s_aooi360_sel('6',p_sfkadocno,'','','','','','','','','','2') RETURNING l_success,l_ooff013_1
#   CALL s_aooi360_sel('6',g_site,p_sfkadocno,p_sfka900,'','','','','','','','2') RETURNING l_success,l_ooff013_2
#   IF l_ooff013_1 <> l_ooff013_2 OR
#      (l_ooff013_1 IS NULL AND l_ooff013_2 IS NOT NULL) OR
#      (l_ooff013_2 IS NULL AND l_ooff013_1 IS NOT NULL) THEN
#      LET l_flag = 'Y'
#   END IF
#   #161021-00049#1-e
   #170310-00058#1-e mark
   #160329-00032#1-s
   #若無變更，則不允許確認
   LET l_n = 0
   SELECT COUNT(1) INTO l_n FROM sfkh_t
    WHERE sfkhent = g_enterprise
      AND sfkhdocno = p_sfkadocno
      AND sfkh001 = p_sfka900
   IF (cl_null(l_n) OR l_n = 0) AND (cl_null(l_cnt1) OR l_cnt1 = 0) AND l_sfka.sfkaacti = 'N' AND l_flag = 'N' THEN   #170310-00058#1 add  
   #IF l_n = 0 AND l_sfka.sfkaacti = 'N' AND l_flag = 'N' THEN  #161018-00002#1  #161021-00049#1  #170310-00058#1 mark
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00550'
      LET g_errparam.extend = p_sfkadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF
   #160329-00032#1-e
   
   #检查工单是否结案
   IF NOT cl_null(l_sfaa.sfaa047) OR NOT cl_null(l_sfaa.sfaa048) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00293'
      LET g_errparam.extend = p_sfkadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF
   
   #160905-00022#2-s
   #變更後的生產數量不可以小於工單已發料套數
   IF l_sfaa.sfaa049 > l_sfka.sfka012 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00793'
      LET g_errparam.extend = p_sfkadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF
   #工單生產料號類別為1.一般，2.聯產品兩者數量之和需與生產數量相等
   IF l_sfka.sfka003 != '3' THEN
      LET l_sum0 = 0
      SELECT SUM(sfkc003) INTO l_sum0 FROM sfkc_t
      #WHERE sfkcent = g_enterprise AND sfkcsite = g_site  #171019-00015#31 mark
       WHERE sfkcent = g_enterprise                        #171019-00015#31 add
         AND sfkcdocno = p_sfkadocno AND sfkc900 = p_sfka900
         AND (sfkc002 ='1' OR sfkc002 = '2')
      IF l_sum0 != l_sfka.sfka012 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'asf-00366'
         LET g_errparam.extend = p_sfkadocno
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
   END IF
   #160905-00022#2-e
   
   #160504-00017#1-s
   #依工单号+runcard+作业编号+作业序+报工类别取MAX（SUM良品数量），若变更后数量<MAX（SUM良品数量）
   LET l_sum0 = 0
   SELECT MAX(SUM(sffb017)) INTO l_sum0
     FROM sffb_t
    WHERE sffbent = g_enterprise    
      AND sffb005 = p_sfkadocno
      AND sffbstus != 'X'            #170123-00029#1   2017/01/25   Add By zhaoqya
    GROUP BY sffb001,sffb007,sffb008
#  IF l_sfka.sfka012 > l_sum0 THEN   #161109-00039#1 mark
   IF l_sfka.sfka012 < l_sum0 THEN   #161109-00039#1 mod  應該是變更後數量(sfka012)<已報工數量(l_sum0)
      #变更后数量不可小于已报工数量
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00725'
       LET g_errparam.replace[1] = l_sum0
      LET g_errparam.extend = p_sfkadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF
   #160504-00017#1-e
   
   #重新抓取工单入库量，与变更后生产数量比较
   IF l_sfka.sfka012 * (1 + l_imae015 / 100) < l_sfaa.sfaa050 + l_sfaa.sfaa051 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = l_sfka.sfka012
      LET g_errparam.code   = "asf-00378"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF
   
   #有来源单据的需重新抓取已开工单量，与本次变更数量比较
   LET l_sql = " SELECT sfkbseq,sfkb002,sfkb003,sfkb004,sfkb005,sfkb007 ",
               "   FROM sfkb_t ",
              #"  WHERE sfkbent = ",g_enterprise," AND sfkbsite = '",g_site,"' ",  #171019-00015#31 mark
               "  WHERE sfkbent = ",g_enterprise,                                  #171019-00015#31 add
               "    AND sfkbdocno = '",p_sfkadocno,"' AND sfkb900 = ",p_sfka900,
               "    AND (sfkb901 = '2' OR sfkb901 = '3') " 
   PREPARE s_asft800_confirm_chk_pre1 FROM l_sql
   DECLARE s_asft800_confirm_chk_cur1 CURSOR FOR s_asft800_confirm_chk_pre1
   
   LET l_sql = " SELECT sfaa013,sfab007 FROM sfaa_t,sfab_t ",
               "  WHERE sfaaent = sfabent AND sfaadocno = sfabdocno ",
               "    AND sfaaent = ",g_enterprise," AND sfaasite = '",g_site,"' ",
               "    AND sfaa010 = '",l_sfka.sfka010,"' AND sfaastus != 'X' ",
               "    AND sfab002 = ? AND sfab003 = ? AND sfab004 = ? AND sfab005 = ?"
   PREPARE s_asft800_confirm_chk_pre2 FROM l_sql
   DECLARE s_asft800_confirm_chk_cur2 CURSOR FOR s_asft800_confirm_chk_pre2
   
   INITIALIZE l_sfkb.* TO NULL
   FOREACH s_asft800_confirm_chk_cur1 INTO l_sfkb.sfkbseq,l_sfkb.sfkb002,l_sfkb.sfkb003,
                                           l_sfkb.sfkb004,l_sfkb.sfkb005,l_sfkb.sfkb007
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "s_asft800_confirm_chk_cur1"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      IF cl_null(l_sfkb.sfkb007) THEN LET l_sfkb.sfkb007 = 0 END IF
      
      #原始需求数量折合生产单位需求数量
      LET l_sum0 = 0
      LET l_xmdd004 = ''
      LET l_xmdd006 = 0
      IF l_sfka.sfka005='2' THEN       #170220-00010#1 add 只有来源为2：订单时，才会将销售单位与生产单位转换
         SELECT xmdd004,xmdd006 INTO l_xmdd004,l_xmdd006
           FROM xmda_t,xmdd_t
          WHERE xmdaent = xmddent AND xmdadocno = xmdddocno AND xmdastus != 'X'
           #AND xmddent = g_enterprise AND xmddsite = g_site AND xmdd001 = l_sfka.sfka010  #171019-00015#31 mark
            AND xmddent = g_enterprise AND xmdd001 = l_sfka.sfka010                        #171019-00015#31 add
            AND xmdddocno = l_sfkb.sfkb002 AND xmddseq = l_sfkb.sfkb003
            AND xmddseq1 = l_sfkb.sfkb004 AND xmddseq2 = l_sfkb.sfkb005
         IF cl_null(l_xmdd006) THEN LET l_xmdd006 = 0 END IF
         
         CALL s_aooi250_convert_qty(l_sfka.sfka010,l_xmdd004,l_sfka.sfka013,l_xmdd006) 
              RETURNING l_success,l_sum0
         IF cl_null(l_sum0) THEN LET l_sum0 = 0 END IF
      END IF                           #170220-00010#1 add
      #已开工单数量
      LET l_sum1 = 0
      LET l_sfaa013 = ''
      LET l_sfab007 = 0
      FOREACH s_asft800_confirm_chk_cur2 INTO l_sfaa013,l_sfab007
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "s_asft800_confirm_chk_cur2"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()
            EXIT FOREACH
         END IF
         IF cl_null(l_sfab007) THEN LET l_sfab007 = 0 END IF
         CALL s_aooi250_convert_qty(l_sfka.sfka010,l_sfaa013,l_sfka.sfka013,l_sfab007) 
              RETURNING l_success,l_sfab007
         LET l_sum1 = l_sum1 + l_sfab007
      END FOREACH
      IF cl_null(l_sum1) THEN LET l_sum1 = 0 END IF
      
      #IF l_sfka.sfka005 != '0' AND l_sfka.sfka005 != '4' THEN #161219-00035#1 add #170220-00010#1 mark 
      IF l_sfka.sfka005 = '2' THEN                                                 #170220-00010#1 add 
         #变更前对应数量
         LET l_sfab007 = 0
         SELECT sfab007 INTO l_sfab007 FROM sfab_t
         #WHERE sfabent = g_enterprise AND sfabsite = g_site AND sfabseq = l_sfkb.sfkbseq  #171019-00015#31 mark
          WHERE sfabent = g_enterprise AND sfabseq = l_sfkb.sfkbseq                        #171019-00015#31 add
            AND sfabdocno = p_sfkadocno  #170327-00049#1 add
         IF cl_null(l_sfab007) THEN LET l_sfab007 = 0 END IF
         
         IF l_sfkb.sfkb007 > (l_sum0 - l_sum1) * (1 + l_imae015 / 100) + l_sfab007 THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = l_sfkb.sfkb007
            LET g_errparam.code   = "asf-00157" 
            LET g_errparam.popup  = TRUE
            LET g_errparam.coll_vals[1] = l_sfkb.sfkbseq
            CALL cl_err()
            LET r_success = FALSE
         END IF
      END IF #161219-00035#1 add
   END FOREACH
   
   #检查发生修改或新增的每一笔备料单身，重新抓取该备料已发数量、超领数量、报废数量
   #若变更后总应发数量<已发数量，不可确认
   #若（已发数量+超领数量-报废数量）*(1+变更后误差率/100)<已入庫合格量+已入庫不合格量，不可确认
   LET l_sql = " SELECT sfkgseq,sfkgseq1,sfkg006,sfkg008,sfkg013,sfkg030, ",        #170321-00106 add sfkgseq1
               "        sfbaseq,sfba009,sfba010,sfba011,sfba016,sfba017,sfba025, ",
               "        imaf055 ",
               "   FROM sfkg_t ",
              #"   LEFT JOIN sfba_t ON sfbaent=sfkgent AND sfbasite=sfkgsite AND sfbadocno=sfkgdocno ",  #171019-00015#31 mark
               "   LEFT JOIN sfba_t ON sfbaent=sfkgent AND sfbadocno=sfkgdocno ",                        #171019-00015#31 add
               "                   AND sfbaseq=sfkgseq AND sfbaseq1=sfkgseq1 ",
               "   LEFT JOIN imaf_t ON imafent=sfkgent AND imafsite=sfkgsite AND imaf001=sfkg006 ",
              #"  WHERE sfkgent=",g_enterprise," AND sfkgsite='",g_site,"'",  #171019-00015#31 mark
               "  WHERE sfkgent=",g_enterprise,                               #171019-00015#31 add
               "    AND sfkgdocno='",p_sfkadocno,"' AND sfkg900=",p_sfka900," AND (sfkg901='2' OR sfkg901='3')"
   PREPARE s_asft800_confirm_chk_pre3 FROM l_sql
   DECLARE s_asft800_confirm_chk_cur3 CURSOR FOR s_asft800_confirm_chk_pre3
   INITIALIZE l_sfkg.* TO NULL
   INITIALIZE l_sfba.* TO NULL
   LET l_imaf055 = ''
   FOREACH s_asft800_confirm_chk_cur3 INTO l_sfkg.sfkgseq,l_sfkg.sfkgseq1,l_sfkg.sfkg006,l_sfkg.sfkg008,l_sfkg.sfkg013,l_sfkg.sfkg030,   #170321-00106 add l_sfkgseq1
                                           l_sfba.sfbaseq,l_sfba.sfba009,l_sfba.sfba010,l_sfba.sfba011,l_sfba.sfba016,
                                           l_sfba.sfba017,l_sfba.sfba025,l_imaf055
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "s_asft800_confirm_chk_cur3"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      
      #160519-00008#21-s
      #庫存管理特徵不可為空！
      IF l_imaf055 = '1' AND cl_null(l_sfkg.sfkg030) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = l_sfkg.sfkg006
         LET g_errparam.code   = 'sub-00125'
         LET g_errparam.popup  = TRUE
         LET g_errparam.coll_vals[1] = l_sfkg.sfkgseq
         CALL cl_err()
         LET r_success = FALSE
      END IF 
      #160519-00008#21-e
      
      #IF NOT cl_null(l_sfba.sfbaseq) THEN  #170110-00073#1 mark
      IF cl_null(l_sfba.sfbaseq) THEN  #170110-00073#1 add null的话是说明 是新增的,所以不用判断后面的
         CONTINUE FOREACH
      END IF
      
      #by wuxja 20150811 add  --begin--
      #已有发料数量的料不可改为参考材料！
      IF l_sfkg.sfkg008 = '4' AND l_sfba.sfba016 > 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = l_sfkg.sfkgseq
         LET g_errparam.code   = "asf-00480"
         LET g_errparam.popup  = TRUE
         LET g_errparam.coll_vals[1] = l_sfkg.sfkgseq
         CALL cl_err()
         LET r_success = FALSE
      END IF
      #by wuxja 20150811 add  --end--
      
      #變更後總應發數量不可小於已發數量
      #IF l_sfkg.sfkg013 < l_sfba.sfba016 + l_sfba.sfba025 - l_sfba.sfba017 THEN
      IF l_sfkg.sfkg013 < l_sfba.sfba016 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = l_sfkg.sfkgseq
         LET g_errparam.code   = "asf-00372"
         LET g_errparam.popup  = TRUE
         LET g_errparam.coll_vals[1] = l_sfkg.sfkgseq
         CALL cl_err()
         LET r_success = FALSE
      END IF
      #170321-00106 add-------s-------
      #如果备料料号有变更，则检查原料号是否有发料，有的话不允许变更
     #SELECT sfkh004 INTO l_sfkg006_old FROM sfkh_t WHERE sfkhent=g_enterprise AND sfkhdocno=p_sfkadocno  AND sfkhsite=g_site  #171019-00015#31 mark
      SELECT sfkh004 INTO l_sfkg006_old FROM sfkh_t WHERE sfkhent=g_enterprise AND sfkhdocno=p_sfkadocno                       #171019-00015#31 add
         AND sfkhseq=l_sfkg.sfkgseq AND sfkhseq1=l_sfkg.sfkgseq1 AND sfkh001=p_sfka900 AND sfkh002='sfba006' AND sfkh003='12'
      IF NOT cl_null(l_sfkg006_old) THEN #发料料号有变更
         #判断料号是否有发料单
        #SELECT COUNT(1) INTO l_n FROM sfda_t LEFT JOIN sfdc_t ON sfdaent=sfdcent AND sfdasite=sfdcsite AND sfdadocno=sfdcdocno  #171019-00015#31 mark
         SELECT COUNT(1) INTO l_n FROM sfda_t LEFT JOIN sfdc_t ON sfdaent=sfdcent AND sfdadocno=sfdcdocno                        #171019-00015#31 add
            WHERE sfdcent=g_enterprise AND sfdcsite=g_site AND sfdc001=p_sfkadocno AND sfdc004=l_sfkg006_old AND sfdastus<>'X'
         IF cl_null(l_n) THEN LET l_n=0 END IF
         IF l_n > 0 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = l_sfkg.sfkgseq
            LET g_errparam.code   = "asf-00843"
            LET g_errparam.popup  = TRUE
            LET g_errparam.coll_vals[1] = l_sfkg.sfkgseq
            CALL cl_err()
            LET r_success = FALSE         
         END IF
      END IF
      #170321-00106 add-------e-------
      IF l_sfba.sfba009 != 'Y' AND l_sfkg.sfkg008 != '4' AND l_sfkg.sfkg008 != '3' THEN
         #是否为多项序资料(取替代或者多特征），则要换算到项序0的数量
         LET l_n = 0
         SELECT COUNT(1) INTO l_n FROM sfba_t
         #WHERE sfbaent = g_enterprise AND sfbasite = g_site  #171019-00015#31 mark
          WHERE sfbaent = g_enterprise                        #171019-00015#31 add
            AND sfbadocno = p_sfkadocno AND sfbaseq = l_sfkg.sfkgseq
         IF l_n > 1 THEN
            LET l_sfba010 = 0
            LET l_sfba011 = 0
            SELECT sfba010,sfba011 INTO l_sfba010,l_sfba011 FROM sfba_t
            #WHERE sfbaent = g_enterprise AND sfbasite = g_site  #171019-00015#31 mark
             WHERE sfbaent = g_enterprise                        #171019-00015#31 add
               AND sfbadocno = p_sfkadocno AND sfbaseq = l_sfkg.sfkgseq AND sfbaseq1 = 0 
            LET l_sfba_sum = 0
            SELECT SUM(sfba016/sfba022)+SUM(sfba025/sfba022)-SUM(sfba017/sfba022) INTO l_sfba_sum FROM sfba_t
            #WHERE sfbaent = g_enterprise AND sfbasite = g_site  #171019-00015#31 mark
             WHERE sfbaent = g_enterprise                        #171019-00015#31 add
               AND sfbadocno = p_sfkadocno AND sfbaseq = l_sfkg.sfkgseq
         ELSE
            LET l_sfba010 = l_sfba.sfba010
            LET l_sfba011 = l_sfba.sfba011
            LET l_sfba_sum = l_sfba.sfba016 + l_sfba.sfba025 - l_sfba.sfba017
         END IF
         LET l_sfaa050 = (l_sfaa.sfaa050 + l_sfaa.sfaa051) * l_sfba010 / l_sfba011
         CALL s_aooi250_take_decimals(l_sfaa.sfaa013,l_sfaa050) RETURNING l_success,l_sfaa050
         #IF l_sfba_sum * (1 + l_imae015 / 100) < l_sfaa050 THEN   #171123-00012#1 mark
         IF l_sfba_sum * (1 + l_imae015 / 100) < l_sfaa050-(l_sfaa050*l_imae020/100) THEN    #171123-00012#1 add
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = l_sfkg.sfkgseq
            LET g_errparam.code   = "asf-00384" 
            LET g_errparam.popup  = TRUE 
            LET g_errparam.coll_vals[1] = l_sfkg.sfkgseq
            CALL cl_err()
            LET r_success = FALSE
         END IF
      END IF
   END FOREACH
   
   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 工单变更审核
# Memo...........:
# Usage..........: CALL s_asft800_confirm_upd(p_sfkadocno,p_sfka900)
#                  RETURNING r_success
# Input parameter: 1.p_sfkadocno              LIKE sfka_t.sfkadocno
#                : 2.p_sfka900                LIKE sfka_t.sfka900
# Return code....: 1.r_success                LIKE type_t.num5
# Date & Author..: 14/7/22 By wuxja
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft800_confirm_upd(p_sfkadocno,p_sfka900)
DEFINE p_sfkadocno              LIKE sfka_t.sfkadocno
DEFINE p_sfka900                LIKE sfka_t.sfka900
DEFINE r_success                LIKE type_t.num5
DEFINE l_sql                    STRING
DEFINE l_sfka901                LIKE sfka_t.sfka901
DEFINE l_sfkaacti               LIKE sfka_t.sfkaacti
#DEFINE l_sfkb                   RECORD LIKE sfkb_t.*   #161109-00085#59 mark
DEFINE l_sfkbseq                LIKE sfkb_t.sfkbseq     #161109-00085#59 add
#DEFINE l_sfkc                   RECORD LIKE sfkc_t.*   #161109-00085#59 mark
DEFINE l_sfkcseq                LIKE sfkc_t.sfkcseq     #161109-00085#59 add
#DEFINE l_sfkf                   RECORD LIKE sfkf_t.*   #161109-00085#59 mark
DEFINE l_sfkfseq                LIKE sfkf_t.sfkfseq     #161109-00085#59 add
#DEFINE l_sfkg                   RECORD LIKE sfkg_t.*   #161109-00085#59 mark
#161109-00085#59-s add
DEFINE l_sfkg                   RECORD  #工單變更單備料單身
       sfkgseq LIKE sfkg_t.sfkgseq,   #項次
       sfkgseq1 LIKE sfkg_t.sfkgseq1  #項序
               END RECORD
#161109-00085#59-e add
DEFINE l_sfkacnfdt              DATETIME YEAR TO SECOND
DEFINE l_sfaa047                LIKE sfaa_t.sfaa047
DEFINE l_sfkhdocno              LIKE sfkh_t.sfkhdocno
DEFINE l_sfkh004                LIKE sfkh_t.sfkh004
DEFINE l_sfkh005                LIKE sfkh_t.sfkh005
DEFINE l_success                LIKE type_t.num5     #151207-00001#4 add
DEFINE l_doc_type               LIKE ooba_t.ooba002  #151207-00001#4 add
DEFINE l_sfka012                LIKE sfka_t.sfka012  #160511-00021 by whitney add
DEFINE l_sfaa012                LIKE sfaa_t.sfaa012  #160511-00021 by whitney add
DEFINE l_sfaa071                LIKE sfaa_t.sfaa071  #160425-00019 by whitney add
DEFINE l_sfki901                LIKE sfki_t.sfki901  #160727-00025#2
#161021-00049#1-s
DEFINE l_ooff013_1              LIKE ooff_t.ooff013
DEFINE l_ooff013_2              LIKE ooff_t.ooff013
#161021-00049#1-e
#170510-00061#1 add(s)
DEFINE l_sfcb DYNAMIC ARRAY OF RECORD 
  sfcbdocno LIKE sfcb_t.sfcbdocno,
  sfcb001  LIKE sfcb_t.sfcb001,
  sfcb002  LIKE sfcb_t.sfcb002,
  sfcb003  LIKE sfcb_t.sfcb003,
  sfcb004  LIKE sfcb_t.sfcb004,
  sfcb014  LIKE sfcb_t.sfcb014,
  sfcb015  LIKE sfcb_t.sfcb015,
  sfcb016  LIKE sfcb_t.sfcb016,
  sfcb017  LIKE sfcb_t.sfcb017,
  sfcb018  LIKE sfcb_t.sfcb018,
  sfcb019  LIKE sfcb_t.sfcb019
          END RECORD
DEFINE l_i LIKE type_t.num5
DEFINE l_row LIKE type_t.num5
DEFINE l_diff_num LIKE type_t.num5
#170510-00061#1 add(e)
DEFINE l_sfaa004  LIKE sfaa_t.sfaa004 #170618-00452#1 #發料制度
DEFINE l_cnt_sfba009 LIKE type_t.num10 #170929-00029#1 add
#171110-00021#12 add-->s
DEFINE l_sfka005     LIKE sfka_t.sfka005
DEFINE l_sfka006     LIKE sfka_t.sfka006
DEFINE l_sfka074     LIKE sfka_t.sfka074
DEFINE l_psos024     LIKE psos_t.psos024
DEFINE l_psos045     LIKE psos_t.psos045
DEFINE l_psos062     LIKE psos_t.psos062
DEFINE l_sfaa012_sum LIKE sfaa_t.sfaa012
#171110-00021#12 add-->s


   WHENEVER ERROR CONTINUE
   LET r_success = FALSE

   #检查参数
   #170816-00007#85 mark --s
   #IF cl_null(p_sfkadocno) OR cl_null(p_sfka900) THEN
   #   #传入参数为空或传入值不正确!请联系MIS人员检查!
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.code = 'sub-00280'
   #   LET g_errparam.extend = ''
   #   LET g_errparam.popup = TRUE
   #   CALL cl_err()
   #   RETURN r_success
   #END IF
   #170816-00007#85 mark --e
   #170816-00007#85 mark --s
   LET g_msg = ''
   IF cl_null(p_sfkadocno) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("asfp100","lbl_sfaadocno") RETURNING g_colname_1,g_comment_1   #工單單號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_sfka900) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("asf-00901",g_dlang)   #變更序
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF NOT cl_null(g_msg) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00788'  #%1傳入值為空(錯誤)
      LET g_errparam.popup = TRUE
      LET g_errparam.replace[1] = g_msg 
      CALL cl_err()
      RETURN r_success
   END IF   
   #170816-00007#85 add --e
   
   #檢查:應在事物中的
   IF NOT s_transaction_chk('Y','0') THEN
      RETURN r_success
   END IF
    #170310-00058#1-s mark
#   #161021-00049#1-s
#   CALL s_aooi360_sel('6',p_sfkadocno,'','','','','','','','','','2') RETURNING l_success,l_ooff013_1
#   CALL s_aooi360_sel('6',g_site,p_sfkadocno,p_sfka900,'','','','','','','','2') RETURNING l_success,l_ooff013_2
#   IF l_ooff013_1 <> l_ooff013_2 OR
#      (l_ooff013_1 IS NULL AND l_ooff013_2 IS NOT NULL) OR
#      (l_ooff013_2 IS NULL AND l_ooff013_1 IS NOT NULL) THEN
#      IF cl_null(l_ooff013_2) THEN
#         IF NOT s_aooi360_del('6',p_sfkadocno,' ',' ',' ',' ',' ',' ',' ',' ',' ','2') THEN
#            RETURN r_success
#         END IF
#      ELSE
#         IF NOT s_aooi360_gen('6',p_sfkadocno,' ',' ',' ',' ',' ',' ',' ',' ',' ','2',l_ooff013_2) THEN
#            RETURN r_success
#         END IF
#      END IF
#   END IF
#   #161021-00049#1-e
    #170310-00058#1-e mark  

   #171110-00021#12 add-->s
   SELECT sfka005,sfka006,sfka012,sfka074 INTO l_sfka005,l_sfka006,l_sfka012,l_sfka074 FROM sfka_t 
      WHERE sfkaent = g_enterprise AND sfkasite = g_site 
         AND sfkadocno = p_sfkadocno AND sfka900 = p_sfka900
         
   IF l_sfka005 = '3' THEN
      SELECT sfaa012 INTO l_sfaa012 FROM sfaa_t 
         WHERE sfaaent = g_enterprise  AND sfaasite = g_site 
            AND sfaadocno = p_sfkadocno
            
      IF l_sfka012 <> l_sfaa012 THEN
         LET l_psos062 = 0
         SELECT psos062 INTO l_psos062
           FROM psos_t
          WHERE psosent = g_enterprise
            AND psossite= g_site
            AND psos004 = l_sfka006 
            AND psos002 = l_sfka074
            
         IF cl_null(l_psos062) THEN LET l_psos062 = 0 END IF

         IF l_sfka012 - l_sfaa012 > 0 THEN 
            LET l_psos062 = l_psos062 - (l_sfaa012 - l_sfka012)
           
            SELECT psos024,psos045 INTO l_psos024,l_psos045
                 FROM psos_t
                WHERE psosent = g_enterprise
                  AND psossite= g_site
                  AND psos004 = l_sfka006
                  AND psos002 = l_sfka074
                  
            IF l_psos045 - l_psos024 < l_psos062 THEN
               #已转数量已到最大值
               UPDATE psos_t SET psos062 = l_psos045 - l_psos024
                  WHERE psosent = g_enterprise
                    AND psossite= g_site
                    AND psos004 = l_sfka006
                    AND psos002 = l_sfka074                 
            ELSE        
               UPDATE psos_t SET psos062 = l_psos062
                  WHERE psosent = g_enterprise
                    AND psossite= g_site
                    AND psos004 = l_sfka006
                    AND psos002 = l_sfka074                 
            END IF
         ELSE
            SELECT SUM(sfaa012) INTO l_sfaa012_sum FROM sfaa_t
               WHERE sfaaent = g_enterprise  AND sfaasite = g_site 
                  AND sfaa006 = l_sfka006  AND sfaa074 = l_sfka074
                  AND sfaadocno <> p_sfkadocno 
            
            IF cl_null(l_sfaa012_sum) THEN
               LET l_sfaa012_sum = 0 
            END IF
            IF (l_sfaa012_sum+l_sfka012) >= l_psos062 THEN
               LET l_psos062 = l_psos062
            ELSE
               LET l_psos062 = l_sfaa012_sum+l_sfka012
            END IF
            
            UPDATE psos_t SET psos062 = l_psos062
                  WHERE psosent = g_enterprise
                    AND psossite= g_site
                    AND psos004 = l_sfka006
                    AND psos002 = l_sfka074
            
         END IF
      END IF
            
   END IF
   
   
   
   #171110-00021#12 add-->e



   #将工单变更历程档中本次有发生变更的字段更新至工单对应table 
   #若sfkaacti為勾選，且生管結案日為空，將工單生管結案日更新為當前日期
   LET l_sfka901 = ''
   LET l_sfkaacti = ''
   LET l_sfka012 = 0
   SELECT sfka901,sfkaacti,NVL(sfka012,0)
     INTO l_sfka901,l_sfkaacti,l_sfka012
     FROM sfka_t
   #WHERE sfkaent = g_enterprise AND sfkasite = g_site  #171019-00015#31 mark
    WHERE sfkaent = g_enterprise                        #171019-00015#31 add
      AND sfkadocno = p_sfkadocno AND sfka900 = p_sfka900
   #add--160722-00010#1 By shiun--(S)
   LET l_sfaa012 = 0
   #SELECT NVL(sfaa012,0) INTO l_sfaa012 #170618-00452#1 mark
   SELECT NVL(sfaa012,0),sfaa004 INTO l_sfaa012,l_sfaa004 #170618-00452#1 add
     FROM sfaa_t
    WHERE sfaaent = g_enterprise
      AND sfaadocno = p_sfkadocno
   #add--160722-00010#1 By shiun--(E)
   IF l_sfka901 = 'Y' THEN
      IF NOT s_asft800_confirm_upd_collect(p_sfkadocno,p_sfka900,0,0,'sfaa%') THEN
         RETURN r_success
      END IF
   END IF
   #170929-00029#1 --s add
   LET l_cnt_sfba009 = 0
   #l_cnt_sfba009=0表示整張單都是倒扣料
   SELECT COUNT(sfba009) INTO l_cnt_sfba009  
     FROM sfba_t
    WHERE sfbaent = g_enterprise
      AND sfbadocno = p_sfkadocno
      AND sfba009 = 'N'
   #170929-00029#1 --e add
   #160727-00025#2---s
   SELECT sfki901 INTO l_sfki901 FROM sfki_t
   #WHERE sfkient = g_enterprise AND sfkisite = g_site  #171019-00015#31 mark
    WHERE sfkient = g_enterprise                        #171019-00015#31 add
      AND sfkidocno = p_sfkadocno AND sfki900 = p_sfka900
   IF l_sfki901 = 'Y' THEN
      IF NOT s_asft800_confirm_upd_collect(p_sfkadocno,p_sfka900,0,0,'sfai%') THEN
         RETURN r_success
      END IF
   END IF
   #160727-00025#2---e
   
   #160511-00021 by whitney add start
   #变更单审核时应同步变更制程档生产数量（sfca003）及每一站的标准产出量（sfcb027）
   #mark--160722-00010#1 By shiun--(S)   因s_asft800_confirm_upd_collect會影響其取值，所以移至上方
#   LET l_sfaa012 = 0
#   SELECT NVL(sfaa012,0) INTO l_sfaa012
#     FROM sfaa_t
#    WHERE sfaaent = g_enterprise
#      AND sfaadocno = p_sfkadocno
   #mark--160722-00010#1 By shiun--(E)
   IF l_sfaa012 <> l_sfka012 THEN
      UPDATE sfca_t SET sfca003 = l_sfka012
       WHERE sfcaent = g_enterprise
         AND sfcadocno = p_sfkadocno
         AND sfca001 = 0   #161109-00039#1 add
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "UPDATE sfca_t",SQLERRMESSAGE 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF
      
      UPDATE sfcb_t SET sfcb027 = (l_sfka012*sfcb021/sfcb022)
       WHERE sfcbent = g_enterprise
         AND sfcbdocno = p_sfkadocno
         AND sfcb001 = 0   #161109-00039#1 add
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "UPDATE sfcb_t",SQLERRMESSAGE 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF
      
      #170510-00061#1 add(s)
      #数量回写工艺首站,待movie in,待check in,在制量,良品转入量
      DECLARE sel_sfcb_curs1 CURSOR FOR 
      SELECT sfcbdocno,sfcb001,sfcb002,sfcb003,sfcb004,sfcb014,
             sfcb015,sfcb016,sfcb017,sfcb018,sfcb019 
        FROM sfcb_t
       WHERE sfcbent = g_enterprise
         AND sfcbdocno = p_sfkadocno    
         AND sfcb001 = 0  #180323-00018#1
         #170618-00452#1 --s mark         
         #AND sfcb001 = 0
         #AND (sfcb007 = 'INIT' OR sfcb007 = ' ' OR sfcb007 IS NULL)
         #170618-00452#1 --e mark
      LET l_row = 1
      FOREACH sel_sfcb_curs1 INTO l_sfcb[l_row].sfcbdocno,l_sfcb[l_row].sfcb001,l_sfcb[l_row].sfcb002,l_sfcb[l_row].sfcb003,l_sfcb[l_row].sfcb004,l_sfcb[l_row].sfcb014,
                                  l_sfcb[l_row].sfcb015,l_sfcb[l_row].sfcb016,l_sfcb[l_row].sfcb017,l_sfcb[l_row].sfcb018,l_sfcb[l_row].sfcb019
         LET l_row = l_row + 1
      END FOREACH
      LET l_row = l_row - 1
      LET l_diff_num = l_sfka012 - l_sfaa012 
      FOR l_i = 1 TO l_row
         IF l_sfcb[l_i].sfcb014='Y' OR l_sfcb[l_i].sfcb015='Y' OR l_sfcb[l_i].sfcb016='Y'
         OR l_sfcb[l_i].sfcb018='Y' OR l_sfcb[l_i].sfcb019='Y' THEN
            #检查当站的前站是否有报工站(不同报工线路找到的第一站，可能是另一条报工线路的第n站)
            CALL s_asft310_has_pre_station(l_sfcb[l_i].sfcbdocno,l_sfcb[l_i].sfcb001,l_sfcb[l_i].sfcb002,l_sfcb[l_i].sfcb003,l_sfcb[l_i].sfcb004)
               RETURNING l_success
            IF l_success THEN  #有报工站不算首站
               CONTINUE FOR
            END IF
         #170618-00452#1 --s add
         ELSE
            CONTINUE FOR
         #170618-00452#1 --e add
         END IF
        #IF l_sfaa004 = '2' THEN #170618-00452#1 add 到扣料才更新轉出入                          #170929-00029#1 mark
         IF l_sfaa004 = '2' OR l_cnt_sfba009 = 0 THEN  #倒扣料：單頭發料制度=2 OR 整張單身都到扣料 #170929-00029#1 add
            CASE WHEN  l_sfcb[l_i].sfcb014='Y' 
                    #更新待move in数,良品转入
                    UPDATE sfcb_t SET sfcb046 = sfcb046 + (l_diff_num*sfcb053/sfcb054),
                                      sfcb028 = sfcb028 + (l_diff_num*sfcb053/sfcb054)
                                WHERE sfcbent = g_enterprise
                                  AND sfcbdocno = p_sfkadocno    
                                  AND sfcb001 = l_sfcb[l_i].sfcb001
                                  AND sfcb002 = l_sfcb[l_i].sfcb002
            
                    IF SQLCA.sqlcode THEN
                       INITIALIZE g_errparam TO NULL 
                       LET g_errparam.extend = "UPDATE sfcb_t",SQLERRMESSAGE 
                       LET g_errparam.code   = SQLCA.sqlcode 
                       LET g_errparam.popup  = TRUE 
                       CALL cl_err()
                       LET r_success = FALSE
                       RETURN r_success
                    END IF
                 WHEN  l_sfcb[l_i].sfcb015='Y'
                     #更新待checkin,良品转入
                     UPDATE sfcb_t SET sfcb047 = sfcb047 + (l_diff_num*sfcb053/sfcb054),
                                       sfcb028 = sfcb028 + (l_diff_num*sfcb053/sfcb054)
                                 WHERE sfcbent = g_enterprise
                                   AND sfcbdocno = p_sfkadocno    
                                   AND sfcb001 = l_sfcb[l_i].sfcb001
                                   AND sfcb002 = l_sfcb[l_i].sfcb002
                     IF SQLCA.sqlcode THEN
                        INITIALIZE g_errparam TO NULL 
                        LET g_errparam.extend = "UPDATE sfcb_t",SQLERRMESSAGE 
                        LET g_errparam.code   = SQLCA.sqlcode 
                        LET g_errparam.popup  = TRUE 
                        CALL cl_err()
                        LET r_success = FALSE
                        RETURN r_success
                     END IF
                 WHEN  l_sfcb[l_i].sfcb016='Y'
                     #更新在制量,良品转入
                     UPDATE sfcb_t SET sfcb050 = sfcb050 + (l_diff_num*sfcb021/sfcb022),
                                       sfcb028 = sfcb028 + (l_diff_num*sfcb021/sfcb022)
                                 WHERE sfcbent = g_enterprise
                                   AND sfcbdocno = p_sfkadocno    
                                   AND sfcb001 = l_sfcb[l_i].sfcb001
                                   AND sfcb002 = l_sfcb[l_i].sfcb002
                     IF SQLCA.sqlcode THEN
                        INITIALIZE g_errparam TO NULL 
                        LET g_errparam.extend = "UPDATE sfcb_t",SQLERRMESSAGE 
                        LET g_errparam.code   = SQLCA.sqlcode 
                        LET g_errparam.popup  = TRUE 
                        CALL cl_err()
                        LET r_success = FALSE
                        RETURN r_success
                     END IF
                 WHEN  l_sfcb[l_i].sfcb018='Y'
                    #更新待check out
                     UPDATE sfcb_t SET sfcb048 = sfcb048 + (l_diff_num*sfcb021/sfcb022),
                                       sfcb028 = sfcb028 + (l_diff_num*sfcb021/sfcb022)
                                 WHERE sfcbent = g_enterprise
                                   AND sfcbdocno = p_sfkadocno    
                                   AND sfcb001 = l_sfcb[l_i].sfcb001
                                   AND sfcb002 = l_sfcb[l_i].sfcb002
                     IF SQLCA.sqlcode THEN
                        INITIALIZE g_errparam TO NULL 
                        LET g_errparam.extend = "UPDATE sfcb_t",SQLERRMESSAGE 
                        LET g_errparam.code   = SQLCA.sqlcode 
                        LET g_errparam.popup  = TRUE 
                        CALL cl_err()
                        LET r_success = FALSE
                        RETURN r_success
                     END IF
                 WHEN  l_sfcb[l_i].sfcb019='Y'
                    #更新待move out
                     UPDATE sfcb_t SET sfcb049 = sfcb049 + (l_diff_num*sfcb021/sfcb022),
                                       sfcb028 = sfcb028 + (l_diff_num*sfcb021/sfcb022)
                                 WHERE sfcbent = g_enterprise
                                   AND sfcbdocno = p_sfkadocno    
                                   AND sfcb001 = l_sfcb[l_i].sfcb001
                                   AND sfcb002 = l_sfcb[l_i].sfcb002
                     IF SQLCA.sqlcode THEN
                        INITIALIZE g_errparam TO NULL 
                        LET g_errparam.extend = "UPDATE sfcb_t",SQLERRMESSAGE 
                        LET g_errparam.code   = SQLCA.sqlcode 
                        LET g_errparam.popup  = TRUE 
                        CALL cl_err()
                        LET r_success = FALSE
                        RETURN r_success
                     END IF
                 WHEN  l_sfcb[l_i].sfcb017='Y'
                    #更新待PQC
                     UPDATE sfcb_t SET sfcb050 = sfcb050 + (l_diff_num*sfcb021/sfcb022),
                                       sfcb051 = sfcb051 + (l_diff_num*sfcb021/sfcb022)
                                 WHERE sfcbent = g_enterprise
                                   AND sfcbdocno = p_sfkadocno    
                                   AND sfcb001 = l_sfcb[l_i].sfcb001
                                   AND sfcb002 = l_sfcb[l_i].sfcb002
                     IF SQLCA.sqlcode THEN
                        INITIALIZE g_errparam TO NULL 
                        LET g_errparam.extend = "UPDATE sfcb_t",SQLERRMESSAGE 
                        LET g_errparam.code   = SQLCA.sqlcode 
                        LET g_errparam.popup  = TRUE 
                        CALL cl_err()
                        LET r_success = FALSE
                        RETURN r_success
                     END IF
                  OTHERWISE 
                     #无报工站点,更新良品转入,良品转出
                     UPDATE sfcb_t SET sfcb028 = sfcb028 + (l_diff_num*sfcb021/sfcb022),
                                       sfcb033 = sfcb033 + (l_diff_num*sfcb021/sfcb022)
                                 WHERE sfcbent = g_enterprise
                                   AND sfcbdocno = p_sfkadocno    
                                   AND sfcb001 = l_sfcb[l_i].sfcb001
                                   AND sfcb002 = l_sfcb[l_i].sfcb002
                     IF SQLCA.sqlcode THEN
                        INITIALIZE g_errparam TO NULL 
                        LET g_errparam.extend = "UPDATE sfcb_t",SQLERRMESSAGE 
                        LET g_errparam.code   = SQLCA.sqlcode 
                        LET g_errparam.popup  = TRUE 
                        CALL cl_err()
                        LET r_success = FALSE
                        RETURN r_success
                     END IF
             END CASE
          END IF#170618-00452#1 add
       END FOR
      #170510-00061#1 add(e)
   END IF
   #160511-00021 by whitney add end
  
  #180503-00021#1 mark --(S)--
  #調整到變更單執行完成後,且將變更資料拋轉到MES後再執行工單結案作業  
  #IF l_sfkaacti = 'Y' THEN
  #   LET l_sfaa047 = cl_get_today()
  #   UPDATE sfaa_t SET sfaastus='C',sfaa047 = l_sfaa047
  #    ,sfaa065 = '2'  #160104-00008#1
  #   #WHERE sfaaent = g_enterprise AND sfaasite = g_site  #171019-00015#31 mark
  #    WHERE sfaaent = g_enterprise                        #171019-00015#31 add
  #      AND sfaadocno = p_sfkadocno
  #   IF SQLCA.sqlcode THEN
  #      LET r_success = FALSE
  #      INITIALIZE g_errparam TO NULL
  #      LET g_errparam.code = 'sub-00034'
  #      LET g_errparam.extend = p_sfkadocno
  #      LET g_errparam.popup = TRUE
  #      CALL cl_err()
  #      RETURN r_success
  #   END IF
  #   #170307-00076#1 add----------s--------
  #   IF NOT s_asft800_close_po(p_sfkadocno) THEN
  #      LET r_success = FALSE
  #      INITIALIZE g_errparam TO NULL
  #      LET g_errparam.code = 'asf-00690'
  #      LET g_errparam.extend = p_sfkadocno
  #      LET g_errparam.popup = TRUE
  #      CALL cl_err()
  #      RETURN r_success
  #   END IF
  #   #170307-00076#1 add----------e--------
  #END IF
  #180503-00021#1 mark --(E)-- 
   
   DECLARE s_asft800_confirm_upd_cs1 CURSOR FOR 
      #SELECT * FROM sfkb_t WHERE sfkbent = g_enterprise AND sfkbsite = g_site   #161109-00085#59 mark
      #161109-00085#59-s add
      SELECT sfkbseq
        FROM sfkb_t
      #WHERE sfkbent = g_enterprise AND sfkbsite = g_site  #171019-00015#31 mark
       WHERE sfkbent = g_enterprise                        #171019-00015#31 add
      #161109-00085#59-e add    
         AND sfkbdocno=p_sfkadocno AND sfkb900=p_sfka900
         AND (sfkb901='2' OR sfkb901='3')
   #FOREACH s_asft800_confirm_upd_cs1 INTO l_sfkb.*   #161109-00085#59 mark
   FOREACH s_asft800_confirm_upd_cs1 INTO l_sfkbseq   #161109-00085#59 add
      #IF NOT s_asft800_confirm_upd_collect(p_sfkadocno,p_sfka900,l_sfkb.sfkbseq,0,'sfab%') THEN   #161109-00085#59 mark
      IF NOT s_asft800_confirm_upd_collect(p_sfkadocno,p_sfka900,l_sfkbseq,0,'sfab%') THEN         #161109-00085#59 add
         RETURN r_success
      END IF
   END FOREACH
   
   DECLARE s_asft800_confirm_upd_cs2 CURSOR FOR  
      #SELECT * FROM sfkc_t WHERE sfkcent = g_enterprise AND sfkcsite = g_site   #161109-00085#59 mark
      #161109-00085#59-s add
      SELECT sfkcseq
        FROM sfkc_t 
      #WHERE sfkcent = g_enterprise AND sfkcsite = g_site  #171019-00015#31 mark
       WHERE sfkcent = g_enterprise                        #171019-00015#31 add
      #161109-00085#59-e add
         AND sfkcdocno=p_sfkadocno AND sfkc900=p_sfka900
         AND (sfkc901='2' OR sfkc901='3')
   #FOREACH s_asft800_confirm_upd_cs2 INTO l_sfkc.*   #161109-00085#59 mark
   FOREACH s_asft800_confirm_upd_cs2 INTO l_sfkcseq   #161109-00085#59 add
      #IF NOT s_asft800_confirm_upd_collect(p_sfkadocno,p_sfka900,l_sfkc.sfkcseq,0,'sfac%') THEN   #161109-00085#59 mark
      IF NOT s_asft800_confirm_upd_collect(p_sfkadocno,p_sfka900,l_sfkcseq,0,'sfac%') THEN   #161109-00085#59 add
         RETURN r_success
      END IF
   END FOREACH
   
   DECLARE s_asft800_confirm_upd_cs4 CURSOR FOR 
      #SELECT * FROM sfkf_t WHERE sfkfent=g_enterprise AND sfkfsite=g_site   #161109-00085#59 mark
      #161109-00085#59-s add
      SELECT sfkfseq
        FROM sfkf_t 
      #WHERE sfkfent=g_enterprise AND sfkfsite=g_site  #171019-00015#31 mark
       WHERE sfkfent=g_enterprise                      #171019-00015#31 add
      #161109-00085#59-e add
         AND sfkfdocno=p_sfkadocno AND sfkf900=p_sfka900
         AND (sfkf901='2' OR sfkf901='3')
   #FOREACH s_asft800_confirm_upd_cs4 INTO l_sfkf.*   #161109-00085#59 mark
   FOREACH s_asft800_confirm_upd_cs4 INTO l_sfkfseq   #161109-00085#59 add
      #IF NOT s_asft800_confirm_upd_collect(p_sfkadocno,p_sfka900,l_sfkf.sfkfseq,0,'sfaf%') THEN   #161109-00085#59 mark
      IF NOT s_asft800_confirm_upd_collect(p_sfkadocno,p_sfka900,l_sfkfseq,0,'sfaf%') THEN         #161109-00085#59 add
         RETURN r_success
      END IF
   END FOREACH
   
   DECLARE s_asft800_confirm_upd_cs5 CURSOR FOR 
      #SELECT * FROM sfkg_t WHERE sfkgent=g_enterprise AND sfkgsite=g_site   #161109-00085#59 mark
      #161109-00085#59-s add
      SELECT sfkgseq,sfkgseq1
        FROM sfkg_t 
      #WHERE sfkgent=g_enterprise AND sfkgsite=g_site  #171019-00015#31 mark
       WHERE sfkgent=g_enterprise                      #171019-00015#31 add
      #161109-00085#59-e add
         AND sfkgdocno=p_sfkadocno AND sfkg900=p_sfka900
         AND (sfkg901='2' OR sfkg901='3')
   #FOREACH s_asft800_confirm_upd_cs5 INTO l_sfkg.*   #161109-00085#59 mark
   #161109-00085#59-s add
   FOREACH s_asft800_confirm_upd_cs5
      INTO l_sfkg.sfkgseq,l_sfkg.sfkgseq1
   #161109-00085#59-e add
      IF NOT s_asft800_confirm_upd_collect(p_sfkadocno,p_sfka900,l_sfkg.sfkgseq,l_sfkg.sfkgseq1,'sfba%') THEN
         RETURN r_success
      END IF
   END FOREACH
   
    #170310-00058#1-s   
#   #工单备注变更
#   SELECT sfkhdocno,sfkh004,sfkh005 INTO l_sfkhdocno,l_sfkh004,l_sfkh005 FROM sfkh_t
#    WHERE sfkhent = g_enterprise AND sfkhsite = g_site
#      AND sfkhdocno = p_sfkadocno AND sfkh001 = p_sfka900
#      AND sfkh002 = 'ooff013'
#   IF NOT cl_null(l_sfkhdocno) THEN
#      IF NOT cl_null(l_sfkh004) THEN
#          IF NOT s_aooi360_del('6',g_site,p_sfkadocno,' ',' ',' ',' ',' ',' ',' ',' ','2') THEN
#            RETURN r_success
#         END IF
#      END IF
#      IF NOT cl_null(l_sfkh005) THEN
#         IF NOT s_aooi360_gen('6',g_site,p_sfkadocno,' ',' ',' ',' ',' ',' ',' ',' ','2',l_sfkh005) THEN
#            RETURN r_success
#         END IF
#      END IF
#   END IF
    #170310-00058#1-e
   
   CALL s_asft340_full_sets(p_sfkadocno,'','','') RETURNING l_success,l_sfaa071  #160425-00019 by whitney add
   
   #171020-00007#1 add(S)
   IF NOT s_barcode_bcaa_modify(g_prog,g_site,p_sfkadocno,p_sfka900,'') THEN
      RETURN r_success
   END IF
   #171020-00007#1 add(E)
   
   LET l_sfkacnfdt = cl_get_current()
   UPDATE sfaa_t
      SET sfaa001 = p_sfka900,  #变更序值回写工单版本
          sfaa071 = l_sfaa071,  #160425-00019 by whitney add 齊料套數  
          sfaamodid = g_user,
          sfaamoddt = l_sfkacnfdt,
          sfaacnfid = g_user,
          sfaacnfdt = l_sfkacnfdt
    WHERE sfaaent = g_enterprise
     #AND sfaasite = g_site  #171019-00015#31 mark
      AND sfaadocno = p_sfkadocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00034'
      LET g_errparam.extend = p_sfkadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF   
   
   CALL s_asft800_memo_back(p_sfkadocno,p_sfka900)   #170310-00058#1 add
   CALL s_asft800_memo_back2(p_sfkadocno,p_sfka900)   #170310-00058#1 add
   
   UPDATE sfka_t SET sfkastus = 'Y',
                     sfkacnfid = g_user,
                     sfkacnfdt = l_sfkacnfdt
   #WHERE sfkaent = g_enterprise AND sfkasite = g_site  #171019-00015#31 mark
    WHERE sfkaent = g_enterprise                        #171019-00015#31 add
      AND sfkadocno = p_sfkadocno AND sfka900 = p_sfka900
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00034'
      LET g_errparam.extend = p_sfkadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   
   #151207-00001#4-S
   CALL s_aooi200_get_slip(p_sfkadocno) RETURNING l_success,l_doc_type  
   #161116-00008#2-S
   #IF cl_get_para(g_enterprise,g_site,'S-SYS-0003') = 'Y' AND cl_get_doc_para(g_enterprise,g_site,l_doc_type,'D-MFG-0079') = 'Y' THEN  
   IF cl_get_para(g_enterprise,g_site,'S-SYS-0003') = 'Y' THEN  
      IF cl_aws_prod_para(g_enterprise,"mes-0001") = 'Y' THEN
         IF cl_get_doc_para(g_enterprise,g_site,l_doc_type,'D-MFG-0079') = 'Y' THEN  #170807-00020#8 add
            IF s_aws_mes2_wo_update(p_sfkadocno) THEN
               CALL cl_ask_end1()
            ELSE       
               CALL cl_err()
               RETURN r_success
            END IF
         END IF  #170807-00020#8 add
      ELSE
         IF cl_get_doc_para(g_enterprise,g_site,l_doc_type,'D-MFG-0079') = 'Y' THEN  
   #161116-00008#2-E  
            IF NOT (s_aws_mes_ins('asft800','update', p_sfkadocno ) = 1) THEN           
               CALL cl_err()
               RETURN r_success
            ELSE
               CALL cl_ask_end1()   
            END IF 
   #161116-00008#2-S
         END IF   
      END IF 
   #161116-00008#2-E
   END IF
   #151207-00001#4-E
                  
   LET r_success = TRUE
   RETURN r_success
   
END FUNCTION

################################################################################
# Descriptions...: 收集需要变更的栏位及值
# Memo...........:
# Usage..........: CALL s_asft800_confirm_upd_collect(p_sfkhdocno,p_sfkh001,p_sfkhseq,p_sfkhseq1,p_sfkh002)
#                  RETURNING r_success
# Input parameter: 1.p_sfkhdocno          LIKE sfkh_t.sfkhdocno
#                : 2.p_sfkh001            LIKE sfkh_t.sfkh001
#                : 3.p_sfkhseq            LIKE sfkh_t.sfkhseq
#                : 4.p_sfkhseq1           LIKE sfkh_t.sfkhseq1
#                : 5.p_sfkh002            LIKE sfkh_t.sfkh002
# Return code....: 1.r_success            LIKE type_t.num5
# Date & Author..: 14/7/23 By wuxja
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft800_confirm_upd_collect(p_sfkhdocno,p_sfkh001,p_sfkhseq,p_sfkhseq1,p_sfkh002)
DEFINE p_sfkhdocno          LIKE sfkh_t.sfkhdocno
DEFINE p_sfkh001            LIKE sfkh_t.sfkh001
DEFINE p_sfkhseq            LIKE sfkh_t.sfkhseq
DEFINE p_sfkhseq1           LIKE sfkh_t.sfkhseq1
DEFINE p_sfkh002            LIKE sfkh_t.sfkh002
DEFINE r_success            LIKE type_t.num5
#DEFINE l_sfkh               RECORD LIKE sfkh_t.*   #161109-00085#59 mark
#161109-00085#59-s add
DEFINE l_sfkh               RECORD  #工單變更歷程檔
       sfkhdocno LIKE sfkh_t.sfkhdocno, #工單單號
       sfkhseq LIKE sfkh_t.sfkhseq, #項次
       sfkhseq1 LIKE sfkh_t.sfkhseq1, #項序
       sfkh002 LIKE sfkh_t.sfkh002, #變更欄位
       sfkh005 LIKE sfkh_t.sfkh005  #變更後內容
                 END RECORD
#161109-00085#59-e add
DEFINE l_sql                STRING
DEFINE l_str1               STRING
DEFINE l_str2               STRING
DEFINE l_str3               STRING
DEFINE l_sfkacnfdt          DATETIME YEAR TO SECOND
DEFINE l_n                  LIKE type_t.num5
#161111-00032#1 add------s----------
DEFINE l_sfaa061            LIKE sfaa_t.sfaa061    #是否是制程工单
DEFINE l_sfcb044            LIKE sfcb_t.sfcb044    #变更后的开工日期
DEFINE l_sfcb045            LIKE sfcb_t.sfcb045    #变更后的完工日期
#161111-00032#1 add--------e---------
DEFINE l_table_id           LIKE dzeal_t.dzeal001  #150925-00052#1 add
DEFINE l_table_name         LIKE type_t.chr80      #150925-00052#1 add
#161226-00033#1-s-add
DEFINE l_sfaa012            LIKE sfaa_t.sfaa012
DEFINE l_sfcb002            LIKE sfcb_t.sfcb002
DEFINE l_sfcb021            LIKE sfcb_t.sfcb021
DEFINE l_sfcb022            LIKE sfcb_t.sfcb022
DEFINE l_sfcb027            LIKE sfcb_t.sfcb027
DEFINE l_sql_2              STRING
DEFINE l_success_2          LIKE type_t.num5
DEFINE l_count              LIKE type_t.num5
#161226-00033#1-e-add

   WHENEVER ERROR CONTINUE
   LET r_success = FALSE
   
   #170816-00007#85 mark --s
   #IF cl_null(p_sfkhseq) OR cl_null(p_sfkhseq1) OR cl_null(p_sfkh002) THEN
   #   #传入参数为空或传入值不正确!请联系MIS人员检查!
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.code = 'sub-00280'
   #   LET g_errparam.extend = ''
   #   LET g_errparam.popup = TRUE
   #   CALL cl_err()
   #   RETURN r_success
   #END IF
   #170816-00007#85 mark --e
   #170816-00007#85 add --s
   LET g_msg = ''
   IF cl_null(p_sfkhseq) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("asfp310","lbl_seq_2") RETURNING g_colname_1,g_comment_1   #項次
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_sfkhseq1) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("asfp320","lbl_l_inaoseq1") RETURNING g_colname_1,g_comment_1   #項序
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_sfkh002) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("asf-00902",g_dlang)   #變更欄位
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF NOT cl_null(g_msg) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00788'  #%1傳入值為空(錯誤)
      LET g_errparam.popup = TRUE
      LET g_errparam.replace[1] = g_msg 
      CALL cl_err()
      RETURN r_success
   END IF
   #170816-00007#85 add --e
   #LET l_sql = "SELECT * FROM sfkh_t WHERE sfkhent=",g_enterprise," AND sfkhsite='",g_site,"'",   #161109-00085#59 mark
   #161109-00085#59-s add
   LET l_sql = "SELECT sfkhdocno,sfkhseq,sfkhseq1,sfkh002,sfkh005",
               "  FROM sfkh_t",
              #" WHERE sfkhent=",g_enterprise," AND sfkhsite='",g_site,"'",  #171019-00015#31 mark
               " WHERE sfkhent=",g_enterprise,                               #171019-00015#31 add
   #161109-00085#59-e add
               "   AND sfkhdocno='",p_sfkhdocno,"' AND sfkh001=",p_sfkh001,
               "   AND sfkhseq=",p_sfkhseq," AND sfkhseq1=",p_sfkhseq1," AND sfkh002 LIKE '",p_sfkh002,"'"
   PREPARE s_asft800_confirm_upd_pre FROM l_sql
   DECLARE s_asft800_confirm_upd_cs CURSOR FOR s_asft800_confirm_upd_pre
   
   LET l_str1 = ''
   LET l_str2 = ''
   LET l_str3 = ''
   #FOREACH s_asft800_confirm_upd_cs INTO l_sfkh.*   #161109-00085#59 mark
   #161109-00085#59-s add
   FOREACH s_asft800_confirm_upd_cs
      INTO l_sfkh.sfkhdocno,l_sfkh.sfkhseq,l_sfkh.sfkhseq1,l_sfkh.sfkh002,l_sfkh.sfkh005
   #161109-00085#59-e add
      IF cl_null(l_str1) THEN
         LET l_str1 = l_sfkh.sfkh002,"='",l_sfkh.sfkh005,"'"
         LET l_str2 = l_sfkh.sfkh002
         LET l_str3 = "'",l_sfkh.sfkh005,"'"
      ELSE
         LET l_str1 = l_str1,",",l_sfkh.sfkh002,"='",l_sfkh.sfkh005,"'"
         LET l_str2 = l_str2,",",l_sfkh.sfkh002
         LET l_str3 = l_str3,",'",l_sfkh.sfkh005,"'"
      END IF
   END FOREACH
   
   #160905-00022#2-s
   IF cl_null(l_str1) OR cl_null(l_str2) OR cl_null(l_str3) THEN
      RETURN TRUE
   END IF
   #160905-00022#2-e
   
#150925-00052#1-s add
   #抓取本次要異動的表格名稱
   LET l_table_name = ''
   LET l_table_id = p_sfkh002[1,4],"_t"
   LET l_table_name = cl_get_table_name(l_table_id,g_lang)
   IF NOT cl_null(l_table_name) THEN
      LET l_table_name = l_table_id CLIPPED,"(",l_table_name CLIPPED,")"
   END IF
#150925-00052#1-e add

   IF p_sfkh002[1,4] = 'sfaa' THEN
      LET l_sfkacnfdt = cl_get_current()
      LET l_sql = "UPDATE sfaa_t SET ",l_str1,
                 #" WHERE sfaaent=",g_enterprise," AND sfaasite='",g_site,"' AND sfaadocno='",l_sfkh.sfkhdocno,"'"  #171019-00015#31 mark
                  " WHERE sfaaent=",g_enterprise," AND sfaadocno='",l_sfkh.sfkhdocno,"'"                            #171019-00015#31 add
      #161111-00032#1 add-----s-----------
      #判断工单是否走制程
     #SELECT sfaa061 INTO l_sfaa061 FROM sfaa_t WHERE sfaaent=g_enterprise AND sfaasite=g_site AND sfaadocno=l_sfkh.sfkhdocno  #171019-00015#31 mark
      SELECT sfaa061 INTO l_sfaa061 FROM sfaa_t WHERE sfaaent=g_enterprise AND sfaadocno=l_sfkh.sfkhdocno                      #171019-00015#31 add
      IF l_sfaa061='N' OR cl_null(l_sfaa061) THEN
         #判断变更内容中是否存在开工、完工日期，有则更新sfcb_t   
         IF l_sql.getindexof('sfaa019',1)>0 THEN   
            
            #获取变更后的开工、完工日期
           #SELECT sfkh005 INTO l_sfcb044 FROM sfkh_t WHERE sfkhent=g_enterprise AND sfkhsite=g_site AND sfkhdocno=p_sfkhdocno  #171019-00015#31 mark
            SELECT sfkh005 INTO l_sfcb044 FROM sfkh_t WHERE sfkhent=g_enterprise AND sfkhdocno=p_sfkhdocno                      #171019-00015#31 add
            AND sfkh001=p_sfkh001   AND sfkhseq=p_sfkhseq AND sfkhseq1=p_sfkhseq1 AND sfkh002 LIKE 'sfaa019'
            #171115-00011#1 mark------s-----
            #SELECT sfkh005 INTO l_sfcb045 FROM sfkh_t WHERE sfkhent=g_enterprise AND sfkhsite=g_site AND sfkhdocno=p_sfkhdocno
            #AND sfkh001=p_sfkh001   AND sfkhseq=p_sfkhseq AND sfkhseq1=p_sfkhseq1 AND sfkh002 LIKE 'sfaa020'            
            #UPDATE sfcb_t SET sfcb044=l_sfcb044,sfcb045=l_sfcb045 WHERE sfcbent=g_enterprise AND sfcbsite=g_site AND sfcbdocno=l_sfkh.sfkhdocno  
            #171115-00011#1 mark------e-----
            #171115-00011#1 add------s-----
            IF NOT cl_null(l_sfcb044) THEN
              #UPDATE sfcb_t SET sfcb044=l_sfcb044 WHERE sfcbent=g_enterprise AND sfcbsite=g_site AND sfcbdocno=l_sfkh.sfkhdocno  #171019-00015#31 mark
              #UPDATE sfcb_t SET sfcb044=l_sfcb044 WHERE sfcbent=g_enterprise AND sfcbdocno=l_sfkh.sfkhdocno                      #171019-00015#31 add  #180323-00018#1 mark
               UPDATE sfcb_t SET sfcb044=l_sfcb044 WHERE sfcbent=g_enterprise AND sfcbdocno=l_sfkh.sfkhdocno AND sfcb001=0        #180323-00018#1
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'sub-00034'
                  LET g_errparam.extend = l_table_name    
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  RETURN r_success
               END IF                  
            END IF
         END IF
         IF l_sql.getindexof('sfaa020',1)>0 THEN 
           #SELECT sfkh005 INTO l_sfcb045 FROM sfkh_t WHERE sfkhent=g_enterprise AND sfkhsite=g_site AND sfkhdocno=p_sfkhdocno  #171019-00015#31 mark
            SELECT sfkh005 INTO l_sfcb045 FROM sfkh_t WHERE sfkhent=g_enterprise AND sfkhdocno=p_sfkhdocno                      #171019-00015#31 add
            AND sfkh001=p_sfkh001   AND sfkhseq=p_sfkhseq AND sfkhseq1=p_sfkhseq1 AND sfkh002 LIKE 'sfaa020'            
            IF NOT cl_null(l_sfcb045) THEN
              #UPDATE sfcb_t SET sfcb045=l_sfcb045 WHERE sfcbent=g_enterprise AND sfcbsite=g_site AND sfcbdocno=l_sfkh.sfkhdocno  #171019-00015#31 mark
              #UPDATE sfcb_t SET sfcb045=l_sfcb045 WHERE sfcbent=g_enterprise AND sfcbdocno=l_sfkh.sfkhdocno                      #171019-00015#31 add  #180323-00018#1 mark
               UPDATE sfcb_t SET sfcb045=l_sfcb045 WHERE sfcbent=g_enterprise AND sfcbdocno=l_sfkh.sfkhdocno AND sfcb001=0        #180323-00018#1
            END IF
         #171115-00011#1 add------e-----
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'sub-00034'
              #LET g_errparam.extend = '工艺资料变更'   #150925-00052#1 mark
               LET g_errparam.extend = l_table_name    #150925-00052#1 mod
               LET g_errparam.popup = TRUE
               CALL cl_err()
               RETURN r_success
            END IF                  
         END IF
         #161226-00033#1-s-add
      ELSE         
         #判斷變更內容中是否存在生產數量，有則更新已產生的製程資料
         IF l_sql.getindexof('sfaa012',1)>0 THEN   
            #取得變更後的生產數量
            SELECT sfkh005 INTO l_sfaa012 
              FROM sfkh_t 
             WHERE sfkhent=g_enterprise 
              #AND sfkhsite=g_site  #171019-00015#31 mark
               AND sfkhdocno=p_sfkhdocno
               AND sfkh001=p_sfkh001   
               AND sfkhseq=p_sfkhseq 
               AND sfkhseq1=p_sfkhseq1 
               AND sfkh002 LIKE 'sfaa012'
            #判斷是否產生製程資料
            LET l_count = 0
            SELECT COUNT (1) INTO l_count
              FROM sfca_t
             WHERE sfcaent = g_enterprise
               AND sfcadocno = l_sfkh.sfkhdocno
               AND sfca001 = 0
            
            IF l_count > 0 THEN
               LET l_success_2 = TRUE
               UPDATE sfca_t SET sfca003 = l_sfaa012
                WHERE sfcaent = g_enterprise
                  AND sfcadocno = l_sfkh.sfkhdocno
                  AND sfca001 = 0
               
               IF SQLCA.sqlcode THEN
                  LET l_success_2 = FALSE
               ELSE
                  LET l_sql_2 = " SELECT sfcb002,sfcb021,sfcb022,0 ",
                                "   FROM sfcb_t ",
                                "  WHERE sfcbent = ",g_enterprise,
                                "    AND sfcbdocno = '",l_sfkh.sfkhdocno,"' ",
                                "    AND sfcb001 = 0 "
                  
                  PREPARE asft800_sfcb_p FROM l_sql_2
                  DECLARE asft800_sfcb_c CURSOR FOR asft800_sfcb_p
                  
                  FOREACH asft800_sfcb_c INTO l_sfcb002,l_sfcb021,l_sfcb022,l_sfcb027
                     IF NOT cl_null(l_sfcb022) AND l_sfcb022 > 0 THEN
                        LET l_sfcb027 = l_sfaa012 * l_sfcb021 / l_sfcb022
                        UPDATE sfcb_t SET sfcb027 = l_sfcb027
                         WHERE sfcbent = g_enterprise
                           AND sfcbdocno = l_sfkh.sfkhdocno
                           AND sfcb001 = 0
                           AND sfcb002 = l_sfcb002
                        
                        IF SQLCA.sqlcode THEN
                           LET l_success_2 = FALSE
                           EXIT FOREACH
                        END IF
                     END IF
                  END FOREACH
               END IF
               IF NOT l_success_2 THEN
                  RETURN r_success
               END IF
            END IF
         END IF
         #161226-00033#1-e-add
      END IF
      #161111-00032#1 add-----s-----------
   END IF
   
   #160727-00025#2---s
   IF p_sfkh002[1,4] = 'sfai' THEN
      LET l_sfkacnfdt = cl_get_current()
      LET l_sql = "UPDATE sfai_t SET ",l_str1,
                 #" WHERE sfaient=",g_enterprise," AND sfaisite='",g_site,"' AND sfaidocno='",l_sfkh.sfkhdocno,"'"  #171019-00015#31 mark
                  " WHERE sfaient=",g_enterprise," AND sfaidocno='",l_sfkh.sfkhdocno,"'"                            #171019-00015#31 add
   END IF
   #160727-00025#2---e
   
   IF p_sfkh002[1,4] = 'sfab' THEN
      SELECT COUNT(1) INTO l_n FROM sfab_t
      #WHERE sfabent = g_enterprise AND sfabsite = g_site  #171019-00015#31 mark
       WHERE sfabent = g_enterprise                        #171019-00015#31 add
         AND sfabdocno = l_sfkh.sfkhdocno AND sfabseq = l_sfkh.sfkhseq
      IF l_n > 0 THEN
         LET l_sql = "UPDATE sfab_t SET ",l_str1,
                 #" WHERE sfabent=",g_enterprise," AND sfabsite='",g_site,"'",  #171019-00015#31 mark
                  " WHERE sfabent=",g_enterprise,                               #171019-00015#31 add
                  "   AND sfabdocno='",l_sfkh.sfkhdocno,"' AND sfabseq=",l_sfkh.sfkhseq
      END IF
      IF l_n = 0 THEN
         LET l_sql = "INSERT INTO sfab_t (sfabent,sfabsite,sfabdocno,",l_str2,") VALUES (",g_enterprise,",'",g_site,"','",l_sfkh.sfkhdocno,"',",l_str3,")"
      END IF
   END IF
   
   IF p_sfkh002[1,4] = 'sfac' THEN
      SELECT COUNT(1) INTO l_n FROM sfac_t
      #WHERE sfacent = g_enterprise AND sfacsite = g_site  #171019-00015#31 mark
       WHERE sfacent = g_enterprise                        #171019-00015#31 add
         AND sfacdocno = l_sfkh.sfkhdocno AND sfacseq = l_sfkh.sfkhseq
      IF l_n > 0 THEN
         LET l_sql = "UPDATE sfac_t SET ",l_str1,
                 #" WHERE sfacent=",g_enterprise," AND sfacsite='",g_site,"'",  #171019-00015#31 mark
                  " WHERE sfacent=",g_enterprise,                               #171019-00015#31 add
                  "   AND sfacdocno='",l_sfkh.sfkhdocno,"' AND sfacseq=",l_sfkh.sfkhseq
      END IF
      IF l_n = 0 THEN
         LET l_sql = "INSERT INTO sfac_t (sfacent,sfacsite,sfacdocno,",l_str2,") VALUES (",g_enterprise,",'",g_site,"','",l_sfkh.sfkhdocno,"',",l_str3,")"
      END IF
   END IF
   
   IF p_sfkh002[1,4] = 'sfaf' THEN
      SELECT COUNT(1) INTO l_n FROM sfaf_t
      #WHERE sfafent = g_enterprise AND sfafsite = g_site  #171019-00015#31 mark
       WHERE sfafent = g_enterprise                        #171019-00015#31 add
         AND sfafdocno = l_sfkh.sfkhdocno AND sfafseq = l_sfkh.sfkhseq
      IF l_n > 0 THEN
         LET l_sql = "UPDATE sfaf_t SET ",l_str1,
                 #" WHERE sfafent=",g_enterprise," AND sfafsite='",g_site,"'",  #171019-00015#31 mark
                  " WHERE sfafent=",g_enterprise,                               #171019-00015#31 add
                  "   AND sfafdocno='",l_sfkh.sfkhdocno,"' AND sfafseq=",l_sfkh.sfkhseq
      END IF
      IF l_n = 0 THEN
         LET l_sql = "INSERT INTO sfaf_t (sfafent,sfafsite,sfafdocno,",l_str2,") VALUES (",g_enterprise,",'",g_site,"','",l_sfkh.sfkhdocno,"',",l_str3,")"
      END IF
   END IF
   
   IF p_sfkh002[1,4] = 'sfba' THEN
      SELECT COUNT(1) INTO l_n FROM sfba_t
      #WHERE sfbaent = g_enterprise AND sfbasite = g_site  #171019-00015#31 mark
       WHERE sfbaent = g_enterprise                        #171019-00015#31 add
         AND sfbadocno = l_sfkh.sfkhdocno AND sfbaseq = l_sfkh.sfkhseq AND sfbaseq1 = l_sfkh.sfkhseq1
      IF l_n > 0 THEN
         LET l_sql = "UPDATE sfba_t SET ",l_str1,
                 #" WHERE sfbaent=",g_enterprise," AND sfbasite='",g_site,"'",  #171019-00015#31 mark
                  " WHERE sfbaent=",g_enterprise,                               #171019-00015#31 add
                  "   AND sfbadocno='",l_sfkh.sfkhdocno,"' AND sfbaseq=",l_sfkh.sfkhseq," AND sfbaseq1=",l_sfkh.sfkhseq1
      END IF     
      IF l_n = 0 THEN
         LET l_sql = "INSERT INTO sfba_t (sfbaent,sfbasite,sfbadocno,",l_str2,") VALUES (",g_enterprise,",'",g_site,"','",l_sfkh.sfkhdocno,"',",l_str3,")"
      END IF
   END IF
   
   PREPARE s_asft800_confirm_upd_collect_pre FROM l_sql
   EXECUTE s_asft800_confirm_upd_collect_pre
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00034'
     #LET g_errparam.extend = p_sfkh002[1,4]   #150925-00052#1 mark
      LET g_errparam.extend = l_table_name     #150925-00052#1 mod
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   
   LET r_success = TRUE
   RETURN r_success
   
END FUNCTION

PUBLIC FUNCTION s_asft800_ws_confirm(p_sfkadocno)
DEFINE p_sfkadocno     LIKE sfka_t.sfkadocno
DEFINE l_sfka900      LIKE sfka_t.sfka900
DEFINE r_success       LIKE type_t.num5

   LET l_sfka900 = ''
   #160308-00010#39-S
   #SELECT sfka900 INTO l_sfka900 FROM sfka_t
   #   WHERE sfkaent = g_enterprise AND sfkadocno = p_sfkadocno
   LET l_sfka900 = cl_bpm_get_key_value("sfka900")
   #160308-00010#39-E
   
   #確認前檢核段
   CALL s_asft800_confirm_chk(p_sfkadocno,l_sfka900) RETURNING r_success
   IF r_success THEN
      #確認交易處理段
      CALL s_asft800_confirm_upd(p_sfkadocno,l_sfka900) RETURNING r_success
   END IF
RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_asft800_get_replace(p_sfkadocno,p_sfka900,p_sfka012,p_sfkgseq,p_sfaa012)
# Input parameter: 1.p_sfkadocno
#                  2.p_sfka900
#                  3.p_sfka012
#                  4.p_sfkgseq
#                  5.p_sfaa012
# Return code....: 
# Date & Author..: 20150518 By wuxja
# Modify.........: #160905-00022#2
################################################################################
PUBLIC FUNCTION s_asft800_get_replace(p_sfkadocno,p_sfka900,p_sfka012,p_sfkgseq,p_sfaa012)
DEFINE p_sfkadocno  LIKE sfka_t.sfkadocno #工单
DEFINE p_sfka900    LIKE sfka_t.sfka900  #变更序
DEFINE p_sfka012    LIKE sfka_t.sfka012  #变更后的生产量
DEFINE p_sfkgseq    LIKE sfkg_t.sfkgseq  #项次
DEFINE p_sfaa012    LIKE sfaa_t.sfaa012  #工单的生产量
DEFINE l_sql        STRING
DEFINE l_cnt        LIKE type_t.num10
DEFINE li_i         LIKE type_t.num10
DEFINE l_diffqty013 LIKE sfkg_t.sfkg013  #其他项序待减少的应发量
DEFINE l_success    LIKE type_t.num5     #160905-00022#2
DEFINE l_sfaa012_o  LIKE sfaa_t.sfaa012  #160905-00022#2

   INITIALIZE g_replace TO NULL
   LET l_cnt = 1
   
   #160905-00022#2-s
   #LET l_sql = "SELECT sfkgseq,sfkgseq1,sfkg022,sfkg023,sfkg024,sfkg013,sfkg015,sfkg016, ",
   #            "       0,0,0,0 ", #需计算的量
   LET l_sql = " SELECT sfkgseq,sfkgseq1,sfkg022,sfba023,sfba024,sfba013,sfba010,sfba011,sfkg014,sfba015,sfba016,0,0,0 ",
               "   FROM sfkg_t ",
               "   LEFT JOIN sfba_t ON sfbaent=sfkgent AND sfbadocno=sfkgdocno AND sfbaseq=sfkgseq AND sfbaseq1=sfkgseq1 ",
              #"  WHERE sfkgent = ",g_enterprise," AND sfkgsite = '",g_site,"' ",  #171019-00015#31 mark
               "  WHERE sfkgent = ",g_enterprise,                                  #171019-00015#31 add
               "    AND sfkgdocno = '",p_sfkadocno,"' AND sfkg900 = ",p_sfka900,
               "    AND sfkgseq = ",p_sfkgseq,
               "  ORDER BY sfkgseq1 "
   PREPARE s_asft800_get_replace_pre1 FROM l_sql
   DECLARE s_asft800_get_replace_cur1 CURSOR FOR s_asft800_get_replace_pre1
   CASE
      WHEN p_sfka012 = p_sfaa012
         #FOREACH s_asft800_get_replace_cur1 INTO g_replace[l_cnt].*   #161109-00085#59 mark
         #161109-00085#59-s add
         FOREACH s_asft800_get_replace_cur1
            INTO g_replace[l_cnt].sfkgseq,g_replace[l_cnt].sfkgseq1,g_replace[l_cnt].sfkg022,g_replace[l_cnt].sfkg023_t,g_replace[l_cnt].sfkg024_t,
                 g_replace[l_cnt].sfkg013_t,g_replace[l_cnt].sfkg010,g_replace[l_cnt].sfkg011,g_replace[l_cnt].sfkg014,g_replace[l_cnt].sfkg015,
                 g_replace[l_cnt].sfkg016,g_replace[l_cnt].sfkg023,g_replace[l_cnt].sfkg024,g_replace[l_cnt].sfkg013  
         #161109-00085#59-e add
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "s_asft800_get_replace_cur1"
               LET g_errparam.code   = SQLCA.sqlcode
               LET g_errparam.popup  = TRUE
               CALL cl_err()
               EXIT FOREACH
            END IF
            LET g_replace[l_cnt].sfkg013 = g_replace[l_cnt].sfkg013_t
            LET g_replace[l_cnt].sfkg023 = g_replace[l_cnt].sfkg023_t
            LET g_replace[l_cnt].sfkg024 = g_replace[l_cnt].sfkg024_t
            LET l_cnt = l_cnt + 1
         END FOREACH
      WHEN p_sfka012 > p_sfaa012
         #工單變更是數量變大，都是直接加到項序為0
         #FOREACH s_asft800_get_replace_cur1 INTO g_replace[l_cnt].*   #161109-00085#59 mark
         #161109-00085#59-s add
         FOREACH s_asft800_get_replace_cur1
            INTO g_replace[l_cnt].sfkgseq,g_replace[l_cnt].sfkgseq1,g_replace[l_cnt].sfkg022,g_replace[l_cnt].sfkg023_t,g_replace[l_cnt].sfkg024_t,
                 g_replace[l_cnt].sfkg013_t,g_replace[l_cnt].sfkg010,g_replace[l_cnt].sfkg011,g_replace[l_cnt].sfkg014,g_replace[l_cnt].sfkg015,
                 g_replace[l_cnt].sfkg016,g_replace[l_cnt].sfkg023,g_replace[l_cnt].sfkg024,g_replace[l_cnt].sfkg013  
         #161109-00085#59-e add
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "s_asft800_get_replace_cur1"
               LET g_errparam.code   = SQLCA.sqlcode
               LET g_errparam.popup  = TRUE
               CALL cl_err()
               EXIT FOREACH
            END IF
            IF g_replace[l_cnt].sfkgseq1 = 0 THEN
               LET g_replace[l_cnt].sfkg013 = (p_sfka012 - p_sfaa012) * g_replace[l_cnt].sfkg010 / g_replace[l_cnt].sfkg011
               CALL s_aooi250_take_decimals(g_replace[l_cnt].sfkg014,g_replace[l_cnt].sfkg013) RETURNING l_success,g_replace[l_cnt].sfkg013
               LET g_replace[l_cnt].sfkg013 = g_replace[l_cnt].sfkg013_t + g_replace[l_cnt].sfkg013
               LET g_replace[l_cnt].sfkg023 = p_sfka012 * g_replace[l_cnt].sfkg010 / g_replace[l_cnt].sfkg011
              #LET g_replace[l_cnt].sfkg024 = 0                            #170330-00048#1 mark
               LET g_replace[l_cnt].sfkg024 = g_replace[l_cnt].sfkg024_t   #170330-00048#1 add
            ELSE
               LET g_replace[l_cnt].sfkg013 = g_replace[l_cnt].sfkg013_t
               LET g_replace[l_cnt].sfkg023 = g_replace[l_cnt].sfkg023_t
               LET g_replace[l_cnt].sfkg024 = g_replace[l_cnt].sfkg024_t
            END IF
            LET l_cnt = l_cnt + 1
         END FOREACH
      WHEN p_sfka012 < p_sfaa012
         LET l_sfaa012_o = p_sfaa012 - p_sfka012
         #FOREACH s_asft800_get_replace_cur1 INTO g_replace[l_cnt].*   #161109-00085#59 mark
         #161109-00085#59-s add
         FOREACH s_asft800_get_replace_cur1
            INTO g_replace[l_cnt].sfkgseq,g_replace[l_cnt].sfkgseq1,g_replace[l_cnt].sfkg022,g_replace[l_cnt].sfkg023_t,g_replace[l_cnt].sfkg024_t,
                 g_replace[l_cnt].sfkg013_t,g_replace[l_cnt].sfkg010,g_replace[l_cnt].sfkg011,g_replace[l_cnt].sfkg014,g_replace[l_cnt].sfkg015,
                 g_replace[l_cnt].sfkg016,g_replace[l_cnt].sfkg023,g_replace[l_cnt].sfkg024,g_replace[l_cnt].sfkg013  
         #161109-00085#59-e add
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "s_asft800_get_replace_cur1"
               LET g_errparam.code   = SQLCA.sqlcode
               LET g_errparam.popup  = TRUE
               CALL cl_err()
               EXIT FOREACH
            END IF
            IF l_sfaa012_o = 0 THEN CONTINUE FOREACH END IF
            IF g_replace[l_cnt].sfkgseq1 = 0 THEN
               LET l_sfaa012_o = l_sfaa012_o * g_replace[l_cnt].sfkg010 / g_replace[l_cnt].sfkg011
               LET g_replace[l_cnt].sfkg023 = p_sfka012 * g_replace[l_cnt].sfkg010 / g_replace[l_cnt].sfkg011
            ELSE
               LET g_replace[l_cnt].sfkg023 = 0
            END IF
            LET g_replace[l_cnt].sfkg013 = l_sfaa012_o * g_replace[l_cnt].sfkg022
            CALL s_aooi250_take_decimals(g_replace[l_cnt].sfkg014,g_replace[l_cnt].sfkg013) RETURNING l_success,g_replace[l_cnt].sfkg013
            IF (g_replace[l_cnt].sfkg013_t-g_replace[l_cnt].sfkg015-g_replace[l_cnt].sfkg016) > g_replace[l_cnt].sfkg013 THEN
               LET g_replace[l_cnt].sfkg013 = g_replace[l_cnt].sfkg013_t - g_replace[l_cnt].sfkg013
               LET l_sfaa012_o = 0
            ELSE
               LET g_replace[l_cnt].sfkg013 = g_replace[l_cnt].sfkg015+g_replace[l_cnt].sfkg016
               LET l_sfaa012_o = l_sfaa012_o - (g_replace[l_cnt].sfkg013_t-g_replace[l_cnt].sfkg015-g_replace[l_cnt].sfkg016) / g_replace[l_cnt].sfkg022
            END IF
           #LET g_replace[l_cnt].sfkg024 = 0                            #170330-00048#1 mark
            LET g_replace[l_cnt].sfkg024 = g_replace[l_cnt].sfkg024_t   #170330-00048#1 add
            LET l_cnt = l_cnt + 1
         END FOREACH
   END CASE
   #FOREACH s_asft800_get_replace_cur1 INTO g_replace[l_cnt].*
   #   IF SQLCA.sqlcode THEN
   #      INITIALIZE g_errparam TO NULL
   #      LET g_errparam.extend = "s_asft800_get_replace_cs1"
   #      LET g_errparam.code   = SQLCA.sqlcode
   #      LET g_errparam.popup  = TRUE
   #      CALL cl_err()
   #      EXIT FOREACH
   #   END IF
   #   
   #   #计算变更后各项序的应发量，后面还会根据已发量再分配
   #   LET g_replace[l_cnt].sfkg023 = g_replace[l_cnt].sfkg023_t * p_sfka012 / p_sfaa012
   #   LET g_replace[l_cnt].sfkg024 = g_replace[l_cnt].sfkg024_t * p_sfka012 / p_sfaa012
   #   LET g_replace[l_cnt].sfkg013 = g_replace[l_cnt].sfkg013_t * p_sfka012 / p_sfaa012
   #
   #
   #   #变更后的总应发量
   #   #LET l_sfkg013 = l_sfkg013 + g_replace[l_cnt].sfkg013/g_replace[l_cnt].sfkg022 #待分配应发量(转化为0项序的量)
   #
   #   LET l_cnt = l_cnt +1
   #END FOREACH
   #160905-00022#2-e
   LET g_replace_cnt = l_cnt - 1
   IF g_replace_cnt = 0 THEN
      RETURN
   END IF

   #160905-00022#2-s
   ##根据已发量重新分配 变更后各项序的应发量
   #LET l_diffqty013 = 0   #记录已处理的超出已发量部分合计,即其他项序待减少的应发量
   ##循环，处理已发量超出部分
   #FOR li_i = 1 TO g_replace_cnt
   #    #判断是否超出已发量,处理超出的量
   #    IF g_replace[li_i].sfkg013 < g_replace[li_i].sfkg015 + g_replace[li_i].sfkg016 THEN
   #    LET l_diffqty013 = l_diffqty013 + (g_replace[li_i].sfkg015+g_replace[li_i].sfkg016-g_replace[li_i].sfkg013)/g_replace[li_i].sfkg022  #此笔需增加的>超出部分，即其他项序待减少的量(转化为0项序的量)
   #       LET g_replace[li_i].sfkg013 = g_replace[li_i].sfkg015 + g_replace[li_i].sfkg016 #应发
   #    END IF
   #END FOR
   ##将超出部分放在0项序
   #LET g_replace[1].sfkg013 = g_replace[1].sfkg013 - l_diffqty013
   #160905-00022#2-e
END FUNCTION

################################################################################
# Descriptions...: 生管结案时，将对应的委外采购单一并结案
# Memo...........:
# Usage..........: CALL s_asft800_close_po(p_sfaadocno)
#                  RETURNING r_success
# Input parameter: p_sfaadocno   工单单号

# Return code....: r_success   成功标示符
#                
# Date & Author..: 2017/03/09 By liuym
# 需求单号........:170307-00076#1
################################################################################
PUBLIC FUNCTION s_asft800_close_po(p_sfaadocno)
   DEFINE p_sfaadocno      LIKE sfaa_t.sfaadocno
   DEFINE r_success        LIKE type_t.num5
   DEFINE l_pmdndocno      LIKE pmdn_t.pmdndocno
   DEFINE l_pmdnseq        LIKE pmdn_t.pmdnseq
   DEFINE l_pmdl006        LIKE pmdl_t.pmdl006
   DEFINE l_pmdl031        LIKE pmdl_t.pmdl031
   DEFINE l_pmdl051        LIKE pmdl_t.pmdl051
   DEFINE l_pmdlsite       LIKE pmdl_t.pmdlsite
   DEFINE l_pmdlstus       LIKE pmdl_t.pmdlstus
   DEFINE l_pmdlcrtid      LIKE pmdl_t.pmdlcrtid
   DEFINE l_pmdlcrtdp      LIKE pmdl_t.pmdlcrtdp
   DEFINE l_pmdldocdt      LIKE pmdl_t.pmdldocdt   
   DEFINE l_flag           LIKE type_t.chr1
   DEFINE l_x              LIKE type_t.num10
   DEFINE l_sql            STRING
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = FALSE
   
   LET l_flag = 'Y'
   #定义一个取工单对应采购单的CURSOR
   LET l_sql = " SELECT UNIQUE pmdldocno,pmdnseq,pmdl006,pmdl031,pmdl051,pmdlsite,",
                "               pmdlstus,pmdlcrtid,pmdlcrtdp,pmdldocdt",
                "   FROM pmdl_t,pmdn_t,pmdp_t ",
                "  WHERE pmdlent   = pmdpent   AND pmdlent   = pmdnent ",
                "    AND pmdldocno = pmdpdocno AND pmdldocno = pmdndocno",
                "    AND pmdnseq   = pmdpseq ",
                "    AND pmdl005   = '2' ",           #委外采购
                "    AND pmdl007   = '4' ",           #资料来源4.一般工单
                "    AND pmdp003   = ?   ",           #工单号
                "    AND pmdlstus <>'X' "            #剔除作废单据 
               ,"    AND pmdlent = '",g_enterprise,"' "     
                
   PREPARE s_asft800_sel_po_p1 FROM l_sql
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "prepare asft800_sel_po_p1"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      RETURN 
   END IF
   DECLARE s_asft800_sel_po_cs CURSOR FOR s_asft800_sel_po_p1
   FOREACH s_asft800_sel_po_cs USING p_sfaadocno
                              INTO l_pmdndocno,l_pmdnseq,l_pmdl006,l_pmdl031,l_pmdl051,l_pmdlsite,
                                   l_pmdlstus,l_pmdlcrtid,l_pmdlcrtdp,l_pmdldocdt
       
       IF l_pmdlstus = 'C' THEN CONTINUE FOREACH END IF  
       #單身狀態結案
       IF NOT s_apmp510_pmdn045_closed('2',l_pmdndocno,l_pmdnseq,'',l_pmdlsite) THEN
          LET l_flag = 'N'
       END IF
       #物流結案
       IF NOT s_apmp510_pmdl047_closed(l_pmdndocno,l_pmdlsite) THEN
          LET l_flag = 'N'
       END IF
    
       #帳流結案
       IF NOT s_apmp510_pmdl048_closed(l_pmdndocno,g_site) THEN
          LET l_flag = 'N'
       END IF
       #金流結案
       IF NOT s_apmp510_pmdl049_closed(l_pmdndocno,g_site) THEN
          LET l_flag = 'N'
       END IF
       #狀態結案
       IF NOT s_apmp510_pmdlstus_closed('2',l_pmdndocno,g_site) THEN
          LET l_flag = 'N'
       END IF             
    

   END FOREACH   
   
   IF l_flag = 'N' THEN
      RETURN r_success
   END IF
   
   LET r_success = TRUE
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 備註回寫asft300
# Memo...........:
# Usage..........: CALL s_asft800_memo_back(p_sfkadocno,p_sfka900)
# Input parameter: p_sfkadocno   工單單號
#                : p_sfka900     變更序
# Return code....: 無
# Date & Author..: 17/03/20 By 08992   #170310-00058#1
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft800_memo_back(p_sfkadocno,p_sfka900)
DEFINE p_sfkadocno      LIKE sfka_t.sfkadocno
DEFINE p_sfka900        LIKE sfka_t.sfka900
DEFINE l_sql            STRING
   
   LET l_sql = " MERGE INTO ooff_t A ",
               " USING (SELECT * FROM ooff_t",
               "         WHERE ooffent = ",g_enterprise,
               "           AND ooff001 = '6' ",
               "           AND ooff002 = 'asft800' ",
               "           AND ooff003 = '",p_sfkadocno,"'", 
               "           AND ooff005 = '"||p_sfka900||"' ) B",
               " ON (A.ooffent = B.ooffent AND A.ooffstus = B.ooffstus AND",
               "     A.ooff001 = B.ooff001 AND A.ooff003  = B.ooff003  AND",
               "     A.ooff004 = B.ooff004 AND A.ooff012  = B.ooff012  AND",
               "     A.ooff002='asft300') ",
               " WHEN MATCHED THEN ",
               " UPDATE SET  A.ooff013 = B.ooff013 , A.ooff014 = B.ooff014 , A.ooff015 = B.ooff015,",
               "            A.ooffmodid = B.ooffmodid , A.ooffmoddt = B.ooffmoddt ",
               " WHEN NOT MATCHED THEN ",
               " INSERT (ooffent,ooffstus,",
               "         ooff001,ooff002,ooff003,ooff004,ooff005,",
               "         ooff006,ooff007,ooff008,ooff009,ooff010,",
               "         ooff011,ooff012,ooff013,ooff014,ooff015,",
               "         ooffownid,ooffowndp,ooffcrtid,ooffcrtdp,ooffcrtdt,ooffmodid,ooffmoddt) ",
               " VALUES (B.ooffent,B.ooffstus,",
               "         B.ooff001,'asft300',B.ooff003,B.ooff004,B.ooff006,",  
               "         B.ooff006,B.ooff007,B.ooff008,B.ooff009,B.ooff010,", 
               "         B.ooff011,B.ooff012,B.ooff013,B.ooff014,B.ooff015,",
               "         B.ooffownid,B.ooffowndp,B.ooffcrtid,B.ooffcrtdp,B.ooffcrtdt,B.ooffmodid,B.ooffmoddt)"   
   EXECUTE IMMEDIATE l_sql   
   LET l_sql = " DELETE FROM ooff_t A ",
               "  WHERE A.ooffent = ",g_enterprise,
               "    AND A.ooff002 = 'asft300' ",
               "    AND A.ooff003 = '",p_sfkadocno,"' ",
               "    AND NOT EXISTS (SELECT 1 FROM ooff_t B",
               "                     WHERE B.ooffent = A.ooffent",
               "                       AND B.ooff001 = A.ooff001 ",
               "                       AND B.ooff002 = 'asft800'",
               "                       AND B.ooff003 = A.ooff003",
               "                       AND B.ooff004 = A.ooff004",
               "                       AND B.ooff005 = '"||p_sfka900||"' ",
               "                       AND B.ooff012 = A.ooff012",
               "                       AND B.ooffent = ",g_enterprise,") "
   EXECUTE IMMEDIATE l_sql   
   
END FUNCTION

################################################################################
# Descriptions...: 長備註回寫asft300
# Memo...........:
# Usage..........: CALL s_asft800_memo_back(p_sfkadocno,p_sfka900)
# Input parameter: p_sfkadocno   工單單號
#                : p_sfka900     變更序
# Return code....: 無
# Date & Author..: 17/03/20 By 08992   #170310-00058#1
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft800_memo_back2(p_sfkadocno,p_sfka900)
DEFINE p_sfkadocno      LIKE sfka_t.sfkadocno
DEFINE p_sfka900        LIKE sfka_t.sfka900
DEFINE l_sql            STRING
   
   LET l_sql = " MERGE INTO ooff_t A ",
               " USING (SELECT * FROM ooff_t",
               "         WHERE ooffent = ",g_enterprise,
               "           AND ooff001 = '7' ",
               "           AND ooff002 = 'asft800' ",
               "           AND ooff003 = '",p_sfkadocno,"'", 
               "           AND ooff006 = '"||p_sfka900||"' ) B",
               " ON (A.ooffent = B.ooffent AND A.ooffstus = B.ooffstus AND",
               "     A.ooff001 = B.ooff001 AND A.ooff003  = B.ooff003  AND",
               "     A.ooff004 = B.ooff004 AND A.ooff012  = B.ooff012  AND",
               "     A.ooff002='asft300') ",
               " WHEN MATCHED THEN ",
               " UPDATE SET  A.ooff013 = B.ooff013 , A.ooff014 = B.ooff014 , A.ooff015 = B.ooff015,",
               "            A.ooffmodid = B.ooffmodid , A.ooffmoddt = B.ooffmoddt ",
               " WHEN NOT MATCHED THEN ",
               " INSERT (ooffent,ooffstus,",
               "         ooff001,ooff002,ooff003,ooff004,ooff005,",
               "         ooff006,ooff007,ooff008,ooff009,ooff010,",
               "         ooff011,ooff012,ooff013,ooff014,ooff015,",
               "         ooffownid,ooffowndp,ooffcrtid,ooffcrtdp,ooffcrtdt,ooffmodid,ooffmoddt) ",
               " VALUES (B.ooffent,B.ooffstus,",
               "         B.ooff001,'asft300',B.ooff003,B.ooff004,B.ooff005,",  
               "         B.ooff007,B.ooff007,B.ooff008,B.ooff009,B.ooff010,", 
               "         B.ooff011,B.ooff012,B.ooff013,B.ooff014,B.ooff015,",
               "         B.ooffownid,B.ooffowndp,B.ooffcrtid,B.ooffcrtdp,B.ooffcrtdt,B.ooffmodid,B.ooffmoddt)"
   EXECUTE IMMEDIATE l_sql
   LET l_sql = " DELETE FROM ooff_t A ",
               "  WHERE A.ooffent = ",g_enterprise,
               "    AND A.ooff002 = 'asft300' ",
               "    AND A.ooff003 = '",p_sfkadocno,"' ",
               "    AND A.ooff001 <> '6' ",
               "    AND NOT EXISTS (SELECT 1 FROM ooff_t B",
               "                     WHERE B.ooffent = A.ooffent",
               "                       AND B.ooff001 = A.ooff001 ",
               "                       AND B.ooff002 = 'asft800'",
               "                       AND B.ooff003 = A.ooff003",
               "                       AND B.ooff004 = A.ooff004",
               "                       AND B.ooff005 = A.ooff005",
               "                       AND B.ooff006 = '"||p_sfka900||"' ",
               "                       AND B.ooff012 = A.ooff012",
               "                       AND B.ooffent = ",g_enterprise,") "
   EXECUTE IMMEDIATE l_sql   
   
END FUNCTION

################################################################################
# Descriptions...: DROP臨時表
# Memo...........:
# Usage..........: CALL s_asft800_drop_temp()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2018/03/17 By lixh
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft800_drop_temp()
   DROP TABLE s_asft800_tmp;
   DROP TABLE s_asft800_tmp2;
   DROP TABLE s_asft800_tmp3;
   DROP TABLE s_asft800_tmp4;
   DROP TABLE s_asft800_tmp5
END FUNCTION

################################################################################
# Descriptions...: 根據sfkc_t重新产生备料
# Memo...........:
# Usage..........: CALL s_asft800_gene_new_sfba(p_sfkadocno,p_sfka900)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2018/04/18 By lixh
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft800_gene_new_sfba(p_sfkadocno,p_sfka900)
DEFINE  p_sfkadocno    LIKE sfka_t.sfkadocno
DEFINE  p_sfka900      LIKE sfka_t.sfka900
DEFINE l_sfka RECORD  #工單變更單單頭檔
       sfkaent LIKE sfka_t.sfkaent, #企業編號
       sfkasite LIKE sfka_t.sfkasite, #營運據點
       sfkadocno LIKE sfka_t.sfkadocno, #工單單號
       sfkadocdt LIKE sfka_t.sfkadocdt, #開單日期
       sfka001 LIKE sfka_t.sfka001, #變更版本
       sfka002 LIKE sfka_t.sfka002, #生管人員
       sfka003 LIKE sfka_t.sfka003, #工單類型
       sfka004 LIKE sfka_t.sfka004, #發料制度
       sfka005 LIKE sfka_t.sfka005, #工單來源
       sfka006 LIKE sfka_t.sfka006, #來源單號
       sfka007 LIKE sfka_t.sfka007, #來源項次
       sfka008 LIKE sfka_t.sfka008, #來源項序
       sfka009 LIKE sfka_t.sfka009, #參考客戶
       sfka010 LIKE sfka_t.sfka010, #生產料號
       sfka011 LIKE sfka_t.sfka011, #特性
       sfka012 LIKE sfka_t.sfka012, #生產數量
       sfka013 LIKE sfka_t.sfka013, #生產單位
       sfka014 LIKE sfka_t.sfka014, #BOM版本
       sfka015 LIKE sfka_t.sfka015, #BOM有效日期
       sfka016 LIKE sfka_t.sfka016, #製程編號
       sfka017 LIKE sfka_t.sfka017, #部門供應商
       sfka018 LIKE sfka_t.sfka018, #協作據點
       sfka019 LIKE sfka_t.sfka019, #預計開工日
       sfka020 LIKE sfka_t.sfka020, #預計完工日
       sfka021 LIKE sfka_t.sfka021, #母工單單號
       sfka022 LIKE sfka_t.sfka022, #參考原始單號
       sfka023 LIKE sfka_t.sfka023, #參考原始項次
       sfka024 LIKE sfka_t.sfka024, #參考原始項序
       sfka025 LIKE sfka_t.sfka025, #前工單單號
       sfka026 LIKE sfka_t.sfka026, #料表批號(PBI)
       sfka027 LIKE sfka_t.sfka027, #No Use
       sfka028 LIKE sfka_t.sfka028, #專案編號
       sfka029 LIKE sfka_t.sfka029, #WBS
       sfka030 LIKE sfka_t.sfka030, #活動
       sfka031 LIKE sfka_t.sfka031, #理由碼
       sfka032 LIKE sfka_t.sfka032, #緊急比率
       sfka033 LIKE sfka_t.sfka033, #優先順序
       sfka034 LIKE sfka_t.sfka034, #預計入庫庫位
       sfka035 LIKE sfka_t.sfka035, #預計入庫儲位
       sfka036 LIKE sfka_t.sfka036, #手冊編號
       sfka037 LIKE sfka_t.sfka037, #保稅核准文號
       sfka038 LIKE sfka_t.sfka038, #保稅核銷
       sfka039 LIKE sfka_t.sfka039, #備料已產生
       sfka040 LIKE sfka_t.sfka040, #生產途程已確認
       sfka041 LIKE sfka_t.sfka041, #凍結
       sfka042 LIKE sfka_t.sfka042, #重工
       sfka043 LIKE sfka_t.sfka043, #備置
       sfka044 LIKE sfka_t.sfka044, #FQC
       sfka045 LIKE sfka_t.sfka045, #實際開始發料日
       sfka046 LIKE sfka_t.sfka046, #最後入庫日
       sfka047 LIKE sfka_t.sfka047, #生管結案日
       sfka048 LIKE sfka_t.sfka048, #成本結案日
       sfka049 LIKE sfka_t.sfka049, #已發料套數
       sfka050 LIKE sfka_t.sfka050, #已入庫合格量
       sfka051 LIKE sfka_t.sfka051, #已入庫不合格量
       sfka052 LIKE sfka_t.sfka052, #Bouns
       sfka053 LIKE sfka_t.sfka053, #工單轉入數量
       sfka054 LIKE sfka_t.sfka054, #工單轉出數量
       sfka055 LIKE sfka_t.sfka055, #下線數量
       sfka056 LIKE sfka_t.sfka056, #報廢數量
       sfka057 LIKE sfka_t.sfka057, #委外類型
       sfka058 LIKE sfka_t.sfka058, #參考數量
       sfka059 LIKE sfka_t.sfka059, #預計入庫批號
       sfka060 LIKE sfka_t.sfka060, #參考單位
       sfka061 LIKE sfka_t.sfka061, #製程
       sfka062 LIKE sfka_t.sfka062, #納入MRP/MPS計算
       sfka900 LIKE sfka_t.sfka900, #變更序
       sfka901 LIKE sfka_t.sfka901, #變更類型
       sfka902 LIKE sfka_t.sfka902, #變更日期
       sfka905 LIKE sfka_t.sfka905, #變更理由
       sfka906 LIKE sfka_t.sfka906, #變更備註
       sfkaownid LIKE sfka_t.sfkaownid, #資料所有者
       sfkaowndp LIKE sfka_t.sfkaowndp, #資料所屬部門
       sfkacrtid LIKE sfka_t.sfkacrtid, #資料建立者
       sfkacrtdp LIKE sfka_t.sfkacrtdp, #資料建立部門
       sfkacrtdt LIKE sfka_t.sfkacrtdt, #資料創建日
       sfkamodid LIKE sfka_t.sfkamodid, #資料修改者
       sfkamoddt LIKE sfka_t.sfkamoddt, #最近修改日
       sfkacnfid LIKE sfka_t.sfkacnfid, #資料確認者
       sfkacnfdt LIKE sfka_t.sfkacnfdt, #資料確認日
       sfkapstid LIKE sfka_t.sfkapstid, #資料過帳者
       sfkapstdt LIKE sfka_t.sfkapstdt, #資料過帳日
       sfkastus LIKE sfka_t.sfkastus, #狀態碼
       sfkaacti LIKE sfka_t.sfkaacti, #工單結案
       sfka063 LIKE sfka_t.sfka063, #來源分批序
       sfka064 LIKE sfka_t.sfka064, #參考來源分批序
       sfka065 LIKE sfka_t.sfka065, #生管結案狀態
       sfkaud001 LIKE sfka_t.sfkaud001, #自定義欄位(文字)001
       sfkaud002 LIKE sfka_t.sfkaud002, #自定義欄位(文字)002
       sfkaud003 LIKE sfka_t.sfkaud003, #自定義欄位(文字)003
       sfkaud004 LIKE sfka_t.sfkaud004, #自定義欄位(文字)004
       sfkaud005 LIKE sfka_t.sfkaud005, #自定義欄位(文字)005
       sfkaud006 LIKE sfka_t.sfkaud006, #自定義欄位(文字)006
       sfkaud007 LIKE sfka_t.sfkaud007, #自定義欄位(文字)007
       sfkaud008 LIKE sfka_t.sfkaud008, #自定義欄位(文字)008
       sfkaud009 LIKE sfka_t.sfkaud009, #自定義欄位(文字)009
       sfkaud010 LIKE sfka_t.sfkaud010, #自定義欄位(文字)010
       sfkaud011 LIKE sfka_t.sfkaud011, #自定義欄位(數字)011
       sfkaud012 LIKE sfka_t.sfkaud012, #自定義欄位(數字)012
       sfkaud013 LIKE sfka_t.sfkaud013, #自定義欄位(數字)013
       sfkaud014 LIKE sfka_t.sfkaud014, #自定義欄位(數字)014
       sfkaud015 LIKE sfka_t.sfkaud015, #自定義欄位(數字)015
       sfkaud016 LIKE sfka_t.sfkaud016, #自定義欄位(數字)016
       sfkaud017 LIKE sfka_t.sfkaud017, #自定義欄位(數字)017
       sfkaud018 LIKE sfka_t.sfkaud018, #自定義欄位(數字)018
       sfkaud019 LIKE sfka_t.sfkaud019, #自定義欄位(數字)019
       sfkaud020 LIKE sfka_t.sfkaud020, #自定義欄位(數字)020
       sfkaud021 LIKE sfka_t.sfkaud021, #自定義欄位(日期時間)021
       sfkaud022 LIKE sfka_t.sfkaud022, #自定義欄位(日期時間)022
       sfkaud023 LIKE sfka_t.sfkaud023, #自定義欄位(日期時間)023
       sfkaud024 LIKE sfka_t.sfkaud024, #自定義欄位(日期時間)024
       sfkaud025 LIKE sfka_t.sfkaud025, #自定義欄位(日期時間)025
       sfkaud026 LIKE sfka_t.sfkaud026, #自定義欄位(日期時間)026
       sfkaud027 LIKE sfka_t.sfkaud027, #自定義欄位(日期時間)027
       sfkaud028 LIKE sfka_t.sfkaud028, #自定義欄位(日期時間)028
       sfkaud029 LIKE sfka_t.sfkaud029, #自定義欄位(日期時間)029
       sfkaud030 LIKE sfka_t.sfkaud030, #自定義欄位(日期時間)030
       sfka066 LIKE sfka_t.sfka066, #多角流程編號
       sfka067 LIKE sfka_t.sfka067, #多角流程式號
       sfka068 LIKE sfka_t.sfka068, #成本中心
       sfka069 LIKE sfka_t.sfka069, #可供給量
       sfka070 LIKE sfka_t.sfka070, #原始預計完工日期
       sfka071 LIKE sfka_t.sfka071, #齊料套數
       sfka072 LIKE sfka_t.sfka072  #保稅否
END RECORD

DEFINE l_sfkb2 RECORD  #工單變更單來源檔
       sfkbent LIKE sfkb_t.sfkbent, #企業編號
       sfkbsite LIKE sfkb_t.sfkbsite, #營運據點
       sfkbdocno LIKE sfkb_t.sfkbdocno, #工單單號
       sfkbseq LIKE sfkb_t.sfkbseq, #項次
       sfkb001 LIKE sfkb_t.sfkb001, #來源
       sfkb002 LIKE sfkb_t.sfkb002, #來源單號
       sfkb003 LIKE sfkb_t.sfkb003, #來源項次
       sfkb004 LIKE sfkb_t.sfkb004, #來源項序
       sfkb005 LIKE sfkb_t.sfkb005, #分批序
       sfkb006 LIKE sfkb_t.sfkb006, #分配優先序
       sfkb007 LIKE sfkb_t.sfkb007, #本次轉開工單量
       sfkb900 LIKE sfkb_t.sfkb900, #變更序
       sfkb901 LIKE sfkb_t.sfkb901, #變更類型
       sfkb902 LIKE sfkb_t.sfkb902, #變更日期
       sfkb905 LIKE sfkb_t.sfkb905, #變更理由
       sfkb906 LIKE sfkb_t.sfkb906, #變更備註
       sfkbud001 LIKE sfkb_t.sfkbud001, #自定義欄位(文字)001
       sfkbud002 LIKE sfkb_t.sfkbud002, #自定義欄位(文字)002
       sfkbud003 LIKE sfkb_t.sfkbud003, #自定義欄位(文字)003
       sfkbud004 LIKE sfkb_t.sfkbud004, #自定義欄位(文字)004
       sfkbud005 LIKE sfkb_t.sfkbud005, #自定義欄位(文字)005
       sfkbud006 LIKE sfkb_t.sfkbud006, #自定義欄位(文字)006
       sfkbud007 LIKE sfkb_t.sfkbud007, #自定義欄位(文字)007
       sfkbud008 LIKE sfkb_t.sfkbud008, #自定義欄位(文字)008
       sfkbud009 LIKE sfkb_t.sfkbud009, #自定義欄位(文字)009
       sfkbud010 LIKE sfkb_t.sfkbud010, #自定義欄位(文字)010
       sfkbud011 LIKE sfkb_t.sfkbud011, #自定義欄位(數字)011
       sfkbud012 LIKE sfkb_t.sfkbud012, #自定義欄位(數字)012
       sfkbud013 LIKE sfkb_t.sfkbud013, #自定義欄位(數字)013
       sfkbud014 LIKE sfkb_t.sfkbud014, #自定義欄位(數字)014
       sfkbud015 LIKE sfkb_t.sfkbud015, #自定義欄位(數字)015
       sfkbud016 LIKE sfkb_t.sfkbud016, #自定義欄位(數字)016
       sfkbud017 LIKE sfkb_t.sfkbud017, #自定義欄位(數字)017
       sfkbud018 LIKE sfkb_t.sfkbud018, #自定義欄位(數字)018
       sfkbud019 LIKE sfkb_t.sfkbud019, #自定義欄位(數字)019
       sfkbud020 LIKE sfkb_t.sfkbud020, #自定義欄位(數字)020
       sfkbud021 LIKE sfkb_t.sfkbud021, #自定義欄位(日期時間)021
       sfkbud022 LIKE sfkb_t.sfkbud022, #自定義欄位(日期時間)022
       sfkbud023 LIKE sfkb_t.sfkbud023, #自定義欄位(日期時間)023
       sfkbud024 LIKE sfkb_t.sfkbud024, #自定義欄位(日期時間)024
       sfkbud025 LIKE sfkb_t.sfkbud025, #自定義欄位(日期時間)025
       sfkbud026 LIKE sfkb_t.sfkbud026, #自定義欄位(日期時間)026
       sfkbud027 LIKE sfkb_t.sfkbud027, #自定義欄位(日期時間)027
       sfkbud028 LIKE sfkb_t.sfkbud028, #自定義欄位(日期時間)028
       sfkbud029 LIKE sfkb_t.sfkbud029, #自定義欄位(日期時間)029
       sfkbud030 LIKE sfkb_t.sfkbud030, #自定義欄位(日期時間)030
       sfkb008 LIKE sfkb_t.sfkb008      #備註
END RECORD

DEFINE l_sfkc2 RECORD  #工單變更單聯產品檔
       sfkcent LIKE sfkc_t.sfkcent, #企業編號
       sfkcsite LIKE sfkc_t.sfkcsite, #營運據點
       sfkcdocno LIKE sfkc_t.sfkcdocno, #工單單號
       sfkcseq LIKE sfkc_t.sfkcseq, #項次
       sfkc001 LIKE sfkc_t.sfkc001, #料件編號
       sfkc002 LIKE sfkc_t.sfkc002, #類型
       sfkc003 LIKE sfkc_t.sfkc003, #預計產出量
       sfkc004 LIKE sfkc_t.sfkc004, #單位
       sfkc005 LIKE sfkc_t.sfkc005, #實際產出數量
       sfkc900 LIKE sfkc_t.sfkc900, #變更序
       sfkc901 LIKE sfkc_t.sfkc901, #變更類型
       sfkc902 LIKE sfkc_t.sfkc902, #變更日期
       sfkc006 LIKE sfkc_t.sfkc006, #產品特征
       sfkc904 LIKE sfkc_t.sfkc904, #變更理由
       sfkc905 LIKE sfkc_t.sfkc905, #變更備註
       sfkcud001 LIKE sfkc_t.sfkcud001, #自定義欄位(文字)001
       sfkcud002 LIKE sfkc_t.sfkcud002, #自定義欄位(文字)002
       sfkcud003 LIKE sfkc_t.sfkcud003, #自定義欄位(文字)003
       sfkcud004 LIKE sfkc_t.sfkcud004, #自定義欄位(文字)004
       sfkcud005 LIKE sfkc_t.sfkcud005, #自定義欄位(文字)005
       sfkcud006 LIKE sfkc_t.sfkcud006, #自定義欄位(文字)006
       sfkcud007 LIKE sfkc_t.sfkcud007, #自定義欄位(文字)007
       sfkcud008 LIKE sfkc_t.sfkcud008, #自定義欄位(文字)008
       sfkcud009 LIKE sfkc_t.sfkcud009, #自定義欄位(文字)009
       sfkcud010 LIKE sfkc_t.sfkcud010, #自定義欄位(文字)010
       sfkcud011 LIKE sfkc_t.sfkcud011, #自定義欄位(數字)011
       sfkcud012 LIKE sfkc_t.sfkcud012, #自定義欄位(數字)012
       sfkcud013 LIKE sfkc_t.sfkcud013, #自定義欄位(數字)013
       sfkcud014 LIKE sfkc_t.sfkcud014, #自定義欄位(數字)014
       sfkcud015 LIKE sfkc_t.sfkcud015, #自定義欄位(數字)015
       sfkcud016 LIKE sfkc_t.sfkcud016, #自定義欄位(數字)016
       sfkcud017 LIKE sfkc_t.sfkcud017, #自定義欄位(數字)017
       sfkcud018 LIKE sfkc_t.sfkcud018, #自定義欄位(數字)018
       sfkcud019 LIKE sfkc_t.sfkcud019, #自定義欄位(數字)019
       sfkcud020 LIKE sfkc_t.sfkcud020, #自定義欄位(數字)020
       sfkcud021 LIKE sfkc_t.sfkcud021, #自定義欄位(日期時間)021
       sfkcud022 LIKE sfkc_t.sfkcud022, #自定義欄位(日期時間)022
       sfkcud023 LIKE sfkc_t.sfkcud023, #自定義欄位(日期時間)023
       sfkcud024 LIKE sfkc_t.sfkcud024, #自定義欄位(日期時間)024
       sfkcud025 LIKE sfkc_t.sfkcud025, #自定義欄位(日期時間)025
       sfkcud026 LIKE sfkc_t.sfkcud026, #自定義欄位(日期時間)026
       sfkcud027 LIKE sfkc_t.sfkcud027, #自定義欄位(日期時間)027
       sfkcud028 LIKE sfkc_t.sfkcud028, #自定義欄位(日期時間)028
       sfkcud029 LIKE sfkc_t.sfkcud029, #自定義欄位(日期時間)029
       sfkcud030 LIKE sfkc_t.sfkcud030, #自定義欄位(日期時間)030
       sfkc007 LIKE sfkc_t.sfkc007      #保稅否
END RECORD

TYPE type_sfba_2     RECORD  #工單備料單身檔
       sfbaent LIKE sfba_t.sfbaent, #企業編號
       sfbasite LIKE sfba_t.sfbasite, #營運據點
       sfbadocno LIKE sfba_t.sfbadocno, #單號
       sfbaseq LIKE sfba_t.sfbaseq, #項次
       sfbaseq1 LIKE sfba_t.sfbaseq1, #項序
       sfba001 LIKE sfba_t.sfba001, #上階料號
       sfba002 LIKE sfba_t.sfba002, #部位
       sfba003 LIKE sfba_t.sfba003, #作業編號
       sfba004 LIKE sfba_t.sfba004, #作業序
       sfba005 LIKE sfba_t.sfba005, #BOM料號
       sfba006 LIKE sfba_t.sfba006, #發料料號
       sfba007 LIKE sfba_t.sfba007, #投料時距
       sfba008 LIKE sfba_t.sfba008, #必要特性
       sfba009 LIKE sfba_t.sfba009, #倒扣料
       sfba010 LIKE sfba_t.sfba010, #標準QPA分子
       sfba011 LIKE sfba_t.sfba011, #標準QPA分母
       sfba012 LIKE sfba_t.sfba012, #允許誤差率
       sfba013 LIKE sfba_t.sfba013, #應發數量
       sfba014 LIKE sfba_t.sfba014, #單位
       sfba015 LIKE sfba_t.sfba015, #委外代買數量
       sfba016 LIKE sfba_t.sfba016, #已發數量
       sfba017 LIKE sfba_t.sfba017, #報廢數量
       sfba018 LIKE sfba_t.sfba018, #盤盈虧數量
       sfba019 LIKE sfba_t.sfba019, #指定發料倉庫
       sfba020 LIKE sfba_t.sfba020, #指定發料儲位
       sfba021 LIKE sfba_t.sfba021, #產品特徵
       sfba022 LIKE sfba_t.sfba022, #替代率
       sfba023 LIKE sfba_t.sfba023, #標準應發數量
       sfba024 LIKE sfba_t.sfba024, #調整應發數量
       sfba025 LIKE sfba_t.sfba025, #超領數量
       sfba026 LIKE sfba_t.sfba026, #SET替代狀態
       sfba027 LIKE sfba_t.sfba027, #SET替代群組
       sfba028 LIKE sfba_t.sfba028, #客供料
       sfba029 LIKE sfba_t.sfba029, #指定發料批號
       sfba030 LIKE sfba_t.sfba030, #指定庫存管理特徵
       sfba031 LIKE sfba_t.sfba031, #備置量
       sfba032 LIKE sfba_t.sfba032, #備置理由碼
       sfba033 LIKE sfba_t.sfba033, #保稅否
       sfba034 LIKE sfba_t.sfba034, #SET被替代群組
       sfba035 LIKE sfba_t.sfba035, #SET替代套數
       sfba036 LIKE sfba_t.sfba036, #SET已發料套數
       sfba037 LIKE sfba_t.sfba037  #替代群組
END RECORD

DEFINE l_sfba_new          DYNAMIC ARRAY OF type_sfba_2
DEFINE l_sfba_old          type_sfba_2
DEFINE i                   LIKE type_t.num10
DEFINE j                   LIKE type_t.num10
DEFINE l_sfkg901           LIKE sfkg_t.sfkg901
DEFINE l_sfkg902           LIKE sfkg_t.sfkg902
DEFINE l_sfkg904           LIKE sfkg_t.sfkg904
DEFINE l_sfkg905           LIKE sfkg_t.sfkg905
DEFINE l_sfba016_old       LIKE sfba_t.sfba016
DEFINE l_sfba013_old       LIKE sfba_t.sfba013
DEFINE l_sfba015_old       LIKE sfba_t.sfba015
DEFINE l_sfba023_old       LIKE sfba_t.sfba023
DEFINE l_sfba024_old       LIKE sfba_t.sfba024
DEFINE l_sfba035_old       LIKE sfba_t.sfba035
DEFINE l_type_new          LIKE sfkg_t.sfkg901
DEFINE l_cnt               LIKE type_t.num10
DEFINE l_flag2             LIKE type_t.chr1
DEFINE l_sql               STRING
DEFINE l_n                 LIKE type_t.num10
DEFINE l_success           LIKE type_t.num5
DEFINE r_success           LIKE type_t.num5

   LET r_success = TRUE
   LET l_cnt = 0
   SELECT COUNT(1) INTO l_cnt FROM sfkc_t 
    WHERE sfkcent = g_enterprise
      AND sfkcsite = g_site
      AND sfkcdocno = p_sfkadocno
      AND sfkc900 = p_sfka900
      AND sfkc002 = '1' 
      AND sfkc006 IS NOT NULL AND sfkc006 <> ' '
   IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF   
   IF l_cnt > 0 THEN 
      #檢查:應在事物中的
      IF NOT s_transaction_chk('Y','0') THEN
         LET r_success = FALSE
         RETURN r_success
      END IF   
      DELETE FROM s_asft800_tmp;  
      DELETE FROM s_asft800_tmp2; 
      DELETE FROM s_asft800_tmp3;   
      DELETE FROM s_asft800_tmp4;
      DELETE FROM s_asft800_tmp5;  
      
      LET l_sql = " INSERT INTO s_asft800_tmp SELECT sfaa_t.* FROM sfaa_t WHERE sfaaent = ",g_enterprise,
                                                                   " AND sfaadocno = '",p_sfkadocno,"'"  
                                                                   
      PREPARE s_asft800_ins_sfaa FROM l_sql
      EXECUTE s_asft800_ins_sfaa
      
      LET l_sql = " INSERT INTO s_asft800_tmp2 SELECT sfab_t.* FROM sfab_t WHERE sfabent = ",g_enterprise,
                                                      "  AND sfabdocno = '",p_sfkadocno,"'"  
      PREPARE s_asft800_ins_sfab FROM l_sql
      EXECUTE s_asft800_ins_sfab
      
      LET l_sql = " INSERT INTO s_asft800_tmp3 SELECT sfac_t.* FROM sfac_t WHERE sfacent = ",g_enterprise,
                                                      "  AND sfacdocno = '",p_sfkadocno,"'" 
      PREPARE s_asft800_ins_sfac FROM l_sql
      EXECUTE s_asft800_ins_sfac
      
      LET l_sql = " INSERT INTO s_asft800_tmp4 SELECT * FROM sfba_t WHERE sfbaent = ",g_enterprise,
                                                      "  AND sfbadocno = '",p_sfkadocno,"'"  
      PREPARE s_asft800_ins_sfba FROM l_sql
      EXECUTE s_asft800_ins_sfba                                                   
   
      LET l_sql = " INSERT INTO s_asft800_tmp5 SELECT sfba_t.*,'1' FROM sfba_t WHERE sfbaent = ",g_enterprise,
                                                                            "    AND sfbadocno = '",p_sfkadocno,"'"
      PREPARE s_asft800_ins_sfba2 FROM l_sql
      EXECUTE s_asft800_ins_sfba2     
      
      DELETE FROM sfaa_t WHERE sfaaent = g_enterprise AND sfaadocno = p_sfkadocno
      DELETE FROM sfab_t WHERE sfabent = g_enterprise AND sfabdocno = p_sfkadocno
      DELETE FROM sfac_t WHERE sfacent = g_enterprise AND sfacdocno = p_sfkadocno
      DELETE FROM sfba_t WHERE sfbaent = g_enterprise AND sfbadocno = p_sfkadocno
      
      #將asft800 單頭資料複製到asft300
      #將sfka_t複製到sfaa_t
      SELECT sfkadocno,sfkadocdt,sfka001,sfka002,sfka003,sfka004,sfka005,sfka006,sfka007,sfka008,sfka009,sfka010,
             sfka011,sfka012,sfka013,sfka014,sfka015,sfka016,sfka017,sfka018,sfka019,sfka020,sfka021,sfka022,sfka023,sfka024,sfka025,
             sfka026,sfka027,sfka028,sfka029,sfka030,sfka031,sfka032,sfka033,sfka034,sfka035,sfka036,sfka037,sfka038,sfka039,sfka040,
             sfka041,sfka042,sfka043,sfka044,sfka045,sfka046,sfka047,sfka048,sfka049,sfka050,sfka051,sfka052,sfka053,sfka054,sfka055,
             sfka056,sfka057,sfka058,sfka059,sfka060,sfka061,sfka062,sfka063,sfka064,sfka065,sfka066,sfka067,sfka068,sfka069,sfka070,
             sfka071,sfka072,sfkaownid,sfkaowndp,sfkacrtid,sfkacrtdp,sfkacrtdt,sfkamodid,sfkamoddt,sfkacnfid,sfkacnfdt,sfkapstid,
             sfkapstdt
        INTO l_sfka.sfkadocno,l_sfka.sfkadocdt,l_sfka.sfka001,l_sfka.sfka002,l_sfka.sfka003,l_sfka.sfka004,l_sfka.sfka005,l_sfka.sfka006,l_sfka.sfka007,l_sfka.sfka008,l_sfka.sfka009,l_sfka.sfka010,
                           l_sfka.sfka011,l_sfka.sfka012,l_sfka.sfka013,l_sfka.sfka014,l_sfka.sfka015,l_sfka.sfka016,l_sfka.sfka017,l_sfka.sfka018,l_sfka.sfka019,l_sfka.sfka020,l_sfka.sfka021,l_sfka.sfka022,l_sfka.sfka023,l_sfka.sfka024,l_sfka.sfka025,
                           l_sfka.sfka026,l_sfka.sfka027,l_sfka.sfka028,l_sfka.sfka029,l_sfka.sfka030,l_sfka.sfka031,l_sfka.sfka032,l_sfka.sfka033,l_sfka.sfka034,l_sfka.sfka035,l_sfka.sfka036,l_sfka.sfka037,l_sfka.sfka038,l_sfka.sfka039,l_sfka.sfka040,
                           l_sfka.sfka041,l_sfka.sfka042,l_sfka.sfka043,l_sfka.sfka044,l_sfka.sfka045,l_sfka.sfka046,l_sfka.sfka047,l_sfka.sfka048,l_sfka.sfka049,l_sfka.sfka050,l_sfka.sfka051,l_sfka.sfka052,l_sfka.sfka053,l_sfka.sfka054,l_sfka.sfka055,
                           l_sfka.sfka056,l_sfka.sfka057,l_sfka.sfka058,l_sfka.sfka059,l_sfka.sfka060,l_sfka.sfka061,l_sfka.sfka062,l_sfka.sfka063,l_sfka.sfka064,l_sfka.sfka065,l_sfka.sfka066,l_sfka.sfka067,l_sfka.sfka068,l_sfka.sfka069,l_sfka.sfka070,
                           l_sfka.sfka071,l_sfka.sfka072,l_sfka.sfkaownid,l_sfka.sfkaowndp,l_sfka.sfkacrtid,l_sfka.sfkacrtdp,l_sfka.sfkacrtdt,l_sfka.sfkamodid,l_sfka.sfkamoddt,l_sfka.sfkacnfid,l_sfka.sfkacnfdt,l_sfka.sfkapstid,
                           l_sfka.sfkapstdt
        FROM sfka_t
       WHERE sfkaent = g_enterprise
         AND sfkasite = g_site 
         AND sfkadocno = p_sfkadocno
         AND sfka900 = p_sfka900       
             
                          
      INSERT INTO sfaa_t (sfaaent,sfaasite,sfaadocno,sfaadocdt,sfaa001,sfaa002,sfaa003,sfaa004,sfaa005,sfaa006,sfaa007,sfaa008,sfaa009,sfaa010,
                          sfaa011,sfaa012,sfaa013,sfaa014,sfaa015,sfaa016,sfaa017,sfaa018,sfaa019,sfaa020,sfaa021,sfaa022,sfaa023,sfaa024,sfaa025,
                          sfaa026,sfaa027,sfaa028,sfaa029,sfaa030,sfaa031,sfaa032,sfaa033,sfaa034,sfaa035,sfaa036,sfaa037,sfaa038,sfaa039,sfaa040,
                          sfaa041,sfaa042,sfaa043,sfaa044,sfaa045,sfaa046,sfaa047,sfaa048,sfaa049,sfaa050,sfaa051,sfaa052,sfaa053,sfaa054,sfaa055,
                          sfaa056,sfaa057,sfaa058,sfaa059,sfaa060,sfaa061,sfaa062,sfaa063,sfaa064,sfaa065,sfaa066,sfaa067,sfaa068,sfaa069,sfaa070,
                          sfaa071,sfaa072,sfaa073,sfaaownid,sfaaowndp,sfaacrtid,sfaacrtdp,sfaacrtdt,sfaamodid,sfaamoddt,sfaacnfid,sfaacnfdt,sfaapstid,
                          sfaapstdt,sfaastus)
                   VALUES (g_enterprise,g_site,l_sfka.sfkadocno,l_sfka.sfkadocdt,l_sfka.sfka001,l_sfka.sfka002,l_sfka.sfka003,l_sfka.sfka004,l_sfka.sfka005,l_sfka.sfka006,l_sfka.sfka007,l_sfka.sfka008,l_sfka.sfka009,l_sfka.sfka010,
                           l_sfka.sfka011,l_sfka.sfka012,l_sfka.sfka013,l_sfka.sfka014,l_sfka.sfka015,l_sfka.sfka016,l_sfka.sfka017,l_sfka.sfka018,l_sfka.sfka019,l_sfka.sfka020,l_sfka.sfka021,l_sfka.sfka022,l_sfka.sfka023,l_sfka.sfka024,l_sfka.sfka025,
                           l_sfka.sfka026,l_sfka.sfka027,l_sfka.sfka028,l_sfka.sfka029,l_sfka.sfka030,l_sfka.sfka031,l_sfka.sfka032,l_sfka.sfka033,l_sfka.sfka034,l_sfka.sfka035,l_sfka.sfka036,l_sfka.sfka037,l_sfka.sfka038,l_sfka.sfka039,l_sfka.sfka040,
                           l_sfka.sfka041,l_sfka.sfka042,l_sfka.sfka043,l_sfka.sfka044,l_sfka.sfka045,l_sfka.sfka046,l_sfka.sfka047,l_sfka.sfka048,l_sfka.sfka049,l_sfka.sfka050,l_sfka.sfka051,l_sfka.sfka052,l_sfka.sfka053,l_sfka.sfka054,l_sfka.sfka055,
                           l_sfka.sfka056,l_sfka.sfka057,l_sfka.sfka058,l_sfka.sfka059,l_sfka.sfka060,l_sfka.sfka061,l_sfka.sfka062,l_sfka.sfka063,l_sfka.sfka064,l_sfka.sfka065,l_sfka.sfka066,l_sfka.sfka067,l_sfka.sfka068,l_sfka.sfka069,l_sfka.sfka070,
                           l_sfka.sfka071,l_sfka.sfka072,'',l_sfka.sfkaownid,l_sfka.sfkaowndp,l_sfka.sfkacrtid,l_sfka.sfkacrtdp,l_sfka.sfkacrtdt,l_sfka.sfkamodid,l_sfka.sfkamoddt,l_sfka.sfkacnfid,l_sfka.sfkacnfdt,l_sfka.sfkapstid,
                           l_sfka.sfkapstdt,'Y' )   
   
      #將sfkb_t複製到sfab_t
      DECLARE s_asft800_sfab_cur CURSOR FOR
         SELECT sfkbdocno,sfkb001,sfkb002,sfkb003,sfkb004,sfkb005,sfkb006,sfkb007,sfkbseq,sfkb008 
           FROM sfkb_t
          WHERE sfkbent = g_enterprise
            AND sfkbsite = g_site 
            AND sfkbdocno = p_sfkadocno
            AND sfkb900 = p_sfka900     
            
      FOREACH s_asft800_sfab_cur INTO l_sfkb2.sfkbdocno,l_sfkb2.sfkb001,l_sfkb2.sfkb002,l_sfkb2.sfkb003,l_sfkb2.sfkb004,
                                      l_sfkb2.sfkb005,l_sfkb2.sfkb006,l_sfkb2.sfkb007,l_sfkb2.sfkbseq,l_sfkb2.sfkb008
      
         INSERT INTO sfab_t (sfabent,sfabsite,sfabdocno,sfab001,sfab002,sfab003,sfab004,sfab005,sfab006,sfab007,sfabseq,sfab008)
                     VALUES (g_enterprise,g_site,l_sfkb2.sfkbdocno,l_sfkb2.sfkb001,l_sfkb2.sfkb002,l_sfkb2.sfkb003,l_sfkb2.sfkb004,
                             l_sfkb2.sfkb005,l_sfkb2.sfkb006,l_sfkb2.sfkb007,l_sfkb2.sfkbseq,l_sfkb2.sfkb008)
                             
      END FOREACH 
      
      #將sfkc_t複製到sfac_t
      DECLARE s_asft800_sfac_cur CURSOR FOR
         SELECT sfkcdocno,sfkc001,sfkc002,sfkc003,sfkc004,sfkc005,sfkcseq,sfkc006,sfkc007 FROM sfkc_t       
          WHERE sfkcent = g_enterprise
            AND sfkcsite = g_site 
            AND sfkcdocno = p_sfkadocno
            AND sfkc900 = p_sfka900  
            
      FOREACH s_asft800_sfac_cur INTO l_sfkc2.sfkcdocno,l_sfkc2.sfkc001,l_sfkc2.sfkc002,l_sfkc2.sfkc003,l_sfkc2.sfkc004,
                                      l_sfkc2.sfkc005,l_sfkc2.sfkcseq,l_sfkc2.sfkc006,l_sfkc2.sfkc007
                                      
         INSERT INTO sfac_t (sfacent,sfacsite,sfacdocno,sfac001,sfac002,sfac003,sfac004,sfac005,sfacseq,sfac006,sfac007)
                     VALUES (g_enterprise,g_site,l_sfkc2.sfkcdocno,l_sfkc2.sfkc001,l_sfkc2.sfkc002,l_sfkc2.sfkc003,l_sfkc2.sfkc004,
                             l_sfkc2.sfkc005,l_sfkc2.sfkcseq,l_sfkc2.sfkc006,l_sfkc2.sfkc007)
      END FOREACH 
      
      CALL s_asft300_02(p_sfkadocno,l_sfka.sfka003,l_sfka.sfka010,l_sfka.sfka011,l_sfka.sfka015,l_sfka.sfka012,'N') 
           RETURNING l_success,l_n
      IF NOT l_success THEN
         LET r_success = FALSE
      END IF 
      
      LET l_sql = " SELECT sfbaseq,sfbaseq1,sfba001,sfba002,sfba003,sfba004,sfba005,sfba006,sfba007,sfba008,sfba009,sfba010,sfba011,sfba012, ",
                  "        sfba013,sfba014,sfba015,sfba016,sfba017,sfba018,sfba019,sfba020,sfba021,sfba022,sfba023,sfba024,sfba025,sfba026, ",
                  "        sfba027,sfba028,sfba029,sfba030,sfba031,sfba032,sfba033,sfba034,sfba035,sfba036,sfba037 ",
                  "   FROM sfba_t ",
                  "  WHERE sfbaent = ",g_enterprise,
                  "    AND sfbadocno = '",p_sfkadocno,"'"
                  
      PREPARE s_asft800_sfba_sel FROM l_sql
      DECLARE s_asft800_sfba_cur CURSOR FOR s_asft800_sfba_sel  
      LET i = 1
      LET l_flag2 = 'Y'        #更新發料檔
      CALL l_sfba_new.clear()
      FOREACH s_asft800_sfba_cur INTO l_sfba_new[i].sfbaseq,l_sfba_new[i].sfbaseq1,l_sfba_new[i].sfba001,l_sfba_new[i].sfba002,l_sfba_new[i].sfba003,l_sfba_new[i].sfba004,l_sfba_new[i].sfba005,l_sfba_new[i].sfba006,l_sfba_new[i].sfba007,l_sfba_new[i].sfba008,l_sfba_new[i].sfba009,l_sfba_new[i].sfba010,l_sfba_new[i].sfba011,l_sfba_new[i].sfba012,
                                      l_sfba_new[i].sfba013,l_sfba_new[i].sfba014,l_sfba_new[i].sfba015,l_sfba_new[i].sfba016,l_sfba_new[i].sfba017,l_sfba_new[i].sfba018,l_sfba_new[i].sfba019,l_sfba_new[i].sfba020,l_sfba_new[i].sfba021,l_sfba_new[i].sfba022,l_sfba_new[i].sfba023,l_sfba_new[i].sfba024,l_sfba_new[i].sfba025,l_sfba_new[i].sfba026, 
                                      l_sfba_new[i].sfba027,l_sfba_new[i].sfba028,l_sfba_new[i].sfba029,l_sfba_new[i].sfba030,l_sfba_new[i].sfba031,l_sfba_new[i].sfba032,l_sfba_new[i].sfba033,l_sfba_new[i].sfba034,l_sfba_new[i].sfba035,l_sfba_new[i].sfba036,l_sfba_new[i].sfba037
         
         LET l_cnt = 0
         SELECT COUNT(1) INTO l_cnt FROM s_asft800_tmp5 WHERE sfbaent = g_enterprise AND sfbadocno = p_sfkadocno
                                     AND sfbaseq = l_sfba_new[i].sfbaseq AND sfbaseq1 = l_sfba_new[i].sfbaseq1
                                     AND sfba001 = l_sfba_new[i].sfba001 AND sfba002 = l_sfba_new[i].sfba002
                                     AND sfba003 = l_sfba_new[i].sfba003 AND sfba004 = l_sfba_new[i].sfba004
                                     AND sfba005 = l_sfba_new[i].sfba005 AND sfba006 = l_sfba_new[i].sfba006
                                     AND sfba021 = l_sfba_new[i].sfba021
         IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
         IF l_cnt = 0 THEN 
            LET l_type_new = '3'  #3.單身新增
            INSERT INTO s_asft800_tmp5 (sfbaent,sfbasite,sfbadocno,sfbaseq,sfbaseq1,sfba001,sfba002,sfba003,sfba004,sfba005,sfba006,sfba007,sfba008,sfba009,sfba010,sfba011,sfba012,
                                        sfba013,sfba014,sfba015,sfba016,sfba017,sfba018,sfba019,sfba020,sfba021,sfba022,sfba023,sfba024,sfba025,sfba026, 
                                        sfba027,sfba028,sfba029,sfba030,sfba031,sfba032,sfba033,sfba034,sfba035,sfba036,sfba037,btype)
                                VALUES (g_enterprise,g_site,p_sfkadocno,l_sfba_new[i].sfbaseq,l_sfba_new[i].sfbaseq1,l_sfba_new[i].sfba001,l_sfba_new[i].sfba002,l_sfba_new[i].sfba003,l_sfba_new[i].sfba004,l_sfba_new[i].sfba005,l_sfba_new[i].sfba006,l_sfba_new[i].sfba007,l_sfba_new[i].sfba008,l_sfba_new[i].sfba009,l_sfba_new[i].sfba010,l_sfba_new[i].sfba011,l_sfba_new[i].sfba012,
                                        l_sfba_new[i].sfba013,l_sfba_new[i].sfba014,l_sfba_new[i].sfba015,l_sfba_new[i].sfba016,l_sfba_new[i].sfba017,l_sfba_new[i].sfba018,l_sfba_new[i].sfba019,l_sfba_new[i].sfba020,l_sfba_new[i].sfba021,l_sfba_new[i].sfba022,l_sfba_new[i].sfba023,l_sfba_new[i].sfba024,l_sfba_new[i].sfba025,l_sfba_new[i].sfba026, 
                                        l_sfba_new[i].sfba027,l_sfba_new[i].sfba028,l_sfba_new[i].sfba029,l_sfba_new[i].sfba030,l_sfba_new[i].sfba031,l_sfba_new[i].sfba032,l_sfba_new[i].sfba033,l_sfba_new[i].sfba034,l_sfba_new[i].sfba035,l_sfba_new[i].sfba036,l_sfba_new[i].sfba037,l_type_new)
            IF SQLCA.SQLCODE THEN      
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = l_sfba_new[i].sfbaseq
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               LET r_success = FALSE
               CALL cl_err()
               EXIT FOREACH               
            END IF        
         ELSE      
            #把新展出的備料跟原來asft300的備料做比較，然後更新數量
            #已發數量
            LET l_sfba016_old = 0
            SELECT sfba013,sfba016,sfba015,sfba023,sfba024,sfba035 
              INTO l_sfba013_old,l_sfba016_old,l_sfba015_old,l_sfba023_old,l_sfba024_old,l_sfba035_old
              FROM s_asft800_tmp5 
             WHERE sfbaent = g_enterprise AND sfbadocno = p_sfkadocno
               AND sfbaseq = l_sfba_new[i].sfbaseq AND sfbaseq1 = l_sfba_new[i].sfbaseq1
               AND sfba001 = l_sfba_new[i].sfba001 AND sfba002 = l_sfba_new[i].sfba002
               AND sfba003 = l_sfba_new[i].sfba003 AND sfba004 = l_sfba_new[i].sfba004
               AND sfba005 = l_sfba_new[i].sfba005 AND sfba006 = l_sfba_new[i].sfba006
               AND sfba021 = l_sfba_new[i].sfba021
                                                    
            #依新的预计产出量展备料，并用新展出的应发数量更新原备料档应发数量，若更新后的应发量小于该备料的已发数量，给出提示、不可修改                                        
            IF l_sfba016_old > l_sfba_new[i].sfba013 THEN
               LET l_flag2 = 'N'
               EXIT FOREACH 
            ELSE
               IF l_sfba016_old = l_sfba_new[i].sfba013 THEN 
                  LET l_type_new = '1'  #1.未變更
               ELSE
                  LET l_type_new = '2'  #2.單身修改
                  UPDATE s_asft800_tmp5 SET sfba013 = l_sfba_new[i].sfba013,
                                            sfba015 = l_sfba_new[i].sfba015, 
                                            sfba023 = l_sfba_new[i].sfba023, 
                                            sfba024 = l_sfba_new[i].sfba024, 
                                            sfba035 = l_sfba_new[i].sfba035, 
                                            btype = l_type_new
                   WHERE sfbaent = g_enterprise AND sfbadocno = p_sfkadocno
                     AND sfbaseq = l_sfba_new[i].sfbaseq AND sfbaseq1 = l_sfba_new[i].sfbaseq1
                     AND sfba001 = l_sfba_new[i].sfba001 AND sfba002 = l_sfba_new[i].sfba002
                     AND sfba003 = l_sfba_new[i].sfba003 AND sfba004 = l_sfba_new[i].sfba004
                     AND sfba005 = l_sfba_new[i].sfba005 AND sfba006 = l_sfba_new[i].sfba006
                     AND sfba021 = l_sfba_new[i].sfba021 
                     
                  IF SQLCA.SQLCODE THEN      
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = l_sfba_new[i].sfbaseq
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     LET r_success = FALSE
                     CALL cl_err()
                     EXIT FOREACH               
                  END IF 

               END IF                   
            END IF
         END IF

         IF l_type_new = '3' OR l_sfba_new[i].sfba013 != l_sfba013_old THEN
            #其說明的SQL
            LET g_sfkh007 = ""
            IF NOT s_asft800_ins_sfkh(p_sfkadocno,l_sfba_new[i].sfbaseq,l_sfba_new[i].sfbaseq1,p_sfka900,'sfba013','1',l_sfba013_old,l_sfba_new[i].sfba013,g_sfkh007) THEN
               LET r_success = FALSE
               RETURN r_success
            END IF
         ELSE
            IF NOT s_asft800_del_sfkh(p_sfkadocno,l_sfba_new[i].sfbaseq,l_sfba_new[i].sfbaseq1,p_sfka900,'sfba013') THEN
               LET r_success = FALSE
               RETURN r_success
            END IF
         END IF
         IF l_type_new = '3' OR l_sfba_new[i].sfba023 != l_sfba023_old THEN
            #其說明的SQL
            LET g_sfkh007 = ""
            IF NOT s_asft800_ins_sfkh(p_sfkadocno,l_sfba_new[i].sfbaseq,l_sfba_new[i].sfbaseq1,p_sfka900,'sfba023','1',l_sfba023_old,l_sfba_new[i].sfba023,g_sfkh007) THEN
               LET r_success = FALSE
               RETURN r_success
            END IF
         ELSE
            IF NOT s_asft800_del_sfkh(p_sfkadocno,l_sfba_new[i].sfbaseq,l_sfba_new[i].sfbaseq1,p_sfka900,'sfba023') THEN
               LET r_success = FALSE
               RETURN r_success
            END IF
         END IF  

         IF l_type_new = '3' OR l_sfba_new[i].sfba024 != l_sfba024_old THEN
            #其說明的SQL
            LET g_sfkh007 = ""
            IF NOT s_asft800_ins_sfkh(p_sfkadocno,l_sfba_new[i].sfbaseq,l_sfba_new[i].sfbaseq1,p_sfka900,'sfba024','1',l_sfba024_old,l_sfba_new[i].sfba024,g_sfkh007) THEN
               LET r_success = FALSE
               RETURN r_success
            END IF
         ELSE
            IF NOT s_asft800_del_sfkh(p_sfkadocno,l_sfba_new[i].sfbaseq,l_sfba_new[i].sfbaseq1,p_sfka900,'sfba024') THEN
               LET r_success = FALSE
               RETURN r_success
            END IF
         END IF
         
         IF l_type_new = '3' OR l_sfba_new[i].sfba035 != l_sfba035_old THEN
            #其說明的SQL
            LET g_sfkh007 = ""
            IF NOT s_asft800_ins_sfkh(p_sfkadocno,l_sfba_new[i].sfbaseq,l_sfba_new[i].sfbaseq1,p_sfka900,'sfba035','1',l_sfba035_old,l_sfba_new[i].sfba035,g_sfkh007) THEN
               LET r_success = FALSE
               RETURN r_success
            END IF
         ELSE
            IF NOT s_asft800_del_sfkh(p_sfkadocno,l_sfba_new[i].sfbaseq,l_sfba_new[i].sfbaseq1,p_sfka900,'sfba035') THEN
               LET r_success = FALSE
               RETURN r_success
            END IF
         END IF         
         
         LET i = i + 1
      END FOREACH 
      
      CALL l_sfba_new.deleteElement(l_sfba_new.getLength())
      
      #原來有現在沒有的資料比對#20180413
      IF l_flag2 = 'Y' THEN
   
         LET l_sql = " SELECT A.sfbaseq,A.sfbaseq1,A.sfba001,A.sfba002,A.sfba003,A.sfba004,A.sfba005,A.sfba006,A.sfba021,A.sfba016,A.sfba013 ",
                     "   FROM s_asft800_tmp5 A  ",
                     "  WHERE A.sfbaseq||A.sfbaseq1||A.sfba001||A.sfba002||A.sfba003||A.sfba004||A.sfba005||A.sfba006||A.sfba021 NOT IN ",
                     " (SELECT B.sfbaseq||B.sfbaseq1||B.sfba001||B.sfba002||B.sfba003||B.sfba004||B.sfba005||B.sfba006||B.sfba021 AS keyno FROM sfba_t B ",
                     "   WHERE sfbaent = ",g_enterprise," AND sfbadocno = '",p_sfkadocno,"')"                  
   
                     
         PREPARE s_asft800_sfba_sel2 FROM l_sql
         DECLARE s_asft800_sfba_cur2 CURSOR FOR s_asft800_sfba_sel2
         FOREACH s_asft800_sfba_cur2 INTO l_sfba_old.sfbaseq,l_sfba_old.sfbaseq1,l_sfba_old.sfba001,l_sfba_old.sfba002,l_sfba_old.sfba003,l_sfba_old.sfba004,
                                          l_sfba_old.sfba005,l_sfba_old.sfba006,l_sfba_old.sfba021,l_sfba_old.sfba016,l_sfba_old.sfba013
               
            #如果已經發料            
            IF l_sfba_old.sfba016 > 0 THEN   
               LET l_flag2 = 'N'  #不可以變更
            ELSE
               LET l_type_new = '2' #單身修改
               UPDATE s_asft800_tmp5 SET sfba013 = 0,
                                         sfba023 = 0,
                                         sfba024 = 0,
                                         sfba015 = 0,
                                         sfba016 = 0,
                                         sfba025 = 0,
                                           btype = l_type_new
                                   WHERE sfbaent = g_enterprise   
                                     AND sfbadocno = p_sfkadocno
                                     AND sfbaseq = l_sfba_old.sfbaseq
                                     AND sfbaseq1 = l_sfba_old.sfbaseq1   
               IF SQLCA.SQLCODE THEN      
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = l_sfba_old.sfbaseq
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  LET r_success = FALSE
                  CALL cl_err()
                  EXIT FOREACH               
               END IF   

               IF l_type_new = '3' OR l_sfba013_old <> 0 THEN
                  #其說明的SQL
                  LET g_sfkh007 = ""
                  IF NOT s_asft800_ins_sfkh(p_sfkadocno,l_sfba_old.sfbaseq,l_sfba_old.sfbaseq1,p_sfka900,'sfba013','1',l_sfba013_old,0,g_sfkh007) THEN
                     LET r_success = FALSE
                     RETURN r_success
                  END IF
               ELSE
                  IF NOT s_asft800_del_sfkh(p_sfkadocno,l_sfba_old.sfbaseq,l_sfba_old.sfbaseq1,p_sfka900,'sfba013') THEN
                     LET r_success = FALSE
                     RETURN r_success
                  END IF
               END IF
               IF l_type_new = '3' OR l_sfba023_old <> 0 THEN
                  #其說明的SQL
                  LET g_sfkh007 = ""
                  IF NOT s_asft800_ins_sfkh(p_sfkadocno,l_sfba_old.sfbaseq,l_sfba_old.sfbaseq1,p_sfka900,'sfba023','1',l_sfba023_old,0,g_sfkh007) THEN
                     LET r_success = FALSE
                     RETURN r_success
                  END IF
               ELSE
                  IF NOT s_asft800_del_sfkh(p_sfkadocno,l_sfba_old.sfbaseq,l_sfba_old.sfbaseq1,p_sfka900,'sfba023') THEN
                     LET r_success = FALSE
                     RETURN r_success
                  END IF
               END IF  
             
               IF l_type_new = '3' OR l_sfba024_old <> 0 THEN
                  #其說明的SQL
                  LET g_sfkh007 = ""
                  IF NOT s_asft800_ins_sfkh(p_sfkadocno,l_sfba_old.sfbaseq,l_sfba_old.sfbaseq1,p_sfka900,'sfba024','1',l_sfba024_old,0,g_sfkh007) THEN
                     LET r_success = FALSE
                     RETURN r_success
                  END IF
               ELSE
                  IF NOT s_asft800_del_sfkh(p_sfkadocno,l_sfba_old.sfbaseq,l_sfba_old.sfbaseq1,p_sfka900,'sfba024') THEN
                     LET r_success = FALSE
                     RETURN r_success
                  END IF
               END IF
               
               IF l_type_new = '3' OR l_sfba035_old <> 0 THEN
                  #其說明的SQL
                  LET g_sfkh007 = ""
                  IF NOT s_asft800_ins_sfkh(p_sfkadocno,l_sfba_old.sfbaseq,l_sfba_old.sfbaseq1,p_sfka900,'sfba035','1',l_sfba035_old,0,g_sfkh007) THEN
                     LET r_success = FALSE
                     RETURN r_success
                  END IF
               ELSE
                  IF NOT s_asft800_del_sfkh(p_sfkadocno,l_sfba_old.sfbaseq,l_sfba_old.sfbaseq1,p_sfka900,'sfba035') THEN
                     LET r_success = FALSE
                     RETURN r_success
                  END IF
               END IF      
         
            END IF 
                                          
         END FOREACH 
         
      END IF 
   
      #若可以變更，s_asft800_tmp5資料複製到sfkg_t
      IF l_flag2 = 'Y' THEN 
         #刪除原來單身資料
         DELETE FROM sfkg_t WHERE sfkgent = g_enterprise AND sfkgdocno = p_sfkadocno AND sfkg900 = p_sfka900
         #LET l_sql = " SELECT * FROM s_asft800_tmp5 ", 
         LET l_sql = " SELECT sfbaent,sfbasite,sfbadocno,sfbaseq,sfbaseq1,sfba001,sfba002,sfba003,sfba004,sfba005,sfba006,sfba007,sfba008,sfba009,sfba010,",
                     "        sfba011,sfba012,sfba013,sfba014,sfba015,sfba016,sfba017,sfba018,sfba019,sfba020,sfba021,sfba022,sfba023,sfba024,sfba025,sfba026,",
                     "        sfba027,sfba028,sfba029,sfba030,sfba031,sfba032,sfba033,sfba034,sfba035,sfba036,sfba037,btype ",
                     "   FROM s_asft800_tmp5 ", 
                     "  WHERE 1=1 "
         PREPARE s_asft800_tmp_sel FROM l_sql
         DECLARE s_asft800_tmp_cur CURSOR FOR s_asft800_tmp_sel
         
         FOREACH s_asft800_tmp_cur INTO l_sfba_old.sfbaent,l_sfba_old.sfbasite,l_sfba_old.sfbadocno,l_sfba_old.sfbaseq,l_sfba_old.sfbaseq1,l_sfba_old.sfba001,l_sfba_old.sfba002,l_sfba_old.sfba003,l_sfba_old.sfba004,l_sfba_old.sfba005,l_sfba_old.sfba006,l_sfba_old.sfba007,l_sfba_old.sfba008,l_sfba_old.sfba009,l_sfba_old.sfba010,
                                        l_sfba_old.sfba011,l_sfba_old.sfba012,l_sfba_old.sfba013,l_sfba_old.sfba014,l_sfba_old.sfba015,l_sfba_old.sfba016,l_sfba_old.sfba017,l_sfba_old.sfba018,l_sfba_old.sfba019,l_sfba_old.sfba020,l_sfba_old.sfba021,l_sfba_old.sfba022,l_sfba_old.sfba023,l_sfba_old.sfba024,l_sfba_old.sfba025,l_sfba_old.sfba026,
                                        l_sfba_old.sfba027,l_sfba_old.sfba028,l_sfba_old.sfba029,l_sfba_old.sfba030,l_sfba_old.sfba031,l_sfba_old.sfba032,l_sfba_old.sfba033,l_sfba_old.sfba034,l_sfba_old.sfba035,l_sfba_old.sfba036,l_sfba_old.sfba037,l_sfkg901             
            LET l_sfkg902 = g_today
            LET l_sfkg904 = ''
            LET l_sfkg905 = ''      
            #新增單身資料
            INSERT INTO sfkg_t (sfkgent,sfkgsite,sfkgdocno,sfkgseq,sfkgseq1,sfkg001,sfkg002,sfkg003,sfkg004,sfkg005,sfkg006,sfkg007,sfkg008,sfkg009,sfkg010,sfkg011,
                                sfkg012,sfkg013,sfkg014,sfkg015,sfkg016,sfkg017,sfkg018,sfkg019,sfkg020,sfkg021,sfkg022,sfkg023,sfkg024,sfkg025,sfkg026,
                                sfkg027,sfkg028,sfkg900,sfkg901,sfkg902,sfkg904,sfkg905,sfkg029,sfkg030,sfkg031,sfkg032,sfkg033,sfkg034,sfkg035,sfkg036)
                        VALUES (g_enterprise,g_site,p_sfkadocno,l_sfba_old.sfbaseq,l_sfba_old.sfbaseq1,l_sfba_old.sfba001,l_sfba_old.sfba002,l_sfba_old.sfba003,l_sfba_old.sfba004,l_sfba_old.sfba005,l_sfba_old.sfba006,l_sfba_old.sfba007,l_sfba_old.sfba008,l_sfba_old.sfba009,l_sfba_old.sfba010,l_sfba_old.sfba011,l_sfba_old.sfba012,
                                         l_sfba_old.sfba013,l_sfba_old.sfba014,l_sfba_old.sfba015,l_sfba_old.sfba016,l_sfba_old.sfba017,l_sfba_old.sfba018,l_sfba_old.sfba019,l_sfba_old.sfba020,l_sfba_old.sfba021,l_sfba_old.sfba022,l_sfba_old.sfba023,l_sfba_old.sfba024,l_sfba_old.sfba025,l_sfba_old.sfba026, 
                                         l_sfba_old.sfba027,l_sfba_old.sfba028,p_sfka900,l_sfkg901,l_sfkg902,l_sfkg904,l_sfkg905,l_sfba_old.sfba029,l_sfba_old.sfba030,l_sfba_old.sfba031,l_sfba_old.sfba032,l_sfba_old.sfba033,l_sfba_old.sfba034,l_sfba_old.sfba035,l_sfba_old.sfba036)
            IF SQLCA.SQLCODE THEN      
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = l_sfba_old.sfbaseq
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               LET r_success = FALSE
               CALL cl_err()
               EXIT FOREACH               
            END IF 
         END FOREACH 
      ELSE
         #不可以變更
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = ''
         LET g_errparam.code   = "asf-00372"
         LET g_errparam.popup  = TRUE 
         LET r_success = FALSE
         CALL cl_err()      
      END IF 
     
      #臨時表資料還原asft300
      DELETE FROM sfaa_t WHERE sfaaent = g_enterprise AND sfaadocno = p_sfkadocno
      DELETE FROM sfab_t WHERE sfabent = g_enterprise AND sfabdocno = p_sfkadocno 
      DELETE FROM sfac_t WHERE sfacent = g_enterprise AND sfacdocno = p_sfkadocno
      DELETE FROM sfba_t WHERE sfbaent = g_enterprise AND sfbadocno = p_sfkadocno
      LET l_sql = " INSERT INTO sfaa_t SELECT * FROM s_asft800_tmp WHERE 1 = 1 "
      PREPARE s_asft800_sfaa FROM l_sql
      EXECUTE s_asft800_sfaa           
      LET l_sql = " INSERT INTO sfab_t SELECT * FROM s_asft800_tmp2 WHERE 1 = 1 "
      PREPARE s_asft800_sfab FROM l_sql
      EXECUTE s_asft800_sfab           
      LET l_sql = " INSERT INTO sfac_t SELECT * FROM s_asft800_tmp3 WHERE 1 = 1 "
      PREPARE s_asft800_sfac FROM l_sql
      EXECUTE s_asft800_sfac           
      LET l_sql = " INSERT INTO sfba_t SELECT * FROM s_asft800_tmp4 WHERE 1 = 1 "
      PREPARE s_asft800_sfba FROM l_sql
      EXECUTE s_asft800_sfba           
   END IF   

   RETURN r_success
   
END FUNCTION

 
{</section>}
 
