# Prog. Version..: '5.30.18-15.05.12(00006)'     #
#
# Pattern name...: cxmq629
# Descriptions...: 签收库存比对报表
# Date & Author..: 16/12/26 By lifang
# Modify.........:

# lixwz180413  add by lixwz 180413

DATABASE ds

GLOBALS "../../../tiptop/config/top.global"

   DEFINE tm  RECORD
              wc2 STRING
              END RECORD
   DEFINE g_oga03         LIKE oga_file.oga03
   DEFINE g_ogb04         LIKE ogb_file.ogb04
   DEFINE g_oga66         LIKE oga_file.oga66
   DEFINE g_oga67         LIKE oga_file.oga67
   DEFINE g_b_flag        LIKE type_file.chr1
   DEFINE l_where         STRING
   DEFINE g_sql           STRING
   DEFINE g_str           STRING
   DEFINE l_table         STRING
   DEFINE g_msg           STRING
   DEFINE g_rec_b         LIKE type_file.num10
   DEFINE g_cnt           LIKE type_file.num10
   DEFINE g_ogb,g_ogb_excel   DYNAMIC ARRAY OF RECORD
                ogb01   LIKE ogb_file.ogb01,
                ogb03   LIKE ogb_file.ogb03,
                oga02   LIKE oga_file.oga02,
                oga03   LIKE oga_file.oga03,

                oga032  LIKE oga_file.oga032,
                oga14   LIKE oga_file.oga14,
                gen02   LIKE gen_file.gen02,
                oga15   LIKE oga_file.oga15,
                gem02   LIKE gem_file.gem02,
                oga23   LIKE oga_file.oga23,
                oga211  LIKE oga_file.oga211,

                ogb31   LIKE ogb_file.ogb31,
                ogb32   LIKE ogb_file.ogb32,
                ogb04   LIKE ogb_file.ogb04,
                ima02   LIKE ima_file.ima02,
                ogb12   LIKE ogb_file.ogb12,

                qs      LIKE ogb_file.ogb12,
                qt      LIKE ogb_file.ogb12,
                unqs    LIKE ogb_file.ogb12,
                ogb13   LIKE ogb_file.ogb13,
                ogb14   LIKE ogb_file.ogb14,

                ogb14t  LIKE ogb_file.ogb14t,
                ogb09   LIKE ogb_file.ogb09,
                ogb091  LIKE ogb_file.ogb091,
                ogb092  LIKE ogb_file.ogb092,
                ogapost LIKE oga_file.ogapost,

                oga66   LIKE oga_file.oga66,
                oga67   LIKE oga_file.oga67
                         END RECORD
    DEFINE g_ogb_1          DYNAMIC ARRAY OF RECORD
                oga03_1     LIKE oga_file.oga03,
                oga032_1    LIKE oga_file.oga032,
                ogb04_1     LIKE ogb_file.ogb04,
                ogb06_1     LIKE ogb_file.ogb06,
                ima021_1    LIKE ima_file.ima021,
                oga66_1     LIKE oga_file.oga66,
                oga67_1     LIKE oga_file.oga67,
                unqs_1      LIKE ogb_file.ogb12,
                img10_1     LIKE img_file.img10,
                diff_1      LIKE img_file.img10
                         END RECORD

   DEFINE g_row_count    LIKE type_file.num10
   DEFINE g_curs_index   LIKE type_file.num10
   DEFINE g_jump         LIKE type_file.num10
   DEFINE mi_no_ask      LIKE type_file.num5
   DEFINE g_no_ask       LIKE type_file.num5
   DEFINE l_ac,l_ac1     LIKE type_file.num5
   DEFINE g_cmd          LIKE type_file.chr1000
   DEFINE g_rec_b2       LIKE type_file.num10
   DEFINE g_flag         LIKE type_file.chr1
   DEFINE g_action_flag  LIKE type_file.chr100
   DEFINE   w    ui.Window
   DEFINE   f    ui.Form
   DEFINE   page om.DomNode

MAIN
   OPTIONS
      INPUT NO WRAP
   DEFER INTERRUPT                        # Supress DEL key function

   IF (NOT cl_user()) THEN
      EXIT PROGRAM
   END IF

   WHENEVER ERROR CALL cl_err_msg_log

   IF (NOT cl_setup("cxm")) THEN
      EXIT PROGRAM
   END IF

   CALL cl_used(g_prog,g_time,1) RETURNING g_time

   OPEN WINDOW q629_w AT 5,10
        WITH FORM "cxm/42f/cxmq629" ATTRIBUTE(STYLE = g_win_style)

   CALL cl_ui_init()
   CALL cl_set_act_visible("revert_filter",FALSE)
   CALL q629_table()  #FUN-D10105 add
   CALL q629_q()      #add by lifang 170309
   CALL q629_menu()
   DROP TABLE cxmq629_tmp;
   CLOSE WINDOW q629_w
   CALL cl_used(g_prog,g_time,2) RETURNING g_time
END MAIN

FUNCTION q629_menu()
   DEFINE   l_cmd   STRING
   DEFINE   l_msg   STRING

   WHILE TRUE
#      CALL q629_bp("G")    # mark by lifang 170309
#--add by lifang 170309 begin#
     IF cl_null(g_action_choice) THEN
        IF g_action_flag = "page1" THEN
           CALL q629_bp("G")
        END IF
        IF g_action_flag = "page2" THEN
           CALL q629_bp2()
        END IF
     END IF

      CASE g_action_choice
        WHEN "page1"
             CALL q629_bp("G")
        WHEN "page2"
             CALL q629_bp2()
#--add by lifang 170309 end#
        WHEN "query"
            IF cl_chk_act_auth() THEN
               CALL q629_q()
            END IF
            LET g_action_choice = " "
         WHEN "help"
            CALL cl_show_help()
            LET g_action_choice = " "
         WHEN "exit"
            EXIT WHILE
         WHEN "controlg"
            CALL cl_cmdask()
            LET g_action_choice = " "
         WHEN "exporttoexcel"     #匯出Excel
            IF cl_chk_act_auth() THEN
             #--mark by lifang 170308 begin#
               LET w = ui.Window.getCurrent()
               LET f = w.getForm()
               CASE g_action_flag
                  WHEN 'page1'
                     LET page = f.FindNode("Page","page1")
                     CALL cl_export_to_excel(page,base.TypeInfo.create(g_ogb_excel),'','')
                  WHEN 'page2'
                     LET page = f.FindNode("Page","page2")
                     CALL cl_export_to_excel(page,base.TypeInfo.create(g_ogb_1),'','')
               END CASE
             #--mark by lifang 170308 end#
            END IF
            LET g_action_choice = " "
         WHEN "related_document"  #相關文件
            IF cl_chk_act_auth() THEN
               LET g_doc.column1 = "oga01"
               LET g_doc.value1 = ''
               CALL cl_doc()
            END IF
            LET g_action_choice = " "
      END CASE
   END WHILE
END FUNCTION


FUNCTION q629_b_fill()      #明细
   DEFINE l_cnt      LIKE type_file.num10
   DEFINE l_sql1     STRING                #add by lifang 170309

#--mark by lifang 170309 begin#
#   LET g_sql = " SELECT * FROM cxmq629_tmp ",
#               " WHERE oga03 = '",g_oga03,"'",
#               "  AND ogb04 = '",g_ogb04 ,"'",
#               "  AND oga66 = '",g_oga66,"'",
#               "  AND oga67 = '",g_oga67,"'",
#               " ORDER BY ogb01,ogb03 "
#--mark by lifang 170309 end#
#--add by lifang 170309 begin#
    LET l_sql1 = " ORDER BY ogb01,ogb03 "
    LET g_sql = " SELECT * FROM cxmq629_tmp "
        IF NOT cl_null(g_str) THEN
           LET g_sql = g_sql,g_str,l_sql1
        ELSE
         	 LET g_sql = g_sql,l_sql1
        END IF
#--add by lifang 170309 end#

   PREPARE cxmq629_pb FROM g_sql
   DECLARE oga_curs  CURSOR FOR cxmq629_pb        #CURSOR


   CALL g_ogb.clear()
   CALL g_ogb_excel.clear()
   LET l_cnt = 1
   LET g_rec_b = 0

   FOREACH oga_curs INTO g_ogb_excel[l_cnt].*
      IF SQLCA.sqlcode THEN
         CALL cl_err('foreach:',SQLCA.sqlcode,1)
         EXIT FOREACH
      END IF
      #IF g_ogb_excel[l_cnt].unqs <=0 THEN CONTINUE FOREACH END IF            #add by lifang 161220
      IF l_cnt < = g_max_rec THEN
         LET g_ogb[l_cnt].* = g_ogb_excel[l_cnt].*
      END IF
      LET l_cnt = l_cnt + 1

   END FOREACH
#  IF l_cnt <= g_max_rec THEN
   CALL g_ogb.deleteElement(l_cnt)
#  END IF
   CALL g_ogb_excel.deleteElement(l_cnt)
   LET g_rec_b = l_cnt-1
   DISPLAY g_rec_b TO FORMONLY.cnt

END FUNCTION

FUNCTION q629_bp(p_ud)
   DEFINE   p_ud   LIKE type_file.chr1

   IF p_ud <> "G" OR g_action_choice = "detail" THEN
      RETURN
   END IF
#--add by lifang 170309 begin#
   LET g_action_flag = 'page1'
   IF g_action_choice = "page1" THEN
      CALL q629_b_fill()
   END IF
#--add by lifang 170309 end#

   LET g_action_choice = " "
   CALL cl_set_act_visible("accept,cancel", FALSE)
   CALL cl_show_fld_cont()
   LET g_flag = ' '

   CALL cl_set_act_visible("accept,cancel", FALSE)

   DIALOG ATTRIBUTES(UNBUFFERED)
#--mark by lifang 170309 begin#
#      DISPLAY ARRAY g_ogb_1 TO s_ogb_1.* ATTRIBUTE(COUNT=g_rec_b2)
#      BEFORE DISPLAY
#            CALL cl_show_fld_cont()
#            CALL cl_navigator_setting( g_curs_index, g_row_count )
#            LET g_b_flag='1'
#
#         BEFORE ROW
#            LET l_ac = ARR_CURR()
#            CALL cl_show_fld_cont()
#            LET g_oga03 = g_ogb_1[l_ac].oga03_1
#            LET g_ogb04 = g_ogb_1[l_ac].ogb04_1
#            LET g_oga66 = g_ogb_1[l_ac].oga66_1
#            LET g_oga67 = g_ogb_1[l_ac].oga67_1
#            CALL q629_b_fill()
#
#         AFTER DISPLAY
#          CONTINUE DIALOG
#      END DISPLAY
#--mark by lifang 170309 end#

      DISPLAY ARRAY g_ogb TO s_ogb.* ATTRIBUTE(COUNT=g_rec_b)
         BEFORE DISPLAY
            CALL cl_navigator_setting( g_curs_index, g_row_count )
            CALL cl_show_fld_cont()
            LET g_b_flag='2'
         BEFORE ROW
            LET l_ac = ARR_CURR()
      END DISPLAY

      ON ACTION query
         LET g_action_choice="query"
         EXIT DIALOG

      ON ACTION ACCEPT
         LET l_ac = ARR_CURR()
         EXIT DIALOG


      ON ACTION HELP
         LET g_action_choice="help"
         EXIT DIALOG

      ON ACTION locale
         CALL cl_dynamic_locale()
         CALL cl_show_fld_cont()

      ON ACTION EXIT
         LET g_action_choice="exit"
         EXIT DIALOG

      ON ACTION controlg
         LET g_action_choice="controlg"
         EXIT DIALOG

      ON ACTION CANCEL
         LET INT_FLAG=FALSE
         LET g_action_choice="exit"
         EXIT DIALOG

      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DIALOG

      ON ACTION about
         CALL cl_about()

      ON ACTION exporttoexcel
         LET g_action_choice = 'exporttoexcel'
         EXIT DIALOG
  #--add by lifang 170309 begin#
      ON ACTION page2
         LET g_action_choice = 'page2'
         EXIT DIALOG
  #--add by lifang 170309 end#

      ON ACTION controls
         CALL cl_set_head_visible("","AUTO")
      &include "qry_string.4gl"
   END DIALOG
   CALL cl_set_act_visible("accept,cancel", TRUE)
END FUNCTION

#--add by lifang 170309 begin#
FUNCTION q629_bp2()

   LET g_flag = ' '
   LET g_action_flag = 'page2'
   CALL cl_set_act_visible("accept,cancel", FALSE)
   CALL q629_b_fill_2()
   DISPLAY g_rec_b2 TO FORMONLY.cn2
   DIALOG ATTRIBUTES(UNBUFFERED)
      DISPLAY ARRAY g_ogb_1 TO s_ogb_1.* ATTRIBUTE(COUNT=g_rec_b2)
         BEFORE ROW
            LET l_ac = ARR_CURR()
            CALL cl_show_fld_cont()

      END DISPLAY

      ON ACTION page1
         LET g_action_choice="page1"
         EXIT DIALOG

      ON ACTION query
         LET g_action_choice="query"
         EXIT DIALOG

      ON ACTION ACCEPT
         LET l_ac1 = ARR_CURR()
         IF NOT cl_null(g_action_choice) AND l_ac1 > 0  THEN
            LET g_str = ''
            LET g_str = " WHERE oga03 = '",g_ogb_1[l_ac1].oga03_1,"'",
               "  AND ogb04 = '",g_ogb_1[l_ac1].ogb04_1 ,"'",
               "  AND oga66 = '",g_ogb_1[l_ac1].oga66_1,"'",
               "  AND oga67 = '",g_ogb_1[l_ac1].oga67_1,"'"
            CALL q629_b_fill()
            CALL cl_set_comp_visible("page2", FALSE)
            CALL ui.interface.refresh()
            CALL cl_set_comp_visible("page2", TRUE)
            LET g_action_choice= "page1"
            LET g_flag = '1'
            EXIT DIALOG
         END IF


#      ON ACTION refresh_detail
#         CALL cl_set_comp_visible("page2", FALSE)
#         CALL ui.interface.refresh()
#         CALL cl_set_comp_visible("page2", TRUE)
#         LET g_action_choice = 'page1'
#         EXIT DIALOG

      ON ACTION HELP
         LET g_action_choice="help"
         EXIT DIALOG

      ON ACTION locale
         CALL cl_dynamic_locale()
         CALL cl_show_fld_cont()

      ON ACTION EXIT
         LET g_action_choice="exit"
         EXIT DIALOG

      ON ACTION controlg
         LET g_action_choice="controlg"
         EXIT DIALOG

      ON ACTION CANCEL
         LET INT_FLAG=FALSE
         LET g_action_choice="exit"
         EXIT DIALOG

      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DIALOG

      ON ACTION about
         CALL cl_about()

      ON ACTION exporttoexcel
         LET g_action_choice = 'exporttoexcel'
         EXIT DIALOG

      AFTER DIALOG
         CONTINUE DIALOG

      ON ACTION controls
         CALL cl_set_head_visible("","AUTO")
   END DIALOG
   CALL cl_set_act_visible("accept,cancel", TRUE)
END FUNCTION
#--add by lifang 170309 end#

FUNCTION q629_cs()
   DEFINE  l_cnt           LIKE type_file.num5
   DEFINE  lc_qbe_sn       LIKE gbm_file.gbm01
   DEFINE  li_chk_bookno   LIKE type_file.num5
   DEFINE l_ogb09  LIKE ogb_file.ogb09,
          l_oga66  LIKE oga_file.oga66

   CLEAR FORM   #清除畫面
   CALL g_ogb.clear()
   CALL cl_opmsg('q')
   DIALOG ATTRIBUTE(UNBUFFERED)

          CONSTRUCT tm.wc2 ON ogb01,ogb03,ogb31,ogb32,
                     oga03,ogb04,oga14,oga15,
                     oga02,ogb09,ogb091,ogb092,
                     oga66,oga67
                   FROM s_ogb[1].ogb01,s_ogb[1].ogb03,s_ogb[1].ogb31,s_ogb[1].ogb32,
                       s_ogb[1].oga03,s_ogb[1].ogb04,s_ogb[1].oga14,s_ogb[1].oga15,
                       s_ogb[1].oga02,s_ogb[1].ogb09,s_ogb[1].ogb091,s_ogb[1].ogb092,
                       s_ogb[1].oga66,s_ogb[1].oga67

            BEFORE CONSTRUCT
               CALL cl_qbe_init()
            END CONSTRUCT
                ON ACTION CONTROLP    #FUN-4B0043
                 IF INFIELD(ogb01) THEN
                    CALL cl_init_qry_var()
                    LET g_qryparam.form = "q_ogb"
                    LET g_qryparam.state = "c"
                    CALL cl_create_qry() RETURNING g_qryparam.multiret
                    DISPLAY g_qryparam.multiret TO ogb01
                    NEXT FIELD ogb01
                 END IF

                 IF INFIELD(ogb31) THEN
                    CALL cl_init_qry_var()
                    LET g_qryparam.form     = "q_ogb31"
                    LET g_qryparam.state    = "c"
                    CALL cl_create_qry() RETURNING g_qryparam.multiret
                    DISPLAY g_qryparam.multiret TO ogb31
                    NEXT FIELD ogb31
                 END IF
                 IF INFIELD(oga03) THEN
                    CALL cl_init_qry_var()
                    LET g_qryparam.form     = "q_oga03"
                    LET g_qryparam.state    = "c"
                    CALL cl_create_qry() RETURNING g_qryparam.multiret
                    DISPLAY g_qryparam.multiret TO oga03
                    NEXT FIELD oga03
                 END IF
                 IF INFIELD(ogb04) THEN
                    CALL cl_init_qry_var()
                    LET g_qryparam.form     = "q_ogb04"
                    LET g_qryparam.state    = "c"
                    CALL cl_create_qry() RETURNING g_qryparam.multiret
                    DISPLAY g_qryparam.multiret TO ogb04
                    NEXT FIELD ogb04
                 END IF
                 IF INFIELD(oga14) THEN
                    CALL cl_init_qry_var()
                    LET g_qryparam.form     = "q_gen"
                    LET g_qryparam.state    = "c"
                    CALL cl_create_qry() RETURNING g_qryparam.multiret
                    DISPLAY g_qryparam.multiret TO oga14
                    NEXT FIELD oga14
                 END IF
                 IF INFIELD(ogb15) THEN
                    CALL cl_init_qry_var()
                    LET g_qryparam.form     = "q_gem"
                    LET g_qryparam.state    = "c"
                    CALL cl_create_qry() RETURNING g_qryparam.multiret
                    DISPLAY g_qryparam.multiret TO oga15
                    NEXT FIELD oga15
                 END IF
                 IF INFIELD(ogb09) THEN
                    CALL cl_init_qry_var()
                    LET g_qryparam.form     = "q_ogb09"
                    LET g_qryparam.state    = "c"
                    CALL cl_create_qry() RETURNING l_ogb09
                    DISPLAY l_ogb09 TO ogb09
                    NEXT FIELD ogb09
                 END IF
                 IF INFIELD(ogb66) THEN
                    CALL cl_init_qry_var()
                    LET g_qryparam.form     = "q_ogb66"
                    LET g_qryparam.state    = "c"
                    CALL cl_create_qry() RETURNING l_oga66
                    DISPLAY l_oga66 TO oga66
                    NEXT FIELD ogb66
                 END IF

      ON IDLE g_idle_seconds
            CALL cl_on_idle()
            CONTINUE DIALOG

         ON ACTION about         #MOD-4C0121
            CALL cl_about()      #MOD-4C0121

         ON ACTION help          #MOD-4C0121
            CALL cl_show_help()  #MOD-4C0121

         ON ACTION controlg      #MOD-4C0121
            CALL cl_cmdask()     #MOD-4C0121

         ON ACTION qbe_select
            CALL cl_qbe_list() RETURNING lc_qbe_sn
            CALL cl_qbe_display_condition(lc_qbe_sn)
         ON ACTION accept
               EXIT DIALOG

         ON ACTION EXIT
            LET INT_FLAG = TRUE
            EXIT DIALOG

         ON ACTION cancel
            LET INT_FLAG = TRUE
            EXIT DIALOG
      END DIALOG
   IF cl_null(tm.wc2) THEN
      LET tm.wc2 =' 1=1'
   END IF
   IF INT_FLAG THEN
      LET INT_FLAG = 0
      INITIALIZE tm.* TO NULL
      DELETE FROM axcq629_tmp
   END IF
    CALL q629_1(tm.wc2)    #add by lifang 170309
END FUNCTION

FUNCTION q629_q()
    LET g_row_count = 0
    LET g_curs_index = 0
    CALL cl_navigator_setting( g_curs_index, g_row_count )
    MESSAGE ""
    CALL cl_opmsg('q')
    CALL q629_cs()
    IF INT_FLAG THEN LET INT_FLAG = 0 RETURN END IF
    MESSAGE "SERCHING!"
    MESSAGE ""
    CALL q629_show()
END FUNCTION

#--mark by lifang 170309 begin#
#FUNCTION q629_show()
# #  CALL q629(tm.wc2)     #mark by lifang 161230
#    CALL q629_1(tm.wc2)   #add by lifang 161230
#    CALL q629_b_fill_2()
#END FUNCTION
#--mark by lifang 170309 end#
FUNCTION q629_show()
   IF cl_null(g_action_flag) OR g_action_flag="page2" THEN
      LET g_action_choice = "page2"
      CALL cl_set_comp_visible("page1", FALSE)
      CALL ui.interface.refresh()
      CALL cl_set_comp_visible("page1", TRUE)
      CALL q629_b_fill_2()
   ELSE
      LET g_action_choice = "page1"
      CALL cl_set_comp_visible("page2", FALSE)
      CALL ui.interface.refresh()
      CALL cl_set_comp_visible("page2", TRUE)
      CALL q629_b_fill()
   END IF
   CALL cl_show_fld_cont()
END FUNCTION

FUNCTION q629_table()
   DROP TABLE cxmq629_tmp;
   CREATE TEMP TABLE cxmq629_tmp(
                ogb01    VARCHAR(20),
                ogb03    SMALLINT,
                oga02    DATE,
                oga03    VARCHAR(10),
                oga032   VARCHAR(40),
                oga14    VARCHAR(10),
                gen02    VARCHAR(40),
                oga15    VARCHAR(10),
                gem02    VARCHAR(80),
                oga23    VARCHAR(4),
                oga211   DECIMAL(9,4),
                ogb31    VARCHAR(20),
                ogb32    SMALLINT,
                ogb04    VARCHAR(40),
                ima02    VARCHAR(120),
                ogb12    DECIMAL(15,3),
                qs       DECIMAL(15,3),
                qt       DECIMAL(15,3),
                unqs     DECIMAL(15,3),
                ogb13    DECIMAL(20,6),
                ogb14    DECIMAL(20,6),
                ogb14t   DECIMAL(20,6),
                ogb09    VARCHAR(10),
                ogb091   VARCHAR(10),
                ogb092   VARCHAR(24),
                ogapost  VARCHAR(1),
                oga66    VARCHAR(10),
                oga67    VARCHAR(10))          #add by wangxy 20121120
END FUNCTION

FUNCTION q629(l_wc)
 DEFINE   l_sql,l_sql2       STRING,
          l_cnt       LIKE type_file.num5
   DEFINE l_wc STRING


   DISPLAY TIME

   DELETE FROM cxmq629_tmp
   LET g_cnt= 1

   LET l_sql = " INSERT INTO cxmq629_tmp ",
        "  SELECT  ogb01,ogb03,oga02,oga03,",
        "        oga032,oga14,gen02,oga15,gem02,oga23,oga211,",
        "        ogb31,ogb32,ogb04,ima02,ogb12,",
        "        0,0,0,ogb13,ogb14,",               #qs,qt,unqs
        "       ogb14t,ogb09,ogb091,ogb092,ogapost ",
        "       ,oga66,oga67 ",
        " FROM  oga_file,ogb_file,ima_file,gen_file,gem_file",
        " WHERE ", l_wc CLIPPED,
        " AND oga01 = ogb01 ",
        " AND oga09 ='2'",
        " AND oga65= 'Y'",
        " AND ogapost ='Y' ",
        " AND ogb04 = ima01 ",
        " AND oga14 = gen01(+) ",
        " AND oga15 = gem01(+) "
        # add by lixwz180413 s---
        #添加无出货订单的逻辑
        ," UNION ",
        "  SELECT  ogb01,ogb03,oga02,oga03,",
        "        oga032,oga14,gen02,oga15,gem02,oga23,oga211,",
        "        ogb31,ogb32,ogb04,ima02,ogb12,",
        "        0,0,0,ogb13,ogb14,",               #qs,qt,unqs
        "       ogb14t,ogb09,ogb091,ogb092,ogapost ",
        "       ,oga66,oga67 ",
        " FROM  oga_file,ogb_file,ima_file,gen_file,gem_file",
        " WHERE ", l_wc CLIPPED,
        " AND oga01 = ogb01 ",
        " AND oga09 ='3'",
        #" AND oga65= 'Y'",
        " AND ogapost ='Y' ",
        " AND ogb04 = ima01 ",
        " AND oga14 = gen01(+) ",
        " AND oga15 = gem01(+) "
        # add by lixwz180413 e---
   PREPARE q629_ins FROM l_sql
   EXECUTE q629_ins

  LET l_sql2 = " SELECT * FROM cxmq629_tmp ",
                "  ORDER by ogb01,ogb03 "
   PREPARE q629_cs_1 FROM l_sql2
   DECLARE q629_pre_1 CURSOR FOR q629_cs_1
   FOREACH q629_pre_1 INTO g_ogb[g_cnt].*
        IF SQLCA.sqlcode THEN
            CALL cl_err('Foreach:',SQLCA.sqlcode,1)
            EXIT FOREACH
        END IF

      SELECT sum(ogb12)
      INTO g_ogb[g_cnt].qs
        FROM ogb_file,oga_file
      WHERE oga01 = ogb01
      AND ogapost ='Y'
      AND oga09 ='8'
      AND ogb31=g_ogb[g_cnt].ogb31
      AND ogb32=g_ogb[g_cnt].ogb32
      AND ogbud02 = g_ogb[g_cnt].ogb01
      AND ogbud10 = g_ogb[g_cnt].ogb03

      SELECT sum(imn10)
        INTO g_ogb[g_cnt].qt
       FROM imn_file,imm_file
      WHERE imn01 = imm01
      AND imnud03 =g_ogb[g_cnt].ogb01
      AND imnud08 = g_ogb[g_cnt].ogb03
      AND imnud02=g_ogb[g_cnt].ogb31
      AND imnud07=g_ogb[g_cnt].ogb32
      AND imm03 ='Y'

      IF cl_null(g_ogb[g_cnt].qs) THEN LET g_ogb[g_cnt].qs=0 END IF
      IF cl_null(g_ogb[g_cnt].qt) THEN LET g_ogb[g_cnt].qt=0 END IF
      LET g_ogb[g_cnt].unqs = g_ogb[g_cnt].ogb12 - g_ogb[g_cnt].qs - g_ogb[g_cnt].qt
#      IF g_ogb_excel[l_cnt].unqs <0 THEN
#         DELETE FROM cxmq629_tmp
#          WHERE ogb01 = g_ogb[g_cnt].ogb01
#          AND ogb03 = g_ogb[g_cnt].ogb03
#         CONTINUE FOREACH
#      END IF
      UPDATE cxmq629_tmp SET qs = g_ogb[g_cnt].qs,
                             qt = g_ogb[g_cnt].qt,
                             unqs = g_ogb[g_cnt].unqs
                         WHERE ogb01 = g_ogb[g_cnt].ogb01
                          AND ogb03 = g_ogb[g_cnt].ogb03
      LET g_cnt = g_cnt + 1
      IF g_cnt > g_max_rec THEN
        CALL cl_err( '', 9035, 0 )
	      EXIT FOREACH
      END IF
    END FOREACH

   DISPLAY TIME


END FUNCTION

FUNCTION q629_1(l_wc)    #取数
 DEFINE   l_sql,l_sql1,l_sql2,l_sql3,l_sql4  STRING,
          l_cnt       LIKE type_file.num5
   DEFINE l_wc STRING


   DISPLAY TIME

   DELETE FROM cxmq629_tmp
   LET g_cnt= 1

   LET l_sql = " INSERT INTO cxmq629_tmp ",
        "  SELECT  ogb01,ogb03,oga02,oga03,",
        "        oga032,oga14,gen02,oga15,gem02,oga23,oga211,",
        "        ogb31,ogb32,ogb04,ima02,ogb12,",
        "        0,0,0,ogb13,ogb14,",               #qs,qt,unqs
        "       ogb14t,ogb09,ogb091,ogb092,ogapost ",
        "       ,oga66,oga67 ",
        " FROM  oga_file,ogb_file,ima_file,gen_file,gem_file",
        " WHERE ", l_wc CLIPPED,
        " AND oga01 = ogb01 ",
        " AND oga09 ='2'",
        " AND oga65= 'Y'",
        " AND ogapost ='Y' ",
        " AND ogb04 = ima01 ",
        " AND oga14 = gen01(+) ",
        " AND oga15 = gem01(+) "
        # add by lixwz180413 s---
        # 添加无订单出货的单据
        ," UNION",
        "  SELECT  ogb01,ogb03,oga02,oga03,",
        "        oga032,oga14,gen02,oga15,gem02,oga23,oga211,",
        "        ogb31,ogb32,ogb04,ima02,ogb12,",
        "        0,0,0,ogb13,ogb14,",               #qs,qt,unqs
        "       ogb14t,ogb09,ogb091,ogb092,ogapost ",
        "       ,oga66,oga67 ",
        " FROM  oga_file,ogb_file,ima_file,gen_file,gem_file",
        " WHERE ", l_wc CLIPPED,
        " AND oga01 = ogb01 ",
        " AND oga09 ='3'",
        #" AND oga65= 'Y'",
        " AND ogapost ='Y' ",
        " AND ogb04 = ima01 ",
        " AND oga14 = gen01(+) ",
        " AND oga15 = gem01(+) "
        # add by lixwz180413 e---
   PREPARE q629_ins_1 FROM l_sql
   EXECUTE q629_ins_1

  LET l_sql1 = " MERGE INTO cxmq629_tmp o ",
               "      USING (SELECT ogb31, ogb32, ogbud02, ogbud10,SUM(ogb12) ogb12_sum ",
               "               FROM oga_file,ogb_file ",
               "              WHERE oga01 = ogb01 ",
               "                AND ogapost = 'Y' AND oga09 = '8' ",
               "              GROUP BY ogb31,ogb32,ogbud02,ogbud10) n ",
               "         ON (o.ogb31 = n.ogb31 AND o.ogb32 = n.ogb32 ",
               "             AND o.ogb01 = n.ogbud02 AND o.ogb03 = n.ogbud10) ",
               " WHEN MATCHED ",
               " THEN ",
               "    UPDATE ",
               "       SET o.qs = NVL(n.ogb12_sum,0) "
   PREPARE q629_pre1 FROM l_sql1
   EXECUTE q629_pre1
   # add by lixwz180413 s---
   LET l_sql1 = "UPDATE cxmq629_tmp a SET ",
                " a.qs = a.ogb12 WHERE exists (SELECT 1 FROM oga_file b",
                " WHERE a.ogb01=b.oga01 and b.oga09 ='3')"
   PREPARE q629_pre5 FROM l_sql1
   EXECUTE q629_pre5

   # add by lixwz180413 e---

  LET l_sql2 = " MERGE INTO cxmq629_tmp o ",
               "      USING (SELECT imnud03,imnud08,imnud02,imnud07,sum(imn10) imn10_sum ",
              #"               FROM mn_file,imm_file ",
               "               FROM imn_file,imm_file ",  #mod by pane 170602
               "             WHERE imn01 = imm01 ",
               "               AND imm03 ='Y'  ",
               "               AND immud05 = 'Y' ",  #add by pane 170602
               "              GROUP BY imnud03,imnud08,imnud02,imnud07) n ",
               "         ON (o.ogb31 = n.imnud02 AND o.ogb32 = n.imnud07 ",
               "             AND o.ogb01 = n.imnud03 AND o.ogb03 = n.imnud08) ",
               " WHEN MATCHED ",
               " THEN ",
               "    UPDATE ",
               "       SET o.qt = NVL(n.imn10_sum,0) "
   PREPARE q629_pre2 FROM l_sql2
   EXECUTE q629_pre2

   LET l_sql3 = " UPDATE cxmq629_tmp ",
               " SET unqs = ogb12-qs-qt "
   PREPARE q629_pre3 FROM l_sql3
   EXECUTE q629_pre3

   # mod by lixwz180413 180313 s---
   #LET l_sql4 = " DELETE FROM cxmq629_tmp ",
              #"  WHERE unqs <0  "               #mark by lifang 170310
   #            "  WHERE unqs <=0  "              #add by lifang 170310 未签收数量小于等于0不显示
   LET l_sql4 = "DELETE cxmq629_tmp a  ",
                " WHERE a.unqs <=0 and NOT exists (SELECT 1 FROM oga_file b",
                " WHERE a.ogb01=b.oga01 and b.oga09 ='3')"
   # mod by lixwz180413 180313 e---
   PREPARE q629_pre4 FROM l_sql4
   EXECUTE q629_pre4

   DISPLAY TIME


END FUNCTION

FUNCTION q629_b_fill_2()        #汇总
   DEFINE l_sql    STRING
   CALL g_ogb_1.clear()
   LET g_cnt =1
   LET l_sql = " SELECT oga03,oga032,ogb04,'','',oga66,oga67,SUM(unqs),0,0",
               "  FROM cxmq629_tmp",
               " GROUP BY oga03,oga032,ogb04,oga66,oga67 ",
               " ORDER BY ogb04,oga03,oga032,oga66,oga67 "

   PREPARE q629_pb FROM l_sql
   DECLARE q629_curs1 CURSOR FOR q629_pb
   CALL g_ogb_1.clear()
   FOREACH q629_curs1 INTO g_ogb_1[g_cnt].*

      SELECT sum(img10) INTO g_ogb_1[g_cnt].img10_1
       FROM img_file
       WHERE img01 = g_ogb_1[g_cnt].ogb04_1
       AND img02 = g_ogb_1[g_cnt].oga66_1
       AND img03 = g_ogb_1[g_cnt].oga67_1
    #--add by lifang 170315                 #库存为0未签收为0的不显示
      IF g_ogb_1[g_cnt].img10_1 = 0 AND g_ogb_1[g_cnt].unqs_1 = 0 THEN
         CONTINUE FOREACH
      END IF
    #--add by lifang 170315

      IF SQLCA.sqlcode THEN
         CALL cl_err('foreach:',SQLCA.sqlcode,1)
         EXIT FOREACH
      END IF
      SELECT ima02 INTO g_ogb_1[g_cnt].ogb06_1
       FROM ima_file
      WHERE ima01 = g_ogb_1[g_cnt].ogb04_1

      LET g_ogb_1[g_cnt].diff_1 = g_ogb_1[g_cnt].img10_1 - g_ogb_1[g_cnt].unqs_1
      LET g_cnt = g_cnt + 1
   END FOREACH

   DISPLAY ARRAY g_ogb_1 TO s_ogb_1.* ATTRIBUTE(COUNT=g_cnt)
      BEFORE DISPLAY
         EXIT DISPLAY
   END DISPLAY

   CALL g_ogb_1.deleteElement(g_cnt)
   LET g_rec_b2 = g_cnt - 1
   DISPLAY g_rec_b2 TO FORMONLY.cn2

END FUNCTION

