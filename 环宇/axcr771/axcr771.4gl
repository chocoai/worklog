# Prog. Version..: '5.10.03-08.08.20(00009)'     #
#
# Pattern name...: axcr771.4gl
# Descriptions...: 工單發料月報
# Input parameter:
# Return code....:
# Date & Author..: 98/12/03 By ANN CHEN
# Modify ........: No:9454 04/04/14 By Melody 修改tlf10 為tlf10*tlf60
# Modify ........: No:8741 moidfy 報表格式
# Modify.........: No.MOD-4A0238 04/10/18 By Smapmin 放寬ima02
# Modify.........: No:FUN-4C0099 05/01/04 By kim 報表轉XML功能
# Modify.........: No:FUN-570240 05/07/25 By yoyo 料件編號欄位加controlp
# Modify.........: No:FUN-570190 05/08/06 by Rosayu 單價、金額全部抓azi03取位
# Modify.........: No:MOD-5A0423 05/11/01 By Sarah 將362,376行的MARK拿掉
# Modify.........: No:FUN-5B0082 05/11/17 By Sarah 報表少印"其他"欄位
# Modify.........: No:TQC-610051 06/02/22 By Claire 接收的外部參數定義完整, 並與呼叫背景執行(p_cron)所需 mapping 的參數條件一致
# Modify.........: No:FUN-670058 06/07/18 By Sarah 抓取拆件式工單發料資料(將sfb02!='11'mark掉)
# Modify.........: No:MOD-680061 06/08/24 By Claire 倉退印倉庫tlf031
# Modify.........: No:FUN-680122 06/09/07 By zdyllq 類型轉換
# Modify.........: No.FUN-690125 06/10/16 By dxfwo cl_used位置調整及EXIT PROGRAM后加cl_used
# Modify.........: No.CHI-6A0004 06/10/25 By Hellen 本原幣取位修改
# Modify.........: No:FUN-6A0146 06/10/26 By bnlent l_time轉g_time
# Modify.........: No:CHI-690007 06/12/27 By kim GP3.5 成本報表數量印出小數位數(ccz27)的處理
# Modify.........: No:MOD-710128 07/04/09 By pengu 重工否, 應以元件的重工否為依據, 而非工單的重工否
# Modify.........: No:TQC-760141 07/06/15 By Sarah 報表的製表日期與FROM/頁次等..應該在雙線的上一行(標準)
# Modify.........: No:TQC-790087 07/09/14 By Sarah 修正Primary Key後,程式判斷錯誤訊息-239時必須改變做法
# Modify.........: No:FUN-810073 07/12/25 By ChenMoyan 轉CR報表
# Modify.........: No:FUN-7C0101 08/01/31 By Cockroach  增加type(成本計算類型)和打印字段
# Modify.........: No.FUN-830002 08/03/05 By Cockroach l_sql增加tlf_file與tlfc_file關聯字段
# Modify.........: No:MOD-7C0191 08/03/25 By Pengu 此支報表沒有針對拆件式的狀況做處理
# LILID MOD 090318 add ima39,aag02

DATABASE ds

GLOBALS "../../../tiptop/config/top.global"

   DEFINE tm  RECORD                  # Print condition RECORD
              wc      LIKE type_file.chr1000,  #No:FUN-680122 VARCHAR(300),      # Where condition
              bdate   LIKE type_file.dat,      #No:FUN-680122 DATE,
              edate   LIKE type_file.dat,      #No:FUN-680122 DATE,
              type    LIKE type_file.chr1,     #No:FUN-7C0101 ADD 成本計算類型
              a       LIKE type_file.chr1,     #No:FUN-680122 VARCHAR(1),
              more    LIKE type_file.chr1      #No:FUN-680122 VARCHAR(1)         # Input more condition(Y/N)
              END RECORD
DEFINE   g_i             LIKE type_file.num5     #count/index for any purpose        #No.FUN-680122 SMALLINT
DEFINE   g_sql,g_str     STRING                #No.FUN-810073
DEFINE   l_table         STRING                #No.FUN-810073
#LILID ADD 090318 --begin
DEFINE g_bookno1     LIKE aza_file.aza81
DEFINE g_bookno2     LIKE aza_file.aza82
DEFINE g_flag1       LIKE type_file.chr1
DEFINE l_old,l_new DATETIME  HOUR TO FRACTION # 起始时间 截止时间
DEFINE l_start,l_foreach_start,l_step     DATETIME  HOUR TO FRACTION  #LOG的起始时间
DEFINE l_logdate,l_logfile   STRING
#LILID ADD 090318 --end

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

   IF (NOT cl_setup("CXC")) THEN
      EXIT PROGRAM
   END IF
   CALL cl_used(g_prog,g_time,1) RETURNING g_time #No.FUN-690125 BY dxfwo

   #No.FUN-810073  --Begin
   LET g_sql = "tlf021.tlf_file.tlf021,",
               "tlf06.tlf_file.tlf06,",
               "tlf026.tlf_file.tlf026,",
               "tlf62.tlf_file.tlf62,",
               "tlf01.tlf_file.tlf01,",
               "ima02.ima_file.ima02,",
               "ima021.ima_file.ima021,",
               "ima39.ima_file.ima39,",#LILID ADD 090318
               "aag02.aag_file.aag02,",#LILID ADD 090318
               "tlfccost.tlfc_file.tlfccost,",       #FUN-7C0101 ADD
               "tlf10.tlf_file.tlf10,",
               "amt01.tlfc_file.tlfc221,",     #FUN-7C0101 tlf-->tlfc
               "amt02.tlfc_file.tlfc222,",     #FUN-7C0101 tlf-->tlfc
               "amt03.tlfc_file.tlfc2231,",    #FUN-7C0101 tlf-->tlfc
               "amt04.tlfc_file.tlfc2232,",    #FUN-7C0101 tlf-->tlfc
               "amt05.tlfc_file.tlfc224,",     #FUN-7C0101 tlf-->tlfc
               "amt07.tlfc_file.tlfc2241,",         #FUN-7C0101 ADD
               "amt08.tlfc_file.tlfc2242,",         #FUN-7C0101 ADD
               "amt09.tlfc_file.tlfc2243,",         #FUN-7C0101 ADD
               "amt06.ccc_file.ccc23,",
               "sfb99.cch_file.cch05,",
               "ima12.ima_file.ima12,",
               "bdate.type_file.dat,",
               "edate.type_file.dat,",
               "azf03.azf_file.azf03"
   LET l_table = cl_prt_temptable('axcr771',g_sql) CLIPPED
   IF l_table = -1 THEN EXIT PROGRAM END IF
   #No.FUN-810073  --End

#  SELECT azi04 INTO t_azi04 FROM azi_file WHERE azi01=g_aza.aza17   #NO.CHI-6A0004
   INITIALIZE tm.* TO NULL            # Default condition
   LET tm.a    = 'Y'
   LET tm.more = 'N'
   LET g_pdate = ARG_VAL(1)
   LET g_towhom = ARG_VAL(2)
   LET g_rlang = ARG_VAL(3)
   LET g_bgjob = ARG_VAL(4)
   LET g_prtway = ARG_VAL(5)
   LET g_copies = ARG_VAL(6)
   LET tm.wc = ARG_VAL(7)
   LET tm.bdate = ARG_VAL(8)
   LET tm.edate = ARG_VAL(9)
   #TQC-610051-begin
   LET tm.a = ARG_VAL(10)
   LET g_rep_user = ARG_VAL(11)
   LET g_rep_clas = ARG_VAL(12)
   LET g_template = ARG_VAL(13)
   LET tm.type  = ARG_VAL(14)   #FUN-7C0101  ADD
   ##No:FUN-570264 --start--
   #LET g_rep_user = ARG_VAL(10)
   #LET g_rep_clas = ARG_VAL(11)
   #LET g_template = ARG_VAL(12)
   LET g_rpt_name = ARG_VAL(13)  #No:FUN-7C0078
   ##No:FUN-570264 ---end---
   #TQC-610051-end
   IF cl_null(g_bgjob) or g_bgjob = 'N'
      THEN CALL axcr771_tm(0,0)
      ELSE CALL axcr771()
   END IF
   CALL cl_used(g_prog,g_time,2) RETURNING g_time #No.FUN-690125 BY dxfwo
END MAIN

FUNCTION axcr771_tm(p_row,p_col)
DEFINE lc_qbe_sn      LIKE gbm_file.gbm01   #No:FUN-580031
   DEFINE p_row,p_col       LIKE type_file.num5,          #No.FUN-680122 SMALLINT
          l_flag            LIKE type_file.chr1,          #No.FUN-680122 VARCHAR(1)
          l_bdate,l_edate   LIKE type_file.dat,           #No:FUN-680122 DATE,
          l_cmd             LIKE type_file.chr1000        #No.FUN-680122 VARCHAR(400)

   IF p_row = 0 THEN LET p_row = 5 LET p_col = 15 END IF
   LET p_row = 5 LET p_col = 20
   OPEN WINDOW axcr771_w AT p_row,p_col
        WITH FORM "axc/42f/axcr771"
         ATTRIBUTE (STYLE = g_win_style CLIPPED) #No:FUN-580092 HCN

   CALL cl_ui_init()

   CALL cl_opmsg('p')
   INITIALIZE tm.* TO NULL
   CALL s_azm(g_ccz.ccz01,g_ccz.ccz02) RETURNING l_flag,l_bdate,l_edate
   LET tm.bdate= l_bdate
   LET tm.edate= l_edate
   LET tm.type = g_ccz.ccz28
   LET tm.a   = 'Y'
   LET tm.more= 'N'
   LET g_pdate= g_today
   LET g_rlang= g_lang
   LET g_bgjob= 'N'
   LET g_copies= '1'

 WHILE TRUE
   #CONSTRUCT BY NAME tm.wc ON ima12,ima08,tlf62,ima57,ima01
   CONSTRUCT BY NAME tm.wc ON ima12,ima08,tlf62,ima57,ima01,sfb05  # add by lixwz180118
         #No:FUN-580031 --start--
         BEFORE CONSTRUCT
             CALL cl_qbe_init()
         #No:FUN-580031 ---end---

     ON ACTION locale
         #CALL cl_dynamic_locale()
          CALL cl_show_fld_cont()                   #No:FUN-550037 hmf
         LET g_action_choice = "locale"
         EXIT CONSTRUCT

     ON IDLE g_idle_seconds
        CALL cl_on_idle()
        CONTINUE CONSTRUCT

#No.FUN-570240 --start
     ON ACTION controlp
        IF INFIELD(ima01) THEN
           CALL cl_init_qry_var()
           LET g_qryparam.form = "q_ima"
           LET g_qryparam.state = "c"
           CALL cl_create_qry() RETURNING g_qryparam.multiret
           DISPLAY g_qryparam.multiret TO ima01
           NEXT FIELD ima01
        END IF
#No.FUN-570240 --end
        # add by lixwz180118 s
        IF INFIELD(sfb05) THEN
           CALL cl_init_qry_var()
           LET g_qryparam.form = "q_ima"
           LET g_qryparam.state = "c"
           CALL cl_create_qry() RETURNING g_qryparam.multiret
           DISPLAY g_qryparam.multiret TO sfb05
           NEXT FIELD sfb05
        END IF
        # add by lixwz180118 e

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121

      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121

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


   IF INT_FLAG THEN
      LET INT_FLAG = 0 CLOSE WINDOW axcr771_w
      CALL cl_used(g_prog,g_time,2) RETURNING g_time #No.FUN-690125 BY dxfwo
      EXIT PROGRAM

   END IF
   IF tm.wc = ' 1=1' THEN CALL cl_err('','9046',0) CONTINUE WHILE END IF
   INPUT BY NAME tm.bdate,tm.edate,tm.type,tm.a,tm.more #FUN-7C0101 ADD tm.type
      WITHOUT DEFAULTS

         #No:FUN-580031 --start--
         BEFORE INPUT
             CALL cl_qbe_display_condition(lc_qbe_sn)
         #No:FUN-580031 ---end---

      AFTER FIELD bdate
        IF cl_null(tm.bdate) THEN NEXT FIELD bdate END IF
      AFTER FIELD edate
        IF cl_null(tm.edate) OR tm.edate<tm.bdate THEN NEXT FIELD edate END IF
#FUN-7C0101 --START--
      AFTER FIELD type
        IF tm.type IS NULL OR tm.type NOT MATCHES '[12345]' THEN NEXT FIELD type END IF
#FUN-7C0101 --END--
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
         #No:FUN-580031 --start--
         ON ACTION qbe_save
            CALL cl_qbe_save()
         #No:FUN-580031 ---end---

   END INPUT
   IF INT_FLAG THEN
      LET INT_FLAG = 0 CLOSE WINDOW axcr771_w
      CALL cl_used(g_prog,g_time,2) RETURNING g_time #No.FUN-690125 BY dxfwo
      EXIT PROGRAM

   END IF
   IF g_bgjob = 'Y' THEN
      SELECT zz08 INTO l_cmd FROM zz_file    #get exec cmd (fglgo xxxx)
             WHERE zz01='axcr771'
      IF SQLCA.sqlcode OR l_cmd IS NULL THEN
          CALL cl_err('axcr771','9031',1)
      ELSE
         LET tm.wc=cl_replace_str(tm.wc, "'", "\"")
         LET l_cmd = l_cmd CLIPPED,
                         " '",g_pdate CLIPPED,"'",
                         " '",g_towhom CLIPPED,"'",
                         #" '",g_lang CLIPPED,"'", #No:FUN-7C0078
                         " '",g_rlang CLIPPED,"'", #No:FUN-7C0078
                         " '",g_bgjob CLIPPED,"'",
                         " '",g_prtway CLIPPED,"'",
                         " '",g_copies CLIPPED,"'",
                         " '",tm.wc CLIPPED,"'",
                         " '",tm.bdate CLIPPED,"'",
                         " '",tm.edate CLIPPED,"'",
                         " '",tm.type  CLIPPED,"'",             #FUN-7C0101 ADD
                         " '",tm.a CLIPPED,"'",                 #TQC-610051
                         " '",g_rep_user CLIPPED,"'",           #No:FUN-570264
                         " '",g_rep_clas CLIPPED,"'",           #No:FUN-570264
                         " '",g_template CLIPPED,"'",           #No:FUN-570264
                         " '",g_rpt_name CLIPPED,"'"            #No:FUN-7C0078

         CALL cl_cmdat('axcr771',g_time,l_cmd)    # Execute cmd at later time
      END IF
      CLOSE WINDOW axcr771_w
      CALL cl_used(g_prog,g_time,2) RETURNING g_time #No.FUN-690125 BY dxfwo
      EXIT PROGRAM
   END IF
   CALL cl_wait()
   CALL axcr771()
   ERROR ""
END WHILE
   CLOSE WINDOW axcr771_w
END FUNCTION

FUNCTION axcr771()
  define g_cnt like type_file.num20
   DEFINE l_name    LIKE type_file.chr20,         #No:FUN-680122 VARCHAR(20),        # External(Disk) file name
#       l_time          LIKE type_file.chr8        #No.FUN-6A0146
#          l_sql     LIKE type_file.chr1000,       # RDSQL STATEMENT        #No.FUN-680122CHAR(600)  #FUN-830002 MARK
           l_sql     STRING,
          l_chr     LIKE type_file.chr1,          #No.FUN-680122 VARCHAR(1)
          l_za05    LIKE type_file.chr1000,       #No:FUN-680122 VARCHAR(40),
          l_azf03   LIKE azf_file.azf03,          #No.FUN-810073
          sr               RECORD code   LIKE type_file.chr1,     #No:FUN-680122 VARCHAR(01),
                                  ima12  LIKE ima_file.ima12,
                                  ima01  LIKE ima_file.ima01,
                                  ima02  LIKE ima_file.ima02,
                                  ima021 LIKE ima_file.ima021,   #FUN-4C0099
                                  ima39  LIKE ima_file.ima39,#LILID ADD 090318
                                  aag02  LIKE aag_file.aag02,#LILID ADD 090318
                                  tlfccost LIKE tlfc_file.tlfccost,  #FUN-7C0101 ADD
                                  tlf02  LIKE tlf_file.tlf02,
                                  tlf021 LIKE tlf_file.tlf021,
                                  tlf03  LIKE tlf_file.tlf03,
                                  tlf031 LIKE tlf_file.tlf031,
                                  tlf06  LIKE tlf_file.tlf06,
                                  tlf026 LIKE tlf_file.tlf026,
                                  tlf027 LIKE tlf_file.tlf027,
                                  tlf036 LIKE tlf_file.tlf036,
                                  tlf037 LIKE tlf_file.tlf037,
                                  tlf01  LIKE tlf_file.tlf01,
                                  tlf10  LIKE tlf_file.tlf10,
                                  tlfc21  LIKE tlfc_file.tlfc21,   #FUN-7C0101 tlf-->tlfc
                                  tlf13  LIKE tlf_file.tlf13,
                                  tlf62  LIKE tlf_file.tlf62,
                                  tlf907 LIKE tlf_file.tlf907,
                                  amt01  LIKE tlfc_file.tlfc221,   #材料金額 #FUN-7C0101 tlf-->tlfc
                                  amt02  LIKE tlfc_file.tlfc222,   #人工金額 #FUN-7C0101 tlf-->tlfc
                                  amt03  LIKE tlfc_file.tlfc2231,  #製造費用#FUN-7C0101 tlf-->tlfc
                                  amt04  LIKE tlfc_file.tlfc2232,  #加工費用 #FUN-7C0101 tlf-->tlfc
                                 #start FUN-5B0082
                                  amt05  LIKE tlfc_file.tlfc224,   #其他金額#FUN-7C0101 tlf-->tlfc
                                  amt07  LIKE tlfc_file.tlfc2241, #FUN-7C0101 ADD 制費三
                                  amt08  LIKE tlfc_file.tlfc2241, #FUN-7C0101 ADD 制費四
                                  amt09  LIKE tlfc_file.tlfc2241, #FUN-7C0101 ADD 制費五
                                 #amt05  LIKE ccc_file.ccc23     #總金額
                                  amt06  LIKE ccc_file.ccc23     #總金額
                                 #end FUN-5B0082
                        END RECORD
     #No.FUN-810073  --Begin #设定LOG追踪文件的名字
   LET l_logdate = YEAR(CURRENT) USING "####",MONTH(CURRENT) USING "&&",DAY(CURRENT) USING "&&","-",TIME(CURRENT)
    LET l_logfile = "/u1/out/axcr771-"||g_user||"-"||g_dbs||"-"||l_logdate||'.log'

   LET l_old = TIME(CURRENT)       #日志开始追踪的时间
   LET l_old = TIME(CURRENT)
   LET l_start = l_old            #日志追踪的起始时间

   RUN "echo '"||l_old||" axcr771() Start' > "||l_logfile

     CALL cl_del_data(l_table)
     LET g_sql = "INSERT INTO ",g_cr_db_str CLIPPED,l_table CLIPPED,
                 #" VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"  #FUN-7C0101 ADD 4 ?#LILID MOD 090318 add ??
                 " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"  #FUN-7C0101 ADD 4 ?
     PREPARE insert_prep FROM g_sql
     IF STATUS THEN
        CALL cl_err('insert_prep:',status,1) EXIT PROGRAM
     END IF
     #No.FUN-810073  --End

     SELECT zo02 INTO g_company FROM zo_file WHERE zo01 = g_rlang
    #No.FUN-810073  --Begin
    # DROP TABLE r771_tmp
    # CREATE  TABLE r771_tmp
    #   ( wo         VARCHAR(10),      #部門
    #     part       VARCHAR(20),      #料號
    #     amt1       DECIMAL(15,3),
    #     amt2       DECIMAL(15,3),
    #     amt3       DECIMAL(15,3),
    #     amt4       DECIMAL(15,3)
    #    ,amt5       DECIMAL(15,3)
    #  );   #FUN-5B0082 增加amt5
    # create unique index r771_01 on r771_tmp(wo,part)
    #No.FUN-810073  --End

    #-----------------------No:MOD-710128 modify
    #LET l_sql = "SELECT '',ima12,ima01,ima02,ima021,",
    #            "       tlf02,tlf021,tlf03,tlf031,tlf06,tlf026,tlf027,",
    #            "       tlf036,tlf037,tlf01,tlf10*tlf60,tlf21,tlf13,tlf62,tlf907,",
    #           #"       tlf221,tlf222,tlf2231,tlf2232,0",          #FUN-5B0082 mark
    #            "       tlf221,tlf222,tlf2231,tlf2232,tlf224,0",   #FUN-5B0082
    #            "  FROM tlf_file,ima_file,sfb_file",    #MODNO:7135
    #        #   "  FROM tlf_file, OUTER ima_file,sfb_file",
    #            " WHERE ima_file.ima01 = tlf01 AND tlf62 = sfb_file.sfb01 ",
    #            "   AND (tlf13 LIKE 'asfi5%') ",
    #            "   AND sfb02 != '11'",   #FUN-680075 mark
    #            "   AND ",tm.wc CLIPPED,
    #            "   AND (tlf06 BETWEEN '",tm.bdate,"' AND '",tm.edate,"')",
    #            "   AND tlf902 NOT IN(SELECT jce02 FROM jce_file) "  #no.5708
     #LET l_sql = "SELECT cch05,ima12,ima01,ima02,ima021,tlfccost, ",#FUN-7C0101 ADD tlfccost #LILID MOD 090318 add ima39,aag02
     LET l_sql = "SELECT cch05,ima12,ima01,ima02,ima021,ima39,'',tlfccost, ",#FUN-7C0101 ADD tlfccost
                 "       tlf02,tlf021,tlf03,tlf031,tlf06,tlf026,tlf027,",
                 "       tlf036,tlf037,tlf01,tlf10*tlf60,tlf21,tlf13,tlf62,tlf907,",
                 "       tlfc221,tlfc222,tlfc2231,tlfc2232,tlfc224,tlfc2241,tlfc2242,tlfc2243,0",#FUN-7C0101 tlf221-tlf224-->tlfc221-tlfc224  ADD tlf2241-tlf2243
                 "  FROM tlf_file,ima_file,sfb_file,OUTER cch_file,OUTER tlfc_file", #FUN-7C0101 ADD tlfc_file
                 " WHERE ima_file.ima01 = tlf01 AND tlf62 = sfb_file.sfb01 ",
                 "   AND cch_file.cch01 = tlf62 ",
                 "   AND cch_file.cch02 = YEAR(tlf06) ",
                 "   AND cch_file.cch03 = MONTH(tlf06) ",
                 "   AND cch_file.cch04 = tlf01 ",
                #---------------No:MOD-7C0191 modify
                #"   AND (tlf13 LIKE 'asfi5%') ",
                 "   AND ((tlf13 matches 'asfi5*') OR (tlf13 matches 'asft6*' AND sfb02='11'))",
                #---------------No:MOD-7C0191 end
                 "   AND ",tm.wc CLIPPED,
                 "   AND (tlf06 BETWEEN '",tm.bdate,"' AND '",tm.edate,"')",
                 "   AND tlf902 NOT IN(SELECT jce02 FROM jce_file) "  ,
                 "   AND cch06 = tlfctype ",                     #FUN-7C0101 ADD
                 "   AND cch07 = tlfccost ",                     #FUN-7C0101 ADD
                 " AND tlfc_file.tlfc01 = tlf01  AND tlfc_file.tlfc06 = tlf06",      #FUN-7C0101 ADD
#FUN-830002                 "   AND tlfc026= tlf026 AND tlfc027= tlf027",     #FUN-7C0101 ADD
#FUN-830002                 "   AND tlfc036= tlf036 AND tlfc037= tlf037",     #FUN-7C0101 ADD
                 " AND tlfc_file.tlfc02 = tlf02  AND tlfc_file.tlfc03 = tlf03 ",                        #FUN-830002 ADD
                 " AND tlfc_file.tlfc13 = tlf13 ",                                         #FUN-830002 ADD
                 " AND tlfc_file.tlfc902= tlf902 AND tlfc_file.tlfc903= tlf903 ",                    #FUN-830002 ADD
                 " AND tlfc_file.tlfc904= tlf904 AND tlfc_file.tlfc907= tlf907 ",                    #FUN-830002 ADD
                 " AND tlfc_file.tlfc905= tlf905 AND tlfc_file.tlfc906= tlf906",     #FUN-7C0101 ADD
                 " AND tlfc_file.tlfctype = '",tm.type,"'"                 #FUN-7C0101 ADD
    #-----------------------No:MOD-710128 end

     PREPARE axcr771_prepare1 FROM l_sql
     IF STATUS THEN CALL cl_err('prepare:',STATUS,1)
        CALL cl_used(g_prog,g_time,2) RETURNING g_time #No.FUN-690125 BY dxfwo
        EXIT PROGRAM
     END IF
     DECLARE axcr771_curs1 CURSOR FOR axcr771_prepare1

     CALL cl_outnam('axcr771') RETURNING l_name
     #START REPORT axcr771_rep TO l_name                #No.FUN-810073 BY ChenMoyan
     LET g_pageno = 0

     LET l_new = TIME(CURRENT)      #当前时间
     RUN "echo '"||l_new||" "||l_new-l_old||" FOREACH START' >> "||l_logfile                #追加到已有的日志
     LET l_old = l_new              #重设时间

     FOREACH axcr771_curs1 INTO sr.*
       IF STATUS THEN CALL cl_err('foreach:',STATUS,1) EXIT FOREACH END IF
      #-------------No:MOD-710128 modify
      #LET sr.code=' '
      #SELECT sfb99 INTO sr.code FROM sfb_file WHERE sfb01 = sr.tlf62
      #IF SQLCA.sqlcode THEN LET sr.code = ' ' END IF
      #LILID ADD 090318 --begin 账套
       CALL s_get_bookno(year(sr.tlf06))
         RETURNING g_flag1,g_bookno1,g_bookno2
       IF g_flag1='1' THEN #抓不到帳別
          LET sr.aag02=''
       ELSE
       SELECT aag02 INTO sr.aag02 FROM aag_file WHERE aag01=sr.ima39
        AND  aag00=g_bookno1
       IF STATUS THEN
          CALL cl_err3("sel","aag_file",sr.ima39,"",STATUS,"","select aag",1)
       END IF
       END IF
      #LILID ADD 090318 --end
       IF cl_null(sr.code) THEN LET sr.code = ' ' END IF
      #-------------No:MOD-710128 end
       IF  cl_null(sr.amt01)  THEN LET sr.amt01=0 END IF
       IF  cl_null(sr.amt02)  THEN LET sr.amt02=0 END IF
       IF  cl_null(sr.amt03)  THEN LET sr.amt03=0 END IF
       IF  cl_null(sr.amt04)  THEN LET sr.amt04=0 END IF
       IF  cl_null(sr.amt05)  THEN LET sr.amt05=0 END IF   #FUN-5B0082
       IF  cl_null(sr.amt07)  THEN LET sr.amt07=0 END IF   #FUN-7C0101  ADD
       IF  cl_null(sr.amt08)  THEN LET sr.amt08=0 END IF   #FUN-7C0101  ADD
       IF  cl_null(sr.amt09)  THEN LET sr.amt09=0 END IF   #FUN-7C0101  ADD
       #-->退料時為正值
       IF sr.tlf907 = 1 THEN
          LET sr.tlf02  = sr.tlf03
          LET sr.tlf021 = sr.tlf031     #MOD-680061 add
          LET sr.tlf026 = sr.tlf036
       ELSE
          LET sr.tlf10= sr.tlf10 * -1
          LET sr.amt01= sr.amt01 * -1
          LET sr.amt02= sr.amt02 * -1
          LET sr.amt03= sr.amt03 * -1
          LET sr.amt04= sr.amt04 * -1
          LET sr.amt05= sr.amt05 * -1   #FUN-5B0082
          LET sr.amt07= sr.amt07 * -1   #FUN-7C0101  ADD
          LET sr.amt08= sr.amt08 * -1   #FUN-7C0101  ADD
          LET sr.amt09= sr.amt09 * -1   #FUN-7C0101  ADD
       END IF
      #start FUN-5B0082
      #LET sr.amt05 = sr.amt01 + sr.amt02 + sr.amt03 + sr.amt04
      #IF cl_null(sr.amt05)  THEN LET sr.amt05=0 END IF
       LET sr.amt06 = sr.amt01 + sr.amt02 + sr.amt03 + sr.amt04 + sr.amt05 + sr.amt07 + sr.amt08 + sr.amt09 #FUN-7C0101 ADD amt07-amt09
       IF cl_null(sr.amt06)  THEN LET sr.amt06=0 END IF

      #No.FUN-810073  --Begin
      IF NOT cl_null(sr.ima12) THEN
         SELECT azf03 INTO l_azf03 FROM azf_file WHERE azf01=sr.ima12 AND azf02='G' #6818
         IF SQLCA.sqlcode THEN LET l_azf03 = ' ' END IF
         LET l_azf03=l_azf03[1,8]
      END IF
         LET l_new = TIME(CURRENT)      #当前时间
         RUN "echo '"||l_new||" "||l_new-l_old||" -----insert_prep START' >> "||l_logfile                #追加到已有的日志
         LET l_old = l_new
      EXECUTE insert_prep USING
          #sr.tlf021,sr.tlf06,sr.tlf026,sr.tlf62,sr.tlf01,sr.ima02,sr.ima021,sr.tlfccost,   #FUN-7C0101 ADD tlfccost#LILID MOD 090318 add ima39,aag02
          sr.tlf021,sr.tlf06,sr.tlf026,sr.tlf62,sr.tlf01,sr.ima02,sr.ima021,sr.ima39,sr.aag02,sr.tlfccost,   #FUN-7C0101 ADD tlfccost
          sr.tlf10,sr.amt01,sr.amt02,sr.amt03,sr.amt04,sr.amt05,sr.amt07,sr.amt08,sr.amt09,# #FUN-7C0101 ADD sr.amt07-amt09
          sr.amt06,sr.code,sr.ima12,tm.bdate,tm.edate,l_azf03
     #No.FUN-810073  --End
         LET l_new = TIME(CURRENT)      #当前时间
         RUN "echo '"||l_new||" "||l_new-l_old||" -----insert_prep END' >> "||l_logfile                #追加到已有的日志
         LET l_old = l_new
     #end FUN-5B0082
     #  OUTPUT TO REPORT axcr771_rep(sr.*)                  #FUN-810073
     END FOREACH

     #FINISH REPORT axcr771_rep                             #FUN-810073

     #CALL cl_prt(l_name,g_prtway,g_copies,g_len)           #FUN-810073
     LET g_sql = "SELECT * FROM ",g_cr_db_str CLIPPED,l_table CLIPPED
     IF g_zz05 = 'Y' THEN
         CALL cl_wcchp(tm.wc,'ima12,ima08,tlf62,ima57,ima01')
             RETURNING tm.wc
     ELSE
         LET tm.wc = ""
     END IF
     LET g_str = tm.wc,";",tm.a
#FUN-7C0101 --START--  根據成本計算類型判定類別編號是否打印
     IF tm.type MATCHES '[12]' THEN
        CALL cl_prt_cs3('axcr771','axcr771',g_sql,g_str)
     ELSE
        CALL cl_prt_cs3('axcr771','axcr771_1',g_sql,g_str)
     END IF
#FUN-7C0101 --END--

       LET l_new = TIME(CURRENT)      #当前时间

       RUN "echo '"||l_new||" "||l_new-l_start||" axcr771() Finish' >> "||l_logfile                #追加到已有的日志

END FUNCTION
#No.FUN-810073  --Begin
#No:8741
#REPORT axcr771_rep(sr)
#   DEFINE l_last_sw    LIKE type_file.chr1,     #No:FUN-680122 VARCHAR(1),
#          l_azf03      LIKE azf_file.azf03,
#           sr           RECORD code   LIKE type_file.chr1,     #No:FUN-680122 VARCHAR(01),
#                               ima12  LIKE ima_file.ima12,
#                               ima01  LIKE ima_file.ima01,
#                               ima02  LIKE ima_file.ima02,
#                               ima021 LIKE ima_file.ima021,   #FUN-4C0099
#                               tlf02  LIKE tlf_file.tlf02,
#                               tlf021 LIKE tlf_file.tlf021,
#                               tlf03  LIKE tlf_file.tlf03,
#                               tlf031 LIKE tlf_file.tlf031,
#                               tlf06  LIKE tlf_file.tlf06,
#                               tlf026 LIKE tlf_file.tlf026,
#                               tlf027 LIKE tlf_file.tlf027,
#                               tlf036 LIKE tlf_file.tlf036,
#                               tlf037 LIKE tlf_file.tlf037,
#                               tlf01  LIKE tlf_file.tlf01,
#                               tlf10  LIKE tlf_file.tlf10,
#                               tlf21  LIKE tlf_file.tlf21,
#                               tlf13  LIKE tlf_file.tlf13,
#                               tlf62  LIKE tlf_file.tlf62,
#                               tlf907 LIKE tlf_file.tlf907,
#                               amt01  LIKE tlf_file.tlf221,   #材料金額
#                               amt02  LIKE tlf_file.tlf222,   #人工金額
#                               amt03  LIKE tlf_file.tlf2231,  #製造費用
#                               amt04  LIKE tlf_file.tlf2232,  #加工費用
#                              #start FUN-5B0082
#                               amt05  LIKE tlf_file.tlf224,   #其他金額
#                              #amt05  LIKE ccc_file.ccc23     #總金額
#                               amt06  LIKE ccc_file.ccc23     #總金額
#                              #end FUN-5B0082
#                        END RECORD,
#      l_chr        LIKE type_file.chr1          #No.FUN-680122 VARCHAR(1)
#
#  OUTPUT TOP MARGIN g_top_margin LEFT MARGIN g_left_margin BOTTOM MARGIN g_bottom_margin PAGE LENGTH g_page_line
#
#  ORDER BY sr.ima12,sr.code,sr.tlf021,sr.tlf62,sr.tlf01,sr.tlf06  #MOD-680061 tlf031->tlf021
#  FORMAT
#   PAGE HEADER
#      PRINT COLUMN ((g_len-FGL_WIDTH(g_company CLIPPED))/2)+1,g_company CLIPPED
#      PRINT COLUMN ((g_len-FGL_WIDTH(g_x[1]))/2)+1,g_x[1]
#      LET g_pageno=g_pageno+1
#      LET pageno_total=PAGENO USING '<<<','/pageno'
#     #PRINT g_head CLIPPED,pageno_total   #TQC-760141 mark
#      PRINT g_x[11],tm.bdate,'-',tm.edate
#      PRINT g_head CLIPPED,pageno_total   #TQC-760141
#      PRINT g_dash
#      PRINT g_x[31],g_x[32],g_x[33],g_x[34],g_x[35],
#            g_x[36],g_x[37],g_x[38],g_x[39],g_x[40],
#            g_x[41],g_x[42],g_x[43]
#           ,g_x[44]   #FUN-5B0082
#      PRINT g_dash1
#      LET l_last_sw = 'n'
#
#   ON EVERY ROW
#     IF tm.a = 'Y' THEN   #MOD-5A0423 將MARK拿掉
#      PRINT COLUMN g_c[31],sr.tlf021[1,8],                       #倉庫
#            COLUMN g_c[32],sr.tlf06,                           #入庫日
#            COLUMN g_c[33],sr.tlf026,                           #單據編號
#            COLUMN g_c[34],sr.tlf62,                            #工單編號
#            COLUMN g_c[35],sr.tlf01,                            #料號
#             COLUMN g_c[36],sr.ima02 CLIPPED,                    #DESC  #MOD-4A0238
#            COLUMN g_c[37],sr.ima021 CLIPPED,                   #FUN-4C0099
##            COLUMN g_c[38],cl_numfor(sr.tlf10,38,g_ccz.ccz27),           #入庫數 #CHI-690007 0->ccz27
#            COLUMN g_c[39],cl_numfor(sr.amt01,39,g_azi03),     #材料金額      #FUN-570190
#            COLUMN g_c[40],cl_numfor(sr.amt02,40,g_azi03),     #人工金額      #FUN-570190
#            COLUMN g_c[41],cl_numfor(sr.amt03,41,g_azi03),     #製費      #FUN-570190
#            COLUMN g_c[42],cl_numfor(sr.amt04,42,g_azi03),     #加工      #FUN-570190
#           #start FUN-5B0082
#            COLUMN g_c[43],cl_numfor(sr.amt05,43,g_azi03)       #其他金額
#           #COLUMN g_c[43],cl_numfor(sr.amt05,43,g_azi03)       #總金額
#           ,COLUMN g_c[44],cl_numfor(sr.amt06,44,g_azi03)       #總金額
#           #end FUN-5B0082
#     END IF   #MOD-5A0423 將MARK拿掉
#
#       INSERT INTO r771_tmp  VALUES(sr.tlf62,sr.tlf01,
#                                    sr.amt01,sr.amt02,sr.amt03,sr.amt04)
#      #IF SQLCA.sqlcode = -239  THEN             #TQC-790087 mark
#       IF cl_sql_dup_value(SQLCA.SQLCODE) THEN   #TQC-790087
#          UPDATE r771_tmp  SET amt1 = amt1 + sr.amt01,
#                               amt2 = amt2 + sr.amt02,
#                               amt3 = amt3 + sr.amt03,
#                               amt4 = amt4 + sr.amt04
#                              ,amt5 = amt5 + sr.amt05   #FUN-5B0082
#            WHERE wo = sr.tlf62 and part = sr.tlf01
#       END IF
#
#   AFTER GROUP OF sr.code    #Rework/非Rework
#      PRINT COLUMN g_c[37],g_dash2[1,g_w[37]],
#            COLUMN g_c[38],g_dash2[1,g_w[38]],
#            COLUMN g_c[39],g_dash2[1,g_w[39]],
#            COLUMN g_c[40],g_dash2[1,g_w[40]],
#            COLUMN g_c[41],g_dash2[1,g_w[41]],
#            COLUMN g_c[42],g_dash2[1,g_w[42]],
#            COLUMN g_c[43],g_dash2[1,g_w[43]]
#           ,COLUMN g_c[44],g_dash2[1,g_w[44]]   #FUN-5B0082
#
#      IF sr.code != 'R'       #No:MOD-710128 modify
#      THEN PRINT COLUMN g_c[37], g_x[13] CLIPPED;
#      ELSE PRINT COLUMN g_c[37], g_x[14] CLIPPED;
#      END IF
#      PRINT COLUMN g_c[38],cl_numfor(GROUP SUM(sr.tlf10),38,g_ccz.ccz27), #CHI-690007 0->ccz27
#            COLUMN g_c[39],cl_numfor(GROUP SUM(sr.amt01),39,g_azi03),      #FUN-570190
#            COLUMN g_c[40],cl_numfor(GROUP SUM(sr.amt02),40,g_azi03),      #FUN-570190
#            COLUMN g_c[41],cl_numfor(GROUP SUM(sr.amt03),41,g_azi03),      #FUN-570190
#            COLUMN g_c[42],cl_numfor(GROUP SUM(sr.amt04),42,g_azi03),      #FUN-570190
#           #start FUN-5B0082
#            COLUMN g_c[43],cl_numfor(GROUP SUM(sr.amt05),43,g_azi03)
#           #COLUMN g_c[43],cl_numfor(GROUP SUM(sr.amt05),43,g_azi03)     #FUN-570190
#           ,COLUMN g_c[44],cl_numfor(GROUP SUM(sr.amt06),44,g_azi03)
#           #end FUN-5B0082
#      PRINT COLUMN g_c[37],g_dash2[1,g_w[37]],
#            COLUMN g_c[38],g_dash2[1,g_w[38]],
#            COLUMN g_c[39],g_dash2[1,g_w[39]],
#            COLUMN g_c[40],g_dash2[1,g_w[40]],
#            COLUMN g_c[41],g_dash2[1,g_w[41]],
#            COLUMN g_c[42],g_dash2[1,g_w[42]],
#            COLUMN g_c[43],g_dash2[1,g_w[43]]
#           ,COLUMN g_c[44],g_dash2[1,g_w[44]]   #FUN-5B0082
#
#
#   AFTER GROUP OF sr.ima12   #材料/成品小計
#      IF NOT cl_null(sr.ima12) THEN
#         SELECT azf03 INTO l_azf03 FROM azf_file WHERE azf01=sr.ima12 AND azf02='G' #6818
#         IF SQLCA.sqlcode THEN LET l_azf03 = ' ' END IF
#         LET l_azf03=l_azf03[1,8]
#         PRINT COLUMN g_c[37],l_azf03 CLIPPED,g_x[15] CLIPPED;
#      END IF
#      PRINT COLUMN g_c[38],cl_numfor(GROUP SUM(sr.tlf10),38,g_ccz.ccz27), #CHI-690007 0->ccz27
#            COLUMN g_c[39],cl_numfor(GROUP SUM(sr.amt01),39,g_azi03),      #FUN-570190
#            COLUMN g_c[40],cl_numfor(GROUP SUM(sr.amt02),40,g_azi03),      #FUN-570190
#            COLUMN g_c[41],cl_numfor(GROUP SUM(sr.amt03),41,g_azi03),      #FUN-570190
#            COLUMN g_c[42],cl_numfor(GROUP SUM(sr.amt04),42,g_azi03),      #FUN-570190
#           #start FUN-5B0082
#            COLUMN g_c[43],cl_numfor(GROUP SUM(sr.amt05),43,g_azi03)
#           #COLUMN g_c[43],cl_numfor(GROUP SUM(sr.amt05),43,g_azi03)     #FUN-570190
#           ,COLUMN g_c[44],cl_numfor(GROUP SUM(sr.amt06),44,g_azi03)
#           #end FUN-5B0082
#
#      PRINT COLUMN g_c[37],g_dash2[1,g_w[37]],
#            COLUMN g_c[38],g_dash2[1,g_w[38]],
#            COLUMN g_c[39],g_dash2[1,g_w[39]],
#            COLUMN g_c[40],g_dash2[1,g_w[40]],
#            COLUMN g_c[41],g_dash2[1,g_w[41]],
#            COLUMN g_c[42],g_dash2[1,g_w[42]],
#            COLUMN g_c[43],g_dash2[1,g_w[43]]
#           ,COLUMN g_c[44],g_dash2[1,g_w[44]]   #FUN-5B0082
#
#   ON LAST ROW
#      PRINT COLUMN g_c[37],g_x[10] CLIPPED,
#            COLUMN g_c[38],cl_numfor(SUM(sr.tlf10),38,g_ccz.ccz27), #CHI-690007 0->ccz27
#            COLUMN g_c[39],cl_numfor(SUM(sr.amt01),39,g_azi03),      #FUN-570190
#            COLUMN g_c[40],cl_numfor(SUM(sr.amt02),40,g_azi03),      #FUN-570190
#            COLUMN g_c[41],cl_numfor(SUM(sr.amt03),41,g_azi03),      #FUN-570190
#            COLUMN g_c[42],cl_numfor(SUM(sr.amt04),42,g_azi03),      #FUN-570190
#           #start FUN-5B0082
#            COLUMN g_c[43],cl_numfor(SUM(sr.amt05),43,g_azi03)
#           #COLUMN g_c[43],cl_numfor(SUM(sr.amt05),43,g_azi03)     #FUN-570190
#           ,COLUMN g_c[44],cl_numfor(SUM(sr.amt06),44,g_azi03)
#           #end FUN-5B0082
#
#      PRINT g_dash
#      LET l_last_sw = 'y'
#     #PRINT g_x[4],g_x[5] CLIPPED, COLUMN g_c[43], g_x[7] CLIPPED   #FUN-5B0082 mark
#      PRINT g_x[4],g_x[5] CLIPPED, COLUMN (g_len-9), g_x[7] CLIPPED #FUN-5B0082
#
#   PAGE TRAILER
#      IF l_last_sw = 'n'
#         THEN PRINT g_dash
#             #PRINT g_x[4],g_x[5] CLIPPED, COLUMN g_c[43], g_x[6] CLIPPED  #FUN-5B0082 mark
#              PRINT g_x[4],g_x[5] CLIPPED, COLUMN g_c[43], g_x[6] CLIPPED  #FUN-5B0082
#         ELSE SKIP 2 LINE
#      END IF
#
#END REPORT
#No.FUN-810073  --End
