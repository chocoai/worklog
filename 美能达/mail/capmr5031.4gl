# Prog. Version..: '5.25.02-11.03.23(00000)'     #
#
# Pattern name...: apmr5031.4gl
# Descriptions...: 採購單跟催表
# Input parameter:
# Return code....:
# Date & Author..: 91/09/30 By Nora
# Modify.........: 92/11/11 By Apple
#                  1.資料讀取有問題
#                  增加列印交期確認資料
# Modify.........:No:MOD-490148 04/09/09 By Smapmin 調整報表表頭列印出來的"排列順序"字眼
# Modify.........:No:MOD-490150 04/09/22 By Wiky view時show一半資料
# Modify.........: No.FUN-4A0010 04/10/05 By Yuna 料件編號.廠商.採購員要開窗
# Modify.........: No.FUN-4C0095 05/02/21 By Mandy 報表轉XML
# Modify         : No:MOD-530885 05/03/31 by alexlin VARCHAR->CHAR
# Modify         : No:MOD-570114 05/08/04 By NIcola 1.已交量應減去驗退量
#                                                   2.應僅考慮pmm25為'2' 的資料
# Modify.........: NO:FUN-5B0105 05/12/26 By Rosayu 排列順序有料件的長度要設成40
# Modify.........: No:TQC-610085 06/04/04 By Claire Review 所有報表程式接收的外部參數是否完整
# Modify.........: No:MOD-670130 06/07/28 By Claire 報表超過二頁時表頭列印的"排列順序"會重複列印
# Modify.........: No.FUN-6C0044 06/12/27 By yjkhero 報表格式修改
# Modify.........: No.FUN-160329 16/03/29 By mj 根据apmr503修改为apmr5031，实现自动发送邮件

DATABASE ds

GLOBALS "../../../tiptop/config/top.global"
DEFINE tm  RECORD
         wc   STRING,
         s    VARCHAR(03),
         t    VARCHAR(03),
         c    VARCHAR(01),
         yy   VARCHAR(4),
         mm   VARCHAR(2),
         more VARCHAR(01)
           END RECORD,
       g_pmd_rowid VARCHAR(18)
DEFINE g_cnt       INTEGER
DEFINE g_i         SMALLINT
DEFINE g_head1     STRING
DEFINE l_date      LIKE type_file.dat      #add by mj 160329
DEFINE l_cnt       LIKE type_file.num5     #add by mj 160329
DEFINE l_gen      RECORD LIKE gen_file.*   #add by mj 160331
MAIN
   OPTIONS
       INPUT NO WRAP
   DEFER INTERRUPT

   IF (NOT cl_user()) THEN
      EXIT PROGRAM
   END IF

   WHENEVER ERROR CALL cl_err_msg_log

   IF (NOT cl_setup("CYPM")) THEN
      EXIT PROGRAM
   END IF
   LET g_pdate = ARG_VAL(1)
   LET g_towhom = ARG_VAL(2)
   LET g_rlang = ARG_VAL(3)
   LET g_bgjob = ARG_VAL(4)
   LET g_prtway = ARG_VAL(5)
   LET g_copies = ARG_VAL(6)
   LET tm.wc = ARG_VAL(7)
   LET tm.s  = ARG_VAL(8)
   LET tm.t  = ARG_VAL(9)
   LET tm.c  = ARG_VAL(10)
   LET g_rep_user = ARG_VAL(11)
   LET g_rep_clas = ARG_VAL(12)
   LET g_template = ARG_VAL(13)
   IF cl_null(g_bgjob) OR g_bgjob = 'N'		# If background job sw is off
      THEN CALL r5031_tm(0,0)		# Input print condition
      ELSE
      	LET tm.yy = YEAR(TODAY)
      	LET tm.mm = MONTH(TODAY)-1
      	LET l_date = TODAY + 5
      	LET l_cnt = 1
      	DECLARE t540sub_pmd_c1 CURSOR FOR
                        SELECT * FROM gen_file
                          WHERE (gen03 = '20123'
                            or gen03 = '20125'      #addbywangww160425
                            or gen03 = '30503')
                            AND gen06 IS NOT NULL
                            AND genacti = 'Y'
                          ORDER BY gen01

         FOREACH t540sub_pmd_c1 INTO l_gen.*
         #   LET tm.wc = " pmn33 <= TO_DATE('",l_date,"', 'yy/mm/dd') AND pmm12 = '",l_gen.gen01,"' "
            LET tm.wc = " pmn33 <= TO_DATE('",l_date,"', 'yy/mm/dd') AND ima43 = '",l_gen.gen01,"' "  #addbywangww160909
      	    CALL r5031()			# Read data and create out-file
         END FOREACH

      	LET l_date = TODAY + 3
      	LET l_cnt = 2
      	LET tm.wc = " pmn33 <= TO_DATE('",l_date,"', 'yy/mm/dd')"
      	 CALL r5031()			# Read data and create out-file
      	LET l_date = TODAY - 20
      	LET l_cnt = 3
      	LET tm.wc = " pmn33 BETWEEN TO_DATE('",l_date,"', 'yy/mm/dd') and TO_DATE('",TODAY,"', 'yy/mm/dd')"
      	 CALL r5031()			# Read data and create out-file
   END IF
END MAIN

FUNCTION r5031_tm(p_row,p_col)
DEFINE lc_qbe_sn      LIKE gbm_file.gbm01   #No:FUN-580031
   DEFINE p_row,p_col	SMALLINT,
          l_cmd	 VARCHAR(1000)

   LET p_row = 4 LET p_col = 16

   OPEN WINDOW r5031_w AT p_row,p_col WITH FORM "cpm/42f/apmr503"
       ATTRIBUTE (STYLE = g_win_style CLIPPED) #No:FUN-580092 HCN

    CALL cl_ui_init()


   CALL cl_opmsg('p')
   INITIALIZE tm.* TO NULL			# Default condition
   LET tm.s      = '123'
   LET tm.c      = 'N'
   LET tm.more   = 'N'
   LET g_pdate   = g_today
   LET g_rlang   = g_lang
   LET g_bgjob   = 'N'
   LET g_copies  = '1'
   LET tm2.s1   = tm.s[1,1]
   LET tm2.s2   = tm.s[2,2]
   LET tm2.s3   = tm.s[3,3]
   LET tm2.t1   = tm.t[1,1]
   LET tm2.t2   = tm.t[2,2]
   LET tm2.t3   = tm.t[3,3]
   IF cl_null(tm2.s1) THEN LET tm2.s1 = ""  END IF
   IF cl_null(tm2.s2) THEN LET tm2.s2 = ""  END IF
   IF cl_null(tm2.s3) THEN LET tm2.s3 = ""  END IF
   IF cl_null(tm2.t1) THEN LET tm2.t1 = "N" END IF
   IF cl_null(tm2.t2) THEN LET tm2.t2 = "N" END IF
   IF cl_null(tm2.t3) THEN LET tm2.t3 = "N" END IF

WHILE TRUE
   CONSTRUCT BY NAME  tm.wc ON pmn33,pmn36,pmn34,pmn04,pmm09,pmm12,ima12
     #--No.FUN-4A0010--------
         #No:FUN-580031 --start--
         BEFORE CONSTRUCT
             CALL cl_qbe_init()
         #No:FUN-580031 ---end---

     ON ACTION CONTROLP
       CASE WHEN INFIELD(pmn04) #料件編號
              CALL cl_init_qry_var()
              LET g_qryparam.state= "c"
     	      LET g_qryparam.form = "q_ima"
     	      CALL cl_create_qry() RETURNING g_qryparam.multiret
     	      DISPLAY g_qryparam.multiret TO pmn04
     	      NEXT FIELD pmn04
            WHEN INFIELD(pmm09) #廠商編號
              CALL cl_init_qry_var()
              LET g_qryparam.state= "c"
              LET g_qryparam.form = "q_pmc"
              CALL cl_create_qry() RETURNING g_qryparam.multiret
              DISPLAY g_qryparam.multiret TO pmm09
              NEXT FIELD pmm09
           WHEN INFIELD(pmm12) #採購員
              CALL cl_init_qry_var()
              LET g_qryparam.state= "c"
              LET g_qryparam.form = "q_gen"
              CALL cl_create_qry() RETURNING g_qryparam.multiret
              DISPLAY g_qryparam.multiret TO pmm12
              NEXT FIELD pmm12
           WHEN INFIELD(ima12) #採購員
              CALL cl_init_qry_var()
              LET g_qryparam.state= "c"
              LET g_qryparam.form = "q_ima13"
              CALL cl_create_qry() RETURNING g_qryparam.multiret
              DISPLAY g_qryparam.multiret TO ima12
              NEXT FIELD ima12
        OTHERWISE EXIT CASE
        END CASE
     #--END---------------

     ON ACTION locale
         #CALL cl_dynamic_locale()
          CALL cl_show_fld_cont()                   #No:FUN-550037 hmf
         LET g_action_choice = "locale"
         EXIT CONSTRUCT

     ON IDLE g_idle_seconds
        CALL cl_on_idle()
        CONTINUE CONSTRUCT

 #     ON ACTION about         #MOD-4C0121
 #        CALL cl_about()      #MOD-4C0121

 #     ON ACTION help          #MOD-4C0121
 #        CALL cl_show_help()  #MOD-4C0121

      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121


           ON ACTION exit
           LET INT_FLAG = 1
           EXIT CONSTRUCT
         #No:FUN-580031 --start--
         ON ACTION qbe_select
            CALL cl_qbe_select()
         #No:FUN-580031 ---end---

   END CONSTRUCT
       IF g_action_choice = "locale" THEN
          LET g_action_choice = ""
          CALL cl_dynamic_locale()
          CONTINUE WHILE
       END IF


   IF INT_FLAG THEN LET INT_FLAG = 0 CLOSE WINDOW r5031_w EXIT PROGRAM END IF
   IF tm.wc=" 1=1 " THEN
      CALL cl_err(' ','9046',0)
      CONTINUE WHILE
   END IF
 # DISPLAY BY NAME tm.s,tm.c,tm.more
   DISPLAY BY NAME tm.yy,tm.mm,tm.s,tm.c,tm.more
   INPUT BY NAME
         tm.yy,tm.mm,
         #UI
         tm2.s1,tm2.s2,tm2.s3, tm2.t1,tm2.t2,tm2.t3,
         tm.c,tm.more
         WITHOUT DEFAULTS

         #No:FUN-580031 --start--
         BEFORE INPUT
             CALL cl_qbe_display_condition(lc_qbe_sn)
         #No:FUN-580031 ---end---

      AFTER FIELD c
         IF tm.c NOT MATCHES'[YN]' OR CL_NULL(tm.c) THEN
            NEXT FIELD c
         END IF

      AFTER FIELD more
         IF tm.more NOT MATCHES'[YN]' THEN
            NEXT FIELD more
         END IF
         IF tm.more = 'Y'
            THEN CALL cl_repcon(0,0,g_pdate,g_towhom,g_rlang,
                                g_bgjob,g_time,g_prtway,g_copies)
                      RETURNING g_pdate,g_towhom,g_rlang,
                                g_bgjob,g_time,g_prtway,g_copies
         END IF
      ON ACTION CONTROLZ
         CALL cl_show_req_fields()
      ON ACTION CONTROLG CALL cl_cmdask()	# Command execution
      #UI
      AFTER INPUT
         LET tm.s = tm2.s1[1,1],tm2.s2[1,1],tm2.s3[1,1]
         LET tm.t = tm2.t1,tm2.t2,tm2.t3
      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE INPUT

 #     ON ACTION about         #MOD-4C0121
 #        CALL cl_about()      #MOD-4C0121

 #     ON ACTION help          #MOD-4C0121
 #        CALL cl_show_help()  #MOD-4C0121


          ON ACTION exit
          LET INT_FLAG = 1
          EXIT INPUT
         #No:FUN-580031 --start--
         ON ACTION qbe_save
            CALL cl_qbe_save()
         #No:FUN-580031 ---end---

   END INPUT
   IF INT_FLAG THEN
      LET INT_FLAG = 0 CLOSE WINDOW r5031_w EXIT PROGRAM
   END IF
   IF g_bgjob = 'Y' THEN
      SELECT zz08 INTO l_cmd FROM zz_file	#get exec cmd (fglgo xxxx)
             WHERE zz01='capmr5031'
      IF SQLCA.sqlcode OR l_cmd IS NULL THEN
         CALL cl_err('capmr5031','9031',1)
      ELSE
         LET tm.wc=cl_replace_str(tm.wc, "'", "\"")         #mod by mj 160329 "
         LET l_cmd = l_cmd CLIPPED,		#(at time fglgo xxxx p1 p2 p3)
                         " '",g_pdate CLIPPED,"'",
                         " '",g_towhom CLIPPED,"'",
                         " '",g_lang CLIPPED,"'",
                         " '",g_bgjob CLIPPED,"'",
                         " '",g_prtway CLIPPED,"'",
                         " '",g_copies CLIPPED,"'" ,
                     #--------------No:TQC-610085 add
                         " '",tm.wc CLIPPED,"'" ,
                         " '",tm.s  CLIPPED,"'" ,
                         " '",tm.t  CLIPPED,"'" ,
                         " '",tm.c  CLIPPED,"'" ,
                     #--------------No:TQC-610085 end
                         " '",g_rep_user CLIPPED,"'",           #No:FUN-570264
                         " '",g_rep_clas CLIPPED,"'",           #No:FUN-570264
                         " '",g_template CLIPPED,"'"            #No:FUN-570264
         CALL cl_cmdat('capmr5031',g_time,l_cmd)	# Execute cmd at later time
      END IF
      CLOSE WINDOW r5031_w
      EXIT PROGRAM
   END IF
   CALL cl_wait()
   CALL r5031()
   ERROR ""
END WHILE
   CLOSE WINDOW r5031_w
END FUNCTION

FUNCTION r5031()
  #add by mj-BEGIN 20160329
   DEFINE l_pmd02    LIKE pmd_file.pmd02,
          l_pmd07    LIKE pmd_file.pmd07,
          l_zo02     LIKE zo_file.zo02,
          i          LIKE type_file.num5,
          l_str      STRING
  DEFINE l_subject      STRING   #主旨
  DEFINE l_body         STRING   #內文路徑
  DEFINE l_recipient    STRING   #收件者
  DEFINE ls_context        STRING
  DEFINE ls_temp_path      STRING
  DEFINE ls_context_file   STRING
  DEFINE l_cmd          LIKE type_file.chr1000
  #add by mj-END
   DEFINE l_name     VARCHAR(20),		# External(Disk) file name
          l_time     VARCHAR(8),		# Used time for running the job
          l_i        SMALLINT,		# Used time for running the job
          l_sql      VARCHAR(1000),        # RDSQL STATEMENT
          l_za05     VARCHAR(40),
          l_order    ARRAY[3] of VARCHAR(40), #FUN-5B0105 20->40
          sr         RECORD
                     order1    VARCHAR(40), #FUN-5B0105 20->40
                     order2    VARCHAR(40), #FUN-5B0105 20->40
                     order3    VARCHAR(40), #FUN-5B0105 20->40
                     pmn33     LIKE    pmn_file.pmn33,   #交貨日
                     pmn04     LIKE    pmn_file.pmn04,   #料件編號
                     pmn20     LIKE    pmn_file.pmn20,   #訂購量
                     pmn20_n   LIKE    pmn_file.pmn20,   #未交量
                     pmm09     LIKE    pmm_file.pmm09,   #廠商編號
                     pmm42     LIKE    pmm_file.pmm42,   #汇率
                     pmc03     LIKE    pmc_file.pmc03,   #簡稱
                     pmn16     LIKE    pmn_file.pmn16,   #狀況
                     pmm12     LIKE    pmm_file.pmm12,   #採購員
                     gen02     LIKE    gen_file.gen02,   #採購員簡稱
                     pmn01     LIKE    pmn_file.pmn01,   #採購單號
                     pmn02     LIKE    pmn_file.pmn02,   #項次
                     pmn14     LIKE    pmn_file.pmn14,   #部份交貨
                     pmn36     LIKE    pmn_file.pmn36,   #最近確認日
                     pmn34     LIKE    pmn_file.pmn34,   #到廠日
                     pmn06     LIKE    pmn_file.pmn06,   #廠商料件編號
                     pmn50     LIKE    pmn_file.pmn50,   #收貨量
                     pmc10     LIKE    pmc_file.pmc10,   #電話
                     pmm04     LIKE    pmm_file.pmm04,   #採購日期
                     pmn15     LIKE    pmn_file.pmn15,   #提前交貨
                     pmn041    LIKE    pmn_file.pmn041,  #品名規格
                     pmz03     LIKE    pmz_file.pmz03,   #次數
                     pmz05     LIKE    pmz_file.pmz05,   #答應日期
                     pmz06     LIKE    pmz_file.pmz06,   #交期確認日期
                     pmz07     LIKE    pmz_file.pmz07,   #預計到廠日
                     pmz08     LIKE    pmz_file.pmz08,   #預計到庫日
                     pmz09     LIKE    pmz_file.pmz09,   #確認交貨數量
                     pmz10     LIKE    pmz_file.pmz10,   #確認人
                     pmz11     LIKE    pmz_file.pmz11,   #備註一
                     ima06     LIKE    ima_file.ima06,
                     ima12     LIKE    ima_file.ima12,
                     ima48     LIKE    ima_file.ima48,
                     ima49     LIKE    ima_file.ima49,
                     ccc23     LIKE    ccc_file.ccc23,
                     amt       DEC(20,6),
                     pmn31     LIKE pmn_file.pmn31,
                     azf03     LIKE azf_file.azf03
                     END RECORD

       CALL cl_used(g_prog,l_time,1) RETURNING l_time #No:MOD-580088  HCN 20050818
     SELECT zo02 INTO g_company FROM zo_file WHERE zo01 = g_lang
#     SELECT zz17,zz05 INTO g_len,g_zz05 FROM zz_file WHERE zz01 = 'apmr5031'
#     IF g_len = 0 OR g_len IS NULL THEN LET g_len = 132 END IF
#     FOR  l_i = 1 TO g_len LET g_dash[l_i,l_i] = '=' END FOR
#     FOR  l_i = 1 TO g_len LET g_dash1[l_i,l_i] = '-' END FOR

     IF g_priv2='4' THEN                           #只能使用自己的資料
         LET tm.wc = tm.wc clipped," AND pmmuser = '",g_user,"'"
     END IF
     IF g_priv3='4' THEN                           #只能使用相同群的資料
        LET tm.wc = tm.wc clipped," AND pmmgrup MATCHES '",g_grup CLIPPED,"*'"
     END IF

     IF g_priv3 MATCHES "[5678]" THEN    #TQC-5C0134群組權限
        LET tm.wc = tm.wc clipped," AND pmmgrup IN ",cl_chk_tgrup_list()
     END IF


     IF tm.c='N' THEN
        LET l_sql = " SELECT '','','',",
                    " pmn33,pmn04,pmn20,(pmn20-pmn50+pmn55),pmm09,pmm42,pmc03,",
                   # " pmn16,pmm12,gen02,pmn01,pmn02,pmn14,pmn36,pmn34,pmn06,",       #markbywangww160907
                    " pmn16,(case when ima43 is null then pmm12 else ima43 end),'' ,",     #addbywangww160907
                    " pmn01,pmn02,pmn14,pmn36,pmn34,pmn06,",                 #addbywangww160907
                     " pmn50-pmn55,pmc10,pmm04,pmn15,pmn041,",   #No:MOD-570114
                    " 0,' ',' ',' ',' ',0,' ',' ',ima06,ima12,ima48,ima49,NVL(ccc23,0),NVL((pmn20-pmn50+pmn55)*pmm42*pmn31,0),pmn31,''",    #增加汇率
                  #  " FROM pmm_file,pmn_file,ccc_file, OUTER pmc_file, OUTER gen_file,",   #addbywangww160907 mark gen_file
                    # mod by lixwz 180420 s---
                    # " FROM pmm_file,pmn_file,ccc_file, OUTER pmc_file, ",    #addbywangww160907 mark gen_file
                    #" OUTER ima_file ",
                    #" WHERE pmm01 = pmn01 AND pmc_file.pmc01 = pmm09 ",
                 #  # " AND pmm12 = gen_file.gen01 AND pmn20 > pmn50-pmn55 ",  #markbywangww160907 mark gen02
                    #" AND  pmn20 > pmn50-pmn55 ",         #addbywangww160907 mark gen02
                    #" AND ima_file.ima01 = pmn04 ",
                    #" AND pmn04 = ccc01(+) ",
                    #" AND ccc02(+) = '",tm.yy,"'",
                    #" AND ccc03(+) = '",tm.mm,"'",
                    # " AND pmm25 = '2' ",   #No:MOD-570114
                    #" AND pmn16 = '2' AND ",tm.wc
                    # 重写为left join格式
                    "FROM pmm_file LEFT JOIN pmc_file ON pmc_file.pmc01 = pmm09 ,",
                    "     pmn_file LEFT JOIN ccc_file ON pmn04 = ccc01 AND ccc02 = '",tm.yy,"' AND ccc03(+) = '",tm.mm,"'",
                    "              LEFT JOIN ima_file ON ima_file.ima01 = pmn04 ",
                    " WHERE pmm01 = pmn01 AND  pmn20 > pmn50-pmn55 AND pmm25 = '2' ",
                    " AND pmn16 = '2' AND ",tm.wc
                    # mod by lixwz 180420 e---
     ELSE
        LET l_sql = " SELECT '','','',",
                    " pmn33,pmn04,pmn20,(pmn20-pmn50+pmn55),pmm09,pmm42,pmc03,",
                    #" pmn16,pmm12,gen02,pmn01,pmn02,pmn14,pmn36,pmn34,pmn06,",        #markbywangww160907
                    " pmn16,(case when ima43 is null then pmm12 else ima43 end),'' ,",     #addbywangww160907
                    " pmn01,pmn02,pmn14,pmn36,pmn34,pmn06,",                 #addbywangww160907
                     " pmn50-pmn55,pmc10,pmm04,pmn15,pmn041, ",   #No:MOD-570114
                    " pmz03,pmz05,pmz06,pmz07,pmz08,pmz09,pmz10,pmz11,ima06,ima12,ima48,ima49,NVL(ccc23,0),NVL((pmn20-pmn50+pmn55)*pmm42*pmn31,0),pmn31,'' ",  #增加汇率
                    #" FROM pmm_file,pmn_file,ccc_file, OUTER pmc_file, OUTER gen_file,",    #addbywangww160907 mark gen_file
                   # mod by lixwz 180420 s---
                   # " FROM pmm_file,pmn_file,ccc_file, OUTER pmc_file, ",  #addbywangww160907 mark gen_file
                   # " OUTER ima_file, OUTER pmz_file ",
                   # " WHERE pmm01 = pmn01 AND pmc_file.pmc01 = pmm09 ",
                   ## " AND pmm12 = gen_file.gen01 AND pmn20 > pmn50-pmn55 ",#BugNo:6098  #markbywangww160907 mark gen02
                   #" AND  pmn20 > pmn50-pmn55 ",         #addbywangww160907 mark gen02
                   # " AND ima_file.ima01 = pmn04 AND pmn01=pmz_file.pmz01 AND pmn02=pmz_file.pmz02 ",
                   # " AND ccc01(+) = pmn04 ",
                   # " AND ccc02(+) = '",tm.yy,"'",
                   # " AND ccc03(+) = '",tm.mm,"'",
                   #  " AND pmm25 = '2' ",   #No:MOD-570114
                   # " AND pmn16 = '2' AND ",tm.wc

                    # 重写为left join格式
                    "FROM pmm_file LEFT JOIN pmc_file ON pmc_file.pmc01 = pmm09 ,",
                    "     pmn_file LEFT JOIN ccc_file ON pmn04 = ccc01 AND ccc02 = '",tm.yy,"' AND ccc03(+) = '",tm.mm,"'",
                    "              LEFT JOIN ima_file ON ima_file.ima01 = pmn04 ",
                    "              LEFT JOIn pmz_file ON pmn01=pmz_file.pmz01 AND pmn02=pmz_file.pmz02 ",
                    " WHERE pmm01 = pmn01 AND  pmn20 > pmn50-pmn55 AND pmm25 = '2' ",
                    " AND pmn16 = '2' AND ",tm.wc
                    # mod by lixwz 180420 e---

     END IF
     IF g_priv2='4' THEN                           #只能使用自己的資料
         LET l_sql = l_sql clipped," AND pmmuser = '",g_user,"'"
     END IF
     IF g_priv3='4' THEN                           #只能使用相同群的資料
         LET l_sql = l_sql clipped," AND pmmgrup MATCHES '",g_grup CLIPPED,"*'"
     END IF

     IF g_priv3 MATCHES "[5678]" THEN    #TQC-5C0134群組權限
         LET l_sql = l_sql clipped," AND pmmgrup IN ",cl_chk_tgrup_list()
     END IF

     PREPARE r5031_p1 FROM l_sql
     IF SQLCA.sqlcode != 0 THEN
        CALL cl_err('prepare:',SQLCA.sqlcode,1) EXIT PROGRAM
     END IF
     DECLARE r5031_c1 CURSOR FOR r5031_p1

     LET l_sql = " SELECT pmd02,pmd05,ROWID FROM pmd_file ",
                 " WHERE pmd01 = ? " ,
                 " ORDER BY 2 "
     PREPARE r5031_p2 FROM  l_sql
     DECLARE r5031_c2 SCROLL CURSOR FOR r5031_p2

     CALL cl_outnam('capmr5031') RETURNING l_name
     START REPORT r5031_rep TO l_name

     LET g_pageno = 0
     FOREACH r5031_c1 INTO sr.*
       IF SQLCA.sqlcode != 0 THEN
          CALL cl_err('foreach:',SQLCA.sqlcode,1) EXIT FOREACH
       END IF
      LET g_head1=g_x[9]  CLIPPED    #MOD-670130 add
       FOR l_i = 1 TO 3
          CASE WHEN tm.s[l_i,l_i] = '1' LET l_order[l_i] = sr.pmn33 USING 'YYYYMMDD'
                                        LET g_head1=g_head1,' ',g_x[10] CLIPPED    #MOD-670130 add
               WHEN tm.s[l_i,l_i] = '2' LET l_order[l_i] = sr.pmn34 USING 'YYYYMMDD'
                                        LET g_head1=g_head1,' ',g_x[11] CLIPPED    #MOD-670130 add
               WHEN tm.s[l_i,l_i] = '3' LET l_order[l_i] = sr.pmn36 USING 'YYYYMMDD'
                                        LET g_head1=g_head1,' ',g_x[12] CLIPPED  #MOD-670130 add
               WHEN tm.s[l_i,l_i] = '4' LET l_order[l_i] = sr.pmn04
                                        LET g_head1=g_head1,' ',g_x[14] CLIPPED  #MOD-670130 add
               WHEN tm.s[l_i,l_i] = '5' LET l_order[l_i] = sr.pmm09
                                        LET g_head1=g_head1,' ',g_x[15] CLIPPED  #MOD-670130 add
               WHEN tm.s[l_i,l_i] = '6' LET l_order[l_i] = sr.pmm12
                                        LET g_head1=g_head1,' ',g_x[16] CLIPPED  #MOD-670130 add
               OTHERWISE LET l_order[l_i] = '-'
                         LET g_head1=g_head1,' ','-' CLIPPED  #MOD-670130 add
          END CASE
       END FOR
       LET sr.order1 = l_order[1]
       LET sr.order2 = l_order[2]
       LET sr.order3 = l_order[3]
       SELECT azf03 INTO sr.azf03 FROM azf_file WHERE azf01 = sr.ima12 AND azf02 ='G'
       SELECT  gen02 INTO  sr.gen02 FROM gen_file WHERE gen01=sr.pmm12        #addbywangww160907
       OUTPUT TO REPORT r5031_rep(sr.*)
     END FOREACH

     FINISH REPORT r5031_rep

#    CALL cl_prt(l_name,g_prtway,g_copies,g_len)
     #add by mj-BEGIN 160329
     IF g_bgjob = 'Y' THEN
        CASE l_cnt
        WHEN '1'
            IF sr.pmn04 IS NOT NULL THEN
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
                LET l_recipient = l_recipient CLIPPED,l_gen.gen06 CLIPPED
                LET g_xml.recipient = l_recipient

#               LET g_xml.subject = "the purchase list"
                LET g_xml.subject = "ERP 采购跟催信息"
                LET ls_context = "/u1/out/email/cpm/context.txt"
                CALL r5031_mail(g_xml.subject,ls_context,g_xml.body,g_xml.recipient)
                LET l_cmd = "sh /u1/topstd/tiptop/ds4gl2/bin/javamail/UnixMailSender.bat /u1/out/email/post.xml TRUE"    #运行邮件发送脚本文件
                RUN l_cmd
                LET l_cmd = "rm /u1/out/email/post.xml"
                RUN l_cmd
                LET l_cmd = "cp ",ls_context_file," ",ls_temp_path,"/email/cpm/posted/"
                RUN l_cmd
                LET l_cmd = "rm ",ls_context_file
                RUN l_cmd
             END IF

        WHEN '2'
           IF sr.pmn04 IS NOT NULL THEN
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
                LET l_recipient = l_recipient CLIPPED,"xu.yong@konicaminolta.com"         #固定IP
                LET g_xml.recipient = l_recipient

#               LET g_xml.subject = "the purchase list"
                LET g_xml.subject = "ERP 采购跟催信息"
                LET ls_context = "/u1/out/email/cpm/context.txt"
                CALL r5031_mail(g_xml.subject,ls_context,g_xml.body,g_xml.recipient)
                LET l_cmd = "sh /u1/topstd/tiptop/ds4gl2/bin/javamail/UnixMailSender.bat /u1/out/email/post.xml TRUE"    #运行邮件发送脚本文件
                RUN l_cmd
                LET l_cmd = "rm /u1/out/email/post.xml"
                RUN l_cmd
                LET l_cmd = "cp ",ls_context_file," ",ls_temp_path,"/email/cpm/posted/"
                RUN l_cmd
                LET l_cmd = "rm ",ls_context_file
                RUN l_cmd
             END IF
        WHEN '3'
           IF sr.pmn04 IS NOT NULL THEN
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
                LET l_recipient = l_recipient CLIPPED,"lin.hai@konicaminolta.com;shibahar.yoshiki@konicaminolta.com"
                LET g_xml.recipient = l_recipient

#               LET g_xml.subject = "the purchase list"
                LET g_xml.subject = "ERP 采购跟催信息"
                LET ls_context = "/u1/out/email/cpm/context.txt"
                CALL r5031_mail(g_xml.subject,ls_context,g_xml.body,g_xml.recipient)
                LET l_cmd = "sh /u1/topstd/tiptop/ds4gl2/bin/javamail/UnixMailSender.bat /u1/out/email/post.xml TRUE"    #运行邮件发送脚本文件
                RUN l_cmd
                LET l_cmd = "rm /u1/out/email/post.xml"
                RUN l_cmd
                LET l_cmd = "cp ",ls_context_file," ",ls_temp_path,"/email/cpm/posted/"
                RUN l_cmd
                LET l_cmd = "rm ",ls_context_file
                RUN l_cmd
             END IF
       END CASE
     ELSE
       CALL cl_prt(l_name,g_prtway,g_copies,g_len)
     END IF
     #add by mj-END 160329
       CALL cl_used(g_prog,l_time,2) RETURNING l_time #No:MOD-580088  HCN 20050818
END FUNCTION

FUNCTION r5031_mail(l_subject,ls_context,l_body,l_recipient)
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
    #End

END FUNCTION

REPORT r5031_rep(sr)
   DEFINE l_last_sw VARCHAR(1),
          l_flag        SMALLINT,
          g_cnt1        SMALLINT,
          sr         RECORD
                     order1    VARCHAR(40), #FUN-5B0105 20->40
                     order2    VARCHAR(40), #FUN-5B0105 20->40
                     order3    VARCHAR(40), #FUN-5B0105 20->40
                     pmn33     LIKE    pmn_file.pmn33,   #交貨日
                     pmn04     LIKE    pmn_file.pmn04,   #料件編號
                     pmn20     LIKE    pmn_file.pmn20,   #訂購量
                     pmn20_n   LIKE    pmn_file.pmn20,   #未交量
                     pmm09     LIKE    pmm_file.pmm09,   #廠商編號
                     pmm42     LIKE    pmm_file.pmm42,   #汇率
                     pmc03     LIKE    pmc_file.pmc03,   #簡稱
                     pmn16     LIKE    pmn_file.pmn16,   #狀況
                     pmm12     LIKE    pmm_file.pmm12,   #採購員
                     gen02     LIKE    gen_file.gen02,   #採購員簡稱
                     pmn01     LIKE    pmn_file.pmn01,   #採購單號
                     pmn02     LIKE    pmn_file.pmn02,   #項次
                     pmn14     LIKE    pmn_file.pmn14,   #部份交貨
                     pmn36     LIKE    pmn_file.pmn36,   #最近確認日
                     pmn34     LIKE    pmn_file.pmn34,   #到廠日
                     pmn06     LIKE    pmn_file.pmn06,   #廠商料件編號
                     pmn50     LIKE    pmn_file.pmn50,   #收貨量
                     pmc10     LIKE    pmc_file.pmc10,   #電話
                     pmm04     LIKE    pmm_file.pmm04,   #採購日期
                     pmn15     LIKE    pmn_file.pmn15,   #提前交貨
                     pmn041    LIKE    pmn_file.pmn041,  #品名規格
                     pmz03     LIKE    pmz_file.pmz03,   #次數
                     pmz05     LIKE    pmz_file.pmz05,   #答應日期
                     pmz06     LIKE    pmz_file.pmz06,   #交期確認日期
                     pmz07     LIKE    pmz_file.pmz07,   #預計到廠日
                     pmz08     LIKE    pmz_file.pmz08,   #預計到庫日
                     pmz09     LIKE    pmz_file.pmz09,   #確認交貨數量
                     pmz10     LIKE    pmz_file.pmz10,   #確認人
                     pmz11     LIKE    pmz_file.pmz11,   #備註一
                     ima06     LIKE    ima_file.ima06,
                     ima12     LIKE    ima_file.ima12,
                     ima48     LIKE    ima_file.ima48,
                     ima49     LIKE    ima_file.ima49,
                     ccc23     LIKE    ccc_file.ccc23,
                     amt       DEC(20,6),
                     pmn31     LIKE pmn_file.pmn31,
                     azf03     LIKE azf_file.azf03
                     END RECORD ,
            l_pmd02  LIKE pmd_file.pmd02,
            l_pmd05  LIKE pmd_file.pmd05,
            l_pmh12  LIKE pmh_file.pmh12,
            l_rva06  LIKE rva_file.rva06,
            l_ima021 LIKE ima_file.ima021, #FUN-4C0095
            l_gen02  LIKE gen_file.gen02   #FUN-4C0095
  DEFINE l_ima103 LIKE ima_file.ima103

  OUTPUT TOP MARGIN g_top_margin
         LEFT MARGIN g_left_margin
         BOTTOM MARGIN g_bottom_margin
         PAGE LENGTH g_page_line
      ORDER BY sr.order1,sr.order2,sr.order3,sr.pmn01,sr.pmn02,sr.pmz03

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
      PRINT g_x[31],g_x[42],g_x[48],g_x[41],g_x[38],g_x[32],
            g_x[50],g_x[33],g_x[34],g_x[44],g_x[35],g_x[45],
            g_x[37],g_x[47],g_x[39],g_x[52],g_x[53],g_x[54],g_x[55],
            g_x[36],g_x[40],g_x[49],g_x[51],g_x[57],g_x[62],g_x[58],g_x[59],
            g_x[60],g_x[61]
      PRINT g_dash1
      LET l_last_sw = 'n'

   BEFORE GROUP OF sr.order1
      IF tm.t[1,1] = 'Y' THEN
         SKIP TO TOP OF PAGE
      END IF
   BEFORE GROUP OF sr.order2
      IF tm.t[2,2] = 'Y' THEN
         SKIP TO TOP OF PAGE
      END IF
   BEFORE GROUP OF sr.order3
      IF tm.t[3,3] = 'Y' THEN
         SKIP TO TOP OF PAGE
      END IF

   BEFORE GROUP OF sr.pmn02
      IF tm.c='Y' THEN LET l_flag=1 END IF
      #聯絡人
      LET l_pmd02=' '
      LET l_pmd05=' '
      OPEN r5031_c2 USING sr.pmm09
      FETCH LAST r5031_c2 INTO l_pmd02,l_pmd05,g_pmd_rowid
      CLOSE r5031_c2

     SELECT ima021 INTO l_ima021 FROM ima_file
      WHERE ima01=sr.pmn04
     SELECT pmh12  INTO l_pmh12 FROM pmh_file
      WHERE pmh01= sr.pmn04  and  pmh02 = sr.pmm09

     SELECT max(rva06) INTO sr.pmn36
       FROM rvb_file, rva_file
       WHERE rva01 = rvb01 and rvb04 = sr.pmn01

     IF sr.pmn36 = '1899/12/31' THEN
       LET sr.pmn36 = ''
     END IF

     PRINT COLUMN g_c[31],sr.pmn33 USING 'yy/mm/dd',
           COLUMN g_c[32],sr.pmn04,
           COLUMN g_c[33],cl_numfor(sr.pmn20_n,33,0), #料號/訂購量
           COLUMN g_c[50],sr.pmn041,
           COLUMN g_c[34],cl_numfor(sr.pmn20,34,0),
           COLUMN g_c[35],sr.pmm09,    #未交量/廠商編號
           COLUMN g_c[36],l_pmd02,
           COLUMN g_c[37],sr.pmm12,    #聯絡人/採購員
           COLUMN g_c[38],sr.pmn01,
           COLUMN g_c[39],sr.pmn02 USING '####',
           COLUMN g_c[40],sr.pmn14,   #採購單號/項次/部份交貨
          COLUMN g_c[41],sr.pmn36 USING 'yy/mm/dd',
          COLUMN g_c[42],sr.pmn34 USING 'yy/mm/dd',
          COLUMN g_c[51],l_ima021,
          COLUMN g_c[44],cl_numfor(sr.pmn50,44,0),
          COLUMN g_c[45],sr.pmc03,    #交貨量/廠商簡稱
          COLUMN g_c[55],sr.pmc10,
          COLUMN g_c[47],sr.gen02,
          COLUMN g_c[48],sr.pmm04 USING 'yy/mm/dd',
          COLUMN g_c[49],sr.pmn15,   #電話 /採購員姓名/採購日期/提前交貨
          COLUMN g_c[52],sr.ima06,
          COLUMN g_c[57],sr.ima12,
          COLUMN g_c[62],sr.azf03,
          COLUMN g_c[53],cl_numfor(sr.ima48,53,0),
          COLUMN g_c[54],cl_numfor(sr.ima49,54,0),
          COLUMN g_c[58],cl_numfor(sr.ccc23,58,6),
          COLUMN g_c[59],cl_numfor(sr.amt,59,6),
          COLUMN g_c[60],cl_numfor(sr.pmn31,60,6),
          COLUMN g_c[61],cl_numfor(sr.pmm42,60,6)
   AFTER GROUP OF sr.pmz03
      IF tm.c='Y' THEN         #列印交期確認明細資料
         SELECT COUNT(*) INTO g_cnt FROM pmz_file
          WHERE pmz01=sr.pmn01 AND pmz02=sr.pmn02
         IF l_flag=1 AND g_cnt>0 THEN      #列印表頭
            PRINT COLUMN 10,g_x[17] CLIPPED,COLUMN 21,g_x[18] CLIPPED,
                  COLUMN 37,g_x[19] CLIPPED,COLUMN 51,g_x[20] CLIPPED,
                  COLUMN 65,g_x[21] CLIPPED,COLUMN 81,g_x[22] CLIPPED,
                  COLUMN 92,g_x[23] CLIPPED
            LET l_flag=0
            LET g_cnt1=0
         END IF
         #列印資料
         IF g_cnt>0 THEN
            SELECT gen02 INTO l_gen02 FROM gen_file
             WHERE gen01=sr.pmz10
            PRINT COLUMN 10,sr.pmz05,COLUMN 21,sr.pmz06,COLUMN 37,sr.pmz07,
                  COLUMN 51,sr.pmz08,COLUMN 65,sr.pmz09 USING '#########.###',COLUMN 81,sr.pmz10,
                  COLUMN 92,sr.pmz11[1,40]
            PRINT COLUMN 81,l_gen02
            LET g_cnt1=g_cnt1+1
            IF g_cnt=g_cnt1 THEN
               PRINT g_dash2
            END IF
         ELSE
            PRINT g_dash2
         END IF
      END IF

   ON LAST ROW
            NEED 4 LINES
            IF g_zz05='Y' THEN
              CALL cl_wcchp(tm.wc,'pmn33,pmn36,pmn34,pmn04,pmm09,pmm12' )
              RETURNING tm.wc
             PRINT  g_dash[1,g_len]
             CALL cl_prt_pos_wc(tm.wc)
            END IF
      PRINT COLUMN g_c[50],g_x[26],#add by xumin 081107
            COLUMN g_c[33],SUM(sr.pmn20_n)   #add by xumin 081107
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
