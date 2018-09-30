# Prog. Version..: '1.20.01-05.10.07(00006)'     #
# Pattern name...: axrr301.4gl
# Descriptions...: 應收憑單列印作業
# Date & Author..: 99/08/24 By Carol&Kammy
# Modify.........: No:FUN-4C0100 05/01/26 By Smapmin 調整單價.金額.匯率大小
# Modify.........: No:Mod-530284 05/03/25 By Nicola 傳參數執行
# Modify.........: No:FUN-550111 05/05/30 By echo 新增報表備註
# Modify.........: No.MOD-560120 05/06/20 By vivien 發票號碼調整 
# Modify.........: No:MOD-580248 05/08/23 By Smapmin 帳款人員和帳款部門欄位列印錯誤
# Modify.........: No:MOD-590392 05/09/20 By Dido 客戶簡稱欄位列印錯誤

DATABASE ds

GLOBALS "../../config/top.global"

   DEFINE tm  RECORD                  # Print condition RECORD
              wc       VARCHAR(1000),    # Where condition
              b        VARCHAR(1),       # 已列印者是否再列印(Y/N)
              c        VARCHAR(1),       # 是否列印傳票分錄(Y/N)
              d        VARCHAR(1),       # 是否列印額外備註(Y/N)
              e        VARCHAR(1),       # 是否列印料號品名(Y/N)
              f        VARCHAR(15),      # (1)進貨發票 (2)雜項發票 (3)Ｃ．Ｍ．
              f2       VARCHAR(15),      # (1)進貨發票 (2)雜項發票 (3)Ｃ．Ｍ．
              h        VARCHAR(1),       # (1)已確認 (2)未確認 (3)全部 
              more    VARCHAR(1)         # Input more condition(Y/N)
              END RECORD,
          tmf1   VARCHAR(15), 
          g_sql     VARCHAR(300),        # RDSQL STATEMENT
          g_dash1   VARCHAR(200),
          g_tot_bal DECIMAL(13,2)        # User defined variable

DEFINE   g_cnt           INTEGER   
DEFINE   g_dash          VARCHAR(400)   #Dash line
DEFINE   g_i             SMALLINT   #count/index for any purpose
DEFINE   g_len           SMALLINT   #Report width(79/132/136)
DEFINE   g_pageno        SMALLINT   #Report page no
DEFINE   g_zz05          VARCHAR(1)   #Print tm.wc ?(Y/N)
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
  
   IF (NOT cl_setup("AXR")) THEN
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
   LET tm.b  = ARG_VAL(8)
   LET tm.c  = ARG_VAL(10)
   LET tm.d  = ARG_VAL(11)
   LET tm.f  = ARG_VAL(12)
   LET tm.h  = ARG_VAL(13)
   #No:FUN-570264 --start--
   LET g_rep_user = ARG_VAL(14)
   LET g_rep_clas = ARG_VAL(15)
   LET g_template = ARG_VAL(16)
   #No:FUN-570264 ---end---
    #-----No:MOD-530284-----
   IF cl_null(tm.wc) THEN 
      CALL r301_tm(0,0)
   ELSE
      CALL r301()
   END IF
    #-----No:MOD-530284 END-----
END MAIN

FUNCTION r301_tm(p_row,p_col)
   DEFINE p_row,p_col    SMALLINT,
          l_cmd          VARCHAR(1000)

   IF p_row = 0 THEN LET p_row = 3 LET p_col = 14 END IF
   IF g_gui_type MATCHES "[13]" AND fgl_getenv('GUI_VER') = '6' THEN
        LET p_row = 3 LET p_col = 15 
   ELSE LET p_row = 3 LET p_col = 14
   END IF

   OPEN WINDOW r301_w AT p_row,p_col
        WITH FORM "axr/42f/axrr301" 
################################################################################
# START genero shell script ADD
      ATTRIBUTE (STYLE = g_win_style)
    
    CALL cl_ui_init()

# END genero shell script ADD
################################################################################
   CALL cl_opmsg('p')
   INITIALIZE tm.* TO NULL            # Default condition
   LET tm.b    = 'N'
   LET tm.c    = 'N'
   LET tm.d    = 'N'
   LET tm.f    = '12.出貨'
   LET tm.h    = '3'
   LET tm.more = 'N'
   LET g_pdate = g_today
   LET g_rlang = g_lang
   LET g_bgjob = 'N'
   LET g_copies = '1'
   LET tm.f    = '12'
WHILE TRUE
   CONSTRUCT BY NAME tm.wc ON oma01,oma02,oma03,oma14,oma15,oma24
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
      LET INT_FLAG = 0 CLOSE WINDOW r301_w EXIT PROGRAM
   END IF
   IF tm.wc = ' 1=1' THEN CALL cl_err('','9046',0) CONTINUE WHILE END IF
   INPUT BY NAME tm.b,tm.c,tm.d,tm.f,tm.h,tm.more 
         WITHOUT DEFAULTS 
      AFTER FIELD b
         IF tm.b NOT MATCHES "[YN]" OR cl_null(tm.b) 
            THEN NEXT FIELD b
         END IF
      AFTER FIELD c
         IF tm.c NOT MATCHES "[YN]" OR cl_null(tm.c) 
            THEN NEXT FIELD c
         END IF
      AFTER FIELD d
         IF tm.d NOT MATCHES "[YN]" OR cl_null(tm.d) 
            THEN NEXT FIELD d
         END IF
      AFTER FIELD f
         LET tm.f2=tm.f[1,2] 
         IF tm.f2[1,2] NOT MATCHES '1[1-4]' AND tm.f2[1,2] NOT MATCHES '2[1-5]' AND
            tm.f2[1,2] !='31' AND cl_null(tm.f2[1,2]) 
            THEN NEXT FIELD f
         END IF
      AFTER FIELD h
         IF tm.h NOT MATCHES "[123]" OR cl_null(tm.h) 
            THEN NEXT FIELD h
         END IF
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
   END INPUT
   IF INT_FLAG THEN
      LET INT_FLAG = 0 CLOSE WINDOW r301_w EXIT PROGRAM
   END IF
   IF g_bgjob = 'Y' THEN
      SELECT zz08 INTO l_cmd FROM zz_file   # get exec cmd (fglgo xxxx)
             WHERE zz01='axrr301'
      IF SQLCA.sqlcode OR l_cmd IS NULL THEN
         CALL cl_err('axrr301','9031',1)
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
                         " '",tm.b CLIPPED,"'",
                         " '",tm.c CLIPPED,"'",
                         " '",tm.d CLIPPED,"'",
                         " '",tm.f2[1,2] CLIPPED,"'",
                         " '",tm.h CLIPPED,"'",
                         " '",g_rep_user CLIPPED,"'",           #No:FUN-570264
                         " '",g_rep_clas CLIPPED,"'",           #No:FUN-570264
                         " '",g_template CLIPPED,"'"            #No:FUN-570264
         CALL cl_cmdat('axrr301',g_time,l_cmd) # Execute cmd at later time
      END IF
      CLOSE WINDOW r301_w
      EXIT PROGRAM
   END IF
   CALL cl_wait()
   CALL r301()
   ERROR ""
END WHILE
   CLOSE WINDOW r301_w
END FUNCTION
   
FUNCTION r301()
   DEFINE l_name    VARCHAR(20),        # External(Disk) file name
          l_time    VARCHAR(8),         # Used time for running the job
          l_sql     VARCHAR(1000),       # RDSQL STATEMENT
          l_chr     VARCHAR(1),
          l_head    VARCHAR(10),
          l_za05    VARCHAR(40),
          l_order    ARRAY[5] OF VARCHAR(10),
          sr               RECORD 
                                  oma  RECORD LIKE oma_file.*, #應付帳款單頭
                                  omb  RECORD LIKE omb_file.*, #應付帳款單身
                                  azi03 LIKE azi_file.azi03,   #單位小數位數
                                  azi04 LIKE azi_file.azi04,   #金額小數位數
                                  azi05 LIKE azi_file.azi05,   #小計小數位數
                                  azi07 LIKE azi_file.azi07    #匯率小數位數
                        END RECORD

       CALL cl_used(g_prog,l_time,1) RETURNING l_time #No:MOD-580088  HCN 20050818
     SELECT zo02 INTO g_company FROM zo_file WHERE zo01 = g_rlang
     SELECT zz17,zz05 INTO g_len,g_zz05 FROM zz_file WHERE zz01 = 'axrr301'
     IF g_len = 0 OR g_len IS NULL THEN LET g_len = 112 END IF
     FOR g_i = 1 TO g_len LET g_dash[g_i,g_i] = '=' END FOR
     FOR g_i = 1 TO g_len LET g_dash1[g_i,g_i] = '-' END FOR

     IF g_priv2='4' THEN                           #只能使用自己的資料
         LET tm.wc = tm.wc clipped," AND omauser = '",g_user,"'"
     END IF
     IF g_priv3='4' THEN                           #只能使用相同群的資料
         LET tm.wc = tm.wc clipped," AND omagrup MATCHES '",g_grup CLIPPED,"*'"
     END IF
     LET l_sql = "SELECT ",
                 "  oma_file.*,omb_file.*,azi03, azi04, azi05,azi07 ",
                 "  FROM oma_file, OUTER omb_file,OUTER azi_file ",
                 " WHERE oma01 = omb_file.omb01 ",
                 "   AND oma23 = azi_file.azi01 "

     IF tm.b = 'N' THEN
        LET l_sql = l_sql CLIPPED," AND (omaprsw = 0 OR omaprsw IS NULL)"
     END IF
     IF NOT cl_null(tm.f2[1,2]) THEN
        LET l_sql = l_sql CLIPPED," AND oma00 = '",tm.f2[1,2],"'"
     END IF
     IF tm.h = '1' THEN
        LET l_sql = l_sql CLIPPED," AND omaconf = 'Y'"
     END IF
     IF tm.h = '2' THEN
        LET l_sql = l_sql CLIPPED," AND omaconf = 'N'"
     END IF
     LET l_sql = l_sql CLIPPED,"    AND omavoid = 'N' AND ",tm.wc
     PREPARE r301_prepare1 FROM l_sql
     IF SQLCA.sqlcode != 0 THEN 
        CALL cl_err('prepare:',SQLCA.sqlcode,1) EXIT PROGRAM 
     END IF
     DECLARE r301_curs1 CURSOR FOR r301_prepare1
     #-->傳票分錄資料(npq_file)
      LET l_sql = " SELECT npq02, npq03, aag02, npq06, npq07 ",
                  "   FROM npp_file, npq_file, OUTER aag_file ",
                  "  WHERE npp01 = ? AND npq03=aag_file.aag01 ",
                  "    AND nppsys = 'AP' AND npp00 = 1 AND npq01 = npp01 ",
                  "    AND nppsys=npqsys AND npp00=npq00 AND npp011=npq011"
      PREPARE r301_pnpq FROM l_sql
      IF SQLCA.sqlcode != 0 THEN 
         CALL cl_err('r301_pnpq:',SQLCA.sqlcode,1) 
      END IF
      DECLARE r301_cnpq CURSOR FOR r301_pnpq 

     display "prog:",g_prog
     CALL cl_outnam('axrr301') RETURNING l_name
     START REPORT r301_rep TO l_name
     LET g_pageno = 0
     FOREACH r301_curs1 INTO sr.*
       IF SQLCA.sqlcode != 0 THEN 
          CALL cl_err('foreach:',SQLCA.sqlcode,1) 
          EXIT FOREACH
       END IF
       OUTPUT TO REPORT r301_rep(sr.*)
       CALL r301_upd(sr.oma.oma01)
     END FOREACH
     FINISH REPORT r301_rep
     CALL cl_prt(l_name,g_prtway,g_copies,g_len)
       CALL cl_used(g_prog,l_time,2) RETURNING l_time #No:MOD-580088  HCN 20050818
END FUNCTION
   
FUNCTION r301_upd(l_oma01)
     DEFINE l_oma01 LIKE oma_file.oma01

     UPDATE oma_file SET omaprsw = omaprsw + 1 WHERE oma01 = l_oma01
     IF SQLCA.sqlcode != 0 THEN
        CALL cl_err('foreach:',SQLCA.sqlcode,1) 
     END IF
END FUNCTION

REPORT r301_rep(sr)
   DEFINE l_last_sw    VARCHAR(1),
          sr               RECORD 
                                  oma  RECORD LIKE oma_file.*, #應付帳款單頭 
                                  omb  RECORD LIKE omb_file.*, #應付帳款單身
                                  azi03 LIKE azi_file.azi03,   #單位小數位數
                                  azi04 LIKE azi_file.azi04,   #金額小數位數
                                  azi05 LIKE azi_file.azi05,   #小計小數位數
                                  azi07 LIKE azi_file.azi07    #匯率小數位數
                        END RECORD,
          sr1              RECORD 
                                  npq02 LIKE npq_file.npq02, # 項次
                                  npq03 LIKE npq_file.npq03, # 科目編號
                                  npq04 LIKE npq_file.npq04, # 摘要
                                  npq06 LIKE npq_file.npq06, # 借貸別(1.借/2.貸)
                                  npq07 LIKE npq_file.npq07  # 異動金額
                        END RECORD,
      l_oao06      LIKE oao_file.oao06,        #備註
      l_amt,l_amt2 DECIMAL(17,5),
      l_rtn        DECIMAL(17,5),
      l_ome RECORD LIKE ome_file.*,
      l_gem02      LIKE gem_file.gem02,
      l_gen02      LIKE gen_file.gen02,
      l_head       VARCHAR(10),
      l_chr        VARCHAR(1)

  OUTPUT TOP MARGIN 0
         LEFT MARGIN 0
         BOTTOM MARGIN 5
         PAGE LENGTH g_page_line
  ORDER BY sr.oma.oma01,sr.omb.omb03
  FORMAT
   PAGE HEADER
      PRINT (g_len-length(g_company))/2 SPACES,g_company
      IF g_towhom IS NULL OR g_towhom = ' '
         THEN PRINT '';
         ELSE PRINT 'TO:',g_towhom;
      END IF
      PRINT COLUMN (g_len-length(g_user)-5),'FROM:',g_user CLIPPED
      PRINT (g_len-length(g_x[1]))/2 SPACES,g_x[1]
      PRINT ' '
      LET g_pageno = g_pageno + 1
      PRINT g_x[2] CLIPPED,g_pdate ,' ',TIME,
            COLUMN g_len-7,g_x[3] CLIPPED,g_pageno USING '<<<'
      PRINT g_dash[1,g_len]
      LET l_last_sw = 'n'

   BEFORE GROUP OF sr.oma.oma01
      IF (PAGENO > 1 OR LINENO > 9)
         THEN SKIP TO TOP OF PAGE
      END IF
      # HEAD LINE 1
      PRINT g_x[11] CLIPPED,sr.oma.oma01,
 #No.MOD-560120 --begin
            COLUMN 28,g_x[12] CLIPPED,sr.oma.oma23,
            COLUMN 42,g_x[13] CLIPPED,cl_numfor(sr.oma.oma24,10,sr.azi07)CLIPPED,
            COLUMN 64,g_x[14] CLIPPED,sr.oma.oma33 CLIPPED

      # HEAD LINE 2
      PRINT g_x[15] CLIPPED,sr.oma.oma02,
            COLUMN 28,g_x[16] CLIPPED,sr.oma.oma21,
            COLUMN 42,g_x[17] CLIPPED,sr.oma.oma211 USING '##.##' CLIPPED,'%',
            COLUMN 64,g_x[18] CLIPPED,sr.oma.oma13

      # HEAD LINE 3
      CASE WHEN sr.oma.oma00='11' PRINT g_x[57] CLIPPED,':',sr.oma.oma16;
           WHEN sr.oma.oma00='12' PRINT g_x[58] CLIPPED,':',sr.oma.oma16;
           WHEN sr.oma.oma00='13' PRINT g_x[58] CLIPPED,':',sr.oma.oma16;
           WHEN sr.oma.oma00='21' PRINT g_x[59] CLIPPED,':',sr.oma.oma16;
           OTHERWISE PRINT g_x[60] CLIPPED,':',sr.oma.oma16;
      END CASE
      PRINT COLUMN 28,g_x[21] CLIPPED,sr.oma.oma25,
            COLUMN 42,sr.oma.oma26 CLIPPED,
            COLUMN 64,g_x[22] CLIPPED,sr.oma.oma18

      # HEAD LINE 4
      SELECT gen02 INTO l_gen02 FROM gen_file WHERE gen01=sr.oma.oma14
      PRINT g_x[23] CLIPPED,sr.oma.oma03,
#            COLUMN 28,g_x[28] CLIPPED,l_gem02   #MOD-580248
             COLUMN 28,g_x[28] CLIPPED,l_gen02   #MOD-580248

      # HEAD LINE 5
      SELECT gem02 INTO l_gem02 FROM gem_file WHERE gem01=sr.oma.oma15
#     PRINT g_x[27] CLIPPED,sr.oma.oma32,
      PRINT g_x[27] CLIPPED,sr.oma.oma032,               #MOD-590392
#           COLUMN 28,g_x[31] CLIPPED,l_gen02 CLIPPED,   #MOD-580248
            COLUMN 28,g_x[31] CLIPPED,l_gem02 CLIPPED,   #MOD-580248
            COLUMN 50,g_x[26] CLIPPED,
                   cl_numfor(sr.oma.oma52,18,sr.azi04) CLIPPED,
                   cl_numfor(sr.oma.oma53,18,g_azi04) CLIPPED

      # HEAD LINE 6
      PRINT g_x[30] CLIPPED,sr.oma.oma10,
            COLUMN 28,g_x[63] CLIPPED,cl_numfor(sr.oma.oma58,10,sr.azi07),
            COLUMN 50,g_x[29] CLIPPED,
                   cl_numfor(sr.oma.oma54,18,sr.azi04) CLIPPED,
                   cl_numfor(sr.oma.oma56 ,18, g_azi04) CLIPPED

      # HEAD LINE 7
      PRINT g_x[33] CLIPPED,sr.oma.oma08,
            COLUMN 28,g_x[39] CLIPPED,sr.oma.omaconf CLIPPED,
            COLUMN 50,g_x[61] CLIPPED,
                   cl_numfor(sr.oma.oma54x,18,sr.azi04) CLIPPED,
                   cl_numfor(sr.oma.oma56x ,18, g_azi04) CLIPPED
   
      # HEAD LINE 8
      PRINT g_x[36] CLIPPED,sr.oma.oma32,
            COLUMN 28,g_x[40] CLIPPED,sr.oma.omavoid,
            COLUMN 50,g_x[38] CLIPPED,
                   cl_numfor(sr.oma.oma54t,18,sr.azi04) CLIPPED,
                   cl_numfor(sr.oma.oma56t,18, g_azi04) CLIPPED

      # HEAD LINE 9
      PRINT g_x[41] CLIPPED,sr.oma.oma11, 
            COLUMN 28,g_x[64] CLIPPED,sr.oma.oma40 CLIPPED,
            COLUMN 50,g_x[32] CLIPPED,
                   cl_numfor(sr.oma.oma55,18,sr.azi04) CLIPPED,
                   cl_numfor(sr.oma.oma57,18, g_azi04) CLIPPED

      # HEAD LINE 10
      PRINT g_x[34] CLIPPED,sr.oma.oma12 
 #No.MOD-560120 --end  

      #是否列印額外備註
      IF tm.d='Y' THEN
         DECLARE oao0_cur CURSOR FOR SELECT oao06 FROM oao_file
                                     WHERE oao01=sr.oma.oma01
                                       AND oao03=0 AND oao05='1'
 
         FOREACH oao0_cur INTO l_oao06
            IF SQLCA.SQLCODE THEN LET l_oao06=' ' END IF
               IF NOT cl_null(l_oao06) THEN 
                  PRINT COLUMN 01,l_oao06
            END IF
         END FOREACH 
      END IF

      PRINT g_dash1[1,g_len]

      CASE WHEN sr.oma.oma00='11' LET l_head=g_x[57]
           WHEN sr.oma.oma00='12' LET l_head=g_x[58]
           WHEN sr.oma.oma00='13' LET l_head=g_x[58]
           WHEN sr.oma.oma00='21' LET l_head=g_x[59]
           OTHERWISE LET l_head=g_x[60]
      END CASE

      SELECT COUNT(*) INTO g_cnt FROM omb_file WHERE omb01=sr.oma.oma01

      IF g_cnt > 0  THEN
         PRINT g_x[43] CLIPPED,COLUMN 8 , l_head CLIPPED, COLUMN 35,g_x[65]
         PRINT COLUMN 8,g_x[44] CLIPPED,COLUMN 56, g_x[45],'           ',g_x[67]
         PRINT COLUMN 8,g_x[46] CLIPPED

         PRINT '---- ---------------------------  ---------------',
               '      ------------------- ------------------ ------------------'
      END IF

   ON EVERY ROW

      IF g_cnt > 0  THEN

         #是否列印額外備註
         IF tm.d='Y' THEN
            DECLARE oao1_cur CURSOR FOR SELECT oao06 FROM oao_file
                                        WHERE oao01=sr.oma.oma01
                                          AND oao03=sr.omb.omb03 AND oao05='1'
 
            FOREACH oao1_cur INTO l_oao06
               IF SQLCA.SQLCODE THEN LET l_oao06=' ' END IF
                  IF NOT cl_null(l_oao06) THEN 
                     PRINT COLUMN 01,l_oao06
               END IF
            END FOREACH 
         END IF
         PRINT COLUMN 01,sr.omb.omb03 USING "####",' ', sr.omb.omb01,
               COLUMN 34,cl_numfor(sr.omb.omb12,15,0),
               COLUMN 51,g_x[66] CLIPPED,
               COLUMN 56,cl_numfor(sr.omb.omb13,18,sr.azi03),
               COLUMN 70,cl_numfor(sr.omb.omb15,18,g_azi03),
               COLUMN 86,cl_numfor(sr.omb.omb17,18,g_azi03)
   
         PRINT COLUMN 06,sr.omb.omb04,  #No.8818
               COLUMN 34,cl_numfor(sr.omb.omb33,15,0),
               COLUMN 51,g_x[29] CLIPPED,
               COLUMN 56,cl_numfor(sr.omb.omb14,18,sr.azi04),
               COLUMN 70,cl_numfor(sr.omb.omb16,18,g_azi04),
               COLUMN 86,cl_numfor(sr.omb.omb18,18,g_azi04)

         PRINT COLUMN 06,sr.omb.omb06,
               COLUMN 51,g_x[38] CLIPPED,
               COLUMN 56,cl_numfor(sr.omb.omb14t,18,sr.azi04),
               COLUMN 70,cl_numfor(sr.omb.omb16t,18,g_azi04),
               COLUMN 86,cl_numfor(sr.omb.omb18t,18,g_azi04)

         #是否列印額外備註
         IF tm.d='Y' THEN
            DECLARE oao2_cur CURSOR FOR SELECT oao06 FROM oao_file
                                        WHERE oao01=sr.oma.oma01
                                          AND oao03=sr.omb.omb03 AND oao05='2'
 
            FOREACH oao2_cur INTO l_oao06
               IF SQLCA.SQLCODE THEN LET l_oao06=' ' END IF
                  IF NOT cl_null(l_oao06) THEN 
                     PRINT COLUMN 01,l_oao06
               END IF
            END FOREACH 
         END IF
      END IF

   AFTER GROUP OF sr.oma.oma01
      PRINT g_dash1

      #-->列印傳票分錄
      IF tm.c = 'Y' THEN
         LET l_chr = 'Y' 
         FOREACH r301_cnpq  
         USING sr.oma.oma01
         INTO sr1.*
            IF SQLCA.sqlcode != 0 THEN 
                CALL cl_err('foreach:',SQLCA.sqlcode,0) 
                EXIT FOREACH
            END IF
            IF l_chr = 'Y' THEN
                LET l_chr = 'N'
                SKIP 1 LINE
                PRINT '----------------------------------------',
                      '----------------------------------------'
                PRINT g_x[48],g_x[49]
                PRINT ' -----   ----------------------- -------',
                      '--------------------- - ----------------'
           END IF
           PRINT ' ',sr1.npq02 USING "####&",
                 COLUMN 10,sr1.npq03 CLIPPED,
                 COLUMN 34,sr1.npq04 CLIPPED,
                 COLUMN 63,sr1.npq06,
                 COLUMN 65,cl_numfor(sr1.npq07,18,g_azi04)
          END FOREACH
      END IF
      LET l_last_sw = 'y'
      LET g_pageno = 0

   PAGE TRAILER
      IF l_last_sw = 'n'
         THEN PRINT g_x[4],g_x[5] CLIPPED, COLUMN (g_len-9), g_x[6] CLIPPED
         ELSE PRINT g_x[4],g_x[5] CLIPPED, COLUMN (g_len-9), g_x[7] CLIPPED
      END IF
## FUN-550111
     # LET l_last_sw = 'n'
       PRINT g_dash[1,g_len]
     #         PRINT 10 SPACE,g_x[52] CLIPPED, COLUMN 32,g_x[53] CLIPPED,
     #               COLUMN 55,g_x[54] CLIPPED
      IF l_last_sw = 'n' THEN
         IF g_memo_pagetrailer THEN
             PRINT g_x[52]
             PRINT g_memo
         ELSE
             PRINT
             PRINT
         END IF
      ELSE
             PRINT g_x[52]
             PRINT g_memo
      END IF
## END FUN-550111

END REPORT
