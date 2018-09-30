# Prog. Version..: '5.30.01-10.05.01(00000)'     #
#
# Pattern name...: apjt120材料需求变更
# Descriptions...:
# Date & Author..: zhaoxiangb 160111


DATABASE ds

GLOBALS "../../../tiptop/config/top.global"

DEFINE g_tc_ppp_1 RECORD    #单头字段，不允许变更
         tc_ppp01  LIKE tc_ppp_file.tc_ppp01,  #WBs编号
         tc_ppp21  LIKE tc_ppp_file.tc_ppp21,  #变更版本
         tc_ppp15  LIKE tc_ppp_file.tc_ppp15,  #送签单号
         tc_ppp22  LIKE tc_ppp_file.tc_ppp22,  #变更送签单号
         tc_ppp16  LIKE tc_ppp_file.tc_ppp16,  #编辑员
         tc_ppp08  LIKE tc_ppp_file.tc_ppp08,  #税种
         tc_ppp20  LIKE tc_ppp_file.tc_ppp20,  #税率
         tc_pppconf LIKE tc_ppp_file.tc_pppconf, #审核码
         tc_ppp23   LIKE tc_ppp_file.tc_ppp23,
         tc_pppmksg LIKE tc_ppp_file.tc_pppmksg,
         tc_ppporiu LIKE tc_ppp_file.tc_ppporiu,
         tc_ppporig LIKE tc_ppp_file.tc_ppporig,
         tc_pppgrup LIKE tc_ppp_file.tc_pppgrup,
         tc_pppuser LIKE tc_ppp_file.tc_pppuser
              END RECORD,
       g_tc_ppp_1_t  RECORD
         tc_ppp01  LIKE tc_ppp_file.tc_ppp01,  #WBs编号
         tc_ppp21  LIKE tc_ppp_file.tc_ppp21,  #变更版本
         tc_ppp15  LIKE tc_ppp_file.tc_ppp15,  #送签单号
         tc_ppp22  LIKE tc_ppp_file.tc_ppp22,  #变更送签单号
         tc_ppp16  LIKE tc_ppp_file.tc_ppp16,  #编辑员
         tc_ppp08  LIKE tc_ppp_file.tc_ppp08,   #税种
         tc_ppp20  LIKE tc_ppp_file.tc_ppp20,   #税率
         tc_pppconf LIKE tc_ppp_file.tc_pppconf, #审核码
         tc_ppp23   LIKE tc_ppp_file.tc_ppp23,
         tc_pppmksg LIKE tc_ppp_file.tc_pppmksg,
         tc_ppporiu LIKE tc_ppp_file.tc_ppporiu,
         tc_ppporig LIKE tc_ppp_file.tc_ppporig,
         tc_pppgrup LIKE tc_ppp_file.tc_pppgrup,
         tc_pppuser LIKE tc_ppp_file.tc_pppuser
              END RECORD,
       g_tc_ppp    DYNAMIC ARRAY OF RECORD
         tc_ppp02   LIKE tc_ppp_file.tc_ppp02,     #项次
         tc_ppp18   LIKE tc_ppp_file.tc_ppp18,     #变更类型
         tc_ppp19   LIKE tc_ppp_file.tc_ppp19,     #变更项次
         tc_ppp03a  LIKE tc_ppp_file.tc_ppp03a,    #变更前料件编号
         tc_ppp04a  LIKE tc_ppp_file.tc_ppp04a,    #变更前品名
         ima021_1   LIKE ima_file.ima021,          #规格
         ima25_1    LIKE ima_file.ima25,           #库存单位
         tc_ppp05a  LIKE tc_ppp_file.tc_ppp05a,    #变更前需求量
         tc_ppp06a  LIKE tc_ppp_file.tc_ppp06a,    #变更前需求日
         tc_ppp07   LIKE tc_ppp_file.tc_ppp07,     #转请购量
         tc_ppp09a  LIKE tc_ppp_file.tc_ppp09a,    #变更前预算未税单价
         tc_ppp10a  LIKE tc_ppp_file.tc_ppp10a,    #变更前预算含税单价
         tc_ppp11a  LIKE tc_ppp_file.tc_ppp11a,    #变更前预算未税金额
         tc_ppp12a  LIKE tc_ppp_file.tc_ppp12a,    #变更前预算含税金额
         tc_ppp17a  LIKE tc_ppp_file.tc_ppp17a,    #变更前预算明细
         tc_ppp17a_desc   LIKE azf_file.azf03,    #变更前预算明细说明

         tc_ppp03b  LIKE tc_ppp_file.tc_ppp03b,    #变更前料件编号
         tc_ppp04b  LIKE tc_ppp_file.tc_ppp04b,    #变更前品名
         ima021_2   LIKE ima_file.ima021,          #规格
         ima25_2    LIKE ima_file.ima25,           #库存单位
         tc_ppp05b  LIKE tc_ppp_file.tc_ppp05b,    #变更前需求量
         tc_ppp06b  LIKE tc_ppp_file.tc_ppp06b,    #变更前需求日
         tc_ppp09b  LIKE tc_ppp_file.tc_ppp09b,    #变更前预算未税单价
         tc_ppp10b  LIKE tc_ppp_file.tc_ppp10b,    #变更前预算含税单价
         tc_ppp11b  LIKE tc_ppp_file.tc_ppp11b,    #变更前预算未税金额
         tc_ppp12b  LIKE tc_ppp_file.tc_ppp12b,    #变更前预算含税金额
         tc_ppp17b  LIKE tc_ppp_file.tc_ppp17b,     #变更前预算明细
         tc_ppp17b_desc  LIKE azf_file.azf03    #变更前预算明细说明
                   END RECORD,

       g_tc_ppp_t  RECORD
         tc_ppp02   LIKE tc_ppp_file.tc_ppp02,     #项次
         tc_ppp18   LIKE tc_ppp_file.tc_ppp18,     #变更类型
         tc_ppp19   LIKE tc_ppp_file.tc_ppp19,     #变更项次
         tc_ppp03a  LIKE tc_ppp_file.tc_ppp03a,    #变更前料件编号
         tc_ppp04a  LIKE tc_ppp_file.tc_ppp04a,    #变更前品名
         ima021_1   LIKE ima_file.ima021,          #规格
         ima25_1    LIKE ima_file.ima25,           #库存单位
         tc_ppp05a  LIKE tc_ppp_file.tc_ppp05a,    #变更前需求量
         tc_ppp06a  LIKE tc_ppp_file.tc_ppp06a,    #变更前需求日
         tc_ppp07   LIKE tc_ppp_file.tc_ppp07,     #转请购量
         tc_ppp09a  LIKE tc_ppp_file.tc_ppp09a,    #变更前预算未税单价
         tc_ppp10a  LIKE tc_ppp_file.tc_ppp10a,    #变更前预算含税单价
         tc_ppp11a  LIKE tc_ppp_file.tc_ppp11a,    #变更前预算未税金额
         tc_ppp12a  LIKE tc_ppp_file.tc_ppp12a,    #变更前预算含税金额
         tc_ppp17a  LIKE tc_ppp_file.tc_ppp17a,    #变更前预算明细
         tc_ppp17a_desc   LIKE azf_file.azf03,    #变更前预算明细说明

         tc_ppp03b  LIKE tc_ppp_file.tc_ppp03b,    #变更前料件编号
         tc_ppp04b  LIKE tc_ppp_file.tc_ppp04b,    #变更前品名
         ima021_2   LIKE ima_file.ima021,          #规格
         ima25_2    LIKE ima_file.ima25,           #库存单位
         tc_ppp05b  LIKE tc_ppp_file.tc_ppp05b,    #变更前需求量
         tc_ppp06b  LIKE tc_ppp_file.tc_ppp06b,    #变更前需求日
         tc_ppp09b  LIKE tc_ppp_file.tc_ppp09b,    #变更前预算未税单价
         tc_ppp10b  LIKE tc_ppp_file.tc_ppp10b,    #变更前预算含税单价
         tc_ppp11b  LIKE tc_ppp_file.tc_ppp11b,    #变更前预算未税金额
         tc_ppp12b  LIKE tc_ppp_file.tc_ppp12b,    #变更前预算含税金额
         tc_ppp17b  LIKE tc_ppp_file.tc_ppp17b,     #变更前预算明细
         tc_ppp17b_desc  LIKE azf_file.azf03    #变更前预算明细说明
                   END RECORD,

       g_tc_ppp_2 RECORD LIKE tc_ppp_file.*,

       g_wc        STRING,
       g_wc2       STRING,                       #單身CONSTRUCT結果
       g_rec_b     LIKE type_file.num5,
       l_ac        LIKE type_file.num5,
       l_ac_t      LIKE type_file.num5,
       g_sql       STRING

DEFINE g_forupd_sql          STRING         #SELECT ... FOR UPDATE  SQL        #No.FUN-680102
DEFINE g_before_input_done   LIKE type_file.num5          #判斷是否已執行 Before Input指令        #No.FUN-680102 SMALLINT
DEFINE g_chr                 LIKE azb_file.azbacti        #No.FUN-680102 VARCHAR(1)
DEFINE g_cnt                 LIKE type_file.num10         #No.FUN-680102 INTEGER
DEFINE g_i                   LIKE type_file.num5          #count/index for any purpose        #No.FUN-680102 SMALLINT
DEFINE g_msg                 LIKE type_file.chr1000       #No.FUN-680102 VARCHAR(72)
DEFINE g_curs_index          LIKE type_file.num10         #No.FUN-680102 INTEGER
DEFINE g_row_count           LIKE type_file.num10         #總筆數        #No.FUN-680102 INTEGER
DEFINE g_jump                LIKE type_file.num10         #查詢指定的筆數        #No.FUN-680102 INTEGER
DEFINE mi_no_ask             LIKE type_file.num5
DEFINE g_gec07               LIKE gec_file.gec07
DEFINE g_chr2                LIKE azb_file.azbacti        #No.FUN-680102 VARCHAR(1)
DEFINE g_chr3                LIKE azb_file.azbacti        #No.FUN-680102 VARCHAR(1)
DEFINE g_pjb01     LIKE pjb_file.pjb01
DEFINE g_pjb15     LIKE pjb_file.pjb15
DEFINE g_pja02     LIKE pja_file.pja02
DEFINE g_pjb03     LIKE pjb_file.pjb03
DEFINE g_pjb16     LIKE pjb_file.pjb16
DEFINE g_pjaud07   LIKE pja_file.pjaud07
DEFINE g_gen02     LIKE gen_file.gen02
DEFINE g_argv1     LIKE tc_ppp_file.tc_ppp22
DEFINE g_argv2     STRING
DEFINE g_argv3     STRING
DEFINE   g_laststage     LIKE type_file.chr1
DEFINE gs_location  STRING
MAIN
    OPTIONS
        INPUT NO WRAP
    DEFER INTERRUPT                            #擷取中斷鍵

   IF (NOT cl_user()) THEN
      EXIT PROGRAM
   END IF

   WHENEVER ERROR CALL cl_err_msg_log

   IF (NOT cl_setup("CPJ")) THEN
      EXIT PROGRAM
   END IF

   CALL  cl_used(g_prog,g_time,1) RETURNING g_time
   INITIALIZE g_tc_ppp_1.* TO NULL

   LET g_argv1 = ARG_VAL(1)
   LET g_argv2 = ARG_VAL(2)
   LET g_argv3 = ARG_VAL(3)

   IF fgl_getenv('EASYFLOW') = "1" THEN    #判斷是否為簽核模式
      LET g_argv1 = aws_efapp_wsk(1)       #取得單號
      LET g_argv2 = aws_efapp_wsk(2)       #取得單號
   END IF

   LET g_forupd_sql = "SELECT tc_ppp01,tc_ppp21  FROM tc_ppp_file WHERE tc_ppp01 = ? and tc_ppp21 = ? FOR UPDATE "
   LET g_forupd_sql = cl_forupd_sql(g_forupd_sql)
   DECLARE t150_cl CURSOR FROM g_forupd_sql

   IF (g_bgjob = 'N' OR cl_null(g_bgjob)) AND g_argv1 IS NULL THEN
   OPEN WINDOW t150_w WITH FORM "cpj/42f/cpjt150"
       ATTRIBUTE (STYLE = g_win_style CLIPPED)
   CALL cl_ui_init()
   END IF

   CALL aws_efapp_toolbar()
    IF NOT cl_null(g_argv1) THEN
       CASE g_argv3
          WHEN "query"
             LET g_action_choice = "query"
             IF cl_chk_act_auth() THEN
                CALL t150_q()
             END IF
          WHEN "insert"
             LET g_action_choice = "insert"
             IF cl_chk_act_auth() THEN
                CALL t150_a()
             END IF
          #FUN-B60116 add str---
          WHEN "efconfirm"
             CALL t150_q()
             CALL t150_confirm()       #CALL 原確認的 update 段
             EXIT PROGRAM
          #FUN-B60116 add end---
          OTHERWISE          #TQC-660067 add
             CALL t150_q()   #TQC-660067 add
       END CASE
    END IF
   LET g_action_choice = ""
   CALL t150_menu()

   CLOSE WINDOW t150_w

   CALL  cl_used(g_prog,g_time,2) RETURNING g_time
END MAIN

FUNCTION t150_cs()
    IF g_argv1 IS NOT NULL THEN
    LET g_wc = " tc_ppp15 = '",g_argv1,"' AND tc_ppp21 = '",g_argv2,"'"
    ELSE
    CLEAR FORM
    INITIALIZE g_tc_ppp_1.* TO NULL
    CONSTRUCT g_wc ON                     # 螢幕上取條件
        tc_ppp01,tc_ppp15,tc_ppp16,tc_ppp08,tc_pppconf,tc_ppp23,
        tc_ppp02,tc_ppp18,tc_ppp19,tc_ppp03a,tc_ppp04a,tc_ppp05a,tc_ppp06a,
                          tc_ppp03b,tc_ppp04b,tc_ppp05b,tc_ppp06b
        FROM tc_ppp01,tc_ppp15,tc_ppp16,tc_ppp08,tc_pppconf,tc_ppp23,
             s_tc_ppp[1].tc_ppp02,s_tc_ppp[1].tc_ppp18,s_tc_ppp[1].tc_ppp19,s_tc_ppp[1].tc_ppp03a,s_tc_ppp[1].tc_ppp04a,s_tc_ppp[1].tc_ppp05a,s_tc_ppp[1].tc_ppp06a,
                                                       s_tc_ppp[1].tc_ppp03b,s_tc_ppp[1].tc_ppp04b,s_tc_ppp[1].tc_ppp05b,s_tc_ppp[1].tc_ppp06b
              BEFORE CONSTRUCT
                 CALL cl_qbe_init()

        ON ACTION controlp
           CASE
              WHEN INFIELD(tc_ppp01)
                 CALL cl_init_qry_var()
                 LET g_qryparam.form = "cq_tc_ppp01"
                 LET g_qryparam.state = "c"
                 LET g_qryparam.default1 = g_tc_ppp_1.tc_ppp01
                 CALL cl_create_qry() RETURNING g_qryparam.multiret
                 DISPLAY g_qryparam.multiret TO tc_ppp01
                 NEXT FIELD tc_ppp01

              WHEN INFIELD(tc_ppp15)
                 CALL cl_init_qry_var()
                 LET g_qryparam.form = "cq_tc_ppp15"
                 LET g_qryparam.state = "c"
                 LET g_qryparam.default1 = g_tc_ppp_1.tc_ppp15
                 CALL cl_create_qry() RETURNING g_qryparam.multiret
                 DISPLAY g_qryparam.multiret TO tc_ppp15
                 NEXT FIELD tc_ppp15

              WHEN INFIELD(tc_ppp16)
                 CALL cl_init_qry_var()
                 LET g_qryparam.form = "q_gen"
                 LET g_qryparam.state = "c"
                 LET g_qryparam.default1 = g_tc_ppp_1.tc_ppp16
                 CALL cl_create_qry() RETURNING g_qryparam.multiret
                 DISPLAY g_qryparam.multiret TO tc_ppp16
                 NEXT FIELD tc_ppp16

              WHEN INFIELD(tc_ppp08)
                 CALL cl_init_qry_var()
                 LET g_qryparam.form = "cq_gec001"
                 LET g_qryparam.state = "c"
                 LET g_qryparam.default1 = g_tc_ppp_1.tc_ppp08
                 CALL cl_create_qry() RETURNING g_qryparam.multiret
                 DISPLAY g_qryparam.multiret TO tc_ppp08
                 NEXT FIELD tc_ppp08

              WHEN INFIELD(tc_ppp03a)
                 CALL q_sel_ima( TRUE, "q_ima","","","","","","","",'')  RETURNING  g_qryparam.multiret
                 DISPLAY g_qryparam.multiret TO tc_ppp03a
                 NEXT FIELD tc_ppp03a

              WHEN INFIELD(tc_ppp03b)
                 CALL q_sel_ima( TRUE, "q_ima","","","","","","","",'')  RETURNING  g_qryparam.multiret
                 DISPLAY g_qryparam.multiret TO tc_ppp03b
                 NEXT FIELD tc_ppp03b
              OTHERWISE
                 EXIT CASE
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
    END IF
    LET g_sql="SELECT DISTINCT tc_ppp01,tc_ppp21,tc_ppp15,tc_ppp22,tc_ppp16,tc_ppp08,tc_ppp20 FROM tc_ppp_file ", # 組合出 SQL 指令
        " WHERE ",g_wc CLIPPED, " ORDER BY tc_ppp01"
    PREPARE t150_prepare FROM g_sql
    DECLARE t150_cs                                # SCROLL CURSOR
        SCROLL CURSOR WITH HOLD FOR t150_prepare
    DROP TABLE x

    LET g_sql="SELECT DISTINCT tc_ppp01,tc_ppp21,tc_ppp15,tc_ppp22,tc_ppp16,tc_ppp08,tc_ppp20 FROM tc_ppp_file ",
              " WHERE ",g_wc CLIPPED,
              " INTO TEMP x"
    PREPARE t150_ins_temp_pre FROM g_sql
    EXECUTE t150_ins_temp_pre

    LET g_sql=
        "SELECT COUNT(*) FROM x "
    PREPARE t150_precount FROM g_sql
    DECLARE t150_count CURSOR FOR t150_precount
END FUNCTION

FUNCTION t150_menu()
 DEFINE l_creator      LIKE type_file.chr1    #No.FUN-B60116  VARCHAR(1)  #是否退回填表人
 DEFINe l_flowuser     LIKE type_file.chr1    #No.FUN-B60116  VARCHAR(1)  #是否有指定加簽人員

   LET l_flowuser = "N"  #FUN-B60116 add
   WHILE TRUE
      CALL t150_bp("G")
      CASE g_action_choice
         WHEN "insert"
            IF cl_chk_act_auth() THEN
               CALL t150_a()
            END IF

         WHEN "query"
            IF cl_chk_act_auth() THEN
               CALL t150_q()
            END IF

        WHEN "delete"
           IF cl_chk_act_auth() THEN
              CALL t150_r()
           END IF

        WHEN "confirm"
           IF cl_chk_act_auth() THEN
              CALL t150_confirm()
           END IF

        WHEN "undo_confirm"
           IF cl_chk_act_auth() THEN
              CALL t150_undo_confirm()
           END IF
        WHEN "change_release"
           IF cl_chk_act_auth() THEN
              CALL t150_change_release()
           END IF

         WHEN "detail"
            IF cl_chk_act_auth() THEN
               CALL t150_b()
            ELSE
               LET g_action_choice = NULL
            END IF

         WHEN "help"
            CALL cl_show_help()

         WHEN "exit"
            EXIT WHILE

         WHEN "controlg"
            CALL cl_cmdask()

         WHEN "exporttoexcel"     #FUN-4B0025
            IF cl_chk_act_auth() THEN
              CALL cl_export_to_excel(ui.Interface.getRootNode(),base.TypeInfo.create(g_tc_ppp),'','')
            END IF
         WHEN "related_document"  #相關文件
              IF cl_chk_act_auth() THEN
                 IF g_tc_ppp_1.tc_ppp01 IS NOT NULL THEN
                 # mark by lixwz 171219 s
                 #LET g_doc.column1 = "tc_ppp01"
                 #LET g_doc.value1 = g_tc_ppp_1.tc_ppp01
                 # mark by lixwz 171219 e
                 # add by lixwz 171219 s
                 LET g_doc.column1 = "tc_ppp15"
                 LET g_doc.value1 = g_tc_ppp_1.tc_ppp15
                 LET g_doc.column2 = "tc_ppp21"
                 LET g_doc.value2 = g_tc_ppp_1.tc_ppp21
                 # add by lixwz 171219 e
                 CALL cl_doc()
               END IF
         END IF
         WHEN "excel_export"
              IF cl_chk_act_auth() THEN
                 IF g_tc_ppp_1.tc_ppp01 IS NOT NULL THEN
                    CALL t150_excel()
                    CALL t150_show()
                 END IF
              END IF
          #@WHEN "簽核狀況"
         WHEN "approval_status"
            IF cl_chk_act_auth() THEN
               IF aws_condition2() THEN
                  CALL aws_efstat2()
               END IF
            END IF
        #@WHEN "EasyFlow送簽"
         WHEN "easyflow_approval"
            IF cl_chk_act_auth() THEN
              #FUN-C20027 add str---
               #SELECT * INTO g_tc_ppp_1.* FROM tc_ppp_file  #这里可能需要改动一下
               # WHERE tc_ppp22 = g_tc_ppp_1.tc_ppp22
               CALL t150_show()
               CALL t150_b_fill(' 1=1')
               CALL t150_ef()
               CALL t150_show()
            END IF

        #@WHEN "准"
         WHEN "agree"
            IF g_laststage = "Y" AND l_flowuser = "N" THEN #最後一關且無加簽
               CALL t150_confirm()
               CALL t150_show()
              ELSE
                 LET g_success = "Y"
               IF NOT aws_efapp_formapproval() THEN        #執行EF簽核
                    LET g_success = "N"
                 END IF
              END IF
              IF g_success = 'Y' THEN
               IF cl_confirm('aws-081') THEN            #詢問是否繼續下一筆資料的簽核
                  IF aws_efapp_getnextforminfo() THEN   #取得下一筆簽核單號
                          LET g_argv1 = aws_efapp_wsk(1)   #參數:key-1
                     IF NOT cl_null(g_argv1) THEN       #自動query帶出資料
                                CALL t150_q()
                        #設定簽核功能及哪些 action 在簽核狀態時是不可被執行的
                        #CALL aws_efapp_flowaction("insert, modify, delete, reproduce, detail, query, locale, void, undo_void, confirm,undo_confirm,easyflow_approval")  #CHI-D20010 add undo_void
                        #   RETURNING g_laststage
                          ELSE
                              EXIT WHILE
                          END IF
                        ELSE
                              EXIT WHILE
                        END IF
                    ELSE
                       EXIT WHILE
                    END IF
              END IF

         #@WHEN "不准"
         WHEN "deny"
            IF (l_creator := aws_efapp_backflow()) IS NOT NULL THEN   #退回關卡
               IF aws_efapp_formapproval() THEN                       #執行EF簽核
                  IF l_creator = "Y" THEN                             #當退回填表人時
                     LET g_tc_ppp_1.tc_ppp23 = 'R'                            #顯示狀態碼為"R"送簽退回
                      DISPLAY BY NAME g_tc_ppp_1.tc_ppp23
                   END IF
                  IF cl_confirm('aws-081') THEN                       #詢問是否繼續下一筆資料的簽核
                     IF aws_efapp_getnextforminfo() THEN              #取得下一筆簽核單號
                          LET g_argv1 = aws_efapp_wsk(1)   #參數:key-1
                        IF NOT cl_null(g_argv1) THEN                  #自動query帶出資料
                                CALL t150_q()
                           #設定簽核功能及哪些 action 在簽核狀態時是不可被執行的
                           #CALL aws_efapp_flowaction("insert, modify, delete,reproduce, detail, query, locale,void, undo_void, confirm,undo_confirm, undo_confirm,easyflow_approval")  #CHI-D20010 add undo_void
                           #   RETURNING g_laststage
                          ELSE
                                EXIT WHILE
                          END IF
                      ELSE
                            EXIT WHILE
                      END IF
                   ELSE
                      EXIT WHILE
                   END IF
                END IF
              END IF

         #@WHEN "加簽"
         WHEN "modify_flow"
              IF aws_efapp_flowuser() THEN   #選擇欲加簽人員
                 LET l_flowuser = 'Y'
              ELSE
                 LET l_flowuser = 'N'
              END IF

         #@WHEN "撤簽"
         WHEN "withdraw"
              IF cl_confirm("aws-080") THEN
                 IF aws_efapp_formapproval() THEN
                    EXIT WHILE
                 END IF
              END IF

         #@WHEN "抽單"
         WHEN "org_withdraw"
              IF cl_confirm("aws-079") THEN
                 IF aws_efapp_formapproval() THEN
                    EXIT WHILE
                 END IF
              END IF

        #@WHEN "簽核意見"
         WHEN "phrase"
              CALL aws_efapp_phrase()
      END CASE
   END WHILE
END FUNCTION

FUNCTION t150_bp(p_ud)
DEFINE   p_ud   LIKE type_file.chr1

   IF p_ud <> "G" OR g_action_choice = "detail" THEN
      RETURN
   END IF

   LET g_action_choice = " "

   CALL cl_set_act_visible("accept,cancel", FALSE)
   DISPLAY ARRAY g_tc_ppp TO s_tc_ppp.* ATTRIBUTE(COUNT=g_rec_b,UNBUFFERED)

      BEFORE DISPLAY
         CALL cl_navigator_setting( g_curs_index, g_row_count )

      BEFORE ROW
         LET l_ac = ARR_CURR()
         CALL cl_show_fld_cont()                   #No.FUN-550037 hmf

      ON ACTION insert
         LET g_action_choice="insert"
         EXIT DISPLAY

      ON ACTION query
         LET g_action_choice="query"
         EXIT DISPLAY

      ON ACTION delete
         LET g_action_choice="delete"
         EXIT DISPLAY
      ON ACTION confirm
         LET g_action_choice="confirm"
         EXIT DISPLAY
      ON ACTION undo_confirm
         LET g_action_choice="undo_confirm"
         EXIT DISPLAY
      ON ACTION change_release
         LET g_action_choice="change_release"
         EXIT DISPLAY
      ON ACTION modify
         LET g_action_choice="modify"
         EXIT DISPLAY

      ON ACTION first
         CALL t150_fetch('F')
         CALL cl_navigator_setting(g_curs_index, g_row_count)
         CALL fgl_set_arr_curr(1)
         ACCEPT DISPLAY   #FUN-530067(smin)

      ON ACTION previous
         CALL t150_fetch('P')
         CALL cl_navigator_setting(g_curs_index, g_row_count)
         CALL fgl_set_arr_curr(1)
         ACCEPT DISPLAY   #FUN-530067(smin)

      ON ACTION jump
         CALL t150_fetch('/')
         CALL cl_navigator_setting(g_curs_index, g_row_count)
         CALL fgl_set_arr_curr(1)
         ACCEPT DISPLAY   #FUN-530067(smin)

      ON ACTION next
         CALL t150_fetch('N')
         CALL cl_navigator_setting(g_curs_index, g_row_count)
         CALL fgl_set_arr_curr(1)
         ACCEPT DISPLAY   #FUN-530067(smin)

      ON ACTION last
         CALL t150_fetch('L')
         CALL cl_navigator_setting(g_curs_index, g_row_count)
         CALL fgl_set_arr_curr(1)
         ACCEPT DISPLAY   #FUN-530067(smin)



      ON ACTION detail
         LET g_action_choice="detail"
         LET l_ac = 1
         EXIT DISPLAY

      ON ACTION help
         LET g_action_choice="help"
         EXIT DISPLAY

      ON ACTION locale
         CALL cl_dynamic_locale()
         CALL cl_show_fld_cont()                   #No.FUN-550037 hmf

      ON ACTION exit
         LET g_action_choice="exit"
         EXIT DISPLAY

      ON ACTION controlg
         LET g_action_choice="controlg"
         EXIT DISPLAY

      ON ACTION accept
         LET g_action_choice="detail"
         LET l_ac = ARR_CURR()
         EXIT DISPLAY

      ON ACTION cancel
         LET INT_FLAG=FALSE          #MOD-570244  mars
         LET g_action_choice="exit"
         EXIT DISPLAY

      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121

      ON ACTION exporttoexcel       #FUN-4B0025
         LET g_action_choice = 'exporttoexcel'
         EXIT DISPLAY
       #@ON ACTION 簽核狀況
      ON ACTION approval_status
         LET g_action_choice="approval_status"
         EXIT DISPLAY

    #@ON ACTION easyflow送簽
      ON ACTION easyflow_approval
         LET g_action_choice = "easyflow_approval"
         EXIT DISPLAY

      ON ACTION agree
         LET g_action_choice = 'agree'
         EXIT DISPLAY

      ON ACTION deny
         LET g_action_choice = 'deny'
         EXIT DISPLAY

      ON ACTION modify_flow
         LET g_action_choice = 'modify_flow'
         EXIT DISPLAY

      ON ACTION withdraw
         LET g_action_choice = 'withdraw'
         EXIT DISPLAY

      ON ACTION org_withdraw
         LET g_action_choice = 'org_withdraw'
         EXIT DISPLAY

      ON ACTION phrase
         LET g_action_choice = 'phrase'
         EXIT DISPLAY
      AFTER DISPLAY
         CONTINUE DISPLAY

      ON ACTION controls                           #No.FUN-6B0032
         CALL cl_set_head_visible("","AUTO")       #No.FUN-6B0032

      ON ACTION related_document                #No.FUN-6A0162  相關文件
         LET g_action_choice="related_document"
         EXIT DISPLAY
      ON ACTION excel_export
         LET g_action_choice="excel_export"
         EXIT DISPLAY

   END DISPLAY
   CALL cl_set_act_visible("accept,cancel", TRUE)
END FUNCTION

FUNCTION t150_q()

    LET g_row_count = 0
    LET g_curs_index = 0
    CALL cl_navigator_setting(g_curs_index,g_row_count)
    INITIALIZE g_tc_ppp_1.* TO NULL            #No.FUN-6A0015
    CALL g_tc_ppp.clear()
    MESSAGE ""
    CALL cl_opmsg('q')
    DISPLAY ' ' TO FORMONLY.cnt
    CALL t150_cs()                      # 宣告 SCROLL CURSOR
    IF INT_FLAG THEN
        LET INT_FLAG = 0
        CLEAR FORM
        RETURN
    END IF
    OPEN t150_count
    FETCH t150_count INTO g_row_count
    DISPLAY g_row_count TO FORMONLY.cnt
    OPEN t150_cs                          # 從DB產生合乎條件TEMP(0-30秒)
    IF SQLCA.sqlcode THEN
        CALL cl_err(g_tc_ppp_1.tc_ppp01,SQLCA.sqlcode,0)
        INITIALIZE g_tc_ppp_1.* TO NULL
    ELSE
        CALL t150_fetch('F')              # 讀出TEMP第一筆並顯示
    END IF
END FUNCTION

FUNCTION t150_fetch(p_flag)
DEFINE p_flag     LIKE type_file.chr1

    CASE p_flag
        WHEN 'N' FETCH NEXT     t150_cs INTO g_tc_ppp_1.tc_ppp01,g_tc_ppp_1.tc_ppp21,g_tc_ppp_1.tc_ppp15,g_tc_ppp_1.tc_ppp22,g_tc_ppp_1.tc_ppp16,g_tc_ppp_1.tc_ppp08,g_tc_ppp_1.tc_ppp20
        WHEN 'P' FETCH PREVIOUS t150_cs INTO g_tc_ppp_1.tc_ppp01,g_tc_ppp_1.tc_ppp21,g_tc_ppp_1.tc_ppp15,g_tc_ppp_1.tc_ppp22,g_tc_ppp_1.tc_ppp16,g_tc_ppp_1.tc_ppp08,g_tc_ppp_1.tc_ppp20
        WHEN 'F' FETCH FIRST    t150_cs INTO g_tc_ppp_1.tc_ppp01,g_tc_ppp_1.tc_ppp21,g_tc_ppp_1.tc_ppp15,g_tc_ppp_1.tc_ppp22,g_tc_ppp_1.tc_ppp16,g_tc_ppp_1.tc_ppp08,g_tc_ppp_1.tc_ppp20
        WHEN 'L' FETCH LAST     t150_cs INTO g_tc_ppp_1.tc_ppp01,g_tc_ppp_1.tc_ppp21,g_tc_ppp_1.tc_ppp15,g_tc_ppp_1.tc_ppp22,g_tc_ppp_1.tc_ppp16,g_tc_ppp_1.tc_ppp08,g_tc_ppp_1.tc_ppp20
        WHEN '/'
            IF (NOT mi_no_ask) THEN
               CALL cl_getmsg('fetch',g_lang) RETURNING g_msg
               LET INT_FLAG = 0
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
            FETCH ABSOLUTE g_jump t150_cs INTO g_tc_ppp_1.tc_ppp01,g_tc_ppp_1.tc_ppp21,g_tc_ppp_1.tc_ppp15,g_tc_ppp_1.tc_ppp22,g_tc_ppp_1.tc_ppp16,g_tc_ppp_1.tc_ppp08,g_tc_ppp_1.tc_ppp20
            LET mi_no_ask = FALSE
    END CASE

    IF SQLCA.sqlcode THEN
        CALL cl_err(g_tc_ppp_1.tc_ppp01,SQLCA.sqlcode,0)
        INITIALIZE g_tc_ppp_1.* TO NULL
        LET g_tc_ppp_1.tc_ppp01 = NULL
        RETURN
    ELSE
      CASE p_flag
         WHEN 'F' LET g_curs_index = 1
         WHEN 'P' LET g_curs_index = g_curs_index - 1
         WHEN 'N' LET g_curs_index = g_curs_index + 1
         WHEN 'L' LET g_curs_index = g_row_count
         WHEN '/' LET g_curs_index = g_jump
      END CASE

      CALL cl_navigator_setting(g_curs_index, g_row_count)
      DISPLAY g_curs_index TO FORMONLY.idx
    END IF
    #这里单头填充
    SELECT tc_pppconf,tc_ppp23,tc_ppporiu,tc_ppporig,tc_pppgrup,tc_pppuser ,tc_pppmksg
          INTO g_tc_ppp_1.tc_pppconf,g_tc_ppp_1.tc_ppp23,g_tc_ppp_1.tc_ppporiu,g_tc_ppp_1.tc_ppporig,
              g_tc_ppp_1.tc_pppgrup,g_tc_ppp_1.tc_pppuser ,g_tc_ppp_1.tc_pppmksg
             FROM tc_ppp_file
             WHERE tc_ppp01 = g_tc_ppp_1.tc_ppp01
               AND tc_ppp21 = g_tc_ppp_1.tc_ppp21



    #===================================
    IF g_argv1 IS NULL THEN
    CALL t150_show()                   # 重新顯示
    END IF
END FUNCTION

FUNCTION t150_show()
    LET g_tc_ppp_1_t.* = g_tc_ppp_1.*
    DISPLAY BY NAME g_tc_ppp_1.*
    SELECT gec07 INTO g_gec07 FROM gec_file WHERE gec01 = g_tc_ppp_1.tc_ppp08
    DISPLAY g_gec07 TO gec07
    SELECT pjb01,pjb03,pjb15,pjb16
        INTO g_pjb01,g_pjb03,g_pjb15,g_pjb16
        FROM pjb_file WHERE pjb02=g_tc_ppp_1.tc_ppp01
    SELECT pja02,pjaud07
        INTO g_pja02,g_pjaud07
        FROM pja_file WHERE pja01 = g_pjb01
    SELECT gen02 INTO g_gen02 FROM gen_file WHERE gen01 = g_tc_ppp_1.tc_ppp16
    DISPLAY g_pjb01,g_pjb03,g_pjb15,g_pjb16,g_pja02,g_pjaud07,g_gen02
            TO  pjb01,pjb03,pjb15,pjb16,pja02,pjaud07,gen02
    CALL t150_pic()
    CALL t150_b_fill(' 1=1')
    CALL cl_show_fld_cont()
END FUNCTION

FUNCTION t150_a()

    MESSAGE ""
    CLEAR FORM                                   # 清螢墓欄位內容
    INITIALIZE g_tc_ppp_1.* TO NULL
    CALL g_tc_ppp.clear()
    LET g_wc = NULL
    CALL cl_opmsg('a')
    WHILE TRUE
        LET g_tc_ppp_1.tc_pppconf = 1
        LET g_tc_ppp_1.tc_ppp23 = 0
        LET g_tc_ppp_1.tc_ppporiu = g_user
        LET g_tc_ppp_1.tc_ppporig = g_grup
        LET g_tc_ppp_1.tc_pppgrup = g_grup
        LET g_tc_ppp_1.tc_pppuser = g_user

        DISPLAY BY NAME g_tc_ppp_1.tc_pppconf,g_tc_ppp_1.tc_ppp23,g_tc_ppp_1.tc_ppporiu,g_tc_ppp_1.tc_ppporig,g_tc_ppp_1.tc_pppgrup,g_tc_ppp_1.tc_pppuser
        CALL t150_i("a")                         # 各欄位輸入
        IF INT_FLAG THEN                         # 若按了DEL鍵
            INITIALIZE g_tc_ppp_1.* TO NULL
            LET INT_FLAG = 0
            CALL cl_err('',9001,0)
            CLEAR FORM
            EXIT WHILE
        END IF
        IF g_tc_ppp_1.tc_ppp01 IS NULL THEN              # KEY 不可空白
            CONTINUE WHILE
        END IF
        LET g_rec_b = 0
        CALL t150_b()
        EXIT WHILE
    END WHILE
    LET g_wc=' '
END FUNCTION

FUNCTION t150_i(p_cmd)
DEFINE l_pjfa RECORD LIKE pjfa_file.*
DEFINE p_cmd  LIKE type_file.chr1
DEFINE l_max  LIKE type_file.num5
DEFINE l_str STRING
DEFINE l_slip LIKE type_file.chr100
   DISPLAY BY NAME g_tc_ppp_1.*

   INPUT BY NAME
      g_tc_ppp_1.tc_ppp01
      WITHOUT DEFAULTS

      BEFORE INPUT
          LET g_before_input_done = FALSE
          CALL t150_set_entry(p_cmd)
          CALL t150_set_no_entry(p_cmd)
          LET g_before_input_done = TRUE

      AFTER FIELD tc_ppp01
          SELECT * INTO l_pjfa.* FROM pjfa_file WHERE pjfa01 = g_tc_ppp_1.tc_ppp01

          LET g_tc_ppp_1.tc_ppp08 = l_pjfa.ta_pjfa02
          LET g_tc_ppp_1.tc_ppp15 = l_pjfa.ta_pjfa12
          LET g_tc_ppp_1.tc_ppp16 = l_pjfa.ta_pjfa13
          LET g_tc_ppp_1.tc_ppp20 = l_pjfa.ta_pjfa09
          SELECT gec07 INTO g_gec07 FROM gec_file WHERE gec01 = g_tc_ppp_1.tc_ppp08
          DISPLAY g_gec07 TO gec07
          SELECT pjb01,pjb03,pjb15,pjb16
               INTO g_pjb01,g_pjb03,g_pjb15,g_pjb16
          FROM pjb_file WHERE pjb02=g_tc_ppp_1.tc_ppp01
          SELECT pja02,pjaud07
               INTO g_pja02,g_pjaud07
           FROM pja_file WHERE pja01 = g_pjb01
          SELECT gen02 INTO g_gen02 FROM gen_file WHERE gen01 = g_tc_ppp_1.tc_ppp16
          DISPLAY g_pjb01,g_pjb03,g_pjb15,g_pjb16,g_pja02,g_pjaud07 ,g_gen02
                TO  pjb01,pjb03,pjb15,pjb16,pja02,pjaud07 ,gen02
          SELECT MAX(tc_ppp21) INTO l_max FROM tc_ppp_file WHERE tc_ppp01 = g_tc_ppp_1.tc_ppp01
          IF l_max IS NULL THEN LET l_max = 0 END IF
          LET l_max = l_max + 1
          LET g_tc_ppp_1.tc_ppp21 = l_max
          LET l_str = l_max
          LET g_tc_ppp_1.tc_ppp22 = g_tc_ppp_1.tc_ppp15 CLIPPED,"-" CLIPPED,l_str
          SELECT replace(g_tc_ppp_1.tc_ppp22,'-','') FROM dual
          SELECT substr(g_tc_ppp_1.tc_ppp22,1,4) INTO l_slip FROM dual
          SELECT smyapr INTO g_tc_ppp_1.tc_pppmksg FROM smy_file WHERE smyslip = l_slip
          DISPLAY BY NAME g_tc_ppp_1.tc_pppmksg
          DISPLAY BY NAME g_tc_ppp_1.tc_ppp21
          DISPLAY BY NAME g_tc_ppp_1.tc_ppp08,g_tc_ppp_1.tc_ppp15,g_tc_ppp_1.tc_ppp16,g_tc_ppp_1.tc_ppp20,g_tc_ppp_1.tc_ppp22
      AFTER INPUT
            IF INT_FLAG THEN
               EXIT INPUT
            END IF

     ON ACTION controlp
        CASE
           WHEN INFIELD(tc_ppp01)
              CALL cl_init_qry_var()
              LET g_qryparam.form = "cq_pjfa01"
              LET g_qryparam.default1 = g_tc_ppp_1.tc_ppp01
              CALL cl_create_qry() RETURNING g_tc_ppp_1.tc_ppp01
              DISPLAY BY NAME g_tc_ppp_1.tc_ppp01
              NEXT FIELD tc_ppp01

           OTHERWISE
              EXIT CASE
           END CASE

   ON ACTION CONTROLZ
      CALL cl_show_req_fields()

      ON ACTION CONTROLG
         CALL cl_cmdask()

      ON ACTION CONTROLF                        # 欄位說明
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

END FUNCTION

FUNCTION t150_set_entry(p_cmd)
DEFINE p_cmd LIKE type_file.chr1
END FUNCTION

FUNCTION t150_set_no_entry(p_cmd)
DEFINE p_cmd LIKE type_file.chr1

END FUNCTION

FUNCTION cl_set_comp_b_entry(p_cmd)
DEFINE p_cmd LIKE type_file.chr1
   IF g_gec07 = 'Y' THEN
      CALL cl_set_comp_entry('tc_ppp10b',TRUE)
      CALL cl_set_comp_entry('tc_ppp09b',FALSE)
   END IF
END FUNCTION

FUNCTION cl_set_comp_b_no_entry(p_cmd)
DEFINE p_cmd LIKE type_file.chr1

   IF g_gec07 = 'N' THEN
      CALL cl_set_comp_entry('tc_ppp10b',FALSE)
      CALL cl_set_comp_entry('tc_ppp09b',TRUE)
   END IF

END FUNCTION


FUNCTION t150_b()
DEFINE
    l_lock_sw       LIKE type_file.chr1,                #單身鎖住否  #No.FUN-680136 VARCHAR(1)
    p_cmd           LIKE type_file.chr1,                #處理狀態  #No.FUN-680136 VARCHAR(1)
    l_n             LIKE type_file.num5,
    l_allow_insert  LIKE type_file.num5,                #可新增否  #No.FUN-680136 SMALLINT
    l_allow_delete  LIKE type_file.num5
DEFINE l_pjfa RECORD LIKE pjfa_file.*
DEFINE l_cnt  LIKE type_file.num5
    LET g_action_choice = ""

    IF s_shut(0) THEN
       RETURN
    END IF

    IF g_tc_ppp_1.tc_ppp01 IS NULL THEN
       RETURN
    END IF

    IF g_tc_ppp_1.tc_pppconf <> 1 THEN RETURN END IF
    IF (g_tc_ppp_1.tc_ppp23 <> '0' AND g_tc_ppp_1.tc_ppp23 <> 'R' AND g_tc_ppp_1.tc_ppp23 <> 'W') THEN RETURN END IF

    CALL cl_opmsg('b')

    LET g_forupd_sql = " SELECT tc_ppp02,tc_ppp18,tc_ppp19,tc_ppp03a,tc_ppp04a,'','',tc_ppp05a,tc_ppp06a,tc_ppp07,tc_ppp09a,tc_ppp10a, ",
                       " tc_ppp11a,tc_ppp12a,tc_ppp17a,'',tc_ppp03b,tc_ppp04b,'','',tc_ppp05b,tc_ppp06b,tc_ppp09b,tc_ppp10b,tc_ppp11b, ",
                       " tc_ppp12b,tc_ppp17b,'' ",
                       "  FROM tc_ppp_file",
                       "  WHERE tc_ppp01= ? AND tc_ppp21 = ? AND tc_ppp02= ? FOR UPDATE "
    LET g_forupd_sql = cl_forupd_sql(g_forupd_sql)
    DECLARE t150_bcl CURSOR FROM g_forupd_sql      # LOCK CURSOR

    LET l_allow_insert = cl_detail_input_auth("insert")
    LET l_allow_delete = cl_detail_input_auth("delete")

    INPUT ARRAY g_tc_ppp WITHOUT DEFAULTS FROM s_tc_ppp.*
          ATTRIBUTE(COUNT=g_rec_b,MAXCOUNT=g_max_rec,UNBUFFERED,
                    INSERT ROW=l_allow_insert,DELETE ROW=l_allow_delete,
                    APPEND ROW=l_allow_insert)

        BEFORE INPUT
           DISPLAY "BEFORE INPUT!"
           IF g_rec_b != 0 THEN
              CALL fgl_set_arr_curr(l_ac)
              CALL cl_set_comp_b_entry(p_cmd)
              CALL cl_set_comp_b_no_entry(p_cmd)
           END IF

        BEFORE ROW
           DISPLAY "BEFORE ROW!"
           LET p_cmd = ''
           LET l_ac = ARR_CURR()
           LET l_lock_sw = 'N'            #DEFAULT
           LET l_n  = ARR_COUNT()

           BEGIN WORK

           IF g_rec_b >= l_ac THEN
              LET p_cmd='u'
              LET g_tc_ppp_t.* = g_tc_ppp[l_ac].*
              OPEN t150_bcl USING g_tc_ppp_1.tc_ppp01,g_tc_ppp_1.tc_ppp21,g_tc_ppp[l_ac].tc_ppp02
              IF STATUS THEN
                 CALL cl_err("OPEN t150_bcl:", STATUS, 1)
                 LET l_lock_sw = "Y"
              ELSE
                 FETCH t150_bcl INTO g_tc_ppp[l_ac].*
                 IF SQLCA.sqlcode THEN
                    #CALL cl_err(g_tc_ppp_t.tc_ppp03,SQLCA.sqlcode,1)
                    LET l_lock_sw = "Y"
                 END IF
                 #160127
                 SELECT ima021,ima25 INTO g_tc_ppp[l_ac].ima021_1,g_tc_ppp[l_ac].ima25_1 FROM ima_file WHERE ima01 = g_tc_ppp[l_ac].tc_ppp03a
                 SELECT ima021,ima25 INTO g_tc_ppp[l_ac].ima021_2,g_tc_ppp[l_ac].ima25_2 FROM ima_file WHERE ima01 = g_tc_ppp[l_ac].tc_ppp03b
                 SELECT SUM(nvl(pml20,0)) INTO g_tc_ppp[l_ac].tc_ppp07
                        FROM pmk_file,pml_file
                        WHERE pmk01 = pml01
                        AND pmk18 <> 'X'
                        AND pmk05 = g_pjb01
                        AND pml04 = g_tc_ppp[l_ac].tc_ppp03a
                        AND pml90 = g_tc_ppp[l_ac].tc_ppp17a
                 IF g_tc_ppp[l_ac].tc_ppp07 IS NULL THEN LET g_tc_ppp[l_ac].tc_ppp07  = 0 END IF
                 #160127
              END IF
              CALL cl_show_fld_cont()
           END IF

        BEFORE INSERT
           DISPLAY "BEFORE INSERT!"
           LET l_n = ARR_COUNT()
           LET p_cmd='a'
           INITIALIZE g_tc_ppp[l_ac].* TO NULL      #900423
           #LET g_tc_ppp[l_ac].tc_pppacti = 'Y'
           LET g_tc_ppp_t.* = g_tc_ppp[l_ac].*         #新輸入資料
           CALL cl_show_fld_cont()
           NEXT FIELD tc_ppp02
        #单身项次
        BEFORE FIELD tc_ppp02
           IF g_tc_ppp[l_ac].tc_ppp02 IS NULL OR g_tc_ppp[l_ac].tc_ppp02 = 0 THEN
                SELECT MAX(tc_ppp02)+1 INTO g_tc_ppp[l_ac].tc_ppp02
                   FROM tc_ppp_file WHERE tc_ppp01 = g_tc_ppp_1.tc_ppp01
                                      AND tc_ppp21 = g_tc_ppp_1.tc_ppp21
                IF g_tc_ppp[l_ac].tc_ppp02 IS NULL THEN LET g_tc_ppp[l_ac].tc_ppp02=1 END IF
                DISPLAY BY NAME g_tc_ppp[l_ac].tc_ppp02
           END IF

        AFTER FIELD tc_ppp02
           IF NOT cl_null(g_tc_ppp[l_ac].tc_ppp02) THEN
               IF g_tc_ppp[l_ac].tc_ppp02 != g_tc_ppp_t.tc_ppp02 OR
                  g_tc_ppp_t.tc_ppp02 IS NULL THEN
                   SELECT count(*) INTO l_n FROM tc_ppp_file
                       WHERE tc_ppp01 = g_tc_ppp_1.tc_ppp01
                         AND tc_ppp21 = g_tc_ppp_1.tc_ppp21
                         AND tc_ppp02 = g_tc_ppp[l_ac].tc_ppp02
                   IF l_n > 0 THEN
                       LET g_tc_ppp[l_ac].tc_ppp02 = g_tc_ppp_t.tc_ppp02
                       CALL cl_err('',-239,0) NEXT FIELD tc_ppp02
                   END IF
               END IF
            END IF
       #新增还是修改
       AFTER FIELD tc_ppp18
          IF cl_null(g_tc_ppp[l_ac].tc_ppp18) THEN
             #NEXT FIELD CURRENT
          ELSE
             #IF g_tc_ppp[l_ac].tc_ppp18 = 1 THEN #新增
             #   CALL cl_set_comp_entry('',TRUE)
             #   CALL cl_set_comp_entry('',FALSE)
             #ELSE                                #修改
             #   CALL cl_set_comp_entry('',TRUE)
             #   CALL cl_set_comp_entry('',FALSE)
             #END IF
          END IF
       #对应材料项次
       BEFORE FIELD tc_ppp19
          IF cl_null(g_tc_ppp[l_ac].tc_ppp18) THEN
             #NEXT FIELD tc_ppp18
          END IF
       AFTER FIELD tc_ppp19
          IF cl_null(g_tc_ppp[l_ac].tc_ppp19) THEN
             #NEXT FIELD CURRENT
          ELSE
             IF g_tc_ppp[l_ac].tc_ppp18 = 1 THEN
                 SELECT COUNT(*) INTO l_n FROM pjfa_file WHERE pjfa01 = g_tc_ppp_1.tc_ppp01
                                                           AND pjfa02 = g_tc_ppp[l_ac].tc_ppp19
                 IF l_n > 0 THEN
                    CALL cl_err('','cpj-011',1)
                    NEXT FIELD CURRENT
                 END IF
             ELSE
                 SELECT COUNT(*) INTO l_n FROM pjfa_file WHERE pjfa01 = g_tc_ppp_1.tc_ppp01
                                                           AND pjfa02 = g_tc_ppp[l_ac].tc_ppp19
                 IF l_n = 0 THEN
                    CALL cl_err('','cpj-010',1)
                    NEXT FIELD CURRENT
                 END IF
             END IF
             IF p_cmd = 'a' OR g_tc_ppp[l_ac].tc_ppp19 != g_tc_ppp_t.tc_ppp19 OR g_tc_ppp_t.tc_ppp19 IS NULL THEN
             INITIALIZE l_pjfa.* TO NULL
             SELECT * INTO l_pjfa.* FROM pjfa_file WHERE pjfa01 =  g_tc_ppp_1.tc_ppp01
                                                     AND pjfa02 = g_tc_ppp[l_ac].tc_ppp19
             LET  g_tc_ppp[l_ac].tc_ppp03a = l_pjfa.pjfa03
             LET  g_tc_ppp[l_ac].tc_ppp04a = l_pjfa.pjfa04
             LET  g_tc_ppp[l_ac].tc_ppp05a = l_pjfa.pjfa05
             LET  g_tc_ppp[l_ac].tc_ppp06a = l_pjfa.pjfa06
             LET  g_tc_ppp[l_ac].tc_ppp07  = l_pjfa.pjfa07
             LET  g_tc_ppp[l_ac].tc_ppp09a = l_pjfa.ta_pjfa04
             LET  g_tc_ppp[l_ac].tc_ppp10a = l_pjfa.ta_pjfa05
             LET  g_tc_ppp[l_ac].tc_ppp11a = l_pjfa.ta_pjfa06
             LET  g_tc_ppp[l_ac].tc_ppp12a = l_pjfa.ta_pjfa07
             LET  g_tc_ppp[l_ac].tc_ppp17a = l_pjfa.ta_pjfa14

             LET  g_tc_ppp[l_ac].tc_ppp03b = l_pjfa.pjfa03
             LET  g_tc_ppp[l_ac].tc_ppp04b = l_pjfa.pjfa04
             LET  g_tc_ppp[l_ac].tc_ppp05b = l_pjfa.pjfa05
             LET  g_tc_ppp[l_ac].tc_ppp06b = l_pjfa.pjfa06
             LET  g_tc_ppp[l_ac].tc_ppp09b = l_pjfa.ta_pjfa04
             LET  g_tc_ppp[l_ac].tc_ppp10b = l_pjfa.ta_pjfa05
             LET  g_tc_ppp[l_ac].tc_ppp11b = l_pjfa.ta_pjfa06
             LET  g_tc_ppp[l_ac].tc_ppp12b = l_pjfa.ta_pjfa07
             LET  g_tc_ppp[l_ac].tc_ppp17b = l_pjfa.ta_pjfa14
             IF g_tc_ppp[l_ac].tc_ppp03a IS NULL THEN
                 LET g_tc_ppp[l_ac].tc_ppp06b = g_today
                 LET g_tc_ppp[l_ac].tc_ppp06a = ''
             END IF
             SELECT ima021,ima25 INTO g_tc_ppp[l_ac].ima021_1,g_tc_ppp[l_ac].ima25_1 FROM ima_file WHERE ima01 = g_tc_ppp[l_ac].tc_ppp03a
             SELECT ima021,ima25 INTO g_tc_ppp[l_ac].ima021_2,g_tc_ppp[l_ac].ima25_2 FROM ima_file WHERE ima01 = g_tc_ppp[l_ac].tc_ppp03b
             SELECT azf03 INTO  g_tc_ppp[l_ac].tc_ppp17a_desc FROM azf_file WHERE azf01 = g_tc_ppp[l_ac].tc_ppp17a AND azf02 = '2'
             SELECT azf03 INTO  g_tc_ppp[l_ac].tc_ppp17b_desc FROM azf_file WHERE azf01 = g_tc_ppp[l_ac].tc_ppp17b AND azf02 = '2'

             SELECT SUM(nvl(pml20,0)) INTO g_tc_ppp[l_ac].tc_ppp07
                FROM pmk_file,pml_file
                WHERE pmk01 = pml01
                AND pmk18 <> 'X'
                AND pmk05 = g_pjb01
                AND pml04 = g_tc_ppp[l_ac].tc_ppp03a
                AND pml90 = g_tc_ppp[l_ac].tc_ppp17a

             DISPLAY BY NAME g_tc_ppp[l_ac].tc_ppp03a,g_tc_ppp[l_ac].tc_ppp04a,g_tc_ppp[l_ac].tc_ppp05a,g_tc_ppp[l_ac].tc_ppp06a,
                             g_tc_ppp[l_ac].tc_ppp07 ,g_tc_ppp[l_ac].tc_ppp09a,g_tc_ppp[l_ac].tc_ppp10a,g_tc_ppp[l_ac].tc_ppp11a,
                             g_tc_ppp[l_ac].tc_ppp12a,g_tc_ppp[l_ac].tc_ppp17a,
                             g_tc_ppp[l_ac].tc_ppp03b,g_tc_ppp[l_ac].tc_ppp04b,g_tc_ppp[l_ac].tc_ppp05b,g_tc_ppp[l_ac].tc_ppp06b,
                             g_tc_ppp[l_ac].tc_ppp09b,g_tc_ppp[l_ac].tc_ppp10b,g_tc_ppp[l_ac].tc_ppp11b,g_tc_ppp[l_ac].tc_ppp12b,
                             g_tc_ppp[l_ac].tc_ppp17b,g_tc_ppp[l_ac].ima021_1,g_tc_ppp[l_ac].ima25_1,g_tc_ppp[l_ac].ima021_2,g_tc_ppp[l_ac].ima25_2,
                             g_tc_ppp[l_ac].tc_ppp17a_desc,g_tc_ppp[l_ac].tc_ppp17b_desc
             END IF
          END IF

        #变更后的资料
        AFTER FIELD tc_ppp03b  #料号
           IF NOT cl_null(g_tc_ppp[l_ac].tc_ppp03b) THEN
              SELECT count(*) INTO l_n FROM ima_file WHERE ima01 = g_tc_ppp[l_ac].tc_ppp03b
              IF l_n = 0 THEN
                CALL cl_err('','cpj-013',1)  #料件不存在
                NEXT FIELD CURRENT
              END IF
            #IF g_tc_ppp[l_ac].tc_ppp03b = g_tc_ppp[l_ac].tc_ppp03a THEN
            #    CALL cl_err('','cpj-012',1)  #未变更
            #    LET g_tc_ppp[l_ac].tc_ppp03b = ''
            #    NEXT FIELD CURRENT
            #END IF
            SELECT ima02,ima021,ima25 INTO g_tc_ppp[l_ac].tc_ppp04b,g_tc_ppp[l_ac].ima021_2,g_tc_ppp[l_ac].ima25_2 FROM ima_file WHERE ima01 = g_tc_ppp[l_ac].tc_ppp03b
            DISPLAY BY NAME g_tc_ppp[l_ac].tc_ppp04b,g_tc_ppp[l_ac].ima021_2,g_tc_ppp[l_ac].ima25_2
           END IF
        AFTER FIELD tc_ppp05b       #需求量
            IF NOT cl_null(g_tc_ppp[l_ac].tc_ppp05b) THEN
                IF g_tc_ppp[l_ac].tc_ppp05b <= 0 THEN
                  CALL cl_err('','alm-061',0)
                  NEXT FIELD CURRENT
                END IF
                IF g_tc_ppp[l_ac].tc_ppp07 IS NULL THEN LET g_tc_ppp[l_ac].tc_ppp07 = 0 END IF
                IF g_tc_ppp[l_ac].tc_ppp05b < g_tc_ppp[l_ac].tc_ppp07 THEN
                   CALL cl_err('','cpj-022',0)
                   NEXT FIELD CURRENT
                END IF
                #IF g_tc_ppp[l_ac].tc_ppp05b = g_tc_ppp[l_ac].tc_ppp05a THEN
                #   CALL cl_err('','cpj-012',0)  #未变更
                #   NEXT FIELD CURRENT
                #END IF
                LET g_tc_ppp[l_ac].tc_ppp11b = g_tc_ppp[l_ac].tc_ppp05b * g_tc_ppp[l_ac].tc_ppp09b
                LET g_tc_ppp[l_ac].tc_ppp12b = g_tc_ppp[l_ac].tc_ppp05b * g_tc_ppp[l_ac].tc_ppp10b
                LET g_tc_ppp[l_ac].tc_ppp11b =cl_digcut(g_tc_ppp[l_ac].tc_ppp11b,g_azi03)
                LET g_tc_ppp[l_ac].tc_ppp12b =cl_digcut(g_tc_ppp[l_ac].tc_ppp12b,g_azi03)
                DISPLAY BY NAME g_tc_ppp[l_ac].tc_ppp11b,g_tc_ppp[l_ac].tc_ppp12b
            END IF
        #AFTER FIELD tc_ppp06b    #需求日
        #     IF NOT cl_null(g_tc_ppp[l_ac].tc_ppp06b) THEN
        #
        #     END IF
        AFTER FIELD tc_ppp09b     #预算未税单价
            IF g_tc_ppp[l_ac].tc_ppp09b < 0 THEN NEXT FIELD CURRENT ELSE
                IF NOT cl_null(g_tc_ppp[l_ac].tc_ppp09b) THEN
                  CALL t150_set_price(l_ac,1)
                END IF
            END IF

        AFTER FIELD tc_ppp17b
            IF g_tc_ppp[l_ac].tc_ppp17b IS NOT NULL THEN
                 SELECT COUNT(*) INTO l_cnt FROM azf_file WHERE azf01 = g_tc_ppp[l_ac].tc_ppp17b AND azf02 = '2'
                 IF l_cnt = 0 THEN
                    CALL cl_err('','1306',1)
                    NEXT FIELD CURRENT
                 END IF
                 SELECT azf03 INTO  g_tc_ppp[l_ac].tc_ppp17b_desc FROM azf_file WHERE azf01 = g_tc_ppp[l_ac].tc_ppp17b AND azf02 = '2'
                 DISPLAY BY NAME g_tc_ppp[l_ac].tc_ppp17b_desc
            END IF

        AFTER FIELD tc_ppp10b     #预算含税单价
            IF g_tc_ppp[l_ac].tc_ppp10b < 0 THEN NEXT FIELD CURRENT ELSE
              IF NOT cl_null(g_tc_ppp[l_ac].tc_ppp10b) THEN
                  CALL t150_set_price(l_ac,2)
              END IF
            END IF
        AFTER INSERT
           DISPLAY "AFTER INSERT!"
           IF INT_FLAG THEN
              CALL cl_err('',9001,0)
              LET INT_FLAG = 0
              CANCEL INSERT
           END IF

           INSERT INTO tc_ppp_file(tc_ppp01,tc_ppp21,tc_ppp22,tc_ppp15,tc_ppp16,tc_ppp08,tc_ppp20,tc_pppconf,
                    tc_ppp02,tc_ppp18,tc_ppp19,tc_ppp03a,
                    tc_ppp04a,tc_ppp05a,tc_ppp06a,tc_ppp07,
                    tc_ppp09a,tc_ppp10a,
                    tc_ppp11a,tc_ppp12a,tc_ppp17a,tc_ppp03b,
                    tc_ppp04b,tc_ppp05b,tc_ppp06b,tc_ppp09b,
                    tc_ppp10b,tc_ppp11b,tc_ppp12b,tc_ppp17b,
                    tc_ppp23,tc_ppporiu,tc_ppporig,tc_pppgrup,tc_pppuser,tc_pppmksg)
           VALUES(g_tc_ppp_1.tc_ppp01,g_tc_ppp_1.tc_ppp21,g_tc_ppp_1.tc_ppp22,g_tc_ppp_1.tc_ppp15,g_tc_ppp_1.tc_ppp16,g_tc_ppp_1.tc_ppp08,g_tc_ppp_1.tc_ppp20,g_tc_ppp_1.tc_pppconf,
                  g_tc_ppp[l_ac].tc_ppp02,g_tc_ppp[l_ac].tc_ppp18,g_tc_ppp[l_ac].tc_ppp19,g_tc_ppp[l_ac].tc_ppp03a,
                  g_tc_ppp[l_ac].tc_ppp04a,g_tc_ppp[l_ac].tc_ppp05a,g_tc_ppp[l_ac].tc_ppp06a,g_tc_ppp[l_ac].tc_ppp07,
                  g_tc_ppp[l_ac].tc_ppp09a,g_tc_ppp[l_ac].tc_ppp10a,
                  g_tc_ppp[l_ac].tc_ppp11a,g_tc_ppp[l_ac].tc_ppp12a,g_tc_ppp[l_ac].tc_ppp17a,g_tc_ppp[l_ac].tc_ppp03b,
                  g_tc_ppp[l_ac].tc_ppp04b,g_tc_ppp[l_ac].tc_ppp05b,g_tc_ppp[l_ac].tc_ppp06b,g_tc_ppp[l_ac].tc_ppp09b,
                  g_tc_ppp[l_ac].tc_ppp10b,g_tc_ppp[l_ac].tc_ppp11b,g_tc_ppp[l_ac].tc_ppp12b,g_tc_ppp[l_ac].tc_ppp17b,
                  g_tc_ppp_1.tc_ppp23, g_tc_ppp_1.tc_ppporiu,g_tc_ppp_1.tc_ppporig,g_tc_ppp_1.tc_pppgrup,
                  g_tc_ppp_1.tc_pppuser,g_tc_ppp_1.tc_pppmksg)
           IF SQLCA.sqlcode THEN
              CALL cl_err3("ins","tc_ppp_file",g_tc_ppp_1.tc_ppp01,"",SQLCA.sqlcode,"","",1)
              CANCEL INSERT
           ELSE
              MESSAGE 'INSERT O.K'
              COMMIT WORK
              LET g_rec_b=g_rec_b+1
              DISPLAY g_rec_b TO FORMONLY.cn2
           END IF

        #AFTER FIELD tc_ppp03

        BEFORE DELETE                      #是否取消單身
           DISPLAY "BEFORE DELETE"
           IF g_tc_ppp_t.tc_ppp02 IS NOT NULL THEN
              IF NOT cl_delb(0,0) THEN
                 CANCEL DELETE
              END IF
              IF l_lock_sw = "Y" THEN
                 CALL cl_err("", -263, 1)
                 CANCEL DELETE
              END IF
              DELETE FROM tc_ppp_file
               WHERE tc_ppp01 = g_tc_ppp_1.tc_ppp01
                 AND tc_ppp21 = g_tc_ppp_1.tc_ppp21
                 AND tc_ppp02 = g_tc_ppp_t.tc_ppp02
              IF SQLCA.sqlcode THEN
                 CALL cl_err3("del","tc_ppp_file",g_tc_ppp_1.tc_ppp01,"",SQLCA.sqlcode,"","",1)
                 ROLLBACK WORK
                 CANCEL DELETE
              END IF
              LET g_rec_b=g_rec_b-1
              DISPLAY g_rec_b TO FORMONLY.cn2
           END IF
           COMMIT WORK

        ON ROW CHANGE
           IF INT_FLAG THEN
              CALL cl_err('',9001,0)
              LET INT_FLAG = 0
              LET g_tc_ppp[l_ac].* = g_tc_ppp_t.*
              CLOSE t150_bcl
              ROLLBACK WORK
              EXIT INPUT
           END IF
           IF l_lock_sw = 'Y' THEN
             #CALL cl_err(g_tc_ppp[l_ac].tc_ppp03,-263,1)
              LET g_tc_ppp[l_ac].* = g_tc_ppp_t.*
           ELSE
              UPDATE tc_ppp_file SET
                tc_ppp02  = g_tc_ppp[l_ac].tc_ppp02,
                tc_ppp18  = g_tc_ppp[l_ac].tc_ppp18,
                tc_ppp19  = g_tc_ppp[l_ac].tc_ppp19,
                tc_ppp03a = g_tc_ppp[l_ac].tc_ppp03a,
                tc_ppp04a = g_tc_ppp[l_ac].tc_ppp04a,
                tc_ppp05a = g_tc_ppp[l_ac].tc_ppp05a,
                tc_ppp06a = g_tc_ppp[l_ac].tc_ppp06a,
                tc_ppp07  = g_tc_ppp[l_ac].tc_ppp07,
                tc_ppp09a = g_tc_ppp[l_ac].tc_ppp09a,
                tc_ppp10a = g_tc_ppp[l_ac].tc_ppp10a,
                tc_ppp11a = g_tc_ppp[l_ac].tc_ppp11a,
                tc_ppp12a = g_tc_ppp[l_ac].tc_ppp12a,
                tc_ppp17a = g_tc_ppp[l_ac].tc_ppp17a,
                tc_ppp03b = g_tc_ppp[l_ac].tc_ppp03b,
                tc_ppp04b = g_tc_ppp[l_ac].tc_ppp04b,
                tc_ppp05b = g_tc_ppp[l_ac].tc_ppp05b,
                tc_ppp06b = g_tc_ppp[l_ac].tc_ppp06b,
                tc_ppp09b = g_tc_ppp[l_ac].tc_ppp09b,
                tc_ppp10b = g_tc_ppp[l_ac].tc_ppp10b,
                tc_ppp11b = g_tc_ppp[l_ac].tc_ppp11b,
                tc_ppp12b = g_tc_ppp[l_ac].tc_ppp12b,
                tc_ppp17b = g_tc_ppp[l_ac].tc_ppp17b
               WHERE tc_ppp01=g_tc_ppp_1.tc_ppp01
                 AND tc_ppp21 = g_tc_ppp_1.tc_ppp21
                 AND tc_ppp02=g_tc_ppp_t.tc_ppp02
              IF SQLCA.sqlcode OR SQLCA.sqlerrd[3] = 0 THEN
                 CALL cl_err3("upd","tc_ppp_file",g_tc_ppp_1.tc_ppp01,"",SQLCA.sqlcode,"","",1)
                 LET g_tc_ppp[l_ac].* = g_tc_ppp_t.*
              ELSE
                 MESSAGE 'UPDATE O.K'
                 COMMIT WORK
              END IF
           END IF

        AFTER ROW
           DISPLAY  "AFTER ROW!!"
           LET l_ac = ARR_CURR()
           LET l_ac_t = l_ac
           IF INT_FLAG THEN
              CALL cl_err('',9001,0)
              LET INT_FLAG = 0
              IF p_cmd = 'u' THEN
                 LET g_tc_ppp[l_ac].* = g_tc_ppp_t.*
              END IF
              CLOSE t150_bcl
              ROLLBACK WORK
              EXIT INPUT
           END IF
           CLOSE t150_bcl
           COMMIT WORK

        ON ACTION CONTROLZ
           CALL cl_show_req_fields()

        ON ACTION CONTROLG
           CALL cl_cmdask()

        ON ACTION excel_export
                 IF g_tc_ppp_1.tc_ppp01 IS NOT NULL THEN
                    CALL t150_excel()
                    CALL t150_show()
                 END IF

        ON ACTION controlp
           CASE
             WHEN INFIELD(tc_ppp19)
               CALL cl_init_qry_var()
               LET g_qryparam.form = "cq_tc_ppp19"
               LET g_qryparam.arg1= g_tc_ppp_1.tc_ppp01
               CALL cl_create_qry() RETURNING g_tc_ppp[l_ac].tc_ppp19
               DISPLAY BY NAME g_tc_ppp[l_ac].tc_ppp19
               NEXT FIELD tc_ppp19

             WHEN INFIELD(tc_ppp03b) #变更后料号
               CALL q_sel_ima(FALSE, "q_ima", "", g_tc_ppp[l_ac].tc_ppp03b, "", "", "", "" ,"",'' )  RETURNING g_tc_ppp[l_ac].tc_ppp03b
               DISPLAY BY NAME g_tc_ppp[l_ac].tc_ppp03b
               NEXT FIELD tc_ppp03b

             WHEN INFIELD(tc_ppp17b)
              CALL cl_init_qry_var()
              LET g_qryparam.form = "cq_azf01a"
              LET g_qryparam.arg1='7'
              CALL cl_create_qry() RETURNING g_tc_ppp[l_ac].tc_ppp17b
              DISPLAY BY NAME g_tc_ppp[l_ac].tc_ppp17b
              NEXT FIELD tc_ppp17b
           END CASE

      ON ACTION CONTROLF
         CALL cl_set_focus_form(ui.Interface.getRootNode()) RETURNING g_fld_name,g_frm_name #Add on 040913
         CALL cl_fldhelp(g_frm_name,g_fld_name,g_lang) #Add on 040913

      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE INPUT

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121

      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121

      ON ACTION controls                           #No.FUN-6B0032
         CALL cl_set_head_visible("","AUTO")       #No.FUN-6B0032
    END INPUT

    CLOSE t150_bcl
    COMMIT WORK

END FUNCTION

FUNCTION t150_b_fill(p_wc2)
DEFINE p_wc2  STRING

   LET g_sql = "SELECT tc_ppp02,tc_ppp18,tc_ppp19,tc_ppp03a,tc_ppp04a,'','',tc_ppp05a,tc_ppp06a,tc_ppp07,tc_ppp09a,tc_ppp10a, ",
               " tc_ppp11a,tc_ppp12a,tc_ppp17a,'',tc_ppp03b,tc_ppp04b,'','',tc_ppp05b,tc_ppp06b,tc_ppp09b,tc_ppp10b,tc_ppp11b, ",
               " tc_ppp12b,tc_ppp17b,'' ",
               "  FROM tc_ppp_file",
               " WHERE tc_ppp01 = '",g_tc_ppp_1.tc_ppp01,"' ",
               " AND tc_ppp21 = '",g_tc_ppp_1.tc_ppp21,"'"

   IF NOT cl_null(p_wc2) THEN
      LET g_sql=g_sql CLIPPED," AND ",p_wc2 CLIPPED
   END IF
   LET g_sql=g_sql CLIPPED," ORDER BY tc_ppp02 "
   DISPLAY g_sql

   PREPARE t150_pb FROM g_sql
   DECLARE tc_ppp_cs CURSOR FOR t150_pb

   CALL g_tc_ppp.clear()
   LET g_cnt = 1

   FOREACH tc_ppp_cs INTO g_tc_ppp[g_cnt].*   #單身 ARRAY 填充
       IF SQLCA.sqlcode THEN
          CALL cl_err('foreach:',SQLCA.sqlcode,1)
          EXIT FOREACH
       END IF
       SELECT ima021,ima25 INTO g_tc_ppp[g_cnt].ima021_1,g_tc_ppp[g_cnt].ima25_1 FROM ima_file WHERE ima01 = g_tc_ppp[g_cnt].tc_ppp03a
       SELECT ima021,ima25 INTO g_tc_ppp[g_cnt].ima021_2,g_tc_ppp[g_cnt].ima25_2 FROM ima_file WHERE ima01 = g_tc_ppp[g_cnt].tc_ppp03b
       SELECT azf03 INTO  g_tc_ppp[g_cnt].tc_ppp17a_desc FROM azf_file WHERE azf01 = g_tc_ppp[g_cnt].tc_ppp17a AND azf02 = '2'
       SELECT azf03 INTO  g_tc_ppp[g_cnt].tc_ppp17b_desc FROM azf_file WHERE azf01 = g_tc_ppp[g_cnt].tc_ppp17b AND azf02 = '2'

       SELECT SUM(nvl(pml20,0)) INTO g_tc_ppp[g_cnt].tc_ppp07
            FROM pmk_file,pml_file
            WHERE pmk01 = pml01
            AND pmk18 <> 'X'
            AND pmk05 = g_pjb01
            AND pml04 = g_tc_ppp[g_cnt].tc_ppp03a
            AND pml90 = g_tc_ppp[g_cnt].tc_ppp17a
       IF g_tc_ppp[g_cnt].tc_ppp07  IS NULL THEN LET g_tc_ppp[g_cnt].tc_ppp07  = 0 END IF
       LET g_cnt = g_cnt + 1
       IF g_cnt > g_max_rec THEN
          CALL cl_err( '', 9035, 0 )
          EXIT FOREACH
       END IF
   END FOREACH
   CALL g_tc_ppp.deleteElement(g_cnt)

   LET g_rec_b=g_cnt-1
   DISPLAY g_rec_b TO FORMONLY.cn2
   LET g_cnt = 0
END FUNCTION

FUNCTION t150_r()
   IF cl_null(g_tc_ppp_1.tc_ppp01) THEN CALL cl_err("",-400,0)  RETURN END IF
   IF g_tc_ppp_1.tc_pppconf <> 1 THEN RETURN END IF
   IF (g_tc_ppp_1.tc_ppp23 <> '0' AND g_tc_ppp_1.tc_ppp23 <> 'R' AND g_tc_ppp_1.tc_ppp23 <> 'W') THEN RETURN END IF
     BEGIN WORK
   OPEN t150_cl USING g_tc_ppp_1.tc_ppp01,g_tc_ppp_1.tc_ppp21
   IF STATUS THEN
      CALL cl_err(g_tc_ppp_1.tc_ppp01,SQLCA.sqlcode,0)
      CLOSE t150_cl
      ROLLBACK WORK
      RETURN
   END IF
   FETCH t150_cl INTO g_tc_ppp_1.tc_ppp01,g_tc_ppp_1.tc_ppp21
   IF SQLCA.sqlcode THEN                                         #資料被他人LOCK
         CALL cl_err(g_tc_ppp_1.tc_ppp01,SQLCA.sqlcode,0) RETURN END IF
   CALL t150_show()

   IF cl_delh(15,21) THEN                #確認一下
       INITIALIZE g_doc.* TO NULL
       # mark by lixwz 171219 s
       #LET g_doc.column1 = "tc_ppp01"
       #LET g_doc.value1 = g_tc_ppp_1.tc_ppp01
       # mark by lixwz 171219 e
       # add by lixwz 171219 s
       LET g_doc.column1 = "tc_ppp15"
       LET g_doc.value1 = g_tc_ppp_1.tc_ppp15
       LET g_doc.column2 = "tc_ppp21"
       LET g_doc.value2 = g_tc_ppp_1.tc_ppp21
       # add by lixwz 171219 e
       CALL cl_del_doc()
       DELETE FROM tc_ppp_file WHERE tc_ppp01 = g_tc_ppp_1.tc_ppp01
                                 AND tc_ppp21 = g_tc_ppp_1.tc_ppp21
       IF STATUS OR SQLCA.SQLERRD[3]=0 THEN
          CALL cl_err3("del","tc_ppp_file","","",SQLCA.sqlcode,"","BODY DELETE:",1)
          ROLLBACK WORK
          RETURN
       END IF
       CLEAR FORM
       CALL g_tc_ppp.clear()
       MESSAGE ""
       OPEN t150_count #MOD-D60152 add
       FETCH t150_count INTO g_row_count
       IF STATUS OR (cl_null(g_row_count) OR  g_row_count = 0 ) THEN
          CLOSE t150_cl
          CLOSE t150_count
          COMMIT WORK
          RETURN
       END IF

       DISPLAY g_row_count TO FORMONLY.cnt
       OPEN t150_cs
       IF g_curs_index = g_row_count + 1 THEN
          LET g_jump = g_row_count
          CALL t150_fetch('L')
       ELSE
          LET g_jump = g_curs_index
          LET mi_no_ask = TRUE
          CALL t150_fetch('/')
       END IF

    END IF
   CLOSE t150_cl
   COMMIT WORK
END FUNCTION

FUNCTION t150_set_price(l_ac,l_num)
DEFINE l_num LIKE type_file.num5
DEFINE l_ac LIKE type_file.num5
IF l_num = 1 THEN
    LET g_tc_ppp[l_ac].tc_ppp10b=g_tc_ppp[l_ac].tc_ppp09b*(1+0.01*g_tc_ppp_1.tc_ppp20)
    LET g_tc_ppp[l_ac].tc_ppp11b=g_tc_ppp[l_ac].tc_ppp09b*g_tc_ppp[l_ac].tc_ppp05b
    LET g_tc_ppp[l_ac].tc_ppp12b=g_tc_ppp[l_ac].tc_ppp10b*g_tc_ppp[l_ac].tc_ppp05b
END IF

IF l_num = 2 THEN
    LET g_tc_ppp[l_ac].tc_ppp09b=g_tc_ppp[l_ac].tc_ppp10b/(1+0.01*g_tc_ppp_1.tc_ppp20)
    LET g_tc_ppp[l_ac].tc_ppp11b=g_tc_ppp[l_ac].tc_ppp09b*g_tc_ppp[l_ac].tc_ppp05b
    LET g_tc_ppp[l_ac].tc_ppp12b=g_tc_ppp[l_ac].tc_ppp10b*g_tc_ppp[l_ac].tc_ppp05b
END IF

    LET g_tc_ppp[l_ac].tc_ppp09b =cl_digcut(g_tc_ppp[l_ac].tc_ppp09b,g_azi03)
    LET g_tc_ppp[l_ac].tc_ppp10b =cl_digcut(g_tc_ppp[l_ac].tc_ppp10b,g_azi03)
    LET g_tc_ppp[l_ac].tc_ppp11b =cl_digcut(g_tc_ppp[l_ac].tc_ppp11b,g_azi03)
    LET g_tc_ppp[l_ac].tc_ppp12b =cl_digcut(g_tc_ppp[l_ac].tc_ppp12b,g_azi03)
    DISPLAY BY NAME g_tc_ppp[l_ac].tc_ppp09b,g_tc_ppp[l_ac].tc_ppp10b,g_tc_ppp[l_ac].tc_ppp11b,g_tc_ppp[l_ac].tc_ppp12b
END FUNCTION

FUNCTION t150_confirm()
LET g_success = 'Y'
IF g_action_choice CLIPPED = "confirm" THEN
   IF g_tc_ppp_1.tc_pppmksg = 'Y' THEN
      IF g_tc_ppp_1.tc_ppp23 <>'1' THEN
         CALL cl_err('','aws-078',1)
         LET g_success = 'N'
      END IF
   END IF
END IF
IF g_tc_ppp_1.tc_pppconf <> '1' THEN
   RETURN
END IF
BEGIN WORK
    OPEN t150_cl USING g_tc_ppp_1.tc_ppp01,g_tc_ppp_1.tc_ppp21
    IF STATUS THEN
       CALL cl_err("OPEN t150_cl :",STATUS,1)
       CLOSE t150_cl
       ROLLBACK WORK
       RETURN
    END IF

    FETCH t150_cl INTO g_tc_ppp_1.tc_ppp01,g_tc_ppp_1.tc_ppp21,g_tc_ppp_1.tc_ppp15,g_tc_ppp_1.tc_ppp22,g_tc_ppp_1.tc_ppp16,g_tc_ppp_1.tc_ppp08,g_tc_ppp_1.tc_ppp20
    IF SQLCA.sqlcode THEN
     CALL cl_err(g_tc_ppp_1.tc_ppp01,SQLCA.sqlcode,0)      # 資料被他人LOCK
     CLOSE t150_cl ROLLBACK WORK RETURN
    END IF

    UPDATE tc_ppp_file SET tc_pppconf = 2 WHERE tc_ppp01 = g_tc_ppp_1.tc_ppp01
                                                    AND tc_ppp21 = g_tc_ppp_1.tc_ppp21

     IF SQLCA.SQLERRD[3] = 0 THEN
        LET g_success = 'N'
        CALL cl_err('(cpjt150:ckp#1.1)','mfg9328',1)
     ELSE
        IF g_tc_ppp_1.tc_pppmksg = 'N'  THEN      #不須簽核-->核淮
           UPDATE tc_ppp_file SET tc_ppp23 = 1 WHERE tc_ppp01 = g_tc_ppp_1.tc_ppp01
                                                    AND tc_ppp21 = g_tc_ppp_1.tc_ppp21
           IF SQLCA.SQLERRD[3] = 0 THEN
              LET g_success = 'N'
              CALL cl_err('(cpjt150:ckp#1.1)','mfg9328',1)
           ELSE
              LET g_tc_ppp_1.tc_ppp23 = 1
           END IF
        END IF
     END IF

    IF g_success = 'Y' THEN
    IF g_tc_ppp_1.tc_pppmksg  = 'Y' THEN #簽核模式
       CASE aws_efapp_formapproval()            #呼叫 EF 簽核功能
           WHEN 0  #呼叫 EasyFlow 簽核失敗
                LET g_tc_ppp_1.tc_pppconf="1"
                LET g_success = "N"
                ROLLBACK WORK
                RETURN
           WHEN 2  #當最後一關有兩個以上簽核者且此次簽核完成後尚未結案
                LET g_tc_ppp_1.tc_pppconf="1"
                ROLLBACK WORK
                RETURN
       END CASE
    END IF

    IF g_success = 'Y' THEN
       LET g_tc_ppp_1.tc_ppp23='1'      #執行成功, 狀態值顯示為 '1' 已核准
       UPDATE tc_ppp_file SET tc_ppp23 = 1 WHERE tc_ppp01 = g_tc_ppp_1.tc_ppp01
                                                    AND tc_ppp21 = g_tc_ppp_1.tc_ppp21
       IF SQLCA.sqlerrd[3]=0 THEN
          LET g_success='N'
       END IF
       LET g_tc_ppp_1.tc_pppconf='2'    #執行成功, 確認碼顯示為 'Y' 已確認
       DISPLAY BY NAME g_tc_ppp_1.tc_ppp23,g_tc_ppp_1.tc_pppconf
       COMMIT WORK
       CALL cl_flow_notify(g_tc_ppp_1.tc_ppp01,'2') #CHI-A80030 add
    ELSE
       LET g_tc_ppp_1.tc_pppconf='1'
       ROLLBACK WORK
    END IF
 ELSE
    ROLLBACK WORK
 END IF

 SELECT tc_pppconf INTO g_tc_ppp_1.tc_pppconf FROM tc_ppp_file
             WHERE tc_ppp01 = g_tc_ppp_1.tc_ppp01
                                                    AND tc_ppp21 = g_tc_ppp_1.tc_ppp21
 DISPLAY BY NAME g_tc_ppp_1.tc_pppconf
  #CKP
 #IF g_tc_ppp_1.tc_pppconf ='X' THEN LET g_chr='Y' ELSE LET g_chr='N' END IF
 IF g_tc_ppp_1.tc_ppp23  ='1' OR
    g_tc_ppp_1.tc_ppp23  ='3' THEN LET g_chr2='Y' ELSE LET g_chr2='N' END IF
 CALL cl_set_field_pic(g_tc_ppp_1.tc_pppconf,g_chr2,"","",g_chr,"")

    --IF cl_null(g_tc_ppp_1.tc_ppp01) THEN CALL cl_err("",-400,0)  RETURN END IF
    --IF g_tc_ppp_1.tc_pppconf <> 1 THEN RETURN END IF
    --IF g_tc_ppp_1.tc_pppmksg = 'Y' AND g_tc_ppp_1.tc_ppp23 <>'1' AND g_argv1 IS NULL THEN
       #CALL cl_err('','',0)  #需要签核，不可以直接审核
        --RETURN
    --END IF
    --IF (g_bgjob = 'N' OR cl_null(g_bgjob)) AND g_argv1 IS NULL THEN
        --IF cl_confirm('aap-017') THEN
            --UPDATE tc_ppp_file SET tc_pppconf = 2 WHERE tc_ppp01 = g_tc_ppp_1.tc_ppp01
                                                    --AND tc_ppp21 = g_tc_ppp_1.tc_ppp21
            --UPDATE tc_ppp_file SET tc_ppp23 = 1 WHERE tc_ppp01 = g_tc_ppp_1.tc_ppp01
                                                    --AND tc_ppp21 = g_tc_ppp_1.tc_ppp21
            --LET g_tc_ppp_1.tc_pppconf = 2
            --LET g_tc_ppp_1.tc_ppp23 = 1
            --DISPLAY BY NAME g_tc_ppp_1.tc_pppconf,g_tc_ppp_1.tc_ppp23
        --END IF
    --ELSE
            --UPDATE tc_ppp_file SET tc_pppconf = 2 WHERE tc_ppp01 = g_tc_ppp_1.tc_ppp01
                                                    --AND tc_ppp21 = g_tc_ppp_1.tc_ppp21
            --UPDATE tc_ppp_file SET tc_ppp23 = 1 WHERE tc_ppp01 = g_tc_ppp_1.tc_ppp01
                                                    --AND tc_ppp21 = g_tc_ppp_1.tc_ppp21
            --LET g_tc_ppp_1.tc_pppconf = 2
            --LET g_tc_ppp_1.tc_ppp23 = 1
            --DISPLAY BY NAME g_tc_ppp_1.tc_pppconf,g_tc_ppp_1.tc_ppp23
    --END IF
END FUNCTION


FUNCTION t150_undo_confirm()
IF s_shut(0) THEN RETURN END IF
IF g_tc_ppp_1.tc_ppp23 = 'S' THEN
   CALL cl_err(g_tc_ppp_1.tc_ppp23,'apm-030',1)
   RETURN
END IF
IF g_tc_ppp_1.tc_pppconf <> '2' THEN  RETURN END IF
IF cl_null(g_tc_ppp_1.tc_ppp01) THEN CALL cl_err("",-400,0)  RETURN END IF
IF NOT cl_confirm('axm-109') THEN RETURN END IF
LET g_success = 'Y'
BEGIN WORK
    OPEN t150_cl USING g_tc_ppp_1.tc_ppp01,g_tc_ppp_1.tc_ppp21
    IF STATUS THEN
       CALL cl_err("OPEN t150_cl :",STATUS,1)
       CLOSE t150_cl
       ROLLBACK WORK
       RETURN
    END IF

    FETCH t150_cl INTO g_tc_ppp_1.tc_ppp01,g_tc_ppp_1.tc_ppp21,g_tc_ppp_1.tc_ppp15,g_tc_ppp_1.tc_ppp22,g_tc_ppp_1.tc_ppp16,g_tc_ppp_1.tc_ppp08,g_tc_ppp_1.tc_ppp20
    IF SQLCA.sqlcode THEN
     CALL cl_err(g_tc_ppp_1.tc_ppp01,SQLCA.sqlcode,0)      # 資料被他人LOCK
     CLOSE t150_cl ROLLBACK WORK RETURN
    END IF

    UPDATE tc_ppp_file SET tc_pppconf = 1 WHERE tc_ppp01 = g_tc_ppp_1.tc_ppp01
                                                AND tc_ppp21 = g_tc_ppp_1.tc_ppp21
    UPDATE tc_ppp_file SET tc_ppp23 = 0 WHERE tc_ppp01 = g_tc_ppp_1.tc_ppp01
                                                AND tc_ppp21 = g_tc_ppp_1.tc_ppp21
    IF g_success = 'Y' THEN
       COMMIT WORK
       LET g_tc_ppp_1.tc_pppconf = '1'
       LET g_tc_ppp_1.tc_ppp23 = '0'
       DISPLAY BY NAME g_tc_ppp_1.tc_pppconf,g_tc_ppp_1.tc_ppp23
    ELSE
       ROLLBACK WORK
    END IF
    IF g_tc_ppp_1.tc_ppp23  ='1' OR
    g_tc_ppp_1.tc_ppp23  ='3' THEN LET g_chr2='Y' ELSE LET g_chr2='N' END IF
    CALL cl_set_field_pic(g_tc_ppp_1.tc_pppconf,g_chr2,"","",g_chr,"")
    IF g_tc_ppp_1.tc_pppconf <> 2 THEN RETURN END IF
    IF g_tc_ppp_1.tc_pppmksg = 'Y' THEN RETURN END IF

    --IF g_bgjob = 'N' OR cl_null(g_bgjob) THEN
    --IF cl_confirm('aap-224') THEN
        --UPDATE tc_ppp_file SET tc_pppconf = 1 WHERE tc_ppp01 = g_tc_ppp_1.tc_ppp01
                                                --AND tc_ppp21 = g_tc_ppp_1.tc_ppp21
        --UPDATE tc_ppp_file SET tc_ppp23 = 0 WHERE tc_ppp01 = g_tc_ppp_1.tc_ppp01
                                                --AND tc_ppp21 = g_tc_ppp_1.tc_ppp21
        --LET g_tc_ppp_1.tc_pppconf = 1
        --LET g_tc_ppp_1.tc_ppp23 = 0
        --DISPLAY BY NAME g_tc_ppp_1.tc_pppconf,g_tc_ppp_1.tc_ppp23
    --END IF
    --ELSE
        --UPDATE tc_ppp_file SET tc_pppconf = 1 WHERE tc_ppp01 = g_tc_ppp_1.tc_ppp01
                                                --AND tc_ppp21 = g_tc_ppp_1.tc_ppp21
        --UPDATE tc_ppp_file SET tc_ppp23 = 0 WHERE tc_ppp01 = g_tc_ppp_1.tc_ppp01
                                                --AND tc_ppp21 = g_tc_ppp_1.tc_ppp21
        --LET g_tc_ppp_1.tc_pppconf = 1
        --LET g_tc_ppp_1.tc_ppp23 = 0
        --DISPLAY BY NAME g_tc_ppp_1.tc_pppconf,g_tc_ppp_1.tc_ppp23
    --END IF
END FUNCTION

FUNCTION t150_change_release()
DEFINE l_n LIKE type_file.num5
DEFINE l_pjfa RECORD LIKE pjfa_file.*
    IF cl_null(g_tc_ppp_1.tc_ppp01) THEN CALL cl_err("",-400,0)  RETURN END IF
    IF g_tc_ppp_1.tc_pppconf = 1 THEN CALL cl_err('','cpj-020',0) RETURN END IF
    IF g_tc_ppp_1.tc_pppconf = 3 THEN CALL cl_err('','cpj-023',0) RETURN END IF
    INITIALIZE l_pjfa.* TO NULL
    IF NOT cl_confirm('aec-103') THEN RETURN END IF
    FOR l_n = 1 TO g_rec_b
         IF g_tc_ppp[l_n].tc_ppp18 = 1 THEN   #新增
            SELECT * INTO l_pjfa.* FROM pjfa_file WHERE pjfa01 = g_tc_ppp_1.tc_ppp01 AND rownum = 1
            LET l_pjfa.pjfa01    = g_tc_ppp_1.tc_ppp01
            LET l_pjfa.pjfa02    = g_tc_ppp[l_n].tc_ppp19
            LET l_pjfa.pjfa03    = g_tc_ppp[l_n].tc_ppp03b
            LET l_pjfa.pjfa04    = g_tc_ppp[l_n].tc_ppp04b
            LET l_pjfa.pjfa05    = g_tc_ppp[l_n].tc_ppp05b
            LET l_pjfa.pjfa06    = g_tc_ppp[l_n].tc_ppp06b
            LET l_pjfa.ta_pjfa04 = g_tc_ppp[l_n].tc_ppp09b
            LET l_pjfa.ta_pjfa05 = g_tc_ppp[l_n].tc_ppp10b
            LET l_pjfa.ta_pjfa06 = g_tc_ppp[l_n].tc_ppp11b
            LET l_pjfa.ta_pjfa07 = g_tc_ppp[l_n].tc_ppp12b
            LET l_pjfa.ta_pjfa14 = g_tc_ppp[l_n].tc_ppp17b
            INSERT INTO pjfa_file VALUES l_pjfa.*
         ELSE #修改
            UPDATE pjfa_file SET
                   pjfa03    = g_tc_ppp[l_n].tc_ppp03b,
                   pjfa04    = g_tc_ppp[l_n].tc_ppp04b,
                   pjfa05    = g_tc_ppp[l_n].tc_ppp05b,
                   pjfa06    = g_tc_ppp[l_n].tc_ppp06b,
                   ta_pjfa04 = g_tc_ppp[l_n].tc_ppp09b,
                   ta_pjfa05 = g_tc_ppp[l_n].tc_ppp10b,
                   ta_pjfa06 = g_tc_ppp[l_n].tc_ppp11b,
                   ta_pjfa07 = g_tc_ppp[l_n].tc_ppp12b,
                   ta_pjfa14 = g_tc_ppp[l_n].tc_ppp17b
            WHERE  pjfa01 = g_tc_ppp_1.tc_ppp01
              AND  pjfa02 = g_tc_ppp[l_n].tc_ppp19
         END IF
    END FOR
    CALL cl_err('','alm-940',0)
    UPDATE tc_ppp_file SET tc_pppconf = 3 WHERE tc_ppp01 = g_tc_ppp_1.tc_ppp01 AND tc_ppp21 = g_tc_ppp_1.tc_ppp21
    LET g_tc_ppp_1.tc_pppconf = 3
    DISPLAY BY NAME g_tc_ppp_1.tc_pppconf
    CALL t150_pic()
END FUNCTION

FUNCTION t150_pic()
    IF g_tc_ppp_1.tc_pppconf = 1 THEN LET g_chr2='N'   END IF
    IF g_tc_ppp_1.tc_pppconf = 2 THEN LET g_chr2='Y'   END IF
    IF g_tc_ppp_1.tc_pppconf = 3 THEN LET g_chr2='Y'   END IF

   CALL cl_set_field_pic(g_tc_ppp_1.tc_pppconf,g_chr2,""  ,"","",""  )
END FUNCTION



FUNCTION t150_ef()
IF (g_tc_ppp_1.tc_ppp23 <> '0' AND g_tc_ppp_1.tc_ppp23 <> 'R' AND g_tc_ppp_1.tc_ppp23 <> 'W')  THEN RETURN END IF
IF g_tc_ppp_1.tc_pppconf <> '1' THEN RETURN END IF

   CALL aws_condition()      #判斷送簽資料
   IF g_success = 'N' THEN
       RETURN
   END IF
##########
# CALL aws_efcli2()
# 傳入參數: (1)單頭資料, (2-6)單身資料
# 回傳值  : 0 開單失敗; 1 開單成功
##########

 IF aws_efcli2(base.TypeInfo.create(g_tc_ppp_1),base.TypeInfo.create(g_tc_ppp_1),'','','','')
 THEN
   LET g_success='Y'
   LET g_tc_ppp_1.tc_ppp23='S'
   #LET g_tc_ppp_1.tc_pppconf = '2'
   #UPDATE tc_ppp_file SET tc_pppconf = '2' WHERE tc_ppp15 = g_tc_ppp_1.tc_ppp15 AND tc_ppp21 = g_tc_ppp_1.tc_ppp21
   #UPDATE tc_ppp_file SET tc_ppp23 = '2' WHERE tc_ppp15 = g_tc_ppp_1.tc_ppp15 AND tc_ppp21 = g_tc_ppp_1.tc_ppp21
   DISPLAY BY NAME g_tc_ppp_1.tc_ppp23
 ELSE
   LET g_success='N'
 END IF
END FUNCTION

FUNCTION t150_excel()
DEFINE g_fileloc               STRING
DEFINE p_row,p_col,l_n         SMALLINT
DEFINE xlapp,iRes,iRow,i,j,iColumn,l_m     INTEGER
DEFINE l_cnt        LIKE type_file.num5
DEFINE   l_tc_ppp  RECORD LIKE tc_ppp_file.*
IF g_tc_ppp_1.tc_pppconf <> 1 THEN RETURN END IF
IF (g_tc_ppp_1.tc_ppp23 <> '0' AND g_tc_ppp_1.tc_ppp23 <> 'R' AND g_tc_ppp_1.tc_ppp23 <> 'W') THEN RETURN END IF

   IF cl_null(g_tc_ppp_1.tc_ppp01) THEN
      RETURN
   END IF
   CALL cs_documentLocation()   #弹出窗口，接收本地文件路径
   LET g_fileloc=gs_location

  WHENEVER ERROR CALL cl_err_msg_log

   CALL cl_wait()
   CALL ui.interface.frontCall('WinCOM','CreateInstance',['Excel.Application'],[xlApp])
   IF xlApp <> -1 THEN
      CALL ui.interface.frontCall('WinCOM','CallMethod',[xlApp,'WorkBooks.Open',g_fileloc],[iRes])
      IF iRes <> -1 THEN
         CALL ui.interface.frontCall('WinCOM','GetProperty',[xlApp,'ActiveSheet.UsedRange.Rows.Count'],[iRow])  #回传行数
         CALL ui.interface.frontCall('WinCOM','GetProperty',[xlApp,'ActiveSheet.UsedRange.Columns.Count'],[iColumn]) #回传列数
         IF iRow <= 1 THEN
            CALL ui.interface.frontCall('WinCOM','CallMethod',[xlApp,'Quit'],[iRes])
            CALL ui.interface.frontCall('WinCOM','ReleaseInstance',[xlApp],[iRes])
            MESSAGE ""
            CALL cl_err('','t400-01',1)
            RETURN
         END IF
         IF iColumn <=2 THEN
            CALL ui.interface.frontCall('WinCOM','CallMethod',[xlApp,'Quit'],[iRes])
            CALL ui.interface.frontCall('WinCOM','ReleaseInstance',[xlApp],[iRes])
            MESSAGE ""
            CALL cl_err('','t400-01',1)
            RETURN
         END IF

         BEGIN WORK
         LET g_success='Y'
         CALL s_showmsg_init()
         FOR i=2 TO iRow
            IF g_success='N' THEN
               EXIT FOR
            END IF
            INITIALIZE l_tc_ppp.* TO NULL
            LET l_tc_ppp.tc_ppp01 = g_tc_ppp_1.tc_ppp01
            LET l_tc_ppp.tc_ppp21 = g_tc_ppp_1.tc_ppp21
            LET l_tc_ppp.tc_ppp15 = g_tc_ppp_1.tc_ppp15
            LET l_tc_ppp.tc_ppp16 = g_tc_ppp_1.tc_ppp16
            LET l_tc_ppp.tc_ppp08 = g_tc_ppp_1.tc_ppp08
            LET l_tc_ppp.tc_ppp23 = g_tc_ppp_1.tc_ppp23
            LET l_tc_ppp.tc_pppconf = g_tc_ppp_1.tc_pppconf
            LET l_tc_ppp.tc_pppmksg = g_tc_ppp_1.tc_pppmksg
            LET l_m=0
            #画面取数据
            CALL ui.interface.frontCall('WinCOM','GetProperty',[xlApp,'ActiveSheet.Cells('||i||',1).Value'],[l_tc_ppp.tc_ppp02])  #订单项次

            CALL ui.interface.frontCall('WinCOM','GetProperty',[xlApp,'ActiveSheet.Cells('||i||',2).Value'],[l_tc_ppp.tc_ppp19])  #料号

            CALL ui.interface.frontCall('WinCOM','GetProperty',[xlApp,'ActiveSheet.Cells('||i||',3).Value'],[l_tc_ppp.tc_ppp03b])  #数量

            CALL ui.interface.frontCall('WinCOM','GetProperty',[xlApp,'ActiveSheet.Cells('||i||',4).Value'],[l_tc_ppp.tc_ppp05b])  #约定出货日期

            CALL ui.interface.frontCall('WinCOM','GetProperty',[xlApp,'ActiveSheet.Cells('||i||',5).Value'],[l_tc_ppp.tc_ppp06b])  #约定出货日期

            CALL ui.interface.frontCall('WinCOM','GetProperty',[xlApp,'ActiveSheet.Cells('||i||',6).Value'],[l_tc_ppp.tc_ppp09b])  #约定出货日期

            CALL ui.interface.frontCall('WinCOM','GetProperty',[xlApp,'ActiveSheet.Cells('||i||',7).Value'],[l_tc_ppp.tc_ppp17b])  #约定出货日期

            #逻辑判断
            #l_tc_ppp
            LET l_tc_ppp.tc_ppp18 = 1
            #材料项次
            SELECT COUNT(*) INTO l_n FROM pjfa_file WHERE pjfa01 = g_tc_ppp_1.tc_ppp01 AND pjfa02 = l_tc_ppp.tc_ppp19
            IF l_n > 0 THEN CALL cl_err('','cpj-011',1) RETURN END IF
            #料号
            SELECT count(*) INTO l_n FROM ima_file WHERE ima01 = l_tc_ppp.tc_ppp03b
            IF l_n = 0 THEN CALL cl_err('','cpj-013',1) RETURN END IF
            SELECT ima02 INTO l_tc_ppp.tc_ppp04b FROM ima_file WHERE ima01 = l_tc_ppp.tc_ppp03b

            #需求量
            IF l_tc_ppp.tc_ppp05b <= 0 THEN CALL cl_err('','alm-061',0) RETURN END IF
            #单价处理
            IF g_gec07 = 'Y' THEN
                  LET l_tc_ppp.tc_ppp10b = l_tc_ppp.tc_ppp09b
                  LET l_tc_ppp.tc_ppp09b=l_tc_ppp.tc_ppp10b/(1+0.01*g_tc_ppp_1.tc_ppp20)
                  LET l_tc_ppp.tc_ppp11b=l_tc_ppp.tc_ppp09b*l_tc_ppp.tc_ppp05b
                  LET l_tc_ppp.tc_ppp12b=l_tc_ppp.tc_ppp10b*l_tc_ppp.tc_ppp05b
            ELSE
                  LET l_tc_ppp.tc_ppp10b=l_tc_ppp.tc_ppp09b*(1+0.01*g_tc_ppp_1.tc_ppp20)
                  LET l_tc_ppp.tc_ppp11b=l_tc_ppp.tc_ppp09b*l_tc_ppp.tc_ppp05b
                  LET l_tc_ppp.tc_ppp12b=l_tc_ppp.tc_ppp10b*l_tc_ppp.tc_ppp05b
            END IF
            #成本中心
            SELECT COUNT(*) INTO l_cnt FROM azf_file WHERE azf01 = l_tc_ppp.tc_ppp17b AND azf02 = '2'
            IF l_cnt = 0 THEN CALL cl_err('','1306',1) RETURN END IF
            INSERT INTO tc_ppp_file VALUES l_tc_ppp.*
         END FOR

         CALL ui.interface.frontCall('WinCOM','CallMethod',[xlApp,'Quit'],[iRes])
         CALL ui.interface.frontCall('WinCOM','ReleaseInstance',[xlApp],[iRes])
         MESSAGE ""
         IF g_success='Y' THEN
            COMMIT WORK
            CALL cl_err('','i171-22',1)
         ELSE
            ROLLBACK WORK
            CALL s_showmsg()
         END IF
      END IF
   END IF
END FUNCTION


FUNCTION cs_documentLocation()
  DEFINE ls_str        STRING,
         ls_file       STRING,
         ls_location   STRING
  DEFINE gr_gcb   RECORD LIKE gcb_file.*

  LET gr_gcb.gcb02='DOC'
  CASE gr_gcb.gcb02
       WHEN "DOC"
            LET ls_str = cl_getmsg("lib-201", g_lang)
            WHILE TRUE
                LET ls_location = gs_location
                PROMPT ls_str CLIPPED FOR gs_location
                    ATTRIBUTE(WITHOUT DEFAULTS)

                    ON ACTION accept
                        EXIT WHILE

                    ON ACTION cancel
                        LET gs_location = NULL
                        LET INT_FLAG = TRUE
                        EXIT WHILE

                   ON ACTION EXIT
                      LET INT_FLAG = TRUE
                      EXIT WHILE

                    ON ACTION browse_document
                        LET ls_file = cl_browse_file()  #返回USER选择的本地路径
                        IF ls_file IS NOT NULL THEN
                           LET gs_location = ls_file
                        END IF

                    ON IDLE g_idle_seconds
                        CALL cl_on_idle()
                        LET gs_location = ls_location
                        RETURN

                END PROMPT
            END WHILE
       WHEN "URL"
            LET ls_str = cl_getmsg("lib-202", g_lang)
            LET ls_location = gs_location
            PROMPT ls_str CLIPPED FOR gs_location
                ATTRIBUTE(WITHOUT DEFAULTS)

                ON ACTION CANCEL
                    LET gs_location = NULL
                    LET INT_FLAG = TRUE
                    RETURN

                   ON ACTION EXIT
                      LET INT_FLAG = TRUE
                      RETURN

                ON IDLE g_idle_seconds
                    CALL cl_on_idle()
                    LET gs_location = ls_location
                    RETURN

            END PROMPT
  END CASE

  IF INT_FLAG THEN
     RETURN
  END IF
END FUNCTION