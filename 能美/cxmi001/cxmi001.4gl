# Prog. Version..: '1.20.01-05.08.29(01)'     #
#
# Pattern name...: cxmi001.4gl
# Descriptions...: 常用說明維護作業
# Date & Author..: 94/12/16 By Danny
 # Modify.........: 04/07/19 By Wiky MODNO:MOD-470041 修改INSERT INTO...
# Modify.........: No.FUN-4B0038 04/11/15 By Smapin ARRAY轉為EXCEL檔
# Modify.........: No:FUN-4C0057 04/12/09 By Caroml Q,U,R 加入權限控管處理
# Modify.........: No:FUN-4C0096 04/12/21 By Carol 修改報表架構轉XML
# Modify.........: No:FUN-4C0096 04/12/21 By Carol 修改報表架構轉XML
#

DATABASE ds

GLOBALS "../../../tiptop/config/top.global"

#模組變數(Module Variables)
DEFINE
    g_tc_oqd DYNAMIC ARRAY OF RECORD
          tc_oqd02    LIKE tc_oqd_file.tc_oqd02,
          ima02       LIKE ima_file.ima02,
          ima021      LIKE ima_file.ima021,
          tc_oqd03    LIKE tc_oqd_file.tc_oqd03,
          tc_oqd04    LIKE tc_oqd_file.tc_oqd04,
          tc_oqd05    LIKE tc_oqd_file.tc_oqd05,
          tc_oqd06    LIKE tc_oqd_file.tc_oqd06
                END RECORD,
    g_tc_oqd_o   RECORD
          tc_oqd01    LIKE tc_oqd_file.tc_oqd01,
          tc_oqd02    LIKE tc_oqd_file.tc_oqd02,
          ima02       LIKE ima_file.ima02,
          ima021      LIKE ima_file.ima021,
          tc_oqd03    LIKE tc_oqd_file.tc_oqd03,
          tc_oqd04    LIKE tc_oqd_file.tc_oqd04,
          tc_oqd05    LIKE tc_oqd_file.tc_oqd05,
          tc_oqd06    LIKE tc_oqd_file.tc_oqd06
                END RECORD,
    g_tc_oqd_t   RECORD
          tc_oqd01    LIKE tc_oqd_file.tc_oqd01,
          tc_oqd02    LIKE tc_oqd_file.tc_oqd02,
          ima02       LIKE ima_file.ima02,
          ima021      LIKE ima_file.ima021,
          tc_oqd03    LIKE tc_oqd_file.tc_oqd03,
          tc_oqd04    LIKE tc_oqd_file.tc_oqd04,
          tc_oqd05    LIKE tc_oqd_file.tc_oqd05,
          tc_oqd06    LIKE tc_oqd_file.tc_oqd06
                END RECORD,
    g_tc_oqd01_t       LIKE tc_oqd_file.tc_oqd01,
    g_tc_oqd01         LIKE tc_oqd_file.tc_oqd01,
    g_tc_oqd_rowid CHAR(18),               #ROWID
    tm          RECORD
          wc          STRING,
          tc_oqd02    LIKE tc_oqd_file.tc_oqd02,
          tc_oqd03    LIKE tc_oqd_file.tc_oqd03,
          tc_oqd04    LIKE tc_oqd_file.tc_oqd04,
          tc_oqd05    LIKE tc_oqd_file.tc_oqd05,
          tc_oqd06    LIKE tc_oqd_file.tc_oqd06
                END RECORD,
    g_wc,g_wc2,g_sql    VARCHAR(300),
    g_rec_b         SMALLINT,              #單身筆數
    l_ac            SMALLINT,              #目前處理的ARRAY CNT
    l_cmd           VARCHAR(200)

DEFINE g_forupd_sql STRING   #SELECT ... FOR UPDATE NOWAIT SQL
DEFINE g_before_input_done  SMALLINT
DEFINE p_row,p_col     SMALLINT

#主程式開始
DEFINE   g_cnt           INTEGER
DEFINE   g_i             SMALLINT   #count/index for any purpose
DEFINE   g_msg           VARCHAR(72)

# 2004/02/06 by Hiko : 為了上下筆資料的控制而加的變數.
DEFINE   g_curs_index   INTEGER
DEFINE   g_row_count    INTEGER
DEFINE   g_jump         INTEGER
DEFINE   mi_no_ask       SMALLINT

MAIN
DEFINE
    l_time        VARCHAR(8)                  #計算被使用時間

    OPTIONS                                #改變一些系統預設值
        FORM LINE       FIRST + 2,         #畫面開始的位置
        MESSAGE LINE    LAST,              #訊息顯示的位置
        PROMPT LINE     LAST,              #提示訊息的位置
        INPUT NO WRAP                      #輸入的方式: 不打轉
    DEFER INTERRUPT                        #擷取中斷鍵, 由程式處理

   IF (NOT cl_user()) THEN
      EXIT PROGRAM
   END IF

   WHENEVER ERROR CALL cl_err_msg_log

   IF (NOT cl_setup("CXM")) THEN
      EXIT PROGRAM
   END IF


      CALL cl_used(g_prog,l_time,1)       #計算使用時間 (進入時間) #No:MOD-580088  HCN 20050818
        RETURNING l_time

    LET g_forupd_sql = "SELECT * FROM tc_oqd_file WHERE ROWID = ?  FOR UPDATE NOWAIT"
    DECLARE i001_cl CURSOR FROM g_forupd_sql

    LET p_row = 2 LET p_col = 20

    OPEN WINDOW i001_w AT p_row,p_col              #顯示畫面
         WITH FORM "cxm/42f/cxmi001"
         ATTRIBUTE (STYLE = g_win_style)

    CALL cl_ui_init()



    CALL i001_menu()

    CLOSE WINDOW i001_w                 #結束畫面
      CALL cl_used(g_prog,l_time,2)    #計算使用時間 (退出使間) #No:MOD-580088  HCN 20050818
         RETURNING l_time
END MAIN

#QBE 查詢資料
FUNCTION i001_cs()

    CLEAR FORM                             #清除畫面
    CALL g_tc_oqd.clear()

    CONSTRUCT BY NAME g_wc ON tc_oqd01
       ON IDLE g_idle_seconds
          CALL cl_on_idle()
          CONTINUE CONSTRUCT

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121

      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121

      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121


    END CONSTRUCT
    IF INT_FLAG THEN RETURN END IF

    CONSTRUCT g_wc2 ON tc_oqd02,tc_oqd03,tc_oqd04,tc_oqd05,tc_oqd06        # 螢幕上取單身條件
         FROM s_tc_oqd[1].tc_oqd02,s_tc_oqd[1].tc_oqd03,s_tc_oqd[1].tc_oqd04,
              s_tc_oqd[1].tc_oqd05,s_tc_oqd[1].tc_oqd06
       ON IDLE g_idle_seconds
          CALL cl_on_idle()
          CONTINUE CONSTRUCT

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121

      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121

      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121


    END CONSTRUCT
    IF INT_FLAG THEN LET INT_FLAG=0 RETURN END IF

    IF g_wc2 = " 1=1" THEN			# 若單身未輸入條件
       LET g_sql = "SELECT  UNIQUE tc_oqd01 FROM tc_oqd_file",
                   " WHERE ", g_wc CLIPPED,
                   " ORDER BY 1"
    ELSE					# 若單身有輸入條件
       LET g_sql = "SELECT UNIQUE   tc_oqd01 ",
                   "  FROM tc_oqd_file ",
                   " WHERE tc_oqd01 = tc_oqd01" , g_wc CLIPPED,
                   " AND ",g_wc2 CLIPPED,
                   " ORDER BY 1"
    END IF

    PREPARE i001_prepare FROM g_sql
    DECLARE i001_cs                         #SCROLL CURSOR
        SCROLL CURSOR WITH HOLD FOR i001_prepare

    IF g_wc2 = " 1=1" THEN			# 取合乎條件筆數
        LET g_sql="SELECT COUNT(DISTINCT tc_oqd01) FROM tc_oqd_file WHERE ",g_wc CLIPPED
    ELSE
        LET g_sql="SELECT COUNT(DISTINCT tc_oqd01) FROM tc_oqd_file WHERE ",
                  g_wc CLIPPED," AND ",g_wc2 CLIPPED
    END IF
    PREPARE i001_precount FROM g_sql
    DECLARE i001_count CURSOR FOR i001_precount

END FUNCTION

FUNCTION i001_menu()

   WHILE TRUE
      CALL i001_bp("G")
      CASE g_action_choice
         WHEN "insert"
            IF cl_chk_act_auth() THEN
               CALL i001_a()
            END IF
         WHEN "query"
            IF cl_chk_act_auth() THEN
               CALL i001_q()
            END IF
         WHEN "delete"
            IF cl_chk_act_auth() THEN
               CALL i001_r()
            END IF
         WHEN "modify"
            IF cl_chk_act_auth() THEN
               CALL i001_b()
            END IF
         WHEN "detail"
            IF cl_chk_act_auth() THEN
               CALL i001_b()
            ELSE
               LET g_action_choice = NULL
            END IF
         WHEN "output"
            IF cl_chk_act_auth()
               THEN CALL i001_out()
            END IF
         WHEN "help"
            CALL cl_show_help()
         WHEN "exit"
            EXIT WHILE
         WHEN "controlg"
            CALL cl_cmdask()
         WHEN "exporttoexcel"     #FUN-4B0038
            IF cl_chk_act_auth() THEN
              CALL cl_export_to_excel(ui.Interface.getRootNode(),base.TypeInfo.create(g_tc_oqd),'','')
            END IF

      END CASE
   END WHILE

END FUNCTION

#Add  輸入
FUNCTION i001_a()
    IF s_shut(0) THEN RETURN END IF
    MESSAGE ""
    CLEAR FORM

    #CALL g_tc_oqd.clear()           #DEFAULT 設定
    CALL g_tc_oqd.clear()
    LET g_tc_oqd01_t = NULL
    #INITIALIZE g_tc_oqd_t.* TO NULL
    #INITIALIZE g_tc_oqd_o.* TO NULL
    INITIALIZE g_tc_oqd_t.* TO NULL
    INITIALIZE g_tc_oqd_o.* TO NULL
    CALL cl_opmsg('a')
    WHILE TRUE
        CALL i001_i("a")                   #輸入單頭
        IF INT_FLAG THEN                   #使用者不玩了
            CALL g_tc_oqd.clear()
            LET INT_FLAG = 0
            CALL cl_err('',9001,0)
            EXIT WHILE
        END IF
        IF g_tc_oqd01 IS NULL THEN                # KEY 不可空白
           CONTINUE WHILE
        END IF

        #INSERT INTO tc_oqd_file(tc_oqd01) VALUES(g_tc_oqd01)
        IF SQLCA.sqlcode THEN   			#置入資料庫不成功
           CALL cl_err(g_tc_oqd01,SQLCA.sqlcode,1)
           CONTINUE WHILE
        END IF

        LET g_tc_oqd01_t = g_tc_oqd01        #保留舊值
        INITIALIZE g_tc_oqd_t.* TO NULL

        LET g_rec_b = 0

        LET g_wc = " tc_oqd01='",g_tc_oqd01 CLIPPED

        CALL i001_b_fill(g_wc)
        CALL i001_show()
        CALL i001_b()                      #輸入單身

        EXIT WHILE
    END WHILE
END FUNCTION

FUNCTION i001_u()
    IF s_shut(0) THEN RETURN END IF
    IF g_tc_oqd01 IS NULL THEN
       CALL cl_err('',-400,0)
       RETURN
    END IF

    MESSAGE ""
    CALL cl_opmsg('u')

    LET g_tc_oqd01_t = g_tc_oqd01
    INITIALIZE g_tc_oqd_o.* TO NULL
    INITIALIZE g_tc_oqd_t.* TO NULL

    BEGIN WORK

    OPEN i001_cl USING g_tc_oqd_rowid
    IF SQLCA.sqlcode THEN
       CALL cl_err(g_tc_oqd01,SQLCA.sqlcode,0)      # 資料被他人LOCK
       CLOSE i001_cl ROLLBACK WORK RETURN
    END IF

    #FETCH i001_cl INTO g_tc_oqd.*            # 鎖住將被更改或取消的資料
    IF SQLCA.sqlcode THEN
       CALL cl_err(g_tc_oqd01,SQLCA.sqlcode,0)      # 資料被他人LOCK
       CLOSE i001_cl ROLLBACK WORK RETURN
    END IF

    CALL i001_show()

    WHILE TRUE
        LET g_tc_oqd01_t = g_tc_oqd01
        CALL i001_i("u")                      #欄位更改
        IF INT_FLAG THEN
            LET INT_FLAG = 0
            #LET g_tc_oqd.*=g_tc_oqd_t.*
            CALL i001_show()
            CALL cl_err('','9001',0)
            EXIT WHILE
        END IF

        IF g_tc_oqd01 != g_tc_oqd01_t THEN
           UPDATE tc_oqd_file SET tc_oqd01 = g_tc_oqd01 WHERE tc_oqd01 = g_tc_oqd01_t
           IF SQLCA.sqlcode THEN
              CALL cl_err('tc_oqd',SQLCA.sqlcode,0) CONTINUE WHILE
           END IF
        END IF

        #UPDATE tc_oqd_file SET tc_oqd01 = g_tc_oqd01, tc_oqd02 = g_tc_oqd.tc_oqd02
        # WHERE ROWID = g_tc_oqd_rowid
        IF SQLCA.sqlcode THEN
           CALL cl_err(g_tc_oqd01,SQLCA.sqlcode,0)
           CONTINUE WHILE
        END IF

        EXIT WHILE
    END WHILE

    CLOSE i001_cl
    COMMIT WORK

END FUNCTION

#處理INPUT
FUNCTION i001_i(p_cmd)
DEFINE
    l_flag          VARCHAR(1),               #判斷必要欄位是否有輸入
    l_n1            SMALLINT,
    p_cmd           VARCHAR(1)                #a:輸入 u:更改

    DISPLAY  g_tc_oqd01 TO tc_oqd01
    INPUT g_tc_oqd01 FROM tc_oqd01 ATTRIBUTE(WITHOUT DEFAULTS)

        BEFORE INPUT
           LET g_before_input_done = FALSE
           CALL i001_set_entry(p_cmd)
           CALL i001_set_no_entry(p_cmd)
           LET g_before_input_done = TRUE
           LET g_tc_oqd01 = YEAR(g_today)

        AFTER FIELD tc_oqd01
           IF NOT cl_null(g_tc_oqd01) THEN
              IF g_tc_oqd01 != g_tc_oqd01_t OR cl_null(g_tc_oqd01_t) THEN
                 SELECT count(*) INTO g_cnt FROM tc_oqd_file
                  WHERE tc_oqd01 = g_tc_oqd01
                 #IF g_cnt > 0 THEN   #資料重複
                 #   CALL cl_err(g_tc_oqd01,-239,0)
                 #   LET g_tc_oqd01 = g_tc_oqd01_t
                 #   DISPLAY BY NAME g_tc_oqd01
                 #   NEXT FIELD tc_oqd01
                 #END IF
              END IF
              LET g_tc_oqd_o.tc_oqd01 = g_tc_oqd01
           END IF

        ON ACTION CONTROLF                  #欄位說明
         CALL cl_set_focus_form(ui.Interface.getRootNode()) RETURNING g_fld_name,g_frm_name #Add on 040913
         CALL cl_fldhelp(g_frm_name,g_fld_name,g_lang) #Add on 040913


        ON ACTION CONTROLZ
           CALL cl_show_req_fields()

        ON ACTION CONTROLG
            CALL cl_cmdask()

       ON IDLE g_idle_seconds
          CALL cl_on_idle()
          CONTINUE INPUT

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121

      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121


    END INPUT
END FUNCTION

#Query 查詢
FUNCTION i001_q()

    LET g_row_count = 0
    LET g_curs_index = 0
    CALL cl_navigator_setting( g_curs_index, g_row_count )

    CALL cl_opmsg('q')
    MESSAGE ""
    DISPLAY '   ' TO FORMONLY.cnt
    DISPLAY '   ' TO FORMONLY.cnt1
    CALL i001_cs()
    IF INT_FLAG THEN
        LET INT_FLAG = 0
        CALL g_tc_oqd.clear()
        RETURN
    END IF

    MESSAGE " SEARCHING ! "

    OPEN i001_cs                            # 從DB產生合乎條件TEMP(0-30秒)
    IF SQLCA.sqlcode THEN
       CALL cl_err('',SQLCA.sqlcode,0)
       CALL g_tc_oqd.clear()
    ELSE
       OPEN i001_count
       FETCH i001_count INTO g_row_count
       DISPLAY g_row_count TO FORMONLY.cnt
       DISPLAY g_curs_index TO FORMONLY.cnt1
       CALL i001_fetch('F')                  # 讀出TEMP第一筆並顯示
    END IF

    MESSAGE ""

END FUNCTION

#處理資料的讀取
FUNCTION i001_fetch(p_flag)
DEFINE
    p_flag          VARCHAR(1)                #處理方式

    CASE p_flag
        WHEN 'N' FETCH NEXT     i001_cs INTO g_tc_oqd01
        WHEN 'P' FETCH PREVIOUS i001_cs INTO g_tc_oqd01
        WHEN 'F' FETCH FIRST    i001_cs INTO g_tc_oqd01
        WHEN 'L' FETCH LAST     i001_cs INTO g_tc_oqd01
        WHEN '/'
            IF (NOT mi_no_ask) THEN
                CALL cl_getmsg('fetch',g_lang) RETURNING g_msg
                LET INT_FLAG = 0  ######add for prompt mod
                PROMPT g_msg CLIPPED || ': ' FOR g_jump   --改g_jump
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
            FETCH ABSOLUTE g_jump i001_cs INTO g_tc_oqd_rowid,g_tc_oqd01
            LET mi_no_ask = FALSE
    END CASE

    IF SQLCA.sqlcode THEN
        CALL cl_err(g_tc_oqd01,SQLCA.sqlcode,0)
        RETURN
    ELSE
       CASE p_flag
          WHEN 'F' LET g_curs_index = 1
          WHEN 'P' LET g_curs_index = g_curs_index - 1
          WHEN 'N' LET g_curs_index = g_curs_index + 1
          WHEN 'L' LET g_curs_index = g_row_count
          WHEN '/' LET g_curs_index = g_jump          --改g_jump
       END CASE

       CALL cl_navigator_setting( g_curs_index, g_row_count )
    END IF
    #SELECT * INTO g_tc_oqd.* FROM tc_oqd_file WHERE ROWID = g_tc_oqd_rowid
    IF SQLCA.sqlcode THEN
        CALL cl_err(g_tc_oqd01,SQLCA.sqlcode,0)
        CALL g_tc_oqd.clear()
        RETURN
    END IF
    LET g_data_owner = ''      #FUN-4C0057 add
    LET g_data_group = ''      #FUN-4C0057 add
    CALL i001_show()
END FUNCTION

#將資料顯示在畫面上
FUNCTION i001_show()
    INITIALIZE g_tc_oqd_t.* TO NULL                #保存單頭舊值
    DISPLAY g_tc_oqd01 TO FORMONLY.tc_oqd01
    CALL i001_b_fill(g_wc2)                 #單身
# genero  script marked     LET g_tc_oqd_pageno = 0
END FUNCTION

FUNCTION i001_r()
    DEFINE l_chr,l_sure VARCHAR(1)

    IF s_shut(0) THEN RETURN END IF
    IF g_tc_oqd01 IS NULL THEN CALL cl_err('',-400,0) RETURN END IF

    BEGIN WORK

    OPEN i001_cl USING g_tc_oqd_rowid
    IF SQLCA.sqlcode THEN
       CALL cl_err(g_tc_oqd01,SQLCA.sqlcode,0)
       CLOSE i001_cl ROLLBACK WORK RETURN
    END IF

    #FETCH i001_cl INTO g_tc_oqd.*
    IF SQLCA.sqlcode THEN
       CALL cl_err(g_tc_oqd01,SQLCA.sqlcode,0)
       CLOSE i001_cl ROLLBACK WORK RETURN
    END IF

    CALL i001_show()

    IF cl_delh(20,16) THEN
        DELETE FROM tc_oqd_file WHERE tc_oqd01 = g_tc_oqd01
        IF SQLCA.SQLERRD[3]=0 THEN
           CALL cl_err(g_tc_oqd01,SQLCA.sqlcode,0)
        ELSE
           CLEAR FORM
           CALL g_tc_oqd.clear()
    	   #INITIALIZE g_tc_oqd.* LIKE tc_oqd_file.*
         CALL g_tc_oqd.clear()        #DEFAULT 設定
           OPEN i001_count
           FETCH i001_count INTO g_row_count
           DISPLAY g_row_count TO FORMONLY.cnt
           DISPLAY g_curs_index TO FORMONLY.cnt1
           OPEN i001_cs
           IF g_curs_index = g_row_count + 1 THEN
              LET g_jump = g_row_count
              CALL i001_fetch('L')
           ELSE
              LET g_jump = g_curs_index
              LET mi_no_ask = TRUE
              CALL i001_fetch('/')
           END IF
        END IF
        DELETE FROM tc_oqd_file WHERE tc_oqd01 = g_tc_oqd01
    END IF

    CLOSE i001_cl
    COMMIT WORK

END FUNCTION

FUNCTION i001_b()
DEFINE
    l_ac_t          SMALLINT,              #未取消的ARRAY CNT
    l_n             SMALLINT,              #檢查重複用
    l_lock_sw       VARCHAR(1),               #單身鎖住否
    p_cmd           VARCHAR(1),               #處理狀態
    l_allow_insert  SMALLINT,              #可新增否
    l_allow_delete  SMALLINT               #可刪除否
DEFINE l_cnt        SMALLINT

    LET g_action_choice = ""

    IF g_tc_oqd01 IS NULL THEN RETURN END IF

    CALL cl_opmsg('b')

    LET g_forupd_sql = "SELECT  tc_oqd02,ima02,ima021,tc_oqd03,tc_oqd04,tc_oqd05,tc_oqd06",
                       " FROM tc_oqd_file LEFT JOIN ima_file ON tc_oqd02 = ima01",
                       " WHERE tc_oqd01 = ?  AND tc_oqd02 = ? ",
                       " FOR UPDATE NOWAIT "
    DECLARE i001_bcl CURSOR FROM g_forupd_sql

    LET l_ac_t = 0
    LET l_allow_insert = cl_detail_input_auth("insert")
    LET l_allow_delete = cl_detail_input_auth("delete")

    INPUT ARRAY g_tc_oqd WITHOUT DEFAULTS FROM s_tc_oqd.*
          ATTRIBUTE(COUNT=g_rec_b,MAXCOUNT=g_max_rec,UNBUFFERED,
                    INSERT ROW=l_allow_insert,DELETE ROW=l_allow_delete,APPEND ROW=l_allow_insert)


        BEFORE INPUT
            IF g_rec_b != 0 THEN
               CALL fgl_set_arr_curr(l_ac)
            END IF

        BEFORE ROW
            LET p_cmd = ''
            LET l_ac = ARR_CURR()
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n  = ARR_COUNT()
            BEGIN WORK
            IF g_rec_b >= l_ac THEN
               LET p_cmd='u'
               #LET g_tc_oqd_t.* = g_tc_oqd[l_ac].*  #BACKUP
               LET g_tc_oqd_t.tc_oqd02 = g_tc_oqd[l_ac].tc_oqd02
               LET g_tc_oqd_t.tc_oqd03 = g_tc_oqd[l_ac].tc_oqd03
               LET g_tc_oqd_t.tc_oqd04 = g_tc_oqd[l_ac].tc_oqd04
               LET g_tc_oqd_t.tc_oqd05 = g_tc_oqd[l_ac].tc_oqd05
               LET g_tc_oqd_t.tc_oqd06 = g_tc_oqd[l_ac].tc_oqd06
               OPEN i001_bcl USING g_tc_oqd01,g_tc_oqd[l_ac].tc_oqd02
               IF SQLCA.sqlcode THEN
                  CALL cl_err(g_tc_oqd_t.tc_oqd01,SQLCA.sqlcode,1)
                  LET l_lock_sw = "Y"
               ELSE
                  FETCH i001_bcl INTO g_tc_oqd[l_ac].*
                  IF SQLCA.sqlcode THEN
                     CALL cl_err(g_tc_oqd_t.tc_oqd01,SQLCA.sqlcode,1)
                     LET l_lock_sw = "Y"
                  END IF
               END IF
            END IF

        AFTER FIELD tc_oqd02
            IF NOT cl_null(g_tc_oqd[l_ac].tc_oqd02) THEN
                LET l_cnt =0
                SELECT COUNT(*) INTO l_cnt FROM ima_file
                 WHERE ima01 = g_tc_oqd[l_ac].tc_oqd02
                IF l_cnt > 0 THEN
                   SELECT ima02,ima021 INTO g_tc_oqd[l_ac].ima02,g_tc_oqd[l_ac].ima021
                     FROM ima_file
                    WHERE ima01 = g_tc_oqd[l_ac].tc_oqd02
                    IF cl_null (g_tc_oqd[l_ac].tc_oqd03) THEN LET g_tc_oqd[l_ac].tc_oqd03 = 0 END IF
                    IF cl_null (g_tc_oqd[l_ac].tc_oqd03) THEN LET g_tc_oqd[l_ac].tc_oqd04 = 0 END IF
                    LET g_tc_oqd[l_ac].tc_oqd05 = g_today
                ELSE
                   CALL cl_err("",'axc-204',1)
                END IF
            END IF
            DISPLAY BY NAME g_tc_oqd[l_ac].ima02,g_tc_oqd[l_ac].ima021

        BEFORE INSERT
            LET l_n = ARR_COUNT()
            LET p_cmd='a'
            INITIALIZE g_tc_oqd[l_ac].* TO NULL  #900423
            #LET g_tc_oqd_t.* = g_tc_oqd[l_ac].*         #新輸入資料
            LET g_tc_oqd_t.tc_oqd02 = g_tc_oqd[l_ac].tc_oqd02
            LET g_tc_oqd_t.tc_oqd03 = g_tc_oqd[l_ac].tc_oqd03
            LET g_tc_oqd_t.tc_oqd04 = g_tc_oqd[l_ac].tc_oqd04
            LET g_tc_oqd_t.tc_oqd05 = g_tc_oqd[l_ac].tc_oqd05
            LET g_tc_oqd_t.tc_oqd06 = g_tc_oqd[l_ac].tc_oqd06
            NEXT FIELD tc_oqd02

        AFTER INSERT
            IF INT_FLAG THEN
               CALL cl_err('',9001,0)
               LET INT_FLAG = 0
               CANCEL INSERT
            END IF
             INSERT INTO tc_oqd_file(tc_oqd01,tc_oqd02,tc_oqd03,tc_oqd04,tc_oqd05,tc_oqd06)   #No.MOD-470041
                          VALUES(g_tc_oqd01,g_tc_oqd[l_ac].tc_oqd02,g_tc_oqd[l_ac].tc_oqd03,
                                 g_tc_oqd[l_ac].tc_oqd04,g_tc_oqd[l_ac].tc_oqd05,g_tc_oqd[l_ac].tc_oqd06)
            IF SQLCA.sqlcode THEN
               CALL cl_err(g_tc_oqd01,SQLCA.sqlcode,0)
               CANCEL INSERT
            ELSE
               COMMIT WORK
               LET g_rec_b = g_rec_b + 1
               MESSAGE 'INSERT O.K'
            END IF

        BEFORE DELETE                            #是否取消單身
            IF g_tc_oqd_t.tc_oqd02 IS NOT NULL THEN
               IF NOT cl_delb(0,0) THEN
                  CANCEL DELETE
               END IF

               IF l_lock_sw = "Y" THEN
                  CALL cl_err("", -263, 1)
                  CANCEL DELETE
               END IF

               DELETE FROM tc_oqd_file
                WHERE tc_oqd01 = g_tc_oqd01
                  AND tc_oqd02 = g_tc_oqd[l_ac].tc_oqd02
               IF SQLCA.SQLERRD[3] = 0 THEN
                  CALL cl_err(g_tc_oqd_t.tc_oqd03,SQLCA.sqlcode,0)
                  ROLLBACK WORK
                  CANCEL DELETE
               END IF

               COMMIT WORK
               LET l_ac = l_ac -1
               LET g_rec_b = g_rec_b - 1

            END IF

        ON ROW CHANGE
            IF INT_FLAG THEN
               CALL cl_err('',9001,0)
               LET INT_FLAG = 0
               #LET g_tc_oqd[l_ac].* = g_tc_oqd_t.*
               LET g_tc_oqd_t.tc_oqd02 = g_tc_oqd[l_ac].tc_oqd02
               LET g_tc_oqd_t.tc_oqd03 = g_tc_oqd[l_ac].tc_oqd03
               LET g_tc_oqd_t.tc_oqd04 = g_tc_oqd[l_ac].tc_oqd04
               LET g_tc_oqd_t.tc_oqd05 = g_tc_oqd[l_ac].tc_oqd05
               LET g_tc_oqd_t.tc_oqd06 = g_tc_oqd[l_ac].tc_oqd06
               CLOSE i001_bcl
               ROLLBACK WORK
               EXIT INPUT
            END IF

            IF l_lock_sw = 'Y' THEN
               CALL cl_err(g_tc_oqd[l_ac].tc_oqd02,-263,1)
               #LET g_tc_oqd[l_ac].* = g_tc_oqd_t.*
               LET  g_tc_oqd[l_ac].tc_oqd02 = g_tc_oqd_t.tc_oqd02
               LET  g_tc_oqd[l_ac].tc_oqd03 = g_tc_oqd_t.tc_oqd03
               LET  g_tc_oqd[l_ac].tc_oqd04 = g_tc_oqd_t.tc_oqd04
               LET  g_tc_oqd[l_ac].tc_oqd05 = g_tc_oqd_t.tc_oqd05
               LET  g_tc_oqd[l_ac].tc_oqd06 = g_tc_oqd_t.tc_oqd06
            ELSE
               UPDATE tc_oqd_file SET tc_oqd02=g_tc_oqd[l_ac].tc_oqd02,
                                   tc_oqd03=g_tc_oqd[l_ac].tc_oqd03,
                                   tc_oqd04=g_tc_oqd[l_ac].tc_oqd04,
                                   tc_oqd05=g_tc_oqd[l_ac].tc_oqd05,
                                   tc_oqd06=g_tc_oqd[l_ac].tc_oqd06

                WHERE tc_oqd01 = g_tc_oqd01
                  AND tc_oqd02 = g_tc_oqd_t.tc_oqd02
               IF SQLCA.sqlcode THEN
                  CALL cl_err(g_tc_oqd01,SQLCA.sqlcode,0)
                 # LET g_tc_oqd[l_ac].* = g_tc_oqd_t.*
                  LET  g_tc_oqd[l_ac].tc_oqd02 = g_tc_oqd_t.tc_oqd02
                  LET  g_tc_oqd[l_ac].tc_oqd03 = g_tc_oqd_t.tc_oqd03
                  LET  g_tc_oqd[l_ac].tc_oqd04 = g_tc_oqd_t.tc_oqd04
                  LET  g_tc_oqd[l_ac].tc_oqd05 = g_tc_oqd_t.tc_oqd05
                  LET  g_tc_oqd[l_ac].tc_oqd06 = g_tc_oqd_t.tc_oqd06
               ELSE
                  MESSAGE 'UPDATE O.K'
                  COMMIT WORK
               END IF
            END IF

        AFTER ROW
            LET l_ac = ARR_CURR()
            LET l_ac_t = l_ac
            IF INT_FLAG THEN
               CALL cl_err('',9001,0)
               LET INT_FLAG = 0
               IF p_cmd = 'u' THEN
                  #LET g_tc_oqd[l_ac].* = g_tc_oqd_t.*
                  LET  g_tc_oqd[l_ac].tc_oqd02 = g_tc_oqd_t.tc_oqd02
                  LET  g_tc_oqd[l_ac].tc_oqd03 = g_tc_oqd_t.tc_oqd03
                  LET  g_tc_oqd[l_ac].tc_oqd04 = g_tc_oqd_t.tc_oqd04
                  LET  g_tc_oqd[l_ac].tc_oqd05 = g_tc_oqd_t.tc_oqd05
                  LET  g_tc_oqd[l_ac].tc_oqd06 = g_tc_oqd_t.tc_oqd06
               END IF
               CLOSE i001_bcl
               ROLLBACK WORK
               EXIT INPUT
            END IF

            CLOSE i001_bcl
            COMMIT WORK

#       ON ACTION CONTROLN
#           CALL i001_b_askkey()
#           EXIT INPUT
        ON ACTION controlp
            CASE
                WHEN INFIELD(tc_oqd02)
                    CALL cl_init_qry_var()
                    LET g_qryparam.form = "q_ima"
                    LET g_qryparam.state = "i"
                    CALL cl_create_qry() RETURNING g_tc_oqd[l_ac].tc_oqd02
                    DISPLAY BY NAME g_tc_oqd[l_ac].tc_oqd02
                    NEXT FIELD tc_oqd02
            END CASE

        ON ACTION CONTROLO                        # 沿用所有欄位
            IF l_ac > 1 THEN
               LET g_tc_oqd[l_ac].* = g_tc_oqd[l_ac-1].*
               NEXT FIELD tc_oqd02
            END IF

        ON ACTION CONTROLZ
           CALL cl_show_req_fields()

        ON ACTION CONTROLG CALL cl_cmdask()

        ON ACTION CONTROLF                  #欄位說明
         CALL cl_set_focus_form(ui.Interface.getRootNode()) RETURNING g_fld_name,g_frm_name #Add on 040913
         CALL cl_fldhelp(g_frm_name,g_fld_name,g_lang) #Add on 040913


       ON IDLE g_idle_seconds
          CALL cl_on_idle()
          CONTINUE INPUT

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121

      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121


    END INPUT

    CLOSE i001_bcl
    COMMIT WORK

END FUNCTION

FUNCTION i001_delall()

    SELECT COUNT(*) INTO g_cnt FROM tc_oqd_file
     WHERE tc_oqd01=g_tc_oqd01

    IF g_cnt = 0 THEN 			# 未輸入單身資料, 則取消單頭資料
       CALL cl_getmsg('9044',g_lang) RETURNING g_msg
       ERROR g_msg CLIPPED
       DELETE FROM tc_oqd_file WHERE tc_oqd01 = g_tc_oqd01
       IF SQLCA.SQLCODE THEN
          CALL cl_err('DEL-tc_oqd',SQLCA.SQLCODE,0)
       END IF
    END IF

END FUNCTION

FUNCTION i001_b_askkey()
DEFINE
    l_wc2           VARCHAR(200)

    CONSTRUCT l_wc2 ON tc_oqd02,tc_oqd03
            FROM s_tc_oqd[1].tc_oqd02,s_tc_oqd[1].tc_oqd03
       ON IDLE g_idle_seconds
          CALL cl_on_idle()
          CONTINUE CONSTRUCT

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121

      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121

      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121


    END CONSTRUCT
    IF INT_FLAG THEN
        LET INT_FLAG = 0
        RETURN
    END IF

    CALL i001_b_fill(l_wc2)

END FUNCTION

FUNCTION i001_b_fill(p_wc2)              #BODY FILL UP
DEFINE
    p_wc2           VARCHAR(200)

    LET g_sql =
        "SELECT tc_oqd02,ima02,ima021,tc_oqd03,tc_oqd04,tc_oqd05,tc_oqd06 ",
        " FROM tc_oqd_file LEFT JOIN ima_file ON tc_oqd02 = ima01",
        " WHERE tc_oqd01 ='",g_tc_oqd01,"'",  #單頭
        " AND ",p_wc2 CLIPPED,              #單身
        " ORDER BY 1"                       #NO:2574

    PREPARE i001_pb FROM g_sql
    DECLARE tc_oqd_curs                       #CURSOR
        CURSOR FOR i001_pb

    CALL g_tc_oqd.clear()

    LET g_rec_b = 0
    LET g_cnt = 1
    FOREACH tc_oqd_curs INTO g_tc_oqd[g_cnt].*   #單身 ARRAY 填充
        IF SQLCA.sqlcode THEN
            CALL cl_err('foreach:',SQLCA.sqlcode,1)
            EXIT FOREACH
        END IF
        LET g_cnt = g_cnt + 1

        IF g_cnt > g_max_rec THEN
           CALL cl_err( '', 9035, 0 )
           EXIT FOREACH
        END IF

    END FOREACH
    CALL g_tc_oqd.deleteElement(g_cnt)

    LET g_rec_b = g_cnt-1               #告訴I.單身筆數
    DISPLAY g_rec_b TO FORMONLY.cnt2
    DISPLAY g_curs_index TO FORMONLY.cnt1

END FUNCTION

FUNCTION i001_bp(p_ud)
   DEFINE   p_ud   VARCHAR(1)


   IF p_ud <> "G" OR g_action_choice = "detail" THEN
      RETURN
   END IF

   LET g_action_choice = " "

   CALL cl_set_act_visible("accept,cancel", FALSE)
   DISPLAY g_tc_oqd01 TO tc_oqd01
   DISPLAY g_rec_b TO FORMONLY.cnt2
   DISPLAY g_curs_index TO FORMONLY.cnt1
   DISPLAY ARRAY g_tc_oqd TO s_tc_oqd.* ATTRIBUTE(COUNT=g_rec_b,UNBUFFERED)

      BEFORE DISPLAY
         CALL cl_navigator_setting( g_curs_index, g_row_count )

      BEFORE ROW
         LET l_ac = ARR_CURR()

      ##########################################################################
      # Standard 4ad ACTION
      ##########################################################################
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

      ON ACTION first
         CALL i001_fetch('F')
         CALL cl_navigator_setting(g_curs_index, g_row_count)   ###add in 040517
           IF g_rec_b != 0 THEN
         CALL fgl_set_arr_curr(1)  ######add in 040505
           END IF


      ON ACTION previous
         CALL i001_fetch('P')
         CALL cl_navigator_setting(g_curs_index, g_row_count)   ###add in 040517
           IF g_rec_b != 0 THEN
         CALL fgl_set_arr_curr(1)  ######add in 040505
           END IF


      ON ACTION jump
         CALL i001_fetch('/')
         CALL cl_navigator_setting(g_curs_index, g_row_count)   ###add in 040517
           IF g_rec_b != 0 THEN
         CALL fgl_set_arr_curr(1)  ######add in 040505
           END IF


      ON ACTION next
         CALL i001_fetch('N')
         CALL cl_navigator_setting(g_curs_index, g_row_count)   ###add in 040517
           IF g_rec_b != 0 THEN
         CALL fgl_set_arr_curr(1)  ######add in 040505
           END IF


      ON ACTION last
         CALL i001_fetch('L')
         CALL cl_navigator_setting(g_curs_index, g_row_count)   ###add in 040517
           IF g_rec_b != 0 THEN
         CALL fgl_set_arr_curr(1)  ######add in 040505
           END IF


      ON ACTION detail
         LET g_action_choice="detail"
         LET l_ac = 1
         EXIT DISPLAY
      ON ACTION output
         LET g_action_choice="output"
         EXIT DISPLAY
      ON ACTION help
         LET g_action_choice="help"
         EXIT DISPLAY

      ON ACTION locale
         CALL cl_dynamic_locale()

      ON ACTION exit
         LET g_action_choice="exit"
         EXIT DISPLAY

      ##########################################################################
      # Special 4ad ACTION
      ##########################################################################
      ON ACTION controlg
         LET g_action_choice="controlg"
         EXIT DISPLAY

   ON ACTION accept
      LET g_action_choice="detail"
      LET l_ac = ARR_CURR()
      EXIT DISPLAY

   ON ACTION cancel
             LET INT_FLAG=FALSE 		#MOD-570244	mars
      LET g_action_choice="exit"
      EXIT DISPLAY

      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121


   ON ACTION exporttoexcel       #FUN-4B0038
         LET g_action_choice = 'exporttoexcel'
         EXIT DISPLAY

   END DISPLAY
   CALL cl_set_act_visible("accept,cancel", TRUE)

END FUNCTION
FUNCTION i001_bp_refresh()
   DISPLAY ARRAY g_tc_oqd TO s_tc_oqd.* ATTRIBUTE(COUNT=g_rec_b,UNBUFFERED)
      BEFORE DISPLAY
         EXIT DISPLAY
      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121

      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121

      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121


   END DISPLAY
END FUNCTION


FUNCTION i001_out()
DEFINE
    l_i             SMALLINT,
    sr              RECORD
        tc_oqd01       LIKE tc_oqd_file.tc_oqd01,
        tc_oqd02       LIKE tc_oqd_file.tc_oqd02,
        tc_oqd03       LIKE tc_oqd_file.tc_oqd03
                    END RECORD,
    l_name          VARCHAR(20),              #External(Disk) file name
    l_za05          VARCHAR(40)               #

    IF g_wc  IS NULL THEN
       CALL cl_err('','9057',0) RETURN END IF
    CALL cl_wait()
    SELECT zo02 INTO g_company FROM zo_file WHERE zo01 = g_lang
    FOR g_i = 1 TO g_len LET g_dash[g_i,g_i] = '=' END FOR

    LET g_sql="SELECT tc_oqd01,tc_oqd02,tc_oqd02,tc_oqd03",
              " FROM tc_oqd_file,tc_oqd_file",
              " WHERE tc_oqd01 = tc_oqd01 AND ",g_wc CLIPPED,
              " AND ",g_wc2 CLIPPED,
              " ORDER BY 1,3 "
    PREPARE i001_p1 FROM g_sql                # RUNTIME 編譯
    DECLARE i001_co                         # CURSOR
        CURSOR FOR i001_p1

    LET g_rlang = g_lang                               #FUN-4C0096 add
    CALL cl_outnam('cxmi001') RETURNING l_name
    START REPORT i001_rep TO l_name

    FOREACH i001_co INTO sr.*
        IF SQLCA.sqlcode THEN
           CALL cl_err('foreach:',SQLCA.sqlcode,1)
           EXIT FOREACH
        END IF
        OUTPUT TO REPORT i001_rep(sr.*)

    END FOREACH

    FINISH REPORT i001_rep
    CLOSE i001_co
    ERROR ""
    CALL cl_prt(l_name,' ','1',g_len)
END FUNCTION

REPORT i001_rep(sr)
DEFINE
    l_trailer_sw    VARCHAR(1),
    l_sw            VARCHAR(1),
    l_sql1          VARCHAR(100),
    l_i             SMALLINT,
    l_bmg           RECORD LIKE bmg_file.*,
    sr              RECORD
        tc_oqd01       LIKE tc_oqd_file.tc_oqd01,
        tc_oqd02       LIKE tc_oqd_file.tc_oqd02,
        tc_oqd03       LIKE tc_oqd_file.tc_oqd03
                    END RECORD
   OUTPUT
       TOP MARGIN 0
       LEFT MARGIN 0
       BOTTOM MARGIN 6
       PAGE LENGTH g_page_line

    ORDER BY sr.tc_oqd01

#FUN-4C0096 modify
    FORMAT
        PAGE HEADER
            PRINT COLUMN ((g_len-length(g_company))/2)+1,g_company
            PRINT COLUMN ((g_len-length(g_x[1]))/2)+1,g_x[1]
            LET g_pageno = g_pageno + 1
            LET pageno_total = PAGENO USING '<<<','/pageno'
            PRINT g_head CLIPPED, pageno_total
            PRINT ''
            PRINT g_dash[1,g_len]
            PRINT g_x[31],
                  g_x[32],
                  g_x[33],
                  g_x[34]
            PRINT g_dash1
            LET l_trailer_sw = 'y'

        BEFORE GROUP OF sr.tc_oqd01
           PRINT COLUMN g_c[31],sr.tc_oqd01,
                 COLUMN g_c[32],sr.tc_oqd02

        ON EVERY ROW
           PRINT COLUMN g_c[33],sr.tc_oqd02 USING '####',
                 COLUMN g_c[34],sr.tc_oqd03

        AFTER GROUP OF sr.tc_oqd01
           PRINT ' '

        ON LAST ROW
            PRINT g_dash[1,g_len]
            IF g_zz05 = 'Y' THEN       # 80:70,140,210      132:120,240
               IF g_wc[001,080] > ' ' THEN
	          PRINT g_x[8] CLIPPED,g_wc[001,070] CLIPPED END IF
               IF g_wc[071,140] > ' ' THEN
	          PRINT COLUMN 10,     g_wc[071,140] CLIPPED END IF
               IF g_wc[141,210] > ' ' THEN
	          PRINT COLUMN 10,     g_wc[141,210] CLIPPED END IF
               PRINT g_dash[1,g_len]
            END IF
            PRINT g_x[4] CLIPPED, COLUMN g_c[34], g_x[7] CLIPPED
            LET l_trailer_sw = 'n'

        PAGE TRAILER
            IF l_trailer_sw = 'y' THEN
                PRINT g_dash[1,g_len]
                PRINT g_x[4] CLIPPED,COLUMN g_c[34], g_x[6] CLIPPED
            ELSE
                SKIP 2 LINE
            END IF
##
END REPORT

FUNCTION i001_set_entry(p_cmd)
 DEFINE p_cmd   VARCHAR(01)

    IF p_cmd = 'a' AND ( NOT g_before_input_done ) THEN
       CALL cl_set_comp_entry("tc_oqd01",TRUE)
    END IF

END FUNCTION

FUNCTION i001_set_no_entry(p_cmd)
  DEFINE p_cmd   VARCHAR(01)

    IF p_cmd = 'u' AND g_chkey = 'N' AND ( NOT g_before_input_done ) THEN
       CALL cl_set_comp_entry("tc_oqd01",FALSE)
    END IF

END FUNCTION
