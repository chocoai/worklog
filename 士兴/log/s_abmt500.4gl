{<section id="s_abmt500.description" >}
#應用 a00 樣板自動產生(Version:1)
#+ Version..: T100-ERP-1.00.00(SD版次:4,PR版次:4) Build-000021
#+ 
#+ Filename...: s_abmt500
#+ Description: 
#+ Creator....: 02295(2014-07-07 09:57:52)
#+ Modifier...: 00000() -SD/PR- 05423(2015-05-29 14:43:13)
 
{</section>}
 
{<section id="s_abmt500.global" >}
#應用 p00 樣板自動產生(Version:2)
#add-point:註解編寫項目

#end add-point
 
IMPORT os
#add-point:增加匯入項目

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
#add-point:增加匯入變數檔

#end add-point
 
{</section>}
 
{<section id="s_abmt500.free_style_variable" >}
#add-point:free_style模組變數(Module Variable)

#end add-point
 
{</section>}
 
{<section id="s_abmt500.global_variable" >}
#add-point:自定義模組變數(Module Variable)

#end add-point
 
{</section>}
 
{<section id="s_abmt500.other_dialog" >}

 
{</section>}
 
{<section id="s_abmt500.other_function" >}

################################################################################
# Descriptions...: 審核狀態更新
# Memo...........:
# Usage..........: CALL s_abmt500_confirm (p_bmkadocno)
#                  RETURNING r_success
# Input parameter: p_bmkadocno  ECR申請單號
# Return code....: r_success    TRUE/FALSE
# Date & Author..: 2014/07/07 By xianghui
# Modify.........: 2015-5-29  By zhujing
################################################################################
PUBLIC FUNCTION s_abmt500_conf_upd(p_bmkadocno)
DEFINE p_bmkadocno   LIKE bmka_t.bmkadocno,
       r_success     LIKE type_t.num5
DEFINE l_bmka002     LIKE bmka_t.bmka002,
       l_bmka003     LIKE bmka_t.bmka003,
       l_bmka005     LIKE bmka_t.bmka005,
       l_bmka012     LIKE bmka_t.bmka012,
       l_cnfdt       DATETIME YEAR TO SECOND,
       l_cnt1        LIKE type_t.num5,
       l_cnt2        LIKE type_t.num5,
       l_cnt3        LIKE type_t.num5
DEFINE l_bmka011     LIKE bmka_t.bmka011       
       
   LET r_success = TRUE
   
   SELECT bmka002,bmka003,bmka005,bmka012,bmka011 INTO l_bmka002,l_bmka003,l_bmka005,l_bmka012,l_bmka011
     FROM bmka_t
    WHERE bmkaent = g_enterprise
      AND bmkadocno = p_bmkadocno
#Marked by zhujing 2015-5-29-----（S）
#   IF cl_null(l_bmka002) THEN 
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = 'art-00115'
#      LET g_errparam.extend = l_bmka002
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#
#      LET r_success = FALSE
#      RETURN r_success
#   END IF
#   IF cl_null(l_bmka003) THEN 
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = 'art-00116'
#      LET g_errparam.extend = l_bmka003
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#
#      LET r_success = FALSE
#      RETURN r_success
#   END IF
#   IF cl_null(l_bmka005) THEN 
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = 'abm-00117'
#      LET g_errparam.extend = l_bmka005
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#
#      LET r_success = FALSE
#      RETURN r_success
#   END IF
#Marked by zhujing 2015-5-29-----（E）

   LET l_cnt1 = 0
   SELECT COUNT(*) INTO l_cnt1
     FROM bmkb_t
    WHERE bmkbent = g_enterprise
      AND bmkbdocno = p_bmkadocno 
   LET l_cnt2 = 0
   SELECT COUNT(*) INTO l_cnt2
     FROM bmkc_t
    WHERE bmkcent = g_enterprise
      AND bmkcdocno = p_bmkadocno   
   LET l_cnt3 = 0
   SELECT COUNT(*) INTO l_cnt3
     FROM bmkd_t
    WHERE bmkdent = g_enterprise
      AND bmkddocno = p_bmkadocno         
   IF l_cnt1 = 0 OR l_cnt2 = 0 OR l_cnt3 = 0 THEN 
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00285'
      LET g_errparam.extend = l_bmka005
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success       
   END IF

   LET l_cnfdt = cl_get_current()
   UPDATE bmka_t
      SET bmkastus = 'Y',
          bmkacnfid = g_user,
          bmkacnfdt = l_cnfdt
    WHERE bmkaent = g_enterprise
      AND bmkadocno = p_bmkadocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
   
      LET r_success = FALSE
      RETURN r_success
   END IF
   IF NOT cl_null(l_bmka012) THEN 
      UPDATE imaa_t 
         SET imaa010 = l_bmka012,
             imaamodid = g_user,
             imaamoddt = l_cnfdt
       WHERE imaaent = g_enterprise
         AND imaa001 = l_bmka005
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'upd imaa_t'
         LET g_errparam.popup = TRUE
         CALL cl_err()
      
         LET r_success = FALSE
         RETURN r_success
      END IF        
   END IF
   #20141212 add by lixh
   IF l_bmka011 <> l_bmka012 OR (cl_null(l_bmka011) AND NOT cl_null(l_bmka012))  THEN
      IF NOT s_log_imaa010_ins(g_site,l_bmka005,l_bmka011,l_bmka012,'abmt500',p_bmkadocno) THEN
         LET r_success = FALSE
         RETURN r_success
      END IF      
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 取消審核檢查與狀態更新
# Memo...........:
# Usage..........: CALL s_abmt500_unconfirm (p_bmkadocno)
#                  RETURNING r_success
# Input parameter: p_bmkadocno  ECR申請單號
# Return code....: r_success    TRUE/FALSE
# Date & Author..: 2014/07/07 By xianghui
# Modify.........:
################################################################################
PUBLIC FUNCTION s_abmt500_unconfirm(p_bmkadocno)
DEFINE p_bmkadocno   LIKE bmka_t.bmkadocno,
       r_success     LIKE type_t.num5
DEFINE l_bmka010     LIKE bmka_t.bmka010
DEFINE l_bmka005     LIKE bmka_t.bmka005
DEFINE l_bmka011     LIKE bmka_t.bmka011
DEFINE l_bmka012     LIKE bmka_t.bmka012
 
   LET r_success = TRUE
   
   SELECT bmka010,bmka005,bmka011,bmka012 INTO l_bmka010,l_bmka005,l_bmka011,l_bmka012
     FROM bmka_t
    WHERE bmkaent = g_enterprise
      AND bmkadocno = p_bmkadocno
   IF NOT cl_null(l_bmka010) THEN 
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'abm-00118'
      LET g_errparam.extend = l_bmka010
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF
   
   UPDATE bmka_t
      SET bmkastus = 'N',
          bmkacnfid = '',
          bmkacnfdt = ''
    WHERE bmkaent = g_enterprise
      AND bmkadocno = p_bmkadocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
   
      LET r_success = FALSE
      RETURN r_success
   END IF
   #add by lixh
   IF NOT cl_null(l_bmka012) THEN
      UPDATE imaa_t 
         SET imaa010 = l_bmka011,
             imaamodid = '',
             imaamoddt = ''
       WHERE imaaent = g_enterprise
         AND imaa001 = l_bmka005
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'upd imaa_t'
         LET g_errparam.popup = TRUE
         CALL cl_err()
      
         LET r_success = FALSE
         RETURN r_success
      END IF    
   END IF
   IF NOT s_log_imaa010_del(g_site,l_bmka005,'abmt500',p_bmkadocno) THEN
      LET r_success = FALSE
      RETURN r_success     
   END IF   
   
   RETURN r_success
      
END FUNCTION

################################################################################
# Descriptions...: BPM
# Memo...........:
# Date & Author..: 2015/04/14 By xianghui
# Modify.........:
################################################################################
PUBLIC FUNCTION s_abmt500_ws_confirm(p_bmkadocno)
DEFINE p_bmkadocno     LIKE bmka_t.bmkadocno
DEFINE r_success       LIKE type_t.num5

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   CALL s_abmt500_conf_chk(p_bmkadocno) RETURNING r_success
   IF r_success THEN
      CALL s_abmt500_conf_upd(p_bmkadocno) RETURNING r_success
   END IF
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 确认检核
# Memo...........:
# Usage..........: CALL s_abmt500_conf_chk(p_bmkadocno)
#                  RETURNING r_success
# Date & Author..: 2015-5-29 By zhujing
# Modify.........:
################################################################################
PUBLIC FUNCTION s_abmt500_conf_chk(p_bmkadocno)
DEFINE p_bmkadocno   LIKE bmka_t.bmkadocno,
       r_success     LIKE type_t.num5
DEFINE l_bmka002     LIKE bmka_t.bmka002,
       l_bmka003     LIKE bmka_t.bmka003,
       l_bmka005     LIKE bmka_t.bmka005,
       l_bmka012     LIKE bmka_t.bmka012,
       l_cnfdt       DATETIME YEAR TO SECOND,
       l_cnt1        LIKE type_t.num5,
       l_cnt2        LIKE type_t.num5,
       l_cnt3        LIKE type_t.num5
DEFINE l_bmka011     LIKE bmka_t.bmka011       
       
   LET r_success = TRUE
   
   SELECT bmka002,bmka003,bmka005,bmka012,bmka011 INTO l_bmka002,l_bmka003,l_bmka005,l_bmka012,l_bmka011
     FROM bmka_t
    WHERE bmkaent = g_enterprise
      AND bmkadocno = p_bmkadocno
   IF cl_null(l_bmka002) THEN 
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'art-00115'
      LET g_errparam.extend = l_bmka002
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF
   IF cl_null(l_bmka003) THEN 
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'art-00116'
      LET g_errparam.extend = l_bmka003
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF
   IF cl_null(l_bmka005) THEN 
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'abm-00117'
      LET g_errparam.extend = l_bmka005
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF
   RETURN r_success
END FUNCTION

 
{</section>}
 
