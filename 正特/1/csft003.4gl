#該程式未解開Section, 採用最新樣板產出!
{<section id="csft003.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0008(1900-01-01 00:00:00), PR版次:0008(1900-01-01 00:00:00)
#+ Customerized Version.: SD版次:0006(2018-08-16 09:21:28), PR版次:0008(2018-08-22 11:11:16)
#+ Build......: 000074
#+ Filename...: csft003
#+ Description:
#+ Creator....: 00000(2018-05-23 18:06:10)
#+ Modifier...: 00000 -SD/PR- 00000

{</section>}

{<section id="csft003.global" >}
#應用 t01 樣板自動產生(Version:87)
#add-point:填寫註解說明 name="global.memo"
#Memos
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"
#C20180531-09415#1 2018/05/31 By zhaoqn   cq_sfpb006添加排除已存在的工单的条件
#C20180613-09415#1 2018/06/13 By zhaoqn   如果派工单在csft004中存在，则关闭csft003取消审核权限
#C20180718-09415#1 2018/07/18 By zhaoqn   单头增加默认操作工，新增单据时单身整批=单头。增加工作站名称显示；单身增加部门名称显示
#C20180718-09415#2 2018/07/18 By zhaoqn   取消单身删除的功能;新建单据后，不能直接审核，需要退出重新查询后才能审核.
#C20180718-09415#3 2018/07/18 By zhaoqn   操作工开窗第一次开窗默认查询本部门员工，第二次开窗查询全部员工；
#No.BMCT-100-M001 18/07/25 By TSD.Harry 增加報表列印
#C20180816-09415#1 2018/08/16 By zhaoqn   单身添加项次，标准核算*数量栏位，单头添加金额汇总
#end add-point
#(ver:86) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:86) --- end ---

IMPORT os
IMPORT util
IMPORT FGL lib_cl_dlg
IMPORT JAVA com.fourjs.fgl.lang.FglRecord   #(ver:87) add
#add-point:增加匯入項目 name="global.import"

#end add-point

SCHEMA ds

GLOBALS "../../cfg/top_global.inc"
#(ver:87) ---add start---
GLOBALS
#單身匯excel POI變數
TYPE rec_arr_type           ARRAY [] OF com.fourjs.fgl.lang.FglRecord
DEFINE g_export_tag         DYNAMIC ARRAY OF rec_arr_type                 #畫面欄位數
DEFINE g_export_tabname     DYNAMIC ARRAY OF STRING                       #畫面名稱
END GLOBALS
#(ver:87) --- add end ---

#add-point:增加匯入變數檔 name="global.inc"

#end add-point

#單頭 type 宣告
PRIVATE type type_g_ecbcuc_m        RECORD
       ecbcucdocno LIKE ecbcuc_t.ecbcucdocno,
   ecbcucdocno_desc LIKE type_t.chr80,
   ecbcucdocdt LIKE ecbcuc_t.ecbcucdocdt,
   ecbcuc008 LIKE ecbcuc_t.ecbcuc008,
   ecbcuc003 LIKE ecbcuc_t.ecbcuc003,
   ecbcuc003_desc LIKE type_t.chr80,
   ecbcuc004 LIKE ecbcuc_t.ecbcuc004,
   ecbcuc005 LIKE ecbcuc_t.ecbcuc005,
   ecbcuc006 LIKE ecbcuc_t.ecbcuc006,
   ecbcuc006_desc LIKE type_t.chr80,
   ecbcuc002 LIKE ecbcuc_t.ecbcuc002,
   ecbcuc002_desc_1 LIKE type_t.chr500,
   ecbcuc002_desc_5 LIKE type_t.chr500,
   ecbcuc002_desc_2 LIKE type_t.chr500,
   ecbcuc002_desc_6 LIKE type_t.chr500,
   ecbcuc002_desc_3 LIKE type_t.chr500,
   ecbcuc007 LIKE ecbcuc_t.ecbcuc007,
   ecbcuc007_desc LIKE type_t.chr80,
   ecbcuc002_desc_4 LIKE type_t.chr500,
   l_sum LIKE type_t.num20_6,
   ecbcuc011 LIKE ecbcuc_t.ecbcuc011,
   ecbcuc001 LIKE ecbcuc_t.ecbcuc001,
   ecbcucstus LIKE ecbcuc_t.ecbcucstus,
   ecbcucownid LIKE ecbcuc_t.ecbcucownid,
   ecbcucownid_desc LIKE type_t.chr80,
   ecbcucowndp LIKE ecbcuc_t.ecbcucowndp,
   ecbcucowndp_desc LIKE type_t.chr80,
   ecbcuccrtid LIKE ecbcuc_t.ecbcuccrtid,
   ecbcuccrtid_desc LIKE type_t.chr80,
   ecbcuccrtdp LIKE ecbcuc_t.ecbcuccrtdp,
   ecbcuccrtdp_desc LIKE type_t.chr80,
   ecbcuccrtdt LIKE ecbcuc_t.ecbcuccrtdt,
   ecbcucmodid LIKE ecbcuc_t.ecbcucmodid,
   ecbcucmodid_desc LIKE type_t.chr80,
   ecbcucmoddt LIKE ecbcuc_t.ecbcucmoddt
       END RECORD

#單身 type 宣告
PRIVATE TYPE type_g_ecbduc_d        RECORD
       ecbducseq LIKE ecbduc_t.ecbducseq,
   ecbduc004 LIKE ecbduc_t.ecbduc004,
   ecbduc005 LIKE ecbduc_t.ecbduc005,
   ecbduc006 LIKE ecbduc_t.ecbduc006,
   ecbduc008 LIKE ecbduc_t.ecbduc008,
   ecbduc008_desc LIKE type_t.chr500,
   ecbduc008_desc_1 LIKE type_t.chr500,
   ecbduc008_desc_1_desc LIKE type_t.chr500,
   ecbduc007 LIKE ecbduc_t.ecbduc007,
   l_jine LIKE type_t.num20_6
       END RECORD


PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_ecbcuc001 LIKE ecbcuc_t.ecbcuc001,
      b_ecbcuc002 LIKE ecbcuc_t.ecbcuc002,
      b_ecbcuc003 LIKE ecbcuc_t.ecbcuc003,
      b_ecbcucdocno LIKE ecbcuc_t.ecbcucdocno,
      b_ecbcuc004 LIKE ecbcuc_t.ecbcuc004,
      b_ecbcuc005 LIKE ecbcuc_t.ecbcuc005,
      b_ecbcuc006 LIKE ecbcuc_t.ecbcuc006
       END RECORD

#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"

#end add-point

#模組變數(Module Variables)
DEFINE g_ecbcuc_m          type_g_ecbcuc_m
DEFINE g_ecbcuc_m_t        type_g_ecbcuc_m
DEFINE g_ecbcuc_m_o        type_g_ecbcuc_m
DEFINE g_ecbcuc_m_mask_o   type_g_ecbcuc_m #轉換遮罩前資料
DEFINE g_ecbcuc_m_mask_n   type_g_ecbcuc_m #轉換遮罩後資料

   DEFINE g_ecbcucdocno_t LIKE ecbcuc_t.ecbcucdocno
DEFINE g_ecbcuc003_t LIKE ecbcuc_t.ecbcuc003
DEFINE g_ecbcuc002_t LIKE ecbcuc_t.ecbcuc002
DEFINE g_ecbcuc001_t LIKE ecbcuc_t.ecbcuc001


DEFINE g_ecbduc_d          DYNAMIC ARRAY OF type_g_ecbduc_d
DEFINE g_ecbduc_d_t        type_g_ecbduc_d
DEFINE g_ecbduc_d_o        type_g_ecbduc_d
DEFINE g_ecbduc_d_mask_o   DYNAMIC ARRAY OF type_g_ecbduc_d #轉換遮罩前資料
DEFINE g_ecbduc_d_mask_n   DYNAMIC ARRAY OF type_g_ecbduc_d #轉換遮罩後資料


DEFINE g_browser         DYNAMIC ARRAY OF type_browser
DEFINE g_browser_f       DYNAMIC ARRAY OF type_browser


DEFINE g_wc                  STRING
DEFINE g_wc_t                STRING
DEFINE g_wc2                 STRING                          #單身CONSTRUCT結果
DEFINE g_wc2_table1          STRING


DEFINE g_wc2_extend          STRING
DEFINE g_wc_filter           STRING
DEFINE g_wc_filter_t         STRING

DEFINE g_sql                 STRING
DEFINE g_forupd_sql          STRING
DEFINE g_cnt                 LIKE type_t.num10
DEFINE g_current_idx         LIKE type_t.num10
DEFINE g_jump                LIKE type_t.num10
DEFINE g_no_ask              LIKE type_t.num5
DEFINE g_rec_b               LIKE type_t.num10
DEFINE l_ac                  LIKE type_t.num10
DEFINE g_curr_diag           ui.Dialog                         #Current Dialog

DEFINE g_pagestart           LIKE type_t.num10
DEFINE gwin_curr             ui.Window                         #Current Window
DEFINE gfrm_curr             ui.Form                           #Current Form
DEFINE g_page_action         STRING                            #page action
DEFINE g_header_hidden       LIKE type_t.num5                  #隱藏單頭
DEFINE g_worksheet_hidden    LIKE type_t.num5                  #隱藏工作Panel
DEFINE g_page                STRING                            #第幾頁
DEFINE g_state               STRING
DEFINE g_header_cnt          LIKE type_t.num10
DEFINE g_detail_cnt          LIKE type_t.num10                  #單身總筆數
DEFINE g_detail_idx          LIKE type_t.num10                  #單身目前所在筆數
DEFINE g_detail_idx_tmp      LIKE type_t.num10                  #單身目前所在筆數
DEFINE g_detail_idx2         LIKE type_t.num10                  #單身2目前所在筆數
DEFINE g_detail_idx_list     DYNAMIC ARRAY OF LIKE type_t.num10 #單身2目前所在筆數
DEFINE g_browser_cnt         LIKE type_t.num10                  #Browser總筆數
DEFINE g_browser_idx         LIKE type_t.num10                  #Browser目前所在筆數
DEFINE g_temp_idx            LIKE type_t.num10                  #Browser目前所在筆數(暫存用)
DEFINE g_order               STRING                             #查詢排序欄位

DEFINE g_current_row         LIKE type_t.num10                  #Browser所在筆數
DEFINE g_current_sw          BOOLEAN                            #Browser所在筆數用開關
DEFINE g_current_page        LIKE type_t.num10                  #目前所在頁數
DEFINE g_insert              LIKE type_t.chr5                   #是否導到其他page

DEFINE g_ref_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_ref_vars            DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE gs_keys               DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE gs_keys_bak           DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE g_bfill               LIKE type_t.chr5              #是否刷新單身
DEFINE g_error_show          LIKE type_t.num5              #是否顯示筆數提示訊息
DEFINE g_master_insert       BOOLEAN                       #確認單頭資料是否寫入

DEFINE g_wc_frozen           STRING                        #凍結欄位使用
DEFINE g_chk                 BOOLEAN                       #助記碼判斷用
DEFINE g_aw                  STRING                        #確定當下點擊的單身
DEFINE g_default             BOOLEAN                       #是否有外部參數查詢
DEFINE g_log1                STRING                        #log用
DEFINE g_log2                STRING                        #log用
DEFINE g_loc                 LIKE type_t.chr5              #判斷游標所在位置
DEFINE g_add_browse          STRING                        #新增填充用WC
DEFINE g_update              BOOLEAN                       #確定單頭/身是否異動過
DEFINE g_idx_group           om.SaxAttributes              #頁籤群組
DEFINE g_master_commit       LIKE type_t.chr1              #確認單頭是否修改過

#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"
DEFINE g_ooef004             LIKE ooef_t.ooef004
#end add-point

#add-point:傳入參數說明(global.argv) name="global.argv"

#end add-point

{</section>}

{<section id="csft003.main" >}
#應用 a26 樣板自動產生(Version:7)
#+ 作業開始(主程式類型)
MAIN
   #add-point:main段define(客製用) name="main.define_customerization"

   #end add-point
   #add-point:main段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="main.define"

   #end add-point

   OPTIONS
   INPUT NO WRAP
   DEFER INTERRUPT

   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log

   #依模組進行系統初始化設定(系統設定)
   CALL cl_ap_init("csf","")

   #add-point:作業初始化 name="main.init"

   #end add-point



   #LOCK CURSOR (identifier)
   #add-point:SQL_define name="main.define_sql"

   #end add-point
   LET g_forupd_sql = " SELECT ecbcucdocno,'',ecbcucdocdt,ecbcuc008,ecbcuc003,'',ecbcuc004,ecbcuc005,
       ecbcuc006,'',ecbcuc002,'','','','','',ecbcuc007,'','','',ecbcuc011,ecbcuc001,ecbcucstus,ecbcucownid,
       '',ecbcucowndp,'',ecbcuccrtid,'',ecbcuccrtdp,'',ecbcuccrtdt,ecbcucmodid,'',ecbcucmoddt",
                      " FROM ecbcuc_t",
                      " WHERE ecbcucent= ? AND ecbcucsite= ? AND ecbcucdocno=? AND ecbcuc001=? AND ecbcuc002=?
                          AND ecbcuc003=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"

   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE csft003_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR

   LET g_sql = " SELECT DISTINCT t0.ecbcucdocno,t0.ecbcucdocdt,t0.ecbcuc008,t0.ecbcuc003,t0.ecbcuc004,
       t0.ecbcuc005,t0.ecbcuc006,t0.ecbcuc002,t0.ecbcuc007,t0.ecbcuc011,t0.ecbcuc001,t0.ecbcucstus,t0.ecbcucownid,
       t0.ecbcucowndp,t0.ecbcuccrtid,t0.ecbcuccrtdp,t0.ecbcuccrtdt,t0.ecbcucmodid,t0.ecbcucmoddt,t1.oocql004 ,
       t2.ecaa002 ,t3.ooag011 ,t4.ooag011 ,t5.ooefl003 ,t6.ooag011 ,t7.ooefl003 ,t8.ooag011",
               " FROM ecbcuc_t t0",
                              " LEFT JOIN oocql_t t1 ON t1.oocqlent="||g_enterprise||" AND t1.oocql001='221' AND t1.oocql002=t0.ecbcuc003 AND t1.oocql003='"||g_dlang||"' ",
               " LEFT JOIN ecaa_t t2 ON t2.ecaaent="||g_enterprise||" AND t2.ecaa001=t0.ecbcuc006  ",
               " LEFT JOIN ooag_t t3 ON t3.ooagent="||g_enterprise||" AND t3.ooag001=t0.ecbcuc007  ",
               " LEFT JOIN ooag_t t4 ON t4.ooagent="||g_enterprise||" AND t4.ooag001=t0.ecbcucownid  ",
               " LEFT JOIN ooefl_t t5 ON t5.ooeflent="||g_enterprise||" AND t5.ooefl001=t0.ecbcucowndp AND t5.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t6 ON t6.ooagent="||g_enterprise||" AND t6.ooag001=t0.ecbcuccrtid  ",
               " LEFT JOIN ooefl_t t7 ON t7.ooeflent="||g_enterprise||" AND t7.ooefl001=t0.ecbcuccrtdp AND t7.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t8 ON t8.ooagent="||g_enterprise||" AND t8.ooag001=t0.ecbcucmodid  ",

               " WHERE t0.ecbcucent = " ||g_enterprise|| " AND t0.ecbcucsite = ? AND t0.ecbcucdocno = ? AND t0.ecbcuc001 = ? AND t0.ecbcuc002 = ? AND t0.ecbcuc003 = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"

   #end add-point
   PREPARE csft003_master_referesh FROM g_sql




   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"

      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_csft003 WITH FORM cl_ap_formpath("csf",g_code)

      #瀏覽頁簽資料初始化
      CALL cl_ui_init()

      #程式初始化
      CALL csft003_init()

      #進入選單 Menu (="N")
      CALL csft003_ui_dialog()

      #add-point:畫面關閉前 name="main.before_close"

      #end add-point

      #畫面關閉
      CLOSE WINDOW w_csft003

   END IF

   CLOSE csft003_cl



   #add-point:作業離開前 name="main.exit"

   #end add-point

   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN




{</section>}

{<section id="csft003.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION csft003_init()
   #add-point:init段define(客製用) name="init.define_customerization"

   #end add-point
   #add-point:init段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"

   #end add-point

   #add-point:Function前置處理  name="init.pre_function"

   #end add-point

   LET g_bfill       = "Y"
   LET g_detail_idx  = 1 #第一層單身指標
   LET g_detail_idx2 = 1 #第二層單身指標

   #各個page指標
   LET g_detail_idx_list[1] = 1

   LET g_error_show  = 1
   LET l_ac = 1 #單身指標
      CALL cl_set_combo_scc_part('ecbcucstus','13','N,Y,S,Z,X')


   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件

   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")


   #add-point:畫面資料初始化 name="init.init"

   #end add-point

   #初始化搜尋條件
   CALL csft003_default_search()

END FUNCTION

{</section>}

{<section id="csft003.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION csft003_ui_dialog()
   #add-point:ui_dialog段define(客製用) name="ui_dialog.define_customerization"

   #end add-point
   DEFINE li_idx     LIKE type_t.num10
   DEFINE ls_wc      STRING
   DEFINE lb_first   BOOLEAN
   DEFINE la_wc      DYNAMIC ARRAY OF RECORD
          tableid    STRING,
          wc         STRING
          END RECORD
   DEFINE la_param   RECORD
          prog       STRING,
          actionid   STRING,
          background LIKE type_t.chr1,
          param      DYNAMIC ARRAY OF STRING
          END RECORD
   DEFINE ls_js      STRING
   DEFINE la_output  DYNAMIC ARRAY OF STRING   #報表元件鬆耦合使用
   DEFINE  l_cmd_token           base.StringTokenizer   #報表作業cmdrun使用
   DEFINE  l_cmd_next            STRING                 #報表作業cmdrun使用
   DEFINE  l_cmd_cnt             LIKE type_t.num5       #報表作業cmdrun使用
   DEFINE  l_cmd_prog_arg        STRING                 #報表作業cmdrun使用
   DEFINE  l_cmd_arg             STRING                 #報表作業cmdrun使用
   #(ver:87) ---add start---
   DEFINE l_arr_len       INTEGER
   DEFINE l_arr_cnt       INTEGER
   DEFINE lb_get_type     LIKE type_t.chr20
   #(ver:87) --- add end ---
   #add-point:ui_dialog段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_dialog.define"
   DEFINE l_choice       LIKE type_t.chr1
   DEFINE lwin_curr    ui.Window
   DEFINE lfrm_curr    ui.Form
   DEFINE ls_path      STRING
   #end add-point

   #add-point:Function前置處理  name="ui_dialog.pre_function"

   #end add-point

   CALL cl_set_act_visible("accept,cancel", FALSE)

   #因應查詢方案進行處理
   IF g_default THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   ELSE
      CALL gfrm_curr.setElementHidden("mainlayout",1)
      CALL gfrm_curr.setElementHidden("worksheet",0)
      LET g_main_hidden = 1
   END IF

   #action default動作
   #應用 a42 樣板自動產生(Version:3)
   #進入程式時預設執行的動作
   CASE g_actdefault
      WHEN "insert"
         LET g_action_choice="insert"
         LET g_actdefault = ""
         IF cl_auth_chk_act("insert") THEN
            CALL csft003_insert()
            #add-point:ON ACTION insert name="menu.default.insert"

            #END add-point
         END IF

      #add-point:action default自訂 name="ui_dialog.action_default"

      #end add-point
      OTHERWISE
   END CASE




   LET lb_first = TRUE

   #add-point:ui_dialog段before dialog  name="ui_dialog.before_dialog"

   #end add-point

   WHILE TRUE

      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_browser.clear()
         INITIALIZE g_ecbcuc_m.* TO NULL
         CALL g_ecbduc_d.clear()

         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL csft003_init()
      END IF

      CALL lib_cl_dlg.cl_dlg_before_display()

      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)

         #左側瀏覽頁簽
         DISPLAY ARRAY g_browser TO s_browse.* ATTRIBUTES(COUNT=g_header_cnt)
            BEFORE ROW
               #回歸舊筆數位置 (回到當時異動的筆數)
               LET g_current_idx = DIALOG.getCurrentRow("s_browse")
               IF g_current_row > 1 AND g_current_idx = 1 AND g_current_sw = FALSE THEN
                  CALL DIALOG.setCurrentRow("s_browse",g_current_row)
                  LET g_current_idx = g_current_row
               END IF
               LET g_current_row = g_current_idx #目前指標
               LET g_current_sw = TRUE

               IF g_current_idx > g_browser.getLength() THEN
                  LET g_current_idx = g_browser.getLength()
               END IF

               CALL csft003_fetch('') # reload data
               LET l_ac = 1
               CALL csft003_ui_detailshow() #Setting the current row

               CALL csft003_idx_chk()
               #NEXT FIELD ecbduc004

               ON ACTION qbefield_user   #欄位隱藏設定
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
         END DISPLAY

         DISPLAY ARRAY g_ecbduc_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1

            BEFORE ROW
               #顯示單身筆數
               CALL csft003_idx_chk()
               #確定當下選擇的筆數
               LET l_ac = DIALOG.getCurrentRow("s_detail1")
               LET g_detail_idx = l_ac
               LET g_detail_idx_list[1] = l_ac
               CALL g_idx_group.addAttribute("'1',",l_ac)

               #add-point:page1, before row動作 name="ui_dialog.page1.before_row"

               #end add-point

            BEFORE DISPLAY
               #如果一直都在單身1則控制筆數位置
               IF g_loc = 'm' THEN
                  CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
               END IF
               LET g_loc = 'm'
               LET l_ac = DIALOG.getCurrentRow("s_detail1")
               LET g_current_page = 1
               #顯示單身筆數
               CALL csft003_idx_chk()
               #add-point:page1自定義行為 name="ui_dialog.page1.before_display"

               #end add-point

            #自訂ACTION(detail_show,page_1)


            #add-point:page1自定義行為 name="ui_dialog.page1.action"

            #end add-point

         END DISPLAY





         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"

         #end add-point

         SUBDIALOG lib_cl_dlg.cl_dlg_qryplan
         SUBDIALOG lib_cl_dlg.cl_dlg_relateapps

         BEFORE DIALOG
            #先填充browser資料
            CALL csft003_browser_fill("")
            CALL cl_notice()
            CALL cl_navigator_setting(g_current_idx, g_detail_cnt)
            LET g_curr_diag = ui.DIALOG.getCurrent()
            LET g_current_sw = FALSE
            #回歸舊筆數位置 (回到當時異動的筆數)
            LET g_current_idx = DIALOG.getCurrentRow("s_browse")
            IF g_current_row > 1 AND g_current_idx = 1 AND g_current_sw = FALSE THEN
               CALL DIALOG.setCurrentRow("s_browse",g_current_row)
               LET g_current_idx = g_current_row
            END IF

            #確保g_current_idx位於正常區間內
            #小於,等於0則指到第1筆
            IF g_current_idx <= 0 THEN
               LET g_current_idx = 1
            END IF
            #超過最大筆數則指到最後1筆
            IF g_current_idx > g_browser.getLength() THEN
               LEt g_current_idx = g_browser.getLength()
            END IF

            LET g_current_sw = TRUE
            LET g_current_row = g_current_idx #目前指標

            #有資料才進行fetch
            IF g_current_idx <> 0 THEN
               CALL csft003_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL csft003_ui_detailshow() #Setting the current row

            #筆數顯示
            LET g_current_page = 1
            CALL csft003_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"

            #end add-point

         #add-point:ui_dialog段more_action name="ui_dialog.more_action"

         #end add-point

         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL csft003_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL csft003_set_act_visible()
            CALL csft003_set_act_no_visible()
            IF NOT (g_ecbcuc_m.ecbcucdocno IS NULL
              OR g_ecbcuc_m.ecbcuc001 IS NULL
              OR g_ecbcuc_m.ecbcuc002 IS NULL
              OR g_ecbcuc_m.ecbcuc003 IS NULL

              ) THEN
               #組合條件
               LET g_add_browse = " ecbcucent = " ||g_enterprise|| " AND ecbcucsite = '" ||g_site|| "' AND",
                                  " ecbcucdocno = '", g_ecbcuc_m.ecbcucdocno, "' "
                                  ," AND ecbcuc001 = '", g_ecbcuc_m.ecbcuc001, "' "
                                  ," AND ecbcuc002 = '", g_ecbcuc_m.ecbcuc002, "' "
                                  ," AND ecbcuc003 = '", g_ecbcuc_m.ecbcuc003, "' "

               #填到對應位置
               CALL csft003_browser_fill("")
            END IF


         #查詢方案選擇
         ON ACTION queryplansel
            LET g_action_choice = "queryplan" #ver:81
            CALL cl_dlg_qryplan_select() RETURNING ls_wc
            #不是空條件才寫入g_wc跟重新找資料
            IF NOT cl_null(ls_wc) THEN
               CALL util.JSON.parse(ls_wc, la_wc)
               INITIALIZE g_wc, g_wc2,g_wc2_table1,g_wc2_extend TO NULL

               FOR li_idx = 1 TO la_wc.getLength()
                  CASE
                     WHEN la_wc[li_idx].tableid = "ecbcuc_t"
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "ecbduc_t"
                        LET g_wc2_table1 = la_wc[li_idx].wc

                     WHEN la_wc[li_idx].tableid = "EXTENDWC"
                        LET g_wc2_extend = la_wc[li_idx].wc
                  END CASE
               END FOR
               IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1)

                  OR NOT cl_null(g_wc2_extend)
                  THEN
                  #組合g_wc2
                  IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
                     LET g_wc2 = g_wc2_table1
                  END IF

                  IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
                  END IF

                  IF g_wc2.subString(1,5) = " AND " THEN
                     LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
                  END IF
               END IF
               CALL csft003_browser_fill("F")   #browser_fill()會將notice區塊清空
               CALL cl_notice()   #重新顯示,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
            END IF

         #查詢方案選擇
         ON ACTION qbe_select
            LET g_action_choice = "queryplan" #ver:81
            CALL cl_qbe_list("m") RETURNING ls_wc
            IF NOT cl_null(ls_wc) THEN
               CALL util.JSON.parse(ls_wc, la_wc)
               INITIALIZE g_wc, g_wc2,g_wc2_table1,g_wc2_extend TO NULL

               FOR li_idx = 1 TO la_wc.getLength()
                  CASE
                     WHEN la_wc[li_idx].tableid = "ecbcuc_t"
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "ecbduc_t"
                        LET g_wc2_table1 = la_wc[li_idx].wc

                     WHEN la_wc[li_idx].tableid = "EXTENDWC"
                        LET g_wc2_extend = la_wc[li_idx].wc
                  END CASE
               END FOR
               IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1)

                  OR NOT cl_null(g_wc2_extend)
                  THEN
                  IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
                     LET g_wc2 = g_wc2_table1
                  END IF

                  IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
                  END IF
                  IF g_wc2.subString(1,5) = " AND " THEN
                     LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
                  END IF
                  #取得條件後需要重查、跳到結果第一筆資料的功能程式段
                  CALL csft003_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = ""
                     LET g_errparam.code = "-100"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL csft003_fetch("F")
                  END IF
               END IF
            END IF
            #重新搜尋會將notice區塊清空,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
            CALL cl_notice()

         #應用 a49 樣板自動產生(Version:4)
            #過濾瀏覽頁資料
            ON ACTION filter
               LET g_action_choice = "fetch"
               #add-point:filter action name="ui_dialog.action.filter"

               #end add-point
               CALL csft003_filter()
               EXIT DIALOG




         ON ACTION first
            LET g_action_choice = "fetch"
            CALL csft003_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL csft003_idx_chk()

         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL csft003_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL csft003_idx_chk()

         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL csft003_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL csft003_idx_chk()

         ON ACTION next
            LET g_action_choice = "fetch"
            CALL csft003_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL csft003_idx_chk()

         ON ACTION last
            LET g_action_choice = "fetch"
            CALL csft003_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL csft003_idx_chk()

         #excel匯出功能
         ON ACTION exporttoexcel
            LET g_action_choice="exporttoexcel"
            IF cl_auth_chk_act("exporttoexcel") THEN
               #(ver:87) ---start---
               #因應匯出excel規則調整，需同時符合新舊做法
               LET lb_get_type = cl_get_exporttoexcel_type()
               #add-point:ON ACTION exporttoexcel name="ui_dialog.exporttoexcel_type_change"

               #END add-point
               DISPLAY "lb_get_type:",lb_get_type

               CASE
                  WHEN lb_get_type = "poi"   #使用poi樣板
                     #browser
                     CALL g_export_node.clear()
                     IF g_main_hidden = 1 THEN
                        LET l_arr_len = g_browser.getLength()
                        LET g_export_tabname[1] = "s_browse"
                        LET g_export_tag[1] = rec_arr_type.create(l_arr_len)
                        FOR l_arr_cnt = 1 TO l_arr_len
                           LET g_export_tag[1][l_arr_cnt] = g_browser[l_arr_cnt]
                        END FOR

                        #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_browser_poi"

                        #END add-point
                        CALL cl_export_poi()
                        #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_browser_after_poi"

                        #END add-point
                     #非browser
                     ELSE
                        LET l_arr_len = g_ecbduc_d.getLength()
                        LET g_export_tag[1] = rec_arr_type.create(l_arr_len)
                        LET g_export_tabname[1] = "s_detail1"
                        FOR l_arr_cnt = 1 TO l_arr_len
                           LET g_export_tag[1][l_arr_cnt] = g_ecbduc_d[l_arr_cnt]
                        END FOR


                        #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_poi"

                        #END add-point
                        CALL cl_export_to_excel_getpage()
                        CALL cl_export_poi()
                        #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_after_poi"

                        #END add-point
                     END IF

                  OTHERWISE   #使用原始樣板
               #(ver:87) --- end ---

                     #browser
                     CALL g_export_node.clear()
                     IF g_main_hidden = 1 THEN
                        LET g_export_node[1] = base.typeInfo.create(g_browser)
                        LET g_export_id[1]   = "s_browse"
                        #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_browser"   #(ver:80)

                        #END add-point
                        CALL cl_export_to_excel()
                        #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_browser_after"   #(ver:80)

                        #END add-point
                     #非browser
                     ELSE
                        LET g_export_node[1] = base.typeInfo.create(g_ecbduc_d)
                        LET g_export_id[1]   = "s_detail1"

                        #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"

                        #END add-point
                        CALL cl_export_to_excel_getpage()
                        CALL cl_export_to_excel()
                        #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_after"   #(ver:80)

                        #END add-point
                     END IF
               END CASE   #(ver:87) add
            END IF

         ON ACTION close
            LET INT_FLAG = FALSE
            LET g_action_choice = "exit"
            EXIT DIALOG

         ON ACTION exit
            LET g_action_choice = "exit"
            EXIT DIALOG

         #主頁摺疊
         ON ACTION mainhidden
            #(ver:85) ---start---
            #add-point:ui_dialog段 mainhidden name="ui_dialog.mainhidden"

            #end add-point
            #(ver:85) --- end ---
            IF g_main_hidden THEN
               CALL gfrm_curr.setElementHidden("mainlayout",0)
               CALL gfrm_curr.setElementHidden("worksheet",1)
               LET g_main_hidden = 0
            ELSE
               CALL gfrm_curr.setElementHidden("mainlayout",1)
               CALL gfrm_curr.setElementHidden("worksheet",0)
               LET g_main_hidden = 1
               CALL cl_notice()
            END IF

         #瀏覽頁折疊
         ON ACTION worksheethidden
            #(ver:85) ---start---
            #add-point:ui_dialog段 worksheethidden name="ui_dialog.worksheethidden"

            #end add-point
            #(ver:85) --- end ---
            IF g_main_hidden THEN
               CALL gfrm_curr.setElementHidden("mainlayout",0)
               CALL gfrm_curr.setElementHidden("worksheet",1)
               LET g_main_hidden = 0
            ELSE
               CALL gfrm_curr.setElementHidden("mainlayout",1)
               CALL gfrm_curr.setElementHidden("worksheet",0)
               LET g_main_hidden = 1
            END IF
            IF lb_first THEN
               LET lb_first = FALSE
               NEXT FIELD ecbduc004
            END IF

         #單頭摺疊，可利用hot key "Alt-s"開啟/關閉單頭
         ON ACTION controls
            IF g_header_hidden THEN
               CALL gfrm_curr.setElementHidden("vb_master",0)
               CALL gfrm_curr.setElementImage("controls","small/arr-u.png")
               LET g_header_hidden = 0     #visible
            ELSE
               CALL gfrm_curr.setElementHidden("vb_master",1)
               CALL gfrm_curr.setElementImage("controls","small/arr-d.png")
               LET g_header_hidden = 1     #hidden
            END IF


         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify
            LET g_action_choice="modify"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = ''
               CALL csft003_modify()
               #add-point:ON ACTION modify name="menu.modify"

               #END add-point

            END IF




         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL csft003_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"

               #END add-point

            END IF




         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL csft003_delete()
               #add-point:ON ACTION delete name="menu.delete"

               #END add-point

            END IF




         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL csft003_insert()
               #add-point:ON ACTION insert name="menu.insert"

               #END add-point

            END IF




         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN

               #add-point:ON ACTION output name="menu.output"
               #M001 180725 By TSD.Harry------(S)
               LET g_rep_wc = " ecbcucent = ",g_enterprise,
                              " AND ecbcucsite = '",g_site,"'",
                              " AND ecbcucdocno = '",g_ecbcuc_m.ecbcucdocno,"'",
                              " AND ecbcuc001   = '",g_ecbcuc_m.ecbcuc001,"'",
                              " AND ecbcuc002   = '",g_ecbcuc_m.ecbcuc002,"'",
                              " AND ecbcuc003   = '",g_ecbcuc_m.ecbcuc003,"'"
               #M001 180725 By TSD.Harry------(E)
#               #END add-point
#               &include "erp/csf/csft003_rep.4gl"
#               #add-point:ON ACTION output.after name="menu.after_output"
               OPEN WINDOW w_apmt400_01_s01 WITH FORM cl_ap_formpath("csf","csfra01_s01")

               CALL cl_ui_init()
               LET lwin_curr = ui.Window.getCurrent()
               LET lfrm_curr = lwin_curr.getForm()
               LET ls_path = os.Path.join(os.Path.join(FGL_GETENV("ERP"),"cfg"),"4tb")
               LET ls_path = os.Path.join(ls_path,"toolbar_lib.4tb")
               CALL lfrm_curr.loadToolBar(ls_path)

               #1.依BOM產生  #2.依工單整批產生  #3.依訂單產生 #4.依訂單展BOM產生  #5.依订单转包材BOM
               INPUT l_choice FROM formonly.choice
                   BEFORE INPUT
                      LET l_choice = '1'
               END INPUT

               IF INT_FLAG THEN
                  LET INT_FLAG = FALSE
                  CLOSE WINDOW w_apmt400_01_s01
                  #RETURN
               END IF

               IF l_choice NOT MATCHES '[12]' OR cl_null(l_choice) THEN
                  CLOSE WINDOW w_apmt400_01_s01
                  LET l_choice = '1'
                  #RETURN g_success
               END IF

               CLOSE WINDOW w_apmt400_01_s01

               IF l_choice = '1' THEN
                  CALL csfra02_g01(g_rep_wc)
               ELSE
                  #CALL csfra02_g02(g_rep_wc)
               END IF

               #END add-point

            END IF




         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN

               #add-point:ON ACTION quickprint name="menu.quickprint"
               #M001 180725 By TSD.Harry------(S)
               LET g_rep_wc = " ecbcucent = ",g_enterprise,
                              " AND ecbcucsite = '",g_site,"'",
                              " AND ecbcucdocno = '",g_ecbcuc_m.ecbcucdocno,"'",
                              " AND ecbcuc001   = '",g_ecbcuc_m.ecbcuc001,"'",
                              " AND ecbcuc002   = '",g_ecbcuc_m.ecbcuc002,"'",
                              " AND ecbcuc003   = '",g_ecbcuc_m.ecbcuc003,"'"
               #M001 180725 By TSD.Harry------(E)
               #END add-point
               &include "erp/csf/csft003_rep.4gl"
               #add-point:ON ACTION quickprint.after name="menu.after_quickprint"

               #END add-point

            END IF




         #應用 a43 樣板自動產生(Version:4)
         ON ACTION reproduce
            LET g_action_choice="reproduce"
            IF cl_auth_chk_act("reproduce") THEN
               CALL csft003_reproduce()
               #add-point:ON ACTION reproduce name="menu.reproduce"

               #END add-point

            END IF




         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL csft003_query()
               #add-point:ON ACTION query name="menu.query"

               #END add-point
               #應用 a59 樣板自動產生(Version:3)
               CALL g_curr_diag.setCurrentRow("s_detail1",1)




            END IF





         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL csft003_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"

               #END add-point
               CALL cl_doc()
            END IF

         ON ACTION agendum
            CALL csft003_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"

            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()

         ON ACTION followup
            CALL csft003_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"

            #END add-point
            CALL cl_user_overview_follow(g_ecbcuc_m.ecbcucdocdt)




         #主選單用ACTION
         &include "main_menu_exit_dialog.4gl"
         &include "relating_action.4gl"

         #交談指令共用ACTION
         &include "common_action.4gl"
            CONTINUE DIALOG
      END DIALOG

      #(ver:79) ---add start---
      #add-point:ui_dialog段 after dialog name="ui_dialog.exit_dialog"

      #end add-point
      #(ver:79) --- add end ---

      IF g_action_choice = "exit" AND NOT cl_null(g_action_choice) THEN
         #add-point:ui_dialog段離開dialog前 name="ui_dialog.b_exit"

         #end add-point
         EXIT WHILE
      END IF

   END WHILE

   CALL cl_set_act_visible("accept,cancel", TRUE)

END FUNCTION

{</section>}

{<section id="csft003.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION csft003_browser_fill(ps_page_action)
   #add-point:browser_fill段define(客製用) name="browser_fill.define_customerization"

   #end add-point
   DEFINE ps_page_action    STRING
   DEFINE l_wc              STRING
   DEFINE l_wc2             STRING
   DEFINE l_sql             STRING
   DEFINE l_sub_sql         STRING
   DEFINE l_sql_rank        STRING
   #add-point:browser_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="browser_fill.define"

   #end add-point

   #add-point:Function前置處理 name="browser_fill.before_browser_fill"

   #end add-point

   IF cl_null(g_wc) THEN
      LET g_wc = " 1=1"
   END IF
   IF cl_null(g_wc2) THEN
      LET g_wc2 = " 1=1"
   END IF
   LET l_wc  = g_wc.trim()
   LET l_wc2 = g_wc2.trim()

   #add-point:browser_fill,foreach前 name="browser_fill.before_foreach"

   #end add-point

   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT ecbcucdocno,ecbcuc001,ecbcuc002,ecbcuc003 ",
                      " FROM ecbcuc_t ",
                      " ",
                      " LEFT JOIN ecbduc_t ON ecbducent = ecbcucent AND ecbducsite = ecbcucsite AND ecbcucdocno = ecbducdocno AND ecbcuc001 = ecbduc001 AND ecbcuc002 = ecbduc002 AND ecbcuc003 = ecbduc003 ", "  ",
                      #add-point:browser_fill段sql(ecbduc_t1) name="browser_fill.cnt.join.}"

                      #end add-point


                      " ",
                      " ",


                      " WHERE ecbcucent = " ||g_enterprise|| " AND ecbcucsite = '" ||g_site|| "' AND ecbducent = " ||g_enterprise|| " AND ecbducsite = '" ||g_site|| "' AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("ecbcuc_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT ecbcucdocno,ecbcuc001,ecbcuc002,ecbcuc003 ",
                      " FROM ecbcuc_t ",
                      "  ",
                      "  ",
                      " WHERE ecbcucent = " ||g_enterprise|| " AND ecbcucsite = '" ||g_site|| "' AND ",l_wc CLIPPED, cl_sql_add_filter("ecbcuc_t")
   END IF

   #add-point:browser_fill,cnt wc name="browser_fill.cnt_sqlwc"

   #end add-point

   LET g_sql = " SELECT COUNT(1) FROM (",l_sub_sql,")"

   #add-point:browser_fill,count前 name="browser_fill.before_count"

   #end add-point

   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE header_cnt_pre FROM g_sql
      EXECUTE header_cnt_pre INTO g_browser_cnt   #總筆數
      FREE header_cnt_pre
   END IF

   IF g_browser_cnt > g_max_browse THEN
      IF g_error_show = 1 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = g_browser_cnt
         LET g_errparam.code = 9035
         LET g_errparam.popup = TRUE
         CALL cl_err()
      END IF
      LET g_browser_cnt = g_max_browse
   END IF

   DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
   DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示

   #根據行為確定資料填充位置及WC
   IF cl_null(g_add_browse) THEN
      #清除畫面
      CLEAR FORM
      INITIALIZE g_ecbcuc_m.* TO NULL
      CALL g_ecbduc_d.clear()

      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"

      #end add-point
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1"
      LET g_cnt = g_current_idx
   END IF

   #依照t0.ecbcuc001,t0.ecbcuc002,t0.ecbcuc003,t0.ecbcucdocno,t0.ecbcuc004,t0.ecbcuc005,t0.ecbcuc006 Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件
      LET g_sql = " SELECT DISTINCT t0.ecbcucstus,t0.ecbcuc001,t0.ecbcuc002,t0.ecbcuc003,t0.ecbcucdocno,
          t0.ecbcuc004,t0.ecbcuc005,t0.ecbcuc006 ",
                  " FROM ecbcuc_t t0",
                  "  ",
                  "  LEFT JOIN ecbduc_t ON ecbducent = ecbcucent AND ecbducsite = ecbcucsite AND ecbcucdocno = ecbducdocno AND ecbcuc001 = ecbduc001 AND ecbcuc002 = ecbduc002 AND ecbcuc003 = ecbduc003 ", "  ",
                  #add-point:browser_fill段sql(ecbduc_t1) name="browser_fill.join.ecbduc_t1"

                  #end add-point


                  " ",



                  " WHERE t0.ecbcucent = " ||g_enterprise|| " AND t0.ecbcucsite = '" ||g_site|| "' AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("ecbcuc_t")
   ELSE
      #單身無輸入搜尋條件
      LET g_sql = " SELECT DISTINCT t0.ecbcucstus,t0.ecbcuc001,t0.ecbcuc002,t0.ecbcuc003,t0.ecbcucdocno,
          t0.ecbcuc004,t0.ecbcuc005,t0.ecbcuc006 ",
                  " FROM ecbcuc_t t0",
                  "  ",

                  " WHERE t0.ecbcucent = " ||g_enterprise|| " AND t0.ecbcucsite = '" ||g_site|| "' AND ",l_wc, cl_sql_add_filter("ecbcuc_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"

   #end add-point
   LET g_sql = g_sql, " ORDER BY ecbcucdocno,ecbcuc001,ecbcuc002,ecbcuc003 ",g_order

   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"

   #end add-point

   #LET g_sql = cl_sql_add_tabid(g_sql,"ecbcuc_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料

   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre

      #add-point:browser_fill段open cursor name="browser_fill.open"

      #end add-point

      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_ecbcuc001,g_browser[g_cnt].b_ecbcuc002,
          g_browser[g_cnt].b_ecbcuc003,g_browser[g_cnt].b_ecbcucdocno,g_browser[g_cnt].b_ecbcuc004,g_browser[g_cnt].b_ecbcuc005,
          g_browser[g_cnt].b_ecbcuc006
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "Foreach:",SQLERRMESSAGE
            LET g_errparam.code = SQLCA.SQLCODE
            LET g_errparam.popup = TRUE
            CALL cl_err()
            EXIT FOREACH
         END IF

         #add-point:browser_fill段reference name="browser_fill.reference"

         #end add-point

         #遮罩相關處理
         CALL csft003_browser_mask()

               #應用 a24 樣板自動產生(Version:3)
      #browser顯示圖片
      CASE g_browser[g_cnt].b_statepic
         WHEN "N"
            LET g_browser[g_cnt].b_statepic = "stus/16/unconfirmed.png"
         WHEN "Y"
            LET g_browser[g_cnt].b_statepic = "stus/16/confirmed.png"
         WHEN "S"
            LET g_browser[g_cnt].b_statepic = "stus/16/posted.png"
         WHEN "Z"
            LET g_browser[g_cnt].b_statepic = "stus/16/unposted.png"
         WHEN "X"
            LET g_browser[g_cnt].b_statepic = "stus/16/invalid.png"

      END CASE



         LET g_cnt = g_cnt + 1
         IF g_cnt > g_max_browse THEN
            EXIT FOREACH
         END IF

      END FOREACH
      FREE browse_pre
   END IF

   #清空g_add_browse, 並指定指標位置
   IF NOT cl_null(g_add_browse) THEN
      LET g_add_browse = ""
      CALL g_curr_diag.setCurrentRow("s_browse",g_current_idx)
   END IF

   IF cl_null(g_browser[g_cnt].b_ecbcucdocno) THEN
      CALL g_browser.deleteElement(g_cnt)
   END IF

   LET g_header_cnt  = g_browser.getLength()
   LET g_browser_cnt = g_browser.getLength()

   #筆數顯示
   IF g_browser_cnt > 0 THEN
      DISPLAY g_browser_idx TO FORMONLY.b_index #當下筆數
      DISPLAY g_browser_cnt TO FORMONLY.b_count #總筆數
      DISPLAY g_browser_idx TO FORMONLY.h_index #當下筆數
      DISPLAY g_browser_cnt TO FORMONLY.h_count #總筆數
      DISPLAY g_detail_idx  TO FORMONLY.idx     #單身當下筆數
      DISPLAY g_detail_cnt  TO FORMONLY.cnt     #單身總筆數
   ELSE
      DISPLAY '' TO FORMONLY.b_index #當下筆數
      DISPLAY '' TO FORMONLY.b_count #總筆數
      DISPLAY '' TO FORMONLY.h_index #當下筆數
      DISPLAY '' TO FORMONLY.h_count #總筆數
      DISPLAY '' TO FORMONLY.idx     #單身當下筆數
      DISPLAY '' TO FORMONLY.cnt     #單身總筆數
   END IF

   LET g_rec_b = g_cnt - 1
   LET g_detail_cnt = g_rec_b
   LET g_cnt = 0

   #若無資料則關閉相關功能
   IF g_browser_cnt = 0 THEN
      CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce,mainhidden", FALSE)
      CALL cl_navigator_setting(0,0)
   ELSE
      CALL cl_set_act_visible("mainhidden", TRUE)
   END IF


   #add-point:browser_fill段結束前 name="browser_fill.after"

   #end add-point

END FUNCTION

{</section>}

{<section id="csft003.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION csft003_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"

   #end add-point
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"

   #end add-point

   #add-point:Function前置處理  name="ui_headershow.pre_function"

   #end add-point

   LET g_ecbcuc_m.ecbcucdocno = g_browser[g_current_idx].b_ecbcucdocno
   LET g_ecbcuc_m.ecbcuc001 = g_browser[g_current_idx].b_ecbcuc001
   LET g_ecbcuc_m.ecbcuc002 = g_browser[g_current_idx].b_ecbcuc002
   LET g_ecbcuc_m.ecbcuc003 = g_browser[g_current_idx].b_ecbcuc003

   EXECUTE csft003_master_referesh USING g_site,g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcuc001,g_ecbcuc_m.ecbcuc002,
       g_ecbcuc_m.ecbcuc003 INTO g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcucdocdt,g_ecbcuc_m.ecbcuc008,
       g_ecbcuc_m.ecbcuc003,g_ecbcuc_m.ecbcuc004,g_ecbcuc_m.ecbcuc005,g_ecbcuc_m.ecbcuc006,g_ecbcuc_m.ecbcuc002,
       g_ecbcuc_m.ecbcuc007,g_ecbcuc_m.ecbcuc011,g_ecbcuc_m.ecbcuc001,g_ecbcuc_m.ecbcucstus,g_ecbcuc_m.ecbcucownid,
       g_ecbcuc_m.ecbcucowndp,g_ecbcuc_m.ecbcuccrtid,g_ecbcuc_m.ecbcuccrtdp,g_ecbcuc_m.ecbcuccrtdt,g_ecbcuc_m.ecbcucmodid,
       g_ecbcuc_m.ecbcucmoddt,g_ecbcuc_m.ecbcuc003_desc,g_ecbcuc_m.ecbcuc006_desc,g_ecbcuc_m.ecbcuc007_desc,
       g_ecbcuc_m.ecbcucownid_desc,g_ecbcuc_m.ecbcucowndp_desc,g_ecbcuc_m.ecbcuccrtid_desc,g_ecbcuc_m.ecbcuccrtdp_desc,
       g_ecbcuc_m.ecbcucmodid_desc

   CALL csft003_ecbcuc_t_mask()
   CALL csft003_show()

END FUNCTION

{</section>}

{<section id="csft003.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION csft003_ui_detailshow()
   #add-point:ui_detailshow段define(客製用) name="ui_detailshow.define_customerization"

   #end add-point
   #add-point:ui_detailshow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_detailshow.define"

   #end add-point

   #add-point:Function前置處理 name="ui_detailshow.before"

   #end add-point

   IF g_curr_diag IS NOT NULL THEN
      CALL g_curr_diag.setCurrentRow("s_detail1",g_detail_idx)

   END IF

   #add-point:ui_detailshow段after name="ui_detailshow.after"

   #end add-point

END FUNCTION

{</section>}

{<section id="csft003.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION csft003_ui_browser_refresh()
   #add-point:ui_browser_refresh段define(客製用) name="ui_browser_refresh.define_customerization"

   #end add-point
   DEFINE l_i  LIKE type_t.num10
   #add-point:ui_browser_refresh段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_browser_refresh.define"

   #end add-point

   #add-point:Function前置處理  name="ui_browser_refresh.pre_function"

   #end add-point

   LET g_browser_cnt = g_browser.getLength()
   LET g_header_cnt  = g_browser.getLength()
   FOR l_i =1 TO g_browser.getLength()
      IF g_browser[l_i].b_ecbcucdocno = g_ecbcuc_m.ecbcucdocno
         AND g_browser[l_i].b_ecbcuc001 = g_ecbcuc_m.ecbcuc001
         AND g_browser[l_i].b_ecbcuc002 = g_ecbcuc_m.ecbcuc002
         AND g_browser[l_i].b_ecbcuc003 = g_ecbcuc_m.ecbcuc003

         THEN
         CALL g_browser.deleteElement(l_i)
         EXIT FOR
      END IF
   END FOR
   LET g_browser_cnt = g_browser_cnt - 1
   LET g_header_cnt = g_header_cnt - 1

   #若無資料則關閉相關功能
   IF g_browser_cnt = 0 THEN
      CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce,mainhidden", FALSE)
      CALL cl_navigator_setting(0,0)
      CLEAR FORM
   ELSE
      CALL cl_set_act_visible("mainhidden", TRUE)
   END IF

   #add-point:ui_browser_refresh段after name="ui_browser_refresh.after"

   #end add-point

END FUNCTION

{</section>}

{<section id="csft003.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION csft003_construct()
   #add-point:cs段define(客製用) name="cs.define_customerization"

   #end add-point
   DEFINE ls_return   STRING
   DEFINE ls_result   STRING
   DEFINE ls_wc       STRING
   DEFINE la_wc       DYNAMIC ARRAY OF RECORD
          tableid     STRING,
          wc          STRING
          END RECORD
   DEFINE li_idx      LIKE type_t.num10
   #add-point:cs段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="cs.define"

   #end add-point

   #add-point:Function前置處理  name="cs.pre_function"

   #end add-point

   #清除畫面
   CLEAR FORM
   INITIALIZE g_ecbcuc_m.* TO NULL
   CALL g_ecbduc_d.clear()


   LET g_action_choice = ""

   INITIALIZE g_wc TO NULL
   INITIALIZE g_wc2 TO NULL

   INITIALIZE g_wc2_table1 TO NULL


   LET g_qryparam.state = 'c'

   #add-point:cs段開始前 name="cs.before_construct"

   #end add-point

   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)

      #單頭
      CONSTRUCT BY NAME g_wc ON ecbcucdocno,ecbcucdocno_desc,ecbcucdocdt,ecbcuc008,ecbcuc003,ecbcuc004,
          ecbcuc005,ecbcuc006,ecbcuc002,ecbcuc002_desc_1,ecbcuc002_desc_5,ecbcuc002_desc_2,ecbcuc002_desc_6,
          ecbcuc002_desc_3,ecbcuc007,ecbcuc002_desc_4,l_sum,ecbcuc011,ecbcuc001,ecbcucstus,ecbcucownid,
          ecbcucowndp,ecbcuccrtid,ecbcuccrtdp,ecbcuccrtdt,ecbcucmodid,ecbcucmoddt

         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"

            #end add-point

         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理
         ##----<<ecbcuccrtdt>>----
         AFTER FIELD ecbcuccrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)

         #----<<ecbcucmoddt>>----
         AFTER FIELD ecbcucmoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)

         #----<<ecbcuccnfdt>>----

         #----<<ecbcucpstdt>>----




         #一般欄位開窗相關處理
                  #Ctrlp:construct.c.ecbcucdocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcucdocno
            #add-point:ON ACTION controlp INFIELD ecbcucdocno name="construct.c.ecbcucdocno"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL cq_ecbcucdocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO ecbcucdocno  #顯示到畫面上
            NEXT FIELD ecbcucdocno                     #返回原欄位




            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcucdocno
            #add-point:BEFORE FIELD ecbcucdocno name="construct.b.ecbcucdocno"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcucdocno

            #add-point:AFTER FIELD ecbcucdocno name="construct.a.ecbcucdocno"

            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcucdocno_desc
            #add-point:BEFORE FIELD ecbcucdocno_desc name="construct.b.ecbcucdocno_desc"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcucdocno_desc

            #add-point:AFTER FIELD ecbcucdocno_desc name="construct.a.ecbcucdocno_desc"

            #END add-point



         #Ctrlp:construct.c.ecbcucdocno_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcucdocno_desc
            #add-point:ON ACTION controlp INFIELD ecbcucdocno_desc name="construct.c.ecbcucdocno_desc"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcucdocdt
            #add-point:BEFORE FIELD ecbcucdocdt name="construct.b.ecbcucdocdt"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcucdocdt

            #add-point:AFTER FIELD ecbcucdocdt name="construct.a.ecbcucdocdt"

            #END add-point



         #Ctrlp:construct.c.ecbcucdocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcucdocdt
            #add-point:ON ACTION controlp INFIELD ecbcucdocdt name="construct.c.ecbcucdocdt"

            #END add-point


         #Ctrlp:construct.c.ecbcuc008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuc008
            #add-point:ON ACTION controlp INFIELD ecbcuc008 name="construct.c.ecbcuc008"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL cq_sfpb006()                           #呼叫開窗
            DISPLAY g_qryparam.return9 TO ecbcuc008  #顯示到畫面上
            NEXT FIELD ecbcuc008                     #返回原欄位




            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuc008
            #add-point:BEFORE FIELD ecbcuc008 name="construct.b.ecbcuc008"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuc008

            #add-point:AFTER FIELD ecbcuc008 name="construct.a.ecbcuc008"

            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuc003
            #add-point:BEFORE FIELD ecbcuc003 name="construct.b.ecbcuc003"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuc003

            #add-point:AFTER FIELD ecbcuc003 name="construct.a.ecbcuc003"

            #END add-point



         #Ctrlp:construct.c.ecbcuc003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuc003
            #add-point:ON ACTION controlp INFIELD ecbcuc003 name="construct.c.ecbcuc003"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuc004
            #add-point:BEFORE FIELD ecbcuc004 name="construct.b.ecbcuc004"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuc004

            #add-point:AFTER FIELD ecbcuc004 name="construct.a.ecbcuc004"

            #END add-point



         #Ctrlp:construct.c.ecbcuc004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuc004
            #add-point:ON ACTION controlp INFIELD ecbcuc004 name="construct.c.ecbcuc004"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuc005
            #add-point:BEFORE FIELD ecbcuc005 name="construct.b.ecbcuc005"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuc005

            #add-point:AFTER FIELD ecbcuc005 name="construct.a.ecbcuc005"

            #END add-point



         #Ctrlp:construct.c.ecbcuc005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuc005
            #add-point:ON ACTION controlp INFIELD ecbcuc005 name="construct.c.ecbcuc005"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuc006
            #add-point:BEFORE FIELD ecbcuc006 name="construct.b.ecbcuc006"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuc006

            #add-point:AFTER FIELD ecbcuc006 name="construct.a.ecbcuc006"

            #END add-point



         #Ctrlp:construct.c.ecbcuc006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuc006
            #add-point:ON ACTION controlp INFIELD ecbcuc006 name="construct.c.ecbcuc006"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuc002
            #add-point:BEFORE FIELD ecbcuc002 name="construct.b.ecbcuc002"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuc002

            #add-point:AFTER FIELD ecbcuc002 name="construct.a.ecbcuc002"

            #END add-point



         #Ctrlp:construct.c.ecbcuc002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuc002
            #add-point:ON ACTION controlp INFIELD ecbcuc002 name="construct.c.ecbcuc002"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuc002_desc_1
            #add-point:BEFORE FIELD ecbcuc002_desc_1 name="construct.b.ecbcuc002_desc_1"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuc002_desc_1

            #add-point:AFTER FIELD ecbcuc002_desc_1 name="construct.a.ecbcuc002_desc_1"

            #END add-point



         #Ctrlp:construct.c.ecbcuc002_desc_1
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuc002_desc_1
            #add-point:ON ACTION controlp INFIELD ecbcuc002_desc_1 name="construct.c.ecbcuc002_desc_1"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuc002_desc_5
            #add-point:BEFORE FIELD ecbcuc002_desc_5 name="construct.b.ecbcuc002_desc_5"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuc002_desc_5

            #add-point:AFTER FIELD ecbcuc002_desc_5 name="construct.a.ecbcuc002_desc_5"

            #END add-point



         #Ctrlp:construct.c.ecbcuc002_desc_5
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuc002_desc_5
            #add-point:ON ACTION controlp INFIELD ecbcuc002_desc_5 name="construct.c.ecbcuc002_desc_5"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuc002_desc_2
            #add-point:BEFORE FIELD ecbcuc002_desc_2 name="construct.b.ecbcuc002_desc_2"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuc002_desc_2

            #add-point:AFTER FIELD ecbcuc002_desc_2 name="construct.a.ecbcuc002_desc_2"

            #END add-point



         #Ctrlp:construct.c.ecbcuc002_desc_2
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuc002_desc_2
            #add-point:ON ACTION controlp INFIELD ecbcuc002_desc_2 name="construct.c.ecbcuc002_desc_2"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuc002_desc_6
            #add-point:BEFORE FIELD ecbcuc002_desc_6 name="construct.b.ecbcuc002_desc_6"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuc002_desc_6

            #add-point:AFTER FIELD ecbcuc002_desc_6 name="construct.a.ecbcuc002_desc_6"

            #END add-point



         #Ctrlp:construct.c.ecbcuc002_desc_6
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuc002_desc_6
            #add-point:ON ACTION controlp INFIELD ecbcuc002_desc_6 name="construct.c.ecbcuc002_desc_6"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuc002_desc_3
            #add-point:BEFORE FIELD ecbcuc002_desc_3 name="construct.b.ecbcuc002_desc_3"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuc002_desc_3

            #add-point:AFTER FIELD ecbcuc002_desc_3 name="construct.a.ecbcuc002_desc_3"

            #END add-point



         #Ctrlp:construct.c.ecbcuc002_desc_3
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuc002_desc_3
            #add-point:ON ACTION controlp INFIELD ecbcuc002_desc_3 name="construct.c.ecbcuc002_desc_3"

            #END add-point


         #Ctrlp:construct.c.ecbcuc007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuc007
            #add-point:ON ACTION controlp INFIELD ecbcuc007 name="construct.c.ecbcuc007"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            CALL q_ooag001_4()                           #呼叫開窗   #mark by liuxuan180719
            CALL cq_ooag001_4()     #add by liuxuan180719
            DISPLAY g_qryparam.return1 TO ecbcuc007  #顯示到畫面上
            NEXT FIELD ecbcuc007                     #返回原欄位




            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuc007
            #add-point:BEFORE FIELD ecbcuc007 name="construct.b.ecbcuc007"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuc007

            #add-point:AFTER FIELD ecbcuc007 name="construct.a.ecbcuc007"

            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuc002_desc_4
            #add-point:BEFORE FIELD ecbcuc002_desc_4 name="construct.b.ecbcuc002_desc_4"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuc002_desc_4

            #add-point:AFTER FIELD ecbcuc002_desc_4 name="construct.a.ecbcuc002_desc_4"

            #END add-point



         #Ctrlp:construct.c.ecbcuc002_desc_4
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuc002_desc_4
            #add-point:ON ACTION controlp INFIELD ecbcuc002_desc_4 name="construct.c.ecbcuc002_desc_4"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_sum
            #add-point:BEFORE FIELD l_sum name="construct.b.l_sum"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_sum

            #add-point:AFTER FIELD l_sum name="construct.a.l_sum"

            #END add-point



         #Ctrlp:construct.c.l_sum
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_sum
            #add-point:ON ACTION controlp INFIELD l_sum name="construct.c.l_sum"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuc011
            #add-point:BEFORE FIELD ecbcuc011 name="construct.b.ecbcuc011"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuc011

            #add-point:AFTER FIELD ecbcuc011 name="construct.a.ecbcuc011"

            #END add-point



         #Ctrlp:construct.c.ecbcuc011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuc011
            #add-point:ON ACTION controlp INFIELD ecbcuc011 name="construct.c.ecbcuc011"

            #END add-point


         #Ctrlp:construct.c.ecbcuc001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuc001
            #add-point:ON ACTION controlp INFIELD ecbcuc001 name="construct.c.ecbcuc001"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL cq_sfpb006()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO ecbcuc001  #顯示到畫面上
            NEXT FIELD ecbcuc001                     #返回原欄位




            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuc001
            #add-point:BEFORE FIELD ecbcuc001 name="construct.b.ecbcuc001"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuc001

            #add-point:AFTER FIELD ecbcuc001 name="construct.a.ecbcuc001"

            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcucstus
            #add-point:BEFORE FIELD ecbcucstus name="construct.b.ecbcucstus"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcucstus

            #add-point:AFTER FIELD ecbcucstus name="construct.a.ecbcucstus"

            #END add-point



         #Ctrlp:construct.c.ecbcucstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcucstus
            #add-point:ON ACTION controlp INFIELD ecbcucstus name="construct.c.ecbcucstus"

            #END add-point


         #Ctrlp:construct.c.ecbcucownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcucownid
            #add-point:ON ACTION controlp INFIELD ecbcucownid name="construct.c.ecbcucownid"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO ecbcucownid  #顯示到畫面上
            NEXT FIELD ecbcucownid                     #返回原欄位




            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcucownid
            #add-point:BEFORE FIELD ecbcucownid name="construct.b.ecbcucownid"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcucownid

            #add-point:AFTER FIELD ecbcucownid name="construct.a.ecbcucownid"

            #END add-point



         #Ctrlp:construct.c.ecbcucowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcucowndp
            #add-point:ON ACTION controlp INFIELD ecbcucowndp name="construct.c.ecbcucowndp"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO ecbcucowndp  #顯示到畫面上
            NEXT FIELD ecbcucowndp                     #返回原欄位




            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcucowndp
            #add-point:BEFORE FIELD ecbcucowndp name="construct.b.ecbcucowndp"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcucowndp

            #add-point:AFTER FIELD ecbcucowndp name="construct.a.ecbcucowndp"

            #END add-point



         #Ctrlp:construct.c.ecbcuccrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuccrtid
            #add-point:ON ACTION controlp INFIELD ecbcuccrtid name="construct.c.ecbcuccrtid"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO ecbcuccrtid  #顯示到畫面上
            NEXT FIELD ecbcuccrtid                     #返回原欄位




            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuccrtid
            #add-point:BEFORE FIELD ecbcuccrtid name="construct.b.ecbcuccrtid"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuccrtid

            #add-point:AFTER FIELD ecbcuccrtid name="construct.a.ecbcuccrtid"

            #END add-point



         #Ctrlp:construct.c.ecbcuccrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuccrtdp
            #add-point:ON ACTION controlp INFIELD ecbcuccrtdp name="construct.c.ecbcuccrtdp"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO ecbcuccrtdp  #顯示到畫面上
            NEXT FIELD ecbcuccrtdp                     #返回原欄位




            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuccrtdp
            #add-point:BEFORE FIELD ecbcuccrtdp name="construct.b.ecbcuccrtdp"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuccrtdp

            #add-point:AFTER FIELD ecbcuccrtdp name="construct.a.ecbcuccrtdp"

            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuccrtdt
            #add-point:BEFORE FIELD ecbcuccrtdt name="construct.b.ecbcuccrtdt"

            #END add-point


         #Ctrlp:construct.c.ecbcucmodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcucmodid
            #add-point:ON ACTION controlp INFIELD ecbcucmodid name="construct.c.ecbcucmodid"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO ecbcucmodid  #顯示到畫面上
            NEXT FIELD ecbcucmodid                     #返回原欄位




            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcucmodid
            #add-point:BEFORE FIELD ecbcucmodid name="construct.b.ecbcucmodid"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcucmodid

            #add-point:AFTER FIELD ecbcucmodid name="construct.a.ecbcucmodid"

            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcucmoddt
            #add-point:BEFORE FIELD ecbcucmoddt name="construct.b.ecbcucmoddt"

            #END add-point




      END CONSTRUCT

      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON ecbducseq,ecbduc004,ecbduc005,ecbduc006,ecbduc008,ecbduc007,l_jine
           FROM s_detail1[1].ecbducseq,s_detail1[1].ecbduc004,s_detail1[1].ecbduc005,s_detail1[1].ecbduc006,
               s_detail1[1].ecbduc008,s_detail1[1].ecbduc007,s_detail1[1].l_jine

         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"

            #end add-point

       #單身公用欄位開窗相關處理


       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbducseq
            #add-point:BEFORE FIELD ecbducseq name="construct.b.page1.ecbducseq"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbducseq

            #add-point:AFTER FIELD ecbducseq name="construct.a.page1.ecbducseq"

            #END add-point



         #Ctrlp:construct.c.page1.ecbducseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbducseq
            #add-point:ON ACTION controlp INFIELD ecbducseq name="construct.c.page1.ecbducseq"

            #END add-point


         #Ctrlp:construct.c.page1.ecbduc004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbduc004
            #add-point:ON ACTION controlp INFIELD ecbduc004 name="construct.c.page1.ecbduc004"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO ecbduc004  #顯示到畫面上
            NEXT FIELD ecbduc004                     #返回原欄位




            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbduc004
            #add-point:BEFORE FIELD ecbduc004 name="construct.b.page1.ecbduc004"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbduc004

            #add-point:AFTER FIELD ecbduc004 name="construct.a.page1.ecbduc004"

            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbduc005
            #add-point:BEFORE FIELD ecbduc005 name="construct.b.page1.ecbduc005"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbduc005

            #add-point:AFTER FIELD ecbduc005 name="construct.a.page1.ecbduc005"

            #END add-point



         #Ctrlp:construct.c.page1.ecbduc005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbduc005
            #add-point:ON ACTION controlp INFIELD ecbduc005 name="construct.c.page1.ecbduc005"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbduc006
            #add-point:BEFORE FIELD ecbduc006 name="construct.b.page1.ecbduc006"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbduc006

            #add-point:AFTER FIELD ecbduc006 name="construct.a.page1.ecbduc006"

            #END add-point



         #Ctrlp:construct.c.page1.ecbduc006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbduc006
            #add-point:ON ACTION controlp INFIELD ecbduc006 name="construct.c.page1.ecbduc006"

            #END add-point


         #Ctrlp:construct.c.page1.ecbduc008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbduc008
            #add-point:ON ACTION controlp INFIELD ecbduc008 name="construct.c.page1.ecbduc008"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            CALL q_ooag001_4()                           #呼叫開窗    #C20180531-09415#1 mark by zhaoqn
            CALL cq_ooag001_4()   #C20180531-09415#1 add by zhaoqn
            DISPLAY g_qryparam.return1 TO ecbduc008  #顯示到畫面上
            NEXT FIELD ecbduc008                     #返回原欄位




            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbduc008
            #add-point:BEFORE FIELD ecbduc008 name="construct.b.page1.ecbduc008"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbduc008

            #add-point:AFTER FIELD ecbduc008 name="construct.a.page1.ecbduc008"

            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbduc007
            #add-point:BEFORE FIELD ecbduc007 name="construct.b.page1.ecbduc007"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbduc007

            #add-point:AFTER FIELD ecbduc007 name="construct.a.page1.ecbduc007"

            #END add-point



         #Ctrlp:construct.c.page1.ecbduc007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbduc007
            #add-point:ON ACTION controlp INFIELD ecbduc007 name="construct.c.page1.ecbduc007"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_jine
            #add-point:BEFORE FIELD l_jine name="construct.b.page1.l_jine"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_jine

            #add-point:AFTER FIELD l_jine name="construct.a.page1.l_jine"

            #END add-point



         #Ctrlp:construct.c.page1.l_jine
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_jine
            #add-point:ON ACTION controlp INFIELD l_jine name="construct.c.page1.l_jine"

            #END add-point




      END CONSTRUCT





      #add-point:cs段add_cs(本段內只能出現新的CONSTRUCT指令) name="cs.add_cs"

      #end add-point

      BEFORE DIALOG
         CALL cl_qbe_init()
         #add-point:cs段b_dialog name="cs.b_dialog"

         #end add-point

      #查詢方案列表
      ON ACTION qbe_select
         LET ls_wc = ""
         CALL cl_qbe_list("c") RETURNING ls_wc
         IF NOT cl_null(ls_wc) THEN
            CALL util.JSON.parse(ls_wc, la_wc)
            INITIALIZE g_wc, g_wc2, g_wc2_table1, g_wc2_extend TO NULL

            FOR li_idx = 1 TO la_wc.getLength()
               CASE
                  WHEN la_wc[li_idx].tableid = "ecbcuc_t"
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "ecbduc_t"
                     LET g_wc2_table1 = la_wc[li_idx].wc

               END CASE
            END FOR
         END IF

      #條件儲存為方案
      ON ACTION qbe_save
         CALL cl_qbe_save()

      ON ACTION accept
         ACCEPT DIALOG

      ON ACTION cancel
         LET INT_FLAG = 1
         EXIT DIALOG

      #交談指令共用ACTION
      &include "common_action.4gl"
         CONTINUE DIALOG
   END DIALOG

   #組合g_wc2
   LET g_wc2 = g_wc2_table1




   #add-point:cs段結束前 name="cs.after_construct"

   #end add-point

   IF INT_FLAG THEN
      RETURN
   END IF

END FUNCTION

{</section>}

{<section id="csft003.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION csft003_filter()
   #add-point:filter段define name="filter.define_customerization"

   #end add-point
   #add-point:filter段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="filter.define"

   #end add-point

   #add-point:Function前置處理  name="filter.pre_function"

   #end add-point

   #切換畫面
   IF NOT g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",1)
      CALL gfrm_curr.setElementHidden("worksheet",0)
      LET g_main_hidden = 1
   END IF

   LET INT_FLAG = 0

   LET g_qryparam.state = 'c'

   LET g_wc_filter_t = g_wc_filter.trim()
   LET g_wc_t = g_wc

   LET g_wc = cl_replace_str(g_wc, g_wc_filter_t, '')

   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)

      #單頭
      CONSTRUCT g_wc_filter ON ecbcuc001,ecbcuc002,ecbcuc003,ecbcucdocno,ecbcuc004,ecbcuc005,ecbcuc006

                          FROM s_browse[1].b_ecbcuc001,s_browse[1].b_ecbcuc002,s_browse[1].b_ecbcuc003,
                              s_browse[1].b_ecbcucdocno,s_browse[1].b_ecbcuc004,s_browse[1].b_ecbcuc005,
                              s_browse[1].b_ecbcuc006

         BEFORE CONSTRUCT
               DISPLAY csft003_filter_parser('ecbcuc001') TO s_browse[1].b_ecbcuc001
            DISPLAY csft003_filter_parser('ecbcuc002') TO s_browse[1].b_ecbcuc002
            DISPLAY csft003_filter_parser('ecbcuc003') TO s_browse[1].b_ecbcuc003
            DISPLAY csft003_filter_parser('ecbcucdocno') TO s_browse[1].b_ecbcucdocno
            DISPLAY csft003_filter_parser('ecbcuc004') TO s_browse[1].b_ecbcuc004
            DISPLAY csft003_filter_parser('ecbcuc005') TO s_browse[1].b_ecbcuc005
            DISPLAY csft003_filter_parser('ecbcuc006') TO s_browse[1].b_ecbcuc006

         #add-point:filter段cs_ctrl name="filter.cs_ctrl"

         #end add-point

      END CONSTRUCT

      #add-point:filter段add_cs name="filter.add_cs"

      #end add-point

      BEFORE DIALOG
         #add-point:filter段b_dialog name="filter.b_dialog"

         #end add-point

      ON ACTION accept
         ACCEPT DIALOG

      ON ACTION cancel
         LET INT_FLAG = 1
         EXIT DIALOG

      #交談指令共用ACTION
      &include "common_action.4gl"
         CONTINUE DIALOG

   END DIALOG

   IF NOT INT_FLAG THEN
      LET g_wc_filter = "   AND   ", g_wc_filter, "   "
      LET g_wc = g_wc , g_wc_filter
   ELSE
      LET g_wc_filter = g_wc_filter_t
      LET g_wc = g_wc_t
   END IF

      CALL csft003_filter_show('ecbcuc001')
   CALL csft003_filter_show('ecbcuc002')
   CALL csft003_filter_show('ecbcuc003')
   CALL csft003_filter_show('ecbcucdocno')
   CALL csft003_filter_show('ecbcuc004')
   CALL csft003_filter_show('ecbcuc005')
   CALL csft003_filter_show('ecbcuc006')

END FUNCTION

{</section>}

{<section id="csft003.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION csft003_filter_parser(ps_field)
   #add-point:filter段define name="filter_parser.define_customerization"

   #end add-point
   DEFINE ps_field   STRING
   DEFINE ls_tmp     STRING
   DEFINE li_tmp     LIKE type_t.num10
   DEFINE li_tmp2    LIKE type_t.num10
   DEFINE ls_var     STRING
   #add-point:filter段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="filter_parser.define"

   #end add-point

   #一般條件解析
   LET ls_tmp = ps_field, "='"
   LET li_tmp = g_wc_filter.getIndexOf(ls_tmp,1)
   IF li_tmp > 0 THEN
      LET li_tmp = ls_tmp.getLength() + li_tmp
      LET li_tmp2 = g_wc_filter.getIndexOf("'",li_tmp + 1) - 1
      LET ls_var = g_wc_filter.subString(li_tmp,li_tmp2)
   END IF

   #模糊條件解析
   LET ls_tmp = ps_field, " like '"
   LET li_tmp = g_wc_filter.getIndexOf(ls_tmp,1)
   IF li_tmp > 0 THEN
      LET li_tmp = ls_tmp.getLength() + li_tmp
      LET li_tmp2 = g_wc_filter.getIndexOf("'",li_tmp + 1) - 1
      LET ls_var = g_wc_filter.subString(li_tmp,li_tmp2)
      LET ls_var = cl_replace_str(ls_var,'%','*')
   END IF

   RETURN ls_var

END FUNCTION

{</section>}

{<section id="csft003.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION csft003_filter_show(ps_field)
   DEFINE ps_field         STRING
   DEFINE lnode_item       om.DomNode
   DEFINE ls_title         STRING
   DEFINE ls_name          STRING
   DEFINE ls_condition     STRING

   LET ls_name = "formonly.b_", ps_field
   LET lnode_item = gfrm_curr.findNode("TableColumn", ls_name)
   LET ls_title = lnode_item.getAttribute("text")
   IF ls_title.getIndexOf('※',1) > 0 THEN
      LEt ls_title = ls_title.subString(1,ls_title.getIndexOf('※',1)-1)
   END IF

   #顯示資料組合
   LET ls_condition = csft003_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF

   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)

END FUNCTION

{</section>}

{<section id="csft003.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION csft003_query()
   #add-point:query段define(客製用) name="query.define_customerization"

   #end add-point
   DEFINE ls_wc STRING
   #add-point:query段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="query.define"

   #end add-point

   #add-point:Function前置處理  name="query.pre_function"

   #end add-point

   #切換畫面
   IF g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   END IF

   LET ls_wc = g_wc

   LET INT_FLAG = 0
   CALL cl_navigator_setting( g_current_idx, g_detail_cnt )
   ERROR ""

   #清除畫面及相關資料
   CLEAR FORM
   CALL g_browser.clear()
   CALL g_ecbduc_d.clear()


   #add-point:query段other name="query.other"

   #end add-point

   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count

   CALL csft003_construct()

   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL csft003_browser_fill("")
      CALL csft003_fetch("")
      RETURN
   END IF

   #儲存WC資訊
   CALL cl_dlg_save_user_latestqry("("||g_wc||") AND ("||g_wc2||")")

   #搜尋後資料初始化
   LET g_detail_cnt  = 0
   LET g_current_idx = 1
   LET g_current_row = 0
   LET g_detail_idx  = 1
   LET g_detail_idx2 = 1
   LET g_detail_idx_list[1] = 1

   LET g_error_show  = 1
   LET g_wc_filter   = ""
   LET l_ac = 1
   CALL FGL_SET_ARR_CURR(1)
      CALL csft003_filter_show('ecbcuc001')
   CALL csft003_filter_show('ecbcuc002')
   CALL csft003_filter_show('ecbcuc003')
   CALL csft003_filter_show('ecbcucdocno')
   CALL csft003_filter_show('ecbcuc004')
   CALL csft003_filter_show('ecbcuc005')
   CALL csft003_filter_show('ecbcuc006')
   CALL csft003_browser_fill("F")

   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ""
      LET g_errparam.code = "-100"
      LET g_errparam.popup = TRUE
      CALL cl_err()
   ELSE
      CALL csft003_fetch("F")
      #顯示單身筆數
      CALL csft003_idx_chk()
   END IF

END FUNCTION

{</section>}

{<section id="csft003.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION csft003_fetch(p_flag)
   #add-point:fetch段define(客製用) name="fetch.define_customerization"

   #end add-point
   DEFINE p_flag     LIKE type_t.chr1
   DEFINE ls_msg     STRING
   #add-point:fetch段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="fetch.define"

   #end add-point

   #add-point:Function前置處理  name="fetch.pre_function"

   #end add-point

   IF g_browser_cnt = 0 THEN
      RETURN
   END IF

   #清空第二階單身


   CALL cl_ap_performance_next_start()
   CASE p_flag
      WHEN 'F'
         LET g_current_idx = 1
      WHEN 'L'
         LET g_current_idx = g_browser.getLength()
      WHEN 'P'
         IF g_current_idx > 1 THEN
            LET g_current_idx = g_current_idx - 1
         END IF
      WHEN 'N'
         IF g_current_idx < g_header_cnt THEN
            LET g_current_idx =  g_current_idx + 1
         END IF
      WHEN '/'
         IF (NOT g_no_ask) THEN
            CALL cl_set_act_visible("accept,cancel", TRUE)
            CALL cl_getmsg('fetch',g_lang) RETURNING ls_msg
            LET INT_FLAG = 0

            PROMPT ls_msg CLIPPED,':' FOR g_jump
               #交談指令共用ACTION
               &include "common_action.4gl"
            END PROMPT

            CALL cl_set_act_visible("accept,cancel", FALSE)
            IF INT_FLAG THEN
                LET INT_FLAG = 0
                EXIT CASE
            END IF
         END IF

         IF g_jump > 0 AND g_jump <= g_browser.getLength() THEN
             LET g_current_idx = g_jump
         END IF
         LET g_no_ask = FALSE
   END CASE

   CALL g_curr_diag.setCurrentRow("s_browse", g_current_idx) #設定browse 索引

   LET g_current_row = g_current_idx
   LET g_detail_cnt = g_header_cnt

   #單身總筆數顯示
   IF g_detail_cnt > 0 THEN
      #若單身有資料時, idx至少為1
      IF g_detail_idx <= 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
   ELSE
      LET g_detail_idx = 0
      DISPLAY '' TO FORMONLY.idx
   END IF

   #瀏覽頁筆數顯示
   LET g_browser_idx = g_pagestart+g_current_idx-1
   DISPLAY g_browser_idx TO FORMONLY.b_index   #當下筆數
   DISPLAY g_browser_idx TO FORMONLY.h_index   #當下筆數

   CALL cl_navigator_setting( g_current_idx, g_browser_cnt )

   #代表沒有資料
   IF g_current_idx = 0 OR g_browser.getLength() = 0 THEN
      RETURN
   END IF

   #避免超出browser資料筆數上限
   IF g_current_idx > g_browser.getLength() THEN
      LET g_browser_idx = g_browser.getLength()
      LET g_current_idx = g_browser.getLength()
   END IF

   LET g_ecbcuc_m.ecbcucdocno = g_browser[g_current_idx].b_ecbcucdocno
   LET g_ecbcuc_m.ecbcuc001 = g_browser[g_current_idx].b_ecbcuc001
   LET g_ecbcuc_m.ecbcuc002 = g_browser[g_current_idx].b_ecbcuc002
   LET g_ecbcuc_m.ecbcuc003 = g_browser[g_current_idx].b_ecbcuc003


   #重讀DB,因TEMP有不被更新特性
   EXECUTE csft003_master_referesh USING g_site,g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcuc001,g_ecbcuc_m.ecbcuc002,
       g_ecbcuc_m.ecbcuc003 INTO g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcucdocdt,g_ecbcuc_m.ecbcuc008,
       g_ecbcuc_m.ecbcuc003,g_ecbcuc_m.ecbcuc004,g_ecbcuc_m.ecbcuc005,g_ecbcuc_m.ecbcuc006,g_ecbcuc_m.ecbcuc002,
       g_ecbcuc_m.ecbcuc007,g_ecbcuc_m.ecbcuc011,g_ecbcuc_m.ecbcuc001,g_ecbcuc_m.ecbcucstus,g_ecbcuc_m.ecbcucownid,
       g_ecbcuc_m.ecbcucowndp,g_ecbcuc_m.ecbcuccrtid,g_ecbcuc_m.ecbcuccrtdp,g_ecbcuc_m.ecbcuccrtdt,g_ecbcuc_m.ecbcucmodid,
       g_ecbcuc_m.ecbcucmoddt,g_ecbcuc_m.ecbcuc003_desc,g_ecbcuc_m.ecbcuc006_desc,g_ecbcuc_m.ecbcuc007_desc,
       g_ecbcuc_m.ecbcucownid_desc,g_ecbcuc_m.ecbcucowndp_desc,g_ecbcuc_m.ecbcuccrtid_desc,g_ecbcuc_m.ecbcuccrtdp_desc,
       g_ecbcuc_m.ecbcucmodid_desc

   #遮罩相關處理
   LET g_ecbcuc_m_mask_o.* =  g_ecbcuc_m.*
   CALL csft003_ecbcuc_t_mask()
   LET g_ecbcuc_m_mask_n.* =  g_ecbcuc_m.*

   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL csft003_set_act_visible()
   CALL csft003_set_act_no_visible()

   #add-point:fetch段action控制 name="fetch.action_control"

   #end add-point



   #add-point:fetch結束前 name="fetch.after"

   #end add-point

   #保存單頭舊值
   LET g_ecbcuc_m_t.* = g_ecbcuc_m.*
   LET g_ecbcuc_m_o.* = g_ecbcuc_m.*

   LET g_data_owner = g_ecbcuc_m.ecbcucownid
   LET g_data_dept  = g_ecbcuc_m.ecbcucowndp

   #重新顯示
   CALL csft003_show()



END FUNCTION

{</section>}

{<section id="csft003.insert" >}
#+ 資料新增
PRIVATE FUNCTION csft003_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"

   #end add-point
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"

   #end add-point

   #add-point:Function前置處理  name="insert.pre_function"

   #end add-point

   #清畫面欄位內容
   CLEAR FORM
   CALL g_ecbduc_d.clear()


   INITIALIZE g_ecbcuc_m.* TO NULL             #DEFAULT 設定

   LET g_ecbcucdocno_t = NULL
   LET g_ecbcuc001_t = NULL
   LET g_ecbcuc002_t = NULL
   LET g_ecbcuc003_t = NULL


   LET g_master_insert = FALSE

   #add-point:insert段before name="insert.before"

   #end add-point

   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)
      #公用欄位新增給值
      LET g_ecbcuc_m.ecbcucownid = g_user
      LET g_ecbcuc_m.ecbcucowndp = g_dept
      LET g_ecbcuc_m.ecbcuccrtid = g_user
      LET g_ecbcuc_m.ecbcuccrtdp = g_dept
      LET g_ecbcuc_m.ecbcuccrtdt = cl_get_current()
      LET g_ecbcuc_m.ecbcucmodid = g_user
      LET g_ecbcuc_m.ecbcucmoddt = cl_get_current()
      LET g_ecbcuc_m.ecbcucstus = 'N'




      #append欄位給值


      #一般欄位給值
            LET g_ecbcuc_m.ecbcuc005 = "0"


      #add-point:單頭預設值 name="insert.default"
      LET g_ecbcuc_m.ecbcucdocdt = g_today
      LET g_ecbcuc_m.ecbcuc011 = g_today  #add by liuxuan180719
      #end add-point

      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_ecbcuc_m_t.* = g_ecbcuc_m.*
      LET g_ecbcuc_m_o.* = g_ecbcuc_m.*

      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_ecbcuc_m.ecbcucstus
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "S"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
         WHEN "Z"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")

      END CASE




      CALL csft003_input("a")

      #add-point:單頭輸入後 name="insert.after_insert"

      #end add-point

      IF INT_FLAG THEN
         LET INT_FLAG = 0
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = ''
         LET g_errparam.code = 9001
         LET g_errparam.popup = FALSE
         CALL s_transaction_end('N','0')
         CALL cl_err()
      END IF

      IF NOT g_master_insert THEN
         DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
         DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
         INITIALIZE g_ecbcuc_m.* TO NULL
         INITIALIZE g_ecbduc_d TO NULL

         #add-point:取消新增後 name="insert.cancel"

         #end add-point
         CALL csft003_show()
         CALL csft003_idx_chk()   #(ver:83)
         RETURN
      END IF

      LET INT_FLAG = 0
      #CALL g_ecbduc_d.clear()


      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE

   END WHILE

   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL csft003_set_act_visible()
   CALL csft003_set_act_no_visible()

   #將新增的資料併入搜尋條件中
   LET g_ecbcucdocno_t = g_ecbcuc_m.ecbcucdocno
   LET g_ecbcuc001_t = g_ecbcuc_m.ecbcuc001
   LET g_ecbcuc002_t = g_ecbcuc_m.ecbcuc002
   LET g_ecbcuc003_t = g_ecbcuc_m.ecbcuc003


   #組合新增資料的條件
   LET g_add_browse = " ecbcucent = " ||g_enterprise|| " AND ecbcucsite = '" ||g_site|| "' AND",
                      " ecbcucdocno = '", g_ecbcuc_m.ecbcucdocno, "' "
                      ," AND ecbcuc001 = '", g_ecbcuc_m.ecbcuc001, "' "
                      ," AND ecbcuc002 = '", g_ecbcuc_m.ecbcuc002, "' "
                      ," AND ecbcuc003 = '", g_ecbcuc_m.ecbcuc003, "' "


   #add-point:組合新增資料的條件後 name="insert.after.add_browse"

   #end add-point

   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL csft003_browser_fill("")

   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)

   CLOSE csft003_cl

   CALL csft003_idx_chk()

   #撈取異動後的資料(主要是帶出reference)
   EXECUTE csft003_master_referesh USING g_site,g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcuc001,g_ecbcuc_m.ecbcuc002,
       g_ecbcuc_m.ecbcuc003 INTO g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcucdocdt,g_ecbcuc_m.ecbcuc008,
       g_ecbcuc_m.ecbcuc003,g_ecbcuc_m.ecbcuc004,g_ecbcuc_m.ecbcuc005,g_ecbcuc_m.ecbcuc006,g_ecbcuc_m.ecbcuc002,
       g_ecbcuc_m.ecbcuc007,g_ecbcuc_m.ecbcuc011,g_ecbcuc_m.ecbcuc001,g_ecbcuc_m.ecbcucstus,g_ecbcuc_m.ecbcucownid,
       g_ecbcuc_m.ecbcucowndp,g_ecbcuc_m.ecbcuccrtid,g_ecbcuc_m.ecbcuccrtdp,g_ecbcuc_m.ecbcuccrtdt,g_ecbcuc_m.ecbcucmodid,
       g_ecbcuc_m.ecbcucmoddt,g_ecbcuc_m.ecbcuc003_desc,g_ecbcuc_m.ecbcuc006_desc,g_ecbcuc_m.ecbcuc007_desc,
       g_ecbcuc_m.ecbcucownid_desc,g_ecbcuc_m.ecbcucowndp_desc,g_ecbcuc_m.ecbcuccrtid_desc,g_ecbcuc_m.ecbcuccrtdp_desc,
       g_ecbcuc_m.ecbcucmodid_desc


   #遮罩相關處理
   LET g_ecbcuc_m_mask_o.* =  g_ecbcuc_m.*
   CALL csft003_ecbcuc_t_mask()
   LET g_ecbcuc_m_mask_n.* =  g_ecbcuc_m.*

   #將資料顯示到畫面上
   DISPLAY BY NAME g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcucdocno_desc,g_ecbcuc_m.ecbcucdocdt,g_ecbcuc_m.ecbcuc008,
       g_ecbcuc_m.ecbcuc003,g_ecbcuc_m.ecbcuc003_desc,g_ecbcuc_m.ecbcuc004,g_ecbcuc_m.ecbcuc005,g_ecbcuc_m.ecbcuc006,
       g_ecbcuc_m.ecbcuc006_desc,g_ecbcuc_m.ecbcuc002,g_ecbcuc_m.ecbcuc002_desc_1,g_ecbcuc_m.ecbcuc002_desc_5,
       g_ecbcuc_m.ecbcuc002_desc_2,g_ecbcuc_m.ecbcuc002_desc_6,g_ecbcuc_m.ecbcuc002_desc_3,g_ecbcuc_m.ecbcuc007,
       g_ecbcuc_m.ecbcuc007_desc,g_ecbcuc_m.ecbcuc002_desc_4,g_ecbcuc_m.l_sum,g_ecbcuc_m.ecbcuc011,g_ecbcuc_m.ecbcuc001,
       g_ecbcuc_m.ecbcucstus,g_ecbcuc_m.ecbcucownid,g_ecbcuc_m.ecbcucownid_desc,g_ecbcuc_m.ecbcucowndp,
       g_ecbcuc_m.ecbcucowndp_desc,g_ecbcuc_m.ecbcuccrtid,g_ecbcuc_m.ecbcuccrtid_desc,g_ecbcuc_m.ecbcuccrtdp,
       g_ecbcuc_m.ecbcuccrtdp_desc,g_ecbcuc_m.ecbcuccrtdt,g_ecbcuc_m.ecbcucmodid,g_ecbcuc_m.ecbcucmodid_desc,
       g_ecbcuc_m.ecbcucmoddt

   #add-point:新增結束後 name="insert.after"

   #end add-point

   LET g_data_owner = g_ecbcuc_m.ecbcucownid
   LET g_data_dept  = g_ecbcuc_m.ecbcucowndp

   #功能已完成,通報訊息中心
   CALL csft003_msgcentre_notify('insert')

   CALL csft003_idx_chk()   #(ver:83)

END FUNCTION

{</section>}

{<section id="csft003.modify" >}
#+ 資料修改
PRIVATE FUNCTION csft003_modify()
   #add-point:modify段define(客製用) name="modify.define_customerization"

   #end add-point
   DEFINE l_new_key    DYNAMIC ARRAY OF STRING
   DEFINE l_old_key    DYNAMIC ARRAY OF STRING
   DEFINE l_field_key  DYNAMIC ARRAY OF STRING
   DEFINE l_wc2_table1          STRING


   #add-point:modify段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"

   #end add-point

   #add-point:Function前置處理  name="modify.pre_function"

   #end add-point

   #保存單頭舊值
   LET g_ecbcuc_m_t.* = g_ecbcuc_m.*
   LET g_ecbcuc_m_o.* = g_ecbcuc_m.*

   IF g_ecbcuc_m.ecbcucdocno IS NULL
   OR g_ecbcuc_m.ecbcuc001 IS NULL
   OR g_ecbcuc_m.ecbcuc002 IS NULL
   OR g_ecbcuc_m.ecbcuc003 IS NULL

   THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ""
      LET g_errparam.code = "std-00003"
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN
   END IF

   ERROR ""

   LET g_ecbcucdocno_t = g_ecbcuc_m.ecbcucdocno
   LET g_ecbcuc001_t = g_ecbcuc_m.ecbcuc001
   LET g_ecbcuc002_t = g_ecbcuc_m.ecbcuc002
   LET g_ecbcuc003_t = g_ecbcuc_m.ecbcuc003

   CALL s_transaction_begin()

   OPEN csft003_cl USING g_enterprise, g_site,g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcuc001,g_ecbcuc_m.ecbcuc002,g_ecbcuc_m.ecbcuc003
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "OPEN csft003_cl:",SQLERRMESSAGE
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE
      CLOSE csft003_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF

   #顯示最新的資料
   EXECUTE csft003_master_referesh USING g_site,g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcuc001,g_ecbcuc_m.ecbcuc002,
       g_ecbcuc_m.ecbcuc003 INTO g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcucdocdt,g_ecbcuc_m.ecbcuc008,
       g_ecbcuc_m.ecbcuc003,g_ecbcuc_m.ecbcuc004,g_ecbcuc_m.ecbcuc005,g_ecbcuc_m.ecbcuc006,g_ecbcuc_m.ecbcuc002,
       g_ecbcuc_m.ecbcuc007,g_ecbcuc_m.ecbcuc011,g_ecbcuc_m.ecbcuc001,g_ecbcuc_m.ecbcucstus,g_ecbcuc_m.ecbcucownid,
       g_ecbcuc_m.ecbcucowndp,g_ecbcuc_m.ecbcuccrtid,g_ecbcuc_m.ecbcuccrtdp,g_ecbcuc_m.ecbcuccrtdt,g_ecbcuc_m.ecbcucmodid,
       g_ecbcuc_m.ecbcucmoddt,g_ecbcuc_m.ecbcuc003_desc,g_ecbcuc_m.ecbcuc006_desc,g_ecbcuc_m.ecbcuc007_desc,
       g_ecbcuc_m.ecbcucownid_desc,g_ecbcuc_m.ecbcucowndp_desc,g_ecbcuc_m.ecbcuccrtid_desc,g_ecbcuc_m.ecbcuccrtdp_desc,
       g_ecbcuc_m.ecbcucmodid_desc

   #檢查是否允許此動作
   IF NOT csft003_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF

   #遮罩相關處理
   LET g_ecbcuc_m_mask_o.* =  g_ecbcuc_m.*
   CALL csft003_ecbcuc_t_mask()
   LET g_ecbcuc_m_mask_n.* =  g_ecbcuc_m.*



   #add-point:modify段show之前 name="modify.before_show"

   #end add-point

   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"



   CALL csft003_show()
   #add-point:modify段show之後 name="modify.after_show"

   #end add-point

   #LET g_wc2_table1 = l_wc2_table1



   WHILE TRUE
      LET g_ecbcucdocno_t = g_ecbcuc_m.ecbcucdocno
      LET g_ecbcuc001_t = g_ecbcuc_m.ecbcuc001
      LET g_ecbcuc002_t = g_ecbcuc_m.ecbcuc002
      LET g_ecbcuc003_t = g_ecbcuc_m.ecbcuc003


      #寫入修改者/修改日期資訊(單頭)
      LET g_ecbcuc_m.ecbcucmodid = g_user
LET g_ecbcuc_m.ecbcucmoddt = cl_get_current()
LET g_ecbcuc_m.ecbcucmodid_desc = cl_get_username(g_ecbcuc_m.ecbcucmodid)

      #add-point:modify段修改前 name="modify.before_input"

      #end add-point

      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL csft003_input("u")
      LET g_loc = 'n'

      #add-point:modify段修改後 name="modify.after_input"

      #end add-point

      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE ecbcuc_t SET (ecbcucmodid,ecbcucmoddt) = (g_ecbcuc_m.ecbcucmodid,g_ecbcuc_m.ecbcucmoddt)

          WHERE ecbcucent = g_enterprise AND ecbcucsite = g_site AND ecbcucdocno = g_ecbcucdocno_t
            AND ecbcuc001 = g_ecbcuc001_t
            AND ecbcuc002 = g_ecbcuc002_t
            AND ecbcuc003 = g_ecbcuc003_t

      END IF

      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_ecbcuc_m.* = g_ecbcuc_m_t.*
         #  CALL csft003_show()   #(ver:83)
         END IF
         CALL csft003_show()   #(ver:83)
         CALL csft003_idx_chk()   #(ver:83)
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = ''
         LET g_errparam.code = 9001
         LET g_errparam.popup = FALSE
         CALL cl_err()
         RETURN
      END IF

      #若單頭key欄位有變更
      IF g_ecbcuc_m.ecbcucdocno != g_ecbcuc_m_t.ecbcucdocno
      OR g_ecbcuc_m.ecbcuc001 != g_ecbcuc_m_t.ecbcuc001
      OR g_ecbcuc_m.ecbcuc002 != g_ecbcuc_m_t.ecbcuc002
      OR g_ecbcuc_m.ecbcuc003 != g_ecbcuc_m_t.ecbcuc003

      THEN
         CALL s_transaction_begin()

         #add-point:單身fk修改前 name="modify.body.b_fk_update"

         #end add-point

         #更新單身key值
         UPDATE ecbduc_t SET ecbducdocno = g_ecbcuc_m.ecbcucdocno
                                       ,ecbduc001 = g_ecbcuc_m.ecbcuc001
                                       ,ecbduc002 = g_ecbcuc_m.ecbcuc002
                                       ,ecbduc003 = g_ecbcuc_m.ecbcuc003

          WHERE ecbducent = g_enterprise AND ecbducsite = g_site AND ecbducdocno = g_ecbcuc_m_t.ecbcucdocno
            AND ecbduc001 = g_ecbcuc_m_t.ecbcuc001
            AND ecbduc002 = g_ecbcuc_m_t.ecbcuc002
            AND ecbduc003 = g_ecbcuc_m_t.ecbcuc003


         #add-point:單身fk修改中 name="modify.body.m_fk_update"

         #end add-point

         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL
            #   LET g_errparam.extend = "ecbduc_t"
            #   LET g_errparam.code = "std-00009"
            #   LET g_errparam.popup = TRUE
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "ecbduc_t:",SQLERRMESSAGE
               LET g_errparam.code = SQLCA.SQLCODE
               LET g_errparam.popup = TRUE
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CONTINUE WHILE
         END CASE

         #add-point:單身fk修改後 name="modify.body.a_fk_update"

         #end add-point





         #UPDATE 多語言table key值


         CALL s_transaction_end('Y','0')
      END IF

      EXIT WHILE
   END WHILE

   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL csft003_set_act_visible()
   CALL csft003_set_act_no_visible()

   #組合新增資料的條件
   LET g_add_browse = " ecbcucent = " ||g_enterprise|| " AND ecbcucsite = '" ||g_site|| "' AND",
                      " ecbcucdocno = '", g_ecbcuc_m.ecbcucdocno, "' "
                      ," AND ecbcuc001 = '", g_ecbcuc_m.ecbcuc001, "' "
                      ," AND ecbcuc002 = '", g_ecbcuc_m.ecbcuc002, "' "
                      ," AND ecbcuc003 = '", g_ecbcuc_m.ecbcuc003, "' "

   #填到對應位置
   CALL csft003_browser_fill("")

   CLOSE csft003_cl

   CALL s_transaction_end('Y','0')

   #功能已完成,通報訊息中心
   CALL csft003_msgcentre_notify('modify')

   CALL csft003_idx_chk() #ver:83

END FUNCTION

{</section>}

{<section id="csft003.input" >}
#+ 資料輸入
PRIVATE FUNCTION csft003_input(p_cmd)
   #add-point:input段define(客製用) name="input.define_customerization"
   DEFINE l_sql1        STRING
   DEFINE l_success     LIKE type_t.num5
   DEFINE l_count1      LIKE type_t.num5
   DEFINE l_m           LIKE type_t.num5 #记录开窗的顺序    #C20180718-09415#3 add
   DEFINE l_count2      LIKE type_t.num5  #C20180814-09415#1 add
   #end add-point
   DEFINE  p_cmd                 LIKE type_t.chr1
   DEFINE  l_cmd_t               LIKE type_t.chr1
   DEFINE  l_cmd                 LIKE type_t.chr1
   DEFINE  l_n                   LIKE type_t.num10                #檢查重複用
   DEFINE  l_cnt                 LIKE type_t.num10                #檢查重複用
   DEFINE  l_lock_sw             LIKE type_t.chr1                #單身鎖住否
   DEFINE  l_allow_insert        LIKE type_t.num5                #可新增否
   DEFINE  l_allow_delete        LIKE type_t.num5                #可刪除否
   DEFINE  l_count               LIKE type_t.num10
   DEFINE  l_i                   LIKE type_t.num10
   DEFINE  l_ac_t                LIKE type_t.num10
   DEFINE  l_insert              BOOLEAN
   DEFINE  ls_return             STRING
   DEFINE  l_var_keys            DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys          DYNAMIC ARRAY OF STRING
   DEFINE  l_vars                DYNAMIC ARRAY OF STRING
   DEFINE  l_fields              DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak        DYNAMIC ARRAY OF STRING
   DEFINE  lb_reproduce          BOOLEAN
   DEFINE  li_reproduce          LIKE type_t.num10
   DEFINE  li_reproduce_target   LIKE type_t.num10
   DEFINE  ls_keys               DYNAMIC ARRAY OF VARCHAR(500)
   #add-point:input段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="input.define"

   #end add-point

   #add-point:Function前置處理  name="input.pre_function"

   #end add-point

   #先做狀態判定
   IF p_cmd = 'r' THEN
      LET l_cmd_t = 'r'
      LET p_cmd   = 'a'
   ELSE
      LET l_cmd_t = p_cmd
   END IF

   #將資料輸出到畫面上
   DISPLAY BY NAME g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcucdocno_desc,g_ecbcuc_m.ecbcucdocdt,g_ecbcuc_m.ecbcuc008,
       g_ecbcuc_m.ecbcuc003,g_ecbcuc_m.ecbcuc003_desc,g_ecbcuc_m.ecbcuc004,g_ecbcuc_m.ecbcuc005,g_ecbcuc_m.ecbcuc006,
       g_ecbcuc_m.ecbcuc006_desc,g_ecbcuc_m.ecbcuc002,g_ecbcuc_m.ecbcuc002_desc_1,g_ecbcuc_m.ecbcuc002_desc_5,
       g_ecbcuc_m.ecbcuc002_desc_2,g_ecbcuc_m.ecbcuc002_desc_6,g_ecbcuc_m.ecbcuc002_desc_3,g_ecbcuc_m.ecbcuc007,
       g_ecbcuc_m.ecbcuc007_desc,g_ecbcuc_m.ecbcuc002_desc_4,g_ecbcuc_m.l_sum,g_ecbcuc_m.ecbcuc011,g_ecbcuc_m.ecbcuc001,
       g_ecbcuc_m.ecbcucstus,g_ecbcuc_m.ecbcucownid,g_ecbcuc_m.ecbcucownid_desc,g_ecbcuc_m.ecbcucowndp,
       g_ecbcuc_m.ecbcucowndp_desc,g_ecbcuc_m.ecbcuccrtid,g_ecbcuc_m.ecbcuccrtid_desc,g_ecbcuc_m.ecbcuccrtdp,
       g_ecbcuc_m.ecbcuccrtdp_desc,g_ecbcuc_m.ecbcuccrtdt,g_ecbcuc_m.ecbcucmodid,g_ecbcuc_m.ecbcucmodid_desc,
       g_ecbcuc_m.ecbcucmoddt

   #ver:82
   #清空單身條件
   LET g_wc2 = " 1=1"
   LET g_wc2_table1 = " 1=1 "

   #CALL csft003_b_fill()
   #ver:82

   #切換畫面
   IF g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   END IF

   CALL cl_set_head_visible("","YES")

   LET l_insert = FALSE
   LET g_action_choice = ""

   #add-point:input段define_sql name="input.define_sql"

   #end add-point
   LET g_forupd_sql = "SELECT ecbducseq,ecbduc004,ecbduc005,ecbduc006,ecbduc008,ecbduc007 FROM ecbduc_t
       WHERE ecbducent=? AND ecbducsite=? AND ecbducdocno=? AND ecbduc001=? AND ecbduc002=? AND ecbduc003=?
       AND ecbduc004=? AND ecbduc008=? AND ecbducseq=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"

   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE csft003_bcl CURSOR FROM g_forupd_sql





   #add-point:input段define_sql name="input.other_sql"

   #end add-point

   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'

   #控制key欄位可否輸入
   CALL csft003_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"

   #end add-point
   CALL csft003_set_no_entry(p_cmd)

   DISPLAY BY NAME g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcucdocdt,g_ecbcuc_m.ecbcuc008,g_ecbcuc_m.ecbcuc003,
       g_ecbcuc_m.ecbcuc004,g_ecbcuc_m.ecbcuc005,g_ecbcuc_m.ecbcuc006,g_ecbcuc_m.ecbcuc002,g_ecbcuc_m.ecbcuc002_desc_1,
       g_ecbcuc_m.ecbcuc002_desc_5,g_ecbcuc_m.ecbcuc002_desc_2,g_ecbcuc_m.ecbcuc002_desc_6,g_ecbcuc_m.ecbcuc002_desc_3,
       g_ecbcuc_m.ecbcuc007,g_ecbcuc_m.ecbcuc002_desc_4,g_ecbcuc_m.l_sum,g_ecbcuc_m.ecbcuc011,g_ecbcuc_m.ecbcuc001,
       g_ecbcuc_m.ecbcucstus

   LET lb_reproduce = FALSE
   LET l_ac_t = 1

   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()

   #add-point:資料輸入前 name="input.before_input"

   #end add-point

   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)

{</section>}

{<section id="csft003.input.head" >}
      #單頭段
      INPUT BY NAME g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcucdocdt,g_ecbcuc_m.ecbcuc008,g_ecbcuc_m.ecbcuc003,
          g_ecbcuc_m.ecbcuc004,g_ecbcuc_m.ecbcuc005,g_ecbcuc_m.ecbcuc006,g_ecbcuc_m.ecbcuc002,g_ecbcuc_m.ecbcuc002_desc_1,
          g_ecbcuc_m.ecbcuc002_desc_5,g_ecbcuc_m.ecbcuc002_desc_2,g_ecbcuc_m.ecbcuc002_desc_6,g_ecbcuc_m.ecbcuc002_desc_3,
          g_ecbcuc_m.ecbcuc007,g_ecbcuc_m.ecbcuc002_desc_4,g_ecbcuc_m.l_sum,g_ecbcuc_m.ecbcuc011,g_ecbcuc_m.ecbcuc001,
          g_ecbcuc_m.ecbcucstus
         ATTRIBUTE(WITHOUT DEFAULTS)

         #自訂ACTION(master_input)


         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN csft003_cl USING g_enterprise, g_site,g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcuc001,g_ecbcuc_m.ecbcuc002,g_ecbcuc_m.ecbcuc003
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "OPEN csft003_cl:",SQLERRMESSAGE
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE
               CLOSE csft003_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF

            IF l_cmd_t = 'r' THEN

            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL csft003_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
            LET l_m = 1    #add by liuxuan180719
            #end add-point
            CALL csft003_set_no_entry(p_cmd)

                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcucdocno

            #add-point:AFTER FIELD ecbcucdocno name="input.a.ecbcucdocno"

            #應用 a05 樣板自動產生(Version:3)
            #確認資料無重複
            IF  NOT cl_null(g_ecbcuc_m.ecbcucdocno) AND NOT cl_null(g_ecbcuc_m.ecbcuc001) AND NOT cl_null(g_ecbcuc_m.ecbcuc002) AND NOT cl_null(g_ecbcuc_m.ecbcuc003) THEN
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_ecbcuc_m.ecbcucdocno != g_ecbcucdocno_t  OR g_ecbcuc_m.ecbcuc001 != g_ecbcuc001_t  OR g_ecbcuc_m.ecbcuc002 != g_ecbcuc002_t  OR g_ecbcuc_m.ecbcuc003 != g_ecbcuc003_t )) THEN
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM ecbcuc_t WHERE "||"ecbcucent = " ||g_enterprise|| " AND ecbcucsite = '" ||g_site|| "' AND "||"ecbcucdocno = '"||g_ecbcuc_m.ecbcucdocno ||"' AND "|| "ecbcuc001 = '"||g_ecbcuc_m.ecbcuc001 ||"' AND "|| "ecbcuc002 = '"||g_ecbcuc_m.ecbcuc002 ||"' AND "|| "ecbcuc003 = '"||g_ecbcuc_m.ecbcuc003 ||"'",'std-00004',0) THEN
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            IF NOT cl_null(g_ecbcuc_m.ecbcucdocno) THEN
               SELECT DISTINCT oobxl003 INTO g_ecbcuc_m.ecbcucdocno_desc
                 FROM oobxl_t
                WHERE oobxlent = g_enterprise
                  AND oobxl001 = g_ecbcuc_m.ecbcucdocno
                  AND oobxl002 = g_dlang

               DISPLAY g_ecbcuc_m.ecbcucdocno_desc TO ecbcucdocno_desc

            END IF


            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcucdocno
            #add-point:BEFORE FIELD ecbcucdocno name="input.b.ecbcucdocno"

            #END add-point


         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ecbcucdocno
            #add-point:ON CHANGE ecbcucdocno name="input.g.ecbcucdocno"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcucdocdt
            #add-point:BEFORE FIELD ecbcucdocdt name="input.b.ecbcucdocdt"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcucdocdt

            #add-point:AFTER FIELD ecbcucdocdt name="input.a.ecbcucdocdt"

            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ecbcucdocdt
            #add-point:ON CHANGE ecbcucdocdt name="input.g.ecbcucdocdt"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuc008
            #add-point:BEFORE FIELD ecbcuc008 name="input.b.ecbcuc008"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuc008

            #add-point:AFTER FIELD ecbcuc008 name="input.a.ecbcuc008"
            #S---#C20180814-09415#1 add
            LET l_count2 = 0
            SELECT COUNT(1) INTO l_count2
              FROM ecbduc_t
             WHERE ecbducent = g_enterprise
               AND ecbducsite = g_site
               AND ecbducdocno = g_ecbcuc_m.ecbcucdocno
            IF cl_null(l_count2) THEN LET l_count2=0 END IF
            #S---#C20180801-09415#1 add
            IF (g_ecbcuc_m.ecbcuc008 != g_ecbcuc_m_t.ecbcuc008 OR cl_null(g_ecbcuc_m_t.ecbcuc008))
            AND NOT cl_null(g_ecbcuc_m.ecbcuc008) AND l_count2 = 0 THEN
               #带值
               SELECT DISTINCT sfaa010,imaal003,imaal004,sfpb008,ecbauc004,
                               sfpb010,sfpb002,ecaa002,imaaud001,imaaud002,
                               imaa041,imaa035,sfpb006
                 INTO g_ecbcuc_m.ecbcuc002,g_ecbcuc_m.ecbcuc002_desc_1,g_ecbcuc_m.ecbcuc002_desc_2,g_ecbcuc_m.ecbcuc003,g_ecbcuc_m.ecbcuc004,
                      g_ecbcuc_m.ecbcuc005,g_ecbcuc_m.ecbcuc006,g_ecbcuc_m.ecbcuc006_desc,g_ecbcuc_m.ecbcuc002_desc_3,g_ecbcuc_m.ecbcuc002_desc_4,
                      g_ecbcuc_m.ecbcuc002_desc_5,g_ecbcuc_m.ecbcuc002_desc_6,g_ecbcuc_m.ecbcuc001
                 FROM sfpb_t
                 LEFT JOIN sfaa_t ON sfpbent = sfaaent AND sfpb006 = sfaadocno
                 LEFT JOIN imaa_t ON imaaent = sfaaent AND imaa001 = sfaa010
                 LEFT JOIN imaal_t ON sfpbent = imaalent AND sfaa010 = imaal001 AND imaal002 = g_dlang
                 LEFT JOIN ecbauc_t ON sfpbent = ecbaucent AND sfpbsite = ecbaucsite AND sfaa010 = ecbauc001 AND sfpb008 = ecbauc002
                 LEFT JOIN ecaa_t ON sfpbent = ecaaent AND sfpbsite = ecaasite AND sfpb002 = ecaa001
                WHERE sfpbent = g_enterprise
                  AND sfpbsite = g_site
                  AND sfpb003 = g_ecbcuc_m.ecbcuc008
               DISPLAY BY NAME g_ecbcuc_m.ecbcuc002,g_ecbcuc_m.ecbcuc002_desc_1,g_ecbcuc_m.ecbcuc002_desc_2,g_ecbcuc_m.ecbcuc003,g_ecbcuc_m.ecbcuc004,
                               g_ecbcuc_m.ecbcuc005,g_ecbcuc_m.ecbcuc006,g_ecbcuc_m.ecbcuc006_desc,g_ecbcuc_m.ecbcuc002_desc_3,g_ecbcuc_m.ecbcuc002_desc_4,
                               g_ecbcuc_m.ecbcuc002_desc_5,g_ecbcuc_m.ecbcuc002_desc_6,g_ecbcuc_m.ecbcuc001
            #E---#C20180814-09415#1 add
#            IF NOT cl_null(g_ecbcuc_m.ecbcuc008)  THEN   #C20180814-09415#1 mark
               IF NOT cl_null(g_ecbcuc_m.ecbcuc003) THEN
                  LET l_count1 = 0
                  SELECT COUNT(1) INTO l_count1
                    FROM ecbcuc_t
                   WHERE ecbcucent = g_enterprise
                     AND ecbcuc008 = g_ecbcuc_m.ecbcuc008
                     AND ecbcuc003 = g_ecbcuc_m.ecbcuc003
                  IF l_count1 > 0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = "任务单号+作业编号已存在请重新输入！"
                     LET g_errparam.code = "!"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_ecbcuc_m.ecbcuc008 = g_ecbcuc_m_t.ecbcuc008  #C20180814-09415#1 add
                     NEXT FIELD ecbcuc008
                  END IF
               ELSE
                  LET l_count1 = 0
                  SELECT count(1) INTO l_count1
                    FROM sfpb_t
                   WHERE sfpbent = g_enterprise
                     AND sfpbsite = g_site
                     AND sfpb003 = g_ecbcuc_m.ecbcuc008
                  IF cl_null(l_count1) OR l_count1 = 0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = "任务单号不存在请重新输入！"
                     LET g_errparam.code = "!"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_ecbcuc_m.ecbcuc008 = g_ecbcuc_m_t.ecbcuc008  #C20180814-09415#1 add
                     NEXT FIELD ecbcuc008
                  END IF
                  LET l_count1 = 0
                  SELECT COUNT(1) INTO l_count1
                    FROM ecbcuc_t
                   WHERE ecbcucent = g_enterprise
                     AND ecbcuc008 = g_ecbcuc_m.ecbcuc008
                  IF l_count1 > 0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = "任务单号已存在请重新输入！"
                     LET g_errparam.code = "!"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_ecbcuc_m.ecbcuc008 = g_ecbcuc_m_t.ecbcuc008  #C20180814-09415#1 add
                     NEXT FIELD ecbcuc008
                  END IF
               END IF

            END IF

            IF p_cmd = 'u' AND l_count2 = 0 THEN
               #自动生成单身
               IF NOT cl_null(g_ecbcuc_m.ecbcuc001) THEN
                  CALL s_transaction_begin()
                  CALL csft003_ins_ecbduc(g_ecbcuc_m.ecbcuc002,g_ecbcuc_m.ecbcuc003) RETURNING l_success
                  IF NOT l_success THEN
                     CALL s_transaction_end('N','0')
                  ELSE
                     CALL s_transaction_end('Y','0')
                     CALL csft003_b_fill()
                     LET l_ac = 1
                     CALL csft003_input('u')
                  END IF
               END IF
            END IF

            #E---#C20180801-09415#1 add
            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ecbcuc008
            #add-point:ON CHANGE ecbcuc008 name="input.g.ecbcuc008"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuc003

            #add-point:AFTER FIELD ecbcuc003 name="input.a.ecbcuc003"

            #應用 a05 樣板自動產生(Version:3)
            #確認資料無重複
            IF  NOT cl_null(g_ecbcuc_m.ecbcucdocno) AND NOT cl_null(g_ecbcuc_m.ecbcuc001) AND NOT cl_null(g_ecbcuc_m.ecbcuc002) AND NOT cl_null(g_ecbcuc_m.ecbcuc003) THEN
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_ecbcuc_m.ecbcucdocno != g_ecbcucdocno_t  OR g_ecbcuc_m.ecbcuc001 != g_ecbcuc001_t  OR g_ecbcuc_m.ecbcuc002 != g_ecbcuc002_t  OR g_ecbcuc_m.ecbcuc003 != g_ecbcuc003_t )) THEN
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM ecbcuc_t WHERE "||"ecbcucent = " ||g_enterprise|| " AND ecbcucsite = '" ||g_site|| "' AND "||"ecbcucdocno = '"||g_ecbcuc_m.ecbcucdocno ||"' AND "|| "ecbcuc001 = '"||g_ecbcuc_m.ecbcuc001 ||"' AND "|| "ecbcuc002 = '"||g_ecbcuc_m.ecbcuc002 ||"' AND "|| "ecbcuc003 = '"||g_ecbcuc_m.ecbcuc003 ||"'",'std-00004',0) THEN
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
         #S---#C20180531-09415#1 add by zhaoqn
            IF NOT cl_null(g_ecbcuc_m.ecbcuc001) THEN
               LET l_count1 = 0
               SELECT COUNT (1) INTO l_count1
                 FROM ecbcuc_t
                WHERE ecbcucent = g_enterprise
                  AND ecbcuc001 = g_ecbcuc_m.ecbcuc001
                  AND ecbcuc003 = g_ecbcuc_m.ecbcuc003
               IF l_count1 > 0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = "工单单号+作业编号已存在请重新输入！"
                  LET g_errparam.code = "!"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  NEXT FIELD ecbcuc003
               END IF
            END IF
         #E---#C20180531-09415#1 add by zhaoqn


            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuc003
            #add-point:BEFORE FIELD ecbcuc003 name="input.b.ecbcuc003"

            #END add-point


         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ecbcuc003
            #add-point:ON CHANGE ecbcuc003 name="input.g.ecbcuc003"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuc004
            #add-point:BEFORE FIELD ecbcuc004 name="input.b.ecbcuc004"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuc004

            #add-point:AFTER FIELD ecbcuc004 name="input.a.ecbcuc004"


            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ecbcuc004
            #add-point:ON CHANGE ecbcuc004 name="input.g.ecbcuc004"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuc005
            #add-point:BEFORE FIELD ecbcuc005 name="input.b.ecbcuc005"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuc005

            #add-point:AFTER FIELD ecbcuc005 name="input.a.ecbcuc005"


            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ecbcuc005
            #add-point:ON CHANGE ecbcuc005 name="input.g.ecbcuc005"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuc006

            #add-point:AFTER FIELD ecbcuc006 name="input.a.ecbcuc006"


            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuc006
            #add-point:BEFORE FIELD ecbcuc006 name="input.b.ecbcuc006"

            #END add-point


         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ecbcuc006
            #add-point:ON CHANGE ecbcuc006 name="input.g.ecbcuc006"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuc002
            #add-point:BEFORE FIELD ecbcuc002 name="input.b.ecbcuc002"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuc002

            #add-point:AFTER FIELD ecbcuc002 name="input.a.ecbcuc002"
            #應用 a05 樣板自動產生(Version:3)
            #確認資料無重複
            IF  NOT cl_null(g_ecbcuc_m.ecbcucdocno) AND NOT cl_null(g_ecbcuc_m.ecbcuc001) AND NOT cl_null(g_ecbcuc_m.ecbcuc002) AND NOT cl_null(g_ecbcuc_m.ecbcuc003) THEN
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_ecbcuc_m.ecbcucdocno != g_ecbcucdocno_t  OR g_ecbcuc_m.ecbcuc001 != g_ecbcuc001_t  OR g_ecbcuc_m.ecbcuc002 != g_ecbcuc002_t  OR g_ecbcuc_m.ecbcuc003 != g_ecbcuc003_t )) THEN
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM ecbcuc_t WHERE "||"ecbcucent = " ||g_enterprise|| " AND ecbcucsite = '" ||g_site|| "' AND "||"ecbcucdocno = '"||g_ecbcuc_m.ecbcucdocno ||"' AND "|| "ecbcuc001 = '"||g_ecbcuc_m.ecbcuc001 ||"' AND "|| "ecbcuc002 = '"||g_ecbcuc_m.ecbcuc002 ||"' AND "|| "ecbcuc003 = '"||g_ecbcuc_m.ecbcuc003 ||"'",'std-00004',0) THEN
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF




            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ecbcuc002
            #add-point:ON CHANGE ecbcuc002 name="input.g.ecbcuc002"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuc002_desc_1
            #add-point:BEFORE FIELD ecbcuc002_desc_1 name="input.b.ecbcuc002_desc_1"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuc002_desc_1

            #add-point:AFTER FIELD ecbcuc002_desc_1 name="input.a.ecbcuc002_desc_1"

            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ecbcuc002_desc_1
            #add-point:ON CHANGE ecbcuc002_desc_1 name="input.g.ecbcuc002_desc_1"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuc002_desc_5
            #add-point:BEFORE FIELD ecbcuc002_desc_5 name="input.b.ecbcuc002_desc_5"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuc002_desc_5

            #add-point:AFTER FIELD ecbcuc002_desc_5 name="input.a.ecbcuc002_desc_5"

            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ecbcuc002_desc_5
            #add-point:ON CHANGE ecbcuc002_desc_5 name="input.g.ecbcuc002_desc_5"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuc002_desc_2
            #add-point:BEFORE FIELD ecbcuc002_desc_2 name="input.b.ecbcuc002_desc_2"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuc002_desc_2

            #add-point:AFTER FIELD ecbcuc002_desc_2 name="input.a.ecbcuc002_desc_2"

            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ecbcuc002_desc_2
            #add-point:ON CHANGE ecbcuc002_desc_2 name="input.g.ecbcuc002_desc_2"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuc002_desc_6
            #add-point:BEFORE FIELD ecbcuc002_desc_6 name="input.b.ecbcuc002_desc_6"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuc002_desc_6

            #add-point:AFTER FIELD ecbcuc002_desc_6 name="input.a.ecbcuc002_desc_6"

            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ecbcuc002_desc_6
            #add-point:ON CHANGE ecbcuc002_desc_6 name="input.g.ecbcuc002_desc_6"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuc002_desc_3
            #add-point:BEFORE FIELD ecbcuc002_desc_3 name="input.b.ecbcuc002_desc_3"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuc002_desc_3

            #add-point:AFTER FIELD ecbcuc002_desc_3 name="input.a.ecbcuc002_desc_3"

            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ecbcuc002_desc_3
            #add-point:ON CHANGE ecbcuc002_desc_3 name="input.g.ecbcuc002_desc_3"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuc007

            #add-point:AFTER FIELD ecbcuc007 name="input.a.ecbcuc007"
            IF NOT cl_null(g_ecbcuc_m.ecbcuc007) THEN
#應用 a17 樣板自動產生(Version:3)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL

               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_ecbcuc_m.ecbcuc007


               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_ooag001") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF



            END IF
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_ecbcuc_m.ecbcuc007
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent="||g_enterprise||" AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_ecbcuc_m.ecbcuc007_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_ecbcuc_m.ecbcuc007_desc


            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuc007
            #add-point:BEFORE FIELD ecbcuc007 name="input.b.ecbcuc007"

            #END add-point


         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ecbcuc007
            #add-point:ON CHANGE ecbcuc007 name="input.g.ecbcuc007"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuc002_desc_4
            #add-point:BEFORE FIELD ecbcuc002_desc_4 name="input.b.ecbcuc002_desc_4"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuc002_desc_4

            #add-point:AFTER FIELD ecbcuc002_desc_4 name="input.a.ecbcuc002_desc_4"

            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ecbcuc002_desc_4
            #add-point:ON CHANGE ecbcuc002_desc_4 name="input.g.ecbcuc002_desc_4"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_sum
            #add-point:BEFORE FIELD l_sum name="input.b.l_sum"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_sum

            #add-point:AFTER FIELD l_sum name="input.a.l_sum"

            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_sum
            #add-point:ON CHANGE l_sum name="input.g.l_sum"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuc011
            #add-point:BEFORE FIELD ecbcuc011 name="input.b.ecbcuc011"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuc011

            #add-point:AFTER FIELD ecbcuc011 name="input.a.ecbcuc011"

            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ecbcuc011
            #add-point:ON CHANGE ecbcuc011 name="input.g.ecbcuc011"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcuc001
            #add-point:BEFORE FIELD ecbcuc001 name="input.b.ecbcuc001"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcuc001

            #add-point:AFTER FIELD ecbcuc001 name="input.a.ecbcuc001"

            #應用 a05 樣板自動產生(Version:3)
            #確認資料無重複
            IF  NOT cl_null(g_ecbcuc_m.ecbcucdocno) AND NOT cl_null(g_ecbcuc_m.ecbcuc001) AND NOT cl_null(g_ecbcuc_m.ecbcuc002) AND NOT cl_null(g_ecbcuc_m.ecbcuc003) THEN
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_ecbcuc_m.ecbcucdocno != g_ecbcucdocno_t  OR g_ecbcuc_m.ecbcuc001 != g_ecbcuc001_t  OR g_ecbcuc_m.ecbcuc002 != g_ecbcuc002_t  OR g_ecbcuc_m.ecbcuc003 != g_ecbcuc003_t )) THEN
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM ecbcuc_t WHERE "||"ecbcucent = " ||g_enterprise|| " AND ecbcucsite = '" ||g_site|| "' AND "||"ecbcucdocno = '"||g_ecbcuc_m.ecbcucdocno ||"' AND "|| "ecbcuc001 = '"||g_ecbcuc_m.ecbcuc001 ||"' AND "|| "ecbcuc002 = '"||g_ecbcuc_m.ecbcuc002 ||"' AND "|| "ecbcuc003 = '"||g_ecbcuc_m.ecbcuc003 ||"'",'std-00004',0) THEN
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
         #S---#C20180531-09415#1 add by zhaoqn
            IF g_ecbcuc_m.ecbcuc001 != g_ecbcuc001_t AND NOT cl_null(g_ecbcuc_m.ecbcuc001) THEN
               IF NOT cl_null(g_ecbcuc_m.ecbcuc003) THEN
                  LET l_count1 = 0
                  SELECT COUNT(1) INTO l_count1
                    FROM ecbcuc_t
                   WHERE ecbcucent = g_enterprise
                     AND ecbcuc001 = g_ecbcuc_m.ecbcuc001
                     AND ecbcuc003 = g_ecbcuc_m.ecbcuc003
                  IF l_count1 > 0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = "工单单号+作业编号已存在请重新输入！"
                     LET g_errparam.code = "!"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     NEXT FIELD ecbcuc001
                  END IF
               ELSE
                  LET l_count1 = 0
                  SELECT COUNT(1) INTO l_count1
                    FROM ecbcuc_t
                   WHERE ecbcucent = g_enterprise
                     AND ecbcuc001 = g_ecbcuc_m.ecbcuc001
                  IF l_count1 > 0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = "工单单号已存在请重新输入！"
                     LET g_errparam.code = "!"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     NEXT FIELD ecbcuc001
                  END IF
               END IF
            END IF
         #E---#C20180531-09415#1 add by zhaoqn
            IF NOT cl_null(g_ecbcuc_m.ecbcuc001) THEN
               #带值
               SELECT DISTINCT sfaa010,imaal003,imaal004,sfpb008,ecbauc004,
                               sfpb010,sfpb002,ecaa002,imaaud001,imaaud002,
                               imaa041,imaa035
                 INTO g_ecbcuc_m.ecbcuc002,g_ecbcuc_m.ecbcuc002_desc_1,g_ecbcuc_m.ecbcuc002_desc_2,g_ecbcuc_m.ecbcuc003,g_ecbcuc_m.ecbcuc004,
                      g_ecbcuc_m.ecbcuc005,g_ecbcuc_m.ecbcuc006,g_ecbcuc_m.ecbcuc006_desc,g_ecbcuc_m.ecbcuc002_desc_3,g_ecbcuc_m.ecbcuc002_desc_4,
                      g_ecbcuc_m.ecbcuc002_desc_5,g_ecbcuc_m.ecbcuc002_desc_6
                 FROM sfpb_t
                 LEFT JOIN sfaa_t ON sfpbent = sfaaent AND sfpb006 = sfaadocno
                 LEFT JOIN imaa_t ON imaaent = sfaaent AND imaa001 = sfaa010
                 LEFT JOIN imaal_t ON sfpbent = imaalent AND sfaa010 = imaal001 AND imaal002 = g_dlang
                 LEFT JOIN ecbauc_t ON sfpbent = ecbaucent AND sfpbsite = ecbaucsite AND sfaa010 = ecbauc001 AND sfpb008 = ecbauc002
                 LEFT JOIN ecaa_t ON sfpbent = ecaaent AND sfpbsite = ecaasite AND sfpb002 = ecaa001
                WHERE sfpbent = g_enterprise
                  AND sfpbsite = g_site
                  AND sfpb006 = g_ecbcuc_m.ecbcuc001
               DISPLAY BY NAME g_ecbcuc_m.ecbcuc002,g_ecbcuc_m.ecbcuc002_desc_1,g_ecbcuc_m.ecbcuc002_desc_2,g_ecbcuc_m.ecbcuc003,g_ecbcuc_m.ecbcuc004,
                               g_ecbcuc_m.ecbcuc005,g_ecbcuc_m.ecbcuc006,g_ecbcuc_m.ecbcuc006_desc,g_ecbcuc_m.ecbcuc002_desc_3,g_ecbcuc_m.ecbcuc002_desc_4,
                               g_ecbcuc_m.ecbcuc002_desc_5,g_ecbcuc_m.ecbcuc002_desc_6
            END IF

            LET l_count1 = 0
            SELECT COUNT(1) INTO l_count1
              FROM ecbduc_t
             WHERE ecbducent = g_enterprise
               AND ecbducsite = g_site
               AND ecbducdocno = g_ecbcuc_m.ecbcucdocno
            IF p_cmd = 'u' AND l_count1 = 0 THEN
               #自动生成单身
               IF NOT cl_null(g_ecbcuc_m.ecbcuc001) THEN
                  CALL s_transaction_begin()
                  CALL csft003_ins_ecbduc(g_ecbcuc_m.ecbcuc002,g_ecbcuc_m.ecbcuc003) RETURNING l_success
                  IF NOT l_success THEN
                     CALL s_transaction_end('N','0')
                  ELSE
                     CALL s_transaction_end('Y','0')
                     CALL csft003_b_fill()
                     LET l_ac = 1
                     CALL csft003_input('u')
                  END IF
               END IF
            END IF

            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ecbcuc001
            #add-point:ON CHANGE ecbcuc001 name="input.g.ecbcuc001"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbcucstus
            #add-point:BEFORE FIELD ecbcucstus name="input.b.ecbcucstus"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbcucstus

            #add-point:AFTER FIELD ecbcucstus name="input.a.ecbcucstus"

            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ecbcucstus
            #add-point:ON CHANGE ecbcucstus name="input.g.ecbcucstus"

            #END add-point


 #欄位檢查
                  #Ctrlp:input.c.ecbcucdocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcucdocno
            #add-point:ON ACTION controlp INFIELD ecbcucdocno name="input.c.ecbcucdocno"
            #應用 a07 樣板自動產生(Version:3)
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_ecbcuc_m.ecbcucdocno             #給予default值
            #单别参照表号
            LET g_ooef004 = ''
            SELECT ooef004 INTO g_ooef004
              FROM ooef_t
             WHERE ooefent = g_enterprise
               AND ooef001 = g_site
            LET g_qryparam.arg1 = g_ooef004 #參照表編號
            LET g_qryparam.arg2 = g_prog    #作业代号

            #160711-00040#40 add by wanghaoz 2017/08/31--(s)
            CALL s_control_get_docno_sql(g_user,g_dept)
                 RETURNING l_success,l_sql1
            IF NOT cl_null(l_sql1) THEN
               IF NOT cl_null(g_qryparam.where) THEN
                  LET g_qryparam.where = g_qryparam.where, l_sql1
               ELSE
                  LET g_qryparam.where = l_sql1
               END IF
            END IF
            #160711-00040#40 add by wanghaoz 2017/08/31--(e)

            CALL q_ooba002_6()
            LET g_ecbcuc_m.ecbcucdocno = g_qryparam.return1

            SELECT DISTINCT oobxl003 INTO g_ecbcuc_m.ecbcucdocno_desc
              FROM oobxl_t
             WHERE oobxlent = g_enterprise
               AND oobxl001 = g_ecbcuc_m.ecbcucdocno
               AND oobxl002 = g_dlang

            DISPLAY g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcucdocno_desc TO ecbcucdocno,ecbcucdocno_desc

            NEXT FIELD ecbcucdocno


            #END add-point


         #Ctrlp:input.c.ecbcucdocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcucdocdt
            #add-point:ON ACTION controlp INFIELD ecbcucdocdt name="input.c.ecbcucdocdt"

            #END add-point


         #Ctrlp:input.c.ecbcuc008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuc008
            #add-point:ON ACTION controlp INFIELD ecbcuc008 name="input.c.ecbcuc008"
            #應用 a07 樣板自動產生(Version:3)
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            #S---#C20180816-09415#1 mark
#            LET g_qryparam.default1 = g_ecbcuc_m.ecbcuc001             #給予default值
#            LET g_qryparam.default2 = g_ecbcuc_m.ecbcuc002 #生产料号
#            LET g_qryparam.default3 = g_ecbcuc_m.ecbcuc003 #作业编号
#            LET g_qryparam.default4 = g_ecbcuc_m.ecbcuc004 #页码
#            LET g_qryparam.default5 = g_ecbcuc_m.ecbcuc005 #派工数量
#            LET g_qryparam.default6 = g_ecbcuc_m.ecbcuc006 #工作站
#            LET g_qryparam.default7 = g_ecbcuc_m.ecbcuc006_desc #工作站说明
            #E---#C20180816-09415#1 mark
            LET g_qryparam.default9 = g_ecbcuc_m.ecbcuc008 #生产任务单号

            #給予arg
            LET g_qryparam.arg1 = "" #
            LET g_qryparam.where = "(sfpb006,sfpb008) NOT IN (SELECT ecbcuc001,ecbcuc003 FROM ecbcuc_t WHERE ecbcucent = ",g_enterprise," AND ecbcucsite = '",g_site,"')"

            CALL cq_sfpb006()                                #呼叫開窗

            #S---#C20180816-09415#1 mark
#            LET g_ecbcuc_m.ecbcuc001 = g_qryparam.return1
#            LET g_ecbcuc_m.ecbcuc002 = g_qryparam.return2
#            LET g_ecbcuc_m.ecbcuc003 = g_qryparam.return3
#            LET g_ecbcuc_m.ecbcuc004 = g_qryparam.return4
#            LET g_ecbcuc_m.ecbcuc005 = g_qryparam.return5
#            LET g_ecbcuc_m.ecbcuc006 = g_qryparam.return6
#            LET g_ecbcuc_m.ecbcuc006_desc = g_qryparam.return7
            #E---#C20180816-09415#1 mark
            LET g_ecbcuc_m.ecbcuc008 = g_qryparam.return9

            #品名,规格,颜色，材质，图号，老物料代码
            SELECT imaal003,imaal004,imaaud001,imaaud002,imaa041,imaa035
              INTO g_ecbcuc_m.ecbcuc002_desc_1,g_ecbcuc_m.ecbcuc002_desc_2,g_ecbcuc_m.ecbcuc002_desc_3,g_ecbcuc_m.ecbcuc002_desc_4,g_ecbcuc_m.ecbcuc002_desc_5,g_ecbcuc_m.ecbcuc002_desc_6
              FROM imaa_t
              LEFT JOIN imaal_t ON imaaent = imaalent AND imaa001 = imaal001 AND imaal002 = g_dlang
             WHERE imaaent = g_enterprise
               AND imaa001 = g_ecbcuc_m.ecbcuc002
            #作业编号说明
            SELECT oocql004 INTO g_ecbcuc_m.ecbcuc003_desc
              FROM oocql_t
             WHERE oocqlent = g_enterprise
               AND oocql001 = '221'
               AND oocql002 = g_ecbcuc_m.ecbcuc003

            DISPLAY g_ecbcuc_m.ecbcuc001 TO ecbcuc001 #工單單號
            DISPLAY g_ecbcuc_m.ecbcuc002 TO ecbcuc002 #生产料号
            DISPLAY g_ecbcuc_m.ecbcuc002_desc_1 TO ecbcuc002_desc_1 #品名
            DISPLAY g_ecbcuc_m.ecbcuc002_desc_2 TO ecbcuc002_desc_2 #規格
            DISPLAY g_ecbcuc_m.ecbcuc003 TO ecbcuc003 #作业编号
            DISPLAY g_ecbcuc_m.ecbcuc004 TO ecbcuc004 #页码
            DISPLAY g_ecbcuc_m.ecbcuc005 TO ecbcuc005 #派工数量
            DISPLAY g_ecbcuc_m.ecbcuc006 TO ecbcuc006 #工作站
            DISPLAY g_ecbcuc_m.ecbcuc006_desc TO ecbcuc006_desc #工作站说明    #C20180718-09415#1 add
            DISPLAY BY NAME g_ecbcuc_m.ecbcuc002_desc_3,g_ecbcuc_m.ecbcuc002_desc_4,g_ecbcuc_m.ecbcuc002_desc_5,
                            g_ecbcuc_m.ecbcuc002_desc_6,g_ecbcuc_m.ecbcuc003_desc
            NEXT FIELD ecbcuc008                          #返回原欄位



            #END add-point


         #Ctrlp:input.c.ecbcuc003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuc003
            #add-point:ON ACTION controlp INFIELD ecbcuc003 name="input.c.ecbcuc003"

            #END add-point


         #Ctrlp:input.c.ecbcuc004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuc004
            #add-point:ON ACTION controlp INFIELD ecbcuc004 name="input.c.ecbcuc004"

            #END add-point


         #Ctrlp:input.c.ecbcuc005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuc005
            #add-point:ON ACTION controlp INFIELD ecbcuc005 name="input.c.ecbcuc005"

            #END add-point


         #Ctrlp:input.c.ecbcuc006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuc006
            #add-point:ON ACTION controlp INFIELD ecbcuc006 name="input.c.ecbcuc006"

            #END add-point


         #Ctrlp:input.c.ecbcuc002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuc002
            #add-point:ON ACTION controlp INFIELD ecbcuc002 name="input.c.ecbcuc002"

            #END add-point


         #Ctrlp:input.c.ecbcuc002_desc_1
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuc002_desc_1
            #add-point:ON ACTION controlp INFIELD ecbcuc002_desc_1 name="input.c.ecbcuc002_desc_1"

            #END add-point


         #Ctrlp:input.c.ecbcuc002_desc_5
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuc002_desc_5
            #add-point:ON ACTION controlp INFIELD ecbcuc002_desc_5 name="input.c.ecbcuc002_desc_5"

            #END add-point


         #Ctrlp:input.c.ecbcuc002_desc_2
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuc002_desc_2
            #add-point:ON ACTION controlp INFIELD ecbcuc002_desc_2 name="input.c.ecbcuc002_desc_2"

            #END add-point


         #Ctrlp:input.c.ecbcuc002_desc_6
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuc002_desc_6
            #add-point:ON ACTION controlp INFIELD ecbcuc002_desc_6 name="input.c.ecbcuc002_desc_6"

            #END add-point


         #Ctrlp:input.c.ecbcuc002_desc_3
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuc002_desc_3
            #add-point:ON ACTION controlp INFIELD ecbcuc002_desc_3 name="input.c.ecbcuc002_desc_3"

            #END add-point


         #Ctrlp:input.c.ecbcuc007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuc007
            #add-point:ON ACTION controlp INFIELD ecbcuc007 name="input.c.ecbcuc007"
            #應用 a07 樣板自動產生(Version:3)
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_ecbcuc_m.ecbcuc007             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s

            #S---add by liuxuan180719
            IF cl_null(l_m) OR l_m = 1 THEN
               LET g_qryparam.where = "ooag003 = (select ooag003 FROM ooag_t WHERE ooagent= ",g_enterprise," AND ooag001 = '",g_user,"')"
               LET l_m = l_m + 1
            END IF
            #E---add by liuxuan180719

#            CALL q_ooag001_4()                                #呼叫開窗    #mark by liuxuan180719
            CALL cq_ooag001_4()     #add by liuxuan180719

            LET g_ecbcuc_m.ecbcuc007 = g_qryparam.return1

            DISPLAY g_ecbcuc_m.ecbcuc007 TO ecbcuc007              #

            NEXT FIELD ecbcuc007                          #返回原欄位



            #END add-point


         #Ctrlp:input.c.ecbcuc002_desc_4
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuc002_desc_4
            #add-point:ON ACTION controlp INFIELD ecbcuc002_desc_4 name="input.c.ecbcuc002_desc_4"

            #END add-point


         #Ctrlp:input.c.l_sum
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_sum
            #add-point:ON ACTION controlp INFIELD l_sum name="input.c.l_sum"

            #END add-point


         #Ctrlp:input.c.ecbcuc011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuc011
            #add-point:ON ACTION controlp INFIELD ecbcuc011 name="input.c.ecbcuc011"

            #END add-point


         #Ctrlp:input.c.ecbcuc001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcuc001
            #add-point:ON ACTION controlp INFIELD ecbcuc001 name="input.c.ecbcuc001"
            #應用 a07 樣板自動產生(Version:3)
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_ecbcuc_m.ecbcuc001             #給予default值
            LET g_qryparam.default2 = g_ecbcuc_m.ecbcuc002 #生产料号
            LET g_qryparam.default3 = g_ecbcuc_m.ecbcuc003 #作业编号
            LET g_qryparam.default4 = g_ecbcuc_m.ecbcuc004 #页码
            LET g_qryparam.default5 = g_ecbcuc_m.ecbcuc005 #派工数量
            LET g_qryparam.default6 = g_ecbcuc_m.ecbcuc006 #工作站
            LET g_qryparam.default7 = g_ecbcuc_m.ecbcuc006_desc #工作站说明  #C20180718-09415#1 add
            #給予arg
            LET g_qryparam.arg1 = "" #
            LET g_qryparam.where = "(sfpb006,sfpb008) NOT IN (SELECT ecbcuc001,ecbcuc003 FROM ecbcuc_t WHERE ecbcucent = ",g_enterprise," AND ecbcucsite = '",g_site,"')"    #C20180531-09415#1 add by zhaoqn

            CALL cq_sfpb006()                                #呼叫開窗

            LET g_ecbcuc_m.ecbcuc001 = g_qryparam.return1
            LET g_ecbcuc_m.ecbcuc002 = g_qryparam.return2
            LET g_ecbcuc_m.ecbcuc003 = g_qryparam.return3
            LET g_ecbcuc_m.ecbcuc004 = g_qryparam.return4
            LET g_ecbcuc_m.ecbcuc005 = g_qryparam.return5
            LET g_ecbcuc_m.ecbcuc006 = g_qryparam.return6
            LET g_ecbcuc_m.ecbcuc006_desc = g_qryparam.return7    #C20180718-09415#1 add

            #品名,规格,颜色，材质，图号，老物料代码
            SELECT imaal003,imaal004,imaaud001,imaaud002,imaa041,imaa035
              INTO g_ecbcuc_m.ecbcuc002_desc_1,g_ecbcuc_m.ecbcuc002_desc_2,g_ecbcuc_m.ecbcuc002_desc_3,g_ecbcuc_m.ecbcuc002_desc_4,g_ecbcuc_m.ecbcuc002_desc_5,g_ecbcuc_m.ecbcuc002_desc_6
              FROM imaa_t
              LEFT JOIN imaal_t ON imaaent = imaalent AND imaa001 = imaal001 AND imaal002 = g_dlang
             WHERE imaaent = g_enterprise
               AND imaa001 = g_ecbcuc_m.ecbcuc002
            #作业编号说明
            SELECT oocql004 INTO g_ecbcuc_m.ecbcuc003_desc
              FROM oocql_t
             WHERE oocqlent = g_enterprise
               AND oocql001 = '221'
               AND oocql002 = g_ecbcuc_m.ecbcuc003

            DISPLAY g_ecbcuc_m.ecbcuc001 TO ecbcuc001 #工單單號
            DISPLAY g_ecbcuc_m.ecbcuc002 TO ecbcuc002 #生产料号
            DISPLAY g_ecbcuc_m.ecbcuc002_desc_1 TO ecbcuc002_desc_1 #品名
            DISPLAY g_ecbcuc_m.ecbcuc002_desc_2 TO ecbcuc002_desc_2 #規格
            DISPLAY g_ecbcuc_m.ecbcuc003 TO ecbcuc003 #作业编号
            DISPLAY g_ecbcuc_m.ecbcuc004 TO ecbcuc004 #页码
            DISPLAY g_ecbcuc_m.ecbcuc005 TO ecbcuc005 #派工数量
            DISPLAY g_ecbcuc_m.ecbcuc006 TO ecbcuc006 #工作站
            DISPLAY g_ecbcuc_m.ecbcuc006_desc TO ecbcuc006_desc #工作站说明    #C20180718-09415#1 add
            DISPLAY BY NAME g_ecbcuc_m.ecbcuc002_desc_3,g_ecbcuc_m.ecbcuc002_desc_4,g_ecbcuc_m.ecbcuc002_desc_5,
                            g_ecbcuc_m.ecbcuc002_desc_6,g_ecbcuc_m.ecbcuc003_desc
            NEXT FIELD ecbcuc001                          #返回原欄位



            #END add-point


         #Ctrlp:input.c.ecbcucstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbcucstus
            #add-point:ON ACTION controlp INFIELD ecbcucstus name="input.c.ecbcucstus"

            #END add-point


 #欄位開窗

         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF

            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcuc001,g_ecbcuc_m.ecbcuc002,g_ecbcuc_m.ecbcuc003


            #add-point:單頭INPUT後 name="input.head.after_input"

            #end add-point

            IF p_cmd <> 'u' THEN

               CALL s_transaction_begin()

               #add-point:單頭新增前 name="input.head.b_insert"
               CALL s_aooi200_gen_docno(g_site,g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcucdocdt,g_prog)
                  RETURNING l_success,g_ecbcuc_m.ecbcucdocno
               IF NOT l_success THEN
                  NEXT FIELD ecbcucdocno
               END IF
               #end add-point

               INSERT INTO ecbcuc_t (ecbcucent, ecbcucsite,ecbcucdocno,ecbcucdocdt,ecbcuc008,ecbcuc003,
                   ecbcuc004,ecbcuc005,ecbcuc006,ecbcuc002,ecbcuc007,ecbcuc011,ecbcuc001,ecbcucstus,
                   ecbcucownid,ecbcucowndp,ecbcuccrtid,ecbcuccrtdp,ecbcuccrtdt,ecbcucmodid,ecbcucmoddt)

               VALUES (g_enterprise, g_site,g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcucdocdt,g_ecbcuc_m.ecbcuc008,
                   g_ecbcuc_m.ecbcuc003,g_ecbcuc_m.ecbcuc004,g_ecbcuc_m.ecbcuc005,g_ecbcuc_m.ecbcuc006,
                   g_ecbcuc_m.ecbcuc002,g_ecbcuc_m.ecbcuc007,g_ecbcuc_m.ecbcuc011,g_ecbcuc_m.ecbcuc001,
                   g_ecbcuc_m.ecbcucstus,g_ecbcuc_m.ecbcucownid,g_ecbcuc_m.ecbcucowndp,g_ecbcuc_m.ecbcuccrtid,
                   g_ecbcuc_m.ecbcuccrtdp,g_ecbcuc_m.ecbcuccrtdt,g_ecbcuc_m.ecbcucmodid,g_ecbcuc_m.ecbcucmoddt)

               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = "g_ecbcuc_m:",SQLERRMESSAGE
                  LET g_errparam.code = SQLCA.SQLCODE
                  LET g_errparam.popup = TRUE
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF

               #add-point:單頭新增中 name="input.head.m_insert"

               #end add-point




               #add-point:單頭新增後 name="input.head.a_insert"

               #end add-point
               CALL s_transaction_end('Y','0')

               IF l_cmd_t = 'r' AND p_cmd = 'a' THEN
                  CALL csft003_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL csft003_b_fill()
                  CALL csft003_b_fill2('0')
               END IF

               #add-point:單頭新增後 name="input.head.a_insert2"
               #自动生成单身
               IF NOT cl_null(g_ecbcuc_m.ecbcuc001) THEN
                  CALL s_transaction_begin()
                  CALL csft003_ins_ecbduc(g_ecbcuc_m.ecbcuc002,g_ecbcuc_m.ecbcuc003) RETURNING l_success
                  IF NOT l_success THEN
                     CALL s_transaction_end('N','0')
                  ELSE
                     CALL s_transaction_end('Y','0')
                     CALL csft003_b_fill()
                     LET l_ac = 1
                  END IF
               END IF
               #end add-point

               LET g_master_insert = TRUE

               LET p_cmd = 'u'
            ELSE
               CALL s_transaction_begin()

               #add-point:單頭修改前 name="input.head.b_update"

               #end add-point

               #將遮罩欄位還原
               CALL csft003_ecbcuc_t_mask_restore('restore_mask_o')

               UPDATE ecbcuc_t SET (ecbcucdocno,ecbcucdocdt,ecbcuc008,ecbcuc003,ecbcuc004,ecbcuc005,
                   ecbcuc006,ecbcuc002,ecbcuc007,ecbcuc011,ecbcuc001,ecbcucstus,ecbcucownid,ecbcucowndp,
                   ecbcuccrtid,ecbcuccrtdp,ecbcuccrtdt,ecbcucmodid,ecbcucmoddt) = (g_ecbcuc_m.ecbcucdocno,
                   g_ecbcuc_m.ecbcucdocdt,g_ecbcuc_m.ecbcuc008,g_ecbcuc_m.ecbcuc003,g_ecbcuc_m.ecbcuc004,
                   g_ecbcuc_m.ecbcuc005,g_ecbcuc_m.ecbcuc006,g_ecbcuc_m.ecbcuc002,g_ecbcuc_m.ecbcuc007,
                   g_ecbcuc_m.ecbcuc011,g_ecbcuc_m.ecbcuc001,g_ecbcuc_m.ecbcucstus,g_ecbcuc_m.ecbcucownid,
                   g_ecbcuc_m.ecbcucowndp,g_ecbcuc_m.ecbcuccrtid,g_ecbcuc_m.ecbcuccrtdp,g_ecbcuc_m.ecbcuccrtdt,
                   g_ecbcuc_m.ecbcucmodid,g_ecbcuc_m.ecbcucmoddt)
                WHERE ecbcucent = g_enterprise AND ecbcucsite = g_site AND ecbcucdocno = g_ecbcucdocno_t
                  AND ecbcuc001 = g_ecbcuc001_t
                  AND ecbcuc002 = g_ecbcuc002_t
                  AND ecbcuc003 = g_ecbcuc003_t

               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = "ecbcuc_t:",SQLERRMESSAGE
                  LET g_errparam.code = SQLCA.SQLCODE
                  LET g_errparam.popup = TRUE
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF

               #add-point:單頭修改中 name="input.head.m_update"

               #end add-point




               #將遮罩欄位進行遮蔽
               CALL csft003_ecbcuc_t_mask_restore('restore_mask_n')

               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_ecbcuc_m_t)
               LET g_log2 = util.JSON.stringify(g_ecbcuc_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF

               #add-point:單頭修改後 name="input.head.a_update"

               #end add-point
            END IF

            LET g_master_commit = "Y"
            LET g_ecbcucdocno_t = g_ecbcuc_m.ecbcucdocno
            LET g_ecbcuc001_t = g_ecbcuc_m.ecbcuc001
            LET g_ecbcuc002_t = g_ecbcuc_m.ecbcuc002
            LET g_ecbcuc003_t = g_ecbcuc_m.ecbcuc003


      END INPUT


{</section>}

{<section id="csft003.input.body" >}

      #Page1 預設值產生於此處
      INPUT ARRAY g_ecbduc_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert,
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)

         #自訂ACTION(detail_input,page_1)


         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"

            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN
              CALL FGL_SET_ARR_CURR(g_ecbduc_d.getLength()+1)
              LET g_insert = 'N'
           END IF

            CALL csft003_b_fill() #ver:82
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_ecbduc_d.getLength()
            #add-point:資料輸入前 name="input.d.before_input"

            #end add-point

         BEFORE ROW
            #add-point:modify段before row2 name="input.body.before_row2"
            LET l_m = 1    #C20180718-09415#3 add
            #end add-point
            LET l_insert = FALSE
            LET l_cmd = ''
            LET l_ac_t = l_ac
            LET l_ac = ARR_CURR()
            LET g_detail_idx = l_ac
            LET g_detail_idx_list[1] = l_ac
            LET g_current_page = 1

            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx

            CALL s_transaction_begin()
            OPEN csft003_cl USING g_enterprise, g_site,g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcuc001,g_ecbcuc_m.ecbcuc002,g_ecbcuc_m.ecbcuc003
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "OPEN csft003_cl:",SQLERRMESSAGE
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE
               CLOSE csft003_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF

            LET g_rec_b = g_ecbduc_d.getLength()

            IF g_rec_b >= l_ac
               AND g_ecbduc_d[l_ac].ecbduc004 IS NOT NULL
               AND g_ecbduc_d[l_ac].ecbduc008 IS NOT NULL
               AND g_ecbduc_d[l_ac].ecbducseq IS NOT NULL

            THEN
               LET l_cmd='u'
               LET g_ecbduc_d_t.* = g_ecbduc_d[l_ac].*  #BACKUP
               LET g_ecbduc_d_o.* = g_ecbduc_d[l_ac].*  #BACKUP
               CALL csft003_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"

               #end add-point
               CALL csft003_set_no_entry_b(l_cmd)
               IF NOT csft003_lock_b("ecbduc_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH csft003_bcl INTO g_ecbduc_d[l_ac].ecbducseq,g_ecbduc_d[l_ac].ecbduc004,g_ecbduc_d[l_ac].ecbduc005,
                      g_ecbduc_d[l_ac].ecbduc006,g_ecbduc_d[l_ac].ecbduc008,g_ecbduc_d[l_ac].ecbduc007

                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = g_ecbduc_d_t.ecbduc004,":",SQLERRMESSAGE
                     LET g_errparam.code = SQLCA.SQLCODE
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF

                  #遮罩相關處理
                  LET g_ecbduc_d_mask_o[l_ac].* =  g_ecbduc_d[l_ac].*
                  CALL csft003_ecbduc_t_mask()
                  LET g_ecbduc_d_mask_n[l_ac].* =  g_ecbduc_d[l_ac].*

                  LET g_bfill = "N"
                  CALL csft003_show()
                  LET g_bfill = "Y"

                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body.before_row"
            #S---#C20180718-09415#2 add
            IF l_cmd = 'u' OR l_ac > 0 THEN
               CALL cl_set_act_visible("delete", FALSE)
            ELSE
               CALL cl_set_act_visible("delete", TRUE)
            END IF
            #E---#C20180718-09415#2 add
            #end add-point
            #其他table資料備份(確定是否更改用)


            #其他table進行lock


            CALL csft003_idx_chk()   #(ver:83)

         BEFORE INSERT

            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            CALL csft003_idx_chk()   #(ver:83)
            INITIALIZE g_ecbduc_d[l_ac].* TO NULL
            INITIALIZE g_ecbduc_d_t.* TO NULL
            INITIALIZE g_ecbduc_d_o.* TO NULL
            #公用欄位給值(單身)

            #自定義預設值
                  LET g_ecbduc_d[l_ac].ecbducseq = "0"
      LET g_ecbduc_d[l_ac].ecbduc006 = "0"
      LET g_ecbduc_d[l_ac].ecbduc007 = "0"

            #add-point:modify段before備份 name="input.body.insert.before_bak"
            #S---#C20180816-09415#1 add
            SELECT max(ecbducseq)+1 INTO g_ecbduc_d[l_ac].ecbducseq
              FROM ecbduc_t
             WHERE ecbducent = g_enterprise
               AND ecbducsite = g_site
               AND ecbducdocno = g_ecbcuc_m.ecbcucdocno
               AND ecbduc001 = g_ecbcuc_m.ecbcuc001
               AND ecbduc002 = g_ecbcuc_m.ecbcuc002
               AND ecbduc003 = g_ecbcuc_m.ecbcuc003
            IF cl_null(g_ecbduc_d[l_ac].ecbducseq) OR g_ecbduc_d[l_ac].ecbducseq = 0 THEN
               LET g_ecbduc_d[l_ac].ecbducseq = 1
            END IF
            #E---#C20180816-09415#1 add
            LET g_ecbduc_d[l_ac].ecbduc008 = g_ecbcuc_m.ecbcuc007    #C20180718-09415#1 add
            #end add-point
            LET g_ecbduc_d_t.* = g_ecbduc_d[l_ac].*     #新輸入資料
            LET g_ecbduc_d_o.* = g_ecbduc_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL csft003_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"

            #end add-point
            CALL csft003_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_ecbduc_d[li_reproduce_target].* = g_ecbduc_d[li_reproduce].*

               LET g_ecbduc_d[li_reproduce_target].ecbduc004 = NULL
               LET g_ecbduc_d[li_reproduce_target].ecbduc008 = NULL
               LET g_ecbduc_d[li_reproduce_target].ecbducseq = NULL

            END IF


            #add-point:modify段before insert name="input.body.before_insert"

            #end add-point

         AFTER INSERT
            LET l_insert = FALSE
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = ''
               LET g_errparam.code = 9001
               LET g_errparam.popup = FALSE
               CALL cl_err()
               LET INT_FLAG = 0
               CANCEL INSERT
            END IF

            #add-point:單身新增 name="input.body.b_a_insert"

            #end add-point

            LET l_count = 1
            SELECT COUNT(1) INTO l_count FROM ecbduc_t
             WHERE ecbducent = g_enterprise AND ecbducsite = g_site AND ecbducdocno = g_ecbcuc_m.ecbcucdocno
               AND ecbduc001 = g_ecbcuc_m.ecbcuc001
               AND ecbduc002 = g_ecbcuc_m.ecbcuc002
               AND ecbduc003 = g_ecbcuc_m.ecbcuc003

               AND ecbduc004 = g_ecbduc_d[l_ac].ecbduc004
               AND ecbduc008 = g_ecbduc_d[l_ac].ecbduc008
               AND ecbducseq = g_ecbduc_d[l_ac].ecbducseq


            #資料未重複, 插入新增資料
            IF l_count = 0 THEN
               #add-point:單身新增前 name="input.body.b_insert"

               #end add-point

               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL
               LET gs_keys[1] = g_ecbcuc_m.ecbcucdocno
               LET gs_keys[2] = g_ecbcuc_m.ecbcuc001
               LET gs_keys[3] = g_ecbcuc_m.ecbcuc002
               LET gs_keys[4] = g_ecbcuc_m.ecbcuc003
               LET gs_keys[5] = g_ecbduc_d[g_detail_idx].ecbduc004
               LET gs_keys[6] = g_ecbduc_d[g_detail_idx].ecbduc008
               LET gs_keys[7] = g_ecbduc_d[g_detail_idx].ecbducseq
               CALL csft003_insert_b('ecbduc_t',gs_keys,"'1'")

               #add-point:單身新增後 name="input.body.a_insert"

               #end add-point
            ELSE
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = 'INSERT'
               LET g_errparam.code = "std-00006"
               LET g_errparam.popup = TRUE
               INITIALIZE g_ecbduc_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF

            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "ecbduc_t:",SQLERRMESSAGE
               LET g_errparam.code = SQLCA.SQLCODE
               LET g_errparam.popup = TRUE
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL csft003_b_fill()
               #資料多語言用-增/改

               #add-point:input段-after_insert name="input.body.a_insert2"

               #end add-point
               CALL s_transaction_end('Y','0')
               #ERROR 'INSERT O.K'
               LET g_rec_b = g_rec_b + 1
            END IF

         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' THEN
               LET l_cmd='d'
               #add-point:單身刪除後(=d) name="input.body.after_delete_d"

               #end add-point
            ELSE
               #add-point:單身刪除前 name="input.body.b_delete_ask"

               #end add-point
               IF NOT cl_ask_del_detail() THEN
                  CANCEL DELETE
               END IF
               IF l_lock_sw = "Y" THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = ""
                  LET g_errparam.code = -263
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  CANCEL DELETE
               END IF

               #add-point:單身刪除前 name="input.body.b_delete"

               #end add-point

               #取得該筆資料key值
               INITIALIZE gs_keys TO NULL
               LET gs_keys[01] = g_ecbcuc_m.ecbcucdocno
               LET gs_keys[gs_keys.getLength()+1] = g_ecbcuc_m.ecbcuc001
               LET gs_keys[gs_keys.getLength()+1] = g_ecbcuc_m.ecbcuc002
               LET gs_keys[gs_keys.getLength()+1] = g_ecbcuc_m.ecbcuc003

               LET gs_keys[gs_keys.getLength()+1] = g_ecbduc_d_t.ecbduc004
               LET gs_keys[gs_keys.getLength()+1] = g_ecbduc_d_t.ecbduc008
               LET gs_keys[gs_keys.getLength()+1] = g_ecbduc_d_t.ecbducseq


               #刪除同層單身
               IF NOT csft003_delete_b('ecbduc_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE csft003_bcl
                  CANCEL DELETE
               END IF

               #刪除下層單身
               IF NOT csft003_key_delete_b(gs_keys,'ecbduc_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE csft003_bcl
                  CANCEL DELETE
               END IF

               #刪除多語言



               #add-point:單身刪除中 name="input.body.m_delete"

               #end add-point

               CALL s_transaction_end('Y','0')
               CLOSE csft003_bcl

               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"

               #end add-point
               LET l_count = g_ecbduc_d.getLength()

               #add-point:單身刪除後(<>d) name="input.body.after_delete"

               #end add-point
            END IF

         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_ecbduc_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF

                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbducseq
            #add-point:BEFORE FIELD ecbducseq name="input.b.page1.ecbducseq"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbducseq

            #add-point:AFTER FIELD ecbducseq name="input.a.page1.ecbducseq"
            #應用 a05 樣板自動產生(Version:3)
            #確認資料無重複
            IF  g_ecbcuc_m.ecbcucdocno IS NOT NULL AND g_ecbcuc_m.ecbcuc001 IS NOT NULL AND g_ecbcuc_m.ecbcuc002 IS NOT NULL AND g_ecbcuc_m.ecbcuc003 IS NOT NULL AND g_ecbduc_d[g_detail_idx].ecbduc004 IS NOT NULL AND g_ecbduc_d[g_detail_idx].ecbduc008 IS NOT NULL AND g_ecbduc_d[g_detail_idx].ecbducseq IS NOT NULL THEN
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_ecbcuc_m.ecbcucdocno != g_ecbcucdocno_t OR g_ecbcuc_m.ecbcuc001 != g_ecbcuc001_t OR g_ecbcuc_m.ecbcuc002 != g_ecbcuc002_t OR g_ecbcuc_m.ecbcuc003 != g_ecbcuc003_t OR g_ecbduc_d[g_detail_idx].ecbduc004 != g_ecbduc_d_t.ecbduc004 OR g_ecbduc_d[g_detail_idx].ecbduc008 != g_ecbduc_d_t.ecbduc008 OR g_ecbduc_d[g_detail_idx].ecbducseq != g_ecbduc_d_t.ecbducseq)) THEN
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM ecbduc_t WHERE "||"ecbducent = " ||g_enterprise|| " AND ecbducsite = '" ||g_site|| "' AND "||"ecbducdocno = '"||g_ecbcuc_m.ecbcucdocno ||"' AND "|| "ecbduc001 = '"||g_ecbcuc_m.ecbcuc001 ||"' AND "|| "ecbduc002 = '"||g_ecbcuc_m.ecbcuc002 ||"' AND "|| "ecbduc003 = '"||g_ecbcuc_m.ecbcuc003 ||"' AND "|| "ecbduc004 = '"||g_ecbduc_d[g_detail_idx].ecbduc004 ||"' AND "|| "ecbduc008 = '"||g_ecbduc_d[g_detail_idx].ecbduc008 ||"' AND "|| "ecbducseq = '"||g_ecbduc_d[g_detail_idx].ecbducseq ||"'",'std-00004',0) THEN
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF



            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ecbducseq
            #add-point:ON CHANGE ecbducseq name="input.g.page1.ecbducseq"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbduc004
            #add-point:BEFORE FIELD ecbduc004 name="input.b.page1.ecbduc004"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbduc004

            #add-point:AFTER FIELD ecbduc004 name="input.a.page1.ecbduc004"
            #應用 a05 樣板自動產生(Version:3)
            #確認資料無重複
            IF  g_ecbcuc_m.ecbcucdocno IS NOT NULL AND g_ecbcuc_m.ecbcuc001 IS NOT NULL AND g_ecbcuc_m.ecbcuc002 IS NOT NULL AND g_ecbcuc_m.ecbcuc003 IS NOT NULL AND g_ecbduc_d[g_detail_idx].ecbduc004 IS NOT NULL THEN
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_ecbcuc_m.ecbcucdocno != g_ecbcucdocno_t OR g_ecbcuc_m.ecbcuc001 != g_ecbcuc001_t OR g_ecbcuc_m.ecbcuc002 != g_ecbcuc002_t OR g_ecbcuc_m.ecbcuc003 != g_ecbcuc003_t OR g_ecbduc_d[g_detail_idx].ecbduc004 != g_ecbduc_d_t.ecbduc004)) THEN
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM ecbduc_t WHERE "||"ecbducent = " ||g_enterprise|| " AND ecbducsite = '" ||g_site|| "' AND "||"ecbducdocno = '"||g_ecbcuc_m.ecbcucdocno ||"' AND "|| "ecbduc001 = '"||g_ecbcuc_m.ecbcuc001 ||"' AND "|| "ecbduc002 = '"||g_ecbcuc_m.ecbcuc002 ||"' AND "|| "ecbduc003 = '"||g_ecbcuc_m.ecbcuc003 ||"' AND "|| "ecbduc004 = '"||g_ecbduc_d[g_detail_idx].ecbduc004 ||"'",'std-00004',0) THEN
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF



            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ecbduc004
            #add-point:ON CHANGE ecbduc004 name="input.g.page1.ecbduc004"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbduc005
            #add-point:BEFORE FIELD ecbduc005 name="input.b.page1.ecbduc005"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbduc005

            #add-point:AFTER FIELD ecbduc005 name="input.a.page1.ecbduc005"

            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ecbduc005
            #add-point:ON CHANGE ecbduc005 name="input.g.page1.ecbduc005"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbduc006
            #add-point:BEFORE FIELD ecbduc006 name="input.b.page1.ecbduc006"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbduc006

            #add-point:AFTER FIELD ecbduc006 name="input.a.page1.ecbduc006"
            LET g_ecbduc_d[l_ac].l_jine = g_ecbduc_d[l_ac].ecbduc006 * g_ecbduc_d[l_ac].ecbduc007  #C20180816-09415#1 add
            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ecbduc006
            #add-point:ON CHANGE ecbduc006 name="input.g.page1.ecbduc006"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbduc008

            #add-point:AFTER FIELD ecbduc008 name="input.a.page1.ecbduc008"
            IF NOT cl_null(g_ecbduc_d[l_ac].ecbduc008) THEN
               INITIALIZE g_chkparam.* TO NULL
               LET g_chkparam.arg1 = g_ecbduc_d[l_ac].ecbduc008
               IF cl_chk_exist("v_ooag001") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF
               #带值
               SELECT ooag011,ooag003,ooefl003
                 INTO g_ecbduc_d[l_ac].ecbduc008_desc,g_ecbduc_d[l_ac].ecbduc008_desc_1,g_ecbduc_d[l_ac].ecbduc008_desc_1_desc
                 FROM ooag_t
                 LEFT JOIN ooefl_t ON ooeflent = g_enterprise AND ooefl001 = ooag003 AND ooefl002 = g_dlang
                WHERE ooagent=g_enterprise AND ooagstus = 'Y'
                  AND ooag001 = g_ecbduc_d[l_ac].ecbduc008
            END IF
            DISPLAY BY NAME g_ecbduc_d[l_ac].ecbduc008_desc,g_ecbduc_d[l_ac].ecbduc008_desc_1,g_ecbduc_d[l_ac].ecbduc008_desc_1_desc

            #END add-point



         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbduc008
            #add-point:BEFORE FIELD ecbduc008 name="input.b.page1.ecbduc008"

            #END add-point


         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ecbduc008
            #add-point:ON CHANGE ecbduc008 name="input.g.page1.ecbduc008"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ecbduc007
            #add-point:BEFORE FIELD ecbduc007 name="input.b.page1.ecbduc007"
            IF p_cmd = 'u' AND g_ecbduc_d[l_ac].ecbduc008 = g_ecbduc_d_t.ecbduc008 AND g_ecbduc_d[l_ac].ecbduc007 > 0 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "操作工未作改变不可拆分"
               LET g_errparam.code = '!'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               NEXT FIELD ecbduc008
            END IF
            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ecbduc007

            #add-point:AFTER FIELD ecbduc007 name="input.a.page1.ecbduc007"
            LET g_ecbduc_d[l_ac].l_jine = g_ecbduc_d[l_ac].ecbduc006 * g_ecbduc_d[l_ac].ecbduc007  #C20180816-09415#1 add
            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ecbduc007
            #add-point:ON CHANGE ecbduc007 name="input.g.page1.ecbduc007"

            #END add-point


         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_jine
            #add-point:BEFORE FIELD l_jine name="input.b.page1.l_jine"

            #END add-point


         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_jine

            #add-point:AFTER FIELD l_jine name="input.a.page1.l_jine"

            #END add-point



         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_jine
            #add-point:ON CHANGE l_jine name="input.g.page1.l_jine"

            #END add-point



                  #Ctrlp:input.c.page1.ecbducseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbducseq
            #add-point:ON ACTION controlp INFIELD ecbducseq name="input.c.page1.ecbducseq"

            #END add-point


         #Ctrlp:input.c.page1.ecbduc004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbduc004
            #add-point:ON ACTION controlp INFIELD ecbduc004 name="input.c.page1.ecbduc004"
            #應用 a07 樣板自動產生(Version:3)
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_ecbduc_d[l_ac].ecbduc004             #給予default值
            LET g_qryparam.default2 = "" #g_ecbduc_d[l_ac].oocq002 #應用分類碼
            #給予arg
            LET g_qryparam.arg1 = "" #s


            CALL q_oocq002()                                #呼叫開窗

            LET g_ecbduc_d[l_ac].ecbduc004 = g_qryparam.return1
            #LET g_ecbduc_d[l_ac].oocq002 = g_qryparam.return2
            DISPLAY g_ecbduc_d[l_ac].ecbduc004 TO ecbduc004              #
            #DISPLAY g_ecbduc_d[l_ac].oocq002 TO oocq002 #應用分類碼
            NEXT FIELD ecbduc004                          #返回原欄位



            #END add-point


         #Ctrlp:input.c.page1.ecbduc005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbduc005
            #add-point:ON ACTION controlp INFIELD ecbduc005 name="input.c.page1.ecbduc005"

            #END add-point


         #Ctrlp:input.c.page1.ecbduc006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbduc006
            #add-point:ON ACTION controlp INFIELD ecbduc006 name="input.c.page1.ecbduc006"

            #END add-point


         #Ctrlp:input.c.page1.ecbduc008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbduc008
            #add-point:ON ACTION controlp INFIELD ecbduc008 name="input.c.page1.ecbduc008"
            #應用 a07 樣板自動產生(Version:3)
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_ecbduc_d[l_ac].ecbduc008             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s
            #S---#C20180718-09415#3 add
            IF cl_null(l_m) OR l_m = 1 THEN
               LET g_qryparam.where = "ooag003 = (select ooag003 FROM ooag_t WHERE ooagent= ",g_enterprise," AND ooag001 = '",g_user,"')"
               LET l_m = l_m + 1
            END IF
            #E---#C20180718-09415#3 add
#            CALL q_ooag001_4()                                #呼叫開窗    #C20180531-09415#1 mark by zhaoqn
            CALL cq_ooag001_4()   #C20180531-09415#1 add by zhaoqn

            LET g_ecbduc_d[l_ac].ecbduc008 = g_qryparam.return1
            #S---#C20180718-09415#1 add
            LET g_ecbduc_d[l_ac].ecbduc008_desc = g_qryparam.return2
            LET g_ecbduc_d[l_ac].ecbduc008_desc_1 = g_qryparam.return3
            LET g_ecbduc_d[l_ac].ecbduc008_desc_1_desc = g_qryparam.return4
            #S---#C20180718-09415#1 add
            DISPLAY g_ecbduc_d[l_ac].ecbduc008,g_ecbduc_d[l_ac].ecbduc008_desc,g_ecbduc_d[l_ac].ecbduc008_desc_1,g_ecbduc_d[l_ac].ecbduc008_desc_1_desc
                 TO ecbduc008,ecbduc008_desc,ecbduc008_desc_1,ecbduc008_desc_1_desc            #

            NEXT FIELD ecbduc008                          #返回原欄位



            #END add-point


         #Ctrlp:input.c.page1.ecbduc007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ecbduc007
            #add-point:ON ACTION controlp INFIELD ecbduc007 name="input.c.page1.ecbduc007"

            #END add-point


         #Ctrlp:input.c.page1.l_jine
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_jine
            #add-point:ON ACTION controlp INFIELD l_jine name="input.c.page1.l_jine"

            #END add-point




         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_ecbduc_d[l_ac].* = g_ecbduc_d_t.*
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = ''
               LET g_errparam.code = 9001
               LET g_errparam.popup = FALSE
               CLOSE csft003_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG
            END IF

            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = g_ecbduc_d[l_ac].ecbduc004
               LET g_errparam.code = -263
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET g_ecbduc_d[l_ac].* = g_ecbduc_d_t.*
            ELSE

               #add-point:單身修改前 name="input.body.b_update"

               #end add-point

               #寫入修改者/修改日期資訊(單身)


               #將遮罩欄位還原
               CALL csft003_ecbduc_t_mask_restore('restore_mask_o')

               UPDATE ecbduc_t SET (ecbducdocno,ecbduc001,ecbduc002,ecbduc003,ecbducseq,ecbduc004,ecbduc005,
                   ecbduc006,ecbduc008,ecbduc007) = (g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcuc001,g_ecbcuc_m.ecbcuc002,
                   g_ecbcuc_m.ecbcuc003,g_ecbduc_d[l_ac].ecbducseq,g_ecbduc_d[l_ac].ecbduc004,g_ecbduc_d[l_ac].ecbduc005,
                   g_ecbduc_d[l_ac].ecbduc006,g_ecbduc_d[l_ac].ecbduc008,g_ecbduc_d[l_ac].ecbduc007)

                WHERE ecbducent = g_enterprise AND ecbducsite = g_site AND ecbducdocno = g_ecbcuc_m.ecbcucdocno
                  AND ecbduc001 = g_ecbcuc_m.ecbcuc001
                  AND ecbduc002 = g_ecbcuc_m.ecbcuc002
                  AND ecbduc003 = g_ecbcuc_m.ecbcuc003

                  AND ecbduc004 = g_ecbduc_d_t.ecbduc004 #項次
                  AND ecbduc008 = g_ecbduc_d_t.ecbduc008
                  AND ecbducseq = g_ecbduc_d_t.ecbducseq


               #add-point:單身修改中 name="input.body.m_update"

               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_ecbduc_d[l_ac].* = g_ecbduc_d_t.*
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = "ecbduc_t"
                     LET g_errparam.code = "std-00009"
                     LET g_errparam.popup = TRUE
                     CALL s_transaction_end('N','0')
                     CALL cl_err()

                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_ecbduc_d[l_ac].* = g_ecbduc_d_t.*
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = "ecbduc_t:",SQLERRMESSAGE
                     LET g_errparam.code = SQLCA.SQLCODE
                     LET g_errparam.popup = TRUE
                     CALL s_transaction_end('N','0')
                     CALL cl_err()

                  OTHERWISE
                     #資料多語言用-增/改

                                    INITIALIZE gs_keys TO NULL
               LET gs_keys[1] = g_ecbcuc_m.ecbcucdocno
               LET gs_keys_bak[1] = g_ecbcucdocno_t
               LET gs_keys[2] = g_ecbcuc_m.ecbcuc001
               LET gs_keys_bak[2] = g_ecbcuc001_t
               LET gs_keys[3] = g_ecbcuc_m.ecbcuc002
               LET gs_keys_bak[3] = g_ecbcuc002_t
               LET gs_keys[4] = g_ecbcuc_m.ecbcuc003
               LET gs_keys_bak[4] = g_ecbcuc003_t
               LET gs_keys[5] = g_ecbduc_d[g_detail_idx].ecbduc004
               LET gs_keys_bak[5] = g_ecbduc_d_t.ecbduc004
               LET gs_keys[6] = g_ecbduc_d[g_detail_idx].ecbduc008
               LET gs_keys_bak[6] = g_ecbduc_d_t.ecbduc008
               LET gs_keys[7] = g_ecbduc_d[g_detail_idx].ecbducseq
               LET gs_keys_bak[7] = g_ecbduc_d_t.ecbducseq
               CALL csft003_update_b('ecbduc_t',gs_keys,gs_keys_bak,"'1'")
               END CASE

               #將遮罩欄位進行遮蔽
               CALL csft003_ecbduc_t_mask_restore('restore_mask_n')

               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_ecbduc_d[g_detail_idx].ecbduc004 = g_ecbduc_d_t.ecbduc004
                  AND g_ecbduc_d[g_detail_idx].ecbduc008 = g_ecbduc_d_t.ecbduc008
                  AND g_ecbduc_d[g_detail_idx].ecbducseq = g_ecbduc_d_t.ecbducseq

                  ) THEN
                  LET gs_keys[01] = g_ecbcuc_m.ecbcucdocno
                  LET gs_keys[gs_keys.getLength()+1] = g_ecbcuc_m.ecbcuc001
                  LET gs_keys[gs_keys.getLength()+1] = g_ecbcuc_m.ecbcuc002
                  LET gs_keys[gs_keys.getLength()+1] = g_ecbcuc_m.ecbcuc003

                  LET gs_keys[gs_keys.getLength()+1] = g_ecbduc_d_t.ecbduc004
                  LET gs_keys[gs_keys.getLength()+1] = g_ecbduc_d_t.ecbduc008
                  LET gs_keys[gs_keys.getLength()+1] = g_ecbduc_d_t.ecbducseq

                  CALL csft003_key_update_b(gs_keys,'ecbduc_t')
               END IF

               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_ecbcuc_m),util.JSON.stringify(g_ecbduc_d_t)
               LET g_log2 = util.JSON.stringify(g_ecbcuc_m),util.JSON.stringify(g_ecbduc_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN
                  CALL s_transaction_end('N','0')
               END IF

               #add-point:單身修改後 name="input.body.a_update"
               #S----#C20180528-09415#1 add by zhaoqn
               IF g_ecbduc_d[l_ac].ecbduc007 < g_ecbduc_d_t.ecbduc007 THEN
                  CALL csft003_ins_ecbduc_01(g_ecbduc_d_t.ecbduc007,g_ecbduc_d[l_ac].ecbduc007) RETURNING l_success
                  IF NOT l_success THEN
                     CALL s_transaction_end('N','0')
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = "拆分失败"
                     LET g_errparam.code = '!'
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_ecbduc_d[l_ac].ecbduc007 = g_ecbduc_d_t.ecbduc007
                  END IF
               END IF
               IF g_ecbduc_d[l_ac].ecbduc007 > g_ecbduc_d_t.ecbduc007 THEN
                  CALL s_transaction_end('N','0')
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = "派工数量不可小于拆分前的派工数量"
                  LET g_errparam.code = '!'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET g_ecbduc_d[l_ac].ecbduc007 = g_ecbduc_d_t.ecbduc007
               END IF
               #E----#C20180528-09415#1 add by zhaoqn
               #end add-point

            END IF

         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"

            #end add-point
            CALL csft003_unlock_b("ecbduc_t","'1'")
            CALL s_transaction_end('Y','0')
            #其他table進行unlock
            #add-point:單身after_row2 name="input.body.after_row2"
             CALL csft003_b_fill()     #C20180528-09415#1 add by zhaoqn
            #end add-point

         AFTER INPUT
            #add-point:input段after input  name="input.body.after_input"
            #S---#C20180816-09415#1 add
            #回写单头金额汇总
            SELECT sum(ecbduc006*ecbduc007) INTO g_ecbcuc_m.l_sum
              FROM ecbduc_t
             WHERE ecbducent = g_enterprise
               AND ecbducsite = g_site
               AND ecbducdocno = g_ecbcuc_m.ecbcucdocno
               AND ecbduc001 = g_ecbcuc_m.ecbcuc001
               AND ecbduc002 = g_ecbcuc_m.ecbcuc002
               AND ecbduc003 = g_ecbcuc_m.ecbcuc003
            DISPLAY BY NAME g_ecbcuc_m.l_sum
            #E---#C20180816-09415#1 add
            #end add-point

         ON ACTION controlo
            IF l_insert THEN
               LET li_reproduce = l_ac_t
               LET li_reproduce_target = l_ac
               LET g_ecbduc_d[li_reproduce_target].* = g_ecbduc_d[li_reproduce].*

               LET g_ecbduc_d[li_reproduce_target].ecbduc004 = NULL
               LET g_ecbduc_d[li_reproduce_target].ecbduc008 = NULL
               LET g_ecbduc_d[li_reproduce_target].ecbducseq = NULL

            ELSE
               CALL FGL_SET_ARR_CURR(g_ecbduc_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_ecbduc_d.getLength()+1
            END IF
            #(ver:84) ---start---
            #add-point:input段單身複製  name="input.body.controlo"

            #end add-point
            #(ver:84) --- end ---

         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG

      END INPUT







{</section>}

{<section id="csft003.input.other" >}

      #add-point:自定義input name="input.more_input"

      #end add-point

      BEFORE DIALOG
         #CALL cl_err_collect_init()
         #add-point:input段before dialog name="input.before_dialog"

         #end add-point
         #重新導回資料到正確位置上
         CALL DIALOG.setCurrentRow("s_detail1",g_idx_group.getValue("'1',"))

         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            #add-point:input段next_field name="input.next_field"

            #end add-point
            NEXT FIELD ecbcucdocno
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD ecbducseq

               #add-point:input段modify_detail  name="input.modify_detail.other"

               #end add-point
            END CASE
         END IF

      AFTER DIALOG
         #add-point:input段after_dialog name="input.after_dialog"

         #end add-point

      ON ACTION controlf
         CALL cl_set_focus_form(ui.Interface.getRootNode()) RETURNING g_fld_name,g_frm_name
         CALL cl_fldhelp(g_frm_name,g_fld_name,g_lang)

      ON ACTION controlr
         CALL cl_show_req_fields()

      ON ACTION controls
         IF g_header_hidden THEN
            CALL gfrm_curr.setElementHidden("vb_master",0)
            CALL gfrm_curr.setElementImage("controls","small/arr-u.png")
            LET g_header_hidden = 0     #visible
         ELSE
            CALL gfrm_curr.setElementHidden("vb_master",1)
            CALL gfrm_curr.setElementImage("controls","small/arr-d.png")
            LET g_header_hidden = 1     #hidden
         END IF

      ON ACTION accept
         #add-point:input段accept  name="input.accept"
         #S---#C20180816-09415#1 add
         #回写单头金额汇总
         SELECT sum(ecbduc006*ecbduc007) INTO g_ecbcuc_m.l_sum
           FROM ecbduc_t
          WHERE ecbducent = g_enterprise
            AND ecbducsite = g_site
            AND ecbducdocno = g_ecbcuc_m.ecbcucdocno
            AND ecbduc001 = g_ecbcuc_m.ecbcuc001
            AND ecbduc002 = g_ecbcuc_m.ecbcuc002
            AND ecbduc003 = g_ecbcuc_m.ecbcuc003
         DISPLAY BY NAME g_ecbcuc_m.l_sum
         #E---#C20180816-09415#1 add
         #end add-point
         ACCEPT DIALOG

      ON ACTION cancel      #在dialog button (放棄)
         #add-point:input段cancel name="input.cancel"
         #S---#C20180816-09415#1 add
         #回写单头金额汇总
         SELECT sum(ecbduc006*ecbduc007) INTO g_ecbcuc_m.l_sum
           FROM ecbduc_t
          WHERE ecbducent = g_enterprise
            AND ecbducsite = g_site
            AND ecbducdocno = g_ecbcuc_m.ecbcucdocno
            AND ecbduc001 = g_ecbcuc_m.ecbcuc001
            AND ecbduc002 = g_ecbcuc_m.ecbcuc002
            AND ecbduc003 = g_ecbcuc_m.ecbcuc003
         DISPLAY BY NAME g_ecbcuc_m.l_sum
         #E---#C20180816-09415#1 add
         #end add-point
         LET INT_FLAG = TRUE
         LET g_detail_idx  = 1
         LET g_detail_idx2 = 1
         #各個page指標
         LET g_detail_idx_list[1] = 1

         CALL g_curr_diag.setCurrentRow("s_detail1",1)

         EXIT DIALOG

      ON ACTION close       #在dialog 右上角 (X)
         #add-point:input段close name="input.close"
         #S---#C20180816-09415#1 add
         #回写单头金额汇总
         SELECT sum(ecbduc006*ecbduc007) INTO g_ecbcuc_m.l_sum
           FROM ecbduc_t
          WHERE ecbducent = g_enterprise
            AND ecbducsite = g_site
            AND ecbducdocno = g_ecbcuc_m.ecbcucdocno
            AND ecbduc001 = g_ecbcuc_m.ecbcuc001
            AND ecbduc002 = g_ecbcuc_m.ecbcuc002
            AND ecbduc003 = g_ecbcuc_m.ecbcuc003
         DISPLAY BY NAME g_ecbcuc_m.l_sum
         #E---#C20180816-09415#1 add
         #end add-point
         LET INT_FLAG = TRUE
         EXIT DIALOG

      ON ACTION exit        #toolbar 離開
         #add-point:input段exit name="input.exit"

         #end add-point
         LET INT_FLAG = TRUE
         LET g_detail_idx  = 1
         LET g_detail_idx2 = 1
         #各個page指標
         LET g_detail_idx_list[1] = 1

         CALL g_curr_diag.setCurrentRow("s_detail1",1)

         EXIT DIALOG

      #交談指令共用ACTION
      &include "common_action.4gl"
         CONTINUE DIALOG
   END DIALOG

   #add-point:input段after input  name="input.after_input"

   #end add-point

END FUNCTION

{</section>}

{<section id="csft003.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION csft003_show()
   #add-point:show段define(客製用) name="show.define_customerization"

   #end add-point
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"

   #end add-point

   #add-point:Function前置處理 name="show.before"

   #end add-point



   IF g_bfill = "Y" THEN
      CALL csft003_b_fill() #單身填充
      CALL csft003_b_fill2('0') #單身填充
   END IF

   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)




   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL csft003_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"

   #END add-point
   CALL cl_user_overview_set_follow_pic()





   LET l_ac_t = l_ac

   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"
   #颜色，材质，图号，老物料代码
   SELECT imaal003,imaal004,imaaud001,imaaud002,imaa041,imaa035
     INTO g_ecbcuc_m.ecbcuc002_desc_1,g_ecbcuc_m.ecbcuc002_desc_2,g_ecbcuc_m.ecbcuc002_desc_3,g_ecbcuc_m.ecbcuc002_desc_4,g_ecbcuc_m.ecbcuc002_desc_5,g_ecbcuc_m.ecbcuc002_desc_6
     FROM imaa_t
     LEFT JOIN imaal_t ON imaaent = imaalent AND imaa001 = imaal001 AND imaal002 = g_dlang
    WHERE imaaent = g_enterprise
      AND imaa001 = g_ecbcuc_m.ecbcuc002
   #作业编号说明
   SELECT oocql004 INTO g_ecbcuc_m.ecbcuc003_desc
     FROM oocql_t
    WHERE oocqlent = g_enterprise
      AND oocql001 = '221'
      AND oocql002 = g_ecbcuc_m.ecbcuc003
   #S---#C20180816-09415#1 add
   #回写单头金额汇总
   SELECT sum(ecbduc006*ecbduc007) INTO g_ecbcuc_m.l_sum
     FROM ecbduc_t
    WHERE ecbducent = g_enterprise
      AND ecbducsite = g_site
      AND ecbducdocno = g_ecbcuc_m.ecbcucdocno
      AND ecbduc001 = g_ecbcuc_m.ecbcuc001
      AND ecbduc002 = g_ecbcuc_m.ecbcuc002
      AND ecbduc003 = g_ecbcuc_m.ecbcuc003
   DISPLAY BY NAME g_ecbcuc_m.l_sum
   #E---#C20180816-09415#1 add
   #end add-point

   #遮罩相關處理
   LET g_ecbcuc_m_mask_o.* =  g_ecbcuc_m.*
   CALL csft003_ecbcuc_t_mask()
   LET g_ecbcuc_m_mask_n.* =  g_ecbcuc_m.*

   #將資料輸出到畫面上
   DISPLAY BY NAME g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcucdocno_desc,g_ecbcuc_m.ecbcucdocdt,g_ecbcuc_m.ecbcuc008,
       g_ecbcuc_m.ecbcuc003,g_ecbcuc_m.ecbcuc003_desc,g_ecbcuc_m.ecbcuc004,g_ecbcuc_m.ecbcuc005,g_ecbcuc_m.ecbcuc006,
       g_ecbcuc_m.ecbcuc006_desc,g_ecbcuc_m.ecbcuc002,g_ecbcuc_m.ecbcuc002_desc_1,g_ecbcuc_m.ecbcuc002_desc_5,
       g_ecbcuc_m.ecbcuc002_desc_2,g_ecbcuc_m.ecbcuc002_desc_6,g_ecbcuc_m.ecbcuc002_desc_3,g_ecbcuc_m.ecbcuc007,
       g_ecbcuc_m.ecbcuc007_desc,g_ecbcuc_m.ecbcuc002_desc_4,g_ecbcuc_m.l_sum,g_ecbcuc_m.ecbcuc011,g_ecbcuc_m.ecbcuc001,
       g_ecbcuc_m.ecbcucstus,g_ecbcuc_m.ecbcucownid,g_ecbcuc_m.ecbcucownid_desc,g_ecbcuc_m.ecbcucowndp,
       g_ecbcuc_m.ecbcucowndp_desc,g_ecbcuc_m.ecbcuccrtid,g_ecbcuc_m.ecbcuccrtid_desc,g_ecbcuc_m.ecbcuccrtdp,
       g_ecbcuc_m.ecbcuccrtdp_desc,g_ecbcuc_m.ecbcuccrtdt,g_ecbcuc_m.ecbcucmodid,g_ecbcuc_m.ecbcucmodid_desc,
       g_ecbcuc_m.ecbcucmoddt

   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_ecbcuc_m.ecbcucstus
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "S"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
         WHEN "Z"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")

      END CASE




   #讀入ref值(單身)
   FOR l_ac = 1 TO g_ecbduc_d.getLength()
      #add-point:show段單身reference name="show.body.reference"

      #end add-point
   END FOR





   #add-point:show段other name="show.other"

   #end add-point

   LET l_ac = l_ac_t

   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()

   CALL csft003_detail_show()

   #add-point:show段之後 name="show.after"

   #end add-point

END FUNCTION

{</section>}

{<section id="csft003.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION csft003_detail_show()
   #add-point:detail_show段define(客製用) name="detail_show.define_customerization"

   #end add-point
   #add-point:detail_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_show.define"

   #end add-point

   #add-point:Function前置處理 name="detail_show.before"

   #end add-point

   #add-point:detail_show段之後 name="detail_show.after"

   #end add-point

END FUNCTION

{</section>}

{<section id="csft003.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION csft003_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"

   #end add-point
   DEFINE l_newno     LIKE ecbcuc_t.ecbcucdocno
   DEFINE l_oldno     LIKE ecbcuc_t.ecbcucdocno
   DEFINE l_newno02     LIKE ecbcuc_t.ecbcuc001
   DEFINE l_oldno02     LIKE ecbcuc_t.ecbcuc001
   DEFINE l_newno03     LIKE ecbcuc_t.ecbcuc002
   DEFINE l_oldno03     LIKE ecbcuc_t.ecbcuc002
   DEFINE l_newno04     LIKE ecbcuc_t.ecbcuc003
   DEFINE l_oldno04     LIKE ecbcuc_t.ecbcuc003

   DEFINE l_master    RECORD LIKE ecbcuc_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE ecbduc_t.* #此變數樣板目前無使用


   DEFINE l_cnt       LIKE type_t.num10
   #add-point:reproduce段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"

   #end add-point

   #add-point:Function前置處理  name="reproduce.pre_function"

   #end add-point

   #切換畫面
   IF g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   END IF

   LET g_master_insert = FALSE

   IF g_ecbcuc_m.ecbcucdocno IS NULL
   OR g_ecbcuc_m.ecbcuc001 IS NULL
   OR g_ecbcuc_m.ecbcuc002 IS NULL
   OR g_ecbcuc_m.ecbcuc003 IS NULL

   THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ""
      LET g_errparam.code = "std-00003"
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN
   END IF

   LET g_ecbcucdocno_t = g_ecbcuc_m.ecbcucdocno
   LET g_ecbcuc001_t = g_ecbcuc_m.ecbcuc001
   LET g_ecbcuc002_t = g_ecbcuc_m.ecbcuc002
   LET g_ecbcuc003_t = g_ecbcuc_m.ecbcuc003


   LET g_ecbcuc_m.ecbcucdocno = ""
   LET g_ecbcuc_m.ecbcuc001 = ""
   LET g_ecbcuc_m.ecbcuc002 = ""
   LET g_ecbcuc_m.ecbcuc003 = ""


   CALL cl_set_head_visible("","YES")

   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)
      #公用欄位新增給值
      LET g_ecbcuc_m.ecbcucownid = g_user
      LET g_ecbcuc_m.ecbcucowndp = g_dept
      LET g_ecbcuc_m.ecbcuccrtid = g_user
      LET g_ecbcuc_m.ecbcuccrtdp = g_dept
      LET g_ecbcuc_m.ecbcuccrtdt = cl_get_current()
      LET g_ecbcuc_m.ecbcucmodid = g_user
      LET g_ecbcuc_m.ecbcucmoddt = cl_get_current()
      LET g_ecbcuc_m.ecbcucstus = 'N'




   CALL s_transaction_begin()

   #add-point:複製輸入前 name="reproduce.head.b_input"

   #end add-point

   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_ecbcuc_m.ecbcucstus
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "S"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
         WHEN "Z"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")

      END CASE




   #清空key欄位的desc
      LET g_ecbcuc_m.ecbcucdocno_desc = ''
   DISPLAY BY NAME g_ecbcuc_m.ecbcucdocno_desc
   LET g_ecbcuc_m.ecbcuc003_desc = ''
   DISPLAY BY NAME g_ecbcuc_m.ecbcuc003_desc
   LET g_ecbcuc_m.ecbcuc002_desc_1 = ''
   DISPLAY BY NAME g_ecbcuc_m.ecbcuc002_desc_1
   LET g_ecbcuc_m.ecbcuc002_desc_5 = ''
   DISPLAY BY NAME g_ecbcuc_m.ecbcuc002_desc_5
   LET g_ecbcuc_m.ecbcuc002_desc_2 = ''
   DISPLAY BY NAME g_ecbcuc_m.ecbcuc002_desc_2
   LET g_ecbcuc_m.ecbcuc002_desc_6 = ''
   DISPLAY BY NAME g_ecbcuc_m.ecbcuc002_desc_6
   LET g_ecbcuc_m.ecbcuc002_desc_3 = ''
   DISPLAY BY NAME g_ecbcuc_m.ecbcuc002_desc_3
   LET g_ecbcuc_m.ecbcuc002_desc_4 = ''
   DISPLAY BY NAME g_ecbcuc_m.ecbcuc002_desc_4


   CALL csft003_input("r")

   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_ecbcuc_m.* TO NULL
      INITIALIZE g_ecbduc_d TO NULL

      #add-point:複製取消後 name="reproduce.cancel"

      #end add-point
      CALL csft003_show()
      CALL csft003_idx_chk()   #(ver:83)
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ''
      LET g_errparam.code = 9001
      LET g_errparam.popup = FALSE
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF

   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL csft003_set_act_visible()
   CALL csft003_set_act_no_visible()

   #將新增的資料併入搜尋條件中
   LET g_ecbcucdocno_t = g_ecbcuc_m.ecbcucdocno
   LET g_ecbcuc001_t = g_ecbcuc_m.ecbcuc001
   LET g_ecbcuc002_t = g_ecbcuc_m.ecbcuc002
   LET g_ecbcuc003_t = g_ecbcuc_m.ecbcuc003


   #組合新增資料的條件
   LET g_add_browse = " ecbcucent = " ||g_enterprise|| " AND ecbcucsite = '" ||g_site|| "' AND",
                      " ecbcucdocno = '", g_ecbcuc_m.ecbcucdocno, "' "
                      ," AND ecbcuc001 = '", g_ecbcuc_m.ecbcuc001, "' "
                      ," AND ecbcuc002 = '", g_ecbcuc_m.ecbcuc002, "' "
                      ," AND ecbcuc003 = '", g_ecbcuc_m.ecbcuc003, "' "

   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL csft003_browser_fill("")

   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)

   #add-point:完成複製段落後 name="reproduce.after_reproduce"

   #end add-point

   CALL csft003_idx_chk()

   LET g_data_owner = g_ecbcuc_m.ecbcucownid
   LET g_data_dept  = g_ecbcuc_m.ecbcucowndp

   #功能已完成,通報訊息中心
   CALL csft003_msgcentre_notify('reproduce')

END FUNCTION

{</section>}

{<section id="csft003.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION csft003_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"

   #end add-point
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE ecbduc_t.* #此變數樣板目前無使用


   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"

   #end add-point

   #add-point:Function前置處理  name="detail_reproduce.pre_function"

   #end add-point

   CALL s_transaction_begin()

   LET ld_date = cl_get_current()

   DROP TABLE csft003_detail

   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"

   #end add-point

   #CREATE TEMP TABLE
   SELECT * FROM ecbduc_t
    WHERE ecbducent = g_enterprise AND ecbducsite = g_site AND ecbducdocno = g_ecbcucdocno_t
     AND ecbduc001 = g_ecbcuc001_t
     AND ecbduc002 = g_ecbcuc002_t
     AND ecbduc003 = g_ecbcuc003_t

    INTO TEMP csft003_detail

   #將key修正為調整後
   UPDATE csft003_detail
      #更新key欄位
      SET ecbducdocno = g_ecbcuc_m.ecbcucdocno
          , ecbduc001 = g_ecbcuc_m.ecbcuc001
          , ecbduc002 = g_ecbcuc_m.ecbcuc002
          , ecbduc003 = g_ecbcuc_m.ecbcuc003

      #更新共用欄位


   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"

   #end add-point

   #將資料塞回原table
   INSERT INTO ecbduc_t SELECT * FROM csft003_detail

   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "reproduce:",SQLERRMESSAGE
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN
   END IF

   #add-point:單身複製中1 name="detail_reproduce.body.table1.m_insert"

   #end add-point

   #刪除TEMP TABLE
   DROP TABLE csft003_detail

   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"

   #end add-point





   #多語言複製段落


   CALL s_transaction_end('Y','0')

   #已新增完, 調整資料內容(修改時使用)
   LET g_ecbcucdocno_t = g_ecbcuc_m.ecbcucdocno
   LET g_ecbcuc001_t = g_ecbcuc_m.ecbcuc001
   LET g_ecbcuc002_t = g_ecbcuc_m.ecbcuc002
   LET g_ecbcuc003_t = g_ecbcuc_m.ecbcuc003


END FUNCTION

{</section>}

{<section id="csft003.delete" >}
#+ 資料刪除
PRIVATE FUNCTION csft003_delete()
   #add-point:delete段define(客製用) name="delete.define_customerization"

   #end add-point
   DEFINE  l_var_keys      DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys    DYNAMIC ARRAY OF STRING
   DEFINE  l_vars          DYNAMIC ARRAY OF STRING
   DEFINE  l_fields        DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak  DYNAMIC ARRAY OF STRING
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete.define"

   #end add-point

   #add-point:Function前置處理  name="delete.pre_function"

   #end add-point

   IF g_ecbcuc_m.ecbcucdocno IS NULL
   OR g_ecbcuc_m.ecbcuc001 IS NULL
   OR g_ecbcuc_m.ecbcuc002 IS NULL
   OR g_ecbcuc_m.ecbcuc003 IS NULL

   THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ""
      LET g_errparam.code = "std-00003"
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN
   END IF



   CALL s_transaction_begin()

   OPEN csft003_cl USING g_enterprise, g_site,g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcuc001,g_ecbcuc_m.ecbcuc002,g_ecbcuc_m.ecbcuc003
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "OPEN csft003_cl:",SQLERRMESSAGE
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE
      CLOSE csft003_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF

   #顯示最新的資料
   EXECUTE csft003_master_referesh USING g_site,g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcuc001,g_ecbcuc_m.ecbcuc002,
       g_ecbcuc_m.ecbcuc003 INTO g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcucdocdt,g_ecbcuc_m.ecbcuc008,
       g_ecbcuc_m.ecbcuc003,g_ecbcuc_m.ecbcuc004,g_ecbcuc_m.ecbcuc005,g_ecbcuc_m.ecbcuc006,g_ecbcuc_m.ecbcuc002,
       g_ecbcuc_m.ecbcuc007,g_ecbcuc_m.ecbcuc011,g_ecbcuc_m.ecbcuc001,g_ecbcuc_m.ecbcucstus,g_ecbcuc_m.ecbcucownid,
       g_ecbcuc_m.ecbcucowndp,g_ecbcuc_m.ecbcuccrtid,g_ecbcuc_m.ecbcuccrtdp,g_ecbcuc_m.ecbcuccrtdt,g_ecbcuc_m.ecbcucmodid,
       g_ecbcuc_m.ecbcucmoddt,g_ecbcuc_m.ecbcuc003_desc,g_ecbcuc_m.ecbcuc006_desc,g_ecbcuc_m.ecbcuc007_desc,
       g_ecbcuc_m.ecbcucownid_desc,g_ecbcuc_m.ecbcucowndp_desc,g_ecbcuc_m.ecbcuccrtid_desc,g_ecbcuc_m.ecbcuccrtdp_desc,
       g_ecbcuc_m.ecbcucmodid_desc


   #檢查是否允許此動作
   IF NOT csft003_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF

   #遮罩相關處理
   LET g_ecbcuc_m_mask_o.* =  g_ecbcuc_m.*
   CALL csft003_ecbcuc_t_mask()
   LET g_ecbcuc_m_mask_n.* =  g_ecbcuc_m.*

   CALL csft003_show()

   #add-point:delete段before ask name="delete.before_ask"

   #end add-point

   IF cl_ask_del_master() THEN              #確認一下

      #add-point:單頭刪除前 name="delete.head.b_delete"

      #end add-point

      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL csft003_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"

      #end add-point
      CALL cl_doc_remove()





      #資料備份
      LET g_ecbcucdocno_t = g_ecbcuc_m.ecbcucdocno
      LET g_ecbcuc001_t = g_ecbcuc_m.ecbcuc001
      LET g_ecbcuc002_t = g_ecbcuc_m.ecbcuc002
      LET g_ecbcuc003_t = g_ecbcuc_m.ecbcuc003


      DELETE FROM ecbcuc_t
       WHERE ecbcucent = g_enterprise AND ecbcucsite = g_site AND ecbcucdocno = g_ecbcuc_m.ecbcucdocno
         AND ecbcuc001 = g_ecbcuc_m.ecbcuc001
         AND ecbcuc002 = g_ecbcuc_m.ecbcuc002
         AND ecbcuc003 = g_ecbcuc_m.ecbcuc003


      #add-point:單頭刪除中 name="delete.head.m_delete"

      #end add-point

      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = g_ecbcuc_m.ecbcucdocno,":",SQLERRMESSAGE
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = FALSE
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF

      #add-point:單頭刪除後 name="delete.head.a_delete"
      IF NOT s_aooi200_del_docno(g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcucdocdt) THEN
         CALL s_transaction_end('N','0')
         RETURN
      END IF
      #end add-point

      #add-point:單身刪除前 name="delete.body.b_delete"

      #end add-point

      DELETE FROM ecbduc_t
       WHERE ecbducent = g_enterprise AND ecbducsite = g_site AND ecbducdocno = g_ecbcuc_m.ecbcucdocno
         AND ecbduc001 = g_ecbcuc_m.ecbcuc001
         AND ecbduc002 = g_ecbcuc_m.ecbcuc002
         AND ecbduc003 = g_ecbcuc_m.ecbcuc003


      #add-point:單身刪除中 name="delete.body.m_delete"

      #end add-point

      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "ecbduc_t:",SQLERRMESSAGE
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = FALSE
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF

      #add-point:單身刪除後 name="delete.body.a_delete"

      #end add-point







      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_ecbcuc_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE csft003_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF

      CLEAR FORM
      CALL g_ecbduc_d.clear()


      CALL csft003_ui_browser_refresh()
      #CALL csft003_ui_headershow()
      #CALL csft003_ui_detailshow()

      #add-point:多語言刪除 name="delete.lang.before_delete"

      #end add-point

      #單頭多語言刪除


      #單身多語言刪除



      #add-point:多語言刪除 name="delete.lang.delete"

      #end add-point

      IF g_browser_cnt > 0 THEN
         #CALL csft003_browser_fill("")
         CALL csft003_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF

      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF

   CLOSE csft003_cl

   #功能已完成,通報訊息中心
   CALL csft003_msgcentre_notify('delete')

END FUNCTION

{</section>}

{<section id="csft003.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION csft003_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"

   #end add-point
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"

   #end add-point

   #add-point:Function前置處理  name="b_fill.pre_function"

   #end add-point

   #清空第一階單身
   CALL g_ecbduc_d.clear()


   #add-point:b_fill段sql_before name="b_fill.sql_before"

   #end add-point

   #判斷是否填充
   IF csft003_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      #若有觸發條件(g_wc2)異動的任何行為都需添加在下方條件中,避免條件無正常刷新 ver:81
      IF (g_action_choice = "query" OR cl_null(g_action_choice) OR g_action_choice = "queryplan" OR
          g_action_choice = "insert" OR g_action_choice = "modify" OR g_action_choice = "reproduce" ) #ver:81 #ver:82
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"

      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT ecbducseq,ecbduc004,ecbduc005,ecbduc006,ecbduc008,ecbduc007 ,
             t1.ooag011 FROM ecbduc_t",
                     " INNER JOIN ecbcuc_t ON ecbcucent = " ||g_enterprise|| " AND ecbcucsite = '" ||g_site|| "' AND ecbcucdocno = ecbducdocno ",
                     " AND ecbcuc001 = ecbduc001 ",
                     " AND ecbcuc002 = ecbduc002 ",
                     " AND ecbcuc003 = ecbduc003 ",

                     #"",

                     "",
                     #下層單身所需的join條件

                                    " LEFT JOIN ooag_t t1 ON t1.ooagent="||g_enterprise||" AND t1.ooag001=ecbduc008  ",

                     " WHERE ecbducent=? AND ecbducsite=? AND ecbducdocno=? AND ecbduc001=? AND ecbduc002=? AND ecbduc003=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
         {
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF

         #子單身的WC


         LET g_sql = g_sql, " ORDER BY ecbduc_t.ecbduc004,ecbduc_t.ecbduc008,ecbduc_t.ecbducseq"

         #add-point:單身填充控制 name="b_fill.sql"
}
         #S---#C20180816-09415#1 add
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         LET g_sql = g_sql, " ORDER BY ecbducseq"

         #E---#C20180816-09415#1 add
         #end add-point

         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE csft003_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR csft003_pb
      END IF

      LET g_cnt = l_ac
      LET l_ac = 1

   #  OPEN b_fill_cs USING g_enterprise, g_site,g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcuc001,g_ecbcuc_m.ecbcuc002,g_ecbcuc_m.ecbcuc003   #(ver:78)

      FOREACH b_fill_cs USING g_enterprise, g_site,g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcuc001,g_ecbcuc_m.ecbcuc002,
          g_ecbcuc_m.ecbcuc003 INTO g_ecbduc_d[l_ac].ecbducseq,g_ecbduc_d[l_ac].ecbduc004,g_ecbduc_d[l_ac].ecbduc005,
          g_ecbduc_d[l_ac].ecbduc006,g_ecbduc_d[l_ac].ecbduc008,g_ecbduc_d[l_ac].ecbduc007,g_ecbduc_d[l_ac].ecbduc008_desc
            #(ver:78)
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE
            LET g_errparam.code = SQLCA.SQLCODE
            LET g_errparam.popup = TRUE
            CALL cl_err()
            EXIT FOREACH
         END IF

         #add-point:b_fill段資料填充 name="b_fill.fill"
#         SELECT ooag011 INTO g_ecbduc_d[l_ac].ecbduc008_desc   #C20180718-09415#1 mark
         SELECT ooag011,ooag003,ooefl003 INTO g_ecbduc_d[l_ac].ecbduc008_desc,g_ecbduc_d[l_ac].ecbduc008_desc_1,g_ecbduc_d[l_ac].ecbduc008_desc_1_desc   #C20180718-09415#1 ADD
           FROM ooag_t
           LEFT JOIN ooefl_t ON ooagent = ooeflent AND ooag003 = ooefl001 AND ooefl002 = g_dlang   #C20180718-09415#1 ADD
          WHERE ooagent = g_enterprise
            AND ooag001 = g_ecbduc_d[l_ac].ecbduc008
         #金额
         LET g_ecbduc_d[l_ac].l_jine = g_ecbduc_d[l_ac].ecbduc006 * g_ecbduc_d[l_ac].ecbduc007  #C20180816-09415#1 add
         #end add-point

         IF l_ac > g_max_rec THEN
            IF g_error_show = 1 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = l_ac
               LET g_errparam.code = 9035
               LET g_errparam.popup = TRUE
               CALL cl_err()
            END IF
            EXIT FOREACH
         END IF

         LET l_ac = l_ac + 1
      END FOREACH
      LET g_error_show = 0

   END IF



   #add-point:browser_fill段其他table處理 name="browser_fill.other_fill"

   #end add-point

   CALL g_ecbduc_d.deleteElement(g_ecbduc_d.getLength())



   LET l_ac = g_cnt
   LET g_cnt = 0

   FREE csft003_pb


   LET li_idx = l_ac

   #遮罩相關處理
   FOR l_ac = 1 TO g_ecbduc_d.getLength()
      LET g_ecbduc_d_mask_o[l_ac].* =  g_ecbduc_d[l_ac].*
      CALL csft003_ecbduc_t_mask()
      LET g_ecbduc_d_mask_n[l_ac].* =  g_ecbduc_d[l_ac].*
   END FOR



   LET l_ac = li_idx

   CALL cl_ap_performance_next_end()

END FUNCTION

{</section>}

{<section id="csft003.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION csft003_delete_b(ps_table,ps_keys_bak,ps_page)
   #add-point:delete_b段define(客製用) name="delete_b.define_customerization"

   #end add-point
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys_bak DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   DEFINE li_idx      LIKE type_t.num10
   #add-point:delete_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete_b.define"

   #end add-point

   #add-point:Function前置處理  name="delete_b.pre_function"

   #end add-point

   LET g_update = TRUE

   #判斷是否是同一群組的table
   LET ls_group = "'1',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前 name="delete_b.b_delete"

      #end add-point
      DELETE FROM ecbduc_t
       WHERE ecbducent = g_enterprise AND ecbducsite = g_site AND
         ecbducdocno = ps_keys_bak[1] AND ecbduc001 = ps_keys_bak[2] AND ecbduc002 = ps_keys_bak[3] AND ecbduc003 = ps_keys_bak[4] AND ecbduc004 = ps_keys_bak[5] AND ecbduc008 = ps_keys_bak[6] AND ecbducseq = ps_keys_bak[7]
      #add-point:delete_b段刪除中 name="delete_b.m_delete"

      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = ":",SQLERRMESSAGE
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = FALSE
         CALL cl_err()
         RETURN FALSE
      END IF
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN
         CALL g_ecbduc_d.deleteElement(li_idx)
      END IF

   END IF





   #add-point:delete_b段other name="delete_b.other"

   #end add-point

   RETURN TRUE

END FUNCTION

{</section>}

{<section id="csft003.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION csft003_insert_b(ps_table,ps_keys,ps_page)
   #add-point:insert_b段define(客製用) name="insert_b.define_customerization"

   #end add-point
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys     DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   DEFINE ls_page     STRING
   DEFINE li_idx      LIKE type_t.num10
   #add-point:insert_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert_b.define"

   #end add-point

   #add-point:Function前置處理  name="insert_b.pre_function"

   #end add-point

   LET g_update = TRUE

   #判斷是否是同一群組的table
   LET ls_group = "'1',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前 name="insert_b.before_insert"

      #end add-point
      INSERT INTO ecbduc_t
                  (ecbducent, ecbducsite,
                   ecbducdocno,ecbduc001,ecbduc002,ecbduc003,
                   ecbduc004,ecbduc008,ecbducseq
                   ,ecbduc005,ecbduc006,ecbduc007)
            VALUES(g_enterprise, g_site,
                   ps_keys[1],ps_keys[2],ps_keys[3],ps_keys[4],ps_keys[5],ps_keys[6],ps_keys[7]
                   ,g_ecbduc_d[g_detail_idx].ecbduc005,g_ecbduc_d[g_detail_idx].ecbduc006,g_ecbduc_d[g_detail_idx].ecbduc007)

      #add-point:insert_b段資料新增中 name="insert_b.m_insert"

      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "ecbduc_t:",SQLERRMESSAGE
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = FALSE
         CALL cl_err()
      END IF

      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN
         CALL g_ecbduc_d.insertElement(li_idx)
      END IF

      #add-point:insert_b段資料新增後 name="insert_b.after_insert"

      #end add-point
   END IF





   #add-point:insert_b段other name="insert_b.other"

   #end add-point

END FUNCTION

{</section>}

{<section id="csft003.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION csft003_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
   #add-point:update_b段define(客製用) name="update_b.define_customerization"

   #end add-point
   DEFINE ps_table         STRING
   DEFINE ps_page          STRING
   DEFINE ps_keys          DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ps_keys_bak      DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group         STRING
   DEFINE li_idx           LIKE type_t.num10
   DEFINE lb_chk           BOOLEAN
   DEFINE l_new_key        DYNAMIC ARRAY OF STRING
   DEFINE l_old_key        DYNAMIC ARRAY OF STRING
   DEFINE l_field_key      DYNAMIC ARRAY OF STRING
   #add-point:update_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="update_b.define"

   #end add-point

   #add-point:Function前置處理  name="update_b.pre_function"

   #end add-point

   LET g_update = TRUE

   #判斷key是否有改變
   LET lb_chk = TRUE
   FOR li_idx = 1 TO ps_keys.getLength()
      IF ps_keys[li_idx] <> ps_keys_bak[li_idx] THEN
         LET lb_chk = FALSE
         EXIT FOR
      END IF
   END FOR

   #不需要做處理
   IF lb_chk THEN
      RETURN
   END IF

   #判斷是否是同一群組的table
   LET ls_group = "'1',"
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "ecbduc_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"

      #end add-point

      #將遮罩欄位還原
      CALL csft003_ecbduc_t_mask_restore('restore_mask_o')

      UPDATE ecbduc_t
         SET (ecbducdocno,ecbduc001,ecbduc002,ecbduc003,
              ecbduc004,ecbduc008,ecbducseq
              ,ecbduc005,ecbduc006,ecbduc007)
              =
             (ps_keys[1],ps_keys[2],ps_keys[3],ps_keys[4],ps_keys[5],ps_keys[6],ps_keys[7]
              ,g_ecbduc_d[g_detail_idx].ecbduc005,g_ecbduc_d[g_detail_idx].ecbduc006,g_ecbduc_d[g_detail_idx].ecbduc007)

         WHERE ecbducent = g_enterprise AND ecbducsite = g_site AND ecbducdocno = ps_keys_bak[1] AND ecbduc001 = ps_keys_bak[2] AND ecbduc002 = ps_keys_bak[3] AND ecbduc003 = ps_keys_bak[4] AND ecbduc004 = ps_keys_bak[5] AND ecbduc008 = ps_keys_bak[6] AND ecbducseq = ps_keys_bak[7]
      #add-point:update_b段修改中 name="update_b.m_update"

      #end add-point
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "ecbduc_t"
            LET g_errparam.code = "std-00009"
            LET g_errparam.popup = TRUE
            CALL s_transaction_end('N','0')
            CALL cl_err()

         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "ecbduc_t:",SQLERRMESSAGE
            LET g_errparam.code = SQLCA.SQLCODE
            LET g_errparam.popup = TRUE
            CALL s_transaction_end('N','0')
            CALL cl_err()

         OTHERWISE

      END CASE

      #將遮罩欄位進行遮蔽
      CALL csft003_ecbduc_t_mask_restore('restore_mask_n')

      #add-point:update_b段修改後 name="update_b.after_update"

      #end add-point
   END IF

   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN

   END IF






   #add-point:update_b段other name="update_b.other"

   #end add-point

END FUNCTION

{</section>}

{<section id="csft003.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION csft003_key_update_b(ps_keys_bak,ps_table)
   #add-point:update_b段define(客製用) name="key_update_b.define_customerization"

   #end add-point
   DEFINE ps_keys_bak       DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ps_table          STRING
   DEFINE l_field_key       DYNAMIC ARRAY OF STRING
   DEFINE l_var_keys_bak    DYNAMIC ARRAY OF STRING
   DEFINE l_new_key         DYNAMIC ARRAY OF STRING
   DEFINE l_old_key         DYNAMIC ARRAY OF STRING
   #add-point:update_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="key_update_b.define"

   #end add-point

   #add-point:Function前置處理  name="key_update_b.pre_function"

   #end add-point



END FUNCTION

{</section>}

{<section id="csft003.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION csft003_key_delete_b(ps_keys_bak,ps_table)
   #add-point:delete_b段define(客製用) name="key_delete_b.define_customerization"

   #end add-point
   DEFINE ps_keys_bak       DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ps_table          STRING
   DEFINE l_field_keys      DYNAMIC ARRAY OF STRING
   DEFINE l_var_keys_bak    DYNAMIC ARRAY OF STRING
   DEFINE l_new_key         DYNAMIC ARRAY OF STRING
   DEFINE l_old_key         DYNAMIC ARRAY OF STRING
   #add-point:delete_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="key_delete_b.define"

   #end add-point

   #add-point:Function前置處理  name="key_delete_b.pre_function"

   #end add-point



   RETURN TRUE

END FUNCTION

{</section>}

{<section id="csft003.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION csft003_lock_b(ps_table,ps_page)
   #add-point:lock_b段define(客製用) name="lock_b.define_customerization"

   #end add-point
   DEFINE ps_page     STRING
   DEFINE ps_table    STRING
   DEFINE ls_group    STRING
   #add-point:lock_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="lock_b.define"

   #end add-point

   #add-point:Function前置處理  name="lock_b.pre_function"

   #end add-point

   #先刷新資料
   #CALL csft003_b_fill()

   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "ecbduc_t"

   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN csft003_bcl USING g_enterprise, g_site,
                                       g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcuc001,g_ecbcuc_m.ecbcuc002,
                                           g_ecbcuc_m.ecbcuc003,g_ecbduc_d[g_detail_idx].ecbduc004,g_ecbduc_d[g_detail_idx].ecbduc008,
                                           g_ecbduc_d[g_detail_idx].ecbducseq
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "csft003_bcl:",SQLERRMESSAGE
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF





   #add-point:lock_b段other name="lock_b.other"

   #end add-point

   RETURN TRUE

END FUNCTION

{</section>}

{<section id="csft003.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION csft003_unlock_b(ps_table,ps_page)
   #add-point:unlock_b段define(客製用) name="unlock_b.define_customerization"

   #end add-point
   DEFINE ps_page     STRING
   DEFINE ps_table    STRING
   DEFINE ls_group    STRING
   #add-point:unlock_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="unlock_b.define"

   #end add-point

   #add-point:Function前置處理  name="unlock_b.pre_function"

   #end add-point

   LET ls_group = "'1',"

   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE csft003_bcl
   END IF





   #add-point:unlock_b段other name="unlock_b.other"

   #end add-point

END FUNCTION

{</section>}

{<section id="csft003.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION csft003_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"

   #end add-point
   DEFINE p_cmd   LIKE type_t.chr1
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"

   #end add-point

   #add-point:Function前置處理  name="set_entry.pre_function"

   #end add-point

   CALL cl_set_comp_entry("ecbcucdocno",TRUE)

   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("ecbcucdocno,ecbcuc001,ecbcuc002,ecbcuc003",TRUE)
      CALL cl_set_comp_entry("ecbcucdocdt",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      CALL cl_set_comp_entry("ecbcuc007",TRUE)    #C20180718-09415#1 add ecbcuc007
      #end add-point
   END IF

   #add-point:set_entry段欄位控制後 name="set_entry.after_control"

   #end add-point

END FUNCTION

{</section>}

{<section id="csft003.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION csft003_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   DEFINE l_count1         LIKE type_t.num5
   #end add-point
   DEFINE p_cmd   LIKE type_t.chr1
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"

   #end add-point

   #add-point:Function前置處理  name="set_no_entry.pre_function"

   #end add-point

   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("ecbcucdocno,ecbcuc001,ecbcuc002,ecbcuc003",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      CALL cl_set_comp_entry("ecbcucdocdt",FALSE)
      LET l_count1 = 0
      SELECT count(1) INTO l_count1
        FROM ecbduc_t
       WHERE ecbducent = g_enterprise
         AND ecbducsite = g_site
         AND ecbducdocno = g_ecbcuc_m.ecbcucdocno
         AND ecbduc001 = g_ecbcuc_m.ecbcuc001
         AND ecbduc002 = g_ecbcuc_m.ecbcuc002
         AND ecbduc003 = g_ecbcuc_m.ecbcuc003
      IF l_count1 = 0 THEN
         CALL cl_set_comp_entry("ecbcuc001,ecbcuc007",TRUE)    #C20180718-09415#1 add ecbcuc007
      ELSE
         CALL cl_set_comp_entry("ecbcuc001,ecbcuc007",FALSE)    #C20180718-09415#1 add ecbcuc007
      END IF
      #end add-point
   END IF

   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("ecbcucdocno",FALSE)
   END IF

#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("ecbcucdocdt",FALSE)
      END IF
#  END IF

   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("ecbcuc001,ecbcuc002,ecbcuc003",FALSE)  #C20180-801-09415#1 add ecbcuc001
   END IF
   #end add-point

END FUNCTION

{</section>}

{<section id="csft003.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION csft003_set_entry_b(p_cmd)
   #add-point:set_entry_b段define(客製用) name="set_entry_b.define_customerization"

   #end add-point
   DEFINE p_cmd   LIKE type_t.chr1
   #add-point:set_entry_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry_b.define"

   #end add-point

   #add-point:Function前置處理  name="set_entry_b.pre_function"

   #end add-point

   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("",TRUE)
      #add-point:set_entry段欄位控制 name="set_entry_b.field_control"

      #end add-point
   END IF

   #add-point:set_entry_b段 name="set_entry_b.set_entry_b"

   #end add-point
END FUNCTION

{</section>}

{<section id="csft003.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION csft003_set_no_entry_b(p_cmd)
   #add-point:set_no_entry_b段define(客製用) name="set_no_entry_b.define_customerization"

   #end add-point
   DEFINE p_cmd   LIKE type_t.chr1
   #add-point:set_no_entry_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry_b.define"

   #end add-point

   #add-point:Function前置處理  name="set_no_entry_b.pre_function"

   #end add-point

   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("",FALSE)
      #add-point:set_no_entry_b段欄位控制 name="set_no_entry_b.field_control"
      CALL cl_set_comp_entry("ecbduc004,ecbduc005,ecbduc006",FALSE)
      #end add-point
   END IF

   #add-point:set_no_entry_b段 name="set_no_entry_b.set_no_entry_b"
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("ecbduc004,ecbduc005,ecbduc006",TRUE)
   END IF
   #end add-point
END FUNCTION

{</section>}

{<section id="csft003.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION csft003_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"

   #end add-point
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"

   #end add-point
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
#   CALL cl_set_act_visible("statechange,insert,modify,modify_detail,delete,reproduce,mainhidden", TRUE)

   #end add-point
END FUNCTION

{</section>}

{<section id="csft003.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION csft003_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"

   #end add-point
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"

   #end add-point
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   #若無資料則關閉相關功能
   IF g_browser_cnt = 0 THEN
#      CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce,mainhidden", FALSE)    #C20180718-09415#2 mark
      CALL cl_navigator_setting(0,0)
   ELSE
      CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce,mainhidden", TRUE)
   END IF
   # N未確認/D抽單/R已拒絕允許修改
   IF g_ecbcuc_m.ecbcucstus NOT MATCHES "[NDR]" THEN
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   ELSE
      CALL cl_set_act_visible("modify,delete,modify_detail", TRUE)

   END IF

   #end add-point
END FUNCTION

{</section>}

{<section id="csft003.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION csft003_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"

   #end add-point
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"

   #end add-point
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"

   #end add-point
END FUNCTION

{</section>}

{<section id="csft003.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION csft003_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"

   #end add-point
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"

   #end add-point
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"

   #end add-point
END FUNCTION

{</section>}

{<section id="csft003.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION csft003_default_search()
   #add-point:default_search段define(客製用) name="default_search.define_customerization"

   #end add-point
   DEFINE li_idx     LIKE type_t.num10
   DEFINE li_cnt     LIKE type_t.num10
   DEFINE ls_wc      STRING
   DEFINE la_wc      DYNAMIC ARRAY OF RECORD
          tableid    STRING,
          wc         STRING
          END RECORD
   DEFINE ls_where   STRING
   #add-point:default_search段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="default_search.define"

   #end add-point

   #add-point:Function前置處理 name="default_search.before"

   #end add-point

   LET g_pagestart = 1

   IF cl_null(g_order) THEN
      LET g_order = "ASC"
   END IF

   IF NOT cl_null(g_argv[01]) THEN
      LET ls_wc = ls_wc, " ecbcucdocno = '", g_argv[01], "' AND "
   END IF

   IF NOT cl_null(g_argv[02]) THEN
      LET ls_wc = ls_wc, " ecbcuc001 = '", g_argv[02], "' AND "
   END IF
   IF NOT cl_null(g_argv[03]) THEN
      LET ls_wc = ls_wc, " ecbcuc002 = '", g_argv[03], "' AND "
   END IF
   IF NOT cl_null(g_argv[04]) THEN
      LET ls_wc = ls_wc, " ecbcuc003 = '", g_argv[04], "' AND "
   END IF


   #add-point:default_search段after sql name="default_search.after_sql"

   #end add-point

   IF NOT cl_null(ls_wc) THEN
      LET g_wc = ls_wc.subString(1,ls_wc.getLength()-5)
      LET g_default = TRUE
   ELSE
      #若無外部參數則預設為1=2
      LET g_default = FALSE

      #預設查詢條件
      CALL cl_qbe_get_default_qryplan() RETURNING ls_where
      IF NOT cl_null(ls_where) THEN
         CALL util.JSON.parse(ls_where, la_wc)
         INITIALIZE g_wc, g_wc2,g_wc2_table1,g_wc2_extend TO NULL

         FOR li_idx = 1 TO la_wc.getLength()
            CASE
               WHEN la_wc[li_idx].tableid = "ecbcuc_t"
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "ecbduc_t"
                  LET g_wc2_table1 = la_wc[li_idx].wc

               WHEN la_wc[li_idx].tableid = "EXTENDWC"
                  LET g_wc2_extend = la_wc[li_idx].wc
            END CASE
         END FOR
         IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1)

            OR NOT cl_null(g_wc2_extend)
            THEN
            #組合g_wc2
            IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
               LET g_wc2 = g_wc2_table1
            END IF

            IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
               LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
            END IF

            IF g_wc2.subString(1,5) = " AND " THEN
               LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
            END IF
         END IF
      END IF

      IF cl_null(g_wc) AND cl_null(g_wc2) THEN
         LET g_wc = " 1=2"
      END IF
   END IF

   #add-point:default_search段結束前 name="default_search.after"

   #end add-point

   IF g_wc.getIndexOf(" 1=2", 1) THEN
      LET g_default = TRUE
   END IF


END FUNCTION

{</section>}

{<section id="csft003.state_change" >}
   #應用 a09 樣板自動產生(Version:20)
#+ 確認碼變更
PRIVATE FUNCTION csft003_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   DEFINE l_count1   LIKE type_t.num5  #C20180613-09415#1 add by zhaoqn
   #end add-point
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"

   #end add-point

   #add-point:Function前置處理 name="statechange.before"

   #end add-point

   ERROR ""     #清空畫面右下側ERROR區塊

   IF g_ecbcuc_m.ecbcucdocno IS NULL
      OR g_ecbcuc_m.ecbcuc001 IS NULL      OR g_ecbcuc_m.ecbcuc002 IS NULL      OR g_ecbcuc_m.ecbcuc003 IS NULL
   THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ""
      LET g_errparam.code   = "std-00003"
      LET g_errparam.popup = FALSE
      CALL cl_err()
      RETURN
   END IF

   CALL s_transaction_begin()

   OPEN csft003_cl USING g_enterprise, g_site,g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcuc001,g_ecbcuc_m.ecbcuc002,g_ecbcuc_m.ecbcuc003
   IF SQLCA.SQLCODE THEN
      CLOSE csft003_cl
   #  CALL s_transaction_end('N','0')   #(ver:19)
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "OPEN csft003_cl:",SQLERRMESSAGE
      LET g_errparam.code   = SQLCA.SQLCODE
      LET g_errparam.popup = TRUE
      CALL s_transaction_end('N','0')   #(ver:19)
      CALL cl_err()
      RETURN
   END IF

   #顯示最新的資料
   EXECUTE csft003_master_referesh USING g_site,g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcuc001,g_ecbcuc_m.ecbcuc002,
       g_ecbcuc_m.ecbcuc003 INTO g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcucdocdt,g_ecbcuc_m.ecbcuc008,
       g_ecbcuc_m.ecbcuc003,g_ecbcuc_m.ecbcuc004,g_ecbcuc_m.ecbcuc005,g_ecbcuc_m.ecbcuc006,g_ecbcuc_m.ecbcuc002,
       g_ecbcuc_m.ecbcuc007,g_ecbcuc_m.ecbcuc011,g_ecbcuc_m.ecbcuc001,g_ecbcuc_m.ecbcucstus,g_ecbcuc_m.ecbcucownid,
       g_ecbcuc_m.ecbcucowndp,g_ecbcuc_m.ecbcuccrtid,g_ecbcuc_m.ecbcuccrtdp,g_ecbcuc_m.ecbcuccrtdt,g_ecbcuc_m.ecbcucmodid,
       g_ecbcuc_m.ecbcucmoddt,g_ecbcuc_m.ecbcuc003_desc,g_ecbcuc_m.ecbcuc006_desc,g_ecbcuc_m.ecbcuc007_desc,
       g_ecbcuc_m.ecbcucownid_desc,g_ecbcuc_m.ecbcucowndp_desc,g_ecbcuc_m.ecbcuccrtid_desc,g_ecbcuc_m.ecbcuccrtdp_desc,
       g_ecbcuc_m.ecbcucmodid_desc


   #檢查是否允許此動作
   IF NOT csft003_action_chk() THEN
      CLOSE csft003_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF

   #將資料顯示到畫面上
   DISPLAY BY NAME g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcucdocno_desc,g_ecbcuc_m.ecbcucdocdt,g_ecbcuc_m.ecbcuc008,
       g_ecbcuc_m.ecbcuc003,g_ecbcuc_m.ecbcuc003_desc,g_ecbcuc_m.ecbcuc004,g_ecbcuc_m.ecbcuc005,g_ecbcuc_m.ecbcuc006,
       g_ecbcuc_m.ecbcuc006_desc,g_ecbcuc_m.ecbcuc002,g_ecbcuc_m.ecbcuc002_desc_1,g_ecbcuc_m.ecbcuc002_desc_5,
       g_ecbcuc_m.ecbcuc002_desc_2,g_ecbcuc_m.ecbcuc002_desc_6,g_ecbcuc_m.ecbcuc002_desc_3,g_ecbcuc_m.ecbcuc007,
       g_ecbcuc_m.ecbcuc007_desc,g_ecbcuc_m.ecbcuc002_desc_4,g_ecbcuc_m.l_sum,g_ecbcuc_m.ecbcuc011,g_ecbcuc_m.ecbcuc001,
       g_ecbcuc_m.ecbcucstus,g_ecbcuc_m.ecbcucownid,g_ecbcuc_m.ecbcucownid_desc,g_ecbcuc_m.ecbcucowndp,
       g_ecbcuc_m.ecbcucowndp_desc,g_ecbcuc_m.ecbcuccrtid,g_ecbcuc_m.ecbcuccrtid_desc,g_ecbcuc_m.ecbcuccrtdp,
       g_ecbcuc_m.ecbcuccrtdp_desc,g_ecbcuc_m.ecbcuccrtdt,g_ecbcuc_m.ecbcucmodid,g_ecbcuc_m.ecbcucmodid_desc,
       g_ecbcuc_m.ecbcucmoddt

   CASE g_ecbcuc_m.ecbcucstus
      WHEN "N"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
      WHEN "Y"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
      WHEN "S"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
      WHEN "Z"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
      WHEN "X"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")

   END CASE

   #add-point:資料刷新後 name="statechange.after_refresh"

   #end add-point

   MENU "" ATTRIBUTES (STYLE="popup")
      BEFORE MENU
         HIDE OPTION "approved"
         HIDE OPTION "rejection"
         CASE g_ecbcuc_m.ecbcucstus

            WHEN "N"
               HIDE OPTION "unconfirmed"
            WHEN "Y"
               HIDE OPTION "confirmed"
            WHEN "S"
               HIDE OPTION "posted"
            WHEN "Z"
               HIDE OPTION "unposted"
            WHEN "X"
               HIDE OPTION "invalid"
         END CASE

      #add-point:menu前 name="statechange.before_menu"
#将一些不能切换的状态给隐藏掉，比如post时只能切confimed，不可切unconfirmed和invalid
      IF g_ecbcuc_m.ecbcucstus = 'X' THEN
         CALL s_transaction_end('N','0')   #160812-00017#3 Add By Ken 160815
         RETURN
      END IF

      HIDE OPTION "closed"
      HIDE OPTION "hold"
      CASE g_ecbcuc_m.ecbcucstus
         WHEN "N"
            HIDE OPTION "unconfirmed"
            HIDE OPTION "posted"
            HIDE OPTION "unposted"
         WHEN "X"
            HIDE OPTION "invalid"
            HIDE OPTION "confirmed"
            HIDE OPTION "posted"
            HIDE OPTION "unposted"
            HIDE OPTION "hold"
         WHEN "Y"
         #S--#C20180613-09415#1 add by zhaoqn
            #如果派工单在csft004中存在则，派工单不允许取消审核
            LET l_count1 = 0
            SELECT COUNT(1) INTO l_count1
              FROM ecbfuc_t,ecbeuc_t
             WHERE ecbeucent = ecbfucent
               AND ecbeucsite = ecbfucsite
               AND ecbeucdocno = ecbfucdocno
               AND ecbfucent = g_enterprise
               AND ecbfucsite = g_site
               AND ecbfuc001 = g_ecbcuc_m.ecbcucdocno
               AND ecbfucstus <> 'X'
            IF l_count1 > 0 THEN
               HIDE OPTION "unconfirmed"
            END IF
         #E--#C20180613-09415#1 add by zhaoqn
            HIDE OPTION "confirmed"
            HIDE OPTION "hold"
            HIDE OPTION "unposted"
            HIDE OPTION "posted"
         WHEN "S"
            HIDE OPTION "posted"
            HIDE OPTION "unconfirmed"
            HIDE OPTION "invalid"
            HIDE OPTION "confirmed"
            #MOD BY zhujing 2015-6-16 应该根据状态码隐藏posted 和unposted以及withdraw

      END CASE


      #end add-point



      ON ACTION unconfirmed
         IF cl_auth_chk_act("unconfirmed") THEN
            LET lc_state = "N"
            #add-point:action控制 name="statechange.unconfirmed"
            IF g_ecbcuc_m.ecbcucstus NOT MATCHES '[XY]' THEN
               CALL s_transaction_end('N','0')   #160812-00017#3 Add By Ken 160815
               RETURN
            END IF
            IF NOT cl_ask_confirm('aim-00110') THEN
               CALL s_transaction_end('N','0')   #160812-00017#3 Add By Ken 160815
               RETURN
            END IF
            #end add-point
         END IF
         EXIT MENU
      ON ACTION confirmed
         IF cl_auth_chk_act("confirmed") THEN
            LET lc_state = "Y"
            #add-point:action控制 name="statechange.confirmed"
            IF g_ecbcuc_m.ecbcucstus NOT MATCHES '[NA]' THEN #MOD BY zhujing 2015-6-16
               CALL s_transaction_end('N','0')   #160812-00017#3 Add By Ken 160815
               RETURN
            END IF
            IF NOT cl_ask_confirm('aim-00108') THEN
               CALL s_transaction_end('N','0')   #160812-00017#3 Add By Ken 160815
               RETURN
            END IF
            #end add-point
         END IF
         EXIT MENU
      ON ACTION posted
         IF cl_auth_chk_act("posted") THEN
            LET lc_state = "S"
            #add-point:action控制 name="statechange.posted"
            IF NOT cl_ask_confirm('sub-00360') THEN
               CALL s_transaction_end('N','0')   #160812-00017#3 Add By Ken 160815
               RETURN
            END IF
            #end add-point
         END IF
         EXIT MENU
      ON ACTION unposted
         IF cl_auth_chk_act("unposted") THEN
            LET lc_state = "Z"
            #add-point:action控制 name="statechange.unposted"
            IF NOT cl_ask_confirm('sub-00361') THEN
               CALL s_transaction_end('N','0')   #160812-00017#3 Add By Ken 160815
               RETURN
            END IF
            #end add-point
         END IF
         EXIT MENU
      ON ACTION invalid
         IF cl_auth_chk_act("invalid") THEN
            LET lc_state = "X"
            #add-point:action控制 name="statechange.invalid"
            #仅当状态为 N.未审核 时,才可以切换为X.作废
            IF g_ecbcuc_m.ecbcucstus NOT MATCHES '[NDR]' THEN
               CALL s_transaction_end('N','0')   #160812-00017#3 Add By Ken 160815
               RETURN
            END IF
            IF NOT cl_ask_confirm('aim-00109') THEN
               CALL s_transaction_end('N','0')   #160812-00017#3 Add By Ken 160815
               RETURN
            END IF
            #end add-point
         END IF
         EXIT MENU

      #add-point:stus控制 name="statechange.more_control"

      #end add-point

   END MENU
   LET INT_FLAG=FALSE  #(ver.18)

   #確認被選取的狀態碼在清單中
   IF (lc_state <> "N"
      AND lc_state <> "Y"
      AND lc_state <> "S"
      AND lc_state <> "Z"
      AND lc_state <> "X"
      ) OR
      g_ecbcuc_m.ecbcucstus = lc_state OR cl_null(lc_state) THEN
      CLOSE csft003_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF

   #add-point:stus修改前 name="statechange.b_update"

   #end add-point

   LET g_ecbcuc_m.ecbcucmodid = g_user
   LET g_ecbcuc_m.ecbcucmoddt = cl_get_current()
   LET g_ecbcuc_m.ecbcucstus = lc_state

   #異動狀態碼欄位/修改人/修改日期
   UPDATE ecbcuc_t
      SET (ecbcucstus,ecbcucmodid,ecbcucmoddt)
        = (g_ecbcuc_m.ecbcucstus,g_ecbcuc_m.ecbcucmodid,g_ecbcuc_m.ecbcucmoddt)
    WHERE ecbcucent = g_enterprise AND ecbcucsite = g_site AND ecbcucdocno = g_ecbcuc_m.ecbcucdocno
      AND ecbcuc001 = g_ecbcuc_m.ecbcuc001      AND ecbcuc002 = g_ecbcuc_m.ecbcuc002      AND ecbcuc003 = g_ecbcuc_m.ecbcuc003

   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ""
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.popup = FALSE
      CALL cl_err()
   ELSE
      CASE lc_state
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "S"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
         WHEN "Z"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")

      END CASE

      #撈取異動後的資料
      EXECUTE csft003_master_referesh USING g_site,g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcuc001,g_ecbcuc_m.ecbcuc002,
          g_ecbcuc_m.ecbcuc003 INTO g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcucdocdt,g_ecbcuc_m.ecbcuc008,
          g_ecbcuc_m.ecbcuc003,g_ecbcuc_m.ecbcuc004,g_ecbcuc_m.ecbcuc005,g_ecbcuc_m.ecbcuc006,g_ecbcuc_m.ecbcuc002,
          g_ecbcuc_m.ecbcuc007,g_ecbcuc_m.ecbcuc011,g_ecbcuc_m.ecbcuc001,g_ecbcuc_m.ecbcucstus,g_ecbcuc_m.ecbcucownid,
          g_ecbcuc_m.ecbcucowndp,g_ecbcuc_m.ecbcuccrtid,g_ecbcuc_m.ecbcuccrtdp,g_ecbcuc_m.ecbcuccrtdt,
          g_ecbcuc_m.ecbcucmodid,g_ecbcuc_m.ecbcucmoddt,g_ecbcuc_m.ecbcuc003_desc,g_ecbcuc_m.ecbcuc006_desc,
          g_ecbcuc_m.ecbcuc007_desc,g_ecbcuc_m.ecbcucownid_desc,g_ecbcuc_m.ecbcucowndp_desc,g_ecbcuc_m.ecbcuccrtid_desc,
          g_ecbcuc_m.ecbcuccrtdp_desc,g_ecbcuc_m.ecbcucmodid_desc

      #將資料顯示到畫面上
      DISPLAY BY NAME g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcucdocno_desc,g_ecbcuc_m.ecbcucdocdt,g_ecbcuc_m.ecbcuc008,
          g_ecbcuc_m.ecbcuc003,g_ecbcuc_m.ecbcuc003_desc,g_ecbcuc_m.ecbcuc004,g_ecbcuc_m.ecbcuc005,g_ecbcuc_m.ecbcuc006,
          g_ecbcuc_m.ecbcuc006_desc,g_ecbcuc_m.ecbcuc002,g_ecbcuc_m.ecbcuc002_desc_1,g_ecbcuc_m.ecbcuc002_desc_5,
          g_ecbcuc_m.ecbcuc002_desc_2,g_ecbcuc_m.ecbcuc002_desc_6,g_ecbcuc_m.ecbcuc002_desc_3,g_ecbcuc_m.ecbcuc007,
          g_ecbcuc_m.ecbcuc007_desc,g_ecbcuc_m.ecbcuc002_desc_4,g_ecbcuc_m.l_sum,g_ecbcuc_m.ecbcuc011,
          g_ecbcuc_m.ecbcuc001,g_ecbcuc_m.ecbcucstus,g_ecbcuc_m.ecbcucownid,g_ecbcuc_m.ecbcucownid_desc,
          g_ecbcuc_m.ecbcucowndp,g_ecbcuc_m.ecbcucowndp_desc,g_ecbcuc_m.ecbcuccrtid,g_ecbcuc_m.ecbcuccrtid_desc,
          g_ecbcuc_m.ecbcuccrtdp,g_ecbcuc_m.ecbcuccrtdp_desc,g_ecbcuc_m.ecbcuccrtdt,g_ecbcuc_m.ecbcucmodid,
          g_ecbcuc_m.ecbcucmodid_desc,g_ecbcuc_m.ecbcucmoddt
   END IF

   #add-point:stus修改後 name="statechange.a_update"

   #end add-point

   #add-point:statechange段結束前 name="statechange.after"

   #end add-point

   CLOSE csft003_cl
   CALL s_transaction_end('Y','0')

   #(ver:20) ---start---
   #add-point:transaction結束後 name="statechange.transaction_after"

   #end add-point
   #(ver:20) --- end ---

   #功能已完成,通報訊息中心
   CALL csft003_msgcentre_notify('statechange:'||lc_state)

END FUNCTION




{</section>}

{<section id="csft003.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION csft003_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"

   #end add-point
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"

   #end add-point

   #add-point:Function前置處理  name="idx_chk.pre_function"

   #end add-point

   LET g_curr_diag = ui.DIALOG.getCurrent()   #(ver:83)

   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_ecbduc_d.getLength() THEN
         LET g_detail_idx = g_ecbduc_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_ecbduc_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_ecbduc_d.getLength() TO FORMONLY.cnt
   END IF



   #add-point:idx_chk段other name="idx_chk.other"

   #end add-point

END FUNCTION

{</section>}

{<section id="csft003.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION csft003_b_fill2(pi_idx)
   #add-point:b_fill2段define(客製用) name="b_fill2.define_customerization"

   #end add-point
   DEFINE pi_idx                 LIKE type_t.num10
   DEFINE li_ac                  LIKE type_t.num10
   DEFINE li_detail_idx_tmp      LIKE type_t.num10
   DEFINE ls_chk                 LIKE type_t.chr1
   #add-point:b_fill2段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill2.define"

   #end add-point

   #add-point:Function前置處理  name="b_fill2.pre_function"

   #end add-point

   LET li_ac = l_ac

   IF g_detail_idx <= 0 THEN
      RETURN
   END IF

   LET li_detail_idx_tmp = g_detail_idx





   #add-point:單身填充後 name="b_fill2.after_fill"

   #end add-point

   LET l_ac = li_ac

   CALL csft003_detail_show()

   LET g_detail_idx = li_detail_idx_tmp

END FUNCTION

{</section>}

{<section id="csft003.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION csft003_fill_chk(ps_idx)
   #add-point:fill_chk段define(客製用) name="fill_chk.define_customerization"

   #end add-point
   DEFINE ps_idx        LIKE type_t.chr10
   #add-point:fill_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="fill_chk.define"

   #end add-point

   #add-point:Function前置處理 name="fill_chk.before_chk"

   #end add-point

   #此funtion功能暫時停用(2015/1/12)
   #無論傳入值為何皆回傳true(代表要填充該單身)

   #全部為1=1 or null時回傳true
   IF (cl_null(g_wc2_table1) OR g_wc2_table1.trim() = '1=1') THEN
      #add-point:fill_chk段other_chk name="fill_chk.other_chk"

      #end add-point
      RETURN TRUE
   END IF

   #add-point:fill_chk段after_chk name="fill_chk.after_chk"

   #end add-point

   RETURN TRUE

END FUNCTION

{</section>}

{<section id="csft003.status_show" >}
PRIVATE FUNCTION csft003_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"

   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"

   #end add-point

   #add-point:status_show段status_show name="status_show.status_show"

   #end add-point
END FUNCTION

{</section>}

{<section id="csft003.mask_functions" >}
&include "erp/csf/csft003_mask.4gl"

{</section>}

{<section id="csft003.signature" >}


{</section>}

{<section id="csft003.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION csft003_set_pk_array()
   #add-point:set_pk_array段define name="set_pk_array.define_customerization"

   #end add-point
   #add-point:set_pk_array段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_pk_array.define"

   #end add-point

   #add-point:Function前置處理 name="set_pk_array.before"

   #end add-point

   #若l_ac<=0代表沒有資料
   IF l_ac <= 0 THEN
      RETURN
   END IF

   CALL g_pk_array.clear()
   LET g_pk_array[1].values = g_ecbcuc_m.ecbcucdocno
   LET g_pk_array[1].column = 'ecbcucdocno'
   LET g_pk_array[2].values = g_ecbcuc_m.ecbcuc001
   LET g_pk_array[2].column = 'ecbcuc001'
   LET g_pk_array[3].values = g_ecbcuc_m.ecbcuc002
   LET g_pk_array[3].column = 'ecbcuc002'
   LET g_pk_array[4].values = g_ecbcuc_m.ecbcuc003
   LET g_pk_array[4].column = 'ecbcuc003'

   #add-point:set_pk_array段之後 name="set_pk_array.after"

   #end add-point

END FUNCTION




{</section>}

{<section id="csft003.other_dialog" readonly="Y" >}


{</section>}

{<section id="csft003.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION csft003_msgcentre_notify(lc_state)
   #add-point:msgcentre_notify段define name="msgcentre_notify.define_customerization"

   #end add-point
   DEFINE lc_state LIKE type_t.chr80
   #add-point:msgcentre_notify段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="msgcentre_notify.define"

   #end add-point

   #add-point:Function前置處理  name="msgcentre_notify.pre_function"

   #end add-point

   INITIALIZE g_msgparam TO NULL

   #action-id與狀態填寫
   LET g_msgparam.state = lc_state

   #PK資料填寫
   CALL csft003_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_ecbcuc_m)

   #add-point:msgcentre其他通知 name="msgcentre_notify.process"

   #end add-point

   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()

END FUNCTION




{</section>}

{<section id="csft003.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION csft003_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"

   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"

   #end add-point

   #add-point:action_chk段action_chk name="action_chk.action_chk"

   #end add-point

   RETURN TRUE

END FUNCTION

{</section>}

{<section id="csft003.other_function" readonly="Y" >}

################################################################################
# Descriptions...: 自动生成单身
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION csft003_ins_ecbduc(p_ecbcuc002,p_ecbcuc003)
DEFINE p_ecbcuc002               LIKE ecbcuc_t.ecbcuc003
DEFINE p_ecbcuc003               LIKE ecbcuc_t.ecbcuc003
DEFINE r_success                 LIKE type_t.num5
DEFINE l_sql                     STRING
DEFINE l_ecbbuc      RECORD
       ecbbuc004                 LIKE ecbbuc_t.ecbbuc004,   #工序代码
       ecbbuc005                 LIKE ecbbuc_t.ecbbuc005,   #工序说明
       ecbbuc008                 LIKE ecbbuc_t.ecbbuc008    #工序工价
   END RECORD

DEFINE l_ecbduc      RECORD
       ecbducent                 LIKE ecbduc_t.ecbducent,
       ecbducsite                LIKE ecbduc_t.ecbducsite,
       ecbducdocno               LIKE ecbduc_t.ecbducdocno,
       ecbduc001                 LIKE ecbduc_t.ecbduc001,
       ecbduc002                 LIKE ecbduc_t.ecbduc002,
       ecbduc003                 LIKE ecbduc_t.ecbduc003,
       ecbduc004                 LIKE ecbduc_t.ecbduc004,   #工序代码
       ecbduc005                 LIKE ecbduc_t.ecbduc005,   #工序说明
       ecbduc006                 LIKE ecbduc_t.ecbduc006,   #标准核算(工序工价)
       ecbduc007                 LIKE ecbduc_t.ecbduc007,   #派工数量
       ecbduc008                 LIKE ecbduc_t.ecbduc008,    #操作工编号
       ecbducseq                 LIKE ecbduc_t.ecbducseq    #项次   #C20180816-09415#1 add
   END RECORD
DEFINE l_count1                  LIKE type_t.num5

   LET r_success = TRUE
   INITIALIZE l_ecbbuc.* TO NULL
   INITIALIZE l_ecbduc.* TO NULL

   LET l_sql = " SELECT ecbbuc004,ecbbuc005,ecbbuc008 FROM ecbbuc_t ",
                "  WHERE ecbbucent = ",g_enterprise," ",
                "    AND ecbbucsite = '",g_site,"' ",
                "    AND ecbbuc001 = '",p_ecbcuc002,"'  ",
                "    AND ecbbuc002 = '",p_ecbcuc003,"'  "
   PREPARE sel_pre_01 FROM l_sql
   DECLARE sel_dec_01 CURSOR FOR sel_pre_01
   FOREACH sel_dec_01 INTO l_ecbbuc.ecbbuc004,l_ecbbuc.ecbbuc005,l_ecbbuc.ecbbuc008
      #S---#C20180816-09415#1 add
      SELECT max(ecbducseq)+1 INTO l_ecbduc.ecbducseq
        FROM ecbduc_t
       WHERE ecbducent = g_enterprise
         AND ecbducsite = g_site
         AND ecbducdocno = g_ecbcuc_m.ecbcucdocno
         AND ecbduc001 = g_ecbcuc_m.ecbcuc001
         AND ecbduc002 = g_ecbcuc_m.ecbcuc002
         AND ecbduc003 = g_ecbcuc_m.ecbcuc003
      IF cl_null(l_ecbduc.ecbducseq) OR l_ecbduc.ecbducseq = 0 THEN
         LET l_ecbduc.ecbducseq = 1
      END IF
      #E---#C20180816-09415#1 add
      LET l_ecbduc.ecbducent = g_enterprise
      LET l_ecbduc.ecbducsite = g_site
      LET l_ecbduc.ecbducdocno = g_ecbcuc_m.ecbcucdocno
      LET l_ecbduc.ecbduc001 = g_ecbcuc_m.ecbcuc001
      LET l_ecbduc.ecbduc002 = g_ecbcuc_m.ecbcuc002
      LET l_ecbduc.ecbduc003 = g_ecbcuc_m.ecbcuc003
      LET l_ecbduc.ecbduc004 = l_ecbbuc.ecbbuc004
      LET l_ecbduc.ecbduc005 = l_ecbbuc.ecbbuc005
      LET l_ecbduc.ecbduc006 = l_ecbbuc.ecbbuc008
      LET l_ecbduc.ecbduc007 = g_ecbcuc_m.ecbcuc005
#      LET l_ecbduc.ecbduc008 = g_user #mark by liuxuan180719
      LET l_ecbduc.ecbduc008 = g_ecbcuc_m.ecbcuc007  #add by liuxuan180719

      INSERT INTO ecbduc_t (ecbducent,ecbducsite,ecbducdocno,ecbduc001,ecbduc002,
                            ecbduc003,ecbduc004,ecbduc005,ecbduc006,ecbduc007,
                            ecbduc008,ecbducseq)  #C20180816-09415#1 add ecbducseq
                     VALUES(l_ecbduc.ecbducent,l_ecbduc.ecbducsite,l_ecbduc.ecbducdocno,l_ecbduc.ecbduc001,l_ecbduc.ecbduc002,
                            l_ecbduc.ecbduc003,l_ecbduc.ecbduc004,l_ecbduc.ecbduc005,l_ecbduc.ecbduc006,l_ecbduc.ecbduc007,
                            l_ecbduc.ecbduc008,l_ecbduc.ecbducseq)  #C20180816-09415#1 add l_ecbduc.ecbducseq
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "ecbduc_t:",SQLERRMESSAGE
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = FALSE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF

   END FOREACH
   LET l_count1 = 0
   SELECT count(1) INTO l_count1
     FROM ecbduc_t
    WHERE ecbducent = g_enterprise
      AND ecbducsite = g_site
      AND ecbducdocno = g_ecbcuc_m.ecbcucdocno
   IF l_count1 = 0 OR cl_null(l_count1) THEN
      LET r_success = FALSE

   END IF

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 单身拆分
# Memo...........:
# Usage..........: CALL csft003_ins_ecbduc_01(p_ecbduc007_o,p_ecbduc007_n)
#                  RETURNING 回传参数
# Input parameter: p_ecbduc007_o   拆分前派工数量
#                : p_ecbduc007_n   派工数量
# Return code....:
#                : r_success       TRUE/FALSE
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION csft003_ins_ecbduc_01(p_ecbduc007_o,p_ecbduc007_n)
DEFINE p_ecbduc007_n         LIKE ecbduc_t.ecbduc007
DEFINE p_ecbduc007_o         LIKE ecbduc_t.ecbduc007
DEFINE l_ecbduc007           LIKE ecbduc_t.ecbduc007
DEFINE l_ecbducseq           LIKE ecbduc_t.ecbducseq  #C20180816-09415#1 add
DEFINE r_success             LIKE type_t.num5

   LET r_success = TRUE
   IF l_ac = 0 THEN LET  l_ac = 1 END IF
#S----#C20180528-09415#1 add by zhaoqn
#   UPDATE ecbduc_t SET ecbduc007 = p_ecbduc007_n,
#                       ecbduc008 = g_ecbduc_d[l_ac].ecbduc008
#    WHERE ecbducent = g_enterprise
#      AND ecbducsite = g_site
#      AND ecbducdocno = g_ecbcuc_m.ecbcucdocno
#      AND ecbduc001 = g_ecbcuc_m.ecbcuc001
#      AND ecbduc002 = g_ecbcuc_m.ecbcuc002
#      AND ecbduc003 = g_ecbcuc_m.ecbcuc003
#      AND ecbduc004 = g_ecbduc_d_t.ecbduc004
#      AND ecbduc007 = p_ecbduc007_o
#      AND ecbduc008 = g_ecbduc_d_t.ecbduc008
#   IF SQLCA.SQLCODE THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.extend = "ecbduc_t:",SQLERRMESSAGE
#      LET g_errparam.code = SQLCA.SQLCODE
#      LET g_errparam.popup = FALSE
#      CALL cl_err()
#      LET r_success = FALSE
#      RETURN r_success
#   END IF
#   IF r_success THEN
#      CALL s_transaction_end('N','0')
#   ELSE
#      CALL s_transaction_end('Y','0')
#      CALL s_transaction_begin()
#   END IF
#E----#C20180528-09415#1 add by zhaoqn
   LET l_ecbduc007 = p_ecbduc007_o - p_ecbduc007_n
   #S---#C20180816-09415#1 add
   SELECT max(ecbducseq)+1 INTO l_ecbducseq
     FROM ecbduc_t
    WHERE ecbducent = g_enterprise
      AND ecbducsite = g_site
      AND ecbducdocno = g_ecbcuc_m.ecbcucdocno
      AND ecbduc001 = g_ecbcuc_m.ecbcuc001
      AND ecbduc002 = g_ecbcuc_m.ecbcuc002
      AND ecbduc003 = g_ecbcuc_m.ecbcuc003
   IF cl_null(l_ecbducseq) OR l_ecbducseq = 0 THEN
      LET l_ecbducseq = 1
   END IF
   #E---#C20180816-09415#1 add
   INSERT INTO ecbduc_t (ecbducent,ecbducsite,ecbducdocno,ecbduc001,ecbduc002,
                                ecbduc003,ecbduc004,ecbduc005,ecbduc006,ecbduc007,
                                ecbduc008,ecbducseq)  #C20180816-09415#1 add ecbducseq
                 VALUES (g_enterprise,g_site,g_ecbcuc_m.ecbcucdocno,g_ecbcuc_m.ecbcuc001,g_ecbcuc_m.ecbcuc002,
                         g_ecbcuc_m.ecbcuc003,g_ecbduc_d_t.ecbduc004,g_ecbduc_d_t.ecbduc005,g_ecbduc_d_t.ecbduc006,l_ecbduc007,
                         g_ecbduc_d_t.ecbduc008,l_ecbducseq)  #C20180816-09415#1 add  l_ecbducseq
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "ecbduc_t:",SQLERRMESSAGE
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.popup = FALSE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF






   return r_success
END FUNCTION


{</section>}

