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
                      mm      LIKE type_file.chr2
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
            description           LIKE type_file.chr100,
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
            ytd_diff_percent      LIKE type_file.num5
         END RECORD
DEFINE g_traqh_sum     RECORD
            traqh_code            LIKE tc_afc_file.tc_afc04,
            description           LIKE type_file.chr100,
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
            ytd_diff_percent      LIKE type_file.num5
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
               "description.type_file.chr100,",
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
               "ytd_diff_percent.type_file.num5"

   LET l_table = cl_prt_temptable('cglr901',g_sql) CLIPPED   # 產生Temp Table
   IF l_table = -1 THEN EXIT PROGRAM END IF                  # Temp Table產生
   LET g_sql = "INSERT INTO ",g_cr_db_str CLIPPED,l_table CLIPPED,
               " VALUES(?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?,  ?,?,?)"

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
   INITIALIZE l_str   TO NULL
   LET g_pdate = g_today
   LET g_rlang = g_lang
   LET g_bgjob = 'N'
   LET g_copies= '1'

   LET tm.yy = YEAR(g_today)
   LET tm.mm = MONTH(g_today)

     DISPLAY BY NAME tm.yy,tm.mm

     CONSTRUCT BY NAME g_wc ON tc_afa02,tc_afa04

      BEFORE CONSTRUCT

      ON ACTION CONTROLZ
          CALL cl_show_req_fields()


      ON ACTION CONTROLG
         CALL cl_cmdask()

      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE CONSTRUCT

      ON ACTION controlp
         CASE
            WHEN INFIELD(tc_afa02)
                CALL cl_init_qry_var()
                LET g_qryparam.form = "cq_tc_afa02"
                LET g_qryparam.state= 'c'
                CALL cl_create_qry() RETURNING g_qryparam.multiret
                DISPLAY g_qryparam.multiret TO tc_afa02
                NEXT FIELD tc_afa02

            WHEN INFIELD(tc_afa04)
                CALL cl_init_qry_var()
                LET g_qryparam.form = "cq_tc_afa04"
                LET g_qryparam.state= 'c'
                CALL cl_create_qry() RETURNING g_qryparam.multiret
                DISPLAY g_qryparam.multiret TO tc_afa04
                NEXT FIELD tc_afa04
         END CASE

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

     DISPLAY BY NAME tm.yy,tm.mm

     INPUT BY NAME tm.yy,tm.mm

      BEFORE INPUT
          LET tm.yy = YEAR(g_today)
          LET tm.mm = MONTH(g_today)
          DISPLAY BY NAME tm.yy,tm.mm

      AFTER FIELD yy
        IF NOT cl_null(tm.yy) THEN
           IF tm.yy < 1990 OR tm.yy > 3000 THEN
             CALL cl_err('','aoo-020',1)
             NEXT FIELD yy
           END IF
        END IF
      AFTER FIELD mm

        IF NOT cl_null(tm.mm) THEN
           IF tm.mm > 12 OR tm.mm < 1 THEN
              CALL cl_err('','aom-580',1)
              NEXT FIELD mm
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
         LET INT_FLAG  = 1
         EXIT INPUT
     END INPUT

     IF INT_FLAG THEN
        CLOSE WINDOW cglr901_w
        RETURN
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
          l_a       LIKE type_file.num5,
          l_b       LIKE type_file.num5,
          l_cnt     LIKE type_file.num5,
          sr               RECORD
               traqh_code            LIKE tc_afc_file.tc_afc04,
                description           LIKE type_file.chr100,
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
                ytd_diff_percent      LIKE type_file.num5
                        END RECORD
     DEFINE ll_aae02 LIKE aae_file.aae02             #No.FUN-830100
     DEFINE l_aae02 LIKE aae_file.aae02              #No.FUN-830100

     CALL cl_del_data(l_table)                       #No.FUN-830100
     IF tm.mm <=3 THEN
        LET l_a = 1
        LET l_b = 3
     END IF
     IF tm.mm <= 6  AND tm.mm>=4 THEN
        LET l_a = 4
        LET l_b = 6
     END IF
     IF tm.mm <=9 AND tm.mm>=7 THEN
        LET l_a = 7
        LET l_b = 9
     END IF
     IF tm.mm>=10 AND tm.mm<=12 THEN
        LET l_a = 10
        LET l_b = 12
     END IF
   CALL r901_crt_temp()
   LET l_sql = "INSERT INTO cglr901_tmp SELECT ",
               " abb13,abb03,abb04,case abb06 when '2' then NVL(abb07*-1,0) else NVL(abb07,0) end abb07 ,aba03,aba04",
               " FROM abb_file,aba_file WHERE abb01 = aba01 AND (aba03 = ",tm.yy," OR aba03 = ",tm.yy-1,
               ") and aba19 = 'Y' AND abapost='Y' and abb05 in ",
               " (select unique tc_afa01 from tc_afa_file where ",g_wc,")"

   PREPARE  cglr901_ins_tmp FROM l_sql

   EXECUTE cglr901_ins_tmp

   IF SQLCA.sqlcode THEN
      CALL cl_err('cglr901_ins_tmp:',SQLCA.sqlcode,0)
   END IF

   LET l_sql = "select abb13,sum(NVL(abb07,0) from cglr901_tmp  ",
               " where aba03 = ",tm.yy," and aba04 = ",tm.mm ,
               " and abb13 = ? group by abb13"
   PREPARE cglr901_mtd_1 FROM l_sql
   DECLARE cglr901_mtd_cs1 CURSOR FOR cglr901_mtd_1

   LET l_sql = "select abb13,sum(NVL(abb07,0)) from cglr901_tmp  ",
               " where aba03 = ",tm.yy-1," and aba04 = ",tm.mm ,
               " and abb13 = ? group by abb13"
   PREPARE cglr901_mtd_2 FROM l_sql
   DECLARE cglr901_mtd_cs2 CURSOR FOR cglr901_mtd_2

   LET l_sql = "select abb13,sum(NVL(abb07,0)) from cglr901_tmp",
               " where aba03 = ",tm.yy," and aba04 between",
               l_a," and ",l_b,"and abb13 = ? group by abb13"
   PREPARE cglr901_qtd_1 FROM l_sql
   DECLARE cglr901_qtd_cs1 CURSOR FOR cglr901_qtd_1

   LET l_sql = "select abb13,sum(NVL(abb07,0)) from cglr901_tmp",
               " where aba03 = ",tm.yy-1," and aba04 between",
               l_a," and ",l_b,"and abb13 = ? group by abb13"
   PREPARE cglr901_qtd_2 FROM l_sql
   DECLARE cglr901_qtd_cs2 CURSOR FOR cglr901_qtd_2


   LET l_sql = "select abb13,sum(NVL(abb07,0)) from cglr901_tmp",
               " where aba03 = ",tm.yy," and abb13 = ? group by abb13"
   PREPARE cglr901_ytd_1 FROM l_sql
   DECLARE cglr901_ytd_cs1 CURSOR FOR cglr901_ytd_1

   LET l_sql = "select abb13,sum(NVL(abb07,0)) from cglr901_tmp",
               " where aba03 = ",tm.yy-1," and abb13 = ? group by abb13"
   PREPARE cglr901_ytd_2 FROM l_sql
   DECLARE cglr901_ytd_cs2 CURSOR FOR cglr901_ytd_2

   LET l_sql = "SELECT sum(COALESCE(afc06,0)-COALESCE(afc08,0)+COALESCE(afc09,0))",
               " FROM afc_file LEFT JOIN afb_file ON afb00 =afc00 and afb01 = afc01",
               " and afb02 = afc02  AND afb03 = afc03",
               " where afc03 = ",tm.yy," and afc05 =",tm.mm," and (afb041,afb02) in (",
               " SELECT unique tc_afc01,tc_afc02 from tc_afc_file where tc_afc04 = ?)",
               " AND afb041 in (select unique tc_afa01 from tc_afa_file where ",g_wc,")"
   PREPARE cglr901_btd FROM l_sql
   DECLARE cglr901_btd_cs CURSOR FOR cglr901_btd

   CALL r901_sum_init()
   CALL r901_init()
   FOR l_cnt = 1 TO 75
      EXECUTE cglr901_mtd_cs1 INTO g_traqh[l_cnt].traqh_code,g_traqh[l_cnt].mtd_a
                              USING g_traqh[l_cnt].traqh_code
      EXECUTE cglr901_mtd_cs2 INTO g_traqh[l_cnt].traqh_code, g_traqh[l_cnt].mtd_b
                              USING g_traqh[l_cnt].traqh_code
      EXECUTE cglr901_qtd_cs1 INTO g_traqh[l_cnt].traqh_code ,g_traqh[l_cnt].qtd_a
                              USING g_traqh[l_cnt].traqh_code
      EXECUTE cglr901_qtd_cs2 INTO g_traqh[l_cnt].traqh_code ,g_traqh[l_cnt].qtd_b
                              USING g_traqh[l_cnt].traqh_code
      EXECUTE cglr901_ytd_cs1 INTO g_traqh[l_cnt].traqh_code ,g_traqh[l_cnt].ytd_a
                              USING g_traqh[l_cnt].traqh_code
      EXECUTE cglr901_ytd_cs2 INTO g_traqh[l_cnt].traqh_code ,g_traqh[l_cnt].ytd_b
                              USING g_traqh[l_cnt].traqh_code

      EXECUTE cglr901_btd_cs INTO g_traqh[l_cnt].btd_b
                              USING g_traqh[l_cnt].traqh_code
      LET g_traqh[l_cnt].btd_a = g_traqh[l_cnt].mtd_a
      IF cl_null(g_traqh[l_cnt].mtd_a) THEN LET g_traqh[l_cnt].mtd_a =0 END IF
      IF cl_null(g_traqh[l_cnt].mtd_b) THEN LET g_traqh[l_cnt].mtd_b =0 END IF
      IF cl_null(g_traqh[l_cnt].qtd_a) THEN LET g_traqh[l_cnt].qtd_a =0 END IF
      IF cl_null(g_traqh[l_cnt].qtd_b) THEN LET g_traqh[l_cnt].qtd_b =0 END IF
      IF cl_null(g_traqh[l_cnt].ytd_a) THEN LET g_traqh[l_cnt].ytd_a =0 END IF
      IF cl_null(g_traqh[l_cnt].ytd_b) THEN LET g_traqh[l_cnt].ytd_b =0 END IF
      IF cl_null(g_traqh[l_cnt].btd_a) THEN LET g_traqh[l_cnt].btd_a =0 END IF
      IF cl_null(g_traqh[l_cnt].btd_b) THEN LET g_traqh[l_cnt].btd_b =0 END IF

      LET g_traqh_sum.mtd_a = g_traqh_sum.mtd_a + g_traqh[l_cnt].mtd_a
      LET g_traqh_sum.mtd_b = g_traqh_sum.mtd_b + g_traqh[l_cnt].mtd_b
      LET g_traqh_sum.qtd_a = g_traqh_sum.qtd_a + g_traqh[l_cnt].qtd_a
      LET g_traqh_sum.qtd_b = g_traqh_sum.qtd_b + g_traqh[l_cnt].qtd_b
      LET g_traqh_sum.ytd_a = g_traqh_sum.ytd_a + g_traqh[l_cnt].ytd_a
      LET g_traqh_sum.ytd_b = g_traqh_sum.ytd_b + g_traqh[l_cnt].ytd_b
      LET g_traqh_sum.btd_a = g_traqh_sum.btd_a + g_traqh[l_cnt].btd_a
      LET g_traqh_sum.btd_b = g_traqh_sum.btd_b + g_traqh[l_cnt].btd_b

      LET g_traqh[l_cnt].mtd_diff = g_traqh[l_cnt].mtd_a - g_traqh[l_cnt].mtd_b
      LET g_traqh[l_cnt].qtd_diff = g_traqh[l_cnt].qtd_a - g_traqh[l_cnt].qtd_b
      LET g_traqh[l_cnt].btd_diff = g_traqh[l_cnt].btd_a - g_traqh[l_cnt].btd_b
      LET g_traqh[l_cnt].ytd_diff = g_traqh[l_cnt].ytd_a - g_traqh[l_cnt].ytd_b
      IF (g_traqh[l_cnt].mtd_a ! =0) THEN
          LET g_traqh[l_cnt].mtd_diff_percent = g_traqh[l_cnt].mtd_diff / g_traqh[l_cnt].mtd_a
          LET g_traqh[l_cnt].mtd_diff_percent = cl_digcut(g_traqh[l_cnt].mtd_diff_percent*100,2)
      ELSE
          LET g_traqh[l_cnt].mtd_diff_percent = 0
      END IF
      IF (g_traqh[l_cnt].qtd_a ! =0) THEN
          LET g_traqh[l_cnt].qtd_diff_percent = g_traqh[l_cnt].qtd_diff / g_traqh[l_cnt].qtd_a
          LET g_traqh[l_cnt].qtd_diff_percent = cl_digcut(g_traqh[l_cnt].qtd_diff_percent*100,2)
      ELSE
          LET g_traqh[l_cnt].qtd_diff_percent = 0
      END IF
      IF (g_traqh[l_cnt].btd_a ! =0) THEN
          LET g_traqh[l_cnt].btd_diff_percent = g_traqh[l_cnt].btd_diff / g_traqh[l_cnt].btd_a
          LET g_traqh[l_cnt].btd_diff_percent = cl_digcut(g_traqh[l_cnt].btd_diff_percent*100,2)
      ELSE
          LET g_traqh[l_cnt].btd_diff_percent = 0
      END IF
      IF (g_traqh[l_cnt].ytd_a ! =0) THEN
          LET g_traqh[l_cnt].ytd_diff_percent = g_traqh[l_cnt].ytd_diff / g_traqh[l_cnt].ytd_a
          LET g_traqh[l_cnt].ytd_diff_percent = cl_digcut(g_traqh[l_cnt].ytd_diff_percent*100,2)
      ELSE
          LET g_traqh[l_cnt].ytd_diff_percent = 0
      END IF

      IF g_traqh[l_cnt].traqh_code = '6011' THEN
          CALL r901_get_sum(l_cnt)
          CALL r901_sum_init()
      END IF
      IF g_traqh[l_cnt].traqh_code = '6013' THEN
          CALL r901_get_sum(l_cnt)
          CALL r901_sum_init()
      END IF
      IF g_traqh[l_cnt].traqh_code = '6022' THEN
          CALL r901_get_sum(l_cnt)
          CALL r901_sum_init()
      END IF
      IF g_traqh[l_cnt].traqh_code = '6026' THEN
          CALL r901_get_sum(l_cnt)
          CALL r901_sum_init()
      END IF
      IF g_traqh[l_cnt].traqh_code = '5006' THEN
          CALL r901_get_sum(l_cnt)
          CALL r901_sum_init()
      END IF
      IF g_traqh[l_cnt].traqh_code = '5020' THEN
          CALL r901_get_sum(l_cnt)
          CALL r901_sum_init()
      END IF
   END FOR
   LET g_traqh[76].mtd_a = g_traqh[31].mtd_a + g_traqh[33].mtd_a + g_traqh[49].mtd_a
                         + g_traqh[56].mtd_a + g_traqh[71].mtd_a + g_traqh[75].mtd_a

   LET g_traqh[76].mtd_b = g_traqh[31].mtd_b + g_traqh[33].mtd_b + g_traqh[49].mtd_b
                         + g_traqh[56].mtd_b + g_traqh[71].mtd_b + g_traqh[75].mtd_b

   LET g_traqh[76].qtd_a = g_traqh[31].qtd_a + g_traqh[33].qtd_a + g_traqh[49].qtd_a
                         + g_traqh[56].qtd_a + g_traqh[71].qtd_a + g_traqh[75].qtd_a

   LET g_traqh[76].qtd_b = g_traqh[31].qtd_b + g_traqh[33].qtd_b + g_traqh[49].qtd_b
                         + g_traqh[56].qtd_b + g_traqh[71].qtd_b + g_traqh[75].qtd_b

   LET g_traqh[76].ytd_a = g_traqh[31].ytd_a + g_traqh[33].ytd_a + g_traqh[49].ytd_a
                         + g_traqh[56].ytd_a + g_traqh[71].ytd_a + g_traqh[75].ytd_a

   LET g_traqh[76].ytd_b = g_traqh[31].ytd_b + g_traqh[33].ytd_b + g_traqh[49].ytd_b
                         + g_traqh[56].ytd_b + g_traqh[71].ytd_b + g_traqh[75].ytd_b

   LET g_traqh[76].btd_a = g_traqh[31].btd_a + g_traqh[33].btd_a + g_traqh[49].btd_a
                         + g_traqh[56].btd_a + g_traqh[71].btd_a + g_traqh[75].btd_a

   LET g_traqh[76].btd_b = g_traqh[31].btd_b + g_traqh[33].btd_b + g_traqh[49].btd_b
                         + g_traqh[56].btd_b + g_traqh[71].btd_b + g_traqh[75].btd_b

  LET g_traqh[76].mtd_diff = g_traqh[76].mtd_a - g_traqh[76].mtd_b
  LET g_traqh[76].qtd_diff = g_traqh[76].qtd_a - g_traqh[76].qtd_b
  LET g_traqh[76].btd_diff = g_traqh[76].btd_a - g_traqh[76].btd_b
  LET g_traqh[76].ytd_diff = g_traqh[76].ytd_a - g_traqh[76].ytd_b
  IF (g_traqh[76].mtd_a ! =0) THEN
      LET g_traqh[76].mtd_diff_percent = g_traqh[76].mtd_diff / g_traqh[76].mtd_a
      LET g_traqh[76].mtd_diff_percent = cl_digcut(g_traqh[76].mtd_diff_percent*100,2)
  ELSE
      LET g_traqh[76].mtd_diff_percent = 0
  END IF
  IF (g_traqh[76].qtd_a ! =0) THEN
      LET g_traqh[76].qtd_diff_percent = g_traqh[76].qtd_diff / g_traqh[76].qtd_a
      LET g_traqh[76].qtd_diff_percent = cl_digcut(g_traqh[76].qtd_diff_percent*100,2)
  ELSE
      LET g_traqh[76].qtd_diff_percent = 0
  END IF
  IF (g_traqh[76].btd_a ! =0) THEN
      LET g_traqh[76].btd_diff_percent = g_traqh[76].btd_diff / g_traqh[76].btd_a
      LET g_traqh[76].btd_diff_percent = cl_digcut(g_traqh[76].btd_diff_percent*100,2)
  ELSE
      LET g_traqh[76].mtd_diff_percent = 0
  END IF
  IF (g_traqh[76].ytd_a ! =0) THEN
      LET g_traqh[76].ytd_diff_percent = g_traqh[76].ytd_diff / g_traqh[76].ytd_a
      LET g_traqh[76].ytd_diff_percent = cl_digcut(g_traqh[76].ytd_diff_percent*100,2)
  ELSE
      LET g_traqh[76].mtd_diff_percent = 0
  END IF
  FOR l_cnt =1 TO 76
      EXECUTE insert_prep USING g_traqh[l_cnt].*
  END FOR

   LET l_sql = "SELECT * FROM ",g_cr_db_str CLIPPED,l_table CLIPPED
  LET g_str = " ' ';",tm.yy

  CALL cl_prt_cs3('cglr901','cglr901',l_sql,g_str)

  CALL  cl_used(g_prog,g_time,2) RETURNING g_time
END FUNCTION



# 初始化要显示的Traqh code
FUNCTION r901_init()


  LET g_traqh[1].traqh_code = '6060' LET g_traqh[1].description=  'Marketing (TV/Print/Radio)'
  LET g_traqh[2].traqh_code = '6061' LET g_traqh[2].description=  'Marketing (Online)'
  LET g_traqh[3].traqh_code = '6041' LET g_traqh[3].description=  'Coop advertising'
  LET g_traqh[4].traqh_code = '6042' LET g_traqh[4].description=  'Printed material'
  LET g_traqh[5].traqh_code = '6044' LET g_traqh[5].description=  'Digital media'
  LET g_traqh[6].traqh_code = '6045' LET g_traqh[6].description=  'In-store'
  LET g_traqh[7].traqh_code = '6046' LET g_traqh[7].description=  'Conferences and customer events'
  LET g_traqh[8].traqh_code = '6047' LET g_traqh[8].description=  'PR'
  LET g_traqh[9].traqh_code = '6048' LET g_traqh[9].description=  'Merchandising'
  LET g_traqh[10].traqh_code = '6049' LET g_traqh[10].description=  'Dealer/retailer contribution'
  LET g_traqh[11].traqh_code = '6050' LET g_traqh[11].description=  'Brand Management & Divisional Marketing staff'
  LET g_traqh[12].traqh_code = '6062' LET g_traqh[12].description=  'Sponsring'
  LET g_traqh[13].traqh_code = '6063' LET g_traqh[13].description=  'Market Insight'
  LET g_traqh[14].traqh_code = '6055' LET g_traqh[14].description=  'Group Brand & Marketing'
  LET g_traqh[15].traqh_code = '6001' LET g_traqh[15].description=  'Field sales staff'
  LET g_traqh[16].traqh_code = '6002' LET g_traqh[16].description=  'Inhouse sales staff'
  LET g_traqh[17].traqh_code = '6053' LET g_traqh[17].description=  'PM&D costs'
  LET g_traqh[18].traqh_code = '6003' LET g_traqh[18].description=  'Other sales staff'
  LET g_traqh[19].traqh_code = '6009' LET g_traqh[19].description=  'Key account organization, only retailer channel'
  LET g_traqh[20].traqh_code = '6010' LET g_traqh[20].description=  'IT-cost selling'
  LET g_traqh[21].traqh_code = '6056' LET g_traqh[21].description=  'Taxes and Levies - Selling'
  LET g_traqh[22].traqh_code = '6038' LET g_traqh[22].description=  'Depreciation according to plan - selling'
  LET g_traqh[23].traqh_code = '7963' LET g_traqh[23].description=  'Currency translation difference'
  LET g_traqh[24].traqh_code = '7964' LET g_traqh[24].description=  'Exchange rate difference on bank balance'
  LET g_traqh[25].traqh_code = '6057' LET g_traqh[25].description=  'Internal Selling cost commission'
  LET g_traqh[26].traqh_code = '6052' LET g_traqh[26].description=  'Other general selling expenses'
  LET g_traqh[27].traqh_code = '7943' LET g_traqh[27].description=  'Other income - selling'
  LET g_traqh[28].traqh_code = '7944' LET g_traqh[28].description=  'Other expense - selling'
  LET g_traqh[29].traqh_code = '7960' LET g_traqh[29].description=  'Exch diff, translating AR/AP foreign curr -Selling'
  LET g_traqh[30].traqh_code = '7962' LET g_traqh[30].description=  'Exch diff from hedging (FX) contracts - Selling'
  LET g_traqh[31].traqh_code = '6011' LET g_traqh[31].description=  'SELLING EXPENSES'

  LET g_traqh[32].traqh_code = '6012' LET g_traqh[32].description=  'Goodwill warranty'
  LET g_traqh[33].traqh_code = '6013' LET g_traqh[33].description=  'TOTAL GOODWILL GUARANTEE'

  LET g_traqh[34].traqh_code = '6071' LET g_traqh[34].description=  'Secondary transport income'
  LET g_traqh[35].traqh_code = '6014' LET g_traqh[35].description=  'Secondary transport cost'
  LET g_traqh[36].traqh_code = '6015' LET g_traqh[36].description=  'Handling, internal'
  LET g_traqh[37].traqh_code = '6016' LET g_traqh[37].description=  'Warehouse premises'
  LET g_traqh[38].traqh_code = '6017' LET g_traqh[38].description=  'Handling, external'
  LET g_traqh[39].traqh_code = '6018' LET g_traqh[39].description=  'Transport/warehouse damage'
  LET g_traqh[40].traqh_code = '6020' LET g_traqh[40].description=  'Other logistics expenses'
  LET g_traqh[41].traqh_code = '6021' LET g_traqh[41].description=  'IT-cost logistics'
  LET g_traqh[42].traqh_code = '6032' LET g_traqh[42].description=  'Cost D & SCM'
  LET g_traqh[43].traqh_code = '6033' LET g_traqh[43].description=  'Penalties related to late deliveries'
  LET g_traqh[44].traqh_code = '6067' LET g_traqh[44].description=  'Depreciation according to plan logistics'
  LET g_traqh[45].traqh_code = '6058' LET g_traqh[45].description=  'Central Allocation Warehouse'
  LET g_traqh[46].traqh_code = '6059' LET g_traqh[46].description=  'Central Allocation Transportation'
  LET g_traqh[47].traqh_code = '6068' LET g_traqh[47].description=  'Central Allocation Warehouse Germany'
  LET g_traqh[48].traqh_code = '6069' LET g_traqh[48].description=  'Central Allocation Transportation Germany'
  LET g_traqh[49].traqh_code = '6022' LET g_traqh[49].description=  'LOGISTICS EXPENSES'

  LET g_traqh[50].traqh_code = '6023' LET g_traqh[50].description=  'Staff, receivables, credit & collection'
  LET g_traqh[51].traqh_code = '6024' LET g_traqh[51].description=  'Floorplanning and factoring'
  LET g_traqh[52].traqh_code = '6025' LET g_traqh[52].description=  'Expense for receivables'
  LET g_traqh[53].traqh_code = '6034' LET g_traqh[53].description=  'Provision for bad debts'
  LET g_traqh[54].traqh_code = '6035' LET g_traqh[54].description=  'Release of bad debt provision'
  LET g_traqh[55].traqh_code = '6036' LET g_traqh[55].description=  'Write off of accounts receivables'
  LET g_traqh[56].traqh_code = '6026' LET g_traqh[56].description=  'TOTAL CREDIT & COLLECTION'

  LET g_traqh[57].traqh_code = '5001' LET g_traqh[57].description=  'IT-cost administration'
  LET g_traqh[58].traqh_code = '5014' LET g_traqh[58].description=  'Group Technology Office SG&A'
  LET g_traqh[59].traqh_code = '5002' LET g_traqh[59].description=  'Staff'
  LET g_traqh[60].traqh_code = '5003' LET g_traqh[60].description=  'Premises'
  LET g_traqh[61].traqh_code = '5013' LET g_traqh[61].description=  'Taxes and Levies - Admin'
  LET g_traqh[62].traqh_code = '5004' LET g_traqh[62].description=  'Other general administrative expenses'
  LET g_traqh[63].traqh_code = '5008' LET g_traqh[63].description=  'Amortization of intangibles assets - selling & adm'
  LET g_traqh[64].traqh_code = '5015' LET g_traqh[64].description=  'Amort Comp Softw & Oth IT Intagibles Sell&Admin'
  LET g_traqh[65].traqh_code = '5009' LET g_traqh[65].description=  'Depreciation according to plan - admin'
  LET g_traqh[66].traqh_code = '5016' LET g_traqh[66].description=  'Impairm./ Scapp. of Property, plant & equip. SG&A'
  LET g_traqh[67].traqh_code = '5017' LET g_traqh[67].description=  'Impairment/ Scrapping of Intangible FA SG&A'
  LET g_traqh[68].traqh_code = '5022' LET g_traqh[68].description=  'Admin costs commission'
  LET g_traqh[69].traqh_code = '7945' LET g_traqh[69].description=  'Other income - admin'
  LET g_traqh[70].traqh_code = '7946' LET g_traqh[70].description=  'Other expense - admin'
  LET g_traqh[71].traqh_code = '5006' LET g_traqh[71].description=  'TOTAL ADMINISTRATION'

  LET g_traqh[72].traqh_code = '5018' LET g_traqh[72].description=  'Staff - After Sales, Service, Spare parts'
  LET g_traqh[73].traqh_code = '5019' LET g_traqh[73].description=  'Service and Support'
  LET g_traqh[74].traqh_code = '5021' LET g_traqh[74].description=  'After sales costs commission'
  LET g_traqh[75].traqh_code = '5020' LET g_traqh[75].description=  'AFTER SALES, SERVICE & SPARE PARTS ADMINISTRATION'

  LET g_traqh[76].traqh_code = '5111' LET g_traqh[76].description=  'TOTAL SG&A EXPENSES'


END FUNCTION

FUNCTION r901_sum_init()

  LET g_traqh_sum.mtd_a = 0
  LET g_traqh_sum.mtd_b = 0
  LET g_traqh_sum.qtd_a = 0
  LET g_traqh_sum.qtd_b = 0
  LET g_traqh_sum.ytd_a = 0
  LET g_traqh_sum.ytd_b = 0
  LET g_traqh_sum.btd_a = 0
  LET g_traqh_sum.btd_b = 0

END FUNCTION
FUNCTION r901_get_sum(p_cnt)

  DEFINE p_cnt   LIKE type_file.num5

  LET g_traqh[p_cnt].mtd_a = g_traqh_sum.mtd_a
  LET g_traqh[p_cnt].mtd_b = g_traqh_sum.mtd_b
  LET g_traqh[p_cnt].qtd_a = g_traqh_sum.qtd_a
  LET g_traqh[p_cnt].qtd_b = g_traqh_sum.qtd_b
  LET g_traqh[p_cnt].ytd_a = g_traqh_sum.ytd_a
  LET g_traqh[p_cnt].ytd_b = g_traqh_sum.ytd_b
  LET g_traqh[p_cnt].btd_a = g_traqh_sum.btd_a
  LET g_traqh[p_cnt].btd_b = g_traqh_sum.btd_b

  LET g_traqh[p_cnt].mtd_diff = g_traqh[p_cnt].mtd_a - g_traqh[p_cnt].mtd_b
  LET g_traqh[p_cnt].mtd_diff = g_traqh[p_cnt].qtd_a - g_traqh[p_cnt].qtd_b
  LET g_traqh[p_cnt].mtd_diff = g_traqh[p_cnt].btd_a - g_traqh[p_cnt].btd_b
  LET g_traqh[p_cnt].mtd_diff = g_traqh[p_cnt].ytd_a - g_traqh[p_cnt].ytd_b
  IF (g_traqh[p_cnt].mtd_a ! =0) THEN
      LET g_traqh[p_cnt].mtd_diff_percent = g_traqh[p_cnt].mtd_diff / g_traqh[p_cnt].mtd_a
      LET g_traqh[p_cnt].mtd_diff_percent = cl_digcut(g_traqh[p_cnt].mtd_diff_percent*100,2)
  ELSE
      LET g_traqh[p_cnt].mtd_diff_percent = 0
  END IF
  IF (g_traqh[p_cnt].qtd_a ! =0) THEN
      LET g_traqh[p_cnt].qtd_diff_percent = g_traqh[p_cnt].qtd_diff / g_traqh[p_cnt].qtd_a
      LET g_traqh[p_cnt].qtd_diff_percent = cl_digcut(g_traqh[p_cnt].qtd_diff_percent*100,2)
  ELSE
      LET g_traqh[p_cnt].qtd_diff_percent = 0
  END IF
  IF (g_traqh[p_cnt].btd_a ! =0) THEN
      LET g_traqh[p_cnt].btd_diff_percent = g_traqh[p_cnt].btd_diff / g_traqh[p_cnt].btd_a
      LET g_traqh[p_cnt].btd_diff_percent = cl_digcut(g_traqh[p_cnt].btd_diff_percent*100,2)
  ELSE
      LET g_traqh[p_cnt].mtd_diff_percent = 0
  END IF
  IF (g_traqh[p_cnt].ytd_a ! =0) THEN
      LET g_traqh[p_cnt].ytd_diff_percent = g_traqh[p_cnt].ytd_diff / g_traqh[p_cnt].ytd_a
      LET g_traqh[p_cnt].ytd_diff_percent = cl_digcut(g_traqh[p_cnt].ytd_diff_percent*100,2)
  ELSE
      LET g_traqh[p_cnt].mtd_diff_percent = 0
  END IF

END FUNCTION

FUNCTION r901_crt_temp()
    DROP TABLE cglr901_tmp
    CREATE TEMP TABLE cglr901_tmp(
       abb13          LIKE abb_file.abb13,
       abb03          LIKE abb_file.abb03,
       abb04          LIKE abb_file.abb04,
       abb07          LIKE abb_file.abb07,
       aba03          LIKE aba_file.aba03,
       aba04          LIKE aba_file.aba04)
    IF STATUS THEN
       CALL cl_err('create tmp',STATUS,0)
       CALL cl_used(g_prog,g_time,2) RETURNING g_time    #FUN-B30211
       EXIT PROGRAM
    END IF
END FUNCTION