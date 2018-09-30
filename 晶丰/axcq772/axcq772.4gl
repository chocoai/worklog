# Prog. Version..: '5.30.13-14.06.19(00002)'     #
#
# Pattern name...: axcq772.4gl
# Descriptions...:
# Date & Author..: 10/05/24 By xiaofeizhu #No.FUN-AA0025
# Modify.........: No:FUN-B30211 11/03/31 By lixiang  加cl_used(g_prog,g_time,2)

DATABASE ds

#No.FUN-AA0025
GLOBALS "../../config/top.global"

DEFINE
   g_tlf62        LIKE tlf_file.tlf62,
   g_tlf DYNAMIC ARRAY OF RECORD
         tlf031   LIKE tlf_file.tlf031,
         tlf06    LIKE tlf_file.tlf06,
         tlf036   LIKE tlf_file.tlf036,
         tlf62    LIKE tlf_file.tlf62,
         tlf01    LIKE tlf_file.tlf01,
         ima02    LIKE ima_file.ima02,
         ima021   LIKE ima_file.ima021,
         tlf930   LIKE tlf_file.tlf930,
         tlf10    LIKE tlf_file.tlf10,
         amt01    LIKE tlf_file.tlf222,
         amt02    LIKE tlf_file.tlf222,
         amt03    LIKE tlf_file.tlf222,
         amt04    LIKE tlf_file.tlf222,
         amt05    LIKE tlf_file.tlf222,
         amt07    LIKE tlf_file.tlf222,
         amt08    LIKE tlf_file.tlf222,
         amt09    LIKE tlf_file.tlf222,
         amt06    LIKE tlf_file.tlf222
             END RECORD,
   g_tlf_t       RECORD
         tlf031   LIKE tlf_file.tlf031,
         tlf06    LIKE tlf_file.tlf06,
         tlf036   LIKE tlf_file.tlf036,
         tlf62    LIKE tlf_file.tlf62,
         tlf01    LIKE tlf_file.tlf01,
         ima02    LIKE ima_file.ima02,
         ima021   LIKE ima_file.ima021,
         tlf930   LIKE tlf_file.tlf930,
         tlf10    LIKE tlf_file.tlf10,
         amt01    LIKE tlf_file.tlf222,
         amt02    LIKE tlf_file.tlf222,
         amt03    LIKE tlf_file.tlf222,
         amt04    LIKE tlf_file.tlf222,
         amt05    LIKE tlf_file.tlf222,
         amt07    LIKE tlf_file.tlf222,
         amt08    LIKE tlf_file.tlf222,
         amt09    LIKE tlf_file.tlf222,
         amt06    LIKE tlf_file.tlf222
             END RECORD,
   g_argv1       LIKE tlf_file.tlf62,
   g_wc,g_sql    STRING,
   g_rec_b       LIKE type_file.num5,
   l_ac          LIKE type_file.num5
DEFINE   g_forupd_sql    STRING
DEFINE   g_cnt           LIKE type_file.num10
DEFINE   g_msg           LIKE ze_file.ze03
DEFINE   g_row_count     LIKE type_file.num10
DEFINE   g_curs_index    LIKE type_file.num10
DEFINE   g_jump          LIKE type_file.num10
DEFINE   mi_no_ask       LIKE type_file.num5

MAIN
   OPTIONS
      INPUT NO WRAP
   DEFER INTERRUPT

   IF (NOT cl_user()) THEN
      EXIT PROGRAM
   END IF

   WHENEVER ERROR CALL cl_err_msg_log

   IF (NOT cl_setup("AXC")) THEN
      EXIT PROGRAM
   END IF

#  CALL cl_used('axcq772',g_time,1) RETURNING g_time
   CALL cl_used(g_prog,g_time,1) RETURNING g_time #No.FUN-B30211

   LET g_argv1   = ARG_VAL(1)
   LET g_tlf62   = NULL
   LET g_tlf62   = g_argv1

   OPEN WINDOW q772_w WITH FORM "axc/42f/axcq772"
      ATTRIBUTE (STYLE = g_win_style CLIPPED)
   CALL cl_ui_init()

   IF NOT cl_null(g_argv1) THEN
      CALL q772_q()
   END IF
   CALL q772_menu()
   CLOSE WINDOW q772_w

#  CALL cl_used('axcq772',g_time,2) RETURNING g_time
   CALL cl_used(g_prog,g_time,2) RETURNING g_time #No.FUN-B30211
END MAIN

FUNCTION q772_curs()
   CLEAR FORM
   CALL g_tlf.clear()
   IF cl_null(g_argv1) THEN
      CALL cl_set_head_visible("","YES")
   INITIALIZE g_tlf62 TO NULL

     CONSTRUCT BY NAME g_wc ON tlf031,tlf06,tlf036,tlf62,tlf01

     BEFORE CONSTRUCT
       CALL cl_qbe_init()

     ON ACTION controlp
        IF INFIELD(tlf01) THEN
           CALL cl_init_qry_var()
           LET g_qryparam.form = "q_ima"
           LET g_qryparam.state = "c"
           CALL cl_create_qry() RETURNING g_qryparam.multiret
           DISPLAY g_qryparam.multiret TO tlf01
           NEXT FIELD tlf01
        END IF

         ON IDLE g_idle_seconds
            CALL cl_on_idle()
            CONTINUE CONSTRUCT

         ON ACTION about
            CALL cl_about()

         ON ACTION help
            CALL cl_show_help()

         ON ACTION controlg
            CALL cl_cmdask()

         ON ACTION qbe_select
         	   CALL cl_qbe_select()

         ON ACTION qbe_save
		         CALL cl_qbe_save()

      END CONSTRUCT
      IF INT_FLAG THEN RETURN END IF
   ELSE
      LET g_wc = " tlf62 = '",g_argv1,"'"
   END IF

END FUNCTION

FUNCTION q772_menu()
   WHILE TRUE
      CALL q772_bp("G")
      CASE g_action_choice
         WHEN "query"
            IF cl_chk_act_auth() THEN
               CALL q772_q()
            END IF
         WHEN "help"
            CALL cl_show_help()
         WHEN "exit"
            EXIT WHILE
         WHEN "controlg"
            CALL cl_cmdask()
         WHEN "exporttoexcel"
            IF cl_chk_act_auth() THEN
              CALL cl_export_to_excel(ui.Interface.getRootNode(),base.TypeInfo.create(g_tlf),'','')
            END IF
      END CASE
   END WHILE
END FUNCTION

FUNCTION q772_q()

   MESSAGE ""
   CALL cl_opmsg('q')
   CALL q772_curs()
   IF INT_FLAG THEN
      LET INT_FLAG = 0
      INITIALIZE g_tlf62 TO NULL
      RETURN
   END IF

   CALL q772_show()

END FUNCTION

FUNCTION q772_show()
   CALL q772_b_fill(g_wc)

END FUNCTION

FUNCTION q772_b_fill(p_wc)
DEFINE   p_wc        STRING,
         l_sql       STRING
# add by lixwz 171127 s
DEFINE tok base.StringTokenizer
DEFINE l_tok DYNAMIC ARRAY OF STRING
DEFINE l_cnt  LIKE type_file.num5
DEFINE l_chk LIKE type_file.chr1
DEFINE l_wc STRING
DEFINE l_date STRING
DEFINE l_date_t CHAR(1000)
# add by lixwz 171127 e

     LET l_sql = "SELECT tlf031,tlf06,tlf036,tlf62,",
                 " tlf01,ima02,ima021,tlf930,tlf10*tlf60,",
                 "  tlfc221,tlfc222,tlfc2231,tlfc2232,tlfc224,tlfc2241,tlfc2242,tlfc2243,0",
                 "  FROM tlf_file LEFT OUTER JOIN tlfc_file ON tlf01=tlfc01 AND tlf06=tlfc06 AND tlf02=tlfc02 AND tlf03 = tlfc03 AND tlf13=tlfc13 AND tlf13=tlfc13 AND tlf902=tlfc902 AND tlf903=tlfc903 AND tlf904=tlfc904 AND tlf907=tlfc907 AND tlf905=tlfc905 AND tlf906=tlfc906,ima_file,sfb_file  ",
                 " WHERE ima01 = tlf01 and tlf62=sfb01",
                 "   AND sfb02!=11",
                 "   AND (tlf13 = 'asft6201' OR tlf13='asft6101' ",
                 "    OR  tlf13 = 'asft6231' OR tlf13='asft660' )",
                 "   AND ",p_wc CLIPPED,
                 "   AND tlf902 NOT IN (SELECT jce02 FROM jce_file)"

     PREPARE axcq772_prepare1 FROM l_sql
     IF STATUS THEN CALL cl_err('prepare:',STATUS,1)
        CALL cl_used(g_prog,g_time,2) RETURNING g_time
        EXIT PROGRAM
     END IF
     DECLARE axcq772_curs1 CURSOR FOR axcq772_prepare1

     CALL g_tlf.clear()
     LET g_cnt = 1

     FOREACH axcq772_curs1 INTO g_tlf[g_cnt].*
       IF SQLCA.sqlcode THEN
          CALL cl_err('FOREACH:',SQLCA.sqlcode,1)
          EXIT FOREACH
       END IF
       IF  cl_null(g_tlf[g_cnt].amt01)  THEN LET g_tlf[g_cnt].amt01=0 END IF
       IF  cl_null(g_tlf[g_cnt].amt02)  THEN LET g_tlf[g_cnt].amt02=0 END IF
       IF  cl_null(g_tlf[g_cnt].amt03)  THEN LET g_tlf[g_cnt].amt03=0 END IF
       IF  cl_null(g_tlf[g_cnt].amt04)  THEN LET g_tlf[g_cnt].amt04=0 END IF
       IF  cl_null(g_tlf[g_cnt].amt05)  THEN LET g_tlf[g_cnt].amt05=0 END IF
       IF  cl_null(g_tlf[g_cnt].amt07)  THEN LET g_tlf[g_cnt].amt07=0 END IF
       IF  cl_null(g_tlf[g_cnt].amt08)  THEN LET g_tlf[g_cnt].amt08=0 END IF
       IF  cl_null(g_tlf[g_cnt].amt09)  THEN LET g_tlf[g_cnt].amt09=0 END IF
       LET g_tlf[g_cnt].amt06 = g_tlf[g_cnt].amt01 + g_tlf[g_cnt].amt02 + g_tlf[g_cnt].amt03 + g_tlf[g_cnt].amt04
                              + g_tlf[g_cnt].amt05 + g_tlf[g_cnt].amt07 + g_tlf[g_cnt].amt08 + g_tlf[g_cnt].amt09
       IF  cl_null(g_tlf[g_cnt].amt06)  THEN LET g_tlf[g_cnt].amt06=0 END IF
       LET g_cnt = g_cnt + 1
       #IF g_cnt > g_max_rec THEN
       #   CALL cl_err( '', 9035, 0 )
       #	        EXIT FOREACH
       #END IF #170215 mark by zhangtn
     END FOREACH

   CALL g_tlf.deleteElement(g_cnt)
   # add by lixwz 171127 s
   # 加上 axcq410 结存的金额
   # 此部分要是有问题，请直接联系我，或者直接删掉重写吧
   LET g_wc = cl_replace_str(g_wc,'between','BETWEEN')
   LET tok = base.StringTokenizer.create(g_wc,"tlf")
   LET l_cnt = 1
   LET l_wc = " 1=1"
   WHILE tok.hasMoreTokens()
     LET  l_tok[l_cnt] = tok.nextToken()
     CASE
        WHEN (l_tok[l_cnt] MATCHES '031*')
            LET l_chk = 'N'
            EXIT WHILE
        WHEN (l_tok[l_cnt] MATCHES '06*')
            # 日期
            # 暂不考虑
            LET l_date_t = l_tok[l_cnt]
            CASE
                WHEN (l_date_t MATCHES '*BETWEEN*')
                    LET l_date = " ccg02= ",l_date_t[21,24] CLIPPED," and ccg03 >=",l_date_t[26,27] CLIPPED,
                                     " and ccg03 <=",l_date_t[85,86] CLIPPED
                    EXIT CASE
                OTHERWISE
                    IF l_date_t[6,7] MATCHES '*T*' THEN
                        LET l_date = " ccg02=",l_date_t[21,24] CLIPPED," and ccg03",l_date_t[6,6] CLIPPED,l_date_t[21,22] CLIPPED
                    ELSE
                        LET l_date = " ccg02=",l_date_t[21,24] CLIPPED," and ccg03",l_date_t[6,7] CLIPPED,l_date_t[21,22] CLIPPED
                    END IF
            END CASE
        WHEN (l_tok[l_cnt] MATCHES '036*')
            LET l_chk = 'N'
            EXIT WHILE
        WHEN (l_tok[l_cnt] MATCHES '62*')
            # 工单
            LET l_tok[l_cnt] =cl_replace_str(l_tok[l_cnt],'and','')
            LET l_wc = l_wc CLIPPED," and ",cl_replace_str(l_tok[l_cnt],"62","ccg01") CLIPPED
        WHEN (l_tok[l_cnt] MATCHES '01*')
            # 料号
            LET l_tok[l_cnt] =cl_replace_str(l_tok[l_cnt],'and','')
            LET l_wc = l_wc CLIPPED," and ",cl_replace_str(l_tok[l_cnt],"01","ccg04") CLIPPED
        OTHERWISE
     END CASE
   END WHILE
   IF cl_null (l_wc) THEN LET l_wc = ' 1=1' END IF
   IF cl_null (l_date) THEN LET l_date = ' 1=1' END IF
   LET l_sql = " SELECT '',case when ccg03<10 then  to_date(substr(ccg02,3,2)||'0'||ccg03||'01','yy/mm/dd') else to_date(substr(ccg02,3,2)||ccg03||'01','yy/mm/dd') end,",
               " '',ccg01,ccg04,ima02,ima021,'',ccg31,ccg32*-1,0,0,0,0,0,0,0,0 FROM ccg_file,ima_file",
               " WHERE ima01 = ccg04 and ccg31 =0 and ccg32 <> 0 and ",l_wc CLIPPED," and ",l_date CLIPPED

   PREPARE axcq772_prepare2 FROM l_sql
     IF STATUS THEN CALL cl_err('prepare:',STATUS,1)
        CALL cl_used(g_prog,g_time,2) RETURNING g_time
        EXIT PROGRAM
     END IF
   DECLARE axcq772_curs2 CURSOR FOR axcq772_prepare2

   FOREACH axcq772_curs2 INTO g_tlf[g_cnt].*
     IF SQLCA.sqlcode THEN
        CALL cl_err('FOREACH:',SQLCA.sqlcode,1)
        EXIT FOREACH
     END IF
     IF  cl_null(g_tlf[g_cnt].amt01)  THEN LET g_tlf[g_cnt].amt01=0 END IF
     IF  cl_null(g_tlf[g_cnt].amt02)  THEN LET g_tlf[g_cnt].amt02=0 END IF
     IF  cl_null(g_tlf[g_cnt].amt03)  THEN LET g_tlf[g_cnt].amt03=0 END IF
     IF  cl_null(g_tlf[g_cnt].amt04)  THEN LET g_tlf[g_cnt].amt04=0 END IF
     IF  cl_null(g_tlf[g_cnt].amt05)  THEN LET g_tlf[g_cnt].amt05=0 END IF
     IF  cl_null(g_tlf[g_cnt].amt07)  THEN LET g_tlf[g_cnt].amt07=0 END IF
     IF  cl_null(g_tlf[g_cnt].amt08)  THEN LET g_tlf[g_cnt].amt08=0 END IF
     IF  cl_null(g_tlf[g_cnt].amt09)  THEN LET g_tlf[g_cnt].amt09=0 END IF
     LET g_tlf[g_cnt].amt06 = g_tlf[g_cnt].amt01 + g_tlf[g_cnt].amt02 + g_tlf[g_cnt].amt03 + g_tlf[g_cnt].amt04
                            + g_tlf[g_cnt].amt05 + g_tlf[g_cnt].amt07 + g_tlf[g_cnt].amt08 + g_tlf[g_cnt].amt09
     IF  cl_null(g_tlf[g_cnt].amt06)  THEN LET g_tlf[g_cnt].amt06=0 END IF
     LET g_cnt = g_cnt + 1
   END FOREACH
   # add by lixwz 171127 e
   #LET g_rec_b = g_cnt-1
   #DISPLAY g_rec_b TO FORMONLY.cn2
   #LET g_cnt = 0
   LET g_cnt = g_cnt-1
   DISPLAY g_cnt TO FORMONLY.cn2
   LET g_cnt = 0    # mod by lixwz 171127

END FUNCTION

FUNCTION q772_bp(p_ud)
DEFINE   p_ud   LIKE type_file.chr1

   IF p_ud <> "G" OR g_action_choice = "detail" THEN
      RETURN
   END IF
   LET g_action_choice = " "

   CALL cl_set_act_visible("accept,cancel", FALSE)
   DISPLAY ARRAY g_tlf TO s_tlf.* ATTRIBUTE(COUNT=g_rec_b,UNBUFFERED)

      BEFORE ROW
         LET l_ac = ARR_CURR()

      ON ACTION query
         LET g_action_choice="query"
         EXIT DISPLAY


      ON ACTION help
         LET g_action_choice="help"
         EXIT DISPLAY

      ON ACTION locale
         CALL cl_dynamic_locale()

      ON ACTION exit
         LET g_action_choice="exit"
         EXIT DISPLAY

      ON ACTION controlg
         LET g_action_choice="controlg"
         EXIT DISPLAY

      ON ACTION accept
         LET g_action_choice="detail"
         LET l_ac = ARR_CURR()
         EXIT DISPLAY

      ON ACTION cancel
         LET g_action_choice="exit"
         EXIT DISPLAY

      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY

      ON ACTION about
         CALL cl_about()

      ON ACTION exporttoexcel
         LET g_action_choice = 'exporttoexcel'
         EXIT DISPLAY

      ON ACTION controls
         CALL cl_set_head_visible("","AUTO")
   END DISPLAY
   CALL cl_set_act_visible("accept,cancel", TRUE)
END FUNCTION

