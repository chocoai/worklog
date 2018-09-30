# Prog. Version..: '5.25.08-12.05.10(00010)'     #
#
# Pattern name...: cglr901.4gl
# Descriptions...: ---
# Date & Author..: 2018/02/12  By  lixwz180212

DATABASE ds

GLOBALS "../../../tiptop/config/top.global"
    DEFINE g_wc string  #No.FUN-580092 HCN
   DEFINE tm          RECORD
                      yy      LIKE type_file.chr4,
                      mm      LIKE type_file.chr2,
                      mon2    LIKE type_file.chr2,
                      confirm LIKE type_file.chr1,
                      post    LIKE type_file.chr1
                      END RECORD

   DEFINE tm1         RECORD
                      project  LIKE type_file.chr1,
                      subject  LIKE type_file.chr1,
                      depart   LIKE type_file.chr1
                      END RECORD

   DEFINE sr1             RECORD
          mon               LIKE afc_file.afc05,
          budget            LIKE afc_file.afc06
                      END RECORD
   DEFINE g_orderA       ARRAY[2] OF LIKE type_file.chr20     #No.FUN-680098  VARCHAR(10)
   DEFINE g_bookno       LIKE aaa_file.aaa01   #No.FUN-670039
   DEFINE g_base         LIKE type_file.num10  #No.FUN-680098  integer
DEFINE   g_aaa03         LIKE aaa_file.aaa03
DEFINE   g_i             LIKE type_file.num5  #count/index for any purpose #No.FUN-680098smallint
DEFINE   g_msg           LIKE type_file.chr1000   #No.FUN-680098 VARCHAR(72)
DEFINE   l_table         STRING                   #No.FUN-830100
DEFINE   g_sql           STRING                   #No.FUN-830100
DEFINE   g_str           STRING                   #No.FUN-830100
DEFINE   g_traqh         DYNAMIC ARRAY OF RECORD
            traqh_code            LIKE tc_afc_file.tc_afc04,
            description           LIKE type_file,cht100,
            mtd_a                 LIKE afc_file.afc08, #本期别差异
            mtd_b                 LIKE afc_file.afc08,
            mtd_diff              LIKE afc_file.afc08,
            mtd_diff_percent      LIKE type_file.num5,
            qtd_a                 LIKE afc_file.afc08, #本季度差异
            qtd_b                 LIKE afc_file.afc08,
            qtd_diff              LIKE afc_file.afc08,
            qtd_diff_percent      LIKE type_file.num5,
            btd_a                 LIKE afc_file.afc08, #预算和实际差异
            btd_b                 LIKE afc_file.afc08,
            btd_diff              LIKE afc_file.afc08,
            btd_diff_percent      LIKE type_file.num5,
            ytd_a                 LIKE afc_file.afc08, #本年度差异
            ytd_b                 LIKE afc_file.afc08,
            ytd_diff              LIKE afc_file.afc08,
            ytd_diff_percent      LIKE type_file.num5,
         END RECORD

MAIN
   OPTIONS
       INPUT NO WRAP
   DEFER INTERRUPT                    # Supress DEL key function

   IF (NOT cl_user()) THEN
      EXIT PROGRAM
   END IF

   WHENEVER ERROR CALL cl_err_msg_log

   IF (NOT cl_setup("CGL")) THEN
      EXIT PROGRAM
   END IF
   CALL cl_used(g_prog,g_time,1) RETURNING g_time #No.FUN-690123

   #str FUN-720005 add
   ## *** 與 Crystal Reports 串聯段 - <<<< 產生Temp Table >>>> FUN-720005 *** ##
   LET g_sql = "traqh_code.tc_afc_file.tc_afc04,",
               "description.type_file,cht100,",
               "mtd_a.afc_file.afc08,",
               "mtd_b.afc_file.afc08,",
               "mtd_diff.afc_file.afc08,",
               "mtd_diff_percent.type_file.num5,",
               "qtd_a.afc_file.afc08,",
               "qtd_b.afc_file.afc08,",
               "qtd_diff.afc_file.afc08,",
               "qtd_diff_percent.type_file.num5,",
               "btd_a.afc_file.afc08,",
               "btd_b.afc_file.afc08,",
               "btd_diff.afc_file.afc08,",
               "btd_diff_percent.type_file.num5,",
               "ytd_a.afc_file.afc08,",
               "ytd_b.afc_file.afc08,",
               "ytd_diff.afc_file.afc08,",
               "ytd_diff_percent.type_file.num5",

   LET l_table = cl_prt_temptable('cglr901',g_sql) CLIPPED   # 產生Temp Table
   IF l_table = -1 THEN EXIT PROGRAM END IF                  # Temp Table產生
   LET g_sql = "INSERT INTO ",g_cr_db_str CLIPPED,l_table CLIPPED,
               " VALUES(?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?,  ,?,?,?)"

   PREPARE insert_prep FROM g_sql
   IF STATUS THEN
      CALL cl_err('insert_prep:',status,1) EXIT PROGRAM
   END IF
   #------------------------------ CR (1) ------------------------------#
   #end FUN-720005 add

   LET g_pdate = ARG_VAL(1)           # Get arguments from command line
   LET g_towhom = ARG_VAL(2)
   LET g_rlang = ARG_VAL(3)
   LET g_bgjob = ARG_VAL(4)
   LET g_prtway = ARG_VAL(5)
   LET g_copies = ARG_VAL(6)
   LET g_bookno = g_aza.aza81
  # LET tm.wc = ARG_VAL(7)
   #TQC-610080-begin
   LET g_rep_user = ARG_VAL(8)
   LET g_rep_clas = ARG_VAL(9)
   LET g_template = ARG_VAL(10)
   #LET tm.more  = ARG_VAL(8)
   ##No.FUN-570264 --start--
   #LET g_rep_user = ARG_VAL(9)
   #LET g_rep_clas = ARG_VAL(10)
   #LET g_template = ARG_VAL(11)
   LET g_rpt_name = ARG_VAL(12)  #No.FUN-7C0078
   ##No.FUN-570264 ---end---
   #TQC-610080-end
   IF cl_null(g_bgjob) OR g_bgjob = 'N'   # If background job sw is off
      THEN CALL cglr901_tm()        # Input print condition
      ELSE CALL cglr901()              # Read data and create out-file
   END IF
   CALL cl_used(g_prog,g_time,2) RETURNING g_time #No.FUN-690123
END MAIN

FUNCTION cglr901_tm()
DEFINE lc_qbe_sn      LIKE gbm_file.gbm01
   DEFINE l_n            LIKE type_file.num5,
          l_flag         LIKE type_file.num5,
          p_row,p_col    LIKE type_file.num5,
          l_cmd          LIKE type_file.chr1000
   DEFINE l_str          STRING

   LET p_row = 5 LET p_col = 20

   OPEN WINDOW cglr901_w AT p_row,p_col WITH FORM "cgl/42f/cglr901"
         ATTRIBUTE (STYLE = g_win_style CLIPPED) #No.FUN-580092 HCN

   CALL cl_ui_init()

   CALL cl_opmsg('p')
   INITIALIZE tm.*    TO NULL
   INITIALIZE tm1.*    TO NULL
   INITIALIZE l_str   TO NULL
   LET g_pdate = g_today
   LET g_rlang = g_lang
   LET g_bgjob = 'N'
   LET g_copies= '1'

   CONSTRUCT BY NAME g_wc ON afb01,afb041,afb02
            BEFORE CONSTRUCT
               ON ACTION CONTROLP
                    CASE
                        WHEN INFIELD(afb01)
                            CALL cl_init_qry_var()
                           #LET g_qryparam.form = "q_afa"               #MOD-BA0180 mark
                            LET g_qryparam.form = "q_azf01a"            #MOD-BA0180 add
                            LET g_qryparam.state= 'c'
                            LET g_qryparam.arg1 = '7'                   #MOD-BA0180 add
                        #   LET g_qryparam.construct ='N'   #FUN-B40025 MARK
                            CALL cl_create_qry() RETURNING g_qryparam.multiret
                            DISPLAY g_qryparam.multiret TO afb01
                            NEXT FIELD afb01
                        WHEN INFIELD(afb041)
                            CALL cl_init_qry_var()
                            LET g_qryparam.form = "q_gem"
                            LET g_qryparam.state= 'c'
                            CALL cl_create_qry() RETURNING g_qryparam.multiret
                            DISPLAY g_qryparam.multiret TO afb041
                            NEXT FIELD afb041
                        WHEN INFIELD(afb02)
                            CALL cl_init_qry_var()
                            LET g_qryparam.form = "q_aag11"
                            LET g_qryparam.state= 'c'
                        #   LET g_qryparam.construct ='N'   #FUN-B40025 MARK
                            CALL cl_create_qry() RETURNING g_qryparam.multiret
                            DISPLAY g_qryparam.multiret TO afb02
                            NEXT FIELD afb02
                    END CASE

               ON ACTION CONTROLZ
                  CALL cl_show_req_fields()

               ON ACTION CONTROLG
                  CALL cl_cmdask()

               ON IDLE g_idle_seconds
                  CALL cl_on_idle()
                  CONTINUE CONSTRUCT

               ON ACTION about
                  CALL cl_about()

               ON ACTION help
                  CALL cl_show_help()

               ON ACTION exit
                  LET INT_FLAG = 1
                  EXIT CONSTRUCT
         END CONSTRUCT
         IF INT_FLAG THEN
            CLOSE WINDOW cglr901_w
            RETURN
         END IF

         INPUT BY NAME tm.*
               ATTRIBUTES( WITHOUT DEFAULTS = TRUE)

               BEFORE INPUT
                  SELECT aaa04,aaa05 INTO tm.yy,tm.mon2
                    FROM aaa_file
                   WHERE aaa01 = g_bookno
                  LET tm.mon1 = 1
                  LET tm.confirm = 'Y'
                  LET tm.post = 'Y'
                  DISPLAY BY NAME tm.*
               AFTER FIELD yy
                  IF NOT cl_null(tm.yy) THEN
                     IF tm.yy < 1990 OR tm.yy > 3000 THEN
                       CALL cl_err('','aoo-020',1)
                       NEXT FIELD yy
                     END IF
                  END IF
               AFTER FIELD mon1
###-FUN-B40025- ADD - BEGIN -------------------------------------------
                  IF NOT cl_null(tm.mon1) THEN
                     IF tm.mon1 > 12 OR tm.mon1 < 1 THEN
                        CALL cl_err('','aom-580',1)
                        NEXT FIELD mon1
                     END IF
                  END IF
###-FUN-B40025- ADD -  END  -------------------------------------------
                  IF NOT cl_null(tm.mon1) AND NOT cl_null(tm.mon2) THEN
                     IF tm.mon1 > tm.mon2 THEN
                        CALL cl_err('','aps-725',1)
                        NEXT FIELD mon1
                     END IF
                  END IF
               AFTER FIELD mon2
###-FUN-B40025- ADD - BEGIN -------------------------------------------
                  IF NOT cl_null(tm.mon2) THEN
                     IF tm.mon2 > 12 OR tm.mon2 < 1 THEN
                        CALL cl_err('','aom-580',1)
                        NEXT FIELD mon2
                     END IF
                  END IF
###-FUN-B40025- ADD -  END  -------------------------------------------
                  IF NOT cl_null(tm.mon1) AND NOT cl_null(tm.mon2) THEN
                     IF tm.mon1 > tm.mon2 THEN
                        CALL cl_err('','aps-725',1)
                        NEXT FIELD mon2
                     END IF
                  END IF

               ON ACTION CONTROLZ
                  CALL cl_show_req_fields()

               ON ACTION CONTROLG
                  CALL cl_cmdask()

               ON IDLE g_idle_seconds
                  CALL cl_on_idle()
                  CONTINUE INPUT

               ON ACTION about
                  CALL cl_about()

               ON ACTION help
                  CALL cl_show_help()

               ON ACTION exit
                  LET INT_FLAG = 1
                  EXIT INPUT

         END INPUT
         IF INT_FLAG THEN
            CLOSE WINDOW cglr901_w
            RETURN
         END IF

     IF g_bgjob = 'Y' THEN
        SELECT zz08 INTO l_cmd FROM zz_file    #get exec cmd (fglgo xxxx)
               WHERE zz01='cglr901'
        IF SQLCA.sqlcode OR l_cmd IS NULL THEN
           CALL cl_err('cglr901','9031',1)
        ELSE
       #    LET tm.wc=cl_replace_str(tm.wc, "'", "\"")
           LET l_cmd = l_cmd CLIPPED,        #(at time fglgo xxxx p1 p2 p3)
                           " '",g_pdate CLIPPED,"'",
                           " '",g_towhom CLIPPED,"'",
                           #" '",g_lang CLIPPED,"'", #No.FUN-7C0078
                         " '",g_rlang CLIPPED,"'", #No.FUN-7C0078
                           " '",g_bgjob CLIPPED,"'",
                           " '",g_prtway CLIPPED,"'",
                           " '",g_copies CLIPPED,"'",
        #                   " '",tm.wc CLIPPED,"'",
                          #" '",tm.more CLIPPED,"'",           #TQC-610080
                           " '",g_rep_user CLIPPED,"'",        #No.FUN-570264
                           " '",g_rep_clas CLIPPED,"'",        #No.FUN-570264
                           " '",g_template CLIPPED,"'",        #No.FUN-570264
                         " '",g_rpt_name CLIPPED,"'"            #No.FUN-7C0078

           CALL cl_cmdat('cglr901',g_time,l_cmd)    # Execute cmd at later time
        END IF
        CLOSE WINDOW cglr901_w
        CALL cl_used(g_prog,g_time,2) RETURNING g_time #No.FUN-690123
        EXIT PROGRAM
     END IF
     CALL cl_wait()
     CALL cglr901()
     ERROR ""
   CLOSE WINDOW cglr901_w
END FUNCTION

FUNCTION cglr901()
    DEFINE l_name    LIKE type_file.chr20,        # External(Disk) file name  #No.FUN-680098 VARCHAR(20)
#       l_time          LIKE type_file.chr8        #No.FUN-6A0073
          l_sql     LIKE type_file.chr1000,      # RDSQL STATEMENT  #No.FUN-680098 VARCHAR(1000)
          l_sql1    LIKE type_file.chr1000,
          l_chr     LIKE type_file.chr1,         #No.FUN-680098  VARCHAR(1)
          l_yy      LIKE type_file.chr4,
          l_sma52   LIKE sma_file.sma52,
          l_order   ARRAY[2] OF LIKE aag_file.aag223,  #No.FUN-680098 VARCHAR(04)
          sr               RECORD
              prono        LIKE  afb_file.afb01,
              proname      LIKE  afa_file.afa02,
              rc           LIKE  tc_afa_file.tc_afa04,
              sc           LIKE  tc_afa_file.tc_afa02,
              division     LIKE  tc_afa_file.tc_afa03,
              subno        LIKE  aag_file.aag01,
              subname      LIKE  aag_file.aag02,
              depno        LIKE  gem_file.gem01,
              depname      LIKE  gem_file.gem02,
              ld           LIKE  type_file.chr50,
              traqh_code   LIKE  tc_afc_file.tc_afc04,   # add by lixwz180212
              month_b1      LIKE afc_file.afc06,
              month_p1      LIKE abb_file.abb07,
              month_o1      LIKE afc_file.afc06,
              month_b2      LIKE afc_file.afc06,
              month_p2      LIKE abb_file.abb07,
              month_o2      LIKE afc_file.afc06,
              month_b3      LIKE afc_file.afc06,
              month_p3      LIKE abb_file.abb07,
              month_o3      LIKE afc_file.afc06,
              month_b4      LIKE afc_file.afc06,
              month_p4      LIKE abb_file.abb07,
              month_o4      LIKE afc_file.afc06,
              month_b5      LIKE afc_file.afc06,
              month_p5      LIKE abb_file.abb07,
              month_o5      LIKE afc_file.afc06,
              month_b6      LIKE afc_file.afc06,
              month_p6      LIKE abb_file.abb07,
              month_o6      LIKE afc_file.afc06,
              month_b7      LIKE afc_file.afc06,
              month_p7      LIKE abb_file.abb07,
              month_o7      LIKE afc_file.afc06,
              month_b8      LIKE afc_file.afc06,
              month_p8      LIKE abb_file.abb07,
              month_o8      LIKE afc_file.afc06,
              month_b9      LIKE afc_file.afc06,
              month_p9      LIKE abb_file.abb07,
              month_o9      LIKE afc_file.afc06,
              month_b10     LIKE afc_file.afc06,
              month_p10     LIKE abb_file.abb07,
              month_o10      LIKE afc_file.afc06,
              month_b11     LIKE afc_file.afc06,
              month_p11     LIKE abb_file.abb07,
              month_o11      LIKE afc_file.afc06,
              month_b12     LIKE afc_file.afc06,
              month_p12     LIKE abb_file.abb07,
              month_o12     LIKE afc_file.afc06,
              ytd           LIKE afc_file.afc06,
              fullyear      LIKE afc_file.afc06,
              ytd_bu        LIKE afc_file.afc06,  #add by pane 170313
              diff          LIKE afc_file.afc06   #add by pane 170313
                        END RECORD
     DEFINE ll_aae02 LIKE aae_file.aae02             #No.FUN-830100
     DEFINE l_aae02 LIKE aae_file.aae02              #No.FUN-830100

     CALL cl_del_data(l_table)                       #No.FUN-830100
  #   SELECT aaf03 INTO g_company FROM aaf_file WHERE aaf01 = tm.bookno   #No.FUN-740020
 #                       AND aaf02 = g_rlang


  #   LET g_wc = g_wc CLIPPED,cl_get_extra_cond('afbuser', 'afbgrup')
     #End:FUN-980030

      LET l_sql = "SELECT DISTINCT afb01,'','','','',afb02,aag02,afb041,gem02,  ",   #FUN-B40025 ADD
               " NVL(tc_afc04,' ') ,'' ,", # add by lixwz180212
               "'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0',",
               "'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0',",
               "'0','0','0','0','0','0','0','0','0','0' ",   #add '0','0' BY pane 170313
#              " FROM afa_file,afb_file,aag_file,gem_file",                       #FUN-B40025 MARK
               # mod by lixwz180212 s---
               #"  FROM ((afb_file LEFT OUTER JOIN azf_file                   ",
               "  FROM ((afb_file LEFT JOIN tc_afc_file ON tc_afc01 = afb02  ",
               "  AND tc_afc02 = afb041 LEFT OUTER JOIN azf_file ",
               # mod by lixwz180212 e---   #FUN-B40025 ADD
               "    ON azf01 = afb01 AND azf02 = '2' AND azfacti = 'Y')      ",   #FUN-B40025 ADD
               "  LEFT OUTER JOIN gem_file ON afb041 = gem01)                ",   #FUN-B40025 ADD
               "  LEFT OUTER JOIN aag_file ON aag00 = afb00 AND aag01 = afb02",   #FUN-B40025 ADD
#              " WHERE afb01 = afa01 AND aag01 = afb02 AND afb041 = gem01",       #FUN-B40025 MARK
               " WHERE ",g_wc CLIPPED," AND afb00 = '",g_bookno,"'",              #FUN-B40025 ADD
#              " AND ",g_wc CLIPPED," AND afb00 = '",g_bookno,"'",                #FUN-B40025 MARK
               " AND afb03 = '",tm.yy,"'"
   PREPARE cglr901_c FROM l_sql
   IF SQLCA.sqlcode != 0 THEN
      CALL cl_err('cglr901_c',SQLCA.sqlcode,1)
      RETURN
   END IF
   DECLARE cglr901_cs CURSOR FOR cglr901_c
   FOREACH cglr901_cs INTO sr.*
      IF SQLCA.sqlcode THEN
         CALL cl_err('cglr901_cs foreach:',SQLCA.sqlcode,0)
         EXIT FOREACH
      END IF
      LET l_sql1 = "SELECT afc05,",
                   "sum(COALESCE(afc06,0)-COALESCE(afc08,0)+COALESCE(afc09,0))",
                   " FROM afc_file",
                   " WHERE afc00 = '",g_bookno,"' AND afc01 = '",sr.prono,"'",
                   " AND afc02 = '",sr.subno,"'",
                   " AND afc041 = '",sr.depno,"'",
                   " AND afc03 = '",tm.yy,"'",
                   " AND afc05 BETWEEN '",tm.mon1,"' AND '",tm.mon2,"'",
                   " GROUP BY afc05"
      PREPARE cglr901_c1 FROM l_sql1
      IF SQLCA.sqlcode != 0 THEN
         CALL cl_err('cglr901_c1',SQLCA.sqlcode,1)
         RETURN
      END IF
      DECLARE cglr901_cs1 CURSOR FOR cglr901_c1
      FOREACH cglr901_cs1 INTO sr1.*
         IF SQLCA.sqlcode THEN
            CALL cl_err('cglr901_cs1 foreach:',SQLCA.sqlcode,0)
            EXIT FOREACH
         END IF
         LET l_yy = tm.yy - 1
         CASE sr1.mon
            WHEN 1
               LET sr.month_b1 = sr1.budget
               LET sr.month_p1 = p_calc(sr.prono,sr.subno,sr.depno,tm.yy,sr1.mon)
               LET sr.month_o1 = p_calc(sr.prono,sr.subno,sr.depno,l_yy,sr1.mon)

            WHEN 2
               LET sr.month_b2 = sr1.budget
               LET sr.month_p2 = p_calc(sr.prono,sr.subno,sr.depno,tm.yy,sr1.mon)
               LET sr.month_o2 = p_calc(sr.prono,sr.subno,sr.depno,l_yy,sr1.mon)
            WHEN 3
               LET sr.month_b3 = sr1.budget
               LET sr.month_p3 = p_calc(sr.prono,sr.subno,sr.depno,tm.yy,sr1.mon)
               LET sr.month_o3 = p_calc(sr.prono,sr.subno,sr.depno,l_yy,sr1.mon)

            WHEN 4
               LET sr.month_b4 = sr1.budget
               LET sr.month_p4 = p_calc(sr.prono,sr.subno,sr.depno,tm.yy,sr1.mon)
               LET sr.month_o4 = p_calc(sr.prono,sr.subno,sr.depno,l_yy,sr1.mon)

            WHEN 5
               LET sr.month_b5 = sr1.budget
               LET sr.month_p5 = p_calc(sr.prono,sr.subno,sr.depno,tm.yy,sr1.mon)
               LET sr.month_o5 = p_calc(sr.prono,sr.subno,sr.depno,l_yy,sr1.mon)

            WHEN 6
               LET sr.month_b6 = sr1.budget
               LET sr.month_p6 = p_calc(sr.prono,sr.subno,sr.depno,tm.yy,sr1.mon)
               LET sr.month_o6 = p_calc(sr.prono,sr.subno,sr.depno,l_yy,sr1.mon)

            WHEN 7
               LET sr.month_b7 = sr1.budget
               LET sr.month_p7 = p_calc(sr.prono,sr.subno,sr.depno,tm.yy,sr1.mon)
               LET sr.month_o7 = p_calc(sr.prono,sr.subno,sr.depno,l_yy,sr1.mon)

            WHEN 8
               LET sr.month_b8 = sr1.budget
               LET sr.month_p8 = p_calc(sr.prono,sr.subno,sr.depno,tm.yy,sr1.mon)
               LET sr.month_o8 = p_calc(sr.prono,sr.subno,sr.depno,l_yy,sr1.mon)

            WHEN 9
               LET sr.month_b9 = sr1.budget
               LET sr.month_p9 = p_calc(sr.prono,sr.subno,sr.depno,tm.yy,sr1.mon)
               LET sr.month_o9 = p_calc(sr.prono,sr.subno,sr.depno,l_yy,sr1.mon)

            WHEN 10
               LET sr.month_b10 = sr1.budget
               LET sr.month_p10 = p_calc(sr.prono,sr.subno,sr.depno,tm.yy,sr1.mon)
               LET sr.month_o10 = p_calc(sr.prono,sr.subno,sr.depno,l_yy,sr1.mon)

            WHEN 11
               LET sr.month_b11 = sr1.budget
               LET sr.month_p11 = p_calc(sr.prono,sr.subno,sr.depno,tm.yy,sr1.mon)
               LET sr.month_o11 = p_calc(sr.prono,sr.subno,sr.depno,l_yy,sr1.mon)

            WHEN 12
               LET sr.month_b12 = sr1.budget
               LET sr.month_p12 = p_calc(sr.prono,sr.subno,sr.depno,tm.yy,sr1.mon)
               LET sr.month_o12 = p_calc(sr.prono,sr.subno,sr.depno,l_yy,sr1.mon)

         END CASE
         INITIALIZE sr1.* TO NULL
      END FOREACH
      SELECT tc_afa04,tc_afa02,tc_afa03 INTO sr.rc,sr.sc,sr.division FROM tc_afa_file WHERE tc_afa01=sr.depno
         SELECT sma52 INTO l_sma52 FROM sma_file
         CASE l_sma52

             WHEN 1
               LET sr.ytd = sr.month_p1
               LET sr.fullyear = sr.ytd+sr.month_b2+sr.month_b3+sr.month_b4+sr.month_b5+sr.month_b6+sr.month_b7+sr.month_b8+sr.month_b9+sr.month_b10+sr.month_b11+sr.month_b12
               LET sr.ytd_bu  = sr.month_b1   #add by pane 170313
               LET sr.diff = sr.ytd_bu - sr.ytd #add by pane 170313

             WHEN 2
               LET sr.ytd = sr.month_p1+sr.month_p2
               LET sr.fullyear = sr.ytd+sr.month_b3+sr.month_b4+sr.month_b5+sr.month_b6+sr.month_b7+sr.month_b8+sr.month_b9+sr.month_b10+sr.month_b11+sr.month_b12
               LET sr.ytd_bu = sr.month_b1+sr.month_b2  #add by pane 170313
               LET sr.diff = sr.ytd_bu - sr.ytd #add by pane 170313

             WHEN 3
               LET sr.ytd = sr.month_p1+sr.month_p2+sr.month_p3
               LET sr.fullyear = sr.ytd+sr.month_b4+sr.month_b5+sr.month_b6+sr.month_b7+sr.month_b8+sr.month_b9+sr.month_b10+sr.month_b11+sr.month_b12
               LET sr.ytd_bu = sr.month_b1+sr.month_b2+sr.month_b3   #add by pane 170313
               LET sr.diff = sr.ytd_bu - sr.ytd #add by pane 170313

             WHEN 4
               LET sr.ytd = sr.month_p1+sr.month_p2+sr.month_p3+sr.month_p4
               LET sr.fullyear = sr.ytd+sr.month_b5+sr.month_b6+sr.month_b7+sr.month_b8+sr.month_b9+sr.month_b10+sr.month_b11+sr.month_b12
               LET sr.ytd_bu = sr.month_b1+sr.month_b2+sr.month_b3+sr.month_b4   #add by pane 170313
               LET sr.diff = sr.ytd_bu - sr.ytd #add by pane 170313

             WHEN 5
               LET sr.ytd = sr.month_p1+sr.month_p2+sr.month_p3+sr.month_p4+sr.month_p5
               LET sr.fullyear = sr.ytd+sr.month_b6+sr.month_b7+sr.month_b8+sr.month_b9+sr.month_b10+sr.month_b11+sr.month_b12
               LET sr.ytd_bu = sr.month_b1+sr.month_b2+sr.month_b3+sr.month_b4+sr.month_b5   #add by pane 170313
               LET sr.diff = sr.ytd_bu - sr.ytd #add by pane 170313

             WHEN 6
               LET sr.ytd = sr.month_p1+sr.month_p2+sr.month_p3+sr.month_p4+sr.month_p5+sr.month_p6
               LET sr.fullyear = sr.ytd+sr.month_b7+sr.month_b8+sr.month_b9+sr.month_b10+sr.month_b11+sr.month_b12
               LET sr.ytd_bu = sr.month_b1+sr.month_b2+sr.month_b3+sr.month_b4+sr.month_b5+sr.month_b6   #add by pane 170313
               LET sr.diff = sr.ytd_bu - sr.ytd #add by pane 170313

             WHEN 7
               LET sr.ytd = sr.month_p1+sr.month_p2+sr.month_p3+sr.month_p4+sr.month_p5+sr.month_p6+sr.month_p7
               LET sr.fullyear = sr.ytd+sr.month_b8+sr.month_b9+sr.month_b10+sr.month_b11+sr.month_b12
               LET sr.ytd_bu = sr.month_b1+sr.month_b2+sr.month_b3+sr.month_b4+sr.month_b5+sr.month_b6+sr.month_b7   #add by pane 170313
               LET sr.diff = sr.ytd_bu - sr.ytd #add by pane 170313

             WHEN 8
               LET sr.ytd = sr.month_p1+sr.month_p2+sr.month_p3+sr.month_p4+sr.month_p5+sr.month_p6+sr.month_p7+sr.month_p8
               LET sr.fullyear = sr.ytd+sr.month_b9+sr.month_b10+sr.month_b11+sr.month_b12
               LET sr.ytd_bu = sr.month_b1+sr.month_b2+sr.month_b3+sr.month_b4+sr.month_b5+sr.month_b6+sr.month_b7+sr.month_b8   #add by pane 170313
               LET sr.diff = sr.ytd_bu - sr.ytd #add by pane 170313

             WHEN 9
               LET sr.ytd = sr.month_p1+sr.month_p2+sr.month_p3+sr.month_p4+sr.month_p5+sr.month_p6+sr.month_p7+sr.month_p8+sr.month_p9
               LET sr.fullyear = sr.ytd+sr.month_b10+sr.month_b11+sr.month_b12
               LET sr.ytd_bu = sr.month_b1+sr.month_b2+sr.month_b3+sr.month_b4+sr.month_b5+sr.month_b6+sr.month_b7+sr.month_b8+sr.month_b9   #add by pane 170313
               LET sr.diff = sr.ytd_bu - sr.ytd #add by pane 170313

             WHEN 10
               LET sr.ytd = sr.month_p1+sr.month_p2+sr.month_p3+sr.month_p4+sr.month_p5+sr.month_p6+sr.month_p7+sr.month_p8+sr.month_p9+sr.month_p10
               LET sr.fullyear = sr.ytd+sr.month_b11+sr.month_b12
               LET sr.ytd_bu = sr.month_b1+sr.month_b2+sr.month_b3+sr.month_b4+sr.month_b5+sr.month_b6+sr.month_b7+sr.month_b8+sr.month_b9+sr.month_b10   #add by pane 170313
               LET sr.diff = sr.ytd_bu - sr.ytd #add by pane 170313

             WHEN 11
               LET sr.ytd = sr.month_p1+sr.month_p2+sr.month_p3+sr.month_p4+sr.month_p5+sr.month_p6+sr.month_p7+sr.month_p8+sr.month_p9+sr.month_p10+sr.month_p11
               LET sr.fullyear = sr.ytd+sr.month_b12
               LET sr.ytd_bu = sr.month_b1+sr.month_b2+sr.month_b3+sr.month_b4+sr.month_b5+sr.month_b6+sr.month_b7+sr.month_b8+sr.month_b9+sr.month_b10+sr.month_b11   #add by pane 170313
               LET sr.diff = sr.ytd_bu - sr.ytd #add by pane 170313

             WHEN 12
               LET sr.ytd = sr.month_p1+sr.month_p2+sr.month_p3+sr.month_p4+sr.month_p5+sr.month_p6+sr.month_p7+sr.month_p8+sr.month_p9+sr.month_p10
+sr.month_p11+sr.month_p12
               LET sr.fullyear = sr.ytd
               LET sr.ytd_bu = sr.month_b1+sr.month_b2+sr.month_b3+sr.month_b4+sr.month_b5+sr.month_b6+sr.month_b7+sr.month_b8+sr.month_b9+sr.month_b10+sr.month_b11+sr.month_b12   #add by pane 170313
               LET sr.diff = sr.ytd_bu - sr.ytd #add by pane 170313
         END CASE


         EXECUTE insert_prep USING sr.*
        #No.FUN-830100  --end
    END FOREACH


   #str FUN-720005 add
   ## **** 與 Crystal Reports 串聯段 - <<<< CALL cs3() >>>> FUN-720005 **** ##
   LET l_sql = "SELECT * FROM ",g_cr_db_str CLIPPED,l_table CLIPPED   #FUN-710080 modify
   #是否列印選擇條件
 #  IF g_zz05 = 'Y' THEN
  #    CALL cl_wcchp(tm.wc,'sfb01,sfb05,sfa03')
  #         RETURNING tm.wc
  #    LET g_str = tm.wc
  # END IF
  CALL cl_prt_cs3('cglr901','cglr901',l_sql,g_str)   #FUN-710080 modify


  CALL  cl_used(g_prog,g_time,2) RETURNING g_time #No.MOD-580088  HCN 20050818
END FUNCTION

FUNCTION p_calc(p_prono,p_subno,p_depno,p_yy,p_mon)

   DEFINE p_prono      LIKE afb_file.afb01
   DEFINE p_subno      LIKE afb_file.afb02
   DEFINE p_depno      LIKE afb_file.afb041
   DEFINE p_yy         LIKE type_file.chr4
   DEFINE p_mon        LIKE type_file.chr2
   DEFINE l_pre        LIKE abb_file.abb07
   DEFINE l_pre1       LIKE abb_file.abb07
   DEFINE l_pre2       LIKE abb_file.abb07
   DEFINE l_com        LIKE type_file.chr1
   DEFINE l_sql_pre    LIKE type_file.chr1000
   DEFINE l_sql_pre1   LIKE type_file.chr1000
   DEFINE l_sql_pre2   LIKE type_file.chr1000
   LET l_pre  = 0
   LET l_pre1 = 0
   LET l_pre2 = 0
   LET l_sql_pre = "SELECT sum(abb07) FROM abb_file,aba_file",
                    " WHERE aba00 = abb00 AND aba01 = abb01",
                    " AND abb07 IS NOT NULL",
                    " AND aba06 <> 'CE' ",  #20110209 ADD
                    " AND aba03 = '",p_yy,"' AND abb03 = '",p_subno,"'",
                    " AND abb05 = '",p_depno,"' AND aba04 = '",p_mon,"'"
   IF  tm.confirm = 'Y' THEN
      LET l_sql_pre = l_sql_pre CLIPPED," AND aba19 = 'Y'"
   END IF
   IF  tm.post = 'Y' THEN
      LET l_sql_pre = l_sql_pre CLIPPED," AND abapost = 'Y'"
   END IF
   LET  l_sql_pre1 = l_sql_pre CLIPPED," AND abb06 = '1'"
   LET  l_sql_pre2 = l_sql_pre CLIPPED," AND abb06 = '2'"
   PREPARE pre1 FROM l_sql_pre1
   EXECUTE pre1 INTO l_pre1
   PREPARE pre2 FROM l_sql_pre2
   EXECUTE pre2 INTO l_pre2
   IF cl_null(l_pre1) THEN LET l_pre1 = 0 END IF
   IF cl_null(l_pre2) THEN LET l_pre2 = 0 END IF
   SELECT DISTINCT aag06 INTO l_com FROM aag_file
    WHERE aag00 = g_bookno
      AND aag01 = p_subno
   CASE l_com
      WHEN 1
         LET l_pre = l_pre1 - l_pre2
      WHEN 2
         LET l_pre = l_pre2 - l_pre1
   END CASE
   RETURN l_pre

END FUNCTION

# 初始化要显示的Traqh code
FUNCTION r901_init()
DEFINE

  LET g_traqh[1].tqaqh_code = '6060' LET g_traqh[1].description=  'Marketing (TV/Print/Radio)'
  LET g_traqh[2].tqaqh_code = '6061' LET g_traqh[2].description=  'Marketing (Online)'
  LET g_traqh[3].tqaqh_code = '6041' LET g_traqh[3].description=  'Coop advertising'
  LET g_traqh[4].tqaqh_code = '6042' LET g_traqh[4].description=  'Printed material'
  LET g_traqh[5].tqaqh_code = '6044' LET g_traqh[5].description=  'Digital media'
  LET g_traqh[6].tqaqh_code = '6045' LET g_traqh[6].description=  'In-store'
  LET g_traqh[7].tqaqh_code = '6046' LET g_traqh[7].description=  'Conferences and customer events'
  LET g_traqh[8].tqaqh_code = '6047' LET g_traqh[8].description=  'PR'
  LET g_traqh[9].tqaqh_code = '6048' LET g_traqh[9].description=  'Merchandising'
  LET g_traqh[10].tqaqh_code = '6049' LET g_traqh[10].description=  'Dealer/retailer contribution'
  LET g_traqh[11].tqaqh_code = '6050' LET g_traqh[11].description=  'Brand Management & Divisional Marketing staff'
  LET g_traqh[12].tqaqh_code = '6062' LET g_traqh[12].description=  'Sponsring'
  LET g_traqh[13].tqaqh_code = '6063' LET g_traqh[13].description=  'Market Insight'
  LET g_traqh[14].tqaqh_code = '6055' LET g_traqh[14].description=  'Group Brand & Marketing'
  LET g_traqh[15].tqaqh_code = '6001' LET g_traqh[15].description=  'Field sales staff'
  LET g_traqh[16].tqaqh_code = '6002' LET g_traqh[16].description=  'Inhouse sales staff'
  LET g_traqh[17].tqaqh_code = '6053' LET g_traqh[17].description=  'PM&D costs'
  LET g_traqh[18].tqaqh_code = '6003' LET g_traqh[18].description=  'Other sales staff'
  LET g_traqh[19].tqaqh_code = '6009' LET g_traqh[19].description=  'Key account organization, only retailer channel'
  LET g_traqh[20].tqaqh_code = '6010' LET g_traqh[20].description=  'IT-cost selling'
  LET g_traqh[21].tqaqh_code = '6056' LET g_traqh[21].description=  'Taxes and Levies - Selling'
  LET g_traqh[22].tqaqh_code = '6038' LET g_traqh[22].description=  'Depreciation according to plan - selling'
  LET g_traqh[23].tqaqh_code = '7963' LET g_traqh[23].description=  'Currency translation difference'
  LET g_traqh[24].tqaqh_code = '7964' LET g_traqh[24].description=  'Exchange rate difference on bank balance'
  LET g_traqh[25].tqaqh_code = '6057' LET g_traqh[25].description=  'Internal Selling cost commission'
  LET g_traqh[26].tqaqh_code = '6052' LET g_traqh[26].description=  'Other general selling expenses'
  LET g_traqh[27].tqaqh_code = '7943' LET g_traqh[27].description=  'Other income - selling'
  LET g_traqh[28].tqaqh_code = '7944' LET g_traqh[28].description=  'Other expense - selling'
  LET g_traqh[29].tqaqh_code = '7960' LET g_traqh[29].description=  'Exch diff, translating AR/AP foreign curr -Selling'
  LET g_traqh[30].tqaqh_code = '7962' LET g_traqh[30].description=  'Exch diff from hedging (FX) contracts - Selling'
  LET g_traqh[31].tqaqh_code = '6011' LET g_traqh[31].description=  'SELLING EXPENSES'

  LET g_traqh[32].tqaqh_code = '6012' LET g_traqh[32].description=  'Goodwill warranty'
  LET g_traqh[33].tqaqh_code = '6013' LET g_traqh[33].description=  'TOTAL GOODWILL GUARANTEE'

  LET g_traqh[34].tqaqh_code = '6071' LET g_traqh[34].description=  'Secondary transport income'
  LET g_traqh[35].tqaqh_code = '6014' LET g_traqh[35].description=  'Secondary transport cost'
  LET g_traqh[36].tqaqh_code = '6015' LET g_traqh[36].description=  'Handling, internal'
  LET g_traqh[37].tqaqh_code = '6016' LET g_traqh[37].description=  'Warehouse premises'
  LET g_traqh[38].tqaqh_code = '6017' LET g_traqh[38].description=  'Handling, external'
  LET g_traqh[39].tqaqh_code = '6018' LET g_traqh[39].description=  'Transport/warehouse damage'
  LET g_traqh[40].tqaqh_code = '6020' LET g_traqh[40].description=  'Other logistics expenses'
  LET g_traqh[41].tqaqh_code = '6021' LET g_traqh[41].description=  'IT-cost logistics'
  LET g_traqh[42].tqaqh_code = '6032' LET g_traqh[42].description=  'Cost D & SCM'
  LET g_traqh[43].tqaqh_code = '6033' LET g_traqh[43].description=  'Penalties related to late deliveries'
  LET g_traqh[44].tqaqh_code = '6067' LET g_traqh[44].description=  'Depreciation according to plan logistics'
  LET g_traqh[45].tqaqh_code = '6058' LET g_traqh[45].description=  'Central Allocation Warehouse'
  LET g_traqh[46].tqaqh_code = '6059' LET g_traqh[46].description=  'Central Allocation Transportation'
  LET g_traqh[47].tqaqh_code = '6068' LET g_traqh[47].description=  'Central Allocation Warehouse Germany'
  LET g_traqh[48].tqaqh_code = '6069' LET g_traqh[48].description=  'Central Allocation Transportation Germany'
  LET g_traqh[49].tqaqh_code = '6022' LET g_traqh[49].description=  'LOGISTICS EXPENSES'

  LET g_traqh[50].tqaqh_code = '6023' LET g_traqh[50].description=  'Staff, receivables, credit & collection'
  LET g_traqh[51].tqaqh_code = '6024' LET g_traqh[51].description=  'Floorplanning and factoring'
  LET g_traqh[52].tqaqh_code = '6025' LET g_traqh[52].description=  'Expense for receivables'
  LET g_traqh[53].tqaqh_code = '6034' LET g_traqh[53].description=  'Provision for bad debts'
  LET g_traqh[54].tqaqh_code = '6035' LET g_traqh[54].description=  'Release of bad debt provision'
  LET g_traqh[55].tqaqh_code = '6036' LET g_traqh[55].description=  'Write off of accounts receivables'
  LET g_traqh[56].tqaqh_code = '6026' LET g_traqh[56].description=  'TOTAL CREDIT & COLLECTION'

  LET g_traqh[57].tqaqh_code = '5001' LET g_traqh[57].description=  'IT-cost administration'
  LET g_traqh[58].tqaqh_code = '5014' LET g_traqh[58].description=  'Group Technology Office SG&A'
  LET g_traqh[59].tqaqh_code = '5002' LET g_traqh[59].description=  'Staff'
  LET g_traqh[60].tqaqh_code = '5003' LET g_traqh[60].description=  'Premises'
  LET g_traqh[61].tqaqh_code = '5013' LET g_traqh[61].description=  'Taxes and Levies - Admin'
  LET g_traqh[62].tqaqh_code = '5004' LET g_traqh[62].description=  'Other general administrative expenses'
  LET g_traqh[63].tqaqh_code = '5008' LET g_traqh[63].description=  'Amortization of intangibles assets - selling & adm'
  LET g_traqh[64].tqaqh_code = '5015' LET g_traqh[64].description=  'Amort Comp Softw & Oth IT Intagibles Sell&Admin'
  LET g_traqh[65].tqaqh_code = '5009' LET g_traqh[65].description=  'Depreciation according to plan - admin'
  LET g_traqh[66].tqaqh_code = '5016' LET g_traqh[66].description=  'Impairm./ Scapp. of Property, plant & equip. SG&A'
  LET g_traqh[67].tqaqh_code = '5017' LET g_traqh[67].description=  'Impairment/ Scrapping of Intangible FA SG&A'
  LET g_traqh[68].tqaqh_code = '5022' LET g_traqh[68].description=  'Admin costs commission'
  LET g_traqh[69].tqaqh_code = '7945' LET g_traqh[69].description=  'Other income - admin'
  LET g_traqh[70].tqaqh_code = '7946' LET g_traqh[70].description=  'Other expense - admin'
  LET g_traqh[71].tqaqh_code = '5006' LET g_traqh[71].description=  'TOTAL ADMINISTRATION'

  LET g_traqh[72].tqaqh_code = '5018' LET g_traqh[72].description=  'Staff - After Sales, Service, Spare parts'
  LET g_traqh[73].tqaqh_code = '5019' LET g_traqh[73].description=  'Service and Support'
  LET g_traqh[74].tqaqh_code = '5021' LET g_traqh[74].description=  'After sales costs commission'
  LET g_traqh[75].tqaqh_code = '5020' LET g_traqh[75].description=  'AFTER SALES, SERVICE & SPARE PARTS ADMINISTRATION'

  LET g_traqh[76].tqaqh_code = '5111' LET g_traqh[76].description=  'TOTAL SG&A EXPENSES'

END FUNCTION