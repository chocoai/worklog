# Prog. Version..: '5.30.06-13.04.22(00010)'     #
#
# Pattern name...: axct212.4gl
# Descriptions...: 生产/安调工时收集与分摊
# Date & Author..: 16/07/06 By Renjj

DATABASE ds

GLOBALS "../../../tiptop/config/top.global"

#模組變數(Module Variables)
DEFINE
    g_tc_cmi_o         RECORD LIKE tc_cmi_file.*,       #細部品名碼 (舊值)
    g_tc_cmia          RECORD LIKE tc_cmi_file.*,       #細部品名碼 (舊值)
    g_tc_cmia_t        RECORD LIKE tc_cmi_file.*,       #細部品名碼 (舊值)
    g_tc_cmi01         LIKE tc_cmi_file.tc_cmi01,
    g_tc_cmi01_t       LIKE tc_cmi_file.tc_cmi01,   #細部品名碼 (舊值)
    g_tc_cmi00         LIKE tc_cmi_file.tc_cmi00,          #No.FUN-9B0118
    g_tc_cmi00_t       LIKE tc_cmi_file.tc_cmi00,          #No.FUN-9B0118
    g_tc_cmi12         LIKE tc_cmi_file.tc_cmi12,          #No.FUN-9B0118
    g_tc_cmi12_t       LIKE tc_cmi_file.tc_cmi12,          #No.FUN-9B0118
    g_tc_cmi02         LIKE tc_cmi_file.tc_cmi02,
    g_tc_cmi03         LIKE tc_cmi_file.tc_cmi03,
    g_tc_cmi04         LIKE tc_cmi_file.tc_cmi04,
    g_tc_cmi09         LIKE tc_cmi_file.tc_cmi09,
    g_tc_cmi02_t       LIKE tc_cmi_file.tc_cmi02,
    g_tc_cmi03_t       LIKE tc_cmi_file.tc_cmi03,
    g_tc_cmi04_t       LIKE tc_cmi_file.tc_cmi04,
    g_tc_cmi08_tot     LIKE tc_cmi_file.tc_cmi08,
    g_tc_cmi           DYNAMIC ARRAY OF RECORD    #程式變數(Program Variables)
        tc_cmi05       LIKE tc_cmi_file.tc_cmi05,   #科目編號
        tc_cmi06       LIKE tc_cmi_file.tc_cmi06,   #部門
        tc_cmi07       LIKE tc_cmi_file.tc_cmi07,   #名稱/說明
        tc_cmi08       LIKE tc_cmi_file.tc_cmi08,   #當期異動金額
        tc_cmi10       LIKE tc_cmi_file.tc_cmi10,  #分摊金额  renjj160711
        #str-------- add by dengsy161011
        tc_cmi36       LIKE tc_cmi_file.tc_cmi36,
        aag02          LIKE aag_file.aag02,
        tc_cmi37       LIKE tc_cmi_file.tc_cmi37,
        gem02          LIKE gem_file.gem02,
        #end-------- add by dengsy161011
        #FUN-D80058--add--str--
        tc_cmi35       LIKE tc_cmi_file.tc_cmi35,
        tc_cmi13       LIKE tc_cmi_file.tc_cmi13,
        tc_cmi14       LIKE tc_cmi_file.tc_cmi14,
        tc_cmi15       LIKE tc_cmi_file.tc_cmi15,
        tc_cmi16       LIKE tc_cmi_file.tc_cmi16,
        tc_cmi17       LIKE tc_cmi_file.tc_cmi17,
        tc_cmi18       LIKE tc_cmi_file.tc_cmi18,
        tc_cmi19       LIKE tc_cmi_file.tc_cmi19,
        tc_cmi20       LIKE tc_cmi_file.tc_cmi20,
        tc_cmi21       LIKE tc_cmi_file.tc_cmi21,
        tc_cmi22       LIKE tc_cmi_file.tc_cmi22,
        tc_cmi23       LIKE tc_cmi_file.tc_cmi23,
        tc_cmi24       LIKE tc_cmi_file.tc_cmi24,
        tc_cmi25       LIKE tc_cmi_file.tc_cmi25,
        tc_cmi26       LIKE tc_cmi_file.tc_cmi26,
        tc_cmi27       LIKE tc_cmi_file.tc_cmi27,
        tc_cmi28       LIKE tc_cmi_file.tc_cmi28,
        tc_cmi29       LIKE tc_cmi_file.tc_cmi29,
        tc_cmi30       LIKE tc_cmi_file.tc_cmi30,
        tc_cmi31       LIKE tc_cmi_file.tc_cmi31,
        tc_cmi32       LIKE tc_cmi_file.tc_cmi32,
        tc_cmi33       LIKE tc_cmi_file.tc_cmi33,
        tc_cmi34       LIKE tc_cmi_file.tc_cmi34
        #FUN-D80058--add--end--
                    END RECORD,
    g_tc_cmi_t         RECORD                 #程式變數 (舊值)
        tc_cmi05       LIKE tc_cmi_file.tc_cmi05,   #科目編號
        tc_cmi06       LIKE tc_cmi_file.tc_cmi06,   #部門
        tc_cmi07       LIKE tc_cmi_file.tc_cmi07,   #名稱/說明
        tc_cmi08       LIKE tc_cmi_file.tc_cmi08,   #當期異動金額
        tc_cmi10       LIKE tc_cmi_file.tc_cmi10,  #分摊金额  renjj160711
        #str-------- add by dengsy161011
        tc_cmi36       LIKE tc_cmi_file.tc_cmi36,
        aag02          LIKE aag_file.aag02,
        tc_cmi37       LIKE tc_cmi_file.tc_cmi37,
        gem02          LIKE gem_file.gem02,
        #end-------- add by dengsy161011
        #FUN-D80058--add--str--
        tc_cmi35       LIKE tc_cmi_file.tc_cmi35,
        tc_cmi13       LIKE tc_cmi_file.tc_cmi13,
        tc_cmi14       LIKE tc_cmi_file.tc_cmi14,
        tc_cmi15       LIKE tc_cmi_file.tc_cmi15,
        tc_cmi16       LIKE tc_cmi_file.tc_cmi16,
        tc_cmi17       LIKE tc_cmi_file.tc_cmi17,
        tc_cmi18       LIKE tc_cmi_file.tc_cmi18,
        tc_cmi19       LIKE tc_cmi_file.tc_cmi19,
        tc_cmi20       LIKE tc_cmi_file.tc_cmi20,
        tc_cmi21       LIKE tc_cmi_file.tc_cmi21,
        tc_cmi22       LIKE tc_cmi_file.tc_cmi22,
        tc_cmi23       LIKE tc_cmi_file.tc_cmi23,
        tc_cmi24       LIKE tc_cmi_file.tc_cmi24,
        tc_cmi25       LIKE tc_cmi_file.tc_cmi25,
        tc_cmi26       LIKE tc_cmi_file.tc_cmi26,
        tc_cmi27       LIKE tc_cmi_file.tc_cmi27,
        tc_cmi28       LIKE tc_cmi_file.tc_cmi28,
        tc_cmi29       LIKE tc_cmi_file.tc_cmi29,
        tc_cmi30       LIKE tc_cmi_file.tc_cmi30,
        tc_cmi31       LIKE tc_cmi_file.tc_cmi31,
        tc_cmi32       LIKE tc_cmi_file.tc_cmi32,
        tc_cmi33       LIKE tc_cmi_file.tc_cmi33,
        tc_cmi34       LIKE tc_cmi_file.tc_cmi34
        #FUN-D80058--add--end--
                    END RECORD,
     g_wc,g_wc2,g_sql    string,  #No.FUN-580092 HCN
    g_rec_b         LIKE type_file.num5,           #No.FUN-680122 SMALLINT             #單身筆數
    l_ac            LIKE type_file.num5,           #No.FUN-680122 SMALLINT             #目前處理的ARRAY CNT
    g_y             LIKE type_file.num5,           #No.FUN-680122 SMALLINT
    g_m             LIKE type_file.num5,           #No.FUN-680122 SMALLINT
    l_ccz12         LIKE ccz_file.ccz12,
    l_aag02         LIKE aag_file.aag02,
    l_aag05         LIKE aag_file.aag05,
    l_aag06         LIKE aag_file.aag06,
    l_aag42         LIKE aag_file.aag42,
    l_aag23         LIKE aag_file.aag23,
    l_aag07         LIKE aag_file.aag07,
    l_aaz72         LIKE aaz_file.aaz72,
    l_aao01         LIKE aao_file.aao01,
    l_aao02         LIKE aao_file.aao02,
    l_aao05         LIKE aao_file.aao05,
    l_aao06         LIKE aao_file.aao06,
    #FUN-D80058--add--str--
    m_aag05         LIKE aag_file.aag05,
    m_aag06         LIKE aag_file.aag06,  #借餘或貸餘
    m_aag15         LIKE aag_file.aag15,
    m_aag16         LIKE aag_file.aag16,
    m_aag17         LIKE aag_file.aag17,
    m_aag18         LIKE aag_file.aag18,
    m_aag151        LIKE aag_file.aag151,
    m_aag161        LIKE aag_file.aag161,
    m_aag171        LIKE aag_file.aag171,
    m_aag181        LIKE aag_file.aag181,

    m_aag31         LIKE aag_file.aag31,
    m_aag32         LIKE aag_file.aag32,
    m_aag33         LIKE aag_file.aag33,
    m_aag34         LIKE aag_file.aag34,
    m_aag35         LIKE aag_file.aag35,
    m_aag36         LIKE aag_file.aag36,
    m_aag37         LIKE aag_file.aag37,
    m_aag311        LIKE aag_file.aag311,
    m_aag321        LIKE aag_file.aag321,
    m_aag331        LIKE aag_file.aag331,
    m_aag341        LIKE aag_file.aag341,
    m_aag351        LIKE aag_file.aag351,
    m_aag361        LIKE aag_file.aag361,
    m_aag371        LIKE aag_file.aag371,
    m_aag21         LIKE aag_file.aag21,
    m_aag23         LIKE aag_file.aag23,
    m_aag222        LIKE aag_file.aag222,
    m_aag20         LIKE aag_file.aag20,
    g_afb07         LIKE afb_file.afb07,
    #FUN-D80058--add--end--
    g_dash1_1       LIKE type_file.chr1000,        #No.FUN-680122CHAR(400)
    g_argv1         LIKE type_file.chr20           #No.FUN-680122 VARCHAR(10)

#主程式開始
DEFINE g_forupd_sql STRING   #SELECT ... FOR UPDATE SQL
DEFINE g_sql_tmp    STRING   #No.TQC-720019
DEFINE g_before_input_done LIKE type_file.num5           #No.FUN-680122 SMALLINT
DEFINE g_cnt           LIKE type_file.num10          #No.FUN-680122 INTEGER
DEFINE g_i             LIKE type_file.num5           #No.FUN-680122 SMALLINT  #count/index for any purpose
DEFINE g_msg           LIKE ze_file.ze03             #No.FUN-680122CHAR(72)
DEFINE g_row_count     LIKE type_file.num10          #No.FUN-680122 INTEGER
DEFINE g_curs_index    LIKE type_file.num10          #No.FUN-680122 INTEGER
DEFINE g_jump          LIKE type_file.num10          #No.FUN-680122 INTEGER
DEFINE mi_no_ask       LIKE type_file.num5           #No.FUN-680122 SMALLINT
DEFINE g_flag          LIKE type_file.chr1           #No.FUN-730057
DEFINE l_table         STRING
DEFINE l_table1        STRING                        #No.TQC-970203
DEFINE g_str           STRING
DEFINE g_cka00         LIKE cka_file.cka00           #No.FUN-C80092
DEFINE  g_nppglno       LIKE npp_file.nppglno
DEFINE  l_nppglno       LIKE npp_file.nppglno
DEFINE g_npptype           LIKE npp_file.npptype   #add by dengsy161011
DEFINE g_aag44             LIKE aag_file.aag44    #add by dengsy161011
DEFINE l_count5             LIKE type_file.num5   #add by dengsy161011

MAIN
DEFINE
    p_row,p_col   LIKE type_file.num5           #No.FUN-680122 SMALLINT

    OPTIONS                                #改變一些系統預設值
        INPUT NO WRAP
    DEFER INTERRUPT                        #擷取中斷鍵, 由程式處理

    IF (NOT cl_user()) THEN
       EXIT PROGRAM
    END IF

    WHENEVER ERROR CALL cl_err_msg_log

    IF (NOT cl_setup("CXC")) THEN
       EXIT PROGRAM
    END IF

      CALL  cl_used(g_prog,g_time,1)       #計算使用時間 (進入時間) #No.MOD-580088  HCN 20050818  #No.FUN-6A0146
         RETURNING g_time    #No.FUN-6A0146

    LET g_sql = "tlf01.tlf_file.tlf01,",
                "tlf905.tlf_file.tlf905,",
                "tlf906.tlf_file.tlf906,",
                "tlf21.tlf_file.tlf21,",
                "tlf19.tlf_file.tlf19"

   LET l_table = cl_prt_temptable('axct2121',g_sql) CLIPPED
   IF l_table = -1 THEN EXIT PROGRAM END IF
   LET g_sql = "INSERT INTO ",g_cr_db_str CLIPPED,l_table CLIPPED,
               " VALUES(?,?,?,?,?)"
   PREPARE insert_prep FROM g_sql
   IF STATUS THEN
      CALL cl_err('insert_prep:',status,1) EXIT PROGRAM
   END IF

    LET g_argv1 = ARG_VAL(1)
    LET g_tc_cmi01= NULL
    LET g_tc_cmi01_t= NULL
    LET p_row = 4 LET p_col = 15
    OPEN WINDOW t212_w AT p_row,p_col              #顯示畫面
      WITH FORM "cxc/42f/cxct212"
       ATTRIBUTE (STYLE = g_win_style CLIPPED) #No.FUN-580092 HCN

    CALL cl_ui_init()

    #FUN-D80058--add--str--
    IF g_aaz.aaz119 ='N' THEN
       CALL cl_set_comp_visible("tc_cmi14,tc_cmi16,tc_cmi18,tc_cmi20,tc_cmi22,tc_cmi24,tc_cmi26,tc_cmi28,tc_cmi30,tc_cmi32,tc_cmi34",FALSE)
    ELSE
       CALL cl_set_comp_visible("tc_cmi14,tc_cmi16,tc_cmi18,tc_cmi20,tc_cmi22,tc_cmi24,tc_cmi26,tc_cmi28,tc_cmi30,tc_cmi32,tc_cmi34",TRUE)
    END IF
    #FUN-D80058--add--end--

    IF NOT cl_null(g_argv1) THEN CALL t212_q() END IF
    CALL t212_menu()
    CLOSE WINDOW t212_w                 #結束畫面
      CALL  cl_used(g_prog,g_time,2)       #計算使用時間 (退出使間) #No.MOD-580088  HCN 20050818  #No.FUN-6A0146
         RETURNING g_time    #No.FUN-6A0146
END MAIN

FUNCTION t212_cs()
    DEFINE l_tc_cmi01 LIKE tc_cmi_file.tc_cmi01
    DEFINE l_tc_cmi02 LIKE tc_cmi_file.tc_cmi02
    DEFINE l_tc_cmi03 LIKE tc_cmi_file.tc_cmi03
    DEFINE l_tc_cmi04 LIKE tc_cmi_file.tc_cmi04
    IF cl_null(g_argv1) THEN
       CLEAR FORM                             #清除畫面
       CALL g_tc_cmi.clear()
       CALL cl_set_head_visible("","YES")       #No.FUN-6A0092

   INITIALIZE g_tc_cmi01 TO NULL    #No.FUN-750051
   INITIALIZE g_tc_cmi02 TO NULL    #No.FUN-750051
   INITIALIZE g_tc_cmi03 TO NULL    #No.FUN-750051
   INITIALIZE g_tc_cmi04 TO NULL    #No.FUN-750051
   INITIALIZE g_tc_cmi00 TO NULL    #No.FUN-9B0118

       CONSTRUCT g_wc ON tc_cmi04,tc_cmi00,tc_cmi01,tc_cmi02,tc_cmi03,tc_cmi05,tc_cmi06,tc_cmi07,tc_cmi08,  #No.FUN-9B0118
                         tc_cmi35,tc_cmi13,tc_cmi15,tc_cmi17,tc_cmi19,tc_cmi21,tc_cmi23,tc_cmi25,tc_cmi27,tc_cmi29,  #FUN-D80058 add
                         tc_cmi31,tc_cmi33                                                   #FUN-D80058 add
           FROM tc_cmi04,tc_cmi00,tc_cmi01,tc_cmi02,tc_cmi03,s_tc_cmi[1].tc_cmi05,s_tc_cmi[1].tc_cmi06,    #No.FUN-9B0118
                s_tc_cmi[1].tc_cmi07,s_tc_cmi[1].tc_cmi08,
                #FUN-D80058--add--str--
                s_tc_cmi[1].tc_cmi35,s_tc_cmi[1].tc_cmi13,
                s_tc_cmi[1].tc_cmi15,s_tc_cmi[1].tc_cmi17,
                s_tc_cmi[1].tc_cmi19,s_tc_cmi[1].tc_cmi21,
                s_tc_cmi[1].tc_cmi23,s_tc_cmi[1].tc_cmi25,
                s_tc_cmi[1].tc_cmi27,s_tc_cmi[1].tc_cmi29,
                s_tc_cmi[1].tc_cmi31,s_tc_cmi[1].tc_cmi33
                #FUN-D80058--add--end--
              BEFORE CONSTRUCT
                 #FUN-D80058--add--str--
                 CALL cl_set_comp_visible("tc_cmi13,tc_cmi14,tc_cmi15,tc_cmi16,tc_cmi17,tc_cmi18",TRUE)
                 CALL cl_set_comp_visible("tc_cmi19,tc_cmi20,tc_cmi21,tc_cmi22,tc_cmi23,tc_cmi24",TRUE)
                 CALL cl_set_comp_visible("tc_cmi25,tc_cmi26,tc_cmi27,tc_cmi28,tc_cmi29,tc_cmi30",TRUE)
                 CALL cl_set_comp_visible("tc_cmi31,tc_cmi32,tc_cmi33,tc_cmi34",TRUE)
                 #FUN-D80058--add--end--
                 CALL cl_qbe_init()
                 ON ACTION qbe_select
         	   CALL cl_qbe_select()
                 ON ACTION qbe_save
		   CALL cl_qbe_save()

          ON ACTION controlp
             CASE
                WHEN INFIELD(tc_cmi00)       #帐套
                     CALL cl_init_qry_var()
                     LET g_qryparam.form  = "q_aaa"
                     LET g_qryparam.state = "c"
                     CALL cl_create_qry() RETURNING g_qryparam.multiret
                 DISPLAY g_qryparam.multiret TO tc_cmi00
#No.MOD-D50170 --begin
                WHEN INFIELD(tc_cmi05) #科目
                     CALL cl_init_qry_var()
                     LET g_qryparam.form     ="q_aag"
                     LET g_qryparam.state = "c"
                     CALL cl_create_qry() RETURNING g_qryparam.multiret
                     DISPLAY g_qryparam.multiret TO tc_cmi05
                WHEN INFIELD(tc_cmi06) #部門
                     CALL cl_init_qry_var()
                     LET g_qryparam.form     = "q_gem"
                     LET g_qryparam.state = "c"
                     CALL cl_create_qry() RETURNING g_qryparam.multiret
                     DISPLAY g_qryparam.multiret TO tc_cmi06
                #str------ add by dengsy161011
                WHEN INFIELD(tc_cmi36) #科目
                     CALL cl_init_qry_var()
                     LET g_qryparam.form     ="q_aag"
                     LET g_qryparam.state = "c"
                     CALL cl_create_qry() RETURNING g_qryparam.multiret
                     DISPLAY g_qryparam.multiret TO tc_cmi36
                WHEN INFIELD(tc_cmi37) #部門
                     CALL cl_init_qry_var()
                     LET g_qryparam.form     = "q_gem"
                     LET g_qryparam.state = "c"
                     CALL cl_create_qry() RETURNING g_qryparam.multiret
                     DISPLAY g_qryparam.multiret TO tc_cmi37
                #end------ add by dengsy161011
#No.MOD-D50170 --end
                #FUN-D80058--add--str--
                WHEN INFIELD(tc_cmi35)    #查詢專案編號
                     CALL cl_init_qry_var()
                     LET g_qryparam.form ="q_pja"
                     LET g_qryparam.state = "c"
                     CALL cl_create_qry() RETURNING g_qryparam.multiret
                     DISPLAY g_qryparam.multiret TO tc_cmi35
                WHEN INFIELD(tc_cmi13)    #查詢異動碼-1
                     CALL cl_init_qry_var()
                     LET g_qryparam.form ="q_aee"
                     LET g_qryparam.state = "c"
                     LET g_qryparam.arg1 = g_tc_cmi[1].tc_cmi13
                     LET g_qryparam.arg2 = 1
                     CALL cl_create_qry() RETURNING g_qryparam.multiret
                     DISPLAY g_qryparam.multiret TO tc_cmi13
                WHEN INFIELD(tc_cmi15)    #查詢異動碼-2
                     CALL cl_init_qry_var()
                     LET g_qryparam.state = "c"
                     LET g_qryparam.form ="q_aee"
                     LET g_qryparam.arg1 = g_tc_cmi[1].tc_cmi15
                     LET g_qryparam.arg2 = 2
                     CALL cl_create_qry() RETURNING g_qryparam.multiret
                     DISPLAY g_qryparam.multiret TO tc_cmi15
                WHEN INFIELD(tc_cmi17)    #查詢異動碼-3
                     CALL cl_init_qry_var()
                     LET g_qryparam.state = "c"
                     LET g_qryparam.form ="q_aee"
                     LET g_qryparam.arg1 = g_tc_cmi[1].tc_cmi15
                     LET g_qryparam.arg2 = 3
                     CALL cl_create_qry() RETURNING g_qryparam.multiret
                     DISPLAY g_qryparam.multiret TO tc_cmi15
                WHEN INFIELD(tc_cmi19)    #查詢異動碼-4
                     CALL cl_init_qry_var()
                     LET g_qryparam.state = "c"
                     LET g_qryparam.form ="q_aee"
                     LET g_qryparam.arg1 = g_tc_cmi[1].tc_cmi19
                     LET g_qryparam.arg2 = 4
                     CALL cl_create_qry() RETURNING g_qryparam.multiret
                     DISPLAY g_qryparam.multiret TO tc_cmi19
                WHEN INFIELD(tc_cmi21)    #查詢異動碼-5
                     CALL cl_init_qry_var()
                     LET g_qryparam.state = "c"
                     LET g_qryparam.form ="q_aee"
                     LET g_qryparam.arg1 = g_tc_cmi[1].tc_cmi21
                     LET g_qryparam.arg2 = 5
                     CALL cl_create_qry() RETURNING g_qryparam.multiret
                     DISPLAY g_qryparam.multiret TO tc_cmi21
                WHEN INFIELD(tc_cmi23)    #查詢異動碼-6
                     CALL cl_init_qry_var()
                     LET g_qryparam.state = "c"
                     LET g_qryparam.form ="q_aee"
                     LET g_qryparam.arg1 = g_tc_cmi[1].tc_cmi23
                     LET g_qryparam.arg2 = 6
                     CALL cl_create_qry() RETURNING g_qryparam.multiret
                     DISPLAY g_qryparam.multiret TO tc_cmi23
                WHEN INFIELD(tc_cmi25)    #查詢異動碼-7
                     CALL cl_init_qry_var()
                     LET g_qryparam.state = "c"
                     LET g_qryparam.form ="q_aee"
                     LET g_qryparam.arg1 = g_tc_cmi[1].tc_cmi25
                     LET g_qryparam.arg2 = 7
                     CALL cl_create_qry() RETURNING g_qryparam.multiret
                     DISPLAY g_qryparam.multiret TO tc_cmi25
                WHEN INFIELD(tc_cmi27)    #查詢異動碼-8
                     CALL cl_init_qry_var()
                     LET g_qryparam.state = "c"
                     LET g_qryparam.form ="q_aee"
                     LET g_qryparam.arg1 = g_tc_cmi[1].tc_cmi27
                     LET g_qryparam.arg2 = 8
                     CALL cl_create_qry() RETURNING g_qryparam.multiret
                     DISPLAY g_qryparam.multiret TO tc_cmi27
                WHEN INFIELD(tc_cmi29)    #查詢異動碼-9-WBS
                     CALL cl_init_qry_var()
                     LET g_qryparam.state = "c"
                     LET g_qryparam.form ="q_pjb4"
                     CALL cl_create_qry() RETURNING g_qryparam.multiret
                     DISPLAY g_qryparam.multiret TO tc_cmi29
                WHEN INFIELD(tc_cmi31)    #查詢異動碼-10-預算項目
                     CALL cl_init_qry_var()
                     LET g_qryparam.state = "c"
                     LET g_qryparam.form ="q_azf01a"
                     LET g_qryparam.arg1 = '7'
                     CALL cl_create_qry() RETURNING g_qryparam.multiret
                     DISPLAY g_qryparam.multiret TO tc_cmi31
                WHEN INFIELD(tc_cmi33)    #查詢關係人異動碼
                     CALL cl_init_qry_var()
                     LET g_qryparam.state = "c"
                     LET g_qryparam.form ="q_aee"
                     LET g_qryparam.arg1 = g_tc_cmi[1].tc_cmi33
                     LET g_qryparam.arg2 = 99
                     CALL cl_create_qry() RETURNING g_qryparam.multiret
                     DISPLAY g_qryparam.multiret TO tc_cmi33
                #FUN-D80058--add--end--
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

       END CONSTRUCT
       LET g_wc = g_wc CLIPPED,cl_get_extra_cond('tc_cmiuser', 'tc_cmigrup') #FUN-980030


       IF INT_FLAG THEN RETURN END IF
    ELSE
       LET g_wc=" tc_cmi01='",g_argv1,"'"
    END IF
    LET g_sql= "SELECT UNIQUE tc_cmi01,tc_cmi02,tc_cmi04,tc_cmi00 FROM tc_cmi_file",  #No.FUN-9B0118
               " WHERE ", g_wc CLIPPED,
               " ORDER BY tc_cmi04,tc_cmi00,tc_cmi01,tc_cmi02"                     #No.FUN-9B0118
    PREPARE t212_prepare FROM g_sql      #預備一下
    DECLARE t212_b_cs                  #宣告成可捲動的
        SCROLL CURSOR WITH HOLD FOR t212_prepare
    LET g_sql_tmp= "SELECT UNIQUE tc_cmi01,tc_cmi02,tc_cmi04,tc_cmi00 FROM tc_cmi_file",  #No.TQC-720019  #No.FUN-9B0118
               " WHERE ", g_wc CLIPPED,
               " INTO TEMP x"
    DROP TABLE x
    PREPARE t212_precount_x FROM g_sql_tmp  #No.TQC-720019
    EXECUTE t212_precount_x

    LET g_sql="SELECT COUNT(*) FROM x "

    PREPARE t212_precount FROM g_sql
    DECLARE t212_cnt   CURSOR FOR t212_precount
END FUNCTION

FUNCTION t212_menu()
DEFINE l_npptype  LIKE npp_file.npptype
   WHILE TRUE
      CALL t212_bp("G")
      CASE g_action_choice
         WHEN "insert"
            IF cl_chk_act_auth() THEN
               CALL t212_a()
            END IF
         WHEN "query"
            IF cl_chk_act_auth() THEN
               CALL t212_q()
            END IF
         WHEN "delete"
            IF cl_chk_act_auth() THEN
              CALL t212_r()
            END IF
         WHEN "reproduce"
            IF cl_chk_act_auth() THEN
               CALL t212_copy()
            END IF
         WHEN "detail"
            IF cl_chk_act_auth() THEN
               CALL t212_b()
            ELSE
               LET g_action_choice = NULL
            END IF
         WHEN "output"
            IF cl_chk_act_auth() THEN
               CALL t212_out()
            END IF
         WHEN "help"
            CALL cl_show_help()
         WHEN "exit"
            EXIT WHILE
         WHEN "controlg"
            CALL cl_cmdask()
         WHEN "generate"
            IF cl_chk_act_auth() THEN
               CALL t212_t()
            END IF
         WHEN "retrieve"
            IF cl_chk_act_auth() THEN
               CALL t212_g()
            END IF

         WHEN "by_cost"                #费用
           IF cl_chk_act_auth() THEN
               CALL t212_aeh()
           END IF

         WHEN "time"                    #工时
           IF cl_chk_act_auth() THEN
              CALL t212_time()
           END IF

#         WHEN "apportion"               #分摊
#            IF cl_chk_act_auth() THEN
#              CALL t212_p()
#           END IF

         WHEN "gen_entry"     #产生分录
            CALL t212_v()

         WHEN "entry_sheet"    #查看分录
            SELECT ccz12 INTO l_ccz12 FROM ccz_file
            IF g_tc_cmi00 = l_ccz12 THEN
               LET l_npptype =0
            ELSE
               LET l_npptype =1
            END IF
            CALL s_fsgl('CA',8,g_tc_cmi09,0,g_tc_cmi00,'1','N',l_npptype,g_tc_cmi09)


         WHEN "carry_voucher"      #抛砖凭证
            IF  NOT cl_null(g_tc_cmi09) THEN
               LET g_msg ="axcp301 ",g_tc_cmi09," '' '' '' ",
                          "'' '' '' 'N' '' ''"
               CALL cl_wait()
               CALL cl_cmdrun_wait(g_msg)
               SELECT nppglno INTO g_nppglno FROM npp_file WHERE npp01 = g_tc_cmi09 AND nppsys ='CA' AND npp00 =8 AND npp011 =1
                #UPDATE tc_cmi_file SET tc_cmi09=g_nppglno  WHERE tc_cmi09=g_tc_cmi09

               DISPLAY g_nppglno TO nppglno
               MESSAGE "OVER !"
            END IF

         WHEN "undo_carry_voucher"  #凭证还原
            IF cl_null(g_nppglno) THEN EXIT CASE END IF
            LET g_msg ="axcp302 '",g_plant,"' '",g_tc_cmi00,"' '",g_nppglno CLIPPED,"' 'Y'"
            CALL cl_wait()
            CALL cl_cmdrun_wait(g_msg)
            SELECT nppglno INTO g_nppglno FROM npp_file WHERE npp01 = g_tc_cmi09 AND nppsys ='CA' AND npp00 =8 AND npp011 =1

            DISPLAY g_nppglno TO nppglno
            MESSAGE "OVER !"

         #str------ add by dengsy161011
         WHEN "voucher_qry"
             IF cl_null(g_nppglno) THEN EXIT CASE END IF
            CALL s_voucher_qry(g_nppglno)
         #end------ add by dengsy161011
         WHEN "exporttoexcel" #FUN-4B0015
            CALL cl_export_to_excel(ui.Interface.getRootNode(),base.TypeInfo.create(g_tc_cmi),'','')
         WHEN "related_document"           #相關文件
          IF cl_chk_act_auth() THEN
             IF g_tc_cmi01 IS NOT NULL THEN
                LET g_doc.column1 = "tc_cmi01"
                LET g_doc.column2 = "tc_cmi02"
                LET g_doc.column3 = "tc_cmi03"
                LET g_doc.column4 = "tc_cmi04"
                LET g_doc.column5 = "tc_cmi00"    #No.FUN-9B0118
                LET g_doc.value1 = g_tc_cmi01
                LET g_doc.value2 = g_tc_cmi02
                LET g_doc.value3 = g_tc_cmi03
                LET g_doc.value4 = g_tc_cmi04
                LET g_doc.value5 = g_tc_cmi00     #No.FUN-9B0118
                CALL cl_doc()
             END IF
          END IF
      END CASE
   END WHILE
END FUNCTION

#Add  輸入
FUNCTION t212_a()
    IF s_shut(0) THEN RETURN END IF
    MESSAGE ""
    CLEAR FORM
    CALL g_tc_cmi.clear()
    INITIALIZE g_tc_cmi01 LIKE tc_cmi_file.tc_cmi01
    INITIALIZE g_tc_cmi02 LIKE tc_cmi_file.tc_cmi02
    INITIALIZE g_tc_cmi03 LIKE tc_cmi_file.tc_cmi03
    INITIALIZE g_tc_cmi04 LIKE tc_cmi_file.tc_cmi04
    INITIALIZE g_tc_cmi00 LIKE tc_cmi_file.tc_cmi00          #No.FUN-9B0118
    INITIALIZE g_tc_cmi12 LIKE tc_cmi_file.tc_cmi12          #No.FUN-9B0118
    INITIALIZE g_tc_cmia.* LIKE tc_cmi_file.*             #DEFAULT 設定
    LET g_tc_cmi01_t = NULL
    LET g_tc_cmi02_t = NULL
    LET g_tc_cmi03_t = NULL
    LET g_tc_cmi04_t = NULL
    LET g_tc_cmi00_t = NULL
    LET g_tc_cmi12_t = NULL
    #預設值及將數值類變數清成零
    LET g_tc_cmi_o.* = g_tc_cmia.*
    CALL cl_opmsg('a')
    CALL s_log_ins(g_prog,'','','','') RETURNING g_cka00  #FUN-C80092 add
    WHILE TRUE
        CALL t212_i("a")                #輸入單頭
        IF INT_FLAG THEN                   #使用者不玩了
            INITIALIZE g_tc_cmia.* TO NULL
            LET INT_FLAG = 0
            CALL cl_err('',9001,0)
            CALL s_log_upd(g_cka00,'N')          #更新日誌  #FUN-C80092
            EXIT WHILE
        END IF
        IF g_tc_cmia.tc_cmi01 IS NULL OR g_tc_cmia.tc_cmi02 IS NULL OR g_tc_cmia.tc_cmi03 IS NULL OR           #No.FUN-9B0118
           g_tc_cmia.tc_cmi04 IS NULL OR g_tc_cmia.tc_cmi00 IS NULL OR g_tc_cmia.tc_cmi12 IS NULL THEN         # KEY 不可空白   #No.FUN-9B0118
            CONTINUE WHILE
        END IF
        LET g_rec_b=0
        LET g_tc_cmi01=g_tc_cmia.tc_cmi01
        LET g_tc_cmi02=g_tc_cmia.tc_cmi02
        LET g_tc_cmi03=g_tc_cmia.tc_cmi03
        LET g_tc_cmi04=g_tc_cmia.tc_cmi04
        LET g_tc_cmi00=g_tc_cmia.tc_cmi00
        LET g_tc_cmi12=g_tc_cmia.tc_cmi12
        CALL t212_b_fill(' 1=1')        #單身
        CALL t212_b()                   #輸入單身
        LET g_tc_cmi01_t=g_tc_cmi01
        LET g_tc_cmi02_t=g_tc_cmi02
        LET g_tc_cmi03_t=g_tc_cmi03
        LET g_tc_cmi04_t=g_tc_cmi04
        LET g_tc_cmi00_t=g_tc_cmi00
        LET g_tc_cmi12_t=g_tc_cmi12
        CALL s_log_upd(g_cka00,'Y')              #更新日誌  #FUN-C80092
        EXIT WHILE
    END WHILE
END FUNCTION

#處理INPUT
FUNCTION t212_i(p_cmd)
DEFINE
    l_flag          LIKE type_file.chr1,           #No.FUN-680122 VARCHAR(01)              #判斷必要欄位是否有輸入
    p_cmd           LIKE type_file.chr1            #No.FUN-680122 VARCHAR(01)            #a:輸入 u:更改
    CALL cl_set_head_visible("","YES")       #No.FUN-6A0092

    INPUT BY NAME g_tc_cmia.tc_cmi04,g_tc_cmia.tc_cmi00,                                      #No.FUN-9B0118
        g_tc_cmia.tc_cmi01,g_tc_cmia.tc_cmi02,g_tc_cmia.tc_cmi03,g_tc_cmia.tc_cmi12 WITHOUT DEFAULTS      #No.FUN-9B0118

        BEFORE INPUT
           LET g_before_input_done = FALSE
           CALL t212_set_entry(p_cmd)
           CALL t212_set_no_entry(p_cmd)
           LET g_before_input_done = TRUE
        AFTER FIELD tc_cmi01
        IF NOT cl_null(g_tc_cmia.tc_cmi01) THEN
           LET g_tc_cmi01=g_tc_cmia.tc_cmi01
           IF g_tc_cmia.tc_cmi01 < g_ccz.ccz01 THEN
              CALL cl_err(g_tc_cmia.tc_cmi01,'axc-095',0)
              NEXT FIELD tc_cmi01
           END IF
        END IF

        AFTER FIELD tc_cmi02                  #月份
        IF NOT cl_null(g_tc_cmia.tc_cmi02) THEN
           IF g_tc_cmia.tc_cmi01 = g_ccz.ccz01 AND g_tc_cmia.tc_cmi02 < g_ccz.ccz02 THEN
              CALL cl_err(g_tc_cmia.tc_cmi02,'axc-095',0)    #No:MOD-9C0025 modify
              NEXT FIELD tc_cmi02     #No:MOD-9C0025 modify
           END IF

           IF g_tc_cmia.tc_cmi02 <0 OR g_tc_cmia.tc_cmi02 > 12 THEN
              CALL cl_err(g_tc_cmia.tc_cmi02,'mfg6032',0)
              LET g_tc_cmia.tc_cmi02=g_tc_cmi_o.tc_cmi02
              DISPLAY BY NAME g_tc_cmia.tc_cmi02
              NEXT FIELD tc_cmi02
           END IF
           LET g_tc_cmi_o.tc_cmi02=g_tc_cmia.tc_cmi02
           LET g_tc_cmi02=g_tc_cmia.tc_cmi02
        END IF

        AFTER FIELD tc_cmi03
            IF cl_null(g_tc_cmia.tc_cmi03) THEN LET g_tc_cmia.tc_cmi03 = ' ' END IF
            IF NOT cl_null(g_tc_cmia.tc_cmi03) THEN
               IF g_aaz.aaz90='Y' THEN
                  IF NOT s_costcenter_chk(g_tc_cmia.tc_cmi03) THEN
                     NEXT FIELD tc_cmi03
                  END IF
               ELSE
                  CALL t212_tc_cmi03(g_tc_cmia.tc_cmi03)
                  IF NOT cl_null(g_errno) THEN
                     CALL cl_err(g_tc_cmia.tc_cmi03,g_errno,0)
                     NEXT FIELD tc_cmi03
                  END IF
               END IF
            END IF
            LET g_tc_cmi03=g_tc_cmia.tc_cmi03
        AFTER FIELD tc_cmi04
            IF g_tc_cmia.tc_cmi04 IS NULL OR g_tc_cmia.tc_cmi04 NOT MATCHES "[123456]" THEN
               NEXT FIELD tc_cmi04
            ELSE
               LET g_tc_cmi04=g_tc_cmia.tc_cmi04
            END IF

        AFTER FIELD tc_cmi00    #帐套
            IF NOT cl_null(g_tc_cmia.tc_cmi00) THEN
               CALL t212_tc_cmi00(p_cmd,g_tc_cmia.tc_cmi00)
               IF NOT cl_null(g_errno) THEN
                  CALL cl_err(g_tc_cmia.tc_cmi00,g_errno,0)
                  LET g_tc_cmia.tc_cmi00=g_tc_cmia_t.tc_cmi00
                  DISPLAY BY NAME g_tc_cmia.tc_cmi00
                  NEXT FIELD tc_cmi00
               END IF
            END IF

        AFTER INPUT  #判斷必要欄位之值是否有值,若無則反白顯示,並要求重新輸入
            LET l_flag='N'
            IF INT_FLAG THEN
               EXIT INPUT
            END IF
           IF g_tc_cmia.tc_cmi02 IS NULL OR g_tc_cmia.tc_cmi02 <=0 OR g_tc_cmia.tc_cmi02 > 12 THEN
               LET l_flag='Y'
               DISPLAY BY NAME g_tc_cmia.tc_cmi02
            END IF
            IF l_flag='Y' THEN
                CALL cl_err('','9033',0)
                NEXT FIELD tc_cmi01
            END IF

        ON ACTION CONTROLF                  #欄位說明
         CALL cl_set_focus_form(ui.Interface.getRootNode()) RETURNING g_fld_name,g_frm_name #Add on 040913
         CALL cl_fldhelp(g_frm_name,g_fld_name,g_lang) #Add on 040913

        ON ACTION controlp
           CASE
              WHEN INFIELD(tc_cmi00)   #帐套
                   CALL cl_init_qry_var()
                   LET g_qryparam.form  = "q_aaa"
                   CALL cl_create_qry() RETURNING g_tc_cmia.tc_cmi00
                   DISPLAY BY NAME g_tc_cmia.tc_cmi00
                   NEXT FIELD tc_cmi00
              OTHERWISE EXIT CASE
           END CASE

        ON ACTION CONTROLR
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
FUNCTION t212_set_entry(p_cmd)
 DEFINE p_cmd   LIKE type_file.chr1           #No.FUN-680122 VARCHAR(1)

    IF p_cmd = 'a' AND ( NOT g_before_input_done ) THEN
        CALL cl_set_comp_entry("tc_cmi01,tc_cmi02,tc_cmi03,tc_cmi04,tc_cmi00",TRUE)  #No.FUN-9B0118
    END IF

END FUNCTION

FUNCTION t212_set_no_entry(p_cmd)
  DEFINE p_cmd   LIKE type_file.chr1           #No.FUN-680122 VARCHAR(1)

    IF p_cmd = 'u' AND g_chkey = 'N' AND ( NOT g_before_input_done ) THEN
       CALL cl_set_comp_entry("tc_cmi01,tc_cmi02,tc_cmi03,tc_cmi04,tc_cmi00",FALSE)  #No.FUN-9B0118
    END IF

END FUNCTION
FUNCTION t212_set_entry_b()
 DEFINE p_cmd   LIKE type_file.chr1           #No.FUN-680122 VARCHAR(1)

    IF INFIELD(tc_cmi05) THEN
       CALL cl_set_comp_entry("tc_cmi06,tc_cmi07",TRUE)
    END IF

END FUNCTION
FUNCTION t212_set_no_entry_b()
  DEFINE p_cmd   LIKE type_file.chr1          #No.FUN-680122 VARCHAR(1)

    IF INFIELD(tc_cmi05) THEN
       IF (g_tc_cmi[l_ac].tc_cmi05<>'MISC') THEN
          CALL cl_set_comp_entry("tc_cmi07",FALSE)
       END IF
       IF (g_tc_cmi[l_ac].tc_cmi05='MISC') OR (g_tc_cmi[l_ac].tc_cmi05='EXP') THEN
          LET g_tc_cmi[l_ac].tc_cmi06 = ' '    #No.FUN-990068
          CALL cl_set_comp_entry("tc_cmi06",FALSE)
       END IF
       IF l_aag05 = 'N' THEN
          LET g_tc_cmi[l_ac].tc_cmi06 = ' '    #No.FUN-990068
          CALL cl_set_comp_entry("tc_cmi06",FALSE)
       END IF
    END IF


END FUNCTION

FUNCTION t212_q()

    LET g_row_count = 0
    LET g_curs_index = 0
    CALL cl_navigator_setting( g_curs_index, g_row_count )
    INITIALIZE g_tc_cmi01 TO NULL        #No.FUN-6A0019
    CALL cl_opmsg('q')
    MESSAGE ""
    CALL t212_cs()                    #取得查詢條件
    IF INT_FLAG THEN                  #使用者不玩了
        LET INT_FLAG = 0
        RETURN
    END IF
    OPEN t212_b_cs                    #從DB產生合乎條件TEMP(0-30秒)
    IF SQLCA.sqlcode THEN                         #有問題
        CALL cl_err('',SQLCA.sqlcode,0)
        INITIALIZE g_tc_cmi01 TO NULL
    ELSE
        OPEN t212_cnt
        FETCH t212_cnt INTO g_row_count
        DISPLAY g_row_count TO FORMONLY.cnt
        CALL t212_fetch('F')            #讀出TEMP第一筆並顯示
    END IF
END FUNCTION

#處理資料的讀取
FUNCTION t212_fetch(p_flag)
DEFINE
    p_flag          LIKE type_file.chr1                  #處理方式        #No.FUN-680122 VARCHAR(1)

    CASE p_flag
        WHEN 'N' FETCH NEXT     t212_b_cs INTO g_tc_cmi01,g_tc_cmi02,g_tc_cmi04,g_tc_cmi00   #No.FUN-9B0118
        WHEN 'P' FETCH PREVIOUS t212_b_cs INTO g_tc_cmi01,g_tc_cmi02,g_tc_cmi04,g_tc_cmi00   #No.FUN-9B0118
        WHEN 'F' FETCH FIRST    t212_b_cs INTO g_tc_cmi01,g_tc_cmi02,g_tc_cmi04,g_tc_cmi00   #No.FUN-9B0118
        WHEN 'L' FETCH LAST     t212_b_cs INTO g_tc_cmi01,g_tc_cmi02,g_tc_cmi04,g_tc_cmi00   #No.FUN-9B0118
        WHEN '/'
            IF (NOT mi_no_ask) THEN
                CALL cl_getmsg('fetch',g_lang) RETURNING g_msg
                LET INT_FLAG = 0  ######add for prompt bug
                PROMPT g_msg CLIPPED,': ' FOR g_jump
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
            FETCH ABSOLUTE g_jump t212_b_cs INTO g_tc_cmi01,g_tc_cmi02,g_tc_cmi03,g_tc_cmi04,g_tc_cmi00    #No.FUN-9B0118
            LET mi_no_ask = FALSE
    END CASE

    IF SQLCA.sqlcode THEN
        CALL cl_err(g_tc_cmi01,SQLCA.sqlcode,0)
        INITIALIZE g_tc_cmi01 TO NULL  #TQC-6B0105
        INITIALIZE g_tc_cmi02 TO NULL  #TQC-6B0105
        INITIALIZE g_tc_cmi04 TO NULL  #TQC-6B0105
        INITIALIZE g_tc_cmi00 TO NULL  #No.FUN-9B0118
    ELSE
    SELECT UNIQUE tc_cmi03,tc_cmi09 INTO g_tc_cmi03,g_tc_cmi09  FROM tc_cmi_file
     WHERE tc_cmi00 = g_tc_cmi00
       AND tc_cmi01 = g_tc_cmi01
       AND tc_cmi02 = g_tc_cmi02
       AND tc_cmi04 = g_tc_cmi04

    CALL t212_show()
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

#將資料顯示在畫面上
FUNCTION t212_show()
    DISPLAY g_tc_cmi01,g_tc_cmi02,g_tc_cmi03,g_tc_cmi04,g_tc_cmi00,g_tc_cmi09     #No.FUN-9B0118
         TO tc_cmi01,tc_cmi02,tc_cmi03,tc_cmi04,tc_cmi00,tc_cmi09                 #No.FUN-9B0118

    IF g_tc_cmi09 IS NOT NULL THEN
        SELECT nppglno INTO g_nppglno FROM npp_file WHERE npp01 = g_tc_cmi09 AND nppsys ='CA' AND npp00 =8 AND npp011 =1
    END IF

    DISPLAY g_nppglno  TO nppglno
    CALL t212_b_fill(g_wc)                 #單身
    CALL cl_show_fld_cont()                   #No.FUN-550037 hmf
END FUNCTION

#單身
FUNCTION t212_b()
DEFINE
    l_ac_t          LIKE type_file.num5,           #未取消的ARRAY CNT        #No.FUN-680122 SMALLINT
    l_n             LIKE type_file.num5,           #檢查重複用        #No.FUN-680122 SMALLINT
    l_lock_sw       LIKE type_file.chr1,           #單身鎖住否        #No.FUN-680122 VARCHAR(1)
    p_cmd           LIKE type_file.chr1,           #處理狀態        #No.FUN-680122 VARCHAR(1)
    l_length        LIKE type_file.num5,           #No.FUN-680122SMALLINT              #長度
    l_allow_insert  LIKE type_file.num5,           #可新增否        #No.FUN-680122 SMALLINT
    l_allow_delete  LIKE type_file.num5,           #可刪除否        #No.FUN-680122 SMALLINT
    l_flag2         LIKE type_file.chr1,           #CHI-CA0076 add
    l_pmc903        LIKE pmc_file.pmc903,          #FUN-D80058 add
    i               LIKE type_file.num5,           #FUN-D80058 add
    l_flag          LIKE type_file.num5,           #FUN-D80058 add
    l_flag_t        LIKE type_file.num5            #FUN-D80058 add

    LET g_tc_cmia.tc_cmi01=g_tc_cmi01
    LET g_tc_cmia.tc_cmi02=g_tc_cmi02
    LET g_tc_cmia.tc_cmi03=g_tc_cmi03
    LET g_tc_cmia.tc_cmi04=g_tc_cmi04
    LET g_tc_cmia.tc_cmi00=g_tc_cmi00    #No.FUN-9B0118
    LET g_tc_cmia.tc_cmi12=g_tc_cmi12    #No.FUN-9B0118
    IF g_tc_cmia.tc_cmi01 IS NULL OR g_tc_cmia.tc_cmi01 = 0 THEN
        RETURN
    END IF
    IF g_tc_cmia.tc_cmi01 IS NULL OR g_tc_cmia.tc_cmi02 IS NULL OR g_tc_cmia.tc_cmi03 IS NULL OR
       g_tc_cmia.tc_cmi04 IS NULL OR g_tc_cmia.tc_cmi00 IS NULL THEN
       RETURN
    END IF
    CALL cl_opmsg('b')

    LET g_action_choice = ""
    IF NOT t212_chk(g_tc_cmi00,g_tc_cmi01,g_tc_cmi02) THEN RETURN END IF #MOD-DB0167 add
    #FUN-D80058--add--str--
    CALL cl_set_comp_visible("tc_cmi13,tc_cmi14,tc_cmi15,tc_cmi16,tc_cmi17,tc_cmi18",TRUE)
    CALL cl_set_comp_visible("tc_cmi19,tc_cmi20,tc_cmi21,tc_cmi22,tc_cmi23,tc_cmi24",TRUE)
    CALL cl_set_comp_visible("tc_cmi25,tc_cmi26,tc_cmi27,tc_cmi28,tc_cmi29,tc_cmi30",TRUE)
    CALL cl_set_comp_visible("tc_cmi31,tc_cmi32,tc_cmi33,tc_cmi34",TRUE)
    #FUN-D80058--add--end--

    LET g_forupd_sql = " SELECT tc_cmi05,tc_cmi06,tc_cmi07,tc_cmi08,tc_cmi10 ",
                       "   ,tc_cmi36,aag02,tc_cmi37,gem02,tc_cmi35 ",   #add by dengsy161011
                       " FROM tc_cmi_file ",
                       " left join aag_file on aag01=tc_cmi36 ",  #add by dengsy161011
                       " left join gem_file on gem01=tc_cmi37 ",   #add by dengsy161011
                       "  WHERE tc_cmi01=? ",
                       "   AND tc_cmi02=? ",
                       "   AND tc_cmi03=? ",
                       "   AND tc_cmi04=? ",
                       "   AND tc_cmi00=? ",  #No.FUN-9B0118
                       "   AND tc_cmi05=? ",
                       "   AND tc_cmi06=? ",
                       "   AND tc_cmi35=? ",  #add renjj170106
                       " FOR UPDATE "
    LET g_forupd_sql = cl_forupd_sql(g_forupd_sql)
    DECLARE t212_bcl CURSOR FROM g_forupd_sql      # LOCK CURSOR

    LET l_ac_t = 0
        LET l_allow_insert = cl_detail_input_auth("insert")
        LET l_allow_delete = cl_detail_input_auth("delete")

        INPUT ARRAY g_tc_cmi WITHOUT DEFAULTS FROM s_tc_cmi.*
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

            IF g_rec_b>=l_ac THEN
                LET g_tc_cmi_t.* = g_tc_cmi[l_ac].*  #BACKUP
                LET p_cmd='u'
                BEGIN WORK
                OPEN t212_bcl USING g_tc_cmia.tc_cmi01,g_tc_cmia.tc_cmi02, g_tc_cmia.tc_cmi03,
                                    g_tc_cmia.tc_cmi04,g_tc_cmia.tc_cmi00,                  #No.FUN-9B0118
                                    g_tc_cmi_t.tc_cmi05,g_tc_cmi_t.tc_cmi06,g_tc_cmi_t.tc_cmi35  #addg_tc_cmi_t.tc_cmi35  renjj170106
                IF STATUS THEN
                   CALL cl_err("OPEN t212_bcl:", STATUS, 1)
                   CLOSE t212_bcl
                   ROLLBACK WORK
                   RETURN
                ELSE
                   FETCH t212_bcl INTO g_tc_cmi[l_ac].*
                   IF SQLCA.sqlcode THEN
                       CALL cl_err(g_tc_cmi_t.tc_cmi05,SQLCA.sqlcode,1)
                       LET l_lock_sw = "Y"
                   END IF
                   #FUN-D80058--add--str--
                   IF g_aaz.aaz119 ='Y' THEN
                       CALL t212_get_ahe02(g_tc_cmi[l_ac].tc_cmi05,g_tc_cmi[l_ac].tc_cmi13,'aag15','1') RETURNING g_tc_cmi[l_ac].tc_cmi14
                       CALL t212_get_ahe02(g_tc_cmi[l_ac].tc_cmi05,g_tc_cmi[l_ac].tc_cmi15,'aag16','2') RETURNING g_tc_cmi[l_ac].tc_cmi16
                       CALL t212_get_ahe02(g_tc_cmi[l_ac].tc_cmi05,g_tc_cmi[l_ac].tc_cmi17,'aag17','3') RETURNING g_tc_cmi[l_ac].tc_cmi18
                       CALL t212_get_ahe02(g_tc_cmi[l_ac].tc_cmi05,g_tc_cmi[l_ac].tc_cmi19,'aag18','4') RETURNING g_tc_cmi[l_ac].tc_cmi20
                       CALL t212_get_ahe02(g_tc_cmi[l_ac].tc_cmi05,g_tc_cmi[l_ac].tc_cmi21,'aag31','5') RETURNING g_tc_cmi[l_ac].tc_cmi22
                       CALL t212_get_ahe02(g_tc_cmi[l_ac].tc_cmi05,g_tc_cmi[l_ac].tc_cmi23,'aag32','6') RETURNING g_tc_cmi[l_ac].tc_cmi24
                       CALL t212_get_ahe02(g_tc_cmi[l_ac].tc_cmi05,g_tc_cmi[l_ac].tc_cmi25,'aag33','7') RETURNING g_tc_cmi[l_ac].tc_cmi26
                       CALL t212_get_ahe02(g_tc_cmi[l_ac].tc_cmi05,g_tc_cmi[l_ac].tc_cmi27,'aag34','8') RETURNING g_tc_cmi[l_ac].tc_cmi28
                       CALL t212_get_ahe02(g_tc_cmi[l_ac].tc_cmi05,g_tc_cmi[l_ac].tc_cmi29,'aag35','9') RETURNING g_tc_cmi[l_ac].tc_cmi30
                       CALL t212_get_ahe02(g_tc_cmi[l_ac].tc_cmi05,g_tc_cmi[l_ac].tc_cmi31,'aag36','10') RETURNING g_tc_cmi[l_ac].tc_cmi32
                       CALL t212_get_ahe02(g_tc_cmi[l_ac].tc_cmi05,g_tc_cmi[l_ac].tc_cmi33,'aag37','99') RETURNING g_tc_cmi[l_ac].tc_cmi34
                    END IF
                    CALL t212_set_required(p_cmd)
                    CALL t212_set_no_required(p_cmd)
                    #FUN-D80058--add--end--
                END IF
                CALL cl_show_fld_cont()     #FUN-550037(smin)
             END IF

        AFTER INSERT
            IF INT_FLAG THEN
               CALL cl_err('',9001,0)
               LET INT_FLAG = 0
               CANCEL INSERT
            END IF
            INSERT INTO tc_cmi_file(tc_cmi01,tc_cmi02,tc_cmi03,tc_cmi04,tc_cmi05,tc_cmi06,tc_cmi07,
                                 tc_cmi08,tc_cmi09,tc_cmi10,tc_cmi13,tc_cmi14,tc_cmi15,tc_cmi16,      #FUN-D80058 add tc_cmi13,tc_cmi14,tc_cmi15,tc_cmi16,
                                 tc_cmi17,tc_cmi18,tc_cmi19,tc_cmi20,tc_cmi21,tc_cmi22,tc_cmi23,      #FUN-D80058 add
                                 tc_cmi24,tc_cmi25,tc_cmi26,tc_cmi27,tc_cmi28,tc_cmi29,tc_cmi30,      #FUN-D80058 add
                                 tc_cmi31,tc_cmi32,tc_cmi33,tc_cmi34,tc_cmi35,                  #FUN-D80058 add
                                 tc_cmiacti,tc_cmiuser,tc_cmigrup,
                                 tc_cmimodu,tc_cmidate,tc_cmi00,tc_cmi12,tc_cmioriu,tc_cmiorig,tc_cmilegal)  #No.MOD-470041   #No.FUN-9B0118  #FUN-A50075 add legal
            VALUES(g_tc_cmia.tc_cmi01,g_tc_cmia.tc_cmi02,g_tc_cmia.tc_cmi03,
                   g_tc_cmia.tc_cmi04,g_tc_cmi[l_ac].tc_cmi05,
                   g_tc_cmi[l_ac].tc_cmi06,g_tc_cmi[l_ac].tc_cmi07,
                   g_tc_cmi[l_ac].tc_cmi08,'','',
                   #FUN-D80058--add--str--
                   g_tc_cmi[l_ac].tc_cmi13,g_tc_cmi[l_ac].tc_cmi14,
                   g_tc_cmi[l_ac].tc_cmi15,g_tc_cmi[l_ac].tc_cmi16,
                   g_tc_cmi[l_ac].tc_cmi17,g_tc_cmi[l_ac].tc_cmi18,
                   g_tc_cmi[l_ac].tc_cmi19,g_tc_cmi[l_ac].tc_cmi20,
                   g_tc_cmi[l_ac].tc_cmi21,g_tc_cmi[l_ac].tc_cmi22,
                   g_tc_cmi[l_ac].tc_cmi23,g_tc_cmi[l_ac].tc_cmi24,
                   g_tc_cmi[l_ac].tc_cmi25,g_tc_cmi[l_ac].tc_cmi26,
                   g_tc_cmi[l_ac].tc_cmi27,g_tc_cmi[l_ac].tc_cmi28,
                   g_tc_cmi[l_ac].tc_cmi29,g_tc_cmi[l_ac].tc_cmi30,
                   g_tc_cmi[l_ac].tc_cmi31,g_tc_cmi[l_ac].tc_cmi32,
                   g_tc_cmi[l_ac].tc_cmi33,g_tc_cmi[l_ac].tc_cmi34,
                   g_tc_cmi[l_ac].tc_cmi35,
                   #FUN-D80058--add--end--
                   'Y',g_user,g_grup,'',
                   g_today,g_tc_cmia.tc_cmi00,g_tc_cmia.tc_cmi12, g_user, g_grup,g_legal)                           #No.FUN-9B0118      #No.FUN-980030 10/01/04  insert columns oriu, orig  #FUN-A50075 add legal
            IF SQLCA.sqlcode THEN
                CALL cl_err3("ins","tc_cmi_file",g_tc_cmia.tc_cmi01,g_tc_cmia.tc_cmi02,SQLCA.sqlcode,"","",1)  #No.FUN-660127
            ELSE
                MESSAGE 'INSERT O.K'
                COMMIT WORK
                LET g_rec_b=g_rec_b+1
                DISPLAY g_rec_b TO FORMONLY.cn2
            END IF
            SELECT SUM(tc_cmi10) INTO g_tc_cmi08_tot FROM tc_cmi_file
                WHERE tc_cmi01=g_tc_cmia.tc_cmi01 AND tc_cmi02=g_tc_cmia.tc_cmi02
                AND tc_cmi03=g_tc_cmia.tc_cmi03 AND tc_cmi04=g_tc_cmia.tc_cmi04
                AND tc_cmi00 = g_tc_cmia.tc_cmi00                          #No.FUN-9B0118
            DISPLAY g_tc_cmi08_tot TO FORMONLY.cmi08_tot

        BEFORE INSERT
            LET l_n = ARR_COUNT()
            LET p_cmd='a'
            INITIALIZE g_tc_cmi[l_ac].* TO NULL      #900423
            CALL cl_show_fld_cont()     #FUN-550037(smin)
            LET g_tc_cmi_t.* = g_tc_cmi[l_ac].*         #新輸入資料
            LET g_tc_cmi[l_ac].tc_cmi06 = g_tc_cmia.tc_cmi03  #No.FUN-990068
            CALL t212_set_required(p_cmd)        #FUN-D80058 add
            CALL t212_set_no_required(p_cmd)     #FUN-D80058 add

        BEFORE FIELD tc_cmi05
            CALL t212_set_entry_b()
            CALL t212_set_no_required(p_cmd)   #FUN-D80058 add

        AFTER FIELD tc_cmi05
            IF NOT cl_null(g_tc_cmi[l_ac].tc_cmi05) THEN
               CALL t212_tc_cmi05(g_tc_cmi[l_ac].tc_cmi05,g_tc_cmia.tc_cmi00)   #No.FUN-730057  #No.FUN-9B0118
               IF NOT cl_null(g_errno) AND g_tc_cmi[l_ac].tc_cmi05<>'MISC'
                  AND g_tc_cmi[l_ac].tc_cmi05 <> 'EXP' THEN
                  CALL cl_err('',g_errno,0)
#FUN-B10052 --bgegin--
#                 LET g_tc_cmi[l_ac].tc_cmi05=g_tc_cmi_t.tc_cmi05
                  CALL cl_init_qry_var()
                  LET g_qryparam.form     ="q_aag"
                  LET g_qryparam.default1 = g_tc_cmi[l_ac].tc_cmi05
                  LET g_qryparam.arg1     = ""     #carrier check bookno?
                  LET g_qryparam.arg2     = "2"
                  LET g_qryparam.arg3     = ""
                  LET g_qryparam.construct = 'N'
                  IF cl_null(g_qryparam.where) THEN
                     LET g_qryparam.where=" 1=1 "
                  END IF
                  LET g_qryparam.where = g_qryparam.where CLIPPED," AND aag01 LIKE '",g_tc_cmi[l_ac].tc_cmi05 CLIPPED,"%'"
                  IF g_qryparam.arg1 IS NOT NULL AND
                     g_qryparam.arg1 != '' THEN
                     LET g_qryparam.where = g_qryparam.where CLIPPED,
                     " AND aag03 IN ('",g_qryparam.arg1 CLIPPED,"') "
                  END IF
                  IF g_qryparam.arg2 IS NOT NULL AND
                     g_qryparam.arg2 != ' ' THEN
                     LET g_qryparam.where = g_qryparam.where CLIPPED ,
                     " AND aag07 IN ('",g_qryparam.arg2 CLIPPED,"') "
                  END IF
                  IF g_qryparam.arg3 IS NOT NULL AND
                     g_qryparam.arg3 != ' ' THEN
                     LET g_qryparam.where = g_qryparam.where CLIPPED,
                     " AND aag01 IN ('",g_qryparam.arg3,"') "
                  END IF
                  LET g_qryparam.where = g_qryparam.where CLIPPED #," ORDER BY 2 "
                  LET g_qryparam.arg1 =  g_tc_cmia.tc_cmi00
                  CALL cl_create_qry() RETURNING g_tc_cmi[l_ac].tc_cmi05
                  DISPLAY BY NAME g_tc_cmi[l_ac].tc_cmi05
#FUN-B10052 --end--
                  NEXT FIELD tc_cmi05
               END IF
               IF g_tc_cmi[l_ac].tc_cmi05 !='MISC' AND g_tc_cmi[l_ac].tc_cmi05 <> 'EXP'
               THEN
                  SELECT aag02,aag05,aag06,aag07
                  INTO g_tc_cmi[l_ac].tc_cmi07,l_aag05,l_aag06,l_aag07 FROM aag_file
                         WHERE aag01=g_tc_cmi[l_ac].tc_cmi05
                           AND aag00=g_tc_cmia.tc_cmi00        #NO.FUN-730057   #No.FUN-9B0118
                  IF l_aag07 !='2' AND  l_aag07 !='3' THEN
                     CALL cl_err(g_tc_cmi[l_ac].tc_cmi05,'agl-015',0)
                     NEXT FIELD tc_cmi05
                    LET g_tc_cmi[l_ac].tc_cmi05=g_tc_cmi_t.tc_cmi05
                  END IF
                  IF cl_null(g_tc_cmi[l_ac].tc_cmi06) THEN
                     LET g_tc_cmi[l_ac].tc_cmi06 = ' '
                  END IF
               ELSE
                  LET g_tc_cmi[l_ac].tc_cmi06=' ' #MISC 部門要給空白否則OPEN
                  LET g_tc_cmi[l_ac].tc_cmi06=' ' #MISC 部門要給空白否則FETCH 會有誤
               END IF
            END IF
            CALL t212_set_no_entry_b()

        BEFORE FIELD tc_cmi06
            IF g_tc_cmi[l_ac].tc_cmi05 !='MISC' AND g_tc_cmi[l_ac].tc_cmi05 <> 'EXP'  THEN
               SELECT aag02,aag05,aag06,aag07
               INTO g_tc_cmi[l_ac].tc_cmi07,l_aag05,l_aag06,l_aag07 FROM aag_file
                      WHERE aag01=g_tc_cmi[l_ac].tc_cmi05
                        AND aag00=g_tc_cmia.tc_cmi00        #NO.FUN-730057  #No.FUN-9B0118
               IF l_aag07 !='2' AND  l_aag07 !='3' THEN
                  CALL cl_err(g_tc_cmi[l_ac].tc_cmi05,'agl-015',0)
                  NEXT FIELD tc_cmi05
                  LET g_tc_cmi[l_ac].tc_cmi05=g_tc_cmi_t.tc_cmi05
               END IF
            ELSE
               IF g_tc_cmi[l_ac].tc_cmi05='MISC' THEN    # No.MOD-940353 modify
                  LET g_tc_cmi[l_ac].tc_cmi06=' ' #MISC 部門要給空白否則OPEN
                  LET g_tc_cmi[l_ac].tc_cmi06=' ' #MISC 部門要給空白否則FETCH 會有誤
               END IF       # No.MOD-940353 modify
            END IF
            DISPLAY g_tc_cmi[l_ac].tc_cmi07 TO tc_cmi07

        AFTER FIELD tc_cmi06                        #check 序號是否重複
            IF NOT cl_null(g_tc_cmi[l_ac].tc_cmi06) THEN
               CALL t212_tc_cmi03(g_tc_cmi[l_ac].tc_cmi06)
               IF NOT cl_null(g_errno) THEN
                  CALL cl_err(g_tc_cmi[l_ac].tc_cmi06,g_errno,0)
                  NEXT FIELD tc_cmi06
               END IF
               IF g_tc_cmi_t.tc_cmi05 IS NULL  THEN
                   SELECT count(*) INTO g_cnt
                       FROM tc_cmi_file
                       WHERE tc_cmi01 = g_tc_cmia.tc_cmi01 AND
                             tc_cmi02 = g_tc_cmia.tc_cmi02 AND
                             tc_cmi03 = g_tc_cmia.tc_cmi03 AND
                             tc_cmi04 = g_tc_cmia.tc_cmi04 AND
                             tc_cmi00 = g_tc_cmia.tc_cmi00 AND          #No.FUN-9B0118
                             tc_cmi05 = g_tc_cmi[l_ac].tc_cmi05 AND
                             tc_cmi06 = g_tc_cmi[l_ac].tc_cmi06
                              AND  tc_cmi35 = g_tc_cmi[l_ac].tc_cmi35  #add renjj170106
                   IF g_cnt > 0 THEN
                       CALL cl_err('',-239,0)
                       LET g_tc_cmi[l_ac].tc_cmi05 = g_tc_cmi_t.tc_cmi05
                       LET g_tc_cmi[l_ac].tc_cmi06 = g_tc_cmi_t.tc_cmi06
                       NEXT FIELD tc_cmi05
                   END IF
               END IF
               IF l_aag05='Y' THEN                             #要做部門管理時
                  SELECT aaz72 INTO l_aaz72 FROM aaz_file
                  IF l_aaz72='1' THEN                        #為拒絕部門
                     SELECT COUNT(*) INTO g_cnt FROM aab_file
                     WHERE aab01=g_tc_cmi[l_ac].tc_cmi05 AND aab02=g_tc_cmi[l_ac].tc_cmi06
                                               #   AND aab00=g_bookno1          #No.FUN-730057  #No.FUN-9B0118
                                                   AND aab00=g_tc_cmia.tc_cmi00       #No.FUN-730057  #No.FUN-9B0118
                     IF g_cnt > 0 THEN
                        CALL cl_err('','agl-207',0)
                        NEXT FIELD tc_cmi06
                     END IF
                  ELSE                                        #為允許部門
                     SELECT COUNT(*) INTO g_cnt FROM aab_file
                     WHERE aab01=g_tc_cmi[l_ac].tc_cmi05 AND aab02=g_tc_cmi[l_ac].tc_cmi06
                                               #   AND aab00=g_bookno1          #No.FUN-730057  #No.FUN-9B0118
                                                   AND aab00=g_tc_cmia.tc_cmi00       #No.FUN-730057  #No.FUN-9B0118
                     IF g_cnt = 0 THEN
                        CALL cl_err('','agl-209',0)
                        NEXT FIELD tc_cmi06
                     END IF
                  END IF
               END IF
            ELSE
               IF l_aag05='Y' THEN    #MOD-940353 add      #要做部門管理時
                  CALL cl_err('','aap-287',1)
                  NEXT FIELD tc_cmi06
               END IF                 #MOD-940353 add
            END IF

        BEFORE FIELD tc_cmi07
            IF g_tc_cmi_t.tc_cmi05 IS NULL THEN
               SELECT count(*) INTO g_cnt
                   FROM tc_cmi_file
                   WHERE tc_cmi01 = g_tc_cmia.tc_cmi01 AND
                         tc_cmi02 = g_tc_cmia.tc_cmi02 AND
                         tc_cmi03 = g_tc_cmia.tc_cmi03 AND
                         tc_cmi04 = g_tc_cmia.tc_cmi04 AND
                         tc_cmi00 = g_tc_cmia.tc_cmi00 AND         #No.FUN-9B0118
                         tc_cmi05 = g_tc_cmi[l_ac].tc_cmi05 AND
                         tc_cmi06 = g_tc_cmi[l_ac].tc_cmi06
                         AND  tc_cmi35 = g_tc_cmi[l_ac].tc_cmi35  #add renjj170106
               IF g_cnt > 0 THEN
                  CALL cl_err('',-239,0)
                  LET g_tc_cmi[l_ac].tc_cmi05 = g_tc_cmi_t.tc_cmi05
                  LET g_tc_cmi[l_ac].tc_cmi06 = g_tc_cmi_t.tc_cmi06
                  DISPLAY BY NAME g_tc_cmi[l_ac].tc_cmi05
                  DISPLAY BY NAME g_tc_cmi[l_ac].tc_cmi06
                  NEXT FIELD tc_cmi05
               END IF
            END IF


        AFTER FIELD tc_cmi08
          IF NOT cl_null(g_tc_cmi[l_ac].tc_cmi08) THEN
             IF g_tc_cmi[l_ac].tc_cmi05 != 'EXP' THEN         #MOD-B10066 add
                #str------ mark by dengsy161011
                #IF g_tc_cmi[l_ac].tc_cmi08 < 0 THEN
                #   CALL cl_err(g_tc_cmi[l_ac].tc_cmi08,'axc-207',0)
                #   NEXT FIELD tc_cmi08
                #END IF
                #end------ mark by dengsy161011
             END IF           #MOD-B10066 add
          END IF

        #str------- add by dengsy161011
        AFTER FIELD tc_cmi36
            IF NOT cl_null(g_tc_cmi[l_ac].tc_cmi36) THEN

             LET l_aag02=NULL
             LET l_aag05=NULL
             SELECT aag02,aag05 INTO l_aag02,l_aag05  #FUN-8C0089 add aag05,l_aag05 #TQC-790124
               FROM aag_file
              WHERE aag01=g_tc_cmi[l_ac].tc_cmi36
                AND aag00=g_tc_cmi00      #No.FUN-730073
                AND aag07 IN ('2','3')   #MOD-920035 add
                AND aag03 IN ('2')       #TQC-B10053 add
                AND aagacti = 'Y'        #MOD-CA0155 add
             IF STATUS THEN
                #CALL cl_err3("sel","aag_file",l_aeh01,"",STATUS,"","select aag",0)
                CALL cl_init_qry_var()
                LET g_qryparam.form = "q_aag"
                LET g_qryparam.construct = 'N'
                LET g_qryparam.default1 = g_tc_cmi[l_ac].tc_cmi36
                LET g_qryparam.arg1= g_tc_cmi00
                LET g_qryparam.where = " aag07 IN ('2','3') AND aag03 IN ('2') AND aagacti = 'Y' AND aag01 LIKE '",g_tc_cmi[l_ac].tc_cmi36 CLIPPED,"%'"
                CALL cl_create_qry() RETURNING g_tc_cmi[l_ac].tc_cmi36
                DISPLAY BY NAME g_tc_cmi[l_ac].tc_cmi36
                NEXT FIELD tc_cmi36
             END IF
               SELECT aag02 INTO g_tc_cmi[l_ac].aag02 FROM aag_file
               WHERE aag01=g_tc_cmi[l_ac].tc_cmi36
               DISPLAY BY NAME g_tc_cmi[l_ac].aag02
            END IF
        AFTER FIELD tc_cmi37
           IF NOT cl_null(g_tc_cmi[l_ac].tc_cmi37) THEN
               LET l_count5=0
               SELECT count(*) INTO l_count5 FROM gem_file
               WHERE gem01=g_tc_cmi[l_ac].tc_cmi37
               IF l_count5<1 THEN
                  CALL cl_err(g_tc_cmi[l_ac].tc_cmi37,'aap-039',0)
                  NEXT FIELD CURRENT
               END IF
               SELECT gem02 INTO g_tc_cmi[l_ac].gem02 FROM aag_file
               WHERE gem01=g_tc_cmi[l_ac].tc_cmi37
               DISPLAY BY NAME g_tc_cmi[l_ac].gem02
            END IF
        #end------- add by dengsy161011
        #FUN-D80058--add--str--
        AFTER FIELD tc_cmi35
            IF NOT cl_null(g_tc_cmi[l_ac].tc_cmi35) THEN
               CALL t212_tc_cmi35(p_cmd)
               IF NOT cl_null(g_errno) THEN
                 CALL cl_err('',g_errno,0)
                 LET g_tc_cmi[l_ac].tc_cmi35 = g_tc_cmi_t.tc_cmi35
                 DISPLAY BY NAME g_tc_cmi[l_ac].tc_cmi35
                 NEXT FIELD tc_cmi35
               END IF
            END IF
            CALL t212_bud(p_cmd,'0',g_tc_cmi[l_ac].*)
            IF NOT cl_null(g_errno) THEN
               NEXT FIELD tc_cmi35
            END IF

        BEFORE FIELD tc_cmi13  #異動碼一
           IF cl_null(m_aag151) THEN
              LET g_tc_cmi[l_ac].tc_cmi13 = ' '
              DISPLAY BY NAME g_tc_cmi[l_ac].tc_cmi13
           END IF
           CALL t212_error(m_aag15)
           IF g_aaz.aaz116 = 'Y' THEN
              IF (m_aag151='2' OR m_aag151='3') AND cl_null(g_tc_cmi[l_ac].tc_cmi13) THEN
                  CALL s_ahe_qry(g_tc_cmi[l_ac].tc_cmi05,'1','i',g_tc_cmi[l_ac].tc_cmi13,g_tc_cmi00)
                      RETURNING g_tc_cmi[l_ac].tc_cmi13
                  DISPLAY g_tc_cmi[l_ac].tc_cmi13 TO tc_cmi13
              END IF
           END IF

        AFTER FIELD tc_cmi13
           IF NOT cl_null(g_tc_cmi[l_ac].tc_cmi13) THEN
               CALL s_chk_aee(g_tc_cmi[l_ac].tc_cmi05,'1',g_tc_cmi[l_ac].tc_cmi13,g_tc_cmi00)
               IF NOT cl_null(g_errno) THEN
                  CALL cl_err('',g_errno,1)
                  NEXT FIELD tc_cmi13
               END IF
               IF g_aza.aza26 = '2' THEN
                  LET l_pmc903 = NULL
                  SELECT pmc903 INTO l_pmc903  FROM pmc_file WHERE pmc01 = g_tc_cmi[l_ac].tc_cmi13
                  IF STATUS THEN
                     SELECT occ37 INTO l_pmc903  FROM occ_file WHERE occ01 = g_tc_cmi[l_ac].tc_cmi13
                  END IF
                  IF l_pmc903='Y' THEN
                     LET g_tc_cmi[l_ac].tc_cmi33 = g_tc_cmi[l_ac].tc_cmi13
                     CALL t212_get_ahe02(g_tc_cmi[l_ac].tc_cmi05,g_tc_cmi[l_ac].tc_cmi33,'aag37','99') RETURNING g_tc_cmi[l_ac].tc_cmi34
                  END IF
                  IF l_pmc903='N' THEN
                     LET g_tc_cmi[l_ac].tc_cmi33 = ''
                  END IF
                  DISPLAY g_tc_cmi[l_ac].tc_cmi33 TO tc_cmi33
              END IF
           ELSE
              #異動碼-1控制方式
              IF m_aag151='2' OR m_aag151='3' THEN
                 CALL cl_err('','mfg0037',0)
                 NEXT FIELD tc_cmi13
              END IF
           END IF
           CALL t212_set_required(p_cmd)
           IF p_cmd ='a' OR g_tc_cmi[l_ac].tc_cmi13 <> g_tc_cmi_t.tc_cmi13 THEN
              CALL t212_get_ahe02(g_tc_cmi[l_ac].tc_cmi05,g_tc_cmi[l_ac].tc_cmi13,'aag15','1') RETURNING g_tc_cmi[l_ac].tc_cmi14
           END IF

        BEFORE FIELD tc_cmi15  #異動碼二
           IF cl_null(m_aag161) THEN
              LET g_tc_cmi[l_ac].tc_cmi15 = ' '
              DISPLAY BY NAME g_tc_cmi[l_ac].tc_cmi15
           END IF
           CALL t212_error(m_aag16)
           IF g_aaz.aaz116 = 'Y' THEN
              IF (m_aag161='2' OR m_aag161='3') AND cl_null(g_tc_cmi[l_ac].tc_cmi15) THEN
                 CALL s_ahe_qry(g_tc_cmi[l_ac].tc_cmi05,'2','i',g_tc_cmi[l_ac].tc_cmi15,g_tc_cmi00)
                      RETURNING g_tc_cmi[l_ac].tc_cmi15
                 DISPLAY g_tc_cmi[l_ac].tc_cmi15 TO tc_cmi15
              END IF
           END IF

        AFTER FIELD tc_cmi15
           IF NOT cl_null(g_tc_cmi[l_ac].tc_cmi15) THEN
               CALL s_chk_aee(g_tc_cmi[l_ac].tc_cmi05,'2',g_tc_cmi[l_ac].tc_cmi15,g_tc_cmi00)
                   IF NOT cl_null(g_errno) THEN
                      CALL cl_err('',g_errno,1)
                      NEXT FIELD tc_cmi15
                   END IF
           ELSE
              #異動碼-2控制方式
              IF m_aag161='2' OR m_aag161='3' THEN
                 CALL cl_err('','mfg0037',0)
                 NEXT FIELD tc_cmi15
              END IF
           END IF
           CALL t212_set_required(p_cmd)
           IF p_cmd ='a' OR g_tc_cmi[l_ac].tc_cmi15 <> g_tc_cmi_t.tc_cmi15 THEN
              CALL t212_get_ahe02(g_tc_cmi[l_ac].tc_cmi05,g_tc_cmi[l_ac].tc_cmi15,'aag16','2') RETURNING g_tc_cmi[l_ac].tc_cmi16
           END IF

        BEFORE FIELD tc_cmi17
           IF cl_null(m_aag171) THEN
              LET g_tc_cmi[l_ac].tc_cmi17 = ' '
              DISPLAY BY NAME g_tc_cmi[l_ac].tc_cmi17
           END IF
           CALL t212_error(m_aag17)
           IF g_aaz.aaz116 = 'Y' THEN
             IF (m_aag171='2' OR m_aag171='3') AND cl_null(g_tc_cmi[l_ac].tc_cmi17) THEN
                CALL s_ahe_qry(g_tc_cmi[l_ac].tc_cmi05,'3','i',g_tc_cmi[l_ac].tc_cmi17,g_tc_cmi00)
                     RETURNING g_tc_cmi[l_ac].tc_cmi17
                DISPLAY g_tc_cmi[l_ac].tc_cmi17 TO tc_cmi17
             END IF
           END IF

        AFTER FIELD tc_cmi17
           IF NOT cl_null(g_tc_cmi[l_ac].tc_cmi17) THEN
               CALL s_chk_aee(g_tc_cmi[l_ac].tc_cmi05,'3',g_tc_cmi[l_ac].tc_cmi17,g_tc_cmi00)
                   IF NOT cl_null(g_errno) THEN
                      CALL cl_err('',g_errno,1)
                      NEXT FIELD tc_cmi17
                   END IF
           ELSE
              #異動碼-3控制方式
              IF m_aag171='2' OR m_aag171='3' THEN
                 CALL cl_err('','mfg0037',0)
                 NEXT FIELD tc_cmi17
              END IF
           END IF
           CALL t212_set_required(p_cmd)
           IF p_cmd ='a' OR g_tc_cmi[l_ac].tc_cmi17 <> g_tc_cmi_t.tc_cmi17 THEN
              CALL t212_get_ahe02(g_tc_cmi[l_ac].tc_cmi05,g_tc_cmi[l_ac].tc_cmi17,'aag17','3') RETURNING g_tc_cmi[l_ac].tc_cmi18
           END IF

        BEFORE FIELD tc_cmi19
           IF cl_null(m_aag181) THEN
              LET g_tc_cmi[l_ac].tc_cmi19 = ' '
              DISPLAY BY NAME g_tc_cmi[l_ac].tc_cmi19
           END IF
           CALL t212_error(m_aag18)
           IF g_aaz.aaz116 = 'Y' THEN
             IF (m_aag181='2' OR m_aag181='3') AND cl_null(g_tc_cmi[l_ac].tc_cmi19) THEN
                CALL s_ahe_qry(g_tc_cmi[l_ac].tc_cmi05,'4','i',g_tc_cmi[l_ac].tc_cmi19,g_tc_cmi00)
                     RETURNING g_tc_cmi[l_ac].tc_cmi19
                DISPLAY g_tc_cmi[l_ac].tc_cmi19 TO tc_cmi19
             END IF
           END IF
        AFTER FIELD tc_cmi19
            IF NOT cl_null(g_tc_cmi[l_ac].tc_cmi19) THEN
               CALL s_chk_aee(g_tc_cmi[l_ac].tc_cmi05,'4',g_tc_cmi[l_ac].tc_cmi19,g_tc_cmi00)
                    IF NOT cl_null(g_errno) THEN
                       CALL cl_err('',g_errno,1)
                       NEXT FIELD tc_cmi19
                    END IF
            ELSE
               #異動碼-4控制方式
               IF m_aag181='2' OR m_aag181='3' THEN
                  CALL cl_err('','mfg0037',0)
                  NEXT FIELD tc_cmi19
               END IF
            END IF
            CALL t212_set_required(p_cmd)
           IF p_cmd ='a' OR g_tc_cmi[l_ac].tc_cmi19 <> g_tc_cmi_t.tc_cmi19 THEN
              CALL t212_get_ahe02(g_tc_cmi[l_ac].tc_cmi05,g_tc_cmi[l_ac].tc_cmi19,'aag18','4') RETURNING g_tc_cmi[l_ac].tc_cmi20
           END IF


        BEFORE FIELD tc_cmi21
           IF cl_null(m_aag311) THEN
              LET g_tc_cmi[l_ac].tc_cmi21 = ' '
           END IF
           CALL t212_error(m_aag31)
           IF g_aaz.aaz116 = 'Y' THEN
              IF (m_aag311='2' OR m_aag311='3') AND cl_null(g_tc_cmi[l_ac].tc_cmi21) THEN
                 CALL s_ahe_qry(g_tc_cmi[l_ac].tc_cmi05,'5','i',g_tc_cmi[l_ac].tc_cmi21,g_tc_cmi00)
                      RETURNING g_tc_cmi[l_ac].tc_cmi21
                 DISPLAY g_tc_cmi[l_ac].tc_cmi21 TO tc_cmi21
              END IF
           END IF

        AFTER FIELD tc_cmi21
            IF NOT cl_null(g_tc_cmi[l_ac].tc_cmi21) THEN
               CALL s_chk_aee(g_tc_cmi[l_ac].tc_cmi05,'5',g_tc_cmi[l_ac].tc_cmi21,g_tc_cmi00)
                    IF NOT cl_null(g_errno) THEN
                       CALL cl_err('',g_errno,1)
                       NEXT FIELD tc_cmi21
                    END IF
            ELSE
               #異動碼-5控制方式
               IF m_aag311='2' OR m_aag311='3' THEN
                  CALL cl_err('','mfg0037',0)
                  NEXT FIELD tc_cmi21
               END IF
            END IF
            CALL t212_set_required(p_cmd)
           IF p_cmd ='a' OR g_tc_cmi[l_ac].tc_cmi21 <> g_tc_cmi_t.tc_cmi21 THEN
              CALL t212_get_ahe02(g_tc_cmi[l_ac].tc_cmi05,g_tc_cmi[l_ac].tc_cmi21,'aag31','5') RETURNING g_tc_cmi[l_ac].tc_cmi22
           END IF


        BEFORE FIELD tc_cmi23
           IF cl_null(m_aag321) THEN
              LET g_tc_cmi[l_ac].tc_cmi23 = ' '
           END IF
           CALL t212_error(m_aag32)
           IF g_aaz.aaz116 = 'Y' THEN
              IF (m_aag321='2' OR m_aag321='3') AND cl_null(g_tc_cmi[l_ac].tc_cmi23) THEN
                 CALL s_ahe_qry(g_tc_cmi[l_ac].tc_cmi05,'6','i',g_tc_cmi[l_ac].tc_cmi23,g_tc_cmi00)
                      RETURNING g_tc_cmi[l_ac].tc_cmi23
                 DISPLAY g_tc_cmi[l_ac].tc_cmi23 TO tc_cmi23
              END IF
            END IF

        AFTER FIELD tc_cmi23
            IF NOT cl_null(g_tc_cmi[l_ac].tc_cmi23) THEN
               CALL s_chk_aee(g_tc_cmi[l_ac].tc_cmi05,'6',g_tc_cmi[l_ac].tc_cmi23,g_tc_cmi00)
                    IF NOT cl_null(g_errno) THEN
                       CALL cl_err('',g_errno,1)
                       NEXT FIELD tc_cmi23
                    END IF
            ELSE
               #異動碼-6控制方式
               IF m_aag321='2' OR m_aag321='3' THEN
                  CALL cl_err('','mfg0037',0)
                  NEXT FIELD tc_cmi23
               END IF
            END IF
            CALL t212_set_required(p_cmd)
           IF p_cmd ='a' OR g_tc_cmi[l_ac].tc_cmi23 <> g_tc_cmi_t.tc_cmi23 THEN
              CALL t212_get_ahe02(g_tc_cmi[l_ac].tc_cmi05,g_tc_cmi[l_ac].tc_cmi23,'aag32','6') RETURNING g_tc_cmi[l_ac].tc_cmi24
           END IF


        BEFORE FIELD tc_cmi25
           IF cl_null(m_aag331) THEN
              LET g_tc_cmi[l_ac].tc_cmi25 = ' '
           END IF
           CALL t212_error(m_aag33)
           IF g_aaz.aaz116 = 'Y' THEN
             IF (m_aag331='2' OR m_aag331='3') AND cl_null(g_tc_cmi[l_ac].tc_cmi25) THEN
                CALL s_ahe_qry(g_tc_cmi[l_ac].tc_cmi05,'7','i',g_tc_cmi[l_ac].tc_cmi25,g_tc_cmi00)
                     RETURNING g_tc_cmi[l_ac].tc_cmi25
                DISPLAY g_tc_cmi[l_ac].tc_cmi25 TO tc_cmi25
             END IF
           END IF

        AFTER FIELD tc_cmi25
            IF NOT cl_null(g_tc_cmi[l_ac].tc_cmi25) THEN
               CALL s_chk_aee(g_tc_cmi[l_ac].tc_cmi05,'7',g_tc_cmi[l_ac].tc_cmi25,g_tc_cmi00)
                    IF NOT cl_null(g_errno) THEN
                       CALL cl_err('',g_errno,1)
                       NEXT FIELD tc_cmi25
                    END IF
            ELSE
               #異動碼-7控制方式
               IF m_aag331='2' OR m_aag331='3' THEN
                  CALL cl_err('','mfg0037',0)
                  NEXT FIELD tc_cmi25
               END IF
            END IF
            CALL t212_set_required(p_cmd)
           IF p_cmd ='a' OR g_tc_cmi[l_ac].tc_cmi25 <> g_tc_cmi_t.tc_cmi25 THEN
              CALL t212_get_ahe02(g_tc_cmi[l_ac].tc_cmi05,g_tc_cmi[l_ac].tc_cmi25,'aag33','7') RETURNING g_tc_cmi[l_ac].tc_cmi26
           END IF


        BEFORE FIELD tc_cmi27
           IF cl_null(m_aag341) THEN
              LET g_tc_cmi[l_ac].tc_cmi27 = ' '
           END IF
           CALL t212_error(m_aag34)
           IF g_aaz.aaz116 = 'Y' THEN
              IF (m_aag341='2' OR m_aag341='3') AND cl_null(g_tc_cmi[l_ac].tc_cmi27) THEN
                 CALL s_ahe_qry(g_tc_cmi[l_ac].tc_cmi05,'8','i',g_tc_cmi[l_ac].tc_cmi27,g_tc_cmi00)
                      RETURNING g_tc_cmi[l_ac].tc_cmi27
                 DISPLAY g_tc_cmi[l_ac].tc_cmi27 TO tc_cmi27
              END IF
           END IF

        AFTER FIELD tc_cmi27
            IF NOT cl_null(g_tc_cmi[l_ac].tc_cmi27) THEN
               CALL s_chk_aee(g_tc_cmi[l_ac].tc_cmi05,'8',g_tc_cmi[l_ac].tc_cmi27,g_tc_cmi00)
                    IF NOT cl_null(g_errno) THEN
                       CALL cl_err('',g_errno,1)
                       NEXT FIELD tc_cmi27
                    END IF
            ELSE
               #異動碼-8控制方式
               IF m_aag341='2' OR m_aag341='3' THEN
                  CALL cl_err('','mfg0037',0)
                  NEXT FIELD tc_cmi27
               END IF
            END IF
            CALL t212_set_required(p_cmd)
           IF p_cmd ='a' OR g_tc_cmi[l_ac].tc_cmi27 <> g_tc_cmi_t.tc_cmi27 THEN
              CALL t212_get_ahe02(g_tc_cmi[l_ac].tc_cmi05,g_tc_cmi[l_ac].tc_cmi27,'aag34','8') RETURNING g_tc_cmi[l_ac].tc_cmi28
           END IF


        AFTER FIELD tc_cmi29
          IF g_tc_cmi[l_ac].tc_cmi29 IS NOT NULL THEN
             CALL t212_tc_cmi29(p_cmd)
             IF NOT cl_null(g_errno) THEN
                CALL cl_err('',g_errno,0)
                LET g_tc_cmi[l_ac].tc_cmi29 = g_tc_cmi_t.tc_cmi29
                DISPLAY BY NAME g_tc_cmi[l_ac].tc_cmi29
                NEXT FIELD tc_cmi29
             END IF
             DISPLAY BY NAME g_tc_cmi[l_ac].tc_cmi29
          ELSE
             LET g_tc_cmi[l_ac].tc_cmi29=' '
          END IF
          CALL t212_bud(p_cmd,'0',g_tc_cmi[l_ac].*)
          IF NOT cl_null(g_errno) THEN
             NEXT FIELD tc_cmi29
          END IF
          IF p_cmd ='a' OR g_tc_cmi[l_ac].tc_cmi29 <> g_tc_cmi_t.tc_cmi29 THEN
             CALL t212_get_ahe02(g_tc_cmi[l_ac].tc_cmi05,g_tc_cmi[l_ac].tc_cmi29,'aag35','9') RETURNING g_tc_cmi[l_ac].tc_cmi30
          END IF

        AFTER FIELD tc_cmi31
          IF g_tc_cmi[l_ac].tc_cmi31 IS NOT NULL THEN
             CALL t212_tc_cmi31(p_cmd)
             IF NOT cl_null(g_errno) THEN
                CALL cl_err('',g_errno,0)
                LET g_tc_cmi[l_ac].tc_cmi31 = g_tc_cmi_t.tc_cmi31
                DISPLAY BY NAME g_tc_cmi[l_ac].tc_cmi31
                NEXT FIELD tc_cmi31
             END IF
             DISPLAY BY NAME g_tc_cmi[l_ac].tc_cmi31
          END IF
          CALL t212_bud(p_cmd,'0',g_tc_cmi[l_ac].*)
          IF NOT cl_null(g_errno) THEN
             NEXT FIELD tc_cmi31
          END IF
          IF p_cmd ='a' OR g_tc_cmi[l_ac].tc_cmi31 <> g_tc_cmi_t.tc_cmi31 THEN
             CALL t212_get_ahe02(g_tc_cmi[l_ac].tc_cmi05,g_tc_cmi[l_ac].tc_cmi31,'aag36','10') RETURNING g_tc_cmi[l_ac].tc_cmi32
          END IF


        BEFORE FIELD tc_cmi33
           IF cl_null(m_aag371) THEN
              LET g_tc_cmi[l_ac].tc_cmi33 = ' '
           END IF
           CALL t212_error(m_aag37)
           IF g_aaz.aaz116 = 'Y' THEN
              IF (m_aag371='2' OR m_aag371='3') AND cl_null(g_tc_cmi[l_ac].tc_cmi33) THEN
                 CALL s_ahe_qry(g_tc_cmi[l_ac].tc_cmi05,'99','i',g_tc_cmi[l_ac].tc_cmi33,g_tc_cmi00)
                      RETURNING g_tc_cmi[l_ac].tc_cmi33
                 DISPLAY g_tc_cmi[l_ac].tc_cmi33 TO tc_cmi33
              END IF
           END IF

        AFTER FIELD tc_cmi33
            IF g_aza.aza26 = '2' THEN
               LET l_pmc903 = NULL
               SELECT pmc903 INTO l_pmc903  FROM pmc_file WHERE pmc01 = g_tc_cmi[l_ac].tc_cmi13
               IF STATUS THEN
                 SELECT occ37 INTO l_pmc903  FROM occ_file WHERE occ01 = g_tc_cmi[l_ac].tc_cmi13
               END IF
            END IF
            IF NOT cl_null(g_tc_cmi[l_ac].tc_cmi33) THEN
               CALL s_chk_aee(g_tc_cmi[l_ac].tc_cmi05,'99',g_tc_cmi[l_ac].tc_cmi33,g_tc_cmi00)
                    IF NOT cl_null(g_errno) THEN
                       CALL cl_err('',g_errno,1)
                       NEXT FIELD tc_cmi33
                    END IF
               IF m_aag371='4' AND g_aza.aza26 ='2' THEN
                  IF NOT cl_null(g_tc_cmi[l_ac].tc_cmi13) THEN
                     IF l_pmc903 = 'Y' THEN
                        IF g_tc_cmi[l_ac].tc_cmi33 <> g_tc_cmi[l_ac].tc_cmi13 THEN
                          CALL cl_err('','agl-959',1)
                          NEXT FIELD tc_cmi33
                        END IF
                     END IF
                     IF l_pmc903 = 'N' THEN
                        CALL cl_err('','agl-334',1)
                        NEXT FIELD tc_cmi33
                     END IF
                  END IF
               END IF
            ELSE
               #關係人異動碼控制方式
               IF m_aag371='2' OR m_aag371='3' THEN
                  CALL cl_err('','mfg0037',0)
                  NEXT FIELD tc_cmi33
               END IF
               IF m_aag371='4' AND g_aza.aza26 ='2' THEN
                  IF NOT cl_null(g_tc_cmi[l_ac].tc_cmi13) THEN
                     IF l_pmc903 = 'Y' THEN
                        IF g_tc_cmi[l_ac].tc_cmi33 <> g_tc_cmi[l_ac].tc_cmi13 THEN
                          CALL cl_err('','agl-959',1)
                          NEXT FIELD tc_cmi33
                        END IF
                     END IF
                  END IF
               END IF
            END IF
            CALL t212_set_required(p_cmd)


           IF p_cmd ='a' OR g_tc_cmi[l_ac].tc_cmi33 <> g_tc_cmi_t.tc_cmi33 THEN
              CALL t212_get_ahe02(g_tc_cmi[l_ac].tc_cmi05,g_tc_cmi[l_ac].tc_cmi33,'aag37','99') RETURNING g_tc_cmi[l_ac].tc_cmi34
           END IF
       #FUN-D80058--add--end--

        BEFORE DELETE                            #是否取消單身
            IF g_tc_cmi_t.tc_cmi05 IS NOT NULL THEN
                IF NOT cl_delb(0,0) THEN
                     CANCEL DELETE
                END IF
                IF l_lock_sw = "Y" THEN
                   CALL cl_err("", -263, 1)
                   CANCEL DELETE
                END IF
                DELETE FROM tc_cmi_file
                    WHERE tc_cmi01 = g_tc_cmia.tc_cmi01 AND
                          tc_cmi02 = g_tc_cmia.tc_cmi02 AND
                          tc_cmi03 = g_tc_cmia.tc_cmi03 AND
                          tc_cmi04 = g_tc_cmia.tc_cmi04 AND
                          tc_cmi00 = g_tc_cmia.tc_cmi00 AND      #No.FUN-9B0118
                          tc_cmi05 = g_tc_cmi_t.tc_cmi05 AND
                          tc_cmi06 = g_tc_cmi_t.tc_cmi06 AND
                          #FUN-D80058--add--str--
                          tc_cmi13 = g_tc_cmi_t.tc_cmi13 AND
                          tc_cmi15 = g_tc_cmi_t.tc_cmi15 AND
                          tc_cmi17 = g_tc_cmi_t.tc_cmi16 AND
                          tc_cmi19 = g_tc_cmi_t.tc_cmi19 AND
                          tc_cmi21 = g_tc_cmi_t.tc_cmi21 AND
                          tc_cmi23 = g_tc_cmi_t.tc_cmi23 AND
                          tc_cmi25 = g_tc_cmi_t.tc_cmi25 AND
                          tc_cmi27 = g_tc_cmi_t.tc_cmi27 AND
                          tc_cmi29 = g_tc_cmi_t.tc_cmi29 AND
                          tc_cmi31 = g_tc_cmi_t.tc_cmi31 AND
                          tc_cmi33 = g_tc_cmi_t.tc_cmi33 AND
                          tc_cmi35 = g_tc_cmi_t.tc_cmi35
                          #FUN-D80058--add--end--
                IF SQLCA.sqlcode THEN
                   CALL cl_err3("del","tc_cmi_file",g_tc_cmia.tc_cmi01,g_tc_cmia.tc_cmi02,SQLCA.sqlcode,"","",1)  #No.FUN-660127
                   ROLLBACK WORK
                   CANCEL DELETE
                END IF
                LET g_rec_b=g_rec_b-1
                DISPLAY g_rec_b TO FORMONLY.cn2
                COMMIT WORK
            END IF
            SELECT SUM(tc_cmi10) INTO g_tc_cmi08_tot FROM tc_cmi_file
                WHERE tc_cmi01=g_tc_cmia.tc_cmi01 AND tc_cmi02=g_tc_cmia.tc_cmi02
                AND tc_cmi03=g_tc_cmia.tc_cmi03 AND tc_cmi04=g_tc_cmia.tc_cmi04
                AND tc_cmi00=g_tc_cmia.tc_cmi00                           #No.FUN-9B0118
            DISPLAY g_tc_cmi08_tot TO FORMONLY.cmi08_tot

        ON ROW CHANGE
            IF INT_FLAG THEN
               CALL cl_err('',9001,0)
               LET INT_FLAG = 0
               LET g_tc_cmi[l_ac].* = g_tc_cmi_t.*
               CLOSE t212_bcl
               ROLLBACK WORK
               EXIT INPUT
            END IF
           #CHI-CA0076---add---S
            LET l_flag2=''
            IF p_cmd = 'u' AND INT_FLAG = 0 THEN
               LET l_flag2='Y'
            END IF
           #CHI-CA0076---add---E
            IF l_lock_sw = 'Y' THEN
               CALL cl_err(g_tc_cmi[l_ac].tc_cmi05,-263,1)
               LET g_tc_cmi[l_ac].* = g_tc_cmi_t.*
            ELSE
               UPDATE tc_cmi_file SET
                      tc_cmi05=g_tc_cmi[l_ac].tc_cmi05,
                      tc_cmi06=g_tc_cmi[l_ac].tc_cmi06,
                      tc_cmi07=g_tc_cmi[l_ac].tc_cmi07,
                      tc_cmi08=g_tc_cmi[l_ac].tc_cmi08,
                      #FUN-D80058--add--str--
                      tc_cmi13=g_tc_cmi[l_ac].tc_cmi13,
                      tc_cmi14=g_tc_cmi[l_ac].tc_cmi14,
                      tc_cmi15=g_tc_cmi[l_ac].tc_cmi15,
                      tc_cmi16=g_tc_cmi[l_ac].tc_cmi16,
                      tc_cmi17=g_tc_cmi[l_ac].tc_cmi17,
                      tc_cmi18=g_tc_cmi[l_ac].tc_cmi18,
                      tc_cmi19=g_tc_cmi[l_ac].tc_cmi19,
                      tc_cmi20=g_tc_cmi[l_ac].tc_cmi20,
                      tc_cmi21=g_tc_cmi[l_ac].tc_cmi21,
                      tc_cmi22=g_tc_cmi[l_ac].tc_cmi22,
                      tc_cmi23=g_tc_cmi[l_ac].tc_cmi23,
                      tc_cmi24=g_tc_cmi[l_ac].tc_cmi24,
                      tc_cmi25=g_tc_cmi[l_ac].tc_cmi25,
                      tc_cmi26=g_tc_cmi[l_ac].tc_cmi26,
                      tc_cmi27=g_tc_cmi[l_ac].tc_cmi27,
                      tc_cmi28=g_tc_cmi[l_ac].tc_cmi28,
                      tc_cmi29=g_tc_cmi[l_ac].tc_cmi29,
                      tc_cmi30=g_tc_cmi[l_ac].tc_cmi30,
                      tc_cmi31=g_tc_cmi[l_ac].tc_cmi31,
                      tc_cmi32=g_tc_cmi[l_ac].tc_cmi32,
                      tc_cmi33=g_tc_cmi[l_ac].tc_cmi33,
                      tc_cmi34=g_tc_cmi[l_ac].tc_cmi34,
                      tc_cmi35=g_tc_cmi[l_ac].tc_cmi35,
                      #FUN-D80058--add--end--
                      #str------- add by dengsy161011
                      tc_cmi36=g_tc_cmi[l_ac].tc_cmi36,
                      tc_cmi37=g_tc_cmi[l_ac].tc_cmi37,
                      #end------- add by dengsy161011
                      tc_cmimodu=g_user,
                      tc_cmidate=g_today
                WHERE tc_cmi01 = g_tc_cmia.tc_cmi01
                  AND tc_cmi02 = g_tc_cmia.tc_cmi02
                  AND tc_cmi03 = g_tc_cmia.tc_cmi03
                  AND tc_cmi04 = g_tc_cmia.tc_cmi04
                  AND tc_cmi00 = g_tc_cmia.tc_cmi00          #No.FUN-9B0118
                  AND tc_cmi05 = g_tc_cmi_t.tc_cmi05
                  AND tc_cmi06 = g_tc_cmi_t.tc_cmi06
                  AND tc_cmi35 = g_tc_cmi_t.tc_cmi35   #add renjj170106
                  #FUN-D80058--add--str--
                  #AND tc_cmi13 = g_tc_cmi_t.tc_cmi13
                  #AND tc_cmi15 = g_tc_cmi_t.tc_cmi15
                  #AND tc_cmi17 = g_tc_cmi_t.tc_cmi16
                  #AND tc_cmi19 = g_tc_cmi_t.tc_cmi19
                  #AND tc_cmi21 = g_tc_cmi_t.tc_cmi21
                  #AND tc_cmi23 = g_tc_cmi_t.tc_cmi23
                  #AND tc_cmi25 = g_tc_cmi_t.tc_cmi25
                  #AND tc_cmi27 = g_tc_cmi_t.tc_cmi27
                  #AND tc_cmi29 = g_tc_cmi_t.tc_cmi29
                  #AND tc_cmi31 = g_tc_cmi_t.tc_cmi31
                  #AND tc_cmi33 = g_tc_cmi_t.tc_cmi33
                  #AND tc_cmi35 = g_tc_cmi_t.tc_cmi35
                  #FUN-D80058--add--end--

               IF SQLCA.sqlcode THEN
                   CALL cl_err3("upd","tc_cmi_file",g_tc_cmi_t.tc_cmi05,g_tc_cmi_t.tc_cmi06,SQLCA.sqlcode,"","",1)  #No.FUN-660127
                   LET g_tc_cmi[l_ac].* = g_tc_cmi_t.*
               ELSE
                   MESSAGE 'UPDATE O.K'
                   COMMIT WORK
               END IF
            END IF
            SELECT SUM(tc_cmi10) INTO g_tc_cmi08_tot FROM tc_cmi_file
                WHERE tc_cmi01=g_tc_cmia.tc_cmi01 AND tc_cmi02=g_tc_cmia.tc_cmi02
                AND tc_cmi03=g_tc_cmia.tc_cmi03 AND tc_cmi04=g_tc_cmia.tc_cmi04
                AND tc_cmi00=g_tc_cmia.tc_cmi00                              #No.FUN-9B0118
            DISPLAY g_tc_cmi08_tot TO FORMONLY.cmi08_tot


        AFTER ROW
            LET l_ac = ARR_CURR()
           #LET l_ac_t = l_ac   #FUN-D40030 mark
            IF INT_FLAG THEN
               CALL cl_err('',9001,0)
               LET INT_FLAG = 0
               IF p_cmd = 'u' THEN
                  LET g_tc_cmi[l_ac].* = g_tc_cmi_t.*
               #FUN-D40030--add--begin--
               ELSE
                  CALL g_tc_cmi.deleteElement(l_ac)
                  IF g_rec_b != 0 THEN
                     LET g_action_choice = "detail"
                     LET l_ac = l_ac_t
                  END IF
               #FUN-D40030--add--end----
               END IF
               CLOSE t212_bcl
               ROLLBACK WORK
               EXIT INPUT
            END IF

            LET l_ac_t = l_ac  #FUN-D40030 add
            CLOSE t212_bcl
            COMMIT WORK

       #CHI-CA0076---add---S
        AFTER INPUT
            IF l_flag2 ='Y' THEN
                CALL cl_err('','axct002',1)
            END IF
       #CHI-CA0076---add---E

        ON ACTION CONTROLO                        #沿用所有欄位
            IF INFIELD(tc_cmi05) AND l_ac > 1 THEN
                LET g_tc_cmi[l_ac].* = g_tc_cmi[l_ac-1].*
                NEXT FIELD tc_cmi05
            END IF

        ON ACTION CONTROLR
           CALL cl_show_req_fields()

        ON ACTION CONTROLG
           CALL cl_cmdask()

        ON ACTION CONTROLF
           CALL cl_set_focus_form(ui.Interface.getRootNode()) RETURNING g_fld_name,g_frm_name #Add on 040913
           CALL cl_fldhelp(g_frm_name,g_fld_name,g_lang) #Add on 040913

        ON ACTION controls                                            #No.FUN-6A0092
         CALL cl_set_head_visible("","AUTO")                          #No.FUN-6A0092

        ON ACTION controlp
           CASE WHEN INFIELD(tc_cmi05) #科目
                  CALL cl_init_qry_var()
                  LET g_qryparam.form     ="q_aag"
                  LET g_qryparam.default1 = g_tc_cmi[l_ac].tc_cmi05
                  LET g_qryparam.arg1     = ""     #carrier check bookno?
#                 LET g_qryparam.arg2     = "2"       #MOD-B80095 mark
                  LET g_qryparam.arg2     = "2','3"   #MOD-B80095
                  LET g_qryparam.arg3     = ""
                  IF cl_null(g_qryparam.where) THEN
                     LET g_qryparam.where=" 1=1 "
                  END IF
                  IF g_qryparam.arg1 IS NOT NULL AND
                     g_qryparam.arg1 != '' THEN
                     LET g_qryparam.where = g_qryparam.where CLIPPED,
                     " AND aag03 IN ('",g_qryparam.arg1 CLIPPED,"') "
                  END IF
                  IF g_qryparam.arg2 IS NOT NULL AND
                     g_qryparam.arg2 != ' ' THEN
                     LET g_qryparam.where = g_qryparam.where CLIPPED ,
                     " AND aag07 IN ('",g_qryparam.arg2 CLIPPED,"') "
                  END IF
                  IF g_qryparam.arg3 IS NOT NULL AND
                     g_qryparam.arg3 != ' ' THEN
                     LET g_qryparam.where = g_qryparam.where CLIPPED,
                     " AND aag01 IN ('",g_qryparam.arg3,"') "
                  END IF
                  LET g_qryparam.where = g_qryparam.where CLIPPED #," ORDER BY 2 "
                  LET g_qryparam.arg1 =  g_tc_cmia.tc_cmi00   #No.FUN-9B0118
                  CALL cl_create_qry() RETURNING g_tc_cmi[l_ac].tc_cmi05
                  DISPLAY BY NAME g_tc_cmi[l_ac].tc_cmi05
                  NEXT FIELD tc_cmi05
             WHEN INFIELD(tc_cmi06) #部門
                  CALL cl_init_qry_var()
                  LET g_qryparam.form     = "q_gem"
                  LET g_qryparam.default1 = g_tc_cmi[l_ac].tc_cmi06
                  CALL cl_create_qry() RETURNING g_tc_cmi[l_ac].tc_cmi06
                  DISPLAY BY NAME g_tc_cmi[l_ac].tc_cmi06
                  NEXT FIELD tc_cmi06

             #str------- add by dengsy161011
             WHEN INFIELD(tc_cmi36) #科目
                  CALL cl_init_qry_var()
                  LET g_qryparam.form     ="q_aag"
                  LET g_qryparam.default1 = g_tc_cmi[l_ac].tc_cmi36
                  LET g_qryparam.arg1     = ""     #carrier check bookno?
                  LET g_qryparam.arg2     = "2','3"   #MOD-B80095
                  LET g_qryparam.arg3     = ""
                  IF cl_null(g_qryparam.where) THEN
                     LET g_qryparam.where=" 1=1 "
                  END IF
                  IF g_qryparam.arg1 IS NOT NULL AND
                     g_qryparam.arg1 != '' THEN
                     LET g_qryparam.where = g_qryparam.where CLIPPED,
                     " AND aag03 IN ('",g_qryparam.arg1 CLIPPED,"') "
                  END IF
                  IF g_qryparam.arg2 IS NOT NULL AND
                     g_qryparam.arg2 != ' ' THEN
                     LET g_qryparam.where = g_qryparam.where CLIPPED ,
                     " AND aag07 IN ('",g_qryparam.arg2 CLIPPED,"') "
                  END IF
                  IF g_qryparam.arg3 IS NOT NULL AND
                     g_qryparam.arg3 != ' ' THEN
                     LET g_qryparam.where = g_qryparam.where CLIPPED,
                     " AND aag01 IN ('",g_qryparam.arg3,"') "
                  END IF
                  LET g_qryparam.where = g_qryparam.where CLIPPED #," ORDER BY 2 "
                  LET g_qryparam.arg1 =  g_tc_cmia.tc_cmi00   #No.FUN-9B0118
                  CALL cl_create_qry() RETURNING g_tc_cmi[l_ac].tc_cmi36
                  DISPLAY g_tc_cmi[l_ac].tc_cmi36 TO tc_cmi36
                  NEXT FIELD tc_cmi36
             WHEN INFIELD(tc_cmi37) #部門
                  CALL cl_init_qry_var()
                  LET g_qryparam.form     = "q_gem"
                  LET g_qryparam.default1 = g_tc_cmi[l_ac].tc_cmi37
                  CALL cl_create_qry() RETURNING g_tc_cmi[l_ac].tc_cmi37
                  DISPLAY BY NAME g_tc_cmi[l_ac].tc_cmi37
                  NEXT FIELD tc_cmi37
             #end------- add by dengsy161011
             #FUN-D80058--add--str--
             WHEN INFIELD(tc_cmi35)    #查詢專案編號
                  CALL cl_init_qry_var()
                  LET g_qryparam.form ="q_pja"
                  LET g_qryparam.default1 = g_tc_cmi[l_ac].tc_cmi35
                  CALL cl_create_qry() RETURNING g_tc_cmi[l_ac].tc_cmi35
                  DISPLAY BY NAME g_tc_cmi[l_ac].tc_cmi35
                  NEXT FIELD tc_cmi35
             WHEN INFIELD(tc_cmi13)    #查詢異動碼-1
                  CALL s_ahe_qry(g_tc_cmi[l_ac].tc_cmi05,'1','i',g_tc_cmi[l_ac].tc_cmi13,g_tc_cmi00)
                     RETURNING g_tc_cmi[l_ac].tc_cmi13
                  DISPLAY g_tc_cmi[l_ac].tc_cmi13 TO tc_cmi13
                  NEXT FIELD tc_cmi13

               WHEN INFIELD(tc_cmi15)    #查詢異動碼-2
                  CALL s_ahe_qry(g_tc_cmi[l_ac].tc_cmi05,'2','i',g_tc_cmi[l_ac].tc_cmi15,g_tc_cmi00)
                     RETURNING g_tc_cmi[l_ac].tc_cmi15
                  DISPLAY g_tc_cmi[l_ac].tc_cmi15 TO tc_cmi15
                  NEXT FIELD tc_cmi15

               WHEN INFIELD(tc_cmi17)    #查詢異動碼-3
                  CALL s_ahe_qry(g_tc_cmi[l_ac].tc_cmi05,'3','i',g_tc_cmi[l_ac].tc_cmi17,g_tc_cmi00)
                     RETURNING g_tc_cmi[l_ac].tc_cmi17
                  DISPLAY g_tc_cmi[l_ac].tc_cmi17 TO tc_cmi17
                  NEXT FIELD tc_cmi17

               WHEN INFIELD(tc_cmi19)    #查詢異動碼-4
                  CALL s_ahe_qry(g_tc_cmi[l_ac].tc_cmi05,'4','i',g_tc_cmi[l_ac].tc_cmi19,g_tc_cmi00)
                     RETURNING g_tc_cmi[l_ac].tc_cmi19
                  DISPLAY g_tc_cmi[l_ac].tc_cmi16 TO tc_cmi19
                  NEXT FIELD tc_cmi19

               WHEN INFIELD(tc_cmi21)    #查詢異動碼-5
                  CALL s_ahe_qry(g_tc_cmi[l_ac].tc_cmi05,'5','i',g_tc_cmi[l_ac].tc_cmi21,g_tc_cmi00)
                     RETURNING g_tc_cmi[l_ac].tc_cmi21
                  DISPLAY g_tc_cmi[l_ac].tc_cmi21 TO tc_cmi21
                  NEXT FIELD tc_cmi21

               WHEN INFIELD(tc_cmi23)    #查詢異動碼-6
                  CALL s_ahe_qry(g_tc_cmi[l_ac].tc_cmi05,'6','i',g_tc_cmi[l_ac].tc_cmi23,g_tc_cmi00)
                     RETURNING g_tc_cmi[l_ac].tc_cmi23
                  DISPLAY g_tc_cmi[l_ac].tc_cmi23 TO tc_cmi23
                  NEXT FIELD tc_cmi23

               WHEN INFIELD(tc_cmi25)    #查詢異動碼-7
                  CALL s_ahe_qry(g_tc_cmi[l_ac].tc_cmi05,'7','i',g_tc_cmi[l_ac].tc_cmi25,g_tc_cmi00)
                     RETURNING g_tc_cmi[l_ac].tc_cmi25
                  DISPLAY g_tc_cmi[l_ac].tc_cmi25 TO tc_cmi25
                  NEXT FIELD tc_cmi25

               WHEN INFIELD(tc_cmi27)    #查詢異動碼-8
                  CALL s_ahe_qry(g_tc_cmi[l_ac].tc_cmi05,'8','i',g_tc_cmi[l_ac].tc_cmi27,g_tc_cmi00)
                     RETURNING g_tc_cmi[l_ac].tc_cmi27
                  DISPLAY g_tc_cmi[l_ac].tc_cmi27 TO tc_cmi27
                  NEXT FIELD tc_cmi27
               WHEN INFIELD(tc_cmi29)    #查詢異動碼-9
                  CALL cl_init_qry_var()
                   LET g_qryparam.form ="q_pjb4"
                   LET g_qryparam.arg1 = g_tc_cmi[l_ac].tc_cmi35
                   LET g_qryparam.default1 = g_tc_cmi[l_ac].tc_cmi29
                   CALL cl_create_qry() RETURNING g_tc_cmi[l_ac].tc_cmi29
                   DISPLAY g_tc_cmi[l_ac].tc_cmi29 TO tc_cmi29
                   NEXT FIELD tc_cmi29
               WHEN INFIELD(tc_cmi31)    #查詢異動碼-10
                  CALL cl_init_qry_var()
                  LET g_qryparam.form ="q_azf01a"
                  LET g_qryparam.arg1 = '7'
                  CALL cl_create_qry() RETURNING g_tc_cmi[l_ac].tc_cmi31
                  DISPLAY g_tc_cmi[l_ac].tc_cmi31 TO tc_cmi31
               WHEN INFIELD(tc_cmi33)    #關係人
                  CALL s_ahe_qry(g_tc_cmi[l_ac].tc_cmi05,'99','i',g_tc_cmi[l_ac].tc_cmi33,g_tc_cmi00)
                     RETURNING g_tc_cmi[l_ac].tc_cmi33
                  DISPLAY g_tc_cmi[l_ac].tc_cmi33 TO tc_cmi33
                  NEXT FIELD tc_cmi33
             #FUN-D80058--add--end--
                  OTHERWISE EXIT CASE
           END CASE

        ON IDLE g_idle_seconds
           CALL cl_on_idle()
           CONTINUE INPUT

        ON ACTION about         #MOD-4C0121
           CALL cl_about()      #MOD-4C0121

        ON ACTION help          #MOD-4C0121
           CALL cl_show_help()  #MOD-4C0121

    END INPUT
    #FUN-D80058--add--str--
    LET g_sql =
       #"SELECT tc_cmi05,tc_cmi06,tc_cmi07,tc_cmi08,",  #mark by dengsy161011
       "SELECT tc_cmi05,tc_cmi06,tc_cmi07,tc_cmi08,tc_cmi10,tc_cmi36,aag02,tc_cmi37,gem02,",  #add by dengsy161011
       "       tc_cmi35,tc_cmi13,tc_cmi14,tc_cmi15,",
       "       tc_cmi16,tc_cmi17,tc_cmi18,tc_cmi19,",
       "       tc_cmi20,tc_cmi21,tc_cmi22,tc_cmi23,",
       "       tc_cmi24,tc_cmi25,tc_cmi26,tc_cmi27,",
       "       tc_cmi28,tc_cmi29,tc_cmi30,tc_cmi31,",
       "       tc_cmi32,tc_cmi33,tc_cmi34",
       " FROM tc_cmi_file",
       " left join aag_file on aag01=tc_cmi36 ",  #add by dengsy161011
       " left join gem_file on gem01=tc_cmi37 ",  #add by dengsy161011
       " WHERE tc_cmi01 = '",g_tc_cmi01,"' AND ",
       " tc_cmi02='",g_tc_cmi02,"' AND  tc_cmi03='",g_tc_cmi03,"' AND tc_cmi04='",g_tc_cmi04,"'",
       " AND tc_cmi00 = '",g_tc_cmi00,"'",
       " ORDER BY 1"
    PREPARE t212_pre1 FROM g_sql      #預備一下
    IF SQLCA.SQLCODE THEN
        CALL cl_err('FILL PREPARE:',SQLCA.SQLCODE,1)
        RETURN
    END IF
    DECLARE t212_cus1 CURSOR FOR t212_pre1
    LET l_flag_t = 0
    LET i = 1
    FOREACH t212_cus1 INTO g_tc_cmi[i].*
       LET l_flag = 0
       IF NOT cl_null(g_tc_cmi[i].tc_cmi13) THEN
          LET l_flag = 1
       END IF
       IF NOT cl_null(g_tc_cmi[i].tc_cmi15) THEN
          LET l_flag = 2
       END IF
       IF NOT cl_null(g_tc_cmi[i].tc_cmi17) THEN
          LET l_flag = 3
       END IF
       IF NOT cl_null(g_tc_cmi[i].tc_cmi19) THEN
          LET l_flag = 4
       END IF
       IF NOT cl_null(g_tc_cmi[i].tc_cmi21) THEN
          LET l_flag = 5
       END IF
       IF NOT cl_null(g_tc_cmi[i].tc_cmi23) THEN
          LET l_flag = 6
       END IF
       IF NOT cl_null(g_tc_cmi[i].tc_cmi25) THEN
          LET l_flag = 7
       END IF
       IF NOT cl_null(g_tc_cmi[i].tc_cmi27) THEN
          LET l_flag = 8
       END IF
       IF NOT cl_null(g_tc_cmi[i].tc_cmi29) THEN
          LET l_flag = 9
       END IF
       IF NOT cl_null(g_tc_cmi[i].tc_cmi31) THEN
          LET l_flag = 10
       END IF
       IF NOT cl_null(g_tc_cmi[i].tc_cmi33) THEN
          LET l_flag = 11
       END IF
       IF l_flag >= l_flag_t THEN
          LET l_flag_t = l_flag
       END IF
       LET i = i + 1
    END FOREACH
    CALL t212_visible(l_flag_t)    #FUN-D80058 add
    #FUN-D80058--add--end--
    CLOSE t212_bcl
    COMMIT WORK
END FUNCTION

 FUNCTION t212_tc_cmi05(p_code,p_bookno)             #No.FUN-730057
  DEFINE p_code     LIKE aag_file.aag01
  DEFINE p_bookno   LIKE aag_file.aag00           #No.FUN-730057
  DEFINE l_aagacti  LIKE aag_file.aagacti
  DEFINE l_aag07    LIKE aag_file.aag07
  DEFINE l_aag09    LIKE aag_file.aag09
  DEFINE l_aag03    LIKE aag_file.aag03

   #FUN-D80058--mark--str--
   #SELECT aag03,aag07,aag09,aagacti
   #  INTO l_aag03,l_aag07,l_aag09,l_aagacti
   #  FROM aag_file
   # WHERE aag01=p_code
   #   AND aag00=p_bookno      #No.FUN-730057
   #FUN-D80058--mark--end--
   #FUN-D80058--add--str--
   SELECT aag02,aag03,aag07,aagacti,
          aag05,aag15,aag16,aag17,aag18,aag151,
          aag161,aag171,aag181,aag06,aag21,aag23,aag222,aag20,
          aag31,aag32,aag33,aag34,aag35,aag36,aag37,
          aag311,aag321,aag331,aag341,aag351,aag361,aag371
     INTO l_aag02,l_aag03,l_aag07,l_aagacti,
          m_aag05,m_aag15,m_aag16,m_aag17,m_aag18,
          m_aag151,m_aag161,m_aag171,m_aag181,
          m_aag06,m_aag21,m_aag23,m_aag222,m_aag20,
          m_aag31,m_aag32,m_aag33,m_aag34,m_aag35,m_aag36,m_aag37,
          m_aag311,m_aag321,m_aag331,m_aag341,m_aag351,m_aag361,m_aag371
     FROM aag_file
    WHERE aag01 = p_code
      AND aag00 = p_bookno
    #FUN-D80058--add--end--
   CASE WHEN STATUS=100         LET g_errno='agl-001'  #No.7926
        WHEN l_aagacti='N'      LET g_errno='9028'
         WHEN l_aag07  = '1'      LET g_errno = 'agl-015'
         WHEN l_aag03  = '4'      LET g_errno = 'agl-177'
         WHEN l_aag09  = 'N'      LET g_errno = 'agl-214'
        OTHERWISE LET g_errno=SQLCA.sqlcode USING '----------'
   END CASE
END FUNCTION

FUNCTION t212_b_askkey()
DEFINE
    l_wc            LIKE type_file.chr1000       #No.FUN-680122CHAR(200)

    CALL cl_opmsg('q')
	CLEAR tc_cmi03,tc_cmi04,tc_cmi05
    CONSTRUCT l_wc ON tc_cmi05,tc_cmi06,tc_cmi07,tc_cmi08     #螢幕上取條件
       FROM s_tc_cmi[1].tc_cmi05,s_tc_cmi[1].tc_cmi06,s_tc_cmi[1].tc_cmi07,s_tc_cmi[1].tc_cmi08
              BEFORE CONSTRUCT
                 CALL cl_qbe_init()
       ON IDLE g_idle_seconds
          CALL cl_on_idle()
          CONTINUE CONSTRUCT

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121

      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121

      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121


                 ON ACTION qbe_select
         	   CALL cl_qbe_select()
                 ON ACTION qbe_save
		   CALL cl_qbe_save()
    END CONSTRUCT
    IF INT_FLAG THEN RETURN END IF
    CALL t212_b_fill(l_wc)
    CALL cl_opmsg('b')
END FUNCTION

FUNCTION t212_t()
  DEFINE l_sql LIKE type_file.chr1000       #No.FUN-680122CHAR(600)
  DEFINE l_sql1 LIKE type_file.chr1000      #No.FUN-680122CHAR(600)
  DEFINE p_row,p_col LIKE type_file.num5    #No.FUN-680122 SMALLINT
  DEFINE l_tot LIKE aao_file.aao05
  DEFINE l_dbs LIKE azp_file.azp03
  DEFINE l_plant LIKE type_file.chr10       #FUN-980020

     LET p_row = 6 LET p_col = 6

     OPEN WINDOW t212_w3 AT p_row,p_col WITH FORM
          "axc/42f/axct212_t"  ATTRIBUTE (STYLE = g_win_style CLIPPED) #No.FUN-580092 HCN
     CALL cl_ui_locale("axct212_t")

     INITIALIZE g_tc_cmia.* TO NULL
     CONSTRUCT BY NAME g_wc ON
         aao01,aao02
              BEFORE CONSTRUCT
                 CALL cl_qbe_init()
        ON IDLE g_idle_seconds
           CALL cl_on_idle()
           CONTINUE CONSTRUCT

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121

      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121

      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121


                 ON ACTION qbe_select
         	   CALL cl_qbe_select()
                 ON ACTION qbe_save
		   CALL cl_qbe_save()
     END CONSTRUCT
     IF INT_FLAG THEN LET INT_FLAG = 0 CLOSE WINDOW t212_w3 RETURN END IF
     INPUT BY NAME g_tc_cmia.tc_cmi01,g_tc_cmia.tc_cmi02,g_tc_cmia.tc_cmi03,g_tc_cmia.tc_cmi00,g_tc_cmia.tc_cmi12,g_tc_cmia.tc_cmi04   #No.FUN-9B0118
     WITHOUT DEFAULTS
     AFTER FIELD tc_cmi01
        IF NOT cl_null(g_tc_cmia.tc_cmi01) THEN
           IF g_tc_cmia.tc_cmi01 < g_ccz.ccz01 THEN
              CALL cl_err(g_tc_cmia.tc_cmi01,'axc-095',0)
              NEXT FIELD tc_cmi01
           END IF
        END IF
     AFTER FIELD tc_cmi02
        IF NOT cl_null(g_tc_cmia.tc_cmi02) THEN
           IF g_tc_cmia.tc_cmi01 = g_ccz.ccz01 AND g_tc_cmia.tc_cmi02 < g_ccz.ccz02 THEN
              CALL cl_err(g_tc_cmia.tc_cmi02,'axc-095',0)   #No:MOD-9C0025 modify
              NEXT FIELD tc_cmi02    #No:MOD-9C0025 modify
           END IF
        END IF

     AFTER FIELD tc_cmi03
        IF cl_null(g_tc_cmia.tc_cmi03) THEN LET g_tc_cmia.tc_cmi03=' ' END IF
        IF NOT cl_null(g_tc_cmia.tc_cmi03) THEN
           IF g_aaz.aaz90='Y' THEN
              IF NOT s_costcenter_chk(g_tc_cmia.tc_cmi03) THEN
                 NEXT FIELD tc_cmi03
              END IF
           ELSE
              CALL t212_tc_cmi03(g_tc_cmia.tc_cmi03)
              IF NOT cl_null(g_errno) THEN
                 CALL cl_err(g_tc_cmia.tc_cmi03,g_errno,0)
                 NEXT FIELD tc_cmi03
              END IF
           END IF
        END IF

        AFTER FIELD tc_cmi00    #帐套
            IF NOT cl_null(g_tc_cmia.tc_cmi00) THEN
               CALL t212_tc_cmi00('a',g_tc_cmia.tc_cmi00)
               IF NOT cl_null(g_errno) THEN
                  CALL cl_err(g_tc_cmia.tc_cmi00,g_errno,0)
                  NEXT FIELD tc_cmi00
               END IF
            END IF

        ON IDLE g_idle_seconds
           CALL cl_on_idle()
           CONTINUE INPUT

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121

      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121

      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121


     END INPUT
     IF INT_FLAG THEN LET INT_FLAG = 0 CLOSE WINDOW t212_w3 RETURN END IF
     SELECT ccz12 INTO l_ccz12 FROM ccz_file
     IF NOT t212_chk(g_tc_cmia.tc_cmi00,g_tc_cmia.tc_cmi01,g_tc_cmia.tc_cmi02) THEN  #MOD-DB0167 add
        CLOSE WINDOW t212_w3  #MOD-DB0167 add
        RETURN                #MOD-DB0167 add
     END IF                   #MOD-DB0167 add

    #取參數設定ccz11,ccz12總帳所在工廠編號,帳別
     LET l_plant = g_ccz.ccz11           #FUN-980020
     #SELECT azp03 INTO l_dbs FROM azp_file where azp01=g_ccz.ccz11   #FUN-A50102
     #LET l_dbs = s_dbstring(l_dbs)                                   #FUN-A50102
     #LET l_dbs=s_dbstring(l_dbs CLIPPED) #TQC-940184                 #FUN-A50102
     LET l_sql =" SELECT aao01,aao02,aao05,aao06,aag06",
                #"  FROM ",l_dbs CLIPPED,"aao_file, ",
                #          l_dbs CLIPPED,"aag_file ",
                "  FROM ",cl_get_target_table(g_ccz.ccz11,'aao_file'),",",  #FUN-A50102
                          cl_get_target_table(g_ccz.ccz11,'aag_file'),      #FUN-A50102
                " WHERE aao00='",g_tc_cmia.tc_cmi00,"' AND aao03='",g_tc_cmia.tc_cmi01,"'",     #No.FUN-9B0118
                " AND aag01=aao01 AND aag00=aao00  AND aag07 !='1'",   #非統制帳戶       #No.FUN-730057  #No.FUN-9B0118
                " AND aao04='",g_tc_cmia.tc_cmi02,"' AND ",g_wc  CLIPPED
 	 CALL cl_replace_sqldb(l_sql) RETURNING l_sql        #FUN-920032
     CALL cl_parse_qry_sql(l_sql,g_ccz.ccz11) RETURNING l_sql #FUN-A50102
     PREPARE t212_p2 FROM l_sql
     DECLARE t212_cur2 CURSOR FOR t212_p2
     LET l_sql1 =" SELECT COUNT(*)  FROM tc_cmi_file,",
                             #l_dbs CLIPPED,"aao_file ",
                             cl_get_target_table(g_ccz.ccz11,'aao_file'),  #FUN-A50102
                " WHERE tc_cmi01='",g_tc_cmia.tc_cmi01,"' AND tc_cmi02='",g_tc_cmia.tc_cmi02,"'",
                " AND tc_cmi03='",g_tc_cmia.tc_cmi03,"' AND tc_cmi04='",g_tc_cmia.tc_cmi04,"' ",
                " AND tc_cmi00='",g_tc_cmia.tc_cmi00,"' AND aao00 = tc_cmi00 ",           #No.FUN-9B0118
                " AND aao01=tc_cmi05 AND aao02=tc_cmi06 AND aao03=tc_cmi01 AND ",
                " aao04=tc_cmi02 AND ",g_wc
     CALL cl_replace_sqldb(l_sql1) RETURNING l_sql1             #FUN-A50102
     CALL cl_parse_qry_sql(l_sql1,g_ccz.ccz11) RETURNING l_sql1 #FUN-A50102
     PREPARE t212_count FROM l_sql1
     DECLARE t212_cur3 CURSOR FOR t212_count
     OPEN t212_cur3
     FETCH t212_cur3 INTO g_cnt
     IF g_cnt > 0 THEN
        IF NOT cl_confirm('axc-096') THEN CLOSE WINDOW t212_w3 RETURN END IF
     END IF
     MESSAGE "WORKING !"
     FOREACH t212_cur2 INTO l_aao01,l_aao02,l_aao05,l_aao06,l_aag06
        DELETE FROM tc_cmi_file WHERE tc_cmi01=g_tc_cmia.tc_cmi01          #先delete 再產生
             AND tc_cmi02=g_tc_cmia.tc_cmi02 AND tc_cmi03=g_tc_cmia.tc_cmi03
             AND tc_cmi04=g_tc_cmia.tc_cmi04 AND tc_cmi05=l_aao01 AND tc_cmi06=l_aao02
             AND tc_cmi00=g_tc_cmia.tc_cmi00                            #No.FUN-9B0118

        SELECT aag02 INTO l_aag02 FROM aag_file WHERE aag01=l_aao01
                                                  AND aag00=g_tc_cmia.tc_cmi00  #No.FUN-9B0118
        IF cl_null(l_aao05) THEN LET l_aao05 = 0 END IF
        IF cl_null(l_aao06) THEN LET l_aao06 = 0 END IF
        IF l_aag06='1' THEN           #正常餘額為借餘時
           LET l_tot=l_aao05-l_aao06
        ELSE
           LET l_tot=l_aao06-l_aao05
        END IF
        #No.MOD-C40097  --Begin
        IF l_tot = 0 THEN
           CONTINUE FOREACH
        END IF
        #No.MOD-C40097  --End
        INSERT INTO tc_cmi_file(tc_cmi01,tc_cmi02,tc_cmi03,tc_cmi04,tc_cmi05,tc_cmi06,tc_cmi07,
                             tc_cmi08,tc_cmi09,tc_cmi10,tc_cmi13,tc_cmi14,tc_cmi15,tc_cmi16,       #FUN-D80058 add tc_cmi13,tc_cmi14,tc_cmi15,tc_cmi16,
                             tc_cmi17,tc_cmi18,tc_cmi19,tc_cmi20,tc_cmi21,tc_cmi22,tc_cmi23,       #FUN-D80058 add
                             tc_cmi24,tc_cmi25,tc_cmi26,tc_cmi27,tc_cmi28,tc_cmi29,tc_cmi30,       #FUN-D80058 add
                             tc_cmi31,tc_cmi32,tc_cmi33,tc_cmi34,tc_cmi35,                   #FUN-D80058 add
                             tc_cmiacti,tc_cmiuser,tc_cmigrup,
                             tc_cmimodu,tc_cmidate,tc_cmi00,tc_cmi12,tc_cmioriu,tc_cmiorig,tc_cmilegal)   #MOD-C30598 tc_cmiori要改為tc_cmiorig  #No.MOD-470041   #FUN-A50075 add legal
              VALUES (g_tc_cmia.tc_cmi01,g_tc_cmia.tc_cmi02,g_tc_cmia.tc_cmi03,
              g_tc_cmia.tc_cmi04,l_aao01,l_aao02,l_aag02,l_tot,'','',
              '','','','','','','','','','','','','','','','','','','','','','','',  #FUN-D80058 add
              'Y',g_user, g_grup,'',g_today,g_tc_cmia.tc_cmi00,g_tc_cmia.tc_cmi12, g_user, g_grup,g_legal)         #No.FUN-9B0118      #No.FUN-980030 10/01/04  insert columns oriu, orig  #FUN-A50075 add legal
     END FOREACH
     MESSAGE ""
     CLOSE WINDOW t212_w3
END FUNCTION

FUNCTION t212_copy()
  DEFINE l_sql LIKE type_file.chr1000       #No.FUN-680122CHAR(600)
  DEFINE g_tc_cmia_new RECORD LIKE tc_cmi_file.*
  DEFINE l_tc_cmi      RECORD LIKE tc_cmi_file.*
  DEFINE p_row,p_col     LIKE type_file.num5          #No.FUN-680122 SMALLINT

     IF g_tc_cmi01 IS NULL THEN RETURN END IF
     IF g_tc_cmi02 IS NULL THEN RETURN END IF
     IF g_tc_cmi03 IS NULL THEN RETURN END IF
     IF g_tc_cmi04 IS NULL THEN RETURN END IF
     IF g_tc_cmi00 IS NULL THEN RETURN END IF    #No.FUN-9B0118
     LET p_row = 6 LET p_col = 6

     OPEN WINDOW t212_w5 AT p_row,p_col WITH FORM
         "axc/42f/axct212_c"   ATTRIBUTE (STYLE = g_win_style CLIPPED) #No.FUN-580092 HCN
     CALL cl_ui_locale("axct212_c")
     INITIALIZE g_tc_cmia_new.* TO NULL
     INPUT BY NAME g_tc_cmia_new.tc_cmi01,g_tc_cmia_new.tc_cmi02,g_tc_cmia_new.tc_cmi03,
                   g_tc_cmia_new.tc_cmi00,g_tc_cmia_new.tc_cmi12,g_tc_cmia_new.tc_cmi04      #No.FUN-9B0118
     WITHOUT DEFAULTS
     AFTER FIELD tc_cmi01
        IF cl_null(g_tc_cmia_new.tc_cmi01) THEN NEXT FIELD tc_cmi01 END IF
        IF g_tc_cmia_new.tc_cmi01 < g_ccz.ccz01 THEN
           CALL cl_err(g_tc_cmia_new.tc_cmi01,'axc-095',0)
           NEXT FIELD tc_cmi01
        END IF
     AFTER FIELD tc_cmi02
        IF cl_null(g_tc_cmia_new.tc_cmi02) THEN NEXT FIELD tc_cmi02 END IF
        IF g_tc_cmia_new.tc_cmi01 = g_ccz.ccz01 AND g_tc_cmia_new.tc_cmi02 < g_ccz.ccz02 THEN
           CALL cl_err(g_tc_cmia_new.tc_cmi02,'axc-095',0) #No:MOD-9C0025 modify
           NEXT FIELD tc_cmi02    #No:MOD-9C0025 modify
        END IF

     AFTER FIELD tc_cmi03
        IF cl_null(g_tc_cmia_new.tc_cmi03) THEN LET g_tc_cmia_new.tc_cmi03 = ' ' END IF
        IF NOT cl_null(g_tc_cmia_new.tc_cmi03) THEN
           IF g_aaz.aaz90='Y' THEN
              IF NOT s_costcenter_chk(g_tc_cmia_new.tc_cmi03) THEN
                 NEXT FIELD tc_cmi03
              END IF
           ELSE
              CALL t212_tc_cmi03(g_tc_cmia_new.tc_cmi03)
              IF NOT cl_null(g_errno) THEN
                 CALL cl_err(g_tc_cmia_new.tc_cmi03,g_errno,0)
                 NEXT FIELD tc_cmi03
              END IF
           END IF
        END IF

     AFTER FIELD tc_cmi04
        IF cl_null(g_tc_cmia_new.tc_cmi04) OR g_tc_cmia_new.tc_cmi04 NOT MATCHES '[123456]'
           THEN NEXT FIELD tc_cmi04
        END IF

     AFTER FIELD tc_cmi00    #帐套
         IF NOT cl_null(g_tc_cmia_new.tc_cmi00) THEN
            CALL t212_tc_cmi00('a',g_tc_cmia_new.tc_cmi00)
            IF NOT cl_null(g_errno) THEN
               CALL cl_err(g_tc_cmia_new.tc_cmi00,g_errno,0)
               NEXT FIELD tc_cmi00
            END IF
         END IF

        ON IDLE g_idle_seconds
           CALL cl_on_idle()
           CONTINUE INPUT

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121

      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121

      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121


     END INPUT
     IF INT_FLAG THEN LET INT_FLAG = 0 CLOSE WINDOW t212_w5 RETURN END IF
     LET l_sql =" SELECT *  FROM tc_cmi_file",
                " WHERE tc_cmi01='",g_tc_cmi01,"' AND tc_cmi02='",g_tc_cmi02,"'",
                " AND tc_cmi03='",g_tc_cmi03,"' AND tc_cmi04='",g_tc_cmi04,"' ",
                " AND tc_cmi00='",g_tc_cmi00,"' "                             #No.FUN-9B0118

     PREPARE t212_copy  FROM l_sql
     DECLARE t212_cur5 CURSOR FOR t212_copy
     LET l_sql =" SELECT COUNT(*)  FROM tc_cmi_file ",
                " WHERE tc_cmi01='",g_tc_cmia_new.tc_cmi01,"' AND tc_cmi02='",g_tc_cmia_new.tc_cmi02,"'",
                " AND tc_cmi03='",g_tc_cmia_new.tc_cmi03,"' AND tc_cmi04='",g_tc_cmia_new.tc_cmi04,"' ",
                " AND tc_cmi00='",g_tc_cmia_new.tc_cmi00,"'"                     #No.FUN-9B0118

     PREPARE t212_count1 FROM l_sql
     DECLARE t212_cur6 CURSOR FOR t212_count1
     OPEN t212_cur6
     FETCH t212_cur6 INTO g_cnt
     IF g_cnt > 0 THEN
        IF NOT cl_confirm('axc-096') THEN CLOSE WINDOW t212_w5 RETURN END IF
        IF NOT t212_chk(g_tc_cmia_new.tc_cmi00,g_tc_cmia_new.tc_cmi01,g_tc_cmia_new.tc_cmi02) THEN  #MOD-DB0167 add
           CLOSE WINDOW t212_w5  #MOD-DB0167 add
           RETURN                #MOD-DB0167 add
        END IF                   #MOD-DB0167 add
        DELETE FROM tc_cmi_file WHERE tc_cmi01=g_tc_cmia_new.tc_cmi01    #先delete 再產生
             AND tc_cmi02=g_tc_cmia_new.tc_cmi02 AND tc_cmi03=g_tc_cmia_new.tc_cmi03
             AND tc_cmi04=g_tc_cmia_new.tc_cmi04
             AND tc_cmi00=g_tc_cmia_new.tc_cmi00                      #No.FUN-9B0118
        IF SQLCA.SQLERRD[3] =0 OR STATUS THEN
           CALL cl_err3("del","tc_cmi_file",g_tc_cmia_new.tc_cmi01,g_tc_cmia_new.tc_cmi02,STATUS,"","del tc_cmi",1)  #No.FUN-660127
           CLOSE WINDOW t212_w5
           RETURN
        END IF
     END IF
     MESSAGE "WORKING !"
     FOREACH t212_cur5 INTO l_tc_cmi.*
           LET l_tc_cmi.tc_cmi01=g_tc_cmia_new.tc_cmi01
           LET l_tc_cmi.tc_cmi02=g_tc_cmia_new.tc_cmi02
           LET l_tc_cmi.tc_cmi03=g_tc_cmia_new.tc_cmi03
           LET l_tc_cmi.tc_cmi04=g_tc_cmia_new.tc_cmi04
           LET l_tc_cmi.tc_cmi00=g_tc_cmia_new.tc_cmi00     #No.FUN-9B0118
           LET l_tc_cmi.tc_cmi12=g_tc_cmia_new.tc_cmi12     #No.FUN-9B0118
           LET l_tc_cmi.tc_cmiacti='Y'
           LET l_tc_cmi.tc_cmiuser=g_user
           LET l_tc_cmi.tc_cmigrup=g_grup
           LET l_tc_cmi.tc_cmimodu=''
           LET l_tc_cmi.tc_cmidate=g_today
           LET l_tc_cmi.tc_cmioriu = g_user      #No.FUN-980030 10/01/04
           LET l_tc_cmi.tc_cmiorig = g_grup      #No.FUN-980030 10/01/04
           LET l_tc_cmi.tc_cmilegal = g_legal    #FUN-A50075
           INSERT INTO tc_cmi_file VALUES (l_tc_cmi.* )
     END FOREACH
     MESSAGE ""
     CLOSE WINDOW t212_w5
     #FUN-C80046---begin
     LET g_tc_cmi01=g_tc_cmia_new.tc_cmi01
     LET g_tc_cmi02=g_tc_cmia_new.tc_cmi02
     LET g_tc_cmi03=g_tc_cmia_new.tc_cmi03
     LET g_tc_cmi04=g_tc_cmia_new.tc_cmi04
     LET g_tc_cmi00=g_tc_cmia_new.tc_cmi00
     LET g_tc_cmi12=g_tc_cmia_new.tc_cmi12
     CALL t212_show()
     #FUN-C80046---end
END FUNCTION


FUNCTION t212_g()
  DEFINE l_sql LIKE type_file.chr1000       #No.FUN-680122CHAR(600)
  DEFINE p_row,p_col     LIKE type_file.num5          #No.FUN-680122 SMALLINT
  DEFINE l_tot LIKE aao_file.aao05
  DEFINE l_tc_cmi RECORD LIKE tc_cmi_file.*
  DEFINE l_dbs LIKE azp_file.azp03

   LET p_row = 6 LET p_col = 6

   OPEN WINDOW t212_w4 AT p_row,p_col WITH FORM
         "axc/42f/axct212_g"  ATTRIBUTE (STYLE = g_win_style CLIPPED) #No.FUN-580092 HCN
     CALL cl_ui_locale("axct212_g")
     INITIALIZE g_tc_cmia.* TO NULL
     CONSTRUCT BY NAME g_wc ON
         tc_cmi05,tc_cmi06
              BEFORE CONSTRUCT
                 CALL cl_qbe_init()
        ON IDLE g_idle_seconds
           CALL cl_on_idle()
           CONTINUE CONSTRUCT

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121

      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121

      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121


                 ON ACTION qbe_select
         	   CALL cl_qbe_select()
                 ON ACTION qbe_save
		   CALL cl_qbe_save()
     END CONSTRUCT
     IF INT_FLAG THEN LET INT_FLAG = 0 CLOSE WINDOW t212_w4 RETURN END IF
     INPUT BY NAME g_tc_cmia.tc_cmi01,g_tc_cmia.tc_cmi02,g_tc_cmia.tc_cmi03,g_tc_cmia.tc_cmi00,g_tc_cmia.tc_cmi04   #No.FUN-9B0118
     WITHOUT DEFAULTS
     AFTER FIELD tc_cmi01
        IF NOT cl_null(g_tc_cmia.tc_cmi01) THEN
           IF g_tc_cmia.tc_cmi01 < g_ccz.ccz01 THEN
              CALL cl_err(g_tc_cmia.tc_cmi01,'axc-095',0)
              NEXT FIELD tc_cmi01
           END IF
        END IF
     AFTER FIELD tc_cmi02
        IF NOT cl_null(g_tc_cmia.tc_cmi02) THEN
           IF g_tc_cmia.tc_cmi01 = g_ccz.ccz01 AND g_tc_cmia.tc_cmi02 < g_ccz.ccz02 THEN
              CALL cl_err(g_tc_cmia.tc_cmi02,'axc-095',0)   #No:MOD-9C0025 modify
              NEXT FIELD tc_cmi02    #No:MOD-9C0025 modify
           END IF
        END IF

     AFTER FIELD tc_cmi03
        IF cl_null(g_tc_cmia.tc_cmi03) THEN LET g_tc_cmia.tc_cmi03 = ' ' END IF
        IF NOT cl_null(g_tc_cmia.tc_cmi03) THEN
           IF g_aaz.aaz90='Y' THEN
              IF NOT s_costcenter_chk(g_tc_cmia.tc_cmi03) THEN
                 NEXT FIELD tc_cmi03
              END IF
           ELSE
              CALL t212_tc_cmi03(g_tc_cmia.tc_cmi03)
              IF NOT cl_null(g_errno) THEN
                 CALL cl_err(g_tc_cmia.tc_cmi03,g_errno,0)
                 NEXT FIELD tc_cmi03
              END IF
           END IF
        END IF

       AFTER FIELD tc_cmi00    #帐套
           IF NOT cl_null(g_tc_cmia.tc_cmi00) THEN
              CALL t212_tc_cmi00('a',g_tc_cmia.tc_cmi00)
              IF NOT cl_null(g_errno) THEN
                 CALL cl_err(g_tc_cmia.tc_cmi00,g_errno,0)
                 NEXT FIELD tc_cmi00
              END IF
           END IF

        ON IDLE g_idle_seconds
           CALL cl_on_idle()
           CONTINUE INPUT

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121

      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121

      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121


     END INPUT
     IF INT_FLAG THEN LET INT_FLAG = 0 CLOSE WINDOW t212_w4  RETURN END IF
     SELECT ccz12 INTO l_ccz12 FROM ccz_file   #No.TQC-970398 mod

     LET l_sql =" SELECT * FROM tc_cmi_file ",
                " WHERE  tc_cmi01='",g_tc_cmia.tc_cmi01,"'",
                " AND    tc_cmi02='",g_tc_cmia.tc_cmi02,"'",
                " AND    tc_cmi03='",g_tc_cmia.tc_cmi03,"'",
                " AND    tc_cmi00='",g_tc_cmia.tc_cmi00,"'",      #No.FUN-9B0118
                " AND    tc_cmi04='",g_tc_cmia.tc_cmi04,"' AND ", g_wc
     PREPARE t212_g2 FROM l_sql
     DECLARE t212_cur4 CURSOR FOR t212_g2
     MESSAGE "WORKING !"
     BEGIN WORK
     LET g_success='Y'
     CALL s_showmsg_init()   #No.FUN-710027
     FOREACH t212_cur4 INTO l_tc_cmi.*
        IF g_success='N' THEN
           LET g_totsuccess='N'
           LET g_success="Y"
        END IF

       #取參數設定ccz11,ccz12總帳所在工廠編號,帳別
        #SELECT azp03 INTO l_dbs FROM azp_file where azp01=g_ccz.ccz11 #FUN-A50102
        #LET l_dbs = s_dbstring(l_dbs)                                 #FUN-A50102
        #LET l_dbs=s_dbstring(l_dbs CLIPPED) #TQC-940184               #FUN-A50102
        #LET l_sql =" SELECT aag06 FROM ",l_dbs CLIPPED,"aag_file",    #FUN-A50102
        LET l_sql =" SELECT aag06 FROM ",cl_get_target_table(g_ccz.ccz11,'aag_file'),  #FUN-A50102
                   "  WHERE aag01='",l_tc_cmi.tc_cmi05,"'   ",
                   "    AND aag00='",l_tc_cmi.tc_cmi00,"'"       #No.FUN-9B0118
 	    CALL cl_replace_sqldb(l_sql) RETURNING l_sql        #FUN-920032
        CALL cl_parse_qry_sql(l_sql,g_ccz.ccz11) RETURNING l_sql #FUN-A50102
        PREPARE t212_aag_pre FROM l_sql
        DECLARE t212_aag_cur CURSOR FOR t212_aag_pre
        OPEN t212_aag_cur
        FETCH t212_aag_cur INTO l_aag06

        SELECT ccz12 INTO l_ccz12 FROM ccz_file   #得帳別
        #LET l_sql =" SELECT aao05,aao06 FROM ",l_dbs CLIPPED, "aao_file",
        LET l_sql =" SELECT aao05,aao06 FROM ",cl_get_target_table(g_ccz.ccz11,'aao_file'),  #FUN-A50102
                   " WHERE aao00='",l_tc_cmi.tc_cmi00,"' ",       #No.FUN-9B0118
                   "  AND aao01='",l_tc_cmi.tc_cmi05,"' ",
                   "  AND aao02='",l_tc_cmi.tc_cmi06,"' ",
                   "  AND aao03='",l_tc_cmi.tc_cmi01,"' ",
                   "  AND aao04='",l_tc_cmi.tc_cmi02,"' "       #取借貸方餘額
        LET l_aao05 = 0 #MOD-610146
        LET l_aao06 = 0 #MOD-610146
 	    CALL cl_replace_sqldb(l_sql) RETURNING l_sql        #FUN-920032
        CALL cl_parse_qry_sql(l_sql,g_ccz.ccz11) RETURNING l_sql #FUN-A50102
        PREPARE t212_aao_pre FROM l_sql
        DECLARE t212_aao_cur CURSOR FOR t212_aao_pre
        OPEN t212_aao_cur
        FETCH t212_aao_cur INTO l_aao05,l_aao06


        IF cl_null(l_aao05) THEN LET l_aao05 = 0 END IF
        IF cl_null(l_aao06) THEN LET l_aao06 = 0 END IF
        IF l_aag06='1' THEN           #正常餘額為借餘時
           LET l_tot=l_aao05-l_aao06
        ELSE
           LET l_tot=l_aao06-l_aao05
        END IF
        UPDATE tc_cmi_file SET tc_cmi08=l_tot WHERE
               tc_cmi01=l_tc_cmi.tc_cmi01 AND
               tc_cmi02=l_tc_cmi.tc_cmi02 AND
               tc_cmi03=l_tc_cmi.tc_cmi03 AND
               tc_cmi04=l_tc_cmi.tc_cmi04 AND
               tc_cmi00=l_tc_cmi.tc_cmi00 AND     #No.FUN-9B0118
               tc_cmi05=l_tc_cmi.tc_cmi05 AND
               tc_cmi06=l_tc_cmi.tc_cmi06 AND
               #FUN-D80058--add--str--
               tc_cmi13 = l_tc_cmi.tc_cmi13 AND
               tc_cmi15 = l_tc_cmi.tc_cmi15 AND
               tc_cmi17 = l_tc_cmi.tc_cmi16 AND
               tc_cmi19 = l_tc_cmi.tc_cmi19 AND
               tc_cmi21 = l_tc_cmi.tc_cmi21 AND
               tc_cmi23 = l_tc_cmi.tc_cmi23 AND
               tc_cmi25 = l_tc_cmi.tc_cmi25 AND
               tc_cmi27 = l_tc_cmi.tc_cmi27 AND
               tc_cmi29 = l_tc_cmi.tc_cmi29 AND
               tc_cmi31 = l_tc_cmi.tc_cmi31 AND
               tc_cmi33 = l_tc_cmi.tc_cmi33
               #FUN-D80058--add--end--
        IF STATUS OR sqlca.sqlerrd[3]=0 THEN
           LET g_showmsg=l_tc_cmi.tc_cmi01,"/",l_tc_cmi.tc_cmi02,"/",l_tc_cmi.tc_cmi03,"/",l_tc_cmi.tc_cmi04,"/",l_tc_cmi.tc_cmi05,"/",l_tc_cmi.tc_cmi06         #NO.FUN-710027
           CALL s_errmsg('tc_cmi01,tc_cmi02,tc_cmi03,tc_cmi04,tc_cmi05,tc_cmi06',g_showmsg,'upd tc_cmi08',STATUS,1)                               #NO.FUN-710027
           LET g_success='N'
        END IF
     END FOREACH
     IF g_totsuccess="N" THEN
        LET g_success="N"
     END IF
     CALL s_showmsg()

     IF g_success ='Y' THEN COMMIT WORK
     ELSE
         ROLLBACK WORK
     END IF
     MESSAGE ""
     CLOSE WINDOW t212_w4
END FUNCTION

FUNCTION t212_b_fill(p_wc)              #BODY FILL UP
DEFINE
    p_wc            LIKE type_file.chr1000,       #No.FUN-680122CHAR(310)
    l_flag          LIKE type_file.num5,          #FUN-D80058 add
    l_flag_t        LIKE type_file.num5           #FUN-D80058 add

    LET g_sql =
       "SELECT tc_cmi05,tc_cmi06,tc_cmi07,tc_cmi08,",
       "       tc_cmi10,",   #add renjj160711
       "       tc_cmi36,aag02,tc_cmi37,gem02, ",   #add by dengsy161011
       #FUN-D80058--add--str--
       "       tc_cmi35,tc_cmi13,tc_cmi14,tc_cmi15,",
       "       tc_cmi16,tc_cmi17,tc_cmi18,tc_cmi19,",
       "       tc_cmi20,tc_cmi21,tc_cmi22,tc_cmi23,",
       "       tc_cmi24,tc_cmi25,tc_cmi26,tc_cmi27,",
       "       tc_cmi28,tc_cmi29,tc_cmi30,tc_cmi31,",
       "       tc_cmi32,tc_cmi33,tc_cmi34",
       #FUN-D80058--add--end--
       " FROM tc_cmi_file",
       " left join aag_file on aag01=tc_cmi36 ",  #add by dengsy161011
       " left join gem_file on gem01=tc_cmi37 ",   #add by dengsy161011
       " WHERE tc_cmi01 = '",g_tc_cmi01,"' AND ",
       " tc_cmi02='",g_tc_cmi02,"' AND tc_cmi04='",g_tc_cmi04,"'",
       " AND tc_cmi00 = '",g_tc_cmi00,"'",                  #No.FUN-9B0118
       " AND ",p_wc CLIPPED ,
       " ORDER BY 1"
    PREPARE t212_prepare2 FROM g_sql      #預備一下
    IF SQLCA.SQLCODE THEN
    	CALL cl_err('FILL PREPARE:',SQLCA.SQLCODE,1)
    	RETURN
    END IF
    DECLARE t212_curs1 CURSOR FOR t212_prepare2
    CALL g_tc_cmi.clear()
    LET g_cnt = 1
    LET g_tc_cmi08_tot=0
    LET l_flag_t = 0     #FUN-D80058 add
    FOREACH t212_curs1 INTO g_tc_cmi[g_cnt].*   #單身 ARRAY 填充
        IF SQLCA.sqlcode THEN
            CALL cl_err('B_FILL:',SQLCA.sqlcode,1)
            EXIT FOREACH
        END IF
        #FUN-D80058--add--str--
        LET l_flag = 0
        IF NOT cl_null(g_tc_cmi[g_cnt].tc_cmi13) THEN
           LET l_flag = 1
        END IF
        IF NOT cl_null(g_tc_cmi[g_cnt].tc_cmi15) THEN
           LET l_flag = 2
        END IF
        IF NOT cl_null(g_tc_cmi[g_cnt].tc_cmi17) THEN
           LET l_flag = 3
        END IF
        IF NOT cl_null(g_tc_cmi[g_cnt].tc_cmi19) THEN
           LET l_flag = 4
        END IF
        IF NOT cl_null(g_tc_cmi[g_cnt].tc_cmi21) THEN
           LET l_flag = 5
        END IF
        IF NOT cl_null(g_tc_cmi[g_cnt].tc_cmi23) THEN
           LET l_flag = 6
        END IF
        IF NOT cl_null(g_tc_cmi[g_cnt].tc_cmi25) THEN
           LET l_flag = 7
        END IF
        IF NOT cl_null(g_tc_cmi[g_cnt].tc_cmi27) THEN
           LET l_flag = 8
        END IF
        IF NOT cl_null(g_tc_cmi[g_cnt].tc_cmi29) THEN
           LET l_flag = 9
        END IF
        IF NOT cl_null(g_tc_cmi[g_cnt].tc_cmi31) THEN
           LET l_flag = 10
        END IF
        IF NOT cl_null(g_tc_cmi[g_cnt].tc_cmi33) THEN
           LET l_flag = 11
        END IF
        IF l_flag >= l_flag_t THEN
           LET l_flag_t = l_flag
        END IF
        #FUN-D80058--add--end--
        LET g_tc_cmi08_tot=g_tc_cmi08_tot+g_tc_cmi[g_cnt].tc_cmi10
        LET g_cnt = g_cnt + 1
        IF g_cnt > g_max_rec THEN
           CALL cl_err( '', 9035, 0 )
           EXIT FOREACH
        END IF
    END FOREACH
    CALL t212_visible(l_flag_t)    #FUN-D80058 add
    CALL g_tc_cmi.deleteElement(g_cnt)
    MESSAGE ""
    DISPLAY g_tc_cmi08_tot TO FORMONLY.cmi08_tot
    LET g_rec_b=g_cnt-1
    DISPLAY g_rec_b TO FORMONLY.cn2
    LET g_cnt = 0
END FUNCTION

FUNCTION t212_bp(p_ud)
   DEFINE   p_ud   LIKE type_file.chr1          #No.FUN-680122 VARCHAR(1)


   IF p_ud <> "G" OR g_action_choice = "detail" THEN
      RETURN
   END IF

   LET g_action_choice = " "

   CALL cl_set_act_visible("accept,cancel", FALSE)
   CALL cl_set_act_visible("generate,retrieve,access_current_period_overhe", g_aza.aza26 <>'2')  #FUN-AA0025
   DISPLAY ARRAY g_tc_cmi TO s_tc_cmi.* ATTRIBUTE(COUNT=g_rec_b,UNBUFFERED)

      BEFORE DISPLAY
         CALL cl_navigator_setting( g_curs_index, g_row_count )

      BEFORE ROW
         LET l_ac = ARR_CURR()
      CALL cl_show_fld_cont()                   #No.FUN-550037 hmf

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
      ON ACTION first
         CALL t212_fetch('F')
         CALL cl_navigator_setting(g_curs_index, g_row_count)   ###add in 040517
           IF g_rec_b != 0 THEN
         CALL fgl_set_arr_curr(1)  ######add in 040505
           END IF
           ACCEPT DISPLAY                   #No.FUN-530067 HCN TEST


      ON ACTION previous
         CALL t212_fetch('P')
         CALL cl_navigator_setting(g_curs_index, g_row_count)   ###add in 040517
           IF g_rec_b != 0 THEN
         CALL fgl_set_arr_curr(1)  ######add in 040505
           END IF
	ACCEPT DISPLAY                   #No.FUN-530067 HCN TEST


      ON ACTION jump
         CALL t212_fetch('/')
         CALL cl_navigator_setting(g_curs_index, g_row_count)   ###add in 040517
           IF g_rec_b != 0 THEN
         CALL fgl_set_arr_curr(1)  ######add in 040505
           END IF
	ACCEPT DISPLAY                   #No.FUN-530067 HCN TEST


      ON ACTION next
         CALL t212_fetch('N')
         CALL cl_navigator_setting(g_curs_index, g_row_count)   ###add in 040517
           IF g_rec_b != 0 THEN
         CALL fgl_set_arr_curr(1)  ######add in 040505
           END IF
	ACCEPT DISPLAY                   #No.FUN-530067 HCN TEST


      ON ACTION last
         CALL t212_fetch('L')
         CALL cl_navigator_setting(g_curs_index, g_row_count)   ###add in 040517
           IF g_rec_b != 0 THEN
         CALL fgl_set_arr_curr(1)  ######add in 040505
           END IF
	ACCEPT DISPLAY                   #No.FUN-530067 HCN TEST


      ON ACTION reproduce
         LET g_action_choice="reproduce"
         EXIT DISPLAY
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

      ON ACTION controls                          #No.FUN-6A0092
         CALL cl_set_head_visible("","AUTO")      #No.FUN-6A0092

      ON ACTION locale
         CALL cl_dynamic_locale()
          CALL cl_show_fld_cont()                   #No.FUN-550037 hmf

      ON ACTION exit
         LET g_action_choice="exit"
         EXIT DISPLAY

      ##########################################################################
      # Special 4ad ACTION
      ##########################################################################
      ON ACTION controlg
         LET g_action_choice="controlg"
         EXIT DISPLAY

      #@ON ACTION 產生
      ON ACTION generate
         LET g_action_choice="generate"
         EXIT DISPLAY
      #@ON ACTION 截取
      ON ACTION retrieve
         LET g_action_choice="retrieve"
         EXIT DISPLAY

      ON ACTION by_cost
         LET g_action_choice="by_cost"
         EXIT DISPLAY

      ON ACTION time
         LET g_action_choice="time"
         EXIT DISPLAY

#      #@ON ACTION 擷取當期費用成本
#      ON ACTION access_current_period_overhe
#         LET g_action_choice="access_current_period_overhe"
#         EXIT DISPLAY
#     #TQC-D40043---add---start--依分攤設置產生人工制費
#      ON ACTION produce_manmade_cost
#         LET g_action_choice="produce_manmade_cost"
#         EXIT DISPLAY
     #TQC-D40043---add---END--
#      ON ACTION by_setting
#         LET g_action_choice="by_setting"
#         EXIT DISPLAY

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

      ON ACTION exporttoexcel #FUN-4B0015
         LET g_action_choice = 'exporttoexcel'
         EXIT DISPLAY

      ON ACTION related_document                #No.FUN-6A0019  相關文件
         LET g_action_choice="related_document"
         EXIT DISPLAY

     #str-------- add by dengsy161011
     ON ACTION gen_entry
            LET g_action_choice="gen_entry"
            EXIT DISPLAY

     ON ACTION entry_sheet
         LET g_action_choice="entry_sheet"
         EXIT DISPLAY

     ON ACTION carry_voucher
         LET g_action_choice="carry_voucher"
         EXIT DISPLAY

     ON ACTION undo_carry_voucher
         LET g_action_choice="undo_carry_voucher"
         EXIT DISPLAY
     ON ACTION voucher_qry
        LET g_action_choice="voucher_qry"
        EXIT DISPLAY
     #end-------- add by dengsy161011

      AFTER DISPLAY
         CONTINUE DISPLAY

      &include "qry_string.4gl"

   END DISPLAY
   CALL cl_set_act_visible("accept,cancel", TRUE)
END FUNCTION


FUNCTION t212_r()

DEFINE  l_cnt  LIKE type_file.num5
    IF g_tc_cmi01 IS NULL THEN
       CALL cl_err("",-400,0)      #No.FUN-6A0019
       RETURN
    END IF

    IF g_tc_cmi09 IS NOT NULL THEN
        SELECT nppglno INTO g_nppglno FROM npp_file WHERE npp01 = g_tc_cmi09 AND nppsys ='CA' AND npp00 =8 AND npp011 =1
        IF g_nppglno IS NOT NULL THEN
           CALL cl_err('','cxc-001',0)
            RETURN
        END IF
    END IF
    IF NOT t212_chk(g_tc_cmi00,g_tc_cmi01,g_tc_cmi02) THEN RETURN END IF #MOD-DB0167 add

    IF cl_delh(0,0) THEN                   #確認一下
        INITIALIZE g_doc.* TO NULL           #No.FUN-9B0098 10/02/24
        LET g_doc.column1 = "tc_cmi01"          #No.FUN-9B0098 10/02/24
        LET g_doc.column2 = "tc_cmi02"          #No.FUN-9B0098 10/02/24
        LET g_doc.column3 = "tc_cmi03"          #No.FUN-9B0098 10/02/24
        LET g_doc.column4 = "tc_cmi04"          #No.FUN-9B0098 10/02/24
        LET g_doc.column5 = "tc_cmi00"          #No.FUN-9B0098 10/02/24
        LET g_doc.value1 = g_tc_cmi01           #No.FUN-9B0098 10/02/24
        LET g_doc.value2 = g_tc_cmi02           #No.FUN-9B0098 10/02/24
        LET g_doc.value3 = g_tc_cmi03           #No.FUN-9B0098 10/02/24
        LET g_doc.value4 = g_tc_cmi04           #No.FUN-9B0098 10/02/24
        LET g_doc.value5 = g_tc_cmi00           #No.FUN-9B0098 10/02/24
        CALL cl_del_doc()                #No.FUN-9B0098 10/02/24
        DELETE FROM tc_cmi_file WHERE tc_cmi01 = g_tc_cmi01
                               AND tc_cmi02=  g_tc_cmi02
                               AND tc_cmi00 = g_tc_cmi00        #No.FUN-9B0118

        IF SQLCA.sqlcode THEN
            CALL cl_err3("del","tc_cmi_file",g_tc_cmi01,g_tc_cmi02,SQLCA.sqlcode,"","BODY DELETE:",1)  #No.FUN-660127
        ELSE
            CLEAR FORM
            CALL g_tc_cmi.clear()  #add by dengsy161012
              LET l_cnt = 0
             SELECT COUNT(*) INTO l_cnt FROM npp_file
               WHERE npp01 = g_tc_cmi09
                 AND nppsys= 'CA'
                 AND npp00 = 8
                 AND npp011= 1
              IF l_cnt > 0 THEN
                 DELETE FROM npp_file
                  WHERE npp01 = g_tc_cmi09
                    AND nppsys= 'CA'
                    AND npp00 = 8
                     AND npp011= 1
              IF SQLCA.sqlcode OR SQLCA.sqlerrd[3] = 0 THEN   #CHI-850023
                   CALL cl_err3("del","npp_file",g_tc_cmi09,"",SQLCA.sqlcode,"","del npp.",1)  #No.FUN-660122
                   ROLLBACK WORK
                   RETURN
               END IF
             END IF   #MOD-870048 add
              LET l_cnt = 0
                SELECT COUNT(*) INTO l_cnt FROM npq_file
                 WHERE npq01 = g_tc_cmi09
                  AND npqsys= 'CA'
                  AND npq00 = 8
                  AND npq011= 1
              IF l_cnt > 0 THEN
                 DELETE FROM npq_file
                    WHERE npq01 = g_tc_cmi09
                     AND npqsys= 'CA'
                     AND npq00 = 8
                      AND npq011= 1
                 IF SQLCA.sqlcode OR SQLCA.sqlerrd[3] = 0 THEN   #CHI-850023
                    CALL cl_err3("del","npq_file",g_tc_cmi09,"",SQLCA.sqlcode,"","del npq.",1)  #No.FUN-660122
                     ROLLBACK WORK
                     RETURN
                 END IF
              END IF

            LET g_cnt=SQLCA.SQLERRD[3]
            MESSAGE 'Remove (',g_cnt USING '####&',') Row(s)'
            DROP TABLE x
            PREPARE t212_precount_x2 FROM g_sql_tmp  #No.TQC-720019
            EXECUTE t212_precount_x2                 #No.TQC-720019
            OPEN t212_cnt
            #FUN-B50064-add-start--
            IF STATUS THEN
               CLOSE t212_b_cs
               CLOSE t212_count
               COMMIT WORK
               RETURN
            END IF
            #FUN-B50064-add-end--
            FETCH t212_cnt INTO g_row_count
            #FUN-B50064-add-start--
            IF STATUS OR (cl_null(g_row_count) OR  g_row_count = 0 ) THEN
               CLOSE t212_b_cs
               CLOSE t212_count
               COMMIT WORK
               RETURN
            END IF
            #FUN-B50064-add-end--
            DISPLAY g_row_count TO FORMONLY.cnt
            OPEN t212_b_cs
            IF g_curs_index = g_row_count + 1 THEN
               LET g_jump = g_row_count
               CALL t212_fetch('L')
            ELSE
               LET g_jump = g_curs_index
               LET mi_no_ask = TRUE
               CALL t212_fetch('/')
            END IF
        END IF
    END IF
END FUNCTION


FUNCTION t212_out()
DEFINE
    l_i             LIKE type_file.num5,          #No.FUN-680122 SMALLINT
    sr              RECORD                        #No.TQC-970203
         tc_cmi01      LIKE tc_cmi_file.tc_cmi01,          #No.TQC-970203
         tc_cmi02      LIKE tc_cmi_file.tc_cmi02,          #No.TQC-970203
         tc_cmi03      LIKE tc_cmi_file.tc_cmi03,          #No.TQC-970203
         tc_cmi04      LIKE tc_cmi_file.tc_cmi04,          #No.TQC-970203
         tc_cmi05      LIKE tc_cmi_file.tc_cmi05,          #No.TQC-970203
         tc_cmi06      LIKE tc_cmi_file.tc_cmi06,          #No.TQC-970203
         tc_cmi07      LIKE tc_cmi_file.tc_cmi07,          #No.TQC-970203
         tc_cmi08      LIKE tc_cmi_file.tc_cmi08           #No.TQC-970203
       END RECORD,                                #No.TQC-970203
    l_za05          LIKE za_file.za05,
    l_name          LIKE type_file.chr20          #No.FUN-680122 VARCHAR(20)              #External(Disk) file name

DEFINE l_cmd        STRING                        #No.FUN-9B0118
DEFINE l_wc         STRING                        #No.FUN-9B0118

    LET l_wc  = g_wc
    IF cl_null(g_wc) AND NOT cl_null(g_tc_cmia.tc_cmi04)
                     AND NOT cl_null(g_tc_cmia.tc_cmi00)
                     AND NOT cl_null(g_tc_cmia.tc_cmi01)
                     AND NOT cl_null(g_tc_cmia.tc_cmi02)
                     AND NOT cl_null(g_tc_cmia.tc_cmi03) THEN
       LET g_wc="     tc_cmi04 = '",g_tc_cmia.tc_cmi04,"'",
                " AND tc_cmi00 = '",g_tc_cmia.tc_cmi00,"'",
                " AND tc_cmi01 = '",g_tc_cmia.tc_cmi01,"'",
                " AND tc_cmi02 = '",g_tc_cmia.tc_cmi02,"'",
                " AND tc_cmi03 = '",g_tc_cmia.tc_cmi03,"'"
    END IF
    IF cl_null(g_wc) THEN
       CALL cl_err('','9057',0)
       RETURN
    END IF
    LET l_cmd = 'p_query "axct212" "',g_wc CLIPPED,'"'
    CALL cl_cmdrun(l_cmd)
    LET g_wc  = l_wc


END FUNCTION


FUNCTION t212_tc_cmi03(p_tc_cmi03)
DEFINE p_tc_cmi03         LIKE gem_file.gem01
DEFINE l_gemacti       LIKE gem_file.gemacti

    LET g_errno = ''
    SELECT gemacti  INTO l_gemacti FROM gem_file
     WHERE gem01 = p_tc_cmi03

    CASE WHEN SQLCA.SQLCODE = 100  LET g_errno = 'mfg1318'
                                   LET l_gemacti = NULL
         WHEN l_gemacti='N'        LET g_errno = '9028'
         OTHERWISE                 LET g_errno = SQLCA.SQLCODE USING '-------'
    END CASE

END FUNCTION

FUNCTION t212_tc_cmi00(p_cmd,p_tc_cmi00)
   DEFINE p_cmd           LIKE type_file.chr1
   DEFINE p_tc_cmi00         LIKE tc_cmi_file.tc_cmi00
   DEFINE l_aaaacti       LIKE aaa_file.aaaacti

   LET g_errno = ' '

   SELECT aaaacti INTO l_aaaacti
     FROM aaa_file
    WHERE aaa01 = p_tc_cmi00

   CASE WHEN SQLCA.SQLCODE=100   LET g_errno = 'agl-095'
        WHEN l_aaaacti = 'N'     LET g_errno = '9028'
        OTHERWISE                LET g_errno = SQLCA.sqlcode USING '----------'
   END CASE

END FUNCTION

FUNCTION t212_aeh()
   DEFINE l_tc_cmi           RECORD LIKE tc_cmi_file.*
   DEFINE l_aeh              RECORD LIKE aeh_file.*
   DEFINE g_wc            STRING
   DEFINE l_sql           STRING
   DEFINE l_aeh11         LIKE aeh_file.aeh11
   DEFINE l_aeh12         LIKE aeh_file.aeh12
   DEFINE l_sum           LIKE aah_file.aah04
   DEFINE l_aag05         LIKE aag_file.aag05
   DEFINE l_aag06         LIKE aag_file.aag06
   DEFINE p_row,p_col     LIKE type_file.num5
   DEFINE l_rate          LIKE abb_file.abb25    #No.FUN-9C0112
#No.MOD-D20129 --begin
   DEFINE l_tc_cmi03	LIKE tc_cmi_file.tc_cmi03
   DEFINE l_tc_cmi05	LIKE tc_cmi_file.tc_cmi05
   DEFINE l_tc_cmi06	LIKE tc_cmi_file.tc_cmi06
   DEFINE l_tc_cmi08	LIKE tc_cmi_file.tc_cmi08

#No.MOD-D20129 --end
   #FUN-D80058--add--str--
   DEFINE l_aeh03         LIKE aeh_file.aeh03
   DEFINE l_aeh04         LIKE aeh_file.aeh04
   DEFINE l_aeh05         LIKE aeh_file.aeh05
   DEFINE l_aeh06         LIKE aeh_file.aeh06
   DEFINE l_aeh07         LIKE aeh_file.aeh07
   DEFINE l_aeh31         LIKE aeh_file.aeh31
   DEFINE l_aeh32         LIKE aeh_file.aeh32
   DEFINE l_aeh33         LIKE aeh_file.aeh33
   DEFINE l_aeh34         LIKE aeh_file.aeh34
   DEFINE l_aeh35         LIKE aeh_file.aeh35
   DEFINE l_aeh36         LIKE aeh_file.aeh36
   DEFINE l_aeh37         LIKE aeh_file.aeh37
   DEFINE l_tc_cmi13         LIKE tc_cmi_file.tc_cmi13
   DEFINE l_tc_cmi15         LIKE tc_cmi_file.tc_cmi15
   DEFINE l_tc_cmi17         LIKE tc_cmi_file.tc_cmi17
   DEFINE l_tc_cmi19         LIKE tc_cmi_file.tc_cmi19
   DEFINE l_tc_cmi21         LIKE tc_cmi_file.tc_cmi21
   DEFINE l_tc_cmi23         LIKE tc_cmi_file.tc_cmi23
   DEFINE l_tc_cmi25         LIKE tc_cmi_file.tc_cmi25
   DEFINE l_tc_cmi27         LIKE tc_cmi_file.tc_cmi27
   DEFINE l_tc_cmi29         LIKE tc_cmi_file.tc_cmi29
   DEFINE l_tc_cmi31         LIKE tc_cmi_file.tc_cmi31
   DEFINE l_tc_cmi33         LIKE tc_cmi_file.tc_cmi33
   DEFINE l_tc_cmi35         LIKE tc_cmi_file.tc_cmi35
   #FUN-D80058--add--end--
   DEFINE l_tc_cmi09         LIKE tc_cmi_file.tc_cmi09
   DEFINE l_aeh01           LIKE aeh_file.aeh01,  #add by dengsy161012
          l_aag02           LIKE aag_file.aag02  #add by dengsy161012
   LET p_row = 6 LET p_col = 6

   OPEN WINDOW t212a_w AT p_row,p_col WITH FORM "cxc/42f/cxct212a"
        ATTRIBUTE (STYLE = g_win_style CLIPPED)
   CALL cl_ui_locale("cxct212a")
   INITIALIZE l_tc_cmi.* TO NULL
   LET g_wc=NULL
    CALL cl_set_comp_visible("aeh01",TRUE)
   INPUT BY NAME l_tc_cmi.tc_cmi01,l_tc_cmi.tc_cmi02,l_tc_cmi.tc_cmi00
                 WITHOUT DEFAULTS

     #No.MOD-D20052  --Begin
     BEFORE INPUT
        LET g_before_input_done = FALSE
        LET l_tc_cmi.tc_cmi01 = g_ccz.ccz01
        LET l_tc_cmi.tc_cmi02 = g_ccz.ccz02
        LET l_tc_cmi.tc_cmi00 = g_ccz.ccz12
        DISPLAY BY NAME l_tc_cmi.tc_cmi01,l_tc_cmi.tc_cmi02,l_tc_cmi.tc_cmi00
     #No.MOD-D20052  --End

      AFTER FIELD tc_cmi01
         IF NOT cl_null(l_tc_cmi.tc_cmi01) THEN
            IF l_tc_cmi.tc_cmi01 < g_ccz.ccz01 THEN
               CALL cl_err(l_tc_cmi.tc_cmi01,'axc-095',0)
               NEXT FIELD tc_cmi01
            END IF
         END IF
      AFTER FIELD tc_cmi02
         IF NOT cl_null(l_tc_cmi.tc_cmi02) THEN
            IF l_tc_cmi.tc_cmi01 = g_ccz.ccz01 AND l_tc_cmi.tc_cmi02 < g_ccz.ccz02 THEN
              CALL cl_err(l_tc_cmi.tc_cmi02,'axc-095',0)     #No:MOD-9C0025 modify
              NEXT FIELD tc_cmi02   #No:MOD-9C0025 modify
            END IF
         END IF

      AFTER FIELD tc_cmi00
         IF NOT cl_null(l_tc_cmi.tc_cmi00) THEN
            CALL t212_tc_cmi00('a',l_tc_cmi.tc_cmi00)
            IF NOT cl_null(g_errno) THEN
               CALL cl_err(l_tc_cmi.tc_cmi00,g_errno,0)
               NEXT FIELD tc_cmi00
            END IF
         END IF

     AFTER INPUT

          LET l_nppglno=NULL
          LET l_tc_cmi09=NULL
          SELECT DISTINCT tc_cmi09 INTO l_tc_cmi09 FROM tc_cmi_file
              WHERE tc_cmi01= l_tc_cmi.tc_cmi01
              AND tc_cmi02= l_tc_cmi.tc_cmi02
               AND tc_cmi00= l_tc_cmi.tc_cmi00

          IF NOT cl_null(l_tc_cmi09) THEN
              SELECT nppglno INTO l_nppglno FROM npp_file
                  WHERE npp01 = l_tc_cmi09 AND nppsys ='CA' AND npp00 =8 AND npp011 =1
             IF NOT cl_null(l_nppglno) THEN
               CALL cl_err('','cxc-001',0)
                NEXT FIELD tc_cmi01
             END IF
          END IF

       ON ACTION exit              #加離開功能genero
          LET INT_FLAG = 1
          EXIT INPUT

        ON ACTION cancel
          LET INT_FLAG = 1
          EXIT INPUT

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121

      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121

      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121

   END INPUT
   IF INT_FLAG THEN LET INT_FLAG = 0 CLOSE WINDOW t212a_w RETURN END IF

   CONSTRUCT BY NAME g_wc ON aeh01

         #str------ add by dengsy161012
         AFTER FIELD aeh01
           LET l_aeh01=GET_FLDBUF(aeh01)
           IF NOT cl_null(l_aeh01) THEN
             LET l_aag02=NULL
             LET l_aag05=NULL
             SELECT aag02,aag05 INTO l_aag02,l_aag05  #FUN-8C0089 add aag05,l_aag05 #TQC-790124
               FROM aag_file
              WHERE aag01=l_aeh01
                AND aag00=l_tc_cmi.tc_cmi00      #No.FUN-730073
                AND aag07 IN ('2','3')   #MOD-920035 add
                AND aag03 IN ('2')       #TQC-B10053 add
                AND aagacti = 'Y'        #MOD-CA0155 add
             IF STATUS THEN
                #CALL cl_err3("sel","aag_file",l_aeh01,"",STATUS,"","select aag",0)
                CALL cl_init_qry_var()
                LET g_qryparam.form = "q_aag"
                LET g_qryparam.construct = 'N'
                LET g_qryparam.default1 = l_aeh01
                LET g_qryparam.arg1= l_tc_cmi.tc_cmi00
                LET g_qryparam.where = " aag07 IN ('2','3') AND aag03 IN ('2') AND aagacti = 'Y' AND aag01 LIKE '",l_aeh01 CLIPPED,"%'"
                CALL cl_create_qry() RETURNING l_aeh01
                DISPLAY l_aeh01 TO FORMONLY.aeh01
                NEXT FIELD aeh01
             END IF
        END IF
         #end------ add by dengsy161012

         ON IDLE g_idle_seconds
            CALL cl_on_idle()
            CONTINUE CONSTRUCT

         ON ACTION about
            CALL cl_about()

         ON ACTION help
            CALL cl_show_help()

         ON ACTION controlg      #MOD-4C0121
            CALL cl_cmdask()     #MOD-4C0121

#         ON ACTION locale          #genero
#            LET g_change_lang = TRUE
#            EXIT CONSTRUCT

         ON ACTION exit              #加離開功能genero
              LET INT_FLAG = 1
              EXIT CONSTRUCT

          ON ACTION cancel
             LET INT_FLAG = 1
             EXIT CONSTRUCT

         ON ACTION CONTROLP
            CASE
              WHEN INFIELD(aeh01)  #機構別
                 CALL cl_init_qry_var()
                 LET g_qryparam.form = "cq_aeh01"
                 LET g_qryparam.state = "c"
                 CALL cl_create_qry() RETURNING g_qryparam.multiret
                 DISPLAY g_qryparam.multiret TO aeh01
                 NEXT FIELD aeh01
            END CASE
      END CONSTRUCT

   IF INT_FLAG THEN LET INT_FLAG = 0 CLOSE WINDOW t212a_w RETURN END IF
   IF cl_null( g_wc) THEN LET g_wc="1=1" END IF
   IF NOT t212_chk(l_tc_cmi.tc_cmi00,l_tc_cmi.tc_cmi01,l_tc_cmi.tc_cmi02) THEN  #MOD-DB0167 add
      CLOSE WINDOW t212a_w  #MOD-DB0167 add
      RETURN                #MOD-DB0167 add
   END IF                   #MOD-DB0167 add


#   SELECT DISTINCT tc_cmi09 INTO l_tc_cmi09 FROM tc_cmi_file
#              WHERE tc_cmi01= l_tc_cmi.tc_cmi01
#              AND tc_cmi02= l_tc_cmi.tc_cmi02
#               AND tc_cmi00= l_tc_cmi.tc_cmi00

   DELETE FROM tc_cmi_file
    WHERE tc_cmi01= l_tc_cmi.tc_cmi01
      AND tc_cmi02= l_tc_cmi.tc_cmi02
      AND tc_cmi00= l_tc_cmi.tc_cmi00

   IF NOT cl_null(l_tc_cmi09) THEN
    DELETE FROM npp_file
     WHERE npp01 = l_nppglno
            AND nppsys= 'CA'
            AND npp00 = 8
            AND npp011= 1

   DELETE FROM npq_file
          WHERE npq01 = l_nppglno
            AND npqsys= 'CA'
            AND npq00 = 8
            AND npq011= 1
   END IF
    INITIALIZE l_aeh.* TO NULL
    LET l_sum=0

   BEGIN WORK
   LET g_success = 'Y'    #No.MOD-D20129
   LET l_sql=" select aeh01,aeh02,aeh09,aeh10,sum(aeh11-aeh12) from aeh_file ",
             " WHERE aeh00= '",l_tc_cmi.tc_cmi00,"'",
             " AND aeh09= '",l_tc_cmi.tc_cmi01,"'",
             " AND aeh10= '",l_tc_cmi.tc_cmi02,"'",
             " AND ",g_wc CLIPPED,
             " GROUP BY aeh00,aeh01,aeh02,aeh09,aeh10 "

   PREPARE sel_aeh_pre FROM l_sql
   DECLARE sel_aeh_cs CURSOR FOR sel_aeh_pre

     LET l_tc_cmi.tc_cmi03 =  0 #工时
     LET l_tc_cmi.tc_cmi10 =  0
     LET l_tc_cmi.tc_cmiacti='Y'
     LET l_tc_cmi.tc_cmiuser= g_user
     LET l_tc_cmi.tc_cmigrup= g_grup
     LET l_tc_cmi.tc_cmidate= g_today
     LET l_tc_cmi.tc_cmiorig= g_grup
     LET l_tc_cmi.tc_cmioriu= g_user
     LET l_tc_cmi.tc_cmilegal= g_legal

   FOREACH sel_aeh_cs  INTO l_aeh.aeh01,l_aeh.aeh02,l_aeh.aeh09,l_aeh.aeh10,l_sum
       IF SQLCA.sqlcode THEN
         CALL cl_err('',SQLCA.sqlcode,0)
         ROLLBACK WORK
         LET g_success = 'N'   #No.MOD-D20129
         EXIT FOREACH
      END IF
      IF l_sum=0 THEN
         CONTINUE FOREACH
      END IF

         LET l_aag06= NULL
         LET l_tc_cmi.tc_cmi05 =  l_aeh.aeh01
         LET l_tc_cmi.tc_cmi06 =  l_aeh.aeh02

         SELECT aag02,aag06 INTO l_tc_cmi.tc_cmi07,l_aag06 FROM aag_file WHERE aag00=l_tc_cmi.tc_cmi00 AND aag01=l_tc_cmi.tc_cmi05
         LET l_tc_cmi.tc_cmi08 =l_sum

         LET l_tc_cmi.tc_cmi09 =' '
         LET l_tc_cmi.tc_cmi13 = ' '
         LET l_tc_cmi.tc_cmi15 = ' '
         LET l_tc_cmi.tc_cmi17 = ' '
         LET l_tc_cmi.tc_cmi19 = ' '
         LET l_tc_cmi.tc_cmi21 = ' '
         LET l_tc_cmi.tc_cmi23 = ' '
         LET l_tc_cmi.tc_cmi25 = ' '
         LET l_tc_cmi.tc_cmi27 = ' '
         LET l_tc_cmi.tc_cmi29 = ' '
         LET l_tc_cmi.tc_cmi31 = ' '
         LET l_tc_cmi.tc_cmi33 = ' '



#      IF g_aaz.aaz119 ='Y' THEN
#        CALL t212_get_ahe02(l_tc_cmi.tc_cmi05,l_tc_cmi.tc_cmi13,'aag15','1') RETURNING l_tc_cmi.tc_cmi14
#        CALL t212_get_ahe02(l_tc_cmi.tc_cmi05,l_tc_cmi.tc_cmi15,'aag16','2') RETURNING l_tc_cmi.tc_cmi16
#        CALL t212_get_ahe02(l_tc_cmi.tc_cmi05,l_tc_cmi.tc_cmi17,'aag17','3') RETURNING l_tc_cmi.tc_cmi18
#        CALL t212_get_ahe02(l_tc_cmi.tc_cmi05,l_tc_cmi.tc_cmi19,'aag18','4') RETURNING l_tc_cmi.tc_cmi20
#        CALL t212_get_ahe02(l_tc_cmi.tc_cmi05,l_tc_cmi.tc_cmi21,'aag31','5') RETURNING l_tc_cmi.tc_cmi22
#        CALL t212_get_ahe02(l_tc_cmi.tc_cmi05,l_tc_cmi.tc_cmi23,'aag32','6') RETURNING l_tc_cmi.tc_cmi24
#        CALL t212_get_ahe02(l_tc_cmi.tc_cmi05,l_tc_cmi.tc_cmi25,'aag33','7') RETURNING l_tc_cmi.tc_cmi26
#        CALL t212_get_ahe02(l_tc_cmi.tc_cmi05,l_tc_cmi.tc_cmi27,'aag34','8') RETURNING l_tc_cmi.tc_cmi28
#        CALL t212_get_ahe02(l_tc_cmi.tc_cmi05,l_tc_cmi.tc_cmi29,'aag35','9') RETURNING l_tc_cmi.tc_cmi30
#        CALL t212_get_ahe02(l_tc_cmi.tc_cmi05,l_tc_cmi.tc_cmi31,'aag36','10') RETURNING l_tc_cmi.tc_cmi32
#        CALL t212_get_ahe02(l_tc_cmi.tc_cmi05,l_tc_cmi.tc_cmi33,'aag37','99') RETURNING l_tc_cmi.tc_cmi34
#     END IF
      #FUN-D80058--add--end--
#      LET l_tc_cmi.tc_cmi08 = cl_digcut(l_tc_cmi.tc_cmi08,g_azi04)     #No.MOD-D20129

      #str------ mark by dnegsy161012
      {LET l_tc_cmi.tc_cmi04 = 2
      INSERT INTO tc_cmi_file VALUES (l_tc_cmi.*)
      CASE SQLCA.sqlcode
          WHEN "0"
          WHEN "-239" UPDATE tc_cmi_file SET tc_cmi08=l_sum
                       WHERE tc_cmi01=l_tc_cmi.tc_cmi01 AND tc_cmi02=l_tc_cmi.tc_cmi02
                         AND tc_cmi04=l_tc_cmi.tc_cmi04 AND tc_cmi05=l_tc_cmi.tc_cmi05
                         AND tc_cmi00=l_tc_cmi.tc_cmi00 AND tc_cmi06=l_tc_cmi.tc_cmi06

          OTHERWISE
             CALL cl_err3("ins","tc_cmi_file",l_tc_cmi.tc_cmi01,l_tc_cmi.tc_cmi02,SQLCA.sqlcode,'','',0)
             ROLLBACK WORK
             LET g_success = 'N'   #No.MOD-D20129
             EXIT FOREACH
      END CASE}
      #end------ mark by dnegsy161012

       LET l_tc_cmi.tc_cmi04 = 1
       LET l_tc_cmi.tc_cmi35=' '    #add renjj170106
      INSERT INTO tc_cmi_file VALUES (l_tc_cmi.* )
      CASE SQLCA.sqlcode
          WHEN "0"    CONTINUE FOREACH
          WHEN "-239" UPDATE tc_cmi_file SET tc_cmi08=l_sum
                       WHERE tc_cmi01=l_tc_cmi.tc_cmi01 AND tc_cmi02=l_tc_cmi.tc_cmi02
                         AND tc_cmi04=l_tc_cmi.tc_cmi04 AND tc_cmi05=l_tc_cmi.tc_cmi05
                         AND tc_cmi00=l_tc_cmi.tc_cmi00 AND tc_cmi06=l_tc_cmi.tc_cmi06
          OTHERWISE
             CALL cl_err3("ins","tc_cmi_file",l_tc_cmi.tc_cmi01,l_tc_cmi.tc_cmi02,SQLCA.sqlcode,'','',0)
             ROLLBACK WORK
             LET g_success = 'N'   #No.MOD-D20129
             EXIT FOREACH
      END CASE

   END FOREACH

   IF g_success = 'Y' THEN
      CALL cl_err('','aic-059',1)
      COMMIT WORK
   ELSE
      CALL cl_err('','abm-020',1)
      ROLLBACK WORK
   END IF
#No.MOD-D20129 --end

   CLOSE WINDOW t212a_w
   COMMIT WORK

END FUNCTION

FUNCTION t212_time()
  DEFINE p_row,p_col     LIKE type_file.num5
  DEFINE l_n             LIKE type_file.num5
  DEFINE l_err           STRING
  DEFINE l_sql1          STRING
  DEFINE l_sql2          STRING
  DEFINE l_tc_cmi        RECORD LIKE tc_cmi_file.*
  DEFINE l_tc_cmi00      LIKE tc_cmi_file.tc_cmi00
  DEFINE l_tc_cmi01      LIKE tc_cmi_file.tc_cmi01
  DEFINE l_tc_cmi02      LIKE tc_cmi_file.tc_cmi02
  DEFINE l_tc_cmi03      LIKE tc_cmi_file.tc_cmi03
  DEFINE l_time        LIKE shb_file.shb032
  DEFINE l_time2       LIKE shb_file.shb032
  DEFINE l_cmi09       LIKE tc_cmi_file.tc_cmi09
  DEFINE l_tc_srg10,l_srg10   LIKE srg_file.srg10  #add by dengsy161011
  DEFINE l_tc_srg03           LIKE tc_srg_file.tc_srg03 #add  by dengsy170106
  DEFINE l_tc_cmi08      LIKE tc_cmi_file.tc_cmi08  # add by lixwz 171225
  LET p_row = 6 LET p_col = 6

# OPEN WINDOW t212a_w2 AT p_row,p_col WITH FORM "cxc/42f/axct212a"
#        ATTRIBUTE (STYLE = g_win_style CLIPPED)
#   CALL cl_ui_locale("axct212a")
#   INITIALIZE l_tc_cmi.* TO NULL
#
#    CALL cl_comp_visible("aeh01",FALSE)
#   INPUT BY NAME l_tc_cmi01,l_tc_cmi02,l_tc_cmi00
#                 WITHOUT DEFAULTS
#
#     #No.MOD-D20052  --Begin
#     BEFORE INPUT
#        LET g_before_input_done = FALSE
#        LET l_tc_cmi01 = g_ccz.ccz01
#        LET l_tc_cmi02 = g_ccz.ccz02
#        LET l_tc_cmi00 = g_ccz.ccz12
#        DISPLAY BY NAME l_tc_cmi01,l_tc_cmi02,l_tc_cmi00
#     #No.MOD-D20052  --End
#
#      AFTER FIELD tc_cmi01
#         IF NOT cl_null(l_tc_cmi01) THEN
#            IF l_tc_cmi01 < g_ccz.ccz01 THEN
#               CALL cl_err(l_tc_cmi01,'axc-095',0)
#               NEXT FIELD tc_cmi01
#            END IF
#         END IF
#      AFTER FIELD tc_cmi02
#         IF NOT cl_null(l_tc_cmi02) THEN
#            IF l_tc_cmi01 = g_ccz.ccz01 AND l_tc_cmi02< g_ccz.ccz02 THEN
#              CALL cl_err(l_tc_cmi02,'axc-095',0)     #No:MOD-9C0025 modify
#              NEXT FIELD tc_cmi02   #No:MOD-9C0025 modify
#            END IF
#         END IF
#
#
#
#       ON ACTION exit              #加離開功能genero
#          LET INT_FLAG = 1
#          EXIT INPUT
#
#        ON ACTION cancel
#          LET INT_FLAG = 1
#          EXIT INPUT
#
#      ON ACTION about         #MOD-4C0121
#         CALL cl_about()      #MOD-4C0121
#
#      ON ACTION help          #MOD-4C0121
#         CALL cl_show_help()  #MOD-4C0121
#
#      ON ACTION controlg      #MOD-4C0121
#         CALL cl_cmdask()     #MOD-4C0121
#
#   END INPUT
#   IF INT_FLAG THEN LET INT_FLAG = 0 CLOSE WINDOW t212a_w RETURN END IF

   IF cl_null(g_tc_cmi01) OR cl_null(g_tc_cmi02) OR cl_null(g_tc_cmi00) THEN
      RETURN
   END IF

   SELECT DISTINCT tc_cmi09 INTO l_cmi09    #分录底稿
     FROM tc_cmi_file
    WHERE  tc_cmi00= =g_tc_cmi00 AND tc_cmi01=g_tc_cmi01 AND tc_cmi02= =g_tc_cmi02

   IF NOT cl_null(l_cmi09)  THEN
      SELECT nppglno INTO l_nppglno FROM npp_file WHERE npp01 = g_tc_cmi09 AND nppsys ='CA' AND npp00 = 8 AND npp011 = 1
      IF NOT cl_null(l_nppglno) THEN
         LET l_err = cl_get_feldname("tc_cmi00",g_lang),":",g_tc_cmi00,
                     cl_get_feldname("tc_cmi01",g_lang),":",g_tc_cmi01,
                     cl_get_feldname("tc_cmi02",g_lang),":",g_tc_cmi02
         CALL cl_err(l_err,'cxc-001',1)
         RETURN
    END IF
   END IF

   LET l_n=0
   SELECT COUNT(*) INTO l_n FROM tc_cmi_file WHERE tc_cmi00=g_tc_cmi00
        AND tc_cmi01=g_tc_cmi01 AND tc_cmi02=g_tc_cmi02
   IF cl_null(l_n) OR l_n=0 THEN                                      #无费用
       LET l_err = cl_get_feldname("cmi00",g_lang),":",g_tc_cmi00,
                   cl_get_feldname("cmi01",g_lang),":",g_tc_cmi01,
                   cl_get_feldname("cmi02",g_lang),":",g_tc_cmi02
       CALL cl_err(l_err,'cxc-002',1)
#       CLOSE WINDOW t212a_w2  #MOD-DB0167 add
       RETURN
   END IF

   IF NOT t212_chk(g_tc_cmi00,g_tc_cmi01,g_tc_cmi02) THEN  #MOD-DB0167 add
#      CLOSE WINDOW t212a_w2  #MOD-DB0167 add
      RETURN                #MOD-DB0167 add
   END IF

    BEGIN WORK
    LET g_success = 'Y'    #No.MOD-D20129
    {LET l_time=NULL
    LET l_time2=NULL
    LET l_sql2="SELECT SUM(a) from (",
               " select sum(srg10)  a  FROM srf_file,srg_file ",
               "  WHERE srf01=srg01 and srfconf='Y' ",
               " AND YEAR(srf02)='",g_tc_cmi01,"'",
               " AND MONTH(srf02)='",g_tc_cmi02,"'",
               " union all ",
               " select sum(shb032) a from shb_file ",
               "  WHERE shbconf='Y'  ",
               " AND  YEAR(shb03)='",g_tc_cmi01,"'",
               " AND MONTH(shb03)='",g_tc_cmi02,"')"
     PREPARE sel_tim FROM l_sql2
     EXECUTE sel_tim INTO l_time

     IF l_time IS NULL THEN LET l_time=0 END IF
     LET l_time=l_time/60

      IF NOT cl_null(l_time) THEN
         UPDATE tc_cmi_file SET tc_cmi03=l_time    #生产报工
             WHERE tc_cmi00=g_tc_cmi00
              AND tc_cmi01=g_tc_cmi01
              AND tc_cmi02=g_tc_cmi02
              AND tc_cmi04='2'
      END IF }  #mark by dengsy161011

      SELECT SUM(tc_srg10)  INTO l_time2 FROM tc_srf_file,tc_srg_file
         WHERE tc_srf01=tc_srg01 AND YEAR(tc_srf02)=g_tc_cmi01 AND MONTH(tc_srf02)=g_tc_cmi02
              AND tc_srfconf='Y'
     IF l_time2 IS NULL THEN LET l_time2 =0 END IF
     LET l_time2=l_time2/60
     UPDATE tc_cmi_file SET tc_cmi03=l_time2      #安调报工
             WHERE tc_cmi00=g_tc_cmi00
              AND tc_cmi01=g_tc_cmi01
              AND tc_cmi02=g_tc_cmi02
              AND tc_cmi04='1'
     #COMMIT WORK

      #IF l_time+l_time2 <=0 THEN RETURN END IF  #mark by dengsy161011

       INITIALIZE l_tc_cmi.* TO NULL
      LET l_sql1=" SELECT * from tc_cmi_file ",
                 " WHERE tc_cmi00= '",g_tc_cmi00,"'",
                  " and tc_cmi01='",g_tc_cmi01,"'",
                  " and tc_cmi02='",g_tc_cmi02,"'",
                  " and tc_cmi04='1' "

       PREPARE sel_cmi FROM l_sql1
       DECLARE sel_cmi_cs CURSOR FOR sel_cmi

       FOREACH  sel_cmi_cs  INTO l_tc_cmi.*
         #SELECT SUM(tc_cmi03) INTO l_tc_cmi03 FROM tc_cmi_file WHERE tc_cmi00=g_tc_cmi00
         #  AND tc_cmi01=g_tc_cmi01 AND tc_cmi02=g_tc_cmi02

         #str-------- add by dengsy161011
         LET l_tc_srg10=0
         LET l_srg10=0
         SELECT nvl(sum(tc_srg10),0) INTO l_tc_srg10 FROM tc_srg_file ,tc_srf_file
         WHERE tc_srg11=l_tc_cmi.tc_cmi06 AND tc_srf01=tc_srg01 AND tc_srfconf='Y'
         AND year(tc_srf02)=l_tc_cmi.tc_cmi01 AND month(tc_srf02)=l_tc_cmi.tc_cmi02

         SELECT nvl(sum(srg10),0) INTO l_srg10 FROM srg_file,srf_file  #axct200
         ,eci_file,eca_file
         WHERE srg01=srf01 AND srfconf='Y'  AND eca01=eci03 AND eca03=l_tc_cmi.tc_cmi06
         AND year(srf02)=l_tc_cmi.tc_cmi01 AND month(srf02)=l_tc_cmi.tc_cmi02 AND eci01=srf03

         LET l_tc_cmi03 = l_tc_srg10 + l_srg10
         LET l_tc_cmi.tc_cmi10=(l_tc_srg10/l_tc_cmi03)*l_tc_cmi.tc_cmi08
         #end-------- add by dengsy161011
         #str------- add by dengsy170106
         LET l_count5=0
         SELECT count(DISTINCT tc_srg03) INTO l_count5  FROM tc_srg_file,tc_srf_file
         WHERE tc_srg11=l_tc_cmi.tc_cmi06 AND tc_srf01=tc_srg01 AND tc_srfconf='Y'
         AND year(tc_srf02)=l_tc_cmi.tc_cmi01 AND month(tc_srf02)=l_tc_cmi.tc_cmi02
         IF l_count5<2 THEN
         #end------- add by dengsy170106

         #LET l_tc_cmi.tc_cmi10=(l_tc_cmi.tc_cmi03/l_tc_cmi03)*l_tc_cmi.tc_cmi08   #mark by dengsy161011
         LET l_tc_cmi.tc_cmi10 = cl_digcut(l_tc_cmi.tc_cmi10,g_azi04)

         #add by pulf 171025 begin---------
         select tc_srg03 INTO l_tc_cmi.tc_cmi35 FROM tc_srg_file,tc_srf_file
         WHERE tc_srg11=l_tc_cmi.tc_cmi06 AND tc_srf01=tc_srg01 AND tc_srfconf='Y'
         AND year(tc_srf02)=l_tc_cmi.tc_cmi01 AND month(tc_srf02)=l_tc_cmi.tc_cmi02
         #add by pulf 171024 end-----------

         UPDATE tc_cmi_file SET tc_cmi10=l_tc_cmi.tc_cmi10,      #安调报工
                                tc_cmi35=l_tc_cmi.tc_cmi35       #add by pulf 171025
             WHERE tc_cmi00=g_tc_cmi00
              AND tc_cmi01=g_tc_cmi01
              AND tc_cmi02=g_tc_cmi02
              AND tc_cmi05=l_tc_cmi.tc_cmi05
              AND tc_cmi06=l_tc_cmi.tc_cmi06
              AND tc_cmi04='1'
         #str------ add by dengsy170106
         ELSE
           DELETE FROM tc_cmi_file
           WHERE tc_cmi00=g_tc_cmi00
              AND tc_cmi01=g_tc_cmi01
              AND tc_cmi02=g_tc_cmi02
              AND tc_cmi05=l_tc_cmi.tc_cmi05
              AND tc_cmi06=l_tc_cmi.tc_cmi06
              AND tc_cmi04='1'
           LET l_sql1=" select tc_srg03,nvl(sum(tc_srg10),0) from tc_srg_file ",
                      " ,tc_srf_file  ",
                      " WHERE tc_srg11='",l_tc_cmi.tc_cmi06,"' AND tc_srf01=tc_srg01 AND tc_srfconf='Y'  ",
                      " AND year(tc_srf02)=",l_tc_cmi.tc_cmi01," AND month(tc_srf02)=",l_tc_cmi.tc_cmi02,
                      " group by tc_srg03 "
           PREPARE sel_cmi1 FROM l_sql1
           DECLARE sel_cmi_cs1 CURSOR FOR sel_cmi1
           LET l_tc_cmi08 = 0 # add lixwz 171225
           FOREACH  sel_cmi_cs1  INTO l_tc_srg03,l_tc_srg10
               LET l_tc_cmi.tc_cmi35=l_tc_srg03
               LET l_tc_cmi.tc_cmi10=(l_tc_srg10/l_tc_cmi03)*l_tc_cmi.tc_cmi08
               LET l_tc_cmi.tc_cmi10 = cl_digcut(l_tc_cmi.tc_cmi10,g_azi04)
               INSERT INTO tc_cmi_file VALUES l_tc_cmi.*
               LET l_tc_cmi08 = l_tc_cmi08 + l_tc_cmi.tc_cmi10  # add lixwz 171225
           END FOREACH
           # add by lixwz 171225 s
           # 尾插处理，单身合计不相等是，将差异金额放在最后一笔单身上
           IF  l_tc_cmi08 != l_tc_cmi.tc_cmi08 THEN
               LET l_tc_cmi.tc_cmi10 = l_tc_cmi.tc_cmi10 + l_tc_cmi.tc_cmi08 - l_tc_cmi08
               UPDATE tc_cmi_file
                  SET tc_cmi10 = l_tc_cmi.tc_cmi10
                WHERE tc_cmi00 = l_tc_cmi.tc_cmi00
                  AND tc_cmi01 = l_tc_cmi.tc_cmi01
                  AND tc_cmi02 = l_tc_cmi.tc_cmi02
                  AND tc_cmi04 = l_tc_cmi.tc_cmi04
                  AND tc_cmi05 = l_tc_cmi.tc_cmi05
                  AND tc_cmi06 = l_tc_cmi.tc_cmi06
                  AND tc_cmi35 = l_tc_cmi.tc_cmi35
           END IF
           # add by lixwz 171225 e

         END IF
         #end------ add by dengsy170106

         {UPDATE tc_cmi_file SET tc_cmi10=l_tc_cmi.tc_cmi08-l_tc_cmi.tc_cmi10      #生产报工
             WHERE tc_cmi00=g_tc_cmi00
              AND tc_cmi01=g_tc_cmi01
              AND tc_cmi02=g_tc_cmi02
              AND tc_cmi05=l_tc_cmi.tc_cmi05
              AND tc_cmi06=l_tc_cmi.tc_cmi06
              AND tc_cmi04='2' }
      END FOREACH
      MESSAGE 'UPDATE O.K'
      #str-------- add by dengsy161011
      CALL cl_err('','aic-059',1)
      LET g_tc_cmi03=l_time2
      COMMIT WORK
      #end-------  add by dengsy161011
      CALL t212_show()
END FUNCTION
#
#FUNCTION t212_p()
#DEFINE l_n    LIKE type_file.num5
#DEFINE l_sql  STRING
#
#   LET l_n=0
#   IF  g_tc_cmi01 IS NULL OR g_tc_cmi02  IS NULL OR g_tc_cmi00 IS NULL THEN
#       RETURN
#   END IF
#
#END FUNCTION

#FUN-D80058--add--str--
FUNCTION t212_tc_cmi35(p_cmd)
 DEFINE p_cmd      LIKE type_file.chr1,
        l_pja02    LIKE pja_file.pja02,
        l_pjaacti  LIKE pja_file.pjaacti
       ,l_pjaclose LIKE pja_file.pjaclose
       ,l_pjaconf  LIKE pja_file.pjaconf

  LET g_errno = ' '
    SELECT pja02,pjaacti,pjaclose,pjaconf INTO l_pja02,l_pjaacti,l_pjaclose,l_pjaconf
            FROM pja_file WHERE pja01 = g_tc_cmi[l_ac].tc_cmi35
    CASE WHEN SQLCA.SQLCODE=100   LET g_errno = 'agl-007'
         WHEN l_pjaacti = 'N'     LET g_errno = '9028'
         WHEN l_pjaclose = 'Y'    LET g_errno = 'abg-503'
         WHEN l_pjaconf = 'N'     LET g_errno = 'apj-601'
         OTHERWISE           LET g_errno = SQLCA.sqlcode USING '----------'
    END CASE
END FUNCTION

FUNCTION t212_error(p_code)
 DEFINE p_code   LIKE aag_file.aag15,
        l_str    LIKE ze_file.ze03,
        l_ahe02  LIKE ahe_file.ahe02

    SELECT ahe02 INTO l_ahe02 FROM ahe_file WHERE ahe01 = p_code

    #-->顯示狀況
    IF p_code IS NOT NULL AND p_code != ' ' THEN
       CALL cl_getmsg('agl-098',g_lang) RETURNING l_str
       LET l_str = l_str CLIPPED,l_ahe02,'!'
       ERROR l_str
    END IF
END FUNCTION

FUNCTION t212_get_ahe02(p_aag01,p_aed02,p_gaq01,p_aee02)
  DEFINE p_aag01         LIKE type_file.chr50
  DEFINE p_aed02         LIKE aed_file.aed02
  DEFINE p_gaq01         LIKE gaq_file.gaq01
  DEFINE l_ahe01         LIKE ahe_file.ahe01
  DEFINE l_ahe03         LIKE ahe_file.ahe03
  DEFINE l_ahe04         LIKE ahe_file.ahe04
  DEFINE l_ahe05         LIKE ahe_file.ahe05
  DEFINE l_ahe07         LIKE ahe_file.ahe07
  DEFINE l_sql1          STRING
  DEFINE l_ahe02_d       LIKE ze_file.ze03
  DEFINE p_aee02         LIKE aee_file.aee02

     IF g_aaz.aaz119 ='N' THEN RETURN ' ' END IF
     #查找異動碼(核算項)值
     LET l_sql1 = " SELECT ",p_gaq01 CLIPPED," FROM aag_file ",
                  "  WHERE aag00 = '",g_tc_cmi00,"'",
                  "    AND aag01 LIKE ? ",
                  "    AND aag07 IN ('2','3') ",
                  "    AND ",p_gaq01 CLIPPED," IS NOT NULL"
     PREPARE t212_gaq01_p FROM l_sql1
     IF SQLCA.sqlcode != 0 THEN
        CALL cl_err('prepare:',SQLCA.sqlcode,1)
     END IF
     DECLARE t212_gaq01_cs SCROLL CURSOR FOR t212_gaq01_p

     #取異動碼(核算項)名稱
     LET l_ahe01 = NULL
     OPEN t212_gaq01_cs USING p_aag01
     IF SQLCA.sqlcode THEN
        CLOSE t212_gaq01_cs
        RETURN NULL
     END IF
     FETCH FIRST t212_gaq01_cs INTO l_ahe01
     IF SQLCA.sqlcode THEN
        CLOSE t212_gaq01_cs
        RETURN NULL
     END IF
     CLOSE t212_gaq01_cs
     IF NOT cl_null(l_ahe01) THEN
        LET l_ahe03 = ''
        LET l_ahe04 = ''
        LET l_ahe05 = ''
        LET l_ahe07 = ''
        SELECT ahe03,ahe04,ahe05,ahe07 INTO l_ahe03,l_ahe04,l_ahe05,l_ahe07
          FROM ahe_file
         WHERE ahe01 = l_ahe01
        IF NOT cl_null(l_ahe04) AND NOT cl_null(l_ahe05) AND
           NOT cl_null(l_ahe07) AND (l_ahe03 = '1' OR l_ahe03 = '4') THEN
           LET l_ahe02_d = ''
           LET l_sql1 = "SELECT UNIQUE ",l_ahe07 CLIPPED,
                        "  FROM ",l_ahe04 CLIPPED,
                        " WHERE ",l_ahe05 CLIPPED," = '",p_aed02,"'"
           PREPARE ahe_p1 FROM l_sql1
           EXECUTE ahe_p1 INTO l_ahe02_d
        END IF
        IF l_ahe03 = '2' THEN
           LET l_ahe02_d = ''
           SELECT aee04 INTO l_ahe02_d
             FROM aee_file
            WHERE aee00 = g_tc_cmi00
              AND aee01 = p_aag01
              AND aee02 = p_aee02
              AND aee03 = p_aed02
        END IF
        IF l_ahe03 = '3' THEN
           LET l_ahe02_d = p_aed02
        END IF
     END IF

     RETURN l_ahe02_d
END FUNCTION

FUNCTION t212_set_required(p_cmd)
   DEFINE p_cmd       LIKE type_file.chr1
   DEFINE l_occ37     LIKE occ_file.occ37
   DEFINE l_pmc903    LIKE pmc_file.pmc903

   IF INFIELD(tc_cmi05) OR NOT g_before_input_done THEN

      #是否作線上預算控制(Y/N)
      IF m_aag21 = 'Y' THEN
         CALL cl_set_comp_required("tc_cmi31",TRUE)
      END IF

      #是否作專案管理(Y/N)
      IF m_aag23 = 'Y' THEN
         CALL cl_set_comp_required("tc_cmi29",TRUE)
      END IF

     #異動碼-1控制方式
       IF m_aag151='2' OR m_aag151='3' THEN
         CALL cl_set_comp_required("tc_cmi14",TRUE)
      END IF

      #異動碼-2控制方式
       IF m_aag161='2' OR m_aag161='3' THEN
         CALL cl_set_comp_required("tc_cmi15",TRUE)
      END IF

      #異動碼-3控制方式
       IF m_aag171='2' OR m_aag171='3' THEN
         CALL cl_set_comp_required("tc_cmi17",TRUE)
      END IF

      #異動碼-4控制方式
       IF m_aag181='2' OR m_aag181='3' THEN
         CALL cl_set_comp_required("tc_cmi19",TRUE)
      END IF

      #異動碼-5控制方式
      IF m_aag311='2' OR m_aag311='3' THEN
         CALL cl_set_comp_required("tc_cmi21",TRUE)
      END IF
      #異動碼-6控制方式
       IF m_aag321='2' OR m_aag321='3' THEN
         CALL cl_set_comp_required("tc_cmi23",TRUE)
      END IF
      #異動碼-7控制方式
       IF m_aag331='2' OR m_aag331='3' THEN
         CALL cl_set_comp_required("tc_cmi25",TRUE)
      END IF
      #異動碼-8控制方式
       IF m_aag341='2' OR m_aag341='3' THEN
         CALL cl_set_comp_required("tc_cmi27",TRUE)
      END IF
      #關係人異動碼控制方式
       IF m_aag371='2' OR m_aag371='3' THEN
         CALL cl_set_comp_required("tc_cmi33",TRUE)
      END IF
   END IF
END FUNCTION

FUNCTION t212_set_no_required(p_cmd)
   DEFINE p_cmd   LIKE type_file.chr1

   CALL cl_set_comp_required("tc_cmi13,tc_cmi15,tc_cmi17,tc_cmi19",FALSE)

   CALL cl_set_comp_required("tc_cmi21,tc_cmi23,tc_cmi25,tc_cmi27,tc_cmi31,tc_cmi33",FALSE)
   IF m_aag23 = 'N' AND cl_null(m_aag23) THEN
      CALL cl_set_comp_required("tc_cmi35,tc_cmi29",FALSE)
   END IF

END FUNCTION

FUNCTION t212_tc_cmi29(p_cmd)
 DEFINE p_cmd      LIKE type_file.chr1,
        l_pjb01    LIKE pjb_file.pjb01,
        l_pjbacti  LIKE pjb_file.pjbacti,
        l_pjb25    LIKE pjb_file.pjb25
DEFINE  l_pjb09    LIKE pjb_file.pjb09
DEFINE  l_pjb11    LIKE pjb_file.pjb11

    LET g_errno = ' '
    SELECT pjb01,pjbacti,pjb09,pjb11,pjb25
      INTO l_pjb01,l_pjbacti,l_pjb09,l_pjb11,l_pjb25
      FROM pjb_file
     WHERE pjb02 = g_tc_cmi[l_ac].tc_cmi29
       AND pjb01 = g_tc_cmi[l_ac].tc_cmi35
    CASE WHEN SQLCA.SQLCODE=100   LET g_errno = 'apj-060'
         WHEN l_pjbacti = 'N'     LET g_errno = '9028'
         WHEN l_pjb09 ! = 'Y'     LET g_errno = 'apj-090'
         WHEN l_pjb11 ! = 'Y'     LET g_errno = 'apj-090'
         OTHERWISE           LET g_errno = SQLCA.sqlcode USING '----------'
    END CASE
END FUNCTION

FUNCTION t212_tc_cmi31(p_cmd)
 DEFINE p_cmd      LIKE type_file.chr1,
        l_azf02    LIKE azf_file.azf02,
        l_azf03    LIKE azf_file.azf03,
        l_azfacti  LIKE azf_file.azfacti
DEFINE  l_azf09    LIKE azf_file.azf09

    LET g_errno = ' '
    SELECT azf02,azf03,azfacti,azf09 INTO l_azf02,l_azf03,l_azfacti,l_azf09
            FROM azf_file WHERE azf01 = g_tc_cmi[l_ac].tc_cmi31
             AND azf02 ='2'
    CASE WHEN SQLCA.SQLCODE=100   LET g_errno = 'mfg3088'
         WHEN l_azfacti = 'N'     LET g_errno = '9028'
         WHEN l_azf02 ! = '2'     LET g_errno = 'mfg3088'
         WHEN l_azf09 !='7'       LET g_errno='aoo-406'
         OTHERWISE           LET g_errno = SQLCA.sqlcode USING '----------'
    END CASE
END FUNCTION

FUNCTION t212_bud(p_cmd,p_flag,p_tc_cmi)
   DEFINE p_cmd      LIKE type_file.chr1
   DEFINE p_flag     LIKE type_file.chr1
   DEFINE l_msg      LIKE ze_file.ze03
   DEFINE l_tol      LIKE abb_file.abb07
   DEFINE l_tol1     LIKE abb_file.abb07
   DEFINE total_t    LIKE abb_file.abb07
   DEFINE l_flag     LIKE type_file.num5
   DEFINE l_afb07    LIKE afb_file.afb07
   DEFINE l_amt      LIKE afc_file.afc07
   DEFINE l_abb05    LIKE abb_file.abb05
   DEFINE l_buf      LIKE ze_file.ze03
   DEFINE l_buf1     LIKE ze_file.ze03
   DEFINE l_flag1    LIKE type_file.chr1
   DEFINE l_bookno1  LIKE aaa_file.aaa01
   DEFINE l_bookno2  LIKE aaa_file.aaa01
   DEFINE l_fac      LIKE type_file.num5
   DEFINE l_aag04    LIKE aag_file.aag04
   DEFINE p_tc_cmi      RECORD
                     tc_cmi05       LIKE tc_cmi_file.tc_cmi05,   #科目編號
                     tc_cmi06       LIKE tc_cmi_file.tc_cmi06,   #部門
                     tc_cmi07       LIKE tc_cmi_file.tc_cmi07,   #名稱/說明
                     tc_cmi08       LIKE tc_cmi_file.tc_cmi08,   #當期異動金額
                     tc_cmi10       LIKE tc_cmi_file.tc_cmi10,
                     #str-------- add by dengsy161011
                     tc_cmi36       LIKE tc_cmi_file.tc_cmi36,
                     aag02          LIKE aag_file.aag02,
                     tc_cmi37       LIKE tc_cmi_file.tc_cmi37,
                     gem02          LIKE gem_file.gem02,
                     #end-------- add by dengsy161011
                     tc_cmi35       LIKE tc_cmi_file.tc_cmi35,
                     tc_cmi13       LIKE tc_cmi_file.tc_cmi13,
                     tc_cmi14       LIKE tc_cmi_file.tc_cmi14,
                     tc_cmi15       LIKE tc_cmi_file.tc_cmi15,
                     tc_cmi16       LIKE tc_cmi_file.tc_cmi16,
                     tc_cmi17       LIKE tc_cmi_file.tc_cmi17,
                     tc_cmi18       LIKE tc_cmi_file.tc_cmi18,
                     tc_cmi19       LIKE tc_cmi_file.tc_cmi19,
                     tc_cmi20       LIKE tc_cmi_file.tc_cmi20,
                     tc_cmi21       LIKE tc_cmi_file.tc_cmi21,
                     tc_cmi22       LIKE tc_cmi_file.tc_cmi22,
                     tc_cmi23       LIKE tc_cmi_file.tc_cmi23,
                     tc_cmi24       LIKE tc_cmi_file.tc_cmi24,
                     tc_cmi25       LIKE tc_cmi_file.tc_cmi25,
                     tc_cmi26       LIKE tc_cmi_file.tc_cmi26,
                     tc_cmi27       LIKE tc_cmi_file.tc_cmi27,
                     tc_cmi28       LIKE tc_cmi_file.tc_cmi28,
                     tc_cmi29       LIKE tc_cmi_file.tc_cmi29,
                     tc_cmi30       LIKE tc_cmi_file.tc_cmi30,
                     tc_cmi31       LIKE tc_cmi_file.tc_cmi31,
                     tc_cmi32       LIKE tc_cmi_file.tc_cmi32,
                     tc_cmi33       LIKE tc_cmi_file.tc_cmi33,
                     tc_cmi34       LIKE tc_cmi_file.tc_cmi34
                     END RECORD

   IF g_tc_cmi.getLength() = 0 THEN RETURN END IF
   LET g_errno = ''
   SELECT aag21,aag04 INTO m_aag21,l_aag04
     FROM aag_file
    WHERE aag01 = p_tc_cmi.tc_cmi05
      AND aag00 = g_tc_cmi00
   IF m_aag21 <> 'Y' THEN
      RETURN
   END IF

   IF g_aza.aza08 = 'N' THEN
      LET p_tc_cmi.tc_cmi35 = ' '
      LET p_tc_cmi.tc_cmi29 = ' '
   END IF

   IF g_tc_cmi00 IS NULL OR g_tc_cmi01 IS NULL OR
      g_tc_cmi02 IS NULL OR p_tc_cmi.tc_cmi05 IS NULL OR
      p_tc_cmi.tc_cmi06 IS NULL OR p_tc_cmi.tc_cmi35 IS NULL OR
      p_tc_cmi.tc_cmi29 IS NULL OR p_tc_cmi.tc_cmi31 IS NULL THEN
      RETURN
   END IF

    SELECT aag06
        INTO m_aag06
        FROM aag_file
        WHERE aag01 = p_tc_cmi.tc_cmi05
          AND aag00 = g_tc_cmi00
   CALL s_get_bookno(g_tc_cmi01) RETURNING l_flag1,l_bookno1,l_bookno2
   IF l_flag1 = '1' THEN
      CALL s_errmsg("",'',g_tc_cmi01,'aoo-081',1)
      LET g_errno = 'aoo-081'
   END IF

   IF g_tc_cmi00 = l_bookno1 THEN
      LET p_flag = '0'
   ELSE
      LET p_flag = '1'
   END IF

   CALL s_getbug1(g_tc_cmi00,p_tc_cmi.tc_cmi31,p_tc_cmi.tc_cmi05,
                  g_tc_cmi01,p_tc_cmi.tc_cmi29,p_tc_cmi.tc_cmi06,
                  p_tc_cmi.tc_cmi35,g_tc_cmi02,p_flag)
        RETURNING l_flag,l_afb07,l_amt

   IF l_flag = TRUE THEN
      LET l_msg = g_tc_cmi00,'/',p_tc_cmi.tc_cmi31,'/',p_tc_cmi.tc_cmi05,'/',
                  g_tc_cmi01,'/',p_tc_cmi.tc_cmi29,'/',p_tc_cmi.tc_cmi06,'/',
                  p_tc_cmi.tc_cmi35,'/',g_tc_cmi02,'/',p_flag,'/',l_amt

      CALL s_errmsg("",'',l_msg,'aoo-081',1)
   ELSE
      IF l_afb07 = '2' AND l_amt < 0 THEN
         LET l_msg = g_tc_cmi00,'/',p_tc_cmi.tc_cmi31,'/',p_tc_cmi.tc_cmi05,'/',
                     g_tc_cmi01,'/',p_tc_cmi.tc_cmi29,'/',p_tc_cmi.tc_cmi06,'/',
                     p_tc_cmi.tc_cmi35,'/',g_tc_cmi02,'/',p_flag,'/',l_amt
         LET g_errno =' '
      END IF
   END IF

   LET g_afb07 = l_afb07
   #-->不做超限控制
   IF l_afb07  != '1' THEN
      SELECT SUM(abb07) INTO l_tol
        FROM abb_file,aba_file
       WHERE abb00 = aba00
         AND aba01 = abb01
         AND aba00 = g_tc_cmi00
         AND aba03 = g_tc_cmi01
         AND aba04 = g_tc_cmi02
         AND abb03 = p_tc_cmi.tc_cmi05
         AND abb08 = p_tc_cmi.tc_cmi35
         AND abb35 = p_tc_cmi.tc_cmi29
         AND abb36 = p_tc_cmi.tc_cmi31
         AND abb05 = p_tc_cmi.tc_cmi06
         AND abb06 = '1'                     #借方
         AND abapost <> 'Y'
         AND aba19 <> 'X'
      IF SQLCA.sqlcode OR l_tol IS NULL THEN
         LET l_tol = 0
      END IF

      SELECT SUM(abb07) INTO l_tol1 FROM abb_file,aba_file
       WHERE abb00 = aba00
         AND aba01 = abb01
         AND aba00 = g_tc_cmi00
         AND aba03 = g_tc_cmi01
         AND aba04 = g_tc_cmi02
         AND abb03 = p_tc_cmi.tc_cmi05
         AND abb08 = p_tc_cmi.tc_cmi35
         AND abb35 = p_tc_cmi.tc_cmi29
         AND abb36 = p_tc_cmi.tc_cmi31
         AND abb05 = p_tc_cmi.tc_cmi06
         AND abb06 = '2'                     #貸方
         AND abapost <> 'Y'
         AND aba19 <> 'X'
      IF SQLCA.sqlcode OR l_tol1 IS NULL THEN
         LET l_tol1 = 0
      END IF

      LET l_fac = 1
      IF m_aag06 = '1' THEN                     #借餘
         LET total_t = l_tol - l_tol1           #借減貸
      ELSE                                      #貸餘
         LET total_t = l_tol1 - l_tol           #貸減借
      END IF

   IF g_action_choice != 'confirm' OR cl_null(g_action_choice) THEN
      IF p_cmd = 'a' THEN                       #若本筆資料為新增則加上本次輸入的值
         LET total_t = total_t + p_tc_cmi.tc_cmi08 * l_fac
      ELSE                                      #若為更改則減掉舊值再加上新值
         LET total_t = total_t - g_tc_cmi_t.tc_cmi08 * l_fac + p_tc_cmi.tc_cmi08 * l_fac
      END IF
   END IF

      IF p_cmd = 'u' THEN
         LET l_amt = l_amt + p_tc_cmi.tc_cmi08
      END IF
      IF p_tc_cmi.tc_cmi08 > l_amt THEN
         CASE l_afb07
            WHEN '2'
               CALL cl_getmsg('agl-140',0) RETURNING l_buf
               CALL cl_getmsg('agl-141',0) RETURNING l_buf1
               LET g_sql = l_buf CLIPPED,' ',total_t,
                           l_buf1 CLIPPED,' ',l_amt
               LET g_errno = ''
               CALL s_errmsg('tc_cmi31',p_tc_cmi.tc_cmi05,g_sql,'agl-233',1)
            WHEN '3'
               CALL cl_getmsg('agl-142',0) RETURNING l_buf
               CALL cl_getmsg('agl-143',0) RETURNING l_buf1
               LET g_sql = l_buf CLIPPED,' ',total_t,
                           l_buf1 CLIPPED,' ',l_amt
               LET g_errno = 'agl-233'
               CALL s_errmsg('tc_cmi31',p_tc_cmi.tc_cmi05,g_sql,'agl-233',1)
         END CASE
      END IF
  END IF
END FUNCTION

FUNCTION t212_visible(p_code)
   DEFINE p_code    LIKE type_file.num5

   CALL cl_set_comp_visible("tc_cmi13,tc_cmi14,tc_cmi15,tc_cmi16,tc_cmi17,tc_cmi18",TRUE)
   CALL cl_set_comp_visible("tc_cmi19,tc_cmi20,tc_cmi21,tc_cmi22,tc_cmi23,tc_cmi24",TRUE)
   CALL cl_set_comp_visible("tc_cmi25,tc_cmi26,tc_cmi27,tc_cmi28,tc_cmi29,tc_cmi30",TRUE)
   CALL cl_set_comp_visible("tc_cmi31,tc_cmi32,tc_cmi33,tc_cmi34",TRUE)
   CASE p_code
      WHEN  1
         CALL cl_set_comp_visible("tc_cmi15,tc_cmi16,tc_cmi17,tc_cmi18,tc_cmi19,tc_cmi20",FALSE)
         CALL cl_set_comp_visible("tc_cmi21,tc_cmi22,tc_cmi23,tc_cmi24,tc_cmi25,tc_cmi26",FALSE)
         CALL cl_set_comp_visible("tc_cmi27,tc_cmi28,tc_cmi29,tc_cmi30,tc_cmi31,tc_cmi32",FALSE)
         CALL cl_set_comp_visible("tc_cmi33,tc_cmi34",FALSE)
      WHEN  2
         CALL cl_set_comp_visible("tc_cmi17,tc_cmi18,tc_cmi19,tc_cmi20,tc_cmi21,tc_cmi22",FALSE)
         CALL cl_set_comp_visible("tc_cmi23,tc_cmi24,tc_cmi25,tc_cmi26,tc_cmi27,tc_cmi28",FALSE)
         CALL cl_set_comp_visible("tc_cmi29,tc_cmi30,tc_cmi31,tc_cmi32,tc_cmi33,tc_cmi34",FALSE)
      WHEN 3
         CALL cl_set_comp_visible("tc_cmi19,tc_cmi20,tc_cmi21,tc_cmi22,tc_cmi23,tc_cmi24",FALSE)
         CALL cl_set_comp_visible("tc_cmi25,tc_cmi26,tc_cmi27,tc_cmi28,tc_cmi29,tc_cmi30",FALSE)
         CALL cl_set_comp_visible("tc_cmi31,tc_cmi32,tc_cmi33,tc_cmi34",FALSE)
      WHEN 4
         CALL cl_set_comp_visible("tc_cmi21,tc_cmi22,tc_cmi23,tc_cmi24,tc_cmi25,tc_cmi26",FALSE)
         CALL cl_set_comp_visible("tc_cmi27,tc_cmi28,tc_cmi29,tc_cmi30,tc_cmi31,tc_cmi32",FALSE)
         CALL cl_set_comp_visible("tc_cmi33,tc_cmi34",FALSE)
      WHEN 5
         CALL cl_set_comp_visible("tc_cmi23,tc_cmi24,tc_cmi25,tc_cmi26,tc_cmi27,tc_cmi28",FALSE)
         CALL cl_set_comp_visible("tc_cmi29,tc_cmi30,tc_cmi31,tc_cmi32,tc_cmi33,tc_cmi34",FALSE)
      WHEN 6
         CALL cl_set_comp_visible("tc_cmi25,tc_cmi26,tc_cmi27,tc_cmi28,tc_cmi29,tc_cmi30",FALSE)
         CALL cl_set_comp_visible("tc_cmi31,tc_cmi32,tc_cmi33,tc_cmi34",FALSE)
      WHEN 7
         CALL cl_set_comp_visible("tc_cmi27,tc_cmi28,tc_cmi29,tc_cmi30,tc_cmi31,tc_cmi32",FALSE)
         CALL cl_set_comp_visible("tc_cmi33,tc_cmi34",FALSE)
      WHEN 8
         CALL cl_set_comp_visible("tc_cmi29,tc_cmi30,tc_cmi31,tc_cmi32,tc_cmi33,tc_cmi34",FALSE)
      WHEN 9
         CALL cl_set_comp_visible("tc_cmi31,tc_cmi32,tc_cmi33,tc_cmi34",FALSE)
      WHEN 10
         CALL cl_set_comp_visible("tc_cmi33,tc_cmi34",FALSE)
      WHEN 0
         CALL cl_set_comp_visible("tc_cmi13,tc_cmi14,tc_cmi15,tc_cmi16,tc_cmi17,tc_cmi18",FALSE)
         CALL cl_set_comp_visible("tc_cmi19,tc_cmi20,tc_cmi21,tc_cmi22,tc_cmi23,tc_cmi24",FALSE)
         CALL cl_set_comp_visible("tc_cmi25,tc_cmi26,tc_cmi27,tc_cmi28,tc_cmi29,tc_cmi30",FALSE)
         CALL cl_set_comp_visible("tc_cmi31,tc_cmi32,tc_cmi33,tc_cmi34",FALSE)
   END CASE
END FUNCTION
#FUN-D80058--add--end--

#No.FUN-9C0073 -----------------By chenls 10/01/13
#MOD-DB0167 add begin------------------
FUNCTION t212_chk(p_tc_cmi00,p_tc_cmi01,p_tc_cmi02)
DEFINE p_tc_cmi00     LIKE tc_cmi_file.tc_cmi00,
       p_tc_cmi01     LIKE tc_cmi_file.tc_cmi01,
       p_tc_cmi02     LIKE tc_cmi_file.tc_cmi02
DEFINE l_nppglno   LIKE npp_file.nppglno,
       l_cmiconf     LIKE tc_cmi_file.tc_cmiconf,
       l_tc_cmi09      LIKE tc_cmi_file.tc_cmi09,
       l_err       STRING
   SELECT DISTINCT tc_cmi09 INTO l_tc_cmi09
     FROM tc_cmi_file
    WHERE  tc_cmi00= =p_tc_cmi00 AND tc_cmi01=p_tc_cmi01 AND tc_cmi02= =p_tc_cmi02

   IF NOT cl_null(l_tc_cmi09)  THEN
      SELECT nppglno INTO l_nppglno FROM npp_file WHERE npp01 = l_tc_cmi09 AND nppsys ='CA' AND npp00 = 8 AND npp011 = 1
        IF NOT cl_null(l_nppglno) THEN #add by dengsy161011
         LET l_err = cl_get_feldname("tc_cmi00",g_lang),":",p_tc_cmi00,
                     cl_get_feldname("tc_cmi01",g_lang),":",p_tc_cmi01,
                     cl_get_feldname("tc_cmi02",g_lang),":",p_tc_cmi02
         CALL cl_err(l_err,'cxc-001',1)
         RETURN FALSE
        END IF #add by dengsy161011
   END IF
   RETURN TRUE
END FUNCTION
#MOD-DB0167 add end--------------------

#str------- add by dengsy161011
FUNCTION t212_v()
  DEFINE l_npp01     LIKE npp_file.npp01
   DEFINE l_cnt       LIKE type_file.num5
   DEFINE l_exist     LIKE type_file.chr1
   DEFINE l_cmi08     LIKE cmi_file.cmi08
   DEFINE l_cdb05     LIKE cdb_file.cdb05
   DEFINE l_nppglno   LIKE npp_file.nppglno

   IF cl_null(g_tc_cmi02) OR cl_null(g_tc_cmi00) OR cl_null(g_tc_cmi01)  THEN
      RETURN
   END IF

   LET l_npp01 = g_tc_cmi04 CLIPPED,'-',g_tc_cmi01 USING "&&&&",g_tc_cmi02 USING "&&",'0002'

   IF g_tc_cmi00 = g_ccz.ccz12 THEN
      LET g_npptype  = '0'
   ELSE
      LET g_npptype  = '1'
   END IF

   LET l_exist = 'N'
   LET l_cnt = 0

   #已生成成本分录底稿
   SELECT COUNT(*) INTO l_cnt FROM npp_file
    WHERE npp00   = 8  #FUN-AA0025
      AND npp01   = l_npp01
      AND npp011  = 1
      AND nppsys  = 'CA'
      AND npptype = g_npptype
   IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
   IF l_cnt > 0 THEN
      LET l_exist = 'Y'
   END IF

   IF l_exist = 'Y' THEN
      #check是否已经抛转凭证
      SELECT nppglno INTO l_nppglno FROM npp_file
       WHERE npp00   = 8  #FUN-AA0025
         AND npp01   = l_npp01
         AND npp011  = 1
         AND nppsys  = 'CA'
         AND npptype = g_npptype
      IF NOT cl_null(l_nppglno) THEN
         CALL cl_err(l_nppglno,'axc-078',0)
         RETURN
      END IF
   END IF

   IF l_exist = 'Y' THEN
      IF NOT cl_confirm('mfg8002') THEN
         RETURN
      END IF
   ELSE
      IF NOT cl_confirm('axr-309') THEN
         RETURN
      END IF
   END IF

   LET g_success = 'Y'
   BEGIN WORK
   CALL s_showmsg_init()
   CALL t212_g1(l_npp01)
   IF g_success = 'Y' THEN
     UPDATE tc_cmi_file SET tc_cmi09=l_npp01
      WHERE tc_cmi00=g_tc_cmi00
              AND tc_cmi01=g_tc_cmi01
              AND tc_cmi02=g_tc_cmi02
              AND tc_cmi04='1'
      IF SQLCA.sqlcode OR SQLCA.sqlerrd[3] = 0 THEN
         CALL s_errmsg('tc_cmi09',l_npp01,'update tc_cmi09',SQLCA.sqlcode,1)
         LET g_success = 'N'
      END IF
   END IF
   CALL s_showmsg()
   IF g_success = 'Y' THEN
      COMMIT WORK
   ELSE
      ROLLBACK WORK
   END IF
   SELECT tc_cmi09 INTO g_tc_cmi09 FROM tc_cmi_file
    WHERE tc_cmi00=g_tc_cmi00
              AND tc_cmi01=g_tc_cmi01
              AND tc_cmi02=g_tc_cmi02
              AND tc_cmi04='1'
   DISPLAY g_tc_cmi09 TO tc_cmi09

END FUNCTION

FUNCTION t212_g1(p_npp01)
   DEFINE p_npp01     LIKE npp_file.npp01
   DEFINE l_npp       RECORD LIKE npp_file.*
   DEFINE l_npq       RECORD LIKE npq_file.*
   DEFINE l_cmi_cnt   LIKE type_file.num5
   DEFINE l_i         LIKE type_file.num5
   DEFINE l_npq02     LIKE npq_file.npq02
   DEFINE l_date      LIKE type_file.dat
   DEFINE l_npq07f_d  LIKE npq_file.npq07     #CHI-CB0025 add
   DEFINE l_npq07_d   LIKE npq_file.npq07     #CHI-CB0025 add
   DEFINE l_npq07f_c  LIKE npq_file.npq07     #CHI-CB0025 add
   DEFINE l_npq07_c   LIKE npq_file.npq07     #CHI-CB0025 add
   DEFINE l_aag05     LIKE aag_file.aag05     #No.MOD-D20062
   DEFINE l_flag      LIKE type_file.chr1     #FUN-D40118 add

   INITIALIZE l_npp.* TO NULL
   INITIALIZE l_npq.* TO NULL

   LET l_npp.nppsys   = 'CA'
   LET l_npp.npp00    = 8  #FUN-AA0025
   LET l_npp.npp01    = p_npp01
   LET l_npp.npp011   = 1
   LET l_date         = MDY(g_tc_cmi02,1,g_tc_cmi01)
   LET l_npp.npp02    = s_last(l_date)
   LET l_npp.npp03    = NULL
   LET l_npp.npp06    = g_plant
   LET l_npp.nppglno  = NULL
   LET l_npp.npptype  = g_npptype
   LET l_npp.npplegal = g_legal  #FUN-980009 add

   DELETE FROM npp_file
    WHERE nppsys  = 'CA'
      AND npp00   = 8  #FUN-AA0025
      AND npp01   = p_npp01
      AND npp011  = 1
      AND npptype = g_npptype

   INSERT INTO npp_file VALUES(l_npp.*)
   IF SQLCA.SQLCODE OR SQLCA.SQLERRD[3]=0 THEN
      CALL s_errmsg('nppsys','CA','insert npp_file',SQLCA.sqlcode,1)
      LET g_success = 'N'
      RETURN
   END IF
   IF g_bgjob = 'N' THEN
       MESSAGE l_npp.npp01
   END IF

   #insert npq_file 單身
   DELETE FROM npq_file
    WHERE npqsys  = 'CA'
      AND npq00   = 8 #FUN-AA0025
      AND npq01   = p_npp01
      AND npq011  = 1
      AND npqtype = g_npptype

   IF STATUS THEN LET g_success = 'N' RETURN END IF
#FUN-B40056 --Begin
   DELETE FROM tic_file WHERE tic04 = p_npp01

   IF STATUS THEN LET g_success = 'N' RETURN END IF
#FUN-B40056 --End

   LET l_cmi_cnt = g_tc_cmi.getlength()
   LET l_npq02 = 1
   FOR l_i = 1  TO l_cmi_cnt
       INITIALIZE l_npq.* TO NULL
       IF cl_null(g_tc_cmi[l_i].tc_cmi05 ) THEN
         CONTINUE FOR
       END IF
       LET l_npq.npqsys ='CA'
       LET l_npq.npq00  = 8 #FUN-AA0025
       LET l_npq.npq01  =p_npp01
       LET l_npq.npq011 = 1
       LET l_npq.npq02 = l_npq02
       LET l_npq.npq03 = g_tc_cmi[l_i].tc_cmi05  #贷方科目
       #LET l_npq.npq36 = g_tc_cmi[l_i].tc_cmi31   #add by songxy

       #LET l_npq.npq12 = g_tc_cmi[l_i].tc_cmi14    # add by songxy160808
       LET l_npq.npq02 = l_npq02
       CALL s_def_npq3(g_tc_cmi00,l_npq.npq03,g_prog,l_npq.npq01,'','') RETURNING l_npq.npq04  #摘要
       LET l_aag05 =''
       LET l_aag42='N'
       LET l_aag06='2'
       LET l_aag23='N'
       SELECT aag05,aag42,aag06,aag23 INTO l_aag05,l_aag42,l_aag06,l_aag23 FROM aag_file
       WHERE aag00 = g_tc_cmi00 AND aag01 = l_npq.npq03
       IF l_aag05 ='Y' THEN
          LET l_npq.npq05 = g_tc_cmi[l_i].tc_cmi06
       ELSE
          LET l_npq.npq05 = ' '
       END IF
       {IF l_aag06='1' AND l_aag42='Y' AND g_tc_cmi[l_i].tc_cmi10<0 THEN
          LET l_npq.npq06 = '1'
          LET l_npq.npq07f = g_tc_cmi[l_i].tc_cmi10 * -1
          LET l_npq.npq07  = g_tc_cmi[l_i].tc_cmi10 * -1
       ELSE
          LET l_npq.npq06 = '2'
          LET l_npq.npq07f = g_tc_cmi[l_i].tc_cmi10
          LET l_npq.npq07  = g_tc_cmi[l_i].tc_cmi10
       END IF }
       LET l_npq.npq06 = '2'
       LET l_npq.npq07f = g_tc_cmi[l_i].tc_cmi10
       LET l_npq.npq07  = g_tc_cmi[l_i].tc_cmi10
       LET l_npq.npq07f  = cl_digcut(l_npq.npq07f,t_azi04)    #CHI-CB0025 add
       LET l_npq.npq07   = cl_digcut(l_npq.npq07,g_azi04)     #CHI-CB0025 add
       #LET l_npq.npq08 = NULL
       IF l_aag23='Y' THEN
       LET l_npq.npq08= g_tc_cmi[l_i].tc_cmi35  #项目编号
       ELSE
       LET l_npq.npq08 = NULL
       END IF
       LET l_npq.npq11 = ' '
       LET l_npq.npq13 = ' '
       LET l_npq.npq14 = ' '
       LET l_npq.npq15 = NULL
       LET l_npq.npq21 = NULL
       LET l_npq.npq22 = NULL
       LET l_npq.npq24 = g_aza.aza17
       LET l_npq.npq25 = 1
       LET l_npq.npq30 = g_plant
       LET l_npq.npq31 = ' '
       LET l_npq.npq32 = ' '
       LET l_npq.npq33 = ' '
       LET l_npq.npq34 = ' '
       LET l_npq.npq35 = ' '
       LET l_npq.npq36 = ' '
       LET l_npq.npq37 = ' '
       LET l_npq.npqtype = g_npptype
       LET l_npq.npqlegal = g_legal
       #No.MOD-C40106  --Begin
       IF l_npq.npq07 = 0 AND l_npq.npq07f = 0 THEN
           CONTINUE FOR
       END IF
       #No.MOD-C40106  --End
       #FUN-D40118--add--str--
       SELECT aag44 INTO g_aag44 FROM aag_file
        WHERE aag00 = g_tc_cmi00
          AND aag01 = l_npq.npq03
       IF g_aza.aza26 = '2' AND g_aag44 = 'Y' THEN
          CALL s_chk_ahk(l_npq.npq03,g_tc_cmi00) RETURNING l_flag
          IF l_flag = 'N'   THEN
             LET l_npq.npq03 = ''
          END IF
       END IF
       #FUN-D40118--add--end--
       INSERT INTO npq_file VALUES(l_npq.*)
       IF SQLCA.SQLCODE OR SQLCA.SQLERRD[3]=0 THEN
          CALL s_errmsg('npq03',l_npq.npq03,'insert npq_file',SQLCA.sqlcode,1)
          LET g_success = 'N'
          RETURN
       END IF
       LET l_npq02 = l_npq02 + 1

   END FOR

   FOR l_i = 1  TO l_cmi_cnt
       INITIALIZE l_npq.* TO NULL
       IF cl_null(g_tc_cmi[l_i].tc_cmi05 ) THEN
         CONTINUE FOR
       END IF
       LET l_npq.npqsys ='CA'
       LET l_npq.npq00  = 8 #FUN-AA0025
       LET l_npq.npq01  =p_npp01
       LET l_npq.npq011 = 1
       LET l_npq.npq02 = l_npq02
       LET l_npq.npq03 = g_tc_cmi[l_i].tc_cmi36  #借方科目
       #LET l_npq.npq36 = g_tc_cmi[l_i].tc_cmi31   #add by songxy

       #LET l_npq.npq12 = g_tc_cmi[l_i].tc_cmi14    # add by songxy160808
       #LET l_npq.npq02 = l_npq02
       CALL s_def_npq3(g_tc_cmi00,l_npq.npq03,g_prog,l_npq.npq01,'','') RETURNING l_npq.npq04  #摘要
       LET l_aag05 =''
       LET l_aag42='N'
       LET l_aag06='1'
       SELECT aag05,aag42,aag06 INTO l_aag05,l_aag42,l_aag06 FROM aag_file WHERE aag00 = g_tc_cmi00 AND aag01 = l_npq.npq03
       IF l_aag05 ='Y' THEN
          LET l_npq.npq05 = g_tc_cmi[l_i].tc_cmi37
       ELSE
          LET l_npq.npq05 = ' '
       END IF
       {IF l_aag06='2' AND l_aag42='Y' AND g_tc_cmi[l_i].tc_cmi10<0 THEN
          LET l_npq.npq06 = '2'
          LET l_npq.npq07f = g_tc_cmi[l_i].tc_cmi10 * -1
          LET l_npq.npq07  = g_tc_cmi[l_i].tc_cmi10 * -1
       ELSE
          LET l_npq.npq06 = '1'
          LET l_npq.npq07f = g_tc_cmi[l_i].tc_cmi10
          LET l_npq.npq07  = g_tc_cmi[l_i].tc_cmi10
       END IF }
       LET l_npq.npq06 = '1'
          LET l_npq.npq07f = g_tc_cmi[l_i].tc_cmi10
          LET l_npq.npq07  = g_tc_cmi[l_i].tc_cmi10
       LET l_npq.npq07f  = cl_digcut(l_npq.npq07f,t_azi04)    #CHI-CB0025 add
       LET l_npq.npq07   = cl_digcut(l_npq.npq07,g_azi04)     #CHI-CB0025 add
       LET l_npq.npq08 = NULL
       LET l_npq.npq11 = g_tc_cmi[l_i].tc_cmi35   #add renjj170106
       LET l_npq.npq13 = ' '
       LET l_npq.npq14 = ' '
       LET l_npq.npq15 = NULL
       LET l_npq.npq21 = NULL
       LET l_npq.npq22 = NULL
       LET l_npq.npq24 = g_aza.aza17
       LET l_npq.npq25 = 1
       LET l_npq.npq30 = g_plant
       LET l_npq.npq31 = ' '
       LET l_npq.npq32 = ' '
       LET l_npq.npq33 = ' '
       LET l_npq.npq34 = ' '
       LET l_npq.npq35 = ' '
       LET l_npq.npq36 = ' '
       LET l_npq.npq37 = ' '
       LET l_npq.npqtype = g_npptype
       LET l_npq.npqlegal = g_legal
       #No.MOD-C40106  --Begin
       IF l_npq.npq07 = 0 AND l_npq.npq07f = 0 THEN
           CONTINUE FOR
       END IF
       #No.MOD-C40106  --End
       #FUN-D40118--add--str--
       SELECT aag44 INTO g_aag44 FROM aag_file
        WHERE aag00 = g_tc_cmi00
          AND aag01 = l_npq.npq03
       IF g_aza.aza26 = '2' AND g_aag44 = 'Y' THEN
          CALL s_chk_ahk(l_npq.npq03,g_tc_cmi00) RETURNING l_flag
          IF l_flag = 'N'   THEN
             LET l_npq.npq03 = ''
          END IF
       END IF
       #FUN-D40118--add--end--
       INSERT INTO npq_file VALUES(l_npq.*)
       IF SQLCA.SQLCODE OR SQLCA.SQLERRD[3]=0 THEN
          CALL s_errmsg('npq03',l_npq.npq03,'insert npq_file',SQLCA.sqlcode,1)
          LET g_success = 'N'
          RETURN
       END IF
       LET l_npq02 = l_npq02 + 1

   END FOR

   CALL s_flows('3','',l_npq.npq01,l_npp.npp02,'N',l_npq.npqtype,TRUE)   #No.TQC-B70021

END FUNCTION
#end------- add by dengsy161011
