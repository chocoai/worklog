# Prog. Version..: '5.25.02-11.03.23(00010)'     #
#
# Pattern name...: cemi100.4gl
# Descriptions...: 重要设备维保记录作业
# Date & Author..: 18/07/22 By lixwz


DATABASE ds

GLOBALS "../../..//tiptop/config/top.global"

DEFINE
    g_tc_fia               RECORD LIKE tc_fia_file.*,
    g_tc_fia_t             RECORD LIKE tc_fia_file.*,
    g_tc_fia_o             RECORD LIKE tc_fia_file.*,
    g_tc_fia01_t           LIKE tc_fia_file.tc_fia01,
    g_b1                LIKE type_file.chr20,           #No.FUN-680070 VARCHAR(15)
    g_d1                LIKE type_file.chr20,           #No.FUN-680070 VARCHAR(15)
    g_wc,g_sql          string  #No.FUN-580092 HCN
DEFINE g_tc_fia_1   DYNAMIC ARRAY OF RECORD
            tc_fia01 LIKE tc_fia_file.tc_fia01,
            tc_fia02 LIKE tc_fia_file.tc_fia02,
            tc_fia03 LIKE tc_fia_file.tc_fia03,
            tc_fia04 LIKE tc_fia_file.tc_fia04,
            tc_fia05 LIKE tc_fia_file.tc_fia05,
            tc_fia06 LIKE tc_fia_file.tc_fia06,
            tc_fia07 LIKE tc_fia_file.tc_fia07,
            tc_fia08 LIKE tc_fia_file.tc_fia08,
            tc_fia09 LIKE tc_fia_file.tc_fia09,
            tc_fia10 LIKE type_file.chr30,
            tc_fia12 LIKE tc_fia_file.tc_fia12,
            tc_fia13 LIKE tc_fia_file.tc_fia13,
            tc_fia14 LIKE tc_fia_file.tc_fia14,
            tc_fia15 LIKE tc_fia_file.tc_fia15,
            tc_fia16 LIKE tc_fia_file.tc_fia16,
            tc_fia17 LIKE tc_fia_file.tc_fia17,
            tc_fia18 LIKE tc_fia_file.tc_fia18,
            tc_fia19 LIKE tc_fia_file.tc_fia19,
            tc_fia20 LIKE tc_fia_file.tc_fia20,
            tc_fia21 LIKE tc_fia_file.tc_fia21,
            tc_fia22 LIKE tc_fia_file.tc_fia22,
            tc_fia23 LIKE tc_fia_file.tc_fia23,
            tc_fia24 LIKE tc_fia_file.tc_fia24,
            tc_fia25 LIKE tc_fia_file.tc_fia25,
            tc_fia26 LIKE tc_fia_file.tc_fia26

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
DEFINE g_argv1     LIKE tc_fia_file.tc_fia01     #FUN-7C0050
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

    INITIALIZE g_tc_fia.* TO NULL
    INITIALIZE g_tc_fia_t.* TO NULL
    INITIALIZE g_tc_fia_o.* TO NULL

    LET g_forupd_sql = "SELECT * FROM tc_fia_file WHERE tc_fia01 = ? FOR UPDATE"

    LET g_forupd_sql = cl_forupd_sql(g_forupd_sql)
    DECLARE i100_cl CURSOR  FROM g_forupd_sql              # LOCK CURSOR

    OPEN WINDOW i100_w WITH FORM "cem/42f/cemi100"
       ATTRIBUTE (STYLE = g_win_style CLIPPED)
    CALL cl_ui_init()



    LET g_action_choice=""
    CALL i100_menu()

    CLOSE WINDOW i100_w
    CALL cl_used(g_prog,g_time,2) RETURNING g_time
END MAIN

FUNCTION i100_cs()
    CLEAR FORM
   INITIALIZE g_tc_fia.* TO NULL


    CONSTRUCT BY NAME g_wc ON                    # 螢幕上取條件
        tc_fia01,tc_fia02,tc_fia03,tc_fia04,tc_fia05,tc_fia06,tc_fia07,tc_fia08,tc_fia09,tc_fia10,
        tc_fia11,tc_fia12,tc_fia13,tc_fia14,tc_fia15,tc_fia16,tc_fia17,tc_fia18,tc_fia19,tc_fia20,
        tc_fia21,tc_fia22,tc_fia23,tc_fia24,tc_fia25,tc_fia26

        BEFORE CONSTRUCT
                 CALL cl_qbe_init()

        ON ACTION controlp
           CASE
              WHEN INFIELD(tc_fia01)
                  CALL cl_init_qry_var()
                  LET g_qryparam.state = 'c'
                  LET g_qryparam.form ="cq_tc_fia01"
                  CALL cl_create_qry() RETURNING g_qryparam.multiret
                  LET g_tc_fia.tc_fia01 = g_qryparam.multiret
                  DISPLAY g_qryparam.multiret TO g_tc_fia.tc_fia01
                  NEXT FIELD tc_fia01


              WHEN INFIELD(tc_fia14)
                  CALL cl_init_qry_var()
                  LET g_qryparam.state = 'c'
                  LET g_qryparam.form ="q_gem"
                  CALL cl_create_qry() RETURNING g_qryparam.multiret
                  LET g_tc_fia.tc_fia14 = g_qryparam.multiret
                  DISPLAY g_qryparam.multiret TO g_tc_fia.tc_fia14
                  NEXT FIELD tc_fia14

               WHEN INFIELD(tc_fia15)
                  CALL cl_init_qry_var()
                  LET g_qryparam.state = 'c'
                  LET g_qryparam.form ="q_gen"
                  CALL cl_create_qry() RETURNING g_qryparam.multiret
                  LET g_tc_fia.tc_fia15 = g_qryparam.multiret
                  DISPLAY g_qryparam.multiret TO g_tc_fia.tc_fia15
                  NEXT FIELD tc_fia15

              WHEN INFIELD(tc_fia07)
                  CALL cl_init_qry_var()
                  LET g_qryparam.state = 'c'
                  LET g_qryparam.form ="q_gen"
                  CALL cl_create_qry() RETURNING g_qryparam.multiret
                  LET g_tc_fia.tc_fia07 = g_qryparam.multiret
                  DISPLAY g_qryparam.multiret TO g_tc_fia.tc_fia07
                  NEXT FIELD tc_fia07


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


    LET g_wc = g_wc CLIPPED,cl_get_extra_cond('tc_fiauser', 'tc_fiagrup')

    LET g_sql="SELECT tc_fia01 FROM tc_fia_file ",
              " WHERE ",g_wc CLIPPED,
              " ORDER BY tc_fia01"
    PREPARE i100_prepare FROM g_sql
        IF STATUS THEN CALL cl_err('prepare:',STATUS,0) RETURN END IF
    DECLARE i100_cs
        SCROLL CURSOR WITH HOLD FOR i100_prepare

    DECLARE cemi100_list_cur
        SCROLL CURSOR WITH HOLD FOR i100_prepare

    LET g_sql= "SELECT COUNT(*) FROM tc_fia_file ",
               " WHERE ",g_wc CLIPPED
    PREPARE i100_count_pre   FROM g_sql
    DECLARE i100_count CURSOR FOR i100_count_pre #CKP
END FUNCTION

FUNCTION i100_menu()
    MENU ""

        BEFORE MENU
            CALL cl_navigator_setting( g_curs_index, g_row_count )

        ON ACTION insert
            LET g_action_choice="insert"
            IF cl_chk_act_auth() THEN
                 CALL i100_a()
            END IF
        ON ACTION query
            LET g_action_choice="query"
            IF cl_chk_act_auth() THEN
                 CALL i100_q()
            END IF
            NEXT OPTION "next"

        ON ACTION next
            CALL i100_fetch('N')

        ON ACTION item_list
            LET g_action_choice = ""
            CALL i100_b_menu()
            LET g_action_choice = ""

        ON ACTION previous
            CALL i100_fetch('P')

        ON ACTION modify
            LET g_action_choice="modify"
            IF cl_chk_act_auth() THEN
                 CALL i100_u()
            END IF
            NEXT OPTION "next"

        ON ACTION invalid
            LET g_action_choice="invalid"
            IF cl_chk_act_auth() THEN
                 CALL i100_x()
            END IF
            NEXT OPTION "next"

        ON ACTION delete
            LET g_action_choice="delete"
            IF cl_chk_act_auth() THEN
                 CALL i100_r()
            END IF
            NEXT OPTION "next"

       ON ACTION output
            LET g_action_choice="output"
            IF cl_chk_act_auth()
               THEN CALL i100_out()
            END IF
        #ON ACTION related_document    #No.MOD-470515
        #  LET g_action_choice="related_document"
        #  IF cl_chk_act_auth() THEN
        #     IF g_tc_fia.tc_fia01 IS NOT NULL THEN
        #        LET g_doc.column1 = "tc_fia01"
        #        LET g_doc.value1 = g_tc_fia.tc_fia01
        #        CALL cl_doc()
        #     END IF
        #  END IF

       ON ACTION help
           CALL cl_show_help()

       ON ACTION locale
          CALL cl_dynamic_locale()
          CALL cl_show_fld_cont()                   #No.FUN-550037 hmf


       ON ACTION confirm
          LET g_action_choice="confirm"
          IF cl_chk_act_auth() THEN
               CALL i100_confirm()
          END IF

       ON ACTION undo_confirm
          LET g_action_choice="undo_confirm"
          IF cl_chk_act_auth() THEN
               CALL i100_undo_confirm()
          END IF

       ON ACTION void
          LET g_action_choice="void"
          IF cl_chk_act_auth() THEN
               CALL i100_void()
          END IF

       ON ACTION undo_void
          LET g_action_choice="undo_void"
          IF cl_chk_act_auth() THEN
               CALL i100_undo_void()
          END IF
       ON ACTION exit
           LET g_action_choice = "exit"
           EXIT MENU
        ON ACTION jump
            CALL i100_fetch('/')
        ON ACTION first
            CALL i100_fetch('F')
        ON ACTION last
            CALL i100_fetch('L')

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
    CLOSE i100_cs
END FUNCTION


FUNCTION i100_a()
    IF s_shut(0) THEN RETURN END IF
    MESSAGE ""
    CLEAR FORM                                   # 清螢幕欄位內容
    INITIALIZE g_tc_fia.* LIKE tc_fia_file.*
    LET g_tc_fia01_t        = NULL
    CALL cl_opmsg('a')
    WHILE TRUE
        #LET g_tc_fia.tc_fia20 = 20
        #LET g_tc_fia.tc_fia21 = 10
        #LET g_tc_fia.tc_fiaacti ='Y'                   #有效的資料
        #LET g_tc_fia.tc_fia14 ='Y'                     #有效的資料
        # LET g_tc_fia.tc_fia08 ='N'                     #有效的資料  #No.MOD-470506
        #LET g_tc_fia.tc_fia15 ='1'                     #有效的資料
        #LET g_tc_fia.tc_fia16 ='1'                     #有效的資料
        #LET g_tc_fia.tc_fia17 ='1'                     #有效的資料
        #LET g_tc_fia.tc_fia18 ='1'                     #有效的資料
        #LET g_tc_fia.tc_fia19 ='1'                     #有效的資料
        #LET g_tc_fia.tc_fia05 =0                       #有效的資料no:5153
        #LET g_tc_fia.tc_fia07 =0                       #有效的資料no:5153
        #LET g_tc_fia.tc_fia10 =0                       #有效的資料no:5153
        #LET g_tc_fia.tc_fia22 =0                       #有效的資料no:5153
        LET g_tc_fia.tc_fiauser = g_user               #使用者
        LET g_tc_fia.tc_fiaoriu = g_user #FUN-980030
        LET g_tc_fia.tc_fiaorig = g_grup #FUN-980030
        LET g_tc_fia.tc_fiagrup = g_grup               #使用者所屬群
        LET g_tc_fia.tc_fiadate = g_today
        DISPLAY BY NAME g_tc_fia.tc_fia01, g_tc_fia.tc_fia14, g_tc_fia.tc_fia15,
                        g_tc_fia.tc_fia16, g_tc_fia.tc_fia17, g_tc_fia.tc_fia18,
                        g_tc_fia.tc_fia19, g_tc_fia.tc_fia20, g_tc_fia.tc_fia21
        CALL i100_i("a")                         # 各欄位輸入
        IF INT_FLAG THEN                         # 若按了DEL鍵
            LET INT_FLAG = 0
            INITIALIZE g_tc_fia.*  TO NULL
            CALL cl_err('',9001,0)
            CLEAR FORM
            EXIT WHILE
        END IF
        IF cl_null(g_tc_fia.tc_fia01) THEN # KEY 不可空白
            CONTINUE WHILE
        END IF
        INSERT INTO tc_fia_file VALUES(g_tc_fia.*)       # DISK WRITE
        DISPLAY SQLCA.SQLCODE
        IF SQLCA.sqlcode THEN
            CALL cl_err3("ins","tc_fia_file",g_tc_fia.tc_fia01,"",SQLCA.sqlcode,"","",1)  #No.FUN-660136
            CONTINUE WHILE
        ELSE
            LET g_tc_fia_t.* = g_tc_fia.*                # 保存上筆資料
            SELECT tc_fia01 INTO g_tc_fia.tc_fia01 FROM tc_fia_file
             WHERE tc_fia01 = g_tc_fia.tc_fia01
        END IF
        EXIT WHILE
    END WHILE
END FUNCTION

FUNCTION i100_i(p_cmd)
    DEFINE
        p_cmd           LIKE type_file.chr1,         #No.FUN-680070 VARCHAR(1)
        g_cmd           LIKE type_file.chr1000,      #No.FUN-680070 VARCHAR(100)
        l_flag          LIKE type_file.chr1,                 #判斷必要欄位是否有輸入       #No.FUN-680070 VARCHAR(1)
        l_modify_flag   LIKE type_file.chr1,         #No.FUN-680070 VARCHAR(1)
        l_lock_sw       LIKE type_file.chr1,         #No.FUN-680070 VARCHAR(1)
        l_exit_sw       LIKE type_file.chr1,         #No.FUN-680070 VARCHAR(1)
        l_n             LIKE type_file.num5         #No.FUN-680070 SMALLINT

    INPUT BY NAME g_tc_fia.tc_fia01,g_tc_fia.tc_fia02,g_tc_fia.tc_fia03,g_tc_fia.tc_fia04,g_tc_fia.tc_fia05,
                  g_tc_fia.tc_fia06,g_tc_fia.tc_fia07,g_tc_fia.tc_fia08,g_tc_fia.tc_fia09,g_tc_fia.tc_fia10,
                  g_tc_fia.tc_fia11,g_tc_fia.tc_fia12,g_tc_fia.tc_fia13,g_tc_fia.tc_fia14,g_tc_fia.tc_fia15,
                  g_tc_fia.tc_fia16,g_tc_fia.tc_fia17,g_tc_fia.tc_fia18,g_tc_fia.tc_fia19,g_tc_fia.tc_fia20,
                  g_tc_fia.tc_fia21,g_tc_fia.tc_fia22,g_tc_fia.tc_fia23,g_tc_fia.tc_fia24,g_tc_fia.tc_fia25
                  #g_tc_fia.tc_fia27,g_tc_fia.tc_fia28,g_tc_fia.tc_fia29,g_tc_fia.tc_fia30,g_tc_fia.tc_fia31,
                  #g_tc_fia.tc_fia33,g_tc_fia.tc_fia34,g_tc_fia.tc_fia35,g_tc_fia.tc_fia36,g_tc_fia.tc_fia37,
                  #g_tc_fia.tc_fia38,g_tc_fia.tc_fia39,g_tc_fia.tc_fia40,g_tc_fia.tc_fia41,g_tc_fia.tc_fia42
                WITHOUT DEFAULTS

    BEFORE INPUT
      MESSAGE "Enter customer information..."

    ON ACTION controlp
           CASE
              WHEN INFIELD(tc_fia14)
                  CALL cl_init_qry_var()
                  LET g_qryparam.state = 'i'
                  LET g_qryparam.form ="q_gem"
                  CALL cl_create_qry() RETURNING g_qryparam.multiret
                  LET g_tc_fia.tc_fia14 = g_qryparam.multiret
                  DISPLAY g_qryparam.multiret TO g_tc_fia.tc_fia14
                  NEXT FIELD tc_fia14

               WHEN INFIELD(tc_fia15)
                  CALL cl_init_qry_var()
                  LET g_qryparam.state = 'i'
                  LET g_qryparam.form ="q_gen"
                  CALL cl_create_qry() RETURNING g_qryparam.multiret
                  LET g_tc_fia.tc_fia15 = g_qryparam.multiret
                  DISPLAY g_qryparam.multiret TO g_tc_fia.tc_fia15
                  NEXT FIELD tc_fia15

              WHEN INFIELD(tc_fia07)
                  CALL cl_init_qry_var()
                  LET g_qryparam.state = 'i'
                  LET g_qryparam.form ="q_gen"
                  CALL cl_create_qry() RETURNING g_qryparam.multiret
                  LET g_tc_fia.tc_fia07 = g_qryparam.multiret
                  DISPLAY g_qryparam.multiret TO g_tc_fia.tc_fia07
                  NEXT FIELD tc_fia07


              OTHERWISE EXIT CASE
           END CASE

    AFTER INPUT
      MESSAGE "Input terminated..."
  END INPUT
END FUNCTION



FUNCTION i100_q()

    LET g_row_count = 0
    LET g_curs_index = 0
    CALL cl_navigator_setting( g_curs_index, g_row_count )
    INITIALIZE g_tc_fia.* TO NULL             #No.FUN-6A0001
    MESSAGE ""
    CALL cl_opmsg('q')
    DISPLAY '   ' TO FORMONLY.cnt
    CALL i100_cs()                          # 宣告 SCROLL CURSOR
    IF INT_FLAG THEN
        LET INT_FLAG = 0
        CLEAR FORM
        RETURN
    END IF
    OPEN i100_count
    FETCH i100_count INTO g_row_count
    DISPLAY g_row_count TO FORMONLY.cnt
    OPEN i100_cs                            # 從DB產生合乎條件TEMP(0-30秒)
    IF SQLCA.sqlcode THEN
        CALL cl_err(g_tc_fia.tc_fia01,SQLCA.sqlcode,0)
        INITIALIZE g_tc_fia.* TO NULL
    ELSE
        CALL i100_fetch('F')                  # 讀出TEMP第一筆並顯示
        CALL i100_list_fill()
        LET g_bp_flag = 'list'
    END IF
END FUNCTION

FUNCTION i100_fetch(p_fltc_fia)
    DEFINE
        p_fltc_fia          LIKE type_file.chr1,         #No.FUN-680070 VARCHAR(1)
        l_abso          LIKE type_file.num10        #No.FUN-680070 INTEGER

    CASE p_fltc_fia
        WHEN 'N' FETCH NEXT     i100_cs INTO g_tc_fia.tc_fia01
        WHEN 'P' FETCH PREVIOUS i100_cs INTO g_tc_fia.tc_fia01
        WHEN 'F' FETCH FIRST    i100_cs INTO g_tc_fia.tc_fia01
        WHEN 'L' FETCH LAST     i100_cs INTO g_tc_fia.tc_fia01
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
         FETCH ABSOLUTE g_jump i100_cs INTO g_tc_fia.tc_fia01
         LET g_no_ask = FALSE
    END CASE
    IF SQLCA.sqlcode THEN
        CALL cl_err(g_tc_fia.tc_fia01,SQLCA.sqlcode,0)
        INITIALIZE g_tc_fia.* TO NULL  #TQC-6B0105
        RETURN
    ELSE
       CASE p_fltc_fia
          WHEN 'F' LET g_curs_index = 1
          WHEN 'P' LET g_curs_index = g_curs_index - 1
          WHEN 'N' LET g_curs_index = g_curs_index + 1
          WHEN 'L' LET g_curs_index = g_row_count
          WHEN '/' LET g_curs_index = g_jump #CKP3
       END CASE

       CALL cl_navigator_setting( g_curs_index, g_row_count )
    END IF
    SELECT * INTO g_tc_fia.* FROM tc_fia_file        # 重讀DB,因TEMP有不被更新特性
       WHERE tc_fia01 = g_tc_fia.tc_fia01
    IF SQLCA.sqlcode THEN
       CALL cl_err3("sel","tc_fia_file",g_tc_fia.tc_fia01,"",SQLCA.sqlcode,"","",1)  #No.FUN-660136
    ELSE
        LET g_data_owner = g_tc_fia.tc_fiauser  #FUN-4C0059
        LET g_data_group = g_tc_fia.tc_fiagrup  #FUN-4C0059
        CALL i100_show()                      # 重新顯示
    END IF
END FUNCTION

FUNCTION i100_show()
    LET g_tc_fia_t.* = g_tc_fia.*
    LET g_tc_fia_o.*=g_tc_fia.*
    DISPLAY BY NAME g_tc_fia.tc_fia01,g_tc_fia.tc_fia02,g_tc_fia.tc_fia03,g_tc_fia.tc_fia04,g_tc_fia.tc_fia05,
                    g_tc_fia.tc_fia06,g_tc_fia.tc_fia07,g_tc_fia.tc_fia08,g_tc_fia.tc_fia09,g_tc_fia.tc_fia10,
                    g_tc_fia.tc_fia11,g_tc_fia.tc_fia12,g_tc_fia.tc_fia13,g_tc_fia.tc_fia14,g_tc_fia.tc_fia15,
                    g_tc_fia.tc_fia16,g_tc_fia.tc_fia17,g_tc_fia.tc_fia18,g_tc_fia.tc_fia19,g_tc_fia.tc_fia20,
                    g_tc_fia.tc_fia21,g_tc_fia.tc_fia22,g_tc_fia.tc_fia23,g_tc_fia.tc_fia24,g_tc_fia.tc_fia25,
                    g_tc_fia.tc_fia26

                    #g_tc_fia.tc_fiaacti,g_tc_fia.tc_fiauser,g_tc_fia.tc_fiagrup,g_tc_fia.tc_fiamodu,
                    #g_tc_fia.tc_fiadate,g_tc_fia.tc_fiaoriu,g_tc_fia.tc_fiaorig
    DISPLAY BY NAME  g_tc_fia.tc_fiaacti,g_tc_fia.tc_fiauser,g_tc_fia.tc_fiagrup,g_tc_fia.tc_fiamodu,
                     g_tc_fia.tc_fiadate,g_tc_fia.tc_fiaoriu,g_tc_fia.tc_fiaorig

     CALL cl_set_field_pic(g_tc_fia.tc_fia26,'N',"","",g_tc_fia.tc_fia25,'N')
    CALL cl_show_fld_cont()                   #No.FUN-550037 hmf
END FUNCTION

FUNCTION i100_u()
    IF s_shut(0) THEN RETURN END IF
    IF g_tc_fia.tc_fia01 IS NULL THEN
        CALL cl_err('',-400,0)
        RETURN
    END IF
    SELECT * INTO g_tc_fia.* FROM tc_fia_file WHERE tc_fia01 = g_tc_fia.tc_fia01
    IF g_tc_fia.tc_fiaacti ='N' THEN    #檢查資料是否為無效
        CALL cl_err(g_tc_fia.tc_fia01,'9027',0)
        RETURN
    END IF
    MESSAGE ""
    CALL cl_opmsg('u')
    LET g_tc_fia01_t = g_tc_fia.tc_fia01
    BEGIN WORK

    OPEN i100_cl USING g_tc_fia.tc_fia01

    IF STATUS THEN
       CALL cl_err("OPEN i100_cl:", STATUS, 1)
       CLOSE i100_cl
       ROLLBACK WORK
       RETURN
    END IF
    FETCH i100_cl INTO g_tc_fia.*               # 對DB鎖定
    IF SQLCA.sqlcode THEN
        CALL cl_err(g_tc_fia.tc_fia01,SQLCA.sqlcode,0)
        RETURN
    END IF
    LET g_tc_fia.tc_fiamodu=g_user                     #修改者
    LET g_tc_fia.tc_fiadate = g_today                  #修改日期
    CALL i100_show()                             # 顯示最新資料
    WHILE TRUE
        CALL i100_i("u")                         # 欄位更改
        IF INT_FLAG THEN
            LET INT_FLAG = 0
            LET g_tc_fia.*=g_tc_fia_t.*
            CALL i100_show()
            CALL cl_err('',9001,0)
            EXIT WHILE
        END IF
        UPDATE tc_fia_file SET tc_fia_file.* = g_tc_fia.*    # 更新DB
            WHERE tc_fia01 = g_tc_fia01_t
        IF SQLCA.sqlcode THEN
            CALL cl_err3("upd","tc_fia_file",g_tc_fia01_t,"",SQLCA.sqlcode,"","",1)  #No.FUN-660136
            CONTINUE WHILE
        END IF
        EXIT WHILE
    END WHILE
    CLOSE i100_cl
    COMMIT WORK
END FUNCTION

FUNCTION i100_x()
    DEFINE
        l_chr LIKE type_file.chr1         #No.FUN-680070 VARCHAR(1)

    IF s_shut(0) THEN RETURN END IF
    IF g_tc_fia.tc_fia01 IS NULL THEN
        CALL cl_err('',-400,0)
        RETURN
    END IF
    BEGIN WORK

    OPEN i100_cl USING g_tc_fia.tc_fia01

    IF STATUS THEN
       CALL cl_err("OPEN i100_cl:", STATUS, 1)
       CLOSE i100_cl
       ROLLBACK WORK
       RETURN
    END IF
    FETCH i100_cl INTO g_tc_fia.*
    IF SQLCA.sqlcode THEN
        CALL cl_err(g_tc_fia.tc_fia01,SQLCA.sqlcode,0)
        RETURN
    END IF
    CALL i100_show()
    IF cl_exp(15,21,g_tc_fia.tc_fiaacti) THEN
        LET g_chr=g_tc_fia.tc_fiaacti
        IF g_tc_fia.tc_fiaacti='Y' THEN
            LET g_tc_fia.tc_fiaacti='N'
        ELSE
            LET g_tc_fia.tc_fiaacti='Y'
        END IF
        UPDATE tc_fia_file
            SET tc_fiaacti=g_tc_fia.tc_fiaacti,
                tc_fiamodu=g_user, tc_fiadate=g_today
            WHERE tc_fia01=g_tc_fia.tc_fia01
        IF SQLCA.SQLERRD[3]=0 THEN
            CALL cl_err3("upd","tc_fia_file",g_tc_fia.tc_fia01,"",SQLCA.sqlcode,"","",1)  #No.FUN-660136
            LET g_tc_fia.tc_fiaacti=g_chr
        END IF
        DISPLAY BY NAME g_tc_fia.tc_fiaacti
    END IF
    CLOSE i100_cl
    COMMIT WORK
END FUNCTION

FUNCTION i100_r()
    DEFINE
        l_chr LIKE type_file.chr1         #No.FUN-680070 VARCHAR(1)

    IF s_shut(0) THEN RETURN END IF
    IF g_tc_fia.tc_fia01 IS NULL THEN
        CALL cl_err('',-400,0)
        RETURN
    END IF
    IF g_tc_fia.tc_fiaacti = 'N' THEN
        CALL cl_err('','abm-950',0)
        RETURN
    END IF
    BEGIN WORK

    OPEN i100_cl USING g_tc_fia.tc_fia01

    IF STATUS THEN
       CALL cl_err("OPEN i100_cl:", STATUS, 1)
       CLOSE i100_cl
       ROLLBACK WORK
       RETURN
    END IF
    FETCH i100_cl INTO g_tc_fia.*
    IF SQLCA.sqlcode THEN
        CALL cl_err(g_tc_fia.tc_fia01,SQLCA.sqlcode,0)
        RETURN
    END IF
    CALL i100_show()
    IF cl_delete() THEN
        INITIALIZE g_doc.* TO NULL          #No.FUN-9B0098 10/02/24
        LET g_doc.column1 = "tc_fia01"         #No.FUN-9B0098 10/02/24
        LET g_doc.value1 = g_tc_fia.tc_fia01      #No.FUN-9B0098 10/02/24
        CALL cl_del_doc()                                         #No.FUN-9B0098 10/02/24
       DELETE FROM tc_fia_file WHERE tc_fia01 = g_tc_fia.tc_fia01
       IF SQLCA.SQLERRD[3]=0 THEN
          CALL cl_err3("del","tc_fia_file",g_tc_fia.tc_fia01,"",SQLCA.sqlcode,"","",1)  #No.FUN-660136
       ELSE CLEAR FORM
         OPEN i100_count
         FETCH i100_count INTO g_row_count
         DISPLAY g_row_count TO FORMONLY.cnt
         OPEN i100_cs
         IF g_curs_index = g_row_count + 1 THEN
            LET g_jump = g_row_count
            CALL i100_fetch('L')
         ELSE
            LET g_jump = g_curs_index
            LET g_no_ask = TRUE
            CALL i100_fetch('/')
         END IF
       END IF
    END IF
    CLOSE i100_cl
    COMMIT WORK
END FUNCTION

FUNCTION i100_out()
    DEFINE
        l_i             LIKE type_file.num5,         #No.FUN-680070 SMALLINT
        l_name          LIKE type_file.chr20,        # External(Disk) file name       #No.FUN-680070 VARCHAR(20)
        l_za05          LIKE za_file.za05,           #No.FUN-680070 VARCHAR(40)
        l_chr           LIKE type_file.chr1,         #No.FUN-680070 VARCHAR(1)
        sr       RECORD LIKE tc_fia_file.*

    IF g_wc IS NULL THEN
        CALL cl_err('','9057',0)
        RETURN
    END IF
    CALL cl_wait()
    CALL cl_outnam('cemi100') RETURNING l_name
    SELECT zo02 INTO g_company FROM zo_file WHERE zo01 = g_lang
    LET g_sql="SELECT * FROM tc_fia_file ",          # 組合出 SQL 指令
              " WHERE ",g_wc CLIPPED


    # 是否列印選擇條件
    IF g_zz05 = 'Y' THEN
       CALL cl_wcchp(g_wc,'tc_fia01')
            RETURNING g_wc
       LET g_str = g_wc
    END IF
    #CALL cl_prt_cs1('cemi100','cemi100',g_sql,g_wc)

END FUNCTION
FUNCTION i100_b_menu()
   DEFINE   l_priv1   LIKE zy_file.zy03,
            l_priv2   LIKE zy_file.zy04,
            l_priv3   LIKE zy_file.zy05
   DEFINE   l_cmd     LIKE type_file.chr1000

   WHILE TRUE

      CALL i100_bp("G")

      IF NOT cl_null(g_action_choice) AND l_ac1>0 THEN #將清單的資料回傳到主畫面
         SELECT tc_fia_file.*
           INTO g_tc_fia.*
           FROM tc_fia_file
          WHERE tc_fia01=g_tc_fia_1[l_ac1].tc_fia01
      END IF

      IF g_action_choice!= "" THEN
         LET g_bp_flag = 'main'
         LET l_ac1 = ARR_CURR()
         LET g_jump = l_ac1
         LET mi_no_ask = TRUE
         IF g_rec_b1 >0 THEN
             CALL i100_fetch('/')
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
                     CALL i100_a()
                END IF
            ELSE
                CALL cl_err('','aim-152',1)
                #不使用客戶申請作業時,才可按新增!
            END IF
            EXIT WHILE

        WHEN "query"
            IF cl_chk_act_auth() THEN
               CALL i100_q()
            END IF
            EXIT WHILE

        WHEN "delete"
            IF cl_chk_act_auth() THEN
               CALL i100_r()
               CALL i100_AFTER_DEL()
            END IF

        WHEN "modify"
            IF cl_chk_act_auth() THEN
               CALL i100_u()
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

FUNCTION i100_AFTER_DEL()
   OPEN i100_count
   FETCH i100_count INTO g_row_count
   DISPLAY g_row_count TO FORMONLY.cnt
   OPEN i100_cs
   IF g_curs_index = g_row_count + 1 THEN
      LET g_jump = g_row_count
      CALL i100_fetch('L')
   ELSE
      LET g_jump = g_curs_index
      LET mi_no_ask = TRUE     #No.FUN-6A0061
      CALL i100_fetch('/')
   END IF
END FUNCTION



FUNCTION i100_bp(p_ud)
   DEFINE   p_ud      LIKE type_file.chr1

   IF p_ud <> "G" OR g_action_choice = "detail" THEN
      RETURN
   END IF

   LET g_action_choice = " "

   CALL cl_set_act_visible("accept,cancel", FALSE)

   DISPLAY ARRAY g_tc_fia_1 TO s_tc_fia.* ATTRIBUTE(COUNT=g_rec_b1,UNBUFFERED)

      BEFORE DISPLAY
         CALL cl_navigator_setting(g_curs_index, g_row_count)
         IF g_rec_b1 != 0 THEN
            CALL fgl_set_arr_curr(g_curs_index)
         END IF

      BEFORE ROW
         LET l_ac1 = ARR_CURR()
         CALL cl_show_fld_cont()

      ON ACTION main
         LET g_bp_flag = 'main'
         LET l_ac1 = ARR_CURR()
         LET g_jump = l_ac1
         LET mi_no_ask = TRUE
         IF g_rec_b1 >0 THEN
             CALL i100_fetch('/')
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
         LET mi_no_ask = TRUE
         LET g_bp_flag = NULL
         CALL i100_fetch('/')
         CALL cl_set_comp_visible("info", FALSE)
         CALL cl_set_comp_visible("info", TRUE)
         CALL cl_set_comp_visible("page112", FALSE)   #NO.FUN-840018 ADD
         CALL ui.interface.refresh()                  #NO.FUN-840018 ADD
         CALL cl_set_comp_visible("page112", TRUE)    #NO.FUN-840018 ADD
         EXIT DISPLAY

      ON ACTION first
         CALL i100_fetch('F')
         CALL cl_navigator_setting(g_curs_index, g_row_count)
         IF g_rec_b1 != 0 THEN
            CALL fgl_set_arr_curr(g_curs_index)
         END IF
         CONTINUE DISPLAY

      ON ACTION previous
         CALL i100_fetch('P')
         CALL cl_navigator_setting(g_curs_index, g_row_count)
         IF g_rec_b1 != 0 THEN
            CALL fgl_set_arr_curr(g_curs_index)
         END IF
         CONTINUE DISPLAY

      ON ACTION jump
         CALL i100_fetch('/')
         CALL cl_navigator_setting(g_curs_index, g_row_count)
         IF g_rec_b1 != 0 THEN
            CALL fgl_set_arr_curr(g_curs_index)
         END IF
         CONTINUE DISPLAY

      ON ACTION next
         CALL i100_fetch('N')
         CALL cl_navigator_setting(g_curs_index, g_row_count)
         IF g_rec_b1 != 0 THEN
            CALL fgl_set_arr_curr(g_curs_index)
         END IF
         CONTINUE DISPLAY

      ON ACTION last
         CALL i100_fetch('L')
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

FUNCTION i100_list_fill()
  DEFINE l_tc_fia01         LIKE tc_fia_file.tc_fia01
  DEFINE l_i             LIKE type_file.num10

    CALL g_tc_fia_1.clear()
    LET l_i = 1
    LET g_sql = "SELECT tc_fia01,tc_fia02,tc_fia03,tc_fia04,tc_fia05,tc_fia06,",
                "       tc_fia07,tc_fia08,tc_fia09,tc_fia10||(case tc_fia11 WHEN '1' THEN '天' WHEN '2' THEN '周' WHEN '3' THEN '月' WHEN '4'  THEN '年' END ),",
                "       tc_fia12,tc_fia13,tc_fia14,tc_fia15,tc_fia16,tc_fia17,",
                "       tc_fia18,tc_fia19,tc_fia20,tc_fia21,tc_fia22,tc_fia23,",
                "       tc_fia24,tc_fia25,tc_fia26",
                " FROM tc_fia_file",
                " WHERE tc_fia01= ?"
    PREPARE i100_tc_fia_p FROM g_sql
    DECLARE i100_tc_fia_cur CURSOR FOR i100_tc_fia_p

    FOREACH cemi100_list_cur INTO l_tc_fia01
       IF SQLCA.sqlcode THEN
          CALL cl_err('foreach item_cur',SQLCA.sqlcode,1)
          CONTINUE FOREACH
       END IF

       EXECUTE i100_tc_fia_cur USING l_tc_fia01 INTO g_tc_fia_1[l_i].*
       LET l_i = l_i + 1
       IF l_i > g_max_rec THEN
          CALL cl_err( '', 9035, 0 )
          EXIT FOREACH
       END IF
    END FOREACH
    LET g_rec_b1 = l_i - 1
    DISPLAY ARRAY g_tc_fia_1 TO s_tc_fia.* ATTRIBUTE(COUNT=g_rec_b1,UNBUFFERED)
       BEFORE DISPLAY
          EXIT DISPLAY
    END DISPLAY

END FUNCTION

FUNCTION i100_set_entry(p_cmd)
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

FUNCTION i100_set_no_entry(p_cmd)
DEFINE   p_cmd   LIKE type_file.chr1         #No.FUN-680070 VARCHAR(1)


END FUNCTION

FUNCTION i100_confirm()

  IF cl_null(g_tc_fia.tc_fia01) THEN
      CALL cl_err('设备编号为空！不可审核','!','0')
      RETURN
  END IF

  SELECT *
    INTO g_tc_fia.*
    FROM tc_fia_file
   WHERE tc_fia01 = g_tc_fia.tc_fia01

  IF SQLCA.sqlcode THEN
    CALL cl_err('g_tc_fia.tc_fia01',SQLCA.sqlcode,1)
    RETURN
  END IF

  IF g_tc_fia.tc_fia25 <> 'N' THEN
      CALL cl_err('资料状态已作废！不可审核','!','0')
      RETURN
  END IF

  IF g_tc_fia.tc_fia26 <> 'N' THEN
      CALL cl_err('资料状态不为未审核！不可审核','!','0')
      RETURN
  END IF

  IF cl_null(g_tc_fia.tc_fia10) OR cl_null(g_tc_fia.tc_fia11) THEN
      CALL cl_err('未维护维保周期！不可审核','!','0')
      RETURN
  END IF

  IF cl_confirm('cem-001') THEN
      UPDATE tc_fia_file
         SET tc_fia26 = 'Y'
       WHERE tc_fia01 = g_tc_fia.tc_fia01
  END IF
  CALL i100_show()
END FUNCTION

FUNCTION i100_undo_confirm()
  DEFINE l_cnt    LIKE type_file.num5

  IF cl_null(g_tc_fia.tc_fia01) THEN
      CALL cl_err('设备编号为空！不可审核','!','0')
      RETURN
  END IF

  SELECT *
    INTO g_tc_fia.*
    FROM tc_fia_file
   WHERE tc_fia01 = g_tc_fia.tc_fia01

  IF SQLCA.sqlcode THEN
    CALL cl_err('g_tc_fia.tc_fia01',SQLCA.sqlcode,1)
    RETURN
  END IF

  LET l_cnt = 0
  SELECT COUNT(1)
    INTO l_cnt
    FROM tc_fib_file
    WHERE tc_fib05 = g_tc_fia01
  IF l_cnt > 0 THEN
      CALL cl_err('已有维保记录！不可取消审核','!','0')
      RETURN
  END IF

  IF g_tc_fia.tc_fia26 <> 'Y' THEN
      CALL cl_err('资料状态不为审核！不可取消审核','!','0')
      RETURN
  END IF

  IF cl_confirm('cem-002') THEN
      UPDATE tc_fia_file
         SET tc_fia26 = 'N'
       WHERE tc_fia01 = g_tc_fia.tc_fia01

  END IF
  CALL i100_show()
END FUNCTION

FUNCTION i100_void()

  UPDATE tc_fia_file
         SET tc_fia26 = 'Y'
       WHERE tc_fia01 = g_tc_fia.tc_fia01
  CALL i100_show()
END FUNCTION

FUNCTION i100_undo_void()
  UPDATE tc_fia_file
         SET tc_fia26 = 'N'
       WHERE tc_fia01 = g_tc_fia.tc_fia01
  CALL i100_show()
END FUNCTION