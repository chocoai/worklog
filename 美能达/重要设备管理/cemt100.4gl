# Prog. Version..: '5.25.02-11.03.23(00010)'     #
#
# Pattern name...: cemt100.4gl
# Descriptions...: 重要设备维保记录作业
# Date & Author..: 18/07/27 By lixwz


DATABASE ds

GLOBALS "../../..//tiptop/config/top.global"

DEFINE
    g_tc_fib               RECORD LIKE tc_fib_file.*,
    g_tc_fib_t             RECORD LIKE tc_fib_file.*,
    g_tc_fib_o             RECORD LIKE tc_fib_file.*,
    g_tc_fib01_t           LIKE tc_fib_file.tc_fib01,
    g_b1                LIKE type_file.chr20,           #No.FUN-680070 VARCHAR(15)
    g_d1                LIKE type_file.chr20,           #No.FUN-680070 VARCHAR(15)
    g_wc,g_sql          string  #No.FUN-580092 HCN
DEFINE g_tc_fib_1   DYNAMIC ARRAY OF RECORD
            tc_fib01 LIKE tc_fib_file.tc_fib01,
            tc_fib02 LIKE tc_fib_file.tc_fib02,
            tc_fib03 LIKE tc_fib_file.tc_fib03,
            tc_fib04 LIKE tc_fib_file.tc_fib04,
            tc_fib05 LIKE tc_fib_file.tc_fib05,
            tc_fib06 LIKE tc_fib_file.tc_fib06,
            tc_fib07 LIKE tc_fib_file.tc_fib07,
            tc_fib08 LIKE tc_fib_file.tc_fib08,
            tc_fib09 LIKE tc_fib_file.tc_fib09,
            tc_fib10 LIKE tc_fib_file.tc_fib10,
            tc_fib11 LIKE tc_fib_file.tc_fib11,
            tc_fib12 LIKE tc_fib_file.tc_fib12,
            tc_fib13 LIKE type_file.chr30,
            tc_fib15 LIKE tc_fib_file.tc_fib15,
            tc_fib16 LIKE tc_fib_file.tc_fib16,
            tc_fib17 LIKE tc_fib_file.tc_fib17,
            tc_fib18 LIKE tc_fib_file.tc_fib18,
            tc_fib19 LIKE tc_fib_file.tc_fib19
                    END RECORD
DEFINE g_forupd_sql STRING   #SELECT ... FOR UPDATE SQL
DEFINE g_before_input_done   STRING
DEFINE   g_chr           LIKE type_file.chr1         #No.FUN-680070 VARCHAR(1)
DEFINE   g_cnt           LIKE type_file.num10        #No.FUN-680070 INTEGER
DEFINE   g_i             LIKE type_file.num5     #count/index for any purpose       #No.FUN-680070 SMALLINT
DEFINE   g_msg           LIKE type_file.chr1000      #No.FUN-680070 VARCHAR(72)
DEFINE   g_row_count    LIKE type_file.num10        #No.FUN-680070 INTEGER
DEFINE   g_curs_index   LIKE type_file.num10        #No.FUN-680070 INTEGER
DEFINE   g_jump         LIKE type_file.num10        #No.FUN-680070 INTEGER
DEFINE   g_no_ask      LIKE type_file.num5         #No.FUN-680070 SMALLINT
DEFINE   g_str          STRING                      #No.FUN-770005
DEFINE g_argv1     LIKE tc_fib_file.tc_fib01     #FUN-7C0050
DEFINE g_argv2     STRING                  #FUN-7C0050      #執行功能
DEFINE g_bp_flag   LIKE type_file.chr30
DEFINE l_ac1       LIKE type_file.num5
DEFINE mi_no_ask   LIKE type_file.chr1
DEFINE g_rec_b1    LIKE type_file.num5
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

    INITIALIZE g_tc_fib.* TO NULL
    INITIALIZE g_tc_fib_t.* TO NULL
    INITIALIZE g_tc_fib_o.* TO NULL

    LET g_forupd_sql = "SELECT * FROM tc_fib_file WHERE tc_fib01 = ? FOR UPDATE"

    LET g_forupd_sql = cl_forupd_sql(g_forupd_sql)
    DECLARE t100_cl CURSOR  FROM g_forupd_sql              # LOCK CURSOR

    OPEN WINDOW t100_w WITH FORM "cem/42f/cemt100"
       ATTRIBUTE (STYLE = g_win_style CLIPPED)
    CALL cl_ui_init()



    LET g_action_choice=""
    CALL t100_menu()

    CLOSE WINDOW t100_w
    CALL cl_used(g_prog,g_time,2) RETURNING g_time
END MAIN

FUNCTION t100_cs()
    CLEAR FORM
   INITIALIZE g_tc_fib.* TO NULL


    CONSTRUCT BY NAME g_wc ON                    # 螢幕上取條件
        tc_fib01,tc_fib02,tc_fib03,tc_fib04,tc_fib05,tc_fib06,tc_fib07,tc_fib08,tc_fib09,tc_fib10,
        tc_fib11,tc_fib12,tc_fib13,tc_fib14,tc_fib15,tc_fib16,tc_fib17,tc_fib18,tc_fib19,tc_fib20,
        tc_fib21,tc_fib22,tc_fib23,tc_fib24,tc_fib25,tc_fib26

        BEFORE CONSTRUCT
                 CALL cl_qbe_init()

        ON ACTION controlp
           CASE
              WHEN 1= 1
              OTHERWISE EXIT CASE
           END CASE
       ON IDLE g_idle_seconds
          CALL cl_on_idle()
          CONTINUE CONSTRUCT

       ON ACTION about
          CALL cl_about()

       ON ACTION help
          CALL cl_show_help()

       ON ACTION controlg
          CALL cl_cmdask()


      ON ACTION qbe_select
          CALL cl_qbe_select()

       ON ACTION qbe_save
		      CALL cl_qbe_save()
    END CONSTRUCT

    IF INT_FLAG THEN RETURN END IF


    LET g_wc = g_wc CLIPPED,cl_get_extra_cond('tc_fibuser', 'tc_fibgrup')

    LET g_sql="SELECT tc_fib01 FROM tc_fib_file ",
              " WHERE ",g_wc CLIPPED,
              " ORDER BY tc_fib01"
    PREPARE t100_prepare FROM g_sql
        IF STATUS THEN CALL cl_err('prepare:',STATUS,0) RETURN END IF
    DECLARE t100_cs
        SCROLL CURSOR WITH HOLD FOR t100_prepare

    DECLARE cemt100_list_cur
        SCROLL CURSOR WITH HOLD FOR t100_prepare

    LET g_sql= "SELECT COUNT(*) FROM tc_fib_file ",
               " WHERE ",g_wc CLIPPED
    PREPARE t100_count_pre   FROM g_sql
    DECLARE t100_count CURSOR FOR t100_count_pre #CKP
END FUNCTION

FUNCTION t100_menu()
    MENU ""

        BEFORE MENU
            CALL cl_navigator_setting( g_curs_index, g_row_count )
            CALL cl_set_act_visible("exporttoexcel",TRUE)

        ON ACTION insert
            LET g_action_choice="insert"
            IF cl_chk_act_auth() THEN
                 CALL t100_a()
            END IF
        ON ACTION query
            LET g_action_choice="query"
            IF cl_chk_act_auth() THEN
                 CALL t100_q()
            END IF
            NEXT OPTION "next"

        ON ACTION next
            CALL t100_fetch('N')

        ON ACTION item_list
            LET g_action_choice = ""
            CALL t100_b_menu()
            LET g_action_choice = ""

        ON ACTION previous
            CALL t100_fetch('P')

        ON ACTION modify
            LET g_action_choice="modify"
            IF cl_chk_act_auth() THEN
                 CALL t100_u()
            END IF
            NEXT OPTION "next"

        ON ACTION invalid
            LET g_action_choice="invalid"
            IF cl_chk_act_auth() THEN
                 CALL t100_x()
            END IF
            NEXT OPTION "next"

        ON ACTION delete
            LET g_action_choice="delete"
            IF cl_chk_act_auth() THEN
                 CALL t100_r()
            END IF
            NEXT OPTION "next"

       ON ACTION output
            LET g_action_choice="output"
            IF cl_chk_act_auth()
               THEN CALL t100_out()
            END IF
        #ON ACTION related_document    #No.MOD-470515
        #  LET g_action_choice="related_document"
        #  IF cl_chk_act_auth() THEN
        #     IF g_tc_fib.tc_fib01 IS NOT NULL THEN
        #        LET g_doc.column1 = "tc_fib01"
        #        LET g_doc.value1 = g_tc_fib.tc_fib01
        #        CALL cl_doc()
        #     END IF
        #  END IF

       ON ACTION exporttoexcel
         LET g_action_choice="exporttoexcel"
         IF cl_chk_act_auth() THEN
             CALL cl_export_to_excel(ui.Interface.getRootNode(),base.TypeInfo.create(g_tc_fib_1),'','')
         END IF

       ON ACTION help
           CALL cl_show_help()

       ON ACTION locale
          CALL cl_dynamic_locale()
          CALL cl_show_fld_cont()                   #No.FUN-550037 hmf


       ON ACTION confirm
          LET g_action_choice = 'confirm'
          IF cl_chk_act_auth() THEN
              IF t150_confirm() THEN
              END IF
          END IF
       ON ACTION undo_confirm
          LET g_action_choice = 'undo_confirm'
          IF cl_chk_act_auth() THEN
              IF t150_unconfirm() THEN
              END IF
          END IF
       ON ACTION void

       ON ACTION undo_void

       ON ACTION exit
           LET g_action_choice = "exit"
           EXIT MENU
        ON ACTION jump
            CALL t100_fetch('/')
        ON ACTION first
            CALL t100_fetch('F')
        ON ACTION last
            CALL t100_fetch('L')

       ON IDLE g_idle_seconds
          CALL cl_on_idle()

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121

      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121

        -- for Windows close event trapped
        ON ACTION close   #COMMAND KEY(INTERRUPT) #FUN-9B0145
             LET INT_FLAG=FALSE 		#MOD-570244	mars
            LET g_action_choice = "exit"
            EXIT MENU
      &include "qry_string.4gl"

    END MENU
    CLOSE t100_cs
END FUNCTION


FUNCTION t100_a()
  DEFINE li_result   LIKE type_file.chr1
  DEFINE l_date   LIKE type_file.num20_6

    IF s_shut(0) THEN RETURN END IF
    MESSAGE ""
    CLEAR FORM                                   # 清螢幕欄位內容
    INITIALIZE g_tc_fib.* LIKE tc_fib_file.*
    LET g_tc_fib01_t        = NULL
    CALL cl_opmsg('a')
    WHILE TRUE
        LET g_tc_fib.tc_fib02 = g_today
        LET g_tc_fib.tc_fib03 = g_user
        LET g_tc_fib.tc_fibacti ='Y'                   #有效的資料
        #LET g_tc_fib.tc_fib14 ='Y'                     #有效的資料
        # LET g_tc_fib.tc_fib08 ='N'                     #有效的資料  #No.MOD-470506
        #LET g_tc_fib.tc_fib15 ='1'                     #有效的資料
        #LET g_tc_fib.tc_fib16 ='1'                     #有效的資料
        #LET g_tc_fib.tc_fib17 ='1'                     #有效的資料
        #LET g_tc_fib.tc_fib18 ='1'                     #有效的資料
        #LET g_tc_fib.tc_fib19 ='1'                     #有效的資料
        #LET g_tc_fib.tc_fib05 =0                       #有效的資料no:5153
        #LET g_tc_fib.tc_fib07 =0                       #有效的資料no:5153
        #LET g_tc_fib.tc_fib10 =0                       #有效的資料no:5153
        #LET g_tc_fib.tc_fib22 =0                       #有效的資料no:5153
        LET g_tc_fib.tc_fib16 ='N'
        LET g_tc_fib.tc_fibuser = g_user               #使用者
        LET g_tc_fib.tc_fiboriu = g_user #FUN-980030
        LET g_tc_fib.tc_fiborig = g_grup #FUN-980030
        LET g_tc_fib.tc_fibgrup = g_grup               #使用者所屬群
        LET g_tc_fib.tc_fibdate = g_today
        DISPLAY BY NAME g_tc_fib.tc_fib01, g_tc_fib.tc_fib14, g_tc_fib.tc_fib15,
                        g_tc_fib.tc_fib16, g_tc_fib.tc_fib17, g_tc_fib.tc_fib18,
                        g_tc_fib.tc_fib19, g_tc_fib.tc_fib20, g_tc_fib.tc_fib21
        CALL t100_i("a")                         # 各欄位輸入
        IF INT_FLAG THEN                         # 若按了DEL鍵
            LET INT_FLAG = 0
            INITIALIZE g_tc_fib.*  TO NULL
            CALL cl_err('',9001,0)
            CLEAR FORM
            EXIT WHILE
        END IF
        IF cl_null(g_tc_fib.tc_fib01) THEN # KEY 不可空白
            CONTINUE WHILE
        END IF

        CALL s_auto_assign_no("aem",g_tc_fib.tc_fib01[1,4],g_tc_fib.tc_fib02,'5',"tc_fib_file","tc_fib01","","","")
            RETURNING li_result,g_tc_fib.tc_fib01

        IF (NOT li_result) THEN
            RETURN
        END IF

        CASE g_tc_fib.tc_fib14
            WHEN '1'
                LET l_date = g_tc_fib.tc_fib13 #天
            WHEN '2'
                LET l_date = g_tc_fib.tc_fib13*7 #周
            WHEN '3'
                LET l_date = g_tc_fib.tc_fib13*30
            WHEN '4'
                LET l_date = g_tc_fib.tc_fib13*365
            OTHERWISE
                CALL cl_err('未知的周期单位','!','0')

        END CASE

        LET g_tc_fib.tc_fib15 = g_tc_fib.tc_fib02 + l_date

        INSERT INTO tc_fib_file VALUES(g_tc_fib.*)       # DISK WRITE
        DISPLAY SQLCA.SQLCODE
        IF SQLCA.sqlcode THEN
            CALL cl_err3("ins","tc_fib_file",g_tc_fib.tc_fib01,"",SQLCA.sqlcode,"","",1)  #No.FUN-660136
            CONTINUE WHILE
        ELSE
            LET g_tc_fib_t.* = g_tc_fib.*                # 保存上筆資料
            SELECT tc_fib01 INTO g_tc_fib.tc_fib01 FROM tc_fib_file
             WHERE tc_fib01 = g_tc_fib.tc_fib01
        END IF
        CALL t100_show()
        EXIT WHILE
    END WHILE
END FUNCTION

FUNCTION t100_i(p_cmd)
    DEFINE
        p_cmd           LIKE type_file.chr1,         #No.FUN-680070 VARCHAR(1)
        g_cmd           LIKE type_file.chr1000,      #No.FUN-680070 VARCHAR(100)
        l_flag          LIKE type_file.chr1,                 #判斷必要欄位是否有輸入       #No.FUN-680070 VARCHAR(1)
        l_modify_flag   LIKE type_file.chr1,         #No.FUN-680070 VARCHAR(1)
        l_lock_sw       LIKE type_file.chr1,         #No.FUN-680070 VARCHAR(1)
        l_exit_sw       LIKE type_file.chr1,         #No.FUN-680070 VARCHAR(1)
        l_n             LIKE type_file.num5,         #No.FUN-680070 SMALLINT
        l_gen02         LIKE gen_file.gen02

    CALL t100_show()
    IF g_tc_fib.tc_fib16 <> 'N' THEN
        RETURN
    END IF
    INPUT BY NAME g_tc_fib.tc_fib01,g_tc_fib.tc_fib02,g_tc_fib.tc_fib03,g_tc_fib.tc_fib04,g_tc_fib.tc_fib05,

                  g_tc_fib.tc_fib26,g_tc_fib.tc_fib16,g_tc_fib.tc_fib17,g_tc_fib.tc_fib18,g_tc_fib.tc_fib19
                  #g_tc_fib.tc_fib27,g_tc_fib.tc_fib28,g_tc_fib.tc_fib29,g_tc_fib.tc_fib30,g_tc_fib.tc_fib31,
                  #g_tc_fib.tc_fib33,g_tc_fib.tc_fib34,g_tc_fib.tc_fib35,g_tc_fib.tc_fib36,g_tc_fib.tc_fib37,
                  #g_tc_fib.tc_fib38,g_tc_fib.tc_fib39,g_tc_fib.tc_fib40,g_tc_fib.tc_fib41,g_tc_fib.tc_fib42
                WITHOUT DEFAULTS

    BEFORE INPUT
      MESSAGE "Enter customer information..."
      CALL t100_set_entry(p_cmd)
      CALL t100_set_no_entry(p_cmd)

    AFTER FIELD tc_fib05
      IF NOT cl_null(g_tc_fib.tc_fib05) THEN
         LET l_n = 0
         SELECT COUNT(1) INTO l_n
           FROM tc_fia_file WHERE tc_fia01 = g_tc_fib.tc_fib05 AND tc_fia26 = 'Y'

         IF l_n > 0 THEN
            SELECT tc_fia02,tc_fia03,tc_fia04,tc_fia05,tc_fia06,tc_fia07,tc_fia08,tc_fia10,tc_fia11
              INTO g_tc_fib.tc_fib06,g_tc_fib.tc_fib07,g_tc_fib.tc_fib08,g_tc_fib.tc_fib09,
                   g_tc_fib.tc_fib10,g_tc_fib.tc_fib11,g_tc_fib.tc_fib12,g_tc_fib.tc_fib13,g_tc_fib.tc_fib14
              FROM tc_fia_file
             WHERE tc_fia01 = g_tc_fib.tc_fib05 AND tc_fia26 = 'Y'

             DISPLAY BY NAME g_tc_fib.tc_fib06,g_tc_fib.tc_fib07,g_tc_fib.tc_fib08,g_tc_fib.tc_fib09,
                   g_tc_fib.tc_fib10,g_tc_fib.tc_fib11,g_tc_fib.tc_fib12,g_tc_fib.tc_fib13,g_tc_fib.tc_fib14
         ELSE

            NEXT FIELD tc_fib05
         END IF
      END IF

    AFTER FIELD tc_fib03
        IF NOT cl_null(g_tc_fib.tc_fib03) THEN
            SELECT gen02 INTO l_gen02 FROM gen_file WHERE gen01 = g_tc_fib.tc_fib03
            IF cl_null(l_gen02) THEN LET l_gen02 = ' ' END IF
            CALL cl_set_comp_lab_text("tc_fib03_desc",l_gen02)
        ELSE
            NEXT FIELD tc_fib03
        END IF

    ON ACTION controlp
       CASE
          WHEN INFIELD(tc_fib01)
              CALL cl_init_qry_var()
              LET g_qryparam.state = 'i'
              LET g_qryparam.form ="cq_tc_fib01"
              CALL cl_create_qry() RETURNING g_qryparam.multiret
              LET g_qryparam.multiret = g_qryparam.multiret CLIPPED,"-"
              LET g_tc_fib.tc_fib01 = g_qryparam.multiret
              DISPLAY g_qryparam.multiret TO g_tc_fib.tc_fib01
              LET g_tc_fib.tc_fib01 = g_qryparam.multiret
              DISPLAY BY NAME g_tc_fib.tc_fib01
              NEXT FIELD tc_fib01

          WHEN INFIELD(tc_fib05)
              CALL cl_init_qry_var()
              LET g_qryparam.state = 'i'
              LET g_qryparam.form ="tc_fib05"
              CALL cl_create_qry() RETURNING g_qryparam.multiret
              DISPLAY g_qryparam.multiret TO g_tc_fib.tc_fib05
              LET g_tc_fib.tc_fib05 = g_qryparam.multiret
              DISPLAY BY NAME g_tc_fib.tc_fib05
              NEXT FIELD tc_fib05

          WHEN INFIELD(tc_fib03)
              CALL cl_init_qry_var()
              LET g_qryparam.state = 'i'
              LET g_qryparam.form ="q_gen"
              CALL cl_create_qry() RETURNING g_qryparam.multiret
              LET g_tc_fib.tc_fib03 = g_qryparam.multiret
              DISPLAY g_qryparam.multiret TO g_tc_fib.tc_fib05
              LET g_tc_fib.tc_fib03 = g_qryparam.multiret
              DISPLAY BY NAME g_tc_fib.tc_fib03
              NEXT FIELD tc_fib03

          OTHERWISE EXIT CASE
       END CASE

    AFTER INPUT
      MESSAGE "Input terminated..."
  END INPUT
END FUNCTION



FUNCTION t100_q()

    LET g_row_count = 0
    LET g_curs_index = 0
    CALL cl_navigator_setting( g_curs_index, g_row_count )
    INITIALIZE g_tc_fib.* TO NULL             #No.FUN-6A0001
    MESSAGE ""
    CALL cl_opmsg('q')
    DISPLAY '   ' TO FORMONLY.cnt
    CALL t100_cs()                          # 宣告 SCROLL CURSOR
    IF INT_FLAG THEN
        LET INT_FLAG = 0
        CLEAR FORM
        RETURN
    END IF
    OPEN t100_count
    FETCH t100_count INTO g_row_count
    DISPLAY g_row_count TO FORMONLY.cnt
    OPEN t100_cs                            # 從DB產生合乎條件TEMP(0-30秒)
    IF SQLCA.sqlcode THEN
        CALL cl_err(g_tc_fib.tc_fib01,SQLCA.sqlcode,0)
        INITIALIZE g_tc_fib.* TO NULL
    ELSE
        CALL t100_fetch('F')                  # 讀出TEMP第一筆並顯示
        CALL t100_list_fill()
        LET g_bp_flag = 'list'
    END IF
END FUNCTION

FUNCTION t100_fetch(p_fltc_fib)
    DEFINE
        p_fltc_fib          LIKE type_file.chr1,         #No.FUN-680070 VARCHAR(1)
        l_abso          LIKE type_file.num10        #No.FUN-680070 INTEGER

    CASE p_fltc_fib
        WHEN 'N' FETCH NEXT     t100_cs INTO g_tc_fib.tc_fib01
        WHEN 'P' FETCH PREVIOUS t100_cs INTO g_tc_fib.tc_fib01
        WHEN 'F' FETCH FIRST    t100_cs INTO g_tc_fib.tc_fib01
        WHEN 'L' FETCH LAST     t100_cs INTO g_tc_fib.tc_fib01
        WHEN '/'
         IF (NOT g_no_ask) THEN
            CALL cl_getmsg('fetch',g_lang) RETURNING g_msg
            LET INT_FLAG = 0  ######add for prompt bug
            PROMPT g_msg CLIPPED,': ' FOR g_jump #CKP3
               ON IDLE g_idle_seconds
                  CALL cl_on_idle()

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121

      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121

      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121


            END PROMPT
            IF INT_FLAG THEN
                LET INT_FLAG = 0
                EXIT CASE
            END IF
         END IF
         FETCH ABSOLUTE g_jump t100_cs INTO g_tc_fib.tc_fib01
         LET g_no_ask = FALSE
    END CASE
    IF SQLCA.sqlcode THEN
        CALL cl_err(g_tc_fib.tc_fib01,SQLCA.sqlcode,0)
        INITIALIZE g_tc_fib.* TO NULL  #TQC-6B0105
        RETURN
    ELSE
       CASE p_fltc_fib
          WHEN 'F' LET g_curs_index = 1
          WHEN 'P' LET g_curs_index = g_curs_index - 1
          WHEN 'N' LET g_curs_index = g_curs_index + 1
          WHEN 'L' LET g_curs_index = g_row_count
          WHEN '/' LET g_curs_index = g_jump #CKP3
       END CASE

       CALL cl_navigator_setting( g_curs_index, g_row_count )
    END IF
    SELECT * INTO g_tc_fib.* FROM tc_fib_file        # 重讀DB,因TEMP有不被更新特性
       WHERE tc_fib01 = g_tc_fib.tc_fib01
    IF SQLCA.sqlcode THEN
       CALL cl_err3("sel","tc_fib_file",g_tc_fib.tc_fib01,"",SQLCA.sqlcode,"","",1)  #No.FUN-660136
    ELSE
        LET g_data_owner = g_tc_fib.tc_fibuser  #FUN-4C0059
        LET g_data_group = g_tc_fib.tc_fibgrup  #FUN-4C0059
        CALL t100_show()                      # 重新顯示
    END IF
END FUNCTION

FUNCTION t100_show()
  DEFINE l_gen02  LIKE gen_file.gen02

    SELECT * INTO g_tc_fib.* FROM tc_fib_file WHERE tc_fib01 = g_tc_fib.tc_fib01
    LET g_tc_fib_t.* = g_tc_fib.*
    LET g_tc_fib_o.*=g_tc_fib.*
    DISPLAY BY NAME g_tc_fib.tc_fib01,g_tc_fib.tc_fib02,g_tc_fib.tc_fib03,g_tc_fib.tc_fib04,g_tc_fib.tc_fib05,
                    g_tc_fib.tc_fib06,g_tc_fib.tc_fib07,g_tc_fib.tc_fib08,g_tc_fib.tc_fib09,g_tc_fib.tc_fib10,
                    g_tc_fib.tc_fib11,g_tc_fib.tc_fib12,g_tc_fib.tc_fib13,g_tc_fib.tc_fib14,g_tc_fib.tc_fib15,
                    g_tc_fib.tc_fib16,g_tc_fib.tc_fib17,g_tc_fib.tc_fib18,g_tc_fib.tc_fib19
                    #g_tc_fib.tc_fibacti,g_tc_fib.tc_fibuser,g_tc_fib.tc_fibgrup,g_tc_fib.tc_fibmodu,
                    #g_tc_fib.tc_fibdate,g_tc_fib.tc_fiboriu,g_tc_fib.tc_fiborig
    DISPLAY BY NAME  g_tc_fib.tc_fibacti,g_tc_fib.tc_fibuser,g_tc_fib.tc_fibgrup,g_tc_fib.tc_fibmodu,
                     g_tc_fib.tc_fibdate,g_tc_fib.tc_fiboriu,g_tc_fib.tc_fiborig

    SELECT gen02 INTO l_gen02 FROM gen_file WHERE gen01 = g_tc_fib.tc_fib03
    IF cl_null(l_gen02) THEN LET l_gen02 = ' ' END IF
    CALL cl_set_comp_lab_text("tc_fib03_desc",l_gen02)
    CALL cl_set_field_pic(g_tc_fib.tc_fib16,'N','N','N','N','Y')
    CALL cl_show_fld_cont()                   #No.FUN-550037 hmf
END FUNCTION

FUNCTION t100_u()
    IF s_shut(0) THEN RETURN END IF
    IF g_tc_fib.tc_fib01 IS NULL THEN
        CALL cl_err('',-400,0)
        RETURN
    END IF
    SELECT * INTO g_tc_fib.* FROM tc_fib_file WHERE tc_fib01 = g_tc_fib.tc_fib01
    IF g_tc_fib.tc_fibacti ='N' THEN    #檢查資料是否為無效
        CALL cl_err(g_tc_fib.tc_fib01,'9027',0)
        RETURN
    END IF
    MESSAGE ""
    CALL cl_opmsg('u')
    LET g_tc_fib01_t = g_tc_fib.tc_fib01
    BEGIN WORK

    OPEN t100_cl USING g_tc_fib.tc_fib01

    IF STATUS THEN
       CALL cl_err("OPEN t100_cl:", STATUS, 1)
       CLOSE t100_cl
       ROLLBACK WORK
       RETURN
    END IF
    FETCH t100_cl INTO g_tc_fib.*               # 對DB鎖定
    IF SQLCA.sqlcode THEN
        CALL cl_err(g_tc_fib.tc_fib01,SQLCA.sqlcode,0)
        RETURN
    END IF
    LET g_tc_fib.tc_fibmodu=g_user                     #修改者
    LET g_tc_fib.tc_fibdate = g_today                  #修改日期
    CALL t100_show()                             # 顯示最新資料
    WHILE TRUE
        CALL t100_i("u")                         # 欄位更改
        IF INT_FLAG THEN
            LET INT_FLAG = 0
            LET g_tc_fib.*=g_tc_fib_t.*
            CALL t100_show()
            CALL cl_err('',9001,0)
            EXIT WHILE
        END IF
        UPDATE tc_fib_file SET tc_fib_file.* = g_tc_fib.*    # 更新DB
            WHERE tc_fib01 = g_tc_fib01_t
        IF SQLCA.sqlcode THEN
            CALL cl_err3("upd","tc_fib_file",g_tc_fib01_t,"",SQLCA.sqlcode,"","",1)  #No.FUN-660136
            CONTINUE WHILE
        END IF
        EXIT WHILE
    END WHILE
    CLOSE t100_cl
    COMMIT WORK
END FUNCTION

FUNCTION t100_x()
    DEFINE
        l_chr LIKE type_file.chr1         #No.FUN-680070 VARCHAR(1)

    IF s_shut(0) THEN RETURN END IF
    IF g_tc_fib.tc_fib01 IS NULL THEN
        CALL cl_err('',-400,0)
        RETURN
    END IF
    BEGIN WORK

    OPEN t100_cl USING g_tc_fib.tc_fib01

    IF STATUS THEN
       CALL cl_err("OPEN t100_cl:", STATUS, 1)
       CLOSE t100_cl
       ROLLBACK WORK
       RETURN
    END IF
    FETCH t100_cl INTO g_tc_fib.*
    IF SQLCA.sqlcode THEN
        CALL cl_err(g_tc_fib.tc_fib01,SQLCA.sqlcode,0)
        RETURN
    END IF
    CALL t100_show()
    IF cl_exp(15,21,g_tc_fib.tc_fibacti) THEN
        LET g_chr=g_tc_fib.tc_fibacti
        IF g_tc_fib.tc_fibacti='Y' THEN
            LET g_tc_fib.tc_fibacti='N'
        ELSE
            LET g_tc_fib.tc_fibacti='Y'
        END IF
        UPDATE tc_fib_file
            SET tc_fibacti=g_tc_fib.tc_fibacti,
                tc_fibmodu=g_user, tc_fibdate=g_today
            WHERE tc_fib01=g_tc_fib.tc_fib01
        IF SQLCA.SQLERRD[3]=0 THEN
            CALL cl_err3("upd","tc_fib_file",g_tc_fib.tc_fib01,"",SQLCA.sqlcode,"","",1)  #No.FUN-660136
            LET g_tc_fib.tc_fibacti=g_chr
        END IF
        DISPLAY BY NAME g_tc_fib.tc_fibacti
    END IF
    CLOSE t100_cl
    COMMIT WORK
END FUNCTION

FUNCTION t100_r()
    DEFINE
        l_chr LIKE type_file.chr1         #No.FUN-680070 VARCHAR(1)

    IF s_shut(0) THEN RETURN END IF
    IF g_tc_fib.tc_fib01 IS NULL THEN
        CALL cl_err('',-400,0)
        RETURN
    END IF
    IF g_tc_fib.tc_fibacti = 'N' THEN
        CALL cl_err('','abm-950',0)
        RETURN
    END IF
    BEGIN WORK

    OPEN t100_cl USING g_tc_fib.tc_fib01

    IF STATUS THEN
       CALL cl_err("OPEN t100_cl:", STATUS, 1)
       CLOSE t100_cl
       ROLLBACK WORK
       RETURN
    END IF
    FETCH t100_cl INTO g_tc_fib.*
    IF SQLCA.sqlcode THEN
        CALL cl_err(g_tc_fib.tc_fib01,SQLCA.sqlcode,0)
        RETURN
    END IF
    CALL t100_show()
    IF cl_delete() THEN
        INITIALIZE g_doc.* TO NULL          #No.FUN-9B0098 10/02/24
        LET g_doc.column1 = "tc_fib01"         #No.FUN-9B0098 10/02/24
        LET g_doc.value1 = g_tc_fib.tc_fib01      #No.FUN-9B0098 10/02/24
        CALL cl_del_doc()                                         #No.FUN-9B0098 10/02/24
       DELETE FROM tc_fib_file WHERE tc_fib01 = g_tc_fib.tc_fib01
       IF SQLCA.SQLERRD[3]=0 THEN
          CALL cl_err3("del","tc_fib_file",g_tc_fib.tc_fib01,"",SQLCA.sqlcode,"","",1)  #No.FUN-660136
       ELSE CLEAR FORM
         OPEN t100_count
         FETCH t100_count INTO g_row_count
         DISPLAY g_row_count TO FORMONLY.cnt
         OPEN t100_cs
         IF g_curs_index = g_row_count + 1 THEN
            LET g_jump = g_row_count
            CALL t100_fetch('L')
         ELSE
            LET g_jump = g_curs_index
            LET g_no_ask = TRUE
            CALL t100_fetch('/')
         END IF
       END IF
    END IF
    CLOSE t100_cl
    COMMIT WORK
END FUNCTION

FUNCTION t100_out()
    DEFINE
        l_i             LIKE type_file.num5,         #No.FUN-680070 SMALLINT
        l_name          LIKE type_file.chr20,        # External(Disk) file name       #No.FUN-680070 VARCHAR(20)
        l_za05          LIKE za_file.za05,           #No.FUN-680070 VARCHAR(40)
        l_chr           LIKE type_file.chr1,         #No.FUN-680070 VARCHAR(1)
        sr       RECORD LIKE tc_fib_file.*

    IF g_wc IS NULL THEN
        CALL cl_err('','9057',0)
        RETURN
    END IF
    CALL cl_wait()
    CALL cl_outnam('cemt100') RETURNING l_name
    SELECT zo02 INTO g_company FROM zo_file WHERE zo01 = g_lang
    LET g_sql="SELECT * FROM tc_fib_file ",          # 組合出 SQL 指令
              " WHERE ",g_wc CLIPPED


    # 是否列印選擇條件
    IF g_zz05 = 'Y' THEN
       CALL cl_wcchp(g_wc,'tc_fib01')
            RETURNING g_wc
       LET g_str = g_wc
    END IF
    #CALL cl_prt_cs1('cemt100','cemt100',g_sql,g_wc)

END FUNCTION
FUNCTION t100_b_menu()
   DEFINE   l_priv1   LIKE zy_file.zy03,
            l_priv2   LIKE zy_file.zy04,
            l_priv3   LIKE zy_file.zy05
   DEFINE   l_cmd     LIKE type_file.chr1000

   WHILE TRUE

      CALL t100_bp("G")

      IF NOT cl_null(g_action_choice) AND l_ac1>0 THEN #將清單的資料回傳到主畫面
         SELECT tc_fib_file.*
           INTO g_tc_fib.*
           FROM tc_fib_file
          WHERE tc_fib01=g_tc_fib_1[l_ac1].tc_fib01
      END IF

      IF g_action_choice!= "" THEN
         LET g_bp_flag = 'main'
         LET l_ac1 = ARR_CURR()
         LET g_jump = l_ac1
         LET mi_no_ask = TRUE
         IF g_rec_b1 >0 THEN
             CALL t100_fetch('/')
         END IF
         CALL cl_set_comp_visible("page112", FALSE)
         CALL cl_set_comp_visible("info", FALSE)
         CALL ui.interface.refresh()
         CALL cl_set_comp_visible("page112", TRUE)
         CALL cl_set_comp_visible("info", TRUE)
       END IF

       CASE g_action_choice
         WHEN "insert"
            IF g_aza.aza60 = 'N' THEN #不使用客戶申請作業時,才可按新增!
                IF cl_chk_act_auth() THEN    #cl_prichk('A') THEN
                     CALL t100_a()
                END IF
            ELSE
                CALL cl_err('','aim-152',1)
                #不使用客戶申請作業時,才可按新增!
            END IF
            EXIT WHILE

        WHEN "query"
            IF cl_chk_act_auth() THEN
               CALL t100_q()
            END IF
            EXIT WHILE

        WHEN "delete"
            IF cl_chk_act_auth() THEN
               CALL t100_r()
               CALL t100_AFTER_DEL()
            END IF

        WHEN "modify"
            IF cl_chk_act_auth() THEN
               CALL t100_u()
            END IF
            EXIT WHILE

        WHEN "help"
            CALL cl_show_help()

        WHEN "controlg"
            CALL cl_cmdask()

        WHEN "exit"
            EXIT WHILE

        WHEN "g_idle_seconds"
            CALL cl_on_idle()

        WHEN "about"
            CALL cl_about()

        OTHERWISE
            EXIT WHILE
      END CASE


   END WHILE

END FUNCTION

FUNCTION t100_AFTER_DEL()
   OPEN t100_count
   FETCH t100_count INTO g_row_count
   DISPLAY g_row_count TO FORMONLY.cnt
   OPEN t100_cs
   IF g_curs_index = g_row_count + 1 THEN
      LET g_jump = g_row_count
      CALL t100_fetch('L')
   ELSE
      LET g_jump = g_curs_index
      LET mi_no_ask = TRUE     #No.FUN-6A0061
      CALL t100_fetch('/')
   END IF
END FUNCTION



FUNCTION t100_bp(p_ud)
   DEFINE   p_ud      LIKE type_file.chr1

   IF p_ud <> "G" OR g_action_choice = "detail" THEN
      RETURN
   END IF

   LET g_action_choice = " "

   CALL cl_set_act_visible("accept,cancel", FALSE)

   DISPLAY ARRAY g_tc_fib_1 TO s_tc_fib.* ATTRIBUTE(COUNT=g_rec_b1,UNBUFFERED)

      BEFORE DISPLAY
         CALL cl_navigator_setting(g_curs_index, g_row_count)
         IF g_rec_b1 != 0 THEN
            CALL fgl_set_arr_curr(g_curs_index)
         END IF
         CALL cl_set_act_visible("exporttoexcel",TRUE)

      BEFORE ROW
         LET l_ac1 = ARR_CURR()
         CALL cl_show_fld_cont()

      ON ACTION main
         LET g_bp_flag = 'main'
         LET l_ac1 = ARR_CURR()
         LET g_no_ask = TRUE
         LET g_jump = l_ac1
         LET mi_no_ask = TRUE
         IF g_rec_b1 >0 THEN
             CALL t100_fetch('/')
         END IF
         CALL cl_set_comp_visible("page112", FALSE)
         CALL cl_set_comp_visible("info", FALSE)
         CALL ui.interface.refresh()
         CALL cl_set_comp_visible("page112", TRUE)
         CALL cl_set_comp_visible("info", TRUE)
         EXIT DISPLAY

      ON ACTION accept
         LET l_ac1 = ARR_CURR()
         LET g_jump = l_ac1
         LET g_no_ask = TRUE
         LET mi_no_ask = TRUE
         LET g_bp_flag = NULL
         CALL t100_fetch('/')
         CALL cl_set_comp_visible("info", FALSE)
         CALL cl_set_comp_visible("info", TRUE)
         CALL cl_set_comp_visible("page112", FALSE)   #NO.FUN-840018 ADD
         CALL ui.interface.refresh()                  #NO.FUN-840018 ADD
         CALL cl_set_comp_visible("page112", TRUE)    #NO.FUN-840018 ADD
         EXIT DISPLAY

      ON ACTION first
         CALL t100_fetch('F')
         CALL cl_navigator_setting(g_curs_index, g_row_count)
         IF g_rec_b1 != 0 THEN
            CALL fgl_set_arr_curr(g_curs_index)
         END IF
         CONTINUE DISPLAY

      ON ACTION previous
         CALL t100_fetch('P')
         CALL cl_navigator_setting(g_curs_index, g_row_count)
         IF g_rec_b1 != 0 THEN
            CALL fgl_set_arr_curr(g_curs_index)
         END IF
         CONTINUE DISPLAY

      ON ACTION jump
         CALL t100_fetch('/')
         CALL cl_navigator_setting(g_curs_index, g_row_count)
         IF g_rec_b1 != 0 THEN
            CALL fgl_set_arr_curr(g_curs_index)
         END IF
         CONTINUE DISPLAY

      ON ACTION next
         CALL t100_fetch('N')
         CALL cl_navigator_setting(g_curs_index, g_row_count)
         IF g_rec_b1 != 0 THEN
            CALL fgl_set_arr_curr(g_curs_index)
         END IF
         CONTINUE DISPLAY

      ON ACTION last
         CALL t100_fetch('L')
         CALL cl_navigator_setting(g_curs_index, g_row_count)
         IF g_rec_b1 != 0 THEN
            CALL fgl_set_arr_curr(g_curs_index)
         END IF
         CONTINUE DISPLAY

      ON ACTION info_pg
         EXIT DISPLAY

      ON ACTION help
         LET g_action_choice="help"
         EXIT DISPLAY

      ON ACTION exit
         LET g_action_choice="exit"
         EXIT DISPLAY

      ON ACTION controlg
         LET g_action_choice="controlg"
         EXIT DISPLAY

      ON ACTION locale
         CALL cl_dynamic_locale()
         CALL cl_show_fld_cont()

      ON ACTION cancel
         LET INT_FLAG=FALSE
         LET g_action_choice="exit"
         EXIT DISPLAY

      ON ACTION exporttoexcel
         LET g_action_choice="exporttoexcel"
         IF cl_chk_act_auth() THEN
             CALL cl_export_to_excel(ui.Interface.getRootNode(),base.TypeInfo.create(g_tc_fib_1),'','')
         END IF

      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY

      ON ACTION about
         LET g_action_choice="about"
         EXIT DISPLAY

      ON ACTION insert
         LET g_action_choice="insert"
         EXIT DISPLAY

      ON ACTION query
         LET g_action_choice="query"
         EXIT DISPLAY

      ON ACTION delete
         LET g_action_choice="delete"
         EXIT DISPLAY

      ON ACTION modify
         LET g_action_choice="modify"
         EXIT DISPLAY


      ON ACTION output
         LET g_action_choice="output"
         EXIT DISPLAY


      AFTER DISPLAY
         CONTINUE DISPLAY

      &include "qry_string.4gl"

   END DISPLAY
   CALL cl_set_act_visible("accept,cancel", TRUE)
   IF INT_FLAG THEN
      CALL cl_set_comp_visible("list", FALSE)
      CALL cl_set_comp_visible("info", FALSE)
      CALL ui.interface.refresh()
      CALL cl_set_comp_visible("list", TRUE)
      CALL cl_set_comp_visible("info", TRUE)
      LET INT_FLAG = 0
   END IF

END FUNCTION

FUNCTION t100_list_fill()
  DEFINE l_tc_fib01         LIKE tc_fib_file.tc_fib01
  DEFINE l_i             LIKE type_file.num10

    CALL g_tc_fib_1.clear()
    LET l_i = 1
    LET g_sql = "SELECT tc_fib01,tc_fib02,tc_fib03,tc_fib04,tc_fib05,tc_fib06,",
                "       tc_fib07,tc_fib08,tc_fib09,tc_fib10||(case tc_fib11 WHEN '1' THEN '天' WHEN '2' THEN '周' WHEN '3' THEN '月' WHEN '4'  THEN '年' END ),",
                "       tc_fib12,tc_fib13,tc_fib14,tc_fib15,tc_fib16,tc_fib17,",
                "       tc_fib18,tc_fib19,tc_fib20,tc_fib21,tc_fib22,tc_fib23,",
                "       tc_fib24,tc_fib25,tc_fib26",
                " FROM tc_fib_file",
                " WHERE tc_fib01= ?"
    PREPARE t100_tc_fib_p FROM g_sql
    DECLARE t100_tc_fib_cur CURSOR FOR t100_tc_fib_p

    FOREACH cemt100_list_cur INTO l_tc_fib01
       IF SQLCA.sqlcode THEN
          CALL cl_err('foreach item_cur',SQLCA.sqlcode,1)
          CONTINUE FOREACH
       END IF

       EXECUTE t100_tc_fib_cur USING l_tc_fib01 INTO g_tc_fib_1[l_i].*
       LET l_i = l_i + 1
       IF l_i > g_max_rec THEN
          CALL cl_err( '', 9035, 0 )
          EXIT FOREACH
       END IF
    END FOREACH
    LET g_rec_b1 = l_i - 1
    DISPLAY ARRAY g_tc_fib_1 TO s_tc_fib.* ATTRIBUTE(COUNT=g_rec_b1,UNBUFFERED)
       BEFORE DISPLAY
          EXIT DISPLAY
    END DISPLAY

END FUNCTION

FUNCTION t100_set_entry(p_cmd)
DEFINE   p_cmd   LIKE type_file.chr1         #No.FUN-680070 VARCHAR(1)

CALL cl_set_act_visible("accept,cancel", TRUE)
   IF INT_FLAG THEN
      CALL cl_set_comp_visible("list", FALSE)
      CALL cl_set_comp_visible("info", FALSE)
      CALL ui.interface.refresh()
      CALL cl_set_comp_visible("list", TRUE)
      CALL cl_set_comp_visible("info", TRUE)
      LET INT_FLAG = 0
   END IF


END FUNCTION

FUNCTIOn t150_confirm()
  DEFINE l_date   LIKE type_file.num20_6
  DEFINE l_cnt    LIKE type_file.num5

    IF cl_null(g_tc_fib.tc_fib01) THEN

        RETURN FALSE
    END IF

    SELECT * INTO g_tc_fib.*
      FROM tc_fib_file
     WHERE tc_fib01 = g_tc_fib.tc_fib01

    IF SQLCA.sqlcode THEN
        CALL cl_err(g_tc_fib.tc_fib01,SQLCA.sqlcode,0)
        RETURN FALSE
    END IF

    IF g_tc_fib.tc_fib16<> 'N' THEN

        RETURN FALSE
    END IF

    LET l_cnt = 0

    SELECT (SELECT max(tc_fib02) FROM tc_fib_file
     WHERE tc_fib05 =  g_tc_fib.tc_fib05
       AND tc_fib16 ='Y')-
    (SELECT tc_fib02 FROM tc_fib_file
     WHERE tc_fib05 =  g_tc_fib.tc_fib01
       AND tc_fib16 ='Y') INTO l_cnt FROM DUAL

    IF l_cnt > 0 THEN
        CALL cl_err('存在维护日期大于当前维保记录日期，无法审核','!','0')
        RETURN FALSE
    END IF

    BEGIN WORK

    UPDATE tc_fia_file
       SET tc_fia12 = g_tc_fib.tc_fib02
     WHERE tc_fia01 = g_tc_fib.tc_fib05
       AND tc_fia26 = 'Y'

    IF SQLCA.sqlcode THEN
        CALL cl_err(g_tc_fib.tc_fib05,SQLCA.sqlcode,0)
        ROLLBACK WORK
        RETURN FALSE
    END IF
    IF cl_confirm('cem-001') THEN
        UPDATE tc_fib_file
           SET tc_fib16 = 'Y'
         WHERE tc_fib01 = g_tc_fib.tc_fib01
           AND tc_fib16 = 'N'
    END IF

    IF SQLCA.sqlcode THEN
        CALL cl_err(g_tc_fib.tc_fib01,SQLCA.sqlcode,0)
        ROLLBACK WORK
        RETURN FALSE
    END IF

    COMMIT WORK
    CALL t100_show()

    RETURN TRUE


END FUNCTION
FUNCTION  t150_unconfirm()
  DEFINE l_date   LIKE type_file.num20_6
  DEFINE l_cnt    LIKE type_file.num5
  DEFINE l_ld     LIKE type_file.dat

   IF cl_null(g_tc_fib.tc_fib01) THEN

        RETURN FALSE
    END IF

    SELECT * INTO g_tc_fib.*
      FROM tc_fib_file
     WHERE tc_fib01 = g_tc_fib.tc_fib01

    IF SQLCA.sqlcode THEN
        CALL cl_err(g_tc_fib.tc_fib01,SQLCA.sqlcode,0)
        RETURN FALSE
    END IF

    IF g_tc_fib.tc_fib16<> 'Y' THEN

        RETURN FALSE
    END IF

    SELECT max(tc_fib02) INTO l_ld
      FROM tc_fib_file
     WHERE tc_fib01 <> g_tc_fib.tc_fib01
       AND tc_fib05 = g_tc_fib.tc_fib05
       AND tc_fib16 ='Y'

    IF SQLCA.sqlcode THEN
        CALL cl_err(g_tc_fib.tc_fib05,SQLCA.sqlcode,0)
        ROLLBACK WORK
        RETURN FALSE
    END IF


    IF l_ld > g_tc_fib.tc_fib02 THEN
        CALL cl_err('存在维护日期大于当前维保记录日期，不可取消审核','!','0')
        RETURN FALSE
    END IF

    CASE g_tc_fib.tc_fib14
       WHEN '1'
           LET l_date = g_tc_fib.tc_fib13 #天
       WHEN '2'
           LET l_date = g_tc_fib.tc_fib13*7 #周
       WHEN '3'
           LET l_date = g_tc_fib.tc_fib13*30
       WHEN '4'
           LET l_date = g_tc_fib.tc_fib13*365
       OTHERWISE
           CALL cl_err('未知的周期单位','!','0')
           RETURN FALSE
    END CASE

    BEGIN WORK

#    UPDATE tc_fia_file
#       SET tc_fia12 = l_ld,
#           tc_fia13 = tc_fia13 - l_date
#     WHERE tc_fia01 = g_tc_fib.tc_fib05
#       AND tc_fia26 = 'Y'

    IF SQLCA.sqlcode THEN
        CALL cl_err(g_tc_fib.tc_fib05,SQLCA.sqlcode,0)
        ROLLBACK WORK
        RETURN FALSE
    END IF
    IF cl_confirm('cem-002') THEN
        UPDATE tc_fib_file
           SET tc_fib16 = 'N'
        WHERE tc_fib01 = g_tc_fib.tc_fib01
          AND tc_fib16 = 'Y'
    END IF

    IF SQLCA.sqlcode THEN
        CALL cl_err(g_tc_fib.tc_fib01,SQLCA.sqlcode,0)
        ROLLBACK WORK
        RETURN FALSE
    END IF

    CALL t100_show()

    COMMIT WORK
    RETURN TRUE


END FUNCTION
FUNCTION t100_set_no_entry(p_cmd)
DEFINE   p_cmd   LIKE type_file.chr1         #No.FUN-680070 VARCHAR(1)

    IF p_cmd ='i' THEN
        CALL cl_set_comp_entry("tc_fib06,tc_fib07,tc_fib08,tc_fib09,tc_fib10,tc_fib11,tc_fib12,tc_fib13,tc_fib14,tc_fib15,tc_fib16",FALSE)
    END IF

END FUNCTION
