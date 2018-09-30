# Prog. Version..: '5.25.03-11.07.21(00001)'     #
#
# Pattern name...: cnmp100.4gl
# Descriptions...: 整合支付
# Date & Author..: 11/04/01 By lixia
# Modify.........: 121017_1      12/10/17 By Exia 增加签约类型
# Modify.........: 131017_1      13/10/17 By Exia 增加全选和设置支付状态按钮
# Modify.........: 131022        13/10/22 By Exia 增加弹出框,隐藏交易单据类型，签约类型和类型说明
# Modify.........: ERP-20160711  16/07/11 by Wangyue  对于OA费用抛转过来的单据，若采用银企直连的方式支付，
                                                   ## 若支付成功，则调用OA的webservice接口回传OA信息
# Modify.........: ERP-20171019  17/10/19 by Wangyue  根据供应商和银行编号带出最新的供应商银行行号和账号信息
# Modify.........: ERP-20180226  18/02/26 by Wangyue  对于月结的采购付款单据，限制每月的23号之前不可提交！
# Modify.........: No:180808     18/08/08 By pulf   支付前判断，避免查询选不到，更新不了状态
# Modify.........: No:180809     18/08/09 By pulf   被银行拒绝的单子可以重复提交
# Modify.........: No:180921     18/09/21 By lixwz  在更新状态时,若无资料返回,可以选择重新提交支付.
#                                                   由于多笔不能判断那笔是没有资料返回的,限制单选时才能提交支付.


DATABASE ds

GLOBALS "../../config/top.global"

DEFINE
    g_nme         DYNAMIC ARRAY OF RECORD
        chk       LIKE type_file.chr1,
        nme25     LIKE nme_file.nme25,   #付款厂商
        nme13     LIKE nme_file.nme13,
        nmeud09   LIKE nme_file.nmeud09, #厂商全称
        nme12     LIKE nme_file.nme12,
        nme01     LIKE nme_file.nme01,
        nma02     LIKE nma_file.nma02,
        nma04     LIKE nma_file.nma04,
        nmeud01   LIKE nme_file.nmeud01,
        nmeud02   LIKE nme_file.nmeud02,
        nmeud03   LIKE nme_file.nmeud03,
        nmeud04   LIKE nme_file.nmeud04,
        nmeud05   LIKE nme_file.nmeud05,
        nmeud06   LIKE nme_file.nmeud06,
        nmeud07   LIKE nme_file.nmeud07,
        nmeud08   LIKE nme_file.nmeud08,
        nme19     LIKE nme_file.nme19,       #121017_1
        tc_std03  LIKE tc_std_file.tc_std03, #121017_1
        nme05     LIKE nme_file.nme05,
        nme02     LIKE nme_file.nme02,
        nme04     LIKE nme_file.nme04,
        nme08     LIKE nme_file.nme08,
        nme24     LIKE nme_file.nme24,
        tc_stf03  LIKE tc_stf_file.tc_stf03, #支付指令说明
        nme22     LIKE nme_file.nme22,
        nme27     LIKE nme_file.nme27,
        nmeud12   LIKE nme_file.nmeud12 #支付批次字段
                  END RECORD,
    g_nme_t       RECORD
        chk       LIKE type_file.chr1,
        nme25     LIKE nme_file.nme25,   #付款厂商
        nme13     LIKE nme_file.nme13,
        nmeud09   LIKE nme_file.nmeud09, #厂商全称
        nme12     LIKE nme_file.nme12,
        nme01     LIKE nme_file.nme01,
        nma02     LIKE nma_file.nma02,
        nma04     LIKE nma_file.nma04,
        nmeud01   LIKE nme_file.nmeud01,
        nmeud02   LIKE nme_file.nmeud02,
        nmeud03   LIKE nme_file.nmeud03,
        nmeud04   LIKE nme_file.nmeud04,
        nmeud05   LIKE nme_file.nmeud05,
        nmeud06   LIKE nme_file.nmeud06,
        nmeud07   LIKE nme_file.nmeud07,
        nmeud08   LIKE nme_file.nmeud08,
        nme19     LIKE nme_file.nme19,       #121017_1
        tc_std03  LIKE tc_std_file.tc_std03, #121017_1
        nme05     LIKE nme_file.nme05,
        nme02     LIKE nme_file.nme02,
        nme04     LIKE nme_file.nme04,
        nme08     LIKE nme_file.nme08,
        nme24     LIKE nme_file.nme24,
        tc_stf03  LIKE tc_stf_file.tc_stf03, #支付指令说明
        nme22     LIKE nme_file.nme22,
        nme27     LIKE nme_file.nme27,
        nmeud12   LIKE nme_file.nmeud12 #支付批次字段
                  END RECORD,
    g_nme_color   DYNAMIC ARRAY OF RECORD
        chk       LIKE nme_file.nmeud01,
        nme25     LIKE nme_file.nmeud01,
        nme13     LIKE nme_file.nmeud01,
        nmeud09   LIKE nme_file.nmeud01,
        nme12     LIKE nme_file.nmeud01,
        nme01     LIKE nme_file.nmeud01,
        nma02     LIKE nme_file.nmeud01,
        nma04     LIKE nme_file.nmeud01,
        nmeud01   LIKE nme_file.nmeud01,
        nmeud02   LIKE nme_file.nmeud01,
        nmeud03   LIKE nme_file.nmeud01,
        nmeud04   LIKE nme_file.nmeud01,
        nmeud05   LIKE nme_file.nmeud01,
        nmeud06   LIKE nme_file.nmeud01,
        nmeud07   LIKE nme_file.nmeud01,
        nmeud08   LIKE nme_file.nmeud01,
        nme19     LIKE nme_file.nmeud01,
        tc_std03  LIKE nme_file.nmeud01,
        nme05     LIKE nme_file.nmeud01,
        nme02     LIKE nme_file.nmeud01,
        nme04     LIKE nme_file.nmeud01,
        nme08     LIKE nme_file.nmeud01,
        nme24     LIKE nme_file.nmeud01,
        tc_stf03  LIKE nme_file.nmeud01,
        nme22     LIKE nme_file.nmeud01,
        nme27     LIKE nme_file.nmeud01,
        nmeud12   LIKE nme_file.nmeud12 #支付批次字段
                  END RECORD,
    g_wc,g_wc2,g_sql        STRING,
    g_rec_b                 LIKE type_file.num5,
    l_ac                    LIKE type_file.num5,
    t_ac                    LIKE type_file.num5
DEFINE g_forupd_sql         STRING
DEFINE g_before_input_done  STRING
DEFINE g_cnt                LIKE type_file.num10
DEFINE g_msg                STRING
DEFINE g_payFlag            LIKE type_file.chr1
DEFINE g_nmeud12            LIKE nme_file.nmeud12

MAIN
   OPTIONS
      INPUT NO WRAP
   DEFER INTERRUPT

   IF (NOT cl_user()) THEN
      EXIT PROGRAM
   END IF

   WHENEVER ERROR CALL cl_err_msg_log

   IF (NOT cl_setup("CNM")) THEN
      EXIT PROGRAM
   END IF

   IF g_aza.aza73 = 'N' THEN
      CALL cl_err('','anm-980',1)
      EXIT PROGRAM
   END IF

   CALL cl_used(g_prog,g_time,1) RETURNING g_time
   OPEN WINDOW p100_w WITH FORM "cnm/42f/cnmp100"
         ATTRIBUTE (STYLE = g_win_style CLIPPED)

   CALL cl_ui_init()
   CALL cl_set_comp_entry("tc_std03",FALSE)
   CALL cl_set_comp_visible("nme19,nme22,tc_std03",FALSE)
   CALL p100_menu()

   CLOSE WINDOW p100_w

   CALL cl_used(g_prog,g_time,2) RETURNING g_time
END MAIN

FUNCTION p100_menu()
   WHILE TRUE
      CALL p100_bp("G")
      CASE g_action_choice
         WHEN "query"
            IF cl_chk_act_auth() THEN
               CALL p100_q()
            END IF
         WHEN "detail"
            IF cl_chk_act_auth() THEN
               IF g_nme[1].nme01 IS NOT NULL THEN
                  CALL p100_b()
               ELSE
                  LET g_action_choice = NULL
               END IF
            ELSE
               LET g_action_choice = NULL
            END IF
         #
         WHEN "undo_pay"
            IF cl_chk_act_auth() THEN
               IF l_ac >0 THEN
                  LET t_ac = l_ac
                  CALL p100_undopay()
               END IF
            END IF

         #全选
         WHEN "select_all"
            IF cl_chk_act_auth() THEN
               CALL p100_all()
            END IF

         #直接支付
         WHEN "batch_pay"
            IF cl_chk_act_auth() THEN
               CALL p100_batch()
            END IF

         #更新状态
         WHEN "update_pay_status"
            IF cl_chk_act_auth() THEN
               CALL p100_upd_pay_status()
            END IF
         #历史资料查询
         WHEN "qry_pay"
            IF cl_chk_act_auth() THEN
               IF l_ac >0 THEN
                  LET t_ac = l_ac
                  LET g_msg="tc_nps02 ='",g_nme[l_ac].nme27,"'"
                  CALL p100_qry_pay(g_msg)
               END IF
            END IF

         WHEN "help"
            CALL cl_show_help()
         WHEN "exit"
            EXIT WHILE
         WHEN "controlg"
            CALL cl_cmdask()
         WHEN "exporttoexcel"
            IF cl_chk_act_auth() THEN
              CALL cl_export_to_excel(ui.Interface.getRootNode(),base.TypeInfo.create(g_nme),'','')
            END IF
      END CASE
   END WHILE

END FUNCTION

FUNCTION p100_bp(p_ud)
DEFINE p_ud   LIKE type_file.chr1
   IF p_ud <> "G" OR g_action_choice = "detail" THEN
      RETURN
   END IF
   LET g_action_choice = " "

   CALL cl_set_act_visible("accept,cancel", FALSE)
   DISPLAY ARRAY g_nme TO s_nme.* ATTRIBUTE(COUNT=g_rec_b)

      BEFORE DISPLAY
        IF t_ac > 0 THEN
           LET l_ac = t_ac
           CALL fgl_set_arr_curr(l_ac)
        END IF
        CALL dialog.setCellAttributes(g_nme_color)
      BEFORE ROW
         LET l_ac = ARR_CURR()
         CALL cl_show_fld_cont()

      ON ACTION query
         LET g_action_choice="query"
         EXIT DISPLAY

      ON ACTION undo_pay
         LET g_action_choice="undo_pay"
         EXIT DISPLAY

      ON ACTION select_all
         LET g_action_choice="select_all"
         EXIT DISPLAY

      ON ACTION detail
         LET g_action_choice="detail"
         EXIT DISPLAY

      ON ACTION help
         LET g_action_choice="help"
         EXIT DISPLAY

      ON ACTION locale
         CALL cl_dynamic_locale()
         CALL cl_show_fld_cont()

      ON ACTION controlg
         LET g_action_choice="controlg"
         EXIT DISPLAY

      ON ACTION accept
         LET g_action_choice="detail"
         LET l_ac = ARR_CURR()
         EXIT DISPLAY

      ON ACTION exit
         LET g_action_choice="exit"
         EXIT DISPLAY

      ON ACTION close
         LET g_action_choice="exit"
         EXIT DISPLAY
      ON ACTION cancel
         LET INT_FLAG=FALSE
         LET g_action_choice="exit"
         EXIT DISPLAY

      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY

      ON ACTION about
         CALL cl_about()

      ON ACTION exporttoexcel
         LET g_action_choice = 'exporttoexcel'
         EXIT DISPLAY
      #直接支付
      ON ACTION batch_pay
         LET g_action_choice = 'batch_pay'
         EXIT DISPLAY

      #更新支付状态
      ON ACTION update_pay_status
         LET g_action_choice = 'update_pay_status'
         EXIT DISPLAY

      #支付查询
      ON ACTION qry_pay
         LET g_action_choice = 'qry_pay'
         EXIT DISPLAY

      AFTER DISPLAY
         CONTINUE DISPLAY
   END DISPLAY
   CALL cl_set_act_visible("accept,cancel", TRUE)
END FUNCTION

FUNCTION p100_q()

   CLEAR FORM
   CALL g_nme.clear()
   WHILE TRUE
     LET t_ac = 0
     CONSTRUCT g_wc ON nme25,nme13,nmeud09,nme12,nme01,nme02,nme04,
                     nmeud01,nmeud02,nmeud03,nmeud04,nmeud05,nmeud06,nmeud07,nmeud08,nme19,nme05,    #121017_1 add nme19
                     nme08,nme24,nme22,nme27,nmeud12
        FROM s_nme[1].nme25,s_nme[1].nme13,s_nme[1].nmeud09,s_nme[1].nme12,s_nme[1].nme01,s_nme[1].nme02,s_nme[1].nme04,
             s_nme[1].nmeud01,s_nme[1].nmeud02,s_nme[1].nmeud03,s_nme[1].nmeud04,s_nme[1].nmeud05,s_nme[1].nmeud06,s_nme[1].nmeud07,s_nme[1].nmeud08,
             s_nme[1].nme19,s_nme[1].nme05,     #121017_1 add nme19
             s_nme[1].nme08,s_nme[1].nme24,s_nme[1].nme22,s_nme[1].nme27,s_nme[1].nmeud12
       ATTRIBUTES(FIELD ORDER FORM)

       BEFORE CONSTRUCT
         CALL cl_qbe_init()

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

       ON ACTION controlp
          CASE
            WHEN INFIELD(nmeud01)
               CALL cl_init_qry_var()
               LET g_qryparam.form = "q_nmt"
               LET g_qryparam.state = "c"
               CALL cl_create_qry() RETURNING g_qryparam.multiret
               DISPLAY g_qryparam.multiret TO nmeud01

            WHEN INFIELD(nmeud07)
               CALL cl_init_qry_var()
               LET g_qryparam.form = "q_ryb04"
               LET g_qryparam.state = "c"
               CALL cl_create_qry() RETURNING g_qryparam.multiret
               DISPLAY g_qryparam.multiret TO nmeud07

            WHEN INFIELD(nme24)
               CALL cl_init_qry_var()
               LET g_qryparam.form = "q_tc_stf"
               LET g_qryparam.state = "c"
               CALL cl_create_qry() RETURNING g_qryparam.multiret
               DISPLAY g_qryparam.multiret TO nme24

            WHEN INFIELD(nmeud09)
               CALL cl_init_qry_var()
               LET g_qryparam.form = "q_nmeud09"
               LET g_qryparam.state = "c"
               CALL cl_create_qry() RETURNING g_qryparam.multiret
               DISPLAY g_qryparam.multiret TO nmeud09

            WHEN INFIELD(nmeud02)
               CALL cl_init_qry_var()
               LET g_qryparam.form = "q_nmeud02"
               LET g_qryparam.state = "c"
               CALL cl_create_qry() RETURNING g_qryparam.multiret
               DISPLAY g_qryparam.multiret TO nmeud02

            WHEN INFIELD(nmeud03)
               CALL cl_init_qry_var()
               LET g_qryparam.form = "q_nmeud03"
               LET g_qryparam.state = "c"
               CALL cl_create_qry() RETURNING g_qryparam.multiret
               DISPLAY g_qryparam.multiret TO nmeud03

            WHEN INFIELD(nmeud04)
               CALL cl_init_qry_var()
               LET g_qryparam.form = "q_nmeud04"
               LET g_qryparam.state = "c"
               CALL cl_create_qry() RETURNING g_qryparam.multiret
               DISPLAY g_qryparam.multiret TO nmeud04

            WHEN INFIELD(nme01)
               CALL cl_init_qry_var()
               LET g_qryparam.form = "q_nma"
               LET g_qryparam.state = "c"
               CALL cl_create_qry() RETURNING g_qryparam.multiret
               DISPLAY g_qryparam.multiret TO nme01

            WHEN INFIELD(nme12)
               CALL cl_init_qry_var()
               LET g_qryparam.form = "q_nme12"
               LET g_qryparam.state = "c"
               CALL cl_create_qry() RETURNING g_qryparam.multiret
               DISPLAY g_qryparam.multiret TO nme12

          END CASE
     END CONSTRUCT
  # LET g_wc = g_wc CLIPPED,cl_get_extra_cond(null, null)
     IF INT_FLAG THEN
        LET INT_FLAG = 0
        LET g_wc = NULL
        RETURN
     END IF
     IF g_wc=" 1=1" THEN
     	  CONTINUE WHILE
     END IF

     EXIT WHILE
   END WHILE
   CALL p100_b_fill(g_wc)
END FUNCTION

FUNCTION p100_b()
DEFINE p_cmd  LIKE type_file.chr1,
       l_tc_stf04    LIKE tc_stf_file.tc_stf04
DEFINE l_nma47   LIKE nma_file.nma47
DEFINE l_n       LIKE type_file.num5
   LET g_action_choice = ""
   IF s_shut(0) THEN RETURN END IF
   CALL cl_opmsg('b')

   INPUT ARRAY g_nme WITHOUT DEFAULTS FROM s_nme.*
         ATTRIBUTE(COUNT=g_rec_b,MAXCOUNT=g_max_rec,UNBUFFERED,
            INSERT ROW=FALSE,DELETE ROW=FALSE,APPEND ROW=FALSE)

      BEFORE INPUT
         IF g_rec_b != 0 THEN
            CALL fgl_set_arr_curr(l_ac)
         END IF
         CALL dialog.setCellAttributes(g_nme_color)

      BEFORE ROW
         LET l_ac = ARR_CURR()
         LET l_n  = ARR_COUNT()

         IF g_rec_b >= l_ac THEN
            LET p_cmd='u'
            #检查签约类型是否必输
            LET l_nma47=''
            SELECT nma47 INTO l_nma47 FROM nma_file WHERE nma01= g_nme[l_ac].nme01
            IF g_nme[l_ac].nmeud08 = '1' THEN
               LET l_n = 0
               SELECT COUNT(*) INTO l_n FROM tc_std_file
                WHERE tc_std01 = l_nma47
               IF cl_null(l_n) THEN LET l_n = 0 END IF
               IF l_n > 0 THEN
                  CALL cl_set_comp_entry("nme19",TRUE)
                  CALL cl_set_comp_required("nme19",TRUE)
               ELSE
                  CALL cl_set_comp_entry("nme19",FALSE)
                  CALL cl_set_comp_required("nme19",FALSE)
               END IF
            ELSE
               LET g_nme[l_ac].nme19 = ''
               LET g_nme[l_ac].tc_std03 = ''
               CALL cl_set_comp_entry("nme19",FALSE)
               CALL cl_set_comp_required("nme19",FALSE)
            END IF
            CALL cl_set_comp_entry("nmeud01,nmeud02,nmeud03,nmeud04,nmeud05,nmeud06,nmeud07,nmeud08",TRUE)
            CALL cl_set_comp_entry("tc_stf03",FALSE)
            LET g_nme_t.* = g_nme[l_ac].*
            CALL cl_show_fld_cont()
         END IF

      AFTER FIELD chk
         IF g_nme[l_ac].chk ='Y' THEN
            IF g_nme[l_ac].nme24 ='CNPAY' THEN
               CALL cl_err("此资料不需要支付","!",1)
               LET g_nme[l_ac].chk = 'N'
               NEXT FIELD chk
            END IF
         END IF

      AFTER FIELD nmeud01
         IF NOT cl_null(g_nme[l_ac].nmeud01) AND cl_null(g_nme[l_ac].nmeud02) THEN
            SELECT nmt02 INTO g_nme[l_ac].nmeud02
              FROM nmt_file
             WHERE nmt01=g_nme[l_ac].nmeud01
            DISPLAY BY NAME g_nme[l_ac].nmeud02
         END IF

      ON CHANGE nmeud08
         IF not cl_null(g_nme[l_ac].nmeud08) THEN
            #检查签约类型是否必输
            IF g_nme[l_ac].nmeud08 = '1' THEN
               LET l_n = 0
               SELECT COUNT(*) INTO l_n FROM tc_std_file
                WHERE tc_std01 = l_nma47
               IF cl_null(l_n) THEN LET l_n = 0 END IF
               IF l_n > 0 THEN
                  CALL cl_set_comp_entry("nme19",TRUE)
                  CALL cl_set_comp_required("nme19",TRUE)
               ELSE
                  CALL cl_set_comp_entry("nme19",FALSE)
                  CALL cl_set_comp_required("nme19",FALSE)
               END IF
            ELSE
               LET g_nme[l_ac].nme19 = ''
               LET g_nme[l_ac].tc_std03 = ''
               CALL cl_set_comp_entry("nme19",FALSE)
               CALL cl_set_comp_required("nme19",FALSE)
            END IF
          END IF
      AFTER FIELD nme19
         IF NOT cl_null(g_nme[l_ac].nme19) THEN
            LET l_n = 0
            SELECT COUNT(*) INTO l_n FROM tc_std_file
             WHERE tc_std01 = l_nma47 AND tc_std02 = g_nme[l_ac].nme19
            IF cl_null(l_n) THEN LET l_n = 0 END IF
            IF l_n = 0 THEN
               CALL cl_err('录入的类型不存在','!',0)
               NEXT FIELD nme19
            ELSE
               SELECT tc_std03 INTO g_nme[l_ac].tc_std03 FROM tc_std_file
             WHERE tc_std01 = l_nma47 AND tc_std02 = g_nme[l_ac].nme19
            END IF
            DISPLAY BY NAME g_nme[l_ac].nme19,g_nme[l_ac].tc_std03
         END IF
      ON ROW CHANGE
         IF INT_FLAG THEN
            LET INT_FLAG=0
            EXIT INPUT
         END IF

         UPDATE nme_file SET nmeud01=g_nme[l_ac].nmeud01,
                             nmeud02=g_nme[l_ac].nmeud02,
                             nmeud03=g_nme[l_ac].nmeud03,
                             nmeud04=g_nme[l_ac].nmeud04,
                             nmeud05=g_nme[l_ac].nmeud05,
                             nmeud06=g_nme[l_ac].nmeud06,
                             nmeud07=g_nme[l_ac].nmeud07,
                             nmeud08=g_nme[l_ac].nmeud08,
                             nme19=g_nme[l_ac].nme19,
                             nme05=g_nme[l_ac].nme05
         WHERE nme12=g_nme[l_ac].nme12
         IF STATUS THEN
            CALL cl_err('update nme_file',STATUS,0)
            ROLLBACK WORK
         END IF

      AFTER ROW
         LET l_ac = ARR_CURR()
         IF INT_FLAG THEN
            CALL cl_err('',9001,0)
            LET INT_FLAG = 0
            IF p_cmd='u' THEN
               LET g_nme[l_ac].* = g_nme_t.*
            END IF
            EXIT INPUT
         END IF

      ON ACTION controlp
         CASE
            WHEN INFIELD(nmeud01)
               CALL cl_init_qry_var()
               LET g_qryparam.form = "q_nmt"
               LET g_qryparam.default1= g_nme[l_ac].nmeud01
               CALL cl_create_qry() RETURNING g_nme[l_ac].nmeud01
               DISPLAY BY NAME g_nme[l_ac].nmeud01
               NEXT FIELD nmeud01

            WHEN INFIELD(nmeud07)
               CALL cl_init_qry_var()
               LET g_qryparam.form = "q_ryb04"
               LET g_qryparam.default1= g_nme[l_ac].nmeud07
               CALL cl_create_qry() RETURNING g_nme[l_ac].nmeud07
               DISPLAY BY NAME g_nme[l_ac].nmeud07
               NEXT FIELD nmeud07
            WHEN INFIELD(nme19)
               CALL cl_init_qry_var()
               LET g_qryparam.form = "cq_tc_std02"
               LET g_qryparam.arg1 = l_nma47
               LET g_qryparam.default1= g_nme[l_ac].nme19
               CALL cl_create_qry() RETURNING g_nme[l_ac].nme19
               DISPLAY BY NAME g_nme[l_ac].nme19
               NEXT FIELD nme19
         END CASE

      ON ACTION CONTROLZ
         CALL cl_show_req_fields()

      ON ACTION CONTROLG
         CALL cl_cmdask()

      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE INPUT

      ON ACTION about
         CALL cl_about()

      ON ACTION help
         CALL cl_show_help()
   END INPUT
   LET t_ac = l_ac
END FUNCTION

FUNCTION p100_b_fill(p_wc)
DEFINE  p_wc     STRING
DEFINE  l_sql    STRING
DEFINE  l_str    STRING,
        l_type   LIKE apy_file.apyslip,
        l_kind   LIKE apy_file.apykind,
        l_nmg20  LIKE nmg_file.nmg20
DEFINE  l_n      LIKE type_file.num5,
        l_nme27_max LIKE nme_file.nme27
DEFINE l_nma47   LIKE nma_file.nma47
   LET g_sql = "SELECT 'N',nme25,nme13,nmeud09,nme12,nme01,'','',nmeud01,nmeud02,nmeud03,nmeud04,nmeud05,nmeud06,nmeud07,nmeud08,nme19,'',nme05,",
               "       nme02,nme04,nme08,nme24,'',nme22,nme27,nmeud12 ",
               "  FROM nme_file,nma_file",
               " WHERE ", p_wc CLIPPED,
               "   AND nma43='Y' ",
               "   AND nma01 = nme01 ",
               "   AND nme25 IS NOT NULL",
               "   AND nme27 IS NOT NULL",
               #" ORDER BY nme02 DESC "
               " ORDER BY nme12 "
   PREPARE p100_pb FROM g_sql
   DECLARE nme_curs CURSOR FOR p100_pb

   CALL g_nme.clear()
   CALL g_nme_color.clear()
   LET g_cnt = 1

   FOREACH nme_curs INTO g_nme[g_cnt].*
      IF STATUS THEN
         CALL cl_err('foreach:',STATUS,1)
         EXIT FOREACH
      END IF

      #没有提出类型的银行收支单不显示
      SELECT COUNT(*) INTO l_n
       FROM nme_file,nmc_file
       WHERE nme03 = nmc01
         AND nme12 = g_nme[g_cnt].nme12
      IF l_n >0 THEN
         SELECT COUNT(*) INTO l_n
           FROM nme_file,nmc_file
          WHERE nme03 = nmc01
            AND nme12 = g_nme[g_cnt].nme12
            AND nmc03='2' #银行="提出"类型
         IF l_n =0 THEN
            CONTINUE FOREACH
         END IF

         #不需要网银支付的不列出
         SELECT COUNT(*) INTO l_n
           FROM nmg_file
          WHERE nmg00 = g_nme[g_cnt].nme12
            AND nmgud03='Y' #不需要网银支付
         IF l_n >0 THEN
            CONTINUE FOREACH
         END IF
      END IF

      #支付指令说明
      SELECT tc_stf03 INTO g_nme[g_cnt].tc_stf03
        FROM tc_stf_file,nme_file,nma_file
       WHERE nme01=nma01
         AND tc_stf01=nma47
         AND tc_stf02=g_nme[g_cnt].nme24
         AND nme27=g_nme[g_cnt].nme27     #add by zhangbo121029
         AND nme24=tc_stf02               #add by zhangbo121029

      #简称和全称
      IF cl_null(g_nme[g_cnt].nmeud09) OR cl_null(g_nme[g_cnt].nme13)THEN
         #1.取得单别和单据类型
         LET l_str=g_nme[g_cnt].nme12
         LET l_type=l_str.substring(1,l_str.getIndexOf('-',1)-1)
         SELECT apykind INTO l_kind
           FROM apy_file
          WHERE apyslip=l_type

         #2.厂商付款
         IF l_kind ='11' OR l_kind ='12' OR l_kind ='15' OR l_kind ='16' OR
            l_kind ='21' OR l_kind ='22' OR l_kind ='23' OR l_kind ='24' OR
            l_kind ='26' OR l_kind ='32' OR l_kind ='35' OR l_kind ='36' OR
            l_kind ='41' THEN

            #付款厂商全称
            SELECT pmc03,pmc081 INTO g_nme[g_cnt].nme13,g_nme[g_cnt].nmeud09
              FROM pmc_file,apa_file
             WHERE apa06=pmc01               #供应商编号
               AND apa01=g_nme[g_cnt].nme12  #参考单号
         END IF

         #3.零用金付款
         IF l_kind ='13' OR l_kind ='17' OR
            l_kind ='25' OR l_kind ='34' THEN

            #员工部门
            SELECT gen02,gem02 INTO g_nme[g_cnt].nme13,g_nme[g_cnt].nmeud09
              FROM apa_file,gem_file,gen_file
             WHERE apa01=g_nme[g_cnt].nme12  #参考单号
               AND apa22=gem01
               AND gen03=gem01
               AND apa06=gen01
         END IF

         #4.付款作业
         IF l_kind ='33' THEN

            #付款厂商全称
            SELECT pmc03,pmc081 INTO g_nme[g_cnt].nme13,g_nme[g_cnt].nmeud09
              FROM pmc_file,apf_file
             WHERE apf03=pmc01               #供应商编号
               AND apf01=g_nme[g_cnt].nme12  #参考单号
         END IF

         #5.如果是银行收支单
         IF g_nme[g_cnt].nme22='07' THEN

            #5-1.取得入账类型(nmg20)
            SELECT nmg20 INTO l_nmg20 FROM nmg_file
             WHERE nmg00=g_nme[g_cnt].nme12

            #5-2.取客户档资料
            IF l_nmg20='21' OR l_nmg20='22' THEN

               #客户全称
               SELECT occ02,occ18 INTO g_nme[g_cnt].nme13,g_nme[g_cnt].nmeud09
                 FROM occ_file
                WHERE occ01=g_nme[g_cnt].nme25

            END IF

            #5-3.取供应商档资料
            IF l_nmg20='1' THEN

               #供应商全称
               SELECT pmc03,pmc081 INTO g_nme[g_cnt].nme13,g_nme[g_cnt].nmeud09
                 FROM pmc_file
                WHERE pmc01=g_nme[g_cnt].nme25

            END IF

            #5-4.取员工档资料
            IF l_nmg20='0' THEN

               #员工部门
               SELECT gen02,gem02 INTO g_nme[g_cnt].nme13,g_nme[g_cnt].nmeud09
                 FROM gen_file,gem_file
                WHERE gen01=g_nme[g_cnt].nme25
                  AND gen03=gem01

            END IF
         END IF
         UPDATE nme_file SET nmeud09 =g_nme[g_cnt].nmeud09,
                             nme13=g_nme[g_cnt].nme13
          WHERE nme12=g_nme[g_cnt].nme12
         IF STATUS THEN
            CALL cl_err('update nme_file:',STATUS,1)
            EXIT FOREACH
         END IF
      END IF

      SELECT nma02,nma04 INTO g_nme[g_cnt].nma02,g_nme[g_cnt].nma04 FROM nma_file
       WHERE nma01 = g_nme[g_cnt].nme01


      #银行编号、账户编号、系统内外、同城异地、城市名称、对公对私
      IF cl_null(g_nme[g_cnt].nmeud01) AND cl_null(g_nme[g_cnt].nmeud03) AND
         cl_null(g_nme[g_cnt].nmeud05) AND cl_null(g_nme[g_cnt].nmeud06) AND
         cl_null(g_nme[g_cnt].nmeud07) AND cl_null(g_nme[g_cnt].nmeud08) THEN

         #取最大的流水号
         LET l_nme27_max=NULL
         SELECT MAX(nme27) INTO l_nme27_max
           FROM nme_file
          WHERE nme25 =g_nme[g_cnt].nme25    #相同厂商编号
            AND nme01  =g_nme[g_cnt].nme01   #相同本方银行
            AND (nmeud01 IS NOT NULL OR nmeud03 IS NOT NULL OR
                 nmeud05 IS NOT NULL OR nmeud06 IS NOT NULL OR
                 nmeud07 IS NOT NULL OR nmeud08 IS NOT NULL)


         IF NOT cl_null(l_nme27_max) THEN

         #ERP-20171019----------------begin
         ###注释掉直接带出历史记录的方式
         {   #查出信息
            SELECT nmeud01,nmeud02,nmeud03,nmeud04,nmeud05,nmeud06,nmeud07,nmeud08,nme05
              INTO g_nme[g_cnt].nmeud01,g_nme[g_cnt].nmeud02,g_nme[g_cnt].nmeud03,g_nme[g_cnt].nmeud04,
                   g_nme[g_cnt].nmeud05,g_nme[g_cnt].nmeud06,g_nme[g_cnt].nmeud07,g_nme[g_cnt].nmeud08,
                   g_nme[g_cnt].nme05
              FROM nme_file
             WHERE nme27 = l_nme27_max
         }

           #根据最大流水号带出 nmeud05,nmeud06,nmeud07,nmeud08,nme05
           #查出信息
            SELECT nmeud05,nmeud06,nmeud07,nmeud08,nme05
              INTO g_nme[g_cnt].nmeud05,g_nme[g_cnt].nmeud06,g_nme[g_cnt].nmeud07,g_nme[g_cnt].nmeud08,
                   g_nme[g_cnt].nme05
              FROM nme_file
             WHERE nme27 = l_nme27_max
           ##对于银行行号 账号信息，直接根据pmf_file带出最新的
           SELECT pmf02,nmt02,pmf03,pmf04
             INTO g_nme[g_cnt].nmeud01,g_nme[g_cnt].nmeud02,g_nme[g_cnt].nmeud03,g_nme[g_cnt].nmeud04
             FROM pmf_file,nmt_file
             WHERE pmf01=g_nme[g_cnt].nme25
             AND pmfacti='Y' and pmf05='Y' and pmf02=nmt01

           ##ERP-20171019-------------------end

            #更新信息
            UPDATE nme_file SET nmeud01 =g_nme[g_cnt].nmeud01,
                                nmeud02 =g_nme[g_cnt].nmeud02,
                                nmeud03 =g_nme[g_cnt].nmeud03,
                                nmeud04 =g_nme[g_cnt].nmeud04,
                                nmeud05 =g_nme[g_cnt].nmeud05,
                                nmeud06 =g_nme[g_cnt].nmeud06,
                                nmeud07 =g_nme[g_cnt].nmeud07,
                                nmeud08 =g_nme[g_cnt].nmeud08,
                                nme05 =g_nme[g_cnt].nme05
             WHERE nme12=g_nme[g_cnt].nme12
            IF STATUS THEN
               CALL cl_err('update nme_file:',STATUS,1)
               EXIT FOREACH
            END IF
         END IF
      END IF

      #找出对方银行编号、对方银行名称、对方账号编号、对方账号名称
      IF cl_null(g_nme[g_cnt].nmeud01) AND cl_null(g_nme[g_cnt].nmeud03) THEN
         #1、先查询供应商
         LET g_sql="SELECT pmf02,nmt02,pmf03,pmf04",
                   "  FROM pmf_file,pmc_file,nmt_file",
                   " WHERE pmc01=pmf01(+)",
                   "   AND pmf02=nmt01(+)",
                   "   AND pmc01='",g_nme[g_cnt].nme25,"'"  #供应商编号
         PREPARE sel_pmf_pre FROM g_sql
         EXECUTE sel_pmf_pre INTO g_nme[g_cnt].nmeud01,g_nme[g_cnt].nmeud02,g_nme[g_cnt].nmeud03,g_nme[g_cnt].nmeud04
         IF STATUS=100 THEN
            #取供应商主表资料
            LET g_sql="SELECT pmc55,nmt02,pmc56,pmc081",
                      "  FROM pmc_file,nmt_file",
                      " WHERE pmc55=nmt01(+)",
                      "   AND pmc01='",g_nme[g_cnt].nme25,"'"  #供应商编号
            PREPARE sel_pmc_pre FROM g_sql
            EXECUTE sel_pmc_pre INTO g_nme[g_cnt].nmeud01,g_nme[g_cnt].nmeud02,g_nme[g_cnt].nmeud03,g_nme[g_cnt].nmeud04
         END IF

         #2、查询客户档
         IF STATUS=100 THEN

            LET g_sql="SELECT ocj02,nmt02,ocj03,ocj04",
                      "  FROM ocj_file,occ_file,nmt_file",
                      " WHERE occ01=ocj01(+)",
                      "   AND ocj02=nmt01(+)",
                      "   AND occ01='",g_nme[g_cnt].nme25,"'"  #客户编号
            PREPARE sel_ocj_pre FROM g_sql
            EXECUTE sel_ocj_pre INTO g_nme[g_cnt].nmeud01,g_nme[g_cnt].nmeud02,g_nme[g_cnt].nmeud03,g_nme[g_cnt].nmeud04

            #3、查询员工档
            IF STATUS=100 THEN

               LET g_sql="SELECT cqf02,nmt02,cqf03,cqf04",
                         "  FROM cqf_file,gen_file,nmt_file",
                         " WHERE gen01=cqf01(+)",
                         "   AND cqf02=nmt01(+)",
                         "   AND gen01='",g_nme[g_cnt].nmeud09,"'"  #员工编号
               PREPARE sel_cqf_pre FROM g_sql
               EXECUTE sel_cqf_pre INTO g_nme[g_cnt].nmeud01,g_nme[g_cnt].nmeud02,g_nme[g_cnt].nmeud03,g_nme[g_cnt].nmeud04

            END IF
         END IF

         #更新nmeud01,nmeud02,nmeud03,nmeud04
         IF NOT cl_null(g_nme[g_cnt].nmeud01) OR NOT cl_null(g_nme[g_cnt].nmeud03) THEN
            UPDATE nme_file SET nmeud01 =g_nme[g_cnt].nmeud01,
                                nmeud02 =g_nme[g_cnt].nmeud02,
                                nmeud03 =g_nme[g_cnt].nmeud03,
                                nmeud04 =g_nme[g_cnt].nmeud04
             WHERE nme12=g_nme[g_cnt].nme12
            IF STATUS THEN
               CALL cl_err('update nme_file:',STATUS,1)
               EXIT FOREACH
            END IF
         END IF

      END IF

      #获取签约类型说明
      #获取接口银行编号
      LET l_nma47=''
      SELECT nma47 INTO l_nma47 FROM nma_file WHERE nma01= g_nme[g_cnt].nme01
      LET g_nme[g_cnt].tc_std03 = ''
      SELECT tc_std03 INTO g_nme[g_cnt].tc_std03 FROM tc_std_file
       WHERE tc_std01 = l_nma47 AND tc_std02 = g_nme[g_cnt].nme19

      CALL p100_set_color(g_cnt)

      LET g_cnt = g_cnt + 1
      IF g_cnt > g_max_rec THEN
         CALL cl_err( '', 9035, 0 )
         EXIT FOREACH
      END IF
   END FOREACH
   CALL g_nme.deleteElement(g_cnt)
   LET g_rec_b = g_cnt-1
   DISPLAY g_rec_b TO FORMONLY.cnt
END FUNCTION

FUNCTION p100_set_color(p_i)
DEFINE p_i     LIKE type_file.num5
DEFINE l_n     LIKE type_file.num5
DEFINE l_color STRING
DEFINE l_str   LIKE nme_file.nme24
DEFINE l_nma47 LIKE nma_file.nma47

   LET l_nma47=''
   SELECT nma47 INTO l_nma47 FROM nma_file WHERE nma01= g_nme[p_i].nme01

  LET l_str = g_nme[p_i].nme24

  #分银行
  CASE l_nma47
     WHEN '001'
        #设置颜色
        CASE
           WHEN l_str='CNPAY' #不需要支付
              LET l_color = 'gray reverse'
           WHEN l_str='99' #未支付
              LET l_color = 'lightCyan reverse'
           WHEN l_str='7' #成功
              LET l_color = 'green reverse'
           WHEN l_str MATCHES "[68]" #失败
              LET l_color = 'red reverse'
           OTHERWISE  #支付过程中
              LET l_color = 'lightMagenta reverse'

        END CASE
      WHEN '004'
         #设置颜色
        CASE
           WHEN l_str='CNPAY' #不需要支付
              LET l_color = 'gray reverse'
           WHEN l_str='99' #未支付
              LET l_color = 'lightCyan reverse'
           WHEN l_str='4' #成功
              LET l_color = 'green reverse'
           WHEN l_str='EYZ' #成功
              LET l_color = 'green reverse'
           WHEN l_str MATCHES "[56]" #失败
              LET l_color = 'red reverse'
           WHEN l_str ='EY1' #失败
              LET l_color = 'r�d reverse'
           WHEN l_str ='EY2' #失败
              LET l_color = 'red reverse'
           WHEN l_str ='EY3' #失败
              LET l_color = 'red reverse'
           WHEN l_str ='EY4' #失败
              LET l_color = 'red reverse'
           WHEN l_str ='EYY' #失败
              LET l_color = 'red reverse'
           OTHERWISE  #支付过程中
              LET l_color = 'lightMagenta reverse'

        END CASE
   END CASE

   LET g_nme_color[p_i].chk =  l_color
   LET g_nme_color[p_i].nme25 =  l_color
   LET g_nme_color[p_i].nme13 =  l_color
   LET g_nme_color[p_i].nmeud09 =  l_color
   LET g_nme_color[p_i].nme12 =  l_color
   LET g_nme_color[p_i].nme01 =  l_color
   LET g_nme_color[p_i].nma02 =  l_color
   LET g_nme_color[p_i].nma04 =  l_color
   LET g_nme_color[p_i].nmeud01 =  l_color
   LET g_nme_color[p_i].nmeud02 =  l_color
   LET g_nme_color[p_i].nmeud03 =  l_color
   LET g_nme_color[p_i].nmeud04 =  l_color
   LET g_nme_color[p_i].nmeud05 =  l_color
   LET g_nme_color[p_i].nmeud06 =  l_color
   LET g_nme_color[p_i].nmeud07 =  l_color
   LET g_nme_color[p_i].nmeud08 =  l_color
   LET g_nme_color[p_i].nme19 =  l_color
   LET g_nme_color[p_i].tc_std03 =  l_color
   LET g_nme_color[p_i].nme05 =  l_color
   LET g_nme_color[p_i].nme02 =  l_color
   LET g_nme_color[p_i].nme04 =  l_color
   LET g_nme_color[p_i].nme08 =  l_color
   LET g_nme_color[p_i].nme24 =  l_color
   LET g_nme_color[p_i].tc_stf03 =  l_color
   LET g_nme_color[p_i].nme22 =  l_color
   LET g_nme_color[p_i].nme27 =  l_color
   LET g_nme_color[p_i].nmeud12 =  l_color
END FUNCTION

FUNCTION p100_undopay()

   IF (l_ac = 0) OR cl_null(l_ac) THEN
      RETURN
   END IF

   IF (g_nme[l_ac].nme24 = '99') OR (g_nme[l_ac].nme24 = 'CNPAY') THEN
      IF NOT cl_confirm("确定重置支付状态") THEN
         RETURN
      END IF
   ELSE
      CALL cl_err("存在支付信息不能重置支付状态","!",1)
      RETURN
   END IF

   BEGIN WORK

   IF g_nme[l_ac].chk = 'Y' THEN
      LET g_nme[l_ac].chk ='N'
   END IF

   IF g_nme[l_ac].nme24 = 'CNPAY' THEN
      LET g_nme[l_ac].nme24 = '99'
   ELSE
      LET g_nme[l_ac].nme24 = 'CNPAY'
   END IF

   UPDATE nme_file SET nme24= g_nme[l_ac].nme24
         WHERE nme27 = g_nme[l_ac].nme27

   COMMIT WORK

   SELECT tc_stf03 INTO g_nme[l_ac].tc_stf03
     FROM tc_stf_file,nme_file,nma_file
    WHERE nme01=nma01
      AND tc_stf01=nma47
      AND tc_stf02=g_nme[l_ac].nme24
      AND nme27=g_nme[l_ac].nme27
      AND nme24=tc_stf02

   CALL p100_set_color(l_ac)
  # DISPLAY ARRAY g_nme TO s_nme.* ATTRIBUTE(COUNT=g_rec_b)
  #    BEFORE DISPLAY
  #      CALL dialog.setCellAttributes(g_nme_color)
  #      EXIT DISPLAY
  # END DISPLAY

END FUNCTION


FUNCTION p100_all()
DEFINE l_i   LIKE type_file.num5
DEFINE l_n   LIKE type_file.num5
DEFINE l_nma47       LIKE nma_file.nma47

   BEGIN WORK

   FOR l_i = 1 TO g_rec_b
      IF g_nme[l_i].nme24 = 'CNPAY' THEN
         CONTINUE FOR
      END IF

      LET g_nme[l_i].chk = 'Y'
      UPDATE nme_file SET nmeud01=g_nme[l_i].nmeud01,
                          nmeud02=g_nme[l_i].nmeud02,
                          nmeud03=g_nme[l_i].nmeud03,
                          nmeud04=g_nme[l_i].nmeud04,
                          nmeud05=g_nme[l_i].nmeud05,
                          nmeud06=g_nme[l_i].nmeud06,
                          nmeud07=g_nme[l_i].nmeud07,
                          nmeud08=g_nme[l_i].nmeud08,
                          nme19=g_nme[l_i].nme19,
                          nme05=g_nme[l_i].nme05
         WHERE nme27 = g_nme[l_i].nme27
   END FOR

   COMMIT WORK

   DISPLAY ARRAY g_nme TO s_nme.* ATTRIBUTE(COUNT=g_rec_b)
      BEFORE DISPLAY
        EXIT DISPLAY
   END DISPLAY

END FUNCTION

#整批支付
FUNCTION p100_batch()
DEFINE l_sql    STRING
DEFINE l_i      LIKE type_file.num5
DEFINE l_nma47  LIKE nma_file.nma47
DEFINE l_noa05  LIKE noa_file.noa05
DEFINE l_noa05c  LIKE noa_file.noa05
DEFINE l_noa02  LIKE noa_file.noa02
DEFINE l_noa02c  LIKE noa_file.noa02
DEFINE l_n      LIKE type_file.num5
DEFINE l_tc_stg03  LIKE tc_stg_file.tc_stg03
DEFINE l_msg       LIKE type_file.chr1000
DEFINE l_cmd       STRING
DEFINE l_flag  LIKE type_file.chr1
DEFINE l_dd    LIKE type_file.num10
DEFINE l_char  LIKE type_file.chr4000
DEFINE l_year LIKE type_file.num10
DEFINE l_month LIKE type_file.num10
DEFINE l_day LIKE type_file.num10
DEFINE l_cnt   LIKE type_file.num5 #No:180808 add
DEFINE l_cnt1  LIKE type_file.num5 #No:180921 add by lixwz 180921
   LET l_flag = 'N'
   LET l_n=0
   SELECT COUNT(*) INTO l_n FROM nme_t_file WHERE 1=1
   IF l_n>0 THEN
      CALL cl_err("已有用户在支付,请稍后重试","!",0)
      RETURN
   END IF
   CALL s_showmsg_init()
   LET l_sql="INSERT INTO nme_t_file(chk,nme25,nme13,nmeud09,nme12,nme01,nma02,nma04,nmeud01,nmeud02,nmeud03,nmeud04,nmeud05,",
             "                       nmeud06,nmeud07,nmeud08,nme19,tc_std03,nme05,nme02,nme04,nme08,nme24,tc_stf03,nme22,nme27,noa05,noa02,noa05c,noa02c )",
             " VALUES (?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?)"
   PREPARE p100_ins_pre1 FROM l_sql
   #插入临时表数据
   LET l_cnt1 = 0  #No:180921 add by lixwz 180921
   FOR l_i=1 TO g_rec_b
      #打勾的
      IF g_nme[l_i].chk='Y' THEN
         #No:180921 add by lixwz 180921 e---
         # 只能一笔再次支付
         LET l_cnt1 = l_cnt1 + 1
         IF l_cnt1 >  1 AND g_action_choice = 'update_pay_status' THEN
            CALL cl_err('','cnm-006',1)
            DELETE FROM nme_t_file
            RETURN
         END IF
         #No:180921 add by lixwz 180921 e---
      	 #No:180808 add begin------#如果有支付记录，不可重复支付
         LET l_cnt=0
         SELECT count(*) INTO l_cnt FROM tc_nps_file
         WHERE tc_nps03='1' and  tc_nps02=g_nme[l_i].nme27
         IF cl_null(l_cnt) THEN LET l_cnt=0 END IF
         #IF l_cnt>0 THEN                              #No:180809 mark
         #IF l_cnt>0 AND g_nme[l_ac].nme24 <> '6' THEN  #No:180809 add  #No:180921 mark by lixwz 180921
         IF l_cnt>0 AND g_nme[l_ac].nme24 <> '6' AND g_action_choice <> 'update_pay_status' THEN  #No:180809 add   #No:180921 add by lixwz 180921
      	 # LET g_nme[l_i].chk='N'
      	    CALL s_errmsg('nme27',g_nme[l_i].nme27,'已有支付记录，不可重复提交','!',1)  #No:180809 add
      	    CONTINUE FOR
         END IF
         #No:180808 add end--------
         #可支付状态
         LET l_n = 0
         SELECT COUNT(*) INTO l_n
           FROM tc_stf_file,nma_file
          WHERE tc_stf02=g_nme[l_i].nme24
            AND tc_stf01=nma47
            AND nma01=g_nme[l_i].nme01
            AND tc_stf04='Y'
         IF cl_null(l_n) THEN LET l_n = 0 END IF
         IF l_n >0 THEN
            LET l_nma47 = ''
            SELECT DISTINCT nma47 INTO l_nma47 FROM nma_file WHERE nma01=g_nme[l_i].nme01
            LET l_noa05 = ''
            LET l_noa05c = ''
            SELECT tc_stc05,tc_stc08 INTO l_noa05,l_noa05c FROM tc_stc_file
             WHERE tc_stc01=l_nma47  AND tc_stc02=g_nme[l_i].nmeud08
               AND tc_stc03='1' AND tc_stc07=g_nme[l_i].nmeud05
               AND tc_stc06='Y'
            LET l_noa02 = ''
            LET l_noa02c = ''
            SELECT noa02 INTO l_noa02 FROM noa_file
             WHERE noa01=l_nma47 AND noa05=l_noa05
               AND noa04='2' AND noa14='1'
               AND noa13='Y'
            SELECT noa02 INTO l_noa02c FROM noa_file
             WHERE noa01=l_nma47 AND noa05=l_noa05c
               AND noa04='2' AND noa14='1'
               AND noa13='Y'


            #EXECUTE p100_ins_pre1 USING g_nme[l_i].*,l_noa05,l_noa02,l_noa05c,l_noa02c     modified by agan 20170608
            EXECUTE p100_ins_pre1 USING g_nme[l_i].chk,g_nme[l_i].nme25,g_nme[l_i].nme13,g_nme[l_i].nmeud09,g_nme[l_i].nme12,
                                        g_nme[l_i].nme01,g_nme[l_i].nma02,g_nme[l_i].nma04,g_nme[l_i].nmeud01,
                                        g_nme[l_i].nmeud02,g_nme[l_i].nmeud03,g_nme[l_i].nmeud04,g_nme[l_i].nmeud05,g_nme[l_i].nmeud06,
                                        g_nme[l_i].nmeud07,g_nme[l_i].nmeud08,g_nme[l_i].nme19,g_nme[l_i].tc_std03,g_nme[l_i].nme05,
                                        g_nme[l_i].nme02,g_nme[l_i].nme04,g_nme[l_i].nme08,g_nme[l_i].nme24,g_nme[l_i].tc_stf03,
                                        g_nme[l_i].nme22,g_nme[l_i].nme27,l_noa05,l_noa02,l_noa05c,l_noa02c
         END IF
         #未支付状态，但是有支付记录，提醒
         IF g_nme[l_i].nme24='99' THEN
            LET l_n = 0
            SELECT COUNT(*) INTO l_n
              FROM tc_nps_file
             WHERE tc_nps02=g_nme[l_i].nme27
               AND tc_nps03='1'
            IF cl_null(l_n) THEN LET l_n = 0 END IF
            IF l_n >0 THEN
               CALL p100_upd_pay_status()
               LET g_cnt = l_i
               IF g_nme[g_cnt].nme24 <> '99' THEN
                  CALL s_errmsg('nme12',g_nme[l_i].nme27,'已提交支付，不需再支付','!',1)
                  LET g_success = 'N'
               ELSE
                  CALL s_errmsg('nme12',g_nme[l_i].nme27,'已提交支付，但是支付状态为未支付，请更新支付状态','!',1)
               END IF
               #CALL s_errmsg('nme12',g_nme[l_i].nme27,'已提交支付，但是支付状态为未支付，请更新支付状态','!',1)
            END IF
         END IF
      END IF
   END FOR

   ###ERP-20180226-----------------begin
   LET l_n = 0
   LET l_dd = ''

   #select to_number(to_char(sysdate, 'dd' )) into l_dd from dual

   #根据811单据的立账日期apa02来判断月结单据是否存在必须在23号之后支付的单据
   #针对跨月的单据，例如2018/1/12的单子，可以在2月23号之后都可以支付；针对当月的单子，当月23号之后才可支付
   LET l_sql = " select sum(case when ( ((to_number(to_char(apa02, 'yyyy' ))-1)*365 + to_number(to_char(apa02, 'mm' ))*30 ) ",
               " =(select ((to_number(to_char(sysdate, 'yyyy' ))-1)*365  ",
               " + to_number(to_char(sysdate, 'mm' ))*30 ) from dual)  and (select to_number(to_char(sysdate, 'dd' )) from dual) < 23 ) ",
               " then 1  ",
               " when ( ((to_number(to_char(apa02, 'yyyy' ))-1)*365 + to_number(to_char(apa02, 'mm' ))*30 )   ",
     					 " =(select ((to_number(to_char(sysdate, 'yyyy' ))-1)*365  ",
               " + to_number(to_char(sysdate, 'mm' ))*30 ) from dual)  and to_number(to_char(apa02, 'dd' )) > 23 )  ",
               " then 0  ",
               " when ( ((to_number(to_char(apa02, 'yyyy' ))-1)*365 + to_number(to_char(apa02, 'mm' ))*30 )   ",
               " <(select ((to_number(to_char(sysdate, 'yyyy' ))-1)*365   ",
               " + to_number(to_char(sysdate, 'mm' ))*30 ) from dual)  ",
               " ) then 0  ",
               " when (  ((to_number(to_char(apa02, 'yyyy' ))-1)*365 + to_number(to_char(apa02, 'mm' ))*30 )  ",
               " >(select ((to_number(to_char(sysdate, 'yyyy' ))-1)*365  ",
               "  + to_number(to_char(sysdate, 'mm' ))*30 ) from dual) ",
               " ) then 1  ",
               " end  )  as nu ",
	             " from apf_file ,apg_file,nme_t_file,tc_apa_file ,apa_file  ",
               " where apf01 = apg01 and apg04 = tc_apa01 and apf01 = nme12  and tc_apa01 = apa01 and tc_apa23 = '0'  "
   PREPARE p100_pre022 FROM l_sql
   EXECUTE p100_pre022 INTO l_n

   #存在月结单据，23号之前不可提交
   IF l_n > 0 THEN
         LET l_sql = " select concat('要提交支付的单据中存在月结单据，不可23号之前进行提交！！请检查！月结单据号为：',wm_concat(to_char(nme12))) ",
         						 " from apf_file ,apg_file,nme_t_file,tc_apa_file ,apa_file ",
                     " where apf01 = apg01 and apg04 = tc_apa01 and apf01 = nme12 and tc_apa01 = apa01 and tc_apa23 = '0' ",
								     " and ( ",
                     " (( to_number(to_char(apa02, 'yyyy' ))-1)*365 + to_number(to_char(apa02, 'mm' ))*30 =(select ((to_number(to_char(sysdate, 'yyyy' ))-1)*365 ",
                     " + to_number(to_char(sysdate, 'mm' ))*30 ) from dual)  ",
                     " and (( select to_number(to_char(sysdate, 'dd' )) from dual)<23 ) )",
                     "  or ",
                     " ( ( to_number(to_char(apa02, 'yyyy' ))-1)*365 + to_number(to_char(apa02, 'mm' ))*30 >(select ((to_number(to_char(sysdate, 'yyyy' ))-1)*365 ",
                     " + to_number(to_char(sysdate, 'mm' ))*30 ) from dual)  ) ) "

   			 PREPARE p100_pre02 FROM l_sql
   			 EXECUTE p100_pre02 INTO l_char

         #CALL cl_err('','cnm-004',1)
         CALL cl_err(l_char,'cnm-004',1)
         DELETE FROM nme_t_file
         RETURN
   END IF

   ###ERP-20180226-------------------end
   CALL s_showmsg()
   #如果存在nmeud12为空的情况，弹窗输入支付批号，更新nmeud12 #add by wangxu170607
   FOR l_i=1 TO g_rec_b
        #打勾的
        IF g_nme[l_i].chk='Y' THEN
                IF g_nme[l_i].nmeud12 = '' OR cl_null(g_nme[l_i].nmeud12) THEN
                        LET l_flag = 'Y'
                END IF
        END IF
   END FOR
   IF l_flag = 'Y' THEN
        OPEN WINDOW p100_w_1 WITH FORM "cnm/42f/cnmp100_02"
                ATTRIBUTE (STYLE = g_win_style CLIPPED)
        INPUT g_nmeud12
                WITHOUT DEFAULTS FROM nmeud12
                BEFORE INPUT
                        LET l_year = year(g_today)
                        LET l_month = month(g_today)
                        LET l_day = day(g_today)
                        SELECT MAX(nmeud12) INTO g_nmeud12 FROM nme_file
                        IF cl_null(g_nmeud12) THEN
                                LET g_nmeud12 = l_year * 1000000 + l_month * 10000 + l_day * 100 + 1
                        ELSE
                                LET g_nmeud12 = g_nmeud12 + 1
                        END IF
                AFTER FIELD nmeud12
                        IF cl_null(g_nmeud12) THEN
                                CALL cl_err('','',1)
                                NEXT FIELD nmeud12
                        END IF
        END INPUT
        CLOSE WINDOW p100_w_1
        FOR l_i=1 TO g_rec_b
        #打勾的
                IF g_nme[l_i].chk='Y' THEN
                        UPDATE nme_file SET nmeud12 = g_nmeud12 WHERE nme12 = g_nme[l_i].nme12
                        #IF sqlca.code THEN
                        #        CALL cl_err('','',1)
                        #END IF
                END IF
        END FOR
   END IF
   #如果存在nmeud12为空的情况，弹窗输入支付批号，更新nmeud12 #add by wangxu170607
   #有支付错误信息,提醒是否执行
   IF g_err_msg.getLength() > 0 THEN
      LET l_msg="是否继续执行?"
      IF NOT cl_confirm(l_msg) THEN
         RETURN
      END IF
   END IF

   #显示汇总信息
   CALL p100_show_detail()

   IF g_payFlag = 'N' THEN
      DELETE FROM nme_t_file
      CALL p100_b_fill(g_wc)
      RETURN
   END IF

   #获取接口银行编号
   LET l_nma47=''
   LET l_sql="SELECT DISTINCT nma47 FROM nma_file,nme_t_file WHERE nma01=nme01 AND nma47 IS NOT NULL "

   PREPARE p100_pp1 FROM l_sql
   DECLARE p100_cc1 CURSOR FOR p100_pp1

   FOREACH p100_cc1 INTO l_nma47
      #根据接口银行编号,和cnmi002中的维护的接口程序,调用不同的程序
      SELECT tc_stg03 INTO l_tc_stg03 FROM tc_stg_file
       WHERE tc_stg01=l_nma47 AND tc_stg02='1'
      LET l_cmd=l_tc_stg03 CLIPPED," 'p' '",l_nma47,"'"
      CALL cl_cmdrun_wait(l_cmd)
   END FOREACH
   ##ERP-20160711----------begin  调用网银支付接口程序后，根据更新后的nme24（支付状态）字段，判断是否支付成功
   CALL p100_upd_oa()
   ##ERP-20160711----------end
   DELETE FROM nme_t_file
   CALL p100_b_fill(g_wc)
END FUNCTION

#显示汇总数据
FUNCTION p100_show_detail()
DEFINE l_conf  DYNAMIC ARRAY OF RECORD
            c1   LIKE nme_file.nme25,
            c2   LIKE nme_file.nmeud09,
            c3   LIKE nme_file.nmeud01,
            c4   LIKE nme_file.nmeud02,
            c5   LIKE nme_file.nmeud03,
            c6   LIKE nme_file.nmeud04,
            c7   LIKE nme_file.nme08,
            c8   LIKE nme_file.nme12
               END RECORD
DEFINE l_sum   LIKE nme_file.nme08
DEFINE l_cn    LIKE type_file.num20

   OPEN WINDOW p100_c_w WITH FORM "cnm/42f/cnmp100_c"
         ATTRIBUTE (STYLE = g_win_style CLIPPED)

   CALL cl_ui_init()

   LET g_payFlag = 'Y'

   LET g_sql="SELECT nme25,nmeud09,nmeud01,nmeud02,nmeud03,nmeud04,nme08,nme12 FROM nme_t_file "

   PREPARE sel_detail_pre FROM g_sql
   DECLARE sel_detail_cs CURSOR FOR sel_detail_pre

   LET g_cnt = 1
   CALL l_conf.clear()

   LET l_sum = 0

   FOREACH sel_detail_cs INTO l_conf[g_cnt].*
       LET l_sum = l_sum + l_conf[g_cnt].c7
       LET g_cnt = g_cnt + 1
   END FOREACH
   CALL l_conf.deleteElement(g_cnt)
   LET l_cn = g_cnt -1
   DISPLAY l_sum TO sum
   DISPLAY l_cn TO cn
   DISPLAY ARRAY l_conf TO s_conf.*
      ON ACTION close
         LET g_payFlag = "N"
         EXIT DISPLAY

      ON ACTION exit
         LET g_payFlag = "N"
         EXIT DISPLAY

      ON ACTION cancel
         LET g_payFlag = "N"
         EXIT DISPLAY
   END DISPLAY

   CLOSE WINDOW p100_c_w

END FUNCTION

#更新支付状态
FUNCTION p100_upd_pay_status()
DEFINE l_sql    STRING
DEFINE l_i      LIKE type_file.num5
DEFINE l_nma47  LIKE nma_file.nma47
DEFINE l_noa05  LIKE noa_file.noa05
DEFINE l_noa05c  LIKE noa_file.noa05
DEFINE l_noa02  LIKE noa_file.noa02
DEFINE l_noa02c  LIKE noa_file.noa02
DEFINE l_n      LIKE type_file.num5
DEFINE l_tc_stg03  LIKE tc_stg_file.tc_stg03
DEFINE l_cmd     STRING
DEFINE l_cnt     LIKE type_file.num5  #No:180921 add
   LET l_n=0
   SELECT COUNT(*) INTO l_n FROM nme_t_file
   IF l_n>0 THEN
      CALL cl_err("已有用户在支付,请稍后重试","!",0)
      RETURN
   END IF

   #No:180921 add s---
   UPDATE nme_need_batch
      SET need = 'N'
   #No:180921 add e---

   LET l_sql="INSERT INTO nme_t_file(chk,nme25,nme13,nmeud09,nme12,nme01,nma02,nma04,nmeud01,nmeud02,nmeud03,nmeud04,nmeud05,",
             "                       nmeud06,nmeud07,nmeud08,nme19,tc_std03,nme05,nme02,nme04,nme08,nme24,tc_stf03,nme22,nme27,noa05,noa02,noa05c,noa02c )",
             " VALUES (?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?)"
   PREPARE p100_ins_pre2 FROM l_sql
   #插入临时表数据
   FOR l_i=1 TO g_rec_b
      #打勾的
      IF g_nme[l_i].chk='Y' THEN
         SELECT DISTINCT nma47 INTO l_nma47 FROM nma_file WHERE nma01=g_nme[l_i].nme01
         SELECT tc_stc08 INTO l_noa05 FROM tc_stc_file
          WHERE tc_stc01=l_nma47 AND tc_stc02=g_nme[l_i].nmeud08
            AND tc_stc03='1' AND tc_stc07=g_nme[l_i].nmeud05
            AND tc_stc06='Y'
         SELECT noa02 INTO l_noa02 FROM noa_file
          WHERE noa01=l_nma47 AND noa05=l_noa05
            AND noa04='2' AND noa14='1' AND noa13='Y'
         #EXECUTE p100_ins_pre2 USING g_nme[l_i].*,l_noa05,l_noa02,l_noa05,l_noa02
         EXECUTE p100_ins_pre2 USING g_nme[l_i].chk,g_nme[l_i].nme25,g_nme[l_i].nme13,g_nme[l_i].nmeud09,g_nme[l_i].nme12,
                                        g_nme[l_i].nme01,g_nme[l_i].nma02,g_nme[l_i].nma04,g_nme[l_i].nmeud01,
                                        g_nme[l_i].nmeud02,g_nme[l_i].nmeud03,g_nme[l_i].nmeud04,g_nme[l_i].nmeud05,g_nme[l_i].nmeud06,
                                        g_nme[l_i].nmeud07,g_nme[l_i].nmeud08,g_nme[l_i].nme19,g_nme[l_i].tc_std03,g_nme[l_i].nme05,
                                        g_nme[l_i].nme02,g_nme[l_i].nme04,g_nme[l_i].nme08,g_nme[l_i].nme24,g_nme[l_i].tc_stf03,
                                        g_nme[l_i].nme22,g_nme[l_i].nme27,l_noa05,l_noa02,l_noa05,l_noa02
      END IF
   END FOR

   #获取接口银行编号
   LET l_nma47=''
   LET l_sql="SELECT DISTINCT nma47 FROM nma_file,nme_t_file WHERE nma01=nme01 AND nma47 IS NOT NULL "
   PREPARE p100_pp2 FROM l_sql
   DECLARE p100_cc2 CURSOR FOR p100_pp2

   FOREACH p100_cc2 INTO l_nma47
      #根据接口银行编号,和cnmi002中的维护的接口程序,调用不同的程序
      SELECT tc_stg03 INTO l_tc_stg03 FROM tc_stg_file
       WHERE tc_stg01=l_nma47 AND tc_stg02='1'
      LET l_cmd=l_tc_stg03 CLIPPED," 'q' '",l_nma47,"'"
      CALL cl_cmdrun_wait(l_cmd)
   END FOREACH

   DELETE FROM nme_t_file
   #No:180921 add s---
   SELECT count(1) INTO l_cnt
     FROM nme_need_batch
    WHERE need ='Y'
   IF l_cnt > = 1 THEN
      CALL p100_batch()
   END IF
   #No:180921 add e---
   CALL p100_b_fill(g_wc)
   ##ERP-20160711----------begin  调用网银支付接口程序后，根据更新后的nme24（支付状态）字段，判断是否支付成功
   CALL p100_upd_oa()
   ##ERP-20160711----------end
END FUNCTION


#支付历史查询
FUNCTION p100_qry_pay(p_msg)
DEFINE p_msg    STRING
DEFINE l_nma47  LIKE nma_file.nma47
DEFINE g_tc_nps DYNAMIC ARRAY OF RECORD
             tc_nps07    LIKE tc_nps_file.tc_nps07,
             tc_nps08    LIKE tc_nps_file.tc_nps08,
             tc_nps09    LIKE tc_nps_file.tc_nps09,
             tc_nps09_desc    LIKE type_file.chr1000,
             tc_nps03    LIKE tc_nps_file.tc_nps03,
             tc_nps01    LIKE tc_nps_file.tc_nps01,
             tc_nps02    LIKE tc_nps_file.tc_nps02,
             tc_nps05    LIKE tc_nps_file.tc_nps05,
             tc_nps04    LIKE tc_nps_file.tc_nps04,
             tc_nps04_desc    LIKE type_file.chr1000,
             tc_nps06    LIKE tc_nps_file.tc_nps06,
             tc_nps10    LIKE tc_nps_file.tc_nps10,
             tc_nps11    LIKE tc_nps_file.tc_nps11,
             tc_nps12    LIKE tc_nps_file.tc_nps12,
             tc_nps13    LIKE tc_nps_file.tc_nps13,
             tc_nps14    LIKE tc_nps_file.tc_nps14,
             tc_nps15    LIKE tc_nps_file.tc_nps15,
             tc_nps16    LIKE tc_nps_file.tc_nps16,
             tc_nps17    LIKE tc_nps_file.tc_nps17,
             tc_nps18    LIKE tc_nps_file.tc_nps18
                 END RECORD

DEFINE l_ac    LIKE type_file.num5
DEFINE l_count LIKE type_file.num5

   #没有资料时不显示画面。
   LET g_sql="SELECT COUNT(*) FROM tc_nps_file",
             " WHERE ",p_msg
   PREPARE q_tc_nps_count_pre FROM g_sql
   EXECUTE q_tc_nps_count_pre INTO l_count
   IF l_count=0 THEN
      RETURN
   END IF

   OPEN WINDOW p100_q_w WITH FORM "cnm/42f/anmp011_q"
         ATTRIBUTE (STYLE = g_win_style CLIPPED)

   CALL cl_ui_init()

   LET g_sql="SELECT tc_nps07,tc_nps08,tc_nps09,'',tc_nps03,",
             "       tc_nps01,tc_nps02,tc_nps05,tc_nps04,'',tc_nps06,tc_nps10,tc_nps11,tc_nps12,",
             "       tc_nps13,tc_nps14,tc_nps15,tc_nps16,tc_nps17,tc_nps18",
             "  FROM tc_nps_file",
             " WHERE ",p_msg,
             " ORDER BY tc_nps07,tc_nps08"
   PREPARE q_tc_nps_pre FROM g_sql
   DECLARE q_tc_nps_cur CURSOR FOR q_tc_nps_pre
   LET l_ac=1
   FOREACH q_tc_nps_cur INTO g_tc_nps[l_ac].*
      #网络银行编号
      SELECT nma47 INTO l_nma47 FROM nma_file,nme_file
       WHERE nma01=nme01
         AND nme27=g_tc_nps[l_ac].tc_nps02

      #网络银行名称
      SELECT noc02 INTO g_tc_nps[l_ac].tc_nps09_desc FROM noc_file
       WHERE noc01=l_nma47

      #指令状态描述
      SELECT tc_stf03 INTO g_tc_nps[l_ac].tc_nps04_desc
        FROM tc_stf_file
       WHERE tc_stf01=l_nma47
         AND tc_stf02=g_tc_nps[l_ac].tc_nps04
       LET l_ac=l_ac+1
   END FOREACH
   CALL g_tc_nps.deleteElement(l_ac)
   DISPLAY ARRAY g_tc_nps TO s_tc_nps.*
      ON ACTION close
         LET INT_FLAG=FALSE
         LET g_action_choice="close"
         EXIT DISPLAY

      ON ACTION exit
         LET INT_FLAG=FALSE
         LET g_action_choice="exit"
         EXIT DISPLAY

      ON ACTION cancel
         LET INT_FLAG=FALSE
         LET g_action_choice="close"
         EXIT DISPLAY
   END DISPLAY
   CLOSE WINDOW p100_q_w
END FUNCTION


##ERP-20160711----------begin  调用网银支付接口程序后，根据更新后的nme24（支付状态）字段，判断是否支付成功
FUNCTION p100_upd_oa()
DEFINE l_length    LIKE type_file.num5   ##ERP-20160711
DEFINE l_nme12     LIKE type_file.chr50  ##ERP-20160711
DEFINE l_nme24     LIKE nme_file.nme24   ##ERP-20160711
DEFINE p_nma47     LIKE nma_file.nma47   ##ERP-20160711
DEFINE l_requestid LIKE type_file.chr50  ##ERP-20160711
DEFINE li_result   STRING                ##ERP-20160711
DEFINE li_msg      STRING                ##ERP-20160711
DEFINE l_sql1      STRING                ##ERP-20160711
DEFINE l_apg04     LIKE apg_file.apg04   ##ERP-20160810
DEFINE l_sql       STRING

   LET l_sql="select distinct b.nme12,b.nme24,a.nma47 from nma_file a ,nme_t_file  b where a.nma01=b.nme01 "   ##找出nme_t_file表中的每个参考单号

   PREPARE p100_nn1 FROM l_sql
   DECLARE p100_mm1 CURSOR FOR p100_nn1

   FOREACH p100_mm1 INTO l_nme12,l_nme24,p_nma47

   LET l_sql1 = "select apg04 from apf_file,apg_file  ",
                "where apf01=apg01 and apf01='",l_nme12,"' and apf41='Y'"
   PREPARE p100_apg FROM l_sql1
   DECLARE p100_apg1 CURSOR FOR p100_apg

   FOREACH p100_apg1 INTO l_apg04

   LET l_apg04 = g_plant,'-',l_apg04     ##组合成‘DS2-814-13110408’的格式

   LET l_sql1="SELECT requestid   FROM erpoa.tc_fybxid_file ",   ##根据单号，找到对应的流程id
             " WHERE erpno = '",l_apg04,"' "
   PREPARE p100_nn2 FROM l_sql1
   EXECUTE p100_nn2 INTO l_requestid

   SELECT length(g_user) INTO l_length FROM dual   ##若工号有5位的，则转换为6位的
   IF l_length=5 THEN
   	  LET g_user = '0' || g_user
   END IF

   IF NOT cl_null(l_requestid) THEN     ###若该单号为OA费用抛转生成的
   	  IF p_nma47 = '001' THEN           ##根据接口银行nma47，判断不同的支付成功的状态
   	     IF l_nme24 = '4' OR l_nme24 = 'EYZ' THEN
   	        CALL BxdAutoApprov(l_requestid,g_user,' ')  RETURNING li_result,li_msg
   	        IF li_result = false THEN
   	        	 MESSAGE "OA操作失败","请到OA页面确认单号：",l_nme12,""
   	        END IF
   	     END IF
   	   END IF
   	   IF p_nma47 = '004' THEN
   	   	  IF l_nme24 = '7' THEN
   	   	     CALL BxdAutoApprov(l_requestid,g_user,' ')  RETURNING li_result,li_msg
   	         IF li_result = false THEN
   	        	  MESSAGE "OA操作失败","请到OA页面确认单号：",l_nme12,""
   	         END IF
   	      END IF
   	   END IF
   END IF
  END FOREACH
 END FOREACH

END FUNCTION
##ERP-20160711----------end