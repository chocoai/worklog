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

  LET l_sql = "select tc_fia01, tc_fia02,tc_fia03,tc_fia13,NVL(tc_fia13 - sysdate, 0),",
              " tc_fia14,tc_fia15 from tc_fia_file where tc_fia13 - sysdate <= 30"

  CALL cemr100(l_sql)


END FUNCTION

#背景执行，发送邮件
FUNCTION t100_b()
  DEFINE l_sql    STRING

  LET l_sql = ""

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
           tc_fia14   LIKE tc_fia_file.tc_fia14,
           tc_fia15   LIKE tc_fia_file.tc_fia15
           END RECORD

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

  CALL cl_prt(l_name,g_prtway,1,g_len)


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