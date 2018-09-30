#該程式未解開Section, 採用最新樣板產出!
{<section id="aglq810.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:15(2017-07-07 22:06:13), PR版次:0015(2017-07-08 10:08:35)
#+ Customerized Version.: SD版次:(), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000244
#+ Filename...: aglq810
#+ Description: 帳戶式資產負債表查詢作業
#+ Creator....: 02599(2014-05-17 15:02:35)
#+ Modifier...: 05488 -SD/PR- 05488
 
{</section>}
 
{<section id="aglq810.global" >}
#應用 q02 樣板自動產生(Version:46)
#add-point:填寫註解說明 name="global.memo"
#150910            2015/09/10 by 03538     呈現應依報表行序
#150827-00036#12   2015/10/13 by 02599     报表金额根据agli070中设置格式显示
#140314-00001#73   2015/12/08 By Hans      新增作業aglq937(合併報表帳戶式資產負債表查詢作業)
#160302-00006#1    2016/03/02 By 07675     原本单身为可查询作业，增加二次筛选功能
#160318-00025#36   2016/04/20 By 07959     將重複內容的錯誤訊息置換為公用錯誤訊息(r.v)
#160705-00042#11   2016/07/14 By sakura    程式中寫死g_prog部分改寫MATCHES方式
#160811-00039#4    2016/08/29 By 02599     查询是自行输入账套时要检核账套权限
#170301-00017#3    2017/03/02 By 09276     修改g_prog的判斷
#170222-00003#2    2017/03/10 By 01531     排除年結和月結的數字
#170320-00048#1    2017/03/27 By 01531     期别，需要根据“账套” 串 “会计周期参照表”进行期别检核
#170320-00048#2    2017/03/27 By 07900     aglq*的查询作业，在下期别时，需要根据“账套” 串 “会计周期参照表”进行期别检核 
#170418-00002#1    2017/04/18 By Sabrina   當程式為aglq937時，抓取畫面上的期別
#170623-00034#6    2017/07/07 By Sabrina   (1)當程式為aglq937時，隱藏月結傳票/年結傳票欄位，依帳套判斷期別選項(月/季/半年)
#                                          (2)年初數改抓上一年度最大期別
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
#(ver:45) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:45) --- end ---
 
IMPORT os
IMPORT util
IMPORT JAVA com.fourjs.fgl.lang.FglRecord  #(ver:46) add
#add-point:增加匯入項目 name="global.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
#(ver:46) ---add start---
GLOBALS
#單身匯excel POI變數
TYPE rec_arr_type           ARRAY [] OF com.fourjs.fgl.lang.FglRecord
DEFINE g_export_tag         DYNAMIC ARRAY OF rec_arr_type                 #畫面欄位數
DEFINE g_export_tabname     DYNAMIC ARRAY OF STRING                       #畫面名稱
END GLOBALS
#(ver:46) --- add end ---
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
#單身 type 宣告
PRIVATE TYPE type_g_glfb_d RECORD
       #statepic       LIKE type_t.chr1,
       
       sel LIKE type_t.chr1, 
   glfb002 LIKE glfb_t.glfb002, 
   glfbl004 LIKE glfbl_t.glfbl004, 
   glfb003 LIKE glfb_t.glfb003, 
   amt1 LIKE type_t.num20_6, 
   per1 LIKE type_t.num20_6, 
   amt2 LIKE type_t.num20_6, 
   per2 LIKE type_t.num20_6, 
   glfb008 LIKE glfb_t.glfb008, 
   glfb010 LIKE type_t.chr500, 
   item LIKE type_t.chr500, 
   item_desc LIKE type_t.chr500, 
   line LIKE type_t.chr500, 
   amt3 LIKE type_t.num20_6, 
   per3 LIKE type_t.num20_6, 
   amt4 LIKE type_t.num20_6, 
   per4 LIKE type_t.num20_6, 
   account LIKE type_t.chr500, 
   style LIKE type_t.chr1 
       END RECORD
 
 
#add-point:自定義模組變數-標準(Module Variable)  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_wc_table1           STRING
DEFINE tm                    RECORD 
       glfa001               LIKE glfa_t.glfa001,
       glfa005               LIKE glfa_t.glfa005,
       glfa005_desc          LIKE glaal_t.glaal002,
       glfa006               LIKE glfa_t.glfa006,
       glfa007               LIKE glfa_t.glfa007,
       l_chk1                LIKE type_t.chr1,      #季別    #170623-00034#6 add
       l_chk2                LIKE type_t.chr1,      #半年    #170623-00034#6 add
       glfa008               LIKE glfa_t.glfa008,
       glfa009               LIKE glfa_t.glfa009,
       show_per              LIKE type_t.chr1,
       show_xrbl             LIKE type_t.chr1,
       show_ad               LIKE type_t.chr1,
       stus                  LIKE type_t.chr1,
       chg_curr              LIKE type_t.chr1,
       curr                  LIKE glaq_t.glaq005,
       rate                  LIKE glaq_t.glaq006,
       multicurr             LIKE type_t.chr1, #140314-00001#73  
       show_ce               LIKE type_t.chr1,  #170222-00003#2 add
       show_ye               LIKE type_t.chr1   #170222-00003#2 add        
       END RECORD
DEFINE g_glaa001             LIKE glaa_t.glaa001
DEFINE g_glaa025             LIKE glaa_t.glaa025
DEFINE g_mme                 LIKE glfa_t.glfa007  #170623-00034#6 add
DEFINE g_glaa003             LIKE glaa_t.glaa003  #170623-00034#6 add
DEFINE g_glaa138             LIKE glaa_t.glaa138  #170623-00034#6 add
#end add-point
 
#模組變數(Module Variables)
DEFINE g_master                     type_g_glfb_d
DEFINE g_master_t                   type_g_glfb_d
DEFINE g_glfb_d          DYNAMIC ARRAY OF type_g_glfb_d
DEFINE g_glfb_d_t        type_g_glfb_d
 
      
DEFINE g_wc                 STRING
DEFINE g_wc_t               STRING                        #儲存 user 的查詢條件
DEFINE g_wc2                STRING
DEFINE g_wc_filter          STRING
DEFINE g_wc_filter_t        STRING
DEFINE g_sql                STRING
DEFINE g_forupd_sql         STRING                        #SELECT ... FOR UPDATE SQL
DEFINE g_before_input_done  LIKE type_t.num5
DEFINE g_cnt                LIKE type_t.num10    
DEFINE l_ac                 LIKE type_t.num10              
DEFINE l_ac_d               LIKE type_t.num10              #單身idx 
DEFINE g_curr_diag          ui.Dialog                     #Current Dialog
DEFINE gwin_curr            ui.Window                     #Current Window
DEFINE gfrm_curr            ui.Form                       #Current Form
DEFINE g_current_page       LIKE type_t.num5              #目前所在頁數
DEFINE g_detail_cnt         LIKE type_t.num10             #單身 總筆數(所有資料)
DEFINE g_detail_cnt2        LIKE type_t.num10             #單身 總筆數(所有資料)
DEFINE g_ref_fields         DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields         DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_ref_vars           DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE gs_keys              DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE gs_keys_bak          DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE g_insert             LIKE type_t.chr5              #是否導到其他page
DEFINE g_error_show         LIKE type_t.num5
DEFINE g_master_idx         LIKE type_t.num10
DEFINE g_detail_idx         LIKE type_t.num10
DEFINE g_detail_idx2        LIKE type_t.num10
DEFINE g_hyper_url          STRING                        #hyperlink的主要網址
DEFINE g_tot_cnt            LIKE type_t.num10             #計算總筆數
DEFINE g_num_in_page        LIKE type_t.num10             #每頁筆數
DEFINE g_current_row_tot    LIKE type_t.num10             #目前所在總筆數
DEFINE g_page_act_list      STRING                        #分頁ACTION清單
DEFINE g_page_start_num     LIKE type_t.num10             #目前頁面起始筆數
DEFINE g_page_end_num       LIKE type_t.num10             #目前頁面結束筆數
 
#多table用wc
DEFINE g_wc_table           STRING
DEFINE g_wc_filter_table    STRING
DEFINE g_detail_page_action STRING
DEFINE g_pagestart          LIKE type_t.num10
 
 
 
#add-point:自定義模組變數-客製(Module Variable) name="global.variable_customerization"

##end add-point
 
#add-point:傳入參數說明 name="global.argv"
 TYPE type_g_glfb_e RECORD
       v          STRING
       END RECORD
DEFINE g_param                     type_g_glfb_e     
#end add-point
 
{</section>}
 
{<section id="aglq810.main" >}
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
   CALL cl_ap_init("agl","")
 
   #add-point:作業初始化 name="main.init"
   
   #end add-point
   
   
 
   #LOCK CURSOR (identifier)
   #add-point:SQL_define name="main.define_sql"
   
   #end add-point
   LET g_forupd_sql = " ", 
                      " FROM ",
                      " "
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE aglq810_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT  ",
               " FROM  t0",
               
               " WHERE  "
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE aglq810_master_referesh FROM g_sql
 
   #add-point:main段define_sql name="main.body.define_sql"
   
   #end add-point 
   LET g_forupd_sql = ""
   #add-point:main段define_sql name="main.body.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE aglq810_bcl CURSOR FROM g_forupd_sql
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
 
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_aglq810 WITH FORM cl_ap_formpath("agl",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL aglq810_init()   
 
      #進入選單 Menu (="N")
      CALL aglq810_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_aglq810
      
   END IF 
   
   CLOSE aglq810_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   DROP TABLE aglq810_tmp;
   DROP TABLE aglq810_tmp_1;
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="aglq810.init" >}
#+ 畫面資料初始化
PRIVATE FUNCTION aglq810_init()
   #add-point:init段define-客製 name="init.define_customerization"
   
   #end add-point
   #add-point:init段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   
   #end add-point
   
 
   #add-point:FUNCTION前置處理 name="init.before_function"
   
   #end add-point
 
   LET g_error_show  = 1
   LET g_wc_filter   = " 1=1"
   LET g_wc_filter_t = " 1=1"
   LET g_detail_idx = 1
   LET g_detail_idx2 = 1
   
   
   
   #add-point:畫面資料初始化 name="init.init"
   CALL cl_set_combo_scc('glfa008','8705')
   CALL cl_set_combo_scc('stus','9922')
   CALL cl_set_combo_scc('multicurr','9898')
   #建立临时表
   CALL aglq810_create_temp_table()
   #170623-00034#6---add---start---
   IF g_prog MATCHES 'aglq937*' THEN
      CALL cl_set_comp_visible("show_ce,show_ye",FALSE)
   ELSE
      CALL cl_set_comp_visible("l_chk1,l_chk2",FALSE)
   END IF
   #170623-00034#6---add---end---
   #end add-point
 
   CALL aglq810_default_search()  
END FUNCTION
 
{</section>}
 
{<section id="aglq810.default_search" >}
PRIVATE FUNCTION aglq810_default_search()
   #add-point:default_search段define-客製 name="default_search.define_customerization"
   
   #end add-point
   #add-point:default_search段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="default_search.define"
   
   #end add-point
 
   #add-point:default_search段開始前 name="default_search.before"
   
   #end add-point
 
   #應用 qs27 樣板自動產生(Version:3)
   #+ 組承接外部參數時資料庫欄位對應條件(單身)
   IF NOT cl_null(g_argv[01]) THEN
      LET g_wc = g_wc, " glfb001 = '", g_argv[01], "' AND "
   END IF
 
   IF NOT cl_null(g_argv[02]) THEN
      LET g_wc = g_wc, " glfbseq = '", g_argv[02], "' AND "
   END IF
   IF NOT cl_null(g_argv[03]) THEN
      LET g_wc = g_wc, " glfbseq1 = '", g_argv[03], "' AND "
   END IF
 
 
 
 
 
 
   IF NOT cl_null(g_wc) THEN
      LET g_wc = g_wc.subString(1,g_wc.getLength()-5)
   ELSE
      #預設查詢條件
      LET g_wc = " 1=2"
   END IF
 
   #add-point:default_search段開始後 name="default_search.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="aglq810.ui_dialog" >}
#+ 功能選單 
PRIVATE FUNCTION aglq810_ui_dialog()
   #add-point:ui_dialog段define-客製 name="ui_dialog.define_customerization"
   
   #end add-point 
   DEFINE ls_wc      STRING
   DEFINE li_idx     LIKE type_t.num10
   DEFINE lc_action_choice_old     STRING
   DEFINE lc_current_row           LIKE type_t.num10
   DEFINE ls_js      STRING
   DEFINE la_param   RECORD
                     prog       STRING,
                     actionid   STRING,
                     background LIKE type_t.chr1,
                     param      DYNAMIC ARRAY OF STRING
                     END RECORD
   #(ver:46) ---add start---
   DEFINE l_arr_len       INTEGER
   DEFINE l_arr_cnt       INTEGER
   DEFINE lb_get_type     LIKE type_t.chr20
   #(ver:46) --- add end ---
   #add-point:ui_dialog段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_dialog.define"
#   DEFINE l_string STRING
   #end add-point 
 
   #add-point:FUNCTION前置處理 name="ui_dialog.before_function"
   
   #end add-point
 
   LET gwin_curr = ui.Window.getCurrent()
   LET gfrm_curr = gwin_curr.getForm()   
   
   LET g_action_choice = " "
   LET lc_action_choice_old = ""
   CALL cl_set_act_visible("accept,cancel", FALSE)
   CALL cl_get_num_in_page() RETURNING g_num_in_page
         
   #add-point:ui_dialog段before dialog  name="ui_dialog.before_dialog"
   
   #end add-point
 
   LET g_detail_page_action = "detail_first"
   LET g_pagestart = 1
   LET g_current_row_tot = 1
   LET g_page_start_num = 1
   LET g_page_end_num = g_num_in_page
   IF NOT cl_null(g_wc) AND g_wc != " 1=2" THEN
      LET g_detail_idx = 1
      LET g_detail_idx2 = 1
      CALL aglq810_b_fill()
   ELSE
      CALL aglq810_query()
   END IF
   
   WHILE TRUE
 
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_glfb_d.clear()
 
         LET g_wc  = " 1=2"
         LET g_wc2 = " 1=1"
         LET g_action_choice = ""
         LET g_detail_page_action = "detail_first"
         LET g_pagestart = 1
         LET g_current_row_tot = 1
         LET g_page_start_num = 1
         LET g_page_end_num = g_num_in_page
         LET g_detail_idx = 1
         LET g_detail_idx2 = 1
 
         CALL aglq810_init()
      END IF
   
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         DISPLAY ARRAY g_glfb_d TO s_detail1.* ATTRIBUTE(COUNT=g_detail_cnt) 
      
            BEFORE DISPLAY 
               LET g_current_page = 1
 
            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
               LET l_ac = g_detail_idx
 
               #為避免按上下筆影響執行效能，所以有作一些處理
               LET lc_action_choice_old = g_action_choice
               LET g_action_choice = "fetch"
               CALL aglq810_fetch()
               LET g_action_choice = lc_action_choice_old
               LET g_master_idx = l_ac
               CALL aglq810_detail_action_trans()
               #add-point:input段before row name="input.body.before_row"
               
               #end add-point  
            
            #自訂ACTION(detail_show,page_1)
            
 
            #add-point:page1自定義行為 name="ui_dialog.body.page1.action"
            
            #end add-point
 
         END DISPLAY
      
 
         
 
      
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         
         #end add-point
         
         BEFORE DIALOG
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL DIALOG.setSelectionMode("s_detail1", 1)
            LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
            CALL aglq810_detail_action_trans()
 
            #add-point:ui_dialog段before dialog name="ui_dialog.bef_dialog"
            CALL gfrm_curr.setFieldHidden("formonly.sel", TRUE)
            #end add-point
 
         
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION datainfo
            LET g_action_choice="datainfo"
            IF cl_auth_chk_act("datainfo") THEN
               
               #add-point:ON ACTION datainfo name="menu.datainfo"
               
               #END add-point
               
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL aglq810_query()
               #add-point:ON ACTION query name="menu.query"
               EXIT DIALOG
               #END add-point
               
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               CALL aglq810_output()
#            IF cl_null(g_master.sel) THEN
#               LET g_master.sel = " 1=1 "
#            END IF
#               LET g_param.v = "aglq810_tmp"
               #CALL aglq810_g01(g_master.sel,g_param.v)                #140918 janet mark
#               CALL aglq810_g01(g_master.sel,g_param.v,tm.glfa006,tm.glfa007,tm.glfa005,tm.glfa001,tm.glfa008,tm.glfa009)     #140918 janet add
               #END add-point
               
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               CALL aglq810_output()
#            IF cl_null(g_master.sel) THEN
#               LET g_master.sel = " 1=1 "
#            END IF
#               LET g_param.v = "aglq810_tmp"
               #CALL aglq810_g01(g_master.sel,g_param.v)                #140918 janet mark
#               CALL aglq810_g01(g_master.sel,g_param.v,tm.glfa006,tm.glfa007,tm.glfa005,tm.glfa001,tm.glfa008,tm.glfa009)     #140918 janet add
               #END add-point
               
               
            END IF
 
 
 
 
      
         ON ACTION filter
            LET g_action_choice="filter"
            CALL aglq810_filter()
            #add-point:ON ACTION filter name="menu.filter"
            
            #END add-point
 
         ON ACTION close
            LET INT_FLAG=FALSE         
            LET g_action_choice = "exit"
            EXIT DIALOG
 
         ON ACTION exit
            LET g_action_choice="exit"
            EXIT DIALOG
 
         ON ACTION datarefresh   # 重新整理
            LET g_error_show = 1
            CALL aglq810_b_fill()
 
         ON ACTION exporttoexcel   #匯出excel
            LET g_action_choice="exporttoexcel"
            IF cl_auth_chk_act("exporttoexcel") THEN
               #(ver:46) ---start---
               #因應匯出excel規則調整，需同時符合新舊做法
               LET lb_get_type = cl_get_exporttoexcel_type()
               #add-point:ON ACTION exporttoexcel name="ui_dialog.exporttoexcel_type_change"
               
               #END add-point
               DISPLAY "lb_get_type:",lb_get_type
 
               CASE
                  WHEN lb_get_type = "poi"   #使用poi樣板
                     CALL g_export_node.clear()
                     LET l_arr_len = g_glfb_d.getLength()
                     LET g_export_tag[1] = rec_arr_type.create(l_arr_len)
                     LET g_export_tabname[1] = "s_detail1"
                     FOR l_arr_cnt = 1 TO l_arr_len
                        LET g_export_tag[1][l_arr_cnt] = g_glfb_d[l_arr_cnt]
                     END FOR
 
 
 
                     #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_poi"
                     
                     #END add-point
                     CALL cl_export_to_excel_getpage()
                     CALL cl_export_poi()
                     #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_after_poi"
                     
                     #END add-point
 
                  OTHERWISE   #使用原始樣板
               #(ver:46) --- end ---
                     CALL g_export_node.clear()
                     LET g_export_node[1] = base.typeInfo.create(g_glfb_d)
                     LET g_export_id[1]   = "s_detail1"
 
                     #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"
                     
                     #END add-point
                     CALL cl_export_to_excel_getpage()
                     CALL cl_export_to_excel()
                     #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_after"   #(ver:43)
                     
                     #END add-point
               END CASE   #(ver:46) add
            END IF
 
 
         ON ACTION agendum   # 待辦事項
            #add-point:ON ACTION agendum name="ui_dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
 
         ON ACTION detail_first               #page first
            LET g_action_choice = "detail_first"
            LET g_detail_page_action = "detail_first"
            CALL aglq810_b_fill()
 
         ON ACTION detail_previous                #page previous
            LET g_action_choice = "detail_previous"
            LET g_detail_page_action = "detail_previous"
            CALL aglq810_b_fill()
 
         ON ACTION detail_next                #page next
            LET g_action_choice = "detail_next"
            LET g_detail_page_action = "detail_next"
            CALL aglq810_b_fill()
 
         ON ACTION detail_last                #page last
            LET g_action_choice = "detail_last"
            LET g_detail_page_action = "detail_last"
            CALL aglq810_b_fill()
 
         #應用 qs19 樣板自動產生(Version:3)
         #有關於sel欄位選取的action段落
         #選擇全部
         ON ACTION selall
            CALL DIALOG.setSelectionRange("s_detail1", 1, -1, 1)
            FOR li_idx = 1 TO g_glfb_d.getLength()
               LET g_glfb_d[li_idx].sel = "Y"
            END FOR
 
            #add-point:ui_dialog段on action selall name="ui_dialog.onaction_selall"
            
            #end add-point
 
         #取消全部
         ON ACTION selnone
            CALL DIALOG.setSelectionRange("s_detail1", 1, -1, 0)
            FOR li_idx = 1 TO g_glfb_d.getLength()
               LET g_glfb_d[li_idx].sel = "N"
            END FOR
 
            #add-point:ui_dialog段on action selnone name="ui_dialog.onaction_selnone"
            
            #end add-point
 
         #勾選所選資料
         ON ACTION sel
            FOR li_idx = 1 TO g_glfb_d.getLength()
               IF DIALOG.isRowSelected("s_detail1", li_idx) THEN
                  LET g_glfb_d[li_idx].sel = "Y"
               END IF
            END FOR
 
            #add-point:ui_dialog段on action sel name="ui_dialog.onaction_sel"
            
            #end add-point
 
         #取消所選資料
         ON ACTION unsel
            FOR li_idx = 1 TO g_glfb_d.getLength()
               IF DIALOG.isRowSelected("s_detail1", li_idx) THEN
                  LET g_glfb_d[li_idx].sel = "N"
               END IF
            END FOR
 
            #add-point:ui_dialog段on action unsel name="ui_dialog.onaction_unsel"
            
            #end add-point
 
 
 
 
 
         
 
         #add-point:ui_dialog段自定義action name="ui_dialog.more_action"
         
         #end add-point
      
         #主選單用ACTION
         &include "main_menu_exit_dialog.4gl"
         &include "relating_action.4gl"
         #交談指令共用ACTION
         &include "common_action.4gl"
            CONTINUE DIALOG
 
         #add-point:查詢方案相關ACTION設定前 name="ui_dialog.set_qbe_action_before"
         
         #end add-point
 
         #add-point:查詢方案相關ACTION設定後 name="ui_dialog.set_qbe_action_after"
         
         #end add-point
      END DIALOG
      
      IF g_action_choice = "exit" AND NOT cl_null(g_action_choice) THEN
         EXIT WHILE
      END IF
      
   END WHILE
 
   CALL cl_set_act_visible("accept,cancel", TRUE)
 
END FUNCTION
 
{</section>}
 
{<section id="aglq810.query" >}
#+ QBE資料查詢
PRIVATE FUNCTION aglq810_query()
   #add-point:query段define-客製 name="query.define_customerization"
   
   #end add-point 
   DEFINE ls_wc      LIKE type_t.chr500
   DEFINE ls_wc2     LIKE type_t.chr500
   DEFINE ls_return  STRING
   DEFINE ls_result  STRING 
   #add-point:query段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="query.define"
   DEFINE l_glfa004  LIKE glfa_t.glfa004
   DEFINE l_cnt      LIKE type_t.num5
   DEFINE l_glfa002  LIKE glfa_t.glfa002
   DEFINE l_glav006  LIKE glav_t.glav006
   DEFINE l_success  LIKE type_t.num5
   DEFINE l_pass     LIKE type_t.num5
   DEFINE l_glfa005_txt  LIKE type_t.chr100
   DEFINE l_glaa015  LIKE glaa_t.glaa015 #本位幣二是否啟用
   DEFINE l_glaa019  LIKE glaa_t.glaa019 #本位幣三是否啟用
   DEFINE l_sql      STRING  #170320-00048#1 add 
   DEFINE l_n        LIKE type_t.num5 #170320-00048#1 add 
   
   #建立临时表
   CALL aglq810_create_temp_table()
   CALL s_ld_bookno()  RETURNING l_success,tm.glfa005
   IF l_success = FALSE THEN
      RETURN 
   END IF 
   CALL s_ld_chk_authorization(g_user,tm.glfa005) RETURNING l_pass
   IF l_pass = FALSE THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'agl-00164'
      LET g_errparam.extend = tm.glfa005
      LET g_errparam.popup = FALSE
      CALL cl_err()

      LET tm.glfa005=NULL
   END IF
   LET tm.glfa006=YEAR(g_today)
   LET tm.glfa007=MONTH(g_today)
   LET tm.glfa008='1' 
   LET tm.glfa009=2
   LET tm.l_chk1 = '1'    #170623-00034#6 add
   LET tm.l_chk2 = '1'    #170623-00034#6 add    
   #150827-00036#3--add--str--
   LET tm.show_xrbl='N'
   CALL cl_set_comp_visible('b_glfb008,account',FALSE)
   #150827-00036#3--add--end
   
   #150827-00036#1--add--str--
   LET tm.show_ad='Y'
   LET tm.stus='1'
   LET tm.chg_curr='N'
   LET tm.curr=''
   LET tm.rate=''
   CALL cl_set_comp_entry('curr,rate',FALSE)
   LET g_glaa001=''
   LET g_glaa025=''
   SELECT glaa001,glaa025 INTO g_glaa001,g_glaa025 FROM glaa_t WHERE glaaent=g_enterprise AND glaald=tm.glfa005
   #150827-00036#1--add--end
   LET tm.show_ce='Y' #170222-00003#2 add
   LET tm.show_ye='Y' #170222-00003#2 add   
   #140314-00001#73 ---s---
   LET tm.glfa001 = ''
 
   #170320-00048#1 add s---
   LET l_glfa004 = ''  #科目参照表
   SELECT glfa004 INTO l_glfa004 FROM glfa_t
    WHERE glfaent=g_enterprise AND glfa001=tm.glfa001
   #170320-00048#1 add e---  
   
   CALL cl_set_comp_visible('multicurr',FALSE)
   #IF g_prog  = 'aglq937' THEN        #160705-00042#11 160714 by sakura mark
   #IF g_prog  MATCHES 'aglq937' THEN  #160705-00042#11 160714 by sakura add #170301-00017#3 mark
   IF g_prog  MATCHES 'aglq937*' THEN  #170301-00017#3  09276 add
      SELECT gzzd005 INTO l_glfa005_txt FROM gzzd_t WHERE gzzd003 = 'lbl_glfa0052' AND gzzd002 = g_dlang AND gzzd001 = 'agli070'
      CALL cl_set_comp_att_text('lbl_glfa005',l_glfa005_txt)
      CALL cl_set_comp_visible('show_ad,stus',FALSE)
      CALL cl_set_comp_visible('multicurr',TRUE)
      LET tm.chg_curr='N'
      LET tm.show_ad='N'      
      #CALL s_ld_sel_glaa(tm.glfa005,'glaa015|glaa019')      #170623-00034#6 mark
      #   RETURNING g_sub_success,l_glaa015,l_glaa019        #170623-00034#6 mark
      #170623-00034#6---add---start---
      SELECT glaa015,glaa019,glaa003,glaa138    
        INTO l_glaa015,l_glaa019,g_glaa003,g_glaa138  
        FROM glaa_t
       WHERE glaaent = g_enterprise AND glaald = tm.glfa005
      IF cl_null(g_glaa138) THEN LET g_glaa138 = '0' END IF
      #170623-00034#6---add---end---
      IF l_glaa015 = 'Y' AND l_glaa019 = 'Y' THEN           
         CALL cl_set_combo_scc_part('multicurr','9898','1,2,3')   
      END IF
      IF l_glaa015 = 'Y' AND l_glaa019 = 'N' THEN
         CALL cl_set_combo_scc_part('multicurr','9898','1,2')  
      END IF
      IF l_glaa015 = 'N' AND l_glaa019 = 'N' THEN
         CALL cl_set_combo_scc_part('multicurr','9898','1')  
      END IF
      LET tm.multicurr = '1'
      #170623-00034#6---add---start---
      CASE 
         WHEN g_glaa138 = '0' 
              LET tm.glfa007=MONTH(g_today)
              CALL cl_set_comp_visible('l_chk1,l_chk2',FALSE)
              CALL cl_set_comp_visible('glfa007',TRUE)
         WHEN g_glaa138 = '1' 
              LET tm.l_chk1 = '1'    
              CALL cl_set_comp_visible('glfa007,l_chk2',FALSE)
              CALL cl_set_comp_visible('l_chk1',TRUE)
         WHEN g_glaa138 = '2'   
              LET tm.l_chk2 = '1'                      
              CALL cl_set_comp_visible('l_chk1,glfa007',FALSE)
              CALL cl_set_comp_visible('l_chk2',TRUE)
      END CASE
      #170623-00034#6---add---end---   
   END IF
   
   
   #140314-00001#73 ---e---
   
   
   
   #140314-00001#73 ---s---
   
   
   
   #140314-00001#73 ---e---
   
  #DISPLAY BY NAME tm.glfa005,tm.glfa006,tm.glfa007,tm.glfa008,tm.glfa009,tm.show_xrbl,          #170623-00034#6 mark
   DISPLAY BY NAME tm.glfa005,tm.glfa006,tm.glfa007,tm.l_chk1,tm.l_chk2,tm.glfa008,tm.glfa009,tm.show_xrbl,  #170623-00034#6 add
                   tm.show_ad,tm.stus,tm.chg_curr,tm.curr,tm.rate #150827-00036#1 add
   #150827-00036#12--add--str--
   #显示比率
   LET tm.show_per = 'Y'   
   DISPLAY BY NAME tm.show_per
   #150827-00036#12--add--end
   #end add-point 
   
   #add-point:FUNCTION前置處理 name="query.before_function"
   
   #end add-point
 
   LET INT_FLAG = 0
   CLEAR FORM
   CALL g_glfb_d.clear()
 
   
   CALL gfrm_curr.setFieldHidden("formonly.sel", TRUE)
   CALL gfrm_curr.setFieldHidden("formonly.statepic", TRUE)
   
   LET g_qryparam.state = "c"
   LET g_detail_idx  = 1
   LET g_detail_idx2 = 1
   LET g_wc_filter = " 1=1"
   LET g_detail_page_action = ""
   LET g_pagestart = 1
   
   #wc備份
   LET ls_wc = g_wc
   LET ls_wc2 = g_wc2
   LET g_master_idx = l_ac
 
   LET g_wc = ""   #(ver:44)
   LET g_wc2 = ""   #(ver:44)
 
   
 
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
      #單身根據table分拆construct
      CONSTRUCT g_wc_table ON glfb002,glfbl004,glfb003,glfb008
           FROM s_detail1[1].b_glfb002,s_detail1[1].b_glfbl004,s_detail1[1].b_glfb003,s_detail1[1].b_glfb008 
 
                      
         BEFORE CONSTRUCT
            #add-point:cs段more_construct name="cs.head.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #----<<sel>>----
         #----<<b_glfb002>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_glfb002
            #add-point:BEFORE FIELD b_glfb002 name="construct.b.page1.b_glfb002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_glfb002
            
            #add-point:AFTER FIELD b_glfb002 name="construct.a.page1.b_glfb002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_glfb002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_glfb002
            #add-point:ON ACTION controlp INFIELD b_glfb002 name="construct.c.page1.b_glfb002"
            
            #END add-point
 
 
         #----<<b_glfbl004>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_glfbl004
            #add-point:BEFORE FIELD b_glfbl004 name="construct.b.page1.b_glfbl004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_glfbl004
            
            #add-point:AFTER FIELD b_glfbl004 name="construct.a.page1.b_glfbl004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_glfbl004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_glfbl004
            #add-point:ON ACTION controlp INFIELD b_glfbl004 name="construct.c.page1.b_glfbl004"
            
            #END add-point
 
 
         #----<<b_glfb003>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_glfb003
            #add-point:BEFORE FIELD b_glfb003 name="construct.b.page1.b_glfb003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_glfb003
            
            #add-point:AFTER FIELD b_glfb003 name="construct.a.page1.b_glfb003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_glfb003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_glfb003
            #add-point:ON ACTION controlp INFIELD b_glfb003 name="construct.c.page1.b_glfb003"
            
            #END add-point
 
 
         #----<<amt1>>----
         #----<<per1>>----
         #----<<amt2>>----
         #----<<per2>>----
         #----<<b_glfb008>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_glfb008
            #add-point:BEFORE FIELD b_glfb008 name="construct.b.page1.b_glfb008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b_glfb008
            
            #add-point:AFTER FIELD b_glfb008 name="construct.a.page1.b_glfb008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.b_glfb008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_glfb008
            #add-point:ON ACTION controlp INFIELD b_glfb008 name="construct.c.page1.b_glfb008"
 
            #END add-point
 
 
         #----<<glfb010>>----
         #----<<item>>----
         #----<<item_desc>>----
         #----<<line>>----
         #----<<amt3>>----
         #----<<per3>>----
         #----<<amt4>>----
         #----<<per4>>----
         #----<<account>>----
         #----<<style>>----
   
       
      END CONSTRUCT
      
 
      
 
  
      #add-point:query段more_construct name="query.more_construct"
      CONSTRUCT g_wc_table1 ON item_desc,line
          FROM s_detail1[1].item_desc,s_detail1[1].line
          
      END CONSTRUCT
      
     #INPUT BY NAME tm.glfa001,tm.glfa005,tm.glfa006,tm.glfa007,tm.glfa008,tm.glfa009,tm.show_per,tm.show_xrbl, #150827-00036#12 add 'show_per' #170623-00034#6 mark
      INPUT BY NAME tm.glfa001,tm.glfa005,tm.glfa006,tm.glfa007,tm.l_chk1,tm.l_chk2,   #170623-00034#6 add
                    tm.glfa008,tm.glfa009,tm.show_per,tm.show_xrbl,                    #170623-00034#6 add
                    tm.show_ad,tm.stus,tm.chg_curr,tm.curr,tm.rate,  #150827-00036#1 add
                    tm.multicurr,
                    tm.show_ce,tm.show_ye  #170222-00003#2 add
                    
         ATTRIBUTE(WITHOUT DEFAULTS)
         BEFORE INPUT
            CALL aglq810_glfa005_desc(tm.glfa005) RETURNING tm.glfa005_desc
            DISPLAY tm.glfa005_desc TO glfa005_desc
            
         AFTER FIELD glfa001
            IF NOT cl_null(tm.glfa001) THEN
               #140314-00001#73
               #IF g_prog = 'aglq937' THEN        #160705-00042#11 160714 by sakura mark
               #IF g_prog MATCHES 'aglq937' THEN  #160705-00042#11 160714 by sakura add #170301-00017#3 mark
               IF g_prog MATCHES 'aglq937*' THEN  #170301-00017#3  09276 add
                  SELECT COUNT(*) INTO l_cnt FROM glfa_t
                   WHERE glfaent=g_enterprise AND glfa001=tm.glfa001 
                     AND glfa016 = '2' 
               ELSE
                  SELECT COUNT(*) INTO l_cnt FROM glfa_t
                   WHERE glfaent=g_enterprise AND glfa001=tm.glfa001 
               END IF
               IF l_cnt=0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'agl-00249'
                  LET g_errparam.extend = tm.glfa001
                  LET g_errparam.popup = FALSE
                  CALL cl_err()
                
                  NEXT FIELD glfa001
               END IF
               SELECT glfa002 INTO l_glfa002 FROM glfa_t
                WHERE glfaent=g_enterprise AND glfa001=tm.glfa001 
               IF l_glfa002<>'1' THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'agl-00255'
                  LET g_errparam.extend = tm.glfa001
                  LET g_errparam.popup = FALSE
                  CALL cl_err()
                
                  NEXT FIELD glfa001
               END IF
               SELECT glfa004 INTO l_glfa004 FROM glfa_t WHERE glfaent=g_enterprise AND glfa001=tm.glfa001
            END IF
            
         AFTER FIELD glfa005
            IF NOT cl_null(tm.glfa005) THEN
               SELECT COUNT(*) INTO l_cnt FROM glaa_t WHERE glaaent=g_enterprise AND glaald=tm.glfa005
               IF l_cnt=0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'agl-00055'
                  LET g_errparam.extend = tm.glfa005
                  LET g_errparam.popup = FALSE
                  CALL cl_err()

                  NEXT FIELD glfa005
               END IF
               #160811-00039#4--add--str--
               SELECT COUNT(*) INTO l_cnt FROM glaa_t WHERE glaaent=g_enterprise AND glaald=tm.glfa005 AND glaastus='Y'
               IF l_cnt=0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'agl-00051'
                  LET g_errparam.extend = tm.glfa005
                  LET g_errparam.popup = FALSE
                  CALL cl_err()

                  NEXT FIELD glfa005
               END IF
               CALL s_ld_chk_authorization(g_user,tm.glfa005) RETURNING l_pass
               IF l_pass = FALSE THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'agl-00164'
                  LET g_errparam.extend = tm.glfa005
                  LET g_errparam.popup = FALSE
                  CALL cl_err()
               
                  NEXT FIELD glfa005
               END IF
               #160811-00039#4--add--end
               IF NOT cl_null(tm.glfa001) THEN
                  SELECT glfa004 INTO l_glfa004 FROM glfa_t 
                   WHERE glfaent=g_enterprise AND glfa001=tm.glfa001
                  SELECT COUNT(*) INTO l_cnt FROM glaa_t 
                  WHERE glaaent=g_enterprise AND glaald=tm.glfa005 AND glaa004=l_glfa004
                  IF l_cnt=0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'agl-00242'
                     LET g_errparam.extend = tm.glfa005
                     LET g_errparam.popup = FALSE
                     CALL cl_err()

                     NEXT FIELD glfa005
                  END IF
               END IF
               CALL aglq810_glfa005_desc(tm.glfa005) RETURNING tm.glfa005_desc
               DISPLAY tm.glfa005_desc TO glfa005_desc
               SELECT glaa001,glaa025 INTO g_glaa001,g_glaa025 FROM glaa_t WHERE glaaent=g_enterprise AND glaald=tm.glfa005
               #IF g_prog = 'aglq937' THEN        #160705-00042#11 160714 by sakura mark
               #IF g_prog MATCHES 'aglq937' THEN  #160705-00042#11 160714 by sakura add #170301-00017#3 mark
               IF g_prog MATCHES 'aglq937*' THEN  #170301-00017#3  09276 add
                  #CALL s_ld_sel_glaa(tm.glfa005,'glaa015|glaa019')  #170623-00034#6 mark    
                  #   RETURNING g_sub_success,l_glaa015,l_glaa019    #170623-00034#6 mark
                  #170623-00034#6---add---start---
                  SELECT glaa015,glaa019,glaa003,glaa138    
                    INTO l_glaa015,l_glaa019,g_glaa003,g_glaa138  
                    FROM glaa_t
                   WHERE glaaent = g_enterprise AND glaald = tm.glfa005
                  IF cl_null(g_glaa138) THEN LET g_glaa138 = '0' END IF
                  #170623-00034#6---add---end---
                  IF l_glaa015 = 'Y' AND l_glaa019 = 'Y' THEN           
                     CALL cl_set_combo_scc_part('multicurr','9898','1,2,3')   
                  END IF
                  IF l_glaa015 = 'Y' AND l_glaa019 = 'N' THEN
                     CALL cl_set_combo_scc_part('multicurr','9898','1,2')  
                  END IF
                  IF l_glaa015 = 'N' AND l_glaa019 = 'N' THEN
                     CALL cl_set_combo_scc_part('multicurr','9898','1')  
                  END IF 
                  #170623-00034#6---add---start---
                  CASE 
                     WHEN g_glaa138 = '0' 
                          LET tm.glfa007=MONTH(g_today)
                          CALL cl_set_comp_visible('l_chk1,l_chk2',FALSE)
                          CALL cl_set_comp_visible('glfa007',TRUE)
                     WHEN g_glaa138 = '1' 
                          LET tm.l_chk1 = '1'    
                          CALL cl_set_comp_visible('glfa007,l_chk2',FALSE)
                          CALL cl_set_comp_visible('l_chk1',TRUE)
                     WHEN g_glaa138 = '2'   
                          LET tm.l_chk2 = '1'                 
                          CALL cl_set_comp_visible('l_chk1,glfa007',FALSE)
                          CALL cl_set_comp_visible('l_chk2',TRUE)
                  END CASE                  
                  #170623-00034#6---add---end---                                                      
               END IF
            END IF
           
         AFTER FIELD glfa007
            IF NOT cl_null(tm.glfa007) THEN #170320-00048#2 add xul
  #170320-00048#1 mod s---
  #            SELECT MAX(glav006) INTO l_glav006 FROM glav_t
  #            WHERE glavent=g_enterprise AND glav001=l_glfa004 AND glav002=tm.glfa006
              #限制录入的期别不可超过最大期别
              LET l_glav006 = NULL
              LET l_sql="SELECT MAX(glav006) FROM glav_t ",
                        " WHERE glavent=",g_enterprise," AND glav002=",tm.glfa006
              IF NOT cl_null(tm.glfa005) THEN
                 LET l_sql=l_sql," AND glav001 IN (SELECT DISTINCT glaa003 FROM glaa_t",
                                 "                 WHERE glaaent=",g_enterprise," AND glaald = '",tm.glfa005,"' )"
              END IF
              IF NOT cl_null(l_glfa004) THEN
                 LET l_sql=l_sql," AND glav001 IN (SELECT DISTINCT glaa003 FROM glaa_t",
                                 "                 WHERE glaaent=",g_enterprise," AND glaa004='",l_glfa004,"' )" 
              END IF                   
              PREPARE aglq810_sel_glav_pr FROM l_sql
              EXECUTE aglq810_sel_glav_pr INTO l_glav006  
  #170320-00048#1 mod e---            
              IF NOT cl_null(l_glav006) THEN
                 IF tm.glfa007>l_glav006 THEN
                    INITIALIZE g_errparam TO NULL
                    LET g_errparam.code = 'sub-00427'
                    LET g_errparam.extend = ''
                    LET g_errparam.popup = FALSE
                    CALL cl_err()
  
                    NEXT FIELD glfa007
                 END IF
              END IF
              #170320-00048#2--add--s--xul
              LET l_n = 0 
              LET l_sql = " SELECT COUNT(1)  FROM glav_t ",
                          "  WHERE glavent=",g_enterprise,                                          
                          "    AND glav002= ",tm.glfa006,    
                          "    AND glav006= ",tm.glfa007
              IF NOT cl_null(tm.glfa005) THEN
                 LET l_sql=l_sql," AND glav001 IN (SELECT DISTINCT glaa003 FROM glaa_t",
                                 "                 WHERE glaaent=",g_enterprise," AND glaald = '",tm.glfa005,"' )"
              END IF
              IF NOT cl_null(l_glfa004) THEN
                 LET l_sql=l_sql," AND glav001 IN (SELECT DISTINCT glaa003 FROM glaa_t",
                                 "                 WHERE glaaent=",g_enterprise," AND glaa004 ='",l_glfa004,"' )" 
              END IF
              PREPARE l_n_4 FROM l_sql
              EXECUTE l_n_4 INTO l_n
              IF cl_null(l_n) THEN LET l_n =0 END IF 
              IF l_n = 0 THEN
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.code = 'agl-00211'
                 LET g_errparam.extend = ''
                 LET g_errparam.popup = FALSE
                 CALL cl_err()
                 NEXT FIELD glfa007
              END IF              
           END IF
              #170320-00048#2--add--e--xul
        #170623-00034#6---add---start---   
           IF g_prog MATCHES 'aglq937*' THEN
              LET g_mme = tm.glfa007              
           END IF
           
         AFTER FIELD l_chk1
           IF cl_null(tm.l_chk1) THEN
              NEXT FIELD l_chk1
           END IF
           IF g_prog MATCHES 'aglq937*' THEN
              LET g_mme = tm.l_chk1            
           END IF
           
         AFTER FIELD l_chk2
           IF cl_null(tm.l_chk2) THEN
              NEXT FIELD l_chk2
           END IF
           IF g_prog MATCHES 'aglq937*' THEN
              LET g_mme = tm.l_chk2            
           END IF
         #170623-00034#6---add---end---
         AFTER FIELD glfa009
            IF NOT cl_ap_chk_Range(tm.glfa009,"0","1","","","azz-00079",1) THEN
               NEXT FIELD glfa009
            END IF

         #150827-00036#12--add--str--
         ON CHANGE show_per
            IF tm.show_per = 'Y' THEN
               CALL cl_set_comp_visible('per1,per2,per3,per4',TRUE)
            ELSE
               CALL cl_set_comp_visible('per1,per2,per3,per4',FALSE)
            END IF
         #150827-00036#12--add--end
         
         ON CHANGE show_xrbl
            IF tm.show_xrbl = 'Y' THEN
               CALL cl_set_comp_visible('b_glfb008,account',TRUE)
            ELSE
               CALL cl_set_comp_visible('b_glfb008,account',FALSE)
            END IF
            
         #150827-00036#1--add--str--
         AFTER FIELD show_ad
            IF tm.show_ad NOT MATCHES '[yYnN]' THEN
               NEXT FIELD show_ad
            END IF
         
         AFTER FIELD stus
            IF tm.stus NOT MATCHES '[123]' THEN
               NEXT FIELD stus
            END IF
         
         ON CHANGE chg_curr
            IF tm.chg_curr = 'Y' THEN
               CALL cl_set_comp_entry('curr,rate',TRUE)
            ELSE
               CALL cl_set_comp_entry('curr,rate',FALSE)
               LET tm.curr=''
               LET tm.rate=''
               DISPLAY BY NAME tm.curr,tm.rate
            END IF
            
         AFTER FIELD curr
            IF NOT cl_null(tm.curr) THEN
               INITIALIZE g_chkparam.* TO NULL
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1=tm.curr
               
               #160318-00025#36  2016/04/20  by pengxin  add(S)
               LET g_errshow = TRUE #是否開窗 
               LET g_chkparam.err_str[1] = "aoo-00011:sub-01302|aooi140|",cl_get_progname("aooi140",g_lang,"2"),"|:EXEPROGaooi140"
               #160318-00025#36  2016/04/20  by pengxin  add(E)
               
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_ooai001") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  LET tm.curr=''
                  NEXT FIELD CURRENT
               END IF
               #匯率
               CALL s_aooi160_get_exrate('2',tm.glfa005,g_today,tm.curr,g_glaa001,0,g_glaa025)
               RETURNING  tm.rate
               DISPLAY BY NAME tm.rate
            END IF
            
         AFTER FIELD rate
            IF NOT cl_null(tm.rate) THEN
               IF tm.curr=g_glaa001 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'agl-00327'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = FALSE
                  CALL cl_err()
                  LET tm.rate=1
                  NEXT FIELD rate
               END IF
               CALL s_num_isnum(tm.rate) RETURNING l_success
               IF l_success=FALSE THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'agl-00036'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = FALSE
                  CALL cl_err()
                  NEXT FIELD rate
               END IF
            END IF
         #150827-00036#1--add--end
         
         ON ACTION controlp INFIELD glfa001
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = tm.glfa001
            #IF g_prog = 'aglq937' THEN #140314-00001#73   #160705-00042#11 160714 by sakura mark
            #IF g_prog MATCHES 'aglq937' THEN              #160705-00042#11 160714 by sakura add #170301-00017#3 mark
            IF g_prog MATCHES 'aglq937*' THEN              #170301-00017#3  09276 add
               LET g_qryparam.where = " glfa002='1' AND glfa016 = '2' "
            ELSE
               LET g_qryparam.where = " glfa002='1' "
            END IF
            CALL q_glfa001()                          #呼叫開窗
            LET tm.glfa001 = g_qryparam.return1
            DISPLAY tm.glfa001 TO glfa001  #顯示到畫面上
            NEXT FIELD glfa001 
               
         ON ACTION controlp INFIELD glfa005
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
       
            LET g_qryparam.default1 = tm.glfa005        #給予default值
            LET g_qryparam.default2 = "" #glaald #帳別編號
            #給予arg
            LET g_qryparam.arg1 = g_user
            LET g_qryparam.arg2 = g_dept
            #170623-00034#6---add---start---
            IF g_prog MATCHES 'aglq937*' THEN
               LET g_qryparam.where = ''
               CALL q_authorised_ld3()
            ELSE 
            #170623-00034#6---add---end---
               IF NOT cl_null(tm.glfa001) THEN
                  SELECT glfa004 INTO l_glfa004 FROM glfa_t WHERE glfaent=g_enterprise AND glfa001=tm.glfa001
                  LET g_qryparam.where = " glaa004='",l_glfa004,"'"
               END IF
               CALL q_authorised_ld()                                #呼叫開窗
            END IF             #170623-00034#6 add
       
            LET tm.glfa005 = g_qryparam.return1              
            DISPLAY tm.glfa005 TO glfa005            
            NEXT FIELD glfa005
            
         #150827-00036#1--add--str--
         ON ACTION controlp INFIELD curr
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = tm.curr  
            CALL q_ooai001()                          #呼叫開窗
            LET tm.curr = g_qryparam.return1
            DISPLAY tm.curr TO curr  #顯示到畫面上
            NEXT FIELD curr 
         #150827-00036#1--add--end
      END INPUT
      
      #end add-point 
 
      ON ACTION accept
         #add-point:ON ACTION accept name="query.accept"
         
         #end add-point
 
         ACCEPT DIALOG
         
      ON ACTION cancel
         LET INT_FLAG = 1
         EXIT DIALOG
      
      #交談指令共用ACTION
      &include "common_action.4gl"
         CONTINUE DIALOG 
 
      #add-point:query段查詢方案相關ACTION設定前 name="query.set_qbe_action_before"
      
      #end add-point 
 
      ON ACTION qbeclear   # 條件清除
         CLEAR FORM
         #add-point:條件清除後 name="query.qbeclear"
         
         #end add-point 
 
      #add-point:query段查詢方案相關ACTION設定後 name="query.set_qbe_action_after"
      
      #end add-point 
 
   END DIALOG
 
   
 
   LET g_wc = g_wc_table 
 
 
   
   IF cl_null(g_wc2) THEN
      LET g_wc2 = " 1=1"
   END IF
 
 
 
   IF INT_FLAG THEN
      LET INT_FLAG = 0
      #還原
      LET g_wc = " 1=2"
      LET g_wc2 = " 1=1"
      LET g_wc_filter = g_wc_filter_t
      RETURN
   ELSE
      LET g_master_idx = 1
   END IF
        
   #add-point:cs段after_construct name="cs.after_construct"
   IF NOT cl_null(g_wc_table1) AND g_wc_table1 <> " 1=1" THEN
      LET g_wc_table1=cl_replace_str(g_wc_table1,'item_desc','glfbl004')
      LET g_wc_table1=cl_replace_str(g_wc_table1,'line','glfb003')
   END IF
   CALL aglq810_get_data()

   #end add-point
        
   LET g_error_show = 1
   CALL aglq810_b_fill()
   LET l_ac = g_master_idx
   IF g_detail_cnt = 0 AND NOT INT_FLAG THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = -100 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   END IF
   
   CALL gfrm_curr.setFieldHidden("formonly.sel", FALSE)
   CALL gfrm_curr.setFieldHidden("formonly.statepic", FALSE)
   
END FUNCTION
 
{</section>}
 
{<section id="aglq810.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION aglq810_b_fill()
   #add-point:b_fill段define-客製 name="b_fill.define_customerization"
   
   #end add-point
   DEFINE ls_wc           STRING
   DEFINE ls_wc2          STRING
   DEFINE ls_sql_rank     STRING
   #add-point:b_fill段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   DEFINE l_flag          LIKE type_t.num5
   #end add-point
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   CALL aglq810_b_fill1()
   RETURN
   #end add-point
 
   IF cl_null(g_wc_filter) THEN
      LET g_wc_filter = " 1=1"
   END IF
   IF cl_null(g_wc) THEN
      LET g_wc = " 1=1"
   END IF
   IF cl_null(g_wc2) THEN
      LET g_wc2 = " 1=1"
   END IF
   
   LET ls_wc = g_wc, " AND ", g_wc2, " AND ", g_wc_filter, cl_sql_auth_filter()   #(ver:40) add cl_sql_auth_filter()
 
   LET ls_sql_rank = "SELECT  UNIQUE '',glfb002,'',glfb003,'','','','',glfb008,'','','','','','','', 
       '','',''  ,DENSE_RANK() OVER( ORDER BY glfb_t.glfb001,glfb_t.glfbseq,glfb_t.glfbseq1) AS RANK FROM glfb_t", 
 
 
 
                     "",
                     " WHERE glfbent= ? AND 1=1 AND ", ls_wc
    
   LET ls_sql_rank = ls_sql_rank, cl_sql_add_filter("glfb_t"),
                     " ORDER BY glfb_t.glfb001,glfb_t.glfbseq,glfb_t.glfbseq1"
 
   #add-point:b_fill段rank_sql_after name="b_fill.rank_sql_after"
   
   #end add-point
 
   LET g_sql = "SELECT COUNT(1) FROM (",ls_sql_rank,")"
 
   PREPARE b_fill_cnt_pre FROM g_sql
   EXECUTE b_fill_cnt_pre USING g_enterprise INTO g_tot_cnt
   FREE b_fill_cnt_pre
 
   #add-point:b_fill段rank_sql_after_count name="b_fill.rank_sql_after_count"
   
   #end add-point
 
   CASE g_detail_page_action
      WHEN "detail_first"
          LET g_pagestart = 1
 
      WHEN "detail_previous"
          LET g_pagestart = g_pagestart - g_num_in_page
          IF g_pagestart < 1 THEN
              LET g_pagestart = 1
          END IF
 
      WHEN "detail_next"
         LET g_pagestart = g_pagestart + g_num_in_page
         IF g_pagestart > g_tot_cnt THEN
            LET g_pagestart = g_tot_cnt - (g_tot_cnt mod g_num_in_page) + 1
            WHILE g_pagestart > g_tot_cnt
               LET g_pagestart = g_pagestart - g_num_in_page
            END WHILE
         END IF
 
      WHEN "detail_last"
         LET g_pagestart = g_tot_cnt - (g_tot_cnt mod g_num_in_page) + 1
         WHILE g_pagestart > g_tot_cnt
            LET g_pagestart = g_pagestart - g_num_in_page
         END WHILE
 
      OTHERWISE
         LET g_pagestart = 1
 
   END CASE
 
   LET g_sql = "SELECT '',glfb002,'',glfb003,'','','','',glfb008,'','','','','','','','','',''",
               " FROM (",ls_sql_rank,")",
              " WHERE RANK >= ",g_pagestart,
                " AND RANK < ",g_pagestart + g_num_in_page
 
   #add-point:b_fill段sql_after name="b_fill.sql_after"
   
   #end add-point
 
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   PREPARE aglq810_pb FROM g_sql
   DECLARE b_fill_curs CURSOR FOR aglq810_pb
   
   OPEN b_fill_curs USING g_enterprise
 
   CALL g_glfb_d.clear()
 
   #add-point:陣列清空 name="b_fill.array_clear"
 
   #end add-point
 
   LET g_cnt = l_ac
   IF g_cnt = 0 THEN
      LET g_cnt = 1
   END IF
   LET l_ac = 1   
 
   FOREACH b_fill_curs INTO g_glfb_d[l_ac].sel,g_glfb_d[l_ac].glfb002,g_glfb_d[l_ac].glfbl004,g_glfb_d[l_ac].glfb003, 
       g_glfb_d[l_ac].amt1,g_glfb_d[l_ac].per1,g_glfb_d[l_ac].amt2,g_glfb_d[l_ac].per2,g_glfb_d[l_ac].glfb008, 
       g_glfb_d[l_ac].glfb010,g_glfb_d[l_ac].item,g_glfb_d[l_ac].item_desc,g_glfb_d[l_ac].line,g_glfb_d[l_ac].amt3, 
       g_glfb_d[l_ac].per3,g_glfb_d[l_ac].amt4,g_glfb_d[l_ac].per4,g_glfb_d[l_ac].account,g_glfb_d[l_ac].style 
 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
 
         EXIT FOREACH
      END IF
      
      #LET g_glfb_d[l_ac].statepic = cl_get_actipic(g_glfb_d[l_ac].statepic)
 
      
 
      #add-point:b_fill段資料填充 name="b_fill.fill"
      
      #end add-point
 
      CALL aglq810_detail_show("'1'")      
 
      CALL aglq810_glfb_t_mask()
 
      IF l_ac > g_max_rec THEN
         IF g_error_show = 1 THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "" 
            LET g_errparam.code = 9035 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
         END IF
         EXIT FOREACH
      END IF
      LET l_ac = l_ac + 1
      
   END FOREACH
   LET g_error_show = 0
   
 
   
   CALL g_glfb_d.deleteElement(g_glfb_d.getLength())   
 
   #add-point:陣列長度調整 name="b_fill.array_deleteElement"
   
   #end add-point
   
   #add-point:b_fill段資料填充(其他單身) name="b_fill.others.fill"
 
   #end add-point
 
   LET g_detail_cnt = g_glfb_d.getLength()
#  DISPLAY g_detail_cnt TO FORMONLY.h_count
   LET l_ac = g_cnt
   LET g_cnt = 0
   
   CLOSE b_fill_curs
   FREE aglq810_pb
 
   #調整單身index指標，避免翻頁後指到空白筆數
   CALL aglq810_detail_index_setting()
 
   #重新計算單身筆數並呈現
#  CALL aglq810_detail_action_trans()   #(ver:44) mark
 
   IF g_glfb_d.getLength() > 0 THEN
      LET l_ac = 1
      CALL aglq810_fetch()
   END IF
 
   CALL aglq810_detail_action_trans()   #(ver:44)
   
      CALL aglq810_filter_show('glfb002','b_glfb002')
   CALL aglq810_filter_show('glfbl004','b_glfbl004')
   CALL aglq810_filter_show('glfb003','b_glfb003')
   CALL aglq810_filter_show('glfb008','b_glfb008')
 
 
   #add-point:b_fill段結束前 name="b_fill.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="aglq810.fetch" >}
#+ 單身陣列填充2
PRIVATE FUNCTION aglq810_fetch()
   #add-point:fetch段define-客製 name="fetch.define_customerization"
   
   #end add-point
   DEFINE li_ac           LIKE type_t.num10
   #add-point:fetch段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="fetch.define"
   
   #end add-point
   
   #add-point:FUNCTION前置處理 name="fetch.before_function"
   
   #end add-point
 
 
   #add-point:陣列清空 name="fetch.array_clear"
   
   #end add-point
   
   LET li_ac = l_ac 
   
 
   
   #add-point:單身填充後 name="fetch.after_fill"
   
   #end add-point 
   
 
   #add-point:陣列筆數調整 name="fetch.array_deleteElement"
   
   #end add-point
 
   LET l_ac = li_ac
   
END FUNCTION
 
{</section>}
 
{<section id="aglq810.detail_show" >}
#+ 顯示相關資料
PRIVATE FUNCTION aglq810_detail_show(ps_page)
   #add-point:show段define-客製 name="detail_show.define_customerization"
   
   #end add-point
   DEFINE ps_page    STRING
   DEFINE ls_sql     STRING
   #add-point:show段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_show.define"
   
   #end add-point
 
   #add-point:detail_show段之前 name="detail_show.before"
   
   #end add-point
   
   
 
   #讀入ref值
   IF ps_page.getIndexOf("'1'",1) > 0 THEN
      #帶出公用欄位reference值page1
      
 
      #add-point:show段單身reference name="detail_show.body.reference"
 
      #end add-point
   END IF
   
 
 
   #add-point:detail_show段之後 name="detail_show.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="aglq810.filter" >}
#+ filter過濾功能
PRIVATE FUNCTION aglq810_filter()
   #add-point:filter段define-客製 name="filter.define_customerization"
   
   #end add-point
   DEFINE  ls_result   STRING
   #add-point:filter段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="filter.define"
   
   #end add-point
   
   #add-point:FUNCTION前置處理 name="filter.before_function"
   
   #end add-point
 
   LET l_ac = 1
   LET g_detail_idx = 1
   LET g_detail_idx2 = 1
 
   LET INT_FLAG = 0
 
   LET g_qryparam.state = 'c'
 
   LET g_wc_filter_t = g_wc_filter
   LET g_wc_t = g_wc
   
   CALL gfrm_curr.setFieldHidden("formonly.sel", TRUE)
   CALL gfrm_curr.setFieldHidden("formonly.statepic", TRUE)
 
   LET g_wc = cl_replace_str(g_wc, g_wc_filter, '')
 
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
      #單頭
      CONSTRUCT g_wc_filter ON glfb002,glfbl004,glfb003,glfb008
                          FROM s_detail1[1].b_glfb002,s_detail1[1].b_glfbl004,s_detail1[1].b_glfb003, 
                              s_detail1[1].b_glfb008
 
         BEFORE CONSTRUCT
                     DISPLAY aglq810_filter_parser('glfb002') TO s_detail1[1].b_glfb002
            DISPLAY aglq810_filter_parser('glfbl004') TO s_detail1[1].b_glfbl004
            DISPLAY aglq810_filter_parser('glfb003') TO s_detail1[1].b_glfb003
            DISPLAY aglq810_filter_parser('glfb008') TO s_detail1[1].b_glfb008
 
 
         #單身公用欄位開窗相關處理
         
           
         #單身一般欄位開窗相關處理
                  #----<<sel>>----
         #----<<b_glfb002>>----
         #Ctrlp:construct.c.filter.page1.b_glfb002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_glfb002
            #add-point:ON ACTION controlp INFIELD b_glfb002 name="construct.c.filter.page1.b_glfb002"
            
            #END add-point
 
 
         #----<<b_glfbl004>>----
         #Ctrlp:construct.c.filter.page1.b_glfbl004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_glfbl004
            #add-point:ON ACTION controlp INFIELD b_glfbl004 name="construct.c.filter.page1.b_glfbl004"
            
            #END add-point
 
 
         #----<<b_glfb003>>----
         #Ctrlp:construct.c.filter.page1.b_glfb003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_glfb003
            #add-point:ON ACTION controlp INFIELD b_glfb003 name="construct.c.filter.page1.b_glfb003"
            
            #END add-point
 
 
         #----<<amt1>>----
         #----<<per1>>----
         #----<<amt2>>----
         #----<<per2>>----
         #----<<b_glfb008>>----
         #Ctrlp:construct.c.filter.page1.b_glfb008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b_glfb008
            #add-point:ON ACTION controlp INFIELD b_glfb008 name="construct.c.filter.page1.b_glfb008"
            
            #END add-point
 
 
         #----<<glfb010>>----
         #----<<item>>----
         #----<<item_desc>>----
         #----<<line>>----
         #----<<amt3>>----
         #----<<per3>>----
         #----<<amt4>>----
         #----<<per4>>----
         #----<<account>>----
         #----<<style>>----
   
 
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
      LET g_wc_filter = g_wc_filter, " "
      LET g_wc_filter_t = g_wc_filter
   ELSE
      LET g_wc_filter = g_wc_filter_t
   END IF
   
      CALL aglq810_filter_show('glfb002','b_glfb002')
   CALL aglq810_filter_show('glfbl004','b_glfbl004')
   CALL aglq810_filter_show('glfb003','b_glfb003')
   CALL aglq810_filter_show('glfb008','b_glfb008')
 
    
   CALL aglq810_b_fill()
   
   CALL gfrm_curr.setFieldHidden("formonly.sel", FALSE)
   CALL gfrm_curr.setFieldHidden("formonly.statepic", FALSE)
 
END FUNCTION
 
{</section>}
 
{<section id="aglq810.filter_parser" >}
#+ filter欄位解析
PRIVATE FUNCTION aglq810_filter_parser(ps_field)
   #add-point:filter段define-客製 name="filter_parser.define_customerization"
   
   #end add-point
   DEFINE ps_field   STRING
   DEFINE ls_tmp     STRING
   DEFINE li_tmp     LIKE type_t.num5
   DEFINE li_tmp2    LIKE type_t.num5
   DEFINE ls_var     STRING
   #add-point:filter段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="filter_parser.define"
   
   #end add-point
 
   #add-point:FUNCTION前置處理 name="filter_parser.before_function"
   
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
 
{<section id="aglq810.filter_show" >}
#+ Browser標題欄位顯示搜尋條件
PRIVATE FUNCTION aglq810_filter_show(ps_field,ps_object)
   #add-point:filter_show段define-客製 name="filter_show.define_customerization"
   
   #end add-point
   DEFINE ps_field         STRING
   DEFINE ps_object        STRING
   DEFINE lnode_item       om.DomNode
   DEFINE ls_title         STRING
   DEFINE ls_name          STRING
   DEFINE ls_condition     STRING
   #add-point:filter_show段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="filter_show.define"
   
   #end add-point
 
   #add-point:FUNCTION前置處理 name="filter_show.before_function"
   
   #end add-point
 
   LET ls_name = "formonly.", ps_object
 
   LET lnode_item = gfrm_curr.findNode("TableColumn", ls_name)
   LET ls_title = lnode_item.getAttribute("text")
   IF ls_title.getIndexOf('※',1) > 0 THEN
      LEt ls_title = ls_title.subString(1,ls_title.getIndexOf('※',1)-1)
   END IF
 
   #顯示資料組合
   LET ls_condition = aglq810_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="aglq810.insert" >}
#+ insert
PRIVATE FUNCTION aglq810_insert()
   #add-point:insert段define-客製 name="insert.define_customerization"
   
   #end add-point
   #add-point:insert段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   
   #end add-point
 
   #add-point:insert段control name="insert.control"
   
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="aglq810.modify" >}
#+ modify
PRIVATE FUNCTION aglq810_modify()
   #add-point:modify段define-客製 name="modify.define_customerization"
   
   #end add-point
   #add-point:modify段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"
   
   #end add-point
 
   #add-point:modify段control name="modify.control"
   
   #end add-point 
END FUNCTION
 
{</section>}
 
{<section id="aglq810.reproduce" >}
#+ reproduce
PRIVATE FUNCTION aglq810_reproduce()
   #add-point:reproduce段define-客製 name="reproduce.define_customerization"
   
   #end add-point
   #add-point:reproduce段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   
   #end add-point
 
   #add-point:reproduce段control name="reproduce.control"
   
   #end add-point 
END FUNCTION
 
{</section>}
 
{<section id="aglq810.delete" >}
#+ delete
PRIVATE FUNCTION aglq810_delete()
   #add-point:delete段define-客製 name="delete.define_customerization"
   
   #end add-point
   #add-point:delete段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete.define"
   
   #end add-point
 
   #add-point:delete段control name="delete.control"
   
   #end add-point 
END FUNCTION
 
{</section>}
 
{<section id="aglq810.detail_action_trans" >}
#+ 單身分頁筆數顯示及action圖片顯示切換功能
PRIVATE FUNCTION aglq810_detail_action_trans()
   #add-point:detail_action_trans段define-客製 name="detail_action_trans.define_customerization"
   
   #end add-point
   #add-point:detail_action_trans段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_action_trans.define"
   
   #end add-point
 
   #add-point:FUNCTION前置處理 name="detail_action_trans.before_function"
   
   #end add-point
 
   #因應單身切頁功能，筆數計算方式調整
   #(ver:44) ---start---
   IF g_pagestart = 0 THEN
      LET g_pagestart = 1
   END IF
   #(ver:44) --- end ---
   LET g_current_row_tot = g_pagestart + g_detail_idx - 1
   #(ver:44) ---modify start---
   IF g_tot_cnt > 0 THEN
      DISPLAY g_current_row_tot TO FORMONLY.h_index
      DISPLAY g_glfb_d.getLength() TO FORMONLY.h_count
   ELSE
      IF g_glfb_d.getLength() > 0 THEN
         DISPLAY g_current_row_tot TO FORMONLY.h_index
         DISPLAY g_tot_cnt TO FORMONLY.h_count
      ELSE
         DISPLAY '' TO FORMONLY.h_index
         DISPLAY '' TO FORMONLY.h_count
      END IF
   END IF
 
 
   #(ver:44) --- modify end ---
 
   #顯示單身頁面的起始與結束筆數
   LET g_page_start_num = g_pagestart
   LET g_page_end_num = g_pagestart + g_num_in_page - 1
   DISPLAY g_page_start_num TO FORMONLY.p_start
   DISPLAY g_page_end_num TO FORMONLY.p_end
 
   #目前不支援跳頁功能
   LET g_page_act_list = "detail_first,detail_previous,'',detail_next,detail_last"
   CALL cl_navigator_detail_page_setting(g_page_act_list,g_current_row_tot,g_pagestart,g_num_in_page,g_tot_cnt)
 
END FUNCTION
 
{</section>}
 
{<section id="aglq810.detail_index_setting" >}
#+ 單身切頁後，index重新調整，避免翻頁後指到空白筆數
PRIVATE FUNCTION aglq810_detail_index_setting()
   #add-point:detail_index_setting段define-客製 name="deatil_index_setting.define_customerization"
   
   #end add-point
   DEFINE li_redirect     BOOLEAN
   DEFINE ldig_curr       ui.Dialog
   #add-point:detail_index_setting段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_index_setting.define"
   
   #end add-point
 
   #add-point:FUNCTION前置處理 name="detail_index_setting.before_function"
   
   #end add-point
 
   IF g_curr_diag IS NOT NULL THEN
      CASE
         WHEN g_curr_diag.getCurrentRow("s_detail1") <= "0"
            LET g_detail_idx = 1
            IF g_glfb_d.getLength() > 0 THEN
               LET li_redirect = TRUE
            END IF
         WHEN g_curr_diag.getCurrentRow("s_detail1") > g_glfb_d.getLength() AND g_glfb_d.getLength() > 0
            LET g_detail_idx = g_glfb_d.getLength()
            LET li_redirect = TRUE
         WHEN g_curr_diag.getCurrentRow("s_detail1") != g_detail_idx
            IF g_detail_idx > g_glfb_d.getLength() THEN
               LET g_detail_idx = g_glfb_d.getLength()
            END IF
            LET li_redirect = TRUE
      END CASE
   END IF
 
   IF li_redirect THEN
      LET ldig_curr = ui.Dialog.getCurrent()
      CALL ldig_curr.setCurrentRow("s_detail1", g_detail_idx)
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="aglq810.mask_functions" >}
 &include "erp/agl/aglq810_mask.4gl"
 
{</section>}
 
{<section id="aglq810.other_function" readonly="Y" >}

################################################################################
# Descriptions...: 建立臨時表
# Memo...........:
# Usage..........: CALL aglq810_create_temp_table()
# Date & Author..: 2014/05/18 By 02599
# Modify.........:
################################################################################
PRIVATE FUNCTION aglq810_create_temp_table()
   DROP TABLE aglq810_tmp;
   CREATE TEMP TABLE aglq810_tmp(
   glfbent        LIKE glfb_t.glfbent,
   glfb001        LIKE glfb_t.glfb001,
   glfbseq        LIKE glfb_t.glfbseq,
   glfb002        LIKE glfb_t.glfb002,
   glfbl004       LIKE glfbl_t.glfbl004,
   glfb003        LIKE glfb_t.glfb003,
   amt1           LIKE type_t.num20_6,
   per1           LIKE type_t.num20_6,
   amt2           LIKE type_t.num20_6,
   per2           LIKE type_t.num20_6,
   glfb008        LIKE glfb_t.glfb008,
   glfb010        LIKE glfb_t.glfb010,
   item_desc      LIKE glfbl_t.glfbl004,
   line           LIKE glfb_t.glfb003,
   amt3           LIKE type_t.num20_6,
   amt4           LIKE type_t.num20_6,
   per3           LIKE type_t.num20_6,
   per4           LIKE type_t.num20_6,
   account        LIKE glfb_t.glfb008,
   style          LIKE glfb_t.glfb010
   );
   DROP TABLE aglq810_tmp_1;
   CREATE TEMP TABLE aglq810_tmp_1(
   type           LIKE type_t.chr1,
   glfbseq        LIKE glfb_t.glfbseq,
   glfbseq1       LIKE glfb_t.glfbseq1,
   glfb002        LIKE glfb_t.glfb002,
   glfbl004       LIKE glfbl_t.glfbl004,
   glfb003        LIKE glfb_t.glfb003,
   amt1           LIKE type_t.num20_6,
   amt2           LIKE type_t.num20_6,
   glfb008        LIKE glfb_t.glfb008,
   glfb010        LIKE glfb_t.glfb010
   );
END FUNCTION

################################################################################
# Descriptions...: 填充單身
# Memo...........:
# Usage..........: CALL aglq810_b_fill1()
# Date & Author..: 2014/5/18 By 02599
# Modify.........:
################################################################################
PRIVATE FUNCTION aglq810_b_fill1()
   DEFINE l_glfbseq       LIKE glfb_t.glfbseq
   DEFINE l_format        STRING
   DEFINE l_str           STRING
   DEFINE l_i             LIKE type_t.num5
   DEFINE l_amt1_fm       LIKE type_t.num20_6
   DEFINE l_amt2_fm       LIKE type_t.num20_6
   DEFINE l_glfbseq1      LIKE glfb_t.glfbseq1
   DEFINE l_type          LIKE type_t.chr1
   DEFINE l_sql           STRING
   
   CALL g_glfb_d.clear()
   #資產
   LET g_sql = "SELECT UNIQUE glfbseq,glfb002,glfbl004,glfb003,amt1,amt2,glfb008,glfb010",
               "  FROM aglq810_tmp_1 ",
               " WHERE type='1' ",
               " AND ",g_wc_filter, #160302-00006#1 2016/03/02 By 07675
              #" ORDER BY glfbseq"   #150910 mark
               " ORDER BY glfb003"   #150910                
  
   PREPARE aglq810_pb1 FROM g_sql
   DECLARE b_fill_curs1 CURSOR FOR aglq810_pb1
   #負債
   LET g_sql = "SELECT UNIQUE glfbseq,glfb002,glfbl004,glfb003,amt1,amt2,glfb008,glfb010",
               "  FROM aglq810_tmp_1 ",
               " WHERE type='2' ",
               " AND ",g_wc_filter, #160302-00006#1 2016/03/02 By 07675
              #" ORDER BY glfbseq"   #150910 mark
               " ORDER BY glfb003"   #150910                
  
   PREPARE aglq810_pb2 FROM g_sql
   DECLARE b_fill_curs2 CURSOR FOR aglq810_pb2
 
   #150827-00036#12--add--str--
   #显示比率
   IF tm.show_per = 'Y' THEN
      LET l_glfbseq = ''
      LET l_sql = "SELECT glfbseq,glfbseq1 FROM glfb_t",
                  " WHERE glfbent=",g_enterprise," AND glfb001='",tm.glfa001,"' AND glfb009='Y'"
      DECLARE aglq810_sel_pr CURSOR FROM l_sql
      OPEN aglq810_sel_pr
      FETCH aglq810_sel_pr INTO l_glfbseq,l_glfbseq1
      CLOSE aglq810_sel_pr
      IF cl_null(l_glfbseq) THEN 
         LET l_amt1_fm = 0
         LET l_amt2_fm = 0
      ELSE
         IF l_glfbseq1='A' OR l_glfbseq1='B' THEN
            LET l_type='1'
         ELSE
            LET l_type='2'
         END IF
         SELECT amt1,amt2 INTO l_amt1_fm,l_amt2_fm FROM aglq810_tmp_1 WHERE glfbseq=l_glfbseq AND type=l_type
         IF cl_null(l_amt1_fm) THEN LET l_amt1_fm = 0 END IF
         IF cl_null(l_amt2_fm) THEN LET l_amt2_fm = 0 END IF
      END IF
      
   END IF
   #150827-00036#12--add--end
 
   LET g_cnt = l_ac
   LET l_ac = 1   
   ERROR "Searching!" 
   #資產
   FOREACH b_fill_curs1 INTO l_glfbseq,g_glfb_d[l_ac].glfb002,g_glfb_d[l_ac].glfbl004,g_glfb_d[l_ac].glfb003, 
                             g_glfb_d[l_ac].amt1,g_glfb_d[l_ac].amt2,g_glfb_d[l_ac].glfb008,g_glfb_d[l_ac].glfb010
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
      
      LET g_glfb_d[l_ac].sel = "N"   
      
      #150827-00036#12--add--str--
      #显示比率
      IF tm.show_per = 'Y' THEN
         IF NOT cl_null(g_glfb_d[l_ac].amt1) THEN
            IF l_amt1_fm = 0 THEN
               LET g_glfb_d[l_ac].per1 = 0
            ELSE
               LET g_glfb_d[l_ac].per1 = g_glfb_d[l_ac].amt1 / l_amt1_fm * 100
            END IF
         END IF
         IF NOT cl_null(g_glfb_d[l_ac].amt2) THEN
            IF l_amt2_fm = 0 THEN
               LET g_glfb_d[l_ac].per2 = 0
            ELSE
               LET g_glfb_d[l_ac].per2 = g_glfb_d[l_ac].amt2 / l_amt2_fm * 100
            END IF
         END IF
      END IF
      #150827-00036#12--add--end
   
      LET l_ac = l_ac + 1
      IF l_ac > g_max_rec THEN
         IF g_error_show = 1 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code =  9035
            LET g_errparam.extend =  ""
            LET g_errparam.popup = TRUE
            CALL cl_err()

         END IF
         EXIT FOREACH
      END IF
      
   END FOREACH
   #負債
   LET l_ac=1
   FOREACH b_fill_curs2 INTO l_glfbseq,g_glfb_d[l_ac].item,g_glfb_d[l_ac].item_desc,g_glfb_d[l_ac].line,
                             g_glfb_d[l_ac].amt3,g_glfb_d[l_ac].amt4,g_glfb_d[l_ac].account,g_glfb_d[l_ac].style
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF      
 
      #150827-00036#12--add--str--
      #显示比率
      IF tm.show_per = 'Y' THEN
         IF NOT cl_null(g_glfb_d[l_ac].amt3) THEN
            IF l_amt1_fm = 0 THEN
               LET g_glfb_d[l_ac].per3 = 0
            ELSE
               LET g_glfb_d[l_ac].per3 = g_glfb_d[l_ac].amt3 / l_amt1_fm * 100
            END IF
         END IF
         IF NOT cl_null(g_glfb_d[l_ac].amt4) THEN
            IF l_amt2_fm = 0 THEN
               LET g_glfb_d[l_ac].per4 = 0
            ELSE
               LET g_glfb_d[l_ac].per4 = g_glfb_d[l_ac].amt4 / l_amt2_fm * 100
            END IF
         END IF
      END IF
      #150827-00036#12--add--end
      
      LET l_ac = l_ac + 1
      IF l_ac > g_max_rec THEN
         IF g_error_show = 1 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code =  9035
            LET g_errparam.extend =  ""
            LET g_errparam.popup = TRUE
            CALL cl_err()

         END IF
         EXIT FOREACH
      END IF
      
   END FOREACH
   LET g_error_show = 0
   
   CALL g_glfb_d.deleteElement(g_glfb_d.getLength())   
       
   LET g_detail_cnt = g_glfb_d.getLength() 
   DISPLAY g_detail_cnt TO FORMONLY.h_count
   LET l_ac = g_cnt
   LET g_cnt = 0
   
   #設置單身金額欄位格式
   LET l_format = "---,---,---,--&"
   LET l_str = ""
   FOR l_i=1 TO tm.glfa009
       LET l_str = l_str,"&"
   END FOR
   IF NOT cl_null(l_str) THEN
      LET l_format = l_format,'.',l_str
   END IF
   CALL cl_set_comp_format("amt1,amt2,amt3,amt4,per1,per2,per3,per4",l_format)
   
   LET l_ac = 1
   CALL aglq810_fetch()
   
   CALL aglq810_filter_show('glfb002','b_glfb002')
   CALL aglq810_filter_show('glfbl004','b_glfbl004')
   CALL aglq810_filter_show('glfb003','b_glfb003')
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL aglq810_get_data()
# Date & Author..: 2014/5/18 By 02599
# Modify.........:
################################################################################
PRIVATE FUNCTION aglq810_get_data()
   DEFINE l_sql                STRING
   DEFINE l_glfbseq            LIKE glfb_t.glfbseq
   DEFINE l_glfbseq1           LIKE glfb_t.glfbseq1
   DEFINE l_glfb002            LIKE glfb_t.glfb002
   DEFINE l_glfbl004           LIKE glfbl_t.glfbl004
   DEFINE l_glfb003            LIKE glfb_t.glfb003
   DEFINE l_success            LIKE type_t.num5
   DEFINE l_amt1               LIKE type_t.num20_6
   DEFINE l_amt2               LIKE type_t.num20_6
   DEFINE l_glfaent            LIKE glfa_t.glfaent
   DEFINE l_glfa008            LIKE glfa_t.glfa008
   DEFINE l_glfbent            LIKE glfb_t.glfbent
   DEFINE l_item_desc          LIKE glfbl_t.glfbl004
   DEFINE l_line               LIKE glfb_t.glfb003
   DEFINE l_amt3               LIKE type_t.num20_6
   DEFINE l_amt4               LIKE type_t.num20_6
   DEFINE l_array              DYNAMIC ARRAY OF RECORD
          l_item_desc_1        LIKE glfbl_t.glfbl004,
          l_line_1             LIKE glfb_t.glfb003,
          l_amt3_1             LIKE type_t.num20_6,
          l_amt4_1             LIKE type_t.num20_6
   END RECORD
   DEFINE i                    INTEGER
   DEFINE l_glfb008            LIKE glfb_t.glfb008
   DEFINE l_glfb010            LIKE glfb_t.glfb010
   
   #刪除臨時表中資料
   DELETE FROM aglq810_tmp_1
   LET l_sql="SELECT DISTINCT glfbseq,glfb002,glfbl004,glfb003,glfb008,glfb010 ",
             "  FROM glfb_t ",
             "  LEFT JOIN glfbl_t ON glfbent=glfblent AND glfb001 = glfbl001 AND glfbseq = glfblseq AND glfb002 = glfbl002 AND glfbl003 = '",g_lang,"' ",
             " WHERE glfbent=",g_enterprise," AND glfb001='",tm.glfa001,"'"         
       
   #資產
   LET g_sql=l_sql," AND glfbseq1 IN ('A','B')  AND ",g_wc_table,
                   " ORDER BY glfbseq"
   PREPARE aglq810_pr1 FROM g_sql
   DECLARE aglq810_cs1 CURSOR FOR aglq810_pr1   
   #負債
   LET g_sql=l_sql," AND glfbseq1 IN ('C','D')  AND ",g_wc_table1,
                   " ORDER BY glfbseq"
   PREPARE aglq810_pr2 FROM g_sql
   DECLARE aglq810_cs2 CURSOR FOR aglq810_pr2
   
   CALL cl_err_collect_init()
   LET l_success = TRUE

   #負債
   FOREACH aglq810_cs2 INTO l_glfbseq,l_glfb002,l_glfbl004,l_glfb003,l_glfb008,l_glfb010
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = 'FOREACH aglq810_cs2'
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET l_success = FALSE
         EXIT FOREACH
      END IF
      #年初數
      LET l_glfbseq1='C'
      CALL aglq810_get_amt(l_glfbseq,l_glfbseq1) RETURNING l_amt1
      #期末數
      LET l_glfbseq1='D'
      CALL aglq810_get_amt(l_glfbseq,l_glfbseq1) RETURNING l_amt2
      
      #150827-00036#1--add--str--
      #是否進行幣別轉換
      IF tm.chg_curr='Y' AND tm.curr<>g_glaa001 THEN
         LET l_amt1 = l_amt1 * tm.rate
         LET l_amt2 = l_amt2 * tm.rate
      END IF
      #150827-00036#1--add--end
      
      INSERT INTO aglq810_tmp_1(type,glfbseq,glfbseq1,glfb002,glfbl004,glfb003,amt1,amt2,glfb008,glfb010)
      VALUES('2',l_glfbseq,l_glfbseq1,l_glfb002,l_glfbl004,l_glfb003,l_amt1,l_amt2,l_glfb008,l_glfb010)
     
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = 'insert aglq810_tmp_1'
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET l_success = FALSE
      END IF 
   END FOREACH
 
   #資產
   FOREACH aglq810_cs1 INTO l_glfbseq,l_glfb002,l_glfbl004,l_glfb003,l_glfb008,l_glfb010
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = 'FOREACH aglq810_cs1'
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET l_success = FALSE
         EXIT FOREACH
      END IF
      
      #年初數
      LET l_glfbseq1='A'
      CALL aglq810_get_amt(l_glfbseq,l_glfbseq1) RETURNING l_amt1
      #期末數
      LET l_glfbseq1='B'
      CALL aglq810_get_amt(l_glfbseq,l_glfbseq1) RETURNING l_amt2
      
      #150827-00036#1--add--str--
      #是否進行幣別轉換
      IF tm.chg_curr='Y' AND tm.curr<>g_glaa001 THEN
         LET l_amt1 = l_amt1 * tm.rate
         LET l_amt2 = l_amt2 * tm.rate
      END IF
      #150827-00036#1--add--end
      
      INSERT INTO aglq810_tmp_1(type,glfbseq,glfbseq1,glfb002,glfbl004,glfb003,amt1,amt2,glfb008,glfb010)
      VALUES('1',l_glfbseq,l_glfbseq1,l_glfb002,l_glfbl004,l_glfb003,l_amt1,l_amt2,l_glfb008,l_glfb010)
      
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = 'insert aglq810_tmp_1'
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET l_success = FALSE
      END IF 
   END FOREACH
   CALL cl_err_collect_show()
   IF l_success = FALSE THEN
      DELETE FROM aglq810_tmp_1
   END IF
END FUNCTION

################################################################################
# Descriptions...: 抓取帳套說明
# Memo...........:
# Usage..........: CALL aglq810_glfa005_desc(p_glfa005)
#                  RETURNING r_desc
# Input parameter: p_glfb005      帳套編號
# Return code....: r_desc         說明
# Date & Author..: 2014/5/18 By 02599
# Modify.........:
################################################################################
PRIVATE FUNCTION aglq810_glfa005_desc(p_glfa005)
   DEFINE p_glfa005             LIKE glfa_t.glfa005
   DEFINE r_desc                LIKE glaal_t.glaal002
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = p_glfa005
   CALL ap_ref_array2(g_ref_fields,"SELECT glaal002 FROM glaal_t WHERE glaalent='"||g_enterprise||"' AND glaalld=? AND glaal001='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET r_desc = '', g_rtn_fields[1] , ''
   RETURN r_desc
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL aglq810_get_amt(p_glfbseq,p_glfbseq1)
#                  RETURNING r_amt
# Input parameter: p_glfbseq      取數公式來源
#                : p_glfbseq1     數值取數公式
# Return code....: r_amt          金額
# Date & Author..: 2014/5/18 By 02599
# Modify.........:
################################################################################
PRIVATE FUNCTION aglq810_get_amt(p_glfbseq,p_glfbseq1)
   DEFINE p_glfbseq          LIKE glfb_t.glfbseq
   DEFINE p_glfbseq1         LIKE glfb_t.glfbseq1
   DEFINE r_amt              LIKE type_t.num20_6
   DEFINE l_glfb004         LIKE glfb_t.glfb004
   DEFINE l_glfb005         LIKE glfb_t.glfb005
   DEFINE l_glfa007         LIKE glfa_t.glfa007
   DEFINE l_success         LIKE type_t.num5
   DEFINE l_glfa006         LIKE glfa_t.glfa006     #170623-00034#6
   DEFINE l_glav006         LIKE glav_t.glav006     #170623-00034#6
   
   SELECT glfb004,glfb005 INTO l_glfb004,l_glfb005 
     FROM glfb_t
    WHERE glfbent=g_enterprise AND glfb001=tm.glfa001
      AND glfbseq=p_glfbseq AND glfbseq1=p_glfbseq1
   IF NOT cl_null(l_glfb005) THEN
     #IF p_glfbseq1='A' OR p_glfbseq1='C' THEN     #170418-00002#1 mark
     #IF (p_glfbseq1='A' OR p_glfbseq1='C') AND g_prog != 'aglq937' THEN    #170418-00002#1 add  #170623-00034#6 mark
      #170623-00034#6---add---start---
      IF p_glfbseq1='A' OR p_glfbseq1='C' THEN
         IF g_prog MATCHES 'aglq937*' THEN      
            #年初數抓上一年度的最大期別
            LET l_glfa006 = tm.glfa006 -1
            SELECT MAX(glav006) INTO l_glav006
              FROM glav_t
             WHERE glavent = g_enterprise
               AND glav001 = (SELECT glaa003 FROM glaa_t WHERE glaaent = g_enterprise AND glaald = tm.glfa005)
               AND glav002 = l_glfa006
         ELSE
      #170623-00034#6---add---end---
            LET l_glfa007=0
         END IF      #170623-00034#6 add
      ELSE
         #170623-00034#6---add---start---
         IF g_prog MATCHES 'aglq937*' THEN
            CALL s_merge_get_glav006(g_glaa003,tm.glfa006,g_glaa138,g_mme) 
            RETURNING g_sub_success,g_errno,g_mme
            LET l_glfa007=g_mme
         ELSE
         #170623-00034#6---add---end---
            LET l_glfa007=tm.glfa007
         END IF      #170623-00034#6 add 
      END IF
      #IF g_prog  = 'aglq937' THEN        #160705-00042#11 160714 by sakura mark
      #IF g_prog  MATCHES 'aglq937' THEN  #160705-00042#11 160714 by sakura add #170301-00017#3 mark
      IF g_prog  MATCHES 'aglq937*' THEN  #170301-00017#3  09276 add
         #170623-00034#6---add---start---
         IF p_glfbseq1='A' OR p_glfbseq1='C' THEN         #年初數
                              #帳別      #年度      #起始期別 #截止期別  #小數位數   #單位      #報表模板編號       
            CALL s_analy_form(tm.glfa005,l_glfa006,l_glav006,l_glav006,tm.glfa009,tm.glfa008,tm.glfa001,
                              #取數公式來源  #計算公式    #含審計調整傳票否  #傳票狀態 #含月结传票否 #含年结传票否
                              l_glfb004,    l_glfb005,'','',tm.multicurr,tm.show_ce,tm.show_ye)
            RETURNING l_success,r_amt
         ELSE
         #170623-00034#6---add---end--       #期末數
                            #帳別      #年度       #起始期別  #截止期別 #小數位數   #單位      #報表模板編號       
            CALL s_analy_form(tm.glfa005,tm.glfa006,l_glfa007,l_glfa007,tm.glfa009,tm.glfa008,tm.glfa001,
                              #取數公式來源  #計算公式    #含審計調整傳票否  #傳票狀態 #含月结传票否 #含年结传票否
                              #l_glfb004,    l_glfb005,'','',tm.multicurr)   ##140314-00001#73   #170222-00003#2 mark
                              l_glfb004,    l_glfb005,'','',tm.multicurr,tm.show_ce,tm.show_ye)  #170222-00003#2 add
            RETURNING l_success,r_amt
         END IF                #170623-00034#6 add      
      ELSE
                           #帳別      #年度       #起始期別  #截止期別 #小數位數   #單位      #報表模板編號       
         CALL s_analy_form(tm.glfa005,tm.glfa006,l_glfa007,l_glfa007,tm.glfa009,tm.glfa008,tm.glfa001,
                           #取數公式來源  #計算公式    #含審計調整傳票否  #傳票狀態 #含月结传票否 #含年结传票否
                           #l_glfb004,    l_glfb005,'',tm.show_ad,      tm.stus)   #150827-00036#1 add ‘show_ad,stus’ #170222-00003#2 mark
                           l_glfb004,    l_glfb005,'',tm.show_ad,      tm.stus,tm.show_ce,tm.show_ye)  #170222-00003#2 add    
         RETURNING l_success,r_amt
      END IF
   ELSE
      LET r_amt=' '
   END IF 
   RETURN r_amt
END FUNCTION

################################################################################
# Descriptions...: 打印
# Memo...........:
# Usage..........: CALL aglq810_output()
# Input parameter: 
# Return code....: 
# Date & Author..: 2015/09/07 By 02599
# Modify.........:
################################################################################
PRIVATE FUNCTION aglq810_output()
   DEFINE l_i      LIKE type_t.num5
   DELETE FROM aglq810_tmp
   FOR l_i = 1 TO g_glfb_d.getLength()
      INSERT INTO aglq810_tmp(glfbent,glfb001,glfbseq,glfb002,glfbl004,glfb003,amt1,per1,amt2,per2,glfb008,   #151001-00011#2 150106 by sakura add per1,per2
                              glfb010,item_desc,line,amt3,amt4,per3,per4,account,style)                       #151001-00011#2 150106 by sakura add per3,per4 #150827-00036#12 add 'glfb010,style'
      VALUES(g_enterprise,tm.glfa001,l_i,g_glfb_d[l_i].glfb002,g_glfb_d[l_i].glfbl004,g_glfb_d[l_i].glfb003, 
             g_glfb_d[l_i].amt1,g_glfb_d[l_i].per1,g_glfb_d[l_i].amt2,g_glfb_d[l_i].per2,g_glfb_d[l_i].glfb008,   #151001-00011#2 150106 by sakura add per1,per2
             g_glfb_d[l_i].glfb010,g_glfb_d[l_i].item_desc,g_glfb_d[l_i].line,    #150827-00036#12 add 'glfb010'
             g_glfb_d[l_i].amt3,g_glfb_d[l_i].amt4,g_glfb_d[l_i].per3,g_glfb_d[l_i].per4,g_glfb_d[l_i].account,   #151001-00011#2 150106 by sakura add per3,per4
             g_glfb_d[l_i].style)  #150827-00036#12 add 'style'
   END FOR
   CALL aglq810_g01('1=1','aglq810_tmp',tm.glfa006,tm.glfa007,tm.glfa005,tm.glfa001,tm.glfa008,tm.glfa009,tm.show_xrbl,tm.show_per)   #151001-00011#2 150106 by sakura add show_per   
END FUNCTION

 
{</section>}
 
