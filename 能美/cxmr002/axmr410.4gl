# Prog. Version..: '1.20.01-05.08.29(00003)'     #
# Pattern name...: axmr410.4gl
# Descriptions...: 客戶訂單明細表
# Date & Author..: 95/01/07 by Nick
# Modify.........: No.8262 03/09/26 Carol 選擇排列項目,報表不會排序
#                                         --> 修改report 的order by
# Modify.........: No.8991 04/01/28 Kammy 應區分不同幣別列印
# Modify.........: No.FUN-4A0016 04/10/04 Echo 訂單單號,帳款客戶,送貨客戶,人員編號要開窗
# Modify.........: No:FUN-4C0096 04/12/21 By Carol 修改報表架構轉XML
# Modify.........: No.FUN-530031 05/03/22 By Carol 單價/金額欄位所用的變數型態應為 dec(20,6),匯率 dec(20,10)
# Modify.........: No:FUN-550127 05/05/30 By echo 新增報表備註
 # Modify.........: No.MOD-580212 05/08/22 By ice  修改報表頁尾列印格式

DATABASE ds

GLOBALS "../../config/top.global"

DEFINE tm  RECORD
           wc      VARCHAR(500),            # QBE 條件
           s       VARCHAR(03),             # 排列 (INPUT 條件)
           t       VARCHAR(03),             # 跳頁 (INPUT 條件)
           u       VARCHAR(03),             # 合計 (INPUT 條件)
           a       VARCHAR(01),
           b       VARCHAR(01),
           c       VARCHAR(01),
           more    VARCHAR(01)              # 輸入其它特殊列印條件
           END RECORD
DEFINE   g_orderA ARRAY[3] OF VARCHAR(10)  # 篩選排序條件用變數
DEFINE   g_i             SMALLINT        #count/index for any purpose
DEFINE   g_head1         STRING

MAIN
   OPTIONS
       FORM LINE     FIRST + 2,
       MESSAGE LINE  LAST,
       PROMPT LINE   LAST,
       INPUT NO WRAP
   DEFER INTERRUPT

   #--外部程式傳遞參數或 Background Job 時接受參數 --#
   LET g_pdate  = ARG_VAL(1)
   LET g_towhom = ARG_VAL(2)
   LET g_rlang  = ARG_VAL(3)
   LET g_bgjob  = ARG_VAL(4)
   LET g_prtway = ARG_VAL(5)
   LET g_copies = ARG_VAL(6)
   LET tm.wc    = ARG_VAL(7)
   LET tm.s     = ARG_VAL(8)
   LET tm.t     = ARG_VAL(9)
   LET tm.u     = ARG_VAL(10)
   LET tm.a     = ARG_VAL(11)
   LET tm.b     = ARG_VAL(12)
   LET tm.c     = ARG_VAL(13)
   LET tm.more  = ARG_VAL(14)
   #No:FUN-570264 --start--
   LET g_rep_user = ARG_VAL(15)
   LET g_rep_clas = ARG_VAL(16)
   LET g_template = ARG_VAL(17)
   #No:FUN-570264 ---end---

   IF (NOT cl_user()) THEN
      EXIT PROGRAM
   END IF

   WHENEVER ERROR CALL cl_err_msg_log

   IF (NOT cl_setup("AXM")) THEN
      EXIT PROGRAM
   END IF

   #No.8991
   #DROP TABLE curr_tmp
   CREATE TEMP TABLE curr_tmp
    (curr    VARCHAR(04),                    #幣別
     amt     DEC(20,6),                   #金額   #FUN-4C0096 modify type
     order1  VARCHAR(20),
     order2  VARCHAR(20),
     order3  VARCHAR(20)
    );
   #No.8991(end)

   IF NOT cl_null(tm.wc) THEN
      CALL r410()
      DROP TABLE curr_tmp
   ELSE
      CALL r410_tm(0,0)
   END IF
END MAIN

FUNCTION r410_tm(p_row,p_col)
DEFINE p_row,p_col    SMALLINT
DEFINE l_cmd          VARCHAR(1000)

   #開啟視窗
   LET p_row = 3 LET p_col = 11
   OPEN WINDOW r410_w AT p_row,p_col WITH FORM "axm/42f/axmr410"
      ATTRIBUTE (STYLE = g_win_style)
   CALL cl_ui_init()
   CALL cl_opmsg('p')

   #預設畫面欄位
   INITIALIZE tm.* TO NULL
   LET tm2.s1  = '1'
   LET tm2.u1  = 'Y'
   LET tm2.u2  = 'N'
   LET tm2.u3  = 'N'
   LET tm2.t1  = 'N'
   LET tm2.t2  = 'N'
   LET tm2.t3  = 'N'
   LET tm.a    = '3'
   LET tm.b    = '3'
   LET tm.c    = 'N'
   LET tm.more = 'N'
   LET g_pdate = g_today
   LET g_rlang = g_lang
   LET g_bgjob = 'N'
   LET g_copies = '1'

WHILE TRUE

   # QBE
   CONSTRUCT BY NAME tm.wc ON oea01,oea02,oea03,oea04,
                              oea14,oea15,oea23,oea12,oeahold
       ON ACTION locale
          LET g_action_choice = "locale"
          EXIT CONSTRUCT

       #### No:FUN-4A0016
       ON ACTION CONTROLP
           CASE
              WHEN INFIELD(oea01)
                CALL cl_init_qry_var()
                LET g_qryparam.form = "q_oea5"
                LET g_qryparam.state = 'c'
                CALL cl_create_qry() RETURNING g_qryparam.multiret
                DISPLAY g_qryparam.multiret TO oea01
                NEXT FIELD oea01

              WHEN INFIELD(oea03)
                CALL cl_init_qry_var()
                LET g_qryparam.form = "q_occ"
                LET g_qryparam.state = 'c'
                CALL cl_create_qry() RETURNING g_qryparam.multiret
                DISPLAY g_qryparam.multiret TO oea03
                NEXT FIELD oea03

              WHEN INFIELD(oea04)
                CALL cl_init_qry_var()
                LET g_qryparam.form = "q_occ"
                LET g_qryparam.state = 'c'
                CALL cl_create_qry() RETURNING g_qryparam.multiret
                DISPLAY g_qryparam.multiret TO oea04
                NEXT FIELD oea04

              WHEN INFIELD(oea14)
                CALL cl_init_qry_var()
                LET g_qryparam.form = "q_gen"
                LET g_qryparam.state = 'c'
                CALL cl_create_qry() RETURNING g_qryparam.multiret
                DISPLAY g_qryparam.multiret TO oea14
                NEXT FIELD oea14

              WHEN INFIELD(oea15)
                CALL cl_init_qry_var()
                LET g_qryparam.form = "q_gem"
                LET g_qryparam.state = 'c'
                CALL cl_create_qry() RETURNING g_qryparam.multiret
                DISPLAY g_qryparam.multiret TO oea15
                NEXT FIELD oea15

           END CASE
      ### END  No:FUN-4A0016

       ON IDLE g_idle_seconds
          CALL cl_on_idle()
          CONTINUE CONSTRUCT

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121

      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121

      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121


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
      LET INT_FLAG = 0
      CLOSE WINDOW r410_w
      EXIT PROGRAM
   END IF
   IF tm.wc = ' 1=1' THEN
      CALL cl_err('','9046',0) CONTINUE WHILE
   END IF


   # INPUT
   INPUT BY NAME tm2.s1,tm2.s2,tm2.s3,
                 tm2.t1,tm2.t2,tm2.t3,
                 tm2.u1,tm2.u2,tm2.u3,
                 tm.a,tm.b,tm.c,tm.more
      WITHOUT DEFAULTS
      AFTER FIELD a
         IF tm.a NOT MATCHES '[123]' THEN NEXT FIELD a END IF
      AFTER FIELD b
         IF tm.b NOT MATCHES '[123]' THEN NEXT FIELD b END IF
      AFTER FIELD c
         IF tm.c NOT MATCHES '[YN]' THEN NEXT FIELD c END IF
      AFTER FIELD more    #是否輸入其它特殊條件
         IF tm.more = 'Y' THEN
            CALL cl_repcon(0,0,g_pdate,g_towhom,g_rlang,
                           g_bgjob,g_time,g_prtway,g_copies)
            RETURNING g_pdate,g_towhom,g_rlang,
                      g_bgjob,g_time,g_prtway,g_copies
         END IF
      ON ACTION CONTROLZ
         CALL cl_show_req_fields()
      ON ACTION CONTROLG
         CALL cl_cmdask()

      AFTER INPUT
         LET tm.s = tm2.s1[1,1],tm2.s2[1,1],tm2.s3[1,1]
         LET tm.t = tm2.t1,tm2.t2,tm2.t3
         LET tm.u = tm2.u1,tm2.u2,tm2.u3

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
   END INPUT
   IF INT_FLAG THEN
      LET INT_FLAG = 0
      CLOSE WINDOW r410_w
      EXIT PROGRAM
   END IF

   #選擇延後執行本作業 ( Background Job 設定)
   IF g_bgjob = 'Y' THEN
      SELECT zz08 INTO l_cmd FROM zz_file
             WHERE zz01='axmr410'
      IF SQLCA.sqlcode OR l_cmd IS NULL THEN
         CALL cl_err('axmr410','9031',1)
      ELSE
         LET tm.wc=cl_replace_str(tm.wc, "'", "\"")
         LET l_cmd = l_cmd CLIPPED,
                         " '",g_pdate CLIPPED,"'",
                         " '",g_towhom CLIPPED,"'",
                         " '",g_lang CLIPPED,"'",
                         " '",g_bgjob CLIPPED,"'",
                         " '",g_prtway CLIPPED,"'",
                         " '",g_copies CLIPPED,"'",
                         " '",tm.wc CLIPPED,"'",
                         " '",tm.s CLIPPED,"'",
                         " '",tm.t CLIPPED,"'",
                         " '",tm.u CLIPPED,"'",
                         " '",g_rep_user CLIPPED,"'",           #No:FUN-570264
                         " '",g_rep_clas CLIPPED,"'",           #No:FUN-570264
                         " '",g_template CLIPPED,"'"            #No:FUN-570264
         CALL cl_cmdat('axmr410',g_time,l_cmd)
      END IF
      CLOSE WINDOW r410_w
      EXIT PROGRAM
   END IF

   CALL cl_wait()  # 列印中，請稍候
   #開始製作報表
   CALL r410()
   ERROR ""
   DROP TABLE curr_tmp
END WHILE
CLOSE WINDOW r410_w
END FUNCTION

FUNCTION r410()
DEFINE l_name    VARCHAR(20)          # External(Disk) file name
DEFINE l_time    VARCHAR(8)           # Used time for running the job
DEFINE l_sql     VARCHAR(1000)        # SQL STATEMENT
DEFINE l_za05    VARCHAR(40)
DEFINE l_order   ARRAY[5] OF VARCHAR(10)
DEFINE sr        RECORD order1  VARCHAR(20),
                        order2  VARCHAR(20),
                        order3  VARCHAR(20),
                        oea01   LIKE oea_file.oea01,
                        oea02   LIKE oea_file.oea02,
                        oea03   LIKE oea_file.oea03,
                        oea032  LIKE oea_file.oea032,	#客戶簡稱
                        oea04   LIKE oea_file.oea04,	#客戶編號
                        occ02   LIKE occ_file.occ02,	#客戶簡稱
                        gen02   LIKE gen_file.gen02,
                        gem02   LIKE gem_file.gem02,
                        oea23   LIKE oea_file.oea23,
                        oea21   LIKE oea_file.oea21,
                        oea12   LIKE oea_file.oea12,
                        oea31   LIKE oea_file.oea31,
                        oea32   LIKE oea_file.oea32,
                        oeahold LIKE oea_file.oeahold,
                        oeaconf LIKE oea_file.oeaconf,
                        oea14   LIKE oea_file.oea14,    #FUN-4C0096
                        oea15   LIKE oea_file.oea15,    #FUN-4C0096
                        oeb03   LIKE oeb_file.oeb03,
                        oeb04   LIKE oeb_file.oeb04,
                        oeb06   LIKE oeb_file.oeb06,
                        oeb05   LIKE oeb_file.oeb05,
                        oeb12   LIKE oeb_file.oeb12,
                        oeb13   LIKE oeb_file.oeb13,
                        oeb14   LIKE oeb_file.oeb14,
                        oeb15   LIKE oeb_file.oeb15
                        END RECORD

       CALL cl_used(g_prog,l_time,1) RETURNING l_time #No:MOD-580088  HCN 20050818
     #抓取公司名稱
     SELECT zo02 INTO g_company FROM zo_file WHERE zo01 = g_rlang
     FOR g_i = 1 TO g_len LET g_dash[g_i,g_i] = '=' END FOR

     IF g_priv2='4' THEN                   #只能使用自己的資料
         LET tm.wc = tm.wc clipped," AND oeauser = '",g_user,"'"
     END IF
     IF g_priv3='4' THEN                   #只能使用相同群的資料
         LET tm.wc = tm.wc clipped," AND oeagrup MATCHES '",g_grup CLIPPED,"*'"
     END IF

     #No.8991   (針對幣別加總)
     DELETE FROM curr_tmp;

     LET l_sql=" SELECT curr,SUM(amt) FROM curr_tmp ",    #group 1 小計
               "  WHERE order1=? ",
               "  GROUP BY curr"
     PREPARE tmp1_pre FROM l_sql
     IF SQLCA.sqlcode THEN CALL cl_err('pre_1:',SQLCA.sqlcode,1) RETURN END IF
     DECLARE tmp1_cs CURSOR FOR tmp1_pre

     LET l_sql=" SELECT curr,SUM(amt) FROM curr_tmp ",    #group 2 小計
               "  WHERE order1=? ",
               "    AND order2=? ",
               "  GROUP BY curr  "
     PREPARE tmp2_pre FROM l_sql
     IF SQLCA.sqlcode THEN CALL cl_err('pre_2:',SQLCA.sqlcode,1) RETURN END IF
     DECLARE tmp2_cs CURSOR FOR tmp2_pre
     LET l_sql=" SELECT curr,SUM(amt) FROM curr_tmp ",    #group 3 小計
               "  WHERE order1=? ",
               "    AND order2=? ",
               "    AND order3=? ",
               "  GROUP BY curr  "
     PREPARE tmp3_pre FROM l_sql
     IF SQLCA.sqlcode THEN CALL cl_err('pre_3:',SQLCA.sqlcode,1) RETURN END IF
     DECLARE tmp3_cs CURSOR FOR tmp3_pre

     LET l_sql=" SELECT curr,SUM(amt) FROM curr_tmp ",    #on last row 總計
               "  GROUP BY curr  "
     PREPARE tmp4_pre FROM l_sql
     IF SQLCA.sqlcode THEN CALL cl_err('pre_4:',SQLCA.sqlcode,1) RETURN END IF
     DECLARE tmp4_cs CURSOR FOR tmp4_pre
     #No.8991(end)


     SELECT azi03,azi04,azi05
       INTO g_azi03,g_azi04,g_azi05          #幣別檔小數位數讀取
       FROM azi_file
      WHERE azi01=g_aza.aza17

     #抓取資料
     LET l_sql = "SELECT '','','',                                ",
                 "      oea01, oea02, oea03, A.occ02, oea04, B.occ02, ",
                 "      gen02, gem02, oea23, oea21, oea12, oea31, ",
                 "      oea32, oeahold,oeaconf,oea14,oea15,", #FUN-4C0096
                 "      oeb03, oeb04, oeb06,",                #FUN-4C0096
                 "      oeb05, oeb12, oeb13,oeb14, oeb15 ",
                 " FROM oea_file, OUTER occ_file A,OUTER occ_file B,",
                 "      OUTER gen_file, OUTER gem_file, oeb_file ",
                 " WHERE oea03 = A.occ01 AND B.occ01 = oea04  ",
                 "   AND gen_file.gen01 = oea14 ",
                 "   AND gem_file.gem01 = oea15 AND oea01=oeb_file.oeb01 AND oeaconf!='X' ",
                 "   AND ", tm.wc CLIPPED
     PREPARE r410_prepare1 FROM l_sql
     IF SQLCA.sqlcode != 0 THEN
        CALL cl_err('prepare:',SQLCA.sqlcode,1)
        EXIT PROGRAM
     END IF
     DECLARE r410_curs1 CURSOR FOR r410_prepare1
     CALL cl_outnam('axmr410') RETURNING l_name
     START REPORT r410_rep TO l_name
     LET g_pageno = 0
     FOREACH r410_curs1 INTO sr.*
          IF SQLCA.sqlcode != 0 THEN
             CALL cl_err('foreach:',SQLCA.sqlcode,1) EXIT FOREACH
          END IF
          IF tm.a = '1' AND sr.oeaconf = 'N' THEN
             CONTINUE FOREACH
          END IF
          IF tm.a = '2' AND sr.oeaconf = 'Y' THEN
             CONTINUE FOREACH
          END IF
          IF tm.b = '1' AND cl_null(sr.oeahold) THEN
             CONTINUE FOREACH
          END IF
          IF tm.b = '2' AND NOT cl_null(sr.oeahold) THEN
             CONTINUE FOREACH
          END IF

          #篩選排列順序條件
          FOR g_i = 1 TO 3
              CASE WHEN tm.s[g_i,g_i] = '1' LET l_order[g_i] = sr.oea01
                                            LET g_orderA[g_i]= g_x[20]
                   WHEN tm.s[g_i,g_i] = '2' LET l_order[g_i] = sr.oea02
                                                USING 'yyyymmdd'
                                            LET g_orderA[g_i]= g_x[21]
                   WHEN tm.s[g_i,g_i] = '3' LET l_order[g_i] = sr.oea03
                                            LET g_orderA[g_i]= g_x[22]
                   WHEN tm.s[g_i,g_i] = '4' LET l_order[g_i] = sr.oea04
                                            LET g_orderA[g_i]= g_x[23]
                   WHEN tm.s[g_i,g_i] = '5' LET l_order[g_i] = sr.gen02
                                            LET g_orderA[g_i]= g_x[24]
                   WHEN tm.s[g_i,g_i] = '6' LET l_order[g_i] = sr.gem02
                                            LET g_orderA[g_i]= g_x[25]
                   WHEN tm.s[g_i,g_i] = '7' LET l_order[g_i] = sr.oea23
                                            LET g_orderA[g_i]= g_x[26]
                   WHEN tm.s[g_i,g_i] = '8' LET l_order[g_i] = sr.oea12
                                            LET g_orderA[g_i]= g_x[27]
                   WHEN tm.s[g_i,g_i] = '9' LET l_order[g_i]=sr.oeahold
                                            LET g_orderA[g_i]= g_x[28]
                   OTHERWISE LET l_order[g_i]  = '-'
                             LET g_orderA[g_i] = ' '          #清為空白
              END CASE
          END FOR
          LET sr.order1 = l_order[1]
          LET sr.order2 = l_order[2]
          LET sr.order3 = l_order[3]
          OUTPUT TO REPORT r410_rep(sr.*)
     END FOREACH

     FINISH REPORT r410_rep

     CALL cl_prt(l_name,g_prtway,g_copies,g_len)
       CALL cl_used(g_prog,l_time,2) RETURNING l_time #No:MOD-580088  HCN 20050818
END FUNCTION

REPORT r410_rep(sr)
DEFINE l_last_sw    VARCHAR(1)
DEFINE sr           RECORD order1 VARCHAR(20),
                           order2 VARCHAR(20),
                           order3 VARCHAR(20),
                           order4 VARCHAR(20),
                        oea01   LIKE oea_file.oea01,
                        oea02   LIKE oea_file.oea02,
                        oea03   LIKE oea_file.oea03,
                        oea032  LIKE oea_file.oea032,	#客戶簡稱
                        oea04   LIKE oea_file.oea04,	#客戶編號
                        occ02   LIKE occ_file.occ02,	#客戶簡稱
                        gen02   LIKE gen_file.gen02,
                        gem02   LIKE gem_file.gem02,
                        oea23   LIKE oea_file.oea23,
                        oea21   LIKE oea_file.oea21,
                        oea12   LIKE oea_file.oea12,
                        oea31   LIKE oea_file.oea31,
                        oea32   LIKE oea_file.oea32,
                        oeahold LIKE oea_file.oeahold,
                        oeaconf LIKE oea_file.oeaconf,
                        oea14   LIKE oea_file.oea14,    #FUN-4C0096
                        oea15   LIKE oea_file.oea15,    #FUN-4C0096
                        oeb03   LIKE oeb_file.oeb03,
                        oeb04   LIKE oeb_file.oeb04,
                        oeb06   LIKE oeb_file.oeb06,
                        oeb05   LIKE oeb_file.oeb05,
                        oeb12   LIKE oeb_file.oeb12,
                        oeb13   LIKE oeb_file.oeb13,
                        oeb14   LIKE oeb_file.oeb14,
                        oeb15   LIKE oeb_file.oeb15
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
		l_amt_2 LIKE oeb_file.oeb12    #FUN-4C0096 modify

  #邊界設定
  OUTPUT TOP MARGIN 0
         LEFT MARGIN 0
         BOTTOM MARGIN 5
         PAGE LENGTH g_page_line

  ORDER EXTERNAL BY sr.order1,sr.order2,sr.order3     #No:8262

#FUN-4C0096 modify
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
                    g_orderA[3] CLIPPED
      PRINT g_head1

{
      LET l_str1= g_orderA[1],'-'
      LET l_str2= g_orderA[2],'-'
      LET l_str3= ''
      CASE tm.a
           WHEN '1' LET l_str3=g_x[14] CLIPPED;
           WHEN '2' LET l_str3=g_x[15] CLIPPED;
           WHEN '3' LET l_str3=g_x[16] CLIPPED;
      END CASE
      CASE tm.b
           WHEN '1' LET l_str3=g_x[17] CLIPPED;
           WHEN '2' LET l_str3=g_x[18] CLIPPED;
           WHEN '3' LET l_str3=g_x[19] CLIPPED;
      END CASE
}
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
            g_x[49],
            g_x[50],
            g_x[51],
            g_x[52],
            g_x[53],
            g_x[54],
            g_x[55],
            g_x[56]
      PRINT g_dash1
      LET l_last_sw = 'n'

   BEFORE GROUP OF sr.order1
      IF tm.t[1,1] = 'Y'           #跳頁控制
         THEN SKIP TO TOP OF PAGE
      END IF

   BEFORE GROUP OF sr.order2       #跳頁控制
      IF tm.t[2,2] = 'Y'
         THEN SKIP TO TOP OF PAGE
      END IF

   BEFORE GROUP OF sr.order3       #跳頁控制
      IF tm.t[3,3] = 'Y'
         THEN SKIP TO TOP OF PAGE
      END IF

   BEFORE GROUP OF sr.oea01
      SELECT azi03,azi04,azi05
        INTO g_azi03,g_azi04,g_azi05
        FROM azi_file
       WHERE azi01=sr.oea23
      PRINT COLUMN g_c[31],sr.oea01 CLIPPED,
            COLUMN g_c[32],sr.oea02 CLIPPED,
            COLUMN g_c[33],sr.oea03 CLIPPED,
            COLUMN g_c[34],sr.oea032 CLIPPED,
            COLUMN g_c[35],sr.oea04 CLIPPED,
            COLUMN g_c[36],sr.occ02 CLIPPED,
            COLUMN g_c[37],sr.oea14 CLIPPED,
            COLUMN g_c[38],sr.gen02 CLIPPED,
            COLUMN g_c[39],sr.oea15 CLIPPED,
            COLUMN g_c[40],sr.gem02 CLIPPED,
            COLUMN g_c[41],sr.oea23 CLIPPED,
            COLUMN g_c[42],sr.oea12 CLIPPED,
            COLUMN g_c[43],sr.oea31 CLIPPED,
            COLUMN g_c[44],sr.oea21 CLIPPED,
            COLUMN g_c[45],sr.oea32 CLIPPED,
            COLUMN g_c[46],sr.oeahold CLIPPED,
            COLUMN g_c[47],sr.oeaconf CLIPPED;

   ON EVERY ROW
      IF sr.oeb04[1,4] !='MISC' THEN
         SELECT ima021 INTO l_ima021 FROM ima_file
          WHERE ima01 = sr.oeb04
      ELSE
         LET l_ima021 = ''
      END IF

      PRINT COLUMN g_c[48],sr.oeb03 USING '####',
            COLUMN g_c[49],sr.oeb04 CLIPPED,
            COLUMN g_c[50],sr.oeb06 CLIPPED,
            COLUMN g_c[51],l_ima021 CLIPPED,
            COLUMN g_c[52],sr.oeb05 CLIPPED,
            COLUMN g_c[53],sr.oeb12 USING '############.##',
            COLUMN g_c[54],cl_numfor(sr.oeb13,54,g_azi03),
            COLUMN g_c[55],cl_numfor(sr.oeb14,55,g_azi04),
            COLUMN g_c[56],sr.oeb15
      #No.8991
      INSERT INTO curr_tmp VALUES(sr.oea23,sr.oeb14,
                                  sr.order1,sr.order2,sr.order3)
      #No.8991(end)

   AFTER GROUP OF sr.order1            #金額小計
      IF tm.u[1,1] = 'Y' THEN
         LET l_amt_1 = GROUP SUM(sr.oeb14)
         LET l_amt_2 = GROUP SUM(sr.oeb12)
         PRINT COLUMN g_c[51],g_orderA[1] CLIPPED,
               COLUMN g_c[52],g_x[11] CLIPPED,
               COLUMN g_c[53],l_amt_2 USING '############.##';
         #No.8991
         FOREACH tmp1_cs USING sr.order1 INTO sr1.*
             SELECT azi05 INTO g_azi05 FROM azi_file
              WHERE azi01 = sr1.curr
             LET l_str = sr1.curr CLIPPED,':'
             PRINT COLUMN g_c[54],l_str CLIPPED,
                   COLUMN g_c[55],cl_numfor(sr1.amt,55,g_azi05) CLIPPED
         END FOREACH
         #No.8991(end)
   	 PRINT ''
      END IF

   AFTER GROUP OF sr.order2            #金額小計
      IF tm.u[2,2] = 'Y' THEN
         LET l_amt_1 = GROUP SUM(sr.oeb14)
         LET l_amt_2 = GROUP SUM(sr.oeb12)
         PRINT COLUMN g_c[51],g_orderA[2] CLIPPED,
               COLUMN g_c[52],g_x[11] CLIPPED,
               COLUMN g_c[53],l_amt_2 USING '############.##';
         #No.8991
         FOREACH tmp2_cs USING sr.order1,sr.order2 INTO sr1.*
             SELECT azi05 INTO g_azi05 FROM azi_file
              WHERE azi01 = sr1.curr
             LET l_str = sr1.curr CLIPPED,':'
             PRINT COLUMN g_c[54],l_str CLIPPED,
                   COLUMN g_c[55],cl_numfor(sr1.amt,55,g_azi05) CLIPPED
         END FOREACH
         #No.8991(end)
         PRINT ''
      END IF

   AFTER GROUP OF sr.order3            #金額小計
      IF tm.u[3,3] = 'Y' THEN
         LET l_amt_1 = GROUP SUM(sr.oeb14)
         LET l_amt_2 = GROUP SUM(sr.oeb12)
         PRINT COLUMN g_c[51],g_orderA[3] CLIPPED,
               COLUMN g_c[52],g_x[11] CLIPPED,
               COLUMN g_c[53],l_amt_2 USING '############.##';
         #No.8991
         FOREACH tmp3_cs USING sr.order1,sr.order2,sr.order3 INTO sr1.*
             SELECT azi05 INTO g_azi05 FROM azi_file
              WHERE azi01 = sr1.curr
             LET l_str = sr1.curr CLIPPED,':'
             PRINT COLUMN g_c[54],sr1.curr CLIPPED,':',
                   COLUMN g_c[55],cl_numfor(sr1.amt,55,g_azi05) CLIPPED
         END FOREACH
         #No.8991(end)
         PRINT ''
      END IF

   ON LAST ROW                         #金額總計
      PRINT ''
      LET l_amt_1 = SUM(sr.oeb14)
      LET l_amt_2 = SUM(sr.oeb12)
      PRINT COLUMN g_c[52],g_x[12] CLIPPED,
            COLUMN g_c[53],l_amt_2 USING '############.##';
      #No.8991
      FOREACH tmp4_cs INTO sr1.*
          SELECT azi05 INTO g_azi05 FROM azi_file
           WHERE azi01 = sr1.curr
          LET l_str = sr1.curr CLIPPED,':'
          PRINT COLUMN g_c[54],l_str CLIPPED,
                COLUMN g_c[55],cl_numfor(sr1.amt,55,g_azi05)
      END FOREACH
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
## END FUN-550127

END REPORT
