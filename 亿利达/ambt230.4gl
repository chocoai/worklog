# Prog. Version..: '5.30.06-13.03.12(00010)'     #
#
# Pattern namsb...: ambt230.4gl
# Descriptions...:
# Date & Author..: 16/11/17 By renjj
#

DATABASE ds

GLOBALS "../../config/top.global"

#模組變數(Module Variables)


DEFINE
   g_tc_amsb         DYNAMIC ARRAY OF RECORD

      tc_amsb05      LIKE tc_amsb_file.tc_amsb05,
      tc_amsb06      LIKE tc_amsb_file.tc_amsb06,
      tc_amsb07      LIKE tc_amsb_file.tc_amsb07,
      azp02         LIKE azp_file.azp02,
      tc_amsb08      LIKE tc_amsb_file.tc_amsb08,
      tc_amsb20      LIKE tc_amsb_file.tc_amsb20,
      tc_amsb09      LIKE tc_amsb_file.tc_amsb09,
      tc_amsb10      LIKE tc_amsb_file.tc_amsb10,
      tc_amsb11      LIKE tc_amsb_file.tc_amsb11,
      tc_amsb12      LIKE tc_amsb_file.tc_amsb12,
      tc_amsb13      LIKE tc_amsb_file.tc_amsb13,
      tc_amsb21      LIKE tc_amsb_file.tc_amsb21,
      tc_amsb14      LIKE tc_amsb_file.tc_amsb14,
      tc_amsb15      LIKE tc_amsb_file.tc_amsb15,
      tc_amsb16      LIKE tc_amsb_file.tc_amsb16,
      tc_amsb17      LIKE tc_amsb_file.tc_amsb17,
      tc_amsb18      LIKE tc_amsb_file.tc_amsb18
                 END RECORD,

   g_tc_amsb_1      DYNAMIC ARRAY OF RECORD
      tc_amsb05_1      LIKE tc_amsb_file.tc_amsb05,
      tc_amsb06_1      LIKE tc_amsb_file.tc_amsb06,
      tc_amsb07_1      LIKE tc_amsb_file.tc_amsb07,
      azp02_1         LIKE azp_file.azp02,
      tc_amsb08_1      LIKE tc_amsb_file.tc_amsb08,
      tc_amsb20_1      LIKE tc_amsb_file.tc_amsb20,
      tc_amsb09_1      LIKE tc_amsb_file.tc_amsb09,
      tc_amsb10_1      LIKE tc_amsb_file.tc_amsb10,
      tc_amsb11_1      LIKE tc_amsb_file.tc_amsb11,
      tc_amsb12_1      LIKE tc_amsb_file.tc_amsb12,
      tc_amsb13_1      LIKE tc_amsb_file.tc_amsb13,
      tc_amsb21_1      LIKE tc_amsb_file.tc_amsb21,
      tc_amsb14_1      LIKE tc_amsb_file.tc_amsb14,
      tc_amsb15_1      LIKE tc_amsb_file.tc_amsb15,
      tc_amsb16_1      LIKE tc_amsb_file.tc_amsb16,
      tc_amsb17_1      LIKE tc_amsb_file.tc_amsb17,
      tc_amsb18_1      LIKE tc_amsb_file.tc_amsb18
                 END RECORD,

     g_tc_amtb         DYNAMIC ARRAY OF RECORD
      tc_amtb05      LIKE tc_amtb_file.tc_amtb05,
      tc_amtb06      LIKE tc_amtb_file.tc_amtb06,
      tc_amtb07      LIKE tc_amtb_file.tc_amtb07,
      azp02_2         LIKE azp_file.azp02,
      tc_amtb08      LIKE tc_amtb_file.tc_amtb08,
      tc_amtb17      LIKE tc_amtb_file.tc_amtb17,
      tc_amtb09      LIKE tc_amtb_file.tc_amtb09,
      tc_amtb10      LIKE tc_amtb_file.tc_amtb10,
      tc_amtb11      LIKE tc_amtb_file.tc_amtb11,
      tc_amtb12      LIKE tc_amtb_file.tc_amtb12,
      tc_amtb13      LIKE tc_amtb_file.tc_amtb13,
      tc_amtb14      LIKE tc_amtb_file.tc_amtb14
                 END RECORD,


    g_wc,g_wc2,g_sql   STRING,    #No.FUN-580092 HCN
    g_delete           LIKE type_file.chr1,       #若刪除資料,則要重新顯示筆數
    g_rec_b            LIKE type_file.num5,       #單身筆數
    l_ac               LIKE type_file.num5,        #目前處理的ARRAY CNT
    g_rec_b1            LIKE type_file.num5,       #單身筆數
    l_ac1               LIKE type_file.num5,        #目前處理的ARRAY CNT
    g_rec_b2            LIKE type_file.num5,       #單身筆數
    l_ac2               LIKE type_file.num5,        #目前處理的ARRAY CNT
    g_rec_b3            LIKE type_file.num5,       #單身筆數
    l_ac3               LIKE type_file.num5        #目前處理的ARRAY CNT


DEFINE tm RECORD
          wc              STRING,
          tc_amsb01       LIKE tc_amsb_file.tc_amsb01,
          tc_amsb02       LIKE tc_amsb_file.tc_amsb02,
          tc_amsb03       LIKE tc_amsb_file.tc_amsb03,
          tc_amsb04       LIKE tc_amsb_file.tc_amsb04
          END RECORD

DEFINE p_row,p_col     LIKE type_file.num5
DEFINE g_forupd_sql    STRING   #SELECT ... FOR UPDATE SQL
DEFINE g_sql_tmp       STRING   #No.TQC-720019
DEFINE g_before_input_done  LIKE type_file.num5
DEFINE g_cnt           LIKE type_file.num10
DEFINE g_i             LIKE type_file.num5          #count/index for any purpose
DEFINE g_msg           LIKE type_file.chr1000
DEFINE g_row_count     LIKE type_file.num10
DEFINE g_curs_index    LIKE type_file.num10
DEFINE g_jump          LIKE type_file.num10
DEFINE mi_no_ask       LIKE type_file.num5
DEFINE g_ss            LIKE type_file.chr1
DEFINE g_flag          LIKE type_file.chr1
DEFINE g_change_lang    LIKE type_file.chr1               #FUN-A40078 add
DEFINE g_action_flag   LIKE type_file.chr100
DEFINE   w               ui.Window
DEFINE   f               ui.Form
DEFINE   page            om.DomNode

MAIN
   OPTIONS                                #改變一些系統預設值
      INPUT NO WRAP
   DEFER INTERRUPT                        #擷取中斷鍵, 由程式處理

   IF (NOT cl_user()) THEN
      EXIT PROGRAM
   END IF

   WHENEVER ERROR CALL cl_err_msg_log

   IF (NOT cl_setup("AMB")) THEN
      EXIT PROGRAM
   END IF


   CALL cl_used(g_prog,g_time,1) RETURNING g_time

   LET p_row = 3 LET p_col = 25
   OPEN WINDOW t230_w AT p_row,p_col               #顯示畫面
     WITH FORM "amb/42f/ambt230"  ATTRIBUTE (STYLE = g_win_style CLIPPED)

    CALL cl_ui_init()


   LET g_delete='N'
   CALL t230_menu()
   CLOSE WINDOW t230_w                    #結束畫面

   CALL cl_used(g_prog,g_time,2) RETURNING g_time
END MAIN

FUNCTION t230_cs()

   CLEAR FORM                                             #清除畫面
   CALL g_tc_amsb.clear()

   CALL cl_set_head_visible("","YES")
   INITIALIZE tm.tc_amsb01 TO NULL
   INITIALIZE tm.tc_amsb02 TO NULL
   INITIALIZE tm.tc_amsb03 TO NULL
   INITIALIZE tm.tc_amsb04 TO NULL
   CONSTRUCT g_wc ON tc_amsb01,tc_amsb02,tc_amsb03,tc_amsb04,tc_amsb07
                FROM tc_amsb01,tc_amsb02,tc_amsb03,tc_amsb04,s_tc_amsb[1].tc_amsb07

              BEFORE CONSTRUCT
                 LET tm.tc_amsb01= YEAR(g_today)
                 LET tm.tc_amsb02= MONTH(g_today)
                 DISPLAY tm.tc_amsb01 TO tc_amsb01
                 DISPLAY tm.tc_amsb02 TO tc_amsb02
                 CALL cl_qbe_init()
              #No.FUN-580031 --end--       HCN

             AFTER FIELD  tc_amsb01
                  LET tm.tc_amsb01 = GET_FLDBUF(tc_amsb01)

             AFTER FIELD  tc_amsb02
                  LET tm.tc_amsb02 = GET_FLDBUF(tc_amsb02)

#              AFTER FIELD  tc_amsb03
#                  LET tm.c_amsb03 = GET_FLDBUF(tc_amsb03)
#
#              AFTER FIELD  tc_amsb04
#                  LET tm.c_amsb04 = GET_FLDBUF(tc_amsb04)
      ON ACTION CONTROLP
        CASE WHEN INFIELD(tc_amsb03) #阿米巴版本
               CALL cl_init_qry_var()
               LET g_qryparam.state= "c"
               LET g_qryparam.form = "cq_amq02"
               CALL cl_create_qry() RETURNING g_qryparam.multiret
               DISPLAY g_qryparam.multiret TO tc_amsb03
               NEXT FIELD tc_amsb03


           WHEN INFIELD(tc_amsb04)             #法人群组
               CALL cl_init_qry_var()
               LET g_qryparam.state= "c"
               LET g_qryparam.form = "q_abe"
               CALL cl_create_qry() RETURNING g_qryparam.multiret
               DISPLAY g_qryparam.multiret TO tc_amsb04
               NEXT FIELD tc_amsb04


         OTHERWISE EXIT CASE
         END CASE

      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE CONSTRUCT

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121

      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121

      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121

     #No.FUN-580031 --start--     HCN
      ON ACTION qbe_select
         CALL cl_qbe_select()

      ON ACTION qbe_save
         CALL cl_qbe_save()
     #No.FUN-580031 --end--       HCN

   END CONSTRUCT
   LET g_wc = g_wc CLIPPED,cl_get_extra_cond(null, null) #FUN-980030

   IF INT_FLAG THEN RETURN END IF

   LET g_sql="SELECT UNIQUE tc_amsb01,tc_amsb02,tc_amsb03,tc_amsb04  ",
              " FROM tc_amsb_file ", # 組合出 SQL 指令
              " WHERE ", g_wc CLIPPED,
              " ORDER BY tc_amsb01,tc_amsb02 "
   PREPARE t230_prepare0 FROM g_sql      #預備一下
   DECLARE t230_bcs                  #宣告成可捲動的
       SCROLL CURSOR WITH HOLD FOR t230_prepare0


   LET g_sql_tmp="SELECT  distinct tc_amsb01,tc_amsb02,tc_amsb03,tc_amsb04",  #No.TQC-720019
                 "  FROM tc_amsb_file WHERE ", g_wc CLIPPED,
                 " GROUP BY tc_amsb01,tc_amsb02,tc_amsb03,tc_amsb04",
                 " INTO TEMP x"
   DROP TABLE x

   PREPARE t230_precount_x FROM g_sql_tmp
   EXECUTE t230_precount_x

   LET g_sql="SELECT COUNT(*) FROM x"
   PREPARE t230_precount FROM g_sql
   DECLARE t230_count CURSOR FOR t230_precount

END FUNCTION

FUNCTION t230_menu()
   WHILE TRUE
      CALL t230_bp("G")
      CASE g_action_choice
#           WHEN "insert"
#            IF cl_chk_act_auth() THEN
#                CALL t230_a()
#            END IF
           WHEN "query"
             IF cl_chk_act_auth() THEN
                CALL t230_q()
            END IF
            WHEN "cost"                  #收入
             IF cl_chk_act_auth() THEN
                CALL t230_cost()
            END IF

            WHEN "cost2"                #材料成本
             IF cl_chk_act_auth() THEN
                CALL t230_cost2()
                CALL t230_b_fill2(g_wc)
            END IF
#
#            WHEN "cost4"                  #对内销售
#             IF cl_chk_act_auth() THEN
#                CALL t230_cost4()
#                CALL t230_b_fill2(g_wc)
#            END IF


            WHEN "cost5"                  #销售成本
             IF cl_chk_act_auth() THEN
                CALL t230_cost5()
                CALL t230_b_fill(g_wc)
              #  CALL t230_b_fill2(g_wc)
            END IF

            WHEN "pdelete"  #整批删除
             IF cl_chk_act_auth() THEN
               CALL t230_pdelete()
             END IF

           WHEN "next"
            CALL t230_fetch('N')
           WHEN "previous"
            CALL t230_fetch('P')
#           WHEN "delete"
#            IF cl_chk_act_auth() THEN
#                CALL t230_r()
#            END IF
          WHEN "output"
            IF cl_chk_act_auth() THEN
               CALL t230_out()
            END IF
           WHEN "related_document"   #No.MOD-470518
            IF cl_chk_act_auth() THEN
               IF tm.tc_amsb01 IS NOT NULL THEN
                  LET g_doc.column1 = "tc_amsb01"
                  LET g_doc.column2 = "tc_amsb02"
                  LET g_doc.column3 = "tc_amsb03"
                  LET g_doc.column4 = "tc_amsb04"
                  LET g_doc.value1 = tm.tc_amsb01
                  LET g_doc.value2 = tm.tc_amsb02
                  LET g_doc.value3 = tm.tc_amsb03
                  LET g_doc.value4 = tm.tc_amsb04
                  CALL cl_doc()
               END IF
            END IF

           WHEN "help"
            CALL cl_show_help()
           WHEN "exit"
            EXIT WHILE
           WHEN "jump"
            CALL t230_fetch('/')
           WHEN "controlg"
            CALL cl_cmdask()
           WHEN "exporttoexcel"    #FUN-4B0025
             LET w = ui.Window.getCurrent()
             LET f = w.getForm()
             #IF g_action_flag = "page1" THEN
              IF g_action_flag = "page1" OR cl_null(g_action_flag) THEN # mod by lixwz180612
	         IF cl_chk_act_auth() THEN
                   LET page = f.FindNode("Page","page1")
                    CALL cl_export_to_excel(ui.Interface.getRootNode(),base.TypeInfo.create(g_tc_amsb),'','')
		 END IF
             END IF
#             IF g_action_flag = "page2" THEN
#                IF cl_chk_act_auth() THEN
#                   LET page = f.FindNode("Page","page2")
#                   CALL cl_export_to_excel(page,base.TypeInfo.create(g_tc_amsb_1),'','')
#                END IF
#             END IF
             IF g_action_flag = "page2" THEN
                IF cl_chk_act_auth() THEN
                   LET page = f.FindNode("Page","page2")
                   CALL cl_export_to_excel(page,base.TypeInfo.create(g_tc_amtb),'','')
                END IF
             END IF
            LET g_action_choice = " "
      END CASE
   END WHILE
END FUNCTION

FUNCTION t230_q()

    LET g_row_count = 0
    LET g_curs_index = 0
    CALL cl_navigator_setting( g_curs_index, g_row_count )
    INITIALIZE tm.tc_amsb01 TO NULL                #No.FUN-6A0162
    INITIALIZE tm.tc_amsb02 TO NULL
    INITIALIZE tm.tc_amsb03 TO NULL
    INITIALIZE tm.tc_amsb04 TO NULL

   CALL cl_opmsg('q')
   MESSAGE ""
   CALL t230_cs()                             #取得查詢條件
   IF INT_FLAG THEN                           #使用者不玩了
      LET INT_FLAG = 0
      INITIALIZE tm.tc_amsb01 TO NULL
      INITIALIZE tm.tc_amsb02 TO NULL
      INITIALIZE tm.tc_amsb03 TO NULL
      INITIALIZE tm.tc_amsb04 TO NULL
      RETURN
   END IF
   OPEN t230_bcs                    #從DB產生合乎條件TEMP(0-30秒)
   IF SQLCA.sqlcode THEN                         #有問題
      CALL cl_err('',SQLCA.sqlcode,0)
      INITIALIZE tm.tc_amsb01 TO NULL
      INITIALIZE tm.tc_amsb02 TO NULL
      INITIALIZE tm.tc_amsb03 TO NULL
      INITIALIZE tm.tc_amsb04 TO NULL

   ELSE
      CALL t230_fetch('F')            #讀出TEMP第一筆並顯示
      OPEN t230_count
      FETCH t230_count INTO g_row_count
      DISPLAY g_row_count TO FORMONLY.cnt
   END IF

END FUNCTION

FUNCTION t230_fetch(p_flag)
DEFINE
    p_flag          LIKE type_file.chr1                 #處理方式        #No.FUN-680136 VARCHAR(1)

    MESSAGE ""
    CASE p_flag
        WHEN 'N' FETCH NEXT     t230_bcs INTO tm.tc_amsb01,tm.tc_amsb02,tm.tc_amsb03,tm.tc_amsb04
        WHEN 'P' FETCH PREVIOUS t230_bcs INTO tm.tc_amsb01,tm.tc_amsb02,tm.tc_amsb03,tm.tc_amsb04
        WHEN 'F' FETCH FIRST    t230_bcs INTO tm.tc_amsb01,tm.tc_amsb02,tm.tc_amsb03,tm.tc_amsb04
        WHEN 'L' FETCH LAST     t230_bcs INTO tm.tc_amsb01,tm.tc_amsb02,tm.tc_amsb03,tm.tc_amsb04
        WHEN '/'
            IF (NOT mi_no_ask) THEN
                CALL cl_getmsg('fetch',g_lang) RETURNING g_msg
                LET INT_FLAG = 0  ######add for prompt bug
                PROMPT g_msg CLIPPED,': ' FOR g_jump
                   ON IDLE g_idle_seconds
                      CALL cl_on_idle()
#                      CONTINUE PROMPT

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121

      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121

      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121


                END PROMPT
                IF INT_FLAG THEN LET INT_FLAG = 0 EXIT CASE END IF
            END IF
            FETCH ABSOLUTE g_jump t230_bcs INTO tm.tc_amsb01 ,tm.tc_amsb02 ,tm.tc_amsb03,tm.tc_amsb04
            LET mi_no_ask = FALSE
    END CASE

    IF SQLCA.sqlcode THEN                         #有麻煩
       CALL cl_err(tm.tc_amsb01,SQLCA.sqlcode,0)
       INITIALIZE tm.tc_amsb01 TO NULL  #TQC-6B0105
       INITIALIZE tm.tc_amsb02 TO NULL
       INITIALIZE tm.tc_amsb03 TO NULL
       INITIALIZE tm.tc_amsb04 TO NULL
       RETURN
    ELSE
       CALL t230_show()
       CASE p_flag
          WHEN 'F' LET g_curs_index = 1
          WHEN 'P' LET g_curs_index = g_curs_index - 1
          WHEN 'N' LET g_curs_index = g_curs_index + 1
          WHEN 'L' LET g_curs_index = g_row_count
          WHEN '/' LET g_curs_index = g_jump
       END CASE

       CALL cl_navigator_setting( g_curs_index, g_row_count )
    END IF
END FUNCTION


FUNCTION t230_show()
DEFINE l_abe02 LIKE abe_file.abe02
    DISPLAY tm.tc_amsb01 TO tc_amsb01
    DISPLAY tm.tc_amsb02 TO tc_amsb02
    DISPLAY tm.tc_amsb03 TO tc_amsb03
    DISPLAY tm.tc_amsb04 TO tc_amsb04

    SELECT abe02 INTO l_abe02 FROM abe_file
       WHERE abe01=tm.tc_amsb04

     DISPLAY l_abe02 TO abe02
    CALL t230_b_fill(g_wc)                 #單身
   # CALL t230_b_fill2(g_wc)
    CALL t230_b_fill3(g_wc)
#    CALL t230_b_fill4(g_wc)
    CALL cl_show_fld_cont()
END FUNCTION



#FUNCTION t230_r()
#
#    IF s_shut(0) THEN RETURN END IF                #檢查權限
#    IF tm.tc_amsb01 IS NULL  OR tm.tc_amsb02 IS NULL  THEN
#       CALL cl_err("",-400,0)                 #No.FUN-6A0162
#       RETURN
#    END IF
#
#    IF cl_delh(0,0) THEN                   #確認一下
#        INITIALIZE g_doc.* TO NULL       #No.FUN-9B0098 10/02/24
#
#        LET g_doc.column1 = "tc_amsb01"      #No.FUN-9B0098 10/02/24
#        LET g_doc.column2 = "tc_amsb02"
#
#        LET g_doc.value1 = tm.tc_amsb01      #No.FUN-9B0098 10/02/24
#        LET g_doc.value2 = tm.tc_amsb02
#
#        CALL cl_del_doc()                #No.FUN-9B0098 10/02/24
#       DELETE FROM tc_amsb_file
#        WHERE tc_amsb01 = tm.tc_amsb01 AND tc_amsb02=tm.tc_amsb02 AND tc_amsb03=tm.tc_amsb03  AND tc_amsb04=tm.tc_amsb04
#       IF SQLCA.sqlcode THEN
#          CALL cl_err3("del","tc_amsb_file",tm.tc_amsb01,tm.tc_amsb02 ,SQLCA.sqlcode,"","BODY DELETE:",1)       #No.FUN-660129
#       END IF
#
#
#          CLEAR FORM
#          CALL g_tc_amsb.clear()
#          LET g_delete='Y'
#          LET tm.tc_amsb01= NULL
#          LET tm.tc_amsb02= NULL
#
#          LET g_cnt=SQLCA.SQLERRD[3]
#          MESSAGE 'Remove (',g_cnt USING '####&',') Row(s)'
#          DROP TABLE x
#          PREPARE t230_precount_x2 FROM g_sql_tmp  #No.TQC-720019
#          EXECUTE t230_precount_x2                 #No.TQC-720019
#          OPEN t230_count
#          FETCH t230_count INTO g_row_count
#          DISPLAY g_row_count TO FORMONLY.cnt
#          OPEN t230_bcs
#          IF g_curs_index = g_row_count + 1 THEN
#             LET g_jump = g_row_count
#             CALL t230_fetch('L')
#          ELSE
#             LET g_jump = g_curs_index
#             LET mi_no_ask = TRUE
#             CALL t230_fetch('/')
#          END IF
#    END IF
#END FUNCTION



FUNCTION t230_cost()
 DEFINE l_sql    STRING    #MOD-720062
 DEFINE l_sql2    STRING
 DEFINE l_sql3    STRING
 DEFINE l_cnt     LIKE type_file.num5
 DEFINE l_n     LIKE type_file.num5
 DEFINE l_n2     LIKE type_file.num5
 DEFINE p_wc     STRING
 DEFINE p_wc2    STRING
 DEFINE p_wc3    STRING
 DEFINE tm2  RECORD
           wc        STRING,
           wc2       STRING,
           yy        LIKE type_file.num5,
           mm        LIKE type_file.num5,
           grup      LIKE type_file.chr20,
           ver       LIKE type_file.chr20
         END RECORD
DEFINE  l_mm       LIKE type_file.num5
DEFINE  l_yy       LIKE type_file.num5
DEFINE  l_mm2       LIKE type_file.num5
DEFINE  l_yy2       LIKE type_file.num5
DEFINE l_ima25      LIKE ima_file.ima25
DEFINE l_tc_amsb    RECORD LIKE tc_amsb_file.*
DEFINE l_factor    LIKE type_file.num26_10
DEFINE  g_sw            LIKE type_file.num5
DEFINE l_tc_amp02   LIKE tc_amp_file.tc_amp02
DEFINE g_plant_new  LIKE azp_file.azp01
DEFINE l_tc_amq07   LIKE tc_amq_file.tc_amq07
DEFINE l_tc_amq03   LIKE tc_amq_file.tc_amq03
DEFINE l_count1     LIKE tc_amsb_file.tc_amsb05
DEFINE l_count2     LIKE tc_amsb_file.tc_amsb05
DEFINE l_occ37      LIKE occ_file.occ37
DEFINE l_oeb04      LIKE oeb_file.oeb04
DEFINE l_omb38      LIKE omb_file.omb38
    LET l_n=0

    OPEN WINDOW t230_w3 AT 10,11
     WITH FORM "amb/42f/ambt230_a"  ATTRIBUTE (STYLE = g_win_style CLIPPED) #No.FUN-580092 HCN

   CALL cl_ui_locale("ambt230_a")

   CALL cl_set_head_visible("","YES")     #No.FUN-6B0033
   INITIALIZE tm2.* TO NULL
           LET tm2.yy=YEAR(g_today)
           LET tm2.mm=MONTH(g_today)
           LET tm2.grup='GDFJ'
           LET tm2.ver='GD01'


     INPUT BY NAME  tm2.yy,tm2.mm,tm2.grup,tm2.ver  WITHOUT DEFAULTS

#        BEFORE INPUT
#           LET tm.yy=YEAR(g_today)
#           LET tm.mm=MONTH(g_today)
#           LET tm.grup='XFJ'
#           LET tm.tc_amc01='XFJ201501'
#           LET tm.sfv05='1001'
#           LET tm.store1='1005'
#           LET tm.store2='1009'
#           LET tm.store3='1002'

       ON ACTION CONTROLP
            CASE  WHEN INFIELD(grup)
                CALL cl_init_qry_var()
                 LET g_qryparam.form ="q_abe"
                 CALL cl_create_qry() RETURNING tm2.grup
                 DISPLAY tm2.grup TO grup
                 NEXT FIELD grup

               WHEN INFIELD(ver)
                 CALL cl_init_qry_var()
                 LET g_qryparam.form ="cq_amq02"
                 CALL cl_create_qry() RETURNING tm2.ver
                 DISPLAY tm2.ver TO ver
                 NEXT FIELD ver


             OTHERWISE EXIT CASE
           END CASE

       ON ACTION CONTROLG
           CALL cl_cmdask()

        ON IDLE g_idle_seconds
           CALL cl_on_idle()
           CONTINUE INPUT

        ON ACTION about
           CALL cl_about()

        ON ACTION help
           CALL cl_show_help()


        ON ACTION exit
           LET INT_FLAG = 1
           EXIT INPUT

        ON ACTION qbe_save
           CALL cl_qbe_save()

        ON ACTION locale
            LET g_change_lang = TRUE
            EXIT INPUT

      END INPUT


      IF INT_FLAG THEN
         LET INT_FLAG=0
         CLOSE WINDOW t230_w3
         RETURN
      END IF

   CLOSE WINDOW t230_w3

     LET l_cnt=0
   SELECT COUNT(*) INTO l_cnt FROM tc_amsb_file
     WHERE tc_amsb01=tm2.yy
      AND tc_amsb02=tm2.mm
      AND tc_amsb03=tm2.ver
      AND tc_amsb04=tm2.grup
       AND tc_amsb19='1'
   IF l_cnt>0 THEN
        IF NOT cl_confirm("amb-008") THEN
         LET g_success='N'
         RETURN
      END IF
   END IF

   MESSAGE "WORKING !"
   BEGIN WORK
    IF NOT cl_confirm("amb-004") THEN
       LET g_success='N'
         RETURN
    ELSE
    	 DELETE FROM tc_amsb_file
    	   WHERE tc_amsb01=tm2.yy
          AND tc_amsb02=tm2.mm
          AND tc_amsb03=tm2.ver
          AND tc_amsb04=tm2.grup
          AND tc_amsb19='1'
   END IF

   INITIALIZE  l_tc_amsb.*  TO NULL
   LET l_sql=" select tc_amp02 from tc_amp_file ",
             "  where tc_amp01='",tm2.grup,"'",
             "   and tc_amp04='Y' "
   PREPARE t230_p FROM l_sql
   DECLARE t230_c CURSOR FOR t230_p

   SELECT tc_amq07 INTO l_tc_amq07 FROM tc_amq_file WHERE tc_amq02=tm2.ver
   SELECT tc_amq03 INTO l_tc_amq03 FROM tc_amq_file WHERE tc_amq02=tm2.ver

   LET l_count1=1
   LET l_count2=1
    FOREACH t230_c  INTO l_tc_amp02
        IF STATUS THEN CALL cl_err('foreach:',STATUS,1) EXIT FOREACH END IF

        LET g_plant_new=l_tc_amp02
       #  IF l_tc_amp02='YLD006' OR l_tc_amp02 ='yld006'  THEN

           LET l_sql2=" select oma03,omb31,omb32,ogb31,ogb32,omb04,omb12,tc_amz02,0,omb38 ",
                      "  FROM ",cl_get_target_table(g_plant_new,'oma_file'),",",
                                 cl_get_target_table(g_plant_new,'omb_file'),
                      "   left outer join tc_amz_file on tc_amz01=omb04 and  tc_amz00='",tm2.ver,"',",
                                 cl_get_target_table(g_plant_new,'ogb_file'),
                      "  where oma01=omb01 and omb38='2' and omaconf='Y' ",
                      " AND YEAR(oma02)= '",tm2.yy,"'" ,
                      " AND MONTH(oma02)= '",tm2.mm,"'",
                      " AND ogb01=omb31 and ogb03=omb32 ",
                   #   " AND ogb31=oeb01 and ogb32=oeb03 ",
                      " AND (omb04 LIKE '11%' OR omb04 like '12%' or omb04 like '13%' or omb04 like '14%'  ",
                      " OR omb04 like '27%' ",  # add by lixwz 180417  #添加27开头的料号
                     # "  OR omb04 like '213004141001-07%' or omb04 like '213104141001-05%'  ",
                      "  OR (omb04 BETWEEN '213004141001' and  '213004141007')  ",
                      "  OR (omb04 BETWEEN '213104141001' and  '213104141005')  ",
                    #  "  OR omb04 LIKE '760%' OR omb04='140218130001001-07' )",   #加工收入
                      "  OR omb04 = '21310415617502' ", # add by lixwz 180914
                      "  OR omb04 LIKE '760%'  )",
                      "  AND omb04 not like '140218130001%' ",  #add renjj170411收入与成本都不纳入阿米巴中
                      " union ",
                      " select oma03,omb31,omb32,ohb33,ohb34,omb04,-1*abs(omb12),tc_amz02,0,omb38 ",
                      "  FROM ",cl_get_target_table(g_plant_new,'oma_file'),",",
                                cl_get_target_table(g_plant_new,'omb_file'),
                      "   left outer join tc_amz_file on tc_amz01=omb04 and  tc_amz00='",tm2.ver,"',",
                                cl_get_target_table(g_plant_new,'ohb_file'),
                      "   where oma01=omb01 and omb38='3' and omaconf='Y' ",
                      "    AND YEAR(oma02)= '",tm2.yy,"'" ,
                      "    AND MONTH(oma02)= '",tm2.mm,"'",
                      "   AND ohb01=omb31 and ohb03=omb32 ",
                      " AND (ohb04 LIKE '11%' OR ohb04 like '12%' or ohb04 like '13%' or ohb04 like '14%'  ",
                    #  "  OR ohb04 like '213004141001-07%' or ohb04 like '213104141001-05%' ",
                      " OR omb04 like '27%' ",  # add by lixwz 180417  #添加27开头的料号
                      "  OR (omb04 BETWEEN '213004141001' and  '213004141007')  ",
                      "  OR (omb04 BETWEEN '213104141001' and  '213104141005')  ",
                    # "  OR omb04 LIKE '760%' OR omb04='140218130001001-07' )",   #加工收入
                      "  OR omb04 = '21310415617502' ", # add by lixwz 180914
                      "  OR omb04 LIKE '760%') ",
                      "  AND omb04 not like '140218130001%' ",  #add renjj170411收入与成本都不纳入阿米巴中
                      "  union all ",
                      "   select  '',sfb01,0,sfb22,sfb221,sfb05,sfb08,tc_amz02,0,'A'  ",   #返修
                      "    from sfb_file left outer join tc_amz_file on tc_amz01=sfb05 and  tc_amz00='",tm2.ver,"' ",
                      "    where sfb02='5' ",
                      "     AND YEAR(sfb81)='",tm2.yy,"'" ,
                      "     AND MONTH(sfb81)= '",tm2.mm,"'",
                      "     AND sfb87='Y' AND sfb04='8'  ",
                      "     AND sfb01 like '5032%' ",
                      "     AND EXISTS (select 1 from sfa_file ",
                      "     where sfa30='2001' and sfa01=sfb01) "
                  {    " union ",
                      "  select oma03,omb31,omb32,'',0,omb04,omb12,omb15,omb16,ogb04 ",
                      "  FROM ",cl_get_target_table(g_plant_new,'oma_file'),",",
                                cl_get_target_table(g_plant_new,'omb_file'),",",
                                cl_get_target_table(g_plant_new,'oga_file'),",",
                                cl_get_target_table(g_plant_new,'ogb_file'),
                      "  where oma01=omb01 and omb38='2' and omaconf='Y' ",
                      " AND YEAR(oma02)= '",tm2.yy,"'" ,
                      " AND MONTH(oma02)= '",tm2.mm,"'",
                      " AND ogb01=omb31 and ogb03=omb32 and oga01=ogb01 and oga09='3' ",
                      " AND (ogb04 LIKE '",l_tc_amq07,"%'",
                      "  OR ogb04 like '24%' or ogb04 like '924%' OR ogb04 like '94%' or ogb04 like '95%' )",
                      "  union " ,   #出货换货
                      "  select oga03,ogb01,ogb03,ogb31,ogb32 ,ogb04,ogb12,0,0 ",
                      "  FROM ",  cl_get_target_table(g_plant_new,'oga_file'),",",
                                       cl_get_target_table(g_plant_new,'ogb_file'),
                      " where  oga01=ogb01 and ogaconf='Y' ",
                      "    AND YEAR(oga02)= '",tm2.yy,"'" ,
                      "    AND MONTH(oga02)= '",tm2.mm,"'",
                      "    and oga00='2' ",
                      "   AND oga09 IN ('2','3','4','6') ",
                 #     "    and oeb01=ogb31 and  oeb03=ogb32 ",
                      " AND (omb04 LIKE '11%' OR omb04 like '12%' or omb04 like '13%' or omb04 like '14%'  ",
                      "  OR omb04 like '213004141001-07%' or omb04 like '213104141001-05%' )"       }

     #  END IF

       CALL cl_replace_sqldb(l_sql2) RETURNING l_sql2
	     CALL cl_parse_qry_sql(l_sql2,g_plant_new) RETURNING l_sql2
       DECLARE t230_c2 CURSOR FROM l_sql2
       INITIALIZE  l_tc_amsb.*  TO NULL
       LET l_tc_amsb.tc_amsb01 = tm2.yy
       LET l_tc_amsb.tc_amsb02 = tm2.mm
       LET l_tc_amsb.tc_amsb04= tm2.grup
       LET l_tc_amsb.tc_amsb03= tm2.ver
       LET l_tc_amsb.tc_amsb19='1'

#       LET l_tc_amsb.tc_amsb05=1
       LET l_tc_amsb.tc_amsb06=0


        FOREACH  t230_c2 INTO l_tc_amsb.tc_amsb08,l_tc_amsb.tc_amsb09,l_tc_amsb.tc_amsb10,l_tc_amsb.tc_amsb11,l_tc_amsb.tc_amsb12,l_tc_amsb.tc_amsb13,
                         l_tc_amsb.tc_amsb14,l_tc_amsb.tc_amsb15,l_tc_amsb.tc_amsb16 ,l_omb38
           IF STATUS THEN
              EXIT FOREACH
           END IF

                LET l_tc_amsb.tc_amsb07=l_tc_amp02

               IF l_tc_amsb.tc_amsb15  IS NULL THEN LET l_tc_amsb.tc_amsb15 =0 END IF

                LET l_tc_amsb.tc_amsb16 = l_tc_amsb.tc_amsb15 * l_tc_amsb.tc_amsb14

               LET l_sql3=" SELECT occ37 ",
                           "  FROM ",cl_get_target_table(g_plant_new,'occ_file'),
                           "   WHERE occ01= '",l_tc_amsb.tc_amsb08,"'"

               CALL cl_replace_sqldb(l_sql3) RETURNING l_sql3
	             CALL cl_parse_qry_sql(l_sql3,g_plant_new) RETURNING l_sql3
               DECLARE t130_cc CURSOR FROM l_sql3
               EXECUTE t130_cc INTO l_occ37

#               IF l_occ37='Y' THEN      #关系人
#                    CONTINUE FOREACH
#               ELSE                                    #对外销售
               	   LET l_tc_amsb.tc_amsb19='1'
               	   LET l_tc_amsb.tc_amsb05=l_count1
                   LET l_count1=l_count1+1
#               END IF

               IF l_omb38='A' THEN
                  LET l_tc_amsb.tc_amsb07 =g_plant
                  LET l_tc_amsb.tc_amsb22='3'   #浙江返修收入
               ELSE
                 IF l_tc_amsb.tc_amsb13 LIKE '760%' OR
                   (l_tc_amsb.tc_amsb13 >= '140218130001001' AND l_tc_amsb.tc_amsb13 <= '140218130001007') THEN
                    LET l_tc_amsb.tc_amsb22='2'   #加工收入
                 ELSE
                    LET l_tc_amsb.tc_amsb22='1'   #成品出货收入
                 END IF
               END IF

#              LET l_sql3=" SELECT ccc23 ",
#                      "  FROM ",cl_get_target_table(g_plant_new,'ccc_file'),
#                      "   WHERE ccc02='",tm2.yy,"'",
#                      "    and ccc03='",tm2.mm,"'",
#                      "    and ccc01= '",l_tc_amsb.tc_amsb13,"'"
#
#               CALL cl_replace_sqldb(l_sql3) RETURNING l_sql3
#	             CALL cl_parse_qry_sql(l_sql3,g_plant_new) RETURNING l_sql3
#               DECLARE t230_c3 CURSOR FROM l_sql3
#               EXECUTE t230_c3 INTO l_tc_amsb.tc_amsb17
#
               IF l_tc_amsb.tc_amsb17 IS NULL THEN LET l_tc_amsb.tc_amsb17=0 END IF
               LET l_tc_amsb.tc_amsb18=l_tc_amsb.tc_amsb17*l_tc_amsb.tc_amsb14


               LET l_sql3=" SELECT occ02 ",
                      "  FROM ",cl_get_target_table(g_plant_new,'occ_file'),
                      "   WHERE occ01='",l_tc_amsb.tc_amsb08,"'"
               CALL cl_replace_sqldb(l_sql3) RETURNING l_sql3
	             CALL cl_parse_qry_sql(l_sql3,g_plant_new) RETURNING l_sql3
               DECLARE t230_c4 CURSOR FROM l_sql3
               EXECUTE t230_c4 INTO l_tc_amsb.tc_amsb20     #客户名称

                LET l_sql3=" SELECT ima02 ",
                      "  FROM ",cl_get_target_table(g_plant_new,'ima_file'),
                      "   WHERE ima01='",l_tc_amsb.tc_amsb13,"'"
               CALL cl_replace_sqldb(l_sql3) RETURNING l_sql3
	             CALL cl_parse_qry_sql(l_sql3,g_plant_new) RETURNING l_sql3
               DECLARE t230_c5 CURSOR FROM l_sql3
               EXECUTE t230_c5 INTO l_tc_amsb.tc_amsb21    #料件名称


               INSERT INTO tc_amsb_file VALUES (l_tc_amsb.*)

         END FOREACH
     END FOREACH

     COMMIT WORK
    MESSAGE "OVER!"
END FUNCTION

#FUNCTION t230_cost2()   #材料成本
#DEFINE l_str   STRING
#DEFINE l_sql   STRING
#DEFINE l_sql2   STRING
#DEFINE l_tc_amsb   RECORD LIKE tc_amsb_file.*
#DEFINE l_tc_amtb   RECORD LIKE tc_amtb_file.*
#DEFINE l_pmn31    LIKE pmn_file.pmn31
#DEFINE l_pmm42   LIKE pmm_file.pmm42
#DEFINE l_cnt    LIKE type_file.num5
#DEFINE g_plant_new_t  LIKE azp_file.azp01
#DEFINE l_count LIKE type_file.num5
#DEFINE l_tc_amsb07  LIKE tc_amsb_file.tc_amsb07
#DEFINE l_tc_amsb071  LIKE tc_amsb_file.tc_amsb07
#DEFINE l_tc_amc04  LIKE tc_amc_file.tc_amc04
#DEFINE l_tc_amc03  LIKE tc_amc_file.tc_amc03
#DEFINE l_tc_amx02  LIKE tc_amx_file.tc_amx02
#DEFINE l_tc_ama03  LIKE tc_ama_file.tc_ama03
#DEFINE l_count2     LIKE type_file.num5
#DEFINE l_tc_amp02   LIKE tc_amp_file.tc_amp02
#
#IF tm.tc_amsb01 IS NULL OR tm.tc_amsb02 IS NULL OR tm.tc_amsb03 IS NULL OR tm.tc_amsb04 IS NULL THEN
#   RETURN
#END IF
#
# INITIALIZE  l_tc_amsb.*  TO NULL
# INITIALIZE  l_tc_amtb.*  TO NULL
#
#   LET g_success='Y'
#  LET l_cnt=0
#  SELECT COUNT(*) INTO l_cnt FROM tc_amsb_file
#     WHERE tc_amsb01=tm.tc_amsb01
#      AND tc_amsb02=tm.tc_amsb02
#      AND tc_amsb03=tm.tc_amsb03
#      AND tc_amsb04=tm.tc_amsb04
#       AND tc_amsb19='2'
#
#   IF l_cnt>0 THEN
#      IF NOT cl_confirm("amb-008") THEN
#         LET g_success='N'
#         RETURN
#      END IF
#   END IF
#
#   IF NOT cl_confirm("amb-004") THEN
#       LET g_success='N'
#         RETURN
#    ELSE
#    	  DELETE FROM tc_amsb_file
#    	   WHERE tc_amsb01=tm.tc_amsb01
#          AND tc_amsb02=tm.tc_amsb02
#          AND tc_amsb03=tm.tc_amsb03
#          AND tc_amsb04=tm.tc_amsb04
#          AND tc_amsb19='2'
#   END IF
#
#   LET l_tc_amsb07 ='YLD003'
#   LET l_count2=1
#                           #发料号/工单号/料件/发料量/单价
#     #   LET l_sql=" select sfp01,sfq02,sfe07,sfa06,tc_amx02 ",
#         LET l_sql=" select sfp01,sfq02,sfe07,sfe16,tc_amx02 ",
#                  " from ",  cl_get_target_table(l_tc_amsb07 ,'sfp_file'),",",
#                             cl_get_target_table(l_tc_amsb07 ,'sfq_file'),",",
#                             cl_get_target_table(l_tc_amsb07 ,'sfe_file'),
#                 "  LEFT OUTER JOIN tc_amx_file on tc_amx00='",tm.tc_amsb03 ,"' and sfe07=tc_amx01 ",
#                 "  LEFT OUTER JOIN ", cl_get_target_table(l_tc_amsb07 ,'sfa_file'),
#                 "   ON sfe01=sfa01 AND sfe07=sfa03 AND sfe17=sfa12 AND sfe14=sfa08 AND sfe27=sfa27 ,",
#                            cl_get_target_table(l_tc_amsb07 ,'sfb_file'),
#                             ',',  cl_get_target_table(l_tc_amsb07 ,'ima_file'),
#                 " WHERE sfp01=sfq01 and sfp01=sfe02 and sfe01=sfq02 and sfq02=sfb01 ",
#                 " and YEAR(sfp03)='",tm.tc_amsb01,"'" ,
#                 "   AND MONTH(sfp03)= '",tm.tc_amsb02,"'",
#                 "   AND sfpconf='Y' AND sfp04='Y' ",
#                 "   AND sfp06='1' ",
#                { "   AND (sfb05 LIKE '11%' OR sfb05 like '12%' or sfb05 like '13%' or sfb05 like '14%'  ",
#                 "        OR sfb05 like '213004141001-07%' or sfb05 like '213104141001-05%'  ",
#                 "        OR sfb05 LIKE '960%' OR sfb05='140218130001001-07' )",}
#                 "   AND ima01=sfe07 AND ima08='P'  ",  #add renjj170314
#                 " union all ",
#                 " select sfp01,sfq02,sfe07,-1*abs(sfe16),tc_amx02 ",
#                  " from ",  cl_get_target_table(l_tc_amsb07 ,'sfp_file'),",",
#                             cl_get_target_table(l_tc_amsb07 ,'sfq_file'),",",
#                             cl_get_target_table(l_tc_amsb07 ,'sfe_file'),
#                 "  LEFT OUTER JOIN tc_amx_file on tc_amx00='",tm.tc_amsb03 ,"' and sfe07=tc_amx01 ",
#                 "  LEFT OUTER JOIN ", cl_get_target_table(l_tc_amsb07 ,'sfa_file'),
#                 "   ON sfe01=sfa01 AND sfe07=sfa03 AND sfe17=sfa12 AND sfe14=sfa08 AND sfe27=sfa27 ,",
#                            cl_get_target_table(l_tc_amsb07 ,'sfb_file'),
#                             ',',  cl_get_target_table(l_tc_amsb07 ,'ima_file'),
#                 " WHERE sfp01=sfq01 and sfp01=sfe02 and sfe01=sfq02 and sfq02=sfb01 ",
#                 " and YEAR(sfp03)='",tm.tc_amsb01,"'" ,
#                 "   AND MONTH(sfp03)= '",tm.tc_amsb02,"'",
#                 "   AND sfpconf='Y' AND sfp04='Y' ",
#                 "   AND sfp06='6' ",
#                { "   AND (sfb05 LIKE '11%' OR sfb05 like '12%' or sfb05 like '13%' or sfb05 like '14%'  ",
#                 "        OR sfb05 like '213004141001-07%' or sfb05 like '213104141001-05%'  ",
#                 "        OR sfb05 LIKE '960%' OR sfb05='140218130001001-07' )",}
#                 "   AND ima01=sfe07 AND ima08='P'  "  #add renjj170314
#
#
#      PREPARE t220_amta_prepare FROM l_sql      #預備一下
#      DECLARE tc_amtb_cs CURSOR FOR t220_amta_prepare
#      FOREACH tc_amtb_cs INTO l_tc_amsb.tc_amsb09,l_tc_amsb.tc_amsb11,l_tc_amsb.tc_amsb13,
#                              l_tc_amsb.tc_amsb14,l_tc_amx02
#        IF SQLCA.sqlcode THEN
#            CALL cl_err('foreach:',SQLCA.sqlcode,1)
#            EXIT FOREACH
#        END IF
#
#       LET  l_tc_amsb.tc_amsb01=tm.tc_amsb01
#       LET  l_tc_amsb.tc_amsb02=tm.tc_amsb02
#       LET  l_tc_amsb.tc_amsb03=tm.tc_amsb03
#       LET  l_tc_amsb.tc_amsb04=tm.tc_amsb04
#       LET  l_tc_amsb.tc_amsb19='2'
#
#       LET  l_tc_amsb.tc_amsb05=l_count2
#
#       LET l_count2=l_count2+1
#
#       LET  l_tc_amsb.tc_amsb06=0
#       LET  l_tc_amsb.tc_amsb07=l_tc_amsb07
#
#       LET  l_tc_amsb.tc_amsb17=l_tc_amx02   #单位成本
#       IF l_tc_amsb.tc_amsb17  IS NULL THEN LET l_tc_amsb.tc_amsb17 =0 END IF
#
#
#       LET  l_tc_amsb.tc_amsb18= l_tc_amsb.tc_amsb14* l_tc_amsb.tc_amsb17    #成本
#
#       LET  l_tc_amsb.tc_amsb15=0
#       LET  l_tc_amsb.tc_amsb16=0
#
#              LET l_sql2=" SELECT ima02 ",
#                         "  FROM ",cl_get_target_table(l_tc_amsb07 ,'ima_file'),
#                         "   WHERE ima01='",l_tc_amsb.tc_amsb13,"'"
#
#               CALL cl_replace_sqldb(l_sql2) RETURNING l_sql2
#	             CALL cl_parse_qry_sql(l_sql2,l_tc_amsb07 ) RETURNING l_sql2
#               DECLARE t220_amta_c2 CURSOR FROM l_sql2
#               EXECUTE t220_amta_c2 INTO l_tc_amsb.tc_amsb21
#
#
#             INSERT INTO tc_amsb_file VALUES (l_tc_amsb.*)
#
#             INITIALIZE  l_tc_amsb.*  TO NULL
#      END FOREACH
#
#
#END FUNCTION

FUNCTION t230_cost2()   #材料成本
DEFINE l_str   STRING
DEFINE l_sql   STRING
DEFINE l_sql2   STRING
DEFINE l_tc_amsb   RECORD LIKE tc_amsb_file.*
DEFINE l_tc_amtb   RECORD LIKE tc_amtb_file.*
DEFINE l_pmn31    LIKE pmn_file.pmn31
DEFINE l_pmm42   LIKE pmm_file.pmm42
DEFINE l_cnt    LIKE type_file.num5
DEFINE g_plant_new_t  LIKE azp_file.azp01
DEFINE l_count LIKE type_file.num5
DEFINE l_tc_amsb07  LIKE tc_amsb_file.tc_amsb07
DEFINE l_tc_amsb071  LIKE tc_amsb_file.tc_amsb07
DEFINE l_tc_amc04  LIKE tc_amc_file.tc_amc04
DEFINE l_tc_amc03  LIKE tc_amc_file.tc_amc03
DEFINE l_tc_amx02  LIKE tc_amx_file.tc_amx02
DEFINE l_tc_ama03  LIKE tc_ama_file.tc_ama03
DEFINE l_count2     LIKE type_file.num5
DEFINE l_tc_amp02   LIKE tc_amp_file.tc_amp02

IF tm.tc_amsb01 IS NULL OR tm.tc_amsb02 IS NULL OR tm.tc_amsb03 IS NULL OR tm.tc_amsb04 IS NULL THEN
   RETURN
END IF

 INITIALIZE  l_tc_amsb.*  TO NULL
 INITIALIZE  l_tc_amtb.*  TO NULL

   LET g_success='Y'
  LET l_cnt=0
 SELECT COUNT(*) INTO l_cnt FROM tc_amtb_file
    WHERE tc_amtb01=tm.tc_amsb01
      AND tc_amtb02=tm.tc_amsb02
      AND tc_amtb03=tm.tc_amsb03
      AND tc_amtb04=tm.tc_amsb04

   IF l_cnt>0 THEN
      IF NOT cl_confirm("amb-008") THEN
         LET g_success='N'
         RETURN
      END IF
   END IF

   IF NOT cl_confirm("amb-004") THEN
       LET g_success='N'
         RETURN
    ELSE
    	  DELETE FROM tc_amtb_file
    	   WHERE tc_amtb01=tm.tc_amsb01
          AND tc_amtb02=tm.tc_amsb02
          AND tc_amtb03=tm.tc_amsb03
          AND tc_amtb04=tm.tc_amsb04
   END IF

   LET l_tc_amsb07 ='YLD003'
   LET l_count2=1
       LET l_sql=" select tc_amsb05,tc_amsb07,tc_amsb13,tc_amsb14,tc_amsb21,tc_amc03,tc_amc04,tc_amx02 from ",
                 "   tc_amsb_file, ",
                    cl_get_target_table(l_tc_amsb07 ,'tc_amc_file'),
                 " left outer join tc_amx_file on tc_amx00='",tm.tc_amsb03 ,"' and tc_amc03=tc_amx01 ",
                 " WHERE tc_amsb01 = '",tm.tc_amsb01,"' ",
                 "   AND tc_amsb02 = '",tm.tc_amsb02,"' ",
                 "   AND tc_amsb03 = '",tm.tc_amsb03,"' ",
                 "   AND tc_amsb04 = '",tm.tc_amsb04,"' ",
               #  "   AND tc_amsb19 = '1' ",
               #  "   AND tc_amsb07 = 'YLD001' " ,
                 "   and tc_amc01='",tm.tc_amsb03 ,"'  and tc_amc02=tc_amsb13 ",
                 "  AND tc_amc03 not like '%DL+OH+SUB%'"


      PREPARE t220_amta_prepare FROM l_sql      #預備一下
      DECLARE tc_amtb_cs CURSOR FOR t220_amta_prepare
      FOREACH tc_amtb_cs INTO l_tc_amsb.tc_amsb05,l_tc_amsb.tc_amsb07,l_tc_amsb.tc_amsb13,l_tc_amsb.tc_amsb14,
                              l_tc_amsb.tc_amsb21,l_tc_amc03,l_tc_amc04,l_tc_amx02
        IF SQLCA.sqlcode THEN
            CALL cl_err('foreach:',SQLCA.sqlcode,1)
            EXIT FOREACH
        END IF

       LET  l_tc_amtb.tc_amtb01=tm.tc_amsb01
       LET  l_tc_amtb.tc_amtb02=tm.tc_amsb02
       LET  l_tc_amtb.tc_amtb03=tm.tc_amsb03
       LET  l_tc_amtb.tc_amtb04=tm.tc_amsb04


       LET  l_tc_amtb.tc_amtb05=l_tc_amsb.tc_amsb05

          SELECT MAX(tc_amtb06)+1 INTO l_tc_amtb.tc_amtb06  FROM  tc_amtb_file
            WHERE tc_amtb01=tm.tc_amsb01
             AND tc_amtb02=tm.tc_amsb02
             AND tc_amtb03=tm.tc_amsb03
             AND tc_amtb04=tm.tc_amsb04
             AND tc_amtb05=l_tc_amtb.tc_amtb05

            IF l_tc_amtb.tc_amtb06 IS NULL THEN LET l_tc_amtb.tc_amtb06=1 END IF

       LET  l_tc_amtb.tc_amtb07=l_tc_amsb07

       LET  l_tc_amtb.tc_amtb08=l_tc_amsb.tc_amsb13  #主件
       LET  l_tc_amtb.tc_amtb17=l_tc_amsb.tc_amsb21
       LET  l_tc_amtb.tc_amtb09=l_tc_amsb.tc_amsb14

       LET  l_tc_amtb.tc_amtb10=l_tc_amc03   #采购料件
       LET  l_tc_amtb.tc_amtb12=l_tc_amc04  *l_tc_amsb.tc_amsb14  #数量



        LET l_tc_amtb.tc_amtb13  = 0

        LET  l_tc_amtb.tc_amtb13= l_tc_amx02

        IF l_tc_amtb.tc_amtb13 IS NULL THEN LET l_tc_amtb.tc_amtb13=0 END IF

        LET  l_tc_amtb.tc_amtb14= l_tc_amtb.tc_amtb13* l_tc_amtb.tc_amtb12

              LET l_sql2=" SELECT ima02 ",
                         "  FROM ",cl_get_target_table(l_tc_amsb07 ,'ima_file'),
                         "   WHERE ima01='",l_tc_amtb.tc_amtb10,"'"

               CALL cl_replace_sqldb(l_sql2) RETURNING l_sql2
	             CALL cl_parse_qry_sql(l_sql2,l_tc_amsb07 ) RETURNING l_sql2
               DECLARE t220_amta_c2 CURSOR FROM l_sql2
               EXECUTE t220_amta_c2 INTO l_tc_amtb.tc_amtb11


             INSERT INTO tc_amtb_file VALUES (l_tc_amtb.*)

             INITIALIZE  l_tc_amtb.*  TO NULL
      END FOREACH

         LET l_sql=" update tc_amsb_file set tc_amsb18=(select sum(tc_amtb14) from tc_amtb_file ",
               "  where tc_amsb01=tc_amtb01 and tc_amsb02=tc_amtb02 and tc_amsb03=tc_amtb03 ",
               " and tc_amsb04=tc_amtb04 and tc_amsb05=tc_amtb05 )",
               " WHERE tc_amsb01 = '",tm.tc_amsb01,"' ",
               "   AND tc_amsb02 = '",tm.tc_amsb02,"' ",
               "   AND tc_amsb03 = '",tm.tc_amsb03,"' ",
               "   AND tc_amsb04 = '",tm.tc_amsb04,"' ",
               "   AND tc_amsb19 = '1'  "
           PREPARE update_p1 FROM l_sql
           EXECUTE update_p1

       UPDATE tc_amsb_file SET tc_amsb17=tc_amsb18/tc_amsb14
        WHERE  tc_amsb01 = tm.tc_amsb01
                AND tc_amsb02 = tm.tc_amsb02
                AND tc_amsb03 = tm.tc_amsb03
                AND tc_amsb04 = tm.tc_amsb04
              #  AND tc_amsb19 = '1'

         UPDATE tc_amsb_file SET tc_amsb18=0
        WHERE  tc_amsb01 = tm.tc_amsb01
                AND tc_amsb02 = tm.tc_amsb02
                AND tc_amsb03 = tm.tc_amsb03
                AND tc_amsb04 = tm.tc_amsb04
              #  AND tc_amsb19 = '1'
                AND tc_amsb18 IS NULL

       UPDATE tc_amsb_file SET tc_amsb17=0
        WHERE  tc_amsb01 = tm.tc_amsb01
                AND tc_amsb02 = tm.tc_amsb02
                AND tc_amsb03 = tm.tc_amsb03
                AND tc_amsb04 = tm.tc_amsb04
              #  AND tc_amsb19 = '1'
                AND tc_amsb18=0

       UPDATE tc_amsb_file SET tc_amsb18=tc_amsb18*(-1)
           WHERE tc_amsb01=tm.tc_amsb01
            AND tc_amsb02=tm.tc_amsb02
            AND tc_amsb03=tm.tc_amsb03
            AND tc_amsb04=tm.tc_amsb04
            AND tc_amsb18>0
            AND tc_amsb14<0

END FUNCTION

FUNCTION t230_cost3()    #生产数据
DEFINE l_sql      STRING
DEFINE l_sql2     STRING
DEFINE l_sql3     STRING

DEFINE l_cnt    LIKE type_file.num5
DEFINE l_tc_amsb   RECORD LIKE tc_amsb_file.*
DEFINE l_tc_amu   RECORD LIKE tc_amu_file.*
DEFINE l_tc_amtb07  LIKE tc_amtb_file.tc_amtb07
DEFINE l_sfa05   LIKE sfa_file.sfa05
DEFINE l_cch31  LIKE cch_file.cch31
DEFINE l_cch32a   LIKE cch_file.cch32a
DEFINE l_cch32   LIKE cch_file.cch32
DEFINE l_tc_amu05 LIKE tc_amu_file.tc_amu05
DEFINE l_tc_amu06 LIKE tc_amu_file.tc_amu06
DEFINE l_tc_amu17 LIKE tc_amu_file.tc_amu17
DEFINE l_tc_amu07  LIKE tc_amu_file.tc_amu07
  LET g_success='Y'
  LET l_cnt=0
  SELECT COUNT(*) INTO l_cnt FROM tc_amu_file
    WHERE tc_amu01=tm.tc_amsb01
      AND tc_amu02=tm.tc_amsb02
      AND tc_amu03=tm.tc_amsb03
      AND tc_amu04=tm.tc_amsb04

   IF l_cnt>0 THEN
      IF NOT cl_confirm("amb-005") THEN
         LET g_success='N'
         RETURN
      END IF
   END IF

   MESSAGE "WORKING !"
   BEGIN WORK
   IF NOT cl_confirm("amb-004") THEN
       LET g_success='N'
         RETURN
    ELSE
    	 DELETE FROM tc_amu_file
    	  WHERE tc_amu01=tm.tc_amsb01
         AND tc_amu02=tm.tc_amsb02
         AND tc_amu03=tm.tc_amsb03
         AND tc_amu04=tm.tc_amsb04
   END IF
   INITIALIZE  l_tc_amsb.*  TO NULL
   INITIALIZE  l_tc_amu.*  TO NULL
  LET l_sql = " select * from tc_amsb_file  ",
              " WHERE tc_amsb01 = '",tm.tc_amsb01,"' ",
              "   AND tc_amsb02 = '",tm.tc_amsb02,"' ",
              "   AND tc_amsb03 = '",tm.tc_amsb03,"' ",
              "   AND tc_amsb04 = '",tm.tc_amsb04,"' ",
              "   and (tc_amsb07='YLD001' OR tc_amsb07='YLD004') ",
              "   AND tc_amsb11 IS NOT NULL  ",
              "   AND tc_amsb13 NOT LIKE '3210%' "

    PREPARE t230_amu_prepare FROM l_sql      #預備一下
    DECLARE tc_amu_cs CURSOR FOR t230_amu_prepare


    FOREACH tc_amu_cs  INTO l_tc_amsb.*
       IF SQLCA.sqlcode THEN
          CALL cl_err('foreach:',SQLCA.sqlcode,1)
          EXIT FOREACH
       END IF
        LET l_tc_amu.tc_amu12=1
        LET g_plant_new=l_tc_amsb.tc_amsb07
          LET l_sql2=" SELECT sfb01,sfa03,sfa05,sfbud10 ",
                     "  FROM ",cl_get_target_table(g_plant_new,'sfa_file'),",",
                                cl_get_target_table(g_plant_new,'sfb_file'),
                     " where sfa01=sfb01 and sfb22='",l_tc_amsb.tc_amsb11,"'",
                     "   and sfb221='",l_tc_amsb.tc_amsb12,"'"

                 PREPARE t230_amu_prepare2 FROM l_sql2      #預備一下
                 DECLARE tc_amu_cs2 CURSOR FOR t230_amu_prepare2

                        LET l_tc_amu.tc_amu01 = l_tc_amsb.tc_amsb01
                        LET l_tc_amu.tc_amu02 = l_tc_amsb.tc_amsb02
                        LET l_tc_amu.tc_amu03 = l_tc_amsb.tc_amsb03
                        LET l_tc_amu.tc_amu04 = l_tc_amsb.tc_amsb04
                        LET l_tc_amu.tc_amu05 = l_tc_amsb.tc_amsb05
                        LET l_tc_amu.tc_amu07 = l_tc_amsb.tc_amsb07
                        LET l_tc_amu.tc_amu09 = l_tc_amsb.tc_amsb11
                        LET l_tc_amu.tc_amu10 = l_tc_amsb.tc_amsb12

#                 LET  l_tc_amu.tc_amu06=1  #序号
                 FOREACH tc_amu_cs2 INTO l_tc_amu.tc_amu11,l_tc_amu.tc_amu13,l_tc_amu.tc_amu14,l_tc_amu.tc_amu17
                      IF SQLCA.sqlcode THEN
                         CALL cl_err('foreach:',SQLCA.sqlcode,1)
                         EXIT FOREACH
                       END IF

                    LET l_sql3=" SELECT ima02 ",
                                "  FROM ",cl_get_target_table(g_plant_new,'ima_file'),
                                "   WHERE ima01='",l_tc_amu.tc_amu13,"'"
                       CALL cl_replace_sqldb(l_sql3) RETURNING l_sql3
	                     CALL cl_parse_qry_sql(l_sql3,g_plant_new) RETURNING l_sql3
                       DECLARE t230_ima CURSOR FROM l_sql3
                       EXECUTE t230_ima INTO l_tc_amu.tc_amu08

                        SELECT MAX(tc_amu06)+1 INTO l_tc_amu.tc_amu06 FROM tc_amu_file
                             WHERE tc_amu01=tm.tc_amsb01
                               AND tc_amu02=tm.tc_amsb02
                               AND tc_amu03=tm.tc_amsb03
                               AND tc_amu04=tm.tc_amsb04
                               AND tc_amu05=l_tc_amu.tc_amu05
                         IF l_tc_amu.tc_amu06 IS NULL THEN
                             LET l_tc_amu.tc_amu06=1
                         END IF

                     IF l_tc_amu.tc_amu07='YLD005'  AND l_tc_amu.tc_amu13  LIKE '912%' THEN
                        LET l_tc_amu.tc_amu15 =0
                        SELECT tc_ama03 INTO l_tc_amu.tc_amu15 FROM tc_ama_file
                          WHERE tc_ama01=l_tc_amu.tc_amu13  AND tc_ama04=tm.tc_amsb03
                        IF l_tc_amu.tc_amu15  IS NULL THEN LET l_tc_amu.tc_amu15 =0 END IF
                        LET  l_tc_amu.tc_amu16=l_tc_amu.tc_amu15* l_tc_amu.tc_amu14
                     ELSE
                       LET l_cch31=0
                       LET l_cch32a=0
                       LET l_cch32=0
                       LET l_sql3=" SELECT -1*sum(cch32a+cch32d),-1*sum(cch32),-1*sum(cch31) ",   #材料/小计/数量
                                 "  FROM ",cl_get_target_table(g_plant_new,'cch_file'),
                                 "   WHERE cch01='",l_tc_amu.tc_amu11,"'" ,
#                                 "   and cch02='",tm.tc_amsb01,"'",
#                                 "   and cch03='",tm.tc_amsb02,"'",
                                 "   and cch04='",l_tc_amu.tc_amu13,"'"
                       CALL cl_replace_sqldb(l_sql3) RETURNING l_sql3
	                     CALL cl_parse_qry_sql(l_sql3,g_plant_new) RETURNING l_sql3
                       DECLARE t230_cch CURSOR FROM l_sql3
                       EXECUTE t230_cch INTO l_cch32a,l_cch32,l_cch31

                       IF l_tc_amu.tc_amu07='YLD005' THEN   #科技
                          LET l_tc_amu.tc_amu16= l_cch32a
                       ELSE
                        	LET l_tc_amu.tc_amu16= l_cch32
                       END IF

                       LET l_tc_amu.tc_amu14=l_cch31    #数量

#                       IF l_tc_amu.tc_amu13 LIKE '914%' AND  l_tc_amu.tc_amu07='YLD001'  THEN   #股份'914'开头
#                          LET l_tc_amu.tc_amu15=0
#                          LET l_tc_amu.tc_amu16=0
#                       ELSE
                          LET  l_tc_amu.tc_amu15=l_tc_amu.tc_amu16/l_cch31
#                       END IF
                      END IF

                       INSERT INTO tc_amu_file VALUES (l_tc_amu.*)
#                       LET l_tc_amu.tc_amu06 =l_tc_amu.tc_amu06 +1
                END FOREACH
               INITIALIZE  l_tc_amu.*  TO NULL
       END FOREACH

       LET l_sql=" SELECT distinct tc_amu05,tc_amu07,tc_amu17,max(tc_amu06)+1 ",
                 " from tc_amu_file ",
                 " WHERE tc_amu01 = '",tm.tc_amsb01,"' ",
                 "   AND tc_amu02 = '",tm.tc_amsb02,"' ",
                 "   AND tc_amu03 = '",tm.tc_amsb03,"' ",
                 "   AND tc_amu04 = '",tm.tc_amsb04,"' ",
                 "   AND tc_amu17 is not null ",
                 "   group by tc_amu05,tc_amu07,tc_amu17 ",
                 "  order by tc_amu05 "
         PREPARE t230_amu_prepare4 FROM l_sql      #預備一下
         DECLARE tc_amu_cs4 CURSOR FOR t230_amu_prepare4
         FOREACH tc_amu_cs4  INTO l_tc_amu05,l_tc_amu07,l_tc_amu17,l_tc_amu06
            IF SQLCA.sqlcode THEN
               CALL cl_err('foreach:',SQLCA.sqlcode,1)
               EXIT FOREACH
            END IF
             LET l_tc_amu.tc_amu01 = tm.tc_amsb01
             LET l_tc_amu.tc_amu02 = tm.tc_amsb02
             LET l_tc_amu.tc_amu03 = tm.tc_amsb03
             LET l_tc_amu.tc_amu04 = tm.tc_amsb04
             LET l_tc_amu.tc_amu05 = l_tc_amu05
             LET l_tc_amu.tc_amu07 = 'YLD005'                  #科技
             LET l_tc_amu.tc_amu17 = l_tc_amu17
              LET l_tc_amu.tc_amu12=1

             LET g_plant_new=l_tc_amu.tc_amu07
             LET l_sql2=" select  sfb22,sfb221,sfb01,sfa03,sfa05 ",
                        "  FROM ",cl_get_target_table(g_plant_new,'sfa_file'),",",
                                  cl_get_target_table(g_plant_new,'sfb_file'),
                        " where sfa01=sfb01 and sfbud10='",l_tc_amu17,"'"

               PREPARE t230_amu_prepare5 FROM l_sql2      #預備一下
               DECLARE tc_amu_cs5 CURSOR FOR t230_amu_prepare5
               FOREACH tc_amu_cs5 INTO l_tc_amu.tc_amu09,l_tc_amu.tc_amu10,
                                       l_tc_amu.tc_amu11,l_tc_amu.tc_amu13,
                                       l_tc_amu.tc_amu14


                         UPDATE tc_amu_file SET tc_amu15=0,tc_amu16=0
                            WHERE tc_amu01=tm.tc_amsb01
                            AND tc_amu02=tm.tc_amsb02
                            AND tc_amu03=tm.tc_amsb03
                            AND tc_amu04=tm.tc_amsb04
                            AND tc_amu05=l_tc_amu.tc_amu05
                            AND (tc_amu13 LIKE '914%' OR tc_amu13 LIKE '924%')
                             AND tc_amu07<>'YLD005'

                      LET l_tc_amu.tc_amu06=l_tc_amu06
                      LET l_sql3=" SELECT ima02 ",
                                "  FROM ",cl_get_target_table(g_plant_new,'ima_file'),
                                "   WHERE ima01='",l_tc_amu.tc_amu13,"'"
                       CALL cl_replace_sqldb(l_sql3) RETURNING l_sql3
	                     CALL cl_parse_qry_sql(l_sql3,g_plant_new) RETURNING l_sql3
                       DECLARE t230_ima5 CURSOR FROM l_sql3
                       EXECUTE t230_ima5 INTO l_tc_amu.tc_amu08

                        LET l_tc_amu.tc_amu15=0
#                       SELECT tc_amv02 INTO l_tc_amu.tc_amu15  FROM tc_amv_file
#                         WHERE tc_amv00=l_tc_amu.tc_amu03 AND tc_amv01=l_tc_amu.tc_amu13
#                     IF cl_null(l_tc_amu.tc_amu15) THEN

                     IF l_tc_amu.tc_amu07='YLD005'  AND l_tc_amu.tc_amu13  LIKE '912%' THEN
                        LET l_tc_amu.tc_amu15 =0
                        SELECT tc_ama03 INTO l_tc_amu.tc_amu15 FROM tc_ama_file
                          WHERE tc_ama01=l_tc_amu.tc_amu13  AND tc_ama04=tm.tc_amsb03
                        IF l_tc_amu.tc_amu15  IS NULL THEN LET l_tc_amu.tc_amu15 =0 END IF
                        LET  l_tc_amu.tc_amu16=l_tc_amu.tc_amu15* l_tc_amu.tc_amu14
                     ELSE
                       LET l_cch31=0
                       LET l_cch32a=0
                       LET l_cch32=0
                       LET l_sql3=" SELECT -1*sum(cch32a+cch32d),-1*sum(cch32),-1*sum(cch31) ",   #材料/小计/数量
                                 "  FROM ",cl_get_target_table(g_plant_new,'cch_file'),
                                 "   WHERE cch01='",l_tc_amu.tc_amu11,"'" ,
#                                 "   and cch02='",tm.tc_amsb01,"'",
#                                 "   and cch03='",tm.tc_amsb02,"'",
                                 "   and cch04='",l_tc_amu.tc_amu13,"'"
                       CALL cl_replace_sqldb(l_sql3) RETURNING l_sql3
	                     CALL cl_parse_qry_sql(l_sql3,g_plant_new) RETURNING l_sql3
                       DECLARE t230_cch2 CURSOR FROM l_sql3
                       EXECUTE t230_cch2 INTO l_cch32a,l_cch32,l_cch31

                       IF l_cch32a IS NULL THEN LET l_cch32a=0 END IF
                       IF l_cch32 IS NULL THEN LET l_cch32=0 END IF
                       IF l_cch31 IS NULL THEN LET l_cch31=0 END IF
                       IF l_tc_amu.tc_amu07='YLD005' THEN   #科技
                          LET l_tc_amu.tc_amu16= l_cch32a
                       ELSE
                        	LET l_tc_amu.tc_amu16= l_cch32
                       END IF
                       LET l_tc_amu.tc_amu14=l_cch31    #数量
                       LET  l_tc_amu.tc_amu15=l_tc_amu.tc_amu16/l_cch31
#                    ELSE
#                    	 LET l_tc_amu.tc_amu16 =l_tc_amu.tc_amu15*l_tc_amu.tc_amu14
#                    END IF
                     END IF
                       INSERT INTO tc_amu_file VALUES (l_tc_amu.*)
                       LET l_tc_amu06=l_tc_amu06+1

                   END FOREACH
                 INITIALIZE  l_tc_amu.*  TO NULL
            END FOREACH
    COMMIT WORK
    MESSAGE "OVER!"
END FUNCTION

FUNCTION t230_cost4()    #对内销售
DEFINE l_sql   STRING
DEFINE l_sql2  STRING
DEFINE l_slq3  STRING

DEFINE l_cnt LIKE type_file.num5
DEFINE l_tc_amsb   RECORD LIKE tc_amsb_file.*
DEFINE l_tc_amtb   RECORD LIKE tc_amtb_file.*
DEFINE l_tc_amtb07  LIKE tc_amtb_file.tc_amtb07

LET l_cnt=0
SELECT COUNT(*) INTO l_cnt FROM tc_amtb_file
   WHERE tc_amtb01=tm.tc_amsb01
      AND tc_amtb02=tm.tc_amsb02
      AND tc_amtb03=tm.tc_amsb03
      AND tc_amtb04=tm.tc_amsb04
 IF l_cnt=0 OR l_cnt IS NULL THEN
    CALL cl_err('','amb-006',2)
    RETURN
 END IF


 LET l_cnt=0
SELECT COUNT(*) INTO l_cnt FROM tc_amsb_file
    WHERE tc_amsb01=tm.tc_amsb01
      AND tc_amsb02=tm.tc_amsb02
      AND tc_amsb03=tm.tc_amsb03
      AND tc_amsb04=tm.tc_amsb04
      AND tc_amsb19='2'

   IF l_cnt>0 THEN
      IF NOT cl_confirm("amb-007") THEN
         LET g_success='N'
         RETURN
      END IF
   END IF

   IF NOT cl_confirm("amb-004") THEN
       LET g_success='N'
        RETURN
    ELSE
    	 DELETE FROM tc_amsb_file
    	  WHERE tc_amsb01=tm.tc_amsb01
         AND tc_amsb02=tm.tc_amsb02
         AND tc_amsb03=tm.tc_amsb03
         AND tc_amsb04=tm.tc_amsb04
         AND tc_amsb19='2'
   END IF

     INITIALIZE  l_tc_amsb.*  TO NULL
     INITIALIZE  l_tc_amtb.*  TO NULL

    LET l_sql=" SELECT * from tc_amtb_file ",
              " WHERE tc_amtb01 = '",tm.tc_amsb01,"' ",
              "   AND tc_amtb02 = '",tm.tc_amsb02,"' ",
              "   AND tc_amtb03 = '",tm.tc_amsb03,"' ",
              "   AND tc_amtb04 = '",tm.tc_amsb04,"' ",
              "   and (tc_amtb08='YLD001' OR tc_amtb08='YLD004') ",
              "  and tc_amtb17 IS NOT NULL "
     PREPARE t230_amsb2_prepare FROM l_sql      #預備一下
     DECLARE tc_amsb2_cs CURSOR FOR t230_amsb2_prepare


     FOREACH tc_amsb2_cs  INTO l_tc_amtb.*
       IF SQLCA.sqlcode THEN
          CALL cl_err('foreach0:',SQLCA.sqlcode,1)
          EXIT FOREACH
       END IF
       LET l_tc_amsb.tc_amsb19='2'
       LET l_tc_amsb.tc_amsb01=l_tc_amtb.tc_amtb01
       LET l_tc_amsb.tc_amsb02=l_tc_amtb.tc_amtb02
       LET l_tc_amsb.tc_amsb03=l_tc_amtb.tc_amtb03
       LET l_tc_amsb.tc_amsb04=l_tc_amtb.tc_amtb04
       LET l_tc_amsb.tc_amsb05=l_tc_amtb.tc_amtb05
       LET l_tc_amsb.tc_amsb06=l_tc_amtb.tc_amtb06

       LET l_tc_amsb.tc_amsb07=l_tc_amtb.tc_amtb08  #公司
       LET l_tc_amsb.tc_amsb08=l_tc_amtb.tc_amtb07  #客户

       LET g_plant_new=l_tc_amsb.tc_amsb07

       SELECT azp02 INTO l_tc_amsb.tc_amsb20 FROM azp_file WHERE azp01=l_tc_amsb.tc_amsb08

       LET l_sql2=" select oeb01,oeb03,oeb04,oeb06,oeb12,oeb13,oeb14 ",   #订单/项次/产品编号/名称/数量/单价/金额
                  "  FROM ",cl_get_target_table(g_plant_new,'oea_file'),",",
                             cl_get_target_table(g_plant_new,'oeb_file'),
                  " where oea01=oeb01 and oea99='",l_tc_amtb.tc_amtb17,"'",
                  "  and oeb03='",l_tc_amtb.tc_amtb10,"'"
               CALL cl_replace_sqldb(l_sql2) RETURNING l_sql2
	             CALL cl_parse_qry_sql(l_sql2,g_plant_new) RETURNING l_sql2
               DECLARE t230_amsb2_c2 CURSOR FROM l_sql2
               EXECUTE t230_amsb2_c2 INTO l_tc_amsb.tc_amsb11,l_tc_amsb.tc_amsb12,l_tc_amsb.tc_amsb13,
                                         l_tc_amsb.tc_amsb21,l_tc_amsb.tc_amsb14,l_tc_amsb.tc_amsb15,l_tc_amsb.tc_amsb16

               LET l_tc_amsb.tc_amsb15=l_tc_amsb.tc_amsb16/l_tc_amsb.tc_amsb14     #不含税单价
               INSERT INTO tc_amsb_file VALUES (l_tc_amsb.*)
               INITIALIZE  l_tc_amsb.*  TO NULL
      END FOREACH
END FUNCTION

FUNCTION t230_cost5()   #销售成本
DEFINE l_sql  STRING
DEFINE l_sql2  STRING
DEFINE l_tc_amtb16  LIKE tc_amtb_file.tc_amtb16  #采购成本
DEFINE l_tc_amu16  LIKE tc_amu_file.tc_amu16   #生产成本
DEFINE l_tc_amsb05  LIKE tc_amsb_file.tc_amsb05
DEFINE l_tc_amsb07  LIKE tc_amsb_file.tc_amsb07
DEFINE l_tc_amsb13  LIKE tc_amsb_file.tc_amsb13
DEFINE l_ccc23a    LIKE ccc_file.ccc23a

      IF NOT cl_confirm("amb-004") THEN
         LET g_success='N'
        RETURN
      ELSE
      	UPDATE tc_amsb_file SET tc_amsb17=0,tc_amsb18=0
      	  WHERE tc_amsb01=tm.tc_amsb01
            AND tc_amsb02=tm.tc_amsb02
            AND tc_amsb03=tm.tc_amsb03
            AND tc_amsb04=tm.tc_amsb04
      END IF
#   LET l_sql=" UPDATE tc_amsb_file a set a.tc_amsb18=(select b.tc_amtb16 from tc_amtb_file b where ",
#             "  a.tc_amsb01=b.tc_amtb01 and a.tc_amsb02=b.tc_amtb02 and  a.tc_amsb03=b.tc_amtb03 and  a.tc_amsb04=b.tc_amtb04 ",
#             " and a.tc_amsb05=b.tc_amtb05 and a.tc_amsb07=b.tc_amtb07 and b.tc_amtb08<>'YLD001' and b.tc_amtb08<>'YLD004')  ",
#             " WHERE tc_amsb01 = '",tm.tc_amsb01,"' ",
#             "   AND tc_amsb02 = '",tm.tc_amsb02,"' ",
#             "   AND tc_amsb03 = '",tm.tc_amsb03,"' ",
#             "   AND tc_amsb04 = '",tm.tc_amsb04,"' ",
#             "   AND tc_amsb19 = '1'  "
#         PREPARE update_p1 FROM l_sql
#         EXECUTE update_p1



     LET l_sql=" update tc_amsb_file set tc_amsb18=(select sum(tc_amtb14) from tc_amtb_file ",
                "  where tc_amsb01=tc_amtb01 and tc_amsb02=tc_amtb02 and tc_amsb03=tc_amtb03 ",
               " and tc_amsb04=tc_amtb04 and tc_amsb05=tc_amtb05 )",
               " WHERE tc_amsb01 = '",tm.tc_amsb01,"' ",
               "   AND tc_amsb02 = '",tm.tc_amsb02,"' ",
               "   AND tc_amsb03 = '",tm.tc_amsb03,"' ",
               "   AND tc_amsb04 = '",tm.tc_amsb04,"' "
           PREPARE update_p0 FROM l_sql
           EXECUTE update_p0



#      LET l_sql=" UPDATE tc_amsb_file a set a.tc_amsb17=(select b.tc_amtb15 from tc_amtb_file b where ",
#               "  a.tc_amsb01=b.tc_amtb01 and a.tc_amsb02=b.tc_amtb02 and  a.tc_amsb03=b.tc_amtb03  ",
#               "  and  a.tc_amsb04=b.tc_amtb04 and a.tc_amsb05=b.tc_amtb05  )  ",
#               " WHERE tc_amsb01 = '",tm.tc_amsb01,"' ",
#               "   AND tc_amsb02 = '",tm.tc_amsb02,"' ",
#               "   AND tc_amsb03 = '",tm.tc_amsb03,"' ",
#               "   AND tc_amsb04 = '",tm.tc_amsb04,"' ",
#               "   AND tc_amsb19 = '2'  ",
#               "   AND tc_amsb05 NOT IN(SELECT DISTINCT tc_amu05 from tc_amu_file ",
#               " WHERE tc_amu01 = '",tm.tc_amsb01,"' ",
#               "   AND tc_amu02 = '",tm.tc_amsb02,"' ",
#               "   AND tc_amu03 = '",tm.tc_amsb03,"' ",
#               "   AND tc_amu04 = '",tm.tc_amsb04,"' )"
#         PREPARE update_p2 FROM l_sql
#         EXECUTE update_p2

       UPDATE tc_amsb_file SET tc_amsb17=tc_amsb18/tc_amsb14
        WHERE  tc_amsb01 = tm.tc_amsb01
                AND tc_amsb02 = tm.tc_amsb02
                AND tc_amsb03 = tm.tc_amsb03
                AND tc_amsb04 = tm.tc_amsb04

         UPDATE tc_amsb_file SET tc_amsb18=0
        WHERE  tc_amsb01 = tm.tc_amsb01
                AND tc_amsb02 = tm.tc_amsb02
                AND tc_amsb03 = tm.tc_amsb03
                AND tc_amsb04 = tm.tc_amsb04
              #  AND tc_amsb19 = '1'
                AND tc_amsb18 IS NULL

       UPDATE tc_amsb_file SET tc_amsb17=0
           WHERE tc_amsb01=tm.tc_amsb01
            AND tc_amsb02=tm.tc_amsb02
            AND tc_amsb03=tm.tc_amsb03
            AND tc_amsb04=tm.tc_amsb04
            AND tc_amsb17 IS NULL

         UPDATE tc_amsb_file SET tc_amsb18=tc_amsb18*(-1)
           WHERE tc_amsb01=tm.tc_amsb01
            AND tc_amsb02=tm.tc_amsb02
            AND tc_amsb03=tm.tc_amsb03
            AND tc_amsb04=tm.tc_amsb04
            AND tc_amsb18>0
            AND tc_amsb14<0
END FUNCTION

FUNCTION t230_b_fill(p_wc)              #BODY FILL UP
DEFINE p_wc   LIKE type_file.chr1000       #No.FUN-680136 VARCHAR(200)
DEFINE l_tc_amsb16 LIKE tc_amsb_file.tc_amsb16
DEFINE l_tc_amsb18 LIKE tc_amsb_file.tc_amsb18


      CALL g_tc_amsb.clear()     #MOD-A10082
      LET g_sql = "SELECT tc_amsb05,tc_amsb06,tc_amsb07,azp02,tc_amsb08,tc_amsb20,tc_amsb09,tc_amsb10,tc_amsb11,tc_amsb12, ",
                  "  tc_amsb13,tc_amsb21,tc_amsb14,tc_amsb15,tc_amsb16,tc_amsb17,tc_amsb18 ",
#                  " FROM tc_amsb_file  ",
                 "  FROM tc_amsb_file LEFT OUTER JOIN azp_file ON azp01=tc_amsb07 ",
                 " WHERE tc_amsb01 = '",tm.tc_amsb01,"' ",
                 "   AND tc_amsb02 = '",tm.tc_amsb02,"' ",
                 "   AND tc_amsb03 = '",tm.tc_amsb03,"' ",
                 "   AND tc_amsb04 = '",tm.tc_amsb04,"' ",
                 "   AND tc_amsb19 = '1' ",
                 "    AND ",p_wc CLIPPED ,
                 " ORDER BY 1,2 "

    PREPARE t230_prepare FROM g_sql      #預備一下
    DECLARE tc_amsb_cs CURSOR FOR t230_prepare
    LET g_cnt = 1
    LET g_rec_b=0

     #RENJJ 160122
    LET l_tc_amsb16 =0
    LET l_tc_amsb18 =0
     #RENJJ 160122

    FOREACH tc_amsb_cs INTO g_tc_amsb[g_cnt].*   #單身 ARRAY 填充
       IF SQLCA.sqlcode THEN
          CALL cl_err('foreach:',SQLCA.sqlcode,1)
          EXIT FOREACH
       END IF
#         SELECT ima02,ima021 INTO g_tc_amsb[g_cnt].ima02_0,g_tc_amsb[g_cnt].ima021_0
#              FROM ima_file WHERE ima01=g_tc_amsb[g_cnt].tc_amsb013
           ### add
          IF g_tc_amsb[g_cnt].tc_amsb16 IS NULL THEN LET g_tc_amsb[g_cnt].tc_amsb16= 0 END IF
          IF g_tc_amsb[g_cnt].tc_amsb18 IS NULL THEN LET g_tc_amsb[g_cnt].tc_amsb18 = 0 END IF
          ### add

          #RENJJ 160122
           LET l_tc_amsb16 = l_tc_amsb16  +  g_tc_amsb[g_cnt].tc_amsb16
           LET l_tc_amsb18 = l_tc_amsb18 +  g_tc_amsb[g_cnt].tc_amsb18
          #RENJJ 160122

       LET g_cnt = g_cnt + 1

#       IF g_cnt > g_max_rec THEN
#          CALL cl_err( '', 9035, 0 )
#          EXIT FOREACH
#       END IF
    END FOREACH

    CALL g_tc_amsb.deleteElement(g_cnt)
#     #RENJJ 160122
#      LET  g_tc_amsb[g_cnt].tc_amsb21  ="  合计:"
#      LET  g_tc_amsb[g_cnt].tc_amsb16  = l_tc_amsb16
#      LET  g_tc_amsb[g_cnt].tc_amsb18  = l_tc_amsb18
#      DISPLAY BY NAME g_tc_amsb[g_cnt].*
#
#      #RENJJ 160122
    LET g_rec_b = g_cnt - 1
    LET g_cnt = 0

#    DISPLAY g_rec_b TO FORMONLY.cn2

END FUNCTION

FUNCTION t230_b_fill2(p_wc)              #BODY FILL UP
DEFINE p_wc   LIKE type_file.chr1000       #No.FUN-680136 VARCHAR(200)
DEFINE l_tc_amsb16 LIKE tc_amsb_file.tc_amsb16
DEFINE l_tc_amsb18 LIKE tc_amsb_file.tc_amsb18


    CALL g_tc_amsb_1.clear()     #MOD-A10082


   LET g_sql = "SELECT tc_amsb05,tc_amsb06,tc_amsb07,azp02,tc_amsb08,tc_amsb20,tc_amsb09,tc_amsb10,tc_amsb11,tc_amsb12, ",
                  "  tc_amsb13,tc_amsb21,tc_amsb14,tc_amsb15,tc_amsb16,tc_amsb17,tc_amsb18 ",
#                  " FROM tc_amsb_file  ",
                 "  FROM tc_amsb_file LEFT OUTER JOIN azp_file ON azp01=tc_amsb07 ",
                 " WHERE tc_amsb01 = '",tm.tc_amsb01,"' ",
                 "   AND tc_amsb02 = '",tm.tc_amsb02,"' ",
                 "   AND tc_amsb03 = '",tm.tc_amsb03,"' ",
                 "   AND tc_amsb04 = '",tm.tc_amsb04,"' ",
                 "   AND tc_amsb19 = '2' ",
                 "    AND ",p_wc CLIPPED ,
                 " ORDER BY 1,2 "
    PREPARE t230_prepare1 FROM g_sql
    DECLARE t230_amsb_cs1 CURSOR FOR t230_prepare1
    LET g_cnt = 1
    LET g_rec_b2=0

    #RENJJ 160122
    LET l_tc_amsb16 =0
    LET l_tc_amsb18 =0
     #RENJJ 160122


    FOREACH t230_amsb_cs1 INTO g_tc_amsb_1[g_cnt].*   #單身 ARRAY 填充
       IF SQLCA.sqlcode THEN
          CALL cl_err('foreach:',SQLCA.sqlcode,1)
          EXIT FOREACH
       END IF
#       SELECT ima02,ima021 INTO g_tc_amsb_1[g_cnt].ima02_11,g_tc_amsb_1[g_cnt].ima021_11
#              FROM ima_file WHERE ima01=g_tc_amsb_1[g_cnt].tc_amsb07_1
        ### add
          IF g_tc_amsb_1[g_cnt].tc_amsb16_1 IS NULL THEN LET g_tc_amsb_1[g_cnt].tc_amsb16_1 = 0 END IF
          IF g_tc_amsb_1[g_cnt].tc_amsb18_1 IS NULL THEN LET g_tc_amsb_1[g_cnt].tc_amsb18_1 = 0 END IF
       ### add
         #RENJJ 160122
           LET l_tc_amsb16 = l_tc_amsb16  +  g_tc_amsb_1[g_cnt].tc_amsb16_1
           LET l_tc_amsb18 = l_tc_amsb18 +  g_tc_amsb_1[g_cnt].tc_amsb18_1
          #RENJJ 160122
       LET g_cnt = g_cnt + 1

#       IF g_cnt > g_max_rec THEN
#          CALL cl_err( '', 9035, 0 )
#          EXIT FOREACH
#       END IF
    END FOREACH

     CALL g_tc_amsb_1.deleteElement(g_cnt)

#      #RENJJ 160122
#      LET  g_tc_amsb_1[g_cnt].tc_amsb21_1  ="  合计:"
#      LET  g_tc_amsb_1[g_cnt].tc_amsb16_1  = l_tc_amsb16
#      LET  g_tc_amsb_1[g_cnt].tc_amsb18_1  = l_tc_amsb18
#      DISPLAY BY NAME  g_tc_amsb_1[g_cnt].*
#      #RENJJ 160122

    LET g_rec_b1 = g_cnt - 1
    LET g_cnt = 0


END FUNCTION

FUNCTION t230_b_fill3(p_wc)              #BODY FILL UP
DEFINE p_wc   LIKE type_file.chr1000       #No.FUN-680136 VARCHAR(200)
DEFINE l_tc_amtb16 LIKE tc_amtb_file.tc_amtb16
DEFINE l_tc_amtb18 LIKE tc_amtb_file.tc_amtb18

      LET p_wc=cl_replace_str(p_wc, "tc_amsb", "tc_amtb")
      CALL g_tc_amtb.clear()     #MOD-A10082
      LET g_sql = "SELECT tc_amtb05,tc_amtb06,tc_amtb07,azp02,tc_amtb08,tc_amtb17,tc_amtb09,tc_amtb10,tc_amtb11,tc_amtb12, ",
                  "  tc_amtb13,tc_amtb14  ",
#                  " FROM tc_amtb_file  ",
                 "  FROM tc_amtb_file LEFT OUTER JOIN azp_file ON azp01=tc_amtb07 ",
                 " WHERE tc_amtb01 = '",tm.tc_amsb01,"' ",
                 "   AND tc_amtb02 = '",tm.tc_amsb02,"' ",
                 "   AND tc_amtb03 = '",tm.tc_amsb03,"' ",
                 "   AND tc_amtb04 = '",tm.tc_amsb04,"' ",
                 "    AND ",p_wc CLIPPED ,
                 " ORDER BY 1,2 "

    PREPARE t230_amt_prepare2 FROM g_sql      #預備一下
    DECLARE tc_amtb_cs2 CURSOR FOR t230_amt_prepare2
    LET g_cnt = 1
    LET g_rec_b2=0

     #RENJJ 160122
    LET l_tc_amtb16 =0
    LET l_tc_amtb18 =0
     #RENJJ 160122

    FOREACH tc_amtb_cs2 INTO g_tc_amtb[g_cnt].*   #單身 ARRAY 填充
       IF SQLCA.sqlcode THEN
          CALL cl_err('foreach:',SQLCA.sqlcode,1)
          EXIT FOREACH
       END IF

       LET g_cnt = g_cnt + 1

#       IF g_cnt > g_max_rec THEN
#          CALL cl_err( '', 9035, 0 )
#          EXIT FOREACH
#       END IF
    END FOREACH

    CALL g_tc_amtb.deleteElement(g_cnt)

#      DISPLAY BY NAME g_tc_amtb[g_cnt].*

    LET g_rec_b2 = g_cnt - 1
    LET g_cnt = 0

#    DISPLAY g_rec_b2 TO FORMONLY.cn2

END FUNCTION


FUNCTION t230_bp(p_ud)
    DEFINE p_ud            LIKE type_file.chr1          #No.FUN-680136 VARCHAR(1)

    IF p_ud <> "G" OR g_action_choice = "detail" THEN
        RETURN
    END IF
#    LET g_action_flag = 'page1'
    LET g_action_choice = " "

    CALL cl_set_act_visible("accept,cancel", FALSE)

    DIALOG ATTRIBUTES(UNBUFFERED)
    DISPLAY ARRAY g_tc_amsb TO s_tc_amsb.* ATTRIBUTE(COUNT=g_rec_b)

        BEFORE DISPLAY
           CALL cl_navigator_setting( g_curs_index, g_row_count )
            LET g_flag = 'Y'

        BEFORE ROW
            LET l_ac = ARR_CURR()
            CALL cl_show_fld_cont()


   END DISPLAY

#   DISPLAY ARRAY g_tc_amsb_1 TO s_tc_amsb_1.* ATTRIBUTE(COUNT=g_rec_b1)
#
#         BEFORE ROW
#            LET l_ac1 = ARR_CURR()
#            CALL cl_show_fld_cont()
#         AFTER DISPLAY
#            CONTINUE DIALOG
#
#   END DISPLAY

     DISPLAY ARRAY g_tc_amtb TO s_tc_amtb.* ATTRIBUTE(COUNT=g_rec_b2)

         BEFORE ROW
            LET l_ac2 = ARR_CURR()
            CALL cl_show_fld_cont()
         AFTER DISPLAY
            CONTINUE DIALOG

   END DISPLAY

        ON ACTION query
           LET g_action_choice="query"
           EXIT DIALOG


        ON ACTION cost
           LET g_action_choice="cost"
           EXIT DIALOG

         ON ACTION cost2
           LET g_action_choice="cost2"
           EXIT DIALOG
#
#        ON ACTION cost4
#           LET g_action_choice="cost4"
#           EXIT DIALOG
#
#        ON ACTION cost3
#           LET g_action_choice="cost3"
#           EXIT DIALOG

        ON ACTION cost5
           LET g_action_choice="cost5"
           EXIT DIALOG

         ON ACTION first
            CALL t230_fetch('F')
            CALL cl_navigator_setting(g_curs_index, g_row_count)
            IF g_rec_b != 0 THEN
               CALL fgl_set_arr_curr(1)
            END IF
            EXIT DIALOG

         ON ACTION previous
            CALL t230_fetch('P')
            CALL cl_navigator_setting(g_curs_index, g_row_count)
           IF g_rec_b != 0 THEN
            CALL fgl_set_arr_curr(1)
           END IF
          ACCEPT DIALOG

         ON ACTION jump
            CALL t230_fetch('/')
            CALL cl_navigator_setting(g_curs_index, g_row_count)
           IF g_rec_b != 0 THEN
            CALL fgl_set_arr_curr(1)
           END IF
          ACCEPT DIALOG

         ON ACTION pdelete
            LET g_action_choice = 'pdelete'
            EXIT DIALOG

         ON ACTION next
            CALL t230_fetch('N')
            CALL cl_navigator_setting(g_curs_index, g_row_count)
           IF g_rec_b != 0 THEN
            CALL fgl_set_arr_curr(1)
           END IF
          ACCEPT DIALOG

         ON ACTION last
            CALL t230_fetch('L')
            CALL cl_navigator_setting(g_curs_index, g_row_count)
           IF g_rec_b != 0 THEN
            CALL fgl_set_arr_curr(1)
           END IF
          ACCEPT DIALOG

        ON ACTION page1
         LET g_action_flag = 'page1'
          CONTINUE DIALOG

        ON ACTION page2
         LET g_action_flag = 'page2'
          CONTINUE DIALOG

#         ON ACTION PAGE3
#         LET g_action_flag = 'page3'
#          CONTINUE DIALOG


        ON ACTION output
           LET g_action_choice="output"
           EXIT DIALOG

        ON ACTION help
           LET g_action_choice="help"
           EXIT DIALOG

        ON ACTION locale
           CALL cl_dynamic_locale()
          CALL cl_show_fld_cont()                   #No.FUN-550037 hmf

        ON ACTION exit
           LET g_action_choice="exit"
           EXIT DIALOG


        ON ACTION cancel
             LET INT_FLAG=FALSE          #MOD-570244 mars
           LET g_action_choice="exit"
           EXIT DIALOG

        ON IDLE g_idle_seconds
           CALL cl_on_idle()
           CONTINUE DIALOG

        ON ACTION about         #MOD-4C0121
           CALL cl_about()      #MOD-4C0121

        ON ACTION controlg      #MOD-4C0121
           CALL cl_cmdask()     #MOD-4C0121


        ON ACTION related_document            #No.MOD-470518
           LET g_action_choice="related_document"
           EXIT DIALOG

         ON ACTION exporttoexcel   #FUN-4B0025
           LET g_action_choice = 'exporttoexcel'
           EXIT DIALOG

         ON ACTION controls                           #No.FUN-6B0032
           CALL cl_set_head_visible("","AUTO")       #No.FUN-6B0032

      #No.FUN-7C0050 add
      &include "qry_string.4gl"
    END DIALOG
    CALL cl_set_act_visible("accept,cancel", TRUE)
END FUNCTION



FUNCTION t230_set_entry(p_cmd)
  DEFINE p_cmd   LIKE type_file.chr1          #No.FUN-680136 VARCHAR(1)

    IF p_cmd = 'a' AND ( NOT g_before_input_done ) THEN
      CALL cl_set_comp_entry("tc_amsb01,tc_amsb02 ",TRUE)
      CALL cl_set_comp_entry("tc_amsb06",FALSE)
    END IF

END FUNCTION

FUNCTION t230_set_no_entry(p_cmd)
  DEFINE p_cmd   LIKE type_file.chr1           #No.FUN-680136 VARCHAR(1)

    IF p_cmd = 'u' AND ( NOT g_before_input_done ) THEN
       CALL cl_set_comp_entry("tc_amsb01,tc_amsb02 ",FALSE)
    END IF

END FUNCTION

FUNCTION t230_out()

   DEFINE   l_cmd      LIKE type_file.chr1000   #NO.FUN-7C0043
    IF cl_null(g_wc) AND NOT cl_null(tm.tc_amsb01)  THEN
       LET g_wc=" tc_amsb01='",tm.tc_amsb01,"'"
    END IF
    IF cl_null(g_wc) THEN
       CALL cl_err('','9057',0)
       RETURN
    END IF
    LET l_cmd = 'p_query "ambt230" "',g_wc CLIPPED,'"'     ##### "',g_wc2 CLIPPED,'"'
    CALL cl_cmdrun(l_cmd)
    RETURN

END FUNCTION




FUNCTION t230_pdelete()
DEFINE l_forupd_sql  STRING
DEFINE l_forupd_sql2  STRING
DEFINE l_lock_sw    LIKE type_file.chr1            #鎖住否
DEFINE l_sql STRING
DEFINE l_str STRING
DEFINE l_sql2  STRING
DEFINE l_sql3  STRING
DEFINE l_wc    STRING
DEFINE l_wc2    STRING

    LET l_wc=cl_replace_str(g_wc, "tc_amsb", "tc_amtb")
    LET l_wc2=cl_replace_str(g_wc, "tc_amsb", "tc_amu")

    LET l_lock_sw = 'N'
    LET l_forupd_sql = "SELECT * FROM tc_amsb_file WHERE ",g_wc," FOR UPDATE "
    LET l_forupd_sql = cl_forupd_sql(l_forupd_sql)
    DECLARE t230_bcl2 CURSOR FROM l_forupd_sql      # LOCK CURSOR

    LET l_forupd_sql2 = "SELECT * FROM tc_amtb_file WHERE ",l_wc," FOR UPDATE "
    LET l_forupd_sql2 = cl_forupd_sql(l_forupd_sql2)
    DECLARE t230_bcl3 CURSOR FROM l_forupd_sql2      # LOCK CURSOR

    LET l_forupd_sql2 = "SELECT * FROM tc_amu_file WHERE ",l_wc2," FOR UPDATE "
    LET l_forupd_sql2 = cl_forupd_sql(l_forupd_sql2)
    DECLARE t230_bcl4 CURSOR FROM l_forupd_sql2      # LOCK CURSOR

    BEGIN WORK
    OPEN t230_bcl2
    OPEN t230_bcl3
    OPEN t230_bcl4
    IF STATUS THEN
       CALL cl_err("OPEN t230_bcl2:", STATUS, 1)
       LET l_lock_sw = "Y"
    ELSE
    	 LET l_str="删除条件：",g_wc
       IF cl_confirm(l_str) THEN
            LET l_sql="DELETE FROM tc_amsb_file WHERE ",g_wc
            PREPARE del_pre FROM l_sql
            EXECUTE del_pre

            IF SQLCA.sqlcode THEN
                CALL cl_err3("del","tc_amsb_file",g_wc,"",SQLCA.sqlcode,"","",1)
                CLOSE  t230_bcl2
                ROLLBACK WORK
            ELSE
            	  CLOSE  t230_bcl2
                COMMIT WORK
                CALL t230_show()
            END IF
            LET l_sql2="DELETE FROM tc_amtb_file WHERE ",l_wc
            PREPARE del_pre2 FROM l_sql2
            EXECUTE del_pre2

            LET l_sql2="DELETE FROM tc_amu_file WHERE ",l_wc2
            PREPARE del_pre3 FROM l_sql2
            EXECUTE del_pre3

       END IF
     END IF
     CLOSE  t230_bcl2
     CLOSE  t230_bcl3
     CLOSE  t230_bcl4
END FUNCTION
