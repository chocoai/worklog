# Prog. Version..: '1.20.01-05.08.29(01)'     #
# Pattern name...: axmr320.4gl
# Descriptions...: 估價單成本一覽表列印      
# Date & Author..: 00/03/07 By Melody
# Modify.........: No:FUN-4C0096 04/12/21 By Carol 修改報表架構轉XML
# Modify.........: No.FUN-4C0096 05/03/04 By Echo 調整單價、金額、匯率欄位大小

DATABASE ds

GLOBALS "../../config/top.global"

   DEFINE tm  RECORD                         # Print condition RECORD
              wc      VARCHAR(500),             # Where condition
              more    VARCHAR(01)               # Input more condition(Y/N)
              END RECORD,
          g_dash1     VARCHAR(400)

DEFINE   g_dash          VARCHAR(400)   #Dash line
DEFINE   g_i             SMALLINT   #count/index for any purpose
DEFINE   g_len           SMALLINT   #Report width(79/132/136)
DEFINE   g_msg           VARCHAR(72)
DEFINE   g_pageno        SMALLINT   #Report page no
DEFINE   g_zz05          VARCHAR(1)   #Print tm.wc ?(Y/N)
MAIN
   OPTIONS
       FORM LINE     FIRST + 2,
       MESSAGE LINE  LAST,
       PROMPT LINE   LAST,
       INPUT NO WRAP
   DEFER INTERRUPT                        # Supress DEL key function

   IF (NOT cl_user()) THEN
      EXIT PROGRAM
   END IF
  
   WHENEVER ERROR CALL cl_err_msg_log
  
   IF (NOT cl_setup("AXM")) THEN
      EXIT PROGRAM
   END IF

   INITIALIZE tm.* TO NULL            # Default condition
   LET tm.more = 'N'
   LET g_pdate = g_today
   LET g_rlang = g_lang
   LET g_bgjob = 'N'
   LET g_copies = '1'
   LET tm.wc = ARG_VAL(1)
   #No:FUN-570264 --start--
   LET g_rep_user = ARG_VAL(2)
   LET g_rep_clas = ARG_VAL(3)
   LET g_template = ARG_VAL(4)
   #No:FUN-570264 ---end---
   IF cl_null(tm.wc)
      THEN CALL axmr320_tm(0,0)             # Input print condition
      ELSE LET tm.wc="oqa01= '",tm.wc CLIPPED,"'"
           CALL axmr320()                   # Read data and create out-file
   END IF
END MAIN

FUNCTION axmr320_tm(p_row,p_col)
   DEFINE p_row,p_col    SMALLINT,
          l_cmd        VARCHAR(1000)

   LET p_row = 7 LET p_col = 17

   OPEN WINDOW axmr320_w AT p_row,p_col WITH FORM "axm/42f/axmr320" 
      ATTRIBUTE (STYLE = g_win_style)
    
    CALL cl_ui_init()


   CALL cl_opmsg('p')
WHILE TRUE
   CONSTRUCT BY NAME tm.wc ON oqa01,oqa02,oqa03,oqa05,oqa06,oqa07 
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
      LET INT_FLAG = 0 CLOSE WINDOW axmr320_w EXIT PROGRAM
   END IF
   IF tm.wc=" 1=1" THEN 
      CALL cl_err('','9046',0) CONTINUE WHILE
   END IF 
  #UI
   INPUT BY NAME tm.more WITHOUT DEFAULTS 
      AFTER FIELD more
         IF tm.more = 'Y'
            THEN CALL cl_repcon(0,0,g_pdate,g_towhom,g_rlang,
                                g_bgjob,g_time,g_prtway,g_copies)
                      RETURNING g_pdate,g_towhom,g_rlang,
                                g_bgjob,g_time,g_prtway,g_copies
         END IF
      ON ACTION CONTROLZ
         CALL cl_show_req_fields()
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
      LET INT_FLAG = 0 CLOSE WINDOW axmr320_w EXIT PROGRAM
   END IF
   IF g_bgjob = 'Y' THEN
      SELECT zz08 INTO l_cmd FROM zz_file    #get exec cmd (fglgo xxxx)
             WHERE zz01='axmr320'
      IF SQLCA.sqlcode OR l_cmd IS NULL THEN
         CALL cl_err('axmr320','9031',1)
      ELSE
         LET tm.wc=cl_replace_str(tm.wc, "'", "\"")
         LET l_cmd = l_cmd CLIPPED,        #(at time fglgo xxxx p1 p2 p3)
                         " '",g_pdate CLIPPED,"'",
                         " '",g_towhom CLIPPED,"'",
                         " '",g_lang CLIPPED,"'",
                         " '",g_bgjob CLIPPED,"'",
                         " '",g_prtway CLIPPED,"'",
                         " '",g_copies CLIPPED,"'",
                         " '",tm.wc CLIPPED,"'" ,
                         " '",tm.more CLIPPED,"'"  ,
                         " '",g_rep_user CLIPPED,"'",           #No:FUN-570264
                         " '",g_rep_clas CLIPPED,"'",           #No:FUN-570264
                         " '",g_template CLIPPED,"'"            #No:FUN-570264
         CALL cl_cmdat('axmr320',g_time,l_cmd)    # Execute cmd at later time
      END IF
      CLOSE WINDOW axmr320_w
      EXIT PROGRAM
   END IF
   CALL cl_wait()
   CALL axmr320()
   ERROR ""
END WHILE
   CLOSE WINDOW axmr320_w
END FUNCTION

FUNCTION axmr320()
   DEFINE l_name    VARCHAR(20),        # External(Disk) file name
          l_time    VARCHAR(8),         # Used time for running the job
          l_sql     VARCHAR(3000),
          l_za05    VARCHAR(40), 
          sr        RECORD        
                    oqa      RECORD LIKE oqa_file.*
                    END RECORD 

       CALL cl_used(g_prog,l_time,1) RETURNING l_time #No:MOD-580088  HCN 20050818
     SELECT zo02 INTO g_company FROM zo_file WHERE zo01 = g_rlang
     SELECT zz17,zz05 INTO g_len,g_zz05 FROM zz_file WHERE zz01 = 'axmr320'
     IF g_len = 0 OR g_len IS NULL THEN LET g_len = 132 END IF
     FOR g_i = 1 TO g_len LET g_dash[g_i,g_i] = '=' END FOR
     FOR g_i = 1 TO g_len LET g_dash1[g_i,g_i] = '-' END FOR

     IF g_priv2='4' THEN                   #只能使用自己的資料
         LET tm.wc = tm.wc clipped," AND oqauser = '",g_user,"'"
     END IF
     IF g_priv3='4' THEN                   #只能使用相同群的資料
         LET tm.wc = tm.wc clipped," AND oqagrup MATCHES '",g_grup CLIPPED,"*'"
     END IF
     LET l_sql="SELECT * FROM oqa_file ",
               " WHERE 1=1 AND ",tm.wc CLIPPED,
               "   AND oqaconf != 'X' ",#mandy01/08/03 不為已作廢的估價單
               " ORDER BY oqa01 "
     PREPARE axmr320_prepare1 FROM l_sql
     IF STATUS THEN CALL cl_err('prepare:',STATUS,1) EXIT PROGRAM END IF
     DECLARE axmr320_curs1 CURSOR FOR axmr320_prepare1

     CALL cl_outnam('axmr320') RETURNING l_name
     START REPORT axmr320_rep TO l_name

     LET g_pageno = 0
     FOREACH axmr320_curs1 INTO sr.*
       IF STATUS THEN CALL cl_err('foreach:',STATUS,1) EXIT FOREACH END IF

       OUTPUT TO REPORT axmr320_rep(sr.*)
     END FOREACH

     FINISH REPORT axmr320_rep

     CALL cl_prt(l_name,g_prtway,g_copies,g_len)
       CALL cl_used(g_prog,l_time,2) RETURNING l_time #No:MOD-580088  HCN 20050818
END FUNCTION

REPORT axmr320_rep(sr)
   DEFINE l_last_sw    VARCHAR(1),
          sr        RECORD        
                    oqa      RECORD LIKE oqa_file.*
                    END RECORD,                            #FUN-4C0096 modify
          tot_amt,tot_oqb11,tot_oqc13,tot_oqc14,tot_oqd04 LIKE oqb_file.oqb11,
          l_oqb     RECORD LIKE oqb_file.*,
          l_oqc     RECORD LIKE oqc_file.*,
          l_oqd     RECORD LIKE oqd_file.*,
          l_ima02   LIKE ima_file.ima02, 
          l_occ02   LIKE occ_file.occ02, 
          l_gen02   LIKE gen_file.gen02, 
          l_gem02   LIKE gem_file.gem02  

  OUTPUT TOP MARGIN 0
         LEFT MARGIN 0
         BOTTOM MARGIN 5
         PAGE LENGTH g_page_line
  ORDER BY sr.oqa.oqa01
  FORMAT
   PAGE HEADER 
      #no.4560
      SELECT azi03,azi04,azi05,azi07 INTO t_azi03,t_azi04,t_azi05,t_azi07
       FROM azi_file WHERE azi01 = sr.oqa.oqa08
      #no.4560(end)
      PRINT (g_len-length(g_company))/2 SPACES,g_company 
      IF g_towhom IS NULL OR g_towhom = ' '
         THEN PRINT '';
         ELSE PRINT 'TO:',g_towhom;
      END IF
      PRINT COLUMN (g_len-length(g_user)-5),'FROM:',g_user CLIPPED
      PRINT (g_len-length(g_x[1] CLIPPED))/2 SPACES,g_x[1] CLIPPED
      PRINT ' '
      LET g_pageno= g_pageno+1
      PRINT g_x[2] CLIPPED,g_pdate ,' ',TIME,' ',g_msg CLIPPED,
            COLUMN g_len-7,g_x[3] CLIPPED,g_pageno USING '<<<'
      PRINT g_dash[1,g_len]
      SELECT gem02 INTO l_gem02 FROM gem_file WHERE gem01=sr.oqa.oqa05
      SELECT occ02 INTO l_occ02 FROM occ_file WHERE occ01=sr.oqa.oqa06
      SELECT gen02 INTO l_gen02 FROM gen_file WHERE gen01=sr.oqa.oqa07
      PRINT COLUMN 01,g_x[11] CLIPPED,sr.oqa.oqa01,
            COLUMN 30,g_x[16] CLIPPED,sr.oqa.oqa05,' ',l_gem02,
            COLUMN 60,g_x[19] CLIPPED,sr.oqa.oqa08
      PRINT COLUMN 01,g_x[12] CLIPPED,sr.oqa.oqa02,
            COLUMN 30,g_x[17] CLIPPED,sr.oqa.oqa06,' ',l_occ02,
            COLUMN 60,g_x[20] CLIPPED,cl_numfor(sr.oqa.oqa09,10,t_azi07)
      PRINT COLUMN 01,g_x[13] CLIPPED,sr.oqa.oqa03,
            COLUMN 30,g_x[18] CLIPPED,sr.oqa.oqa07,' ',l_gen02,
            COLUMN 60,g_x[21] CLIPPED,cl_numfor(sr.oqa.oqa10,15,t_azi04)
      PRINT COLUMN 10,sr.oqa.oqa031,
            COLUMN 60,g_x[22] CLIPPED,sr.oqa.oqa12
      PRINT COLUMN 10,sr.oqa.oqa032
      PRINT g_dash1[1,g_len]
      LET l_last_sw = 'n'

   BEFORE GROUP OF sr.oqa.oqa01 
      SKIP TO TOP OF PAGE
 
   AFTER GROUP OF sr.oqa.oqa01
      LET tot_amt=0
      LET tot_oqb11=0
      LET tot_oqc13=0
      LET tot_oqc14=0
      LET tot_oqd04=0

      #----- 材料成本
      PRINT COLUMN 02,g_x[23] CLIPPED
      PRINT COLUMN 02,g_x[24] CLIPPED,g_x[25] CLIPPED
      PRINT COLUMN 02,g_x[26] CLIPPED,g_x[27] CLIPPED
      DECLARE oqb_cur CURSOR FOR
          SELECT * FROM oqb_file WHERE oqb01=sr.oqa.oqa01 ORDER BY oqb02
      FOREACH oqb_cur INTO l_oqb.*
          IF l_oqb.oqb05 IS NULL THEN LET l_oqb.oqb05=0 END IF
          IF l_oqb.oqb10 IS NULL THEN LET l_oqb.oqb10=0 END IF
          IF l_oqb.oqb11 IS NULL THEN LET l_oqb.oqb11=0 END IF
          PRINT COLUMN 11,l_oqb.oqb03,
                COLUMN 32,l_oqb.oqb04,
                COLUMN 37,l_oqb.oqb05 USING '######&.&&',
                COLUMN 48,cl_numfor(l_oqb.oqb10,15,t_azi03),
                COLUMN 65,cl_numfor(l_oqb.oqb11,18,t_azi04),
                COLUMN 85,l_oqb.oqb06
          LET tot_oqb11=tot_oqb11+l_oqb.oqb11
      END FOREACH
      PRINT COLUMN 65,'-------------------'
      PRINT COLUMN 06,g_x[38] CLIPPED,
            COLUMN 65,cl_numfor(tot_oqb11,18,t_azi05)
      
      PRINT g_dash1[1,g_len]
      PRINT
      LET tot_amt=tot_amt+tot_oqb11

      #----- 人工/製費
      PRINT COLUMN 01,g_x[28] CLIPPED
      PRINT COLUMN 01,g_x[29] CLIPPED,g_x[30] CLIPPED
      PRINT COLUMN 01,g_x[31] CLIPPED,g_x[32] CLIPPED
      DECLARE oqc_cur CURSOR FOR
          SELECT * FROM oqc_file WHERE oqc01=sr.oqa.oqa01 ORDER BY oqc02
      FOREACH oqc_cur INTO l_oqc.*
          IF l_oqc.oqc13 IS NULL THEN LET l_oqc.oqc13=0 END IF
          IF l_oqc.oqc14 IS NULL THEN LET l_oqc.oqc14=0 END IF
          SELECT ima02 INTO l_ima02 FROM ima_file WHERE ima01=l_oqc.oqc04
          PRINT COLUMN 11,l_oqc.oqc03 CLIPPED,' ',l_oqc.oqc031 CLIPPED,
                COLUMN 32,l_oqc.oqc04,
                COLUMN 53,l_oqc.oqc06 CLIPPED,
                COLUMN 65,cl_numfor(l_oqc.oqc13,18,t_azi04)
          PRINT COLUMN 32,l_ima02,      
                COLUMN 65,cl_numfor(l_oqc.oqc14,18,t_azi04)
          LET tot_oqc13=tot_oqc13+l_oqc.oqc13
          LET tot_oqc14=tot_oqc14+l_oqc.oqc14
      END FOREACH
      PRINT COLUMN 62,'----------------------'
      PRINT COLUMN 06,g_x[38] CLIPPED,
            COLUMN 65,cl_numfor(tot_oqc13,18,t_azi04)
      PRINT COLUMN 65,cl_numfor(tot_oqc14,18,t_azi04)
      PRINT g_dash1[1,g_len]
      PRINT
      LET tot_amt=tot_amt+tot_oqc13+tot_oqc14
     
      #----- 其他費用
      PRINT COLUMN 02,g_x[33] CLIPPED
      PRINT COLUMN 02,g_x[34],COLUMN 52,g_x[35] CLIPPED
      PRINT COLUMN 02,g_x[36] CLIPPED,g_x[37] CLIPPED
      DECLARE oqd_cur CURSOR FOR
          SELECT * FROM oqd_file WHERE oqd01=sr.oqa.oqa01 ORDER BY oqd02
      FOREACH oqd_cur INTO l_oqd.*
          IF l_oqd.oqd04 IS NULL THEN LET l_oqd.oqd04=0 END IF
          PRINT COLUMN 11,l_oqd.oqd03,
                COLUMN 52,cl_numfor(l_oqd.oqd04,18,t_azi04)
          LET tot_oqd04=tot_oqd04+l_oqd.oqd04
      END FOREACH
      PRINT COLUMN 52,'-------------------'
      PRINT COLUMN 06,g_x[38] CLIPPED,
            COLUMN 52,cl_numfor(tot_oqd04,18,t_azi05)
      PRINT
      LET tot_amt=tot_amt+tot_oqd04

      PRINT g_dash[1,g_len]
      PRINT COLUMN 01,g_x[39] CLIPPED,
            COLUMN 49,cl_numfor(tot_amt,18,t_azi05)
  
   ON LAST ROW
      LET l_last_sw = 'y'

   PAGE TRAILER
      PRINT g_dash[1,g_len]
      IF l_last_sw = 'n'
         THEN PRINT g_x[4],g_x[5] CLIPPED, COLUMN (g_len-9), g_x[6] CLIPPED
         ELSE PRINT g_x[4],g_x[5] CLIPPED, COLUMN (g_len-9), g_x[7] CLIPPED
      END IF
END REPORT
