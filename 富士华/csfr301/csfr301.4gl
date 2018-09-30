# Prog. Version..: '5.25.08-12.05.10(00010)'     #
#
# Pattern name...: csfr301.4gl
# Descriptions...: 工單資料列印
# Date & Author..: 92/08/14 By Nora


DATABASE ds

GLOBALS "../../../tiptop/config/top.global"

DEFINE tm  RECORD                # Print condition RECORD
            wc     STRING,                 #No.TQC-630166 VARCHAR(600) #Where condition
            sfb01  LIKE sfb_file.sfb01,
            sfb05  LIKE sfb_file.sfb05,
            sfa30  LIKE sfa_file.sfa30,
            sfa31  LIKE sfa_file.sfa31,
            a      LIKE type_file.chr1,
            b      LIKE type_file.chr1
           END RECORD

DEFINE g_count     LIKE type_file.num5     #No.FUN-680121 SMALLINT
DEFINE g_i         LIKE type_file.num5     #No.FUN-680121 SMALLINT #count/index for any purpose
DEFINE g_msg       LIKE type_file.chr1000  #No.FUN-680121 VARCHAR(72)
DEFINE g_po_no     LIKE oea_file.oea10     #No.MOD-530401
DEFINE g_ctn_no1,g_ctn_no2   LIKE type_file.chr20         #No.FUN-680121 VARCHAR(20) #MOD-530401
#No.FUN-710082--begin
DEFINE g_sql       STRING
DEFINE l_table     STRING
DEFINE l_str       STRING
#No.FUN-710082--end

MAIN
   OPTIONS
       INPUT NO WRAP
   DEFER INTERRUPT                # Supress DEL key function

   LET g_pdate = ARG_VAL(1)        # Get arguments from command line
   LET g_towhom= ARG_VAL(2)
   LET g_rlang = ARG_VAL(3)
   LET g_bgjob = ARG_VAL(4)
   LET g_prtway =ARG_VAL(5)
   LET g_copies =ARG_VAL(6)
   LET tm.wc = ARG_VAL(7)
   #No.FUN-570264 --start--
   LET g_rep_user = ARG_VAL(14)
   LET g_rep_clas = ARG_VAL(15)
   LET g_template = ARG_VAL(16)
   #No.FUN-570264 ---end---

   IF (NOT cl_user()) THEN
      EXIT PROGRAM
   END IF

   WHENEVER ERROR CALL cl_err_msg_log

   IF (NOT cl_setup("CSF")) THEN
      EXIT PROGRAM
   END IF
   CALL cl_used(g_prog,g_time,1) RETURNING g_time #No.FUN-690123

   display "g_pdate  =",g_pdate
   display "g_towhom =",g_towhom
   display "g_rlang  =",g_rlang
   display "g_bgjob  =",g_bgjob
   display "g_prtway =",g_prtway
   display "g_copies =",g_copies
   display "tm.wc    =",tm.wc
 # LET g_argv1 = ARG_VAL(10) #NO:6882
 # LET g_argv2 = ARG_VAL(11) #NO:6882
   LET g_rpt_name = ARG_VAL(12)  #No.FUN-7C0078

   #No.FUN-710082--begin
   LET g_sql ="sfb01.sfb_file.sfb01,",
              "sfb22.sfb_file.sfb22,",
              "sfb05.sfb_file.sfb05,",
              "sfb07.sfb_file.sfb07,",
              "sfb15.sfb_file.sfb15,",
              "sfb08.sfb_file.sfb08,",
              "sfb09.sfb_file.sfb09,",
              "sfb30.sfb_file.sfb30,",
              "sfb102.sfb_file.sfb102,", # add by lixwz180116
              "sfb31.sfb_file.sfb31,",
              "ima25_1.ima_file.ima25,",
              "sfa30.sfa_file.sfa30,",
              "sfa31.sfa_file.sfa31,",
              "sfa03.sfa_file.sfa03,",
              "ima02.ima_file.ima02,",
              "ima02_1.ima_file.ima02,",
              "imaud05.ima_file.imaud05,",
              "tc_csf03.tc_csf_file.tc_csf03,", # add by lixwz180116
              "ima25_2.ima_file.ima25,",
              "sfa0506.sfa_file.sfa05,",
              "img10.img_file.img10,",
              "tc_csf04.tc_csf_file.tc_csf04,", # add by lixwz180116
              "tc_csf05.tc_csf_file.tc_csf05"  # add by lixwz180116

   LET l_table = cl_prt_temptable('csfr301',g_sql) CLIPPED
   IF l_table = -1 THEN EXIT PROGRAM END IF
     LET g_sql = "INSERT INTO ",g_cr_db_str CLIPPED,l_table CLIPPED,
                " VALUES(?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,? )" # add 4? by lixwz180116
   PREPARE insert_prep FROM g_sql
   IF STATUS THEN
      CALL cl_err("insert_prep:",STATUS,1) EXIT PROGRAM
   END IF


   IF cl_null(g_bgjob) OR g_bgjob = 'N' THEN        # If background job sw is off
      CALL csfr301_tm(0,0)        # Input print condition
   ELSE
      CALL csfr301()            # Read data and create out-file
   END IF
   CALL cl_used(g_prog,g_time,2) RETURNING g_time #No.FUN-690123
END MAIN

FUNCTION csfr301_tm(p_row,p_col)
DEFINE lc_qbe_sn      LIKE gbm_file.gbm01         #No.FUN-580031
DEFINE p_row,p_col    LIKE type_file.num5,        #No.FUN-680121 SMALLINT
       l_dir          LIKE type_file.chr1,        #No.FUN-680121 VARCHAR(1)#Direction Flag
       l_cmd          LIKE type_file.chr1000      #No.FUN-680121 VARCHAR(400)

  LET p_row = 6 LET p_col = 20
  OPEN WINDOW csfr301_w AT p_row,p_col WITH FORM "csf/42f/csfr301"
       ATTRIBUTE (STYLE = g_win_style CLIPPED) #No.FUN-580092 HCN
  CALL cl_ui_init()
  CALL cl_opmsg('p')

  INITIALIZE tm.* TO NULL            # Default condition
  LET g_pdate = g_today
  LET g_rlang = g_lang
  LET g_bgjob = 'N'
  LET g_copies = '1'
  LET tm.a = 0
  LET tm.b = 0
  WHILE TRUE
    CONSTRUCT BY NAME tm.wc ON sfb01,sfb05,sfa30,sfa31
       #No.FUN-580031 --start--
       BEFORE CONSTRUCT
          CALL cl_qbe_init()
       #No.FUN-580031 ---end---

       ON ACTION CONTROLP        #FUN-4B0001
          IF INFIELD(sfb01) THEN
             CALL cl_init_qry_var()
             LET g_qryparam.state    = "c"
             LET g_qryparam.form     = "q_sfb01"
             CALL cl_create_qry() RETURNING g_qryparam.multiret
             DISPLAY g_qryparam.multiret TO sfb01
             NEXT FIELD sfb01
          END IF
          IF INFIELD(sfb05) THEN
              CALL cl_init_qry_var()
              LET g_qryparam.state    = "c"
              LET g_qryparam.form     = "q_sfb05_2"
              CALL cl_create_qry() RETURNING g_qryparam.multiret
              DISPLAY g_qryparam.multiret TO sfb05
              NEXT FIELD sfb05
           END IF
           IF INFIELD(sfa30) THEN
              CALL cl_init_qry_var()
              LET g_qryparam.state    = "c"
              LET g_qryparam.form     = "q_sfa30"
              CALL cl_create_qry() RETURNING g_qryparam.multiret
              DISPLAY g_qryparam.multiret TO sfa30
              NEXT FIELD sfa30
           END IF
           IF INFIELD(sfa31) THEN
              CALL cl_init_qry_var()
              LET g_qryparam.state    = "c"
              LET g_qryparam.form     = "q_sfa31"
              CALL cl_create_qry() RETURNING g_qryparam.multiret
              DISPLAY g_qryparam.multiret TO sfa31
              NEXT FIELD sfa31
           END IF

       ON ACTION locale
          LET g_action_choice = "locale"
          CALL cl_show_fld_cont()                   #No.FUN-550037 hmf
          EXIT CONSTRUCT

       ON IDLE g_idle_seconds
          CALL cl_on_idle()
          CONTINUE CONSTRUCT

       ON ACTION exit
          LET INT_FLAG = 1
          EXIT CONSTRUCT

       #No.FUN-580031 --start--
       ON ACTION qbe_select
          CALL cl_qbe_select()
       #No.FUN-580031 ---end---

    END CONSTRUCT

    IF g_action_choice = "locale" THEN
       LET g_action_choice = ""
       CALL cl_dynamic_locale()
       CONTINUE WHILE
    END IF

    IF INT_FLAG THEN
       LET INT_FLAG = 0
       EXIT WHILE
    END IF

    IF tm.wc=" 1=1 " THEN
       CALL cl_err(' ','9046',0)
       CONTINUE WHILE
    END IF

     INPUT BY NAME tm.a,tm.b WITHOUT DEFAULTS

         ON ACTION CONTROLG
            CALL cl_cmdask()    # Command execution

         ON IDLE g_idle_seconds   #TQC-860021
            CALL cl_on_idle()     #TQC-860021
            CONTINUE INPUT        #TQC-860021

         ON ACTION about
            CALL cl_about()

         ON ACTION help
            CALL cl_show_help()

         ON ACTION locale
            CALL cl_dynamic_locale()

         ON ACTION exit
            LET INT_FLAG = 1
            EXIT INPUT

      END INPUT

      IF INT_FLAG THEN
        LET INT_FLAG = 0 CLOSE WINDOW r301_w EXIT PROGRAM
      END IF

    IF g_bgjob = 'Y' THEN
       SELECT zz08 INTO l_cmd FROM zz_file    #get exec cmd (fglgo xxxx)
              WHERE zz01='csfr301'
       IF SQLCA.sqlcode OR l_cmd IS NULL THEN
          CALL cl_err('csfr301','9031',1)
       ELSE
          LET tm.wc=cl_replace_str(tm.wc, "'", "\"")
          LET l_cmd = l_cmd CLIPPED,        #(at time fglgo xxxx p1 p2 p3)
                          " '",g_pdate CLIPPED,"'",
                          " '",g_towhom CLIPPED,"'",
                          #" '",g_lang CLIPPED,"'", #No.FUN-7C0078
                         " '",g_rlang CLIPPED,"'", #No.FUN-7C0078
                          " '",g_bgjob CLIPPED,"'",
                          " '",g_prtway CLIPPED,"'",
                          " '",g_copies CLIPPED,"'",
                          " '",tm.wc CLIPPED,"'",              #FUN-750047 add
                         " '",g_rep_user CLIPPED,"'",           #No.FUN-570264
                         " '",g_rep_clas CLIPPED,"'",           #No.FUN-570264
                         " '",g_template CLIPPED,"'",           #No.FUN-570264
                         " '",g_rpt_name CLIPPED,"'"            #No.FUN-7C0078
          CALL cl_cmdat('csfr301',g_time,l_cmd)    # Execute cmd at later time
       END IF
       CLOSE WINDOW csfr301_w
       CALL cl_used(g_prog,g_time,2) RETURNING g_time #No.FUN-690123
       EXIT PROGRAM
    END IF

    CALL cl_wait()
    CALL csfr301()
    ERROR ""
  END WHILE

  CLOSE WINDOW csfr301_w
END FUNCTION

FUNCTION csfr301()
   DEFINE l_name    LIKE type_file.chr20,             #No.FUN-680121 VARCHAR(20)# External(Disk) file name
#         l_time    LIKE type_file.chr8               #No.FUN-6A0090
          l_sql     STRING,                           # RDSQL STATEMENT   TQC-630166
          l_chr     LIKE type_file.chr1,              #No.FUN-680121 VARCHAR(1)
          l_za05    LIKE type_file.chr1000,           #No.FUN-680121 VARCHAR(40)
          l_sfb02doc LIKE type_file.chr30,            #No:TQC-A60097 add
#         l_order   ARRAY[5] OF LIKE apm_file.apm08,  #No.FUN-680121 VARCHAR(10) # TQC-6A0079
          sr        RECORD
                  sfb01    LIKE sfb_file.sfb01,
                  sfb22    LIKE sfb_file.sfb22,
                  sfb05    LIKE sfb_file.sfb05,
                  sfb07    LIKE sfb_file.sfb07,
                  sfb15    LIKE sfb_file.sfb15,
                  sfb08    LIKE sfb_file.sfb08,
                  sfb09    LIKE sfb_file.sfb09,
                  sfb30    LIKE sfb_file.sfb30,
                  sfb102   LIKE sfb_file.sfb102, # add by lixwz180116
                  sfb31    LIKE sfb_file.sfb31,
                  ima25_1  LIKE ima_file.ima25,
                  sfa30    LIKE sfa_file.sfa30,
                  sfa31    LIKE sfa_file.sfa31,
                  sfa03    LIKE sfa_file.sfa03,
                  ima02    LIKE ima_file.ima02,
                  imaud05  LIKE ima_file.imaud05,
                  tc_csf03 LIKE tc_csf_file.tc_csf03, # add by lixwz180116
                  ima02_1  LIKE ima_file.ima02,
                  ima25_2  LIKE ima_file.ima25,
                  sfa0506  LIKE sfa_file.sfa05,
                  img10    LIKE img_file.img10,
                  tc_csf04 LIKE tc_csf_file.tc_csf04, # add by lixwz180116
                  tc_csf05 LIKE tc_csf_file.tc_csf05  # add by lixwz180116
                    END RECORD
   DEFINE l_ima02   LIKE ima_file.ima02,
          l_ima021  LIKE ima_file.ima021,
          l_dept    LIKE pmc_file.pmc03,          #No.MOD-580275
          l_occ02   LIKE occ_file.occ02,
          l_eca04   LIKE eca_file.eca04,
          l_eca04d  LIKE eca_file.eca04,          #TQC-740275 add
          l_sum1,l_sum2,l_sum3    LIKE smh_file.smh103,        #No.FUN-680121 DEC(13,5)
          l_cnt     LIKE type_file.num5           #No.FUN-680121 SMALLINT
   DEFINE l_oea01   LIKE oea_file.oea01
   DEFINE l_ofb01   LIKE ofb_file.ofb01
   DEFINE l_oea04   LIKE oea_file.oea04
   DEFINE l_oea44   LIKE oea_file.oea44
   DEFINE l_sfw02   LIKE sfw_file.sfw02
   DEFINE l_sfw03   LIKE sfw_file.sfw03
#No.FUN-710082--end
   DEFINE l_short_qty   LIKE sfa_file.sfa07   #FUN-940008 add
   #str TQC-740275 add
   ## *** 與 Crystal Reports 串聯段 - <<<< 清除暫存資料 >>>> CR11 *** ##
   CALL cl_del_data(l_table)
   #------------------------------ CR (2) ------------------------------#

   SELECT zo02 INTO g_company FROM zo_file WHERE zo01 = g_rlang
   SELECT zz05 INTO g_zz05 FROM zz_file WHERE zz01 = g_prog
   LET tm.wc = tm.wc CLIPPED,cl_get_extra_cond('sfbuser', 'sfbgrup')

   LET l_sql = " SELECT sfb01,sfb22,sfb05,sfb07,sfb15,",
               # mod by lixwz180116 s
               #" sfb08,sfb09,sfb30,sfb31,'',",
               " sfb08,sfb09,sfb30,sfb102,sfb31,'',",
               #" sfa30,sfa31,sfa03,'','',",
               #" '','',sfa05-sfa06,'' ",
               " sfa30,sfa31,sfa03,'','','',",
               " '','',sfa05-sfa06,'','','' ",
               # mod by lixwz180116 e
               " FROM sfb_file,sfa_file ",
               " WHERE sfb01=sfa01 AND ",tm.wc CLIPPED                                          #FUN-A60027
   #LET l_sql=l_sql CLIPPED," ORDER BY sfb01"   #No.FUN-710082    #mark by zhangbo131011

   IF tm.a = 1 THEN
     LET l_sql=l_sql CLIPPED," AND SUBSTR(sfa31,1,2) <> 'IB'  "
   END IF

   IF tm.b = 1 THEN
     LET l_sql=l_sql CLIPPED," AND SUBSTR(sfa31,1,2) <> 'IH'  "
   END IF
   LET l_sql=l_sql CLIPPED," ORDER BY sfb01,sfa30,sfa31"          #add by zhangbo131011
   PREPARE csfr301_p1 FROM l_sql
   IF SQLCA.sqlcode != 0 THEN
      CALL cl_err('p1:',SQLCA.sqlcode,1)
      CALL cl_used(g_prog,g_time,2) RETURNING g_time #No.FUN-690123
      EXIT PROGRAM
   END IF
   DECLARE csfr301_curs1 CURSOR FOR csfr301_p1

   CALL cl_del_data(l_table)
   FOREACH csfr301_curs1 INTO sr.*
      IF SQLCA.sqlcode != 0 THEN
         CALL cl_err('foreach:',SQLCA.sqlcode,1)
         EXIT FOREACH
      END IF

      SELECT ima25 INTO sr.ima25_1 FROM ima_file WHERE ima01=sr.sfb05
      SELECT ima02 INTO sr.ima02_1   FROM ima_file WHERE ima01=sr.sfb05
      SELECT ima02 INTO sr.ima02   FROM ima_file WHERE ima01=sr.sfa03
      SELECT imaud05 INTO sr.imaud05 FROM ima_file WHERE ima01=sr.sfa03
      SELECT ima25 INTO sr.ima25_2 FROM ima_file WHERE ima01=sr.sfa03
      SELECT img10 INTO sr.img10   FROM img_file WHERE img01=sr.sfa03 AND img02=sr.sfa30 AND img03=sr.sfa31
      # add by lixwz180116 s
      SELECT tc_csf03,tc_csf04,tc_csf05
        INTO sr.tc_csf03,sr.tc_csf04,sr.tc_csf05
        FROM tc_csf_file
       WHERE tc_csf01 = sr.sfb102
         AND tc_csf02 = sr.sfa03
      # add by lixwz180116 e
      EXECUTE insert_prep USING
          sr.sfb01,sr.sfb22,sr.sfb05,sr.sfb07,sr.sfb15,
          # mod by lixwz180116 s
          #sr.sfb08,sr.sfb09,sr.sfb30,sr.sfb31,sr.ima25_1,
          sr.sfb08,sr.sfb09,sr.sfb30,sr.sfb102,sr.sfb31,sr.ima25_1,
          sr.sfa30,sr.sfa31,sr.sfa03,sr.ima02,sr.ima02_1,sr.imaud05,
          #sr.ima25_2,sr.sfa0506,sr.img10
          sr.tc_csf03,sr.ima25_2,sr.sfa0506,sr.img10,sr.tc_csf04,sr.tc_csf05
          # mod by lixwz180116 e
   END FOREACH

   LET l_sql = "SELECT * FROM ",g_cr_db_str CLIPPED,l_table CLIPPED

 # LET l_str = tm.wc CLIPPED     #add by arman 140226  修改因为条件下太多导致l_str太长报表打印不出的问题

   CALL cl_prt_cs3('csfr301','csfr301',l_sql,l_str)

END FUNCTION
