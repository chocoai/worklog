#該程式未解開Section, 採用最新樣板產出!
#該程式為freestyle程式!
{<section id="s_purchase_price.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0046(1900-01-01 00:00:00), PR版次:0046(2017-11-22 17:43:19)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000183
#+ Filename...: s_purchase_price
#+ Description: 採購價格應用元件
#+ Creator....: 00531(2014-06-30 10:17:56)
#+ Modifier...: 00000 -SD/PR- 08525
 
{</section>}
 
{<section id="s_purchase_price.global" type="s" >}
#應用 p00 樣板自動產生(Version:6)
#add-point:填寫註解說明 name="main.memo"
#151118-00004#1   2015/11/11 By Shiun     pmam001改pmamstus 
#151110-00024#1   2015/12/04 By ming      彈性格價取價增加「國家」與「付款條件」為空白的情況
#160119-00008#1   2016/01/29 By Ann_Huang 多一個變數紀錄單據日期，用來判斷取價方式的生/失效日期
#150702-00011#1   2016/03/24 By xianghui  累计量定价抓取最大数量时应需小于等于相应的累计数量
#160413-00011#8   2016/04/19 By xianghui  效能优化
#160127-00036#1   2016/04/29 By lixiang   取採購合約价時，如當前料號沒有取到，則用合約替代料取價
#160616-00017#1   2016/06/16 By xianghui  抓取核价档资料时需要倒序排序，抓取最新的核价单单价
#160627-00012#1   2016/06/30 By Polly     調整的單價修改控管方式檢核
#160621-00003#9   2016/07/23 By Sarah     因單據通路欄位調整為非必填,取價元件配合調整為不須判斷通路欄位是否為空值
#160523-00012#1   2016/08/02 By Mandy     FUNCTION s_purchase_price_apmt480_1()內的l_p_sql SQL異常 導致當apmt480 的限定交易條件(pmdx012='N'),交易條件(pmdx011 = NULL)時撈不到資料
#160919-00041#1   2016/09/20 By wuxja     FUNCTION s_purchase_price_apmt440_2里sql没有针对pmdi019是null的处理
#161116-00041#1   2016/11/24 By shiun     取價時，先抓取料號+產品特徵符合的資料，抓不到再抓取料號無產品特徵的資料
#161227-00014#1   2017/01/04 By lixiang   采购合约替代时，应用单身料号去匹配可替代的料号
#170112-00048#1   2017/01/12 By lixiang   抓取最近交易最低采购单价时，应抓最低价格
#170303-00051#1   2017/03/06 By zhaoqya   修正#160616-00017#1，取同一天核价的核价单，取核价单价时增加对单号的排序
#170325-00067#1   2017/03/27 By lixiang   修正抓取料件标准价、采购价格表为取价来源时，抓取的价格错误的问题
#170324-00085#1   2017/03/28 By lixiang   抓取询价资料时，需考虑付款条件，交易条件为空的情况
#170329-00032#1   2017/03/29 By 02111     FUNCTION s_purchase_price_apmt440_1()，pmdj002 沒有考慮 NULL 的情況。
#170417-00014#1   2017/04/17 By 07804     FUNCTION s_purchase_price()，判斷委外條件時 pmdj006和pmdj007 沒有考慮 NULL 的情況
#170516-00077#1   2017/05/17 By ouhz      调整apmt500取价方式选择10(采购价格表)后，取价错误问题
#170617-00175#1   2017/06/18 By ouhz      调整工单生成委外采购单取价方式选择核价单后，取价错误问题
#170620-00050#1   2017/07/06 By 08993     修正若核價單的核價使用控制為2或3時，新增不同據點採購單時出現取不到單價的問題
#170713-00035#1   2017/07/14 By ywtsai    修正判斷是否符合定量計價滿足最小數量的判斷方式問題
#170724-00061#1   2017/07/25 By Mandy     取核價檔,分量計價取不到時,不應直接取數量取大的單價
#170619-00017#1   2017/07/27 By zhujing   修正取价时：1.採購量小於詢價單的最低採購數量時，不可取到單價
#                                                    2.採購日期大於有效日期時，也不可取到單價
#170726-00009#1   2017/07/31 By ywtsai    修正若取不到單價就不控卡容差率
#170619-00024#2   2017/08/15 By lixh      取價時增加判斷，已轉量/金額+採購未確認量/金額(取價為合約的)+此單據數量/金額，依單頭設定超過合約數量(金額)時，不可取價成功
#170728-00006#1   2017/08/18 By ywtsai    修正判斷分量計價時，若核價使用管制為同集團適用，就不需判斷據點條件
#170926-00008#1   2017/09/26 By 01258     修正此单：170617-00175#1，防止无限制时取不到价格的问题
#170828-00028#9   2017/10/24 By 10046     合約取價時，因為當前的採購單還沒生效，所以取價的目標數量不包含當前這張採購單的數量
#170816-00007#126 2017/11/09 By 09773     調整公用元件錯誤訊息,顯示更明確的資訊內容
#171121-00046#1   2017/11/22 By 08525     核价币别和据点币别不同时，要先将核价金额推算陈基础币别金额，再推算交易币别金额
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
 
{<section id="s_purchase_price.free_style_variable" type="s" >}
#add-point:free_style模組變數(Module Variable) name="free_style.variable"

#end add-point
 
{</section>}
 
{<section id="s_purchase_price.global_variable" type="s" >}
#add-point:自定義模組變數(Module Variable) name="global.variable"
DEFINE g_order      LIKE type_t.num5   #170325-00067#1
#170816-00007#126 by 09773 add(S)
DEFINE g_colname_1   STRING   
DEFINE g_comment_1   STRING       
DEFINE g_msg         STRING   #錯誤訊息
#170816-00007#126 by 09773 add(E)

#end add-point
 
{</section>}
 
{<section id="s_purchase_price.other_dialog" type="s" >}

 
{</section>}
 
{<section id="s_purchase_price.other_function" readonly="Y" type="s" >}

################################################################################
# Descriptions...: 依據取價方式抓取採購單價
# Memo...........:
# Usage..........: CALL s_purchase_price_get(p_mode,p_client,p_item,p_feature,p_curr,p_tax,p_con1,p_con2,p_path,p_docno,p_date,p_unit,p_qty,p_site,p_export,p_type,p_job,p_process)
#                  RETURNING r_source,r_price,r_docno,r_seq
# Input parameter: p_mode    取價方式
#                : p_client  供應商編號
#                : p_item    料件編號
#                : p_feature 產品特徵
#                : p_curr    幣別
#                : p_tax     稅別
#                : p_con1    付款條件
#                : p_con2    交易條件
#                : p_path    採購通路
#                : p_docno   單據編號
#                : p_date    單據日期
#                : p_unit    計價單位
#                : p_qty     計價數量
#                : p_site    營運據點
#                : p_export  內外購(1.內購、2.外購)
#                : p_type    單價類型(1.一般，2.委外)
#                : p_job     作業編號
#                : p_process 製程序
# Return code....: r_source  取價來源
#                : r_price   取出單價
#                : r_docno   參考單號
#                : r_seq     參考項次
# Date & Author..: 140630By pengu
# Modify.........:
################################################################################
PUBLIC FUNCTION s_purchase_price_get(p_mode,p_client,p_item,p_feature,p_curr,p_tax,p_con1,p_con2,p_path,p_docno,p_date,p_unit,p_qty,p_site,p_export,p_type,p_job,p_process)
DEFINE p_mode       LIKE pmam_t.pmam001
DEFINE p_client     LIKE pmdl_t.pmdl004
DEFINE p_item       LIKE pmdn_t.pmdn001
DEFINE p_feature    LIKE pmdn_t.pmdn002
DEFINE p_curr       LIKE pmdl_t.pmdl015
DEFINE p_tax        LIKE pmdl_t.pmdl011
DEFINE p_con1       LIKE pmdl_t.pmdl009
DEFINE p_con2       LIKE pmdl_t.pmdl010
DEFINE p_path       LIKE pmdl_t.pmdl023
DEFINE p_docno      LIKE pmdl_t.pmdldocno
DEFINE p_date       LIKE pmdl_t.pmdldocdt
DEFINE p_unit       LIKE pmdn_t.pmdn010
DEFINE p_qty        LIKE pmdn_t.pmdn011
DEFINE p_site       LIKE pmdl_t.pmdlsite
DEFINE p_export     LIKE pmdl_t.pmdl054
DEFINE p_type       LIKE type_t.chr1
DEFINE p_job        LIKE pmdn_t.pmdn004
DEFINE p_process    LIKE pmdn_t.pmdn005
DEFINE r_source     LIKE pman_t.pman001
DEFINE r_price      LIKE pmdn_t.pmdn043
DEFINE r_docno      LIKE pmdn_t.pmdn041
DEFINE r_seq        LIKE pmdn_t.pmdn042
DEFINE l_scc40      LIKE type_t.chr2
DEFINE l_success    LIKE type_t.num5
DEFINE l_qty        LIKE xmdc_t.xmdc011
DEFINE l_face       LIKE inaj_t.inaj014
DEFINE l_ooef016    LIKE ooef_t.ooef016
DEFINE l_ooef017    LIKE ooef_t.ooef017
DEFINE l_imaa  RECORD
    imaa006    LIKE imaa_t.imaa006,
    imaa009    LIKE imaa_t.imaa009,
    imaa127    LIKE imaa_t.imaa127
           END RECORD
DEFINE l_pmaw001    LIKE pmaw_t.pmaw001
DEFINE l_pmam006    LIKE pmam_t.pmam006
DEFINE l_pman004    LIKE pman_t.pman004
DEFINE l_pman005    LIKE pman_t.pman005
DEFINE l_date       LIKE pmdl_t.pmdldocdt
DEFINE l_date2      LIKE pmdl_t.pmdldocdt       #單據日期   #160119-00008#1 By Ann_Huang --- add
DEFINE l_sql        STRING 
#151110-00024#1 20151204 add by ming -----(S)   
DEFINE l_sql1       STRING
DEFINE l_sql2       STRING
#151110-00024#1 20151204 add by ming -----(E)  
DEFINE l_p_sql      STRING
DEFINE l_rate       LIKE ooan_t.ooan005
DEFINE l_pmdg  RECORD
    pmdg010    LIKE pmdg_t.pmdg010,
    pmdg009    LIKE pmdg_t.pmdg009,
    pmdgdocno  LIKE pmdg_t.pmdgdocno,
    pmdgseq    LIKE pmdg_t.pmdgseq
           END RECORD
DEFINE l_pmdh003    LIKE pmdh_t.pmdh003
DEFINE l_pmdh004    LIKE pmdh_t.pmdh004
DEFINE l_oofb012    LIKE oofb_t.oofb012
DEFINE l_oofb014    LIKE oofb_t.oofb014
DEFINE l_gzzz004    LIKE gzzz_t.gzzz004
#用來記錄彈性價格對應作業的第7個參數值
DEFINE ld_arr  DYNAMIC ARRAY OF RECORD
    lc_gzzc002 LIKE gzzc_t.gzzc002,     #參數序號
    lc_value   LIKE type_t.chr20,       #參數數值
    li_entry   LIKE type_t.num5,        #是否可以輸入
    li_return  LIKE type_t.num5         #是否需要回傳
           END RECORD
DEFINE l_pmas  RECORD
    pmas002    LIKE pmas_t.pmas002,
    pmas003    LIKE pmas_t.pmas003,
    pmas004    LIKE pmas_t.pmas004,
    pmas005    LIKE pmas_t.pmas005,
    pmas006    LIKE pmas_t.pmas006,
    pmas007    LIKE pmas_t.pmas007,
    pmas008    LIKE pmas_t.pmas008,
    pmas009    LIKE pmas_t.pmas009,
    pmas010    LIKE pmas_t.pmas010,
    pmas011    LIKE pmas_t.pmas011,
    pmas012    LIKE pmas_t.pmas012,
    pmas013    LIKE pmas_t.pmas013
           END RECORD
DEFINE l_pmau  RECORD
    pmau002    LIKE pmau_t.pmau002,
    pmau006    LIKE pmau_t.pmau006,
    pmau012    LIKE pmau_t.pmau012,
    pmau013    LIKE pmau_t.pmau013,
    pmau014    LIKE pmau_t.pmau014,
    pmau015    LIKE pmau_t.pmau015,
    pmau016    LIKE pmau_t.pmau016,
    pmau017    LIKE pmau_t.pmau017,
    pmau019    LIKE pmau_t.pmau019,
    pmau020    LIKE pmau_t.pmau020,
    pmau021    LIKE pmau_t.pmau021,
    pmau031    LIKE pmau_t.pmau031,
    pmau032    LIKE pmau_t.pmau032
           END RECORD
#151118-00022 by whitney add start
DEFINE l_oodb005    LIKE oodb_t.oodb005
DEFINE l_oodb006    LIKE oodb_t.oodb006
#151118-00022 by whitney add end
#160127-00036#1--add---begin---
DEFINE l_imaf163     LIKE imaf_t.imaf163
DEFINE l_pmaq003     LIKE pmaq_t.pmaq003
DEFINE l_pmaq006     LIKE pmaq_t.pmaq006
#160127-00036#1--add---begin---
DEFINE l_pmaq003_o   LIKE pmaq_t.pmaq003  #161227-00014#1
DEFINE l_cnt         LIKE type_t.num10    #161227-00014#1
DEFINE l_pmaq002     LIKE pmaq_t.pmaq002  #161227-00014#1

   WHENEVER ERROR CONTINUE

   LET r_source = ''
   LET r_price  = ''
   LET r_docno  = ''
   LET r_seq    = ''
   
   #170816-00007#126 by 09773 mod(S)
   #參數檢核
#   IF cl_null(p_mode) OR cl_null(p_client) OR cl_null(p_item) OR
#      cl_null(p_curr) OR cl_null(p_tax)    OR cl_null(p_con1) OR
##160621-00003#9-s mod
##因單據通路欄位調整為非必填,取價元件配合調整為不須判斷通路欄位是否為空值
##     cl_null(p_con2) OR cl_null(p_path)   OR cl_null(p_date) OR
#      cl_null(p_con2) OR cl_null(p_date)   OR
##160621-00003#9-e mod
#      cl_null(p_unit) OR cl_null(p_qty)    OR cl_null(p_type) OR
#      cl_null(p_export) THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = 'sub-00280'
#      LET g_errparam.extend = 's_purchase_price_get'
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#      RETURN r_source,r_price,r_docno,r_seq
#   END IF
   #170816-00007#126 by 09773 mod(E)
   
   #170816-00007#126 by 09773 add(S)
   #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_mode) THEN
      CALL s_azzi902_get_gzzd("apmp620","lbl_b_xmda017") RETURNING g_colname_1,g_comment_1  #取價方式 
      LET g_msg = g_colname_1   
   END IF
   IF cl_null(p_client) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''    
      CALL s_azzi902_get_gzzd("aapp832","lbl_apdd001") RETURNING g_colname_1,g_comment_1   #供應商編號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_item) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''    
      CALL s_azzi902_get_gzzd("adbt510","lbl_imaa001") RETURNING g_colname_1,g_comment_1   #料件編號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_curr) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''    
      CALL s_azzi902_get_gzzd("aapp135","lbl_b2_isam014") RETURNING g_colname_1,g_comment_1   #幣別
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_tax) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''    
      CALL s_azzi902_get_gzzd("aapp135","lbl_b2_isam012") RETURNING g_colname_1,g_comment_1   #稅別
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_con1) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''    
      CALL s_azzi902_get_gzzd("aapp131","lbl_apca008") RETURNING g_colname_1,g_comment_1   #付款條件
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_con2) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''    
      CALL s_azzi902_get_gzzd("aapq932","lbl_pmab037") RETURNING g_colname_1,g_comment_1   #交易條件
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_date) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''    
      CALL s_azzi902_get_gzzd("aapp350","lbl_isafdocdt") RETURNING g_colname_1,g_comment_1   #單據日期
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_unit) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''    
      CALL s_azzi902_get_gzzd("adbq500","lbl_xmdd026") RETURNING g_colname_1,g_comment_1   #計價單位
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_qty) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''    
      CALL s_azzi902_get_gzzd("aapt331","apcb007") RETURNING g_colname_1,g_comment_1   #計價數量
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_type) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''    
      CALL s_azzi902_get_gzzd("apmt510","lbl_type_price") RETURNING g_colname_1,g_comment_1   #單價類型
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_export) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''    
      CALL s_azzi902_get_gzzd("aapq370","lbl_buy") RETURNING g_colname_1,g_comment_1   #內外購
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF NOT cl_null(g_msg) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00788'  #%1傳入值為空(錯誤)
      LET g_errparam.extend = 's_purchase_price_get'
      LET g_errparam.popup = TRUE
      LET g_errparam.replace[1] = g_msg
      CALL cl_err()
      
      RETURN r_source,r_price,r_docno,r_seq
   END IF   
   #170816-00007#126 by 09773 add(E)
   
   IF cl_null(p_site) THEN LET p_site = g_site END IF
   IF cl_null(p_feature) THEN LET p_feature = ' ' END IF

   #依據傳入內外購參數判斷匯率的來源
   CASE p_export
      WHEN '1'  #內購外幣採用匯率類型
         CALL cl_get_para(g_enterprise,p_site,'S-BAS-0014') RETURNING l_scc40
      WHEN '2'  #外購外幣採用匯率類型
         CALL cl_get_para(g_enterprise,p_site,'S-BAS-0015') RETURNING l_scc40
      OTHERWISE EXIT CASE
   END CASE

   #抓取營運據點跟價格有關的相關資料
   LET l_ooef016 = ''
   LET l_ooef017 = ''
   SELECT ooef016,ooef017
     INTO l_ooef016,l_ooef017
     FROM ooef_t
    WHERE ooefent = g_enterprise
      AND ooef001 = p_site
      AND ooefstus = 'Y'

   INITIALIZE l_imaa.* TO NULL
   SELECT imaa006,imaa009,imaa127
     INTO l_imaa.imaa006,l_imaa.imaa009,l_imaa.imaa127
     FROM imaa_t
    WHERE imaaent = g_enterprise
      AND imaa001 = p_item
      AND imaastus = 'Y'
   #計算採購單位與料件基礎單位的換算率
    IF NOT cl_null(l_imaa.imaa006) AND l_imaa.imaa006 <> p_unit THEN
       CALL s_aooi250_convert_qty(p_item,p_unit,l_imaa.imaa006,p_qty) RETURNING l_success,l_qty
#      CALL s_aimi190_get_convert(p_item,l_imaa.imaa006,p_unit) RETURNING l_success_1,l_face
       IF l_success THEN
          LET l_face = p_qty / l_qty
       ELSE
          LET l_face = 1
       END IF
    ELSE
       LET l_face = 1
    END IF

   #151118-00022 by whitney add start
   LET l_oodb005 = ''
   LET l_oodb006 = ''
   SELECT oodb005,COALESCE(oodb006,0)
     INTO l_oodb005,l_oodb006
     FROM oodb_t,ooef_t
    WHERE oodb002  = p_tax
      AND oodb001  = ooef019
      AND oodbent  = ooefent
      AND ooefent = g_enterprise
      AND ooef001 = p_site
      AND ooefstus = 'Y'
   #151118-00022 by whitney add end

   #依據傳入的營運據點抓取採購價格參照表
   LET l_pmaw001 = cl_get_para(g_enterprise,p_site,'S-BAS-0021')

   #依據傳入的'取價方式'抓取對應的取價方式設定檔(pmam_t與pman_t)資料
   LET l_pmam006 = ''
   SELECT pmam006 INTO l_pmam006
     FROM pmam_t
    WHERE pmament = g_enterprise
      AND pmam001 = p_mode
      AND pmamstus = 'Y'   #modify--151118-00004#1--By shiun--pmam001改pmamstus

   LET l_pman004 = ''
   LET l_pman005 = ''
   DECLARE s_purchase_price_get_pman_cur CURSOR FOR
      SELECT pman003,pman004,pman005
        FROM pman_t
       WHERE pmanent = g_enterprise
         AND pman001 = p_mode
       ORDER BY pman002
   FOREACH s_purchase_price_get_pman_cur INTO r_source,l_pman004,l_pman005
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF

      #單據日期往前推'計算月數'的日期
      IF NOT cl_null(l_pman004) THEN
         LET l_pman004 = - l_pman004
         CALL s_date_get_date(p_date,l_pman004,0) RETURNING l_date
         LET l_date2 = l_date    #160119-00008#1 By Ann_Huang --- add
      ELSE
         LET l_date = ''
         LET l_date2 = p_date    #單據日期   #160119-00008#1 By Ann_Huang --- add
      END IF


      CASE
         #最近最低採購單價
         WHEN r_source = '1'
            LET l_sql = " SELECT pmdn015,pmdndocno,pmdnseq",
                        "   FROM pmdl_t,pmdn_t",
                        "  WHERE pmdlent = ",g_enterprise,
                        "    AND pmdlsite = '",p_site,"'",
                        "    AND pmdlstus = 'Y'",
                        "    AND pmdl004 = '",p_client,"'",
                        "    AND pmdl009 = '",p_con1,"'",
                        "    AND pmdl010 = '",p_con2,"'",
                        "    AND pmdl015 = '",p_curr,"'",
#160621-00003#9-s
#                       "    AND pmdl023 = '",p_path,"'",
                        "    AND COALESCE(pmdl023,' ') = COALESCE('",p_path,"',' ')",
#160621-00003#9-e
                        "    AND pmdnent = pmdlent",
                        "    AND pmdndocno = pmdldocno",
                        "    AND pmdn001 = '",p_item,"'",
                        "    AND COALESCE(pmdn002,' ') = COALESCE('",p_feature,"',' ')",
                        "    AND pmdn010 = '",p_unit,"'",
                        "    AND pmdn016 = '",p_tax,"'"
            IF NOT cl_null(l_date) THEN 
               LET l_sql = l_sql," AND pmdldocdt >= '",l_date,"'"
            END IF
            #LET l_sql = l_sql," ORDER BY pmdldocdt DESC,pmdn015 "   #170112-00048#1 
            LET l_sql = l_sql," ORDER BY pmdn015 "   #170112-00048#1 
            PREPARE s_purchase_price_get_pmdn_per FROM l_sql
            DECLARE s_purchase_price_get_pmdn_cur CURSOR FOR s_purchase_price_get_pmdn_per
            FOREACH s_purchase_price_get_pmdn_cur INTO r_price,r_docno,r_seq 
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "FOREACH:"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  EXIT FOREACH
               END IF
               IF NOT cl_null(r_price) THEN
                  EXIT FOREACH
               END IF
            END FOREACH
            FREE s_purchase_price_get_pmdn_per


         #依供應商核價
         WHEN r_source = '2'
            #LET l_sql = " SELECT pmdidocno,pmdi005,COALESCE(pmdi007,0),pmdi008,pmdjseq,pmdj009,pmdj011,COALESCE(pmdj013,0) ",   #170728-00006#1 mark
            LET l_sql = " SELECT pmdidocno,pmdi005,COALESCE(pmdi007,0),pmdi008,pmdjseq,pmdj009,pmdj011,COALESCE(pmdj013,0),pmdi017,pmdi018 ",  #170728-00006#1 add
                        "   FROM pmdi_t,pmdj_t ",
                        "  WHERE pmdient = pmdjent AND pmdisite = pmdjsite AND pmdidocno = pmdjdocno ",
                        "    AND pmdient = '",g_enterprise,"' AND pmdistus = 'Y' ",
                        "    AND pmdj008 = '",p_unit,"'  "
            #160119-00008#1  --- add Start --- modify l_date -> l_date2
            IF NOT cl_null(l_date2) THEN
               LET l_sql = l_sql," AND pmdi015 <= '",l_date2,"' AND (pmdi016 IS NULL OR pmdi016 > '",l_date2,"')"
            END IF
            #判斷是一般採購價還是委外價
            IF p_type = '1' THEN
               LET l_sql = l_sql," AND pmdi001 = 'N' "
            ELSE
              #LET l_sql = l_sql," AND pmdi001 = 'Y' AND pmdj006 = '",p_job,"' AND pmdj007 = '",p_process,"'"   #170417-00014#1 mark
               LET l_sql = l_sql," AND pmdi001 = 'Y' AND (pmdj006 = '",p_job,"' OR pmdj006 =' ') AND (pmdj007 = '",p_process,"' OR pmdj007 =' ') "   #170417-00014#1 add
            END IF            
            #160119-00008#1  --- add End ---
            #160413-00011#8---add---begin
            #WHERE條件寫成 AND (A OR ( NOT (A) AND ( B OR (NOT (B) AND (C)) ) ) )
            #會有先抓符合A條件、抓不到再抓符合B條件、又抓不到再抓符合C條件....這樣層層開放的效果
            LET l_p_sql = l_sql," AND (pmdisite = '",p_site,"' OR (NOT (pmdisite = '",p_site,"') AND ((pmdi018 = '2' AND pmdisite IN ( SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"' AND ooef017 = '",l_ooef017,"' AND ooefstus = 'Y' )) OR (NOT((pmdi018 = '2' AND pmdisite IN ( SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"' AND ooef017 = '",l_ooef017,"' AND ooefstus = 'Y' ))) AND ((pmdi018 = '3' AND pmdisite IN ( SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"' AND ooefstus = 'Y' ))))))) "
            CALL s_purchase_price_apmt440_3(p_client,p_item,p_feature,p_curr,p_tax,p_con1,p_con2,p_path,p_qty,p_site,l_scc40,l_imaa.imaa009,l_imaa.imaa127,l_p_sql)
                 RETURNING r_price,r_docno,r_seq
            #160413-00011#8---add---end 
            #160413-00011#8---mark---begin           
            #LET l_p_sql = l_sql," AND pmdisite = '",p_site,"' "    
            #CALL s_purchase_price_apmt440_3(p_client,p_item,p_feature,p_curr,p_tax,p_con1,p_con2,p_path,p_qty,p_site,l_scc40,l_imaa.imaa009,l_imaa.imaa127,l_p_sql)
            #     RETURNING r_price,r_docno,r_seq
            #IF cl_null(r_price) THEN
            #   #抓其他據點(該據點對應的法人與傳入據點所對應的法人一樣)
            #   #且合約單上的'合約使用管制為'2.同法人適用'
            #   LET l_p_sql = l_sql," AND pmdi018 = '2' ",
            #                       " AND pmdisite IN ( SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"' AND ooef017 = '",l_ooef017,"' AND ooefstus = 'Y' ) "
            #   CALL s_purchase_price_apmt440_3(p_client,p_item,p_feature,p_curr,p_tax,p_con1,p_con2,p_path,p_qty,p_site,l_scc40,l_imaa.imaa009,l_imaa.imaa127,l_p_sql)
            #        RETURNING r_price,r_docno,r_seq
            #END IF
            #IF cl_null(r_price) THEN
            #   #該抓其他據點(該據點對應的集團與傳入據點所對應的集團一樣)
            #   #且合約單上的'合約使用管制為'3.同集團適用'
            #   LET l_p_sql = l_sql," AND pmdi018 = '3' ",
            #                       " AND pmdisite IN ( SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"' AND ooefstus = 'Y' ) "
            #   CALL s_purchase_price_apmt440_3(p_client,p_item,p_feature,p_curr,p_tax,p_con1,p_con2,p_path,p_qty,p_site,l_scc40,l_imaa.imaa009,l_imaa.imaa127,l_p_sql)
            #        RETURNING r_price,r_docno,r_seq
            #END IF
            #160413-00011#8---mark---end

         #最近採購單價
         WHEN r_source = '3'
            LET l_sql = " SELECT imai021,imai102",
                        "   FROM imai_t",
                        "  WHERE imaient = ",g_enterprise,
                        "    AND imaisite = '",p_site,"'",
                        "    AND imai001 = '",p_item,"'"
            #最近採購單價更新日期
            IF NOT cl_null(l_date) THEN
               LET l_sql = l_sql," AND imai101 >= '",l_date,"'"
            END IF
            PREPARE s_purchase_price_get_imai021_per FROM l_sql
            EXECUTE s_purchase_price_get_imai021_per INTO r_price,r_docno
            IF NOT cl_null(r_price) AND r_price <> 0 THEN
               #151118-00022 by whitney add start
               IF l_oodb005 = 'Y' THEN
                  LET r_price = r_price * (1 + l_oodb006/100)
               END IF
               #151118-00022 by whitney add end
               #取到的最近採購單價為本國幣的單價，將其轉成交易幣別的單價
               LET l_rate = ''
               CALL s_aooi160_get_exrate('1',p_site,g_today,l_ooef016,p_curr,0,l_scc40) RETURNING l_rate
               IF NOT cl_null(l_rate) THEN
                  LET r_price = r_price * l_rate
               END IF
               LET r_price = r_price * l_face
               CALL s_curr_round(p_site,p_curr,r_price,'1') RETURNING r_price
            END IF
            FREE s_purchase_price_get_imai021_per


         #最近供應商採購單價
         WHEN r_source = '4'
            LET l_sql = " SELECT pmar012,pmar013",
                        "   FROM pmar_t",
                        "  WHERE pmarent = ",g_enterprise,
                        "    AND pmarsite = '",p_site,"'",
                        "    AND pmar001 = '",p_client,"'",
                        "    AND pmar002 = '",p_item,"'",
                        "    AND COALESCE(pmar003,' ') = COALESCE('",p_feature,"',' ')",
                        "    AND pmar006 = '",p_unit,"'",
                        "    AND pmar007 = '",p_curr,"'",
                        "    AND pmar009 = '",p_tax,"'"
             #最近異動日期
             IF NOT cl_null(l_date) THEN
                LET l_sql = l_sql," AND pmar019 >= '",l_date,"'"
             END IF
            #判斷是一般採購價還是委外價
            IF p_type = '1' THEN
               LET l_sql = l_sql," AND pmar000 = 'N'"
            ELSE
               LET l_sql = l_sql," AND pmar000 = 'Y' AND pmar004 = '",p_job,"' AND pmar005 = '",p_process,"'"
            END IF
            LET l_sql = l_sql," ORDER BY pmar019 DESC "
            PREPARE s_purchase_price_get_pmar_per FROM l_sql
            DECLARE s_purchase_price_get_pmar_cur CURSOR FOR s_purchase_price_get_pmar_per
            FOREACH s_purchase_price_get_pmar_cur INTO r_price,r_docno
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "FOREACH:"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  EXIT FOREACH
               END IF
               IF NOT cl_null(r_price) THEN
                  EXIT FOREACH
               END IF
            END FOREACH
            FREE s_purchase_price_get_pmar_per


         #市價
         WHEN r_source = '5'
            LET l_sql = " SELECT imai023,imai112",
                        "   FROM imai_t",
                        "  WHERE imaient = ",g_enterprise,
                        "    AND imaisite = '",p_site,"'",
                        "    AND imai001 = '",p_item,"'"
            #最近採購市價異動日
            IF NOT cl_null(l_date) THEN
               LET l_sql = l_sql," AND imai024 >= '",l_date,"'"
            END IF
            PREPARE s_purchase_price_get_imai023_per FROM l_sql
            EXECUTE s_purchase_price_get_imai023_per INTO r_price,r_docno
            IF NOT cl_null(r_price) AND r_price <> 0 THEN
               #151118-00022 by whitney add start
               IF l_oodb005 = 'Y' THEN
                  LET r_price = r_price * (1 + l_oodb006/100)
               END IF
               #151118-00022 by whitney add end
               #取到的最近採購單價為本國幣的單價，將其轉成交易幣別的單價
               LET l_rate = ''
               CALL s_aooi160_get_exrate('1',p_site,g_today,l_ooef016,p_curr,0,l_scc40) RETURNING l_rate
               IF NOT cl_null(l_rate) THEN
                  LET r_price = r_price * l_rate
               END IF
               LET r_price = r_price * l_face
               CALL s_curr_round(p_site,p_curr,r_price,'1') RETURNING r_price
            END IF
            FREE s_purchase_price_get_imai023_per


         #150618 by whitney modify start
         WHEN r_source = '6'   #依標準價格
           OR r_source = '10'  #依產品價格表售價
            #170325-00067#1---s 
            #LET l_sql = " SELECT pmaw019,pmaw020,pmaw100 ",
            LET l_sql = " pmaw019,pmaw020,pmaw100 ",
            #170325-00067#1---e
                        "   FROM pmaw_t ",
                        "  WHERE pmawent = ",g_enterprise,
                        "    AND pmaw001 = '",l_pmaw001,"' ",
                        "    AND pmaw002 = '",p_curr,"' ",
                        "    AND pmaw013 = '",p_unit,"' ",
                        "   AND pmaw011 = '",p_item,"' AND COALESCE(pmaw012,' ') = COALESCE('",p_feature,"',' ')  ",  #170516-00077#1 add                 
                        "    AND pmawstus = 'Y' "
            #料號
            #LET l_p_sql = l_sql," AND pmaw011 = '",p_item,"' ",   #160413-00011#8---mark
            #                    " AND COALESCE(pmaw012,' ') = COALESCE('",p_feature,"',' ') "   #160413-00011#8---mark
            #160413-00011#8---add---begin
            #WHERE條件寫成 AND (A OR ( NOT (A) AND ( B OR (NOT (B) AND (C)) ) ) )
            #會有先抓符合A條件、抓不到再抓符合B條件、又抓不到再抓符合C條件....這樣層層開放的效果  \
            #170325-00067#1---s            
            #LET l_p_sql = l_sql," AND ((pmaw011 = '",p_item,"' AND COALESCE(pmaw012,' ') = COALESCE('",p_feature,"',' ')) OR (NOT(pmaw011 = '",p_item,"' AND COALESCE(pmaw012,' ') = COALESCE('",p_feature,"',' ')) AND ((pmaw031 = '",l_imaa.imaa127,"') OR (NOT (pmaw031 = '",l_imaa.imaa127,"') AND (pmaw032 = '",l_imaa.imaa009,"')))))"
            #LET l_p_sql = " SELECT 1 AS l_order,",l_sql," AND pmaw011 = '",p_item,"' AND COALESCE(pmaw012,' ') = COALESCE('",p_feature,"',' ') ",   #170516-00077#1 mark
            LET l_p_sql = " SELECT 1 AS l_order,",l_sql,"  ",                                            #170516-00077#1 add 
                          " UNION SELECT 2 AS l_order,",l_sql," AND pmaw031 = '",l_imaa.imaa127,"' ",
                          " UNION SELECT 3 AS l_order,",l_sql," AND pmaw032 = '",l_imaa.imaa009,"' ",
                          " ORDER BY l_order "
            #170325-00067#1---e
            #160413-00011#8---add---end                    
            CALL s_purchase_price_apmi129(r_source,l_p_sql)
                 RETURNING r_price,r_docno
            #160413-00011#8---mark---begin     
            #IF cl_null(r_price) THEN
            #   #系列
            #   LET l_p_sql = l_sql," AND pmaw031 = '",l_imaa.imaa127,"' "
            #   CALL s_purchase_price_apmi129(r_source,l_p_sql)
            #        RETURNING r_price,r_docno
            #END IF
            #IF cl_null(r_price) THEN
            #   #產品分類
            #   LET l_p_sql = l_sql," AND pmaw032 = '",l_imaa.imaa009,"' "
            #   CALL s_purchase_price_apmi129(r_source,l_p_sql)
            #        RETURNING r_price,r_docno
            #END IF
            #160413-00011#8---mark---end 
         #150618 by whitney modify end


         #依合約單價
         WHEN r_source = '7'
            LET l_sql = " SELECT pmdxdocno,pmdx005,COALESCE(pmdx007,0),pmdx008,pmdyseq,pmdy010,COALESCE(pmdy020,0),pmdy024,pmdy009,pmdy017,pmdy021,pmdx018 ",   #170619-00024#2 add pmdy009,pmdy017,pmdy021,pmdx018
                        "   FROM pmdx_t,pmdy_t ",
                        "  WHERE pmdyent = pmdxent AND pmdysite = pmdxsite AND pmdydocno = pmdxdocno ",
                        "    AND pmdxent = '",g_enterprise,"' AND pmdxstus = 'Y' ",
                        "    AND pmdy002 = '",p_item,"' AND pmdy008 = '",p_unit,"'  ",
                        #若合約單為數量管制且該合約單的累計數量大於等於合約數量時則該合約不能取
                        #若合約單為金額管制且該合約單的累計未稅金額大於等於合約未稅金額時則該合約不能取
                        "    AND ((pmdx018 = '1' AND pmdy020 < pmdy009) OR (pmdx018 = '2' AND pmdy021 < pmdy017))"
            #160119-00008#1  --- add Start --- modify l_date -> l_date2
            IF NOT cl_null(l_date2) THEN
               LET l_sql = l_sql," AND pmdx014 <= '",l_date2,"' AND (pmdx015 IS NULL OR pmdx015 > '",l_date2,"')"
            END IF
            #160119-00008#1  --- add End ---
            #判斷是一般採購價還是委外價
            IF p_type = '1' THEN
               LET l_sql = l_sql," AND pmdx001 = 'N'"
            ELSE
               LET l_sql = l_sql," AND pmdx001 = 'Y' AND pmdy006 = '",p_job,"' AND pmdy007 = '",p_process,"'"
            END IF
            #160413-00011#8---add---begin
            #WHERE條件寫成 AND (A OR ( NOT (A) AND ( B OR (NOT (B) AND (C)) ) ) )
            #會有先抓符合A條件、抓不到再抓符合B條件、又抓不到再抓符合C條件....這樣層層開放的效果     
            LET l_p_sql = l_sql," AND ((pmdxsite = '",p_site,"') OR(NOT(pmdxsite = '",p_site,"') AND ((pmdx017 = '2' AND pmdxsite IN ( SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"' AND ooef017 = '",l_ooef017,"' AND ooefstus = 'Y' ) ) OR (NOT(pmdx017 = '2' AND pmdxsite IN ( SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"' AND ooef017 = '",l_ooef017,"' AND ooefstus = 'Y' ) ) AND (pmdx017 = '3' AND pmdxsite IN ( SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"' AND ooefstus = 'Y' ))))))"
            #160413-00011#8---add---end
            #LET l_p_sql = l_sql," AND pmdxsite = '",p_site,"' "   #160413-00011#8---mark
            CALL s_purchase_price_apmt480_2(p_client,p_feature,p_curr,p_tax,p_con1,p_con2,p_qty,p_site,l_scc40,l_p_sql,p_docno)   #170619-00024#2 add p_docno
                 RETURNING r_price,r_docno,r_seq
            
            #160127-00036#1--add---begin---
            #料件採購據點資料，設置料件採購替代為Y ，則取採購替代合約類型中的料件替代资料(*资料先除外)
            IF cl_null(r_price) OR r_price = 0 THEN
               SELECT imaf163 INTO l_imaf163 FROM imaf_t WHERE imafent = g_enterprise AND imafsite = g_site AND imaf001 = p_item
               IF l_imaf163 = 'Y' THEN
                  #161227-00014#1---s
                  #DECLARE pmaq_cs CURSOR FOR
                  #   SELECT pmaq003,pmaq006 FROM pmaq_t  
                  #      WHERE pmaqent = g_enterprise 
                  #        AND pmaq002 = p_item    
                  #        AND (CASE WHEN pmaq005 IS NULL THEN ' ' ELSE pmaq005 END) = p_feature  
                  #        AND (pmaq001 = p_client OR pmaq001  = 'ALL' ) AND pmaqstus = 'Y'
                  #        AND (pmaq004 = '1' OR pmaq004 = '4') 
                  #        AND pmaq003 NOT LIKE '%*%'  #*有範圍的，不遍曆  
                  #FOREACH pmaq_cs INTO l_pmaq003,l_pmaq006 
                  #   LET l_sql = " SELECT pmdxdocno,pmdx005,COALESCE(pmdx007,0),pmdx008,pmdyseq,pmdy010,COALESCE(pmdy020,0),pmdy024 ",
                  #               "   FROM pmdx_t,pmdy_t ",
                  #               "  WHERE pmdyent = pmdxent AND pmdysite = pmdxsite AND pmdydocno = pmdxdocno ",
                  #               "    AND pmdxent = '",g_enterprise,"' AND pmdxstus = 'Y' ",
                  #               "    AND pmdy002 = '",l_pmaq003,"' AND pmdy008 = '",p_unit,"'  ",
                  #               #若合約單為數量管制且該合約單的累計數量大於等於合約數量時則該合約不能取
                  #               #若合約單為金額管制且該合約單的累計未稅金額大於等於合約未稅金額時則該合約不能取
                  #               "    AND ((pmdx018 = '1' AND pmdy020 < pmdy009) OR (pmdx018 = '2' AND pmdy021 < pmdy017))"
                  #   #160119-00008#1  --- add Start --- modify l_date -> l_date2
                  #   IF NOT cl_null(l_date2) THEN
                  #      LET l_sql = l_sql," AND pmdx014 <= '",l_date2,"' AND (pmdx015 IS NULL OR pmdx015 > '",l_date2,"')"
                  #   END IF
                  #   #160119-00008#1  --- add End ---
                  #   #判斷是一般採購價還是委外價
                  #   IF p_type = '1' THEN
                  #      LET l_sql = l_sql," AND pmdx001 = 'N'"
                  #   ELSE
                  #      LET l_sql = l_sql," AND pmdx001 = 'Y' AND pmdy006 = '",p_job,"' AND pmdy007 = '",p_process,"'"
                  #   END IF
                  #   #160413-00011#8---add---begin
                  #   #WHERE條件寫成 AND (A OR ( NOT (A) AND ( B OR (NOT (B) AND (C)) ) ) )
                  #   #會有先抓符合A條件、抓不到再抓符合B條件、又抓不到再抓符合C條件....這樣層層開放的效果 
                  #   LET l_p_sql = l_sql," AND ((pmdxsite = '",p_site,"') OR(NOT(pmdxsite = '",p_site,"') AND ((pmdx017 = '2' AND pmdxsite IN ( SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"' AND ooef017 = '",l_ooef017,"' AND ooefstus = 'Y' ) ) OR (NOT(pmdx017 = '2' AND pmdxsite IN ( SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"' AND ooef017 = '",l_ooef017,"' AND ooefstus = 'Y' ) ) AND (pmdx017 = '3' AND pmdxsite IN ( SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"' AND ooefstus = 'Y' ))))))"
                  #   #160413-00011#8---add---end
                  #   #LET l_p_sql = l_sql," AND pmdxsite = '",p_site,"' "   #160413-00011#8---mark
                  #   CALL s_purchase_price_apmt480_2(p_client,l_pmaq006,p_curr,p_tax,p_con1,p_con2,p_qty,p_site,l_scc40,l_p_sql)
                  #        RETURNING r_price,r_docno,r_seq 
                  #   IF r_price <> 0 THEN
                  #      EXIT FOREACH
                  #   END IF                        
                  #END FOREACH  
                  DECLARE pmaq_cs CURSOR FOR
                     SELECT pmaq003,pmaq006,pmaq002 FROM pmaq_t  
                        WHERE pmaqent = g_enterprise AND pmaqsite = g_site
                          AND (pmaq001 = p_client OR pmaq001  = 'ALL' ) AND pmaqstus = 'Y'
                          AND (pmaq004 = '1' OR pmaq004 = '4') 
                          
                  LET l_sql = "  SELECT COUNT(1) FROM imaa_t ",
                             "      WHERE imaaent = ",g_enterprise," AND imaa001 = ? AND imaa001 LIKE ? "
                 
                  PREPARE s_purchase_price_get_pmaq_per FROM l_sql                     
                  FOREACH pmaq_cs INTO l_pmaq003,l_pmaq006,l_pmaq002
                  
                     LET l_pmaq003_o = cl_replace_str(l_pmaq003,'*','%')  
                     
                     EXECUTE s_purchase_price_get_pmaq_per USING p_item,l_pmaq003_o INTO l_cnt
                     IF cl_null(l_cnt) OR l_cnt = 0 THEN
                        CONTINUE FOREACH
                     END IF
                     LET l_sql = " SELECT pmdxdocno,pmdx005,COALESCE(pmdx007,0),pmdx008,pmdyseq,pmdy010,COALESCE(pmdy020,0),pmdy024 ",
                                 "   FROM pmdx_t,pmdy_t ",
                                 "  WHERE pmdyent = pmdxent AND pmdysite = pmdxsite AND pmdydocno = pmdxdocno ",
                                 "    AND pmdxent = '",g_enterprise,"' AND pmdxstus = 'Y' ",
                                 "    AND pmdy002 = '",l_pmaq002,"' AND pmdy008 = '",p_unit,"'  ",
                                 #若合約單為數量管制且該合約單的累計數量大於等於合約數量時則該合約不能取
                                 #若合約單為金額管制且該合約單的累計未稅金額大於等於合約未稅金額時則該合約不能取
                                 "    AND ((pmdx018 = '1' AND pmdy020 < pmdy009) OR (pmdx018 = '2' AND pmdy021 < pmdy017))"
                      
                     IF NOT cl_null(l_date2) THEN
                        LET l_sql = l_sql," AND pmdx014 <= '",l_date2,"' AND (pmdx015 IS NULL OR pmdx015 > '",l_date2,"')"
                     END IF
                     #判斷是一般採購價還是委外價
                     IF p_type = '1' THEN
                        LET l_sql = l_sql," AND pmdx001 = 'N'"
                     ELSE
                        LET l_sql = l_sql," AND pmdx001 = 'Y' AND pmdy006 = '",p_job,"' AND pmdy007 = '",p_process,"'"
                     END IF
                     #WHERE條件寫成 AND (A OR ( NOT (A) AND ( B OR (NOT (B) AND (C)) ) ) )
                     #會有先抓符合A條件、抓不到再抓符合B條件、又抓不到再抓符合C條件....這樣層層開放的效果 
                     LET l_p_sql = l_sql," AND ((pmdxsite = '",p_site,"') OR(NOT(pmdxsite = '",p_site,"') AND ((pmdx017 = '2' AND pmdxsite IN ( SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"' AND ooef017 = '",l_ooef017,"' AND ooefstus = 'Y' ) ) OR (NOT(pmdx017 = '2' AND pmdxsite IN ( SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"' AND ooef017 = '",l_ooef017,"' AND ooefstus = 'Y' ) ) AND (pmdx017 = '3' AND pmdxsite IN ( SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"' AND ooefstus = 'Y' ))))))"
                     CALL s_purchase_price_apmt480_2(p_client,l_pmaq006,p_curr,p_tax,p_con1,p_con2,p_qty,p_site,l_scc40,l_p_sql,p_docno)   #170619-00024#2 add p_docno
                          RETURNING r_price,r_docno,r_seq 
                     IF r_price <> 0 THEN
                        EXIT FOREACH
                     END IF    
                  END FOREACH                    
                  #161227-00014#1---e                  
               END IF
               
            END IF
            #160127-00036#1--add---begin---
         
            #160413-00011#8---mark---begin     
            #IF cl_null(r_price) THEN
            #   #抓其他據點(該據點對應的法人與傳入據點所對應的法人一樣)
            #   #且合約單上的'合約使用管制為'2.同法人適用'
            #   LET l_p_sql = l_sql," AND pmdx017 = '2' ",
            #                       " AND pmdxsite IN ( SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"' AND ooef017 = '",l_ooef017,"' AND ooefstus = 'Y' ) "
            #   CALL s_purchase_price_apmt480_2(p_client,p_feature,p_curr,p_tax,p_con1,p_con2,p_qty,p_site,l_scc40,l_p_sql)
            #        RETURNING r_price,r_docno,r_seq
            #END IF
            #IF cl_null(r_price) THEN
            #   #該抓其他據點(該據點對應的集團與傳入據點所對應的集團一樣)
            #   #且合約單上的'合約使用管制為'3.同集團適用'
            #   LET l_p_sql = l_sql," AND pmdx017 = '3' ",
            #                       " AND pmdxsite IN ( SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"' AND ooefstus = 'Y' ) "
            #   CALL s_purchase_price_apmt480_2(p_client,p_feature,p_curr,p_tax,p_con1,p_con2,p_qty,p_site,l_scc40,l_p_sql)
            #        RETURNING r_price,r_docno,r_seq
            #END IF
            #160413-00011#8---mark---end

         #彈性價格表
         WHEN r_source = '9'
            #取得供應商的所在洲、國家、省
            LET l_oofb012 = NULL
            LET l_oofb014 = NULL
            SELECT oofb012,oofb014 INTO l_oofb012,l_oofb014
              FROM oofb_t,pmaa_t
             WHERE pmaaent = oofbent
               AND pmaa001 = p_client
               AND oofbent = g_enterprise
               AND oofbstus = 'Y'
               AND oofb002 = pmaa027  #聯絡對象識別碼
               AND oofb008 = '1'
               AND oofb010 = 'Y'      #主要聯絡地址
            IF cl_null(l_oofb012) THEN
               DECLARE oofb_cur CURSOR FOR
                  SELECT oofb012,oofb014
                    FROM oofb_t,pmaa_t
                   WHERE pmaaent = oofbent
                     AND pmaa001 = p_client
                     AND oofbent = g_enterprise
                     AND oofbstus = 'Y'
                     AND oofb008 = '1'
                     AND oofb002 = pmaa027
               FOREACH oofb_cur INTO l_oofb012,l_oofb014
                  IF NOT cl_null(l_oofb012) THEN
                     EXIT FOREACH
                  END IF
               END FOREACH
            END IF
            LET l_gzzz004 = NULL
            CALL ld_arr.clear()
            SELECT gzzz004 INTO l_gzzz004 FROM gzzz_t WHERE gzzz001 = l_pman005           
            CALL s_azzi900_app_param_token(ld_arr,l_gzzz004) RETURNING ld_arr
            
            LET l_sql = " SELECT pmau011,COALESCE(pmau012,' '),pmau022,pmau100 ",
                        "   FROM pmau_t ",
                        "  WHERE pmauent = '",g_enterprise,"' ",
                        "    AND pmau001 = '",l_pmaw001,"' ",
                        "    AND pmau003 = '",p_curr,"' ",
                        "    AND pmau006 = '",l_pman005,"' ",
                        "    AND pmau018 = '",p_unit,"' "
            INITIALIZE l_pmas.* TO NULL
            SELECT pmas002,pmas003,pmas004,pmas005,pmas006,pmas007,
                   pmas008,pmas009,pmas010,pmas011,pmas012,pmas013
              INTO l_pmas.pmas002,l_pmas.pmas003,l_pmas.pmas004,l_pmas.pmas005,
                   l_pmas.pmas006,l_pmas.pmas007,l_pmas.pmas008,l_pmas.pmas009,
                   l_pmas.pmas010,l_pmas.pmas011,l_pmas.pmas012,l_pmas.pmas013
              FROM pmas_t
             WHERE pmasent = g_enterprise
               AND pmas001 = ld_arr[7].lc_value
               
            INITIALIZE l_pmau.* TO NULL 
            #151110-00024#1 20151204 add by ming -----(S) 
            LET l_sql1= ""
            LET l_sql2= ""
            #151110-00024#1 20151204 add by ming -----(E) 
            CALL s_control_get_group('4',g_user,g_dept)
                 RETURNING l_success,l_pmau.pmau002
            IF cl_null(l_pmau.pmau002) THEN
               LET l_pmau.pmau002 = 'ALL'
            END IF
            #洲別編號
            SELECT oocg002 INTO l_pmau.pmau013 FROM oocg_t
             WHERE oocgent = g_enterprise AND oocgstus = 'Y' AND oocg001 = l_oofb012
            IF cl_null(l_pmau.pmau013) THEN
               LET l_pmau.pmau013 = ' '
            END IF
            IF l_pmas.pmas003 = 'Y' THEN
               LET l_sql = l_sql," AND pmau013 = '",l_pmau.pmau013,"' "
            END IF
            #國家編號
            IF cl_null(l_oofb012) THEN
               LET l_pmau.pmau014 = ' '
            ELSE
               LET l_pmau.pmau014 = l_oofb012
            END IF
            IF l_pmas.pmas004 = 'Y' THEN
               #151110-00024#1 20151204 modify by ming -----(S) 
               #LET l_sql = l_sql," AND pmau014 = '",l_pmau.pmau014,"' "
               LET l_sql1 = l_sql1," AND pmau014 = '",l_pmau.pmau014,"' "
               LET l_sql2 = l_sql2," AND (pmau014 = '",l_pmau.pmau014,"' OR pmau014 = ' ') "
               #151110-00024#1 20151204 modify by ming -----(E) 
            END IF
            #州省編號
            IF cl_null(l_oofb014) THEN
               LET l_pmau.pmau015 = ' '
            ELSE
               LET l_pmau.pmau015 = l_oofb014
            END IF
            IF l_pmas.pmas005 = 'Y' THEN
               LET l_sql = l_sql," AND pmau015 = '",l_pmau.pmau015,"' "
            END IF
            #供應商價格群組
            SELECT pmaa081 INTO l_pmau.pmau016 FROM pmaa_t
             WHERE pmaaent = g_enterprise AND pmaa001 = p_client
            IF cl_null(l_pmau.pmau016) THEN
               LET l_pmau.pmau016 = ' '
            END IF
            IF l_pmas.pmas006 = 'Y' THEN
               LET l_sql = l_sql," AND pmau016 = '",l_pmau.pmau016,"' "
            END IF
            #供應商分類
            SELECT pmaa080 INTO l_pmau.pmau017 FROM pmaa_t
             WHERE pmaaent = g_enterprise AND pmaa001 = p_client
            IF cl_null(l_pmau.pmau017) THEN
               LET l_pmau.pmau017 = ' '
            END IF
            IF l_pmas.pmas007 = 'Y' THEN
               LET l_sql = l_sql," AND pmau017 = '",l_pmau.pmau017,"' "
            END IF
            #稅別編號
            IF cl_null(p_tax) THEN
               LET l_pmau.pmau019 = ' '
            ELSE
               LET l_pmau.pmau019 = p_tax
            END IF
            IF l_pmas.pmas008 = 'Y' THEN
               LET l_sql = l_sql," AND pmau019 = '",l_pmau.pmau019,"' "
            END IF
            #付款條件
            IF cl_null(p_con1) THEN
               LET l_pmau.pmau020 = ' '
            ELSE
               LET l_pmau.pmau020 = p_con1
            END IF
            IF l_pmas.pmas009 = 'Y' THEN
               #151110-00024#1 20151204 modify by ming -----(S) 
               #LET l_sql = l_sql," AND pmau020 = '",l_pmau.pmau020,"' "
               LET l_sql1 = l_sql1," AND pmau020 = '",l_pmau.pmau020,"' "
               LET l_sql2 = l_sql2," AND (pmau020 = '",l_pmau.pmau020,"' OR pmau020 = ' ') "
               #151110-00024#1 20151204 modify by ming -----(E) 
            END IF
            #交易條件
            IF cl_null(p_con2) THEN
               LET l_pmau.pmau021 = ' '
            ELSE
               LET l_pmau.pmau021 = p_con2
            END IF
            IF l_pmas.pmas010 = 'Y' THEN
               LET l_sql = l_sql," AND pmau021 = '",l_pmau.pmau021,"' "
            END IF
            #151110-00024#1 20151204 modify by ming -----(S) 
            #LET l_p_sql = l_sql," AND pmau002 = '",l_pmau.pmau002,"' ",
            #                    " AND pmau005 = '",p_path,"' "
            LET l_p_sql = l_sql," AND pmau002 = '",l_pmau.pmau002,"' ",
#160621-00003#9-s
#                               " AND pmau005 = '",p_path,"' ",l_sql1
                                " AND COALESCE(pmau005,'ALL') = COALESCE('",p_path,"','ALL')",l_sql1
#160621-00003#9-e
            #151110-00024#1 20151204 modify by ming -----(E) 
            CALL s_purchase_price_apmi128(l_pmas.pmas002,l_pmas.pmas011,l_pmas.pmas012,l_pmas.pmas013,p_item,p_feature,l_imaa.imaa127,l_imaa.imaa009,l_p_sql)
                 RETURNING r_price,r_docno
            
            #151110-00024#1 20151204 add by ming -----(S) 
            #前一步驟沒抓到，再抓(國家 OR 國家= ' ') 、(付款條件 OR 付款條件 = ' ') 
            IF cl_null(r_price) THEN
               LET l_p_sql = l_sql," AND pmau002 = '",l_pmau.pmau002,"' ",
#160621-00003#9-s
#                                  " AND pmau005 = '",p_path,"' ",l_sql2
                                   " AND COALESCE(pmau005,'ALL') = COALESCE('",p_path,"','ALL')",l_sql2
#160621-00003#9-e
               CALL s_purchase_price_apmi128(l_pmas.pmas002,l_pmas.pmas011,l_pmas.pmas012,l_pmas.pmas013,p_item,p_feature,l_imaa.imaa127,l_imaa.imaa009,l_p_sql)
                    RETURNING r_price,r_docno
            END IF
            #151110-00024#1 20151204 add by ming -----(E) 
                 
            #前一步驟沒抓到，再抓 指定控制組、通路=ALL
#160621-00003#9-s
#           IF cl_null(r_price) AND p_path <> 'ALL' THEN
            IF cl_null(r_price) AND (p_path <> 'ALL' OR cl_null(p_path)) THEN
#160621-00003#9-e
               #151110-00024#1 20151204 modify by ming -----(S) 
               #LET l_p_sql = l_sql," AND pmau002 = '",l_pmau.pmau002,"' ",
               #                    " AND pmau005 = 'ALL' "
               LET l_p_sql = l_sql," AND pmau002 = '",l_pmau.pmau002,"' ",
                                   " AND pmau005 = 'ALL' ",l_sql2
               #151110-00024#1 20151204 modify by ming -----(E) 
               CALL s_purchase_price_apmi128(l_pmas.pmas002,l_pmas.pmas011,l_pmas.pmas012,l_pmas.pmas013,p_item,p_feature,l_imaa.imaa127,l_imaa.imaa009,l_p_sql)
                    RETURNING r_price,r_docno
            END IF
            #前一步驟沒抓到，再抓 控制組=ALL、通路=p_path
            IF cl_null(r_price) AND l_pmau.pmau002 <> 'ALL' THEN
               #151110-00024#1 20151204 modify by ming -----(S) 
               #LET l_p_sql = l_sql," AND pmau002 = 'ALL' ",
               #                    " AND pmau005 = '",p_path,"' "
               LET l_p_sql = l_sql," AND pmau002 = 'ALL' ",
#160621-00003#9-s
#                                  " AND pmau005 = '",p_path,"' ",l_sql2
                                   " AND COALESCE(pmau005,'ALL') = COALESCE('",p_path,"','ALL')",l_sql2
#160621-00003#9-e
               #151110-00024#1 20151204 modify by ming -----(E) 
               CALL s_purchase_price_apmi128(l_pmas.pmas002,l_pmas.pmas011,l_pmas.pmas012,l_pmas.pmas013,p_item,p_feature,l_imaa.imaa127,l_imaa.imaa009,l_p_sql)
                    RETURNING r_price,r_docno
            END IF
            #前一步驟沒抓到，再抓 控制組=ALL、通路=ALL
#160621-00003#9-s
#           IF cl_null(r_price) AND p_path <> 'ALL' AND l_pmau.pmau002 <> 'ALL' THEN
            IF cl_null(r_price) AND (p_path <> 'ALL' OR cl_null(p_path)) AND l_pmau.pmau002 <> 'ALL' THEN
#160621-00003#9-e
               #151110-00024#1 20151204 modify by ming -----(S) 
               #LET l_p_sql = l_sql," AND pmau002 = 'ALL' ",
               #                    " AND pmau005 = 'ALL' "
               LET l_p_sql = l_sql," AND pmau002 = 'ALL' ",
                                   " AND pmau005 = 'ALL' ",l_sql2
               #151110-00024#1 20151204 modify by ming -----(E) 
               CALL s_purchase_price_apmi128(l_pmas.pmas002,l_pmas.pmas011,l_pmas.pmas012,l_pmas.pmas013,p_item,p_feature,l_imaa.imaa127,l_imaa.imaa009,l_p_sql)
                    RETURNING r_price,r_docno
            END IF


         #最近詢價單價
         WHEN r_source = '11'
            LET l_sql = " SELECT pmdg010,pmdg009,pmdgdocno,pmdgseq FROM pmdf_t,pmdg_t",  
                        "  WHERE pmdfent = '",g_enterprise,"'",
                        "    AND pmdfsite = '",p_site,"'",
                        "    AND pmdfstus = 'Y' ",
                        "    AND pmdg002 = '",p_client,"'",
                        #"    AND pmdf009 = '",p_con1,"'",     #170324-00085#1 mark
                        #"    AND pmdf010 = '",p_con2,"'",     #170324-00085#1 mark
                        "    AND (pmdf009 = '",p_con1,"' OR pmdf009 IS NULL)",     #170324-00085#1 mark
                        "    AND (pmdf010 = '",p_con2,"' OR pmdf010 IS NULL)",     #170324-00085#1 mark
                        "    AND pmdf005 = '",p_curr,"'",
                        "    AND pmdfent = pmdgent AND  pmdfsite = pmdgsite AND  pmdfdocno = pmdgdocno ",
                        "    AND pmdg003 = '",p_item,"'",
                        "    AND COALESCE(pmdg004,' ') = COALESCE('",p_feature,"',' ') ",
                        "    AND pmdg008 = '",p_unit,"'",
                        #170619-00017#1 add-S
                        "    AND pmdg013 <= ",p_qty,         #采购量不得小于询价单最低数量
                        "    AND pmdg017 >= '",p_date,"' ",  #采购日期不得大于有效日期
                        #170619-00017#1 add-E
                        "    AND pmdg018 = '",p_tax,"'"
            IF NOT cl_null(l_date) THEN
               LET l_sql = l_sql," AND pmdfdocdt >= '",l_date,"'"
            END IF
            IF p_type = '2' THEN
               LET l_sql = l_sql," AND pmdf001 = 'Y'"
            ELSE
               LET l_sql = l_sql," AND pmdf001 = 'N'"
            END IF
            LET l_sql = l_sql," ORDER BY pmdg010 " 
                    
            PREPARE s_purchase_price_get_pmdf_per FROM l_sql
            DECLARE s_purchase_price_get_pmdf_cur CURSOR FOR s_purchase_price_get_pmdf_per
            INITIALIZE l_pmdg.* TO NULL
            FOREACH s_purchase_price_get_pmdf_cur INTO l_pmdg.pmdg010,l_pmdg.pmdg009,l_pmdg.pmdgdocno,l_pmdg.pmdgseq
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "FOREACH:"
                  LET g_errparam.popup = TRUE
                   CALL cl_err()
                  EXIT FOREACH
               END IF
               IF l_pmdg.pmdg009 = 'Y' THEN
                  LET l_pmdh003 = NULL
                  LET l_pmdh004 = NULL
                  SELECT pmdh003,COALESCE(pmdh004,0) INTO l_pmdh003,l_pmdh004
                    FROM pmdh_t
                   WHERE pmdhent = g_enterprise
                     AND pmdhsite = p_site
                     AND pmdhdocno = l_pmdg.pmdgdocno
                     AND pmdhseq = l_pmdg.pmdgseq
                     AND pmdh001 <= p_qty AND pmdh002 >= p_qty
                   IF cl_null(l_pmdh003) THEN
                      SELECT pmdh003,COALESCE(pmdh004,0) INTO l_pmdh003,l_pmdh004
                        FROM pmdh_t
                       WHERE pmdhent = g_enterprise
                         AND pmdhsite = p_site
                         AND pmdhdocno = l_pmdg.pmdgdocno
                         AND pmdhseq = l_pmdg.pmdgseq
                         AND pmdh002 = (SELECT MAX(pmdh002) FROM pmdh_t WHERE pmdhent = g_enterprise
                                           AND pmdhsite = p_site AND pmdhdocno = l_pmdg.pmdgdocno AND pmdhseq = l_pmdg.pmdgseq)
                   END IF
                   LET r_price = l_pmdh003 * (1 - l_pmdh004/100)
               END IF 
               IF cl_null(r_price) THEN 
                  LET r_price = l_pmdg.pmdg010
                  LET r_docno = l_pmdg.pmdgdocno
                  LET r_seq   = l_pmdg.pmdgseq
               END IF 
               IF r_price > l_pmdg.pmdg010 THEN
                  LET r_price = l_pmdg.pmdg010
                  LET r_docno = l_pmdg.pmdgdocno
                  LET r_seq   = l_pmdg.pmdgseq
               END IF  
            END FOREACH
            FREE s_purchase_price_get_pmdf_per

         OTHERWISE EXIT CASE
      END CASE


      #允許單價為0
      IF NOT cl_null(r_price) THEN
         IF (l_pmam006 = 'N' AND r_price = 0) THEN
            LET r_price  = ''
            LET r_docno  = ''
            LET r_seq    = ''
         ELSE
            EXIT FOREACH
         END IF
      END IF

      LET r_source = ''
      LET l_pman004 = ''
      LET l_pman005 = ''
   END FOREACH
   #161116-00041#1-add-s
   IF cl_null(r_price) AND NOT cl_null(p_feature) THEN
      CALL s_purchase_price_get(p_mode,p_client,p_item,'',p_curr,p_tax,p_con1,p_con2,p_path,p_docno,p_date,p_unit,p_qty,p_site,p_export,p_type,p_job,p_process)
         RETURNING r_source,r_price,r_docno,r_seq
   END IF
   #161116-00041#1-add-e
   #若沒有取到單價時則取價來源回傳'X.取不到單價'
   IF cl_null(r_price) THEN 
      LET r_source = 'X'
      LET r_price  = 0
      LET r_docno  = ''
      LET r_seq    = ''
   END IF

   RETURN r_source,r_price,r_docno,r_seq
END FUNCTION

################################################################################
# Descriptions...: 依據取價方式設置的單價修改控管方式檢核修改後單價的合理性
# Memo...........:
# Usage..........: CALL s_purchase_price_check(p_mode,p_price1,p_price2,p_source,p_curr,p_item,p_feature,p_unit)
#                  RETURNING r_flag,r_errno
# Input parameter: p_mode    取價方式
#                : p_price1  修改後單價
#                : p_price2  原始取出單價
#                : p_source  取價來源
#                : p_curr    幣別
#                : p_item    料件編號
#                : p_feature 產品特徵
#                : p_unit    計價單位
# Return code....: r_flag    是否可修改(TRUE:可修改/FALSE:不可修改)
#                : r_errno   檢核警告訊息
# Date & Author..: 140630 By pengu
# Modify.........:
################################################################################
PUBLIC FUNCTION s_purchase_price_check(p_mode,p_price1,p_price2,p_source,p_curr,p_item,p_feature,p_unit)
DEFINE p_mode       LIKE pmdl_t.pmdl017
DEFINE p_price1     LIKE pmdn_t.pmdn043
DEFINE p_price2     LIKE pmdn_t.pmdn043
DEFINE p_source     LIKE pmdn_t.pmdn040
DEFINE p_curr       LIKE pmdl_t.pmdl015
DEFINE p_item       LIKE pmdn_t.pmdn001
DEFINE p_feature    LIKE pmdn_t.pmdn002
DEFINE p_unit       LIKE pmdn_t.pmdn010
DEFINE r_flag       LIKE type_t.num5
DEFINE r_errno      LIKE type_t.chr10
DEFINE l_pmam  RECORD
    pmam003    LIKE pmam_t.pmam003,
    pmam004    LIKE pmam_t.pmam004,
    pmam005    LIKE pmam_t.pmam005,
    pmam006    LIKE pmam_t.pmam006
           END RECORD

   WHENEVER ERROR CONTINUE

   LET r_flag = TRUE
   LET r_errno  = ''
   
   #170816-00007#126 by 09773 mod(S)
   #參數檢核
#   IF cl_null(p_mode) OR cl_null(p_price1) THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = 'sub-00280'
#      LET g_errparam.extend = 's_purchase_price_check'
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#      RETURN r_flag,r_errno
#   END IF
   #170816-00007#126 by 09773 mod(E)
   
   #170816-00007#126 by 09773 add(S)
   #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_mode) THEN
      CALL s_azzi902_get_gzzd("abgp510","lbl_group2") RETURNING g_colname_1,g_comment_1  #取價方式 
      LET g_msg = g_colname_1   
   END IF
   IF cl_null(p_price1) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''    
      CALL s_azzi902_get_gzzd("aapq520","lbl_apgb009") RETURNING g_colname_1,g_comment_1   #修改後單價
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF NOT cl_null(g_msg) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00788'  #%1傳入值為空(錯誤)
      LET g_errparam.extend = 's_purchase_price_check'
      LET g_errparam.popup = TRUE
      LET g_errparam.replace[1] = g_msg
      CALL cl_err()
      
      RETURN r_flag,r_errno
   END IF   
   #170816-00007#126 by 09773 add(E)


   #依據傳入的'取價方式'抓取對應的取價方式設定檔資料
   INITIALIZE l_pmam.* TO NULL
   SELECT pmam003,pmam004,pmam005,pmam006
     INTO l_pmam.pmam003,l_pmam.pmam004,l_pmam.pmam005,l_pmam.pmam006
     FROM pmam_t
    WHERE pmament = g_enterprise
      AND pmam001 = p_mode
      AND pmamstus = 'Y'
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "sel pmam"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_flag,r_errno
   END IF

   #檢核是否允許修改單價
  #IF l_pmam.pmam003 = 'N' AND NOT cl_null(p_price2) THEN #160627-00012#1
   IF l_pmam.pmam003 = 'N' AND p_source <> 'X' THEN       #160627-00012#1
      IF p_price1 <> p_price2 THEN
         LET r_errno = 'sub-00593'
         LET r_flag = FALSE
         RETURN r_flag,r_errno
      END IF
   END IF

   #修改單價小於原始取出單價乘上容差率
   #IF NOT cl_null(l_pmam.pmam004) AND NOT cl_null(p_price2) THEN   #170726-00009#1 mark
   IF NOT cl_null(l_pmam.pmam004) AND p_price2 > 0 THEN             #170726-00009#1 add
      LET p_price2 = p_price2 * (1 + l_pmam.pmam004/100)
      IF p_price1 > p_price2 THEN
         LET r_errno = 'sub-00563'
         IF l_pmam.pmam005 = '1' THEN  #拒絕
            LET r_flag = FALSE
         END IF
      END IF
   END IF

   RETURN r_flag,r_errno
END FUNCTION

################################################################################
# Descriptions...: 取得apmi129採購價格表維護作業維護的價格
# Memo...........:
# Usage..........: CALL s_purchase_price_apmi129(p_source,p_sql)
#                  RETURNING r_price,r_docno
# Input parameter: 
# Return code....: 
# Date & Author..: 150618 By whitney
# Modify.........:
################################################################################
PUBLIC FUNCTION s_purchase_price_apmi129(p_source,p_sql)
DEFINE p_source     LIKE type_t.chr10
DEFINE p_sql        STRING
DEFINE r_price      LIKE pmaw_t.pmaw020
DEFINE r_docno      LIKE pmaw_t.pmaw100
DEFINE l_pmaw  RECORD
    pmaw019    LIKE pmaw_t.pmaw019,
    pmaw020    LIKE pmaw_t.pmaw020,
    pmaw100    LIKE pmaw_t.pmaw100
           END RECORD

   LET r_price = ''
   LET r_docno = ''

   PREPARE s_purchase_price_apmi129_pre FROM p_sql
   DECLARE s_purchase_price_apmi129_cur CURSOR FOR s_purchase_price_apmi129_pre
   INITIALIZE l_pmaw.* TO NULL
   FOREACH s_purchase_price_apmi129_cur INTO g_order,    #170325-00067#1
                                             l_pmaw.pmaw019,l_pmaw.pmaw020,l_pmaw.pmaw100
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = 'foreach:'
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF

      CASE p_source
         WHEN '6'   #依標準價格
            LET r_price = l_pmaw.pmaw019
         WHEN '10'  #依產品價格表售價
            LET r_price = l_pmaw.pmaw020
         OTHERWISE EXIT CASE
      END CASE

      IF NOT cl_null(r_price) THEN
         LET r_docno = l_pmaw.pmaw100
         EXIT FOREACH
      END IF

      INITIALIZE l_pmaw.* TO NULL
   END FOREACH

   FREE s_purchase_price_apmi129_pre

   RETURN r_price,r_docno
END FUNCTION

################################################################################
# Descriptions...: 採購合約-條件處理
# Memo...........:
# Usage..........: CALL s_purchase_price_apmt480_0(p_curr,p_tax,p_qty,p_site,p_scc40,p_sql,p_docno)
#                  RETURNING r_price,r_docno,r_seq
# Input parameter: p_curr      幣別
#                : p_tax       稅別
#                : p_qty       計價數量
#                : p_site      營運據點
#                : p_scc40     汇率类型
#                : p_sql       取得合約資料的sql
#                : p_docno     單號  #170619-00024#2 add
# Return code....: r_price     單價
#                : r_docno     單號
#                : r_seq       項次
# Date & Author..: 140630 By pengu
# Modify.........:
################################################################################
PUBLIC FUNCTION s_purchase_price_apmt480_0(p_curr,p_tax,p_qty,p_site,p_scc40,p_sql,p_docno)
DEFINE p_curr       LIKE pmdx_t.pmdx005
DEFINE p_tax        LIKE pmdl_t.pmdl011
DEFINE p_qty        LIKE pmdy_t.pmdy009
DEFINE p_site       LIKE pmdl_t.pmdlsite
DEFINE p_scc40      LIKE type_t.chr2
DEFINE p_sql        STRING
DEFINE p_docno      LIKE pmdn_t.pmdndocno   #170619-00024#2 add
DEFINE r_price      LIKE pmdy_t.pmdy010
DEFINE r_docno      LIKE pmdx_t.pmdxdocno
DEFINE r_seq        LIKE pmdy_t.pmdyseq
DEFINE l_pmdz001    LIKE pmdz_t.pmdz001
DEFINE l_pmdz002    LIKE pmdz_t.pmdz002
DEFINE l_pmdz003    LIKE pmdz_t.pmdz003
DEFINE l_rate       LIKE ooan_t.ooan005
#170619-00024#2-S add
DEFINE l_pmdn011    LIKE pmdn_t.pmdn011   
DEFINE l_num        LIKE pmdy_t.pmdy009
DEFINE l_pmdn046    LIKE pmdn_t.pmdn046
DEFINE l_num2       LIKE pmdy_t.pmdy017
DEFINE l_money      LIKE pmdy_t.pmdy017
#170619-00024#2-E add
DEFINE l_pmd   RECORD
    pmdxdocno  LIKE pmdx_t.pmdxdocno,
    pmdx005    LIKE pmdx_t.pmdx005,
    pmdx007    LIKE pmdx_t.pmdx007,
    pmdx008    LIKE pmdx_t.pmdx008,
    pmdyseq    LIKE pmdy_t.pmdyseq,
    pmdy010    LIKE pmdy_t.pmdy010,
    pmdy020    LIKE pmdy_t.pmdy020,
    pmdy024    LIKE pmdy_t.pmdy024,
    pmdy009    LIKE pmdy_t.pmdy009,   #170619-00024#2 add
    pmdy017    LIKE pmdy_t.pmdy017,   #170619-00024#2 add  
    pmdy021    LIKE pmdy_t.pmdy021,   #170619-00024#2 add
    pmdx018    LIKE pmdx_t.pmdx018    #170619-00024#2 add
           END RECORD 
DEFINE l_ooef016    LIKE ooef_t.ooef016 #171121-00046#1 add           
           
   LET r_price = ''
   LET r_docno = ''
   LET r_seq = ''
   
   PREPARE s_purchase_price_apmt480_pre FROM p_sql
   DECLARE s_purchase_price_apmt480_cur CURSOR FOR s_purchase_price_apmt480_pre 
   INITIALIZE l_pmd.* TO NULL
   FOREACH s_purchase_price_apmt480_cur
      INTO l_pmd.pmdxdocno,l_pmd.pmdx005,l_pmd.pmdx007,l_pmd.pmdx008,
           l_pmd.pmdyseq  ,l_pmd.pmdy010,l_pmd.pmdy020,l_pmd.pmdy024,
           l_pmd.pmdy009,l_pmd.pmdy017,l_pmd.pmdy021,l_pmd.pmdx018   #170619-00024#2 add pmdy009,pmdy017,pmdy021,pmdx018
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      
     #170619-00024#2-S add
      #採購未確認量/金額(取價為合約的)
      SELECT SUM(pmdn011) INTO l_pmdn011 FROM pmdn_t,pmdl_t 
       WHERE pmdnent = pmdlent 
         AND pmdndocno = pmdldocno
         AND pmdlstus = 'N'
         AND pmdnent = g_enterprise
         AND pmdn040 = '7'
         AND pmdn041 = l_pmd.pmdxdocno
         AND pmdn042 = l_pmd.pmdyseq
         AND pmdndocno <> p_docno  
      IF cl_null(l_pmdn011) THEN LET l_pmdn011 = 0 END IF       
      IF l_pmd.pmdx018 = '1' THEN  #1.數量管制
        #IF (l_pmd.pmdy020+p_qty+l_pmdn011) > l_pmd.pmdy009 THEN   #170828-00028#9 mark
        #取價時，因為當前的採購單還沒生效，所以取價的目標數量不包含當前這張採購單的數量
         IF (l_pmd.pmdy020+l_pmdn011) > l_pmd.pmdy009 THEN         #170828-00028#9 add
            LET r_price = ''
#            LET l_num = l_pmd.pmdy020+p_qty+l_pmdn011
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.code = 'apm-01200'
#            LET g_errparam.extend = l_num
#            LET g_errparam.replace[1] = l_pmd.pmdxdocno
#            LET g_errparam.replace[2] = l_pmd.pmdyseq 
#            LET g_errparam.replace[3] = l_pmd.pmdy009          
#            LET g_errparam.popup = TRUE
#            CALL cl_err()
            EXIT FOREACH         
         END IF 
      END IF     
     #170619-00024#2-E add
     
      #累計量定價否
      IF l_pmd.pmdy024 = 'Y' THEN
         LET l_pmdz001 = ''
         SELECT MIN(pmdz001) INTO l_pmdz001
           FROM pmdz_t
          WHERE pmdzent = g_enterprise
#           AND pmdzsite = p_site   #170620-00050#1 mark
            AND pmdzdocno = l_pmd.pmdxdocno
            AND pmdzseq = l_pmd.pmdyseq
         IF cl_null(l_pmdz001) THEN LET l_pmdz001 = 0 END IF
         #IF (l_pmd.pmdy020+p_qty) > l_pmdz001 THEN          #170713-00035#1 mark
         #IF (l_pmd.pmdy020+p_qty) >= l_pmdz001 THEN          #170713-00035#1 add  #170619-00024#2 mark
         #IF (l_pmd.pmdy020+p_qty+l_pmdn011) >= l_pmdz001 THEN   #170619-00024#2 add   #170828-00028#9 mark
          IF (l_pmd.pmdy020+l_pmdn011) >= l_pmdz001 THEN                               #170828-00028#9 add
            SELECT pmdz002,COALESCE(pmdz003,0)
              INTO l_pmdz002,l_pmdz003
              FROM pmdz_t
             WHERE pmdzent = g_enterprise
#              AND pmdzsite = p_site   #170620-00050#1 mark
               AND pmdzdocno = l_pmd.pmdxdocno
               AND pmdzseq = l_pmd.pmdyseq
               #AND pmdz001 < (l_pmd.pmdy020+p_qty)                     #150702-00011#1 mark
               AND pmdz001 = (SELECT MAX(pmdz001)
                                FROM pmdz_t
                               WHERE pmdzent = g_enterprise
                                 AND pmdzsite = p_site
                                 AND pmdzdocno = l_pmd.pmdxdocno
                                 AND pmdzseq = l_pmd.pmdyseq
                                #AND pmdz001 <= (l_pmd.pmdy020+p_qty+l_pmdn011))   #170619-00024#2 add   #170828-00028#9 mark
                                 AND pmdz001 <= (l_pmd.pmdy020+l_pmdn011))   #170828-00028#9 add                                
                                 #AND pmdz001 <= (l_pmd.pmdy020+p_qty))   #150702-00011#1   #170619-00024#2 mark
                                 #AND pmdz001 < (l_pmd.pmdy020+p_qty))   #150702-00011#1  mark
            IF NOT cl_null(l_pmdz002) THEN
               LET r_price = l_pmdz002 * (1 - l_pmdz003/100)
            END IF
         ELSE
            LET r_price = l_pmd.pmdy010
         END IF
      ELSE
         LET r_price = l_pmd.pmdy010
      END IF
      #171121-00046#1 add -s
      LET l_ooef016 = ''
      SELECT ooef016
        INTO l_ooef016
        FROM ooef_t
       WHERE ooefent  = g_enterprise
         AND ooef001  = p_site
         AND ooefstus = 'Y'
      #171121-00046#1 add -e
      IF NOT cl_null(r_price) THEN
         #若取到的合約稅別的單價含稅否與稅率與傳入的稅別不一樣時，需對單價進行轉換
         CALL s_sale_price_tax(r_price,p_tax,p_site,l_pmd.pmdx008,l_pmd.pmdx007) RETURNING r_price 
         #若取到的合約單幣別與傳入幣別不一樣時，需對取到的單價進行匯率轉換
         IF l_pmd.pmdx005 <> p_curr THEN
            LET l_rate = ''
            #171121-00046#1 add -s
            IF l_pmd.pmdx005 <> l_ooef016 THEN
               CALL s_aooi160_get_exrate('1',p_site,g_today,l_pmd.pmdx005,l_ooef016,0,p_scc40) RETURNING l_rate
               IF NOT cl_null(l_rate) THEN
                  LET r_price = r_price * l_rate
               END IF
               CALL s_aooi160_get_exrate('1',p_site,g_today,l_ooef016,p_curr,0,p_scc40) RETURNING l_rate
               IF NOT cl_null(l_rate) THEN
                  LET r_price = r_price * l_rate
               END IF
            ELSE 
            #171121-00046#1 add -e            
              CALL s_aooi160_get_exrate('1',p_site,g_today,l_pmd.pmdx005,p_curr,0,p_scc40) RETURNING l_rate
              IF NOT cl_null(l_rate) THEN
                 LET r_price = r_price * l_rate
              END IF
            END IF #171121-00046#1 add 
         END IF
         CALL s_curr_round(p_site,p_curr,r_price,'1') RETURNING r_price              
         LET r_docno = l_pmd.pmdxdocno
         LET r_seq = l_pmd.pmdyseq
         #170619-00024#2-S add      
         IF l_pmd.pmdx018 = '2' THEN  #2.金額管制
            #採購未確認量/金額(取價為合約的)
            SELECT SUM(pmdn046) INTO l_pmdn046 FROM pmdn_t,pmdl_t 
             WHERE pmdnent = pmdlent 
               AND pmdndocno = pmdldocno
               AND pmdlstus = 'N'
               AND pmdnent = g_enterprise
               AND pmdn040 = '7'
               AND pmdn041 = l_pmd.pmdxdocno
               AND pmdn042 = l_pmd.pmdyseq
               AND pmdndocno <> p_docno                   
            IF cl_null(l_pmdn046) THEN LET l_pmdn046 = 0 END IF  
            #計算此單金額
            LET l_money = r_price * p_qty
            IF (l_pmd.pmdy021+ l_money +l_pmdn046) > l_pmd.pmdy017 THEN
               LET l_num2 = l_pmd.pmdy021+ l_money +l_pmdn046
               LET r_price = ''
               LET r_docno = ''
               LET r_seq = ''            
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.code = 'apm-01201'
#               LET g_errparam.extend = l_num2
#               LET g_errparam.replace[1] = l_pmd.pmdxdocno
#               LET g_errparam.replace[2] = l_pmd.pmdyseq 
#               LET g_errparam.replace[3] = l_pmd.pmdy017        
#               LET g_errparam.popup = TRUE
#               CALL cl_err()            
               EXIT FOREACH            
            END IF 
         END IF   
         #170619-00024#2-E add            
         EXIT FOREACH
      END IF
            
      INITIALIZE l_pmd.* TO NULL
   END FOREACH
   FREE s_purchase_price_apmt480_pre
   
   RETURN r_price,r_docno,r_seq
END FUNCTION

################################################################################
# Descriptions...: 合約單價-限制條件
# Memo...........:
# Usage..........: CALL s_purchase_price_apmt480_1(p_feature,p_curr,p_tax,p_con1,p_con2,p_qty,p_site,p_scc40,p_sql,p_docno)
#                  RETURNING r_price,r_docno,r_seq
# Input parameter: p_feature   產品特徵
#                : p_curr      幣別
#                : p_tax       稅別
#                : p_con1      付款條件
#                : p_con2      交易條件
#                : p_qty       計價數量
#                : p_site      營運據點
#                : p_scc40     汇率类型
#                : p_sql       取得合約資料的sql
#                : p_docno     單號  #170619-00024#2 add
# Return code....: r_price     取出單價
#                : r_docno     參考單號
#                : r_seq       參考項次
# Date & Author..: 140630 By pengu
# Modify.........:
################################################################################
PUBLIC FUNCTION s_purchase_price_apmt480_1(p_feature,p_curr,p_tax,p_con1,p_con2,p_qty,p_site,p_scc40,p_sql,p_docno)
DEFINE p_feature    LIKE pmdn_t.pmdn002
DEFINE p_curr       LIKE pmdl_t.pmdl015
DEFINE p_tax        LIKE pmdl_t.pmdl011
DEFINE p_con1       LIKE pmdl_t.pmdl009
DEFINE p_con2       LIKE pmdl_t.pmdl010
DEFINE p_qty        LIKE pmdn_t.pmdn011
DEFINE p_site       LIKE pmdl_t.pmdlsite
DEFINE p_scc40      LIKE type_t.chr2
DEFINE p_sql        STRING
DEFINE p_docno      LIKE pmdn_t.pmdndocno   #170619-00024#2 add
DEFINE r_price      LIKE pmdn_t.pmdn043
DEFINE r_docno      LIKE pmdn_t.pmdndocno
DEFINE r_seq        LIKE pmdn_t.pmdnseq
DEFINE l_p_sql      STRING

   LET r_price = ''
   LET r_docno = ''
   LET r_seq = ''
   
   LET l_p_sql = p_sql,
                 "    AND COALESCE(pmdy003,' ') = COALESCE('",p_feature,"',' ') ",
                 "    AND pmdx009 = '",p_con1,"' ",
                 "    AND pmdx011 = '",p_con2,"' ",
                 "    AND pmdx005 = '",p_curr,"' ",
                 "    AND pmdx006 = '",p_tax,"' ",
                 "  ORDER BY pmdx014 DESC "
  #160523-00012#1---mark---str--              
  ##160413-00011#8---add---begin
  #LET l_p_sql = p_sql," AND COALESCE(pmdy003,' ') = COALESCE('",p_feature,"',' ') ",
  #                    " AND ((pmdx009 = '",p_con1,"' AND pmdx011 = '",p_con2,"' AND pmdx005 = '",p_curr,"' AND pmdx006 = '",p_tax,"') OR (NOT(pmdx009 = '",p_con1,"' AND pmdx011 = '",p_con2,"' AND pmdx005 = '",p_curr,"' AND pmdx006 = '",p_tax,"') AND ((pmdx010 = 'N' OR pmdx009 = '",p_con1,"') AND (pmdx012 = 'N' OR pmdx011 = '",p_con2,"') AND (pmdx019 = 'N' OR pmdx005 = '",p_curr,"') AND (pmdx020 = 'N' OR pmdx006 = '",p_tax,"'))))",
  #                    "  ORDER BY pmdx014 DESC "   #160616-00017#1  add
  ##160413-00011#8---add---end
  #160523-00012#1---mark---end-- 
   #160523-00012#1---add---str--
   #ex:原本未調整前SQL可能如下
   #AND ((pmdx009 = '101' AND pmdx011 = 'CFR' AND pmdx005 = 'NTD' AND pmdx006 = '1250') 
   #   OR 
   # (NOT(pmdx009 = '101' AND pmdx011 = 'CFR' AND pmdx005 = 'NTD' AND pmdx006 = '1250') 
   #AND ((pmdx010 = 'N' OR pmdx009 = '101') 
   # AND (pmdx012 = 'N' OR pmdx011 = 'CFR') 
   # AND (pmdx019 = 'N' OR pmdx005 = 'NTD') 
   # AND (pmdx020 = 'N' OR pmdx006 = '1250'))))   
   #調整後僅留下以下SQL,改成這樣即可,ex:因為當pmdx010 = 'Y'時就是看OR pmdx009 = '101' 
   #AND ((pmdx010 = 'N' OR pmdx009 = '101') 
   # AND (pmdx012 = 'N' OR pmdx011 = 'CFR') 
   # AND (pmdx019 = 'N' OR pmdx005 = 'NTD') 
   # AND (pmdx020 = 'N' OR pmdx006 = '1250'))
   LET l_p_sql = p_sql,
                  " AND COALESCE(pmdy003,' ') = COALESCE('",p_feature,"',' ') ",
                  " AND ((pmdx010 = 'N' OR pmdx009 = '",p_con1,"') ", 
                  "  AND (pmdx012 = 'N' OR pmdx011 = '",p_con2,"') ",
                  "  AND (pmdx019 = 'N' OR pmdx005 = '",p_curr,"') ",
                  "  AND (pmdx020 = 'N' OR pmdx006 = '",p_tax,"' )) ",
                  #"  ORDER BY pmdx014 DESC"   #160616-00017#1  add   #170303-00051 mod
                  "  ORDER BY pmdx014 DESC,pmdxdocno DESC "           #170303-00051 mod
   #160523-00012#1---add---end--
                       
   CALL s_purchase_price_apmt480_0(p_curr,p_tax,p_qty,p_site,p_scc40,l_p_sql,p_docno)   #170619-00024#2 add p_docno
        RETURNING r_price,r_docno,r_seq
   RETURN r_price,r_docno,r_seq  #160413-00011#8
   
   
   #產品特徵為空
   IF cl_null(r_price) AND NOT cl_null(p_feature) THEN
      LET l_p_sql = p_sql,
                    "    AND COALESCE(pmdy003,' ') = ' ' ",
                    "    AND pmdx009 = '",p_con1,"' ",
                    "    AND pmdx011 = '",p_con2,"' ",
                    "    AND pmdx005 = '",p_curr,"' ",
                    "    AND pmdx006 = '",p_tax,"' ",
                    "  ORDER BY pmdx014 DESC "
      CALL s_purchase_price_apmt480_0(p_curr,p_tax,p_qty,p_site,p_scc40,l_p_sql,p_docno)  #170619-00024#2 add p_docno
           RETURNING r_price,r_docno,r_seq
   END IF
   
   #合約單無設置限制條件
   IF cl_null(r_price) THEN
      LET l_p_sql = p_sql,
                    "    AND COALESCE(pmdy003,' ') = COALESCE('",p_feature,"',' ') ",
                    "    AND (pmdx010 = 'N' OR pmdx009 = '",p_con1,"')",
                    "    AND (pmdx012 = 'N' OR pmdx011 = '",p_con2,"') ",
                    "    AND (pmdx019 = 'N' OR pmdx005 = '",p_curr,"') ",
                    "    AND (pmdx020 = 'N' OR pmdx006 = '",p_tax,"') ",
                    "  ORDER BY pmdx014 DESC "
      CALL s_purchase_price_apmt480_0(p_curr,p_tax,p_qty,p_site,p_scc40,l_p_sql,p_docno)  #170619-00024#2 add p_docno
           RETURNING r_price,r_docno,r_seq
   END IF
   
   #合約單無設置限制條件且產品特徵為空
   IF cl_null(r_price) AND NOT cl_null(p_feature) THEN
      LET l_p_sql = p_sql,
                    "    AND COALESCE(pmdy003,' ') = ' ' ",
                    "    AND (pmdx010 = 'N' OR pmdx009 = '",p_con1,"') ",
                    "    AND (pmdx012 = 'N' OR pmdx011 = '",p_con2,"') ",
                    "    AND (pmdx019 = 'N' OR pmdx005 = '",p_curr,"') ",
                    "    AND (pmdx020 = 'N' OR pmdx006 = '",p_tax,"') ",
                    "  ORDER BY pmdx014 DESC "
      CALL s_purchase_price_apmt480_0(p_curr,p_tax,p_qty,p_site,p_scc40,l_p_sql,p_docno)  #170619-00024#2 add p_docno
           RETURNING r_price,r_docno,r_seq
   END IF

   RETURN r_price,r_docno,r_seq
END FUNCTION

################################################################################
# Descriptions...: 合約對象管制
# Memo...........:
# Usage..........: CALL s_purchase_price_apmt480_2(p_client,p_feature,p_curr,p_tax,p_con1,p_con2,p_qty,p_site,p_scc40,p_sql,p_docno)
#                  RETURNING r_price,r_docno,r_seq
# Input parameter: p_client    供應商編號
#                : p_feature   產品特徵
#                : p_curr      幣別
#                : p_tax       稅別
#                : p_con1      付款條件
#                : p_con2      交易條件
#                : p_qty       計價數量
#                : p_site      營運據點
#                : p_scc40     汇率类型
#                : p_sql       取得合約資料的sql
#                : p_docno     單號      #170619-00024#2 add 
# Return code....: r_price     取出單價
#                : r_docno     參考單號
#                : r_seq       參考項次
# Date & Author..: 140630 By pengu
# Modify.........:
################################################################################
PUBLIC FUNCTION s_purchase_price_apmt480_2(p_client,p_feature,p_curr,p_tax,p_con1,p_con2,p_qty,p_site,p_scc40,p_sql,p_docno)
DEFINE p_client    LIKE pmdl_t.pmdl004
DEFINE p_feature    LIKE pmdn_t.pmdn002
DEFINE p_curr       LIKE pmdl_t.pmdl015
DEFINE p_tax        LIKE pmdl_t.pmdl011
DEFINE p_con1       LIKE pmdl_t.pmdl009
DEFINE p_con2       LIKE pmdl_t.pmdl010
DEFINE p_qty        LIKE pmdn_t.pmdn011
DEFINE p_site       LIKE pmdl_t.pmdlsite
DEFINE p_scc40      LIKE type_t.chr2
DEFINE p_sql        STRING
DEFINE p_docno      LIKE pmdn_t.pmdndocno   #170619-00024#2 add 
DEFINE r_price      LIKE pmdn_t.pmdn043
DEFINE r_docno      LIKE pmdn_t.pmdndocno
DEFINE r_seq        LIKE pmdn_t.pmdnseq
DEFINE l_pmaa005    LIKE pmaa_t.pmaa005
DEFINE l_pmaa006    LIKE pmaa_t.pmaa006
DEFINE l_p_sql      STRING

   LET r_price = ''
   LET r_docno = ''
   LET r_seq = ''
   
   #LET l_p_sql = p_sql," AND pmdx004 = '",p_client,"' "   #160413-00011#8---mark
   #160413-00011#8---add---begin
   LET l_pmaa005 = ''
   LET l_pmaa006 = ''
   SELECT pmaa005,pmaa006 INTO l_pmaa005,l_pmaa006
     FROM pmaa_t
    WHERE pmaaent = g_enterprise
      AND pmaa001 = p_client   
   LET l_p_sql = p_sql," AND ((pmdx004 = '",p_client,"') OR (NOT(pmdx004 = '",p_client,"') AND ((pmdx016 = '2' AND pmdx004 IN ( SELECT pmaa001 FROM pmaa_t WHERE pmaaent = '",g_enterprise,"' AND pmaa005 = '",l_pmaa005,"' AND pmaastus = 'Y' )) OR (NOT(pmdx016 = '2' AND pmdx004 IN ( SELECT pmaa001 FROM pmaa_t WHERE pmaaent = '",g_enterprise,"' AND pmaa005 = '",l_pmaa005,"' AND pmaastus = 'Y' )) AND (pmdx016 = '3' AND pmdx004 IN ( SELECT pmaa001 FROM pmaa_t WHERE pmaaent = '",g_enterprise,"' AND pmaa006 = '",l_pmaa006,"' AND pmaastus = 'Y' )))))) "
   #160413-00011#8---add---end
   CALL s_purchase_price_apmt480_1(p_feature,p_curr,p_tax,p_con1,p_con2,p_qty,p_site,p_scc40,l_p_sql,p_docno)      #170619-00024#2 add p_docno
        RETURNING r_price,r_docno,r_seq
   RETURN r_price,r_docno,r_seq  #160413-00011#8---add-
   IF cl_null(r_price) THEN
      #抓該據點對其他客戶(該客戶所對應的法人與本次傳入的客戶對應法人相同)所簽的合約單
      #且合約單上的'合約對像管制為'2.同法人適用'
      LET l_pmaa005 = ''
      LET l_pmaa006 = ''
      SELECT pmaa005,pmaa006 INTO l_pmaa005,l_pmaa006
        FROM pmaa_t
       WHERE pmaaent = g_enterprise
         AND pmaa001 = p_client
      LET l_p_sql = p_sql," AND pmdx016 = '2' ",
                          " AND pmdx004 IN ( SELECT pmaa001 FROM pmaa_t WHERE pmaaent = '",g_enterprise,"' AND pmaa005 = '",l_pmaa005,"' AND pmaastus = 'Y' ) "
      CALL s_purchase_price_apmt480_1(p_feature,p_curr,p_tax,p_con1,p_con2,p_qty,p_site,p_scc40,l_p_sql,p_docno)   #170619-00024#2 add p_docno
           RETURNING r_price,r_docno,r_seq
   END IF
   
   IF cl_null(r_price) THEN
      #抓該據點對其他客戶(該客戶所對應的集團與本次傳入的客戶對應集團相同)所簽的合約單
      #且合約單上的'合約對像管制為'3.同集團適用'
      LET l_p_sql = p_sql," AND pmdx016 = '3' ",
                          " AND pmdx004 IN ( SELECT pmaa001 FROM pmaa_t WHERE pmaaent = '",g_enterprise,"' AND pmaa006 = '",l_pmaa006,"' AND pmaastus = 'Y' ) "
      CALL s_purchase_price_apmt480_1(p_feature,p_curr,p_tax,p_con1,p_con2,p_qty,p_site,p_scc40,l_p_sql,p_docno)   #170619-00024#2 add p_docno
           RETURNING r_price,r_docno,r_seq
   END IF

   RETURN r_price,r_docno,r_seq
END FUNCTION

################################################################################
# Descriptions...: 採購核價-條件處理
# Memo...........:
# Usage..........: CALL s_purchase_price_apmt440_0(p_curr,p_tax,p_qty,p_site,p_scc40,p_sql)
#                  RETURNING r_price,r_docno,r_seq
# Input parameter: p_curr      幣別
#                : p_tax       稅別
#                : p_qty       計價數量
#                : p_site      營運據點
#                : p_scc40     汇率类型
#                : p_sql       取得核價資料的sql
# Return code....: r_price     單價
#                : r_docno     單號
#                : r_seq       項次
# Date & Author..: 140630 By pengu
# Modify.........:
################################################################################
PUBLIC FUNCTION s_purchase_price_apmt440_0(p_curr,p_tax,p_qty,p_site,p_scc40,p_sql)
DEFINE p_curr       LIKE pmdi_t.pmdi005
DEFINE p_tax        LIKE pmdl_t.pmdl011
DEFINE p_qty        LIKE pmdn_t.pmdn011
DEFINE p_site       LIKE pmdi_t.pmdisite
DEFINE p_scc40      LIKE type_t.chr2
DEFINE p_sql        STRING
DEFINE r_price      LIKE pmdj_t.pmdj011
DEFINE r_docno      LIKE pmdi_t.pmdidocno
DEFINE r_seq        LIKE pmdj_t.pmdjseq
DEFINE l_pmdk003    LIKE pmdk_t.pmdk003
DEFINE l_pmdk004    LIKE pmdk_t.pmdk004
DEFINE l_rate       LIKE ooan_t.ooan005
DEFINE l_pmd   RECORD
    pmdidocno  LIKE pmdi_t.pmdidocno,
    pmdi005    LIKE pmdi_t.pmdi005,
    pmdi007    LIKE pmdi_t.pmdi007,
    pmdi008    LIKE pmdi_t.pmdi008,
    pmdjseq    LIKE pmdj_t.pmdjseq,
    pmdj009    LIKE pmdj_t.pmdj009,
    pmdj010    LIKE pmdj_t.pmdj010,
    pmdj013    LIKE pmdj_t.pmdj013
   ,pmdi017    LIKE pmdi_t.pmdi017,  #170728-00006#1 add
    pmdi018    LIKE pmdi_t.pmdi018   #170728-00006#1 add
           END RECORD
DEFINE l_ooef016    LIKE ooef_t.ooef016 #171121-00046#1 add 

   LET r_price = ''
   LET r_docno = ''
   LET r_seq = ''

   PREPARE s_purchase_price_apmt440_pre FROM p_sql
   DECLARE s_purchase_price_apmt440_cur CURSOR FOR s_purchase_price_apmt440_pre
   INITIALIZE l_pmd.* TO NULL
   FOREACH s_purchase_price_apmt440_cur
      INTO l_pmd.pmdidocno,l_pmd.pmdi005,l_pmd.pmdi007,l_pmd.pmdi008,
           l_pmd.pmdjseq  ,l_pmd.pmdj009,l_pmd.pmdj010,l_pmd.pmdj013
          ,l_pmd.pmdi017  ,l_pmd.pmdi018      #170728-00006#1 add
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      
      #分量計價否
      IF l_pmd.pmdj009 = 'Y' THEN
         #170728-00006#1 add---start---
         IF l_pmd.pmdi018 = '3' THEN
            SELECT pmdk003,COALESCE(pmdk004,0) INTO l_pmdk003,l_pmdk004
              FROM pmdk_t
             WHERE pmdkent = g_enterprise
               AND pmdkdocno = l_pmd.pmdidocno
               AND pmdkseq = l_pmd.pmdjseq
               AND pmdk001 <= p_qty AND pmdk002 >= p_qty
         ELSE
         #170728-00006#1 add---end---
            SELECT pmdk003,COALESCE(pmdk004,0) INTO l_pmdk003,l_pmdk004
              FROM pmdk_t
             WHERE pmdkent = g_enterprise
               AND pmdksite = p_site
               AND pmdkdocno = l_pmd.pmdidocno
               AND pmdkseq = l_pmd.pmdjseq
               AND pmdk001 <= p_qty AND pmdk002 >= p_qty
         END IF       #170728-00006#1 add
         IF cl_null(l_pmdk003) THEN
            #170728-00006#1 add---start---
            IF l_pmd.pmdi018 = '3' THEN
               SELECT pmdk003,COALESCE(pmdk004,0) INTO l_pmdk003,l_pmdk004
                 FROM pmdk_t
                WHERE pmdkent = g_enterprise
                  AND pmdkdocno = l_pmd.pmdidocno
                  AND pmdkseq = l_pmd.pmdjseq
                  AND pmdk002 = (SELECT MAX(pmdk002) FROM pmdk_t WHERE pmdkent = g_enterprise
                                    AND pmdksite = p_site AND pmdkdocno = l_pmd.pmdidocno AND pmdkseq = l_pmd.pmdjseq)
                  AND p_qty   > (SELECT MAX(pmdk002) FROM pmdk_t WHERE pmdkent = g_enterprise                           #數量大於最大的截止數量 #170724-00061#1 add
                                    AND pmdksite = p_site AND pmdkdocno = l_pmd.pmdidocno AND pmdkseq = l_pmd.pmdjseq)  #170724-00061#1 add
            ELSE
            #170728-00006#1 add---end---
               SELECT pmdk003,COALESCE(pmdk004,0) INTO l_pmdk003,l_pmdk004
                 FROM pmdk_t
                WHERE pmdkent = g_enterprise
                  AND pmdksite = p_site
                  AND pmdkdocno = l_pmd.pmdidocno
                  AND pmdkseq = l_pmd.pmdjseq
                  AND pmdk002 = (SELECT MAX(pmdk002) FROM pmdk_t WHERE pmdkent = g_enterprise
                                    AND pmdksite = p_site AND pmdkdocno = l_pmd.pmdidocno AND pmdkseq = l_pmd.pmdjseq)
                  AND p_qty   > (SELECT MAX(pmdk002) FROM pmdk_t WHERE pmdkent = g_enterprise                           #數量大於最大的截止數量 #170724-00061#1 add
                                    AND pmdksite = p_site AND pmdkdocno = l_pmd.pmdidocno AND pmdkseq = l_pmd.pmdjseq)  #170724-00061#1 add
            END IF            #170728-00006#1 add
         END IF
         IF NOT cl_null(l_pmdk003) THEN
            LET r_price = l_pmdk003 * (1 - l_pmdk004/100)
         END IF
      ELSE
         LET r_price = l_pmd.pmdj010 * (1 - l_pmd.pmdj013/100)
      END IF
      #171121-00046#1 add -s
      LET l_ooef016 = ''
      SELECT ooef016
        INTO l_ooef016
        FROM ooef_t
       WHERE ooefent  = g_enterprise
         AND ooef001  = p_site
         AND ooefstus = 'Y'
      #171121-00046#1 add -e
      
      IF NOT cl_null(r_price) THEN
         #若取到的核價稅別的單價含稅否與稅率與傳入的稅別不一樣時，需對單價進行轉換
         CALL s_sale_price_tax(r_price,p_tax,p_site,l_pmd.pmdi008,l_pmd.pmdi007) RETURNING r_price
         #若取到的核價單幣別與傳入幣別不一樣時，需對取到的單價進行匯率轉換
         IF l_pmd.pmdi005 <> p_curr THEN
            LET l_rate = ''
            #171121-00046#1 add -s
            IF l_pmd.pmdi005 <> l_ooef016 THEN
               CALL s_aooi160_get_exrate('1',p_site,g_today,l_pmd.pmdi005,l_ooef016,0,p_scc40) RETURNING l_rate
               IF NOT cl_null(l_rate) THEN
                  LET r_price = r_price * l_rate
               END IF
               CALL s_aooi160_get_exrate('1',p_site,g_today,l_ooef016,p_curr,0,p_scc40) RETURNING l_rate
               IF NOT cl_null(l_rate) THEN
                  LET r_price = r_price * l_rate
               END IF
            ELSE 
            #171121-00046#1 add -e 
              CALL s_aooi160_get_exrate('1',p_site,g_today,l_pmd.pmdi005,p_curr,0,p_scc40) RETURNING l_rate
              IF NOT cl_null(l_rate) THEN
                 LET r_price = r_price * l_rate
              END IF
            END IF    #171121-00046#1 add 
         END IF
         CALL s_curr_round(p_site,p_curr,r_price,'1') RETURNING r_price
         LET r_docno = l_pmd.pmdidocno
         LET r_seq = l_pmd.pmdjseq
         EXIT FOREACH
      END IF
      
      INITIALIZE l_pmd.* TO NULL
   END FOREACH
   
   FREE s_purchase_price_apmt440_pre
   
   RETURN r_price,r_docno,r_seq
END FUNCTION

################################################################################
# Descriptions...: 料件<系列<產品分類
# Memo...........:
# Usage..........: CALL s_purchase_price_apmt440_1(p_item,p_curr,p_tax,p_qty,p_site,p_scc40,p_imaa009,p_imaa127,p_sql)
#                  RETURNING r_price,r_docno,r_seq
# Input parameter: p_item      料件編號
#                : p_curr      幣別
#                : p_tax       稅別
#                : p_qty       計價數量
#                : p_site      營運據點
#                : p_scc40     汇率类型
#                : p_imaa009   產品分類
#                : p_imaa127   系列
#                : p_sql       取得核價資料的sql
# Return code....: r_price     取出單價
#                : r_docno     單號
#                : r_seq       項次
# Date & Author..: 150616 By whitney
# Modify.........:
################################################################################
PUBLIC FUNCTION s_purchase_price_apmt440_1(p_item,p_curr,p_tax,p_qty,p_site,p_scc40,p_imaa009,p_imaa127,p_sql)
DEFINE p_item       LIKE pmdn_t.pmdn001
DEFINE p_curr       LIKE pmdi_t.pmdi005
DEFINE p_tax        LIKE pmdl_t.pmdl011
DEFINE p_qty        LIKE pmdn_t.pmdn011
DEFINE p_site       LIKE pmdi_t.pmdisite
DEFINE p_scc40      LIKE type_t.chr2
DEFINE p_imaa009    LIKE imaa_t.imaa009
DEFINE p_imaa127    LIKE imaa_t.imaa127
DEFINE p_sql        STRING
DEFINE r_price      LIKE pmdn_t.pmdn043
DEFINE r_docno      LIKE pmdj_t.pmdjdocno
DEFINE r_seq        LIKE pmdj_t.pmdjseq
DEFINE l_p_sql      STRING

   LET r_price = ''
   LET r_docno = ''
   LET r_seq = ''

   LET l_p_sql = p_sql,
                 "    AND pmdj002 = '",p_item,"' ",
                 "  ORDER BY pmdi015 DESC "
   #160413-00011#8---mod---begin
   #LET l_p_sql = p_sql," AND ((pmdj002 = '",p_item,"') OR (NOT(pmdj002 = '",p_item,"') AND ((pmdj031 = '",p_imaa127,"') OR (NOT(pmdj031 = '",p_imaa127,"') AND (pmdj032 = '",p_imaa009,"')))))", #170329-00032#1 mark
   LET l_p_sql = p_sql," AND ((pmdj002 = '",p_item,"') OR ((NOT(pmdj002 = '",p_item,"') OR pmdj002 IS NULL ) AND ((pmdj031 = '",p_imaa127,"') OR (NOT(pmdj031 = '",p_imaa127,"') AND (pmdj032 = '",p_imaa009,"')))))", #170329-00032#1 add
                       #"  ORDER BY pmdi015 DESC "  #160616-00017#1  add     #170303-00051 mod
                       "  ORDER BY pmdi015 DESC,pmdidocno DESC "                            #170303-00051 mod
   #160413-00011#8---mod---end
   CALL s_purchase_price_apmt440_0(p_curr,p_tax,p_qty,p_site,p_scc40,l_p_sql)
        RETURNING r_price,r_docno,r_seq
   RETURN r_price,r_docno,r_seq    #160413-00011#8 
   #系列
   IF cl_null(r_price) THEN
      LET l_p_sql = p_sql,
                    "    AND pmdj031 = '",p_imaa127,"' ",
                    "  ORDER BY pmdi015 DESC "
      CALL s_purchase_price_apmt440_0(p_curr,p_tax,p_qty,p_site,p_scc40,l_p_sql)
           RETURNING r_price,r_docno,r_seq
   END IF
   
   #產品分類
   IF cl_null(r_price) THEN
      LET l_p_sql = p_sql,
                    "    AND pmdj032 = '",p_imaa009,"' ",
                    "  ORDER BY pmdi015 DESC "
      CALL s_purchase_price_apmt440_0(p_curr,p_tax,p_qty,p_site,p_scc40,l_p_sql)
           RETURNING r_price,r_docno,r_seq
   END IF

   RETURN r_price,r_docno,r_seq
END FUNCTION

################################################################################
# Descriptions...: 採購核價-限制條件
# Memo...........:
# Usage..........: CALL s_purchase_price_apmt440_2(p_item,p_feature,p_curr,p_tax,p_con1,p_con2,p_path,p_qty,p_site,p_scc40,p_imaa009,p_imaa127,p_sql)
#                  RETURNING r_price,r_docno,r_seq
# Input parameter: p_item      料件編號
#                : p_feature   產品特徵
#                : p_curr      幣別
#                : p_tax       稅別
#                : p_con1      付款條件
#                : p_con2      交易條件
#                : p_path      採購通路
#                : p_qty       計價數量
#                : p_site      營運據點
#                : p_scc40     汇率类型
#                : p_imaa009   產品分類
#                : p_imaa127   系列
#                : p_sql       取得核價資料的sql
# Return code....: r_price     取出單價
#                : r_docno     單號
#                : r_seq       項次
# Date & Author..: 140630 By pengu
# Modify.........:
################################################################################
PUBLIC FUNCTION s_purchase_price_apmt440_2(p_item,p_feature,p_curr,p_tax,p_con1,p_con2,p_path,p_qty,p_site,p_scc40,p_imaa009,p_imaa127,p_sql)
DEFINE p_item       LIKE pmdn_t.pmdn001
DEFINE p_feature    LIKE pmdn_t.pmdn002
DEFINE p_curr       LIKE pmdl_t.pmdl015
DEFINE p_tax        LIKE pmdl_t.pmdl011
DEFINE p_con1       LIKE pmdl_t.pmdl009
DEFINE p_con2       LIKE pmdl_t.pmdl010
DEFINE p_path       LIKE pmdl_t.pmdl023
DEFINE p_qty        LIKE pmdn_t.pmdn011
DEFINE p_site       LIKE pmdl_t.pmdlsite
DEFINE p_scc40      LIKE type_t.chr2
DEFINE p_imaa009    LIKE imaa_t.imaa009
DEFINE p_imaa127    LIKE imaa_t.imaa127
DEFINE p_sql        STRING
DEFINE r_price      LIKE pmdn_t.pmdn043
DEFINE r_docno      LIKE pmdj_t.pmdjdocno
DEFINE r_seq        LIKE pmdj_t.pmdjseq
DEFINE l_p_sql      STRING

   LET r_price = ''
   LET r_docno = ''
   LET r_seq = ''

   LET l_p_sql = p_sql,
                 " AND COALESCE(pmdj003,' ') = COALESCE('",p_feature,"',' ') ",
                 " AND pmdi009 = '",p_con1,"' ",
                 " AND pmdi011 = '",p_con2,"' ",
                 " AND pmdi005 = '",p_curr,"' ",
                 " AND pmdi006 = '",p_tax,"' ",
#160621-00003#9-s mod
#                " AND pmdi019 = '",p_path,"' "
                 " AND COALESCE(pmdi019,' ') = COALESCE('",p_path,"',' ')"
#160621-00003#9-e mod
   #170617-00175#1----mark----begin-----
   #关于核價單無設置限制條件在下方有写，此部分mark
   #160413-00011#8---mod---begin
   #LET l_p_sql = p_sql," AND COALESCE(pmdj003,' ') = COALESCE('",p_feature,"',' ') ",
                      #160919-00041#1  --begin--
                      #" AND ((pmdi009 = '",p_con1,"' AND pmdi011 = '",p_con2,"' AND pmdi005 = '",p_curr,"' AND pmdi006 = '",p_tax,"' AND pmdi019 = '",p_path,"' ) OR (NOT (pmdi009 = '",p_con1,"' AND pmdi011 = '",p_con2,"' AND pmdi005 = '",p_curr,"' AND pmdi006 = '",p_tax,"' AND pmdi019 = '",p_path,"') AND ((pmdi010 = 'N' OR pmdi009 = '",p_con1,"') AND (pmdi012 = 'N' OR pmdi011 = '",p_con2,"') AND (pmdi031 = 'N' OR pmdi005 = '",p_curr,"') AND (pmdi032 = 'N' OR pmdi006 = '",p_tax,"') AND (pmdi020 = 'N' OR pmdi019 = '",p_path,"'))))"
                      #" AND ((pmdi009 = '",p_con1,"' AND pmdi011 = '",p_con2,"' AND pmdi005 = '",p_curr,"' AND pmdi006 = '",p_tax,"' AND COALESCE(pmdi019,' ') = COALESCE('",p_path,"',' ') ) OR ",                    
                      #"      (NOT (pmdi009 = '",p_con1,"' AND pmdi011 = '",p_con2,"' AND pmdi005 = '",p_curr,"' AND pmdi006 = '",p_tax,"' AND COALESCE(pmdi019,' ') = COALESCE('",p_path,"',' ')) AND ",
                      # "      ((pmdi010 = 'N' OR pmdi009 = '",p_con1,"') AND (pmdi012 = 'N' OR pmdi011 = '",p_con2,"') AND (pmdi031 = 'N' OR pmdi005 = '",p_curr,"') AND ",
                      # "       (pmdi032 = 'N' OR pmdi006 = '",p_tax,"') AND (pmdi020 = 'N' OR COALESCE(pmdi019,' ') = COALESCE('",p_path,"',' ')))))"
                      #160919-00041#1  --end--
   #160413-00011#8---mod---end
   #170617-00175#1----mark----end-----   
   CALL s_purchase_price_apmt440_1(p_item,p_curr,p_tax,p_qty,p_site,p_scc40,p_imaa009,p_imaa127,l_p_sql)
        RETURNING r_price,r_docno,r_seq
  #RETURN r_price,r_docno,r_seq   #160413-00011#8   #170926-00008#1 mark
   
   
   #產品特徵為空
   IF cl_null(r_price) AND NOT cl_null(p_feature) THEN
      LET l_p_sql = p_sql,
                    " AND COALESCE(pmdj003,' ') = ' ' ",
                    " AND pmdi009 = '",p_con1,"' ",
                    " AND pmdi011 = '",p_con2,"' ",
                    " AND pmdi005 = '",p_curr,"' ",
                    " AND pmdi006 = '",p_tax,"' ",
#160621-00003#9-s mod
#                " AND pmdi019 = '",p_path,"' "
                 " AND COALESCE(pmdi019,' ') = COALESCE('",p_path,"',' ')"
#160621-00003#9-e mod
      CALL s_purchase_price_apmt440_1(p_item,p_curr,p_tax,p_qty,p_site,p_scc40,p_imaa009,p_imaa127,l_p_sql)
           RETURNING r_price,r_docno,r_seq
   END IF
   
   #核價單無設置限制條件
   IF cl_null(r_price) THEN
      LET l_p_sql = p_sql,
                    " AND COALESCE(pmdj003,' ') = COALESCE('",p_feature,"',' ') ",
                    " AND (pmdi010 = 'N' OR pmdi009 = '",p_con1,"') ",
                    " AND (pmdi012 = 'N' OR pmdi011 = '",p_con2,"') ",
                    " AND (pmdi031 = 'N' OR pmdi005 = '",p_curr,"') ",
                    " AND (pmdi032 = 'N' OR pmdi006 = '",p_tax,"') ",
#160621-00003#9-s mod
#                   " AND (pmdi020 = 'N' OR pmdi019 = '",p_path,"') "
                    " AND (pmdi020 = 'N' OR COALESCE(pmdi019,' ') = COALESCE('",p_path,"',' ')) "
#160621-00003#9-e mod
      CALL s_purchase_price_apmt440_1(p_item,p_curr,p_tax,p_qty,p_site,p_scc40,p_imaa009,p_imaa127,l_p_sql)
           RETURNING r_price,r_docno,r_seq
   END IF
   
   #核價單無設置限制條件且產品特徵為空
   IF cl_null(r_price) AND NOT cl_null(p_feature) THEN
      LET l_p_sql = p_sql,
                    " AND COALESCE(pmdj003,' ') = ' ' ",
                    " AND (pmdi010 = 'N' OR pmdi009 = '",p_con1,"') ",
                    " AND (pmdi012 = 'N' OR pmdi011 = '",p_con2,"') ",
                    " AND (pmdi031 = 'N' OR pmdi005 = '",p_curr,"') ",
                    " AND (pmdi032 = 'N' OR pmdi006 = '",p_tax,"') ",
#160621-00003#9-s mod
#                   " AND (pmdi020 = 'N' OR pmdi019 = '",p_path,"') "
                    " AND (pmdi020 = 'N' OR COALESCE(pmdi019,' ') = COALESCE('",p_path,"',' ')) "
#160621-00003#9-e mod
      CALL s_purchase_price_apmt440_1(p_item,p_curr,p_tax,p_qty,p_site,p_scc40,p_imaa009,p_imaa127,l_p_sql)
           RETURNING r_price,r_docno,r_seq
   END IF

   RETURN r_price,r_docno,r_seq
END FUNCTION

################################################################################
# Descriptions...: 核價對象管制
# Memo...........:
# Usage..........: CALL s_purchase_price_apmt440_3(p_client,p_item,p_feature,p_curr,p_tax,p_con1,p_con2,p_path,p_qty,p_site,p_scc40,p_imaa009,p_imaa127,p_sql)
#                  RETURNING r_price,r_docno,r_seq
# Input parameter: p_client    供應商編號
#                : p_item      料件編號
#                : p_feature   產品特徵
#                : p_curr      幣別
#                : p_tax       稅別
#                : p_con1      付款條件
#                : p_con2      交易條件
#                : p_path      採購通路
#                : p_qty       計價數量
#                : p_site      營運據點
#                : p_scc40     汇率类型
#                : p_imaa009   產品分類
#                : p_imaa127   系列
#                : p_sql       取得核價資料的sql
# Return code....: r_price     取出單價
#                : r_docno     參考單號
#                : r_seq       參考項次
# Date & Author..: 140630 By pengu
# Modify.........: 151211-00010#1 2015/12/11 modify by ming 呼叫function時的傳入值應該是l_p_sql而非p_sql
################################################################################
PUBLIC FUNCTION s_purchase_price_apmt440_3(p_client,p_item,p_feature,p_curr,p_tax,p_con1,p_con2,p_path,p_qty,p_site,p_scc40,p_imaa009,p_imaa127,p_sql)
DEFINE p_client  LIKE pmdl_t.pmdl004
DEFINE p_item       LIKE pmdn_t.pmdn001
DEFINE p_feature    LIKE pmdn_t.pmdn002
DEFINE p_curr       LIKE pmdl_t.pmdl015
DEFINE p_tax        LIKE pmdl_t.pmdl011
DEFINE p_con1       LIKE pmdl_t.pmdl009
DEFINE p_con2       LIKE pmdl_t.pmdl010
DEFINE p_path       LIKE pmdl_t.pmdl023
DEFINE p_qty        LIKE pmdn_t.pmdn011
DEFINE p_site       LIKE pmdl_t.pmdlsite
DEFINE p_scc40      LIKE type_t.chr2
DEFINE p_imaa009    LIKE imaa_t.imaa009
DEFINE p_imaa127    LIKE imaa_t.imaa127
DEFINE p_sql        STRING
DEFINE r_price      LIKE pmdn_t.pmdn043
DEFINE r_docno      LIKE pmdn_t.pmdndocno
DEFINE r_seq        LIKE pmdn_t.pmdnseq
DEFINE l_pmaa005    LIKE pmaa_t.pmaa005
DEFINE l_pmaa006    LIKE pmaa_t.pmaa006
DEFINE l_p_sql      STRING

   LET r_price = ''
   LET r_docno = ''
   LET r_seq = ''
   #160413-00011#8---mod---begin
   #LET l_p_sql = p_sql," AND pmdi004 = '",p_client,"' "
   LET l_pmaa005 = ''
   LET l_pmaa006 = ''
   SELECT pmaa005,pmaa006 INTO l_pmaa005,l_pmaa006 FROM pmaa_t
    WHERE pmaaent = g_enterprise AND pmaa001 = p_client   
   LET l_p_sql = p_sql," AND ((pmdi004 = '",p_client,"') OR (NOT(pmdi004 = '",p_client,"') AND ((pmdi017 = '2' AND pmdi004 IN ( SELECT pmaa001 FROM pmaa_t WHERE pmaaent = '",g_enterprise,"' AND pmaa005 = '",l_pmaa005,"' AND pmaastus = 'Y' ) ) OR (NOT(pmdi017 = '2' AND pmdi004 IN ( SELECT pmaa001 FROM pmaa_t WHERE pmaaent = '",g_enterprise,"' AND pmaa005 = '",l_pmaa005,"' AND pmaastus = 'Y' )) AND (pmdi017 = '3' AND pmdi004 IN ( SELECT pmaa001 FROM pmaa_t WHERE pmaaent = '",g_enterprise,"' AND pmaa006 = '",l_pmaa006,"' AND pmaastus = 'Y' ))))))"
   #160413-00011#8---mod---end
   #151211-00010#1 20151211 modify by ming -----(S) 
   #CALL s_purchase_price_apmt440_2(p_item,p_feature,p_curr,p_tax,p_con1,p_con2,p_path,p_qty,p_site,p_scc40,p_imaa009,p_imaa127,p_sql)
   #     RETURNING r_price,r_docno,r_seq
   CALL s_purchase_price_apmt440_2(p_item,p_feature,p_curr,p_tax,p_con1,p_con2, 
                                   p_path,p_qty,p_site,p_scc40,p_imaa009,p_imaa127,l_p_sql)
        RETURNING r_price,r_docno,r_seq
   #151211-00010#1 20151211 modify by ming -----(S) 
   RETURN r_price,r_docno,r_seq   #160413-00011#8 add
   
   IF cl_null(r_price) THEN
      #抓該據點對其他客戶(該客戶所對應的法人與本次傳入的客戶對應法人相同)所簽的合約單
      #且合約單上的'合約對像管制為'2.同法人適用'
      LET l_pmaa005 = ''
      LET l_pmaa006 = ''
      SELECT pmaa005,pmaa006 INTO l_pmaa005,l_pmaa006 FROM pmaa_t
       WHERE pmaaent = g_enterprise AND pmaa001 = p_client
      LET l_p_sql = p_sql," AND pmdi017 = '2' ",
                          " AND pmdi004 IN ( SELECT pmaa001 FROM pmaa_t WHERE pmaaent = '",g_enterprise,"' AND pmaa005 = '",l_pmaa005,"' AND pmaastus = 'Y' ) "
      #151211-00010#1 20151211 modify by ming -----(S) 
      #CALL s_purchase_price_apmt440_2(p_item,p_feature,p_curr,p_tax,p_con1,p_con2,p_path,p_qty,p_site,p_scc40,p_imaa009,p_imaa127,p_sql)
      #     RETURNING r_price,r_docno,r_seq
      CALL s_purchase_price_apmt440_2(p_item,p_feature,p_curr,p_tax,p_con1,p_con2, 
                                      p_path,p_qty,p_site,p_scc40,p_imaa009,p_imaa127,l_p_sql)
           RETURNING r_price,r_docno,r_seq
      #151211-00010#1 20151211 modify by ming -----(E) 
   END IF
   
   IF cl_null(r_price) THEN
      #抓該據點對其他客戶(該客戶所對應的集團與本次傳入的客戶對應集團相同)所簽的合約單
      #且合約單上的'合約對像管制為'3.同集團適用'
      LET l_p_sql = p_sql," AND pmdi017 = '3' ",
                          " AND pmdi004 IN ( SELECT pmaa001 FROM pmaa_t WHERE pmaaent = '",g_enterprise,"' AND pmaa006 = '",l_pmaa006,"' AND pmaastus = 'Y' ) "
      #151211-00010#1 20151211 modify by ming -----(S) 
      #CALL s_purchase_price_apmt440_2(p_item,p_feature,p_curr,p_tax,p_con1,p_con2,p_path,p_qty,p_site,p_scc40,p_imaa009,p_imaa127,p_sql)
      #     RETURNING r_price,r_docno,r_seq
      CALL s_purchase_price_apmt440_2(p_item,p_feature,p_curr,p_tax,p_con1,p_con2, 
                                      p_path,p_qty,p_site,p_scc40,p_imaa009,p_imaa127,l_p_sql)
           RETURNING r_price,r_docno,r_seq
      #151211-00010#1 20151211 modify by ming -----(S) 
   END IF

   RETURN r_price,r_docno,r_seq
END FUNCTION

################################################################################
# Descriptions...: 抓取符合條件的彈性價格
# Memo...........:
# Usage..........: CALL s_purchase_price_apmi128(p_pmas002,p_pmas011,p_pmas012,p_pmas013,p_pmau011,p_pmau012,p_pmau031,p_pmau032,p_sql)
#                  RETURNING r_price,r_docno
# Input parameter: p_pmas002   是否考慮產品特徵
#                : p_pmas011   是否考慮料件編號
#                : p_pmas012   是否考慮系列
#                : p_pmas013   是否考慮產品分類
#                : p_pmau011   料件編號
#                : p_pmau012   產品特徵
#                : p_pmau031   系列
#                : p_pmau032   產品分類
#                : p_sql       取得彈性價格資料的sql
# Return code....: r_price     取出單價
#                : r_docno     單號
# Date & Author..: 150625 By whitney
# Modify.........:
################################################################################
PUBLIC FUNCTION s_purchase_price_apmi128(p_pmas002,p_pmas011,p_pmas012,p_pmas013,p_pmau011,p_pmau012,p_pmau031,p_pmau032,p_sql)
DEFINE p_pmas002    LIKE xmas_t.xmas002
DEFINE p_pmas011    LIKE xmas_t.xmas011
DEFINE p_pmas012    LIKE xmas_t.xmas012
DEFINE p_pmas013    LIKE xmas_t.xmas013
DEFINE p_pmau011    LIKE pmau_t.pmau011
DEFINE p_pmau012    LIKE pmau_t.pmau012
DEFINE p_pmau031    LIKE pmau_t.pmau031
DEFINE p_pmau032    LIKE pmau_t.pmau032
DEFINE p_sql        STRING
DEFINE r_price      LIKE xmdu_t.xmdu011
DEFINE r_docno      LIKE xmdt_t.xmdtdocno
DEFINE l_pmau  RECORD
    pmau011    LIKE pmau_t.pmau011,    #料件編號
    pmau012    LIKE pmau_t.pmau012,    #產品特徵
    pmau022    LIKE pmau_t.pmau022,    #單價
    pmau100    LIKE pmau_t.pmau100     #申請單號
           END RECORD
DEFINE l_n          LIKE type_t.num5
DEFINE l_sql        STRING

   LET r_price = ''
   LET r_docno = ''

   #料號
   IF p_pmas011 = 'Y' AND NOT cl_null(p_pmau011) THEN
      INITIALIZE l_pmau.* TO NULL
      LET l_sql = p_sql," ORDER BY pmau011 "
      PREPARE s_purchase_price_apmi128_pre1 FROM l_sql
      DECLARE s_purchase_price_apmi128_cur1 CURSOR FOR s_purchase_price_apmi128_pre1
      FOREACH s_purchase_price_apmi128_cur1 INTO l_pmau.pmau011,l_pmau.pmau012,l_pmau.pmau022,l_pmau.pmau100
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "FOREACH:"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            EXIT FOREACH
         END IF
         #產品特徵
         IF p_pmas002 = 'Y' AND l_pmau.pmau012 <> p_pmau012 THEN
            CONTINUE FOREACH
         END IF
         IF l_pmau.pmau011 = p_pmau011 THEN
            LET r_price = l_pmau.pmau022
            LET r_docno = l_pmau.pmau100
            EXIT FOREACH
         ELSE
            IF NOT cl_null(l_pmau.pmau011) THEN
               CALL s_chr_get_index_of(l_pmau.pmau011,'*',1) RETURNING l_n
               IF l_n <> 0 THEN
                  CALL cl_str_replace(l_pmau.pmau011,'*','%') RETURNING l_pmau.pmau011
                  IF p_pmau011 LIKE l_pmau.pmau011 THEN
                     #一旦有相符的也繼續continue，避免之後有整個料號符合的
                     LET r_price = l_pmau.pmau022
                     LET r_docno = l_pmau.pmau100
                     CONTINUE FOREACH
                  END IF
               END IF
            END IF
         END IF
      END FOREACH
   END IF

   #系列
   IF cl_null(r_price) AND p_pmas012 = 'Y' AND NOT cl_null(p_pmau031) THEN
      INITIALIZE l_pmau.* TO NULL
      LET l_sql = p_sql," AND pmau031 = '",p_pmau031,"' ORDER BY pmau011 "
      PREPARE s_purchase_price_apmi128_pre2 FROM l_sql
      DECLARE s_purchase_price_apmi128_cur2 CURSOR FOR s_purchase_price_apmi128_pre2
      FOREACH s_purchase_price_apmi128_cur2 INTO l_pmau.pmau011,l_pmau.pmau012,l_pmau.pmau022,l_pmau.pmau100
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "FOREACH:"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            EXIT FOREACH
         END IF
         IF NOT cl_null(l_pmau.pmau022) THEN
            LET r_price = l_pmau.pmau022
            LET r_docno = l_pmau.pmau100
            EXIT FOREACH
         END IF
      END FOREACH
   END IF

   #產品分類
   IF cl_null(r_price) AND p_pmas013 = 'Y' AND NOT cl_null(p_pmau032) THEN
      INITIALIZE l_pmau.* TO NULL
      LET l_sql = p_sql," AND pmau032 = '",p_pmau032,"' ORDER BY pmau011 "
      PREPARE s_purchase_price_apmi128_pre3 FROM l_sql
      DECLARE s_purchase_price_apmi128_cur3 CURSOR FOR s_purchase_price_apmi128_pre3
      FOREACH s_purchase_price_apmi128_cur3 INTO l_pmau.pmau011,l_pmau.pmau012,l_pmau.pmau022,l_pmau.pmau100
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "FOREACH:"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            EXIT FOREACH
         END IF
         IF NOT cl_null(l_pmau.pmau022) THEN
            LET r_price = l_pmau.pmau022
            LET r_docno = l_pmau.pmau100
            EXIT FOREACH
         END IF
      END FOREACH
   END IF

#   IF cl_null(r_price) THEN
#      INITIALIZE l_pmau.* TO NULL
#      FOREACH s_purchase_price_apmi128_cur1 INTO l_pmau.pmau011,l_pmau.pmau012,l_pmau.pmau022,l_pmau.pmau100
#         IF SQLCA.sqlcode THEN
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.code = SQLCA.sqlcode
#            LET g_errparam.extend = "FOREACH:"
#            LET g_errparam.popup = TRUE
#            CALL cl_err()
#            EXIT FOREACH
#         END IF
#         IF NOT cl_null(l_pmau.pmau022) THEN
#            LET r_price = l_pmau.pmau022
#            LET r_docno = l_pmau.pmau100
#            EXIT FOREACH
#         END IF
#      END FOREACH
#   END IF

   FREE s_purchase_price_apmi128_pre1
   FREE s_purchase_price_apmi128_pre2
   FREE s_purchase_price_apmi128_pre3

   RETURN r_price,r_docno
END FUNCTION

 
{</section>}
 
