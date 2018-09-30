# Prog. Version..: '5.30.03-12.09.18(00009)'
#
# Pattern name...: ghrr049.4gl
# Descriptions...: 在册人员表
# Date & Author..: 13/08/22   by ye'anping

DATABASE ds

GLOBALS "../../config/top.global"

DEFINE tm  RECORD                # Print condition RECORD         #TQC-BA0010
            wc     STRING,                 #No.TQC-630166 VARCHAR(600) #Where condition
            more   LIKE type_file.chr1     #No.FUN-680121 VARCHAR(1)# Input more condition(Y/N)
           END RECORD
DEFINE g_count     LIKE type_file.num5     #No.FUN-680121 SMALLINT
DEFINE g_i         LIKE type_file.num5     #No.FUN-680121 SMALLINT #count/index for any purpose
DEFINE g_msg       LIKE type_file.chr1000  #No.FUN-680121 VARCHAR(72)
DEFINE g_po_no     LIKE oea_file.oea10     #No.MOD-530401
DEFINE g_ctn_no1,g_ctn_no2   LIKE type_file.chr20         #No.FUN-680121 VARCHAR(20) #MOD-530401
DEFINE g_sql       STRING
DEFINE l_table     STRING
DEFINE g_str       STRING
DEFINE g_hrag    RECORD LIKE hrag_file.*
DEFINE g_hrcp03    LIKE hrcp_file.hrcp03
DEFINE g_hrao00    LIKE hrao_file.hrao00
DEFINE g_hrao10    LIKE type_file.chr1000     #added by yeap NO.130929

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
   LET g_rep_user = ARG_VAL(8)
   LET g_rep_clas = ARG_VAL(9)
   LET g_template = ARG_VAL(10)

   IF (NOT cl_user()) THEN
      EXIT PROGRAM
   END IF

   WHENEVER ERROR CALL cl_err_msg_log

   IF (NOT cl_setup("GHR")) THEN
      EXIT PROGRAM
   END IF

   display "g_pdate  =",g_pdate
   display "g_towhom =",g_towhom
   display "g_rlang  =",g_rlang
   display "g_bgjob  =",g_bgjob
   display "g_prtway =",g_prtway
   display "g_copies =",g_copies
   display "tm.wc    =",tm.wc

   LET g_rpt_name = ARG_VAL(12)  #No.FUN-7C0078

   LET g_sql =
"RN.type_file.num5,",
"HRAO01.hrao_file.hrao01,",
"CL01.hrao_file.hrao02,",
"CL02.hrao_file.hrao02,",
"CL03.hrao_file.hrao02,",
"COL4.hrao_file.hrao02,",
"HRAO011.hrao_file.hrao01,",
"CR01.type_file.num5,",
"CR02.type_file.num5,",
"CR03.type_file.num5,",
"CR04.type_file.num5,",
"CR05.type_file.num5,",
"CR06.type_file.num5,",
"CR07.type_file.num5,",
"CR08.type_file.num5,",
"CR09.type_file.num5,",
"CR10.type_file.num5,",
"CR11.type_file.num5,",
"CR12.type_file.num5,",
"CR13.type_file.num5,",
"CR14.type_file.num5,",
"CR15.type_file.num5,",
"CR16.type_file.num5,",
"CR17.type_file.num5,",
"CR18.type_file.num5,",
"CR29.type_file.num5,",
"CR30.type_file.num5,",
"CR31.type_file.num5,",
"CR19.type_file.num5,",
"CR20.type_file.num5,",
"CR21.type_file.num5,",
"CR22.type_file.num5,",
"CR23.type_file.num5,",
"CR24.type_file.num5,",
"CR25.type_file.num5,",
"CR26.type_file.num5,",
"CR27.type_file.num5,",
"CR28.type_file.num5,",
"ZJ01.type_file.num5,",
"ZJ02.type_file.num5,",
"ZJ03.type_file.num5,",
"ZJ04.type_file.num5,",
"ZJ05.type_file.num5,",
"ZJ06.type_file.num5,",
"ZJ07.type_file.num5,",
"ZJ08.type_file.num5,",
"ZJ09.type_file.num5,",
"ZJ10.type_file.num5,",
"ZJ11.type_file.num5,",
"ZJ12.type_file.num5,",
"ZJ13.type_file.num5,",
"ZJ14.type_file.num5,",
"ZJ15.type_file.num5,",
"ZJ16.type_file.num5,",
"ZJ17.type_file.num5,",
"ZJ18.type_file.num5,",
"ZJ29.type_file.num5,",
"ZJ30.type_file.num5,",
"ZJ31.type_file.num5,",
"ZJ19.type_file.num5,",
"ZJ20.type_file.num5,",
"ZJ21.type_file.num5,",
"ZJ22.type_file.num5,",
"ZJ23.type_file.num5,",
"ZJ24.type_file.num5,",
"ZJ25.type_file.num5,",
"ZJ26.type_file.num5,",
"ZJ27.type_file.num5,",
"ZJ28.type_file.num5,",
"JJ01.type_file.num5,",
"JJ02.type_file.num5,",
"JJ03.type_file.num5,",
"JJ04.type_file.num5,",
"JJ05.type_file.num5,",
"JJ06.type_file.num5,",
"JJ07.type_file.num5,",
"JJ08.type_file.num5,",
"JJ09.type_file.num5,",
"JJ10.type_file.num5,",
"JJ11.type_file.num5,",
"JJ12.type_file.num5,",
"JJ13.type_file.num5,",
"JJ14.type_file.num5,",
"JJ15.type_file.num5,",
"JJ16.type_file.num5,",
"JJ17.type_file.num5,",
"JJ18.type_file.num5,",
"JJ29.type_file.num5,",
"JJ30.type_file.num5,",
"JJ31.type_file.num5,",
"JJ19.type_file.num5,",
"JJ20.type_file.num5,",
"JJ21.type_file.num5,",
"JJ22.type_file.num5,",
"JJ23.type_file.num5,",
"JJ24.type_file.num5,",
"JJ25.type_file.num5,",
"JJ26.type_file.num5,",
"JJ27.type_file.num5,",
"JJ28.type_file.num5,",
"ZW01.type_file.num5,",
"ZW02.type_file.num5,",
"ZW03.type_file.num5,",
"ZW04.type_file.num5,",
"ZW05.type_file.num5,",
"ZW06.type_file.num5,",
"ZW07.type_file.num5,",
"ZW08.type_file.num5,",
"ZW09.type_file.num5,",
"hrcp03.hrcp_file.hrcp03,"


   LET l_table = cl_prt_temptable('ghrr049',g_sql) CLIPPED
   IF l_table = -1 THEN EXIT PROGRAM END IF


   IF STATUS THEN CALL cl_err('create',STATUS,1) EXIT PROGRAM END IF  #yeap

   CALL cl_used(g_prog,g_time,1) RETURNING g_time  #FUN-BB0047 add
   IF cl_null(g_bgjob) OR g_bgjob = 'N' THEN        # If background job sw is off
      CALL ghrr049_tm(0,0)        # Input print condition
   ELSE
      CALL ghrr049()            # Read data and create out-file
   END IF
   CALL cl_used(g_prog,g_time,2) RETURNING g_time #No.FUN-690123
END MAIN

FUNCTION ghrr049_tm(p_row,p_col)
DEFINE lc_qbe_sn      LIKE gbm_file.gbm01         #No.FUN-580031
DEFINE p_row,p_col    LIKE type_file.num5,        #No.FUN-680121 SMALLINT
       l_dir          LIKE type_file.chr1,        #No.FUN-680121 VARCHAR(1)#Direction Flag
       l_cmd          LIKE type_file.chr1000      #No.FUN-680121 VARCHAR(400)
      ,l_hrat03       LIKE hrat_file.hrat03
      ,l_hrcp03       LIKE hrcp_file.hrcp03
      ,l_hraa12       LIKE hraa_file.hraa12
  LET p_row = 6 LET p_col = 20
  OPEN WINDOW ghrr049_w AT p_row,p_col WITH FORM "ghr/42f/ghrr049"
       ATTRIBUTE (STYLE = g_win_style CLIPPED) #No.FUN-580092 HCN
  CALL cl_ui_init()
  CALL cl_opmsg('p')

  INITIALIZE tm.* TO NULL            # Default condition

  LET tm.more = 'N'
  LET g_pdate = g_today
  LET g_rlang = g_lang
  LET g_bgjob = 'N'
  LET g_copies = '1'

  WHILE TRUE
    CONSTRUCT BY NAME tm.wc ON hrat03,hrat04,hrcp03

       BEFORE CONSTRUCT
          CALL cl_qbe_init()
       DISPLAY g_today TO FORMONLY.hrcp03

#       AFTER FIELD hrat03
#          LET l_hrat03 = GET_FLDBUF(hrat03)
#          IF cl_null(l_hrat03) THEN
#          	 NEXT FIELD hrat03
#          ELSE
#          	 LET g_hrao00 = l_hrat03
#          	 LET l_hrcp03 = GET_FLDBUF(hrcp03)
#              IF cl_null(l_hrcp03) THEN
#          	     NEXT FIELD hrcp03
#          	  ELSE
#          	     LET g_hrcp03 = l_hrcp03
#              END IF
#          END IF

       AFTER FIELD hrcp03
          LET l_hrcp03 = GET_FLDBUF(hrcp03)
          IF cl_null(l_hrcp03) THEN
          	 NEXT FIELD hrcp03
          ELSE
          	 LET g_hrcp03 = l_hrcp03
          END IF

#       AFTER FIELD hrat04
#         LET g_hrao10 = GET_FLDBUF(hrat04)
#         LET l_hrcp03 = GET_FLDBUF(hrcp03)
#          IF cl_null(l_hrcp03) THEN
#          	 NEXT FIELD hrcp03
#          ELSE
#          	 LET g_hrcp03 = l_hrcp03
#          END IF

       ON ACTION controlp
          CASE
              WHEN INFIELD(hrat03)
                 CALL cl_init_qry_var()
                 LET g_qryparam.form = "q_hraa01"
                 CALL cl_create_qry() RETURNING g_qryparam.multiret
                 DISPLAY g_qryparam.multiret TO hrat03
                 NEXT FIELD hrat03

             WHEN INFIELD(hrat04)
               CALL cl_init_qry_var()
               LET g_qryparam.form = "q_hrao01"
               LET g_qryparam.arg1 = l_hrat03
               LET g_qryparam.state = "c"  #added by yeap NO.130929
               CALL cl_create_qry() RETURNING g_qryparam.multiret
               DISPLAY g_qryparam.multiret TO hrat04
               NEXT FIELD hrat04
              OTHERWISE
                 EXIT CASE
           END CASE

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
    DISPLAY BY NAME tm.more
    INPUT BY NAME tm.more WITHOUT DEFAULTS

       BEFORE INPUT
          CALL cl_qbe_display_condition(lc_qbe_sn)

       AFTER FIELD more
          IF tm.more = 'Y' THEN
             CALL cl_repcon(0,0,g_pdate,g_towhom,g_rlang,
                            g_bgjob,g_time,g_prtway,g_copies)
                  RETURNING g_pdate,g_towhom,g_rlang,
                            g_bgjob,g_time,g_prtway,g_copies
          END IF

       ON ACTION CONTROLR
          CALL cl_show_req_fields()

       ON ACTION CONTROLG
          CALL cl_cmdask()    # Command execution

       ON IDLE g_idle_seconds
          CALL cl_on_idle()
          CONTINUE INPUT

       ON ACTION exit
          LET INT_FLAG = 1
          EXIT INPUT

       #No.FUN-580031 --start--
       ON ACTION qbe_save
          CALL cl_qbe_save()
       #No.FUN-580031 ---end---

    END INPUT

    IF INT_FLAG THEN
       LET INT_FLAG = 0
       EXIT WHILE
    END IF

    IF g_bgjob = 'Y' THEN
       SELECT zz08 INTO l_cmd FROM zz_file    #get exec cmd (fglgo xxxx)
              WHERE zz01='ghrr049'
       IF SQLCA.sqlcode OR l_cmd IS NULL THEN
          CALL cl_err('ghrr049','9031',1)
       ELSE
          LET tm.wc=cl_replace_str(tm.wc, "'", "\"")      #"
          LET l_cmd = l_cmd CLIPPED,        #(at time fglgo xxxx p1 p2 p3)
                          " '",g_pdate CLIPPED,"'",
                          " '",g_towhom CLIPPED,"'",
                          #" '",g_lang CLIPPED,"'", #No.FUN-7C0078
                         " '",g_rlang CLIPPED,"'", #No.FUN-7C0078
                          " '",g_bgjob CLIPPED,"'",
                          " '",g_prtway CLIPPED,"'",
                          " '",g_copies CLIPPED,"'",
                          " '",tm.wc CLIPPED,"'",               #FUN-750047 add
                       #   " '",g_argv1 CLIPPED,"'",
                       #   " '",g_argv2 CLIPPED,"'"
                         " '",g_rep_user CLIPPED,"'",           #No.FUN-570264
                         " '",g_rep_clas CLIPPED,"'",           #No.FUN-570264
                         " '",g_template CLIPPED,"'",           #No.FUN-570264
                         " '",g_rpt_name CLIPPED,"'"            #No.FUN-7C0078
          CALL cl_cmdat('ghrr049',g_time,l_cmd)    # Execute cmd at later time
       END IF
       CLOSE WINDOW ghrr049_w
       CALL cl_used(g_prog,g_time,2) RETURNING g_time #No.FUN-690123
       EXIT PROGRAM
    END IF

    CALL cl_wait()
    CALL ghrr049()
    ERROR ""
  END WHILE

  CLOSE WINDOW ghrr049_w
END FUNCTION

FUNCTION ghrr049()
   DEFINE l_name    LIKE type_file.chr20,             #No.FUN-680121 VARCHAR(20)# External(Disk) file name
          l_sql     STRING,                           # RDSQL STATEMENT   TQC-630166
          l_chr     LIKE type_file.chr1,              #No.FUN-680121 VARCHAR(1)
          l_za05    LIKE type_file.chr1000,           #No.FUN-680121 VARCHAR(40)
          l_sfb02doc LIKE type_file.chr30,            #No:TQC-A60097 add
          sr        RECORD
                RN      LIKE  type_file.num5,
                HRAO01  LIKE  hrao_file.hrao01,
                CL01    LIKE  hrao_file.hrao02,
                CL02    LIKE  hrao_file.hrao02,
                CL03    LIKE  hrao_file.hrao02,
                COL4    LIKE  hrao_file.hrao02,
                HRAO011 LIKE  hrao_file.hrao01,
                CR01    LIKE  type_file.num5,
                CR02    LIKE  type_file.num5,
                CR03    LIKE  type_file.num5,
                CR04    LIKE  type_file.num5,
                CR05    LIKE  type_file.num5,
                CR06    LIKE  type_file.num5,
                CR07    LIKE  type_file.num5,
                CR08    LIKE  type_file.num5,
                CR09    LIKE  type_file.num5,
                CR10    LIKE  type_file.num5,
                CR11    LIKE  type_file.num5,
                CR12    LIKE  type_file.num5,
                CR13    LIKE  type_file.num5,
                CR14    LIKE  type_file.num5,
                CR15    LIKE  type_file.num5,
                CR16    LIKE  type_file.num5,
                CR17    LIKE  type_file.num5,
                CR18    LIKE  type_file.num5,
                CR29    LIKE  type_file.num5,
                CR30    LIKE  type_file.num5,
                CR31    LIKE  type_file.num5,
                CR19    LIKE  type_file.num5,
                CR20    LIKE  type_file.num5,
                CR21    LIKE  type_file.num5,
                CR22    LIKE  type_file.num5,
                CR23    LIKE  type_file.num5,
                CR24    LIKE  type_file.num5,
                CR25    LIKE  type_file.num5,
                CR26    LIKE  type_file.num5,
                CR27    LIKE  type_file.num5,
                CR28    LIKE  type_file.num5,
                ZJ01    LIKE  type_file.num5,
                ZJ02    LIKE  type_file.num5,
                ZJ03    LIKE  type_file.num5,
                ZJ04    LIKE  type_file.num5,
                ZJ05    LIKE  type_file.num5,
                ZJ06    LIKE  type_file.num5,
                ZJ07    LIKE  type_file.num5,
                ZJ08    LIKE  type_file.num5,
                ZJ09    LIKE  type_file.num5,
                ZJ10    LIKE  type_file.num5,
                ZJ11    LIKE  type_file.num5,
                ZJ12    LIKE  type_file.num5,
                ZJ13    LIKE  type_file.num5,
                ZJ14    LIKE  type_file.num5,
                ZJ15    LIKE  type_file.num5,
                ZJ16    LIKE  type_file.num5,
                ZJ17    LIKE  type_file.num5,
                ZJ18    LIKE  type_file.num5,
                ZJ29    LIKE  type_file.num5,
                ZJ30    LIKE  type_file.num5,
                ZJ31    LIKE  type_file.num5,
                ZJ19    LIKE  type_file.num5,
                ZJ20    LIKE  type_file.num5,
                ZJ21    LIKE  type_file.num5,
                ZJ22    LIKE  type_file.num5,
                ZJ23    LIKE  type_file.num5,
                ZJ24    LIKE  type_file.num5,
                ZJ25    LIKE  type_file.num5,
                ZJ26    LIKE  type_file.num5,
                ZJ27    LIKE  type_file.num5,
                ZJ28    LIKE  type_file.num5,
                JJ01    LIKE  type_file.num5,
                JJ02    LIKE  type_file.num5,
                JJ03    LIKE  type_file.num5,
                JJ04    LIKE  type_file.num5,
                JJ05    LIKE  type_file.num5,
                JJ06    LIKE  type_file.num5,
                JJ07    LIKE  type_file.num5,
                JJ08    LIKE  type_file.num5,
                JJ09    LIKE  type_file.num5,
                JJ10    LIKE  type_file.num5,
                JJ11    LIKE  type_file.num5,
                JJ12    LIKE  type_file.num5,
                JJ13    LIKE  type_file.num5,
                JJ14    LIKE  type_file.num5,
                JJ15    LIKE  type_file.num5,
                JJ16    LIKE  type_file.num5,
                JJ17    LIKE  type_file.num5,
                JJ18    LIKE  type_file.num5,
                JJ29    LIKE  type_file.num5,
                JJ30    LIKE  type_file.num5,
                JJ31    LIKE  type_file.num5,
                JJ19    LIKE  type_file.num5,
                JJ20    LIKE  type_file.num5,
                JJ21    LIKE  type_file.num5,
                JJ22    LIKE  type_file.num5,
                JJ23    LIKE  type_file.num5,
                JJ24    LIKE  type_file.num5,
                JJ25    LIKE  type_file.num5,
                JJ26    LIKE  type_file.num5,
                JJ27    LIKE  type_file.num5,
                JJ28    LIKE  type_file.num5,
                ZW01    LIKE  type_file.num5,
                ZW02    LIKE  type_file.num5,
                ZW03    LIKE  type_file.num5,
                ZW04    LIKE  type_file.num5,
                ZW05    LIKE  type_file.num5,
                ZW06    LIKE  type_file.num5,
                ZW07    LIKE  type_file.num5,
                ZW08    LIKE  type_file.num5,
                ZW09    LIKE  type_file.num5
                    END RECORD,
       sr1           RECORD
                     hrao00      LIKE hrao_file.hrao00,
                     hrao01      LIKE hrao_file.hrao01
                    END RECORD


   DEFINE l_hraa12  LIKE hraa_file.hraa12,
          l_hrao02  LIKE hrao_file.hrao02,
          l_hrbb00  LIKE hrbb_file.hrbb00
   DEFINE l_fdm,l_fdf,l_fim,l_fif LIKE type_file.num5  #foreign,direct/indirect,male/female
   DEFINE l_ldfm,l_ldff,l_ldpm,l_ldpf,l_lifm,l_liff,l_lipm,l_lipf LIKE type_file.num5  #local,direct/indirect,formal/probation,male/female
   DEFINE l_n   LIKE type_file.num5

   DEFINE  l_img_blob    LIKE type_file.blob
   DEFINE  l_abnormal    LIKE type_file.num5
   DEFINE  l_chidao      LIKE type_file.num5
   DEFINE  l_zaotui      LIKE type_file.num5
   DEFINE  l_kuanggong   LIKE type_file.num5
   DEFINE  l_qingjia     LIKE type_file.num5
   DEFINE  l_chuchai     LIKE type_file.num5
   DEFINE  l_nianjia     LIKE type_file.num5
   DEFINE  l_teshujia    LIKE type_file.num5
   DEFINE  l_tiaoxiujia  LIKE type_file.num5



   ## *** 與 Crystal Reports 串聯段 - <<<< 清除暫存資料 >>>> CR11 *** ##
   SELECT zo02 INTO g_company FROM zo_file WHERE zo01 = g_rlang
   SELECT zz05 INTO g_zz05 FROM zz_file WHERE zz01 = g_prog

   CALL cl_del_data(l_table)

   LET l_sql = "INSERT INTO ",g_cr_db_str CLIPPED,l_table CLIPPED,
               " VALUES(?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?,
                        ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?,
                        ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?,
                        ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?,
                        ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?,
                        ?,?,?,?,?, ?,?,?,?,?) "
   PREPARE insert_prep FROM l_sql
   IF STATUS THEN
      CALL cl_err("insert_prep:",STATUS,1) EXIT PROGRAM
   END IF


   LOCATE l_img_blob IN MEMORY #blob初始化 #No.FUN-940042
   #------------------------------ CR (2) ------------------------------#

   LET tm.wc = tm.wc CLIPPED,cl_get_extra_cond('hratuser', 'hratgrup')
   LET tm.wc = cl_replace_str(tm.wc,"hrcp03=","")
      LET l_sql = "
SELECT ROW_NUMBER() OVER(ORDER BY tb.col4,tb.hrao01) RN ,tb.*,ta.* FROM (
  SELECT hrao01 hrao011,
  SUM(CASE WHEN hrat20 = 'A' AND hrar02 = '001' AND hrat17 = '001' THEN 1 ELSE 0 END) CR01,
  SUM(CASE WHEN hrat20 = 'A' AND hrar02 = '001' AND hrat17 = '002' THEN 1 ELSE 0 END) CR02,
  SUM(CASE WHEN hrat20 = 'A' AND hrar02 = '001' THEN 1 ELSE 0 END) CR03,
  SUM(CASE WHEN hrat20 = 'A' AND hrar02 = '002' AND hrat17 = '001' THEN 1 ELSE 0 END) CR04,
  SUM(CASE WHEN hrat20 = 'A' AND hrar02 = '002' AND hrat17 = '002' THEN 1 ELSE 0 END) CR05,
  SUM(CASE WHEN hrat20 = 'A' AND hrar02 = '002' THEN 1 ELSE 0 END) CR06,
  SUM(CASE WHEN hrat20 = 'A' AND hrar02 = '003' AND hrat17 = '001' THEN 1 ELSE 0 END) CR07,
  SUM(CASE WHEN hrat20 = 'A' AND hrar02 = '003' AND hrat17 = '002' THEN 1 ELSE 0 END) CR08,
  SUM(CASE WHEN hrat20 = 'A' AND hrar02 = '003' THEN 1 ELSE 0 END) CR09,
  SUM(CASE WHEN hrat20 = 'A' AND hrat17 = '001' THEN 1 ELSE 0 END) CR10,
  SUM(CASE WHEN hrat20 = 'A' AND hrat17 = '002' THEN 1 ELSE 0 END) CR11,
  SUM(CASE WHEN hrat20 = 'A' THEN 1 ELSE 0 END) CR12,
  SUM(CASE WHEN hrat20 = 'B' AND hrat17 = '001' THEN 1 ELSE 0 END) CR13,
  SUM(CASE WHEN hrat20 = 'B' AND hrat17 = '002' THEN 1 ELSE 0 END) CR14,
  SUM(CASE WHEN hrat20 = 'B' THEN 1 ELSE 0 END) CR15,
  SUM(CASE WHEN hrat20 = 'C' AND hrat17 = '001' THEN 1 ELSE 0 END) CR16,
  SUM(CASE WHEN hrat20 = 'C' AND hrat17 = '002' THEN 1 ELSE 0 END) CR17,
  SUM(CASE WHEN hrat20 = 'C' THEN 1 ELSE 0 END) CR18,
  SUM(CASE WHEN hrat20 = 'G' AND hrat17 = '001' THEN 1 ELSE 0 END) CR29,
  SUM(CASE WHEN hrat20 = 'G' AND hrat17 = '002' THEN 1 ELSE 0 END) CR30,
  SUM(CASE WHEN hrat20 = 'G' THEN 1 ELSE 0 END) CR31,
  SUM(CASE WHEN (hrat20 = 'C' OR hrat20 = 'B') AND hrat17 = '001' THEN 1 ELSE 0 END) CR19,
  SUM(CASE WHEN (hrat20 = 'C' OR hrat20 = 'B') AND hrat17 = '002' THEN 1 ELSE 0 END) CR20,
  SUM(CASE WHEN hrat20 = 'C' OR hrat20 = 'B' THEN 1 ELSE 0 END) CR21,
  SUM(CASE WHEN hrat20 = 'D' OR hrat20 = 'F' THEN 1 ELSE 0 END) CR22,
  SUM(CASE WHEN hrat20 = 'E' AND hrat17 = '001' THEN 1 ELSE 0 END) CR23,
  SUM(CASE WHEN hrat20 = 'E' AND hrat17 = '002' THEN 1 ELSE 0 END) CR24,
  SUM(CASE WHEN hrat20 = 'E' THEN 1 ELSE 0 END) CR25,
  SUM(CASE WHEN hrat17 = '001' THEN 1 ELSE 0 END) CR26,
  SUM(CASE WHEN hrat17 = '002' THEN 1 ELSE 0 END) CR27,
  COUNT(*) CR28,

  SUM(CASE WHEN hrao13 like 'B%' AND hrat20 = 'A' AND hrar02 = '001' AND hrat17 = '001' THEN 1 ELSE 0 END) ZJ01,
  SUM(CASE WHEN hrao13 like 'B%' AND hrat20 = 'A' AND hrar02 = '001' AND hrat17 = '002' THEN 1 ELSE 0 END) ZJ02,
  SUM(CASE WHEN hrao13 like 'B%' AND hrat20 = 'A' AND hrar02 = '001' THEN 1 ELSE 0 END) ZJ03,
  SUM(CASE WHEN hrao13 like 'B%' AND hrat20 = 'A' AND hrar02 = '002' AND hrat17 = '001' THEN 1 ELSE 0 END) ZJ04,
  SUM(CASE WHEN hrao13 like 'B%' AND hrat20 = 'A' AND hrar02 = '002' AND hrat17 = '002' THEN 1 ELSE 0 END) ZJ05,
  SUM(CASE WHEN hrao13 like 'B%' AND hrat20 = 'A' AND hrar02 = '002' THEN 1 ELSE 0 END) ZJ06,
  SUM(CASE WHEN hrao13 like 'B%' AND hrat20 = 'A' AND hrar02 = '003' AND hrat17 = '001' THEN 1 ELSE 0 END) ZJ07,
  SUM(CASE WHEN hrao13 like 'B%' AND hrat20 = 'A' AND hrar02 = '003' AND hrat17 = '002' THEN 1 ELSE 0 END) ZJ08,
  SUM(CASE WHEN hrao13 like 'B%' AND hrat20 = 'A' AND hrar02 = '003' THEN 1 ELSE 0 END) ZJ09,
  SUM(CASE WHEN hrao13 like 'B%' AND hrat20 = 'A' AND hrat17 = '001' THEN 1 ELSE 0 END) ZJ10,
  SUM(CASE WHEN hrao13 like 'B%' AND hrat20 = 'A' AND hrat17 = '002' THEN 1 ELSE 0 END) ZJ11,
  SUM(CASE WHEN hrao13 like 'B%' AND hrat20 = 'A' THEN 1 ELSE 0 END) ZJ12,
  SUM(CASE WHEN hrao13 like 'B%' AND hrat20 = 'B' AND hrat17 = '001' THEN 1 ELSE 0 END) ZJ13,
  SUM(CASE WHEN hrao13 like 'B%' AND hrat20 = 'B' AND hrat17 = '002' THEN 1 ELSE 0 END) ZJ14,
  SUM(CASE WHEN hrao13 like 'B%' AND hrat20 = 'B' THEN 1 ELSE 0 END) ZJ15,
  SUM(CASE WHEN hrao13 like 'B%' AND hrat20 = 'C' AND hrat17 = '001' THEN 1 ELSE 0 END) ZJ16,
  SUM(CASE WHEN hrao13 like 'B%' AND hrat20 = 'C' AND hrat17 = '002' THEN 1 ELSE 0 END) ZJ17,
  SUM(CASE WHEN hrao13 like 'B%' AND hrat20 = 'C' THEN 1 ELSE 0 END) ZJ18,
  SUM(CASE WHEN hrao13 like 'B%' AND hrat20 = 'G' AND hrat17 = '001' THEN 1 ELSE 0 END) ZJ29,
  SUM(CASE WHEN hrao13 like 'B%' AND hrat20 = 'G' AND hrat17 = '002' THEN 1 ELSE 0 END) ZJ30,
  SUM(CASE WHEN hrao13 like 'B%' AND hrat20 = 'G' THEN 1 ELSE 0 END) ZJ31,
  SUM(CASE WHEN hrao13 like 'B%' AND (hrat20 = 'C' OR hrat20 = 'B') AND hrat17 = '001' THEN 1 ELSE 0 END) ZJ19,
  SUM(CASE WHEN hrao13 like 'B%' AND (hrat20 = 'C' OR hrat20 = 'B') AND hrat17 = '002' THEN 1 ELSE 0 END) ZJ20,
  SUM(CASE WHEN hrao13 like 'B%' AND (hrat20 = 'C' OR hrat20 = 'B') THEN 1 ELSE 0 END) ZJ21,
  SUM(CASE WHEN hrao13 like 'B%' AND (hrat20 = 'D' OR hrat20 = 'F') THEN 1 ELSE 0 END) ZJ22,
  SUM(CASE WHEN hrao13 like 'B%' AND hrat20 = 'E' AND hrat17 = '001' THEN 1 ELSE 0 END) ZJ23,
  SUM(CASE WHEN hrao13 like 'B%' AND hrat20 = 'E' AND hrat17 = '002' THEN 1 ELSE 0 END) ZJ24,
  SUM(CASE WHEN hrao13 like 'B%' AND hrat20 = 'E' THEN 1 ELSE 0 END) ZJ25,
  SUM(CASE WHEN hrao13 like 'B%' AND hrat17 = '001' THEN 1 ELSE 0 END) ZJ26,
  SUM(CASE WHEN hrao13 like 'B%' AND hrat17 = '002' THEN 1 ELSE 0 END) ZJ27,
  SUM(CASE WHEN hrao13 like 'B%' THEN 1 ELSE 0 END) ZJ28,
  SUM(CASE WHEN hrao13 like 'C%' AND hrat20 = 'A' AND hrar02 = '001' AND hrat17 = '001' THEN 1 ELSE 0 END)  JJ01,
  SUM(CASE WHEN hrao13 like 'C%' AND hrat20 = 'A' AND hrar02 = '001' AND hrat17 = '002' THEN 1 ELSE 0 END)  JJ02,
  SUM(CASE WHEN hrao13 like 'C%' AND hrat20 = 'A' AND hrar02 = '001' THEN 1 ELSE 0 END)  JJ03,
  SUM(CASE WHEN hrao13 like 'C%' AND hrat20 = 'A' AND hrar02 = '002' AND hrat17 = '001' THEN 1 ELSE 0 END)  JJ04,
  SUM(CASE WHEN hrao13 like 'C%' AND hrat20 = 'A' AND hrar02 = '002' AND hrat17 = '002' THEN 1 ELSE 0 END)  JJ05,
  SUM(CASE WHEN hrao13 like 'C%' AND hrat20 = 'A' AND hrar02 = '002' THEN 1 ELSE 0 END)  JJ06,
  SUM(CASE WHEN hrao13 like 'C%' AND hrat20 = 'A' AND hrar02 = '003' AND hrat17 = '001' THEN 1 ELSE 0 END)  JJ07,
  SUM(CASE WHEN hrao13 like 'C%' AND hrat20 = 'A' AND hrar02 = '003' AND hrat17 = '002' THEN 1 ELSE 0 END)  JJ08,
  SUM(CASE WHEN hrao13 like 'C%' AND hrat20 = 'A' AND hrar02 = '003' THEN 1 ELSE 0 END)  JJ09,
  SUM(CASE WHEN hrao13 like 'C%' AND hrat20 = 'A' AND hrat17 = '001' THEN 1 ELSE 0 END)  JJ10,
  SUM(CASE WHEN hrao13 like 'C%' AND hrat20 = 'A' AND hrat17 = '002' THEN 1 ELSE 0 END)  JJ11,
  SUM(CASE WHEN hrao13 like 'C%' AND hrat20 = 'A' THEN 1 ELSE 0 END)  JJ12,
  SUM(CASE WHEN hrao13 like 'C%' AND hrat20 = 'B' AND hrat17 = '001' THEN 1 ELSE 0 END)  JJ13,
  SUM(CASE WHEN hrao13 like 'C%' AND hrat20 = 'B' AND hrat17 = '002' THEN 1 ELSE 0 END)  JJ14,
  SUM(CASE WHEN hrao13 like 'C%' AND hrat20 = 'B' THEN 1 ELSE 0 END)  JJ15,
  SUM(CASE WHEN hrao13 like 'C%' AND hrat20 = 'C' AND hrat17 = '001' THEN 1 ELSE 0 END)  JJ16,
  SUM(CASE WHEN hrao13 like 'C%' AND hrat20 = 'C' AND hrat17 = '002' THEN 1 ELSE 0 END)  JJ17,
  SUM(CASE WHEN hrao13 like 'C%' AND hrat20 = 'C' THEN 1 ELSE 0 END)  JJ18,
  SUM(CASE WHEN hrao13 like 'C%' AND hrat20 = 'G' AND hrat17 = '001' THEN 1 ELSE 0 END)  JJ29,
  SUM(CASE WHEN hrao13 like 'C%' AND hrat20 = 'G' AND hrat17 = '002' THEN 1 ELSE 0 END)  JJ30,
  SUM(CASE WHEN hrao13 like 'C%' AND hrat20 = 'G' THEN 1 ELSE 0 END)  JJ31,
  SUM(CASE WHEN hrao13 like 'C%' AND (hrat20 = 'C' OR hrat20 = 'B') AND hrat17 = '001' THEN 1 ELSE 0 END)  JJ19,
  SUM(CASE WHEN hrao13 like 'C%' AND (hrat20 = 'C' OR hrat20 = 'B') AND hrat17 = '002' THEN 1 ELSE 0 END)  JJ20,
  SUM(CASE WHEN hrao13 like 'C%' AND (hrat20 = 'C' OR hrat20 = 'B') THEN 1 ELSE 0 END)  JJ21,
  SUM(CASE WHEN hrao13 like 'C%' AND (hrat20 = 'D' OR hrat20 = 'F') THEN 1 ELSE 0 END)  JJ22,
  SUM(CASE WHEN hrao13 like 'C%' AND hrat20 = 'E' AND hrat17 = '001' THEN 1 ELSE 0 END)  JJ23,
  SUM(CASE WHEN hrao13 like 'C%' AND hrat20 = 'E' AND hrat17 = '002' THEN 1 ELSE 0 END)  JJ24,
  SUM(CASE WHEN hrao13 like 'C%' AND hrat20 = 'E' THEN 1 ELSE 0 END)  JJ25,
  SUM(CASE WHEN hrao13 like 'C%' AND hrat17 = '001' THEN 1 ELSE 0 END)  JJ26,
  SUM(CASE WHEN hrao13 like 'C%' AND hrat17 = '002' THEN 1 ELSE 0 END)  JJ27,
  SUM(CASE WHEN hrao13 like 'C%' THEN 1 ELSE 0 END)  JJ28,
  SUM(CASE WHEN hras03='1001' THEN 1 ELSE 0 END) ZW01,
  SUM(CASE WHEN hras03='1002' THEN 1 ELSE 0 END) ZW02,
  SUM(CASE WHEN hras03='1003' OR hras01='1004' THEN 1 ELSE 0 END) ZW03,
  SUM(CASE WHEN hras03='1005' THEN 1 ELSE 0 END) ZW04,
  SUM(CASE WHEN hras03='1007' THEN 1 ELSE 0 END) ZW05,
  SUM(CASE WHEN hras03='1008' OR hras01='1014' THEN 1 ELSE 0 END) ZW06,
  SUM(CASE WHEN hras03='1006' THEN 1 ELSE 0 END) ZW07,
  SUM(CASE WHEN hras03='1004' THEN 1 ELSE 0 END) ZW08,
  SUM(CASE WHEN hras03 IN ('1001','1010','1002','1003','1004','1005','1006','1007','1008') THEN 1 ELSE 0 END) ZW09


  FROM hrat_file
    LEFT JOIN hrao_file ON hrao01=hrat04
    LEFT JOIN hrad_file ON hrad02=hrat19
    LEFT JOIN hras_file ON hras01=hrat05
    LEFT JOIN hrar_file ON hras03=hrar03
    WHERE ",tm.wc," BETWEEN hrat25 AND hrat77
    GROUP BY hrao01)ta
    LEFT JOIN (
    SELECT a.hrao01,CASE WHEN b.hrao01 ='01' OR b.hrao01='03' OR b.hrao01='09' THEN a.hrao02||to_char(N'直属') ELSE a.hrao02 END cl01,
    CASE WHEN b.hrao01 ='01' OR b.hrao01='03' OR b.hrao01='09' THEN a.hrao01 ELSE a.hrao06 END cl02,
    CASE WHEN b.hrao01='01' OR b.hrao01='03' OR b.hrao01='09' THEN a.hrao02 ELSE b.hrao02 END cl03,
    CASE WHEN a.hrao13 like 'A%' THEN N'管理部门' ELSE N'生产部门' END col4
    FROM hrao_file a
    LEFT JOIN hrao_file b ON b.hrao01=a.hrao06) tb ON ta.hrao011 = tb.hrao01
      "
    PREPARE ghrr049_p FROM l_sql
    IF SQLCA.sqlcode != 0 THEN
      CALL cl_err('ghrr049_p:',SQLCA.sqlcode,1)
      CALL cl_used(g_prog,g_time,2) RETURNING g_time #No.FUN-690123
      EXIT PROGRAM
    END IF
    DECLARE ghrr049_curs CURSOR FOR ghrr049_p

    FOREACH ghrr049_curs INTO sr.*
      IF SQLCA.sqlcode != 0 THEN
        CALL cl_err('foreach:',SQLCA.sqlcode,1)
        EXIT FOREACH
      END IF
      # add by lixwz180522 s---
      IF sr.CL01='管理部' THEN
        LET sr.CL03 = ''
        LET sr.Cl02='3002.5'
      END IF
      IF sr.CL01= '内部统治室直属' THEN
        LET sr.CL03=''
        LET sr.CL01 = '内部统治室'
      END IF

      # add by lixwz180522 e---
      EXECUTE insert_prep USING sr.*,g_hrcp03
    END FOREACH

    LET g_str=''
    LET l_sql="SELECT * FROM ",g_cr_db_str CLIPPED,l_table CLIPPED
              ," WHERE cl03 <> '生产系' OR cl03 is null "# add by lixwz180515
    CALL cl_prt_cs3('ghrr049','ghrr049',l_sql,g_str)

END FUNCTION
