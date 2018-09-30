# Prog. Version..: '1.20.01-05.10.07(00006)'     #
# Pattern name...: cxmr002.4gl
# Descriptions...: 應收憑單列印作業
# Date & Author..: 99/08/24 By Carol&Kammy


DATABASE ds

GLOBALS "../../config/top.global"

   DEFINE tm  RECORD                  # Print condition RECORD
              wc       VARCHAR(1000),    # Where condition
              s        VARCHAR(04),         # 订单类型小计
              u        VARCHAR(04),       # 客户编号小计
              more     VARCHAR(01)         # Input more condition(Y/N)
              END RECORD,
          tmf1   VARCHAR(15),
          g_sql     VARCHAR(300),        # RDSQL STATEMENT
          g_tot_bal DECIMAL(13,2)        # User defined variable

DEFINE   g_orderA ARRAY[4] OF VARCHAR(40)  # 篩選排序條件用變數
DEFINE   g_cnt           INTEGER
DEFINE   g_dash          VARCHAR(400)   #Dash line
DEFINE   g_i             SMALLINT   #count/index for any purpose
DEFINE   g_len           SMALLINT   #Report width(79/132/136)
DEFINE   g_pageno        SMALLINT   #Report page no
DEFINE   g_zz05          VARCHAR(1)   #Print tm.wc ?(Y/N)
DEFINE   g_head1         STRING
MAIN
   OPTIONS
       FORM LINE     FIRST + 2,
       MESSAGE LINE  LAST,
       PROMPT LINE   LAST,
       INPUT NO WRAP
   DEFER INTERRUPT                # Supress DEL key function

   IF (NOT cl_user()) THEN
      EXIT PROGRAM
   END IF

   WHENEVER ERROR CALL cl_err_msg_log

   IF (NOT cl_setup("CXM")) THEN
      EXIT PROGRAM
   END IF


   SELECT azi04 INTO t_azi04 FROM azi_file WHERE azi01=g_aza.aza17
   LET g_pdate = ARG_VAL(1)         # Get arguments from command line
   LET g_towhom = ARG_VAL(2)
   LET g_rlang = ARG_VAL(3)
   LET g_bgjob = ARG_VAL(4)
   LET g_prtway = ARG_VAL(5)
   LET g_copies = ARG_VAL(6)
   LET tm.wc = ARG_VAL(7)
   LET tm.s  = ARG_VAL(8)
   LET tm.u  = ARG_VAL(10)
   #No:FUN-570264 --start--
   LET g_rep_user = ARG_VAL(14)
   LET g_rep_clas = ARG_VAL(15)
   LET g_template = ARG_VAL(16)
   #No:FUN-570264 ---end---
    #-----No:MOD-530284-----
   IF cl_null(tm.wc) THEN
      CALL r002_tm(0,0)
   ELSE
      CALL r002()
   END IF
    #-----No:MOD-530284 END-----
END MAIN

FUNCTION r002_tm(p_row,p_col)
   DEFINE p_row,p_col    SMALLINT,
          l_cmd          VARCHAR(1000)

   IF p_row = 0 THEN LET p_row = 3 LET p_col = 14 END IF
   IF g_gui_type MATCHES "[13]" AND fgl_getenv('GUI_VER') = '6' THEN
        LET p_row = 3 LET p_col = 15
   ELSE LET p_row = 3 LET p_col = 14
   END IF

   OPEN WINDOW r002_w AT p_row,p_col
        WITH FORM "cxm/42f/cxmr002"
################################################################################
# START genero shell script ADD
      ATTRIBUTE (STYLE = g_win_style)

    CALL cl_ui_init()

# END genero shell script ADD
################################################################################
   CALL cl_opmsg('p')
   INITIALIZE tm.* TO NULL            # Default condition
   LET tm2.s1  = '1'
   LET tm2.u1  = 'Y'
   LET tm2.u2  = 'N'
   LET tm2.u3  = 'N'
   LET tm2.u4  = 'N'
   LET tm.more = 'N'
   LET g_pdate = g_today
   LET g_rlang = g_lang
   LET g_bgjob = 'N'
   LET g_copies = '1'
WHILE TRUE
   CONSTRUCT BY NAME tm.wc ON oea01,oga02,oga03,oeb04
       ON ACTION locale
           #CALL cl_dynamic_locale()
         LET g_action_choice = "locale"
         EXIT CONSTRUCT

      ON IDLE g_idle_seconds
        CALL cl_on_idle()
        CONTINUE CONSTRUCT

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121

      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121

      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121

      ON ACTION CONTROLP
        CASE
         WHEN INFIELD(oea01)
           CALL cl_init_qry_var()
           LET g_qryparam.form ="q_oea11"
           LET g_qryparam.state = "c"
           CALL cl_create_qry() RETURNING g_qryparam.multiret
           DISPLAY g_qryparam.multiret TO oea01
           NEXT FIELD oea01

         WHEN INFIELD(oga03)
           CALL cl_init_qry_var()
           LET g_qryparam.form ="q_occ"
           LET g_qryparam.state = "c"
           CALL cl_create_qry() RETURNING g_qryparam.multiret
           DISPLAY g_qryparam.multiret TO oga03
           NEXT FIELD oga03

         WHEN INFIELD(oeb04)
           CALL cl_init_qry_var()
           LET g_qryparam.form ="q_ima01"
           LET g_qryparam.state = "c"
           CALL cl_create_qry() RETURNING g_qryparam.multiret
           DISPLAY g_qryparam.multiret TO oeb04
           NEXT FIELD oeb04
       END CASE

      ON ACTION exit
         LET INT_FLAG = 1
         EXIT CONSTRUCT
  END CONSTRUCT
       IF g_action_choice = "locale" THEN
          LET g_action_choice = ""
          CALL cl_dynamic_locale()
          CONTINUE WHILE
       END IF


   IF INT_FLAG THEN
      LET INT_FLAG = 0 CLOSE WINDOW r002_w EXIT PROGRAM
   END IF
   IF tm.wc = ' 1=1' THEN CALL cl_err('','9046',0) CONTINUE WHILE END IF
   INPUT BY NAME tm2.s1,tm2.s2,tm2.s3,tm2.s4,
                 tm2.u1,tm2.u2,tm2.u3,tm2.u4,tm.more
         WITHOUT DEFAULTS

      AFTER FIELD more
         IF tm.more = 'Y'
            THEN CALL cl_repcon(0,0,g_pdate,g_towhom,g_rlang,
                                g_bgjob,g_time,g_prtway,g_copies)
                      RETURNING g_pdate,g_towhom,g_rlang,
                                g_bgjob,g_time,g_prtway,g_copies
         END IF
################################################################################
# START genero shell script ADD
   ON ACTION CONTROLZ
      CALL cl_show_req_fields()
# END genero shell script ADD
################################################################################
      ON ACTION CONTROLG CALL cl_cmdask()    # Command execution
      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE INPUT

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121

      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121


      ON ACTION exit
        LET INT_FLAG = 1
        EXIT INPUT

      AFTER INPUT
         LET tm.s = tm2.s1[1,1],tm2.s2[1,1],tm2.s3[1,1],tm2.s3[1,1]
         LET tm.u = tm2.u1,tm2.u2,tm2.u3,tm2.u4
   END INPUT
   IF INT_FLAG THEN
      LET INT_FLAG = 0 CLOSE WINDOW r002_w EXIT PROGRAM
   END IF
   IF g_bgjob = 'Y' THEN
      SELECT zz08 INTO l_cmd FROM zz_file   # get exec cmd (fglgo xxxx)
             WHERE zz01='cxmr002'
      IF SQLCA.sqlcode OR l_cmd IS NULL THEN
         CALL cl_err('cxmr002','9031',1)
      ELSE
         LET tm.wc=cl_replace_str(tm.wc, "'", "\"")
         LET l_cmd = l_cmd CLIPPED,         # (at time fglgo xxxx p1 p2 p3)
                         " '",g_pdate CLIPPED,"'",
                         " '",g_towhom CLIPPED,"'",
                         " '",g_lang CLIPPED,"'",
                         " '",g_bgjob CLIPPED,"'",
                         " '",g_prtway CLIPPED,"'",
                         " '",g_copies CLIPPED,"'",
                         " '",tm.wc CLIPPED,"'",
                         " '",tm.s CLIPPED,"'",
                         " '",tm.u CLIPPED,"'",
                         " '",g_rep_user CLIPPED,"'",           #No:FUN-570264
                         " '",g_rep_clas CLIPPED,"'",           #No:FUN-570264
                         " '",g_template CLIPPED,"'"            #No:FUN-570264
         CALL cl_cmdat('cxmr002',g_time,l_cmd) # Execute cmd at later time
      END IF
      CLOSE WINDOW r002_w
      EXIT PROGRAM
   END IF
   CALL cl_wait()
   CALL r002()
   ERROR ""
   DROP TABLE r002_tmp
END WHILE
   CLOSE WINDOW r002_w
END FUNCTION

FUNCTION r002()
   DEFINE l_name    VARCHAR(20),        # External(Disk) file name
          l_time    VARCHAR(8),         # Used time for running the job
          l_sql     VARCHAR(1000),       # RDSQL STATEMENT
          l_chr     VARCHAR(1),
          l_head    VARCHAR(10),
          l_za05    VARCHAR(40),
          l_order   ARRAY[5] OF VARCHAR(10),
          sr        RECORD
                    order1  VARCHAR(20),
                    order2  VARCHAR(20),
                    order3  VARCHAR(20),
                    order4  VARCHAR(20),
                    db      VARCHAR(10),
                    oea01   VARCHAR(20),
                    oeb03   VARCHAR(05),
                    oga03   VARCHAR(10),
                    oga032  VARCHAR(40),
                    oga01   VARCHAR(20),
                    ogb03   VARCHAR(05),
                    oga02   LIKE oga_file.oga02,
                    oeb04   VARCHAR(40),
                    ima02   VARCHAR(120),
                    ima021  VARCHAR(120),
                    ogb12   LIKE ogb_file.ogb12,
                    omb14   LIKE omb_file.omb14,
                    zjf_us  LIKE tc_oqd_file.tc_oqd03,
                    oga24  LIKE oga_file.oga24,
                    omb16   LIKE omb_file.omb16,
                    zjf_cn  LIKE tc_oqd_file.tc_oqd03,
                    zdf_in  LIKE tc_oqd_file.tc_oqd03,
                    oea10   LIKE oea_file.oea10,
                    ta_oea01  LIKE oea_file.ta_oea01
                  END RECORD

   DEFINE l_tm      VARCHAR(10)
   DEFINE l_field   VARCHAR(20),
          l_omb14   LIKE omb_file.omb14,           #销售收入US$
          l_zjf_us  LIKE tc_oqd_file.tc_oqd03,     #中介费金额US$
          l_omb16   LIKE omb_file.omb16,           #销售收入（元）
          l_zjf_cn  LIKE tc_oqd_file.tc_oqd03,     #中介费（元）
          l_zdf_in  LIKE tc_oqd_file.tc_oqd03      #印度指导费金额(元）

       CALL cl_used(g_prog,l_time,1) RETURNING l_time #No:MOD-580088  HCN 20050818
     SELECT zo02 INTO g_company FROM zo_file WHERE zo01 = g_rlang
     SELECT zz17,zz05 INTO g_len,g_zz05 FROM zz_file WHERE zz01 = 'cxmr002'
     IF g_len = 0 OR g_len IS NULL THEN LET g_len = 112 END IF
     FOR g_i = 1 TO g_len LET g_dash[g_i,g_i] = '=' END FOR

     CALL r002_create()

     #IF g_priv2='4' THEN                           #只能使用自己的資料
     #    LET tm.wc = tm.wc clipped," AND omauser = '",g_user,"'"
     #END IF
     #IF g_priv3='4' THEN                           #只能使用相同群的資料
     #    LET tm.wc = tm.wc clipped," AND omagrup MATCHES '",g_grup CLIPPED,"*'"
     #END IF
     LET l_sql = "SELECT OEA01,OEB03,OGA03,OGA032,OGA01,OGB03,OGA02,OEB04,IMA02,",
                 "IMA021,OGB12,NVL(OMB14,0) OMB14,OGA24,NVL(OMB16,0) OMB16,OEA10,NVL(TA_OEA01,' ') TA_OEA01",
                 " FROM OGA_FILE,OGB_FILE LEFT JOIN OMB_FILE ON OMB01 = OGB01",
                 " AND OMB03=OGB03,OEA_FILE,OEB_FILE LEFT JOIN IMA_FILE ON OEB04=IMA01",
                 " WHERE OGB31=OEB01 AND OGB32=OEB03 AND OGA01=OGB01 AND OEA01=OEB01 ",
                 " AND oga23='USD' AND ogapost='Y' AND substr(oga01,1,3)!='502' AND ",tm.wc CLIPPED
    LET l_sql = " INSERT INTO r002_tmp SELECT x.OEA01,x.OEB03,x.OGA03,x.OGA032,x.OGA01,x.OGB03,x.OGA02,",
                "x.OEB04,x.IMA02,x.IMA021,x.OGB12,x.OMB14,NVL(TC_OQD03*X.OGB12,0) zjf_us,x.OGA24,x.OMB16,",
                "ROUND(NVL(TC_OQD03/X.OGA24*X.OGB12,0),6) zjf_cn,NVL(TC_OQD04*X.OGB12,0) zjf_cn,x.OEA10,x.TA_OEA01",
                " FROM (",l_sql CLIPPED ,") x LEFT JOIN tc_oqd_file ON tc_oqd01 = YEAR(x.oga02) AND ",
                " tc_oqd02 = x.oeb04"



      PREPARE r002_ins_tmp FROM l_sql
      IF SQLCA.sqlcode != 0 THEN
         CALL cl_err('r002_ins_tmp:',SQLCA.sqlcode,1)
      END IF
      EXECUTE r002_ins_tmp



     LET l_sql = "SELECT '','','','',SUBSTR(x.oea01,1,3),x.* FROM r002_tmp x   "
     #IF tm.b='Y' THEN
     #   LET l_sql = l_sql,"oea01 LIKE '?%'"
     #ELSE
     #   LET l_sql = l_sql,l_tm CLIPPED," = ? "
     #END IF
     PREPARE r002_prepare2 FROM l_sql
     IF STATUS THEN CALL cl_err('prepare:',STATUS,1) EXIT PROGRAM END IF
     DECLARE r002_curs2 CURSOR FOR r002_prepare2

     display "prog:",g_prog
     CALL cl_outnam('cxmr002') RETURNING l_name
     START REPORT r002_rep TO l_name
     LET g_pageno = 0

     FOREACH r002_curs2 INTO sr.*
        IF SQLCA.sqlcode != 0 THEN
            CALL cl_err('foreach:',SQLCA.sqlcode,1)
            EXIT FOREACH
        END IF
        # add by lixwz 180129 s
        IF sr.oea01 MATCHES "OUA*" THEN
            LET sr.zdf_in = 0
        END IF
        IF sr.oea01 MATCHES "OUD*" THEN
            LET sr.zjf_cn = 0
            LET sr.zjf_us = 0
        END IF
        # add by lixwz 180129 e
        FOR g_i = 1 TO 4
            CASE
                WHEN tm.s[g_i,g_i] = '1' LET l_order[g_i] = sr.db
                                         LET g_orderA[g_i]= g_x[20]
                WHEN tm.s[g_i,g_i] = '2' LET l_order[g_i] = sr.oga03
                                         LET g_orderA[g_i]= g_x[21]
                WHEN tm.s[g_i,g_i] = '3' LET l_order[g_i] = sr.oea01
                                         LET g_orderA[g_i]= g_x[22]
                WHEN tm.s[g_i,g_i] = '4' LET l_order[g_i] = sr.oeb04
                                         LET g_orderA[g_i]= g_x[23]
                OTHERWISE LET l_order[g_i]  = '-'
                             LET g_orderA[g_i] = ' '
            END CASE
        END FOR
        LET sr.order1 = l_order[1]
        LET sr.order2 = l_order[2]
        LET sr.order3 = l_order[3]
        LET sr.order4 = l_order[4]
        OUTPUT TO REPORT r002_rep(sr.*)

     END FOREACH
     #FOREACH r002_curs1 INTO sr.*
     #  IF SQLCA.sqlcode != 0 THEN
     #     CALL cl_err('foreach:',SQLCA.sqlcode,1)
     #     EXIT FOREACH
     #  END IF
     #  OUTPUT TO REPORT r002_rep(sr.*)
     #  CALL r002_upd(sr.oma.oma01)
     #END FOREACH
     FINISH REPORT r002_rep
     CALL cl_prt(l_name,g_prtway,g_copies,g_len)
       CALL cl_used(g_prog,l_time,2) RETURNING l_time #No:MOD-580088  HCN 20050818
END FUNCTION

REPORT r002_rep(sr)
DEFINE l_last_sw    VARCHAR(1),
       sr        RECORD
              order1 VARCHAR(20),
              order2 VARCHAR(20),
              order3 VARCHAR(20),
              order4 VARCHAR(20),
              db      VARCHAR(10),
              oea01   VARCHAR(20),
              oeb03   VARCHAR(05),
              oga03   VARCHAR(10),
              oga032  VARCHAR(40),
              oga01   VARCHAR(20),
              ogb03   VARCHAR(05),
              oga02   LIKE oga_file.oga02,
              oeb04   VARCHAR(40),
              ima02   VARCHAR(120),
              ima021  VARCHAR(120),
              ogb12   LIKE ogb_file.ogb12,
              omb14   LIKE omb_file.omb14,
              zjf_us  LIKE tc_oqd_file.tc_oqd03,
              oga24   LIKE oga_file.oga23,
              omb16   LIKE omb_file.omb16,
              zjf_cn  LIKE tc_oqd_file.tc_oqd03,
              zdf_in  LIKE tc_oqd_file.tc_oqd03,
              oea10   LIKE oea_file.oea10,
              ta_oea01  LIKE oea_file.ta_oea01
         END RECORD,
      sr1           RECORD                 #No.8991
                             curr      VARCHAR(04),
                             amt       LIKE oeb_file.oeb14
                      END RECORD,
                  l_str   VARCHAR(40),              #FUN-4C0096 add
                  l_str1  VARCHAR(40),              #FUN-4C0096 add
                  l_str2  VARCHAR(40),              #FUN-4C0096 add
                  l_str3  VARCHAR(40),              #FUN-4C0096 add
                  l_ima021 LIKE ima_file.ima021, #FUN-4C0096 add
      l_rowno SMALLINT,
      l_amt_1 LIKE oeb_file.oeb14,   #FUN-4C0096 modify
      l_amt_2 LIKE oeb_file.oeb14,    #FUN-4C0096 modify
      l_amt_3 LIKE oeb_file.oeb14,
      l_amt_4 LIKE oeb_file.oeb14,
      l_amt_5 LIKE oeb_file.oeb14

  OUTPUT TOP MARGIN 0
         LEFT MARGIN 0
         BOTTOM MARGIN 5
         PAGE LENGTH g_page_line

  ORDER EXTERNAL BY sr.order1,sr.order2,sr.order3,sr.order4     #No:8262

  #格式設定
  FORMAT
   #列印表頭
   PAGE HEADER
      PRINT COLUMN ((g_len-length(g_company))/2)+1,g_company
      PRINT COLUMN ((g_len-length(g_x[1]))/2)+1,g_x[1]
      LET g_pageno = g_pageno + 1
      LET pageno_total = PAGENO USING '<<<','/pageno'
      PRINT g_head CLIPPED, pageno_total
      LET g_head1 = g_x[13] CLIPPED,
                    g_orderA[1] CLIPPED,'-',
                    g_orderA[2] CLIPPED,'-',
                    g_orderA[3] CLIPPED,'-',
                    g_orderA[4] CLIPPED
      PRINT g_head1

      PRINT g_dash[1,g_len]
      PRINT g_x[31],
            g_x[32],
            g_x[33],
            g_x[34],
            g_x[35],
            g_x[36],
            g_x[37],
            g_x[38],
            g_x[39],
            g_x[40],
            g_x[41],
            g_x[42],
            g_x[43],
            g_x[44],
            g_x[45],
            g_x[46],
            g_x[47],
            g_x[48],
            g_x[49]
      PRINT g_dash1
      LET l_last_sw = 'n'


  BEFORE GROUP OF sr.order1
      #IF tm.t[1,1] = 'Y'           #跳頁控制
      #   THEN SKIP TO TOP OF PAGE
      #END IF
  BEFORE GROUP OF sr.order2

  BEFORE GROUP OF sr.order3

  BEFORE GROUP OF sr.order4

  #BEFORE GROUP OF sr.oea01
  #    SELECT azi03,azi04,azi05
  #      INTO g_azi03,g_azi04,g_azi05
  #      FROM azi_file
  #     WHERE azi01='USD'
  #   PRINT COLUMN g_c[31],sr.oea01 CLIPPED,
  #         #COLUMN g_c[32],sr.oeb03 CLIPPED,
  #         COLUMN g_c[33],sr.oga03 CLIPPED,
  #         COLUMN g_c[34],sr.oga032 CLIPPED,
  #         COLUMN g_c[35],sr.oga01 CLIPPED,
  #         #COLUMN g_c[36],sr.ogb03 CLIPPED,
  #         COLUMN g_c[37],sr.oga02 CLIPPED,
  #         #COLUMN g_c[38],sr.oeb04 CLIPPED,
  #         #COLUMN g_c[39],sr.ima02 CLIPPED,
  #         #COLUMN g_c[40],sr.ima021 CLIPPED,
  #         #COLUMN g_c[41],sr.ogb12 CLIPPED,
  #         #COLUMN g_c[42],sr.omb14 CLIPPED,
  #         #COLUMN g_c[43],sr.zjf_us CLIPPED,
  #         #COLUMN g_c[44],sr.oga24 CLIPPED,
  #         #COLUMN g_c[45],sr.omb16 CLIPPED,
  #         #COLUMN g_c[46],sr.zjf_cn CLIPPED,
  #         #COLUMN g_c[47],sr.zdf_in CLIPPED,
  #         COLUMN g_c[48],sr.oea10 CLIPPED,
  #         COLUMN g_c[49],sr.ta_oea01 CLIPPED;

    ON EVERY ROW

      PRINT COLUMN g_c[31],sr.oea01 CLIPPED,
            COLUMN g_c[32],sr.oeb03 CLIPPED,
            COLUMN g_c[33],sr.oga03 CLIPPED,
            COLUMN g_c[34],sr.oga032 CLIPPED,
            COLUMN g_c[35],sr.oga01 CLIPPED,
            COLUMN g_c[36],sr.ogb03 CLIPPED,
            COLUMN g_c[37],sr.oga02 CLIPPED,
            COLUMN g_c[38],sr.oeb04 CLIPPED,
            COLUMN g_c[39],sr.ima02 CLIPPED,
            COLUMN g_c[40],sr.ima021 CLIPPED,
            COLUMN g_c[41],sr.ogb12 CLIPPED,
            COLUMN g_c[42],sr.omb14 CLIPPED,
            COLUMN g_c[43],sr.zjf_us CLIPPED,
            COLUMN g_c[44],sr.oga24 CLIPPED,
            COLUMN g_c[45],sr.omb16 CLIPPED,
            COLUMN g_c[46],sr.zjf_cn CLIPPED,
            COLUMN g_c[47],sr.zdf_in CLIPPED,
            COLUMN g_c[48],sr.oea10 CLIPPED,
            COLUMN g_c[49],sr.ta_oea01 CLIPPED;

        PRINT ''
      #No.8991
      #INSERT INTO curr_tmp VALUES(sr.omb14 ,sr.zjf_us,sr.omb16 ,sr.zjf_cn,sr.zdf_in,
      #                            sr.order1,sr.order2,sr.order3,sr.order4)
  AFTER GROUP OF sr.order1            #金額小計
      IF tm.u[1,1] = 'Y' THEN
         LET l_amt_1 = GROUP SUM(sr.omb14)
         LET l_amt_2 = GROUP SUM(sr.zjf_us)
         LET l_amt_3 = GROUP SUM(sr.omb16)
         LET l_amt_4 = GROUP SUM(sr.zjf_cn)
         LET l_amt_5 = GROUP SUM(sr.zdf_in)
         PRINT COLUMN g_c[40],g_orderA[1] CLIPPED,sr.order1 CLIPPED,
               COLUMN g_c[41],g_x[11] CLIPPED,
               COLUMN g_c[42],l_amt_1 USING '############.##',
               COLUMN g_c[43],l_amt_2 USING '############.##',
               COLUMN g_c[45],l_amt_3 USING '############.##',
               COLUMN g_c[46],l_amt_4 USING '############.##',
               COLUMN g_c[47],l_amt_5 USING '############.##';
         #No.8991
         #FOREACH tmp1_cs USING sr.order1 INTO sr1.*
         #    SELECT azi05 INTO g_azi05 FROM azi_file
         #     WHERE azi01 = sr1.curr
         #    LET l_str = sr1.curr CLIPPED,':'
         #    PRINT COLUMN g_c[54],l_str CLIPPED,
         #          COLUMN g_c[55],cl_numfor(sr1.amt,55,g_azi05) CLIPPED
         #END FOREACH
         #No.8991(end)
     PRINT ''
      END IF

  AFTER GROUP OF sr.order2            #金額小計
      IF tm.u[2,2] = 'Y' THEN
         LET l_amt_1 = GROUP SUM(sr.omb14)
         LET l_amt_2 = GROUP SUM(sr.zjf_us)
         LET l_amt_3 = GROUP SUM(sr.omb16)
         LET l_amt_4 = GROUP SUM(sr.zjf_cn)
         LET l_amt_5 = GROUP SUM(sr.zdf_in)
         PRINT COLUMN g_c[40],g_orderA[2] CLIPPED,sr.order2 CLIPPED,
               COLUMN g_c[41],g_x[11] CLIPPED,
               COLUMN g_c[42],l_amt_1 USING '############.##',
               COLUMN g_c[43],l_amt_2 USING '############.##',
               COLUMN g_c[45],l_amt_3 USING '############.##',
               COLUMN g_c[46],l_amt_4 USING '############.##',
               COLUMN g_c[47],l_amt_5 USING '############.##';
         PRINT ''
      END IF

  AFTER GROUP OF sr.order3            #金額小計
      IF tm.u[3,3] = 'Y' THEN
         LET l_amt_1 = GROUP SUM(sr.omb14)
         LET l_amt_2 = GROUP SUM(sr.zjf_us)
         LET l_amt_3 = GROUP SUM(sr.omb16)
         LET l_amt_4 = GROUP SUM(sr.zjf_cn)
         LET l_amt_5 = GROUP SUM(sr.zdf_in)
         PRINT COLUMN g_c[40],g_orderA[3] CLIPPED,sr.order3 CLIPPED,
               COLUMN g_c[41],g_x[11] CLIPPED,
               COLUMN g_c[42],l_amt_1 USING '############.##',
               COLUMN g_c[43],l_amt_2 USING '############.##',
               COLUMN g_c[45],l_amt_3 USING '############.##',
               COLUMN g_c[46],l_amt_4 USING '############.##',
               COLUMN g_c[47],l_amt_5 USING '############.##';
         PRINT ''
      END IF

  AFTER GROUP OF sr.order4            #金額小計
      IF tm.u[4,4] = 'Y' THEN
         LET l_amt_1 = GROUP SUM(sr.omb14)
         LET l_amt_2 = GROUP SUM(sr.zjf_us)
         LET l_amt_3 = GROUP SUM(sr.omb16)
         LET l_amt_4 = GROUP SUM(sr.zjf_cn)
         LET l_amt_5 = GROUP SUM(sr.zdf_in)
         PRINT COLUMN g_c[40],g_orderA[4] CLIPPED,sr.order4 CLIPPED,
               COLUMN g_c[41],g_x[11] CLIPPED,
               COLUMN g_c[42],l_amt_1 USING '############.##',
               COLUMN g_c[43],l_amt_2 USING '############.##',
               COLUMN g_c[45],l_amt_3 USING '############.##',
               COLUMN g_c[46],l_amt_4 USING '############.##',
               COLUMN g_c[47],l_amt_5 USING '############.##';
         PRINT ''
      END IF

  ON LAST ROW                         #金額總計
      PRINT ''
      LET l_amt_1 = GROUP SUM(sr.omb14)
      LET l_amt_2 = GROUP SUM(sr.zjf_us)
      LET l_amt_3 = GROUP SUM(sr.omb16)
      LET l_amt_4 = GROUP SUM(sr.zjf_cn)
      LET l_amt_5 = GROUP SUM(sr.zdf_in)
      PRINT COLUMN g_c[41],g_x[12] CLIPPED,
            COLUMN g_c[42],l_amt_1 USING '############.##',
            COLUMN g_c[43],l_amt_2 USING '############.##',
            COLUMN g_c[45],l_amt_3 USING '############.##',
            COLUMN g_c[46],l_amt_4 USING '############.##',
            COLUMN g_c[47],l_amt_5 USING '############.##';
      #No.8991
      #FOREACH tmp4_cs INTO sr1.*
      #    SELECT azi05 INTO g_azi05 FROM azi_file
      #     WHERE azi01 = sr1.curr
      #    LET l_str = sr1.curr CLIPPED,':'
      #    PRINT COLUMN g_c[54],l_str CLIPPED,
      #          COLUMN g_c[55],cl_numfor(sr1.amt,55,g_azi05)
      #END FOREACH
      #No.8991(end)
      PRINT ''

      #是否列印選擇條件
      IF g_zz05 = 'Y' THEN
         CALL cl_wcchp(tm.wc,'oea01,oea02,oea03,oea04,oea05')
              RETURNING tm.wc
         PRINT g_dash[1,g_len]
              IF tm.wc[001,070] > ' ' THEN            # for 80
         PRINT g_x[8] CLIPPED,tm.wc[001,070] CLIPPED END IF
              IF tm.wc[071,140] > ' ' THEN
          PRINT COLUMN 10,     tm.wc[071,140] CLIPPED END IF
              IF tm.wc[141,210] > ' ' THEN
          PRINT COLUMN 10,     tm.wc[141,210] CLIPPED END IF
              IF tm.wc[211,280] > ' ' THEN
          PRINT COLUMN 10,     tm.wc[211,280] CLIPPED END IF
      END IF
      PRINT g_dash[1,g_len]
      LET l_last_sw = 'y'
## FUN-550127
     #PRINT COLUMN g_c[31],g_x[4] CLIPPED,
     #      COLUMN g_c[34],g_x[5] CLIPPED,
     #      COLUMN g_c[37],g_x[9] CLIPPED,
     #      COLUMN g_c[40],g_x[10] CLIPPED,
      PRINT  COLUMN g_len-9,g_x[7] CLIPPED  #No.MOD-580212

  #表尾列印
   PAGE TRAILER
      IF l_last_sw = 'n' THEN
         PRINT g_dash[1,g_len]
     #   PRINT COLUMN g_c[31],g_x[4] CLIPPED,
     #         COLUMN g_c[34],g_x[5] CLIPPED,
     #         COLUMN g_c[37],g_x[9] CLIPPED,
     #         COLUMN g_c[40],g_x[10] CLIPPED,
      PRINT     COLUMN g_len-9,g_x[6] CLIPPED  #No.MOD-580212
      ELSE
         SKIP 2 LINE
      END IF
      PRINT
      IF l_last_sw = 'n' THEN
         IF g_memo_pagetrailer THEN
             PRINT g_x[4]
             PRINT g_memo
         ELSE
             PRINT
             PRINT
         END IF
      ELSE
             PRINT g_x[4]
             PRINT g_memo
      END IF

END REPORT

FUNCTION r002_create()

DROP TABLE r002_tmp
#DROP TABLE curr_tmp

CREATE TEMP TABLE r002_tmp
(oea01   VARCHAR(20),                   #订单单号
 oeb03   VARCHAR(05),                   #项次
 oga03   VARCHAR(10),                   #出货客户编号
 oga032  VARCHAR(40),                   #出货客户名称
 oga01   VARCHAR(20),                   #出货单号
 ogb03   VARCHAR(05),                   #项次
 oga02   DATE,                          #出货日期
 oeb04   VARCHAR(40),                   #产品编号
 ima02   VARCHAR(120),                  #品名
 ima021  VARCHAR(120),                  #规格
 ogb12   DEC(15,3),                     #出货数量
 omb14   DEC(20,6),                     #销售收入US$
 zjf_us  DEC(20,6),                     #中介费金额US$
 oga24   DEC(20,10),                    #出货月初汇率
 omb16   DEC(20,6),                     #销售收入（元）
 zjf_cn  DEC(20,6),                     #中介费（元）
 zdf_in  DEC(20,6),                     #印度指导费金额(元）
 oea10   VARCHAR(40),                   #订单号
 ta_oea01  VARCHAR(120)                  #工程名
 );

#CREATE TEMP TABLE r001_tmp
#(
#  omb14   LIKE omb_file.omb14,           #销售收入US$
#  zjf_us  LIKE tc_oqd_file.tc_oqd03,     #中介费金额US$
#  omb16   LIKE omb_file.omb16,           #销售收入（元）
#  zjf_cn  LIKE tc_oqd_file.tc_oqd03,     #中介费（元）
#  zdf_in  LIKE tc_oqd_file.tc_oqd03,     #印度指导费金额(元）
#  order1  VARCHAR(20),
#  order2  VARCHAR(20),
#  order3  VARCHAR(20),
#  order4  VARCHAR(20)
#);

END FUNCTION