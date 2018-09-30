# Prog. Version..: '5.25.02-11.03.23(00000)'     #
#
# Pattern name...: cemr100.4gl
# Descriptions...: 重点设备维保日提醒
# Input parameter:
# Return code....:
# Date & Author..: 18/07/24 By lixwz

DATABASE ds

GLOBALS "../../../tiptop/config/top.global"

DEFINE g_cnt       INTEGER
DEFINE g_i         SMALLINT
DEFINE g_head1     STRING
DEFINE l_date      LIKE type_file.dat
DEFINE l_cnt       LIKE type_file.num5
DEFINE l_gen      RECORD LIKE gen_file.*
DEFINE g_wc       STRING
DEFINE g_sql      STRING
DEFINE l_table        STRING
DEFINE g_str          STRING
DEFINE sr         RECORD
       tc_fib01       LIKE tc_fib_file.tc_fib01,
       tc_fib02       LIKE tc_fib_file.tc_fib02,
       tc_fib03       LIKE tc_fib_file.tc_fib03,
       tc_fib04       LIKE tc_fib_file.tc_fib04,
       tc_fib05       LIKE tc_fib_file.tc_fib05,
       tc_fib06       LIKE tc_fib_file.tc_fib06,
       tc_fib07       LIKE tc_fib_file.tc_fib07,
       tc_fib08       LIKE tc_fib_file.tc_fib08,
       tc_fib09       LIKE tc_fib_file.tc_fib09,
       tc_fib10       LIKE tc_fib_file.tc_fib10,
       tc_fib11       LIKE tc_fib_file.tc_fib11,
       tc_fib12       LIKE tc_fib_file.tc_fib12,
       tc_fib15       LIKE tc_fib_file.tc_fib15,
       tc_fib17       LIKE tc_fib_file.tc_fib17,
       tc_fib18       LIKE tc_fib_file.tc_fib18,
       tc_fib19       LIKE tc_fib_file.tc_fib19
              END RECORD
MAIN
   OPTIONS
       INPUT NO WRAP
   DEFER INTERRUPT

   IF (NOT cl_user()) THEN
      EXIT PROGRAM
   END IF

   WHENEVER ERROR CALL cl_err_msg_log

   IF (NOT cl_setup("CEM")) THEN
      EXIT PROGRAM
   END IF

   CALL cl_used(g_prog,g_time,1) RETURNING g_time

   LET g_sql =  "tc_fib01.tc_fib_file.tc_fib01,",
                "tc_fib02.tc_fib_file.tc_fib02,",
                "tc_fib03.tc_fib_file.tc_fib03,",
                "tc_fib04.tc_fib_file.tc_fib04,",
                "tc_fib05.tc_fib_file.tc_fib05,",
                "tc_fib06.tc_fib_file.tc_fib06,",
                "tc_fib07.tc_fib_file.tc_fib07,",
                "tc_fib08.tc_fib_file.tc_fib08,",
                "tc_fib09.tc_fib_file.tc_fib09,",
                "tc_fib10.tc_fib_file.tc_fib10,",
                "tc_fib11.tc_fib_file.tc_fib11,",
                "tc_fib12.tc_fib_file.tc_fib12,",
                "tc_fib15.tc_fib_file.tc_fib15,",
                "tc_fib17.tc_fib_file.tc_fib17,",
                "tc_fib18.tc_fib_file.tc_fib18,",
                "tc_fib19.tc_fib_file.tc_fib19"

   LET l_table = cl_prt_temptable('cemr100',g_sql) CLIPPED
   IF l_table = -1 THEN EXIT PROGRAM END IF
   LET g_sql ="INSERT INTO ",g_cr_db_str CLIPPED,l_table CLIPPED,
                " VALUES(?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?)"
   PREPARE insert_prep FROM g_sql
   IF STATUS THEN
      CALL cl_err('insert_prep:',status,1)
      EXIT PROGRAM
   END IF

   LET g_bgjob = ARG_VAL(1)

   IF cl_null(g_bgjob) OR g_bgjob = 'N' THEN
      CALL t100_a()      # 直接打印
   ELSE
      CALL t100_b()      #背景执行，发送邮件
   END IF

END MAIN
# 直接打印
FUNCTION t100_a()
  DEFINE l_sql    STRING
  DEFINE tm RECORD
         wc  STRING,
         to_next  LIKE type_file.num20
         END RECORD
  DEFINE p_row   LIKE type_file.num5
  DEFINE p_col   LIKE type_file.num5
  DEFINE lc_qbe_sn       LIKE gbm_file.gbm01        #No.FUN-580031


  LET p_row = 5 LET p_col = 16

  OPEN WINDOW apmr001_w AT p_row,p_col WITH FORM "cem/42f/cemr100"
       ATTRIBUTE (STYLE = g_win_style CLIPPED) #No.FUN-580092 HCN

  CALL cl_ui_init()

  WHILE TRUE

   CONSTRUCT BY NAME tm.wc ON tc_fia01,tc_fia05,tc_fia09,tc_fiauser,tc_fia12,tc_fia10,tc_fia11,tc_fia13


   BEFORE CONSTRUCT
             #CALL cl_qbe_init()


      ON ACTION locale

         CALL cl_show_fld_cont()                   #No.FUN-550037 hmf
         LET g_action_choice = "locale"
         EXIT CONSTRUCT

      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE CONSTRUCT

      ON ACTION about
         CALL cl_about()

      ON ACTION help
         CALL cl_show_help()

      ON ACTION CONTROLP
         CASE

            WHEN INFIELD(tc_fia01)
               CALL cl_init_qry_var()
               LET g_qryparam.state= "c"
               LET g_qryparam.form = "cq_tc_fia01"
               CALL cl_create_qry() RETURNING g_qryparam.multiret
               DISPLAY g_qryparam.multiret TO tc_fia01
               NEXT FIELD tc_fia01

             WHEN INFIELD(tc_fiauser)
               CALL cl_init_qry_var()
               LET g_qryparam.state= "c"
               LET g_qryparam.form = "cq_tc_fia01"
               CALL cl_create_qry() RETURNING g_qryparam.multiret
               DISPLAY g_qryparam.multiret TO tc_fia01
               NEXT FIELD tc_fiauser
         END CASE

      ON ACTION controlg
         CALL cl_cmdask()


      ON ACTION exit
       LET INT_FLAG = 1
       EXIT CONSTRUCT

      ON ACTION qbe_select
        CALL cl_qbe_select()


     END CONSTRUCT

     IF g_action_choice = "locale" THEN
        LET g_action_choice = ""
        CALL cl_dynamic_locale()
        CONTINUE WHILE
     END IF

     IF INT_FLAG THEN
      LET INT_FLAG = 0 CLOSE WINDOW apmr001_w
      CALL cl_used(g_prog,g_time,2) RETURNING g_time #No.FUN-690119
      EXIT PROGRAM

   END IF
   IF tm.wc = '1=1' THEN
      #CALL cl_err('','9046',0) CONTINUE WHILE
   END IF

  INPUT BY NAME tm.to_next


         WITHOUT DEFAULTS

         BEFORE INPUT
             LET tm.to_next = 30
             CALL cl_qbe_display_condition(lc_qbe_sn)


      AFTER INPUT
         IF INT_FLAG THEN EXIT INPUT END IF
      ON ACTION CONTROLR
         CALL cl_show_req_fields()

      ON ACTION CONTROLG CALL cl_cmdask()     # Command execution

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
       #No.FUN-580031 --start--
       ON ACTION qbe_save
          CALL cl_qbe_save()
       #No.FUN-580031 ---end---

   END INPUT

   IF INT_FLAG THEN
      LET INT_FLAG = 0 CLOSE WINDOW apmr001_w
      CALL cl_used(g_prog,g_time,2) RETURNING g_time #No.FUN-690119
      EXIT PROGRAM

   END IF


  LET l_sql = "select tc_fia01 from tc_fia_file where tc_fia13 - sysdate <= ",tm.to_next,
              " AND tc_fia26 = 'Y' AND ",tm.wc CLIPPED

  LET g_sql = "SELECT tc_fib_file.tc_fib01, tc_fib_file.tc_fib02, tc_fib_file.tc_fib03, tc_fib_file.tc_fib04,",
              "tc_fib_file.tc_fib05, tc_fib_file.tc_fib06, tc_fib_file.tc_fib07, tc_fib_file.tc_fib08, tc_fib_file.tc_fib09,",
              " tc_fib_file.tc_fib10, tc_fib_file.tc_fib11, tc_fib_file.tc_fib12, tc_fib_file.tc_fib15, tc_fib_file.tc_fib17, ",
              "tc_fib_file.tc_fib18, tc_fib_file.tc_fib19 FROM tc_fib_file WHERe tc_fib05 in (",
              "select tc_fia01 from tc_fia_file where tc_fia13 - sysdate <= ",tm.to_next,
              " AND tc_fia26 = 'Y' AND ",tm.wc CLIPPED,")"
  #CALL cemr100(l_sql)
  PREPARE cemr100_prepare1 FROM g_sql
  DECLARE cemr100_cs1 CURSOR FOR cemr100_prepare1


  FOREACH cemr100_cs1 INTO sr.*
    IF SQLCA.sqlcode THEN
      CALL cl_err('FOREACH:r762_cs2',SQLCA.sqlcode,1)
      EXIT FOREACH
    END IF

    EXECUTE insert_prep USING sr.*
  END FOREACH

  LET g_sql = "SELECT * FROM ",g_cr_db_str CLIPPED,l_table CLIPPED
  LET g_str = ''
  #LET g_str = g_str,';',tm.uhc02,';',tm.uhc03,';',tm.uhc05,';',tm.uhc06,';',tm.uhc07
  CALL cl_prt_cs3('cemr100','cemr100',g_sql,g_str)

  END WHILE
  CLOSE WINDOW apmr001_w
  CALL cl_used(g_prog,g_time,2) RETURNING g_time #No.FUN-690119
  EXIT PROGRAM

END FUNCTION

#背景执行，发送邮件
FUNCTION t100_b()
  DEFINE l_sql    STRING

  LET l_sql = "SELECT UNIQUE tc_fia07,gen06 FROM tc_fia_file  ",
              " LEFT JOIN gen_file ON gen01 = tc_fia07",
              " WHERE tc_fia26 = 'Y'   "
  PREPARE r100_gen FROM  l_sql
  DECLARE r100_gen_c SCROLL CURSOR FOR r100_gen

  FOREACH r100_gen_c INTO l_gen.gen01,l_gen.gen06
      IF SQLCA.sqlcode != 0 THEN
          CALL cl_err('foreach:',SQLCA.sqlcode,1) EXIT FOREACH
      END IF

      LET l_sql = "select tc_fia01, tc_fia02,tc_fia03,tc_fia13,NVL(tc_fia13 - sysdate, 0),",
                  " gem02,gen02 from tc_fia_file",
                  " LEFT JOIN gem_file ON gem01 = tc_fia14 ",
                  " LEFT JOIN gen_file ON gen01 = tc_fia15 ",
                  " where tc_fia13 - sysdate <= 30",
                  " AND tc_fia26 = 'Y' AND tc_fia07 = '",l_gen.gen01,"'"
      CALL cemr100(l_sql)
  END FOREACH
END FUNCTION


FUNCTION cemr100(l_sql)
  DEFINE l_sql    STRING
  DEFINE l_name   VARCHAR(20)
  DEFINE sr  RECORD
           tc_fia01   LIKE tc_fia_file.tc_fia01,
           tc_fia02   LIKE tc_fia_file.tc_fia02,
           tc_fia03   LIKE tc_fia_file.tc_fia02,
           tc_fia13   LIKE tc_fia_file.tc_fia13,
           tc_fiadate LIKE type_file.num5,
           tc_fia14   LIKE gem_file.gem02,
           tc_fia15   LIKE gen_file.gen02

           END RECORD
  DEFINE l_zo02     LIKE zo_file.zo02
  DEFINE l_subject      STRING   #主旨
  DEFINE l_body         STRING   #內文路徑
  DEFINE l_recipient    STRING   #收件者
  DEFINE ls_context        STRING
  DEFINE ls_temp_path      STRING
  DEFINE ls_context_file   STRING
  DEFINE l_cmd          LIKE type_file.chr1000,
         l_str      STRING
  DEFINE l_sql_1    STRING
  DEFINE l_cnt      LIKE type_file.num5
  DEFINE l_gen06_01 LIKE gen_file.gen06
  DEFINE l_gen06_02 LIKE gen_file.gen06

  LET l_sql_1 = " SELECT count(1) FROM (",l_sql,")"

  PREPARE r100_count FROM  l_sql_1
  LET l_cnt = 0
  EXECUTE r100_count INTO l_cnt

  IF l_cnt > 0 THEN ELSE
      CALL cl_err('无报表资料','!',1)
      RETURN
  END IF

  PREPARE r100_p FROM  l_sql
  DECLARE r100_dc SCROLL CURSOR FOR r100_p

  LET g_pageno = 0

  CALL cl_outnam('cemr100') RETURNING l_name
  START REPORT r100_rep TO l_name

  FOREACH r100_dc INTO sr.*
      IF SQLCA.sqlcode != 0 THEN
          CALL cl_err('foreach:',SQLCA.sqlcode,1) EXIT FOREACH
      END IF
      OUTPUT TO REPORT r100_rep(sr.*)

  END FOREACH

  FINISH REPORT r100_rep

  IF g_bgjob = 'Y' THEN
      CALL cl_trans_xml_1(g_xml_rep,1)

      #主旨
      SELECT zo02 INTO l_zo02  FROM zo_file  WHERE zo01 = g_lang
      LET l_subject = cl_getmsg("apm-795",g_rlang) CLIPPED,l_zo02 CLIPPED
      LET g_xml.subject = l_subject

      #內文
      LET ls_context = cl_getmsg("apm-799",g_lang) CLIPPED
      LET ls_temp_path = FGL_GETENV("TEMPDIR")
      LET l_str = g_xml_rep CLIPPED
      LET l_str = l_str.substring(1,l_str.getlength()-3),"xls"
      LET ls_context_file = ls_temp_path,"/email/cpm/unpost/",l_str
      LET g_xml.body = ls_context_file

      #收件者
      LET l_recipient = ''

      select a.gen06,b.gen06
        into l_gen06_01,l_gen06_02
        from gen_file a
        left join hrat_file on hrat04 =a.gen03 and hrat05 ='1012'
        left join gen_file b on b.gen01 =  hrat01
      where a.gen01 = l_gen.gen01
      IF NOT cl_null(l_gen06_01) THEN
          LET l_recipient = l_recipient,l_gen06_01 CLIPPED,";"
      END IF
      IF NOT cl_null(l_gen06_02) THEN
          LET l_recipient = l_recipient,l_gen06_02 CLIPPED,";"
      END IF

      LET l_recipient = l_recipient     #"lixwz@digiwin.com"
      LET g_xml.recipient = l_recipient

#     LET g_xml.subject = "the purchase list"
      LET g_xml.subject = "ERP 重点设备维保日提醒"
      LET ls_context = "/u1/out/email/cpm/context1.txt"
      CALL r100_mail(g_xml.subject,ls_context,g_xml.body,g_xml.recipient)
      LET l_cmd = "sh /u1/topstd/tiptop/ds4gl2/bin/javamail/UnixMailSender.bat /u1/out/email/post.xml TRUE"    #运行邮件发送脚本文件
      RUN l_cmd
      LET l_cmd = "rm /u1/out/email/post.xml"
      RUN l_cmd
      LET l_cmd = "cp ",ls_context_file," ",ls_temp_path,"/email/cpm/posted/"
      RUN l_cmd
      LET l_cmd = "rm ",ls_context_file
      RUN l_cmd


  ELSE
      CALL cl_prt(l_name,g_prtway,1,g_len)
  END IF

END FUNCTION

FUNCTION r100_mail(l_subject,ls_context,l_body,l_recipient)
  DEFINE l_subject      STRING   #主旨
  DEFINE ls_context     STRING   #内文
  DEFINE l_body         STRING   #內文路徑
  DEFINE l_recipient    STRING   #收件者
  DEFINE l_str1         STRING
  DEFINE l_file       STRING
  DEFINE l_channel    base.Channel
  DEFINE l_mlj   RECORD LIKE mlj_file.*

  SELECT * INTO l_mlj.* FROM mlj_file WHERE mlj01 = 'DEFAULT'

  #写邮件发送文件
  LET l_file = "/u1/out/email/post.xml"
  LET l_channel = base.Channel.create()
  CALL l_channel.openFile(l_file,  "a")

  IF STATUS = 0 THEN
      CALL l_channel.setDelimiter("")

      #记录日志

      LET l_str1 = "<Mail>","\n"
      LET l_str1 = l_str1,"<Protocol>smtp</Protocol>","\n"
      LET l_str1 = l_str1,"<CheckAuth>Y</CheckAuth>","\n"
      LET l_str1 = l_str1,"<MailServer>",l_mlj.mlj03,"</MailServer>","\n"
      LET l_str1 = l_str1,"<MailServerPort>",l_mlj.mlj04,"</MailServerPort>","\n"
      LET l_str1 = l_str1,"<MailServerUser>",l_mlj.mlj05,"</MailServerUser>","\n"
      LET l_str1 = l_str1,"<MailServerUserPassword>",l_mlj.mlj06,"</MailServerUserPassword>","\n"
      LET l_str1 = l_str1,"<Subject>",l_subject,"</Subject>","\n"
      LET l_str1 = l_str1,"<MessageBody>",ls_context,"</MessageBody>","\n"
      LET l_str1 = l_str1,"<Attach>",l_body,"</Attach>","\n"
      LET l_str1 = l_str1,"<Recipient>",l_recipient,"</Recipient>","\n"
      LET l_str1 = l_str1,"<From>OMS-ERP@konicaminolta.com</From>","\n"
      LET l_str1 = l_str1,"</Mail>","\n"

      CALL l_channel.write(l_str1)
      CALL l_channel.write("")
  END IF
  CALL l_channel.close()

END FUNCTION

REPORT r100_rep(sr)
   DEFINE l_last_sw VARCHAR(1),
          l_flag        SMALLINT,
          g_cnt1        SMALLINT
  DEFINE sr  RECORD
             tc_fia01   LIKE tc_fia_file.tc_fia01,
             tc_fia02   LIKE tc_fia_file.tc_fia02,
             tc_fia03   LIKE tc_fia_file.tc_fia02,
             tc_fia13   LIKE tc_fia_file.tc_fia13,
             tc_fiadate LIKE type_file.num5,
             tc_fia14   LIKE tc_fia_file.tc_fia14,
             tc_fia15   LIKE tc_fia_file.tc_fia15
             END RECORD

   OUTPUT TOP MARGIN g_top_margin
         LEFT MARGIN g_left_margin
         BOTTOM MARGIN g_bottom_margin
         PAGE LENGTH g_page_line

   FORMAT
   PAGE HEADER
      PRINT COLUMN ((g_len-FGL_WIDTH(g_company CLIPPED))/2)+1 , g_company CLIPPED
      PRINT                                                                         #NO.FUN-6C0044
      PRINT COLUMN ((g_len-FGL_WIDTH(g_x[1] CLIPPED))/2)+1,g_x[1] CLIPPED           #NO.FUN-6C0044
      PRINT g_head1
      LET g_pageno = g_pageno + 1                      #NO.FUN-6C0044
      LET pageno_total = PAGENO USING '<<<',"/pageno"  #NO.FUN-6C0044
      PRINT g_head CLIPPED,pageno_total                #NO.FUN-6C0044
      PRINT g_dash[1,g_len]
      PRINT g_x[10],g_x[11],g_x[12],g_x[13],g_x[14],g_x[15],g_x[16]
      PRINT g_dash1
      LET l_last_sw = 'n'

  ON EVERY ROW
      PRINT COLUMN g_c[10],sr.tc_fia01,
            COLUMN g_x[11],sr.tc_fia02,
            COLUMN g_x[12],sr.tc_fia03,
            COLUMN g_x[13],sr.tc_fia13,
            COLUMN g_x[14],sr.tc_fiadate,
            COLUMN g_x[15],sr.tc_fia14,
            COLUMN g_x[16],sr.tc_fia15


  ON LAST ROW
      PRINT g_dash[1,g_len]                                                   #NO.FUN-6C0044
      PRINT g_x[4] CLIPPED,g_x[5] CLIPPED, COLUMN (g_len-9), g_x[7] CLIPPED   #NO.FUN-6C0044
      LET l_last_sw = 'y'

  PAGE TRAILER
      IF l_last_sw = 'n'
         THEN PRINT g_dash[1,g_len]                                                 #NO.FUN-6C0044
              PRINT g_x[4] CLIPPED,g_x[5] CLIPPED, COLUMN (g_len-9), g_x[6] CLIPPED #NO.FUN-6C0044
         ELSE SKIP 2 LINE
      END IF


END REPORT
