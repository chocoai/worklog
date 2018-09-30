#該程式未解開Section, 採用最新樣板產出!
#該程式為freestyle程式!
{<section id="s_aapt430.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0030(1900-01-01 00:00:00), PR版次:0030(2018-01-31 16:28:01)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000182
#+ Filename...: s_aapt430
#+ Description: 費用分攤子程式
#+ Creator....: 03080(2014-08-17 15:46:31)
#+ Modifier...: 00000 -SD/PR- 07423
 
{</section>}
 
{<section id="s_aapt430.global" type="s" >}
#應用 p00 樣板自動產生(Version:6)
#add-point:填寫註解說明 name="main.memo"
#150303           2015/03/03 By Reanna   產生axct310單據，金額若無須給0
#151207-00018#3   2015/12/10 By Belle    增加暫估分攤的功能
#150602-00057#3   2016/03/09 By Reanna   依據參數判斷(D-FIN-5001)資料建立者與確認者是否可為同一人
#160816-00022#1   2106/08/22 By 03538    增加元件檢核目的帳款單據之合理性
#160920-00046#1   2016/09/26 By Reanna   目的帳款單據的"交易單據"需檢核為帳款單性質"13"or"17"
#161018-00009#1   2016/10/18 By Reanna   修正#160920-00046#1檢核bug
#161111-00048#4   2016/11/15 By 08171    SUB_程式中DEFINE / INSERT INTO 有星號整批調整
#161104-00049#1   2016/11/24 By Reanna   分攤目的頁籤開放選擇01,03類型的應付暫估單
#161208-00026#25  2016/12/13 By 08732    SUB_程式中DEFINE / INSERT INTO 有星號整批調整(針對SELECT *的部份)
#170210-00017#2   2017/02/10 by 06814    修正SQL語句沒有ENT條件
#170214-00004#1   2017/02/14 By Reanna   03.04暫估性質分攤時不回寫多帳期
#161108-00005#1   2017/02/22 By 08729    新增aapt430_03與aapt430_04作業
#170326-00008#1   2017/03/27 By Sabrina  在產生單身資料時，應只抓取已確認的單據來寫入
#170323-00019#1   2017/04/07 By Sabrina  確認時增加提示料件成本相關警訊
#170414-00068#1   2017/04/18 By 02114    1.抓取pmds资料时,应该要抓取已过账的资料
#                                        2.若已经产生到单身,则不可再重复产生
#170419-00029#1   2017/04/19 By 02114    来源账款明细科目页签的科目抓取单身的科目
#170420-00051#1   2017/04/24 By Reanna   產批產生單身寫入部門apce018應改取apcb010
#170424-00024#1   2017/04/25 By dorishsu 當aoos020采用成本域否(S-FIN-6001)='Y'且axci100計價方式選6按域設置,才寫xcco002
#170501-00007#1   2017/05/17 By 06821    apdc增加帳款對象/付款對象欄位寫入,當目的分攤方式為 1:依入庫單據 抓取原單據對象給予 ; 2:依產品號碼 預設空白
#170525-00042#1   2017/05/26 By dorishsu PREPARE s_aapt430_apdcp1語法,1.移除apdcorga 2.JOIN 增加apdcsite = inajsite 3.inaj010如果是null轉成' '
#170609-00067#1   2017/06/14 By dorishsu 待抵類費用分攤回寫多帳期(s_aapt430_upd_apcc), 要排除22:仓退待抵单
#170618-00252#1   170618     By albireo  待抵類費用分攤回寫多帳期(s_aapt430_upd_apcc), 要排除24:溢付待抵单  29:其他待抵单
#170704-00080#1   2017/07/04 By Reanna   審核時效能優化
#171123-00043#1   2017/11/27 By 05599    170424-00024这个单的处理还原
#170421-00027#18  2018/01/02 By 10554    檢核科目是否滿足agli061限制條件。
#171012-00009#1   2018/01/26 By 07423    產生xcco_t資料時,考慮成本計算方式
#end add-point
#add-point:填寫註解說明(客製用) name="main.memo_customerization"

#end add-point
#(ver:6) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:6) --- end ---
 
IMPORT os
#add-point:增加匯入項目 name="main.import"
IMPORT util   #170421-00027#18 add
#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
{</section>}
 
{<section id="s_aapt430.free_style_variable" type="s" >}
#add-point:free_style模組變數(Module Variable) name="free_style.variable"

#end add-point
 
{</section>}
 
{<section id="s_aapt430.global_variable" type="s" >}
#add-point:自定義模組變數(Module Variable) name="global.variable"

#end add-point
 
{</section>}
 
{<section id="s_aapt430.other_dialog" type="s" >}

 
{</section>}
 
{<section id="s_aapt430.other_function" readonly="Y" type="s" >}

################################################################################
# Descriptions...: 費用分攤單確認檢查段
# Memo...........:
# Date & Author..: 14/08/17 By albireo
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt430_conf_chk(p_ld,p_docno)
DEFINE p_ld                LIKE apda_t.apdald
DEFINE p_docno             LIKE apda_t.apdadocno
DEFINE r_success           LIKE type_t.num5
DEFINE l_sql               STRING
DEFINE l_apda              RECORD
         apdastus          LIKE apda_t.apdastus,
         apdadocdt         LIKE apda_t.apdadocdt,
         apda113           LIKE apda_t.apda113,
         apdacomp          LIKE apda_t.apdacomp,  #150602-00057#3 add,
         apdacrtid         LIKE apda_t.apdacrtid  #150602-00057#3 add
                           END RECORD
DEFINE l_diff              RECORD
         sum_apdc          LIKE type_t.num20_6,
         sum_apce          LIKE type_t.num20_6
                           END RECORD
DEFINE l_apdc113_sum       LIKE apdc_t.apdc113
DEFINE l_apdc213_sum       LIKE apdc_t.apdc213
DEFINE l_date_s_fin_3007   LIKE type_t.dat
DEFINE l_date_s_fin_6012   LIKE type_t.dat
DEFINE l_apdc211           LIKE apdc_t.apdc211
DEFINE l_glaa121           LIKE glaa_t.glaa121        #141218-00011#6
DEFINE l_dfin0030          LIKE type_t.chr1
DEFINE l_ap_slip           LIKE ooba_t.ooba002        #總帳單別
#150602-00057#3 add ------
DEFINE l_success           LIKE type_t.num5
DEFINE l_dfin5001          LIKE type_t.chr1
DEFINE l_ooba002           LIKE ooba_t.ooba002
#150602-00057#3 add end---
DEFINE l_apce003           LIKE apce_t.apce003    #170323-00019#1 add
DEFINE l_apcb001           LIKE apcb_t.apcb001    #170323-00019#1 add
DEFINE l_apcb004           LIKE apcb_t.apcb004    #170323-00019#1 add
DEFINE l_imaa004           LIKE imaa_t.imaa004    #170323-00019#1 add
#170421-00027#18--add--start--
DEFINE l_apce016        LIKE apce_t.apce016 #單身 來源會計科目
DEFINE l_apdc007        LIKE apdc_t.apdc007 #單身 目的會計科目
DEFINE ls_js            STRING
DEFINE lc_param  RECORD
       glbi001   LIKE glbi_t.glbi001,   #作業編號 
       glbild    LIKE glbi_t.glbild,    #帳套
       docno     LIKE xrca_t.xrcadocno, #單號OR單別
       glbi003   LIKE glbi_t.glbi003    #科目編號  
       END RECORD
#170421-00027#18--add--end--

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   
   INITIALIZE l_apda.* TO NULL
   #150602-00057#3 add apdacrtid
   SELECT apdastus,apdadocdt,apda113,apdacomp,apdacrtid INTO l_apda.*
     FROM apda_t
    WHERE apdaent = g_enterprise
      AND apdald  = p_ld
      AND apdadocno = p_docno
   CALL s_ld_sel_glaa(p_ld,'glaa121') RETURNING  g_sub_success,l_glaa121   #141202-00061#17     
   #檢查狀態是否符合
   CASE
      WHEN l_apda.apdastus = 'N' OR l_apda.apdastus = 'D' OR l_apda.apdastus = 'R'
      
      WHEN l_apda.apdastus = 'Y'
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'axm-00020'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      WHEN l_apda.apdastus = 'X'
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'axm-00021'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
   END CASE   
   
   #應付關帳日S-FIN-3007、成本關帳日S-FIN-6012 (取法人ＳＩＴＥ參數設定)
   #確認前檢核：
   #來源應攤銷金額 = 目的已攤金額
　 #攤銷日期＜＝成本關帳日期　＆　攤銷日期＜＝應付關帳日期　；取法人參數值。
   
   #分攤金額尚未攤銷完畢不可確認
   INITIALIZE l_diff.* TO NULL
   SELECT SUM(apdc113),SUM(apdc213) INTO l_apdc113_sum,l_apdc213_sum
     FROM apdc_t
    WHERE apdcld = p_ld
      AND apdcent = g_enterprise
      AND apdcdocno = p_docno
   IF cl_null(l_apdc113_sum)THEN LET l_apdc113_sum = 0 END IF
   IF cl_null(l_apdc213_sum)THEN LET l_apdc213_sum = 0 END IF
   #算出目的單據的已攤銷總額
   LET l_diff.sum_apdc = l_apdc213_sum - l_apdc113_sum
   IF cl_null(l_diff.sum_apdc)THEN LET l_diff.sum_apdc = 0 END IF
   IF (l_apda.apda113 - l_diff.sum_apdc) <> 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.code = 'aap-00282'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF
   
   
   #攤銷日期＜＝成本關帳日期　＆　攤銷日期＜＝應付關帳日期　；取法人參數值。
   #日期檢查
   #檢查應付關帳日
   LET l_date_s_fin_3007 = NULL
   CALL cl_get_para(g_enterprise,l_apda.apdacomp,'S-FIN-3007') RETURNING l_date_s_fin_3007

   #檢察成本關帳日
   LET l_date_s_fin_6012 = NULL
   CALL cl_get_para(g_enterprise,l_apda.apdacomp,'S-FIN-6012') RETURNING l_date_s_fin_6012
   
   IF NOT cl_null(l_date_s_fin_3007) THEN
      IF l_apda.apdadocdt <= l_date_s_fin_3007 THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.code = 'aap-00283'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
   END IF
   IF NOT cl_null(l_date_s_fin_6012) THEN
      IF l_apda.apdadocdt <= l_date_s_fin_6012 THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.code = 'aap-00284'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
   END IF
   
   
   #分攤後金額不可為負數，才可確認
   LET l_sql = " SELECT apdc211",
               "   FROM apdc_t ",
               "  WHERE apdcent = ",g_enterprise,
               "    AND apdcld = '",p_ld,"'",
               "    AND apdcdocno = '",p_docno,"'"
   PREPARE sel_aapt430_apdcp3 FROM l_sql
   DECLARE sel_aapt430_apdcc3 CURSOR FOR sel_aapt430_apdcp3
   FOREACH sel_aapt430_apdcc3 INTO l_apdc211
      IF l_apdc211 < 0 THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.code = 'aap-00303'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
   END FOREACH

   #141218-00011#6   
   CALL s_aooi200_fin_get_slip(p_docno) RETURNING g_sub_success,l_ap_slip               
   CALL s_fin_get_doc_para(p_ld,l_apda.apdacomp,l_ap_slip,'D-FIN-0030') RETURNING l_dfin0030
   IF l_dfin0030 = 'Y' THEN
      IF l_glaa121 = 'Y' THEN    
         CALL s_chk_voucher('AP','P30',p_ld,p_docno) RETURNING g_sub_success
      ELSE
         CALL s_aapt430_account_item_chk(p_ld,p_docno) RETURNING g_sub_success
      END IF
      IF NOT g_sub_success THEN
         LET r_success = FALSE
      END IF
   END IF
   
   #150602-00057#3 add ------
   #資料建立者與確認者為同一人，不可確認！
   CALL s_aooi200_fin_get_slip(p_docno) RETURNING l_success,l_ooba002
   CALL s_fin_chk_E5001(p_ld,l_apda.apdacomp,l_ooba002) RETURNING l_dfin5001
   IF l_dfin5001 = 'N' THEN
      IF l_apda.apdacrtid = g_user THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'axr-00346'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
   END IF
   #150602-00057#3 add end---
   
   #170323-00019#1---add---start---
   LET l_sql = " SELECT apce003",
               "   FROM apce_t ",
               "  WHERE apceent = ",g_enterprise,
               "    AND apceld = '",p_ld,"'",
               "    AND apcedocno = '",p_docno,"'"
   PREPARE sel_aapt430_apcep FROM l_sql
   DECLARE sel_aapt430_apcec CURSOR FOR sel_aapt430_apcep
   FOREACH sel_aapt430_apcec INTO l_apce003
       LET l_sql = " SELECT apcb001,apcb004",
                   "   FROM apcb_t ",
                   "  WHERE apcbent = ",g_enterprise,
                   "    AND apcbld = '",p_ld,"'",
                   "    AND apcbdocno = '",l_apce003,"'"
       PREPARE sel_aapt430_apcbp FROM l_sql
       DECLARE sel_aapt430_apcbc CURSOR FOR sel_aapt430_apcbp
       FOREACH sel_aapt430_apcbc INTO l_apcb001,l_apcb004
           SELECT imaa004 INTO l_imaa004 FROM imaa_t
            WHERE imaa001 = l_apcb004
            IF l_apcb001 ='21' AND (l_imaa004 = 'A' OR l_imaa004 = 'M') THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'aap-00456'
               LET g_errparam.extend = l_apcb004
               LET g_errparam.popup = TRUE
               CALL cl_err()
            END IF   
       END FOREACH
   END FOREACH    
   #170323-00019#1---add---end---
   #170421-00027#18--add--start-- 
   #單身[來源會計科目]檢核   
   LET l_sql = " SELECT DISTINCT apce016 FROM apce_t  ",
               " WHERE apceent = '",g_enterprise,"'",
               "   AND apceld = '",p_ld,"'",
               "   AND apcedocno = '",p_docno,"'"             
   PREPARE l_apce016_pre FROM l_sql
   DECLARE l_apce016_cs CURSOR FOR l_apce016_pre
   FOREACH l_apce016_cs INTO l_apce016
           IF NOT cl_null(l_apce016) THEN      
              LET lc_param.glbi001 = g_prog
              LET lc_param.glbild  = p_ld
              LET lc_param.docno   = p_docno
              LET lc_param.glbi003 = l_apce016
              LET ls_js = util.JSON.stringify(lc_param)
              CALL s_voucher_hsx_glbi_chk(ls_js) RETURNING l_success
              IF NOT l_success THEN
                 LET r_success = FALSE
              END IF
           END IF
   END FOREACH
   #單身[目的會計科目]檢核   
   LET l_sql = " SELECT DISTINCT apdc007 FROM apdc_t  ",
               " WHERE apdcent = '",g_enterprise,"'",
               "   AND apdcld = '",p_ld,"'",
               "   AND apdcdocno = '",p_docno,"'"             
   PREPARE l_apdc007_pre FROM l_sql
   DECLARE l_apdc007_cs CURSOR FOR l_apdc007_pre
   FOREACH l_apdc007_cs INTO l_apdc007
           IF NOT cl_null(l_apdc007) THEN      
              LET lc_param.glbi001 = g_prog
              LET lc_param.glbild  = p_ld
              LET lc_param.docno   = p_docno
              LET lc_param.glbi003 = l_apdc007
              LET ls_js = util.JSON.stringify(lc_param)
              CALL s_voucher_hsx_glbi_chk(ls_js) RETURNING l_success
              IF NOT l_success THEN
                 LET r_success = FALSE
              END IF
           END IF
   END FOREACH
   #170421-00027#18--add--end--
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 費用分攤單確認upd段
# Memo...........:
# Date & Author..: 14/08/17 By albireo
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt430_conf_upd(p_ld,p_docno)
DEFINE p_ld          LIKE apda_t.apdald
DEFINE p_docno       LIKE apda_t.apdadocno
DEFINE l_date        DATETIME YEAR TO SECOND
DEFINE r_success     LIKE type_t.num5
DEFINE l_glaa121     LIKE glaa_t.glaa121        #141202-00061#17
DEFINE l_ap_slip     LIKE apca_t.apcadocno      #141202-00061#17   
DEFINE l_apdacomp    LIKE apda_t.apdacomp       #141202-00061#17
DEFINE l_dfin0030    LIKE type_t.chr1           #141202-00061#17

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   LET l_date = cl_get_current()
   
   CALL s_ld_sel_glaa(p_ld,'glaa121') RETURNING  g_sub_success,l_glaa121   #141202-00061#17 
   CALL s_aapt430_upd_apcc(p_ld,p_docno,'+')RETURNING g_sub_success
   IF NOT g_sub_success THEN
      LET r_success = FALSE
   END IF
   
   CALL s_aapt430_ins_xcco(p_ld,p_docno)RETURNING g_sub_success
   IF NOT g_sub_success THEN
      LET r_success = FALSE
   END IF
   
   UPDATE apda_t SET apdastus = 'Y',apdacnfid = g_user,apdacnfdt = l_date
    WHERE apdaent = g_enterprise
      AND apdald  = p_ld
      AND apdadocno = p_docno
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.extend = 's_aapt430_upd_apda:'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF
   
   #141202-00061#17
   SELECT apdacomp INTO l_apdacomp
     FROM apda_t
    WHERE apdaent = g_enterprise
      AND apdald = p_ld AND apdadocno = p_docno

   CALL s_ld_sel_glaa(p_ld,'glaa121') RETURNING  g_sub_success,l_glaa121
   CALL s_aooi200_fin_get_slip(p_docno) RETURNING g_sub_success,l_ap_slip
   CALL s_fin_get_doc_para(p_ld,l_apdacomp,l_ap_slip,'D-FIN-0030') RETURNING l_dfin0030
   IF l_glaa121 = 'Y' AND l_dfin0030 = 'Y'THEN
      UPDATE glga_t SET glgastus = 'Y',
                        glgacnfid =g_user,glgacnfdt = l_date
       WHERE glgaent = g_enterprise
         AND glgald  = p_ld AND glgadocno = p_docno
         AND glga100 = 'AP' AND glga101 ='P30'
      IF SQLCA.SQLCODE THEN
         LET r_success = FALSE  
      END IF
   END IF
   #141202-00061#17
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 復原確認前檢查
# Memo...........:
# Usage..........: CALL s_aapt430_unconf_chk(p_ld,p_docno)
#                  RETURNING r_success
# Input parameter: p_ld         帳別
#                : p_docno      費用分攤單號
# Return code....: r_success    結果
# Date & Author..: 2014/11/30 By Reanna
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt430_unconf_chk(p_ld,p_docno)
DEFINE p_ld               LIKE apda_t.apdald
DEFINE p_docno            LIKE apda_t.apdadocno
DEFINE r_success          LIKE type_t.num5
DEFINE l_apda014          LIKE apda_t.apda014
DEFINE l_apdacomp         LIKE apda_t.apdacomp
DEFINE l_apdadocdt        LIKE apda_t.apdadocdt
DEFINE l_date_s_fin_3007  LIKE type_t.dat
DEFINE l_date_s_fin_6012  LIKE type_t.dat

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   
   #尚未產生傳票才可復原
   SELECT apda014,apdacomp,apdadocdt
     INTO l_apda014,l_apdacomp,l_apdadocdt
     FROM apda_t
    WHERE apdaent = g_enterprise
      AND apdald  = p_ld
      AND apdadocno = p_docno
   IF NOT cl_null(l_apda014) THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.code = 'aap-00018'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF
   
   #攤銷日期＜＝成本關帳日期　＆　攤銷日期＜＝應付關帳日期　；取法人參數值。
   #檢查應付關帳日
   LET l_date_s_fin_3007 = NULL
   CALL cl_get_para(g_enterprise,l_apdacomp,'S-FIN-3007') RETURNING l_date_s_fin_3007

   #檢察成本關帳日
   LET l_date_s_fin_6012 = NULL
   CALL cl_get_para(g_enterprise,l_apdacomp,'S-FIN-6012') RETURNING l_date_s_fin_6012

   IF NOT cl_null(l_date_s_fin_3007) THEN
      IF l_apdadocdt <= l_date_s_fin_3007 THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.code = 'aap-00283'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
   END IF
   IF NOT cl_null(l_date_s_fin_6012) THEN
      IF l_apdadocdt <= l_date_s_fin_6012 THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.code = 'aap-00284'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 復原確認資訊回寫
# Memo...........:
# Usage..........: CALL s_aapt430_unconf_upd(p_ld,p_docno)
#                  RETURNING r_success
# Input parameter: p_ld         帳別
#                : p_docno      費用分攤單號
# Return code....: r_success    結果
# Date & Author..: 2014/11/30 By Reanna
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt430_unconf_upd(p_ld,p_docno)
DEFINE p_ld          LIKE apda_t.apdald
DEFINE p_docno       LIKE apda_t.apdadocno
DEFINE l_date        DATETIME YEAR TO SECOND
DEFINE r_success     LIKE type_t.num5
DEFINE l_glaa121     LIKE glaa_t.glaa121        #141202-00061#17
DEFINE l_ap_slip     LIKE apca_t.apcadocno      #141202-00061#17   
DEFINE l_apdacomp    LIKE apda_t.apdacomp       #141202-00061#17
DEFINE l_dfin0030    LIKE type_t.chr1           #141202-00061#17

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   LET l_date = cl_get_current()
   
   CALL s_ld_sel_glaa(p_ld,'glaa121') RETURNING  g_sub_success,l_glaa121   #141202-00061#17 
   #來源單據沖銷金額
   CALL s_aapt430_upd_apcc(p_ld,p_docno,'-')RETURNING g_sub_success
   IF NOT g_sub_success THEN
      LET r_success = FALSE
   END IF
   
   #刪除已產生的成本
   DELETE FROM xcco_t
    WHERE xccoent = g_enterprise
      AND xccold  = p_ld
      AND xcco010 = '4'
      AND xcco009 = p_docno
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.extend = 'DELETE xcco_t WRONG!'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF

   UPDATE apda_t SET apdastus ='N',
                     apdacnfid = ''    ,apdacnfdt = ''
    WHERE apdaent = g_enterprise
      AND apdald  = p_ld
      AND apdadocno = p_docno
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.extend = 'UPDATE apda_t WRONG!'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF
   #141202-00061#17
   SELECT apdacomp INTO l_apdacomp
     FROM apda_t
    WHERE apdaent = g_enterprise
      AND apdald = p_ld AND apdadocno = p_docno

   CALL s_ld_sel_glaa(p_ld,'glaa121') RETURNING  g_sub_success,l_glaa121
   CALL s_aooi200_fin_get_slip(p_docno) RETURNING g_sub_success,l_ap_slip
   CALL s_fin_get_doc_para(p_ld,l_apdacomp,l_ap_slip,'D-FIN-0030') RETURNING l_dfin0030
   IF l_glaa121 = 'Y' AND l_dfin0030 = 'Y'THEN
      UPDATE glga_t SET glgastus = 'N',
                        glgacnfid ='',glgacnfdt = ''
       WHERE glgaent = g_enterprise
         AND glgald  = p_ld AND glgadocno = p_docno
         AND glga100 = 'AP' AND glga101 ='P30'
      IF SQLCA.SQLCODE THEN
         LET r_success = FALSE  
      END IF
   END IF
   #141202-00061#17
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 作廢前檢查
# Memo...........:
# Usage..........: CALL s_aapt430_void_chk(p_ld,p_docno)
#                  RETURNING r_success
# Input parameter: p_ld         帳別
#                : p_docno      費用分攤單號
# Return code....: r_success    結果
# Date & Author..: 2014/11/30 By Reanna
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt430_void_chk(p_ld,p_docno)
DEFINE p_ld          LIKE apda_t.apdald
DEFINE p_docno       LIKE apda_t.apdadocno
DEFINE r_success     LIKE type_t.num5
   
   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 作廢資訊回寫
# Memo...........:
# Usage..........: CALL s_aapt430_void_upd(p_ld,p_docno)
#                  RETURNING r_success
# Input parameter: p_ld         帳別
#                : p_docno      費用分攤單號
# Return code....: r_success    結果
# Date & Author..: 2014/11/30 By Reanna
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt430_void_upd(p_ld,p_docno)
DEFINE p_ld          LIKE apda_t.apdald
DEFINE p_docno       LIKE apda_t.apdadocno
DEFINE l_date        DATETIME YEAR TO SECOND
DEFINE r_success     LIKE type_t.num5
DEFINE l_glaa121     LIKE glaa_t.glaa121        #141202-00061#17
DEFINE l_ap_slip     LIKE apca_t.apcadocno      #141202-00061#17   
DEFINE l_apdacomp    LIKE apda_t.apdacomp       #141202-00061#17
DEFINE l_dfin0030    LIKE type_t.chr1           #141202-00061#17
   
   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   LET l_date = cl_get_current()
   CALL s_ld_sel_glaa(p_ld,'glaa121') RETURNING  g_sub_success,l_glaa121   #141202-00061#17 
   
   UPDATE apda_t SET apdastus= 'X'
    WHERE apdaent = g_enterprise
      AND apdald  = p_ld
      AND apdadocno = p_docno
   
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.extend = 'UPDATE apda_t WRONG!'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF
   #141202-00061#17
   SELECT apdacomp INTO l_apdacomp
     FROM apda_t
    WHERE apdaent = g_enterprise
      AND apdald = p_ld AND apdadocno = p_docno

   CALL s_ld_sel_glaa(p_ld,'glaa121') RETURNING  g_sub_success,l_glaa121
   CALL s_aooi200_fin_get_slip(p_docno) RETURNING g_sub_success,l_ap_slip
   CALL s_fin_get_doc_para(p_ld,l_apdacomp,l_ap_slip,'D-FIN-0030') RETURNING l_dfin0030
   IF l_glaa121 = 'Y' AND l_dfin0030 = 'Y'THEN
      UPDATE glga_t SET glgastus = 'X'
       WHERE glgaent = g_enterprise
         AND glgald  = p_ld AND glgadocno = p_docno
         AND glga100 = 'AP' AND glga101 ='P30'
      IF SQLCA.SQLCODE THEN
         LET r_success = FALSE  
      END IF
   END IF
   #141202-00061#17
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: BPM 自動確認
# Memo...........:
# Usage..........: CALL s_aapt430_ws_confirm(p_docno)
#                  RETURNING r_success
# Input parameter: p_ld         帳別
#                : p_docno      費用分攤單號
# Return code....: r_success    結果
# Date & Author..: 2014/11/30 By Reanna
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt430_ws_confirm(p_docno)
DEFINE p_ld          LIKE apda_t.apdald
DEFINE p_docno       LIKE apda_t.apdadocno
DEFINE r_success     LIKE type_t.num5
DEFINE l_apdald      LIKE apda_t.apdald

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   LET l_apdald = cl_bpm_get_key_value("apdald")
   
   #確認前檢核段
   CALL s_aapt430_conf_chk(l_apdald,p_docno) RETURNING r_success
   IF r_success THEN
       #確認交易處理段
       CALL s_aapt430_conf_upd(l_apdald,p_docno) RETURNING r_success
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 單身待抵類回寫多帳期
# Memo...........:
# Date & Author..: 140817 By albireo
# Modify.........:
#160816-00022#1   160824   By 03538      因應單身取apcb為來源,回寫apcc,改以先進先出由帳期最小者回寫
################################################################################
PUBLIC FUNCTION s_aapt430_upd_apcc(p_ld,p_docno,p_type)
DEFINE p_ld          LIKE glaa_t.glaald
DEFINE p_docno       LIKE apda_t.apdadocno
DEFINE p_type        LIKE type_t.chr1         #+ 確認回寫 -取消確認回寫
DEFINE r_success     LIKE type_t.num5
DEFINE l_sql         STRING
DEFINE l_apcc        RECORD
             apccseq   LIKE apcc_t.apccseq,
             apcc001   LIKE apcc_t.apcc001,
             apcc118   LIKE apcc_t.apcc118,
             apcc109   LIKE apcc_t.apcc109,
             apcc119   LIKE apcc_t.apcc119,
             apcc129   LIKE apcc_t.apcc129,
             apcc139   LIKE apcc_t.apcc139
                     END RECORD
DEFINE l_apce        RECORD
             apce003   LIKE apce_t.apce003,
             apce004   LIKE apce_t.apce004,
             apce005   LIKE apce_t.apce005,
             apce109   LIKE apce_t.apce109,
             apce119   LIKE apce_t.apce119,
             apce129   LIKE apce_t.apce129,
             apce139   LIKE apce_t.apce139 
                     END RECORD
#DEFINE l_apca    RECORD 
#                 apcadocno LIKE apca_t.apcadocno
#                 END RECORD
#
DEFINE l_s_fin_2002    LIKE type_t.chr1      #是否沖到明細   #160816-00022#1 remark
#DEFINE p_prog          LIKE gzza_t.gzza001
DEFINE l_comp          LIKE ooef_t.ooef001                  #160816-00022#1 remark
#DEFINE l_do_upd      RECORD
#             apcc109   LIKE apcc_t.apcc109,
#             apcc119   LIKE apcc_t.apcc119,
#             apcc129   LIKE apcc_t.apcc129,
#             apcc139   LIKE apcc_t.apcc139
#                     END RECORD
#160816-00022#1--s
DEFINE l_apccseq      LIKE apcc_t.apccseq  
DEFINE l_apcc001      LIKE apcc_t.apccseq  
DEFINE l_apcc108      LIKE apcc_t.apcc108
DEFINE l_apcc118      LIKE apcc_t.apcc118
DEFINE l_apcc128      LIKE apcc_t.apcc128
DEFINE l_apcc138      LIKE apcc_t.apcc138
#160816-00022#1--e


   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   
   #抓出需要回寫沖銷的單據(apca001是2開頭的待抵單)
   #單號/項次/期別/原幣沖帳金額/本幣沖帳金額/本位幣二沖帳金額/本位幣三沖帳金額
   LET l_sql = " SELECT apce003,apce004,apce005,apce109,apce119,apce129,apce139",
               "   FROM apca_t,apce_t ",
               "  WHERE apcaent = apceent",
               "    AND apcald  = apceld ",
               "    AND apcadocno = apce003 ",
               "    AND apceent = ",g_enterprise," ",
               "    AND apceld  = '",p_ld,"' ",
               "    AND apcedocno = '",p_docno,"' ",
               #雜項暫估,才會到aapt430處理,故修改為03/04
              #"    AND (apca001 LIKE '2%' OR apca001 IN ('02','04'))"  #160816-00022#1 mark
              #"    AND (apca001 LIKE '2%' OR apca001 IN ('03','04'))"  #160816-00022#1 #170214-00004#1 mark
              #"    AND (apca001 LIKE '2%')"                            #170214-00004#1   #170609-00067#1 mark
              # "    AND (apca001 LIKE '2%' AND apca001 != '22')"                          #170609-00067#1 add   #170618-00252#1 mark
               "    AND (apca001 LIKE '2%' AND apca001 NOT IN ('22','24','29'))"           #170618-00252#1
   PREPARE sel_s_aapt430_apceapcap1 FROM l_sql
   DECLARE sel_s_aapt430_apceapcac1 CURSOR FOR sel_s_aapt430_apceapcap1
   
   #160816-00022#1--s
   SELECT apdacomp INTO l_comp
     FROM apda_t
    WHERE apdaent  = g_enterprise
      AND apdald   = p_ld
      AND apdadocno= p_docno
   #取得沖銷參數
   CALL cl_get_para(g_enterprise,l_comp,'S-FIN-2002') RETURNING l_s_fin_2002 
   LET l_sql = " SELECT apccseq,apcc001 ",
               "   FROM apca_t,apcc_t ",
               "  WHERE apcaent = apccent",
               "    AND apcald  = apccld ",
               "    AND apcadocno = apccdocno ",
               "    AND apccent = ",g_enterprise," ",
               "    AND apccld  = '",p_ld,"' ",
               "    AND apccdocno = ? ",
               #沖銷參數為3,多帳期項次與帳款單身項次可以對上,因此需要限定為回寫apcc時候的條件
               "    AND (('",l_s_fin_2002,"'='3' AND apccseq=?) OR ('",l_s_fin_2002,"' IN ('1','2')))",
               "  ORDER BY apcc003,apccseq,apcc001 "  #先進先出
   PREPARE sel_s_aapt430_apccp1 FROM l_sql
   DECLARE sel_s_aapt430_apccc1 CURSOR FOR sel_s_aapt430_apccp1   
   #160816-00022#1--e

   INITIALIZE l_apce.* TO NULL
   FOREACH sel_s_aapt430_apceapcac1 INTO l_apce.*
      IF SQLCA.SQLCODE THEN EXIT FOREACH END IF
      #160816-00022#1--s
      LET l_apccseq = ''
      LET l_apcc001 = ''
      FOREACH sel_s_aapt430_apccc1 USING l_apce.apce003,l_apce.apce004 INTO l_apccseq,l_apcc001
      #160816-00022#1--e   
         #取出已沖銷金額
         SELECT apcc109,apcc119,apcc129,apcc139  
           INTO l_apcc.apcc109,l_apcc.apcc119,l_apcc.apcc129,l_apcc.apcc139
           FROM apcc_t
          WHERE apccent = g_enterprise
            AND apccdocno = l_apce.apce003
            AND apccld = p_ld
           #AND apccseq = l_apce.apce004   #160816-00022#1 mark
           #AND apcc001 = l_apce.apce005   #160816-00022#1 mark
            AND apccseq = l_apccseq        #160816-00022#1 
            AND apcc001 = l_apcc001        #160816-00022#1            
         
         IF cl_null(l_apcc.apcc109) THEN LET l_apcc.apcc109 = 0 END IF
         IF cl_null(l_apcc.apcc119) THEN LET l_apcc.apcc119 = 0 END IF
         IF cl_null(l_apcc.apcc129) THEN LET l_apcc.apcc129 = 0 END IF
         IF cl_null(l_apcc.apcc139) THEN LET l_apcc.apcc139 = 0 END IF
         
         IF cl_null(l_apce.apce109) THEN LET l_apce.apce109 = 0 END IF
         IF cl_null(l_apce.apce119) THEN LET l_apce.apce119 = 0 END IF
         IF cl_null(l_apce.apce129) THEN LET l_apce.apce129 = 0 END IF
         IF cl_null(l_apce.apce139) THEN LET l_apce.apce139 = 0 END IF
         IF p_type = '+' THEN
            #160816-00022#1--s
            #取出剩餘可沖銷金額
            SELECT apcc108-apcc109,apcc118-apcc119,apcc128-apcc129,apcc139-apcc139  
              INTO l_apcc108,l_apcc118,l_apcc128,l_apcc138
              FROM apcc_t
             WHERE apccent   = g_enterprise
               AND apccdocno = l_apce.apce003
               AND apccld    = p_ld
               AND apccseq   = l_apccseq        
               AND apcc001   = l_apcc001            
            IF cl_null(l_apcc108) THEN LET l_apcc108 = 0 END IF
            IF cl_null(l_apcc118) THEN LET l_apcc118 = 0 END IF
            IF cl_null(l_apcc128) THEN LET l_apcc128 = 0 END IF
            IF cl_null(l_apcc138) THEN LET l_apcc138 = 0 END IF
            #帳期沒有可沖金額,則往下一期回寫
            IF l_apcc118 = 0 THEN CONTINUE FOREACH END IF
            #可沖金額與總共剩餘要回寫金額取小者
            IF l_apcc118 > l_apce.apce119 THEN
               LET l_apcc108 = l_apce.apce109
               LET l_apcc118 = l_apce.apce119
               LET l_apcc128 = l_apce.apce129
               LET l_apcc138 = l_apce.apce139
            END IF                       
            #160816-00022#1--e
            #確認>>加上分攤的金額
            #160816-00022#1 mark--s
            #LET l_apcc.apcc109 = l_apcc.apcc109 + l_apce.apce109
            #LET l_apcc.apcc119 = l_apcc.apcc119 + l_apce.apce119
            #LET l_apcc.apcc129 = l_apcc.apcc129 + l_apce.apce129
            #LET l_apcc.apcc139 = l_apcc.apcc139 + l_apce.apce139
            #160816-00022#1 mark--e
            #160816-00022#1--s
            LET l_apcc.apcc109 = l_apcc.apcc109 + l_apcc108
            LET l_apcc.apcc119 = l_apcc.apcc119 + l_apcc118
            LET l_apcc.apcc129 = l_apcc.apcc129 + l_apcc128
            LET l_apcc.apcc139 = l_apcc.apcc139 + l_apcc138      
            #扣除已回寫金額            
            LET l_apce.apce109 = l_apce.apce109 - l_apcc108           
            LET l_apce.apce119 = l_apce.apce119 - l_apcc118
            LET l_apce.apce129 = l_apce.apce129 - l_apcc128
            LET l_apce.apce139 = l_apce.apce139 - l_apcc138                
            #160816-00022#1--e
         ELSE
            #160816-00022#1--s
            #帳期沒有已沖金額,則往下一期回寫
            IF l_apcc.apcc119 = 0 THEN CONTINUE FOREACH END IF                  
            #可沖金額與總共剩餘要回寫金額取小者
            IF l_apcc.apcc119 > l_apce.apce119 THEN
               LET l_apcc108 = l_apce.apce109
               LET l_apcc118 = l_apce.apce119
               LET l_apcc128 = l_apce.apce129
               LET l_apcc138 = l_apce.apce139
            ELSE
               LET l_apcc108 = l_apcc.apcc109
               LET l_apcc118 = l_apcc.apcc119
               LET l_apcc128 = l_apcc.apcc139
               LET l_apcc138 = l_apcc.apcc139            
            END IF          
            #160816-00022#1--e            
            #160816-00022#1 mark--s
            ##取消確認>>扣掉分攤的金額
            #LET l_apcc.apcc109 = l_apcc.apcc109 - l_apce.apce109
            #LET l_apcc.apcc119 = l_apcc.apcc119 - l_apce.apce119
            #LET l_apcc.apcc129 = l_apcc.apcc129 - l_apce.apce129
            #LET l_apcc.apcc139 = l_apcc.apcc139 - l_apce.apce139
            #160816-00022#1 mark--e
            #160816-00022#1--s
            LET l_apcc.apcc109 = l_apcc.apcc109 - l_apcc108
            LET l_apcc.apcc119 = l_apcc.apcc119 - l_apcc118
            LET l_apcc.apcc129 = l_apcc.apcc129 - l_apcc128
            LET l_apcc.apcc139 = l_apcc.apcc139 - l_apcc138      
            #扣除已回寫金額            
            LET l_apce.apce109 = l_apce.apce109 - l_apcc108           
            LET l_apce.apce119 = l_apce.apce119 - l_apcc118
            LET l_apce.apce129 = l_apce.apce129 - l_apcc128
            LET l_apce.apce139 = l_apce.apce139 - l_apcc138                
            #160816-00022#1--e            
         END IF
         
         #更新最新已沖金額
         UPDATE apcc_t SET apcc109 = l_apcc.apcc109,
                           apcc119 = l_apcc.apcc119,
                           apcc129 = l_apcc.apcc129,
                           apcc139 = l_apcc.apcc139
          WHERE apccld = p_ld
            AND apccdocno = l_apce.apce003
           #AND apccseq   = l_apce.apce004  #160816-00022#1 mark
           #AND apcc001   = l_apce.apce005  #160816-00022#1 mark
            AND apccseq   = l_apccseq       #160816-00022#1 
            AND apcc001   = l_apcc001       #160816-00022#1 
            AND apccent   = g_enterprise    #170210-00017#2 20170210 add by beckxie            
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.SQLCODE
            LET g_errparam.extend = ''
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF
      #160816-00022#1--s
         #已經回寫完就離開
         IF l_apce.apce119 = 0 THEN EXIT FOREACH END IF
      END FOREACH   
      #160816-00022#1--e
   END FOREACH
   
   RETURN r_success
   
   
   #IF p_type = '+' THEN
   #   #確認回寫沖銷金額時
   #   #用帳款單身來源單據資料抓未沖完金額的apcc
   #   LET l_sql = "SELECT apccseq,apcc001,apcc118,(apcc108-apcc109),(apcc118-apcc119+apcc113),(apcc128-apcc129+apcc123),(apcc138-apcc139+apcc133) " ,
   #               "  FROM apcc_t ",
   #               " WHERE apccent = '",g_enterprise,"' ",
   #               "   AND apccdocno = ? ",
   #               "   AND apccld    = ? ",
   #               "   AND (apcc108 - apcc109) > 0 "                  
   #   #判斷是明細還是匯總
   #   #CALL cl_get_para(g_enterprise,l_comp,'S-FIN-2002') RETURNING l_s_fin_2002  
   #   LET l_sql = l_sql CLIPPED," ORDER BY apccseq,apcc001 "
   #ELSE
   #   #'-'
   #   #取消確認回寫沖銷金額時
   #   #用帳款單身來源單據抓有已沖銷金額為最後的那筆
   #   LET l_sql = "SELECT apccseq,apcc001,apcc118,apcc109,apcc119,apcc129,apcc139 " ,
   #               "  FROM apcc_t ",
   #               " WHERE apccent = '",g_enterprise,"' ",
   #               "   AND apccdocno = ? ",
   #               "   AND apccld    = ? ",
   #               "   AND apcc109 > 0 "
   #   LET l_sql = l_sql CLIPPED," ORDER BY apccseq,apcc001 DESC "
   #   
   #END IF
   #PREPARE sel_s_aapt430_apccp FROM l_sql
   #DECLARE sel_s_aapt430_apccc CURSOR FOR sel_s_aapt430_apccp
   #
   #INITIALIZE l_apca.* TO NULL
   #FOREACH sel_s_aapt430_apceapcac1 INTO l_apce.*
   #   IF SQLCA.SQLCODE THEN EXIT FOREACH END IF
   #  # CALL s_aapt400_apce_upd_apcc(p_docno,p_apceld,p_type,p_add,p_prog)
   #   FOREACH sel_s_aapt430_apccc USING l_apce.apce003,p_ld INTO l_apcc.*
   #      IF SQLCA.SQLCODE THEN EXIT FOREACH END IF
   #
   #      CASE 
   #         WHEN p_type = '+' #確認
   #            #攤銷金額/l_apcc為應付-已沖=尚可沖銷金額
   #            IF l_apce.apce109 = l_apcc.apcc109 THEN
   #               LET l_do_upd.apcc109 = l_apce.apce109
   #            ELSE
   #               #原幣應付金額*(本幣沖帳金額/本幣應付金額)
   #               LET l_do_upd.apcc109 = l_apcc.apcc108 * (l_apce.apce119/l_apcc.apcc118)
   #            END IF
   #            IF cl_null(l_do_upd.apcc109) THEN LET l_do_upd.apcc109 = 0 END IF
   #            
   #            #本幣
   #            IF l_apce.apce119 = l_apcc.apcc119 THEN
   #               LET l_do_upd.apcc119 = l_apce.apce119
   #            ELSE
   #               LET l_do_upd.apcc119 = l_apcc.apcc119 * (l_apce.apce119/l_apcc.apcc118)
   #            END IF
   #            IF cl_null(l_do_upd.apcc119) THEN LET l_do_upd.apcc119 = 0 END IF
   #            
   #            #本位幣二
   #            IF l_apce.apce129 = l_apcc.apcc129 THEN
   #               LET l_do_upd.apcc129 = l_apce.apce129
   #            ELSE
   #               LET l_do_upd.apcc129 = l_apcc.apcc129 * (l_apce.apce119/l_apcc.apcc118)
   #            END IF
   #            IF cl_null(l_do_upd.apcc129) THEN LET l_do_upd.apcc129 = 0 END IF
   #            
   #            #本位幣三
   #            IF l_apce.apce139 = l_apcc.apcc139 THEN
   #               LET l_do_upd.apcc139 = l_apce.apce139
   #            ELSE
   #               LET l_do_upd.apcc139 = l_apcc.apcc139 * (l_apce.apce119/l_apcc.apcc118)
   #            END IF
   #            IF cl_null(l_do_upd.apcc139) THEN LET l_do_upd.apcc139 = 0 END IF
   #            
   #            ##l_apcc為應付-已沖
   #            #IF l_apce.apce109 > l_apcc.apcc109 THEN
   #            #   LET l_do_upd.apcc109 = l_apcc.apcc109
   #            #ELSE
   #            #   LET l_do_upd.apcc109 = l_apce.apce109
   #            #END IF
   #            #LET l_apce.apce109 = l_apce.apce109 - l_do_upd.apcc109
   #            #
   #            #IF l_apce.apce119 > l_apcc.apcc119 THEN
   #            #   LET l_do_upd.apcc119 = l_apcc.apcc119
   #            #ELSE
   #            #   LET l_do_upd.apcc119 = l_apce.apce119
   #            #END IF
   #            #LET l_apce.apce119 = l_apce.apce119 - l_do_upd.apcc119
   #            #
   #            #IF l_apce.apce129 > l_apcc.apcc129 THEN
   #            #   LET l_do_upd.apcc129 = l_apcc.apcc129
   #            #ELSE
   #            #   LET l_do_upd.apcc129 = l_apce.apce129
   #            #END IF
   #            #LET l_apce.apce129 = l_apce.apce129 - l_do_upd.apcc129
   #            #
   #            #IF l_apce.apce139 > l_apcc.apcc139 THEN
   #            #   LET l_do_upd.apcc139 = l_apcc.apcc139
   #            #ELSE
   #            #   LET l_do_upd.apcc139 = l_apce.apce139
   #            #END IF
   #            #LET l_apce.apce139 = l_apce.apce139 - l_do_upd.apcc139
   #
   #            #UPDATE apcc_t SET apcc109 = apcc109 + l_do_upd.apcc109,
   #            #                  apcc119 = apcc119 + l_do_upd.apcc119,
   #            #                  apcc129 = apcc129 + l_do_upd.apcc129,
   #            #                  apcc139 = apcc139 + l_do_upd.apcc139
   #            # WHERE apccld = p_ld
   #            #   AND apccdocno = l_apce.apce003
   #            #   AND apccseq   = l_apcc.apccseq
   #            #   AND apcc001   = l_apcc.apcc001
   #            UPDATE apcc_t SET apcc109 = l_do_upd.apcc109,
   #                              apcc119 = l_do_upd.apcc119,
   #                              apcc129 = l_do_upd.apcc129,
   #                              apcc139 = l_do_upd.apcc139
   #             WHERE apccld = p_ld
   #               AND apccdocno = l_apce.apce003
   #               AND apccseq   = l_apcc.apccseq
   #               AND apcc001   = l_apcc.apcc001
   #            IF SQLCA.SQLCODE THEN
   #               INITIALIZE g_errparam TO NULL
   #               LET g_errparam.code = SQLCA.SQLCODE
   #               LET g_errparam.extend = 's_aapt430_upd_apcc:'
   #               LET g_errparam.popup = TRUE
   #               CALL cl_err()
   #               LET r_success = FALSE
   #            END IF
   #            
   #            IF l_apce.apce109 = 0 THEN EXIT FOREACH END IF
   #         
   #         WHEN p_type = '-'
   #            #取消確認
   #            #攤銷金額/l_apcc為應付-已沖=尚可沖銷金額
   #            IF l_apce.apce109 = l_apcc.apcc109 THEN
   #               LET l_do_upd.apcc109 = l_apce.apce109
   #            ELSE
   #               #原幣付款沖帳金額*(本幣沖帳金額/本幣應付金額)
   #               LET l_do_upd.apcc109 = l_apcc.apcc109 * (l_apce.apce119/l_apcc.apcc118)
   #            END IF
   #            IF cl_null(l_do_upd.apcc109) THEN LET l_do_upd.apcc109 = 0 END IF
   #            
   #            ##l_apcc 為已沖
   #            #IF l_apce.apce109 > l_apcc.apcc109 THEN
   #            #   LET l_do_upd.apcc109 = l_apcc.apcc109
   #            #ELSE 
   #            #   LET l_do_upd.apcc109 = l_apce.apce109
   #            #END IF 
   #            #
   #            #LET l_apce.apce109 = l_apce.apce109 - l_do_upd.apcc109
   #            #
   #            #IF l_apce.apce119 > l_apcc.apcc119 THEN
   #            #   LET l_do_upd.apcc119 = l_apcc.apcc119
   #            #ELSE 
   #            #   LET l_do_upd.apcc119 = l_apce.apce119
   #            #END IF 
   #            #
   #            #LET l_apce.apce119 = l_apce.apce119 - l_do_upd.apcc119
   #            #
   #            #IF l_apce.apce129 > l_apcc.apcc129 THEN
   #            #   LET l_do_upd.apcc129 = l_apcc.apcc129
   #            #ELSE 
   #            #   LET l_do_upd.apcc129 = l_apce.apce129
   #            #END IF 
   #            #
   #            #LET l_apce.apce129 = l_apce.apce129 - l_do_upd.apcc129
   #            #
   #            #IF l_apce.apce139 > l_apcc.apcc139 THEN
   #            #   LET l_do_upd.apcc139 = l_apcc.apcc139
   #            #ELSE 
   #            #   LET l_do_upd.apcc139 = l_apce.apce139
   #            #END IF 
   #            #
   #            #LET l_apce.apce139 = l_apce.apce139 - l_do_upd.apcc139
   #            #
   #            #UPDATE apcc_t SET apcc109 = apcc109 - l_do_upd.apcc109,
   #            #                  apcc119 = apcc119 - l_do_upd.apcc119,
   #            #                  apcc129 = apcc129 - l_do_upd.apcc129,
   #            #                  apcc139 = apcc139 - l_do_upd.apcc139
   #            # WHERE apccld = p_apceld
   #            #   AND apccdocno = l_apce.apce003
   #            #   AND apccseq   = l_apcc.apccseq
   #            #   AND apcc001   = l_apcc.apcc001
   #            
   #            UPDATE apcc_t SET apcc109 = l_do_upd.apcc109,
   #                              apcc119 = l_do_upd.apcc119,
   #                              apcc129 = l_do_upd.apcc129,
   #                              apcc139 = l_do_upd.apcc139
   #             WHERE apccld = p_apceld
   #               AND apccdocno = l_apce.apce003
   #               AND apccseq   = l_apcc.apccseq
   #               AND apcc001   = l_apcc.apcc001
   #            IF SQLCA.SQLCODE THEN 
   #               INITIALIZE g_errparam TO NULL
   #               LET g_errparam.code = SQLCA.SQLCODE
   #               LET g_errparam.extend = 's_aapt430_upd_apcc:'
   #               LET g_errparam.popup = TRUE
   #               CALL cl_err()
   #
   #               LET r_success = FALSE
   #            END IF
   #            
   #            IF l_apce.apce109 = 0 THEN EXIT FOREACH END IF
   #      END CASE       
   #   END FOREACH
   #END FOREACH
   
   #RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 新增本期庫存成本
# Memo...........:
# Usage..........: CALL s_aapt430_ins_xcco(p_ld,p_docno)
#                  RETURNING r_success
# Input parameter: p_ld         帳別
#                : p_docno      費用分攤單號
# Return code....: r_success    結果
# Date & Author..: 140817 By albireo
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt430_ins_xcco(p_ld,p_docno)
DEFINE p_ld        LIKE glaa_t.glaald
DEFINE p_docno     LIKE apda_t.apdadocno
DEFINE r_success   LIKE type_t.num5
#DEFINE l_xcco      RECORD LIKE xcco_t.* #161111-00048#4 mark
#161111-00048#4 --s add
DEFINE l_xcco RECORD  #本期庫存成本調整檔
       xccoent LIKE xcco_t.xccoent, #企業編號
       xccold LIKE xcco_t.xccold, #帳套
       xccocomp LIKE xcco_t.xccocomp, #法人組織
       xcco001 LIKE xcco_t.xcco001, #帳套本位幣順序
       xcco002 LIKE xcco_t.xcco002, #成本域
       xcco003 LIKE xcco_t.xcco003, #成本計算類型
       xcco004 LIKE xcco_t.xcco004, #年度
       xcco005 LIKE xcco_t.xcco005, #期別
       xcco006 LIKE xcco_t.xcco006, #料件編號
       xcco007 LIKE xcco_t.xcco007, #特性
       xcco008 LIKE xcco_t.xcco008, #批號
       xcco009 LIKE xcco_t.xcco009, #參考單號
       xcco010 LIKE xcco_t.xcco010, #資料來源
       xcco011 LIKE xcco_t.xcco011, #調整說明
       xcco102 LIKE xcco_t.xcco102, #當月調整金額-金額合計
       xcco102a LIKE xcco_t.xcco102a, #當月調整金額-材料
       xcco102b LIKE xcco_t.xcco102b, #當月調整金額-人工
       xcco102c LIKE xcco_t.xcco102c, #當月調整金額-委外加工
       xcco102d LIKE xcco_t.xcco102d, #當月調整金額-制費一
       xcco102e LIKE xcco_t.xcco102e, #當月調整金額-制費二
       xcco102f LIKE xcco_t.xcco102f, #當月調整金額-制費三
       xcco102g LIKE xcco_t.xcco102g, #當月調整金額-制費四
       xcco102h LIKE xcco_t.xcco102h, #當月調整金額-制費五
       xccoownid LIKE xcco_t.xccoownid, #資料所有者
       xccoowndp LIKE xcco_t.xccoowndp, #資料所屬部門
       xccocrtid LIKE xcco_t.xccocrtid, #資料建立者
       xccocrtdp LIKE xcco_t.xccocrtdp, #資料建立部門
       xccocrtdt LIKE xcco_t.xccocrtdt, #資料創建日
       xccomodid LIKE xcco_t.xccomodid, #資料修改者
       xccomoddt LIKE xcco_t.xccomoddt, #最近修改日
       xccocnfid LIKE xcco_t.xccocnfid, #資料確認者
       xccocnfdt LIKE xcco_t.xccocnfdt, #資料確認日
       xccopstid LIKE xcco_t.xccopstid, #資料過帳者
       xccopstdt LIKE xcco_t.xccopstdt, #資料過帳日
       xccostus LIKE xcco_t.xccostus, #狀態碼
       xccoud001 LIKE xcco_t.xccoud001, #自定義欄位(文字)001
       xccoud002 LIKE xcco_t.xccoud002, #自定義欄位(文字)002
       xccoud003 LIKE xcco_t.xccoud003, #自定義欄位(文字)003
       xccoud004 LIKE xcco_t.xccoud004, #自定義欄位(文字)004
       xccoud005 LIKE xcco_t.xccoud005, #自定義欄位(文字)005
       xccoud006 LIKE xcco_t.xccoud006, #自定義欄位(文字)006
       xccoud007 LIKE xcco_t.xccoud007, #自定義欄位(文字)007
       xccoud008 LIKE xcco_t.xccoud008, #自定義欄位(文字)008
       xccoud009 LIKE xcco_t.xccoud009, #自定義欄位(文字)009
       xccoud010 LIKE xcco_t.xccoud010, #自定義欄位(文字)010
       xccoud011 LIKE xcco_t.xccoud011, #自定義欄位(數字)011
       xccoud012 LIKE xcco_t.xccoud012, #自定義欄位(數字)012
       xccoud013 LIKE xcco_t.xccoud013, #自定義欄位(數字)013
       xccoud014 LIKE xcco_t.xccoud014, #自定義欄位(數字)014
       xccoud015 LIKE xcco_t.xccoud015, #自定義欄位(數字)015
       xccoud016 LIKE xcco_t.xccoud016, #自定義欄位(數字)016
       xccoud017 LIKE xcco_t.xccoud017, #自定義欄位(數字)017
       xccoud018 LIKE xcco_t.xccoud018, #自定義欄位(數字)018
       xccoud019 LIKE xcco_t.xccoud019, #自定義欄位(數字)019
       xccoud020 LIKE xcco_t.xccoud020, #自定義欄位(數字)020
       xccoud021 LIKE xcco_t.xccoud021, #自定義欄位(日期時間)021
       xccoud022 LIKE xcco_t.xccoud022, #自定義欄位(日期時間)022
       xccoud023 LIKE xcco_t.xccoud023, #自定義欄位(日期時間)023
       xccoud024 LIKE xcco_t.xccoud024, #自定義欄位(日期時間)024
       xccoud025 LIKE xcco_t.xccoud025, #自定義欄位(日期時間)025
       xccoud026 LIKE xcco_t.xccoud026, #自定義欄位(日期時間)026
       xccoud027 LIKE xcco_t.xccoud027, #自定義欄位(日期時間)027
       xccoud028 LIKE xcco_t.xccoud028, #自定義欄位(日期時間)028
       xccoud029 LIKE xcco_t.xccoud029, #自定義欄位(日期時間)029
       xccoud030 LIKE xcco_t.xccoud030  #自定義欄位(日期時間)030
END RECORD
#161111-00048#4 --e add
DEFINE l_apdc      RECORD
#         apdcorga  LIKE apdc_t.apdcorga,   #170525-00042#1 mark
#         apdc002   LIKE apdc_t.apdc002,
#         apdc003   LIKE apdc_t.apdc003,
         apdc004   LIKE apdc_t.apdc004,
         apdc213   LIKE apdc_t.apdc213,
         inaj006   LIKE inaj_t.inaj006,
         inaj008   LIKE inaj_t.inaj008,
         inaj010   LIKE inaj_t.inaj010
                   END RECORD
#DEFINE l_apda      RECORD LIKE apda_t.* #161111-00048#4 mark
#161111-00048#4 --s add
DEFINE l_apda RECORD  #付款核銷單單頭檔
       apdaent LIKE apda_t.apdaent, #企業編號
       apdacomp LIKE apda_t.apdacomp, #法人
       apdald LIKE apda_t.apdald, #帳套
       apdadocno LIKE apda_t.apdadocno, #單號
       apdadocdt LIKE apda_t.apdadocdt, #單據日期
       apdasite LIKE apda_t.apdasite, #帳務組織
       apda001 LIKE apda_t.apda001, #帳款單性質
       apda002 LIKE apda_t.apda002, #NO USE
       apda003 LIKE apda_t.apda003, #帳務人員
       apda004 LIKE apda_t.apda004, #帳款核銷對象
       apda005 LIKE apda_t.apda005, #付款對象
       apda006 LIKE apda_t.apda006, #一次性交易識別碼
       apda007 LIKE apda_t.apda007, #產生方式
       apda008 LIKE apda_t.apda008, #來源參考單號
       apda009 LIKE apda_t.apda009, #沖帳批序號
       apda010 LIKE apda_t.apda010, #集團代付付單號
       apda011 LIKE apda_t.apda011, #差異處理
       apda012 LIKE apda_t.apda012, #退款類型
       apda013 LIKE apda_t.apda013, #分錄底稿是否可重新產生
       apda014 LIKE apda_t.apda014, #拋轉傳票號碼
       apda015 LIKE apda_t.apda015, #作廢理由碼
       apda016 LIKE apda_t.apda016, #列印次數
       apda017 LIKE apda_t.apda017, #MEMO備註
       apda018 LIKE apda_t.apda018, #付款(攤銷)理由碼
       apda019 LIKE apda_t.apda019, #攤銷目的方式
       apda020 LIKE apda_t.apda020, #分攤金額方式
       apda021 LIKE apda_t.apda021, #目的成本要素
       apda113 LIKE apda_t.apda113, #應核銷本幣金額
       apda123 LIKE apda_t.apda123, #應核銷本幣二金額
       apda133 LIKE apda_t.apda133, #應核銷本幣三金額
       apdaownid LIKE apda_t.apdaownid, #資料所有者
       apdaowndp LIKE apda_t.apdaowndp, #資料所屬部門
       apdacrtid LIKE apda_t.apdacrtid, #資料建立者
       apdacrtdp LIKE apda_t.apdacrtdp, #資料建立部門
       apdacrtdt LIKE apda_t.apdacrtdt, #資料創建日
       apdamodid LIKE apda_t.apdamodid, #資料修改者
       apdamoddt LIKE apda_t.apdamoddt, #最近修改日
       apdacnfid LIKE apda_t.apdacnfid, #資料確認者
       apdacnfdt LIKE apda_t.apdacnfdt, #資料確認日
       apdapstid LIKE apda_t.apdapstid, #資料過帳者
       apdapstdt LIKE apda_t.apdapstdt, #資料過帳日
       apdastus LIKE apda_t.apdastus, #狀態碼
       apdaud001 LIKE apda_t.apdaud001, #自定義欄位(文字)001
       apdaud002 LIKE apda_t.apdaud002, #自定義欄位(文字)002
       apdaud003 LIKE apda_t.apdaud003, #自定義欄位(文字)003
       apdaud004 LIKE apda_t.apdaud004, #自定義欄位(文字)004
       apdaud005 LIKE apda_t.apdaud005, #自定義欄位(文字)005
       apdaud006 LIKE apda_t.apdaud006, #自定義欄位(文字)006
       apdaud007 LIKE apda_t.apdaud007, #自定義欄位(文字)007
       apdaud008 LIKE apda_t.apdaud008, #自定義欄位(文字)008
       apdaud009 LIKE apda_t.apdaud009, #自定義欄位(文字)009
       apdaud010 LIKE apda_t.apdaud010, #自定義欄位(文字)010
       apdaud011 LIKE apda_t.apdaud011, #自定義欄位(數字)011
       apdaud012 LIKE apda_t.apdaud012, #自定義欄位(數字)012
       apdaud013 LIKE apda_t.apdaud013, #自定義欄位(數字)013
       apdaud014 LIKE apda_t.apdaud014, #自定義欄位(數字)014
       apdaud015 LIKE apda_t.apdaud015, #自定義欄位(數字)015
       apdaud016 LIKE apda_t.apdaud016, #自定義欄位(數字)016
       apdaud017 LIKE apda_t.apdaud017, #自定義欄位(數字)017
       apdaud018 LIKE apda_t.apdaud018, #自定義欄位(數字)018
       apdaud019 LIKE apda_t.apdaud019, #自定義欄位(數字)019
       apdaud020 LIKE apda_t.apdaud020, #自定義欄位(數字)020
       apdaud021 LIKE apda_t.apdaud021, #自定義欄位(日期時間)021
       apdaud022 LIKE apda_t.apdaud022, #自定義欄位(日期時間)022
       apdaud023 LIKE apda_t.apdaud023, #自定義欄位(日期時間)023
       apdaud024 LIKE apda_t.apdaud024, #自定義欄位(日期時間)024
       apdaud025 LIKE apda_t.apdaud025, #自定義欄位(日期時間)025
       apdaud026 LIKE apda_t.apdaud026, #自定義欄位(日期時間)026
       apdaud027 LIKE apda_t.apdaud027, #自定義欄位(日期時間)027
       apdaud028 LIKE apda_t.apdaud028, #自定義欄位(日期時間)028
       apdaud029 LIKE apda_t.apdaud029, #自定義欄位(日期時間)029
       apdaud030 LIKE apda_t.apdaud030, #自定義欄位(日期時間)030
       apda104 LIKE apda_t.apda104, #原幣借方金額合計
       apda105 LIKE apda_t.apda105, #原幣貸方金額合計
       apda114 LIKE apda_t.apda114, #本幣借方金額合計
       apda115 LIKE apda_t.apda115, #本幣貸方金額合計
       apda124 LIKE apda_t.apda124, #本位幣二借方金額合計
       apda125 LIKE apda_t.apda125, #本位幣二貸方金額合計
       apda134 LIKE apda_t.apda134, #本位幣三借方金額合計
       apda135 LIKE apda_t.apda135, #本位幣三貸方金額合計
       apda022 LIKE apda_t.apda022, #經營方式
       apda023 LIKE apda_t.apda023  #請款單號
END RECORD
#161111-00048#4 --e add
DEFINE l_sql       STRING
DEFINE l_glaa003   LIKE glaa_t.glaa003
DEFINE l_glaa015   LIKE glaa_t.glaa015
DEFINE l_glaa019   LIKE glaa_t.glaa019
DEFINE l_chr       LIKE type_t.chr1
DEFINE l_accdate   RECORD
         glav005   LIKE glav_t.glav005,
         sdate_s   LIKE type_t.dat,
         sdate_e   LIKE type_t.dat,
         pdate_s   LIKE type_t.dat,
         pdate_e   LIKE type_t.dat,
         glav007   LIKE glav_t.glav007,
         wdate_s   LIKE type_t.dat,
         wdate_e   LIKE type_t.dat
                   END RECORD
DEFINE l_sfin6002  LIKE type_t.chr1
DEFINE l_xcbf001   LIKE xcbf_t.xcbf001    #成本域
DEFINE l_feld1     LIKE type_t.chr50      #特性
DEFINE l_feld2     LIKE type_t.chr50      #庫位編號
DEFINE l_xcat005   LIKE xcat_t.xcat005    #計價方式   #170424-00024#1 add #171123-00043#1 mark #171012-00009#1 remark
#171012-00009#1 add --(S)--
DEFINE l_feld3       LIKE type_t.chr50      #特性
DEFINE l_fin_6001    LIKE type_t.chr1       #是否啟用成本域
DEFINE l_apdcseq     LIKE apdc_t.apdcseq    #項次
DEFINE l_diff        LIKE apdc_t.apdc213    #尾差金額
DEFINE l_inaj006     LIKE inaj_t.inaj006    #產品特徵
DEFINE l_xcbf001_1   LIKE xcbf_t.xcbf001    #成本域編號
DEFINE l_inaj010     LIKE inaj_t.inaj010    #批號
DEFINE l_apdc_price  LIKE apdc_t.apdc213    #交易數量分攤金額
DEFINE l_glaa001     LIKE glaa_t.glaa001    #使用幣別
DEFINE l_success     LIKE type_t.num5
#171012-00009#1 add --(E)--

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   
   INITIALIZE l_apda.* TO NULL
   #SELECT * INTO l_apda.* FROM apda_t   #161208-00026#25   mark
   #161208-00026#25   add---s
   SELECT apdaent,apdacomp,apdald,apdadocno,apdadocdt,
          apdasite,apda001,apda002,apda003,apda004,
          apda005,apda006,apda007,apda008,apda009,
          apda010,apda011,apda012,apda013,apda014,
          apda015,apda016,apda017,apda018,apda019,
          apda020,apda021,apda113,apda123,apda133,
          apdaownid,apdaowndp,apdacrtid,apdacrtdp,apdacrtdt,
          apdamodid,apdamoddt,apdacnfid,apdacnfdt,apdapstid,
          apdapstdt,apdastus,apdaud001,apdaud002,apdaud003,
          apdaud004,apdaud005,apdaud006,apdaud007,apdaud008,
          apdaud009,apdaud010,apdaud011,apdaud012,apdaud013,
          apdaud014,apdaud015,apdaud016,apdaud017,apdaud018,
          apdaud019,apdaud020,apdaud021,apdaud022,apdaud023,
          apdaud024,apdaud025,apdaud026,apdaud027,apdaud028,
          apdaud029,apdaud030,apda104,apda105,apda114,
          apda115,apda124,apda125,apda134,apda135,
          apda022,apda023
     INTO l_apda.* 
     FROM apda_t
   #161208-00026#25   add---e
    WHERE apdaent = g_enterprise
      AND apdald  = p_ld
      AND apdadocno = p_docno
   
   #LET l_sql = " SELECT apdcorga,apdc002,apdc003,apdc004,SUM(apdc213)",
   #            "   FROM apdc_t",
   #            "  WHERE apdcent = ",g_enterprise,
   #            "    AND apdcld  = '",p_ld,"'",
   #            "    AND apdcdocno = '",p_docno,"'",
   #            "  GROUP BY apdcorga,apdc002,apdc003,apdc004"
   #PREPARE s_aapt430_apdcp1 FROM l_sql
   #DECLARE s_aapt430_apdcc1 CURSOR FOR s_aapt430_apdcp1
   
   CALL cl_get_para(g_enterprise,l_apda.apdacomp,'S-FIN-6002') RETURNING l_sfin6002  #成本域类型
   
   #171012-00009#1 remark --(S)--
   #171123-00043#1 mark (s)
   ##170424-00024#1---add---str--
   SELECT xcat005 INTO l_xcat005
     FROM xcat_t
    WHERE xcatent = g_enterprise
      AND xcat001 = (SELECT glaa120 FROM glaa_t WHERE glaaent = g_enterprise AND glaald = l_apda.apdald)
   IF cl_null(l_xcat005) THEN LET l_xcat005 = ' ' END IF
   ##170424-00024#1---add---end--
   #171123-00043#1 mark (e)
   #171012-00009#1 remark --(E)--
   
   #成本域
   LET l_feld2 = ",''"
   IF cl_get_para(g_enterprise,l_apda.apdacomp,'S-FIN-6001') = 'Y' THEN #采用成本域否                              #170424-00024#1 mark #171123-00043171123-00043#1 remark
   #IF cl_get_para(g_enterprise,l_apda.apdacomp,'S-FIN-6001') = 'Y' AND l_xcat005 = '6' THEN #采用成本域否/計價方式   #170424-00024#1 add #171123-00043#1 mark
      IF l_sfin6002 = '1' THEN    #依組織
         LET l_sql = " SELECT xcbf001 FROM xcbf_t ",
                     "  WHERE xcbfent = '",g_enterprise,"'",
                     "    AND xcbfcomp = '",l_apda.apdacomp,"'",
                     "    AND xcbf003 = '1'"
         PREPARE xcbf001_pre FROM l_sql
         DECLARE xcbf001_cur CURSOR FOR xcbf001_pre
         OPEN xcbf001_cur
         FETCH xcbf001_cur INTO l_xcbf001 #取第一筆就好
      END IF
      IF l_sfin6002 = '2' THEN   #依倉庫   則依來源入庫單取得倉庫(取第一筆 first)
         #SELECT inaj008 INTO l_inaj008
         #  FROM inaj_t
         #  LEFT JOIN apdc_t ON inajent = apdcent AND inaj001 = apdc002 AND inaj002 = apdc003
         #  WHERE inajent = g_enterprise
         #    AND apdcld  = p_ld
         #    AND apdcdocno = p_docno
         LET l_feld2 = ',inaj008'
      END IF
      #171012-00009#1 add --(S)--
      IF l_sfin6002 = '3' THEN   #依庫存管理特徵
         LET l_feld2 = ',inaj007'
      END IF
      #171012-00009#1 add --(E)--
   END IF
   
   
   #根据采购入库单上的特性
   IF cl_get_para(g_enterprise,l_apda.apdacomp,'S-FIN-6013') = 'Y' THEN
      LET l_feld1 = ',inaj006'
      LET l_feld3 = ",inaj006"   #171012-00009#1 add
   ELSE
      LET l_feld1 = ",''"
      LET l_feld3 = ",' ' inaj006"   #171012-00009#1 add
   END IF
   
   #170704-00080#1 add ------
   #抓成本域的DECLARE
   LET l_sql = " SELECT xcbf001 FROM xcbf_t ",
               "  WHERE xcbfent = ",g_enterprise,
               "    AND xcbf002 = ? ",
               "    AND xcbf003 = '2'"                
   PREPARE xcbf001_pre1 FROM l_sql
   
   LET l_sql="INSERT INTO xcco_t(xccoent,xccold,xccocomp,",
             "                   xcco001,xcco002,xcco003,xcco004,xcco005,",
             "                   xcco006,xcco007,xcco008,xcco009,xcco010,",
             "                   xcco011,xcco102,xcco102a,xcco102b,xcco102c,",
             "                   xcco102d,xcco102e,xcco102f,xcco102g,xcco102h,",
             "                   xccostus)",
             " VALUES(?,?,?,",
             "        ?,?,?,?,?,",
             "        ?,?,?,?,?,",
             "        ?,?,?,?,?,",
             "        ?,?,?,?,?,",
             "        ?)"
   PREPARE ins_xcco_pre FROM l_sql
   #170704-00080#1 add end---
   
   #171012-00009#1 add --(S)--
   #取出該費用分攤相關的inaj_t資料
   DELETE FROM aapt430_tmp
   LET l_fin_6001 = cl_get_para(g_enterprise,l_apda.apdacomp,'S-FIN-6001')   #是否啟用成本域
   LET l_sql = "INSERT INTO aapt430_tmp(",
               "       apdcseq,apdc004,apdc_sum,inaj006,xcbf001,inaj010,inaj011,apdc_price) ",
               "  SELECT apdcseq,apdc004,(apdc213-apdc113),inaj006,xcbf001"
  
   IF l_xcat005 = '3' THEN   #批次成本
      LET l_sql = l_sql CLIPPED,
                  ",COALESCE(inaj010,' '),inaj011,inaj011*(apdc211-apdc111)"
   ELSE
      LET l_sql = l_sql CLIPPED,
                  ",' ' inaj010,inaj011,inaj011*(apdc211-apdc111)"     
   END IF
   LET l_sql = l_sql CLIPPED, "  FROM apdc_t ",
                  "     LEFT JOIN ( SELECT inajent,inaj001,inaj002,inaj006,xcbf001"   
   IF l_xcat005 = '3' THEN   #批次成本
      LET l_sql = l_sql CLIPPED,
                  ",inaj010,sum(inaj011) inaj011"
   ELSE
      LET l_sql = l_sql CLIPPED,
                  ",' ' inaj010,sum(inaj011) inaj011"
   END IF
   IF l_fin_6001 = 'Y' AND l_sfin6002 MATCHES "[23]" THEN  #啟用成本域
      LET l_sql = l_sql CLIPPED,
                  "  FROM (SELECT inajent,inaj001,inaj002",l_feld3,",CASE WHEN xcbf001 IS NOT NULL THEN xcbf001 ELSE ' ' END xcbf001" 
   ELSE
      LET l_sql = l_sql CLIPPED,
                  "  FROM (SELECT inajent,inaj001,inaj002",l_feld3,",' ' xcbf001"   
   END IF   
   IF l_xcat005 = '3' THEN
      LET l_sql = l_sql CLIPPED,
                  ",inaj010,inaj011"
   ELSE
      LET l_sql = l_sql CLIPPED,
                  ",' ' inaj010,inaj011"   
   END IF
   IF l_fin_6001 = 'Y' AND l_sfin6002 MATCHES "[23]" THEN  #啟用成本域
      LET l_sql = l_sql CLIPPED,
                  "          FROM inaj_t LEFT JOIN xcbf_t ON xcbfent = inajent AND xcbfcomp = inajsite AND xcbf002 = inaj008 and xcbf003 = '",l_sfin6002,"')"
   ELSE
      LET l_sql = l_sql CLIPPED,
                  "          FROM inaj_t )"      
   END IF
   LET l_sql = l_sql CLIPPED,
               "            GROUP BY inajent,inaj001,inaj002,inaj006,xcbf001,inaj010) ", 
               "    ON apdcent = inajent AND apdc002 = inaj001 AND apdc003 = inaj002 ",    
               " WHERE apdcent =",g_enterprise," AND apdcld  = '",p_ld,"' AND apdcdocno = '",p_docno,"'" 
   PREPARE s_aapt430_tmp1 FROM l_sql
   EXECUTE s_aapt430_tmp1

   #金額取位
   CALL s_ld_sel_glaa(l_apda.apdald,'glaa001') RETURNING l_success,l_glaa001
   LET l_sql = " SELECT apdcseq,inaj006,xcbf001,inaj010,apdc_price ",
               "   FROM aapt430_tmp "
               
   PREPARE s_aapt430_tmpp2 FROM l_sql
   DECLARE s_aapt430_tmpc2 CURSOR FOR s_aapt430_tmpp2
   
   LET l_sql = "UPDATE aapt430_tmp",
               "   SET apdc_price = ? ",
               " WHERE apdcseq = ? ",
               "   AND inaj006 = ? ",
               "   AND xcbf001 = ? ",
               "   AND inaj010 = ? "
   
   PREPARE s_aapt430_tmpp3 FROM l_sql
   
   #取位
   FOREACH s_aapt430_tmpc2 INTO l_apdcseq,l_inaj006,l_xcbf001_1,l_inaj010,l_apdc_price 
      CALL s_curr_round_ld('1',l_apda.apdald,l_glaa001,l_apdc_price,2)
           RETURNING l_success,g_errno,l_apdc_price
      EXECUTE s_aapt430_tmpp3 USING l_apdc_price,l_apdcseq,l_inaj006,l_xcbf001_1,l_inaj010     
   END FOREACH     
                    
   #處理尾差問題
   #先找出有尾差的資料
   LET l_sql = "SELECT a.apdcseq,(a.apdc_sum-b.apdc_sum1) ",
               "  FROM (SELECT DISTINCT apdcseq,apdc_sum FROM aapt430_tmp) a,
                       (SELECT apdcseq,SUM(apdc_price) apdc_sum1 FROM aapt430_tmp GROUP BY apdcseq) b ",
               " WHERE a.apdcseq = b.apdcseq AND (a.apdc_sum-b.apdc_sum1) <> 0 "
   PREPARE s_aapt430_tmpp4 FROM l_sql
   DECLARE s_aapt430_tmpc4 CURSOR FOR s_aapt430_tmpp4
   
   #更新調整尾差
   LET l_sql = "UPDATE aapt430_tmp",
               "   SET apdc_price = ? ",
               " WHERE apdcseq = ? ",
               "   AND inaj006 = ? ",
               "   AND xcbf001 = ? ",
               "   AND inaj010 = ? "
   
   PREPARE s_aapt430_tmpp5 FROM l_sql
   
   #找出金額最大那一筆
   LET l_sql = " SELECT inaj006,xcbf001,inaj010,apdc_price ",
               "   FROM aapt430_tmp ",
               "  WHERE apdcseq = ? ",
               "  ORDER BY apdc_price DESC "
   PREPARE s_aapt430_tmpp6 FROM l_sql
   DECLARE s_aapt430_tmpc6 CURSOR FOR s_aapt430_tmpp6
      
   #將尾差分攤再金額最大那一筆
   FOREACH s_aapt430_tmpc4 INTO l_apdcseq,l_diff
      OPEN s_aapt430_tmpc6 USING l_apdcseq
      FETCH s_aapt430_tmpc6 INTO l_inaj006,l_xcbf001_1,l_inaj010,l_apdc_price #取第一筆就好
      LET l_diff = l_apdc_price+l_diff
      EXECUTE s_aapt430_tmpp5 USING l_diff,l_apdcseq,l_inaj006,l_xcbf001_1,l_inaj010
   END FOREACH  

   LET l_sql = " SELECT apdc004,SUM(apdc_price),inaj006,xcbf001,inaj010",
               "   FROM aapt430_tmp ",
               "  GROUP BY apdc004,inaj006,xcbf001,inaj010 "
   #171012-00009#1 add --(E)--
   
   #170525-00042#1---mark---str--
   #LET l_sql = " SELECT apdcorga,apdc004,SUM(apdc213-apdc113)",l_feld1,l_feld2,",inaj010",
   #            "   FROM apdc_t",
   #            "   LEFT JOIN inaj_t ON apdcent = inajent AND apdc002 = inaj001 AND apdc003 = inaj002",
   #            "  WHERE apdcent = ",g_enterprise,
   #            "    AND apdcld  = '",p_ld,"'",
   #            "    AND apdcdocno = '",p_docno,"'",
   #            "  GROUP BY apdcorga,apdc004",l_feld1,l_feld2,",inaj010"
   #170525-00042#1---mark---end--
   #170525-00042#1---add---str--
   #1.移除apdcorga 2.JOIN 增加apdcsite = inajsite 3.inaj010如果是null轉成' '
  #171012-00009#1 mark --(S)-- 
  #LET l_sql = " SELECT apdc004,SUM(apdc213-apdc113)",l_feld1,l_feld2,",COALESCE(inaj010,' ')",   
  #            "   FROM apdc_t",
  #            "   LEFT JOIN inaj_t ON apdcent = inajent AND apdc002 = inaj001 AND apdc003 = inaj002",
  #            "                   AND apdcsite = inajsite ",
  #            "  WHERE apdcent = ",g_enterprise,
  #            "    AND apdcld  = '",p_ld,"'",
  #            "    AND apdcdocno = '",p_docno,"'",       
  #            "  GROUP BY apdc004",l_feld1,l_feld2,",COALESCE(inaj010,' ')"
  #171012-00009#1 mark --(E)--             
   #170525-00042#1---add---end--
   PREPARE s_aapt430_apdcp1 FROM l_sql
   DECLARE s_aapt430_apdcc1 CURSOR FOR s_aapt430_apdcp1
   INITIALIZE l_apdc.* TO NULL
   FOREACH s_aapt430_apdcc1 INTO l_apdc.*
   
      IF SQLCA.SQLCODE THEN
         EXIT FOREACH
      END IF
      
      INITIALIZE l_xcco.* TO NULL
      LET l_xcco.xccoent = g_enterprise
      LET l_xcco.xccold  = l_apda.apdald
      LET l_xcco.xccocomp = l_apda.apdacomp
      
      #帳套本位幣順序
      LET l_xcco.xcco001  = '1' #本幣

      #成本域 
     #IF NOT cl_null(l_apdc.inaj008) THEN   #171012-00009#1 mark
         #170704-00080#1 mark ------
         #LET l_sql = " SELECT xcbf001 FROM xcbf_t ",
         #            "  WHERE xcbfent = '",g_enterprise,"'",
         #            "    AND xcbf002 = '",l_apdc.inaj008,"'",
         #            "    AND xcbf003 = '2'"
         #PREPARE xcbf001_pre1 FROM l_sql
         #DECLARE xcbf001_cur1 CURSOR FOR xcbf001_pre1
         #OPEN xcbf001_cur1
         #FETCH xcbf001_cur1 INTO l_xcbf001
         #170704-00080#1 mark end---
        #EXECUTE xcbf001_pre1 USING l_apdc.inaj008 INTO l_xcbf001 #170704-00080#1  #171012-00009#1 mark 
     #END IF                                                                       #171012-00009#1 mark 
      
      IF l_fin_6001 = 'Y' THEN      #171012-00009#1 add
         IF l_sfin6002 = '1' THEN   #171012-00009#1 add 
            LET l_xcco.xcco002 = l_xcbf001
         #171012-00009#1 add --(S)--
         END IF
         IF l_sfin6002 MATCHES "[23]" THEN
            LET l_xcco.xcco002 = l_apdc.inaj008
         END IF
      END IF                                          
      #171012-00009#1 add --(E)--
      IF cl_null(l_xcco.xcco002) THEN LET l_xcco.xcco002 = ' ' END IF

      LET l_glaa003 = NULL
      #SELECT glaa120,glaa003 INTO l_xcco.xcco003,l_glaa003
      #  FROM glaa_t
      # WHERE glaaent = g_enterprise
      #   AND glaald  = p_ld
      
      #取得成本計算類型&會計週期參照表
      CALL s_ld_sel_glaa(p_ld,'glaa120|glaa003|glaa015|glaa019')
           RETURNING g_sub_success,l_xcco.xcco003,l_glaa003,l_glaa015,l_glaa019
      IF cl_null(l_xcco.xcco003) THEN LET l_xcco.xcco003 = ' ' END IF
      #151207-00018#3--(S)
      IF cl_null(l_glaa003) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'agl-00252'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
      #151207-00018#3--(E)
      #依單據日期取得會計年度&期別
      INITIALIZE l_accdate.* TO NULL
      CALL s_get_accdate(l_glaa003,l_apda.apdadocdt,'','')
           RETURNING l_chr,g_errno,l_xcco.xcco004,l_accdate.glav005,l_accdate.sdate_s,l_accdate.sdate_e,
                     l_xcco.xcco005,l_accdate.pdate_s,l_accdate.pdate_e,l_accdate.glav007,l_accdate.wdate_s,
                     l_accdate.wdate_e
      IF cl_null(l_xcco.xcco004) THEN LET l_xcco.xcco004 = ' ' END IF
      IF cl_null(l_xcco.xcco005) THEN LET l_xcco.xcco005 = ' ' END IF
      
      #料件編號
      LET l_xcco.xcco006 = l_apdc.apdc004
      IF cl_null(l_xcco.xcco006) THEN LET l_xcco.xcco006 = ' ' END IF
      
      #特性
      #根据采购入库单上的特性
      IF cl_get_para(g_enterprise,l_apda.apdacomp,'S-FIN-6013') = 'Y' THEN
         #IF l_apdc.apdc002 IS NOT NULL THEN  #交易單號非空白者,則取庫存異動檔的產品特性(inaj006)
            LET l_xcco.xcco007 = l_apdc.inaj006
            #SELECT inaj006 INTO l_xcco.xcco007
            #  FROM inaj_t
            # WHERE inajent = g_enterprise
            #   AND inaj001 = l_apdc.apdc002
            #   AND inaj002 = l_apdc.apdc003
         #END IF
      END IF
      IF cl_null(l_xcco.xcco007) THEN LET l_xcco.xcco007 = ' ' END IF
      
      #批號
      #IF l_apdc.apdc002 IS NOT NULL THEN  #交易單號非空白者,則取庫存異動檔的批號(inaj010)
         LET l_xcco.xcco008 = l_apdc.inaj010
         #SELECT inaj010 INTO l_xcco.xcco008
         #  FROM inaj_t
         # WHERE inajent = g_enterprise
         #   AND inaj001 = l_apdc.apdc002
         #   AND inaj002 = l_apdc.apdc003
      #END IF
      IF cl_null(l_xcco.xcco008) THEN LET l_xcco.xcco008 = ' ' END IF

      #參考單號
      LET l_xcco.xcco009 = l_apda.apdadocno
      IF cl_null(l_xcco.xcco009) THEN LET l_xcco.xcco009 = ' ' END IF
      
      #資料來源:4.費用分攤
      LET l_xcco.xcco010 = '4'
      #原因碼說明
      CALL s_desc_get_acc_desc('3113',l_apda.apda018) RETURNING l_xcco.xcco011
      #當月調整金額
      LET l_xcco.xcco102 = l_apdc.apdc213
      CASE
         WHEN l_apda.apda021 = '1' #當月調整金額-材料
            LET l_xcco.xcco102a = l_apdc.apdc213
         WHEN l_apda.apda021 = '2' #當月調整金額-人工
            LET l_xcco.xcco102b = l_apdc.apdc213
         WHEN l_apda.apda021 = '3' #當月調整金額-委外加工
            LET l_xcco.xcco102c = l_apdc.apdc213
         WHEN l_apda.apda021 = '4' #當月調整金額-制費一
            LET l_xcco.xcco102d = l_apdc.apdc213
         WHEN l_apda.apda021 = '5' #當月調整金額-制費二
            LET l_xcco.xcco102e = l_apdc.apdc213
         WHEN l_apda.apda021 = '6' #當月調整金額-制費三
            LET l_xcco.xcco102f = l_apdc.apdc213
         WHEN l_apda.apda021 = '7' #當月調整金額-制費四
            LET l_xcco.xcco102g = l_apdc.apdc213
         WHEN l_apda.apda021 = '8' #當月調整金額-制費五
            LET l_xcco.xcco102h = l_apdc.apdc213
      END CASE
      LET l_xcco.xccostus = 'Y'
      
      #150303 add---
      IF cl_null(l_xcco.xcco102) THEN LET l_xcco.xcco102 = 0 END IF
      IF cl_null(l_xcco.xcco102a) THEN LET l_xcco.xcco102a = 0 END IF
      IF cl_null(l_xcco.xcco102b) THEN LET l_xcco.xcco102b = 0 END IF
      IF cl_null(l_xcco.xcco102c) THEN LET l_xcco.xcco102c = 0 END IF
      IF cl_null(l_xcco.xcco102d) THEN LET l_xcco.xcco102d = 0 END IF
      IF cl_null(l_xcco.xcco102e) THEN LET l_xcco.xcco102e = 0 END IF
      IF cl_null(l_xcco.xcco102f) THEN LET l_xcco.xcco102f = 0 END IF
      IF cl_null(l_xcco.xcco102g) THEN LET l_xcco.xcco102g = 0 END IF
      IF cl_null(l_xcco.xcco102h) THEN LET l_xcco.xcco102h = 0 END IF
      #150303 add end---

      #170704-00080#1 mark ------
      #INSERT INTO xcco_t(xccoent,xccold,xccocomp
      #                  ,xcco001,xcco002,xcco003,xcco004,xcco005
      #                  ,xcco006,xcco007,xcco008,xcco009,xcco010
      #                  ,xcco011,xcco102,xcco102a,xcco102b,xcco102c
      #                  ,xcco102d,xcco102e,xcco102f,xcco102g,xcco102h
      #                  ,xccostus)
      #            VALUES(l_xcco.xccoent,l_xcco.xccold,l_xcco.xccocomp
      #                  ,l_xcco.xcco001,l_xcco.xcco002,l_xcco.xcco003,l_xcco.xcco004,l_xcco.xcco005
      #                  ,l_xcco.xcco006,l_xcco.xcco007,l_xcco.xcco008,l_xcco.xcco009,l_xcco.xcco010
      #                  ,l_xcco.xcco011,l_xcco.xcco102,l_xcco.xcco102a,l_xcco.xcco102b,l_xcco.xcco102c
      #                  ,l_xcco.xcco102d,l_xcco.xcco102e,l_xcco.xcco102f,l_xcco.xcco102g,l_xcco.xcco102h
      #                  ,l_xcco.xccostus)
      #170704-00080#1 mark end---
      #170704-00080#1 add ------
      EXECUTE ins_xcco_pre USING l_xcco.xccoent,l_xcco.xccold,l_xcco.xccocomp,
                                 l_xcco.xcco001,l_xcco.xcco002,l_xcco.xcco003,l_xcco.xcco004,l_xcco.xcco005,
                                 l_xcco.xcco006,l_xcco.xcco007,l_xcco.xcco008,l_xcco.xcco009,l_xcco.xcco010,
                                 l_xcco.xcco011,l_xcco.xcco102,l_xcco.xcco102a,l_xcco.xcco102b,l_xcco.xcco102c,
                                 l_xcco.xcco102d,l_xcco.xcco102e,l_xcco.xcco102f,l_xcco.xcco102g,l_xcco.xcco102h,
                                 l_xcco.xccostus
      #170704-00080#1 add end---
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
      
      IF l_glaa015 = 'Y' THEN
         #帳套本位幣順序
         LET l_xcco.xcco001  = '2' #本位幣二
         #170704-00080#1 mark ------
         #INSERT INTO xcco_t(xccoent,xccold,xccocomp
         #                  ,xcco001,xcco002,xcco003,xcco004,xcco005
         #                  ,xcco006,xcco007,xcco008,xcco009,xcco010
         #                  ,xcco011,xcco102,xcco102a,xcco102b,xcco102c
         #                  ,xcco102d,xcco102e,xcco102f,xcco102g,xcco102h
         #                  ,xccostus)
         #            VALUES(l_xcco.xccoent,l_xcco.xccold,l_xcco.xccocomp
         #                  ,l_xcco.xcco001,l_xcco.xcco002,l_xcco.xcco003,l_xcco.xcco004,l_xcco.xcco005
         #                  ,l_xcco.xcco006,l_xcco.xcco007,l_xcco.xcco008,l_xcco.xcco009,l_xcco.xcco010
         #                  ,l_xcco.xcco011,l_xcco.xcco102,l_xcco.xcco102a,l_xcco.xcco102b,l_xcco.xcco102c
         #                  ,l_xcco.xcco102d,l_xcco.xcco102e,l_xcco.xcco102f,l_xcco.xcco102g,l_xcco.xcco102h
         #                  ,l_xcco.xccostus)
         #170704-00080#1 mark end---
         #170704-00080#1 add ------
         EXECUTE ins_xcco_pre USING l_xcco.xccoent,l_xcco.xccold,l_xcco.xccocomp,
                                    l_xcco.xcco001,l_xcco.xcco002,l_xcco.xcco003,l_xcco.xcco004,l_xcco.xcco005,
                                    l_xcco.xcco006,l_xcco.xcco007,l_xcco.xcco008,l_xcco.xcco009,l_xcco.xcco010,
                                    l_xcco.xcco011,l_xcco.xcco102,l_xcco.xcco102a,l_xcco.xcco102b,l_xcco.xcco102c,
                                    l_xcco.xcco102d,l_xcco.xcco102e,l_xcco.xcco102f,l_xcco.xcco102g,l_xcco.xcco102h,
                                    l_xcco.xccostus
         #170704-00080#1 add end---
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.SQLCODE
            LET g_errparam.extend = ''
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF
      END IF
      
      IF l_glaa019 = 'Y' THEN
         #帳套本位幣順序
         LET l_xcco.xcco001  = '3' #本位幣三
         #170704-00080#1 mark ------
         #INSERT INTO xcco_t(xccoent,xccold,xccocomp
         #                  ,xcco001,xcco002,xcco003,xcco004,xcco005
         #                  ,xcco006,xcco007,xcco008,xcco009,xcco010
         #                  ,xcco011,xcco102,xcco102a,xcco102b,xcco102c
         #                  ,xcco102d,xcco102e,xcco102f,xcco102g,xcco102h
         #                  ,xccostus)
         #            VALUES(l_xcco.xccoent,l_xcco.xccold,l_xcco.xccocomp
         #                  ,l_xcco.xcco001,l_xcco.xcco002,l_xcco.xcco003,l_xcco.xcco004,l_xcco.xcco005
         #                  ,l_xcco.xcco006,l_xcco.xcco007,l_xcco.xcco008,l_xcco.xcco009,l_xcco.xcco010
         #                  ,l_xcco.xcco011,l_xcco.xcco102,l_xcco.xcco102a,l_xcco.xcco102b,l_xcco.xcco102c
         #                  ,l_xcco.xcco102d,l_xcco.xcco102e,l_xcco.xcco102f,l_xcco.xcco102g,l_xcco.xcco102h
         #                  ,l_xcco.xccostus)
         #170704-00080#1 mark end---
         #170704-00080#1 add ------
         EXECUTE ins_xcco_pre USING l_xcco.xccoent,l_xcco.xccold,l_xcco.xccocomp,
                                    l_xcco.xcco001,l_xcco.xcco002,l_xcco.xcco003,l_xcco.xcco004,l_xcco.xcco005,
                                    l_xcco.xcco006,l_xcco.xcco007,l_xcco.xcco008,l_xcco.xcco009,l_xcco.xcco010,
                                    l_xcco.xcco011,l_xcco.xcco102,l_xcco.xcco102a,l_xcco.xcco102b,l_xcco.xcco102c,
                                    l_xcco.xcco102d,l_xcco.xcco102e,l_xcco.xcco102f,l_xcco.xcco102g,l_xcco.xcco102h,
                                    l_xcco.xccostus
         #170704-00080#1 add end---
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.SQLCODE
            LET g_errparam.extend = ''
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF
      END IF
   END FOREACH
    
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 核算項檢核
# Memo...........:
# Usage..........: CALL s_aapt430_account_item_chk(p_ld,p_docno)

# Date & Author..: 2014/12/30 By Reanna
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt430_account_item_chk(p_ld,p_docno)
DEFINE p_ld             LIKE apda_t.apdald
DEFINE p_docno          LIKE apda_t.apdadocno
DEFINE r_success        LIKE type_t.num5
DEFINE l_sql            STRING
DEFINE l_apce           RECORD
            apda005     LIKE apda_t.apda005,
            apce038     LIKE apce_t.apce038,
            apceld      LIKE apce_t.apceld,
            apce016     LIKE apce_t.apce016,
            apceseq     LIKE apce_t.apceseq,
            apdadocdt   LIKE apda_t.apdadocdt,
            apce017     LIKE apce_t.apce017,
                        
            apce018     LIKE apce_t.apce018,
            apce019     LIKE apce_t.apce019,
            apce020     LIKE apce_t.apce020,
            apce022     LIKE apce_t.apce022,
            apce023     LIKE apce_t.apce023,
                        
            apce035     LIKE apce_t.apce035,
            apce036     LIKE apce_t.apce036,
            apce044     LIKE apce_t.apce044,
            apce045     LIKE apce_t.apce045,
            apce046     LIKE apce_t.apce046,
            
            apce051     LIKE apce_t.apce051,
            apce052     LIKE apce_t.apce052,
            apce053     LIKE apce_t.apce053,
            apce054     LIKE apce_t.apce054,
            apce055     LIKE apce_t.apce055,
            
            apce056     LIKE apce_t.apce056,
            apce057     LIKE apce_t.apce057,
            apce058     LIKE apce_t.apce058,
            apce059     LIKE apce_t.apce059,
            apce060     LIKE apce_t.apce060
                        END RECORD
                        
DEFINE l_apdc           RECORD
            apda005     LIKE apda_t.apda005,
            apdc026     LIKE apdc_t.apdc026,
            apdcld      LIKE apdc_t.apdcld,
            apdc007     LIKE apdc_t.apdc007,
            apdcseq     LIKE apdc_t.apdcseq,
            apdadocdt   LIKE apda_t.apdadocdt,
            apdc017     LIKE apdc_t.apdc017,
                        
            apdc018     LIKE apdc_t.apdc018,
            apdc019     LIKE apdc_t.apdc019,
            apdc020     LIKE apdc_t.apdc020,
            apdc022     LIKE apdc_t.apdc022,
            apdc023     LIKE apdc_t.apdc023,
                        
            apdc024     LIKE apdc_t.apdc024,
            apdc025     LIKE apdc_t.apdc025,
            apdc027     LIKE apdc_t.apdc027,
            apdc028     LIKE apdc_t.apdc028,
            apdc029     LIKE apdc_t.apdc029,
            
            apdc031     LIKE apdc_t.apdc031,
            apdc032     LIKE apdc_t.apdc032,
            apdc033     LIKE apdc_t.apdc033,
            apdc034     LIKE apdc_t.apdc034,
            apdc035     LIKE apdc_t.apdc035,

            apdc036     LIKE apdc_t.apdc036,
            apdc037     LIKE apdc_t.apdc037,
            apdc038     LIKE apdc_t.apdc038,
            apdc039     LIKE apdc_t.apdc039,
            apdc040     LIKE apdc_t.apdc040
                        END RECORD
                        
DEFINE l_account        DYNAMIC ARRAY OF RECORD
                f1      LIKE type_t.chr100,     #欄位值
                f2      LIKE type_t.chr7,       #欄位說明
                f3      LIKE apca_t.apcadocdt   #條件
                        END RECORD

   LET r_success = TRUE
   LET l_sql = " SELECT apda005,apce038,apceld,apce016,apceseq,apdadocdt,apce017, ",
               "        apce018,apce019,apce020,apce022,apce023, ",
               "        apce035,apce036,apce044,apce045,apce046, ",
               "        apce051,apce052,apce053,apce054,apce055, ",
               "        apce056,apce057,apce058,apce059,apce060 ",
               "   FROM apce_t,apda_t ",
               "  WHERE apceent = apdaent ",
               "    AND apcedocno = apdadocno ",
               "    AND apceld = apdald ",
               "    AND apceent = '",g_enterprise,"' ",
               "    AND apcedocno = '",p_docno,"' ",
               "    AND apceld = '",p_ld,"' ",
               "  ORDER BY apceseq "

   PREPARE s_aapt430_sel_apce_chk_p FROM l_sql
   DECLARE s_aapt430_sel_apce_chk_c CURSOR FOR s_aapt430_sel_apce_chk_p
   FOREACH s_aapt430_sel_apce_chk_c INTO l_apce.*
      CALL l_account.clear()
      LET l_account[7].f1  = l_apce.apce018    LET l_account[7].f2 = "apce018"      LET l_account[7].f3 = l_apce.apdadocdt  #部門
      LET l_account[8].f1  = l_apce.apce019    LET l_account[8].f2 = "apce019"      #責任中心
      LET l_account[9].f1  = l_apce.apce035    LET l_account[9].f2 = "apce035"	   #區域
      LET l_account[10].f1 = l_apce.apce038    LET l_account[10].f2 = "apce038"	   #交易客商
      LET l_account[11].f1 = l_apce.apce036    LET l_account[11].f2 = "apce036"	   #客群
      
      LET l_account[12].f1 = l_apce.apce020    LET l_account[12].f2 = "apce020"	   #產品類別
      LET l_account[13].f1 = l_apce.apce017    LET l_account[13].f2 = "apce017"     #人員
      LET l_account[15].f1 = l_apce.apce022    LET l_account[15].f2 = "apce022"     #專案管理
      LET l_account[16].f1 = l_apce.apce023    LET l_account[16].f2 = "apce023"     #WBS
      LET l_account[27].f1 = l_apce.apda005    LET l_account[27].f2 = "apda005"	   #帳款客商

      LET l_account[31].f1 = l_apce.apce044    LET l_account[31].f2 = "apce044"	   #經營方式
      LET l_account[32].f1 = l_apce.apce045    LET l_account[32].f2 = "apce045"     #渠道
      LET l_account[33].f1 = l_apce.apce046    LET l_account[33].f2 = "apce046"     #品牌

      LET l_account[17].f1 = l_apce.apce051    LET l_account[17].f2 = "apce051"	   #自由核算項一
      LET l_account[18].f1 = l_apce.apce052    LET l_account[18].f2 = "apce052"	   #自由核算項二
      LET l_account[19].f1 = l_apce.apce053    LET l_account[19].f2 = "apce053"	   #自由核算項三
      LET l_account[20].f1 = l_apce.apce054    LET l_account[20].f2 = "apce054"	   #自由核算項四
      LET l_account[21].f1 = l_apce.apce055    LET l_account[21].f2 = "apce055"	   #自由核算項五
      
      LET l_account[22].f1 = l_apce.apce056    LET l_account[22].f2 = "apce056"	   #自由核算項六
      LET l_account[23].f1 = l_apce.apce057    LET l_account[23].f2 = "apce057"	   #自由核算項七
      LET l_account[24].f1 = l_apce.apce058    LET l_account[24].f2 = "apce058"	   #自由核算項八
      LET l_account[25].f1 = l_apce.apce059    LET l_account[25].f2 = "apce059"	   #自由核算項九
      LET l_account[26].f1 = l_apce.apce060    LET l_account[26].f2 = "apce060"	   #自由核算項十

      CALL s_fin_accting_chk(l_apce.apceld,l_apce.apce016,l_account) RETURNING g_sub_success
      IF NOT g_sub_success THEN
         LET r_success = FALSE
      END IF
   END FOREACH
   
   LET l_sql = " SELECT apda005,'',apdcld,apdc007,apdcseq,apdadocdt,apdc017, ",
               "        apdc018,apdc019,apdc020,apdc022,apdc023, ",
               "        apdc024,apdc025,apdc027,apdc028,apdc029, ",
               "        apdc031,apdc032,apdc033,apdc034,apdc035, ",
               "        apdc036,apdc037,apdc038,apdc039,apdc040 ",
               "   FROM apdc_t,apda_t ",
               "  WHERE apdcent = apdaent ",
               "    AND apdcdocno = apdadocno ",
               "    AND apdcld = apdald ",
               "    AND apdcent = '",g_enterprise,"' ",
               "    AND apdcdocno = '",p_docno,"' ",
               "    AND apdcld = '",p_ld,"' ",
               "  ORDER BY apdcseq "
   PREPARE s_aapt430_sel_apdc_chk_p FROM l_sql
   DECLARE s_aapt430_sel_apdc_chk_c CURSOR FOR s_aapt430_sel_apdc_chk_p
   FOREACH s_aapt430_sel_apdc_chk_c INTO l_apdc.*
      IF cl_null(l_apdc.apdc038) THEN LET l_apdc.apdc038 = l_apdc.apda005 END IF
      CALL l_account.clear()
      LET l_account[7].f1  = l_apdc.apdc018    LET l_account[7].f2 = "apdc018"      LET l_account[7].f3 = l_apdc.apdadocdt  #部門
      LET l_account[8].f1  = l_apdc.apdc019    LET l_account[8].f2 = "apdc019"      #責任中心
      LET l_account[9].f1  = l_apdc.apdc024    LET l_account[9].f2 = "apdc024"	   #區域
      LET l_account[10].f1 = l_apdc.apdc026    LET l_account[10].f2 = ''            #交易客商
      LET l_account[11].f1 = l_apdc.apdc025    LET l_account[11].f2 = "apdc025"	   #客群
      
      LET l_account[12].f1 = l_apdc.apdc020    LET l_account[12].f2 = "apdc020"	   #產品類別
      LET l_account[13].f1 = l_apdc.apdc017    LET l_account[13].f2 = "apdc017"     #人員
      LET l_account[15].f1 = l_apdc.apdc022    LET l_account[15].f2 = "apdc022"     #專案管理
      LET l_account[16].f1 = l_apdc.apdc023    LET l_account[16].f2 = "apdc023"     #WBS
      LET l_account[27].f1 = l_apdc.apdc038    LET l_account[27].f2 = "apdc038"	   #帳款客商

      LET l_account[31].f1 = l_apdc.apdc027    LET l_account[31].f2 = "apdc027"	   #經營方式
      LET l_account[32].f1 = l_apdc.apdc028    LET l_account[32].f2 = "apdc028"     #渠道
      LET l_account[33].f1 = l_apdc.apdc029    LET l_account[33].f2 = "apdc029"     #品牌
                                                                                    
      LET l_account[17].f1 = l_apdc.apdc031    LET l_account[17].f2 = "apdc031"	   #自由核算項一
      LET l_account[18].f1 = l_apdc.apdc032    LET l_account[18].f2 = "apdc032"	   #自由核算項二
      LET l_account[19].f1 = l_apdc.apdc033    LET l_account[19].f2 = "apdc033"	   #自由核算項三
      LET l_account[20].f1 = l_apdc.apdc034    LET l_account[20].f2 = "apdc034"	   #自由核算項四
      LET l_account[21].f1 = l_apdc.apdc035    LET l_account[21].f2 = "apdc035"	   #自由核算項五

      LET l_account[22].f1 = l_apdc.apdc036    LET l_account[22].f2 = "apdc036"	   #自由核算項六
      LET l_account[23].f1 = l_apdc.apdc037    LET l_account[23].f2 = "apdc037"	   #自由核算項七
      LET l_account[24].f1 = l_apdc.apdc038    LET l_account[24].f2 = "apdc038"	   #自由核算項八
      LET l_account[25].f1 = l_apdc.apdc039    LET l_account[25].f2 = "apdc039"	   #自由核算項九
      LET l_account[26].f1 = l_apdc.apdc040    LET l_account[26].f2 = "apdc040"	   #自由核算項十

      CALL s_fin_accting_chk(l_apdc.apdcld,l_apdc.apdc007,l_account) RETURNING g_sub_success
      IF NOT g_sub_success THEN
         LET r_success = FALSE
      END IF
   END FOREACH
   
   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 目的頁籤之交易單據check
# Memo...........:
# Usage..........: CALL s_aapt430_apdc002_chk(p_orga,p_docno,p_seq,p_apdadocno,p_apdald)

# Date & Author..: 16/08/22 By 03538(#160816-00022#1)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt430_apdc002_chk(p_orga,p_docno,p_seq,p_apdadocno,p_apdald)
DEFINE p_orga      LIKE pmdt_t.pmdtsite    #交易單據組織
DEFINE p_docno     LIKE pmdt_t.pmdtdocno   #交易單據
DEFINE p_seq       LIKE pmdt_t.pmdtseq     #交易項次
DEFINE p_apdadocno LIKE apda_t.apdadocno   #分攤單號
DEFINE p_apdald    LIKE apda_t.apdald      #帳套
DEFINE r_success   LIKE type_t.num5
DEFINE r_errno     LIKE gzze_t.gzze001
DEFINE l_pmds      RECORD 
                   pmdsstus   LIKE pmds_t.pmdsstus,
                   pmds000    LIKE pmds_t.pmds000,
                   pmdtsite   LIKE pmdt_t.pmdtsite
                   END RECORD
DEFINE l_count     LIKE type_t.num5
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   LET r_errno   = ''
   IF cl_null(p_orga) OR cl_null(p_docno) OR cl_null(p_seq) THEN
      RETURN r_success,r_errno
   END IF
   #有效入庫單 pmdsstus='S'
   #非收貨單   pmds000<> '1','2','5','７'	#不顯示收貨單、倉退單、驗退單
   
   INITIALIZE l_pmds.* TO NULL
   SELECT pmdsstus,pmds000,pmdtsite INTO l_pmds.*
     FROM pmds_t,pmdt_t
    WHERE pmdsent = pmdtent AND pmdsdocno = pmdtdocno
      AND pmdsent = g_enterprise
      AND pmdsdocno = p_docno
      AND pmdtseq = p_seq
   CASE
      WHEN SQLCA.SQLCODE = 100
         LET r_errno = 'asf-00154'
         LET r_success = FALSE
      WHEN l_pmds.pmdsstus <> 'S'
         LET r_errno = 'ain-00227'
         LET r_success = FALSE
      WHEN s_aap_pmds000_chk("  (gzcb003 IS NULL OR gzcb004 <> 1) ",l_pmds.pmds000)  #排除不符合性質為入庫且立帳者
         LET r_errno = 'aap-00173'
         LET r_success = FALSE
      WHEN l_pmds.pmdtsite <> p_orga
         LET r_errno = 'aap-00274'
         LET r_success = FALSE
   END CASE
	
	#入庫單號+項次，已存在於本筆分攤單據者，不可重覆輸入
   LET l_count = 0
   SELECT COUNT(*) INTO l_count FROM apdc_t
    WHERE apdcent = g_enterprise
      AND apdcld  = p_apdald
      AND apdcdocno = p_apdadocno
      AND apdc002   = p_docno
      AND apdc003   = p_seq
   IF cl_null(l_count)THEN LET l_count = 0 END IF
   IF l_count > 0 THEN
      LET r_success = FALSE
      LET r_errno   = 'aap-00174'
   END IF
	
	#160920-00046#1 -s
   #單據性質需為13or17類(aapt300的單據)
   LET l_count = 0
   SELECT COUNT(1) INTO l_count
     FROM  pmds_t
     LEFT JOIN pmdt_t ON pmdsent = pmdtent AND pmdsdocno = pmdtdocno
     LEFT JOIN apcb_t ON pmdsent = apcbent AND pmdsdocno = apcb002 AND pmdtseq = apcb003
     LEFT JOIN apca_t ON apcbent  = apcaent AND apcbld = apcald AND apcbdocno = apcadocno
    WHERE pmdsent = g_enterprise
      AND pmdtdocno = p_docno
      AND pmdtseq = p_seq
      AND pmdsstus='S'
      #AND apca001 IN ('13','17')          #161104-00049#1 mark
      AND apca001 IN ('01','03','13','17') #161104-00049#1 add
   IF cl_null(l_count)THEN LET l_count = 0 END IF
  #IF l_count > 0 THEN  #161018-00009#1 mark
   IF l_count = 0 THEN  #161018-00009#1
      LET r_success = FALSE
      LET r_errno   = 'aap-00596'
   END IF
   #160920-00046#1 -e
   
   IF cl_null(r_errno) THEN
      #交易單據+項次所對應的pmdu_t(多庫儲批收貨明細檔),其中的庫位,必須至少有一個為成本倉,才可以做分攤(看aini001)
      LET l_count = 0
      SELECT COUNT(pmdtseq) INTO l_count FROM pmdt_t
       WHERE pmdtent = g_enterprise
         AND pmdtdocno = p_docno
         AND pmdtseq = p_seq
         AND EXISTS(SELECT 1 FROM pmdu_t
                     WHERE pmduent = g_enterprise
                       AND pmduent = pmdtent
                       AND pmdudocno = pmdtdocno
                       AND pmduseq = pmdtseq
                       AND EXISTS (SELECT 1 FROM inaa_t
                                    WHERE inaaent = g_enterprise
                                      AND inaaent = pmduent
                                      AND inaa001 = pmdu006
                                      AND inaasite = pmdusite
                                      AND inaa010 = 'Y'))
      IF cl_null(l_count) THEN LET l_count = 0 END IF
      IF l_count = 0 THEN
         LET r_success = FALSE
         LET r_errno   = 'aap-00582'
         END IF
   END IF
   
   RETURN r_success,r_errno
END FUNCTION

################################################################################
# Descriptions...: 整批產生單身寫入來源明細(apce_t)
# Memo...........: #161108-00005#1
# Usage..........: CALL s_aapt430_ins_apce()
# Input parameter: p_wc           開窗回傳字串
#                : p_wc1          回傳apca001
#                : p_ld           帳套
#                : p_apdadocno    單頭單號
#                : p_apdacomp     法人
#                : p_apdasite     單頭帳務中心
#                : p_apdadocdt    單據日期
#                : p_prog         來源作業
# Return code....: 無
# Date & Author..: 170321 By 08729
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt430_ins_apce(p_wc,p_wc1,p_ld,p_apdadocno,p_apdacomp,p_apdasite,p_apdadocdt,p_prog)
DEFINE p_wc              STRING
DEFINE p_wc1             STRING
DEFINE p_ld              LIKE apda_t.apdald
DEFINE p_apdadocno       LIKE apda_t.apdadocno
DEFINE p_apdacomp        LIKE apda_t.apdacomp
DEFINE p_apdasite        LIKE apda_t.apdasite
DEFINE p_apdadocdt       LIKE apda_t.apdadocdt
DEFINE p_prog            LIKE apce_t.apce001
DEFINE l_sfin2002        LIKE type_t.chr1
DEFINE g_scc8502         STRING
DEFINE l_apce RECORD  #應付沖帳明細
       apceent LIKE apce_t.apceent, #企業編號
       apcecomp LIKE apce_t.apcecomp, #法人
       apcelegl LIKE apce_t.apcelegl, #核算組織
       apcesite LIKE apce_t.apcesite, #帳務組織
       apceld LIKE apce_t.apceld, #帳套
       apceorga LIKE apce_t.apceorga, #帳務歸屬組織
       apcedocno LIKE apce_t.apcedocno, #沖銷單單號
       apceseq LIKE apce_t.apceseq, #項次
       apce001 LIKE apce_t.apce001, #來源作業
       apce002 LIKE apce_t.apce002, #沖銷類型
       apce003 LIKE apce_t.apce003, #沖銷帳款單單號
       apce004 LIKE apce_t.apce004, #沖銷帳款單項次
       apce005 LIKE apce_t.apce005, #分期帳款序
       apce006 LIKE apce_t.apce006, #no use
       apce007 LIKE apce_t.apce007, #no use
       apce008 LIKE apce_t.apce008, #票據號碼/ 現金銀存帳戶
       apce009 LIKE apce_t.apce009, #no use
       apce010 LIKE apce_t.apce010, #摘要說明
       apce011 LIKE apce_t.apce011, #理由碼
       apce012 LIKE apce_t.apce012, #銀存存提碼
       apce013 LIKE apce_t.apce013, #現金異動碼
       apce014 LIKE apce_t.apce014, #no use
       apce015 LIKE apce_t.apce015, #沖銷加減項
       apce016 LIKE apce_t.apce016, #沖銷科目
       apce017 LIKE apce_t.apce017, #業務人員
       apce018 LIKE apce_t.apce018, #業務部門
       apce019 LIKE apce_t.apce019, #責任中心
       apce020 LIKE apce_t.apce020, #產品類別
       apce021 LIKE apce_t.apce021, #no use
       apce022 LIKE apce_t.apce022, #專案編號
       apce023 LIKE apce_t.apce023, #WBS編號
       apce024 LIKE apce_t.apce024, #第二參考單號
       apce025 LIKE apce_t.apce025, #第二參考單號項次
       apce026 LIKE apce_t.apce026, #no use
       apce027 LIKE apce_t.apce027, #應稅折抵否
       apce028 LIKE apce_t.apce028, #產生方式
       apce029 LIKE apce_t.apce029, #傳票號碼
       apce030 LIKE apce_t.apce030, #傳票項次
       apce031 LIKE apce_t.apce031, #付款(票)到期日
       apce032 LIKE apce_t.apce032, #應付款日
       apce033 LIKE apce_t.apce033, #no use
       apce034 LIKE apce_t.apce034, #no use
       apce035 LIKE apce_t.apce035, #區域
       apce036 LIKE apce_t.apce036, #客戶分類
       apce037 LIKE apce_t.apce037, #no use
       apce038 LIKE apce_t.apce038, #帳款對象
       apce039 LIKE apce_t.apce039, #no use
       apce040 LIKE apce_t.apce040, #no use
       apce041 LIKE apce_t.apce041, #no use
       apce042 LIKE apce_t.apce042, #no use
       apce043 LIKE apce_t.apce043, #no use
       apce044 LIKE apce_t.apce044, #經營方式
       apce045 LIKE apce_t.apce045, #通路
       apce046 LIKE apce_t.apce046, #品牌
       apce047 LIKE apce_t.apce047, #發票編號
       apce048 LIKE apce_t.apce048, #發票號碼
       apce049 LIKE apce_t.apce049, #付款申請單號碼
       apce050 LIKE apce_t.apce050, #付款申請單項次
       apce051 LIKE apce_t.apce051, #自由核算項一
       apce052 LIKE apce_t.apce052, #自由核算項二
       apce053 LIKE apce_t.apce053, #自由核算項三
       apce054 LIKE apce_t.apce054, #自由核算項四
       apce055 LIKE apce_t.apce055, #自由核算項五
       apce056 LIKE apce_t.apce056, #自由核算項六
       apce057 LIKE apce_t.apce057, #自由核算項七
       apce058 LIKE apce_t.apce058, #自由核算項八
       apce059 LIKE apce_t.apce059, #自由核算項九
       apce060 LIKE apce_t.apce060, #自由核算項十
       apce100 LIKE apce_t.apce100, #幣別
       apce101 LIKE apce_t.apce101, #匯率
       apce104 LIKE apce_t.apce104, #原幣應稅折抵稅額
       apce109 LIKE apce_t.apce109, #原幣沖帳金額
       apce114 LIKE apce_t.apce114, #本幣應稅折抵稅額
       apce119 LIKE apce_t.apce119, #本幣沖帳金額
       apce120 LIKE apce_t.apce120, #本位幣二幣別
       apce124 LIKE apce_t.apce124, #本位幣二應稅折抵稅額
       apce121 LIKE apce_t.apce121, #本位幣二匯率
       apce129 LIKE apce_t.apce129, #本位幣二沖帳金額
       apce130 LIKE apce_t.apce130, #本位幣三幣別
       apce131 LIKE apce_t.apce131, #本位幣三匯率
       apce134 LIKE apce_t.apce134, #本位幣三應稅折抵稅額
       apce139 LIKE apce_t.apce139, #本位幣三沖帳金額
       apceud001 LIKE apce_t.apceud001, #自定義欄位(文字)001
       apceud002 LIKE apce_t.apceud002, #自定義欄位(文字)002
       apceud003 LIKE apce_t.apceud003, #自定義欄位(文字)003
       apceud004 LIKE apce_t.apceud004, #自定義欄位(文字)004
       apceud005 LIKE apce_t.apceud005, #自定義欄位(文字)005
       apceud006 LIKE apce_t.apceud006, #自定義欄位(文字)006
       apceud007 LIKE apce_t.apceud007, #自定義欄位(文字)007
       apceud008 LIKE apce_t.apceud008, #自定義欄位(文字)008
       apceud009 LIKE apce_t.apceud009, #自定義欄位(文字)009
       apceud010 LIKE apce_t.apceud010, #自定義欄位(文字)010
       apceud011 LIKE apce_t.apceud011, #自定義欄位(數字)011
       apceud012 LIKE apce_t.apceud012, #自定義欄位(數字)012
       apceud013 LIKE apce_t.apceud013, #自定義欄位(數字)013
       apceud014 LIKE apce_t.apceud014, #自定義欄位(數字)014
       apceud015 LIKE apce_t.apceud015, #自定義欄位(數字)015
       apceud016 LIKE apce_t.apceud016, #自定義欄位(數字)016
       apceud017 LIKE apce_t.apceud017, #自定義欄位(數字)017
       apceud018 LIKE apce_t.apceud018, #自定義欄位(數字)018
       apceud019 LIKE apce_t.apceud019, #自定義欄位(數字)019
       apceud020 LIKE apce_t.apceud020, #自定義欄位(數字)020
       apceud021 LIKE apce_t.apceud021, #自定義欄位(日期時間)021
       apceud022 LIKE apce_t.apceud022, #自定義欄位(日期時間)022
       apceud023 LIKE apce_t.apceud023, #自定義欄位(日期時間)023
       apceud024 LIKE apce_t.apceud024, #自定義欄位(日期時間)024
       apceud025 LIKE apce_t.apceud025, #自定義欄位(日期時間)025
       apceud026 LIKE apce_t.apceud026, #自定義欄位(日期時間)026
       apceud027 LIKE apce_t.apceud027, #自定義欄位(日期時間)027
       apceud028 LIKE apce_t.apceud028, #自定義欄位(日期時間)028
       apceud029 LIKE apce_t.apceud029, #自定義欄位(日期時間)029
       apceud030 LIKE apce_t.apceud030, #自定義欄位(日期時間)030
       apce103 LIKE apce_t.apce103, #原幣未稅沖銷額
       apce113 LIKE apce_t.apce113, #本位未稅沖銷額
       apce123 LIKE apce_t.apce123, #本位幣二未稅沖銷額
       apce133 LIKE apce_t.apce133, #本位幣三未稅沖銷額
       apce061 LIKE apce_t.apce061  #付款對象
END RECORD
DEFINE r_pos1            LIKE type_t.num5
DEFINE r_chr             STRING
DEFINE l_sql             STRING
DEFINE l_sql1            STRING
DEFINE l_sql2            STRING
DEFINE l_sql3            STRING
DEFINE l_sql4            STRING
DEFINE l_sql5            STRING
DEFINE l_apca RECORD  #應付憑單單頭
            apcaent LIKE apca_t.apcaent, #企業編號
            apcaownid LIKE apca_t.apcaownid, #資料所有者
            apcaowndp LIKE apca_t.apcaowndp, #資料所有部門
            apcacrtid LIKE apca_t.apcacrtid, #資料建立者
            apcacrtdp LIKE apca_t.apcacrtdp, #資料建立部門
            apcacrtdt LIKE apca_t.apcacrtdt, #資料創建日
            apcamodid LIKE apca_t.apcamodid, #資料修改者
            apcamoddt LIKE apca_t.apcamoddt, #最近修改日
            apcacnfid LIKE apca_t.apcacnfid, #資料確認者
            apcacnfdt LIKE apca_t.apcacnfdt, #資料確認日
            apcapstid LIKE apca_t.apcapstid, #資料過帳者
            apcapstdt LIKE apca_t.apcapstdt, #資料過帳日
            apcastus LIKE apca_t.apcastus, #狀態碼
            apcald LIKE apca_t.apcald, #帳套
            apcacomp LIKE apca_t.apcacomp, #法人
            apcadocno LIKE apca_t.apcadocno, #應付帳款單號碼
            apcadocdt LIKE apca_t.apcadocdt, #帳款日期
            apcasite LIKE apca_t.apcasite, #帳務中心
            apca001 LIKE apca_t.apca001, #帳款單性質
            apca003 LIKE apca_t.apca003, #帳務人員
            apca004 LIKE apca_t.apca004, #帳款對象編號
            apca005 LIKE apca_t.apca005, #付款對象
            apca006 LIKE apca_t.apca006, #供應商分類
            apca007 LIKE apca_t.apca007, #帳款類別
            apca008 LIKE apca_t.apca008, #付款條件編號
            apca009 LIKE apca_t.apca009, #應付款日/應扣抵日
            apca010 LIKE apca_t.apca010, #容許票據到期日
            apca011 LIKE apca_t.apca011, #稅別
            apca012 LIKE apca_t.apca012, #稅率
            apca013 LIKE apca_t.apca013, #含稅否
            apca014 LIKE apca_t.apca014, #人員編號
            apca015 LIKE apca_t.apca015, #部門編號
            apca016 LIKE apca_t.apca016, #來源作業類型
            apca017 LIKE apca_t.apca017, #產生方式
            apca018 LIKE apca_t.apca018, #來源參考單號
            apca019 LIKE apca_t.apca019, #系統產生對應單號(待抵帳款-預付)
            apca020 LIKE apca_t.apca020, #信用狀付款否
            apca021 LIKE apca_t.apca021, #商業發票號碼(IV no.)
            apca022 LIKE apca_t.apca022, #進口報單號碼
            apca025 LIKE apca_t.apca025, #差異處理(發票與帳款差異)
            apca026 LIKE apca_t.apca026, #原幣未稅差異
            apca027 LIKE apca_t.apca027, #原幣稅額差異
            apca028 LIKE apca_t.apca028, #本幣未稅差異
            apca029 LIKE apca_t.apca029, #本幣幣稅額差異
            apca030 LIKE apca_t.apca030, #差異科目
            apca031 LIKE apca_t.apca031, #產生之差異折讓單號
            apca032 LIKE apca_t.apca032, #發票類型
            apca033 LIKE apca_t.apca033, #專案編號
            apca034 LIKE apca_t.apca034, #責任中心
            apca035 LIKE apca_t.apca035, #應付(貸方)科目編號
            apca036 LIKE apca_t.apca036, #費用(借方)科目編號
            apca037 LIKE apca_t.apca037, #產生傳票否
            apca038 LIKE apca_t.apca038, #拋轉傳票號碼
            apca039 LIKE apca_t.apca039, #會計檢核附件份數
            apca040 LIKE apca_t.apca040, #留置否
            apca041 LIKE apca_t.apca041, #留置理由碼
            apca042 LIKE apca_t.apca042, #留置設定日期
            apca043 LIKE apca_t.apca043, #留置解除日期
            apca044 LIKE apca_t.apca044, #留置原幣金額
            apca045 LIKE apca_t.apca045, #留置說明
            apca046 LIKE apca_t.apca046, #關係人否
            apca047 LIKE apca_t.apca047, #多角序號
            apca048 LIKE apca_t.apca048, #集團代付/代付單號
            apca049 LIKE apca_t.apca049, #來源營運中心編號
            apca050 LIKE apca_t.apca050, #交易原始單據份數
            apca051 LIKE apca_t.apca051, #作廢理由碼
            apca052 LIKE apca_t.apca052, #列印次數
            apca053 LIKE apca_t.apca053, #備註
            apca054 LIKE apca_t.apca054, #多帳期設定
            apca055 LIKE apca_t.apca055, #繳款優惠條件
            apca056 LIKE apca_t.apca056, #會計檢核附件狀態
            apca057 LIKE apca_t.apca057, #交易對象識別碼
            apca058 LIKE apca_t.apca058, #稅別交易類型
            apca059 LIKE apca_t.apca059, #預算編號
            apca060 LIKE apca_t.apca060, #發票開立方式
            apca061 LIKE apca_t.apca061, #預開發票基準日
            apca062 LIKE apca_t.apca062, #多角性質
            apca063 LIKE apca_t.apca063, #整帳批序號
            apca064 LIKE apca_t.apca064, #訂金序次
            apca065 LIKE apca_t.apca065, #發票編號
            apca066 LIKE apca_t.apca066, #發票號碼
            apca100 LIKE apca_t.apca100, #交易原幣別
            apca101 LIKE apca_t.apca101, #原幣匯率
            apca103 LIKE apca_t.apca103, #原幣未稅金額
            apca104 LIKE apca_t.apca104, #原幣稅額
            apca106 LIKE apca_t.apca106, #原幣應稅折抵合計金額
            apca107 LIKE apca_t.apca107, #原幣直接沖帳(調整)合計金額
            apca108 LIKE apca_t.apca108, #原幣應付金額
            apca113 LIKE apca_t.apca113, #本幣未稅金額
            apca114 LIKE apca_t.apca114, #本幣稅額
            apca116 LIKE apca_t.apca116, #本幣應稅折抵合計金額
            apca117 LIKE apca_t.apca117, #NO USE
            apca118 LIKE apca_t.apca118, #本幣應付金額
            apca120 LIKE apca_t.apca120, #本位幣二幣別
            apca121 LIKE apca_t.apca121, #本位幣二匯率
            apca123 LIKE apca_t.apca123, #本位幣二未稅金額
            apca124 LIKE apca_t.apca124, #本位幣二稅額
            apca126 LIKE apca_t.apca126, #本位幣二應稅折抵合計金額
            apca127 LIKE apca_t.apca127, #NO USE
            apca128 LIKE apca_t.apca128, #本位幣二應付金額
            apca130 LIKE apca_t.apca130, #本位幣三幣別
            apca131 LIKE apca_t.apca131, #本位幣三匯率
            apca133 LIKE apca_t.apca133, #本位幣三未稅金額
            apca134 LIKE apca_t.apca134, #本位幣三稅額
            apca136 LIKE apca_t.apca136, #本位幣三應稅折抵合計金額
            apca137 LIKE apca_t.apca137, #NO USE
            apca138 LIKE apca_t.apca138, #本位幣三應付金額
            apcaud001 LIKE apca_t.apcaud001, #自定義欄位(文字)001
            apcaud002 LIKE apca_t.apcaud002, #自定義欄位(文字)002
            apcaud003 LIKE apca_t.apcaud003, #自定義欄位(文字)003
            apcaud004 LIKE apca_t.apcaud004, #自定義欄位(文字)004
            apcaud005 LIKE apca_t.apcaud005, #自定義欄位(文字)005
            apcaud006 LIKE apca_t.apcaud006, #自定義欄位(文字)006
            apcaud007 LIKE apca_t.apcaud007, #自定義欄位(文字)007
            apcaud008 LIKE apca_t.apcaud008, #自定義欄位(文字)008
            apcaud009 LIKE apca_t.apcaud009, #自定義欄位(文字)009
            apcaud010 LIKE apca_t.apcaud010, #自定義欄位(文字)010
            apcaud011 LIKE apca_t.apcaud011, #自定義欄位(數字)011
            apcaud012 LIKE apca_t.apcaud012, #自定義欄位(數字)012
            apcaud013 LIKE apca_t.apcaud013, #自定義欄位(數字)013
            apcaud014 LIKE apca_t.apcaud014, #自定義欄位(數字)014
            apcaud015 LIKE apca_t.apcaud015, #自定義欄位(數字)015
            apcaud016 LIKE apca_t.apcaud016, #自定義欄位(數字)016
            apcaud017 LIKE apca_t.apcaud017, #自定義欄位(數字)017
            apcaud018 LIKE apca_t.apcaud018, #自定義欄位(數字)018
            apcaud019 LIKE apca_t.apcaud019, #自定義欄位(數字)019
            apcaud020 LIKE apca_t.apcaud020, #自定義欄位(數字)020
            apcaud021 LIKE apca_t.apcaud021, #自定義欄位(日期時間)021
            apcaud022 LIKE apca_t.apcaud022, #自定義欄位(日期時間)022
            apcaud023 LIKE apca_t.apcaud023, #自定義欄位(日期時間)023
            apcaud024 LIKE apca_t.apcaud024, #自定義欄位(日期時間)024
            apcaud025 LIKE apca_t.apcaud025, #自定義欄位(日期時間)025
            apcaud026 LIKE apca_t.apcaud026, #自定義欄位(日期時間)026
            apcaud027 LIKE apca_t.apcaud027, #自定義欄位(日期時間)027
            apcaud028 LIKE apca_t.apcaud028, #自定義欄位(日期時間)028
            apcaud029 LIKE apca_t.apcaud029, #自定義欄位(日期時間)029
            apcaud030 LIKE apca_t.apcaud030, #自定義欄位(日期時間)030
            apca067 LIKE apca_t.apca067, #管理品類
            apca068 LIKE apca_t.apca068, #經營方式
            apca069 LIKE apca_t.apca069, #no use
            apca070 LIKE apca_t.apca070, #no use
            apca071 LIKE apca_t.apca071, #no use
            apca072 LIKE apca_t.apca072, #no use
            apca073 LIKE apca_t.apca073 #L/C No.
              END RECORD
DEFINE l_apcf     RECORD
                  apcfseq  LIKE apcf_t.apcfseq,
                  apcforga LIKE apcf_t.apcforga,
                  apcf021  LIKE apcf_t.apcf021,
                  apcf026  LIKE apcf_t.apcf026,
                  apcf027  LIKE apcf_t.apcf027,
                  apcf028  LIKE apcf_t.apcf028,
                  apcf031  LIKE apcf_t.apcf031,
                  apcf032  LIKE apcf_t.apcf032,
                  apcf033  LIKE apcf_t.apcf033,
                  apcf034  LIKE apcf_t.apcf034,
                  apcf035  LIKE apcf_t.apcf035,
                  apcf036  LIKE apcf_t.apcf036,
                  apcf037  LIKE apcf_t.apcf037,
                  apcf038  LIKE apcf_t.apcf038,
                  apcf039  LIKE apcf_t.apcf039,
                  apcf040  LIKE apcf_t.apcf040,
                  apcf041  LIKE apcf_t.apcf041,
                  apcf042  LIKE apcf_t.apcf042,
                  apcf043  LIKE apcf_t.apcf043,
                  apcf044  LIKE apcf_t.apcf044,
                  apcf045  LIKE apcf_t.apcf045,
                  apcf046  LIKE apcf_t.apcf046,
                  apcf047  LIKE apcf_t.apcf047,
                  apcf048  LIKE apcf_t.apcf048,
                  apcf049  LIKE apcf_t.apcf049,
                  apcf103  LIKE apcf_t.apcf103,
                  apcf113  LIKE apcf_t.apcf113,
                  apcf123  LIKE apcf_t.apcf123,
                  apcf133  LIKE apcf_t.apcf133
                  END RECORD
DEFINE l_sumapce  RECORD
                  apce109    LIKE apce_t.apce109,   
                  apce119    LIKE apce_t.apce119,
                  apce129    LIKE apce_t.apce129,
                  apce139    LIKE apce_t.apce139
              END RECORD  
DEFINE l_apcc  RECORD  #應付多帳期檔
       apccent   LIKE apcc_t.apccent, #企業編號
       apccld    LIKE apcc_t.apccld, #帳套
       apcccomp  LIKE apcc_t.apcccomp, #法人
       apcclegl  LIKE apcc_t.apcclegl, #核算組織
       apccsite  LIKE apcc_t.apccsite, #帳務中心
       apccdocno LIKE apcc_t.apccdocno, #應付帳款單號碼
       apccseq   LIKE apcc_t.apccseq, #項次
       apcc001   LIKE apcc_t.apcc001, #分期帳款序
       apcc002   LIKE apcc_t.apcc002, #應付款別性質
       apcc003   LIKE apcc_t.apcc003, #應付款日
       apcc004   LIKE apcc_t.apcc004, #容許票據到期日
       apcc005   LIKE apcc_t.apcc005, #帳款起算日
       apcc006   LIKE apcc_t.apcc006, #正負值
       apcc007   LIKE apcc_t.apcc007, #原幣已請款金額
       apcc008   LIKE apcc_t.apcc008, #發票編號
       apcc009   LIKE apcc_t.apcc009, #發票號碼
       apcc010   LIKE apcc_t.apcc010, #發票日期
       apcc011   LIKE apcc_t.apcc011, #交易單據日期
       apcc012   LIKE apcc_t.apcc012, #立帳日期
       apcc013   LIKE apcc_t.apcc013, #交易認定日期
       apcc014   LIKE apcc_t.apcc014, #出入庫扣帳日期
       apcc100   LIKE apcc_t.apcc100, #交易原幣別
       apcc101   LIKE apcc_t.apcc101, #原幣匯率
       apcc102   LIKE apcc_t.apcc102, #原幣重估後匯率
       apcc103   LIKE apcc_t.apcc103, #NO USE
       apcc104   LIKE apcc_t.apcc104, #NO USE
       apcc105   LIKE apcc_t.apcc105, #NO USE
       apcc106   LIKE apcc_t.apcc106, #NO USE
       apcc107   LIKE apcc_t.apcc107, #NO USE
       apcc108   LIKE apcc_t.apcc108, #原幣應付金額
       apcc109   LIKE apcc_t.apcc109, #原幣付款沖帳金額
       apcc113   LIKE apcc_t.apcc113, #重評價調整數
       apcc114   LIKE apcc_t.apcc114, #NO USE
       apcc115   LIKE apcc_t.apcc115, #NO USE
       apcc116   LIKE apcc_t.apcc116, #NO USE
       apcc117   LIKE apcc_t.apcc117, #NO USE
       apcc118   LIKE apcc_t.apcc118, #本幣應付金額
       apcc119   LIKE apcc_t.apcc119, #本幣付款沖帳金額
       apcc120   LIKE apcc_t.apcc120, #本位幣二幣別
       apcc121   LIKE apcc_t.apcc121, #本位幣二匯率
       apcc122   LIKE apcc_t.apcc122, #本位幣二重估後匯率
       apcc123   LIKE apcc_t.apcc123, #重評價調整數
       apcc124   LIKE apcc_t.apcc124, #NO USE
       apcc125   LIKE apcc_t.apcc125, #NO USE
       apcc126   LIKE apcc_t.apcc126, #NO USE
       apcc127   LIKE apcc_t.apcc127, #NO USE
       apcc128   LIKE apcc_t.apcc128, #本位幣二應付金額
       apcc129   LIKE apcc_t.apcc129, #本位幣二付款沖帳金額
       apcc130   LIKE apcc_t.apcc130, #本位幣三幣別
       apcc131   LIKE apcc_t.apcc131, #本位幣三匯率
       apcc132   LIKE apcc_t.apcc132, #本位幣三重估後匯率
       apcc133   LIKE apcc_t.apcc133, #重評價調整數
       apcc134   LIKE apcc_t.apcc134, #NO USE
       apcc135   LIKE apcc_t.apcc135, #NO USE
       apcc136   LIKE apcc_t.apcc136, #NO USE
       apcc137   LIKE apcc_t.apcc137, #NO USE
       apcc138   LIKE apcc_t.apcc138, #本位幣三應付金額
       apcc139   LIKE apcc_t.apcc139, #本位幣三付款沖帳金額
       apccud001 LIKE apcc_t.apccud001, #自定義欄位(文字)001
       apccud002 LIKE apcc_t.apccud002, #自定義欄位(文字)002
       apccud003 LIKE apcc_t.apccud003, #自定義欄位(文字)003
       apccud004 LIKE apcc_t.apccud004, #自定義欄位(文字)004
       apccud005 LIKE apcc_t.apccud005, #自定義欄位(文字)005
       apccud006 LIKE apcc_t.apccud006, #自定義欄位(文字)006
       apccud007 LIKE apcc_t.apccud007, #自定義欄位(文字)007
       apccud008 LIKE apcc_t.apccud008, #自定義欄位(文字)008
       apccud009 LIKE apcc_t.apccud009, #自定義欄位(文字)009
       apccud010 LIKE apcc_t.apccud010, #自定義欄位(文字)010
       apccud011 LIKE apcc_t.apccud011, #自定義欄位(數字)011
       apccud012 LIKE apcc_t.apccud012, #自定義欄位(數字)012
       apccud013 LIKE apcc_t.apccud013, #自定義欄位(數字)013
       apccud014 LIKE apcc_t.apccud014, #自定義欄位(數字)014
       apccud015 LIKE apcc_t.apccud015, #自定義欄位(數字)015
       apccud016 LIKE apcc_t.apccud016, #自定義欄位(數字)016
       apccud017 LIKE apcc_t.apccud017, #自定義欄位(數字)017
       apccud018 LIKE apcc_t.apccud018, #自定義欄位(數字)018
       apccud019 LIKE apcc_t.apccud019, #自定義欄位(數字)019
       apccud020 LIKE apcc_t.apccud020, #自定義欄位(數字)020
       apccud021 LIKE apcc_t.apccud021, #自定義欄位(日期時間)021
       apccud022 LIKE apcc_t.apccud022, #自定義欄位(日期時間)022
       apccud023 LIKE apcc_t.apccud023, #自定義欄位(日期時間)023
       apccud024 LIKE apcc_t.apccud024, #自定義欄位(日期時間)024
       apccud025 LIKE apcc_t.apccud025, #自定義欄位(日期時間)025
       apccud026 LIKE apcc_t.apccud026, #自定義欄位(日期時間)026
       apccud027 LIKE apcc_t.apccud027, #自定義欄位(日期時間)027
       apccud028 LIKE apcc_t.apccud028, #自定義欄位(日期時間)028
       apccud029 LIKE apcc_t.apccud029, #自定義欄位(日期時間)029
       apccud030 LIKE apcc_t.apccud030, #自定義欄位(日期時間)030
       apcc015   LIKE apcc_t.apcc015, #付款條件
       apcc016   LIKE apcc_t.apcc016, #帳款類型
       apcc017   LIKE apcc_t.apcc017  #採購單號
           END RECORD
DEFINE l_apcb    RECORD     #應付憑單單身
                 apcblegl   LIKE apcb_t.apcblegl,
                 apcborga   LIKE apcb_t.apcborga,
                 apcb028    LIKE apcb_t.apcb028,
                 apcb102    LIKE apcb_t.apcb102,
                 apcb103    LIKE apcb_t.apcb103,
                 apcb113    LIKE apcb_t.apcb113,
                 apcb121    LIKE apcb_t.apcb121,
                 apcb123    LIKE apcb_t.apcb123,
                 apcb131    LIKE apcb_t.apcb131,
                 apcb133    LIKE apcb_t.apcb133,
                 apcb021    LIKE apcb_t.apcb021      #170419-00029#1 add lujh
                 
END RECORD      
DEFINE l_apcc108  LIKE apcc_t.apcc108
DEFINE l_apcc118  LIKE apcc_t.apcc118
DEFINE l_apcc128  LIKE apcc_t.apcc128
DEFINE l_apcc138  LIKE apcc_t.apcc138
DEFINE l_type     LIKE type_t.chr1
DEFINE l_apcbseq        LIKE apcb_t.apcbseq
DEFINE r_success        LIKE type_t.num5
DEFINE l_wc             STRING
DEFINE l_wc1            STRING


   LET r_success = TRUE
   CALL s_aap_get_acc_str("8502"," gzcb006 = 'Y' ") RETURNING g_scc8502
   CALL s_fin_get_wc_str(g_scc8502) RETURNING g_scc8502 
   CALL cl_get_para(g_enterprise,p_apdacomp,'S-FIN-2002') RETURNING l_sfin2002
   CALL s_chr_get_index_of(p_wc," apca001 = '05' AND",1) RETURNING r_pos1 
   IF r_pos1 > 0 THEN
      CALL s_chr_replace(p_wc," apca001 = '05' AND",'',0) RETURNING r_chr
      INITIALIZE l_apca.* TO NULL
      CALL s_chr_replace(r_chr,'apcadocno','apcfdocno',0) RETURNING r_chr
      CALL s_chr_replace(r_chr,'apce004','apcfseq',0) RETURNING r_chr
      LET l_sql = "SELECT apca001,apca004,apca100,apca101,apca120,",
                  "       apca121,apca130,apca131,apcadocno,apcfseq",
                  "  FROM apca_t ",
                  "  LEFT JOIN apcf_t on apcfent = apcaent and apcfld = apcald and apcfdocno= apcadocno",
                  " WHERE apcaent = ",g_enterprise,
                  "   AND apcald  = '",p_ld,"' ",
                  "   AND apca001 IN ",g_scc8502," ",
                  "   AND apcastus = 'Y' ",           #170326-00008#1 add
                  "   AND " ,r_chr CLIPPED
      PREPARE s_aapt430_sel_apca_p1 FROM l_sql
      DECLARE s_aapt430_sel_apca_c1 CURSOR FOR s_aapt430_sel_apca_p1
      FOREACH s_aapt430_sel_apca_c1 INTO l_apca.apca001,l_apca.apca004,l_apca.apca100,l_apca.apca101,l_apca.apca120,
                                         l_apca.apca121,l_apca.apca130,l_apca.apca131,l_apca.apcadocno,l_apcf.apcfseq
         IF SQLCA.SQLCODE THEN
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         SELECT apcforga,apcf021,apcf026,
                apcf027,apcf028,apcf031,apcf032,apcf033,
                apcf034,apcf035,apcf036,apcf037,apcf038,
                apcf039,apcf040,apcf041,apcf042,apcf043,
                apcf044,apcf045,apcf046,apcf047,apcf048,
                apcf049,apcf103,apcf113,apcf123,apcf133 
           INTO l_apcf.apcforga,l_apcf.apcf021,l_apcf.apcf026,
                l_apcf.apcf027,l_apcf.apcf028,l_apcf.apcf031,l_apcf.apcf032,l_apcf.apcf033,
                l_apcf.apcf034,l_apcf.apcf035,l_apcf.apcf036,l_apcf.apcf037,l_apcf.apcf038,
                l_apcf.apcf039,l_apcf.apcf040,l_apcf.apcf041,l_apcf.apcf042,l_apcf.apcf043,
                l_apcf.apcf044,l_apcf.apcf045,l_apcf.apcf046,l_apcf.apcf047,l_apcf.apcf048,
                l_apcf.apcf049,l_apcf.apcf103,l_apcf.apcf113,l_apcf.apcf123,l_apcf.apcf133
         FROM apcf_t
         LEFT JOIN  apca_t ON apcfent = apcaent AND apcfld = apcald AND apcfdocno = apcadocno
        WHERE apcfent = g_enterprise
          AND apcfld  =  p_ld 
          AND apcf008 = 'DIFF'
          AND apcfdocno = l_apca.apcadocno
          AND apcfseq = l_apcf.apcfseq
            IF l_apcf.apcf103 <> l_apcf.apcf113 THEN
               LET l_apce.apce100 = l_apca.apca100
               LET l_apce.apce101 = l_apca.apca101  #匯率
            ELSE
               LET l_apce.apce100 = l_apca.apca100
               LET l_apce.apce101 = l_apca.apca101  #匯率
            END IF
            IF l_apca.apca001[1,1] = '2' THEN
               LET l_apcf.apcf103 = l_apcf.apcf103 * -1
               LET l_apcf.apcf113 = l_apcf.apcf113 * -1
               LET l_apcf.apcf123 = l_apcf.apcf123 * -1
               LET l_apcf.apcf133 = l_apcf.apcf133 * -1
            END IF
            LET l_apce.apce104 = 0               #原幣應稅折抵稅額
            LET l_apce.apce114 = 0               #本幣應稅折抵稅額
            LET l_apce.apce120 = l_apca.apca120  #本位幣二幣別
            LET l_apce.apce121 = l_apca.apca121  #本位幣二匯率
            LET l_apce.apce124 = 0               #本位幣二應稅折抵稅額
            LET l_apce.apce130 = l_apca.apca130  #本位幣三幣別
            LET l_apce.apce131 = l_apca.apca131  #本位幣三匯率
            LET l_apce.apce134 = 0               #本位幣三應稅折抵稅額   
            SELECT SUM(apce109),SUM(apce119),SUM(apce129),SUM(apce139)  
             INTO l_sumapce.apce109,l_sumapce.apce119,l_sumapce.apce129,l_sumapce.apce139
              FROM apce_t
             LEFT JOIN apda_t ON apceent = apdaent AND apceld = apdald AND apcedocno = apdadocno
             LEFT JOIN apca_t ON apcaent = apdaent AND apcald = apdald
             WHERE apceent = apdaent AND apceld = apdald AND apcedocno = apdadocno
               AND apdaent = g_enterprise
               AND apda001 = '43'
               AND apdastus <> 'X'
               AND apdald  =  p_ld
               AND apce003 = l_apca.apcadocno
               AND apce004 = l_apcf.apcfseq
            IF cl_null(l_sumapce.apce109)THEN LET l_sumapce.apce109 = 0 END IF
            IF cl_null(l_sumapce.apce119)THEN LET l_sumapce.apce119 = 0 END IF
            IF cl_null(l_sumapce.apce129)THEN LET l_sumapce.apce129 = 0 END IF
            IF cl_null(l_sumapce.apce139)THEN LET l_sumapce.apce139 = 0 END IF
            
            #原幣apce109 = apcc108-apcc109
            LET l_apce.apce109 = l_apcf.apcf103 - l_sumapce.apce109
            LET l_apce.apce119 = l_apcf.apcf113 - l_sumapce.apce119
            LET l_apce.apce129 = l_apcf.apcf123 - l_sumapce.apce129
            LET l_apce.apce139 = l_apcf.apcf133 - l_sumapce.apce139
            
            #項次
            SELECT MAX(apceseq)+1 INTO l_apce.apceseq FROM apce_t
             WHERE apceent = g_enterprise AND apcedocno = p_apdadocno
            IF cl_null(l_apce.apceseq) OR l_apce.apceseq = 0 THEN LET l_apce.apceseq = 1 END IF
            LET l_apce.apce003      = l_apca.apcadocno
            LET l_apce.apcelegl     = l_apcf.apcforga
            LET l_apce.apceorga     = l_apcf.apcforga
            IF  l_apce.apce119 < 0 THEN
               LET l_apce.apce015 = 'D'
            ELSE
               LET l_apce.apce015 = 'C'
            END IF
            LET l_apce.apce016    = l_apcf.apcf021
            LET l_apce.apce017    = l_apcf.apcf033
            LET l_apce.apce018    = l_apcf.apcf026
            LET l_apce.apce019    = l_apcf.apcf027
            LET l_apce.apce020    = l_apcf.apcf032
            LET l_apce.apce022    = l_apcf.apcf034
            LET l_apce.apce023    = l_apcf.apcf035
            LET l_apce.apce028    = 0  #產生方式
            LET l_apce.apce035    = l_apcf.apcf028
            LET l_apce.apce036    = l_apcf.apcf031
            LET l_apce.apce044    = l_apcf.apcf036
            LET l_apce.apce045    = l_apcf.apcf037
            LET l_apce.apce046    = l_apcf.apcf038
            LET l_apce.apce048    = ' '              #發票號碼
            LET l_apce.apce051    = l_apcf.apcf039   #自由核算項一
            LET l_apce.apce052    = l_apcf.apcf040
            LET l_apce.apce053    = l_apcf.apcf041
            LET l_apce.apce054    = l_apcf.apcf042
            LET l_apce.apce055    = l_apcf.apcf043
            LET l_apce.apce056    = l_apcf.apcf044   #自由核算項六
            LET l_apce.apce057    = l_apcf.apcf045
            LET l_apce.apce058    = l_apcf.apcf046
            LET l_apce.apce059    = l_apcf.apcf047
            LET l_apce.apce060    = l_apcf.apcf048
            #摘要說明
            LET l_apce.apce010    = l_apcf.apcf049
            #帳款對象
            LET l_apce.apce038    = l_apca.apca004
            IF NOT cl_null(p_wc1) THEN
               LET l_apce.apce002 = p_wc1
            ELSE
               LET l_apce.apce002 = l_apca.apca001
            END IF
            INSERT INTO apce_t (apceent,apcecomp,apcelegl,apcesite,apceld,
                                apceorga,apcedocno,apceseq,apce001,apce002,
                                apce003,apce004,apce005,apce006,apce007,
                                apce008,apce009,apce010,apce011,apce012,
                                apce013,apce014,apce015,apce016,apce017,
                                apce018,apce019,apce020,apce021,apce022,
                                apce023,apce024,apce025,apce026,apce027,
                                apce028,apce029,apce030,apce031,apce032,
                                apce033,apce034,apce035,apce036,apce037,
                                apce038,apce039,apce040,apce041,apce042,
                                apce043,apce044,apce045,apce046,apce047,
                                apce048,apce049,apce050,apce051,apce052,
                                apce053,apce054,apce055,apce056,apce057,
                                apce058,apce059,apce060,apce100,apce101,
                                apce104,apce109,apce114,apce119,apce120,
                                apce124,apce121,apce129,apce130,apce131,
                                apce134,apce139,apceud001,apceud002,apceud003,
                                apceud004,apceud005,apceud006,apceud007,apceud008,
                                apceud009,apceud010,apceud011,apceud012,apceud013,
                                apceud014,apceud015,apceud016,apceud017,apceud018,
                                apceud019,apceud020,apceud021,apceud022,apceud023,
                                apceud024,apceud025,apceud026,apceud027,apceud028,
                                apceud029,apceud030,apce103,apce113,apce123,
                                apce133,apce061)
                VALUES(g_enterprise,p_apdacomp,l_apce.apcelegl,p_apdasite,p_ld,
                       l_apce.apceorga,p_apdadocno,l_apce.apceseq,p_prog,l_apce.apce002,
                       l_apce.apce003,l_apce.apce004,l_apce.apce005,l_apce.apce006,l_apce.apce007,
                       l_apce.apce008,l_apce.apce009,l_apce.apce010,l_apce.apce011,l_apce.apce012,
                       l_apce.apce013,l_apce.apce014,l_apce.apce015,l_apce.apce016,l_apce.apce017,
                       l_apce.apce018,l_apce.apce019,l_apce.apce020,l_apce.apce021,l_apce.apce022,
                       l_apce.apce023,l_apce.apce024,l_apce.apce025,l_apce.apce026,l_apce.apce027,
                       l_apce.apce028,l_apce.apce029,l_apce.apce030,l_apce.apce031,l_apce.apce032,
                       l_apce.apce033,l_apce.apce034,l_apce.apce035,l_apce.apce036,l_apce.apce037,
                       l_apce.apce038,l_apce.apce039,l_apce.apce040,l_apce.apce041,l_apce.apce042,
                       l_apce.apce043,l_apce.apce044,l_apce.apce045,l_apce.apce046,l_apce.apce047,
                       l_apce.apce048,l_apce.apce049,l_apce.apce050,l_apce.apce051,l_apce.apce052,
                       l_apce.apce053,l_apce.apce054,l_apce.apce055,l_apce.apce056,l_apce.apce057,
                       l_apce.apce058,l_apce.apce059,l_apce.apce060,l_apce.apce100,l_apce.apce101,
                       l_apce.apce104,l_apce.apce109,l_apce.apce114,l_apce.apce119,l_apce.apce120,
                       l_apce.apce124,l_apce.apce121,l_apce.apce129,l_apce.apce130,l_apce.apce131,
                       l_apce.apce134,l_apce.apce139,l_apce.apceud001,l_apce.apceud002,l_apce.apceud003,
                       l_apce.apceud004,l_apce.apceud005,l_apce.apceud006,l_apce.apceud007,l_apce.apceud008,
                       l_apce.apceud009,l_apce.apceud010,l_apce.apceud011,l_apce.apceud012,l_apce.apceud013,
                       l_apce.apceud014,l_apce.apceud015,l_apce.apceud016,l_apce.apceud017,l_apce.apceud018,
                       l_apce.apceud019,l_apce.apceud020,l_apce.apceud021,l_apce.apceud022,l_apce.apceud023,
                       l_apce.apceud024,l_apce.apceud025,l_apce.apceud026,l_apce.apceud027,l_apce.apceud028,
                       l_apce.apceud029,l_apce.apceud030,l_apce.apce103,l_apce.apce113,l_apce.apce123,
                       l_apce.apce133,l_apce.apce061)
               IF SQLCA.SQLcode OR SQLCA.SQLERRD[3]=0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "ins apdc_t"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET r_success = FALSE
               END IF
      END FOREACH
   ELSE
      CALL s_chr_replace(p_wc,'apce004','apcbseq',0) RETURNING p_wc
      LET l_sql3 =  "SELECT apcaent,apcaownid,apcaowndp,apcacrtid,apcacrtdp,  ",
                    "       apcacrtdt,apcamodid,apcamoddt,apcacnfid,apcacnfdt,",
                    "       apcapstid,apcapstdt,apcastus,apcald,apcacomp,     ",
                    "       apcadocno,apcadocdt,apcasite,apca001,apca003,     ",
                    "       apca004,apca005,apca006,apca007,apca008,          ",
                    "       apca009,apca010,apca011,apca012,apca013,          ",
                    "       apca014,apca015,apca016,apca017,apca018,          ",
                    "       apca019,apca020,apca021,apca022,apca025,          ",
                    "       apca026,apca027,apca028,apca029,apca030,          ",
                    "       apca031,apca032,apca033,apca034,apca035,          ",
                    "       apca036,apca037,apca038,apca039,apca040,          ",
                    "       apca041,apca042,apca043,apca044,apca045,          ",
                    "       apca046,apca047,apca048,apca049,apca050,          ",
                    "       apca051,apca052,apca053,apca054,apca055,          ",
                    "       apca056,apca057,apca058,apca059,apca060,          ",
                    "       apca061,apca062,apca063,apca064,apca065,          ",
                    "       apca066,apca100,apca101,apca103,apca104,          ",
                    "       apca106,apca107,apca108,apca113,apca114,          ",
                    "       apca116,apca117,apca118,apca120,apca121,          ",
                    "       apca123,apca124,apca126,apca127,apca128,          ",
                    "       apca130,apca131,apca133,apca134,apca136,          ",
                    "       apca137,apca138,apcaud001,apcaud002,apcaud003,    ",
                    "       apcaud004,apcaud005,apcaud006,apcaud007,apcaud008,",
                    "       apcaud009,apcaud010,apcaud011,apcaud012,apcaud013,",
                    "       apcaud014,apcaud015,apcaud016,apcaud017,apcaud018,",
                    "       apcaud019,apcaud020,apcaud021,apcaud022,apcaud023,",
                    "       apcaud024,apcaud025,apcaud026,apcaud027,apcaud028,",
                    "       apcaud029,apcaud030,apca067,apca068,apca069,      ",
                    "       apca070,apca071,apca072,apca073,apcbseq           ",
                    "  FROM apca_t                                            ",
                    "  LEFT JOIN apcb_t ON apcbent = apcaent AND apcbld = apcald AND apcbdocno = apcadocno",
                    " WHERE apcaent = ",g_enterprise,
                    "   AND apcald  = '",p_ld,"' ",
                    "   AND apca001 IN ",g_scc8502," ",
                    "   AND apcastus = 'Y' ",           #170326-00008#1 add
                    "   AND " ,p_wc CLIPPED
              PREPARE s_aapt430_sel_apca_p2 FROM l_sql3
              DECLARE s_aapt430_sel_apca_c2 CURSOR FOR s_aapt430_sel_apca_p2
              FOREACH s_aapt430_sel_apca_c2 INTO l_apca.apcaent,l_apca.apcaownid,l_apca.apcaowndp,l_apca.apcacrtid,l_apca.apcacrtdp,
                                                 l_apca.apcacrtdt,l_apca.apcamodid,l_apca.apcamoddt,l_apca.apcacnfid,l_apca.apcacnfdt,
                                                 l_apca.apcapstid,l_apca.apcapstdt,l_apca.apcastus,l_apca.apcald,l_apca.apcacomp,
                                                 l_apca.apcadocno,l_apca.apcadocdt,l_apca.apcasite,l_apca.apca001,l_apca.apca003,
                                                 l_apca.apca004,l_apca.apca005,l_apca.apca006,l_apca.apca007,l_apca.apca008,
                                                 l_apca.apca009,l_apca.apca010,l_apca.apca011,l_apca.apca012,l_apca.apca013,
                                                 l_apca.apca014,l_apca.apca015,l_apca.apca016,l_apca.apca017,l_apca.apca018,
                                                 l_apca.apca019,l_apca.apca020,l_apca.apca021,l_apca.apca022,l_apca.apca025,
                                                 l_apca.apca026,l_apca.apca027,l_apca.apca028,l_apca.apca029,l_apca.apca030,
                                                 l_apca.apca031,l_apca.apca032,l_apca.apca033,l_apca.apca034,l_apca.apca035,
                                                 l_apca.apca036,l_apca.apca037,l_apca.apca038,l_apca.apca039,l_apca.apca040,
                                                 l_apca.apca041,l_apca.apca042,l_apca.apca043,l_apca.apca044,l_apca.apca045,
                                                 l_apca.apca046,l_apca.apca047,l_apca.apca048,l_apca.apca049,l_apca.apca050,
                                                 l_apca.apca051,l_apca.apca052,l_apca.apca053,l_apca.apca054,l_apca.apca055,
                                                 l_apca.apca056,l_apca.apca057,l_apca.apca058,l_apca.apca059,l_apca.apca060,
                                                 l_apca.apca061,l_apca.apca062,l_apca.apca063,l_apca.apca064,l_apca.apca065,
                                                 l_apca.apca066,l_apca.apca100,l_apca.apca101,l_apca.apca103,l_apca.apca104,
                                                 l_apca.apca106,l_apca.apca107,l_apca.apca108,l_apca.apca113,l_apca.apca114,
                                                 l_apca.apca116,l_apca.apca117,l_apca.apca118,l_apca.apca120,l_apca.apca121,
                                                 l_apca.apca123,l_apca.apca124,l_apca.apca126,l_apca.apca127,l_apca.apca128,
                                                 l_apca.apca130,l_apca.apca131,l_apca.apca133,l_apca.apca134,l_apca.apca136,
                                                 l_apca.apca137,l_apca.apca138,l_apca.apcaud001,l_apca.apcaud002,l_apca.apcaud003,
                                                 l_apca.apcaud004,l_apca.apcaud005,l_apca.apcaud006,l_apca.apcaud007,l_apca.apcaud008,
                                                 l_apca.apcaud009,l_apca.apcaud010,l_apca.apcaud011,l_apca.apcaud012,l_apca.apcaud013,
                                                 l_apca.apcaud014,l_apca.apcaud015,l_apca.apcaud016,l_apca.apcaud017,l_apca.apcaud018,
                                                 l_apca.apcaud019,l_apca.apcaud020,l_apca.apcaud021,l_apca.apcaud022,l_apca.apcaud023,
                                                 l_apca.apcaud024,l_apca.apcaud025,l_apca.apcaud026,l_apca.apcaud027,l_apca.apcaud028,
                                                 l_apca.apcaud029,l_apca.apcaud030,l_apca.apca067,l_apca.apca068,l_apca.apca069,
                                                 l_apca.apca070,l_apca.apca071,l_apca.apca072,l_apca.apca073,l_apcbseq
               IF SQLCA.SQLCODE THEN
                  LET r_success = FALSE
                  EXIT FOREACH
               END IF               
              SELECT apcblegl,apcborga,apcb028,apcb102,apcb103,
                     apcb113,apcb121,apcb123,apcb131,apcb133,apcb021   #170419-00029#1 add apcb021 lujh
                INTO l_apcb.*
                FROM apcb_t
               WHERE apcbent = g_enterprise
                 AND apcbld = p_ld
                 AND apcbdocno = l_apca.apcadocno
                 AND apcbseq   = l_apcbseq     
              LET l_apce.apcelegl = l_apcb.apcblegl
              LET l_apce.apceorga = l_apcb.apcborga   
              
              LET l_apce.apce003 = l_apca.apcadocno
              LET l_apce.apce004 = l_apcbseq  
              LET l_apce.apce027 = 'N'              
              SELECT MAX(apceseq)+1 INTO l_apce.apceseq FROM apce_t
               WHERE apceent = g_enterprise AND apcedocno = p_apdadocno
              IF cl_null(l_apce.apceseq) OR l_apce.apceseq = 0 THEN LET l_apce.apceseq = 1 END IF
              #抓apca001判斷是C或D
              LET l_apce.apce015= s_fin_get_scc_value('8502',l_apca.apca001,'2')
              #這裡要先借貸反轉
              CASE
                 WHEN l_apce.apce015 = 'D'
                    LET l_apce.apce015 = 'C'
                 WHEN l_apce.apce015 = 'C'
                    LET l_apce.apce015 = 'D'
              END CASE
              #費用科目
              IF cl_null(l_apca.apca036) THEN
                 LET l_sql4 = " SELECT apcb021 FROM apcb_t ",
                             "  WHERE apcbent = ",g_enterprise," AND apcbld  = '",p_ld,"'  ",
                             "    AND apcbdocno = '",l_apca.apcadocno,"' AND apcb021 IS NOT NULL  ",
                             "  ORDER BY apcbseq "
                 PREPARE aapt430_apcb021_p1 FROM l_sql4
                 DECLARE aapt430_apcb021_c1 SCROLL CURSOR FOR aapt430_apcb021_p1
                 OPEN aapt430_apcb021_c1
                 FETCH FIRST aapt430_apcb021_c1 INTO l_apca.apca036
                 CLOSE aapt430_apcb021_c1        
              END IF
              #LET l_apce.apce016      = l_apca.apca036    #170419-00029#1 mark lujh
              LET l_apce.apce016      = l_apcb.apcb021     #170419-00029#1 add lujh
              #產生方式
              LET l_apce.apce028 = 0
              #發票號碼
              LET l_apce.apce048 = ''
              #幣別
              LET l_apce.apce100 = l_apca.apca100
              #匯率
              LET l_apce.apce101 = l_apcb.apcb102
              #原幣金額
              LET l_apce.apce109 = l_apcb.apcb103
              #本幣金額
              LET l_apce.apce119 = l_apcb.apcb113
              #本位幣二幣別
              LET l_apce.apce120 = l_apca.apca120
              #本位幣二匯率
              LET l_apce.apce121 = l_apcb.apcb121
              #本幣二金額
              LET l_apce.apce129 = l_apcb.apcb123
              #本位幣三幣別
              LET l_apce.apce130 = l_apca.apca130
              #本位幣三匯率
              LET l_apce.apce131 = l_apcb.apcb131
              #本幣三金額
              LET l_apce.apce139 = l_apcb.apcb133
              
              #原幣應稅折抵稅額
              LET l_apce.apce104 = 0
              #本幣應稅折抵稅額
              LET l_apce.apce114 = 0
              #本位幣二應稅折抵稅額
              LET l_apce.apce124 = 0
              #本位幣三應稅折抵稅額
              LET l_apce.apce134 = 0
              
              #取得該項次已維護在分攤單身的金額
               SELECT SUM(apce109),SUM(apce119),SUM(apce129),SUM(apce139)                      
                 INTO l_sumapce.apce109,l_sumapce.apce119,l_sumapce.apce129,l_sumapce.apce139    
                 FROM apce_t
                 LEFT JOIN apda_t ON apceent = apdaent AND apceld = apdald AND apcedocno = apdadocno
                WHERE apceent = g_enterprise
                  AND apce003 = l_apca.apcadocno
                  AND apce004 = l_apcbseq
                  AND apdald = p_ld
                  AND apdastus <> 'X'
                  AND apda001 = '43'
                  AND ((apcedocno <> p_apdadocno) OR                                      
                       (apcedocno  = p_apdadocno AND apceseq <> l_apce.apceseq))  
               IF cl_null(l_sumapce.apce109)THEN LET l_sumapce.apce109 = 0 END IF                
               IF cl_null(l_sumapce.apce119)THEN LET l_sumapce.apce119 = 0 END IF
               IF cl_null(l_sumapce.apce129)THEN LET l_sumapce.apce129 = 0 END IF
               IF cl_null(l_sumapce.apce139)THEN LET l_sumapce.apce139 = 0 END IF 
              LET l_apce.apce109 = l_apce.apce109 - l_sumapce.apce109
              LET l_apce.apce119 = l_apce.apce119 - l_sumapce.apce119
              LET l_apce.apce129 = l_apce.apce129 - l_sumapce.apce129
              LET l_apce.apce139 = l_apce.apce139 - l_sumapce.apce139  
              IF cl_null(l_apce.apce109)THEN LET l_apce.apce109 = 0 END IF
              IF cl_null(l_apce.apce119)THEN LET l_apce.apce119 = 0 END IF
              IF cl_null(l_apce.apce129)THEN LET l_apce.apce129 = 0 END IF
              IF cl_null(l_apce.apce139)THEN LET l_apce.apce139 = 0 END IF
              #帳款性質為2*(待抵單),由於確認時會回寫已沖金額,因此需扣除已被沖銷/預沖金額(此處會扣除包含aapt430單身已維護的金額)
              IF l_apca.apca001 MATCHES '2*' THEN
                 #如果沖銷參數是3,則多帳期的項次與單身apcb項次是可以對應的,因此判斷可沖金額的時候,必須考量到項次
                 #如果沖銷參數是1/2,則項次是對應不上的,因此以整張單的角度看可沖金額
                 IF l_sfin2002 = '3' THEN
                    LET l_type = '3'
                 ELSE
                    LET l_type = '2'
                 END IF
                 CALL s_aapt420_apcc_used_num('41',p_ld,p_ld,l_apca.apcadocno,l_apcbseq,'',p_apdadocno,l_apce.apceseq,l_type)   
                  RETURNING g_sub_success,g_errno,l_apcc108,l_apcc118,l_apcc128,l_apcc138 
                 #多帳期剩餘可沖金額與該項次可沖金額相比,取小者為超沖標準       
                 IF l_apcc118 < l_apce.apce119 THEN
                    LET l_apce.apce109 = l_apcc108
                    LET l_apce.apce119 = l_apcc118
                    LET l_apce.apce129 = l_apcc128
                    LET l_apce.apce139 = l_apcc138
                 END IF
              END IF   
              
                   
              
              #抓取來源單據的核算項
              #CALL aapt430_source_account_carry(l_apca.apcadocno,l_apcbseq,p_ld,'1')
              #170420-00051#1 mark ------
              #IF l_sfin2002 = '1' OR l_sfin2002 = '2' THEN
              #   LET l_sql5 = l_sql5,
              #            " SELECT apca014,apca015,apca034,'',apca033, ",
              #            "        '','','','','', ",
              #            "        '','','','','', ",
              #            "        '','','','','', ",
              #            "        '',''"
              #ELSE
              #   LET l_sql5 = l_sql5,
              #170420-00051#1 mark end---
              LET l_sql5 = #170420-00051#1
                          " SELECT apcb051,apcb010,apcb011,apcb012,apcb015, ",
                          "        apcb016,apcb024,apcb036,apcb033,apcb034, ",
                          "        apcb035,apcb037,apcb038,apcb039,apcb040, ",
                          "        apcb041,apcb042,apcb043,apcb044,apcb045, ",
                          "        apcb046,apcb047"
              #END IF #170420-00051#1 mark
              LET l_sql5 = l_sql5,
                          "   FROM apca_t,apcb_t",
                          "  WHERE apcaent = apcbent ", 
                          "    AND apcald = apcbld ",
                          "    AND apcadocno = apcbdocno ",
                          "    AND apcaent = ",g_enterprise,
                          "    AND apcadocno = '",l_apca.apcadocno,"' ",
                          "    AND apcbseq = '",l_apcbseq,"' ",
                          "    AND apcald = '",p_ld,"' "
              PREPARE s_aapt430_source_account_carry_p1 FROM l_sql5
              DECLARE s_aapt430_source_account_carry_c1 CURSOR FOR s_aapt430_source_account_carry_p1
              OPEN s_aapt430_source_account_carry_c1
              FETCH s_aapt430_source_account_carry_c1
               INTO l_apce.apce017,l_apce.apce018,l_apce.apce019,l_apce.apce020,l_apce.apce022, 
                    l_apce.apce023,l_apce.apce035,l_apce.apce036,l_apce.apce044,l_apce.apce045,
                    l_apce.apce046,l_apce.apce051,l_apce.apce052,l_apce.apce053,l_apce.apce054,
                    l_apce.apce055,l_apce.apce056,l_apce.apce057,l_apce.apce058,l_apce.apce059,
                    l_apce.apce060,l_apce.apce010
              #170420-00051#1 mark ------
              ##給值
              #LET l_apce.apce017 = l_apce.apce017
              #LET l_apce.apce018 = l_apce.apce018
              #LET l_apce.apce019 = l_apce.apce019
              #LET l_apce.apce020 = l_apce.apce020
              #LET l_apce.apce022 = l_apce.apce022
              #LET l_apce.apce023 = l_apce.apce023
              #LET l_apce.apce035 = l_apce.apce035
              #LET l_apce.apce036 = l_apce.apce036
              #LET l_apce.apce044 = l_apce.apce044
              #LET l_apce.apce045 = l_apce.apce045
              #LET l_apce.apce046 = l_apce.apce046
              #LET l_apce.apce051 = l_apce.apce051
              #LET l_apce.apce052 = l_apce.apce052
              #LET l_apce.apce053 = l_apce.apce053
              #LET l_apce.apce054 = l_apce.apce054
              #LET l_apce.apce055 = l_apce.apce055
              #LET l_apce.apce056 = l_apce.apce056
              #LET l_apce.apce057 = l_apce.apce057
              #LET l_apce.apce058 = l_apce.apce058
              #LET l_apce.apce059 = l_apce.apce059
              #LET l_apce.apce060 = l_apce.apce060
              ##摘要說明
              #LET l_apce.apce010 = l_apce.apce010
              #170420-00051#1 mark end---
              #帳款對象
              LET l_apce.apce038 = l_apca.apca004
              IF NOT cl_null(p_wc1) THEN
               LET l_apce.apce002 = p_wc1
              ELSE 
                 LET l_apce.apce002 = l_apca.apca001
              END IF
              #LET g_apce_d[l_ac].apca001  = l_apce.apce002
              INSERT INTO apce_t (apceent,apcecomp,apcelegl,apcesite,apceld,
                                  apceorga,apcedocno,apceseq,apce001,apce002,
                                  apce003,apce004,apce005,apce006,apce007,
                                  apce008,apce009,apce010,apce011,apce012,
                                  apce013,apce014,apce015,apce016,apce017,
                                  apce018,apce019,apce020,apce021,apce022,
                                  apce023,apce024,apce025,apce026,apce027,
                                  apce028,apce029,apce030,apce031,apce032,
                                  apce033,apce034,apce035,apce036,apce037,
                                  apce038,apce039,apce040,apce041,apce042,
                                  apce043,apce044,apce045,apce046,apce047,
                                  apce048,apce049,apce050,apce051,apce052,
                                  apce053,apce054,apce055,apce056,apce057,
                                  apce058,apce059,apce060,apce100,apce101,
                                  apce104,apce109,apce114,apce119,apce120,
                                  apce124,apce121,apce129,apce130,apce131,
                                  apce134,apce139,apceud001,apceud002,apceud003,
                                  apceud004,apceud005,apceud006,apceud007,apceud008,
                                  apceud009,apceud010,apceud011,apceud012,apceud013,
                                  apceud014,apceud015,apceud016,apceud017,apceud018,
                                  apceud019,apceud020,apceud021,apceud022,apceud023,
                                  apceud024,apceud025,apceud026,apceud027,apceud028,
                                  apceud029,apceud030,apce103,apce113,apce123,
                                  apce133,apce061)
                VALUES(g_enterprise,p_apdacomp,l_apce.apcelegl,p_apdasite,p_ld,
                       l_apce.apceorga,p_apdadocno,l_apce.apceseq,p_prog,l_apce.apce002,
                       l_apce.apce003,l_apce.apce004,l_apce.apce005,l_apce.apce006,l_apce.apce007,
                       l_apce.apce008,l_apce.apce009,l_apce.apce010,l_apce.apce011,l_apce.apce012,
                       l_apce.apce013,l_apce.apce014,l_apce.apce015,l_apce.apce016,l_apce.apce017,
                       l_apce.apce018,l_apce.apce019,l_apce.apce020,l_apce.apce021,l_apce.apce022,
                       l_apce.apce023,l_apce.apce024,l_apce.apce025,l_apce.apce026,l_apce.apce027,
                       l_apce.apce028,l_apce.apce029,l_apce.apce030,l_apce.apce031,l_apce.apce032,
                       l_apce.apce033,l_apce.apce034,l_apce.apce035,l_apce.apce036,l_apce.apce037,
                       l_apce.apce038,l_apce.apce039,l_apce.apce040,l_apce.apce041,l_apce.apce042,
                       l_apce.apce043,l_apce.apce044,l_apce.apce045,l_apce.apce046,l_apce.apce047,
                       l_apce.apce048,l_apce.apce049,l_apce.apce050,l_apce.apce051,l_apce.apce052,
                       l_apce.apce053,l_apce.apce054,l_apce.apce055,l_apce.apce056,l_apce.apce057,
                       l_apce.apce058,l_apce.apce059,l_apce.apce060,l_apce.apce100,l_apce.apce101,
                       l_apce.apce104,l_apce.apce109,l_apce.apce114,l_apce.apce119,l_apce.apce120,
                       l_apce.apce124,l_apce.apce121,l_apce.apce129,l_apce.apce130,l_apce.apce131,
                       l_apce.apce134,l_apce.apce139,l_apce.apceud001,l_apce.apceud002,l_apce.apceud003,
                       l_apce.apceud004,l_apce.apceud005,l_apce.apceud006,l_apce.apceud007,l_apce.apceud008,
                       l_apce.apceud009,l_apce.apceud010,l_apce.apceud011,l_apce.apceud012,l_apce.apceud013,
                       l_apce.apceud014,l_apce.apceud015,l_apce.apceud016,l_apce.apceud017,l_apce.apceud018,
                       l_apce.apceud019,l_apce.apceud020,l_apce.apceud021,l_apce.apceud022,l_apce.apceud023,
                       l_apce.apceud024,l_apce.apceud025,l_apce.apceud026,l_apce.apceud027,l_apce.apceud028,
                       l_apce.apceud029,l_apce.apceud030,l_apce.apce103,l_apce.apce113,l_apce.apce123,
                       l_apce.apce133,l_apce.apce061)
               IF SQLCA.SQLcode OR SQLCA.SQLERRD[3]=0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "ins apdc_t"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET r_success = FALSE
               END IF
      END FOREACH              
   END IF 
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 整批產生單身寫入目的帳款(apdc_t)
# Memo...........: #161108-00005#1
# Usage..........: CALL s_aapt430_ins_apdc()
# Input parameter: p_wc           開窗回傳字串
#                : p_ld           帳套
#                : p_apdadocno    單頭單號
#                : p_apdacomp     法人
#                : p_apdasite     單頭帳務中心
#                : p_apda019      目的分攤方式
#                : p_apdadocdt    單據日期
# Return code....: 無
# Date & Author..: 170302 By 08729
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt430_ins_apdc(p_wc,p_ld,p_apdadocno,p_apdacomp,p_apdasite,p_apda019,p_apdadocdt)
DEFINE p_wc              STRING
DEFINE p_ld              LIKE apda_t.apdald
DEFINE p_apdadocno       LIKE apda_t.apdadocno
DEFINE p_apdacomp        LIKE apda_t.apdacomp
DEFINE p_apdasite        LIKE apda_t.apdasite
DEFINE p_apda019         LIKE apda_t.apda019
DEFINE p_apdadocdt       LIKE apda_t.apdadocdt
DEFINE l_sql             STRING
DEFINE l_sql1            STRING
DEFINE l_sql2            STRING
DEFINE l_sql3            STRING
DEFINE r_wc              STRING
DEFINE l_apdc RECORD  #費用分攤目的明細檔
       apdcent LIKE apdc_t.apdcent, #企業編號
       apdccomp LIKE apdc_t.apdccomp, #法人
       apdcsite LIKE apdc_t.apdcsite, #帳務組織
       apdcld LIKE apdc_t.apdcld, #帳套
       apdcdocno LIKE apdc_t.apdcdocno, #攤銷單號
       apdcseq LIKE apdc_t.apdcseq, #攤銷單項次
       apdcorga LIKE apdc_t.apdcorga, #來源歸屬組織
       apdc001 LIKE apdc_t.apdc001, #攤銷至目的方式
       apdc002 LIKE apdc_t.apdc002, #交易單號(入庫單)
       apdc003 LIKE apdc_t.apdc003, #交易單項次
       apdc004 LIKE apdc_t.apdc004, #產品編號
       apdc005 LIKE apdc_t.apdc005, #目的帳款單號
       apdc006 LIKE apdc_t.apdc006, #目的帳款單項次
       apdc007 LIKE apdc_t.apdc007, #目的會計科目
       apdc008 LIKE apdc_t.apdc008, #數量
       apdc009 LIKE apdc_t.apdc009, #分攤金額方式
       apdc111 LIKE apdc_t.apdc111, #本幣分攤前單價
       apdc113 LIKE apdc_t.apdc113, #本幣分攤前金額
       apdc211 LIKE apdc_t.apdc211, #本幣分攤後單價
       apdc213 LIKE apdc_t.apdc213, #本幣分攤後金額
       apdc123 LIKE apdc_t.apdc123, #本位幣二分攤前金額
       apdc223 LIKE apdc_t.apdc223, #本位幣二分攤後金額
       apdc133 LIKE apdc_t.apdc133, #本位幣三分攤前金額
       apdc233 LIKE apdc_t.apdc233, #本位幣三分攤後金額
       apdc015 LIKE apdc_t.apdc015, #沖銷加減項
       apdc017 LIKE apdc_t.apdc017, #業務人員
       apdc018 LIKE apdc_t.apdc018, #業務部門
       apdc019 LIKE apdc_t.apdc019, #責任中心
       apdc020 LIKE apdc_t.apdc020, #產品類別
       apdc022 LIKE apdc_t.apdc022, #專案編號
       apdc023 LIKE apdc_t.apdc023, #WBS編號
       apdc024 LIKE apdc_t.apdc024, #區域
       apdc025 LIKE apdc_t.apdc025, #客戶分類
       apdc026 LIKE apdc_t.apdc026, #帳款對象
       apdc027 LIKE apdc_t.apdc027, #經營方式
       apdc028 LIKE apdc_t.apdc028, #通路
       apdc029 LIKE apdc_t.apdc029, #品牌
       apdc031 LIKE apdc_t.apdc031, #自由核算項一
       apdc032 LIKE apdc_t.apdc032, #自由核算項二
       apdc033 LIKE apdc_t.apdc033, #自由核算項三
       apdc034 LIKE apdc_t.apdc034, #自由核算項四
       apdc035 LIKE apdc_t.apdc035, #自由核算項五
       apdc036 LIKE apdc_t.apdc036, #自由核算項六
       apdc037 LIKE apdc_t.apdc037, #自由核算項七
       apdc038 LIKE apdc_t.apdc038, #自由核算項八
       apdc039 LIKE apdc_t.apdc039, #自由核算項九
       apdc040 LIKE apdc_t.apdc040, #自由核算項十
       apdc041 LIKE apdc_t.apdc041, #摘要說明
       apdcud001 LIKE apdc_t.apdcud001, #自定義欄位(文字)001
       apdcud002 LIKE apdc_t.apdcud002, #自定義欄位(文字)002
       apdcud003 LIKE apdc_t.apdcud003, #自定義欄位(文字)003
       apdcud004 LIKE apdc_t.apdcud004, #自定義欄位(文字)004
       apdcud005 LIKE apdc_t.apdcud005, #自定義欄位(文字)005
       apdcud006 LIKE apdc_t.apdcud006, #自定義欄位(文字)006
       apdcud007 LIKE apdc_t.apdcud007, #自定義欄位(文字)007
       apdcud008 LIKE apdc_t.apdcud008, #自定義欄位(文字)008
       apdcud009 LIKE apdc_t.apdcud009, #自定義欄位(文字)009
       apdcud010 LIKE apdc_t.apdcud010, #自定義欄位(文字)010
       apdcud011 LIKE apdc_t.apdcud011, #自定義欄位(數字)011
       apdcud012 LIKE apdc_t.apdcud012, #自定義欄位(數字)012
       apdcud013 LIKE apdc_t.apdcud013, #自定義欄位(數字)013
       apdcud014 LIKE apdc_t.apdcud014, #自定義欄位(數字)014
       apdcud015 LIKE apdc_t.apdcud015, #自定義欄位(數字)015
       apdcud016 LIKE apdc_t.apdcud016, #自定義欄位(數字)016
       apdcud017 LIKE apdc_t.apdcud017, #自定義欄位(數字)017
       apdcud018 LIKE apdc_t.apdcud018, #自定義欄位(數字)018
       apdcud019 LIKE apdc_t.apdcud019, #自定義欄位(數字)019
       apdcud020 LIKE apdc_t.apdcud020, #自定義欄位(數字)020
       apdcud021 LIKE apdc_t.apdcud021, #自定義欄位(日期時間)021
       apdcud022 LIKE apdc_t.apdcud022, #自定義欄位(日期時間)022
       apdcud023 LIKE apdc_t.apdcud023, #自定義欄位(日期時間)023
       apdcud024 LIKE apdc_t.apdcud024, #自定義欄位(日期時間)024
       apdcud025 LIKE apdc_t.apdcud025, #自定義欄位(日期時間)025
       apdcud026 LIKE apdc_t.apdcud026, #自定義欄位(日期時間)026
       apdcud027 LIKE apdc_t.apdcud027, #自定義欄位(日期時間)027
       apdcud028 LIKE apdc_t.apdcud028, #自定義欄位(日期時間)028
       apdcud029 LIKE apdc_t.apdcud029, #自定義欄位(日期時間)029
       apdcud030 LIKE apdc_t.apdcud030, #自定義欄位(日期時間)030
       apdc042   LIKE apdc_t.apdc042    #付款對象  #170501-00007#1 add
           END RECORD
DEFINE l_apce        RECORD
       apce017    LIKE apce_t.apce017,
       apce018    LIKE apce_t.apce018,
       apce019    LIKE apce_t.apce019, #責任中心
       apce020    LIKE apce_t.apce020, #產品類別
       apce022    LIKE apce_t.apce022, #專案代號
       apce023    LIKE apce_t.apce023, #WBS編號
       apce035    LIKE apce_t.apce035,
       apce036    LIKE apce_t.apce036,
       apce044    LIKE apce_t.apce044,
       apce045    LIKE apce_t.apce045,
       apce046    LIKE apce_t.apce046,
       apce051    LIKE apce_t.apce051,
       apce052    LIKE apce_t.apce052,
       apce053    LIKE apce_t.apce053,
       apce054    LIKE apce_t.apce054,
       apce055    LIKE apce_t.apce055,
       apce056    LIKE apce_t.apce056,
       apce057    LIKE apce_t.apce057,
       apce058    LIKE apce_t.apce058,
       apce059    LIKE apce_t.apce059,
       apce060    LIKE apce_t.apce060,
       apce010    LIKE apce_t.apce010
                 END RECORD    
DEFINE l_pmds   RECORD
       pmdsdocno  LIKE pmds_t.pmdsdocno,
       pmdtseq    LIKE pmdt_t.pmdtseq,
       pmdt006    LIKE pmdt_t.pmdt006,
       pmdtsite   LIKE pmdt_t.pmdtsite
            END RECORD
DEFINE l_apcb  RECORD  #應付憑單單身
       apcbent   LIKE apcb_t.apcbent, #企業編號
       apcbld    LIKE apcb_t.apcbld, #帳套
       apcblegl  LIKE apcb_t.apcblegl, #核算組織
       apcborga  LIKE apcb_t.apcborga, #帳務歸屬組織(來源組織)
       apcbsite  LIKE apcb_t.apcbsite, #應付帳務組織
       apcbdocno LIKE apcb_t.apcbdocno, #單號
       apcbseq   LIKE apcb_t.apcbseq, #項次
       apcb001   LIKE apcb_t.apcb001, #來源類型
       apcb002   LIKE apcb_t.apcb002, #來源業務單據號碼
       apcb003   LIKE apcb_t.apcb003, #來源業務單據項次
       apcb004   LIKE apcb_t.apcb004, #產品編號
       apcb005   LIKE apcb_t.apcb005, #品名規格
       apcb006   LIKE apcb_t.apcb006, #單位
       apcb007   LIKE apcb_t.apcb007, #計價數量
       apcb008   LIKE apcb_t.apcb008, #參考單據號碼
       apcb009   LIKE apcb_t.apcb009, #參考單據項次
       apcb010   LIKE apcb_t.apcb010, #業務部門
       apcb011   LIKE apcb_t.apcb011, #責任中心
       apcb012   LIKE apcb_t.apcb012, #產品類別
       apcb013   LIKE apcb_t.apcb013, #搭贈
       apcb014   LIKE apcb_t.apcb014, #理由碼
       apcb015   LIKE apcb_t.apcb015, #專案編號
       apcb016   LIKE apcb_t.apcb016, #WBS編號
       apcb017   LIKE apcb_t.apcb017, #預算細項
       apcb018   LIKE apcb_t.apcb018, #专柜编号
       apcb019   LIKE apcb_t.apcb019, #開票性質
       apcb020   LIKE apcb_t.apcb020, #稅別
       apcb021   LIKE apcb_t.apcb021, #費用會計科目
       apcb022   LIKE apcb_t.apcb022, #正負值
       apcb023   LIKE apcb_t.apcb023, #沖暫估單否
       apcb024   LIKE apcb_t.apcb024, #區域
       apcb025   LIKE apcb_t.apcb025, #傳票號碼
       apcb026   LIKE apcb_t.apcb026, #傳票項次
       apcb027   LIKE apcb_t.apcb027, #發票代碼
       apcb028   LIKE apcb_t.apcb028, #發票號碼
       apcb029   LIKE apcb_t.apcb029, #應付帳款科目
       apcb030   LIKE apcb_t.apcb030, #付款條件
       apcb032   LIKE apcb_t.apcb032, #訂金序次
       apcb033   LIKE apcb_t.apcb033, #經營方式
       apcb034   LIKE apcb_t.apcb034, #通路
       apcb035   LIKE apcb_t.apcb035, #品牌
       apcb036   LIKE apcb_t.apcb036, #客群
       apcb037   LIKE apcb_t.apcb037, #自由核算項一
       apcb038   LIKE apcb_t.apcb038, #自由核算項二
       apcb039   LIKE apcb_t.apcb039, #自由核算項三
       apcb040   LIKE apcb_t.apcb040, #自由核算項四
       apcb041   LIKE apcb_t.apcb041, #自由核算項五
       apcb042   LIKE apcb_t.apcb042, #自由核算項六
       apcb043   LIKE apcb_t.apcb043, #自由核算項七
       apcb044   LIKE apcb_t.apcb044, #自由核算項八
       apcb045   LIKE apcb_t.apcb045, #自由核算項九
       apcb046   LIKE apcb_t.apcb046, #自由核算項十
       apcb047   LIKE apcb_t.apcb047, #摘要
       apcb048   LIKE apcb_t.apcb048, #來源訂購單號
       apcb049   LIKE apcb_t.apcb049, #開票單號
       apcb050   LIKE apcb_t.apcb050, #開票項次
       apcb051   LIKE apcb_t.apcb051, #業務人員
       apcb100   LIKE apcb_t.apcb100, #交易原幣
       apcb101   LIKE apcb_t.apcb101, #交易原幣單價
       apcb102   LIKE apcb_t.apcb102, #原幣匯率
       apcb103   LIKE apcb_t.apcb103, #交易原幣未稅金額
       apcb104   LIKE apcb_t.apcb104, #交易原幣稅額
       apcb105   LIKE apcb_t.apcb105, #交易原幣含稅金額
       apcb106   LIKE apcb_t.apcb106, #交易幣標準成本金額
       apcb107   LIKE apcb_t.apcb107, #NO USE
       apcb108   LIKE apcb_t.apcb108, #交易原幣成本認列金額
       apcb111   LIKE apcb_t.apcb111, #本幣單價
       apcb113   LIKE apcb_t.apcb113, #本幣未稅金額
       apcb114   LIKE apcb_t.apcb114, #本幣稅額
       apcb115   LIKE apcb_t.apcb115, #本幣含稅金額
       apcb116   LIKE apcb_t.apcb116, #本幣標準成本金額
       apcb117   LIKE apcb_t.apcb117, #NO USE
       apcb118   LIKE apcb_t.apcb118, #本幣成本認列金額
       apcb119   LIKE apcb_t.apcb119, #應開發票含稅金額
       apcb121   LIKE apcb_t.apcb121, #本位幣二匯率
       apcb123   LIKE apcb_t.apcb123, #本位幣二未稅金額
       apcb124   LIKE apcb_t.apcb124, #本位幣二稅額
       apcb125   LIKE apcb_t.apcb125, #本位幣二含稅金額
       apcb126   LIKE apcb_t.apcb126, #本幣二標準成本金額
       apcb127   LIKE apcb_t.apcb127, #NO USE
       apcb128   LIKE apcb_t.apcb128, #本位幣二成本認列金額
       apcb131   LIKE apcb_t.apcb131, #本位幣三匯率
       apcb133   LIKE apcb_t.apcb133, #本位幣三未稅金額
       apcb134   LIKE apcb_t.apcb134, #本位幣三稅額
       apcb135   LIKE apcb_t.apcb135, #本位幣三含稅金額
       apcb136   LIKE apcb_t.apcb136, #本幣三標準成本金額
       apcb137   LIKE apcb_t.apcb137, #NO USE
       apcb138   LIKE apcb_t.apcb138, #本位幣三成本認列金額
       apcbud001 LIKE apcb_t.apcbud001, #自定義欄位(文字)001
       apcbud002 LIKE apcb_t.apcbud002, #自定義欄位(文字)002
       apcbud003 LIKE apcb_t.apcbud003, #自定義欄位(文字)003
       apcbud004 LIKE apcb_t.apcbud004, #自定義欄位(文字)004
       apcbud005 LIKE apcb_t.apcbud005, #自定義欄位(文字)005
       apcbud006 LIKE apcb_t.apcbud006, #自定義欄位(文字)006
       apcbud007 LIKE apcb_t.apcbud007, #自定義欄位(文字)007
       apcbud008 LIKE apcb_t.apcbud008, #自定義欄位(文字)008
       apcbud009 LIKE apcb_t.apcbud009, #自定義欄位(文字)009
       apcbud010 LIKE apcb_t.apcbud010, #自定義欄位(文字)010
       apcbud011 LIKE apcb_t.apcbud011, #自定義欄位(數字)011
       apcbud012 LIKE apcb_t.apcbud012, #自定義欄位(數字)012
       apcbud013 LIKE apcb_t.apcbud013, #自定義欄位(數字)013
       apcbud014 LIKE apcb_t.apcbud014, #自定義欄位(數字)014
       apcbud015 LIKE apcb_t.apcbud015, #自定義欄位(數字)015
       apcbud016 LIKE apcb_t.apcbud016, #自定義欄位(數字)016
       apcbud017 LIKE apcb_t.apcbud017, #自定義欄位(數字)017
       apcbud018 LIKE apcb_t.apcbud018, #自定義欄位(數字)018
       apcbud019 LIKE apcb_t.apcbud019, #自定義欄位(數字)019
       apcbud020 LIKE apcb_t.apcbud020, #自定義欄位(數字)020
       apcbud021 LIKE apcb_t.apcbud021, #自定義欄位(日期時間)021
       apcbud022 LIKE apcb_t.apcbud022, #自定義欄位(日期時間)022
       apcbud023 LIKE apcb_t.apcbud023, #自定義欄位(日期時間)023
       apcbud024 LIKE apcb_t.apcbud024, #自定義欄位(日期時間)024
       apcbud025 LIKE apcb_t.apcbud025, #自定義欄位(日期時間)025
       apcbud026 LIKE apcb_t.apcbud026, #自定義欄位(日期時間)026
       apcbud027 LIKE apcb_t.apcbud027, #自定義欄位(日期時間)027
       apcbud028 LIKE apcb_t.apcbud028, #自定義欄位(日期時間)028
       apcbud029 LIKE apcb_t.apcbud029, #自定義欄位(日期時間)029
       apcbud030 LIKE apcb_t.apcbud030, #自定義欄位(日期時間)030
       apcb052   LIKE apcb_t.apcb052, #稅額
       apcb053   LIKE apcb_t.apcb053, #含稅金額
       apcb054   LIKE apcb_t.apcb054, #帳款對象
       apcb055   LIKE apcb_t.apcb055  #付款對象
           END RECORD            
DEFINE l_sfin2002        LIKE type_t.chr1   
DEFINE l_cnt             LIKE type_t.num5
DEFINE l_year            LIKE type_t.num5
DEFINE l_month           LIKE type_t.num5
DEFINE l_glaa001         LIKE glaa_t.glaa001
DEFINE l_glaa120         LIKE glaa_t.glaa120
DEFINE r_success         LIKE type_t.num5
   
   LET r_success  = TRUE
   CALL s_ld_sel_glaa(p_ld,'glaa001|glaa120') RETURNING g_sub_success,l_glaa001,l_glaa120
   INITIALIZE l_apdc.* TO NULL #170501-00007#1 add
   LET l_apdc.apdcent = g_enterprise
   LET l_apdc.apdccomp = p_apdacomp
   LET l_apdc.apdcsite = p_apdasite
   LET l_apdc.apdcld = p_ld
   LET l_apdc.apdcdocno = p_apdadocno 
   
   IF p_apda019 = '1' THEN
      #170501-00007#1 --s add
      #帳款對象/付款對象
      LET l_sql = " SELECT apca004,apca005 ",
                  "  FROM apca_t ",
                  " WHERE apcaent = ",g_enterprise," ",
                  "   AND apcald  = '",p_ld,"' ",
                  "   AND apcadocno = ? "
      PREPARE s_aapt430_apca_prep FROM l_sql 
      #170501-00007#1 --e add   
   
      CALL s_chr_replace(p_wc,'apdc002','pmdtdocno',0) RETURNING r_wc
      CALL s_chr_replace(r_wc,'apdcorga','pmdtsite',0) RETURNING r_wc
      LET l_sql =  "SELECT pmdsdocno,pmdtseq,pmdt006,pmdtsite",
                  "  FROM pmds_t ",
                  "  LEFT JOIN pmdt_t ON pmdsent = pmdtent AND pmdsdocno = pmdtdocno ",
                  " WHERE pmdsent = ",g_enterprise,
                  #"   AND pmdsstus = 'Y' ",      #170326-00008#1 add   #170414-00068#1 mark lujh
                  "   AND pmdsstus = 'S' ",       #170414-00068#1 add lujh
                  "   AND ",r_wc CLIPPED
                  
      PREPARE s_aapt430_sel_pmds_p1 FROM l_sql
      DECLARE s_aapt430_sel_pmds_c1 CURSOR FOR s_aapt430_sel_pmds_p1
      FOREACH s_aapt430_sel_pmds_c1 INTO l_pmds.pmdsdocno,l_pmds.pmdtseq,l_pmds.pmdt006,l_pmds.pmdtsite
      
         IF SQLCA.SQLCODE THEN
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         INITIALIZE l_apdc.* TO NULL
         
         SELECT apcbent,apcbld,apcblegl,apcborga,apcbsite,
                apcbdocno,apcbseq,apcb001,apcb002,apcb003,
                apcb004,apcb005,apcb006,apcb007,apcb008,
                apcb009,apcb010,apcb011,apcb012,apcb013,
                apcb014,apcb015,apcb016,apcb017,apcb018,
                apcb019,apcb020,apcb021,apcb022,apcb023,
                apcb024,apcb025,apcb026,apcb027,apcb028,
                apcb029,apcb030,apcb032,apcb033,apcb034,
                apcb035,apcb036,apcb037,apcb038,apcb039,
                apcb040,apcb041,apcb042,apcb043,apcb044,
                apcb045,apcb046,apcb047,apcb048,apcb049,
                apcb050,apcb051,apcb100,apcb101,apcb102,
                apcb103,apcb104,apcb105,apcb106,apcb107,
                apcb108,apcb111,apcb113,apcb114,apcb115,
                apcb116,apcb117,apcb118,apcb119,apcb121,
                apcb123,apcb124,apcb125,apcb126,apcb127,
                apcb128,apcb131,apcb133,apcb134,apcb135,
                apcb136,apcb137,apcb138,apcbud001,apcbud002,
                apcbud003,apcbud004,apcbud005,apcbud006,apcbud007,
                apcbud008,apcbud009,apcbud010,apcbud011,apcbud012,
                apcbud013,apcbud014,apcbud015,apcbud016,apcbud017,
                apcbud018,apcbud019,apcbud020,apcbud021,apcbud022,
                apcbud023,apcbud024,apcbud025,apcbud026,apcbud027,
                apcbud028,apcbud029,apcbud030,apcb052,apcb053,
                apcb054,apcb055 
           INTO l_apcb.* 
           FROM apcb_t
          WHERE apcbent = g_enterprise
            AND apcbld  = p_ld
            AND apcb002 = l_pmds.pmdsdocno
            AND apcb003 = l_pmds.pmdtseq
         
         #170414-00068#1--add lujh         
         LET l_cnt = 0  
         SELECT COUNT(*) INTO l_cnt FROM apda_t,apdc_t
          WHERE apdcent = g_enterprise
            AND apdaent = apdcent
            AND apdald = apdcld
            AND apdadocno = apdcdocno
            AND apdcld  = p_ld
            AND apdcdocno = p_apdadocno
            AND apdc002   = l_pmds.pmdsdocno
            AND apdc003   = l_pmds.pmdtseq   
            AND apdastus <> 'X'
         
         IF l_cnt > 0 THEN 
            CONTINUE FOREACH
         END IF
         #170414-00068#1 add lujh
            
         LET l_apdc.apdc002 = l_pmds.pmdsdocno
         LET l_apdc.apdc003 = l_pmds.pmdtseq 
         LET l_apdc.apdcorga = l_pmds.pmdtsite
         #產品編號
         LET l_apdc.apdc004 = l_pmds.pmdt006
         #目的帳款單號
         LET l_apdc.apdc005 = l_apcb.apcbdocno
         #目的項次
         LET l_apdc.apdc006 = l_apcb.apcbseq
         #目的會計科目
         LET l_apdc.apdc007 = l_apcb.apcb021
         #帳款單性質
         LET l_apdc.apdc015 = 'D'
         IF p_apda019 = '1' THEN
            #數量
            LET l_apdc.apdc008 = l_apcb.apcb007
            #本幣分攤前單價
            LET l_apdc.apdc111 = l_apcb.apcb111
            IF cl_null(l_apdc.apdc111) THEN LET l_apdc.apdc111 = 0 END IF
            #本幣分攤前金額
            LET l_apdc.apdc113 = l_apcb.apcb113
            IF cl_null(l_apdc.apdc113) THEN LET l_apdc.apdc113 = 0 END IF
         END IF   
         #本幣分攤後單價
         LET l_apdc.apdc211 = 0
         #本幣分攤後金額
         LET l_apdc.apdc213 = 0
         
         #本位幣二分攤前金額
         LET l_apdc.apdc123 = l_apcb.apcb123
         IF cl_null(l_apdc.apdc123) THEN LET l_apdc.apdc123 = 0 END IF
         #本位幣二分攤後金額
         LET l_apdc.apdc223 = 0
         #本位幣三分攤前金額
         LET l_apdc.apdc133 = l_apcb.apcb133
         IF cl_null(l_apdc.apdc133) THEN LET l_apdc.apdc133 = 0 END IF
         #本位幣三分攤後金額
         LET l_apdc.apdc233 = 0
      
         #項次
         SELECT MAX(apdcseq)+1 INTO l_apdc.apdcseq FROM apdc_t
          WHERE apdcent = g_enterprise AND apdcdocno = p_apdadocno
         IF cl_null(l_apdc.apdcseq) OR l_apdc.apdcseq = 0 THEN LET l_apdc.apdcseq = 1 END IF
         
         LET l_sql1 = ''
         LET l_sql1 = l_sql1,
                     " SELECT apcb051,apcb010,apcb011,apcb012,apcb015, ",
                     "        apcb016,apcb024,apcb036,apcb033,apcb034, ",
                     "        apcb035,apcb037,apcb038,apcb039,apcb040, ",
                     "        apcb041,apcb042,apcb043,apcb044,apcb045, ",
                     "        apcb046,apcb047"
         LET l_sql1 = l_sql1,
                     "   FROM apca_t,apcb_t",
                     "  WHERE apcaent = apcbent ", 
                     "    AND apcald = apcbld ",
                     "    AND apcadocno = apcbdocno ",
                     "    AND apcaent = '",g_enterprise,"' ",
                     "    AND apcadocno = '",l_apcb.apcbdocno,"' ",
                     "    AND apcbseq = '",l_apcb.apcbseq,"' ",
                     "    AND apcald = '",p_ld,"' "
         PREPARE s_aapt430_source_account_carry_p FROM l_sql1
         DECLARE s_aapt430_source_account_carry_c CURSOR FOR s_aapt430_source_account_carry_p
         OPEN s_aapt430_source_account_carry_c
         FETCH s_aapt430_source_account_carry_c INTO l_apce.*
         
         #核算項給值
         LET l_apdc.apdc017      = l_apce.apce017
         LET l_apdc.apdc018      = l_apce.apce018
         LET l_apdc.apdc019      = l_apce.apce019
         LET l_apdc.apdc020      = l_apce.apce020
         LET l_apdc.apdc022      = l_apce.apce022
         LET l_apdc.apdc023      = l_apce.apce023
         LET l_apdc.apdc024      = l_apce.apce035
         LET l_apdc.apdc025      = l_apce.apce036
         LET l_apdc.apdc027      = l_apce.apce044
         LET l_apdc.apdc028      = l_apce.apce045
         LET l_apdc.apdc029      = l_apce.apce046

         EXECUTE s_aapt430_apca_prep USING l_apdc.apdc005 INTO l_apdc.apdc026,l_apdc.apdc042 #170501-00007#1 add 帳款對象 / 付款對象
         
         LET l_apdc.apdc031      = l_apce.apce051
         LET l_apdc.apdc032      = l_apce.apce052
         LET l_apdc.apdc033      = l_apce.apce053
         LET l_apdc.apdc034      = l_apce.apce054
         LET l_apdc.apdc035      = l_apce.apce055
         LET l_apdc.apdc036      = l_apce.apce056
         LET l_apdc.apdc037      = l_apce.apce057
         LET l_apdc.apdc038      = l_apce.apce058
         LET l_apdc.apdc039      = l_apce.apce059
         LET l_apdc.apdc040      = l_apce.apce060
         #摘要說明
         LET l_apdc.apdc041      = l_apce.apce010
         INSERT INTO apdc_t (apdcent,apdccomp,apdcsite,apdcld,apdcdocno,
                          apdcseq,apdcorga,apdc001,apdc002,apdc003,
                          apdc004,apdc005,apdc006,apdc007,apdc008,
                          apdc009,apdc111,apdc113,apdc211,apdc213,
                          apdc123,apdc223,apdc133,apdc233,apdc015,
                          apdc017,apdc018,apdc019,apdc020,apdc022,
                          apdc023,apdc024,apdc025,apdc026,apdc027,
                          apdc028,apdc029,apdc031,apdc032,apdc033,
                          apdc034,apdc035,apdc036,apdc037,apdc038,
                          apdc039,apdc040,apdc041,apdcud001,apdcud002,
                          apdcud003,apdcud004,apdcud005,apdcud006,apdcud007,
                          apdcud008,apdcud009,apdcud010,apdcud011,apdcud012,
                          apdcud013,apdcud014,apdcud015,apdcud016,apdcud017,
                          apdcud018,apdcud019,apdcud020,apdcud021,apdcud022,
                          apdcud023,apdcud024,apdcud025,apdcud026,apdcud027,
                          #apdcud028,apdcud029,apdcud030)        #170501-00007#1 mark
                          apdcud028,apdcud029,apdcud030,apdc042) #170501-00007#1 add apdc042
                   VALUES(g_enterprise,p_apdacomp,p_apdasite,p_ld,p_apdadocno,
                          l_apdc.apdcseq,l_apdc.apdcorga,l_apdc.apdc001,l_apdc.apdc002,l_apdc.apdc003,
                          l_apdc.apdc004,l_apdc.apdc005,l_apdc.apdc006,l_apdc.apdc007,l_apdc.apdc008,
                          l_apdc.apdc009,l_apdc.apdc111,l_apdc.apdc113,l_apdc.apdc211,l_apdc.apdc213,
                          l_apdc.apdc123,l_apdc.apdc223,l_apdc.apdc133,l_apdc.apdc233,l_apdc.apdc015,
                          l_apdc.apdc017,l_apdc.apdc018,l_apdc.apdc019,l_apdc.apdc020,l_apdc.apdc022,
                          l_apdc.apdc023,l_apdc.apdc024,l_apdc.apdc025,l_apdc.apdc026,l_apdc.apdc027,
                          l_apdc.apdc028,l_apdc.apdc029,l_apdc.apdc031,l_apdc.apdc032,l_apdc.apdc033,
                          l_apdc.apdc034,l_apdc.apdc035,l_apdc.apdc036,l_apdc.apdc037,l_apdc.apdc038,
                          l_apdc.apdc039,l_apdc.apdc040,l_apdc.apdc041,l_apdc.apdcud001,l_apdc.apdcud002,
                          l_apdc.apdcud003,l_apdc.apdcud004,l_apdc.apdcud005,l_apdc.apdcud006,l_apdc.apdcud007,
                          l_apdc.apdcud008,l_apdc.apdcud009,l_apdc.apdcud010,l_apdc.apdcud011,l_apdc.apdcud012,
                          l_apdc.apdcud013,l_apdc.apdcud014,l_apdc.apdcud015,l_apdc.apdcud016,l_apdc.apdcud017,
                          l_apdc.apdcud018,l_apdc.apdcud019,l_apdc.apdcud020,l_apdc.apdcud021,l_apdc.apdcud022,
                          l_apdc.apdcud023,l_apdc.apdcud024,l_apdc.apdcud025,l_apdc.apdcud026,l_apdc.apdcud027,
                          #l_apdc.apdcud028,l_apdc.apdcud029,l_apdc.apdcud030)               #170501-00007#1 mark
                          l_apdc.apdcud028,l_apdc.apdcud029,l_apdc.apdcud030,l_apdc.apdc042) #170501-00007#1 add l_apdc.apdc042
                          
         IF SQLCA.SQLcode OR SQLCA.SQLERRD[3]=0 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "ins apdc_t"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF
         END FOREACH
      ELSE
         LET l_apdc.apdcorga = p_apdasite
         LET l_apdc.apdcsite = p_apdasite
         LET l_apdc.apdccomp = p_apdacomp
         #預設給借
         LET l_apdc.apdc015 = 'D'
         CALL s_chr_replace(p_wc,'apdc004','pmdt006',0) RETURNING r_wc
         LET l_sql2 = "SELECT  pmdt006  FROM pmds_t  ",
                      " LEFT JOIN pmdt_t ON pmdsent = pmdtent AND pmdsdocno = pmdtdocno  ",
                      " WHERE pmdsent = ",g_enterprise,
                      #" AND pmdsstus = 'Y' ",      #170326-00008#1 add      #170414-00068#1 mark lujh
                      " AND pmdsstus = 'S' ",       #170414-00068#1 add lujh
                      " AND " ,r_wc CLIPPED,
                      " GROUP BY pmdt006 "
         PREPARE s_aapt430_sel_pmdt_p1 FROM l_sql2
         DECLARE s_aapt430_sel_pmdt_c1 CURSOR FOR s_aapt430_sel_pmdt_p1
         FOREACH s_aapt430_sel_pmdt_c1 INTO l_pmds.pmdt006            
         #同單據不可重覆產品號碼
         SELECT COUNT(*) INTO l_cnt
           FROM apdc_t
          WHERE apdcent = g_enterprise
            AND apdcld = p_ld
            AND apdcdocno = p_apdadocno
            AND apdc004 = l_pmds.pmdt006
         IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
         IF l_cnt > 0 THEN
            EXIT FOREACH
         END IF
         #項次
         SELECT MAX(apdcseq)+1 INTO l_apdc.apdcseq FROM apdc_t
          WHERE apdcent = g_enterprise AND apdcdocno = p_apdadocno
         IF cl_null(l_apdc.apdcseq) OR l_apdc.apdcseq = 0 THEN LET l_apdc.apdcseq = 1 END IF
         #先取得日期是屬於哪個年度期別
         CALL s_fin_date_get_period_value('',p_ld,p_apdadocdt)
              RETURNING g_sub_success,l_year,l_month
         #再取得該年度期別的上一期
         CALL s_fin_date_get_last_period('',p_ld,l_year,l_month)
              RETURNING g_sub_success,l_year,l_month
         LET l_sql3 = "SELECT SUM(xccc901),SUM(xccc902)",
                     "  FROM xccc_t",
                     " WHERE xcccent= ",g_enterprise,
                     "   AND xccccomp= '",p_apdacomp,"'",
                     "   AND xcccld  = '",p_ld,"'",
                     "   AND xccc004 = ",l_year,   #年度
                     "   AND xccc005 = ",l_month,  #期別
                     "   AND xccc006 = '",l_pmds.pmdt006,"'",
                     "   AND xccc003 = '",l_glaa120,"'"
          
         PREPARE sel_aaa FROM l_sql3
         DECLARE sel_bbb2 CURSOR FOR sel_aaa
         EXECUTE sel_bbb2 INTO l_apdc.apdc008,l_apdc.apdc113
            IF cl_null(l_apdc.apdc113) THEN
               #取不到成本價的,提示訊息"無成本金額結算數值可參考。"
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'aap-00298'
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET l_apdc.apdc008 = 0
               LET l_apdc.apdc113 = 0
               IF cl_null(l_apdc.apdc111) THEN LET l_apdc.apdc111 = 0 END IF
            ELSE
               #計算分攤前單價
               LET l_apdc.apdc111 = l_apdc.apdc113 / l_apdc.apdc008
               #取位
               CALL s_curr_round_ld('1',p_ld,l_glaa001,l_apdc.apdc111,1)
                    RETURNING g_sub_success,g_errno,l_apdc.apdc111
            END IF
         #END IF 
         IF cl_null(l_apdc.apdc211) THEN LET l_apdc.apdc211 = "0" END IF
         IF cl_null(l_apdc.apdc213) THEN LET l_apdc.apdc213 = "0" END IF
         IF cl_null(l_apdc.apdc123) THEN LET l_apdc.apdc123 = "0" END IF
         IF cl_null(l_apdc.apdc223) THEN LET l_apdc.apdc223 = "0" END IF
         IF cl_null(l_apdc.apdc133) THEN LET l_apdc.apdc133 = "0" END IF
         IF cl_null(l_apdc.apdc233) THEN LET l_apdc.apdc233 = "0" END IF
         LET l_apdc.apdc004 = l_pmds.pmdt006   
         INSERT INTO apdc_t (apdcent,apdccomp,apdcsite,apdcld,apdcdocno,
                          apdcseq,apdcorga,apdc001,apdc002,apdc003,
                          apdc004,apdc005,apdc006,apdc007,apdc008,
                          apdc009,apdc111,apdc113,apdc211,apdc213,
                          apdc123,apdc223,apdc133,apdc233,apdc015,
                          apdc017,apdc018,apdc019,apdc020,apdc022,
                          apdc023,apdc024,apdc025,apdc026,apdc027,
                          apdc028,apdc029,apdc031,apdc032,apdc033,
                          apdc034,apdc035,apdc036,apdc037,apdc038,
                          apdc039,apdc040,apdc041,apdcud001,apdcud002,
                          apdcud003,apdcud004,apdcud005,apdcud006,apdcud007,
                          apdcud008,apdcud009,apdcud010,apdcud011,apdcud012,
                          apdcud013,apdcud014,apdcud015,apdcud016,apdcud017,
                          apdcud018,apdcud019,apdcud020,apdcud021,apdcud022,
                          apdcud023,apdcud024,apdcud025,apdcud026,apdcud027,
                          #apdcud028,apdcud029,apdcud030)        #170501-00007#1 mark
                          apdcud028,apdcud029,apdcud030,apdc042) #170501-00007#1 add apdc042                          
                   VALUES(g_enterprise,p_apdacomp,p_apdasite,p_ld,p_apdadocno,
                          l_apdc.apdcseq,l_apdc.apdcorga,l_apdc.apdc001,l_apdc.apdc002,l_apdc.apdc003,
                          l_apdc.apdc004,l_apdc.apdc005,l_apdc.apdc006,l_apdc.apdc007,l_apdc.apdc008,
                          l_apdc.apdc009,l_apdc.apdc111,l_apdc.apdc113,l_apdc.apdc211,l_apdc.apdc213,
                          l_apdc.apdc123,l_apdc.apdc223,l_apdc.apdc133,l_apdc.apdc233,l_apdc.apdc015,
                          l_apdc.apdc017,l_apdc.apdc018,l_apdc.apdc019,l_apdc.apdc020,l_apdc.apdc022,
                          l_apdc.apdc023,l_apdc.apdc024,l_apdc.apdc025,l_apdc.apdc026,l_apdc.apdc027,
                          l_apdc.apdc028,l_apdc.apdc029,l_apdc.apdc031,l_apdc.apdc032,l_apdc.apdc033,
                          l_apdc.apdc034,l_apdc.apdc035,l_apdc.apdc036,l_apdc.apdc037,l_apdc.apdc038,
                          l_apdc.apdc039,l_apdc.apdc040,l_apdc.apdc041,l_apdc.apdcud001,l_apdc.apdcud002,
                          l_apdc.apdcud003,l_apdc.apdcud004,l_apdc.apdcud005,l_apdc.apdcud006,l_apdc.apdcud007,
                          l_apdc.apdcud008,l_apdc.apdcud009,l_apdc.apdcud010,l_apdc.apdcud011,l_apdc.apdcud012,
                          l_apdc.apdcud013,l_apdc.apdcud014,l_apdc.apdcud015,l_apdc.apdcud016,l_apdc.apdcud017,
                          l_apdc.apdcud018,l_apdc.apdcud019,l_apdc.apdcud020,l_apdc.apdcud021,l_apdc.apdcud022,
                          l_apdc.apdcud023,l_apdc.apdcud024,l_apdc.apdcud025,l_apdc.apdcud026,l_apdc.apdcud027,
                          #l_apdc.apdcud028,l_apdc.apdcud029,l_apdc.apdcud030)               #170501-00007#1 mark
                          l_apdc.apdcud028,l_apdc.apdcud029,l_apdc.apdcud030,l_apdc.apdc042) #170501-00007#1 add l_apdc.apdc042                          
                          
         IF SQLCA.SQLcode OR SQLCA.SQLERRD[3]=0 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "ins apdc_t"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF
         END FOREACH
      END IF
      
     
      
      
      
      
      
   
   RETURN r_success
   
END FUNCTION

################################################################################
# Descriptions...: 產生新增xcco_t所需temp table
# Memo...........:
# Usage..........: CALL s_aapt430_create_temp()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 18/01/29 By 07423 (#171012-00009#1 add)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt430_create_temp()
WHENEVER ERROR CONTINUE
   
   #項次對應的inaj_t相關資料
   DROP TABLE aapt430_tmp;
   CREATE TEMP TABLE aapt430_tmp(
      apdcseq       LIKE apdc_t.apdcseq,   #項次
      apdc004       LIKE apdc_t.apdc004,   #產品編號
      apdc_sum      LIKE apdc_t.apdc213,   #項次總分攤金額
      inaj006       LIKE inaj_t.inaj006,   #產品特徵
      xcbf001       LIKE xcbf_t.xcbf001,   #成本域
      inaj010       LIKE inaj_t.inaj010,   #批號
      inaj011       LIKE inaj_t.inaj011,   #交易數量
      apdc_price    LIKE apdc_t.apdc213    #交易數量的分攤金額
      );
      
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aapt430_drop_temp()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 18/01/29 By 07423 (#171012-00009#1 add)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt430_drop_temp()
   DROP TABLE aapt430_tmp;
END FUNCTION

 
{</section>}
 
